; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67526 () Bool)

(assert start!67526)

(declare-fun b!781323 () Bool)

(declare-datatypes ((Unit!26912 0))(
  ( (Unit!26913) )
))
(declare-fun e!434551 () Unit!26912)

(declare-fun Unit!26914 () Unit!26912)

(assert (=> b!781323 (= e!434551 Unit!26914)))

(assert (=> b!781323 false))

(declare-fun b!781324 () Bool)

(declare-fun e!434546 () Bool)

(declare-fun e!434547 () Bool)

(assert (=> b!781324 (= e!434546 (not e!434547))))

(declare-fun res!528630 () Bool)

(assert (=> b!781324 (=> res!528630 e!434547)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8011 0))(
  ( (MissingZero!8011 (index!34412 (_ BitVec 32))) (Found!8011 (index!34413 (_ BitVec 32))) (Intermediate!8011 (undefined!8823 Bool) (index!34414 (_ BitVec 32)) (x!65377 (_ BitVec 32))) (Undefined!8011) (MissingVacant!8011 (index!34415 (_ BitVec 32))) )
))
(declare-fun lt!348055 () SeekEntryResult!8011)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!781324 (= res!528630 (or (not ((_ is Intermediate!8011) lt!348055)) (bvslt x!1131 (x!65377 lt!348055)) (not (= x!1131 (x!65377 lt!348055))) (not (= index!1321 (index!34414 lt!348055)))))))

(declare-fun e!434549 () Bool)

(assert (=> b!781324 e!434549))

(declare-fun res!528632 () Bool)

(assert (=> b!781324 (=> (not res!528632) (not e!434549))))

(declare-fun lt!348053 () SeekEntryResult!8011)

(declare-fun lt!348058 () SeekEntryResult!8011)

