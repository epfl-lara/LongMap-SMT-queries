; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101984 () Bool)

(assert start!101984)

(declare-fun b!1227879 () Bool)

(declare-fun res!816542 () Bool)

(declare-fun e!697043 () Bool)

(assert (=> b!1227879 (=> (not res!816542) (not e!697043))))

(declare-datatypes ((array!79184 0))(
  ( (array!79185 (arr!38215 (Array (_ BitVec 32) (_ BitVec 64))) (size!38753 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79184)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227879 (= res!816542 (validKeyInArray!0 (select (arr!38215 a!3806) from!3184)))))

(declare-fun b!1227880 () Bool)

(declare-fun res!816545 () Bool)

(assert (=> b!1227880 (=> (not res!816545) (not e!697043))))

(declare-datatypes ((List!27089 0))(
  ( (Nil!27086) (Cons!27085 (h!28294 (_ BitVec 64)) (t!40543 List!27089)) )
))
(declare-fun acc!823 () List!27089)

(declare-fun arrayNoDuplicates!0 (array!79184 (_ BitVec 32) List!27089) Bool)

(assert (=> b!1227880 (= res!816545 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227881 () Bool)

(declare-fun res!816549 () Bool)

(declare-fun e!697041 () Bool)

(assert (=> b!1227881 (=> res!816549 e!697041)))

(declare-fun contains!7061 (List!27089 (_ BitVec 64)) Bool)

(assert (=> b!1227881 (= res!816549 (contains!7061 Nil!27086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227882 () Bool)

(declare-fun res!816548 () Bool)

(assert (=> b!1227882 (=> res!816548 e!697041)))

(declare-fun subseq!493 (List!27089 List!27089) Bool)

(assert (=> b!1227882 (= res!816548 (not (subseq!493 Nil!27086 acc!823)))))

(declare-fun b!1227883 () Bool)

(declare-fun res!816543 () Bool)

(assert (=> b!1227883 (=> (not res!816543) (not e!697043))))

(declare-fun noDuplicate!1704 (List!27089) Bool)

(assert (=> b!1227883 (= res!816543 (noDuplicate!1704 acc!823))))

(declare-fun b!1227884 () Bool)

(declare-fun res!816541 () Bool)

(assert (=> b!1227884 (=> (not res!816541) (not e!697043))))

(assert (=> b!1227884 (= res!816541 (not (contains!7061 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227885 () Bool)

(declare-fun res!816540 () Bool)

(assert (=> b!1227885 (=> (not res!816540) (not e!697043))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1227885 (= res!816540 (validKeyInArray!0 k!2913))))

(declare-fun b!1227886 () Bool)

(assert (=> b!1227886 (= e!697043 (not e!697041))))

(declare-fun res!816547 () Bool)

(assert (=> b!1227886 (=> res!816547 e!697041)))

(assert (=> b!1227886 (= res!816547 (bvsgt from!3184 (size!38753 a!3806)))))

(assert (=> b!1227886 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27085 (select (arr!38215 a!3806) from!3184) acc!823))))

(declare-fun res!816550 () Bool)

(assert (=> start!101984 (=> (not res!816550) (not e!697043))))

(assert (=> start!101984 (= res!816550 (bvslt (size!38753 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101984 e!697043))

(declare-fun array_inv!29198 (array!79184) Bool)

(assert (=> start!101984 (array_inv!29198 a!3806)))

(assert (=> start!101984 true))

(declare-fun b!1227887 () Bool)

(declare-fun res!816544 () Bool)

(assert (=> b!1227887 (=> res!816544 e!697041)))

(assert (=> b!1227887 (= res!816544 (contains!7061 Nil!27086 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227888 () Bool)

(declare-fun res!816546 () Bool)

(assert (=> b!1227888 (=> (not res!816546) (not e!697043))))

(declare-fun arrayContainsKey!0 (array!79184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227888 (= res!816546 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227889 () Bool)

(assert (=> b!1227889 (= e!697041 true)))

(declare-datatypes ((Unit!40521 0))(
  ( (Unit!40522) )
))
(declare-fun lt!558776 () Unit!40521)

(declare-fun noDuplicateSubseq!46 (List!27089 List!27089) Unit!40521)

(assert (=> b!1227889 (= lt!558776 (noDuplicateSubseq!46 Nil!27086 acc!823))))

(declare-fun b!1227890 () Bool)

(declare-fun res!816551 () Bool)

(assert (=> b!1227890 (=> (not res!816551) (not e!697043))))

(assert (=> b!1227890 (= res!816551 (not (contains!7061 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227891 () Bool)

(declare-fun res!816539 () Bool)

(assert (=> b!1227891 (=> (not res!816539) (not e!697043))))

(assert (=> b!1227891 (= res!816539 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38753 a!3806)) (bvslt from!3184 (size!38753 a!3806))))))

(assert (= (and start!101984 res!816550) b!1227885))

(assert (= (and b!1227885 res!816540) b!1227891))

(assert (= (and b!1227891 res!816539) b!1227883))

(assert (= (and b!1227883 res!816543) b!1227884))

(assert (= (and b!1227884 res!816541) b!1227890))

(assert (= (and b!1227890 res!816551) b!1227888))

(assert (= (and b!1227888 res!816546) b!1227880))

(assert (= (and b!1227880 res!816545) b!1227879))

(assert (= (and b!1227879 res!816542) b!1227886))

(assert (= (and b!1227886 (not res!816547)) b!1227881))

(assert (= (and b!1227881 (not res!816549)) b!1227887))

(assert (= (and b!1227887 (not res!816544)) b!1227882))

(assert (= (and b!1227882 (not res!816548)) b!1227889))

(declare-fun m!1132055 () Bool)

(assert (=> b!1227884 m!1132055))

(declare-fun m!1132057 () Bool)

(assert (=> b!1227886 m!1132057))

(declare-fun m!1132059 () Bool)

(assert (=> b!1227886 m!1132059))

(declare-fun m!1132061 () Bool)

(assert (=> start!101984 m!1132061))

(declare-fun m!1132063 () Bool)

(assert (=> b!1227885 m!1132063))

(declare-fun m!1132065 () Bool)

(assert (=> b!1227881 m!1132065))

(declare-fun m!1132067 () Bool)

(assert (=> b!1227888 m!1132067))

(assert (=> b!1227879 m!1132057))

(assert (=> b!1227879 m!1132057))

(declare-fun m!1132069 () Bool)

(assert (=> b!1227879 m!1132069))

(declare-fun m!1132071 () Bool)

(assert (=> b!1227889 m!1132071))

(declare-fun m!1132073 () Bool)

(assert (=> b!1227890 m!1132073))

(declare-fun m!1132075 () Bool)

(assert (=> b!1227883 m!1132075))

(declare-fun m!1132077 () Bool)

(assert (=> b!1227882 m!1132077))

(declare-fun m!1132079 () Bool)

(assert (=> b!1227887 m!1132079))

(declare-fun m!1132081 () Bool)

(assert (=> b!1227880 m!1132081))

(push 1)

(assert (not b!1227884))

(assert (not b!1227889))

(assert (not b!1227890))

(assert (not b!1227886))

(assert (not b!1227888))

(assert (not b!1227887))

(assert (not b!1227880))

(assert (not b!1227885))

(assert (not b!1227879))

(assert (not start!101984))

(assert (not b!1227883))

(assert (not b!1227882))

(assert (not b!1227881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

