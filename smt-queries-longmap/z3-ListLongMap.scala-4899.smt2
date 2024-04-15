; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67550 () Bool)

(assert start!67550)

(declare-fun b!782079 () Bool)

(declare-fun res!529254 () Bool)

(declare-fun e!434870 () Bool)

(assert (=> b!782079 (=> (not res!529254) (not e!434870))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42672 0))(
  ( (array!42673 (arr!20426 (Array (_ BitVec 32) (_ BitVec 64))) (size!20847 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42672)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782079 (= res!529254 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20426 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782080 () Bool)

(declare-fun res!529257 () Bool)

(declare-fun e!434877 () Bool)

(assert (=> b!782080 (=> (not res!529257) (not e!434877))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42672 (_ BitVec 32)) Bool)

(assert (=> b!782080 (= res!529257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782081 () Bool)

(declare-fun e!434875 () Bool)

(assert (=> b!782081 (= e!434875 e!434877)))

(declare-fun res!529246 () Bool)

(assert (=> b!782081 (=> (not res!529246) (not e!434877))))

(declare-datatypes ((SeekEntryResult!8023 0))(
  ( (MissingZero!8023 (index!34460 (_ BitVec 32))) (Found!8023 (index!34461 (_ BitVec 32))) (Intermediate!8023 (undefined!8835 Bool) (index!34462 (_ BitVec 32)) (x!65421 (_ BitVec 32))) (Undefined!8023) (MissingVacant!8023 (index!34463 (_ BitVec 32))) )
))
(declare-fun lt!348416 () SeekEntryResult!8023)

(assert (=> b!782081 (= res!529246 (or (= lt!348416 (MissingZero!8023 i!1173)) (= lt!348416 (MissingVacant!8023 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42672 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!782081 (= lt!348416 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!782082 () Bool)

(declare-fun lt!348410 () SeekEntryResult!8023)

(declare-fun e!434874 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42672 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!782082 (= e!434874 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348410))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!348415 () SeekEntryResult!8023)

(declare-fun e!434872 () Bool)

(declare-fun b!782083 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42672 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!782083 (= e!434872 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348415))))

(declare-fun b!782084 () Bool)

(declare-fun res!529248 () Bool)

(assert (=> b!782084 (=> (not res!529248) (not e!434875))))

(assert (=> b!782084 (= res!529248 (and (= (size!20847 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20847 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20847 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782085 () Bool)

(declare-fun res!529249 () Bool)

(assert (=> b!782085 (=> (not res!529249) (not e!434877))))

(assert (=> b!782085 (= res!529249 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20847 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20847 a!3186))))))

(declare-fun b!782086 () Bool)

(declare-fun e!434878 () Bool)

(assert (=> b!782086 (= e!434878 true)))

(assert (=> b!782086 (= (select (store (arr!20426 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26960 0))(
  ( (Unit!26961) )
))
(declare-fun lt!348417 () Unit!26960)

(declare-fun e!434871 () Unit!26960)

(assert (=> b!782086 (= lt!348417 e!434871)))

(declare-fun c!86825 () Bool)

(assert (=> b!782086 (= c!86825 (= (select (store (arr!20426 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782087 () Bool)

(declare-fun res!529251 () Bool)

(assert (=> b!782087 (=> (not res!529251) (not e!434870))))

(assert (=> b!782087 (= res!529251 e!434872)))

(declare-fun c!86826 () Bool)

(assert (=> b!782087 (= c!86826 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782088 () Bool)

(declare-fun Unit!26962 () Unit!26960)

(assert (=> b!782088 (= e!434871 Unit!26962)))

(assert (=> b!782088 false))

(declare-fun b!782090 () Bool)

(declare-fun res!529245 () Bool)

(assert (=> b!782090 (=> res!529245 e!434878)))

(assert (=> b!782090 (= res!529245 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348410)))))

(declare-fun b!782091 () Bool)

(declare-fun res!529253 () Bool)

(assert (=> b!782091 (=> (not res!529253) (not e!434875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782091 (= res!529253 (validKeyInArray!0 k0!2102))))

(declare-fun b!782092 () Bool)

(declare-fun res!529256 () Bool)

(assert (=> b!782092 (=> (not res!529256) (not e!434875))))

(assert (=> b!782092 (= res!529256 (validKeyInArray!0 (select (arr!20426 a!3186) j!159)))))

(declare-fun b!782093 () Bool)

(declare-fun Unit!26963 () Unit!26960)

(assert (=> b!782093 (= e!434871 Unit!26963)))

(declare-fun b!782094 () Bool)

(declare-fun res!529241 () Bool)

(assert (=> b!782094 (=> (not res!529241) (not e!434875))))

(declare-fun arrayContainsKey!0 (array!42672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782094 (= res!529241 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782095 () Bool)

(declare-fun e!434873 () Bool)

(assert (=> b!782095 (= e!434873 (not e!434878))))

(declare-fun res!529252 () Bool)

(assert (=> b!782095 (=> res!529252 e!434878)))

(declare-fun lt!348412 () SeekEntryResult!8023)

(get-info :version)

(assert (=> b!782095 (= res!529252 (or (not ((_ is Intermediate!8023) lt!348412)) (bvslt x!1131 (x!65421 lt!348412)) (not (= x!1131 (x!65421 lt!348412))) (not (= index!1321 (index!34462 lt!348412)))))))

(assert (=> b!782095 e!434874))

(declare-fun res!529250 () Bool)

(assert (=> b!782095 (=> (not res!529250) (not e!434874))))

(declare-fun lt!348419 () SeekEntryResult!8023)

(assert (=> b!782095 (= res!529250 (= lt!348419 lt!348410))))

(assert (=> b!782095 (= lt!348410 (Found!8023 j!159))))

(assert (=> b!782095 (= lt!348419 (seekEntryOrOpen!0 (select (arr!20426 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782095 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348414 () Unit!26960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26960)

(assert (=> b!782095 (= lt!348414 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782096 () Bool)

(assert (=> b!782096 (= e!434877 e!434870)))

(declare-fun res!529243 () Bool)

(assert (=> b!782096 (=> (not res!529243) (not e!434870))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782096 (= res!529243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20426 a!3186) j!159) mask!3328) (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348415))))

(assert (=> b!782096 (= lt!348415 (Intermediate!8023 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782097 () Bool)

(declare-fun res!529244 () Bool)

(assert (=> b!782097 (=> (not res!529244) (not e!434877))))

(declare-datatypes ((List!14467 0))(
  ( (Nil!14464) (Cons!14463 (h!15583 (_ BitVec 64)) (t!20773 List!14467)) )
))
(declare-fun arrayNoDuplicates!0 (array!42672 (_ BitVec 32) List!14467) Bool)

(assert (=> b!782097 (= res!529244 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14464))))

(declare-fun b!782098 () Bool)

(assert (=> b!782098 (= e!434870 e!434873)))

(declare-fun res!529247 () Bool)

(assert (=> b!782098 (=> (not res!529247) (not e!434873))))

(declare-fun lt!348418 () SeekEntryResult!8023)

(assert (=> b!782098 (= res!529247 (= lt!348418 lt!348412))))

(declare-fun lt!348413 () (_ BitVec 64))

(declare-fun lt!348411 () array!42672)

(assert (=> b!782098 (= lt!348412 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348413 lt!348411 mask!3328))))

(assert (=> b!782098 (= lt!348418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348413 mask!3328) lt!348413 lt!348411 mask!3328))))

(assert (=> b!782098 (= lt!348413 (select (store (arr!20426 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782098 (= lt!348411 (array!42673 (store (arr!20426 a!3186) i!1173 k0!2102) (size!20847 a!3186)))))

(declare-fun b!782099 () Bool)

(assert (=> b!782099 (= e!434872 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) (Found!8023 j!159)))))

(declare-fun res!529255 () Bool)

(assert (=> start!67550 (=> (not res!529255) (not e!434875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67550 (= res!529255 (validMask!0 mask!3328))))

(assert (=> start!67550 e!434875))

(assert (=> start!67550 true))

(declare-fun array_inv!16309 (array!42672) Bool)

(assert (=> start!67550 (array_inv!16309 a!3186)))

(declare-fun b!782089 () Bool)

(declare-fun res!529242 () Bool)

(assert (=> b!782089 (=> res!529242 e!434878)))

(assert (=> b!782089 (= res!529242 (= (select (store (arr!20426 a!3186) i!1173 k0!2102) index!1321) lt!348413))))

(assert (= (and start!67550 res!529255) b!782084))

(assert (= (and b!782084 res!529248) b!782092))

(assert (= (and b!782092 res!529256) b!782091))

(assert (= (and b!782091 res!529253) b!782094))

(assert (= (and b!782094 res!529241) b!782081))

(assert (= (and b!782081 res!529246) b!782080))

(assert (= (and b!782080 res!529257) b!782097))

(assert (= (and b!782097 res!529244) b!782085))

(assert (= (and b!782085 res!529249) b!782096))

(assert (= (and b!782096 res!529243) b!782079))

(assert (= (and b!782079 res!529254) b!782087))

(assert (= (and b!782087 c!86826) b!782083))

(assert (= (and b!782087 (not c!86826)) b!782099))

(assert (= (and b!782087 res!529251) b!782098))

(assert (= (and b!782098 res!529247) b!782095))

(assert (= (and b!782095 res!529250) b!782082))

(assert (= (and b!782095 (not res!529252)) b!782090))

(assert (= (and b!782090 (not res!529245)) b!782089))

(assert (= (and b!782089 (not res!529242)) b!782086))

(assert (= (and b!782086 c!86825) b!782088))

(assert (= (and b!782086 (not c!86825)) b!782093))

(declare-fun m!724389 () Bool)

(assert (=> b!782079 m!724389))

(declare-fun m!724391 () Bool)

(assert (=> b!782099 m!724391))

(assert (=> b!782099 m!724391))

(declare-fun m!724393 () Bool)

(assert (=> b!782099 m!724393))

(assert (=> b!782092 m!724391))

(assert (=> b!782092 m!724391))

(declare-fun m!724395 () Bool)

(assert (=> b!782092 m!724395))

(declare-fun m!724397 () Bool)

(assert (=> b!782097 m!724397))

(declare-fun m!724399 () Bool)

(assert (=> b!782081 m!724399))

(declare-fun m!724401 () Bool)

(assert (=> b!782080 m!724401))

(declare-fun m!724403 () Bool)

(assert (=> b!782086 m!724403))

(declare-fun m!724405 () Bool)

(assert (=> b!782086 m!724405))

(declare-fun m!724407 () Bool)

(assert (=> b!782094 m!724407))

(declare-fun m!724409 () Bool)

(assert (=> b!782098 m!724409))

(declare-fun m!724411 () Bool)

(assert (=> b!782098 m!724411))

(assert (=> b!782098 m!724403))

(declare-fun m!724413 () Bool)

(assert (=> b!782098 m!724413))

(assert (=> b!782098 m!724409))

(declare-fun m!724415 () Bool)

(assert (=> b!782098 m!724415))

(assert (=> b!782090 m!724391))

(assert (=> b!782090 m!724391))

(assert (=> b!782090 m!724393))

(declare-fun m!724417 () Bool)

(assert (=> start!67550 m!724417))

(declare-fun m!724419 () Bool)

(assert (=> start!67550 m!724419))

(declare-fun m!724421 () Bool)

(assert (=> b!782091 m!724421))

(assert (=> b!782083 m!724391))

(assert (=> b!782083 m!724391))

(declare-fun m!724423 () Bool)

(assert (=> b!782083 m!724423))

(assert (=> b!782095 m!724391))

(assert (=> b!782095 m!724391))

(declare-fun m!724425 () Bool)

(assert (=> b!782095 m!724425))

(declare-fun m!724427 () Bool)

(assert (=> b!782095 m!724427))

(declare-fun m!724429 () Bool)

(assert (=> b!782095 m!724429))

(assert (=> b!782082 m!724391))

(assert (=> b!782082 m!724391))

(declare-fun m!724431 () Bool)

(assert (=> b!782082 m!724431))

(assert (=> b!782096 m!724391))

(assert (=> b!782096 m!724391))

(declare-fun m!724433 () Bool)

(assert (=> b!782096 m!724433))

(assert (=> b!782096 m!724433))

(assert (=> b!782096 m!724391))

(declare-fun m!724435 () Bool)

(assert (=> b!782096 m!724435))

(assert (=> b!782089 m!724403))

(assert (=> b!782089 m!724405))

(check-sat (not b!782081) (not b!782096) (not b!782090) (not b!782080) (not b!782098) (not start!67550) (not b!782099) (not b!782091) (not b!782097) (not b!782083) (not b!782082) (not b!782092) (not b!782094) (not b!782095))
(check-sat)
