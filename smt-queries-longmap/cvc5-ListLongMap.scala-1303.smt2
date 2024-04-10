; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26376 () Bool)

(assert start!26376)

(declare-fun b!273495 () Bool)

(declare-fun res!137486 () Bool)

(declare-fun e!175281 () Bool)

(assert (=> b!273495 (=> (not res!137486) (not e!175281))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273495 (= res!137486 (validKeyInArray!0 k!2581))))

(declare-fun b!273496 () Bool)

(declare-fun res!137489 () Bool)

(declare-fun e!175282 () Bool)

(assert (=> b!273496 (=> (not res!137489) (not e!175282))))

(declare-datatypes ((array!13473 0))(
  ( (array!13474 (arr!6386 (Array (_ BitVec 32) (_ BitVec 64))) (size!6738 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13473)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13473 (_ BitVec 32)) Bool)

(assert (=> b!273496 (= res!137489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273497 () Bool)

(assert (=> b!273497 (= e!175281 e!175282)))

(declare-fun res!137487 () Bool)

(assert (=> b!273497 (=> (not res!137487) (not e!175282))))

(declare-datatypes ((SeekEntryResult!1544 0))(
  ( (MissingZero!1544 (index!8346 (_ BitVec 32))) (Found!1544 (index!8347 (_ BitVec 32))) (Intermediate!1544 (undefined!2356 Bool) (index!8348 (_ BitVec 32)) (x!26653 (_ BitVec 32))) (Undefined!1544) (MissingVacant!1544 (index!8349 (_ BitVec 32))) )
))
(declare-fun lt!136417 () SeekEntryResult!1544)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273497 (= res!137487 (or (= lt!136417 (MissingZero!1544 i!1267)) (= lt!136417 (MissingVacant!1544 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13473 (_ BitVec 32)) SeekEntryResult!1544)

(assert (=> b!273497 (= lt!136417 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273498 () Bool)

(declare-fun res!137492 () Bool)

(declare-fun e!175283 () Bool)

(assert (=> b!273498 (=> (not res!137492) (not e!175283))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273498 (= res!137492 (validKeyInArray!0 (select (arr!6386 a!3325) startIndex!26)))))

(declare-fun res!137493 () Bool)

(assert (=> start!26376 (=> (not res!137493) (not e!175281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26376 (= res!137493 (validMask!0 mask!3868))))

(assert (=> start!26376 e!175281))

(declare-fun array_inv!4349 (array!13473) Bool)

(assert (=> start!26376 (array_inv!4349 a!3325)))

(assert (=> start!26376 true))

(declare-fun b!273499 () Bool)

(declare-fun res!137488 () Bool)

(assert (=> b!273499 (=> (not res!137488) (not e!175281))))

(declare-fun arrayContainsKey!0 (array!13473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273499 (= res!137488 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273500 () Bool)

(declare-fun res!137491 () Bool)

(assert (=> b!273500 (=> (not res!137491) (not e!175281))))

(assert (=> b!273500 (= res!137491 (and (= (size!6738 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6738 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6738 a!3325))))))

(declare-fun b!273501 () Bool)

(declare-fun res!137485 () Bool)

(assert (=> b!273501 (=> (not res!137485) (not e!175281))))

(declare-datatypes ((List!4194 0))(
  ( (Nil!4191) (Cons!4190 (h!4857 (_ BitVec 64)) (t!9276 List!4194)) )
))
(declare-fun arrayNoDuplicates!0 (array!13473 (_ BitVec 32) List!4194) Bool)

(assert (=> b!273501 (= res!137485 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4191))))

(declare-fun b!273502 () Bool)

(assert (=> b!273502 (= e!175282 e!175283)))

(declare-fun res!137490 () Bool)

(assert (=> b!273502 (=> (not res!137490) (not e!175283))))

(assert (=> b!273502 (= res!137490 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136413 () array!13473)

(assert (=> b!273502 (= lt!136413 (array!13474 (store (arr!6386 a!3325) i!1267 k!2581) (size!6738 a!3325)))))

(declare-fun b!273503 () Bool)

(assert (=> b!273503 (= e!175283 (not true))))

(assert (=> b!273503 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8575 0))(
  ( (Unit!8576) )
))
(declare-fun lt!136415 () Unit!8575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8575)

(assert (=> b!273503 (= lt!136415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273503 (= (seekEntryOrOpen!0 (select (arr!6386 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6386 a!3325) i!1267 k!2581) startIndex!26) lt!136413 mask!3868))))

(declare-fun lt!136414 () Unit!8575)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8575)

(assert (=> b!273503 (= lt!136414 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273503 (arrayNoDuplicates!0 lt!136413 #b00000000000000000000000000000000 Nil!4191)))

(declare-fun lt!136416 () Unit!8575)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4194) Unit!8575)

(assert (=> b!273503 (= lt!136416 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4191))))

(assert (= (and start!26376 res!137493) b!273500))

(assert (= (and b!273500 res!137491) b!273495))

(assert (= (and b!273495 res!137486) b!273501))

(assert (= (and b!273501 res!137485) b!273499))

(assert (= (and b!273499 res!137488) b!273497))

(assert (= (and b!273497 res!137487) b!273496))

(assert (= (and b!273496 res!137489) b!273502))

(assert (= (and b!273502 res!137490) b!273498))

(assert (= (and b!273498 res!137492) b!273503))

(declare-fun m!288705 () Bool)

(assert (=> b!273498 m!288705))

(assert (=> b!273498 m!288705))

(declare-fun m!288707 () Bool)

(assert (=> b!273498 m!288707))

(declare-fun m!288709 () Bool)

(assert (=> b!273497 m!288709))

(declare-fun m!288711 () Bool)

(assert (=> b!273503 m!288711))

(declare-fun m!288713 () Bool)

(assert (=> b!273503 m!288713))

(declare-fun m!288715 () Bool)

(assert (=> b!273503 m!288715))

(assert (=> b!273503 m!288715))

(declare-fun m!288717 () Bool)

(assert (=> b!273503 m!288717))

(declare-fun m!288719 () Bool)

(assert (=> b!273503 m!288719))

(declare-fun m!288721 () Bool)

(assert (=> b!273503 m!288721))

(assert (=> b!273503 m!288705))

(declare-fun m!288723 () Bool)

(assert (=> b!273503 m!288723))

(declare-fun m!288725 () Bool)

(assert (=> b!273503 m!288725))

(assert (=> b!273503 m!288705))

(declare-fun m!288727 () Bool)

(assert (=> b!273503 m!288727))

(declare-fun m!288729 () Bool)

(assert (=> b!273495 m!288729))

(declare-fun m!288731 () Bool)

(assert (=> b!273499 m!288731))

(declare-fun m!288733 () Bool)

(assert (=> b!273501 m!288733))

(declare-fun m!288735 () Bool)

(assert (=> b!273496 m!288735))

(assert (=> b!273502 m!288719))

(declare-fun m!288737 () Bool)

(assert (=> start!26376 m!288737))

(declare-fun m!288739 () Bool)

(assert (=> start!26376 m!288739))

(push 1)

