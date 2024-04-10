; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46552 () Bool)

(assert start!46552)

(declare-fun b!514370 () Bool)

(declare-fun res!314308 () Bool)

(declare-fun e!300355 () Bool)

(assert (=> b!514370 (=> (not res!314308) (not e!300355))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514370 (= res!314308 (validKeyInArray!0 k!2280))))

(declare-fun b!514371 () Bool)

(declare-fun res!314299 () Bool)

(declare-fun e!300353 () Bool)

(assert (=> b!514371 (=> res!314299 e!300353)))

(declare-datatypes ((SeekEntryResult!4327 0))(
  ( (MissingZero!4327 (index!19496 (_ BitVec 32))) (Found!4327 (index!19497 (_ BitVec 32))) (Intermediate!4327 (undefined!5139 Bool) (index!19498 (_ BitVec 32)) (x!48454 (_ BitVec 32))) (Undefined!4327) (MissingVacant!4327 (index!19499 (_ BitVec 32))) )
))
(declare-fun lt!235485 () SeekEntryResult!4327)

(assert (=> b!514371 (= res!314299 (or (undefined!5139 lt!235485) (not (is-Intermediate!4327 lt!235485))))))

(declare-fun b!514372 () Bool)

(declare-datatypes ((array!32978 0))(
  ( (array!32979 (arr!15860 (Array (_ BitVec 32) (_ BitVec 64))) (size!16224 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32978)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!514372 (= e!300353 (or (= (select (arr!15860 a!3235) (index!19498 lt!235485)) (select (arr!15860 a!3235) j!176)) (= (select (arr!15860 a!3235) (index!19498 lt!235485)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15860 a!3235) (index!19498 lt!235485)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!514372 (bvslt (x!48454 lt!235485) #b01111111111111111111111111111110)))

(declare-fun b!514373 () Bool)

(declare-fun res!314307 () Bool)

(assert (=> b!514373 (=> (not res!314307) (not e!300355))))

(declare-fun arrayContainsKey!0 (array!32978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514373 (= res!314307 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514374 () Bool)

(declare-fun e!300354 () Bool)

(assert (=> b!514374 (= e!300355 e!300354)))

(declare-fun res!314305 () Bool)

(assert (=> b!514374 (=> (not res!314305) (not e!300354))))

(declare-fun lt!235484 () SeekEntryResult!4327)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!514374 (= res!314305 (or (= lt!235484 (MissingZero!4327 i!1204)) (= lt!235484 (MissingVacant!4327 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32978 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!514374 (= lt!235484 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!514375 () Bool)

(declare-fun res!314309 () Bool)

(assert (=> b!514375 (=> (not res!314309) (not e!300354))))

(declare-datatypes ((List!10018 0))(
  ( (Nil!10015) (Cons!10014 (h!10906 (_ BitVec 64)) (t!16246 List!10018)) )
))
(declare-fun arrayNoDuplicates!0 (array!32978 (_ BitVec 32) List!10018) Bool)

(assert (=> b!514375 (= res!314309 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10015))))

(declare-fun b!514376 () Bool)

(declare-fun res!314304 () Bool)

(assert (=> b!514376 (=> (not res!314304) (not e!300355))))

(assert (=> b!514376 (= res!314304 (and (= (size!16224 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16224 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16224 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514377 () Bool)

(assert (=> b!514377 (= e!300354 (not e!300353))))

(declare-fun res!314306 () Bool)

(assert (=> b!514377 (=> res!314306 e!300353)))

(declare-fun lt!235486 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32978 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!514377 (= res!314306 (= lt!235485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235486 (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235)) mask!3524)))))

(declare-fun lt!235482 () (_ BitVec 32))

(assert (=> b!514377 (= lt!235485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235482 (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514377 (= lt!235486 (toIndex!0 (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!514377 (= lt!235482 (toIndex!0 (select (arr!15860 a!3235) j!176) mask!3524))))

(declare-fun e!300356 () Bool)

(assert (=> b!514377 e!300356))

(declare-fun res!314300 () Bool)

(assert (=> b!514377 (=> (not res!314300) (not e!300356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32978 (_ BitVec 32)) Bool)

(assert (=> b!514377 (= res!314300 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15912 0))(
  ( (Unit!15913) )
))
(declare-fun lt!235483 () Unit!15912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15912)

(assert (=> b!514377 (= lt!235483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514369 () Bool)

(declare-fun res!314301 () Bool)

(assert (=> b!514369 (=> (not res!314301) (not e!300354))))

(assert (=> b!514369 (= res!314301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!314303 () Bool)

(assert (=> start!46552 (=> (not res!314303) (not e!300355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46552 (= res!314303 (validMask!0 mask!3524))))

(assert (=> start!46552 e!300355))

(assert (=> start!46552 true))

(declare-fun array_inv!11656 (array!32978) Bool)

(assert (=> start!46552 (array_inv!11656 a!3235)))

(declare-fun b!514378 () Bool)

(declare-fun res!314302 () Bool)

(assert (=> b!514378 (=> (not res!314302) (not e!300355))))

(assert (=> b!514378 (= res!314302 (validKeyInArray!0 (select (arr!15860 a!3235) j!176)))))

(declare-fun b!514379 () Bool)

(assert (=> b!514379 (= e!300356 (= (seekEntryOrOpen!0 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) (Found!4327 j!176)))))

(assert (= (and start!46552 res!314303) b!514376))

(assert (= (and b!514376 res!314304) b!514378))

(assert (= (and b!514378 res!314302) b!514370))

(assert (= (and b!514370 res!314308) b!514373))

(assert (= (and b!514373 res!314307) b!514374))

(assert (= (and b!514374 res!314305) b!514369))

(assert (= (and b!514369 res!314301) b!514375))

(assert (= (and b!514375 res!314309) b!514377))

(assert (= (and b!514377 res!314300) b!514379))

(assert (= (and b!514377 (not res!314306)) b!514371))

(assert (= (and b!514371 (not res!314299)) b!514372))

(declare-fun m!495805 () Bool)

(assert (=> b!514372 m!495805))

(declare-fun m!495807 () Bool)

(assert (=> b!514372 m!495807))

(declare-fun m!495809 () Bool)

(assert (=> b!514375 m!495809))

(assert (=> b!514379 m!495807))

(assert (=> b!514379 m!495807))

(declare-fun m!495811 () Bool)

(assert (=> b!514379 m!495811))

(declare-fun m!495813 () Bool)

(assert (=> b!514374 m!495813))

(declare-fun m!495815 () Bool)

(assert (=> b!514369 m!495815))

(declare-fun m!495817 () Bool)

(assert (=> b!514377 m!495817))

(assert (=> b!514377 m!495807))

(declare-fun m!495819 () Bool)

(assert (=> b!514377 m!495819))

(declare-fun m!495821 () Bool)

(assert (=> b!514377 m!495821))

(declare-fun m!495823 () Bool)

(assert (=> b!514377 m!495823))

(assert (=> b!514377 m!495807))

(declare-fun m!495825 () Bool)

(assert (=> b!514377 m!495825))

(assert (=> b!514377 m!495807))

(declare-fun m!495827 () Bool)

(assert (=> b!514377 m!495827))

(assert (=> b!514377 m!495823))

(declare-fun m!495829 () Bool)

(assert (=> b!514377 m!495829))

(assert (=> b!514377 m!495823))

(declare-fun m!495831 () Bool)

(assert (=> b!514377 m!495831))

(assert (=> b!514378 m!495807))

(assert (=> b!514378 m!495807))

(declare-fun m!495833 () Bool)

(assert (=> b!514378 m!495833))

(declare-fun m!495835 () Bool)

(assert (=> b!514373 m!495835))

(declare-fun m!495837 () Bool)

(assert (=> start!46552 m!495837))

(declare-fun m!495839 () Bool)

(assert (=> start!46552 m!495839))

(declare-fun m!495841 () Bool)

(assert (=> b!514370 m!495841))

(push 1)

(assert (not b!514373))

(assert (not b!514377))

(assert (not b!514379))

(assert (not b!514369))

(assert (not start!46552))

(assert (not b!514374))

(assert (not b!514370))

(assert (not b!514375))

(assert (not b!514378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79371 () Bool)

(declare-fun lt!235520 () (_ BitVec 32))

(declare-fun lt!235519 () (_ BitVec 32))

(assert (=> d!79371 (= lt!235520 (bvmul (bvxor lt!235519 (bvlshr lt!235519 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79371 (= lt!235519 ((_ extract 31 0) (bvand (bvxor (select (arr!15860 a!3235) j!176) (bvlshr (select (arr!15860 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79371 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314329 (let ((h!10908 ((_ extract 31 0) (bvand (bvxor (select (arr!15860 a!3235) j!176) (bvlshr (select (arr!15860 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48457 (bvmul (bvxor h!10908 (bvlshr h!10908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48457 (bvlshr x!48457 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314329 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314329 #b00000000000000000000000000000000))))))

(assert (=> d!79371 (= (toIndex!0 (select (arr!15860 a!3235) j!176) mask!3524) (bvand (bvxor lt!235520 (bvlshr lt!235520 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514377 d!79371))

(declare-fun b!514460 () Bool)

(declare-fun e!300410 () Bool)

(declare-fun e!300408 () Bool)

(assert (=> b!514460 (= e!300410 e!300408)))

(declare-fun lt!235536 () (_ BitVec 64))

(assert (=> b!514460 (= lt!235536 (select (arr!15860 a!3235) j!176))))

(declare-fun lt!235538 () Unit!15912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32978 (_ BitVec 64) (_ BitVec 32)) Unit!15912)

(assert (=> b!514460 (= lt!235538 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235536 j!176))))

(assert (=> b!514460 (arrayContainsKey!0 a!3235 lt!235536 #b00000000000000000000000000000000)))

(declare-fun lt!235537 () Unit!15912)

(assert (=> b!514460 (= lt!235537 lt!235538)))

(declare-fun res!314341 () Bool)

(assert (=> b!514460 (= res!314341 (= (seekEntryOrOpen!0 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) (Found!4327 j!176)))))

(assert (=> b!514460 (=> (not res!314341) (not e!300408))))

(declare-fun d!79381 () Bool)

(declare-fun res!314340 () Bool)

(declare-fun e!300409 () Bool)

(assert (=> d!79381 (=> res!314340 e!300409)))

(assert (=> d!79381 (= res!314340 (bvsge j!176 (size!16224 a!3235)))))

(assert (=> d!79381 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300409)))

(declare-fun b!514461 () Bool)

(assert (=> b!514461 (= e!300409 e!300410)))

(declare-fun c!60347 () Bool)

(assert (=> b!514461 (= c!60347 (validKeyInArray!0 (select (arr!15860 a!3235) j!176)))))

(declare-fun b!514462 () Bool)

(declare-fun call!31604 () Bool)

(assert (=> b!514462 (= e!300410 call!31604)))

(declare-fun b!514463 () Bool)

(assert (=> b!514463 (= e!300408 call!31604)))

(declare-fun bm!31601 () Bool)

(assert (=> bm!31601 (= call!31604 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79381 (not res!314340)) b!514461))

(assert (= (and b!514461 c!60347) b!514460))

(assert (= (and b!514461 (not c!60347)) b!514462))

(assert (= (and b!514460 res!314341) b!514463))

(assert (= (or b!514463 b!514462) bm!31601))

(assert (=> b!514460 m!495807))

(declare-fun m!495883 () Bool)

(assert (=> b!514460 m!495883))

(declare-fun m!495885 () Bool)

(assert (=> b!514460 m!495885))

(assert (=> b!514460 m!495807))

(assert (=> b!514460 m!495811))

(assert (=> b!514461 m!495807))

(assert (=> b!514461 m!495807))

(assert (=> b!514461 m!495833))

(declare-fun m!495887 () Bool)

(assert (=> bm!31601 m!495887))

(assert (=> b!514377 d!79381))

(declare-fun d!79385 () Bool)

(assert (=> d!79385 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235541 () Unit!15912)

(declare-fun choose!38 (array!32978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15912)

(assert (=> d!79385 (= lt!235541 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79385 (validMask!0 mask!3524)))

(assert (=> d!79385 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235541)))

(declare-fun bs!16268 () Bool)

(assert (= bs!16268 d!79385))

(assert (=> bs!16268 m!495827))

(declare-fun m!495893 () Bool)

(assert (=> bs!16268 m!495893))

(assert (=> bs!16268 m!495837))

(assert (=> b!514377 d!79385))

(declare-fun d!79391 () Bool)

(declare-fun lt!235543 () (_ BitVec 32))

(declare-fun lt!235542 () (_ BitVec 32))

(assert (=> d!79391 (= lt!235543 (bvmul (bvxor lt!235542 (bvlshr lt!235542 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79391 (= lt!235542 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79391 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314329 (let ((h!10908 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48457 (bvmul (bvxor h!10908 (bvlshr h!10908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48457 (bvlshr x!48457 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314329 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314329 #b00000000000000000000000000000000))))))

(assert (=> d!79391 (= (toIndex!0 (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235543 (bvlshr lt!235543 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514377 d!79391))

(declare-fun b!514534 () Bool)

(declare-fun lt!235575 () SeekEntryResult!4327)

(assert (=> b!514534 (and (bvsge (index!19498 lt!235575) #b00000000000000000000000000000000) (bvslt (index!19498 lt!235575) (size!16224 a!3235)))))

(declare-fun res!314363 () Bool)

(assert (=> b!514534 (= res!314363 (= (select (arr!15860 a!3235) (index!19498 lt!235575)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300454 () Bool)

(assert (=> b!514534 (=> res!314363 e!300454)))

(declare-fun b!514535 () Bool)

(declare-fun e!300458 () SeekEntryResult!4327)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514535 (= e!300458 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235482 #b00000000000000000000000000000000 mask!3524) (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514536 () Bool)

(declare-fun e!300457 () Bool)

(declare-fun e!300456 () Bool)

(assert (=> b!514536 (= e!300457 e!300456)))

(declare-fun res!314364 () Bool)

(assert (=> b!514536 (= res!314364 (and (is-Intermediate!4327 lt!235575) (not (undefined!5139 lt!235575)) (bvslt (x!48454 lt!235575) #b01111111111111111111111111111110) (bvsge (x!48454 lt!235575) #b00000000000000000000000000000000) (bvsge (x!48454 lt!235575) #b00000000000000000000000000000000)))))

(assert (=> b!514536 (=> (not res!314364) (not e!300456))))

(declare-fun b!514537 () Bool)

(assert (=> b!514537 (and (bvsge (index!19498 lt!235575) #b00000000000000000000000000000000) (bvslt (index!19498 lt!235575) (size!16224 a!3235)))))

(declare-fun res!314365 () Bool)

(assert (=> b!514537 (= res!314365 (= (select (arr!15860 a!3235) (index!19498 lt!235575)) (select (arr!15860 a!3235) j!176)))))

(assert (=> b!514537 (=> res!314365 e!300454)))

(assert (=> b!514537 (= e!300456 e!300454)))

(declare-fun d!79393 () Bool)

(assert (=> d!79393 e!300457))

(declare-fun c!60375 () Bool)

(assert (=> d!79393 (= c!60375 (and (is-Intermediate!4327 lt!235575) (undefined!5139 lt!235575)))))

(declare-fun e!300455 () SeekEntryResult!4327)

(assert (=> d!79393 (= lt!235575 e!300455)))

(declare-fun c!60373 () Bool)

(assert (=> d!79393 (= c!60373 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235576 () (_ BitVec 64))

(assert (=> d!79393 (= lt!235576 (select (arr!15860 a!3235) lt!235482))))

(assert (=> d!79393 (validMask!0 mask!3524)))

(assert (=> d!79393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235482 (select (arr!15860 a!3235) j!176) a!3235 mask!3524) lt!235575)))

(declare-fun b!514538 () Bool)

(assert (=> b!514538 (= e!300455 (Intermediate!4327 true lt!235482 #b00000000000000000000000000000000))))

(declare-fun b!514539 () Bool)

(assert (=> b!514539 (and (bvsge (index!19498 lt!235575) #b00000000000000000000000000000000) (bvslt (index!19498 lt!235575) (size!16224 a!3235)))))

(assert (=> b!514539 (= e!300454 (= (select (arr!15860 a!3235) (index!19498 lt!235575)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514540 () Bool)

(assert (=> b!514540 (= e!300458 (Intermediate!4327 false lt!235482 #b00000000000000000000000000000000))))

(declare-fun b!514541 () Bool)

(assert (=> b!514541 (= e!300457 (bvsge (x!48454 lt!235575) #b01111111111111111111111111111110))))

(declare-fun b!514542 () Bool)

(assert (=> b!514542 (= e!300455 e!300458)))

(declare-fun c!60374 () Bool)

(assert (=> b!514542 (= c!60374 (or (= lt!235576 (select (arr!15860 a!3235) j!176)) (= (bvadd lt!235576 lt!235576) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79393 c!60373) b!514538))

(assert (= (and d!79393 (not c!60373)) b!514542))

(assert (= (and b!514542 c!60374) b!514540))

(assert (= (and b!514542 (not c!60374)) b!514535))

(assert (= (and d!79393 c!60375) b!514541))

(assert (= (and d!79393 (not c!60375)) b!514536))

(assert (= (and b!514536 res!314364) b!514537))

(assert (= (and b!514537 (not res!314365)) b!514534))

(assert (= (and b!514534 (not res!314363)) b!514539))

(declare-fun m!495955 () Bool)

(assert (=> b!514535 m!495955))

(assert (=> b!514535 m!495955))

(assert (=> b!514535 m!495807))

(declare-fun m!495957 () Bool)

(assert (=> b!514535 m!495957))

(declare-fun m!495959 () Bool)

(assert (=> d!79393 m!495959))

(assert (=> d!79393 m!495837))

(declare-fun m!495961 () Bool)

(assert (=> b!514537 m!495961))

(assert (=> b!514534 m!495961))

(assert (=> b!514539 m!495961))

(assert (=> b!514377 d!79393))

(declare-fun b!514543 () Bool)

(declare-fun lt!235577 () SeekEntryResult!4327)

(assert (=> b!514543 (and (bvsge (index!19498 lt!235577) #b00000000000000000000000000000000) (bvslt (index!19498 lt!235577) (size!16224 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235)))))))

(declare-fun res!314367 () Bool)

(assert (=> b!514543 (= res!314367 (= (select (arr!15860 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235))) (index!19498 lt!235577)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300459 () Bool)

(assert (=> b!514543 (=> res!314367 e!300459)))

(declare-fun b!514544 () Bool)

(declare-fun e!300465 () SeekEntryResult!4327)

(assert (=> b!514544 (= e!300465 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235486 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235)) mask!3524))))

(declare-fun b!514545 () Bool)

(declare-fun e!300464 () Bool)

(declare-fun e!300461 () Bool)

(assert (=> b!514545 (= e!300464 e!300461)))

(declare-fun res!314369 () Bool)

(assert (=> b!514545 (= res!314369 (and (is-Intermediate!4327 lt!235577) (not (undefined!5139 lt!235577)) (bvslt (x!48454 lt!235577) #b01111111111111111111111111111110) (bvsge (x!48454 lt!235577) #b00000000000000000000000000000000) (bvsge (x!48454 lt!235577) #b00000000000000000000000000000000)))))

(assert (=> b!514545 (=> (not res!314369) (not e!300461))))

(declare-fun b!514546 () Bool)

(assert (=> b!514546 (and (bvsge (index!19498 lt!235577) #b00000000000000000000000000000000) (bvslt (index!19498 lt!235577) (size!16224 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235)))))))

(declare-fun res!314370 () Bool)

(assert (=> b!514546 (= res!314370 (= (select (arr!15860 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235))) (index!19498 lt!235577)) (select (store (arr!15860 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!514546 (=> res!314370 e!300459)))

(assert (=> b!514546 (= e!300461 e!300459)))

(declare-fun d!79415 () Bool)

(assert (=> d!79415 e!300464))

(declare-fun c!60378 () Bool)

(assert (=> d!79415 (= c!60378 (and (is-Intermediate!4327 lt!235577) (undefined!5139 lt!235577)))))

(declare-fun e!300460 () SeekEntryResult!4327)

(assert (=> d!79415 (= lt!235577 e!300460)))

(declare-fun c!60376 () Bool)

(assert (=> d!79415 (= c!60376 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235578 () (_ BitVec 64))

(assert (=> d!79415 (= lt!235578 (select (arr!15860 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235))) lt!235486))))

(assert (=> d!79415 (validMask!0 mask!3524)))

(assert (=> d!79415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235486 (select (store (arr!15860 a!3235) i!1204 k!2280) j!176) (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235)) mask!3524) lt!235577)))

(declare-fun b!514547 () Bool)

(assert (=> b!514547 (= e!300460 (Intermediate!4327 true lt!235486 #b00000000000000000000000000000000))))

(declare-fun b!514548 () Bool)

(assert (=> b!514548 (and (bvsge (index!19498 lt!235577) #b00000000000000000000000000000000) (bvslt (index!19498 lt!235577) (size!16224 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235)))))))

(assert (=> b!514548 (= e!300459 (= (select (arr!15860 (array!32979 (store (arr!15860 a!3235) i!1204 k!2280) (size!16224 a!3235))) (index!19498 lt!235577)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514549 () Bool)

(assert (=> b!514549 (= e!300465 (Intermediate!4327 false lt!235486 #b00000000000000000000000000000000))))

(declare-fun b!514550 () Bool)

(assert (=> b!514550 (= e!300464 (bvsge (x!48454 lt!235577) #b01111111111111111111111111111110))))

(declare-fun b!514551 () Bool)

(assert (=> b!514551 (= e!300460 e!300465)))

(declare-fun c!60377 () Bool)

(assert (=> b!514551 (= c!60377 (or (= lt!235578 (select (store (arr!15860 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235578 lt!235578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79415 c!60376) b!514547))

(assert (= (and d!79415 (not c!60376)) b!514551))

(assert (= (and b!514551 c!60377) b!514549))

(assert (= (and b!514551 (not c!60377)) b!514544))

(assert (= (and d!79415 c!60378) b!514550))

(assert (= (and d!79415 (not c!60378)) b!514545))

(assert (= (and b!514545 res!314369) b!514546))

(assert (= (and b!514546 (not res!314370)) b!514543))

(assert (= (and b!514543 (not res!314367)) b!514548))

(declare-fun m!495963 () Bool)

(assert (=> b!514544 m!495963))

(assert (=> b!514544 m!495963))

(assert (=> b!514544 m!495823))

(declare-fun m!495965 () Bool)

(assert (=> b!514544 m!495965))

(declare-fun m!495967 () Bool)

(assert (=> d!79415 m!495967))

(assert (=> d!79415 m!495837))

(declare-fun m!495969 () Bool)

(assert (=> b!514546 m!495969))

(assert (=> b!514543 m!495969))

(assert (=> b!514548 m!495969))

(assert (=> b!514377 d!79415))

(declare-fun d!79417 () Bool)

(declare-fun res!314382 () Bool)

(declare-fun e!300480 () Bool)

(assert (=> d!79417 (=> res!314382 e!300480)))

(assert (=> d!79417 (= res!314382 (= (select (arr!15860 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79417 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300480)))

(declare-fun b!514571 () Bool)

(declare-fun e!300481 () Bool)

(assert (=> b!514571 (= e!300480 e!300481)))

(declare-fun res!314383 () Bool)

(assert (=> b!514571 (=> (not res!314383) (not e!300481))))

(assert (=> b!514571 (= res!314383 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16224 a!3235)))))

(declare-fun b!514572 () Bool)

(assert (=> b!514572 (= e!300481 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79417 (not res!314382)) b!514571))

(assert (= (and b!514571 res!314383) b!514572))

(declare-fun m!495973 () Bool)

(assert (=> d!79417 m!495973))

(declare-fun m!495975 () Bool)

(assert (=> b!514572 m!495975))

(assert (=> b!514373 d!79417))

(declare-fun d!79421 () Bool)

(assert (=> d!79421 (= (validKeyInArray!0 (select (arr!15860 a!3235) j!176)) (and (not (= (select (arr!15860 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15860 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514378 d!79421))

(declare-fun lt!235601 () SeekEntryResult!4327)

(declare-fun b!514616 () Bool)

(declare-fun e!300506 () SeekEntryResult!4327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32978 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!514616 (= e!300506 (seekKeyOrZeroReturnVacant!0 (x!48454 lt!235601) (index!19498 lt!235601) (index!19498 lt!235601) (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514617 () Bool)

(declare-fun c!60400 () Bool)

(declare-fun lt!235600 () (_ BitVec 64))

(assert (=> b!514617 (= c!60400 (= lt!235600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300507 () SeekEntryResult!4327)

(assert (=> b!514617 (= e!300507 e!300506)))

(declare-fun d!79423 () Bool)

(declare-fun lt!235602 () SeekEntryResult!4327)

(assert (=> d!79423 (and (or (is-Undefined!4327 lt!235602) (not (is-Found!4327 lt!235602)) (and (bvsge (index!19497 lt!235602) #b00000000000000000000000000000000) (bvslt (index!19497 lt!235602) (size!16224 a!3235)))) (or (is-Undefined!4327 lt!235602) (is-Found!4327 lt!235602) (not (is-MissingZero!4327 lt!235602)) (and (bvsge (index!19496 lt!235602) #b00000000000000000000000000000000) (bvslt (index!19496 lt!235602) (size!16224 a!3235)))) (or (is-Undefined!4327 lt!235602) (is-Found!4327 lt!235602) (is-MissingZero!4327 lt!235602) (not (is-MissingVacant!4327 lt!235602)) (and (bvsge (index!19499 lt!235602) #b00000000000000000000000000000000) (bvslt (index!19499 lt!235602) (size!16224 a!3235)))) (or (is-Undefined!4327 lt!235602) (ite (is-Found!4327 lt!235602) (= (select (arr!15860 a!3235) (index!19497 lt!235602)) (select (arr!15860 a!3235) j!176)) (ite (is-MissingZero!4327 lt!235602) (= (select (arr!15860 a!3235) (index!19496 lt!235602)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4327 lt!235602) (= (select (arr!15860 a!3235) (index!19499 lt!235602)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300508 () SeekEntryResult!4327)

(assert (=> d!79423 (= lt!235602 e!300508)))

(declare-fun c!60399 () Bool)

(assert (=> d!79423 (= c!60399 (and (is-Intermediate!4327 lt!235601) (undefined!5139 lt!235601)))))

(assert (=> d!79423 (= lt!235601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15860 a!3235) j!176) mask!3524) (select (arr!15860 a!3235) j!176) a!3235 mask!3524))))

