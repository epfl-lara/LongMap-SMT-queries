; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31044 () Bool)

(assert start!31044)

(declare-fun b!312133 () Bool)

(declare-fun res!168738 () Bool)

(declare-fun e!194630 () Bool)

(assert (=> b!312133 (=> (not res!168738) (not e!194630))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312133 (= res!168738 (validKeyInArray!0 k0!2441))))

(declare-fun b!312134 () Bool)

(declare-fun res!168735 () Bool)

(declare-fun e!194627 () Bool)

(assert (=> b!312134 (=> (not res!168735) (not e!194627))))

(declare-datatypes ((array!15950 0))(
  ( (array!15951 (arr!7557 (Array (_ BitVec 32) (_ BitVec 64))) (size!7910 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15950)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312134 (= res!168735 (and (= (select (arr!7557 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7910 a!3293))))))

(declare-fun b!312135 () Bool)

(declare-fun res!168733 () Bool)

(assert (=> b!312135 (=> (not res!168733) (not e!194630))))

(declare-fun arrayContainsKey!0 (array!15950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312135 (= res!168733 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312136 () Bool)

(declare-fun res!168734 () Bool)

(assert (=> b!312136 (=> (not res!168734) (not e!194630))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2696 0))(
  ( (MissingZero!2696 (index!12960 (_ BitVec 32))) (Found!2696 (index!12961 (_ BitVec 32))) (Intermediate!2696 (undefined!3508 Bool) (index!12962 (_ BitVec 32)) (x!31184 (_ BitVec 32))) (Undefined!2696) (MissingVacant!2696 (index!12963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15950 (_ BitVec 32)) SeekEntryResult!2696)

(assert (=> b!312136 (= res!168734 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2696 i!1240)))))

(declare-fun b!312137 () Bool)

(declare-fun res!168741 () Bool)

(assert (=> b!312137 (=> (not res!168741) (not e!194630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15950 (_ BitVec 32)) Bool)

(assert (=> b!312137 (= res!168741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312138 () Bool)

(declare-fun e!194629 () Bool)

(assert (=> b!312138 (= e!194627 e!194629)))

(declare-fun res!168740 () Bool)

(assert (=> b!312138 (=> (not res!168740) (not e!194629))))

(declare-fun lt!152771 () SeekEntryResult!2696)

(declare-fun lt!152774 () SeekEntryResult!2696)

(assert (=> b!312138 (= res!168740 (and (= lt!152771 lt!152774) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7557 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15950 (_ BitVec 32)) SeekEntryResult!2696)

(assert (=> b!312138 (= lt!152771 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312139 () Bool)

(assert (=> b!312139 (= e!194630 e!194627)))

(declare-fun res!168737 () Bool)

(assert (=> b!312139 (=> (not res!168737) (not e!194627))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312139 (= res!168737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152774))))

(assert (=> b!312139 (= lt!152774 (Intermediate!2696 false resIndex!52 resX!52))))

(declare-fun b!312140 () Bool)

(declare-fun e!194628 () Bool)

(assert (=> b!312140 (= e!194629 (not e!194628))))

(declare-fun res!168732 () Bool)

(assert (=> b!312140 (=> res!168732 e!194628)))

(declare-fun lt!152770 () SeekEntryResult!2696)

(declare-fun lt!152773 () (_ BitVec 32))

(assert (=> b!312140 (= res!168732 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152773 #b00000000000000000000000000000000) (bvsge lt!152773 (size!7910 a!3293)) (not (= lt!152770 lt!152774))))))

(declare-fun lt!152769 () SeekEntryResult!2696)

(declare-fun lt!152772 () SeekEntryResult!2696)

(assert (=> b!312140 (= lt!152769 lt!152772)))

(declare-fun lt!152767 () array!15950)

(assert (=> b!312140 (= lt!152772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152773 k0!2441 lt!152767 mask!3709))))

(assert (=> b!312140 (= lt!152769 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152767 mask!3709))))

(assert (=> b!312140 (= lt!152767 (array!15951 (store (arr!7557 a!3293) i!1240 k0!2441) (size!7910 a!3293)))))

(assert (=> b!312140 (= lt!152771 lt!152770)))

(assert (=> b!312140 (= lt!152770 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152773 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312140 (= lt!152773 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312141 () Bool)

(assert (=> b!312141 (= e!194628 (bvsge mask!3709 #b00000000000000000000000000000000))))

(assert (=> b!312141 (= lt!152772 lt!152770)))

(declare-datatypes ((Unit!9595 0))(
  ( (Unit!9596) )
))
(declare-fun lt!152768 () Unit!9595)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15950 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9595)

(assert (=> b!312141 (= lt!152768 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152773 resIndex!52 resX!52 mask!3709))))

(declare-fun res!168736 () Bool)

(assert (=> start!31044 (=> (not res!168736) (not e!194630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31044 (= res!168736 (validMask!0 mask!3709))))

(assert (=> start!31044 e!194630))

(declare-fun array_inv!5529 (array!15950) Bool)

(assert (=> start!31044 (array_inv!5529 a!3293)))

(assert (=> start!31044 true))

(declare-fun b!312132 () Bool)

(declare-fun res!168739 () Bool)

(assert (=> b!312132 (=> (not res!168739) (not e!194630))))

(assert (=> b!312132 (= res!168739 (and (= (size!7910 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7910 a!3293))))))

(assert (= (and start!31044 res!168736) b!312132))

(assert (= (and b!312132 res!168739) b!312133))

(assert (= (and b!312133 res!168738) b!312135))

(assert (= (and b!312135 res!168733) b!312136))

(assert (= (and b!312136 res!168734) b!312137))

(assert (= (and b!312137 res!168741) b!312139))

(assert (= (and b!312139 res!168737) b!312134))

(assert (= (and b!312134 res!168735) b!312138))

(assert (= (and b!312138 res!168740) b!312140))

(assert (= (and b!312140 (not res!168732)) b!312141))

(declare-fun m!321757 () Bool)

(assert (=> b!312133 m!321757))

(declare-fun m!321759 () Bool)

(assert (=> b!312140 m!321759))

(declare-fun m!321761 () Bool)

(assert (=> b!312140 m!321761))

(declare-fun m!321763 () Bool)

(assert (=> b!312140 m!321763))

(declare-fun m!321765 () Bool)

(assert (=> b!312140 m!321765))

(declare-fun m!321767 () Bool)

(assert (=> b!312140 m!321767))

(declare-fun m!321769 () Bool)

(assert (=> start!31044 m!321769))

(declare-fun m!321771 () Bool)

(assert (=> start!31044 m!321771))

(declare-fun m!321773 () Bool)

(assert (=> b!312139 m!321773))

(assert (=> b!312139 m!321773))

(declare-fun m!321775 () Bool)

(assert (=> b!312139 m!321775))

(declare-fun m!321777 () Bool)

(assert (=> b!312136 m!321777))

(declare-fun m!321779 () Bool)

(assert (=> b!312138 m!321779))

(declare-fun m!321781 () Bool)

(assert (=> b!312138 m!321781))

(declare-fun m!321783 () Bool)

(assert (=> b!312141 m!321783))

(declare-fun m!321785 () Bool)

(assert (=> b!312135 m!321785))

(declare-fun m!321787 () Bool)

(assert (=> b!312134 m!321787))

(declare-fun m!321789 () Bool)

(assert (=> b!312137 m!321789))

(check-sat (not b!312136) (not b!312138) (not b!312135) (not b!312140) (not start!31044) (not b!312137) (not b!312139) (not b!312141) (not b!312133))
(check-sat)
