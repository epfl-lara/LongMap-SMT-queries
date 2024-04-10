; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129208 () Bool)

(assert start!129208)

(declare-fun res!1036723 () Bool)

(declare-fun e!846326 () Bool)

(assert (=> start!129208 (=> (not res!1036723) (not e!846326))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129208 (= res!1036723 (validMask!0 mask!2512))))

(assert (=> start!129208 e!846326))

(assert (=> start!129208 true))

(declare-datatypes ((array!101064 0))(
  ( (array!101065 (arr!48769 (Array (_ BitVec 32) (_ BitVec 64))) (size!49319 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101064)

(declare-fun array_inv!37797 (array!101064) Bool)

(assert (=> start!129208 (array_inv!37797 a!2804)))

(declare-fun b!1516811 () Bool)

(declare-fun res!1036722 () Bool)

(declare-fun e!846325 () Bool)

(assert (=> b!1516811 (=> (not res!1036722) (not e!846325))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12940 0))(
  ( (MissingZero!12940 (index!54155 (_ BitVec 32))) (Found!12940 (index!54156 (_ BitVec 32))) (Intermediate!12940 (undefined!13752 Bool) (index!54157 (_ BitVec 32)) (x!135842 (_ BitVec 32))) (Undefined!12940) (MissingVacant!12940 (index!54158 (_ BitVec 32))) )
))
(declare-fun lt!657543 () SeekEntryResult!12940)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101064 (_ BitVec 32)) SeekEntryResult!12940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516811 (= res!1036722 (= lt!657543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101065 (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49319 a!2804)) mask!2512)))))

(declare-fun b!1516812 () Bool)

(declare-fun e!846327 () Bool)

(assert (=> b!1516812 (= e!846325 (not e!846327))))

(declare-fun res!1036718 () Bool)

