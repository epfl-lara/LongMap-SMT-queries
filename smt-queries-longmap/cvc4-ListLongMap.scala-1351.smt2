; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26668 () Bool)

(assert start!26668)

(declare-fun b!276801 () Bool)

(declare-fun e!176781 () Bool)

(declare-fun e!176783 () Bool)

(assert (=> b!276801 (= e!176781 e!176783)))

(declare-fun res!140792 () Bool)

(assert (=> b!276801 (=> (not res!140792) (not e!176783))))

(declare-datatypes ((SeekEntryResult!1690 0))(
  ( (MissingZero!1690 (index!8930 (_ BitVec 32))) (Found!1690 (index!8931 (_ BitVec 32))) (Intermediate!1690 (undefined!2502 Bool) (index!8932 (_ BitVec 32)) (x!27183 (_ BitVec 32))) (Undefined!1690) (MissingVacant!1690 (index!8933 (_ BitVec 32))) )
))
(declare-fun lt!137752 () SeekEntryResult!1690)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276801 (= res!140792 (or (= lt!137752 (MissingZero!1690 i!1267)) (= lt!137752 (MissingVacant!1690 i!1267))))))

(declare-datatypes ((array!13765 0))(
  ( (array!13766 (arr!6532 (Array (_ BitVec 32) (_ BitVec 64))) (size!6884 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13765)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13765 (_ BitVec 32)) SeekEntryResult!1690)

(assert (=> b!276801 (= lt!137752 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!140796 () Bool)

(assert (=> start!26668 (=> (not res!140796) (not e!176781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26668 (= res!140796 (validMask!0 mask!3868))))

(assert (=> start!26668 e!176781))

(declare-fun array_inv!4495 (array!13765) Bool)

(assert (=> start!26668 (array_inv!4495 a!3325)))

(assert (=> start!26668 true))

(declare-fun b!276802 () Bool)

(assert (=> b!276802 (= e!176783 false)))

(declare-fun lt!137751 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13765 (_ BitVec 32)) Bool)

(assert (=> b!276802 (= lt!137751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276803 () Bool)

(declare-fun res!140795 () Bool)

(assert (=> b!276803 (=> (not res!140795) (not e!176781))))

(declare-datatypes ((List!4340 0))(
  ( (Nil!4337) (Cons!4336 (h!5003 (_ BitVec 64)) (t!9422 List!4340)) )
))
(declare-fun arrayNoDuplicates!0 (array!13765 (_ BitVec 32) List!4340) Bool)

(assert (=> b!276803 (= res!140795 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4337))))

(declare-fun b!276804 () Bool)

(declare-fun res!140794 () Bool)

(assert (=> b!276804 (=> (not res!140794) (not e!176781))))

(declare-fun arrayContainsKey!0 (array!13765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276804 (= res!140794 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276805 () Bool)

(declare-fun res!140793 () Bool)

(assert (=> b!276805 (=> (not res!140793) (not e!176781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276805 (= res!140793 (validKeyInArray!0 k!2581))))

(declare-fun b!276806 () Bool)

(declare-fun res!140791 () Bool)

(assert (=> b!276806 (=> (not res!140791) (not e!176781))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276806 (= res!140791 (and (= (size!6884 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6884 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6884 a!3325))))))

(assert (= (and start!26668 res!140796) b!276806))

(assert (= (and b!276806 res!140791) b!276805))

(assert (= (and b!276805 res!140793) b!276803))

(assert (= (and b!276803 res!140795) b!276804))

(assert (= (and b!276804 res!140794) b!276801))

(assert (= (and b!276801 res!140792) b!276802))

(declare-fun m!292051 () Bool)

(assert (=> b!276802 m!292051))

(declare-fun m!292053 () Bool)

(assert (=> start!26668 m!292053))

(declare-fun m!292055 () Bool)

(assert (=> start!26668 m!292055))

(declare-fun m!292057 () Bool)

(assert (=> b!276804 m!292057))

(declare-fun m!292059 () Bool)

(assert (=> b!276805 m!292059))

(declare-fun m!292061 () Bool)

(assert (=> b!276803 m!292061))

(declare-fun m!292063 () Bool)

(assert (=> b!276801 m!292063))

(push 1)

(assert (not b!276804))

(assert (not b!276801))

(assert (not start!26668))

(assert (not b!276805))

(assert (not b!276802))

(assert (not b!276803))

(check-sat)

(pop 1)

