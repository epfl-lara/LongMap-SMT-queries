; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26196 () Bool)

(assert start!26196)

(declare-fun b!270796 () Bool)

(declare-fun res!134764 () Bool)

(declare-fun e!174422 () Bool)

(assert (=> b!270796 (=> (not res!134764) (not e!174422))))

(declare-datatypes ((array!13292 0))(
  ( (array!13293 (arr!6295 (Array (_ BitVec 32) (_ BitVec 64))) (size!6647 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13292)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270796 (= res!134764 (validKeyInArray!0 (select (arr!6295 a!3325) startIndex!26)))))

(declare-fun b!270797 () Bool)

(declare-fun res!134770 () Bool)

(assert (=> b!270797 (=> (not res!134770) (not e!174422))))

(assert (=> b!270797 (= res!134770 (and (bvslt (size!6647 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6647 a!3325))))))

(declare-fun b!270798 () Bool)

(declare-fun res!134762 () Bool)

(assert (=> b!270798 (=> (not res!134762) (not e!174422))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270798 (= res!134762 (not (= startIndex!26 i!1267)))))

(declare-fun b!270799 () Bool)

(declare-fun res!134769 () Bool)

(assert (=> b!270799 (=> (not res!134769) (not e!174422))))

(declare-datatypes ((List!4016 0))(
  ( (Nil!4013) (Cons!4012 (h!4679 (_ BitVec 64)) (t!9090 List!4016)) )
))
(declare-fun noDuplicate!125 (List!4016) Bool)

(assert (=> b!270799 (= res!134769 (noDuplicate!125 Nil!4013))))

(declare-fun b!270800 () Bool)

(declare-fun res!134760 () Bool)

(declare-fun e!174420 () Bool)

(assert (=> b!270800 (=> (not res!134760) (not e!174420))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!270800 (= res!134760 (validKeyInArray!0 k0!2581))))

(declare-fun b!270802 () Bool)

(declare-fun res!134763 () Bool)

(assert (=> b!270802 (=> (not res!134763) (not e!174422))))

(declare-fun contains!1909 (List!4016 (_ BitVec 64)) Bool)

(assert (=> b!270802 (= res!134763 (not (contains!1909 Nil!4013 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270803 () Bool)

(declare-fun res!134765 () Bool)

(assert (=> b!270803 (=> (not res!134765) (not e!174420))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270803 (= res!134765 (and (= (size!6647 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6647 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6647 a!3325))))))

(declare-fun b!270804 () Bool)

(declare-fun res!134766 () Bool)

(assert (=> b!270804 (=> (not res!134766) (not e!174422))))

(assert (=> b!270804 (= res!134766 (not (contains!1909 Nil!4013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270805 () Bool)

(declare-fun res!134767 () Bool)

(assert (=> b!270805 (=> (not res!134767) (not e!174422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13292 (_ BitVec 32)) Bool)

(assert (=> b!270805 (= res!134767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270806 () Bool)

(declare-fun res!134772 () Bool)

(assert (=> b!270806 (=> (not res!134772) (not e!174420))))

(declare-fun arrayNoDuplicates!0 (array!13292 (_ BitVec 32) List!4016) Bool)

(assert (=> b!270806 (= res!134772 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4013))))

(declare-fun b!270807 () Bool)

(assert (=> b!270807 (= e!174420 e!174422)))

(declare-fun res!134761 () Bool)

(assert (=> b!270807 (=> (not res!134761) (not e!174422))))

(declare-datatypes ((SeekEntryResult!1418 0))(
  ( (MissingZero!1418 (index!7842 (_ BitVec 32))) (Found!1418 (index!7843 (_ BitVec 32))) (Intermediate!1418 (undefined!2230 Bool) (index!7844 (_ BitVec 32)) (x!26287 (_ BitVec 32))) (Undefined!1418) (MissingVacant!1418 (index!7845 (_ BitVec 32))) )
))
(declare-fun lt!135756 () SeekEntryResult!1418)

(assert (=> b!270807 (= res!134761 (or (= lt!135756 (MissingZero!1418 i!1267)) (= lt!135756 (MissingVacant!1418 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13292 (_ BitVec 32)) SeekEntryResult!1418)

(assert (=> b!270807 (= lt!135756 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270808 () Bool)

(assert (=> b!270808 (= e!174422 false)))

(declare-fun lt!135755 () Bool)

(assert (=> b!270808 (= lt!135755 (contains!1909 Nil!4013 k0!2581))))

(declare-fun res!134771 () Bool)

(assert (=> start!26196 (=> (not res!134771) (not e!174420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26196 (= res!134771 (validMask!0 mask!3868))))

(assert (=> start!26196 e!174420))

(declare-fun array_inv!4245 (array!13292) Bool)

(assert (=> start!26196 (array_inv!4245 a!3325)))

(assert (=> start!26196 true))

(declare-fun b!270801 () Bool)

(declare-fun res!134768 () Bool)

(assert (=> b!270801 (=> (not res!134768) (not e!174420))))

(declare-fun arrayContainsKey!0 (array!13292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270801 (= res!134768 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26196 res!134771) b!270803))

(assert (= (and b!270803 res!134765) b!270800))

(assert (= (and b!270800 res!134760) b!270806))

(assert (= (and b!270806 res!134772) b!270801))

(assert (= (and b!270801 res!134768) b!270807))

(assert (= (and b!270807 res!134761) b!270805))

(assert (= (and b!270805 res!134767) b!270798))

(assert (= (and b!270798 res!134762) b!270796))

(assert (= (and b!270796 res!134764) b!270797))

(assert (= (and b!270797 res!134770) b!270799))

(assert (= (and b!270799 res!134769) b!270804))

(assert (= (and b!270804 res!134766) b!270802))

(assert (= (and b!270802 res!134763) b!270808))

(declare-fun m!286469 () Bool)

(assert (=> start!26196 m!286469))

(declare-fun m!286471 () Bool)

(assert (=> start!26196 m!286471))

(declare-fun m!286473 () Bool)

(assert (=> b!270799 m!286473))

(declare-fun m!286475 () Bool)

(assert (=> b!270808 m!286475))

(declare-fun m!286477 () Bool)

(assert (=> b!270806 m!286477))

(declare-fun m!286479 () Bool)

(assert (=> b!270805 m!286479))

(declare-fun m!286481 () Bool)

(assert (=> b!270802 m!286481))

(declare-fun m!286483 () Bool)

(assert (=> b!270801 m!286483))

(declare-fun m!286485 () Bool)

(assert (=> b!270807 m!286485))

(declare-fun m!286487 () Bool)

(assert (=> b!270796 m!286487))

(assert (=> b!270796 m!286487))

(declare-fun m!286489 () Bool)

(assert (=> b!270796 m!286489))

(declare-fun m!286491 () Bool)

(assert (=> b!270800 m!286491))

(declare-fun m!286493 () Bool)

(assert (=> b!270804 m!286493))

(check-sat (not b!270807) (not b!270806) (not b!270808) (not b!270805) (not start!26196) (not b!270804) (not b!270802) (not b!270799) (not b!270796) (not b!270801) (not b!270800))
(check-sat)
