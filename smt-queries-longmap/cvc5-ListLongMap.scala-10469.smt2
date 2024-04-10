; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123084 () Bool)

(assert start!123084)

(declare-fun b!1427388 () Bool)

(declare-fun res!962428 () Bool)

(declare-fun e!806212 () Bool)

(assert (=> b!1427388 (=> (not res!962428) (not e!806212))))

(declare-datatypes ((array!97347 0))(
  ( (array!97348 (arr!46988 (Array (_ BitVec 32) (_ BitVec 64))) (size!47538 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97347)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427388 (= res!962428 (validKeyInArray!0 (select (arr!46988 a!2831) i!982)))))

(declare-fun b!1427389 () Bool)

(declare-fun e!806211 () Bool)

(assert (=> b!1427389 (= e!806212 e!806211)))

(declare-fun res!962423 () Bool)

(assert (=> b!1427389 (=> (not res!962423) (not e!806211))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11267 0))(
  ( (MissingZero!11267 (index!47460 (_ BitVec 32))) (Found!11267 (index!47461 (_ BitVec 32))) (Intermediate!11267 (undefined!12079 Bool) (index!47462 (_ BitVec 32)) (x!129097 (_ BitVec 32))) (Undefined!11267) (MissingVacant!11267 (index!47463 (_ BitVec 32))) )
))
(declare-fun lt!628554 () SeekEntryResult!11267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97347 (_ BitVec 32)) SeekEntryResult!11267)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427389 (= res!962423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46988 a!2831) j!81) mask!2608) (select (arr!46988 a!2831) j!81) a!2831 mask!2608) lt!628554))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427389 (= lt!628554 (Intermediate!11267 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427390 () Bool)

(declare-fun res!962420 () Bool)

(assert (=> b!1427390 (=> (not res!962420) (not e!806212))))

(declare-datatypes ((List!33498 0))(
  ( (Nil!33495) (Cons!33494 (h!34802 (_ BitVec 64)) (t!48192 List!33498)) )
))
(declare-fun arrayNoDuplicates!0 (array!97347 (_ BitVec 32) List!33498) Bool)

(assert (=> b!1427390 (= res!962420 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33495))))

(declare-fun b!1427391 () Bool)

(declare-fun res!962424 () Bool)

(declare-fun e!806213 () Bool)

(assert (=> b!1427391 (=> (not res!962424) (not e!806213))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1427391 (= res!962424 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427392 () Bool)

(assert (=> b!1427392 (= e!806213 (not true))))

(declare-fun e!806210 () Bool)

(assert (=> b!1427392 e!806210))

(declare-fun res!962419 () Bool)

(assert (=> b!1427392 (=> (not res!962419) (not e!806210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97347 (_ BitVec 32)) Bool)

(assert (=> b!1427392 (= res!962419 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48280 0))(
  ( (Unit!48281) )
))
(declare-fun lt!628550 () Unit!48280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48280)

(assert (=> b!1427392 (= lt!628550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427393 () Bool)

(declare-fun res!962431 () Bool)

(assert (=> b!1427393 (=> (not res!962431) (not e!806212))))

(assert (=> b!1427393 (= res!962431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427394 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97347 (_ BitVec 32)) SeekEntryResult!11267)

(assert (=> b!1427394 (= e!806210 (= (seekEntryOrOpen!0 (select (arr!46988 a!2831) j!81) a!2831 mask!2608) (Found!11267 j!81)))))

(declare-fun b!1427395 () Bool)

(declare-fun res!962429 () Bool)

(assert (=> b!1427395 (=> (not res!962429) (not e!806212))))

(assert (=> b!1427395 (= res!962429 (validKeyInArray!0 (select (arr!46988 a!2831) j!81)))))

(declare-fun b!1427396 () Bool)

(declare-fun res!962422 () Bool)

(assert (=> b!1427396 (=> (not res!962422) (not e!806213))))

(declare-fun lt!628552 () (_ BitVec 64))

(declare-fun lt!628553 () array!97347)

(declare-fun lt!628551 () SeekEntryResult!11267)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427396 (= res!962422 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628552 lt!628553 mask!2608) lt!628551))))

(declare-fun b!1427397 () Bool)

(declare-fun res!962421 () Bool)

(assert (=> b!1427397 (=> (not res!962421) (not e!806213))))

(assert (=> b!1427397 (= res!962421 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46988 a!2831) j!81) a!2831 mask!2608) lt!628554))))

(declare-fun res!962425 () Bool)

