; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26330 () Bool)

(assert start!26330)

(declare-fun b!272700 () Bool)

(declare-fun e!174894 () Bool)

(declare-fun e!174893 () Bool)

(assert (=> b!272700 (= e!174894 e!174893)))

(declare-fun res!136744 () Bool)

(assert (=> b!272700 (=> (not res!136744) (not e!174893))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272700 (= res!136744 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13416 0))(
  ( (array!13417 (arr!6357 (Array (_ BitVec 32) (_ BitVec 64))) (size!6710 (_ BitVec 32))) )
))
(declare-fun lt!135918 () array!13416)

(declare-fun a!3325 () array!13416)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!272700 (= lt!135918 (array!13417 (store (arr!6357 a!3325) i!1267 k0!2581) (size!6710 a!3325)))))

(declare-fun b!272701 () Bool)

(declare-fun res!136746 () Bool)

(declare-fun e!174892 () Bool)

(assert (=> b!272701 (=> (not res!136746) (not e!174892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272701 (= res!136746 (validKeyInArray!0 k0!2581))))

(declare-fun b!272702 () Bool)

(assert (=> b!272702 (= e!174893 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1514 0))(
  ( (MissingZero!1514 (index!8226 (_ BitVec 32))) (Found!1514 (index!8227 (_ BitVec 32))) (Intermediate!1514 (undefined!2326 Bool) (index!8228 (_ BitVec 32)) (x!26558 (_ BitVec 32))) (Undefined!1514) (MissingVacant!1514 (index!8229 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13416 (_ BitVec 32)) SeekEntryResult!1514)

(assert (=> b!272702 (= (seekEntryOrOpen!0 (select (arr!6357 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6357 a!3325) i!1267 k0!2581) startIndex!26) lt!135918 mask!3868))))

(declare-datatypes ((Unit!8481 0))(
  ( (Unit!8482) )
))
(declare-fun lt!135916 () Unit!8481)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13416 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8481)

(assert (=> b!272702 (= lt!135916 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4138 0))(
  ( (Nil!4135) (Cons!4134 (h!4801 (_ BitVec 64)) (t!9211 List!4138)) )
))
(declare-fun arrayNoDuplicates!0 (array!13416 (_ BitVec 32) List!4138) Bool)

(assert (=> b!272702 (arrayNoDuplicates!0 lt!135918 #b00000000000000000000000000000000 Nil!4135)))

(declare-fun lt!135917 () Unit!8481)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13416 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4138) Unit!8481)

(assert (=> b!272702 (= lt!135917 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4135))))

(declare-fun b!272703 () Bool)

(declare-fun res!136750 () Bool)

(assert (=> b!272703 (=> (not res!136750) (not e!174894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13416 (_ BitVec 32)) Bool)

(assert (=> b!272703 (= res!136750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272704 () Bool)

(assert (=> b!272704 (= e!174892 e!174894)))

(declare-fun res!136743 () Bool)

(assert (=> b!272704 (=> (not res!136743) (not e!174894))))

(declare-fun lt!135915 () SeekEntryResult!1514)

(assert (=> b!272704 (= res!136743 (or (= lt!135915 (MissingZero!1514 i!1267)) (= lt!135915 (MissingVacant!1514 i!1267))))))

(assert (=> b!272704 (= lt!135915 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!136742 () Bool)

(assert (=> start!26330 (=> (not res!136742) (not e!174892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26330 (= res!136742 (validMask!0 mask!3868))))

(assert (=> start!26330 e!174892))

(declare-fun array_inv!4329 (array!13416) Bool)

(assert (=> start!26330 (array_inv!4329 a!3325)))

(assert (=> start!26330 true))

(declare-fun b!272705 () Bool)

(declare-fun res!136747 () Bool)

(assert (=> b!272705 (=> (not res!136747) (not e!174892))))

(assert (=> b!272705 (= res!136747 (and (= (size!6710 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6710 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6710 a!3325))))))

(declare-fun b!272706 () Bool)

(declare-fun res!136745 () Bool)

(assert (=> b!272706 (=> (not res!136745) (not e!174892))))

(declare-fun arrayContainsKey!0 (array!13416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272706 (= res!136745 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272707 () Bool)

(declare-fun res!136749 () Bool)

(assert (=> b!272707 (=> (not res!136749) (not e!174892))))

(assert (=> b!272707 (= res!136749 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4135))))

(declare-fun b!272708 () Bool)

(declare-fun res!136748 () Bool)

(assert (=> b!272708 (=> (not res!136748) (not e!174893))))

(assert (=> b!272708 (= res!136748 (validKeyInArray!0 (select (arr!6357 a!3325) startIndex!26)))))

(assert (= (and start!26330 res!136742) b!272705))

(assert (= (and b!272705 res!136747) b!272701))

(assert (= (and b!272701 res!136746) b!272707))

(assert (= (and b!272707 res!136749) b!272706))

(assert (= (and b!272706 res!136745) b!272704))

(assert (= (and b!272704 res!136743) b!272703))

(assert (= (and b!272703 res!136750) b!272700))

(assert (= (and b!272700 res!136744) b!272708))

(assert (= (and b!272708 res!136748) b!272702))

(declare-fun m!287309 () Bool)

(assert (=> b!272700 m!287309))

(declare-fun m!287311 () Bool)

(assert (=> b!272708 m!287311))

(assert (=> b!272708 m!287311))

(declare-fun m!287313 () Bool)

(assert (=> b!272708 m!287313))

(declare-fun m!287315 () Bool)

(assert (=> start!26330 m!287315))

(declare-fun m!287317 () Bool)

(assert (=> start!26330 m!287317))

(declare-fun m!287319 () Bool)

(assert (=> b!272706 m!287319))

(declare-fun m!287321 () Bool)

(assert (=> b!272704 m!287321))

(declare-fun m!287323 () Bool)

(assert (=> b!272707 m!287323))

(declare-fun m!287325 () Bool)

(assert (=> b!272702 m!287325))

(declare-fun m!287327 () Bool)

(assert (=> b!272702 m!287327))

(assert (=> b!272702 m!287325))

(assert (=> b!272702 m!287309))

(assert (=> b!272702 m!287311))

(declare-fun m!287329 () Bool)

(assert (=> b!272702 m!287329))

(declare-fun m!287331 () Bool)

(assert (=> b!272702 m!287331))

(assert (=> b!272702 m!287311))

(declare-fun m!287333 () Bool)

(assert (=> b!272702 m!287333))

(declare-fun m!287335 () Bool)

(assert (=> b!272702 m!287335))

(declare-fun m!287337 () Bool)

(assert (=> b!272703 m!287337))

(declare-fun m!287339 () Bool)

(assert (=> b!272701 m!287339))

(check-sat (not b!272702) (not b!272704) (not b!272708) (not b!272707) (not b!272701) (not b!272703) (not b!272706) (not start!26330))
(check-sat)
