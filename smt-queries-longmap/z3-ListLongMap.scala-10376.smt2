; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122174 () Bool)

(assert start!122174)

(declare-fun b!1417302 () Bool)

(declare-fun res!953083 () Bool)

(declare-fun e!802148 () Bool)

(assert (=> b!1417302 (=> (not res!953083) (not e!802148))))

(declare-datatypes ((array!96711 0))(
  ( (array!96712 (arr!46684 (Array (_ BitVec 32) (_ BitVec 64))) (size!47236 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96711)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417302 (= res!953083 (validKeyInArray!0 (select (arr!46684 a!2901) i!1037)))))

(declare-fun b!1417304 () Bool)

(declare-fun res!953089 () Bool)

(assert (=> b!1417304 (=> (not res!953089) (not e!802148))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417304 (= res!953089 (and (= (size!47236 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47236 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47236 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417305 () Bool)

(declare-fun res!953088 () Bool)

(assert (=> b!1417305 (=> (not res!953088) (not e!802148))))

(declare-datatypes ((List!33281 0))(
  ( (Nil!33278) (Cons!33277 (h!34570 (_ BitVec 64)) (t!47967 List!33281)) )
))
(declare-fun arrayNoDuplicates!0 (array!96711 (_ BitVec 32) List!33281) Bool)

(assert (=> b!1417305 (= res!953088 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33278))))

(declare-fun b!1417306 () Bool)

(assert (=> b!1417306 (= e!802148 (not true))))

(declare-fun e!802147 () Bool)

(assert (=> b!1417306 e!802147))

(declare-fun res!953085 () Bool)

(assert (=> b!1417306 (=> (not res!953085) (not e!802147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96711 (_ BitVec 32)) Bool)

(assert (=> b!1417306 (= res!953085 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47859 0))(
  ( (Unit!47860) )
))
(declare-fun lt!625165 () Unit!47859)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47859)

(assert (=> b!1417306 (= lt!625165 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11021 0))(
  ( (MissingZero!11021 (index!46476 (_ BitVec 32))) (Found!11021 (index!46477 (_ BitVec 32))) (Intermediate!11021 (undefined!11833 Bool) (index!46478 (_ BitVec 32)) (x!128077 (_ BitVec 32))) (Undefined!11021) (MissingVacant!11021 (index!46479 (_ BitVec 32))) )
))
(declare-fun lt!625166 () SeekEntryResult!11021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96711 (_ BitVec 32)) SeekEntryResult!11021)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417306 (= lt!625166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46684 a!2901) j!112) mask!2840) (select (arr!46684 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417307 () Bool)

(declare-fun res!953086 () Bool)

(assert (=> b!1417307 (=> (not res!953086) (not e!802148))))

(assert (=> b!1417307 (= res!953086 (validKeyInArray!0 (select (arr!46684 a!2901) j!112)))))

(declare-fun b!1417308 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96711 (_ BitVec 32)) SeekEntryResult!11021)

(assert (=> b!1417308 (= e!802147 (= (seekEntryOrOpen!0 (select (arr!46684 a!2901) j!112) a!2901 mask!2840) (Found!11021 j!112)))))

(declare-fun res!953084 () Bool)

(assert (=> start!122174 (=> (not res!953084) (not e!802148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122174 (= res!953084 (validMask!0 mask!2840))))

(assert (=> start!122174 e!802148))

(assert (=> start!122174 true))

(declare-fun array_inv!35917 (array!96711) Bool)

(assert (=> start!122174 (array_inv!35917 a!2901)))

(declare-fun b!1417303 () Bool)

(declare-fun res!953087 () Bool)

(assert (=> b!1417303 (=> (not res!953087) (not e!802148))))

(assert (=> b!1417303 (= res!953087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122174 res!953084) b!1417304))

(assert (= (and b!1417304 res!953089) b!1417302))

(assert (= (and b!1417302 res!953083) b!1417307))

(assert (= (and b!1417307 res!953086) b!1417303))

(assert (= (and b!1417303 res!953087) b!1417305))

(assert (= (and b!1417305 res!953088) b!1417306))

(assert (= (and b!1417306 res!953085) b!1417308))

(declare-fun m!1307551 () Bool)

(assert (=> b!1417303 m!1307551))

(declare-fun m!1307553 () Bool)

(assert (=> b!1417306 m!1307553))

(declare-fun m!1307555 () Bool)

(assert (=> b!1417306 m!1307555))

(assert (=> b!1417306 m!1307553))

(declare-fun m!1307557 () Bool)

(assert (=> b!1417306 m!1307557))

(assert (=> b!1417306 m!1307555))

(assert (=> b!1417306 m!1307553))

(declare-fun m!1307559 () Bool)

(assert (=> b!1417306 m!1307559))

(declare-fun m!1307561 () Bool)

(assert (=> b!1417306 m!1307561))

(declare-fun m!1307563 () Bool)

(assert (=> start!122174 m!1307563))

(declare-fun m!1307565 () Bool)

(assert (=> start!122174 m!1307565))

(declare-fun m!1307567 () Bool)

(assert (=> b!1417305 m!1307567))

(assert (=> b!1417308 m!1307553))

(assert (=> b!1417308 m!1307553))

(declare-fun m!1307569 () Bool)

(assert (=> b!1417308 m!1307569))

(assert (=> b!1417307 m!1307553))

(assert (=> b!1417307 m!1307553))

(declare-fun m!1307571 () Bool)

(assert (=> b!1417307 m!1307571))

(declare-fun m!1307573 () Bool)

(assert (=> b!1417302 m!1307573))

(assert (=> b!1417302 m!1307573))

(declare-fun m!1307575 () Bool)

(assert (=> b!1417302 m!1307575))

(check-sat (not start!122174) (not b!1417302) (not b!1417308) (not b!1417307) (not b!1417303) (not b!1417306) (not b!1417305))
(check-sat)
