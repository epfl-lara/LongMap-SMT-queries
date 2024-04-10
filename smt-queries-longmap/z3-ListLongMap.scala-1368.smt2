; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26906 () Bool)

(assert start!26906)

(declare-fun b!278856 () Bool)

(declare-fun res!142198 () Bool)

(declare-fun e!177841 () Bool)

(assert (=> b!278856 (=> (not res!142198) (not e!177841))))

(declare-datatypes ((array!13871 0))(
  ( (array!13872 (arr!6582 (Array (_ BitVec 32) (_ BitVec 64))) (size!6934 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13871)

(declare-datatypes ((List!4390 0))(
  ( (Nil!4387) (Cons!4386 (h!5056 (_ BitVec 64)) (t!9472 List!4390)) )
))
(declare-fun arrayNoDuplicates!0 (array!13871 (_ BitVec 32) List!4390) Bool)

(assert (=> b!278856 (= res!142198 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4387))))

(declare-fun b!278857 () Bool)

(declare-fun res!142200 () Bool)

(assert (=> b!278857 (=> (not res!142200) (not e!177841))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!278857 (= res!142200 (and (= (size!6934 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6934 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6934 a!3325))))))

(declare-fun b!278858 () Bool)

(declare-fun res!142196 () Bool)

(assert (=> b!278858 (=> (not res!142196) (not e!177841))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278858 (= res!142196 (validKeyInArray!0 k0!2581))))

(declare-fun b!278859 () Bool)

(declare-fun e!177840 () Bool)

(assert (=> b!278859 (= e!177840 false)))

(declare-fun lt!138501 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13871 (_ BitVec 32)) Bool)

(assert (=> b!278859 (= lt!138501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278860 () Bool)

(declare-fun res!142199 () Bool)

(assert (=> b!278860 (=> (not res!142199) (not e!177841))))

(declare-fun arrayContainsKey!0 (array!13871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278860 (= res!142199 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!142197 () Bool)

(assert (=> start!26906 (=> (not res!142197) (not e!177841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26906 (= res!142197 (validMask!0 mask!3868))))

(assert (=> start!26906 e!177841))

(declare-fun array_inv!4545 (array!13871) Bool)

(assert (=> start!26906 (array_inv!4545 a!3325)))

(assert (=> start!26906 true))

(declare-fun b!278861 () Bool)

(assert (=> b!278861 (= e!177841 e!177840)))

(declare-fun res!142195 () Bool)

(assert (=> b!278861 (=> (not res!142195) (not e!177840))))

(declare-datatypes ((SeekEntryResult!1740 0))(
  ( (MissingZero!1740 (index!9130 (_ BitVec 32))) (Found!1740 (index!9131 (_ BitVec 32))) (Intermediate!1740 (undefined!2552 Bool) (index!9132 (_ BitVec 32)) (x!27378 (_ BitVec 32))) (Undefined!1740) (MissingVacant!1740 (index!9133 (_ BitVec 32))) )
))
(declare-fun lt!138502 () SeekEntryResult!1740)

(assert (=> b!278861 (= res!142195 (or (= lt!138502 (MissingZero!1740 i!1267)) (= lt!138502 (MissingVacant!1740 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13871 (_ BitVec 32)) SeekEntryResult!1740)

(assert (=> b!278861 (= lt!138502 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26906 res!142197) b!278857))

(assert (= (and b!278857 res!142200) b!278858))

(assert (= (and b!278858 res!142196) b!278856))

(assert (= (and b!278856 res!142198) b!278860))

(assert (= (and b!278860 res!142199) b!278861))

(assert (= (and b!278861 res!142195) b!278859))

(declare-fun m!293801 () Bool)

(assert (=> b!278859 m!293801))

(declare-fun m!293803 () Bool)

(assert (=> b!278858 m!293803))

(declare-fun m!293805 () Bool)

(assert (=> b!278861 m!293805))

(declare-fun m!293807 () Bool)

(assert (=> start!26906 m!293807))

(declare-fun m!293809 () Bool)

(assert (=> start!26906 m!293809))

(declare-fun m!293811 () Bool)

(assert (=> b!278856 m!293811))

(declare-fun m!293813 () Bool)

(assert (=> b!278860 m!293813))

(check-sat (not b!278856) (not start!26906) (not b!278861) (not b!278860) (not b!278859) (not b!278858))
(check-sat)
