; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123270 () Bool)

(assert start!123270)

(declare-fun b!1429527 () Bool)

(declare-fun res!964166 () Bool)

(declare-fun e!807176 () Bool)

(assert (=> b!1429527 (=> (not res!964166) (not e!807176))))

(declare-datatypes ((array!97431 0))(
  ( (array!97432 (arr!47027 (Array (_ BitVec 32) (_ BitVec 64))) (size!47577 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97431)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429527 (= res!964166 (validKeyInArray!0 (select (arr!47027 a!2831) i!982)))))

(declare-fun b!1429528 () Bool)

(declare-fun res!964156 () Bool)

(assert (=> b!1429528 (=> (not res!964156) (not e!807176))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1429528 (= res!964156 (validKeyInArray!0 (select (arr!47027 a!2831) j!81)))))

(declare-fun b!1429529 () Bool)

(declare-fun res!964161 () Bool)

(assert (=> b!1429529 (=> (not res!964161) (not e!807176))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97431 (_ BitVec 32)) Bool)

(assert (=> b!1429529 (= res!964161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429530 () Bool)

(declare-fun e!807175 () Bool)

(declare-fun e!807174 () Bool)

(assert (=> b!1429530 (= e!807175 e!807174)))

(declare-fun res!964159 () Bool)

(assert (=> b!1429530 (=> (not res!964159) (not e!807174))))

(declare-fun lt!629402 () array!97431)

(declare-datatypes ((SeekEntryResult!11306 0))(
  ( (MissingZero!11306 (index!47616 (_ BitVec 32))) (Found!11306 (index!47617 (_ BitVec 32))) (Intermediate!11306 (undefined!12118 Bool) (index!47618 (_ BitVec 32)) (x!129252 (_ BitVec 32))) (Undefined!11306) (MissingVacant!11306 (index!47619 (_ BitVec 32))) )
))
(declare-fun lt!629399 () SeekEntryResult!11306)

(declare-fun lt!629401 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97431 (_ BitVec 32)) SeekEntryResult!11306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429530 (= res!964159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629401 mask!2608) lt!629401 lt!629402 mask!2608) lt!629399))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429530 (= lt!629399 (Intermediate!11306 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429530 (= lt!629401 (select (store (arr!47027 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429530 (= lt!629402 (array!97432 (store (arr!47027 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47577 a!2831)))))

(declare-fun b!1429531 () Bool)

(assert (=> b!1429531 (= e!807176 e!807175)))

(declare-fun res!964167 () Bool)

(assert (=> b!1429531 (=> (not res!964167) (not e!807175))))

(declare-fun lt!629400 () SeekEntryResult!11306)

(assert (=> b!1429531 (= res!964167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47027 a!2831) j!81) mask!2608) (select (arr!47027 a!2831) j!81) a!2831 mask!2608) lt!629400))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429531 (= lt!629400 (Intermediate!11306 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429532 () Bool)

(declare-fun res!964163 () Bool)

(assert (=> b!1429532 (=> (not res!964163) (not e!807176))))

(declare-datatypes ((List!33537 0))(
  ( (Nil!33534) (Cons!33533 (h!34847 (_ BitVec 64)) (t!48231 List!33537)) )
))
(declare-fun arrayNoDuplicates!0 (array!97431 (_ BitVec 32) List!33537) Bool)

(assert (=> b!1429532 (= res!964163 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33534))))

(declare-fun b!1429533 () Bool)

(declare-fun res!964165 () Bool)

(assert (=> b!1429533 (=> (not res!964165) (not e!807174))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429533 (= res!964165 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47027 a!2831) j!81) a!2831 mask!2608) lt!629400))))

(declare-fun res!964160 () Bool)

