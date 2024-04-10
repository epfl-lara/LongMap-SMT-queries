; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129046 () Bool)

(assert start!129046)

(declare-fun b!1513615 () Bool)

(declare-fun e!844762 () Bool)

(declare-fun e!844756 () Bool)

(assert (=> b!1513615 (= e!844762 e!844756)))

(declare-fun res!1033523 () Bool)

(assert (=> b!1513615 (=> (not res!1033523) (not e!844756))))

(declare-datatypes ((SeekEntryResult!12859 0))(
  ( (MissingZero!12859 (index!53831 (_ BitVec 32))) (Found!12859 (index!53832 (_ BitVec 32))) (Intermediate!12859 (undefined!13671 Bool) (index!53833 (_ BitVec 32)) (x!135545 (_ BitVec 32))) (Undefined!12859) (MissingVacant!12859 (index!53834 (_ BitVec 32))) )
))
(declare-fun lt!656041 () SeekEntryResult!12859)

(declare-fun lt!656040 () SeekEntryResult!12859)

(assert (=> b!1513615 (= res!1033523 (= lt!656041 lt!656040))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513615 (= lt!656040 (Intermediate!12859 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100902 0))(
  ( (array!100903 (arr!48688 (Array (_ BitVec 32) (_ BitVec 64))) (size!49238 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100902)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100902 (_ BitVec 32)) SeekEntryResult!12859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513615 (= lt!656041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48688 a!2804) j!70) mask!2512) (select (arr!48688 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513616 () Bool)

(declare-fun res!1033531 () Bool)

(assert (=> b!1513616 (=> (not res!1033531) (not e!844762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513616 (= res!1033531 (validKeyInArray!0 (select (arr!48688 a!2804) j!70)))))

(declare-fun b!1513617 () Bool)

(declare-fun e!844758 () Bool)

(assert (=> b!1513617 (= e!844758 (not true))))

(declare-fun e!844759 () Bool)

(assert (=> b!1513617 e!844759))

(declare-fun res!1033518 () Bool)

(assert (=> b!1513617 (=> (not res!1033518) (not e!844759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100902 (_ BitVec 32)) Bool)

(assert (=> b!1513617 (= res!1033518 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50586 0))(
  ( (Unit!50587) )
))
(declare-fun lt!656044 () Unit!50586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50586)

(assert (=> b!1513617 (= lt!656044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513618 () Bool)

(declare-fun res!1033520 () Bool)

(assert (=> b!1513618 (=> (not res!1033520) (not e!844762))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513618 (= res!1033520 (validKeyInArray!0 (select (arr!48688 a!2804) i!961)))))

(declare-fun b!1513619 () Bool)

(declare-fun res!1033524 () Bool)

(assert (=> b!1513619 (=> (not res!1033524) (not e!844759))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100902 (_ BitVec 32)) SeekEntryResult!12859)

(assert (=> b!1513619 (= res!1033524 (= (seekEntry!0 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) (Found!12859 j!70)))))

(declare-fun res!1033525 () Bool)

(assert (=> start!129046 (=> (not res!1033525) (not e!844762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129046 (= res!1033525 (validMask!0 mask!2512))))

(assert (=> start!129046 e!844762))

(assert (=> start!129046 true))

(declare-fun array_inv!37716 (array!100902) Bool)

(assert (=> start!129046 (array_inv!37716 a!2804)))

(declare-fun b!1513620 () Bool)

(declare-fun res!1033527 () Bool)

(assert (=> b!1513620 (=> (not res!1033527) (not e!844756))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1513620 (= res!1033527 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) lt!656040))))

(declare-fun b!1513621 () Bool)

(declare-fun res!1033528 () Bool)

(assert (=> b!1513621 (=> (not res!1033528) (not e!844762))))

(assert (=> b!1513621 (= res!1033528 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49238 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49238 a!2804))))))

(declare-fun b!1513622 () Bool)

(declare-fun res!1033529 () Bool)

(assert (=> b!1513622 (=> (not res!1033529) (not e!844762))))

(declare-datatypes ((List!35171 0))(
  ( (Nil!35168) (Cons!35167 (h!36579 (_ BitVec 64)) (t!49865 List!35171)) )
))
(declare-fun arrayNoDuplicates!0 (array!100902 (_ BitVec 32) List!35171) Bool)

(assert (=> b!1513622 (= res!1033529 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35168))))

(declare-fun b!1513623 () Bool)

(declare-fun res!1033530 () Bool)

(assert (=> b!1513623 (=> (not res!1033530) (not e!844762))))

(assert (=> b!1513623 (= res!1033530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun lt!656042 () (_ BitVec 64))

(declare-fun b!1513624 () Bool)

(declare-fun lt!656043 () array!100902)

(declare-fun e!844757 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100902 (_ BitVec 32)) SeekEntryResult!12859)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100902 (_ BitVec 32)) SeekEntryResult!12859)

(assert (=> b!1513624 (= e!844757 (= (seekEntryOrOpen!0 lt!656042 lt!656043 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656042 lt!656043 mask!2512)))))

(declare-fun b!1513625 () Bool)

(declare-fun e!844761 () Bool)

(assert (=> b!1513625 (= e!844759 e!844761)))

(declare-fun res!1033522 () Bool)

(assert (=> b!1513625 (=> res!1033522 e!844761)))

(assert (=> b!1513625 (= res!1033522 (or (not (= (select (arr!48688 a!2804) j!70) lt!656042)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48688 a!2804) index!487) (select (arr!48688 a!2804) j!70)) (not (= (select (arr!48688 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513626 () Bool)

(declare-fun res!1033519 () Bool)

(assert (=> b!1513626 (=> (not res!1033519) (not e!844762))))

(assert (=> b!1513626 (= res!1033519 (and (= (size!49238 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49238 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49238 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513627 () Bool)

(assert (=> b!1513627 (= e!844761 e!844757)))

(declare-fun res!1033526 () Bool)

(assert (=> b!1513627 (=> (not res!1033526) (not e!844757))))

(assert (=> b!1513627 (= res!1033526 (= (seekEntryOrOpen!0 (select (arr!48688 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48688 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513628 () Bool)

(assert (=> b!1513628 (= e!844756 e!844758)))

(declare-fun res!1033521 () Bool)

(assert (=> b!1513628 (=> (not res!1033521) (not e!844758))))

(assert (=> b!1513628 (= res!1033521 (= lt!656041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656042 mask!2512) lt!656042 lt!656043 mask!2512)))))

(assert (=> b!1513628 (= lt!656042 (select (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513628 (= lt!656043 (array!100903 (store (arr!48688 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49238 a!2804)))))

(assert (= (and start!129046 res!1033525) b!1513626))

(assert (= (and b!1513626 res!1033519) b!1513618))

(assert (= (and b!1513618 res!1033520) b!1513616))

(assert (= (and b!1513616 res!1033531) b!1513623))

(assert (= (and b!1513623 res!1033530) b!1513622))

(assert (= (and b!1513622 res!1033529) b!1513621))

(assert (= (and b!1513621 res!1033528) b!1513615))

(assert (= (and b!1513615 res!1033523) b!1513620))

(assert (= (and b!1513620 res!1033527) b!1513628))

(assert (= (and b!1513628 res!1033521) b!1513617))

(assert (= (and b!1513617 res!1033518) b!1513619))

(assert (= (and b!1513619 res!1033524) b!1513625))

(assert (= (and b!1513625 (not res!1033522)) b!1513627))

(assert (= (and b!1513627 res!1033526) b!1513624))

(declare-fun m!1396491 () Bool)

(assert (=> b!1513622 m!1396491))

(declare-fun m!1396493 () Bool)

(assert (=> b!1513623 m!1396493))

(declare-fun m!1396495 () Bool)

(assert (=> b!1513618 m!1396495))

(assert (=> b!1513618 m!1396495))

(declare-fun m!1396497 () Bool)

(assert (=> b!1513618 m!1396497))

(declare-fun m!1396499 () Bool)

(assert (=> b!1513624 m!1396499))

(declare-fun m!1396501 () Bool)

(assert (=> b!1513624 m!1396501))

(declare-fun m!1396503 () Bool)

(assert (=> b!1513628 m!1396503))

(assert (=> b!1513628 m!1396503))

(declare-fun m!1396505 () Bool)

(assert (=> b!1513628 m!1396505))

(declare-fun m!1396507 () Bool)

(assert (=> b!1513628 m!1396507))

(declare-fun m!1396509 () Bool)

(assert (=> b!1513628 m!1396509))

(declare-fun m!1396511 () Bool)

(assert (=> b!1513619 m!1396511))

(assert (=> b!1513619 m!1396511))

(declare-fun m!1396513 () Bool)

(assert (=> b!1513619 m!1396513))

(declare-fun m!1396515 () Bool)

(assert (=> start!129046 m!1396515))

(declare-fun m!1396517 () Bool)

(assert (=> start!129046 m!1396517))

(assert (=> b!1513627 m!1396511))

(assert (=> b!1513627 m!1396511))

(declare-fun m!1396519 () Bool)

(assert (=> b!1513627 m!1396519))

(assert (=> b!1513627 m!1396511))

(declare-fun m!1396521 () Bool)

(assert (=> b!1513627 m!1396521))

(assert (=> b!1513616 m!1396511))

(assert (=> b!1513616 m!1396511))

(declare-fun m!1396523 () Bool)

(assert (=> b!1513616 m!1396523))

(assert (=> b!1513625 m!1396511))

(declare-fun m!1396525 () Bool)

(assert (=> b!1513625 m!1396525))

(assert (=> b!1513615 m!1396511))

(assert (=> b!1513615 m!1396511))

(declare-fun m!1396527 () Bool)

(assert (=> b!1513615 m!1396527))

(assert (=> b!1513615 m!1396527))

(assert (=> b!1513615 m!1396511))

(declare-fun m!1396529 () Bool)

(assert (=> b!1513615 m!1396529))

(declare-fun m!1396531 () Bool)

(assert (=> b!1513617 m!1396531))

(declare-fun m!1396533 () Bool)

(assert (=> b!1513617 m!1396533))

(assert (=> b!1513620 m!1396511))

(assert (=> b!1513620 m!1396511))

(declare-fun m!1396535 () Bool)

(assert (=> b!1513620 m!1396535))

(push 1)

