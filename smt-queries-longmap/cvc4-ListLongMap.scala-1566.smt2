; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29840 () Bool)

(assert start!29840)

(declare-fun b!300285 () Bool)

(declare-fun res!158319 () Bool)

(declare-fun e!189622 () Bool)

(assert (=> b!300285 (=> (not res!158319) (not e!189622))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15163 0))(
  ( (array!15164 (arr!7177 (Array (_ BitVec 32) (_ BitVec 64))) (size!7529 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15163)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!300285 (= res!158319 (and (= (size!7529 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7529 a!3312))))))

(declare-fun b!300286 () Bool)

(declare-fun res!158322 () Bool)

(assert (=> b!300286 (=> (not res!158322) (not e!189622))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300286 (= res!158322 (validKeyInArray!0 k!2524))))

(declare-datatypes ((SeekEntryResult!2326 0))(
  ( (MissingZero!2326 (index!11480 (_ BitVec 32))) (Found!2326 (index!11481 (_ BitVec 32))) (Intermediate!2326 (undefined!3138 Bool) (index!11482 (_ BitVec 32)) (x!29730 (_ BitVec 32))) (Undefined!2326) (MissingVacant!2326 (index!11483 (_ BitVec 32))) )
))
(declare-fun lt!149382 () SeekEntryResult!2326)

(declare-fun lt!149381 () SeekEntryResult!2326)

(declare-fun b!300287 () Bool)

(declare-fun lt!149378 () Bool)

(declare-fun e!189620 () Bool)

(assert (=> b!300287 (= e!189620 (and (not lt!149378) (= lt!149382 (MissingVacant!2326 i!1256)) (let ((bdg!6466 (not (is-Intermediate!2326 lt!149381)))) (and (or bdg!6466 (not (undefined!3138 lt!149381))) (or bdg!6466 (not (= (select (arr!7177 a!3312) (index!11482 lt!149381)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6466 (not (= (select (arr!7177 a!3312) (index!11482 lt!149381)) k!2524))) (not bdg!6466)))))))

(declare-fun lt!149380 () (_ BitVec 32))

(declare-fun lt!149379 () SeekEntryResult!2326)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15163 (_ BitVec 32)) SeekEntryResult!2326)

(assert (=> b!300287 (= lt!149379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149380 k!2524 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312)) mask!3809))))

