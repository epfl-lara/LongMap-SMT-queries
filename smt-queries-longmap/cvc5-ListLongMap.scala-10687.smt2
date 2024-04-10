; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125260 () Bool)

(assert start!125260)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1462053 () Bool)

(declare-fun e!821900 () Bool)

(declare-datatypes ((SeekEntryResult!11894 0))(
  ( (MissingZero!11894 (index!49968 (_ BitVec 32))) (Found!11894 (index!49969 (_ BitVec 32))) (Intermediate!11894 (undefined!12706 Bool) (index!49970 (_ BitVec 32)) (x!131567 (_ BitVec 32))) (Undefined!11894) (MissingVacant!11894 (index!49971 (_ BitVec 32))) )
))
(declare-fun lt!640328 () SeekEntryResult!11894)

(declare-fun lt!640332 () (_ BitVec 64))

(declare-fun lt!640330 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98708 0))(
  ( (array!98709 (arr!47642 (Array (_ BitVec 32) (_ BitVec 64))) (size!48192 (_ BitVec 32))) )
))
(declare-fun lt!640326 () array!98708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98708 (_ BitVec 32)) SeekEntryResult!11894)

(assert (=> b!1462053 (= e!821900 (not (= lt!640328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640330 lt!640332 lt!640326 mask!2687))))))

(declare-fun b!1462054 () Bool)

(declare-fun e!821898 () Bool)

(declare-fun e!821896 () Bool)

(assert (=> b!1462054 (= e!821898 e!821896)))

(declare-fun res!991559 () Bool)

(assert (=> b!1462054 (=> (not res!991559) (not e!821896))))

