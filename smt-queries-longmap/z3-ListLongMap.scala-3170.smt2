; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44636 () Bool)

(assert start!44636)

(declare-fun b!489752 () Bool)

(declare-fun res!292743 () Bool)

(declare-fun e!287991 () Bool)

(assert (=> b!489752 (=> (not res!292743) (not e!287991))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31696 0))(
  ( (array!31697 (arr!15235 (Array (_ BitVec 32) (_ BitVec 64))) (size!15599 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31696)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489752 (= res!292743 (and (= (size!15599 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15599 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15599 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489753 () Bool)

(declare-fun res!292746 () Bool)

(assert (=> b!489753 (=> (not res!292746) (not e!287991))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489753 (= res!292746 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489754 () Bool)

(declare-fun res!292744 () Bool)

(assert (=> b!489754 (=> (not res!292744) (not e!287991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489754 (= res!292744 (validKeyInArray!0 k0!2280))))

(declare-fun e!287990 () Bool)

(declare-fun b!489756 () Bool)

(declare-datatypes ((SeekEntryResult!3658 0))(
  ( (MissingZero!3658 (index!16811 (_ BitVec 32))) (Found!3658 (index!16812 (_ BitVec 32))) (Intermediate!3658 (undefined!4470 Bool) (index!16813 (_ BitVec 32)) (x!46065 (_ BitVec 32))) (Undefined!3658) (MissingVacant!3658 (index!16814 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31696 (_ BitVec 32)) SeekEntryResult!3658)

(assert (=> b!489756 (= e!287990 (= (seekEntryOrOpen!0 (select (arr!15235 a!3235) j!176) a!3235 mask!3524) (Found!3658 j!176)))))

(declare-fun b!489757 () Bool)

(declare-fun res!292745 () Bool)

(declare-fun e!287988 () Bool)

(assert (=> b!489757 (=> (not res!292745) (not e!287988))))

(declare-datatypes ((List!9300 0))(
  ( (Nil!9297) (Cons!9296 (h!10158 (_ BitVec 64)) (t!15520 List!9300)) )
))
(declare-fun arrayNoDuplicates!0 (array!31696 (_ BitVec 32) List!9300) Bool)

(assert (=> b!489757 (= res!292745 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9297))))

(declare-fun b!489758 () Bool)

(declare-fun res!292749 () Bool)

(assert (=> b!489758 (=> (not res!292749) (not e!287988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31696 (_ BitVec 32)) Bool)

(assert (=> b!489758 (= res!292749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489759 () Bool)

(declare-fun res!292742 () Bool)

(assert (=> b!489759 (=> (not res!292742) (not e!287991))))

(assert (=> b!489759 (= res!292742 (validKeyInArray!0 (select (arr!15235 a!3235) j!176)))))

(declare-fun b!489760 () Bool)

(assert (=> b!489760 (= e!287988 (not true))))

(declare-fun lt!221092 () SeekEntryResult!3658)

(declare-fun lt!221089 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31696 (_ BitVec 32)) SeekEntryResult!3658)

(assert (=> b!489760 (= lt!221092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221089 (select (store (arr!15235 a!3235) i!1204 k0!2280) j!176) (array!31697 (store (arr!15235 a!3235) i!1204 k0!2280) (size!15599 a!3235)) mask!3524))))

(declare-fun lt!221090 () (_ BitVec 32))

(declare-fun lt!221088 () SeekEntryResult!3658)

(assert (=> b!489760 (= lt!221088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221090 (select (arr!15235 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489760 (= lt!221089 (toIndex!0 (select (store (arr!15235 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489760 (= lt!221090 (toIndex!0 (select (arr!15235 a!3235) j!176) mask!3524))))

(assert (=> b!489760 e!287990))

(declare-fun res!292747 () Bool)

(assert (=> b!489760 (=> (not res!292747) (not e!287990))))

(assert (=> b!489760 (= res!292747 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14323 0))(
  ( (Unit!14324) )
))
(declare-fun lt!221091 () Unit!14323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14323)

(assert (=> b!489760 (= lt!221091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489755 () Bool)

(assert (=> b!489755 (= e!287991 e!287988)))

(declare-fun res!292750 () Bool)

(assert (=> b!489755 (=> (not res!292750) (not e!287988))))

(declare-fun lt!221087 () SeekEntryResult!3658)

(assert (=> b!489755 (= res!292750 (or (= lt!221087 (MissingZero!3658 i!1204)) (= lt!221087 (MissingVacant!3658 i!1204))))))

(assert (=> b!489755 (= lt!221087 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292748 () Bool)

(assert (=> start!44636 (=> (not res!292748) (not e!287991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44636 (= res!292748 (validMask!0 mask!3524))))

(assert (=> start!44636 e!287991))

(assert (=> start!44636 true))

(declare-fun array_inv!11094 (array!31696) Bool)

(assert (=> start!44636 (array_inv!11094 a!3235)))

(assert (= (and start!44636 res!292748) b!489752))

(assert (= (and b!489752 res!292743) b!489759))

(assert (= (and b!489759 res!292742) b!489754))

(assert (= (and b!489754 res!292744) b!489753))

(assert (= (and b!489753 res!292746) b!489755))

(assert (= (and b!489755 res!292750) b!489758))

(assert (= (and b!489758 res!292749) b!489757))

(assert (= (and b!489757 res!292745) b!489760))

(assert (= (and b!489760 res!292747) b!489756))

(declare-fun m!469897 () Bool)

(assert (=> b!489756 m!469897))

(assert (=> b!489756 m!469897))

(declare-fun m!469899 () Bool)

(assert (=> b!489756 m!469899))

(declare-fun m!469901 () Bool)

(assert (=> b!489760 m!469901))

(declare-fun m!469903 () Bool)

(assert (=> b!489760 m!469903))

(declare-fun m!469905 () Bool)

(assert (=> b!489760 m!469905))

(declare-fun m!469907 () Bool)

(assert (=> b!489760 m!469907))

(assert (=> b!489760 m!469903))

(assert (=> b!489760 m!469897))

(declare-fun m!469909 () Bool)

(assert (=> b!489760 m!469909))

(assert (=> b!489760 m!469897))

(declare-fun m!469911 () Bool)

(assert (=> b!489760 m!469911))

(assert (=> b!489760 m!469897))

(declare-fun m!469913 () Bool)

(assert (=> b!489760 m!469913))

(assert (=> b!489760 m!469903))

(declare-fun m!469915 () Bool)

(assert (=> b!489760 m!469915))

(declare-fun m!469917 () Bool)

(assert (=> b!489758 m!469917))

(declare-fun m!469919 () Bool)

(assert (=> b!489757 m!469919))

(assert (=> b!489759 m!469897))

(assert (=> b!489759 m!469897))

(declare-fun m!469921 () Bool)

(assert (=> b!489759 m!469921))

(declare-fun m!469923 () Bool)

(assert (=> b!489755 m!469923))

(declare-fun m!469925 () Bool)

(assert (=> start!44636 m!469925))

(declare-fun m!469927 () Bool)

(assert (=> start!44636 m!469927))

(declare-fun m!469929 () Bool)

(assert (=> b!489754 m!469929))

(declare-fun m!469931 () Bool)

(assert (=> b!489753 m!469931))

(check-sat (not b!489756) (not b!489753) (not b!489755) (not start!44636) (not b!489754) (not b!489758) (not b!489760) (not b!489759) (not b!489757))
(check-sat)
