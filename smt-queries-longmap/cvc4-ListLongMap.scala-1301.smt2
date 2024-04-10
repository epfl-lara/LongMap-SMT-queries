; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26368 () Bool)

(assert start!26368)

(declare-fun b!273387 () Bool)

(declare-fun res!137378 () Bool)

(declare-fun e!175234 () Bool)

(assert (=> b!273387 (=> (not res!137378) (not e!175234))))

(declare-datatypes ((array!13465 0))(
  ( (array!13466 (arr!6382 (Array (_ BitVec 32) (_ BitVec 64))) (size!6734 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13465)

(declare-datatypes ((List!4190 0))(
  ( (Nil!4187) (Cons!4186 (h!4853 (_ BitVec 64)) (t!9272 List!4190)) )
))
(declare-fun arrayNoDuplicates!0 (array!13465 (_ BitVec 32) List!4190) Bool)

(assert (=> b!273387 (= res!137378 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4187))))

(declare-fun b!273389 () Bool)

(declare-fun res!137381 () Bool)

(declare-fun e!175233 () Bool)

(assert (=> b!273389 (=> (not res!137381) (not e!175233))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13465 (_ BitVec 32)) Bool)

(assert (=> b!273389 (= res!137381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273390 () Bool)

(declare-fun res!137379 () Bool)

(assert (=> b!273390 (=> (not res!137379) (not e!175234))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273390 (= res!137379 (validKeyInArray!0 k!2581))))

(declare-fun b!273391 () Bool)

(declare-fun e!175232 () Bool)

(assert (=> b!273391 (= e!175232 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273391 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8567 0))(
  ( (Unit!8568) )
))
(declare-fun lt!136357 () Unit!8567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8567)

(assert (=> b!273391 (= lt!136357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136356 () array!13465)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1540 0))(
  ( (MissingZero!1540 (index!8330 (_ BitVec 32))) (Found!1540 (index!8331 (_ BitVec 32))) (Intermediate!1540 (undefined!2352 Bool) (index!8332 (_ BitVec 32)) (x!26633 (_ BitVec 32))) (Undefined!1540) (MissingVacant!1540 (index!8333 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13465 (_ BitVec 32)) SeekEntryResult!1540)

(assert (=> b!273391 (= (seekEntryOrOpen!0 (select (arr!6382 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6382 a!3325) i!1267 k!2581) startIndex!26) lt!136356 mask!3868))))

(declare-fun lt!136353 () Unit!8567)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8567)

(assert (=> b!273391 (= lt!136353 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273391 (arrayNoDuplicates!0 lt!136356 #b00000000000000000000000000000000 Nil!4187)))

(declare-fun lt!136355 () Unit!8567)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13465 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4190) Unit!8567)

(assert (=> b!273391 (= lt!136355 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4187))))

(declare-fun b!273392 () Bool)

(assert (=> b!273392 (= e!175234 e!175233)))

(declare-fun res!137385 () Bool)

(assert (=> b!273392 (=> (not res!137385) (not e!175233))))

(declare-fun lt!136354 () SeekEntryResult!1540)

(assert (=> b!273392 (= res!137385 (or (= lt!136354 (MissingZero!1540 i!1267)) (= lt!136354 (MissingVacant!1540 i!1267))))))

(assert (=> b!273392 (= lt!136354 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273393 () Bool)

(declare-fun res!137382 () Bool)

(assert (=> b!273393 (=> (not res!137382) (not e!175234))))

(assert (=> b!273393 (= res!137382 (and (= (size!6734 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6734 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6734 a!3325))))))

(declare-fun b!273394 () Bool)

(declare-fun res!137383 () Bool)

(assert (=> b!273394 (=> (not res!137383) (not e!175234))))

(declare-fun arrayContainsKey!0 (array!13465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273394 (= res!137383 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273395 () Bool)

(assert (=> b!273395 (= e!175233 e!175232)))

(declare-fun res!137377 () Bool)

(assert (=> b!273395 (=> (not res!137377) (not e!175232))))

(assert (=> b!273395 (= res!137377 (not (= startIndex!26 i!1267)))))

(assert (=> b!273395 (= lt!136356 (array!13466 (store (arr!6382 a!3325) i!1267 k!2581) (size!6734 a!3325)))))

(declare-fun res!137384 () Bool)

(assert (=> start!26368 (=> (not res!137384) (not e!175234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26368 (= res!137384 (validMask!0 mask!3868))))

(assert (=> start!26368 e!175234))

(declare-fun array_inv!4345 (array!13465) Bool)

(assert (=> start!26368 (array_inv!4345 a!3325)))

(assert (=> start!26368 true))

(declare-fun b!273388 () Bool)

(declare-fun res!137380 () Bool)

(assert (=> b!273388 (=> (not res!137380) (not e!175232))))

(assert (=> b!273388 (= res!137380 (validKeyInArray!0 (select (arr!6382 a!3325) startIndex!26)))))

(assert (= (and start!26368 res!137384) b!273393))

(assert (= (and b!273393 res!137382) b!273390))

(assert (= (and b!273390 res!137379) b!273387))

(assert (= (and b!273387 res!137378) b!273394))

(assert (= (and b!273394 res!137383) b!273392))

(assert (= (and b!273392 res!137385) b!273389))

(assert (= (and b!273389 res!137381) b!273395))

(assert (= (and b!273395 res!137377) b!273388))

(assert (= (and b!273388 res!137380) b!273391))

(declare-fun m!288561 () Bool)

(assert (=> b!273395 m!288561))

(declare-fun m!288563 () Bool)

(assert (=> b!273391 m!288563))

(declare-fun m!288565 () Bool)

(assert (=> b!273391 m!288565))

(declare-fun m!288567 () Bool)

(assert (=> b!273391 m!288567))

(assert (=> b!273391 m!288561))

(declare-fun m!288569 () Bool)

(assert (=> b!273391 m!288569))

(declare-fun m!288571 () Bool)

(assert (=> b!273391 m!288571))

(declare-fun m!288573 () Bool)

(assert (=> b!273391 m!288573))

(assert (=> b!273391 m!288569))

(declare-fun m!288575 () Bool)

(assert (=> b!273391 m!288575))

(assert (=> b!273391 m!288567))

(declare-fun m!288577 () Bool)

(assert (=> b!273391 m!288577))

(declare-fun m!288579 () Bool)

(assert (=> b!273391 m!288579))

(declare-fun m!288581 () Bool)

(assert (=> b!273394 m!288581))

(declare-fun m!288583 () Bool)

(assert (=> b!273392 m!288583))

(declare-fun m!288585 () Bool)

(assert (=> b!273390 m!288585))

(declare-fun m!288587 () Bool)

(assert (=> b!273389 m!288587))

(declare-fun m!288589 () Bool)

(assert (=> start!26368 m!288589))

(declare-fun m!288591 () Bool)

(assert (=> start!26368 m!288591))

(assert (=> b!273388 m!288569))

(assert (=> b!273388 m!288569))

(declare-fun m!288593 () Bool)

(assert (=> b!273388 m!288593))

(declare-fun m!288595 () Bool)

(assert (=> b!273387 m!288595))

(push 1)

