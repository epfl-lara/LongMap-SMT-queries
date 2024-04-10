; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26358 () Bool)

(assert start!26358)

(declare-fun res!137242 () Bool)

(declare-fun e!175172 () Bool)

(assert (=> start!26358 (=> (not res!137242) (not e!175172))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26358 (= res!137242 (validMask!0 mask!3868))))

(assert (=> start!26358 e!175172))

(declare-datatypes ((array!13455 0))(
  ( (array!13456 (arr!6377 (Array (_ BitVec 32) (_ BitVec 64))) (size!6729 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13455)

(declare-fun array_inv!4340 (array!13455) Bool)

(assert (=> start!26358 (array_inv!4340 a!3325)))

(assert (=> start!26358 true))

(declare-fun b!273252 () Bool)

(declare-fun e!175174 () Bool)

(assert (=> b!273252 (= e!175174 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13455 (_ BitVec 32)) Bool)

(assert (=> b!273252 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8557 0))(
  ( (Unit!8558) )
))
(declare-fun lt!136278 () Unit!8557)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8557)

(assert (=> b!273252 (= lt!136278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!136279 () array!13455)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1535 0))(
  ( (MissingZero!1535 (index!8310 (_ BitVec 32))) (Found!1535 (index!8311 (_ BitVec 32))) (Intermediate!1535 (undefined!2347 Bool) (index!8312 (_ BitVec 32)) (x!26620 (_ BitVec 32))) (Undefined!1535) (MissingVacant!1535 (index!8313 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13455 (_ BitVec 32)) SeekEntryResult!1535)

(assert (=> b!273252 (= (seekEntryOrOpen!0 (select (arr!6377 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6377 a!3325) i!1267 k!2581) startIndex!26) lt!136279 mask!3868))))

(declare-fun lt!136280 () Unit!8557)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8557)

(assert (=> b!273252 (= lt!136280 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4185 0))(
  ( (Nil!4182) (Cons!4181 (h!4848 (_ BitVec 64)) (t!9267 List!4185)) )
))
(declare-fun arrayNoDuplicates!0 (array!13455 (_ BitVec 32) List!4185) Bool)

(assert (=> b!273252 (arrayNoDuplicates!0 lt!136279 #b00000000000000000000000000000000 Nil!4182)))

(declare-fun lt!136282 () Unit!8557)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4185) Unit!8557)

(assert (=> b!273252 (= lt!136282 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4182))))

(declare-fun b!273253 () Bool)

(declare-fun res!137246 () Bool)

(assert (=> b!273253 (=> (not res!137246) (not e!175172))))

(assert (=> b!273253 (= res!137246 (and (= (size!6729 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6729 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6729 a!3325))))))

(declare-fun b!273254 () Bool)

(declare-fun e!175173 () Bool)

(assert (=> b!273254 (= e!175172 e!175173)))

(declare-fun res!137245 () Bool)

(assert (=> b!273254 (=> (not res!137245) (not e!175173))))

(declare-fun lt!136281 () SeekEntryResult!1535)

(assert (=> b!273254 (= res!137245 (or (= lt!136281 (MissingZero!1535 i!1267)) (= lt!136281 (MissingVacant!1535 i!1267))))))

(assert (=> b!273254 (= lt!136281 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273255 () Bool)

(declare-fun res!137249 () Bool)

(assert (=> b!273255 (=> (not res!137249) (not e!175172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273255 (= res!137249 (validKeyInArray!0 k!2581))))

(declare-fun b!273256 () Bool)

(declare-fun res!137248 () Bool)

(assert (=> b!273256 (=> (not res!137248) (not e!175174))))

(assert (=> b!273256 (= res!137248 (validKeyInArray!0 (select (arr!6377 a!3325) startIndex!26)))))

(declare-fun b!273257 () Bool)

(declare-fun res!137243 () Bool)

(assert (=> b!273257 (=> (not res!137243) (not e!175173))))

(assert (=> b!273257 (= res!137243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273258 () Bool)

(assert (=> b!273258 (= e!175173 e!175174)))

(declare-fun res!137247 () Bool)

(assert (=> b!273258 (=> (not res!137247) (not e!175174))))

(assert (=> b!273258 (= res!137247 (not (= startIndex!26 i!1267)))))

(assert (=> b!273258 (= lt!136279 (array!13456 (store (arr!6377 a!3325) i!1267 k!2581) (size!6729 a!3325)))))

(declare-fun b!273259 () Bool)

(declare-fun res!137244 () Bool)

(assert (=> b!273259 (=> (not res!137244) (not e!175172))))

(assert (=> b!273259 (= res!137244 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4182))))

(declare-fun b!273260 () Bool)

(declare-fun res!137250 () Bool)

(assert (=> b!273260 (=> (not res!137250) (not e!175172))))

(declare-fun arrayContainsKey!0 (array!13455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273260 (= res!137250 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26358 res!137242) b!273253))

(assert (= (and b!273253 res!137246) b!273255))

(assert (= (and b!273255 res!137249) b!273259))

(assert (= (and b!273259 res!137244) b!273260))

(assert (= (and b!273260 res!137250) b!273254))

(assert (= (and b!273254 res!137245) b!273257))

(assert (= (and b!273257 res!137243) b!273258))

(assert (= (and b!273258 res!137247) b!273256))

(assert (= (and b!273256 res!137248) b!273252))

(declare-fun m!288381 () Bool)

(assert (=> b!273260 m!288381))

(declare-fun m!288383 () Bool)

(assert (=> b!273258 m!288383))

(declare-fun m!288385 () Bool)

(assert (=> b!273255 m!288385))

(declare-fun m!288387 () Bool)

(assert (=> start!26358 m!288387))

(declare-fun m!288389 () Bool)

(assert (=> start!26358 m!288389))

(declare-fun m!288391 () Bool)

(assert (=> b!273256 m!288391))

(assert (=> b!273256 m!288391))

(declare-fun m!288393 () Bool)

(assert (=> b!273256 m!288393))

(declare-fun m!288395 () Bool)

(assert (=> b!273257 m!288395))

(declare-fun m!288397 () Bool)

(assert (=> b!273252 m!288397))

(declare-fun m!288399 () Bool)

(assert (=> b!273252 m!288399))

(assert (=> b!273252 m!288383))

(assert (=> b!273252 m!288399))

(declare-fun m!288401 () Bool)

(assert (=> b!273252 m!288401))

(declare-fun m!288403 () Bool)

(assert (=> b!273252 m!288403))

(assert (=> b!273252 m!288391))

(declare-fun m!288405 () Bool)

(assert (=> b!273252 m!288405))

(declare-fun m!288407 () Bool)

(assert (=> b!273252 m!288407))

(declare-fun m!288409 () Bool)

(assert (=> b!273252 m!288409))

(assert (=> b!273252 m!288391))

(declare-fun m!288411 () Bool)

(assert (=> b!273252 m!288411))

(declare-fun m!288413 () Bool)

(assert (=> b!273254 m!288413))

(declare-fun m!288415 () Bool)

(assert (=> b!273259 m!288415))

(push 1)

