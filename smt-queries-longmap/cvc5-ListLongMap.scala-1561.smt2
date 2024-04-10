; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29656 () Bool)

(assert start!29656)

(declare-fun b!299200 () Bool)

(declare-fun res!157764 () Bool)

(declare-fun e!188994 () Bool)

(assert (=> b!299200 (=> (not res!157764) (not e!188994))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15120 0))(
  ( (array!15121 (arr!7160 (Array (_ BitVec 32) (_ BitVec 64))) (size!7512 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15120)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!299200 (= res!157764 (and (= (size!7512 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7512 a!3312))))))

(declare-fun res!157765 () Bool)

(assert (=> start!29656 (=> (not res!157765) (not e!188994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29656 (= res!157765 (validMask!0 mask!3809))))

(assert (=> start!29656 e!188994))

(assert (=> start!29656 true))

(declare-fun array_inv!5123 (array!15120) Bool)

(assert (=> start!29656 (array_inv!5123 a!3312)))

(declare-fun b!299201 () Bool)

(declare-fun res!157766 () Bool)

(assert (=> b!299201 (=> (not res!157766) (not e!188994))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299201 (= res!157766 (validKeyInArray!0 k!2524))))

(declare-fun b!299202 () Bool)

(declare-fun e!188996 () Bool)

(declare-fun lt!148782 () array!15120)

(declare-datatypes ((SeekEntryResult!2309 0))(
  ( (MissingZero!2309 (index!11409 (_ BitVec 32))) (Found!2309 (index!11410 (_ BitVec 32))) (Intermediate!2309 (undefined!3121 Bool) (index!11411 (_ BitVec 32)) (x!29652 (_ BitVec 32))) (Undefined!2309) (MissingVacant!2309 (index!11412 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15120 (_ BitVec 32)) SeekEntryResult!2309)

(assert (=> b!299202 (= e!188996 (not (= (seekEntryOrOpen!0 k!2524 lt!148782 mask!3809) (Found!2309 i!1256))))))

(declare-fun lt!148779 () (_ BitVec 32))

(declare-datatypes ((Unit!9329 0))(
  ( (Unit!9330) )
))
(declare-fun lt!148784 () Unit!9329)

(declare-fun lt!148783 () SeekEntryResult!2309)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15120 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9329)

(assert (=> b!299202 (= lt!148784 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!148779 (index!11411 lt!148783) (x!29652 lt!148783) mask!3809))))

(assert (=> b!299202 (= (index!11411 lt!148783) i!1256)))

(declare-fun b!299203 () Bool)

(declare-fun e!188997 () Bool)

(assert (=> b!299203 (= e!188997 e!188996)))

(declare-fun res!157763 () Bool)

(assert (=> b!299203 (=> (not res!157763) (not e!188996))))

(declare-fun lt!148781 () Bool)

(assert (=> b!299203 (= res!157763 (and (or lt!148781 (not (undefined!3121 lt!148783))) (not lt!148781) (= (select (arr!7160 a!3312) (index!11411 lt!148783)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!299203 (= lt!148781 (not (is-Intermediate!2309 lt!148783)))))

(declare-fun b!299204 () Bool)

(declare-fun e!188995 () Bool)

(assert (=> b!299204 (= e!188995 e!188997)))

(declare-fun res!157770 () Bool)

(assert (=> b!299204 (=> (not res!157770) (not e!188997))))

(declare-fun lt!148785 () SeekEntryResult!2309)

(declare-fun lt!148778 () Bool)

(assert (=> b!299204 (= res!157770 (and (not lt!148778) (= lt!148785 (MissingVacant!2309 i!1256))))))

(declare-fun lt!148780 () SeekEntryResult!2309)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15120 (_ BitVec 32)) SeekEntryResult!2309)

(assert (=> b!299204 (= lt!148780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148779 k!2524 lt!148782 mask!3809))))

(assert (=> b!299204 (= lt!148782 (array!15121 (store (arr!7160 a!3312) i!1256 k!2524) (size!7512 a!3312)))))

(assert (=> b!299204 (= lt!148783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148779 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299204 (= lt!148779 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!299205 () Bool)

(declare-fun res!157768 () Bool)

(assert (=> b!299205 (=> (not res!157768) (not e!188995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15120 (_ BitVec 32)) Bool)

(assert (=> b!299205 (= res!157768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299206 () Bool)

(assert (=> b!299206 (= e!188994 e!188995)))

(declare-fun res!157767 () Bool)

(assert (=> b!299206 (=> (not res!157767) (not e!188995))))

(assert (=> b!299206 (= res!157767 (or lt!148778 (= lt!148785 (MissingVacant!2309 i!1256))))))

(assert (=> b!299206 (= lt!148778 (= lt!148785 (MissingZero!2309 i!1256)))))

(assert (=> b!299206 (= lt!148785 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!299207 () Bool)

(declare-fun res!157769 () Bool)

(assert (=> b!299207 (=> (not res!157769) (not e!188994))))

(declare-fun arrayContainsKey!0 (array!15120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299207 (= res!157769 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29656 res!157765) b!299200))

(assert (= (and b!299200 res!157764) b!299201))

(assert (= (and b!299201 res!157766) b!299207))

(assert (= (and b!299207 res!157769) b!299206))

(assert (= (and b!299206 res!157767) b!299205))

(assert (= (and b!299205 res!157768) b!299204))

(assert (= (and b!299204 res!157770) b!299203))

(assert (= (and b!299203 res!157763) b!299202))

(declare-fun m!311559 () Bool)

(assert (=> b!299206 m!311559))

(declare-fun m!311561 () Bool)

(assert (=> b!299205 m!311561))

(declare-fun m!311563 () Bool)

(assert (=> b!299207 m!311563))

(declare-fun m!311565 () Bool)

(assert (=> b!299203 m!311565))

(declare-fun m!311567 () Bool)

(assert (=> b!299204 m!311567))

(declare-fun m!311569 () Bool)

(assert (=> b!299204 m!311569))

(declare-fun m!311571 () Bool)

(assert (=> b!299204 m!311571))

(declare-fun m!311573 () Bool)

(assert (=> b!299204 m!311573))

(declare-fun m!311575 () Bool)

(assert (=> b!299202 m!311575))

(declare-fun m!311577 () Bool)

(assert (=> b!299202 m!311577))

(declare-fun m!311579 () Bool)

(assert (=> start!29656 m!311579))

(declare-fun m!311581 () Bool)

(assert (=> start!29656 m!311581))

(declare-fun m!311583 () Bool)

(assert (=> b!299201 m!311583))

(push 1)

(assert (not b!299207))

(assert (not b!299204))

(assert (not b!299205))

(assert (not b!299201))

(assert (not b!299202))

(assert (not b!299206))

(assert (not start!29656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!299304 () Bool)

(declare-fun e!189062 () SeekEntryResult!2309)

(assert (=> b!299304 (= e!189062 (Intermediate!2309 true lt!148779 #b00000000000000000000000000000000))))

(declare-fun b!299305 () Bool)

(declare-fun e!189059 () SeekEntryResult!2309)

(assert (=> b!299305 (= e!189059 (Intermediate!2309 false lt!148779 #b00000000000000000000000000000000))))

(declare-fun b!299306 () Bool)

(declare-fun lt!148852 () SeekEntryResult!2309)

(assert (=> b!299306 (and (bvsge (index!11411 lt!148852) #b00000000000000000000000000000000) (bvslt (index!11411 lt!148852) (size!7512 lt!148782)))))

(declare-fun res!157838 () Bool)

(assert (=> b!299306 (= res!157838 (= (select (arr!7160 lt!148782) (index!11411 lt!148852)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189058 () Bool)

(assert (=> b!299306 (=> res!157838 e!189058)))

(declare-fun d!67535 () Bool)

(declare-fun e!189061 () Bool)

(assert (=> d!67535 e!189061))

(declare-fun c!48323 () Bool)

(assert (=> d!67535 (= c!48323 (and (is-Intermediate!2309 lt!148852) (undefined!3121 lt!148852)))))

(assert (=> d!67535 (= lt!148852 e!189062)))

(declare-fun c!48324 () Bool)

(assert (=> d!67535 (= c!48324 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148851 () (_ BitVec 64))

(assert (=> d!67535 (= lt!148851 (select (arr!7160 lt!148782) lt!148779))))

(assert (=> d!67535 (validMask!0 mask!3809)))

(assert (=> d!67535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148779 k!2524 lt!148782 mask!3809) lt!148852)))

(declare-fun b!299307 () Bool)

(assert (=> b!299307 (and (bvsge (index!11411 lt!148852) #b00000000000000000000000000000000) (bvslt (index!11411 lt!148852) (size!7512 lt!148782)))))

(declare-fun res!157839 () Bool)

(assert (=> b!299307 (= res!157839 (= (select (arr!7160 lt!148782) (index!11411 lt!148852)) k!2524))))

(assert (=> b!299307 (=> res!157839 e!189058)))

(declare-fun e!189060 () Bool)

(assert (=> b!299307 (= e!189060 e!189058)))

(declare-fun b!299308 () Bool)

(assert (=> b!299308 (= e!189061 e!189060)))

(declare-fun res!157837 () Bool)

(assert (=> b!299308 (= res!157837 (and (is-Intermediate!2309 lt!148852) (not (undefined!3121 lt!148852)) (bvslt (x!29652 lt!148852) #b01111111111111111111111111111110) (bvsge (x!29652 lt!148852) #b00000000000000000000000000000000) (bvsge (x!29652 lt!148852) #b00000000000000000000000000000000)))))

(assert (=> b!299308 (=> (not res!157837) (not e!189060))))

(declare-fun b!299309 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299309 (= e!189059 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148779 #b00000000000000000000000000000000 mask!3809) k!2524 lt!148782 mask!3809))))

(declare-fun b!299310 () Bool)

(assert (=> b!299310 (= e!189061 (bvsge (x!29652 lt!148852) #b01111111111111111111111111111110))))

(declare-fun b!299311 () Bool)

(assert (=> b!299311 (and (bvsge (index!11411 lt!148852) #b00000000000000000000000000000000) (bvslt (index!11411 lt!148852) (size!7512 lt!148782)))))

(assert (=> b!299311 (= e!189058 (= (select (arr!7160 lt!148782) (index!11411 lt!148852)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299312 () Bool)

(assert (=> b!299312 (= e!189062 e!189059)))

(declare-fun c!48322 () Bool)

(assert (=> b!299312 (= c!48322 (or (= lt!148851 k!2524) (= (bvadd lt!148851 lt!148851) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67535 c!48324) b!299304))

(assert (= (and d!67535 (not c!48324)) b!299312))

(assert (= (and b!299312 c!48322) b!299305))

(assert (= (and b!299312 (not c!48322)) b!299309))

(assert (= (and d!67535 c!48323) b!299310))

(assert (= (and d!67535 (not c!48323)) b!299308))

(assert (= (and b!299308 res!157837) b!299307))

(assert (= (and b!299307 (not res!157839)) b!299306))

(assert (= (and b!299306 (not res!157838)) b!299311))

(declare-fun m!311649 () Bool)

(assert (=> b!299309 m!311649))

(assert (=> b!299309 m!311649))

(declare-fun m!311651 () Bool)

(assert (=> b!299309 m!311651))

(declare-fun m!311653 () Bool)

(assert (=> b!299307 m!311653))

(assert (=> b!299311 m!311653))

(assert (=> b!299306 m!311653))

(declare-fun m!311655 () Bool)

(assert (=> d!67535 m!311655))

(assert (=> d!67535 m!311579))

(assert (=> b!299204 d!67535))

(declare-fun b!299322 () Bool)

(declare-fun e!189072 () SeekEntryResult!2309)

(assert (=> b!299322 (= e!189072 (Intermediate!2309 true lt!148779 #b00000000000000000000000000000000))))

(declare-fun b!299323 () Bool)

(declare-fun e!189069 () SeekEntryResult!2309)

(assert (=> b!299323 (= e!189069 (Intermediate!2309 false lt!148779 #b00000000000000000000000000000000))))

(declare-fun b!299324 () Bool)

(declare-fun lt!148856 () SeekEntryResult!2309)

(assert (=> b!299324 (and (bvsge (index!11411 lt!148856) #b00000000000000000000000000000000) (bvslt (index!11411 lt!148856) (size!7512 a!3312)))))

(declare-fun res!157844 () Bool)

(assert (=> b!299324 (= res!157844 (= (select (arr!7160 a!3312) (index!11411 lt!148856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189068 () Bool)

(assert (=> b!299324 (=> res!157844 e!189068)))

(declare-fun d!67543 () Bool)

(declare-fun e!189071 () Bool)

(assert (=> d!67543 e!189071))

(declare-fun c!48329 () Bool)

(assert (=> d!67543 (= c!48329 (and (is-Intermediate!2309 lt!148856) (undefined!3121 lt!148856)))))

(assert (=> d!67543 (= lt!148856 e!189072)))

(declare-fun c!48330 () Bool)

(assert (=> d!67543 (= c!48330 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148855 () (_ BitVec 64))

(assert (=> d!67543 (= lt!148855 (select (arr!7160 a!3312) lt!148779))))

(assert (=> d!67543 (validMask!0 mask!3809)))

(assert (=> d!67543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148779 k!2524 a!3312 mask!3809) lt!148856)))

(declare-fun b!299325 () Bool)

(assert (=> b!299325 (and (bvsge (index!11411 lt!148856) #b00000000000000000000000000000000) (bvslt (index!11411 lt!148856) (size!7512 a!3312)))))

(declare-fun res!157845 () Bool)

(assert (=> b!299325 (= res!157845 (= (select (arr!7160 a!3312) (index!11411 lt!148856)) k!2524))))

(assert (=> b!299325 (=> res!157845 e!189068)))

(declare-fun e!189070 () Bool)

(assert (=> b!299325 (= e!189070 e!189068)))

(declare-fun b!299326 () Bool)

(assert (=> b!299326 (= e!189071 e!189070)))

(declare-fun res!157843 () Bool)

(assert (=> b!299326 (= res!157843 (and (is-Intermediate!2309 lt!148856) (not (undefined!3121 lt!148856)) (bvslt (x!29652 lt!148856) #b01111111111111111111111111111110) (bvsge (x!29652 lt!148856) #b00000000000000000000000000000000) (bvsge (x!29652 lt!148856) #b00000000000000000000000000000000)))))

(assert (=> b!299326 (=> (not res!157843) (not e!189070))))

(declare-fun b!299327 () Bool)

(assert (=> b!299327 (= e!189069 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148779 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!299328 () Bool)

(assert (=> b!299328 (= e!189071 (bvsge (x!29652 lt!148856) #b01111111111111111111111111111110))))

(declare-fun b!299329 () Bool)

(assert (=> b!299329 (and (bvsge (index!11411 lt!148856) #b00000000000000000000000000000000) (bvslt (index!11411 lt!148856) (size!7512 a!3312)))))

(assert (=> b!299329 (= e!189068 (= (select (arr!7160 a!3312) (index!11411 lt!148856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299330 () Bool)

(assert (=> b!299330 (= e!189072 e!189069)))

(declare-fun c!48328 () Bool)

(assert (=> b!299330 (= c!48328 (or (= lt!148855 k!2524) (= (bvadd lt!148855 lt!148855) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67543 c!48330) b!299322))

(assert (= (and d!67543 (not c!48330)) b!299330))

(assert (= (and b!299330 c!48328) b!299323))

(assert (= (and b!299330 (not c!48328)) b!299327))

(assert (= (and d!67543 c!48329) b!299328))

(assert (= (and d!67543 (not c!48329)) b!299326))

(assert (= (and b!299326 res!157843) b!299325))

(assert (= (and b!299325 (not res!157845)) b!299324))

(assert (= (and b!299324 (not res!157844)) b!299329))

(assert (=> b!299327 m!311649))

(assert (=> b!299327 m!311649))

(declare-fun m!311663 () Bool)

(assert (=> b!299327 m!311663))

(declare-fun m!311665 () Bool)

(assert (=> b!299325 m!311665))

(assert (=> b!299329 m!311665))

(assert (=> b!299324 m!311665))

(declare-fun m!311669 () Bool)

(assert (=> d!67543 m!311669))

(assert (=> d!67543 m!311579))

(assert (=> b!299204 d!67543))

(declare-fun d!67547 () Bool)

(declare-fun lt!148864 () (_ BitVec 32))

(declare-fun lt!148863 () (_ BitVec 32))

(assert (=> d!67547 (= lt!148864 (bvmul (bvxor lt!148863 (bvlshr lt!148863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67547 (= lt!148863 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67547 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157849 (let ((h!5313 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29657 (bvmul (bvxor h!5313 (bvlshr h!5313 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29657 (bvlshr x!29657 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157849 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157849 #b00000000000000000000000000000000))))))

(assert (=> d!67547 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148864 (bvlshr lt!148864 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299204 d!67547))

(declare-fun b!299364 () Bool)

(declare-fun c!48347 () Bool)

(declare-fun lt!148884 () (_ BitVec 64))

(assert (=> b!299364 (= c!48347 (= lt!148884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189091 () SeekEntryResult!2309)

(declare-fun e!189092 () SeekEntryResult!2309)

(assert (=> b!299364 (= e!189091 e!189092)))

(declare-fun b!299365 () Bool)

(declare-fun e!189090 () SeekEntryResult!2309)

(assert (=> b!299365 (= e!189090 e!189091)))

(declare-fun lt!148885 () SeekEntryResult!2309)

(assert (=> b!299365 (= lt!148884 (select (arr!7160 lt!148782) (index!11411 lt!148885)))))

(declare-fun c!48346 () Bool)

(assert (=> b!299365 (= c!48346 (= lt!148884 k!2524))))

(declare-fun b!299366 () Bool)

(assert (=> b!299366 (= e!189090 Undefined!2309)))

(declare-fun b!299367 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15120 (_ BitVec 32)) SeekEntryResult!2309)

(assert (=> b!299367 (= e!189092 (seekKeyOrZeroReturnVacant!0 (x!29652 lt!148885) (index!11411 lt!148885) (index!11411 lt!148885) k!2524 lt!148782 mask!3809))))

(declare-fun d!67551 () Bool)

(declare-fun lt!148883 () SeekEntryResult!2309)

(assert (=> d!67551 (and (or (is-Undefined!2309 lt!148883) (not (is-Found!2309 lt!148883)) (and (bvsge (index!11410 lt!148883) #b00000000000000000000000000000000) (bvslt (index!11410 lt!148883) (size!7512 lt!148782)))) (or (is-Undefined!2309 lt!148883) (is-Found!2309 lt!148883) (not (is-MissingZero!2309 lt!148883)) (and (bvsge (index!11409 lt!148883) #b00000000000000000000000000000000) (bvslt (index!11409 lt!148883) (size!7512 lt!148782)))) (or (is-Undefined!2309 lt!148883) (is-Found!2309 lt!148883) (is-MissingZero!2309 lt!148883) (not (is-MissingVacant!2309 lt!148883)) (and (bvsge (index!11412 lt!148883) #b00000000000000000000000000000000) (bvslt (index!11412 lt!148883) (size!7512 lt!148782)))) (or (is-Undefined!2309 lt!148883) (ite (is-Found!2309 lt!148883) (= (select (arr!7160 lt!148782) (index!11410 lt!148883)) k!2524) (ite (is-MissingZero!2309 lt!148883) (= (select (arr!7160 lt!148782) (index!11409 lt!148883)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2309 lt!148883) (= (select (arr!7160 lt!148782) (index!11412 lt!148883)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67551 (= lt!148883 e!189090)))

(declare-fun c!48348 () Bool)

(assert (=> d!67551 (= c!48348 (and (is-Intermediate!2309 lt!148885) (undefined!3121 lt!148885)))))

(assert (=> d!67551 (= lt!148885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 lt!148782 mask!3809))))

(assert (=> d!67551 (validMask!0 mask!3809)))

(assert (=> d!67551 (= (seekEntryOrOpen!0 k!2524 lt!148782 mask!3809) lt!148883)))

(declare-fun b!299368 () Bool)

(assert (=> b!299368 (= e!189092 (MissingZero!2309 (index!11411 lt!148885)))))

(declare-fun b!299369 () Bool)

(assert (=> b!299369 (= e!189091 (Found!2309 (index!11411 lt!148885)))))

(assert (= (and d!67551 c!48348) b!299366))

(assert (= (and d!67551 (not c!48348)) b!299365))

(assert (= (and b!299365 c!48346) b!299369))

(assert (= (and b!299365 (not c!48346)) b!299364))

(assert (= (and b!299364 c!48347) b!299368))

(assert (= (and b!299364 (not c!48347)) b!299367))

(declare-fun m!311677 () Bool)

(assert (=> b!299365 m!311677))

(declare-fun m!311679 () Bool)

(assert (=> b!299367 m!311679))

(assert (=> d!67551 m!311579))

(declare-fun m!311681 () Bool)

(assert (=> d!67551 m!311681))

(declare-fun m!311683 () Bool)

(assert (=> d!67551 m!311683))

(assert (=> d!67551 m!311573))

(declare-fun m!311685 () Bool)

(assert (=> d!67551 m!311685))

(assert (=> d!67551 m!311573))

(declare-fun m!311687 () Bool)

(assert (=> d!67551 m!311687))

(assert (=> b!299202 d!67551))

(declare-fun b!299456 () Bool)

(declare-fun e!189144 () Unit!9329)

(declare-fun Unit!9341 () Unit!9329)

(assert (=> b!299456 (= e!189144 Unit!9341)))

(declare-fun call!25814 () SeekEntryResult!2309)

(assert (=> b!299456 (= call!25814 (Intermediate!2309 false lt!148779 (x!29652 lt!148783)))))

(declare-fun lt!148924 () Unit!9329)

(declare-fun Unit!9342 () Unit!9329)

(assert (=> b!299456 (= lt!148924 Unit!9342)))

(assert (=> b!299456 false))

(declare-fun b!299457 () Bool)

(declare-fun e!189140 () Unit!9329)

(declare-fun Unit!9343 () Unit!9329)

(assert (=> b!299457 (= e!189140 Unit!9343)))

(declare-fun call!25813 () (_ BitVec 32))

(declare-fun e!189142 () Unit!9329)

(declare-fun b!299458 () Bool)

(assert (=> b!299458 (= e!189142 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) call!25813 (index!11411 lt!148783) (x!29652 lt!148783) mask!3809))))

(declare-fun b!299459 () Bool)

(declare-fun e!189141 () Unit!9329)

(declare-fun Unit!9344 () Unit!9329)

(assert (=> b!299459 (= e!189141 Unit!9344)))

(declare-fun e!189143 () (_ BitVec 32))

(declare-fun c!48390 () Bool)

(declare-fun bm!25810 () Bool)

(assert (=> bm!25810 (= call!25814 (seekKeyOrZeroOrLongMinValue!0 (ite c!48390 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!189143 k!2524 a!3312 mask!3809))))

(declare-fun c!48389 () Bool)

(assert (=> bm!25810 (= c!48389 c!48390)))

(declare-fun b!299460 () Bool)

(assert (=> b!299460 (= c!48390 (or (= (select (arr!7160 a!3312) lt!148779) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7160 a!3312) lt!148779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!299460 (= e!189141 e!189144)))

(declare-fun bm!25811 () Bool)

(assert (=> bm!25811 (= call!25813 (nextIndex!0 lt!148779 #b00000000000000000000000000000000 mask!3809))))

(declare-fun b!299462 () Bool)

(declare-fun Unit!9347 () Unit!9329)

(assert (=> b!299462 (= e!189144 Unit!9347)))

(declare-fun c!48391 () Bool)

(assert (=> b!299462 (= c!48391 (is-Intermediate!2309 call!25814))))

(declare-fun lt!148922 () Unit!9329)

(assert (=> b!299462 (= lt!148922 e!189140)))

(assert (=> b!299462 false))

(declare-fun b!299463 () Bool)

(assert (=> b!299463 (= e!189143 lt!148779)))

(declare-fun b!299464 () Bool)

(declare-fun Unit!9348 () Unit!9329)

(assert (=> b!299464 (= e!189142 Unit!9348)))

(declare-fun c!48388 () Bool)

(assert (=> b!299464 (= c!48388 (not (= (index!11411 lt!148783) lt!148779)))))

(declare-fun lt!148926 () Unit!9329)

(assert (=> b!299464 (= lt!148926 e!189141)))

(assert (=> b!299464 (= lt!148779 (index!11411 lt!148783))))

(declare-fun lt!148925 () Unit!9329)

(declare-fun Unit!9349 () Unit!9329)

(assert (=> b!299464 (= lt!148925 Unit!9349)))

(assert (=> b!299464 (= (select (arr!7160 a!3312) lt!148779) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!299465 () Bool)

(assert (=> b!299465 (= e!189143 call!25813)))

(declare-fun b!299466 () Bool)

(assert (=> b!299466 false))

(declare-fun Unit!9350 () Unit!9329)

(assert (=> b!299466 (= e!189140 Unit!9350)))

(declare-fun d!67555 () Bool)

(declare-fun e!189139 () Bool)

(assert (=> d!67555 e!189139))

(declare-fun res!157861 () Bool)

(assert (=> d!67555 (=> (not res!157861) (not e!189139))))

(assert (=> d!67555 (= res!157861 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7512 a!3312))))))

(declare-fun lt!148923 () Unit!9329)

(assert (=> d!67555 (= lt!148923 e!189142)))

(declare-fun c!48387 () Bool)

(assert (=> d!67555 (= c!48387 (= #b00000000000000000000000000000000 (x!29652 lt!148783)))))

(assert (=> d!67555 (validMask!0 mask!3809)))

(assert (=> d!67555 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!148779 (index!11411 lt!148783) (x!29652 lt!148783) mask!3809) lt!148923)))

(declare-fun b!299461 () Bool)

(assert (=> b!299461 (= e!189139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148779 k!2524 (array!15121 (store (arr!7160 a!3312) i!1256 k!2524) (size!7512 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148779 k!2524 a!3312 mask!3809)))))

(assert (= (and d!67555 c!48387) b!299464))

(assert (= (and d!67555 (not c!48387)) b!299458))

(assert (= (and b!299464 c!48388) b!299460))

(assert (= (and b!299464 (not c!48388)) b!299459))

(assert (= (and b!299460 c!48390) b!299456))

(assert (= (and b!299460 (not c!48390)) b!299462))

(assert (= (and b!299462 c!48391) b!299457))

(assert (= (and b!299462 (not c!48391)) b!299466))

(assert (= (or b!299456 b!299462) bm!25810))

(assert (= (and bm!25810 c!48389) b!299463))

(assert (= (and bm!25810 (not c!48389)) b!299465))

(assert (= (or b!299465 b!299458) bm!25811))

(assert (= (and d!67555 res!157861) b!299461))

(assert (=> b!299461 m!311569))

(declare-fun m!311713 () Bool)

(assert (=> b!299461 m!311713))

(assert (=> b!299461 m!311571))

(declare-fun m!311715 () Bool)

(assert (=> b!299458 m!311715))

(assert (=> bm!25811 m!311649))

(assert (=> d!67555 m!311579))

(assert (=> b!299464 m!311669))

(declare-fun m!311717 () Bool)

(assert (=> bm!25810 m!311717))

(assert (=> b!299460 m!311669))

(assert (=> b!299202 d!67555))

(declare-fun d!67561 () Bool)

(declare-fun res!157867 () Bool)

(declare-fun e!189155 () Bool)

(assert (=> d!67561 (=> res!157867 e!189155)))

(assert (=> d!67561 (= res!157867 (= (select (arr!7160 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67561 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!189155)))

(declare-fun b!299482 () Bool)

(declare-fun e!189156 () Bool)

(assert (=> b!299482 (= e!189155 e!189156)))

(declare-fun res!157868 () Bool)

(assert (=> b!299482 (=> (not res!157868) (not e!189156))))

(assert (=> b!299482 (= res!157868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7512 a!3312)))))

(declare-fun b!299483 () Bool)

(assert (=> b!299483 (= e!189156 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67561 (not res!157867)) b!299482))

(assert (= (and b!299482 res!157868) b!299483))

(declare-fun m!311725 () Bool)

(assert (=> d!67561 m!311725))

(declare-fun m!311727 () Bool)

(assert (=> b!299483 m!311727))

(assert (=> b!299207 d!67561))

(declare-fun b!299493 () Bool)

(declare-fun c!48401 () Bool)

(declare-fun lt!148935 () (_ BitVec 64))

(assert (=> b!299493 (= c!48401 (= lt!148935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189163 () SeekEntryResult!2309)

(declare-fun e!189164 () SeekEntryResult!2309)

(assert (=> b!299493 (= e!189163 e!189164)))

(declare-fun b!299494 () Bool)

(declare-fun e!189162 () SeekEntryResult!2309)

(assert (=> b!299494 (= e!189162 e!189163)))

(declare-fun lt!148936 () SeekEntryResult!2309)

(assert (=> b!299494 (= lt!148935 (select (arr!7160 a!3312) (index!11411 lt!148936)))))

(declare-fun c!48400 () Bool)

(assert (=> b!299494 (= c!48400 (= lt!148935 k!2524))))

(declare-fun b!299495 () Bool)

(assert (=> b!299495 (= e!189162 Undefined!2309)))

(declare-fun b!299496 () Bool)

(assert (=> b!299496 (= e!189164 (seekKeyOrZeroReturnVacant!0 (x!29652 lt!148936) (index!11411 lt!148936) (index!11411 lt!148936) k!2524 a!3312 mask!3809))))

(declare-fun d!67565 () Bool)

(declare-fun lt!148934 () SeekEntryResult!2309)

(assert (=> d!67565 (and (or (is-Undefined!2309 lt!148934) (not (is-Found!2309 lt!148934)) (and (bvsge (index!11410 lt!148934) #b00000000000000000000000000000000) (bvslt (index!11410 lt!148934) (size!7512 a!3312)))) (or (is-Undefined!2309 lt!148934) (is-Found!2309 lt!148934) (not (is-MissingZero!2309 lt!148934)) (and (bvsge (index!11409 lt!148934) #b00000000000000000000000000000000) (bvslt (index!11409 lt!148934) (size!7512 a!3312)))) (or (is-Undefined!2309 lt!148934) (is-Found!2309 lt!148934) (is-MissingZero!2309 lt!148934) (not (is-MissingVacant!2309 lt!148934)) (and (bvsge (index!11412 lt!148934) #b00000000000000000000000000000000) (bvslt (index!11412 lt!148934) (size!7512 a!3312)))) (or (is-Undefined!2309 lt!148934) (ite (is-Found!2309 lt!148934) (= (select (arr!7160 a!3312) (index!11410 lt!148934)) k!2524) (ite (is-MissingZero!2309 lt!148934) (= (select (arr!7160 a!3312) (index!11409 lt!148934)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2309 lt!148934) (= (select (arr!7160 a!3312) (index!11412 lt!148934)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67565 (= lt!148934 e!189162)))

(declare-fun c!48402 () Bool)

(assert (=> d!67565 (= c!48402 (and (is-Intermediate!2309 lt!148936) (undefined!3121 lt!148936)))))

(assert (=> d!67565 (= lt!148936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67565 (validMask!0 mask!3809)))

(assert (=> d!67565 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148934)))

(declare-fun b!299497 () Bool)

(assert (=> b!299497 (= e!189164 (MissingZero!2309 (index!11411 lt!148936)))))

(declare-fun b!299498 () Bool)

(assert (=> b!299498 (= e!189163 (Found!2309 (index!11411 lt!148936)))))

(assert (= (and d!67565 c!48402) b!299495))

(assert (= (and d!67565 (not c!48402)) b!299494))

(assert (= (and b!299494 c!48400) b!299498))

(assert (= (and b!299494 (not c!48400)) b!299493))

(assert (= (and b!299493 c!48401) b!299497))

(assert (= (and b!299493 (not c!48401)) b!299496))

(declare-fun m!311729 () Bool)

(assert (=> b!299494 m!311729))

(declare-fun m!311731 () Bool)

(assert (=> b!299496 m!311731))

(assert (=> d!67565 m!311579))

(declare-fun m!311733 () Bool)

(assert (=> d!67565 m!311733))

(declare-fun m!311735 () Bool)

(assert (=> d!67565 m!311735))

(assert (=> d!67565 m!311573))

(declare-fun m!311737 () Bool)

(assert (=> d!67565 m!311737))

(assert (=> d!67565 m!311573))

(declare-fun m!311741 () Bool)

(assert (=> d!67565 m!311741))

(assert (=> b!299206 d!67565))

(declare-fun d!67567 () Bool)

(assert (=> d!67567 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299201 d!67567))

(declare-fun d!67571 () Bool)

(assert (=> d!67571 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29656 d!67571))

(declare-fun d!67585 () Bool)

(assert (=> d!67585 (= (array_inv!5123 a!3312) (bvsge (size!7512 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29656 d!67585))

(declare-fun b!299534 () Bool)

(declare-fun e!189189 () Bool)

(declare-fun e!189190 () Bool)

(assert (=> b!299534 (= e!189189 e!189190)))

(declare-fun lt!148959 () (_ BitVec 64))

(assert (=> b!299534 (= lt!148959 (select (arr!7160 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148958 () Unit!9329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15120 (_ BitVec 64) (_ BitVec 32)) Unit!9329)

(assert (=> b!299534 (= lt!148958 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148959 #b00000000000000000000000000000000))))

(assert (=> b!299534 (arrayContainsKey!0 a!3312 lt!148959 #b00000000000000000000000000000000)))

(declare-fun lt!148957 () Unit!9329)

(assert (=> b!299534 (= lt!148957 lt!148958)))

(declare-fun res!157887 () Bool)

(assert (=> b!299534 (= res!157887 (= (seekEntryOrOpen!0 (select (arr!7160 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2309 #b00000000000000000000000000000000)))))

(assert (=> b!299534 (=> (not res!157887) (not e!189190))))

(declare-fun b!299535 () Bool)

(declare-fun call!25819 () Bool)

(assert (=> b!299535 (= e!189190 call!25819)))

(declare-fun d!67587 () Bool)

(declare-fun res!157886 () Bool)

(declare-fun e!189188 () Bool)

(assert (=> d!67587 (=> res!157886 e!189188)))

(assert (=> d!67587 (= res!157886 (bvsge #b00000000000000000000000000000000 (size!7512 a!3312)))))

(assert (=> d!67587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189188)))

(declare-fun b!299536 () Bool)

(assert (=> b!299536 (= e!189188 e!189189)))

(declare-fun c!48414 () Bool)

(assert (=> b!299536 (= c!48414 (validKeyInArray!0 (select (arr!7160 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299537 () Bool)

(assert (=> b!299537 (= e!189189 call!25819)))

(declare-fun bm!25816 () Bool)

(assert (=> bm!25816 (= call!25819 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67587 (not res!157886)) b!299536))

(assert (= (and b!299536 c!48414) b!299534))

(assert (= (and b!299536 (not c!48414)) b!299537))

(assert (= (and b!299534 res!157887) b!299535))

(assert (= (or b!299535 b!299537) bm!25816))

(assert (=> b!299534 m!311725))

(declare-fun m!311781 () Bool)

(assert (=> b!299534 m!311781))

(declare-fun m!311783 () Bool)

(assert (=> b!299534 m!311783))

(assert (=> b!299534 m!311725))

(declare-fun m!311785 () Bool)

(assert (=> b!299534 m!311785))

(assert (=> b!299536 m!311725))

(assert (=> b!299536 m!311725))

(declare-fun m!311787 () Bool)

(assert (=> b!299536 m!311787))

(declare-fun m!311789 () Bool)

(assert (=> bm!25816 m!311789))

(assert (=> b!299205 d!67587))

(push 1)

