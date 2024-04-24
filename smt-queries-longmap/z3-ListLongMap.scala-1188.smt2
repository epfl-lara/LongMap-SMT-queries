; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25508 () Bool)

(assert start!25508)

(declare-fun b!265237 () Bool)

(declare-fun res!129652 () Bool)

(declare-fun e!171762 () Bool)

(assert (=> b!265237 (=> (not res!129652) (not e!171762))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265237 (= res!129652 (validKeyInArray!0 k0!2698))))

(declare-fun b!265238 () Bool)

(declare-fun res!129653 () Bool)

(declare-fun e!171764 () Bool)

(assert (=> b!265238 (=> (not res!129653) (not e!171764))))

(declare-datatypes ((array!12766 0))(
  ( (array!12767 (arr!6040 (Array (_ BitVec 32) (_ BitVec 64))) (size!6392 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12766)

(assert (=> b!265238 (= res!129653 (and (bvsle #b00000000000000000000000000000000 (size!6392 a!3436)) (bvslt (size!6392 a!3436) #b01111111111111111111111111111111)))))

(declare-fun b!265239 () Bool)

(declare-fun res!129656 () Bool)

(assert (=> b!265239 (=> (not res!129656) (not e!171762))))

(declare-fun arrayContainsKey!0 (array!12766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265239 (= res!129656 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265240 () Bool)

(assert (=> b!265240 (= e!171762 e!171764)))

(declare-fun res!129651 () Bool)

(assert (=> b!265240 (=> (not res!129651) (not e!171764))))

(declare-datatypes ((SeekEntryResult!1196 0))(
  ( (MissingZero!1196 (index!6954 (_ BitVec 32))) (Found!1196 (index!6955 (_ BitVec 32))) (Intermediate!1196 (undefined!2008 Bool) (index!6956 (_ BitVec 32)) (x!25385 (_ BitVec 32))) (Undefined!1196) (MissingVacant!1196 (index!6957 (_ BitVec 32))) )
))
(declare-fun lt!134082 () SeekEntryResult!1196)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265240 (= res!129651 (or (= lt!134082 (MissingZero!1196 i!1355)) (= lt!134082 (MissingVacant!1196 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12766 (_ BitVec 32)) SeekEntryResult!1196)

(assert (=> b!265240 (= lt!134082 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265241 () Bool)

(declare-fun res!129654 () Bool)

(assert (=> b!265241 (=> (not res!129654) (not e!171762))))

(assert (=> b!265241 (= res!129654 (and (= (size!6392 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6392 a!3436))))))

(declare-fun b!265243 () Bool)

(declare-datatypes ((List!3767 0))(
  ( (Nil!3764) (Cons!3763 (h!4430 (_ BitVec 64)) (t!8841 List!3767)) )
))
(declare-fun noDuplicate!107 (List!3767) Bool)

(assert (=> b!265243 (= e!171764 (not (noDuplicate!107 Nil!3764)))))

(declare-fun b!265242 () Bool)

(declare-fun res!129655 () Bool)

(assert (=> b!265242 (=> (not res!129655) (not e!171764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12766 (_ BitVec 32)) Bool)

(assert (=> b!265242 (= res!129655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129657 () Bool)

(assert (=> start!25508 (=> (not res!129657) (not e!171762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25508 (= res!129657 (validMask!0 mask!4002))))

(assert (=> start!25508 e!171762))

(assert (=> start!25508 true))

(declare-fun array_inv!3990 (array!12766) Bool)

(assert (=> start!25508 (array_inv!3990 a!3436)))

(assert (= (and start!25508 res!129657) b!265241))

(assert (= (and b!265241 res!129654) b!265237))

(assert (= (and b!265237 res!129652) b!265239))

(assert (= (and b!265239 res!129656) b!265240))

(assert (= (and b!265240 res!129651) b!265242))

(assert (= (and b!265242 res!129655) b!265238))

(assert (= (and b!265238 res!129653) b!265243))

(declare-fun m!282263 () Bool)

(assert (=> start!25508 m!282263))

(declare-fun m!282265 () Bool)

(assert (=> start!25508 m!282265))

(declare-fun m!282267 () Bool)

(assert (=> b!265240 m!282267))

(declare-fun m!282269 () Bool)

(assert (=> b!265239 m!282269))

(declare-fun m!282271 () Bool)

(assert (=> b!265237 m!282271))

(declare-fun m!282273 () Bool)

(assert (=> b!265243 m!282273))

(declare-fun m!282275 () Bool)

(assert (=> b!265242 m!282275))

(check-sat (not b!265242) (not b!265240) (not b!265243) (not b!265239) (not b!265237) (not start!25508))
(check-sat)
(get-model)

(declare-fun d!64217 () Bool)

(assert (=> d!64217 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265237 d!64217))

(declare-fun d!64219 () Bool)

(assert (=> d!64219 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25508 d!64219))

(declare-fun d!64227 () Bool)

(assert (=> d!64227 (= (array_inv!3990 a!3436) (bvsge (size!6392 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25508 d!64227))

(declare-fun d!64229 () Bool)

(declare-fun res!129708 () Bool)

(declare-fun e!171794 () Bool)

(assert (=> d!64229 (=> res!129708 e!171794)))

(get-info :version)

(assert (=> d!64229 (= res!129708 ((_ is Nil!3764) Nil!3764))))

(assert (=> d!64229 (= (noDuplicate!107 Nil!3764) e!171794)))

(declare-fun b!265298 () Bool)

(declare-fun e!171796 () Bool)

(assert (=> b!265298 (= e!171794 e!171796)))

(declare-fun res!129710 () Bool)

(assert (=> b!265298 (=> (not res!129710) (not e!171796))))

(declare-fun contains!1890 (List!3767 (_ BitVec 64)) Bool)

(assert (=> b!265298 (= res!129710 (not (contains!1890 (t!8841 Nil!3764) (h!4430 Nil!3764))))))

(declare-fun b!265299 () Bool)

(assert (=> b!265299 (= e!171796 (noDuplicate!107 (t!8841 Nil!3764)))))

(assert (= (and d!64229 (not res!129708)) b!265298))

(assert (= (and b!265298 res!129710) b!265299))

(declare-fun m!282305 () Bool)

(assert (=> b!265298 m!282305))

(declare-fun m!282307 () Bool)

(assert (=> b!265299 m!282307))

(assert (=> b!265243 d!64229))

(declare-fun b!265331 () Bool)

(declare-fun e!171819 () Bool)

(declare-fun e!171821 () Bool)

(assert (=> b!265331 (= e!171819 e!171821)))

(declare-fun c!45352 () Bool)

(assert (=> b!265331 (= c!45352 (validKeyInArray!0 (select (arr!6040 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265332 () Bool)

(declare-fun call!25318 () Bool)

(assert (=> b!265332 (= e!171821 call!25318)))

(declare-fun b!265333 () Bool)

(declare-fun e!171820 () Bool)

(assert (=> b!265333 (= e!171820 call!25318)))

(declare-fun bm!25315 () Bool)

(assert (=> bm!25315 (= call!25318 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265330 () Bool)

(assert (=> b!265330 (= e!171821 e!171820)))

(declare-fun lt!134114 () (_ BitVec 64))

(assert (=> b!265330 (= lt!134114 (select (arr!6040 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8237 0))(
  ( (Unit!8238) )
))
(declare-fun lt!134113 () Unit!8237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12766 (_ BitVec 64) (_ BitVec 32)) Unit!8237)

(assert (=> b!265330 (= lt!134113 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134114 #b00000000000000000000000000000000))))

(assert (=> b!265330 (arrayContainsKey!0 a!3436 lt!134114 #b00000000000000000000000000000000)))

(declare-fun lt!134115 () Unit!8237)

(assert (=> b!265330 (= lt!134115 lt!134113)))

(declare-fun res!129729 () Bool)

(assert (=> b!265330 (= res!129729 (= (seekEntryOrOpen!0 (select (arr!6040 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1196 #b00000000000000000000000000000000)))))

(assert (=> b!265330 (=> (not res!129729) (not e!171820))))

(declare-fun d!64231 () Bool)

(declare-fun res!129728 () Bool)

(assert (=> d!64231 (=> res!129728 e!171819)))

(assert (=> d!64231 (= res!129728 (bvsge #b00000000000000000000000000000000 (size!6392 a!3436)))))

(assert (=> d!64231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171819)))

(assert (= (and d!64231 (not res!129728)) b!265331))

(assert (= (and b!265331 c!45352) b!265330))

(assert (= (and b!265331 (not c!45352)) b!265332))

(assert (= (and b!265330 res!129729) b!265333))

(assert (= (or b!265333 b!265332) bm!25315))

(declare-fun m!282335 () Bool)

(assert (=> b!265331 m!282335))

(assert (=> b!265331 m!282335))

(declare-fun m!282337 () Bool)

(assert (=> b!265331 m!282337))

(declare-fun m!282339 () Bool)

(assert (=> bm!25315 m!282339))

(assert (=> b!265330 m!282335))

(declare-fun m!282341 () Bool)

(assert (=> b!265330 m!282341))

(declare-fun m!282343 () Bool)

(assert (=> b!265330 m!282343))

(assert (=> b!265330 m!282335))

(declare-fun m!282345 () Bool)

(assert (=> b!265330 m!282345))

(assert (=> b!265242 d!64231))

(declare-fun b!265376 () Bool)

(declare-fun e!171851 () SeekEntryResult!1196)

(assert (=> b!265376 (= e!171851 Undefined!1196)))

(declare-fun b!265378 () Bool)

(declare-fun c!45369 () Bool)

(declare-fun lt!134131 () (_ BitVec 64))

(assert (=> b!265378 (= c!45369 (= lt!134131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171850 () SeekEntryResult!1196)

(declare-fun e!171849 () SeekEntryResult!1196)

(assert (=> b!265378 (= e!171850 e!171849)))

(declare-fun b!265379 () Bool)

(declare-fun lt!134133 () SeekEntryResult!1196)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12766 (_ BitVec 32)) SeekEntryResult!1196)

(assert (=> b!265379 (= e!171849 (seekKeyOrZeroReturnVacant!0 (x!25385 lt!134133) (index!6956 lt!134133) (index!6956 lt!134133) k0!2698 a!3436 mask!4002))))

(declare-fun b!265380 () Bool)

(assert (=> b!265380 (= e!171851 e!171850)))

(assert (=> b!265380 (= lt!134131 (select (arr!6040 a!3436) (index!6956 lt!134133)))))

(declare-fun c!45368 () Bool)

(assert (=> b!265380 (= c!45368 (= lt!134131 k0!2698))))

(declare-fun b!265381 () Bool)

(assert (=> b!265381 (= e!171850 (Found!1196 (index!6956 lt!134133)))))

(declare-fun d!64241 () Bool)

(declare-fun lt!134132 () SeekEntryResult!1196)

(assert (=> d!64241 (and (or ((_ is Undefined!1196) lt!134132) (not ((_ is Found!1196) lt!134132)) (and (bvsge (index!6955 lt!134132) #b00000000000000000000000000000000) (bvslt (index!6955 lt!134132) (size!6392 a!3436)))) (or ((_ is Undefined!1196) lt!134132) ((_ is Found!1196) lt!134132) (not ((_ is MissingZero!1196) lt!134132)) (and (bvsge (index!6954 lt!134132) #b00000000000000000000000000000000) (bvslt (index!6954 lt!134132) (size!6392 a!3436)))) (or ((_ is Undefined!1196) lt!134132) ((_ is Found!1196) lt!134132) ((_ is MissingZero!1196) lt!134132) (not ((_ is MissingVacant!1196) lt!134132)) (and (bvsge (index!6957 lt!134132) #b00000000000000000000000000000000) (bvslt (index!6957 lt!134132) (size!6392 a!3436)))) (or ((_ is Undefined!1196) lt!134132) (ite ((_ is Found!1196) lt!134132) (= (select (arr!6040 a!3436) (index!6955 lt!134132)) k0!2698) (ite ((_ is MissingZero!1196) lt!134132) (= (select (arr!6040 a!3436) (index!6954 lt!134132)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1196) lt!134132) (= (select (arr!6040 a!3436) (index!6957 lt!134132)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64241 (= lt!134132 e!171851)))

(declare-fun c!45370 () Bool)

(assert (=> d!64241 (= c!45370 (and ((_ is Intermediate!1196) lt!134133) (undefined!2008 lt!134133)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12766 (_ BitVec 32)) SeekEntryResult!1196)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64241 (= lt!134133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64241 (validMask!0 mask!4002)))

(assert (=> d!64241 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!134132)))

(declare-fun b!265377 () Bool)

(assert (=> b!265377 (= e!171849 (MissingZero!1196 (index!6956 lt!134133)))))

(assert (= (and d!64241 c!45370) b!265376))

(assert (= (and d!64241 (not c!45370)) b!265380))

(assert (= (and b!265380 c!45368) b!265381))

(assert (= (and b!265380 (not c!45368)) b!265378))

(assert (= (and b!265378 c!45369) b!265377))

(assert (= (and b!265378 (not c!45369)) b!265379))

(declare-fun m!282369 () Bool)

(assert (=> b!265379 m!282369))

(declare-fun m!282371 () Bool)

(assert (=> b!265380 m!282371))

(assert (=> d!64241 m!282263))

(declare-fun m!282373 () Bool)

(assert (=> d!64241 m!282373))

(declare-fun m!282375 () Bool)

(assert (=> d!64241 m!282375))

(declare-fun m!282377 () Bool)

(assert (=> d!64241 m!282377))

(declare-fun m!282379 () Bool)

(assert (=> d!64241 m!282379))

(assert (=> d!64241 m!282373))

(declare-fun m!282381 () Bool)

(assert (=> d!64241 m!282381))

(assert (=> b!265240 d!64241))

(declare-fun d!64253 () Bool)

(declare-fun res!129746 () Bool)

(declare-fun e!171856 () Bool)

(assert (=> d!64253 (=> res!129746 e!171856)))

(assert (=> d!64253 (= res!129746 (= (select (arr!6040 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!64253 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171856)))

(declare-fun b!265386 () Bool)

(declare-fun e!171857 () Bool)

(assert (=> b!265386 (= e!171856 e!171857)))

(declare-fun res!129747 () Bool)

(assert (=> b!265386 (=> (not res!129747) (not e!171857))))

(assert (=> b!265386 (= res!129747 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6392 a!3436)))))

(declare-fun b!265387 () Bool)

(assert (=> b!265387 (= e!171857 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64253 (not res!129746)) b!265386))

(assert (= (and b!265386 res!129747) b!265387))

(assert (=> d!64253 m!282335))

(declare-fun m!282383 () Bool)

(assert (=> b!265387 m!282383))

(assert (=> b!265239 d!64253))

(check-sat (not b!265331) (not b!265330) (not d!64241) (not bm!25315) (not b!265298) (not b!265387) (not b!265379) (not b!265299))
(check-sat)
