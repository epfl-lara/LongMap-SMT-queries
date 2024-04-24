; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129182 () Bool)

(assert start!129182)

(declare-fun b!1512342 () Bool)

(declare-fun res!1031075 () Bool)

(declare-fun e!844620 () Bool)

(assert (=> b!1512342 (=> (not res!1031075) (not e!844620))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100852 0))(
  ( (array!100853 (arr!48658 (Array (_ BitVec 32) (_ BitVec 64))) (size!49209 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100852)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512342 (= res!1031075 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49209 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49209 a!2804))))))

(declare-fun b!1512343 () Bool)

(declare-fun res!1031070 () Bool)

(assert (=> b!1512343 (=> (not res!1031070) (not e!844620))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1512343 (= res!1031070 (and (= (size!49209 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49209 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49209 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512344 () Bool)

(declare-fun e!844622 () Bool)

(assert (=> b!1512344 (= e!844622 (not (or (not (= (select (arr!48658 a!2804) j!70) (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48658 a!2804) index!487) (select (arr!48658 a!2804) j!70)) (not (= (select (arr!48658 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!844623 () Bool)

(assert (=> b!1512344 e!844623))

(declare-fun res!1031073 () Bool)

(assert (=> b!1512344 (=> (not res!1031073) (not e!844623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100852 (_ BitVec 32)) Bool)

(assert (=> b!1512344 (= res!1031073 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50347 0))(
  ( (Unit!50348) )
))
(declare-fun lt!655851 () Unit!50347)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50347)

(assert (=> b!1512344 (= lt!655851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512345 () Bool)

(declare-fun res!1031072 () Bool)

(assert (=> b!1512345 (=> (not res!1031072) (not e!844620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512345 (= res!1031072 (validKeyInArray!0 (select (arr!48658 a!2804) i!961)))))

(declare-fun b!1512346 () Bool)

(declare-fun res!1031071 () Bool)

(assert (=> b!1512346 (=> (not res!1031071) (not e!844622))))

(declare-datatypes ((SeekEntryResult!12722 0))(
  ( (MissingZero!12722 (index!53283 (_ BitVec 32))) (Found!12722 (index!53284 (_ BitVec 32))) (Intermediate!12722 (undefined!13534 Bool) (index!53285 (_ BitVec 32)) (x!135229 (_ BitVec 32))) (Undefined!12722) (MissingVacant!12722 (index!53286 (_ BitVec 32))) )
))
(declare-fun lt!655850 () SeekEntryResult!12722)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512346 (= res!1031071 (= lt!655850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100853 (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49209 a!2804)) mask!2512)))))

(declare-fun b!1512347 () Bool)

(declare-fun res!1031074 () Bool)

(assert (=> b!1512347 (=> (not res!1031074) (not e!844622))))

(declare-fun lt!655852 () SeekEntryResult!12722)

(assert (=> b!1512347 (= res!1031074 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) lt!655852))))

(declare-fun res!1031068 () Bool)

(assert (=> start!129182 (=> (not res!1031068) (not e!844620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129182 (= res!1031068 (validMask!0 mask!2512))))

(assert (=> start!129182 e!844620))

(assert (=> start!129182 true))

(declare-fun array_inv!37939 (array!100852) Bool)

(assert (=> start!129182 (array_inv!37939 a!2804)))

(declare-fun b!1512348 () Bool)

(declare-fun res!1031078 () Bool)

(assert (=> b!1512348 (=> (not res!1031078) (not e!844620))))

(assert (=> b!1512348 (= res!1031078 (validKeyInArray!0 (select (arr!48658 a!2804) j!70)))))

(declare-fun b!1512349 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12722)

(assert (=> b!1512349 (= e!844623 (= (seekEntry!0 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) (Found!12722 j!70)))))

(declare-fun b!1512350 () Bool)

(assert (=> b!1512350 (= e!844620 e!844622)))

(declare-fun res!1031069 () Bool)

(assert (=> b!1512350 (=> (not res!1031069) (not e!844622))))

(assert (=> b!1512350 (= res!1031069 (= lt!655850 lt!655852))))

(assert (=> b!1512350 (= lt!655852 (Intermediate!12722 false resIndex!21 resX!21))))

(assert (=> b!1512350 (= lt!655850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48658 a!2804) j!70) mask!2512) (select (arr!48658 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512351 () Bool)

(declare-fun res!1031076 () Bool)

(assert (=> b!1512351 (=> (not res!1031076) (not e!844620))))

(assert (=> b!1512351 (= res!1031076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512352 () Bool)

(declare-fun res!1031077 () Bool)

(assert (=> b!1512352 (=> (not res!1031077) (not e!844620))))

(declare-datatypes ((List!35128 0))(
  ( (Nil!35125) (Cons!35124 (h!36551 (_ BitVec 64)) (t!49814 List!35128)) )
))
(declare-fun arrayNoDuplicates!0 (array!100852 (_ BitVec 32) List!35128) Bool)

(assert (=> b!1512352 (= res!1031077 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35125))))

(assert (= (and start!129182 res!1031068) b!1512343))

(assert (= (and b!1512343 res!1031070) b!1512345))

(assert (= (and b!1512345 res!1031072) b!1512348))

(assert (= (and b!1512348 res!1031078) b!1512351))

(assert (= (and b!1512351 res!1031076) b!1512352))

(assert (= (and b!1512352 res!1031077) b!1512342))

(assert (= (and b!1512342 res!1031075) b!1512350))

(assert (= (and b!1512350 res!1031069) b!1512347))

(assert (= (and b!1512347 res!1031074) b!1512346))

(assert (= (and b!1512346 res!1031071) b!1512344))

(assert (= (and b!1512344 res!1031073) b!1512349))

(declare-fun m!1394901 () Bool)

(assert (=> b!1512347 m!1394901))

(assert (=> b!1512347 m!1394901))

(declare-fun m!1394903 () Bool)

(assert (=> b!1512347 m!1394903))

(assert (=> b!1512348 m!1394901))

(assert (=> b!1512348 m!1394901))

(declare-fun m!1394905 () Bool)

(assert (=> b!1512348 m!1394905))

(declare-fun m!1394907 () Bool)

(assert (=> b!1512345 m!1394907))

(assert (=> b!1512345 m!1394907))

(declare-fun m!1394909 () Bool)

(assert (=> b!1512345 m!1394909))

(assert (=> b!1512344 m!1394901))

(declare-fun m!1394911 () Bool)

(assert (=> b!1512344 m!1394911))

(declare-fun m!1394913 () Bool)

(assert (=> b!1512344 m!1394913))

(declare-fun m!1394915 () Bool)

(assert (=> b!1512344 m!1394915))

(declare-fun m!1394917 () Bool)

(assert (=> b!1512344 m!1394917))

(declare-fun m!1394919 () Bool)

(assert (=> b!1512344 m!1394919))

(assert (=> b!1512349 m!1394901))

(assert (=> b!1512349 m!1394901))

(declare-fun m!1394921 () Bool)

(assert (=> b!1512349 m!1394921))

(assert (=> b!1512350 m!1394901))

(assert (=> b!1512350 m!1394901))

(declare-fun m!1394923 () Bool)

(assert (=> b!1512350 m!1394923))

(assert (=> b!1512350 m!1394923))

(assert (=> b!1512350 m!1394901))

(declare-fun m!1394925 () Bool)

(assert (=> b!1512350 m!1394925))

(declare-fun m!1394927 () Bool)

(assert (=> b!1512351 m!1394927))

(declare-fun m!1394929 () Bool)

(assert (=> b!1512352 m!1394929))

(declare-fun m!1394931 () Bool)

(assert (=> start!129182 m!1394931))

(declare-fun m!1394933 () Bool)

(assert (=> start!129182 m!1394933))

(assert (=> b!1512346 m!1394913))

(assert (=> b!1512346 m!1394917))

(assert (=> b!1512346 m!1394917))

(declare-fun m!1394935 () Bool)

(assert (=> b!1512346 m!1394935))

(assert (=> b!1512346 m!1394935))

(assert (=> b!1512346 m!1394917))

(declare-fun m!1394937 () Bool)

(assert (=> b!1512346 m!1394937))

(check-sat (not b!1512350) (not b!1512347) (not b!1512352) (not start!129182) (not b!1512348) (not b!1512344) (not b!1512351) (not b!1512346) (not b!1512345) (not b!1512349))
(check-sat)
