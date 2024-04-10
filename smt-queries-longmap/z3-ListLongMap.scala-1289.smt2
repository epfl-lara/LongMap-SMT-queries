; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26294 () Bool)

(assert start!26294)

(declare-fun b!272388 () Bool)

(declare-fun res!136385 () Bool)

(declare-fun e!174839 () Bool)

(assert (=> b!272388 (=> (not res!136385) (not e!174839))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272388 (= res!136385 (validKeyInArray!0 k0!2581))))

(declare-fun res!136384 () Bool)

(assert (=> start!26294 (=> (not res!136384) (not e!174839))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26294 (= res!136384 (validMask!0 mask!3868))))

(assert (=> start!26294 e!174839))

(declare-datatypes ((array!13391 0))(
  ( (array!13392 (arr!6345 (Array (_ BitVec 32) (_ BitVec 64))) (size!6697 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13391)

(declare-fun array_inv!4308 (array!13391) Bool)

(assert (=> start!26294 (array_inv!4308 a!3325)))

(assert (=> start!26294 true))

(declare-fun b!272389 () Bool)

(declare-fun res!136386 () Bool)

(assert (=> b!272389 (=> (not res!136386) (not e!174839))))

(declare-fun arrayContainsKey!0 (array!13391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272389 (= res!136386 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272390 () Bool)

(declare-fun res!136381 () Bool)

(declare-fun e!174838 () Bool)

(assert (=> b!272390 (=> (not res!136381) (not e!174838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13391 (_ BitVec 32)) Bool)

(assert (=> b!272390 (= res!136381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272391 () Bool)

(declare-fun res!136380 () Bool)

(assert (=> b!272391 (=> (not res!136380) (not e!174839))))

(declare-datatypes ((List!4153 0))(
  ( (Nil!4150) (Cons!4149 (h!4816 (_ BitVec 64)) (t!9235 List!4153)) )
))
(declare-fun arrayNoDuplicates!0 (array!13391 (_ BitVec 32) List!4153) Bool)

(assert (=> b!272391 (= res!136380 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4150))))

(declare-fun b!272392 () Bool)

(assert (=> b!272392 (= e!174838 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272392 (arrayNoDuplicates!0 (array!13392 (store (arr!6345 a!3325) i!1267 k0!2581) (size!6697 a!3325)) #b00000000000000000000000000000000 Nil!4150)))

(declare-datatypes ((Unit!8493 0))(
  ( (Unit!8494) )
))
(declare-fun lt!135990 () Unit!8493)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4153) Unit!8493)

(assert (=> b!272392 (= lt!135990 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4150))))

(declare-fun b!272393 () Bool)

(declare-fun res!136379 () Bool)

(assert (=> b!272393 (=> (not res!136379) (not e!174839))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272393 (= res!136379 (and (= (size!6697 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6697 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6697 a!3325))))))

(declare-fun b!272394 () Bool)

(declare-fun res!136383 () Bool)

(assert (=> b!272394 (=> (not res!136383) (not e!174838))))

(assert (=> b!272394 (= res!136383 (validKeyInArray!0 (select (arr!6345 a!3325) startIndex!26)))))

(declare-fun b!272395 () Bool)

(declare-fun res!136378 () Bool)

(assert (=> b!272395 (=> (not res!136378) (not e!174838))))

(assert (=> b!272395 (= res!136378 (not (= startIndex!26 i!1267)))))

(declare-fun b!272396 () Bool)

(assert (=> b!272396 (= e!174839 e!174838)))

(declare-fun res!136382 () Bool)

(assert (=> b!272396 (=> (not res!136382) (not e!174838))))

(declare-datatypes ((SeekEntryResult!1503 0))(
  ( (MissingZero!1503 (index!8182 (_ BitVec 32))) (Found!1503 (index!8183 (_ BitVec 32))) (Intermediate!1503 (undefined!2315 Bool) (index!8184 (_ BitVec 32)) (x!26500 (_ BitVec 32))) (Undefined!1503) (MissingVacant!1503 (index!8185 (_ BitVec 32))) )
))
(declare-fun lt!135991 () SeekEntryResult!1503)

(assert (=> b!272396 (= res!136382 (or (= lt!135991 (MissingZero!1503 i!1267)) (= lt!135991 (MissingVacant!1503 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13391 (_ BitVec 32)) SeekEntryResult!1503)

(assert (=> b!272396 (= lt!135991 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26294 res!136384) b!272393))

(assert (= (and b!272393 res!136379) b!272388))

(assert (= (and b!272388 res!136385) b!272391))

(assert (= (and b!272391 res!136380) b!272389))

(assert (= (and b!272389 res!136386) b!272396))

(assert (= (and b!272396 res!136382) b!272390))

(assert (= (and b!272390 res!136381) b!272395))

(assert (= (and b!272395 res!136378) b!272394))

(assert (= (and b!272394 res!136383) b!272392))

(declare-fun m!287493 () Bool)

(assert (=> b!272396 m!287493))

(declare-fun m!287495 () Bool)

(assert (=> b!272391 m!287495))

(declare-fun m!287497 () Bool)

(assert (=> b!272394 m!287497))

(assert (=> b!272394 m!287497))

(declare-fun m!287499 () Bool)

(assert (=> b!272394 m!287499))

(declare-fun m!287501 () Bool)

(assert (=> start!26294 m!287501))

(declare-fun m!287503 () Bool)

(assert (=> start!26294 m!287503))

(declare-fun m!287505 () Bool)

(assert (=> b!272389 m!287505))

(declare-fun m!287507 () Bool)

(assert (=> b!272392 m!287507))

(declare-fun m!287509 () Bool)

(assert (=> b!272392 m!287509))

(declare-fun m!287511 () Bool)

(assert (=> b!272392 m!287511))

(declare-fun m!287513 () Bool)

(assert (=> b!272388 m!287513))

(declare-fun m!287515 () Bool)

(assert (=> b!272390 m!287515))

(check-sat (not b!272396) (not b!272394) (not b!272392) (not b!272388) (not b!272389) (not b!272391) (not start!26294) (not b!272390))
(check-sat)
