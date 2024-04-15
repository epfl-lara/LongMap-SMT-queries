; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26378 () Bool)

(assert start!26378)

(declare-fun b!273348 () Bool)

(declare-fun res!137394 () Bool)

(declare-fun e!175179 () Bool)

(assert (=> b!273348 (=> (not res!137394) (not e!175179))))

(declare-datatypes ((array!13464 0))(
  ( (array!13465 (arr!6381 (Array (_ BitVec 32) (_ BitVec 64))) (size!6734 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13464)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13464 (_ BitVec 32)) Bool)

(assert (=> b!273348 (= res!137394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!137393 () Bool)

(declare-fun e!175181 () Bool)

(assert (=> start!26378 (=> (not res!137393) (not e!175181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26378 (= res!137393 (validMask!0 mask!3868))))

(assert (=> start!26378 e!175181))

(declare-fun array_inv!4353 (array!13464) Bool)

(assert (=> start!26378 (array_inv!4353 a!3325)))

(assert (=> start!26378 true))

(declare-fun b!273349 () Bool)

(declare-fun e!175182 () Bool)

(assert (=> b!273349 (= e!175182 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273349 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8529 0))(
  ( (Unit!8530) )
))
(declare-fun lt!136233 () Unit!8529)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8529)

(assert (=> b!273349 (= lt!136233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136236 () array!13464)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1538 0))(
  ( (MissingZero!1538 (index!8322 (_ BitVec 32))) (Found!1538 (index!8323 (_ BitVec 32))) (Intermediate!1538 (undefined!2350 Bool) (index!8324 (_ BitVec 32)) (x!26646 (_ BitVec 32))) (Undefined!1538) (MissingVacant!1538 (index!8325 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13464 (_ BitVec 32)) SeekEntryResult!1538)

(assert (=> b!273349 (= (seekEntryOrOpen!0 (select (arr!6381 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6381 a!3325) i!1267 k0!2581) startIndex!26) lt!136236 mask!3868))))

(declare-fun lt!136234 () Unit!8529)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8529)

(assert (=> b!273349 (= lt!136234 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4162 0))(
  ( (Nil!4159) (Cons!4158 (h!4825 (_ BitVec 64)) (t!9235 List!4162)) )
))
(declare-fun arrayNoDuplicates!0 (array!13464 (_ BitVec 32) List!4162) Bool)

(assert (=> b!273349 (arrayNoDuplicates!0 lt!136236 #b00000000000000000000000000000000 Nil!4159)))

(declare-fun lt!136232 () Unit!8529)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4162) Unit!8529)

(assert (=> b!273349 (= lt!136232 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4159))))

(declare-fun b!273350 () Bool)

(declare-fun res!137396 () Bool)

(assert (=> b!273350 (=> (not res!137396) (not e!175181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273350 (= res!137396 (validKeyInArray!0 k0!2581))))

(declare-fun b!273351 () Bool)

(assert (=> b!273351 (= e!175179 e!175182)))

(declare-fun res!137390 () Bool)

(assert (=> b!273351 (=> (not res!137390) (not e!175182))))

(assert (=> b!273351 (= res!137390 (not (= startIndex!26 i!1267)))))

(assert (=> b!273351 (= lt!136236 (array!13465 (store (arr!6381 a!3325) i!1267 k0!2581) (size!6734 a!3325)))))

(declare-fun b!273352 () Bool)

(declare-fun res!137395 () Bool)

(assert (=> b!273352 (=> (not res!137395) (not e!175181))))

(assert (=> b!273352 (= res!137395 (and (= (size!6734 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6734 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6734 a!3325))))))

(declare-fun b!273353 () Bool)

(declare-fun res!137397 () Bool)

(assert (=> b!273353 (=> (not res!137397) (not e!175182))))

(assert (=> b!273353 (= res!137397 (validKeyInArray!0 (select (arr!6381 a!3325) startIndex!26)))))

(declare-fun b!273354 () Bool)

(assert (=> b!273354 (= e!175181 e!175179)))

(declare-fun res!137391 () Bool)

(assert (=> b!273354 (=> (not res!137391) (not e!175179))))

(declare-fun lt!136235 () SeekEntryResult!1538)

(assert (=> b!273354 (= res!137391 (or (= lt!136235 (MissingZero!1538 i!1267)) (= lt!136235 (MissingVacant!1538 i!1267))))))

(assert (=> b!273354 (= lt!136235 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273355 () Bool)

(declare-fun res!137398 () Bool)

(assert (=> b!273355 (=> (not res!137398) (not e!175181))))

(assert (=> b!273355 (= res!137398 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4159))))

(declare-fun b!273356 () Bool)

(declare-fun res!137392 () Bool)

(assert (=> b!273356 (=> (not res!137392) (not e!175181))))

(declare-fun arrayContainsKey!0 (array!13464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273356 (= res!137392 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26378 res!137393) b!273352))

(assert (= (and b!273352 res!137395) b!273350))

(assert (= (and b!273350 res!137396) b!273355))

(assert (= (and b!273355 res!137398) b!273356))

(assert (= (and b!273356 res!137392) b!273354))

(assert (= (and b!273354 res!137391) b!273348))

(assert (= (and b!273348 res!137394) b!273351))

(assert (= (and b!273351 res!137390) b!273353))

(assert (= (and b!273353 res!137397) b!273349))

(declare-fun m!288113 () Bool)

(assert (=> start!26378 m!288113))

(declare-fun m!288115 () Bool)

(assert (=> start!26378 m!288115))

(declare-fun m!288117 () Bool)

(assert (=> b!273353 m!288117))

(assert (=> b!273353 m!288117))

(declare-fun m!288119 () Bool)

(assert (=> b!273353 m!288119))

(declare-fun m!288121 () Bool)

(assert (=> b!273348 m!288121))

(declare-fun m!288123 () Bool)

(assert (=> b!273355 m!288123))

(declare-fun m!288125 () Bool)

(assert (=> b!273356 m!288125))

(declare-fun m!288127 () Bool)

(assert (=> b!273354 m!288127))

(declare-fun m!288129 () Bool)

(assert (=> b!273349 m!288129))

(declare-fun m!288131 () Bool)

(assert (=> b!273349 m!288131))

(declare-fun m!288133 () Bool)

(assert (=> b!273349 m!288133))

(declare-fun m!288135 () Bool)

(assert (=> b!273349 m!288135))

(assert (=> b!273349 m!288117))

(declare-fun m!288137 () Bool)

(assert (=> b!273349 m!288137))

(declare-fun m!288139 () Bool)

(assert (=> b!273349 m!288139))

(assert (=> b!273349 m!288117))

(declare-fun m!288141 () Bool)

(assert (=> b!273349 m!288141))

(declare-fun m!288143 () Bool)

(assert (=> b!273349 m!288143))

(assert (=> b!273349 m!288131))

(declare-fun m!288145 () Bool)

(assert (=> b!273349 m!288145))

(assert (=> b!273351 m!288133))

(declare-fun m!288147 () Bool)

(assert (=> b!273350 m!288147))

(check-sat (not b!273356) (not b!273350) (not start!26378) (not b!273349) (not b!273353) (not b!273348) (not b!273354) (not b!273355))
(check-sat)
