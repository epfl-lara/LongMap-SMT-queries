; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27272 () Bool)

(assert start!27272)

(declare-fun b!282324 () Bool)

(declare-fun e!179228 () Bool)

(declare-fun e!179229 () Bool)

(assert (=> b!282324 (= e!179228 e!179229)))

(declare-fun res!145449 () Bool)

(assert (=> b!282324 (=> (not res!145449) (not e!179229))))

(declare-datatypes ((SeekEntryResult!1838 0))(
  ( (MissingZero!1838 (index!9522 (_ BitVec 32))) (Found!1838 (index!9523 (_ BitVec 32))) (Intermediate!1838 (undefined!2650 Bool) (index!9524 (_ BitVec 32)) (x!27755 (_ BitVec 32))) (Undefined!1838) (MissingVacant!1838 (index!9525 (_ BitVec 32))) )
))
(declare-fun lt!139386 () SeekEntryResult!1838)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282324 (= res!145449 (or (= lt!139386 (MissingZero!1838 i!1267)) (= lt!139386 (MissingVacant!1838 i!1267))))))

(declare-datatypes ((array!14079 0))(
  ( (array!14080 (arr!6681 (Array (_ BitVec 32) (_ BitVec 64))) (size!7034 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14079)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14079 (_ BitVec 32)) SeekEntryResult!1838)

(assert (=> b!282324 (= lt!139386 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282325 () Bool)

(declare-fun res!145451 () Bool)

(assert (=> b!282325 (=> (not res!145451) (not e!179228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282325 (= res!145451 (validKeyInArray!0 k0!2581))))

(declare-fun b!282326 () Bool)

(declare-fun res!145450 () Bool)

(assert (=> b!282326 (=> (not res!145450) (not e!179228))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282326 (= res!145450 (and (= (size!7034 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7034 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7034 a!3325))))))

(declare-fun b!282327 () Bool)

(declare-fun res!145453 () Bool)

(assert (=> b!282327 (=> (not res!145453) (not e!179229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14079 (_ BitVec 32)) Bool)

(assert (=> b!282327 (= res!145453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282328 () Bool)

(declare-fun res!145447 () Bool)

(assert (=> b!282328 (=> (not res!145447) (not e!179228))))

(declare-fun arrayContainsKey!0 (array!14079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282328 (= res!145447 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282329 () Bool)

(declare-fun res!145446 () Bool)

(declare-fun e!179226 () Bool)

(assert (=> b!282329 (=> (not res!145446) (not e!179226))))

(assert (=> b!282329 (= res!145446 (validKeyInArray!0 (select (arr!6681 a!3325) startIndex!26)))))

(declare-fun res!145452 () Bool)

(assert (=> start!27272 (=> (not res!145452) (not e!179228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27272 (= res!145452 (validMask!0 mask!3868))))

(assert (=> start!27272 e!179228))

(declare-fun array_inv!4653 (array!14079) Bool)

(assert (=> start!27272 (array_inv!4653 a!3325)))

(assert (=> start!27272 true))

(declare-fun b!282330 () Bool)

(assert (=> b!282330 (= e!179229 e!179226)))

(declare-fun res!145445 () Bool)

(assert (=> b!282330 (=> (not res!145445) (not e!179226))))

(assert (=> b!282330 (= res!145445 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139382 () array!14079)

(assert (=> b!282330 (= lt!139382 (array!14080 (store (arr!6681 a!3325) i!1267 k0!2581) (size!7034 a!3325)))))

(declare-fun b!282331 () Bool)

(declare-fun res!145448 () Bool)

(assert (=> b!282331 (=> (not res!145448) (not e!179228))))

(declare-datatypes ((List!4462 0))(
  ( (Nil!4459) (Cons!4458 (h!5128 (_ BitVec 64)) (t!9535 List!4462)) )
))
(declare-fun arrayNoDuplicates!0 (array!14079 (_ BitVec 32) List!4462) Bool)

(assert (=> b!282331 (= res!145448 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4459))))

(declare-fun b!282332 () Bool)

(assert (=> b!282332 (= e!179226 (not true))))

(assert (=> b!282332 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8922 0))(
  ( (Unit!8923) )
))
(declare-fun lt!139384 () Unit!8922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8922)

(assert (=> b!282332 (= lt!139384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282332 (= (seekEntryOrOpen!0 (select (arr!6681 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6681 a!3325) i!1267 k0!2581) startIndex!26) lt!139382 mask!3868))))

(declare-fun lt!139385 () Unit!8922)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14079 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8922)

(assert (=> b!282332 (= lt!139385 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282332 (arrayNoDuplicates!0 lt!139382 #b00000000000000000000000000000000 Nil!4459)))

(declare-fun lt!139383 () Unit!8922)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14079 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4462) Unit!8922)

(assert (=> b!282332 (= lt!139383 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4459))))

(assert (= (and start!27272 res!145452) b!282326))

(assert (= (and b!282326 res!145450) b!282325))

(assert (= (and b!282325 res!145451) b!282331))

(assert (= (and b!282331 res!145448) b!282328))

(assert (= (and b!282328 res!145447) b!282324))

(assert (= (and b!282324 res!145449) b!282327))

(assert (= (and b!282327 res!145453) b!282330))

(assert (= (and b!282330 res!145445) b!282329))

(assert (= (and b!282329 res!145446) b!282332))

(declare-fun m!296459 () Bool)

(assert (=> b!282332 m!296459))

(declare-fun m!296461 () Bool)

(assert (=> b!282332 m!296461))

(declare-fun m!296463 () Bool)

(assert (=> b!282332 m!296463))

(declare-fun m!296465 () Bool)

(assert (=> b!282332 m!296465))

(assert (=> b!282332 m!296461))

(declare-fun m!296467 () Bool)

(assert (=> b!282332 m!296467))

(declare-fun m!296469 () Bool)

(assert (=> b!282332 m!296469))

(declare-fun m!296471 () Bool)

(assert (=> b!282332 m!296471))

(declare-fun m!296473 () Bool)

(assert (=> b!282332 m!296473))

(declare-fun m!296475 () Bool)

(assert (=> b!282332 m!296475))

(assert (=> b!282332 m!296473))

(declare-fun m!296477 () Bool)

(assert (=> b!282332 m!296477))

(declare-fun m!296479 () Bool)

(assert (=> b!282328 m!296479))

(assert (=> b!282330 m!296463))

(assert (=> b!282329 m!296473))

(assert (=> b!282329 m!296473))

(declare-fun m!296481 () Bool)

(assert (=> b!282329 m!296481))

(declare-fun m!296483 () Bool)

(assert (=> b!282324 m!296483))

(declare-fun m!296485 () Bool)

(assert (=> b!282331 m!296485))

(declare-fun m!296487 () Bool)

(assert (=> start!27272 m!296487))

(declare-fun m!296489 () Bool)

(assert (=> start!27272 m!296489))

(declare-fun m!296491 () Bool)

(assert (=> b!282327 m!296491))

(declare-fun m!296493 () Bool)

(assert (=> b!282325 m!296493))

(check-sat (not start!27272) (not b!282328) (not b!282325) (not b!282327) (not b!282324) (not b!282332) (not b!282331) (not b!282329))
(check-sat)