(assert (=> b!781324 (= res!528632 (= lt!348053 lt!348058))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!781324 (= lt!348058 (Found!8011 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42648 0))(
  ( (array!42649 (arr!20414 (Array (_ BitVec 32) (_ BitVec 64))) (size!20835 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42648)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42648 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!781324 (= lt!348053 (seekEntryOrOpen!0 (select (arr!20414 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42648 (_ BitVec 32)) Bool)

(assert (=> b!781324 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348057 () Unit!26912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26912)

(assert (=> b!781324 (= lt!348057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!434554 () Bool)

(declare-fun b!781325 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42648 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!781325 (= e!434554 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) (Found!8011 j!159)))))

(declare-fun b!781326 () Bool)

(declare-fun res!528642 () Bool)

(declare-fun e!434550 () Bool)

(assert (=> b!781326 (=> (not res!528642) (not e!434550))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781326 (= res!528642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20414 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781327 () Bool)

(declare-fun Unit!26915 () Unit!26912)

(assert (=> b!781327 (= e!434551 Unit!26915)))

(declare-fun b!781328 () Bool)

(assert (=> b!781328 (= e!434550 e!434546)))

(declare-fun res!528643 () Bool)

(assert (=> b!781328 (=> (not res!528643) (not e!434546))))

(declare-fun lt!348050 () SeekEntryResult!8011)

(assert (=> b!781328 (= res!528643 (= lt!348050 lt!348055))))

(declare-fun lt!348059 () (_ BitVec 64))

(declare-fun lt!348051 () array!42648)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42648 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!781328 (= lt!348055 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348059 lt!348051 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781328 (= lt!348050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348059 mask!3328) lt!348059 lt!348051 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!781328 (= lt!348059 (select (store (arr!20414 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781328 (= lt!348051 (array!42649 (store (arr!20414 a!3186) i!1173 k0!2102) (size!20835 a!3186)))))

(declare-fun b!781329 () Bool)

(declare-fun res!528639 () Bool)

(declare-fun e!434548 () Bool)

(assert (=> b!781329 (=> (not res!528639) (not e!434548))))

(declare-fun arrayContainsKey!0 (array!42648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781329 (= res!528639 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781330 () Bool)

(declare-fun res!528634 () Bool)

(declare-fun e!434553 () Bool)

(assert (=> b!781330 (=> (not res!528634) (not e!434553))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781330 (= res!528634 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20835 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20835 a!3186))))))

(declare-fun b!781331 () Bool)

(declare-fun res!528633 () Bool)

(assert (=> b!781331 (=> (not res!528633) (not e!434548))))

(assert (=> b!781331 (= res!528633 (and (= (size!20835 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20835 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20835 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781332 () Bool)

(declare-fun res!528640 () Bool)

(assert (=> b!781332 (=> res!528640 e!434547)))

(assert (=> b!781332 (= res!528640 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348058)))))

(declare-fun b!781333 () Bool)

(declare-fun res!528645 () Bool)

(assert (=> b!781333 (=> (not res!528645) (not e!434553))))

(assert (=> b!781333 (= res!528645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781334 () Bool)

(declare-fun res!528636 () Bool)

(assert (=> b!781334 (=> (not res!528636) (not e!434550))))

(assert (=> b!781334 (= res!528636 e!434554)))

(declare-fun c!86754 () Bool)

(assert (=> b!781334 (= c!86754 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781335 () Bool)

(declare-fun res!528629 () Bool)

(assert (=> b!781335 (=> (not res!528629) (not e!434548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781335 (= res!528629 (validKeyInArray!0 k0!2102))))

(declare-fun lt!348054 () SeekEntryResult!8011)

(declare-fun b!781336 () Bool)

(assert (=> b!781336 (= e!434554 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348054))))

(declare-fun b!781337 () Bool)

(declare-fun res!528631 () Bool)

(assert (=> b!781337 (=> (not res!528631) (not e!434548))))

(assert (=> b!781337 (= res!528631 (validKeyInArray!0 (select (arr!20414 a!3186) j!159)))))

(declare-fun res!528641 () Bool)

(assert (=> start!67526 (=> (not res!528641) (not e!434548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67526 (= res!528641 (validMask!0 mask!3328))))

(assert (=> start!67526 e!434548))

(assert (=> start!67526 true))

(declare-fun array_inv!16297 (array!42648) Bool)

(assert (=> start!67526 (array_inv!16297 a!3186)))

(declare-fun b!781338 () Bool)

(declare-fun res!528644 () Bool)

(assert (=> b!781338 (=> (not res!528644) (not e!434553))))

(declare-datatypes ((List!14455 0))(
  ( (Nil!14452) (Cons!14451 (h!15571 (_ BitVec 64)) (t!20761 List!14455)) )
))
(declare-fun arrayNoDuplicates!0 (array!42648 (_ BitVec 32) List!14455) Bool)

(assert (=> b!781338 (= res!528644 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14452))))

(declare-fun b!781339 () Bool)

(assert (=> b!781339 (= e!434549 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348058))))

(declare-fun b!781340 () Bool)

(assert (=> b!781340 (= e!434547 true)))

(assert (=> b!781340 (= (select (store (arr!20414 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348052 () Unit!26912)

(assert (=> b!781340 (= lt!348052 e!434551)))

(declare-fun c!86753 () Bool)

(assert (=> b!781340 (= c!86753 (= (select (store (arr!20414 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781341 () Bool)

(assert (=> b!781341 (= e!434548 e!434553)))

(declare-fun res!528638 () Bool)

(assert (=> b!781341 (=> (not res!528638) (not e!434553))))

(declare-fun lt!348056 () SeekEntryResult!8011)

(assert (=> b!781341 (= res!528638 (or (= lt!348056 (MissingZero!8011 i!1173)) (= lt!348056 (MissingVacant!8011 i!1173))))))

(assert (=> b!781341 (= lt!348056 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781342 () Bool)

(declare-fun res!528637 () Bool)

(assert (=> b!781342 (=> res!528637 e!434547)))

(assert (=> b!781342 (= res!528637 (= (select (store (arr!20414 a!3186) i!1173 k0!2102) index!1321) lt!348059))))

(declare-fun b!781343 () Bool)

(assert (=> b!781343 (= e!434553 e!434550)))

(declare-fun res!528635 () Bool)

(assert (=> b!781343 (=> (not res!528635) (not e!434550))))

(assert (=> b!781343 (= res!528635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20414 a!3186) j!159) mask!3328) (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348054))))

(assert (=> b!781343 (= lt!348054 (Intermediate!8011 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67526 res!528641) b!781331))

(assert (= (and b!781331 res!528633) b!781337))

(assert (= (and b!781337 res!528631) b!781335))

(assert (= (and b!781335 res!528629) b!781329))

(assert (= (and b!781329 res!528639) b!781341))

(assert (= (and b!781341 res!528638) b!781333))

(assert (= (and b!781333 res!528645) b!781338))

(assert (= (and b!781338 res!528644) b!781330))

(assert (= (and b!781330 res!528634) b!781343))

(assert (= (and b!781343 res!528635) b!781326))

(assert (= (and b!781326 res!528642) b!781334))

(assert (= (and b!781334 c!86754) b!781336))

(assert (= (and b!781334 (not c!86754)) b!781325))

(assert (= (and b!781334 res!528636) b!781328))

(assert (= (and b!781328 res!528643) b!781324))

(assert (= (and b!781324 res!528632) b!781339))

(assert (= (and b!781324 (not res!528630)) b!781332))

(assert (= (and b!781332 (not res!528640)) b!781342))

(assert (= (and b!781342 (not res!528637)) b!781340))

(assert (= (and b!781340 c!86753) b!781323))

(assert (= (and b!781340 (not c!86753)) b!781327))

(declare-fun m!723813 () Bool)

(assert (=> b!781324 m!723813))

(assert (=> b!781324 m!723813))

(declare-fun m!723815 () Bool)

(assert (=> b!781324 m!723815))

(declare-fun m!723817 () Bool)

(assert (=> b!781324 m!723817))

(declare-fun m!723819 () Bool)

(assert (=> b!781324 m!723819))

(declare-fun m!723821 () Bool)

(assert (=> b!781333 m!723821))

(declare-fun m!723823 () Bool)

(assert (=> b!781326 m!723823))

(declare-fun m!723825 () Bool)

(assert (=> b!781328 m!723825))

(declare-fun m!723827 () Bool)

(assert (=> b!781328 m!723827))

(declare-fun m!723829 () Bool)

(assert (=> b!781328 m!723829))

(assert (=> b!781328 m!723827))

(declare-fun m!723831 () Bool)

(assert (=> b!781328 m!723831))

(declare-fun m!723833 () Bool)

(assert (=> b!781328 m!723833))

(assert (=> b!781336 m!723813))

(assert (=> b!781336 m!723813))

(declare-fun m!723835 () Bool)

(assert (=> b!781336 m!723835))

(declare-fun m!723837 () Bool)

(assert (=> b!781329 m!723837))

(assert (=> b!781340 m!723829))

(declare-fun m!723839 () Bool)

(assert (=> b!781340 m!723839))

(assert (=> b!781337 m!723813))

(assert (=> b!781337 m!723813))

(declare-fun m!723841 () Bool)

(assert (=> b!781337 m!723841))

(declare-fun m!723843 () Bool)

(assert (=> b!781341 m!723843))

(assert (=> b!781342 m!723829))

(assert (=> b!781342 m!723839))

(assert (=> b!781343 m!723813))

(assert (=> b!781343 m!723813))

(declare-fun m!723845 () Bool)

(assert (=> b!781343 m!723845))

(assert (=> b!781343 m!723845))

(assert (=> b!781343 m!723813))

(declare-fun m!723847 () Bool)

(assert (=> b!781343 m!723847))

(declare-fun m!723849 () Bool)

(assert (=> b!781335 m!723849))

(declare-fun m!723851 () Bool)

(assert (=> b!781338 m!723851))

(assert (=> b!781325 m!723813))

(assert (=> b!781325 m!723813))

(declare-fun m!723853 () Bool)

(assert (=> b!781325 m!723853))

(assert (=> b!781332 m!723813))

(assert (=> b!781332 m!723813))

(assert (=> b!781332 m!723853))

(assert (=> b!781339 m!723813))

(assert (=> b!781339 m!723813))

(declare-fun m!723855 () Bool)

(assert (=> b!781339 m!723855))

(declare-fun m!723857 () Bool)

(assert (=> start!67526 m!723857))

(declare-fun m!723859 () Bool)

(assert (=> start!67526 m!723859))

(check-sat (not b!781333) (not b!781328) (not b!781325) (not start!67526) (not b!781332) (not b!781338) (not b!781335) (not b!781339) (not b!781329) (not b!781341) (not b!781337) (not b!781336) (not b!781324) (not b!781343))
(check-sat)
