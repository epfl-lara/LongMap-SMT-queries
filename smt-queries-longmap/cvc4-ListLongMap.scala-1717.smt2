; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31596 () Bool)

(assert start!31596)

(declare-fun b!316234 () Bool)

(assert (=> b!316234 false))

(declare-datatypes ((array!16120 0))(
  ( (array!16121 (arr!7630 (Array (_ BitVec 32) (_ BitVec 64))) (size!7982 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16120)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2770 0))(
  ( (MissingZero!2770 (index!13256 (_ BitVec 32))) (Found!2770 (index!13257 (_ BitVec 32))) (Intermediate!2770 (undefined!3582 Bool) (index!13258 (_ BitVec 32)) (x!31496 (_ BitVec 32))) (Undefined!2770) (MissingVacant!2770 (index!13259 (_ BitVec 32))) )
))
(declare-fun lt!154482 () SeekEntryResult!2770)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16120 (_ BitVec 32)) SeekEntryResult!2770)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316234 (= lt!154482 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9777 0))(
  ( (Unit!9778) )
))
(declare-fun e!196701 () Unit!9777)

(declare-fun Unit!9779 () Unit!9777)

(assert (=> b!316234 (= e!196701 Unit!9779)))

(declare-fun b!316235 () Bool)

(declare-fun e!196699 () Bool)

(declare-fun e!196702 () Bool)

(assert (=> b!316235 (= e!196699 e!196702)))

(declare-fun res!171355 () Bool)

