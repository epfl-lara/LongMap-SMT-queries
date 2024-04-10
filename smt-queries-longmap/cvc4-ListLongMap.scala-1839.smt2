; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33302 () Bool)

(assert start!33302)

(declare-fun b!331188 () Bool)

(declare-fun res!182598 () Bool)

(declare-fun e!203184 () Bool)

(assert (=> b!331188 (=> (not res!182598) (not e!203184))))

(declare-datatypes ((array!16910 0))(
  ( (array!16911 (arr!7996 (Array (_ BitVec 32) (_ BitVec 64))) (size!8348 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16910)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16910 (_ BitVec 32)) Bool)

(assert (=> b!331188 (= res!182598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!182597 () Bool)

(assert (=> start!33302 (=> (not res!182597) (not e!203184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33302 (= res!182597 (validMask!0 mask!3777))))

(assert (=> start!33302 e!203184))

(declare-fun array_inv!5959 (array!16910) Bool)

(assert (=> start!33302 (array_inv!5959 a!3305)))

(assert (=> start!33302 true))

(declare-fun b!331189 () Bool)

(declare-fun res!182592 () Bool)

(assert (=> b!331189 (=> (not res!182592) (not e!203184))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331189 (= res!182592 (validKeyInArray!0 k!2497))))

(declare-fun b!331190 () Bool)

(declare-fun e!203183 () Bool)

(assert (=> b!331190 (= e!203184 e!203183)))

(declare-fun res!182591 () Bool)

(assert (=> b!331190 (=> (not res!182591) (not e!203183))))

(declare-datatypes ((SeekEntryResult!3127 0))(
  ( (MissingZero!3127 (index!14684 (_ BitVec 32))) (Found!3127 (index!14685 (_ BitVec 32))) (Intermediate!3127 (undefined!3939 Bool) (index!14686 (_ BitVec 32)) (x!32967 (_ BitVec 32))) (Undefined!3127) (MissingVacant!3127 (index!14687 (_ BitVec 32))) )
))
(declare-fun lt!158742 () SeekEntryResult!3127)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16910 (_ BitVec 32)) SeekEntryResult!3127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331190 (= res!182591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158742))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!331190 (= lt!158742 (Intermediate!3127 false resIndex!58 resX!58))))

(declare-fun b!331191 () Bool)

(declare-fun res!182596 () Bool)

(assert (=> b!331191 (=> (not res!182596) (not e!203184))))

(declare-fun arrayContainsKey!0 (array!16910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331191 (= res!182596 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!331192 () Bool)

(declare-fun e!203182 () Bool)

(assert (=> b!331192 (= e!203183 e!203182)))

(declare-fun res!182594 () Bool)

(assert (=> b!331192 (=> (not res!182594) (not e!203182))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!158741 () SeekEntryResult!3127)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!331192 (= res!182594 (and (= lt!158741 lt!158742) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7996 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (=> b!331192 (= lt!158741 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!331193 () Bool)

(declare-fun res!182595 () Bool)

(assert (=> b!331193 (=> (not res!182595) (not e!203184))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16910 (_ BitVec 32)) SeekEntryResult!3127)

(assert (=> b!331193 (= res!182595 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3127 i!1250)))))

(declare-fun b!331194 () Bool)

(declare-fun res!182590 () Bool)

(assert (=> b!331194 (=> (not res!182590) (not e!203183))))

(assert (=> b!331194 (= res!182590 (and (= (select (arr!7996 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8348 a!3305))))))

(declare-fun b!331195 () Bool)

(assert (=> b!331195 (= e!203182 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16911 (store (arr!7996 a!3305) i!1250 k!2497) (size!8348 a!3305)) mask!3777) lt!158741)))))

(declare-datatypes ((Unit!10333 0))(
  ( (Unit!10334) )
))
(declare-fun lt!158740 () Unit!10333)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16910 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10333)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331195 (= lt!158740 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331196 () Bool)

(declare-fun res!182593 () Bool)

(assert (=> b!331196 (=> (not res!182593) (not e!203184))))

(assert (=> b!331196 (= res!182593 (and (= (size!8348 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8348 a!3305))))))

(assert (= (and start!33302 res!182597) b!331196))

(assert (= (and b!331196 res!182593) b!331189))

(assert (= (and b!331189 res!182592) b!331191))

(assert (= (and b!331191 res!182596) b!331193))

(assert (= (and b!331193 res!182595) b!331188))

(assert (= (and b!331188 res!182598) b!331190))

(assert (= (and b!331190 res!182591) b!331194))

(assert (= (and b!331194 res!182590) b!331192))

(assert (= (and b!331192 res!182594) b!331195))

(declare-fun m!336191 () Bool)

(assert (=> b!331193 m!336191))

(declare-fun m!336193 () Bool)

(assert (=> b!331194 m!336193))

(declare-fun m!336195 () Bool)

(assert (=> b!331188 m!336195))

(declare-fun m!336197 () Bool)

(assert (=> b!331190 m!336197))

(assert (=> b!331190 m!336197))

(declare-fun m!336199 () Bool)

(assert (=> b!331190 m!336199))

(declare-fun m!336201 () Bool)

(assert (=> start!33302 m!336201))

(declare-fun m!336203 () Bool)

(assert (=> start!33302 m!336203))

(declare-fun m!336205 () Bool)

(assert (=> b!331192 m!336205))

(declare-fun m!336207 () Bool)

(assert (=> b!331192 m!336207))

(declare-fun m!336209 () Bool)

(assert (=> b!331189 m!336209))

(declare-fun m!336211 () Bool)

(assert (=> b!331195 m!336211))

(declare-fun m!336213 () Bool)

(assert (=> b!331195 m!336213))

(declare-fun m!336215 () Bool)

(assert (=> b!331195 m!336215))

(assert (=> b!331195 m!336215))

(declare-fun m!336217 () Bool)

(assert (=> b!331195 m!336217))

(declare-fun m!336219 () Bool)

(assert (=> b!331191 m!336219))

(push 1)

(assert (not b!331193))

(assert (not start!33302))

(assert (not b!331192))

(assert (not b!331188))

(assert (not b!331195))

(assert (not b!331189))

(assert (not b!331190))

(assert (not b!331191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70387 () Bool)

(declare-fun lt!158804 () SeekEntryResult!3127)

(assert (=> d!70387 (and (or (is-Undefined!3127 lt!158804) (not (is-Found!3127 lt!158804)) (and (bvsge (index!14685 lt!158804) #b00000000000000000000000000000000) (bvslt (index!14685 lt!158804) (size!8348 a!3305)))) (or (is-Undefined!3127 lt!158804) (is-Found!3127 lt!158804) (not (is-MissingZero!3127 lt!158804)) (and (bvsge (index!14684 lt!158804) #b00000000000000000000000000000000) (bvslt (index!14684 lt!158804) (size!8348 a!3305)))) (or (is-Undefined!3127 lt!158804) (is-Found!3127 lt!158804) (is-MissingZero!3127 lt!158804) (not (is-MissingVacant!3127 lt!158804)) (and (bvsge (index!14687 lt!158804) #b00000000000000000000000000000000) (bvslt (index!14687 lt!158804) (size!8348 a!3305)))) (or (is-Undefined!3127 lt!158804) (ite (is-Found!3127 lt!158804) (= (select (arr!7996 a!3305) (index!14685 lt!158804)) k!2497) (ite (is-MissingZero!3127 lt!158804) (= (select (arr!7996 a!3305) (index!14684 lt!158804)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3127 lt!158804) (= (select (arr!7996 a!3305) (index!14687 lt!158804)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!203268 () SeekEntryResult!3127)

(assert (=> d!70387 (= lt!158804 e!203268)))

(declare-fun c!51988 () Bool)

(declare-fun lt!158802 () SeekEntryResult!3127)

(assert (=> d!70387 (= c!51988 (and (is-Intermediate!3127 lt!158802) (undefined!3939 lt!158802)))))

(assert (=> d!70387 (= lt!158802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70387 (validMask!0 mask!3777)))

(assert (=> d!70387 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158804)))

(declare-fun b!331329 () Bool)

(declare-fun e!203266 () SeekEntryResult!3127)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16910 (_ BitVec 32)) SeekEntryResult!3127)

(assert (=> b!331329 (= e!203266 (seekKeyOrZeroReturnVacant!0 (x!32967 lt!158802) (index!14686 lt!158802) (index!14686 lt!158802) k!2497 a!3305 mask!3777))))

(declare-fun b!331330 () Bool)

(declare-fun c!51989 () Bool)

(declare-fun lt!158803 () (_ BitVec 64))

(assert (=> b!331330 (= c!51989 (= lt!158803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203267 () SeekEntryResult!3127)

(assert (=> b!331330 (= e!203267 e!203266)))

(declare-fun b!331331 () Bool)

(assert (=> b!331331 (= e!203267 (Found!3127 (index!14686 lt!158802)))))

(declare-fun b!331332 () Bool)

(assert (=> b!331332 (= e!203268 e!203267)))

(assert (=> b!331332 (= lt!158803 (select (arr!7996 a!3305) (index!14686 lt!158802)))))

(declare-fun c!51990 () Bool)

(assert (=> b!331332 (= c!51990 (= lt!158803 k!2497))))

(declare-fun b!331333 () Bool)

(assert (=> b!331333 (= e!203266 (MissingZero!3127 (index!14686 lt!158802)))))

(declare-fun b!331334 () Bool)

(assert (=> b!331334 (= e!203268 Undefined!3127)))

(assert (= (and d!70387 c!51988) b!331334))

(assert (= (and d!70387 (not c!51988)) b!331332))

(assert (= (and b!331332 c!51990) b!331331))

(assert (= (and b!331332 (not c!51990)) b!331330))

(assert (= (and b!331330 c!51989) b!331333))

(assert (= (and b!331330 (not c!51989)) b!331329))

(declare-fun m!336275 () Bool)

(assert (=> d!70387 m!336275))

(declare-fun m!336277 () Bool)

(assert (=> d!70387 m!336277))

(assert (=> d!70387 m!336197))

(assert (=> d!70387 m!336199))

(assert (=> d!70387 m!336201))

(assert (=> d!70387 m!336197))

(declare-fun m!336279 () Bool)

(assert (=> d!70387 m!336279))

(declare-fun m!336281 () Bool)

(assert (=> b!331329 m!336281))

(declare-fun m!336283 () Bool)

(assert (=> b!331332 m!336283))

(assert (=> b!331193 d!70387))

(declare-fun d!70403 () Bool)

(declare-fun res!182651 () Bool)

(declare-fun e!203297 () Bool)

(assert (=> d!70403 (=> res!182651 e!203297)))

(assert (=> d!70403 (= res!182651 (bvsge #b00000000000000000000000000000000 (size!8348 a!3305)))))

(assert (=> d!70403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!203297)))

(declare-fun b!331382 () Bool)

(declare-fun e!203296 () Bool)

(declare-fun call!26182 () Bool)

(assert (=> b!331382 (= e!203296 call!26182)))

(declare-fun b!331383 () Bool)

(declare-fun e!203295 () Bool)

(assert (=> b!331383 (= e!203295 e!203296)))

(declare-fun lt!158830 () (_ BitVec 64))

(assert (=> b!331383 (= lt!158830 (select (arr!7996 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158829 () Unit!10333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16910 (_ BitVec 64) (_ BitVec 32)) Unit!10333)

(assert (=> b!331383 (= lt!158829 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158830 #b00000000000000000000000000000000))))

(assert (=> b!331383 (arrayContainsKey!0 a!3305 lt!158830 #b00000000000000000000000000000000)))

(declare-fun lt!158828 () Unit!10333)

(assert (=> b!331383 (= lt!158828 lt!158829)))

(declare-fun res!182650 () Bool)

(assert (=> b!331383 (= res!182650 (= (seekEntryOrOpen!0 (select (arr!7996 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3127 #b00000000000000000000000000000000)))))

(assert (=> b!331383 (=> (not res!182650) (not e!203296))))

(declare-fun bm!26179 () Bool)

(assert (=> bm!26179 (= call!26182 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!331384 () Bool)

(assert (=> b!331384 (= e!203297 e!203295)))

(declare-fun c!52011 () Bool)

(assert (=> b!331384 (= c!52011 (validKeyInArray!0 (select (arr!7996 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!331385 () Bool)

(assert (=> b!331385 (= e!203295 call!26182)))

(assert (= (and d!70403 (not res!182651)) b!331384))

(assert (= (and b!331384 c!52011) b!331383))

(assert (= (and b!331384 (not c!52011)) b!331385))

(assert (= (and b!331383 res!182650) b!331382))

(assert (= (or b!331382 b!331385) bm!26179))

(declare-fun m!336299 () Bool)

(assert (=> b!331383 m!336299))

(declare-fun m!336301 () Bool)

(assert (=> b!331383 m!336301))

(declare-fun m!336303 () Bool)

(assert (=> b!331383 m!336303))

(assert (=> b!331383 m!336299))

(declare-fun m!336305 () Bool)

(assert (=> b!331383 m!336305))

(declare-fun m!336307 () Bool)

(assert (=> bm!26179 m!336307))

(assert (=> b!331384 m!336299))

(assert (=> b!331384 m!336299))

(declare-fun m!336309 () Bool)

(assert (=> b!331384 m!336309))

(assert (=> b!331188 d!70403))

(declare-fun b!331440 () Bool)

(declare-fun e!203330 () Bool)

(declare-fun lt!158851 () SeekEntryResult!3127)

(assert (=> b!331440 (= e!203330 (bvsge (x!32967 lt!158851) #b01111111111111111111111111111110))))

(declare-fun d!70411 () Bool)

(assert (=> d!70411 e!203330))

(declare-fun c!52032 () Bool)

(assert (=> d!70411 (= c!52032 (and (is-Intermediate!3127 lt!158851) (undefined!3939 lt!158851)))))

(declare-fun e!203333 () SeekEntryResult!3127)

(assert (=> d!70411 (= lt!158851 e!203333)))

(declare-fun c!52031 () Bool)

(assert (=> d!70411 (= c!52031 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158852 () (_ BitVec 64))

(assert (=> d!70411 (= lt!158852 (select (arr!7996 a!3305) index!1840))))

(assert (=> d!70411 (validMask!0 mask!3777)))

(assert (=> d!70411 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158851)))

(declare-fun b!331441 () Bool)

(declare-fun e!203334 () SeekEntryResult!3127)

(assert (=> b!331441 (= e!203334 (Intermediate!3127 false index!1840 x!1490))))

(declare-fun b!331442 () Bool)

(assert (=> b!331442 (and (bvsge (index!14686 lt!158851) #b00000000000000000000000000000000) (bvslt (index!14686 lt!158851) (size!8348 a!3305)))))

(declare-fun e!203331 () Bool)

(assert (=> b!331442 (= e!203331 (= (select (arr!7996 a!3305) (index!14686 lt!158851)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331443 () Bool)

(declare-fun e!203332 () Bool)

(assert (=> b!331443 (= e!203330 e!203332)))

(declare-fun res!182672 () Bool)

(assert (=> b!331443 (= res!182672 (and (is-Intermediate!3127 lt!158851) (not (undefined!3939 lt!158851)) (bvslt (x!32967 lt!158851) #b01111111111111111111111111111110) (bvsge (x!32967 lt!158851) #b00000000000000000000000000000000) (bvsge (x!32967 lt!158851) x!1490)))))

(assert (=> b!331443 (=> (not res!182672) (not e!203332))))

(declare-fun b!331444 () Bool)

(assert (=> b!331444 (= e!203334 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!331445 () Bool)

(assert (=> b!331445 (and (bvsge (index!14686 lt!158851) #b00000000000000000000000000000000) (bvslt (index!14686 lt!158851) (size!8348 a!3305)))))

(declare-fun res!182670 () Bool)

(assert (=> b!331445 (= res!182670 (= (select (arr!7996 a!3305) (index!14686 lt!158851)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!331445 (=> res!182670 e!203331)))

(declare-fun b!331446 () Bool)

