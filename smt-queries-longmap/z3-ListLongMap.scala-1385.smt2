; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27164 () Bool)

(assert start!27164)

(declare-fun b!280866 () Bool)

(declare-fun e!178632 () Bool)

(declare-fun e!178631 () Bool)

(assert (=> b!280866 (= e!178632 e!178631)))

(declare-fun res!143990 () Bool)

(assert (=> b!280866 (=> (not res!143990) (not e!178631))))

(declare-datatypes ((SeekEntryResult!1784 0))(
  ( (MissingZero!1784 (index!9306 (_ BitVec 32))) (Found!1784 (index!9307 (_ BitVec 32))) (Intermediate!1784 (undefined!2596 Bool) (index!9308 (_ BitVec 32)) (x!27557 (_ BitVec 32))) (Undefined!1784) (MissingVacant!1784 (index!9309 (_ BitVec 32))) )
))
(declare-fun lt!138774 () SeekEntryResult!1784)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280866 (= res!143990 (or (= lt!138774 (MissingZero!1784 i!1267)) (= lt!138774 (MissingVacant!1784 i!1267))))))

(declare-datatypes ((array!13971 0))(
  ( (array!13972 (arr!6627 (Array (_ BitVec 32) (_ BitVec 64))) (size!6980 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13971)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13971 (_ BitVec 32)) SeekEntryResult!1784)

(assert (=> b!280866 (= lt!138774 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280867 () Bool)

(declare-fun res!143992 () Bool)

(assert (=> b!280867 (=> (not res!143992) (not e!178632))))

(declare-datatypes ((List!4408 0))(
  ( (Nil!4405) (Cons!4404 (h!5074 (_ BitVec 64)) (t!9481 List!4408)) )
))
(declare-fun arrayNoDuplicates!0 (array!13971 (_ BitVec 32) List!4408) Bool)

(assert (=> b!280867 (= res!143992 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4405))))

(declare-fun b!280868 () Bool)

(declare-fun res!143988 () Bool)

(assert (=> b!280868 (=> (not res!143988) (not e!178632))))

(declare-fun arrayContainsKey!0 (array!13971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280868 (= res!143988 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280869 () Bool)

(declare-fun res!143993 () Bool)

(assert (=> b!280869 (=> (not res!143993) (not e!178631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13971 (_ BitVec 32)) Bool)

(assert (=> b!280869 (= res!143993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280870 () Bool)

(assert (=> b!280870 (= e!178631 (not true))))

(assert (=> b!280870 (arrayNoDuplicates!0 (array!13972 (store (arr!6627 a!3325) i!1267 k0!2581) (size!6980 a!3325)) #b00000000000000000000000000000000 Nil!4405)))

(declare-datatypes ((Unit!8814 0))(
  ( (Unit!8815) )
))
(declare-fun lt!138773 () Unit!8814)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13971 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4408) Unit!8814)

(assert (=> b!280870 (= lt!138773 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4405))))

(declare-fun res!143995 () Bool)

(assert (=> start!27164 (=> (not res!143995) (not e!178632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27164 (= res!143995 (validMask!0 mask!3868))))

(assert (=> start!27164 e!178632))

(declare-fun array_inv!4599 (array!13971) Bool)

(assert (=> start!27164 (array_inv!4599 a!3325)))

(assert (=> start!27164 true))

(declare-fun b!280871 () Bool)

(declare-fun res!143994 () Bool)

(assert (=> b!280871 (=> (not res!143994) (not e!178632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280871 (= res!143994 (validKeyInArray!0 k0!2581))))

(declare-fun b!280872 () Bool)

(declare-fun res!143991 () Bool)

(assert (=> b!280872 (=> (not res!143991) (not e!178631))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280872 (= res!143991 (validKeyInArray!0 (select (arr!6627 a!3325) startIndex!26)))))

(declare-fun b!280873 () Bool)

(declare-fun res!143989 () Bool)

(assert (=> b!280873 (=> (not res!143989) (not e!178632))))

(assert (=> b!280873 (= res!143989 (and (= (size!6980 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6980 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6980 a!3325))))))

(declare-fun b!280874 () Bool)

(declare-fun res!143987 () Bool)

(assert (=> b!280874 (=> (not res!143987) (not e!178631))))

(assert (=> b!280874 (= res!143987 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27164 res!143995) b!280873))

(assert (= (and b!280873 res!143989) b!280871))

(assert (= (and b!280871 res!143994) b!280867))

(assert (= (and b!280867 res!143992) b!280868))

(assert (= (and b!280868 res!143988) b!280866))

(assert (= (and b!280866 res!143990) b!280869))

(assert (= (and b!280869 res!143993) b!280874))

(assert (= (and b!280874 res!143987) b!280872))

(assert (= (and b!280872 res!143991) b!280870))

(declare-fun m!294791 () Bool)

(assert (=> b!280866 m!294791))

(declare-fun m!294793 () Bool)

(assert (=> b!280872 m!294793))

(assert (=> b!280872 m!294793))

(declare-fun m!294795 () Bool)

(assert (=> b!280872 m!294795))

(declare-fun m!294797 () Bool)

(assert (=> b!280867 m!294797))

(declare-fun m!294799 () Bool)

(assert (=> start!27164 m!294799))

(declare-fun m!294801 () Bool)

(assert (=> start!27164 m!294801))

(declare-fun m!294803 () Bool)

(assert (=> b!280869 m!294803))

(declare-fun m!294805 () Bool)

(assert (=> b!280870 m!294805))

(declare-fun m!294807 () Bool)

(assert (=> b!280870 m!294807))

(declare-fun m!294809 () Bool)

(assert (=> b!280870 m!294809))

(declare-fun m!294811 () Bool)

(assert (=> b!280871 m!294811))

(declare-fun m!294813 () Bool)

(assert (=> b!280868 m!294813))

(check-sat (not b!280871) (not b!280869) (not b!280868) (not b!280870) (not start!27164) (not b!280867) (not b!280872) (not b!280866))
(check-sat)
