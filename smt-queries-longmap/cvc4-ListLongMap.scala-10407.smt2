; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122608 () Bool)

(assert start!122608)

(declare-fun b!1420103 () Bool)

(declare-fun res!955539 () Bool)

(declare-fun e!803299 () Bool)

(assert (=> b!1420103 (=> (not res!955539) (not e!803299))))

(declare-datatypes ((array!96973 0))(
  ( (array!96974 (arr!46804 (Array (_ BitVec 32) (_ BitVec 64))) (size!47354 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96973)

(declare-datatypes ((List!33314 0))(
  ( (Nil!33311) (Cons!33310 (h!34612 (_ BitVec 64)) (t!48008 List!33314)) )
))
(declare-fun arrayNoDuplicates!0 (array!96973 (_ BitVec 32) List!33314) Bool)

(assert (=> b!1420103 (= res!955539 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33311))))

(declare-fun b!1420104 () Bool)

(declare-fun res!955541 () Bool)

(assert (=> b!1420104 (=> (not res!955541) (not e!803299))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420104 (= res!955541 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47354 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47354 a!2831))))))

(declare-fun b!1420105 () Bool)

(declare-fun res!955536 () Bool)

(assert (=> b!1420105 (=> (not res!955536) (not e!803299))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420105 (= res!955536 (and (= (size!47354 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47354 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47354 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!955537 () Bool)

(assert (=> start!122608 (=> (not res!955537) (not e!803299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122608 (= res!955537 (validMask!0 mask!2608))))

(assert (=> start!122608 e!803299))

(assert (=> start!122608 true))

(declare-fun array_inv!35832 (array!96973) Bool)

(assert (=> start!122608 (array_inv!35832 a!2831)))

(declare-fun b!1420106 () Bool)

(declare-fun res!955540 () Bool)

(assert (=> b!1420106 (=> (not res!955540) (not e!803299))))

(declare-datatypes ((SeekEntryResult!11089 0))(
  ( (MissingZero!11089 (index!46748 (_ BitVec 32))) (Found!11089 (index!46749 (_ BitVec 32))) (Intermediate!11089 (undefined!11901 Bool) (index!46750 (_ BitVec 32)) (x!128411 (_ BitVec 32))) (Undefined!11089) (MissingVacant!11089 (index!46751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96973 (_ BitVec 32)) SeekEntryResult!11089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420106 (= res!955540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46804 a!2831) j!81) mask!2608) (select (arr!46804 a!2831) j!81) a!2831 mask!2608) (Intermediate!11089 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420107 () Bool)

(declare-fun res!955543 () Bool)

(assert (=> b!1420107 (=> (not res!955543) (not e!803299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420107 (= res!955543 (validKeyInArray!0 (select (arr!46804 a!2831) i!982)))))

(declare-fun b!1420108 () Bool)

(assert (=> b!1420108 (= e!803299 false)))

(declare-fun lt!625881 () SeekEntryResult!11089)

(assert (=> b!1420108 (= lt!625881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46804 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46804 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96974 (store (arr!46804 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47354 a!2831)) mask!2608))))

(declare-fun b!1420109 () Bool)

(declare-fun res!955538 () Bool)

(assert (=> b!1420109 (=> (not res!955538) (not e!803299))))

(assert (=> b!1420109 (= res!955538 (validKeyInArray!0 (select (arr!46804 a!2831) j!81)))))

(declare-fun b!1420110 () Bool)

(declare-fun res!955542 () Bool)

(assert (=> b!1420110 (=> (not res!955542) (not e!803299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96973 (_ BitVec 32)) Bool)

(assert (=> b!1420110 (= res!955542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122608 res!955537) b!1420105))

(assert (= (and b!1420105 res!955536) b!1420107))

(assert (= (and b!1420107 res!955543) b!1420109))

(assert (= (and b!1420109 res!955538) b!1420110))

(assert (= (and b!1420110 res!955542) b!1420103))

(assert (= (and b!1420103 res!955539) b!1420104))

(assert (= (and b!1420104 res!955541) b!1420106))

(assert (= (and b!1420106 res!955540) b!1420108))

(declare-fun m!1310597 () Bool)

(assert (=> b!1420107 m!1310597))

(assert (=> b!1420107 m!1310597))

(declare-fun m!1310599 () Bool)

(assert (=> b!1420107 m!1310599))

(declare-fun m!1310601 () Bool)

(assert (=> b!1420103 m!1310601))

(declare-fun m!1310603 () Bool)

(assert (=> b!1420108 m!1310603))

(declare-fun m!1310605 () Bool)

(assert (=> b!1420108 m!1310605))

(assert (=> b!1420108 m!1310605))

(declare-fun m!1310607 () Bool)

(assert (=> b!1420108 m!1310607))

(assert (=> b!1420108 m!1310607))

(assert (=> b!1420108 m!1310605))

(declare-fun m!1310609 () Bool)

(assert (=> b!1420108 m!1310609))

(declare-fun m!1310611 () Bool)

(assert (=> b!1420110 m!1310611))

(declare-fun m!1310613 () Bool)

(assert (=> b!1420109 m!1310613))

(assert (=> b!1420109 m!1310613))

(declare-fun m!1310615 () Bool)

(assert (=> b!1420109 m!1310615))

(assert (=> b!1420106 m!1310613))

(assert (=> b!1420106 m!1310613))

(declare-fun m!1310617 () Bool)

(assert (=> b!1420106 m!1310617))

(assert (=> b!1420106 m!1310617))

(assert (=> b!1420106 m!1310613))

(declare-fun m!1310619 () Bool)

(assert (=> b!1420106 m!1310619))

(declare-fun m!1310621 () Bool)

(assert (=> start!122608 m!1310621))

(declare-fun m!1310623 () Bool)

(assert (=> start!122608 m!1310623))

(push 1)

(assert (not b!1420103))

(assert (not b!1420106))

(assert (not start!122608))

(assert (not b!1420107))

(assert (not b!1420109))

(assert (not b!1420108))

(assert (not b!1420110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

