; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122828 () Bool)

(assert start!122828)

(declare-fun res!956454 () Bool)

(declare-fun e!804154 () Bool)

(assert (=> start!122828 (=> (not res!956454) (not e!804154))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122828 (= res!956454 (validMask!0 mask!2608))))

(assert (=> start!122828 e!804154))

(assert (=> start!122828 true))

(declare-datatypes ((array!97115 0))(
  ( (array!97116 (arr!46873 (Array (_ BitVec 32) (_ BitVec 64))) (size!47424 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97115)

(declare-fun array_inv!36154 (array!97115) Bool)

(assert (=> start!122828 (array_inv!36154 a!2831)))

(declare-fun b!1421696 () Bool)

(declare-fun res!956447 () Bool)

(assert (=> b!1421696 (=> (not res!956447) (not e!804154))))

(declare-datatypes ((List!33370 0))(
  ( (Nil!33367) (Cons!33366 (h!34676 (_ BitVec 64)) (t!48056 List!33370)) )
))
(declare-fun arrayNoDuplicates!0 (array!97115 (_ BitVec 32) List!33370) Bool)

(assert (=> b!1421696 (= res!956447 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33367))))

(declare-fun b!1421697 () Bool)

(declare-fun e!804155 () Bool)

(assert (=> b!1421697 (= e!804154 e!804155)))

(declare-fun res!956450 () Bool)

(assert (=> b!1421697 (=> (not res!956450) (not e!804155))))

(declare-datatypes ((SeekEntryResult!11060 0))(
  ( (MissingZero!11060 (index!46632 (_ BitVec 32))) (Found!11060 (index!46633 (_ BitVec 32))) (Intermediate!11060 (undefined!11872 Bool) (index!46634 (_ BitVec 32)) (x!128449 (_ BitVec 32))) (Undefined!11060) (MissingVacant!11060 (index!46635 (_ BitVec 32))) )
))
(declare-fun lt!626327 () SeekEntryResult!11060)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97115 (_ BitVec 32)) SeekEntryResult!11060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421697 (= res!956450 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46873 a!2831) j!81) mask!2608) (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!626327))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421697 (= lt!626327 (Intermediate!11060 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421698 () Bool)

(declare-fun res!956453 () Bool)

(assert (=> b!1421698 (=> (not res!956453) (not e!804154))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421698 (= res!956453 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47424 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47424 a!2831))))))

(declare-fun b!1421699 () Bool)

(declare-fun res!956455 () Bool)

(assert (=> b!1421699 (=> (not res!956455) (not e!804154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97115 (_ BitVec 32)) Bool)

(assert (=> b!1421699 (= res!956455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421700 () Bool)

(declare-fun res!956451 () Bool)

(assert (=> b!1421700 (=> (not res!956451) (not e!804155))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1421700 (= res!956451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97116 (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47424 a!2831)) mask!2608) (Intermediate!11060 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1421701 () Bool)

(declare-fun res!956448 () Bool)

(assert (=> b!1421701 (=> (not res!956448) (not e!804154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421701 (= res!956448 (validKeyInArray!0 (select (arr!46873 a!2831) i!982)))))

(declare-fun b!1421702 () Bool)

(declare-fun res!956446 () Bool)

(assert (=> b!1421702 (=> (not res!956446) (not e!804154))))

(assert (=> b!1421702 (= res!956446 (validKeyInArray!0 (select (arr!46873 a!2831) j!81)))))

(declare-fun b!1421703 () Bool)

(assert (=> b!1421703 (= e!804155 (not (validKeyInArray!0 (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1421704 () Bool)

(declare-fun res!956452 () Bool)

(assert (=> b!1421704 (=> (not res!956452) (not e!804155))))

(assert (=> b!1421704 (= res!956452 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!626327))))

(declare-fun b!1421705 () Bool)

(declare-fun res!956449 () Bool)

(assert (=> b!1421705 (=> (not res!956449) (not e!804154))))

(assert (=> b!1421705 (= res!956449 (and (= (size!47424 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47424 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47424 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421706 () Bool)

(declare-fun res!956445 () Bool)

(assert (=> b!1421706 (=> (not res!956445) (not e!804155))))

(assert (=> b!1421706 (= res!956445 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(assert (= (and start!122828 res!956454) b!1421705))

(assert (= (and b!1421705 res!956449) b!1421701))

(assert (= (and b!1421701 res!956448) b!1421702))

(assert (= (and b!1421702 res!956446) b!1421699))

(assert (= (and b!1421699 res!956455) b!1421696))

(assert (= (and b!1421696 res!956447) b!1421698))

(assert (= (and b!1421698 res!956453) b!1421697))

(assert (= (and b!1421697 res!956450) b!1421700))

(assert (= (and b!1421700 res!956451) b!1421704))

(assert (= (and b!1421704 res!956452) b!1421706))

(assert (= (and b!1421706 res!956445) b!1421703))

(declare-fun m!1312443 () Bool)

(assert (=> b!1421703 m!1312443))

(declare-fun m!1312445 () Bool)

(assert (=> b!1421703 m!1312445))

(assert (=> b!1421703 m!1312445))

(declare-fun m!1312447 () Bool)

(assert (=> b!1421703 m!1312447))

(declare-fun m!1312449 () Bool)

(assert (=> b!1421702 m!1312449))

(assert (=> b!1421702 m!1312449))

(declare-fun m!1312451 () Bool)

(assert (=> b!1421702 m!1312451))

(assert (=> b!1421704 m!1312449))

(assert (=> b!1421704 m!1312449))

(declare-fun m!1312453 () Bool)

(assert (=> b!1421704 m!1312453))

(declare-fun m!1312455 () Bool)

(assert (=> b!1421701 m!1312455))

(assert (=> b!1421701 m!1312455))

(declare-fun m!1312457 () Bool)

(assert (=> b!1421701 m!1312457))

(assert (=> b!1421697 m!1312449))

(assert (=> b!1421697 m!1312449))

(declare-fun m!1312459 () Bool)

(assert (=> b!1421697 m!1312459))

(assert (=> b!1421697 m!1312459))

(assert (=> b!1421697 m!1312449))

(declare-fun m!1312461 () Bool)

(assert (=> b!1421697 m!1312461))

(declare-fun m!1312463 () Bool)

(assert (=> b!1421699 m!1312463))

(assert (=> b!1421700 m!1312443))

(assert (=> b!1421700 m!1312445))

(assert (=> b!1421700 m!1312445))

(declare-fun m!1312465 () Bool)

(assert (=> b!1421700 m!1312465))

(assert (=> b!1421700 m!1312465))

(assert (=> b!1421700 m!1312445))

(declare-fun m!1312467 () Bool)

(assert (=> b!1421700 m!1312467))

(declare-fun m!1312469 () Bool)

(assert (=> start!122828 m!1312469))

(declare-fun m!1312471 () Bool)

(assert (=> start!122828 m!1312471))

(declare-fun m!1312473 () Bool)

(assert (=> b!1421696 m!1312473))

(check-sat (not b!1421697) (not b!1421700) (not b!1421696) (not b!1421699) (not b!1421703) (not b!1421702) (not b!1421704) (not start!122828) (not b!1421701))
(check-sat)
