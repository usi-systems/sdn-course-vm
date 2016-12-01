header_type ethernet_t {
    fields {
        dl_dst : 48;
        dl_src : 48;
        dl_type : 16;
    }
}

header_type easyroute_head_t {
    fields {
        num_valid: 32;
    }
}


header_type easyroute_port_t {
    fields {
        port: 8;
    }
}

header ethernet_t eth;
header easyroute_head_t easyroute_head;
header easyroute_port_t easyroute_port;

parser start {
    return parse_ethernet;
}

#define EASYROUTE 0x6900
parser parse_ethernet {
    extract(eth);
    return select(latest.dl_type) {
    	EASYROUTE : parse_head;
    	default : ingress;
    }
}

parser parse_head {
    extract(easyroute_head);
    return select(latest.num_valid) {
        0: ingress;
        default: parse_port;
    }
}

parser parse_port {
    extract(easyroute_port);
    return ingress;
}

action _drop() {
    drop();
}

action route() {
    modify_field(standard_metadata.egress_spec, easyroute_port.port);
    add_to_field(easyroute_head.num_valid, -1);
    remove_header(easyroute_port);
}

table route_pkt {
    reads {
        easyroute_port: valid;
    }
    actions {
        _drop;
        route;
    }
    size: 1;
}

control ingress {
    apply(route_pkt);
}

control egress {
    // leave empty
}
