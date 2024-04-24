; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130164 () Bool)

(assert start!130164)

(declare-fun b!1525672 () Bool)

(declare-fun res!1043102 () Bool)

(declare-fun e!850738 () Bool)

(assert (=> b!1525672 (=> (not res!1043102) (not e!850738))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101497 0))(
  ( (array!101498 (arr!48973 (Array (_ BitVec 32) (_ BitVec 64))) (size!49524 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101497)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1525672 (= res!1043102 (and (= (size!49524 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49524 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49524 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525673 () Bool)

(declare-fun res!1043100 () Bool)

(declare-fun e!850735 () Bool)

(assert (=> b!1525673 (=> (not res!1043100) (not e!850735))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13031 0))(
  ( (MissingZero!13031 (index!54519 (_ BitVec 32))) (Found!13031 (index!54520 (_ BitVec 32))) (Intermediate!13031 (undefined!13843 Bool) (index!54521 (_ BitVec 32)) (x!136420 (_ BitVec 32))) (Undefined!13031) (MissingVacant!13031 (index!54522 (_ BitVec 32))) )
))
(declare-fun lt!660812 () SeekEntryResult!13031)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101497 (_ BitVec 32)) SeekEntryResult!13031)

(assert (=> b!1525673 (= res!1043100 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!660812))))

(declare-fun b!1525674 () Bool)

(assert (=> b!1525674 (= e!850738 e!850735)))

(declare-fun res!1043094 () Bool)

(assert (=> b!1525674 (=> (not res!1043094) (not e!850735))))

(declare-fun lt!660813 () SeekEntryResult!13031)

(assert (=> b!1525674 (= res!1043094 (= lt!660813 lt!660812))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525674 (= lt!660812 (Intermediate!13031 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525674 (= lt!660813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525675 () Bool)

(assert (=> b!1525675 (= e!850735 (not true))))

(declare-fun e!850736 () Bool)

(assert (=> b!1525675 e!850736))

(declare-fun res!1043096 () Bool)

(assert (=> b!1525675 (=> (not res!1043096) (not e!850736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101497 (_ BitVec 32)) Bool)

(assert (=> b!1525675 (= res!1043096 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50881 0))(
  ( (Unit!50882) )
))
(declare-fun lt!660811 () Unit!50881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50881)

(assert (=> b!1525675 (= lt!660811 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525676 () Bool)

(declare-fun res!1043095 () Bool)

(assert (=> b!1525676 (=> (not res!1043095) (not e!850738))))

(assert (=> b!1525676 (= res!1043095 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49524 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49524 a!2804))))))

(declare-fun b!1525677 () Bool)

(declare-fun res!1043098 () Bool)

(assert (=> b!1525677 (=> (not res!1043098) (not e!850738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525677 (= res!1043098 (validKeyInArray!0 (select (arr!48973 a!2804) i!961)))))

(declare-fun res!1043093 () Bool)

(assert (=> start!130164 (=> (not res!1043093) (not e!850738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130164 (= res!1043093 (validMask!0 mask!2512))))

(assert (=> start!130164 e!850738))

(assert (=> start!130164 true))

(declare-fun array_inv!38254 (array!101497) Bool)

(assert (=> start!130164 (array_inv!38254 a!2804)))

(declare-fun b!1525678 () Bool)

(declare-fun res!1043099 () Bool)

(assert (=> b!1525678 (=> (not res!1043099) (not e!850735))))

(assert (=> b!1525678 (= res!1043099 (= lt!660813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101498 (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49524 a!2804)) mask!2512)))))

(declare-fun b!1525679 () Bool)

(declare-fun res!1043103 () Bool)

(assert (=> b!1525679 (=> (not res!1043103) (not e!850738))))

(declare-datatypes ((List!35443 0))(
  ( (Nil!35440) (Cons!35439 (h!36881 (_ BitVec 64)) (t!50129 List!35443)) )
))
(declare-fun arrayNoDuplicates!0 (array!101497 (_ BitVec 32) List!35443) Bool)

(assert (=> b!1525679 (= res!1043103 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35440))))

(declare-fun b!1525680 () Bool)

(declare-fun res!1043101 () Bool)

(assert (=> b!1525680 (=> (not res!1043101) (not e!850738))))

(assert (=> b!1525680 (= res!1043101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525681 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101497 (_ BitVec 32)) SeekEntryResult!13031)

(assert (=> b!1525681 (= e!850736 (= (seekEntry!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) (Found!13031 j!70)))))

(declare-fun b!1525682 () Bool)

(declare-fun res!1043097 () Bool)

(assert (=> b!1525682 (=> (not res!1043097) (not e!850738))))

(assert (=> b!1525682 (= res!1043097 (validKeyInArray!0 (select (arr!48973 a!2804) j!70)))))

(assert (= (and start!130164 res!1043093) b!1525672))

(assert (= (and b!1525672 res!1043102) b!1525677))

(assert (= (and b!1525677 res!1043098) b!1525682))

(assert (= (and b!1525682 res!1043097) b!1525680))

(assert (= (and b!1525680 res!1043101) b!1525679))

(assert (= (and b!1525679 res!1043103) b!1525676))

(assert (= (and b!1525676 res!1043095) b!1525674))

(assert (= (and b!1525674 res!1043094) b!1525673))

(assert (= (and b!1525673 res!1043100) b!1525678))

(assert (= (and b!1525678 res!1043099) b!1525675))

(assert (= (and b!1525675 res!1043096) b!1525681))

(declare-fun m!1408633 () Bool)

(assert (=> b!1525674 m!1408633))

(assert (=> b!1525674 m!1408633))

(declare-fun m!1408635 () Bool)

(assert (=> b!1525674 m!1408635))

(assert (=> b!1525674 m!1408635))

(assert (=> b!1525674 m!1408633))

(declare-fun m!1408637 () Bool)

(assert (=> b!1525674 m!1408637))

(assert (=> b!1525681 m!1408633))

(assert (=> b!1525681 m!1408633))

(declare-fun m!1408639 () Bool)

(assert (=> b!1525681 m!1408639))

(declare-fun m!1408641 () Bool)

(assert (=> start!130164 m!1408641))

(declare-fun m!1408643 () Bool)

(assert (=> start!130164 m!1408643))

(declare-fun m!1408645 () Bool)

(assert (=> b!1525679 m!1408645))

(declare-fun m!1408647 () Bool)

(assert (=> b!1525677 m!1408647))

(assert (=> b!1525677 m!1408647))

(declare-fun m!1408649 () Bool)

(assert (=> b!1525677 m!1408649))

(declare-fun m!1408651 () Bool)

(assert (=> b!1525675 m!1408651))

(declare-fun m!1408653 () Bool)

(assert (=> b!1525675 m!1408653))

(assert (=> b!1525682 m!1408633))

(assert (=> b!1525682 m!1408633))

(declare-fun m!1408655 () Bool)

(assert (=> b!1525682 m!1408655))

(declare-fun m!1408657 () Bool)

(assert (=> b!1525680 m!1408657))

(declare-fun m!1408659 () Bool)

(assert (=> b!1525678 m!1408659))

(declare-fun m!1408661 () Bool)

(assert (=> b!1525678 m!1408661))

(assert (=> b!1525678 m!1408661))

(declare-fun m!1408663 () Bool)

(assert (=> b!1525678 m!1408663))

(assert (=> b!1525678 m!1408663))

(assert (=> b!1525678 m!1408661))

(declare-fun m!1408665 () Bool)

(assert (=> b!1525678 m!1408665))

(assert (=> b!1525673 m!1408633))

(assert (=> b!1525673 m!1408633))

(declare-fun m!1408667 () Bool)

(assert (=> b!1525673 m!1408667))

(check-sat (not b!1525673) (not start!130164) (not b!1525682) (not b!1525677) (not b!1525675) (not b!1525678) (not b!1525680) (not b!1525681) (not b!1525674) (not b!1525679))
(check-sat)
