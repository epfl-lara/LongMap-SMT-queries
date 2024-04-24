; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137222 () Bool)

(assert start!137222)

(declare-fun res!1079537 () Bool)

(declare-fun e!882098 () Bool)

(assert (=> start!137222 (=> (not res!1079537) (not e!882098))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105920 0))(
  ( (array!105921 (arr!51061 (Array (_ BitVec 32) (_ BitVec 64))) (size!51612 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105920)

(assert (=> start!137222 (= res!1079537 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51612 a!3559)) (bvslt (size!51612 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137222 e!882098))

(assert (=> start!137222 true))

(declare-fun array_inv!40016 (array!105920) Bool)

(assert (=> start!137222 (array_inv!40016 a!3559)))

(declare-fun b!1581172 () Bool)

(declare-fun res!1079535 () Bool)

(assert (=> b!1581172 (=> (not res!1079535) (not e!882098))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581172 (= res!1079535 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1581173 () Bool)

(declare-fun res!1079536 () Bool)

(assert (=> b!1581173 (=> (not res!1079536) (not e!882098))))

(assert (=> b!1581173 (= res!1079536 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51612 a!3559))))))

(declare-fun b!1581174 () Bool)

(assert (=> b!1581174 (= e!882098 (not (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001))))))

(assert (= (and start!137222 res!1079537) b!1581172))

(assert (= (and b!1581172 res!1079535) b!1581173))

(assert (= (and b!1581173 res!1079536) b!1581174))

(declare-fun m!1453047 () Bool)

(assert (=> start!137222 m!1453047))

(declare-fun m!1453049 () Bool)

(assert (=> b!1581172 m!1453049))

(declare-fun m!1453051 () Bool)

(assert (=> b!1581174 m!1453051))

(check-sat (not b!1581172) (not start!137222) (not b!1581174))
(check-sat)
(get-model)

(declare-fun d!166841 () Bool)

(declare-fun res!1079560 () Bool)

(declare-fun e!882115 () Bool)

(assert (=> d!166841 (=> res!1079560 e!882115)))

(assert (=> d!166841 (= res!1079560 (= (select (arr!51061 a!3559) from!2937) k0!2792))))

(assert (=> d!166841 (= (arrayContainsKey!0 a!3559 k0!2792 from!2937) e!882115)))

(declare-fun b!1581197 () Bool)

(declare-fun e!882116 () Bool)

(assert (=> b!1581197 (= e!882115 e!882116)))

(declare-fun res!1079561 () Bool)

(assert (=> b!1581197 (=> (not res!1079561) (not e!882116))))

(assert (=> b!1581197 (= res!1079561 (bvslt (bvadd from!2937 #b00000000000000000000000000000001) (size!51612 a!3559)))))

(declare-fun b!1581198 () Bool)

(assert (=> b!1581198 (= e!882116 (arrayContainsKey!0 a!3559 k0!2792 (bvadd from!2937 #b00000000000000000000000000000001)))))

(assert (= (and d!166841 (not res!1079560)) b!1581197))

(assert (= (and b!1581197 res!1079561) b!1581198))

(declare-fun m!1453065 () Bool)

(assert (=> d!166841 m!1453065))

(declare-fun m!1453067 () Bool)

(assert (=> b!1581198 m!1453067))

(assert (=> b!1581172 d!166841))

(declare-fun d!166843 () Bool)

(assert (=> d!166843 (= (array_inv!40016 a!3559) (bvsge (size!51612 a!3559) #b00000000000000000000000000000000))))

(assert (=> start!137222 d!166843))

(declare-fun d!166845 () Bool)

(declare-fun res!1079562 () Bool)

(declare-fun e!882117 () Bool)

(assert (=> d!166845 (=> res!1079562 e!882117)))

(assert (=> d!166845 (= res!1079562 (= (select (arr!51061 a!3559) (bvsub from!2937 #b00000000000000000000000000000001)) k0!2792))))

(assert (=> d!166845 (= (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)) e!882117)))

(declare-fun b!1581199 () Bool)

(declare-fun e!882118 () Bool)

(assert (=> b!1581199 (= e!882117 e!882118)))

(declare-fun res!1079563 () Bool)

(assert (=> b!1581199 (=> (not res!1079563) (not e!882118))))

(assert (=> b!1581199 (= res!1079563 (bvslt (bvadd (bvsub from!2937 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!51612 a!3559)))))

(declare-fun b!1581200 () Bool)

(assert (=> b!1581200 (= e!882118 (arrayContainsKey!0 a!3559 k0!2792 (bvadd (bvsub from!2937 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!166845 (not res!1079562)) b!1581199))

(assert (= (and b!1581199 res!1079563) b!1581200))

(declare-fun m!1453069 () Bool)

(assert (=> d!166845 m!1453069))

(declare-fun m!1453071 () Bool)

(assert (=> b!1581200 m!1453071))

(assert (=> b!1581174 d!166845))

(check-sat (not b!1581200) (not b!1581198))
(check-sat)
