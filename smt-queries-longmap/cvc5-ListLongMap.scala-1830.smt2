; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33072 () Bool)

(assert start!33072)

(declare-fun b!329289 () Bool)

(declare-fun res!181530 () Bool)

(declare-fun e!202281 () Bool)

(assert (=> b!329289 (=> (not res!181530) (not e!202281))))

(declare-datatypes ((array!16846 0))(
  ( (array!16847 (arr!7968 (Array (_ BitVec 32) (_ BitVec 64))) (size!8320 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16846)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16846 (_ BitVec 32)) Bool)

(assert (=> b!329289 (= res!181530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329290 () Bool)

(declare-fun res!181526 () Bool)

(assert (=> b!329290 (=> (not res!181526) (not e!202281))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329290 (= res!181526 (validKeyInArray!0 k!2497))))

(declare-fun b!329291 () Bool)

(declare-fun res!181525 () Bool)

(assert (=> b!329291 (=> (not res!181525) (not e!202281))))

(declare-fun arrayContainsKey!0 (array!16846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329291 (= res!181525 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun e!202280 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!329292 () Bool)

(declare-datatypes ((SeekEntryResult!3064 0))(
  ( (MissingZero!3064 (index!14432 (_ BitVec 32))) (Found!3064 (index!14433 (_ BitVec 32))) (Intermediate!3064 (undefined!3876 Bool) (index!14434 (_ BitVec 32)) (x!32802 (_ BitVec 32))) (Undefined!3064) (MissingVacant!3064 (index!14435 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16846 (_ BitVec 32)) SeekEntryResult!3064)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329292 (= e!202280 (not (is-Intermediate!3064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))))

(declare-fun b!329294 () Bool)

(assert (=> b!329294 (= e!202281 e!202280)))

(declare-fun res!181524 () Bool)

(assert (=> b!329294 (=> (not res!181524) (not e!202280))))

(declare-fun lt!158196 () SeekEntryResult!3064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329294 (= res!181524 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158196))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329294 (= lt!158196 (Intermediate!3064 false resIndex!58 resX!58))))

(declare-fun b!329295 () Bool)

(declare-fun res!181528 () Bool)

(assert (=> b!329295 (=> (not res!181528) (not e!202280))))

(assert (=> b!329295 (= res!181528 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158196))))

(declare-fun b!329296 () Bool)

(declare-fun res!181532 () Bool)

(assert (=> b!329296 (=> (not res!181532) (not e!202281))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16846 (_ BitVec 32)) SeekEntryResult!3064)

(assert (=> b!329296 (= res!181532 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3064 i!1250)))))

(declare-fun b!329293 () Bool)

(declare-fun res!181531 () Bool)

(assert (=> b!329293 (=> (not res!181531) (not e!202281))))

(assert (=> b!329293 (= res!181531 (and (= (size!8320 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8320 a!3305))))))

(declare-fun res!181529 () Bool)

(assert (=> start!33072 (=> (not res!181529) (not e!202281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33072 (= res!181529 (validMask!0 mask!3777))))

(assert (=> start!33072 e!202281))

(declare-fun array_inv!5918 (array!16846) Bool)

(assert (=> start!33072 (array_inv!5918 a!3305)))

(assert (=> start!33072 true))

(declare-fun b!329297 () Bool)

(declare-fun res!181527 () Bool)

(assert (=> b!329297 (=> (not res!181527) (not e!202280))))

(assert (=> b!329297 (= res!181527 (and (= (select (arr!7968 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8320 a!3305))))))

(declare-fun b!329298 () Bool)

(declare-fun res!181533 () Bool)

(assert (=> b!329298 (=> (not res!181533) (not e!202280))))

(assert (=> b!329298 (= res!181533 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7968 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7968 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7968 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!33072 res!181529) b!329293))

(assert (= (and b!329293 res!181531) b!329290))

(assert (= (and b!329290 res!181526) b!329291))

(assert (= (and b!329291 res!181525) b!329296))

(assert (= (and b!329296 res!181532) b!329289))

(assert (= (and b!329289 res!181530) b!329294))

(assert (= (and b!329294 res!181524) b!329297))

(assert (= (and b!329297 res!181527) b!329295))

(assert (= (and b!329295 res!181528) b!329298))

(assert (= (and b!329298 res!181533) b!329292))

(declare-fun m!335243 () Bool)

(assert (=> b!329294 m!335243))

(assert (=> b!329294 m!335243))

(declare-fun m!335245 () Bool)

(assert (=> b!329294 m!335245))

(declare-fun m!335247 () Bool)

(assert (=> b!329295 m!335247))

(declare-fun m!335249 () Bool)

(assert (=> b!329289 m!335249))

(declare-fun m!335251 () Bool)

(assert (=> b!329290 m!335251))

(declare-fun m!335253 () Bool)

(assert (=> b!329297 m!335253))

(declare-fun m!335255 () Bool)

(assert (=> start!33072 m!335255))

(declare-fun m!335257 () Bool)

(assert (=> start!33072 m!335257))

(declare-fun m!335259 () Bool)

(assert (=> b!329298 m!335259))

(declare-fun m!335261 () Bool)

(assert (=> b!329292 m!335261))

(assert (=> b!329292 m!335261))

(declare-fun m!335263 () Bool)

(assert (=> b!329292 m!335263))

(declare-fun m!335265 () Bool)

(assert (=> b!329296 m!335265))

(declare-fun m!335267 () Bool)

(assert (=> b!329291 m!335267))

(push 1)

(assert (not b!329289))

(assert (not b!329295))

(assert (not b!329296))

(assert (not b!329292))

(assert (not start!33072))

(assert (not b!329290))

(assert (not b!329294))

(assert (not b!329291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70179 () Bool)

(declare-fun e!202306 () Bool)

(assert (=> d!70179 e!202306))

(declare-fun c!51536 () Bool)

(declare-fun lt!158205 () SeekEntryResult!3064)

(assert (=> d!70179 (= c!51536 (and (is-Intermediate!3064 lt!158205) (undefined!3876 lt!158205)))))

(declare-fun e!202302 () SeekEntryResult!3064)

(assert (=> d!70179 (= lt!158205 e!202302)))

(declare-fun c!51534 () Bool)

(assert (=> d!70179 (= c!51534 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158206 () (_ BitVec 64))

(assert (=> d!70179 (= lt!158206 (select (arr!7968 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70179 (validMask!0 mask!3777)))

(assert (=> d!70179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158205)))

(declare-fun b!329335 () Bool)

(declare-fun e!202305 () SeekEntryResult!3064)

(assert (=> b!329335 (= e!202305 (Intermediate!3064 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329336 () Bool)

(declare-fun e!202304 () Bool)

(assert (=> b!329336 (= e!202306 e!202304)))

(declare-fun res!181546 () Bool)

(assert (=> b!329336 (= res!181546 (and (is-Intermediate!3064 lt!158205) (not (undefined!3876 lt!158205)) (bvslt (x!32802 lt!158205) #b01111111111111111111111111111110) (bvsge (x!32802 lt!158205) #b00000000000000000000000000000000) (bvsge (x!32802 lt!158205) #b00000000000000000000000000000000)))))

(assert (=> b!329336 (=> (not res!181546) (not e!202304))))

(declare-fun b!329337 () Bool)

(assert (=> b!329337 (and (bvsge (index!14434 lt!158205) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158205) (size!8320 a!3305)))))

(declare-fun res!181547 () Bool)

(assert (=> b!329337 (= res!181547 (= (select (arr!7968 a!3305) (index!14434 lt!158205)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202303 () Bool)

(assert (=> b!329337 (=> res!181547 e!202303)))

(declare-fun b!329338 () Bool)

(assert (=> b!329338 (= e!202306 (bvsge (x!32802 lt!158205) #b01111111111111111111111111111110))))

(declare-fun b!329339 () Bool)

(assert (=> b!329339 (and (bvsge (index!14434 lt!158205) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158205) (size!8320 a!3305)))))

(assert (=> b!329339 (= e!202303 (= (select (arr!7968 a!3305) (index!14434 lt!158205)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329340 () Bool)

(assert (=> b!329340 (and (bvsge (index!14434 lt!158205) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158205) (size!8320 a!3305)))))

(declare-fun res!181548 () Bool)

(assert (=> b!329340 (= res!181548 (= (select (arr!7968 a!3305) (index!14434 lt!158205)) k!2497))))

(assert (=> b!329340 (=> res!181548 e!202303)))

(assert (=> b!329340 (= e!202304 e!202303)))

(declare-fun b!329341 () Bool)

(assert (=> b!329341 (= e!202305 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329342 () Bool)

(assert (=> b!329342 (= e!202302 (Intermediate!3064 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329343 () Bool)

(assert (=> b!329343 (= e!202302 e!202305)))

(declare-fun c!51535 () Bool)

(assert (=> b!329343 (= c!51535 (or (= lt!158206 k!2497) (= (bvadd lt!158206 lt!158206) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!70179 c!51534) b!329342))

(assert (= (and d!70179 (not c!51534)) b!329343))

(assert (= (and b!329343 c!51535) b!329335))

(assert (= (and b!329343 (not c!51535)) b!329341))

(assert (= (and d!70179 c!51536) b!329338))

(assert (= (and d!70179 (not c!51536)) b!329336))

(assert (= (and b!329336 res!181546) b!329340))

(assert (= (and b!329340 (not res!181548)) b!329337))

(assert (= (and b!329337 (not res!181547)) b!329339))

(assert (=> b!329341 m!335243))

(declare-fun m!335269 () Bool)

(assert (=> b!329341 m!335269))

(assert (=> b!329341 m!335269))

(declare-fun m!335271 () Bool)

(assert (=> b!329341 m!335271))

(declare-fun m!335273 () Bool)

(assert (=> b!329340 m!335273))

(assert (=> b!329339 m!335273))

(assert (=> d!70179 m!335243))

(declare-fun m!335275 () Bool)

(assert (=> d!70179 m!335275))

(assert (=> d!70179 m!335255))

(assert (=> b!329337 m!335273))

(assert (=> b!329294 d!70179))

(declare-fun d!70185 () Bool)

(declare-fun lt!158223 () (_ BitVec 32))

(declare-fun lt!158222 () (_ BitVec 32))

(assert (=> d!70185 (= lt!158223 (bvmul (bvxor lt!158222 (bvlshr lt!158222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70185 (= lt!158222 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70185 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181549 (let ((h!5327 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32805 (bvmul (bvxor h!5327 (bvlshr h!5327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32805 (bvlshr x!32805 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181549 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181549 #b00000000000000000000000000000000))))))

(assert (=> d!70185 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158223 (bvlshr lt!158223 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329294 d!70185))

(declare-fun bm!26132 () Bool)

(declare-fun call!26135 () Bool)

(assert (=> bm!26132 (= call!26135 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329392 () Bool)

(declare-fun e!202337 () Bool)

(declare-fun e!202338 () Bool)

(assert (=> b!329392 (= e!202337 e!202338)))

(declare-fun c!51551 () Bool)

(assert (=> b!329392 (= c!51551 (validKeyInArray!0 (select (arr!7968 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!329393 () Bool)

(declare-fun e!202339 () Bool)

(assert (=> b!329393 (= e!202339 call!26135)))

(declare-fun b!329394 () Bool)

(assert (=> b!329394 (= e!202338 call!26135)))

(declare-fun d!70189 () Bool)

(declare-fun res!181570 () Bool)

(assert (=> d!70189 (=> res!181570 e!202337)))

(assert (=> d!70189 (= res!181570 (bvsge #b00000000000000000000000000000000 (size!8320 a!3305)))))

(assert (=> d!70189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202337)))

(declare-fun b!329391 () Bool)

(assert (=> b!329391 (= e!202338 e!202339)))

(declare-fun lt!158243 () (_ BitVec 64))

(assert (=> b!329391 (= lt!158243 (select (arr!7968 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10168 0))(
  ( (Unit!10169) )
))
(declare-fun lt!158244 () Unit!10168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16846 (_ BitVec 64) (_ BitVec 32)) Unit!10168)

(assert (=> b!329391 (= lt!158244 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158243 #b00000000000000000000000000000000))))

(assert (=> b!329391 (arrayContainsKey!0 a!3305 lt!158243 #b00000000000000000000000000000000)))

(declare-fun lt!158245 () Unit!10168)

(assert (=> b!329391 (= lt!158245 lt!158244)))

(declare-fun res!181571 () Bool)

(assert (=> b!329391 (= res!181571 (= (seekEntryOrOpen!0 (select (arr!7968 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3064 #b00000000000000000000000000000000)))))

(assert (=> b!329391 (=> (not res!181571) (not e!202339))))

(assert (= (and d!70189 (not res!181570)) b!329392))

(assert (= (and b!329392 c!51551) b!329391))

(assert (= (and b!329392 (not c!51551)) b!329394))

(assert (= (and b!329391 res!181571) b!329393))

(assert (= (or b!329393 b!329394) bm!26132))

(declare-fun m!335313 () Bool)

(assert (=> bm!26132 m!335313))

(declare-fun m!335315 () Bool)

(assert (=> b!329392 m!335315))

(assert (=> b!329392 m!335315))

(declare-fun m!335317 () Bool)

(assert (=> b!329392 m!335317))

(assert (=> b!329391 m!335315))

(declare-fun m!335319 () Bool)

(assert (=> b!329391 m!335319))

(declare-fun m!335321 () Bool)

(assert (=> b!329391 m!335321))

(assert (=> b!329391 m!335315))

(declare-fun m!335323 () Bool)

(assert (=> b!329391 m!335323))

(assert (=> b!329289 d!70189))

(declare-fun d!70203 () Bool)

(declare-fun res!181576 () Bool)

(declare-fun e!202344 () Bool)

(assert (=> d!70203 (=> res!181576 e!202344)))

(assert (=> d!70203 (= res!181576 (= (select (arr!7968 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70203 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202344)))

(declare-fun b!329399 () Bool)

(declare-fun e!202345 () Bool)

(assert (=> b!329399 (= e!202344 e!202345)))

(declare-fun res!181577 () Bool)

(assert (=> b!329399 (=> (not res!181577) (not e!202345))))

(assert (=> b!329399 (= res!181577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8320 a!3305)))))

(declare-fun b!329400 () Bool)

(assert (=> b!329400 (= e!202345 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70203 (not res!181576)) b!329399))

(assert (= (and b!329399 res!181577) b!329400))

(assert (=> d!70203 m!335315))

(declare-fun m!335325 () Bool)

(assert (=> b!329400 m!335325))

(assert (=> b!329291 d!70203))

(declare-fun d!70205 () Bool)

(declare-fun e!202350 () Bool)

(assert (=> d!70205 e!202350))

(declare-fun c!51554 () Bool)

(declare-fun lt!158246 () SeekEntryResult!3064)

(assert (=> d!70205 (= c!51554 (and (is-Intermediate!3064 lt!158246) (undefined!3876 lt!158246)))))

(declare-fun e!202346 () SeekEntryResult!3064)

(assert (=> d!70205 (= lt!158246 e!202346)))

(declare-fun c!51552 () Bool)

(assert (=> d!70205 (= c!51552 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158247 () (_ BitVec 64))

(assert (=> d!70205 (= lt!158247 (select (arr!7968 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)))))

(assert (=> d!70205 (validMask!0 mask!3777)))

(assert (=> d!70205 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777) lt!158246)))

(declare-fun b!329401 () Bool)

(declare-fun e!202349 () SeekEntryResult!3064)

(assert (=> b!329401 (= e!202349 (Intermediate!3064 false (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329402 () Bool)

(declare-fun e!202348 () Bool)

(assert (=> b!329402 (= e!202350 e!202348)))

(declare-fun res!181578 () Bool)

(assert (=> b!329402 (= res!181578 (and (is-Intermediate!3064 lt!158246) (not (undefined!3876 lt!158246)) (bvslt (x!32802 lt!158246) #b01111111111111111111111111111110) (bvsge (x!32802 lt!158246) #b00000000000000000000000000000000) (bvsge (x!32802 lt!158246) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329402 (=> (not res!181578) (not e!202348))))

(declare-fun b!329403 () Bool)

(assert (=> b!329403 (and (bvsge (index!14434 lt!158246) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158246) (size!8320 a!3305)))))

(declare-fun res!181579 () Bool)

(assert (=> b!329403 (= res!181579 (= (select (arr!7968 a!3305) (index!14434 lt!158246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202347 () Bool)

(assert (=> b!329403 (=> res!181579 e!202347)))

(declare-fun b!329404 () Bool)

(assert (=> b!329404 (= e!202350 (bvsge (x!32802 lt!158246) #b01111111111111111111111111111110))))

(declare-fun b!329405 () Bool)

(assert (=> b!329405 (and (bvsge (index!14434 lt!158246) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158246) (size!8320 a!3305)))))

(assert (=> b!329405 (= e!202347 (= (select (arr!7968 a!3305) (index!14434 lt!158246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329406 () Bool)

(assert (=> b!329406 (and (bvsge (index!14434 lt!158246) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158246) (size!8320 a!3305)))))

(declare-fun res!181580 () Bool)

(assert (=> b!329406 (= res!181580 (= (select (arr!7968 a!3305) (index!14434 lt!158246)) k!2497))))

(assert (=> b!329406 (=> res!181580 e!202347)))

(assert (=> b!329406 (= e!202348 e!202347)))

(declare-fun b!329407 () Bool)

(assert (=> b!329407 (= e!202349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329408 () Bool)

(assert (=> b!329408 (= e!202346 (Intermediate!3064 true (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329409 () Bool)

(assert (=> b!329409 (= e!202346 e!202349)))

(declare-fun c!51553 () Bool)

(assert (=> b!329409 (= c!51553 (or (= lt!158247 k!2497) (= (bvadd lt!158247 lt!158247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!70205 c!51552) b!329408))

(assert (= (and d!70205 (not c!51552)) b!329409))

(assert (= (and b!329409 c!51553) b!329401))

(assert (= (and b!329409 (not c!51553)) b!329407))

(assert (= (and d!70205 c!51554) b!329404))

(assert (= (and d!70205 (not c!51554)) b!329402))

(assert (= (and b!329402 res!181578) b!329406))

(assert (= (and b!329406 (not res!181580)) b!329403))

(assert (= (and b!329403 (not res!181579)) b!329405))

(assert (=> b!329407 m!335261))

(declare-fun m!335327 () Bool)

(assert (=> b!329407 m!335327))

(assert (=> b!329407 m!335327))

(declare-fun m!335329 () Bool)

(assert (=> b!329407 m!335329))

(declare-fun m!335331 () Bool)

(assert (=> b!329406 m!335331))

(assert (=> b!329405 m!335331))

(assert (=> d!70205 m!335261))

(declare-fun m!335333 () Bool)

(assert (=> d!70205 m!335333))

(assert (=> d!70205 m!335255))

(assert (=> b!329403 m!335331))

(assert (=> b!329292 d!70205))

(declare-fun d!70207 () Bool)

(declare-fun lt!158256 () (_ BitVec 32))

(assert (=> d!70207 (and (bvsge lt!158256 #b00000000000000000000000000000000) (bvslt lt!158256 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70207 (= lt!158256 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!70207 (validMask!0 mask!3777)))

(assert (=> d!70207 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!158256)))

(declare-fun bs!11425 () Bool)

(assert (= bs!11425 d!70207))

(declare-fun m!335335 () Bool)

(assert (=> bs!11425 m!335335))

(assert (=> bs!11425 m!335255))

(assert (=> b!329292 d!70207))

(declare-fun d!70209 () Bool)

(assert (=> d!70209 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329290 d!70209))

(declare-fun d!70211 () Bool)

(assert (=> d!70211 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33072 d!70211))

(declare-fun d!70215 () Bool)

(assert (=> d!70215 (= (array_inv!5918 a!3305) (bvsge (size!8320 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33072 d!70215))

(declare-fun d!70217 () Bool)

(declare-fun e!202370 () Bool)

(assert (=> d!70217 e!202370))

(declare-fun c!51572 () Bool)

(declare-fun lt!158266 () SeekEntryResult!3064)

(assert (=> d!70217 (= c!51572 (and (is-Intermediate!3064 lt!158266) (undefined!3876 lt!158266)))))

(declare-fun e!202366 () SeekEntryResult!3064)

(assert (=> d!70217 (= lt!158266 e!202366)))

(declare-fun c!51570 () Bool)

(assert (=> d!70217 (= c!51570 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158267 () (_ BitVec 64))

(assert (=> d!70217 (= lt!158267 (select (arr!7968 a!3305) index!1840))))

(assert (=> d!70217 (validMask!0 mask!3777)))

(assert (=> d!70217 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158266)))

(declare-fun b!329440 () Bool)

(declare-fun e!202369 () SeekEntryResult!3064)

(assert (=> b!329440 (= e!202369 (Intermediate!3064 false index!1840 x!1490))))

(declare-fun b!329441 () Bool)

(declare-fun e!202368 () Bool)

(assert (=> b!329441 (= e!202370 e!202368)))

(declare-fun res!181581 () Bool)

(assert (=> b!329441 (= res!181581 (and (is-Intermediate!3064 lt!158266) (not (undefined!3876 lt!158266)) (bvslt (x!32802 lt!158266) #b01111111111111111111111111111110) (bvsge (x!32802 lt!158266) #b00000000000000000000000000000000) (bvsge (x!32802 lt!158266) x!1490)))))

(assert (=> b!329441 (=> (not res!181581) (not e!202368))))

(declare-fun b!329442 () Bool)

(assert (=> b!329442 (and (bvsge (index!14434 lt!158266) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158266) (size!8320 a!3305)))))

(declare-fun res!181582 () Bool)

(assert (=> b!329442 (= res!181582 (= (select (arr!7968 a!3305) (index!14434 lt!158266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202367 () Bool)

(assert (=> b!329442 (=> res!181582 e!202367)))

(declare-fun b!329443 () Bool)

(assert (=> b!329443 (= e!202370 (bvsge (x!32802 lt!158266) #b01111111111111111111111111111110))))

(declare-fun b!329444 () Bool)

(assert (=> b!329444 (and (bvsge (index!14434 lt!158266) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158266) (size!8320 a!3305)))))

(assert (=> b!329444 (= e!202367 (= (select (arr!7968 a!3305) (index!14434 lt!158266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329445 () Bool)

(assert (=> b!329445 (and (bvsge (index!14434 lt!158266) #b00000000000000000000000000000000) (bvslt (index!14434 lt!158266) (size!8320 a!3305)))))

(declare-fun res!181583 () Bool)

(assert (=> b!329445 (= res!181583 (= (select (arr!7968 a!3305) (index!14434 lt!158266)) k!2497))))

(assert (=> b!329445 (=> res!181583 e!202367)))

(assert (=> b!329445 (= e!202368 e!202367)))

(declare-fun b!329446 () Bool)

(assert (=> b!329446 (= e!202369 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329447 () Bool)

(assert (=> b!329447 (= e!202366 (Intermediate!3064 true index!1840 x!1490))))

(declare-fun b!329448 () Bool)

(assert (=> b!329448 (= e!202366 e!202369)))

(declare-fun c!51571 () Bool)

(assert (=> b!329448 (= c!51571 (or (= lt!158267 k!2497) (= (bvadd lt!158267 lt!158267) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!70217 c!51570) b!329447))

(assert (= (and d!70217 (not c!51570)) b!329448))

(assert (= (and b!329448 c!51571) b!329440))

(assert (= (and b!329448 (not c!51571)) b!329446))

(assert (= (and d!70217 c!51572) b!329443))

(assert (= (and d!70217 (not c!51572)) b!329441))

(assert (= (and b!329441 res!181581) b!329445))

(assert (= (and b!329445 (not res!181583)) b!329442))

(assert (= (and b!329442 (not res!181582)) b!329444))

(declare-fun m!335347 () Bool)

(assert (=> b!329446 m!335347))

(assert (=> b!329446 m!335347))

(declare-fun m!335349 () Bool)

(assert (=> b!329446 m!335349))

(declare-fun m!335351 () Bool)

(assert (=> b!329445 m!335351))

(assert (=> b!329444 m!335351))

(assert (=> d!70217 m!335259))

(assert (=> d!70217 m!335255))

(assert (=> b!329442 m!335351))

(assert (=> b!329295 d!70217))

(declare-fun b!329517 () Bool)

(declare-fun e!202413 () SeekEntryResult!3064)

(assert (=> b!329517 (= e!202413 Undefined!3064)))

(declare-fun b!329518 () Bool)

(declare-fun e!202412 () SeekEntryResult!3064)

(declare-fun lt!158298 () SeekEntryResult!3064)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16846 (_ BitVec 32)) SeekEntryResult!3064)

(assert (=> b!329518 (= e!202412 (seekKeyOrZeroReturnVacant!0 (x!32802 lt!158298) (index!14434 lt!158298) (index!14434 lt!158298) k!2497 a!3305 mask!3777))))

(declare-fun b!329520 () Bool)

(assert (=> b!329520 (= e!202412 (MissingZero!3064 (index!14434 lt!158298)))))

(declare-fun b!329521 () Bool)

(declare-fun c!51596 () Bool)

(declare-fun lt!158299 () (_ BitVec 64))

(assert (=> b!329521 (= c!51596 (= lt!158299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202414 () SeekEntryResult!3064)

(assert (=> b!329521 (= e!202414 e!202412)))

(declare-fun b!329522 () Bool)

(assert (=> b!329522 (= e!202413 e!202414)))

(assert (=> b!329522 (= lt!158299 (select (arr!7968 a!3305) (index!14434 lt!158298)))))

(declare-fun c!51598 () Bool)

(assert (=> b!329522 (= c!51598 (= lt!158299 k!2497))))

(declare-fun b!329519 () Bool)

(assert (=> b!329519 (= e!202414 (Found!3064 (index!14434 lt!158298)))))

(declare-fun d!70219 () Bool)

(declare-fun lt!158297 () SeekEntryResult!3064)

(assert (=> d!70219 (and (or (is-Undefined!3064 lt!158297) (not (is-Found!3064 lt!158297)) (and (bvsge (index!14433 lt!158297) #b00000000000000000000000000000000) (bvslt (index!14433 lt!158297) (size!8320 a!3305)))) (or (is-Undefined!3064 lt!158297) (is-Found!3064 lt!158297) (not (is-MissingZero!3064 lt!158297)) (and (bvsge (index!14432 lt!158297) #b00000000000000000000000000000000) (bvslt (index!14432 lt!158297) (size!8320 a!3305)))) (or (is-Undefined!3064 lt!158297) (is-Found!3064 lt!158297) (is-MissingZero!3064 lt!158297) (not (is-MissingVacant!3064 lt!158297)) (and (bvsge (index!14435 lt!158297) #b00000000000000000000000000000000) (bvslt (index!14435 lt!158297) (size!8320 a!3305)))) (or (is-Undefined!3064 lt!158297) (ite (is-Found!3064 lt!158297) (= (select (arr!7968 a!3305) (index!14433 lt!158297)) k!2497) (ite (is-MissingZero!3064 lt!158297) (= (select (arr!7968 a!3305) (index!14432 lt!158297)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3064 lt!158297) (= (select (arr!7968 a!3305) (index!14435 lt!158297)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70219 (= lt!158297 e!202413)))

(declare-fun c!51597 () Bool)

(assert (=> d!70219 (= c!51597 (and (is-Intermediate!3064 lt!158298) (undefined!3876 lt!158298)))))

(assert (=> d!70219 (= lt!158298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70219 (validMask!0 mask!3777)))

(assert (=> d!70219 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158297)))

(assert (= (and d!70219 c!51597) b!329517))

(assert (= (and d!70219 (not c!51597)) b!329522))

(assert (= (and b!329522 c!51598) b!329519))

(assert (= (and b!329522 (not c!51598)) b!329521))

(assert (= (and b!329521 c!51596) b!329520))

(assert (= (and b!329521 (not c!51596)) b!329518))

(declare-fun m!335381 () Bool)

(assert (=> b!329518 m!335381))

(declare-fun m!335383 () Bool)

(assert (=> b!329522 m!335383))

(declare-fun m!335385 () Bool)

(assert (=> d!70219 m!335385))

(declare-fun m!335387 () Bool)

(assert (=> d!70219 m!335387))

(declare-fun m!335389 () Bool)

(assert (=> d!70219 m!335389))

(assert (=> d!70219 m!335255))

(assert (=> d!70219 m!335243))

(assert (=> d!70219 m!335245))

(assert (=> d!70219 m!335243))

(assert (=> b!329296 d!70219))

(push 1)

(assert (not b!329446))

(assert (not d!70217))

(assert (not d!70207))

(assert (not b!329407))

(assert (not bm!26132))

(assert (not d!70219))

(assert (not b!329518))

(assert (not d!70205))

(assert (not b!329400))

(assert (not b!329341))

(assert (not b!329391))

(assert (not d!70179))

(assert (not b!329392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

