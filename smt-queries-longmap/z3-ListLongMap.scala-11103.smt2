; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129588 () Bool)

(assert start!129588)

(declare-fun b!1521619 () Bool)

(declare-fun e!848484 () Bool)

(declare-fun e!848482 () Bool)

(assert (=> b!1521619 (= e!848484 e!848482)))

(declare-fun res!1041049 () Bool)

(assert (=> b!1521619 (=> (not res!1041049) (not e!848482))))

(declare-datatypes ((SeekEntryResult!13053 0))(
  ( (MissingZero!13053 (index!54607 (_ BitVec 32))) (Found!13053 (index!54608 (_ BitVec 32))) (Intermediate!13053 (undefined!13865 Bool) (index!54609 (_ BitVec 32)) (x!136299 (_ BitVec 32))) (Undefined!13053) (MissingVacant!13053 (index!54610 (_ BitVec 32))) )
))
(declare-fun lt!659168 () SeekEntryResult!13053)

(declare-fun lt!659169 () SeekEntryResult!13053)

(assert (=> b!1521619 (= res!1041049 (= lt!659168 lt!659169))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521619 (= lt!659169 (Intermediate!13053 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101263 0))(
  ( (array!101264 (arr!48865 (Array (_ BitVec 32) (_ BitVec 64))) (size!49417 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101263)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101263 (_ BitVec 32)) SeekEntryResult!13053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521619 (= lt!659168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48865 a!2804) j!70) mask!2512) (select (arr!48865 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521620 () Bool)

(declare-fun res!1041055 () Bool)

(assert (=> b!1521620 (=> (not res!1041055) (not e!848482))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521620 (= res!1041055 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48865 a!2804) j!70) a!2804 mask!2512) lt!659169))))

(declare-fun b!1521621 () Bool)

(declare-fun res!1041054 () Bool)

(assert (=> b!1521621 (=> (not res!1041054) (not e!848484))))

(declare-datatypes ((List!35426 0))(
  ( (Nil!35423) (Cons!35422 (h!36844 (_ BitVec 64)) (t!50112 List!35426)) )
))
(declare-fun arrayNoDuplicates!0 (array!101263 (_ BitVec 32) List!35426) Bool)

(assert (=> b!1521621 (= res!1041054 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35423))))

(declare-fun b!1521622 () Bool)

(declare-fun res!1041050 () Bool)

(assert (=> b!1521622 (=> (not res!1041050) (not e!848484))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521622 (= res!1041050 (validKeyInArray!0 (select (arr!48865 a!2804) i!961)))))

(declare-fun b!1521623 () Bool)

(declare-fun res!1041048 () Bool)

(assert (=> b!1521623 (=> (not res!1041048) (not e!848484))))

(assert (=> b!1521623 (= res!1041048 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49417 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49417 a!2804))))))

(declare-fun b!1521625 () Bool)

(declare-fun res!1041053 () Bool)

(assert (=> b!1521625 (=> (not res!1041053) (not e!848484))))

(assert (=> b!1521625 (= res!1041053 (and (= (size!49417 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49417 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49417 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521626 () Bool)

(declare-fun res!1041056 () Bool)

(assert (=> b!1521626 (=> (not res!1041056) (not e!848484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101263 (_ BitVec 32)) Bool)

(assert (=> b!1521626 (= res!1041056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521627 () Bool)

(declare-fun res!1041052 () Bool)

(assert (=> b!1521627 (=> (not res!1041052) (not e!848482))))

(assert (=> b!1521627 (= res!1041052 (= lt!659168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48865 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48865 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101264 (store (arr!48865 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49417 a!2804)) mask!2512)))))

(declare-fun b!1521628 () Bool)

(assert (=> b!1521628 (= e!848482 (and (bvsle #b00000000000000000000000000000000 (size!49417 a!2804)) (bvsgt j!70 (size!49417 a!2804))))))

(declare-fun b!1521624 () Bool)

(declare-fun res!1041047 () Bool)

(assert (=> b!1521624 (=> (not res!1041047) (not e!848484))))

(assert (=> b!1521624 (= res!1041047 (validKeyInArray!0 (select (arr!48865 a!2804) j!70)))))

(declare-fun res!1041051 () Bool)

(assert (=> start!129588 (=> (not res!1041051) (not e!848484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129588 (= res!1041051 (validMask!0 mask!2512))))

(assert (=> start!129588 e!848484))

(assert (=> start!129588 true))

(declare-fun array_inv!38098 (array!101263) Bool)

(assert (=> start!129588 (array_inv!38098 a!2804)))

(assert (= (and start!129588 res!1041051) b!1521625))

(assert (= (and b!1521625 res!1041053) b!1521622))

(assert (= (and b!1521622 res!1041050) b!1521624))

(assert (= (and b!1521624 res!1041047) b!1521626))

(assert (= (and b!1521626 res!1041056) b!1521621))

(assert (= (and b!1521621 res!1041054) b!1521623))

(assert (= (and b!1521623 res!1041048) b!1521619))

(assert (= (and b!1521619 res!1041049) b!1521620))

(assert (= (and b!1521620 res!1041055) b!1521627))

(assert (= (and b!1521627 res!1041052) b!1521628))

(declare-fun m!1404171 () Bool)

(assert (=> b!1521624 m!1404171))

(assert (=> b!1521624 m!1404171))

(declare-fun m!1404173 () Bool)

(assert (=> b!1521624 m!1404173))

(declare-fun m!1404175 () Bool)

(assert (=> b!1521626 m!1404175))

(declare-fun m!1404177 () Bool)

(assert (=> b!1521621 m!1404177))

(declare-fun m!1404179 () Bool)

(assert (=> start!129588 m!1404179))

(declare-fun m!1404181 () Bool)

(assert (=> start!129588 m!1404181))

(declare-fun m!1404183 () Bool)

(assert (=> b!1521627 m!1404183))

(declare-fun m!1404185 () Bool)

(assert (=> b!1521627 m!1404185))

(assert (=> b!1521627 m!1404185))

(declare-fun m!1404187 () Bool)

(assert (=> b!1521627 m!1404187))

(assert (=> b!1521627 m!1404187))

(assert (=> b!1521627 m!1404185))

(declare-fun m!1404189 () Bool)

(assert (=> b!1521627 m!1404189))

(assert (=> b!1521619 m!1404171))

(assert (=> b!1521619 m!1404171))

(declare-fun m!1404191 () Bool)

(assert (=> b!1521619 m!1404191))

(assert (=> b!1521619 m!1404191))

(assert (=> b!1521619 m!1404171))

(declare-fun m!1404193 () Bool)

(assert (=> b!1521619 m!1404193))

(declare-fun m!1404195 () Bool)

(assert (=> b!1521622 m!1404195))

(assert (=> b!1521622 m!1404195))

(declare-fun m!1404197 () Bool)

(assert (=> b!1521622 m!1404197))

(assert (=> b!1521620 m!1404171))

(assert (=> b!1521620 m!1404171))

(declare-fun m!1404199 () Bool)

(assert (=> b!1521620 m!1404199))

(check-sat (not b!1521622) (not b!1521619) (not start!129588) (not b!1521624) (not b!1521626) (not b!1521627) (not b!1521621) (not b!1521620))
(check-sat)
