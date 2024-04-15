; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102440 () Bool)

(assert start!102440)

(declare-fun b!1232124 () Bool)

(declare-fun res!820539 () Bool)

(declare-fun e!698885 () Bool)

(assert (=> b!1232124 (=> (not res!820539) (not e!698885))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79394 0))(
  ( (array!79395 (arr!38311 (Array (_ BitVec 32) (_ BitVec 64))) (size!38849 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79394)

(assert (=> b!1232124 (= res!820539 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38849 a!3806)) (bvslt from!3184 (size!38849 a!3806))))))

(declare-fun b!1232125 () Bool)

(declare-fun res!820543 () Bool)

(assert (=> b!1232125 (=> (not res!820543) (not e!698885))))

(declare-datatypes ((List!27185 0))(
  ( (Nil!27182) (Cons!27181 (h!28390 (_ BitVec 64)) (t!40639 List!27185)) )
))
(declare-fun acc!823 () List!27185)

(declare-fun contains!7157 (List!27185 (_ BitVec 64)) Bool)

(assert (=> b!1232125 (= res!820543 (not (contains!7157 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232126 () Bool)

(declare-fun res!820545 () Bool)

(assert (=> b!1232126 (=> (not res!820545) (not e!698885))))

(declare-fun arrayNoDuplicates!0 (array!79394 (_ BitVec 32) List!27185) Bool)

(assert (=> b!1232126 (= res!820545 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232127 () Bool)

(declare-fun res!820544 () Bool)

(assert (=> b!1232127 (=> (not res!820544) (not e!698885))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232127 (= res!820544 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232128 () Bool)

(declare-fun e!698883 () Bool)

(assert (=> b!1232128 (= e!698883 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27181 (select (arr!38311 a!3806) from!3184) Nil!27182)))))

(declare-fun res!820541 () Bool)

(assert (=> start!102440 (=> (not res!820541) (not e!698885))))

(assert (=> start!102440 (= res!820541 (bvslt (size!38849 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102440 e!698885))

(declare-fun array_inv!29294 (array!79394) Bool)

(assert (=> start!102440 (array_inv!29294 a!3806)))

(assert (=> start!102440 true))

(declare-fun b!1232129 () Bool)

(declare-fun res!820540 () Bool)

(assert (=> b!1232129 (=> (not res!820540) (not e!698885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232129 (= res!820540 (validKeyInArray!0 k!2913))))

(declare-fun b!1232130 () Bool)

(assert (=> b!1232130 (= e!698885 (not true))))

(assert (=> b!1232130 e!698883))

(declare-fun res!820538 () Bool)

(assert (=> b!1232130 (=> (not res!820538) (not e!698883))))

(assert (=> b!1232130 (= res!820538 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27182))))

(declare-datatypes ((Unit!40653 0))(
  ( (Unit!40654) )
))
(declare-fun lt!559319 () Unit!40653)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79394 List!27185 List!27185 (_ BitVec 32)) Unit!40653)

(assert (=> b!1232130 (= lt!559319 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27182 from!3184))))

(assert (=> b!1232130 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27181 (select (arr!38311 a!3806) from!3184) acc!823))))

(declare-fun b!1232131 () Bool)

(declare-fun res!820547 () Bool)

(assert (=> b!1232131 (=> (not res!820547) (not e!698885))))

(declare-fun noDuplicate!1800 (List!27185) Bool)

(assert (=> b!1232131 (= res!820547 (noDuplicate!1800 acc!823))))

(declare-fun b!1232132 () Bool)

(declare-fun res!820542 () Bool)

(assert (=> b!1232132 (=> (not res!820542) (not e!698885))))

(assert (=> b!1232132 (= res!820542 (validKeyInArray!0 (select (arr!38311 a!3806) from!3184)))))

(declare-fun b!1232133 () Bool)

(declare-fun res!820546 () Bool)

(assert (=> b!1232133 (=> (not res!820546) (not e!698885))))

(assert (=> b!1232133 (= res!820546 (not (contains!7157 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102440 res!820541) b!1232129))

(assert (= (and b!1232129 res!820540) b!1232124))

(assert (= (and b!1232124 res!820539) b!1232131))

(assert (= (and b!1232131 res!820547) b!1232133))

(assert (= (and b!1232133 res!820546) b!1232125))

(assert (= (and b!1232125 res!820543) b!1232127))

(assert (= (and b!1232127 res!820544) b!1232126))

(assert (= (and b!1232126 res!820545) b!1232132))

(assert (= (and b!1232132 res!820542) b!1232130))

(assert (= (and b!1232130 res!820538) b!1232128))

(declare-fun m!1135717 () Bool)

(assert (=> b!1232133 m!1135717))

(declare-fun m!1135719 () Bool)

(assert (=> b!1232126 m!1135719))

(declare-fun m!1135721 () Bool)

(assert (=> b!1232130 m!1135721))

(declare-fun m!1135723 () Bool)

(assert (=> b!1232130 m!1135723))

(declare-fun m!1135725 () Bool)

(assert (=> b!1232130 m!1135725))

(declare-fun m!1135727 () Bool)

(assert (=> b!1232130 m!1135727))

(assert (=> b!1232128 m!1135725))

(declare-fun m!1135729 () Bool)

(assert (=> b!1232128 m!1135729))

(declare-fun m!1135731 () Bool)

(assert (=> b!1232129 m!1135731))

(declare-fun m!1135733 () Bool)

(assert (=> b!1232127 m!1135733))

(declare-fun m!1135735 () Bool)

(assert (=> b!1232131 m!1135735))

(assert (=> b!1232132 m!1135725))

(assert (=> b!1232132 m!1135725))

(declare-fun m!1135737 () Bool)

(assert (=> b!1232132 m!1135737))

(declare-fun m!1135739 () Bool)

(assert (=> b!1232125 m!1135739))

(declare-fun m!1135741 () Bool)

(assert (=> start!102440 m!1135741))

(push 1)

(assert (not start!102440))

(assert (not b!1232133))

(assert (not b!1232132))

(assert (not b!1232127))

(assert (not b!1232130))

(assert (not b!1232128))

(assert (not b!1232125))

(assert (not b!1232129))

(assert (not b!1232131))

(assert (not b!1232126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

