; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26732 () Bool)

(assert start!26732)

(declare-fun b!277482 () Bool)

(declare-datatypes ((Unit!8718 0))(
  ( (Unit!8719) )
))
(declare-fun e!177024 () Unit!8718)

(declare-fun Unit!8720 () Unit!8718)

(assert (=> b!277482 (= e!177024 Unit!8720)))

(declare-fun b!277483 () Bool)

(declare-fun lt!137813 () Unit!8718)

(assert (=> b!277483 (= e!177024 lt!137813)))

(declare-datatypes ((array!13818 0))(
  ( (array!13819 (arr!6558 (Array (_ BitVec 32) (_ BitVec 64))) (size!6911 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13818)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13818 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8718)

(assert (=> b!277483 (= lt!137813 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13818 (_ BitVec 32)) Bool)

(assert (=> b!277483 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13819 (store (arr!6558 a!3325) i!1267 k0!2581) (size!6911 a!3325)) mask!3868)))

(declare-fun b!277484 () Bool)

(declare-fun res!141395 () Bool)

(declare-fun e!177026 () Bool)

(assert (=> b!277484 (=> (not res!141395) (not e!177026))))

(assert (=> b!277484 (= res!141395 (= startIndex!26 i!1267))))

(declare-fun b!277485 () Bool)

(declare-fun res!141397 () Bool)

(declare-fun e!177027 () Bool)

(assert (=> b!277485 (=> (not res!141397) (not e!177027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277485 (= res!141397 (validKeyInArray!0 k0!2581))))

(declare-fun b!277486 () Bool)

(assert (=> b!277486 (= e!177027 e!177026)))

(declare-fun res!141393 () Bool)

(assert (=> b!277486 (=> (not res!141393) (not e!177026))))

(declare-datatypes ((SeekEntryResult!1715 0))(
  ( (MissingZero!1715 (index!9030 (_ BitVec 32))) (Found!1715 (index!9031 (_ BitVec 32))) (Intermediate!1715 (undefined!2527 Bool) (index!9032 (_ BitVec 32)) (x!27295 (_ BitVec 32))) (Undefined!1715) (MissingVacant!1715 (index!9033 (_ BitVec 32))) )
))
(declare-fun lt!137814 () SeekEntryResult!1715)

(assert (=> b!277486 (= res!141393 (or (= lt!137814 (MissingZero!1715 i!1267)) (= lt!137814 (MissingVacant!1715 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13818 (_ BitVec 32)) SeekEntryResult!1715)

(assert (=> b!277486 (= lt!137814 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277487 () Bool)

(assert (=> b!277487 (= e!177026 false)))

(declare-fun lt!137812 () Unit!8718)

(assert (=> b!277487 (= lt!137812 e!177024)))

(declare-fun c!45595 () Bool)

(assert (=> b!277487 (= c!45595 (bvslt startIndex!26 (bvsub (size!6911 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277488 () Bool)

(declare-fun res!141396 () Bool)

(assert (=> b!277488 (=> (not res!141396) (not e!177027))))

(assert (=> b!277488 (= res!141396 (and (= (size!6911 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6911 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6911 a!3325))))))

(declare-fun b!277481 () Bool)

(declare-fun res!141400 () Bool)

(assert (=> b!277481 (=> (not res!141400) (not e!177027))))

(declare-datatypes ((List!4339 0))(
  ( (Nil!4336) (Cons!4335 (h!5002 (_ BitVec 64)) (t!9412 List!4339)) )
))
(declare-fun arrayNoDuplicates!0 (array!13818 (_ BitVec 32) List!4339) Bool)

(assert (=> b!277481 (= res!141400 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4336))))

(declare-fun res!141398 () Bool)

(assert (=> start!26732 (=> (not res!141398) (not e!177027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26732 (= res!141398 (validMask!0 mask!3868))))

(assert (=> start!26732 e!177027))

(declare-fun array_inv!4530 (array!13818) Bool)

(assert (=> start!26732 (array_inv!4530 a!3325)))

(assert (=> start!26732 true))

(declare-fun b!277489 () Bool)

(declare-fun res!141399 () Bool)

(assert (=> b!277489 (=> (not res!141399) (not e!177027))))

(declare-fun arrayContainsKey!0 (array!13818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277489 (= res!141399 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277490 () Bool)

(declare-fun res!141394 () Bool)

(assert (=> b!277490 (=> (not res!141394) (not e!177026))))

(assert (=> b!277490 (= res!141394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26732 res!141398) b!277488))

(assert (= (and b!277488 res!141396) b!277485))

(assert (= (and b!277485 res!141397) b!277481))

(assert (= (and b!277481 res!141400) b!277489))

(assert (= (and b!277489 res!141399) b!277486))

(assert (= (and b!277486 res!141393) b!277490))

(assert (= (and b!277490 res!141394) b!277484))

(assert (= (and b!277484 res!141395) b!277487))

(assert (= (and b!277487 c!45595) b!277483))

(assert (= (and b!277487 (not c!45595)) b!277482))

(declare-fun m!292019 () Bool)

(assert (=> b!277481 m!292019))

(declare-fun m!292021 () Bool)

(assert (=> b!277483 m!292021))

(declare-fun m!292023 () Bool)

(assert (=> b!277483 m!292023))

(declare-fun m!292025 () Bool)

(assert (=> b!277483 m!292025))

(declare-fun m!292027 () Bool)

(assert (=> start!26732 m!292027))

(declare-fun m!292029 () Bool)

(assert (=> start!26732 m!292029))

(declare-fun m!292031 () Bool)

(assert (=> b!277485 m!292031))

(declare-fun m!292033 () Bool)

(assert (=> b!277490 m!292033))

(declare-fun m!292035 () Bool)

(assert (=> b!277486 m!292035))

(declare-fun m!292037 () Bool)

(assert (=> b!277489 m!292037))

(check-sat (not b!277486) (not b!277481) (not start!26732) (not b!277490) (not b!277485) (not b!277483) (not b!277489))
(check-sat)
