; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26204 () Bool)

(assert start!26204)

(declare-fun b!270719 () Bool)

(declare-fun res!134769 () Bool)

(declare-fun e!174324 () Bool)

(assert (=> b!270719 (=> (not res!134769) (not e!174324))))

(declare-datatypes ((List!4075 0))(
  ( (Nil!4072) (Cons!4071 (h!4738 (_ BitVec 64)) (t!9148 List!4075)) )
))
(declare-fun contains!1913 (List!4075 (_ BitVec 64)) Bool)

(assert (=> b!270719 (= res!134769 (not (contains!1913 Nil!4072 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!134764 () Bool)

(declare-fun e!174322 () Bool)

(assert (=> start!26204 (=> (not res!134764) (not e!174322))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26204 (= res!134764 (validMask!0 mask!3868))))

(assert (=> start!26204 e!174322))

(declare-datatypes ((array!13290 0))(
  ( (array!13291 (arr!6294 (Array (_ BitVec 32) (_ BitVec 64))) (size!6647 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13290)

(declare-fun array_inv!4266 (array!13290) Bool)

(assert (=> start!26204 (array_inv!4266 a!3325)))

(assert (=> start!26204 true))

(declare-fun b!270720 () Bool)

(declare-fun res!134761 () Bool)

(assert (=> b!270720 (=> (not res!134761) (not e!174324))))

(declare-fun noDuplicate!127 (List!4075) Bool)

(assert (=> b!270720 (= res!134761 (noDuplicate!127 Nil!4072))))

(declare-fun b!270721 () Bool)

(declare-fun res!134772 () Bool)

(assert (=> b!270721 (=> (not res!134772) (not e!174322))))

(declare-fun arrayNoDuplicates!0 (array!13290 (_ BitVec 32) List!4075) Bool)

(assert (=> b!270721 (= res!134772 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4072))))

(declare-fun b!270722 () Bool)

(declare-fun res!134765 () Bool)

(assert (=> b!270722 (=> (not res!134765) (not e!174324))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270722 (= res!134765 (not (= startIndex!26 i!1267)))))

(declare-fun b!270723 () Bool)

(declare-fun res!134773 () Bool)

(assert (=> b!270723 (=> (not res!134773) (not e!174322))))

(assert (=> b!270723 (= res!134773 (and (= (size!6647 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6647 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6647 a!3325))))))

(declare-fun b!270724 () Bool)

(declare-fun res!134771 () Bool)

(assert (=> b!270724 (=> (not res!134771) (not e!174324))))

(assert (=> b!270724 (= res!134771 (and (bvslt (size!6647 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6647 a!3325))))))

(declare-fun b!270725 () Bool)

(declare-fun res!134763 () Bool)

(assert (=> b!270725 (=> (not res!134763) (not e!174322))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270725 (= res!134763 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270726 () Bool)

(assert (=> b!270726 (= e!174324 false)))

(declare-fun lt!135534 () Bool)

(assert (=> b!270726 (= lt!135534 (contains!1913 Nil!4072 k0!2581))))

(declare-fun b!270727 () Bool)

(declare-fun res!134767 () Bool)

(assert (=> b!270727 (=> (not res!134767) (not e!174324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13290 (_ BitVec 32)) Bool)

(assert (=> b!270727 (= res!134767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270728 () Bool)

(declare-fun res!134762 () Bool)

(assert (=> b!270728 (=> (not res!134762) (not e!174324))))

(assert (=> b!270728 (= res!134762 (not (contains!1913 Nil!4072 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270729 () Bool)

(declare-fun res!134770 () Bool)

(assert (=> b!270729 (=> (not res!134770) (not e!174324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270729 (= res!134770 (validKeyInArray!0 (select (arr!6294 a!3325) startIndex!26)))))

(declare-fun b!270730 () Bool)

(assert (=> b!270730 (= e!174322 e!174324)))

(declare-fun res!134768 () Bool)

(assert (=> b!270730 (=> (not res!134768) (not e!174324))))

(declare-datatypes ((SeekEntryResult!1451 0))(
  ( (MissingZero!1451 (index!7974 (_ BitVec 32))) (Found!1451 (index!7975 (_ BitVec 32))) (Intermediate!1451 (undefined!2263 Bool) (index!7976 (_ BitVec 32)) (x!26327 (_ BitVec 32))) (Undefined!1451) (MissingVacant!1451 (index!7977 (_ BitVec 32))) )
))
(declare-fun lt!135533 () SeekEntryResult!1451)

(assert (=> b!270730 (= res!134768 (or (= lt!135533 (MissingZero!1451 i!1267)) (= lt!135533 (MissingVacant!1451 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13290 (_ BitVec 32)) SeekEntryResult!1451)

(assert (=> b!270730 (= lt!135533 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270731 () Bool)

(declare-fun res!134766 () Bool)

(assert (=> b!270731 (=> (not res!134766) (not e!174322))))

(assert (=> b!270731 (= res!134766 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26204 res!134764) b!270723))

(assert (= (and b!270723 res!134773) b!270731))

(assert (= (and b!270731 res!134766) b!270721))

(assert (= (and b!270721 res!134772) b!270725))

(assert (= (and b!270725 res!134763) b!270730))

(assert (= (and b!270730 res!134768) b!270727))

(assert (= (and b!270727 res!134767) b!270722))

(assert (= (and b!270722 res!134765) b!270729))

(assert (= (and b!270729 res!134770) b!270724))

(assert (= (and b!270724 res!134771) b!270720))

(assert (= (and b!270720 res!134761) b!270728))

(assert (= (and b!270728 res!134762) b!270719))

(assert (= (and b!270719 res!134769) b!270726))

(declare-fun m!285749 () Bool)

(assert (=> b!270720 m!285749))

(declare-fun m!285751 () Bool)

(assert (=> b!270729 m!285751))

(assert (=> b!270729 m!285751))

(declare-fun m!285753 () Bool)

(assert (=> b!270729 m!285753))

(declare-fun m!285755 () Bool)

(assert (=> b!270727 m!285755))

(declare-fun m!285757 () Bool)

(assert (=> b!270721 m!285757))

(declare-fun m!285759 () Bool)

(assert (=> start!26204 m!285759))

(declare-fun m!285761 () Bool)

(assert (=> start!26204 m!285761))

(declare-fun m!285763 () Bool)

(assert (=> b!270731 m!285763))

(declare-fun m!285765 () Bool)

(assert (=> b!270726 m!285765))

(declare-fun m!285767 () Bool)

(assert (=> b!270725 m!285767))

(declare-fun m!285769 () Bool)

(assert (=> b!270730 m!285769))

(declare-fun m!285771 () Bool)

(assert (=> b!270719 m!285771))

(declare-fun m!285773 () Bool)

(assert (=> b!270728 m!285773))

(check-sat (not b!270728) (not start!26204) (not b!270730) (not b!270725) (not b!270721) (not b!270720) (not b!270729) (not b!270719) (not b!270727) (not b!270726) (not b!270731))
(check-sat)
