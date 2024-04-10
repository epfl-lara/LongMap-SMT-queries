; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26546 () Bool)

(assert start!26546)

(declare-fun b!275514 () Bool)

(declare-fun e!176233 () Bool)

(declare-fun e!176232 () Bool)

(assert (=> b!275514 (= e!176233 e!176232)))

(declare-fun res!139505 () Bool)

(assert (=> b!275514 (=> (not res!139505) (not e!176232))))

(declare-datatypes ((SeekEntryResult!1629 0))(
  ( (MissingZero!1629 (index!8686 (_ BitVec 32))) (Found!1629 (index!8687 (_ BitVec 32))) (Intermediate!1629 (undefined!2441 Bool) (index!8688 (_ BitVec 32)) (x!26962 (_ BitVec 32))) (Undefined!1629) (MissingVacant!1629 (index!8689 (_ BitVec 32))) )
))
(declare-fun lt!137413 () SeekEntryResult!1629)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275514 (= res!139505 (or (= lt!137413 (MissingZero!1629 i!1267)) (= lt!137413 (MissingVacant!1629 i!1267))))))

(declare-datatypes ((array!13643 0))(
  ( (array!13644 (arr!6471 (Array (_ BitVec 32) (_ BitVec 64))) (size!6823 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13643)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13643 (_ BitVec 32)) SeekEntryResult!1629)

(assert (=> b!275514 (= lt!137413 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275515 () Bool)

(assert (=> b!275515 (= e!176232 false)))

(declare-fun lt!137412 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13643 (_ BitVec 32)) Bool)

(assert (=> b!275515 (= lt!137412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275516 () Bool)

(declare-fun res!139509 () Bool)

(assert (=> b!275516 (=> (not res!139509) (not e!176233))))

(declare-fun arrayContainsKey!0 (array!13643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275516 (= res!139509 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139506 () Bool)

(assert (=> start!26546 (=> (not res!139506) (not e!176233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26546 (= res!139506 (validMask!0 mask!3868))))

(assert (=> start!26546 e!176233))

(declare-fun array_inv!4434 (array!13643) Bool)

(assert (=> start!26546 (array_inv!4434 a!3325)))

(assert (=> start!26546 true))

(declare-fun b!275517 () Bool)

(declare-fun res!139508 () Bool)

(assert (=> b!275517 (=> (not res!139508) (not e!176233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275517 (= res!139508 (validKeyInArray!0 k0!2581))))

(declare-fun b!275518 () Bool)

(declare-fun res!139507 () Bool)

(assert (=> b!275518 (=> (not res!139507) (not e!176233))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275518 (= res!139507 (and (= (size!6823 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6823 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6823 a!3325))))))

(declare-fun b!275519 () Bool)

(declare-fun res!139504 () Bool)

(assert (=> b!275519 (=> (not res!139504) (not e!176233))))

(declare-datatypes ((List!4279 0))(
  ( (Nil!4276) (Cons!4275 (h!4942 (_ BitVec 64)) (t!9361 List!4279)) )
))
(declare-fun arrayNoDuplicates!0 (array!13643 (_ BitVec 32) List!4279) Bool)

(assert (=> b!275519 (= res!139504 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4276))))

(assert (= (and start!26546 res!139506) b!275518))

(assert (= (and b!275518 res!139507) b!275517))

(assert (= (and b!275517 res!139508) b!275519))

(assert (= (and b!275519 res!139504) b!275516))

(assert (= (and b!275516 res!139509) b!275514))

(assert (= (and b!275514 res!139505) b!275515))

(declare-fun m!291065 () Bool)

(assert (=> b!275516 m!291065))

(declare-fun m!291067 () Bool)

(assert (=> b!275519 m!291067))

(declare-fun m!291069 () Bool)

(assert (=> b!275517 m!291069))

(declare-fun m!291071 () Bool)

(assert (=> b!275514 m!291071))

(declare-fun m!291073 () Bool)

(assert (=> b!275515 m!291073))

(declare-fun m!291075 () Bool)

(assert (=> start!26546 m!291075))

(declare-fun m!291077 () Bool)

(assert (=> start!26546 m!291077))

(check-sat (not b!275515) (not b!275517) (not b!275514) (not start!26546) (not b!275519) (not b!275516))
(check-sat)
