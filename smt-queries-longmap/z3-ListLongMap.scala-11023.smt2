; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129272 () Bool)

(assert start!129272)

(declare-fun res!1032645 () Bool)

(declare-fun e!845211 () Bool)

(assert (=> start!129272 (=> (not res!1032645) (not e!845211))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129272 (= res!1032645 (validMask!0 mask!2512))))

(assert (=> start!129272 e!845211))

(assert (=> start!129272 true))

(declare-datatypes ((array!100942 0))(
  ( (array!100943 (arr!48703 (Array (_ BitVec 32) (_ BitVec 64))) (size!49254 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100942)

(declare-fun array_inv!37984 (array!100942) Bool)

(assert (=> start!129272 (array_inv!37984 a!2804)))

(declare-fun b!1513912 () Bool)

(declare-fun res!1032639 () Bool)

(assert (=> b!1513912 (=> (not res!1032639) (not e!845211))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513912 (= res!1032639 (validKeyInArray!0 (select (arr!48703 a!2804) i!961)))))

(declare-fun b!1513913 () Bool)

(declare-fun res!1032647 () Bool)

(declare-fun e!845209 () Bool)

(assert (=> b!1513913 (=> (not res!1032647) (not e!845209))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12767 0))(
  ( (MissingZero!12767 (index!53463 (_ BitVec 32))) (Found!12767 (index!53464 (_ BitVec 32))) (Intermediate!12767 (undefined!13579 Bool) (index!53465 (_ BitVec 32)) (x!135394 (_ BitVec 32))) (Undefined!12767) (MissingVacant!12767 (index!53466 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12767)

(assert (=> b!1513913 (= res!1032647 (= (seekEntry!0 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) (Found!12767 j!70)))))

(declare-fun b!1513914 () Bool)

(declare-fun res!1032640 () Bool)

(assert (=> b!1513914 (=> (not res!1032640) (not e!845211))))

(declare-datatypes ((List!35173 0))(
  ( (Nil!35170) (Cons!35169 (h!36596 (_ BitVec 64)) (t!49859 List!35173)) )
))
(declare-fun arrayNoDuplicates!0 (array!100942 (_ BitVec 32) List!35173) Bool)

(assert (=> b!1513914 (= res!1032640 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35170))))

(declare-fun b!1513915 () Bool)

(declare-fun res!1032643 () Bool)

(assert (=> b!1513915 (=> (not res!1032643) (not e!845211))))

(assert (=> b!1513915 (= res!1032643 (and (= (size!49254 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49254 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49254 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513916 () Bool)

(declare-fun res!1032642 () Bool)

(assert (=> b!1513916 (=> (not res!1032642) (not e!845211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100942 (_ BitVec 32)) Bool)

(assert (=> b!1513916 (= res!1032642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513917 () Bool)

(declare-fun res!1032649 () Bool)

(assert (=> b!1513917 (=> (not res!1032649) (not e!845211))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1513917 (= res!1032649 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49254 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49254 a!2804))))))

(declare-fun e!845207 () Bool)

(declare-fun b!1513918 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12767)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12767)

(assert (=> b!1513918 (= e!845207 (= (seekEntryOrOpen!0 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48703 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513919 () Bool)

(declare-fun res!1032648 () Bool)

(declare-fun e!845208 () Bool)

(assert (=> b!1513919 (=> (not res!1032648) (not e!845208))))

(declare-fun lt!656256 () SeekEntryResult!12767)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513919 (= res!1032648 (= lt!656256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100943 (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49254 a!2804)) mask!2512)))))

(declare-fun b!1513920 () Bool)

(assert (=> b!1513920 (= e!845211 e!845208)))

(declare-fun res!1032641 () Bool)

(assert (=> b!1513920 (=> (not res!1032641) (not e!845208))))

(declare-fun lt!656255 () SeekEntryResult!12767)

(assert (=> b!1513920 (= res!1032641 (= lt!656256 lt!656255))))

(assert (=> b!1513920 (= lt!656255 (Intermediate!12767 false resIndex!21 resX!21))))

(assert (=> b!1513920 (= lt!656256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48703 a!2804) j!70) mask!2512) (select (arr!48703 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513921 () Bool)

(declare-fun res!1032650 () Bool)

(assert (=> b!1513921 (=> (not res!1032650) (not e!845208))))

(assert (=> b!1513921 (= res!1032650 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) lt!656255))))

(declare-fun b!1513922 () Bool)

(declare-fun res!1032638 () Bool)

(assert (=> b!1513922 (=> (not res!1032638) (not e!845211))))

(assert (=> b!1513922 (= res!1032638 (validKeyInArray!0 (select (arr!48703 a!2804) j!70)))))

(declare-fun b!1513923 () Bool)

(assert (=> b!1513923 (= e!845209 e!845207)))

(declare-fun res!1032646 () Bool)

(assert (=> b!1513923 (=> res!1032646 e!845207)))

(assert (=> b!1513923 (= res!1032646 (or (not (= (select (arr!48703 a!2804) j!70) (select (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48703 a!2804) index!487) (select (arr!48703 a!2804) j!70)) (not (= (select (arr!48703 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513924 () Bool)

(assert (=> b!1513924 (= e!845208 (not true))))

(assert (=> b!1513924 e!845209))

(declare-fun res!1032644 () Bool)

(assert (=> b!1513924 (=> (not res!1032644) (not e!845209))))

(assert (=> b!1513924 (= res!1032644 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50437 0))(
  ( (Unit!50438) )
))
(declare-fun lt!656257 () Unit!50437)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50437)

(assert (=> b!1513924 (= lt!656257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129272 res!1032645) b!1513915))

(assert (= (and b!1513915 res!1032643) b!1513912))

(assert (= (and b!1513912 res!1032639) b!1513922))

(assert (= (and b!1513922 res!1032638) b!1513916))

(assert (= (and b!1513916 res!1032642) b!1513914))

(assert (= (and b!1513914 res!1032640) b!1513917))

(assert (= (and b!1513917 res!1032649) b!1513920))

(assert (= (and b!1513920 res!1032641) b!1513921))

(assert (= (and b!1513921 res!1032650) b!1513919))

(assert (= (and b!1513919 res!1032648) b!1513924))

(assert (= (and b!1513924 res!1032644) b!1513913))

(assert (= (and b!1513913 res!1032647) b!1513923))

(assert (= (and b!1513923 (not res!1032646)) b!1513918))

(declare-fun m!1396617 () Bool)

(assert (=> b!1513918 m!1396617))

(assert (=> b!1513918 m!1396617))

(declare-fun m!1396619 () Bool)

(assert (=> b!1513918 m!1396619))

(assert (=> b!1513918 m!1396617))

(declare-fun m!1396621 () Bool)

(assert (=> b!1513918 m!1396621))

(assert (=> b!1513923 m!1396617))

(declare-fun m!1396623 () Bool)

(assert (=> b!1513923 m!1396623))

(declare-fun m!1396625 () Bool)

(assert (=> b!1513923 m!1396625))

(declare-fun m!1396627 () Bool)

(assert (=> b!1513923 m!1396627))

(assert (=> b!1513919 m!1396623))

(assert (=> b!1513919 m!1396625))

(assert (=> b!1513919 m!1396625))

(declare-fun m!1396629 () Bool)

(assert (=> b!1513919 m!1396629))

(assert (=> b!1513919 m!1396629))

(assert (=> b!1513919 m!1396625))

(declare-fun m!1396631 () Bool)

(assert (=> b!1513919 m!1396631))

(declare-fun m!1396633 () Bool)

(assert (=> b!1513924 m!1396633))

(declare-fun m!1396635 () Bool)

(assert (=> b!1513924 m!1396635))

(declare-fun m!1396637 () Bool)

(assert (=> b!1513916 m!1396637))

(assert (=> b!1513913 m!1396617))

(assert (=> b!1513913 m!1396617))

(declare-fun m!1396639 () Bool)

(assert (=> b!1513913 m!1396639))

(declare-fun m!1396641 () Bool)

(assert (=> b!1513914 m!1396641))

(assert (=> b!1513921 m!1396617))

(assert (=> b!1513921 m!1396617))

(declare-fun m!1396643 () Bool)

(assert (=> b!1513921 m!1396643))

(declare-fun m!1396645 () Bool)

(assert (=> b!1513912 m!1396645))

(assert (=> b!1513912 m!1396645))

(declare-fun m!1396647 () Bool)

(assert (=> b!1513912 m!1396647))

(declare-fun m!1396649 () Bool)

(assert (=> start!129272 m!1396649))

(declare-fun m!1396651 () Bool)

(assert (=> start!129272 m!1396651))

(assert (=> b!1513920 m!1396617))

(assert (=> b!1513920 m!1396617))

(declare-fun m!1396653 () Bool)

(assert (=> b!1513920 m!1396653))

(assert (=> b!1513920 m!1396653))

(assert (=> b!1513920 m!1396617))

(declare-fun m!1396655 () Bool)

(assert (=> b!1513920 m!1396655))

(assert (=> b!1513922 m!1396617))

(assert (=> b!1513922 m!1396617))

(declare-fun m!1396657 () Bool)

(assert (=> b!1513922 m!1396657))

(check-sat (not b!1513922) (not b!1513912) (not b!1513916) (not b!1513914) (not b!1513921) (not b!1513913) (not b!1513919) (not b!1513920) (not b!1513924) (not b!1513918) (not start!129272))
(check-sat)
