; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46550 () Bool)

(assert start!46550)

(declare-fun b!514336 () Bool)

(declare-fun res!314271 () Bool)

(declare-fun e!300340 () Bool)

(assert (=> b!514336 (=> (not res!314271) (not e!300340))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514336 (= res!314271 (validKeyInArray!0 k0!2280))))

(declare-fun res!314276 () Bool)

(assert (=> start!46550 (=> (not res!314276) (not e!300340))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46550 (= res!314276 (validMask!0 mask!3524))))

(assert (=> start!46550 e!300340))

(assert (=> start!46550 true))

(declare-datatypes ((array!32976 0))(
  ( (array!32977 (arr!15859 (Array (_ BitVec 32) (_ BitVec 64))) (size!16223 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32976)

(declare-fun array_inv!11655 (array!32976) Bool)

(assert (=> start!46550 (array_inv!11655 a!3235)))

(declare-fun b!514337 () Bool)

(declare-fun res!314270 () Bool)

(declare-fun e!300338 () Bool)

(assert (=> b!514337 (=> (not res!314270) (not e!300338))))

(declare-datatypes ((List!10017 0))(
  ( (Nil!10014) (Cons!10013 (h!10905 (_ BitVec 64)) (t!16245 List!10017)) )
))
(declare-fun arrayNoDuplicates!0 (array!32976 (_ BitVec 32) List!10017) Bool)

(assert (=> b!514337 (= res!314270 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10014))))

(declare-fun b!514338 () Bool)

(declare-fun e!300342 () Bool)

(assert (=> b!514338 (= e!300338 (not e!300342))))

(declare-fun res!314269 () Bool)

(assert (=> b!514338 (=> res!314269 e!300342)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235468 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4326 0))(
  ( (MissingZero!4326 (index!19492 (_ BitVec 32))) (Found!4326 (index!19493 (_ BitVec 32))) (Intermediate!4326 (undefined!5138 Bool) (index!19494 (_ BitVec 32)) (x!48453 (_ BitVec 32))) (Undefined!4326) (MissingVacant!4326 (index!19495 (_ BitVec 32))) )
))
(declare-fun lt!235469 () SeekEntryResult!4326)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32976 (_ BitVec 32)) SeekEntryResult!4326)

(assert (=> b!514338 (= res!314269 (= lt!235469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235468 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)) mask!3524)))))

(declare-fun lt!235471 () (_ BitVec 32))

