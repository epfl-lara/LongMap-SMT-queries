; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102170 () Bool)

(assert start!102170)

(declare-fun b!1229938 () Bool)

(declare-fun res!818436 () Bool)

(declare-fun e!697959 () Bool)

(assert (=> b!1229938 (=> (not res!818436) (not e!697959))))

(declare-datatypes ((List!27065 0))(
  ( (Nil!27062) (Cons!27061 (h!28270 (_ BitVec 64)) (t!40528 List!27065)) )
))
(declare-fun acc!823 () List!27065)

(declare-fun contains!7127 (List!27065 (_ BitVec 64)) Bool)

(assert (=> b!1229938 (= res!818436 (not (contains!7127 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229939 () Bool)

(declare-fun res!818431 () Bool)

(assert (=> b!1229939 (=> (not res!818431) (not e!697959))))

(declare-datatypes ((array!79345 0))(
  ( (array!79346 (arr!38292 (Array (_ BitVec 32) (_ BitVec 64))) (size!38828 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79345)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229939 (= res!818431 (validKeyInArray!0 (select (arr!38292 a!3806) from!3184)))))

(declare-fun b!1229940 () Bool)

(declare-fun res!818425 () Bool)

(assert (=> b!1229940 (=> (not res!818425) (not e!697959))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229940 (= res!818425 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229941 () Bool)

(declare-fun res!818430 () Bool)

(assert (=> b!1229941 (=> (not res!818430) (not e!697959))))

(declare-fun arrayNoDuplicates!0 (array!79345 (_ BitVec 32) List!27065) Bool)

(assert (=> b!1229941 (= res!818430 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229942 () Bool)

(declare-fun e!697958 () Bool)

(assert (=> b!1229942 (= e!697958 true)))

(declare-fun lt!559289 () List!27065)

(declare-fun lt!559288 () Bool)

(assert (=> b!1229942 (= lt!559288 (contains!7127 lt!559289 (select (arr!38292 a!3806) from!3184)))))

(declare-fun b!1229943 () Bool)

(assert (=> b!1229943 (= e!697959 (not e!697958))))

(declare-fun res!818433 () Bool)

(assert (=> b!1229943 (=> res!818433 e!697958)))

(assert (=> b!1229943 (= res!818433 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229943 (= lt!559289 (Cons!27061 (select (arr!38292 a!3806) from!3184) Nil!27062))))

(declare-fun e!697957 () Bool)

(assert (=> b!1229943 e!697957))

(declare-fun res!818432 () Bool)

(assert (=> b!1229943 (=> (not res!818432) (not e!697957))))

(assert (=> b!1229943 (= res!818432 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27062))))

(declare-datatypes ((Unit!40750 0))(
  ( (Unit!40751) )
))
(declare-fun lt!559287 () Unit!40750)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79345 List!27065 List!27065 (_ BitVec 32)) Unit!40750)

(assert (=> b!1229943 (= lt!559287 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27062 from!3184))))

(assert (=> b!1229943 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27061 (select (arr!38292 a!3806) from!3184) acc!823))))

(declare-fun b!1229944 () Bool)

(declare-fun res!818435 () Bool)

(assert (=> b!1229944 (=> (not res!818435) (not e!697959))))

(assert (=> b!1229944 (= res!818435 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38828 a!3806)) (bvslt from!3184 (size!38828 a!3806))))))

(declare-fun b!1229945 () Bool)

(declare-fun res!818429 () Bool)

(assert (=> b!1229945 (=> res!818429 e!697958)))

(declare-fun noDuplicate!1724 (List!27065) Bool)

(assert (=> b!1229945 (= res!818429 (not (noDuplicate!1724 lt!559289)))))

(declare-fun b!1229946 () Bool)

(declare-fun res!818424 () Bool)

(assert (=> b!1229946 (=> res!818424 e!697958)))

(assert (=> b!1229946 (= res!818424 (contains!7127 lt!559289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229947 () Bool)

(declare-fun res!818434 () Bool)

(assert (=> b!1229947 (=> res!818434 e!697958)))

(assert (=> b!1229947 (= res!818434 (contains!7127 lt!559289 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!818427 () Bool)

(assert (=> start!102170 (=> (not res!818427) (not e!697959))))

(assert (=> start!102170 (= res!818427 (bvslt (size!38828 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102170 e!697959))

(declare-fun array_inv!29140 (array!79345) Bool)

(assert (=> start!102170 (array_inv!29140 a!3806)))

(assert (=> start!102170 true))

(declare-fun b!1229948 () Bool)

(declare-fun res!818428 () Bool)

(assert (=> b!1229948 (=> (not res!818428) (not e!697959))))

(assert (=> b!1229948 (= res!818428 (not (contains!7127 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229949 () Bool)

(assert (=> b!1229949 (= e!697957 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27061 (select (arr!38292 a!3806) from!3184) Nil!27062)))))

(declare-fun b!1229950 () Bool)

(declare-fun res!818426 () Bool)

(assert (=> b!1229950 (=> (not res!818426) (not e!697959))))

(assert (=> b!1229950 (= res!818426 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229951 () Bool)

(declare-fun res!818437 () Bool)

(assert (=> b!1229951 (=> (not res!818437) (not e!697959))))

(assert (=> b!1229951 (= res!818437 (noDuplicate!1724 acc!823))))

(assert (= (and start!102170 res!818427) b!1229950))

(assert (= (and b!1229950 res!818426) b!1229944))

(assert (= (and b!1229944 res!818435) b!1229951))

(assert (= (and b!1229951 res!818437) b!1229948))

(assert (= (and b!1229948 res!818428) b!1229938))

(assert (= (and b!1229938 res!818436) b!1229940))

(assert (= (and b!1229940 res!818425) b!1229941))

(assert (= (and b!1229941 res!818430) b!1229939))

(assert (= (and b!1229939 res!818431) b!1229943))

(assert (= (and b!1229943 res!818432) b!1229949))

(assert (= (and b!1229943 (not res!818433)) b!1229945))

(assert (= (and b!1229945 (not res!818429)) b!1229946))

(assert (= (and b!1229946 (not res!818424)) b!1229947))

(assert (= (and b!1229947 (not res!818434)) b!1229942))

(declare-fun m!1134401 () Bool)

(assert (=> b!1229939 m!1134401))

(assert (=> b!1229939 m!1134401))

(declare-fun m!1134403 () Bool)

(assert (=> b!1229939 m!1134403))

(declare-fun m!1134405 () Bool)

(assert (=> b!1229951 m!1134405))

(assert (=> b!1229943 m!1134401))

(declare-fun m!1134407 () Bool)

(assert (=> b!1229943 m!1134407))

(declare-fun m!1134409 () Bool)

(assert (=> b!1229943 m!1134409))

(declare-fun m!1134411 () Bool)

(assert (=> b!1229943 m!1134411))

(declare-fun m!1134413 () Bool)

(assert (=> b!1229941 m!1134413))

(declare-fun m!1134415 () Bool)

(assert (=> b!1229948 m!1134415))

(declare-fun m!1134417 () Bool)

(assert (=> b!1229945 m!1134417))

(declare-fun m!1134419 () Bool)

(assert (=> b!1229947 m!1134419))

(declare-fun m!1134421 () Bool)

(assert (=> b!1229946 m!1134421))

(declare-fun m!1134423 () Bool)

(assert (=> b!1229938 m!1134423))

(declare-fun m!1134425 () Bool)

(assert (=> b!1229940 m!1134425))

(declare-fun m!1134427 () Bool)

(assert (=> start!102170 m!1134427))

(assert (=> b!1229942 m!1134401))

(assert (=> b!1229942 m!1134401))

(declare-fun m!1134429 () Bool)

(assert (=> b!1229942 m!1134429))

(declare-fun m!1134431 () Bool)

(assert (=> b!1229950 m!1134431))

(assert (=> b!1229949 m!1134401))

(declare-fun m!1134433 () Bool)

(assert (=> b!1229949 m!1134433))

(check-sat (not b!1229950) (not b!1229942) (not b!1229948) (not b!1229941) (not b!1229951) (not b!1229949) (not b!1229945) (not b!1229947) (not start!102170) (not b!1229938) (not b!1229939) (not b!1229943) (not b!1229940) (not b!1229946))
(check-sat)
