; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31200 () Bool)

(assert start!31200)

(declare-fun res!169682 () Bool)

(declare-fun e!195367 () Bool)

(assert (=> start!31200 (=> (not res!169682) (not e!195367))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31200 (= res!169682 (validMask!0 mask!3709))))

(assert (=> start!31200 e!195367))

(declare-datatypes ((array!16012 0))(
  ( (array!16013 (arr!7585 (Array (_ BitVec 32) (_ BitVec 64))) (size!7937 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16012)

(declare-fun array_inv!5548 (array!16012) Bool)

(assert (=> start!31200 (array_inv!5548 a!3293)))

(assert (=> start!31200 true))

(declare-fun b!313503 () Bool)

(declare-fun res!169681 () Bool)

(assert (=> b!313503 (=> (not res!169681) (not e!195367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16012 (_ BitVec 32)) Bool)

(assert (=> b!313503 (= res!169681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313504 () Bool)

(declare-fun res!169677 () Bool)

(declare-fun e!195369 () Bool)

(assert (=> b!313504 (=> (not res!169677) (not e!195369))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!313504 (= res!169677 (and (= (select (arr!7585 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7937 a!3293))))))

(declare-fun b!313505 () Bool)

(declare-fun res!169676 () Bool)

(assert (=> b!313505 (=> (not res!169676) (not e!195367))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2725 0))(
  ( (MissingZero!2725 (index!13076 (_ BitVec 32))) (Found!2725 (index!13077 (_ BitVec 32))) (Intermediate!2725 (undefined!3537 Bool) (index!13078 (_ BitVec 32)) (x!31286 (_ BitVec 32))) (Undefined!2725) (MissingVacant!2725 (index!13079 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16012 (_ BitVec 32)) SeekEntryResult!2725)

(assert (=> b!313505 (= res!169676 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2725 i!1240)))))

(declare-fun b!313506 () Bool)

(declare-fun e!195368 () Bool)

(declare-fun lt!153580 () SeekEntryResult!2725)

(assert (=> b!313506 (= e!195368 (not (or (not (is-Intermediate!2725 lt!153580)) (bvsge (x!31286 lt!153580) (bvadd #b00000000000000000000000000000001 x!1427)))))))

(declare-fun lt!153581 () SeekEntryResult!2725)

(assert (=> b!313506 (= lt!153581 lt!153580)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16012 (_ BitVec 32)) SeekEntryResult!2725)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313506 (= lt!153580 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313507 () Bool)

(declare-fun res!169678 () Bool)

(assert (=> b!313507 (=> (not res!169678) (not e!195367))))

(assert (=> b!313507 (= res!169678 (and (= (size!7937 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7937 a!3293))))))

(declare-fun b!313508 () Bool)

(declare-fun res!169675 () Bool)

(assert (=> b!313508 (=> (not res!169675) (not e!195367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313508 (= res!169675 (validKeyInArray!0 k!2441))))

(declare-fun b!313509 () Bool)

(assert (=> b!313509 (= e!195367 e!195369)))

(declare-fun res!169680 () Bool)

(assert (=> b!313509 (=> (not res!169680) (not e!195369))))

(declare-fun lt!153582 () SeekEntryResult!2725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313509 (= res!169680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153582))))

(assert (=> b!313509 (= lt!153582 (Intermediate!2725 false resIndex!52 resX!52))))

(declare-fun b!313510 () Bool)

(declare-fun res!169683 () Bool)

(assert (=> b!313510 (=> (not res!169683) (not e!195367))))

(declare-fun arrayContainsKey!0 (array!16012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313510 (= res!169683 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313511 () Bool)

(assert (=> b!313511 (= e!195369 e!195368)))

(declare-fun res!169679 () Bool)

(assert (=> b!313511 (=> (not res!169679) (not e!195368))))

(assert (=> b!313511 (= res!169679 (and (= lt!153581 lt!153582) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7585 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7585 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7585 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313511 (= lt!153581 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31200 res!169682) b!313507))

(assert (= (and b!313507 res!169678) b!313508))

(assert (= (and b!313508 res!169675) b!313510))

(assert (= (and b!313510 res!169683) b!313505))

(assert (= (and b!313505 res!169676) b!313503))

(assert (= (and b!313503 res!169681) b!313509))

(assert (= (and b!313509 res!169680) b!313504))

(assert (= (and b!313504 res!169677) b!313511))

(assert (= (and b!313511 res!169679) b!313506))

(declare-fun m!323409 () Bool)

(assert (=> b!313511 m!323409))

(declare-fun m!323411 () Bool)

(assert (=> b!313511 m!323411))

(declare-fun m!323413 () Bool)

(assert (=> start!31200 m!323413))

(declare-fun m!323415 () Bool)

(assert (=> start!31200 m!323415))

(declare-fun m!323417 () Bool)

(assert (=> b!313504 m!323417))

(declare-fun m!323419 () Bool)

(assert (=> b!313503 m!323419))

(declare-fun m!323421 () Bool)

(assert (=> b!313505 m!323421))

(declare-fun m!323423 () Bool)

(assert (=> b!313508 m!323423))

(declare-fun m!323425 () Bool)

(assert (=> b!313509 m!323425))

(assert (=> b!313509 m!323425))

(declare-fun m!323427 () Bool)

(assert (=> b!313509 m!323427))

(declare-fun m!323429 () Bool)

(assert (=> b!313510 m!323429))

(declare-fun m!323431 () Bool)

(assert (=> b!313506 m!323431))

(assert (=> b!313506 m!323431))

(declare-fun m!323433 () Bool)

(assert (=> b!313506 m!323433))

(push 1)

(assert (not start!31200))

(assert (not b!313511))

(assert (not b!313505))

(assert (not b!313506))

(assert (not b!313508))

(assert (not b!313503))

(assert (not b!313509))

(assert (not b!313510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68607 () Bool)

(assert (=> d!68607 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313508 d!68607))

(declare-fun d!68611 () Bool)

(declare-fun res!169726 () Bool)

(declare-fun e!195447 () Bool)

(assert (=> d!68611 (=> res!169726 e!195447)))

(assert (=> d!68611 (= res!169726 (bvsge #b00000000000000000000000000000000 (size!7937 a!3293)))))

(assert (=> d!68611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195447)))

(declare-fun bm!25948 () Bool)

(declare-fun call!25951 () Bool)

(assert (=> bm!25948 (= call!25951 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313634 () Bool)

(declare-fun e!195446 () Bool)

(assert (=> b!313634 (= e!195447 e!195446)))

(declare-fun c!49563 () Bool)

(assert (=> b!313634 (= c!49563 (validKeyInArray!0 (select (arr!7585 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313635 () Bool)

(declare-fun e!195448 () Bool)

(assert (=> b!313635 (= e!195446 e!195448)))

(declare-fun lt!153634 () (_ BitVec 64))

(assert (=> b!313635 (= lt!153634 (select (arr!7585 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9681 0))(
  ( (Unit!9682) )
))
(declare-fun lt!153636 () Unit!9681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16012 (_ BitVec 64) (_ BitVec 32)) Unit!9681)

(assert (=> b!313635 (= lt!153636 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153634 #b00000000000000000000000000000000))))

(assert (=> b!313635 (arrayContainsKey!0 a!3293 lt!153634 #b00000000000000000000000000000000)))

(declare-fun lt!153635 () Unit!9681)

(assert (=> b!313635 (= lt!153635 lt!153636)))

(declare-fun res!169725 () Bool)

(assert (=> b!313635 (= res!169725 (= (seekEntryOrOpen!0 (select (arr!7585 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2725 #b00000000000000000000000000000000)))))

(assert (=> b!313635 (=> (not res!169725) (not e!195448))))

(declare-fun b!313636 () Bool)

(assert (=> b!313636 (= e!195446 call!25951)))

(declare-fun b!313637 () Bool)

(assert (=> b!313637 (= e!195448 call!25951)))

(assert (= (and d!68611 (not res!169726)) b!313634))

(assert (= (and b!313634 c!49563) b!313635))

(assert (= (and b!313634 (not c!49563)) b!313636))

(assert (= (and b!313635 res!169725) b!313637))

(assert (= (or b!313637 b!313636) bm!25948))

(declare-fun m!323485 () Bool)

(assert (=> bm!25948 m!323485))

(declare-fun m!323487 () Bool)

(assert (=> b!313634 m!323487))

(assert (=> b!313634 m!323487))

(declare-fun m!323489 () Bool)

(assert (=> b!313634 m!323489))

(assert (=> b!313635 m!323487))

(declare-fun m!323491 () Bool)

(assert (=> b!313635 m!323491))

(declare-fun m!323493 () Bool)

(assert (=> b!313635 m!323493))

(assert (=> b!313635 m!323487))

(declare-fun m!323495 () Bool)

(assert (=> b!313635 m!323495))

(assert (=> b!313503 d!68611))

(declare-fun b!313704 () Bool)

(declare-fun lt!153670 () SeekEntryResult!2725)

(assert (=> b!313704 (and (bvsge (index!13078 lt!153670) #b00000000000000000000000000000000) (bvslt (index!13078 lt!153670) (size!7937 a!3293)))))

(declare-fun e!195489 () Bool)

(assert (=> b!313704 (= e!195489 (= (select (arr!7585 a!3293) (index!13078 lt!153670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313705 () Bool)

(declare-fun e!195488 () Bool)

(assert (=> b!313705 (= e!195488 (bvsge (x!31286 lt!153670) #b01111111111111111111111111111110))))

(declare-fun d!68619 () Bool)

(assert (=> d!68619 e!195488))

(declare-fun c!49587 () Bool)

(assert (=> d!68619 (= c!49587 (and (is-Intermediate!2725 lt!153670) (undefined!3537 lt!153670)))))

(declare-fun e!195491 () SeekEntryResult!2725)

(assert (=> d!68619 (= lt!153670 e!195491)))

(declare-fun c!49586 () Bool)

(assert (=> d!68619 (= c!49586 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153671 () (_ BitVec 64))

(assert (=> d!68619 (= lt!153671 (select (arr!7585 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68619 (validMask!0 mask!3709)))

(assert (=> d!68619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153670)))

(declare-fun b!313706 () Bool)

(declare-fun e!195492 () Bool)

(assert (=> b!313706 (= e!195488 e!195492)))

(declare-fun res!169753 () Bool)

(assert (=> b!313706 (= res!169753 (and (is-Intermediate!2725 lt!153670) (not (undefined!3537 lt!153670)) (bvslt (x!31286 lt!153670) #b01111111111111111111111111111110) (bvsge (x!31286 lt!153670) #b00000000000000000000000000000000) (bvsge (x!31286 lt!153670) #b00000000000000000000000000000000)))))

(assert (=> b!313706 (=> (not res!169753) (not e!195492))))

(declare-fun b!313707 () Bool)

(assert (=> b!313707 (and (bvsge (index!13078 lt!153670) #b00000000000000000000000000000000) (bvslt (index!13078 lt!153670) (size!7937 a!3293)))))

(declare-fun res!169752 () Bool)

(assert (=> b!313707 (= res!169752 (= (select (arr!7585 a!3293) (index!13078 lt!153670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313707 (=> res!169752 e!195489)))

(declare-fun b!313708 () Bool)

(declare-fun e!195490 () SeekEntryResult!2725)

(assert (=> b!313708 (= e!195491 e!195490)))

(declare-fun c!49585 () Bool)

(assert (=> b!313708 (= c!49585 (or (= lt!153671 k!2441) (= (bvadd lt!153671 lt!153671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313709 () Bool)

(assert (=> b!313709 (= e!195491 (Intermediate!2725 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313710 () Bool)

(assert (=> b!313710 (= e!195490 (Intermediate!2725 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313711 () Bool)

(assert (=> b!313711 (and (bvsge (index!13078 lt!153670) #b00000000000000000000000000000000) (bvslt (index!13078 lt!153670) (size!7937 a!3293)))))

(declare-fun res!169754 () Bool)

(assert (=> b!313711 (= res!169754 (= (select (arr!7585 a!3293) (index!13078 lt!153670)) k!2441))))

(assert (=> b!313711 (=> res!169754 e!195489)))

(assert (=> b!313711 (= e!195492 e!195489)))

(declare-fun b!313712 () Bool)

(assert (=> b!313712 (= e!195490 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68619 c!49586) b!313709))

(assert (= (and d!68619 (not c!49586)) b!313708))

(assert (= (and b!313708 c!49585) b!313710))

(assert (= (and b!313708 (not c!49585)) b!313712))

(assert (= (and d!68619 c!49587) b!313705))

(assert (= (and d!68619 (not c!49587)) b!313706))

(assert (= (and b!313706 res!169753) b!313711))

(assert (= (and b!313711 (not res!169754)) b!313707))

(assert (= (and b!313707 (not res!169752)) b!313704))

(declare-fun m!323539 () Bool)

(assert (=> b!313704 m!323539))

(assert (=> d!68619 m!323425))

(declare-fun m!323541 () Bool)

(assert (=> d!68619 m!323541))

(assert (=> d!68619 m!323413))

(assert (=> b!313712 m!323425))

(declare-fun m!323543 () Bool)

(assert (=> b!313712 m!323543))

(assert (=> b!313712 m!323543))

(declare-fun m!323545 () Bool)

(assert (=> b!313712 m!323545))

(assert (=> b!313711 m!323539))

(assert (=> b!313707 m!323539))

(assert (=> b!313509 d!68619))

(declare-fun d!68639 () Bool)

(declare-fun lt!153677 () (_ BitVec 32))

(declare-fun lt!153676 () (_ BitVec 32))

(assert (=> d!68639 (= lt!153677 (bvmul (bvxor lt!153676 (bvlshr lt!153676 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68639 (= lt!153676 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68639 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169755 (let ((h!5354 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31294 (bvmul (bvxor h!5354 (bvlshr h!5354 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31294 (bvlshr x!31294 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169755 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169755 #b00000000000000000000000000000000))))))

(assert (=> d!68639 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153677 (bvlshr lt!153677 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313509 d!68639))

(declare-fun d!68643 () Bool)

(declare-fun res!169760 () Bool)

(declare-fun e!195497 () Bool)

(assert (=> d!68643 (=> res!169760 e!195497)))

(assert (=> d!68643 (= res!169760 (= (select (arr!7585 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68643 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195497)))

(declare-fun b!313717 () Bool)

(declare-fun e!195498 () Bool)

(assert (=> b!313717 (= e!195497 e!195498)))

(declare-fun res!169761 () Bool)

(assert (=> b!313717 (=> (not res!169761) (not e!195498))))

(assert (=> b!313717 (= res!169761 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7937 a!3293)))))

(declare-fun b!313718 () Bool)

(assert (=> b!313718 (= e!195498 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68643 (not res!169760)) b!313717))

(assert (= (and b!313717 res!169761) b!313718))

(assert (=> d!68643 m!323487))

(declare-fun m!323547 () Bool)

(assert (=> b!313718 m!323547))

(assert (=> b!313510 d!68643))

(declare-fun b!313731 () Bool)

(declare-fun e!195505 () SeekEntryResult!2725)

(declare-fun lt!153686 () SeekEntryResult!2725)

(assert (=> b!313731 (= e!195505 (MissingZero!2725 (index!13078 lt!153686)))))

(declare-fun b!313732 () Bool)

(declare-fun e!195506 () SeekEntryResult!2725)

(assert (=> b!313732 (= e!195506 Undefined!2725)))

(declare-fun d!68645 () Bool)

(declare-fun lt!153684 () SeekEntryResult!2725)

(assert (=> d!68645 (and (or (is-Undefined!2725 lt!153684) (not (is-Found!2725 lt!153684)) (and (bvsge (index!13077 lt!153684) #b00000000000000000000000000000000) (bvslt (index!13077 lt!153684) (size!7937 a!3293)))) (or (is-Undefined!2725 lt!153684) (is-Found!2725 lt!153684) (not (is-MissingZero!2725 lt!153684)) (and (bvsge (index!13076 lt!153684) #b00000000000000000000000000000000) (bvslt (index!13076 lt!153684) (size!7937 a!3293)))) (or (is-Undefined!2725 lt!153684) (is-Found!2725 lt!153684) (is-MissingZero!2725 lt!153684) (not (is-MissingVacant!2725 lt!153684)) (and (bvsge (index!13079 lt!153684) #b00000000000000000000000000000000) (bvslt (index!13079 lt!153684) (size!7937 a!3293)))) (or (is-Undefined!2725 lt!153684) (ite (is-Found!2725 lt!153684) (= (select (arr!7585 a!3293) (index!13077 lt!153684)) k!2441) (ite (is-MissingZero!2725 lt!153684) (= (select (arr!7585 a!3293) (index!13076 lt!153684)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2725 lt!153684) (= (select (arr!7585 a!3293) (index!13079 lt!153684)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68645 (= lt!153684 e!195506)))

(declare-fun c!49595 () Bool)

(assert (=> d!68645 (= c!49595 (and (is-Intermediate!2725 lt!153686) (undefined!3537 lt!153686)))))

(assert (=> d!68645 (= lt!153686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68645 (validMask!0 mask!3709)))

(assert (=> d!68645 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153684)))

(declare-fun b!313733 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16012 (_ BitVec 32)) SeekEntryResult!2725)

