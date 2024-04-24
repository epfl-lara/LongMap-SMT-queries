; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117106 () Bool)

(assert start!117106)

(declare-fun b!1378544 () Bool)

(declare-datatypes ((Unit!45608 0))(
  ( (Unit!45609) )
))
(declare-fun e!780992 () Unit!45608)

(declare-fun lt!606324 () Unit!45608)

(assert (=> b!1378544 (= e!780992 lt!606324)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93661 0))(
  ( (array!93662 (arr!45229 (Array (_ BitVec 32) (_ BitVec 64))) (size!45780 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93661)

(declare-fun lt!606326 () Unit!45608)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93661 (_ BitVec 32) (_ BitVec 32)) Unit!45608)

(assert (=> b!1378544 (= lt!606326 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66033 () (_ BitVec 32))

(declare-fun lt!606329 () (_ BitVec 32))

(assert (=> b!1378544 (= call!66033 (bvadd #b00000000000000000000000000000001 lt!606329))))

(declare-fun lt!606328 () array!93661)

(assert (=> b!1378544 (= lt!606324 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606328 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66034 () (_ BitVec 32))

(declare-fun lt!606325 () (_ BitVec 32))

(assert (=> b!1378544 (= call!66034 (bvadd #b00000000000000000000000000000001 lt!606325))))

(declare-fun bm!66030 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93661 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66030 (= call!66034 (arrayCountValidKeys!0 lt!606328 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378545 () Bool)

(declare-fun res!920524 () Bool)

(declare-fun e!780990 () Bool)

(assert (=> b!1378545 (=> (not res!920524) (not e!780990))))

(assert (=> b!1378545 (= res!920524 (and (bvslt (size!45780 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45780 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378546 () Bool)

(declare-fun e!780994 () Bool)

(declare-fun e!780993 () Bool)

(assert (=> b!1378546 (= e!780994 e!780993)))

(declare-fun res!920527 () Bool)

(assert (=> b!1378546 (=> (not res!920527) (not e!780993))))

(assert (=> b!1378546 (= res!920527 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45780 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!606323 () Unit!45608)

(assert (=> b!1378546 (= lt!606323 e!780992)))

(declare-fun c!128458 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378546 (= c!128458 (validKeyInArray!0 (select (arr!45229 a!4032) to!206)))))

(declare-fun b!1378547 () Bool)

(assert (=> b!1378547 (= e!780993 (bvsge (bvsub (size!45780 a!4032) to!206) (bvsub (bvadd #b00000000000000000000000000000001 (size!45780 a!4032)) to!206)))))

(declare-fun b!1378548 () Bool)

(declare-fun res!920523 () Bool)

(assert (=> b!1378548 (=> (not res!920523) (not e!780990))))

(assert (=> b!1378548 (= res!920523 (validKeyInArray!0 (select (arr!45229 a!4032) i!1445)))))

(declare-fun b!1378549 () Bool)

(assert (=> b!1378549 (= e!780990 e!780994)))

(declare-fun res!920526 () Bool)

(assert (=> b!1378549 (=> (not res!920526) (not e!780994))))

(assert (=> b!1378549 (= res!920526 (and (= lt!606325 lt!606329) (not (= to!206 (size!45780 a!4032)))))))

(assert (=> b!1378549 (= lt!606329 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378549 (= lt!606325 (arrayCountValidKeys!0 lt!606328 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378549 (= lt!606328 (array!93662 (store (arr!45229 a!4032) i!1445 k0!2947) (size!45780 a!4032)))))

(declare-fun res!920525 () Bool)

(assert (=> start!117106 (=> (not res!920525) (not e!780990))))

(assert (=> start!117106 (= res!920525 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45780 a!4032))))))

(assert (=> start!117106 e!780990))

(assert (=> start!117106 true))

(declare-fun array_inv!34510 (array!93661) Bool)

(assert (=> start!117106 (array_inv!34510 a!4032)))

(declare-fun bm!66031 () Bool)

(assert (=> bm!66031 (= call!66033 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378550 () Bool)

(declare-fun res!920528 () Bool)

(assert (=> b!1378550 (=> (not res!920528) (not e!780993))))

(assert (=> b!1378550 (= res!920528 (= (arrayCountValidKeys!0 lt!606328 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1378551 () Bool)

(declare-fun lt!606327 () Unit!45608)

(assert (=> b!1378551 (= e!780992 lt!606327)))

(declare-fun lt!606330 () Unit!45608)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93661 (_ BitVec 32) (_ BitVec 32)) Unit!45608)

(assert (=> b!1378551 (= lt!606330 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378551 (= call!66033 lt!606329)))

(assert (=> b!1378551 (= lt!606327 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606328 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378551 (= call!66034 lt!606325)))

(declare-fun b!1378552 () Bool)

(declare-fun res!920529 () Bool)

(assert (=> b!1378552 (=> (not res!920529) (not e!780990))))

(assert (=> b!1378552 (= res!920529 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!117106 res!920525) b!1378548))

(assert (= (and b!1378548 res!920523) b!1378552))

(assert (= (and b!1378552 res!920529) b!1378545))

(assert (= (and b!1378545 res!920524) b!1378549))

(assert (= (and b!1378549 res!920526) b!1378546))

(assert (= (and b!1378546 c!128458) b!1378544))

(assert (= (and b!1378546 (not c!128458)) b!1378551))

(assert (= (or b!1378544 b!1378551) bm!66031))

(assert (= (or b!1378544 b!1378551) bm!66030))

(assert (= (and b!1378546 res!920527) b!1378550))

(assert (= (and b!1378550 res!920528) b!1378547))

(declare-fun m!1263111 () Bool)

(assert (=> bm!66031 m!1263111))

(declare-fun m!1263113 () Bool)

(assert (=> b!1378548 m!1263113))

(assert (=> b!1378548 m!1263113))

(declare-fun m!1263115 () Bool)

(assert (=> b!1378548 m!1263115))

(declare-fun m!1263117 () Bool)

(assert (=> b!1378552 m!1263117))

(declare-fun m!1263119 () Bool)

(assert (=> start!117106 m!1263119))

(declare-fun m!1263121 () Bool)

(assert (=> b!1378550 m!1263121))

(assert (=> b!1378550 m!1263111))

(declare-fun m!1263123 () Bool)

(assert (=> b!1378549 m!1263123))

(declare-fun m!1263125 () Bool)

(assert (=> b!1378549 m!1263125))

(declare-fun m!1263127 () Bool)

(assert (=> b!1378549 m!1263127))

(declare-fun m!1263129 () Bool)

(assert (=> b!1378546 m!1263129))

(assert (=> b!1378546 m!1263129))

(declare-fun m!1263131 () Bool)

(assert (=> b!1378546 m!1263131))

(declare-fun m!1263133 () Bool)

(assert (=> b!1378551 m!1263133))

(declare-fun m!1263135 () Bool)

(assert (=> b!1378551 m!1263135))

(declare-fun m!1263137 () Bool)

(assert (=> b!1378544 m!1263137))

(declare-fun m!1263139 () Bool)

(assert (=> b!1378544 m!1263139))

(assert (=> bm!66030 m!1263121))

(check-sat (not b!1378548) (not b!1378551) (not b!1378550) (not b!1378546) (not bm!66030) (not b!1378552) (not b!1378544) (not bm!66031) (not b!1378549) (not start!117106))
(check-sat)
