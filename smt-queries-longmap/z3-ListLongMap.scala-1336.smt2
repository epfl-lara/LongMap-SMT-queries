; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26576 () Bool)

(assert start!26576)

(declare-fun b!275763 () Bool)

(declare-fun res!139809 () Bool)

(declare-fun e!176258 () Bool)

(assert (=> b!275763 (=> (not res!139809) (not e!176258))))

(declare-datatypes ((array!13662 0))(
  ( (array!13663 (arr!6480 (Array (_ BitVec 32) (_ BitVec 64))) (size!6833 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13662)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275763 (= res!139809 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275764 () Bool)

(declare-fun res!139805 () Bool)

(assert (=> b!275764 (=> (not res!139805) (not e!176258))))

(declare-datatypes ((List!4261 0))(
  ( (Nil!4258) (Cons!4257 (h!4924 (_ BitVec 64)) (t!9334 List!4261)) )
))
(declare-fun arrayNoDuplicates!0 (array!13662 (_ BitVec 32) List!4261) Bool)

(assert (=> b!275764 (= res!139805 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4258))))

(declare-fun b!275765 () Bool)

(declare-fun e!176257 () Bool)

(assert (=> b!275765 (= e!176257 false)))

(declare-fun lt!137316 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13662 (_ BitVec 32)) Bool)

(assert (=> b!275765 (= lt!137316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275766 () Bool)

(declare-fun res!139808 () Bool)

(assert (=> b!275766 (=> (not res!139808) (not e!176258))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275766 (= res!139808 (and (= (size!6833 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6833 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6833 a!3325))))))

(declare-fun b!275767 () Bool)

(declare-fun res!139807 () Bool)

(assert (=> b!275767 (=> (not res!139807) (not e!176258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275767 (= res!139807 (validKeyInArray!0 k0!2581))))

(declare-fun res!139806 () Bool)

(assert (=> start!26576 (=> (not res!139806) (not e!176258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26576 (= res!139806 (validMask!0 mask!3868))))

(assert (=> start!26576 e!176258))

(declare-fun array_inv!4452 (array!13662) Bool)

(assert (=> start!26576 (array_inv!4452 a!3325)))

(assert (=> start!26576 true))

(declare-fun b!275768 () Bool)

(assert (=> b!275768 (= e!176258 e!176257)))

(declare-fun res!139810 () Bool)

(assert (=> b!275768 (=> (not res!139810) (not e!176257))))

(declare-datatypes ((SeekEntryResult!1637 0))(
  ( (MissingZero!1637 (index!8718 (_ BitVec 32))) (Found!1637 (index!8719 (_ BitVec 32))) (Intermediate!1637 (undefined!2449 Bool) (index!8720 (_ BitVec 32)) (x!27009 (_ BitVec 32))) (Undefined!1637) (MissingVacant!1637 (index!8721 (_ BitVec 32))) )
))
(declare-fun lt!137315 () SeekEntryResult!1637)

(assert (=> b!275768 (= res!139810 (or (= lt!137315 (MissingZero!1637 i!1267)) (= lt!137315 (MissingVacant!1637 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13662 (_ BitVec 32)) SeekEntryResult!1637)

(assert (=> b!275768 (= lt!137315 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26576 res!139806) b!275766))

(assert (= (and b!275766 res!139808) b!275767))

(assert (= (and b!275767 res!139807) b!275764))

(assert (= (and b!275764 res!139805) b!275763))

(assert (= (and b!275763 res!139809) b!275768))

(assert (= (and b!275768 res!139810) b!275765))

(declare-fun m!290789 () Bool)

(assert (=> b!275765 m!290789))

(declare-fun m!290791 () Bool)

(assert (=> start!26576 m!290791))

(declare-fun m!290793 () Bool)

(assert (=> start!26576 m!290793))

(declare-fun m!290795 () Bool)

(assert (=> b!275767 m!290795))

(declare-fun m!290797 () Bool)

(assert (=> b!275764 m!290797))

(declare-fun m!290799 () Bool)

(assert (=> b!275768 m!290799))

(declare-fun m!290801 () Bool)

(assert (=> b!275763 m!290801))

(check-sat (not b!275768) (not start!26576) (not b!275767) (not b!275763) (not b!275765) (not b!275764))
(check-sat)
