; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65154 () Bool)

(assert start!65154)

(declare-datatypes ((array!41327 0))(
  ( (array!41328 (arr!19777 (Array (_ BitVec 32) (_ BitVec 64))) (size!20198 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41327)

(declare-fun b!736324 () Bool)

(declare-fun e!411921 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7377 0))(
  ( (MissingZero!7377 (index!31876 (_ BitVec 32))) (Found!7377 (index!31877 (_ BitVec 32))) (Intermediate!7377 (undefined!8189 Bool) (index!31878 (_ BitVec 32)) (x!62879 (_ BitVec 32))) (Undefined!7377) (MissingVacant!7377 (index!31879 (_ BitVec 32))) )
))
(declare-fun lt!326541 () SeekEntryResult!7377)

(declare-fun lt!326532 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41327 (_ BitVec 32)) SeekEntryResult!7377)

(assert (=> b!736324 (= e!411921 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326532 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326541)))))

(declare-fun b!736325 () Bool)

(declare-fun e!411917 () Bool)

(declare-fun e!411926 () Bool)

(assert (=> b!736325 (= e!411917 e!411926)))

(declare-fun res!494849 () Bool)

(assert (=> b!736325 (=> res!494849 e!411926)))

(assert (=> b!736325 (= res!494849 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326532 #b00000000000000000000000000000000) (bvsge lt!326532 (size!20198 a!3186))))))

(declare-datatypes ((Unit!25104 0))(
  ( (Unit!25105) )
))
(declare-fun lt!326540 () Unit!25104)

(declare-fun e!411925 () Unit!25104)

(assert (=> b!736325 (= lt!326540 e!411925)))

(declare-fun c!81123 () Bool)

(declare-fun lt!326538 () Bool)

(assert (=> b!736325 (= c!81123 lt!326538)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736325 (= lt!326538 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736325 (= lt!326532 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736326 () Bool)

(declare-fun Unit!25106 () Unit!25104)

(assert (=> b!736326 (= e!411925 Unit!25106)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326530 () SeekEntryResult!7377)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41327 (_ BitVec 32)) SeekEntryResult!7377)

(assert (=> b!736326 (= lt!326530 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326533 () SeekEntryResult!7377)

(assert (=> b!736326 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326532 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326533)))

(declare-fun b!736327 () Bool)

(declare-fun Unit!25107 () Unit!25104)

(assert (=> b!736327 (= e!411925 Unit!25107)))

(assert (=> b!736327 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326532 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326541)))

(declare-fun b!736329 () Bool)

(assert (=> b!736329 (= e!411926 true)))

(declare-fun lt!326531 () SeekEntryResult!7377)

(declare-fun lt!326536 () array!41327)

(declare-fun lt!326535 () (_ BitVec 64))

(assert (=> b!736329 (= lt!326531 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326532 lt!326535 lt!326536 mask!3328))))

(declare-fun b!736330 () Bool)

(declare-fun res!494858 () Bool)

(declare-fun e!411922 () Bool)

(assert (=> b!736330 (=> (not res!494858) (not e!411922))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736330 (= res!494858 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19777 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736331 () Bool)

(declare-fun res!494856 () Bool)

(declare-fun e!411919 () Bool)

(assert (=> b!736331 (=> (not res!494856) (not e!411919))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736331 (= res!494856 (validKeyInArray!0 k0!2102))))

(declare-fun b!736332 () Bool)

(declare-fun res!494852 () Bool)

(declare-fun e!411918 () Bool)

(assert (=> b!736332 (=> (not res!494852) (not e!411918))))

(assert (=> b!736332 (= res!494852 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20198 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20198 a!3186))))))

(declare-fun b!736333 () Bool)

(declare-fun res!494842 () Bool)

(assert (=> b!736333 (=> (not res!494842) (not e!411918))))

(declare-datatypes ((List!13779 0))(
  ( (Nil!13776) (Cons!13775 (h!14847 (_ BitVec 64)) (t!20094 List!13779)) )
))
(declare-fun arrayNoDuplicates!0 (array!41327 (_ BitVec 32) List!13779) Bool)

(assert (=> b!736333 (= res!494842 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13776))))

(declare-fun b!736334 () Bool)

(declare-fun e!411924 () Bool)

(declare-fun e!411915 () Bool)

(assert (=> b!736334 (= e!411924 e!411915)))

(declare-fun res!494847 () Bool)

(assert (=> b!736334 (=> (not res!494847) (not e!411915))))

(declare-fun lt!326542 () SeekEntryResult!7377)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41327 (_ BitVec 32)) SeekEntryResult!7377)

