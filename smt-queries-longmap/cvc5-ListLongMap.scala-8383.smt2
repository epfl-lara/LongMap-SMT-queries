; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102214 () Bool)

(assert start!102214)

(declare-fun b!1229041 () Bool)

(declare-fun res!816882 () Bool)

(declare-fun e!697889 () Bool)

(assert (=> b!1229041 (=> (not res!816882) (not e!697889))))

(declare-datatypes ((array!79287 0))(
  ( (array!79288 (arr!38260 (Array (_ BitVec 32) (_ BitVec 64))) (size!38797 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79287)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229041 (= res!816882 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229042 () Bool)

(declare-fun res!816878 () Bool)

(assert (=> b!1229042 (=> (not res!816878) (not e!697889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229042 (= res!816878 (validKeyInArray!0 k!2913))))

(declare-fun b!1229043 () Bool)

(declare-fun e!697887 () Bool)

(assert (=> b!1229043 (= e!697887 true)))

(declare-datatypes ((Unit!40635 0))(
  ( (Unit!40636) )
))
(declare-fun lt!559419 () Unit!40635)

(declare-datatypes ((List!27046 0))(
  ( (Nil!27043) (Cons!27042 (h!28260 (_ BitVec 64)) (t!40501 List!27046)) )
))
(declare-fun acc!823 () List!27046)

(declare-fun noDuplicateSubseq!40 (List!27046 List!27046) Unit!40635)

(assert (=> b!1229043 (= lt!559419 (noDuplicateSubseq!40 Nil!27043 acc!823))))

(declare-fun b!1229044 () Bool)

(declare-fun res!816884 () Bool)

(assert (=> b!1229044 (=> (not res!816884) (not e!697889))))

(declare-fun contains!7117 (List!27046 (_ BitVec 64)) Bool)

(assert (=> b!1229044 (= res!816884 (not (contains!7117 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229045 () Bool)

(declare-fun res!816880 () Bool)

(assert (=> b!1229045 (=> res!816880 e!697887)))

(assert (=> b!1229045 (= res!816880 (contains!7117 Nil!27043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!816877 () Bool)

(assert (=> start!102214 (=> (not res!816877) (not e!697889))))

(assert (=> start!102214 (= res!816877 (bvslt (size!38797 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102214 e!697889))

(declare-fun array_inv!29198 (array!79287) Bool)

(assert (=> start!102214 (array_inv!29198 a!3806)))

(assert (=> start!102214 true))

(declare-fun b!1229046 () Bool)

(assert (=> b!1229046 (= e!697889 (not e!697887))))

(declare-fun res!816883 () Bool)

(assert (=> b!1229046 (=> res!816883 e!697887)))

(assert (=> b!1229046 (= res!816883 (bvsgt from!3184 (size!38797 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79287 (_ BitVec 32) List!27046) Bool)

(assert (=> b!1229046 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27042 (select (arr!38260 a!3806) from!3184) acc!823))))

(declare-fun b!1229047 () Bool)

(declare-fun res!816875 () Bool)

(assert (=> b!1229047 (=> (not res!816875) (not e!697889))))

(assert (=> b!1229047 (= res!816875 (validKeyInArray!0 (select (arr!38260 a!3806) from!3184)))))

(declare-fun b!1229048 () Bool)

(declare-fun res!816876 () Bool)

(assert (=> b!1229048 (=> (not res!816876) (not e!697889))))

(assert (=> b!1229048 (= res!816876 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38797 a!3806)) (bvslt from!3184 (size!38797 a!3806))))))

(declare-fun b!1229049 () Bool)

(declare-fun res!816881 () Bool)

(assert (=> b!1229049 (=> (not res!816881) (not e!697889))))

(declare-fun noDuplicate!1698 (List!27046) Bool)

(assert (=> b!1229049 (= res!816881 (noDuplicate!1698 acc!823))))

(declare-fun b!1229050 () Bool)

(declare-fun res!816874 () Bool)

(assert (=> b!1229050 (=> res!816874 e!697887)))

(declare-fun subseq!487 (List!27046 List!27046) Bool)

(assert (=> b!1229050 (= res!816874 (not (subseq!487 Nil!27043 acc!823)))))

(declare-fun b!1229051 () Bool)

(declare-fun res!816873 () Bool)

(assert (=> b!1229051 (=> (not res!816873) (not e!697889))))

(assert (=> b!1229051 (= res!816873 (not (contains!7117 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229052 () Bool)

(declare-fun res!816872 () Bool)

(assert (=> b!1229052 (=> (not res!816872) (not e!697889))))

(assert (=> b!1229052 (= res!816872 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229053 () Bool)

(declare-fun res!816879 () Bool)

(assert (=> b!1229053 (=> res!816879 e!697887)))

(assert (=> b!1229053 (= res!816879 (contains!7117 Nil!27043 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102214 res!816877) b!1229042))

(assert (= (and b!1229042 res!816878) b!1229048))

(assert (= (and b!1229048 res!816876) b!1229049))

(assert (= (and b!1229049 res!816881) b!1229044))

(assert (= (and b!1229044 res!816884) b!1229051))

(assert (= (and b!1229051 res!816873) b!1229041))

(assert (= (and b!1229041 res!816882) b!1229052))

(assert (= (and b!1229052 res!816872) b!1229047))

(assert (= (and b!1229047 res!816875) b!1229046))

(assert (= (and b!1229046 (not res!816883)) b!1229045))

(assert (= (and b!1229045 (not res!816880)) b!1229053))

(assert (= (and b!1229053 (not res!816879)) b!1229050))

(assert (= (and b!1229050 (not res!816874)) b!1229043))

(declare-fun m!1134041 () Bool)

(assert (=> b!1229052 m!1134041))

(declare-fun m!1134043 () Bool)

(assert (=> b!1229050 m!1134043))

(declare-fun m!1134045 () Bool)

(assert (=> b!1229047 m!1134045))

(assert (=> b!1229047 m!1134045))

(declare-fun m!1134047 () Bool)

(assert (=> b!1229047 m!1134047))

(declare-fun m!1134049 () Bool)

(assert (=> b!1229049 m!1134049))

(declare-fun m!1134051 () Bool)

(assert (=> b!1229043 m!1134051))

(declare-fun m!1134053 () Bool)

(assert (=> start!102214 m!1134053))

(declare-fun m!1134055 () Bool)

(assert (=> b!1229051 m!1134055))

(declare-fun m!1134057 () Bool)

(assert (=> b!1229041 m!1134057))

(declare-fun m!1134059 () Bool)

(assert (=> b!1229042 m!1134059))

(declare-fun m!1134061 () Bool)

(assert (=> b!1229053 m!1134061))

(declare-fun m!1134063 () Bool)

(assert (=> b!1229044 m!1134063))

(assert (=> b!1229046 m!1134045))

(declare-fun m!1134065 () Bool)

(assert (=> b!1229046 m!1134065))

(declare-fun m!1134067 () Bool)

(assert (=> b!1229045 m!1134067))

(push 1)

(assert (not b!1229053))

(assert (not b!1229043))

(assert (not b!1229042))

(assert (not b!1229052))

(assert (not b!1229044))

(assert (not b!1229050))

(assert (not b!1229047))

(assert (not b!1229051))

(assert (not b!1229049))

(assert (not start!102214))

(assert (not b!1229041))

(assert (not b!1229046))

(assert (not b!1229045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

