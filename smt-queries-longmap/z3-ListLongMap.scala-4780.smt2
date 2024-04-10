; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65742 () Bool)

(assert start!65742)

(declare-fun b!755012 () Bool)

(declare-fun res!510272 () Bool)

(declare-fun e!421052 () Bool)

(assert (=> b!755012 (=> (not res!510272) (not e!421052))))

(declare-fun e!421054 () Bool)

(assert (=> b!755012 (= res!510272 e!421054)))

(declare-fun c!82755 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755012 (= c!82755 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755013 () Bool)

(declare-fun e!421051 () Bool)

(declare-fun e!421057 () Bool)

(assert (=> b!755013 (= e!421051 e!421057)))

(declare-fun res!510275 () Bool)

(assert (=> b!755013 (=> (not res!510275) (not e!421057))))

(declare-datatypes ((SeekEntryResult!7671 0))(
  ( (MissingZero!7671 (index!33052 (_ BitVec 32))) (Found!7671 (index!33053 (_ BitVec 32))) (Intermediate!7671 (undefined!8483 Bool) (index!33054 (_ BitVec 32)) (x!63957 (_ BitVec 32))) (Undefined!7671) (MissingVacant!7671 (index!33055 (_ BitVec 32))) )
))
(declare-fun lt!336046 () SeekEntryResult!7671)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755013 (= res!510275 (or (= lt!336046 (MissingZero!7671 i!1173)) (= lt!336046 (MissingVacant!7671 i!1173))))))

(declare-datatypes ((array!41915 0))(
  ( (array!41916 (arr!20071 (Array (_ BitVec 32) (_ BitVec 64))) (size!20492 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41915)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41915 (_ BitVec 32)) SeekEntryResult!7671)

(assert (=> b!755013 (= lt!336046 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755014 () Bool)

(declare-fun e!421050 () Bool)

(declare-fun e!421060 () Bool)

(assert (=> b!755014 (= e!421050 (not e!421060))))

(declare-fun res!510279 () Bool)

(assert (=> b!755014 (=> res!510279 e!421060)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336051 () SeekEntryResult!7671)

(get-info :version)

(assert (=> b!755014 (= res!510279 (or (not ((_ is Intermediate!7671) lt!336051)) (bvslt x!1131 (x!63957 lt!336051)) (not (= x!1131 (x!63957 lt!336051))) (not (= index!1321 (index!33054 lt!336051)))))))

(declare-fun e!421053 () Bool)

(assert (=> b!755014 e!421053))

(declare-fun res!510276 () Bool)

(assert (=> b!755014 (=> (not res!510276) (not e!421053))))

(declare-fun lt!336044 () SeekEntryResult!7671)

(declare-fun lt!336048 () SeekEntryResult!7671)

(assert (=> b!755014 (= res!510276 (= lt!336044 lt!336048))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!755014 (= lt!336048 (Found!7671 j!159))))

(assert (=> b!755014 (= lt!336044 (seekEntryOrOpen!0 (select (arr!20071 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41915 (_ BitVec 32)) Bool)

(assert (=> b!755014 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26064 0))(
  ( (Unit!26065) )
))
(declare-fun lt!336049 () Unit!26064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26064)

(assert (=> b!755014 (= lt!336049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755015 () Bool)

(declare-fun res!510264 () Bool)

(assert (=> b!755015 (=> (not res!510264) (not e!421057))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!755015 (= res!510264 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20492 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20492 a!3186))))))

(declare-fun b!755016 () Bool)

(assert (=> b!755016 (= e!421057 e!421052)))

(declare-fun res!510265 () Bool)

(assert (=> b!755016 (=> (not res!510265) (not e!421052))))

(declare-fun lt!336047 () SeekEntryResult!7671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41915 (_ BitVec 32)) SeekEntryResult!7671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755016 (= res!510265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20071 a!3186) j!159) mask!3328) (select (arr!20071 a!3186) j!159) a!3186 mask!3328) lt!336047))))

