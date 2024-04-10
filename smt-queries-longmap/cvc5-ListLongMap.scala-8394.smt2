; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102144 () Bool)

(assert start!102144)

(declare-fun b!1229392 () Bool)

(declare-fun e!697803 () Bool)

(declare-fun e!697801 () Bool)

(assert (=> b!1229392 (= e!697803 (not e!697801))))

(declare-fun res!817886 () Bool)

(assert (=> b!1229392 (=> res!817886 e!697801)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229392 (= res!817886 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27052 0))(
  ( (Nil!27049) (Cons!27048 (h!28257 (_ BitVec 64)) (t!40515 List!27052)) )
))
(declare-fun lt!559170 () List!27052)

(declare-datatypes ((array!79319 0))(
  ( (array!79320 (arr!38279 (Array (_ BitVec 32) (_ BitVec 64))) (size!38815 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79319)

(assert (=> b!1229392 (= lt!559170 (Cons!27048 (select (arr!38279 a!3806) from!3184) Nil!27049))))

(declare-fun e!697802 () Bool)

(assert (=> b!1229392 e!697802))

(declare-fun res!817889 () Bool)

(assert (=> b!1229392 (=> (not res!817889) (not e!697802))))

(declare-fun arrayNoDuplicates!0 (array!79319 (_ BitVec 32) List!27052) Bool)

(assert (=> b!1229392 (= res!817889 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27049))))

(declare-datatypes ((Unit!40724 0))(
  ( (Unit!40725) )
))
(declare-fun lt!559171 () Unit!40724)

(declare-fun acc!823 () List!27052)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79319 List!27052 List!27052 (_ BitVec 32)) Unit!40724)

(assert (=> b!1229392 (= lt!559171 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27049 from!3184))))

(assert (=> b!1229392 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27048 (select (arr!38279 a!3806) from!3184) acc!823))))

(declare-fun b!1229393 () Bool)

(declare-fun res!817885 () Bool)

