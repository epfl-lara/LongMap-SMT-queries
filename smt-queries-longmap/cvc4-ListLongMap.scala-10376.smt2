; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122182 () Bool)

(assert start!122182)

(declare-fun b!1417425 () Bool)

(declare-fun res!953161 () Bool)

(declare-fun e!802203 () Bool)

(assert (=> b!1417425 (=> (not res!953161) (not e!802203))))

(declare-datatypes ((array!96766 0))(
  ( (array!96767 (arr!46711 (Array (_ BitVec 32) (_ BitVec 64))) (size!47261 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96766)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417425 (= res!953161 (validKeyInArray!0 (select (arr!46711 a!2901) j!112)))))

(declare-fun b!1417426 () Bool)

(declare-fun res!953156 () Bool)

(assert (=> b!1417426 (=> (not res!953156) (not e!802203))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96766 (_ BitVec 32)) Bool)

(assert (=> b!1417426 (= res!953156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417427 () Bool)

(assert (=> b!1417427 (= e!802203 (not true))))

(declare-fun e!802204 () Bool)

(assert (=> b!1417427 e!802204))

(declare-fun res!953155 () Bool)

(assert (=> b!1417427 (=> (not res!953155) (not e!802204))))

(assert (=> b!1417427 (= res!953155 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48018 0))(
  ( (Unit!48019) )
))
(declare-fun lt!625368 () Unit!48018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48018)

(assert (=> b!1417427 (= lt!625368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11022 0))(
  ( (MissingZero!11022 (index!46480 (_ BitVec 32))) (Found!11022 (index!46481 (_ BitVec 32))) (Intermediate!11022 (undefined!11834 Bool) (index!46482 (_ BitVec 32)) (x!128081 (_ BitVec 32))) (Undefined!11022) (MissingVacant!11022 (index!46483 (_ BitVec 32))) )
))
(declare-fun lt!625367 () SeekEntryResult!11022)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96766 (_ BitVec 32)) SeekEntryResult!11022)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417427 (= lt!625367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46711 a!2901) j!112) mask!2840) (select (arr!46711 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!953158 () Bool)

(assert (=> start!122182 (=> (not res!953158) (not e!802203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122182 (= res!953158 (validMask!0 mask!2840))))

(assert (=> start!122182 e!802203))

(assert (=> start!122182 true))

(declare-fun array_inv!35739 (array!96766) Bool)

(assert (=> start!122182 (array_inv!35739 a!2901)))

(declare-fun b!1417428 () Bool)

(declare-fun res!953157 () Bool)

(assert (=> b!1417428 (=> (not res!953157) (not e!802203))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417428 (= res!953157 (validKeyInArray!0 (select (arr!46711 a!2901) i!1037)))))

(declare-fun b!1417429 () Bool)

(declare-fun res!953160 () Bool)

(assert (=> b!1417429 (=> (not res!953160) (not e!802203))))

(declare-datatypes ((List!33230 0))(
  ( (Nil!33227) (Cons!33226 (h!34519 (_ BitVec 64)) (t!47924 List!33230)) )
))
(declare-fun arrayNoDuplicates!0 (array!96766 (_ BitVec 32) List!33230) Bool)

(assert (=> b!1417429 (= res!953160 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33227))))

(declare-fun b!1417430 () Bool)

(declare-fun res!953159 () Bool)

(assert (=> b!1417430 (=> (not res!953159) (not e!802203))))

(assert (=> b!1417430 (= res!953159 (and (= (size!47261 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47261 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47261 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417431 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96766 (_ BitVec 32)) SeekEntryResult!11022)

(assert (=> b!1417431 (= e!802204 (= (seekEntryOrOpen!0 (select (arr!46711 a!2901) j!112) a!2901 mask!2840) (Found!11022 j!112)))))

(assert (= (and start!122182 res!953158) b!1417430))

(assert (= (and b!1417430 res!953159) b!1417428))

(assert (= (and b!1417428 res!953157) b!1417425))

(assert (= (and b!1417425 res!953161) b!1417426))

(assert (= (and b!1417426 res!953156) b!1417429))

(assert (= (and b!1417429 res!953160) b!1417427))

(assert (= (and b!1417427 res!953155) b!1417431))

(declare-fun m!1308139 () Bool)

(assert (=> b!1417425 m!1308139))

(assert (=> b!1417425 m!1308139))

(declare-fun m!1308141 () Bool)

(assert (=> b!1417425 m!1308141))

(assert (=> b!1417427 m!1308139))

(declare-fun m!1308143 () Bool)

(assert (=> b!1417427 m!1308143))

(assert (=> b!1417427 m!1308139))

(declare-fun m!1308145 () Bool)

(assert (=> b!1417427 m!1308145))

(assert (=> b!1417427 m!1308143))

(assert (=> b!1417427 m!1308139))

(declare-fun m!1308147 () Bool)

(assert (=> b!1417427 m!1308147))

(declare-fun m!1308149 () Bool)

(assert (=> b!1417427 m!1308149))

(declare-fun m!1308151 () Bool)

(assert (=> start!122182 m!1308151))

(declare-fun m!1308153 () Bool)

(assert (=> start!122182 m!1308153))

(declare-fun m!1308155 () Bool)

(assert (=> b!1417429 m!1308155))

(declare-fun m!1308157 () Bool)

(assert (=> b!1417428 m!1308157))

(assert (=> b!1417428 m!1308157))

(declare-fun m!1308159 () Bool)

(assert (=> b!1417428 m!1308159))

(declare-fun m!1308161 () Bool)

(assert (=> b!1417426 m!1308161))

(assert (=> b!1417431 m!1308139))

(assert (=> b!1417431 m!1308139))

(declare-fun m!1308163 () Bool)

(assert (=> b!1417431 m!1308163))

(push 1)

(assert (not b!1417431))

(assert (not b!1417428))

(assert (not b!1417426))

(assert (not start!122182))

(assert (not b!1417429))

(assert (not b!1417427))

(assert (not b!1417425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

