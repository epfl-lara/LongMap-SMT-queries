; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122516 () Bool)

(assert start!122516)

(declare-fun b!1419314 () Bool)

(declare-fun res!954835 () Bool)

(declare-fun e!803033 () Bool)

(assert (=> b!1419314 (=> (not res!954835) (not e!803033))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96920 0))(
  ( (array!96921 (arr!46779 (Array (_ BitVec 32) (_ BitVec 64))) (size!47329 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96920)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419314 (= res!954835 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47329 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47329 a!2831))))))

(declare-fun b!1419315 () Bool)

(declare-fun res!954837 () Bool)

(assert (=> b!1419315 (=> (not res!954837) (not e!803033))))

(declare-datatypes ((List!33289 0))(
  ( (Nil!33286) (Cons!33285 (h!34584 (_ BitVec 64)) (t!47983 List!33289)) )
))
(declare-fun arrayNoDuplicates!0 (array!96920 (_ BitVec 32) List!33289) Bool)

(assert (=> b!1419315 (= res!954837 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33286))))

(declare-fun b!1419316 () Bool)

(declare-fun res!954838 () Bool)

(assert (=> b!1419316 (=> (not res!954838) (not e!803033))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419316 (= res!954838 (validKeyInArray!0 (select (arr!46779 a!2831) j!81)))))

(declare-fun b!1419317 () Bool)

(declare-fun res!954840 () Bool)

