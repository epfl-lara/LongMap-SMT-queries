; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26114 () Bool)

(assert start!26114)

(declare-fun b!269459 () Bool)

(declare-datatypes ((Unit!8344 0))(
  ( (Unit!8345) )
))
(declare-fun e!173852 () Unit!8344)

(declare-fun Unit!8346 () Unit!8344)

(assert (=> b!269459 (= e!173852 Unit!8346)))

(declare-fun b!269460 () Bool)

(declare-fun res!133658 () Bool)

(declare-fun e!173854 () Bool)

(assert (=> b!269460 (=> (not res!133658) (not e!173854))))

(declare-datatypes ((array!13211 0))(
  ( (array!13212 (arr!6255 (Array (_ BitVec 32) (_ BitVec 64))) (size!6607 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13211)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269460 (= res!133658 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269461 () Bool)

(declare-fun res!133662 () Bool)

(assert (=> b!269461 (=> (not res!133662) (not e!173854))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269461 (= res!133662 (and (= (size!6607 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6607 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6607 a!3325))))))

(declare-fun b!269462 () Bool)

(declare-fun e!173853 () Bool)

(assert (=> b!269462 (= e!173853 false)))

(declare-fun lt!135203 () Unit!8344)

(assert (=> b!269462 (= lt!135203 e!173852)))

(declare-fun c!45453 () Bool)

(assert (=> b!269462 (= c!45453 (bvslt startIndex!26 (bvsub (size!6607 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269463 () Bool)

(declare-fun res!133661 () Bool)

(assert (=> b!269463 (=> (not res!133661) (not e!173853))))

(assert (=> b!269463 (= res!133661 (= startIndex!26 i!1267))))

(declare-fun b!269465 () Bool)

(assert (=> b!269465 (= e!173854 e!173853)))

(declare-fun res!133660 () Bool)

(assert (=> b!269465 (=> (not res!133660) (not e!173853))))

(declare-datatypes ((SeekEntryResult!1413 0))(
  ( (MissingZero!1413 (index!7822 (_ BitVec 32))) (Found!1413 (index!7823 (_ BitVec 32))) (Intermediate!1413 (undefined!2225 Bool) (index!7824 (_ BitVec 32)) (x!26170 (_ BitVec 32))) (Undefined!1413) (MissingVacant!1413 (index!7825 (_ BitVec 32))) )
))
(declare-fun lt!135204 () SeekEntryResult!1413)

(assert (=> b!269465 (= res!133660 (or (= lt!135204 (MissingZero!1413 i!1267)) (= lt!135204 (MissingVacant!1413 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13211 (_ BitVec 32)) SeekEntryResult!1413)

(assert (=> b!269465 (= lt!135204 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269466 () Bool)

(declare-fun res!133659 () Bool)

(assert (=> b!269466 (=> (not res!133659) (not e!173854))))

(declare-datatypes ((List!4063 0))(
  ( (Nil!4060) (Cons!4059 (h!4726 (_ BitVec 64)) (t!9145 List!4063)) )
))
(declare-fun arrayNoDuplicates!0 (array!13211 (_ BitVec 32) List!4063) Bool)

(assert (=> b!269466 (= res!133659 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4060))))

(declare-fun res!133656 () Bool)

(assert (=> start!26114 (=> (not res!133656) (not e!173854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26114 (= res!133656 (validMask!0 mask!3868))))

(assert (=> start!26114 e!173854))

(declare-fun array_inv!4218 (array!13211) Bool)

(assert (=> start!26114 (array_inv!4218 a!3325)))

(assert (=> start!26114 true))

(declare-fun b!269464 () Bool)

(declare-fun res!133655 () Bool)

(assert (=> b!269464 (=> (not res!133655) (not e!173853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13211 (_ BitVec 32)) Bool)

(assert (=> b!269464 (= res!133655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269467 () Bool)

(declare-fun res!133657 () Bool)

(assert (=> b!269467 (=> (not res!133657) (not e!173854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269467 (= res!133657 (validKeyInArray!0 k0!2581))))

(declare-fun b!269468 () Bool)

(declare-fun lt!135205 () Unit!8344)

(assert (=> b!269468 (= e!173852 lt!135205)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8344)

(assert (=> b!269468 (= lt!135205 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269468 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13212 (store (arr!6255 a!3325) i!1267 k0!2581) (size!6607 a!3325)) mask!3868)))

(assert (= (and start!26114 res!133656) b!269461))

(assert (= (and b!269461 res!133662) b!269467))

(assert (= (and b!269467 res!133657) b!269466))

(assert (= (and b!269466 res!133659) b!269460))

(assert (= (and b!269460 res!133658) b!269465))

(assert (= (and b!269465 res!133660) b!269464))

(assert (= (and b!269464 res!133655) b!269463))

(assert (= (and b!269463 res!133661) b!269462))

(assert (= (and b!269462 c!45453) b!269468))

(assert (= (and b!269462 (not c!45453)) b!269459))

(declare-fun m!285311 () Bool)

(assert (=> b!269466 m!285311))

(declare-fun m!285313 () Bool)

(assert (=> b!269460 m!285313))

(declare-fun m!285315 () Bool)

(assert (=> b!269467 m!285315))

(declare-fun m!285317 () Bool)

(assert (=> b!269465 m!285317))

(declare-fun m!285319 () Bool)

(assert (=> start!26114 m!285319))

(declare-fun m!285321 () Bool)

(assert (=> start!26114 m!285321))

(declare-fun m!285323 () Bool)

(assert (=> b!269464 m!285323))

(declare-fun m!285325 () Bool)

(assert (=> b!269468 m!285325))

(declare-fun m!285327 () Bool)

(assert (=> b!269468 m!285327))

(declare-fun m!285329 () Bool)

(assert (=> b!269468 m!285329))

(check-sat (not b!269464) (not b!269468) (not b!269465) (not b!269467) (not b!269466) (not b!269460) (not start!26114))
(check-sat)
