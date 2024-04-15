; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129738 () Bool)

(assert start!129738)

(declare-fun b!1523166 () Bool)

(declare-fun res!1042263 () Bool)

(declare-fun e!849156 () Bool)

(assert (=> b!1523166 (=> (not res!1042263) (not e!849156))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101332 0))(
  ( (array!101333 (arr!48898 (Array (_ BitVec 32) (_ BitVec 64))) (size!49450 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101332)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13086 0))(
  ( (MissingZero!13086 (index!54739 (_ BitVec 32))) (Found!13086 (index!54740 (_ BitVec 32))) (Intermediate!13086 (undefined!13898 Bool) (index!54741 (_ BitVec 32)) (x!136431 (_ BitVec 32))) (Undefined!13086) (MissingVacant!13086 (index!54742 (_ BitVec 32))) )
))
(declare-fun lt!659677 () SeekEntryResult!13086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101332 (_ BitVec 32)) SeekEntryResult!13086)

(assert (=> b!1523166 (= res!1042263 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) lt!659677))))

(declare-fun b!1523167 () Bool)

(declare-fun res!1042257 () Bool)

(declare-fun e!849155 () Bool)

(assert (=> b!1523167 (=> (not res!1042257) (not e!849155))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523167 (= res!1042257 (and (= (size!49450 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49450 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49450 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1042261 () Bool)

(assert (=> start!129738 (=> (not res!1042261) (not e!849155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129738 (= res!1042261 (validMask!0 mask!2512))))

(assert (=> start!129738 e!849155))

(assert (=> start!129738 true))

(declare-fun array_inv!38131 (array!101332) Bool)

(assert (=> start!129738 (array_inv!38131 a!2804)))

(declare-fun b!1523168 () Bool)

(declare-fun res!1042267 () Bool)

(assert (=> b!1523168 (=> (not res!1042267) (not e!849155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523168 (= res!1042267 (validKeyInArray!0 (select (arr!48898 a!2804) i!961)))))

(declare-fun b!1523169 () Bool)

(declare-fun res!1042260 () Bool)

(assert (=> b!1523169 (=> (not res!1042260) (not e!849155))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523169 (= res!1042260 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49450 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49450 a!2804))))))

(declare-fun b!1523170 () Bool)

(declare-fun res!1042265 () Bool)

(assert (=> b!1523170 (=> (not res!1042265) (not e!849155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101332 (_ BitVec 32)) Bool)

(assert (=> b!1523170 (= res!1042265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523171 () Bool)

(declare-fun res!1042262 () Bool)

(assert (=> b!1523171 (=> (not res!1042262) (not e!849156))))

(declare-fun lt!659678 () SeekEntryResult!13086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523171 (= res!1042262 (= lt!659678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101333 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)) mask!2512)))))

(declare-fun b!1523172 () Bool)

(declare-fun res!1042264 () Bool)

(assert (=> b!1523172 (=> (not res!1042264) (not e!849155))))

(assert (=> b!1523172 (= res!1042264 (validKeyInArray!0 (select (arr!48898 a!2804) j!70)))))

(declare-fun b!1523173 () Bool)

(declare-fun res!1042259 () Bool)

(assert (=> b!1523173 (=> (not res!1042259) (not e!849155))))

(declare-datatypes ((List!35459 0))(
  ( (Nil!35456) (Cons!35455 (h!36880 (_ BitVec 64)) (t!50145 List!35459)) )
))
(declare-fun arrayNoDuplicates!0 (array!101332 (_ BitVec 32) List!35459) Bool)

(assert (=> b!1523173 (= res!1042259 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35456))))

(declare-fun b!1523174 () Bool)

(declare-fun e!849157 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101332 (_ BitVec 32)) SeekEntryResult!13086)

(assert (=> b!1523174 (= e!849157 (= (seekEntry!0 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) (Found!13086 j!70)))))

(declare-fun b!1523175 () Bool)

(assert (=> b!1523175 (= e!849155 e!849156)))

(declare-fun res!1042266 () Bool)

(assert (=> b!1523175 (=> (not res!1042266) (not e!849156))))

(assert (=> b!1523175 (= res!1042266 (= lt!659678 lt!659677))))

(assert (=> b!1523175 (= lt!659677 (Intermediate!13086 false resIndex!21 resX!21))))

(assert (=> b!1523175 (= lt!659678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523176 () Bool)

(assert (=> b!1523176 (= e!849156 (not true))))

(assert (=> b!1523176 e!849157))

(declare-fun res!1042258 () Bool)

(assert (=> b!1523176 (=> (not res!1042258) (not e!849157))))

(assert (=> b!1523176 (= res!1042258 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50795 0))(
  ( (Unit!50796) )
))
(declare-fun lt!659679 () Unit!50795)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50795)

(assert (=> b!1523176 (= lt!659679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129738 res!1042261) b!1523167))

(assert (= (and b!1523167 res!1042257) b!1523168))

(assert (= (and b!1523168 res!1042267) b!1523172))

(assert (= (and b!1523172 res!1042264) b!1523170))

(assert (= (and b!1523170 res!1042265) b!1523173))

(assert (= (and b!1523173 res!1042259) b!1523169))

(assert (= (and b!1523169 res!1042260) b!1523175))

(assert (= (and b!1523175 res!1042266) b!1523166))

(assert (= (and b!1523166 res!1042263) b!1523171))

(assert (= (and b!1523171 res!1042262) b!1523176))

(assert (= (and b!1523176 res!1042258) b!1523174))

(declare-fun m!1405709 () Bool)

(assert (=> b!1523171 m!1405709))

(declare-fun m!1405711 () Bool)

(assert (=> b!1523171 m!1405711))

(assert (=> b!1523171 m!1405711))

(declare-fun m!1405713 () Bool)

(assert (=> b!1523171 m!1405713))

(assert (=> b!1523171 m!1405713))

(assert (=> b!1523171 m!1405711))

(declare-fun m!1405715 () Bool)

(assert (=> b!1523171 m!1405715))

(declare-fun m!1405717 () Bool)

(assert (=> b!1523166 m!1405717))

(assert (=> b!1523166 m!1405717))

(declare-fun m!1405719 () Bool)

(assert (=> b!1523166 m!1405719))

(assert (=> b!1523175 m!1405717))

(assert (=> b!1523175 m!1405717))

(declare-fun m!1405721 () Bool)

(assert (=> b!1523175 m!1405721))

(assert (=> b!1523175 m!1405721))

(assert (=> b!1523175 m!1405717))

(declare-fun m!1405723 () Bool)

(assert (=> b!1523175 m!1405723))

(assert (=> b!1523172 m!1405717))

(assert (=> b!1523172 m!1405717))

(declare-fun m!1405725 () Bool)

(assert (=> b!1523172 m!1405725))

(declare-fun m!1405727 () Bool)

(assert (=> start!129738 m!1405727))

(declare-fun m!1405729 () Bool)

(assert (=> start!129738 m!1405729))

(declare-fun m!1405731 () Bool)

(assert (=> b!1523173 m!1405731))

(declare-fun m!1405733 () Bool)

(assert (=> b!1523168 m!1405733))

(assert (=> b!1523168 m!1405733))

(declare-fun m!1405735 () Bool)

(assert (=> b!1523168 m!1405735))

(declare-fun m!1405737 () Bool)

(assert (=> b!1523176 m!1405737))

(declare-fun m!1405739 () Bool)

(assert (=> b!1523176 m!1405739))

(declare-fun m!1405741 () Bool)

(assert (=> b!1523170 m!1405741))

(assert (=> b!1523174 m!1405717))

(assert (=> b!1523174 m!1405717))

(declare-fun m!1405743 () Bool)

(assert (=> b!1523174 m!1405743))

(check-sat (not b!1523168) (not b!1523173) (not b!1523166) (not start!129738) (not b!1523176) (not b!1523170) (not b!1523175) (not b!1523172) (not b!1523171) (not b!1523174))
(check-sat)
