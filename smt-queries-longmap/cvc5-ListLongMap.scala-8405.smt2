; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102246 () Bool)

(assert start!102246)

(declare-fun b!1230609 () Bool)

(declare-fun res!819079 () Bool)

(declare-fun e!698219 () Bool)

(assert (=> b!1230609 (=> (not res!819079) (not e!698219))))

(declare-datatypes ((array!79388 0))(
  ( (array!79389 (arr!38312 (Array (_ BitVec 32) (_ BitVec 64))) (size!38848 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79388)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230609 (= res!819079 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!819077 () Bool)

(assert (=> start!102246 (=> (not res!819077) (not e!698219))))

(assert (=> start!102246 (= res!819077 (bvslt (size!38848 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102246 e!698219))

(declare-fun array_inv!29160 (array!79388) Bool)

(assert (=> start!102246 (array_inv!29160 a!3806)))

(assert (=> start!102246 true))

(declare-fun b!1230610 () Bool)

(declare-fun res!819071 () Bool)

(assert (=> b!1230610 (=> (not res!819071) (not e!698219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230610 (= res!819071 (validKeyInArray!0 k!2913))))

(declare-fun b!1230611 () Bool)

(declare-fun res!819073 () Bool)

(assert (=> b!1230611 (=> (not res!819073) (not e!698219))))

(assert (=> b!1230611 (= res!819073 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38848 a!3806)) (bvslt from!3184 (size!38848 a!3806))))))

(declare-fun b!1230612 () Bool)

(declare-fun res!819074 () Bool)

(assert (=> b!1230612 (=> (not res!819074) (not e!698219))))

(declare-datatypes ((List!27085 0))(
  ( (Nil!27082) (Cons!27081 (h!28290 (_ BitVec 64)) (t!40548 List!27085)) )
))
(declare-fun acc!823 () List!27085)

(declare-fun noDuplicate!1744 (List!27085) Bool)

(assert (=> b!1230612 (= res!819074 (noDuplicate!1744 acc!823))))

(declare-fun b!1230613 () Bool)

(declare-fun res!819072 () Bool)

(assert (=> b!1230613 (=> (not res!819072) (not e!698219))))

(declare-fun contains!7147 (List!27085 (_ BitVec 64)) Bool)

(assert (=> b!1230613 (= res!819072 (not (contains!7147 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230614 () Bool)

(declare-fun res!819075 () Bool)

(assert (=> b!1230614 (=> (not res!819075) (not e!698219))))

(declare-fun arrayNoDuplicates!0 (array!79388 (_ BitVec 32) List!27085) Bool)

(assert (=> b!1230614 (= res!819075 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230615 () Bool)

(declare-fun res!819076 () Bool)

(assert (=> b!1230615 (=> (not res!819076) (not e!698219))))

(assert (=> b!1230615 (= res!819076 (not (contains!7147 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230616 () Bool)

(assert (=> b!1230616 (= e!698219 (not true))))

(assert (=> b!1230616 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27081 (select (arr!38312 a!3806) from!3184) acc!823))))

(declare-fun b!1230617 () Bool)

(declare-fun res!819078 () Bool)

(assert (=> b!1230617 (=> (not res!819078) (not e!698219))))

(assert (=> b!1230617 (= res!819078 (validKeyInArray!0 (select (arr!38312 a!3806) from!3184)))))

(assert (= (and start!102246 res!819077) b!1230610))

(assert (= (and b!1230610 res!819071) b!1230611))

(assert (= (and b!1230611 res!819073) b!1230612))

(assert (= (and b!1230612 res!819074) b!1230615))

(assert (= (and b!1230615 res!819076) b!1230613))

(assert (= (and b!1230613 res!819072) b!1230609))

(assert (= (and b!1230609 res!819079) b!1230614))

(assert (= (and b!1230614 res!819075) b!1230617))

(assert (= (and b!1230617 res!819078) b!1230616))

(declare-fun m!1134967 () Bool)

(assert (=> b!1230609 m!1134967))

(declare-fun m!1134969 () Bool)

(assert (=> b!1230613 m!1134969))

(declare-fun m!1134971 () Bool)

(assert (=> b!1230617 m!1134971))

(assert (=> b!1230617 m!1134971))

(declare-fun m!1134973 () Bool)

(assert (=> b!1230617 m!1134973))

(declare-fun m!1134975 () Bool)

(assert (=> b!1230614 m!1134975))

(assert (=> b!1230616 m!1134971))

(declare-fun m!1134977 () Bool)

(assert (=> b!1230616 m!1134977))

(declare-fun m!1134979 () Bool)

(assert (=> b!1230610 m!1134979))

(declare-fun m!1134981 () Bool)

(assert (=> b!1230612 m!1134981))

(declare-fun m!1134983 () Bool)

(assert (=> b!1230615 m!1134983))

(declare-fun m!1134985 () Bool)

(assert (=> start!102246 m!1134985))

(push 1)

(assert (not b!1230616))

(assert (not b!1230613))

(assert (not b!1230609))

(assert (not b!1230615))

(assert (not b!1230614))

(assert (not b!1230612))

(assert (not start!102246))

(assert (not b!1230610))

(assert (not b!1230617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

