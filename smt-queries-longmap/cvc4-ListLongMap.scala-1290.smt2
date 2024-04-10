; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26302 () Bool)

(assert start!26302)

(declare-fun b!272496 () Bool)

(declare-fun res!136493 () Bool)

(declare-fun e!174874 () Bool)

(assert (=> b!272496 (=> (not res!136493) (not e!174874))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272496 (= res!136493 (not (= startIndex!26 i!1267)))))

(declare-fun b!272497 () Bool)

(declare-fun res!136494 () Bool)

(declare-fun e!174873 () Bool)

(assert (=> b!272497 (=> (not res!136494) (not e!174873))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272497 (= res!136494 (validKeyInArray!0 k!2581))))

(declare-fun res!136492 () Bool)

(assert (=> start!26302 (=> (not res!136492) (not e!174873))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26302 (= res!136492 (validMask!0 mask!3868))))

(assert (=> start!26302 e!174873))

(declare-datatypes ((array!13399 0))(
  ( (array!13400 (arr!6349 (Array (_ BitVec 32) (_ BitVec 64))) (size!6701 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13399)

(declare-fun array_inv!4312 (array!13399) Bool)

(assert (=> start!26302 (array_inv!4312 a!3325)))

(assert (=> start!26302 true))

(declare-fun b!272498 () Bool)

(assert (=> b!272498 (= e!174874 (not true))))

(declare-datatypes ((List!4157 0))(
  ( (Nil!4154) (Cons!4153 (h!4820 (_ BitVec 64)) (t!9239 List!4157)) )
))
(declare-fun arrayNoDuplicates!0 (array!13399 (_ BitVec 32) List!4157) Bool)

(assert (=> b!272498 (arrayNoDuplicates!0 (array!13400 (store (arr!6349 a!3325) i!1267 k!2581) (size!6701 a!3325)) #b00000000000000000000000000000000 Nil!4154)))

(declare-datatypes ((Unit!8501 0))(
  ( (Unit!8502) )
))
(declare-fun lt!136014 () Unit!8501)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13399 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4157) Unit!8501)

(assert (=> b!272498 (= lt!136014 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4154))))

(declare-fun b!272499 () Bool)

(assert (=> b!272499 (= e!174873 e!174874)))

(declare-fun res!136491 () Bool)

(assert (=> b!272499 (=> (not res!136491) (not e!174874))))

(declare-datatypes ((SeekEntryResult!1507 0))(
  ( (MissingZero!1507 (index!8198 (_ BitVec 32))) (Found!1507 (index!8199 (_ BitVec 32))) (Intermediate!1507 (undefined!2319 Bool) (index!8200 (_ BitVec 32)) (x!26512 (_ BitVec 32))) (Undefined!1507) (MissingVacant!1507 (index!8201 (_ BitVec 32))) )
))
(declare-fun lt!136015 () SeekEntryResult!1507)

(assert (=> b!272499 (= res!136491 (or (= lt!136015 (MissingZero!1507 i!1267)) (= lt!136015 (MissingVacant!1507 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13399 (_ BitVec 32)) SeekEntryResult!1507)

(assert (=> b!272499 (= lt!136015 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272500 () Bool)

(declare-fun res!136490 () Bool)

(assert (=> b!272500 (=> (not res!136490) (not e!174874))))

(assert (=> b!272500 (= res!136490 (validKeyInArray!0 (select (arr!6349 a!3325) startIndex!26)))))

(declare-fun b!272501 () Bool)

(declare-fun res!136489 () Bool)

(assert (=> b!272501 (=> (not res!136489) (not e!174873))))

(assert (=> b!272501 (= res!136489 (and (= (size!6701 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6701 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6701 a!3325))))))

(declare-fun b!272502 () Bool)

(declare-fun res!136488 () Bool)

(assert (=> b!272502 (=> (not res!136488) (not e!174873))))

(assert (=> b!272502 (= res!136488 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4154))))

(declare-fun b!272503 () Bool)

(declare-fun res!136487 () Bool)

(assert (=> b!272503 (=> (not res!136487) (not e!174873))))

(declare-fun arrayContainsKey!0 (array!13399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272503 (= res!136487 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272504 () Bool)

(declare-fun res!136486 () Bool)

(assert (=> b!272504 (=> (not res!136486) (not e!174874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13399 (_ BitVec 32)) Bool)

(assert (=> b!272504 (= res!136486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26302 res!136492) b!272501))

(assert (= (and b!272501 res!136489) b!272497))

(assert (= (and b!272497 res!136494) b!272502))

(assert (= (and b!272502 res!136488) b!272503))

(assert (= (and b!272503 res!136487) b!272499))

(assert (= (and b!272499 res!136491) b!272504))

(assert (= (and b!272504 res!136486) b!272496))

(assert (= (and b!272496 res!136493) b!272500))

(assert (= (and b!272500 res!136490) b!272498))

(declare-fun m!287589 () Bool)

(assert (=> start!26302 m!287589))

(declare-fun m!287591 () Bool)

(assert (=> start!26302 m!287591))

(declare-fun m!287593 () Bool)

(assert (=> b!272497 m!287593))

(declare-fun m!287595 () Bool)

(assert (=> b!272500 m!287595))

(assert (=> b!272500 m!287595))

(declare-fun m!287597 () Bool)

(assert (=> b!272500 m!287597))

(declare-fun m!287599 () Bool)

(assert (=> b!272499 m!287599))

(declare-fun m!287601 () Bool)

(assert (=> b!272498 m!287601))

(declare-fun m!287603 () Bool)

(assert (=> b!272498 m!287603))

(declare-fun m!287605 () Bool)

(assert (=> b!272498 m!287605))

(declare-fun m!287607 () Bool)

(assert (=> b!272502 m!287607))

(declare-fun m!287609 () Bool)

(assert (=> b!272504 m!287609))

(declare-fun m!287611 () Bool)

(assert (=> b!272503 m!287611))

(push 1)

(assert (not b!272499))

(assert (not b!272502))

(assert (not b!272504))

(assert (not b!272500))

(assert (not b!272497))

(assert (not start!26302))

(assert (not b!272498))

(assert (not b!272503))

(check-sat)

(pop 1)

(push 1)

