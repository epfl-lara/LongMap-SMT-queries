; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65664 () Bool)

(assert start!65664)

(declare-fun b!752321 () Bool)

(declare-fun e!419656 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!752321 (= e!419656 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!419651 () Bool)

(assert (=> b!752321 e!419651))

(declare-fun res!508044 () Bool)

(assert (=> b!752321 (=> (not res!508044) (not e!419651))))

(declare-fun lt!334649 () (_ BitVec 64))

(assert (=> b!752321 (= res!508044 (= lt!334649 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25908 0))(
  ( (Unit!25909) )
))
(declare-fun lt!334638 () Unit!25908)

(declare-fun e!419647 () Unit!25908)

(assert (=> b!752321 (= lt!334638 e!419647)))

(declare-fun c!82521 () Bool)

(assert (=> b!752321 (= c!82521 (= lt!334649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752322 () Bool)

(declare-fun Unit!25910 () Unit!25908)

(assert (=> b!752322 (= e!419647 Unit!25910)))

(declare-fun b!752323 () Bool)

(declare-fun res!508045 () Bool)

(declare-fun e!419648 () Bool)

(assert (=> b!752323 (=> (not res!508045) (not e!419648))))

(declare-fun e!419655 () Bool)

(assert (=> b!752323 (= res!508045 e!419655)))

(declare-fun c!82522 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752323 (= c!82522 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752324 () Bool)

(declare-fun res!508054 () Bool)

(declare-fun e!419657 () Bool)

(assert (=> b!752324 (=> (not res!508054) (not e!419657))))

(declare-datatypes ((array!41837 0))(
  ( (array!41838 (arr!20032 (Array (_ BitVec 32) (_ BitVec 64))) (size!20453 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41837)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752324 (= res!508054 (and (= (size!20453 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20453 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20453 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752325 () Bool)

(declare-fun e!419646 () Bool)

(assert (=> b!752325 (= e!419646 e!419648)))

(declare-fun res!508057 () Bool)

(assert (=> b!752325 (=> (not res!508057) (not e!419648))))

(declare-datatypes ((SeekEntryResult!7632 0))(
  ( (MissingZero!7632 (index!32896 (_ BitVec 32))) (Found!7632 (index!32897 (_ BitVec 32))) (Intermediate!7632 (undefined!8444 Bool) (index!32898 (_ BitVec 32)) (x!63814 (_ BitVec 32))) (Undefined!7632) (MissingVacant!7632 (index!32899 (_ BitVec 32))) )
))
(declare-fun lt!334640 () SeekEntryResult!7632)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41837 (_ BitVec 32)) SeekEntryResult!7632)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752325 (= res!508057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20032 a!3186) j!159) mask!3328) (select (arr!20032 a!3186) j!159) a!3186 mask!3328) lt!334640))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!752325 (= lt!334640 (Intermediate!7632 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752326 () Bool)

(declare-fun lt!334648 () SeekEntryResult!7632)

(declare-fun lt!334641 () SeekEntryResult!7632)

(assert (=> b!752326 (= e!419651 (= lt!334648 lt!334641))))

(declare-fun b!752327 () Bool)

(declare-fun Unit!25911 () Unit!25908)

(assert (=> b!752327 (= e!419647 Unit!25911)))

(assert (=> b!752327 false))

(declare-fun lt!334643 () SeekEntryResult!7632)

(declare-fun e!419650 () Bool)

(declare-fun b!752328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41837 (_ BitVec 32)) SeekEntryResult!7632)

(assert (=> b!752328 (= e!419650 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20032 a!3186) j!159) a!3186 mask!3328) lt!334643))))

(declare-fun b!752329 () Bool)

(declare-fun e!419653 () Bool)

(assert (=> b!752329 (= e!419653 e!419656)))

(declare-fun res!508049 () Bool)

(assert (=> b!752329 (=> res!508049 e!419656)))

(declare-fun lt!334642 () (_ BitVec 64))

(assert (=> b!752329 (= res!508049 (= lt!334649 lt!334642))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!752329 (= lt!334649 (select (store (arr!20032 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752330 () Bool)

(declare-fun res!508048 () Bool)

(assert (=> b!752330 (=> (not res!508048) (not e!419646))))

(declare-datatypes ((List!14034 0))(
  ( (Nil!14031) (Cons!14030 (h!15102 (_ BitVec 64)) (t!20349 List!14034)) )
))
(declare-fun arrayNoDuplicates!0 (array!41837 (_ BitVec 32) List!14034) Bool)

(assert (=> b!752330 (= res!508048 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14031))))

(declare-fun b!752331 () Bool)

(declare-fun e!419654 () Bool)

(assert (=> b!752331 (= e!419654 e!419653)))

(declare-fun res!508046 () Bool)

(assert (=> b!752331 (=> res!508046 e!419653)))

(assert (=> b!752331 (= res!508046 (not (= lt!334641 lt!334643)))))

(assert (=> b!752331 (= lt!334641 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20032 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752332 () Bool)

(assert (=> b!752332 (= e!419655 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20032 a!3186) j!159) a!3186 mask!3328) (Found!7632 j!159)))))

(declare-fun b!752333 () Bool)

(assert (=> b!752333 (= e!419657 e!419646)))

(declare-fun res!508053 () Bool)

(assert (=> b!752333 (=> (not res!508053) (not e!419646))))

(declare-fun lt!334647 () SeekEntryResult!7632)

(assert (=> b!752333 (= res!508053 (or (= lt!334647 (MissingZero!7632 i!1173)) (= lt!334647 (MissingVacant!7632 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41837 (_ BitVec 32)) SeekEntryResult!7632)

(assert (=> b!752333 (= lt!334647 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752334 () Bool)

(declare-fun res!508056 () Bool)

(assert (=> b!752334 (=> (not res!508056) (not e!419657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752334 (= res!508056 (validKeyInArray!0 k0!2102))))

(declare-fun b!752335 () Bool)

(declare-fun res!508052 () Bool)

(assert (=> b!752335 (=> (not res!508052) (not e!419646))))

(assert (=> b!752335 (= res!508052 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20453 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20453 a!3186))))))

(declare-fun b!752336 () Bool)

(assert (=> b!752336 (= e!419655 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20032 a!3186) j!159) a!3186 mask!3328) lt!334640))))

(declare-fun b!752337 () Bool)

(declare-fun e!419652 () Bool)

(assert (=> b!752337 (= e!419652 (not e!419654))))

(declare-fun res!508055 () Bool)

(assert (=> b!752337 (=> res!508055 e!419654)))

(declare-fun lt!334639 () SeekEntryResult!7632)

(get-info :version)

(assert (=> b!752337 (= res!508055 (or (not ((_ is Intermediate!7632) lt!334639)) (bvslt x!1131 (x!63814 lt!334639)) (not (= x!1131 (x!63814 lt!334639))) (not (= index!1321 (index!32898 lt!334639)))))))

(assert (=> b!752337 e!419650))

(declare-fun res!508043 () Bool)

(assert (=> b!752337 (=> (not res!508043) (not e!419650))))

(assert (=> b!752337 (= res!508043 (= lt!334648 lt!334643))))

(assert (=> b!752337 (= lt!334643 (Found!7632 j!159))))

(assert (=> b!752337 (= lt!334648 (seekEntryOrOpen!0 (select (arr!20032 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41837 (_ BitVec 32)) Bool)

(assert (=> b!752337 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334645 () Unit!25908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25908)

(assert (=> b!752337 (= lt!334645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752338 () Bool)

(declare-fun res!508051 () Bool)

(assert (=> b!752338 (=> (not res!508051) (not e!419646))))

(assert (=> b!752338 (= res!508051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752339 () Bool)

(assert (=> b!752339 (= e!419648 e!419652)))

(declare-fun res!508041 () Bool)

(assert (=> b!752339 (=> (not res!508041) (not e!419652))))

(declare-fun lt!334646 () SeekEntryResult!7632)

(assert (=> b!752339 (= res!508041 (= lt!334646 lt!334639))))

(declare-fun lt!334644 () array!41837)

(assert (=> b!752339 (= lt!334639 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334642 lt!334644 mask!3328))))

(assert (=> b!752339 (= lt!334646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334642 mask!3328) lt!334642 lt!334644 mask!3328))))

(assert (=> b!752339 (= lt!334642 (select (store (arr!20032 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752339 (= lt!334644 (array!41838 (store (arr!20032 a!3186) i!1173 k0!2102) (size!20453 a!3186)))))

(declare-fun b!752340 () Bool)

(declare-fun res!508047 () Bool)

(assert (=> b!752340 (=> (not res!508047) (not e!419651))))

(assert (=> b!752340 (= res!508047 (= (seekEntryOrOpen!0 lt!334642 lt!334644 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334642 lt!334644 mask!3328)))))

(declare-fun b!752341 () Bool)

(declare-fun res!508042 () Bool)

(assert (=> b!752341 (=> (not res!508042) (not e!419657))))

(assert (=> b!752341 (= res!508042 (validKeyInArray!0 (select (arr!20032 a!3186) j!159)))))

(declare-fun res!508050 () Bool)

(assert (=> start!65664 (=> (not res!508050) (not e!419657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65664 (= res!508050 (validMask!0 mask!3328))))

(assert (=> start!65664 e!419657))

(assert (=> start!65664 true))

(declare-fun array_inv!15828 (array!41837) Bool)

(assert (=> start!65664 (array_inv!15828 a!3186)))

(declare-fun b!752342 () Bool)

(declare-fun res!508040 () Bool)

(assert (=> b!752342 (=> (not res!508040) (not e!419648))))

(assert (=> b!752342 (= res!508040 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20032 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752343 () Bool)

(declare-fun res!508058 () Bool)

(assert (=> b!752343 (=> (not res!508058) (not e!419657))))

(declare-fun arrayContainsKey!0 (array!41837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752343 (= res!508058 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65664 res!508050) b!752324))

(assert (= (and b!752324 res!508054) b!752341))

(assert (= (and b!752341 res!508042) b!752334))

(assert (= (and b!752334 res!508056) b!752343))

(assert (= (and b!752343 res!508058) b!752333))

(assert (= (and b!752333 res!508053) b!752338))

(assert (= (and b!752338 res!508051) b!752330))

(assert (= (and b!752330 res!508048) b!752335))

(assert (= (and b!752335 res!508052) b!752325))

(assert (= (and b!752325 res!508057) b!752342))

(assert (= (and b!752342 res!508040) b!752323))

(assert (= (and b!752323 c!82522) b!752336))

(assert (= (and b!752323 (not c!82522)) b!752332))

(assert (= (and b!752323 res!508045) b!752339))

(assert (= (and b!752339 res!508041) b!752337))

(assert (= (and b!752337 res!508043) b!752328))

(assert (= (and b!752337 (not res!508055)) b!752331))

(assert (= (and b!752331 (not res!508046)) b!752329))

(assert (= (and b!752329 (not res!508049)) b!752321))

(assert (= (and b!752321 c!82521) b!752327))

(assert (= (and b!752321 (not c!82521)) b!752322))

(assert (= (and b!752321 res!508044) b!752340))

(assert (= (and b!752340 res!508047) b!752326))

(declare-fun m!701291 () Bool)

(assert (=> b!752329 m!701291))

(declare-fun m!701293 () Bool)

(assert (=> b!752329 m!701293))

(declare-fun m!701295 () Bool)

(assert (=> b!752338 m!701295))

(declare-fun m!701297 () Bool)

(assert (=> b!752336 m!701297))

(assert (=> b!752336 m!701297))

(declare-fun m!701299 () Bool)

(assert (=> b!752336 m!701299))

(declare-fun m!701301 () Bool)

(assert (=> b!752334 m!701301))

(assert (=> b!752337 m!701297))

(assert (=> b!752337 m!701297))

(declare-fun m!701303 () Bool)

(assert (=> b!752337 m!701303))

(declare-fun m!701305 () Bool)

(assert (=> b!752337 m!701305))

(declare-fun m!701307 () Bool)

(assert (=> b!752337 m!701307))

(assert (=> b!752325 m!701297))

(assert (=> b!752325 m!701297))

(declare-fun m!701309 () Bool)

(assert (=> b!752325 m!701309))

(assert (=> b!752325 m!701309))

(assert (=> b!752325 m!701297))

(declare-fun m!701311 () Bool)

(assert (=> b!752325 m!701311))

(declare-fun m!701313 () Bool)

(assert (=> b!752342 m!701313))

(declare-fun m!701315 () Bool)

(assert (=> b!752339 m!701315))

(declare-fun m!701317 () Bool)

(assert (=> b!752339 m!701317))

(assert (=> b!752339 m!701291))

(declare-fun m!701319 () Bool)

(assert (=> b!752339 m!701319))

(assert (=> b!752339 m!701315))

(declare-fun m!701321 () Bool)

(assert (=> b!752339 m!701321))

(declare-fun m!701323 () Bool)

(assert (=> b!752330 m!701323))

(assert (=> b!752341 m!701297))

(assert (=> b!752341 m!701297))

(declare-fun m!701325 () Bool)

(assert (=> b!752341 m!701325))

(declare-fun m!701327 () Bool)

(assert (=> b!752343 m!701327))

(declare-fun m!701329 () Bool)

(assert (=> start!65664 m!701329))

(declare-fun m!701331 () Bool)

(assert (=> start!65664 m!701331))

(assert (=> b!752328 m!701297))

(assert (=> b!752328 m!701297))

(declare-fun m!701333 () Bool)

(assert (=> b!752328 m!701333))

(assert (=> b!752331 m!701297))

(assert (=> b!752331 m!701297))

(declare-fun m!701335 () Bool)

(assert (=> b!752331 m!701335))

(declare-fun m!701337 () Bool)

(assert (=> b!752340 m!701337))

(declare-fun m!701339 () Bool)

(assert (=> b!752340 m!701339))

(assert (=> b!752332 m!701297))

(assert (=> b!752332 m!701297))

(assert (=> b!752332 m!701335))

(declare-fun m!701341 () Bool)

(assert (=> b!752333 m!701341))

(check-sat (not b!752338) (not b!752328) (not b!752333) (not b!752334) (not b!752336) (not b!752340) (not b!752330) (not b!752331) (not b!752341) (not b!752337) (not start!65664) (not b!752339) (not b!752343) (not b!752325) (not b!752332))
(check-sat)
