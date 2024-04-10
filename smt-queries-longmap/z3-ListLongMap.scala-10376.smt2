; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122180 () Bool)

(assert start!122180)

(declare-fun b!1417404 () Bool)

(declare-fun res!953139 () Bool)

(declare-fun e!802195 () Bool)

(assert (=> b!1417404 (=> (not res!953139) (not e!802195))))

(declare-datatypes ((array!96764 0))(
  ( (array!96765 (arr!46710 (Array (_ BitVec 32) (_ BitVec 64))) (size!47260 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96764)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417404 (= res!953139 (validKeyInArray!0 (select (arr!46710 a!2901) i!1037)))))

(declare-fun b!1417405 () Bool)

(assert (=> b!1417405 (= e!802195 (not true))))

(declare-fun e!802194 () Bool)

(assert (=> b!1417405 e!802194))

(declare-fun res!953140 () Bool)

(assert (=> b!1417405 (=> (not res!953140) (not e!802194))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96764 (_ BitVec 32)) Bool)

(assert (=> b!1417405 (= res!953140 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48016 0))(
  ( (Unit!48017) )
))
(declare-fun lt!625362 () Unit!48016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48016)

(assert (=> b!1417405 (= lt!625362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11021 0))(
  ( (MissingZero!11021 (index!46476 (_ BitVec 32))) (Found!11021 (index!46477 (_ BitVec 32))) (Intermediate!11021 (undefined!11833 Bool) (index!46478 (_ BitVec 32)) (x!128080 (_ BitVec 32))) (Undefined!11021) (MissingVacant!11021 (index!46479 (_ BitVec 32))) )
))
(declare-fun lt!625361 () SeekEntryResult!11021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96764 (_ BitVec 32)) SeekEntryResult!11021)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417405 (= lt!625361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46710 a!2901) j!112) mask!2840) (select (arr!46710 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417406 () Bool)

(declare-fun res!953136 () Bool)

(assert (=> b!1417406 (=> (not res!953136) (not e!802195))))

(declare-datatypes ((List!33229 0))(
  ( (Nil!33226) (Cons!33225 (h!34518 (_ BitVec 64)) (t!47923 List!33229)) )
))
(declare-fun arrayNoDuplicates!0 (array!96764 (_ BitVec 32) List!33229) Bool)

(assert (=> b!1417406 (= res!953136 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33226))))

(declare-fun b!1417408 () Bool)

(declare-fun res!953137 () Bool)

(assert (=> b!1417408 (=> (not res!953137) (not e!802195))))

(assert (=> b!1417408 (= res!953137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417409 () Bool)

(declare-fun res!953134 () Bool)

(assert (=> b!1417409 (=> (not res!953134) (not e!802195))))

(assert (=> b!1417409 (= res!953134 (and (= (size!47260 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47260 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47260 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417410 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96764 (_ BitVec 32)) SeekEntryResult!11021)

(assert (=> b!1417410 (= e!802194 (= (seekEntryOrOpen!0 (select (arr!46710 a!2901) j!112) a!2901 mask!2840) (Found!11021 j!112)))))

(declare-fun res!953138 () Bool)

(assert (=> start!122180 (=> (not res!953138) (not e!802195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122180 (= res!953138 (validMask!0 mask!2840))))

(assert (=> start!122180 e!802195))

(assert (=> start!122180 true))

(declare-fun array_inv!35738 (array!96764) Bool)

(assert (=> start!122180 (array_inv!35738 a!2901)))

(declare-fun b!1417407 () Bool)

(declare-fun res!953135 () Bool)

(assert (=> b!1417407 (=> (not res!953135) (not e!802195))))

(assert (=> b!1417407 (= res!953135 (validKeyInArray!0 (select (arr!46710 a!2901) j!112)))))

(assert (= (and start!122180 res!953138) b!1417409))

(assert (= (and b!1417409 res!953134) b!1417404))

(assert (= (and b!1417404 res!953139) b!1417407))

(assert (= (and b!1417407 res!953135) b!1417408))

(assert (= (and b!1417408 res!953137) b!1417406))

(assert (= (and b!1417406 res!953136) b!1417405))

(assert (= (and b!1417405 res!953140) b!1417410))

(declare-fun m!1308113 () Bool)

(assert (=> b!1417406 m!1308113))

(declare-fun m!1308115 () Bool)

(assert (=> b!1417408 m!1308115))

(declare-fun m!1308117 () Bool)

(assert (=> b!1417407 m!1308117))

(assert (=> b!1417407 m!1308117))

(declare-fun m!1308119 () Bool)

(assert (=> b!1417407 m!1308119))

(assert (=> b!1417405 m!1308117))

(declare-fun m!1308121 () Bool)

(assert (=> b!1417405 m!1308121))

(assert (=> b!1417405 m!1308117))

(declare-fun m!1308123 () Bool)

(assert (=> b!1417405 m!1308123))

(assert (=> b!1417405 m!1308121))

(assert (=> b!1417405 m!1308117))

(declare-fun m!1308125 () Bool)

(assert (=> b!1417405 m!1308125))

(declare-fun m!1308127 () Bool)

(assert (=> b!1417405 m!1308127))

(declare-fun m!1308129 () Bool)

(assert (=> start!122180 m!1308129))

(declare-fun m!1308131 () Bool)

(assert (=> start!122180 m!1308131))

(declare-fun m!1308133 () Bool)

(assert (=> b!1417404 m!1308133))

(assert (=> b!1417404 m!1308133))

(declare-fun m!1308135 () Bool)

(assert (=> b!1417404 m!1308135))

(assert (=> b!1417410 m!1308117))

(assert (=> b!1417410 m!1308117))

(declare-fun m!1308137 () Bool)

(assert (=> b!1417410 m!1308137))

(check-sat (not b!1417406) (not b!1417405) (not start!122180) (not b!1417407) (not b!1417408) (not b!1417410) (not b!1417404))
