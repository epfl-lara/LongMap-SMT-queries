; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29580 () Bool)

(assert start!29580)

(declare-fun b!298695 () Bool)

(declare-fun res!157536 () Bool)

(declare-fun e!188695 () Bool)

(assert (=> b!298695 (=> (not res!157536) (not e!188695))))

(declare-datatypes ((array!15107 0))(
  ( (array!15108 (arr!7155 (Array (_ BitVec 32) (_ BitVec 64))) (size!7507 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15107)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15107 (_ BitVec 32)) Bool)

(assert (=> b!298695 (= res!157536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298696 () Bool)

(declare-fun res!157535 () Bool)

(declare-fun e!188693 () Bool)

(assert (=> b!298696 (=> (not res!157535) (not e!188693))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298696 (= res!157535 (validKeyInArray!0 k0!2524))))

(declare-fun b!298697 () Bool)

(assert (=> b!298697 (= e!188693 e!188695)))

(declare-fun res!157532 () Bool)

(assert (=> b!298697 (=> (not res!157532) (not e!188695))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148513 () Bool)

(declare-datatypes ((SeekEntryResult!2304 0))(
  ( (MissingZero!2304 (index!11389 (_ BitVec 32))) (Found!2304 (index!11390 (_ BitVec 32))) (Intermediate!2304 (undefined!3116 Bool) (index!11391 (_ BitVec 32)) (x!29619 (_ BitVec 32))) (Undefined!2304) (MissingVacant!2304 (index!11392 (_ BitVec 32))) )
))
(declare-fun lt!148512 () SeekEntryResult!2304)

(assert (=> b!298697 (= res!157532 (or lt!148513 (= lt!148512 (MissingVacant!2304 i!1256))))))

(assert (=> b!298697 (= lt!148513 (= lt!148512 (MissingZero!2304 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15107 (_ BitVec 32)) SeekEntryResult!2304)

(assert (=> b!298697 (= lt!148512 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298699 () Bool)

(declare-fun res!157533 () Bool)

(assert (=> b!298699 (=> (not res!157533) (not e!188693))))

(assert (=> b!298699 (= res!157533 (and (= (size!7507 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7507 a!3312))))))

(declare-fun b!298700 () Bool)

(declare-fun res!157531 () Bool)

(assert (=> b!298700 (=> (not res!157531) (not e!188693))))

(declare-fun arrayContainsKey!0 (array!15107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298700 (= res!157531 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!157534 () Bool)

(assert (=> start!29580 (=> (not res!157534) (not e!188693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29580 (= res!157534 (validMask!0 mask!3809))))

(assert (=> start!29580 e!188693))

(assert (=> start!29580 true))

(declare-fun array_inv!5118 (array!15107) Bool)

(assert (=> start!29580 (array_inv!5118 a!3312)))

(declare-fun b!298698 () Bool)

(declare-fun lt!148514 () SeekEntryResult!2304)

(get-info :version)

(assert (=> b!298698 (= e!188695 (and (not lt!148513) (= lt!148512 (MissingVacant!2304 i!1256)) (let ((bdg!6425 (not ((_ is Intermediate!2304) lt!148514)))) (and (or bdg!6425 (not (undefined!3116 lt!148514))) (not bdg!6425) (= (select (arr!7155 a!3312) (index!11391 lt!148514)) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (index!11391 lt!148514) i!1256))))))))

(declare-fun lt!148511 () (_ BitVec 32))

(declare-fun lt!148515 () SeekEntryResult!2304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15107 (_ BitVec 32)) SeekEntryResult!2304)

(assert (=> b!298698 (= lt!148515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148511 k0!2524 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)) mask!3809))))

(assert (=> b!298698 (= lt!148514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148511 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298698 (= lt!148511 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29580 res!157534) b!298699))

(assert (= (and b!298699 res!157533) b!298696))

(assert (= (and b!298696 res!157535) b!298700))

(assert (= (and b!298700 res!157531) b!298697))

(assert (= (and b!298697 res!157532) b!298695))

(assert (= (and b!298695 res!157536) b!298698))

(declare-fun m!311131 () Bool)

(assert (=> b!298695 m!311131))

(declare-fun m!311133 () Bool)

(assert (=> b!298700 m!311133))

(declare-fun m!311135 () Bool)

(assert (=> b!298698 m!311135))

(declare-fun m!311137 () Bool)

(assert (=> b!298698 m!311137))

(declare-fun m!311139 () Bool)

(assert (=> b!298698 m!311139))

(declare-fun m!311141 () Bool)

(assert (=> b!298698 m!311141))

(declare-fun m!311143 () Bool)

(assert (=> b!298698 m!311143))

(declare-fun m!311145 () Bool)

(assert (=> b!298696 m!311145))

(declare-fun m!311147 () Bool)

(assert (=> start!29580 m!311147))

(declare-fun m!311149 () Bool)

(assert (=> start!29580 m!311149))

(declare-fun m!311151 () Bool)

(assert (=> b!298697 m!311151))

(check-sat (not b!298698) (not b!298695) (not b!298700) (not b!298696) (not start!29580) (not b!298697))
(check-sat)
(get-model)

(declare-fun b!298749 () Bool)

(declare-fun lt!148544 () SeekEntryResult!2304)

(assert (=> b!298749 (and (bvsge (index!11391 lt!148544) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148544) (size!7507 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)))))))

(declare-fun e!188724 () Bool)

(assert (=> b!298749 (= e!188724 (= (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (index!11391 lt!148544)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298750 () Bool)

(declare-fun e!188725 () Bool)

(assert (=> b!298750 (= e!188725 (bvsge (x!29619 lt!148544) #b01111111111111111111111111111110))))

(declare-fun b!298751 () Bool)

(declare-fun e!188726 () SeekEntryResult!2304)

(assert (=> b!298751 (= e!188726 (Intermediate!2304 true lt!148511 #b00000000000000000000000000000000))))

(declare-fun b!298752 () Bool)

(declare-fun e!188727 () SeekEntryResult!2304)

(assert (=> b!298752 (= e!188726 e!188727)))

(declare-fun c!48180 () Bool)

(declare-fun lt!148545 () (_ BitVec 64))

(assert (=> b!298752 (= c!48180 (or (= lt!148545 k0!2524) (= (bvadd lt!148545 lt!148545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67407 () Bool)

(assert (=> d!67407 e!188725))

(declare-fun c!48179 () Bool)

(assert (=> d!67407 (= c!48179 (and ((_ is Intermediate!2304) lt!148544) (undefined!3116 lt!148544)))))

(assert (=> d!67407 (= lt!148544 e!188726)))

(declare-fun c!48178 () Bool)

(assert (=> d!67407 (= c!48178 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67407 (= lt!148545 (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) lt!148511))))

(assert (=> d!67407 (validMask!0 mask!3809)))

(assert (=> d!67407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148511 k0!2524 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)) mask!3809) lt!148544)))

(declare-fun b!298753 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298753 (= e!188727 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)) mask!3809))))

(declare-fun b!298754 () Bool)

(assert (=> b!298754 (and (bvsge (index!11391 lt!148544) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148544) (size!7507 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)))))))

(declare-fun res!157569 () Bool)

(assert (=> b!298754 (= res!157569 (= (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (index!11391 lt!148544)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298754 (=> res!157569 e!188724)))

(declare-fun b!298755 () Bool)

(assert (=> b!298755 (= e!188727 (Intermediate!2304 false lt!148511 #b00000000000000000000000000000000))))

(declare-fun b!298756 () Bool)

(assert (=> b!298756 (and (bvsge (index!11391 lt!148544) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148544) (size!7507 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)))))))

(declare-fun res!157568 () Bool)

(assert (=> b!298756 (= res!157568 (= (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (index!11391 lt!148544)) k0!2524))))

(assert (=> b!298756 (=> res!157568 e!188724)))

(declare-fun e!188728 () Bool)

(assert (=> b!298756 (= e!188728 e!188724)))

(declare-fun b!298757 () Bool)

(assert (=> b!298757 (= e!188725 e!188728)))

(declare-fun res!157567 () Bool)

(assert (=> b!298757 (= res!157567 (and ((_ is Intermediate!2304) lt!148544) (not (undefined!3116 lt!148544)) (bvslt (x!29619 lt!148544) #b01111111111111111111111111111110) (bvsge (x!29619 lt!148544) #b00000000000000000000000000000000) (bvsge (x!29619 lt!148544) #b00000000000000000000000000000000)))))

(assert (=> b!298757 (=> (not res!157567) (not e!188728))))

(assert (= (and d!67407 c!48178) b!298751))

(assert (= (and d!67407 (not c!48178)) b!298752))

(assert (= (and b!298752 c!48180) b!298755))

(assert (= (and b!298752 (not c!48180)) b!298753))

(assert (= (and d!67407 c!48179) b!298750))

(assert (= (and d!67407 (not c!48179)) b!298757))

(assert (= (and b!298757 res!157567) b!298756))

(assert (= (and b!298756 (not res!157568)) b!298754))

(assert (= (and b!298754 (not res!157569)) b!298749))

(declare-fun m!311187 () Bool)

(assert (=> b!298754 m!311187))

(declare-fun m!311189 () Bool)

(assert (=> d!67407 m!311189))

(assert (=> d!67407 m!311147))

(assert (=> b!298756 m!311187))

(assert (=> b!298749 m!311187))

(declare-fun m!311191 () Bool)

(assert (=> b!298753 m!311191))

(assert (=> b!298753 m!311191))

(declare-fun m!311193 () Bool)

(assert (=> b!298753 m!311193))

(assert (=> b!298698 d!67407))

(declare-fun b!298758 () Bool)

(declare-fun lt!148546 () SeekEntryResult!2304)

(assert (=> b!298758 (and (bvsge (index!11391 lt!148546) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148546) (size!7507 a!3312)))))

(declare-fun e!188729 () Bool)

(assert (=> b!298758 (= e!188729 (= (select (arr!7155 a!3312) (index!11391 lt!148546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298759 () Bool)

(declare-fun e!188730 () Bool)

(assert (=> b!298759 (= e!188730 (bvsge (x!29619 lt!148546) #b01111111111111111111111111111110))))

(declare-fun b!298760 () Bool)

(declare-fun e!188731 () SeekEntryResult!2304)

(assert (=> b!298760 (= e!188731 (Intermediate!2304 true lt!148511 #b00000000000000000000000000000000))))

(declare-fun b!298761 () Bool)

(declare-fun e!188732 () SeekEntryResult!2304)

(assert (=> b!298761 (= e!188731 e!188732)))

(declare-fun c!48183 () Bool)

(declare-fun lt!148547 () (_ BitVec 64))

(assert (=> b!298761 (= c!48183 (or (= lt!148547 k0!2524) (= (bvadd lt!148547 lt!148547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67421 () Bool)

(assert (=> d!67421 e!188730))

(declare-fun c!48182 () Bool)

(assert (=> d!67421 (= c!48182 (and ((_ is Intermediate!2304) lt!148546) (undefined!3116 lt!148546)))))

(assert (=> d!67421 (= lt!148546 e!188731)))

(declare-fun c!48181 () Bool)

(assert (=> d!67421 (= c!48181 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67421 (= lt!148547 (select (arr!7155 a!3312) lt!148511))))

(assert (=> d!67421 (validMask!0 mask!3809)))

(assert (=> d!67421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148511 k0!2524 a!3312 mask!3809) lt!148546)))

(declare-fun b!298762 () Bool)

(assert (=> b!298762 (= e!188732 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298763 () Bool)

(assert (=> b!298763 (and (bvsge (index!11391 lt!148546) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148546) (size!7507 a!3312)))))

(declare-fun res!157572 () Bool)

(assert (=> b!298763 (= res!157572 (= (select (arr!7155 a!3312) (index!11391 lt!148546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298763 (=> res!157572 e!188729)))

(declare-fun b!298764 () Bool)

(assert (=> b!298764 (= e!188732 (Intermediate!2304 false lt!148511 #b00000000000000000000000000000000))))

(declare-fun b!298765 () Bool)

(assert (=> b!298765 (and (bvsge (index!11391 lt!148546) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148546) (size!7507 a!3312)))))

(declare-fun res!157571 () Bool)

(assert (=> b!298765 (= res!157571 (= (select (arr!7155 a!3312) (index!11391 lt!148546)) k0!2524))))

(assert (=> b!298765 (=> res!157571 e!188729)))

(declare-fun e!188733 () Bool)

(assert (=> b!298765 (= e!188733 e!188729)))

(declare-fun b!298766 () Bool)

(assert (=> b!298766 (= e!188730 e!188733)))

(declare-fun res!157570 () Bool)

(assert (=> b!298766 (= res!157570 (and ((_ is Intermediate!2304) lt!148546) (not (undefined!3116 lt!148546)) (bvslt (x!29619 lt!148546) #b01111111111111111111111111111110) (bvsge (x!29619 lt!148546) #b00000000000000000000000000000000) (bvsge (x!29619 lt!148546) #b00000000000000000000000000000000)))))

(assert (=> b!298766 (=> (not res!157570) (not e!188733))))

(assert (= (and d!67421 c!48181) b!298760))

(assert (= (and d!67421 (not c!48181)) b!298761))

(assert (= (and b!298761 c!48183) b!298764))

(assert (= (and b!298761 (not c!48183)) b!298762))

(assert (= (and d!67421 c!48182) b!298759))

(assert (= (and d!67421 (not c!48182)) b!298766))

(assert (= (and b!298766 res!157570) b!298765))

(assert (= (and b!298765 (not res!157571)) b!298763))

(assert (= (and b!298763 (not res!157572)) b!298758))

(declare-fun m!311195 () Bool)

(assert (=> b!298763 m!311195))

(declare-fun m!311197 () Bool)

(assert (=> d!67421 m!311197))

(assert (=> d!67421 m!311147))

(assert (=> b!298765 m!311195))

(assert (=> b!298758 m!311195))

(assert (=> b!298762 m!311191))

(assert (=> b!298762 m!311191))

(declare-fun m!311199 () Bool)

(assert (=> b!298762 m!311199))

(assert (=> b!298698 d!67421))

(declare-fun d!67423 () Bool)

(declare-fun lt!148553 () (_ BitVec 32))

(declare-fun lt!148552 () (_ BitVec 32))

(assert (=> d!67423 (= lt!148553 (bvmul (bvxor lt!148552 (bvlshr lt!148552 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67423 (= lt!148552 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67423 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157573 (let ((h!5310 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29622 (bvmul (bvxor h!5310 (bvlshr h!5310 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29622 (bvlshr x!29622 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157573 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157573 #b00000000000000000000000000000000))))))

(assert (=> d!67423 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148553 (bvlshr lt!148553 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298698 d!67423))

(declare-fun d!67425 () Bool)

(assert (=> d!67425 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29580 d!67425))

(declare-fun d!67427 () Bool)

(assert (=> d!67427 (= (array_inv!5118 a!3312) (bvsge (size!7507 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29580 d!67427))

(declare-fun d!67429 () Bool)

(declare-fun res!157602 () Bool)

(declare-fun e!188778 () Bool)

(assert (=> d!67429 (=> res!157602 e!188778)))

(assert (=> d!67429 (= res!157602 (= (select (arr!7155 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67429 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188778)))

(declare-fun b!298843 () Bool)

(declare-fun e!188779 () Bool)

(assert (=> b!298843 (= e!188778 e!188779)))

(declare-fun res!157603 () Bool)

(assert (=> b!298843 (=> (not res!157603) (not e!188779))))

(assert (=> b!298843 (= res!157603 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7507 a!3312)))))

(declare-fun b!298844 () Bool)

(assert (=> b!298844 (= e!188779 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67429 (not res!157602)) b!298843))

(assert (= (and b!298843 res!157603) b!298844))

(declare-fun m!311221 () Bool)

(assert (=> d!67429 m!311221))

(declare-fun m!311225 () Bool)

(assert (=> b!298844 m!311225))

(assert (=> b!298700 d!67429))

(declare-fun b!298853 () Bool)

(declare-fun e!188788 () Bool)

(declare-fun e!188786 () Bool)

(assert (=> b!298853 (= e!188788 e!188786)))

(declare-fun c!48210 () Bool)

(assert (=> b!298853 (= c!48210 (validKeyInArray!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298854 () Bool)

(declare-fun e!188787 () Bool)

(declare-fun call!25795 () Bool)

(assert (=> b!298854 (= e!188787 call!25795)))

(declare-fun bm!25792 () Bool)

(assert (=> bm!25792 (= call!25795 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67435 () Bool)

(declare-fun res!157611 () Bool)

(assert (=> d!67435 (=> res!157611 e!188788)))

(assert (=> d!67435 (= res!157611 (bvsge #b00000000000000000000000000000000 (size!7507 a!3312)))))

(assert (=> d!67435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188788)))

(declare-fun b!298855 () Bool)

(assert (=> b!298855 (= e!188786 call!25795)))

(declare-fun b!298856 () Bool)

(assert (=> b!298856 (= e!188786 e!188787)))

(declare-fun lt!148588 () (_ BitVec 64))

(assert (=> b!298856 (= lt!148588 (select (arr!7155 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9319 0))(
  ( (Unit!9320) )
))
(declare-fun lt!148590 () Unit!9319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15107 (_ BitVec 64) (_ BitVec 32)) Unit!9319)

(assert (=> b!298856 (= lt!148590 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148588 #b00000000000000000000000000000000))))

(assert (=> b!298856 (arrayContainsKey!0 a!3312 lt!148588 #b00000000000000000000000000000000)))

(declare-fun lt!148589 () Unit!9319)

(assert (=> b!298856 (= lt!148589 lt!148590)))

(declare-fun res!157610 () Bool)

(assert (=> b!298856 (= res!157610 (= (seekEntryOrOpen!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2304 #b00000000000000000000000000000000)))))

(assert (=> b!298856 (=> (not res!157610) (not e!188787))))

(assert (= (and d!67435 (not res!157611)) b!298853))

(assert (= (and b!298853 c!48210) b!298856))

(assert (= (and b!298853 (not c!48210)) b!298855))

(assert (= (and b!298856 res!157610) b!298854))

(assert (= (or b!298854 b!298855) bm!25792))

(assert (=> b!298853 m!311221))

(assert (=> b!298853 m!311221))

(declare-fun m!311233 () Bool)

(assert (=> b!298853 m!311233))

(declare-fun m!311235 () Bool)

(assert (=> bm!25792 m!311235))

(assert (=> b!298856 m!311221))

(declare-fun m!311237 () Bool)

(assert (=> b!298856 m!311237))

(declare-fun m!311239 () Bool)

(assert (=> b!298856 m!311239))

(assert (=> b!298856 m!311221))

(declare-fun m!311241 () Bool)

(assert (=> b!298856 m!311241))

(assert (=> b!298695 d!67435))

(declare-fun d!67445 () Bool)

(assert (=> d!67445 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298696 d!67445))

(declare-fun b!298893 () Bool)

(declare-fun c!48226 () Bool)

(declare-fun lt!148607 () (_ BitVec 64))

(assert (=> b!298893 (= c!48226 (= lt!148607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188812 () SeekEntryResult!2304)

(declare-fun e!188810 () SeekEntryResult!2304)

(assert (=> b!298893 (= e!188812 e!188810)))

(declare-fun d!67447 () Bool)

(declare-fun lt!148606 () SeekEntryResult!2304)

(assert (=> d!67447 (and (or ((_ is Undefined!2304) lt!148606) (not ((_ is Found!2304) lt!148606)) (and (bvsge (index!11390 lt!148606) #b00000000000000000000000000000000) (bvslt (index!11390 lt!148606) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148606) ((_ is Found!2304) lt!148606) (not ((_ is MissingZero!2304) lt!148606)) (and (bvsge (index!11389 lt!148606) #b00000000000000000000000000000000) (bvslt (index!11389 lt!148606) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148606) ((_ is Found!2304) lt!148606) ((_ is MissingZero!2304) lt!148606) (not ((_ is MissingVacant!2304) lt!148606)) (and (bvsge (index!11392 lt!148606) #b00000000000000000000000000000000) (bvslt (index!11392 lt!148606) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148606) (ite ((_ is Found!2304) lt!148606) (= (select (arr!7155 a!3312) (index!11390 lt!148606)) k0!2524) (ite ((_ is MissingZero!2304) lt!148606) (= (select (arr!7155 a!3312) (index!11389 lt!148606)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2304) lt!148606) (= (select (arr!7155 a!3312) (index!11392 lt!148606)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188811 () SeekEntryResult!2304)

(assert (=> d!67447 (= lt!148606 e!188811)))

(declare-fun c!48227 () Bool)

(declare-fun lt!148608 () SeekEntryResult!2304)

(assert (=> d!67447 (= c!48227 (and ((_ is Intermediate!2304) lt!148608) (undefined!3116 lt!148608)))))

(assert (=> d!67447 (= lt!148608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67447 (validMask!0 mask!3809)))

(assert (=> d!67447 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148606)))

(declare-fun b!298894 () Bool)

(assert (=> b!298894 (= e!188811 e!188812)))

(assert (=> b!298894 (= lt!148607 (select (arr!7155 a!3312) (index!11391 lt!148608)))))

(declare-fun c!48228 () Bool)

(assert (=> b!298894 (= c!48228 (= lt!148607 k0!2524))))

(declare-fun b!298895 () Bool)

(assert (=> b!298895 (= e!188810 (MissingZero!2304 (index!11391 lt!148608)))))

(declare-fun b!298896 () Bool)

(assert (=> b!298896 (= e!188811 Undefined!2304)))

(declare-fun b!298897 () Bool)

(assert (=> b!298897 (= e!188812 (Found!2304 (index!11391 lt!148608)))))

(declare-fun b!298898 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15107 (_ BitVec 32)) SeekEntryResult!2304)

(assert (=> b!298898 (= e!188810 (seekKeyOrZeroReturnVacant!0 (x!29619 lt!148608) (index!11391 lt!148608) (index!11391 lt!148608) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67447 c!48227) b!298896))

(assert (= (and d!67447 (not c!48227)) b!298894))

(assert (= (and b!298894 c!48228) b!298897))

(assert (= (and b!298894 (not c!48228)) b!298893))

(assert (= (and b!298893 c!48226) b!298895))

(assert (= (and b!298893 (not c!48226)) b!298898))

(assert (=> d!67447 m!311147))

(declare-fun m!311259 () Bool)

(assert (=> d!67447 m!311259))

(declare-fun m!311261 () Bool)

(assert (=> d!67447 m!311261))

(assert (=> d!67447 m!311143))

(declare-fun m!311263 () Bool)

(assert (=> d!67447 m!311263))

(assert (=> d!67447 m!311143))

(declare-fun m!311265 () Bool)

(assert (=> d!67447 m!311265))

(declare-fun m!311267 () Bool)

(assert (=> b!298894 m!311267))

(declare-fun m!311269 () Bool)

(assert (=> b!298898 m!311269))

(assert (=> b!298697 d!67447))

(check-sat (not b!298898) (not b!298753) (not b!298844) (not b!298762) (not d!67407) (not b!298856) (not b!298853) (not d!67447) (not d!67421) (not bm!25792))
(check-sat)
(get-model)

(declare-fun lt!148635 () SeekEntryResult!2304)

(declare-fun d!67461 () Bool)

(assert (=> d!67461 (and (or ((_ is Undefined!2304) lt!148635) (not ((_ is Found!2304) lt!148635)) (and (bvsge (index!11390 lt!148635) #b00000000000000000000000000000000) (bvslt (index!11390 lt!148635) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148635) ((_ is Found!2304) lt!148635) (not ((_ is MissingVacant!2304) lt!148635)) (not (= (index!11392 lt!148635) (index!11391 lt!148608))) (and (bvsge (index!11392 lt!148635) #b00000000000000000000000000000000) (bvslt (index!11392 lt!148635) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148635) (ite ((_ is Found!2304) lt!148635) (= (select (arr!7155 a!3312) (index!11390 lt!148635)) k0!2524) (and ((_ is MissingVacant!2304) lt!148635) (= (index!11392 lt!148635) (index!11391 lt!148608)) (= (select (arr!7155 a!3312) (index!11392 lt!148635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!188846 () SeekEntryResult!2304)

(assert (=> d!67461 (= lt!148635 e!188846)))

(declare-fun c!48250 () Bool)

(assert (=> d!67461 (= c!48250 (bvsge (x!29619 lt!148608) #b01111111111111111111111111111110))))

(declare-fun lt!148634 () (_ BitVec 64))

(assert (=> d!67461 (= lt!148634 (select (arr!7155 a!3312) (index!11391 lt!148608)))))

(assert (=> d!67461 (validMask!0 mask!3809)))

(assert (=> d!67461 (= (seekKeyOrZeroReturnVacant!0 (x!29619 lt!148608) (index!11391 lt!148608) (index!11391 lt!148608) k0!2524 a!3312 mask!3809) lt!148635)))

(declare-fun e!188847 () SeekEntryResult!2304)

(declare-fun b!298951 () Bool)

(assert (=> b!298951 (= e!188847 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29619 lt!148608) #b00000000000000000000000000000001) (nextIndex!0 (index!11391 lt!148608) (x!29619 lt!148608) mask!3809) (index!11391 lt!148608) k0!2524 a!3312 mask!3809))))

(declare-fun b!298952 () Bool)

(assert (=> b!298952 (= e!188846 Undefined!2304)))

(declare-fun b!298953 () Bool)

(assert (=> b!298953 (= e!188847 (MissingVacant!2304 (index!11391 lt!148608)))))

(declare-fun b!298954 () Bool)

(declare-fun c!48248 () Bool)

(assert (=> b!298954 (= c!48248 (= lt!148634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188848 () SeekEntryResult!2304)

(assert (=> b!298954 (= e!188848 e!188847)))

(declare-fun b!298955 () Bool)

(assert (=> b!298955 (= e!188848 (Found!2304 (index!11391 lt!148608)))))

(declare-fun b!298956 () Bool)

(assert (=> b!298956 (= e!188846 e!188848)))

(declare-fun c!48249 () Bool)

(assert (=> b!298956 (= c!48249 (= lt!148634 k0!2524))))

(assert (= (and d!67461 c!48250) b!298952))

(assert (= (and d!67461 (not c!48250)) b!298956))

(assert (= (and b!298956 c!48249) b!298955))

(assert (= (and b!298956 (not c!48249)) b!298954))

(assert (= (and b!298954 c!48248) b!298953))

(assert (= (and b!298954 (not c!48248)) b!298951))

(declare-fun m!311307 () Bool)

(assert (=> d!67461 m!311307))

(declare-fun m!311309 () Bool)

(assert (=> d!67461 m!311309))

(assert (=> d!67461 m!311267))

(assert (=> d!67461 m!311147))

(declare-fun m!311311 () Bool)

(assert (=> b!298951 m!311311))

(assert (=> b!298951 m!311311))

(declare-fun m!311313 () Bool)

(assert (=> b!298951 m!311313))

(assert (=> b!298898 d!67461))

(declare-fun d!67467 () Bool)

(assert (=> d!67467 (arrayContainsKey!0 a!3312 lt!148588 #b00000000000000000000000000000000)))

(declare-fun lt!148640 () Unit!9319)

(declare-fun choose!13 (array!15107 (_ BitVec 64) (_ BitVec 32)) Unit!9319)

(assert (=> d!67467 (= lt!148640 (choose!13 a!3312 lt!148588 #b00000000000000000000000000000000))))

(assert (=> d!67467 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!67467 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148588 #b00000000000000000000000000000000) lt!148640)))

(declare-fun bs!10544 () Bool)

(assert (= bs!10544 d!67467))

(assert (=> bs!10544 m!311239))

(declare-fun m!311323 () Bool)

(assert (=> bs!10544 m!311323))

(assert (=> b!298856 d!67467))

(declare-fun d!67471 () Bool)

(declare-fun res!157635 () Bool)

(declare-fun e!188854 () Bool)

(assert (=> d!67471 (=> res!157635 e!188854)))

(assert (=> d!67471 (= res!157635 (= (select (arr!7155 a!3312) #b00000000000000000000000000000000) lt!148588))))

(assert (=> d!67471 (= (arrayContainsKey!0 a!3312 lt!148588 #b00000000000000000000000000000000) e!188854)))

(declare-fun b!298966 () Bool)

(declare-fun e!188855 () Bool)

(assert (=> b!298966 (= e!188854 e!188855)))

(declare-fun res!157636 () Bool)

(assert (=> b!298966 (=> (not res!157636) (not e!188855))))

(assert (=> b!298966 (= res!157636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7507 a!3312)))))

(declare-fun b!298967 () Bool)

(assert (=> b!298967 (= e!188855 (arrayContainsKey!0 a!3312 lt!148588 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67471 (not res!157635)) b!298966))

(assert (= (and b!298966 res!157636) b!298967))

(assert (=> d!67471 m!311221))

(declare-fun m!311325 () Bool)

(assert (=> b!298967 m!311325))

(assert (=> b!298856 d!67471))

(declare-fun b!298968 () Bool)

(declare-fun c!48254 () Bool)

(declare-fun lt!148642 () (_ BitVec 64))

(assert (=> b!298968 (= c!48254 (= lt!148642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188858 () SeekEntryResult!2304)

(declare-fun e!188856 () SeekEntryResult!2304)

(assert (=> b!298968 (= e!188858 e!188856)))

(declare-fun d!67473 () Bool)

(declare-fun lt!148641 () SeekEntryResult!2304)

(assert (=> d!67473 (and (or ((_ is Undefined!2304) lt!148641) (not ((_ is Found!2304) lt!148641)) (and (bvsge (index!11390 lt!148641) #b00000000000000000000000000000000) (bvslt (index!11390 lt!148641) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148641) ((_ is Found!2304) lt!148641) (not ((_ is MissingZero!2304) lt!148641)) (and (bvsge (index!11389 lt!148641) #b00000000000000000000000000000000) (bvslt (index!11389 lt!148641) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148641) ((_ is Found!2304) lt!148641) ((_ is MissingZero!2304) lt!148641) (not ((_ is MissingVacant!2304) lt!148641)) (and (bvsge (index!11392 lt!148641) #b00000000000000000000000000000000) (bvslt (index!11392 lt!148641) (size!7507 a!3312)))) (or ((_ is Undefined!2304) lt!148641) (ite ((_ is Found!2304) lt!148641) (= (select (arr!7155 a!3312) (index!11390 lt!148641)) (select (arr!7155 a!3312) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!2304) lt!148641) (= (select (arr!7155 a!3312) (index!11389 lt!148641)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2304) lt!148641) (= (select (arr!7155 a!3312) (index!11392 lt!148641)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188857 () SeekEntryResult!2304)

(assert (=> d!67473 (= lt!148641 e!188857)))

(declare-fun c!48255 () Bool)

(declare-fun lt!148643 () SeekEntryResult!2304)

(assert (=> d!67473 (= c!48255 (and ((_ is Intermediate!2304) lt!148643) (undefined!3116 lt!148643)))))

(assert (=> d!67473 (= lt!148643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7155 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!67473 (validMask!0 mask!3809)))

(assert (=> d!67473 (= (seekEntryOrOpen!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!148641)))

(declare-fun b!298969 () Bool)

(assert (=> b!298969 (= e!188857 e!188858)))

(assert (=> b!298969 (= lt!148642 (select (arr!7155 a!3312) (index!11391 lt!148643)))))

(declare-fun c!48256 () Bool)

(assert (=> b!298969 (= c!48256 (= lt!148642 (select (arr!7155 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298970 () Bool)

(assert (=> b!298970 (= e!188856 (MissingZero!2304 (index!11391 lt!148643)))))

(declare-fun b!298971 () Bool)

(assert (=> b!298971 (= e!188857 Undefined!2304)))

(declare-fun b!298972 () Bool)

(assert (=> b!298972 (= e!188858 (Found!2304 (index!11391 lt!148643)))))

(declare-fun b!298973 () Bool)

(assert (=> b!298973 (= e!188856 (seekKeyOrZeroReturnVacant!0 (x!29619 lt!148643) (index!11391 lt!148643) (index!11391 lt!148643) (select (arr!7155 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (= (and d!67473 c!48255) b!298971))

(assert (= (and d!67473 (not c!48255)) b!298969))

(assert (= (and b!298969 c!48256) b!298972))

(assert (= (and b!298969 (not c!48256)) b!298968))

(assert (= (and b!298968 c!48254) b!298970))

(assert (= (and b!298968 (not c!48254)) b!298973))

(assert (=> d!67473 m!311147))

(declare-fun m!311327 () Bool)

(assert (=> d!67473 m!311327))

(declare-fun m!311329 () Bool)

(assert (=> d!67473 m!311329))

(declare-fun m!311331 () Bool)

(assert (=> d!67473 m!311331))

(assert (=> d!67473 m!311221))

(declare-fun m!311333 () Bool)

(assert (=> d!67473 m!311333))

(assert (=> d!67473 m!311221))

(assert (=> d!67473 m!311331))

(declare-fun m!311335 () Bool)

(assert (=> d!67473 m!311335))

(declare-fun m!311337 () Bool)

(assert (=> b!298969 m!311337))

(assert (=> b!298973 m!311221))

(declare-fun m!311341 () Bool)

(assert (=> b!298973 m!311341))

(assert (=> b!298856 d!67473))

(assert (=> d!67407 d!67425))

(assert (=> d!67421 d!67425))

(declare-fun b!298983 () Bool)

(declare-fun e!188866 () Bool)

(declare-fun e!188864 () Bool)

(assert (=> b!298983 (= e!188866 e!188864)))

(declare-fun c!48260 () Bool)

(assert (=> b!298983 (= c!48260 (validKeyInArray!0 (select (arr!7155 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!298984 () Bool)

(declare-fun e!188865 () Bool)

(declare-fun call!25800 () Bool)

(assert (=> b!298984 (= e!188865 call!25800)))

(declare-fun bm!25797 () Bool)

(assert (=> bm!25797 (= call!25800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67475 () Bool)

(declare-fun res!157641 () Bool)

(assert (=> d!67475 (=> res!157641 e!188866)))

(assert (=> d!67475 (= res!157641 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7507 a!3312)))))

(assert (=> d!67475 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!188866)))

(declare-fun b!298985 () Bool)

(assert (=> b!298985 (= e!188864 call!25800)))

(declare-fun b!298986 () Bool)

(assert (=> b!298986 (= e!188864 e!188865)))

(declare-fun lt!148649 () (_ BitVec 64))

(assert (=> b!298986 (= lt!148649 (select (arr!7155 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!148651 () Unit!9319)

(assert (=> b!298986 (= lt!148651 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148649 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!298986 (arrayContainsKey!0 a!3312 lt!148649 #b00000000000000000000000000000000)))

(declare-fun lt!148650 () Unit!9319)

(assert (=> b!298986 (= lt!148650 lt!148651)))

(declare-fun res!157640 () Bool)

(assert (=> b!298986 (= res!157640 (= (seekEntryOrOpen!0 (select (arr!7155 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298986 (=> (not res!157640) (not e!188865))))

(assert (= (and d!67475 (not res!157641)) b!298983))

(assert (= (and b!298983 c!48260) b!298986))

(assert (= (and b!298983 (not c!48260)) b!298985))

(assert (= (and b!298986 res!157640) b!298984))

(assert (= (or b!298984 b!298985) bm!25797))

(declare-fun m!311343 () Bool)

(assert (=> b!298983 m!311343))

(assert (=> b!298983 m!311343))

(declare-fun m!311345 () Bool)

(assert (=> b!298983 m!311345))

(declare-fun m!311347 () Bool)

(assert (=> bm!25797 m!311347))

(assert (=> b!298986 m!311343))

(declare-fun m!311349 () Bool)

(assert (=> b!298986 m!311349))

(declare-fun m!311351 () Bool)

(assert (=> b!298986 m!311351))

(assert (=> b!298986 m!311343))

(declare-fun m!311353 () Bool)

(assert (=> b!298986 m!311353))

(assert (=> bm!25792 d!67475))

(declare-fun b!298987 () Bool)

(declare-fun lt!148652 () SeekEntryResult!2304)

(assert (=> b!298987 (and (bvsge (index!11391 lt!148652) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148652) (size!7507 a!3312)))))

(declare-fun e!188867 () Bool)

(assert (=> b!298987 (= e!188867 (= (select (arr!7155 a!3312) (index!11391 lt!148652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298988 () Bool)

(declare-fun e!188868 () Bool)

(assert (=> b!298988 (= e!188868 (bvsge (x!29619 lt!148652) #b01111111111111111111111111111110))))

(declare-fun b!298989 () Bool)

(declare-fun e!188869 () SeekEntryResult!2304)

(assert (=> b!298989 (= e!188869 (Intermediate!2304 true (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298990 () Bool)

(declare-fun e!188870 () SeekEntryResult!2304)

(assert (=> b!298990 (= e!188869 e!188870)))

(declare-fun c!48263 () Bool)

(declare-fun lt!148653 () (_ BitVec 64))

(assert (=> b!298990 (= c!48263 (or (= lt!148653 k0!2524) (= (bvadd lt!148653 lt!148653) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67479 () Bool)

(assert (=> d!67479 e!188868))

(declare-fun c!48262 () Bool)

(assert (=> d!67479 (= c!48262 (and ((_ is Intermediate!2304) lt!148652) (undefined!3116 lt!148652)))))

(assert (=> d!67479 (= lt!148652 e!188869)))

(declare-fun c!48261 () Bool)

(assert (=> d!67479 (= c!48261 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!67479 (= lt!148653 (select (arr!7155 a!3312) (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67479 (validMask!0 mask!3809)))

(assert (=> d!67479 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809) lt!148652)))

(declare-fun b!298991 () Bool)

(assert (=> b!298991 (= e!188870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298992 () Bool)

(assert (=> b!298992 (and (bvsge (index!11391 lt!148652) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148652) (size!7507 a!3312)))))

(declare-fun res!157644 () Bool)

(assert (=> b!298992 (= res!157644 (= (select (arr!7155 a!3312) (index!11391 lt!148652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298992 (=> res!157644 e!188867)))

(declare-fun b!298993 () Bool)

(assert (=> b!298993 (= e!188870 (Intermediate!2304 false (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298994 () Bool)

(assert (=> b!298994 (and (bvsge (index!11391 lt!148652) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148652) (size!7507 a!3312)))))

(declare-fun res!157643 () Bool)

(assert (=> b!298994 (= res!157643 (= (select (arr!7155 a!3312) (index!11391 lt!148652)) k0!2524))))

(assert (=> b!298994 (=> res!157643 e!188867)))

(declare-fun e!188871 () Bool)

(assert (=> b!298994 (= e!188871 e!188867)))

(declare-fun b!298995 () Bool)

(assert (=> b!298995 (= e!188868 e!188871)))

(declare-fun res!157642 () Bool)

(assert (=> b!298995 (= res!157642 (and ((_ is Intermediate!2304) lt!148652) (not (undefined!3116 lt!148652)) (bvslt (x!29619 lt!148652) #b01111111111111111111111111111110) (bvsge (x!29619 lt!148652) #b00000000000000000000000000000000) (bvsge (x!29619 lt!148652) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298995 (=> (not res!157642) (not e!188871))))

(assert (= (and d!67479 c!48261) b!298989))

(assert (= (and d!67479 (not c!48261)) b!298990))

(assert (= (and b!298990 c!48263) b!298993))

(assert (= (and b!298990 (not c!48263)) b!298991))

(assert (= (and d!67479 c!48262) b!298988))

(assert (= (and d!67479 (not c!48262)) b!298995))

(assert (= (and b!298995 res!157642) b!298994))

(assert (= (and b!298994 (not res!157643)) b!298992))

(assert (= (and b!298992 (not res!157644)) b!298987))

(declare-fun m!311363 () Bool)

(assert (=> b!298992 m!311363))

(assert (=> d!67479 m!311191))

(declare-fun m!311365 () Bool)

(assert (=> d!67479 m!311365))

(assert (=> d!67479 m!311147))

(assert (=> b!298994 m!311363))

(assert (=> b!298987 m!311363))

(assert (=> b!298991 m!311191))

(declare-fun m!311367 () Bool)

(assert (=> b!298991 m!311367))

(assert (=> b!298991 m!311367))

(declare-fun m!311369 () Bool)

(assert (=> b!298991 m!311369))

(assert (=> b!298762 d!67479))

(declare-fun d!67483 () Bool)

(declare-fun lt!148658 () (_ BitVec 32))

(assert (=> d!67483 (and (bvsge lt!148658 #b00000000000000000000000000000000) (bvslt lt!148658 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67483 (= lt!148658 (choose!52 lt!148511 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!67483 (validMask!0 mask!3809)))

(assert (=> d!67483 (= (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) lt!148658)))

(declare-fun bs!10546 () Bool)

(assert (= bs!10546 d!67483))

(declare-fun m!311377 () Bool)

(assert (=> bs!10546 m!311377))

(assert (=> bs!10546 m!311147))

(assert (=> b!298762 d!67483))

(declare-fun b!299005 () Bool)

(declare-fun lt!148659 () SeekEntryResult!2304)

(assert (=> b!299005 (and (bvsge (index!11391 lt!148659) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148659) (size!7507 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)))))))

(declare-fun e!188877 () Bool)

(assert (=> b!299005 (= e!188877 (= (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (index!11391 lt!148659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299006 () Bool)

(declare-fun e!188878 () Bool)

(assert (=> b!299006 (= e!188878 (bvsge (x!29619 lt!148659) #b01111111111111111111111111111110))))

(declare-fun b!299007 () Bool)

(declare-fun e!188879 () SeekEntryResult!2304)

(assert (=> b!299007 (= e!188879 (Intermediate!2304 true (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299008 () Bool)

(declare-fun e!188880 () SeekEntryResult!2304)

(assert (=> b!299008 (= e!188879 e!188880)))

(declare-fun c!48269 () Bool)

(declare-fun lt!148660 () (_ BitVec 64))

(assert (=> b!299008 (= c!48269 (or (= lt!148660 k0!2524) (= (bvadd lt!148660 lt!148660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67489 () Bool)

(assert (=> d!67489 e!188878))

(declare-fun c!48268 () Bool)

(assert (=> d!67489 (= c!48268 (and ((_ is Intermediate!2304) lt!148659) (undefined!3116 lt!148659)))))

(assert (=> d!67489 (= lt!148659 e!188879)))

(declare-fun c!48267 () Bool)

(assert (=> d!67489 (= c!48267 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!67489 (= lt!148660 (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67489 (validMask!0 mask!3809)))

(assert (=> d!67489 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)) mask!3809) lt!148659)))

(declare-fun b!299009 () Bool)

(assert (=> b!299009 (= e!188880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)) mask!3809))))

(declare-fun b!299010 () Bool)

(assert (=> b!299010 (and (bvsge (index!11391 lt!148659) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148659) (size!7507 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)))))))

(declare-fun res!157650 () Bool)

(assert (=> b!299010 (= res!157650 (= (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (index!11391 lt!148659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299010 (=> res!157650 e!188877)))

(declare-fun b!299011 () Bool)

(assert (=> b!299011 (= e!188880 (Intermediate!2304 false (nextIndex!0 lt!148511 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!299012 () Bool)

(assert (=> b!299012 (and (bvsge (index!11391 lt!148659) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148659) (size!7507 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312)))))))

(declare-fun res!157649 () Bool)

(assert (=> b!299012 (= res!157649 (= (select (arr!7155 (array!15108 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7507 a!3312))) (index!11391 lt!148659)) k0!2524))))

(assert (=> b!299012 (=> res!157649 e!188877)))

(declare-fun e!188881 () Bool)

(assert (=> b!299012 (= e!188881 e!188877)))

(declare-fun b!299013 () Bool)

(assert (=> b!299013 (= e!188878 e!188881)))

(declare-fun res!157648 () Bool)

(assert (=> b!299013 (= res!157648 (and ((_ is Intermediate!2304) lt!148659) (not (undefined!3116 lt!148659)) (bvslt (x!29619 lt!148659) #b01111111111111111111111111111110) (bvsge (x!29619 lt!148659) #b00000000000000000000000000000000) (bvsge (x!29619 lt!148659) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!299013 (=> (not res!157648) (not e!188881))))

(assert (= (and d!67489 c!48267) b!299007))

(assert (= (and d!67489 (not c!48267)) b!299008))

(assert (= (and b!299008 c!48269) b!299011))

(assert (= (and b!299008 (not c!48269)) b!299009))

(assert (= (and d!67489 c!48268) b!299006))

(assert (= (and d!67489 (not c!48268)) b!299013))

(assert (= (and b!299013 res!157648) b!299012))

(assert (= (and b!299012 (not res!157649)) b!299010))

(assert (= (and b!299010 (not res!157650)) b!299005))

(declare-fun m!311379 () Bool)

(assert (=> b!299010 m!311379))

(assert (=> d!67489 m!311191))

(declare-fun m!311381 () Bool)

(assert (=> d!67489 m!311381))

(assert (=> d!67489 m!311147))

(assert (=> b!299012 m!311379))

(assert (=> b!299005 m!311379))

(assert (=> b!299009 m!311191))

(assert (=> b!299009 m!311367))

(assert (=> b!299009 m!311367))

(declare-fun m!311383 () Bool)

(assert (=> b!299009 m!311383))

(assert (=> b!298753 d!67489))

(assert (=> b!298753 d!67483))

(declare-fun d!67491 () Bool)

(declare-fun res!157651 () Bool)

(declare-fun e!188882 () Bool)

(assert (=> d!67491 (=> res!157651 e!188882)))

(assert (=> d!67491 (= res!157651 (= (select (arr!7155 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2524))))

(assert (=> d!67491 (= (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!188882)))

(declare-fun b!299014 () Bool)

(declare-fun e!188883 () Bool)

(assert (=> b!299014 (= e!188882 e!188883)))

(declare-fun res!157652 () Bool)

(assert (=> b!299014 (=> (not res!157652) (not e!188883))))

(assert (=> b!299014 (= res!157652 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7507 a!3312)))))

(declare-fun b!299015 () Bool)

(assert (=> b!299015 (= e!188883 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!67491 (not res!157651)) b!299014))

(assert (= (and b!299014 res!157652) b!299015))

(assert (=> d!67491 m!311343))

(declare-fun m!311385 () Bool)

(assert (=> b!299015 m!311385))

(assert (=> b!298844 d!67491))

(declare-fun d!67493 () Bool)

(assert (=> d!67493 (= (validKeyInArray!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7155 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7155 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298853 d!67493))

(declare-fun b!299016 () Bool)

(declare-fun lt!148661 () SeekEntryResult!2304)

(assert (=> b!299016 (and (bvsge (index!11391 lt!148661) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148661) (size!7507 a!3312)))))

(declare-fun e!188884 () Bool)

(assert (=> b!299016 (= e!188884 (= (select (arr!7155 a!3312) (index!11391 lt!148661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299017 () Bool)

(declare-fun e!188885 () Bool)

(assert (=> b!299017 (= e!188885 (bvsge (x!29619 lt!148661) #b01111111111111111111111111111110))))

(declare-fun b!299018 () Bool)

(declare-fun e!188886 () SeekEntryResult!2304)

(assert (=> b!299018 (= e!188886 (Intermediate!2304 true (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!299019 () Bool)

(declare-fun e!188887 () SeekEntryResult!2304)

(assert (=> b!299019 (= e!188886 e!188887)))

(declare-fun c!48272 () Bool)

(declare-fun lt!148662 () (_ BitVec 64))

(assert (=> b!299019 (= c!48272 (or (= lt!148662 k0!2524) (= (bvadd lt!148662 lt!148662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67495 () Bool)

(assert (=> d!67495 e!188885))

(declare-fun c!48271 () Bool)

(assert (=> d!67495 (= c!48271 (and ((_ is Intermediate!2304) lt!148661) (undefined!3116 lt!148661)))))

(assert (=> d!67495 (= lt!148661 e!188886)))

(declare-fun c!48270 () Bool)

(assert (=> d!67495 (= c!48270 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67495 (= lt!148662 (select (arr!7155 a!3312) (toIndex!0 k0!2524 mask!3809)))))

(assert (=> d!67495 (validMask!0 mask!3809)))

(assert (=> d!67495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809) lt!148661)))

(declare-fun b!299020 () Bool)

(assert (=> b!299020 (= e!188887 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299021 () Bool)

(assert (=> b!299021 (and (bvsge (index!11391 lt!148661) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148661) (size!7507 a!3312)))))

(declare-fun res!157655 () Bool)

(assert (=> b!299021 (= res!157655 (= (select (arr!7155 a!3312) (index!11391 lt!148661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299021 (=> res!157655 e!188884)))

(declare-fun b!299022 () Bool)

(assert (=> b!299022 (= e!188887 (Intermediate!2304 false (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!299023 () Bool)

(assert (=> b!299023 (and (bvsge (index!11391 lt!148661) #b00000000000000000000000000000000) (bvslt (index!11391 lt!148661) (size!7507 a!3312)))))

(declare-fun res!157654 () Bool)

(assert (=> b!299023 (= res!157654 (= (select (arr!7155 a!3312) (index!11391 lt!148661)) k0!2524))))

(assert (=> b!299023 (=> res!157654 e!188884)))

(declare-fun e!188888 () Bool)

(assert (=> b!299023 (= e!188888 e!188884)))

(declare-fun b!299024 () Bool)

(assert (=> b!299024 (= e!188885 e!188888)))

(declare-fun res!157653 () Bool)

(assert (=> b!299024 (= res!157653 (and ((_ is Intermediate!2304) lt!148661) (not (undefined!3116 lt!148661)) (bvslt (x!29619 lt!148661) #b01111111111111111111111111111110) (bvsge (x!29619 lt!148661) #b00000000000000000000000000000000) (bvsge (x!29619 lt!148661) #b00000000000000000000000000000000)))))

(assert (=> b!299024 (=> (not res!157653) (not e!188888))))

(assert (= (and d!67495 c!48270) b!299018))

(assert (= (and d!67495 (not c!48270)) b!299019))

(assert (= (and b!299019 c!48272) b!299022))

(assert (= (and b!299019 (not c!48272)) b!299020))

(assert (= (and d!67495 c!48271) b!299017))

(assert (= (and d!67495 (not c!48271)) b!299024))

(assert (= (and b!299024 res!157653) b!299023))

(assert (= (and b!299023 (not res!157654)) b!299021))

(assert (= (and b!299021 (not res!157655)) b!299016))

(declare-fun m!311387 () Bool)

(assert (=> b!299021 m!311387))

(assert (=> d!67495 m!311143))

(declare-fun m!311389 () Bool)

(assert (=> d!67495 m!311389))

(assert (=> d!67495 m!311147))

(assert (=> b!299023 m!311387))

(assert (=> b!299016 m!311387))

(assert (=> b!299020 m!311143))

(declare-fun m!311391 () Bool)

(assert (=> b!299020 m!311391))

(assert (=> b!299020 m!311391))

(declare-fun m!311393 () Bool)

(assert (=> b!299020 m!311393))

(assert (=> d!67447 d!67495))

(assert (=> d!67447 d!67423))

(assert (=> d!67447 d!67425))

(check-sat (not b!299020) (not b!299015) (not d!67495) (not b!298986) (not d!67461) (not b!299009) (not d!67473) (not bm!25797) (not d!67489) (not b!298967) (not b!298983) (not d!67483) (not b!298951) (not d!67467) (not b!298991) (not b!298973) (not d!67479))
(check-sat)
