; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123132 () Bool)

(assert start!123132)

(declare-fun b!1426817 () Bool)

(declare-fun res!961371 () Bool)

(declare-fun e!806270 () Bool)

(assert (=> b!1426817 (=> (not res!961371) (not e!806270))))

(declare-datatypes ((array!97368 0))(
  ( (array!97369 (arr!46998 (Array (_ BitVec 32) (_ BitVec 64))) (size!47549 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97368)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426817 (= res!961371 (validKeyInArray!0 (select (arr!46998 a!2831) i!982)))))

(declare-fun b!1426818 () Bool)

(declare-fun res!961372 () Bool)

(assert (=> b!1426818 (=> (not res!961372) (not e!806270))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426818 (= res!961372 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47549 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47549 a!2831))))))

(declare-fun b!1426819 () Bool)

(declare-fun res!961366 () Bool)

(assert (=> b!1426819 (=> (not res!961366) (not e!806270))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97368 (_ BitVec 32)) Bool)

(assert (=> b!1426819 (= res!961366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426820 () Bool)

(declare-fun res!961368 () Bool)

(assert (=> b!1426820 (=> (not res!961368) (not e!806270))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11179 0))(
  ( (MissingZero!11179 (index!47108 (_ BitVec 32))) (Found!11179 (index!47109 (_ BitVec 32))) (Intermediate!11179 (undefined!11991 Bool) (index!47110 (_ BitVec 32)) (x!128902 (_ BitVec 32))) (Undefined!11179) (MissingVacant!11179 (index!47111 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97368 (_ BitVec 32)) SeekEntryResult!11179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426820 (= res!961368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46998 a!2831) j!81) mask!2608) (select (arr!46998 a!2831) j!81) a!2831 mask!2608) (Intermediate!11179 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1426821 () Bool)

(assert (=> b!1426821 (= e!806270 false)))

(declare-fun lt!628337 () SeekEntryResult!11179)

(assert (=> b!1426821 (= lt!628337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46998 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46998 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97369 (store (arr!46998 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47549 a!2831)) mask!2608))))

(declare-fun b!1426822 () Bool)

(declare-fun res!961367 () Bool)

(assert (=> b!1426822 (=> (not res!961367) (not e!806270))))

(declare-datatypes ((List!33495 0))(
  ( (Nil!33492) (Cons!33491 (h!34804 (_ BitVec 64)) (t!48181 List!33495)) )
))
(declare-fun arrayNoDuplicates!0 (array!97368 (_ BitVec 32) List!33495) Bool)

(assert (=> b!1426822 (= res!961367 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33492))))

(declare-fun b!1426823 () Bool)

(declare-fun res!961369 () Bool)

(assert (=> b!1426823 (=> (not res!961369) (not e!806270))))

(assert (=> b!1426823 (= res!961369 (validKeyInArray!0 (select (arr!46998 a!2831) j!81)))))

(declare-fun b!1426824 () Bool)

(declare-fun res!961365 () Bool)

(assert (=> b!1426824 (=> (not res!961365) (not e!806270))))

(assert (=> b!1426824 (= res!961365 (and (= (size!47549 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47549 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47549 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!961370 () Bool)

(assert (=> start!123132 (=> (not res!961370) (not e!806270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123132 (= res!961370 (validMask!0 mask!2608))))

(assert (=> start!123132 e!806270))

(assert (=> start!123132 true))

(declare-fun array_inv!36279 (array!97368) Bool)

(assert (=> start!123132 (array_inv!36279 a!2831)))

(assert (= (and start!123132 res!961370) b!1426824))

(assert (= (and b!1426824 res!961365) b!1426817))

(assert (= (and b!1426817 res!961371) b!1426823))

(assert (= (and b!1426823 res!961369) b!1426819))

(assert (= (and b!1426819 res!961366) b!1426822))

(assert (= (and b!1426822 res!961367) b!1426818))

(assert (= (and b!1426818 res!961372) b!1426820))

(assert (= (and b!1426820 res!961368) b!1426821))

(declare-fun m!1317503 () Bool)

(assert (=> b!1426819 m!1317503))

(declare-fun m!1317505 () Bool)

(assert (=> b!1426817 m!1317505))

(assert (=> b!1426817 m!1317505))

(declare-fun m!1317507 () Bool)

(assert (=> b!1426817 m!1317507))

(declare-fun m!1317509 () Bool)

(assert (=> b!1426823 m!1317509))

(assert (=> b!1426823 m!1317509))

(declare-fun m!1317511 () Bool)

(assert (=> b!1426823 m!1317511))

(declare-fun m!1317513 () Bool)

(assert (=> b!1426821 m!1317513))

(declare-fun m!1317515 () Bool)

(assert (=> b!1426821 m!1317515))

(assert (=> b!1426821 m!1317515))

(declare-fun m!1317517 () Bool)

(assert (=> b!1426821 m!1317517))

(assert (=> b!1426821 m!1317517))

(assert (=> b!1426821 m!1317515))

(declare-fun m!1317519 () Bool)

(assert (=> b!1426821 m!1317519))

(assert (=> b!1426820 m!1317509))

(assert (=> b!1426820 m!1317509))

(declare-fun m!1317521 () Bool)

(assert (=> b!1426820 m!1317521))

(assert (=> b!1426820 m!1317521))

(assert (=> b!1426820 m!1317509))

(declare-fun m!1317523 () Bool)

(assert (=> b!1426820 m!1317523))

(declare-fun m!1317525 () Bool)

(assert (=> start!123132 m!1317525))

(declare-fun m!1317527 () Bool)

(assert (=> start!123132 m!1317527))

(declare-fun m!1317529 () Bool)

(assert (=> b!1426822 m!1317529))

(push 1)

(assert (not b!1426819))

(assert (not b!1426821))

(assert (not start!123132))

(assert (not b!1426822))

(assert (not b!1426817))

(assert (not b!1426820))

(assert (not b!1426823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

