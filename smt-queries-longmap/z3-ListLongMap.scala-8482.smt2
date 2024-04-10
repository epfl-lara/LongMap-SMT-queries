; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103412 () Bool)

(assert start!103412)

(declare-fun res!827433 () Bool)

(declare-fun e!702879 () Bool)

(assert (=> start!103412 (=> (not res!827433) (not e!702879))))

(declare-datatypes ((array!79894 0))(
  ( (array!79895 (arr!38544 (Array (_ BitVec 32) (_ BitVec 64))) (size!39080 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79894)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103412 (= res!827433 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39080 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39080 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103412 e!702879))

(assert (=> start!103412 true))

(declare-fun array_inv!29392 (array!79894) Bool)

(assert (=> start!103412 (array_inv!29392 a!3575)))

(declare-fun b!1240147 () Bool)

(declare-fun res!827432 () Bool)

(assert (=> b!1240147 (=> (not res!827432) (not e!702879))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240147 (= res!827432 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240145 () Bool)

(declare-fun res!827431 () Bool)

(assert (=> b!1240145 (=> (not res!827431) (not e!702879))))

(assert (=> b!1240145 (= res!827431 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240148 () Bool)

(assert (=> b!1240148 (= e!702879 (not true))))

(assert (=> b!1240148 (arrayContainsKey!0 a!3575 k0!2808 newFrom!281)))

(declare-datatypes ((Unit!41209 0))(
  ( (Unit!41210) )
))
(declare-fun lt!561893 () Unit!41209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79894 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41209)

(assert (=> b!1240148 (= lt!561893 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240146 () Bool)

(declare-fun res!827434 () Bool)

(assert (=> b!1240146 (=> (not res!827434) (not e!702879))))

(assert (=> b!1240146 (= res!827434 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39080 a!3575))))))

(assert (= (and start!103412 res!827433) b!1240145))

(assert (= (and b!1240145 res!827431) b!1240146))

(assert (= (and b!1240146 res!827434) b!1240147))

(assert (= (and b!1240147 res!827432) b!1240148))

(declare-fun m!1143509 () Bool)

(assert (=> start!103412 m!1143509))

(declare-fun m!1143511 () Bool)

(assert (=> b!1240147 m!1143511))

(declare-fun m!1143513 () Bool)

(assert (=> b!1240145 m!1143513))

(declare-fun m!1143515 () Bool)

(assert (=> b!1240148 m!1143515))

(declare-fun m!1143517 () Bool)

(assert (=> b!1240148 m!1143517))

(check-sat (not b!1240148) (not start!103412) (not b!1240147) (not b!1240145))
