; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116872 () Bool)

(assert start!116872)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93541 0))(
  ( (array!93542 (arr!45174 (Array (_ BitVec 32) (_ BitVec 64))) (size!45724 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93541)

(declare-fun bm!65950 () Bool)

(declare-fun call!65954 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65950 (= call!65954 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377180 () Bool)

(declare-fun res!919965 () Bool)

(declare-fun e!780112 () Bool)

(assert (=> b!1377180 (=> (not res!919965) (not e!780112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377180 (= res!919965 (validKeyInArray!0 (select (arr!45174 a!4032) i!1445)))))

(declare-fun b!1377181 () Bool)

(declare-fun res!919966 () Bool)

(assert (=> b!1377181 (=> (not res!919966) (not e!780112))))

(assert (=> b!1377181 (= res!919966 (and (bvslt (size!45724 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45724 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65951 () Bool)

(declare-fun lt!605793 () array!93541)

(declare-fun call!65953 () (_ BitVec 32))

(assert (=> bm!65951 (= call!65953 (arrayCountValidKeys!0 lt!605793 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377182 () Bool)

(declare-fun e!780110 () Bool)

(assert (=> b!1377182 (= e!780112 e!780110)))

(declare-fun res!919969 () Bool)

(assert (=> b!1377182 (=> (not res!919969) (not e!780110))))

(declare-fun lt!605798 () (_ BitVec 32))

(declare-fun lt!605796 () (_ BitVec 32))

(assert (=> b!1377182 (= res!919969 (and (= lt!605796 lt!605798) (not (= to!206 (size!45724 a!4032)))))))

(assert (=> b!1377182 (= lt!605798 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377182 (= lt!605796 (arrayCountValidKeys!0 lt!605793 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377182 (= lt!605793 (array!93542 (store (arr!45174 a!4032) i!1445 k0!2947) (size!45724 a!4032)))))

(declare-fun res!919964 () Bool)

(assert (=> start!116872 (=> (not res!919964) (not e!780112))))

(assert (=> start!116872 (= res!919964 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45724 a!4032))))))

(assert (=> start!116872 e!780112))

(assert (=> start!116872 true))

(declare-fun array_inv!34202 (array!93541) Bool)

(assert (=> start!116872 (array_inv!34202 a!4032)))

(declare-fun b!1377183 () Bool)

(declare-fun e!780108 () Bool)

(assert (=> b!1377183 (= e!780110 e!780108)))

(declare-fun res!919968 () Bool)

(assert (=> b!1377183 (=> (not res!919968) (not e!780108))))

(assert (=> b!1377183 (= res!919968 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45724 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45665 0))(
  ( (Unit!45666) )
))
(declare-fun lt!605797 () Unit!45665)

(declare-fun e!780111 () Unit!45665)

(assert (=> b!1377183 (= lt!605797 e!780111)))

(declare-fun c!128048 () Bool)

(assert (=> b!1377183 (= c!128048 (validKeyInArray!0 (select (arr!45174 a!4032) to!206)))))

(declare-fun b!1377184 () Bool)

(declare-fun lt!605800 () Unit!45665)

(assert (=> b!1377184 (= e!780111 lt!605800)))

(declare-fun lt!605794 () Unit!45665)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93541 (_ BitVec 32) (_ BitVec 32)) Unit!45665)

(assert (=> b!1377184 (= lt!605794 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377184 (= call!65954 (bvadd #b00000000000000000000000000000001 lt!605798))))

(assert (=> b!1377184 (= lt!605800 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605793 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377184 (= call!65953 (bvadd #b00000000000000000000000000000001 lt!605796))))

(declare-fun b!1377185 () Bool)

(assert (=> b!1377185 (= e!780108 (not (= (arrayCountValidKeys!0 lt!605793 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))))

(declare-fun b!1377186 () Bool)

(declare-fun lt!605795 () Unit!45665)

(assert (=> b!1377186 (= e!780111 lt!605795)))

(declare-fun lt!605799 () Unit!45665)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93541 (_ BitVec 32) (_ BitVec 32)) Unit!45665)

(assert (=> b!1377186 (= lt!605799 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377186 (= call!65954 lt!605798)))

(assert (=> b!1377186 (= lt!605795 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605793 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377186 (= call!65953 lt!605796)))

(declare-fun b!1377187 () Bool)

(declare-fun res!919967 () Bool)

(assert (=> b!1377187 (=> (not res!919967) (not e!780112))))

(assert (=> b!1377187 (= res!919967 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116872 res!919964) b!1377180))

(assert (= (and b!1377180 res!919965) b!1377187))

(assert (= (and b!1377187 res!919967) b!1377181))

(assert (= (and b!1377181 res!919966) b!1377182))

(assert (= (and b!1377182 res!919969) b!1377183))

(assert (= (and b!1377183 c!128048) b!1377184))

(assert (= (and b!1377183 (not c!128048)) b!1377186))

(assert (= (or b!1377184 b!1377186) bm!65950))

(assert (= (or b!1377184 b!1377186) bm!65951))

(assert (= (and b!1377183 res!919968) b!1377185))

(declare-fun m!1261411 () Bool)

(assert (=> b!1377185 m!1261411))

(declare-fun m!1261413 () Bool)

(assert (=> b!1377185 m!1261413))

(declare-fun m!1261415 () Bool)

(assert (=> b!1377183 m!1261415))

(assert (=> b!1377183 m!1261415))

(declare-fun m!1261417 () Bool)

(assert (=> b!1377183 m!1261417))

(declare-fun m!1261419 () Bool)

(assert (=> b!1377187 m!1261419))

(declare-fun m!1261421 () Bool)

(assert (=> b!1377184 m!1261421))

(declare-fun m!1261423 () Bool)

(assert (=> b!1377184 m!1261423))

(assert (=> bm!65950 m!1261413))

(declare-fun m!1261425 () Bool)

(assert (=> b!1377180 m!1261425))

(assert (=> b!1377180 m!1261425))

(declare-fun m!1261427 () Bool)

(assert (=> b!1377180 m!1261427))

(declare-fun m!1261429 () Bool)

(assert (=> b!1377182 m!1261429))

(declare-fun m!1261431 () Bool)

(assert (=> b!1377182 m!1261431))

(declare-fun m!1261433 () Bool)

(assert (=> b!1377182 m!1261433))

(declare-fun m!1261435 () Bool)

(assert (=> b!1377186 m!1261435))

(declare-fun m!1261437 () Bool)

(assert (=> b!1377186 m!1261437))

(declare-fun m!1261439 () Bool)

(assert (=> start!116872 m!1261439))

(assert (=> bm!65951 m!1261411))

(check-sat (not bm!65950) (not b!1377180) (not b!1377184) (not b!1377187) (not start!116872) (not b!1377186) (not b!1377183) (not bm!65951) (not b!1377185) (not b!1377182))
