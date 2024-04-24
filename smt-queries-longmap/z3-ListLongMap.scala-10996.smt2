; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129110 () Bool)

(assert start!129110)

(declare-fun b!1511170 () Bool)

(declare-fun res!1029902 () Bool)

(declare-fun e!844205 () Bool)

(assert (=> b!1511170 (=> (not res!1029902) (not e!844205))))

(declare-datatypes ((array!100780 0))(
  ( (array!100781 (arr!48622 (Array (_ BitVec 32) (_ BitVec 64))) (size!49173 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100780)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511170 (= res!1029902 (validKeyInArray!0 (select (arr!48622 a!2804) i!961)))))

(declare-fun res!1029905 () Bool)

(assert (=> start!129110 (=> (not res!1029905) (not e!844205))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129110 (= res!1029905 (validMask!0 mask!2512))))

(assert (=> start!129110 e!844205))

(assert (=> start!129110 true))

(declare-fun array_inv!37903 (array!100780) Bool)

(assert (=> start!129110 (array_inv!37903 a!2804)))

(declare-fun b!1511171 () Bool)

(declare-fun res!1029897 () Bool)

(declare-fun e!844206 () Bool)

(assert (=> b!1511171 (=> (not res!1029897) (not e!844206))))

(declare-datatypes ((SeekEntryResult!12686 0))(
  ( (MissingZero!12686 (index!53139 (_ BitVec 32))) (Found!12686 (index!53140 (_ BitVec 32))) (Intermediate!12686 (undefined!13498 Bool) (index!53141 (_ BitVec 32)) (x!135097 (_ BitVec 32))) (Undefined!12686) (MissingVacant!12686 (index!53142 (_ BitVec 32))) )
))
(declare-fun lt!655527 () SeekEntryResult!12686)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12686)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511171 (= res!1029897 (= lt!655527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100781 (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49173 a!2804)) mask!2512)))))

(declare-fun b!1511172 () Bool)

(assert (=> b!1511172 (= e!844205 e!844206)))

(declare-fun res!1029904 () Bool)

(assert (=> b!1511172 (=> (not res!1029904) (not e!844206))))

(declare-fun lt!655526 () SeekEntryResult!12686)

(assert (=> b!1511172 (= res!1029904 (= lt!655527 lt!655526))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511172 (= lt!655526 (Intermediate!12686 false resIndex!21 resX!21))))

(assert (=> b!1511172 (= lt!655527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48622 a!2804) j!70) mask!2512) (select (arr!48622 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511173 () Bool)

(declare-fun res!1029900 () Bool)

(assert (=> b!1511173 (=> (not res!1029900) (not e!844205))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511173 (= res!1029900 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49173 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49173 a!2804))))))

(declare-fun b!1511174 () Bool)

(declare-fun res!1029901 () Bool)

(assert (=> b!1511174 (=> (not res!1029901) (not e!844205))))

(declare-datatypes ((List!35092 0))(
  ( (Nil!35089) (Cons!35088 (h!36515 (_ BitVec 64)) (t!49778 List!35092)) )
))
(declare-fun arrayNoDuplicates!0 (array!100780 (_ BitVec 32) List!35092) Bool)

(assert (=> b!1511174 (= res!1029901 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35089))))

(declare-fun b!1511175 () Bool)

(declare-fun res!1029899 () Bool)

(assert (=> b!1511175 (=> (not res!1029899) (not e!844205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100780 (_ BitVec 32)) Bool)

(assert (=> b!1511175 (= res!1029899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511176 () Bool)

(assert (=> b!1511176 (= e!844206 (not true))))

(assert (=> b!1511176 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50275 0))(
  ( (Unit!50276) )
))
(declare-fun lt!655528 () Unit!50275)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50275)

(assert (=> b!1511176 (= lt!655528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511177 () Bool)

(declare-fun res!1029896 () Bool)

(assert (=> b!1511177 (=> (not res!1029896) (not e!844205))))

(assert (=> b!1511177 (= res!1029896 (and (= (size!49173 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49173 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49173 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511178 () Bool)

(declare-fun res!1029898 () Bool)

(assert (=> b!1511178 (=> (not res!1029898) (not e!844205))))

(assert (=> b!1511178 (= res!1029898 (validKeyInArray!0 (select (arr!48622 a!2804) j!70)))))

(declare-fun b!1511179 () Bool)

(declare-fun res!1029903 () Bool)

(assert (=> b!1511179 (=> (not res!1029903) (not e!844206))))

(assert (=> b!1511179 (= res!1029903 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48622 a!2804) j!70) a!2804 mask!2512) lt!655526))))

(assert (= (and start!129110 res!1029905) b!1511177))

(assert (= (and b!1511177 res!1029896) b!1511170))

(assert (= (and b!1511170 res!1029902) b!1511178))

(assert (= (and b!1511178 res!1029898) b!1511175))

(assert (= (and b!1511175 res!1029899) b!1511174))

(assert (= (and b!1511174 res!1029901) b!1511173))

(assert (= (and b!1511173 res!1029900) b!1511172))

(assert (= (and b!1511172 res!1029904) b!1511179))

(assert (= (and b!1511179 res!1029903) b!1511171))

(assert (= (and b!1511171 res!1029897) b!1511176))

(declare-fun m!1393599 () Bool)

(assert (=> b!1511175 m!1393599))

(declare-fun m!1393601 () Bool)

(assert (=> b!1511174 m!1393601))

(declare-fun m!1393603 () Bool)

(assert (=> b!1511171 m!1393603))

(declare-fun m!1393605 () Bool)

(assert (=> b!1511171 m!1393605))

(assert (=> b!1511171 m!1393605))

(declare-fun m!1393607 () Bool)

(assert (=> b!1511171 m!1393607))

(assert (=> b!1511171 m!1393607))

(assert (=> b!1511171 m!1393605))

(declare-fun m!1393609 () Bool)

(assert (=> b!1511171 m!1393609))

(declare-fun m!1393611 () Bool)

(assert (=> b!1511179 m!1393611))

(assert (=> b!1511179 m!1393611))

(declare-fun m!1393613 () Bool)

(assert (=> b!1511179 m!1393613))

(assert (=> b!1511172 m!1393611))

(assert (=> b!1511172 m!1393611))

(declare-fun m!1393615 () Bool)

(assert (=> b!1511172 m!1393615))

(assert (=> b!1511172 m!1393615))

(assert (=> b!1511172 m!1393611))

(declare-fun m!1393617 () Bool)

(assert (=> b!1511172 m!1393617))

(declare-fun m!1393619 () Bool)

(assert (=> b!1511170 m!1393619))

(assert (=> b!1511170 m!1393619))

(declare-fun m!1393621 () Bool)

(assert (=> b!1511170 m!1393621))

(declare-fun m!1393623 () Bool)

(assert (=> start!129110 m!1393623))

(declare-fun m!1393625 () Bool)

(assert (=> start!129110 m!1393625))

(declare-fun m!1393627 () Bool)

(assert (=> b!1511176 m!1393627))

(declare-fun m!1393629 () Bool)

(assert (=> b!1511176 m!1393629))

(assert (=> b!1511178 m!1393611))

(assert (=> b!1511178 m!1393611))

(declare-fun m!1393631 () Bool)

(assert (=> b!1511178 m!1393631))

(check-sat (not b!1511176) (not b!1511171) (not b!1511170) (not b!1511178) (not b!1511179) (not b!1511175) (not start!129110) (not b!1511174) (not b!1511172))
(check-sat)
