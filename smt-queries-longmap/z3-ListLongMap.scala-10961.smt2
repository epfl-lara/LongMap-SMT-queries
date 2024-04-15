; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128312 () Bool)

(assert start!128312)

(declare-fun b!1505516 () Bool)

(declare-fun res!1026117 () Bool)

(declare-fun e!841443 () Bool)

(assert (=> b!1505516 (=> (not res!1026117) (not e!841443))))

(declare-datatypes ((array!100384 0))(
  ( (array!100385 (arr!48439 (Array (_ BitVec 32) (_ BitVec 64))) (size!48991 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100384)

(declare-datatypes ((List!35000 0))(
  ( (Nil!34997) (Cons!34996 (h!36394 (_ BitVec 64)) (t!49686 List!35000)) )
))
(declare-fun arrayNoDuplicates!0 (array!100384 (_ BitVec 32) List!35000) Bool)

(assert (=> b!1505516 (= res!1026117 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34997))))

(declare-fun b!1505517 () Bool)

(declare-fun res!1026114 () Bool)

(assert (=> b!1505517 (=> (not res!1026114) (not e!841443))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100384 (_ BitVec 32)) Bool)

(assert (=> b!1505517 (= res!1026114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026115 () Bool)

(assert (=> start!128312 (=> (not res!1026115) (not e!841443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128312 (= res!1026115 (validMask!0 mask!2512))))

(assert (=> start!128312 e!841443))

(assert (=> start!128312 true))

(declare-fun array_inv!37672 (array!100384) Bool)

(assert (=> start!128312 (array_inv!37672 a!2804)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1505518 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505518 (= e!841443 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!48991 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!48991 a!2804)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun b!1505519 () Bool)

(declare-fun res!1026118 () Bool)

(assert (=> b!1505519 (=> (not res!1026118) (not e!841443))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505519 (= res!1026118 (validKeyInArray!0 (select (arr!48439 a!2804) i!961)))))

(declare-fun b!1505520 () Bool)

(declare-fun res!1026119 () Bool)

(assert (=> b!1505520 (=> (not res!1026119) (not e!841443))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505520 (= res!1026119 (validKeyInArray!0 (select (arr!48439 a!2804) j!70)))))

(declare-fun b!1505521 () Bool)

(declare-fun res!1026116 () Bool)

(assert (=> b!1505521 (=> (not res!1026116) (not e!841443))))

(assert (=> b!1505521 (= res!1026116 (and (= (size!48991 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48991 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48991 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128312 res!1026115) b!1505521))

(assert (= (and b!1505521 res!1026116) b!1505519))

(assert (= (and b!1505519 res!1026118) b!1505520))

(assert (= (and b!1505520 res!1026119) b!1505517))

(assert (= (and b!1505517 res!1026114) b!1505516))

(assert (= (and b!1505516 res!1026117) b!1505518))

(declare-fun m!1388015 () Bool)

(assert (=> b!1505516 m!1388015))

(declare-fun m!1388017 () Bool)

(assert (=> b!1505519 m!1388017))

(assert (=> b!1505519 m!1388017))

(declare-fun m!1388019 () Bool)

(assert (=> b!1505519 m!1388019))

(declare-fun m!1388021 () Bool)

(assert (=> b!1505517 m!1388021))

(declare-fun m!1388023 () Bool)

(assert (=> b!1505520 m!1388023))

(assert (=> b!1505520 m!1388023))

(declare-fun m!1388025 () Bool)

(assert (=> b!1505520 m!1388025))

(declare-fun m!1388027 () Bool)

(assert (=> start!128312 m!1388027))

(declare-fun m!1388029 () Bool)

(assert (=> start!128312 m!1388029))

(check-sat (not b!1505517) (not start!128312) (not b!1505519) (not b!1505520) (not b!1505516))
(check-sat)
