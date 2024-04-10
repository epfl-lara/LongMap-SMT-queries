; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102366 () Bool)

(assert start!102366)

(declare-fun b!1231529 () Bool)

(declare-fun res!819943 () Bool)

(declare-fun e!698651 () Bool)

(assert (=> b!1231529 (=> res!819943 e!698651)))

(declare-datatypes ((List!27106 0))(
  ( (Nil!27103) (Cons!27102 (h!28311 (_ BitVec 64)) (t!40569 List!27106)) )
))
(declare-fun acc!823 () List!27106)

(declare-fun subseq!503 (List!27106 List!27106) Bool)

(assert (=> b!1231529 (= res!819943 (not (subseq!503 Nil!27103 acc!823)))))

(declare-fun b!1231530 () Bool)

(declare-fun res!819955 () Bool)

(declare-fun e!698650 () Bool)

(assert (=> b!1231530 (=> (not res!819955) (not e!698650))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231530 (= res!819955 (validKeyInArray!0 k!2913))))

(declare-fun b!1231531 () Bool)

(declare-fun res!819950 () Bool)

(assert (=> b!1231531 (=> (not res!819950) (not e!698650))))

(declare-datatypes ((array!79436 0))(
  ( (array!79437 (arr!38333 (Array (_ BitVec 32) (_ BitVec 64))) (size!38869 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79436)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79436 (_ BitVec 32) List!27106) Bool)

(assert (=> b!1231531 (= res!819950 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231532 () Bool)

(declare-fun res!819945 () Bool)

(assert (=> b!1231532 (=> (not res!819945) (not e!698650))))

(declare-fun arrayContainsKey!0 (array!79436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231532 (= res!819945 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231533 () Bool)

(assert (=> b!1231533 (= e!698651 true)))

(declare-datatypes ((Unit!40772 0))(
  ( (Unit!40773) )
))
(declare-fun lt!559421 () Unit!40772)

(declare-fun noDuplicateSubseq!53 (List!27106 List!27106) Unit!40772)

(assert (=> b!1231533 (= lt!559421 (noDuplicateSubseq!53 Nil!27103 acc!823))))

(declare-fun res!819944 () Bool)

(assert (=> start!102366 (=> (not res!819944) (not e!698650))))

(assert (=> start!102366 (= res!819944 (bvslt (size!38869 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102366 e!698650))

(declare-fun array_inv!29181 (array!79436) Bool)

(assert (=> start!102366 (array_inv!29181 a!3806)))

(assert (=> start!102366 true))

(declare-fun b!1231534 () Bool)

(declare-fun res!819951 () Bool)

(assert (=> b!1231534 (=> (not res!819951) (not e!698650))))

(declare-fun contains!7168 (List!27106 (_ BitVec 64)) Bool)

(assert (=> b!1231534 (= res!819951 (not (contains!7168 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231535 () Bool)

(assert (=> b!1231535 (= e!698650 (not e!698651))))

(declare-fun res!819952 () Bool)

(assert (=> b!1231535 (=> res!819952 e!698651)))

(assert (=> b!1231535 (= res!819952 (bvsgt from!3184 (size!38869 a!3806)))))

(assert (=> b!1231535 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27102 (select (arr!38333 a!3806) from!3184) acc!823))))

(declare-fun b!1231536 () Bool)

(declare-fun res!819949 () Bool)

(assert (=> b!1231536 (=> (not res!819949) (not e!698650))))

(assert (=> b!1231536 (= res!819949 (not (contains!7168 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231537 () Bool)

(declare-fun res!819954 () Bool)

(assert (=> b!1231537 (=> (not res!819954) (not e!698650))))

(declare-fun noDuplicate!1765 (List!27106) Bool)

(assert (=> b!1231537 (= res!819954 (noDuplicate!1765 acc!823))))

(declare-fun b!1231538 () Bool)

(declare-fun res!819946 () Bool)

(assert (=> b!1231538 (=> res!819946 e!698651)))

(assert (=> b!1231538 (= res!819946 (contains!7168 Nil!27103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231539 () Bool)

(declare-fun res!819953 () Bool)

(assert (=> b!1231539 (=> (not res!819953) (not e!698650))))

(assert (=> b!1231539 (= res!819953 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38869 a!3806)) (bvslt from!3184 (size!38869 a!3806))))))

(declare-fun b!1231540 () Bool)

(declare-fun res!819948 () Bool)

(assert (=> b!1231540 (=> res!819948 e!698651)))

(assert (=> b!1231540 (= res!819948 (contains!7168 Nil!27103 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231541 () Bool)

(declare-fun res!819947 () Bool)

(assert (=> b!1231541 (=> (not res!819947) (not e!698650))))

(assert (=> b!1231541 (= res!819947 (validKeyInArray!0 (select (arr!38333 a!3806) from!3184)))))

(assert (= (and start!102366 res!819944) b!1231530))

(assert (= (and b!1231530 res!819955) b!1231539))

(assert (= (and b!1231539 res!819953) b!1231537))

(assert (= (and b!1231537 res!819954) b!1231534))

(assert (= (and b!1231534 res!819951) b!1231536))

(assert (= (and b!1231536 res!819949) b!1231532))

(assert (= (and b!1231532 res!819945) b!1231531))

(assert (= (and b!1231531 res!819950) b!1231541))

(assert (= (and b!1231541 res!819947) b!1231535))

(assert (= (and b!1231535 (not res!819952)) b!1231538))

(assert (= (and b!1231538 (not res!819946)) b!1231540))

(assert (= (and b!1231540 (not res!819948)) b!1231529))

(assert (= (and b!1231529 (not res!819943)) b!1231533))

(declare-fun m!1135657 () Bool)

(assert (=> b!1231530 m!1135657))

(declare-fun m!1135659 () Bool)

(assert (=> b!1231531 m!1135659))

(declare-fun m!1135661 () Bool)

(assert (=> b!1231532 m!1135661))

(declare-fun m!1135663 () Bool)

(assert (=> b!1231541 m!1135663))

(assert (=> b!1231541 m!1135663))

(declare-fun m!1135665 () Bool)

(assert (=> b!1231541 m!1135665))

(declare-fun m!1135667 () Bool)

(assert (=> start!102366 m!1135667))

(declare-fun m!1135669 () Bool)

(assert (=> b!1231533 m!1135669))

(declare-fun m!1135671 () Bool)

(assert (=> b!1231540 m!1135671))

(declare-fun m!1135673 () Bool)

(assert (=> b!1231538 m!1135673))

(declare-fun m!1135675 () Bool)

(assert (=> b!1231537 m!1135675))

(assert (=> b!1231535 m!1135663))

(declare-fun m!1135677 () Bool)

(assert (=> b!1231535 m!1135677))

(declare-fun m!1135679 () Bool)

(assert (=> b!1231529 m!1135679))

(declare-fun m!1135681 () Bool)

(assert (=> b!1231534 m!1135681))

(declare-fun m!1135683 () Bool)

(assert (=> b!1231536 m!1135683))

(push 1)

(assert (not b!1231534))

(assert (not b!1231541))

(assert (not b!1231536))

(assert (not start!102366))

(assert (not b!1231533))

(assert (not b!1231537))

(assert (not b!1231529))

(assert (not b!1231532))

(assert (not b!1231531))

(assert (not b!1231540))

(assert (not b!1231538))

(assert (not b!1231530))

(assert (not b!1231535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

