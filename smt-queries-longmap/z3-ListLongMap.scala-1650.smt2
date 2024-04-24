; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30666 () Bool)

(assert start!30666)

(declare-fun b!307989 () Bool)

(declare-fun e!192660 () Bool)

(declare-fun e!192658 () Bool)

(assert (=> b!307989 (= e!192660 e!192658)))

(declare-fun res!164802 () Bool)

(assert (=> b!307989 (=> (not res!164802) (not e!192658))))

(declare-datatypes ((array!15683 0))(
  ( (array!15684 (arr!7426 (Array (_ BitVec 32) (_ BitVec 64))) (size!7778 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15683)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2531 0))(
  ( (MissingZero!2531 (index!12300 (_ BitVec 32))) (Found!2531 (index!12301 (_ BitVec 32))) (Intermediate!2531 (undefined!3343 Bool) (index!12302 (_ BitVec 32)) (x!30643 (_ BitVec 32))) (Undefined!2531) (MissingVacant!2531 (index!12303 (_ BitVec 32))) )
))
(declare-fun lt!151244 () SeekEntryResult!2531)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15683 (_ BitVec 32)) SeekEntryResult!2531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307989 (= res!164802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151244))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307989 (= lt!151244 (Intermediate!2531 false resIndex!52 resX!52))))

(declare-fun b!307990 () Bool)

(declare-fun res!164796 () Bool)

(assert (=> b!307990 (=> (not res!164796) (not e!192660))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307990 (= res!164796 (and (= (size!7778 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7778 a!3293))))))

(declare-fun b!307991 () Bool)

(declare-fun lt!151245 () (_ BitVec 32))