(assert (=> b!316235 (=> (not res!171355) (not e!196702))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154484 () SeekEntryResult!2770)

(declare-fun lt!154485 () SeekEntryResult!2770)

(assert (=> b!316235 (= res!171355 (and (= lt!154485 lt!154484) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7630 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(assert (=> b!316235 (= lt!154485 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316236 () Bool)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun e!196705 () Bool)

(assert (=> b!316236 (= e!196705 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293)) mask!3709) lt!154485))))

(declare-fun b!316237 () Bool)

(declare-fun res!171348 () Bool)

(declare-fun e!196703 () Bool)

(assert (=> b!316237 (=> (not res!171348) (not e!196703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316237 (= res!171348 (validKeyInArray!0 k!2441))))

(declare-fun res!171351 () Bool)

(assert (=> start!31596 (=> (not res!171351) (not e!196703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31596 (= res!171351 (validMask!0 mask!3709))))

(assert (=> start!31596 e!196703))

(declare-fun array_inv!5593 (array!16120) Bool)

(assert (=> start!31596 (array_inv!5593 a!3293)))

(assert (=> start!31596 true))

(declare-fun b!316238 () Bool)

(declare-fun e!196700 () Unit!9777)

(assert (=> b!316238 (= e!196700 e!196701)))

(declare-fun c!50060 () Bool)

(assert (=> b!316238 (= c!50060 (or (= (select (arr!7630 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7630 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316239 () Bool)

(declare-fun res!171353 () Bool)

(assert (=> b!316239 (=> (not res!171353) (not e!196703))))

(declare-fun arrayContainsKey!0 (array!16120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316239 (= res!171353 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316240 () Bool)

(assert (=> b!316240 (= e!196702 (not e!196705))))

(declare-fun res!171350 () Bool)

(assert (=> b!316240 (=> res!171350 e!196705)))

(assert (=> b!316240 (= res!171350 (not (= (select (arr!7630 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316240 (= index!1781 resIndex!52)))

(declare-fun lt!154483 () Unit!9777)

(assert (=> b!316240 (= lt!154483 e!196700)))

(declare-fun c!50061 () Bool)

(assert (=> b!316240 (= c!50061 (not (= resIndex!52 index!1781)))))

(declare-fun b!316241 () Bool)

(declare-fun res!171349 () Bool)

(assert (=> b!316241 (=> (not res!171349) (not e!196699))))

(assert (=> b!316241 (= res!171349 (and (= (select (arr!7630 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7982 a!3293))))))

(declare-fun b!316242 () Bool)

(declare-fun res!171356 () Bool)

(assert (=> b!316242 (=> (not res!171356) (not e!196703))))

(assert (=> b!316242 (= res!171356 (and (= (size!7982 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7982 a!3293))))))

(declare-fun b!316243 () Bool)

(assert (=> b!316243 (= e!196703 e!196699)))

(declare-fun res!171357 () Bool)

(assert (=> b!316243 (=> (not res!171357) (not e!196699))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316243 (= res!171357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154484))))

(assert (=> b!316243 (= lt!154484 (Intermediate!2770 false resIndex!52 resX!52))))

(declare-fun b!316244 () Bool)

(assert (=> b!316244 false))

(declare-fun Unit!9780 () Unit!9777)

(assert (=> b!316244 (= e!196701 Unit!9780)))

(declare-fun b!316245 () Bool)

(declare-fun res!171354 () Bool)

(assert (=> b!316245 (=> (not res!171354) (not e!196703))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16120 (_ BitVec 32)) SeekEntryResult!2770)

(assert (=> b!316245 (= res!171354 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2770 i!1240)))))

(declare-fun b!316246 () Bool)

(declare-fun res!171352 () Bool)

(assert (=> b!316246 (=> (not res!171352) (not e!196703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16120 (_ BitVec 32)) Bool)

(assert (=> b!316246 (= res!171352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316247 () Bool)

(declare-fun Unit!9781 () Unit!9777)

(assert (=> b!316247 (= e!196700 Unit!9781)))

(assert (= (and start!31596 res!171351) b!316242))

(assert (= (and b!316242 res!171356) b!316237))

(assert (= (and b!316237 res!171348) b!316239))

(assert (= (and b!316239 res!171353) b!316245))

(assert (= (and b!316245 res!171354) b!316246))

(assert (= (and b!316246 res!171352) b!316243))

(assert (= (and b!316243 res!171357) b!316241))

(assert (= (and b!316241 res!171349) b!316235))

(assert (= (and b!316235 res!171355) b!316240))

(assert (= (and b!316240 c!50061) b!316238))

(assert (= (and b!316240 (not c!50061)) b!316247))

(assert (= (and b!316238 c!50060) b!316244))

(assert (= (and b!316238 (not c!50060)) b!316234))

(assert (= (and b!316240 (not res!171350)) b!316236))

(declare-fun m!325205 () Bool)

(assert (=> b!316241 m!325205))

(declare-fun m!325207 () Bool)

(assert (=> b!316239 m!325207))

(declare-fun m!325209 () Bool)

(assert (=> b!316243 m!325209))

(assert (=> b!316243 m!325209))

(declare-fun m!325211 () Bool)

(assert (=> b!316243 m!325211))

(declare-fun m!325213 () Bool)

(assert (=> b!316236 m!325213))

(declare-fun m!325215 () Bool)

(assert (=> b!316236 m!325215))

(declare-fun m!325217 () Bool)

(assert (=> b!316234 m!325217))

(assert (=> b!316234 m!325217))

(declare-fun m!325219 () Bool)

(assert (=> b!316234 m!325219))

(declare-fun m!325221 () Bool)

(assert (=> b!316235 m!325221))

(declare-fun m!325223 () Bool)

(assert (=> b!316235 m!325223))

(declare-fun m!325225 () Bool)

(assert (=> b!316246 m!325225))

(assert (=> b!316238 m!325221))

(declare-fun m!325227 () Bool)

(assert (=> b!316237 m!325227))

(declare-fun m!325229 () Bool)

(assert (=> start!31596 m!325229))

(declare-fun m!325231 () Bool)

(assert (=> start!31596 m!325231))

(assert (=> b!316240 m!325221))

(declare-fun m!325233 () Bool)

(assert (=> b!316245 m!325233))

(push 1)

(assert (not start!31596))

(assert (not b!316237))

(assert (not b!316243))

(assert (not b!316234))

(assert (not b!316245))

(assert (not b!316246))

(assert (not b!316239))

(assert (not b!316235))

(assert (not b!316236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68981 () Bool)

(declare-fun res!171375 () Bool)

(declare-fun e!196730 () Bool)

(assert (=> d!68981 (=> res!171375 e!196730)))

(assert (=> d!68981 (= res!171375 (= (select (arr!7630 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68981 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!196730)))

(declare-fun b!316288 () Bool)

(declare-fun e!196731 () Bool)

(assert (=> b!316288 (= e!196730 e!196731)))

(declare-fun res!171376 () Bool)

(assert (=> b!316288 (=> (not res!171376) (not e!196731))))

(assert (=> b!316288 (= res!171376 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7982 a!3293)))))

(declare-fun b!316289 () Bool)

(assert (=> b!316289 (= e!196731 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68981 (not res!171375)) b!316288))

(assert (= (and b!316288 res!171376) b!316289))

(declare-fun m!325249 () Bool)

(assert (=> d!68981 m!325249))

(declare-fun m!325251 () Bool)

(assert (=> b!316289 m!325251))

(assert (=> b!316239 d!68981))

(declare-fun d!68987 () Bool)

(assert (=> d!68987 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316237 d!68987))

(declare-fun b!316335 () Bool)

(declare-fun e!196763 () SeekEntryResult!2770)

(assert (=> b!316335 (= e!196763 (Intermediate!2770 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68991 () Bool)

(declare-fun e!196759 () Bool)

(assert (=> d!68991 e!196759))

(declare-fun c!50089 () Bool)

(declare-fun lt!154513 () SeekEntryResult!2770)

(assert (=> d!68991 (= c!50089 (and (is-Intermediate!2770 lt!154513) (undefined!3582 lt!154513)))))

(declare-fun e!196761 () SeekEntryResult!2770)

(assert (=> d!68991 (= lt!154513 e!196761)))

(declare-fun c!50091 () Bool)

(assert (=> d!68991 (= c!50091 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154512 () (_ BitVec 64))

(assert (=> d!68991 (= lt!154512 (select (arr!7630 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68991 (validMask!0 mask!3709)))

(assert (=> d!68991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154513)))

(declare-fun b!316336 () Bool)

(assert (=> b!316336 (and (bvsge (index!13258 lt!154513) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154513) (size!7982 a!3293)))))

(declare-fun res!171392 () Bool)

(assert (=> b!316336 (= res!171392 (= (select (arr!7630 a!3293) (index!13258 lt!154513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196760 () Bool)

(assert (=> b!316336 (=> res!171392 e!196760)))

(declare-fun b!316337 () Bool)

(assert (=> b!316337 (= e!196763 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316338 () Bool)

(assert (=> b!316338 (and (bvsge (index!13258 lt!154513) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154513) (size!7982 a!3293)))))

(declare-fun res!171394 () Bool)

(assert (=> b!316338 (= res!171394 (= (select (arr!7630 a!3293) (index!13258 lt!154513)) k!2441))))

(assert (=> b!316338 (=> res!171394 e!196760)))

(declare-fun e!196762 () Bool)

(assert (=> b!316338 (= e!196762 e!196760)))

(declare-fun b!316339 () Bool)

(assert (=> b!316339 (= e!196759 e!196762)))

(declare-fun res!171393 () Bool)

(assert (=> b!316339 (= res!171393 (and (is-Intermediate!2770 lt!154513) (not (undefined!3582 lt!154513)) (bvslt (x!31496 lt!154513) #b01111111111111111111111111111110) (bvsge (x!31496 lt!154513) #b00000000000000000000000000000000) (bvsge (x!31496 lt!154513) #b00000000000000000000000000000000)))))

(assert (=> b!316339 (=> (not res!171393) (not e!196762))))

(declare-fun b!316340 () Bool)

(assert (=> b!316340 (= e!196759 (bvsge (x!31496 lt!154513) #b01111111111111111111111111111110))))

(declare-fun b!316341 () Bool)

(assert (=> b!316341 (= e!196761 e!196763)))

(declare-fun c!50090 () Bool)

(assert (=> b!316341 (= c!50090 (or (= lt!154512 k!2441) (= (bvadd lt!154512 lt!154512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316342 () Bool)

(assert (=> b!316342 (= e!196761 (Intermediate!2770 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316343 () Bool)

(assert (=> b!316343 (and (bvsge (index!13258 lt!154513) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154513) (size!7982 a!3293)))))

(assert (=> b!316343 (= e!196760 (= (select (arr!7630 a!3293) (index!13258 lt!154513)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68991 c!50091) b!316342))

(assert (= (and d!68991 (not c!50091)) b!316341))

(assert (= (and b!316341 c!50090) b!316335))

(assert (= (and b!316341 (not c!50090)) b!316337))

(assert (= (and d!68991 c!50089) b!316340))

(assert (= (and d!68991 (not c!50089)) b!316339))

(assert (= (and b!316339 res!171393) b!316338))

(assert (= (and b!316338 (not res!171394)) b!316336))

(assert (= (and b!316336 (not res!171392)) b!316343))

(declare-fun m!325261 () Bool)

(assert (=> b!316336 m!325261))

(assert (=> d!68991 m!325209))

(declare-fun m!325265 () Bool)

(assert (=> d!68991 m!325265))

(assert (=> d!68991 m!325229))

(assert (=> b!316337 m!325209))

(declare-fun m!325267 () Bool)

(assert (=> b!316337 m!325267))

(assert (=> b!316337 m!325267))

(declare-fun m!325271 () Bool)

(assert (=> b!316337 m!325271))

(assert (=> b!316338 m!325261))

(assert (=> b!316343 m!325261))

(assert (=> b!316243 d!68991))

(declare-fun d!68995 () Bool)

(declare-fun lt!154531 () (_ BitVec 32))

(declare-fun lt!154530 () (_ BitVec 32))

(assert (=> d!68995 (= lt!154531 (bvmul (bvxor lt!154530 (bvlshr lt!154530 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68995 (= lt!154530 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68995 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171398 (let ((h!5371 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31500 (bvmul (bvxor h!5371 (bvlshr h!5371 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31500 (bvlshr x!31500 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171398 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171398 #b00000000000000000000000000000000))))))

(assert (=> d!68995 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154531 (bvlshr lt!154531 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316243 d!68995))

(declare-fun d!69005 () Bool)

(declare-fun res!171416 () Bool)

(declare-fun e!196799 () Bool)

(assert (=> d!69005 (=> res!171416 e!196799)))

(assert (=> d!69005 (= res!171416 (bvsge #b00000000000000000000000000000000 (size!7982 a!3293)))))

(assert (=> d!69005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196799)))

(declare-fun bm!25999 () Bool)

(declare-fun call!26002 () Bool)

(assert (=> bm!25999 (= call!26002 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!316403 () Bool)

(declare-fun e!196798 () Bool)

(assert (=> b!316403 (= e!196798 call!26002)))

(declare-fun b!316404 () Bool)

(declare-fun e!196800 () Bool)

(assert (=> b!316404 (= e!196800 e!196798)))

(declare-fun lt!154542 () (_ BitVec 64))

(assert (=> b!316404 (= lt!154542 (select (arr!7630 a!3293) #b00000000000000000000000000000000))))

(declare-fun lt!154543 () Unit!9777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16120 (_ BitVec 64) (_ BitVec 32)) Unit!9777)

(assert (=> b!316404 (= lt!154543 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154542 #b00000000000000000000000000000000))))

(assert (=> b!316404 (arrayContainsKey!0 a!3293 lt!154542 #b00000000000000000000000000000000)))

(declare-fun lt!154544 () Unit!9777)

(assert (=> b!316404 (= lt!154544 lt!154543)))

(declare-fun res!171415 () Bool)

(assert (=> b!316404 (= res!171415 (= (seekEntryOrOpen!0 (select (arr!7630 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2770 #b00000000000000000000000000000000)))))

(assert (=> b!316404 (=> (not res!171415) (not e!196798))))

(declare-fun b!316405 () Bool)

(assert (=> b!316405 (= e!196799 e!196800)))

(declare-fun c!50112 () Bool)

(assert (=> b!316405 (= c!50112 (validKeyInArray!0 (select (arr!7630 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!316406 () Bool)

(assert (=> b!316406 (= e!196800 call!26002)))

(assert (= (and d!69005 (not res!171416)) b!316405))

(assert (= (and b!316405 c!50112) b!316404))

(assert (= (and b!316405 (not c!50112)) b!316406))

(assert (= (and b!316404 res!171415) b!316403))

(assert (= (or b!316403 b!316406) bm!25999))

(declare-fun m!325303 () Bool)

(assert (=> bm!25999 m!325303))

(assert (=> b!316404 m!325249))

(declare-fun m!325305 () Bool)

(assert (=> b!316404 m!325305))

(declare-fun m!325307 () Bool)

(assert (=> b!316404 m!325307))

(assert (=> b!316404 m!325249))

(declare-fun m!325309 () Bool)

(assert (=> b!316404 m!325309))

(assert (=> b!316405 m!325249))

(assert (=> b!316405 m!325249))

(declare-fun m!325311 () Bool)

(assert (=> b!316405 m!325311))

(assert (=> b!316246 d!69005))

(declare-fun b!316407 () Bool)

(declare-fun e!196805 () SeekEntryResult!2770)

(assert (=> b!316407 (= e!196805 (Intermediate!2770 false index!1781 x!1427))))

(declare-fun d!69013 () Bool)

(declare-fun e!196801 () Bool)

(assert (=> d!69013 e!196801))

(declare-fun c!50113 () Bool)

(declare-fun lt!154546 () SeekEntryResult!2770)

(assert (=> d!69013 (= c!50113 (and (is-Intermediate!2770 lt!154546) (undefined!3582 lt!154546)))))

(declare-fun e!196803 () SeekEntryResult!2770)

(assert (=> d!69013 (= lt!154546 e!196803)))

(declare-fun c!50115 () Bool)

(assert (=> d!69013 (= c!50115 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154545 () (_ BitVec 64))

(assert (=> d!69013 (= lt!154545 (select (arr!7630 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293))) index!1781))))

(assert (=> d!69013 (validMask!0 mask!3709)))

(assert (=> d!69013 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293)) mask!3709) lt!154546)))

(declare-fun b!316408 () Bool)

(assert (=> b!316408 (and (bvsge (index!13258 lt!154546) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154546) (size!7982 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293)))))))

(declare-fun res!171417 () Bool)

(assert (=> b!316408 (= res!171417 (= (select (arr!7630 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293))) (index!13258 lt!154546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196802 () Bool)

(assert (=> b!316408 (=> res!171417 e!196802)))

(declare-fun b!316409 () Bool)

(assert (=> b!316409 (= e!196805 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293)) mask!3709))))

(declare-fun b!316410 () Bool)

(assert (=> b!316410 (and (bvsge (index!13258 lt!154546) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154546) (size!7982 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293)))))))

(declare-fun res!171419 () Bool)

(assert (=> b!316410 (= res!171419 (= (select (arr!7630 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293))) (index!13258 lt!154546)) k!2441))))

(assert (=> b!316410 (=> res!171419 e!196802)))

(declare-fun e!196804 () Bool)

(assert (=> b!316410 (= e!196804 e!196802)))

(declare-fun b!316411 () Bool)

(assert (=> b!316411 (= e!196801 e!196804)))

(declare-fun res!171418 () Bool)

(assert (=> b!316411 (= res!171418 (and (is-Intermediate!2770 lt!154546) (not (undefined!3582 lt!154546)) (bvslt (x!31496 lt!154546) #b01111111111111111111111111111110) (bvsge (x!31496 lt!154546) #b00000000000000000000000000000000) (bvsge (x!31496 lt!154546) x!1427)))))

(assert (=> b!316411 (=> (not res!171418) (not e!196804))))

(declare-fun b!316412 () Bool)

(assert (=> b!316412 (= e!196801 (bvsge (x!31496 lt!154546) #b01111111111111111111111111111110))))

(declare-fun b!316413 () Bool)

(assert (=> b!316413 (= e!196803 e!196805)))

(declare-fun c!50114 () Bool)

(assert (=> b!316413 (= c!50114 (or (= lt!154545 k!2441) (= (bvadd lt!154545 lt!154545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316414 () Bool)

(assert (=> b!316414 (= e!196803 (Intermediate!2770 true index!1781 x!1427))))

(declare-fun b!316415 () Bool)

(assert (=> b!316415 (and (bvsge (index!13258 lt!154546) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154546) (size!7982 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293)))))))

(assert (=> b!316415 (= e!196802 (= (select (arr!7630 (array!16121 (store (arr!7630 a!3293) i!1240 k!2441) (size!7982 a!3293))) (index!13258 lt!154546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69013 c!50115) b!316414))

(assert (= (and d!69013 (not c!50115)) b!316413))

(assert (= (and b!316413 c!50114) b!316407))

(assert (= (and b!316413 (not c!50114)) b!316409))

(assert (= (and d!69013 c!50113) b!316412))

(assert (= (and d!69013 (not c!50113)) b!316411))

(assert (= (and b!316411 res!171418) b!316410))

(assert (= (and b!316410 (not res!171419)) b!316408))

(assert (= (and b!316408 (not res!171417)) b!316415))

(declare-fun m!325313 () Bool)

(assert (=> b!316408 m!325313))

(declare-fun m!325315 () Bool)

(assert (=> d!69013 m!325315))

(assert (=> d!69013 m!325229))

(assert (=> b!316409 m!325217))

(assert (=> b!316409 m!325217))

(declare-fun m!325317 () Bool)

(assert (=> b!316409 m!325317))

(assert (=> b!316410 m!325313))

(assert (=> b!316415 m!325313))

(assert (=> b!316236 d!69013))

(declare-fun d!69019 () Bool)

(assert (=> d!69019 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31596 d!69019))

(declare-fun d!69025 () Bool)

(assert (=> d!69025 (= (array_inv!5593 a!3293) (bvsge (size!7982 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31596 d!69025))

(declare-fun d!69027 () Bool)

(declare-fun lt!154584 () SeekEntryResult!2770)

(assert (=> d!69027 (and (or (is-Undefined!2770 lt!154584) (not (is-Found!2770 lt!154584)) (and (bvsge (index!13257 lt!154584) #b00000000000000000000000000000000) (bvslt (index!13257 lt!154584) (size!7982 a!3293)))) (or (is-Undefined!2770 lt!154584) (is-Found!2770 lt!154584) (not (is-MissingZero!2770 lt!154584)) (and (bvsge (index!13256 lt!154584) #b00000000000000000000000000000000) (bvslt (index!13256 lt!154584) (size!7982 a!3293)))) (or (is-Undefined!2770 lt!154584) (is-Found!2770 lt!154584) (is-MissingZero!2770 lt!154584) (not (is-MissingVacant!2770 lt!154584)) (and (bvsge (index!13259 lt!154584) #b00000000000000000000000000000000) (bvslt (index!13259 lt!154584) (size!7982 a!3293)))) (or (is-Undefined!2770 lt!154584) (ite (is-Found!2770 lt!154584) (= (select (arr!7630 a!3293) (index!13257 lt!154584)) k!2441) (ite (is-MissingZero!2770 lt!154584) (= (select (arr!7630 a!3293) (index!13256 lt!154584)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2770 lt!154584) (= (select (arr!7630 a!3293) (index!13259 lt!154584)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!196846 () SeekEntryResult!2770)

(assert (=> d!69027 (= lt!154584 e!196846)))

(declare-fun c!50134 () Bool)

(declare-fun lt!154585 () SeekEntryResult!2770)

(assert (=> d!69027 (= c!50134 (and (is-Intermediate!2770 lt!154585) (undefined!3582 lt!154585)))))

(assert (=> d!69027 (= lt!154585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69027 (validMask!0 mask!3709)))

(assert (=> d!69027 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154584)))

(declare-fun b!316476 () Bool)

(declare-fun e!196847 () SeekEntryResult!2770)

(assert (=> b!316476 (= e!196847 (Found!2770 (index!13258 lt!154585)))))

(declare-fun b!316477 () Bool)

(declare-fun e!196848 () SeekEntryResult!2770)

(assert (=> b!316477 (= e!196848 (MissingZero!2770 (index!13258 lt!154585)))))

(declare-fun b!316478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16120 (_ BitVec 32)) SeekEntryResult!2770)

(assert (=> b!316478 (= e!196848 (seekKeyOrZeroReturnVacant!0 (x!31496 lt!154585) (index!13258 lt!154585) (index!13258 lt!154585) k!2441 a!3293 mask!3709))))

(declare-fun b!316479 () Bool)

(assert (=> b!316479 (= e!196846 Undefined!2770)))

(declare-fun b!316480 () Bool)

(declare-fun c!50136 () Bool)

(declare-fun lt!154586 () (_ BitVec 64))

(assert (=> b!316480 (= c!50136 (= lt!154586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316480 (= e!196847 e!196848)))

(declare-fun b!316481 () Bool)

(assert (=> b!316481 (= e!196846 e!196847)))

(assert (=> b!316481 (= lt!154586 (select (arr!7630 a!3293) (index!13258 lt!154585)))))

(declare-fun c!50135 () Bool)

(assert (=> b!316481 (= c!50135 (= lt!154586 k!2441))))

(assert (= (and d!69027 c!50134) b!316479))

(assert (= (and d!69027 (not c!50134)) b!316481))

(assert (= (and b!316481 c!50135) b!316476))

(assert (= (and b!316481 (not c!50135)) b!316480))

(assert (= (and b!316480 c!50136) b!316477))

(assert (= (and b!316480 (not c!50136)) b!316478))

(assert (=> d!69027 m!325229))

(assert (=> d!69027 m!325209))

(assert (=> d!69027 m!325211))

(assert (=> d!69027 m!325209))

(declare-fun m!325357 () Bool)

(assert (=> d!69027 m!325357))

(declare-fun m!325359 () Bool)

(assert (=> d!69027 m!325359))

(declare-fun m!325361 () Bool)

(assert (=> d!69027 m!325361))

(declare-fun m!325363 () Bool)

(assert (=> b!316478 m!325363))

(declare-fun m!325365 () Bool)

(assert (=> b!316481 m!325365))

(assert (=> b!316245 d!69027))

(declare-fun e!196853 () SeekEntryResult!2770)

(declare-fun b!316482 () Bool)

(assert (=> b!316482 (= e!196853 (Intermediate!2770 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!69041 () Bool)

(declare-fun e!196849 () Bool)

(assert (=> d!69041 e!196849))

(declare-fun c!50137 () Bool)

(declare-fun lt!154588 () SeekEntryResult!2770)

(assert (=> d!69041 (= c!50137 (and (is-Intermediate!2770 lt!154588) (undefined!3582 lt!154588)))))

(declare-fun e!196851 () SeekEntryResult!2770)

(assert (=> d!69041 (= lt!154588 e!196851)))

(declare-fun c!50139 () Bool)

(assert (=> d!69041 (= c!50139 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154587 () (_ BitVec 64))

(assert (=> d!69041 (= lt!154587 (select (arr!7630 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!69041 (validMask!0 mask!3709)))

(assert (=> d!69041 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154588)))

(declare-fun b!316483 () Bool)

(assert (=> b!316483 (and (bvsge (index!13258 lt!154588) #b00000000000000000000000000000000) (bvslt (index!13258 lt!154588) (size!7982 a!3293)))))

(declare-fun res!171445 () Bool)

(assert (=> b!316483 (= res!171445 (= (select (arr!7630 a!3293) (index!13258 lt!154588)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196850 () Bool)

(assert (=> b!316483 (=> res!171445 e!196850)))

(declare-fun b!316484 () Bool)

(assert (=> b!316484 (= e!196853 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316485 () Bool)

