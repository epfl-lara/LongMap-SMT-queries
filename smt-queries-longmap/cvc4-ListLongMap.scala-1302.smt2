; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26374 () Bool)

(assert start!26374)

(declare-fun b!273468 () Bool)

(declare-fun res!137461 () Bool)

(declare-fun e!175268 () Bool)

(assert (=> b!273468 (=> (not res!137461) (not e!175268))))

(declare-datatypes ((array!13471 0))(
  ( (array!13472 (arr!6385 (Array (_ BitVec 32) (_ BitVec 64))) (size!6737 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13471)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13471 (_ BitVec 32)) Bool)

(assert (=> b!273468 (= res!137461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273469 () Bool)

(declare-fun e!175271 () Bool)

(assert (=> b!273469 (= e!175271 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273469 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8573 0))(
  ( (Unit!8574) )
))
(declare-fun lt!136400 () Unit!8573)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8573)

(assert (=> b!273469 (= lt!136400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136401 () array!13471)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1543 0))(
  ( (MissingZero!1543 (index!8342 (_ BitVec 32))) (Found!1543 (index!8343 (_ BitVec 32))) (Intermediate!1543 (undefined!2355 Bool) (index!8344 (_ BitVec 32)) (x!26644 (_ BitVec 32))) (Undefined!1543) (MissingVacant!1543 (index!8345 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13471 (_ BitVec 32)) SeekEntryResult!1543)

(assert (=> b!273469 (= (seekEntryOrOpen!0 (select (arr!6385 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6385 a!3325) i!1267 k!2581) startIndex!26) lt!136401 mask!3868))))

(declare-fun lt!136398 () Unit!8573)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13471 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8573)

(assert (=> b!273469 (= lt!136398 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4193 0))(
  ( (Nil!4190) (Cons!4189 (h!4856 (_ BitVec 64)) (t!9275 List!4193)) )
))
(declare-fun arrayNoDuplicates!0 (array!13471 (_ BitVec 32) List!4193) Bool)

(assert (=> b!273469 (arrayNoDuplicates!0 lt!136401 #b00000000000000000000000000000000 Nil!4190)))

(declare-fun lt!136399 () Unit!8573)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4193) Unit!8573)

(assert (=> b!273469 (= lt!136399 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4190))))

(declare-fun b!273471 () Bool)

(declare-fun res!137464 () Bool)

(declare-fun e!175270 () Bool)

(assert (=> b!273471 (=> (not res!137464) (not e!175270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273471 (= res!137464 (validKeyInArray!0 k!2581))))

(declare-fun b!273472 () Bool)

(declare-fun res!137466 () Bool)

(assert (=> b!273472 (=> (not res!137466) (not e!175270))))

(declare-fun arrayContainsKey!0 (array!13471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273472 (= res!137466 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273473 () Bool)

(assert (=> b!273473 (= e!175268 e!175271)))

(declare-fun res!137458 () Bool)

(assert (=> b!273473 (=> (not res!137458) (not e!175271))))

(assert (=> b!273473 (= res!137458 (not (= startIndex!26 i!1267)))))

(assert (=> b!273473 (= lt!136401 (array!13472 (store (arr!6385 a!3325) i!1267 k!2581) (size!6737 a!3325)))))

(declare-fun b!273474 () Bool)

(declare-fun res!137465 () Bool)

(assert (=> b!273474 (=> (not res!137465) (not e!175271))))

(assert (=> b!273474 (= res!137465 (validKeyInArray!0 (select (arr!6385 a!3325) startIndex!26)))))

(declare-fun b!273475 () Bool)

(assert (=> b!273475 (= e!175270 e!175268)))

(declare-fun res!137459 () Bool)

(assert (=> b!273475 (=> (not res!137459) (not e!175268))))

(declare-fun lt!136402 () SeekEntryResult!1543)

(assert (=> b!273475 (= res!137459 (or (= lt!136402 (MissingZero!1543 i!1267)) (= lt!136402 (MissingVacant!1543 i!1267))))))

(assert (=> b!273475 (= lt!136402 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273476 () Bool)

(declare-fun res!137463 () Bool)

(assert (=> b!273476 (=> (not res!137463) (not e!175270))))

(assert (=> b!273476 (= res!137463 (and (= (size!6737 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6737 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6737 a!3325))))))

(declare-fun res!137462 () Bool)

(assert (=> start!26374 (=> (not res!137462) (not e!175270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26374 (= res!137462 (validMask!0 mask!3868))))

(assert (=> start!26374 e!175270))

(declare-fun array_inv!4348 (array!13471) Bool)

(assert (=> start!26374 (array_inv!4348 a!3325)))

(assert (=> start!26374 true))

(declare-fun b!273470 () Bool)

(declare-fun res!137460 () Bool)

(assert (=> b!273470 (=> (not res!137460) (not e!175270))))

(assert (=> b!273470 (= res!137460 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4190))))

(assert (= (and start!26374 res!137462) b!273476))

(assert (= (and b!273476 res!137463) b!273471))

(assert (= (and b!273471 res!137464) b!273470))

(assert (= (and b!273470 res!137460) b!273472))

(assert (= (and b!273472 res!137466) b!273475))

(assert (= (and b!273475 res!137459) b!273468))

(assert (= (and b!273468 res!137461) b!273473))

(assert (= (and b!273473 res!137458) b!273474))

(assert (= (and b!273474 res!137465) b!273469))

(declare-fun m!288669 () Bool)

(assert (=> b!273468 m!288669))

(declare-fun m!288671 () Bool)

(assert (=> b!273474 m!288671))

(assert (=> b!273474 m!288671))

(declare-fun m!288673 () Bool)

(assert (=> b!273474 m!288673))

(declare-fun m!288675 () Bool)

(assert (=> b!273472 m!288675))

(declare-fun m!288677 () Bool)

(assert (=> start!26374 m!288677))

(declare-fun m!288679 () Bool)

(assert (=> start!26374 m!288679))

(declare-fun m!288681 () Bool)

(assert (=> b!273470 m!288681))

(declare-fun m!288683 () Bool)

(assert (=> b!273469 m!288683))

(declare-fun m!288685 () Bool)

(assert (=> b!273469 m!288685))

(declare-fun m!288687 () Bool)

(assert (=> b!273469 m!288687))

(declare-fun m!288689 () Bool)

(assert (=> b!273469 m!288689))

(assert (=> b!273469 m!288671))

(declare-fun m!288691 () Bool)

(assert (=> b!273469 m!288691))

(assert (=> b!273469 m!288685))

(declare-fun m!288693 () Bool)

(assert (=> b!273469 m!288693))

(assert (=> b!273469 m!288671))

(declare-fun m!288695 () Bool)

(assert (=> b!273469 m!288695))

(declare-fun m!288697 () Bool)

(assert (=> b!273469 m!288697))

(declare-fun m!288699 () Bool)

(assert (=> b!273469 m!288699))

(declare-fun m!288701 () Bool)

(assert (=> b!273475 m!288701))

(assert (=> b!273473 m!288687))

(declare-fun m!288703 () Bool)

(assert (=> b!273471 m!288703))

(push 1)