(assert (=> b!307991 (= e!192658 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!151245 #b00000000000000000000000000000000) (bvsge lt!151245 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307991 (= lt!151245 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!307992 () Bool)

(declare-fun res!164801 () Bool)

(assert (=> b!307992 (=> (not res!164801) (not e!192660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307992 (= res!164801 (validKeyInArray!0 k0!2441))))

(declare-fun b!307993 () Bool)

(declare-fun res!164798 () Bool)

(assert (=> b!307993 (=> (not res!164798) (not e!192658))))

(assert (=> b!307993 (= res!164798 (and (= (select (arr!7426 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7778 a!3293))))))

(declare-fun b!307994 () Bool)

(declare-fun res!164800 () Bool)

(assert (=> b!307994 (=> (not res!164800) (not e!192658))))

(assert (=> b!307994 (= res!164800 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151244))))

(declare-fun b!307995 () Bool)

(declare-fun res!164794 () Bool)

(assert (=> b!307995 (=> (not res!164794) (not e!192660))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15683 (_ BitVec 32)) SeekEntryResult!2531)

(assert (=> b!307995 (= res!164794 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2531 i!1240)))))

(declare-fun b!307996 () Bool)

(declare-fun res!164797 () Bool)

(assert (=> b!307996 (=> (not res!164797) (not e!192660))))

(declare-fun arrayContainsKey!0 (array!15683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307996 (= res!164797 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164795 () Bool)

(assert (=> start!30666 (=> (not res!164795) (not e!192660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30666 (= res!164795 (validMask!0 mask!3709))))

(assert (=> start!30666 e!192660))

(declare-fun array_inv!5376 (array!15683) Bool)

(assert (=> start!30666 (array_inv!5376 a!3293)))

(assert (=> start!30666 true))

(declare-fun b!307997 () Bool)

(declare-fun res!164799 () Bool)

(assert (=> b!307997 (=> (not res!164799) (not e!192660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15683 (_ BitVec 32)) Bool)

(assert (=> b!307997 (= res!164799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307998 () Bool)

(declare-fun res!164793 () Bool)

(assert (=> b!307998 (=> (not res!164793) (not e!192658))))

(assert (=> b!307998 (= res!164793 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7426 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (= (and start!30666 res!164795) b!307990))

(assert (= (and b!307990 res!164796) b!307992))

(assert (= (and b!307992 res!164801) b!307996))

(assert (= (and b!307996 res!164797) b!307995))

(assert (= (and b!307995 res!164794) b!307997))

(assert (= (and b!307997 res!164799) b!307989))

(assert (= (and b!307989 res!164802) b!307993))

(assert (= (and b!307993 res!164798) b!307994))

(assert (= (and b!307994 res!164800) b!307998))

(assert (= (and b!307998 res!164793) b!307991))

(declare-fun m!318355 () Bool)

(assert (=> b!307994 m!318355))

(declare-fun m!318357 () Bool)

(assert (=> b!307996 m!318357))

(declare-fun m!318359 () Bool)

(assert (=> b!307998 m!318359))

(declare-fun m!318361 () Bool)

(assert (=> b!307995 m!318361))

(declare-fun m!318363 () Bool)

(assert (=> b!307989 m!318363))

(assert (=> b!307989 m!318363))

(declare-fun m!318365 () Bool)

(assert (=> b!307989 m!318365))

(declare-fun m!318367 () Bool)

(assert (=> b!307997 m!318367))

(declare-fun m!318369 () Bool)

(assert (=> b!307993 m!318369))

(declare-fun m!318371 () Bool)

(assert (=> b!307991 m!318371))

(declare-fun m!318373 () Bool)

(assert (=> start!30666 m!318373))

(declare-fun m!318375 () Bool)

(assert (=> start!30666 m!318375))

(declare-fun m!318377 () Bool)

(assert (=> b!307992 m!318377))

(check-sat (not b!307992) (not b!307996) (not b!307997) (not b!307991) (not b!307989) (not start!30666) (not b!307995) (not b!307994))
(check-sat)
(get-model)

(declare-fun d!68281 () Bool)

(assert (=> d!68281 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30666 d!68281))

(declare-fun d!68283 () Bool)

(assert (=> d!68283 (= (array_inv!5376 a!3293) (bvsge (size!7778 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30666 d!68283))

(declare-fun b!308077 () Bool)

(declare-fun lt!151262 () SeekEntryResult!2531)

(assert (=> b!308077 (and (bvsge (index!12302 lt!151262) #b00000000000000000000000000000000) (bvslt (index!12302 lt!151262) (size!7778 a!3293)))))

(declare-fun e!192691 () Bool)

(assert (=> b!308077 (= e!192691 (= (select (arr!7426 a!3293) (index!12302 lt!151262)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!308078 () Bool)

(declare-fun e!192689 () SeekEntryResult!2531)

(declare-fun e!192692 () SeekEntryResult!2531)

(assert (=> b!308078 (= e!192689 e!192692)))

(declare-fun c!49206 () Bool)

(declare-fun lt!151263 () (_ BitVec 64))

(assert (=> b!308078 (= c!49206 (or (= lt!151263 k0!2441) (= (bvadd lt!151263 lt!151263) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!308079 () Bool)

(assert (=> b!308079 (and (bvsge (index!12302 lt!151262) #b00000000000000000000000000000000) (bvslt (index!12302 lt!151262) (size!7778 a!3293)))))

(declare-fun res!164871 () Bool)

(assert (=> b!308079 (= res!164871 (= (select (arr!7426 a!3293) (index!12302 lt!151262)) k0!2441))))

(assert (=> b!308079 (=> res!164871 e!192691)))

(declare-fun e!192690 () Bool)

(assert (=> b!308079 (= e!192690 e!192691)))

(declare-fun b!308080 () Bool)

(assert (=> b!308080 (= e!192692 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308081 () Bool)

(declare-fun e!192693 () Bool)

(assert (=> b!308081 (= e!192693 e!192690)))

(declare-fun res!164869 () Bool)

(get-info :version)

(assert (=> b!308081 (= res!164869 (and ((_ is Intermediate!2531) lt!151262) (not (undefined!3343 lt!151262)) (bvslt (x!30643 lt!151262) #b01111111111111111111111111111110) (bvsge (x!30643 lt!151262) #b00000000000000000000000000000000) (bvsge (x!30643 lt!151262) x!1427)))))

(assert (=> b!308081 (=> (not res!164869) (not e!192690))))

(declare-fun b!308082 () Bool)

(assert (=> b!308082 (= e!192693 (bvsge (x!30643 lt!151262) #b01111111111111111111111111111110))))

(declare-fun b!308083 () Bool)

(assert (=> b!308083 (and (bvsge (index!12302 lt!151262) #b00000000000000000000000000000000) (bvslt (index!12302 lt!151262) (size!7778 a!3293)))))

(declare-fun res!164870 () Bool)

(assert (=> b!308083 (= res!164870 (= (select (arr!7426 a!3293) (index!12302 lt!151262)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!308083 (=> res!164870 e!192691)))

(declare-fun b!308084 () Bool)

(assert (=> b!308084 (= e!192692 (Intermediate!2531 false index!1781 x!1427))))

(declare-fun d!68285 () Bool)

(assert (=> d!68285 e!192693))

(declare-fun c!49207 () Bool)

(assert (=> d!68285 (= c!49207 (and ((_ is Intermediate!2531) lt!151262) (undefined!3343 lt!151262)))))

(assert (=> d!68285 (= lt!151262 e!192689)))

(declare-fun c!49208 () Bool)

(assert (=> d!68285 (= c!49208 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68285 (= lt!151263 (select (arr!7426 a!3293) index!1781))))

(assert (=> d!68285 (validMask!0 mask!3709)))

(assert (=> d!68285 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151262)))

(declare-fun b!308085 () Bool)

(assert (=> b!308085 (= e!192689 (Intermediate!2531 true index!1781 x!1427))))

(assert (= (and d!68285 c!49208) b!308085))

(assert (= (and d!68285 (not c!49208)) b!308078))

(assert (= (and b!308078 c!49206) b!308084))

(assert (= (and b!308078 (not c!49206)) b!308080))

(assert (= (and d!68285 c!49207) b!308082))

(assert (= (and d!68285 (not c!49207)) b!308081))

(assert (= (and b!308081 res!164869) b!308079))

(assert (= (and b!308079 (not res!164871)) b!308083))

(assert (= (and b!308083 (not res!164870)) b!308077))

(assert (=> d!68285 m!318359))

(assert (=> d!68285 m!318373))

(declare-fun m!318427 () Bool)

(assert (=> b!308079 m!318427))

(assert (=> b!308083 m!318427))

(assert (=> b!308077 m!318427))

(declare-fun m!318429 () Bool)

(assert (=> b!308080 m!318429))

(assert (=> b!308080 m!318429))

(declare-fun m!318431 () Bool)

(assert (=> b!308080 m!318431))

(assert (=> b!307994 d!68285))

(declare-fun b!308090 () Bool)

(declare-fun lt!151268 () SeekEntryResult!2531)

(assert (=> b!308090 (and (bvsge (index!12302 lt!151268) #b00000000000000000000000000000000) (bvslt (index!12302 lt!151268) (size!7778 a!3293)))))

(declare-fun e!192698 () Bool)

(assert (=> b!308090 (= e!192698 (= (select (arr!7426 a!3293) (index!12302 lt!151268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!308091 () Bool)

(declare-fun e!192696 () SeekEntryResult!2531)

(declare-fun e!192699 () SeekEntryResult!2531)

(assert (=> b!308091 (= e!192696 e!192699)))

(declare-fun c!49211 () Bool)

(declare-fun lt!151269 () (_ BitVec 64))

(assert (=> b!308091 (= c!49211 (or (= lt!151269 k0!2441) (= (bvadd lt!151269 lt!151269) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!308092 () Bool)

(assert (=> b!308092 (and (bvsge (index!12302 lt!151268) #b00000000000000000000000000000000) (bvslt (index!12302 lt!151268) (size!7778 a!3293)))))

(declare-fun res!164874 () Bool)

(assert (=> b!308092 (= res!164874 (= (select (arr!7426 a!3293) (index!12302 lt!151268)) k0!2441))))

(assert (=> b!308092 (=> res!164874 e!192698)))

(declare-fun e!192697 () Bool)

(assert (=> b!308092 (= e!192697 e!192698)))

(declare-fun b!308093 () Bool)

(assert (=> b!308093 (= e!192699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308094 () Bool)

(declare-fun e!192700 () Bool)

(assert (=> b!308094 (= e!192700 e!192697)))

(declare-fun res!164872 () Bool)

(assert (=> b!308094 (= res!164872 (and ((_ is Intermediate!2531) lt!151268) (not (undefined!3343 lt!151268)) (bvslt (x!30643 lt!151268) #b01111111111111111111111111111110) (bvsge (x!30643 lt!151268) #b00000000000000000000000000000000) (bvsge (x!30643 lt!151268) #b00000000000000000000000000000000)))))

(assert (=> b!308094 (=> (not res!164872) (not e!192697))))

(declare-fun b!308095 () Bool)

(assert (=> b!308095 (= e!192700 (bvsge (x!30643 lt!151268) #b01111111111111111111111111111110))))

(declare-fun b!308096 () Bool)

(assert (=> b!308096 (and (bvsge (index!12302 lt!151268) #b00000000000000000000000000000000) (bvslt (index!12302 lt!151268) (size!7778 a!3293)))))

(declare-fun res!164873 () Bool)

(assert (=> b!308096 (= res!164873 (= (select (arr!7426 a!3293) (index!12302 lt!151268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!308096 (=> res!164873 e!192698)))

(declare-fun b!308097 () Bool)

(assert (=> b!308097 (= e!192699 (Intermediate!2531 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68291 () Bool)

(assert (=> d!68291 e!192700))

(declare-fun c!49212 () Bool)

(assert (=> d!68291 (= c!49212 (and ((_ is Intermediate!2531) lt!151268) (undefined!3343 lt!151268)))))

(assert (=> d!68291 (= lt!151268 e!192696)))

(declare-fun c!49213 () Bool)

(assert (=> d!68291 (= c!49213 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68291 (= lt!151269 (select (arr!7426 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68291 (validMask!0 mask!3709)))

(assert (=> d!68291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151268)))

(declare-fun b!308098 () Bool)

(assert (=> b!308098 (= e!192696 (Intermediate!2531 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68291 c!49213) b!308098))

(assert (= (and d!68291 (not c!49213)) b!308091))

(assert (= (and b!308091 c!49211) b!308097))

(assert (= (and b!308091 (not c!49211)) b!308093))

(assert (= (and d!68291 c!49212) b!308095))

(assert (= (and d!68291 (not c!49212)) b!308094))

(assert (= (and b!308094 res!164872) b!308092))

(assert (= (and b!308092 (not res!164874)) b!308096))

(assert (= (and b!308096 (not res!164873)) b!308090))

(assert (=> d!68291 m!318363))

(declare-fun m!318433 () Bool)

(assert (=> d!68291 m!318433))

(assert (=> d!68291 m!318373))

(declare-fun m!318435 () Bool)

(assert (=> b!308092 m!318435))

(assert (=> b!308096 m!318435))

(assert (=> b!308090 m!318435))

(assert (=> b!308093 m!318363))

(declare-fun m!318437 () Bool)

(assert (=> b!308093 m!318437))

(assert (=> b!308093 m!318437))

(declare-fun m!318439 () Bool)

(assert (=> b!308093 m!318439))

(assert (=> b!307989 d!68291))

(declare-fun d!68293 () Bool)

(declare-fun lt!151277 () (_ BitVec 32))

(declare-fun lt!151276 () (_ BitVec 32))

(assert (=> d!68293 (= lt!151277 (bvmul (bvxor lt!151276 (bvlshr lt!151276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68293 (= lt!151276 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68293 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!164875 (let ((h!5252 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30647 (bvmul (bvxor h!5252 (bvlshr h!5252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30647 (bvlshr x!30647 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!164875 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!164875 #b00000000000000000000000000000000))))))

(assert (=> d!68293 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!151277 (bvlshr lt!151277 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!307989 d!68293))

(declare-fun b!308158 () Bool)

(declare-fun e!192735 () SeekEntryResult!2531)

(declare-fun e!192737 () SeekEntryResult!2531)

(assert (=> b!308158 (= e!192735 e!192737)))

(declare-fun lt!151293 () (_ BitVec 64))

(declare-fun lt!151294 () SeekEntryResult!2531)

(assert (=> b!308158 (= lt!151293 (select (arr!7426 a!3293) (index!12302 lt!151294)))))

(declare-fun c!49238 () Bool)

(assert (=> b!308158 (= c!49238 (= lt!151293 k0!2441))))

(declare-fun d!68295 () Bool)

(declare-fun lt!151295 () SeekEntryResult!2531)

(assert (=> d!68295 (and (or ((_ is Undefined!2531) lt!151295) (not ((_ is Found!2531) lt!151295)) (and (bvsge (index!12301 lt!151295) #b00000000000000000000000000000000) (bvslt (index!12301 lt!151295) (size!7778 a!3293)))) (or ((_ is Undefined!2531) lt!151295) ((_ is Found!2531) lt!151295) (not ((_ is MissingZero!2531) lt!151295)) (and (bvsge (index!12300 lt!151295) #b00000000000000000000000000000000) (bvslt (index!12300 lt!151295) (size!7778 a!3293)))) (or ((_ is Undefined!2531) lt!151295) ((_ is Found!2531) lt!151295) ((_ is MissingZero!2531) lt!151295) (not ((_ is MissingVacant!2531) lt!151295)) (and (bvsge (index!12303 lt!151295) #b00000000000000000000000000000000) (bvslt (index!12303 lt!151295) (size!7778 a!3293)))) (or ((_ is Undefined!2531) lt!151295) (ite ((_ is Found!2531) lt!151295) (= (select (arr!7426 a!3293) (index!12301 lt!151295)) k0!2441) (ite ((_ is MissingZero!2531) lt!151295) (= (select (arr!7426 a!3293) (index!12300 lt!151295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2531) lt!151295) (= (select (arr!7426 a!3293) (index!12303 lt!151295)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68295 (= lt!151295 e!192735)))

(declare-fun c!49237 () Bool)

(assert (=> d!68295 (= c!49237 (and ((_ is Intermediate!2531) lt!151294) (undefined!3343 lt!151294)))))

(assert (=> d!68295 (= lt!151294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68295 (validMask!0 mask!3709)))

(assert (=> d!68295 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!151295)))

(declare-fun b!308159 () Bool)

(assert (=> b!308159 (= e!192737 (Found!2531 (index!12302 lt!151294)))))

(declare-fun b!308160 () Bool)

(declare-fun e!192736 () SeekEntryResult!2531)

(assert (=> b!308160 (= e!192736 (MissingZero!2531 (index!12302 lt!151294)))))

(declare-fun b!308161 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15683 (_ BitVec 32)) SeekEntryResult!2531)

(assert (=> b!308161 (= e!192736 (seekKeyOrZeroReturnVacant!0 (x!30643 lt!151294) (index!12302 lt!151294) (index!12302 lt!151294) k0!2441 a!3293 mask!3709))))

(declare-fun b!308162 () Bool)

(declare-fun c!49236 () Bool)

(assert (=> b!308162 (= c!49236 (= lt!151293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!308162 (= e!192737 e!192736)))

(declare-fun b!308163 () Bool)

(assert (=> b!308163 (= e!192735 Undefined!2531)))

(assert (= (and d!68295 c!49237) b!308163))

(assert (= (and d!68295 (not c!49237)) b!308158))

(assert (= (and b!308158 c!49238) b!308159))

(assert (= (and b!308158 (not c!49238)) b!308162))

(assert (= (and b!308162 c!49236) b!308160))

(assert (= (and b!308162 (not c!49236)) b!308161))

(declare-fun m!318461 () Bool)

(assert (=> b!308158 m!318461))

(declare-fun m!318463 () Bool)

(assert (=> d!68295 m!318463))

(assert (=> d!68295 m!318363))

(assert (=> d!68295 m!318365))

(assert (=> d!68295 m!318363))

(assert (=> d!68295 m!318373))

(declare-fun m!318465 () Bool)

(assert (=> d!68295 m!318465))

(declare-fun m!318467 () Bool)

(assert (=> d!68295 m!318467))

(declare-fun m!318469 () Bool)

(assert (=> b!308161 m!318469))

(assert (=> b!307995 d!68295))

(declare-fun d!68305 () Bool)

(declare-fun res!164895 () Bool)

(declare-fun e!192742 () Bool)

(assert (=> d!68305 (=> res!164895 e!192742)))

(assert (=> d!68305 (= res!164895 (= (select (arr!7426 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68305 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!192742)))

(declare-fun b!308168 () Bool)

(declare-fun e!192743 () Bool)

(assert (=> b!308168 (= e!192742 e!192743)))

(declare-fun res!164896 () Bool)

(assert (=> b!308168 (=> (not res!164896) (not e!192743))))

(assert (=> b!308168 (= res!164896 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7778 a!3293)))))

(declare-fun b!308169 () Bool)

(assert (=> b!308169 (= e!192743 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68305 (not res!164895)) b!308168))

(assert (= (and b!308168 res!164896) b!308169))

(declare-fun m!318471 () Bool)

(assert (=> d!68305 m!318471))

(declare-fun m!318473 () Bool)

(assert (=> b!308169 m!318473))

(assert (=> b!307996 d!68305))

(declare-fun d!68307 () Bool)

(declare-fun lt!151298 () (_ BitVec 32))

(assert (=> d!68307 (and (bvsge lt!151298 #b00000000000000000000000000000000) (bvslt lt!151298 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68307 (= lt!151298 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68307 (validMask!0 mask!3709)))

(assert (=> d!68307 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!151298)))

(declare-fun bs!10845 () Bool)

(assert (= bs!10845 d!68307))

(declare-fun m!318475 () Bool)

(assert (=> bs!10845 m!318475))

(assert (=> bs!10845 m!318373))

(assert (=> b!307991 d!68307))

(declare-fun d!68313 () Bool)

(assert (=> d!68313 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!307992 d!68313))

(declare-fun b!308182 () Bool)

(declare-fun e!192756 () Bool)

(declare-fun e!192754 () Bool)

(assert (=> b!308182 (= e!192756 e!192754)))

(declare-fun c!49241 () Bool)

(assert (=> b!308182 (= c!49241 (validKeyInArray!0 (select (arr!7426 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!308183 () Bool)

(declare-fun e!192755 () Bool)

(declare-fun call!25898 () Bool)

(assert (=> b!308183 (= e!192755 call!25898)))

(declare-fun b!308184 () Bool)

(assert (=> b!308184 (= e!192754 call!25898)))

(declare-fun bm!25895 () Bool)

(assert (=> bm!25895 (= call!25898 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!308185 () Bool)

(assert (=> b!308185 (= e!192754 e!192755)))

(declare-fun lt!151307 () (_ BitVec 64))

(assert (=> b!308185 (= lt!151307 (select (arr!7426 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9543 0))(
  ( (Unit!9544) )
))
(declare-fun lt!151305 () Unit!9543)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15683 (_ BitVec 64) (_ BitVec 32)) Unit!9543)

(assert (=> b!308185 (= lt!151305 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151307 #b00000000000000000000000000000000))))

(assert (=> b!308185 (arrayContainsKey!0 a!3293 lt!151307 #b00000000000000000000000000000000)))

(declare-fun lt!151306 () Unit!9543)

(assert (=> b!308185 (= lt!151306 lt!151305)))

(declare-fun res!164905 () Bool)

(assert (=> b!308185 (= res!164905 (= (seekEntryOrOpen!0 (select (arr!7426 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2531 #b00000000000000000000000000000000)))))

(assert (=> b!308185 (=> (not res!164905) (not e!192755))))

(declare-fun d!68315 () Bool)

(declare-fun res!164906 () Bool)

(assert (=> d!68315 (=> res!164906 e!192756)))

(assert (=> d!68315 (= res!164906 (bvsge #b00000000000000000000000000000000 (size!7778 a!3293)))))

(assert (=> d!68315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!192756)))

(assert (= (and d!68315 (not res!164906)) b!308182))

(assert (= (and b!308182 c!49241) b!308185))

(assert (= (and b!308182 (not c!49241)) b!308184))

(assert (= (and b!308185 res!164905) b!308183))

(assert (= (or b!308183 b!308184) bm!25895))

(assert (=> b!308182 m!318471))

(assert (=> b!308182 m!318471))

(declare-fun m!318479 () Bool)

(assert (=> b!308182 m!318479))

(declare-fun m!318483 () Bool)

(assert (=> bm!25895 m!318483))

(assert (=> b!308185 m!318471))

(declare-fun m!318485 () Bool)

(assert (=> b!308185 m!318485))

(declare-fun m!318487 () Bool)

(assert (=> b!308185 m!318487))

(assert (=> b!308185 m!318471))

(declare-fun m!318489 () Bool)

(assert (=> b!308185 m!318489))

(assert (=> b!307997 d!68315))

(check-sat (not d!68307) (not b!308080) (not b!308093) (not d!68295) (not b!308182) (not b!308185) (not bm!25895) (not d!68291) (not d!68285) (not b!308161) (not b!308169))
(check-sat)
