; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130210 () Bool)

(assert start!130210)

(declare-fun b!1528313 () Bool)

(declare-fun res!1046032 () Bool)

(declare-fun e!851814 () Bool)

(assert (=> b!1528313 (=> (not res!1046032) (not e!851814))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101560 0))(
  ( (array!101561 (arr!49005 (Array (_ BitVec 32) (_ BitVec 64))) (size!49555 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101560)

(declare-datatypes ((SeekEntryResult!13170 0))(
  ( (MissingZero!13170 (index!55075 (_ BitVec 32))) (Found!13170 (index!55076 (_ BitVec 32))) (Intermediate!13170 (undefined!13982 Bool) (index!55077 (_ BitVec 32)) (x!136769 (_ BitVec 32))) (Undefined!13170) (MissingVacant!13170 (index!55078 (_ BitVec 32))) )
))
(declare-fun lt!661891 () SeekEntryResult!13170)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101560 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528313 (= res!1046032 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49005 a!2804) j!70) a!2804 mask!2512) lt!661891))))

(declare-fun b!1528314 () Bool)

(declare-fun res!1046031 () Bool)

(declare-fun e!851813 () Bool)

(assert (=> b!1528314 (=> (not res!1046031) (not e!851813))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528314 (= res!1046031 (and (= (size!49555 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49555 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49555 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528315 () Bool)

(assert (=> b!1528315 (= e!851813 e!851814)))

(declare-fun res!1046021 () Bool)

(assert (=> b!1528315 (=> (not res!1046021) (not e!851814))))

(declare-fun lt!661884 () SeekEntryResult!13170)

(assert (=> b!1528315 (= res!1046021 (= lt!661884 lt!661891))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528315 (= lt!661891 (Intermediate!13170 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528315 (= lt!661884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49005 a!2804) j!70) mask!2512) (select (arr!49005 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528316 () Bool)

(declare-fun e!851816 () Bool)

(declare-fun e!851817 () Bool)

(assert (=> b!1528316 (= e!851816 e!851817)))

(declare-fun res!1046028 () Bool)

(assert (=> b!1528316 (=> res!1046028 e!851817)))

(declare-fun lt!661887 () SeekEntryResult!13170)

(assert (=> b!1528316 (= res!1046028 (not (= lt!661887 (Found!13170 j!70))))))

(declare-fun lt!661888 () SeekEntryResult!13170)

(declare-fun lt!661885 () SeekEntryResult!13170)

(assert (=> b!1528316 (= lt!661888 lt!661885)))

(declare-fun lt!661889 () (_ BitVec 64))

(declare-fun lt!661890 () array!101560)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101560 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528316 (= lt!661885 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661889 lt!661890 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101560 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528316 (= lt!661888 (seekEntryOrOpen!0 lt!661889 lt!661890 mask!2512))))

(declare-fun lt!661882 () SeekEntryResult!13170)

(assert (=> b!1528316 (= lt!661882 lt!661887)))

(assert (=> b!1528316 (= lt!661887 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49005 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528316 (= lt!661882 (seekEntryOrOpen!0 (select (arr!49005 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528317 () Bool)

(declare-fun e!851818 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101560 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528317 (= e!851818 (= (seekEntry!0 (select (arr!49005 a!2804) j!70) a!2804 mask!2512) (Found!13170 j!70)))))

(declare-fun b!1528318 () Bool)

(declare-fun res!1046020 () Bool)

(assert (=> b!1528318 (=> (not res!1046020) (not e!851813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528318 (= res!1046020 (validKeyInArray!0 (select (arr!49005 a!2804) j!70)))))

(declare-fun res!1046025 () Bool)

(assert (=> start!130210 (=> (not res!1046025) (not e!851813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130210 (= res!1046025 (validMask!0 mask!2512))))

(assert (=> start!130210 e!851813))

(assert (=> start!130210 true))

(declare-fun array_inv!38033 (array!101560) Bool)

(assert (=> start!130210 (array_inv!38033 a!2804)))

(declare-fun b!1528319 () Bool)

(declare-fun res!1046023 () Bool)

(assert (=> b!1528319 (=> (not res!1046023) (not e!851813))))

(assert (=> b!1528319 (= res!1046023 (validKeyInArray!0 (select (arr!49005 a!2804) i!961)))))

(declare-fun b!1528320 () Bool)

(declare-fun res!1046022 () Bool)

(assert (=> b!1528320 (=> (not res!1046022) (not e!851813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101560 (_ BitVec 32)) Bool)

(assert (=> b!1528320 (= res!1046022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528321 () Bool)

(declare-fun res!1046029 () Bool)

(assert (=> b!1528321 (=> (not res!1046029) (not e!851813))))

(declare-datatypes ((List!35488 0))(
  ( (Nil!35485) (Cons!35484 (h!36920 (_ BitVec 64)) (t!50182 List!35488)) )
))
(declare-fun arrayNoDuplicates!0 (array!101560 (_ BitVec 32) List!35488) Bool)

(assert (=> b!1528321 (= res!1046029 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35485))))

(declare-fun b!1528322 () Bool)

(declare-fun res!1046026 () Bool)

(assert (=> b!1528322 (=> (not res!1046026) (not e!851813))))

(assert (=> b!1528322 (= res!1046026 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49555 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49555 a!2804))))))

(declare-fun b!1528323 () Bool)

(declare-fun e!851815 () Bool)

(assert (=> b!1528323 (= e!851815 (not e!851816))))

(declare-fun res!1046024 () Bool)

(assert (=> b!1528323 (=> res!1046024 e!851816)))

(assert (=> b!1528323 (= res!1046024 (or (not (= (select (arr!49005 a!2804) j!70) lt!661889)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49005 a!2804) index!487) (select (arr!49005 a!2804) j!70)) (not (= (select (arr!49005 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528323 e!851818))

(declare-fun res!1046027 () Bool)

(assert (=> b!1528323 (=> (not res!1046027) (not e!851818))))

(assert (=> b!1528323 (= res!1046027 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51124 0))(
  ( (Unit!51125) )
))
(declare-fun lt!661883 () Unit!51124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51124)

(assert (=> b!1528323 (= lt!661883 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528324 () Bool)

(assert (=> b!1528324 (= e!851817 true)))

(assert (=> b!1528324 (= lt!661885 lt!661887)))

(declare-fun lt!661886 () Unit!51124)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51124)

(assert (=> b!1528324 (= lt!661886 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528325 () Bool)

(assert (=> b!1528325 (= e!851814 e!851815)))

(declare-fun res!1046030 () Bool)

(assert (=> b!1528325 (=> (not res!1046030) (not e!851815))))

(assert (=> b!1528325 (= res!1046030 (= lt!661884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661889 mask!2512) lt!661889 lt!661890 mask!2512)))))

(assert (=> b!1528325 (= lt!661889 (select (store (arr!49005 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528325 (= lt!661890 (array!101561 (store (arr!49005 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49555 a!2804)))))

(assert (= (and start!130210 res!1046025) b!1528314))

(assert (= (and b!1528314 res!1046031) b!1528319))

(assert (= (and b!1528319 res!1046023) b!1528318))

(assert (= (and b!1528318 res!1046020) b!1528320))

(assert (= (and b!1528320 res!1046022) b!1528321))

(assert (= (and b!1528321 res!1046029) b!1528322))

(assert (= (and b!1528322 res!1046026) b!1528315))

(assert (= (and b!1528315 res!1046021) b!1528313))

(assert (= (and b!1528313 res!1046032) b!1528325))

(assert (= (and b!1528325 res!1046030) b!1528323))

(assert (= (and b!1528323 res!1046027) b!1528317))

(assert (= (and b!1528323 (not res!1046024)) b!1528316))

(assert (= (and b!1528316 (not res!1046028)) b!1528324))

(declare-fun m!1411119 () Bool)

(assert (=> b!1528325 m!1411119))

(assert (=> b!1528325 m!1411119))

(declare-fun m!1411121 () Bool)

(assert (=> b!1528325 m!1411121))

(declare-fun m!1411123 () Bool)

(assert (=> b!1528325 m!1411123))

(declare-fun m!1411125 () Bool)

(assert (=> b!1528325 m!1411125))

(declare-fun m!1411127 () Bool)

(assert (=> start!130210 m!1411127))

(declare-fun m!1411129 () Bool)

(assert (=> start!130210 m!1411129))

(declare-fun m!1411131 () Bool)

(assert (=> b!1528319 m!1411131))

(assert (=> b!1528319 m!1411131))

(declare-fun m!1411133 () Bool)

(assert (=> b!1528319 m!1411133))

(declare-fun m!1411135 () Bool)

(assert (=> b!1528318 m!1411135))

(assert (=> b!1528318 m!1411135))

(declare-fun m!1411137 () Bool)

(assert (=> b!1528318 m!1411137))

(assert (=> b!1528317 m!1411135))

(assert (=> b!1528317 m!1411135))

(declare-fun m!1411139 () Bool)

(assert (=> b!1528317 m!1411139))

(assert (=> b!1528313 m!1411135))

(assert (=> b!1528313 m!1411135))

(declare-fun m!1411141 () Bool)

(assert (=> b!1528313 m!1411141))

(declare-fun m!1411143 () Bool)

(assert (=> b!1528321 m!1411143))

(assert (=> b!1528323 m!1411135))

(declare-fun m!1411145 () Bool)

(assert (=> b!1528323 m!1411145))

(declare-fun m!1411147 () Bool)

(assert (=> b!1528323 m!1411147))

(declare-fun m!1411149 () Bool)

(assert (=> b!1528323 m!1411149))

(declare-fun m!1411151 () Bool)

(assert (=> b!1528320 m!1411151))

(assert (=> b!1528315 m!1411135))

(assert (=> b!1528315 m!1411135))

(declare-fun m!1411153 () Bool)

(assert (=> b!1528315 m!1411153))

(assert (=> b!1528315 m!1411153))

(assert (=> b!1528315 m!1411135))

(declare-fun m!1411155 () Bool)

(assert (=> b!1528315 m!1411155))

(assert (=> b!1528316 m!1411135))

(declare-fun m!1411157 () Bool)

(assert (=> b!1528316 m!1411157))

(assert (=> b!1528316 m!1411135))

(declare-fun m!1411159 () Bool)

(assert (=> b!1528316 m!1411159))

(assert (=> b!1528316 m!1411135))

(declare-fun m!1411161 () Bool)

(assert (=> b!1528316 m!1411161))

(declare-fun m!1411163 () Bool)

(assert (=> b!1528316 m!1411163))

(declare-fun m!1411165 () Bool)

(assert (=> b!1528324 m!1411165))

(check-sat (not b!1528324) (not b!1528313) (not b!1528316) (not b!1528315) (not b!1528317) (not b!1528325) (not b!1528323) (not start!130210) (not b!1528318) (not b!1528320) (not b!1528319) (not b!1528321))
(check-sat)
