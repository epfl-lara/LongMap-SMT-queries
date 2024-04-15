; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116722 () Bool)

(assert start!116722)

(declare-fun bm!65711 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93345 0))(
  ( (array!93346 (arr!45076 (Array (_ BitVec 32) (_ BitVec 64))) (size!45628 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93345)

(declare-fun call!65715 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93345 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65711 (= call!65715 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375628 () Bool)

(declare-fun e!779301 () Bool)

(declare-fun e!779303 () Bool)

(assert (=> b!1375628 (= e!779301 e!779303)))

(declare-fun res!918672 () Bool)

(assert (=> b!1375628 (=> (not res!918672) (not e!779303))))

(assert (=> b!1375628 (= res!918672 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45628 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45408 0))(
  ( (Unit!45409) )
))
(declare-fun lt!604498 () Unit!45408)

(declare-fun e!779304 () Unit!45408)

(assert (=> b!1375628 (= lt!604498 e!779304)))

(declare-fun c!127922 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375628 (= c!127922 (validKeyInArray!0 (select (arr!45076 a!4032) to!206)))))

(declare-fun lt!604501 () array!93345)

(declare-fun call!65714 () (_ BitVec 32))

(declare-fun bm!65712 () Bool)

(assert (=> bm!65712 (= call!65714 (arrayCountValidKeys!0 lt!604501 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918671 () Bool)

(declare-fun e!779305 () Bool)

(assert (=> start!116722 (=> (not res!918671) (not e!779305))))

(assert (=> start!116722 (= res!918671 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45628 a!4032))))))

(assert (=> start!116722 e!779305))

(assert (=> start!116722 true))

(declare-fun array_inv!34309 (array!93345) Bool)

(assert (=> start!116722 (array_inv!34309 a!4032)))

(declare-fun b!1375629 () Bool)

(declare-fun res!918669 () Bool)

(assert (=> b!1375629 (=> (not res!918669) (not e!779305))))

(assert (=> b!1375629 (= res!918669 (and (bvslt (size!45628 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45628 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375630 () Bool)

(declare-fun res!918674 () Bool)

(assert (=> b!1375630 (=> (not res!918674) (not e!779305))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375630 (= res!918674 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375631 () Bool)

(assert (=> b!1375631 (= e!779305 e!779301)))

(declare-fun res!918673 () Bool)

(assert (=> b!1375631 (=> (not res!918673) (not e!779301))))

(declare-fun lt!604500 () (_ BitVec 32))

(declare-fun lt!604495 () (_ BitVec 32))

(assert (=> b!1375631 (= res!918673 (and (= lt!604500 lt!604495) (not (= to!206 (size!45628 a!4032)))))))

(assert (=> b!1375631 (= lt!604495 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375631 (= lt!604500 (arrayCountValidKeys!0 lt!604501 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375631 (= lt!604501 (array!93346 (store (arr!45076 a!4032) i!1445 k0!2947) (size!45628 a!4032)))))

(declare-fun b!1375632 () Bool)

(declare-fun lt!604502 () Unit!45408)

(assert (=> b!1375632 (= e!779304 lt!604502)))

(declare-fun lt!604499 () Unit!45408)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93345 (_ BitVec 32) (_ BitVec 32)) Unit!45408)

(assert (=> b!1375632 (= lt!604499 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375632 (= call!65715 lt!604495)))

(assert (=> b!1375632 (= lt!604502 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604501 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375632 (= call!65714 lt!604500)))

(declare-fun b!1375633 () Bool)

(declare-fun res!918670 () Bool)

(assert (=> b!1375633 (=> (not res!918670) (not e!779305))))

(assert (=> b!1375633 (= res!918670 (validKeyInArray!0 (select (arr!45076 a!4032) i!1445)))))

(declare-fun b!1375634 () Bool)

(assert (=> b!1375634 (= e!779303 false)))

(declare-fun lt!604497 () (_ BitVec 32))

(assert (=> b!1375634 (= lt!604497 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604496 () (_ BitVec 32))

(assert (=> b!1375634 (= lt!604496 (arrayCountValidKeys!0 lt!604501 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375635 () Bool)

(declare-fun lt!604494 () Unit!45408)

(assert (=> b!1375635 (= e!779304 lt!604494)))

(declare-fun lt!604493 () Unit!45408)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93345 (_ BitVec 32) (_ BitVec 32)) Unit!45408)

(assert (=> b!1375635 (= lt!604493 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375635 (= call!65715 (bvadd #b00000000000000000000000000000001 lt!604495))))

(assert (=> b!1375635 (= lt!604494 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604501 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375635 (= call!65714 (bvadd #b00000000000000000000000000000001 lt!604500))))

(assert (= (and start!116722 res!918671) b!1375633))

(assert (= (and b!1375633 res!918670) b!1375630))

(assert (= (and b!1375630 res!918674) b!1375629))

(assert (= (and b!1375629 res!918669) b!1375631))

(assert (= (and b!1375631 res!918673) b!1375628))

(assert (= (and b!1375628 c!127922) b!1375635))

(assert (= (and b!1375628 (not c!127922)) b!1375632))

(assert (= (or b!1375635 b!1375632) bm!65712))

(assert (= (or b!1375635 b!1375632) bm!65711))

(assert (= (and b!1375628 res!918672) b!1375634))

(declare-fun m!1259083 () Bool)

(assert (=> b!1375631 m!1259083))

(declare-fun m!1259085 () Bool)

(assert (=> b!1375631 m!1259085))

(declare-fun m!1259087 () Bool)

(assert (=> b!1375631 m!1259087))

(declare-fun m!1259089 () Bool)

(assert (=> start!116722 m!1259089))

(declare-fun m!1259091 () Bool)

(assert (=> bm!65711 m!1259091))

(declare-fun m!1259093 () Bool)

(assert (=> b!1375628 m!1259093))

(assert (=> b!1375628 m!1259093))

(declare-fun m!1259095 () Bool)

(assert (=> b!1375628 m!1259095))

(assert (=> b!1375634 m!1259091))

(declare-fun m!1259097 () Bool)

(assert (=> b!1375634 m!1259097))

(declare-fun m!1259099 () Bool)

(assert (=> b!1375630 m!1259099))

(assert (=> bm!65712 m!1259097))

(declare-fun m!1259101 () Bool)

(assert (=> b!1375633 m!1259101))

(assert (=> b!1375633 m!1259101))

(declare-fun m!1259103 () Bool)

(assert (=> b!1375633 m!1259103))

(declare-fun m!1259105 () Bool)

(assert (=> b!1375635 m!1259105))

(declare-fun m!1259107 () Bool)

(assert (=> b!1375635 m!1259107))

(declare-fun m!1259109 () Bool)

(assert (=> b!1375632 m!1259109))

(declare-fun m!1259111 () Bool)

(assert (=> b!1375632 m!1259111))

(check-sat (not b!1375635) (not b!1375632) (not b!1375634) (not b!1375630) (not b!1375633) (not b!1375628) (not bm!65711) (not start!116722) (not bm!65712) (not b!1375631))
(check-sat)
