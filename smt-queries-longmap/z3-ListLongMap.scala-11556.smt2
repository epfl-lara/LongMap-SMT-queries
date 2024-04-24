; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135006 () Bool)

(assert start!135006)

(declare-fun b!1573614 () Bool)

(declare-fun res!1074293 () Bool)

(declare-fun e!877543 () Bool)

(assert (=> b!1573614 (=> (not res!1074293) (not e!877543))))

(declare-datatypes ((array!104939 0))(
  ( (array!104940 (arr!50641 (Array (_ BitVec 32) (_ BitVec 64))) (size!51192 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104939)

(declare-fun mask!4043 () (_ BitVec 32))

(assert (=> b!1573614 (= res!1074293 (= (size!51192 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1573617 () Bool)

(assert (=> b!1573617 (= e!877543 (bvslt mask!4043 #b00000000000000000000000000000000))))

(declare-fun res!1074295 () Bool)

(assert (=> start!135006 (=> (not res!1074295) (not e!877543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135006 (= res!1074295 (validMask!0 mask!4043))))

(assert (=> start!135006 e!877543))

(assert (=> start!135006 true))

(declare-fun array_inv!39596 (array!104939) Bool)

(assert (=> start!135006 (array_inv!39596 a!3462)))

(declare-fun b!1573615 () Bool)

(declare-fun res!1074294 () Bool)

(assert (=> b!1573615 (=> (not res!1074294) (not e!877543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104939 (_ BitVec 32)) Bool)

(assert (=> b!1573615 (= res!1074294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1573616 () Bool)

(declare-fun res!1074296 () Bool)

(assert (=> b!1573616 (=> (not res!1074296) (not e!877543))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573616 (= res!1074296 (validKeyInArray!0 k0!2731))))

(assert (= (and start!135006 res!1074295) b!1573614))

(assert (= (and b!1573614 res!1074293) b!1573615))

(assert (= (and b!1573615 res!1074294) b!1573616))

(assert (= (and b!1573616 res!1074296) b!1573617))

(declare-fun m!1447431 () Bool)

(assert (=> start!135006 m!1447431))

(declare-fun m!1447433 () Bool)

(assert (=> start!135006 m!1447433))

(declare-fun m!1447435 () Bool)

(assert (=> b!1573615 m!1447435))

(declare-fun m!1447437 () Bool)

(assert (=> b!1573616 m!1447437))

(check-sat (not b!1573615) (not start!135006) (not b!1573616))
(check-sat)
(get-model)

(declare-fun b!1573658 () Bool)

(declare-fun e!877570 () Bool)

(declare-fun e!877569 () Bool)

(assert (=> b!1573658 (= e!877570 e!877569)))

(declare-fun lt!674411 () (_ BitVec 64))

(assert (=> b!1573658 (= lt!674411 (select (arr!50641 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52011 0))(
  ( (Unit!52012) )
))
(declare-fun lt!674410 () Unit!52011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104939 (_ BitVec 64) (_ BitVec 32)) Unit!52011)

(assert (=> b!1573658 (= lt!674410 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!674411 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573658 (arrayContainsKey!0 a!3462 lt!674411 #b00000000000000000000000000000000)))

(declare-fun lt!674412 () Unit!52011)

(assert (=> b!1573658 (= lt!674412 lt!674410)))

(declare-fun res!1074329 () Bool)

(declare-datatypes ((SeekEntryResult!13478 0))(
  ( (MissingZero!13478 (index!56310 (_ BitVec 32))) (Found!13478 (index!56311 (_ BitVec 32))) (Intermediate!13478 (undefined!14290 Bool) (index!56312 (_ BitVec 32)) (x!141207 (_ BitVec 32))) (Undefined!13478) (MissingVacant!13478 (index!56313 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104939 (_ BitVec 32)) SeekEntryResult!13478)

(assert (=> b!1573658 (= res!1074329 (= (seekEntryOrOpen!0 (select (arr!50641 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13478 #b00000000000000000000000000000000)))))

(assert (=> b!1573658 (=> (not res!1074329) (not e!877569))))

(declare-fun b!1573659 () Bool)

(declare-fun call!72508 () Bool)

(assert (=> b!1573659 (= e!877570 call!72508)))

(declare-fun bm!72505 () Bool)

(assert (=> bm!72505 (= call!72508 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun b!1573660 () Bool)

(assert (=> b!1573660 (= e!877569 call!72508)))

(declare-fun b!1573661 () Bool)

(declare-fun e!877571 () Bool)

(assert (=> b!1573661 (= e!877571 e!877570)))

(declare-fun c!145912 () Bool)

(assert (=> b!1573661 (= c!145912 (validKeyInArray!0 (select (arr!50641 a!3462) #b00000000000000000000000000000000)))))

(declare-fun d!165193 () Bool)

(declare-fun res!1074330 () Bool)

(assert (=> d!165193 (=> res!1074330 e!877571)))

(assert (=> d!165193 (= res!1074330 (bvsge #b00000000000000000000000000000000 (size!51192 a!3462)))))

(assert (=> d!165193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!877571)))

(assert (= (and d!165193 (not res!1074330)) b!1573661))

(assert (= (and b!1573661 c!145912) b!1573658))

(assert (= (and b!1573661 (not c!145912)) b!1573659))

(assert (= (and b!1573658 res!1074329) b!1573660))

(assert (= (or b!1573660 b!1573659) bm!72505))

(declare-fun m!1447455 () Bool)

(assert (=> b!1573658 m!1447455))

(declare-fun m!1447457 () Bool)

(assert (=> b!1573658 m!1447457))

(declare-fun m!1447459 () Bool)

(assert (=> b!1573658 m!1447459))

(assert (=> b!1573658 m!1447455))

(declare-fun m!1447461 () Bool)

(assert (=> b!1573658 m!1447461))

(declare-fun m!1447463 () Bool)

(assert (=> bm!72505 m!1447463))

(assert (=> b!1573661 m!1447455))

(assert (=> b!1573661 m!1447455))

(declare-fun m!1447465 () Bool)

(assert (=> b!1573661 m!1447465))

(assert (=> b!1573615 d!165193))

(declare-fun d!165201 () Bool)

(assert (=> d!165201 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!135006 d!165201))

(declare-fun d!165207 () Bool)

(assert (=> d!165207 (= (array_inv!39596 a!3462) (bvsge (size!51192 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!135006 d!165207))

(declare-fun d!165209 () Bool)

(assert (=> d!165209 (= (validKeyInArray!0 k0!2731) (and (not (= k0!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573616 d!165209))

(check-sat (not b!1573658) (not b!1573661) (not bm!72505))
(check-sat)
