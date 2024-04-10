; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26318 () Bool)

(assert start!26318)

(declare-fun b!272712 () Bool)

(declare-fun res!136702 () Bool)

(declare-fun e!174947 () Bool)

(assert (=> b!272712 (=> (not res!136702) (not e!174947))))

(declare-datatypes ((array!13415 0))(
  ( (array!13416 (arr!6357 (Array (_ BitVec 32) (_ BitVec 64))) (size!6709 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13415)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272712 (= res!136702 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!136705 () Bool)

(assert (=> start!26318 (=> (not res!136705) (not e!174947))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26318 (= res!136705 (validMask!0 mask!3868))))

(assert (=> start!26318 e!174947))

(declare-fun array_inv!4320 (array!13415) Bool)

(assert (=> start!26318 (array_inv!4320 a!3325)))

(assert (=> start!26318 true))

(declare-fun b!272713 () Bool)

(declare-fun e!174945 () Bool)

(assert (=> b!272713 (= e!174947 e!174945)))

(declare-fun res!136709 () Bool)

(assert (=> b!272713 (=> (not res!136709) (not e!174945))))

(declare-datatypes ((SeekEntryResult!1515 0))(
  ( (MissingZero!1515 (index!8230 (_ BitVec 32))) (Found!1515 (index!8231 (_ BitVec 32))) (Intermediate!1515 (undefined!2327 Bool) (index!8232 (_ BitVec 32)) (x!26544 (_ BitVec 32))) (Undefined!1515) (MissingVacant!1515 (index!8233 (_ BitVec 32))) )
))
(declare-fun lt!136063 () SeekEntryResult!1515)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272713 (= res!136709 (or (= lt!136063 (MissingZero!1515 i!1267)) (= lt!136063 (MissingVacant!1515 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13415 (_ BitVec 32)) SeekEntryResult!1515)

(assert (=> b!272713 (= lt!136063 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272714 () Bool)

(declare-fun res!136707 () Bool)

(assert (=> b!272714 (=> (not res!136707) (not e!174947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272714 (= res!136707 (validKeyInArray!0 k0!2581))))

(declare-fun b!272715 () Bool)

(declare-fun res!136710 () Bool)

(assert (=> b!272715 (=> (not res!136710) (not e!174947))))

(declare-datatypes ((List!4165 0))(
  ( (Nil!4162) (Cons!4161 (h!4828 (_ BitVec 64)) (t!9247 List!4165)) )
))
(declare-fun arrayNoDuplicates!0 (array!13415 (_ BitVec 32) List!4165) Bool)

(assert (=> b!272715 (= res!136710 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4162))))

(declare-fun b!272716 () Bool)

(declare-fun res!136708 () Bool)

(assert (=> b!272716 (=> (not res!136708) (not e!174947))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272716 (= res!136708 (and (= (size!6709 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6709 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6709 a!3325))))))

(declare-fun b!272717 () Bool)

(declare-fun res!136706 () Bool)

(assert (=> b!272717 (=> (not res!136706) (not e!174945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13415 (_ BitVec 32)) Bool)

(assert (=> b!272717 (= res!136706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272718 () Bool)

(declare-fun res!136704 () Bool)

(assert (=> b!272718 (=> (not res!136704) (not e!174945))))

(assert (=> b!272718 (= res!136704 (not (= startIndex!26 i!1267)))))

(declare-fun b!272719 () Bool)

(assert (=> b!272719 (= e!174945 (not true))))

(assert (=> b!272719 (arrayNoDuplicates!0 (array!13416 (store (arr!6357 a!3325) i!1267 k0!2581) (size!6709 a!3325)) #b00000000000000000000000000000000 Nil!4162)))

(declare-datatypes ((Unit!8517 0))(
  ( (Unit!8518) )
))
(declare-fun lt!136062 () Unit!8517)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13415 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4165) Unit!8517)

(assert (=> b!272719 (= lt!136062 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4162))))

(declare-fun b!272720 () Bool)

(declare-fun res!136703 () Bool)

(assert (=> b!272720 (=> (not res!136703) (not e!174945))))

(assert (=> b!272720 (= res!136703 (validKeyInArray!0 (select (arr!6357 a!3325) startIndex!26)))))

(assert (= (and start!26318 res!136705) b!272716))

(assert (= (and b!272716 res!136708) b!272714))

(assert (= (and b!272714 res!136707) b!272715))

(assert (= (and b!272715 res!136710) b!272712))

(assert (= (and b!272712 res!136702) b!272713))

(assert (= (and b!272713 res!136709) b!272717))

(assert (= (and b!272717 res!136706) b!272718))

(assert (= (and b!272718 res!136704) b!272720))

(assert (= (and b!272720 res!136703) b!272719))

(declare-fun m!287781 () Bool)

(assert (=> b!272715 m!287781))

(declare-fun m!287783 () Bool)

(assert (=> b!272720 m!287783))

(assert (=> b!272720 m!287783))

(declare-fun m!287785 () Bool)

(assert (=> b!272720 m!287785))

(declare-fun m!287787 () Bool)

(assert (=> b!272713 m!287787))

(declare-fun m!287789 () Bool)

(assert (=> b!272714 m!287789))

(declare-fun m!287791 () Bool)

(assert (=> b!272712 m!287791))

(declare-fun m!287793 () Bool)

(assert (=> b!272717 m!287793))

(declare-fun m!287795 () Bool)

(assert (=> start!26318 m!287795))

(declare-fun m!287797 () Bool)

(assert (=> start!26318 m!287797))

(declare-fun m!287799 () Bool)

(assert (=> b!272719 m!287799))

(declare-fun m!287801 () Bool)

(assert (=> b!272719 m!287801))

(declare-fun m!287803 () Bool)

(assert (=> b!272719 m!287803))

(check-sat (not b!272714) (not b!272712) (not b!272719) (not b!272717) (not b!272713) (not start!26318) (not b!272720) (not b!272715))
(check-sat)
