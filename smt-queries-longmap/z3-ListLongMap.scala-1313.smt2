; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26436 () Bool)

(assert start!26436)

(declare-fun b!274363 () Bool)

(declare-fun res!138336 () Bool)

(declare-fun e!175678 () Bool)

(assert (=> b!274363 (=> (not res!138336) (not e!175678))))

(declare-datatypes ((array!13532 0))(
  ( (array!13533 (arr!6415 (Array (_ BitVec 32) (_ BitVec 64))) (size!6767 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13532)

(declare-datatypes ((List!4136 0))(
  ( (Nil!4133) (Cons!4132 (h!4799 (_ BitVec 64)) (t!9210 List!4136)) )
))
(declare-fun arrayNoDuplicates!0 (array!13532 (_ BitVec 32) List!4136) Bool)

(assert (=> b!274363 (= res!138336 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4133))))

(declare-fun b!274364 () Bool)

(declare-fun e!175679 () Bool)

(declare-fun e!175675 () Bool)

(assert (=> b!274364 (= e!175679 (not e!175675))))

(declare-fun res!138331 () Bool)

(assert (=> b!274364 (=> res!138331 e!175675)))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274364 (= res!138331 (or (bvsge startIndex!26 (bvsub (size!6767 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13532 (_ BitVec 32)) Bool)

(assert (=> b!274364 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8615 0))(
  ( (Unit!8616) )
))
(declare-fun lt!136938 () Unit!8615)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8615)

(assert (=> b!274364 (= lt!136938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136936 () array!13532)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1538 0))(
  ( (MissingZero!1538 (index!8322 (_ BitVec 32))) (Found!1538 (index!8323 (_ BitVec 32))) (Intermediate!1538 (undefined!2350 Bool) (index!8324 (_ BitVec 32)) (x!26727 (_ BitVec 32))) (Undefined!1538) (MissingVacant!1538 (index!8325 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13532 (_ BitVec 32)) SeekEntryResult!1538)

(assert (=> b!274364 (= (seekEntryOrOpen!0 (select (arr!6415 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6415 a!3325) i!1267 k0!2581) startIndex!26) lt!136936 mask!3868))))

(declare-fun lt!136935 () Unit!8615)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13532 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8615)

(assert (=> b!274364 (= lt!136935 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274364 (arrayNoDuplicates!0 lt!136936 #b00000000000000000000000000000000 Nil!4133)))

(declare-fun lt!136934 () Unit!8615)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4136) Unit!8615)

(assert (=> b!274364 (= lt!136934 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4133))))

(declare-fun b!274365 () Bool)

(assert (=> b!274365 (= e!175675 true)))

(assert (=> b!274365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136936 mask!3868)))

(declare-fun lt!136937 () Unit!8615)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13532 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8615)

(assert (=> b!274365 (= lt!136937 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274366 () Bool)

(declare-fun res!138327 () Bool)

(assert (=> b!274366 (=> (not res!138327) (not e!175678))))

(declare-fun arrayContainsKey!0 (array!13532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274366 (= res!138327 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138329 () Bool)

(assert (=> start!26436 (=> (not res!138329) (not e!175678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26436 (= res!138329 (validMask!0 mask!3868))))

(assert (=> start!26436 e!175678))

(declare-fun array_inv!4365 (array!13532) Bool)

(assert (=> start!26436 (array_inv!4365 a!3325)))

(assert (=> start!26436 true))

(declare-fun b!274367 () Bool)

(declare-fun e!175677 () Bool)

(assert (=> b!274367 (= e!175677 e!175679)))

(declare-fun res!138333 () Bool)

(assert (=> b!274367 (=> (not res!138333) (not e!175679))))

(assert (=> b!274367 (= res!138333 (not (= startIndex!26 i!1267)))))

(assert (=> b!274367 (= lt!136936 (array!13533 (store (arr!6415 a!3325) i!1267 k0!2581) (size!6767 a!3325)))))

(declare-fun b!274368 () Bool)

(declare-fun res!138330 () Bool)

(assert (=> b!274368 (=> (not res!138330) (not e!175678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274368 (= res!138330 (validKeyInArray!0 k0!2581))))

(declare-fun b!274369 () Bool)

(assert (=> b!274369 (= e!175678 e!175677)))

(declare-fun res!138332 () Bool)

(assert (=> b!274369 (=> (not res!138332) (not e!175677))))

(declare-fun lt!136933 () SeekEntryResult!1538)

(assert (=> b!274369 (= res!138332 (or (= lt!136933 (MissingZero!1538 i!1267)) (= lt!136933 (MissingVacant!1538 i!1267))))))

(assert (=> b!274369 (= lt!136933 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274370 () Bool)

(declare-fun res!138335 () Bool)

(assert (=> b!274370 (=> (not res!138335) (not e!175679))))

(assert (=> b!274370 (= res!138335 (validKeyInArray!0 (select (arr!6415 a!3325) startIndex!26)))))

(declare-fun b!274371 () Bool)

(declare-fun res!138328 () Bool)

(assert (=> b!274371 (=> (not res!138328) (not e!175678))))

(assert (=> b!274371 (= res!138328 (and (= (size!6767 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6767 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6767 a!3325))))))

(declare-fun b!274372 () Bool)

(declare-fun res!138334 () Bool)

(assert (=> b!274372 (=> (not res!138334) (not e!175677))))

(assert (=> b!274372 (= res!138334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26436 res!138329) b!274371))

(assert (= (and b!274371 res!138328) b!274368))

(assert (= (and b!274368 res!138330) b!274363))

(assert (= (and b!274363 res!138336) b!274366))

(assert (= (and b!274366 res!138327) b!274369))

(assert (= (and b!274369 res!138332) b!274372))

(assert (= (and b!274372 res!138334) b!274367))

(assert (= (and b!274367 res!138333) b!274370))

(assert (= (and b!274370 res!138335) b!274364))

(assert (= (and b!274364 (not res!138331)) b!274365))

(declare-fun m!290003 () Bool)

(assert (=> start!26436 m!290003))

(declare-fun m!290005 () Bool)

(assert (=> start!26436 m!290005))

(declare-fun m!290007 () Bool)

(assert (=> b!274367 m!290007))

(declare-fun m!290009 () Bool)

(assert (=> b!274368 m!290009))

(declare-fun m!290011 () Bool)

(assert (=> b!274372 m!290011))

(declare-fun m!290013 () Bool)

(assert (=> b!274369 m!290013))

(declare-fun m!290015 () Bool)

(assert (=> b!274366 m!290015))

(declare-fun m!290017 () Bool)

(assert (=> b!274365 m!290017))

(declare-fun m!290019 () Bool)

(assert (=> b!274365 m!290019))

(declare-fun m!290021 () Bool)

(assert (=> b!274363 m!290021))

(declare-fun m!290023 () Bool)

(assert (=> b!274364 m!290023))

(assert (=> b!274364 m!290007))

(declare-fun m!290025 () Bool)

(assert (=> b!274364 m!290025))

(declare-fun m!290027 () Bool)

(assert (=> b!274364 m!290027))

(declare-fun m!290029 () Bool)

(assert (=> b!274364 m!290029))

(assert (=> b!274364 m!290027))

(declare-fun m!290031 () Bool)

(assert (=> b!274364 m!290031))

(declare-fun m!290033 () Bool)

(assert (=> b!274364 m!290033))

(assert (=> b!274364 m!290033))

(declare-fun m!290035 () Bool)

(assert (=> b!274364 m!290035))

(declare-fun m!290037 () Bool)

(assert (=> b!274364 m!290037))

(declare-fun m!290039 () Bool)

(assert (=> b!274364 m!290039))

(assert (=> b!274370 m!290027))

(assert (=> b!274370 m!290027))

(declare-fun m!290041 () Bool)

(assert (=> b!274370 m!290041))

(check-sat (not b!274365) (not b!274364) (not b!274372) (not start!26436) (not b!274370) (not b!274369) (not b!274366) (not b!274368) (not b!274363))
(check-sat)
