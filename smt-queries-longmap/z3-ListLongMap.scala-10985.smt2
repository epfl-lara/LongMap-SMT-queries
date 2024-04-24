; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129002 () Bool)

(assert start!129002)

(declare-fun b!1510079 () Bool)

(declare-fun res!1028913 () Bool)

(declare-fun e!843775 () Bool)

(assert (=> b!1510079 (=> (not res!1028913) (not e!843775))))

(declare-datatypes ((array!100711 0))(
  ( (array!100712 (arr!48589 (Array (_ BitVec 32) (_ BitVec 64))) (size!49140 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100711)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510079 (= res!1028913 (validKeyInArray!0 (select (arr!48589 a!2804) i!961)))))

(declare-fun res!1028911 () Bool)

(assert (=> start!129002 (=> (not res!1028911) (not e!843775))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129002 (= res!1028911 (validMask!0 mask!2512))))

(assert (=> start!129002 e!843775))

(assert (=> start!129002 true))

(declare-fun array_inv!37870 (array!100711) Bool)

(assert (=> start!129002 (array_inv!37870 a!2804)))

(declare-fun b!1510080 () Bool)

(declare-fun res!1028917 () Bool)

(assert (=> b!1510080 (=> (not res!1028917) (not e!843775))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1510080 (= res!1028917 (validKeyInArray!0 (select (arr!48589 a!2804) j!70)))))

(declare-fun b!1510081 () Bool)

(declare-fun res!1028914 () Bool)

(assert (=> b!1510081 (=> (not res!1028914) (not e!843775))))

(assert (=> b!1510081 (= res!1028914 (and (= (size!49140 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49140 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49140 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510082 () Bool)

(declare-fun res!1028916 () Bool)

(declare-fun e!843776 () Bool)

(assert (=> b!1510082 (=> (not res!1028916) (not e!843776))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12653 0))(
  ( (MissingZero!12653 (index!53007 (_ BitVec 32))) (Found!12653 (index!53008 (_ BitVec 32))) (Intermediate!12653 (undefined!13465 Bool) (index!53009 (_ BitVec 32)) (x!134970 (_ BitVec 32))) (Undefined!12653) (MissingVacant!12653 (index!53010 (_ BitVec 32))) )
))
(declare-fun lt!655251 () SeekEntryResult!12653)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100711 (_ BitVec 32)) SeekEntryResult!12653)

(assert (=> b!1510082 (= res!1028916 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48589 a!2804) j!70) a!2804 mask!2512) lt!655251))))

(declare-fun b!1510083 () Bool)

(assert (=> b!1510083 (= e!843776 false)))

(declare-fun lt!655252 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510083 (= lt!655252 (toIndex!0 (select (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1510084 () Bool)

(declare-fun res!1028915 () Bool)

(assert (=> b!1510084 (=> (not res!1028915) (not e!843775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100711 (_ BitVec 32)) Bool)

(assert (=> b!1510084 (= res!1028915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510085 () Bool)

(assert (=> b!1510085 (= e!843775 e!843776)))

(declare-fun res!1028910 () Bool)

(assert (=> b!1510085 (=> (not res!1028910) (not e!843776))))

(assert (=> b!1510085 (= res!1028910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48589 a!2804) j!70) mask!2512) (select (arr!48589 a!2804) j!70) a!2804 mask!2512) lt!655251))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510085 (= lt!655251 (Intermediate!12653 false resIndex!21 resX!21))))

(declare-fun b!1510086 () Bool)

(declare-fun res!1028912 () Bool)

(assert (=> b!1510086 (=> (not res!1028912) (not e!843775))))

(assert (=> b!1510086 (= res!1028912 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49140 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49140 a!2804))))))

(declare-fun b!1510087 () Bool)

(declare-fun res!1028918 () Bool)

(assert (=> b!1510087 (=> (not res!1028918) (not e!843775))))

(declare-datatypes ((List!35059 0))(
  ( (Nil!35056) (Cons!35055 (h!36479 (_ BitVec 64)) (t!49745 List!35059)) )
))
(declare-fun arrayNoDuplicates!0 (array!100711 (_ BitVec 32) List!35059) Bool)

(assert (=> b!1510087 (= res!1028918 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35056))))

(assert (= (and start!129002 res!1028911) b!1510081))

(assert (= (and b!1510081 res!1028914) b!1510079))

(assert (= (and b!1510079 res!1028913) b!1510080))

(assert (= (and b!1510080 res!1028917) b!1510084))

(assert (= (and b!1510084 res!1028915) b!1510087))

(assert (= (and b!1510087 res!1028918) b!1510086))

(assert (= (and b!1510086 res!1028912) b!1510085))

(assert (= (and b!1510085 res!1028910) b!1510082))

(assert (= (and b!1510082 res!1028916) b!1510083))

(declare-fun m!1392543 () Bool)

(assert (=> b!1510082 m!1392543))

(assert (=> b!1510082 m!1392543))

(declare-fun m!1392545 () Bool)

(assert (=> b!1510082 m!1392545))

(declare-fun m!1392547 () Bool)

(assert (=> b!1510084 m!1392547))

(declare-fun m!1392549 () Bool)

(assert (=> start!129002 m!1392549))

(declare-fun m!1392551 () Bool)

(assert (=> start!129002 m!1392551))

(assert (=> b!1510080 m!1392543))

(assert (=> b!1510080 m!1392543))

(declare-fun m!1392553 () Bool)

(assert (=> b!1510080 m!1392553))

(declare-fun m!1392555 () Bool)

(assert (=> b!1510079 m!1392555))

(assert (=> b!1510079 m!1392555))

(declare-fun m!1392557 () Bool)

(assert (=> b!1510079 m!1392557))

(declare-fun m!1392559 () Bool)

(assert (=> b!1510087 m!1392559))

(declare-fun m!1392561 () Bool)

(assert (=> b!1510083 m!1392561))

(declare-fun m!1392563 () Bool)

(assert (=> b!1510083 m!1392563))

(assert (=> b!1510083 m!1392563))

(declare-fun m!1392565 () Bool)

(assert (=> b!1510083 m!1392565))

(assert (=> b!1510085 m!1392543))

(assert (=> b!1510085 m!1392543))

(declare-fun m!1392567 () Bool)

(assert (=> b!1510085 m!1392567))

(assert (=> b!1510085 m!1392567))

(assert (=> b!1510085 m!1392543))

(declare-fun m!1392569 () Bool)

(assert (=> b!1510085 m!1392569))

(check-sat (not b!1510087) (not start!129002) (not b!1510080) (not b!1510085) (not b!1510084) (not b!1510083) (not b!1510082) (not b!1510079))
(check-sat)
