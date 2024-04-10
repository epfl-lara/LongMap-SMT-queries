; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26286 () Bool)

(assert start!26286)

(declare-fun b!272280 () Bool)

(declare-fun res!136275 () Bool)

(declare-fun e!174801 () Bool)

(assert (=> b!272280 (=> (not res!136275) (not e!174801))))

(declare-datatypes ((array!13383 0))(
  ( (array!13384 (arr!6341 (Array (_ BitVec 32) (_ BitVec 64))) (size!6693 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13383)

(declare-datatypes ((List!4149 0))(
  ( (Nil!4146) (Cons!4145 (h!4812 (_ BitVec 64)) (t!9231 List!4149)) )
))
(declare-fun arrayNoDuplicates!0 (array!13383 (_ BitVec 32) List!4149) Bool)

(assert (=> b!272280 (= res!136275 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4146))))

(declare-fun b!272281 () Bool)

(declare-fun e!174802 () Bool)

(assert (=> b!272281 (= e!174801 e!174802)))

(declare-fun res!136276 () Bool)

(assert (=> b!272281 (=> (not res!136276) (not e!174802))))

(declare-datatypes ((SeekEntryResult!1499 0))(
  ( (MissingZero!1499 (index!8166 (_ BitVec 32))) (Found!1499 (index!8167 (_ BitVec 32))) (Intermediate!1499 (undefined!2311 Bool) (index!8168 (_ BitVec 32)) (x!26488 (_ BitVec 32))) (Undefined!1499) (MissingVacant!1499 (index!8169 (_ BitVec 32))) )
))
(declare-fun lt!135967 () SeekEntryResult!1499)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272281 (= res!136276 (or (= lt!135967 (MissingZero!1499 i!1267)) (= lt!135967 (MissingVacant!1499 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13383 (_ BitVec 32)) SeekEntryResult!1499)

(assert (=> b!272281 (= lt!135967 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272282 () Bool)

(declare-fun res!136270 () Bool)

(assert (=> b!272282 (=> (not res!136270) (not e!174801))))

(declare-fun arrayContainsKey!0 (array!13383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272282 (= res!136270 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!136272 () Bool)

(assert (=> start!26286 (=> (not res!136272) (not e!174801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26286 (= res!136272 (validMask!0 mask!3868))))

(assert (=> start!26286 e!174801))

(declare-fun array_inv!4304 (array!13383) Bool)

(assert (=> start!26286 (array_inv!4304 a!3325)))

(assert (=> start!26286 true))

(declare-fun b!272283 () Bool)

(declare-fun res!136278 () Bool)

(assert (=> b!272283 (=> (not res!136278) (not e!174801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272283 (= res!136278 (validKeyInArray!0 k!2581))))

(declare-fun b!272284 () Bool)

(assert (=> b!272284 (= e!174802 (not true))))

(assert (=> b!272284 (arrayNoDuplicates!0 (array!13384 (store (arr!6341 a!3325) i!1267 k!2581) (size!6693 a!3325)) #b00000000000000000000000000000000 Nil!4146)))

(declare-datatypes ((Unit!8485 0))(
  ( (Unit!8486) )
))
(declare-fun lt!135966 () Unit!8485)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4149) Unit!8485)

(assert (=> b!272284 (= lt!135966 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4146))))

(declare-fun b!272285 () Bool)

(declare-fun res!136274 () Bool)

(assert (=> b!272285 (=> (not res!136274) (not e!174802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13383 (_ BitVec 32)) Bool)

(assert (=> b!272285 (= res!136274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272286 () Bool)

(declare-fun res!136273 () Bool)

(assert (=> b!272286 (=> (not res!136273) (not e!174802))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272286 (= res!136273 (validKeyInArray!0 (select (arr!6341 a!3325) startIndex!26)))))

(declare-fun b!272287 () Bool)

(declare-fun res!136277 () Bool)

(assert (=> b!272287 (=> (not res!136277) (not e!174801))))

(assert (=> b!272287 (= res!136277 (and (= (size!6693 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6693 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6693 a!3325))))))

(declare-fun b!272288 () Bool)

(declare-fun res!136271 () Bool)

(assert (=> b!272288 (=> (not res!136271) (not e!174802))))

(assert (=> b!272288 (= res!136271 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26286 res!136272) b!272287))

(assert (= (and b!272287 res!136277) b!272283))

(assert (= (and b!272283 res!136278) b!272280))

(assert (= (and b!272280 res!136275) b!272282))

(assert (= (and b!272282 res!136270) b!272281))

(assert (= (and b!272281 res!136276) b!272285))

(assert (= (and b!272285 res!136274) b!272288))

(assert (= (and b!272288 res!136271) b!272286))

(assert (= (and b!272286 res!136273) b!272284))

(declare-fun m!287397 () Bool)

(assert (=> b!272285 m!287397))

(declare-fun m!287399 () Bool)

(assert (=> b!272282 m!287399))

(declare-fun m!287401 () Bool)

(assert (=> b!272284 m!287401))

(declare-fun m!287403 () Bool)

(assert (=> b!272284 m!287403))

(declare-fun m!287405 () Bool)

(assert (=> b!272284 m!287405))

(declare-fun m!287407 () Bool)

(assert (=> start!26286 m!287407))

(declare-fun m!287409 () Bool)

(assert (=> start!26286 m!287409))

(declare-fun m!287411 () Bool)

(assert (=> b!272281 m!287411))

(declare-fun m!287413 () Bool)

(assert (=> b!272283 m!287413))

(declare-fun m!287415 () Bool)

(assert (=> b!272286 m!287415))

(assert (=> b!272286 m!287415))

(declare-fun m!287417 () Bool)

(assert (=> b!272286 m!287417))

(declare-fun m!287419 () Bool)

(assert (=> b!272280 m!287419))

(push 1)

