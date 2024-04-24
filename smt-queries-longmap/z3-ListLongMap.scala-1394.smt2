; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27216 () Bool)

(assert start!27216)

(declare-fun b!281789 () Bool)

(declare-fun e!179027 () Bool)

(declare-fun e!179029 () Bool)

(assert (=> b!281789 (= e!179027 e!179029)))

(declare-fun res!144836 () Bool)

(assert (=> b!281789 (=> (not res!144836) (not e!179029))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281789 (= res!144836 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14033 0))(
  ( (array!14034 (arr!6658 (Array (_ BitVec 32) (_ BitVec 64))) (size!7010 (_ BitVec 32))) )
))
(declare-fun lt!139234 () array!14033)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun a!3325 () array!14033)

(assert (=> b!281789 (= lt!139234 (array!14034 (store (arr!6658 a!3325) i!1267 k0!2581) (size!7010 a!3325)))))

(declare-fun b!281790 () Bool)

(declare-fun res!144838 () Bool)

(assert (=> b!281790 (=> (not res!144838) (not e!179027))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14033 (_ BitVec 32)) Bool)

(assert (=> b!281790 (= res!144838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281791 () Bool)

(declare-fun res!144839 () Bool)

(declare-fun e!179030 () Bool)

(assert (=> b!281791 (=> (not res!144839) (not e!179030))))

(assert (=> b!281791 (= res!144839 (and (= (size!7010 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7010 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7010 a!3325))))))

(declare-fun b!281792 () Bool)

(declare-fun res!144835 () Bool)

(assert (=> b!281792 (=> (not res!144835) (not e!179030))))

(declare-datatypes ((List!4379 0))(
  ( (Nil!4376) (Cons!4375 (h!5045 (_ BitVec 64)) (t!9453 List!4379)) )
))
(declare-fun arrayNoDuplicates!0 (array!14033 (_ BitVec 32) List!4379) Bool)

(assert (=> b!281792 (= res!144835 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4376))))

(declare-fun b!281793 () Bool)

(declare-fun res!144833 () Bool)

(assert (=> b!281793 (=> (not res!144833) (not e!179030))))

(declare-fun arrayContainsKey!0 (array!14033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281793 (= res!144833 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!144837 () Bool)

(assert (=> start!27216 (=> (not res!144837) (not e!179030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27216 (= res!144837 (validMask!0 mask!3868))))

(assert (=> start!27216 e!179030))

(declare-fun array_inv!4608 (array!14033) Bool)

(assert (=> start!27216 (array_inv!4608 a!3325)))

(assert (=> start!27216 true))

(declare-fun b!281794 () Bool)

(assert (=> b!281794 (= e!179030 e!179027)))

(declare-fun res!144840 () Bool)

(assert (=> b!281794 (=> (not res!144840) (not e!179027))))

(declare-datatypes ((SeekEntryResult!1781 0))(
  ( (MissingZero!1781 (index!9294 (_ BitVec 32))) (Found!1781 (index!9295 (_ BitVec 32))) (Intermediate!1781 (undefined!2593 Bool) (index!9296 (_ BitVec 32)) (x!27627 (_ BitVec 32))) (Undefined!1781) (MissingVacant!1781 (index!9297 (_ BitVec 32))) )
))
(declare-fun lt!139235 () SeekEntryResult!1781)

(assert (=> b!281794 (= res!144840 (or (= lt!139235 (MissingZero!1781 i!1267)) (= lt!139235 (MissingVacant!1781 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14033 (_ BitVec 32)) SeekEntryResult!1781)

(assert (=> b!281794 (= lt!139235 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281795 () Bool)

(declare-fun res!144834 () Bool)

(assert (=> b!281795 (=> (not res!144834) (not e!179030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281795 (= res!144834 (validKeyInArray!0 k0!2581))))

(declare-fun b!281796 () Bool)

(assert (=> b!281796 (= e!179029 (not (or (bvsgt #b00000000000000000000000000000000 (size!7010 a!3325)) (bvsle startIndex!26 (size!7010 a!3325)))))))

(assert (=> b!281796 (= (seekEntryOrOpen!0 (select (arr!6658 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6658 a!3325) i!1267 k0!2581) startIndex!26) lt!139234 mask!3868))))

(declare-datatypes ((Unit!8892 0))(
  ( (Unit!8893) )
))
(declare-fun lt!139233 () Unit!8892)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8892)

(assert (=> b!281796 (= lt!139233 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281796 (arrayNoDuplicates!0 lt!139234 #b00000000000000000000000000000000 Nil!4376)))

(declare-fun lt!139236 () Unit!8892)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14033 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4379) Unit!8892)

(assert (=> b!281796 (= lt!139236 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4376))))

(declare-fun b!281797 () Bool)

(declare-fun res!144832 () Bool)

(assert (=> b!281797 (=> (not res!144832) (not e!179029))))

(assert (=> b!281797 (= res!144832 (validKeyInArray!0 (select (arr!6658 a!3325) startIndex!26)))))

(assert (= (and start!27216 res!144837) b!281791))

(assert (= (and b!281791 res!144839) b!281795))

(assert (= (and b!281795 res!144834) b!281792))

(assert (= (and b!281792 res!144835) b!281793))

(assert (= (and b!281793 res!144833) b!281794))

(assert (= (and b!281794 res!144840) b!281790))

(assert (= (and b!281790 res!144838) b!281789))

(assert (= (and b!281789 res!144836) b!281797))

(assert (= (and b!281797 res!144832) b!281796))

(declare-fun m!296309 () Bool)

(assert (=> b!281792 m!296309))

(declare-fun m!296311 () Bool)

(assert (=> b!281794 m!296311))

(declare-fun m!296313 () Bool)

(assert (=> b!281796 m!296313))

(declare-fun m!296315 () Bool)

(assert (=> b!281796 m!296315))

(declare-fun m!296317 () Bool)

(assert (=> b!281796 m!296317))

(declare-fun m!296319 () Bool)

(assert (=> b!281796 m!296319))

(declare-fun m!296321 () Bool)

(assert (=> b!281796 m!296321))

(declare-fun m!296323 () Bool)

(assert (=> b!281796 m!296323))

(assert (=> b!281796 m!296313))

(declare-fun m!296325 () Bool)

(assert (=> b!281796 m!296325))

(assert (=> b!281796 m!296319))

(declare-fun m!296327 () Bool)

(assert (=> b!281796 m!296327))

(declare-fun m!296329 () Bool)

(assert (=> b!281790 m!296329))

(assert (=> b!281797 m!296319))

(assert (=> b!281797 m!296319))

(declare-fun m!296331 () Bool)

(assert (=> b!281797 m!296331))

(declare-fun m!296333 () Bool)

(assert (=> b!281793 m!296333))

(declare-fun m!296335 () Bool)

(assert (=> b!281795 m!296335))

(assert (=> b!281789 m!296317))

(declare-fun m!296337 () Bool)

(assert (=> start!27216 m!296337))

(declare-fun m!296339 () Bool)

(assert (=> start!27216 m!296339))

(check-sat (not b!281797) (not b!281795) (not b!281793) (not b!281792) (not b!281794) (not start!27216) (not b!281790) (not b!281796))
(check-sat)
