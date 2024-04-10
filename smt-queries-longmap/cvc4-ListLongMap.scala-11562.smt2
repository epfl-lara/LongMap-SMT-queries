; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134658 () Bool)

(assert start!134658)

(declare-fun res!1073666 () Bool)

(declare-fun e!876181 () Bool)

(assert (=> start!134658 (=> (not res!1073666) (not e!876181))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134658 (= res!1073666 (validMask!0 mask!4043))))

(assert (=> start!134658 e!876181))

(assert (=> start!134658 true))

(declare-datatypes ((array!104860 0))(
  ( (array!104861 (arr!50607 (Array (_ BitVec 32) (_ BitVec 64))) (size!51157 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104860)

(declare-fun array_inv!39334 (array!104860) Bool)

(assert (=> start!134658 (array_inv!39334 a!3462)))

(declare-fun b!1571426 () Bool)

(declare-fun res!1073663 () Bool)

(assert (=> b!1571426 (=> (not res!1073663) (not e!876181))))

(assert (=> b!1571426 (= res!1073663 (= (size!51157 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571427 () Bool)

(declare-fun res!1073667 () Bool)

(assert (=> b!1571427 (=> (not res!1073667) (not e!876181))))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571427 (= res!1073667 (validKeyInArray!0 k!2731))))

(declare-fun b!1571428 () Bool)

(declare-fun res!1073665 () Bool)

(assert (=> b!1571428 (=> (not res!1073665) (not e!876181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104860 (_ BitVec 32)) Bool)

(assert (=> b!1571428 (= res!1073665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571429 () Bool)

(declare-datatypes ((SeekEntryResult!13544 0))(
  ( (MissingZero!13544 (index!56574 (_ BitVec 32))) (Found!13544 (index!56575 (_ BitVec 32))) (Intermediate!13544 (undefined!14356 Bool) (index!56576 (_ BitVec 32)) (x!141270 (_ BitVec 32))) (Undefined!13544) (MissingVacant!13544 (index!56577 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!104860 (_ BitVec 32)) SeekEntryResult!13544)

(assert (=> b!1571429 (= e!876181 (is-Found!13544 (seekEntry!0 k!2731 a!3462 mask!4043)))))

(declare-fun b!1571430 () Bool)

(declare-fun res!1073664 () Bool)

(assert (=> b!1571430 (=> (not res!1073664) (not e!876181))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104860 (_ BitVec 32)) SeekEntryResult!13544)

(assert (=> b!1571430 (= res!1073664 (not (is-Found!13544 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))))

(assert (= (and start!134658 res!1073666) b!1571426))

(assert (= (and b!1571426 res!1073663) b!1571428))

(assert (= (and b!1571428 res!1073665) b!1571427))

(assert (= (and b!1571427 res!1073667) b!1571430))

(assert (= (and b!1571430 res!1073664) b!1571429))

(declare-fun m!1445383 () Bool)

(assert (=> start!134658 m!1445383))

(declare-fun m!1445385 () Bool)

(assert (=> start!134658 m!1445385))

(declare-fun m!1445387 () Bool)

(assert (=> b!1571428 m!1445387))

(declare-fun m!1445389 () Bool)

(assert (=> b!1571427 m!1445389))

(declare-fun m!1445391 () Bool)

(assert (=> b!1571429 m!1445391))

(declare-fun m!1445393 () Bool)

(assert (=> b!1571430 m!1445393))

(push 1)

(assert (not b!1571428))

(assert (not b!1571430))

(assert (not b!1571427))

(assert (not b!1571429))

(assert (not start!134658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164531 () Bool)

(assert (=> d!164531 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134658 d!164531))

(declare-fun d!164541 () Bool)

(assert (=> d!164541 (= (array_inv!39334 a!3462) (bvsge (size!51157 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134658 d!164541))

(declare-fun b!1571467 () Bool)

(declare-fun e!876207 () SeekEntryResult!13544)

(assert (=> b!1571467 (= e!876207 Undefined!13544)))

(declare-fun b!1571468 () Bool)

(declare-fun e!876208 () SeekEntryResult!13544)

(declare-fun lt!673588 () SeekEntryResult!13544)

(assert (=> b!1571468 (= e!876208 (MissingZero!13544 (index!56576 lt!673588)))))

(declare-fun d!164543 () Bool)

(declare-fun lt!673587 () SeekEntryResult!13544)

(assert (=> d!164543 (and (or (is-Undefined!13544 lt!673587) (not (is-Found!13544 lt!673587)) (and (bvsge (index!56575 lt!673587) #b00000000000000000000000000000000) (bvslt (index!56575 lt!673587) (size!51157 a!3462)))) (or (is-Undefined!13544 lt!673587) (is-Found!13544 lt!673587) (not (is-MissingZero!13544 lt!673587)) (and (bvsge (index!56574 lt!673587) #b00000000000000000000000000000000) (bvslt (index!56574 lt!673587) (size!51157 a!3462)))) (or (is-Undefined!13544 lt!673587) (is-Found!13544 lt!673587) (is-MissingZero!13544 lt!673587) (not (is-MissingVacant!13544 lt!673587)) (and (bvsge (index!56577 lt!673587) #b00000000000000000000000000000000) (bvslt (index!56577 lt!673587) (size!51157 a!3462)))) (or (is-Undefined!13544 lt!673587) (ite (is-Found!13544 lt!673587) (= (select (arr!50607 a!3462) (index!56575 lt!673587)) k!2731) (ite (is-MissingZero!13544 lt!673587) (= (select (arr!50607 a!3462) (index!56574 lt!673587)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13544 lt!673587) (= (select (arr!50607 a!3462) (index!56577 lt!673587)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164543 (= lt!673587 e!876207)))

(declare-fun c!145130 () Bool)

(assert (=> d!164543 (= c!145130 (and (is-Intermediate!13544 lt!673588) (undefined!14356 lt!673588)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104860 (_ BitVec 32)) SeekEntryResult!13544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!164543 (= lt!673588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2731 mask!4043) k!2731 a!3462 mask!4043))))

(assert (=> d!164543 (validMask!0 mask!4043)))

(assert (=> d!164543 (= (seekEntryOrOpen!0 k!2731 a!3462 mask!4043) lt!673587)))

(declare-fun b!1571469 () Bool)

(declare-fun e!876209 () SeekEntryResult!13544)

(assert (=> b!1571469 (= e!876207 e!876209)))

(declare-fun lt!673586 () (_ BitVec 64))

(assert (=> b!1571469 (= lt!673586 (select (arr!50607 a!3462) (index!56576 lt!673588)))))

(declare-fun c!145129 () Bool)

(assert (=> b!1571469 (= c!145129 (= lt!673586 k!2731))))

(declare-fun b!1571470 () Bool)

(assert (=> b!1571470 (= e!876209 (Found!13544 (index!56576 lt!673588)))))

(declare-fun b!1571471 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104860 (_ BitVec 32)) SeekEntryResult!13544)

(assert (=> b!1571471 (= e!876208 (seekKeyOrZeroReturnVacant!0 (x!141270 lt!673588) (index!56576 lt!673588) (index!56576 lt!673588) k!2731 a!3462 mask!4043))))

(declare-fun b!1571472 () Bool)

(declare-fun c!145131 () Bool)

(assert (=> b!1571472 (= c!145131 (= lt!673586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571472 (= e!876209 e!876208)))

(assert (= (and d!164543 c!145130) b!1571467))

(assert (= (and d!164543 (not c!145130)) b!1571469))

(assert (= (and b!1571469 c!145129) b!1571470))

(assert (= (and b!1571469 (not c!145129)) b!1571472))

(assert (= (and b!1571472 c!145131) b!1571468))

(assert (= (and b!1571472 (not c!145131)) b!1571471))

(declare-fun m!1445419 () Bool)

(assert (=> d!164543 m!1445419))

(declare-fun m!1445421 () Bool)

(assert (=> d!164543 m!1445421))

(declare-fun m!1445423 () Bool)

(assert (=> d!164543 m!1445423))

(assert (=> d!164543 m!1445383))

(assert (=> d!164543 m!1445423))

(declare-fun m!1445425 () Bool)

(assert (=> d!164543 m!1445425))

(declare-fun m!1445427 () Bool)

(assert (=> d!164543 m!1445427))

(declare-fun m!1445429 () Bool)

(assert (=> b!1571469 m!1445429))

(declare-fun m!1445431 () Bool)

(assert (=> b!1571471 m!1445431))

(assert (=> b!1571430 d!164543))

(declare-fun bm!72368 () Bool)

(declare-fun call!72371 () Bool)

(assert (=> bm!72368 (= call!72371 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun b!1571517 () Bool)

(declare-fun e!876234 () Bool)

(assert (=> b!1571517 (= e!876234 call!72371)))

(declare-fun b!1571519 () Bool)

(declare-fun e!876235 () Bool)

(assert (=> b!1571519 (= e!876235 call!72371)))

(declare-fun b!1571520 () Bool)

(assert (=> b!1571520 (= e!876234 e!876235)))

(declare-fun lt!673616 () (_ BitVec 64))

(assert (=> b!1571520 (= lt!673616 (select (arr!50607 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52112 0))(
  ( (Unit!52113) )
))
(declare-fun lt!673617 () Unit!52112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104860 (_ BitVec 64) (_ BitVec 32)) Unit!52112)

(assert (=> b!1571520 (= lt!673617 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673616 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571520 (arrayContainsKey!0 a!3462 lt!673616 #b00000000000000000000000000000000)))

(declare-fun lt!673618 () Unit!52112)

(assert (=> b!1571520 (= lt!673618 lt!673617)))

(declare-fun res!1073685 () Bool)

(assert (=> b!1571520 (= res!1073685 (= (seekEntryOrOpen!0 (select (arr!50607 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13544 #b00000000000000000000000000000000)))))

(assert (=> b!1571520 (=> (not res!1073685) (not e!876235))))

(declare-fun b!1571518 () Bool)

(declare-fun e!876236 () Bool)

(assert (=> b!1571518 (= e!876236 e!876234)))

(declare-fun c!145152 () Bool)

(assert (=> b!1571518 (= c!145152 (validKeyInArray!0 (select (arr!50607 a!3462) #b00000000000000000000000000000000)))))

(declare-fun d!164553 () Bool)

(declare-fun res!1073684 () Bool)

(assert (=> d!164553 (=> res!1073684 e!876236)))

(assert (=> d!164553 (= res!1073684 (bvsge #b00000000000000000000000000000000 (size!51157 a!3462)))))

(assert (=> d!164553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876236)))

(assert (= (and d!164553 (not res!1073684)) b!1571518))

(assert (= (and b!1571518 c!145152) b!1571520))

(assert (= (and b!1571518 (not c!145152)) b!1571517))

(assert (= (and b!1571520 res!1073685) b!1571519))

(assert (= (or b!1571519 b!1571517) bm!72368))

(declare-fun m!1445457 () Bool)

(assert (=> bm!72368 m!1445457))

(declare-fun m!1445459 () Bool)

(assert (=> b!1571520 m!1445459))

(declare-fun m!1445461 () Bool)

(assert (=> b!1571520 m!1445461))

(declare-fun m!1445463 () Bool)

(assert (=> b!1571520 m!1445463))

(assert (=> b!1571520 m!1445459))

(declare-fun m!1445465 () Bool)

(assert (=> b!1571520 m!1445465))

(assert (=> b!1571518 m!1445459))

(assert (=> b!1571518 m!1445459))

(declare-fun m!1445467 () Bool)

(assert (=> b!1571518 m!1445467))

(assert (=> b!1571428 d!164553))

(declare-fun d!164559 () Bool)

(declare-fun lt!673645 () SeekEntryResult!13544)

(assert (=> d!164559 (and (or (is-MissingVacant!13544 lt!673645) (not (is-Found!13544 lt!673645)) (and (bvsge (index!56575 lt!673645) #b00000000000000000000000000000000) (bvslt (index!56575 lt!673645) (size!51157 a!3462)))) (not (is-MissingVacant!13544 lt!673645)) (or (not (is-Found!13544 lt!673645)) (= (select (arr!50607 a!3462) (index!56575 lt!673645)) k!2731)))))

(declare-fun e!876258 () SeekEntryResult!13544)

(assert (=> d!164559 (= lt!673645 e!876258)))

(declare-fun c!145174 () Bool)

(declare-fun lt!673647 () SeekEntryResult!13544)

(assert (=> d!164559 (= c!145174 (and (is-Intermediate!13544 lt!673647) (undefined!14356 lt!673647)))))

(assert (=> d!164559 (= lt!673647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2731 mask!4043) k!2731 a!3462 mask!4043))))

(assert (=> d!164559 (validMask!0 mask!4043)))

(assert (=> d!164559 (= (seekEntry!0 k!2731 a!3462 mask!4043) lt!673645)))

(declare-fun b!1571563 () Bool)

(declare-fun e!876259 () SeekEntryResult!13544)

(declare-fun lt!673648 () SeekEntryResult!13544)

(assert (=> b!1571563 (= e!876259 (ite (is-MissingVacant!13544 lt!673648) (MissingZero!13544 (index!56577 lt!673648)) lt!673648))))

(assert (=> b!1571563 (= lt!673648 (seekKeyOrZeroReturnVacant!0 (x!141270 lt!673647) (index!56576 lt!673647) (index!56576 lt!673647) k!2731 a!3462 mask!4043))))

(declare-fun b!1571564 () Bool)

(assert (=> b!1571564 (= e!876259 (MissingZero!13544 (index!56576 lt!673647)))))

(declare-fun b!1571565 () Bool)

(declare-fun c!145176 () Bool)

(declare-fun lt!673646 () (_ BitVec 64))

(assert (=> b!1571565 (= c!145176 (= lt!673646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!876260 () SeekEntryResult!13544)

(assert (=> b!1571565 (= e!876260 e!876259)))

(declare-fun b!1571566 () Bool)

(assert (=> b!1571566 (= e!876260 (Found!13544 (index!56576 lt!673647)))))

(declare-fun b!1571567 () Bool)

(assert (=> b!1571567 (= e!876258 Undefined!13544)))

(declare-fun b!1571568 () Bool)

(assert (=> b!1571568 (= e!876258 e!876260)))

(assert (=> b!1571568 (= lt!673646 (select (arr!50607 a!3462) (index!56576 lt!673647)))))

(declare-fun c!145175 () Bool)

(assert (=> b!1571568 (= c!145175 (= lt!673646 k!2731))))

(assert (= (and d!164559 c!145174) b!1571567))

(assert (= (and d!164559 (not c!145174)) b!1571568))

(assert (= (and b!1571568 c!145175) b!1571566))

(assert (= (and b!1571568 (not c!145175)) b!1571565))

(assert (= (and b!1571565 c!145176) b!1571564))

(assert (= (and b!1571565 (not c!145176)) b!1571563))

(declare-fun m!1445475 () Bool)

