; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26312 () Bool)

(assert start!26312)

(declare-fun b!272631 () Bool)

(declare-fun e!174919 () Bool)

(declare-fun e!174920 () Bool)

(assert (=> b!272631 (= e!174919 e!174920)))

(declare-fun res!136629 () Bool)

(assert (=> b!272631 (=> (not res!136629) (not e!174920))))

(declare-datatypes ((SeekEntryResult!1512 0))(
  ( (MissingZero!1512 (index!8218 (_ BitVec 32))) (Found!1512 (index!8219 (_ BitVec 32))) (Intermediate!1512 (undefined!2324 Bool) (index!8220 (_ BitVec 32)) (x!26533 (_ BitVec 32))) (Undefined!1512) (MissingVacant!1512 (index!8221 (_ BitVec 32))) )
))
(declare-fun lt!136045 () SeekEntryResult!1512)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272631 (= res!136629 (or (= lt!136045 (MissingZero!1512 i!1267)) (= lt!136045 (MissingVacant!1512 i!1267))))))

(declare-datatypes ((array!13409 0))(
  ( (array!13410 (arr!6354 (Array (_ BitVec 32) (_ BitVec 64))) (size!6706 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13409)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13409 (_ BitVec 32)) SeekEntryResult!1512)

(assert (=> b!272631 (= lt!136045 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272632 () Bool)

(declare-fun res!136626 () Bool)

(assert (=> b!272632 (=> (not res!136626) (not e!174920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13409 (_ BitVec 32)) Bool)

(assert (=> b!272632 (= res!136626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272633 () Bool)

(assert (=> b!272633 (= e!174920 (not true))))

(declare-datatypes ((List!4162 0))(
  ( (Nil!4159) (Cons!4158 (h!4825 (_ BitVec 64)) (t!9244 List!4162)) )
))
(declare-fun arrayNoDuplicates!0 (array!13409 (_ BitVec 32) List!4162) Bool)

(assert (=> b!272633 (arrayNoDuplicates!0 (array!13410 (store (arr!6354 a!3325) i!1267 k0!2581) (size!6706 a!3325)) #b00000000000000000000000000000000 Nil!4159)))

(declare-datatypes ((Unit!8511 0))(
  ( (Unit!8512) )
))
(declare-fun lt!136044 () Unit!8511)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13409 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4162) Unit!8511)

(assert (=> b!272633 (= lt!136044 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4159))))

(declare-fun b!272635 () Bool)

(declare-fun res!136625 () Bool)

(assert (=> b!272635 (=> (not res!136625) (not e!174919))))

(declare-fun arrayContainsKey!0 (array!13409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272635 (= res!136625 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272636 () Bool)

(declare-fun res!136621 () Bool)

(assert (=> b!272636 (=> (not res!136621) (not e!174919))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272636 (= res!136621 (and (= (size!6706 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6706 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6706 a!3325))))))

(declare-fun b!272637 () Bool)

(declare-fun res!136622 () Bool)

(assert (=> b!272637 (=> (not res!136622) (not e!174919))))

(assert (=> b!272637 (= res!136622 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4159))))

(declare-fun b!272638 () Bool)

(declare-fun res!136623 () Bool)

(assert (=> b!272638 (=> (not res!136623) (not e!174920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272638 (= res!136623 (validKeyInArray!0 (select (arr!6354 a!3325) startIndex!26)))))

(declare-fun b!272639 () Bool)

(declare-fun res!136624 () Bool)

(assert (=> b!272639 (=> (not res!136624) (not e!174920))))

(assert (=> b!272639 (= res!136624 (not (= startIndex!26 i!1267)))))

(declare-fun b!272634 () Bool)

(declare-fun res!136628 () Bool)

(assert (=> b!272634 (=> (not res!136628) (not e!174919))))

(assert (=> b!272634 (= res!136628 (validKeyInArray!0 k0!2581))))

(declare-fun res!136627 () Bool)

(assert (=> start!26312 (=> (not res!136627) (not e!174919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26312 (= res!136627 (validMask!0 mask!3868))))

(assert (=> start!26312 e!174919))

(declare-fun array_inv!4317 (array!13409) Bool)

(assert (=> start!26312 (array_inv!4317 a!3325)))

(assert (=> start!26312 true))

(assert (= (and start!26312 res!136627) b!272636))

(assert (= (and b!272636 res!136621) b!272634))

(assert (= (and b!272634 res!136628) b!272637))

(assert (= (and b!272637 res!136622) b!272635))

(assert (= (and b!272635 res!136625) b!272631))

(assert (= (and b!272631 res!136629) b!272632))

(assert (= (and b!272632 res!136626) b!272639))

(assert (= (and b!272639 res!136624) b!272638))

(assert (= (and b!272638 res!136623) b!272633))

(declare-fun m!287709 () Bool)

(assert (=> b!272637 m!287709))

(declare-fun m!287711 () Bool)

(assert (=> b!272631 m!287711))

(declare-fun m!287713 () Bool)

(assert (=> start!26312 m!287713))

(declare-fun m!287715 () Bool)

(assert (=> start!26312 m!287715))

(declare-fun m!287717 () Bool)

(assert (=> b!272638 m!287717))

(assert (=> b!272638 m!287717))

(declare-fun m!287719 () Bool)

(assert (=> b!272638 m!287719))

(declare-fun m!287721 () Bool)

(assert (=> b!272633 m!287721))

(declare-fun m!287723 () Bool)

(assert (=> b!272633 m!287723))

(declare-fun m!287725 () Bool)

(assert (=> b!272633 m!287725))

(declare-fun m!287727 () Bool)

(assert (=> b!272634 m!287727))

(declare-fun m!287729 () Bool)

(assert (=> b!272635 m!287729))

(declare-fun m!287731 () Bool)

(assert (=> b!272632 m!287731))

(check-sat (not b!272638) (not b!272632) (not b!272634) (not b!272637) (not b!272631) (not b!272633) (not start!26312) (not b!272635))
(check-sat)
