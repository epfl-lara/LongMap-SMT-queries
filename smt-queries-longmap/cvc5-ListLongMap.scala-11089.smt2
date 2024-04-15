; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129508 () Bool)

(assert start!129508)

(declare-fun b!1520613 () Bool)

(declare-fun res!1040043 () Bool)

(declare-fun e!848187 () Bool)

(assert (=> b!1520613 (=> (not res!1040043) (not e!848187))))

(declare-datatypes ((array!101183 0))(
  ( (array!101184 (arr!48825 (Array (_ BitVec 32) (_ BitVec 64))) (size!49377 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101183)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520613 (= res!1040043 (validKeyInArray!0 (select (arr!48825 a!2804) i!961)))))

(declare-fun b!1520614 () Bool)

(declare-fun res!1040041 () Bool)

(assert (=> b!1520614 (=> (not res!1040041) (not e!848187))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101183 (_ BitVec 32)) Bool)

(assert (=> b!1520614 (= res!1040041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520615 () Bool)

(declare-fun res!1040042 () Bool)

(assert (=> b!1520615 (=> (not res!1040042) (not e!848187))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1520615 (= res!1040042 (and (= (size!49377 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49377 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49377 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520616 () Bool)

(assert (=> b!1520616 (= e!848187 false)))

(declare-fun lt!658992 () Bool)

(declare-datatypes ((List!35386 0))(
  ( (Nil!35383) (Cons!35382 (h!36804 (_ BitVec 64)) (t!50072 List!35386)) )
))
(declare-fun arrayNoDuplicates!0 (array!101183 (_ BitVec 32) List!35386) Bool)

(assert (=> b!1520616 (= lt!658992 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35383))))

(declare-fun b!1520617 () Bool)

(declare-fun res!1040045 () Bool)

(assert (=> b!1520617 (=> (not res!1040045) (not e!848187))))

(assert (=> b!1520617 (= res!1040045 (validKeyInArray!0 (select (arr!48825 a!2804) j!70)))))

(declare-fun res!1040044 () Bool)

(assert (=> start!129508 (=> (not res!1040044) (not e!848187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129508 (= res!1040044 (validMask!0 mask!2512))))

(assert (=> start!129508 e!848187))

(assert (=> start!129508 true))

(declare-fun array_inv!38058 (array!101183) Bool)

(assert (=> start!129508 (array_inv!38058 a!2804)))

(assert (= (and start!129508 res!1040044) b!1520615))

(assert (= (and b!1520615 res!1040042) b!1520613))

(assert (= (and b!1520613 res!1040043) b!1520617))

(assert (= (and b!1520617 res!1040045) b!1520614))

(assert (= (and b!1520614 res!1040041) b!1520616))

(declare-fun m!1403183 () Bool)

(assert (=> b!1520613 m!1403183))

(assert (=> b!1520613 m!1403183))

(declare-fun m!1403185 () Bool)

(assert (=> b!1520613 m!1403185))

(declare-fun m!1403187 () Bool)

(assert (=> start!129508 m!1403187))

(declare-fun m!1403189 () Bool)

(assert (=> start!129508 m!1403189))

(declare-fun m!1403191 () Bool)

(assert (=> b!1520616 m!1403191))

(declare-fun m!1403193 () Bool)

(assert (=> b!1520617 m!1403193))

(assert (=> b!1520617 m!1403193))

(declare-fun m!1403195 () Bool)

(assert (=> b!1520617 m!1403195))

(declare-fun m!1403197 () Bool)

(assert (=> b!1520614 m!1403197))

(push 1)

(assert (not b!1520613))

(assert (not b!1520617))

(assert (not b!1520614))

(assert (not b!1520616))

(assert (not start!129508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

