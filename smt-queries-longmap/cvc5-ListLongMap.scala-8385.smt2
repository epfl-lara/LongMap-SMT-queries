; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102226 () Bool)

(assert start!102226)

(declare-fun b!1229275 () Bool)

(declare-fun res!817116 () Bool)

(declare-fun e!697941 () Bool)

(assert (=> b!1229275 (=> (not res!817116) (not e!697941))))

(declare-datatypes ((array!79299 0))(
  ( (array!79300 (arr!38266 (Array (_ BitVec 32) (_ BitVec 64))) (size!38803 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79299)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229275 (= res!817116 (validKeyInArray!0 (select (arr!38266 a!3806) from!3184)))))

(declare-fun b!1229277 () Bool)

(declare-fun res!817111 () Bool)

(assert (=> b!1229277 (=> (not res!817111) (not e!697941))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229277 (= res!817111 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229278 () Bool)

(declare-fun res!817117 () Bool)

(assert (=> b!1229278 (=> (not res!817117) (not e!697941))))

(assert (=> b!1229278 (= res!817117 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38803 a!3806)) (bvslt from!3184 (size!38803 a!3806))))))

(declare-fun b!1229279 () Bool)

(declare-fun res!817114 () Bool)

(assert (=> b!1229279 (=> (not res!817114) (not e!697941))))

(declare-datatypes ((List!27052 0))(
  ( (Nil!27049) (Cons!27048 (h!28266 (_ BitVec 64)) (t!40507 List!27052)) )
))
(declare-fun acc!823 () List!27052)

(declare-fun noDuplicate!1704 (List!27052) Bool)

(assert (=> b!1229279 (= res!817114 (noDuplicate!1704 acc!823))))

(declare-fun b!1229280 () Bool)

(declare-fun res!817110 () Bool)

(assert (=> b!1229280 (=> (not res!817110) (not e!697941))))

(declare-fun arrayNoDuplicates!0 (array!79299 (_ BitVec 32) List!27052) Bool)

(assert (=> b!1229280 (= res!817110 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229281 () Bool)

(declare-fun res!817106 () Bool)

(assert (=> b!1229281 (=> (not res!817106) (not e!697941))))

(declare-fun contains!7123 (List!27052 (_ BitVec 64)) Bool)

(assert (=> b!1229281 (= res!817106 (not (contains!7123 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229282 () Bool)

(declare-fun res!817118 () Bool)

(assert (=> b!1229282 (=> (not res!817118) (not e!697941))))

(assert (=> b!1229282 (= res!817118 (not (contains!7123 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229283 () Bool)

(declare-fun res!817115 () Bool)

(declare-fun e!697943 () Bool)

(assert (=> b!1229283 (=> res!817115 e!697943)))

(assert (=> b!1229283 (= res!817115 (contains!7123 Nil!27049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!817112 () Bool)

(assert (=> start!102226 (=> (not res!817112) (not e!697941))))

(assert (=> start!102226 (= res!817112 (bvslt (size!38803 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102226 e!697941))

(declare-fun array_inv!29204 (array!79299) Bool)

(assert (=> start!102226 (array_inv!29204 a!3806)))

(assert (=> start!102226 true))

(declare-fun b!1229276 () Bool)

(declare-fun res!817113 () Bool)

(assert (=> b!1229276 (=> res!817113 e!697943)))

(assert (=> b!1229276 (= res!817113 (contains!7123 Nil!27049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229284 () Bool)

(declare-fun res!817107 () Bool)

(assert (=> b!1229284 (=> (not res!817107) (not e!697941))))

(assert (=> b!1229284 (= res!817107 (validKeyInArray!0 k!2913))))

(declare-fun b!1229285 () Bool)

(assert (=> b!1229285 (= e!697941 (not e!697943))))

(declare-fun res!817108 () Bool)

(assert (=> b!1229285 (=> res!817108 e!697943)))

(assert (=> b!1229285 (= res!817108 (bvsgt from!3184 (size!38803 a!3806)))))

(assert (=> b!1229285 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27048 (select (arr!38266 a!3806) from!3184) acc!823))))

(declare-fun b!1229286 () Bool)

(declare-fun res!817109 () Bool)

(assert (=> b!1229286 (=> res!817109 e!697943)))

(declare-fun subseq!493 (List!27052 List!27052) Bool)

(assert (=> b!1229286 (= res!817109 (not (subseq!493 Nil!27049 acc!823)))))

(declare-fun b!1229287 () Bool)

(assert (=> b!1229287 (= e!697943 true)))

(declare-datatypes ((Unit!40647 0))(
  ( (Unit!40648) )
))
(declare-fun lt!559437 () Unit!40647)

(declare-fun noDuplicateSubseq!46 (List!27052 List!27052) Unit!40647)

(assert (=> b!1229287 (= lt!559437 (noDuplicateSubseq!46 Nil!27049 acc!823))))

(assert (= (and start!102226 res!817112) b!1229284))

(assert (= (and b!1229284 res!817107) b!1229278))

(assert (= (and b!1229278 res!817117) b!1229279))

(assert (= (and b!1229279 res!817114) b!1229282))

(assert (= (and b!1229282 res!817118) b!1229281))

(assert (= (and b!1229281 res!817106) b!1229277))

(assert (= (and b!1229277 res!817111) b!1229280))

(assert (= (and b!1229280 res!817110) b!1229275))

(assert (= (and b!1229275 res!817116) b!1229285))

(assert (= (and b!1229285 (not res!817108)) b!1229276))

(assert (= (and b!1229276 (not res!817113)) b!1229283))

(assert (= (and b!1229283 (not res!817115)) b!1229286))

(assert (= (and b!1229286 (not res!817109)) b!1229287))

(declare-fun m!1134209 () Bool)

(assert (=> b!1229284 m!1134209))

(declare-fun m!1134211 () Bool)

(assert (=> start!102226 m!1134211))

(declare-fun m!1134213 () Bool)

(assert (=> b!1229280 m!1134213))

(declare-fun m!1134215 () Bool)

(assert (=> b!1229286 m!1134215))

(declare-fun m!1134217 () Bool)

(assert (=> b!1229281 m!1134217))

(declare-fun m!1134219 () Bool)

(assert (=> b!1229275 m!1134219))

(assert (=> b!1229275 m!1134219))

(declare-fun m!1134221 () Bool)

(assert (=> b!1229275 m!1134221))

(declare-fun m!1134223 () Bool)

(assert (=> b!1229287 m!1134223))

(declare-fun m!1134225 () Bool)

(assert (=> b!1229279 m!1134225))

(assert (=> b!1229285 m!1134219))

(declare-fun m!1134227 () Bool)

(assert (=> b!1229285 m!1134227))

(declare-fun m!1134229 () Bool)

(assert (=> b!1229282 m!1134229))

(declare-fun m!1134231 () Bool)

(assert (=> b!1229277 m!1134231))

(declare-fun m!1134233 () Bool)

(assert (=> b!1229276 m!1134233))

(declare-fun m!1134235 () Bool)

(assert (=> b!1229283 m!1134235))

(push 1)

(assert (not start!102226))

(assert (not b!1229277))

(assert (not b!1229280))

(assert (not b!1229284))

(assert (not b!1229279))

(assert (not b!1229283))

(assert (not b!1229282))

(assert (not b!1229287))

(assert (not b!1229276))

(assert (not b!1229275))

(assert (not b!1229281))

(assert (not b!1229286))

(assert (not b!1229285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

