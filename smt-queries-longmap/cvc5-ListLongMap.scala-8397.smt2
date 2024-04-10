; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102162 () Bool)

(assert start!102162)

(declare-fun b!1229770 () Bool)

(declare-fun res!818267 () Bool)

(declare-fun e!697910 () Bool)

(assert (=> b!1229770 (=> (not res!818267) (not e!697910))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229770 (= res!818267 (validKeyInArray!0 k!2913))))

(declare-fun b!1229771 () Bool)

(declare-fun res!818262 () Bool)

(assert (=> b!1229771 (=> (not res!818262) (not e!697910))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79337 0))(
  ( (array!79338 (arr!38288 (Array (_ BitVec 32) (_ BitVec 64))) (size!38824 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79337)

(assert (=> b!1229771 (= res!818262 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38824 a!3806)) (bvslt from!3184 (size!38824 a!3806))))))

(declare-fun res!818268 () Bool)

(assert (=> start!102162 (=> (not res!818268) (not e!697910))))

(assert (=> start!102162 (= res!818268 (bvslt (size!38824 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102162 e!697910))

(declare-fun array_inv!29136 (array!79337) Bool)

(assert (=> start!102162 (array_inv!29136 a!3806)))

(assert (=> start!102162 true))

(declare-fun b!1229772 () Bool)

(declare-fun res!818261 () Bool)

(declare-fun e!697909 () Bool)

(assert (=> b!1229772 (=> res!818261 e!697909)))

(declare-datatypes ((List!27061 0))(
  ( (Nil!27058) (Cons!27057 (h!28266 (_ BitVec 64)) (t!40524 List!27061)) )
))
(declare-fun lt!559251 () List!27061)

(declare-fun contains!7123 (List!27061 (_ BitVec 64)) Bool)

(assert (=> b!1229772 (= res!818261 (contains!7123 lt!559251 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229773 () Bool)

(declare-fun res!818256 () Bool)

(assert (=> b!1229773 (=> res!818256 e!697909)))

(assert (=> b!1229773 (= res!818256 (contains!7123 lt!559251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229774 () Bool)

(declare-fun res!818257 () Bool)

(assert (=> b!1229774 (=> (not res!818257) (not e!697910))))

(declare-fun acc!823 () List!27061)

(declare-fun arrayNoDuplicates!0 (array!79337 (_ BitVec 32) List!27061) Bool)

(assert (=> b!1229774 (= res!818257 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229775 () Bool)

(declare-fun res!818265 () Bool)

(assert (=> b!1229775 (=> (not res!818265) (not e!697910))))

(declare-fun arrayContainsKey!0 (array!79337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229775 (= res!818265 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229776 () Bool)

(declare-fun res!818259 () Bool)

(assert (=> b!1229776 (=> (not res!818259) (not e!697910))))

(assert (=> b!1229776 (= res!818259 (not (contains!7123 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229777 () Bool)

(assert (=> b!1229777 (= e!697909 true)))

(declare-fun lt!559252 () Bool)

(assert (=> b!1229777 (= lt!559252 (contains!7123 lt!559251 (select (arr!38288 a!3806) from!3184)))))

(declare-fun b!1229778 () Bool)

(declare-fun res!818269 () Bool)

(assert (=> b!1229778 (=> (not res!818269) (not e!697910))))

(assert (=> b!1229778 (= res!818269 (not (contains!7123 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229779 () Bool)

(declare-fun res!818263 () Bool)

(assert (=> b!1229779 (=> (not res!818263) (not e!697910))))

(assert (=> b!1229779 (= res!818263 (validKeyInArray!0 (select (arr!38288 a!3806) from!3184)))))

(declare-fun b!1229780 () Bool)

(declare-fun res!818258 () Bool)

(assert (=> b!1229780 (=> (not res!818258) (not e!697910))))

(declare-fun noDuplicate!1720 (List!27061) Bool)

(assert (=> b!1229780 (= res!818258 (noDuplicate!1720 acc!823))))

(declare-fun b!1229781 () Bool)

(assert (=> b!1229781 (= e!697910 (not e!697909))))

(declare-fun res!818264 () Bool)

(assert (=> b!1229781 (=> res!818264 e!697909)))

(assert (=> b!1229781 (= res!818264 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229781 (= lt!559251 (Cons!27057 (select (arr!38288 a!3806) from!3184) Nil!27058))))

(declare-fun e!697911 () Bool)

(assert (=> b!1229781 e!697911))

(declare-fun res!818266 () Bool)

(assert (=> b!1229781 (=> (not res!818266) (not e!697911))))

(assert (=> b!1229781 (= res!818266 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27058))))

(declare-datatypes ((Unit!40742 0))(
  ( (Unit!40743) )
))
(declare-fun lt!559253 () Unit!40742)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79337 List!27061 List!27061 (_ BitVec 32)) Unit!40742)

(assert (=> b!1229781 (= lt!559253 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27058 from!3184))))

(assert (=> b!1229781 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27057 (select (arr!38288 a!3806) from!3184) acc!823))))

(declare-fun b!1229782 () Bool)

(assert (=> b!1229782 (= e!697911 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27057 (select (arr!38288 a!3806) from!3184) Nil!27058)))))

(declare-fun b!1229783 () Bool)

(declare-fun res!818260 () Bool)

(assert (=> b!1229783 (=> res!818260 e!697909)))

(assert (=> b!1229783 (= res!818260 (not (noDuplicate!1720 lt!559251)))))

(assert (= (and start!102162 res!818268) b!1229770))

(assert (= (and b!1229770 res!818267) b!1229771))

(assert (= (and b!1229771 res!818262) b!1229780))

(assert (= (and b!1229780 res!818258) b!1229778))

(assert (= (and b!1229778 res!818269) b!1229776))

(assert (= (and b!1229776 res!818259) b!1229775))

(assert (= (and b!1229775 res!818265) b!1229774))

(assert (= (and b!1229774 res!818257) b!1229779))

(assert (= (and b!1229779 res!818263) b!1229781))

(assert (= (and b!1229781 res!818266) b!1229782))

(assert (= (and b!1229781 (not res!818264)) b!1229783))

(assert (= (and b!1229783 (not res!818260)) b!1229773))

(assert (= (and b!1229773 (not res!818256)) b!1229772))

(assert (= (and b!1229772 (not res!818261)) b!1229777))

(declare-fun m!1134265 () Bool)

(assert (=> b!1229772 m!1134265))

(declare-fun m!1134267 () Bool)

(assert (=> b!1229780 m!1134267))

(declare-fun m!1134269 () Bool)

(assert (=> b!1229782 m!1134269))

(declare-fun m!1134271 () Bool)

(assert (=> b!1229782 m!1134271))

(declare-fun m!1134273 () Bool)

(assert (=> b!1229775 m!1134273))

(declare-fun m!1134275 () Bool)

(assert (=> b!1229774 m!1134275))

(assert (=> b!1229779 m!1134269))

(assert (=> b!1229779 m!1134269))

(declare-fun m!1134277 () Bool)

(assert (=> b!1229779 m!1134277))

(declare-fun m!1134279 () Bool)

(assert (=> b!1229773 m!1134279))

(declare-fun m!1134281 () Bool)

(assert (=> b!1229783 m!1134281))

(assert (=> b!1229781 m!1134269))

(declare-fun m!1134283 () Bool)

(assert (=> b!1229781 m!1134283))

(declare-fun m!1134285 () Bool)

(assert (=> b!1229781 m!1134285))

(declare-fun m!1134287 () Bool)

(assert (=> b!1229781 m!1134287))

(declare-fun m!1134289 () Bool)

(assert (=> b!1229776 m!1134289))

(declare-fun m!1134291 () Bool)

(assert (=> b!1229778 m!1134291))

(declare-fun m!1134293 () Bool)

(assert (=> b!1229770 m!1134293))

(declare-fun m!1134295 () Bool)

(assert (=> start!102162 m!1134295))

(assert (=> b!1229777 m!1134269))

(assert (=> b!1229777 m!1134269))

(declare-fun m!1134297 () Bool)

(assert (=> b!1229777 m!1134297))

(push 1)

(assert (not b!1229775))

(assert (not b!1229782))

(assert (not b!1229774))

(assert (not b!1229773))

(assert (not b!1229770))

(assert (not b!1229781))

(assert (not b!1229778))

(assert (not start!102162))

(assert (not b!1229777))

(assert (not b!1229780))

(assert (not b!1229779))

(assert (not b!1229772))

(assert (not b!1229776))

(assert (not b!1229783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

