; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26176 () Bool)

(assert start!26176)

(declare-fun b!270390 () Bool)

(declare-fun res!134405 () Bool)

(declare-fun e!174290 () Bool)

(assert (=> b!270390 (=> (not res!134405) (not e!174290))))

(declare-datatypes ((array!13273 0))(
  ( (array!13274 (arr!6286 (Array (_ BitVec 32) (_ BitVec 64))) (size!6638 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13273)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13273 (_ BitVec 32)) Bool)

(assert (=> b!270390 (= res!134405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270391 () Bool)

(declare-fun res!134404 () Bool)

(declare-fun e!174288 () Bool)

(assert (=> b!270391 (=> (not res!134404) (not e!174288))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270391 (= res!134404 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270392 () Bool)

(declare-fun e!174287 () Bool)

(assert (=> b!270392 (= e!174287 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!135608 () array!13273)

(declare-datatypes ((SeekEntryResult!1444 0))(
  ( (MissingZero!1444 (index!7946 (_ BitVec 32))) (Found!1444 (index!7947 (_ BitVec 32))) (Intermediate!1444 (undefined!2256 Bool) (index!7948 (_ BitVec 32)) (x!26281 (_ BitVec 32))) (Undefined!1444) (MissingVacant!1444 (index!7949 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13273 (_ BitVec 32)) SeekEntryResult!1444)

(assert (=> b!270392 (= (seekEntryOrOpen!0 k!2581 lt!135608 mask!3868) (Found!1444 i!1267))))

(declare-datatypes ((Unit!8437 0))(
  ( (Unit!8438) )
))
(declare-fun lt!135609 () Unit!8437)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8437)

(assert (=> b!270392 (= lt!135609 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135610 () Unit!8437)

(declare-fun e!174289 () Unit!8437)

(assert (=> b!270392 (= lt!135610 e!174289)))

(declare-fun c!45546 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270392 (= c!45546 (bvslt startIndex!26 (bvsub (size!6638 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270393 () Bool)

(declare-fun res!134406 () Bool)

(assert (=> b!270393 (=> (not res!134406) (not e!174288))))

(declare-datatypes ((List!4094 0))(
  ( (Nil!4091) (Cons!4090 (h!4757 (_ BitVec 64)) (t!9176 List!4094)) )
))
(declare-fun arrayNoDuplicates!0 (array!13273 (_ BitVec 32) List!4094) Bool)

(assert (=> b!270393 (= res!134406 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4091))))

(declare-fun b!270394 () Bool)

(assert (=> b!270394 (= e!174290 e!174287)))

(declare-fun res!134400 () Bool)

(assert (=> b!270394 (=> (not res!134400) (not e!174287))))

(assert (=> b!270394 (= res!134400 (= startIndex!26 i!1267))))

(assert (=> b!270394 (= lt!135608 (array!13274 (store (arr!6286 a!3325) i!1267 k!2581) (size!6638 a!3325)))))

(declare-fun b!270395 () Bool)

(declare-fun lt!135606 () Unit!8437)

(assert (=> b!270395 (= e!174289 lt!135606)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8437)

(assert (=> b!270395 (= lt!135606 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270395 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135608 mask!3868)))

(declare-fun b!270389 () Bool)

(declare-fun res!134401 () Bool)

(assert (=> b!270389 (=> (not res!134401) (not e!174288))))

(assert (=> b!270389 (= res!134401 (and (= (size!6638 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6638 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6638 a!3325))))))

(declare-fun res!134403 () Bool)

(assert (=> start!26176 (=> (not res!134403) (not e!174288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26176 (= res!134403 (validMask!0 mask!3868))))

(assert (=> start!26176 e!174288))

(declare-fun array_inv!4249 (array!13273) Bool)

(assert (=> start!26176 (array_inv!4249 a!3325)))

(assert (=> start!26176 true))

(declare-fun b!270396 () Bool)

(declare-fun res!134402 () Bool)

(assert (=> b!270396 (=> (not res!134402) (not e!174288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270396 (= res!134402 (validKeyInArray!0 k!2581))))

(declare-fun b!270397 () Bool)

(declare-fun Unit!8439 () Unit!8437)

(assert (=> b!270397 (= e!174289 Unit!8439)))

(declare-fun b!270398 () Bool)

(assert (=> b!270398 (= e!174288 e!174290)))

(declare-fun res!134399 () Bool)

(assert (=> b!270398 (=> (not res!134399) (not e!174290))))

(declare-fun lt!135607 () SeekEntryResult!1444)

(assert (=> b!270398 (= res!134399 (or (= lt!135607 (MissingZero!1444 i!1267)) (= lt!135607 (MissingVacant!1444 i!1267))))))

(assert (=> b!270398 (= lt!135607 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26176 res!134403) b!270389))

(assert (= (and b!270389 res!134401) b!270396))

(assert (= (and b!270396 res!134402) b!270393))

(assert (= (and b!270393 res!134406) b!270391))

(assert (= (and b!270391 res!134404) b!270398))

(assert (= (and b!270398 res!134399) b!270390))

(assert (= (and b!270390 res!134405) b!270394))

(assert (= (and b!270394 res!134400) b!270392))

(assert (= (and b!270392 c!45546) b!270395))

(assert (= (and b!270392 (not c!45546)) b!270397))

(declare-fun m!286011 () Bool)

(assert (=> b!270398 m!286011))

(declare-fun m!286013 () Bool)

(assert (=> b!270396 m!286013))

(declare-fun m!286015 () Bool)

(assert (=> b!270390 m!286015))

(declare-fun m!286017 () Bool)

(assert (=> start!26176 m!286017))

(declare-fun m!286019 () Bool)

(assert (=> start!26176 m!286019))

(declare-fun m!286021 () Bool)

(assert (=> b!270392 m!286021))

(declare-fun m!286023 () Bool)

(assert (=> b!270392 m!286023))

(declare-fun m!286025 () Bool)

(assert (=> b!270394 m!286025))

(declare-fun m!286027 () Bool)

(assert (=> b!270391 m!286027))

(declare-fun m!286029 () Bool)

(assert (=> b!270393 m!286029))

(declare-fun m!286031 () Bool)

(assert (=> b!270395 m!286031))

(declare-fun m!286033 () Bool)

(assert (=> b!270395 m!286033))

(push 1)

(assert (not b!270392))

(assert (not b!270391))

(assert (not b!270393))

(assert (not b!270396))

(assert (not b!270395))

(assert (not b!270398))

