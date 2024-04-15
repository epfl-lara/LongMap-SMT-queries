; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67676 () Bool)

(assert start!67676)

(declare-fun b!784543 () Bool)

(declare-fun e!436170 () Bool)

(declare-fun e!436172 () Bool)

(assert (=> b!784543 (= e!436170 (not e!436172))))

(declare-fun res!531028 () Bool)

(assert (=> b!784543 (=> res!531028 e!436172)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8053 0))(
  ( (MissingZero!8053 (index!34580 (_ BitVec 32))) (Found!8053 (index!34581 (_ BitVec 32))) (Intermediate!8053 (undefined!8865 Bool) (index!34582 (_ BitVec 32)) (x!65540 (_ BitVec 32))) (Undefined!8053) (MissingVacant!8053 (index!34583 (_ BitVec 32))) )
))
(declare-fun lt!349635 () SeekEntryResult!8053)

(get-info :version)

(assert (=> b!784543 (= res!531028 (or (not ((_ is Intermediate!8053) lt!349635)) (bvslt x!1131 (x!65540 lt!349635)) (not (= x!1131 (x!65540 lt!349635))) (not (= index!1321 (index!34582 lt!349635)))))))

(declare-fun e!436169 () Bool)

(assert (=> b!784543 e!436169))

(declare-fun res!531020 () Bool)

(assert (=> b!784543 (=> (not res!531020) (not e!436169))))

(declare-fun lt!349640 () SeekEntryResult!8053)

(declare-fun lt!349636 () SeekEntryResult!8053)

(assert (=> b!784543 (= res!531020 (= lt!349640 lt!349636))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!784543 (= lt!349636 (Found!8053 j!159))))

