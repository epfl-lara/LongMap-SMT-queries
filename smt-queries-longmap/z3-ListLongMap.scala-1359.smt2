; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26712 () Bool)

(assert start!26712)

(declare-fun res!141296 () Bool)

(declare-fun e!177044 () Bool)

(assert (=> start!26712 (=> (not res!141296) (not e!177044))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26712 (= res!141296 (validMask!0 mask!3868))))

(assert (=> start!26712 e!177044))

(declare-datatypes ((array!13808 0))(
  ( (array!13809 (arr!6553 (Array (_ BitVec 32) (_ BitVec 64))) (size!6905 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13808)

(declare-fun array_inv!4503 (array!13808) Bool)

(assert (=> start!26712 (array_inv!4503 a!3325)))

(assert (=> start!26712 true))

(declare-fun b!277405 () Bool)

(declare-datatypes ((Unit!8717 0))(
  ( (Unit!8718) )
))
(declare-fun e!177043 () Unit!8717)

(declare-fun Unit!8719 () Unit!8717)

(assert (=> b!277405 (= e!177043 Unit!8719)))

(declare-fun b!277406 () Bool)

(declare-fun res!141294 () Bool)

(assert (=> b!277406 (=> (not res!141294) (not e!177044))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277406 (= res!141294 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277407 () Bool)

(declare-fun res!141295 () Bool)

(assert (=> b!277407 (=> (not res!141295) (not e!177044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277407 (= res!141295 (validKeyInArray!0 k0!2581))))

(declare-fun b!277408 () Bool)

(declare-fun res!141298 () Bool)

(assert (=> b!277408 (=> (not res!141298) (not e!177044))))

(declare-datatypes ((List!4274 0))(
  ( (Nil!4271) (Cons!4270 (h!4937 (_ BitVec 64)) (t!9348 List!4274)) )
))
(declare-fun arrayNoDuplicates!0 (array!13808 (_ BitVec 32) List!4274) Bool)

(assert (=> b!277408 (= res!141298 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4271))))

(declare-fun b!277409 () Bool)

(declare-fun e!177042 () Bool)

(assert (=> b!277409 (= e!177042 false)))

(declare-fun lt!137972 () Unit!8717)

(assert (=> b!277409 (= lt!137972 e!177043)))

(declare-fun c!45607 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277409 (= c!45607 (bvslt startIndex!26 (bvsub (size!6905 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277410 () Bool)

(declare-fun res!141300 () Bool)

(assert (=> b!277410 (=> (not res!141300) (not e!177044))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277410 (= res!141300 (and (= (size!6905 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6905 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6905 a!3325))))))

(declare-fun b!277411 () Bool)

(declare-fun res!141297 () Bool)

(assert (=> b!277411 (=> (not res!141297) (not e!177042))))

(assert (=> b!277411 (= res!141297 (= startIndex!26 i!1267))))

(declare-fun b!277412 () Bool)

(declare-fun res!141299 () Bool)

(assert (=> b!277412 (=> (not res!141299) (not e!177042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13808 (_ BitVec 32)) Bool)

(assert (=> b!277412 (= res!141299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277413 () Bool)

(assert (=> b!277413 (= e!177044 e!177042)))

(declare-fun res!141293 () Bool)

(assert (=> b!277413 (=> (not res!141293) (not e!177042))))

(declare-datatypes ((SeekEntryResult!1676 0))(
  ( (MissingZero!1676 (index!8874 (_ BitVec 32))) (Found!1676 (index!8875 (_ BitVec 32))) (Intermediate!1676 (undefined!2488 Bool) (index!8876 (_ BitVec 32)) (x!27233 (_ BitVec 32))) (Undefined!1676) (MissingVacant!1676 (index!8877 (_ BitVec 32))) )
))
(declare-fun lt!137973 () SeekEntryResult!1676)

(assert (=> b!277413 (= res!141293 (or (= lt!137973 (MissingZero!1676 i!1267)) (= lt!137973 (MissingVacant!1676 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13808 (_ BitVec 32)) SeekEntryResult!1676)

(assert (=> b!277413 (= lt!137973 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277414 () Bool)

(declare-fun lt!137971 () Unit!8717)

(assert (=> b!277414 (= e!177043 lt!137971)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13808 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8717)

(assert (=> b!277414 (= lt!137971 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277414 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13809 (store (arr!6553 a!3325) i!1267 k0!2581) (size!6905 a!3325)) mask!3868)))

(assert (= (and start!26712 res!141296) b!277410))

(assert (= (and b!277410 res!141300) b!277407))

(assert (= (and b!277407 res!141295) b!277408))

(assert (= (and b!277408 res!141298) b!277406))

(assert (= (and b!277406 res!141294) b!277413))

(assert (= (and b!277413 res!141293) b!277412))

(assert (= (and b!277412 res!141299) b!277411))

(assert (= (and b!277411 res!141297) b!277409))

(assert (= (and b!277409 c!45607) b!277414))

(assert (= (and b!277409 (not c!45607)) b!277405))

(declare-fun m!292637 () Bool)

(assert (=> b!277413 m!292637))

(declare-fun m!292639 () Bool)

(assert (=> b!277408 m!292639))

(declare-fun m!292641 () Bool)

(assert (=> b!277407 m!292641))

(declare-fun m!292643 () Bool)

(assert (=> b!277406 m!292643))

(declare-fun m!292645 () Bool)

(assert (=> b!277414 m!292645))

(declare-fun m!292647 () Bool)

(assert (=> b!277414 m!292647))

(declare-fun m!292649 () Bool)

(assert (=> b!277414 m!292649))

(declare-fun m!292651 () Bool)

(assert (=> start!26712 m!292651))

(declare-fun m!292653 () Bool)

(assert (=> start!26712 m!292653))

(declare-fun m!292655 () Bool)

(assert (=> b!277412 m!292655))

(check-sat (not b!277408) (not start!26712) (not b!277412) (not b!277413) (not b!277407) (not b!277406) (not b!277414))
(check-sat)
