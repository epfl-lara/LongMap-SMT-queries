; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49092 () Bool)

(assert start!49092)

(declare-fun b!540625 () Bool)

(declare-fun res!335658 () Bool)

(declare-fun e!313128 () Bool)

(assert (=> b!540625 (=> (not res!335658) (not e!313128))))

(declare-datatypes ((array!34212 0))(
  ( (array!34213 (arr!16442 (Array (_ BitVec 32) (_ BitVec 64))) (size!16807 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34212)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34212 (_ BitVec 32)) Bool)

(assert (=> b!540625 (= res!335658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!335656 () Bool)

(declare-fun e!313126 () Bool)

(assert (=> start!49092 (=> (not res!335656) (not e!313126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49092 (= res!335656 (validMask!0 mask!3216))))

(assert (=> start!49092 e!313126))

(assert (=> start!49092 true))

(declare-fun array_inv!12325 (array!34212) Bool)

(assert (=> start!49092 (array_inv!12325 a!3154)))

(declare-fun b!540626 () Bool)

(declare-fun res!335663 () Bool)

(assert (=> b!540626 (=> (not res!335663) (not e!313128))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540626 (= res!335663 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16807 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16807 a!3154)) (= (select (arr!16442 a!3154) resIndex!32) (select (arr!16442 a!3154) j!147))))))

(declare-fun b!540627 () Bool)

(assert (=> b!540627 (= e!313128 false)))

(declare-datatypes ((SeekEntryResult!4897 0))(
  ( (MissingZero!4897 (index!21812 (_ BitVec 32))) (Found!4897 (index!21813 (_ BitVec 32))) (Intermediate!4897 (undefined!5709 Bool) (index!21814 (_ BitVec 32)) (x!50735 (_ BitVec 32))) (Undefined!4897) (MissingVacant!4897 (index!21815 (_ BitVec 32))) )
))
(declare-fun lt!247279 () SeekEntryResult!4897)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34212 (_ BitVec 32)) SeekEntryResult!4897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540627 (= lt!247279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16442 a!3154) j!147) mask!3216) (select (arr!16442 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540628 () Bool)

(declare-fun res!335655 () Bool)

(assert (=> b!540628 (=> (not res!335655) (not e!313126))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540628 (= res!335655 (validKeyInArray!0 k0!1998))))

(declare-fun b!540629 () Bool)

(declare-fun res!335659 () Bool)

(assert (=> b!540629 (=> (not res!335659) (not e!313126))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540629 (= res!335659 (and (= (size!16807 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16807 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16807 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540630 () Bool)

(declare-fun res!335662 () Bool)

(assert (=> b!540630 (=> (not res!335662) (not e!313128))))

(declare-datatypes ((List!10600 0))(
  ( (Nil!10597) (Cons!10596 (h!11545 (_ BitVec 64)) (t!16819 List!10600)) )
))
(declare-fun arrayNoDuplicates!0 (array!34212 (_ BitVec 32) List!10600) Bool)

(assert (=> b!540630 (= res!335662 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10597))))

(declare-fun b!540631 () Bool)

(declare-fun res!335661 () Bool)

(assert (=> b!540631 (=> (not res!335661) (not e!313126))))

(assert (=> b!540631 (= res!335661 (validKeyInArray!0 (select (arr!16442 a!3154) j!147)))))

(declare-fun b!540632 () Bool)

(declare-fun res!335660 () Bool)

(assert (=> b!540632 (=> (not res!335660) (not e!313128))))

(assert (=> b!540632 (= res!335660 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16442 a!3154) j!147) a!3154 mask!3216) (Intermediate!4897 false resIndex!32 resX!32)))))

(declare-fun b!540633 () Bool)

(declare-fun res!335654 () Bool)

(assert (=> b!540633 (=> (not res!335654) (not e!313126))))

(declare-fun arrayContainsKey!0 (array!34212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540633 (= res!335654 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540634 () Bool)

(assert (=> b!540634 (= e!313126 e!313128)))

(declare-fun res!335657 () Bool)

(assert (=> b!540634 (=> (not res!335657) (not e!313128))))

(declare-fun lt!247278 () SeekEntryResult!4897)

(assert (=> b!540634 (= res!335657 (or (= lt!247278 (MissingZero!4897 i!1153)) (= lt!247278 (MissingVacant!4897 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34212 (_ BitVec 32)) SeekEntryResult!4897)

(assert (=> b!540634 (= lt!247278 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!49092 res!335656) b!540629))

(assert (= (and b!540629 res!335659) b!540631))

(assert (= (and b!540631 res!335661) b!540628))

(assert (= (and b!540628 res!335655) b!540633))

(assert (= (and b!540633 res!335654) b!540634))

(assert (= (and b!540634 res!335657) b!540625))

(assert (= (and b!540625 res!335658) b!540630))

(assert (= (and b!540630 res!335662) b!540626))

(assert (= (and b!540626 res!335663) b!540632))

(assert (= (and b!540632 res!335660) b!540627))

(declare-fun m!518791 () Bool)

(assert (=> b!540626 m!518791))

(declare-fun m!518793 () Bool)

(assert (=> b!540626 m!518793))

(declare-fun m!518795 () Bool)

(assert (=> b!540628 m!518795))

(assert (=> b!540631 m!518793))

(assert (=> b!540631 m!518793))

(declare-fun m!518797 () Bool)

(assert (=> b!540631 m!518797))

(declare-fun m!518799 () Bool)

(assert (=> b!540625 m!518799))

(declare-fun m!518801 () Bool)

(assert (=> b!540630 m!518801))

(declare-fun m!518803 () Bool)

(assert (=> start!49092 m!518803))

(declare-fun m!518805 () Bool)

(assert (=> start!49092 m!518805))

(assert (=> b!540632 m!518793))

(assert (=> b!540632 m!518793))

(declare-fun m!518807 () Bool)

(assert (=> b!540632 m!518807))

(assert (=> b!540627 m!518793))

(assert (=> b!540627 m!518793))

(declare-fun m!518809 () Bool)

(assert (=> b!540627 m!518809))

(assert (=> b!540627 m!518809))

(assert (=> b!540627 m!518793))

(declare-fun m!518811 () Bool)

(assert (=> b!540627 m!518811))

(declare-fun m!518813 () Bool)

(assert (=> b!540634 m!518813))

(declare-fun m!518815 () Bool)

(assert (=> b!540633 m!518815))

(check-sat (not b!540628) (not b!540625) (not b!540627) (not b!540632) (not b!540633) (not b!540631) (not b!540634) (not b!540630) (not start!49092))
(check-sat)
