; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27138 () Bool)

(assert start!27138)

(declare-fun b!280689 () Bool)

(declare-fun res!143763 () Bool)

(declare-fun e!178624 () Bool)

(assert (=> b!280689 (=> (not res!143763) (not e!178624))))

(declare-datatypes ((array!13956 0))(
  ( (array!13957 (arr!6620 (Array (_ BitVec 32) (_ BitVec 64))) (size!6972 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13956)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280689 (= res!143763 (and (= (size!6972 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6972 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6972 a!3325))))))

(declare-fun b!280690 () Bool)

(declare-fun res!143766 () Bool)

(assert (=> b!280690 (=> (not res!143766) (not e!178624))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280690 (= res!143766 (validKeyInArray!0 k!2581))))

(declare-fun b!280691 () Bool)

(declare-fun res!143760 () Bool)

(declare-fun e!178625 () Bool)

(assert (=> b!280691 (=> (not res!143760) (not e!178625))))

(assert (=> b!280691 (= res!143760 (validKeyInArray!0 (select (arr!6620 a!3325) startIndex!26)))))

(declare-fun b!280692 () Bool)

(assert (=> b!280692 (= e!178624 e!178625)))

(declare-fun res!143764 () Bool)

(assert (=> b!280692 (=> (not res!143764) (not e!178625))))

(declare-datatypes ((SeekEntryResult!1778 0))(
  ( (MissingZero!1778 (index!9282 (_ BitVec 32))) (Found!1778 (index!9283 (_ BitVec 32))) (Intermediate!1778 (undefined!2590 Bool) (index!9284 (_ BitVec 32)) (x!27520 (_ BitVec 32))) (Undefined!1778) (MissingVacant!1778 (index!9285 (_ BitVec 32))) )
))
(declare-fun lt!138883 () SeekEntryResult!1778)

(assert (=> b!280692 (= res!143764 (or (= lt!138883 (MissingZero!1778 i!1267)) (= lt!138883 (MissingVacant!1778 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13956 (_ BitVec 32)) SeekEntryResult!1778)

(assert (=> b!280692 (= lt!138883 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!143758 () Bool)

(assert (=> start!27138 (=> (not res!143758) (not e!178624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27138 (= res!143758 (validMask!0 mask!3868))))

(assert (=> start!27138 e!178624))

(declare-fun array_inv!4583 (array!13956) Bool)

(assert (=> start!27138 (array_inv!4583 a!3325)))

(assert (=> start!27138 true))

(declare-fun b!280693 () Bool)

(declare-fun res!143759 () Bool)

(assert (=> b!280693 (=> (not res!143759) (not e!178624))))

(declare-datatypes ((List!4428 0))(
  ( (Nil!4425) (Cons!4424 (h!5094 (_ BitVec 64)) (t!9510 List!4428)) )
))
(declare-fun arrayNoDuplicates!0 (array!13956 (_ BitVec 32) List!4428) Bool)

(assert (=> b!280693 (= res!143759 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4425))))

(declare-fun b!280694 () Bool)

(declare-fun res!143762 () Bool)

(assert (=> b!280694 (=> (not res!143762) (not e!178625))))

(assert (=> b!280694 (= res!143762 (not (= startIndex!26 i!1267)))))

(declare-fun b!280695 () Bool)

(declare-fun res!143765 () Bool)

(assert (=> b!280695 (=> (not res!143765) (not e!178625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13956 (_ BitVec 32)) Bool)

(assert (=> b!280695 (= res!143765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280696 () Bool)

(declare-fun res!143761 () Bool)

(assert (=> b!280696 (=> (not res!143761) (not e!178624))))

(declare-fun arrayContainsKey!0 (array!13956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280696 (= res!143761 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280697 () Bool)

(assert (=> b!280697 (= e!178625 (not true))))

(assert (=> b!280697 (arrayNoDuplicates!0 (array!13957 (store (arr!6620 a!3325) i!1267 k!2581) (size!6972 a!3325)) #b00000000000000000000000000000000 Nil!4425)))

(declare-datatypes ((Unit!8840 0))(
  ( (Unit!8841) )
))
(declare-fun lt!138882 () Unit!8840)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13956 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4428) Unit!8840)

(assert (=> b!280697 (= lt!138882 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4425))))

(assert (= (and start!27138 res!143758) b!280689))

(assert (= (and b!280689 res!143763) b!280690))

(assert (= (and b!280690 res!143766) b!280693))

(assert (= (and b!280693 res!143759) b!280696))

(assert (= (and b!280696 res!143761) b!280692))

(assert (= (and b!280692 res!143764) b!280695))

(assert (= (and b!280695 res!143765) b!280694))

(assert (= (and b!280694 res!143762) b!280691))

(assert (= (and b!280691 res!143760) b!280697))

(declare-fun m!295095 () Bool)

(assert (=> b!280697 m!295095))

(declare-fun m!295097 () Bool)

(assert (=> b!280697 m!295097))

(declare-fun m!295099 () Bool)

(assert (=> b!280697 m!295099))

(declare-fun m!295101 () Bool)

(assert (=> b!280693 m!295101))

(declare-fun m!295103 () Bool)

(assert (=> b!280690 m!295103))

(declare-fun m!295105 () Bool)

(assert (=> b!280692 m!295105))

(declare-fun m!295107 () Bool)

(assert (=> b!280691 m!295107))

(assert (=> b!280691 m!295107))

(declare-fun m!295109 () Bool)

(assert (=> b!280691 m!295109))

(declare-fun m!295111 () Bool)

(assert (=> b!280696 m!295111))

(declare-fun m!295113 () Bool)

(assert (=> start!27138 m!295113))

(declare-fun m!295115 () Bool)

(assert (=> start!27138 m!295115))

(declare-fun m!295117 () Bool)

(assert (=> b!280695 m!295117))

(push 1)

