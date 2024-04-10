; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123516 () Bool)

(assert start!123516)

(declare-fun b!1431690 () Bool)

(declare-fun res!965560 () Bool)

(declare-fun e!808282 () Bool)

(assert (=> b!1431690 (=> (not res!965560) (not e!808282))))

(declare-datatypes ((array!97488 0))(
  ( (array!97489 (arr!47051 (Array (_ BitVec 32) (_ BitVec 64))) (size!47601 (_ BitVec 32))) )
))
(declare-fun lt!630272 () array!97488)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!630274 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11330 0))(
  ( (MissingZero!11330 (index!47712 (_ BitVec 32))) (Found!11330 (index!47713 (_ BitVec 32))) (Intermediate!11330 (undefined!12142 Bool) (index!47714 (_ BitVec 32)) (x!129364 (_ BitVec 32))) (Undefined!11330) (MissingVacant!11330 (index!47715 (_ BitVec 32))) )
))
(declare-fun lt!630275 () SeekEntryResult!11330)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97488 (_ BitVec 32)) SeekEntryResult!11330)

(assert (=> b!1431690 (= res!965560 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630274 lt!630272 mask!2608) lt!630275))))

(declare-fun b!1431691 () Bool)

(declare-fun res!965556 () Bool)

(declare-fun e!808281 () Bool)

(assert (=> b!1431691 (=> (not res!965556) (not e!808281))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun a!2831 () array!97488)

(assert (=> b!1431691 (= res!965556 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47601 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47601 a!2831))))))

(declare-fun b!1431692 () Bool)

(declare-fun res!965565 () Bool)

(assert (=> b!1431692 (=> (not res!965565) (not e!808281))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431692 (= res!965565 (validKeyInArray!0 (select (arr!47051 a!2831) i!982)))))

(declare-fun b!1431693 () Bool)

(declare-fun e!808280 () Bool)

(assert (=> b!1431693 (= e!808280 true)))

(declare-fun lt!630273 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431693 (= lt!630273 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431694 () Bool)

(declare-fun res!965563 () Bool)

(assert (=> b!1431694 (=> (not res!965563) (not e!808282))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!630276 () SeekEntryResult!11330)

(assert (=> b!1431694 (= res!965563 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47051 a!2831) j!81) a!2831 mask!2608) lt!630276))))

(declare-fun e!808279 () Bool)

(declare-fun b!1431695 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97488 (_ BitVec 32)) SeekEntryResult!11330)

(assert (=> b!1431695 (= e!808279 (= (seekEntryOrOpen!0 (select (arr!47051 a!2831) j!81) a!2831 mask!2608) (Found!11330 j!81)))))

(declare-fun b!1431696 () Bool)

(declare-fun res!965559 () Bool)

(assert (=> b!1431696 (=> (not res!965559) (not e!808281))))

(declare-datatypes ((List!33561 0))(
  ( (Nil!33558) (Cons!33557 (h!34880 (_ BitVec 64)) (t!48255 List!33561)) )
))
(declare-fun arrayNoDuplicates!0 (array!97488 (_ BitVec 32) List!33561) Bool)

(assert (=> b!1431696 (= res!965559 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33558))))

(declare-fun b!1431697 () Bool)

(declare-fun res!965557 () Bool)

(assert (=> b!1431697 (=> (not res!965557) (not e!808281))))