(assert (=> b!1516812 (=> res!1036718 e!846327)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516812 (= res!1036718 (or (not (= (select (arr!48769 a!2804) j!70) (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846324 () Bool)

(assert (=> b!1516812 e!846324))

(declare-fun res!1036721 () Bool)

(assert (=> b!1516812 (=> (not res!1036721) (not e!846324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101064 (_ BitVec 32)) Bool)

(assert (=> b!1516812 (= res!1036721 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50748 0))(
  ( (Unit!50749) )
))
(declare-fun lt!657546 () Unit!50748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50748)

(assert (=> b!1516812 (= lt!657546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516813 () Bool)

(declare-fun e!846328 () Bool)

(assert (=> b!1516813 (= e!846327 e!846328)))

(declare-fun res!1036724 () Bool)

(assert (=> b!1516813 (=> res!1036724 e!846328)))

(declare-fun lt!657547 () (_ BitVec 32))

(assert (=> b!1516813 (= res!1036724 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657547 #b00000000000000000000000000000000) (bvsge lt!657547 (size!49319 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516813 (= lt!657547 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516814 () Bool)

(declare-fun res!1036719 () Bool)

(assert (=> b!1516814 (=> (not res!1036719) (not e!846326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516814 (= res!1036719 (validKeyInArray!0 (select (arr!48769 a!2804) j!70)))))

(declare-fun b!1516815 () Bool)

(declare-fun res!1036725 () Bool)

(assert (=> b!1516815 (=> (not res!1036725) (not e!846326))))

(declare-datatypes ((List!35252 0))(
  ( (Nil!35249) (Cons!35248 (h!36660 (_ BitVec 64)) (t!49946 List!35252)) )
))
(declare-fun arrayNoDuplicates!0 (array!101064 (_ BitVec 32) List!35252) Bool)

(assert (=> b!1516815 (= res!1036725 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35249))))

(declare-fun b!1516816 () Bool)

(assert (=> b!1516816 (= e!846328 true)))

(declare-fun lt!657545 () SeekEntryResult!12940)

(assert (=> b!1516816 (= lt!657545 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657547 (select (arr!48769 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516817 () Bool)

(assert (=> b!1516817 (= e!846326 e!846325)))

(declare-fun res!1036726 () Bool)

(assert (=> b!1516817 (=> (not res!1036726) (not e!846325))))

(declare-fun lt!657544 () SeekEntryResult!12940)

(assert (=> b!1516817 (= res!1036726 (= lt!657543 lt!657544))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516817 (= lt!657544 (Intermediate!12940 false resIndex!21 resX!21))))

(assert (=> b!1516817 (= lt!657543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48769 a!2804) j!70) mask!2512) (select (arr!48769 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516818 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101064 (_ BitVec 32)) SeekEntryResult!12940)

(assert (=> b!1516818 (= e!846324 (= (seekEntry!0 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) (Found!12940 j!70)))))

(declare-fun b!1516819 () Bool)

(declare-fun res!1036714 () Bool)

(assert (=> b!1516819 (=> (not res!1036714) (not e!846326))))

(assert (=> b!1516819 (= res!1036714 (and (= (size!49319 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49319 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49319 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516820 () Bool)

(declare-fun res!1036717 () Bool)

(assert (=> b!1516820 (=> (not res!1036717) (not e!846325))))

(assert (=> b!1516820 (= res!1036717 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) lt!657544))))

(declare-fun b!1516821 () Bool)

(declare-fun res!1036715 () Bool)

(assert (=> b!1516821 (=> (not res!1036715) (not e!846326))))

(assert (=> b!1516821 (= res!1036715 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49319 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49319 a!2804))))))

(declare-fun b!1516822 () Bool)

(declare-fun res!1036716 () Bool)

(assert (=> b!1516822 (=> (not res!1036716) (not e!846326))))

(assert (=> b!1516822 (= res!1036716 (validKeyInArray!0 (select (arr!48769 a!2804) i!961)))))

(declare-fun b!1516823 () Bool)

(declare-fun res!1036720 () Bool)

(assert (=> b!1516823 (=> (not res!1036720) (not e!846326))))

(assert (=> b!1516823 (= res!1036720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129208 res!1036723) b!1516819))

(assert (= (and b!1516819 res!1036714) b!1516822))

(assert (= (and b!1516822 res!1036716) b!1516814))

(assert (= (and b!1516814 res!1036719) b!1516823))

(assert (= (and b!1516823 res!1036720) b!1516815))

(assert (= (and b!1516815 res!1036725) b!1516821))

(assert (= (and b!1516821 res!1036715) b!1516817))

(assert (= (and b!1516817 res!1036726) b!1516820))

(assert (= (and b!1516820 res!1036717) b!1516811))

(assert (= (and b!1516811 res!1036722) b!1516812))

(assert (= (and b!1516812 res!1036721) b!1516818))

(assert (= (and b!1516812 (not res!1036718)) b!1516813))

(assert (= (and b!1516813 (not res!1036724)) b!1516816))

(declare-fun m!1400085 () Bool)

(assert (=> b!1516815 m!1400085))

(declare-fun m!1400087 () Bool)

(assert (=> b!1516823 m!1400087))

(declare-fun m!1400089 () Bool)

(assert (=> b!1516814 m!1400089))

(assert (=> b!1516814 m!1400089))

(declare-fun m!1400091 () Bool)

(assert (=> b!1516814 m!1400091))

(assert (=> b!1516818 m!1400089))

(assert (=> b!1516818 m!1400089))

(declare-fun m!1400093 () Bool)

(assert (=> b!1516818 m!1400093))

(assert (=> b!1516812 m!1400089))

(declare-fun m!1400095 () Bool)

(assert (=> b!1516812 m!1400095))

(declare-fun m!1400097 () Bool)

(assert (=> b!1516812 m!1400097))

(declare-fun m!1400099 () Bool)

(assert (=> b!1516812 m!1400099))

(declare-fun m!1400101 () Bool)

(assert (=> b!1516812 m!1400101))

(assert (=> b!1516816 m!1400089))

(assert (=> b!1516816 m!1400089))

(declare-fun m!1400103 () Bool)

(assert (=> b!1516816 m!1400103))

(assert (=> b!1516811 m!1400097))

(assert (=> b!1516811 m!1400099))

(assert (=> b!1516811 m!1400099))

(declare-fun m!1400105 () Bool)

(assert (=> b!1516811 m!1400105))

(assert (=> b!1516811 m!1400105))

(assert (=> b!1516811 m!1400099))

(declare-fun m!1400107 () Bool)

(assert (=> b!1516811 m!1400107))

(assert (=> b!1516817 m!1400089))

(assert (=> b!1516817 m!1400089))

(declare-fun m!1400109 () Bool)

(assert (=> b!1516817 m!1400109))

(assert (=> b!1516817 m!1400109))

(assert (=> b!1516817 m!1400089))

(declare-fun m!1400111 () Bool)

(assert (=> b!1516817 m!1400111))

(declare-fun m!1400113 () Bool)

(assert (=> b!1516822 m!1400113))

(assert (=> b!1516822 m!1400113))

(declare-fun m!1400115 () Bool)

(assert (=> b!1516822 m!1400115))

(declare-fun m!1400117 () Bool)

(assert (=> start!129208 m!1400117))

(declare-fun m!1400119 () Bool)

(assert (=> start!129208 m!1400119))

(assert (=> b!1516820 m!1400089))

(assert (=> b!1516820 m!1400089))

(declare-fun m!1400121 () Bool)

(assert (=> b!1516820 m!1400121))

(declare-fun m!1400123 () Bool)

(assert (=> b!1516813 m!1400123))

(push 1)

(assert (not b!1516818))

