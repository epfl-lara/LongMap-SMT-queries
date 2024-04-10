; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103418 () Bool)

(assert start!103418)

(declare-fun b!1240184 () Bool)

(declare-fun e!702896 () Bool)

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-datatypes ((array!79900 0))(
  ( (array!79901 (arr!38547 (Array (_ BitVec 32) (_ BitVec 64))) (size!39083 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79900)

(assert (=> b!1240184 (= e!702896 (not (bvslt newFrom!281 (size!39083 a!3575))))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240184 (arrayContainsKey!0 a!3575 k0!2808 newFrom!281)))

(declare-datatypes ((Unit!41215 0))(
  ( (Unit!41216) )
))
(declare-fun lt!561902 () Unit!41215)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79900 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41215)

(assert (=> b!1240184 (= lt!561902 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240181 () Bool)

(declare-fun res!827470 () Bool)

(assert (=> b!1240181 (=> (not res!827470) (not e!702896))))

(assert (=> b!1240181 (= res!827470 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun res!827468 () Bool)

(assert (=> start!103418 (=> (not res!827468) (not e!702896))))

(assert (=> start!103418 (= res!827468 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39083 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39083 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103418 e!702896))

(assert (=> start!103418 true))

(declare-fun array_inv!29395 (array!79900) Bool)

(assert (=> start!103418 (array_inv!29395 a!3575)))

(declare-fun b!1240183 () Bool)

(declare-fun res!827467 () Bool)

(assert (=> b!1240183 (=> (not res!827467) (not e!702896))))

(assert (=> b!1240183 (= res!827467 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240182 () Bool)

(declare-fun res!827469 () Bool)

(assert (=> b!1240182 (=> (not res!827469) (not e!702896))))

(assert (=> b!1240182 (= res!827469 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39083 a!3575))))))

(assert (= (and start!103418 res!827468) b!1240181))

(assert (= (and b!1240181 res!827470) b!1240182))

(assert (= (and b!1240182 res!827469) b!1240183))

(assert (= (and b!1240183 res!827467) b!1240184))

(declare-fun m!1143539 () Bool)

(assert (=> b!1240184 m!1143539))

(declare-fun m!1143541 () Bool)

(assert (=> b!1240184 m!1143541))

(declare-fun m!1143543 () Bool)

(assert (=> b!1240181 m!1143543))

(declare-fun m!1143545 () Bool)

(assert (=> start!103418 m!1143545))

(declare-fun m!1143547 () Bool)

(assert (=> b!1240183 m!1143547))

(check-sat (not start!103418) (not b!1240183) (not b!1240181) (not b!1240184))
(check-sat)
