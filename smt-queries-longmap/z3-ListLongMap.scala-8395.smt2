; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102152 () Bool)

(assert start!102152)

(declare-fun b!1229560 () Bool)

(declare-fun res!818053 () Bool)

(declare-fun e!697848 () Bool)

(assert (=> b!1229560 (=> (not res!818053) (not e!697848))))

(declare-datatypes ((List!27056 0))(
  ( (Nil!27053) (Cons!27052 (h!28261 (_ BitVec 64)) (t!40519 List!27056)) )
))
(declare-fun acc!823 () List!27056)

(declare-fun contains!7118 (List!27056 (_ BitVec 64)) Bool)

(assert (=> b!1229560 (= res!818053 (not (contains!7118 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229561 () Bool)

(declare-fun res!818057 () Bool)

(assert (=> b!1229561 (=> (not res!818057) (not e!697848))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79327 0))(
  ( (array!79328 (arr!38283 (Array (_ BitVec 32) (_ BitVec 64))) (size!38819 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79327)

(assert (=> b!1229561 (= res!818057 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38819 a!3806)) (bvslt from!3184 (size!38819 a!3806))))))

(declare-fun b!1229562 () Bool)

(declare-fun res!818052 () Bool)

(assert (=> b!1229562 (=> (not res!818052) (not e!697848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229562 (= res!818052 (validKeyInArray!0 (select (arr!38283 a!3806) from!3184)))))

(declare-fun b!1229563 () Bool)

(declare-fun res!818050 () Bool)

(declare-fun e!697849 () Bool)

(assert (=> b!1229563 (=> res!818050 e!697849)))

(declare-fun lt!559208 () List!27056)

(assert (=> b!1229563 (= res!818050 (contains!7118 lt!559208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229564 () Bool)

(declare-fun res!818056 () Bool)

(assert (=> b!1229564 (=> res!818056 e!697849)))

(assert (=> b!1229564 (= res!818056 (contains!7118 lt!559208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229565 () Bool)

(declare-fun res!818046 () Bool)

(assert (=> b!1229565 (=> (not res!818046) (not e!697848))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1229565 (= res!818046 (validKeyInArray!0 k0!2913))))

(declare-fun res!818049 () Bool)

(assert (=> start!102152 (=> (not res!818049) (not e!697848))))

(assert (=> start!102152 (= res!818049 (bvslt (size!38819 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102152 e!697848))

(declare-fun array_inv!29131 (array!79327) Bool)

(assert (=> start!102152 (array_inv!29131 a!3806)))

(assert (=> start!102152 true))

(declare-fun b!1229566 () Bool)

(declare-fun res!818055 () Bool)

(assert (=> b!1229566 (=> (not res!818055) (not e!697848))))

(declare-fun arrayNoDuplicates!0 (array!79327 (_ BitVec 32) List!27056) Bool)

(assert (=> b!1229566 (= res!818055 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229567 () Bool)

(assert (=> b!1229567 (= e!697848 (not e!697849))))

(declare-fun res!818054 () Bool)

(assert (=> b!1229567 (=> res!818054 e!697849)))

(assert (=> b!1229567 (= res!818054 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229567 (= lt!559208 (Cons!27052 (select (arr!38283 a!3806) from!3184) Nil!27053))))

(declare-fun e!697851 () Bool)

(assert (=> b!1229567 e!697851))

(declare-fun res!818051 () Bool)

(assert (=> b!1229567 (=> (not res!818051) (not e!697851))))

(assert (=> b!1229567 (= res!818051 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27053))))

(declare-datatypes ((Unit!40732 0))(
  ( (Unit!40733) )
))
(declare-fun lt!559206 () Unit!40732)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79327 List!27056 List!27056 (_ BitVec 32)) Unit!40732)

(assert (=> b!1229567 (= lt!559206 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27053 from!3184))))

(assert (=> b!1229567 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27052 (select (arr!38283 a!3806) from!3184) acc!823))))

(declare-fun b!1229568 () Bool)

(declare-fun res!818047 () Bool)

(assert (=> b!1229568 (=> (not res!818047) (not e!697848))))

(declare-fun arrayContainsKey!0 (array!79327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229568 (= res!818047 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229569 () Bool)

(declare-fun res!818048 () Bool)

(assert (=> b!1229569 (=> res!818048 e!697849)))

(declare-fun noDuplicate!1715 (List!27056) Bool)

(assert (=> b!1229569 (= res!818048 (not (noDuplicate!1715 lt!559208)))))

(declare-fun b!1229570 () Bool)

(declare-fun res!818059 () Bool)

(assert (=> b!1229570 (=> (not res!818059) (not e!697848))))

(assert (=> b!1229570 (= res!818059 (not (contains!7118 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229571 () Bool)

(assert (=> b!1229571 (= e!697849 true)))

(declare-fun lt!559207 () Bool)

(assert (=> b!1229571 (= lt!559207 (contains!7118 lt!559208 (select (arr!38283 a!3806) from!3184)))))

(declare-fun b!1229572 () Bool)

(assert (=> b!1229572 (= e!697851 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27052 (select (arr!38283 a!3806) from!3184) Nil!27053)))))

(declare-fun b!1229573 () Bool)

(declare-fun res!818058 () Bool)

(assert (=> b!1229573 (=> (not res!818058) (not e!697848))))

(assert (=> b!1229573 (= res!818058 (noDuplicate!1715 acc!823))))

(assert (= (and start!102152 res!818049) b!1229565))

(assert (= (and b!1229565 res!818046) b!1229561))

(assert (= (and b!1229561 res!818057) b!1229573))

(assert (= (and b!1229573 res!818058) b!1229560))

(assert (= (and b!1229560 res!818053) b!1229570))

(assert (= (and b!1229570 res!818059) b!1229568))

(assert (= (and b!1229568 res!818047) b!1229566))

(assert (= (and b!1229566 res!818055) b!1229562))

(assert (= (and b!1229562 res!818052) b!1229567))

(assert (= (and b!1229567 res!818051) b!1229572))

(assert (= (and b!1229567 (not res!818054)) b!1229569))

(assert (= (and b!1229569 (not res!818048)) b!1229564))

(assert (= (and b!1229564 (not res!818056)) b!1229563))

(assert (= (and b!1229563 (not res!818050)) b!1229571))

(declare-fun m!1134095 () Bool)

(assert (=> b!1229573 m!1134095))

(declare-fun m!1134097 () Bool)

(assert (=> b!1229563 m!1134097))

(declare-fun m!1134099 () Bool)

(assert (=> b!1229567 m!1134099))

(declare-fun m!1134101 () Bool)

(assert (=> b!1229567 m!1134101))

(declare-fun m!1134103 () Bool)

(assert (=> b!1229567 m!1134103))

(declare-fun m!1134105 () Bool)

(assert (=> b!1229567 m!1134105))

(declare-fun m!1134107 () Bool)

(assert (=> b!1229569 m!1134107))

(declare-fun m!1134109 () Bool)

(assert (=> b!1229570 m!1134109))

(declare-fun m!1134111 () Bool)

(assert (=> b!1229566 m!1134111))

(declare-fun m!1134113 () Bool)

(assert (=> b!1229565 m!1134113))

(declare-fun m!1134115 () Bool)

(assert (=> b!1229560 m!1134115))

(declare-fun m!1134117 () Bool)

(assert (=> start!102152 m!1134117))

(assert (=> b!1229572 m!1134099))

(declare-fun m!1134119 () Bool)

(assert (=> b!1229572 m!1134119))

(declare-fun m!1134121 () Bool)

(assert (=> b!1229564 m!1134121))

(assert (=> b!1229571 m!1134099))

(assert (=> b!1229571 m!1134099))

(declare-fun m!1134123 () Bool)

(assert (=> b!1229571 m!1134123))

(declare-fun m!1134125 () Bool)

(assert (=> b!1229568 m!1134125))

(assert (=> b!1229562 m!1134099))

(assert (=> b!1229562 m!1134099))

(declare-fun m!1134127 () Bool)

(assert (=> b!1229562 m!1134127))

(check-sat (not b!1229569) (not b!1229572) (not start!102152) (not b!1229566) (not b!1229570) (not b!1229563) (not b!1229562) (not b!1229573) (not b!1229560) (not b!1229565) (not b!1229564) (not b!1229567) (not b!1229571) (not b!1229568))
(check-sat)
