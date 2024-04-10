; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102148 () Bool)

(assert start!102148)

(declare-fun b!1229476 () Bool)

(declare-fun res!817971 () Bool)

(declare-fun e!697826 () Bool)

(assert (=> b!1229476 (=> (not res!817971) (not e!697826))))

(declare-datatypes ((array!79323 0))(
  ( (array!79324 (arr!38281 (Array (_ BitVec 32) (_ BitVec 64))) (size!38817 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79323)

(declare-datatypes ((List!27054 0))(
  ( (Nil!27051) (Cons!27050 (h!28259 (_ BitVec 64)) (t!40517 List!27054)) )
))
(declare-fun acc!823 () List!27054)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79323 (_ BitVec 32) List!27054) Bool)

(assert (=> b!1229476 (= res!817971 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229477 () Bool)

(declare-fun e!697827 () Bool)

(assert (=> b!1229477 (= e!697827 true)))

(declare-fun lt!559190 () Bool)

(declare-fun lt!559188 () List!27054)

(declare-fun contains!7116 (List!27054 (_ BitVec 64)) Bool)

(assert (=> b!1229477 (= lt!559190 (contains!7116 lt!559188 (select (arr!38281 a!3806) from!3184)))))

(declare-fun b!1229478 () Bool)

(declare-fun res!817975 () Bool)

(assert (=> b!1229478 (=> (not res!817975) (not e!697826))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229478 (= res!817975 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229479 () Bool)

(declare-fun res!817972 () Bool)

(assert (=> b!1229479 (=> (not res!817972) (not e!697826))))

(declare-fun noDuplicate!1713 (List!27054) Bool)

(assert (=> b!1229479 (= res!817972 (noDuplicate!1713 acc!823))))

(declare-fun b!1229480 () Bool)

(declare-fun e!697825 () Bool)

(assert (=> b!1229480 (= e!697825 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27050 (select (arr!38281 a!3806) from!3184) Nil!27051)))))

(declare-fun b!1229481 () Bool)

(declare-fun res!817970 () Bool)

(assert (=> b!1229481 (=> (not res!817970) (not e!697826))))

(assert (=> b!1229481 (= res!817970 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38817 a!3806)) (bvslt from!3184 (size!38817 a!3806))))))

(declare-fun b!1229482 () Bool)

(assert (=> b!1229482 (= e!697826 (not e!697827))))

(declare-fun res!817969 () Bool)

(assert (=> b!1229482 (=> res!817969 e!697827)))

(assert (=> b!1229482 (= res!817969 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229482 (= lt!559188 (Cons!27050 (select (arr!38281 a!3806) from!3184) Nil!27051))))

(assert (=> b!1229482 e!697825))

(declare-fun res!817966 () Bool)

(assert (=> b!1229482 (=> (not res!817966) (not e!697825))))

(assert (=> b!1229482 (= res!817966 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27051))))

(declare-datatypes ((Unit!40728 0))(
  ( (Unit!40729) )
))
(declare-fun lt!559189 () Unit!40728)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79323 List!27054 List!27054 (_ BitVec 32)) Unit!40728)

(assert (=> b!1229482 (= lt!559189 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27051 from!3184))))

(assert (=> b!1229482 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27050 (select (arr!38281 a!3806) from!3184) acc!823))))

(declare-fun b!1229483 () Bool)

(declare-fun res!817973 () Bool)

