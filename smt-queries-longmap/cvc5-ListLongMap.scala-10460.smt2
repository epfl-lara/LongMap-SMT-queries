; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122922 () Bool)

(assert start!122922)

(declare-fun b!1425819 () Bool)

(declare-fun res!961260 () Bool)

(declare-fun e!805478 () Bool)

(assert (=> b!1425819 (=> (not res!961260) (not e!805478))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97287 0))(
  ( (array!97288 (arr!46961 (Array (_ BitVec 32) (_ BitVec 64))) (size!47511 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97287)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425819 (= res!961260 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47511 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47511 a!2831))))))

(declare-fun b!1425820 () Bool)

(declare-fun e!805480 () Bool)

(assert (=> b!1425820 (= e!805480 false)))

(declare-fun lt!627918 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11240 0))(
  ( (MissingZero!11240 (index!47352 (_ BitVec 32))) (Found!11240 (index!47353 (_ BitVec 32))) (Intermediate!11240 (undefined!12052 Bool) (index!47354 (_ BitVec 32)) (x!128986 (_ BitVec 32))) (Undefined!11240) (MissingVacant!11240 (index!47355 (_ BitVec 32))) )
))
(declare-fun lt!627916 () SeekEntryResult!11240)

(declare-fun lt!627915 () array!97287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97287 (_ BitVec 32)) SeekEntryResult!11240)

(assert (=> b!1425820 (= lt!627916 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627918 lt!627915 mask!2608))))

(declare-fun b!1425821 () Bool)

(declare-fun res!961252 () Bool)

(assert (=> b!1425821 (=> (not res!961252) (not e!805480))))

(declare-fun lt!627917 () SeekEntryResult!11240)

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425821 (= res!961252 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46961 a!2831) j!81) a!2831 mask!2608) lt!627917))))

(declare-fun b!1425822 () Bool)

(declare-fun res!961261 () Bool)

(assert (=> b!1425822 (=> (not res!961261) (not e!805478))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425822 (= res!961261 (validKeyInArray!0 (select (arr!46961 a!2831) i!982)))))

(declare-fun b!1425823 () Bool)

(declare-fun e!805481 () Bool)

(assert (=> b!1425823 (= e!805478 e!805481)))

(declare-fun res!961259 () Bool)

(assert (=> b!1425823 (=> (not res!961259) (not e!805481))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425823 (= res!961259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46961 a!2831) j!81) mask!2608) (select (arr!46961 a!2831) j!81) a!2831 mask!2608) lt!627917))))

(assert (=> b!1425823 (= lt!627917 (Intermediate!11240 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425824 () Bool)

(declare-fun res!961254 () Bool)

(assert (=> b!1425824 (=> (not res!961254) (not e!805478))))

(assert (=> b!1425824 (= res!961254 (and (= (size!47511 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47511 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47511 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425825 () Bool)

(assert (=> b!1425825 (= e!805481 e!805480)))

(declare-fun res!961257 () Bool)

(assert (=> b!1425825 (=> (not res!961257) (not e!805480))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425825 (= res!961257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627918 mask!2608) lt!627918 lt!627915 mask!2608) (Intermediate!11240 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425825 (= lt!627918 (select (store (arr!46961 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425825 (= lt!627915 (array!97288 (store (arr!46961 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47511 a!2831)))))

(declare-fun b!1425826 () Bool)

(declare-fun res!961258 () Bool)

(assert (=> b!1425826 (=> (not res!961258) (not e!805478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97287 (_ BitVec 32)) Bool)

(assert (=> b!1425826 (= res!961258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425827 () Bool)

(declare-fun res!961255 () Bool)

(assert (=> b!1425827 (=> (not res!961255) (not e!805478))))

(declare-datatypes ((List!33471 0))(
  ( (Nil!33468) (Cons!33467 (h!34769 (_ BitVec 64)) (t!48165 List!33471)) )
))
(declare-fun arrayNoDuplicates!0 (array!97287 (_ BitVec 32) List!33471) Bool)

(assert (=> b!1425827 (= res!961255 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33468))))

(declare-fun b!1425828 () Bool)

(declare-fun res!961256 () Bool)

(assert (=> b!1425828 (=> (not res!961256) (not e!805478))))

(assert (=> b!1425828 (= res!961256 (validKeyInArray!0 (select (arr!46961 a!2831) j!81)))))

(declare-fun res!961253 () Bool)

(assert (=> start!122922 (=> (not res!961253) (not e!805478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122922 (= res!961253 (validMask!0 mask!2608))))

(assert (=> start!122922 e!805478))

(assert (=> start!122922 true))

(declare-fun array_inv!35989 (array!97287) Bool)

(assert (=> start!122922 (array_inv!35989 a!2831)))

(assert (= (and start!122922 res!961253) b!1425824))

(assert (= (and b!1425824 res!961254) b!1425822))

(assert (= (and b!1425822 res!961261) b!1425828))

(assert (= (and b!1425828 res!961256) b!1425826))

(assert (= (and b!1425826 res!961258) b!1425827))

(assert (= (and b!1425827 res!961255) b!1425819))

(assert (= (and b!1425819 res!961260) b!1425823))

(assert (= (and b!1425823 res!961259) b!1425825))

(assert (= (and b!1425825 res!961257) b!1425821))

(assert (= (and b!1425821 res!961252) b!1425820))

(declare-fun m!1316427 () Bool)

(assert (=> b!1425825 m!1316427))

(assert (=> b!1425825 m!1316427))

(declare-fun m!1316429 () Bool)

(assert (=> b!1425825 m!1316429))

(declare-fun m!1316431 () Bool)

(assert (=> b!1425825 m!1316431))

(declare-fun m!1316433 () Bool)

(assert (=> b!1425825 m!1316433))

(declare-fun m!1316435 () Bool)

(assert (=> b!1425823 m!1316435))

(assert (=> b!1425823 m!1316435))

(declare-fun m!1316437 () Bool)

(assert (=> b!1425823 m!1316437))

(assert (=> b!1425823 m!1316437))

(assert (=> b!1425823 m!1316435))

(declare-fun m!1316439 () Bool)

(assert (=> b!1425823 m!1316439))

(declare-fun m!1316441 () Bool)

(assert (=> start!122922 m!1316441))

(declare-fun m!1316443 () Bool)

(assert (=> start!122922 m!1316443))

(declare-fun m!1316445 () Bool)

(assert (=> b!1425822 m!1316445))

(assert (=> b!1425822 m!1316445))

(declare-fun m!1316447 () Bool)

(assert (=> b!1425822 m!1316447))

(assert (=> b!1425821 m!1316435))

(assert (=> b!1425821 m!1316435))

(declare-fun m!1316449 () Bool)

(assert (=> b!1425821 m!1316449))

(assert (=> b!1425828 m!1316435))

(assert (=> b!1425828 m!1316435))

(declare-fun m!1316451 () Bool)

(assert (=> b!1425828 m!1316451))

(declare-fun m!1316453 () Bool)

(assert (=> b!1425827 m!1316453))

(declare-fun m!1316455 () Bool)

(assert (=> b!1425826 m!1316455))

(declare-fun m!1316457 () Bool)

(assert (=> b!1425820 m!1316457))

(push 1)

