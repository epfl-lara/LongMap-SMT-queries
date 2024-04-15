; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49602 () Bool)

(assert start!49602)

(declare-fun b!545656 () Bool)

(declare-fun res!339731 () Bool)

(declare-fun e!315363 () Bool)

(assert (=> b!545656 (=> (not res!339731) (not e!315363))))

(declare-datatypes ((array!34425 0))(
  ( (array!34426 (arr!16541 (Array (_ BitVec 32) (_ BitVec 64))) (size!16906 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34425)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34425 (_ BitVec 32)) Bool)

(assert (=> b!545656 (= res!339731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545657 () Bool)

(declare-fun e!315361 () Bool)

(assert (=> b!545657 (= e!315361 e!315363)))

(declare-fun res!339729 () Bool)

(assert (=> b!545657 (=> (not res!339729) (not e!315363))))

(declare-datatypes ((SeekEntryResult!4996 0))(
  ( (MissingZero!4996 (index!22208 (_ BitVec 32))) (Found!4996 (index!22209 (_ BitVec 32))) (Intermediate!4996 (undefined!5808 Bool) (index!22210 (_ BitVec 32)) (x!51143 (_ BitVec 32))) (Undefined!4996) (MissingVacant!4996 (index!22211 (_ BitVec 32))) )
))
(declare-fun lt!248843 () SeekEntryResult!4996)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545657 (= res!339729 (or (= lt!248843 (MissingZero!4996 i!1153)) (= lt!248843 (MissingVacant!4996 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34425 (_ BitVec 32)) SeekEntryResult!4996)

(assert (=> b!545657 (= lt!248843 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545658 () Bool)

(declare-fun res!339734 () Bool)

(assert (=> b!545658 (=> (not res!339734) (not e!315363))))

(declare-datatypes ((List!10699 0))(
  ( (Nil!10696) (Cons!10695 (h!11659 (_ BitVec 64)) (t!16918 List!10699)) )
))
(declare-fun arrayNoDuplicates!0 (array!34425 (_ BitVec 32) List!10699) Bool)

(assert (=> b!545658 (= res!339734 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10696))))

(declare-fun b!545659 () Bool)

(declare-fun res!339726 () Bool)

(assert (=> b!545659 (=> (not res!339726) (not e!315361))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545659 (= res!339726 (validKeyInArray!0 (select (arr!16541 a!3154) j!147)))))

(declare-fun b!545660 () Bool)

(declare-fun res!339727 () Bool)

(assert (=> b!545660 (=> (not res!339727) (not e!315363))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545660 (= res!339727 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16906 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16906 a!3154)) (= (select (arr!16541 a!3154) resIndex!32) (select (arr!16541 a!3154) j!147))))))

(declare-fun b!545661 () Bool)

(declare-fun res!339737 () Bool)

(assert (=> b!545661 (=> (not res!339737) (not e!315361))))

(declare-fun arrayContainsKey!0 (array!34425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545661 (= res!339737 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545662 () Bool)

(declare-fun res!339733 () Bool)

(assert (=> b!545662 (=> (not res!339733) (not e!315361))))

(assert (=> b!545662 (= res!339733 (and (= (size!16906 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16906 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16906 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545663 () Bool)

(declare-fun res!339736 () Bool)

(assert (=> b!545663 (=> (not res!339736) (not e!315361))))

(assert (=> b!545663 (= res!339736 (validKeyInArray!0 k0!1998))))

(declare-fun b!545664 () Bool)

(declare-fun e!315365 () Bool)

(assert (=> b!545664 (= e!315365 (not true))))

(declare-fun lt!248846 () SeekEntryResult!4996)

(declare-fun lt!248848 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34425 (_ BitVec 32)) SeekEntryResult!4996)

(assert (=> b!545664 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248848 (select (store (arr!16541 a!3154) i!1153 k0!1998) j!147) (array!34426 (store (arr!16541 a!3154) i!1153 k0!1998) (size!16906 a!3154)) mask!3216) lt!248846)))

(declare-datatypes ((Unit!16918 0))(
  ( (Unit!16919) )
))
(declare-fun lt!248847 () Unit!16918)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16918)

(assert (=> b!545664 (= lt!248847 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!248848 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun res!339725 () Bool)

(assert (=> start!49602 (=> (not res!339725) (not e!315361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49602 (= res!339725 (validMask!0 mask!3216))))

(assert (=> start!49602 e!315361))

(assert (=> start!49602 true))

(declare-fun array_inv!12424 (array!34425) Bool)

(assert (=> start!49602 (array_inv!12424 a!3154)))

(declare-fun b!545665 () Bool)

(declare-fun e!315366 () Bool)

(assert (=> b!545665 (= e!315366 e!315365)))

(declare-fun res!339730 () Bool)

(assert (=> b!545665 (=> (not res!339730) (not e!315365))))

(declare-fun lt!248845 () SeekEntryResult!4996)

(declare-fun lt!248842 () SeekEntryResult!4996)

(assert (=> b!545665 (= res!339730 (and (= lt!248842 lt!248846) (= lt!248845 lt!248842)))))

(assert (=> b!545665 (= lt!248842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248848 (select (arr!16541 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545666 () Bool)

(declare-fun e!315364 () Bool)

(assert (=> b!545666 (= e!315364 e!315366)))

(declare-fun res!339735 () Bool)

(assert (=> b!545666 (=> (not res!339735) (not e!315366))))

(assert (=> b!545666 (= res!339735 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248848 #b00000000000000000000000000000000) (bvslt lt!248848 (size!16906 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545666 (= lt!248848 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545667 () Bool)

(declare-fun e!315360 () Bool)

(assert (=> b!545667 (= e!315363 e!315360)))

(declare-fun res!339728 () Bool)

(assert (=> b!545667 (=> (not res!339728) (not e!315360))))

(declare-fun lt!248844 () SeekEntryResult!4996)

(assert (=> b!545667 (= res!339728 (= lt!248844 lt!248846))))

(assert (=> b!545667 (= lt!248846 (Intermediate!4996 false resIndex!32 resX!32))))

(assert (=> b!545667 (= lt!248844 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16541 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545668 () Bool)

(assert (=> b!545668 (= e!315360 e!315364)))

(declare-fun res!339732 () Bool)

(assert (=> b!545668 (=> (not res!339732) (not e!315364))))

(assert (=> b!545668 (= res!339732 (and (= lt!248845 lt!248844) (not (= (select (arr!16541 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16541 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16541 a!3154) index!1177) (select (arr!16541 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545668 (= lt!248845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16541 a!3154) j!147) mask!3216) (select (arr!16541 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49602 res!339725) b!545662))

(assert (= (and b!545662 res!339733) b!545659))

(assert (= (and b!545659 res!339726) b!545663))

(assert (= (and b!545663 res!339736) b!545661))

(assert (= (and b!545661 res!339737) b!545657))

(assert (= (and b!545657 res!339729) b!545656))

(assert (= (and b!545656 res!339731) b!545658))

(assert (= (and b!545658 res!339734) b!545660))

(assert (= (and b!545660 res!339727) b!545667))

(assert (= (and b!545667 res!339728) b!545668))

(assert (= (and b!545668 res!339732) b!545666))

(assert (= (and b!545666 res!339735) b!545665))

(assert (= (and b!545665 res!339730) b!545664))

(declare-fun m!522721 () Bool)

(assert (=> b!545666 m!522721))

(declare-fun m!522723 () Bool)

(assert (=> b!545659 m!522723))

(assert (=> b!545659 m!522723))

(declare-fun m!522725 () Bool)

(assert (=> b!545659 m!522725))

(declare-fun m!522727 () Bool)

(assert (=> b!545663 m!522727))

(declare-fun m!522729 () Bool)

(assert (=> b!545656 m!522729))

(declare-fun m!522731 () Bool)

(assert (=> b!545660 m!522731))

(assert (=> b!545660 m!522723))

(declare-fun m!522733 () Bool)

(assert (=> b!545661 m!522733))

(declare-fun m!522735 () Bool)

(assert (=> start!49602 m!522735))

(declare-fun m!522737 () Bool)

(assert (=> start!49602 m!522737))

(declare-fun m!522739 () Bool)

(assert (=> b!545657 m!522739))

(declare-fun m!522741 () Bool)

(assert (=> b!545668 m!522741))

(assert (=> b!545668 m!522723))

(assert (=> b!545668 m!522723))

(declare-fun m!522743 () Bool)

(assert (=> b!545668 m!522743))

(assert (=> b!545668 m!522743))

(assert (=> b!545668 m!522723))

(declare-fun m!522745 () Bool)

(assert (=> b!545668 m!522745))

(declare-fun m!522747 () Bool)

(assert (=> b!545658 m!522747))

(assert (=> b!545665 m!522723))

(assert (=> b!545665 m!522723))

(declare-fun m!522749 () Bool)

(assert (=> b!545665 m!522749))

(declare-fun m!522751 () Bool)

(assert (=> b!545664 m!522751))

(declare-fun m!522753 () Bool)

(assert (=> b!545664 m!522753))

(assert (=> b!545664 m!522753))

(declare-fun m!522755 () Bool)

(assert (=> b!545664 m!522755))

(declare-fun m!522757 () Bool)

(assert (=> b!545664 m!522757))

(assert (=> b!545667 m!522723))

(assert (=> b!545667 m!522723))

(declare-fun m!522759 () Bool)

(assert (=> b!545667 m!522759))

(check-sat (not b!545656) (not b!545657) (not start!49602) (not b!545666) (not b!545665) (not b!545668) (not b!545658) (not b!545664) (not b!545663) (not b!545661) (not b!545667) (not b!545659))
(check-sat)
