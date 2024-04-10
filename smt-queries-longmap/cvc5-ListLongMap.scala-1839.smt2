; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33298 () Bool)

(assert start!33298)

(declare-fun b!331134 () Bool)

(declare-fun res!182538 () Bool)

(declare-fun e!203159 () Bool)

(assert (=> b!331134 (=> (not res!182538) (not e!203159))))

(declare-datatypes ((array!16906 0))(
  ( (array!16907 (arr!7994 (Array (_ BitVec 32) (_ BitVec 64))) (size!8346 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16906)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3125 0))(
  ( (MissingZero!3125 (index!14676 (_ BitVec 32))) (Found!3125 (index!14677 (_ BitVec 32))) (Intermediate!3125 (undefined!3937 Bool) (index!14678 (_ BitVec 32)) (x!32965 (_ BitVec 32))) (Undefined!3125) (MissingVacant!3125 (index!14679 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16906 (_ BitVec 32)) SeekEntryResult!3125)

(assert (=> b!331134 (= res!182538 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3125 i!1250)))))

(declare-fun b!331135 () Bool)

(declare-fun res!182543 () Bool)

(declare-fun e!203161 () Bool)

(assert (=> b!331135 (=> (not res!182543) (not e!203161))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!331135 (= res!182543 (and (= (select (arr!7994 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8346 a!3305))))))

(declare-fun res!182537 () Bool)

(assert (=> start!33298 (=> (not res!182537) (not e!203159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33298 (= res!182537 (validMask!0 mask!3777))))

(assert (=> start!33298 e!203159))

(declare-fun array_inv!5957 (array!16906) Bool)

(assert (=> start!33298 (array_inv!5957 a!3305)))

(assert (=> start!33298 true))

(declare-fun b!331136 () Bool)

(declare-fun e!203158 () Bool)

(assert (=> b!331136 (= e!203161 e!203158)))

(declare-fun res!182541 () Bool)

(assert (=> b!331136 (=> (not res!182541) (not e!203158))))

(declare-fun lt!158724 () SeekEntryResult!3125)

(declare-fun lt!158723 () SeekEntryResult!3125)

(assert (=> b!331136 (= res!182541 (and (= lt!158723 lt!158724) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7994 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16906 (_ BitVec 32)) SeekEntryResult!3125)

(assert (=> b!331136 (= lt!158723 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!331137 () Bool)

(assert (=> b!331137 (= e!203158 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)) mask!3777) lt!158723)))))

(declare-datatypes ((Unit!10329 0))(
  ( (Unit!10330) )
))
(declare-fun lt!158722 () Unit!10329)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16906 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10329)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331137 (= lt!158722 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331138 () Bool)

(declare-fun res!182542 () Bool)

(assert (=> b!331138 (=> (not res!182542) (not e!203159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331138 (= res!182542 (validKeyInArray!0 k!2497))))

(declare-fun b!331139 () Bool)

(declare-fun res!182536 () Bool)

(assert (=> b!331139 (=> (not res!182536) (not e!203159))))

(declare-fun arrayContainsKey!0 (array!16906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331139 (= res!182536 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!331140 () Bool)

(declare-fun res!182544 () Bool)

(assert (=> b!331140 (=> (not res!182544) (not e!203159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16906 (_ BitVec 32)) Bool)

(assert (=> b!331140 (= res!182544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331141 () Bool)

(assert (=> b!331141 (= e!203159 e!203161)))

(declare-fun res!182540 () Bool)

(assert (=> b!331141 (=> (not res!182540) (not e!203161))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331141 (= res!182540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158724))))

(assert (=> b!331141 (= lt!158724 (Intermediate!3125 false resIndex!58 resX!58))))

(declare-fun b!331142 () Bool)

(declare-fun res!182539 () Bool)

(assert (=> b!331142 (=> (not res!182539) (not e!203159))))

(assert (=> b!331142 (= res!182539 (and (= (size!8346 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8346 a!3305))))))

(assert (= (and start!33298 res!182537) b!331142))

(assert (= (and b!331142 res!182539) b!331138))

(assert (= (and b!331138 res!182542) b!331139))

(assert (= (and b!331139 res!182536) b!331134))

(assert (= (and b!331134 res!182538) b!331140))

(assert (= (and b!331140 res!182544) b!331141))

(assert (= (and b!331141 res!182540) b!331135))

(assert (= (and b!331135 res!182543) b!331136))

(assert (= (and b!331136 res!182541) b!331137))

(declare-fun m!336131 () Bool)

(assert (=> b!331141 m!336131))

(assert (=> b!331141 m!336131))

(declare-fun m!336133 () Bool)

(assert (=> b!331141 m!336133))

(declare-fun m!336135 () Bool)

(assert (=> b!331138 m!336135))

(declare-fun m!336137 () Bool)

(assert (=> b!331135 m!336137))

(declare-fun m!336139 () Bool)

(assert (=> b!331139 m!336139))

(declare-fun m!336141 () Bool)

(assert (=> b!331140 m!336141))

(declare-fun m!336143 () Bool)

(assert (=> b!331134 m!336143))

(declare-fun m!336145 () Bool)

(assert (=> start!33298 m!336145))

(declare-fun m!336147 () Bool)

(assert (=> start!33298 m!336147))

(declare-fun m!336149 () Bool)

(assert (=> b!331137 m!336149))

(declare-fun m!336151 () Bool)

(assert (=> b!331137 m!336151))

(declare-fun m!336153 () Bool)

(assert (=> b!331137 m!336153))

(assert (=> b!331137 m!336153))

(declare-fun m!336155 () Bool)

(assert (=> b!331137 m!336155))

(declare-fun m!336157 () Bool)

(assert (=> b!331136 m!336157))

(declare-fun m!336159 () Bool)

(assert (=> b!331136 m!336159))

(push 1)

(assert (not b!331138))

(assert (not b!331137))

(assert (not start!33298))

(assert (not b!331140))

(assert (not b!331136))

(assert (not b!331139))

(assert (not b!331141))

(assert (not b!331134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!331247 () Bool)

(declare-fun e!203219 () Bool)

(declare-fun e!203218 () Bool)

(assert (=> b!331247 (= e!203219 e!203218)))

(declare-fun lt!158763 () (_ BitVec 64))

(assert (=> b!331247 (= lt!158763 (select (arr!7994 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158764 () Unit!10329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16906 (_ BitVec 64) (_ BitVec 32)) Unit!10329)

(assert (=> b!331247 (= lt!158764 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158763 #b00000000000000000000000000000000))))

(assert (=> b!331247 (arrayContainsKey!0 a!3305 lt!158763 #b00000000000000000000000000000000)))

(declare-fun lt!158765 () Unit!10329)

(assert (=> b!331247 (= lt!158765 lt!158764)))

(declare-fun res!182622 () Bool)

(assert (=> b!331247 (= res!182622 (= (seekEntryOrOpen!0 (select (arr!7994 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3125 #b00000000000000000000000000000000)))))

(assert (=> b!331247 (=> (not res!182622) (not e!203218))))

(declare-fun bm!26170 () Bool)

(declare-fun call!26173 () Bool)

(assert (=> bm!26170 (= call!26173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!331248 () Bool)

(assert (=> b!331248 (= e!203219 call!26173)))

(declare-fun b!331249 () Bool)

(assert (=> b!331249 (= e!203218 call!26173)))

(declare-fun b!331250 () Bool)

(declare-fun e!203220 () Bool)

(assert (=> b!331250 (= e!203220 e!203219)))

(declare-fun c!51957 () Bool)

(assert (=> b!331250 (= c!51957 (validKeyInArray!0 (select (arr!7994 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!70377 () Bool)

(declare-fun res!182623 () Bool)

(assert (=> d!70377 (=> res!182623 e!203220)))

(assert (=> d!70377 (= res!182623 (bvsge #b00000000000000000000000000000000 (size!8346 a!3305)))))

(assert (=> d!70377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!203220)))

(assert (= (and d!70377 (not res!182623)) b!331250))

(assert (= (and b!331250 c!51957) b!331247))

(assert (= (and b!331250 (not c!51957)) b!331248))

(assert (= (and b!331247 res!182622) b!331249))

(assert (= (or b!331249 b!331248) bm!26170))

(declare-fun m!336239 () Bool)

(assert (=> b!331247 m!336239))

(declare-fun m!336241 () Bool)

(assert (=> b!331247 m!336241))

(declare-fun m!336243 () Bool)

(assert (=> b!331247 m!336243))

(assert (=> b!331247 m!336239))

(declare-fun m!336245 () Bool)

(assert (=> b!331247 m!336245))

(declare-fun m!336247 () Bool)

(assert (=> bm!26170 m!336247))

(assert (=> b!331250 m!336239))

(assert (=> b!331250 m!336239))

(declare-fun m!336249 () Bool)

(assert (=> b!331250 m!336249))

(assert (=> b!331140 d!70377))

(declare-fun b!331291 () Bool)

(declare-fun e!203244 () SeekEntryResult!3125)

(assert (=> b!331291 (= e!203244 (Intermediate!3125 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!331292 () Bool)

(declare-fun lt!158781 () SeekEntryResult!3125)

(assert (=> b!331292 (and (bvsge (index!14678 lt!158781) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158781) (size!8346 a!3305)))))

(declare-fun res!182634 () Bool)

(assert (=> b!331292 (= res!182634 (= (select (arr!7994 a!3305) (index!14678 lt!158781)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203247 () Bool)

(assert (=> b!331292 (=> res!182634 e!203247)))

(declare-fun b!331293 () Bool)

(declare-fun e!203245 () SeekEntryResult!3125)

(assert (=> b!331293 (= e!203245 (Intermediate!3125 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!331294 () Bool)

(declare-fun e!203246 () Bool)

(assert (=> b!331294 (= e!203246 (bvsge (x!32965 lt!158781) #b01111111111111111111111111111110))))

(declare-fun b!331295 () Bool)

(assert (=> b!331295 (= e!203245 e!203244)))

(declare-fun c!51974 () Bool)

(declare-fun lt!158780 () (_ BitVec 64))

(assert (=> b!331295 (= c!51974 (or (= lt!158780 k!2497) (= (bvadd lt!158780 lt!158780) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331296 () Bool)

(assert (=> b!331296 (and (bvsge (index!14678 lt!158781) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158781) (size!8346 a!3305)))))

(declare-fun res!182632 () Bool)

(assert (=> b!331296 (= res!182632 (= (select (arr!7994 a!3305) (index!14678 lt!158781)) k!2497))))

(assert (=> b!331296 (=> res!182632 e!203247)))

(declare-fun e!203243 () Bool)

(assert (=> b!331296 (= e!203243 e!203247)))

(declare-fun d!70385 () Bool)

(assert (=> d!70385 e!203246))

(declare-fun c!51976 () Bool)

(assert (=> d!70385 (= c!51976 (and (is-Intermediate!3125 lt!158781) (undefined!3937 lt!158781)))))

(assert (=> d!70385 (= lt!158781 e!203245)))

(declare-fun c!51975 () Bool)

(assert (=> d!70385 (= c!51975 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70385 (= lt!158780 (select (arr!7994 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70385 (validMask!0 mask!3777)))

(assert (=> d!70385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158781)))

(declare-fun b!331297 () Bool)

(assert (=> b!331297 (= e!203244 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!331298 () Bool)

(assert (=> b!331298 (and (bvsge (index!14678 lt!158781) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158781) (size!8346 a!3305)))))

(assert (=> b!331298 (= e!203247 (= (select (arr!7994 a!3305) (index!14678 lt!158781)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331299 () Bool)

(assert (=> b!331299 (= e!203246 e!203243)))

(declare-fun res!182633 () Bool)

(assert (=> b!331299 (= res!182633 (and (is-Intermediate!3125 lt!158781) (not (undefined!3937 lt!158781)) (bvslt (x!32965 lt!158781) #b01111111111111111111111111111110) (bvsge (x!32965 lt!158781) #b00000000000000000000000000000000) (bvsge (x!32965 lt!158781) #b00000000000000000000000000000000)))))

(assert (=> b!331299 (=> (not res!182633) (not e!203243))))

(assert (= (and d!70385 c!51975) b!331293))

(assert (= (and d!70385 (not c!51975)) b!331295))

(assert (= (and b!331295 c!51974) b!331291))

(assert (= (and b!331295 (not c!51974)) b!331297))

(assert (= (and d!70385 c!51976) b!331294))

(assert (= (and d!70385 (not c!51976)) b!331299))

(assert (= (and b!331299 res!182633) b!331296))

(assert (= (and b!331296 (not res!182632)) b!331292))

(assert (= (and b!331292 (not res!182634)) b!331298))

(assert (=> b!331297 m!336131))

(declare-fun m!336251 () Bool)

(assert (=> b!331297 m!336251))

(assert (=> b!331297 m!336251))

(declare-fun m!336253 () Bool)

(assert (=> b!331297 m!336253))

(declare-fun m!336255 () Bool)

(assert (=> b!331292 m!336255))

(assert (=> b!331298 m!336255))

(assert (=> b!331296 m!336255))

(assert (=> d!70385 m!336131))

(declare-fun m!336257 () Bool)

(assert (=> d!70385 m!336257))

(assert (=> d!70385 m!336145))

(assert (=> b!331141 d!70385))

(declare-fun d!70389 () Bool)

(declare-fun lt!158794 () (_ BitVec 32))

(declare-fun lt!158793 () (_ BitVec 32))

(assert (=> d!70389 (= lt!158794 (bvmul (bvxor lt!158793 (bvlshr lt!158793 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70389 (= lt!158793 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70389 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182635 (let ((h!5425 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32972 (bvmul (bvxor h!5425 (bvlshr h!5425 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32972 (bvlshr x!32972 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182635 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182635 #b00000000000000000000000000000000))))))

(assert (=> d!70389 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158794 (bvlshr lt!158794 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!331141 d!70389))

(declare-fun d!70393 () Bool)

(declare-fun res!182641 () Bool)

(declare-fun e!203258 () Bool)

(assert (=> d!70393 (=> res!182641 e!203258)))

(assert (=> d!70393 (= res!182641 (= (select (arr!7994 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70393 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!203258)))

(declare-fun b!331315 () Bool)

(declare-fun e!203259 () Bool)

(assert (=> b!331315 (= e!203258 e!203259)))

(declare-fun res!182642 () Bool)

(assert (=> b!331315 (=> (not res!182642) (not e!203259))))

(assert (=> b!331315 (= res!182642 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8346 a!3305)))))

(declare-fun b!331316 () Bool)

(assert (=> b!331316 (= e!203259 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70393 (not res!182641)) b!331315))

(assert (= (and b!331315 res!182642) b!331316))

(assert (=> d!70393 m!336239))

(declare-fun m!336273 () Bool)

(assert (=> b!331316 m!336273))

(assert (=> b!331139 d!70393))

(declare-fun b!331347 () Bool)

(declare-fun e!203277 () SeekEntryResult!3125)

(declare-fun e!203276 () SeekEntryResult!3125)

(assert (=> b!331347 (= e!203277 e!203276)))

(declare-fun lt!158811 () (_ BitVec 64))

(declare-fun lt!158812 () SeekEntryResult!3125)

(assert (=> b!331347 (= lt!158811 (select (arr!7994 a!3305) (index!14678 lt!158812)))))

(declare-fun c!51999 () Bool)

(assert (=> b!331347 (= c!51999 (= lt!158811 k!2497))))

(declare-fun e!203275 () SeekEntryResult!3125)

(declare-fun b!331348 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16906 (_ BitVec 32)) SeekEntryResult!3125)

(assert (=> b!331348 (= e!203275 (seekKeyOrZeroReturnVacant!0 (x!32965 lt!158812) (index!14678 lt!158812) (index!14678 lt!158812) k!2497 a!3305 mask!3777))))

(declare-fun b!331349 () Bool)

(declare-fun c!51998 () Bool)

(assert (=> b!331349 (= c!51998 (= lt!158811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!331349 (= e!203276 e!203275)))

(declare-fun d!70397 () Bool)

(declare-fun lt!158813 () SeekEntryResult!3125)

(assert (=> d!70397 (and (or (is-Undefined!3125 lt!158813) (not (is-Found!3125 lt!158813)) (and (bvsge (index!14677 lt!158813) #b00000000000000000000000000000000) (bvslt (index!14677 lt!158813) (size!8346 a!3305)))) (or (is-Undefined!3125 lt!158813) (is-Found!3125 lt!158813) (not (is-MissingZero!3125 lt!158813)) (and (bvsge (index!14676 lt!158813) #b00000000000000000000000000000000) (bvslt (index!14676 lt!158813) (size!8346 a!3305)))) (or (is-Undefined!3125 lt!158813) (is-Found!3125 lt!158813) (is-MissingZero!3125 lt!158813) (not (is-MissingVacant!3125 lt!158813)) (and (bvsge (index!14679 lt!158813) #b00000000000000000000000000000000) (bvslt (index!14679 lt!158813) (size!8346 a!3305)))) (or (is-Undefined!3125 lt!158813) (ite (is-Found!3125 lt!158813) (= (select (arr!7994 a!3305) (index!14677 lt!158813)) k!2497) (ite (is-MissingZero!3125 lt!158813) (= (select (arr!7994 a!3305) (index!14676 lt!158813)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3125 lt!158813) (= (select (arr!7994 a!3305) (index!14679 lt!158813)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70397 (= lt!158813 e!203277)))

(declare-fun c!51997 () Bool)

(assert (=> d!70397 (= c!51997 (and (is-Intermediate!3125 lt!158812) (undefined!3937 lt!158812)))))

(assert (=> d!70397 (= lt!158812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70397 (validMask!0 mask!3777)))

(assert (=> d!70397 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158813)))

(declare-fun b!331350 () Bool)

(assert (=> b!331350 (= e!203277 Undefined!3125)))

(declare-fun b!331351 () Bool)

(assert (=> b!331351 (= e!203276 (Found!3125 (index!14678 lt!158812)))))

(declare-fun b!331352 () Bool)

(assert (=> b!331352 (= e!203275 (MissingZero!3125 (index!14678 lt!158812)))))

(assert (= (and d!70397 c!51997) b!331350))

(assert (= (and d!70397 (not c!51997)) b!331347))

(assert (= (and b!331347 c!51999) b!331351))

(assert (= (and b!331347 (not c!51999)) b!331349))

(assert (= (and b!331349 c!51998) b!331352))

(assert (= (and b!331349 (not c!51998)) b!331348))

(declare-fun m!336285 () Bool)

(assert (=> b!331347 m!336285))

(declare-fun m!336287 () Bool)

(assert (=> b!331348 m!336287))

(assert (=> d!70397 m!336145))

(assert (=> d!70397 m!336131))

(assert (=> d!70397 m!336133))

(declare-fun m!336289 () Bool)

(assert (=> d!70397 m!336289))

(assert (=> d!70397 m!336131))

(declare-fun m!336291 () Bool)

(assert (=> d!70397 m!336291))

(declare-fun m!336293 () Bool)

(assert (=> d!70397 m!336293))

(assert (=> b!331134 d!70397))

(declare-fun d!70405 () Bool)

(assert (=> d!70405 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!331138 d!70405))

(declare-fun b!331361 () Bool)

(declare-fun e!203285 () SeekEntryResult!3125)

(assert (=> b!331361 (= e!203285 (Intermediate!3125 false index!1840 x!1490))))

(declare-fun b!331362 () Bool)

(declare-fun lt!158821 () SeekEntryResult!3125)

(assert (=> b!331362 (and (bvsge (index!14678 lt!158821) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158821) (size!8346 a!3305)))))

(declare-fun res!182649 () Bool)

(assert (=> b!331362 (= res!182649 (= (select (arr!7994 a!3305) (index!14678 lt!158821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203288 () Bool)

(assert (=> b!331362 (=> res!182649 e!203288)))

(declare-fun b!331363 () Bool)

(declare-fun e!203286 () SeekEntryResult!3125)

(assert (=> b!331363 (= e!203286 (Intermediate!3125 true index!1840 x!1490))))

(declare-fun b!331364 () Bool)

(declare-fun e!203287 () Bool)

(assert (=> b!331364 (= e!203287 (bvsge (x!32965 lt!158821) #b01111111111111111111111111111110))))

(declare-fun b!331365 () Bool)

(assert (=> b!331365 (= e!203286 e!203285)))

(declare-fun c!52002 () Bool)

(declare-fun lt!158820 () (_ BitVec 64))

(assert (=> b!331365 (= c!52002 (or (= lt!158820 k!2497) (= (bvadd lt!158820 lt!158820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331366 () Bool)

(assert (=> b!331366 (and (bvsge (index!14678 lt!158821) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158821) (size!8346 a!3305)))))

(declare-fun res!182647 () Bool)

(assert (=> b!331366 (= res!182647 (= (select (arr!7994 a!3305) (index!14678 lt!158821)) k!2497))))

(assert (=> b!331366 (=> res!182647 e!203288)))

(declare-fun e!203284 () Bool)

(assert (=> b!331366 (= e!203284 e!203288)))

(declare-fun d!70407 () Bool)

(assert (=> d!70407 e!203287))

(declare-fun c!52004 () Bool)

(assert (=> d!70407 (= c!52004 (and (is-Intermediate!3125 lt!158821) (undefined!3937 lt!158821)))))

(assert (=> d!70407 (= lt!158821 e!203286)))

(declare-fun c!52003 () Bool)

(assert (=> d!70407 (= c!52003 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70407 (= lt!158820 (select (arr!7994 a!3305) index!1840))))

(assert (=> d!70407 (validMask!0 mask!3777)))

(assert (=> d!70407 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158821)))

(declare-fun b!331367 () Bool)

(assert (=> b!331367 (= e!203285 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!331368 () Bool)

(assert (=> b!331368 (and (bvsge (index!14678 lt!158821) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158821) (size!8346 a!3305)))))

(assert (=> b!331368 (= e!203288 (= (select (arr!7994 a!3305) (index!14678 lt!158821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331369 () Bool)

(assert (=> b!331369 (= e!203287 e!203284)))

(declare-fun res!182648 () Bool)

(assert (=> b!331369 (= res!182648 (and (is-Intermediate!3125 lt!158821) (not (undefined!3937 lt!158821)) (bvslt (x!32965 lt!158821) #b01111111111111111111111111111110) (bvsge (x!32965 lt!158821) #b00000000000000000000000000000000) (bvsge (x!32965 lt!158821) x!1490)))))

(assert (=> b!331369 (=> (not res!182648) (not e!203284))))

(assert (= (and d!70407 c!52003) b!331363))

(assert (= (and d!70407 (not c!52003)) b!331365))

(assert (= (and b!331365 c!52002) b!331361))

(assert (= (and b!331365 (not c!52002)) b!331367))

(assert (= (and d!70407 c!52004) b!331364))

(assert (= (and d!70407 (not c!52004)) b!331369))

(assert (= (and b!331369 res!182648) b!331366))

(assert (= (and b!331366 (not res!182647)) b!331362))

(assert (= (and b!331362 (not res!182649)) b!331368))

(assert (=> b!331367 m!336153))

(assert (=> b!331367 m!336153))

(declare-fun m!336295 () Bool)

(assert (=> b!331367 m!336295))

(declare-fun m!336297 () Bool)

(assert (=> b!331362 m!336297))

(assert (=> b!331368 m!336297))

(assert (=> b!331366 m!336297))

(assert (=> d!70407 m!336157))

(assert (=> d!70407 m!336145))

(assert (=> b!331136 d!70407))

(declare-fun d!70409 () Bool)

(assert (=> d!70409 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33298 d!70409))

(declare-fun d!70417 () Bool)

(assert (=> d!70417 (= (array_inv!5957 a!3305) (bvsge (size!8346 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33298 d!70417))

(declare-fun b!331392 () Bool)

(declare-fun e!203302 () SeekEntryResult!3125)

(assert (=> b!331392 (= e!203302 (Intermediate!3125 false index!1840 x!1490))))

(declare-fun b!331393 () Bool)

(declare-fun lt!158835 () SeekEntryResult!3125)

(assert (=> b!331393 (and (bvsge (index!14678 lt!158835) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158835) (size!8346 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)))))))

(declare-fun res!182654 () Bool)

(assert (=> b!331393 (= res!182654 (= (select (arr!7994 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305))) (index!14678 lt!158835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203305 () Bool)

(assert (=> b!331393 (=> res!182654 e!203305)))

(declare-fun b!331394 () Bool)

(declare-fun e!203303 () SeekEntryResult!3125)

(assert (=> b!331394 (= e!203303 (Intermediate!3125 true index!1840 x!1490))))

(declare-fun b!331395 () Bool)

(declare-fun e!203304 () Bool)

(assert (=> b!331395 (= e!203304 (bvsge (x!32965 lt!158835) #b01111111111111111111111111111110))))

(declare-fun b!331396 () Bool)

(assert (=> b!331396 (= e!203303 e!203302)))

(declare-fun c!52015 () Bool)

(declare-fun lt!158834 () (_ BitVec 64))

(assert (=> b!331396 (= c!52015 (or (= lt!158834 k!2497) (= (bvadd lt!158834 lt!158834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331397 () Bool)

(assert (=> b!331397 (and (bvsge (index!14678 lt!158835) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158835) (size!8346 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)))))))

(declare-fun res!182652 () Bool)

(assert (=> b!331397 (= res!182652 (= (select (arr!7994 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305))) (index!14678 lt!158835)) k!2497))))

(assert (=> b!331397 (=> res!182652 e!203305)))

(declare-fun e!203301 () Bool)

(assert (=> b!331397 (= e!203301 e!203305)))

(declare-fun d!70419 () Bool)

(assert (=> d!70419 e!203304))

(declare-fun c!52017 () Bool)

(assert (=> d!70419 (= c!52017 (and (is-Intermediate!3125 lt!158835) (undefined!3937 lt!158835)))))

(assert (=> d!70419 (= lt!158835 e!203303)))

(declare-fun c!52016 () Bool)

(assert (=> d!70419 (= c!52016 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70419 (= lt!158834 (select (arr!7994 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305))) index!1840))))

(assert (=> d!70419 (validMask!0 mask!3777)))

(assert (=> d!70419 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)) mask!3777) lt!158835)))

(declare-fun b!331398 () Bool)

(assert (=> b!331398 (= e!203302 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)) mask!3777))))

(declare-fun b!331399 () Bool)

(assert (=> b!331399 (and (bvsge (index!14678 lt!158835) #b00000000000000000000000000000000) (bvslt (index!14678 lt!158835) (size!8346 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)))))))

(assert (=> b!331399 (= e!203305 (= (select (arr!7994 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305))) (index!14678 lt!158835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331400 () Bool)

(assert (=> b!331400 (= e!203304 e!203301)))

(declare-fun res!182653 () Bool)

(assert (=> b!331400 (= res!182653 (and (is-Intermediate!3125 lt!158835) (not (undefined!3937 lt!158835)) (bvslt (x!32965 lt!158835) #b01111111111111111111111111111110) (bvsge (x!32965 lt!158835) #b00000000000000000000000000000000) (bvsge (x!32965 lt!158835) x!1490)))))

(assert (=> b!331400 (=> (not res!182653) (not e!203301))))

(assert (= (and d!70419 c!52016) b!331394))

(assert (= (and d!70419 (not c!52016)) b!331396))

(assert (= (and b!331396 c!52015) b!331392))

(assert (= (and b!331396 (not c!52015)) b!331398))

(assert (= (and d!70419 c!52017) b!331395))

(assert (= (and d!70419 (not c!52017)) b!331400))

(assert (= (and b!331400 res!182653) b!331397))

(assert (= (and b!331397 (not res!182652)) b!331393))

(assert (= (and b!331393 (not res!182654)) b!331399))

(assert (=> b!331398 m!336153))

(assert (=> b!331398 m!336153))

(declare-fun m!336321 () Bool)

(assert (=> b!331398 m!336321))

(declare-fun m!336323 () Bool)

(assert (=> b!331393 m!336323))

(assert (=> b!331399 m!336323))

(assert (=> b!331397 m!336323))

(declare-fun m!336325 () Bool)

(assert (=> d!70419 m!336325))

(assert (=> d!70419 m!336145))

(assert (=> b!331137 d!70419))

(declare-fun b!331480 () Bool)

(declare-fun e!203354 () Unit!10329)

(declare-fun Unit!10343 () Unit!10329)

(assert (=> b!331480 (= e!203354 Unit!10343)))

(declare-fun call!26190 () SeekEntryResult!3125)

(assert (=> b!331480 (= call!26190 (Intermediate!3125 false (nextIndex!0 index!1840 x!1490 mask!3777) resX!58))))

(declare-fun lt!158874 () Unit!10329)

(declare-fun Unit!10344 () Unit!10329)

(assert (=> b!331480 (= lt!158874 Unit!10344)))

(assert (=> b!331480 false))

(declare-fun b!331481 () Bool)

(declare-fun e!203353 () Unit!10329)

(declare-fun Unit!10345 () Unit!10329)

(assert (=> b!331481 (= e!203353 Unit!10345)))

(declare-fun b!331482 () Bool)

(declare-fun e!203355 () Unit!10329)

(declare-fun Unit!10346 () Unit!10329)

(assert (=> b!331482 (= e!203355 Unit!10346)))

(declare-fun b!331483 () Bool)

(declare-fun e!203356 () Unit!10329)

(declare-fun Unit!10347 () Unit!10329)

(assert (=> b!331483 (= e!203356 Unit!10347)))

(declare-fun c!52046 () Bool)

(assert (=> b!331483 (= c!52046 (not (= resIndex!58 (nextIndex!0 index!1840 x!1490 mask!3777))))))

(declare-fun lt!158875 () Unit!10329)

(assert (=> b!331483 (= lt!158875 e!203353)))

(assert (=> b!331483 (= (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58)))

(declare-fun lt!158872 () Unit!10329)

(declare-fun Unit!10348 () Unit!10329)

(assert (=> b!331483 (= lt!158872 Unit!10348)))

(assert (=> b!331483 (= (select (arr!7994 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!70421 () Bool)

(declare-fun e!203352 () Bool)

(assert (=> d!70421 e!203352))

(declare-fun res!182679 () Bool)

(assert (=> d!70421 (=> (not res!182679) (not e!203352))))

(assert (=> d!70421 (= res!182679 (and (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8346 a!3305))))))

(declare-fun lt!158873 () Unit!10329)

(assert (=> d!70421 (= lt!158873 e!203356)))

(declare-fun c!52048 () Bool)

(assert (=> d!70421 (= c!52048 (= (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(assert (=> d!70421 (validMask!0 mask!3777)))

(assert (=> d!70421 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777) lt!158873)))

(declare-fun b!331484 () Bool)

(assert (=> b!331484 false))

(declare-fun Unit!10349 () Unit!10329)

(assert (=> b!331484 (= e!203355 Unit!10349)))

(declare-fun b!331485 () Bool)

(assert (=> b!331485 (= e!203352 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 (array!16907 (store (arr!7994 a!3305) i!1250 k!2497) (size!8346 a!3305)) mask!3777) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun bm!26187 () Bool)

(declare-fun e!203357 () (_ BitVec 32))

(declare-fun c!52050 () Bool)

(assert (=> bm!26187 (= call!26190 (seekKeyOrZeroOrLongMinValue!0 (ite c!52050 (bvadd #b00000000000000000000000000000001 x!1490) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001)) e!203357 k!2497 a!3305 mask!3777))))

(declare-fun c!52049 () Bool)

(assert (=> bm!26187 (= c!52049 c!52050)))

(declare-fun b!331486 () Bool)

(assert (=> b!331486 (= c!52050 (or (= (select (arr!7994 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7994 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!331486 (= e!203353 e!203354)))

(declare-fun call!26191 () (_ BitVec 32))

(declare-fun bm!26188 () Bool)

(assert (=> bm!26188 (= call!26191 (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!331487 () Bool)

(declare-fun Unit!10350 () Unit!10329)

(assert (=> b!331487 (= e!203354 Unit!10350)))

(declare-fun c!52047 () Bool)

(assert (=> b!331487 (= c!52047 (is-Intermediate!3125 call!26190))))

(declare-fun lt!158871 () Unit!10329)

(assert (=> b!331487 (= lt!158871 e!203355)))

(assert (=> b!331487 false))

(declare-fun b!331488 () Bool)

(assert (=> b!331488 (= e!203357 call!26191)))

(declare-fun b!331489 () Bool)

(assert (=> b!331489 (= e!203356 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) call!26191 resIndex!58 resX!58 mask!3777))))

(declare-fun b!331490 () Bool)

(assert (=> b!331490 (= e!203357 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and d!70421 c!52048) b!331483))

(assert (= (and d!70421 (not c!52048)) b!331489))

(assert (= (and b!331483 c!52046) b!331486))

(assert (= (and b!331483 (not c!52046)) b!331481))

(assert (= (and b!331486 c!52050) b!331480))

(assert (= (and b!331486 (not c!52050)) b!331487))

(assert (= (and b!331487 c!52047) b!331482))

(assert (= (and b!331487 (not c!52047)) b!331484))

(assert (= (or b!331480 b!331487) bm!26187))

(assert (= (and bm!26187 c!52049) b!331490))

(assert (= (and bm!26187 (not c!52049)) b!331488))

(assert (= (or b!331488 b!331489) bm!26188))

(assert (= (and d!70421 res!182679) b!331485))

(declare-fun m!336353 () Bool)

(assert (=> b!331489 m!336353))

(assert (=> b!331486 m!336153))

(declare-fun m!336355 () Bool)

(assert (=> b!331486 m!336355))

(assert (=> bm!26188 m!336153))

(declare-fun m!336357 () Bool)

(assert (=> bm!26188 m!336357))

(assert (=> b!331485 m!336149))

(assert (=> b!331485 m!336153))

(declare-fun m!336359 () Bool)

(assert (=> b!331485 m!336359))

(assert (=> b!331485 m!336153))

(declare-fun m!336361 () Bool)

(assert (=> b!331485 m!336361))

(assert (=> d!70421 m!336145))

(assert (=> b!331483 m!336153))

(assert (=> b!331483 m!336355))

(declare-fun m!336363 () Bool)

(assert (=> bm!26187 m!336363))

(assert (=> b!331137 d!70421))

(declare-fun d!70431 () Bool)

(declare-fun lt!158878 () (_ BitVec 32))

(assert (=> d!70431 (and (bvsge lt!158878 #b00000000000000000000000000000000) (bvslt lt!158878 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70431 (= lt!158878 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70431 (validMask!0 mask!3777)))

(assert (=> d!70431 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158878)))

(declare-fun bs!11445 () Bool)

(assert (= bs!11445 d!70431))

(declare-fun m!336365 () Bool)

(assert (=> bs!11445 m!336365))

(assert (=> bs!11445 m!336145))

(assert (=> b!331137 d!70431))

(push 1)

