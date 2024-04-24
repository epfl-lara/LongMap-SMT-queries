; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120714 () Bool)

(assert start!120714)

(declare-fun b!1404578 () Bool)

(declare-fun e!795383 () Bool)

(assert (=> b!1404578 (= e!795383 true)))

(declare-datatypes ((array!96045 0))(
  ( (array!96046 (arr!46371 (Array (_ BitVec 32) (_ BitVec 64))) (size!46922 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96045)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10591 0))(
  ( (MissingZero!10591 (index!44741 (_ BitVec 32))) (Found!10591 (index!44742 (_ BitVec 32))) (Intermediate!10591 (undefined!11403 Bool) (index!44743 (_ BitVec 32)) (x!126501 (_ BitVec 32))) (Undefined!10591) (MissingVacant!10591 (index!44744 (_ BitVec 32))) )
))
(declare-fun lt!618798 () SeekEntryResult!10591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96045 (_ BitVec 32)) SeekEntryResult!10591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404578 (= lt!618798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46371 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46371 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96046 (store (arr!46371 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46922 a!2901)) mask!2840))))

(declare-fun e!795382 () Bool)

(declare-fun b!1404579 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96045 (_ BitVec 32)) SeekEntryResult!10591)

(assert (=> b!1404579 (= e!795382 (= (seekEntryOrOpen!0 (select (arr!46371 a!2901) j!112) a!2901 mask!2840) (Found!10591 j!112)))))

(declare-fun b!1404580 () Bool)

(declare-fun res!942405 () Bool)

(declare-fun e!795380 () Bool)

(assert (=> b!1404580 (=> (not res!942405) (not e!795380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96045 (_ BitVec 32)) Bool)

(assert (=> b!1404580 (= res!942405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404581 () Bool)

(declare-fun res!942411 () Bool)

(assert (=> b!1404581 (=> (not res!942411) (not e!795380))))

(declare-datatypes ((List!32877 0))(
  ( (Nil!32874) (Cons!32873 (h!34129 (_ BitVec 64)) (t!47563 List!32877)) )
))
(declare-fun arrayNoDuplicates!0 (array!96045 (_ BitVec 32) List!32877) Bool)

(assert (=> b!1404581 (= res!942411 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32874))))

(declare-fun b!1404582 () Bool)

(declare-fun res!942406 () Bool)

(assert (=> b!1404582 (=> (not res!942406) (not e!795380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404582 (= res!942406 (validKeyInArray!0 (select (arr!46371 a!2901) j!112)))))

(declare-fun b!1404583 () Bool)

(assert (=> b!1404583 (= e!795380 (not e!795383))))

(declare-fun res!942409 () Bool)

(assert (=> b!1404583 (=> res!942409 e!795383)))

(declare-fun lt!618799 () SeekEntryResult!10591)

(assert (=> b!1404583 (= res!942409 (or (not (is-Intermediate!10591 lt!618799)) (undefined!11403 lt!618799)))))

(assert (=> b!1404583 e!795382))

(declare-fun res!942408 () Bool)

(assert (=> b!1404583 (=> (not res!942408) (not e!795382))))

(assert (=> b!1404583 (= res!942408 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47213 0))(
  ( (Unit!47214) )
))
(declare-fun lt!618800 () Unit!47213)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47213)

(assert (=> b!1404583 (= lt!618800 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404583 (= lt!618799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) (select (arr!46371 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404585 () Bool)

(declare-fun res!942412 () Bool)

(assert (=> b!1404585 (=> (not res!942412) (not e!795380))))

(assert (=> b!1404585 (= res!942412 (validKeyInArray!0 (select (arr!46371 a!2901) i!1037)))))

(declare-fun b!1404584 () Bool)

(declare-fun res!942407 () Bool)

(assert (=> b!1404584 (=> (not res!942407) (not e!795380))))

(assert (=> b!1404584 (= res!942407 (and (= (size!46922 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46922 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46922 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942410 () Bool)

(assert (=> start!120714 (=> (not res!942410) (not e!795380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120714 (= res!942410 (validMask!0 mask!2840))))

(assert (=> start!120714 e!795380))

(assert (=> start!120714 true))

(declare-fun array_inv!35652 (array!96045) Bool)

(assert (=> start!120714 (array_inv!35652 a!2901)))

(assert (= (and start!120714 res!942410) b!1404584))

(assert (= (and b!1404584 res!942407) b!1404585))

(assert (= (and b!1404585 res!942412) b!1404582))

(assert (= (and b!1404582 res!942406) b!1404580))

(assert (= (and b!1404580 res!942405) b!1404581))

(assert (= (and b!1404581 res!942411) b!1404583))

(assert (= (and b!1404583 res!942408) b!1404579))

(assert (= (and b!1404583 (not res!942409)) b!1404578))

(declare-fun m!1293447 () Bool)

(assert (=> b!1404581 m!1293447))

(declare-fun m!1293449 () Bool)

(assert (=> start!120714 m!1293449))

(declare-fun m!1293451 () Bool)

(assert (=> start!120714 m!1293451))

(declare-fun m!1293453 () Bool)

(assert (=> b!1404579 m!1293453))

(assert (=> b!1404579 m!1293453))

(declare-fun m!1293455 () Bool)

(assert (=> b!1404579 m!1293455))

(assert (=> b!1404583 m!1293453))

(declare-fun m!1293457 () Bool)

(assert (=> b!1404583 m!1293457))

(assert (=> b!1404583 m!1293453))

(declare-fun m!1293459 () Bool)

(assert (=> b!1404583 m!1293459))

(assert (=> b!1404583 m!1293457))

(assert (=> b!1404583 m!1293453))

(declare-fun m!1293461 () Bool)

(assert (=> b!1404583 m!1293461))

(declare-fun m!1293463 () Bool)

(assert (=> b!1404583 m!1293463))

(assert (=> b!1404582 m!1293453))

(assert (=> b!1404582 m!1293453))

(declare-fun m!1293465 () Bool)

(assert (=> b!1404582 m!1293465))

(declare-fun m!1293467 () Bool)

(assert (=> b!1404578 m!1293467))

(declare-fun m!1293469 () Bool)

(assert (=> b!1404578 m!1293469))

(assert (=> b!1404578 m!1293469))

(declare-fun m!1293471 () Bool)

(assert (=> b!1404578 m!1293471))

(assert (=> b!1404578 m!1293471))

(assert (=> b!1404578 m!1293469))

(declare-fun m!1293473 () Bool)

(assert (=> b!1404578 m!1293473))

(declare-fun m!1293475 () Bool)

(assert (=> b!1404580 m!1293475))

(declare-fun m!1293477 () Bool)

(assert (=> b!1404585 m!1293477))

(assert (=> b!1404585 m!1293477))

(declare-fun m!1293479 () Bool)

(assert (=> b!1404585 m!1293479))

(push 1)

(assert (not start!120714))

(assert (not b!1404579))

(assert (not b!1404585))

(assert (not b!1404582))

(assert (not b!1404578))

(assert (not b!1404580))

(assert (not b!1404581))

(assert (not b!1404583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

