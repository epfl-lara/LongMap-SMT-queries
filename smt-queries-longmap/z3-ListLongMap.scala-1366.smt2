; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26850 () Bool)

(assert start!26850)

(declare-fun b!278597 () Bool)

(declare-fun res!142003 () Bool)

(declare-fun e!177695 () Bool)

(assert (=> b!278597 (=> (not res!142003) (not e!177695))))

(declare-datatypes ((array!13853 0))(
  ( (array!13854 (arr!6574 (Array (_ BitVec 32) (_ BitVec 64))) (size!6926 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13853)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278597 (= res!142003 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278598 () Bool)

(declare-fun res!142001 () Bool)

(assert (=> b!278598 (=> (not res!142001) (not e!177695))))

(declare-datatypes ((List!4295 0))(
  ( (Nil!4292) (Cons!4291 (h!4961 (_ BitVec 64)) (t!9369 List!4295)) )
))
(declare-fun arrayNoDuplicates!0 (array!13853 (_ BitVec 32) List!4295) Bool)

(assert (=> b!278598 (= res!142001 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4292))))

(declare-fun b!278599 () Bool)

(declare-fun res!142000 () Bool)

(assert (=> b!278599 (=> (not res!142000) (not e!177695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278599 (= res!142000 (validKeyInArray!0 k0!2581))))

(declare-fun b!278600 () Bool)

(declare-fun e!177694 () Bool)

(assert (=> b!278600 (= e!177695 e!177694)))

(declare-fun res!142005 () Bool)

(assert (=> b!278600 (=> (not res!142005) (not e!177694))))

(declare-datatypes ((SeekEntryResult!1697 0))(
  ( (MissingZero!1697 (index!8958 (_ BitVec 32))) (Found!1697 (index!8959 (_ BitVec 32))) (Intermediate!1697 (undefined!2509 Bool) (index!8960 (_ BitVec 32)) (x!27319 (_ BitVec 32))) (Undefined!1697) (MissingVacant!1697 (index!8961 (_ BitVec 32))) )
))
(declare-fun lt!138474 () SeekEntryResult!1697)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278600 (= res!142005 (or (= lt!138474 (MissingZero!1697 i!1267)) (= lt!138474 (MissingVacant!1697 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13853 (_ BitVec 32)) SeekEntryResult!1697)

(assert (=> b!278600 (= lt!138474 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278601 () Bool)

(assert (=> b!278601 (= e!177694 false)))

(declare-fun lt!138473 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13853 (_ BitVec 32)) Bool)

(assert (=> b!278601 (= lt!138473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!142004 () Bool)

(assert (=> start!26850 (=> (not res!142004) (not e!177695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26850 (= res!142004 (validMask!0 mask!3868))))

(assert (=> start!26850 e!177695))

(declare-fun array_inv!4524 (array!13853) Bool)

(assert (=> start!26850 (array_inv!4524 a!3325)))

(assert (=> start!26850 true))

(declare-fun b!278602 () Bool)

(declare-fun res!142002 () Bool)

(assert (=> b!278602 (=> (not res!142002) (not e!177695))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278602 (= res!142002 (and (= (size!6926 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6926 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6926 a!3325))))))

(assert (= (and start!26850 res!142004) b!278602))

(assert (= (and b!278602 res!142002) b!278599))

(assert (= (and b!278599 res!142000) b!278598))

(assert (= (and b!278598 res!142001) b!278597))

(assert (= (and b!278597 res!142003) b!278600))

(assert (= (and b!278600 res!142005) b!278601))

(declare-fun m!293801 () Bool)

(assert (=> b!278598 m!293801))

(declare-fun m!293803 () Bool)

(assert (=> start!26850 m!293803))

(declare-fun m!293805 () Bool)

(assert (=> start!26850 m!293805))

(declare-fun m!293807 () Bool)

(assert (=> b!278601 m!293807))

(declare-fun m!293809 () Bool)

(assert (=> b!278600 m!293809))

(declare-fun m!293811 () Bool)

(assert (=> b!278599 m!293811))

(declare-fun m!293813 () Bool)

(assert (=> b!278597 m!293813))

(check-sat (not b!278598) (not start!26850) (not b!278599) (not b!278597) (not b!278600) (not b!278601))
(check-sat)