(assert (=> start!123084 (=> (not res!962425) (not e!806212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123084 (= res!962425 (validMask!0 mask!2608))))

(assert (=> start!123084 e!806212))

(assert (=> start!123084 true))

(declare-fun array_inv!36016 (array!97347) Bool)

(assert (=> start!123084 (array_inv!36016 a!2831)))

(declare-fun b!1427398 () Bool)

(declare-fun res!962426 () Bool)

(assert (=> b!1427398 (=> (not res!962426) (not e!806212))))

(assert (=> b!1427398 (= res!962426 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47538 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47538 a!2831))))))

(declare-fun b!1427399 () Bool)

(declare-fun res!962427 () Bool)

(assert (=> b!1427399 (=> (not res!962427) (not e!806212))))

(assert (=> b!1427399 (= res!962427 (and (= (size!47538 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47538 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47538 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427400 () Bool)

(assert (=> b!1427400 (= e!806211 e!806213)))

(declare-fun res!962430 () Bool)

(assert (=> b!1427400 (=> (not res!962430) (not e!806213))))

(assert (=> b!1427400 (= res!962430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628552 mask!2608) lt!628552 lt!628553 mask!2608) lt!628551))))

(assert (=> b!1427400 (= lt!628551 (Intermediate!11267 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427400 (= lt!628552 (select (store (arr!46988 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427400 (= lt!628553 (array!97348 (store (arr!46988 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47538 a!2831)))))

(assert (= (and start!123084 res!962425) b!1427399))

(assert (= (and b!1427399 res!962427) b!1427388))

(assert (= (and b!1427388 res!962428) b!1427395))

(assert (= (and b!1427395 res!962429) b!1427393))

(assert (= (and b!1427393 res!962431) b!1427390))

(assert (= (and b!1427390 res!962420) b!1427398))

(assert (= (and b!1427398 res!962426) b!1427389))

(assert (= (and b!1427389 res!962423) b!1427400))

(assert (= (and b!1427400 res!962430) b!1427397))

(assert (= (and b!1427397 res!962421) b!1427396))

(assert (= (and b!1427396 res!962422) b!1427391))

(assert (= (and b!1427391 res!962424) b!1427392))

(assert (= (and b!1427392 res!962419) b!1427394))

(declare-fun m!1317759 () Bool)

(assert (=> b!1427395 m!1317759))

(assert (=> b!1427395 m!1317759))

(declare-fun m!1317761 () Bool)

(assert (=> b!1427395 m!1317761))

(assert (=> b!1427397 m!1317759))

(assert (=> b!1427397 m!1317759))

(declare-fun m!1317763 () Bool)

(assert (=> b!1427397 m!1317763))

(declare-fun m!1317765 () Bool)

(assert (=> start!123084 m!1317765))

(declare-fun m!1317767 () Bool)

(assert (=> start!123084 m!1317767))

(declare-fun m!1317769 () Bool)

(assert (=> b!1427400 m!1317769))

(assert (=> b!1427400 m!1317769))

(declare-fun m!1317771 () Bool)

(assert (=> b!1427400 m!1317771))

(declare-fun m!1317773 () Bool)

(assert (=> b!1427400 m!1317773))

(declare-fun m!1317775 () Bool)

(assert (=> b!1427400 m!1317775))

(declare-fun m!1317777 () Bool)

(assert (=> b!1427393 m!1317777))

(declare-fun m!1317779 () Bool)

(assert (=> b!1427392 m!1317779))

(declare-fun m!1317781 () Bool)

(assert (=> b!1427392 m!1317781))

(assert (=> b!1427389 m!1317759))

(assert (=> b!1427389 m!1317759))

(declare-fun m!1317783 () Bool)

(assert (=> b!1427389 m!1317783))

(assert (=> b!1427389 m!1317783))

(assert (=> b!1427389 m!1317759))

(declare-fun m!1317785 () Bool)

(assert (=> b!1427389 m!1317785))

(declare-fun m!1317787 () Bool)

(assert (=> b!1427396 m!1317787))

(declare-fun m!1317789 () Bool)

(assert (=> b!1427390 m!1317789))

(assert (=> b!1427394 m!1317759))

(assert (=> b!1427394 m!1317759))

(declare-fun m!1317791 () Bool)

(assert (=> b!1427394 m!1317791))

(declare-fun m!1317793 () Bool)

(assert (=> b!1427388 m!1317793))

(assert (=> b!1427388 m!1317793))

(declare-fun m!1317795 () Bool)

(assert (=> b!1427388 m!1317795))

(push 1)

