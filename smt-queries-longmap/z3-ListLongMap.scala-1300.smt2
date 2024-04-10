; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26360 () Bool)

(assert start!26360)

(declare-fun b!273279 () Bool)

(declare-fun e!175186 () Bool)

(declare-fun e!175184 () Bool)

(assert (=> b!273279 (= e!175186 e!175184)))

(declare-fun res!137270 () Bool)

(assert (=> b!273279 (=> (not res!137270) (not e!175184))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273279 (= res!137270 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13457 0))(
  ( (array!13458 (arr!6378 (Array (_ BitVec 32) (_ BitVec 64))) (size!6730 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13457)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136295 () array!13457)

(assert (=> b!273279 (= lt!136295 (array!13458 (store (arr!6378 a!3325) i!1267 k0!2581) (size!6730 a!3325)))))

(declare-fun b!273280 () Bool)

(declare-fun e!175185 () Bool)

(assert (=> b!273280 (= e!175185 e!175186)))

(declare-fun res!137275 () Bool)

(assert (=> b!273280 (=> (not res!137275) (not e!175186))))

(declare-datatypes ((SeekEntryResult!1536 0))(
  ( (MissingZero!1536 (index!8314 (_ BitVec 32))) (Found!1536 (index!8315 (_ BitVec 32))) (Intermediate!1536 (undefined!2348 Bool) (index!8316 (_ BitVec 32)) (x!26621 (_ BitVec 32))) (Undefined!1536) (MissingVacant!1536 (index!8317 (_ BitVec 32))) )
))
(declare-fun lt!136294 () SeekEntryResult!1536)

(assert (=> b!273280 (= res!137275 (or (= lt!136294 (MissingZero!1536 i!1267)) (= lt!136294 (MissingVacant!1536 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13457 (_ BitVec 32)) SeekEntryResult!1536)

(assert (=> b!273280 (= lt!136294 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273281 () Bool)

(declare-fun res!137274 () Bool)

(assert (=> b!273281 (=> (not res!137274) (not e!175185))))

(declare-datatypes ((List!4186 0))(
  ( (Nil!4183) (Cons!4182 (h!4849 (_ BitVec 64)) (t!9268 List!4186)) )
))
(declare-fun arrayNoDuplicates!0 (array!13457 (_ BitVec 32) List!4186) Bool)

(assert (=> b!273281 (= res!137274 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4183))))

(declare-fun b!273282 () Bool)

(assert (=> b!273282 (= e!175184 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13457 (_ BitVec 32)) Bool)

(assert (=> b!273282 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8559 0))(
  ( (Unit!8560) )
))
(declare-fun lt!136297 () Unit!8559)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!273282 (= lt!136297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273282 (= (seekEntryOrOpen!0 (select (arr!6378 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6378 a!3325) i!1267 k0!2581) startIndex!26) lt!136295 mask!3868))))

(declare-fun lt!136293 () Unit!8559)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!273282 (= lt!136293 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273282 (arrayNoDuplicates!0 lt!136295 #b00000000000000000000000000000000 Nil!4183)))

(declare-fun lt!136296 () Unit!8559)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13457 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4186) Unit!8559)

(assert (=> b!273282 (= lt!136296 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4183))))

(declare-fun res!137269 () Bool)

(assert (=> start!26360 (=> (not res!137269) (not e!175185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26360 (= res!137269 (validMask!0 mask!3868))))

(assert (=> start!26360 e!175185))

(declare-fun array_inv!4341 (array!13457) Bool)

(assert (=> start!26360 (array_inv!4341 a!3325)))

(assert (=> start!26360 true))

(declare-fun b!273283 () Bool)

(declare-fun res!137272 () Bool)

(assert (=> b!273283 (=> (not res!137272) (not e!175185))))

(declare-fun arrayContainsKey!0 (array!13457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273283 (= res!137272 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273284 () Bool)

(declare-fun res!137273 () Bool)

(assert (=> b!273284 (=> (not res!137273) (not e!175186))))

(assert (=> b!273284 (= res!137273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273285 () Bool)

(declare-fun res!137271 () Bool)

(assert (=> b!273285 (=> (not res!137271) (not e!175184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273285 (= res!137271 (validKeyInArray!0 (select (arr!6378 a!3325) startIndex!26)))))

(declare-fun b!273286 () Bool)

(declare-fun res!137277 () Bool)

(assert (=> b!273286 (=> (not res!137277) (not e!175185))))

(assert (=> b!273286 (= res!137277 (validKeyInArray!0 k0!2581))))

(declare-fun b!273287 () Bool)

(declare-fun res!137276 () Bool)

(assert (=> b!273287 (=> (not res!137276) (not e!175185))))

(assert (=> b!273287 (= res!137276 (and (= (size!6730 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6730 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6730 a!3325))))))

(assert (= (and start!26360 res!137269) b!273287))

(assert (= (and b!273287 res!137276) b!273286))

(assert (= (and b!273286 res!137277) b!273281))

(assert (= (and b!273281 res!137274) b!273283))

(assert (= (and b!273283 res!137272) b!273280))

(assert (= (and b!273280 res!137275) b!273284))

(assert (= (and b!273284 res!137273) b!273279))

(assert (= (and b!273279 res!137270) b!273285))

(assert (= (and b!273285 res!137271) b!273282))

(declare-fun m!288417 () Bool)

(assert (=> b!273279 m!288417))

(declare-fun m!288419 () Bool)

(assert (=> b!273281 m!288419))

(declare-fun m!288421 () Bool)

(assert (=> b!273284 m!288421))

(declare-fun m!288423 () Bool)

(assert (=> b!273286 m!288423))

(declare-fun m!288425 () Bool)

(assert (=> start!26360 m!288425))

(declare-fun m!288427 () Bool)

(assert (=> start!26360 m!288427))

(declare-fun m!288429 () Bool)

(assert (=> b!273283 m!288429))

(declare-fun m!288431 () Bool)

(assert (=> b!273280 m!288431))

(declare-fun m!288433 () Bool)

(assert (=> b!273282 m!288433))

(declare-fun m!288435 () Bool)

(assert (=> b!273282 m!288435))

(assert (=> b!273282 m!288417))

(declare-fun m!288437 () Bool)

(assert (=> b!273282 m!288437))

(declare-fun m!288439 () Bool)

(assert (=> b!273282 m!288439))

(declare-fun m!288441 () Bool)

(assert (=> b!273282 m!288441))

(declare-fun m!288443 () Bool)

(assert (=> b!273282 m!288443))

(declare-fun m!288445 () Bool)

(assert (=> b!273282 m!288445))

(assert (=> b!273282 m!288435))

(declare-fun m!288447 () Bool)

(assert (=> b!273282 m!288447))

(assert (=> b!273282 m!288439))

(declare-fun m!288449 () Bool)

(assert (=> b!273282 m!288449))

(assert (=> b!273285 m!288439))

(assert (=> b!273285 m!288439))

(declare-fun m!288451 () Bool)

(assert (=> b!273285 m!288451))

(check-sat (not b!273280) (not start!26360) (not b!273286) (not b!273283) (not b!273284) (not b!273281) (not b!273282) (not b!273285))
(check-sat)
