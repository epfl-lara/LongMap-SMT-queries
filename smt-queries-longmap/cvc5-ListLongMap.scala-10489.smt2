; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123510 () Bool)

(assert start!123510)

(declare-fun b!1431563 () Bool)

(declare-fun e!808225 () Bool)

(declare-fun e!808226 () Bool)

(assert (=> b!1431563 (= e!808225 (not e!808226))))

(declare-fun res!965429 () Bool)

(assert (=> b!1431563 (=> res!965429 e!808226)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97482 0))(
  ( (array!97483 (arr!47048 (Array (_ BitVec 32) (_ BitVec 64))) (size!47598 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97482)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431563 (= res!965429 (or (= (select (arr!47048 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47048 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47048 a!2831) index!585) (select (arr!47048 a!2831) j!81)) (= (select (store (arr!47048 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808229 () Bool)

(assert (=> b!1431563 e!808229))

(declare-fun res!965433 () Bool)

(assert (=> b!1431563 (=> (not res!965433) (not e!808229))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97482 (_ BitVec 32)) Bool)

(assert (=> b!1431563 (= res!965433 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48400 0))(
  ( (Unit!48401) )
))
(declare-fun lt!630217 () Unit!48400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48400)

(assert (=> b!1431563 (= lt!630217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!965428 () Bool)

(declare-fun e!808224 () Bool)

(assert (=> start!123510 (=> (not res!965428) (not e!808224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123510 (= res!965428 (validMask!0 mask!2608))))

(assert (=> start!123510 e!808224))

(assert (=> start!123510 true))

(declare-fun array_inv!36076 (array!97482) Bool)

(assert (=> start!123510 (array_inv!36076 a!2831)))

(declare-fun b!1431564 () Bool)

(declare-fun e!808228 () Bool)

(assert (=> b!1431564 (= e!808224 e!808228)))

(declare-fun res!965432 () Bool)

(assert (=> b!1431564 (=> (not res!965432) (not e!808228))))

(declare-datatypes ((SeekEntryResult!11327 0))(
  ( (MissingZero!11327 (index!47700 (_ BitVec 32))) (Found!11327 (index!47701 (_ BitVec 32))) (Intermediate!11327 (undefined!12139 Bool) (index!47702 (_ BitVec 32)) (x!129353 (_ BitVec 32))) (Undefined!11327) (MissingVacant!11327 (index!47703 (_ BitVec 32))) )
))
(declare-fun lt!630220 () SeekEntryResult!11327)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97482 (_ BitVec 32)) SeekEntryResult!11327)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431564 (= res!965432 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47048 a!2831) j!81) mask!2608) (select (arr!47048 a!2831) j!81) a!2831 mask!2608) lt!630220))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431564 (= lt!630220 (Intermediate!11327 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431565 () Bool)

(declare-fun res!965435 () Bool)

(assert (=> b!1431565 (=> (not res!965435) (not e!808224))))

(assert (=> b!1431565 (= res!965435 (and (= (size!47598 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47598 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47598 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431566 () Bool)

(declare-fun res!965439 () Bool)

(assert (=> b!1431566 (=> (not res!965439) (not e!808225))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!630219 () array!97482)

(declare-fun lt!630222 () (_ BitVec 64))

(declare-fun lt!630218 () SeekEntryResult!11327)

(assert (=> b!1431566 (= res!965439 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630222 lt!630219 mask!2608) lt!630218))))

(declare-fun b!1431567 () Bool)

(declare-fun res!965438 () Bool)

(assert (=> b!1431567 (=> (not res!965438) (not e!808224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431567 (= res!965438 (validKeyInArray!0 (select (arr!47048 a!2831) j!81)))))

(declare-fun b!1431568 () Bool)

(declare-fun res!965440 () Bool)

(assert (=> b!1431568 (=> (not res!965440) (not e!808224))))

(assert (=> b!1431568 (= res!965440 (validKeyInArray!0 (select (arr!47048 a!2831) i!982)))))

(declare-fun b!1431569 () Bool)

(declare-fun res!965430 () Bool)

(assert (=> b!1431569 (=> (not res!965430) (not e!808225))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431569 (= res!965430 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431570 () Bool)

(declare-fun res!965434 () Bool)

(assert (=> b!1431570 (=> (not res!965434) (not e!808224))))

(assert (=> b!1431570 (= res!965434 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47598 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47598 a!2831))))))

(declare-fun b!1431571 () Bool)

(declare-fun res!965436 () Bool)

(assert (=> b!1431571 (=> (not res!965436) (not e!808224))))

(assert (=> b!1431571 (= res!965436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431572 () Bool)

(declare-fun res!965427 () Bool)

(assert (=> b!1431572 (=> (not res!965427) (not e!808225))))

(assert (=> b!1431572 (= res!965427 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47048 a!2831) j!81) a!2831 mask!2608) lt!630220))))

(declare-fun b!1431573 () Bool)

(assert (=> b!1431573 (= e!808226 true)))

(declare-fun lt!630221 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431573 (= lt!630221 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431574 () Bool)

(assert (=> b!1431574 (= e!808228 e!808225)))

(declare-fun res!965437 () Bool)

(assert (=> b!1431574 (=> (not res!965437) (not e!808225))))

(assert (=> b!1431574 (= res!965437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630222 mask!2608) lt!630222 lt!630219 mask!2608) lt!630218))))

(assert (=> b!1431574 (= lt!630218 (Intermediate!11327 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431574 (= lt!630222 (select (store (arr!47048 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431574 (= lt!630219 (array!97483 (store (arr!47048 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47598 a!2831)))))

(declare-fun b!1431575 () Bool)

(declare-fun res!965431 () Bool)

(assert (=> b!1431575 (=> (not res!965431) (not e!808224))))

(declare-datatypes ((List!33558 0))(
  ( (Nil!33555) (Cons!33554 (h!34877 (_ BitVec 64)) (t!48252 List!33558)) )
))
(declare-fun arrayNoDuplicates!0 (array!97482 (_ BitVec 32) List!33558) Bool)

(assert (=> b!1431575 (= res!965431 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33555))))

(declare-fun b!1431576 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97482 (_ BitVec 32)) SeekEntryResult!11327)

(assert (=> b!1431576 (= e!808229 (= (seekEntryOrOpen!0 (select (arr!47048 a!2831) j!81) a!2831 mask!2608) (Found!11327 j!81)))))

(assert (= (and start!123510 res!965428) b!1431565))

(assert (= (and b!1431565 res!965435) b!1431568))

(assert (= (and b!1431568 res!965440) b!1431567))

(assert (= (and b!1431567 res!965438) b!1431571))

(assert (= (and b!1431571 res!965436) b!1431575))

(assert (= (and b!1431575 res!965431) b!1431570))

(assert (= (and b!1431570 res!965434) b!1431564))

(assert (= (and b!1431564 res!965432) b!1431574))

(assert (= (and b!1431574 res!965437) b!1431572))

(assert (= (and b!1431572 res!965427) b!1431566))

(assert (= (and b!1431566 res!965439) b!1431569))

(assert (= (and b!1431569 res!965430) b!1431563))

(assert (= (and b!1431563 res!965433) b!1431576))

(assert (= (and b!1431563 (not res!965429)) b!1431573))

(declare-fun m!1321329 () Bool)

(assert (=> b!1431564 m!1321329))

(assert (=> b!1431564 m!1321329))

(declare-fun m!1321331 () Bool)

(assert (=> b!1431564 m!1321331))

(assert (=> b!1431564 m!1321331))

(assert (=> b!1431564 m!1321329))

(declare-fun m!1321333 () Bool)

(assert (=> b!1431564 m!1321333))

(assert (=> b!1431572 m!1321329))

(assert (=> b!1431572 m!1321329))

(declare-fun m!1321335 () Bool)

(assert (=> b!1431572 m!1321335))

(declare-fun m!1321337 () Bool)

(assert (=> b!1431566 m!1321337))

(declare-fun m!1321339 () Bool)

(assert (=> b!1431563 m!1321339))

(declare-fun m!1321341 () Bool)

(assert (=> b!1431563 m!1321341))

(declare-fun m!1321343 () Bool)

(assert (=> b!1431563 m!1321343))

(declare-fun m!1321345 () Bool)

(assert (=> b!1431563 m!1321345))

(assert (=> b!1431563 m!1321329))

(declare-fun m!1321347 () Bool)

(assert (=> b!1431563 m!1321347))

(assert (=> b!1431567 m!1321329))

(assert (=> b!1431567 m!1321329))

(declare-fun m!1321349 () Bool)

(assert (=> b!1431567 m!1321349))

(declare-fun m!1321351 () Bool)

(assert (=> b!1431574 m!1321351))

(assert (=> b!1431574 m!1321351))

(declare-fun m!1321353 () Bool)

(assert (=> b!1431574 m!1321353))

(assert (=> b!1431574 m!1321339))

(declare-fun m!1321355 () Bool)

(assert (=> b!1431574 m!1321355))

(declare-fun m!1321357 () Bool)

(assert (=> b!1431568 m!1321357))

(assert (=> b!1431568 m!1321357))

(declare-fun m!1321359 () Bool)

(assert (=> b!1431568 m!1321359))

(declare-fun m!1321361 () Bool)

(assert (=> b!1431571 m!1321361))

(assert (=> b!1431576 m!1321329))

(assert (=> b!1431576 m!1321329))

(declare-fun m!1321363 () Bool)

(assert (=> b!1431576 m!1321363))

(declare-fun m!1321365 () Bool)

(assert (=> b!1431575 m!1321365))

(declare-fun m!1321367 () Bool)

(assert (=> start!123510 m!1321367))

(declare-fun m!1321369 () Bool)

(assert (=> start!123510 m!1321369))

(declare-fun m!1321371 () Bool)

(assert (=> b!1431573 m!1321371))

(push 1)