(assert (=> b!1229393 (=> (not res!817885) (not e!697803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229393 (= res!817885 (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229394 () Bool)

(declare-fun res!817881 () Bool)

(assert (=> b!1229394 (=> res!817881 e!697801)))

(declare-fun noDuplicate!1711 (List!27052) Bool)

(assert (=> b!1229394 (= res!817881 (not (noDuplicate!1711 lt!559170)))))

(declare-fun b!1229395 () Bool)

(declare-fun res!817880 () Bool)

(assert (=> b!1229395 (=> (not res!817880) (not e!697803))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229395 (= res!817880 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229396 () Bool)

(declare-fun res!817890 () Bool)

(assert (=> b!1229396 (=> (not res!817890) (not e!697803))))

(assert (=> b!1229396 (= res!817890 (noDuplicate!1711 acc!823))))

(declare-fun b!1229397 () Bool)

(declare-fun res!817878 () Bool)

(assert (=> b!1229397 (=> (not res!817878) (not e!697803))))

(assert (=> b!1229397 (= res!817878 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38815 a!3806)) (bvslt from!3184 (size!38815 a!3806))))))

(declare-fun b!1229398 () Bool)

(declare-fun res!817883 () Bool)

(assert (=> b!1229398 (=> (not res!817883) (not e!697803))))

(declare-fun contains!7114 (List!27052 (_ BitVec 64)) Bool)

(assert (=> b!1229398 (= res!817883 (not (contains!7114 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229399 () Bool)

(declare-fun res!817888 () Bool)

(assert (=> b!1229399 (=> res!817888 e!697801)))

(assert (=> b!1229399 (= res!817888 (contains!7114 lt!559170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!817887 () Bool)

(assert (=> start!102144 (=> (not res!817887) (not e!697803))))

(assert (=> start!102144 (= res!817887 (bvslt (size!38815 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102144 e!697803))

(declare-fun array_inv!29127 (array!79319) Bool)

(assert (=> start!102144 (array_inv!29127 a!3806)))

(assert (=> start!102144 true))

(declare-fun b!1229400 () Bool)

(declare-fun res!817884 () Bool)

(assert (=> b!1229400 (=> (not res!817884) (not e!697803))))

(assert (=> b!1229400 (= res!817884 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229401 () Bool)

(declare-fun res!817879 () Bool)

(assert (=> b!1229401 (=> (not res!817879) (not e!697803))))

(assert (=> b!1229401 (= res!817879 (not (contains!7114 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229402 () Bool)

(assert (=> b!1229402 (= e!697802 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27048 (select (arr!38279 a!3806) from!3184) Nil!27049)))))

(declare-fun b!1229403 () Bool)

(assert (=> b!1229403 (= e!697801 true)))

(declare-fun lt!559172 () Bool)

(assert (=> b!1229403 (= lt!559172 (contains!7114 lt!559170 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229404 () Bool)

(declare-fun res!817882 () Bool)

(assert (=> b!1229404 (=> (not res!817882) (not e!697803))))

(assert (=> b!1229404 (= res!817882 (validKeyInArray!0 k!2913))))

(declare-fun b!1229405 () Bool)

(declare-fun res!817891 () Bool)

(assert (=> b!1229405 (=> res!817891 e!697801)))

(assert (=> b!1229405 (= res!817891 (contains!7114 lt!559170 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102144 res!817887) b!1229404))

(assert (= (and b!1229404 res!817882) b!1229397))

(assert (= (and b!1229397 res!817878) b!1229396))

(assert (= (and b!1229396 res!817890) b!1229398))

(assert (= (and b!1229398 res!817883) b!1229401))

(assert (= (and b!1229401 res!817879) b!1229395))

(assert (= (and b!1229395 res!817880) b!1229400))

(assert (= (and b!1229400 res!817884) b!1229393))

(assert (= (and b!1229393 res!817885) b!1229392))

(assert (= (and b!1229392 res!817889) b!1229402))

(assert (= (and b!1229392 (not res!817886)) b!1229394))

(assert (= (and b!1229394 (not res!817881)) b!1229399))

(assert (= (and b!1229399 (not res!817888)) b!1229405))

(assert (= (and b!1229405 (not res!817891)) b!1229403))

(declare-fun m!1133959 () Bool)

(assert (=> b!1229394 m!1133959))

(declare-fun m!1133961 () Bool)

(assert (=> b!1229393 m!1133961))

(assert (=> b!1229393 m!1133961))

(declare-fun m!1133963 () Bool)

(assert (=> b!1229393 m!1133963))

(declare-fun m!1133965 () Bool)

(assert (=> b!1229399 m!1133965))

(declare-fun m!1133967 () Bool)

(assert (=> b!1229395 m!1133967))

(declare-fun m!1133969 () Bool)

(assert (=> b!1229401 m!1133969))

(declare-fun m!1133971 () Bool)

(assert (=> b!1229405 m!1133971))

(assert (=> b!1229392 m!1133961))

(declare-fun m!1133973 () Bool)

(assert (=> b!1229392 m!1133973))

(declare-fun m!1133975 () Bool)

(assert (=> b!1229392 m!1133975))

(declare-fun m!1133977 () Bool)

(assert (=> b!1229392 m!1133977))

(assert (=> b!1229402 m!1133961))

(declare-fun m!1133979 () Bool)

(assert (=> b!1229402 m!1133979))

(assert (=> b!1229403 m!1133961))

(assert (=> b!1229403 m!1133961))

(declare-fun m!1133981 () Bool)

(assert (=> b!1229403 m!1133981))

(declare-fun m!1133983 () Bool)

(assert (=> b!1229398 m!1133983))

(declare-fun m!1133985 () Bool)

(assert (=> b!1229400 m!1133985))

(declare-fun m!1133987 () Bool)

(assert (=> start!102144 m!1133987))

(declare-fun m!1133989 () Bool)

(assert (=> b!1229404 m!1133989))

(declare-fun m!1133991 () Bool)

(assert (=> b!1229396 m!1133991))

(push 1)

(assert (not start!102144))

(assert (not b!1229404))

(assert (not b!1229402))

(assert (not b!1229394))

(assert (not b!1229396))

(assert (not b!1229401))

(assert (not b!1229405))

(assert (not b!1229395))

(assert (not b!1229399))

(assert (not b!1229400))

(assert (not b!1229392))

(assert (not b!1229393))

(assert (not b!1229398))

(assert (not b!1229403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

