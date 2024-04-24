; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102424 () Bool)

(assert start!102424)

(declare-fun b!1231492 () Bool)

(declare-fun e!698891 () Bool)

(assert (=> b!1231492 (= e!698891 (not true))))

(declare-datatypes ((array!79395 0))(
  ( (array!79396 (arr!38311 (Array (_ BitVec 32) (_ BitVec 64))) (size!38848 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79395)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231492 (not (arrayContainsKey!0 a!3806 (select (arr!38311 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40737 0))(
  ( (Unit!40738) )
))
(declare-fun lt!559820 () Unit!40737)

(declare-datatypes ((List!27097 0))(
  ( (Nil!27094) (Cons!27093 (h!28311 (_ BitVec 64)) (t!40552 List!27097)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79395 (_ BitVec 32) (_ BitVec 64) List!27097) Unit!40737)

(assert (=> b!1231492 (= lt!559820 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38311 a!3806) from!3184) (Cons!27093 (select (arr!38311 a!3806) from!3184) Nil!27094)))))

(declare-fun e!698889 () Bool)

(assert (=> b!1231492 e!698889))

(declare-fun res!819192 () Bool)

(assert (=> b!1231492 (=> (not res!819192) (not e!698889))))

(declare-fun arrayNoDuplicates!0 (array!79395 (_ BitVec 32) List!27097) Bool)

(assert (=> b!1231492 (= res!819192 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27094))))

(declare-fun lt!559821 () Unit!40737)

(declare-fun acc!823 () List!27097)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79395 List!27097 List!27097 (_ BitVec 32)) Unit!40737)

(assert (=> b!1231492 (= lt!559821 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27094 from!3184))))

(assert (=> b!1231492 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27093 (select (arr!38311 a!3806) from!3184) acc!823))))

(declare-fun b!1231493 () Bool)

(declare-fun res!819193 () Bool)

(assert (=> b!1231493 (=> (not res!819193) (not e!698891))))

(declare-fun contains!7168 (List!27097 (_ BitVec 64)) Bool)

(assert (=> b!1231493 (= res!819193 (not (contains!7168 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231494 () Bool)

(declare-fun res!819185 () Bool)

(assert (=> b!1231494 (=> (not res!819185) (not e!698891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231494 (= res!819185 (validKeyInArray!0 (select (arr!38311 a!3806) from!3184)))))

(declare-fun b!1231495 () Bool)

(declare-fun res!819190 () Bool)

(assert (=> b!1231495 (=> (not res!819190) (not e!698891))))

(assert (=> b!1231495 (= res!819190 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38848 a!3806)) (bvslt from!3184 (size!38848 a!3806))))))

(declare-fun b!1231496 () Bool)

(declare-fun res!819188 () Bool)

(assert (=> b!1231496 (=> (not res!819188) (not e!698891))))

(assert (=> b!1231496 (= res!819188 (not (contains!7168 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231497 () Bool)

(declare-fun res!819187 () Bool)

(assert (=> b!1231497 (=> (not res!819187) (not e!698891))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1231497 (= res!819187 (validKeyInArray!0 k!2913))))

(declare-fun b!1231498 () Bool)

(declare-fun res!819186 () Bool)

(assert (=> b!1231498 (=> (not res!819186) (not e!698891))))

(assert (=> b!1231498 (= res!819186 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231500 () Bool)

(declare-fun res!819194 () Bool)

(assert (=> b!1231500 (=> (not res!819194) (not e!698891))))

(assert (=> b!1231500 (= res!819194 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231501 () Bool)

(declare-fun res!819189 () Bool)

(assert (=> b!1231501 (=> (not res!819189) (not e!698891))))

(declare-fun noDuplicate!1749 (List!27097) Bool)

(assert (=> b!1231501 (= res!819189 (noDuplicate!1749 acc!823))))

(declare-fun res!819191 () Bool)

(assert (=> start!102424 (=> (not res!819191) (not e!698891))))

(assert (=> start!102424 (= res!819191 (bvslt (size!38848 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102424 e!698891))

(declare-fun array_inv!29249 (array!79395) Bool)

(assert (=> start!102424 (array_inv!29249 a!3806)))

(assert (=> start!102424 true))

(declare-fun b!1231499 () Bool)

(assert (=> b!1231499 (= e!698889 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27093 (select (arr!38311 a!3806) from!3184) Nil!27094)))))

(assert (= (and start!102424 res!819191) b!1231497))

(assert (= (and b!1231497 res!819187) b!1231495))

(assert (= (and b!1231495 res!819190) b!1231501))

(assert (= (and b!1231501 res!819189) b!1231496))

(assert (= (and b!1231496 res!819188) b!1231493))

(assert (= (and b!1231493 res!819193) b!1231500))

(assert (= (and b!1231500 res!819194) b!1231498))

(assert (= (and b!1231498 res!819186) b!1231494))

(assert (= (and b!1231494 res!819185) b!1231492))

(assert (= (and b!1231492 res!819192) b!1231499))

(declare-fun m!1136277 () Bool)

(assert (=> b!1231498 m!1136277))

(declare-fun m!1136279 () Bool)

(assert (=> b!1231492 m!1136279))

(declare-fun m!1136281 () Bool)

(assert (=> b!1231492 m!1136281))

(declare-fun m!1136283 () Bool)

(assert (=> b!1231492 m!1136283))

(declare-fun m!1136285 () Bool)

(assert (=> b!1231492 m!1136285))

(assert (=> b!1231492 m!1136283))

(declare-fun m!1136287 () Bool)

(assert (=> b!1231492 m!1136287))

(assert (=> b!1231492 m!1136283))

(declare-fun m!1136289 () Bool)

(assert (=> b!1231492 m!1136289))

(declare-fun m!1136291 () Bool)

(assert (=> b!1231500 m!1136291))

(declare-fun m!1136293 () Bool)

(assert (=> b!1231493 m!1136293))

(assert (=> b!1231494 m!1136283))

(assert (=> b!1231494 m!1136283))

(declare-fun m!1136295 () Bool)

(assert (=> b!1231494 m!1136295))

(declare-fun m!1136297 () Bool)

(assert (=> b!1231501 m!1136297))

(declare-fun m!1136299 () Bool)

(assert (=> start!102424 m!1136299))

(assert (=> b!1231499 m!1136283))

(declare-fun m!1136301 () Bool)

(assert (=> b!1231499 m!1136301))

(declare-fun m!1136303 () Bool)

(assert (=> b!1231496 m!1136303))

(declare-fun m!1136305 () Bool)

(assert (=> b!1231497 m!1136305))

(push 1)

(assert (not b!1231499))

(assert (not b!1231498))

(assert (not b!1231494))

(assert (not start!102424))

(assert (not b!1231492))

(assert (not b!1231497))

(assert (not b!1231496))

(assert (not b!1231501))

(assert (not b!1231500))

(assert (not b!1231493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