(assert (=> b!1431697 (= res!965557 (and (= (size!47601 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47601 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47601 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431698 () Bool)

(declare-fun res!965562 () Bool)

(assert (=> b!1431698 (=> (not res!965562) (not e!808282))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431698 (= res!965562 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431699 () Bool)

(assert (=> b!1431699 (= e!808282 (not e!808280))))

(declare-fun res!965553 () Bool)

(assert (=> b!1431699 (=> res!965553 e!808280)))

(assert (=> b!1431699 (= res!965553 (or (= (select (arr!47051 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47051 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47051 a!2831) index!585) (select (arr!47051 a!2831) j!81)) (= (select (store (arr!47051 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1431699 e!808279))

(declare-fun res!965566 () Bool)

(assert (=> b!1431699 (=> (not res!965566) (not e!808279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97488 (_ BitVec 32)) Bool)

(assert (=> b!1431699 (= res!965566 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48406 0))(
  ( (Unit!48407) )
))
(declare-fun lt!630271 () Unit!48406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48406)

(assert (=> b!1431699 (= lt!630271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431700 () Bool)

(declare-fun e!808283 () Bool)

(assert (=> b!1431700 (= e!808281 e!808283)))

(declare-fun res!965564 () Bool)

(assert (=> b!1431700 (=> (not res!965564) (not e!808283))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431700 (= res!965564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47051 a!2831) j!81) mask!2608) (select (arr!47051 a!2831) j!81) a!2831 mask!2608) lt!630276))))

(assert (=> b!1431700 (= lt!630276 (Intermediate!11330 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431689 () Bool)

(declare-fun res!965561 () Bool)

(assert (=> b!1431689 (=> (not res!965561) (not e!808281))))

(assert (=> b!1431689 (= res!965561 (validKeyInArray!0 (select (arr!47051 a!2831) j!81)))))

(declare-fun res!965554 () Bool)

(assert (=> start!123516 (=> (not res!965554) (not e!808281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123516 (= res!965554 (validMask!0 mask!2608))))

(assert (=> start!123516 e!808281))

(assert (=> start!123516 true))

(declare-fun array_inv!36079 (array!97488) Bool)

(assert (=> start!123516 (array_inv!36079 a!2831)))

(declare-fun b!1431701 () Bool)

(declare-fun res!965555 () Bool)

(assert (=> b!1431701 (=> (not res!965555) (not e!808281))))

(assert (=> b!1431701 (= res!965555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431702 () Bool)

(assert (=> b!1431702 (= e!808283 e!808282)))

(declare-fun res!965558 () Bool)

(assert (=> b!1431702 (=> (not res!965558) (not e!808282))))

(assert (=> b!1431702 (= res!965558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630274 mask!2608) lt!630274 lt!630272 mask!2608) lt!630275))))

(assert (=> b!1431702 (= lt!630275 (Intermediate!11330 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431702 (= lt!630274 (select (store (arr!47051 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431702 (= lt!630272 (array!97489 (store (arr!47051 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47601 a!2831)))))

(assert (= (and start!123516 res!965554) b!1431697))

(assert (= (and b!1431697 res!965557) b!1431692))

(assert (= (and b!1431692 res!965565) b!1431689))

(assert (= (and b!1431689 res!965561) b!1431701))

(assert (= (and b!1431701 res!965555) b!1431696))

(assert (= (and b!1431696 res!965559) b!1431691))

(assert (= (and b!1431691 res!965556) b!1431700))

(assert (= (and b!1431700 res!965564) b!1431702))

(assert (= (and b!1431702 res!965558) b!1431694))

(assert (= (and b!1431694 res!965563) b!1431690))

(assert (= (and b!1431690 res!965560) b!1431698))

(assert (= (and b!1431698 res!965562) b!1431699))

(assert (= (and b!1431699 res!965566) b!1431695))

(assert (= (and b!1431699 (not res!965553)) b!1431693))

(declare-fun m!1321461 () Bool)

(assert (=> b!1431701 m!1321461))

(declare-fun m!1321463 () Bool)

(assert (=> b!1431696 m!1321463))

(declare-fun m!1321465 () Bool)

(assert (=> b!1431690 m!1321465))

(declare-fun m!1321467 () Bool)

(assert (=> b!1431689 m!1321467))

(assert (=> b!1431689 m!1321467))

(declare-fun m!1321469 () Bool)

(assert (=> b!1431689 m!1321469))

(declare-fun m!1321471 () Bool)

(assert (=> b!1431693 m!1321471))

(declare-fun m!1321473 () Bool)

(assert (=> start!123516 m!1321473))

(declare-fun m!1321475 () Bool)

(assert (=> start!123516 m!1321475))

(assert (=> b!1431700 m!1321467))

(assert (=> b!1431700 m!1321467))

(declare-fun m!1321477 () Bool)

(assert (=> b!1431700 m!1321477))

(assert (=> b!1431700 m!1321477))

(assert (=> b!1431700 m!1321467))

(declare-fun m!1321479 () Bool)

(assert (=> b!1431700 m!1321479))

(declare-fun m!1321481 () Bool)

(assert (=> b!1431702 m!1321481))

(assert (=> b!1431702 m!1321481))

(declare-fun m!1321483 () Bool)

(assert (=> b!1431702 m!1321483))

(declare-fun m!1321485 () Bool)

(assert (=> b!1431702 m!1321485))

(declare-fun m!1321487 () Bool)

(assert (=> b!1431702 m!1321487))

(assert (=> b!1431694 m!1321467))

(assert (=> b!1431694 m!1321467))

(declare-fun m!1321489 () Bool)

(assert (=> b!1431694 m!1321489))

(assert (=> b!1431699 m!1321485))

(declare-fun m!1321491 () Bool)

(assert (=> b!1431699 m!1321491))

(declare-fun m!1321493 () Bool)

(assert (=> b!1431699 m!1321493))

(declare-fun m!1321495 () Bool)

(assert (=> b!1431699 m!1321495))

(assert (=> b!1431699 m!1321467))

(declare-fun m!1321497 () Bool)

(assert (=> b!1431699 m!1321497))

(assert (=> b!1431695 m!1321467))

(assert (=> b!1431695 m!1321467))

(declare-fun m!1321499 () Bool)

(assert (=> b!1431695 m!1321499))

(declare-fun m!1321501 () Bool)

(assert (=> b!1431692 m!1321501))

(assert (=> b!1431692 m!1321501))

(declare-fun m!1321503 () Bool)

(assert (=> b!1431692 m!1321503))

(push 1)

