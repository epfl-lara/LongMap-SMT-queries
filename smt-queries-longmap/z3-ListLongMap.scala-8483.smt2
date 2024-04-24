; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103654 () Bool)

(assert start!103654)

(declare-fun b!1241496 () Bool)

(declare-fun e!703754 () Bool)

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-datatypes ((array!79934 0))(
  ( (array!79935 (arr!38558 (Array (_ BitVec 32) (_ BitVec 64))) (size!39095 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79934)

(assert (=> b!1241496 (= e!703754 (not (bvslt newFrom!281 (size!39095 a!3575))))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241496 (arrayContainsKey!0 a!3575 k0!2808 newFrom!281)))

(declare-datatypes ((Unit!41186 0))(
  ( (Unit!41187) )
))
(declare-fun lt!562385 () Unit!41186)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79934 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41186)

(assert (=> b!1241496 (= lt!562385 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1241494 () Bool)

(declare-fun res!827988 () Bool)

(assert (=> b!1241494 (=> (not res!827988) (not e!703754))))

(assert (=> b!1241494 (= res!827988 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39095 a!3575))))))

(declare-fun b!1241493 () Bool)

(declare-fun res!827991 () Bool)

(assert (=> b!1241493 (=> (not res!827991) (not e!703754))))

(assert (=> b!1241493 (= res!827991 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun res!827989 () Bool)

(assert (=> start!103654 (=> (not res!827989) (not e!703754))))

(assert (=> start!103654 (= res!827989 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39095 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39095 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103654 e!703754))

(assert (=> start!103654 true))

(declare-fun array_inv!29496 (array!79934) Bool)

(assert (=> start!103654 (array_inv!29496 a!3575)))

(declare-fun b!1241495 () Bool)

(declare-fun res!827990 () Bool)

(assert (=> b!1241495 (=> (not res!827990) (not e!703754))))

(assert (=> b!1241495 (= res!827990 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(assert (= (and start!103654 res!827989) b!1241493))

(assert (= (and b!1241493 res!827991) b!1241494))

(assert (= (and b!1241494 res!827988) b!1241495))

(assert (= (and b!1241495 res!827990) b!1241496))

(declare-fun m!1145177 () Bool)

(assert (=> b!1241496 m!1145177))

(declare-fun m!1145179 () Bool)

(assert (=> b!1241496 m!1145179))

(declare-fun m!1145181 () Bool)

(assert (=> b!1241493 m!1145181))

(declare-fun m!1145183 () Bool)

(assert (=> start!103654 m!1145183))

(declare-fun m!1145185 () Bool)

(assert (=> b!1241495 m!1145185))

(check-sat (not b!1241493) (not b!1241496) (not start!103654) (not b!1241495))
(check-sat)
