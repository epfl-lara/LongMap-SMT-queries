; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29198 () Bool)

(assert start!29198)

(declare-fun b!296326 () Bool)

(declare-fun res!156138 () Bool)

(declare-fun e!187289 () Bool)

(assert (=> b!296326 (=> (not res!156138) (not e!187289))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296326 (= res!156138 (validKeyInArray!0 k!2524))))

(declare-fun res!156141 () Bool)

(assert (=> start!29198 (=> (not res!156141) (not e!187289))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29198 (= res!156141 (validMask!0 mask!3809))))

(assert (=> start!29198 e!187289))

(assert (=> start!29198 true))

(declare-datatypes ((array!15001 0))(
  ( (array!15002 (arr!7111 (Array (_ BitVec 32) (_ BitVec 64))) (size!7463 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15001)

(declare-fun array_inv!5074 (array!15001) Bool)

(assert (=> start!29198 (array_inv!5074 a!3312)))

(declare-fun b!296327 () Bool)

(declare-fun res!156136 () Bool)

(declare-fun e!187291 () Bool)

(assert (=> b!296327 (=> (not res!156136) (not e!187291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15001 (_ BitVec 32)) Bool)

(assert (=> b!296327 (= res!156136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296328 () Bool)

(declare-fun e!187287 () Bool)

(assert (=> b!296328 (= e!187291 e!187287)))

(declare-fun res!156137 () Bool)

(assert (=> b!296328 (=> (not res!156137) (not e!187287))))

(declare-fun lt!147133 () Bool)

(assert (=> b!296328 (= res!156137 lt!147133)))

(declare-fun lt!147131 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2260 0))(
  ( (MissingZero!2260 (index!11210 (_ BitVec 32))) (Found!2260 (index!11211 (_ BitVec 32))) (Intermediate!2260 (undefined!3072 Bool) (index!11212 (_ BitVec 32)) (x!29416 (_ BitVec 32))) (Undefined!2260) (MissingVacant!2260 (index!11213 (_ BitVec 32))) )
))
(declare-fun lt!147132 () SeekEntryResult!2260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15001 (_ BitVec 32)) SeekEntryResult!2260)

(assert (=> b!296328 (= lt!147132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147131 k!2524 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312)) mask!3809))))

(declare-fun lt!147134 () SeekEntryResult!2260)

(assert (=> b!296328 (= lt!147134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147131 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296328 (= lt!147131 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296329 () Bool)

(declare-fun res!156140 () Bool)

(assert (=> b!296329 (=> (not res!156140) (not e!187289))))

(declare-fun arrayContainsKey!0 (array!15001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296329 (= res!156140 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296330 () Bool)

(declare-fun e!187290 () Bool)

(assert (=> b!296330 (= e!187290 (not (or (not (= lt!147134 (Intermediate!2260 false (index!11212 lt!147134) (x!29416 lt!147134)))) (bvsle #b00000000000000000000000000000000 (x!29416 lt!147134)))))))

(assert (=> b!296330 (and (= (select (arr!7111 a!3312) (index!11212 lt!147134)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11212 lt!147134) i!1256))))

(declare-fun b!296331 () Bool)

(assert (=> b!296331 (= e!187287 e!187290)))

(declare-fun res!156139 () Bool)

(assert (=> b!296331 (=> (not res!156139) (not e!187290))))

(declare-fun lt!147135 () Bool)

(assert (=> b!296331 (= res!156139 (and (or lt!147135 (not (undefined!3072 lt!147134))) (or lt!147135 (not (= (select (arr!7111 a!3312) (index!11212 lt!147134)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147135 (not (= (select (arr!7111 a!3312) (index!11212 lt!147134)) k!2524))) (not lt!147135)))))

(assert (=> b!296331 (= lt!147135 (not (is-Intermediate!2260 lt!147134)))))

(declare-fun b!296332 () Bool)

(declare-fun res!156134 () Bool)

(assert (=> b!296332 (=> (not res!156134) (not e!187289))))

(assert (=> b!296332 (= res!156134 (and (= (size!7463 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7463 a!3312))))))

(declare-fun b!296333 () Bool)

(assert (=> b!296333 (= e!187289 e!187291)))

(declare-fun res!156135 () Bool)

(assert (=> b!296333 (=> (not res!156135) (not e!187291))))

(declare-fun lt!147130 () SeekEntryResult!2260)

(assert (=> b!296333 (= res!156135 (or lt!147133 (= lt!147130 (MissingVacant!2260 i!1256))))))

(assert (=> b!296333 (= lt!147133 (= lt!147130 (MissingZero!2260 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15001 (_ BitVec 32)) SeekEntryResult!2260)

(assert (=> b!296333 (= lt!147130 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29198 res!156141) b!296332))

(assert (= (and b!296332 res!156134) b!296326))

(assert (= (and b!296326 res!156138) b!296329))

(assert (= (and b!296329 res!156140) b!296333))

(assert (= (and b!296333 res!156135) b!296327))

(assert (= (and b!296327 res!156136) b!296328))

(assert (= (and b!296328 res!156137) b!296331))

(assert (= (and b!296331 res!156139) b!296330))

(declare-fun m!309359 () Bool)

(assert (=> b!296331 m!309359))

(declare-fun m!309361 () Bool)

(assert (=> b!296326 m!309361))

(assert (=> b!296330 m!309359))

(declare-fun m!309363 () Bool)

(assert (=> b!296328 m!309363))

(declare-fun m!309365 () Bool)

(assert (=> b!296328 m!309365))

(declare-fun m!309367 () Bool)

(assert (=> b!296328 m!309367))

(declare-fun m!309369 () Bool)

(assert (=> b!296328 m!309369))

(declare-fun m!309371 () Bool)

(assert (=> b!296333 m!309371))

(declare-fun m!309373 () Bool)

(assert (=> start!29198 m!309373))

(declare-fun m!309375 () Bool)

(assert (=> start!29198 m!309375))

(declare-fun m!309377 () Bool)

(assert (=> b!296329 m!309377))

(declare-fun m!309379 () Bool)

(assert (=> b!296327 m!309379))

(push 1)

(assert (not start!29198))

(assert (not b!296329))

(assert (not b!296326))

(assert (not b!296327))

(assert (not b!296328))

(assert (not b!296333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!296408 () Bool)

(declare-fun e!187341 () SeekEntryResult!2260)

(declare-fun e!187339 () SeekEntryResult!2260)

(assert (=> b!296408 (= e!187341 e!187339)))

(declare-fun c!47697 () Bool)

(declare-fun lt!147169 () (_ BitVec 64))

(assert (=> b!296408 (= c!47697 (or (= lt!147169 k!2524) (= (bvadd lt!147169 lt!147169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67045 () Bool)

(declare-fun e!187337 () Bool)

(assert (=> d!67045 e!187337))

(declare-fun c!47699 () Bool)

(declare-fun lt!147170 () SeekEntryResult!2260)

(assert (=> d!67045 (= c!47699 (and (is-Intermediate!2260 lt!147170) (undefined!3072 lt!147170)))))

(assert (=> d!67045 (= lt!147170 e!187341)))

(declare-fun c!47698 () Bool)

(assert (=> d!67045 (= c!47698 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67045 (= lt!147169 (select (arr!7111 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312))) lt!147131))))

(assert (=> d!67045 (validMask!0 mask!3809)))

(assert (=> d!67045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147131 k!2524 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312)) mask!3809) lt!147170)))

(declare-fun b!296409 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296409 (= e!187339 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147131 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312)) mask!3809))))

(declare-fun b!296410 () Bool)

(assert (=> b!296410 (and (bvsge (index!11212 lt!147170) #b00000000000000000000000000000000) (bvslt (index!11212 lt!147170) (size!7463 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312)))))))

(declare-fun res!156172 () Bool)

(assert (=> b!296410 (= res!156172 (= (select (arr!7111 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312))) (index!11212 lt!147170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187338 () Bool)

(assert (=> b!296410 (=> res!156172 e!187338)))

(declare-fun b!296411 () Bool)

(declare-fun e!187340 () Bool)

(assert (=> b!296411 (= e!187337 e!187340)))

(declare-fun res!156173 () Bool)

(assert (=> b!296411 (= res!156173 (and (is-Intermediate!2260 lt!147170) (not (undefined!3072 lt!147170)) (bvslt (x!29416 lt!147170) #b01111111111111111111111111111110) (bvsge (x!29416 lt!147170) #b00000000000000000000000000000000) (bvsge (x!29416 lt!147170) #b00000000000000000000000000000000)))))

(assert (=> b!296411 (=> (not res!156173) (not e!187340))))

(declare-fun b!296412 () Bool)

(assert (=> b!296412 (= e!187341 (Intermediate!2260 true lt!147131 #b00000000000000000000000000000000))))

(declare-fun b!296413 () Bool)

(assert (=> b!296413 (and (bvsge (index!11212 lt!147170) #b00000000000000000000000000000000) (bvslt (index!11212 lt!147170) (size!7463 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312)))))))

(declare-fun res!156171 () Bool)

(assert (=> b!296413 (= res!156171 (= (select (arr!7111 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312))) (index!11212 lt!147170)) k!2524))))

(assert (=> b!296413 (=> res!156171 e!187338)))

(assert (=> b!296413 (= e!187340 e!187338)))

(declare-fun b!296414 () Bool)

(assert (=> b!296414 (= e!187337 (bvsge (x!29416 lt!147170) #b01111111111111111111111111111110))))

(declare-fun b!296415 () Bool)

(assert (=> b!296415 (= e!187339 (Intermediate!2260 false lt!147131 #b00000000000000000000000000000000))))

(declare-fun b!296416 () Bool)

(assert (=> b!296416 (and (bvsge (index!11212 lt!147170) #b00000000000000000000000000000000) (bvslt (index!11212 lt!147170) (size!7463 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312)))))))

(assert (=> b!296416 (= e!187338 (= (select (arr!7111 (array!15002 (store (arr!7111 a!3312) i!1256 k!2524) (size!7463 a!3312))) (index!11212 lt!147170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67045 c!47698) b!296412))

(assert (= (and d!67045 (not c!47698)) b!296408))

(assert (= (and b!296408 c!47697) b!296415))

(assert (= (and b!296408 (not c!47697)) b!296409))

(assert (= (and d!67045 c!47699) b!296414))

(assert (= (and d!67045 (not c!47699)) b!296411))

(assert (= (and b!296411 res!156173) b!296413))

(assert (= (and b!296413 (not res!156171)) b!296410))

(assert (= (and b!296410 (not res!156172)) b!296416))

(declare-fun m!309407 () Bool)

(assert (=> b!296410 m!309407))

(declare-fun m!309409 () Bool)

(assert (=> b!296409 m!309409))

(assert (=> b!296409 m!309409))

(declare-fun m!309411 () Bool)

(assert (=> b!296409 m!309411))

(assert (=> b!296413 m!309407))

(assert (=> b!296416 m!309407))

(declare-fun m!309413 () Bool)

(assert (=> d!67045 m!309413))

(assert (=> d!67045 m!309373))

(assert (=> b!296328 d!67045))

(declare-fun b!296417 () Bool)

(declare-fun e!187346 () SeekEntryResult!2260)

(declare-fun e!187344 () SeekEntryResult!2260)

(assert (=> b!296417 (= e!187346 e!187344)))

(declare-fun c!47700 () Bool)

(declare-fun lt!147171 () (_ BitVec 64))

(assert (=> b!296417 (= c!47700 (or (= lt!147171 k!2524) (= (bvadd lt!147171 lt!147171) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67061 () Bool)

(declare-fun e!187342 () Bool)

(assert (=> d!67061 e!187342))

(declare-fun c!47702 () Bool)

(declare-fun lt!147172 () SeekEntryResult!2260)

(assert (=> d!67061 (= c!47702 (and (is-Intermediate!2260 lt!147172) (undefined!3072 lt!147172)))))

(assert (=> d!67061 (= lt!147172 e!187346)))

(declare-fun c!47701 () Bool)

(assert (=> d!67061 (= c!47701 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67061 (= lt!147171 (select (arr!7111 a!3312) lt!147131))))

(assert (=> d!67061 (validMask!0 mask!3809)))

(assert (=> d!67061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147131 k!2524 a!3312 mask!3809) lt!147172)))

(declare-fun b!296418 () Bool)

(assert (=> b!296418 (= e!187344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147131 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!296419 () Bool)

(assert (=> b!296419 (and (bvsge (index!11212 lt!147172) #b00000000000000000000000000000000) (bvslt (index!11212 lt!147172) (size!7463 a!3312)))))

(declare-fun res!156175 () Bool)

(assert (=> b!296419 (= res!156175 (= (select (arr!7111 a!3312) (index!11212 lt!147172)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187343 () Bool)

(assert (=> b!296419 (=> res!156175 e!187343)))

(declare-fun b!296420 () Bool)

(declare-fun e!187345 () Bool)

(assert (=> b!296420 (= e!187342 e!187345)))

(declare-fun res!156176 () Bool)

(assert (=> b!296420 (= res!156176 (and (is-Intermediate!2260 lt!147172) (not (undefined!3072 lt!147172)) (bvslt (x!29416 lt!147172) #b01111111111111111111111111111110) (bvsge (x!29416 lt!147172) #b00000000000000000000000000000000) (bvsge (x!29416 lt!147172) #b00000000000000000000000000000000)))))

(assert (=> b!296420 (=> (not res!156176) (not e!187345))))

(declare-fun b!296421 () Bool)

(assert (=> b!296421 (= e!187346 (Intermediate!2260 true lt!147131 #b00000000000000000000000000000000))))

(declare-fun b!296422 () Bool)

(assert (=> b!296422 (and (bvsge (index!11212 lt!147172) #b00000000000000000000000000000000) (bvslt (index!11212 lt!147172) (size!7463 a!3312)))))

(declare-fun res!156174 () Bool)

(assert (=> b!296422 (= res!156174 (= (select (arr!7111 a!3312) (index!11212 lt!147172)) k!2524))))

(assert (=> b!296422 (=> res!156174 e!187343)))

(assert (=> b!296422 (= e!187345 e!187343)))

(declare-fun b!296423 () Bool)

(assert (=> b!296423 (= e!187342 (bvsge (x!29416 lt!147172) #b01111111111111111111111111111110))))

(declare-fun b!296424 () Bool)

(assert (=> b!296424 (= e!187344 (Intermediate!2260 false lt!147131 #b00000000000000000000000000000000))))

(declare-fun b!296425 () Bool)

(assert (=> b!296425 (and (bvsge (index!11212 lt!147172) #b00000000000000000000000000000000) (bvslt (index!11212 lt!147172) (size!7463 a!3312)))))

(assert (=> b!296425 (= e!187343 (= (select (arr!7111 a!3312) (index!11212 lt!147172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67061 c!47701) b!296421))

(assert (= (and d!67061 (not c!47701)) b!296417))

(assert (= (and b!296417 c!47700) b!296424))

(assert (= (and b!296417 (not c!47700)) b!296418))

(assert (= (and d!67061 c!47702) b!296423))

(assert (= (and d!67061 (not c!47702)) b!296420))

(assert (= (and b!296420 res!156176) b!296422))

(assert (= (and b!296422 (not res!156174)) b!296419))

(assert (= (and b!296419 (not res!156175)) b!296425))

(declare-fun m!309415 () Bool)

(assert (=> b!296419 m!309415))

(assert (=> b!296418 m!309409))

(assert (=> b!296418 m!309409))

(declare-fun m!309417 () Bool)

(assert (=> b!296418 m!309417))

(assert (=> b!296422 m!309415))

(assert (=> b!296425 m!309415))

(declare-fun m!309419 () Bool)

(assert (=> d!67061 m!309419))

(assert (=> d!67061 m!309373))

(assert (=> b!296328 d!67061))

(declare-fun d!67063 () Bool)

(declare-fun lt!147181 () (_ BitVec 32))

(declare-fun lt!147180 () (_ BitVec 32))

(assert (=> d!67063 (= lt!147181 (bvmul (bvxor lt!147180 (bvlshr lt!147180 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67063 (= lt!147180 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67063 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156179 (let ((h!5293 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29420 (bvmul (bvxor h!5293 (bvlshr h!5293 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29420 (bvlshr x!29420 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156179 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156179 #b00000000000000000000000000000000))))))

(assert (=> d!67063 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!147181 (bvlshr lt!147181 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296328 d!67063))

(declare-fun d!67069 () Bool)

(declare-fun res!156184 () Bool)

(declare-fun e!187354 () Bool)

(assert (=> d!67069 (=> res!156184 e!187354)))

(assert (=> d!67069 (= res!156184 (= (select (arr!7111 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67069 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187354)))

(declare-fun b!296434 () Bool)

(declare-fun e!187355 () Bool)

(assert (=> b!296434 (= e!187354 e!187355)))

(declare-fun res!156185 () Bool)

(assert (=> b!296434 (=> (not res!156185) (not e!187355))))

(assert (=> b!296434 (= res!156185 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7463 a!3312)))))

(declare-fun b!296435 () Bool)

(assert (=> b!296435 (= e!187355 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67069 (not res!156184)) b!296434))

(assert (= (and b!296434 res!156185) b!296435))

(declare-fun m!309433 () Bool)

(assert (=> d!67069 m!309433))

(declare-fun m!309435 () Bool)

(assert (=> b!296435 m!309435))

(assert (=> b!296329 d!67069))

(declare-fun d!67071 () Bool)

(assert (=> d!67071 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29198 d!67071))

(declare-fun d!67077 () Bool)

(assert (=> d!67077 (= (array_inv!5074 a!3312) (bvsge (size!7463 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29198 d!67077))

(declare-fun bm!25741 () Bool)

(declare-fun call!25744 () Bool)

(assert (=> bm!25741 (= call!25744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!296494 () Bool)

(declare-fun e!187393 () Bool)

(declare-fun e!187394 () Bool)

(assert (=> b!296494 (= e!187393 e!187394)))

(declare-fun c!47722 () Bool)

(assert (=> b!296494 (= c!47722 (validKeyInArray!0 (select (arr!7111 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296495 () Bool)

(declare-fun e!187391 () Bool)

(assert (=> b!296495 (= e!187394 e!187391)))

(declare-fun lt!147210 () (_ BitVec 64))

(assert (=> b!296495 (= lt!147210 (select (arr!7111 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9230 0))(
  ( (Unit!9231) )
))
(declare-fun lt!147209 () Unit!9230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15001 (_ BitVec 64) (_ BitVec 32)) Unit!9230)

(assert (=> b!296495 (= lt!147209 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147210 #b00000000000000000000000000000000))))

(assert (=> b!296495 (arrayContainsKey!0 a!3312 lt!147210 #b00000000000000000000000000000000)))

(declare-fun lt!147208 () Unit!9230)

(assert (=> b!296495 (= lt!147208 lt!147209)))

(declare-fun res!156209 () Bool)

(assert (=> b!296495 (= res!156209 (= (seekEntryOrOpen!0 (select (arr!7111 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2260 #b00000000000000000000000000000000)))))

(assert (=> b!296495 (=> (not res!156209) (not e!187391))))

(declare-fun b!296496 () Bool)

(assert (=> b!296496 (= e!187391 call!25744)))

(declare-fun d!67081 () Bool)

(declare-fun res!156210 () Bool)

(assert (=> d!67081 (=> res!156210 e!187393)))

(assert (=> d!67081 (= res!156210 (bvsge #b00000000000000000000000000000000 (size!7463 a!3312)))))

(assert (=> d!67081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187393)))

(declare-fun b!296497 () Bool)

(assert (=> b!296497 (= e!187394 call!25744)))

(assert (= (and d!67081 (not res!156210)) b!296494))

(assert (= (and b!296494 c!47722) b!296495))

(assert (= (and b!296494 (not c!47722)) b!296497))

(assert (= (and b!296495 res!156209) b!296496))

(assert (= (or b!296496 b!296497) bm!25741))

(declare-fun m!309453 () Bool)

(assert (=> bm!25741 m!309453))

(assert (=> b!296494 m!309433))

(assert (=> b!296494 m!309433))

(declare-fun m!309455 () Bool)

(assert (=> b!296494 m!309455))

(assert (=> b!296495 m!309433))

(declare-fun m!309457 () Bool)

(assert (=> b!296495 m!309457))

(declare-fun m!309459 () Bool)

(assert (=> b!296495 m!309459))

(assert (=> b!296495 m!309433))

(declare-fun m!309461 () Bool)

(assert (=> b!296495 m!309461))

(assert (=> b!296327 d!67081))

(declare-fun b!296544 () Bool)

(declare-fun e!187423 () SeekEntryResult!2260)

(declare-fun lt!147231 () SeekEntryResult!2260)

(assert (=> b!296544 (= e!187423 (MissingZero!2260 (index!11212 lt!147231)))))

(declare-fun b!296545 () Bool)

(declare-fun c!47744 () Bool)

(declare-fun lt!147230 () (_ BitVec 64))

(assert (=> b!296545 (= c!47744 (= lt!147230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187422 () SeekEntryResult!2260)

(assert (=> b!296545 (= e!187422 e!187423)))

(declare-fun b!296546 () Bool)

(declare-fun e!187421 () SeekEntryResult!2260)

(assert (=> b!296546 (= e!187421 Undefined!2260)))

(declare-fun b!296547 () Bool)

(assert (=> b!296547 (= e!187422 (Found!2260 (index!11212 lt!147231)))))

(declare-fun b!296548 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15001 (_ BitVec 32)) SeekEntryResult!2260)

(assert (=> b!296548 (= e!187423 (seekKeyOrZeroReturnVacant!0 (x!29416 lt!147231) (index!11212 lt!147231) (index!11212 lt!147231) k!2524 a!3312 mask!3809))))

(declare-fun d!67089 () Bool)

(declare-fun lt!147229 () SeekEntryResult!2260)

(assert (=> d!67089 (and (or (is-Undefined!2260 lt!147229) (not (is-Found!2260 lt!147229)) (and (bvsge (index!11211 lt!147229) #b00000000000000000000000000000000) (bvslt (index!11211 lt!147229) (size!7463 a!3312)))) (or (is-Undefined!2260 lt!147229) (is-Found!2260 lt!147229) (not (is-MissingZero!2260 lt!147229)) (and (bvsge (index!11210 lt!147229) #b00000000000000000000000000000000) (bvslt (index!11210 lt!147229) (size!7463 a!3312)))) (or (is-Undefined!2260 lt!147229) (is-Found!2260 lt!147229) (is-MissingZero!2260 lt!147229) (not (is-MissingVacant!2260 lt!147229)) (and (bvsge (index!11213 lt!147229) #b00000000000000000000000000000000) (bvslt (index!11213 lt!147229) (size!7463 a!3312)))) (or (is-Undefined!2260 lt!147229) (ite (is-Found!2260 lt!147229) (= (select (arr!7111 a!3312) (index!11211 lt!147229)) k!2524) (ite (is-MissingZero!2260 lt!147229) (= (select (arr!7111 a!3312) (index!11210 lt!147229)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2260 lt!147229) (= (select (arr!7111 a!3312) (index!11213 lt!147229)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67089 (= lt!147229 e!187421)))

(declare-fun c!47745 () Bool)

(assert (=> d!67089 (= c!47745 (and (is-Intermediate!2260 lt!147231) (undefined!3072 lt!147231)))))

(assert (=> d!67089 (= lt!147231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67089 (validMask!0 mask!3809)))

(assert (=> d!67089 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!147229)))

(declare-fun b!296549 () Bool)

(assert (=> b!296549 (= e!187421 e!187422)))

(assert (=> b!296549 (= lt!147230 (select (arr!7111 a!3312) (index!11212 lt!147231)))))

(declare-fun c!47743 () Bool)

(assert (=> b!296549 (= c!47743 (= lt!147230 k!2524))))

(assert (= (and d!67089 c!47745) b!296546))

(assert (= (and d!67089 (not c!47745)) b!296549))

(assert (= (and b!296549 c!47743) b!296547))

(assert (= (and b!296549 (not c!47743)) b!296545))

(assert (= (and b!296545 c!47744) b!296544))

(assert (= (and b!296545 (not c!47744)) b!296548))

(declare-fun m!309489 () Bool)

(assert (=> b!296548 m!309489))

(assert (=> d!67089 m!309369))

(declare-fun m!309491 () Bool)

(assert (=> d!67089 m!309491))

(declare-fun m!309493 () Bool)

(assert (=> d!67089 m!309493))

(declare-fun m!309495 () Bool)

(assert (=> d!67089 m!309495))

(assert (=> d!67089 m!309373))

(assert (=> d!67089 m!309369))

(declare-fun m!309497 () Bool)

(assert (=> d!67089 m!309497))

(declare-fun m!309499 () Bool)

(assert (=> b!296549 m!309499))

(assert (=> b!296333 d!67089))

(declare-fun d!67093 () Bool)

(assert (=> d!67093 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296326 d!67093))

(push 1)

