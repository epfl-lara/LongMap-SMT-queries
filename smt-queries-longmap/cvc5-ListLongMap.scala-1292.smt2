; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26310 () Bool)

(assert start!26310)

(declare-fun b!272604 () Bool)

(declare-fun e!174911 () Bool)

(declare-fun e!174910 () Bool)

(assert (=> b!272604 (= e!174911 e!174910)))

(declare-fun res!136594 () Bool)

(assert (=> b!272604 (=> (not res!136594) (not e!174910))))

(declare-datatypes ((SeekEntryResult!1511 0))(
  ( (MissingZero!1511 (index!8214 (_ BitVec 32))) (Found!1511 (index!8215 (_ BitVec 32))) (Intermediate!1511 (undefined!2323 Bool) (index!8216 (_ BitVec 32)) (x!26532 (_ BitVec 32))) (Undefined!1511) (MissingVacant!1511 (index!8217 (_ BitVec 32))) )
))
(declare-fun lt!136039 () SeekEntryResult!1511)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272604 (= res!136594 (or (= lt!136039 (MissingZero!1511 i!1267)) (= lt!136039 (MissingVacant!1511 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13407 0))(
  ( (array!13408 (arr!6353 (Array (_ BitVec 32) (_ BitVec 64))) (size!6705 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13407)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13407 (_ BitVec 32)) SeekEntryResult!1511)

(assert (=> b!272604 (= lt!136039 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272605 () Bool)

(declare-fun res!136598 () Bool)

(assert (=> b!272605 (=> (not res!136598) (not e!174910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13407 (_ BitVec 32)) Bool)

(assert (=> b!272605 (= res!136598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272606 () Bool)

(declare-fun res!136596 () Bool)

(assert (=> b!272606 (=> (not res!136596) (not e!174911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272606 (= res!136596 (validKeyInArray!0 k!2581))))

(declare-fun b!272607 () Bool)

(declare-fun res!136599 () Bool)

(assert (=> b!272607 (=> (not res!136599) (not e!174911))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272607 (= res!136599 (and (= (size!6705 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6705 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6705 a!3325))))))

(declare-fun b!272608 () Bool)

(declare-fun res!136595 () Bool)

(assert (=> b!272608 (=> (not res!136595) (not e!174910))))

(assert (=> b!272608 (= res!136595 (validKeyInArray!0 (select (arr!6353 a!3325) startIndex!26)))))

(declare-fun b!272609 () Bool)

(declare-fun res!136601 () Bool)

(assert (=> b!272609 (=> (not res!136601) (not e!174911))))

(declare-datatypes ((List!4161 0))(
  ( (Nil!4158) (Cons!4157 (h!4824 (_ BitVec 64)) (t!9243 List!4161)) )
))
(declare-fun arrayNoDuplicates!0 (array!13407 (_ BitVec 32) List!4161) Bool)

(assert (=> b!272609 (= res!136601 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4158))))

(declare-fun b!272610 () Bool)

(declare-fun res!136600 () Bool)

(assert (=> b!272610 (=> (not res!136600) (not e!174911))))

(declare-fun arrayContainsKey!0 (array!13407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272610 (= res!136600 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!136602 () Bool)

(assert (=> start!26310 (=> (not res!136602) (not e!174911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26310 (= res!136602 (validMask!0 mask!3868))))

(assert (=> start!26310 e!174911))

(declare-fun array_inv!4316 (array!13407) Bool)

(assert (=> start!26310 (array_inv!4316 a!3325)))

(assert (=> start!26310 true))

(declare-fun b!272611 () Bool)

(declare-fun res!136597 () Bool)

(assert (=> b!272611 (=> (not res!136597) (not e!174910))))

(assert (=> b!272611 (= res!136597 (not (= startIndex!26 i!1267)))))

(declare-fun b!272612 () Bool)

(assert (=> b!272612 (= e!174910 (not true))))

(assert (=> b!272612 (arrayNoDuplicates!0 (array!13408 (store (arr!6353 a!3325) i!1267 k!2581) (size!6705 a!3325)) #b00000000000000000000000000000000 Nil!4158)))

(declare-datatypes ((Unit!8509 0))(
  ( (Unit!8510) )
))
(declare-fun lt!136038 () Unit!8509)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4161) Unit!8509)

(assert (=> b!272612 (= lt!136038 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4158))))

(assert (= (and start!26310 res!136602) b!272607))

(assert (= (and b!272607 res!136599) b!272606))

(assert (= (and b!272606 res!136596) b!272609))

(assert (= (and b!272609 res!136601) b!272610))

(assert (= (and b!272610 res!136600) b!272604))

(assert (= (and b!272604 res!136594) b!272605))

(assert (= (and b!272605 res!136598) b!272611))

(assert (= (and b!272611 res!136597) b!272608))

(assert (= (and b!272608 res!136595) b!272612))

(declare-fun m!287685 () Bool)

(assert (=> b!272605 m!287685))

(declare-fun m!287687 () Bool)

(assert (=> b!272612 m!287687))

(declare-fun m!287689 () Bool)

(assert (=> b!272612 m!287689))

(declare-fun m!287691 () Bool)

(assert (=> b!272612 m!287691))

(declare-fun m!287693 () Bool)

(assert (=> b!272608 m!287693))

(assert (=> b!272608 m!287693))

(declare-fun m!287695 () Bool)

(assert (=> b!272608 m!287695))

(declare-fun m!287697 () Bool)

(assert (=> b!272604 m!287697))

(declare-fun m!287699 () Bool)

(assert (=> start!26310 m!287699))

(declare-fun m!287701 () Bool)

(assert (=> start!26310 m!287701))

(declare-fun m!287703 () Bool)

(assert (=> b!272610 m!287703))

(declare-fun m!287705 () Bool)

(assert (=> b!272609 m!287705))

(declare-fun m!287707 () Bool)

(assert (=> b!272606 m!287707))

(push 1)