(assert (=> b!1419317 (=> (not res!954840) (not e!803033))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11064 0))(
  ( (MissingZero!11064 (index!46648 (_ BitVec 32))) (Found!11064 (index!46649 (_ BitVec 32))) (Intermediate!11064 (undefined!11876 Bool) (index!46650 (_ BitVec 32)) (x!128316 (_ BitVec 32))) (Undefined!11064) (MissingVacant!11064 (index!46651 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96920 (_ BitVec 32)) SeekEntryResult!11064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419317 (= res!954840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608) (select (arr!46779 a!2831) j!81) a!2831 mask!2608) (Intermediate!11064 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419318 () Bool)

(declare-fun lt!625755 () (_ BitVec 32))

(assert (=> b!1419318 (= e!803033 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625755 #b00000000000000000000000000000000) (bvsge lt!625755 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419318 (= lt!625755 (toIndex!0 (select (store (arr!46779 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun res!954839 () Bool)

(assert (=> start!122516 (=> (not res!954839) (not e!803033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122516 (= res!954839 (validMask!0 mask!2608))))

(assert (=> start!122516 e!803033))

(assert (=> start!122516 true))

(declare-fun array_inv!35807 (array!96920) Bool)

(assert (=> start!122516 (array_inv!35807 a!2831)))

(declare-fun b!1419319 () Bool)

(declare-fun res!954836 () Bool)

(assert (=> b!1419319 (=> (not res!954836) (not e!803033))))

(assert (=> b!1419319 (= res!954836 (and (= (size!47329 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47329 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47329 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419320 () Bool)

(declare-fun res!954834 () Bool)

(assert (=> b!1419320 (=> (not res!954834) (not e!803033))))

(assert (=> b!1419320 (= res!954834 (validKeyInArray!0 (select (arr!46779 a!2831) i!982)))))

(declare-fun b!1419321 () Bool)

(declare-fun res!954841 () Bool)

(assert (=> b!1419321 (=> (not res!954841) (not e!803033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96920 (_ BitVec 32)) Bool)

(assert (=> b!1419321 (= res!954841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122516 res!954839) b!1419319))

(assert (= (and b!1419319 res!954836) b!1419320))

(assert (= (and b!1419320 res!954834) b!1419316))

(assert (= (and b!1419316 res!954838) b!1419321))

(assert (= (and b!1419321 res!954841) b!1419315))

(assert (= (and b!1419315 res!954837) b!1419314))

(assert (= (and b!1419314 res!954835) b!1419317))

(assert (= (and b!1419317 res!954840) b!1419318))

(declare-fun m!1309835 () Bool)

(assert (=> start!122516 m!1309835))

(declare-fun m!1309837 () Bool)

(assert (=> start!122516 m!1309837))

(declare-fun m!1309839 () Bool)

(assert (=> b!1419321 m!1309839))

(declare-fun m!1309841 () Bool)

(assert (=> b!1419318 m!1309841))

(declare-fun m!1309843 () Bool)

(assert (=> b!1419318 m!1309843))

(assert (=> b!1419318 m!1309843))

(declare-fun m!1309845 () Bool)

(assert (=> b!1419318 m!1309845))

(declare-fun m!1309847 () Bool)

(assert (=> b!1419317 m!1309847))

(assert (=> b!1419317 m!1309847))

(declare-fun m!1309849 () Bool)

(assert (=> b!1419317 m!1309849))

(assert (=> b!1419317 m!1309849))

(assert (=> b!1419317 m!1309847))

(declare-fun m!1309851 () Bool)

(assert (=> b!1419317 m!1309851))

(assert (=> b!1419316 m!1309847))

(assert (=> b!1419316 m!1309847))

(declare-fun m!1309853 () Bool)

(assert (=> b!1419316 m!1309853))

(declare-fun m!1309855 () Bool)

(assert (=> b!1419315 m!1309855))

(declare-fun m!1309857 () Bool)

(assert (=> b!1419320 m!1309857))

(assert (=> b!1419320 m!1309857))

(declare-fun m!1309859 () Bool)

(assert (=> b!1419320 m!1309859))

(check-sat (not b!1419317) (not b!1419321) (not b!1419320) (not b!1419318) (not b!1419316) (not b!1419315) (not start!122516))
(check-sat)
(get-model)

(declare-fun d!152985 () Bool)

(declare-fun lt!625764 () (_ BitVec 32))

(declare-fun lt!625763 () (_ BitVec 32))

(assert (=> d!152985 (= lt!625764 (bvmul (bvxor lt!625763 (bvlshr lt!625763 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152985 (= lt!625763 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46779 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46779 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152985 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954866 (let ((h!34586 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46779 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46779 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128318 (bvmul (bvxor h!34586 (bvlshr h!34586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128318 (bvlshr x!128318 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954866 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954866 #b00000000000000000000000000000000))))))

(assert (=> d!152985 (= (toIndex!0 (select (store (arr!46779 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (bvand (bvxor lt!625764 (bvlshr lt!625764 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419318 d!152985))

(declare-fun d!152987 () Bool)

(assert (=> d!152987 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122516 d!152987))

(declare-fun d!152991 () Bool)

(assert (=> d!152991 (= (array_inv!35807 a!2831) (bvsge (size!47329 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122516 d!152991))

(declare-fun b!1419364 () Bool)

(declare-fun e!803055 () Bool)

(declare-fun call!67308 () Bool)

(assert (=> b!1419364 (= e!803055 call!67308)))

(declare-fun b!1419365 () Bool)

(declare-fun e!803056 () Bool)

(assert (=> b!1419365 (= e!803056 call!67308)))

(declare-fun d!152993 () Bool)

(declare-fun res!954878 () Bool)

(declare-fun e!803054 () Bool)

(assert (=> d!152993 (=> res!954878 e!803054)))

(assert (=> d!152993 (= res!954878 (bvsge #b00000000000000000000000000000000 (size!47329 a!2831)))))

(assert (=> d!152993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803054)))

(declare-fun bm!67305 () Bool)

(assert (=> bm!67305 (= call!67308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1419366 () Bool)

(assert (=> b!1419366 (= e!803054 e!803056)))

(declare-fun c!131729 () Bool)

(assert (=> b!1419366 (= c!131729 (validKeyInArray!0 (select (arr!46779 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419367 () Bool)

(assert (=> b!1419367 (= e!803056 e!803055)))

(declare-fun lt!625778 () (_ BitVec 64))

(assert (=> b!1419367 (= lt!625778 (select (arr!46779 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48076 0))(
  ( (Unit!48077) )
))
(declare-fun lt!625779 () Unit!48076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96920 (_ BitVec 64) (_ BitVec 32)) Unit!48076)

(assert (=> b!1419367 (= lt!625779 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625778 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419367 (arrayContainsKey!0 a!2831 lt!625778 #b00000000000000000000000000000000)))

(declare-fun lt!625777 () Unit!48076)

(assert (=> b!1419367 (= lt!625777 lt!625779)))

(declare-fun res!954879 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96920 (_ BitVec 32)) SeekEntryResult!11064)

(assert (=> b!1419367 (= res!954879 (= (seekEntryOrOpen!0 (select (arr!46779 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11064 #b00000000000000000000000000000000)))))

(assert (=> b!1419367 (=> (not res!954879) (not e!803055))))

(assert (= (and d!152993 (not res!954878)) b!1419366))

(assert (= (and b!1419366 c!131729) b!1419367))

(assert (= (and b!1419366 (not c!131729)) b!1419365))

(assert (= (and b!1419367 res!954879) b!1419364))

(assert (= (or b!1419364 b!1419365) bm!67305))

(declare-fun m!1309887 () Bool)

(assert (=> bm!67305 m!1309887))

(declare-fun m!1309889 () Bool)

(assert (=> b!1419366 m!1309889))

(assert (=> b!1419366 m!1309889))

(declare-fun m!1309891 () Bool)

(assert (=> b!1419366 m!1309891))

(assert (=> b!1419367 m!1309889))

(declare-fun m!1309893 () Bool)

(assert (=> b!1419367 m!1309893))

(declare-fun m!1309895 () Bool)

(assert (=> b!1419367 m!1309895))

(assert (=> b!1419367 m!1309889))

(declare-fun m!1309897 () Bool)

(assert (=> b!1419367 m!1309897))

(assert (=> b!1419321 d!152993))

(declare-fun b!1419383 () Bool)

(declare-fun e!803072 () Bool)

(declare-fun call!67312 () Bool)

(assert (=> b!1419383 (= e!803072 call!67312)))

(declare-fun d!153001 () Bool)

(declare-fun res!954890 () Bool)

(declare-fun e!803071 () Bool)

(assert (=> d!153001 (=> res!954890 e!803071)))

(assert (=> d!153001 (= res!954890 (bvsge #b00000000000000000000000000000000 (size!47329 a!2831)))))

(assert (=> d!153001 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33286) e!803071)))

(declare-fun b!1419384 () Bool)

(assert (=> b!1419384 (= e!803072 call!67312)))

(declare-fun b!1419385 () Bool)

(declare-fun e!803069 () Bool)

(assert (=> b!1419385 (= e!803069 e!803072)))

(declare-fun c!131733 () Bool)

(assert (=> b!1419385 (= c!131733 (validKeyInArray!0 (select (arr!46779 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419386 () Bool)

(declare-fun e!803070 () Bool)

(declare-fun contains!9844 (List!33289 (_ BitVec 64)) Bool)

(assert (=> b!1419386 (= e!803070 (contains!9844 Nil!33286 (select (arr!46779 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67309 () Bool)

(assert (=> bm!67309 (= call!67312 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131733 (Cons!33285 (select (arr!46779 a!2831) #b00000000000000000000000000000000) Nil!33286) Nil!33286)))))

(declare-fun b!1419387 () Bool)

(assert (=> b!1419387 (= e!803071 e!803069)))

(declare-fun res!954889 () Bool)

(assert (=> b!1419387 (=> (not res!954889) (not e!803069))))

(assert (=> b!1419387 (= res!954889 (not e!803070))))

(declare-fun res!954891 () Bool)

(assert (=> b!1419387 (=> (not res!954891) (not e!803070))))

(assert (=> b!1419387 (= res!954891 (validKeyInArray!0 (select (arr!46779 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153001 (not res!954890)) b!1419387))

(assert (= (and b!1419387 res!954891) b!1419386))

(assert (= (and b!1419387 res!954889) b!1419385))

(assert (= (and b!1419385 c!131733) b!1419384))

(assert (= (and b!1419385 (not c!131733)) b!1419383))

(assert (= (or b!1419384 b!1419383) bm!67309))

(assert (=> b!1419385 m!1309889))

(assert (=> b!1419385 m!1309889))

(assert (=> b!1419385 m!1309891))

(assert (=> b!1419386 m!1309889))

(assert (=> b!1419386 m!1309889))

(declare-fun m!1309907 () Bool)

(assert (=> b!1419386 m!1309907))

(assert (=> bm!67309 m!1309889))

(declare-fun m!1309909 () Bool)

(assert (=> bm!67309 m!1309909))

(assert (=> b!1419387 m!1309889))

(assert (=> b!1419387 m!1309889))

(assert (=> b!1419387 m!1309891))

(assert (=> b!1419315 d!153001))

(declare-fun d!153009 () Bool)

(assert (=> d!153009 (= (validKeyInArray!0 (select (arr!46779 a!2831) i!982)) (and (not (= (select (arr!46779 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46779 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419320 d!153009))

(declare-fun b!1419448 () Bool)

(declare-fun lt!625799 () SeekEntryResult!11064)

(assert (=> b!1419448 (and (bvsge (index!46650 lt!625799) #b00000000000000000000000000000000) (bvslt (index!46650 lt!625799) (size!47329 a!2831)))))

(declare-fun res!954919 () Bool)

(assert (=> b!1419448 (= res!954919 (= (select (arr!46779 a!2831) (index!46650 lt!625799)) (select (arr!46779 a!2831) j!81)))))

(declare-fun e!803114 () Bool)

(assert (=> b!1419448 (=> res!954919 e!803114)))

(declare-fun e!803112 () Bool)

(assert (=> b!1419448 (= e!803112 e!803114)))

(declare-fun b!1419449 () Bool)

(assert (=> b!1419449 (and (bvsge (index!46650 lt!625799) #b00000000000000000000000000000000) (bvslt (index!46650 lt!625799) (size!47329 a!2831)))))

(declare-fun res!954917 () Bool)

(assert (=> b!1419449 (= res!954917 (= (select (arr!46779 a!2831) (index!46650 lt!625799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1419449 (=> res!954917 e!803114)))

(declare-fun b!1419450 () Bool)

(declare-fun e!803110 () SeekEntryResult!11064)

(declare-fun e!803113 () SeekEntryResult!11064)

(assert (=> b!1419450 (= e!803110 e!803113)))

(declare-fun c!131752 () Bool)

(declare-fun lt!625798 () (_ BitVec 64))

(assert (=> b!1419450 (= c!131752 (or (= lt!625798 (select (arr!46779 a!2831) j!81)) (= (bvadd lt!625798 lt!625798) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1419451 () Bool)

(declare-fun e!803111 () Bool)

(assert (=> b!1419451 (= e!803111 e!803112)))

(declare-fun res!954918 () Bool)

(get-info :version)

(assert (=> b!1419451 (= res!954918 (and ((_ is Intermediate!11064) lt!625799) (not (undefined!11876 lt!625799)) (bvslt (x!128316 lt!625799) #b01111111111111111111111111111110) (bvsge (x!128316 lt!625799) #b00000000000000000000000000000000) (bvsge (x!128316 lt!625799) #b00000000000000000000000000000000)))))

(assert (=> b!1419451 (=> (not res!954918) (not e!803112))))

(declare-fun b!1419453 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419453 (= e!803113 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46779 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1419454 () Bool)

(assert (=> b!1419454 (= e!803110 (Intermediate!11064 true (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419455 () Bool)

(assert (=> b!1419455 (= e!803113 (Intermediate!11064 false (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419456 () Bool)

(assert (=> b!1419456 (= e!803111 (bvsge (x!128316 lt!625799) #b01111111111111111111111111111110))))

(declare-fun b!1419452 () Bool)

(assert (=> b!1419452 (and (bvsge (index!46650 lt!625799) #b00000000000000000000000000000000) (bvslt (index!46650 lt!625799) (size!47329 a!2831)))))

(assert (=> b!1419452 (= e!803114 (= (select (arr!46779 a!2831) (index!46650 lt!625799)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153011 () Bool)

(assert (=> d!153011 e!803111))

(declare-fun c!131754 () Bool)

(assert (=> d!153011 (= c!131754 (and ((_ is Intermediate!11064) lt!625799) (undefined!11876 lt!625799)))))

(assert (=> d!153011 (= lt!625799 e!803110)))

(declare-fun c!131753 () Bool)

(assert (=> d!153011 (= c!131753 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153011 (= lt!625798 (select (arr!46779 a!2831) (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608)))))

(assert (=> d!153011 (validMask!0 mask!2608)))

(assert (=> d!153011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608) (select (arr!46779 a!2831) j!81) a!2831 mask!2608) lt!625799)))

(assert (= (and d!153011 c!131753) b!1419454))

(assert (= (and d!153011 (not c!131753)) b!1419450))

(assert (= (and b!1419450 c!131752) b!1419455))

(assert (= (and b!1419450 (not c!131752)) b!1419453))

(assert (= (and d!153011 c!131754) b!1419456))

(assert (= (and d!153011 (not c!131754)) b!1419451))

(assert (= (and b!1419451 res!954918) b!1419448))

(assert (= (and b!1419448 (not res!954919)) b!1419449))

(assert (= (and b!1419449 (not res!954917)) b!1419452))

(declare-fun m!1309927 () Bool)

(assert (=> b!1419452 m!1309927))

(assert (=> b!1419448 m!1309927))

(assert (=> b!1419449 m!1309927))

(assert (=> d!153011 m!1309849))

(declare-fun m!1309929 () Bool)

(assert (=> d!153011 m!1309929))

(assert (=> d!153011 m!1309835))

(assert (=> b!1419453 m!1309849))

(declare-fun m!1309931 () Bool)

(assert (=> b!1419453 m!1309931))

(assert (=> b!1419453 m!1309931))

(assert (=> b!1419453 m!1309847))

(declare-fun m!1309933 () Bool)

(assert (=> b!1419453 m!1309933))

(assert (=> b!1419317 d!153011))

(declare-fun d!153021 () Bool)

(declare-fun lt!625801 () (_ BitVec 32))

(declare-fun lt!625800 () (_ BitVec 32))

(assert (=> d!153021 (= lt!625801 (bvmul (bvxor lt!625800 (bvlshr lt!625800 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153021 (= lt!625800 ((_ extract 31 0) (bvand (bvxor (select (arr!46779 a!2831) j!81) (bvlshr (select (arr!46779 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153021 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954866 (let ((h!34586 ((_ extract 31 0) (bvand (bvxor (select (arr!46779 a!2831) j!81) (bvlshr (select (arr!46779 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128318 (bvmul (bvxor h!34586 (bvlshr h!34586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128318 (bvlshr x!128318 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954866 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954866 #b00000000000000000000000000000000))))))

(assert (=> d!153021 (= (toIndex!0 (select (arr!46779 a!2831) j!81) mask!2608) (bvand (bvxor lt!625801 (bvlshr lt!625801 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419317 d!153021))

(declare-fun d!153023 () Bool)

(assert (=> d!153023 (= (validKeyInArray!0 (select (arr!46779 a!2831) j!81)) (and (not (= (select (arr!46779 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46779 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419316 d!153023))

(check-sat (not d!153011) (not b!1419453) (not b!1419387) (not b!1419366) (not b!1419367) (not b!1419385) (not b!1419386) (not bm!67309) (not bm!67305))
(check-sat)
