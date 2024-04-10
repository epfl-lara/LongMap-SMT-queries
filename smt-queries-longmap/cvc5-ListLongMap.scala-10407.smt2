; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122604 () Bool)

(assert start!122604)

(declare-fun res!955490 () Bool)

(declare-fun e!803288 () Bool)

(assert (=> start!122604 (=> (not res!955490) (not e!803288))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122604 (= res!955490 (validMask!0 mask!2608))))

(assert (=> start!122604 e!803288))

(assert (=> start!122604 true))

(declare-datatypes ((array!96969 0))(
  ( (array!96970 (arr!46802 (Array (_ BitVec 32) (_ BitVec 64))) (size!47352 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96969)

(declare-fun array_inv!35830 (array!96969) Bool)

(assert (=> start!122604 (array_inv!35830 a!2831)))

(declare-fun b!1420055 () Bool)

(declare-fun res!955492 () Bool)

(assert (=> b!1420055 (=> (not res!955492) (not e!803288))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420055 (= res!955492 (and (= (size!47352 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47352 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47352 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420056 () Bool)

(declare-fun res!955491 () Bool)

(assert (=> b!1420056 (=> (not res!955491) (not e!803288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420056 (= res!955491 (validKeyInArray!0 (select (arr!46802 a!2831) j!81)))))

(declare-fun b!1420057 () Bool)

(declare-fun res!955494 () Bool)

(assert (=> b!1420057 (=> (not res!955494) (not e!803288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96969 (_ BitVec 32)) Bool)

(assert (=> b!1420057 (= res!955494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420058 () Bool)

(declare-fun res!955488 () Bool)

(assert (=> b!1420058 (=> (not res!955488) (not e!803288))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11087 0))(
  ( (MissingZero!11087 (index!46740 (_ BitVec 32))) (Found!11087 (index!46741 (_ BitVec 32))) (Intermediate!11087 (undefined!11899 Bool) (index!46742 (_ BitVec 32)) (x!128409 (_ BitVec 32))) (Undefined!11087) (MissingVacant!11087 (index!46743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96969 (_ BitVec 32)) SeekEntryResult!11087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420058 (= res!955488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46802 a!2831) j!81) mask!2608) (select (arr!46802 a!2831) j!81) a!2831 mask!2608) (Intermediate!11087 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420059 () Bool)

(declare-fun res!955493 () Bool)

(assert (=> b!1420059 (=> (not res!955493) (not e!803288))))

(declare-datatypes ((List!33312 0))(
  ( (Nil!33309) (Cons!33308 (h!34610 (_ BitVec 64)) (t!48006 List!33312)) )
))
(declare-fun arrayNoDuplicates!0 (array!96969 (_ BitVec 32) List!33312) Bool)

(assert (=> b!1420059 (= res!955493 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33309))))

(declare-fun b!1420060 () Bool)

(declare-fun res!955489 () Bool)

(assert (=> b!1420060 (=> (not res!955489) (not e!803288))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420060 (= res!955489 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47352 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47352 a!2831))))))

(declare-fun b!1420061 () Bool)

(assert (=> b!1420061 (= e!803288 false)))

(declare-fun lt!625875 () SeekEntryResult!11087)

(assert (=> b!1420061 (= lt!625875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46802 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46802 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96970 (store (arr!46802 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47352 a!2831)) mask!2608))))

(declare-fun b!1420062 () Bool)

(declare-fun res!955495 () Bool)

(assert (=> b!1420062 (=> (not res!955495) (not e!803288))))

(assert (=> b!1420062 (= res!955495 (validKeyInArray!0 (select (arr!46802 a!2831) i!982)))))

(assert (= (and start!122604 res!955490) b!1420055))

(assert (= (and b!1420055 res!955492) b!1420062))

(assert (= (and b!1420062 res!955495) b!1420056))

(assert (= (and b!1420056 res!955491) b!1420057))

(assert (= (and b!1420057 res!955494) b!1420059))

(assert (= (and b!1420059 res!955493) b!1420060))

(assert (= (and b!1420060 res!955489) b!1420058))

(assert (= (and b!1420058 res!955488) b!1420061))

(declare-fun m!1310541 () Bool)

(assert (=> b!1420062 m!1310541))

(assert (=> b!1420062 m!1310541))

(declare-fun m!1310543 () Bool)

(assert (=> b!1420062 m!1310543))

(declare-fun m!1310545 () Bool)

(assert (=> b!1420056 m!1310545))

(assert (=> b!1420056 m!1310545))

(declare-fun m!1310547 () Bool)

(assert (=> b!1420056 m!1310547))

(declare-fun m!1310549 () Bool)

(assert (=> start!122604 m!1310549))

(declare-fun m!1310551 () Bool)

(assert (=> start!122604 m!1310551))

(declare-fun m!1310553 () Bool)

(assert (=> b!1420061 m!1310553))

(declare-fun m!1310555 () Bool)

(assert (=> b!1420061 m!1310555))

(assert (=> b!1420061 m!1310555))

(declare-fun m!1310557 () Bool)

(assert (=> b!1420061 m!1310557))

(assert (=> b!1420061 m!1310557))

(assert (=> b!1420061 m!1310555))

(declare-fun m!1310559 () Bool)

(assert (=> b!1420061 m!1310559))

(declare-fun m!1310561 () Bool)

(assert (=> b!1420057 m!1310561))

(assert (=> b!1420058 m!1310545))

(assert (=> b!1420058 m!1310545))

(declare-fun m!1310563 () Bool)

(assert (=> b!1420058 m!1310563))

(assert (=> b!1420058 m!1310563))

(assert (=> b!1420058 m!1310545))

(declare-fun m!1310565 () Bool)

(assert (=> b!1420058 m!1310565))

(declare-fun m!1310567 () Bool)

(assert (=> b!1420059 m!1310567))

(push 1)

(assert (not b!1420061))

(assert (not start!122604))

(assert (not b!1420058))

(assert (not b!1420059))

(assert (not b!1420062))

(assert (not b!1420057))

(assert (not b!1420056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

