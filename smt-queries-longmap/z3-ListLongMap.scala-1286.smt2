; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26274 () Bool)

(assert start!26274)

(declare-fun b!272165 () Bool)

(declare-fun e!174773 () Bool)

(declare-fun e!174771 () Bool)

(assert (=> b!272165 (= e!174773 e!174771)))

(declare-fun res!136131 () Bool)

(assert (=> b!272165 (=> (not res!136131) (not e!174771))))

(declare-datatypes ((SeekEntryResult!1457 0))(
  ( (MissingZero!1457 (index!7998 (_ BitVec 32))) (Found!1457 (index!7999 (_ BitVec 32))) (Intermediate!1457 (undefined!2269 Bool) (index!8000 (_ BitVec 32)) (x!26430 (_ BitVec 32))) (Undefined!1457) (MissingVacant!1457 (index!8001 (_ BitVec 32))) )
))
(declare-fun lt!135989 () SeekEntryResult!1457)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272165 (= res!136131 (or (= lt!135989 (MissingZero!1457 i!1267)) (= lt!135989 (MissingVacant!1457 i!1267))))))

(declare-datatypes ((array!13370 0))(
  ( (array!13371 (arr!6334 (Array (_ BitVec 32) (_ BitVec 64))) (size!6686 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13370)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13370 (_ BitVec 32)) SeekEntryResult!1457)

(assert (=> b!272165 (= lt!135989 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272166 () Bool)

(declare-fun res!136133 () Bool)

(assert (=> b!272166 (=> (not res!136133) (not e!174771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13370 (_ BitVec 32)) Bool)

(assert (=> b!272166 (= res!136133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272167 () Bool)

(declare-fun res!136135 () Bool)

(assert (=> b!272167 (=> (not res!136135) (not e!174771))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272167 (= res!136135 (validKeyInArray!0 (select (arr!6334 a!3325) startIndex!26)))))

(declare-fun b!272168 () Bool)

(declare-fun res!136132 () Bool)

(assert (=> b!272168 (=> (not res!136132) (not e!174773))))

(assert (=> b!272168 (= res!136132 (and (= (size!6686 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6686 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6686 a!3325))))))

(declare-fun b!272169 () Bool)

(declare-fun res!136136 () Bool)

(assert (=> b!272169 (=> (not res!136136) (not e!174773))))

(assert (=> b!272169 (= res!136136 (validKeyInArray!0 k0!2581))))

(declare-fun b!272170 () Bool)

(declare-fun res!136134 () Bool)

(assert (=> b!272170 (=> (not res!136134) (not e!174773))))

(declare-fun arrayContainsKey!0 (array!13370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272170 (= res!136134 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272171 () Bool)

(assert (=> b!272171 (= e!174771 (not true))))

(declare-datatypes ((List!4055 0))(
  ( (Nil!4052) (Cons!4051 (h!4718 (_ BitVec 64)) (t!9129 List!4055)) )
))
(declare-fun arrayNoDuplicates!0 (array!13370 (_ BitVec 32) List!4055) Bool)

(assert (=> b!272171 (arrayNoDuplicates!0 (array!13371 (store (arr!6334 a!3325) i!1267 k0!2581) (size!6686 a!3325)) #b00000000000000000000000000000000 Nil!4052)))

(declare-datatypes ((Unit!8453 0))(
  ( (Unit!8454) )
))
(declare-fun lt!135990 () Unit!8453)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4055) Unit!8453)

(assert (=> b!272171 (= lt!135990 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4052))))

(declare-fun b!272172 () Bool)

(declare-fun res!136137 () Bool)

(assert (=> b!272172 (=> (not res!136137) (not e!174773))))

(assert (=> b!272172 (= res!136137 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4052))))

(declare-fun res!136130 () Bool)

(assert (=> start!26274 (=> (not res!136130) (not e!174773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26274 (= res!136130 (validMask!0 mask!3868))))

(assert (=> start!26274 e!174773))

(declare-fun array_inv!4284 (array!13370) Bool)

(assert (=> start!26274 (array_inv!4284 a!3325)))

(assert (=> start!26274 true))

(declare-fun b!272173 () Bool)

(declare-fun res!136129 () Bool)

(assert (=> b!272173 (=> (not res!136129) (not e!174771))))

(assert (=> b!272173 (= res!136129 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26274 res!136130) b!272168))

(assert (= (and b!272168 res!136132) b!272169))

(assert (= (and b!272169 res!136136) b!272172))

(assert (= (and b!272172 res!136137) b!272170))

(assert (= (and b!272170 res!136134) b!272165))

(assert (= (and b!272165 res!136131) b!272166))

(assert (= (and b!272166 res!136133) b!272173))

(assert (= (and b!272173 res!136129) b!272167))

(assert (= (and b!272167 res!136135) b!272171))

(declare-fun m!287459 () Bool)

(assert (=> b!272172 m!287459))

(declare-fun m!287461 () Bool)

(assert (=> b!272171 m!287461))

(declare-fun m!287463 () Bool)

(assert (=> b!272171 m!287463))

(declare-fun m!287465 () Bool)

(assert (=> b!272171 m!287465))

(declare-fun m!287467 () Bool)

(assert (=> b!272167 m!287467))

(assert (=> b!272167 m!287467))

(declare-fun m!287469 () Bool)

(assert (=> b!272167 m!287469))

(declare-fun m!287471 () Bool)

(assert (=> b!272170 m!287471))

(declare-fun m!287473 () Bool)

(assert (=> start!26274 m!287473))

(declare-fun m!287475 () Bool)

(assert (=> start!26274 m!287475))

(declare-fun m!287477 () Bool)

(assert (=> b!272165 m!287477))

(declare-fun m!287479 () Bool)

(assert (=> b!272166 m!287479))

(declare-fun m!287481 () Bool)

(assert (=> b!272169 m!287481))

(check-sat (not b!272172) (not b!272165) (not b!272170) (not start!26274) (not b!272167) (not b!272166) (not b!272171) (not b!272169))
(check-sat)
