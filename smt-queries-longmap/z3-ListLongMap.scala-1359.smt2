; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26714 () Bool)

(assert start!26714)

(declare-fun b!277388 () Bool)

(declare-fun res!141296 () Bool)

(declare-fun e!177030 () Bool)

(assert (=> b!277388 (=> (not res!141296) (not e!177030))))

(declare-datatypes ((array!13811 0))(
  ( (array!13812 (arr!6555 (Array (_ BitVec 32) (_ BitVec 64))) (size!6907 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13811)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13811 (_ BitVec 32)) Bool)

(assert (=> b!277388 (= res!141296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277389 () Bool)

(declare-fun res!141301 () Bool)

(declare-fun e!177031 () Bool)

(assert (=> b!277389 (=> (not res!141301) (not e!177031))))

(declare-datatypes ((List!4363 0))(
  ( (Nil!4360) (Cons!4359 (h!5026 (_ BitVec 64)) (t!9445 List!4363)) )
))
(declare-fun arrayNoDuplicates!0 (array!13811 (_ BitVec 32) List!4363) Bool)

(assert (=> b!277389 (= res!141301 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4360))))

(declare-fun b!277390 () Bool)

(assert (=> b!277390 (= e!177030 false)))

(declare-datatypes ((Unit!8740 0))(
  ( (Unit!8741) )
))
(declare-fun lt!137922 () Unit!8740)

(declare-fun e!177029 () Unit!8740)

(assert (=> b!277390 (= lt!137922 e!177029)))

(declare-fun c!45597 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277390 (= c!45597 (bvslt startIndex!26 (bvsub (size!6907 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141297 () Bool)

(assert (=> start!26714 (=> (not res!141297) (not e!177031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26714 (= res!141297 (validMask!0 mask!3868))))

(assert (=> start!26714 e!177031))

(declare-fun array_inv!4518 (array!13811) Bool)

(assert (=> start!26714 (array_inv!4518 a!3325)))

(assert (=> start!26714 true))

(declare-fun b!277391 () Bool)

(declare-fun res!141299 () Bool)

(assert (=> b!277391 (=> (not res!141299) (not e!177031))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277391 (= res!141299 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277392 () Bool)

(assert (=> b!277392 (= e!177031 e!177030)))

(declare-fun res!141302 () Bool)

(assert (=> b!277392 (=> (not res!141302) (not e!177030))))

(declare-datatypes ((SeekEntryResult!1713 0))(
  ( (MissingZero!1713 (index!9022 (_ BitVec 32))) (Found!1713 (index!9023 (_ BitVec 32))) (Intermediate!1713 (undefined!2525 Bool) (index!9024 (_ BitVec 32)) (x!27270 (_ BitVec 32))) (Undefined!1713) (MissingVacant!1713 (index!9025 (_ BitVec 32))) )
))
(declare-fun lt!137923 () SeekEntryResult!1713)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277392 (= res!141302 (or (= lt!137923 (MissingZero!1713 i!1267)) (= lt!137923 (MissingVacant!1713 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13811 (_ BitVec 32)) SeekEntryResult!1713)

(assert (=> b!277392 (= lt!137923 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277393 () Bool)

(declare-fun res!141300 () Bool)

(assert (=> b!277393 (=> (not res!141300) (not e!177031))))

(assert (=> b!277393 (= res!141300 (and (= (size!6907 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6907 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6907 a!3325))))))

(declare-fun b!277394 () Bool)

(declare-fun res!141303 () Bool)

(assert (=> b!277394 (=> (not res!141303) (not e!177030))))

(assert (=> b!277394 (= res!141303 (= startIndex!26 i!1267))))

(declare-fun b!277395 () Bool)

(declare-fun Unit!8742 () Unit!8740)

(assert (=> b!277395 (= e!177029 Unit!8742)))

(declare-fun b!277396 () Bool)

(declare-fun res!141298 () Bool)

(assert (=> b!277396 (=> (not res!141298) (not e!177031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277396 (= res!141298 (validKeyInArray!0 k0!2581))))

(declare-fun b!277397 () Bool)

(declare-fun lt!137921 () Unit!8740)

(assert (=> b!277397 (= e!177029 lt!137921)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8740)

(assert (=> b!277397 (= lt!137921 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277397 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13812 (store (arr!6555 a!3325) i!1267 k0!2581) (size!6907 a!3325)) mask!3868)))

(assert (= (and start!26714 res!141297) b!277393))

(assert (= (and b!277393 res!141300) b!277396))

(assert (= (and b!277396 res!141298) b!277389))

(assert (= (and b!277389 res!141301) b!277391))

(assert (= (and b!277391 res!141299) b!277392))

(assert (= (and b!277392 res!141302) b!277388))

(assert (= (and b!277388 res!141296) b!277394))

(assert (= (and b!277394 res!141303) b!277390))

(assert (= (and b!277390 c!45597) b!277397))

(assert (= (and b!277390 (not c!45597)) b!277395))

(declare-fun m!292451 () Bool)

(assert (=> b!277389 m!292451))

(declare-fun m!292453 () Bool)

(assert (=> b!277388 m!292453))

(declare-fun m!292455 () Bool)

(assert (=> b!277397 m!292455))

(declare-fun m!292457 () Bool)

(assert (=> b!277397 m!292457))

(declare-fun m!292459 () Bool)

(assert (=> b!277397 m!292459))

(declare-fun m!292461 () Bool)

(assert (=> b!277392 m!292461))

(declare-fun m!292463 () Bool)

(assert (=> start!26714 m!292463))

(declare-fun m!292465 () Bool)

(assert (=> start!26714 m!292465))

(declare-fun m!292467 () Bool)

(assert (=> b!277396 m!292467))

(declare-fun m!292469 () Bool)

(assert (=> b!277391 m!292469))

(check-sat (not start!26714) (not b!277392) (not b!277396) (not b!277391) (not b!277397) (not b!277389) (not b!277388))
(check-sat)
