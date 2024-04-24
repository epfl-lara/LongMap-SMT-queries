; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129470 () Bool)

(assert start!129470)

(declare-fun res!1036640 () Bool)

(declare-fun e!847149 () Bool)

(assert (=> start!129470 (=> (not res!1036640) (not e!847149))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129470 (= res!1036640 (validMask!0 mask!2512))))

(assert (=> start!129470 e!847149))

(assert (=> start!129470 true))

(declare-datatypes ((array!101140 0))(
  ( (array!101141 (arr!48802 (Array (_ BitVec 32) (_ BitVec 64))) (size!49353 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101140)

(declare-fun array_inv!38083 (array!101140) Bool)

(assert (=> start!129470 (array_inv!38083 a!2804)))

(declare-fun b!1517913 () Bool)

(declare-fun res!1036647 () Bool)

(assert (=> b!1517913 (=> (not res!1036647) (not e!847149))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517913 (= res!1036647 (validKeyInArray!0 (select (arr!48802 a!2804) i!961)))))

(declare-fun b!1517914 () Bool)

(declare-fun res!1036648 () Bool)

(assert (=> b!1517914 (=> (not res!1036648) (not e!847149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101140 (_ BitVec 32)) Bool)

(assert (=> b!1517914 (= res!1036648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517915 () Bool)

(declare-fun res!1036646 () Bool)

(assert (=> b!1517915 (=> (not res!1036646) (not e!847149))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517915 (= res!1036646 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49353 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49353 a!2804))))))

(declare-fun b!1517916 () Bool)

(declare-fun res!1036645 () Bool)

(declare-fun e!847152 () Bool)

(assert (=> b!1517916 (=> (not res!1036645) (not e!847152))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12866 0))(
  ( (MissingZero!12866 (index!53859 (_ BitVec 32))) (Found!12866 (index!53860 (_ BitVec 32))) (Intermediate!12866 (undefined!13678 Bool) (index!53861 (_ BitVec 32)) (x!135757 (_ BitVec 32))) (Undefined!12866) (MissingVacant!12866 (index!53862 (_ BitVec 32))) )
))
(declare-fun lt!657958 () SeekEntryResult!12866)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!12866)

(assert (=> b!1517916 (= res!1036645 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) lt!657958))))

(declare-fun b!1517917 () Bool)

(declare-fun res!1036644 () Bool)

(assert (=> b!1517917 (=> (not res!1036644) (not e!847149))))

(assert (=> b!1517917 (= res!1036644 (validKeyInArray!0 (select (arr!48802 a!2804) j!70)))))

(declare-fun b!1517918 () Bool)

(assert (=> b!1517918 (= e!847149 e!847152)))

(declare-fun res!1036639 () Bool)

(assert (=> b!1517918 (=> (not res!1036639) (not e!847152))))

(declare-fun lt!657957 () SeekEntryResult!12866)

(assert (=> b!1517918 (= res!1036639 (= lt!657957 lt!657958))))

(assert (=> b!1517918 (= lt!657958 (Intermediate!12866 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517918 (= lt!657957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48802 a!2804) j!70) mask!2512) (select (arr!48802 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517919 () Bool)

(declare-fun res!1036649 () Bool)

(assert (=> b!1517919 (=> (not res!1036649) (not e!847149))))

(declare-datatypes ((List!35272 0))(
  ( (Nil!35269) (Cons!35268 (h!36695 (_ BitVec 64)) (t!49958 List!35272)) )
))
(declare-fun arrayNoDuplicates!0 (array!101140 (_ BitVec 32) List!35272) Bool)

(assert (=> b!1517919 (= res!1036649 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35269))))

(declare-fun b!1517920 () Bool)

(declare-fun res!1036642 () Bool)

(assert (=> b!1517920 (=> (not res!1036642) (not e!847152))))

(assert (=> b!1517920 (= res!1036642 (= lt!657957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101141 (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49353 a!2804)) mask!2512)))))

(declare-fun b!1517921 () Bool)

(assert (=> b!1517921 (= e!847152 (not (or (not (= (select (arr!48802 a!2804) j!70) (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!847150 () Bool)

(assert (=> b!1517921 e!847150))

(declare-fun res!1036641 () Bool)

(assert (=> b!1517921 (=> (not res!1036641) (not e!847150))))

(assert (=> b!1517921 (= res!1036641 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50635 0))(
  ( (Unit!50636) )
))
(declare-fun lt!657956 () Unit!50635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50635)

(assert (=> b!1517921 (= lt!657956 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517922 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!12866)

(assert (=> b!1517922 (= e!847150 (= (seekEntry!0 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) (Found!12866 j!70)))))

(declare-fun b!1517923 () Bool)

(declare-fun res!1036643 () Bool)

(assert (=> b!1517923 (=> (not res!1036643) (not e!847149))))

(assert (=> b!1517923 (= res!1036643 (and (= (size!49353 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49353 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49353 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129470 res!1036640) b!1517923))

(assert (= (and b!1517923 res!1036643) b!1517913))

(assert (= (and b!1517913 res!1036647) b!1517917))

(assert (= (and b!1517917 res!1036644) b!1517914))

(assert (= (and b!1517914 res!1036648) b!1517919))

(assert (= (and b!1517919 res!1036649) b!1517915))

(assert (= (and b!1517915 res!1036646) b!1517918))

(assert (= (and b!1517918 res!1036639) b!1517916))

(assert (= (and b!1517916 res!1036645) b!1517920))

(assert (= (and b!1517920 res!1036642) b!1517921))

(assert (= (and b!1517921 res!1036641) b!1517922))

(declare-fun m!1401117 () Bool)

(assert (=> b!1517918 m!1401117))

(assert (=> b!1517918 m!1401117))

(declare-fun m!1401119 () Bool)

(assert (=> b!1517918 m!1401119))

(assert (=> b!1517918 m!1401119))

(assert (=> b!1517918 m!1401117))

(declare-fun m!1401121 () Bool)

(assert (=> b!1517918 m!1401121))

(assert (=> b!1517916 m!1401117))

(assert (=> b!1517916 m!1401117))

(declare-fun m!1401123 () Bool)

(assert (=> b!1517916 m!1401123))

(assert (=> b!1517922 m!1401117))

(assert (=> b!1517922 m!1401117))

(declare-fun m!1401125 () Bool)

(assert (=> b!1517922 m!1401125))

(declare-fun m!1401127 () Bool)

(assert (=> b!1517919 m!1401127))

(assert (=> b!1517917 m!1401117))

(assert (=> b!1517917 m!1401117))

(declare-fun m!1401129 () Bool)

(assert (=> b!1517917 m!1401129))

(declare-fun m!1401131 () Bool)

(assert (=> b!1517920 m!1401131))

(declare-fun m!1401133 () Bool)

(assert (=> b!1517920 m!1401133))

(assert (=> b!1517920 m!1401133))

(declare-fun m!1401135 () Bool)

(assert (=> b!1517920 m!1401135))

(assert (=> b!1517920 m!1401135))

(assert (=> b!1517920 m!1401133))

(declare-fun m!1401137 () Bool)

(assert (=> b!1517920 m!1401137))

(declare-fun m!1401139 () Bool)

(assert (=> b!1517914 m!1401139))

(declare-fun m!1401141 () Bool)

(assert (=> b!1517913 m!1401141))

(assert (=> b!1517913 m!1401141))

(declare-fun m!1401143 () Bool)

(assert (=> b!1517913 m!1401143))

(declare-fun m!1401145 () Bool)

(assert (=> start!129470 m!1401145))

(declare-fun m!1401147 () Bool)

(assert (=> start!129470 m!1401147))

(assert (=> b!1517921 m!1401117))

(declare-fun m!1401149 () Bool)

(assert (=> b!1517921 m!1401149))

(assert (=> b!1517921 m!1401131))

(assert (=> b!1517921 m!1401133))

(declare-fun m!1401151 () Bool)

(assert (=> b!1517921 m!1401151))

(check-sat (not b!1517914) (not b!1517916) (not b!1517921) (not b!1517917) (not b!1517913) (not b!1517922) (not b!1517920) (not b!1517918) (not b!1517919) (not start!129470))
(check-sat)
