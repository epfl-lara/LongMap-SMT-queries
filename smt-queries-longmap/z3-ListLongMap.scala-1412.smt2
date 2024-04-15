; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27392 () Bool)

(assert start!27392)

(declare-fun b!283340 () Bool)

(declare-fun res!146319 () Bool)

(declare-fun e!179762 () Bool)

(assert (=> b!283340 (=> (not res!146319) (not e!179762))))

(declare-datatypes ((array!14136 0))(
  ( (array!14137 (arr!6708 (Array (_ BitVec 32) (_ BitVec 64))) (size!7061 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14136)

(declare-datatypes ((List!4489 0))(
  ( (Nil!4486) (Cons!4485 (h!5155 (_ BitVec 64)) (t!9562 List!4489)) )
))
(declare-fun arrayNoDuplicates!0 (array!14136 (_ BitVec 32) List!4489) Bool)

(assert (=> b!283340 (= res!146319 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4486))))

(declare-fun b!283341 () Bool)

(declare-fun res!146313 () Bool)

(assert (=> b!283341 (=> (not res!146313) (not e!179762))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!283341 (= res!146313 (and (= (size!7061 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7061 a!3325))))))

(declare-fun b!283342 () Bool)

(declare-fun res!146316 () Bool)

(declare-fun e!179765 () Bool)

(assert (=> b!283342 (=> (not res!146316) (not e!179765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14136 (_ BitVec 32)) Bool)

(assert (=> b!283342 (= res!146316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283343 () Bool)

(declare-fun e!179766 () Bool)

(assert (=> b!283343 (= e!179765 e!179766)))

(declare-fun res!146320 () Bool)

(assert (=> b!283343 (=> (not res!146320) (not e!179766))))

(assert (=> b!283343 (= res!146320 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139943 () array!14136)

(assert (=> b!283343 (= lt!139943 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)))))

(declare-fun b!283344 () Bool)

(declare-fun e!179764 () Bool)

(assert (=> b!283344 (= e!179764 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139943 mask!3868))))

(declare-fun b!283345 () Bool)

(assert (=> b!283345 (= e!179766 (not e!179764))))

(declare-fun res!146315 () Bool)

(assert (=> b!283345 (=> res!146315 e!179764)))

(assert (=> b!283345 (= res!146315 (bvslt startIndex!26 (bvsub (size!7061 a!3325) #b00000000000000000000000000000001)))))

(assert (=> b!283345 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8976 0))(
  ( (Unit!8977) )
))
(declare-fun lt!139942 () Unit!8976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> b!283345 (= lt!139942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1865 0))(
  ( (MissingZero!1865 (index!9630 (_ BitVec 32))) (Found!1865 (index!9631 (_ BitVec 32))) (Intermediate!1865 (undefined!2677 Bool) (index!9632 (_ BitVec 32)) (x!27854 (_ BitVec 32))) (Undefined!1865) (MissingVacant!1865 (index!9633 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14136 (_ BitVec 32)) SeekEntryResult!1865)

(assert (=> b!283345 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868))))

(declare-fun lt!139941 () Unit!8976)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14136 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> b!283345 (= lt!139941 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!283345 (arrayNoDuplicates!0 lt!139943 #b00000000000000000000000000000000 Nil!4486)))

(declare-fun lt!139944 () Unit!8976)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14136 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4489) Unit!8976)

(assert (=> b!283345 (= lt!139944 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4486))))

(declare-fun res!146312 () Bool)

(assert (=> start!27392 (=> (not res!146312) (not e!179762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27392 (= res!146312 (validMask!0 mask!3868))))

(assert (=> start!27392 e!179762))

(declare-fun array_inv!4680 (array!14136) Bool)

(assert (=> start!27392 (array_inv!4680 a!3325)))

(assert (=> start!27392 true))

(declare-fun b!283346 () Bool)

(declare-fun res!146314 () Bool)

(assert (=> b!283346 (=> (not res!146314) (not e!179766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283346 (= res!146314 (validKeyInArray!0 (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun b!283347 () Bool)

(declare-fun res!146317 () Bool)

(assert (=> b!283347 (=> (not res!146317) (not e!179762))))

(assert (=> b!283347 (= res!146317 (validKeyInArray!0 k0!2581))))

(declare-fun b!283348 () Bool)

(assert (=> b!283348 (= e!179762 e!179765)))

(declare-fun res!146311 () Bool)

(assert (=> b!283348 (=> (not res!146311) (not e!179765))))

(declare-fun lt!139940 () SeekEntryResult!1865)

(assert (=> b!283348 (= res!146311 (or (= lt!139940 (MissingZero!1865 i!1267)) (= lt!139940 (MissingVacant!1865 i!1267))))))

(assert (=> b!283348 (= lt!139940 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!283349 () Bool)

(declare-fun res!146318 () Bool)

(assert (=> b!283349 (=> (not res!146318) (not e!179762))))

(declare-fun arrayContainsKey!0 (array!14136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283349 (= res!146318 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27392 res!146312) b!283341))

(assert (= (and b!283341 res!146313) b!283347))

(assert (= (and b!283347 res!146317) b!283340))

(assert (= (and b!283340 res!146319) b!283349))

(assert (= (and b!283349 res!146318) b!283348))

(assert (= (and b!283348 res!146311) b!283342))

(assert (= (and b!283342 res!146316) b!283343))

(assert (= (and b!283343 res!146320) b!283346))

(assert (= (and b!283346 res!146314) b!283345))

(assert (= (and b!283345 (not res!146315)) b!283344))

(declare-fun m!297797 () Bool)

(assert (=> b!283347 m!297797))

(declare-fun m!297799 () Bool)

(assert (=> b!283343 m!297799))

(declare-fun m!297801 () Bool)

(assert (=> b!283344 m!297801))

(declare-fun m!297803 () Bool)

(assert (=> b!283340 m!297803))

(declare-fun m!297805 () Bool)

(assert (=> b!283345 m!297805))

(declare-fun m!297807 () Bool)

(assert (=> b!283345 m!297807))

(declare-fun m!297809 () Bool)

(assert (=> b!283345 m!297809))

(declare-fun m!297811 () Bool)

(assert (=> b!283345 m!297811))

(assert (=> b!283345 m!297809))

(assert (=> b!283345 m!297799))

(declare-fun m!297813 () Bool)

(assert (=> b!283345 m!297813))

(declare-fun m!297815 () Bool)

(assert (=> b!283345 m!297815))

(declare-fun m!297817 () Bool)

(assert (=> b!283345 m!297817))

(declare-fun m!297819 () Bool)

(assert (=> b!283345 m!297819))

(assert (=> b!283345 m!297815))

(declare-fun m!297821 () Bool)

(assert (=> b!283345 m!297821))

(declare-fun m!297823 () Bool)

(assert (=> start!27392 m!297823))

(declare-fun m!297825 () Bool)

(assert (=> start!27392 m!297825))

(declare-fun m!297827 () Bool)

(assert (=> b!283349 m!297827))

(declare-fun m!297829 () Bool)

(assert (=> b!283342 m!297829))

(assert (=> b!283346 m!297815))

(assert (=> b!283346 m!297815))

(declare-fun m!297831 () Bool)

(assert (=> b!283346 m!297831))

(declare-fun m!297833 () Bool)

(assert (=> b!283348 m!297833))

(check-sat (not b!283345) (not b!283342) (not b!283348) (not b!283347) (not b!283340) (not start!27392) (not b!283346) (not b!283349) (not b!283344))
(check-sat)
(get-model)

(declare-fun d!65217 () Bool)

(assert (=> d!65217 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27392 d!65217))

(declare-fun d!65219 () Bool)

(assert (=> d!65219 (= (array_inv!4680 a!3325) (bvsge (size!7061 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27392 d!65219))

(declare-fun d!65221 () Bool)

(declare-fun res!146385 () Bool)

(declare-fun e!179805 () Bool)

(assert (=> d!65221 (=> res!146385 e!179805)))

(assert (=> d!65221 (= res!146385 (bvsge startIndex!26 (size!7061 lt!139943)))))

(assert (=> d!65221 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139943 mask!3868) e!179805)))

(declare-fun b!283418 () Bool)

(declare-fun e!179803 () Bool)

(assert (=> b!283418 (= e!179805 e!179803)))

(declare-fun c!46069 () Bool)

(assert (=> b!283418 (= c!46069 (validKeyInArray!0 (select (arr!6708 lt!139943) startIndex!26)))))

(declare-fun b!283419 () Bool)

(declare-fun e!179804 () Bool)

(assert (=> b!283419 (= e!179803 e!179804)))

(declare-fun lt!139981 () (_ BitVec 64))

(assert (=> b!283419 (= lt!139981 (select (arr!6708 lt!139943) startIndex!26))))

(declare-fun lt!139983 () Unit!8976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14136 (_ BitVec 64) (_ BitVec 32)) Unit!8976)

(assert (=> b!283419 (= lt!139983 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139943 lt!139981 startIndex!26))))

(assert (=> b!283419 (arrayContainsKey!0 lt!139943 lt!139981 #b00000000000000000000000000000000)))

(declare-fun lt!139982 () Unit!8976)

(assert (=> b!283419 (= lt!139982 lt!139983)))

(declare-fun res!146386 () Bool)

(assert (=> b!283419 (= res!146386 (= (seekEntryOrOpen!0 (select (arr!6708 lt!139943) startIndex!26) lt!139943 mask!3868) (Found!1865 startIndex!26)))))

(assert (=> b!283419 (=> (not res!146386) (not e!179804))))

(declare-fun bm!25465 () Bool)

(declare-fun call!25468 () Bool)

(assert (=> bm!25465 (= call!25468 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139943 mask!3868))))

(declare-fun b!283420 () Bool)

(assert (=> b!283420 (= e!179803 call!25468)))

(declare-fun b!283421 () Bool)

(assert (=> b!283421 (= e!179804 call!25468)))

(assert (= (and d!65221 (not res!146385)) b!283418))

(assert (= (and b!283418 c!46069) b!283419))

(assert (= (and b!283418 (not c!46069)) b!283420))

(assert (= (and b!283419 res!146386) b!283421))

(assert (= (or b!283421 b!283420) bm!25465))

(declare-fun m!297911 () Bool)

(assert (=> b!283418 m!297911))

(assert (=> b!283418 m!297911))

(declare-fun m!297913 () Bool)

(assert (=> b!283418 m!297913))

(assert (=> b!283419 m!297911))

(declare-fun m!297915 () Bool)

(assert (=> b!283419 m!297915))

(declare-fun m!297917 () Bool)

(assert (=> b!283419 m!297917))

(assert (=> b!283419 m!297911))

(declare-fun m!297919 () Bool)

(assert (=> b!283419 m!297919))

(declare-fun m!297921 () Bool)

(assert (=> bm!25465 m!297921))

(assert (=> b!283344 d!65221))

(declare-fun b!283449 () Bool)

(declare-fun e!179824 () SeekEntryResult!1865)

(assert (=> b!283449 (= e!179824 Undefined!1865)))

(declare-fun b!283450 () Bool)

(declare-fun e!179826 () SeekEntryResult!1865)

(assert (=> b!283450 (= e!179824 e!179826)))

(declare-fun lt!139991 () (_ BitVec 64))

(declare-fun lt!139992 () SeekEntryResult!1865)

(assert (=> b!283450 (= lt!139991 (select (arr!6708 a!3325) (index!9632 lt!139992)))))

(declare-fun c!46079 () Bool)

(assert (=> b!283450 (= c!46079 (= lt!139991 (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun b!283451 () Bool)

(assert (=> b!283451 (= e!179826 (Found!1865 (index!9632 lt!139992)))))

(declare-fun d!65223 () Bool)

(declare-fun lt!139990 () SeekEntryResult!1865)

(get-info :version)

(assert (=> d!65223 (and (or ((_ is Undefined!1865) lt!139990) (not ((_ is Found!1865) lt!139990)) (and (bvsge (index!9631 lt!139990) #b00000000000000000000000000000000) (bvslt (index!9631 lt!139990) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!139990) ((_ is Found!1865) lt!139990) (not ((_ is MissingZero!1865) lt!139990)) (and (bvsge (index!9630 lt!139990) #b00000000000000000000000000000000) (bvslt (index!9630 lt!139990) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!139990) ((_ is Found!1865) lt!139990) ((_ is MissingZero!1865) lt!139990) (not ((_ is MissingVacant!1865) lt!139990)) (and (bvsge (index!9633 lt!139990) #b00000000000000000000000000000000) (bvslt (index!9633 lt!139990) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!139990) (ite ((_ is Found!1865) lt!139990) (= (select (arr!6708 a!3325) (index!9631 lt!139990)) (select (arr!6708 a!3325) startIndex!26)) (ite ((_ is MissingZero!1865) lt!139990) (= (select (arr!6708 a!3325) (index!9630 lt!139990)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1865) lt!139990) (= (select (arr!6708 a!3325) (index!9633 lt!139990)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65223 (= lt!139990 e!179824)))

(declare-fun c!46081 () Bool)

(assert (=> d!65223 (= c!46081 (and ((_ is Intermediate!1865) lt!139992) (undefined!2677 lt!139992)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14136 (_ BitVec 32)) SeekEntryResult!1865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65223 (= lt!139992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65223 (validMask!0 mask!3868)))

(assert (=> d!65223 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) lt!139990)))

(declare-fun b!283452 () Bool)

(declare-fun c!46080 () Bool)

(assert (=> b!283452 (= c!46080 (= lt!139991 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179825 () SeekEntryResult!1865)

(assert (=> b!283452 (= e!179826 e!179825)))

(declare-fun b!283453 () Bool)

(assert (=> b!283453 (= e!179825 (MissingZero!1865 (index!9632 lt!139992)))))

(declare-fun b!283454 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14136 (_ BitVec 32)) SeekEntryResult!1865)

(assert (=> b!283454 (= e!179825 (seekKeyOrZeroReturnVacant!0 (x!27854 lt!139992) (index!9632 lt!139992) (index!9632 lt!139992) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (= (and d!65223 c!46081) b!283449))

(assert (= (and d!65223 (not c!46081)) b!283450))

(assert (= (and b!283450 c!46079) b!283451))

(assert (= (and b!283450 (not c!46079)) b!283452))

(assert (= (and b!283452 c!46080) b!283453))

(assert (= (and b!283452 (not c!46080)) b!283454))

(declare-fun m!297931 () Bool)

(assert (=> b!283450 m!297931))

(declare-fun m!297933 () Bool)

(assert (=> d!65223 m!297933))

(declare-fun m!297935 () Bool)

(assert (=> d!65223 m!297935))

(declare-fun m!297937 () Bool)

(assert (=> d!65223 m!297937))

(assert (=> d!65223 m!297815))

(declare-fun m!297939 () Bool)

(assert (=> d!65223 m!297939))

(assert (=> d!65223 m!297939))

(assert (=> d!65223 m!297815))

(declare-fun m!297941 () Bool)

(assert (=> d!65223 m!297941))

(assert (=> d!65223 m!297823))

(assert (=> b!283454 m!297815))

(declare-fun m!297943 () Bool)

(assert (=> b!283454 m!297943))

(assert (=> b!283345 d!65223))

(declare-fun d!65233 () Bool)

(declare-fun e!179838 () Bool)

(assert (=> d!65233 e!179838))

(declare-fun res!146401 () Bool)

(assert (=> d!65233 (=> (not res!146401) (not e!179838))))

(assert (=> d!65233 (= res!146401 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325))))))

(declare-fun lt!140004 () Unit!8976)

(declare-fun choose!41 (array!14136 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4489) Unit!8976)

(assert (=> d!65233 (= lt!140004 (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4486))))

(assert (=> d!65233 (bvslt (size!7061 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65233 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4486) lt!140004)))

(declare-fun b!283472 () Bool)

(assert (=> b!283472 (= e!179838 (arrayNoDuplicates!0 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) #b00000000000000000000000000000000 Nil!4486))))

(assert (= (and d!65233 res!146401) b!283472))

(declare-fun m!297949 () Bool)

(assert (=> d!65233 m!297949))

(assert (=> b!283472 m!297799))

(declare-fun m!297951 () Bool)

(assert (=> b!283472 m!297951))

(assert (=> b!283345 d!65233))

(declare-fun d!65237 () Bool)

(assert (=> d!65237 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140010 () Unit!8976)

(declare-fun choose!38 (array!14136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> d!65237 (= lt!140010 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65237 (validMask!0 mask!3868)))

(assert (=> d!65237 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140010)))

(declare-fun bs!10046 () Bool)

(assert (= bs!10046 d!65237))

(assert (=> bs!10046 m!297813))

(declare-fun m!297967 () Bool)

(assert (=> bs!10046 m!297967))

(assert (=> bs!10046 m!297823))

(assert (=> b!283345 d!65237))

(declare-fun d!65241 () Bool)

(declare-fun res!146402 () Bool)

(declare-fun e!179844 () Bool)

(assert (=> d!65241 (=> res!146402 e!179844)))

(assert (=> d!65241 (= res!146402 (bvsge startIndex!26 (size!7061 a!3325)))))

(assert (=> d!65241 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!179844)))

(declare-fun b!283479 () Bool)

(declare-fun e!179842 () Bool)

(assert (=> b!283479 (= e!179844 e!179842)))

(declare-fun c!46091 () Bool)

(assert (=> b!283479 (= c!46091 (validKeyInArray!0 (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun b!283480 () Bool)

(declare-fun e!179843 () Bool)

(assert (=> b!283480 (= e!179842 e!179843)))

(declare-fun lt!140011 () (_ BitVec 64))

(assert (=> b!283480 (= lt!140011 (select (arr!6708 a!3325) startIndex!26))))

(declare-fun lt!140013 () Unit!8976)

(assert (=> b!283480 (= lt!140013 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140011 startIndex!26))))

(assert (=> b!283480 (arrayContainsKey!0 a!3325 lt!140011 #b00000000000000000000000000000000)))

(declare-fun lt!140012 () Unit!8976)

(assert (=> b!283480 (= lt!140012 lt!140013)))

(declare-fun res!146403 () Bool)

(assert (=> b!283480 (= res!146403 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (Found!1865 startIndex!26)))))

(assert (=> b!283480 (=> (not res!146403) (not e!179843))))

(declare-fun call!25472 () Bool)

(declare-fun bm!25469 () Bool)

(assert (=> bm!25469 (= call!25472 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283481 () Bool)

(assert (=> b!283481 (= e!179842 call!25472)))

(declare-fun b!283482 () Bool)

(assert (=> b!283482 (= e!179843 call!25472)))

(assert (= (and d!65241 (not res!146402)) b!283479))

(assert (= (and b!283479 c!46091) b!283480))

(assert (= (and b!283479 (not c!46091)) b!283481))

(assert (= (and b!283480 res!146403) b!283482))

(assert (= (or b!283482 b!283481) bm!25469))

(assert (=> b!283479 m!297815))

(assert (=> b!283479 m!297815))

(assert (=> b!283479 m!297831))

(assert (=> b!283480 m!297815))

(declare-fun m!297969 () Bool)

(assert (=> b!283480 m!297969))

(declare-fun m!297971 () Bool)

(assert (=> b!283480 m!297971))

(assert (=> b!283480 m!297815))

(assert (=> b!283480 m!297821))

(declare-fun m!297973 () Bool)

(assert (=> bm!25469 m!297973))

(assert (=> b!283345 d!65241))

(declare-fun b!283493 () Bool)

(declare-fun e!179853 () SeekEntryResult!1865)

(assert (=> b!283493 (= e!179853 Undefined!1865)))

(declare-fun b!283494 () Bool)

(declare-fun e!179855 () SeekEntryResult!1865)

(assert (=> b!283494 (= e!179853 e!179855)))

(declare-fun lt!140015 () (_ BitVec 64))

(declare-fun lt!140016 () SeekEntryResult!1865)

(assert (=> b!283494 (= lt!140015 (select (arr!6708 lt!139943) (index!9632 lt!140016)))))

(declare-fun c!46094 () Bool)

(assert (=> b!283494 (= c!46094 (= lt!140015 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!283495 () Bool)

(assert (=> b!283495 (= e!179855 (Found!1865 (index!9632 lt!140016)))))

(declare-fun d!65243 () Bool)

(declare-fun lt!140014 () SeekEntryResult!1865)

(assert (=> d!65243 (and (or ((_ is Undefined!1865) lt!140014) (not ((_ is Found!1865) lt!140014)) (and (bvsge (index!9631 lt!140014) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140014) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140014) ((_ is Found!1865) lt!140014) (not ((_ is MissingZero!1865) lt!140014)) (and (bvsge (index!9630 lt!140014) #b00000000000000000000000000000000) (bvslt (index!9630 lt!140014) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140014) ((_ is Found!1865) lt!140014) ((_ is MissingZero!1865) lt!140014) (not ((_ is MissingVacant!1865) lt!140014)) (and (bvsge (index!9633 lt!140014) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140014) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140014) (ite ((_ is Found!1865) lt!140014) (= (select (arr!6708 lt!139943) (index!9631 lt!140014)) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1865) lt!140014) (= (select (arr!6708 lt!139943) (index!9630 lt!140014)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1865) lt!140014) (= (select (arr!6708 lt!139943) (index!9633 lt!140014)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65243 (= lt!140014 e!179853)))

(declare-fun c!46096 () Bool)

(assert (=> d!65243 (= c!46096 (and ((_ is Intermediate!1865) lt!140016) (undefined!2677 lt!140016)))))

(assert (=> d!65243 (= lt!140016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868))))

(assert (=> d!65243 (validMask!0 mask!3868)))

(assert (=> d!65243 (= (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868) lt!140014)))

(declare-fun b!283496 () Bool)

(declare-fun c!46095 () Bool)

(assert (=> b!283496 (= c!46095 (= lt!140015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179854 () SeekEntryResult!1865)

(assert (=> b!283496 (= e!179855 e!179854)))

(declare-fun b!283497 () Bool)

(assert (=> b!283497 (= e!179854 (MissingZero!1865 (index!9632 lt!140016)))))

(declare-fun b!283498 () Bool)

(assert (=> b!283498 (= e!179854 (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140016) (index!9632 lt!140016) (index!9632 lt!140016) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868))))

(assert (= (and d!65243 c!46096) b!283493))

(assert (= (and d!65243 (not c!46096)) b!283494))

(assert (= (and b!283494 c!46094) b!283495))

(assert (= (and b!283494 (not c!46094)) b!283496))

(assert (= (and b!283496 c!46095) b!283497))

(assert (= (and b!283496 (not c!46095)) b!283498))

(declare-fun m!297975 () Bool)

(assert (=> b!283494 m!297975))

(declare-fun m!297977 () Bool)

(assert (=> d!65243 m!297977))

(declare-fun m!297979 () Bool)

(assert (=> d!65243 m!297979))

(declare-fun m!297981 () Bool)

(assert (=> d!65243 m!297981))

(assert (=> d!65243 m!297809))

(declare-fun m!297983 () Bool)

(assert (=> d!65243 m!297983))

(assert (=> d!65243 m!297983))

(assert (=> d!65243 m!297809))

(declare-fun m!297985 () Bool)

(assert (=> d!65243 m!297985))

(assert (=> d!65243 m!297823))

(assert (=> b!283498 m!297809))

(declare-fun m!297987 () Bool)

(assert (=> b!283498 m!297987))

(assert (=> b!283345 d!65243))

(declare-fun b!283514 () Bool)

(declare-fun e!179871 () Bool)

(declare-fun e!179870 () Bool)

(assert (=> b!283514 (= e!179871 e!179870)))

(declare-fun c!46100 () Bool)

(assert (=> b!283514 (= c!46100 (validKeyInArray!0 (select (arr!6708 lt!139943) #b00000000000000000000000000000000)))))

(declare-fun b!283515 () Bool)

(declare-fun call!25478 () Bool)

(assert (=> b!283515 (= e!179870 call!25478)))

(declare-fun d!65245 () Bool)

(declare-fun res!146419 () Bool)

(declare-fun e!179869 () Bool)

(assert (=> d!65245 (=> res!146419 e!179869)))

(assert (=> d!65245 (= res!146419 (bvsge #b00000000000000000000000000000000 (size!7061 lt!139943)))))

(assert (=> d!65245 (= (arrayNoDuplicates!0 lt!139943 #b00000000000000000000000000000000 Nil!4486) e!179869)))

(declare-fun bm!25475 () Bool)

(assert (=> bm!25475 (= call!25478 (arrayNoDuplicates!0 lt!139943 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46100 (Cons!4485 (select (arr!6708 lt!139943) #b00000000000000000000000000000000) Nil!4486) Nil!4486)))))

(declare-fun b!283516 () Bool)

(assert (=> b!283516 (= e!179870 call!25478)))

(declare-fun b!283517 () Bool)

(declare-fun e!179868 () Bool)

(declare-fun contains!1971 (List!4489 (_ BitVec 64)) Bool)

(assert (=> b!283517 (= e!179868 (contains!1971 Nil!4486 (select (arr!6708 lt!139943) #b00000000000000000000000000000000)))))

(declare-fun b!283518 () Bool)

(assert (=> b!283518 (= e!179869 e!179871)))

(declare-fun res!146421 () Bool)

(assert (=> b!283518 (=> (not res!146421) (not e!179871))))

(assert (=> b!283518 (= res!146421 (not e!179868))))

(declare-fun res!146420 () Bool)

(assert (=> b!283518 (=> (not res!146420) (not e!179868))))

(assert (=> b!283518 (= res!146420 (validKeyInArray!0 (select (arr!6708 lt!139943) #b00000000000000000000000000000000)))))

(assert (= (and d!65245 (not res!146419)) b!283518))

(assert (= (and b!283518 res!146420) b!283517))

(assert (= (and b!283518 res!146421) b!283514))

(assert (= (and b!283514 c!46100) b!283516))

(assert (= (and b!283514 (not c!46100)) b!283515))

(assert (= (or b!283516 b!283515) bm!25475))

(declare-fun m!297997 () Bool)

(assert (=> b!283514 m!297997))

(assert (=> b!283514 m!297997))

(declare-fun m!297999 () Bool)

(assert (=> b!283514 m!297999))

(assert (=> bm!25475 m!297997))

(declare-fun m!298001 () Bool)

(assert (=> bm!25475 m!298001))

(assert (=> b!283517 m!297997))

(assert (=> b!283517 m!297997))

(declare-fun m!298003 () Bool)

(assert (=> b!283517 m!298003))

(assert (=> b!283518 m!297997))

(assert (=> b!283518 m!297997))

(assert (=> b!283518 m!297999))

(assert (=> b!283345 d!65245))

(declare-fun d!65249 () Bool)

(declare-fun e!179898 () Bool)

(assert (=> d!65249 e!179898))

(declare-fun res!146430 () Bool)

(assert (=> d!65249 (=> (not res!146430) (not e!179898))))

(assert (=> d!65249 (= res!146430 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7061 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7061 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7061 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325))))))

(declare-fun lt!140043 () Unit!8976)

(declare-fun choose!83 (array!14136 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> d!65249 (= lt!140043 (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> d!65249 (validMask!0 mask!3868)))

(assert (=> d!65249 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) lt!140043)))

(declare-fun b!283563 () Bool)

(assert (=> b!283563 (= e!179898 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) mask!3868)))))

(assert (= (and d!65249 res!146430) b!283563))

(declare-fun m!298069 () Bool)

(assert (=> d!65249 m!298069))

(assert (=> d!65249 m!297823))

(assert (=> b!283563 m!297799))

(assert (=> b!283563 m!297815))

(assert (=> b!283563 m!297821))

(assert (=> b!283563 m!297815))

(assert (=> b!283563 m!297809))

(assert (=> b!283563 m!297809))

(declare-fun m!298071 () Bool)

(assert (=> b!283563 m!298071))

(assert (=> b!283345 d!65249))

(declare-fun b!283564 () Bool)

(declare-fun e!179902 () Bool)

(declare-fun e!179901 () Bool)

(assert (=> b!283564 (= e!179902 e!179901)))

(declare-fun c!46119 () Bool)

(assert (=> b!283564 (= c!46119 (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283565 () Bool)

(declare-fun call!25479 () Bool)

(assert (=> b!283565 (= e!179901 call!25479)))

(declare-fun d!65263 () Bool)

(declare-fun res!146431 () Bool)

(declare-fun e!179900 () Bool)

(assert (=> d!65263 (=> res!146431 e!179900)))

(assert (=> d!65263 (= res!146431 (bvsge #b00000000000000000000000000000000 (size!7061 a!3325)))))

(assert (=> d!65263 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4486) e!179900)))

(declare-fun bm!25476 () Bool)

(assert (=> bm!25476 (= call!25479 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46119 (Cons!4485 (select (arr!6708 a!3325) #b00000000000000000000000000000000) Nil!4486) Nil!4486)))))

(declare-fun b!283566 () Bool)

(assert (=> b!283566 (= e!179901 call!25479)))

(declare-fun b!283567 () Bool)

(declare-fun e!179899 () Bool)

(assert (=> b!283567 (= e!179899 (contains!1971 Nil!4486 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283568 () Bool)

(assert (=> b!283568 (= e!179900 e!179902)))

(declare-fun res!146433 () Bool)

(assert (=> b!283568 (=> (not res!146433) (not e!179902))))

(assert (=> b!283568 (= res!146433 (not e!179899))))

(declare-fun res!146432 () Bool)

(assert (=> b!283568 (=> (not res!146432) (not e!179899))))

(assert (=> b!283568 (= res!146432 (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65263 (not res!146431)) b!283568))

(assert (= (and b!283568 res!146432) b!283567))

(assert (= (and b!283568 res!146433) b!283564))

(assert (= (and b!283564 c!46119) b!283566))

(assert (= (and b!283564 (not c!46119)) b!283565))

(assert (= (or b!283566 b!283565) bm!25476))

(declare-fun m!298073 () Bool)

(assert (=> b!283564 m!298073))

(assert (=> b!283564 m!298073))

(declare-fun m!298075 () Bool)

(assert (=> b!283564 m!298075))

(assert (=> bm!25476 m!298073))

(declare-fun m!298077 () Bool)

(assert (=> bm!25476 m!298077))

(assert (=> b!283567 m!298073))

(assert (=> b!283567 m!298073))

(declare-fun m!298079 () Bool)

(assert (=> b!283567 m!298079))

(assert (=> b!283568 m!298073))

(assert (=> b!283568 m!298073))

(assert (=> b!283568 m!298075))

(assert (=> b!283340 d!65263))

(declare-fun d!65265 () Bool)

(assert (=> d!65265 (= (validKeyInArray!0 (select (arr!6708 a!3325) startIndex!26)) (and (not (= (select (arr!6708 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6708 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283346 d!65265))

(declare-fun d!65267 () Bool)

(assert (=> d!65267 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283347 d!65267))

(declare-fun d!65269 () Bool)

(declare-fun res!146436 () Bool)

(declare-fun e!179907 () Bool)

(assert (=> d!65269 (=> res!146436 e!179907)))

(assert (=> d!65269 (= res!146436 (bvsge #b00000000000000000000000000000000 (size!7061 a!3325)))))

(assert (=> d!65269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179907)))

(declare-fun b!283571 () Bool)

(declare-fun e!179905 () Bool)

(assert (=> b!283571 (= e!179907 e!179905)))

(declare-fun c!46120 () Bool)

(assert (=> b!283571 (= c!46120 (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283572 () Bool)

(declare-fun e!179906 () Bool)

(assert (=> b!283572 (= e!179905 e!179906)))

(declare-fun lt!140046 () (_ BitVec 64))

(assert (=> b!283572 (= lt!140046 (select (arr!6708 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140048 () Unit!8976)

(assert (=> b!283572 (= lt!140048 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140046 #b00000000000000000000000000000000))))

(assert (=> b!283572 (arrayContainsKey!0 a!3325 lt!140046 #b00000000000000000000000000000000)))

(declare-fun lt!140047 () Unit!8976)

(assert (=> b!283572 (= lt!140047 lt!140048)))

(declare-fun res!146437 () Bool)

(assert (=> b!283572 (= res!146437 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1865 #b00000000000000000000000000000000)))))

(assert (=> b!283572 (=> (not res!146437) (not e!179906))))

(declare-fun bm!25477 () Bool)

(declare-fun call!25480 () Bool)

(assert (=> bm!25477 (= call!25480 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283573 () Bool)

(assert (=> b!283573 (= e!179905 call!25480)))

(declare-fun b!283574 () Bool)

(assert (=> b!283574 (= e!179906 call!25480)))

(assert (= (and d!65269 (not res!146436)) b!283571))

(assert (= (and b!283571 c!46120) b!283572))

(assert (= (and b!283571 (not c!46120)) b!283573))

(assert (= (and b!283572 res!146437) b!283574))

(assert (= (or b!283574 b!283573) bm!25477))

(assert (=> b!283571 m!298073))

(assert (=> b!283571 m!298073))

(assert (=> b!283571 m!298075))

(assert (=> b!283572 m!298073))

(declare-fun m!298085 () Bool)

(assert (=> b!283572 m!298085))

(declare-fun m!298087 () Bool)

(assert (=> b!283572 m!298087))

(assert (=> b!283572 m!298073))

(declare-fun m!298089 () Bool)

(assert (=> b!283572 m!298089))

(declare-fun m!298091 () Bool)

(assert (=> bm!25477 m!298091))

(assert (=> b!283342 d!65269))

(declare-fun b!283576 () Bool)

(declare-fun e!179909 () SeekEntryResult!1865)

(assert (=> b!283576 (= e!179909 Undefined!1865)))

(declare-fun b!283577 () Bool)

(declare-fun e!179911 () SeekEntryResult!1865)

(assert (=> b!283577 (= e!179909 e!179911)))

(declare-fun lt!140053 () (_ BitVec 64))

(declare-fun lt!140054 () SeekEntryResult!1865)

(assert (=> b!283577 (= lt!140053 (select (arr!6708 a!3325) (index!9632 lt!140054)))))

(declare-fun c!46121 () Bool)

(assert (=> b!283577 (= c!46121 (= lt!140053 k0!2581))))

(declare-fun b!283578 () Bool)

(assert (=> b!283578 (= e!179911 (Found!1865 (index!9632 lt!140054)))))

(declare-fun d!65273 () Bool)

(declare-fun lt!140052 () SeekEntryResult!1865)

(assert (=> d!65273 (and (or ((_ is Undefined!1865) lt!140052) (not ((_ is Found!1865) lt!140052)) (and (bvsge (index!9631 lt!140052) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140052) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140052) ((_ is Found!1865) lt!140052) (not ((_ is MissingZero!1865) lt!140052)) (and (bvsge (index!9630 lt!140052) #b00000000000000000000000000000000) (bvslt (index!9630 lt!140052) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140052) ((_ is Found!1865) lt!140052) ((_ is MissingZero!1865) lt!140052) (not ((_ is MissingVacant!1865) lt!140052)) (and (bvsge (index!9633 lt!140052) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140052) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140052) (ite ((_ is Found!1865) lt!140052) (= (select (arr!6708 a!3325) (index!9631 lt!140052)) k0!2581) (ite ((_ is MissingZero!1865) lt!140052) (= (select (arr!6708 a!3325) (index!9630 lt!140052)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1865) lt!140052) (= (select (arr!6708 a!3325) (index!9633 lt!140052)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65273 (= lt!140052 e!179909)))

(declare-fun c!46123 () Bool)

(assert (=> d!65273 (= c!46123 (and ((_ is Intermediate!1865) lt!140054) (undefined!2677 lt!140054)))))

(assert (=> d!65273 (= lt!140054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65273 (validMask!0 mask!3868)))

(assert (=> d!65273 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140052)))

(declare-fun b!283579 () Bool)

(declare-fun c!46122 () Bool)

(assert (=> b!283579 (= c!46122 (= lt!140053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179910 () SeekEntryResult!1865)

(assert (=> b!283579 (= e!179911 e!179910)))

(declare-fun b!283580 () Bool)

(assert (=> b!283580 (= e!179910 (MissingZero!1865 (index!9632 lt!140054)))))

(declare-fun b!283581 () Bool)

(assert (=> b!283581 (= e!179910 (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140054) (index!9632 lt!140054) (index!9632 lt!140054) k0!2581 a!3325 mask!3868))))

(assert (= (and d!65273 c!46123) b!283576))

(assert (= (and d!65273 (not c!46123)) b!283577))

(assert (= (and b!283577 c!46121) b!283578))

(assert (= (and b!283577 (not c!46121)) b!283579))

(assert (= (and b!283579 c!46122) b!283580))

(assert (= (and b!283579 (not c!46122)) b!283581))

(declare-fun m!298095 () Bool)

(assert (=> b!283577 m!298095))

(declare-fun m!298097 () Bool)

(assert (=> d!65273 m!298097))

(declare-fun m!298099 () Bool)

(assert (=> d!65273 m!298099))

(declare-fun m!298101 () Bool)

(assert (=> d!65273 m!298101))

(declare-fun m!298103 () Bool)

(assert (=> d!65273 m!298103))

(assert (=> d!65273 m!298103))

(declare-fun m!298105 () Bool)

(assert (=> d!65273 m!298105))

(assert (=> d!65273 m!297823))

(declare-fun m!298107 () Bool)

(assert (=> b!283581 m!298107))

(assert (=> b!283348 d!65273))

(declare-fun d!65277 () Bool)

(declare-fun res!146443 () Bool)

(declare-fun e!179916 () Bool)

(assert (=> d!65277 (=> res!146443 e!179916)))

(assert (=> d!65277 (= res!146443 (= (select (arr!6708 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65277 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!179916)))

(declare-fun b!283586 () Bool)

(declare-fun e!179917 () Bool)

(assert (=> b!283586 (= e!179916 e!179917)))

(declare-fun res!146444 () Bool)

(assert (=> b!283586 (=> (not res!146444) (not e!179917))))

(assert (=> b!283586 (= res!146444 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(declare-fun b!283587 () Bool)

(assert (=> b!283587 (= e!179917 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65277 (not res!146443)) b!283586))

(assert (= (and b!283586 res!146444) b!283587))

(assert (=> d!65277 m!298073))

(declare-fun m!298109 () Bool)

(assert (=> b!283587 m!298109))

(assert (=> b!283349 d!65277))

(check-sat (not b!283498) (not d!65249) (not bm!25469) (not b!283568) (not b!283418) (not b!283587) (not b!283472) (not bm!25465) (not b!283419) (not bm!25475) (not b!283479) (not b!283518) (not b!283480) (not b!283514) (not b!283581) (not b!283571) (not b!283572) (not d!65233) (not d!65243) (not b!283564) (not b!283454) (not d!65237) (not d!65273) (not d!65223) (not bm!25476) (not b!283517) (not b!283563) (not bm!25477) (not b!283567))
(check-sat)
(get-model)

(assert (=> b!283563 d!65223))

(declare-fun b!283656 () Bool)

(declare-fun e!179971 () SeekEntryResult!1865)

(assert (=> b!283656 (= e!179971 Undefined!1865)))

(declare-fun b!283657 () Bool)

(declare-fun e!179973 () SeekEntryResult!1865)

(assert (=> b!283657 (= e!179971 e!179973)))

(declare-fun lt!140093 () (_ BitVec 64))

(declare-fun lt!140094 () SeekEntryResult!1865)

(assert (=> b!283657 (= lt!140093 (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) (index!9632 lt!140094)))))

(declare-fun c!46139 () Bool)

(assert (=> b!283657 (= c!46139 (= lt!140093 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!283658 () Bool)

(assert (=> b!283658 (= e!179973 (Found!1865 (index!9632 lt!140094)))))

(declare-fun lt!140092 () SeekEntryResult!1865)

(declare-fun d!65313 () Bool)

(assert (=> d!65313 (and (or ((_ is Undefined!1865) lt!140092) (not ((_ is Found!1865) lt!140092)) (and (bvsge (index!9631 lt!140092) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140092) (size!7061 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)))))) (or ((_ is Undefined!1865) lt!140092) ((_ is Found!1865) lt!140092) (not ((_ is MissingZero!1865) lt!140092)) (and (bvsge (index!9630 lt!140092) #b00000000000000000000000000000000) (bvslt (index!9630 lt!140092) (size!7061 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)))))) (or ((_ is Undefined!1865) lt!140092) ((_ is Found!1865) lt!140092) ((_ is MissingZero!1865) lt!140092) (not ((_ is MissingVacant!1865) lt!140092)) (and (bvsge (index!9633 lt!140092) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140092) (size!7061 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)))))) (or ((_ is Undefined!1865) lt!140092) (ite ((_ is Found!1865) lt!140092) (= (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) (index!9631 lt!140092)) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1865) lt!140092) (= (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) (index!9630 lt!140092)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1865) lt!140092) (= (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) (index!9633 lt!140092)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65313 (= lt!140092 e!179971)))

(declare-fun c!46141 () Bool)

(assert (=> d!65313 (= c!46141 (and ((_ is Intermediate!1865) lt!140094) (undefined!2677 lt!140094)))))

(assert (=> d!65313 (= lt!140094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) mask!3868))))

(assert (=> d!65313 (validMask!0 mask!3868)))

(assert (=> d!65313 (= (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) mask!3868) lt!140092)))

(declare-fun b!283659 () Bool)

(declare-fun c!46140 () Bool)

(assert (=> b!283659 (= c!46140 (= lt!140093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179972 () SeekEntryResult!1865)

(assert (=> b!283659 (= e!179973 e!179972)))

(declare-fun b!283660 () Bool)

(assert (=> b!283660 (= e!179972 (MissingZero!1865 (index!9632 lt!140094)))))

(declare-fun b!283661 () Bool)

(assert (=> b!283661 (= e!179972 (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140094) (index!9632 lt!140094) (index!9632 lt!140094) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) mask!3868))))

(assert (= (and d!65313 c!46141) b!283656))

(assert (= (and d!65313 (not c!46141)) b!283657))

(assert (= (and b!283657 c!46139) b!283658))

(assert (= (and b!283657 (not c!46139)) b!283659))

(assert (= (and b!283659 c!46140) b!283660))

(assert (= (and b!283659 (not c!46140)) b!283661))

(declare-fun m!298199 () Bool)

(assert (=> b!283657 m!298199))

(declare-fun m!298201 () Bool)

(assert (=> d!65313 m!298201))

(declare-fun m!298203 () Bool)

(assert (=> d!65313 m!298203))

(declare-fun m!298205 () Bool)

(assert (=> d!65313 m!298205))

(assert (=> d!65313 m!297809))

(assert (=> d!65313 m!297983))

(assert (=> d!65313 m!297983))

(assert (=> d!65313 m!297809))

(declare-fun m!298207 () Bool)

(assert (=> d!65313 m!298207))

(assert (=> d!65313 m!297823))

(assert (=> b!283661 m!297809))

(declare-fun m!298209 () Bool)

(assert (=> b!283661 m!298209))

(assert (=> b!283563 d!65313))

(declare-fun d!65315 () Bool)

(assert (=> d!65315 (= (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6708 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6708 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283571 d!65315))

(declare-fun d!65317 () Bool)

(assert (=> d!65317 (= (validKeyInArray!0 (select (arr!6708 lt!139943) startIndex!26)) (and (not (= (select (arr!6708 lt!139943) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6708 lt!139943) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283418 d!65317))

(declare-fun d!65319 () Bool)

(assert (=> d!65319 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) mask!3868))))

(assert (=> d!65319 true))

(declare-fun _$51!15 () Unit!8976)

(assert (=> d!65319 (= (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) _$51!15)))

(declare-fun bs!10049 () Bool)

(assert (= bs!10049 d!65319))

(assert (=> bs!10049 m!297815))

(assert (=> bs!10049 m!297821))

(assert (=> bs!10049 m!297815))

(assert (=> bs!10049 m!297799))

(assert (=> bs!10049 m!297809))

(assert (=> bs!10049 m!297809))

(assert (=> bs!10049 m!298071))

(assert (=> d!65249 d!65319))

(assert (=> d!65249 d!65217))

(declare-fun d!65321 () Bool)

(assert (=> d!65321 (arrayContainsKey!0 a!3325 lt!140046 #b00000000000000000000000000000000)))

(declare-fun lt!140097 () Unit!8976)

(declare-fun choose!13 (array!14136 (_ BitVec 64) (_ BitVec 32)) Unit!8976)

(assert (=> d!65321 (= lt!140097 (choose!13 a!3325 lt!140046 #b00000000000000000000000000000000))))

(assert (=> d!65321 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!65321 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140046 #b00000000000000000000000000000000) lt!140097)))

(declare-fun bs!10050 () Bool)

(assert (= bs!10050 d!65321))

(assert (=> bs!10050 m!298087))

(declare-fun m!298211 () Bool)

(assert (=> bs!10050 m!298211))

(assert (=> b!283572 d!65321))

(declare-fun d!65323 () Bool)

(declare-fun res!146483 () Bool)

(declare-fun e!179974 () Bool)

(assert (=> d!65323 (=> res!146483 e!179974)))

(assert (=> d!65323 (= res!146483 (= (select (arr!6708 a!3325) #b00000000000000000000000000000000) lt!140046))))

(assert (=> d!65323 (= (arrayContainsKey!0 a!3325 lt!140046 #b00000000000000000000000000000000) e!179974)))

(declare-fun b!283662 () Bool)

(declare-fun e!179975 () Bool)

(assert (=> b!283662 (= e!179974 e!179975)))

(declare-fun res!146484 () Bool)

(assert (=> b!283662 (=> (not res!146484) (not e!179975))))

(assert (=> b!283662 (= res!146484 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(declare-fun b!283663 () Bool)

(assert (=> b!283663 (= e!179975 (arrayContainsKey!0 a!3325 lt!140046 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65323 (not res!146483)) b!283662))

(assert (= (and b!283662 res!146484) b!283663))

(assert (=> d!65323 m!298073))

(declare-fun m!298213 () Bool)

(assert (=> b!283663 m!298213))

(assert (=> b!283572 d!65323))

(declare-fun b!283664 () Bool)

(declare-fun e!179976 () SeekEntryResult!1865)

(assert (=> b!283664 (= e!179976 Undefined!1865)))

(declare-fun b!283665 () Bool)

(declare-fun e!179978 () SeekEntryResult!1865)

(assert (=> b!283665 (= e!179976 e!179978)))

(declare-fun lt!140099 () (_ BitVec 64))

(declare-fun lt!140100 () SeekEntryResult!1865)

(assert (=> b!283665 (= lt!140099 (select (arr!6708 a!3325) (index!9632 lt!140100)))))

(declare-fun c!46142 () Bool)

(assert (=> b!283665 (= c!46142 (= lt!140099 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283666 () Bool)

(assert (=> b!283666 (= e!179978 (Found!1865 (index!9632 lt!140100)))))

(declare-fun d!65325 () Bool)

(declare-fun lt!140098 () SeekEntryResult!1865)

(assert (=> d!65325 (and (or ((_ is Undefined!1865) lt!140098) (not ((_ is Found!1865) lt!140098)) (and (bvsge (index!9631 lt!140098) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140098) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140098) ((_ is Found!1865) lt!140098) (not ((_ is MissingZero!1865) lt!140098)) (and (bvsge (index!9630 lt!140098) #b00000000000000000000000000000000) (bvslt (index!9630 lt!140098) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140098) ((_ is Found!1865) lt!140098) ((_ is MissingZero!1865) lt!140098) (not ((_ is MissingVacant!1865) lt!140098)) (and (bvsge (index!9633 lt!140098) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140098) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140098) (ite ((_ is Found!1865) lt!140098) (= (select (arr!6708 a!3325) (index!9631 lt!140098)) (select (arr!6708 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1865) lt!140098) (= (select (arr!6708 a!3325) (index!9630 lt!140098)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1865) lt!140098) (= (select (arr!6708 a!3325) (index!9633 lt!140098)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65325 (= lt!140098 e!179976)))

(declare-fun c!46144 () Bool)

(assert (=> d!65325 (= c!46144 (and ((_ is Intermediate!1865) lt!140100) (undefined!2677 lt!140100)))))

(assert (=> d!65325 (= lt!140100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6708 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!65325 (validMask!0 mask!3868)))

(assert (=> d!65325 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!140098)))

(declare-fun b!283667 () Bool)

(declare-fun c!46143 () Bool)

(assert (=> b!283667 (= c!46143 (= lt!140099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179977 () SeekEntryResult!1865)

(assert (=> b!283667 (= e!179978 e!179977)))

(declare-fun b!283668 () Bool)

(assert (=> b!283668 (= e!179977 (MissingZero!1865 (index!9632 lt!140100)))))

(declare-fun b!283669 () Bool)

(assert (=> b!283669 (= e!179977 (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140100) (index!9632 lt!140100) (index!9632 lt!140100) (select (arr!6708 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (= (and d!65325 c!46144) b!283664))

(assert (= (and d!65325 (not c!46144)) b!283665))

(assert (= (and b!283665 c!46142) b!283666))

(assert (= (and b!283665 (not c!46142)) b!283667))

(assert (= (and b!283667 c!46143) b!283668))

(assert (= (and b!283667 (not c!46143)) b!283669))

(declare-fun m!298215 () Bool)

(assert (=> b!283665 m!298215))

(declare-fun m!298217 () Bool)

(assert (=> d!65325 m!298217))

(declare-fun m!298219 () Bool)

(assert (=> d!65325 m!298219))

(declare-fun m!298221 () Bool)

(assert (=> d!65325 m!298221))

(assert (=> d!65325 m!298073))

(declare-fun m!298223 () Bool)

(assert (=> d!65325 m!298223))

(assert (=> d!65325 m!298223))

(assert (=> d!65325 m!298073))

(declare-fun m!298225 () Bool)

(assert (=> d!65325 m!298225))

(assert (=> d!65325 m!297823))

(assert (=> b!283669 m!298073))

(declare-fun m!298227 () Bool)

(assert (=> b!283669 m!298227))

(assert (=> b!283572 d!65325))

(declare-fun b!283682 () Bool)

(declare-fun e!179986 () SeekEntryResult!1865)

(assert (=> b!283682 (= e!179986 Undefined!1865)))

(declare-fun b!283683 () Bool)

(declare-fun e!179985 () SeekEntryResult!1865)

(assert (=> b!283683 (= e!179986 e!179985)))

(declare-fun c!46152 () Bool)

(declare-fun lt!140106 () (_ BitVec 64))

(assert (=> b!283683 (= c!46152 (= lt!140106 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!283684 () Bool)

(declare-fun c!46151 () Bool)

(assert (=> b!283684 (= c!46151 (= lt!140106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179987 () SeekEntryResult!1865)

(assert (=> b!283684 (= e!179985 e!179987)))

(declare-fun b!283685 () Bool)

(assert (=> b!283685 (= e!179987 (MissingVacant!1865 (index!9632 lt!140016)))))

(declare-fun lt!140105 () SeekEntryResult!1865)

(declare-fun d!65327 () Bool)

(assert (=> d!65327 (and (or ((_ is Undefined!1865) lt!140105) (not ((_ is Found!1865) lt!140105)) (and (bvsge (index!9631 lt!140105) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140105) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140105) ((_ is Found!1865) lt!140105) (not ((_ is MissingVacant!1865) lt!140105)) (not (= (index!9633 lt!140105) (index!9632 lt!140016))) (and (bvsge (index!9633 lt!140105) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140105) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140105) (ite ((_ is Found!1865) lt!140105) (= (select (arr!6708 lt!139943) (index!9631 lt!140105)) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)) (and ((_ is MissingVacant!1865) lt!140105) (= (index!9633 lt!140105) (index!9632 lt!140016)) (= (select (arr!6708 lt!139943) (index!9633 lt!140105)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65327 (= lt!140105 e!179986)))

(declare-fun c!46153 () Bool)

(assert (=> d!65327 (= c!46153 (bvsge (x!27854 lt!140016) #b01111111111111111111111111111110))))

(assert (=> d!65327 (= lt!140106 (select (arr!6708 lt!139943) (index!9632 lt!140016)))))

(assert (=> d!65327 (validMask!0 mask!3868)))

(assert (=> d!65327 (= (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140016) (index!9632 lt!140016) (index!9632 lt!140016) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868) lt!140105)))

(declare-fun b!283686 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!283686 (= e!179987 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27854 lt!140016) #b00000000000000000000000000000001) (nextIndex!0 (index!9632 lt!140016) (x!27854 lt!140016) mask!3868) (index!9632 lt!140016) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868))))

(declare-fun b!283687 () Bool)

(assert (=> b!283687 (= e!179985 (Found!1865 (index!9632 lt!140016)))))

(assert (= (and d!65327 c!46153) b!283682))

(assert (= (and d!65327 (not c!46153)) b!283683))

(assert (= (and b!283683 c!46152) b!283687))

(assert (= (and b!283683 (not c!46152)) b!283684))

(assert (= (and b!283684 c!46151) b!283685))

(assert (= (and b!283684 (not c!46151)) b!283686))

(declare-fun m!298229 () Bool)

(assert (=> d!65327 m!298229))

(declare-fun m!298231 () Bool)

(assert (=> d!65327 m!298231))

(assert (=> d!65327 m!297975))

(assert (=> d!65327 m!297823))

(declare-fun m!298233 () Bool)

(assert (=> b!283686 m!298233))

(assert (=> b!283686 m!298233))

(assert (=> b!283686 m!297809))

(declare-fun m!298235 () Bool)

(assert (=> b!283686 m!298235))

(assert (=> b!283498 d!65327))

(declare-fun d!65329 () Bool)

(declare-fun res!146485 () Bool)

(declare-fun e!179990 () Bool)

(assert (=> d!65329 (=> res!146485 e!179990)))

(assert (=> d!65329 (= res!146485 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(assert (=> d!65329 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!179990)))

(declare-fun b!283688 () Bool)

(declare-fun e!179988 () Bool)

(assert (=> b!283688 (= e!179990 e!179988)))

(declare-fun c!46154 () Bool)

(assert (=> b!283688 (= c!46154 (validKeyInArray!0 (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283689 () Bool)

(declare-fun e!179989 () Bool)

(assert (=> b!283689 (= e!179988 e!179989)))

(declare-fun lt!140107 () (_ BitVec 64))

(assert (=> b!283689 (= lt!140107 (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140109 () Unit!8976)

(assert (=> b!283689 (= lt!140109 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140107 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!283689 (arrayContainsKey!0 a!3325 lt!140107 #b00000000000000000000000000000000)))

(declare-fun lt!140108 () Unit!8976)

(assert (=> b!283689 (= lt!140108 lt!140109)))

(declare-fun res!146486 () Bool)

(assert (=> b!283689 (= res!146486 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1865 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!283689 (=> (not res!146486) (not e!179989))))

(declare-fun bm!25490 () Bool)

(declare-fun call!25493 () Bool)

(assert (=> bm!25490 (= call!25493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283690 () Bool)

(assert (=> b!283690 (= e!179988 call!25493)))

(declare-fun b!283691 () Bool)

(assert (=> b!283691 (= e!179989 call!25493)))

(assert (= (and d!65329 (not res!146485)) b!283688))

(assert (= (and b!283688 c!46154) b!283689))

(assert (= (and b!283688 (not c!46154)) b!283690))

(assert (= (and b!283689 res!146486) b!283691))

(assert (= (or b!283691 b!283690) bm!25490))

(declare-fun m!298237 () Bool)

(assert (=> b!283688 m!298237))

(assert (=> b!283688 m!298237))

(declare-fun m!298239 () Bool)

(assert (=> b!283688 m!298239))

(assert (=> b!283689 m!298237))

(declare-fun m!298241 () Bool)

(assert (=> b!283689 m!298241))

(declare-fun m!298243 () Bool)

(assert (=> b!283689 m!298243))

(assert (=> b!283689 m!298237))

(declare-fun m!298245 () Bool)

(assert (=> b!283689 m!298245))

(declare-fun m!298247 () Bool)

(assert (=> bm!25490 m!298247))

(assert (=> bm!25477 d!65329))

(declare-fun d!65331 () Bool)

(assert (=> d!65331 (arrayContainsKey!0 lt!139943 lt!139981 #b00000000000000000000000000000000)))

(declare-fun lt!140110 () Unit!8976)

(assert (=> d!65331 (= lt!140110 (choose!13 lt!139943 lt!139981 startIndex!26))))

(assert (=> d!65331 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65331 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139943 lt!139981 startIndex!26) lt!140110)))

(declare-fun bs!10051 () Bool)

(assert (= bs!10051 d!65331))

(assert (=> bs!10051 m!297917))

(declare-fun m!298249 () Bool)

(assert (=> bs!10051 m!298249))

(assert (=> b!283419 d!65331))

(declare-fun d!65333 () Bool)

(declare-fun res!146487 () Bool)

(declare-fun e!179991 () Bool)

(assert (=> d!65333 (=> res!146487 e!179991)))

(assert (=> d!65333 (= res!146487 (= (select (arr!6708 lt!139943) #b00000000000000000000000000000000) lt!139981))))

(assert (=> d!65333 (= (arrayContainsKey!0 lt!139943 lt!139981 #b00000000000000000000000000000000) e!179991)))

(declare-fun b!283692 () Bool)

(declare-fun e!179992 () Bool)

(assert (=> b!283692 (= e!179991 e!179992)))

(declare-fun res!146488 () Bool)

(assert (=> b!283692 (=> (not res!146488) (not e!179992))))

(assert (=> b!283692 (= res!146488 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 lt!139943)))))

(declare-fun b!283693 () Bool)

(assert (=> b!283693 (= e!179992 (arrayContainsKey!0 lt!139943 lt!139981 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65333 (not res!146487)) b!283692))

(assert (= (and b!283692 res!146488) b!283693))

(assert (=> d!65333 m!297997))

(declare-fun m!298251 () Bool)

(assert (=> b!283693 m!298251))

(assert (=> b!283419 d!65333))

(declare-fun b!283694 () Bool)

(declare-fun e!179993 () SeekEntryResult!1865)

(assert (=> b!283694 (= e!179993 Undefined!1865)))

(declare-fun b!283695 () Bool)

(declare-fun e!179995 () SeekEntryResult!1865)

(assert (=> b!283695 (= e!179993 e!179995)))

(declare-fun lt!140112 () (_ BitVec 64))

(declare-fun lt!140113 () SeekEntryResult!1865)

(assert (=> b!283695 (= lt!140112 (select (arr!6708 lt!139943) (index!9632 lt!140113)))))

(declare-fun c!46155 () Bool)

(assert (=> b!283695 (= c!46155 (= lt!140112 (select (arr!6708 lt!139943) startIndex!26)))))

(declare-fun b!283696 () Bool)

(assert (=> b!283696 (= e!179995 (Found!1865 (index!9632 lt!140113)))))

(declare-fun d!65335 () Bool)

(declare-fun lt!140111 () SeekEntryResult!1865)

(assert (=> d!65335 (and (or ((_ is Undefined!1865) lt!140111) (not ((_ is Found!1865) lt!140111)) (and (bvsge (index!9631 lt!140111) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140111) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140111) ((_ is Found!1865) lt!140111) (not ((_ is MissingZero!1865) lt!140111)) (and (bvsge (index!9630 lt!140111) #b00000000000000000000000000000000) (bvslt (index!9630 lt!140111) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140111) ((_ is Found!1865) lt!140111) ((_ is MissingZero!1865) lt!140111) (not ((_ is MissingVacant!1865) lt!140111)) (and (bvsge (index!9633 lt!140111) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140111) (size!7061 lt!139943)))) (or ((_ is Undefined!1865) lt!140111) (ite ((_ is Found!1865) lt!140111) (= (select (arr!6708 lt!139943) (index!9631 lt!140111)) (select (arr!6708 lt!139943) startIndex!26)) (ite ((_ is MissingZero!1865) lt!140111) (= (select (arr!6708 lt!139943) (index!9630 lt!140111)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1865) lt!140111) (= (select (arr!6708 lt!139943) (index!9633 lt!140111)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65335 (= lt!140111 e!179993)))

(declare-fun c!46157 () Bool)

(assert (=> d!65335 (= c!46157 (and ((_ is Intermediate!1865) lt!140113) (undefined!2677 lt!140113)))))

(assert (=> d!65335 (= lt!140113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6708 lt!139943) startIndex!26) mask!3868) (select (arr!6708 lt!139943) startIndex!26) lt!139943 mask!3868))))

(assert (=> d!65335 (validMask!0 mask!3868)))

(assert (=> d!65335 (= (seekEntryOrOpen!0 (select (arr!6708 lt!139943) startIndex!26) lt!139943 mask!3868) lt!140111)))

(declare-fun b!283697 () Bool)

(declare-fun c!46156 () Bool)

(assert (=> b!283697 (= c!46156 (= lt!140112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179994 () SeekEntryResult!1865)

(assert (=> b!283697 (= e!179995 e!179994)))

(declare-fun b!283698 () Bool)

(assert (=> b!283698 (= e!179994 (MissingZero!1865 (index!9632 lt!140113)))))

(declare-fun b!283699 () Bool)

(assert (=> b!283699 (= e!179994 (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140113) (index!9632 lt!140113) (index!9632 lt!140113) (select (arr!6708 lt!139943) startIndex!26) lt!139943 mask!3868))))

(assert (= (and d!65335 c!46157) b!283694))

(assert (= (and d!65335 (not c!46157)) b!283695))

(assert (= (and b!283695 c!46155) b!283696))

(assert (= (and b!283695 (not c!46155)) b!283697))

(assert (= (and b!283697 c!46156) b!283698))

(assert (= (and b!283697 (not c!46156)) b!283699))

(declare-fun m!298253 () Bool)

(assert (=> b!283695 m!298253))

(declare-fun m!298255 () Bool)

(assert (=> d!65335 m!298255))

(declare-fun m!298257 () Bool)

(assert (=> d!65335 m!298257))

(declare-fun m!298259 () Bool)

(assert (=> d!65335 m!298259))

(assert (=> d!65335 m!297911))

(declare-fun m!298261 () Bool)

(assert (=> d!65335 m!298261))

(assert (=> d!65335 m!298261))

(assert (=> d!65335 m!297911))

(declare-fun m!298263 () Bool)

(assert (=> d!65335 m!298263))

(assert (=> d!65335 m!297823))

(assert (=> b!283699 m!297911))

(declare-fun m!298265 () Bool)

(assert (=> b!283699 m!298265))

(assert (=> b!283419 d!65335))

(declare-fun b!283700 () Bool)

(declare-fun e!179997 () SeekEntryResult!1865)

(assert (=> b!283700 (= e!179997 Undefined!1865)))

(declare-fun b!283701 () Bool)

(declare-fun e!179996 () SeekEntryResult!1865)

(assert (=> b!283701 (= e!179997 e!179996)))

(declare-fun lt!140115 () (_ BitVec 64))

(declare-fun c!46159 () Bool)

(assert (=> b!283701 (= c!46159 (= lt!140115 (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun b!283702 () Bool)

(declare-fun c!46158 () Bool)

(assert (=> b!283702 (= c!46158 (= lt!140115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179998 () SeekEntryResult!1865)

(assert (=> b!283702 (= e!179996 e!179998)))

(declare-fun b!283703 () Bool)

(assert (=> b!283703 (= e!179998 (MissingVacant!1865 (index!9632 lt!139992)))))

(declare-fun lt!140114 () SeekEntryResult!1865)

(declare-fun d!65337 () Bool)

(assert (=> d!65337 (and (or ((_ is Undefined!1865) lt!140114) (not ((_ is Found!1865) lt!140114)) (and (bvsge (index!9631 lt!140114) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140114) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140114) ((_ is Found!1865) lt!140114) (not ((_ is MissingVacant!1865) lt!140114)) (not (= (index!9633 lt!140114) (index!9632 lt!139992))) (and (bvsge (index!9633 lt!140114) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140114) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140114) (ite ((_ is Found!1865) lt!140114) (= (select (arr!6708 a!3325) (index!9631 lt!140114)) (select (arr!6708 a!3325) startIndex!26)) (and ((_ is MissingVacant!1865) lt!140114) (= (index!9633 lt!140114) (index!9632 lt!139992)) (= (select (arr!6708 a!3325) (index!9633 lt!140114)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65337 (= lt!140114 e!179997)))

(declare-fun c!46160 () Bool)

(assert (=> d!65337 (= c!46160 (bvsge (x!27854 lt!139992) #b01111111111111111111111111111110))))

(assert (=> d!65337 (= lt!140115 (select (arr!6708 a!3325) (index!9632 lt!139992)))))

(assert (=> d!65337 (validMask!0 mask!3868)))

(assert (=> d!65337 (= (seekKeyOrZeroReturnVacant!0 (x!27854 lt!139992) (index!9632 lt!139992) (index!9632 lt!139992) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) lt!140114)))

(declare-fun b!283704 () Bool)

(assert (=> b!283704 (= e!179998 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27854 lt!139992) #b00000000000000000000000000000001) (nextIndex!0 (index!9632 lt!139992) (x!27854 lt!139992) mask!3868) (index!9632 lt!139992) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283705 () Bool)

(assert (=> b!283705 (= e!179996 (Found!1865 (index!9632 lt!139992)))))

(assert (= (and d!65337 c!46160) b!283700))

(assert (= (and d!65337 (not c!46160)) b!283701))

(assert (= (and b!283701 c!46159) b!283705))

(assert (= (and b!283701 (not c!46159)) b!283702))

(assert (= (and b!283702 c!46158) b!283703))

(assert (= (and b!283702 (not c!46158)) b!283704))

(declare-fun m!298267 () Bool)

(assert (=> d!65337 m!298267))

(declare-fun m!298269 () Bool)

(assert (=> d!65337 m!298269))

(assert (=> d!65337 m!297931))

(assert (=> d!65337 m!297823))

(declare-fun m!298271 () Bool)

(assert (=> b!283704 m!298271))

(assert (=> b!283704 m!298271))

(assert (=> b!283704 m!297815))

(declare-fun m!298273 () Bool)

(assert (=> b!283704 m!298273))

(assert (=> b!283454 d!65337))

(declare-fun d!65339 () Bool)

(declare-fun e!180009 () Bool)

(assert (=> d!65339 e!180009))

(declare-fun c!46168 () Bool)

(declare-fun lt!140121 () SeekEntryResult!1865)

(assert (=> d!65339 (= c!46168 (and ((_ is Intermediate!1865) lt!140121) (undefined!2677 lt!140121)))))

(declare-fun e!180012 () SeekEntryResult!1865)

(assert (=> d!65339 (= lt!140121 e!180012)))

(declare-fun c!46167 () Bool)

(assert (=> d!65339 (= c!46167 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140120 () (_ BitVec 64))

(assert (=> d!65339 (= lt!140120 (select (arr!6708 a!3325) (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868)))))

(assert (=> d!65339 (validMask!0 mask!3868)))

(assert (=> d!65339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) lt!140121)))

(declare-fun b!283724 () Bool)

(assert (=> b!283724 (and (bvsge (index!9632 lt!140121) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140121) (size!7061 a!3325)))))

(declare-fun res!146496 () Bool)

(assert (=> b!283724 (= res!146496 (= (select (arr!6708 a!3325) (index!9632 lt!140121)) (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun e!180010 () Bool)

(assert (=> b!283724 (=> res!146496 e!180010)))

(declare-fun e!180013 () Bool)

(assert (=> b!283724 (= e!180013 e!180010)))

(declare-fun b!283725 () Bool)

(assert (=> b!283725 (= e!180012 (Intermediate!1865 true (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283726 () Bool)

(assert (=> b!283726 (= e!180009 e!180013)))

(declare-fun res!146497 () Bool)

(assert (=> b!283726 (= res!146497 (and ((_ is Intermediate!1865) lt!140121) (not (undefined!2677 lt!140121)) (bvslt (x!27854 lt!140121) #b01111111111111111111111111111110) (bvsge (x!27854 lt!140121) #b00000000000000000000000000000000) (bvsge (x!27854 lt!140121) #b00000000000000000000000000000000)))))

(assert (=> b!283726 (=> (not res!146497) (not e!180013))))

(declare-fun b!283727 () Bool)

(assert (=> b!283727 (and (bvsge (index!9632 lt!140121) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140121) (size!7061 a!3325)))))

(assert (=> b!283727 (= e!180010 (= (select (arr!6708 a!3325) (index!9632 lt!140121)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180011 () SeekEntryResult!1865)

(declare-fun b!283728 () Bool)

(assert (=> b!283728 (= e!180011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000 mask!3868) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283729 () Bool)

(assert (=> b!283729 (= e!180012 e!180011)))

(declare-fun c!46169 () Bool)

(assert (=> b!283729 (= c!46169 (or (= lt!140120 (select (arr!6708 a!3325) startIndex!26)) (= (bvadd lt!140120 lt!140120) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283730 () Bool)

(assert (=> b!283730 (= e!180011 (Intermediate!1865 false (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283731 () Bool)

(assert (=> b!283731 (and (bvsge (index!9632 lt!140121) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140121) (size!7061 a!3325)))))

(declare-fun res!146495 () Bool)

(assert (=> b!283731 (= res!146495 (= (select (arr!6708 a!3325) (index!9632 lt!140121)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283731 (=> res!146495 e!180010)))

(declare-fun b!283732 () Bool)

(assert (=> b!283732 (= e!180009 (bvsge (x!27854 lt!140121) #b01111111111111111111111111111110))))

(assert (= (and d!65339 c!46167) b!283725))

(assert (= (and d!65339 (not c!46167)) b!283729))

(assert (= (and b!283729 c!46169) b!283730))

(assert (= (and b!283729 (not c!46169)) b!283728))

(assert (= (and d!65339 c!46168) b!283732))

(assert (= (and d!65339 (not c!46168)) b!283726))

(assert (= (and b!283726 res!146497) b!283724))

(assert (= (and b!283724 (not res!146496)) b!283731))

(assert (= (and b!283731 (not res!146495)) b!283727))

(assert (=> d!65339 m!297939))

(declare-fun m!298275 () Bool)

(assert (=> d!65339 m!298275))

(assert (=> d!65339 m!297823))

(declare-fun m!298277 () Bool)

(assert (=> b!283724 m!298277))

(assert (=> b!283727 m!298277))

(assert (=> b!283728 m!297939))

(declare-fun m!298279 () Bool)

(assert (=> b!283728 m!298279))

(assert (=> b!283728 m!298279))

(assert (=> b!283728 m!297815))

(declare-fun m!298281 () Bool)

(assert (=> b!283728 m!298281))

(assert (=> b!283731 m!298277))

(assert (=> d!65223 d!65339))

(declare-fun d!65341 () Bool)

(declare-fun lt!140127 () (_ BitVec 32))

(declare-fun lt!140126 () (_ BitVec 32))

(assert (=> d!65341 (= lt!140127 (bvmul (bvxor lt!140126 (bvlshr lt!140126 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65341 (= lt!140126 ((_ extract 31 0) (bvand (bvxor (select (arr!6708 a!3325) startIndex!26) (bvlshr (select (arr!6708 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65341 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146498 (let ((h!5158 ((_ extract 31 0) (bvand (bvxor (select (arr!6708 a!3325) startIndex!26) (bvlshr (select (arr!6708 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27859 (bvmul (bvxor h!5158 (bvlshr h!5158 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27859 (bvlshr x!27859 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146498 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146498 #b00000000000000000000000000000000))))))

(assert (=> d!65341 (= (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) (bvand (bvxor lt!140127 (bvlshr lt!140127 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65223 d!65341))

(assert (=> d!65223 d!65217))

(declare-fun d!65343 () Bool)

(declare-fun lt!140130 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!192 (List!4489) (InoxSet (_ BitVec 64)))

(assert (=> d!65343 (= lt!140130 (select (content!192 Nil!4486) (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!180019 () Bool)

(assert (=> d!65343 (= lt!140130 e!180019)))

(declare-fun res!146504 () Bool)

(assert (=> d!65343 (=> (not res!146504) (not e!180019))))

(assert (=> d!65343 (= res!146504 ((_ is Cons!4485) Nil!4486))))

(assert (=> d!65343 (= (contains!1971 Nil!4486 (select (arr!6708 a!3325) #b00000000000000000000000000000000)) lt!140130)))

(declare-fun b!283737 () Bool)

(declare-fun e!180018 () Bool)

(assert (=> b!283737 (= e!180019 e!180018)))

(declare-fun res!146503 () Bool)

(assert (=> b!283737 (=> res!146503 e!180018)))

(assert (=> b!283737 (= res!146503 (= (h!5155 Nil!4486) (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283738 () Bool)

(assert (=> b!283738 (= e!180018 (contains!1971 (t!9562 Nil!4486) (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65343 res!146504) b!283737))

(assert (= (and b!283737 (not res!146503)) b!283738))

(declare-fun m!298283 () Bool)

(assert (=> d!65343 m!298283))

(assert (=> d!65343 m!298073))

(declare-fun m!298285 () Bool)

(assert (=> d!65343 m!298285))

(assert (=> b!283738 m!298073))

(declare-fun m!298287 () Bool)

(assert (=> b!283738 m!298287))

(assert (=> b!283567 d!65343))

(assert (=> b!283568 d!65315))

(assert (=> b!283564 d!65315))

(declare-fun b!283739 () Bool)

(declare-fun e!180023 () Bool)

(declare-fun e!180022 () Bool)

(assert (=> b!283739 (= e!180023 e!180022)))

(declare-fun c!46170 () Bool)

(assert (=> b!283739 (= c!46170 (validKeyInArray!0 (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283740 () Bool)

(declare-fun call!25494 () Bool)

(assert (=> b!283740 (= e!180022 call!25494)))

(declare-fun d!65345 () Bool)

(declare-fun res!146505 () Bool)

(declare-fun e!180021 () Bool)

(assert (=> d!65345 (=> res!146505 e!180021)))

(assert (=> d!65345 (= res!146505 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(assert (=> d!65345 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46119 (Cons!4485 (select (arr!6708 a!3325) #b00000000000000000000000000000000) Nil!4486) Nil!4486)) e!180021)))

(declare-fun bm!25491 () Bool)

(assert (=> bm!25491 (= call!25494 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46170 (Cons!4485 (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46119 (Cons!4485 (select (arr!6708 a!3325) #b00000000000000000000000000000000) Nil!4486) Nil!4486)) (ite c!46119 (Cons!4485 (select (arr!6708 a!3325) #b00000000000000000000000000000000) Nil!4486) Nil!4486))))))

(declare-fun b!283741 () Bool)

(assert (=> b!283741 (= e!180022 call!25494)))

(declare-fun b!283742 () Bool)

(declare-fun e!180020 () Bool)

(assert (=> b!283742 (= e!180020 (contains!1971 (ite c!46119 (Cons!4485 (select (arr!6708 a!3325) #b00000000000000000000000000000000) Nil!4486) Nil!4486) (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283743 () Bool)

(assert (=> b!283743 (= e!180021 e!180023)))

(declare-fun res!146507 () Bool)

(assert (=> b!283743 (=> (not res!146507) (not e!180023))))

(assert (=> b!283743 (= res!146507 (not e!180020))))

(declare-fun res!146506 () Bool)

(assert (=> b!283743 (=> (not res!146506) (not e!180020))))

(assert (=> b!283743 (= res!146506 (validKeyInArray!0 (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65345 (not res!146505)) b!283743))

(assert (= (and b!283743 res!146506) b!283742))

(assert (= (and b!283743 res!146507) b!283739))

(assert (= (and b!283739 c!46170) b!283741))

(assert (= (and b!283739 (not c!46170)) b!283740))

(assert (= (or b!283741 b!283740) bm!25491))

(assert (=> b!283739 m!298237))

(assert (=> b!283739 m!298237))

(assert (=> b!283739 m!298239))

(assert (=> bm!25491 m!298237))

(declare-fun m!298289 () Bool)

(assert (=> bm!25491 m!298289))

(assert (=> b!283742 m!298237))

(assert (=> b!283742 m!298237))

(declare-fun m!298291 () Bool)

(assert (=> b!283742 m!298291))

(assert (=> b!283743 m!298237))

(assert (=> b!283743 m!298237))

(assert (=> b!283743 m!298239))

(assert (=> bm!25476 d!65345))

(declare-fun d!65347 () Bool)

(assert (=> d!65347 (arrayNoDuplicates!0 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) #b00000000000000000000000000000000 Nil!4486)))

(assert (=> d!65347 true))

(declare-fun _$65!101 () Unit!8976)

(assert (=> d!65347 (= (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4486) _$65!101)))

(declare-fun bs!10052 () Bool)

(assert (= bs!10052 d!65347))

(assert (=> bs!10052 m!297799))

(assert (=> bs!10052 m!297951))

(assert (=> d!65233 d!65347))

(assert (=> d!65237 d!65241))

(declare-fun d!65349 () Bool)

(assert (=> d!65349 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(assert (=> d!65349 true))

(declare-fun _$72!98 () Unit!8976)

(assert (=> d!65349 (= (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) _$72!98)))

(declare-fun bs!10053 () Bool)

(assert (= bs!10053 d!65349))

(assert (=> bs!10053 m!297813))

(assert (=> d!65237 d!65349))

(assert (=> d!65237 d!65217))

(declare-fun d!65351 () Bool)

(declare-fun e!180024 () Bool)

(assert (=> d!65351 e!180024))

(declare-fun c!46172 () Bool)

(declare-fun lt!140132 () SeekEntryResult!1865)

(assert (=> d!65351 (= c!46172 (and ((_ is Intermediate!1865) lt!140132) (undefined!2677 lt!140132)))))

(declare-fun e!180027 () SeekEntryResult!1865)

(assert (=> d!65351 (= lt!140132 e!180027)))

(declare-fun c!46171 () Bool)

(assert (=> d!65351 (= c!46171 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140131 () (_ BitVec 64))

(assert (=> d!65351 (= lt!140131 (select (arr!6708 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!65351 (validMask!0 mask!3868)))

(assert (=> d!65351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!140132)))

(declare-fun b!283744 () Bool)

(assert (=> b!283744 (and (bvsge (index!9632 lt!140132) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140132) (size!7061 a!3325)))))

(declare-fun res!146509 () Bool)

(assert (=> b!283744 (= res!146509 (= (select (arr!6708 a!3325) (index!9632 lt!140132)) k0!2581))))

(declare-fun e!180025 () Bool)

(assert (=> b!283744 (=> res!146509 e!180025)))

(declare-fun e!180028 () Bool)

(assert (=> b!283744 (= e!180028 e!180025)))

(declare-fun b!283745 () Bool)

(assert (=> b!283745 (= e!180027 (Intermediate!1865 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283746 () Bool)

(assert (=> b!283746 (= e!180024 e!180028)))

(declare-fun res!146510 () Bool)

(assert (=> b!283746 (= res!146510 (and ((_ is Intermediate!1865) lt!140132) (not (undefined!2677 lt!140132)) (bvslt (x!27854 lt!140132) #b01111111111111111111111111111110) (bvsge (x!27854 lt!140132) #b00000000000000000000000000000000) (bvsge (x!27854 lt!140132) #b00000000000000000000000000000000)))))

(assert (=> b!283746 (=> (not res!146510) (not e!180028))))

(declare-fun b!283747 () Bool)

(assert (=> b!283747 (and (bvsge (index!9632 lt!140132) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140132) (size!7061 a!3325)))))

(assert (=> b!283747 (= e!180025 (= (select (arr!6708 a!3325) (index!9632 lt!140132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180026 () SeekEntryResult!1865)

(declare-fun b!283748 () Bool)

(assert (=> b!283748 (= e!180026 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!283749 () Bool)

(assert (=> b!283749 (= e!180027 e!180026)))

(declare-fun c!46173 () Bool)

(assert (=> b!283749 (= c!46173 (or (= lt!140131 k0!2581) (= (bvadd lt!140131 lt!140131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283750 () Bool)

(assert (=> b!283750 (= e!180026 (Intermediate!1865 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283751 () Bool)

(assert (=> b!283751 (and (bvsge (index!9632 lt!140132) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140132) (size!7061 a!3325)))))

(declare-fun res!146508 () Bool)

(assert (=> b!283751 (= res!146508 (= (select (arr!6708 a!3325) (index!9632 lt!140132)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283751 (=> res!146508 e!180025)))

(declare-fun b!283752 () Bool)

(assert (=> b!283752 (= e!180024 (bvsge (x!27854 lt!140132) #b01111111111111111111111111111110))))

(assert (= (and d!65351 c!46171) b!283745))

(assert (= (and d!65351 (not c!46171)) b!283749))

(assert (= (and b!283749 c!46173) b!283750))

(assert (= (and b!283749 (not c!46173)) b!283748))

(assert (= (and d!65351 c!46172) b!283752))

(assert (= (and d!65351 (not c!46172)) b!283746))

(assert (= (and b!283746 res!146510) b!283744))

(assert (= (and b!283744 (not res!146509)) b!283751))

(assert (= (and b!283751 (not res!146508)) b!283747))

(assert (=> d!65351 m!298103))

(declare-fun m!298293 () Bool)

(assert (=> d!65351 m!298293))

(assert (=> d!65351 m!297823))

(declare-fun m!298295 () Bool)

(assert (=> b!283744 m!298295))

(assert (=> b!283747 m!298295))

(assert (=> b!283748 m!298103))

(declare-fun m!298297 () Bool)

(assert (=> b!283748 m!298297))

(assert (=> b!283748 m!298297))

(declare-fun m!298299 () Bool)

(assert (=> b!283748 m!298299))

(assert (=> b!283751 m!298295))

(assert (=> d!65273 d!65351))

(declare-fun d!65353 () Bool)

(declare-fun lt!140134 () (_ BitVec 32))

(declare-fun lt!140133 () (_ BitVec 32))

(assert (=> d!65353 (= lt!140134 (bvmul (bvxor lt!140133 (bvlshr lt!140133 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65353 (= lt!140133 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65353 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146498 (let ((h!5158 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27859 (bvmul (bvxor h!5158 (bvlshr h!5158 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27859 (bvlshr x!27859 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146498 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146498 #b00000000000000000000000000000000))))))

(assert (=> d!65353 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!140134 (bvlshr lt!140134 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65273 d!65353))

(assert (=> d!65273 d!65217))

(declare-fun d!65355 () Bool)

(declare-fun lt!140135 () Bool)

(assert (=> d!65355 (= lt!140135 (select (content!192 Nil!4486) (select (arr!6708 lt!139943) #b00000000000000000000000000000000)))))

(declare-fun e!180030 () Bool)

(assert (=> d!65355 (= lt!140135 e!180030)))

(declare-fun res!146512 () Bool)

(assert (=> d!65355 (=> (not res!146512) (not e!180030))))

(assert (=> d!65355 (= res!146512 ((_ is Cons!4485) Nil!4486))))

(assert (=> d!65355 (= (contains!1971 Nil!4486 (select (arr!6708 lt!139943) #b00000000000000000000000000000000)) lt!140135)))

(declare-fun b!283753 () Bool)

(declare-fun e!180029 () Bool)

(assert (=> b!283753 (= e!180030 e!180029)))

(declare-fun res!146511 () Bool)

(assert (=> b!283753 (=> res!146511 e!180029)))

(assert (=> b!283753 (= res!146511 (= (h!5155 Nil!4486) (select (arr!6708 lt!139943) #b00000000000000000000000000000000)))))

(declare-fun b!283754 () Bool)

(assert (=> b!283754 (= e!180029 (contains!1971 (t!9562 Nil!4486) (select (arr!6708 lt!139943) #b00000000000000000000000000000000)))))

(assert (= (and d!65355 res!146512) b!283753))

(assert (= (and b!283753 (not res!146511)) b!283754))

(assert (=> d!65355 m!298283))

(assert (=> d!65355 m!297997))

(declare-fun m!298301 () Bool)

(assert (=> d!65355 m!298301))

(assert (=> b!283754 m!297997))

(declare-fun m!298303 () Bool)

(assert (=> b!283754 m!298303))

(assert (=> b!283517 d!65355))

(declare-fun d!65357 () Bool)

(assert (=> d!65357 (= (validKeyInArray!0 (select (arr!6708 lt!139943) #b00000000000000000000000000000000)) (and (not (= (select (arr!6708 lt!139943) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6708 lt!139943) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283518 d!65357))

(assert (=> b!283479 d!65265))

(declare-fun d!65359 () Bool)

(declare-fun e!180031 () Bool)

(assert (=> d!65359 e!180031))

(declare-fun c!46175 () Bool)

(declare-fun lt!140137 () SeekEntryResult!1865)

(assert (=> d!65359 (= c!46175 (and ((_ is Intermediate!1865) lt!140137) (undefined!2677 lt!140137)))))

(declare-fun e!180034 () SeekEntryResult!1865)

(assert (=> d!65359 (= lt!140137 e!180034)))

(declare-fun c!46174 () Bool)

(assert (=> d!65359 (= c!46174 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140136 () (_ BitVec 64))

(assert (=> d!65359 (= lt!140136 (select (arr!6708 lt!139943) (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868)))))

(assert (=> d!65359 (validMask!0 mask!3868)))

(assert (=> d!65359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868) lt!140137)))

(declare-fun b!283755 () Bool)

(assert (=> b!283755 (and (bvsge (index!9632 lt!140137) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140137) (size!7061 lt!139943)))))

(declare-fun res!146514 () Bool)

(assert (=> b!283755 (= res!146514 (= (select (arr!6708 lt!139943) (index!9632 lt!140137)) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun e!180032 () Bool)

(assert (=> b!283755 (=> res!146514 e!180032)))

(declare-fun e!180035 () Bool)

(assert (=> b!283755 (= e!180035 e!180032)))

(declare-fun b!283756 () Bool)

(assert (=> b!283756 (= e!180034 (Intermediate!1865 true (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283757 () Bool)

(assert (=> b!283757 (= e!180031 e!180035)))

(declare-fun res!146515 () Bool)

(assert (=> b!283757 (= res!146515 (and ((_ is Intermediate!1865) lt!140137) (not (undefined!2677 lt!140137)) (bvslt (x!27854 lt!140137) #b01111111111111111111111111111110) (bvsge (x!27854 lt!140137) #b00000000000000000000000000000000) (bvsge (x!27854 lt!140137) #b00000000000000000000000000000000)))))

(assert (=> b!283757 (=> (not res!146515) (not e!180035))))

(declare-fun b!283758 () Bool)

(assert (=> b!283758 (and (bvsge (index!9632 lt!140137) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140137) (size!7061 lt!139943)))))

(assert (=> b!283758 (= e!180032 (= (select (arr!6708 lt!139943) (index!9632 lt!140137)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180033 () SeekEntryResult!1865)

(declare-fun b!283759 () Bool)

(assert (=> b!283759 (= e!180033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000 mask!3868) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139943 mask!3868))))

(declare-fun b!283760 () Bool)

(assert (=> b!283760 (= e!180034 e!180033)))

(declare-fun c!46176 () Bool)

(assert (=> b!283760 (= c!46176 (or (= lt!140136 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)) (= (bvadd lt!140136 lt!140136) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283761 () Bool)

(assert (=> b!283761 (= e!180033 (Intermediate!1865 false (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283762 () Bool)

(assert (=> b!283762 (and (bvsge (index!9632 lt!140137) #b00000000000000000000000000000000) (bvslt (index!9632 lt!140137) (size!7061 lt!139943)))))

(declare-fun res!146513 () Bool)

(assert (=> b!283762 (= res!146513 (= (select (arr!6708 lt!139943) (index!9632 lt!140137)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283762 (=> res!146513 e!180032)))

(declare-fun b!283763 () Bool)

(assert (=> b!283763 (= e!180031 (bvsge (x!27854 lt!140137) #b01111111111111111111111111111110))))

(assert (= (and d!65359 c!46174) b!283756))

(assert (= (and d!65359 (not c!46174)) b!283760))

(assert (= (and b!283760 c!46176) b!283761))

(assert (= (and b!283760 (not c!46176)) b!283759))

(assert (= (and d!65359 c!46175) b!283763))

(assert (= (and d!65359 (not c!46175)) b!283757))

(assert (= (and b!283757 res!146515) b!283755))

(assert (= (and b!283755 (not res!146514)) b!283762))

(assert (= (and b!283762 (not res!146513)) b!283758))

(assert (=> d!65359 m!297983))

(declare-fun m!298305 () Bool)

(assert (=> d!65359 m!298305))

(assert (=> d!65359 m!297823))

(declare-fun m!298307 () Bool)

(assert (=> b!283755 m!298307))

(assert (=> b!283758 m!298307))

(assert (=> b!283759 m!297983))

(declare-fun m!298309 () Bool)

(assert (=> b!283759 m!298309))

(assert (=> b!283759 m!298309))

(assert (=> b!283759 m!297809))

(declare-fun m!298311 () Bool)

(assert (=> b!283759 m!298311))

(assert (=> b!283762 m!298307))

(assert (=> d!65243 d!65359))

(declare-fun d!65361 () Bool)

(declare-fun lt!140139 () (_ BitVec 32))

(declare-fun lt!140138 () (_ BitVec 32))

(assert (=> d!65361 (= lt!140139 (bvmul (bvxor lt!140138 (bvlshr lt!140138 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65361 (= lt!140138 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (bvlshr (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65361 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146498 (let ((h!5158 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (bvlshr (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27859 (bvmul (bvxor h!5158 (bvlshr h!5158 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27859 (bvlshr x!27859 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146498 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146498 #b00000000000000000000000000000000))))))

(assert (=> d!65361 (= (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (bvand (bvxor lt!140139 (bvlshr lt!140139 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65243 d!65361))

(assert (=> d!65243 d!65217))

(declare-fun b!283764 () Bool)

(declare-fun e!180039 () Bool)

(declare-fun e!180038 () Bool)

(assert (=> b!283764 (= e!180039 e!180038)))

(declare-fun c!46177 () Bool)

(assert (=> b!283764 (= c!46177 (validKeyInArray!0 (select (arr!6708 lt!139943) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283765 () Bool)

(declare-fun call!25495 () Bool)

(assert (=> b!283765 (= e!180038 call!25495)))

(declare-fun d!65363 () Bool)

(declare-fun res!146516 () Bool)

(declare-fun e!180037 () Bool)

(assert (=> d!65363 (=> res!146516 e!180037)))

(assert (=> d!65363 (= res!146516 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 lt!139943)))))

(assert (=> d!65363 (= (arrayNoDuplicates!0 lt!139943 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46100 (Cons!4485 (select (arr!6708 lt!139943) #b00000000000000000000000000000000) Nil!4486) Nil!4486)) e!180037)))

(declare-fun bm!25492 () Bool)

(assert (=> bm!25492 (= call!25495 (arrayNoDuplicates!0 lt!139943 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46177 (Cons!4485 (select (arr!6708 lt!139943) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46100 (Cons!4485 (select (arr!6708 lt!139943) #b00000000000000000000000000000000) Nil!4486) Nil!4486)) (ite c!46100 (Cons!4485 (select (arr!6708 lt!139943) #b00000000000000000000000000000000) Nil!4486) Nil!4486))))))

(declare-fun b!283766 () Bool)

(assert (=> b!283766 (= e!180038 call!25495)))

(declare-fun b!283767 () Bool)

(declare-fun e!180036 () Bool)

(assert (=> b!283767 (= e!180036 (contains!1971 (ite c!46100 (Cons!4485 (select (arr!6708 lt!139943) #b00000000000000000000000000000000) Nil!4486) Nil!4486) (select (arr!6708 lt!139943) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283768 () Bool)

(assert (=> b!283768 (= e!180037 e!180039)))

(declare-fun res!146518 () Bool)

(assert (=> b!283768 (=> (not res!146518) (not e!180039))))

(assert (=> b!283768 (= res!146518 (not e!180036))))

(declare-fun res!146517 () Bool)

(assert (=> b!283768 (=> (not res!146517) (not e!180036))))

(assert (=> b!283768 (= res!146517 (validKeyInArray!0 (select (arr!6708 lt!139943) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65363 (not res!146516)) b!283768))

(assert (= (and b!283768 res!146517) b!283767))

(assert (= (and b!283768 res!146518) b!283764))

(assert (= (and b!283764 c!46177) b!283766))

(assert (= (and b!283764 (not c!46177)) b!283765))

(assert (= (or b!283766 b!283765) bm!25492))

(declare-fun m!298313 () Bool)

(assert (=> b!283764 m!298313))

(assert (=> b!283764 m!298313))

(declare-fun m!298315 () Bool)

(assert (=> b!283764 m!298315))

(assert (=> bm!25492 m!298313))

(declare-fun m!298317 () Bool)

(assert (=> bm!25492 m!298317))

(assert (=> b!283767 m!298313))

(assert (=> b!283767 m!298313))

(declare-fun m!298319 () Bool)

(assert (=> b!283767 m!298319))

(assert (=> b!283768 m!298313))

(assert (=> b!283768 m!298313))

(assert (=> b!283768 m!298315))

(assert (=> bm!25475 d!65363))

(declare-fun d!65365 () Bool)

(assert (=> d!65365 (arrayContainsKey!0 a!3325 lt!140011 #b00000000000000000000000000000000)))

(declare-fun lt!140140 () Unit!8976)

(assert (=> d!65365 (= lt!140140 (choose!13 a!3325 lt!140011 startIndex!26))))

(assert (=> d!65365 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65365 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140011 startIndex!26) lt!140140)))

(declare-fun bs!10054 () Bool)

(assert (= bs!10054 d!65365))

(assert (=> bs!10054 m!297971))

(declare-fun m!298321 () Bool)

(assert (=> bs!10054 m!298321))

(assert (=> b!283480 d!65365))

(declare-fun d!65367 () Bool)

(declare-fun res!146519 () Bool)

(declare-fun e!180040 () Bool)

(assert (=> d!65367 (=> res!146519 e!180040)))

(assert (=> d!65367 (= res!146519 (= (select (arr!6708 a!3325) #b00000000000000000000000000000000) lt!140011))))

(assert (=> d!65367 (= (arrayContainsKey!0 a!3325 lt!140011 #b00000000000000000000000000000000) e!180040)))

(declare-fun b!283769 () Bool)

(declare-fun e!180041 () Bool)

(assert (=> b!283769 (= e!180040 e!180041)))

(declare-fun res!146520 () Bool)

(assert (=> b!283769 (=> (not res!146520) (not e!180041))))

(assert (=> b!283769 (= res!146520 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(declare-fun b!283770 () Bool)

(assert (=> b!283770 (= e!180041 (arrayContainsKey!0 a!3325 lt!140011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65367 (not res!146519)) b!283769))

(assert (= (and b!283769 res!146520) b!283770))

(assert (=> d!65367 m!298073))

(declare-fun m!298323 () Bool)

(assert (=> b!283770 m!298323))

(assert (=> b!283480 d!65367))

(assert (=> b!283480 d!65223))

(declare-fun d!65369 () Bool)

(declare-fun res!146521 () Bool)

(declare-fun e!180044 () Bool)

(assert (=> d!65369 (=> res!146521 e!180044)))

(assert (=> d!65369 (= res!146521 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(assert (=> d!65369 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868) e!180044)))

(declare-fun b!283771 () Bool)

(declare-fun e!180042 () Bool)

(assert (=> b!283771 (= e!180044 e!180042)))

(declare-fun c!46178 () Bool)

(assert (=> b!283771 (= c!46178 (validKeyInArray!0 (select (arr!6708 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun b!283772 () Bool)

(declare-fun e!180043 () Bool)

(assert (=> b!283772 (= e!180042 e!180043)))

(declare-fun lt!140141 () (_ BitVec 64))

(assert (=> b!283772 (= lt!140141 (select (arr!6708 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140143 () Unit!8976)

(assert (=> b!283772 (= lt!140143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140141 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!283772 (arrayContainsKey!0 a!3325 lt!140141 #b00000000000000000000000000000000)))

(declare-fun lt!140142 () Unit!8976)

(assert (=> b!283772 (= lt!140142 lt!140143)))

(declare-fun res!146522 () Bool)

(assert (=> b!283772 (= res!146522 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1865 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!283772 (=> (not res!146522) (not e!180043))))

(declare-fun bm!25493 () Bool)

(declare-fun call!25496 () Bool)

(assert (=> bm!25493 (= call!25496 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283773 () Bool)

(assert (=> b!283773 (= e!180042 call!25496)))

(declare-fun b!283774 () Bool)

(assert (=> b!283774 (= e!180043 call!25496)))

(assert (= (and d!65369 (not res!146521)) b!283771))

(assert (= (and b!283771 c!46178) b!283772))

(assert (= (and b!283771 (not c!46178)) b!283773))

(assert (= (and b!283772 res!146522) b!283774))

(assert (= (or b!283774 b!283773) bm!25493))

(declare-fun m!298325 () Bool)

(assert (=> b!283771 m!298325))

(assert (=> b!283771 m!298325))

(declare-fun m!298327 () Bool)

(assert (=> b!283771 m!298327))

(assert (=> b!283772 m!298325))

(declare-fun m!298329 () Bool)

(assert (=> b!283772 m!298329))

(declare-fun m!298331 () Bool)

(assert (=> b!283772 m!298331))

(assert (=> b!283772 m!298325))

(declare-fun m!298333 () Bool)

(assert (=> b!283772 m!298333))

(declare-fun m!298335 () Bool)

(assert (=> bm!25493 m!298335))

(assert (=> bm!25469 d!65369))

(declare-fun d!65371 () Bool)

(declare-fun res!146523 () Bool)

(declare-fun e!180045 () Bool)

(assert (=> d!65371 (=> res!146523 e!180045)))

(assert (=> d!65371 (= res!146523 (= (select (arr!6708 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!65371 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!180045)))

(declare-fun b!283775 () Bool)

(declare-fun e!180046 () Bool)

(assert (=> b!283775 (= e!180045 e!180046)))

(declare-fun res!146524 () Bool)

(assert (=> b!283775 (=> (not res!146524) (not e!180046))))

(assert (=> b!283775 (= res!146524 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(declare-fun b!283776 () Bool)

(assert (=> b!283776 (= e!180046 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65371 (not res!146523)) b!283775))

(assert (= (and b!283775 res!146524) b!283776))

(assert (=> d!65371 m!298237))

(declare-fun m!298337 () Bool)

(assert (=> b!283776 m!298337))

(assert (=> b!283587 d!65371))

(assert (=> b!283514 d!65357))

(declare-fun b!283777 () Bool)

(declare-fun e!180050 () Bool)

(declare-fun e!180049 () Bool)

(assert (=> b!283777 (= e!180050 e!180049)))

(declare-fun c!46179 () Bool)

(assert (=> b!283777 (= c!46179 (validKeyInArray!0 (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun b!283778 () Bool)

(declare-fun call!25497 () Bool)

(assert (=> b!283778 (= e!180049 call!25497)))

(declare-fun d!65373 () Bool)

(declare-fun res!146525 () Bool)

(declare-fun e!180048 () Bool)

(assert (=> d!65373 (=> res!146525 e!180048)))

(assert (=> d!65373 (= res!146525 (bvsge #b00000000000000000000000000000000 (size!7061 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)))))))

(assert (=> d!65373 (= (arrayNoDuplicates!0 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) #b00000000000000000000000000000000 Nil!4486) e!180048)))

(declare-fun bm!25494 () Bool)

(assert (=> bm!25494 (= call!25497 (arrayNoDuplicates!0 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46179 (Cons!4485 (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) #b00000000000000000000000000000000) Nil!4486) Nil!4486)))))

(declare-fun b!283779 () Bool)

(assert (=> b!283779 (= e!180049 call!25497)))

(declare-fun b!283780 () Bool)

(declare-fun e!180047 () Bool)

(assert (=> b!283780 (= e!180047 (contains!1971 Nil!4486 (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun b!283781 () Bool)

(assert (=> b!283781 (= e!180048 e!180050)))

(declare-fun res!146527 () Bool)

(assert (=> b!283781 (=> (not res!146527) (not e!180050))))

(assert (=> b!283781 (= res!146527 (not e!180047))))

(declare-fun res!146526 () Bool)

(assert (=> b!283781 (=> (not res!146526) (not e!180047))))

(assert (=> b!283781 (= res!146526 (validKeyInArray!0 (select (arr!6708 (array!14137 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7061 a!3325))) #b00000000000000000000000000000000)))))

(assert (= (and d!65373 (not res!146525)) b!283781))

(assert (= (and b!283781 res!146526) b!283780))

(assert (= (and b!283781 res!146527) b!283777))

(assert (= (and b!283777 c!46179) b!283779))

(assert (= (and b!283777 (not c!46179)) b!283778))

(assert (= (or b!283779 b!283778) bm!25494))

(declare-fun m!298339 () Bool)

(assert (=> b!283777 m!298339))

(assert (=> b!283777 m!298339))

(declare-fun m!298341 () Bool)

(assert (=> b!283777 m!298341))

(assert (=> bm!25494 m!298339))

(declare-fun m!298343 () Bool)

(assert (=> bm!25494 m!298343))

(assert (=> b!283780 m!298339))

(assert (=> b!283780 m!298339))

(declare-fun m!298345 () Bool)

(assert (=> b!283780 m!298345))

(assert (=> b!283781 m!298339))

(assert (=> b!283781 m!298339))

(assert (=> b!283781 m!298341))

(assert (=> b!283472 d!65373))

(declare-fun d!65375 () Bool)

(declare-fun res!146528 () Bool)

(declare-fun e!180053 () Bool)

(assert (=> d!65375 (=> res!146528 e!180053)))

(assert (=> d!65375 (= res!146528 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7061 lt!139943)))))

(assert (=> d!65375 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139943 mask!3868) e!180053)))

(declare-fun b!283782 () Bool)

(declare-fun e!180051 () Bool)

(assert (=> b!283782 (= e!180053 e!180051)))

(declare-fun c!46180 () Bool)

(assert (=> b!283782 (= c!46180 (validKeyInArray!0 (select (arr!6708 lt!139943) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun b!283783 () Bool)

(declare-fun e!180052 () Bool)

(assert (=> b!283783 (= e!180051 e!180052)))

(declare-fun lt!140144 () (_ BitVec 64))

(assert (=> b!283783 (= lt!140144 (select (arr!6708 lt!139943) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140146 () Unit!8976)

(assert (=> b!283783 (= lt!140146 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139943 lt!140144 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!283783 (arrayContainsKey!0 lt!139943 lt!140144 #b00000000000000000000000000000000)))

(declare-fun lt!140145 () Unit!8976)

(assert (=> b!283783 (= lt!140145 lt!140146)))

(declare-fun res!146529 () Bool)

(assert (=> b!283783 (= res!146529 (= (seekEntryOrOpen!0 (select (arr!6708 lt!139943) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!139943 mask!3868) (Found!1865 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!283783 (=> (not res!146529) (not e!180052))))

(declare-fun call!25498 () Bool)

(declare-fun bm!25495 () Bool)

(assert (=> bm!25495 (= call!25498 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!139943 mask!3868))))

(declare-fun b!283784 () Bool)

(assert (=> b!283784 (= e!180051 call!25498)))

(declare-fun b!283785 () Bool)

(assert (=> b!283785 (= e!180052 call!25498)))

(assert (= (and d!65375 (not res!146528)) b!283782))

(assert (= (and b!283782 c!46180) b!283783))

(assert (= (and b!283782 (not c!46180)) b!283784))

(assert (= (and b!283783 res!146529) b!283785))

(assert (= (or b!283785 b!283784) bm!25495))

(declare-fun m!298347 () Bool)

(assert (=> b!283782 m!298347))

(assert (=> b!283782 m!298347))

(declare-fun m!298349 () Bool)

(assert (=> b!283782 m!298349))

(assert (=> b!283783 m!298347))

(declare-fun m!298351 () Bool)

(assert (=> b!283783 m!298351))

(declare-fun m!298353 () Bool)

(assert (=> b!283783 m!298353))

(assert (=> b!283783 m!298347))

(declare-fun m!298355 () Bool)

(assert (=> b!283783 m!298355))

(declare-fun m!298357 () Bool)

(assert (=> bm!25495 m!298357))

(assert (=> bm!25465 d!65375))

(declare-fun b!283786 () Bool)

(declare-fun e!180055 () SeekEntryResult!1865)

(assert (=> b!283786 (= e!180055 Undefined!1865)))

(declare-fun b!283787 () Bool)

(declare-fun e!180054 () SeekEntryResult!1865)

(assert (=> b!283787 (= e!180055 e!180054)))

(declare-fun c!46182 () Bool)

(declare-fun lt!140148 () (_ BitVec 64))

(assert (=> b!283787 (= c!46182 (= lt!140148 k0!2581))))

(declare-fun b!283788 () Bool)

(declare-fun c!46181 () Bool)

(assert (=> b!283788 (= c!46181 (= lt!140148 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180056 () SeekEntryResult!1865)

(assert (=> b!283788 (= e!180054 e!180056)))

(declare-fun b!283789 () Bool)

(assert (=> b!283789 (= e!180056 (MissingVacant!1865 (index!9632 lt!140054)))))

(declare-fun d!65377 () Bool)

(declare-fun lt!140147 () SeekEntryResult!1865)

(assert (=> d!65377 (and (or ((_ is Undefined!1865) lt!140147) (not ((_ is Found!1865) lt!140147)) (and (bvsge (index!9631 lt!140147) #b00000000000000000000000000000000) (bvslt (index!9631 lt!140147) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140147) ((_ is Found!1865) lt!140147) (not ((_ is MissingVacant!1865) lt!140147)) (not (= (index!9633 lt!140147) (index!9632 lt!140054))) (and (bvsge (index!9633 lt!140147) #b00000000000000000000000000000000) (bvslt (index!9633 lt!140147) (size!7061 a!3325)))) (or ((_ is Undefined!1865) lt!140147) (ite ((_ is Found!1865) lt!140147) (= (select (arr!6708 a!3325) (index!9631 lt!140147)) k0!2581) (and ((_ is MissingVacant!1865) lt!140147) (= (index!9633 lt!140147) (index!9632 lt!140054)) (= (select (arr!6708 a!3325) (index!9633 lt!140147)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!65377 (= lt!140147 e!180055)))

(declare-fun c!46183 () Bool)

(assert (=> d!65377 (= c!46183 (bvsge (x!27854 lt!140054) #b01111111111111111111111111111110))))

(assert (=> d!65377 (= lt!140148 (select (arr!6708 a!3325) (index!9632 lt!140054)))))

(assert (=> d!65377 (validMask!0 mask!3868)))

(assert (=> d!65377 (= (seekKeyOrZeroReturnVacant!0 (x!27854 lt!140054) (index!9632 lt!140054) (index!9632 lt!140054) k0!2581 a!3325 mask!3868) lt!140147)))

(declare-fun b!283790 () Bool)

(assert (=> b!283790 (= e!180056 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27854 lt!140054) #b00000000000000000000000000000001) (nextIndex!0 (index!9632 lt!140054) (x!27854 lt!140054) mask!3868) (index!9632 lt!140054) k0!2581 a!3325 mask!3868))))

(declare-fun b!283791 () Bool)

(assert (=> b!283791 (= e!180054 (Found!1865 (index!9632 lt!140054)))))

(assert (= (and d!65377 c!46183) b!283786))

(assert (= (and d!65377 (not c!46183)) b!283787))

(assert (= (and b!283787 c!46182) b!283791))

(assert (= (and b!283787 (not c!46182)) b!283788))

(assert (= (and b!283788 c!46181) b!283789))

(assert (= (and b!283788 (not c!46181)) b!283790))

(declare-fun m!298359 () Bool)

(assert (=> d!65377 m!298359))

(declare-fun m!298361 () Bool)

(assert (=> d!65377 m!298361))

(assert (=> d!65377 m!298095))

(assert (=> d!65377 m!297823))

(declare-fun m!298363 () Bool)

(assert (=> b!283790 m!298363))

(assert (=> b!283790 m!298363))

(declare-fun m!298365 () Bool)

(assert (=> b!283790 m!298365))

(assert (=> b!283581 d!65377))

(check-sat (not d!65339) (not d!65347) (not b!283669) (not b!283693) (not b!283738) (not d!65365) (not b!283754) (not d!65313) (not b!283780) (not bm!25490) (not b!283699) (not bm!25491) (not b!283742) (not b!283768) (not b!283790) (not d!65377) (not b!283686) (not b!283743) (not b!283767) (not bm!25492) (not b!283728) (not b!283689) (not d!65327) (not d!65343) (not d!65349) (not b!283782) (not b!283663) (not d!65321) (not d!65337) (not bm!25495) (not b!283770) (not b!283783) (not b!283759) (not b!283704) (not b!283776) (not d!65359) (not d!65355) (not bm!25493) (not b!283748) (not b!283781) (not b!283764) (not b!283772) (not b!283661) (not b!283688) (not b!283739) (not b!283777) (not bm!25494) (not d!65335) (not d!65325) (not b!283771) (not d!65319) (not d!65331) (not d!65351))
(check-sat)
