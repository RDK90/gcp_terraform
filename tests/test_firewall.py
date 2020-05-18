import unittest
import tftest

class TestFirewalls(unittest.TestCase):

    def setUp(self):
        tags = "[\"test-tags\"]"
        source_ranges = "[\"0.0.0.0/0\"]"
        self.setup_variables = {
            "port_type":"tcp",
            "image_port":"80",
            "tags":tags,
            "network":"test-network",
            "project_id":"project-id",
            "source_ranges":source_ranges
        }
        tf = tftest.TerraformTest('./modules/firewall/allow')
        tf.init()
        self.plan = tf.plan(tf_vars=self.setup_variables, output=True)
        self.vars = self.plan.variables 

    def test_allow_firewall_rule_module(self):
        module = self.plan.root_module
        resource = module.resources['google_compute_firewall.allow_firewall_rule']
        assert resource['type'] == "google_compute_firewall"

    def test_allow_firewall_rule_name(self):
        port_type = self.vars['port_type']
        port_value = self.vars['image_port']
        rule_name = "allow-{}-{}".format(port_type, port_value)
        module = self.plan.root_module
        resource = module.resources['google_compute_firewall.allow_firewall_rule']
        assert resource['values']['name'] == rule_name