(assert (=> b!755016 (= lt!336047 (Intermediate!7671 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755017 () Bool)

(declare-fun e!421058 () Unit!26064)

(declare-fun Unit!26066 () Unit!26064)

(assert (=> b!755017 (= e!421058 Unit!26066)))

(assert (=> b!755017 false))

(declare-fun b!755018 () Bool)

(declare-fun e!421061 () Bool)

(assert (=> b!755018 (= e!421061 true)))

(declare-fun e!421055 () Bool)

(assert (=> b!755018 e!421055))

(declare-fun res!510267 () Bool)

(assert (=> b!755018 (=> (not res!510267) (not e!421055))))

(declare-fun lt!336042 () (_ BitVec 64))

(assert (=> b!755018 (= res!510267 (= lt!336042 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336045 () Unit!26064)

(assert (=> b!755018 (= lt!336045 e!421058)))

(declare-fun c!82756 () Bool)

(assert (=> b!755018 (= c!82756 (= lt!336042 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755019 () Bool)

(declare-fun res!510281 () Bool)

(assert (=> b!755019 (=> (not res!510281) (not e!421051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755019 (= res!510281 (validKeyInArray!0 k0!2102))))

(declare-fun b!755020 () Bool)

(declare-fun e!421056 () Bool)

(assert (=> b!755020 (= e!421056 e!421061)))

(declare-fun res!510274 () Bool)

(assert (=> b!755020 (=> res!510274 e!421061)))

(declare-fun lt!336050 () (_ BitVec 64))

(assert (=> b!755020 (= res!510274 (= lt!336042 lt!336050))))

(assert (=> b!755020 (= lt!336042 (select (store (arr!20071 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755021 () Bool)

(declare-fun res!510273 () Bool)

(assert (=> b!755021 (=> (not res!510273) (not e!421052))))

(assert (=> b!755021 (= res!510273 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20071 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755022 () Bool)

(declare-fun res!510280 () Bool)

(assert (=> b!755022 (=> (not res!510280) (not e!421051))))

(assert (=> b!755022 (= res!510280 (and (= (size!20492 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20492 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20492 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755023 () Bool)

(assert (=> b!755023 (= e!421060 e!421056)))

(declare-fun res!510266 () Bool)

(assert (=> b!755023 (=> res!510266 e!421056)))

(declare-fun lt!336043 () SeekEntryResult!7671)

(assert (=> b!755023 (= res!510266 (not (= lt!336043 lt!336048)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41915 (_ BitVec 32)) SeekEntryResult!7671)

(assert (=> b!755023 (= lt!336043 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20071 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755024 () Bool)

(assert (=> b!755024 (= e!421055 (= lt!336044 lt!336043))))

(declare-fun b!755025 () Bool)

(declare-fun res!510268 () Bool)

(assert (=> b!755025 (=> (not res!510268) (not e!421057))))

(assert (=> b!755025 (= res!510268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755026 () Bool)

(declare-fun res!510277 () Bool)

(assert (=> b!755026 (=> (not res!510277) (not e!421051))))

(declare-fun arrayContainsKey!0 (array!41915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755026 (= res!510277 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755027 () Bool)

(declare-fun res!510263 () Bool)

(assert (=> b!755027 (=> (not res!510263) (not e!421057))))

(declare-datatypes ((List!14073 0))(
  ( (Nil!14070) (Cons!14069 (h!15141 (_ BitVec 64)) (t!20388 List!14073)) )
))
(declare-fun arrayNoDuplicates!0 (array!41915 (_ BitVec 32) List!14073) Bool)

(assert (=> b!755027 (= res!510263 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14070))))

(declare-fun b!755028 () Bool)

(assert (=> b!755028 (= e!421052 e!421050)))

(declare-fun res!510278 () Bool)

(assert (=> b!755028 (=> (not res!510278) (not e!421050))))

(declare-fun lt!336052 () SeekEntryResult!7671)

(assert (=> b!755028 (= res!510278 (= lt!336052 lt!336051))))

(declare-fun lt!336053 () array!41915)

(assert (=> b!755028 (= lt!336051 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336050 lt!336053 mask!3328))))

(assert (=> b!755028 (= lt!336052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336050 mask!3328) lt!336050 lt!336053 mask!3328))))

(assert (=> b!755028 (= lt!336050 (select (store (arr!20071 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755028 (= lt!336053 (array!41916 (store (arr!20071 a!3186) i!1173 k0!2102) (size!20492 a!3186)))))

(declare-fun b!755029 () Bool)

(assert (=> b!755029 (= e!421053 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20071 a!3186) j!159) a!3186 mask!3328) lt!336048))))

(declare-fun b!755030 () Bool)

(declare-fun res!510271 () Bool)

(assert (=> b!755030 (=> (not res!510271) (not e!421055))))

(assert (=> b!755030 (= res!510271 (= (seekEntryOrOpen!0 lt!336050 lt!336053 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336050 lt!336053 mask!3328)))))

(declare-fun res!510270 () Bool)

(assert (=> start!65742 (=> (not res!510270) (not e!421051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65742 (= res!510270 (validMask!0 mask!3328))))

(assert (=> start!65742 e!421051))

(assert (=> start!65742 true))

(declare-fun array_inv!15867 (array!41915) Bool)

(assert (=> start!65742 (array_inv!15867 a!3186)))

(declare-fun b!755031 () Bool)

(assert (=> b!755031 (= e!421054 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20071 a!3186) j!159) a!3186 mask!3328) lt!336047))))

(declare-fun b!755032 () Bool)

(declare-fun res!510269 () Bool)

(assert (=> b!755032 (=> (not res!510269) (not e!421051))))

(assert (=> b!755032 (= res!510269 (validKeyInArray!0 (select (arr!20071 a!3186) j!159)))))

(declare-fun b!755033 () Bool)

(assert (=> b!755033 (= e!421054 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20071 a!3186) j!159) a!3186 mask!3328) (Found!7671 j!159)))))

(declare-fun b!755034 () Bool)

(declare-fun Unit!26067 () Unit!26064)

(assert (=> b!755034 (= e!421058 Unit!26067)))

(assert (= (and start!65742 res!510270) b!755022))

(assert (= (and b!755022 res!510280) b!755032))

(assert (= (and b!755032 res!510269) b!755019))

(assert (= (and b!755019 res!510281) b!755026))

(assert (= (and b!755026 res!510277) b!755013))

(assert (= (and b!755013 res!510275) b!755025))

(assert (= (and b!755025 res!510268) b!755027))

(assert (= (and b!755027 res!510263) b!755015))

(assert (= (and b!755015 res!510264) b!755016))

(assert (= (and b!755016 res!510265) b!755021))

(assert (= (and b!755021 res!510273) b!755012))

(assert (= (and b!755012 c!82755) b!755031))

(assert (= (and b!755012 (not c!82755)) b!755033))

(assert (= (and b!755012 res!510272) b!755028))

(assert (= (and b!755028 res!510278) b!755014))

(assert (= (and b!755014 res!510276) b!755029))

(assert (= (and b!755014 (not res!510279)) b!755023))

(assert (= (and b!755023 (not res!510266)) b!755020))

(assert (= (and b!755020 (not res!510274)) b!755018))

(assert (= (and b!755018 c!82756) b!755017))

(assert (= (and b!755018 (not c!82756)) b!755034))

(assert (= (and b!755018 res!510267) b!755030))

(assert (= (and b!755030 res!510271) b!755024))

(declare-fun m!703319 () Bool)

(assert (=> b!755025 m!703319))

(declare-fun m!703321 () Bool)

(assert (=> b!755026 m!703321))

(declare-fun m!703323 () Bool)

(assert (=> b!755029 m!703323))

(assert (=> b!755029 m!703323))

(declare-fun m!703325 () Bool)

(assert (=> b!755029 m!703325))

(assert (=> b!755016 m!703323))

(assert (=> b!755016 m!703323))

(declare-fun m!703327 () Bool)

(assert (=> b!755016 m!703327))

(assert (=> b!755016 m!703327))

(assert (=> b!755016 m!703323))

(declare-fun m!703329 () Bool)

(assert (=> b!755016 m!703329))

(assert (=> b!755014 m!703323))

(assert (=> b!755014 m!703323))

(declare-fun m!703331 () Bool)

(assert (=> b!755014 m!703331))

(declare-fun m!703333 () Bool)

(assert (=> b!755014 m!703333))

(declare-fun m!703335 () Bool)

(assert (=> b!755014 m!703335))

(declare-fun m!703337 () Bool)

(assert (=> start!65742 m!703337))

(declare-fun m!703339 () Bool)

(assert (=> start!65742 m!703339))

(declare-fun m!703341 () Bool)

(assert (=> b!755013 m!703341))

(assert (=> b!755033 m!703323))

(assert (=> b!755033 m!703323))

(declare-fun m!703343 () Bool)

(assert (=> b!755033 m!703343))

(declare-fun m!703345 () Bool)

(assert (=> b!755019 m!703345))

(assert (=> b!755032 m!703323))

(assert (=> b!755032 m!703323))

(declare-fun m!703347 () Bool)

(assert (=> b!755032 m!703347))

(assert (=> b!755031 m!703323))

(assert (=> b!755031 m!703323))

(declare-fun m!703349 () Bool)

(assert (=> b!755031 m!703349))

(assert (=> b!755023 m!703323))

(assert (=> b!755023 m!703323))

(assert (=> b!755023 m!703343))

(declare-fun m!703351 () Bool)

(assert (=> b!755020 m!703351))

(declare-fun m!703353 () Bool)

(assert (=> b!755020 m!703353))

(declare-fun m!703355 () Bool)

(assert (=> b!755028 m!703355))

(declare-fun m!703357 () Bool)

(assert (=> b!755028 m!703357))

(assert (=> b!755028 m!703355))

(declare-fun m!703359 () Bool)

(assert (=> b!755028 m!703359))

(assert (=> b!755028 m!703351))

(declare-fun m!703361 () Bool)

(assert (=> b!755028 m!703361))

(declare-fun m!703363 () Bool)

(assert (=> b!755030 m!703363))

(declare-fun m!703365 () Bool)

(assert (=> b!755030 m!703365))

(declare-fun m!703367 () Bool)

(assert (=> b!755021 m!703367))

(declare-fun m!703369 () Bool)

(assert (=> b!755027 m!703369))

(check-sat (not start!65742) (not b!755025) (not b!755016) (not b!755014) (not b!755033) (not b!755013) (not b!755027) (not b!755023) (not b!755028) (not b!755031) (not b!755026) (not b!755029) (not b!755019) (not b!755030) (not b!755032))
(check-sat)
