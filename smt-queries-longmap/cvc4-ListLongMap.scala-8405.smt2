; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102250 () Bool)

(assert start!102250)

(declare-fun b!1230663 () Bool)

(declare-fun res!819129 () Bool)

(declare-fun e!698231 () Bool)

(assert (=> b!1230663 (=> (not res!819129) (not e!698231))))

(declare-datatypes ((array!79392 0))(
  ( (array!79393 (arr!38314 (Array (_ BitVec 32) (_ BitVec 64))) (size!38850 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79392)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230663 (= res!819129 (validKeyInArray!0 (select (arr!38314 a!3806) from!3184)))))

(declare-fun b!1230664 () Bool)

(declare-fun res!819133 () Bool)

(assert (=> b!1230664 (=> (not res!819133) (not e!698231))))

(declare-datatypes ((List!27087 0))(
  ( (Nil!27084) (Cons!27083 (h!28292 (_ BitVec 64)) (t!40550 List!27087)) )
))
(declare-fun acc!823 () List!27087)

(declare-fun arrayNoDuplicates!0 (array!79392 (_ BitVec 32) List!27087) Bool)

(assert (=> b!1230664 (= res!819133 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230665 () Bool)

(assert (=> b!1230665 (= e!698231 (not true))))

(assert (=> b!1230665 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27083 (select (arr!38314 a!3806) from!3184) acc!823))))

(declare-fun res!819132 () Bool)

(assert (=> start!102250 (=> (not res!819132) (not e!698231))))

(assert (=> start!102250 (= res!819132 (bvslt (size!38850 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102250 e!698231))

(declare-fun array_inv!29162 (array!79392) Bool)

(assert (=> start!102250 (array_inv!29162 a!3806)))

(assert (=> start!102250 true))

(declare-fun b!1230666 () Bool)

(declare-fun res!819130 () Bool)

(assert (=> b!1230666 (=> (not res!819130) (not e!698231))))

(declare-fun contains!7149 (List!27087 (_ BitVec 64)) Bool)

(assert (=> b!1230666 (= res!819130 (not (contains!7149 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230667 () Bool)

(declare-fun res!819128 () Bool)

(assert (=> b!1230667 (=> (not res!819128) (not e!698231))))

(declare-fun noDuplicate!1746 (List!27087) Bool)

(assert (=> b!1230667 (= res!819128 (noDuplicate!1746 acc!823))))

(declare-fun b!1230668 () Bool)

(declare-fun res!819131 () Bool)

(assert (=> b!1230668 (=> (not res!819131) (not e!698231))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230668 (= res!819131 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230669 () Bool)

(declare-fun res!819125 () Bool)

(assert (=> b!1230669 (=> (not res!819125) (not e!698231))))

(assert (=> b!1230669 (= res!819125 (validKeyInArray!0 k!2913))))

(declare-fun b!1230670 () Bool)

(declare-fun res!819127 () Bool)

(assert (=> b!1230670 (=> (not res!819127) (not e!698231))))

(assert (=> b!1230670 (= res!819127 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38850 a!3806)) (bvslt from!3184 (size!38850 a!3806))))))

(declare-fun b!1230671 () Bool)

(declare-fun res!819126 () Bool)

(assert (=> b!1230671 (=> (not res!819126) (not e!698231))))

(assert (=> b!1230671 (= res!819126 (not (contains!7149 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102250 res!819132) b!1230669))

(assert (= (and b!1230669 res!819125) b!1230670))

(assert (= (and b!1230670 res!819127) b!1230667))

(assert (= (and b!1230667 res!819128) b!1230666))

(assert (= (and b!1230666 res!819130) b!1230671))

(assert (= (and b!1230671 res!819126) b!1230668))

(assert (= (and b!1230668 res!819131) b!1230664))

(assert (= (and b!1230664 res!819133) b!1230663))

(assert (= (and b!1230663 res!819129) b!1230665))

(declare-fun m!1135007 () Bool)

(assert (=> b!1230664 m!1135007))

(declare-fun m!1135009 () Bool)

(assert (=> b!1230668 m!1135009))

(declare-fun m!1135011 () Bool)

(assert (=> b!1230663 m!1135011))

(assert (=> b!1230663 m!1135011))

(declare-fun m!1135013 () Bool)

(assert (=> b!1230663 m!1135013))

(declare-fun m!1135015 () Bool)

(assert (=> b!1230666 m!1135015))

(assert (=> b!1230665 m!1135011))

(declare-fun m!1135017 () Bool)

(assert (=> b!1230665 m!1135017))

(declare-fun m!1135019 () Bool)

(assert (=> b!1230671 m!1135019))

(declare-fun m!1135021 () Bool)

(assert (=> b!1230667 m!1135021))

(declare-fun m!1135023 () Bool)

(assert (=> b!1230669 m!1135023))

(declare-fun m!1135025 () Bool)

(assert (=> start!102250 m!1135025))

(push 1)

(assert (not b!1230666))

(assert (not start!102250))

(assert (not b!1230663))

(assert (not b!1230671))

(assert (not b!1230667))

(assert (not b!1230664))

(assert (not b!1230669))

(assert (not b!1230665))

(assert (not b!1230668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

