; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25506 () Bool)

(assert start!25506)

(declare-fun b!265211 () Bool)

(declare-fun res!129653 () Bool)

(declare-fun e!171747 () Bool)

(assert (=> b!265211 (=> (not res!129653) (not e!171747))))

(declare-datatypes ((array!12769 0))(
  ( (array!12770 (arr!6042 (Array (_ BitVec 32) (_ BitVec 64))) (size!6394 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12769)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265211 (= res!129653 (and (= (size!6394 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6394 a!3436))))))

(declare-fun b!265212 () Bool)

(declare-fun res!129656 () Bool)

(declare-fun e!171748 () Bool)

(assert (=> b!265212 (=> (not res!129656) (not e!171748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12769 (_ BitVec 32)) Bool)

(assert (=> b!265212 (= res!129656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265213 () Bool)

(declare-fun res!129657 () Bool)

(assert (=> b!265213 (=> (not res!129657) (not e!171747))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265213 (= res!129657 (validKeyInArray!0 k0!2698))))

(declare-fun b!265214 () Bool)

(declare-datatypes ((List!3856 0))(
  ( (Nil!3853) (Cons!3852 (h!4519 (_ BitVec 64)) (t!8938 List!3856)) )
))
(declare-fun noDuplicate!105 (List!3856) Bool)

(assert (=> b!265214 (= e!171748 (not (noDuplicate!105 Nil!3853)))))

(declare-fun res!129652 () Bool)

(assert (=> start!25506 (=> (not res!129652) (not e!171747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25506 (= res!129652 (validMask!0 mask!4002))))

(assert (=> start!25506 e!171747))

(assert (=> start!25506 true))

(declare-fun array_inv!4005 (array!12769) Bool)

(assert (=> start!25506 (array_inv!4005 a!3436)))

(declare-fun b!265215 () Bool)

(assert (=> b!265215 (= e!171747 e!171748)))

(declare-fun res!129655 () Bool)

(assert (=> b!265215 (=> (not res!129655) (not e!171748))))

(declare-datatypes ((SeekEntryResult!1233 0))(
  ( (MissingZero!1233 (index!7102 (_ BitVec 32))) (Found!1233 (index!7103 (_ BitVec 32))) (Intermediate!1233 (undefined!2045 Bool) (index!7104 (_ BitVec 32)) (x!25422 (_ BitVec 32))) (Undefined!1233) (MissingVacant!1233 (index!7105 (_ BitVec 32))) )
))
(declare-fun lt!134026 () SeekEntryResult!1233)

(assert (=> b!265215 (= res!129655 (or (= lt!134026 (MissingZero!1233 i!1355)) (= lt!134026 (MissingVacant!1233 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12769 (_ BitVec 32)) SeekEntryResult!1233)

(assert (=> b!265215 (= lt!134026 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265216 () Bool)

(declare-fun res!129654 () Bool)

(assert (=> b!265216 (=> (not res!129654) (not e!171747))))

(declare-fun arrayContainsKey!0 (array!12769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265216 (= res!129654 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265217 () Bool)

(declare-fun res!129651 () Bool)

(assert (=> b!265217 (=> (not res!129651) (not e!171748))))

(assert (=> b!265217 (= res!129651 (and (bvsle #b00000000000000000000000000000000 (size!6394 a!3436)) (bvslt (size!6394 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25506 res!129652) b!265211))

(assert (= (and b!265211 res!129653) b!265213))

(assert (= (and b!265213 res!129657) b!265216))

(assert (= (and b!265216 res!129654) b!265215))

(assert (= (and b!265215 res!129655) b!265212))

(assert (= (and b!265212 res!129656) b!265217))

(assert (= (and b!265217 res!129651) b!265214))

(declare-fun m!282071 () Bool)

(assert (=> b!265216 m!282071))

(declare-fun m!282073 () Bool)

(assert (=> b!265212 m!282073))

(declare-fun m!282075 () Bool)

(assert (=> b!265213 m!282075))

(declare-fun m!282077 () Bool)

(assert (=> b!265215 m!282077))

(declare-fun m!282079 () Bool)

(assert (=> b!265214 m!282079))

(declare-fun m!282081 () Bool)

(assert (=> start!25506 m!282081))

(declare-fun m!282083 () Bool)

(assert (=> start!25506 m!282083))

(check-sat (not b!265215) (not start!25506) (not b!265214) (not b!265216) (not b!265212) (not b!265213))
(check-sat)
(get-model)

(declare-fun d!64143 () Bool)

(declare-fun res!129683 () Bool)

(declare-fun e!171763 () Bool)

(assert (=> d!64143 (=> res!129683 e!171763)))

(get-info :version)

(assert (=> d!64143 (= res!129683 ((_ is Nil!3853) Nil!3853))))

(assert (=> d!64143 (= (noDuplicate!105 Nil!3853) e!171763)))

(declare-fun b!265243 () Bool)

(declare-fun e!171764 () Bool)

(assert (=> b!265243 (= e!171763 e!171764)))

(declare-fun res!129684 () Bool)

(assert (=> b!265243 (=> (not res!129684) (not e!171764))))

(declare-fun contains!1917 (List!3856 (_ BitVec 64)) Bool)

(assert (=> b!265243 (= res!129684 (not (contains!1917 (t!8938 Nil!3853) (h!4519 Nil!3853))))))

(declare-fun b!265244 () Bool)

(assert (=> b!265244 (= e!171764 (noDuplicate!105 (t!8938 Nil!3853)))))

(assert (= (and d!64143 (not res!129683)) b!265243))

(assert (= (and b!265243 res!129684) b!265244))

(declare-fun m!282099 () Bool)

(assert (=> b!265243 m!282099))

(declare-fun m!282101 () Bool)

(assert (=> b!265244 m!282101))

(assert (=> b!265214 d!64143))

(declare-fun b!265281 () Bool)

(declare-fun e!171792 () SeekEntryResult!1233)

(declare-fun e!171793 () SeekEntryResult!1233)

(assert (=> b!265281 (= e!171792 e!171793)))

(declare-fun lt!134046 () (_ BitVec 64))

(declare-fun lt!134045 () SeekEntryResult!1233)

(assert (=> b!265281 (= lt!134046 (select (arr!6042 a!3436) (index!7104 lt!134045)))))

(declare-fun c!45342 () Bool)

(assert (=> b!265281 (= c!45342 (= lt!134046 k0!2698))))

(declare-fun b!265282 () Bool)

(declare-fun e!171794 () SeekEntryResult!1233)

(assert (=> b!265282 (= e!171794 (MissingZero!1233 (index!7104 lt!134045)))))

(declare-fun d!64145 () Bool)

(declare-fun lt!134047 () SeekEntryResult!1233)

(assert (=> d!64145 (and (or ((_ is Undefined!1233) lt!134047) (not ((_ is Found!1233) lt!134047)) (and (bvsge (index!7103 lt!134047) #b00000000000000000000000000000000) (bvslt (index!7103 lt!134047) (size!6394 a!3436)))) (or ((_ is Undefined!1233) lt!134047) ((_ is Found!1233) lt!134047) (not ((_ is MissingZero!1233) lt!134047)) (and (bvsge (index!7102 lt!134047) #b00000000000000000000000000000000) (bvslt (index!7102 lt!134047) (size!6394 a!3436)))) (or ((_ is Undefined!1233) lt!134047) ((_ is Found!1233) lt!134047) ((_ is MissingZero!1233) lt!134047) (not ((_ is MissingVacant!1233) lt!134047)) (and (bvsge (index!7105 lt!134047) #b00000000000000000000000000000000) (bvslt (index!7105 lt!134047) (size!6394 a!3436)))) (or ((_ is Undefined!1233) lt!134047) (ite ((_ is Found!1233) lt!134047) (= (select (arr!6042 a!3436) (index!7103 lt!134047)) k0!2698) (ite ((_ is MissingZero!1233) lt!134047) (= (select (arr!6042 a!3436) (index!7102 lt!134047)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1233) lt!134047) (= (select (arr!6042 a!3436) (index!7105 lt!134047)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64145 (= lt!134047 e!171792)))

(declare-fun c!45341 () Bool)

(assert (=> d!64145 (= c!45341 (and ((_ is Intermediate!1233) lt!134045) (undefined!2045 lt!134045)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12769 (_ BitVec 32)) SeekEntryResult!1233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64145 (= lt!134045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64145 (validMask!0 mask!4002)))

(assert (=> d!64145 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!134047)))

(declare-fun b!265283 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12769 (_ BitVec 32)) SeekEntryResult!1233)

(assert (=> b!265283 (= e!171794 (seekKeyOrZeroReturnVacant!0 (x!25422 lt!134045) (index!7104 lt!134045) (index!7104 lt!134045) k0!2698 a!3436 mask!4002))))

(declare-fun b!265284 () Bool)

(declare-fun c!45340 () Bool)

(assert (=> b!265284 (= c!45340 (= lt!134046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!265284 (= e!171793 e!171794)))

(declare-fun b!265285 () Bool)

(assert (=> b!265285 (= e!171793 (Found!1233 (index!7104 lt!134045)))))

(declare-fun b!265286 () Bool)

(assert (=> b!265286 (= e!171792 Undefined!1233)))

(assert (= (and d!64145 c!45341) b!265286))

(assert (= (and d!64145 (not c!45341)) b!265281))

(assert (= (and b!265281 c!45342) b!265285))

(assert (= (and b!265281 (not c!45342)) b!265284))

(assert (= (and b!265284 c!45340) b!265282))

(assert (= (and b!265284 (not c!45340)) b!265283))

(declare-fun m!282123 () Bool)

(assert (=> b!265281 m!282123))

(declare-fun m!282125 () Bool)

(assert (=> d!64145 m!282125))

(declare-fun m!282127 () Bool)

(assert (=> d!64145 m!282127))

(declare-fun m!282129 () Bool)

(assert (=> d!64145 m!282129))

(assert (=> d!64145 m!282081))

(assert (=> d!64145 m!282127))

(declare-fun m!282131 () Bool)

(assert (=> d!64145 m!282131))

(declare-fun m!282133 () Bool)

(assert (=> d!64145 m!282133))

(declare-fun m!282135 () Bool)

(assert (=> b!265283 m!282135))

(assert (=> b!265215 d!64145))

(declare-fun d!64163 () Bool)

(assert (=> d!64163 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265213 d!64163))

(declare-fun d!64165 () Bool)

(declare-fun res!129718 () Bool)

(declare-fun e!171822 () Bool)

(assert (=> d!64165 (=> res!129718 e!171822)))

(assert (=> d!64165 (= res!129718 (bvsge #b00000000000000000000000000000000 (size!6394 a!3436)))))

(assert (=> d!64165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171822)))

(declare-fun b!265327 () Bool)

(declare-fun e!171823 () Bool)

(assert (=> b!265327 (= e!171822 e!171823)))

(declare-fun c!45356 () Bool)

(assert (=> b!265327 (= c!45356 (validKeyInArray!0 (select (arr!6042 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265328 () Bool)

(declare-fun e!171824 () Bool)

(assert (=> b!265328 (= e!171823 e!171824)))

(declare-fun lt!134071 () (_ BitVec 64))

(assert (=> b!265328 (= lt!134071 (select (arr!6042 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8259 0))(
  ( (Unit!8260) )
))
(declare-fun lt!134069 () Unit!8259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12769 (_ BitVec 64) (_ BitVec 32)) Unit!8259)

(assert (=> b!265328 (= lt!134069 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134071 #b00000000000000000000000000000000))))

(assert (=> b!265328 (arrayContainsKey!0 a!3436 lt!134071 #b00000000000000000000000000000000)))

(declare-fun lt!134070 () Unit!8259)

(assert (=> b!265328 (= lt!134070 lt!134069)))

(declare-fun res!129717 () Bool)

(assert (=> b!265328 (= res!129717 (= (seekEntryOrOpen!0 (select (arr!6042 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1233 #b00000000000000000000000000000000)))))

(assert (=> b!265328 (=> (not res!129717) (not e!171824))))

(declare-fun b!265329 () Bool)

(declare-fun call!25327 () Bool)

(assert (=> b!265329 (= e!171823 call!25327)))

(declare-fun bm!25324 () Bool)

(assert (=> bm!25324 (= call!25327 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265330 () Bool)

(assert (=> b!265330 (= e!171824 call!25327)))

(assert (= (and d!64165 (not res!129718)) b!265327))

(assert (= (and b!265327 c!45356) b!265328))

(assert (= (and b!265327 (not c!45356)) b!265329))

(assert (= (and b!265328 res!129717) b!265330))

(assert (= (or b!265330 b!265329) bm!25324))

