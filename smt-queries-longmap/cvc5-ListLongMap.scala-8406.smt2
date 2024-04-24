; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102496 () Bool)

(assert start!102496)

(declare-fun b!1232072 () Bool)

(declare-fun res!819749 () Bool)

(declare-fun e!699116 () Bool)

(assert (=> b!1232072 (=> (not res!819749) (not e!699116))))

(declare-datatypes ((array!79434 0))(
  ( (array!79435 (arr!38329 (Array (_ BitVec 32) (_ BitVec 64))) (size!38866 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79434)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232072 (= res!819749 (validKeyInArray!0 (select (arr!38329 a!3806) from!3184)))))

(declare-fun b!1232073 () Bool)

(declare-fun res!819747 () Bool)

(assert (=> b!1232073 (=> (not res!819747) (not e!699116))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1232073 (= res!819747 (validKeyInArray!0 k!2913))))

(declare-fun b!1232074 () Bool)

(assert (=> b!1232074 (= e!699116 (not true))))

(declare-datatypes ((List!27115 0))(
  ( (Nil!27112) (Cons!27111 (h!28329 (_ BitVec 64)) (t!40570 List!27115)) )
))
(declare-fun acc!823 () List!27115)

(declare-fun arrayNoDuplicates!0 (array!79434 (_ BitVec 32) List!27115) Bool)

(assert (=> b!1232074 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27111 (select (arr!38329 a!3806) from!3184) acc!823))))

(declare-fun res!819745 () Bool)

(assert (=> start!102496 (=> (not res!819745) (not e!699116))))

(assert (=> start!102496 (= res!819745 (bvslt (size!38866 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102496 e!699116))

(declare-fun array_inv!29267 (array!79434) Bool)

(assert (=> start!102496 (array_inv!29267 a!3806)))

(assert (=> start!102496 true))

(declare-fun b!1232075 () Bool)

(declare-fun res!819748 () Bool)

(assert (=> b!1232075 (=> (not res!819748) (not e!699116))))

(assert (=> b!1232075 (= res!819748 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38866 a!3806)) (bvslt from!3184 (size!38866 a!3806))))))

(declare-fun b!1232076 () Bool)

(declare-fun res!819742 () Bool)

(assert (=> b!1232076 (=> (not res!819742) (not e!699116))))

(declare-fun contains!7186 (List!27115 (_ BitVec 64)) Bool)

(assert (=> b!1232076 (= res!819742 (not (contains!7186 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232077 () Bool)

(declare-fun res!819746 () Bool)

(assert (=> b!1232077 (=> (not res!819746) (not e!699116))))

(declare-fun noDuplicate!1767 (List!27115) Bool)

(assert (=> b!1232077 (= res!819746 (noDuplicate!1767 acc!823))))

(declare-fun b!1232078 () Bool)

(declare-fun res!819744 () Bool)

(assert (=> b!1232078 (=> (not res!819744) (not e!699116))))

(declare-fun arrayContainsKey!0 (array!79434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232078 (= res!819744 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232079 () Bool)

(declare-fun res!819743 () Bool)

(assert (=> b!1232079 (=> (not res!819743) (not e!699116))))

(assert (=> b!1232079 (= res!819743 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232080 () Bool)

(declare-fun res!819741 () Bool)

(assert (=> b!1232080 (=> (not res!819741) (not e!699116))))

(assert (=> b!1232080 (= res!819741 (not (contains!7186 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102496 res!819745) b!1232073))

(assert (= (and b!1232073 res!819747) b!1232075))

(assert (= (and b!1232075 res!819748) b!1232077))

(assert (= (and b!1232077 res!819746) b!1232076))

(assert (= (and b!1232076 res!819742) b!1232080))

(assert (= (and b!1232080 res!819741) b!1232078))

(assert (= (and b!1232078 res!819744) b!1232079))

(assert (= (and b!1232079 res!819743) b!1232072))

(assert (= (and b!1232072 res!819749) b!1232074))

(declare-fun m!1136725 () Bool)

(assert (=> b!1232077 m!1136725))

(declare-fun m!1136727 () Bool)

(assert (=> b!1232072 m!1136727))

(assert (=> b!1232072 m!1136727))

(declare-fun m!1136729 () Bool)

(assert (=> b!1232072 m!1136729))

(declare-fun m!1136731 () Bool)

(assert (=> b!1232079 m!1136731))

(declare-fun m!1136733 () Bool)

(assert (=> b!1232080 m!1136733))

(declare-fun m!1136735 () Bool)

(assert (=> b!1232076 m!1136735))

(declare-fun m!1136737 () Bool)

(assert (=> start!102496 m!1136737))

(assert (=> b!1232074 m!1136727))

(declare-fun m!1136739 () Bool)

(assert (=> b!1232074 m!1136739))

(declare-fun m!1136741 () Bool)

(assert (=> b!1232073 m!1136741))

(declare-fun m!1136743 () Bool)

(assert (=> b!1232078 m!1136743))

(push 1)

(assert (not b!1232074))

(assert (not b!1232080))

(assert (not b!1232079))

(assert (not b!1232072))

(assert (not b!1232073))

(assert (not b!1232077))

(assert (not start!102496))

(assert (not b!1232076))

(assert (not b!1232078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

