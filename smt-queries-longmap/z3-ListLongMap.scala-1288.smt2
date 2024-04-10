; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26288 () Bool)

(assert start!26288)

(declare-fun b!272307 () Bool)

(declare-fun res!136305 () Bool)

(declare-fun e!174812 () Bool)

(assert (=> b!272307 (=> (not res!136305) (not e!174812))))

(declare-datatypes ((array!13385 0))(
  ( (array!13386 (arr!6342 (Array (_ BitVec 32) (_ BitVec 64))) (size!6694 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13385)

(declare-datatypes ((List!4150 0))(
  ( (Nil!4147) (Cons!4146 (h!4813 (_ BitVec 64)) (t!9232 List!4150)) )
))
(declare-fun arrayNoDuplicates!0 (array!13385 (_ BitVec 32) List!4150) Bool)

(assert (=> b!272307 (= res!136305 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4147))))

(declare-fun b!272308 () Bool)

(declare-fun e!174811 () Bool)

(assert (=> b!272308 (= e!174811 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!272308 (arrayNoDuplicates!0 (array!13386 (store (arr!6342 a!3325) i!1267 k0!2581) (size!6694 a!3325)) #b00000000000000000000000000000000 Nil!4147)))

(declare-datatypes ((Unit!8487 0))(
  ( (Unit!8488) )
))
(declare-fun lt!135973 () Unit!8487)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4150) Unit!8487)

(assert (=> b!272308 (= lt!135973 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4147))))

(declare-fun b!272309 () Bool)

(assert (=> b!272309 (= e!174812 e!174811)))

(declare-fun res!136301 () Bool)

(assert (=> b!272309 (=> (not res!136301) (not e!174811))))

(declare-datatypes ((SeekEntryResult!1500 0))(
  ( (MissingZero!1500 (index!8170 (_ BitVec 32))) (Found!1500 (index!8171 (_ BitVec 32))) (Intermediate!1500 (undefined!2312 Bool) (index!8172 (_ BitVec 32)) (x!26489 (_ BitVec 32))) (Undefined!1500) (MissingVacant!1500 (index!8173 (_ BitVec 32))) )
))
(declare-fun lt!135972 () SeekEntryResult!1500)

(assert (=> b!272309 (= res!136301 (or (= lt!135972 (MissingZero!1500 i!1267)) (= lt!135972 (MissingVacant!1500 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13385 (_ BitVec 32)) SeekEntryResult!1500)

(assert (=> b!272309 (= lt!135972 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272310 () Bool)

(declare-fun res!136303 () Bool)

(assert (=> b!272310 (=> (not res!136303) (not e!174812))))

(declare-fun arrayContainsKey!0 (array!13385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272310 (= res!136303 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272311 () Bool)

(declare-fun res!136302 () Bool)

(assert (=> b!272311 (=> (not res!136302) (not e!174812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272311 (= res!136302 (validKeyInArray!0 k0!2581))))

(declare-fun b!272312 () Bool)

(declare-fun res!136297 () Bool)

(assert (=> b!272312 (=> (not res!136297) (not e!174811))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272312 (= res!136297 (not (= startIndex!26 i!1267)))))

(declare-fun b!272313 () Bool)

(declare-fun res!136300 () Bool)

(assert (=> b!272313 (=> (not res!136300) (not e!174811))))

(assert (=> b!272313 (= res!136300 (validKeyInArray!0 (select (arr!6342 a!3325) startIndex!26)))))

(declare-fun res!136298 () Bool)

(assert (=> start!26288 (=> (not res!136298) (not e!174812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26288 (= res!136298 (validMask!0 mask!3868))))

(assert (=> start!26288 e!174812))

(declare-fun array_inv!4305 (array!13385) Bool)

(assert (=> start!26288 (array_inv!4305 a!3325)))

(assert (=> start!26288 true))

(declare-fun b!272314 () Bool)

(declare-fun res!136299 () Bool)

(assert (=> b!272314 (=> (not res!136299) (not e!174812))))

(assert (=> b!272314 (= res!136299 (and (= (size!6694 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6694 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6694 a!3325))))))

(declare-fun b!272315 () Bool)

(declare-fun res!136304 () Bool)

(assert (=> b!272315 (=> (not res!136304) (not e!174811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13385 (_ BitVec 32)) Bool)

(assert (=> b!272315 (= res!136304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26288 res!136298) b!272314))

(assert (= (and b!272314 res!136299) b!272311))

(assert (= (and b!272311 res!136302) b!272307))

(assert (= (and b!272307 res!136305) b!272310))

(assert (= (and b!272310 res!136303) b!272309))

(assert (= (and b!272309 res!136301) b!272315))

(assert (= (and b!272315 res!136304) b!272312))

(assert (= (and b!272312 res!136297) b!272313))

(assert (= (and b!272313 res!136300) b!272308))

(declare-fun m!287421 () Bool)

(assert (=> b!272315 m!287421))

(declare-fun m!287423 () Bool)

(assert (=> b!272307 m!287423))

(declare-fun m!287425 () Bool)

(assert (=> start!26288 m!287425))

(declare-fun m!287427 () Bool)

(assert (=> start!26288 m!287427))

(declare-fun m!287429 () Bool)

(assert (=> b!272310 m!287429))

(declare-fun m!287431 () Bool)

(assert (=> b!272309 m!287431))

(declare-fun m!287433 () Bool)

(assert (=> b!272308 m!287433))

(declare-fun m!287435 () Bool)

(assert (=> b!272308 m!287435))

(declare-fun m!287437 () Bool)

(assert (=> b!272308 m!287437))

(declare-fun m!287439 () Bool)

(assert (=> b!272313 m!287439))

(assert (=> b!272313 m!287439))

(declare-fun m!287441 () Bool)

(assert (=> b!272313 m!287441))

(declare-fun m!287443 () Bool)

(assert (=> b!272311 m!287443))

(check-sat (not b!272307) (not b!272311) (not start!26288) (not b!272313) (not b!272309) (not b!272310) (not b!272308) (not b!272315))
(check-sat)