(declare-datatypes ((array!42735 0))(
  ( (array!42736 (arr!20456 (Array (_ BitVec 32) (_ BitVec 64))) (size!20877 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42735)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42735 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!784543 (= lt!349640 (seekEntryOrOpen!0 (select (arr!20456 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42735 (_ BitVec 32)) Bool)

(assert (=> b!784543 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27080 0))(
  ( (Unit!27081) )
))
(declare-fun lt!349632 () Unit!27080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27080)

(assert (=> b!784543 (= lt!349632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784544 () Bool)

(declare-fun res!531019 () Bool)

(declare-fun e!436165 () Bool)

(assert (=> b!784544 (=> (not res!531019) (not e!436165))))

(declare-datatypes ((List!14497 0))(
  ( (Nil!14494) (Cons!14493 (h!15616 (_ BitVec 64)) (t!20803 List!14497)) )
))
(declare-fun arrayNoDuplicates!0 (array!42735 (_ BitVec 32) List!14497) Bool)

(assert (=> b!784544 (= res!531019 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14494))))

(declare-fun b!784545 () Bool)

(declare-fun e!436164 () Bool)

(declare-fun lt!349634 () SeekEntryResult!8053)

(assert (=> b!784545 (= e!436164 (= lt!349640 lt!349634))))

(declare-fun b!784546 () Bool)

(declare-fun res!531024 () Bool)

(assert (=> b!784546 (=> (not res!531024) (not e!436165))))

(assert (=> b!784546 (= res!531024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784547 () Bool)

(declare-fun res!531033 () Bool)

(declare-fun e!436171 () Bool)

(assert (=> b!784547 (=> (not res!531033) (not e!436171))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784547 (= res!531033 (and (= (size!20877 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20877 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20877 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784548 () Bool)

(declare-fun res!531022 () Bool)

(assert (=> b!784548 (=> (not res!531022) (not e!436171))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784548 (= res!531022 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784549 () Bool)

(assert (=> b!784549 (= e!436171 e!436165)))

(declare-fun res!531036 () Bool)

(assert (=> b!784549 (=> (not res!531036) (not e!436165))))

(declare-fun lt!349633 () SeekEntryResult!8053)

(assert (=> b!784549 (= res!531036 (or (= lt!349633 (MissingZero!8053 i!1173)) (= lt!349633 (MissingVacant!8053 i!1173))))))

(assert (=> b!784549 (= lt!349633 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!531029 () Bool)

(assert (=> start!67676 (=> (not res!531029) (not e!436171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67676 (= res!531029 (validMask!0 mask!3328))))

(assert (=> start!67676 e!436171))

(assert (=> start!67676 true))

(declare-fun array_inv!16339 (array!42735) Bool)

(assert (=> start!67676 (array_inv!16339 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!784550 () Bool)

(declare-fun e!436163 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42735 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!784550 (= e!436163 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20456 a!3186) j!159) a!3186 mask!3328) (Found!8053 j!159)))))

(declare-fun b!784551 () Bool)

(declare-fun res!531025 () Bool)

(assert (=> b!784551 (=> (not res!531025) (not e!436171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784551 (= res!531025 (validKeyInArray!0 k0!2102))))

(declare-fun b!784552 () Bool)

(declare-fun e!436173 () Bool)

(declare-fun e!436168 () Bool)

(assert (=> b!784552 (= e!436173 e!436168)))

(declare-fun res!531027 () Bool)

(assert (=> b!784552 (=> res!531027 e!436168)))

(declare-fun lt!349638 () (_ BitVec 64))

(declare-fun lt!349629 () (_ BitVec 64))

(assert (=> b!784552 (= res!531027 (= lt!349638 lt!349629))))

(assert (=> b!784552 (= lt!349638 (select (store (arr!20456 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun lt!349637 () SeekEntryResult!8053)

(declare-fun b!784553 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42735 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!784553 (= e!436163 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20456 a!3186) j!159) a!3186 mask!3328) lt!349637))))

(declare-fun b!784554 () Bool)

(assert (=> b!784554 (= e!436168 true)))

(assert (=> b!784554 e!436164))

(declare-fun res!531018 () Bool)

(assert (=> b!784554 (=> (not res!531018) (not e!436164))))

(assert (=> b!784554 (= res!531018 (= lt!349638 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349630 () Unit!27080)

(declare-fun e!436166 () Unit!27080)

(assert (=> b!784554 (= lt!349630 e!436166)))

(declare-fun c!87170 () Bool)

(assert (=> b!784554 (= c!87170 (= lt!349638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784555 () Bool)

(declare-fun res!531034 () Bool)

(assert (=> b!784555 (=> (not res!531034) (not e!436164))))

(declare-fun lt!349639 () array!42735)

(assert (=> b!784555 (= res!531034 (= (seekEntryOrOpen!0 lt!349629 lt!349639 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349629 lt!349639 mask!3328)))))

(declare-fun b!784556 () Bool)

(assert (=> b!784556 (= e!436172 e!436173)))

(declare-fun res!531030 () Bool)

(assert (=> b!784556 (=> res!531030 e!436173)))

(assert (=> b!784556 (= res!531030 (not (= lt!349634 lt!349636)))))

(assert (=> b!784556 (= lt!349634 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20456 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784557 () Bool)

(declare-fun Unit!27082 () Unit!27080)

(assert (=> b!784557 (= e!436166 Unit!27082)))

(assert (=> b!784557 false))

(declare-fun b!784558 () Bool)

(declare-fun res!531026 () Bool)

(assert (=> b!784558 (=> (not res!531026) (not e!436171))))

(assert (=> b!784558 (= res!531026 (validKeyInArray!0 (select (arr!20456 a!3186) j!159)))))

(declare-fun b!784559 () Bool)

(declare-fun Unit!27083 () Unit!27080)

(assert (=> b!784559 (= e!436166 Unit!27083)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!784560 () Bool)

(assert (=> b!784560 (= e!436169 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20456 a!3186) j!159) a!3186 mask!3328) lt!349636))))

(declare-fun b!784561 () Bool)

(declare-fun e!436167 () Bool)

(assert (=> b!784561 (= e!436167 e!436170)))

(declare-fun res!531031 () Bool)

(assert (=> b!784561 (=> (not res!531031) (not e!436170))))

(declare-fun lt!349631 () SeekEntryResult!8053)

(assert (=> b!784561 (= res!531031 (= lt!349631 lt!349635))))

(assert (=> b!784561 (= lt!349635 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349629 lt!349639 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784561 (= lt!349631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349629 mask!3328) lt!349629 lt!349639 mask!3328))))

(assert (=> b!784561 (= lt!349629 (select (store (arr!20456 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784561 (= lt!349639 (array!42736 (store (arr!20456 a!3186) i!1173 k0!2102) (size!20877 a!3186)))))

(declare-fun b!784562 () Bool)

(declare-fun res!531035 () Bool)

(assert (=> b!784562 (=> (not res!531035) (not e!436167))))

(assert (=> b!784562 (= res!531035 e!436163)))

(declare-fun c!87171 () Bool)

(assert (=> b!784562 (= c!87171 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784563 () Bool)

(assert (=> b!784563 (= e!436165 e!436167)))

(declare-fun res!531021 () Bool)

(assert (=> b!784563 (=> (not res!531021) (not e!436167))))

(assert (=> b!784563 (= res!531021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20456 a!3186) j!159) mask!3328) (select (arr!20456 a!3186) j!159) a!3186 mask!3328) lt!349637))))

(assert (=> b!784563 (= lt!349637 (Intermediate!8053 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784564 () Bool)

(declare-fun res!531032 () Bool)

(assert (=> b!784564 (=> (not res!531032) (not e!436165))))

(assert (=> b!784564 (= res!531032 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20877 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20877 a!3186))))))

(declare-fun b!784565 () Bool)

(declare-fun res!531023 () Bool)

(assert (=> b!784565 (=> (not res!531023) (not e!436167))))

(assert (=> b!784565 (= res!531023 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20456 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67676 res!531029) b!784547))

(assert (= (and b!784547 res!531033) b!784558))

(assert (= (and b!784558 res!531026) b!784551))

(assert (= (and b!784551 res!531025) b!784548))

(assert (= (and b!784548 res!531022) b!784549))

(assert (= (and b!784549 res!531036) b!784546))

(assert (= (and b!784546 res!531024) b!784544))

(assert (= (and b!784544 res!531019) b!784564))

(assert (= (and b!784564 res!531032) b!784563))

(assert (= (and b!784563 res!531021) b!784565))

(assert (= (and b!784565 res!531023) b!784562))

(assert (= (and b!784562 c!87171) b!784553))

(assert (= (and b!784562 (not c!87171)) b!784550))

(assert (= (and b!784562 res!531035) b!784561))

(assert (= (and b!784561 res!531031) b!784543))

(assert (= (and b!784543 res!531020) b!784560))

(assert (= (and b!784543 (not res!531028)) b!784556))

(assert (= (and b!784556 (not res!531030)) b!784552))

(assert (= (and b!784552 (not res!531027)) b!784554))

(assert (= (and b!784554 c!87170) b!784557))

(assert (= (and b!784554 (not c!87170)) b!784559))

(assert (= (and b!784554 res!531018) b!784555))

(assert (= (and b!784555 res!531034) b!784545))

(declare-fun m!726267 () Bool)

(assert (=> b!784543 m!726267))

(assert (=> b!784543 m!726267))

(declare-fun m!726269 () Bool)

(assert (=> b!784543 m!726269))

(declare-fun m!726271 () Bool)

(assert (=> b!784543 m!726271))

(declare-fun m!726273 () Bool)

(assert (=> b!784543 m!726273))

(declare-fun m!726275 () Bool)

(assert (=> b!784552 m!726275))

(declare-fun m!726277 () Bool)

(assert (=> b!784552 m!726277))

(declare-fun m!726279 () Bool)

(assert (=> b!784544 m!726279))

(assert (=> b!784563 m!726267))

(assert (=> b!784563 m!726267))

(declare-fun m!726281 () Bool)

(assert (=> b!784563 m!726281))

(assert (=> b!784563 m!726281))

(assert (=> b!784563 m!726267))

(declare-fun m!726283 () Bool)

(assert (=> b!784563 m!726283))

(declare-fun m!726285 () Bool)

(assert (=> b!784548 m!726285))

(declare-fun m!726287 () Bool)

(assert (=> b!784546 m!726287))

(assert (=> b!784556 m!726267))

(assert (=> b!784556 m!726267))

(declare-fun m!726289 () Bool)

(assert (=> b!784556 m!726289))

(declare-fun m!726291 () Bool)

(assert (=> start!67676 m!726291))

(declare-fun m!726293 () Bool)

(assert (=> start!67676 m!726293))

(declare-fun m!726295 () Bool)

(assert (=> b!784555 m!726295))

(declare-fun m!726297 () Bool)

(assert (=> b!784555 m!726297))

(assert (=> b!784550 m!726267))

(assert (=> b!784550 m!726267))

(assert (=> b!784550 m!726289))

(assert (=> b!784558 m!726267))

(assert (=> b!784558 m!726267))

(declare-fun m!726299 () Bool)

(assert (=> b!784558 m!726299))

(declare-fun m!726301 () Bool)

(assert (=> b!784561 m!726301))

(declare-fun m!726303 () Bool)

(assert (=> b!784561 m!726303))

(declare-fun m!726305 () Bool)

(assert (=> b!784561 m!726305))

(assert (=> b!784561 m!726301))

(assert (=> b!784561 m!726275))

(declare-fun m!726307 () Bool)

(assert (=> b!784561 m!726307))

(declare-fun m!726309 () Bool)

(assert (=> b!784551 m!726309))

(assert (=> b!784553 m!726267))

(assert (=> b!784553 m!726267))

(declare-fun m!726311 () Bool)

(assert (=> b!784553 m!726311))

(declare-fun m!726313 () Bool)

(assert (=> b!784549 m!726313))

(assert (=> b!784560 m!726267))

(assert (=> b!784560 m!726267))

(declare-fun m!726315 () Bool)

(assert (=> b!784560 m!726315))

(declare-fun m!726317 () Bool)

(assert (=> b!784565 m!726317))

(check-sat (not b!784548) (not b!784560) (not b!784555) (not b!784563) (not start!67676) (not b!784549) (not b!784556) (not b!784558) (not b!784550) (not b!784546) (not b!784543) (not b!784544) (not b!784553) (not b!784551) (not b!784561))
(check-sat)
