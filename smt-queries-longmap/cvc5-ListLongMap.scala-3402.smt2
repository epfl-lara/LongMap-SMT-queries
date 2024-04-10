; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47004 () Bool)

(assert start!47004)

(declare-fun b!518347 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33145 0))(
  ( (array!33146 (arr!15936 (Array (_ BitVec 32) (_ BitVec 64))) (size!16300 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33145)

(declare-fun e!302438 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4403 0))(
  ( (MissingZero!4403 (index!19800 (_ BitVec 32))) (Found!4403 (index!19801 (_ BitVec 32))) (Intermediate!4403 (undefined!5215 Bool) (index!19802 (_ BitVec 32)) (x!48768 (_ BitVec 32))) (Undefined!4403) (MissingVacant!4403 (index!19803 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33145 (_ BitVec 32)) SeekEntryResult!4403)

(assert (=> b!518347 (= e!302438 (= (seekEntryOrOpen!0 (select (arr!15936 a!3235) j!176) a!3235 mask!3524) (Found!4403 j!176)))))

(declare-fun b!518348 () Bool)

(declare-fun res!317364 () Bool)

(declare-fun e!302441 () Bool)

(assert (=> b!518348 (=> (not res!317364) (not e!302441))))

(declare-datatypes ((List!10094 0))(
  ( (Nil!10091) (Cons!10090 (h!10997 (_ BitVec 64)) (t!16322 List!10094)) )
))
(declare-fun arrayNoDuplicates!0 (array!33145 (_ BitVec 32) List!10094) Bool)

(assert (=> b!518348 (= res!317364 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10091))))

(declare-fun b!518349 () Bool)

(declare-fun res!317358 () Bool)

(assert (=> b!518349 (=> (not res!317358) (not e!302441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33145 (_ BitVec 32)) Bool)

(assert (=> b!518349 (= res!317358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518350 () Bool)

(declare-fun e!302436 () Bool)

(declare-fun lt!237307 () SeekEntryResult!4403)

(assert (=> b!518350 (= e!302436 (and (bvsge (index!19802 lt!237307) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237307) (size!16300 a!3235))))))

(declare-datatypes ((Unit!16064 0))(
  ( (Unit!16065) )
))
(declare-fun lt!237302 () Unit!16064)

(declare-fun e!302440 () Unit!16064)

(assert (=> b!518350 (= lt!237302 e!302440)))

(declare-fun c!60788 () Bool)

(assert (=> b!518350 (= c!60788 (= (select (arr!15936 a!3235) (index!19802 lt!237307)) (select (arr!15936 a!3235) j!176)))))

(assert (=> b!518350 (and (bvslt (x!48768 lt!237307) #b01111111111111111111111111111110) (or (= (select (arr!15936 a!3235) (index!19802 lt!237307)) (select (arr!15936 a!3235) j!176)) (= (select (arr!15936 a!3235) (index!19802 lt!237307)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15936 a!3235) (index!19802 lt!237307)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518351 () Bool)

(declare-fun e!302442 () Bool)

(assert (=> b!518351 (= e!302442 e!302441)))

(declare-fun res!317361 () Bool)

(assert (=> b!518351 (=> (not res!317361) (not e!302441))))

(declare-fun lt!237305 () SeekEntryResult!4403)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518351 (= res!317361 (or (= lt!237305 (MissingZero!4403 i!1204)) (= lt!237305 (MissingVacant!4403 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!518351 (= lt!237305 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!317368 () Bool)

(assert (=> start!47004 (=> (not res!317368) (not e!302442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47004 (= res!317368 (validMask!0 mask!3524))))

(assert (=> start!47004 e!302442))

(assert (=> start!47004 true))

(declare-fun array_inv!11732 (array!33145) Bool)

(assert (=> start!47004 (array_inv!11732 a!3235)))

(declare-fun b!518352 () Bool)

(declare-fun res!317363 () Bool)

(assert (=> b!518352 (=> (not res!317363) (not e!302442))))

(declare-fun arrayContainsKey!0 (array!33145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518352 (= res!317363 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518353 () Bool)

(declare-fun e!302437 () Bool)

(assert (=> b!518353 (= e!302437 false)))

(declare-fun b!518354 () Bool)

(declare-fun res!317367 () Bool)

(assert (=> b!518354 (=> res!317367 e!302436)))

(assert (=> b!518354 (= res!317367 (or (undefined!5215 lt!237307) (not (is-Intermediate!4403 lt!237307))))))

(declare-fun b!518355 () Bool)

(declare-fun Unit!16066 () Unit!16064)

(assert (=> b!518355 (= e!302440 Unit!16066)))

(declare-fun b!518356 () Bool)

(declare-fun res!317360 () Bool)

(assert (=> b!518356 (=> (not res!317360) (not e!302442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518356 (= res!317360 (validKeyInArray!0 k!2280))))

(declare-fun b!518357 () Bool)

(declare-fun res!317359 () Bool)

(assert (=> b!518357 (=> (not res!317359) (not e!302442))))

(assert (=> b!518357 (= res!317359 (validKeyInArray!0 (select (arr!15936 a!3235) j!176)))))

(declare-fun b!518358 () Bool)

(assert (=> b!518358 (= e!302441 (not e!302436))))

(declare-fun res!317365 () Bool)

(assert (=> b!518358 (=> res!317365 e!302436)))

(declare-fun lt!237306 () array!33145)

(declare-fun lt!237309 () (_ BitVec 32))

(declare-fun lt!237310 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33145 (_ BitVec 32)) SeekEntryResult!4403)

(assert (=> b!518358 (= res!317365 (= lt!237307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237309 lt!237310 lt!237306 mask!3524)))))

(declare-fun lt!237308 () (_ BitVec 32))

(assert (=> b!518358 (= lt!237307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237308 (select (arr!15936 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518358 (= lt!237309 (toIndex!0 lt!237310 mask!3524))))

(assert (=> b!518358 (= lt!237310 (select (store (arr!15936 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!518358 (= lt!237308 (toIndex!0 (select (arr!15936 a!3235) j!176) mask!3524))))

(assert (=> b!518358 (= lt!237306 (array!33146 (store (arr!15936 a!3235) i!1204 k!2280) (size!16300 a!3235)))))

(assert (=> b!518358 e!302438))

(declare-fun res!317366 () Bool)

(assert (=> b!518358 (=> (not res!317366) (not e!302438))))

(assert (=> b!518358 (= res!317366 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237304 () Unit!16064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16064)

(assert (=> b!518358 (= lt!237304 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518359 () Bool)

(declare-fun res!317369 () Bool)

(assert (=> b!518359 (=> (not res!317369) (not e!302442))))

(assert (=> b!518359 (= res!317369 (and (= (size!16300 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16300 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16300 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518360 () Bool)

(declare-fun Unit!16067 () Unit!16064)

(assert (=> b!518360 (= e!302440 Unit!16067)))

(declare-fun lt!237303 () Unit!16064)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16064)

(assert (=> b!518360 (= lt!237303 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237308 #b00000000000000000000000000000000 (index!19802 lt!237307) (x!48768 lt!237307) mask!3524))))

(declare-fun res!317362 () Bool)

(assert (=> b!518360 (= res!317362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237308 lt!237310 lt!237306 mask!3524) (Intermediate!4403 false (index!19802 lt!237307) (x!48768 lt!237307))))))

(assert (=> b!518360 (=> (not res!317362) (not e!302437))))

(assert (=> b!518360 e!302437))

(assert (= (and start!47004 res!317368) b!518359))

(assert (= (and b!518359 res!317369) b!518357))

(assert (= (and b!518357 res!317359) b!518356))

(assert (= (and b!518356 res!317360) b!518352))

(assert (= (and b!518352 res!317363) b!518351))

(assert (= (and b!518351 res!317361) b!518349))

(assert (= (and b!518349 res!317358) b!518348))

(assert (= (and b!518348 res!317364) b!518358))

(assert (= (and b!518358 res!317366) b!518347))

(assert (= (and b!518358 (not res!317365)) b!518354))

(assert (= (and b!518354 (not res!317367)) b!518350))

(assert (= (and b!518350 c!60788) b!518360))

(assert (= (and b!518350 (not c!60788)) b!518355))

(assert (= (and b!518360 res!317362) b!518353))

(declare-fun m!499725 () Bool)

(assert (=> b!518349 m!499725))

(declare-fun m!499727 () Bool)

(assert (=> start!47004 m!499727))

(declare-fun m!499729 () Bool)

(assert (=> start!47004 m!499729))

(declare-fun m!499731 () Bool)

(assert (=> b!518347 m!499731))

(assert (=> b!518347 m!499731))

(declare-fun m!499733 () Bool)

(assert (=> b!518347 m!499733))

(declare-fun m!499735 () Bool)

(assert (=> b!518360 m!499735))

(declare-fun m!499737 () Bool)

(assert (=> b!518360 m!499737))

(declare-fun m!499739 () Bool)

(assert (=> b!518358 m!499739))

(declare-fun m!499741 () Bool)

(assert (=> b!518358 m!499741))

(declare-fun m!499743 () Bool)

(assert (=> b!518358 m!499743))

(declare-fun m!499745 () Bool)

(assert (=> b!518358 m!499745))

(assert (=> b!518358 m!499731))

(declare-fun m!499747 () Bool)

(assert (=> b!518358 m!499747))

(assert (=> b!518358 m!499731))

(declare-fun m!499749 () Bool)

(assert (=> b!518358 m!499749))

(assert (=> b!518358 m!499731))

(declare-fun m!499751 () Bool)

(assert (=> b!518358 m!499751))

(declare-fun m!499753 () Bool)

(assert (=> b!518358 m!499753))

(declare-fun m!499755 () Bool)

(assert (=> b!518350 m!499755))

(assert (=> b!518350 m!499731))

(assert (=> b!518357 m!499731))

(assert (=> b!518357 m!499731))

(declare-fun m!499757 () Bool)

(assert (=> b!518357 m!499757))

(declare-fun m!499759 () Bool)

(assert (=> b!518352 m!499759))

(declare-fun m!499761 () Bool)

(assert (=> b!518348 m!499761))

(declare-fun m!499763 () Bool)

(assert (=> b!518351 m!499763))

(declare-fun m!499765 () Bool)

(assert (=> b!518356 m!499765))

(push 1)

(assert (not b!518347))

(assert (not b!518348))

(assert (not b!518360))

(assert (not start!47004))

(assert (not b!518358))

(assert (not b!518357))

(assert (not b!518352))

(assert (not b!518351))

(assert (not b!518356))

(assert (not b!518349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79869 () Bool)

(assert (=> d!79869 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518356 d!79869))

(declare-fun b!518505 () Bool)

(declare-fun e!302525 () SeekEntryResult!4403)

(declare-fun lt!237393 () SeekEntryResult!4403)

(assert (=> b!518505 (= e!302525 (Found!4403 (index!19802 lt!237393)))))

(declare-fun b!518506 () Bool)

(declare-fun e!302524 () SeekEntryResult!4403)

(assert (=> b!518506 (= e!302524 e!302525)))

(declare-fun lt!237392 () (_ BitVec 64))

(assert (=> b!518506 (= lt!237392 (select (arr!15936 a!3235) (index!19802 lt!237393)))))

(declare-fun c!60818 () Bool)

(assert (=> b!518506 (= c!60818 (= lt!237392 k!2280))))

(declare-fun b!518507 () Bool)

(declare-fun e!302526 () SeekEntryResult!4403)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33145 (_ BitVec 32)) SeekEntryResult!4403)

(assert (=> b!518507 (= e!302526 (seekKeyOrZeroReturnVacant!0 (x!48768 lt!237393) (index!19802 lt!237393) (index!19802 lt!237393) k!2280 a!3235 mask!3524))))

(declare-fun d!79871 () Bool)

(declare-fun lt!237394 () SeekEntryResult!4403)

(assert (=> d!79871 (and (or (is-Undefined!4403 lt!237394) (not (is-Found!4403 lt!237394)) (and (bvsge (index!19801 lt!237394) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237394) (size!16300 a!3235)))) (or (is-Undefined!4403 lt!237394) (is-Found!4403 lt!237394) (not (is-MissingZero!4403 lt!237394)) (and (bvsge (index!19800 lt!237394) #b00000000000000000000000000000000) (bvslt (index!19800 lt!237394) (size!16300 a!3235)))) (or (is-Undefined!4403 lt!237394) (is-Found!4403 lt!237394) (is-MissingZero!4403 lt!237394) (not (is-MissingVacant!4403 lt!237394)) (and (bvsge (index!19803 lt!237394) #b00000000000000000000000000000000) (bvslt (index!19803 lt!237394) (size!16300 a!3235)))) (or (is-Undefined!4403 lt!237394) (ite (is-Found!4403 lt!237394) (= (select (arr!15936 a!3235) (index!19801 lt!237394)) k!2280) (ite (is-MissingZero!4403 lt!237394) (= (select (arr!15936 a!3235) (index!19800 lt!237394)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4403 lt!237394) (= (select (arr!15936 a!3235) (index!19803 lt!237394)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79871 (= lt!237394 e!302524)))

(declare-fun c!60817 () Bool)

(assert (=> d!79871 (= c!60817 (and (is-Intermediate!4403 lt!237393) (undefined!5215 lt!237393)))))

(assert (=> d!79871 (= lt!237393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79871 (validMask!0 mask!3524)))

(assert (=> d!79871 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237394)))

(declare-fun b!518508 () Bool)

(declare-fun c!60816 () Bool)

(assert (=> b!518508 (= c!60816 (= lt!237392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518508 (= e!302525 e!302526)))

(declare-fun b!518509 () Bool)

(assert (=> b!518509 (= e!302526 (MissingZero!4403 (index!19802 lt!237393)))))

(declare-fun b!518510 () Bool)

(assert (=> b!518510 (= e!302524 Undefined!4403)))

(assert (= (and d!79871 c!60817) b!518510))

(assert (= (and d!79871 (not c!60817)) b!518506))

(assert (= (and b!518506 c!60818) b!518505))

(assert (= (and b!518506 (not c!60818)) b!518508))

(assert (= (and b!518508 c!60816) b!518509))

(assert (= (and b!518508 (not c!60816)) b!518507))

(declare-fun m!499895 () Bool)

(assert (=> b!518506 m!499895))

(declare-fun m!499897 () Bool)

(assert (=> b!518507 m!499897))

(assert (=> d!79871 m!499727))

(declare-fun m!499899 () Bool)

(assert (=> d!79871 m!499899))

(declare-fun m!499901 () Bool)

(assert (=> d!79871 m!499901))

(declare-fun m!499903 () Bool)

(assert (=> d!79871 m!499903))

(declare-fun m!499905 () Bool)

(assert (=> d!79871 m!499905))

(declare-fun m!499907 () Bool)

(assert (=> d!79871 m!499907))

(assert (=> d!79871 m!499899))

(assert (=> b!518351 d!79871))

(declare-fun bm!31706 () Bool)

(declare-fun call!31709 () Bool)

(assert (=> bm!31706 (= call!31709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518526 () Bool)

(declare-fun e!302539 () Bool)

(assert (=> b!518526 (= e!302539 call!31709)))

(declare-fun b!518527 () Bool)

(declare-fun e!302538 () Bool)

(assert (=> b!518527 (= e!302538 call!31709)))

(declare-fun b!518529 () Bool)

(assert (=> b!518529 (= e!302538 e!302539)))

(declare-fun lt!237409 () (_ BitVec 64))

(assert (=> b!518529 (= lt!237409 (select (arr!15936 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237410 () Unit!16064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33145 (_ BitVec 64) (_ BitVec 32)) Unit!16064)

(assert (=> b!518529 (= lt!237410 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237409 #b00000000000000000000000000000000))))

(assert (=> b!518529 (arrayContainsKey!0 a!3235 lt!237409 #b00000000000000000000000000000000)))

(declare-fun lt!237408 () Unit!16064)

(assert (=> b!518529 (= lt!237408 lt!237410)))

(declare-fun res!317467 () Bool)

(assert (=> b!518529 (= res!317467 (= (seekEntryOrOpen!0 (select (arr!15936 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4403 #b00000000000000000000000000000000)))))

(assert (=> b!518529 (=> (not res!317467) (not e!302539))))

(declare-fun b!518528 () Bool)

(declare-fun e!302540 () Bool)

(assert (=> b!518528 (= e!302540 e!302538)))

(declare-fun c!60823 () Bool)

(assert (=> b!518528 (= c!60823 (validKeyInArray!0 (select (arr!15936 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79887 () Bool)

(declare-fun res!317468 () Bool)

(assert (=> d!79887 (=> res!317468 e!302540)))

(assert (=> d!79887 (= res!317468 (bvsge #b00000000000000000000000000000000 (size!16300 a!3235)))))

(assert (=> d!79887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302540)))

(assert (= (and d!79887 (not res!317468)) b!518528))

(assert (= (and b!518528 c!60823) b!518529))

(assert (= (and b!518528 (not c!60823)) b!518527))

(assert (= (and b!518529 res!317467) b!518526))

(assert (= (or b!518526 b!518527) bm!31706))

(declare-fun m!499913 () Bool)

(assert (=> bm!31706 m!499913))

(declare-fun m!499915 () Bool)

(assert (=> b!518529 m!499915))

(declare-fun m!499917 () Bool)

(assert (=> b!518529 m!499917))

(declare-fun m!499919 () Bool)

(assert (=> b!518529 m!499919))

(assert (=> b!518529 m!499915))

(declare-fun m!499921 () Bool)

(assert (=> b!518529 m!499921))

(assert (=> b!518528 m!499915))

(assert (=> b!518528 m!499915))

(declare-fun m!499923 () Bool)

(assert (=> b!518528 m!499923))

(assert (=> b!518349 d!79887))

(declare-fun d!79891 () Bool)

(declare-fun e!302561 () Bool)

(assert (=> d!79891 e!302561))

(declare-fun res!317484 () Bool)

(assert (=> d!79891 (=> (not res!317484) (not e!302561))))

(assert (=> d!79891 (= res!317484 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16300 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16300 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16300 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16300 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16300 a!3235))))))

(declare-fun lt!237425 () Unit!16064)

(declare-fun choose!47 (array!33145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16064)

(assert (=> d!79891 (= lt!237425 (choose!47 a!3235 i!1204 k!2280 j!176 lt!237308 #b00000000000000000000000000000000 (index!19802 lt!237307) (x!48768 lt!237307) mask!3524))))

(assert (=> d!79891 (validMask!0 mask!3524)))

(assert (=> d!79891 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237308 #b00000000000000000000000000000000 (index!19802 lt!237307) (x!48768 lt!237307) mask!3524) lt!237425)))

(declare-fun b!518564 () Bool)

(assert (=> b!518564 (= e!302561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237308 (select (store (arr!15936 a!3235) i!1204 k!2280) j!176) (array!33146 (store (arr!15936 a!3235) i!1204 k!2280) (size!16300 a!3235)) mask!3524) (Intermediate!4403 false (index!19802 lt!237307) (x!48768 lt!237307))))))

(assert (= (and d!79891 res!317484) b!518564))

(declare-fun m!499941 () Bool)

(assert (=> d!79891 m!499941))

(assert (=> d!79891 m!499727))

(assert (=> b!518564 m!499741))

(assert (=> b!518564 m!499745))

(assert (=> b!518564 m!499745))

(declare-fun m!499943 () Bool)

(assert (=> b!518564 m!499943))

(assert (=> b!518360 d!79891))

(declare-fun b!518650 () Bool)

(declare-fun lt!237461 () SeekEntryResult!4403)

(assert (=> b!518650 (and (bvsge (index!19802 lt!237461) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237461) (size!16300 lt!237306)))))

(declare-fun res!317522 () Bool)

(assert (=> b!518650 (= res!317522 (= (select (arr!15936 lt!237306) (index!19802 lt!237461)) lt!237310))))

(declare-fun e!302617 () Bool)

(assert (=> b!518650 (=> res!317522 e!302617)))

(declare-fun e!302616 () Bool)

(assert (=> b!518650 (= e!302616 e!302617)))

(declare-fun b!518651 () Bool)

(declare-fun e!302618 () Bool)

(assert (=> b!518651 (= e!302618 (bvsge (x!48768 lt!237461) #b01111111111111111111111111111110))))

(declare-fun b!518652 () Bool)

(assert (=> b!518652 (= e!302618 e!302616)))

(declare-fun res!317521 () Bool)

(assert (=> b!518652 (= res!317521 (and (is-Intermediate!4403 lt!237461) (not (undefined!5215 lt!237461)) (bvslt (x!48768 lt!237461) #b01111111111111111111111111111110) (bvsge (x!48768 lt!237461) #b00000000000000000000000000000000) (bvsge (x!48768 lt!237461) #b00000000000000000000000000000000)))))

(assert (=> b!518652 (=> (not res!317521) (not e!302616))))

(declare-fun b!518653 () Bool)

(declare-fun e!302619 () SeekEntryResult!4403)

(declare-fun e!302620 () SeekEntryResult!4403)

(assert (=> b!518653 (= e!302619 e!302620)))

(declare-fun c!60861 () Bool)

(declare-fun lt!237462 () (_ BitVec 64))

(assert (=> b!518653 (= c!60861 (or (= lt!237462 lt!237310) (= (bvadd lt!237462 lt!237462) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518654 () Bool)

(assert (=> b!518654 (and (bvsge (index!19802 lt!237461) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237461) (size!16300 lt!237306)))))

(assert (=> b!518654 (= e!302617 (= (select (arr!15936 lt!237306) (index!19802 lt!237461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518655 () Bool)

(assert (=> b!518655 (and (bvsge (index!19802 lt!237461) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237461) (size!16300 lt!237306)))))

(declare-fun res!317523 () Bool)

(assert (=> b!518655 (= res!317523 (= (select (arr!15936 lt!237306) (index!19802 lt!237461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518655 (=> res!317523 e!302617)))

(declare-fun b!518656 () Bool)

(assert (=> b!518656 (= e!302620 (Intermediate!4403 false lt!237308 #b00000000000000000000000000000000))))

(declare-fun d!79899 () Bool)

(assert (=> d!79899 e!302618))

(declare-fun c!60859 () Bool)

(assert (=> d!79899 (= c!60859 (and (is-Intermediate!4403 lt!237461) (undefined!5215 lt!237461)))))

(assert (=> d!79899 (= lt!237461 e!302619)))

(declare-fun c!60860 () Bool)

(assert (=> d!79899 (= c!60860 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79899 (= lt!237462 (select (arr!15936 lt!237306) lt!237308))))

(assert (=> d!79899 (validMask!0 mask!3524)))

(assert (=> d!79899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237308 lt!237310 lt!237306 mask!3524) lt!237461)))

(declare-fun b!518657 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518657 (= e!302620 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237308 #b00000000000000000000000000000000 mask!3524) lt!237310 lt!237306 mask!3524))))

(declare-fun b!518658 () Bool)

(assert (=> b!518658 (= e!302619 (Intermediate!4403 true lt!237308 #b00000000000000000000000000000000))))

(assert (= (and d!79899 c!60860) b!518658))

(assert (= (and d!79899 (not c!60860)) b!518653))

(assert (= (and b!518653 c!60861) b!518656))

(assert (= (and b!518653 (not c!60861)) b!518657))

(assert (= (and d!79899 c!60859) b!518651))

(assert (= (and d!79899 (not c!60859)) b!518652))

(assert (= (and b!518652 res!317521) b!518650))

(assert (= (and b!518650 (not res!317522)) b!518655))

(assert (= (and b!518655 (not res!317523)) b!518654))

(declare-fun m!499979 () Bool)

(assert (=> b!518657 m!499979))

(assert (=> b!518657 m!499979))

(declare-fun m!499981 () Bool)

(assert (=> b!518657 m!499981))

(declare-fun m!499983 () Bool)

(assert (=> b!518655 m!499983))

(assert (=> b!518654 m!499983))

(declare-fun m!499985 () Bool)

(assert (=> d!79899 m!499985))

(assert (=> d!79899 m!499727))

(assert (=> b!518650 m!499983))

(assert (=> b!518360 d!79899))

(declare-fun d!79919 () Bool)

(declare-fun lt!237476 () (_ BitVec 32))

(declare-fun lt!237475 () (_ BitVec 32))

(assert (=> d!79919 (= lt!237476 (bvmul (bvxor lt!237475 (bvlshr lt!237475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79919 (= lt!237475 ((_ extract 31 0) (bvand (bvxor (select (arr!15936 a!3235) j!176) (bvlshr (select (arr!15936 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79919 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317524 (let ((h!11002 ((_ extract 31 0) (bvand (bvxor (select (arr!15936 a!3235) j!176) (bvlshr (select (arr!15936 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48778 (bvmul (bvxor h!11002 (bvlshr h!11002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48778 (bvlshr x!48778 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317524 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317524 #b00000000000000000000000000000000))))))

(assert (=> d!79919 (= (toIndex!0 (select (arr!15936 a!3235) j!176) mask!3524) (bvand (bvxor lt!237476 (bvlshr lt!237476 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518358 d!79919))

(declare-fun b!518671 () Bool)

(declare-fun lt!237477 () SeekEntryResult!4403)

(assert (=> b!518671 (and (bvsge (index!19802 lt!237477) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237477) (size!16300 lt!237306)))))

(declare-fun res!317532 () Bool)

(assert (=> b!518671 (= res!317532 (= (select (arr!15936 lt!237306) (index!19802 lt!237477)) lt!237310))))

(declare-fun e!302630 () Bool)

(assert (=> b!518671 (=> res!317532 e!302630)))

(declare-fun e!302629 () Bool)

(assert (=> b!518671 (= e!302629 e!302630)))

(declare-fun b!518672 () Bool)

(declare-fun e!302631 () Bool)

(assert (=> b!518672 (= e!302631 (bvsge (x!48768 lt!237477) #b01111111111111111111111111111110))))

(declare-fun b!518673 () Bool)

(assert (=> b!518673 (= e!302631 e!302629)))

(declare-fun res!317531 () Bool)

(assert (=> b!518673 (= res!317531 (and (is-Intermediate!4403 lt!237477) (not (undefined!5215 lt!237477)) (bvslt (x!48768 lt!237477) #b01111111111111111111111111111110) (bvsge (x!48768 lt!237477) #b00000000000000000000000000000000) (bvsge (x!48768 lt!237477) #b00000000000000000000000000000000)))))

(assert (=> b!518673 (=> (not res!317531) (not e!302629))))

(declare-fun b!518674 () Bool)

(declare-fun e!302632 () SeekEntryResult!4403)

(declare-fun e!302633 () SeekEntryResult!4403)

(assert (=> b!518674 (= e!302632 e!302633)))

(declare-fun c!60867 () Bool)

(declare-fun lt!237478 () (_ BitVec 64))

(assert (=> b!518674 (= c!60867 (or (= lt!237478 lt!237310) (= (bvadd lt!237478 lt!237478) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518675 () Bool)

(assert (=> b!518675 (and (bvsge (index!19802 lt!237477) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237477) (size!16300 lt!237306)))))

(assert (=> b!518675 (= e!302630 (= (select (arr!15936 lt!237306) (index!19802 lt!237477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518676 () Bool)

(assert (=> b!518676 (and (bvsge (index!19802 lt!237477) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237477) (size!16300 lt!237306)))))

(declare-fun res!317533 () Bool)

(assert (=> b!518676 (= res!317533 (= (select (arr!15936 lt!237306) (index!19802 lt!237477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518676 (=> res!317533 e!302630)))

(declare-fun b!518677 () Bool)

(assert (=> b!518677 (= e!302633 (Intermediate!4403 false lt!237309 #b00000000000000000000000000000000))))

(declare-fun d!79925 () Bool)

(assert (=> d!79925 e!302631))

(declare-fun c!60865 () Bool)

(assert (=> d!79925 (= c!60865 (and (is-Intermediate!4403 lt!237477) (undefined!5215 lt!237477)))))

(assert (=> d!79925 (= lt!237477 e!302632)))

(declare-fun c!60866 () Bool)

(assert (=> d!79925 (= c!60866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79925 (= lt!237478 (select (arr!15936 lt!237306) lt!237309))))

(assert (=> d!79925 (validMask!0 mask!3524)))

(assert (=> d!79925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237309 lt!237310 lt!237306 mask!3524) lt!237477)))

(declare-fun b!518678 () Bool)

(assert (=> b!518678 (= e!302633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237309 #b00000000000000000000000000000000 mask!3524) lt!237310 lt!237306 mask!3524))))

(declare-fun b!518679 () Bool)

(assert (=> b!518679 (= e!302632 (Intermediate!4403 true lt!237309 #b00000000000000000000000000000000))))

(assert (= (and d!79925 c!60866) b!518679))

(assert (= (and d!79925 (not c!60866)) b!518674))

(assert (= (and b!518674 c!60867) b!518677))

(assert (= (and b!518674 (not c!60867)) b!518678))

(assert (= (and d!79925 c!60865) b!518672))

(assert (= (and d!79925 (not c!60865)) b!518673))

(assert (= (and b!518673 res!317531) b!518671))

(assert (= (and b!518671 (not res!317532)) b!518676))

(assert (= (and b!518676 (not res!317533)) b!518675))

(declare-fun m!499999 () Bool)

(assert (=> b!518678 m!499999))

(assert (=> b!518678 m!499999))

(declare-fun m!500001 () Bool)

(assert (=> b!518678 m!500001))

(declare-fun m!500003 () Bool)

(assert (=> b!518676 m!500003))

(assert (=> b!518675 m!500003))

(declare-fun m!500005 () Bool)

(assert (=> d!79925 m!500005))

(assert (=> d!79925 m!499727))

(assert (=> b!518671 m!500003))

(assert (=> b!518358 d!79925))

(declare-fun call!31717 () Bool)

(declare-fun bm!31714 () Bool)

(assert (=> bm!31714 (= call!31717 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518689 () Bool)

(declare-fun e!302640 () Bool)

(assert (=> b!518689 (= e!302640 call!31717)))

(declare-fun b!518690 () Bool)

(declare-fun e!302639 () Bool)

(assert (=> b!518690 (= e!302639 call!31717)))

(declare-fun b!518692 () Bool)

(assert (=> b!518692 (= e!302639 e!302640)))

(declare-fun lt!237482 () (_ BitVec 64))

(assert (=> b!518692 (= lt!237482 (select (arr!15936 a!3235) j!176))))

(declare-fun lt!237483 () Unit!16064)

(assert (=> b!518692 (= lt!237483 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237482 j!176))))

(assert (=> b!518692 (arrayContainsKey!0 a!3235 lt!237482 #b00000000000000000000000000000000)))

(declare-fun lt!237481 () Unit!16064)

(assert (=> b!518692 (= lt!237481 lt!237483)))

(declare-fun res!317537 () Bool)

(assert (=> b!518692 (= res!317537 (= (seekEntryOrOpen!0 (select (arr!15936 a!3235) j!176) a!3235 mask!3524) (Found!4403 j!176)))))

(assert (=> b!518692 (=> (not res!317537) (not e!302640))))

(declare-fun b!518691 () Bool)

(declare-fun e!302641 () Bool)

(assert (=> b!518691 (= e!302641 e!302639)))

(declare-fun c!60871 () Bool)

(assert (=> b!518691 (= c!60871 (validKeyInArray!0 (select (arr!15936 a!3235) j!176)))))

(declare-fun d!79929 () Bool)

(declare-fun res!317538 () Bool)

(assert (=> d!79929 (=> res!317538 e!302641)))

(assert (=> d!79929 (= res!317538 (bvsge j!176 (size!16300 a!3235)))))

(assert (=> d!79929 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302641)))

(assert (= (and d!79929 (not res!317538)) b!518691))

(assert (= (and b!518691 c!60871) b!518692))

(assert (= (and b!518691 (not c!60871)) b!518690))

(assert (= (and b!518692 res!317537) b!518689))

(assert (= (or b!518689 b!518690) bm!31714))

(declare-fun m!500013 () Bool)

(assert (=> bm!31714 m!500013))

(assert (=> b!518692 m!499731))

(declare-fun m!500015 () Bool)

(assert (=> b!518692 m!500015))

(declare-fun m!500017 () Bool)

(assert (=> b!518692 m!500017))

(assert (=> b!518692 m!499731))

(assert (=> b!518692 m!499733))

(assert (=> b!518691 m!499731))

(assert (=> b!518691 m!499731))

(assert (=> b!518691 m!499757))

(assert (=> b!518358 d!79929))

(declare-fun d!79933 () Bool)

(assert (=> d!79933 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237486 () Unit!16064)

(declare-fun choose!38 (array!33145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16064)

(assert (=> d!79933 (= lt!237486 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79933 (validMask!0 mask!3524)))

(assert (=> d!79933 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237486)))

(declare-fun bs!16362 () Bool)

(assert (= bs!16362 d!79933))

(assert (=> bs!16362 m!499751))

(declare-fun m!500019 () Bool)

(assert (=> bs!16362 m!500019))

(assert (=> bs!16362 m!499727))

(assert (=> b!518358 d!79933))

(declare-fun d!79935 () Bool)

(declare-fun lt!237488 () (_ BitVec 32))

(declare-fun lt!237487 () (_ BitVec 32))

(assert (=> d!79935 (= lt!237488 (bvmul (bvxor lt!237487 (bvlshr lt!237487 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79935 (= lt!237487 ((_ extract 31 0) (bvand (bvxor lt!237310 (bvlshr lt!237310 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79935 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317524 (let ((h!11002 ((_ extract 31 0) (bvand (bvxor lt!237310 (bvlshr lt!237310 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48778 (bvmul (bvxor h!11002 (bvlshr h!11002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48778 (bvlshr x!48778 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317524 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317524 #b00000000000000000000000000000000))))))

(assert (=> d!79935 (= (toIndex!0 lt!237310 mask!3524) (bvand (bvxor lt!237488 (bvlshr lt!237488 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518358 d!79935))

(declare-fun b!518693 () Bool)

(declare-fun lt!237489 () SeekEntryResult!4403)

(assert (=> b!518693 (and (bvsge (index!19802 lt!237489) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237489) (size!16300 a!3235)))))

(declare-fun res!317540 () Bool)

(assert (=> b!518693 (= res!317540 (= (select (arr!15936 a!3235) (index!19802 lt!237489)) (select (arr!15936 a!3235) j!176)))))

(declare-fun e!302643 () Bool)

(assert (=> b!518693 (=> res!317540 e!302643)))

(declare-fun e!302642 () Bool)

(assert (=> b!518693 (= e!302642 e!302643)))

(declare-fun b!518694 () Bool)

(declare-fun e!302644 () Bool)

(assert (=> b!518694 (= e!302644 (bvsge (x!48768 lt!237489) #b01111111111111111111111111111110))))

(declare-fun b!518695 () Bool)

(assert (=> b!518695 (= e!302644 e!302642)))

(declare-fun res!317539 () Bool)

(assert (=> b!518695 (= res!317539 (and (is-Intermediate!4403 lt!237489) (not (undefined!5215 lt!237489)) (bvslt (x!48768 lt!237489) #b01111111111111111111111111111110) (bvsge (x!48768 lt!237489) #b00000000000000000000000000000000) (bvsge (x!48768 lt!237489) #b00000000000000000000000000000000)))))

(assert (=> b!518695 (=> (not res!317539) (not e!302642))))

(declare-fun b!518696 () Bool)

(declare-fun e!302645 () SeekEntryResult!4403)

(declare-fun e!302646 () SeekEntryResult!4403)

(assert (=> b!518696 (= e!302645 e!302646)))

(declare-fun lt!237490 () (_ BitVec 64))

(declare-fun c!60874 () Bool)

(assert (=> b!518696 (= c!60874 (or (= lt!237490 (select (arr!15936 a!3235) j!176)) (= (bvadd lt!237490 lt!237490) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518697 () Bool)

(assert (=> b!518697 (and (bvsge (index!19802 lt!237489) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237489) (size!16300 a!3235)))))

(assert (=> b!518697 (= e!302643 (= (select (arr!15936 a!3235) (index!19802 lt!237489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518698 () Bool)

(assert (=> b!518698 (and (bvsge (index!19802 lt!237489) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237489) (size!16300 a!3235)))))

(declare-fun res!317541 () Bool)

(assert (=> b!518698 (= res!317541 (= (select (arr!15936 a!3235) (index!19802 lt!237489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518698 (=> res!317541 e!302643)))

(declare-fun b!518699 () Bool)

(assert (=> b!518699 (= e!302646 (Intermediate!4403 false lt!237308 #b00000000000000000000000000000000))))

(declare-fun d!79937 () Bool)

(assert (=> d!79937 e!302644))

(declare-fun c!60872 () Bool)

(assert (=> d!79937 (= c!60872 (and (is-Intermediate!4403 lt!237489) (undefined!5215 lt!237489)))))

(assert (=> d!79937 (= lt!237489 e!302645)))

(declare-fun c!60873 () Bool)

(assert (=> d!79937 (= c!60873 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79937 (= lt!237490 (select (arr!15936 a!3235) lt!237308))))

(assert (=> d!79937 (validMask!0 mask!3524)))

(assert (=> d!79937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237308 (select (arr!15936 a!3235) j!176) a!3235 mask!3524) lt!237489)))

(declare-fun b!518700 () Bool)

(assert (=> b!518700 (= e!302646 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237308 #b00000000000000000000000000000000 mask!3524) (select (arr!15936 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518701 () Bool)

(assert (=> b!518701 (= e!302645 (Intermediate!4403 true lt!237308 #b00000000000000000000000000000000))))

(assert (= (and d!79937 c!60873) b!518701))

(assert (= (and d!79937 (not c!60873)) b!518696))

(assert (= (and b!518696 c!60874) b!518699))

(assert (= (and b!518696 (not c!60874)) b!518700))

(assert (= (and d!79937 c!60872) b!518694))

(assert (= (and d!79937 (not c!60872)) b!518695))

(assert (= (and b!518695 res!317539) b!518693))

(assert (= (and b!518693 (not res!317540)) b!518698))

(assert (= (and b!518698 (not res!317541)) b!518697))

(assert (=> b!518700 m!499979))

(assert (=> b!518700 m!499979))

(assert (=> b!518700 m!499731))

(declare-fun m!500021 () Bool)

(assert (=> b!518700 m!500021))

(declare-fun m!500023 () Bool)

(assert (=> b!518698 m!500023))

(assert (=> b!518697 m!500023))

(declare-fun m!500025 () Bool)

(assert (=> d!79937 m!500025))

(assert (=> d!79937 m!499727))

(assert (=> b!518693 m!500023))

(assert (=> b!518358 d!79937))

(declare-fun b!518712 () Bool)

(declare-fun e!302655 () Bool)

(declare-fun e!302657 () Bool)

(assert (=> b!518712 (= e!302655 e!302657)))

(declare-fun res!317550 () Bool)

(assert (=> b!518712 (=> (not res!317550) (not e!302657))))

(declare-fun e!302658 () Bool)

(assert (=> b!518712 (= res!317550 (not e!302658))))

(declare-fun res!317548 () Bool)

(assert (=> b!518712 (=> (not res!317548) (not e!302658))))

(assert (=> b!518712 (= res!317548 (validKeyInArray!0 (select (arr!15936 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518713 () Bool)

(declare-fun contains!2750 (List!10094 (_ BitVec 64)) Bool)

(assert (=> b!518713 (= e!302658 (contains!2750 Nil!10091 (select (arr!15936 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79939 () Bool)

(declare-fun res!317549 () Bool)

(assert (=> d!79939 (=> res!317549 e!302655)))

(assert (=> d!79939 (= res!317549 (bvsge #b00000000000000000000000000000000 (size!16300 a!3235)))))

(assert (=> d!79939 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10091) e!302655)))

(declare-fun bm!31717 () Bool)

(declare-fun call!31720 () Bool)

(declare-fun c!60877 () Bool)

(assert (=> bm!31717 (= call!31720 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60877 (Cons!10090 (select (arr!15936 a!3235) #b00000000000000000000000000000000) Nil!10091) Nil!10091)))))

(declare-fun b!518714 () Bool)

(declare-fun e!302656 () Bool)

(assert (=> b!518714 (= e!302657 e!302656)))

(assert (=> b!518714 (= c!60877 (validKeyInArray!0 (select (arr!15936 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518715 () Bool)

(assert (=> b!518715 (= e!302656 call!31720)))

(declare-fun b!518716 () Bool)

(assert (=> b!518716 (= e!302656 call!31720)))

(assert (= (and d!79939 (not res!317549)) b!518712))

(assert (= (and b!518712 res!317548) b!518713))

(assert (= (and b!518712 res!317550) b!518714))

(assert (= (and b!518714 c!60877) b!518715))

(assert (= (and b!518714 (not c!60877)) b!518716))

(assert (= (or b!518715 b!518716) bm!31717))

(assert (=> b!518712 m!499915))

(assert (=> b!518712 m!499915))

(assert (=> b!518712 m!499923))

(assert (=> b!518713 m!499915))

(assert (=> b!518713 m!499915))

(declare-fun m!500027 () Bool)

(assert (=> b!518713 m!500027))

(assert (=> bm!31717 m!499915))

(declare-fun m!500029 () Bool)

(assert (=> bm!31717 m!500029))

(assert (=> b!518714 m!499915))

(assert (=> b!518714 m!499915))

(assert (=> b!518714 m!499923))

(assert (=> b!518348 d!79939))

(declare-fun d!79941 () Bool)

(assert (=> d!79941 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47004 d!79941))

(declare-fun d!79945 () Bool)

(assert (=> d!79945 (= (array_inv!11732 a!3235) (bvsge (size!16300 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47004 d!79945))

(declare-fun d!79947 () Bool)

(assert (=> d!79947 (= (validKeyInArray!0 (select (arr!15936 a!3235) j!176)) (and (not (= (select (arr!15936 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15936 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518357 d!79947))

(declare-fun d!79949 () Bool)

(declare-fun res!317555 () Bool)

(declare-fun e!302672 () Bool)

(assert (=> d!79949 (=> res!317555 e!302672)))

(assert (=> d!79949 (= res!317555 (= (select (arr!15936 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79949 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!302672)))

(declare-fun b!518739 () Bool)

(declare-fun e!302673 () Bool)

(assert (=> b!518739 (= e!302672 e!302673)))

(declare-fun res!317556 () Bool)

(assert (=> b!518739 (=> (not res!317556) (not e!302673))))

(assert (=> b!518739 (= res!317556 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16300 a!3235)))))

(declare-fun b!518740 () Bool)

(assert (=> b!518740 (= e!302673 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79949 (not res!317555)) b!518739))

(assert (= (and b!518739 res!317556) b!518740))

(assert (=> d!79949 m!499915))

(declare-fun m!500043 () Bool)

(assert (=> b!518740 m!500043))

(assert (=> b!518352 d!79949))

(declare-fun b!518741 () Bool)

(declare-fun e!302675 () SeekEntryResult!4403)

(declare-fun lt!237501 () SeekEntryResult!4403)

(assert (=> b!518741 (= e!302675 (Found!4403 (index!19802 lt!237501)))))

(declare-fun b!518742 () Bool)

(declare-fun e!302674 () SeekEntryResult!4403)

(assert (=> b!518742 (= e!302674 e!302675)))

(declare-fun lt!237500 () (_ BitVec 64))

(assert (=> b!518742 (= lt!237500 (select (arr!15936 a!3235) (index!19802 lt!237501)))))

(declare-fun c!60889 () Bool)

(assert (=> b!518742 (= c!60889 (= lt!237500 (select (arr!15936 a!3235) j!176)))))

(declare-fun e!302676 () SeekEntryResult!4403)

(declare-fun b!518743 () Bool)

(assert (=> b!518743 (= e!302676 (seekKeyOrZeroReturnVacant!0 (x!48768 lt!237501) (index!19802 lt!237501) (index!19802 lt!237501) (select (arr!15936 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79951 () Bool)

(declare-fun lt!237502 () SeekEntryResult!4403)

(assert (=> d!79951 (and (or (is-Undefined!4403 lt!237502) (not (is-Found!4403 lt!237502)) (and (bvsge (index!19801 lt!237502) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237502) (size!16300 a!3235)))) (or (is-Undefined!4403 lt!237502) (is-Found!4403 lt!237502) (not (is-MissingZero!4403 lt!237502)) (and (bvsge (index!19800 lt!237502) #b00000000000000000000000000000000) (bvslt (index!19800 lt!237502) (size!16300 a!3235)))) (or (is-Undefined!4403 lt!237502) (is-Found!4403 lt!237502) (is-MissingZero!4403 lt!237502) (not (is-MissingVacant!4403 lt!237502)) (and (bvsge (index!19803 lt!237502) #b00000000000000000000000000000000) (bvslt (index!19803 lt!237502) (size!16300 a!3235)))) (or (is-Undefined!4403 lt!237502) (ite (is-Found!4403 lt!237502) (= (select (arr!15936 a!3235) (index!19801 lt!237502)) (select (arr!15936 a!3235) j!176)) (ite (is-MissingZero!4403 lt!237502) (= (select (arr!15936 a!3235) (index!19800 lt!237502)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4403 lt!237502) (= (select (arr!15936 a!3235) (index!19803 lt!237502)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79951 (= lt!237502 e!302674)))

(declare-fun c!60888 () Bool)

(assert (=> d!79951 (= c!60888 (and (is-Intermediate!4403 lt!237501) (undefined!5215 lt!237501)))))

(assert (=> d!79951 (= lt!237501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15936 a!3235) j!176) mask!3524) (select (arr!15936 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79951 (validMask!0 mask!3524)))

(assert (=> d!79951 (= (seekEntryOrOpen!0 (select (arr!15936 a!3235) j!176) a!3235 mask!3524) lt!237502)))

(declare-fun b!518744 () Bool)

(declare-fun c!60887 () Bool)

(assert (=> b!518744 (= c!60887 (= lt!237500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518744 (= e!302675 e!302676)))

(declare-fun b!518745 () Bool)

(assert (=> b!518745 (= e!302676 (MissingZero!4403 (index!19802 lt!237501)))))

(declare-fun b!518746 () Bool)

(assert (=> b!518746 (= e!302674 Undefined!4403)))

(assert (= (and d!79951 c!60888) b!518746))

(assert (= (and d!79951 (not c!60888)) b!518742))

(assert (= (and b!518742 c!60889) b!518741))

(assert (= (and b!518742 (not c!60889)) b!518744))

(assert (= (and b!518744 c!60887) b!518745))

(assert (= (and b!518744 (not c!60887)) b!518743))

(declare-fun m!500045 () Bool)

(assert (=> b!518742 m!500045))

(assert (=> b!518743 m!499731))

(declare-fun m!500047 () Bool)

(assert (=> b!518743 m!500047))

(assert (=> d!79951 m!499727))

(assert (=> d!79951 m!499749))

(assert (=> d!79951 m!499731))

(declare-fun m!500049 () Bool)

(assert (=> d!79951 m!500049))

(declare-fun m!500051 () Bool)

(assert (=> d!79951 m!500051))

(declare-fun m!500053 () Bool)

(assert (=> d!79951 m!500053))

(declare-fun m!500055 () Bool)

(assert (=> d!79951 m!500055))

(assert (=> d!79951 m!499731))

(assert (=> d!79951 m!499749))

(assert (=> b!518347 d!79951))

(push 1)

(assert (not b!518700))

(assert (not d!79925))

(assert (not bm!31714))

(assert (not b!518740))

(assert (not b!518678))

(assert (not b!518529))

(assert (not b!518712))

(assert (not b!518657))

(assert (not d!79891))

(assert (not bm!31717))

(assert (not b!518713))

(assert (not d!79933))

(assert (not b!518692))

(assert (not b!518743))

(assert (not bm!31706))

(assert (not b!518691))

(assert (not b!518528))

(assert (not d!79871))

(assert (not d!79937))

(assert (not b!518564))

(assert (not b!518507))

(assert (not d!79951))

(assert (not d!79899))

(assert (not b!518714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

