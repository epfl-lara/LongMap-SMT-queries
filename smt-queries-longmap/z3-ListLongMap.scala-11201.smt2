; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131220 () Bool)

(assert start!131220)

(declare-fun b!1536718 () Bool)

(declare-fun res!1052323 () Bool)

(declare-fun e!855913 () Bool)

(assert (=> b!1536718 (=> (not res!1052323) (not e!855913))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102055 0))(
  ( (array!102056 (arr!49237 (Array (_ BitVec 32) (_ BitVec 64))) (size!49788 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102055)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536718 (= res!1052323 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49788 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49788 a!2792)) (= (select (arr!49237 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536719 () Bool)

(declare-fun res!1052325 () Bool)

(assert (=> b!1536719 (=> (not res!1052325) (not e!855913))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536719 (= res!1052325 (validKeyInArray!0 (select (arr!49237 a!2792) i!951)))))

(declare-fun b!1536720 () Bool)

(declare-fun res!1052321 () Bool)

(assert (=> b!1536720 (=> (not res!1052321) (not e!855913))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13264 0))(
  ( (MissingZero!13264 (index!55451 (_ BitVec 32))) (Found!13264 (index!55452 (_ BitVec 32))) (Intermediate!13264 (undefined!14076 Bool) (index!55453 (_ BitVec 32)) (x!137417 (_ BitVec 32))) (Undefined!13264) (MissingVacant!13264 (index!55454 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102055 (_ BitVec 32)) SeekEntryResult!13264)

(assert (=> b!1536720 (= res!1052321 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480) (Found!13264 j!64)))))

(declare-fun b!1536721 () Bool)

(assert (=> b!1536721 (= e!855913 (and (not (= (select (arr!49237 a!2792) index!463) (select (arr!49237 a!2792) j!64))) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000))))))

(declare-fun b!1536722 () Bool)

(declare-fun res!1052324 () Bool)

(assert (=> b!1536722 (=> (not res!1052324) (not e!855913))))

(assert (=> b!1536722 (= res!1052324 (and (= (size!49788 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49788 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49788 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536724 () Bool)

(declare-fun res!1052320 () Bool)

(assert (=> b!1536724 (=> (not res!1052320) (not e!855913))))

(declare-datatypes ((List!35698 0))(
  ( (Nil!35695) (Cons!35694 (h!37157 (_ BitVec 64)) (t!50384 List!35698)) )
))
(declare-fun arrayNoDuplicates!0 (array!102055 (_ BitVec 32) List!35698) Bool)

(assert (=> b!1536724 (= res!1052320 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35695))))

(declare-fun b!1536725 () Bool)

(declare-fun res!1052319 () Bool)

(assert (=> b!1536725 (=> (not res!1052319) (not e!855913))))

(assert (=> b!1536725 (= res!1052319 (validKeyInArray!0 (select (arr!49237 a!2792) j!64)))))

(declare-fun res!1052318 () Bool)

(assert (=> start!131220 (=> (not res!1052318) (not e!855913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131220 (= res!1052318 (validMask!0 mask!2480))))

(assert (=> start!131220 e!855913))

(assert (=> start!131220 true))

(declare-fun array_inv!38518 (array!102055) Bool)

(assert (=> start!131220 (array_inv!38518 a!2792)))

(declare-fun b!1536723 () Bool)

(declare-fun res!1052322 () Bool)

(assert (=> b!1536723 (=> (not res!1052322) (not e!855913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102055 (_ BitVec 32)) Bool)

(assert (=> b!1536723 (= res!1052322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131220 res!1052318) b!1536722))

(assert (= (and b!1536722 res!1052324) b!1536719))

(assert (= (and b!1536719 res!1052325) b!1536725))

(assert (= (and b!1536725 res!1052319) b!1536723))

(assert (= (and b!1536723 res!1052322) b!1536724))

(assert (= (and b!1536724 res!1052320) b!1536718))

(assert (= (and b!1536718 res!1052323) b!1536720))

(assert (= (and b!1536720 res!1052321) b!1536721))

(declare-fun m!1419235 () Bool)

(assert (=> b!1536724 m!1419235))

(declare-fun m!1419237 () Bool)

(assert (=> b!1536718 m!1419237))

(declare-fun m!1419239 () Bool)

(assert (=> b!1536721 m!1419239))

(declare-fun m!1419241 () Bool)

(assert (=> b!1536721 m!1419241))

(assert (=> b!1536725 m!1419241))

(assert (=> b!1536725 m!1419241))

(declare-fun m!1419243 () Bool)

(assert (=> b!1536725 m!1419243))

(declare-fun m!1419245 () Bool)

(assert (=> b!1536719 m!1419245))

(assert (=> b!1536719 m!1419245))

(declare-fun m!1419247 () Bool)

(assert (=> b!1536719 m!1419247))

(declare-fun m!1419249 () Bool)

(assert (=> b!1536723 m!1419249))

(assert (=> b!1536720 m!1419241))

(assert (=> b!1536720 m!1419241))

(declare-fun m!1419251 () Bool)

(assert (=> b!1536720 m!1419251))

(declare-fun m!1419253 () Bool)

(assert (=> start!131220 m!1419253))

(declare-fun m!1419255 () Bool)

(assert (=> start!131220 m!1419255))

(check-sat (not b!1536725) (not b!1536724) (not b!1536723) (not b!1536719) (not start!131220) (not b!1536720))
(check-sat)
(get-model)

(declare-fun b!1536786 () Bool)

(declare-fun e!855933 () SeekEntryResult!13264)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536786 (= e!855933 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536787 () Bool)

(assert (=> b!1536787 (= e!855933 (MissingVacant!13264 vacantIndex!5))))

(declare-fun b!1536788 () Bool)

(declare-fun e!855934 () SeekEntryResult!13264)

(assert (=> b!1536788 (= e!855934 Undefined!13264)))

(declare-fun b!1536790 () Bool)

(declare-fun e!855932 () SeekEntryResult!13264)

(assert (=> b!1536790 (= e!855934 e!855932)))

(declare-fun c!141777 () Bool)

(declare-fun lt!664736 () (_ BitVec 64))

(assert (=> b!1536790 (= c!141777 (= lt!664736 (select (arr!49237 a!2792) j!64)))))

(declare-fun b!1536791 () Bool)

(assert (=> b!1536791 (= e!855932 (Found!13264 index!463))))

(declare-fun lt!664737 () SeekEntryResult!13264)

(declare-fun d!160883 () Bool)

(get-info :version)

(assert (=> d!160883 (and (or ((_ is Undefined!13264) lt!664737) (not ((_ is Found!13264) lt!664737)) (and (bvsge (index!55452 lt!664737) #b00000000000000000000000000000000) (bvslt (index!55452 lt!664737) (size!49788 a!2792)))) (or ((_ is Undefined!13264) lt!664737) ((_ is Found!13264) lt!664737) (not ((_ is MissingVacant!13264) lt!664737)) (not (= (index!55454 lt!664737) vacantIndex!5)) (and (bvsge (index!55454 lt!664737) #b00000000000000000000000000000000) (bvslt (index!55454 lt!664737) (size!49788 a!2792)))) (or ((_ is Undefined!13264) lt!664737) (ite ((_ is Found!13264) lt!664737) (= (select (arr!49237 a!2792) (index!55452 lt!664737)) (select (arr!49237 a!2792) j!64)) (and ((_ is MissingVacant!13264) lt!664737) (= (index!55454 lt!664737) vacantIndex!5) (= (select (arr!49237 a!2792) (index!55454 lt!664737)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160883 (= lt!664737 e!855934)))

(declare-fun c!141778 () Bool)

(assert (=> d!160883 (= c!141778 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160883 (= lt!664736 (select (arr!49237 a!2792) index!463))))

(assert (=> d!160883 (validMask!0 mask!2480)))

(assert (=> d!160883 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480) lt!664737)))

(declare-fun b!1536789 () Bool)

(declare-fun c!141776 () Bool)

(assert (=> b!1536789 (= c!141776 (= lt!664736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1536789 (= e!855932 e!855933)))

(assert (= (and d!160883 c!141778) b!1536788))

(assert (= (and d!160883 (not c!141778)) b!1536790))

(assert (= (and b!1536790 c!141777) b!1536791))

(assert (= (and b!1536790 (not c!141777)) b!1536789))

(assert (= (and b!1536789 c!141776) b!1536787))

(assert (= (and b!1536789 (not c!141776)) b!1536786))

(declare-fun m!1419301 () Bool)

(assert (=> b!1536786 m!1419301))

(assert (=> b!1536786 m!1419301))

(assert (=> b!1536786 m!1419241))

(declare-fun m!1419303 () Bool)

(assert (=> b!1536786 m!1419303))

(declare-fun m!1419305 () Bool)

(assert (=> d!160883 m!1419305))

(declare-fun m!1419307 () Bool)

(assert (=> d!160883 m!1419307))

(assert (=> d!160883 m!1419239))

(assert (=> d!160883 m!1419253))

(assert (=> b!1536720 d!160883))

(declare-fun bm!68714 () Bool)

(declare-fun call!68717 () Bool)

(assert (=> bm!68714 (= call!68717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1536820 () Bool)

(declare-fun e!855959 () Bool)

(assert (=> b!1536820 (= e!855959 call!68717)))

(declare-fun b!1536821 () Bool)

(declare-fun e!855957 () Bool)

(assert (=> b!1536821 (= e!855959 e!855957)))

(declare-fun lt!664744 () (_ BitVec 64))

(assert (=> b!1536821 (= lt!664744 (select (arr!49237 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51235 0))(
  ( (Unit!51236) )
))
(declare-fun lt!664746 () Unit!51235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102055 (_ BitVec 64) (_ BitVec 32)) Unit!51235)

(assert (=> b!1536821 (= lt!664746 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664744 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1536821 (arrayContainsKey!0 a!2792 lt!664744 #b00000000000000000000000000000000)))

(declare-fun lt!664745 () Unit!51235)

(assert (=> b!1536821 (= lt!664745 lt!664746)))

(declare-fun res!1052391 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102055 (_ BitVec 32)) SeekEntryResult!13264)

(assert (=> b!1536821 (= res!1052391 (= (seekEntryOrOpen!0 (select (arr!49237 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13264 #b00000000000000000000000000000000)))))

(assert (=> b!1536821 (=> (not res!1052391) (not e!855957))))

(declare-fun b!1536822 () Bool)

(assert (=> b!1536822 (= e!855957 call!68717)))

(declare-fun b!1536823 () Bool)

(declare-fun e!855958 () Bool)

(assert (=> b!1536823 (= e!855958 e!855959)))

(declare-fun c!141785 () Bool)

(assert (=> b!1536823 (= c!141785 (validKeyInArray!0 (select (arr!49237 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160885 () Bool)

(declare-fun res!1052390 () Bool)

(assert (=> d!160885 (=> res!1052390 e!855958)))

(assert (=> d!160885 (= res!1052390 (bvsge #b00000000000000000000000000000000 (size!49788 a!2792)))))

(assert (=> d!160885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!855958)))

(assert (= (and d!160885 (not res!1052390)) b!1536823))

(assert (= (and b!1536823 c!141785) b!1536821))

(assert (= (and b!1536823 (not c!141785)) b!1536820))

(assert (= (and b!1536821 res!1052391) b!1536822))

(assert (= (or b!1536822 b!1536820) bm!68714))

(declare-fun m!1419309 () Bool)

(assert (=> bm!68714 m!1419309))

(declare-fun m!1419311 () Bool)

(assert (=> b!1536821 m!1419311))

(declare-fun m!1419313 () Bool)

(assert (=> b!1536821 m!1419313))

(declare-fun m!1419315 () Bool)

(assert (=> b!1536821 m!1419315))

(assert (=> b!1536821 m!1419311))

(declare-fun m!1419317 () Bool)

(assert (=> b!1536821 m!1419317))

(assert (=> b!1536823 m!1419311))

(assert (=> b!1536823 m!1419311))

(declare-fun m!1419319 () Bool)

(assert (=> b!1536823 m!1419319))

(assert (=> b!1536723 d!160885))

(declare-fun d!160897 () Bool)

(assert (=> d!160897 (= (validKeyInArray!0 (select (arr!49237 a!2792) j!64)) (and (not (= (select (arr!49237 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49237 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1536725 d!160897))

(declare-fun d!160901 () Bool)

(assert (=> d!160901 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131220 d!160901))

(declare-fun d!160907 () Bool)

(assert (=> d!160907 (= (array_inv!38518 a!2792) (bvsge (size!49788 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131220 d!160907))

(declare-fun d!160909 () Bool)

(assert (=> d!160909 (= (validKeyInArray!0 (select (arr!49237 a!2792) i!951)) (and (not (= (select (arr!49237 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49237 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1536719 d!160909))

(declare-fun b!1536856 () Bool)

(declare-fun e!855987 () Bool)

(declare-fun contains!10058 (List!35698 (_ BitVec 64)) Bool)

(assert (=> b!1536856 (= e!855987 (contains!10058 Nil!35695 (select (arr!49237 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1536857 () Bool)

(declare-fun e!855988 () Bool)

(declare-fun call!68727 () Bool)

(assert (=> b!1536857 (= e!855988 call!68727)))

(declare-fun bm!68724 () Bool)

(declare-fun c!141793 () Bool)

(assert (=> bm!68724 (= call!68727 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141793 (Cons!35694 (select (arr!49237 a!2792) #b00000000000000000000000000000000) Nil!35695) Nil!35695)))))

(declare-fun b!1536858 () Bool)

(declare-fun e!855986 () Bool)

(assert (=> b!1536858 (= e!855986 e!855988)))

(assert (=> b!1536858 (= c!141793 (validKeyInArray!0 (select (arr!49237 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160911 () Bool)

(declare-fun res!1052410 () Bool)

(declare-fun e!855985 () Bool)

(assert (=> d!160911 (=> res!1052410 e!855985)))

(assert (=> d!160911 (= res!1052410 (bvsge #b00000000000000000000000000000000 (size!49788 a!2792)))))

(assert (=> d!160911 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35695) e!855985)))

(declare-fun b!1536859 () Bool)

(assert (=> b!1536859 (= e!855985 e!855986)))

(declare-fun res!1052411 () Bool)

(assert (=> b!1536859 (=> (not res!1052411) (not e!855986))))

(assert (=> b!1536859 (= res!1052411 (not e!855987))))

(declare-fun res!1052412 () Bool)

(assert (=> b!1536859 (=> (not res!1052412) (not e!855987))))

(assert (=> b!1536859 (= res!1052412 (validKeyInArray!0 (select (arr!49237 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1536860 () Bool)

(assert (=> b!1536860 (= e!855988 call!68727)))

(assert (= (and d!160911 (not res!1052410)) b!1536859))

(assert (= (and b!1536859 res!1052412) b!1536856))

(assert (= (and b!1536859 res!1052411) b!1536858))

(assert (= (and b!1536858 c!141793) b!1536860))

(assert (= (and b!1536858 (not c!141793)) b!1536857))

(assert (= (or b!1536860 b!1536857) bm!68724))

(assert (=> b!1536856 m!1419311))

(assert (=> b!1536856 m!1419311))

(declare-fun m!1419345 () Bool)

(assert (=> b!1536856 m!1419345))

(assert (=> bm!68724 m!1419311))

(declare-fun m!1419347 () Bool)

(assert (=> bm!68724 m!1419347))

(assert (=> b!1536858 m!1419311))

(assert (=> b!1536858 m!1419311))

(assert (=> b!1536858 m!1419319))

(assert (=> b!1536859 m!1419311))

(assert (=> b!1536859 m!1419311))

(assert (=> b!1536859 m!1419319))

(assert (=> b!1536724 d!160911))

(check-sat (not b!1536821) (not bm!68724) (not bm!68714) (not d!160883) (not b!1536786) (not b!1536823) (not b!1536856) (not b!1536858) (not b!1536859))
(check-sat)
