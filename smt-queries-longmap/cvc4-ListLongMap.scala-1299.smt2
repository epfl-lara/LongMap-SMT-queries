; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26356 () Bool)

(assert start!26356)

(declare-fun b!273225 () Bool)

(declare-fun res!137221 () Bool)

(declare-fun e!175162 () Bool)

(assert (=> b!273225 (=> (not res!137221) (not e!175162))))

(declare-datatypes ((array!13453 0))(
  ( (array!13454 (arr!6376 (Array (_ BitVec 32) (_ BitVec 64))) (size!6728 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13453)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13453 (_ BitVec 32)) Bool)

(assert (=> b!273225 (= res!137221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273226 () Bool)

(declare-fun res!137216 () Bool)

(declare-fun e!175163 () Bool)

(assert (=> b!273226 (=> (not res!137216) (not e!175163))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273226 (= res!137216 (validKeyInArray!0 k!2581))))

(declare-fun res!137218 () Bool)

(assert (=> start!26356 (=> (not res!137218) (not e!175163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26356 (= res!137218 (validMask!0 mask!3868))))

(assert (=> start!26356 e!175163))

(declare-fun array_inv!4339 (array!13453) Bool)

(assert (=> start!26356 (array_inv!4339 a!3325)))

(assert (=> start!26356 true))

(declare-fun b!273227 () Bool)

(assert (=> b!273227 (= e!175163 e!175162)))

(declare-fun res!137219 () Bool)

(assert (=> b!273227 (=> (not res!137219) (not e!175162))))

(declare-datatypes ((SeekEntryResult!1534 0))(
  ( (MissingZero!1534 (index!8306 (_ BitVec 32))) (Found!1534 (index!8307 (_ BitVec 32))) (Intermediate!1534 (undefined!2346 Bool) (index!8308 (_ BitVec 32)) (x!26611 (_ BitVec 32))) (Undefined!1534) (MissingVacant!1534 (index!8309 (_ BitVec 32))) )
))
(declare-fun lt!136266 () SeekEntryResult!1534)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273227 (= res!137219 (or (= lt!136266 (MissingZero!1534 i!1267)) (= lt!136266 (MissingVacant!1534 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13453 (_ BitVec 32)) SeekEntryResult!1534)

(assert (=> b!273227 (= lt!136266 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273228 () Bool)

(declare-fun e!175161 () Bool)

(assert (=> b!273228 (= e!175161 (not true))))

(declare-fun lt!136264 () array!13453)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273228 (= (seekEntryOrOpen!0 (select (arr!6376 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6376 a!3325) i!1267 k!2581) startIndex!26) lt!136264 mask!3868))))

(declare-datatypes ((Unit!8555 0))(
  ( (Unit!8556) )
))
(declare-fun lt!136267 () Unit!8555)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8555)

(assert (=> b!273228 (= lt!136267 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4184 0))(
  ( (Nil!4181) (Cons!4180 (h!4847 (_ BitVec 64)) (t!9266 List!4184)) )
))
(declare-fun arrayNoDuplicates!0 (array!13453 (_ BitVec 32) List!4184) Bool)

(assert (=> b!273228 (arrayNoDuplicates!0 lt!136264 #b00000000000000000000000000000000 Nil!4181)))

(declare-fun lt!136265 () Unit!8555)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13453 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4184) Unit!8555)

(assert (=> b!273228 (= lt!136265 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4181))))

(declare-fun b!273229 () Bool)

(declare-fun res!137220 () Bool)

(assert (=> b!273229 (=> (not res!137220) (not e!175163))))

(assert (=> b!273229 (= res!137220 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4181))))

(declare-fun b!273230 () Bool)

(declare-fun res!137223 () Bool)

(assert (=> b!273230 (=> (not res!137223) (not e!175163))))

(assert (=> b!273230 (= res!137223 (and (= (size!6728 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6728 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6728 a!3325))))))

(declare-fun b!273231 () Bool)

(assert (=> b!273231 (= e!175162 e!175161)))

(declare-fun res!137215 () Bool)

(assert (=> b!273231 (=> (not res!137215) (not e!175161))))

(assert (=> b!273231 (= res!137215 (not (= startIndex!26 i!1267)))))

(assert (=> b!273231 (= lt!136264 (array!13454 (store (arr!6376 a!3325) i!1267 k!2581) (size!6728 a!3325)))))

(declare-fun b!273232 () Bool)

(declare-fun res!137222 () Bool)

(assert (=> b!273232 (=> (not res!137222) (not e!175161))))

(assert (=> b!273232 (= res!137222 (validKeyInArray!0 (select (arr!6376 a!3325) startIndex!26)))))

(declare-fun b!273233 () Bool)

(declare-fun res!137217 () Bool)

(assert (=> b!273233 (=> (not res!137217) (not e!175163))))

(declare-fun arrayContainsKey!0 (array!13453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273233 (= res!137217 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26356 res!137218) b!273230))

(assert (= (and b!273230 res!137223) b!273226))

(assert (= (and b!273226 res!137216) b!273229))

(assert (= (and b!273229 res!137220) b!273233))

(assert (= (and b!273233 res!137217) b!273227))

(assert (= (and b!273227 res!137219) b!273225))

(assert (= (and b!273225 res!137221) b!273231))

(assert (= (and b!273231 res!137215) b!273232))

(assert (= (and b!273232 res!137222) b!273228))

(declare-fun m!288349 () Bool)

(assert (=> b!273227 m!288349))

(declare-fun m!288351 () Bool)

(assert (=> start!26356 m!288351))

(declare-fun m!288353 () Bool)

(assert (=> start!26356 m!288353))

(declare-fun m!288355 () Bool)

(assert (=> b!273233 m!288355))

(declare-fun m!288357 () Bool)

(assert (=> b!273226 m!288357))

(declare-fun m!288359 () Bool)

(assert (=> b!273228 m!288359))

(declare-fun m!288361 () Bool)

(assert (=> b!273228 m!288361))

(declare-fun m!288363 () Bool)

(assert (=> b!273228 m!288363))

(declare-fun m!288365 () Bool)

(assert (=> b!273228 m!288365))

(assert (=> b!273228 m!288359))

(declare-fun m!288367 () Bool)

(assert (=> b!273228 m!288367))

(assert (=> b!273228 m!288363))

(declare-fun m!288369 () Bool)

(assert (=> b!273228 m!288369))

(declare-fun m!288371 () Bool)

(assert (=> b!273228 m!288371))

(declare-fun m!288373 () Bool)

(assert (=> b!273228 m!288373))

(declare-fun m!288375 () Bool)

(assert (=> b!273225 m!288375))

(declare-fun m!288377 () Bool)

(assert (=> b!273229 m!288377))

(assert (=> b!273232 m!288363))

(assert (=> b!273232 m!288363))

(declare-fun m!288379 () Bool)

(assert (=> b!273232 m!288379))

(assert (=> b!273231 m!288361))

(push 1)

