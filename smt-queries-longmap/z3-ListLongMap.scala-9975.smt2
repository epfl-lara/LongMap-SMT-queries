; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118000 () Bool)

(assert start!118000)

(declare-fun res!923349 () Bool)

(declare-fun e!783743 () Bool)

(assert (=> start!118000 (=> (not res!923349) (not e!783743))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94351 0))(
  ( (array!94352 (arr!45559 (Array (_ BitVec 32) (_ BitVec 64))) (size!46110 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94351)

(assert (=> start!118000 (= res!923349 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46110 a!3464)) (bvslt (size!46110 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!118000 e!783743))

(assert (=> start!118000 true))

(declare-fun array_inv!34840 (array!94351) Bool)

(assert (=> start!118000 (array_inv!34840 a!3464)))

(declare-fun b!1382473 () Bool)

(declare-fun res!923348 () Bool)

(assert (=> b!1382473 (=> (not res!923348) (not e!783743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382473 (= res!923348 (not (validKeyInArray!0 (select (arr!45559 a!3464) from!2839))))))

(declare-fun lt!608650 () (_ BitVec 32))

(declare-fun b!1382474 () Bool)

(assert (=> b!1382474 (= e!783743 (or (bvslt lt!608650 #b00000000000000000000000000000000) (bvsgt lt!608650 (bvsub (size!46110 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94351 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1382474 (= lt!608650 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (= (and start!118000 res!923349) b!1382473))

(assert (= (and b!1382473 res!923348) b!1382474))

(declare-fun m!1268023 () Bool)

(assert (=> start!118000 m!1268023))

(declare-fun m!1268025 () Bool)

(assert (=> b!1382473 m!1268025))

(assert (=> b!1382473 m!1268025))

(declare-fun m!1268027 () Bool)

(assert (=> b!1382473 m!1268027))

(declare-fun m!1268029 () Bool)

(assert (=> b!1382474 m!1268029))

(check-sat (not b!1382473) (not b!1382474) (not start!118000))
(check-sat)
(get-model)

(declare-fun d!149465 () Bool)

(assert (=> d!149465 (= (validKeyInArray!0 (select (arr!45559 a!3464) from!2839)) (and (not (= (select (arr!45559 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45559 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382473 d!149465))

(declare-fun d!149467 () Bool)

(declare-fun lt!608659 () (_ BitVec 32))

(assert (=> d!149467 (and (bvsge lt!608659 #b00000000000000000000000000000000) (bvsle lt!608659 (bvsub (size!46110 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun e!783762 () (_ BitVec 32))

(assert (=> d!149467 (= lt!608659 e!783762)))

(declare-fun c!129014 () Bool)

(assert (=> d!149467 (= c!129014 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!149467 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46110 a!3464)))))

(assert (=> d!149467 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608659)))

(declare-fun b!1382495 () Bool)

(declare-fun e!783761 () (_ BitVec 32))

(declare-fun call!66578 () (_ BitVec 32))

(assert (=> b!1382495 (= e!783761 call!66578)))

(declare-fun b!1382496 () Bool)

(assert (=> b!1382496 (= e!783762 #b00000000000000000000000000000000)))

(declare-fun b!1382497 () Bool)

(assert (=> b!1382497 (= e!783761 (bvadd #b00000000000000000000000000000001 call!66578))))

(declare-fun b!1382498 () Bool)

(assert (=> b!1382498 (= e!783762 e!783761)))

(declare-fun c!129015 () Bool)

(assert (=> b!1382498 (= c!129015 (validKeyInArray!0 (select (arr!45559 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun bm!66575 () Bool)

(assert (=> bm!66575 (= call!66578 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(assert (= (and d!149467 c!129014) b!1382496))

(assert (= (and d!149467 (not c!129014)) b!1382498))

(assert (= (and b!1382498 c!129015) b!1382497))

(assert (= (and b!1382498 (not c!129015)) b!1382495))

(assert (= (or b!1382497 b!1382495) bm!66575))

(declare-fun m!1268047 () Bool)

(assert (=> b!1382498 m!1268047))

(assert (=> b!1382498 m!1268047))

(declare-fun m!1268049 () Bool)

(assert (=> b!1382498 m!1268049))

(declare-fun m!1268051 () Bool)

(assert (=> bm!66575 m!1268051))

(assert (=> b!1382474 d!149467))

(declare-fun d!149471 () Bool)

(assert (=> d!149471 (= (array_inv!34840 a!3464) (bvsge (size!46110 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!118000 d!149471))

(check-sat (not b!1382498) (not bm!66575))
(check-sat)