(assert (=> b!736334 (= res!494847 (= (seekEntryOrOpen!0 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326542))))

(assert (=> b!736334 (= lt!326542 (Found!7377 j!159))))

(declare-fun b!736335 () Bool)

(declare-fun res!494853 () Bool)

(assert (=> b!736335 (=> (not res!494853) (not e!411919))))

(assert (=> b!736335 (= res!494853 (and (= (size!20198 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20198 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20198 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736336 () Bool)

(declare-fun res!494845 () Bool)

(assert (=> b!736336 (=> (not res!494845) (not e!411919))))

(assert (=> b!736336 (= res!494845 (validKeyInArray!0 (select (arr!19777 a!3186) j!159)))))

(declare-fun b!736337 () Bool)

(declare-fun e!411916 () Bool)

(assert (=> b!736337 (= e!411916 (not e!411917))))

(declare-fun res!494850 () Bool)

(assert (=> b!736337 (=> res!494850 e!411917)))

(declare-fun lt!326539 () SeekEntryResult!7377)

(get-info :version)

(assert (=> b!736337 (= res!494850 (or (not ((_ is Intermediate!7377) lt!326539)) (bvsge x!1131 (x!62879 lt!326539))))))

(assert (=> b!736337 (= lt!326533 (Found!7377 j!159))))

(assert (=> b!736337 e!411924))

(declare-fun res!494854 () Bool)

(assert (=> b!736337 (=> (not res!494854) (not e!411924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41327 (_ BitVec 32)) Bool)

(assert (=> b!736337 (= res!494854 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326534 () Unit!25104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25104)

(assert (=> b!736337 (= lt!326534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736328 () Bool)

(declare-fun e!411920 () Bool)

(assert (=> b!736328 (= e!411920 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326541))))

(declare-fun res!494848 () Bool)

(assert (=> start!65154 (=> (not res!494848) (not e!411919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65154 (= res!494848 (validMask!0 mask!3328))))

(assert (=> start!65154 e!411919))

(assert (=> start!65154 true))

(declare-fun array_inv!15573 (array!41327) Bool)

(assert (=> start!65154 (array_inv!15573 a!3186)))

(declare-fun b!736338 () Bool)

(assert (=> b!736338 (= e!411919 e!411918)))

(declare-fun res!494844 () Bool)

(assert (=> b!736338 (=> (not res!494844) (not e!411918))))

(declare-fun lt!326537 () SeekEntryResult!7377)

(assert (=> b!736338 (= res!494844 (or (= lt!326537 (MissingZero!7377 i!1173)) (= lt!326537 (MissingVacant!7377 i!1173))))))

(assert (=> b!736338 (= lt!326537 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736339 () Bool)

(assert (=> b!736339 (= e!411918 e!411922)))

(declare-fun res!494843 () Bool)

(assert (=> b!736339 (=> (not res!494843) (not e!411922))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736339 (= res!494843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19777 a!3186) j!159) mask!3328) (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326541))))

(assert (=> b!736339 (= lt!326541 (Intermediate!7377 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736340 () Bool)

(assert (=> b!736340 (= e!411921 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326532 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326533)))))

(declare-fun b!736341 () Bool)

(assert (=> b!736341 (= e!411915 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) lt!326542))))

(declare-fun b!736342 () Bool)

(assert (=> b!736342 (= e!411920 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19777 a!3186) j!159) a!3186 mask!3328) (Found!7377 j!159)))))

(declare-fun b!736343 () Bool)

(declare-fun res!494855 () Bool)

(assert (=> b!736343 (=> (not res!494855) (not e!411919))))

(declare-fun arrayContainsKey!0 (array!41327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736343 (= res!494855 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736344 () Bool)

(declare-fun res!494841 () Bool)

(assert (=> b!736344 (=> (not res!494841) (not e!411918))))

(assert (=> b!736344 (= res!494841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736345 () Bool)

(assert (=> b!736345 (= e!411922 e!411916)))

(declare-fun res!494846 () Bool)

(assert (=> b!736345 (=> (not res!494846) (not e!411916))))

(declare-fun lt!326543 () SeekEntryResult!7377)

(assert (=> b!736345 (= res!494846 (= lt!326543 lt!326539))))

(assert (=> b!736345 (= lt!326539 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326535 lt!326536 mask!3328))))

(assert (=> b!736345 (= lt!326543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326535 mask!3328) lt!326535 lt!326536 mask!3328))))

(assert (=> b!736345 (= lt!326535 (select (store (arr!19777 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736345 (= lt!326536 (array!41328 (store (arr!19777 a!3186) i!1173 k0!2102) (size!20198 a!3186)))))

(declare-fun b!736346 () Bool)

(declare-fun res!494857 () Bool)

(assert (=> b!736346 (=> (not res!494857) (not e!411922))))

(assert (=> b!736346 (= res!494857 e!411920)))

(declare-fun c!81122 () Bool)

(assert (=> b!736346 (= c!81122 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736347 () Bool)

(declare-fun res!494851 () Bool)

(assert (=> b!736347 (=> res!494851 e!411926)))

(assert (=> b!736347 (= res!494851 e!411921)))

(declare-fun c!81124 () Bool)

(assert (=> b!736347 (= c!81124 lt!326538)))

(assert (= (and start!65154 res!494848) b!736335))

(assert (= (and b!736335 res!494853) b!736336))

(assert (= (and b!736336 res!494845) b!736331))

(assert (= (and b!736331 res!494856) b!736343))

(assert (= (and b!736343 res!494855) b!736338))

(assert (= (and b!736338 res!494844) b!736344))

(assert (= (and b!736344 res!494841) b!736333))

(assert (= (and b!736333 res!494842) b!736332))

(assert (= (and b!736332 res!494852) b!736339))

(assert (= (and b!736339 res!494843) b!736330))

(assert (= (and b!736330 res!494858) b!736346))

(assert (= (and b!736346 c!81122) b!736328))

(assert (= (and b!736346 (not c!81122)) b!736342))

(assert (= (and b!736346 res!494857) b!736345))

(assert (= (and b!736345 res!494846) b!736337))

(assert (= (and b!736337 res!494854) b!736334))

(assert (= (and b!736334 res!494847) b!736341))

(assert (= (and b!736337 (not res!494850)) b!736325))

(assert (= (and b!736325 c!81123) b!736327))

(assert (= (and b!736325 (not c!81123)) b!736326))

(assert (= (and b!736325 (not res!494849)) b!736347))

(assert (= (and b!736347 c!81124) b!736324))

(assert (= (and b!736347 (not c!81124)) b!736340))

(assert (= (and b!736347 (not res!494851)) b!736329))

(declare-fun m!688483 () Bool)

(assert (=> start!65154 m!688483))

(declare-fun m!688485 () Bool)

(assert (=> start!65154 m!688485))

(declare-fun m!688487 () Bool)

(assert (=> b!736325 m!688487))

(declare-fun m!688489 () Bool)

(assert (=> b!736333 m!688489))

(declare-fun m!688491 () Bool)

(assert (=> b!736326 m!688491))

(assert (=> b!736326 m!688491))

(declare-fun m!688493 () Bool)

(assert (=> b!736326 m!688493))

(assert (=> b!736326 m!688491))

(declare-fun m!688495 () Bool)

(assert (=> b!736326 m!688495))

(assert (=> b!736334 m!688491))

(assert (=> b!736334 m!688491))

(declare-fun m!688497 () Bool)

(assert (=> b!736334 m!688497))

(assert (=> b!736341 m!688491))

(assert (=> b!736341 m!688491))

(declare-fun m!688499 () Bool)

(assert (=> b!736341 m!688499))

(assert (=> b!736342 m!688491))

(assert (=> b!736342 m!688491))

(assert (=> b!736342 m!688493))

(declare-fun m!688501 () Bool)

(assert (=> b!736344 m!688501))

(declare-fun m!688503 () Bool)

(assert (=> b!736343 m!688503))

(assert (=> b!736328 m!688491))

(assert (=> b!736328 m!688491))

(declare-fun m!688505 () Bool)

(assert (=> b!736328 m!688505))

(declare-fun m!688507 () Bool)

(assert (=> b!736330 m!688507))

(assert (=> b!736340 m!688491))

(assert (=> b!736340 m!688491))

(assert (=> b!736340 m!688495))

(declare-fun m!688509 () Bool)

(assert (=> b!736338 m!688509))

(declare-fun m!688511 () Bool)

(assert (=> b!736329 m!688511))

(declare-fun m!688513 () Bool)

(assert (=> b!736331 m!688513))

(declare-fun m!688515 () Bool)

(assert (=> b!736345 m!688515))

(declare-fun m!688517 () Bool)

(assert (=> b!736345 m!688517))

(declare-fun m!688519 () Bool)

(assert (=> b!736345 m!688519))

(assert (=> b!736345 m!688515))

(declare-fun m!688521 () Bool)

(assert (=> b!736345 m!688521))

(declare-fun m!688523 () Bool)

(assert (=> b!736345 m!688523))

(assert (=> b!736327 m!688491))

(assert (=> b!736327 m!688491))

(declare-fun m!688525 () Bool)

(assert (=> b!736327 m!688525))

(assert (=> b!736324 m!688491))

(assert (=> b!736324 m!688491))

(assert (=> b!736324 m!688525))

(assert (=> b!736339 m!688491))

(assert (=> b!736339 m!688491))

(declare-fun m!688527 () Bool)

(assert (=> b!736339 m!688527))

(assert (=> b!736339 m!688527))

(assert (=> b!736339 m!688491))

(declare-fun m!688529 () Bool)

(assert (=> b!736339 m!688529))

(declare-fun m!688531 () Bool)

(assert (=> b!736337 m!688531))

(declare-fun m!688533 () Bool)

(assert (=> b!736337 m!688533))

(assert (=> b!736336 m!688491))

(assert (=> b!736336 m!688491))

(declare-fun m!688535 () Bool)

(assert (=> b!736336 m!688535))

(check-sat (not b!736331) (not b!736343) (not b!736334) (not b!736325) (not start!65154) (not b!736340) (not b!736341) (not b!736338) (not b!736326) (not b!736333) (not b!736337) (not b!736342) (not b!736339) (not b!736324) (not b!736329) (not b!736327) (not b!736344) (not b!736345) (not b!736328) (not b!736336))
(check-sat)
