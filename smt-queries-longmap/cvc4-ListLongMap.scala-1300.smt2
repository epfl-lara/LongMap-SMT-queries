; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26362 () Bool)

(assert start!26362)

(declare-fun b!273306 () Bool)

(declare-fun res!137299 () Bool)

(declare-fun e!175198 () Bool)

(assert (=> b!273306 (=> (not res!137299) (not e!175198))))

(declare-datatypes ((array!13459 0))(
  ( (array!13460 (arr!6379 (Array (_ BitVec 32) (_ BitVec 64))) (size!6731 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13459)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13459 (_ BitVec 32)) Bool)

(assert (=> b!273306 (= res!137299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273307 () Bool)

(declare-fun res!137303 () Bool)

(declare-fun e!175199 () Bool)

(assert (=> b!273307 (=> (not res!137303) (not e!175199))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273307 (= res!137303 (validKeyInArray!0 k!2581))))

(declare-fun b!273308 () Bool)

(assert (=> b!273308 (= e!175199 e!175198)))

(declare-fun res!137304 () Bool)

(assert (=> b!273308 (=> (not res!137304) (not e!175198))))

(declare-datatypes ((SeekEntryResult!1537 0))(
  ( (MissingZero!1537 (index!8318 (_ BitVec 32))) (Found!1537 (index!8319 (_ BitVec 32))) (Intermediate!1537 (undefined!2349 Bool) (index!8320 (_ BitVec 32)) (x!26622 (_ BitVec 32))) (Undefined!1537) (MissingVacant!1537 (index!8321 (_ BitVec 32))) )
))
(declare-fun lt!136311 () SeekEntryResult!1537)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273308 (= res!137304 (or (= lt!136311 (MissingZero!1537 i!1267)) (= lt!136311 (MissingVacant!1537 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13459 (_ BitVec 32)) SeekEntryResult!1537)

(assert (=> b!273308 (= lt!136311 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273309 () Bool)

(declare-fun res!137301 () Bool)

(assert (=> b!273309 (=> (not res!137301) (not e!175199))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273309 (= res!137301 (and (= (size!6731 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6731 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6731 a!3325))))))

(declare-fun b!273310 () Bool)

(declare-fun res!137298 () Bool)

(assert (=> b!273310 (=> (not res!137298) (not e!175199))))

(declare-datatypes ((List!4187 0))(
  ( (Nil!4184) (Cons!4183 (h!4850 (_ BitVec 64)) (t!9269 List!4187)) )
))
(declare-fun arrayNoDuplicates!0 (array!13459 (_ BitVec 32) List!4187) Bool)

(assert (=> b!273310 (= res!137298 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4184))))

(declare-fun b!273311 () Bool)

(declare-fun e!175197 () Bool)

(assert (=> b!273311 (= e!175197 (not true))))

(assert (=> b!273311 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8561 0))(
  ( (Unit!8562) )
))
(declare-fun lt!136308 () Unit!8561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8561)

(assert (=> b!273311 (= lt!136308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136309 () array!13459)

(assert (=> b!273311 (= (seekEntryOrOpen!0 (select (arr!6379 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6379 a!3325) i!1267 k!2581) startIndex!26) lt!136309 mask!3868))))

(declare-fun lt!136312 () Unit!8561)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8561)

(assert (=> b!273311 (= lt!136312 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273311 (arrayNoDuplicates!0 lt!136309 #b00000000000000000000000000000000 Nil!4184)))

(declare-fun lt!136310 () Unit!8561)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4187) Unit!8561)

(assert (=> b!273311 (= lt!136310 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4184))))

(declare-fun b!273312 () Bool)

(declare-fun res!137302 () Bool)

(assert (=> b!273312 (=> (not res!137302) (not e!175197))))

(assert (=> b!273312 (= res!137302 (validKeyInArray!0 (select (arr!6379 a!3325) startIndex!26)))))

(declare-fun res!137297 () Bool)

(assert (=> start!26362 (=> (not res!137297) (not e!175199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26362 (= res!137297 (validMask!0 mask!3868))))

(assert (=> start!26362 e!175199))

(declare-fun array_inv!4342 (array!13459) Bool)

(assert (=> start!26362 (array_inv!4342 a!3325)))

(assert (=> start!26362 true))

(declare-fun b!273313 () Bool)

(assert (=> b!273313 (= e!175198 e!175197)))

(declare-fun res!137300 () Bool)

(assert (=> b!273313 (=> (not res!137300) (not e!175197))))

(assert (=> b!273313 (= res!137300 (not (= startIndex!26 i!1267)))))

(assert (=> b!273313 (= lt!136309 (array!13460 (store (arr!6379 a!3325) i!1267 k!2581) (size!6731 a!3325)))))

(declare-fun b!273314 () Bool)

(declare-fun res!137296 () Bool)

(assert (=> b!273314 (=> (not res!137296) (not e!175199))))

(declare-fun arrayContainsKey!0 (array!13459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273314 (= res!137296 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26362 res!137297) b!273309))

(assert (= (and b!273309 res!137301) b!273307))

(assert (= (and b!273307 res!137303) b!273310))

(assert (= (and b!273310 res!137298) b!273314))

(assert (= (and b!273314 res!137296) b!273308))

(assert (= (and b!273308 res!137304) b!273306))

(assert (= (and b!273306 res!137299) b!273313))

(assert (= (and b!273313 res!137300) b!273312))

(assert (= (and b!273312 res!137302) b!273311))

(declare-fun m!288453 () Bool)

(assert (=> b!273312 m!288453))

(assert (=> b!273312 m!288453))

(declare-fun m!288455 () Bool)

(assert (=> b!273312 m!288455))

(declare-fun m!288457 () Bool)

(assert (=> b!273310 m!288457))

(declare-fun m!288459 () Bool)

(assert (=> b!273306 m!288459))

(declare-fun m!288461 () Bool)

(assert (=> b!273311 m!288461))

(declare-fun m!288463 () Bool)

(assert (=> b!273311 m!288463))

(assert (=> b!273311 m!288463))

(declare-fun m!288465 () Bool)

(assert (=> b!273311 m!288465))

(declare-fun m!288467 () Bool)

(assert (=> b!273311 m!288467))

(declare-fun m!288469 () Bool)

(assert (=> b!273311 m!288469))

(assert (=> b!273311 m!288453))

(declare-fun m!288471 () Bool)

(assert (=> b!273311 m!288471))

(assert (=> b!273311 m!288453))

(declare-fun m!288473 () Bool)

(assert (=> b!273311 m!288473))

(declare-fun m!288475 () Bool)

(assert (=> b!273311 m!288475))

(declare-fun m!288477 () Bool)

(assert (=> b!273311 m!288477))

(declare-fun m!288479 () Bool)

(assert (=> start!26362 m!288479))

(declare-fun m!288481 () Bool)

(assert (=> start!26362 m!288481))

(assert (=> b!273313 m!288467))

(declare-fun m!288483 () Bool)

(assert (=> b!273307 m!288483))

(declare-fun m!288485 () Bool)

(assert (=> b!273314 m!288485))

(declare-fun m!288487 () Bool)

(assert (=> b!273308 m!288487))

(push 1)