(assert (=> b!1229483 (=> (not res!817973) (not e!697826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229483 (= res!817973 (validKeyInArray!0 k!2913))))

(declare-fun b!1229484 () Bool)

(declare-fun res!817962 () Bool)

(assert (=> b!1229484 (=> (not res!817962) (not e!697826))))

(assert (=> b!1229484 (= res!817962 (not (contains!7116 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229485 () Bool)

(declare-fun res!817963 () Bool)

(assert (=> b!1229485 (=> res!817963 e!697827)))

(assert (=> b!1229485 (= res!817963 (contains!7116 lt!559188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229486 () Bool)

(declare-fun res!817974 () Bool)

(assert (=> b!1229486 (=> res!817974 e!697827)))

(assert (=> b!1229486 (= res!817974 (not (noDuplicate!1713 lt!559188)))))

(declare-fun b!1229488 () Bool)

(declare-fun res!817967 () Bool)

(assert (=> b!1229488 (=> (not res!817967) (not e!697826))))

(assert (=> b!1229488 (= res!817967 (validKeyInArray!0 (select (arr!38281 a!3806) from!3184)))))

(declare-fun b!1229489 () Bool)

(declare-fun res!817964 () Bool)

(assert (=> b!1229489 (=> (not res!817964) (not e!697826))))

(assert (=> b!1229489 (= res!817964 (not (contains!7116 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229487 () Bool)

(declare-fun res!817968 () Bool)

(assert (=> b!1229487 (=> res!817968 e!697827)))

(assert (=> b!1229487 (= res!817968 (contains!7116 lt!559188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!817965 () Bool)

(assert (=> start!102148 (=> (not res!817965) (not e!697826))))

(assert (=> start!102148 (= res!817965 (bvslt (size!38817 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102148 e!697826))

(declare-fun array_inv!29129 (array!79323) Bool)

(assert (=> start!102148 (array_inv!29129 a!3806)))

(assert (=> start!102148 true))

(assert (= (and start!102148 res!817965) b!1229483))

(assert (= (and b!1229483 res!817973) b!1229481))

(assert (= (and b!1229481 res!817970) b!1229479))

(assert (= (and b!1229479 res!817972) b!1229489))

(assert (= (and b!1229489 res!817964) b!1229484))

(assert (= (and b!1229484 res!817962) b!1229478))

(assert (= (and b!1229478 res!817975) b!1229476))

(assert (= (and b!1229476 res!817971) b!1229488))

(assert (= (and b!1229488 res!817967) b!1229482))

(assert (= (and b!1229482 res!817966) b!1229480))

(assert (= (and b!1229482 (not res!817969)) b!1229486))

(assert (= (and b!1229486 (not res!817974)) b!1229485))

(assert (= (and b!1229485 (not res!817963)) b!1229487))

(assert (= (and b!1229487 (not res!817968)) b!1229477))

(declare-fun m!1134027 () Bool)

(assert (=> b!1229479 m!1134027))

(declare-fun m!1134029 () Bool)

(assert (=> b!1229487 m!1134029))

(declare-fun m!1134031 () Bool)

(assert (=> b!1229486 m!1134031))

(declare-fun m!1134033 () Bool)

(assert (=> b!1229485 m!1134033))

(declare-fun m!1134035 () Bool)

(assert (=> b!1229482 m!1134035))

(declare-fun m!1134037 () Bool)

(assert (=> b!1229482 m!1134037))

(declare-fun m!1134039 () Bool)

(assert (=> b!1229482 m!1134039))

(declare-fun m!1134041 () Bool)

(assert (=> b!1229482 m!1134041))

(assert (=> b!1229480 m!1134035))

(declare-fun m!1134043 () Bool)

(assert (=> b!1229480 m!1134043))

(declare-fun m!1134045 () Bool)

(assert (=> b!1229484 m!1134045))

(declare-fun m!1134047 () Bool)

(assert (=> b!1229483 m!1134047))

(declare-fun m!1134049 () Bool)

(assert (=> start!102148 m!1134049))

(declare-fun m!1134051 () Bool)

(assert (=> b!1229478 m!1134051))

(declare-fun m!1134053 () Bool)

(assert (=> b!1229489 m!1134053))

(assert (=> b!1229477 m!1134035))

(assert (=> b!1229477 m!1134035))

(declare-fun m!1134055 () Bool)

(assert (=> b!1229477 m!1134055))

(declare-fun m!1134057 () Bool)

(assert (=> b!1229476 m!1134057))

(assert (=> b!1229488 m!1134035))

(assert (=> b!1229488 m!1134035))

(declare-fun m!1134059 () Bool)

(assert (=> b!1229488 m!1134059))

(push 1)

(assert (not b!1229478))

(assert (not b!1229488))

(assert (not start!102148))

(assert (not b!1229483))

(assert (not b!1229486))

(assert (not b!1229479))

(assert (not b!1229482))

(assert (not b!1229487))

(assert (not b!1229484))

(assert (not b!1229480))

(assert (not b!1229476))

(assert (not b!1229489))

(assert (not b!1229477))

(assert (not b!1229485))

