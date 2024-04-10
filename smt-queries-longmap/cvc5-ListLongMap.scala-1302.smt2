; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26370 () Bool)

(assert start!26370)

(declare-fun res!137406 () Bool)

(declare-fun e!175245 () Bool)

(assert (=> start!26370 (=> (not res!137406) (not e!175245))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26370 (= res!137406 (validMask!0 mask!3868))))

(assert (=> start!26370 e!175245))

(declare-datatypes ((array!13467 0))(
  ( (array!13468 (arr!6383 (Array (_ BitVec 32) (_ BitVec 64))) (size!6735 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13467)

(declare-fun array_inv!4346 (array!13467) Bool)

(assert (=> start!26370 (array_inv!4346 a!3325)))

(assert (=> start!26370 true))

(declare-fun b!273414 () Bool)

(declare-fun res!137410 () Bool)

(assert (=> b!273414 (=> (not res!137410) (not e!175245))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273414 (= res!137410 (validKeyInArray!0 k!2581))))

(declare-fun b!273415 () Bool)

(declare-fun e!175244 () Bool)

(assert (=> b!273415 (= e!175244 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13467 (_ BitVec 32)) Bool)

(assert (=> b!273415 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8569 0))(
  ( (Unit!8570) )
))
(declare-fun lt!136368 () Unit!8569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8569)

(assert (=> b!273415 (= lt!136368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!136370 () array!13467)

(declare-datatypes ((SeekEntryResult!1541 0))(
  ( (MissingZero!1541 (index!8334 (_ BitVec 32))) (Found!1541 (index!8335 (_ BitVec 32))) (Intermediate!1541 (undefined!2353 Bool) (index!8336 (_ BitVec 32)) (x!26642 (_ BitVec 32))) (Undefined!1541) (MissingVacant!1541 (index!8337 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13467 (_ BitVec 32)) SeekEntryResult!1541)

(assert (=> b!273415 (= (seekEntryOrOpen!0 (select (arr!6383 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6383 a!3325) i!1267 k!2581) startIndex!26) lt!136370 mask!3868))))

(declare-fun lt!136369 () Unit!8569)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8569)

(assert (=> b!273415 (= lt!136369 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4191 0))(
  ( (Nil!4188) (Cons!4187 (h!4854 (_ BitVec 64)) (t!9273 List!4191)) )
))
(declare-fun arrayNoDuplicates!0 (array!13467 (_ BitVec 32) List!4191) Bool)

(assert (=> b!273415 (arrayNoDuplicates!0 lt!136370 #b00000000000000000000000000000000 Nil!4188)))

(declare-fun lt!136371 () Unit!8569)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4191) Unit!8569)

(assert (=> b!273415 (= lt!136371 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4188))))

(declare-fun b!273416 () Bool)

(declare-fun res!137408 () Bool)

(assert (=> b!273416 (=> (not res!137408) (not e!175245))))

(assert (=> b!273416 (= res!137408 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4188))))

(declare-fun b!273417 () Bool)

(declare-fun res!137404 () Bool)

(assert (=> b!273417 (=> (not res!137404) (not e!175245))))

(declare-fun arrayContainsKey!0 (array!13467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273417 (= res!137404 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273418 () Bool)

(declare-fun res!137405 () Bool)

(assert (=> b!273418 (=> (not res!137405) (not e!175244))))

(assert (=> b!273418 (= res!137405 (validKeyInArray!0 (select (arr!6383 a!3325) startIndex!26)))))

(declare-fun b!273419 () Bool)

(declare-fun res!137412 () Bool)

(declare-fun e!175246 () Bool)

(assert (=> b!273419 (=> (not res!137412) (not e!175246))))

(assert (=> b!273419 (= res!137412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273420 () Bool)

(declare-fun res!137411 () Bool)

(assert (=> b!273420 (=> (not res!137411) (not e!175245))))

(assert (=> b!273420 (= res!137411 (and (= (size!6735 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6735 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6735 a!3325))))))

(declare-fun b!273421 () Bool)

(assert (=> b!273421 (= e!175245 e!175246)))

(declare-fun res!137409 () Bool)

(assert (=> b!273421 (=> (not res!137409) (not e!175246))))

(declare-fun lt!136372 () SeekEntryResult!1541)

(assert (=> b!273421 (= res!137409 (or (= lt!136372 (MissingZero!1541 i!1267)) (= lt!136372 (MissingVacant!1541 i!1267))))))

(assert (=> b!273421 (= lt!136372 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273422 () Bool)

(assert (=> b!273422 (= e!175246 e!175244)))

(declare-fun res!137407 () Bool)

(assert (=> b!273422 (=> (not res!137407) (not e!175244))))

(assert (=> b!273422 (= res!137407 (not (= startIndex!26 i!1267)))))

(assert (=> b!273422 (= lt!136370 (array!13468 (store (arr!6383 a!3325) i!1267 k!2581) (size!6735 a!3325)))))

(assert (= (and start!26370 res!137406) b!273420))

(assert (= (and b!273420 res!137411) b!273414))

(assert (= (and b!273414 res!137410) b!273416))

(assert (= (and b!273416 res!137408) b!273417))

(assert (= (and b!273417 res!137404) b!273421))

(assert (= (and b!273421 res!137409) b!273419))

(assert (= (and b!273419 res!137412) b!273422))

(assert (= (and b!273422 res!137407) b!273418))

(assert (= (and b!273418 res!137405) b!273415))

(declare-fun m!288597 () Bool)

(assert (=> b!273419 m!288597))

(declare-fun m!288599 () Bool)

(assert (=> b!273421 m!288599))

(declare-fun m!288601 () Bool)

(assert (=> b!273417 m!288601))

(declare-fun m!288603 () Bool)

(assert (=> b!273415 m!288603))

(declare-fun m!288605 () Bool)

(assert (=> b!273415 m!288605))

(declare-fun m!288607 () Bool)

(assert (=> b!273415 m!288607))

(declare-fun m!288609 () Bool)

(assert (=> b!273415 m!288609))

(assert (=> b!273415 m!288605))

(declare-fun m!288611 () Bool)

(assert (=> b!273415 m!288611))

(declare-fun m!288613 () Bool)

(assert (=> b!273415 m!288613))

(declare-fun m!288615 () Bool)

(assert (=> b!273415 m!288615))

(declare-fun m!288617 () Bool)

(assert (=> b!273415 m!288617))

(declare-fun m!288619 () Bool)

(assert (=> b!273415 m!288619))

(assert (=> b!273415 m!288615))

(declare-fun m!288621 () Bool)

(assert (=> b!273415 m!288621))

(declare-fun m!288623 () Bool)

(assert (=> start!26370 m!288623))

(declare-fun m!288625 () Bool)

(assert (=> start!26370 m!288625))

(declare-fun m!288627 () Bool)

(assert (=> b!273414 m!288627))

(assert (=> b!273422 m!288607))

(declare-fun m!288629 () Bool)

(assert (=> b!273416 m!288629))

(assert (=> b!273418 m!288615))

(assert (=> b!273418 m!288615))

(declare-fun m!288631 () Bool)

(assert (=> b!273418 m!288631))

(push 1)

