; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128570 () Bool)

(assert start!128570)

(declare-fun b!1507279 () Bool)

(declare-fun res!1027502 () Bool)

(declare-fun e!842217 () Bool)

(assert (=> b!1507279 (=> (not res!1027502) (not e!842217))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100543 0))(
  ( (array!100544 (arr!48513 (Array (_ BitVec 32) (_ BitVec 64))) (size!49063 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100543)

(assert (=> b!1507279 (= res!1027502 (and (= (size!49063 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49063 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49063 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507281 () Bool)

(declare-fun res!1027504 () Bool)

(assert (=> b!1507281 (=> (not res!1027504) (not e!842217))))

(declare-datatypes ((List!34996 0))(
  ( (Nil!34993) (Cons!34992 (h!36395 (_ BitVec 64)) (t!49690 List!34996)) )
))
(declare-fun arrayNoDuplicates!0 (array!100543 (_ BitVec 32) List!34996) Bool)

(assert (=> b!1507281 (= res!1027504 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34993))))

(declare-fun b!1507282 () Bool)

(declare-fun res!1027503 () Bool)

(assert (=> b!1507282 (=> (not res!1027503) (not e!842217))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507282 (= res!1027503 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49063 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49063 a!2804))))))

(declare-fun b!1507283 () Bool)

(declare-fun res!1027501 () Bool)

(assert (=> b!1507283 (=> (not res!1027501) (not e!842217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507283 (= res!1027501 (validKeyInArray!0 (select (arr!48513 a!2804) j!70)))))

(declare-fun b!1507284 () Bool)

(assert (=> b!1507284 (= e!842217 false)))

(declare-datatypes ((SeekEntryResult!12684 0))(
  ( (MissingZero!12684 (index!53131 (_ BitVec 32))) (Found!12684 (index!53132 (_ BitVec 32))) (Intermediate!12684 (undefined!13496 Bool) (index!53133 (_ BitVec 32)) (x!134888 (_ BitVec 32))) (Undefined!12684) (MissingVacant!12684 (index!53134 (_ BitVec 32))) )
))
(declare-fun lt!654370 () SeekEntryResult!12684)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100543 (_ BitVec 32)) SeekEntryResult!12684)

(assert (=> b!1507284 (= lt!654370 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48513 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507285 () Bool)

(declare-fun res!1027500 () Bool)

(assert (=> b!1507285 (=> (not res!1027500) (not e!842217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100543 (_ BitVec 32)) Bool)

(assert (=> b!1507285 (= res!1027500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507286 () Bool)

(declare-fun res!1027497 () Bool)

(assert (=> b!1507286 (=> (not res!1027497) (not e!842217))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507286 (= res!1027497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48513 a!2804) j!70) mask!2512) (select (arr!48513 a!2804) j!70) a!2804 mask!2512) (Intermediate!12684 false resIndex!21 resX!21)))))

(declare-fun res!1027498 () Bool)

(assert (=> start!128570 (=> (not res!1027498) (not e!842217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128570 (= res!1027498 (validMask!0 mask!2512))))

(assert (=> start!128570 e!842217))

(assert (=> start!128570 true))

(declare-fun array_inv!37541 (array!100543) Bool)

(assert (=> start!128570 (array_inv!37541 a!2804)))

(declare-fun b!1507280 () Bool)

(declare-fun res!1027499 () Bool)

(assert (=> b!1507280 (=> (not res!1027499) (not e!842217))))

(assert (=> b!1507280 (= res!1027499 (validKeyInArray!0 (select (arr!48513 a!2804) i!961)))))

(assert (= (and start!128570 res!1027498) b!1507279))

(assert (= (and b!1507279 res!1027502) b!1507280))

(assert (= (and b!1507280 res!1027499) b!1507283))

(assert (= (and b!1507283 res!1027501) b!1507285))

(assert (= (and b!1507285 res!1027500) b!1507281))

(assert (= (and b!1507281 res!1027504) b!1507282))

(assert (= (and b!1507282 res!1027503) b!1507286))

(assert (= (and b!1507286 res!1027497) b!1507284))

(declare-fun m!1390049 () Bool)

(assert (=> b!1507280 m!1390049))

(assert (=> b!1507280 m!1390049))

(declare-fun m!1390051 () Bool)

(assert (=> b!1507280 m!1390051))

(declare-fun m!1390053 () Bool)

(assert (=> b!1507285 m!1390053))

(declare-fun m!1390055 () Bool)

(assert (=> b!1507281 m!1390055))

(declare-fun m!1390057 () Bool)

(assert (=> b!1507284 m!1390057))

(assert (=> b!1507284 m!1390057))

(declare-fun m!1390059 () Bool)

(assert (=> b!1507284 m!1390059))

(declare-fun m!1390061 () Bool)

(assert (=> start!128570 m!1390061))

(declare-fun m!1390063 () Bool)

(assert (=> start!128570 m!1390063))

(assert (=> b!1507283 m!1390057))

(assert (=> b!1507283 m!1390057))

(declare-fun m!1390065 () Bool)

(assert (=> b!1507283 m!1390065))

(assert (=> b!1507286 m!1390057))

(assert (=> b!1507286 m!1390057))

(declare-fun m!1390067 () Bool)

(assert (=> b!1507286 m!1390067))

(assert (=> b!1507286 m!1390067))

(assert (=> b!1507286 m!1390057))

(declare-fun m!1390069 () Bool)

(assert (=> b!1507286 m!1390069))

(check-sat (not b!1507285) (not b!1507284) (not b!1507281) (not start!128570) (not b!1507286) (not b!1507283) (not b!1507280))
