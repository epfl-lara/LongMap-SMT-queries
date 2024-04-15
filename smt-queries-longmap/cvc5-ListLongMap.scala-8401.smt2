; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102188 () Bool)

(assert start!102188)

(declare-fun b!1230186 () Bool)

(declare-fun res!818717 () Bool)

(declare-fun e!698017 () Bool)

(assert (=> b!1230186 (=> (not res!818717) (not e!698017))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79286 0))(
  ( (array!79287 (arr!38263 (Array (_ BitVec 32) (_ BitVec 64))) (size!38801 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79286)

(assert (=> b!1230186 (= res!818717 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38801 a!3806)) (bvslt from!3184 (size!38801 a!3806))))))

(declare-fun b!1230187 () Bool)

(declare-fun e!698018 () Bool)

(declare-datatypes ((List!27137 0))(
  ( (Nil!27134) (Cons!27133 (h!28342 (_ BitVec 64)) (t!40591 List!27137)) )
))
(declare-fun arrayNoDuplicates!0 (array!79286 (_ BitVec 32) List!27137) Bool)

(assert (=> b!1230187 (= e!698018 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38263 a!3806) from!3184) Nil!27134)))))

(declare-fun b!1230188 () Bool)

(assert (=> b!1230188 (= e!698017 (not true))))

(declare-fun arrayContainsKey!0 (array!79286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230188 (not (arrayContainsKey!0 a!3806 (select (arr!38263 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40617 0))(
  ( (Unit!40618) )
))
(declare-fun lt!559178 () Unit!40617)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79286 (_ BitVec 32) (_ BitVec 64) List!27137) Unit!40617)

(assert (=> b!1230188 (= lt!559178 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38263 a!3806) from!3184) (Cons!27133 (select (arr!38263 a!3806) from!3184) Nil!27134)))))

(assert (=> b!1230188 e!698018))

(declare-fun res!818716 () Bool)

(assert (=> b!1230188 (=> (not res!818716) (not e!698018))))

(assert (=> b!1230188 (= res!818716 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27134))))

(declare-fun acc!823 () List!27137)

(declare-fun lt!559177 () Unit!40617)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79286 List!27137 List!27137 (_ BitVec 32)) Unit!40617)

(assert (=> b!1230188 (= lt!559177 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27134 from!3184))))

(assert (=> b!1230188 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38263 a!3806) from!3184) acc!823))))

(declare-fun b!1230189 () Bool)

(declare-fun res!818714 () Bool)

(assert (=> b!1230189 (=> (not res!818714) (not e!698017))))

(declare-fun contains!7109 (List!27137 (_ BitVec 64)) Bool)

(assert (=> b!1230189 (= res!818714 (not (contains!7109 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818710 () Bool)

(assert (=> start!102188 (=> (not res!818710) (not e!698017))))

(assert (=> start!102188 (= res!818710 (bvslt (size!38801 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102188 e!698017))

(declare-fun array_inv!29246 (array!79286) Bool)

(assert (=> start!102188 (array_inv!29246 a!3806)))

(assert (=> start!102188 true))

(declare-fun b!1230190 () Bool)

(declare-fun res!818709 () Bool)

(assert (=> b!1230190 (=> (not res!818709) (not e!698017))))

(assert (=> b!1230190 (= res!818709 (not (contains!7109 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230191 () Bool)

(declare-fun res!818712 () Bool)

(assert (=> b!1230191 (=> (not res!818712) (not e!698017))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230191 (= res!818712 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230192 () Bool)

(declare-fun res!818713 () Bool)

(assert (=> b!1230192 (=> (not res!818713) (not e!698017))))

(declare-fun noDuplicate!1752 (List!27137) Bool)

(assert (=> b!1230192 (= res!818713 (noDuplicate!1752 acc!823))))

(declare-fun b!1230193 () Bool)

(declare-fun res!818715 () Bool)

(assert (=> b!1230193 (=> (not res!818715) (not e!698017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230193 (= res!818715 (validKeyInArray!0 (select (arr!38263 a!3806) from!3184)))))

(declare-fun b!1230194 () Bool)

(declare-fun res!818711 () Bool)

(assert (=> b!1230194 (=> (not res!818711) (not e!698017))))

(assert (=> b!1230194 (= res!818711 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230195 () Bool)

(declare-fun res!818708 () Bool)

(assert (=> b!1230195 (=> (not res!818708) (not e!698017))))

(assert (=> b!1230195 (= res!818708 (validKeyInArray!0 k!2913))))

(assert (= (and start!102188 res!818710) b!1230195))

(assert (= (and b!1230195 res!818708) b!1230186))

(assert (= (and b!1230186 res!818717) b!1230192))

(assert (= (and b!1230192 res!818713) b!1230190))

(assert (= (and b!1230190 res!818709) b!1230189))

(assert (= (and b!1230189 res!818714) b!1230191))

(assert (= (and b!1230191 res!818712) b!1230194))

(assert (= (and b!1230194 res!818711) b!1230193))

(assert (= (and b!1230193 res!818715) b!1230188))

(assert (= (and b!1230188 res!818716) b!1230187))

(declare-fun m!1134213 () Bool)

(assert (=> b!1230189 m!1134213))

(declare-fun m!1134215 () Bool)

(assert (=> start!102188 m!1134215))

(declare-fun m!1134217 () Bool)

(assert (=> b!1230195 m!1134217))

(declare-fun m!1134219 () Bool)

(assert (=> b!1230190 m!1134219))

(declare-fun m!1134221 () Bool)

(assert (=> b!1230193 m!1134221))

(assert (=> b!1230193 m!1134221))

(declare-fun m!1134223 () Bool)

(assert (=> b!1230193 m!1134223))

(declare-fun m!1134225 () Bool)

(assert (=> b!1230188 m!1134225))

(declare-fun m!1134227 () Bool)

(assert (=> b!1230188 m!1134227))

(assert (=> b!1230188 m!1134221))

(declare-fun m!1134229 () Bool)

(assert (=> b!1230188 m!1134229))

(assert (=> b!1230188 m!1134221))

(declare-fun m!1134231 () Bool)

(assert (=> b!1230188 m!1134231))

(assert (=> b!1230188 m!1134221))

(declare-fun m!1134233 () Bool)

(assert (=> b!1230188 m!1134233))

(declare-fun m!1134235 () Bool)

(assert (=> b!1230192 m!1134235))

(declare-fun m!1134237 () Bool)

(assert (=> b!1230191 m!1134237))

(assert (=> b!1230187 m!1134221))

(declare-fun m!1134239 () Bool)

(assert (=> b!1230187 m!1134239))

(declare-fun m!1134241 () Bool)

(assert (=> b!1230194 m!1134241))

(push 1)

(assert (not b!1230188))

(assert (not b!1230187))

(assert (not b!1230195))

(assert (not b!1230192))

(assert (not b!1230189))

(assert (not start!102188))

(assert (not b!1230194))

(assert (not b!1230191))

(assert (not b!1230190))

(assert (not b!1230193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

