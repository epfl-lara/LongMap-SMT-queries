; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47302 () Bool)

(assert start!47302)

(declare-fun b!520369 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33191 0))(
  ( (array!33192 (arr!15953 (Array (_ BitVec 32) (_ BitVec 64))) (size!16317 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33191)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!303635 () Bool)

(declare-datatypes ((SeekEntryResult!4420 0))(
  ( (MissingZero!4420 (index!19880 (_ BitVec 32))) (Found!4420 (index!19881 (_ BitVec 32))) (Intermediate!4420 (undefined!5232 Bool) (index!19882 (_ BitVec 32)) (x!48861 (_ BitVec 32))) (Undefined!4420) (MissingVacant!4420 (index!19883 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33191 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!520369 (= e!303635 (= (seekEntryOrOpen!0 (select (arr!15953 a!3235) j!176) a!3235 mask!3524) (Found!4420 j!176)))))

(declare-fun b!520370 () Bool)

(declare-fun e!303634 () Bool)

(declare-fun e!303636 () Bool)

(assert (=> b!520370 (= e!303634 e!303636)))

(declare-fun res!318483 () Bool)

(assert (=> b!520370 (=> (not res!318483) (not e!303636))))

(declare-fun lt!238345 () SeekEntryResult!4420)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520370 (= res!318483 (or (= lt!238345 (MissingZero!4420 i!1204)) (= lt!238345 (MissingVacant!4420 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!520370 (= lt!238345 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!520371 () Bool)

(declare-fun res!318485 () Bool)

(assert (=> b!520371 (=> (not res!318485) (not e!303634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520371 (= res!318485 (validKeyInArray!0 k!2280))))

(declare-fun b!520373 () Bool)

(declare-fun res!318481 () Bool)

(assert (=> b!520373 (=> (not res!318481) (not e!303636))))

(declare-datatypes ((List!10111 0))(
  ( (Nil!10108) (Cons!10107 (h!11026 (_ BitVec 64)) (t!16339 List!10111)) )
))
(declare-fun arrayNoDuplicates!0 (array!33191 (_ BitVec 32) List!10111) Bool)

(assert (=> b!520373 (= res!318481 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10108))))

(declare-fun b!520374 () Bool)

(declare-fun res!318477 () Bool)

(assert (=> b!520374 (=> (not res!318477) (not e!303634))))

(assert (=> b!520374 (= res!318477 (validKeyInArray!0 (select (arr!15953 a!3235) j!176)))))

(declare-fun b!520375 () Bool)

(declare-fun e!303633 () Bool)

(declare-fun lt!238339 () SeekEntryResult!4420)

(assert (=> b!520375 (= e!303633 (and (bvsge (index!19882 lt!238339) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238339) (size!16317 a!3235))))))

(assert (=> b!520375 (and (or (= (select (arr!15953 a!3235) (index!19882 lt!238339)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15953 a!3235) (index!19882 lt!238339)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15953 a!3235) (index!19882 lt!238339)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!16132 0))(
  ( (Unit!16133) )
))
(declare-fun lt!238337 () Unit!16132)

(declare-fun e!303639 () Unit!16132)

(assert (=> b!520375 (= lt!238337 e!303639)))

(declare-fun c!61247 () Bool)

(assert (=> b!520375 (= c!61247 (= (select (arr!15953 a!3235) (index!19882 lt!238339)) (select (arr!15953 a!3235) j!176)))))

(assert (=> b!520375 (and (bvslt (x!48861 lt!238339) #b01111111111111111111111111111110) (or (= (select (arr!15953 a!3235) (index!19882 lt!238339)) (select (arr!15953 a!3235) j!176)) (= (select (arr!15953 a!3235) (index!19882 lt!238339)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15953 a!3235) (index!19882 lt!238339)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520376 () Bool)

(declare-fun res!318480 () Bool)

(assert (=> b!520376 (=> (not res!318480) (not e!303636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33191 (_ BitVec 32)) Bool)

(assert (=> b!520376 (= res!318480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520377 () Bool)

(declare-fun res!318484 () Bool)

(assert (=> b!520377 (=> res!318484 e!303633)))

(assert (=> b!520377 (= res!318484 (or (undefined!5232 lt!238339) (not (is-Intermediate!4420 lt!238339))))))

(declare-fun b!520378 () Bool)

(declare-fun e!303637 () Bool)

(assert (=> b!520378 (= e!303637 false)))

(declare-fun b!520372 () Bool)

(declare-fun Unit!16134 () Unit!16132)

(assert (=> b!520372 (= e!303639 Unit!16134)))

(declare-fun lt!238343 () (_ BitVec 32))

(declare-fun lt!238338 () Unit!16132)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16132)

(assert (=> b!520372 (= lt!238338 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238343 #b00000000000000000000000000000000 (index!19882 lt!238339) (x!48861 lt!238339) mask!3524))))

(declare-fun res!318475 () Bool)

(declare-fun lt!238342 () (_ BitVec 64))

(declare-fun lt!238341 () array!33191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33191 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!520372 (= res!318475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238343 lt!238342 lt!238341 mask!3524) (Intermediate!4420 false (index!19882 lt!238339) (x!48861 lt!238339))))))

(assert (=> b!520372 (=> (not res!318475) (not e!303637))))

(assert (=> b!520372 e!303637))

(declare-fun res!318479 () Bool)

(assert (=> start!47302 (=> (not res!318479) (not e!303634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47302 (= res!318479 (validMask!0 mask!3524))))

(assert (=> start!47302 e!303634))

(assert (=> start!47302 true))

(declare-fun array_inv!11749 (array!33191) Bool)

(assert (=> start!47302 (array_inv!11749 a!3235)))

(declare-fun b!520379 () Bool)

(declare-fun Unit!16135 () Unit!16132)

(assert (=> b!520379 (= e!303639 Unit!16135)))

(declare-fun b!520380 () Bool)

(declare-fun res!318478 () Bool)

(assert (=> b!520380 (=> (not res!318478) (not e!303634))))

(declare-fun arrayContainsKey!0 (array!33191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520380 (= res!318478 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520381 () Bool)

(assert (=> b!520381 (= e!303636 (not e!303633))))

(declare-fun res!318482 () Bool)

(assert (=> b!520381 (=> res!318482 e!303633)))

(declare-fun lt!238340 () (_ BitVec 32))

(assert (=> b!520381 (= res!318482 (= lt!238339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238340 lt!238342 lt!238341 mask!3524)))))

(assert (=> b!520381 (= lt!238339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238343 (select (arr!15953 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520381 (= lt!238340 (toIndex!0 lt!238342 mask!3524))))

(assert (=> b!520381 (= lt!238342 (select (store (arr!15953 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520381 (= lt!238343 (toIndex!0 (select (arr!15953 a!3235) j!176) mask!3524))))

(assert (=> b!520381 (= lt!238341 (array!33192 (store (arr!15953 a!3235) i!1204 k!2280) (size!16317 a!3235)))))

(assert (=> b!520381 e!303635))

(declare-fun res!318476 () Bool)

(assert (=> b!520381 (=> (not res!318476) (not e!303635))))

(assert (=> b!520381 (= res!318476 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238344 () Unit!16132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16132)

(assert (=> b!520381 (= lt!238344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520382 () Bool)

(declare-fun res!318474 () Bool)

(assert (=> b!520382 (=> (not res!318474) (not e!303634))))

(assert (=> b!520382 (= res!318474 (and (= (size!16317 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16317 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16317 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47302 res!318479) b!520382))

(assert (= (and b!520382 res!318474) b!520374))

(assert (= (and b!520374 res!318477) b!520371))

(assert (= (and b!520371 res!318485) b!520380))

(assert (= (and b!520380 res!318478) b!520370))

(assert (= (and b!520370 res!318483) b!520376))

(assert (= (and b!520376 res!318480) b!520373))

(assert (= (and b!520373 res!318481) b!520381))

(assert (= (and b!520381 res!318476) b!520369))

(assert (= (and b!520381 (not res!318482)) b!520377))

(assert (= (and b!520377 (not res!318484)) b!520375))

(assert (= (and b!520375 c!61247) b!520372))

(assert (= (and b!520375 (not c!61247)) b!520379))

(assert (= (and b!520372 res!318475) b!520378))

(declare-fun m!501375 () Bool)

(assert (=> start!47302 m!501375))

(declare-fun m!501377 () Bool)

(assert (=> start!47302 m!501377))

(declare-fun m!501379 () Bool)

(assert (=> b!520374 m!501379))

(assert (=> b!520374 m!501379))

(declare-fun m!501381 () Bool)

(assert (=> b!520374 m!501381))

(declare-fun m!501383 () Bool)

(assert (=> b!520381 m!501383))

(declare-fun m!501385 () Bool)

(assert (=> b!520381 m!501385))

(declare-fun m!501387 () Bool)

(assert (=> b!520381 m!501387))

(declare-fun m!501389 () Bool)

(assert (=> b!520381 m!501389))

(declare-fun m!501391 () Bool)

(assert (=> b!520381 m!501391))

(assert (=> b!520381 m!501379))

(declare-fun m!501393 () Bool)

(assert (=> b!520381 m!501393))

(assert (=> b!520381 m!501379))

(declare-fun m!501395 () Bool)

(assert (=> b!520381 m!501395))

(assert (=> b!520381 m!501379))

(declare-fun m!501397 () Bool)

(assert (=> b!520381 m!501397))

(declare-fun m!501399 () Bool)

(assert (=> b!520371 m!501399))

(declare-fun m!501401 () Bool)

(assert (=> b!520375 m!501401))

(assert (=> b!520375 m!501379))

(declare-fun m!501403 () Bool)

(assert (=> b!520370 m!501403))

(assert (=> b!520369 m!501379))

(assert (=> b!520369 m!501379))

(declare-fun m!501405 () Bool)

(assert (=> b!520369 m!501405))

(declare-fun m!501407 () Bool)

(assert (=> b!520376 m!501407))

(declare-fun m!501409 () Bool)

(assert (=> b!520373 m!501409))

(declare-fun m!501411 () Bool)

(assert (=> b!520372 m!501411))

(declare-fun m!501413 () Bool)

(assert (=> b!520372 m!501413))

(declare-fun m!501415 () Bool)

(assert (=> b!520380 m!501415))

(push 1)

(assert (not start!47302))

(assert (not b!520372))

(assert (not b!520373))

(assert (not b!520381))

(assert (not b!520371))

(assert (not b!520374))

(assert (not b!520380))

(assert (not b!520370))

(assert (not b!520376))

(assert (not b!520369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80295 () Bool)

(assert (=> d!80295 (= (validKeyInArray!0 (select (arr!15953 a!3235) j!176)) (and (not (= (select (arr!15953 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15953 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520374 d!80295))

(declare-fun b!520485 () Bool)

(declare-fun e!303706 () SeekEntryResult!4420)

(declare-fun lt!238387 () SeekEntryResult!4420)

(assert (=> b!520485 (= e!303706 (Found!4420 (index!19882 lt!238387)))))

(declare-fun d!80297 () Bool)

(declare-fun lt!238388 () SeekEntryResult!4420)

(assert (=> d!80297 (and (or (is-Undefined!4420 lt!238388) (not (is-Found!4420 lt!238388)) (and (bvsge (index!19881 lt!238388) #b00000000000000000000000000000000) (bvslt (index!19881 lt!238388) (size!16317 a!3235)))) (or (is-Undefined!4420 lt!238388) (is-Found!4420 lt!238388) (not (is-MissingZero!4420 lt!238388)) (and (bvsge (index!19880 lt!238388) #b00000000000000000000000000000000) (bvslt (index!19880 lt!238388) (size!16317 a!3235)))) (or (is-Undefined!4420 lt!238388) (is-Found!4420 lt!238388) (is-MissingZero!4420 lt!238388) (not (is-MissingVacant!4420 lt!238388)) (and (bvsge (index!19883 lt!238388) #b00000000000000000000000000000000) (bvslt (index!19883 lt!238388) (size!16317 a!3235)))) (or (is-Undefined!4420 lt!238388) (ite (is-Found!4420 lt!238388) (= (select (arr!15953 a!3235) (index!19881 lt!238388)) (select (arr!15953 a!3235) j!176)) (ite (is-MissingZero!4420 lt!238388) (= (select (arr!15953 a!3235) (index!19880 lt!238388)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4420 lt!238388) (= (select (arr!15953 a!3235) (index!19883 lt!238388)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303707 () SeekEntryResult!4420)

(assert (=> d!80297 (= lt!238388 e!303707)))

(declare-fun c!61282 () Bool)

(assert (=> d!80297 (= c!61282 (and (is-Intermediate!4420 lt!238387) (undefined!5232 lt!238387)))))

(assert (=> d!80297 (= lt!238387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15953 a!3235) j!176) mask!3524) (select (arr!15953 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80297 (validMask!0 mask!3524)))

(assert (=> d!80297 (= (seekEntryOrOpen!0 (select (arr!15953 a!3235) j!176) a!3235 mask!3524) lt!238388)))

(declare-fun b!520486 () Bool)

(declare-fun e!303705 () SeekEntryResult!4420)

(assert (=> b!520486 (= e!303705 (MissingZero!4420 (index!19882 lt!238387)))))

(declare-fun b!520487 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33191 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!520487 (= e!303705 (seekKeyOrZeroReturnVacant!0 (x!48861 lt!238387) (index!19882 lt!238387) (index!19882 lt!238387) (select (arr!15953 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520488 () Bool)

(assert (=> b!520488 (= e!303707 Undefined!4420)))

(declare-fun b!520489 () Bool)

(assert (=> b!520489 (= e!303707 e!303706)))

(declare-fun lt!238386 () (_ BitVec 64))

(assert (=> b!520489 (= lt!238386 (select (arr!15953 a!3235) (index!19882 lt!238387)))))

(declare-fun c!61281 () Bool)

(assert (=> b!520489 (= c!61281 (= lt!238386 (select (arr!15953 a!3235) j!176)))))

(declare-fun b!520490 () Bool)

(declare-fun c!61283 () Bool)

(assert (=> b!520490 (= c!61283 (= lt!238386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520490 (= e!303706 e!303705)))

(assert (= (and d!80297 c!61282) b!520488))

(assert (= (and d!80297 (not c!61282)) b!520489))

(assert (= (and b!520489 c!61281) b!520485))

(assert (= (and b!520489 (not c!61281)) b!520490))

(assert (= (and b!520490 c!61283) b!520486))

(assert (= (and b!520490 (not c!61283)) b!520487))

(assert (=> d!80297 m!501379))

(assert (=> d!80297 m!501393))

(declare-fun m!501457 () Bool)

(assert (=> d!80297 m!501457))

(declare-fun m!501459 () Bool)

(assert (=> d!80297 m!501459))

(assert (=> d!80297 m!501375))

(assert (=> d!80297 m!501393))

(assert (=> d!80297 m!501379))

(declare-fun m!501461 () Bool)

(assert (=> d!80297 m!501461))

(declare-fun m!501463 () Bool)

(assert (=> d!80297 m!501463))

(assert (=> b!520487 m!501379))

(declare-fun m!501465 () Bool)

(assert (=> b!520487 m!501465))

(declare-fun m!501467 () Bool)

(assert (=> b!520489 m!501467))

(assert (=> b!520369 d!80297))

(declare-fun b!520497 () Bool)

(declare-fun e!303712 () SeekEntryResult!4420)

(declare-fun lt!238393 () SeekEntryResult!4420)

(assert (=> b!520497 (= e!303712 (Found!4420 (index!19882 lt!238393)))))

(declare-fun d!80309 () Bool)

(declare-fun lt!238394 () SeekEntryResult!4420)

(assert (=> d!80309 (and (or (is-Undefined!4420 lt!238394) (not (is-Found!4420 lt!238394)) (and (bvsge (index!19881 lt!238394) #b00000000000000000000000000000000) (bvslt (index!19881 lt!238394) (size!16317 a!3235)))) (or (is-Undefined!4420 lt!238394) (is-Found!4420 lt!238394) (not (is-MissingZero!4420 lt!238394)) (and (bvsge (index!19880 lt!238394) #b00000000000000000000000000000000) (bvslt (index!19880 lt!238394) (size!16317 a!3235)))) (or (is-Undefined!4420 lt!238394) (is-Found!4420 lt!238394) (is-MissingZero!4420 lt!238394) (not (is-MissingVacant!4420 lt!238394)) (and (bvsge (index!19883 lt!238394) #b00000000000000000000000000000000) (bvslt (index!19883 lt!238394) (size!16317 a!3235)))) (or (is-Undefined!4420 lt!238394) (ite (is-Found!4420 lt!238394) (= (select (arr!15953 a!3235) (index!19881 lt!238394)) k!2280) (ite (is-MissingZero!4420 lt!238394) (= (select (arr!15953 a!3235) (index!19880 lt!238394)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4420 lt!238394) (= (select (arr!15953 a!3235) (index!19883 lt!238394)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303713 () SeekEntryResult!4420)

(assert (=> d!80309 (= lt!238394 e!303713)))

(declare-fun c!61288 () Bool)

(assert (=> d!80309 (= c!61288 (and (is-Intermediate!4420 lt!238393) (undefined!5232 lt!238393)))))

(assert (=> d!80309 (= lt!238393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80309 (validMask!0 mask!3524)))

(assert (=> d!80309 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!238394)))

(declare-fun b!520498 () Bool)

(declare-fun e!303711 () SeekEntryResult!4420)

(assert (=> b!520498 (= e!303711 (MissingZero!4420 (index!19882 lt!238393)))))

(declare-fun b!520499 () Bool)

(assert (=> b!520499 (= e!303711 (seekKeyOrZeroReturnVacant!0 (x!48861 lt!238393) (index!19882 lt!238393) (index!19882 lt!238393) k!2280 a!3235 mask!3524))))

(declare-fun b!520500 () Bool)

(assert (=> b!520500 (= e!303713 Undefined!4420)))

(declare-fun b!520501 () Bool)

(assert (=> b!520501 (= e!303713 e!303712)))

(declare-fun lt!238392 () (_ BitVec 64))

(assert (=> b!520501 (= lt!238392 (select (arr!15953 a!3235) (index!19882 lt!238393)))))

(declare-fun c!61287 () Bool)

(assert (=> b!520501 (= c!61287 (= lt!238392 k!2280))))

(declare-fun b!520502 () Bool)

(declare-fun c!61289 () Bool)

(assert (=> b!520502 (= c!61289 (= lt!238392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520502 (= e!303712 e!303711)))

(assert (= (and d!80309 c!61288) b!520500))

(assert (= (and d!80309 (not c!61288)) b!520501))

(assert (= (and b!520501 c!61287) b!520497))

(assert (= (and b!520501 (not c!61287)) b!520502))

(assert (= (and b!520502 c!61289) b!520498))

(assert (= (and b!520502 (not c!61289)) b!520499))

(declare-fun m!501469 () Bool)

(assert (=> d!80309 m!501469))

(declare-fun m!501471 () Bool)

(assert (=> d!80309 m!501471))

(declare-fun m!501473 () Bool)

(assert (=> d!80309 m!501473))

(assert (=> d!80309 m!501375))

(assert (=> d!80309 m!501469))

(declare-fun m!501475 () Bool)

(assert (=> d!80309 m!501475))

(declare-fun m!501477 () Bool)

(assert (=> d!80309 m!501477))

(declare-fun m!501479 () Bool)

(assert (=> b!520499 m!501479))

(declare-fun m!501481 () Bool)

(assert (=> b!520501 m!501481))

(assert (=> b!520370 d!80309))

(declare-fun d!80311 () Bool)

(declare-fun lt!238400 () (_ BitVec 32))

(declare-fun lt!238399 () (_ BitVec 32))

(assert (=> d!80311 (= lt!238400 (bvmul (bvxor lt!238399 (bvlshr lt!238399 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80311 (= lt!238399 ((_ extract 31 0) (bvand (bvxor (select (arr!15953 a!3235) j!176) (bvlshr (select (arr!15953 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80311 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318523 (let ((h!11028 ((_ extract 31 0) (bvand (bvxor (select (arr!15953 a!3235) j!176) (bvlshr (select (arr!15953 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48864 (bvmul (bvxor h!11028 (bvlshr h!11028 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48864 (bvlshr x!48864 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318523 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318523 #b00000000000000000000000000000000))))))

(assert (=> d!80311 (= (toIndex!0 (select (arr!15953 a!3235) j!176) mask!3524) (bvand (bvxor lt!238400 (bvlshr lt!238400 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520381 d!80311))

(declare-fun d!80315 () Bool)

(declare-fun lt!238402 () (_ BitVec 32))

(declare-fun lt!238401 () (_ BitVec 32))

(assert (=> d!80315 (= lt!238402 (bvmul (bvxor lt!238401 (bvlshr lt!238401 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80315 (= lt!238401 ((_ extract 31 0) (bvand (bvxor lt!238342 (bvlshr lt!238342 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80315 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318523 (let ((h!11028 ((_ extract 31 0) (bvand (bvxor lt!238342 (bvlshr lt!238342 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48864 (bvmul (bvxor h!11028 (bvlshr h!11028 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48864 (bvlshr x!48864 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318523 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318523 #b00000000000000000000000000000000))))))

(assert (=> d!80315 (= (toIndex!0 lt!238342 mask!3524) (bvand (bvxor lt!238402 (bvlshr lt!238402 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520381 d!80315))

(declare-fun b!520555 () Bool)

(declare-fun lt!238436 () SeekEntryResult!4420)

(assert (=> b!520555 (and (bvsge (index!19882 lt!238436) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238436) (size!16317 lt!238341)))))

(declare-fun res!318545 () Bool)

(assert (=> b!520555 (= res!318545 (= (select (arr!15953 lt!238341) (index!19882 lt!238436)) lt!238342))))

(declare-fun e!303747 () Bool)

(assert (=> b!520555 (=> res!318545 e!303747)))

(declare-fun e!303751 () Bool)

(assert (=> b!520555 (= e!303751 e!303747)))

(declare-fun d!80317 () Bool)

(declare-fun e!303748 () Bool)

(assert (=> d!80317 e!303748))

(declare-fun c!61307 () Bool)

(assert (=> d!80317 (= c!61307 (and (is-Intermediate!4420 lt!238436) (undefined!5232 lt!238436)))))

(declare-fun e!303749 () SeekEntryResult!4420)

(assert (=> d!80317 (= lt!238436 e!303749)))

(declare-fun c!61306 () Bool)

(assert (=> d!80317 (= c!61306 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238435 () (_ BitVec 64))

(assert (=> d!80317 (= lt!238435 (select (arr!15953 lt!238341) lt!238340))))

(assert (=> d!80317 (validMask!0 mask!3524)))

(assert (=> d!80317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238340 lt!238342 lt!238341 mask!3524) lt!238436)))

(declare-fun b!520556 () Bool)

(assert (=> b!520556 (and (bvsge (index!19882 lt!238436) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238436) (size!16317 lt!238341)))))

(declare-fun res!318546 () Bool)

(assert (=> b!520556 (= res!318546 (= (select (arr!15953 lt!238341) (index!19882 lt!238436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520556 (=> res!318546 e!303747)))

(declare-fun b!520557 () Bool)

(assert (=> b!520557 (= e!303748 (bvsge (x!48861 lt!238436) #b01111111111111111111111111111110))))

(declare-fun b!520558 () Bool)

(declare-fun e!303750 () SeekEntryResult!4420)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520558 (= e!303750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238340 #b00000000000000000000000000000000 mask!3524) lt!238342 lt!238341 mask!3524))))

(declare-fun b!520559 () Bool)

(assert (=> b!520559 (= e!303748 e!303751)))

(declare-fun res!318547 () Bool)

(assert (=> b!520559 (= res!318547 (and (is-Intermediate!4420 lt!238436) (not (undefined!5232 lt!238436)) (bvslt (x!48861 lt!238436) #b01111111111111111111111111111110) (bvsge (x!48861 lt!238436) #b00000000000000000000000000000000) (bvsge (x!48861 lt!238436) #b00000000000000000000000000000000)))))

(assert (=> b!520559 (=> (not res!318547) (not e!303751))))

(declare-fun b!520560 () Bool)

(assert (=> b!520560 (= e!303749 (Intermediate!4420 true lt!238340 #b00000000000000000000000000000000))))

(declare-fun b!520561 () Bool)

(assert (=> b!520561 (= e!303750 (Intermediate!4420 false lt!238340 #b00000000000000000000000000000000))))

(declare-fun b!520562 () Bool)

(assert (=> b!520562 (and (bvsge (index!19882 lt!238436) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238436) (size!16317 lt!238341)))))

(assert (=> b!520562 (= e!303747 (= (select (arr!15953 lt!238341) (index!19882 lt!238436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520563 () Bool)

(assert (=> b!520563 (= e!303749 e!303750)))

(declare-fun c!61308 () Bool)

(assert (=> b!520563 (= c!61308 (or (= lt!238435 lt!238342) (= (bvadd lt!238435 lt!238435) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80317 c!61306) b!520560))

(assert (= (and d!80317 (not c!61306)) b!520563))

(assert (= (and b!520563 c!61308) b!520561))

(assert (= (and b!520563 (not c!61308)) b!520558))

(assert (= (and d!80317 c!61307) b!520557))

(assert (= (and d!80317 (not c!61307)) b!520559))

(assert (= (and b!520559 res!318547) b!520555))

(assert (= (and b!520555 (not res!318545)) b!520556))

(assert (= (and b!520556 (not res!318546)) b!520562))

(declare-fun m!501533 () Bool)

(assert (=> b!520555 m!501533))

(assert (=> b!520556 m!501533))

(declare-fun m!501535 () Bool)

(assert (=> d!80317 m!501535))

(assert (=> d!80317 m!501375))

(declare-fun m!501537 () Bool)

(assert (=> b!520558 m!501537))

(assert (=> b!520558 m!501537))

(declare-fun m!501539 () Bool)

(assert (=> b!520558 m!501539))

(assert (=> b!520562 m!501533))

(assert (=> b!520381 d!80317))

(declare-fun b!520584 () Bool)

(declare-fun e!303765 () Bool)

(declare-fun e!303764 () Bool)

(assert (=> b!520584 (= e!303765 e!303764)))

(declare-fun lt!238450 () (_ BitVec 64))

(assert (=> b!520584 (= lt!238450 (select (arr!15953 a!3235) j!176))))

(declare-fun lt!238449 () Unit!16132)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33191 (_ BitVec 64) (_ BitVec 32)) Unit!16132)

(assert (=> b!520584 (= lt!238449 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238450 j!176))))

(assert (=> b!520584 (arrayContainsKey!0 a!3235 lt!238450 #b00000000000000000000000000000000)))

(declare-fun lt!238451 () Unit!16132)

(assert (=> b!520584 (= lt!238451 lt!238449)))

(declare-fun res!318552 () Bool)

(assert (=> b!520584 (= res!318552 (= (seekEntryOrOpen!0 (select (arr!15953 a!3235) j!176) a!3235 mask!3524) (Found!4420 j!176)))))

(assert (=> b!520584 (=> (not res!318552) (not e!303764))))

(declare-fun b!520585 () Bool)

(declare-fun call!31803 () Bool)

(assert (=> b!520585 (= e!303765 call!31803)))

(declare-fun b!520586 () Bool)

(assert (=> b!520586 (= e!303764 call!31803)))

(declare-fun b!520587 () Bool)

(declare-fun e!303766 () Bool)

(assert (=> b!520587 (= e!303766 e!303765)))

(declare-fun c!61317 () Bool)

(assert (=> b!520587 (= c!61317 (validKeyInArray!0 (select (arr!15953 a!3235) j!176)))))

(declare-fun bm!31800 () Bool)

(assert (=> bm!31800 (= call!31803 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80333 () Bool)

(declare-fun res!318553 () Bool)

(assert (=> d!80333 (=> res!318553 e!303766)))

(assert (=> d!80333 (= res!318553 (bvsge j!176 (size!16317 a!3235)))))

(assert (=> d!80333 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303766)))

(assert (= (and d!80333 (not res!318553)) b!520587))

(assert (= (and b!520587 c!61317) b!520584))

(assert (= (and b!520587 (not c!61317)) b!520585))

(assert (= (and b!520584 res!318552) b!520586))

(assert (= (or b!520586 b!520585) bm!31800))

(assert (=> b!520584 m!501379))

(declare-fun m!501541 () Bool)

(assert (=> b!520584 m!501541))

(declare-fun m!501543 () Bool)

(assert (=> b!520584 m!501543))

(assert (=> b!520584 m!501379))

(assert (=> b!520584 m!501405))

(assert (=> b!520587 m!501379))

(assert (=> b!520587 m!501379))

(assert (=> b!520587 m!501381))

(declare-fun m!501545 () Bool)

(assert (=> bm!31800 m!501545))

(assert (=> b!520381 d!80333))

(declare-fun d!80335 () Bool)

(assert (=> d!80335 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238467 () Unit!16132)

(declare-fun choose!38 (array!33191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16132)

(assert (=> d!80335 (= lt!238467 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80335 (validMask!0 mask!3524)))

(assert (=> d!80335 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238467)))

(declare-fun bs!16388 () Bool)

(assert (= bs!16388 d!80335))

(assert (=> bs!16388 m!501395))

(declare-fun m!501578 () Bool)

(assert (=> bs!16388 m!501578))

(assert (=> bs!16388 m!501375))

(assert (=> b!520381 d!80335))

(declare-fun b!520620 () Bool)

(declare-fun lt!238469 () SeekEntryResult!4420)

(assert (=> b!520620 (and (bvsge (index!19882 lt!238469) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238469) (size!16317 a!3235)))))

(declare-fun res!318562 () Bool)

(assert (=> b!520620 (= res!318562 (= (select (arr!15953 a!3235) (index!19882 lt!238469)) (select (arr!15953 a!3235) j!176)))))

(declare-fun e!303786 () Bool)

(assert (=> b!520620 (=> res!318562 e!303786)))

(declare-fun e!303790 () Bool)

(assert (=> b!520620 (= e!303790 e!303786)))

(declare-fun d!80343 () Bool)

(declare-fun e!303787 () Bool)

(assert (=> d!80343 e!303787))

(declare-fun c!61332 () Bool)

(assert (=> d!80343 (= c!61332 (and (is-Intermediate!4420 lt!238469) (undefined!5232 lt!238469)))))

(declare-fun e!303788 () SeekEntryResult!4420)

(assert (=> d!80343 (= lt!238469 e!303788)))

(declare-fun c!61331 () Bool)

(assert (=> d!80343 (= c!61331 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238468 () (_ BitVec 64))

(assert (=> d!80343 (= lt!238468 (select (arr!15953 a!3235) lt!238343))))

(assert (=> d!80343 (validMask!0 mask!3524)))

(assert (=> d!80343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238343 (select (arr!15953 a!3235) j!176) a!3235 mask!3524) lt!238469)))

(declare-fun b!520621 () Bool)

(assert (=> b!520621 (and (bvsge (index!19882 lt!238469) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238469) (size!16317 a!3235)))))

(declare-fun res!318563 () Bool)

(assert (=> b!520621 (= res!318563 (= (select (arr!15953 a!3235) (index!19882 lt!238469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520621 (=> res!318563 e!303786)))

(declare-fun b!520622 () Bool)

(assert (=> b!520622 (= e!303787 (bvsge (x!48861 lt!238469) #b01111111111111111111111111111110))))

(declare-fun b!520623 () Bool)

(declare-fun e!303789 () SeekEntryResult!4420)

(assert (=> b!520623 (= e!303789 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238343 #b00000000000000000000000000000000 mask!3524) (select (arr!15953 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520624 () Bool)

(assert (=> b!520624 (= e!303787 e!303790)))

(declare-fun res!318564 () Bool)

(assert (=> b!520624 (= res!318564 (and (is-Intermediate!4420 lt!238469) (not (undefined!5232 lt!238469)) (bvslt (x!48861 lt!238469) #b01111111111111111111111111111110) (bvsge (x!48861 lt!238469) #b00000000000000000000000000000000) (bvsge (x!48861 lt!238469) #b00000000000000000000000000000000)))))

(assert (=> b!520624 (=> (not res!318564) (not e!303790))))

(declare-fun b!520625 () Bool)

(assert (=> b!520625 (= e!303788 (Intermediate!4420 true lt!238343 #b00000000000000000000000000000000))))

(declare-fun b!520626 () Bool)

(assert (=> b!520626 (= e!303789 (Intermediate!4420 false lt!238343 #b00000000000000000000000000000000))))

(declare-fun b!520627 () Bool)

(assert (=> b!520627 (and (bvsge (index!19882 lt!238469) #b00000000000000000000000000000000) (bvslt (index!19882 lt!238469) (size!16317 a!3235)))))

(assert (=> b!520627 (= e!303786 (= (select (arr!15953 a!3235) (index!19882 lt!238469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520628 () Bool)

(assert (=> b!520628 (= e!303788 e!303789)))

(declare-fun c!61333 () Bool)

(assert (=> b!520628 (= c!61333 (or (= lt!238468 (select (arr!15953 a!3235) j!176)) (= (bvadd lt!238468 lt!238468) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80343 c!61331) b!520625))

(assert (= (and d!80343 (not c!61331)) b!520628))

(assert (= (and b!520628 c!61333) b!520626))

(assert (= (and b!520628 (not c!61333)) b!520623))

(assert (= (and d!80343 c!61332) b!520622))

(assert (= (and d!80343 (not c!61332)) b!520624))

(assert (= (and b!520624 res!318564) b!520620))

(assert (= (and b!520620 (not res!318562)) b!520621))

(assert (= (and b!520621 (not res!318563)) b!520627))

(declare-fun m!501583 () Bool)

(assert (=> b!520620 m!501583))

(assert (=> b!520621 m!501583))

(declare-fun m!501585 () Bool)

(assert (=> d!80343 m!501585))

(assert (=> d!80343 m!501375))

(declare-fun m!501587 () Bool)

(assert (=> b!520623 m!501587))

(assert (=> b!520623 m!501587))

(assert (=> b!520623 m!501379))

(declare-fun m!501589 () Bool)

(assert (=> b!520623 m!501589))

(assert (=> b!520627 m!501583))

(assert (=> b!520381 d!80343))

(declare-fun d!80347 () Bool)

(assert (=> d!80347 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47302 d!80347))

(declare-fun d!80353 () Bool)

(assert (=> d!80353 (= (array_inv!11749 a!3235) (bvsge (size!16317 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47302 d!80353))

(declare-fun d!80357 () Bool)

(declare-fun res!318581 () Bool)

(declare-fun e!303811 () Bool)

(assert (=> d!80357 (=> res!318581 e!303811)))

(assert (=> d!80357 (= res!318581 (= (select (arr!15953 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80357 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!303811)))

(declare-fun b!520659 () Bool)

(declare-fun e!303812 () Bool)

(assert (=> b!520659 (= e!303811 e!303812)))

(declare-fun res!318582 () Bool)

(assert (=> b!520659 (=> (not res!318582) (not e!303812))))

(assert (=> b!520659 (= res!318582 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16317 a!3235)))))

(declare-fun b!520660 () Bool)

(assert (=> b!520660 (= e!303812 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80357 (not res!318581)) b!520659))

(assert (= (and b!520659 res!318582) b!520660))

(declare-fun m!501611 () Bool)

(assert (=> d!80357 m!501611))

(declare-fun m!501613 () Bool)

(assert (=> b!520660 m!501613))

(assert (=> b!520380 d!80357))

(declare-fun b!520661 () Bool)

(declare-fun e!303814 () Bool)

(declare-fun e!303813 () Bool)

(assert (=> b!520661 (= e!303814 e!303813)))

(declare-fun lt!238478 () (_ BitVec 64))

(assert (=> b!520661 (= lt!238478 (select (arr!15953 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238477 () Unit!16132)

(assert (=> b!520661 (= lt!238477 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238478 #b00000000000000000000000000000000))))

(assert (=> b!520661 (arrayContainsKey!0 a!3235 lt!238478 #b00000000000000000000000000000000)))

(declare-fun lt!238479 () Unit!16132)

(assert (=> b!520661 (= lt!238479 lt!238477)))

(declare-fun res!318583 () Bool)

(assert (=> b!520661 (= res!318583 (= (seekEntryOrOpen!0 (select (arr!15953 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4420 #b00000000000000000000000000000000)))))

(assert (=> b!520661 (=> (not res!318583) (not e!303813))))

(declare-fun b!520662 () Bool)

(declare-fun call!31805 () Bool)

(assert (=> b!520662 (= e!303814 call!31805)))

(declare-fun b!520663 () Bool)

(assert (=> b!520663 (= e!303813 call!31805)))

(declare-fun b!520664 () Bool)

(declare-fun e!303815 () Bool)

(assert (=> b!520664 (= e!303815 e!303814)))

(declare-fun c!61340 () Bool)

(assert (=> b!520664 (= c!61340 (validKeyInArray!0 (select (arr!15953 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31802 () Bool)

(assert (=> bm!31802 (= call!31805 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80363 () Bool)

(declare-fun res!318584 () Bool)

(assert (=> d!80363 (=> res!318584 e!303815)))

(assert (=> d!80363 (= res!318584 (bvsge #b00000000000000000000000000000000 (size!16317 a!3235)))))

(assert (=> d!80363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303815)))

(assert (= (and d!80363 (not res!318584)) b!520664))

(assert (= (and b!520664 c!61340) b!520661))

(assert (= (and b!520664 (not c!61340)) b!520662))

(assert (= (and b!520661 res!318583) b!520663))

(assert (= (or b!520663 b!520662) bm!31802))

(assert (=> b!520661 m!501611))

(declare-fun m!501615 () Bool)

(assert (=> b!520661 m!501615))

(declare-fun m!501617 () Bool)

(assert (=> b!520661 m!501617))

(assert (=> b!520661 m!501611))

(declare-fun m!501619 () Bool)

(assert (=> b!520661 m!501619))

(assert (=> b!520664 m!501611))

(assert (=> b!520664 m!501611))

(declare-fun m!501621 () Bool)

(assert (=> b!520664 m!501621))

(declare-fun m!501623 () Bool)

(assert (=> bm!31802 m!501623))

(assert (=> b!520376 d!80363))

(declare-fun d!80365 () Bool)

(assert (=> d!80365 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520371 d!80365))

(declare-fun bm!31805 () Bool)

(declare-fun call!31808 () Bool)

(declare-fun c!61343 () Bool)

(assert (=> bm!31805 (= call!31808 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61343 (Cons!10107 (select (arr!15953 a!3235) #b00000000000000000000000000000000) Nil!10108) Nil!10108)))))

(declare-fun b!520678 () Bool)

(declare-fun e!303829 () Bool)

(declare-fun e!303827 () Bool)

(assert (=> b!520678 (= e!303829 e!303827)))

(declare-fun res!318596 () Bool)

(assert (=> b!520678 (=> (not res!318596) (not e!303827))))

(declare-fun e!303828 () Bool)

(assert (=> b!520678 (= res!318596 (not e!303828))))

(declare-fun res!318594 () Bool)

(assert (=> b!520678 (=> (not res!318594) (not e!303828))))

(assert (=> b!520678 (= res!318594 (validKeyInArray!0 (select (arr!15953 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520679 () Bool)

(declare-fun contains!2763 (List!10111 (_ BitVec 64)) Bool)

(assert (=> b!520679 (= e!303828 (contains!2763 Nil!10108 (select (arr!15953 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80367 () Bool)

(declare-fun res!318595 () Bool)

(assert (=> d!80367 (=> res!318595 e!303829)))

(assert (=> d!80367 (= res!318595 (bvsge #b00000000000000000000000000000000 (size!16317 a!3235)))))

(assert (=> d!80367 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10108) e!303829)))

(declare-fun b!520680 () Bool)

(declare-fun e!303830 () Bool)

(assert (=> b!520680 (= e!303827 e!303830)))

(assert (=> b!520680 (= c!61343 (validKeyInArray!0 (select (arr!15953 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520681 () Bool)

(assert (=> b!520681 (= e!303830 call!31808)))

(declare-fun b!520682 () Bool)

(assert (=> b!520682 (= e!303830 call!31808)))

(assert (= (and d!80367 (not res!318595)) b!520678))

(assert (= (and b!520678 res!318594) b!520679))

(assert (= (and b!520678 res!318596) b!520680))

(assert (= (and b!520680 c!61343) b!520681))

(assert (= (and b!520680 (not c!61343)) b!520682))

(assert (= (or b!520681 b!520682) bm!31805))

(assert (=> bm!31805 m!501611))

(declare-fun m!501629 () Bool)

(assert (=> bm!31805 m!501629))

(assert (=> b!520678 m!501611))

(assert (=> b!520678 m!501611))

(assert (=> b!520678 m!501621))

(assert (=> b!520679 m!501611))

(assert (=> b!520679 m!501611))

(declare-fun m!501631 () Bool)

(assert (=> b!520679 m!501631))

(assert (=> b!520680 m!501611))

(assert (=> b!520680 m!501611))

(assert (=> b!520680 m!501621))

(assert (=> b!520373 d!80367))

(declare-fun d!80371 () Bool)

(declare-fun e!303844 () Bool)

(assert (=> d!80371 e!303844))

(declare-fun res!318608 () Bool)

(assert (=> d!80371 (=> (not res!318608) (not e!303844))))

(assert (=> d!80371 (= res!318608 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16317 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16317 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16317 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16317 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16317 a!3235))))))

(declare-fun lt!238487 () Unit!16132)

(declare-fun choose!47 (array!33191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16132)

(assert (=> d!80371 (= lt!238487 (choose!47 a!3235 i!1204 k!2280 j!176 lt!238343 #b00000000000000000000000000000000 (index!19882 lt!238339) (x!48861 lt!238339) mask!3524))))

(assert (=> d!80371 (validMask!0 mask!3524)))

(assert (=> d!80371 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238343 #b00000000000000000000000000000000 (index!19882 lt!238339) (x!48861 lt!238339) mask!3524) lt!238487)))

(declare-fun b!520700 () Bool)

(assert (=> b!520700 (= e!303844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238343 (select (store (arr!15953 a!3235) i!1204 k!2280) j!176) (array!33192 (store (arr!15953 a!3235) i!1204 k!2280) (size!16317 a!3235)) mask!3524) (Intermediate!4420 false (index!19882 lt!238339) (x!48861 lt!238339))))))

