; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26306 () Bool)

(assert start!26306)

(declare-fun res!136422 () Bool)

(declare-fun e!174782 () Bool)

(assert (=> start!26306 (=> (not res!136422) (not e!174782))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26306 (= res!136422 (validMask!0 mask!3868))))

(assert (=> start!26306 e!174782))

(declare-datatypes ((array!13392 0))(
  ( (array!13393 (arr!6345 (Array (_ BitVec 32) (_ BitVec 64))) (size!6698 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13392)

(declare-fun array_inv!4317 (array!13392) Bool)

(assert (=> start!26306 (array_inv!4317 a!3325)))

(assert (=> start!26306 true))

(declare-fun b!272376 () Bool)

(declare-fun res!136418 () Bool)

(assert (=> b!272376 (=> (not res!136418) (not e!174782))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272376 (= res!136418 (and (= (size!6698 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6698 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6698 a!3325))))))

(declare-fun b!272377 () Bool)

(declare-fun e!174781 () Bool)

(assert (=> b!272377 (= e!174781 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4126 0))(
  ( (Nil!4123) (Cons!4122 (h!4789 (_ BitVec 64)) (t!9199 List!4126)) )
))
(declare-fun arrayNoDuplicates!0 (array!13392 (_ BitVec 32) List!4126) Bool)

(assert (=> b!272377 (arrayNoDuplicates!0 (array!13393 (store (arr!6345 a!3325) i!1267 k0!2581) (size!6698 a!3325)) #b00000000000000000000000000000000 Nil!4123)))

(declare-datatypes ((Unit!8457 0))(
  ( (Unit!8458) )
))
(declare-fun lt!135839 () Unit!8457)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4126) Unit!8457)

(assert (=> b!272377 (= lt!135839 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4123))))

(declare-fun b!272378 () Bool)

(declare-fun res!136423 () Bool)

(assert (=> b!272378 (=> (not res!136423) (not e!174781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272378 (= res!136423 (validKeyInArray!0 (select (arr!6345 a!3325) startIndex!26)))))

(declare-fun b!272379 () Bool)

(declare-fun res!136425 () Bool)

(assert (=> b!272379 (=> (not res!136425) (not e!174782))))

(declare-fun arrayContainsKey!0 (array!13392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272379 (= res!136425 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272380 () Bool)

(declare-fun res!136420 () Bool)

(assert (=> b!272380 (=> (not res!136420) (not e!174781))))

(assert (=> b!272380 (= res!136420 (not (= startIndex!26 i!1267)))))

(declare-fun b!272381 () Bool)

(assert (=> b!272381 (= e!174782 e!174781)))

(declare-fun res!136421 () Bool)

(assert (=> b!272381 (=> (not res!136421) (not e!174781))))

(declare-datatypes ((SeekEntryResult!1502 0))(
  ( (MissingZero!1502 (index!8178 (_ BitVec 32))) (Found!1502 (index!8179 (_ BitVec 32))) (Intermediate!1502 (undefined!2314 Bool) (index!8180 (_ BitVec 32)) (x!26514 (_ BitVec 32))) (Undefined!1502) (MissingVacant!1502 (index!8181 (_ BitVec 32))) )
))
(declare-fun lt!135840 () SeekEntryResult!1502)

(assert (=> b!272381 (= res!136421 (or (= lt!135840 (MissingZero!1502 i!1267)) (= lt!135840 (MissingVacant!1502 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13392 (_ BitVec 32)) SeekEntryResult!1502)

(assert (=> b!272381 (= lt!135840 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272382 () Bool)

(declare-fun res!136426 () Bool)

(assert (=> b!272382 (=> (not res!136426) (not e!174781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13392 (_ BitVec 32)) Bool)

(assert (=> b!272382 (= res!136426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272383 () Bool)

(declare-fun res!136424 () Bool)

(assert (=> b!272383 (=> (not res!136424) (not e!174782))))

(assert (=> b!272383 (= res!136424 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4123))))

(declare-fun b!272384 () Bool)

(declare-fun res!136419 () Bool)

(assert (=> b!272384 (=> (not res!136419) (not e!174782))))

(assert (=> b!272384 (= res!136419 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26306 res!136422) b!272376))

(assert (= (and b!272376 res!136418) b!272384))

(assert (= (and b!272384 res!136419) b!272383))

(assert (= (and b!272383 res!136424) b!272379))

(assert (= (and b!272379 res!136425) b!272381))

(assert (= (and b!272381 res!136421) b!272382))

(assert (= (and b!272382 res!136426) b!272380))

(assert (= (and b!272380 res!136420) b!272378))

(assert (= (and b!272378 res!136423) b!272377))

(declare-fun m!287021 () Bool)

(assert (=> b!272382 m!287021))

(declare-fun m!287023 () Bool)

(assert (=> start!26306 m!287023))

(declare-fun m!287025 () Bool)

(assert (=> start!26306 m!287025))

(declare-fun m!287027 () Bool)

(assert (=> b!272378 m!287027))

(assert (=> b!272378 m!287027))

(declare-fun m!287029 () Bool)

(assert (=> b!272378 m!287029))

(declare-fun m!287031 () Bool)

(assert (=> b!272377 m!287031))

(declare-fun m!287033 () Bool)

(assert (=> b!272377 m!287033))

(declare-fun m!287035 () Bool)

(assert (=> b!272377 m!287035))

(declare-fun m!287037 () Bool)

(assert (=> b!272379 m!287037))

(declare-fun m!287039 () Bool)

(assert (=> b!272383 m!287039))

(declare-fun m!287041 () Bool)

(assert (=> b!272381 m!287041))

(declare-fun m!287043 () Bool)

(assert (=> b!272384 m!287043))

(check-sat (not b!272378) (not b!272381) (not b!272382) (not b!272377) (not b!272379) (not b!272384) (not start!26306) (not b!272383))
(check-sat)
