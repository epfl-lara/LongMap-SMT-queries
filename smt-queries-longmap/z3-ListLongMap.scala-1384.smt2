; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27158 () Bool)

(assert start!27158)

(declare-fun b!280785 () Bool)

(declare-fun res!143914 () Bool)

(declare-fun e!178603 () Bool)

(assert (=> b!280785 (=> (not res!143914) (not e!178603))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280785 (= res!143914 (not (= startIndex!26 i!1267)))))

(declare-fun res!143909 () Bool)

(declare-fun e!178605 () Bool)

(assert (=> start!27158 (=> (not res!143909) (not e!178605))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27158 (= res!143909 (validMask!0 mask!3868))))

(assert (=> start!27158 e!178605))

(declare-datatypes ((array!13965 0))(
  ( (array!13966 (arr!6624 (Array (_ BitVec 32) (_ BitVec 64))) (size!6977 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13965)

(declare-fun array_inv!4596 (array!13965) Bool)

(assert (=> start!27158 (array_inv!4596 a!3325)))

(assert (=> start!27158 true))

(declare-fun b!280786 () Bool)

(declare-fun res!143911 () Bool)

(assert (=> b!280786 (=> (not res!143911) (not e!178603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280786 (= res!143911 (validKeyInArray!0 (select (arr!6624 a!3325) startIndex!26)))))

(declare-fun b!280787 () Bool)

(declare-fun res!143908 () Bool)

(assert (=> b!280787 (=> (not res!143908) (not e!178605))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280787 (= res!143908 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280788 () Bool)

(declare-fun res!143907 () Bool)

(assert (=> b!280788 (=> (not res!143907) (not e!178603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13965 (_ BitVec 32)) Bool)

(assert (=> b!280788 (= res!143907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280789 () Bool)

(assert (=> b!280789 (= e!178605 e!178603)))

(declare-fun res!143912 () Bool)

(assert (=> b!280789 (=> (not res!143912) (not e!178603))))

(declare-datatypes ((SeekEntryResult!1781 0))(
  ( (MissingZero!1781 (index!9294 (_ BitVec 32))) (Found!1781 (index!9295 (_ BitVec 32))) (Intermediate!1781 (undefined!2593 Bool) (index!9296 (_ BitVec 32)) (x!27546 (_ BitVec 32))) (Undefined!1781) (MissingVacant!1781 (index!9297 (_ BitVec 32))) )
))
(declare-fun lt!138756 () SeekEntryResult!1781)

(assert (=> b!280789 (= res!143912 (or (= lt!138756 (MissingZero!1781 i!1267)) (= lt!138756 (MissingVacant!1781 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13965 (_ BitVec 32)) SeekEntryResult!1781)

(assert (=> b!280789 (= lt!138756 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280790 () Bool)

(declare-fun res!143910 () Bool)

(assert (=> b!280790 (=> (not res!143910) (not e!178605))))

(assert (=> b!280790 (= res!143910 (validKeyInArray!0 k0!2581))))

(declare-fun b!280791 () Bool)

(declare-fun res!143906 () Bool)

(assert (=> b!280791 (=> (not res!143906) (not e!178605))))

(assert (=> b!280791 (= res!143906 (and (= (size!6977 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6977 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6977 a!3325))))))

(declare-fun b!280792 () Bool)

(assert (=> b!280792 (= e!178603 (not (not (= i!1267 startIndex!26))))))

(declare-datatypes ((List!4405 0))(
  ( (Nil!4402) (Cons!4401 (h!5071 (_ BitVec 64)) (t!9478 List!4405)) )
))
(declare-fun arrayNoDuplicates!0 (array!13965 (_ BitVec 32) List!4405) Bool)

(assert (=> b!280792 (arrayNoDuplicates!0 (array!13966 (store (arr!6624 a!3325) i!1267 k0!2581) (size!6977 a!3325)) #b00000000000000000000000000000000 Nil!4402)))

(declare-datatypes ((Unit!8808 0))(
  ( (Unit!8809) )
))
(declare-fun lt!138755 () Unit!8808)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13965 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4405) Unit!8808)

(assert (=> b!280792 (= lt!138755 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4402))))

(declare-fun b!280793 () Bool)

(declare-fun res!143913 () Bool)

(assert (=> b!280793 (=> (not res!143913) (not e!178605))))

(assert (=> b!280793 (= res!143913 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4402))))

(assert (= (and start!27158 res!143909) b!280791))

(assert (= (and b!280791 res!143906) b!280790))

(assert (= (and b!280790 res!143910) b!280793))

(assert (= (and b!280793 res!143913) b!280787))

(assert (= (and b!280787 res!143908) b!280789))

(assert (= (and b!280789 res!143912) b!280788))

(assert (= (and b!280788 res!143907) b!280785))

(assert (= (and b!280785 res!143914) b!280786))

(assert (= (and b!280786 res!143911) b!280792))

(declare-fun m!294719 () Bool)

(assert (=> b!280793 m!294719))

(declare-fun m!294721 () Bool)

(assert (=> b!280792 m!294721))

(declare-fun m!294723 () Bool)

(assert (=> b!280792 m!294723))

(declare-fun m!294725 () Bool)

(assert (=> b!280792 m!294725))

(declare-fun m!294727 () Bool)

(assert (=> b!280790 m!294727))

(declare-fun m!294729 () Bool)

(assert (=> b!280787 m!294729))

(declare-fun m!294731 () Bool)

(assert (=> start!27158 m!294731))

(declare-fun m!294733 () Bool)

(assert (=> start!27158 m!294733))

(declare-fun m!294735 () Bool)

(assert (=> b!280786 m!294735))

(assert (=> b!280786 m!294735))

(declare-fun m!294737 () Bool)

(assert (=> b!280786 m!294737))

(declare-fun m!294739 () Bool)

(assert (=> b!280788 m!294739))

(declare-fun m!294741 () Bool)

(assert (=> b!280789 m!294741))

(check-sat (not start!27158) (not b!280787) (not b!280793) (not b!280789) (not b!280788) (not b!280786) (not b!280792) (not b!280790))
(check-sat)
