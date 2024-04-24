; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116992 () Bool)

(assert start!116992)

(declare-fun b!1377464 () Bool)

(declare-fun e!780454 () Bool)

(assert (=> b!1377464 (= e!780454 (not true))))

(declare-datatypes ((array!93547 0))(
  ( (array!93548 (arr!45172 (Array (_ BitVec 32) (_ BitVec 64))) (size!45723 (_ BitVec 32))) )
))
(declare-fun lt!605672 () array!93547)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun a!4032 () array!93547)

(declare-fun arrayCountValidKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377464 (= (arrayCountValidKeys!0 lt!605672 (bvadd #b00000000000000000000000000000001 i!1445) (size!45723 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45723 a!4032)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-datatypes ((Unit!45542 0))(
  ( (Unit!45543) )
))
(declare-fun lt!605671 () Unit!45542)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45542)

(assert (=> b!1377464 (= lt!605671 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65904 () Bool)

(declare-fun c!128395 () Bool)

(declare-fun call!65907 () (_ BitVec 32))

(assert (=> bm!65904 (= call!65907 (arrayCountValidKeys!0 (ite c!128395 lt!605672 a!4032) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377465 () Bool)

(declare-fun res!919569 () Bool)

(declare-fun e!780452 () Bool)

(assert (=> b!1377465 (=> (not res!919569) (not e!780452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377465 (= res!919569 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377466 () Bool)

(declare-fun e!780451 () Bool)

(assert (=> b!1377466 (= e!780452 e!780451)))

(declare-fun res!919572 () Bool)

(assert (=> b!1377466 (=> (not res!919572) (not e!780451))))

(declare-fun lt!605674 () (_ BitVec 32))

(declare-fun lt!605673 () (_ BitVec 32))

(assert (=> b!1377466 (= res!919572 (and (= lt!605674 lt!605673) (not (= to!206 (size!45723 a!4032)))))))

(assert (=> b!1377466 (= lt!605673 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377466 (= lt!605674 (arrayCountValidKeys!0 lt!605672 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377466 (= lt!605672 (array!93548 (store (arr!45172 a!4032) i!1445 k0!2947) (size!45723 a!4032)))))

(declare-fun b!1377467 () Bool)

(declare-fun e!780453 () Unit!45542)

(declare-fun lt!605675 () Unit!45542)

(assert (=> b!1377467 (= e!780453 lt!605675)))

(declare-fun lt!605668 () Unit!45542)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) Unit!45542)

(assert (=> b!1377467 (= lt!605668 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377467 (= call!65907 lt!605673)))

(assert (=> b!1377467 (= lt!605675 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605672 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65908 () (_ BitVec 32))

(assert (=> b!1377467 (= call!65908 lt!605674)))

(declare-fun res!919570 () Bool)

(assert (=> start!116992 (=> (not res!919570) (not e!780452))))

(assert (=> start!116992 (= res!919570 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45723 a!4032))))))

(assert (=> start!116992 e!780452))

(assert (=> start!116992 true))

(declare-fun array_inv!34453 (array!93547) Bool)

(assert (=> start!116992 (array_inv!34453 a!4032)))

(declare-fun bm!65905 () Bool)

(assert (=> bm!65905 (= call!65908 (arrayCountValidKeys!0 (ite c!128395 a!4032 lt!605672) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377468 () Bool)

(declare-fun res!919575 () Bool)

(assert (=> b!1377468 (=> (not res!919575) (not e!780452))))

(assert (=> b!1377468 (= res!919575 (and (bvslt (size!45723 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45723 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377469 () Bool)

(declare-fun res!919573 () Bool)

(assert (=> b!1377469 (=> (not res!919573) (not e!780454))))

(assert (=> b!1377469 (= res!919573 (= (arrayCountValidKeys!0 lt!605672 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377470 () Bool)

(assert (=> b!1377470 (= e!780451 e!780454)))

(declare-fun res!919574 () Bool)

(assert (=> b!1377470 (=> (not res!919574) (not e!780454))))

(assert (=> b!1377470 (= res!919574 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45723 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605669 () Unit!45542)

(assert (=> b!1377470 (= lt!605669 e!780453)))

(assert (=> b!1377470 (= c!128395 (validKeyInArray!0 (select (arr!45172 a!4032) to!206)))))

(declare-fun b!1377471 () Bool)

(declare-fun lt!605676 () Unit!45542)

(assert (=> b!1377471 (= e!780453 lt!605676)))

(declare-fun lt!605670 () Unit!45542)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) Unit!45542)

(assert (=> b!1377471 (= lt!605670 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377471 (= call!65908 (bvadd #b00000000000000000000000000000001 lt!605673))))

(assert (=> b!1377471 (= lt!605676 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605672 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377471 (= call!65907 (bvadd #b00000000000000000000000000000001 lt!605674))))

(declare-fun b!1377472 () Bool)

(declare-fun res!919571 () Bool)

(assert (=> b!1377472 (=> (not res!919571) (not e!780452))))

(assert (=> b!1377472 (= res!919571 (validKeyInArray!0 (select (arr!45172 a!4032) i!1445)))))

(assert (= (and start!116992 res!919570) b!1377472))

(assert (= (and b!1377472 res!919571) b!1377465))

(assert (= (and b!1377465 res!919569) b!1377468))

(assert (= (and b!1377468 res!919575) b!1377466))

(assert (= (and b!1377466 res!919572) b!1377470))

(assert (= (and b!1377470 c!128395) b!1377471))

(assert (= (and b!1377470 (not c!128395)) b!1377467))

(assert (= (or b!1377471 b!1377467) bm!65905))

(assert (= (or b!1377471 b!1377467) bm!65904))

(assert (= (and b!1377470 res!919574) b!1377469))

(assert (= (and b!1377469 res!919573) b!1377464))

(declare-fun m!1261811 () Bool)

(assert (=> b!1377467 m!1261811))

(declare-fun m!1261813 () Bool)

(assert (=> b!1377467 m!1261813))

(declare-fun m!1261815 () Bool)

(assert (=> b!1377465 m!1261815))

(declare-fun m!1261817 () Bool)

(assert (=> start!116992 m!1261817))

(declare-fun m!1261819 () Bool)

(assert (=> b!1377471 m!1261819))

(declare-fun m!1261821 () Bool)

(assert (=> b!1377471 m!1261821))

(declare-fun m!1261823 () Bool)

(assert (=> b!1377470 m!1261823))

(assert (=> b!1377470 m!1261823))

(declare-fun m!1261825 () Bool)

(assert (=> b!1377470 m!1261825))

(declare-fun m!1261827 () Bool)

(assert (=> b!1377469 m!1261827))

(declare-fun m!1261829 () Bool)

(assert (=> b!1377469 m!1261829))

(declare-fun m!1261831 () Bool)

(assert (=> bm!65904 m!1261831))

(declare-fun m!1261833 () Bool)

(assert (=> b!1377464 m!1261833))

(declare-fun m!1261835 () Bool)

(assert (=> b!1377464 m!1261835))

(declare-fun m!1261837 () Bool)

(assert (=> b!1377464 m!1261837))

(declare-fun m!1261839 () Bool)

(assert (=> bm!65905 m!1261839))

(declare-fun m!1261841 () Bool)

(assert (=> b!1377466 m!1261841))

(declare-fun m!1261843 () Bool)

(assert (=> b!1377466 m!1261843))

(declare-fun m!1261845 () Bool)

(assert (=> b!1377466 m!1261845))

(declare-fun m!1261847 () Bool)

(assert (=> b!1377472 m!1261847))

(assert (=> b!1377472 m!1261847))

(declare-fun m!1261849 () Bool)

(assert (=> b!1377472 m!1261849))

(check-sat (not b!1377467) (not start!116992) (not b!1377471) (not bm!65904) (not b!1377472) (not b!1377465) (not b!1377464) (not bm!65905) (not b!1377466) (not b!1377470) (not b!1377469))
(check-sat)
