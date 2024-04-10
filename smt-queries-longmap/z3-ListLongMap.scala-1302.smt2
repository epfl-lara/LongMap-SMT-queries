; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26372 () Bool)

(assert start!26372)

(declare-fun b!273441 () Bool)

(declare-fun res!137432 () Bool)

(declare-fun e!175258 () Bool)

(assert (=> b!273441 (=> (not res!137432) (not e!175258))))

(declare-datatypes ((array!13469 0))(
  ( (array!13470 (arr!6384 (Array (_ BitVec 32) (_ BitVec 64))) (size!6736 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13469)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273441 (= res!137432 (and (= (size!6736 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6736 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6736 a!3325))))))

(declare-fun res!137435 () Bool)

(assert (=> start!26372 (=> (not res!137435) (not e!175258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26372 (= res!137435 (validMask!0 mask!3868))))

(assert (=> start!26372 e!175258))

(declare-fun array_inv!4347 (array!13469) Bool)

(assert (=> start!26372 (array_inv!4347 a!3325)))

(assert (=> start!26372 true))

(declare-fun b!273442 () Bool)

(declare-fun e!175259 () Bool)

(assert (=> b!273442 (= e!175258 e!175259)))

(declare-fun res!137439 () Bool)

(assert (=> b!273442 (=> (not res!137439) (not e!175259))))

(declare-datatypes ((SeekEntryResult!1542 0))(
  ( (MissingZero!1542 (index!8338 (_ BitVec 32))) (Found!1542 (index!8339 (_ BitVec 32))) (Intermediate!1542 (undefined!2354 Bool) (index!8340 (_ BitVec 32)) (x!26643 (_ BitVec 32))) (Undefined!1542) (MissingVacant!1542 (index!8341 (_ BitVec 32))) )
))
(declare-fun lt!136384 () SeekEntryResult!1542)

(assert (=> b!273442 (= res!137439 (or (= lt!136384 (MissingZero!1542 i!1267)) (= lt!136384 (MissingVacant!1542 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13469 (_ BitVec 32)) SeekEntryResult!1542)

(assert (=> b!273442 (= lt!136384 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273443 () Bool)

(declare-fun e!175257 () Bool)

(assert (=> b!273443 (= e!175259 e!175257)))

(declare-fun res!137431 () Bool)

(assert (=> b!273443 (=> (not res!137431) (not e!175257))))

(assert (=> b!273443 (= res!137431 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136385 () array!13469)

(assert (=> b!273443 (= lt!136385 (array!13470 (store (arr!6384 a!3325) i!1267 k0!2581) (size!6736 a!3325)))))

(declare-fun b!273444 () Bool)

(declare-fun res!137434 () Bool)

(assert (=> b!273444 (=> (not res!137434) (not e!175259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13469 (_ BitVec 32)) Bool)

(assert (=> b!273444 (= res!137434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273445 () Bool)

(assert (=> b!273445 (= e!175257 (not true))))

(assert (=> b!273445 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8571 0))(
  ( (Unit!8572) )
))
(declare-fun lt!136386 () Unit!8571)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!273445 (= lt!136386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273445 (= (seekEntryOrOpen!0 (select (arr!6384 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6384 a!3325) i!1267 k0!2581) startIndex!26) lt!136385 mask!3868))))

(declare-fun lt!136383 () Unit!8571)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!273445 (= lt!136383 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4192 0))(
  ( (Nil!4189) (Cons!4188 (h!4855 (_ BitVec 64)) (t!9274 List!4192)) )
))
(declare-fun arrayNoDuplicates!0 (array!13469 (_ BitVec 32) List!4192) Bool)

(assert (=> b!273445 (arrayNoDuplicates!0 lt!136385 #b00000000000000000000000000000000 Nil!4189)))

(declare-fun lt!136387 () Unit!8571)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13469 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4192) Unit!8571)

(assert (=> b!273445 (= lt!136387 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4189))))

(declare-fun b!273446 () Bool)

(declare-fun res!137433 () Bool)

(assert (=> b!273446 (=> (not res!137433) (not e!175258))))

(assert (=> b!273446 (= res!137433 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4189))))

(declare-fun b!273447 () Bool)

(declare-fun res!137436 () Bool)

(assert (=> b!273447 (=> (not res!137436) (not e!175257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273447 (= res!137436 (validKeyInArray!0 (select (arr!6384 a!3325) startIndex!26)))))

(declare-fun b!273448 () Bool)

(declare-fun res!137438 () Bool)

(assert (=> b!273448 (=> (not res!137438) (not e!175258))))

(declare-fun arrayContainsKey!0 (array!13469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273448 (= res!137438 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273449 () Bool)

(declare-fun res!137437 () Bool)

(assert (=> b!273449 (=> (not res!137437) (not e!175258))))

(assert (=> b!273449 (= res!137437 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26372 res!137435) b!273441))

(assert (= (and b!273441 res!137432) b!273449))

(assert (= (and b!273449 res!137437) b!273446))

(assert (= (and b!273446 res!137433) b!273448))

(assert (= (and b!273448 res!137438) b!273442))

(assert (= (and b!273442 res!137439) b!273444))

(assert (= (and b!273444 res!137434) b!273443))

(assert (= (and b!273443 res!137431) b!273447))

(assert (= (and b!273447 res!137436) b!273445))

(declare-fun m!288633 () Bool)

(assert (=> b!273442 m!288633))

(declare-fun m!288635 () Bool)

(assert (=> start!26372 m!288635))

(declare-fun m!288637 () Bool)

(assert (=> start!26372 m!288637))

(declare-fun m!288639 () Bool)

(assert (=> b!273447 m!288639))

(assert (=> b!273447 m!288639))

(declare-fun m!288641 () Bool)

(assert (=> b!273447 m!288641))

(declare-fun m!288643 () Bool)

(assert (=> b!273444 m!288643))

(declare-fun m!288645 () Bool)

(assert (=> b!273443 m!288645))

(declare-fun m!288647 () Bool)

(assert (=> b!273446 m!288647))

(declare-fun m!288649 () Bool)

(assert (=> b!273449 m!288649))

(declare-fun m!288651 () Bool)

(assert (=> b!273445 m!288651))

(declare-fun m!288653 () Bool)

(assert (=> b!273445 m!288653))

(assert (=> b!273445 m!288645))

(declare-fun m!288655 () Bool)

(assert (=> b!273445 m!288655))

(assert (=> b!273445 m!288639))

(declare-fun m!288657 () Bool)

(assert (=> b!273445 m!288657))

(declare-fun m!288659 () Bool)

(assert (=> b!273445 m!288659))

(assert (=> b!273445 m!288653))

(declare-fun m!288661 () Bool)

(assert (=> b!273445 m!288661))

(assert (=> b!273445 m!288639))

(declare-fun m!288663 () Bool)

(assert (=> b!273445 m!288663))

(declare-fun m!288665 () Bool)

(assert (=> b!273445 m!288665))

(declare-fun m!288667 () Bool)

(assert (=> b!273448 m!288667))

(check-sat (not b!273445) (not b!273448) (not start!26372) (not b!273446) (not b!273444) (not b!273449) (not b!273447) (not b!273442))
(check-sat)
