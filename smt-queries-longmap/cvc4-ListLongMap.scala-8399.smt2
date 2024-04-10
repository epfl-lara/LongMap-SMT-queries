; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102178 () Bool)

(assert start!102178)

(declare-fun b!1230074 () Bool)

(declare-fun res!818563 () Bool)

(declare-fun e!697998 () Bool)

(assert (=> b!1230074 (=> (not res!818563) (not e!697998))))

(declare-datatypes ((List!27069 0))(
  ( (Nil!27066) (Cons!27065 (h!28274 (_ BitVec 64)) (t!40532 List!27069)) )
))
(declare-fun acc!823 () List!27069)

(declare-fun noDuplicate!1728 (List!27069) Bool)

(assert (=> b!1230074 (= res!818563 (noDuplicate!1728 acc!823))))

(declare-fun b!1230075 () Bool)

(declare-fun e!697996 () Bool)

(declare-datatypes ((array!79353 0))(
  ( (array!79354 (arr!38296 (Array (_ BitVec 32) (_ BitVec 64))) (size!38832 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79353)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79353 (_ BitVec 32) List!27069) Bool)

(assert (=> b!1230075 (= e!697996 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27065 (select (arr!38296 a!3806) from!3184) Nil!27066)))))

(declare-fun b!1230076 () Bool)

(declare-fun res!818561 () Bool)

(assert (=> b!1230076 (=> (not res!818561) (not e!697998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230076 (= res!818561 (validKeyInArray!0 (select (arr!38296 a!3806) from!3184)))))

(declare-fun b!1230077 () Bool)

(declare-fun res!818566 () Bool)

(assert (=> b!1230077 (=> (not res!818566) (not e!697998))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230077 (= res!818566 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230078 () Bool)

(assert (=> b!1230078 (= e!697998 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1230078 (not (arrayContainsKey!0 a!3806 (select (arr!38296 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40758 0))(
  ( (Unit!40759) )
))
(declare-fun lt!559315 () Unit!40758)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79353 (_ BitVec 32) (_ BitVec 64) List!27069) Unit!40758)

(assert (=> b!1230078 (= lt!559315 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38296 a!3806) from!3184) (Cons!27065 (select (arr!38296 a!3806) from!3184) Nil!27066)))))

(assert (=> b!1230078 e!697996))

(declare-fun res!818564 () Bool)

(assert (=> b!1230078 (=> (not res!818564) (not e!697996))))

(assert (=> b!1230078 (= res!818564 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27066))))

(declare-fun lt!559316 () Unit!40758)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79353 List!27069 List!27069 (_ BitVec 32)) Unit!40758)

(assert (=> b!1230078 (= lt!559316 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27066 from!3184))))

(assert (=> b!1230078 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27065 (select (arr!38296 a!3806) from!3184) acc!823))))

(declare-fun b!1230079 () Bool)

(declare-fun res!818569 () Bool)

(assert (=> b!1230079 (=> (not res!818569) (not e!697998))))

(declare-fun contains!7131 (List!27069 (_ BitVec 64)) Bool)

(assert (=> b!1230079 (= res!818569 (not (contains!7131 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818568 () Bool)

(assert (=> start!102178 (=> (not res!818568) (not e!697998))))

(assert (=> start!102178 (= res!818568 (bvslt (size!38832 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102178 e!697998))

(declare-fun array_inv!29144 (array!79353) Bool)

(assert (=> start!102178 (array_inv!29144 a!3806)))

(assert (=> start!102178 true))

(declare-fun b!1230080 () Bool)

(declare-fun res!818562 () Bool)

(assert (=> b!1230080 (=> (not res!818562) (not e!697998))))

(assert (=> b!1230080 (= res!818562 (not (contains!7131 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230081 () Bool)

(declare-fun res!818567 () Bool)

(assert (=> b!1230081 (=> (not res!818567) (not e!697998))))

(assert (=> b!1230081 (= res!818567 (validKeyInArray!0 k!2913))))

(declare-fun b!1230082 () Bool)

(declare-fun res!818565 () Bool)

(assert (=> b!1230082 (=> (not res!818565) (not e!697998))))

(assert (=> b!1230082 (= res!818565 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230083 () Bool)

(declare-fun res!818560 () Bool)

(assert (=> b!1230083 (=> (not res!818560) (not e!697998))))

(assert (=> b!1230083 (= res!818560 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38832 a!3806)) (bvslt from!3184 (size!38832 a!3806))))))

(assert (= (and start!102178 res!818568) b!1230081))

(assert (= (and b!1230081 res!818567) b!1230083))

(assert (= (and b!1230083 res!818560) b!1230074))

(assert (= (and b!1230074 res!818563) b!1230079))

(assert (= (and b!1230079 res!818569) b!1230080))

(assert (= (and b!1230080 res!818562) b!1230077))

(assert (= (and b!1230077 res!818566) b!1230082))

(assert (= (and b!1230082 res!818565) b!1230076))

(assert (= (and b!1230076 res!818561) b!1230078))

(assert (= (and b!1230078 res!818564) b!1230075))

(declare-fun m!1134529 () Bool)

(assert (=> b!1230078 m!1134529))

(declare-fun m!1134531 () Bool)

(assert (=> b!1230078 m!1134531))

(declare-fun m!1134533 () Bool)

(assert (=> b!1230078 m!1134533))

(declare-fun m!1134535 () Bool)

(assert (=> b!1230078 m!1134535))

(assert (=> b!1230078 m!1134533))

(declare-fun m!1134537 () Bool)

(assert (=> b!1230078 m!1134537))

(assert (=> b!1230078 m!1134533))

(declare-fun m!1134539 () Bool)

(assert (=> b!1230078 m!1134539))

(declare-fun m!1134541 () Bool)

(assert (=> b!1230081 m!1134541))

(assert (=> b!1230076 m!1134533))

(assert (=> b!1230076 m!1134533))

(declare-fun m!1134543 () Bool)

(assert (=> b!1230076 m!1134543))

(declare-fun m!1134545 () Bool)

(assert (=> b!1230080 m!1134545))

(declare-fun m!1134547 () Bool)

(assert (=> b!1230082 m!1134547))

(assert (=> b!1230075 m!1134533))

(declare-fun m!1134549 () Bool)

(assert (=> b!1230075 m!1134549))

(declare-fun m!1134551 () Bool)

(assert (=> b!1230074 m!1134551))

(declare-fun m!1134553 () Bool)

(assert (=> b!1230079 m!1134553))

(declare-fun m!1134555 () Bool)

(assert (=> b!1230077 m!1134555))

(declare-fun m!1134557 () Bool)

(assert (=> start!102178 m!1134557))

(push 1)

(assert (not b!1230082))

(assert (not b!1230077))

