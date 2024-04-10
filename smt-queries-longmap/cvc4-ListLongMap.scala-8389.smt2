; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102014 () Bool)

(assert start!102014)

(declare-fun b!1228388 () Bool)

(declare-fun res!817001 () Bool)

(declare-fun e!697202 () Bool)

(assert (=> b!1228388 (=> (not res!817001) (not e!697202))))

(declare-datatypes ((array!79287 0))(
  ( (array!79288 (arr!38266 (Array (_ BitVec 32) (_ BitVec 64))) (size!38802 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79287)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228388 (= res!817001 (validKeyInArray!0 (select (arr!38266 a!3806) from!3184)))))

(declare-fun b!1228389 () Bool)

(assert (=> b!1228389 (= e!697202 (not true))))

(declare-datatypes ((List!27039 0))(
  ( (Nil!27036) (Cons!27035 (h!28244 (_ BitVec 64)) (t!40502 List!27039)) )
))
(declare-fun arrayNoDuplicates!0 (array!79287 (_ BitVec 32) List!27039) Bool)

(assert (=> b!1228389 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27036)))

(declare-fun acc!823 () List!27039)

(declare-datatypes ((Unit!40698 0))(
  ( (Unit!40699) )
))
(declare-fun lt!558993 () Unit!40698)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79287 List!27039 List!27039 (_ BitVec 32)) Unit!40698)

(assert (=> b!1228389 (= lt!558993 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27036 from!3184))))

(assert (=> b!1228389 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27035 (select (arr!38266 a!3806) from!3184) acc!823))))

(declare-fun b!1228390 () Bool)

(declare-fun res!817005 () Bool)

(assert (=> b!1228390 (=> (not res!817005) (not e!697202))))

(assert (=> b!1228390 (= res!817005 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38802 a!3806)) (bvslt from!3184 (size!38802 a!3806))))))

(declare-fun b!1228391 () Bool)

(declare-fun res!817006 () Bool)

(assert (=> b!1228391 (=> (not res!817006) (not e!697202))))

(assert (=> b!1228391 (= res!817006 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228392 () Bool)

(declare-fun res!817002 () Bool)

(assert (=> b!1228392 (=> (not res!817002) (not e!697202))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1228392 (= res!817002 (validKeyInArray!0 k!2913))))

(declare-fun b!1228393 () Bool)

(declare-fun res!817003 () Bool)

(assert (=> b!1228393 (=> (not res!817003) (not e!697202))))

(declare-fun contains!7101 (List!27039 (_ BitVec 64)) Bool)

(assert (=> b!1228393 (= res!817003 (not (contains!7101 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228394 () Bool)

(declare-fun res!817007 () Bool)

(assert (=> b!1228394 (=> (not res!817007) (not e!697202))))

(declare-fun arrayContainsKey!0 (array!79287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228394 (= res!817007 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228396 () Bool)

(declare-fun res!817008 () Bool)

(assert (=> b!1228396 (=> (not res!817008) (not e!697202))))

(assert (=> b!1228396 (= res!817008 (not (contains!7101 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!817000 () Bool)

(assert (=> start!102014 (=> (not res!817000) (not e!697202))))

(assert (=> start!102014 (= res!817000 (bvslt (size!38802 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102014 e!697202))

(declare-fun array_inv!29114 (array!79287) Bool)

(assert (=> start!102014 (array_inv!29114 a!3806)))

(assert (=> start!102014 true))

(declare-fun b!1228395 () Bool)

(declare-fun res!817004 () Bool)

(assert (=> b!1228395 (=> (not res!817004) (not e!697202))))

(declare-fun noDuplicate!1698 (List!27039) Bool)

(assert (=> b!1228395 (= res!817004 (noDuplicate!1698 acc!823))))

(assert (= (and start!102014 res!817000) b!1228392))

(assert (= (and b!1228392 res!817002) b!1228390))

(assert (= (and b!1228390 res!817005) b!1228395))

(assert (= (and b!1228395 res!817004) b!1228396))

(assert (= (and b!1228396 res!817008) b!1228393))

(assert (= (and b!1228393 res!817003) b!1228394))

(assert (= (and b!1228394 res!817007) b!1228391))

(assert (= (and b!1228391 res!817006) b!1228388))

(assert (= (and b!1228388 res!817001) b!1228389))

(declare-fun m!1132935 () Bool)

(assert (=> b!1228389 m!1132935))

(declare-fun m!1132937 () Bool)

(assert (=> b!1228389 m!1132937))

(declare-fun m!1132939 () Bool)

(assert (=> b!1228389 m!1132939))

(declare-fun m!1132941 () Bool)

(assert (=> b!1228389 m!1132941))

(declare-fun m!1132943 () Bool)

(assert (=> b!1228391 m!1132943))

(assert (=> b!1228388 m!1132939))

(assert (=> b!1228388 m!1132939))

(declare-fun m!1132945 () Bool)

(assert (=> b!1228388 m!1132945))

(declare-fun m!1132947 () Bool)

(assert (=> b!1228396 m!1132947))

(declare-fun m!1132949 () Bool)

(assert (=> start!102014 m!1132949))

(declare-fun m!1132951 () Bool)

(assert (=> b!1228394 m!1132951))

(declare-fun m!1132953 () Bool)

(assert (=> b!1228393 m!1132953))

(declare-fun m!1132955 () Bool)

(assert (=> b!1228395 m!1132955))

(declare-fun m!1132957 () Bool)

(assert (=> b!1228392 m!1132957))

(push 1)

(assert (not b!1228395))

(assert (not b!1228396))

(assert (not b!1228391))

(assert (not b!1228392))

(assert (not b!1228388))

(assert (not b!1228394))

(assert (not start!102014))

(assert (not b!1228393))

(assert (not b!1228389))

(check-sat)

(pop 1)

(push 1)

