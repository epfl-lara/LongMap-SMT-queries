; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26264 () Bool)

(assert start!26264)

(declare-fun b!271809 () Bool)

(declare-fun res!135855 () Bool)

(declare-fun e!174592 () Bool)

(assert (=> b!271809 (=> (not res!135855) (not e!174592))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271809 (= res!135855 (not (= startIndex!26 i!1267)))))

(declare-fun res!135853 () Bool)

(declare-fun e!174593 () Bool)

(assert (=> start!26264 (=> (not res!135853) (not e!174593))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26264 (= res!135853 (validMask!0 mask!3868))))

(assert (=> start!26264 e!174593))

(declare-datatypes ((array!13350 0))(
  ( (array!13351 (arr!6324 (Array (_ BitVec 32) (_ BitVec 64))) (size!6677 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13350)

(declare-fun array_inv!4296 (array!13350) Bool)

(assert (=> start!26264 (array_inv!4296 a!3325)))

(assert (=> start!26264 true))

(declare-fun b!271810 () Bool)

(declare-fun res!135851 () Bool)

(assert (=> b!271810 (=> (not res!135851) (not e!174593))))

(assert (=> b!271810 (= res!135851 (and (= (size!6677 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6677 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6677 a!3325))))))

(declare-fun b!271811 () Bool)

(declare-fun res!135857 () Bool)

(assert (=> b!271811 (=> (not res!135857) (not e!174593))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271811 (= res!135857 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271812 () Bool)

(declare-fun res!135856 () Bool)

(assert (=> b!271812 (=> (not res!135856) (not e!174592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271812 (= res!135856 (validKeyInArray!0 (select (arr!6324 a!3325) startIndex!26)))))

(declare-fun b!271813 () Bool)

(assert (=> b!271813 (= e!174593 e!174592)))

(declare-fun res!135858 () Bool)

(assert (=> b!271813 (=> (not res!135858) (not e!174592))))

(declare-datatypes ((SeekEntryResult!1481 0))(
  ( (MissingZero!1481 (index!8094 (_ BitVec 32))) (Found!1481 (index!8095 (_ BitVec 32))) (Intermediate!1481 (undefined!2293 Bool) (index!8096 (_ BitVec 32)) (x!26437 (_ BitVec 32))) (Undefined!1481) (MissingVacant!1481 (index!8097 (_ BitVec 32))) )
))
(declare-fun lt!135714 () SeekEntryResult!1481)

(assert (=> b!271813 (= res!135858 (or (= lt!135714 (MissingZero!1481 i!1267)) (= lt!135714 (MissingVacant!1481 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13350 (_ BitVec 32)) SeekEntryResult!1481)

(assert (=> b!271813 (= lt!135714 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271814 () Bool)

(declare-fun res!135854 () Bool)

(assert (=> b!271814 (=> (not res!135854) (not e!174593))))

(declare-datatypes ((List!4105 0))(
  ( (Nil!4102) (Cons!4101 (h!4768 (_ BitVec 64)) (t!9178 List!4105)) )
))
(declare-fun arrayNoDuplicates!0 (array!13350 (_ BitVec 32) List!4105) Bool)

(assert (=> b!271814 (= res!135854 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4102))))

(declare-fun b!271815 () Bool)

(declare-fun res!135859 () Bool)

(assert (=> b!271815 (=> (not res!135859) (not e!174593))))

(assert (=> b!271815 (= res!135859 (validKeyInArray!0 k0!2581))))

(declare-fun b!271816 () Bool)

(declare-fun res!135852 () Bool)

(assert (=> b!271816 (=> (not res!135852) (not e!174592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13350 (_ BitVec 32)) Bool)

(assert (=> b!271816 (= res!135852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271817 () Bool)

(assert (=> b!271817 (= e!174592 (not true))))

(assert (=> b!271817 (arrayNoDuplicates!0 (array!13351 (store (arr!6324 a!3325) i!1267 k0!2581) (size!6677 a!3325)) #b00000000000000000000000000000000 Nil!4102)))

(declare-datatypes ((Unit!8415 0))(
  ( (Unit!8416) )
))
(declare-fun lt!135713 () Unit!8415)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4105) Unit!8415)

(assert (=> b!271817 (= lt!135713 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4102))))

(assert (= (and start!26264 res!135853) b!271810))

(assert (= (and b!271810 res!135851) b!271815))

(assert (= (and b!271815 res!135859) b!271814))

(assert (= (and b!271814 res!135854) b!271811))

(assert (= (and b!271811 res!135857) b!271813))

(assert (= (and b!271813 res!135858) b!271816))

(assert (= (and b!271816 res!135852) b!271809))

(assert (= (and b!271809 res!135855) b!271812))

(assert (= (and b!271812 res!135856) b!271817))

(declare-fun m!286517 () Bool)

(assert (=> b!271814 m!286517))

(declare-fun m!286519 () Bool)

(assert (=> b!271817 m!286519))

(declare-fun m!286521 () Bool)

(assert (=> b!271817 m!286521))

(declare-fun m!286523 () Bool)

(assert (=> b!271817 m!286523))

(declare-fun m!286525 () Bool)

(assert (=> b!271813 m!286525))

(declare-fun m!286527 () Bool)

(assert (=> start!26264 m!286527))

(declare-fun m!286529 () Bool)

(assert (=> start!26264 m!286529))

(declare-fun m!286531 () Bool)

(assert (=> b!271811 m!286531))

(declare-fun m!286533 () Bool)

(assert (=> b!271812 m!286533))

(assert (=> b!271812 m!286533))

(declare-fun m!286535 () Bool)

(assert (=> b!271812 m!286535))

(declare-fun m!286537 () Bool)

(assert (=> b!271815 m!286537))

(declare-fun m!286539 () Bool)

(assert (=> b!271816 m!286539))

(check-sat (not b!271816) (not b!271811) (not b!271814) (not start!26264) (not b!271813) (not b!271817) (not b!271815) (not b!271812))
(check-sat)
