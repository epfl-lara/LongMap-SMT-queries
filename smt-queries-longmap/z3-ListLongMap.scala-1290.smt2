; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26300 () Bool)

(assert start!26300)

(declare-fun b!272469 () Bool)

(declare-fun res!136460 () Bool)

(declare-fun e!174864 () Bool)

(assert (=> b!272469 (=> (not res!136460) (not e!174864))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272469 (= res!136460 (validKeyInArray!0 k0!2581))))

(declare-fun b!272470 () Bool)

(declare-fun e!174866 () Bool)

(assert (=> b!272470 (= e!174864 e!174866)))

(declare-fun res!136464 () Bool)

(assert (=> b!272470 (=> (not res!136464) (not e!174866))))

(declare-datatypes ((SeekEntryResult!1506 0))(
  ( (MissingZero!1506 (index!8194 (_ BitVec 32))) (Found!1506 (index!8195 (_ BitVec 32))) (Intermediate!1506 (undefined!2318 Bool) (index!8196 (_ BitVec 32)) (x!26511 (_ BitVec 32))) (Undefined!1506) (MissingVacant!1506 (index!8197 (_ BitVec 32))) )
))
(declare-fun lt!136008 () SeekEntryResult!1506)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272470 (= res!136464 (or (= lt!136008 (MissingZero!1506 i!1267)) (= lt!136008 (MissingVacant!1506 i!1267))))))

(declare-datatypes ((array!13397 0))(
  ( (array!13398 (arr!6348 (Array (_ BitVec 32) (_ BitVec 64))) (size!6700 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13397)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13397 (_ BitVec 32)) SeekEntryResult!1506)

(assert (=> b!272470 (= lt!136008 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272471 () Bool)

(declare-fun res!136461 () Bool)

(assert (=> b!272471 (=> (not res!136461) (not e!174866))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272471 (= res!136461 (not (= startIndex!26 i!1267)))))

(declare-fun b!272472 () Bool)

(declare-fun res!136463 () Bool)

(assert (=> b!272472 (=> (not res!136463) (not e!174866))))

(assert (=> b!272472 (= res!136463 (validKeyInArray!0 (select (arr!6348 a!3325) startIndex!26)))))

(declare-fun b!272473 () Bool)

(declare-fun res!136465 () Bool)

(assert (=> b!272473 (=> (not res!136465) (not e!174864))))

(declare-datatypes ((List!4156 0))(
  ( (Nil!4153) (Cons!4152 (h!4819 (_ BitVec 64)) (t!9238 List!4156)) )
))
(declare-fun arrayNoDuplicates!0 (array!13397 (_ BitVec 32) List!4156) Bool)

(assert (=> b!272473 (= res!136465 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4153))))

(declare-fun b!272474 () Bool)

(declare-fun res!136459 () Bool)

(assert (=> b!272474 (=> (not res!136459) (not e!174864))))

(declare-fun arrayContainsKey!0 (array!13397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272474 (= res!136459 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272475 () Bool)

(declare-fun res!136467 () Bool)

(assert (=> b!272475 (=> (not res!136467) (not e!174864))))

(assert (=> b!272475 (= res!136467 (and (= (size!6700 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6700 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6700 a!3325))))))

(declare-fun res!136466 () Bool)

(assert (=> start!26300 (=> (not res!136466) (not e!174864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26300 (= res!136466 (validMask!0 mask!3868))))

(assert (=> start!26300 e!174864))

(declare-fun array_inv!4311 (array!13397) Bool)

(assert (=> start!26300 (array_inv!4311 a!3325)))

(assert (=> start!26300 true))

(declare-fun b!272476 () Bool)

(assert (=> b!272476 (= e!174866 (not true))))

(assert (=> b!272476 (arrayNoDuplicates!0 (array!13398 (store (arr!6348 a!3325) i!1267 k0!2581) (size!6700 a!3325)) #b00000000000000000000000000000000 Nil!4153)))

(declare-datatypes ((Unit!8499 0))(
  ( (Unit!8500) )
))
(declare-fun lt!136009 () Unit!8499)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4156) Unit!8499)

(assert (=> b!272476 (= lt!136009 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4153))))

(declare-fun b!272477 () Bool)

(declare-fun res!136462 () Bool)

(assert (=> b!272477 (=> (not res!136462) (not e!174866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13397 (_ BitVec 32)) Bool)

(assert (=> b!272477 (= res!136462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26300 res!136466) b!272475))

(assert (= (and b!272475 res!136467) b!272469))

(assert (= (and b!272469 res!136460) b!272473))

(assert (= (and b!272473 res!136465) b!272474))

(assert (= (and b!272474 res!136459) b!272470))

(assert (= (and b!272470 res!136464) b!272477))

(assert (= (and b!272477 res!136462) b!272471))

(assert (= (and b!272471 res!136461) b!272472))

(assert (= (and b!272472 res!136463) b!272476))

(declare-fun m!287565 () Bool)

(assert (=> b!272472 m!287565))

(assert (=> b!272472 m!287565))

(declare-fun m!287567 () Bool)

(assert (=> b!272472 m!287567))

(declare-fun m!287569 () Bool)

(assert (=> b!272476 m!287569))

(declare-fun m!287571 () Bool)

(assert (=> b!272476 m!287571))

(declare-fun m!287573 () Bool)

(assert (=> b!272476 m!287573))

(declare-fun m!287575 () Bool)

(assert (=> b!272473 m!287575))

(declare-fun m!287577 () Bool)

(assert (=> start!26300 m!287577))

(declare-fun m!287579 () Bool)

(assert (=> start!26300 m!287579))

(declare-fun m!287581 () Bool)

(assert (=> b!272477 m!287581))

(declare-fun m!287583 () Bool)

(assert (=> b!272474 m!287583))

(declare-fun m!287585 () Bool)

(assert (=> b!272469 m!287585))

(declare-fun m!287587 () Bool)

(assert (=> b!272470 m!287587))

(check-sat (not b!272476) (not b!272470) (not b!272472) (not b!272477) (not start!26300) (not b!272469) (not b!272473) (not b!272474))
(check-sat)
