; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26662 () Bool)

(assert start!26662)

(declare-fun b!276747 () Bool)

(declare-fun res!140738 () Bool)

(declare-fun e!176756 () Bool)

(assert (=> b!276747 (=> (not res!140738) (not e!176756))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276747 (= res!140738 (validKeyInArray!0 k!2581))))

(declare-fun b!276748 () Bool)

(declare-fun e!176755 () Bool)

(assert (=> b!276748 (= e!176755 false)))

(declare-fun lt!137734 () Bool)

(declare-datatypes ((array!13759 0))(
  ( (array!13760 (arr!6529 (Array (_ BitVec 32) (_ BitVec 64))) (size!6881 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13759)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13759 (_ BitVec 32)) Bool)

(assert (=> b!276748 (= lt!137734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140737 () Bool)

(assert (=> start!26662 (=> (not res!140737) (not e!176756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26662 (= res!140737 (validMask!0 mask!3868))))

(assert (=> start!26662 e!176756))

(declare-fun array_inv!4492 (array!13759) Bool)

(assert (=> start!26662 (array_inv!4492 a!3325)))

(assert (=> start!26662 true))

(declare-fun b!276749 () Bool)

(declare-fun res!140739 () Bool)

(assert (=> b!276749 (=> (not res!140739) (not e!176756))))

(declare-datatypes ((List!4337 0))(
  ( (Nil!4334) (Cons!4333 (h!5000 (_ BitVec 64)) (t!9419 List!4337)) )
))
(declare-fun arrayNoDuplicates!0 (array!13759 (_ BitVec 32) List!4337) Bool)

(assert (=> b!276749 (= res!140739 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4334))))

(declare-fun b!276750 () Bool)

(declare-fun res!140740 () Bool)

(assert (=> b!276750 (=> (not res!140740) (not e!176756))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276750 (= res!140740 (and (= (size!6881 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6881 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6881 a!3325))))))

(declare-fun b!276751 () Bool)

(declare-fun res!140741 () Bool)

(assert (=> b!276751 (=> (not res!140741) (not e!176756))))

(declare-fun arrayContainsKey!0 (array!13759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276751 (= res!140741 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276752 () Bool)

(assert (=> b!276752 (= e!176756 e!176755)))

(declare-fun res!140742 () Bool)

(assert (=> b!276752 (=> (not res!140742) (not e!176755))))

(declare-datatypes ((SeekEntryResult!1687 0))(
  ( (MissingZero!1687 (index!8918 (_ BitVec 32))) (Found!1687 (index!8919 (_ BitVec 32))) (Intermediate!1687 (undefined!2499 Bool) (index!8920 (_ BitVec 32)) (x!27172 (_ BitVec 32))) (Undefined!1687) (MissingVacant!1687 (index!8921 (_ BitVec 32))) )
))
(declare-fun lt!137733 () SeekEntryResult!1687)

(assert (=> b!276752 (= res!140742 (or (= lt!137733 (MissingZero!1687 i!1267)) (= lt!137733 (MissingVacant!1687 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13759 (_ BitVec 32)) SeekEntryResult!1687)

(assert (=> b!276752 (= lt!137733 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26662 res!140737) b!276750))

(assert (= (and b!276750 res!140740) b!276747))

(assert (= (and b!276747 res!140738) b!276749))

(assert (= (and b!276749 res!140739) b!276751))

(assert (= (and b!276751 res!140741) b!276752))

(assert (= (and b!276752 res!140742) b!276748))

(declare-fun m!292009 () Bool)

(assert (=> start!26662 m!292009))

(declare-fun m!292011 () Bool)

(assert (=> start!26662 m!292011))

(declare-fun m!292013 () Bool)

(assert (=> b!276751 m!292013))

(declare-fun m!292015 () Bool)

(assert (=> b!276748 m!292015))

(declare-fun m!292017 () Bool)

(assert (=> b!276749 m!292017))

(declare-fun m!292019 () Bool)

(assert (=> b!276747 m!292019))

(declare-fun m!292021 () Bool)

(assert (=> b!276752 m!292021))

(push 1)

(assert (not b!276748))

(assert (not b!276747))

(assert (not b!276749))

(assert (not b!276751))

(assert (not b!276752))

(assert (not start!26662))

(check-sat)

(pop 1)

