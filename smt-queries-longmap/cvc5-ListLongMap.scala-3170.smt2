; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44646 () Bool)

(assert start!44646)

(declare-fun e!288028 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31705 0))(
  ( (array!31706 (arr!15240 (Array (_ BitVec 32) (_ BitVec 64))) (size!15604 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31705)

(declare-fun b!489813 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3707 0))(
  ( (MissingZero!3707 (index!17007 (_ BitVec 32))) (Found!3707 (index!17008 (_ BitVec 32))) (Intermediate!3707 (undefined!4519 Bool) (index!17009 (_ BitVec 32)) (x!46117 (_ BitVec 32))) (Undefined!3707) (MissingVacant!3707 (index!17010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31705 (_ BitVec 32)) SeekEntryResult!3707)

(assert (=> b!489813 (= e!288028 (= (seekEntryOrOpen!0 (select (arr!15240 a!3235) j!176) a!3235 mask!3524) (Found!3707 j!176)))))

(declare-fun b!489814 () Bool)

(declare-fun res!292756 () Bool)

(declare-fun e!288027 () Bool)

(assert (=> b!489814 (=> (not res!292756) (not e!288027))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489814 (= res!292756 (validKeyInArray!0 k!2280))))

(declare-fun b!489816 () Bool)

(declare-fun res!292757 () Bool)

(assert (=> b!489816 (=> (not res!292757) (not e!288027))))

(declare-fun arrayContainsKey!0 (array!31705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489816 (= res!292757 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489817 () Bool)

(declare-fun res!292749 () Bool)

(assert (=> b!489817 (=> (not res!292749) (not e!288027))))

(assert (=> b!489817 (= res!292749 (validKeyInArray!0 (select (arr!15240 a!3235) j!176)))))

(declare-fun b!489818 () Bool)

(declare-fun e!288030 () Bool)

(assert (=> b!489818 (= e!288030 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221076 () SeekEntryResult!3707)

(declare-fun lt!221075 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31705 (_ BitVec 32)) SeekEntryResult!3707)

(assert (=> b!489818 (= lt!221076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221075 (select (store (arr!15240 a!3235) i!1204 k!2280) j!176) (array!31706 (store (arr!15240 a!3235) i!1204 k!2280) (size!15604 a!3235)) mask!3524))))

(declare-fun lt!221077 () (_ BitVec 32))

(declare-fun lt!221078 () SeekEntryResult!3707)

(assert (=> b!489818 (= lt!221078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221077 (select (arr!15240 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489818 (= lt!221075 (toIndex!0 (select (store (arr!15240 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489818 (= lt!221077 (toIndex!0 (select (arr!15240 a!3235) j!176) mask!3524))))

(assert (=> b!489818 e!288028))

(declare-fun res!292755 () Bool)

(assert (=> b!489818 (=> (not res!292755) (not e!288028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31705 (_ BitVec 32)) Bool)

(assert (=> b!489818 (= res!292755 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14360 0))(
  ( (Unit!14361) )
))
(declare-fun lt!221080 () Unit!14360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14360)

(assert (=> b!489818 (= lt!221080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489819 () Bool)

(assert (=> b!489819 (= e!288027 e!288030)))

(declare-fun res!292750 () Bool)

(assert (=> b!489819 (=> (not res!292750) (not e!288030))))

(declare-fun lt!221079 () SeekEntryResult!3707)

(assert (=> b!489819 (= res!292750 (or (= lt!221079 (MissingZero!3707 i!1204)) (= lt!221079 (MissingVacant!3707 i!1204))))))

(assert (=> b!489819 (= lt!221079 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489815 () Bool)

(declare-fun res!292754 () Bool)

(assert (=> b!489815 (=> (not res!292754) (not e!288027))))

(assert (=> b!489815 (= res!292754 (and (= (size!15604 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15604 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15604 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292751 () Bool)

(assert (=> start!44646 (=> (not res!292751) (not e!288027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44646 (= res!292751 (validMask!0 mask!3524))))

(assert (=> start!44646 e!288027))

(assert (=> start!44646 true))

(declare-fun array_inv!11036 (array!31705) Bool)

(assert (=> start!44646 (array_inv!11036 a!3235)))

(declare-fun b!489820 () Bool)

(declare-fun res!292753 () Bool)

(assert (=> b!489820 (=> (not res!292753) (not e!288030))))

(assert (=> b!489820 (= res!292753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489821 () Bool)

(declare-fun res!292752 () Bool)

(assert (=> b!489821 (=> (not res!292752) (not e!288030))))

(declare-datatypes ((List!9398 0))(
  ( (Nil!9395) (Cons!9394 (h!10256 (_ BitVec 64)) (t!15626 List!9398)) )
))
(declare-fun arrayNoDuplicates!0 (array!31705 (_ BitVec 32) List!9398) Bool)

(assert (=> b!489821 (= res!292752 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9395))))

(assert (= (and start!44646 res!292751) b!489815))

(assert (= (and b!489815 res!292754) b!489817))

(assert (= (and b!489817 res!292749) b!489814))

(assert (= (and b!489814 res!292756) b!489816))

(assert (= (and b!489816 res!292757) b!489819))

(assert (= (and b!489819 res!292750) b!489820))

(assert (= (and b!489820 res!292753) b!489821))

(assert (= (and b!489821 res!292752) b!489818))

(assert (= (and b!489818 res!292755) b!489813))

(declare-fun m!469713 () Bool)

(assert (=> b!489819 m!469713))

(declare-fun m!469715 () Bool)

(assert (=> b!489817 m!469715))

(assert (=> b!489817 m!469715))

(declare-fun m!469717 () Bool)

(assert (=> b!489817 m!469717))

(assert (=> b!489813 m!469715))

(assert (=> b!489813 m!469715))

(declare-fun m!469719 () Bool)

(assert (=> b!489813 m!469719))

(declare-fun m!469721 () Bool)

(assert (=> b!489821 m!469721))

(declare-fun m!469723 () Bool)

(assert (=> b!489818 m!469723))

(declare-fun m!469725 () Bool)

(assert (=> b!489818 m!469725))

(assert (=> b!489818 m!469715))

(declare-fun m!469727 () Bool)

(assert (=> b!489818 m!469727))

(assert (=> b!489818 m!469715))

(declare-fun m!469729 () Bool)

(assert (=> b!489818 m!469729))

(assert (=> b!489818 m!469715))

(declare-fun m!469731 () Bool)

(assert (=> b!489818 m!469731))

(assert (=> b!489818 m!469725))

(declare-fun m!469733 () Bool)

(assert (=> b!489818 m!469733))

(assert (=> b!489818 m!469725))

(declare-fun m!469735 () Bool)

(assert (=> b!489818 m!469735))

(declare-fun m!469737 () Bool)

(assert (=> b!489818 m!469737))

(declare-fun m!469739 () Bool)

(assert (=> b!489816 m!469739))

(declare-fun m!469741 () Bool)

(assert (=> b!489820 m!469741))

(declare-fun m!469743 () Bool)

(assert (=> b!489814 m!469743))

(declare-fun m!469745 () Bool)

(assert (=> start!44646 m!469745))

(declare-fun m!469747 () Bool)

(assert (=> start!44646 m!469747))

(push 1)

(assert (not b!489821))

(assert (not b!489814))

(assert (not b!489817))

(assert (not start!44646))

(assert (not b!489813))

(assert (not b!489819))

(assert (not b!489820))

(assert (not b!489818))

(assert (not b!489816))

(check-sat)

