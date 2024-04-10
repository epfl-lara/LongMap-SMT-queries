; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117770 () Bool)

(assert start!117770)

(declare-fun res!922833 () Bool)

(declare-fun e!782900 () Bool)

(assert (=> start!117770 (=> (not res!922833) (not e!782900))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94237 0))(
  ( (array!94238 (arr!45507 (Array (_ BitVec 32) (_ BitVec 64))) (size!46057 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94237)

(assert (=> start!117770 (= res!922833 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46057 a!3464)) (bvslt (size!46057 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117770 e!782900))

(assert (=> start!117770 true))

(declare-fun array_inv!34535 (array!94237) Bool)

(assert (=> start!117770 (array_inv!34535 a!3464)))

(declare-fun b!1381169 () Bool)

(declare-fun res!922834 () Bool)

(assert (=> b!1381169 (=> (not res!922834) (not e!782900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381169 (= res!922834 (not (validKeyInArray!0 (select (arr!45507 a!3464) from!2839))))))

(declare-fun lt!608172 () (_ BitVec 32))

(declare-fun b!1381170 () Bool)

(assert (=> b!1381170 (= e!782900 (or (bvslt lt!608172 #b00000000000000000000000000000000) (bvsgt lt!608172 (bvsub (size!46057 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94237 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381170 (= lt!608172 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (= (and start!117770 res!922833) b!1381169))

(assert (= (and b!1381169 res!922834) b!1381170))

(declare-fun m!1266395 () Bool)

(assert (=> start!117770 m!1266395))

(declare-fun m!1266397 () Bool)

(assert (=> b!1381169 m!1266397))

(assert (=> b!1381169 m!1266397))

(declare-fun m!1266399 () Bool)

(assert (=> b!1381169 m!1266399))

(declare-fun m!1266401 () Bool)

(assert (=> b!1381170 m!1266401))

(check-sat (not b!1381169) (not b!1381170) (not start!117770))
(check-sat)
(get-model)

(declare-fun d!149005 () Bool)

(assert (=> d!149005 (= (validKeyInArray!0 (select (arr!45507 a!3464) from!2839)) (and (not (= (select (arr!45507 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45507 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381169 d!149005))

(declare-fun b!1381185 () Bool)

(declare-fun e!782911 () (_ BitVec 32))

(declare-fun call!66511 () (_ BitVec 32))

(assert (=> b!1381185 (= e!782911 (bvadd #b00000000000000000000000000000001 call!66511))))

(declare-fun d!149007 () Bool)

(declare-fun lt!608178 () (_ BitVec 32))

(assert (=> d!149007 (and (bvsge lt!608178 #b00000000000000000000000000000000) (bvsle lt!608178 (bvsub (size!46057 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun e!782912 () (_ BitVec 32))

(assert (=> d!149007 (= lt!608178 e!782912)))

(declare-fun c!128612 () Bool)

(assert (=> d!149007 (= c!128612 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!149007 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46057 a!3464)))))

(assert (=> d!149007 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608178)))

(declare-fun b!1381186 () Bool)

(assert (=> b!1381186 (= e!782912 e!782911)))

(declare-fun c!128613 () Bool)

(assert (=> b!1381186 (= c!128613 (validKeyInArray!0 (select (arr!45507 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun b!1381187 () Bool)

(assert (=> b!1381187 (= e!782912 #b00000000000000000000000000000000)))

(declare-fun b!1381188 () Bool)

(assert (=> b!1381188 (= e!782911 call!66511)))

(declare-fun bm!66508 () Bool)

(assert (=> bm!66508 (= call!66511 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(assert (= (and d!149007 c!128612) b!1381187))

(assert (= (and d!149007 (not c!128612)) b!1381186))

(assert (= (and b!1381186 c!128613) b!1381185))

(assert (= (and b!1381186 (not c!128613)) b!1381188))

(assert (= (or b!1381185 b!1381188) bm!66508))

(declare-fun m!1266411 () Bool)

(assert (=> b!1381186 m!1266411))

(assert (=> b!1381186 m!1266411))

(declare-fun m!1266413 () Bool)

(assert (=> b!1381186 m!1266413))

(declare-fun m!1266415 () Bool)

(assert (=> bm!66508 m!1266415))

(assert (=> b!1381170 d!149007))

(declare-fun d!149019 () Bool)

(assert (=> d!149019 (= (array_inv!34535 a!3464) (bvsge (size!46057 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117770 d!149019))

(check-sat (not b!1381186) (not bm!66508))
(check-sat)
