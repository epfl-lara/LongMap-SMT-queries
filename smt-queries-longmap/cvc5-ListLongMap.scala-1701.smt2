; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31142 () Bool)

(assert start!31142)

(declare-datatypes ((array!15999 0))(
  ( (array!16000 (arr!7580 (Array (_ BitVec 32) (_ BitVec 64))) (size!7932 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15999)

(declare-fun b!313152 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun e!195182 () Bool)

(assert (=> b!313152 (= e!195182 (and (bvslt resX!52 #b01111111111111111111111111111110) (= (select (arr!7580 a!3293) index!1781) k!2441)))))

(declare-fun b!313153 () Bool)

(declare-fun res!169468 () Bool)

(declare-fun e!195184 () Bool)

(assert (=> b!313153 (=> (not res!169468) (not e!195184))))

(declare-fun arrayContainsKey!0 (array!15999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313153 (= res!169468 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313154 () Bool)

(declare-fun res!169471 () Bool)

(assert (=> b!313154 (=> (not res!169471) (not e!195184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313154 (= res!169471 (validKeyInArray!0 k!2441))))

(declare-fun b!313155 () Bool)

(declare-fun res!169472 () Bool)

(assert (=> b!313155 (=> (not res!169472) (not e!195182))))

(declare-datatypes ((SeekEntryResult!2720 0))(
  ( (MissingZero!2720 (index!13056 (_ BitVec 32))) (Found!2720 (index!13057 (_ BitVec 32))) (Intermediate!2720 (undefined!3532 Bool) (index!13058 (_ BitVec 32)) (x!31267 (_ BitVec 32))) (Undefined!2720) (MissingVacant!2720 (index!13059 (_ BitVec 32))) )
))
(declare-fun lt!153453 () SeekEntryResult!2720)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15999 (_ BitVec 32)) SeekEntryResult!2720)

(assert (=> b!313155 (= res!169472 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153453))))

(declare-fun b!313156 () Bool)

(assert (=> b!313156 (= e!195184 e!195182)))

(declare-fun res!169465 () Bool)

(assert (=> b!313156 (=> (not res!169465) (not e!195182))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313156 (= res!169465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153453))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!313156 (= lt!153453 (Intermediate!2720 false resIndex!52 resX!52))))

(declare-fun b!313157 () Bool)

(declare-fun res!169469 () Bool)

(assert (=> b!313157 (=> (not res!169469) (not e!195184))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313157 (= res!169469 (and (= (size!7932 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7932 a!3293))))))

(declare-fun res!169473 () Bool)

(assert (=> start!31142 (=> (not res!169473) (not e!195184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31142 (= res!169473 (validMask!0 mask!3709))))

(assert (=> start!31142 e!195184))

(declare-fun array_inv!5543 (array!15999) Bool)

(assert (=> start!31142 (array_inv!5543 a!3293)))

(assert (=> start!31142 true))

(declare-fun b!313158 () Bool)

(declare-fun res!169466 () Bool)

(assert (=> b!313158 (=> (not res!169466) (not e!195184))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15999 (_ BitVec 32)) SeekEntryResult!2720)

(assert (=> b!313158 (= res!169466 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2720 i!1240)))))

(declare-fun b!313159 () Bool)

(declare-fun res!169470 () Bool)

(assert (=> b!313159 (=> (not res!169470) (not e!195184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15999 (_ BitVec 32)) Bool)

(assert (=> b!313159 (= res!169470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313160 () Bool)

(declare-fun res!169467 () Bool)

(assert (=> b!313160 (=> (not res!169467) (not e!195182))))

(assert (=> b!313160 (= res!169467 (and (= (select (arr!7580 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7932 a!3293))))))

(assert (= (and start!31142 res!169473) b!313157))

(assert (= (and b!313157 res!169469) b!313154))

(assert (= (and b!313154 res!169471) b!313153))

(assert (= (and b!313153 res!169468) b!313158))

(assert (= (and b!313158 res!169466) b!313159))

(assert (= (and b!313159 res!169470) b!313156))

(assert (= (and b!313156 res!169465) b!313160))

(assert (= (and b!313160 res!169467) b!313155))

(assert (= (and b!313155 res!169472) b!313152))

(declare-fun m!323177 () Bool)

(assert (=> b!313156 m!323177))

(assert (=> b!313156 m!323177))

(declare-fun m!323179 () Bool)

(assert (=> b!313156 m!323179))

(declare-fun m!323181 () Bool)

(assert (=> b!313160 m!323181))

(declare-fun m!323183 () Bool)

(assert (=> start!31142 m!323183))

(declare-fun m!323185 () Bool)

(assert (=> start!31142 m!323185))

(declare-fun m!323187 () Bool)

(assert (=> b!313159 m!323187))

(declare-fun m!323189 () Bool)

(assert (=> b!313153 m!323189))

(declare-fun m!323191 () Bool)

(assert (=> b!313154 m!323191))

(declare-fun m!323193 () Bool)

(assert (=> b!313155 m!323193))

(declare-fun m!323195 () Bool)

(assert (=> b!313158 m!323195))

(declare-fun m!323197 () Bool)

(assert (=> b!313152 m!323197))

(push 1)

(assert (not b!313153))

(assert (not b!313154))

(assert (not b!313155))

(assert (not start!31142))

(assert (not b!313158))

(assert (not b!313156))

(assert (not b!313159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68539 () Bool)

(assert (=> d!68539 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313154 d!68539))

(declare-fun d!68541 () Bool)

(declare-fun res!169544 () Bool)

(declare-fun e!195225 () Bool)

(assert (=> d!68541 (=> res!169544 e!195225)))

(assert (=> d!68541 (= res!169544 (bvsge #b00000000000000000000000000000000 (size!7932 a!3293)))))

(assert (=> d!68541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195225)))

(declare-fun bm!25936 () Bool)

(declare-fun call!25939 () Bool)

(assert (=> bm!25936 (= call!25939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313247 () Bool)

(declare-fun e!195226 () Bool)

(declare-fun e!195227 () Bool)

(assert (=> b!313247 (= e!195226 e!195227)))

(declare-fun lt!153470 () (_ BitVec 64))

(assert (=> b!313247 (= lt!153470 (select (arr!7580 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9671 0))(
  ( (Unit!9672) )
))
(declare-fun lt!153471 () Unit!9671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15999 (_ BitVec 64) (_ BitVec 32)) Unit!9671)

(assert (=> b!313247 (= lt!153471 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153470 #b00000000000000000000000000000000))))

(assert (=> b!313247 (arrayContainsKey!0 a!3293 lt!153470 #b00000000000000000000000000000000)))

(declare-fun lt!153472 () Unit!9671)

(assert (=> b!313247 (= lt!153472 lt!153471)))

(declare-fun res!169545 () Bool)

(assert (=> b!313247 (= res!169545 (= (seekEntryOrOpen!0 (select (arr!7580 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2720 #b00000000000000000000000000000000)))))

(assert (=> b!313247 (=> (not res!169545) (not e!195227))))

(declare-fun b!313248 () Bool)

(assert (=> b!313248 (= e!195227 call!25939)))

(declare-fun b!313249 () Bool)

(assert (=> b!313249 (= e!195226 call!25939)))

(declare-fun b!313250 () Bool)

(assert (=> b!313250 (= e!195225 e!195226)))

(declare-fun c!49458 () Bool)

(assert (=> b!313250 (= c!49458 (validKeyInArray!0 (select (arr!7580 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68541 (not res!169544)) b!313250))

(assert (= (and b!313250 c!49458) b!313247))

(assert (= (and b!313250 (not c!49458)) b!313249))

(assert (= (and b!313247 res!169545) b!313248))

(assert (= (or b!313248 b!313249) bm!25936))

(declare-fun m!323247 () Bool)

(assert (=> bm!25936 m!323247))

(declare-fun m!323249 () Bool)

(assert (=> b!313247 m!323249))

(declare-fun m!323251 () Bool)

(assert (=> b!313247 m!323251))

(declare-fun m!323253 () Bool)

(assert (=> b!313247 m!323253))

(assert (=> b!313247 m!323249))

(declare-fun m!323255 () Bool)

(assert (=> b!313247 m!323255))

(assert (=> b!313250 m!323249))

(assert (=> b!313250 m!323249))

(declare-fun m!323257 () Bool)

(assert (=> b!313250 m!323257))

(assert (=> b!313159 d!68541))

(declare-fun b!313308 () Bool)

(declare-fun e!195263 () Bool)

(declare-fun lt!153489 () SeekEntryResult!2720)

(assert (=> b!313308 (= e!195263 (bvsge (x!31267 lt!153489) #b01111111111111111111111111111110))))

(declare-fun b!313309 () Bool)

(declare-fun e!195262 () SeekEntryResult!2720)

(assert (=> b!313309 (= e!195262 (Intermediate!2720 true index!1781 x!1427))))

(declare-fun b!313310 () Bool)

(declare-fun e!195259 () Bool)

(assert (=> b!313310 (= e!195263 e!195259)))

(declare-fun res!169561 () Bool)

(assert (=> b!313310 (= res!169561 (and (is-Intermediate!2720 lt!153489) (not (undefined!3532 lt!153489)) (bvslt (x!31267 lt!153489) #b01111111111111111111111111111110) (bvsge (x!31267 lt!153489) #b00000000000000000000000000000000) (bvsge (x!31267 lt!153489) x!1427)))))

(assert (=> b!313310 (=> (not res!169561) (not e!195259))))

(declare-fun b!313311 () Bool)

(assert (=> b!313311 (and (bvsge (index!13058 lt!153489) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153489) (size!7932 a!3293)))))

(declare-fun res!169563 () Bool)

(assert (=> b!313311 (= res!169563 (= (select (arr!7580 a!3293) (index!13058 lt!153489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195261 () Bool)

(assert (=> b!313311 (=> res!169563 e!195261)))

(declare-fun b!313312 () Bool)

(assert (=> b!313312 (and (bvsge (index!13058 lt!153489) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153489) (size!7932 a!3293)))))

(assert (=> b!313312 (= e!195261 (= (select (arr!7580 a!3293) (index!13058 lt!153489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313313 () Bool)

(declare-fun e!195260 () SeekEntryResult!2720)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313313 (= e!195260 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313314 () Bool)

(assert (=> b!313314 (and (bvsge (index!13058 lt!153489) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153489) (size!7932 a!3293)))))

(declare-fun res!169562 () Bool)

(assert (=> b!313314 (= res!169562 (= (select (arr!7580 a!3293) (index!13058 lt!153489)) k!2441))))

(assert (=> b!313314 (=> res!169562 e!195261)))

(assert (=> b!313314 (= e!195259 e!195261)))

(declare-fun d!68545 () Bool)

(assert (=> d!68545 e!195263))

(declare-fun c!49481 () Bool)

(assert (=> d!68545 (= c!49481 (and (is-Intermediate!2720 lt!153489) (undefined!3532 lt!153489)))))

(assert (=> d!68545 (= lt!153489 e!195262)))

(declare-fun c!49480 () Bool)

(assert (=> d!68545 (= c!49480 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153490 () (_ BitVec 64))

(assert (=> d!68545 (= lt!153490 (select (arr!7580 a!3293) index!1781))))

(assert (=> d!68545 (validMask!0 mask!3709)))

(assert (=> d!68545 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153489)))

(declare-fun b!313315 () Bool)

(assert (=> b!313315 (= e!195260 (Intermediate!2720 false index!1781 x!1427))))

(declare-fun b!313316 () Bool)

(assert (=> b!313316 (= e!195262 e!195260)))

(declare-fun c!49482 () Bool)

(assert (=> b!313316 (= c!49482 (or (= lt!153490 k!2441) (= (bvadd lt!153490 lt!153490) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68545 c!49480) b!313309))

(assert (= (and d!68545 (not c!49480)) b!313316))

(assert (= (and b!313316 c!49482) b!313315))

(assert (= (and b!313316 (not c!49482)) b!313313))

(assert (= (and d!68545 c!49481) b!313308))

(assert (= (and d!68545 (not c!49481)) b!313310))

(assert (= (and b!313310 res!169561) b!313314))

(assert (= (and b!313314 (not res!169562)) b!313311))

(assert (= (and b!313311 (not res!169563)) b!313312))

(declare-fun m!323267 () Bool)

(assert (=> b!313314 m!323267))

(assert (=> b!313312 m!323267))

(assert (=> b!313311 m!323267))

(assert (=> d!68545 m!323197))

(assert (=> d!68545 m!323183))

(declare-fun m!323273 () Bool)

(assert (=> b!313313 m!323273))

(assert (=> b!313313 m!323273))

(declare-fun m!323279 () Bool)

(assert (=> b!313313 m!323279))

(assert (=> b!313155 d!68545))

(declare-fun b!313334 () Bool)

(declare-fun e!195280 () Bool)

(declare-fun lt!153497 () SeekEntryResult!2720)

(assert (=> b!313334 (= e!195280 (bvsge (x!31267 lt!153497) #b01111111111111111111111111111110))))

(declare-fun b!313336 () Bool)

(declare-fun e!195279 () SeekEntryResult!2720)

(assert (=> b!313336 (= e!195279 (Intermediate!2720 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313338 () Bool)

(declare-fun e!195274 () Bool)

(assert (=> b!313338 (= e!195280 e!195274)))

(declare-fun res!169570 () Bool)

(assert (=> b!313338 (= res!169570 (and (is-Intermediate!2720 lt!153497) (not (undefined!3532 lt!153497)) (bvslt (x!31267 lt!153497) #b01111111111111111111111111111110) (bvsge (x!31267 lt!153497) #b00000000000000000000000000000000) (bvsge (x!31267 lt!153497) #b00000000000000000000000000000000)))))

(assert (=> b!313338 (=> (not res!169570) (not e!195274))))

(declare-fun b!313340 () Bool)

(assert (=> b!313340 (and (bvsge (index!13058 lt!153497) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153497) (size!7932 a!3293)))))

(declare-fun res!169572 () Bool)

(assert (=> b!313340 (= res!169572 (= (select (arr!7580 a!3293) (index!13058 lt!153497)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195277 () Bool)

(assert (=> b!313340 (=> res!169572 e!195277)))

(declare-fun b!313342 () Bool)

(assert (=> b!313342 (and (bvsge (index!13058 lt!153497) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153497) (size!7932 a!3293)))))

(assert (=> b!313342 (= e!195277 (= (select (arr!7580 a!3293) (index!13058 lt!153497)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313344 () Bool)

(declare-fun e!195275 () SeekEntryResult!2720)

(assert (=> b!313344 (= e!195275 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313346 () Bool)

(assert (=> b!313346 (and (bvsge (index!13058 lt!153497) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153497) (size!7932 a!3293)))))

(declare-fun res!169571 () Bool)

(assert (=> b!313346 (= res!169571 (= (select (arr!7580 a!3293) (index!13058 lt!153497)) k!2441))))

(assert (=> b!313346 (=> res!169571 e!195277)))

(assert (=> b!313346 (= e!195274 e!195277)))

(declare-fun d!68555 () Bool)

(assert (=> d!68555 e!195280))

(declare-fun c!49492 () Bool)

(assert (=> d!68555 (= c!49492 (and (is-Intermediate!2720 lt!153497) (undefined!3532 lt!153497)))))

(assert (=> d!68555 (= lt!153497 e!195279)))

(declare-fun c!49489 () Bool)

(assert (=> d!68555 (= c!49489 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153499 () (_ BitVec 64))

(assert (=> d!68555 (= lt!153499 (select (arr!7580 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68555 (validMask!0 mask!3709)))

(assert (=> d!68555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153497)))

(declare-fun b!313348 () Bool)

(assert (=> b!313348 (= e!195275 (Intermediate!2720 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313349 () Bool)

(assert (=> b!313349 (= e!195279 e!195275)))

(declare-fun c!49494 () Bool)

(assert (=> b!313349 (= c!49494 (or (= lt!153499 k!2441) (= (bvadd lt!153499 lt!153499) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68555 c!49489) b!313336))

(assert (= (and d!68555 (not c!49489)) b!313349))

(assert (= (and b!313349 c!49494) b!313348))

(assert (= (and b!313349 (not c!49494)) b!313344))

(assert (= (and d!68555 c!49492) b!313334))

(assert (= (and d!68555 (not c!49492)) b!313338))

(assert (= (and b!313338 res!169570) b!313346))

(assert (= (and b!313346 (not res!169571)) b!313340))

(assert (= (and b!313340 (not res!169572)) b!313342))

(declare-fun m!323287 () Bool)

(assert (=> b!313346 m!323287))

(assert (=> b!313342 m!323287))

(assert (=> b!313340 m!323287))

(assert (=> d!68555 m!323177))

(declare-fun m!323295 () Bool)

(assert (=> d!68555 m!323295))

(assert (=> d!68555 m!323183))

(assert (=> b!313344 m!323177))

(declare-fun m!323297 () Bool)

(assert (=> b!313344 m!323297))

(assert (=> b!313344 m!323297))

(declare-fun m!323301 () Bool)

(assert (=> b!313344 m!323301))

(assert (=> b!313156 d!68555))

(declare-fun d!68561 () Bool)

(declare-fun lt!153511 () (_ BitVec 32))

(declare-fun lt!153510 () (_ BitVec 32))

(assert (=> d!68561 (= lt!153511 (bvmul (bvxor lt!153510 (bvlshr lt!153510 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68561 (= lt!153510 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68561 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169574 (let ((h!5350 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31274 (bvmul (bvxor h!5350 (bvlshr h!5350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31274 (bvlshr x!31274 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169574 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169574 #b00000000000000000000000000000000))))))

(assert (=> d!68561 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153511 (bvlshr lt!153511 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313156 d!68561))

(declare-fun d!68565 () Bool)

(declare-fun res!169583 () Bool)

(declare-fun e!195292 () Bool)

(assert (=> d!68565 (=> res!169583 e!195292)))

(assert (=> d!68565 (= res!169583 (= (select (arr!7580 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68565 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195292)))

(declare-fun b!313362 () Bool)

(declare-fun e!195293 () Bool)

(assert (=> b!313362 (= e!195292 e!195293)))

(declare-fun res!169584 () Bool)

(assert (=> b!313362 (=> (not res!169584) (not e!195293))))

(assert (=> b!313362 (= res!169584 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7932 a!3293)))))

(declare-fun b!313363 () Bool)

(assert (=> b!313363 (= e!195293 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68565 (not res!169583)) b!313362))

(assert (= (and b!313362 res!169584) b!313363))

(assert (=> d!68565 m!323249))

(declare-fun m!323303 () Bool)

(assert (=> b!313363 m!323303))

(assert (=> b!313153 d!68565))

(declare-fun b!313407 () Bool)

(declare-fun c!49512 () Bool)

(declare-fun lt!153545 () (_ BitVec 64))

(assert (=> b!313407 (= c!49512 (= lt!153545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195324 () SeekEntryResult!2720)

(declare-fun e!195323 () SeekEntryResult!2720)

(assert (=> b!313407 (= e!195324 e!195323)))

(declare-fun b!313408 () Bool)

(declare-fun e!195325 () SeekEntryResult!2720)

(assert (=> b!313408 (= e!195325 Undefined!2720)))

(declare-fun b!313409 () Bool)

(declare-fun lt!153544 () SeekEntryResult!2720)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15999 (_ BitVec 32)) SeekEntryResult!2720)

(assert (=> b!313409 (= e!195323 (seekKeyOrZeroReturnVacant!0 (x!31267 lt!153544) (index!13058 lt!153544) (index!13058 lt!153544) k!2441 a!3293 mask!3709))))

(declare-fun b!313410 () Bool)

(assert (=> b!313410 (= e!195324 (Found!2720 (index!13058 lt!153544)))))

(declare-fun b!313411 () Bool)

(assert (=> b!313411 (= e!195325 e!195324)))

(assert (=> b!313411 (= lt!153545 (select (arr!7580 a!3293) (index!13058 lt!153544)))))

(declare-fun c!49510 () Bool)

(assert (=> b!313411 (= c!49510 (= lt!153545 k!2441))))

(declare-fun b!313412 () Bool)

(assert (=> b!313412 (= e!195323 (MissingZero!2720 (index!13058 lt!153544)))))

(declare-fun d!68567 () Bool)

(declare-fun lt!153546 () SeekEntryResult!2720)

(assert (=> d!68567 (and (or (is-Undefined!2720 lt!153546) (not (is-Found!2720 lt!153546)) (and (bvsge (index!13057 lt!153546) #b00000000000000000000000000000000) (bvslt (index!13057 lt!153546) (size!7932 a!3293)))) (or (is-Undefined!2720 lt!153546) (is-Found!2720 lt!153546) (not (is-MissingZero!2720 lt!153546)) (and (bvsge (index!13056 lt!153546) #b00000000000000000000000000000000) (bvslt (index!13056 lt!153546) (size!7932 a!3293)))) (or (is-Undefined!2720 lt!153546) (is-Found!2720 lt!153546) (is-MissingZero!2720 lt!153546) (not (is-MissingVacant!2720 lt!153546)) (and (bvsge (index!13059 lt!153546) #b00000000000000000000000000000000) (bvslt (index!13059 lt!153546) (size!7932 a!3293)))) (or (is-Undefined!2720 lt!153546) (ite (is-Found!2720 lt!153546) (= (select (arr!7580 a!3293) (index!13057 lt!153546)) k!2441) (ite (is-MissingZero!2720 lt!153546) (= (select (arr!7580 a!3293) (index!13056 lt!153546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2720 lt!153546) (= (select (arr!7580 a!3293) (index!13059 lt!153546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68567 (= lt!153546 e!195325)))

(declare-fun c!49511 () Bool)

(assert (=> d!68567 (= c!49511 (and (is-Intermediate!2720 lt!153544) (undefined!3532 lt!153544)))))

(assert (=> d!68567 (= lt!153544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68567 (validMask!0 mask!3709)))

(assert (=> d!68567 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153546)))

(assert (= (and d!68567 c!49511) b!313408))

(assert (= (and d!68567 (not c!49511)) b!313411))

(assert (= (and b!313411 c!49510) b!313410))

(assert (= (and b!313411 (not c!49510)) b!313407))

(assert (= (and b!313407 c!49512) b!313412))

(assert (= (and b!313407 (not c!49512)) b!313409))

(declare-fun m!323337 () Bool)

(assert (=> b!313409 m!323337))

(declare-fun m!323339 () Bool)

(assert (=> b!313411 m!323339))

(declare-fun m!323341 () Bool)

(assert (=> d!68567 m!323341))

(assert (=> d!68567 m!323177))

(declare-fun m!323343 () Bool)

(assert (=> d!68567 m!323343))

(declare-fun m!323345 () Bool)

(assert (=> d!68567 m!323345))

(assert (=> d!68567 m!323177))

(assert (=> d!68567 m!323179))

(assert (=> d!68567 m!323183))

(assert (=> b!313158 d!68567))

(declare-fun d!68585 () Bool)

(assert (=> d!68585 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31142 d!68585))

(declare-fun d!68587 () Bool)

(assert (=> d!68587 (= (array_inv!5543 a!3293) (bvsge (size!7932 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31142 d!68587))

(push 1)

