; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122196 () Bool)

(assert start!122196)

(declare-fun b!1417572 () Bool)

(declare-fun e!802266 () Bool)

(assert (=> b!1417572 (= e!802266 (not true))))

(declare-fun e!802268 () Bool)

(assert (=> b!1417572 e!802268))

(declare-fun res!953307 () Bool)

(assert (=> b!1417572 (=> (not res!953307) (not e!802268))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96780 0))(
  ( (array!96781 (arr!46718 (Array (_ BitVec 32) (_ BitVec 64))) (size!47268 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96780)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96780 (_ BitVec 32)) Bool)

(assert (=> b!1417572 (= res!953307 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48032 0))(
  ( (Unit!48033) )
))
(declare-fun lt!625409 () Unit!48032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48032)

(assert (=> b!1417572 (= lt!625409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11029 0))(
  ( (MissingZero!11029 (index!46508 (_ BitVec 32))) (Found!11029 (index!46509 (_ BitVec 32))) (Intermediate!11029 (undefined!11841 Bool) (index!46510 (_ BitVec 32)) (x!128112 (_ BitVec 32))) (Undefined!11029) (MissingVacant!11029 (index!46511 (_ BitVec 32))) )
))
(declare-fun lt!625410 () SeekEntryResult!11029)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96780 (_ BitVec 32)) SeekEntryResult!11029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417572 (= lt!625410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46718 a!2901) j!112) mask!2840) (select (arr!46718 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417573 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96780 (_ BitVec 32)) SeekEntryResult!11029)

(assert (=> b!1417573 (= e!802268 (= (seekEntryOrOpen!0 (select (arr!46718 a!2901) j!112) a!2901 mask!2840) (Found!11029 j!112)))))

(declare-fun b!1417574 () Bool)

(declare-fun res!953303 () Bool)

(assert (=> b!1417574 (=> (not res!953303) (not e!802266))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417574 (= res!953303 (and (= (size!47268 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47268 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47268 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417575 () Bool)

(declare-fun res!953308 () Bool)

(assert (=> b!1417575 (=> (not res!953308) (not e!802266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417575 (= res!953308 (validKeyInArray!0 (select (arr!46718 a!2901) i!1037)))))

(declare-fun b!1417576 () Bool)

(declare-fun res!953306 () Bool)

(assert (=> b!1417576 (=> (not res!953306) (not e!802266))))

(assert (=> b!1417576 (= res!953306 (validKeyInArray!0 (select (arr!46718 a!2901) j!112)))))

(declare-fun b!1417578 () Bool)

(declare-fun res!953304 () Bool)

(assert (=> b!1417578 (=> (not res!953304) (not e!802266))))

(declare-datatypes ((List!33237 0))(
  ( (Nil!33234) (Cons!33233 (h!34526 (_ BitVec 64)) (t!47931 List!33237)) )
))
(declare-fun arrayNoDuplicates!0 (array!96780 (_ BitVec 32) List!33237) Bool)

(assert (=> b!1417578 (= res!953304 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33234))))

(declare-fun b!1417577 () Bool)

(declare-fun res!953305 () Bool)

(assert (=> b!1417577 (=> (not res!953305) (not e!802266))))

(assert (=> b!1417577 (= res!953305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!953302 () Bool)

(assert (=> start!122196 (=> (not res!953302) (not e!802266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122196 (= res!953302 (validMask!0 mask!2840))))

(assert (=> start!122196 e!802266))

(assert (=> start!122196 true))

(declare-fun array_inv!35746 (array!96780) Bool)

(assert (=> start!122196 (array_inv!35746 a!2901)))

(assert (= (and start!122196 res!953302) b!1417574))

(assert (= (and b!1417574 res!953303) b!1417575))

(assert (= (and b!1417575 res!953308) b!1417576))

(assert (= (and b!1417576 res!953306) b!1417577))

(assert (= (and b!1417577 res!953305) b!1417578))

(assert (= (and b!1417578 res!953304) b!1417572))

(assert (= (and b!1417572 res!953307) b!1417573))

(declare-fun m!1308321 () Bool)

(assert (=> b!1417578 m!1308321))

(declare-fun m!1308323 () Bool)

(assert (=> start!122196 m!1308323))

(declare-fun m!1308325 () Bool)

(assert (=> start!122196 m!1308325))

(declare-fun m!1308327 () Bool)

(assert (=> b!1417576 m!1308327))

(assert (=> b!1417576 m!1308327))

(declare-fun m!1308329 () Bool)

(assert (=> b!1417576 m!1308329))

(assert (=> b!1417573 m!1308327))

(assert (=> b!1417573 m!1308327))

(declare-fun m!1308331 () Bool)

(assert (=> b!1417573 m!1308331))

(assert (=> b!1417572 m!1308327))

(declare-fun m!1308333 () Bool)

(assert (=> b!1417572 m!1308333))

(assert (=> b!1417572 m!1308327))

(declare-fun m!1308335 () Bool)

(assert (=> b!1417572 m!1308335))

(assert (=> b!1417572 m!1308333))

(assert (=> b!1417572 m!1308327))

(declare-fun m!1308337 () Bool)

(assert (=> b!1417572 m!1308337))

(declare-fun m!1308339 () Bool)

(assert (=> b!1417572 m!1308339))

(declare-fun m!1308341 () Bool)

(assert (=> b!1417575 m!1308341))

(assert (=> b!1417575 m!1308341))

(declare-fun m!1308343 () Bool)

(assert (=> b!1417575 m!1308343))

(declare-fun m!1308345 () Bool)

(assert (=> b!1417577 m!1308345))

(push 1)

(assert (not b!1417572))

(assert (not b!1417578))

(assert (not start!122196))

(assert (not b!1417575))

(assert (not b!1417573))

(assert (not b!1417576))

(assert (not b!1417577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

