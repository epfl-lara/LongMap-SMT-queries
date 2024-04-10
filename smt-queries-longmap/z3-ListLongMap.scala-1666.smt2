; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30832 () Bool)

(assert start!30832)

(declare-fun b!309606 () Bool)

(declare-fun res!166227 () Bool)

(declare-fun e!193388 () Bool)

(assert (=> b!309606 (=> (not res!166227) (not e!193388))))

(declare-datatypes ((array!15785 0))(
  ( (array!15786 (arr!7476 (Array (_ BitVec 32) (_ BitVec 64))) (size!7828 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15785)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!309606 (= res!166227 (and (= (select (arr!7476 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7828 a!3293))))))

(declare-fun b!309607 () Bool)

(declare-fun res!166225 () Bool)

(declare-fun e!193387 () Bool)

(assert (=> b!309607 (=> (not res!166225) (not e!193387))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15785 (_ BitVec 32)) Bool)

(assert (=> b!309607 (= res!166225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309608 () Bool)

(declare-fun res!166226 () Bool)

(assert (=> b!309608 (=> (not res!166226) (not e!193387))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2616 0))(
  ( (MissingZero!2616 (index!12640 (_ BitVec 32))) (Found!2616 (index!12641 (_ BitVec 32))) (Intermediate!2616 (undefined!3428 Bool) (index!12642 (_ BitVec 32)) (x!30868 (_ BitVec 32))) (Undefined!2616) (MissingVacant!2616 (index!12643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15785 (_ BitVec 32)) SeekEntryResult!2616)

(assert (=> b!309608 (= res!166226 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2616 i!1240)))))

(declare-fun b!309609 () Bool)

(declare-fun res!166222 () Bool)

(assert (=> b!309609 (=> (not res!166222) (not e!193387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309609 (= res!166222 (validKeyInArray!0 k0!2441))))

(declare-fun res!166220 () Bool)

(assert (=> start!30832 (=> (not res!166220) (not e!193387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30832 (= res!166220 (validMask!0 mask!3709))))

(assert (=> start!30832 e!193387))

(declare-fun array_inv!5439 (array!15785) Bool)

(assert (=> start!30832 (array_inv!5439 a!3293)))

(assert (=> start!30832 true))

(declare-fun b!309610 () Bool)

(assert (=> b!309610 (= e!193387 e!193388)))

(declare-fun res!166219 () Bool)

(assert (=> b!309610 (=> (not res!166219) (not e!193388))))

(declare-fun lt!151630 () SeekEntryResult!2616)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15785 (_ BitVec 32)) SeekEntryResult!2616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309610 (= res!166219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151630))))

(assert (=> b!309610 (= lt!151630 (Intermediate!2616 false resIndex!52 resX!52))))

(declare-fun b!309611 () Bool)

(declare-fun res!166223 () Bool)

(assert (=> b!309611 (=> (not res!166223) (not e!193387))))

(assert (=> b!309611 (= res!166223 (and (= (size!7828 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7828 a!3293))))))

(declare-fun b!309612 () Bool)

(declare-fun e!193389 () Bool)

(assert (=> b!309612 (= e!193388 e!193389)))

(declare-fun res!166224 () Bool)

(assert (=> b!309612 (=> (not res!166224) (not e!193389))))

(declare-fun lt!151631 () SeekEntryResult!2616)

(assert (=> b!309612 (= res!166224 (and (= lt!151631 lt!151630) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7476 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309612 (= lt!151631 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309613 () Bool)

(declare-fun lt!151632 () (_ BitVec 32))

(assert (=> b!309613 (= e!193389 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!151632 #b00000000000000000000000000000000) (bvslt lt!151632 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(assert (=> b!309613 (= lt!151631 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151632 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309613 (= lt!151632 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309614 () Bool)

(declare-fun res!166221 () Bool)

(assert (=> b!309614 (=> (not res!166221) (not e!193387))))

(declare-fun arrayContainsKey!0 (array!15785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309614 (= res!166221 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30832 res!166220) b!309611))

(assert (= (and b!309611 res!166223) b!309609))

(assert (= (and b!309609 res!166222) b!309614))

(assert (= (and b!309614 res!166221) b!309608))

(assert (= (and b!309608 res!166226) b!309607))

(assert (= (and b!309607 res!166225) b!309610))

(assert (= (and b!309610 res!166219) b!309606))

(assert (= (and b!309606 res!166227) b!309612))

(assert (= (and b!309612 res!166224) b!309613))

(declare-fun m!319603 () Bool)

(assert (=> b!309613 m!319603))

(declare-fun m!319605 () Bool)

(assert (=> b!309613 m!319605))

(declare-fun m!319607 () Bool)

(assert (=> b!309606 m!319607))

(declare-fun m!319609 () Bool)

(assert (=> b!309612 m!319609))

(declare-fun m!319611 () Bool)

(assert (=> b!309612 m!319611))

(declare-fun m!319613 () Bool)

(assert (=> b!309607 m!319613))

(declare-fun m!319615 () Bool)

(assert (=> b!309609 m!319615))

(declare-fun m!319617 () Bool)

(assert (=> b!309614 m!319617))

(declare-fun m!319619 () Bool)

(assert (=> b!309608 m!319619))

(declare-fun m!319621 () Bool)

(assert (=> start!30832 m!319621))

(declare-fun m!319623 () Bool)

(assert (=> start!30832 m!319623))

(declare-fun m!319625 () Bool)

(assert (=> b!309610 m!319625))

(assert (=> b!309610 m!319625))

(declare-fun m!319627 () Bool)

(assert (=> b!309610 m!319627))

(check-sat (not start!30832) (not b!309608) (not b!309614) (not b!309612) (not b!309613) (not b!309607) (not b!309609) (not b!309610))
(check-sat)
(get-model)

(declare-fun d!68345 () Bool)

(assert (=> d!68345 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!309609 d!68345))

(declare-fun d!68347 () Bool)

(declare-fun res!166259 () Bool)

(declare-fun e!193407 () Bool)

(assert (=> d!68347 (=> res!166259 e!193407)))

(assert (=> d!68347 (= res!166259 (= (select (arr!7476 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68347 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!193407)))

(declare-fun b!309646 () Bool)

(declare-fun e!193408 () Bool)

(assert (=> b!309646 (= e!193407 e!193408)))

(declare-fun res!166260 () Bool)

(assert (=> b!309646 (=> (not res!166260) (not e!193408))))

(assert (=> b!309646 (= res!166260 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7828 a!3293)))))

(declare-fun b!309647 () Bool)

(assert (=> b!309647 (= e!193408 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68347 (not res!166259)) b!309646))

(assert (= (and b!309646 res!166260) b!309647))

(declare-fun m!319655 () Bool)

(assert (=> d!68347 m!319655))

(declare-fun m!319657 () Bool)

(assert (=> b!309647 m!319657))

(assert (=> b!309614 d!68347))

(declare-fun d!68349 () Bool)

(assert (=> d!68349 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30832 d!68349))

(declare-fun d!68353 () Bool)

(assert (=> d!68353 (= (array_inv!5439 a!3293) (bvsge (size!7828 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30832 d!68353))

(declare-fun b!309678 () Bool)

(declare-fun e!193428 () SeekEntryResult!2616)

(declare-fun lt!151654 () SeekEntryResult!2616)

(assert (=> b!309678 (= e!193428 (MissingZero!2616 (index!12642 lt!151654)))))

(declare-fun b!309679 () Bool)

(declare-fun e!193429 () SeekEntryResult!2616)

(declare-fun e!193427 () SeekEntryResult!2616)

(assert (=> b!309679 (= e!193429 e!193427)))

(declare-fun lt!151655 () (_ BitVec 64))

(assert (=> b!309679 (= lt!151655 (select (arr!7476 a!3293) (index!12642 lt!151654)))))

(declare-fun c!49311 () Bool)

(assert (=> b!309679 (= c!49311 (= lt!151655 k0!2441))))

(declare-fun b!309680 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15785 (_ BitVec 32)) SeekEntryResult!2616)

(assert (=> b!309680 (= e!193428 (seekKeyOrZeroReturnVacant!0 (x!30868 lt!151654) (index!12642 lt!151654) (index!12642 lt!151654) k0!2441 a!3293 mask!3709))))

(declare-fun b!309681 () Bool)

(assert (=> b!309681 (= e!193427 (Found!2616 (index!12642 lt!151654)))))

(declare-fun d!68355 () Bool)

(declare-fun lt!151656 () SeekEntryResult!2616)

(get-info :version)

(assert (=> d!68355 (and (or ((_ is Undefined!2616) lt!151656) (not ((_ is Found!2616) lt!151656)) (and (bvsge (index!12641 lt!151656) #b00000000000000000000000000000000) (bvslt (index!12641 lt!151656) (size!7828 a!3293)))) (or ((_ is Undefined!2616) lt!151656) ((_ is Found!2616) lt!151656) (not ((_ is MissingZero!2616) lt!151656)) (and (bvsge (index!12640 lt!151656) #b00000000000000000000000000000000) (bvslt (index!12640 lt!151656) (size!7828 a!3293)))) (or ((_ is Undefined!2616) lt!151656) ((_ is Found!2616) lt!151656) ((_ is MissingZero!2616) lt!151656) (not ((_ is MissingVacant!2616) lt!151656)) (and (bvsge (index!12643 lt!151656) #b00000000000000000000000000000000) (bvslt (index!12643 lt!151656) (size!7828 a!3293)))) (or ((_ is Undefined!2616) lt!151656) (ite ((_ is Found!2616) lt!151656) (= (select (arr!7476 a!3293) (index!12641 lt!151656)) k0!2441) (ite ((_ is MissingZero!2616) lt!151656) (= (select (arr!7476 a!3293) (index!12640 lt!151656)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2616) lt!151656) (= (select (arr!7476 a!3293) (index!12643 lt!151656)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68355 (= lt!151656 e!193429)))

(declare-fun c!49310 () Bool)

(assert (=> d!68355 (= c!49310 (and ((_ is Intermediate!2616) lt!151654) (undefined!3428 lt!151654)))))

(assert (=> d!68355 (= lt!151654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68355 (validMask!0 mask!3709)))

(assert (=> d!68355 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!151656)))

(declare-fun b!309682 () Bool)

(assert (=> b!309682 (= e!193429 Undefined!2616)))

(declare-fun b!309683 () Bool)

(declare-fun c!49309 () Bool)

(assert (=> b!309683 (= c!49309 (= lt!151655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309683 (= e!193427 e!193428)))

(assert (= (and d!68355 c!49310) b!309682))

(assert (= (and d!68355 (not c!49310)) b!309679))

(assert (= (and b!309679 c!49311) b!309681))

(assert (= (and b!309679 (not c!49311)) b!309683))

(assert (= (and b!309683 c!49309) b!309678))

(assert (= (and b!309683 (not c!49309)) b!309680))

(declare-fun m!319663 () Bool)

(assert (=> b!309679 m!319663))

(declare-fun m!319665 () Bool)

(assert (=> b!309680 m!319665))

(assert (=> d!68355 m!319625))

(declare-fun m!319667 () Bool)

(assert (=> d!68355 m!319667))

(declare-fun m!319669 () Bool)

(assert (=> d!68355 m!319669))

(assert (=> d!68355 m!319625))

(assert (=> d!68355 m!319627))

(assert (=> d!68355 m!319621))

(declare-fun m!319673 () Bool)

(assert (=> d!68355 m!319673))

(assert (=> b!309608 d!68355))

(declare-fun b!309750 () Bool)

(declare-fun e!193471 () SeekEntryResult!2616)

(assert (=> b!309750 (= e!193471 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!151632 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309752 () Bool)

(declare-fun lt!151677 () SeekEntryResult!2616)

(assert (=> b!309752 (and (bvsge (index!12642 lt!151677) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151677) (size!7828 a!3293)))))

(declare-fun res!166286 () Bool)

(assert (=> b!309752 (= res!166286 (= (select (arr!7476 a!3293) (index!12642 lt!151677)) k0!2441))))

(declare-fun e!193472 () Bool)

(assert (=> b!309752 (=> res!166286 e!193472)))

(declare-fun e!193470 () Bool)

(assert (=> b!309752 (= e!193470 e!193472)))

(declare-fun b!309753 () Bool)

(assert (=> b!309753 (= e!193471 (Intermediate!2616 false lt!151632 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309754 () Bool)

(declare-fun e!193468 () Bool)

(assert (=> b!309754 (= e!193468 e!193470)))

(declare-fun res!166287 () Bool)

(assert (=> b!309754 (= res!166287 (and ((_ is Intermediate!2616) lt!151677) (not (undefined!3428 lt!151677)) (bvslt (x!30868 lt!151677) #b01111111111111111111111111111110) (bvsge (x!30868 lt!151677) #b00000000000000000000000000000000) (bvsge (x!30868 lt!151677) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!309754 (=> (not res!166287) (not e!193470))))

(declare-fun b!309755 () Bool)

(assert (=> b!309755 (= e!193468 (bvsge (x!30868 lt!151677) #b01111111111111111111111111111110))))

(declare-fun b!309756 () Bool)

(assert (=> b!309756 (and (bvsge (index!12642 lt!151677) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151677) (size!7828 a!3293)))))

(declare-fun res!166285 () Bool)

(assert (=> b!309756 (= res!166285 (= (select (arr!7476 a!3293) (index!12642 lt!151677)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309756 (=> res!166285 e!193472)))

(declare-fun b!309757 () Bool)

(assert (=> b!309757 (and (bvsge (index!12642 lt!151677) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151677) (size!7828 a!3293)))))

(assert (=> b!309757 (= e!193472 (= (select (arr!7476 a!3293) (index!12642 lt!151677)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309758 () Bool)

(declare-fun e!193469 () SeekEntryResult!2616)

(assert (=> b!309758 (= e!193469 (Intermediate!2616 true lt!151632 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309751 () Bool)

(assert (=> b!309751 (= e!193469 e!193471)))

(declare-fun c!49337 () Bool)

(declare-fun lt!151678 () (_ BitVec 64))

(assert (=> b!309751 (= c!49337 (or (= lt!151678 k0!2441) (= (bvadd lt!151678 lt!151678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68361 () Bool)

(assert (=> d!68361 e!193468))

(declare-fun c!49338 () Bool)

(assert (=> d!68361 (= c!49338 (and ((_ is Intermediate!2616) lt!151677) (undefined!3428 lt!151677)))))

(assert (=> d!68361 (= lt!151677 e!193469)))

(declare-fun c!49336 () Bool)

(assert (=> d!68361 (= c!49336 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68361 (= lt!151678 (select (arr!7476 a!3293) lt!151632))))

(assert (=> d!68361 (validMask!0 mask!3709)))

(assert (=> d!68361 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151632 k0!2441 a!3293 mask!3709) lt!151677)))

(assert (= (and d!68361 c!49336) b!309758))

(assert (= (and d!68361 (not c!49336)) b!309751))

(assert (= (and b!309751 c!49337) b!309753))

(assert (= (and b!309751 (not c!49337)) b!309750))

(assert (= (and d!68361 c!49338) b!309755))

(assert (= (and d!68361 (not c!49338)) b!309754))

(assert (= (and b!309754 res!166287) b!309752))

(assert (= (and b!309752 (not res!166286)) b!309756))

(assert (= (and b!309756 (not res!166285)) b!309757))

(declare-fun m!319697 () Bool)

(assert (=> b!309750 m!319697))

(assert (=> b!309750 m!319697))

(declare-fun m!319699 () Bool)

(assert (=> b!309750 m!319699))

(declare-fun m!319701 () Bool)

(assert (=> b!309752 m!319701))

(assert (=> b!309756 m!319701))

(assert (=> b!309757 m!319701))

(declare-fun m!319703 () Bool)

(assert (=> d!68361 m!319703))

(assert (=> d!68361 m!319621))

(assert (=> b!309613 d!68361))

(declare-fun d!68375 () Bool)

(declare-fun lt!151683 () (_ BitVec 32))

(assert (=> d!68375 (and (bvsge lt!151683 #b00000000000000000000000000000000) (bvslt lt!151683 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68375 (= lt!151683 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68375 (validMask!0 mask!3709)))

(assert (=> d!68375 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151683)))

(declare-fun bs!10880 () Bool)

(assert (= bs!10880 d!68375))

(declare-fun m!319713 () Bool)

(assert (=> bs!10880 m!319713))

(assert (=> bs!10880 m!319621))

(assert (=> b!309613 d!68375))

(declare-fun b!309776 () Bool)

(declare-fun e!193485 () Bool)

(declare-fun e!193486 () Bool)

(assert (=> b!309776 (= e!193485 e!193486)))

(declare-fun c!49344 () Bool)

(assert (=> b!309776 (= c!49344 (validKeyInArray!0 (select (arr!7476 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!309777 () Bool)

(declare-fun e!193484 () Bool)

(assert (=> b!309777 (= e!193486 e!193484)))

(declare-fun lt!151695 () (_ BitVec 64))

(assert (=> b!309777 (= lt!151695 (select (arr!7476 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9587 0))(
  ( (Unit!9588) )
))
(declare-fun lt!151694 () Unit!9587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15785 (_ BitVec 64) (_ BitVec 32)) Unit!9587)

(assert (=> b!309777 (= lt!151694 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151695 #b00000000000000000000000000000000))))

(assert (=> b!309777 (arrayContainsKey!0 a!3293 lt!151695 #b00000000000000000000000000000000)))

(declare-fun lt!151693 () Unit!9587)

(assert (=> b!309777 (= lt!151693 lt!151694)))

(declare-fun res!166296 () Bool)

(assert (=> b!309777 (= res!166296 (= (seekEntryOrOpen!0 (select (arr!7476 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2616 #b00000000000000000000000000000000)))))

(assert (=> b!309777 (=> (not res!166296) (not e!193484))))

(declare-fun d!68381 () Bool)

(declare-fun res!166295 () Bool)

(assert (=> d!68381 (=> res!166295 e!193485)))

(assert (=> d!68381 (= res!166295 (bvsge #b00000000000000000000000000000000 (size!7828 a!3293)))))

(assert (=> d!68381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!193485)))

(declare-fun b!309778 () Bool)

(declare-fun call!25921 () Bool)

(assert (=> b!309778 (= e!193486 call!25921)))

(declare-fun bm!25918 () Bool)

(assert (=> bm!25918 (= call!25921 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!309779 () Bool)

(assert (=> b!309779 (= e!193484 call!25921)))

(assert (= (and d!68381 (not res!166295)) b!309776))

(assert (= (and b!309776 c!49344) b!309777))

(assert (= (and b!309776 (not c!49344)) b!309778))

(assert (= (and b!309777 res!166296) b!309779))

(assert (= (or b!309779 b!309778) bm!25918))

(assert (=> b!309776 m!319655))

(assert (=> b!309776 m!319655))

(declare-fun m!319717 () Bool)

(assert (=> b!309776 m!319717))

(assert (=> b!309777 m!319655))

(declare-fun m!319719 () Bool)

(assert (=> b!309777 m!319719))

(declare-fun m!319721 () Bool)

(assert (=> b!309777 m!319721))

(assert (=> b!309777 m!319655))

(declare-fun m!319723 () Bool)

(assert (=> b!309777 m!319723))

(declare-fun m!319725 () Bool)

(assert (=> bm!25918 m!319725))

(assert (=> b!309607 d!68381))

(declare-fun b!309780 () Bool)

(declare-fun e!193490 () SeekEntryResult!2616)

(assert (=> b!309780 (= e!193490 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309782 () Bool)

(declare-fun lt!151696 () SeekEntryResult!2616)

(assert (=> b!309782 (and (bvsge (index!12642 lt!151696) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151696) (size!7828 a!3293)))))

(declare-fun res!166298 () Bool)

(assert (=> b!309782 (= res!166298 (= (select (arr!7476 a!3293) (index!12642 lt!151696)) k0!2441))))

(declare-fun e!193491 () Bool)

(assert (=> b!309782 (=> res!166298 e!193491)))

(declare-fun e!193489 () Bool)

(assert (=> b!309782 (= e!193489 e!193491)))

(declare-fun b!309783 () Bool)

(assert (=> b!309783 (= e!193490 (Intermediate!2616 false index!1781 x!1427))))

(declare-fun b!309784 () Bool)

(declare-fun e!193487 () Bool)

(assert (=> b!309784 (= e!193487 e!193489)))

(declare-fun res!166299 () Bool)

(assert (=> b!309784 (= res!166299 (and ((_ is Intermediate!2616) lt!151696) (not (undefined!3428 lt!151696)) (bvslt (x!30868 lt!151696) #b01111111111111111111111111111110) (bvsge (x!30868 lt!151696) #b00000000000000000000000000000000) (bvsge (x!30868 lt!151696) x!1427)))))

(assert (=> b!309784 (=> (not res!166299) (not e!193489))))

(declare-fun b!309785 () Bool)

(assert (=> b!309785 (= e!193487 (bvsge (x!30868 lt!151696) #b01111111111111111111111111111110))))

(declare-fun b!309786 () Bool)

(assert (=> b!309786 (and (bvsge (index!12642 lt!151696) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151696) (size!7828 a!3293)))))

(declare-fun res!166297 () Bool)

(assert (=> b!309786 (= res!166297 (= (select (arr!7476 a!3293) (index!12642 lt!151696)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309786 (=> res!166297 e!193491)))

(declare-fun b!309787 () Bool)

(assert (=> b!309787 (and (bvsge (index!12642 lt!151696) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151696) (size!7828 a!3293)))))

(assert (=> b!309787 (= e!193491 (= (select (arr!7476 a!3293) (index!12642 lt!151696)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309788 () Bool)

(declare-fun e!193488 () SeekEntryResult!2616)

(assert (=> b!309788 (= e!193488 (Intermediate!2616 true index!1781 x!1427))))

(declare-fun b!309781 () Bool)

(assert (=> b!309781 (= e!193488 e!193490)))

(declare-fun c!49346 () Bool)

(declare-fun lt!151697 () (_ BitVec 64))

(assert (=> b!309781 (= c!49346 (or (= lt!151697 k0!2441) (= (bvadd lt!151697 lt!151697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68385 () Bool)

(assert (=> d!68385 e!193487))

(declare-fun c!49347 () Bool)

(assert (=> d!68385 (= c!49347 (and ((_ is Intermediate!2616) lt!151696) (undefined!3428 lt!151696)))))

(assert (=> d!68385 (= lt!151696 e!193488)))

(declare-fun c!49345 () Bool)

(assert (=> d!68385 (= c!49345 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68385 (= lt!151697 (select (arr!7476 a!3293) index!1781))))

(assert (=> d!68385 (validMask!0 mask!3709)))

(assert (=> d!68385 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151696)))

(assert (= (and d!68385 c!49345) b!309788))

(assert (= (and d!68385 (not c!49345)) b!309781))

(assert (= (and b!309781 c!49346) b!309783))

(assert (= (and b!309781 (not c!49346)) b!309780))

(assert (= (and d!68385 c!49347) b!309785))

(assert (= (and d!68385 (not c!49347)) b!309784))

(assert (= (and b!309784 res!166299) b!309782))

(assert (= (and b!309782 (not res!166298)) b!309786))

(assert (= (and b!309786 (not res!166297)) b!309787))

(assert (=> b!309780 m!319605))

(assert (=> b!309780 m!319605))

(declare-fun m!319727 () Bool)

(assert (=> b!309780 m!319727))

(declare-fun m!319729 () Bool)

(assert (=> b!309782 m!319729))

(assert (=> b!309786 m!319729))

(assert (=> b!309787 m!319729))

(assert (=> d!68385 m!319609))

(assert (=> d!68385 m!319621))

(assert (=> b!309612 d!68385))

(declare-fun e!193495 () SeekEntryResult!2616)

(declare-fun b!309789 () Bool)

(assert (=> b!309789 (= e!193495 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309791 () Bool)

(declare-fun lt!151698 () SeekEntryResult!2616)

(assert (=> b!309791 (and (bvsge (index!12642 lt!151698) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151698) (size!7828 a!3293)))))

(declare-fun res!166301 () Bool)

(assert (=> b!309791 (= res!166301 (= (select (arr!7476 a!3293) (index!12642 lt!151698)) k0!2441))))

(declare-fun e!193496 () Bool)

(assert (=> b!309791 (=> res!166301 e!193496)))

(declare-fun e!193494 () Bool)

(assert (=> b!309791 (= e!193494 e!193496)))

(declare-fun b!309792 () Bool)

(assert (=> b!309792 (= e!193495 (Intermediate!2616 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309793 () Bool)

(declare-fun e!193492 () Bool)

(assert (=> b!309793 (= e!193492 e!193494)))

(declare-fun res!166302 () Bool)

(assert (=> b!309793 (= res!166302 (and ((_ is Intermediate!2616) lt!151698) (not (undefined!3428 lt!151698)) (bvslt (x!30868 lt!151698) #b01111111111111111111111111111110) (bvsge (x!30868 lt!151698) #b00000000000000000000000000000000) (bvsge (x!30868 lt!151698) #b00000000000000000000000000000000)))))

(assert (=> b!309793 (=> (not res!166302) (not e!193494))))

(declare-fun b!309794 () Bool)

(assert (=> b!309794 (= e!193492 (bvsge (x!30868 lt!151698) #b01111111111111111111111111111110))))

(declare-fun b!309795 () Bool)

(assert (=> b!309795 (and (bvsge (index!12642 lt!151698) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151698) (size!7828 a!3293)))))

(declare-fun res!166300 () Bool)

(assert (=> b!309795 (= res!166300 (= (select (arr!7476 a!3293) (index!12642 lt!151698)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309795 (=> res!166300 e!193496)))

(declare-fun b!309796 () Bool)

(assert (=> b!309796 (and (bvsge (index!12642 lt!151698) #b00000000000000000000000000000000) (bvslt (index!12642 lt!151698) (size!7828 a!3293)))))

(assert (=> b!309796 (= e!193496 (= (select (arr!7476 a!3293) (index!12642 lt!151698)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309797 () Bool)

(declare-fun e!193493 () SeekEntryResult!2616)

(assert (=> b!309797 (= e!193493 (Intermediate!2616 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309790 () Bool)

(assert (=> b!309790 (= e!193493 e!193495)))

(declare-fun c!49349 () Bool)

(declare-fun lt!151699 () (_ BitVec 64))

(assert (=> b!309790 (= c!49349 (or (= lt!151699 k0!2441) (= (bvadd lt!151699 lt!151699) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68387 () Bool)

(assert (=> d!68387 e!193492))

(declare-fun c!49350 () Bool)

(assert (=> d!68387 (= c!49350 (and ((_ is Intermediate!2616) lt!151698) (undefined!3428 lt!151698)))))

(assert (=> d!68387 (= lt!151698 e!193493)))

(declare-fun c!49348 () Bool)

(assert (=> d!68387 (= c!49348 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68387 (= lt!151699 (select (arr!7476 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68387 (validMask!0 mask!3709)))

(assert (=> d!68387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151698)))

(assert (= (and d!68387 c!49348) b!309797))

(assert (= (and d!68387 (not c!49348)) b!309790))

(assert (= (and b!309790 c!49349) b!309792))

(assert (= (and b!309790 (not c!49349)) b!309789))

(assert (= (and d!68387 c!49350) b!309794))

(assert (= (and d!68387 (not c!49350)) b!309793))

(assert (= (and b!309793 res!166302) b!309791))

(assert (= (and b!309791 (not res!166301)) b!309795))

(assert (= (and b!309795 (not res!166300)) b!309796))

(assert (=> b!309789 m!319625))

(declare-fun m!319731 () Bool)

(assert (=> b!309789 m!319731))

(assert (=> b!309789 m!319731))

(declare-fun m!319733 () Bool)

(assert (=> b!309789 m!319733))

(declare-fun m!319735 () Bool)

(assert (=> b!309791 m!319735))

(assert (=> b!309795 m!319735))

(assert (=> b!309796 m!319735))

(assert (=> d!68387 m!319625))

(declare-fun m!319737 () Bool)

(assert (=> d!68387 m!319737))

(assert (=> d!68387 m!319621))

(assert (=> b!309610 d!68387))

(declare-fun d!68393 () Bool)

(declare-fun lt!151709 () (_ BitVec 32))

(declare-fun lt!151708 () (_ BitVec 32))

(assert (=> d!68393 (= lt!151709 (bvmul (bvxor lt!151708 (bvlshr lt!151708 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68393 (= lt!151708 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68393 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!166303 (let ((h!5343 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30875 (bvmul (bvxor h!5343 (bvlshr h!5343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30875 (bvlshr x!30875 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!166303 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!166303 #b00000000000000000000000000000000))))))

(assert (=> d!68393 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!151709 (bvlshr lt!151709 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!309610 d!68393))

(check-sat (not d!68387) (not b!309789) (not b!309680) (not d!68361) (not b!309780) (not d!68355) (not bm!25918) (not b!309750) (not d!68385) (not b!309647) (not b!309777) (not d!68375) (not b!309776))
(check-sat)
