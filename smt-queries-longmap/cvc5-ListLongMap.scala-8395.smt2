; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102150 () Bool)

(assert start!102150)

(declare-fun b!1229518 () Bool)

(declare-fun res!818011 () Bool)

(declare-fun e!697839 () Bool)

(assert (=> b!1229518 (=> (not res!818011) (not e!697839))))

(declare-datatypes ((array!79325 0))(
  ( (array!79326 (arr!38282 (Array (_ BitVec 32) (_ BitVec 64))) (size!38818 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79325)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229518 (= res!818011 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!818017 () Bool)

(assert (=> start!102150 (=> (not res!818017) (not e!697839))))

(assert (=> start!102150 (= res!818017 (bvslt (size!38818 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102150 e!697839))

(declare-fun array_inv!29130 (array!79325) Bool)

(assert (=> start!102150 (array_inv!29130 a!3806)))

(assert (=> start!102150 true))

(declare-fun b!1229519 () Bool)

(declare-fun res!818008 () Bool)

(assert (=> b!1229519 (=> (not res!818008) (not e!697839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229519 (= res!818008 (validKeyInArray!0 k!2913))))

(declare-fun b!1229520 () Bool)

(declare-fun res!818004 () Bool)

(assert (=> b!1229520 (=> (not res!818004) (not e!697839))))

(declare-datatypes ((List!27055 0))(
  ( (Nil!27052) (Cons!27051 (h!28260 (_ BitVec 64)) (t!40518 List!27055)) )
))
(declare-fun acc!823 () List!27055)

(declare-fun contains!7117 (List!27055 (_ BitVec 64)) Bool)

(assert (=> b!1229520 (= res!818004 (not (contains!7117 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229521 () Bool)

(declare-fun e!697837 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79325 (_ BitVec 32) List!27055) Bool)

(assert (=> b!1229521 (= e!697837 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27051 (select (arr!38282 a!3806) from!3184) Nil!27052)))))

(declare-fun b!1229522 () Bool)

(declare-fun res!818013 () Bool)

(assert (=> b!1229522 (=> (not res!818013) (not e!697839))))

(assert (=> b!1229522 (= res!818013 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38818 a!3806)) (bvslt from!3184 (size!38818 a!3806))))))

(declare-fun b!1229523 () Bool)

(declare-fun res!818006 () Bool)

(declare-fun e!697836 () Bool)

(assert (=> b!1229523 (=> res!818006 e!697836)))

(declare-fun lt!559198 () List!27055)

(declare-fun noDuplicate!1714 (List!27055) Bool)

(assert (=> b!1229523 (= res!818006 (not (noDuplicate!1714 lt!559198)))))

(declare-fun b!1229524 () Bool)

(declare-fun res!818007 () Bool)

(assert (=> b!1229524 (=> (not res!818007) (not e!697839))))

(assert (=> b!1229524 (= res!818007 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229525 () Bool)

(declare-fun res!818009 () Bool)

(assert (=> b!1229525 (=> res!818009 e!697836)))

(assert (=> b!1229525 (= res!818009 (contains!7117 lt!559198 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229526 () Bool)

(declare-fun res!818010 () Bool)

(assert (=> b!1229526 (=> (not res!818010) (not e!697839))))

(assert (=> b!1229526 (= res!818010 (validKeyInArray!0 (select (arr!38282 a!3806) from!3184)))))

(declare-fun b!1229527 () Bool)

(declare-fun res!818015 () Bool)

(assert (=> b!1229527 (=> (not res!818015) (not e!697839))))

(assert (=> b!1229527 (= res!818015 (not (contains!7117 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229528 () Bool)

(declare-fun res!818014 () Bool)

(assert (=> b!1229528 (=> res!818014 e!697836)))

(assert (=> b!1229528 (= res!818014 (contains!7117 lt!559198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229529 () Bool)

(assert (=> b!1229529 (= e!697839 (not e!697836))))

(declare-fun res!818012 () Bool)

(assert (=> b!1229529 (=> res!818012 e!697836)))

(assert (=> b!1229529 (= res!818012 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229529 (= lt!559198 (Cons!27051 (select (arr!38282 a!3806) from!3184) Nil!27052))))

(assert (=> b!1229529 e!697837))

(declare-fun res!818016 () Bool)

(assert (=> b!1229529 (=> (not res!818016) (not e!697837))))

(assert (=> b!1229529 (= res!818016 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27052))))

(declare-datatypes ((Unit!40730 0))(
  ( (Unit!40731) )
))
(declare-fun lt!559199 () Unit!40730)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79325 List!27055 List!27055 (_ BitVec 32)) Unit!40730)

(assert (=> b!1229529 (= lt!559199 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27052 from!3184))))

(assert (=> b!1229529 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27051 (select (arr!38282 a!3806) from!3184) acc!823))))

(declare-fun b!1229530 () Bool)

(declare-fun res!818005 () Bool)

(assert (=> b!1229530 (=> (not res!818005) (not e!697839))))

(assert (=> b!1229530 (= res!818005 (noDuplicate!1714 acc!823))))

(declare-fun b!1229531 () Bool)

(assert (=> b!1229531 (= e!697836 true)))

(declare-fun lt!559197 () Bool)

(assert (=> b!1229531 (= lt!559197 (contains!7117 lt!559198 (select (arr!38282 a!3806) from!3184)))))

(assert (= (and start!102150 res!818017) b!1229519))

(assert (= (and b!1229519 res!818008) b!1229522))

(assert (= (and b!1229522 res!818013) b!1229530))

(assert (= (and b!1229530 res!818005) b!1229520))

(assert (= (and b!1229520 res!818004) b!1229527))

(assert (= (and b!1229527 res!818015) b!1229518))

(assert (= (and b!1229518 res!818011) b!1229524))

(assert (= (and b!1229524 res!818007) b!1229526))

(assert (= (and b!1229526 res!818010) b!1229529))

(assert (= (and b!1229529 res!818016) b!1229521))

(assert (= (and b!1229529 (not res!818012)) b!1229523))

(assert (= (and b!1229523 (not res!818006)) b!1229528))

(assert (= (and b!1229528 (not res!818014)) b!1229525))

(assert (= (and b!1229525 (not res!818009)) b!1229531))

(declare-fun m!1134061 () Bool)

(assert (=> b!1229520 m!1134061))

(declare-fun m!1134063 () Bool)

(assert (=> b!1229518 m!1134063))

(declare-fun m!1134065 () Bool)

(assert (=> b!1229527 m!1134065))

(declare-fun m!1134067 () Bool)

(assert (=> b!1229530 m!1134067))

(declare-fun m!1134069 () Bool)

(assert (=> b!1229524 m!1134069))

(declare-fun m!1134071 () Bool)

(assert (=> b!1229529 m!1134071))

(declare-fun m!1134073 () Bool)

(assert (=> b!1229529 m!1134073))

(declare-fun m!1134075 () Bool)

(assert (=> b!1229529 m!1134075))

(declare-fun m!1134077 () Bool)

(assert (=> b!1229529 m!1134077))

(declare-fun m!1134079 () Bool)

(assert (=> b!1229519 m!1134079))

(assert (=> b!1229531 m!1134071))

(assert (=> b!1229531 m!1134071))

(declare-fun m!1134081 () Bool)

(assert (=> b!1229531 m!1134081))

(declare-fun m!1134083 () Bool)

(assert (=> b!1229528 m!1134083))

(assert (=> b!1229521 m!1134071))

(declare-fun m!1134085 () Bool)

(assert (=> b!1229521 m!1134085))

(declare-fun m!1134087 () Bool)

(assert (=> b!1229525 m!1134087))

(assert (=> b!1229526 m!1134071))

(assert (=> b!1229526 m!1134071))

(declare-fun m!1134089 () Bool)

(assert (=> b!1229526 m!1134089))

(declare-fun m!1134091 () Bool)

(assert (=> start!102150 m!1134091))

(declare-fun m!1134093 () Bool)

(assert (=> b!1229523 m!1134093))

(push 1)

(assert (not b!1229527))

(assert (not b!1229529))

(assert (not b!1229520))

(assert (not b!1229519))

(assert (not b!1229523))

(assert (not b!1229524))

(assert (not b!1229531))

(assert (not b!1229518))

(assert (not b!1229530))

(assert (not b!1229525))

(assert (not start!102150))

(assert (not b!1229521))

(assert (not b!1229526))

(assert (not b!1229528))

(check-sat)

(pop 1)

