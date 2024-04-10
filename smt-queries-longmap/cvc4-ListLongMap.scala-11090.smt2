; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129566 () Bool)

(assert start!129566)

(declare-fun b!1521014 () Bool)

(declare-fun res!1040242 () Bool)

(declare-fun e!848419 () Bool)

(assert (=> b!1521014 (=> (not res!1040242) (not e!848419))))

(declare-datatypes ((array!101241 0))(
  ( (array!101242 (arr!48853 (Array (_ BitVec 32) (_ BitVec 64))) (size!49403 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101241)

(declare-datatypes ((List!35336 0))(
  ( (Nil!35333) (Cons!35332 (h!36753 (_ BitVec 64)) (t!50030 List!35336)) )
))
(declare-fun arrayNoDuplicates!0 (array!101241 (_ BitVec 32) List!35336) Bool)

(assert (=> b!1521014 (= res!1040242 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35333))))

(declare-fun b!1521015 () Bool)

(declare-fun res!1040240 () Bool)

(assert (=> b!1521015 (=> (not res!1040240) (not e!848419))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101241 (_ BitVec 32)) Bool)

(assert (=> b!1521015 (= res!1040240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521016 () Bool)

(declare-fun res!1040236 () Bool)

(assert (=> b!1521016 (=> (not res!1040236) (not e!848419))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1521016 (= res!1040236 (and (= (size!49403 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49403 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49403 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521017 () Bool)

(declare-fun res!1040239 () Bool)

(assert (=> b!1521017 (=> (not res!1040239) (not e!848419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521017 (= res!1040239 (validKeyInArray!0 (select (arr!48853 a!2804) j!70)))))

(declare-fun res!1040237 () Bool)

(assert (=> start!129566 (=> (not res!1040237) (not e!848419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129566 (= res!1040237 (validMask!0 mask!2512))))

(assert (=> start!129566 e!848419))

(assert (=> start!129566 true))

(declare-fun array_inv!37881 (array!101241) Bool)

(assert (=> start!129566 (array_inv!37881 a!2804)))

(declare-fun b!1521018 () Bool)

(declare-fun res!1040241 () Bool)

(assert (=> b!1521018 (=> (not res!1040241) (not e!848419))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521018 (= res!1040241 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49403 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49403 a!2804))))))

(declare-fun b!1521019 () Bool)

(assert (=> b!1521019 (= e!848419 false)))

(declare-fun lt!659296 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521019 (= lt!659296 (toIndex!0 (select (arr!48853 a!2804) j!70) mask!2512))))

(declare-fun b!1521020 () Bool)

(declare-fun res!1040238 () Bool)

(assert (=> b!1521020 (=> (not res!1040238) (not e!848419))))

(assert (=> b!1521020 (= res!1040238 (validKeyInArray!0 (select (arr!48853 a!2804) i!961)))))

(assert (= (and start!129566 res!1040237) b!1521016))

(assert (= (and b!1521016 res!1040236) b!1521020))

(assert (= (and b!1521020 res!1040238) b!1521017))

(assert (= (and b!1521017 res!1040239) b!1521015))

(assert (= (and b!1521015 res!1040240) b!1521014))

(assert (= (and b!1521014 res!1040242) b!1521018))

(assert (= (and b!1521018 res!1040241) b!1521019))

(declare-fun m!1404143 () Bool)

(assert (=> b!1521015 m!1404143))

(declare-fun m!1404145 () Bool)

(assert (=> b!1521017 m!1404145))

(assert (=> b!1521017 m!1404145))

(declare-fun m!1404147 () Bool)

(assert (=> b!1521017 m!1404147))

(assert (=> b!1521019 m!1404145))

(assert (=> b!1521019 m!1404145))

(declare-fun m!1404149 () Bool)

(assert (=> b!1521019 m!1404149))

(declare-fun m!1404151 () Bool)

(assert (=> b!1521020 m!1404151))

(assert (=> b!1521020 m!1404151))

(declare-fun m!1404153 () Bool)

(assert (=> b!1521020 m!1404153))

(declare-fun m!1404155 () Bool)

(assert (=> b!1521014 m!1404155))

(declare-fun m!1404157 () Bool)

(assert (=> start!129566 m!1404157))

(declare-fun m!1404159 () Bool)

(assert (=> start!129566 m!1404159))

(push 1)

(assert (not b!1521014))

(assert (not start!129566))

(assert (not b!1521017))

(assert (not b!1521015))

(assert (not b!1521019))

(assert (not b!1521020))

(check-sat)

