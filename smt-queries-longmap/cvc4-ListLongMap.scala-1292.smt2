; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26314 () Bool)

(assert start!26314)

(declare-fun res!136654 () Bool)

(declare-fun e!174929 () Bool)

(assert (=> start!26314 (=> (not res!136654) (not e!174929))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26314 (= res!136654 (validMask!0 mask!3868))))

(assert (=> start!26314 e!174929))

(declare-datatypes ((array!13411 0))(
  ( (array!13412 (arr!6355 (Array (_ BitVec 32) (_ BitVec 64))) (size!6707 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13411)

(declare-fun array_inv!4318 (array!13411) Bool)

(assert (=> start!26314 (array_inv!4318 a!3325)))

(assert (=> start!26314 true))

(declare-fun b!272658 () Bool)

(declare-fun e!174927 () Bool)

(assert (=> b!272658 (= e!174927 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4163 0))(
  ( (Nil!4160) (Cons!4159 (h!4826 (_ BitVec 64)) (t!9245 List!4163)) )
))
(declare-fun arrayNoDuplicates!0 (array!13411 (_ BitVec 32) List!4163) Bool)

(assert (=> b!272658 (arrayNoDuplicates!0 (array!13412 (store (arr!6355 a!3325) i!1267 k!2581) (size!6707 a!3325)) #b00000000000000000000000000000000 Nil!4160)))

(declare-datatypes ((Unit!8513 0))(
  ( (Unit!8514) )
))
(declare-fun lt!136050 () Unit!8513)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13411 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4163) Unit!8513)

(assert (=> b!272658 (= lt!136050 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4160))))

(declare-fun b!272659 () Bool)

(declare-fun res!136651 () Bool)

(assert (=> b!272659 (=> (not res!136651) (not e!174927))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272659 (= res!136651 (validKeyInArray!0 (select (arr!6355 a!3325) startIndex!26)))))

(declare-fun b!272660 () Bool)

(declare-fun res!136648 () Bool)

(assert (=> b!272660 (=> (not res!136648) (not e!174929))))

(assert (=> b!272660 (= res!136648 (and (= (size!6707 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6707 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6707 a!3325))))))

(declare-fun b!272661 () Bool)

(declare-fun res!136655 () Bool)

(assert (=> b!272661 (=> (not res!136655) (not e!174929))))

(assert (=> b!272661 (= res!136655 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4160))))

(declare-fun b!272662 () Bool)

(declare-fun res!136649 () Bool)

(assert (=> b!272662 (=> (not res!136649) (not e!174927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13411 (_ BitVec 32)) Bool)

(assert (=> b!272662 (= res!136649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272663 () Bool)

(declare-fun res!136652 () Bool)

(assert (=> b!272663 (=> (not res!136652) (not e!174929))))

(declare-fun arrayContainsKey!0 (array!13411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272663 (= res!136652 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272664 () Bool)

(declare-fun res!136656 () Bool)

(assert (=> b!272664 (=> (not res!136656) (not e!174929))))

(assert (=> b!272664 (= res!136656 (validKeyInArray!0 k!2581))))

(declare-fun b!272665 () Bool)

(assert (=> b!272665 (= e!174929 e!174927)))

(declare-fun res!136653 () Bool)

(assert (=> b!272665 (=> (not res!136653) (not e!174927))))

(declare-datatypes ((SeekEntryResult!1513 0))(
  ( (MissingZero!1513 (index!8222 (_ BitVec 32))) (Found!1513 (index!8223 (_ BitVec 32))) (Intermediate!1513 (undefined!2325 Bool) (index!8224 (_ BitVec 32)) (x!26534 (_ BitVec 32))) (Undefined!1513) (MissingVacant!1513 (index!8225 (_ BitVec 32))) )
))
(declare-fun lt!136051 () SeekEntryResult!1513)

(assert (=> b!272665 (= res!136653 (or (= lt!136051 (MissingZero!1513 i!1267)) (= lt!136051 (MissingVacant!1513 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13411 (_ BitVec 32)) SeekEntryResult!1513)

(assert (=> b!272665 (= lt!136051 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272666 () Bool)

(declare-fun res!136650 () Bool)

(assert (=> b!272666 (=> (not res!136650) (not e!174927))))

(assert (=> b!272666 (= res!136650 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26314 res!136654) b!272660))

(assert (= (and b!272660 res!136648) b!272664))

(assert (= (and b!272664 res!136656) b!272661))

(assert (= (and b!272661 res!136655) b!272663))

(assert (= (and b!272663 res!136652) b!272665))

(assert (= (and b!272665 res!136653) b!272662))

(assert (= (and b!272662 res!136649) b!272666))

(assert (= (and b!272666 res!136650) b!272659))

(assert (= (and b!272659 res!136651) b!272658))

(declare-fun m!287733 () Bool)

(assert (=> start!26314 m!287733))

(declare-fun m!287735 () Bool)

(assert (=> start!26314 m!287735))

(declare-fun m!287737 () Bool)

(assert (=> b!272658 m!287737))

(declare-fun m!287739 () Bool)

(assert (=> b!272658 m!287739))

(declare-fun m!287741 () Bool)

(assert (=> b!272658 m!287741))

(declare-fun m!287743 () Bool)

(assert (=> b!272661 m!287743))

(declare-fun m!287745 () Bool)

(assert (=> b!272659 m!287745))

(assert (=> b!272659 m!287745))

(declare-fun m!287747 () Bool)

(assert (=> b!272659 m!287747))

(declare-fun m!287749 () Bool)

(assert (=> b!272663 m!287749))

(declare-fun m!287751 () Bool)

(assert (=> b!272665 m!287751))

(declare-fun m!287753 () Bool)

(assert (=> b!272664 m!287753))

(declare-fun m!287755 () Bool)

(assert (=> b!272662 m!287755))

(push 1)

(assert (not b!272663))

(assert (not b!272658))

(assert (not b!272662))

(assert (not b!272661))

(assert (not start!26314))

(assert (not b!272665))

(assert (not b!272664))

(assert (not b!272659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