(assert (=> start!123270 (=> (not res!964160) (not e!807176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123270 (= res!964160 (validMask!0 mask!2608))))

(assert (=> start!123270 e!807176))

(assert (=> start!123270 true))

(declare-fun array_inv!36055 (array!97431) Bool)

(assert (=> start!123270 (array_inv!36055 a!2831)))

(declare-fun e!807173 () Bool)

(declare-fun b!1429534 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97431 (_ BitVec 32)) SeekEntryResult!11306)

(assert (=> b!1429534 (= e!807173 (= (seekEntryOrOpen!0 (select (arr!47027 a!2831) j!81) a!2831 mask!2608) (Found!11306 j!81)))))

(declare-fun b!1429535 () Bool)

(declare-fun res!964162 () Bool)

(assert (=> b!1429535 (=> (not res!964162) (not e!807176))))

(assert (=> b!1429535 (= res!964162 (and (= (size!47577 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47577 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47577 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429536 () Bool)

(declare-fun res!964158 () Bool)

(assert (=> b!1429536 (=> (not res!964158) (not e!807176))))

(assert (=> b!1429536 (= res!964158 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47577 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47577 a!2831))))))

(declare-fun b!1429537 () Bool)

(declare-fun res!964168 () Bool)

(assert (=> b!1429537 (=> (not res!964168) (not e!807174))))

(assert (=> b!1429537 (= res!964168 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429538 () Bool)

(declare-fun res!964164 () Bool)

(assert (=> b!1429538 (=> (not res!964164) (not e!807174))))

(assert (=> b!1429538 (= res!964164 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629401 lt!629402 mask!2608) lt!629399))))

(declare-fun b!1429539 () Bool)

(assert (=> b!1429539 (= e!807174 (not true))))

(assert (=> b!1429539 e!807173))

(declare-fun res!964157 () Bool)

(assert (=> b!1429539 (=> (not res!964157) (not e!807173))))

(assert (=> b!1429539 (= res!964157 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48358 0))(
  ( (Unit!48359) )
))
(declare-fun lt!629403 () Unit!48358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48358)

(assert (=> b!1429539 (= lt!629403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123270 res!964160) b!1429535))

(assert (= (and b!1429535 res!964162) b!1429527))

(assert (= (and b!1429527 res!964166) b!1429528))

(assert (= (and b!1429528 res!964156) b!1429529))

(assert (= (and b!1429529 res!964161) b!1429532))

(assert (= (and b!1429532 res!964163) b!1429536))

(assert (= (and b!1429536 res!964158) b!1429531))

(assert (= (and b!1429531 res!964167) b!1429530))

(assert (= (and b!1429530 res!964159) b!1429533))

(assert (= (and b!1429533 res!964165) b!1429538))

(assert (= (and b!1429538 res!964164) b!1429537))

(assert (= (and b!1429537 res!964168) b!1429539))

(assert (= (and b!1429539 res!964157) b!1429534))

(declare-fun m!1319625 () Bool)

(assert (=> b!1429531 m!1319625))

(assert (=> b!1429531 m!1319625))

(declare-fun m!1319627 () Bool)

(assert (=> b!1429531 m!1319627))

(assert (=> b!1429531 m!1319627))

(assert (=> b!1429531 m!1319625))

(declare-fun m!1319629 () Bool)

(assert (=> b!1429531 m!1319629))

(assert (=> b!1429534 m!1319625))

(assert (=> b!1429534 m!1319625))

(declare-fun m!1319631 () Bool)

(assert (=> b!1429534 m!1319631))

(declare-fun m!1319633 () Bool)

(assert (=> b!1429529 m!1319633))

(declare-fun m!1319635 () Bool)

(assert (=> b!1429539 m!1319635))

(declare-fun m!1319637 () Bool)

(assert (=> b!1429539 m!1319637))

(assert (=> b!1429533 m!1319625))

(assert (=> b!1429533 m!1319625))

(declare-fun m!1319639 () Bool)

(assert (=> b!1429533 m!1319639))

(assert (=> b!1429528 m!1319625))

(assert (=> b!1429528 m!1319625))

(declare-fun m!1319641 () Bool)

(assert (=> b!1429528 m!1319641))

(declare-fun m!1319643 () Bool)

(assert (=> b!1429538 m!1319643))

(declare-fun m!1319645 () Bool)

(assert (=> b!1429530 m!1319645))

(assert (=> b!1429530 m!1319645))

(declare-fun m!1319647 () Bool)

(assert (=> b!1429530 m!1319647))

(declare-fun m!1319649 () Bool)

(assert (=> b!1429530 m!1319649))

(declare-fun m!1319651 () Bool)

(assert (=> b!1429530 m!1319651))

(declare-fun m!1319653 () Bool)

(assert (=> b!1429527 m!1319653))

(assert (=> b!1429527 m!1319653))

(declare-fun m!1319655 () Bool)

(assert (=> b!1429527 m!1319655))

(declare-fun m!1319657 () Bool)

(assert (=> start!123270 m!1319657))

(declare-fun m!1319659 () Bool)

(assert (=> start!123270 m!1319659))

(declare-fun m!1319661 () Bool)

(assert (=> b!1429532 m!1319661))

(push 1)

