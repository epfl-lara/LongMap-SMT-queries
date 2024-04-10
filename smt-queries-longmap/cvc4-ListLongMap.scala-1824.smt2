; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32954 () Bool)

(assert start!32954)

(declare-fun b!328452 () Bool)

(declare-fun e!201906 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328452 (= e!201906 (bvslt (bvsub #b01111111111111111111111111111110 x!1490) #b00000000000000000000000000000000))))

(declare-fun b!328453 () Bool)

(declare-fun res!180924 () Bool)

(declare-fun e!201907 () Bool)

(assert (=> b!328453 (=> (not res!180924) (not e!201907))))

(declare-datatypes ((array!16805 0))(
  ( (array!16806 (arr!7951 (Array (_ BitVec 32) (_ BitVec 64))) (size!8303 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16805)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16805 (_ BitVec 32)) Bool)

(assert (=> b!328453 (= res!180924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328454 () Bool)

(declare-fun res!180919 () Bool)

(assert (=> b!328454 (=> (not res!180919) (not e!201907))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328454 (= res!180919 (validKeyInArray!0 k!2497))))

(declare-fun b!328455 () Bool)

(assert (=> b!328455 (= e!201907 e!201906)))

(declare-fun res!180926 () Bool)

(assert (=> b!328455 (=> (not res!180926) (not e!201906))))

(declare-datatypes ((SeekEntryResult!3082 0))(
  ( (MissingZero!3082 (index!14504 (_ BitVec 32))) (Found!3082 (index!14505 (_ BitVec 32))) (Intermediate!3082 (undefined!3894 Bool) (index!14506 (_ BitVec 32)) (x!32763 (_ BitVec 32))) (Undefined!3082) (MissingVacant!3082 (index!14507 (_ BitVec 32))) )
))
(declare-fun lt!157914 () SeekEntryResult!3082)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16805 (_ BitVec 32)) SeekEntryResult!3082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328455 (= res!180926 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157914))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328455 (= lt!157914 (Intermediate!3082 false resIndex!58 resX!58))))

(declare-fun b!328456 () Bool)

(declare-fun res!180922 () Bool)

(assert (=> b!328456 (=> (not res!180922) (not e!201907))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328456 (= res!180922 (and (= (size!8303 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8303 a!3305))))))

(declare-fun b!328458 () Bool)

(declare-fun res!180923 () Bool)

(assert (=> b!328458 (=> (not res!180923) (not e!201907))))

(declare-fun arrayContainsKey!0 (array!16805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328458 (= res!180923 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!180920 () Bool)

(assert (=> start!32954 (=> (not res!180920) (not e!201907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32954 (= res!180920 (validMask!0 mask!3777))))

(assert (=> start!32954 e!201907))

(declare-fun array_inv!5914 (array!16805) Bool)

(assert (=> start!32954 (array_inv!5914 a!3305)))

(assert (=> start!32954 true))

(declare-fun b!328457 () Bool)

(declare-fun res!180927 () Bool)

(assert (=> b!328457 (=> (not res!180927) (not e!201906))))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!328457 (= res!180927 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157914))))

(declare-fun b!328459 () Bool)

(declare-fun res!180921 () Bool)

(assert (=> b!328459 (=> (not res!180921) (not e!201907))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16805 (_ BitVec 32)) SeekEntryResult!3082)

(assert (=> b!328459 (= res!180921 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3082 i!1250)))))

(declare-fun b!328460 () Bool)

(declare-fun res!180925 () Bool)

(assert (=> b!328460 (=> (not res!180925) (not e!201906))))

(assert (=> b!328460 (= res!180925 (and (= (select (arr!7951 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8303 a!3305))))))

(assert (= (and start!32954 res!180920) b!328456))

(assert (= (and b!328456 res!180922) b!328454))

(assert (= (and b!328454 res!180919) b!328458))

(assert (= (and b!328458 res!180923) b!328459))

(assert (= (and b!328459 res!180921) b!328453))

(assert (= (and b!328453 res!180924) b!328455))

(assert (= (and b!328455 res!180926) b!328460))

(assert (= (and b!328460 res!180925) b!328457))

(assert (= (and b!328457 res!180927) b!328452))

(declare-fun m!334425 () Bool)

(assert (=> b!328458 m!334425))

(declare-fun m!334427 () Bool)

(assert (=> start!32954 m!334427))

(declare-fun m!334429 () Bool)

(assert (=> start!32954 m!334429))

(declare-fun m!334431 () Bool)

(assert (=> b!328457 m!334431))

(declare-fun m!334433 () Bool)

(assert (=> b!328453 m!334433))

(declare-fun m!334435 () Bool)

(assert (=> b!328454 m!334435))

(declare-fun m!334437 () Bool)

(assert (=> b!328460 m!334437))

(declare-fun m!334439 () Bool)

(assert (=> b!328455 m!334439))

(assert (=> b!328455 m!334439))

(declare-fun m!334441 () Bool)

(assert (=> b!328455 m!334441))

(declare-fun m!334443 () Bool)

(assert (=> b!328459 m!334443))

(push 1)

(assert (not b!328453))

(assert (not b!328454))

(assert (not b!328455))

(assert (not b!328459))

(assert (not b!328458))

(assert (not start!32954))

(assert (not b!328457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70043 () Bool)

(assert (=> d!70043 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328454 d!70043))

(declare-fun b!328532 () Bool)

(declare-fun e!201954 () SeekEntryResult!3082)

(declare-fun e!201952 () SeekEntryResult!3082)

(assert (=> b!328532 (= e!201954 e!201952)))

(declare-fun c!51425 () Bool)

(declare-fun lt!157939 () (_ BitVec 64))

(assert (=> b!328532 (= c!51425 (or (= lt!157939 k!2497) (= (bvadd lt!157939 lt!157939) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328533 () Bool)

(assert (=> b!328533 (= e!201954 (Intermediate!3082 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328534 () Bool)

(declare-fun e!201956 () Bool)

(declare-fun lt!157938 () SeekEntryResult!3082)

(assert (=> b!328534 (= e!201956 (bvsge (x!32763 lt!157938) #b01111111111111111111111111111110))))

(declare-fun b!328535 () Bool)

(assert (=> b!328535 (and (bvsge (index!14506 lt!157938) #b00000000000000000000000000000000) (bvslt (index!14506 lt!157938) (size!8303 a!3305)))))

(declare-fun e!201953 () Bool)

(assert (=> b!328535 (= e!201953 (= (select (arr!7951 a!3305) (index!14506 lt!157938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328536 () Bool)

(assert (=> b!328536 (and (bvsge (index!14506 lt!157938) #b00000000000000000000000000000000) (bvslt (index!14506 lt!157938) (size!8303 a!3305)))))

(declare-fun res!180956 () Bool)

(assert (=> b!328536 (= res!180956 (= (select (arr!7951 a!3305) (index!14506 lt!157938)) k!2497))))

(assert (=> b!328536 (=> res!180956 e!201953)))

(declare-fun e!201955 () Bool)

(assert (=> b!328536 (= e!201955 e!201953)))

(declare-fun d!70045 () Bool)

(assert (=> d!70045 e!201956))

(declare-fun c!51427 () Bool)

(assert (=> d!70045 (= c!51427 (and (is-Intermediate!3082 lt!157938) (undefined!3894 lt!157938)))))

(assert (=> d!70045 (= lt!157938 e!201954)))

(declare-fun c!51426 () Bool)

(assert (=> d!70045 (= c!51426 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70045 (= lt!157939 (select (arr!7951 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70045 (validMask!0 mask!3777)))

(assert (=> d!70045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157938)))

(declare-fun b!328537 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328537 (= e!201952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328538 () Bool)

(assert (=> b!328538 (= e!201956 e!201955)))

(declare-fun res!180957 () Bool)

(assert (=> b!328538 (= res!180957 (and (is-Intermediate!3082 lt!157938) (not (undefined!3894 lt!157938)) (bvslt (x!32763 lt!157938) #b01111111111111111111111111111110) (bvsge (x!32763 lt!157938) #b00000000000000000000000000000000) (bvsge (x!32763 lt!157938) #b00000000000000000000000000000000)))))

(assert (=> b!328538 (=> (not res!180957) (not e!201955))))

(declare-fun b!328539 () Bool)

(assert (=> b!328539 (and (bvsge (index!14506 lt!157938) #b00000000000000000000000000000000) (bvslt (index!14506 lt!157938) (size!8303 a!3305)))))

(declare-fun res!180955 () Bool)

(assert (=> b!328539 (= res!180955 (= (select (arr!7951 a!3305) (index!14506 lt!157938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328539 (=> res!180955 e!201953)))

(declare-fun b!328540 () Bool)

(assert (=> b!328540 (= e!201952 (Intermediate!3082 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70045 c!51426) b!328533))

(assert (= (and d!70045 (not c!51426)) b!328532))

(assert (= (and b!328532 c!51425) b!328540))

(assert (= (and b!328532 (not c!51425)) b!328537))

(assert (= (and d!70045 c!51427) b!328534))

(assert (= (and d!70045 (not c!51427)) b!328538))

(assert (= (and b!328538 res!180957) b!328536))

(assert (= (and b!328536 (not res!180956)) b!328539))

(assert (= (and b!328539 (not res!180955)) b!328535))

(declare-fun m!334465 () Bool)

(assert (=> b!328539 m!334465))

(assert (=> b!328537 m!334439))

(declare-fun m!334467 () Bool)

(assert (=> b!328537 m!334467))

(assert (=> b!328537 m!334467))

(declare-fun m!334471 () Bool)

(assert (=> b!328537 m!334471))

(assert (=> b!328536 m!334465))

(assert (=> b!328535 m!334465))

(assert (=> d!70045 m!334439))

(declare-fun m!334475 () Bool)

(assert (=> d!70045 m!334475))

(assert (=> d!70045 m!334427))

(assert (=> b!328455 d!70045))

(declare-fun d!70053 () Bool)

(declare-fun lt!157947 () (_ BitVec 32))

(declare-fun lt!157946 () (_ BitVec 32))

(assert (=> d!70053 (= lt!157947 (bvmul (bvxor lt!157946 (bvlshr lt!157946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70053 (= lt!157946 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70053 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180964 (let ((h!5409 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32767 (bvmul (bvxor h!5409 (bvlshr h!5409 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32767 (bvlshr x!32767 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180964 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180964 #b00000000000000000000000000000000))))))

(assert (=> d!70053 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157947 (bvlshr lt!157947 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328455 d!70053))

(declare-fun b!328560 () Bool)

(declare-fun e!201970 () SeekEntryResult!3082)

(declare-fun e!201968 () SeekEntryResult!3082)

(assert (=> b!328560 (= e!201970 e!201968)))

(declare-fun c!51433 () Bool)

(declare-fun lt!157949 () (_ BitVec 64))

(assert (=> b!328560 (= c!51433 (or (= lt!157949 k!2497) (= (bvadd lt!157949 lt!157949) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328561 () Bool)

(assert (=> b!328561 (= e!201970 (Intermediate!3082 true index!1840 x!1490))))

(declare-fun b!328562 () Bool)

(declare-fun e!201972 () Bool)

(declare-fun lt!157948 () SeekEntryResult!3082)

(assert (=> b!328562 (= e!201972 (bvsge (x!32763 lt!157948) #b01111111111111111111111111111110))))

(declare-fun b!328563 () Bool)

(assert (=> b!328563 (and (bvsge (index!14506 lt!157948) #b00000000000000000000000000000000) (bvslt (index!14506 lt!157948) (size!8303 a!3305)))))

(declare-fun e!201969 () Bool)

(assert (=> b!328563 (= e!201969 (= (select (arr!7951 a!3305) (index!14506 lt!157948)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328564 () Bool)

(assert (=> b!328564 (and (bvsge (index!14506 lt!157948) #b00000000000000000000000000000000) (bvslt (index!14506 lt!157948) (size!8303 a!3305)))))

(declare-fun res!180969 () Bool)

(assert (=> b!328564 (= res!180969 (= (select (arr!7951 a!3305) (index!14506 lt!157948)) k!2497))))

(assert (=> b!328564 (=> res!180969 e!201969)))

(declare-fun e!201971 () Bool)

(assert (=> b!328564 (= e!201971 e!201969)))

(declare-fun d!70057 () Bool)

(assert (=> d!70057 e!201972))

(declare-fun c!51435 () Bool)

(assert (=> d!70057 (= c!51435 (and (is-Intermediate!3082 lt!157948) (undefined!3894 lt!157948)))))

(assert (=> d!70057 (= lt!157948 e!201970)))

(declare-fun c!51434 () Bool)

(assert (=> d!70057 (= c!51434 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70057 (= lt!157949 (select (arr!7951 a!3305) index!1840))))

(assert (=> d!70057 (validMask!0 mask!3777)))

(assert (=> d!70057 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157948)))

(declare-fun b!328565 () Bool)

(assert (=> b!328565 (= e!201968 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328566 () Bool)

(assert (=> b!328566 (= e!201972 e!201971)))

(declare-fun res!180970 () Bool)

(assert (=> b!328566 (= res!180970 (and (is-Intermediate!3082 lt!157948) (not (undefined!3894 lt!157948)) (bvslt (x!32763 lt!157948) #b01111111111111111111111111111110) (bvsge (x!32763 lt!157948) #b00000000000000000000000000000000) (bvsge (x!32763 lt!157948) x!1490)))))

(assert (=> b!328566 (=> (not res!180970) (not e!201971))))

(declare-fun b!328567 () Bool)

(assert (=> b!328567 (and (bvsge (index!14506 lt!157948) #b00000000000000000000000000000000) (bvslt (index!14506 lt!157948) (size!8303 a!3305)))))

(declare-fun res!180968 () Bool)

(assert (=> b!328567 (= res!180968 (= (select (arr!7951 a!3305) (index!14506 lt!157948)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328567 (=> res!180968 e!201969)))

(declare-fun b!328568 () Bool)

(assert (=> b!328568 (= e!201968 (Intermediate!3082 false index!1840 x!1490))))

(assert (= (and d!70057 c!51434) b!328561))

(assert (= (and d!70057 (not c!51434)) b!328560))

(assert (= (and b!328560 c!51433) b!328568))

(assert (= (and b!328560 (not c!51433)) b!328565))

(assert (= (and d!70057 c!51435) b!328562))

(assert (= (and d!70057 (not c!51435)) b!328566))

(assert (= (and b!328566 res!180970) b!328564))

(assert (= (and b!328564 (not res!180969)) b!328567))

(assert (= (and b!328567 (not res!180968)) b!328563))

(declare-fun m!334485 () Bool)

(assert (=> b!328567 m!334485))

(declare-fun m!334487 () Bool)

(assert (=> b!328565 m!334487))

(assert (=> b!328565 m!334487))

(declare-fun m!334489 () Bool)

(assert (=> b!328565 m!334489))

(assert (=> b!328564 m!334485))

(assert (=> b!328563 m!334485))

(declare-fun m!334491 () Bool)

(assert (=> d!70057 m!334491))

(assert (=> d!70057 m!334427))

(assert (=> b!328457 d!70057))

(declare-fun d!70059 () Bool)

(assert (=> d!70059 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32954 d!70059))

(declare-fun d!70071 () Bool)

(assert (=> d!70071 (= (array_inv!5914 a!3305) (bvsge (size!8303 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32954 d!70071))

(declare-fun d!70073 () Bool)

(declare-fun res!180994 () Bool)

(declare-fun e!202002 () Bool)

(assert (=> d!70073 (=> res!180994 e!202002)))

(assert (=> d!70073 (= res!180994 (= (select (arr!7951 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70073 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202002)))

(declare-fun b!328609 () Bool)

(declare-fun e!202003 () Bool)

(assert (=> b!328609 (= e!202002 e!202003)))

(declare-fun res!180995 () Bool)

(assert (=> b!328609 (=> (not res!180995) (not e!202003))))

(assert (=> b!328609 (= res!180995 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8303 a!3305)))))

(declare-fun b!328610 () Bool)

(assert (=> b!328610 (= e!202003 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70073 (not res!180994)) b!328609))

(assert (= (and b!328609 res!180995) b!328610))

(declare-fun m!334521 () Bool)

(assert (=> d!70073 m!334521))

(declare-fun m!334523 () Bool)

(assert (=> b!328610 m!334523))

(assert (=> b!328458 d!70073))

(declare-fun b!328619 () Bool)

(declare-fun e!202011 () Bool)

(declare-fun e!202012 () Bool)

(assert (=> b!328619 (= e!202011 e!202012)))

(declare-fun c!51447 () Bool)

(assert (=> b!328619 (= c!51447 (validKeyInArray!0 (select (arr!7951 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!328620 () Bool)

(declare-fun call!26134 () Bool)

(assert (=> b!328620 (= e!202012 call!26134)))

(declare-fun bm!26131 () Bool)

(assert (=> bm!26131 (= call!26134 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328622 () Bool)

(declare-fun e!202010 () Bool)

(assert (=> b!328622 (= e!202010 call!26134)))

(declare-fun d!70079 () Bool)

(declare-fun res!181001 () Bool)

(assert (=> d!70079 (=> res!181001 e!202011)))

(assert (=> d!70079 (= res!181001 (bvsge #b00000000000000000000000000000000 (size!8303 a!3305)))))

(assert (=> d!70079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202011)))

(declare-fun b!328621 () Bool)

(assert (=> b!328621 (= e!202012 e!202010)))

(declare-fun lt!157981 () (_ BitVec 64))

(assert (=> b!328621 (= lt!157981 (select (arr!7951 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10198 0))(
  ( (Unit!10199) )
))
(declare-fun lt!157982 () Unit!10198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16805 (_ BitVec 64) (_ BitVec 32)) Unit!10198)

(assert (=> b!328621 (= lt!157982 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157981 #b00000000000000000000000000000000))))

(assert (=> b!328621 (arrayContainsKey!0 a!3305 lt!157981 #b00000000000000000000000000000000)))

(declare-fun lt!157983 () Unit!10198)

