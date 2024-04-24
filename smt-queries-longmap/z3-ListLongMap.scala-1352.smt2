; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26670 () Bool)

(assert start!26670)

(declare-fun res!140833 () Bool)

(declare-fun e!176816 () Bool)

(assert (=> start!26670 (=> (not res!140833) (not e!176816))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26670 (= res!140833 (validMask!0 mask!3868))))

(assert (=> start!26670 e!176816))

(declare-datatypes ((array!13766 0))(
  ( (array!13767 (arr!6532 (Array (_ BitVec 32) (_ BitVec 64))) (size!6884 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13766)

(declare-fun array_inv!4482 (array!13766) Bool)

(assert (=> start!26670 (array_inv!4482 a!3325)))

(assert (=> start!26670 true))

(declare-fun b!276866 () Bool)

(declare-fun res!140834 () Bool)

(assert (=> b!276866 (=> (not res!140834) (not e!176816))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276866 (= res!140834 (and (= (size!6884 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6884 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6884 a!3325))))))

(declare-fun b!276867 () Bool)

(declare-fun res!140831 () Bool)

(assert (=> b!276867 (=> (not res!140831) (not e!176816))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276867 (= res!140831 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276868 () Bool)

(declare-fun e!176815 () Bool)

(assert (=> b!276868 (= e!176816 e!176815)))

(declare-fun res!140832 () Bool)

(assert (=> b!276868 (=> (not res!140832) (not e!176815))))

(declare-datatypes ((SeekEntryResult!1655 0))(
  ( (MissingZero!1655 (index!8790 (_ BitVec 32))) (Found!1655 (index!8791 (_ BitVec 32))) (Intermediate!1655 (undefined!2467 Bool) (index!8792 (_ BitVec 32)) (x!27156 (_ BitVec 32))) (Undefined!1655) (MissingVacant!1655 (index!8793 (_ BitVec 32))) )
))
(declare-fun lt!137817 () SeekEntryResult!1655)

(assert (=> b!276868 (= res!140832 (or (= lt!137817 (MissingZero!1655 i!1267)) (= lt!137817 (MissingVacant!1655 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13766 (_ BitVec 32)) SeekEntryResult!1655)

(assert (=> b!276868 (= lt!137817 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276869 () Bool)

(declare-fun res!140835 () Bool)

(assert (=> b!276869 (=> (not res!140835) (not e!176816))))

(declare-datatypes ((List!4253 0))(
  ( (Nil!4250) (Cons!4249 (h!4916 (_ BitVec 64)) (t!9327 List!4253)) )
))
(declare-fun arrayNoDuplicates!0 (array!13766 (_ BitVec 32) List!4253) Bool)

(assert (=> b!276869 (= res!140835 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4250))))

(declare-fun b!276870 () Bool)

(declare-fun res!140830 () Bool)

(assert (=> b!276870 (=> (not res!140830) (not e!176816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276870 (= res!140830 (validKeyInArray!0 k0!2581))))

(declare-fun b!276871 () Bool)

(assert (=> b!276871 (= e!176815 false)))

(declare-fun lt!137816 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13766 (_ BitVec 32)) Bool)

(assert (=> b!276871 (= lt!137816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26670 res!140833) b!276866))

(assert (= (and b!276866 res!140834) b!276870))

(assert (= (and b!276870 res!140830) b!276869))

(assert (= (and b!276869 res!140835) b!276867))

(assert (= (and b!276867 res!140831) b!276868))

(assert (= (and b!276868 res!140832) b!276871))

(declare-fun m!292271 () Bool)

(assert (=> b!276869 m!292271))

(declare-fun m!292273 () Bool)

(assert (=> b!276870 m!292273))

(declare-fun m!292275 () Bool)

(assert (=> b!276871 m!292275))

(declare-fun m!292277 () Bool)

(assert (=> b!276868 m!292277))

(declare-fun m!292279 () Bool)

(assert (=> start!26670 m!292279))

(declare-fun m!292281 () Bool)

(assert (=> start!26670 m!292281))

(declare-fun m!292283 () Bool)

(assert (=> b!276867 m!292283))

(check-sat (not b!276871) (not start!26670) (not b!276868) (not b!276870) (not b!276867) (not b!276869))
(check-sat)
