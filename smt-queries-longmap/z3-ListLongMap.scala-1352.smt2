; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26672 () Bool)

(assert start!26672)

(declare-fun b!276837 () Bool)

(declare-fun e!176801 () Bool)

(assert (=> b!276837 (= e!176801 false)))

(declare-fun lt!137763 () Bool)

(declare-datatypes ((array!13769 0))(
  ( (array!13770 (arr!6534 (Array (_ BitVec 32) (_ BitVec 64))) (size!6886 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13769)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13769 (_ BitVec 32)) Bool)

(assert (=> b!276837 (= lt!137763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140827 () Bool)

(declare-fun e!176800 () Bool)

(assert (=> start!26672 (=> (not res!140827) (not e!176800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26672 (= res!140827 (validMask!0 mask!3868))))

(assert (=> start!26672 e!176800))

(declare-fun array_inv!4497 (array!13769) Bool)

(assert (=> start!26672 (array_inv!4497 a!3325)))

(assert (=> start!26672 true))

(declare-fun b!276838 () Bool)

(declare-fun res!140831 () Bool)

(assert (=> b!276838 (=> (not res!140831) (not e!176800))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276838 (= res!140831 (and (= (size!6886 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6886 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6886 a!3325))))))

(declare-fun b!276839 () Bool)

(declare-fun res!140832 () Bool)

(assert (=> b!276839 (=> (not res!140832) (not e!176800))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276839 (= res!140832 (validKeyInArray!0 k0!2581))))

(declare-fun b!276840 () Bool)

(assert (=> b!276840 (= e!176800 e!176801)))

(declare-fun res!140830 () Bool)

(assert (=> b!276840 (=> (not res!140830) (not e!176801))))

(declare-datatypes ((SeekEntryResult!1692 0))(
  ( (MissingZero!1692 (index!8938 (_ BitVec 32))) (Found!1692 (index!8939 (_ BitVec 32))) (Intermediate!1692 (undefined!2504 Bool) (index!8940 (_ BitVec 32)) (x!27193 (_ BitVec 32))) (Undefined!1692) (MissingVacant!1692 (index!8941 (_ BitVec 32))) )
))
(declare-fun lt!137764 () SeekEntryResult!1692)

(assert (=> b!276840 (= res!140830 (or (= lt!137764 (MissingZero!1692 i!1267)) (= lt!137764 (MissingVacant!1692 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13769 (_ BitVec 32)) SeekEntryResult!1692)

(assert (=> b!276840 (= lt!137764 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276841 () Bool)

(declare-fun res!140828 () Bool)

(assert (=> b!276841 (=> (not res!140828) (not e!176800))))

(declare-fun arrayContainsKey!0 (array!13769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276841 (= res!140828 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276842 () Bool)

(declare-fun res!140829 () Bool)

(assert (=> b!276842 (=> (not res!140829) (not e!176800))))

(declare-datatypes ((List!4342 0))(
  ( (Nil!4339) (Cons!4338 (h!5005 (_ BitVec 64)) (t!9424 List!4342)) )
))
(declare-fun arrayNoDuplicates!0 (array!13769 (_ BitVec 32) List!4342) Bool)

(assert (=> b!276842 (= res!140829 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4339))))

(assert (= (and start!26672 res!140827) b!276838))

(assert (= (and b!276838 res!140831) b!276839))

(assert (= (and b!276839 res!140832) b!276842))

(assert (= (and b!276842 res!140829) b!276841))

(assert (= (and b!276841 res!140828) b!276840))

(assert (= (and b!276840 res!140830) b!276837))

(declare-fun m!292079 () Bool)

(assert (=> start!26672 m!292079))

(declare-fun m!292081 () Bool)

(assert (=> start!26672 m!292081))

(declare-fun m!292083 () Bool)

(assert (=> b!276837 m!292083))

(declare-fun m!292085 () Bool)

(assert (=> b!276840 m!292085))

(declare-fun m!292087 () Bool)

(assert (=> b!276841 m!292087))

(declare-fun m!292089 () Bool)

(assert (=> b!276839 m!292089))

(declare-fun m!292091 () Bool)

(assert (=> b!276842 m!292091))

(check-sat (not b!276842) (not b!276839) (not start!26672) (not b!276840) (not b!276837) (not b!276841))
(check-sat)
