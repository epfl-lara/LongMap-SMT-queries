; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67708 () Bool)

(assert start!67708)

(declare-fun b!785138 () Bool)

(declare-fun res!531426 () Bool)

(declare-fun e!436506 () Bool)

(assert (=> b!785138 (=> (not res!531426) (not e!436506))))

(declare-datatypes ((array!42748 0))(
  ( (array!42749 (arr!20462 (Array (_ BitVec 32) (_ BitVec 64))) (size!20883 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42748)

(declare-datatypes ((List!14464 0))(
  ( (Nil!14461) (Cons!14460 (h!15583 (_ BitVec 64)) (t!20779 List!14464)) )
))
(declare-fun arrayNoDuplicates!0 (array!42748 (_ BitVec 32) List!14464) Bool)

(assert (=> b!785138 (= res!531426 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14461))))

(declare-fun b!785139 () Bool)

(declare-datatypes ((Unit!27136 0))(
  ( (Unit!27137) )
))
(declare-fun e!436500 () Unit!27136)

(declare-fun Unit!27138 () Unit!27136)

(assert (=> b!785139 (= e!436500 Unit!27138)))

(declare-fun b!785140 () Bool)

(declare-fun res!531416 () Bool)

(declare-fun e!436501 () Bool)

(assert (=> b!785140 (=> (not res!531416) (not e!436501))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!785140 (= res!531416 (and (= (size!20883 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20883 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20883 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785141 () Bool)

(declare-fun res!531425 () Bool)

(assert (=> b!785141 (=> (not res!531425) (not e!436506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42748 (_ BitVec 32)) Bool)

(assert (=> b!785141 (= res!531425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785142 () Bool)

(declare-fun e!436503 () Bool)

(declare-fun e!436504 () Bool)

(assert (=> b!785142 (= e!436503 e!436504)))

(declare-fun res!531413 () Bool)

(assert (=> b!785142 (=> res!531413 e!436504)))

(declare-datatypes ((SeekEntryResult!8062 0))(
  ( (MissingZero!8062 (index!34616 (_ BitVec 32))) (Found!8062 (index!34617 (_ BitVec 32))) (Intermediate!8062 (undefined!8874 Bool) (index!34618 (_ BitVec 32)) (x!65562 (_ BitVec 32))) (Undefined!8062) (MissingVacant!8062 (index!34619 (_ BitVec 32))) )
))
(declare-fun lt!350054 () SeekEntryResult!8062)

(declare-fun lt!350052 () SeekEntryResult!8062)

(assert (=> b!785142 (= res!531413 (not (= lt!350054 lt!350052)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42748 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!785142 (= lt!350054 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20462 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785143 () Bool)

(declare-fun res!531417 () Bool)

(assert (=> b!785143 (=> (not res!531417) (not e!436501))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785143 (= res!531417 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785144 () Bool)

(assert (=> b!785144 (= e!436501 e!436506)))

(declare-fun res!531431 () Bool)

(assert (=> b!785144 (=> (not res!531431) (not e!436506))))

(declare-fun lt!350055 () SeekEntryResult!8062)

(assert (=> b!785144 (= res!531431 (or (= lt!350055 (MissingZero!8062 i!1173)) (= lt!350055 (MissingVacant!8062 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42748 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!785144 (= lt!350055 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785145 () Bool)

(declare-fun res!531419 () Bool)

(assert (=> b!785145 (=> (not res!531419) (not e!436501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785145 (= res!531419 (validKeyInArray!0 k!2102))))

(declare-fun e!436498 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!785146 () Bool)

(assert (=> b!785146 (= e!436498 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20462 a!3186) j!159) a!3186 mask!3328) lt!350052))))

(declare-fun b!785147 () Bool)

(declare-fun e!436502 () Bool)

(declare-fun e!436508 () Bool)

(assert (=> b!785147 (= e!436502 e!436508)))

(declare-fun res!531423 () Bool)

(assert (=> b!785147 (=> (not res!531423) (not e!436508))))

(declare-fun lt!350053 () SeekEntryResult!8062)

(declare-fun lt!350049 () SeekEntryResult!8062)

(assert (=> b!785147 (= res!531423 (= lt!350053 lt!350049))))

(declare-fun lt!350050 () array!42748)

(declare-fun lt!350060 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42748 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!785147 (= lt!350049 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350060 lt!350050 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785147 (= lt!350053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350060 mask!3328) lt!350060 lt!350050 mask!3328))))

(assert (=> b!785147 (= lt!350060 (select (store (arr!20462 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785147 (= lt!350050 (array!42749 (store (arr!20462 a!3186) i!1173 k!2102) (size!20883 a!3186)))))

(declare-fun b!785148 () Bool)

(declare-fun e!436505 () Bool)

(declare-fun lt!350057 () SeekEntryResult!8062)

(assert (=> b!785148 (= e!436505 (= lt!350057 lt!350054))))

(declare-fun lt!350058 () SeekEntryResult!8062)

(declare-fun b!785149 () Bool)

(declare-fun e!436507 () Bool)

(assert (=> b!785149 (= e!436507 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20462 a!3186) j!159) a!3186 mask!3328) lt!350058))))

(declare-fun b!785150 () Bool)

(declare-fun res!531420 () Bool)

(assert (=> b!785150 (=> (not res!531420) (not e!436501))))

(assert (=> b!785150 (= res!531420 (validKeyInArray!0 (select (arr!20462 a!3186) j!159)))))

(declare-fun b!785151 () Bool)

(declare-fun Unit!27139 () Unit!27136)

(assert (=> b!785151 (= e!436500 Unit!27139)))

(assert (=> b!785151 false))

(declare-fun b!785153 () Bool)

(declare-fun e!436499 () Bool)

(assert (=> b!785153 (= e!436499 true)))

(assert (=> b!785153 e!436505))

(declare-fun res!531422 () Bool)

(assert (=> b!785153 (=> (not res!531422) (not e!436505))))

(declare-fun lt!350051 () (_ BitVec 64))

(assert (=> b!785153 (= res!531422 (= lt!350051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350059 () Unit!27136)

(assert (=> b!785153 (= lt!350059 e!436500)))

(declare-fun c!87270 () Bool)

(assert (=> b!785153 (= c!87270 (= lt!350051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785154 () Bool)

(assert (=> b!785154 (= e!436506 e!436502)))

(declare-fun res!531430 () Bool)

(assert (=> b!785154 (=> (not res!531430) (not e!436502))))

(assert (=> b!785154 (= res!531430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20462 a!3186) j!159) mask!3328) (select (arr!20462 a!3186) j!159) a!3186 mask!3328) lt!350058))))

(assert (=> b!785154 (= lt!350058 (Intermediate!8062 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785155 () Bool)

(assert (=> b!785155 (= e!436504 e!436499)))

(declare-fun res!531421 () Bool)

(assert (=> b!785155 (=> res!531421 e!436499)))

(assert (=> b!785155 (= res!531421 (= lt!350051 lt!350060))))

(assert (=> b!785155 (= lt!350051 (select (store (arr!20462 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785156 () Bool)

(assert (=> b!785156 (= e!436507 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20462 a!3186) j!159) a!3186 mask!3328) (Found!8062 j!159)))))

(declare-fun b!785157 () Bool)

(declare-fun res!531429 () Bool)

(assert (=> b!785157 (=> (not res!531429) (not e!436502))))

(assert (=> b!785157 (= res!531429 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20462 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785158 () Bool)

(assert (=> b!785158 (= e!436508 (not e!436503))))

(declare-fun res!531418 () Bool)

(assert (=> b!785158 (=> res!531418 e!436503)))

(assert (=> b!785158 (= res!531418 (or (not (is-Intermediate!8062 lt!350049)) (bvslt x!1131 (x!65562 lt!350049)) (not (= x!1131 (x!65562 lt!350049))) (not (= index!1321 (index!34618 lt!350049)))))))

(assert (=> b!785158 e!436498))

(declare-fun res!531414 () Bool)

(assert (=> b!785158 (=> (not res!531414) (not e!436498))))

(assert (=> b!785158 (= res!531414 (= lt!350057 lt!350052))))

(assert (=> b!785158 (= lt!350052 (Found!8062 j!159))))

(assert (=> b!785158 (= lt!350057 (seekEntryOrOpen!0 (select (arr!20462 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785158 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350056 () Unit!27136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27136)

(assert (=> b!785158 (= lt!350056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785159 () Bool)

(declare-fun res!531415 () Bool)

(assert (=> b!785159 (=> (not res!531415) (not e!436505))))

(assert (=> b!785159 (= res!531415 (= (seekEntryOrOpen!0 lt!350060 lt!350050 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350060 lt!350050 mask!3328)))))

(declare-fun b!785160 () Bool)

(declare-fun res!531424 () Bool)

(assert (=> b!785160 (=> (not res!531424) (not e!436506))))

(assert (=> b!785160 (= res!531424 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20883 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20883 a!3186))))))

(declare-fun res!531428 () Bool)

(assert (=> start!67708 (=> (not res!531428) (not e!436501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67708 (= res!531428 (validMask!0 mask!3328))))

(assert (=> start!67708 e!436501))

(assert (=> start!67708 true))

(declare-fun array_inv!16258 (array!42748) Bool)

(assert (=> start!67708 (array_inv!16258 a!3186)))

(declare-fun b!785152 () Bool)

(declare-fun res!531427 () Bool)

(assert (=> b!785152 (=> (not res!531427) (not e!436502))))

(assert (=> b!785152 (= res!531427 e!436507)))

(declare-fun c!87271 () Bool)

(assert (=> b!785152 (= c!87271 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67708 res!531428) b!785140))

(assert (= (and b!785140 res!531416) b!785150))

(assert (= (and b!785150 res!531420) b!785145))

(assert (= (and b!785145 res!531419) b!785143))

(assert (= (and b!785143 res!531417) b!785144))

(assert (= (and b!785144 res!531431) b!785141))

(assert (= (and b!785141 res!531425) b!785138))

(assert (= (and b!785138 res!531426) b!785160))

(assert (= (and b!785160 res!531424) b!785154))

(assert (= (and b!785154 res!531430) b!785157))

(assert (= (and b!785157 res!531429) b!785152))

(assert (= (and b!785152 c!87271) b!785149))

(assert (= (and b!785152 (not c!87271)) b!785156))

(assert (= (and b!785152 res!531427) b!785147))

(assert (= (and b!785147 res!531423) b!785158))

(assert (= (and b!785158 res!531414) b!785146))

(assert (= (and b!785158 (not res!531418)) b!785142))

(assert (= (and b!785142 (not res!531413)) b!785155))

(assert (= (and b!785155 (not res!531421)) b!785153))

(assert (= (and b!785153 c!87270) b!785151))

(assert (= (and b!785153 (not c!87270)) b!785139))

(assert (= (and b!785153 res!531422) b!785159))

(assert (= (and b!785159 res!531415) b!785148))

(declare-fun m!727285 () Bool)

(assert (=> b!785144 m!727285))

(declare-fun m!727287 () Bool)

(assert (=> b!785157 m!727287))

(declare-fun m!727289 () Bool)

(assert (=> b!785147 m!727289))

(declare-fun m!727291 () Bool)

(assert (=> b!785147 m!727291))

(declare-fun m!727293 () Bool)

(assert (=> b!785147 m!727293))

(declare-fun m!727295 () Bool)

(assert (=> b!785147 m!727295))

(assert (=> b!785147 m!727295))

(declare-fun m!727297 () Bool)

(assert (=> b!785147 m!727297))

(declare-fun m!727299 () Bool)

(assert (=> b!785150 m!727299))

(assert (=> b!785150 m!727299))

(declare-fun m!727301 () Bool)

(assert (=> b!785150 m!727301))

(declare-fun m!727303 () Bool)

(assert (=> b!785138 m!727303))

(assert (=> b!785146 m!727299))

(assert (=> b!785146 m!727299))

(declare-fun m!727305 () Bool)

(assert (=> b!785146 m!727305))

(assert (=> b!785142 m!727299))

(assert (=> b!785142 m!727299))

(declare-fun m!727307 () Bool)

(assert (=> b!785142 m!727307))

(declare-fun m!727309 () Bool)

(assert (=> start!67708 m!727309))

(declare-fun m!727311 () Bool)

(assert (=> start!67708 m!727311))

(assert (=> b!785149 m!727299))

(assert (=> b!785149 m!727299))

(declare-fun m!727313 () Bool)

(assert (=> b!785149 m!727313))

(assert (=> b!785155 m!727291))

(declare-fun m!727315 () Bool)

(assert (=> b!785155 m!727315))

(assert (=> b!785156 m!727299))

(assert (=> b!785156 m!727299))

(assert (=> b!785156 m!727307))

(assert (=> b!785154 m!727299))

(assert (=> b!785154 m!727299))

(declare-fun m!727317 () Bool)

(assert (=> b!785154 m!727317))

(assert (=> b!785154 m!727317))

(assert (=> b!785154 m!727299))

(declare-fun m!727319 () Bool)

(assert (=> b!785154 m!727319))

(declare-fun m!727321 () Bool)

(assert (=> b!785159 m!727321))

(declare-fun m!727323 () Bool)

(assert (=> b!785159 m!727323))

(declare-fun m!727325 () Bool)

(assert (=> b!785141 m!727325))

(assert (=> b!785158 m!727299))

(assert (=> b!785158 m!727299))

(declare-fun m!727327 () Bool)

(assert (=> b!785158 m!727327))

(declare-fun m!727329 () Bool)

(assert (=> b!785158 m!727329))

(declare-fun m!727331 () Bool)

(assert (=> b!785158 m!727331))

(declare-fun m!727333 () Bool)

(assert (=> b!785143 m!727333))

(declare-fun m!727335 () Bool)

(assert (=> b!785145 m!727335))

(push 1)

