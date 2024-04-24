; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30816 () Bool)

(assert start!30816)

(declare-fun b!309526 () Bool)

(declare-fun res!166190 () Bool)

(declare-fun e!193342 () Bool)

(assert (=> b!309526 (=> (not res!166190) (not e!193342))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15782 0))(
  ( (array!15783 (arr!7474 (Array (_ BitVec 32) (_ BitVec 64))) (size!7826 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15782)

(assert (=> b!309526 (= res!166190 (and (= (size!7826 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7826 a!3293))))))

(declare-fun b!309527 () Bool)

(declare-fun e!193341 () Bool)

(declare-fun e!193344 () Bool)

(assert (=> b!309527 (= e!193341 e!193344)))

(declare-fun res!166194 () Bool)

(assert (=> b!309527 (=> (not res!166194) (not e!193344))))

(declare-datatypes ((SeekEntryResult!2579 0))(
  ( (MissingZero!2579 (index!12492 (_ BitVec 32))) (Found!2579 (index!12493 (_ BitVec 32))) (Intermediate!2579 (undefined!3391 Bool) (index!12494 (_ BitVec 32)) (x!30828 (_ BitVec 32))) (Undefined!2579) (MissingVacant!2579 (index!12495 (_ BitVec 32))) )
))
(declare-fun lt!151639 () SeekEntryResult!2579)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151641 () SeekEntryResult!2579)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309527 (= res!166194 (and (= lt!151641 lt!151639) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7474 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15782 (_ BitVec 32)) SeekEntryResult!2579)

(assert (=> b!309527 (= lt!151641 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309528 () Bool)

(declare-fun res!166191 () Bool)

(assert (=> b!309528 (=> (not res!166191) (not e!193342))))

(declare-fun arrayContainsKey!0 (array!15782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309528 (= res!166191 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309529 () Bool)

(declare-fun res!166196 () Bool)

(assert (=> b!309529 (=> (not res!166196) (not e!193341))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309529 (= res!166196 (and (= (select (arr!7474 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7826 a!3293))))))

(declare-fun b!309530 () Bool)

(declare-fun res!166189 () Bool)

(assert (=> b!309530 (=> (not res!166189) (not e!193342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309530 (= res!166189 (validKeyInArray!0 k0!2441))))

(declare-fun res!166192 () Bool)

(assert (=> start!30816 (=> (not res!166192) (not e!193342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30816 (= res!166192 (validMask!0 mask!3709))))

(assert (=> start!30816 e!193342))

(declare-fun array_inv!5424 (array!15782) Bool)

(assert (=> start!30816 (array_inv!5424 a!3293)))

(assert (=> start!30816 true))

(declare-fun b!309531 () Bool)

(declare-fun res!166193 () Bool)

(assert (=> b!309531 (=> (not res!166193) (not e!193342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15782 (_ BitVec 32)) Bool)

(assert (=> b!309531 (= res!166193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309532 () Bool)

(declare-fun lt!151640 () (_ BitVec 32))

(assert (=> b!309532 (= e!193344 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!151640 #b00000000000000000000000000000000) (bvslt lt!151640 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(assert (=> b!309532 (= lt!151641 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151640 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309532 (= lt!151640 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!309533 () Bool)

(assert (=> b!309533 (= e!193342 e!193341)))

(declare-fun res!166195 () Bool)

(assert (=> b!309533 (=> (not res!166195) (not e!193341))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309533 (= res!166195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151639))))

(assert (=> b!309533 (= lt!151639 (Intermediate!2579 false resIndex!52 resX!52))))

(declare-fun b!309534 () Bool)

(declare-fun res!166197 () Bool)

(assert (=> b!309534 (=> (not res!166197) (not e!193342))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15782 (_ BitVec 32)) SeekEntryResult!2579)

(assert (=> b!309534 (= res!166197 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2579 i!1240)))))

(assert (= (and start!30816 res!166192) b!309526))

(assert (= (and b!309526 res!166190) b!309530))

(assert (= (and b!309530 res!166189) b!309528))

(assert (= (and b!309528 res!166191) b!309534))

(assert (= (and b!309534 res!166197) b!309531))

(assert (= (and b!309531 res!166193) b!309533))

(assert (= (and b!309533 res!166195) b!309529))

(assert (= (and b!309529 res!166196) b!309527))

(assert (= (and b!309527 res!166194) b!309532))

(declare-fun m!319705 () Bool)

(assert (=> b!309532 m!319705))

(declare-fun m!319707 () Bool)

(assert (=> b!309532 m!319707))

(declare-fun m!319709 () Bool)

(assert (=> b!309534 m!319709))

(declare-fun m!319711 () Bool)

(assert (=> b!309528 m!319711))

(declare-fun m!319713 () Bool)

(assert (=> b!309530 m!319713))

(declare-fun m!319715 () Bool)

(assert (=> b!309533 m!319715))

(assert (=> b!309533 m!319715))

(declare-fun m!319717 () Bool)

(assert (=> b!309533 m!319717))

(declare-fun m!319719 () Bool)

(assert (=> b!309531 m!319719))

(declare-fun m!319721 () Bool)

(assert (=> b!309527 m!319721))

(declare-fun m!319723 () Bool)

(assert (=> b!309527 m!319723))

(declare-fun m!319725 () Bool)

(assert (=> b!309529 m!319725))

(declare-fun m!319727 () Bool)

(assert (=> start!30816 m!319727))

(declare-fun m!319729 () Bool)

(assert (=> start!30816 m!319729))

(check-sat (not start!30816) (not b!309528) (not b!309530) (not b!309527) (not b!309532) (not b!309531) (not b!309534) (not b!309533))
(check-sat)
(get-model)

(declare-fun b!309613 () Bool)

(declare-fun lt!151664 () SeekEntryResult!2579)

(assert (=> b!309613 (and (bvsge (index!12494 lt!151664) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151664) (size!7826 a!3293)))))

(declare-fun e!193389 () Bool)

(assert (=> b!309613 (= e!193389 (= (select (arr!7474 a!3293) (index!12494 lt!151664)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309614 () Bool)

(declare-fun e!193387 () SeekEntryResult!2579)

(assert (=> b!309614 (= e!193387 (Intermediate!2579 false index!1781 x!1427))))

(declare-fun b!309615 () Bool)

(declare-fun e!193388 () Bool)

(assert (=> b!309615 (= e!193388 (bvsge (x!30828 lt!151664) #b01111111111111111111111111111110))))

(declare-fun b!309616 () Bool)

(assert (=> b!309616 (= e!193387 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309617 () Bool)

(declare-fun e!193385 () SeekEntryResult!2579)

(assert (=> b!309617 (= e!193385 (Intermediate!2579 true index!1781 x!1427))))

(declare-fun b!309618 () Bool)

(assert (=> b!309618 (and (bvsge (index!12494 lt!151664) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151664) (size!7826 a!3293)))))

(declare-fun res!166264 () Bool)

(assert (=> b!309618 (= res!166264 (= (select (arr!7474 a!3293) (index!12494 lt!151664)) k0!2441))))

(assert (=> b!309618 (=> res!166264 e!193389)))

(declare-fun e!193386 () Bool)

(assert (=> b!309618 (= e!193386 e!193389)))

(declare-fun b!309619 () Bool)

(assert (=> b!309619 (and (bvsge (index!12494 lt!151664) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151664) (size!7826 a!3293)))))

(declare-fun res!166266 () Bool)

(assert (=> b!309619 (= res!166266 (= (select (arr!7474 a!3293) (index!12494 lt!151664)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309619 (=> res!166266 e!193389)))

(declare-fun d!68373 () Bool)

(assert (=> d!68373 e!193388))

(declare-fun c!49278 () Bool)

(get-info :version)

(assert (=> d!68373 (= c!49278 (and ((_ is Intermediate!2579) lt!151664) (undefined!3391 lt!151664)))))

(assert (=> d!68373 (= lt!151664 e!193385)))

(declare-fun c!49279 () Bool)

(assert (=> d!68373 (= c!49279 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!151665 () (_ BitVec 64))

(assert (=> d!68373 (= lt!151665 (select (arr!7474 a!3293) index!1781))))

(assert (=> d!68373 (validMask!0 mask!3709)))

(assert (=> d!68373 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151664)))

(declare-fun b!309620 () Bool)

(assert (=> b!309620 (= e!193385 e!193387)))

(declare-fun c!49280 () Bool)

(assert (=> b!309620 (= c!49280 (or (= lt!151665 k0!2441) (= (bvadd lt!151665 lt!151665) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309621 () Bool)

(assert (=> b!309621 (= e!193388 e!193386)))

(declare-fun res!166265 () Bool)

(assert (=> b!309621 (= res!166265 (and ((_ is Intermediate!2579) lt!151664) (not (undefined!3391 lt!151664)) (bvslt (x!30828 lt!151664) #b01111111111111111111111111111110) (bvsge (x!30828 lt!151664) #b00000000000000000000000000000000) (bvsge (x!30828 lt!151664) x!1427)))))

(assert (=> b!309621 (=> (not res!166265) (not e!193386))))

(assert (= (and d!68373 c!49279) b!309617))

(assert (= (and d!68373 (not c!49279)) b!309620))

(assert (= (and b!309620 c!49280) b!309614))

(assert (= (and b!309620 (not c!49280)) b!309616))

(assert (= (and d!68373 c!49278) b!309615))

(assert (= (and d!68373 (not c!49278)) b!309621))

(assert (= (and b!309621 res!166265) b!309618))

(assert (= (and b!309618 (not res!166264)) b!309619))

(assert (= (and b!309619 (not res!166266)) b!309613))

(declare-fun m!319787 () Bool)

(assert (=> b!309618 m!319787))

(declare-fun m!319789 () Bool)

(assert (=> b!309616 m!319789))

(assert (=> b!309616 m!319789))

(declare-fun m!319791 () Bool)

(assert (=> b!309616 m!319791))

(assert (=> b!309619 m!319787))

(assert (=> d!68373 m!319721))

(assert (=> d!68373 m!319727))

(assert (=> b!309613 m!319787))

(assert (=> b!309527 d!68373))

(declare-fun b!309622 () Bool)

(declare-fun lt!151666 () SeekEntryResult!2579)

(assert (=> b!309622 (and (bvsge (index!12494 lt!151666) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151666) (size!7826 a!3293)))))

(declare-fun e!193394 () Bool)

(assert (=> b!309622 (= e!193394 (= (select (arr!7474 a!3293) (index!12494 lt!151666)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309623 () Bool)

(declare-fun e!193392 () SeekEntryResult!2579)

(assert (=> b!309623 (= e!193392 (Intermediate!2579 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309624 () Bool)

(declare-fun e!193393 () Bool)

(assert (=> b!309624 (= e!193393 (bvsge (x!30828 lt!151666) #b01111111111111111111111111111110))))

(declare-fun b!309625 () Bool)

(assert (=> b!309625 (= e!193392 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309626 () Bool)

(declare-fun e!193390 () SeekEntryResult!2579)

(assert (=> b!309626 (= e!193390 (Intermediate!2579 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309627 () Bool)

(assert (=> b!309627 (and (bvsge (index!12494 lt!151666) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151666) (size!7826 a!3293)))))

(declare-fun res!166267 () Bool)

(assert (=> b!309627 (= res!166267 (= (select (arr!7474 a!3293) (index!12494 lt!151666)) k0!2441))))

(assert (=> b!309627 (=> res!166267 e!193394)))

(declare-fun e!193391 () Bool)

(assert (=> b!309627 (= e!193391 e!193394)))

(declare-fun b!309628 () Bool)

(assert (=> b!309628 (and (bvsge (index!12494 lt!151666) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151666) (size!7826 a!3293)))))

(declare-fun res!166269 () Bool)

(assert (=> b!309628 (= res!166269 (= (select (arr!7474 a!3293) (index!12494 lt!151666)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309628 (=> res!166269 e!193394)))

(declare-fun d!68381 () Bool)

(assert (=> d!68381 e!193393))

(declare-fun c!49281 () Bool)

(assert (=> d!68381 (= c!49281 (and ((_ is Intermediate!2579) lt!151666) (undefined!3391 lt!151666)))))

(assert (=> d!68381 (= lt!151666 e!193390)))

(declare-fun c!49282 () Bool)

(assert (=> d!68381 (= c!49282 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!151667 () (_ BitVec 64))

(assert (=> d!68381 (= lt!151667 (select (arr!7474 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68381 (validMask!0 mask!3709)))

(assert (=> d!68381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151666)))

(declare-fun b!309629 () Bool)

(assert (=> b!309629 (= e!193390 e!193392)))

(declare-fun c!49283 () Bool)

(assert (=> b!309629 (= c!49283 (or (= lt!151667 k0!2441) (= (bvadd lt!151667 lt!151667) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309630 () Bool)

(assert (=> b!309630 (= e!193393 e!193391)))

(declare-fun res!166268 () Bool)

(assert (=> b!309630 (= res!166268 (and ((_ is Intermediate!2579) lt!151666) (not (undefined!3391 lt!151666)) (bvslt (x!30828 lt!151666) #b01111111111111111111111111111110) (bvsge (x!30828 lt!151666) #b00000000000000000000000000000000) (bvsge (x!30828 lt!151666) #b00000000000000000000000000000000)))))

(assert (=> b!309630 (=> (not res!166268) (not e!193391))))

(assert (= (and d!68381 c!49282) b!309626))

(assert (= (and d!68381 (not c!49282)) b!309629))

(assert (= (and b!309629 c!49283) b!309623))

(assert (= (and b!309629 (not c!49283)) b!309625))

(assert (= (and d!68381 c!49281) b!309624))

(assert (= (and d!68381 (not c!49281)) b!309630))

(assert (= (and b!309630 res!166268) b!309627))

(assert (= (and b!309627 (not res!166267)) b!309628))

(assert (= (and b!309628 (not res!166269)) b!309622))

(declare-fun m!319793 () Bool)

(assert (=> b!309627 m!319793))

(assert (=> b!309625 m!319715))

(declare-fun m!319795 () Bool)

(assert (=> b!309625 m!319795))

(assert (=> b!309625 m!319795))

(declare-fun m!319797 () Bool)

(assert (=> b!309625 m!319797))

(assert (=> b!309628 m!319793))

(assert (=> d!68381 m!319715))

(declare-fun m!319799 () Bool)

(assert (=> d!68381 m!319799))

(assert (=> d!68381 m!319727))

(assert (=> b!309622 m!319793))

(assert (=> b!309533 d!68381))

(declare-fun d!68383 () Bool)

(declare-fun lt!151673 () (_ BitVec 32))

(declare-fun lt!151672 () (_ BitVec 32))

(assert (=> d!68383 (= lt!151673 (bvmul (bvxor lt!151672 (bvlshr lt!151672 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68383 (= lt!151672 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68383 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!166270 (let ((h!5255 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30832 (bvmul (bvxor h!5255 (bvlshr h!5255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30832 (bvlshr x!30832 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!166270 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!166270 #b00000000000000000000000000000000))))))

(assert (=> d!68383 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!151673 (bvlshr lt!151673 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!309533 d!68383))

(declare-fun d!68385 () Bool)

(declare-fun res!166275 () Bool)

(declare-fun e!193405 () Bool)

(assert (=> d!68385 (=> res!166275 e!193405)))

(assert (=> d!68385 (= res!166275 (= (select (arr!7474 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68385 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!193405)))

(declare-fun b!309647 () Bool)

(declare-fun e!193406 () Bool)

(assert (=> b!309647 (= e!193405 e!193406)))

(declare-fun res!166276 () Bool)

(assert (=> b!309647 (=> (not res!166276) (not e!193406))))

(assert (=> b!309647 (= res!166276 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7826 a!3293)))))

(declare-fun b!309648 () Bool)

(assert (=> b!309648 (= e!193406 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68385 (not res!166275)) b!309647))

(assert (= (and b!309647 res!166276) b!309648))

(declare-fun m!319801 () Bool)

(assert (=> d!68385 m!319801))

(declare-fun m!319803 () Bool)

(assert (=> b!309648 m!319803))

(assert (=> b!309528 d!68385))

(declare-fun d!68387 () Bool)

(assert (=> d!68387 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30816 d!68387))

(declare-fun d!68391 () Bool)

(assert (=> d!68391 (= (array_inv!5424 a!3293) (bvsge (size!7826 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30816 d!68391))

(declare-fun b!309729 () Bool)

(declare-fun e!193455 () SeekEntryResult!2579)

(declare-fun lt!151717 () SeekEntryResult!2579)

(assert (=> b!309729 (= e!193455 (MissingZero!2579 (index!12494 lt!151717)))))

(declare-fun b!309730 () Bool)

(declare-fun c!49320 () Bool)

(declare-fun lt!151716 () (_ BitVec 64))

(assert (=> b!309730 (= c!49320 (= lt!151716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!193456 () SeekEntryResult!2579)

(assert (=> b!309730 (= e!193456 e!193455)))

(declare-fun d!68393 () Bool)

(declare-fun lt!151718 () SeekEntryResult!2579)

(assert (=> d!68393 (and (or ((_ is Undefined!2579) lt!151718) (not ((_ is Found!2579) lt!151718)) (and (bvsge (index!12493 lt!151718) #b00000000000000000000000000000000) (bvslt (index!12493 lt!151718) (size!7826 a!3293)))) (or ((_ is Undefined!2579) lt!151718) ((_ is Found!2579) lt!151718) (not ((_ is MissingZero!2579) lt!151718)) (and (bvsge (index!12492 lt!151718) #b00000000000000000000000000000000) (bvslt (index!12492 lt!151718) (size!7826 a!3293)))) (or ((_ is Undefined!2579) lt!151718) ((_ is Found!2579) lt!151718) ((_ is MissingZero!2579) lt!151718) (not ((_ is MissingVacant!2579) lt!151718)) (and (bvsge (index!12495 lt!151718) #b00000000000000000000000000000000) (bvslt (index!12495 lt!151718) (size!7826 a!3293)))) (or ((_ is Undefined!2579) lt!151718) (ite ((_ is Found!2579) lt!151718) (= (select (arr!7474 a!3293) (index!12493 lt!151718)) k0!2441) (ite ((_ is MissingZero!2579) lt!151718) (= (select (arr!7474 a!3293) (index!12492 lt!151718)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2579) lt!151718) (= (select (arr!7474 a!3293) (index!12495 lt!151718)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!193457 () SeekEntryResult!2579)

(assert (=> d!68393 (= lt!151718 e!193457)))

(declare-fun c!49319 () Bool)

(assert (=> d!68393 (= c!49319 (and ((_ is Intermediate!2579) lt!151717) (undefined!3391 lt!151717)))))

(assert (=> d!68393 (= lt!151717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68393 (validMask!0 mask!3709)))

(assert (=> d!68393 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!151718)))

(declare-fun b!309731 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15782 (_ BitVec 32)) SeekEntryResult!2579)

(assert (=> b!309731 (= e!193455 (seekKeyOrZeroReturnVacant!0 (x!30828 lt!151717) (index!12494 lt!151717) (index!12494 lt!151717) k0!2441 a!3293 mask!3709))))

(declare-fun b!309732 () Bool)

(assert (=> b!309732 (= e!193457 Undefined!2579)))

(declare-fun b!309733 () Bool)

(assert (=> b!309733 (= e!193456 (Found!2579 (index!12494 lt!151717)))))

(declare-fun b!309734 () Bool)

(assert (=> b!309734 (= e!193457 e!193456)))

(assert (=> b!309734 (= lt!151716 (select (arr!7474 a!3293) (index!12494 lt!151717)))))

(declare-fun c!49318 () Bool)

(assert (=> b!309734 (= c!49318 (= lt!151716 k0!2441))))

(assert (= (and d!68393 c!49319) b!309732))

(assert (= (and d!68393 (not c!49319)) b!309734))

(assert (= (and b!309734 c!49318) b!309733))

(assert (= (and b!309734 (not c!49318)) b!309730))

(assert (= (and b!309730 c!49320) b!309729))

(assert (= (and b!309730 (not c!49320)) b!309731))

(assert (=> d!68393 m!319715))

(assert (=> d!68393 m!319717))

(assert (=> d!68393 m!319715))

(declare-fun m!319843 () Bool)

(assert (=> d!68393 m!319843))

(declare-fun m!319845 () Bool)

(assert (=> d!68393 m!319845))

(assert (=> d!68393 m!319727))

(declare-fun m!319847 () Bool)

(assert (=> d!68393 m!319847))

(declare-fun m!319849 () Bool)

(assert (=> b!309731 m!319849))

(declare-fun m!319851 () Bool)

(assert (=> b!309734 m!319851))

(assert (=> b!309534 d!68393))

(declare-fun d!68411 () Bool)

(assert (=> d!68411 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!309530 d!68411))

(declare-fun b!309771 () Bool)

(declare-fun e!193482 () Bool)

(declare-fun call!25910 () Bool)

(assert (=> b!309771 (= e!193482 call!25910)))

(declare-fun b!309772 () Bool)

(declare-fun e!193481 () Bool)

(assert (=> b!309772 (= e!193481 call!25910)))

(declare-fun d!68413 () Bool)

(declare-fun res!166320 () Bool)

(declare-fun e!193480 () Bool)

(assert (=> d!68413 (=> res!166320 e!193480)))

(assert (=> d!68413 (= res!166320 (bvsge #b00000000000000000000000000000000 (size!7826 a!3293)))))

(assert (=> d!68413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!193480)))

(declare-fun bm!25907 () Bool)

(assert (=> bm!25907 (= call!25910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!309773 () Bool)

(assert (=> b!309773 (= e!193481 e!193482)))

(declare-fun lt!151729 () (_ BitVec 64))

(assert (=> b!309773 (= lt!151729 (select (arr!7474 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9545 0))(
  ( (Unit!9546) )
))
(declare-fun lt!151730 () Unit!9545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15782 (_ BitVec 64) (_ BitVec 32)) Unit!9545)

(assert (=> b!309773 (= lt!151730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151729 #b00000000000000000000000000000000))))

(assert (=> b!309773 (arrayContainsKey!0 a!3293 lt!151729 #b00000000000000000000000000000000)))

(declare-fun lt!151731 () Unit!9545)

(assert (=> b!309773 (= lt!151731 lt!151730)))

(declare-fun res!166319 () Bool)

(assert (=> b!309773 (= res!166319 (= (seekEntryOrOpen!0 (select (arr!7474 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2579 #b00000000000000000000000000000000)))))

(assert (=> b!309773 (=> (not res!166319) (not e!193482))))

(declare-fun b!309774 () Bool)

(assert (=> b!309774 (= e!193480 e!193481)))

(declare-fun c!49331 () Bool)

(assert (=> b!309774 (= c!49331 (validKeyInArray!0 (select (arr!7474 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68413 (not res!166320)) b!309774))

(assert (= (and b!309774 c!49331) b!309773))

(assert (= (and b!309774 (not c!49331)) b!309772))

(assert (= (and b!309773 res!166319) b!309771))

(assert (= (or b!309771 b!309772) bm!25907))

(declare-fun m!319867 () Bool)

(assert (=> bm!25907 m!319867))

(assert (=> b!309773 m!319801))

(declare-fun m!319869 () Bool)

(assert (=> b!309773 m!319869))

(declare-fun m!319871 () Bool)

(assert (=> b!309773 m!319871))

(assert (=> b!309773 m!319801))

(declare-fun m!319873 () Bool)

(assert (=> b!309773 m!319873))

(assert (=> b!309774 m!319801))

(assert (=> b!309774 m!319801))

(declare-fun m!319875 () Bool)

(assert (=> b!309774 m!319875))

(assert (=> b!309531 d!68413))

(declare-fun b!309775 () Bool)

(declare-fun lt!151736 () SeekEntryResult!2579)

(assert (=> b!309775 (and (bvsge (index!12494 lt!151736) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151736) (size!7826 a!3293)))))

(declare-fun e!193487 () Bool)

(assert (=> b!309775 (= e!193487 (= (select (arr!7474 a!3293) (index!12494 lt!151736)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309776 () Bool)

(declare-fun e!193485 () SeekEntryResult!2579)

(assert (=> b!309776 (= e!193485 (Intermediate!2579 false lt!151640 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309777 () Bool)

(declare-fun e!193486 () Bool)

(assert (=> b!309777 (= e!193486 (bvsge (x!30828 lt!151736) #b01111111111111111111111111111110))))

(declare-fun b!309778 () Bool)

(assert (=> b!309778 (= e!193485 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!151640 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309779 () Bool)

(declare-fun e!193483 () SeekEntryResult!2579)

(assert (=> b!309779 (= e!193483 (Intermediate!2579 true lt!151640 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309780 () Bool)

(assert (=> b!309780 (and (bvsge (index!12494 lt!151736) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151736) (size!7826 a!3293)))))

(declare-fun res!166321 () Bool)

(assert (=> b!309780 (= res!166321 (= (select (arr!7474 a!3293) (index!12494 lt!151736)) k0!2441))))

(assert (=> b!309780 (=> res!166321 e!193487)))

(declare-fun e!193484 () Bool)

(assert (=> b!309780 (= e!193484 e!193487)))

(declare-fun b!309781 () Bool)

(assert (=> b!309781 (and (bvsge (index!12494 lt!151736) #b00000000000000000000000000000000) (bvslt (index!12494 lt!151736) (size!7826 a!3293)))))

(declare-fun res!166323 () Bool)

(assert (=> b!309781 (= res!166323 (= (select (arr!7474 a!3293) (index!12494 lt!151736)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309781 (=> res!166323 e!193487)))

(declare-fun d!68419 () Bool)

(assert (=> d!68419 e!193486))

(declare-fun c!49332 () Bool)

(assert (=> d!68419 (= c!49332 (and ((_ is Intermediate!2579) lt!151736) (undefined!3391 lt!151736)))))

(assert (=> d!68419 (= lt!151736 e!193483)))

(declare-fun c!49333 () Bool)

(assert (=> d!68419 (= c!49333 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!151737 () (_ BitVec 64))

(assert (=> d!68419 (= lt!151737 (select (arr!7474 a!3293) lt!151640))))

(assert (=> d!68419 (validMask!0 mask!3709)))

(assert (=> d!68419 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151640 k0!2441 a!3293 mask!3709) lt!151736)))

(declare-fun b!309782 () Bool)

(assert (=> b!309782 (= e!193483 e!193485)))

(declare-fun c!49334 () Bool)

(assert (=> b!309782 (= c!49334 (or (= lt!151737 k0!2441) (= (bvadd lt!151737 lt!151737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309783 () Bool)

(assert (=> b!309783 (= e!193486 e!193484)))

(declare-fun res!166322 () Bool)

(assert (=> b!309783 (= res!166322 (and ((_ is Intermediate!2579) lt!151736) (not (undefined!3391 lt!151736)) (bvslt (x!30828 lt!151736) #b01111111111111111111111111111110) (bvsge (x!30828 lt!151736) #b00000000000000000000000000000000) (bvsge (x!30828 lt!151736) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!309783 (=> (not res!166322) (not e!193484))))

(assert (= (and d!68419 c!49333) b!309779))

(assert (= (and d!68419 (not c!49333)) b!309782))

(assert (= (and b!309782 c!49334) b!309776))

(assert (= (and b!309782 (not c!49334)) b!309778))

(assert (= (and d!68419 c!49332) b!309777))

(assert (= (and d!68419 (not c!49332)) b!309783))

(assert (= (and b!309783 res!166322) b!309780))

(assert (= (and b!309780 (not res!166321)) b!309781))

(assert (= (and b!309781 (not res!166323)) b!309775))

(declare-fun m!319877 () Bool)

(assert (=> b!309780 m!319877))

(declare-fun m!319879 () Bool)

(assert (=> b!309778 m!319879))

(assert (=> b!309778 m!319879))

(declare-fun m!319881 () Bool)

(assert (=> b!309778 m!319881))

(assert (=> b!309781 m!319877))

(declare-fun m!319883 () Bool)

(assert (=> d!68419 m!319883))

(assert (=> d!68419 m!319727))

(assert (=> b!309775 m!319877))

(assert (=> b!309532 d!68419))

(declare-fun d!68423 () Bool)

(declare-fun lt!151744 () (_ BitVec 32))

(assert (=> d!68423 (and (bvsge lt!151744 #b00000000000000000000000000000000) (bvslt lt!151744 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68423 (= lt!151744 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68423 (validMask!0 mask!3709)))

(assert (=> d!68423 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!151744)))

(declare-fun bs!10896 () Bool)

(assert (= bs!10896 d!68423))

(declare-fun m!319893 () Bool)

(assert (=> bs!10896 m!319893))

(assert (=> bs!10896 m!319727))

(assert (=> b!309532 d!68423))

(check-sat (not d!68373) (not d!68419) (not d!68393) (not b!309778) (not d!68423) (not b!309648) (not b!309731) (not bm!25907) (not d!68381) (not b!309774) (not b!309773) (not b!309625) (not b!309616))
(check-sat)