(assert (=> b!514338 (= lt!235469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235471 (select (arr!15859 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514338 (= lt!235468 (toIndex!0 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514338 (= lt!235471 (toIndex!0 (select (arr!15859 a!3235) j!176) mask!3524))))

(declare-fun e!300341 () Bool)

(assert (=> b!514338 e!300341))

(declare-fun res!314274 () Bool)

(assert (=> b!514338 (=> (not res!314274) (not e!300341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32976 (_ BitVec 32)) Bool)

(assert (=> b!514338 (= res!314274 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15910 0))(
  ( (Unit!15911) )
))
(declare-fun lt!235470 () Unit!15910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15910)

(assert (=> b!514338 (= lt!235470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514339 () Bool)

(declare-fun res!314275 () Bool)

(assert (=> b!514339 (=> (not res!314275) (not e!300340))))

(declare-fun arrayContainsKey!0 (array!32976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514339 (= res!314275 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514340 () Bool)

(assert (=> b!514340 (= e!300342 (or (= (select (arr!15859 a!3235) (index!19494 lt!235469)) (select (arr!15859 a!3235) j!176)) (= (select (arr!15859 a!3235) (index!19494 lt!235469)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15859 a!3235) (index!19494 lt!235469)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!514340 (bvslt (x!48453 lt!235469) #b01111111111111111111111111111110)))

(declare-fun b!514341 () Bool)

(declare-fun res!314267 () Bool)

(assert (=> b!514341 (=> (not res!314267) (not e!300338))))

(assert (=> b!514341 (= res!314267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514342 () Bool)

(assert (=> b!514342 (= e!300340 e!300338)))

(declare-fun res!314273 () Bool)

(assert (=> b!514342 (=> (not res!314273) (not e!300338))))

(declare-fun lt!235467 () SeekEntryResult!4326)

(assert (=> b!514342 (= res!314273 (or (= lt!235467 (MissingZero!4326 i!1204)) (= lt!235467 (MissingVacant!4326 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32976 (_ BitVec 32)) SeekEntryResult!4326)

(assert (=> b!514342 (= lt!235467 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!514343 () Bool)

(declare-fun res!314266 () Bool)

(assert (=> b!514343 (=> (not res!314266) (not e!300340))))

(assert (=> b!514343 (= res!314266 (and (= (size!16223 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16223 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16223 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514344 () Bool)

(declare-fun res!314272 () Bool)

(assert (=> b!514344 (=> res!314272 e!300342)))

(get-info :version)

(assert (=> b!514344 (= res!314272 (or (undefined!5138 lt!235469) (not ((_ is Intermediate!4326) lt!235469))))))

(declare-fun b!514345 () Bool)

(declare-fun res!314268 () Bool)

(assert (=> b!514345 (=> (not res!314268) (not e!300340))))

(assert (=> b!514345 (= res!314268 (validKeyInArray!0 (select (arr!15859 a!3235) j!176)))))

(declare-fun b!514346 () Bool)

(assert (=> b!514346 (= e!300341 (= (seekEntryOrOpen!0 (select (arr!15859 a!3235) j!176) a!3235 mask!3524) (Found!4326 j!176)))))

(assert (= (and start!46550 res!314276) b!514343))

(assert (= (and b!514343 res!314266) b!514345))

(assert (= (and b!514345 res!314268) b!514336))

(assert (= (and b!514336 res!314271) b!514339))

(assert (= (and b!514339 res!314275) b!514342))

(assert (= (and b!514342 res!314273) b!514341))

(assert (= (and b!514341 res!314267) b!514337))

(assert (= (and b!514337 res!314270) b!514338))

(assert (= (and b!514338 res!314274) b!514346))

(assert (= (and b!514338 (not res!314269)) b!514344))

(assert (= (and b!514344 (not res!314272)) b!514340))

(declare-fun m!495767 () Bool)

(assert (=> b!514346 m!495767))

(assert (=> b!514346 m!495767))

(declare-fun m!495769 () Bool)

(assert (=> b!514346 m!495769))

(declare-fun m!495771 () Bool)

(assert (=> b!514337 m!495771))

(declare-fun m!495773 () Bool)

(assert (=> b!514341 m!495773))

(declare-fun m!495775 () Bool)

(assert (=> b!514338 m!495775))

(declare-fun m!495777 () Bool)

(assert (=> b!514338 m!495777))

(declare-fun m!495779 () Bool)

(assert (=> b!514338 m!495779))

(declare-fun m!495781 () Bool)

(assert (=> b!514338 m!495781))

(assert (=> b!514338 m!495775))

(assert (=> b!514338 m!495767))

(declare-fun m!495783 () Bool)

(assert (=> b!514338 m!495783))

(assert (=> b!514338 m!495767))

(declare-fun m!495785 () Bool)

(assert (=> b!514338 m!495785))

(assert (=> b!514338 m!495767))

(declare-fun m!495787 () Bool)

(assert (=> b!514338 m!495787))

(assert (=> b!514338 m!495775))

(declare-fun m!495789 () Bool)

(assert (=> b!514338 m!495789))

(declare-fun m!495791 () Bool)

(assert (=> b!514340 m!495791))

(assert (=> b!514340 m!495767))

(assert (=> b!514345 m!495767))

(assert (=> b!514345 m!495767))

(declare-fun m!495793 () Bool)

(assert (=> b!514345 m!495793))

(declare-fun m!495795 () Bool)

(assert (=> start!46550 m!495795))

(declare-fun m!495797 () Bool)

(assert (=> start!46550 m!495797))

(declare-fun m!495799 () Bool)

(assert (=> b!514336 m!495799))

(declare-fun m!495801 () Bool)

(assert (=> b!514339 m!495801))

(declare-fun m!495803 () Bool)

(assert (=> b!514342 m!495803))

(check-sat (not b!514345) (not b!514346) (not b!514337) (not b!514339) (not b!514336) (not b!514341) (not b!514338) (not start!46550) (not b!514342))
(check-sat)
(get-model)

(declare-fun d!79359 () Bool)

(declare-fun lt!235492 () (_ BitVec 32))

(declare-fun lt!235491 () (_ BitVec 32))

(assert (=> d!79359 (= lt!235492 (bvmul (bvxor lt!235491 (bvlshr lt!235491 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79359 (= lt!235491 ((_ extract 31 0) (bvand (bvxor (select (arr!15859 a!3235) j!176) (bvlshr (select (arr!15859 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79359 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314310 (let ((h!10907 ((_ extract 31 0) (bvand (bvxor (select (arr!15859 a!3235) j!176) (bvlshr (select (arr!15859 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48455 (bvmul (bvxor h!10907 (bvlshr h!10907 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48455 (bvlshr x!48455 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314310 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314310 #b00000000000000000000000000000000))))))

(assert (=> d!79359 (= (toIndex!0 (select (arr!15859 a!3235) j!176) mask!3524) (bvand (bvxor lt!235492 (bvlshr lt!235492 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514338 d!79359))

(declare-fun bm!31598 () Bool)

(declare-fun call!31601 () Bool)

(assert (=> bm!31598 (= call!31601 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514388 () Bool)

(declare-fun e!300366 () Bool)

(declare-fun e!300364 () Bool)

(assert (=> b!514388 (= e!300366 e!300364)))

(declare-fun lt!235499 () (_ BitVec 64))

(assert (=> b!514388 (= lt!235499 (select (arr!15859 a!3235) j!176))))

(declare-fun lt!235501 () Unit!15910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32976 (_ BitVec 64) (_ BitVec 32)) Unit!15910)

(assert (=> b!514388 (= lt!235501 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235499 j!176))))

(assert (=> b!514388 (arrayContainsKey!0 a!3235 lt!235499 #b00000000000000000000000000000000)))

(declare-fun lt!235500 () Unit!15910)

(assert (=> b!514388 (= lt!235500 lt!235501)))

(declare-fun res!314315 () Bool)

(assert (=> b!514388 (= res!314315 (= (seekEntryOrOpen!0 (select (arr!15859 a!3235) j!176) a!3235 mask!3524) (Found!4326 j!176)))))

(assert (=> b!514388 (=> (not res!314315) (not e!300364))))

(declare-fun d!79361 () Bool)

(declare-fun res!314316 () Bool)

(declare-fun e!300365 () Bool)

(assert (=> d!79361 (=> res!314316 e!300365)))

(assert (=> d!79361 (= res!314316 (bvsge j!176 (size!16223 a!3235)))))

(assert (=> d!79361 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300365)))

(declare-fun b!514389 () Bool)

(assert (=> b!514389 (= e!300365 e!300366)))

(declare-fun c!60323 () Bool)

(assert (=> b!514389 (= c!60323 (validKeyInArray!0 (select (arr!15859 a!3235) j!176)))))

(declare-fun b!514390 () Bool)

(assert (=> b!514390 (= e!300366 call!31601)))

(declare-fun b!514391 () Bool)

(assert (=> b!514391 (= e!300364 call!31601)))

(assert (= (and d!79361 (not res!314316)) b!514389))

(assert (= (and b!514389 c!60323) b!514388))

(assert (= (and b!514389 (not c!60323)) b!514390))

(assert (= (and b!514388 res!314315) b!514391))

(assert (= (or b!514391 b!514390) bm!31598))

(declare-fun m!495843 () Bool)

(assert (=> bm!31598 m!495843))

(assert (=> b!514388 m!495767))

(declare-fun m!495845 () Bool)

(assert (=> b!514388 m!495845))

(declare-fun m!495847 () Bool)

(assert (=> b!514388 m!495847))

(assert (=> b!514388 m!495767))

(assert (=> b!514388 m!495769))

(assert (=> b!514389 m!495767))

(assert (=> b!514389 m!495767))

(assert (=> b!514389 m!495793))

(assert (=> b!514338 d!79361))

(declare-fun d!79363 () Bool)

(assert (=> d!79363 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235504 () Unit!15910)

(declare-fun choose!38 (array!32976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15910)

(assert (=> d!79363 (= lt!235504 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79363 (validMask!0 mask!3524)))

(assert (=> d!79363 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235504)))

(declare-fun bs!16267 () Bool)

(assert (= bs!16267 d!79363))

(assert (=> bs!16267 m!495785))

(declare-fun m!495849 () Bool)

(assert (=> bs!16267 m!495849))

(assert (=> bs!16267 m!495795))

(assert (=> b!514338 d!79363))

(declare-fun d!79365 () Bool)

(declare-fun lt!235506 () (_ BitVec 32))

(declare-fun lt!235505 () (_ BitVec 32))

(assert (=> d!79365 (= lt!235506 (bvmul (bvxor lt!235505 (bvlshr lt!235505 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79365 (= lt!235505 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79365 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314310 (let ((h!10907 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48455 (bvmul (bvxor h!10907 (bvlshr h!10907 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48455 (bvlshr x!48455 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314310 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314310 #b00000000000000000000000000000000))))))

(assert (=> d!79365 (= (toIndex!0 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235506 (bvlshr lt!235506 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514338 d!79365))

(declare-fun b!514410 () Bool)

(declare-fun e!300379 () SeekEntryResult!4326)

(assert (=> b!514410 (= e!300379 (Intermediate!4326 true lt!235471 #b00000000000000000000000000000000))))

(declare-fun b!514411 () Bool)

(declare-fun lt!235511 () SeekEntryResult!4326)

(assert (=> b!514411 (and (bvsge (index!19494 lt!235511) #b00000000000000000000000000000000) (bvslt (index!19494 lt!235511) (size!16223 a!3235)))))

(declare-fun res!314324 () Bool)

(assert (=> b!514411 (= res!314324 (= (select (arr!15859 a!3235) (index!19494 lt!235511)) (select (arr!15859 a!3235) j!176)))))

(declare-fun e!300377 () Bool)

(assert (=> b!514411 (=> res!314324 e!300377)))

(declare-fun e!300381 () Bool)

(assert (=> b!514411 (= e!300381 e!300377)))

(declare-fun b!514412 () Bool)

(assert (=> b!514412 (and (bvsge (index!19494 lt!235511) #b00000000000000000000000000000000) (bvslt (index!19494 lt!235511) (size!16223 a!3235)))))

(declare-fun res!314325 () Bool)

(assert (=> b!514412 (= res!314325 (= (select (arr!15859 a!3235) (index!19494 lt!235511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514412 (=> res!314325 e!300377)))

(declare-fun b!514413 () Bool)

(declare-fun e!300380 () SeekEntryResult!4326)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514413 (= e!300380 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235471 #b00000000000000000000000000000000 mask!3524) (select (arr!15859 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514414 () Bool)

(assert (=> b!514414 (and (bvsge (index!19494 lt!235511) #b00000000000000000000000000000000) (bvslt (index!19494 lt!235511) (size!16223 a!3235)))))

(assert (=> b!514414 (= e!300377 (= (select (arr!15859 a!3235) (index!19494 lt!235511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79367 () Bool)

(declare-fun e!300378 () Bool)

(assert (=> d!79367 e!300378))

(declare-fun c!60331 () Bool)

(assert (=> d!79367 (= c!60331 (and ((_ is Intermediate!4326) lt!235511) (undefined!5138 lt!235511)))))

(assert (=> d!79367 (= lt!235511 e!300379)))

(declare-fun c!60332 () Bool)

(assert (=> d!79367 (= c!60332 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235512 () (_ BitVec 64))

(assert (=> d!79367 (= lt!235512 (select (arr!15859 a!3235) lt!235471))))

(assert (=> d!79367 (validMask!0 mask!3524)))

(assert (=> d!79367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235471 (select (arr!15859 a!3235) j!176) a!3235 mask!3524) lt!235511)))

(declare-fun b!514415 () Bool)

(assert (=> b!514415 (= e!300378 e!300381)))

(declare-fun res!314323 () Bool)

(assert (=> b!514415 (= res!314323 (and ((_ is Intermediate!4326) lt!235511) (not (undefined!5138 lt!235511)) (bvslt (x!48453 lt!235511) #b01111111111111111111111111111110) (bvsge (x!48453 lt!235511) #b00000000000000000000000000000000) (bvsge (x!48453 lt!235511) #b00000000000000000000000000000000)))))

(assert (=> b!514415 (=> (not res!314323) (not e!300381))))

(declare-fun b!514416 () Bool)

(assert (=> b!514416 (= e!300380 (Intermediate!4326 false lt!235471 #b00000000000000000000000000000000))))

(declare-fun b!514417 () Bool)

(assert (=> b!514417 (= e!300378 (bvsge (x!48453 lt!235511) #b01111111111111111111111111111110))))

(declare-fun b!514418 () Bool)

(assert (=> b!514418 (= e!300379 e!300380)))

(declare-fun c!60330 () Bool)

(assert (=> b!514418 (= c!60330 (or (= lt!235512 (select (arr!15859 a!3235) j!176)) (= (bvadd lt!235512 lt!235512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79367 c!60332) b!514410))

(assert (= (and d!79367 (not c!60332)) b!514418))

(assert (= (and b!514418 c!60330) b!514416))

(assert (= (and b!514418 (not c!60330)) b!514413))

(assert (= (and d!79367 c!60331) b!514417))

(assert (= (and d!79367 (not c!60331)) b!514415))

(assert (= (and b!514415 res!314323) b!514411))

(assert (= (and b!514411 (not res!314324)) b!514412))

(assert (= (and b!514412 (not res!314325)) b!514414))

(declare-fun m!495851 () Bool)

(assert (=> d!79367 m!495851))

(assert (=> d!79367 m!495795))

(declare-fun m!495853 () Bool)

(assert (=> b!514412 m!495853))

(assert (=> b!514414 m!495853))

(assert (=> b!514411 m!495853))

(declare-fun m!495855 () Bool)

(assert (=> b!514413 m!495855))

(assert (=> b!514413 m!495855))

(assert (=> b!514413 m!495767))

(declare-fun m!495857 () Bool)

(assert (=> b!514413 m!495857))

(assert (=> b!514338 d!79367))

(declare-fun b!514419 () Bool)

(declare-fun e!300384 () SeekEntryResult!4326)

(assert (=> b!514419 (= e!300384 (Intermediate!4326 true lt!235468 #b00000000000000000000000000000000))))

(declare-fun lt!235513 () SeekEntryResult!4326)

(declare-fun b!514420 () Bool)

(assert (=> b!514420 (and (bvsge (index!19494 lt!235513) #b00000000000000000000000000000000) (bvslt (index!19494 lt!235513) (size!16223 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)))))))

(declare-fun res!314327 () Bool)

(assert (=> b!514420 (= res!314327 (= (select (arr!15859 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235))) (index!19494 lt!235513)) (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300382 () Bool)

(assert (=> b!514420 (=> res!314327 e!300382)))

(declare-fun e!300386 () Bool)

(assert (=> b!514420 (= e!300386 e!300382)))

(declare-fun b!514421 () Bool)

(assert (=> b!514421 (and (bvsge (index!19494 lt!235513) #b00000000000000000000000000000000) (bvslt (index!19494 lt!235513) (size!16223 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)))))))

(declare-fun res!314328 () Bool)

(assert (=> b!514421 (= res!314328 (= (select (arr!15859 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235))) (index!19494 lt!235513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514421 (=> res!314328 e!300382)))

(declare-fun b!514422 () Bool)

(declare-fun e!300385 () SeekEntryResult!4326)

(assert (=> b!514422 (= e!300385 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235468 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)) mask!3524))))

(declare-fun b!514423 () Bool)

(assert (=> b!514423 (and (bvsge (index!19494 lt!235513) #b00000000000000000000000000000000) (bvslt (index!19494 lt!235513) (size!16223 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)))))))

(assert (=> b!514423 (= e!300382 (= (select (arr!15859 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235))) (index!19494 lt!235513)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79373 () Bool)

(declare-fun e!300383 () Bool)

(assert (=> d!79373 e!300383))

(declare-fun c!60334 () Bool)

(assert (=> d!79373 (= c!60334 (and ((_ is Intermediate!4326) lt!235513) (undefined!5138 lt!235513)))))

(assert (=> d!79373 (= lt!235513 e!300384)))

(declare-fun c!60335 () Bool)

(assert (=> d!79373 (= c!60335 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235514 () (_ BitVec 64))

(assert (=> d!79373 (= lt!235514 (select (arr!15859 (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235))) lt!235468))))

(assert (=> d!79373 (validMask!0 mask!3524)))

(assert (=> d!79373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235468 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) (array!32977 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)) mask!3524) lt!235513)))

(declare-fun b!514424 () Bool)

(assert (=> b!514424 (= e!300383 e!300386)))

(declare-fun res!314326 () Bool)

(assert (=> b!514424 (= res!314326 (and ((_ is Intermediate!4326) lt!235513) (not (undefined!5138 lt!235513)) (bvslt (x!48453 lt!235513) #b01111111111111111111111111111110) (bvsge (x!48453 lt!235513) #b00000000000000000000000000000000) (bvsge (x!48453 lt!235513) #b00000000000000000000000000000000)))))

(assert (=> b!514424 (=> (not res!314326) (not e!300386))))

(declare-fun b!514425 () Bool)

(assert (=> b!514425 (= e!300385 (Intermediate!4326 false lt!235468 #b00000000000000000000000000000000))))

(declare-fun b!514426 () Bool)

(assert (=> b!514426 (= e!300383 (bvsge (x!48453 lt!235513) #b01111111111111111111111111111110))))

(declare-fun b!514427 () Bool)

(assert (=> b!514427 (= e!300384 e!300385)))

(declare-fun c!60333 () Bool)

(assert (=> b!514427 (= c!60333 (or (= lt!235514 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235514 lt!235514) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79373 c!60335) b!514419))

(assert (= (and d!79373 (not c!60335)) b!514427))

(assert (= (and b!514427 c!60333) b!514425))

(assert (= (and b!514427 (not c!60333)) b!514422))

(assert (= (and d!79373 c!60334) b!514426))

(assert (= (and d!79373 (not c!60334)) b!514424))

(assert (= (and b!514424 res!314326) b!514420))

(assert (= (and b!514420 (not res!314327)) b!514421))

(assert (= (and b!514421 (not res!314328)) b!514423))

(declare-fun m!495859 () Bool)

(assert (=> d!79373 m!495859))

(assert (=> d!79373 m!495795))

(declare-fun m!495861 () Bool)

(assert (=> b!514421 m!495861))

(assert (=> b!514423 m!495861))

(assert (=> b!514420 m!495861))

(declare-fun m!495863 () Bool)

(assert (=> b!514422 m!495863))

(assert (=> b!514422 m!495863))

(assert (=> b!514422 m!495775))

(declare-fun m!495865 () Bool)

(assert (=> b!514422 m!495865))

(assert (=> b!514338 d!79373))

(declare-fun d!79375 () Bool)

(declare-fun res!314334 () Bool)

(declare-fun e!300391 () Bool)

(assert (=> d!79375 (=> res!314334 e!300391)))

(assert (=> d!79375 (= res!314334 (= (select (arr!15859 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79375 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300391)))

(declare-fun b!514432 () Bool)

(declare-fun e!300392 () Bool)

(assert (=> b!514432 (= e!300391 e!300392)))

(declare-fun res!314335 () Bool)

(assert (=> b!514432 (=> (not res!314335) (not e!300392))))

(assert (=> b!514432 (= res!314335 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16223 a!3235)))))

(declare-fun b!514433 () Bool)

(assert (=> b!514433 (= e!300392 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79375 (not res!314334)) b!514432))

(assert (= (and b!514432 res!314335) b!514433))

(declare-fun m!495867 () Bool)

(assert (=> d!79375 m!495867))

(declare-fun m!495869 () Bool)

(assert (=> b!514433 m!495869))

(assert (=> b!514339 d!79375))

(declare-fun d!79377 () Bool)

(assert (=> d!79377 (= (validKeyInArray!0 (select (arr!15859 a!3235) j!176)) (and (not (= (select (arr!15859 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15859 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514345 d!79377))

(declare-fun d!79379 () Bool)

(declare-fun lt!235558 () SeekEntryResult!4326)

(assert (=> d!79379 (and (or ((_ is Undefined!4326) lt!235558) (not ((_ is Found!4326) lt!235558)) (and (bvsge (index!19493 lt!235558) #b00000000000000000000000000000000) (bvslt (index!19493 lt!235558) (size!16223 a!3235)))) (or ((_ is Undefined!4326) lt!235558) ((_ is Found!4326) lt!235558) (not ((_ is MissingZero!4326) lt!235558)) (and (bvsge (index!19492 lt!235558) #b00000000000000000000000000000000) (bvslt (index!19492 lt!235558) (size!16223 a!3235)))) (or ((_ is Undefined!4326) lt!235558) ((_ is Found!4326) lt!235558) ((_ is MissingZero!4326) lt!235558) (not ((_ is MissingVacant!4326) lt!235558)) (and (bvsge (index!19495 lt!235558) #b00000000000000000000000000000000) (bvslt (index!19495 lt!235558) (size!16223 a!3235)))) (or ((_ is Undefined!4326) lt!235558) (ite ((_ is Found!4326) lt!235558) (= (select (arr!15859 a!3235) (index!19493 lt!235558)) (select (arr!15859 a!3235) j!176)) (ite ((_ is MissingZero!4326) lt!235558) (= (select (arr!15859 a!3235) (index!19492 lt!235558)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4326) lt!235558) (= (select (arr!15859 a!3235) (index!19495 lt!235558)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300429 () SeekEntryResult!4326)

(assert (=> d!79379 (= lt!235558 e!300429)))

(declare-fun c!60357 () Bool)

(declare-fun lt!235557 () SeekEntryResult!4326)

(assert (=> d!79379 (= c!60357 (and ((_ is Intermediate!4326) lt!235557) (undefined!5138 lt!235557)))))

(assert (=> d!79379 (= lt!235557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15859 a!3235) j!176) mask!3524) (select (arr!15859 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79379 (validMask!0 mask!3524)))

(assert (=> d!79379 (= (seekEntryOrOpen!0 (select (arr!15859 a!3235) j!176) a!3235 mask!3524) lt!235558)))

(declare-fun b!514490 () Bool)

(declare-fun e!300431 () SeekEntryResult!4326)

(assert (=> b!514490 (= e!300429 e!300431)))

(declare-fun lt!235556 () (_ BitVec 64))

(assert (=> b!514490 (= lt!235556 (select (arr!15859 a!3235) (index!19494 lt!235557)))))

(declare-fun c!60356 () Bool)

(assert (=> b!514490 (= c!60356 (= lt!235556 (select (arr!15859 a!3235) j!176)))))

(declare-fun b!514491 () Bool)

(assert (=> b!514491 (= e!300429 Undefined!4326)))

(declare-fun e!300430 () SeekEntryResult!4326)

(declare-fun b!514492 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32976 (_ BitVec 32)) SeekEntryResult!4326)

(assert (=> b!514492 (= e!300430 (seekKeyOrZeroReturnVacant!0 (x!48453 lt!235557) (index!19494 lt!235557) (index!19494 lt!235557) (select (arr!15859 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514493 () Bool)

(assert (=> b!514493 (= e!300430 (MissingZero!4326 (index!19494 lt!235557)))))

(declare-fun b!514494 () Bool)

(declare-fun c!60358 () Bool)

(assert (=> b!514494 (= c!60358 (= lt!235556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514494 (= e!300431 e!300430)))

(declare-fun b!514495 () Bool)

(assert (=> b!514495 (= e!300431 (Found!4326 (index!19494 lt!235557)))))

(assert (= (and d!79379 c!60357) b!514491))

(assert (= (and d!79379 (not c!60357)) b!514490))

(assert (= (and b!514490 c!60356) b!514495))

(assert (= (and b!514490 (not c!60356)) b!514494))

(assert (= (and b!514494 c!60358) b!514493))

(assert (= (and b!514494 (not c!60358)) b!514492))

(assert (=> d!79379 m!495783))

(assert (=> d!79379 m!495767))

(declare-fun m!495895 () Bool)

(assert (=> d!79379 m!495895))

(assert (=> d!79379 m!495767))

(assert (=> d!79379 m!495783))

(declare-fun m!495897 () Bool)

(assert (=> d!79379 m!495897))

(declare-fun m!495899 () Bool)

(assert (=> d!79379 m!495899))

(assert (=> d!79379 m!495795))

(declare-fun m!495901 () Bool)

(assert (=> d!79379 m!495901))

(declare-fun m!495903 () Bool)

(assert (=> b!514490 m!495903))

(assert (=> b!514492 m!495767))

(declare-fun m!495905 () Bool)

(assert (=> b!514492 m!495905))

(assert (=> b!514346 d!79379))

(declare-fun d!79395 () Bool)

(assert (=> d!79395 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46550 d!79395))

(declare-fun d!79401 () Bool)

(assert (=> d!79401 (= (array_inv!11655 a!3235) (bvsge (size!16223 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46550 d!79401))

(declare-fun d!79403 () Bool)

(assert (=> d!79403 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514336 d!79403))

(declare-fun bm!31605 () Bool)

(declare-fun call!31608 () Bool)

(assert (=> bm!31605 (= call!31608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514524 () Bool)

(declare-fun e!300450 () Bool)

(declare-fun e!300448 () Bool)

(assert (=> b!514524 (= e!300450 e!300448)))

(declare-fun lt!235569 () (_ BitVec 64))

(assert (=> b!514524 (= lt!235569 (select (arr!15859 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235571 () Unit!15910)

(assert (=> b!514524 (= lt!235571 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235569 #b00000000000000000000000000000000))))

(assert (=> b!514524 (arrayContainsKey!0 a!3235 lt!235569 #b00000000000000000000000000000000)))

(declare-fun lt!235570 () Unit!15910)

(assert (=> b!514524 (= lt!235570 lt!235571)))

(declare-fun res!314360 () Bool)

(assert (=> b!514524 (= res!314360 (= (seekEntryOrOpen!0 (select (arr!15859 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4326 #b00000000000000000000000000000000)))))

(assert (=> b!514524 (=> (not res!314360) (not e!300448))))

(declare-fun d!79405 () Bool)

(declare-fun res!314361 () Bool)

(declare-fun e!300449 () Bool)

(assert (=> d!79405 (=> res!314361 e!300449)))

(assert (=> d!79405 (= res!314361 (bvsge #b00000000000000000000000000000000 (size!16223 a!3235)))))

(assert (=> d!79405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300449)))

(declare-fun b!514525 () Bool)

(assert (=> b!514525 (= e!300449 e!300450)))

(declare-fun c!60369 () Bool)

(assert (=> b!514525 (= c!60369 (validKeyInArray!0 (select (arr!15859 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514526 () Bool)

(assert (=> b!514526 (= e!300450 call!31608)))

(declare-fun b!514527 () Bool)

(assert (=> b!514527 (= e!300448 call!31608)))

(assert (= (and d!79405 (not res!314361)) b!514525))

(assert (= (and b!514525 c!60369) b!514524))

(assert (= (and b!514525 (not c!60369)) b!514526))

(assert (= (and b!514524 res!314360) b!514527))

(assert (= (or b!514527 b!514526) bm!31605))

(declare-fun m!495931 () Bool)

(assert (=> bm!31605 m!495931))

(assert (=> b!514524 m!495867))

(declare-fun m!495933 () Bool)

(assert (=> b!514524 m!495933))

(declare-fun m!495935 () Bool)

(assert (=> b!514524 m!495935))

(assert (=> b!514524 m!495867))

(declare-fun m!495937 () Bool)

(assert (=> b!514524 m!495937))

(assert (=> b!514525 m!495867))

(assert (=> b!514525 m!495867))

(declare-fun m!495939 () Bool)

(assert (=> b!514525 m!495939))

(assert (=> b!514341 d!79405))

(declare-fun d!79407 () Bool)

(declare-fun lt!235574 () SeekEntryResult!4326)

(assert (=> d!79407 (and (or ((_ is Undefined!4326) lt!235574) (not ((_ is Found!4326) lt!235574)) (and (bvsge (index!19493 lt!235574) #b00000000000000000000000000000000) (bvslt (index!19493 lt!235574) (size!16223 a!3235)))) (or ((_ is Undefined!4326) lt!235574) ((_ is Found!4326) lt!235574) (not ((_ is MissingZero!4326) lt!235574)) (and (bvsge (index!19492 lt!235574) #b00000000000000000000000000000000) (bvslt (index!19492 lt!235574) (size!16223 a!3235)))) (or ((_ is Undefined!4326) lt!235574) ((_ is Found!4326) lt!235574) ((_ is MissingZero!4326) lt!235574) (not ((_ is MissingVacant!4326) lt!235574)) (and (bvsge (index!19495 lt!235574) #b00000000000000000000000000000000) (bvslt (index!19495 lt!235574) (size!16223 a!3235)))) (or ((_ is Undefined!4326) lt!235574) (ite ((_ is Found!4326) lt!235574) (= (select (arr!15859 a!3235) (index!19493 lt!235574)) k0!2280) (ite ((_ is MissingZero!4326) lt!235574) (= (select (arr!15859 a!3235) (index!19492 lt!235574)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4326) lt!235574) (= (select (arr!15859 a!3235) (index!19495 lt!235574)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300451 () SeekEntryResult!4326)

(assert (=> d!79407 (= lt!235574 e!300451)))

(declare-fun c!60371 () Bool)

(declare-fun lt!235573 () SeekEntryResult!4326)

(assert (=> d!79407 (= c!60371 (and ((_ is Intermediate!4326) lt!235573) (undefined!5138 lt!235573)))))

(assert (=> d!79407 (= lt!235573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79407 (validMask!0 mask!3524)))

(assert (=> d!79407 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235574)))

(declare-fun b!514528 () Bool)

(declare-fun e!300453 () SeekEntryResult!4326)

(assert (=> b!514528 (= e!300451 e!300453)))

(declare-fun lt!235572 () (_ BitVec 64))

(assert (=> b!514528 (= lt!235572 (select (arr!15859 a!3235) (index!19494 lt!235573)))))

(declare-fun c!60370 () Bool)

(assert (=> b!514528 (= c!60370 (= lt!235572 k0!2280))))

(declare-fun b!514529 () Bool)

(assert (=> b!514529 (= e!300451 Undefined!4326)))

(declare-fun e!300452 () SeekEntryResult!4326)

(declare-fun b!514530 () Bool)

(assert (=> b!514530 (= e!300452 (seekKeyOrZeroReturnVacant!0 (x!48453 lt!235573) (index!19494 lt!235573) (index!19494 lt!235573) k0!2280 a!3235 mask!3524))))

(declare-fun b!514531 () Bool)

(assert (=> b!514531 (= e!300452 (MissingZero!4326 (index!19494 lt!235573)))))

(declare-fun b!514532 () Bool)

(declare-fun c!60372 () Bool)

(assert (=> b!514532 (= c!60372 (= lt!235572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514532 (= e!300453 e!300452)))

(declare-fun b!514533 () Bool)

(assert (=> b!514533 (= e!300453 (Found!4326 (index!19494 lt!235573)))))

(assert (= (and d!79407 c!60371) b!514529))

(assert (= (and d!79407 (not c!60371)) b!514528))

(assert (= (and b!514528 c!60370) b!514533))

(assert (= (and b!514528 (not c!60370)) b!514532))

(assert (= (and b!514532 c!60372) b!514531))

(assert (= (and b!514532 (not c!60372)) b!514530))

(declare-fun m!495941 () Bool)

(assert (=> d!79407 m!495941))

(declare-fun m!495943 () Bool)

(assert (=> d!79407 m!495943))

(assert (=> d!79407 m!495941))

(declare-fun m!495945 () Bool)

(assert (=> d!79407 m!495945))

(declare-fun m!495947 () Bool)

(assert (=> d!79407 m!495947))

(assert (=> d!79407 m!495795))

(declare-fun m!495949 () Bool)

(assert (=> d!79407 m!495949))

(declare-fun m!495951 () Bool)

(assert (=> b!514528 m!495951))

(declare-fun m!495953 () Bool)

(assert (=> b!514530 m!495953))

(assert (=> b!514342 d!79407))

(declare-fun bm!31608 () Bool)

(declare-fun call!31611 () Bool)

(declare-fun c!60381 () Bool)

(assert (=> bm!31608 (= call!31611 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60381 (Cons!10013 (select (arr!15859 a!3235) #b00000000000000000000000000000000) Nil!10014) Nil!10014)))))

(declare-fun b!514566 () Bool)

(declare-fun e!300478 () Bool)

(assert (=> b!514566 (= e!300478 call!31611)))

(declare-fun b!514567 () Bool)

(declare-fun e!300477 () Bool)

(assert (=> b!514567 (= e!300477 e!300478)))

(assert (=> b!514567 (= c!60381 (validKeyInArray!0 (select (arr!15859 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79409 () Bool)

(declare-fun res!314381 () Bool)

(declare-fun e!300476 () Bool)

(assert (=> d!79409 (=> res!314381 e!300476)))

(assert (=> d!79409 (= res!314381 (bvsge #b00000000000000000000000000000000 (size!16223 a!3235)))))

(assert (=> d!79409 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10014) e!300476)))

(declare-fun b!514568 () Bool)

(assert (=> b!514568 (= e!300476 e!300477)))

(declare-fun res!314380 () Bool)

(assert (=> b!514568 (=> (not res!314380) (not e!300477))))

(declare-fun e!300479 () Bool)

(assert (=> b!514568 (= res!314380 (not e!300479))))

(declare-fun res!314379 () Bool)

(assert (=> b!514568 (=> (not res!314379) (not e!300479))))

(assert (=> b!514568 (= res!314379 (validKeyInArray!0 (select (arr!15859 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514569 () Bool)

(assert (=> b!514569 (= e!300478 call!31611)))

(declare-fun b!514570 () Bool)

(declare-fun contains!2736 (List!10017 (_ BitVec 64)) Bool)

(assert (=> b!514570 (= e!300479 (contains!2736 Nil!10014 (select (arr!15859 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79409 (not res!314381)) b!514568))

(assert (= (and b!514568 res!314379) b!514570))

(assert (= (and b!514568 res!314380) b!514567))

(assert (= (and b!514567 c!60381) b!514569))

(assert (= (and b!514567 (not c!60381)) b!514566))

(assert (= (or b!514569 b!514566) bm!31608))

(assert (=> bm!31608 m!495867))

(declare-fun m!495971 () Bool)

(assert (=> bm!31608 m!495971))

(assert (=> b!514567 m!495867))

(assert (=> b!514567 m!495867))

(assert (=> b!514567 m!495939))

(assert (=> b!514568 m!495867))

(assert (=> b!514568 m!495867))

(assert (=> b!514568 m!495939))

(assert (=> b!514570 m!495867))

(assert (=> b!514570 m!495867))

(declare-fun m!495977 () Bool)

(assert (=> b!514570 m!495977))

(assert (=> b!514337 d!79409))

(check-sat (not b!514422) (not b!514413) (not bm!31605) (not b!514492) (not b!514568) (not b!514525) (not b!514530) (not d!79367) (not bm!31608) (not d!79363) (not b!514570) (not b!514389) (not d!79379) (not b!514388) (not b!514433) (not b!514524) (not b!514567) (not bm!31598) (not d!79373) (not d!79407))
(check-sat)
