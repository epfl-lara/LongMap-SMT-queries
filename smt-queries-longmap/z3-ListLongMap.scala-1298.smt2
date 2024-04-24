; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26346 () Bool)

(assert start!26346)

(declare-fun b!273137 () Bool)

(declare-fun res!137106 () Bool)

(declare-fun e!175126 () Bool)

(assert (=> b!273137 (=> (not res!137106) (not e!175126))))

(declare-datatypes ((array!13442 0))(
  ( (array!13443 (arr!6370 (Array (_ BitVec 32) (_ BitVec 64))) (size!6722 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13442)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13442 (_ BitVec 32)) Bool)

(assert (=> b!273137 (= res!137106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273138 () Bool)

(declare-fun res!137104 () Bool)

(declare-fun e!175127 () Bool)

(assert (=> b!273138 (=> (not res!137104) (not e!175127))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273138 (= res!137104 (and (= (size!6722 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6722 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6722 a!3325))))))

(declare-fun b!273139 () Bool)

(assert (=> b!273139 (= e!175127 e!175126)))

(declare-fun res!137109 () Bool)

(assert (=> b!273139 (=> (not res!137109) (not e!175126))))

(declare-datatypes ((SeekEntryResult!1493 0))(
  ( (MissingZero!1493 (index!8142 (_ BitVec 32))) (Found!1493 (index!8143 (_ BitVec 32))) (Intermediate!1493 (undefined!2305 Bool) (index!8144 (_ BitVec 32)) (x!26562 (_ BitVec 32))) (Undefined!1493) (MissingVacant!1493 (index!8145 (_ BitVec 32))) )
))
(declare-fun lt!136266 () SeekEntryResult!1493)

(assert (=> b!273139 (= res!137109 (or (= lt!136266 (MissingZero!1493 i!1267)) (= lt!136266 (MissingVacant!1493 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13442 (_ BitVec 32)) SeekEntryResult!1493)

(assert (=> b!273139 (= lt!136266 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273140 () Bool)

(declare-fun res!137102 () Bool)

(assert (=> b!273140 (=> (not res!137102) (not e!175127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273140 (= res!137102 (validKeyInArray!0 k0!2581))))

(declare-fun b!273141 () Bool)

(declare-fun e!175125 () Bool)

(assert (=> b!273141 (= e!175126 e!175125)))

(declare-fun res!137107 () Bool)

(assert (=> b!273141 (=> (not res!137107) (not e!175125))))

(assert (=> b!273141 (= res!137107 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136265 () array!13442)

(assert (=> b!273141 (= lt!136265 (array!13443 (store (arr!6370 a!3325) i!1267 k0!2581) (size!6722 a!3325)))))

(declare-fun b!273142 () Bool)

(declare-fun res!137108 () Bool)

(assert (=> b!273142 (=> (not res!137108) (not e!175127))))

(declare-datatypes ((List!4091 0))(
  ( (Nil!4088) (Cons!4087 (h!4754 (_ BitVec 64)) (t!9165 List!4091)) )
))
(declare-fun arrayNoDuplicates!0 (array!13442 (_ BitVec 32) List!4091) Bool)

(assert (=> b!273142 (= res!137108 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4088))))

(declare-fun b!273143 () Bool)

(assert (=> b!273143 (= e!175125 (not true))))

(assert (=> b!273143 (= (seekEntryOrOpen!0 (select (arr!6370 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6370 a!3325) i!1267 k0!2581) startIndex!26) lt!136265 mask!3868))))

(declare-datatypes ((Unit!8525 0))(
  ( (Unit!8526) )
))
(declare-fun lt!136264 () Unit!8525)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8525)

(assert (=> b!273143 (= lt!136264 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273143 (arrayNoDuplicates!0 lt!136265 #b00000000000000000000000000000000 Nil!4088)))

(declare-fun lt!136263 () Unit!8525)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13442 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4091) Unit!8525)

(assert (=> b!273143 (= lt!136263 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4088))))

(declare-fun b!273144 () Bool)

(declare-fun res!137105 () Bool)

(assert (=> b!273144 (=> (not res!137105) (not e!175125))))

(assert (=> b!273144 (= res!137105 (validKeyInArray!0 (select (arr!6370 a!3325) startIndex!26)))))

(declare-fun res!137101 () Bool)

(assert (=> start!26346 (=> (not res!137101) (not e!175127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26346 (= res!137101 (validMask!0 mask!3868))))

(assert (=> start!26346 e!175127))

(declare-fun array_inv!4320 (array!13442) Bool)

(assert (=> start!26346 (array_inv!4320 a!3325)))

(assert (=> start!26346 true))

(declare-fun b!273145 () Bool)

(declare-fun res!137103 () Bool)

(assert (=> b!273145 (=> (not res!137103) (not e!175127))))

(declare-fun arrayContainsKey!0 (array!13442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273145 (= res!137103 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26346 res!137101) b!273138))

(assert (= (and b!273138 res!137104) b!273140))

(assert (= (and b!273140 res!137102) b!273142))

(assert (= (and b!273142 res!137108) b!273145))

(assert (= (and b!273145 res!137103) b!273139))

(assert (= (and b!273139 res!137109) b!273137))

(assert (= (and b!273137 res!137106) b!273141))

(assert (= (and b!273141 res!137107) b!273144))

(assert (= (and b!273144 res!137105) b!273143))

(declare-fun m!288395 () Bool)

(assert (=> b!273140 m!288395))

(declare-fun m!288397 () Bool)

(assert (=> b!273143 m!288397))

(declare-fun m!288399 () Bool)

(assert (=> b!273143 m!288399))

(assert (=> b!273143 m!288397))

(declare-fun m!288401 () Bool)

(assert (=> b!273143 m!288401))

(declare-fun m!288403 () Bool)

(assert (=> b!273143 m!288403))

(declare-fun m!288405 () Bool)

(assert (=> b!273143 m!288405))

(declare-fun m!288407 () Bool)

(assert (=> b!273143 m!288407))

(declare-fun m!288409 () Bool)

(assert (=> b!273143 m!288409))

(assert (=> b!273143 m!288403))

(declare-fun m!288411 () Bool)

(assert (=> b!273143 m!288411))

(declare-fun m!288413 () Bool)

(assert (=> b!273137 m!288413))

(assert (=> b!273141 m!288399))

(declare-fun m!288415 () Bool)

(assert (=> start!26346 m!288415))

(declare-fun m!288417 () Bool)

(assert (=> start!26346 m!288417))

(assert (=> b!273144 m!288403))

(assert (=> b!273144 m!288403))

(declare-fun m!288419 () Bool)

(assert (=> b!273144 m!288419))

(declare-fun m!288421 () Bool)

(assert (=> b!273139 m!288421))

(declare-fun m!288423 () Bool)

(assert (=> b!273142 m!288423))

(declare-fun m!288425 () Bool)

(assert (=> b!273145 m!288425))

(check-sat (not start!26346) (not b!273137) (not b!273140) (not b!273139) (not b!273143) (not b!273142) (not b!273145) (not b!273144))
(check-sat)
