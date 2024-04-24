; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27222 () Bool)

(assert start!27222)

(declare-fun b!281870 () Bool)

(declare-fun res!144920 () Bool)

(declare-fun e!179065 () Bool)

(assert (=> b!281870 (=> (not res!144920) (not e!179065))))

(declare-datatypes ((array!14039 0))(
  ( (array!14040 (arr!6661 (Array (_ BitVec 32) (_ BitVec 64))) (size!7013 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14039)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281870 (= res!144920 (and (= (size!7013 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7013 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7013 a!3325))))))

(declare-fun b!281871 () Bool)

(declare-fun res!144921 () Bool)

(assert (=> b!281871 (=> (not res!144921) (not e!179065))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281871 (= res!144921 (validKeyInArray!0 k0!2581))))

(declare-fun b!281872 () Bool)

(declare-fun res!144919 () Bool)

(assert (=> b!281872 (=> (not res!144919) (not e!179065))))

(declare-fun arrayContainsKey!0 (array!14039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281872 (= res!144919 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281873 () Bool)

(declare-fun e!179064 () Bool)

(assert (=> b!281873 (= e!179064 (not true))))

(declare-fun lt!139272 () array!14039)

(declare-datatypes ((SeekEntryResult!1784 0))(
  ( (MissingZero!1784 (index!9306 (_ BitVec 32))) (Found!1784 (index!9307 (_ BitVec 32))) (Intermediate!1784 (undefined!2596 Bool) (index!9308 (_ BitVec 32)) (x!27638 (_ BitVec 32))) (Undefined!1784) (MissingVacant!1784 (index!9309 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14039 (_ BitVec 32)) SeekEntryResult!1784)

(assert (=> b!281873 (= (seekEntryOrOpen!0 (select (arr!6661 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6661 a!3325) i!1267 k0!2581) startIndex!26) lt!139272 mask!3868))))

(declare-datatypes ((Unit!8898 0))(
  ( (Unit!8899) )
))
(declare-fun lt!139270 () Unit!8898)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14039 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8898)

(assert (=> b!281873 (= lt!139270 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4382 0))(
  ( (Nil!4379) (Cons!4378 (h!5048 (_ BitVec 64)) (t!9456 List!4382)) )
))
(declare-fun arrayNoDuplicates!0 (array!14039 (_ BitVec 32) List!4382) Bool)

(assert (=> b!281873 (arrayNoDuplicates!0 lt!139272 #b00000000000000000000000000000000 Nil!4379)))

(declare-fun lt!139271 () Unit!8898)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4382) Unit!8898)

(assert (=> b!281873 (= lt!139271 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4379))))

(declare-fun b!281874 () Bool)

(declare-fun res!144917 () Bool)

(assert (=> b!281874 (=> (not res!144917) (not e!179064))))

(assert (=> b!281874 (= res!144917 (validKeyInArray!0 (select (arr!6661 a!3325) startIndex!26)))))

(declare-fun b!281875 () Bool)

(declare-fun e!179063 () Bool)

(assert (=> b!281875 (= e!179063 e!179064)))

(declare-fun res!144915 () Bool)

(assert (=> b!281875 (=> (not res!144915) (not e!179064))))

(assert (=> b!281875 (= res!144915 (not (= startIndex!26 i!1267)))))

(assert (=> b!281875 (= lt!139272 (array!14040 (store (arr!6661 a!3325) i!1267 k0!2581) (size!7013 a!3325)))))

(declare-fun res!144916 () Bool)

(assert (=> start!27222 (=> (not res!144916) (not e!179065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27222 (= res!144916 (validMask!0 mask!3868))))

(assert (=> start!27222 e!179065))

(declare-fun array_inv!4611 (array!14039) Bool)

(assert (=> start!27222 (array_inv!4611 a!3325)))

(assert (=> start!27222 true))

(declare-fun b!281876 () Bool)

(assert (=> b!281876 (= e!179065 e!179063)))

(declare-fun res!144914 () Bool)

(assert (=> b!281876 (=> (not res!144914) (not e!179063))))

(declare-fun lt!139269 () SeekEntryResult!1784)

(assert (=> b!281876 (= res!144914 (or (= lt!139269 (MissingZero!1784 i!1267)) (= lt!139269 (MissingVacant!1784 i!1267))))))

(assert (=> b!281876 (= lt!139269 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281877 () Bool)

(declare-fun res!144918 () Bool)

(assert (=> b!281877 (=> (not res!144918) (not e!179063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14039 (_ BitVec 32)) Bool)

(assert (=> b!281877 (= res!144918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281878 () Bool)

(declare-fun res!144913 () Bool)

(assert (=> b!281878 (=> (not res!144913) (not e!179065))))

(assert (=> b!281878 (= res!144913 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4379))))

(assert (= (and start!27222 res!144916) b!281870))

(assert (= (and b!281870 res!144920) b!281871))

(assert (= (and b!281871 res!144921) b!281878))

(assert (= (and b!281878 res!144913) b!281872))

(assert (= (and b!281872 res!144919) b!281876))

(assert (= (and b!281876 res!144914) b!281877))

(assert (= (and b!281877 res!144918) b!281875))

(assert (= (and b!281875 res!144915) b!281874))

(assert (= (and b!281874 res!144917) b!281873))

(declare-fun m!296405 () Bool)

(assert (=> b!281873 m!296405))

(assert (=> b!281873 m!296405))

(declare-fun m!296407 () Bool)

(assert (=> b!281873 m!296407))

(declare-fun m!296409 () Bool)

(assert (=> b!281873 m!296409))

(declare-fun m!296411 () Bool)

(assert (=> b!281873 m!296411))

(declare-fun m!296413 () Bool)

(assert (=> b!281873 m!296413))

(declare-fun m!296415 () Bool)

(assert (=> b!281873 m!296415))

(declare-fun m!296417 () Bool)

(assert (=> b!281873 m!296417))

(assert (=> b!281873 m!296411))

(declare-fun m!296419 () Bool)

(assert (=> b!281873 m!296419))

(declare-fun m!296421 () Bool)

(assert (=> b!281878 m!296421))

(declare-fun m!296423 () Bool)

(assert (=> b!281876 m!296423))

(declare-fun m!296425 () Bool)

(assert (=> start!27222 m!296425))

(declare-fun m!296427 () Bool)

(assert (=> start!27222 m!296427))

(declare-fun m!296429 () Bool)

(assert (=> b!281877 m!296429))

(assert (=> b!281874 m!296411))

(assert (=> b!281874 m!296411))

(declare-fun m!296431 () Bool)

(assert (=> b!281874 m!296431))

(declare-fun m!296433 () Bool)

(assert (=> b!281872 m!296433))

(declare-fun m!296435 () Bool)

(assert (=> b!281871 m!296435))

(assert (=> b!281875 m!296409))

(check-sat (not b!281877) (not b!281872) (not b!281874) (not b!281878) (not b!281876) (not b!281871) (not start!27222) (not b!281873))
(check-sat)