(assert (=> b!300287 (= lt!149381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149380 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300287 (= lt!149380 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300288 () Bool)

(assert (=> b!300288 (= e!189622 e!189620)))

(declare-fun res!158317 () Bool)

(assert (=> b!300288 (=> (not res!158317) (not e!189620))))

(assert (=> b!300288 (= res!158317 (or lt!149378 (= lt!149382 (MissingVacant!2326 i!1256))))))

(assert (=> b!300288 (= lt!149378 (= lt!149382 (MissingZero!2326 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15163 (_ BitVec 32)) SeekEntryResult!2326)

(assert (=> b!300288 (= lt!149382 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!158318 () Bool)

(assert (=> start!29840 (=> (not res!158318) (not e!189622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29840 (= res!158318 (validMask!0 mask!3809))))

(assert (=> start!29840 e!189622))

(assert (=> start!29840 true))

(declare-fun array_inv!5140 (array!15163) Bool)

(assert (=> start!29840 (array_inv!5140 a!3312)))

(declare-fun b!300289 () Bool)

(declare-fun res!158321 () Bool)

(assert (=> b!300289 (=> (not res!158321) (not e!189620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15163 (_ BitVec 32)) Bool)

(assert (=> b!300289 (= res!158321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300290 () Bool)

(declare-fun res!158320 () Bool)

(assert (=> b!300290 (=> (not res!158320) (not e!189622))))

(declare-fun arrayContainsKey!0 (array!15163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300290 (= res!158320 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29840 res!158318) b!300285))

(assert (= (and b!300285 res!158319) b!300286))

(assert (= (and b!300286 res!158322) b!300290))

(assert (= (and b!300290 res!158320) b!300288))

(assert (= (and b!300288 res!158317) b!300289))

(assert (= (and b!300289 res!158321) b!300287))

(declare-fun m!312347 () Bool)

(assert (=> start!29840 m!312347))

(declare-fun m!312349 () Bool)

(assert (=> start!29840 m!312349))

(declare-fun m!312351 () Bool)

(assert (=> b!300286 m!312351))

(declare-fun m!312353 () Bool)

(assert (=> b!300290 m!312353))

(declare-fun m!312355 () Bool)

(assert (=> b!300287 m!312355))

(declare-fun m!312357 () Bool)

(assert (=> b!300287 m!312357))

(declare-fun m!312359 () Bool)

(assert (=> b!300287 m!312359))

(declare-fun m!312361 () Bool)

(assert (=> b!300287 m!312361))

(declare-fun m!312363 () Bool)

(assert (=> b!300287 m!312363))

(declare-fun m!312365 () Bool)

(assert (=> b!300289 m!312365))

(declare-fun m!312367 () Bool)

(assert (=> b!300288 m!312367))

(push 1)

(assert (not b!300288))

(assert (not b!300287))

(assert (not b!300286))

(assert (not b!300289))

(assert (not start!29840))

(assert (not b!300290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!300351 () Bool)

(declare-fun lt!149405 () SeekEntryResult!2326)

(assert (=> b!300351 (and (bvsge (index!11482 lt!149405) #b00000000000000000000000000000000) (bvslt (index!11482 lt!149405) (size!7529 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312)))))))

(declare-fun e!189664 () Bool)

(assert (=> b!300351 (= e!189664 (= (select (arr!7177 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312))) (index!11482 lt!149405)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67721 () Bool)

(declare-fun e!189666 () Bool)

(assert (=> d!67721 e!189666))

(declare-fun c!48595 () Bool)

(assert (=> d!67721 (= c!48595 (and (is-Intermediate!2326 lt!149405) (undefined!3138 lt!149405)))))

(declare-fun e!189663 () SeekEntryResult!2326)

(assert (=> d!67721 (= lt!149405 e!189663)))

(declare-fun c!48597 () Bool)

(assert (=> d!67721 (= c!48597 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149406 () (_ BitVec 64))

(assert (=> d!67721 (= lt!149406 (select (arr!7177 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312))) lt!149380))))

(assert (=> d!67721 (validMask!0 mask!3809)))

(assert (=> d!67721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149380 k!2524 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312)) mask!3809) lt!149405)))

(declare-fun b!300352 () Bool)

(declare-fun e!189665 () SeekEntryResult!2326)

(assert (=> b!300352 (= e!189663 e!189665)))

(declare-fun c!48596 () Bool)

(assert (=> b!300352 (= c!48596 (or (= lt!149406 k!2524) (= (bvadd lt!149406 lt!149406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300353 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300353 (= e!189665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149380 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312)) mask!3809))))

(declare-fun b!300354 () Bool)

(assert (=> b!300354 (= e!189665 (Intermediate!2326 false lt!149380 #b00000000000000000000000000000000))))

(declare-fun b!300355 () Bool)

(assert (=> b!300355 (= e!189666 (bvsge (x!29730 lt!149405) #b01111111111111111111111111111110))))

(declare-fun b!300356 () Bool)

(assert (=> b!300356 (= e!189663 (Intermediate!2326 true lt!149380 #b00000000000000000000000000000000))))

(declare-fun b!300357 () Bool)

(assert (=> b!300357 (and (bvsge (index!11482 lt!149405) #b00000000000000000000000000000000) (bvslt (index!11482 lt!149405) (size!7529 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312)))))))

(declare-fun res!158348 () Bool)

(assert (=> b!300357 (= res!158348 (= (select (arr!7177 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312))) (index!11482 lt!149405)) k!2524))))

(assert (=> b!300357 (=> res!158348 e!189664)))

(declare-fun e!189667 () Bool)

(assert (=> b!300357 (= e!189667 e!189664)))

(declare-fun b!300358 () Bool)

(assert (=> b!300358 (= e!189666 e!189667)))

(declare-fun res!158347 () Bool)

(assert (=> b!300358 (= res!158347 (and (is-Intermediate!2326 lt!149405) (not (undefined!3138 lt!149405)) (bvslt (x!29730 lt!149405) #b01111111111111111111111111111110) (bvsge (x!29730 lt!149405) #b00000000000000000000000000000000) (bvsge (x!29730 lt!149405) #b00000000000000000000000000000000)))))

(assert (=> b!300358 (=> (not res!158347) (not e!189667))))

(declare-fun b!300359 () Bool)

(assert (=> b!300359 (and (bvsge (index!11482 lt!149405) #b00000000000000000000000000000000) (bvslt (index!11482 lt!149405) (size!7529 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312)))))))

(declare-fun res!158349 () Bool)

(assert (=> b!300359 (= res!158349 (= (select (arr!7177 (array!15164 (store (arr!7177 a!3312) i!1256 k!2524) (size!7529 a!3312))) (index!11482 lt!149405)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300359 (=> res!158349 e!189664)))

(assert (= (and d!67721 c!48597) b!300356))

(assert (= (and d!67721 (not c!48597)) b!300352))

(assert (= (and b!300352 c!48596) b!300354))

(assert (= (and b!300352 (not c!48596)) b!300353))

(assert (= (and d!67721 c!48595) b!300355))

(assert (= (and d!67721 (not c!48595)) b!300358))

(assert (= (and b!300358 res!158347) b!300357))

(assert (= (and b!300357 (not res!158348)) b!300359))

(assert (= (and b!300359 (not res!158349)) b!300351))

(declare-fun m!312399 () Bool)

(assert (=> b!300353 m!312399))

(assert (=> b!300353 m!312399))

(declare-fun m!312401 () Bool)

(assert (=> b!300353 m!312401))

(declare-fun m!312403 () Bool)

(assert (=> d!67721 m!312403))

(assert (=> d!67721 m!312347))

(declare-fun m!312405 () Bool)

(assert (=> b!300359 m!312405))

(assert (=> b!300351 m!312405))

(assert (=> b!300357 m!312405))

(assert (=> b!300287 d!67721))

(declare-fun b!300360 () Bool)

(declare-fun lt!149407 () SeekEntryResult!2326)

(assert (=> b!300360 (and (bvsge (index!11482 lt!149407) #b00000000000000000000000000000000) (bvslt (index!11482 lt!149407) (size!7529 a!3312)))))

(declare-fun e!189669 () Bool)

(assert (=> b!300360 (= e!189669 (= (select (arr!7177 a!3312) (index!11482 lt!149407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67735 () Bool)

(declare-fun e!189671 () Bool)

(assert (=> d!67735 e!189671))

(declare-fun c!48598 () Bool)

(assert (=> d!67735 (= c!48598 (and (is-Intermediate!2326 lt!149407) (undefined!3138 lt!149407)))))

(declare-fun e!189668 () SeekEntryResult!2326)

(assert (=> d!67735 (= lt!149407 e!189668)))

(declare-fun c!48600 () Bool)

(assert (=> d!67735 (= c!48600 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149408 () (_ BitVec 64))

(assert (=> d!67735 (= lt!149408 (select (arr!7177 a!3312) lt!149380))))

(assert (=> d!67735 (validMask!0 mask!3809)))

(assert (=> d!67735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149380 k!2524 a!3312 mask!3809) lt!149407)))

(declare-fun b!300361 () Bool)

(declare-fun e!189670 () SeekEntryResult!2326)

(assert (=> b!300361 (= e!189668 e!189670)))

(declare-fun c!48599 () Bool)

(assert (=> b!300361 (= c!48599 (or (= lt!149408 k!2524) (= (bvadd lt!149408 lt!149408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300362 () Bool)

(assert (=> b!300362 (= e!189670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149380 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!300363 () Bool)

(assert (=> b!300363 (= e!189670 (Intermediate!2326 false lt!149380 #b00000000000000000000000000000000))))

(declare-fun b!300364 () Bool)

(assert (=> b!300364 (= e!189671 (bvsge (x!29730 lt!149407) #b01111111111111111111111111111110))))

(declare-fun b!300365 () Bool)

(assert (=> b!300365 (= e!189668 (Intermediate!2326 true lt!149380 #b00000000000000000000000000000000))))

(declare-fun b!300366 () Bool)

(assert (=> b!300366 (and (bvsge (index!11482 lt!149407) #b00000000000000000000000000000000) (bvslt (index!11482 lt!149407) (size!7529 a!3312)))))

(declare-fun res!158351 () Bool)

(assert (=> b!300366 (= res!158351 (= (select (arr!7177 a!3312) (index!11482 lt!149407)) k!2524))))

(assert (=> b!300366 (=> res!158351 e!189669)))

(declare-fun e!189672 () Bool)

(assert (=> b!300366 (= e!189672 e!189669)))

(declare-fun b!300367 () Bool)

(assert (=> b!300367 (= e!189671 e!189672)))

(declare-fun res!158350 () Bool)

(assert (=> b!300367 (= res!158350 (and (is-Intermediate!2326 lt!149407) (not (undefined!3138 lt!149407)) (bvslt (x!29730 lt!149407) #b01111111111111111111111111111110) (bvsge (x!29730 lt!149407) #b00000000000000000000000000000000) (bvsge (x!29730 lt!149407) #b00000000000000000000000000000000)))))

(assert (=> b!300367 (=> (not res!158350) (not e!189672))))

(declare-fun b!300368 () Bool)

(assert (=> b!300368 (and (bvsge (index!11482 lt!149407) #b00000000000000000000000000000000) (bvslt (index!11482 lt!149407) (size!7529 a!3312)))))

(declare-fun res!158352 () Bool)

(assert (=> b!300368 (= res!158352 (= (select (arr!7177 a!3312) (index!11482 lt!149407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300368 (=> res!158352 e!189669)))

(assert (= (and d!67735 c!48600) b!300365))

(assert (= (and d!67735 (not c!48600)) b!300361))

(assert (= (and b!300361 c!48599) b!300363))

(assert (= (and b!300361 (not c!48599)) b!300362))

(assert (= (and d!67735 c!48598) b!300364))

(assert (= (and d!67735 (not c!48598)) b!300367))

(assert (= (and b!300367 res!158350) b!300366))

(assert (= (and b!300366 (not res!158351)) b!300368))

(assert (= (and b!300368 (not res!158352)) b!300360))

(assert (=> b!300362 m!312399))

(assert (=> b!300362 m!312399))

(declare-fun m!312407 () Bool)

(assert (=> b!300362 m!312407))

(declare-fun m!312409 () Bool)

(assert (=> d!67735 m!312409))

(assert (=> d!67735 m!312347))

(declare-fun m!312411 () Bool)

(assert (=> b!300368 m!312411))

(assert (=> b!300360 m!312411))

(assert (=> b!300366 m!312411))

(assert (=> b!300287 d!67735))

(declare-fun d!67737 () Bool)

(declare-fun lt!149414 () (_ BitVec 32))

(declare-fun lt!149413 () (_ BitVec 32))

(assert (=> d!67737 (= lt!149414 (bvmul (bvxor lt!149413 (bvlshr lt!149413 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67737 (= lt!149413 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67737 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158353 (let ((h!5322 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29732 (bvmul (bvxor h!5322 (bvlshr h!5322 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29732 (bvlshr x!29732 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158353 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158353 #b00000000000000000000000000000000))))))

(assert (=> d!67737 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!149414 (bvlshr lt!149414 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300287 d!67737))

(declare-fun b!300435 () Bool)

(declare-fun e!189710 () SeekEntryResult!2326)

(declare-fun e!189709 () SeekEntryResult!2326)

(assert (=> b!300435 (= e!189710 e!189709)))

(declare-fun lt!149446 () (_ BitVec 64))

(declare-fun lt!149444 () SeekEntryResult!2326)

(assert (=> b!300435 (= lt!149446 (select (arr!7177 a!3312) (index!11482 lt!149444)))))

(declare-fun c!48629 () Bool)

(assert (=> b!300435 (= c!48629 (= lt!149446 k!2524))))

(declare-fun b!300436 () Bool)

(declare-fun e!189708 () SeekEntryResult!2326)

(assert (=> b!300436 (= e!189708 (MissingZero!2326 (index!11482 lt!149444)))))

(declare-fun b!300437 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15163 (_ BitVec 32)) SeekEntryResult!2326)

(assert (=> b!300437 (= e!189708 (seekKeyOrZeroReturnVacant!0 (x!29730 lt!149444) (index!11482 lt!149444) (index!11482 lt!149444) k!2524 a!3312 mask!3809))))

(declare-fun b!300438 () Bool)

(assert (=> b!300438 (= e!189709 (Found!2326 (index!11482 lt!149444)))))

(declare-fun d!67739 () Bool)

(declare-fun lt!149445 () SeekEntryResult!2326)

(assert (=> d!67739 (and (or (is-Undefined!2326 lt!149445) (not (is-Found!2326 lt!149445)) (and (bvsge (index!11481 lt!149445) #b00000000000000000000000000000000) (bvslt (index!11481 lt!149445) (size!7529 a!3312)))) (or (is-Undefined!2326 lt!149445) (is-Found!2326 lt!149445) (not (is-MissingZero!2326 lt!149445)) (and (bvsge (index!11480 lt!149445) #b00000000000000000000000000000000) (bvslt (index!11480 lt!149445) (size!7529 a!3312)))) (or (is-Undefined!2326 lt!149445) (is-Found!2326 lt!149445) (is-MissingZero!2326 lt!149445) (not (is-MissingVacant!2326 lt!149445)) (and (bvsge (index!11483 lt!149445) #b00000000000000000000000000000000) (bvslt (index!11483 lt!149445) (size!7529 a!3312)))) (or (is-Undefined!2326 lt!149445) (ite (is-Found!2326 lt!149445) (= (select (arr!7177 a!3312) (index!11481 lt!149445)) k!2524) (ite (is-MissingZero!2326 lt!149445) (= (select (arr!7177 a!3312) (index!11480 lt!149445)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2326 lt!149445) (= (select (arr!7177 a!3312) (index!11483 lt!149445)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67739 (= lt!149445 e!189710)))

(declare-fun c!48628 () Bool)

(assert (=> d!67739 (= c!48628 (and (is-Intermediate!2326 lt!149444) (undefined!3138 lt!149444)))))

(assert (=> d!67739 (= lt!149444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67739 (validMask!0 mask!3809)))

(assert (=> d!67739 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149445)))

(declare-fun b!300439 () Bool)

(assert (=> b!300439 (= e!189710 Undefined!2326)))

(declare-fun b!300440 () Bool)

(declare-fun c!48630 () Bool)

