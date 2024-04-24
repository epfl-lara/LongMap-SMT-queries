; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27138 () Bool)

(assert start!27138)

(declare-fun b!280736 () Bool)

(declare-fun res!143783 () Bool)

(declare-fun e!178648 () Bool)

(assert (=> b!280736 (=> (not res!143783) (not e!178648))))

(declare-datatypes ((array!13955 0))(
  ( (array!13956 (arr!6619 (Array (_ BitVec 32) (_ BitVec 64))) (size!6971 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13955)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13955 (_ BitVec 32)) Bool)

(assert (=> b!280736 (= res!143783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!143780 () Bool)

(declare-fun e!178647 () Bool)

(assert (=> start!27138 (=> (not res!143780) (not e!178647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27138 (= res!143780 (validMask!0 mask!3868))))

(assert (=> start!27138 e!178647))

(declare-fun array_inv!4569 (array!13955) Bool)

(assert (=> start!27138 (array_inv!4569 a!3325)))

(assert (=> start!27138 true))

(declare-fun b!280737 () Bool)

(declare-fun res!143785 () Bool)

(assert (=> b!280737 (=> (not res!143785) (not e!178648))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280737 (= res!143785 (not (= startIndex!26 i!1267)))))

(declare-fun b!280738 () Bool)

(declare-fun res!143782 () Bool)

(assert (=> b!280738 (=> (not res!143782) (not e!178647))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280738 (= res!143782 (validKeyInArray!0 k0!2581))))

(declare-fun b!280739 () Bool)

(declare-fun res!143781 () Bool)

(assert (=> b!280739 (=> (not res!143781) (not e!178647))))

(declare-datatypes ((List!4340 0))(
  ( (Nil!4337) (Cons!4336 (h!5006 (_ BitVec 64)) (t!9414 List!4340)) )
))
(declare-fun arrayNoDuplicates!0 (array!13955 (_ BitVec 32) List!4340) Bool)

(assert (=> b!280739 (= res!143781 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4337))))

(declare-fun b!280740 () Bool)

(assert (=> b!280740 (= e!178648 (not true))))

(assert (=> b!280740 (arrayNoDuplicates!0 (array!13956 (store (arr!6619 a!3325) i!1267 k0!2581) (size!6971 a!3325)) #b00000000000000000000000000000000 Nil!4337)))

(declare-datatypes ((Unit!8814 0))(
  ( (Unit!8815) )
))
(declare-fun lt!138941 () Unit!8814)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13955 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4340) Unit!8814)

(assert (=> b!280740 (= lt!138941 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4337))))

(declare-fun b!280741 () Bool)

(declare-fun res!143784 () Bool)

(assert (=> b!280741 (=> (not res!143784) (not e!178647))))

(declare-fun arrayContainsKey!0 (array!13955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280741 (= res!143784 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280742 () Bool)

(declare-fun res!143779 () Bool)

(assert (=> b!280742 (=> (not res!143779) (not e!178647))))

(assert (=> b!280742 (= res!143779 (and (= (size!6971 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6971 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6971 a!3325))))))

(declare-fun b!280743 () Bool)

(declare-fun res!143786 () Bool)

(assert (=> b!280743 (=> (not res!143786) (not e!178648))))

(assert (=> b!280743 (= res!143786 (validKeyInArray!0 (select (arr!6619 a!3325) startIndex!26)))))

(declare-fun b!280744 () Bool)

(assert (=> b!280744 (= e!178647 e!178648)))

(declare-fun res!143787 () Bool)

(assert (=> b!280744 (=> (not res!143787) (not e!178648))))

(declare-datatypes ((SeekEntryResult!1742 0))(
  ( (MissingZero!1742 (index!9138 (_ BitVec 32))) (Found!1742 (index!9139 (_ BitVec 32))) (Intermediate!1742 (undefined!2554 Bool) (index!9140 (_ BitVec 32)) (x!27484 (_ BitVec 32))) (Undefined!1742) (MissingVacant!1742 (index!9141 (_ BitVec 32))) )
))
(declare-fun lt!138942 () SeekEntryResult!1742)

(assert (=> b!280744 (= res!143787 (or (= lt!138942 (MissingZero!1742 i!1267)) (= lt!138942 (MissingVacant!1742 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13955 (_ BitVec 32)) SeekEntryResult!1742)

(assert (=> b!280744 (= lt!138942 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27138 res!143780) b!280742))

(assert (= (and b!280742 res!143779) b!280738))

(assert (= (and b!280738 res!143782) b!280739))

(assert (= (and b!280739 res!143781) b!280741))

(assert (= (and b!280741 res!143784) b!280744))

(assert (= (and b!280744 res!143787) b!280736))

(assert (= (and b!280736 res!143783) b!280737))

(assert (= (and b!280737 res!143785) b!280743))

(assert (= (and b!280743 res!143786) b!280740))

(declare-fun m!295301 () Bool)

(assert (=> start!27138 m!295301))

(declare-fun m!295303 () Bool)

(assert (=> start!27138 m!295303))

(declare-fun m!295305 () Bool)

(assert (=> b!280739 m!295305))

(declare-fun m!295307 () Bool)

(assert (=> b!280738 m!295307))

(declare-fun m!295309 () Bool)

(assert (=> b!280744 m!295309))

(declare-fun m!295311 () Bool)

(assert (=> b!280736 m!295311))

(declare-fun m!295313 () Bool)

(assert (=> b!280741 m!295313))

(declare-fun m!295315 () Bool)

(assert (=> b!280740 m!295315))

(declare-fun m!295317 () Bool)

(assert (=> b!280740 m!295317))

(declare-fun m!295319 () Bool)

(assert (=> b!280740 m!295319))

(declare-fun m!295321 () Bool)

(assert (=> b!280743 m!295321))

(assert (=> b!280743 m!295321))

(declare-fun m!295323 () Bool)

(assert (=> b!280743 m!295323))

(check-sat (not b!280740) (not b!280739) (not start!27138) (not b!280736) (not b!280743) (not b!280744) (not b!280741) (not b!280738))
(check-sat)
