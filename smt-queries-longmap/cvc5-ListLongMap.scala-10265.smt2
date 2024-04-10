; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120750 () Bool)

(assert start!120750)

(declare-fun b!1405032 () Bool)

(declare-fun res!943249 () Bool)

(declare-fun e!795383 () Bool)

(assert (=> b!1405032 (=> (not res!943249) (not e!795383))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96057 0))(
  ( (array!96058 (arr!46376 (Array (_ BitVec 32) (_ BitVec 64))) (size!46926 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96057)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405032 (= res!943249 (and (= (size!46926 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46926 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46926 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405033 () Bool)

(declare-fun res!943255 () Bool)

(assert (=> b!1405033 (=> (not res!943255) (not e!795383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405033 (= res!943255 (validKeyInArray!0 (select (arr!46376 a!2901) j!112)))))

(declare-fun res!943254 () Bool)

(assert (=> start!120750 (=> (not res!943254) (not e!795383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120750 (= res!943254 (validMask!0 mask!2840))))

(assert (=> start!120750 e!795383))

(assert (=> start!120750 true))

(declare-fun array_inv!35404 (array!96057) Bool)

(assert (=> start!120750 (array_inv!35404 a!2901)))

(declare-fun b!1405034 () Bool)

(declare-fun res!943252 () Bool)

(assert (=> b!1405034 (=> (not res!943252) (not e!795383))))

(assert (=> b!1405034 (= res!943252 (validKeyInArray!0 (select (arr!46376 a!2901) i!1037)))))

(declare-fun b!1405035 () Bool)

(declare-fun res!943251 () Bool)

(assert (=> b!1405035 (=> (not res!943251) (not e!795383))))

(declare-datatypes ((List!32895 0))(
  ( (Nil!32892) (Cons!32891 (h!34145 (_ BitVec 64)) (t!47589 List!32895)) )
))
(declare-fun arrayNoDuplicates!0 (array!96057 (_ BitVec 32) List!32895) Bool)

(assert (=> b!1405035 (= res!943251 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32892))))

(declare-fun b!1405036 () Bool)

(assert (=> b!1405036 (= e!795383 (not true))))

(declare-fun e!795382 () Bool)

(assert (=> b!1405036 e!795382))

(declare-fun res!943253 () Bool)

(assert (=> b!1405036 (=> (not res!943253) (not e!795382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96057 (_ BitVec 32)) Bool)

(assert (=> b!1405036 (= res!943253 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47348 0))(
  ( (Unit!47349) )
))
(declare-fun lt!618912 () Unit!47348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47348)

(assert (=> b!1405036 (= lt!618912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10687 0))(
  ( (MissingZero!10687 (index!45125 (_ BitVec 32))) (Found!10687 (index!45126 (_ BitVec 32))) (Intermediate!10687 (undefined!11499 Bool) (index!45127 (_ BitVec 32)) (x!126750 (_ BitVec 32))) (Undefined!10687) (MissingVacant!10687 (index!45128 (_ BitVec 32))) )
))
(declare-fun lt!618911 () SeekEntryResult!10687)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96057 (_ BitVec 32)) SeekEntryResult!10687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405036 (= lt!618911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46376 a!2901) j!112) mask!2840) (select (arr!46376 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96057 (_ BitVec 32)) SeekEntryResult!10687)

(assert (=> b!1405037 (= e!795382 (= (seekEntryOrOpen!0 (select (arr!46376 a!2901) j!112) a!2901 mask!2840) (Found!10687 j!112)))))

(declare-fun b!1405038 () Bool)

(declare-fun res!943250 () Bool)

(assert (=> b!1405038 (=> (not res!943250) (not e!795383))))

(assert (=> b!1405038 (= res!943250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120750 res!943254) b!1405032))

(assert (= (and b!1405032 res!943249) b!1405034))

(assert (= (and b!1405034 res!943252) b!1405033))

(assert (= (and b!1405033 res!943255) b!1405038))

(assert (= (and b!1405038 res!943250) b!1405035))

(assert (= (and b!1405035 res!943251) b!1405036))

(assert (= (and b!1405036 res!943253) b!1405037))

(declare-fun m!1293717 () Bool)

(assert (=> b!1405038 m!1293717))

(declare-fun m!1293719 () Bool)

(assert (=> b!1405034 m!1293719))

(assert (=> b!1405034 m!1293719))

(declare-fun m!1293721 () Bool)

(assert (=> b!1405034 m!1293721))

(declare-fun m!1293723 () Bool)

(assert (=> start!120750 m!1293723))

(declare-fun m!1293725 () Bool)

(assert (=> start!120750 m!1293725))

(declare-fun m!1293727 () Bool)

(assert (=> b!1405035 m!1293727))

(declare-fun m!1293729 () Bool)

(assert (=> b!1405036 m!1293729))

(declare-fun m!1293731 () Bool)

(assert (=> b!1405036 m!1293731))

(assert (=> b!1405036 m!1293729))

(declare-fun m!1293733 () Bool)

(assert (=> b!1405036 m!1293733))

(assert (=> b!1405036 m!1293731))

(assert (=> b!1405036 m!1293729))

(declare-fun m!1293735 () Bool)

(assert (=> b!1405036 m!1293735))

(declare-fun m!1293737 () Bool)

(assert (=> b!1405036 m!1293737))

(assert (=> b!1405037 m!1293729))

(assert (=> b!1405037 m!1293729))

(declare-fun m!1293739 () Bool)

(assert (=> b!1405037 m!1293739))

(assert (=> b!1405033 m!1293729))

(assert (=> b!1405033 m!1293729))

(declare-fun m!1293741 () Bool)

(assert (=> b!1405033 m!1293741))

(push 1)

(assert (not b!1405034))

(assert (not b!1405033))

(assert (not b!1405036))

(assert (not b!1405037))

(assert (not b!1405035))

(assert (not b!1405038))

(assert (not start!120750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

