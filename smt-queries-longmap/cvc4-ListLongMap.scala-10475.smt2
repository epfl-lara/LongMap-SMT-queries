; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123472 () Bool)

(assert start!123472)

(declare-fun b!1430196 () Bool)

(declare-fun e!807800 () Bool)

(assert (=> b!1430196 (= e!807800 (not true))))

(declare-fun e!807803 () Bool)

(assert (=> b!1430196 e!807803))

(declare-fun res!963942 () Bool)

(assert (=> b!1430196 (=> (not res!963942) (not e!807803))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97504 0))(
  ( (array!97505 (arr!47060 (Array (_ BitVec 32) (_ BitVec 64))) (size!47611 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97504)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97504 (_ BitVec 32)) Bool)

(assert (=> b!1430196 (= res!963942 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48259 0))(
  ( (Unit!48260) )
))
(declare-fun lt!629633 () Unit!48259)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48259)

(assert (=> b!1430196 (= lt!629633 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430197 () Bool)

(declare-fun res!963950 () Bool)

(declare-fun e!807801 () Bool)

(assert (=> b!1430197 (=> (not res!963950) (not e!807801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430197 (= res!963950 (validKeyInArray!0 (select (arr!47060 a!2831) j!81)))))

(declare-fun b!1430198 () Bool)

(declare-fun res!963946 () Bool)

(assert (=> b!1430198 (=> (not res!963946) (not e!807801))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430198 (= res!963946 (validKeyInArray!0 (select (arr!47060 a!2831) i!982)))))

(declare-fun b!1430199 () Bool)

(declare-fun res!963949 () Bool)

(assert (=> b!1430199 (=> (not res!963949) (not e!807800))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430199 (= res!963949 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430200 () Bool)

(declare-fun res!963948 () Bool)

(assert (=> b!1430200 (=> (not res!963948) (not e!807801))))

(assert (=> b!1430200 (= res!963948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430201 () Bool)

(declare-fun res!963945 () Bool)

(assert (=> b!1430201 (=> (not res!963945) (not e!807801))))

(assert (=> b!1430201 (= res!963945 (and (= (size!47611 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47611 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47611 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430202 () Bool)

(declare-fun res!963943 () Bool)

(assert (=> b!1430202 (=> (not res!963943) (not e!807801))))

(declare-datatypes ((List!33557 0))(
  ( (Nil!33554) (Cons!33553 (h!34878 (_ BitVec 64)) (t!48243 List!33557)) )
))
(declare-fun arrayNoDuplicates!0 (array!97504 (_ BitVec 32) List!33557) Bool)

(assert (=> b!1430202 (= res!963943 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33554))))

(declare-fun b!1430203 () Bool)

(declare-fun e!807799 () Bool)

(assert (=> b!1430203 (= e!807801 e!807799)))

(declare-fun res!963944 () Bool)

(assert (=> b!1430203 (=> (not res!963944) (not e!807799))))

(declare-datatypes ((SeekEntryResult!11241 0))(
  ( (MissingZero!11241 (index!47356 (_ BitVec 32))) (Found!11241 (index!47357 (_ BitVec 32))) (Intermediate!11241 (undefined!12053 Bool) (index!47358 (_ BitVec 32)) (x!129156 (_ BitVec 32))) (Undefined!11241) (MissingVacant!11241 (index!47359 (_ BitVec 32))) )
))
(declare-fun lt!629630 () SeekEntryResult!11241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97504 (_ BitVec 32)) SeekEntryResult!11241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430203 (= res!963944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47060 a!2831) j!81) mask!2608) (select (arr!47060 a!2831) j!81) a!2831 mask!2608) lt!629630))))

(assert (=> b!1430203 (= lt!629630 (Intermediate!11241 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430204 () Bool)

(declare-fun res!963952 () Bool)

(assert (=> b!1430204 (=> (not res!963952) (not e!807800))))

(declare-fun lt!629632 () SeekEntryResult!11241)

(declare-fun lt!629629 () array!97504)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!629631 () (_ BitVec 64))

(assert (=> b!1430204 (= res!963952 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629631 lt!629629 mask!2608) lt!629632))))

(declare-fun res!963941 () Bool)

(assert (=> start!123472 (=> (not res!963941) (not e!807801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123472 (= res!963941 (validMask!0 mask!2608))))

(assert (=> start!123472 e!807801))

(assert (=> start!123472 true))

(declare-fun array_inv!36341 (array!97504) Bool)

(assert (=> start!123472 (array_inv!36341 a!2831)))

(declare-fun b!1430205 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97504 (_ BitVec 32)) SeekEntryResult!11241)

(assert (=> b!1430205 (= e!807803 (= (seekEntryOrOpen!0 (select (arr!47060 a!2831) j!81) a!2831 mask!2608) (Found!11241 j!81)))))

(declare-fun b!1430206 () Bool)

(assert (=> b!1430206 (= e!807799 e!807800)))

(declare-fun res!963951 () Bool)

(assert (=> b!1430206 (=> (not res!963951) (not e!807800))))

(assert (=> b!1430206 (= res!963951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629631 mask!2608) lt!629631 lt!629629 mask!2608) lt!629632))))

(assert (=> b!1430206 (= lt!629632 (Intermediate!11241 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430206 (= lt!629631 (select (store (arr!47060 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430206 (= lt!629629 (array!97505 (store (arr!47060 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47611 a!2831)))))

(declare-fun b!1430207 () Bool)

(declare-fun res!963940 () Bool)

(assert (=> b!1430207 (=> (not res!963940) (not e!807800))))

(assert (=> b!1430207 (= res!963940 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47060 a!2831) j!81) a!2831 mask!2608) lt!629630))))

(declare-fun b!1430208 () Bool)

(declare-fun res!963947 () Bool)

(assert (=> b!1430208 (=> (not res!963947) (not e!807801))))

(assert (=> b!1430208 (= res!963947 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47611 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47611 a!2831))))))

(assert (= (and start!123472 res!963941) b!1430201))

(assert (= (and b!1430201 res!963945) b!1430198))

(assert (= (and b!1430198 res!963946) b!1430197))

(assert (= (and b!1430197 res!963950) b!1430200))

(assert (= (and b!1430200 res!963948) b!1430202))

(assert (= (and b!1430202 res!963943) b!1430208))

(assert (= (and b!1430208 res!963947) b!1430203))

(assert (= (and b!1430203 res!963944) b!1430206))

(assert (= (and b!1430206 res!963951) b!1430207))

(assert (= (and b!1430207 res!963940) b!1430204))

(assert (= (and b!1430204 res!963952) b!1430199))

(assert (= (and b!1430199 res!963949) b!1430196))

(assert (= (and b!1430196 res!963942) b!1430205))

(declare-fun m!1320431 () Bool)

(assert (=> b!1430205 m!1320431))

(assert (=> b!1430205 m!1320431))

(declare-fun m!1320433 () Bool)

(assert (=> b!1430205 m!1320433))

(declare-fun m!1320435 () Bool)

(assert (=> b!1430202 m!1320435))

(declare-fun m!1320437 () Bool)

(assert (=> b!1430204 m!1320437))

(declare-fun m!1320439 () Bool)

(assert (=> b!1430196 m!1320439))

(declare-fun m!1320441 () Bool)

(assert (=> b!1430196 m!1320441))

(declare-fun m!1320443 () Bool)

(assert (=> b!1430200 m!1320443))

(assert (=> b!1430203 m!1320431))

(assert (=> b!1430203 m!1320431))

(declare-fun m!1320445 () Bool)

(assert (=> b!1430203 m!1320445))

(assert (=> b!1430203 m!1320445))

(assert (=> b!1430203 m!1320431))

(declare-fun m!1320447 () Bool)

(assert (=> b!1430203 m!1320447))

(assert (=> b!1430207 m!1320431))

(assert (=> b!1430207 m!1320431))

(declare-fun m!1320449 () Bool)

(assert (=> b!1430207 m!1320449))

(declare-fun m!1320451 () Bool)

(assert (=> start!123472 m!1320451))

(declare-fun m!1320453 () Bool)

(assert (=> start!123472 m!1320453))

(assert (=> b!1430197 m!1320431))

(assert (=> b!1430197 m!1320431))

(declare-fun m!1320455 () Bool)

(assert (=> b!1430197 m!1320455))

(declare-fun m!1320457 () Bool)

(assert (=> b!1430198 m!1320457))

(assert (=> b!1430198 m!1320457))

(declare-fun m!1320459 () Bool)

(assert (=> b!1430198 m!1320459))

(declare-fun m!1320461 () Bool)

(assert (=> b!1430206 m!1320461))

(assert (=> b!1430206 m!1320461))

(declare-fun m!1320463 () Bool)

(assert (=> b!1430206 m!1320463))

(declare-fun m!1320465 () Bool)

(assert (=> b!1430206 m!1320465))

(declare-fun m!1320467 () Bool)

(assert (=> b!1430206 m!1320467))

(push 1)

(assert (not b!1430204))

(assert (not b!1430205))

(assert (not b!1430207))

(assert (not b!1430200))

(assert (not b!1430203))

(assert (not start!123472))

(assert (not b!1430196))

(assert (not b!1430202))

(assert (not b!1430197))

(assert (not b!1430198))

(assert (not b!1430206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