(declare-fun lt!640329 () SeekEntryResult!11894)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!98708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462054 (= res!991559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47642 a!2862) j!93) mask!2687) (select (arr!47642 a!2862) j!93) a!2862 mask!2687) lt!640329))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462054 (= lt!640329 (Intermediate!11894 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462055 () Bool)

(declare-fun e!821894 () Bool)

(assert (=> b!1462055 (= e!821894 true)))

(declare-fun lt!640331 () Bool)

(assert (=> b!1462055 (= lt!640331 e!821900)))

(declare-fun c!134760 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462055 (= c!134760 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462056 () Bool)

(declare-fun res!991569 () Bool)

(declare-fun e!821893 () Bool)

(assert (=> b!1462056 (=> (not res!991569) (not e!821893))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462056 (= res!991569 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48192 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48192 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48192 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462057 () Bool)

(declare-fun res!991562 () Bool)

(assert (=> b!1462057 (=> (not res!991562) (not e!821893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98708 (_ BitVec 32)) Bool)

(assert (=> b!1462057 (= res!991562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462058 () Bool)

(declare-fun e!821897 () Bool)

(assert (=> b!1462058 (= e!821897 e!821894)))

(declare-fun res!991567 () Bool)

(assert (=> b!1462058 (=> res!991567 e!821894)))

(assert (=> b!1462058 (= res!991567 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640330 #b00000000000000000000000000000000) (bvsge lt!640330 (size!48192 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462058 (= lt!640330 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!821899 () Bool)

(declare-fun b!1462059 () Bool)

(assert (=> b!1462059 (= e!821899 (or (= (select (arr!47642 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47642 a!2862) intermediateBeforeIndex!19) (select (arr!47642 a!2862) j!93))))))

(declare-fun b!1462060 () Bool)

(declare-fun res!991570 () Bool)

(assert (=> b!1462060 (=> (not res!991570) (not e!821899))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98708 (_ BitVec 32)) SeekEntryResult!11894)

(assert (=> b!1462060 (= res!991570 (= (seekEntryOrOpen!0 (select (arr!47642 a!2862) j!93) a!2862 mask!2687) (Found!11894 j!93)))))

(declare-fun b!1462061 () Bool)

(declare-fun res!991565 () Bool)

(assert (=> b!1462061 (=> (not res!991565) (not e!821896))))

(assert (=> b!1462061 (= res!991565 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47642 a!2862) j!93) a!2862 mask!2687) lt!640329))))

(declare-fun e!821892 () Bool)

(declare-fun b!1462062 () Bool)

(assert (=> b!1462062 (= e!821892 (= lt!640328 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640332 lt!640326 mask!2687)))))

(declare-fun b!1462063 () Bool)

(declare-fun res!991560 () Bool)

(assert (=> b!1462063 (=> res!991560 e!821894)))

(assert (=> b!1462063 (= res!991560 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640330 (select (arr!47642 a!2862) j!93) a!2862 mask!2687) lt!640329)))))

(declare-fun b!1462064 () Bool)

(declare-fun res!991564 () Bool)

(assert (=> b!1462064 (=> (not res!991564) (not e!821893))))

(declare-datatypes ((List!34143 0))(
  ( (Nil!34140) (Cons!34139 (h!35489 (_ BitVec 64)) (t!48837 List!34143)) )
))
(declare-fun arrayNoDuplicates!0 (array!98708 (_ BitVec 32) List!34143) Bool)

(assert (=> b!1462064 (= res!991564 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34140))))

(declare-fun res!991556 () Bool)

(assert (=> start!125260 (=> (not res!991556) (not e!821893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125260 (= res!991556 (validMask!0 mask!2687))))

(assert (=> start!125260 e!821893))

(assert (=> start!125260 true))

(declare-fun array_inv!36670 (array!98708) Bool)

(assert (=> start!125260 (array_inv!36670 a!2862)))

(declare-fun b!1462065 () Bool)

(declare-fun e!821891 () Bool)

(assert (=> b!1462065 (= e!821891 (not e!821897))))

(declare-fun res!991557 () Bool)

(assert (=> b!1462065 (=> res!991557 e!821897)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462065 (= res!991557 (or (and (= (select (arr!47642 a!2862) index!646) (select (store (arr!47642 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47642 a!2862) index!646) (select (arr!47642 a!2862) j!93))) (= (select (arr!47642 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462065 e!821899))

(declare-fun res!991573 () Bool)

(assert (=> b!1462065 (=> (not res!991573) (not e!821899))))

(assert (=> b!1462065 (= res!991573 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49284 0))(
  ( (Unit!49285) )
))
(declare-fun lt!640327 () Unit!49284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49284)

(assert (=> b!1462065 (= lt!640327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462066 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98708 (_ BitVec 32)) SeekEntryResult!11894)

(assert (=> b!1462066 (= e!821900 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640330 intermediateAfterIndex!19 lt!640332 lt!640326 mask!2687) (seekEntryOrOpen!0 lt!640332 lt!640326 mask!2687))))))

(declare-fun b!1462067 () Bool)

(assert (=> b!1462067 (= e!821892 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640332 lt!640326 mask!2687) (seekEntryOrOpen!0 lt!640332 lt!640326 mask!2687)))))

(declare-fun b!1462068 () Bool)

(declare-fun res!991563 () Bool)

(assert (=> b!1462068 (=> (not res!991563) (not e!821893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462068 (= res!991563 (validKeyInArray!0 (select (arr!47642 a!2862) i!1006)))))

(declare-fun b!1462069 () Bool)

(declare-fun res!991571 () Bool)

(assert (=> b!1462069 (=> (not res!991571) (not e!821891))))

(assert (=> b!1462069 (= res!991571 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462070 () Bool)

(assert (=> b!1462070 (= e!821893 e!821898)))

(declare-fun res!991558 () Bool)

(assert (=> b!1462070 (=> (not res!991558) (not e!821898))))

(assert (=> b!1462070 (= res!991558 (= (select (store (arr!47642 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462070 (= lt!640326 (array!98709 (store (arr!47642 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48192 a!2862)))))

(declare-fun b!1462071 () Bool)

(declare-fun res!991561 () Bool)

(assert (=> b!1462071 (=> (not res!991561) (not e!821893))))

(assert (=> b!1462071 (= res!991561 (validKeyInArray!0 (select (arr!47642 a!2862) j!93)))))

(declare-fun b!1462072 () Bool)

(assert (=> b!1462072 (= e!821896 e!821891)))

(declare-fun res!991572 () Bool)

(assert (=> b!1462072 (=> (not res!991572) (not e!821891))))

(assert (=> b!1462072 (= res!991572 (= lt!640328 (Intermediate!11894 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462072 (= lt!640328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640332 mask!2687) lt!640332 lt!640326 mask!2687))))

(assert (=> b!1462072 (= lt!640332 (select (store (arr!47642 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462073 () Bool)

(declare-fun res!991568 () Bool)

(assert (=> b!1462073 (=> (not res!991568) (not e!821893))))

(assert (=> b!1462073 (= res!991568 (and (= (size!48192 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48192 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48192 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462074 () Bool)

(declare-fun res!991566 () Bool)

(assert (=> b!1462074 (=> (not res!991566) (not e!821891))))

(assert (=> b!1462074 (= res!991566 e!821892)))

(declare-fun c!134759 () Bool)

(assert (=> b!1462074 (= c!134759 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125260 res!991556) b!1462073))

(assert (= (and b!1462073 res!991568) b!1462068))

(assert (= (and b!1462068 res!991563) b!1462071))

(assert (= (and b!1462071 res!991561) b!1462057))

(assert (= (and b!1462057 res!991562) b!1462064))

(assert (= (and b!1462064 res!991564) b!1462056))

(assert (= (and b!1462056 res!991569) b!1462070))

(assert (= (and b!1462070 res!991558) b!1462054))

(assert (= (and b!1462054 res!991559) b!1462061))

(assert (= (and b!1462061 res!991565) b!1462072))

(assert (= (and b!1462072 res!991572) b!1462074))

(assert (= (and b!1462074 c!134759) b!1462062))

(assert (= (and b!1462074 (not c!134759)) b!1462067))

(assert (= (and b!1462074 res!991566) b!1462069))

(assert (= (and b!1462069 res!991571) b!1462065))

(assert (= (and b!1462065 res!991573) b!1462060))

(assert (= (and b!1462060 res!991570) b!1462059))

(assert (= (and b!1462065 (not res!991557)) b!1462058))

(assert (= (and b!1462058 (not res!991567)) b!1462063))

(assert (= (and b!1462063 (not res!991560)) b!1462055))

(assert (= (and b!1462055 c!134760) b!1462053))

(assert (= (and b!1462055 (not c!134760)) b!1462066))

(declare-fun m!1349557 () Bool)

(assert (=> b!1462058 m!1349557))

(declare-fun m!1349559 () Bool)

(assert (=> b!1462071 m!1349559))

(assert (=> b!1462071 m!1349559))

(declare-fun m!1349561 () Bool)

(assert (=> b!1462071 m!1349561))

(declare-fun m!1349563 () Bool)

(assert (=> start!125260 m!1349563))

(declare-fun m!1349565 () Bool)

(assert (=> start!125260 m!1349565))

(declare-fun m!1349567 () Bool)

(assert (=> b!1462070 m!1349567))

(declare-fun m!1349569 () Bool)

(assert (=> b!1462070 m!1349569))

(assert (=> b!1462054 m!1349559))

(assert (=> b!1462054 m!1349559))

(declare-fun m!1349571 () Bool)

(assert (=> b!1462054 m!1349571))

(assert (=> b!1462054 m!1349571))

(assert (=> b!1462054 m!1349559))

(declare-fun m!1349573 () Bool)

(assert (=> b!1462054 m!1349573))

(declare-fun m!1349575 () Bool)

(assert (=> b!1462065 m!1349575))

(assert (=> b!1462065 m!1349567))

(declare-fun m!1349577 () Bool)

(assert (=> b!1462065 m!1349577))

(declare-fun m!1349579 () Bool)

(assert (=> b!1462065 m!1349579))

(declare-fun m!1349581 () Bool)

(assert (=> b!1462065 m!1349581))

(assert (=> b!1462065 m!1349559))

(declare-fun m!1349583 () Bool)

(assert (=> b!1462068 m!1349583))

(assert (=> b!1462068 m!1349583))

(declare-fun m!1349585 () Bool)

(assert (=> b!1462068 m!1349585))

(declare-fun m!1349587 () Bool)

(assert (=> b!1462057 m!1349587))

(declare-fun m!1349589 () Bool)

(assert (=> b!1462062 m!1349589))

(declare-fun m!1349591 () Bool)

(assert (=> b!1462067 m!1349591))

(declare-fun m!1349593 () Bool)

(assert (=> b!1462067 m!1349593))

(assert (=> b!1462063 m!1349559))

(assert (=> b!1462063 m!1349559))

(declare-fun m!1349595 () Bool)

(assert (=> b!1462063 m!1349595))

(assert (=> b!1462061 m!1349559))

(assert (=> b!1462061 m!1349559))

(declare-fun m!1349597 () Bool)

(assert (=> b!1462061 m!1349597))

(assert (=> b!1462060 m!1349559))

(assert (=> b!1462060 m!1349559))

(declare-fun m!1349599 () Bool)

(assert (=> b!1462060 m!1349599))

(declare-fun m!1349601 () Bool)

(assert (=> b!1462066 m!1349601))

(assert (=> b!1462066 m!1349593))

(declare-fun m!1349603 () Bool)

(assert (=> b!1462072 m!1349603))

(assert (=> b!1462072 m!1349603))

(declare-fun m!1349605 () Bool)

(assert (=> b!1462072 m!1349605))

(assert (=> b!1462072 m!1349567))

(declare-fun m!1349607 () Bool)

(assert (=> b!1462072 m!1349607))

(declare-fun m!1349609 () Bool)

(assert (=> b!1462059 m!1349609))

(assert (=> b!1462059 m!1349559))

(declare-fun m!1349611 () Bool)

(assert (=> b!1462064 m!1349611))

(declare-fun m!1349613 () Bool)

(assert (=> b!1462053 m!1349613))

(push 1)

