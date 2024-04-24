; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117970 () Bool)

(assert start!117970)

(declare-fun res!923313 () Bool)

(declare-fun e!783689 () Bool)

(assert (=> start!117970 (=> (not res!923313) (not e!783689))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94336 0))(
  ( (array!94337 (arr!45553 (Array (_ BitVec 32) (_ BitVec 64))) (size!46104 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94336)

(assert (=> start!117970 (= res!923313 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46104 a!3464)) (bvslt (size!46104 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117970 e!783689))

(assert (=> start!117970 true))

(declare-fun array_inv!34834 (array!94336) Bool)

(assert (=> start!117970 (array_inv!34834 a!3464)))

(declare-fun b!1382401 () Bool)

(declare-fun res!923312 () Bool)

(assert (=> b!1382401 (=> (not res!923312) (not e!783689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382401 (= res!923312 (validKeyInArray!0 (select (arr!45553 a!3464) from!2839)))))

(declare-fun b!1382402 () Bool)

(declare-fun lt!608632 () (_ BitVec 32))

(assert (=> b!1382402 (= e!783689 (or (bvslt lt!608632 #b00000000000000000000000000000000) (bvsgt lt!608632 (bvsub (size!46104 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94336 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1382402 (= lt!608632 (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94)))))

(assert (= (and start!117970 res!923313) b!1382401))

(assert (= (and b!1382401 res!923312) b!1382402))

(declare-fun m!1267963 () Bool)

(assert (=> start!117970 m!1267963))

(declare-fun m!1267965 () Bool)

(assert (=> b!1382401 m!1267965))

(assert (=> b!1382401 m!1267965))

(declare-fun m!1267967 () Bool)

(assert (=> b!1382401 m!1267967))

(declare-fun m!1267969 () Bool)

(assert (=> b!1382402 m!1267969))

(check-sat (not b!1382401) (not start!117970) (not b!1382402))
(check-sat)
(get-model)

(declare-fun d!149443 () Bool)

(assert (=> d!149443 (= (validKeyInArray!0 (select (arr!45553 a!3464) from!2839)) (and (not (= (select (arr!45553 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45553 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382401 d!149443))

(declare-fun d!149445 () Bool)

(assert (=> d!149445 (= (array_inv!34834 a!3464) (bvsge (size!46104 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117970 d!149445))

(declare-fun call!66569 () (_ BitVec 32))

(declare-fun bm!66566 () Bool)

(assert (=> bm!66566 (= call!66569 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun b!1382423 () Bool)

(declare-fun e!783707 () (_ BitVec 32))

(assert (=> b!1382423 (= e!783707 (bvadd #b00000000000000000000000000000001 call!66569))))

(declare-fun b!1382424 () Bool)

(declare-fun e!783708 () (_ BitVec 32))

(assert (=> b!1382424 (= e!783708 e!783707)))

(declare-fun c!128997 () Bool)

(assert (=> b!1382424 (= c!128997 (validKeyInArray!0 (select (arr!45553 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun b!1382425 () Bool)

(assert (=> b!1382425 (= e!783708 #b00000000000000000000000000000000)))

(declare-fun d!149447 () Bool)

(declare-fun lt!608641 () (_ BitVec 32))

(assert (=> d!149447 (and (bvsge lt!608641 #b00000000000000000000000000000000) (bvsle lt!608641 (bvsub (size!46104 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!149447 (= lt!608641 e!783708)))

(declare-fun c!128996 () Bool)

(assert (=> d!149447 (= c!128996 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!149447 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46104 a!3464)))))

(assert (=> d!149447 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608641)))

(declare-fun b!1382426 () Bool)

(assert (=> b!1382426 (= e!783707 call!66569)))

(assert (= (and d!149447 c!128996) b!1382425))

(assert (= (and d!149447 (not c!128996)) b!1382424))

(assert (= (and b!1382424 c!128997) b!1382423))

(assert (= (and b!1382424 (not c!128997)) b!1382426))

(assert (= (or b!1382423 b!1382426) bm!66566))

(declare-fun m!1267987 () Bool)

(assert (=> bm!66566 m!1267987))

(declare-fun m!1267989 () Bool)

(assert (=> b!1382424 m!1267989))

(assert (=> b!1382424 m!1267989))

(declare-fun m!1267991 () Bool)

(assert (=> b!1382424 m!1267991))

(assert (=> b!1382402 d!149447))

(check-sat (not b!1382424) (not bm!66566))
(check-sat)
