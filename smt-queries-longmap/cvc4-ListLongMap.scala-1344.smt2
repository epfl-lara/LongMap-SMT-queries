; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26626 () Bool)

(assert start!26626)

(declare-fun b!276414 () Bool)

(declare-fun res!140409 () Bool)

(declare-fun e!176593 () Bool)

(assert (=> b!276414 (=> (not res!140409) (not e!176593))))

(declare-datatypes ((array!13723 0))(
  ( (array!13724 (arr!6511 (Array (_ BitVec 32) (_ BitVec 64))) (size!6863 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13723)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276414 (= res!140409 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276415 () Bool)

(declare-fun res!140406 () Bool)

(assert (=> b!276415 (=> (not res!140406) (not e!176593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276415 (= res!140406 (validKeyInArray!0 k!2581))))

(declare-fun b!276416 () Bool)

(declare-fun res!140404 () Bool)

(assert (=> b!276416 (=> (not res!140404) (not e!176593))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276416 (= res!140404 (and (= (size!6863 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6863 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6863 a!3325))))))

(declare-fun b!276417 () Bool)

(declare-fun e!176592 () Bool)

(assert (=> b!276417 (= e!176593 e!176592)))

(declare-fun res!140405 () Bool)

(assert (=> b!276417 (=> (not res!140405) (not e!176592))))

(declare-datatypes ((SeekEntryResult!1669 0))(
  ( (MissingZero!1669 (index!8846 (_ BitVec 32))) (Found!1669 (index!8847 (_ BitVec 32))) (Intermediate!1669 (undefined!2481 Bool) (index!8848 (_ BitVec 32)) (x!27106 (_ BitVec 32))) (Undefined!1669) (MissingVacant!1669 (index!8849 (_ BitVec 32))) )
))
(declare-fun lt!137634 () SeekEntryResult!1669)

(assert (=> b!276417 (= res!140405 (or (= lt!137634 (MissingZero!1669 i!1267)) (= lt!137634 (MissingVacant!1669 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13723 (_ BitVec 32)) SeekEntryResult!1669)

(assert (=> b!276417 (= lt!137634 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276418 () Bool)

(assert (=> b!276418 (= e!176592 false)))

(declare-fun lt!137635 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13723 (_ BitVec 32)) Bool)

(assert (=> b!276418 (= lt!137635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276419 () Bool)

(declare-fun res!140407 () Bool)

(assert (=> b!276419 (=> (not res!140407) (not e!176593))))

(declare-datatypes ((List!4319 0))(
  ( (Nil!4316) (Cons!4315 (h!4982 (_ BitVec 64)) (t!9401 List!4319)) )
))
(declare-fun arrayNoDuplicates!0 (array!13723 (_ BitVec 32) List!4319) Bool)

(assert (=> b!276419 (= res!140407 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4316))))

(declare-fun res!140408 () Bool)

(assert (=> start!26626 (=> (not res!140408) (not e!176593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26626 (= res!140408 (validMask!0 mask!3868))))

(assert (=> start!26626 e!176593))

(declare-fun array_inv!4474 (array!13723) Bool)

(assert (=> start!26626 (array_inv!4474 a!3325)))

(assert (=> start!26626 true))

(assert (= (and start!26626 res!140408) b!276416))

(assert (= (and b!276416 res!140404) b!276415))

(assert (= (and b!276415 res!140406) b!276419))

(assert (= (and b!276419 res!140407) b!276414))

(assert (= (and b!276414 res!140409) b!276417))

(assert (= (and b!276417 res!140405) b!276418))

(declare-fun m!291757 () Bool)

(assert (=> start!26626 m!291757))

(declare-fun m!291759 () Bool)

(assert (=> start!26626 m!291759))

(declare-fun m!291761 () Bool)

(assert (=> b!276414 m!291761))

(declare-fun m!291763 () Bool)

(assert (=> b!276418 m!291763))

(declare-fun m!291765 () Bool)

(assert (=> b!276417 m!291765))

(declare-fun m!291767 () Bool)

(assert (=> b!276415 m!291767))

(declare-fun m!291769 () Bool)

(assert (=> b!276419 m!291769))

(push 1)

(assert (not b!276418))

(assert (not b!276414))

(assert (not b!276419))

(assert (not start!26626))

(assert (not b!276417))

(assert (not b!276415))

(check-sat)

(pop 1)

(push 1)

