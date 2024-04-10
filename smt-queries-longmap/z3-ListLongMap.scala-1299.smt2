; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26354 () Bool)

(assert start!26354)

(declare-fun b!273198 () Bool)

(declare-fun e!175148 () Bool)

(declare-fun e!175150 () Bool)

(assert (=> b!273198 (= e!175148 e!175150)))

(declare-fun res!137191 () Bool)

(assert (=> b!273198 (=> (not res!137191) (not e!175150))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273198 (= res!137191 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13451 0))(
  ( (array!13452 (arr!6375 (Array (_ BitVec 32) (_ BitVec 64))) (size!6727 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13451)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136252 () array!13451)

(assert (=> b!273198 (= lt!136252 (array!13452 (store (arr!6375 a!3325) i!1267 k0!2581) (size!6727 a!3325)))))

(declare-fun b!273199 () Bool)

(declare-fun res!137190 () Bool)

(assert (=> b!273199 (=> (not res!137190) (not e!175148))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13451 (_ BitVec 32)) Bool)

(assert (=> b!273199 (= res!137190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273200 () Bool)

(assert (=> b!273200 (= e!175150 (not true))))

(declare-datatypes ((SeekEntryResult!1533 0))(
  ( (MissingZero!1533 (index!8302 (_ BitVec 32))) (Found!1533 (index!8303 (_ BitVec 32))) (Intermediate!1533 (undefined!2345 Bool) (index!8304 (_ BitVec 32)) (x!26610 (_ BitVec 32))) (Undefined!1533) (MissingVacant!1533 (index!8305 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13451 (_ BitVec 32)) SeekEntryResult!1533)

(assert (=> b!273200 (= (seekEntryOrOpen!0 (select (arr!6375 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6375 a!3325) i!1267 k0!2581) startIndex!26) lt!136252 mask!3868))))

(declare-datatypes ((Unit!8553 0))(
  ( (Unit!8554) )
))
(declare-fun lt!136254 () Unit!8553)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8553)

(assert (=> b!273200 (= lt!136254 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4183 0))(
  ( (Nil!4180) (Cons!4179 (h!4846 (_ BitVec 64)) (t!9265 List!4183)) )
))
(declare-fun arrayNoDuplicates!0 (array!13451 (_ BitVec 32) List!4183) Bool)

(assert (=> b!273200 (arrayNoDuplicates!0 lt!136252 #b00000000000000000000000000000000 Nil!4180)))

(declare-fun lt!136255 () Unit!8553)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4183) Unit!8553)

(assert (=> b!273200 (= lt!136255 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4180))))

(declare-fun b!273201 () Bool)

(declare-fun res!137188 () Bool)

(declare-fun e!175149 () Bool)

(assert (=> b!273201 (=> (not res!137188) (not e!175149))))

(declare-fun arrayContainsKey!0 (array!13451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273201 (= res!137188 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!137193 () Bool)

(assert (=> start!26354 (=> (not res!137193) (not e!175149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26354 (= res!137193 (validMask!0 mask!3868))))

(assert (=> start!26354 e!175149))

(declare-fun array_inv!4338 (array!13451) Bool)

(assert (=> start!26354 (array_inv!4338 a!3325)))

(assert (=> start!26354 true))

(declare-fun b!273202 () Bool)

(declare-fun res!137192 () Bool)

(assert (=> b!273202 (=> (not res!137192) (not e!175149))))

(assert (=> b!273202 (= res!137192 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4180))))

(declare-fun b!273203 () Bool)

(declare-fun res!137196 () Bool)

(assert (=> b!273203 (=> (not res!137196) (not e!175150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273203 (= res!137196 (validKeyInArray!0 (select (arr!6375 a!3325) startIndex!26)))))

(declare-fun b!273204 () Bool)

(declare-fun res!137195 () Bool)

(assert (=> b!273204 (=> (not res!137195) (not e!175149))))

(assert (=> b!273204 (= res!137195 (validKeyInArray!0 k0!2581))))

(declare-fun b!273205 () Bool)

(assert (=> b!273205 (= e!175149 e!175148)))

(declare-fun res!137189 () Bool)

(assert (=> b!273205 (=> (not res!137189) (not e!175148))))

(declare-fun lt!136253 () SeekEntryResult!1533)

(assert (=> b!273205 (= res!137189 (or (= lt!136253 (MissingZero!1533 i!1267)) (= lt!136253 (MissingVacant!1533 i!1267))))))

(assert (=> b!273205 (= lt!136253 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273206 () Bool)

(declare-fun res!137194 () Bool)

(assert (=> b!273206 (=> (not res!137194) (not e!175149))))

(assert (=> b!273206 (= res!137194 (and (= (size!6727 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6727 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6727 a!3325))))))

(assert (= (and start!26354 res!137193) b!273206))

(assert (= (and b!273206 res!137194) b!273204))

(assert (= (and b!273204 res!137195) b!273202))

(assert (= (and b!273202 res!137192) b!273201))

(assert (= (and b!273201 res!137188) b!273205))

(assert (= (and b!273205 res!137189) b!273199))

(assert (= (and b!273199 res!137190) b!273198))

(assert (= (and b!273198 res!137191) b!273203))

(assert (= (and b!273203 res!137196) b!273200))

(declare-fun m!288317 () Bool)

(assert (=> b!273204 m!288317))

(declare-fun m!288319 () Bool)

(assert (=> b!273201 m!288319))

(declare-fun m!288321 () Bool)

(assert (=> b!273198 m!288321))

(declare-fun m!288323 () Bool)

(assert (=> b!273200 m!288323))

(assert (=> b!273200 m!288321))

(assert (=> b!273200 m!288323))

(declare-fun m!288325 () Bool)

(assert (=> b!273200 m!288325))

(declare-fun m!288327 () Bool)

(assert (=> b!273200 m!288327))

(declare-fun m!288329 () Bool)

(assert (=> b!273200 m!288329))

(declare-fun m!288331 () Bool)

(assert (=> b!273200 m!288331))

(declare-fun m!288333 () Bool)

(assert (=> b!273200 m!288333))

(assert (=> b!273200 m!288327))

(declare-fun m!288335 () Bool)

(assert (=> b!273200 m!288335))

(declare-fun m!288337 () Bool)

(assert (=> b!273202 m!288337))

(assert (=> b!273203 m!288327))

(assert (=> b!273203 m!288327))

(declare-fun m!288339 () Bool)

(assert (=> b!273203 m!288339))

(declare-fun m!288341 () Bool)

(assert (=> start!26354 m!288341))

(declare-fun m!288343 () Bool)

(assert (=> start!26354 m!288343))

(declare-fun m!288345 () Bool)

(assert (=> b!273205 m!288345))

(declare-fun m!288347 () Bool)

(assert (=> b!273199 m!288347))

(check-sat (not b!273201) (not b!273203) (not b!273205) (not b!273200) (not b!273202) (not b!273199) (not start!26354) (not b!273204))
(check-sat)
