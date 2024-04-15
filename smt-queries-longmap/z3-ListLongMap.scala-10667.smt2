; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125110 () Bool)

(assert start!125110)

(declare-fun b!1458069 () Bool)

(declare-fun res!988343 () Bool)

(declare-fun e!820153 () Bool)

(assert (=> b!1458069 (=> (not res!988343) (not e!820153))))

(declare-datatypes ((array!98536 0))(
  ( (array!98537 (arr!47557 (Array (_ BitVec 32) (_ BitVec 64))) (size!48109 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98536)

(declare-datatypes ((List!34136 0))(
  ( (Nil!34133) (Cons!34132 (h!35482 (_ BitVec 64)) (t!48822 List!34136)) )
))
(declare-fun arrayNoDuplicates!0 (array!98536 (_ BitVec 32) List!34136) Bool)

(assert (=> b!1458069 (= res!988343 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34133))))

(declare-fun lt!638748 () array!98536)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11834 0))(
  ( (MissingZero!11834 (index!49728 (_ BitVec 32))) (Found!11834 (index!49729 (_ BitVec 32))) (Intermediate!11834 (undefined!12646 Bool) (index!49730 (_ BitVec 32)) (x!131342 (_ BitVec 32))) (Undefined!11834) (MissingVacant!11834 (index!49731 (_ BitVec 32))) )
))
(declare-fun lt!638745 () SeekEntryResult!11834)

(declare-fun lt!638751 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!820152 () Bool)

(declare-fun lt!638750 () (_ BitVec 32))

(declare-fun b!1458070 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98536 (_ BitVec 32)) SeekEntryResult!11834)

(assert (=> b!1458070 (= e!820152 (not (= lt!638745 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638750 lt!638751 lt!638748 mask!2687))))))

(declare-fun res!988354 () Bool)

(assert (=> start!125110 (=> (not res!988354) (not e!820153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125110 (= res!988354 (validMask!0 mask!2687))))

(assert (=> start!125110 e!820153))

(assert (=> start!125110 true))

(declare-fun array_inv!36790 (array!98536) Bool)

(assert (=> start!125110 (array_inv!36790 a!2862)))

(declare-fun b!1458071 () Bool)

(declare-fun res!988347 () Bool)

(assert (=> b!1458071 (=> (not res!988347) (not e!820153))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458071 (= res!988347 (validKeyInArray!0 (select (arr!47557 a!2862) i!1006)))))

(declare-fun b!1458072 () Bool)

(declare-fun e!820147 () Bool)

(assert (=> b!1458072 (= e!820147 true)))

(declare-fun lt!638749 () Bool)

(assert (=> b!1458072 (= lt!638749 e!820152)))

(declare-fun c!134379 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458072 (= c!134379 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458073 () Bool)

(declare-fun res!988351 () Bool)

(assert (=> b!1458073 (=> (not res!988351) (not e!820153))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458073 (= res!988351 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48109 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48109 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48109 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458074 () Bool)

(declare-fun res!988352 () Bool)

(declare-fun e!820155 () Bool)

(assert (=> b!1458074 (=> (not res!988352) (not e!820155))))

(declare-fun e!820146 () Bool)

(assert (=> b!1458074 (= res!988352 e!820146)))

(declare-fun c!134380 () Bool)

(assert (=> b!1458074 (= c!134380 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458075 () Bool)

(declare-fun res!988339 () Bool)

(declare-fun e!820150 () Bool)

(assert (=> b!1458075 (=> (not res!988339) (not e!820150))))

(declare-fun lt!638746 () SeekEntryResult!11834)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458075 (= res!988339 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!638746))))

(declare-fun b!1458076 () Bool)

(declare-fun lt!638744 () SeekEntryResult!11834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98536 (_ BitVec 32)) SeekEntryResult!11834)

(assert (=> b!1458076 (= e!820152 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638750 intermediateAfterIndex!19 lt!638751 lt!638748 mask!2687) lt!638744)))))

(declare-fun b!1458077 () Bool)

(declare-fun e!820148 () Bool)

(assert (=> b!1458077 (= e!820148 e!820147)))

(declare-fun res!988345 () Bool)

(assert (=> b!1458077 (=> res!988345 e!820147)))

(assert (=> b!1458077 (= res!988345 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638750 #b00000000000000000000000000000000) (bvsge lt!638750 (size!48109 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458077 (= lt!638750 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458077 (= lt!638744 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638751 lt!638748 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98536 (_ BitVec 32)) SeekEntryResult!11834)

(assert (=> b!1458077 (= lt!638744 (seekEntryOrOpen!0 lt!638751 lt!638748 mask!2687))))

(declare-fun b!1458078 () Bool)

(declare-fun e!820149 () Bool)

(assert (=> b!1458078 (= e!820149 (and (or (= (select (arr!47557 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47557 a!2862) intermediateBeforeIndex!19) (select (arr!47557 a!2862) j!93))) (let ((bdg!53413 (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47557 a!2862) index!646) bdg!53413) (= (select (arr!47557 a!2862) index!646) (select (arr!47557 a!2862) j!93))) (= (select (arr!47557 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53413 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458079 () Bool)

(declare-fun res!988344 () Bool)

(assert (=> b!1458079 (=> res!988344 e!820147)))

(assert (=> b!1458079 (= res!988344 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638750 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!638746)))))

(declare-fun b!1458080 () Bool)

(declare-fun e!820151 () Bool)

(assert (=> b!1458080 (= e!820151 e!820150)))

(declare-fun res!988338 () Bool)

(assert (=> b!1458080 (=> (not res!988338) (not e!820150))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458080 (= res!988338 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47557 a!2862) j!93) mask!2687) (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!638746))))

(assert (=> b!1458080 (= lt!638746 (Intermediate!11834 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458081 () Bool)

(assert (=> b!1458081 (= e!820153 e!820151)))

(declare-fun res!988350 () Bool)

(assert (=> b!1458081 (=> (not res!988350) (not e!820151))))

(assert (=> b!1458081 (= res!988350 (= (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458081 (= lt!638748 (array!98537 (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48109 a!2862)))))

(declare-fun b!1458082 () Bool)

(assert (=> b!1458082 (= e!820146 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638751 lt!638748 mask!2687) (seekEntryOrOpen!0 lt!638751 lt!638748 mask!2687)))))

(declare-fun b!1458083 () Bool)

(declare-fun res!988341 () Bool)

(assert (=> b!1458083 (=> (not res!988341) (not e!820153))))

(assert (=> b!1458083 (= res!988341 (validKeyInArray!0 (select (arr!47557 a!2862) j!93)))))

(declare-fun b!1458084 () Bool)

(declare-fun res!988348 () Bool)

(assert (=> b!1458084 (=> (not res!988348) (not e!820153))))

(assert (=> b!1458084 (= res!988348 (and (= (size!48109 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48109 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48109 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458085 () Bool)

(declare-fun res!988342 () Bool)

(assert (=> b!1458085 (=> (not res!988342) (not e!820155))))

(assert (=> b!1458085 (= res!988342 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458086 () Bool)

(declare-fun res!988337 () Bool)

(assert (=> b!1458086 (=> (not res!988337) (not e!820153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98536 (_ BitVec 32)) Bool)

(assert (=> b!1458086 (= res!988337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458087 () Bool)

(assert (=> b!1458087 (= e!820155 (not e!820148))))

(declare-fun res!988353 () Bool)

(assert (=> b!1458087 (=> res!988353 e!820148)))

(assert (=> b!1458087 (= res!988353 (or (and (= (select (arr!47557 a!2862) index!646) (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47557 a!2862) index!646) (select (arr!47557 a!2862) j!93))) (= (select (arr!47557 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458087 e!820149))

(declare-fun res!988346 () Bool)

(assert (=> b!1458087 (=> (not res!988346) (not e!820149))))

(assert (=> b!1458087 (= res!988346 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49005 0))(
  ( (Unit!49006) )
))
(declare-fun lt!638747 () Unit!49005)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49005)

(assert (=> b!1458087 (= lt!638747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458088 () Bool)

(declare-fun res!988349 () Bool)

(assert (=> b!1458088 (=> (not res!988349) (not e!820149))))

(assert (=> b!1458088 (= res!988349 (= (seekEntryOrOpen!0 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) (Found!11834 j!93)))))

(declare-fun b!1458089 () Bool)

(assert (=> b!1458089 (= e!820150 e!820155)))

(declare-fun res!988340 () Bool)

(assert (=> b!1458089 (=> (not res!988340) (not e!820155))))

(assert (=> b!1458089 (= res!988340 (= lt!638745 (Intermediate!11834 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458089 (= lt!638745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638751 mask!2687) lt!638751 lt!638748 mask!2687))))

(assert (=> b!1458089 (= lt!638751 (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458090 () Bool)

(assert (=> b!1458090 (= e!820146 (= lt!638745 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638751 lt!638748 mask!2687)))))

(assert (= (and start!125110 res!988354) b!1458084))

(assert (= (and b!1458084 res!988348) b!1458071))

(assert (= (and b!1458071 res!988347) b!1458083))

(assert (= (and b!1458083 res!988341) b!1458086))

(assert (= (and b!1458086 res!988337) b!1458069))

(assert (= (and b!1458069 res!988343) b!1458073))

(assert (= (and b!1458073 res!988351) b!1458081))

(assert (= (and b!1458081 res!988350) b!1458080))

(assert (= (and b!1458080 res!988338) b!1458075))

(assert (= (and b!1458075 res!988339) b!1458089))

(assert (= (and b!1458089 res!988340) b!1458074))

(assert (= (and b!1458074 c!134380) b!1458090))

(assert (= (and b!1458074 (not c!134380)) b!1458082))

(assert (= (and b!1458074 res!988352) b!1458085))

(assert (= (and b!1458085 res!988342) b!1458087))

(assert (= (and b!1458087 res!988346) b!1458088))

(assert (= (and b!1458088 res!988349) b!1458078))

(assert (= (and b!1458087 (not res!988353)) b!1458077))

(assert (= (and b!1458077 (not res!988345)) b!1458079))

(assert (= (and b!1458079 (not res!988344)) b!1458072))

(assert (= (and b!1458072 c!134379) b!1458070))

(assert (= (and b!1458072 (not c!134379)) b!1458076))

(declare-fun m!1345467 () Bool)

(assert (=> b!1458082 m!1345467))

(declare-fun m!1345469 () Bool)

(assert (=> b!1458082 m!1345469))

(declare-fun m!1345471 () Bool)

(assert (=> b!1458079 m!1345471))

(assert (=> b!1458079 m!1345471))

(declare-fun m!1345473 () Bool)

(assert (=> b!1458079 m!1345473))

(assert (=> b!1458083 m!1345471))

(assert (=> b!1458083 m!1345471))

(declare-fun m!1345475 () Bool)

(assert (=> b!1458083 m!1345475))

(declare-fun m!1345477 () Bool)

(assert (=> b!1458086 m!1345477))

(declare-fun m!1345479 () Bool)

(assert (=> b!1458089 m!1345479))

(assert (=> b!1458089 m!1345479))

(declare-fun m!1345481 () Bool)

(assert (=> b!1458089 m!1345481))

(declare-fun m!1345483 () Bool)

(assert (=> b!1458089 m!1345483))

(declare-fun m!1345485 () Bool)

(assert (=> b!1458089 m!1345485))

(declare-fun m!1345487 () Bool)

(assert (=> b!1458077 m!1345487))

(assert (=> b!1458077 m!1345467))

(assert (=> b!1458077 m!1345469))

(declare-fun m!1345489 () Bool)

(assert (=> b!1458069 m!1345489))

(declare-fun m!1345491 () Bool)

(assert (=> b!1458070 m!1345491))

(declare-fun m!1345493 () Bool)

(assert (=> b!1458076 m!1345493))

(assert (=> b!1458088 m!1345471))

(assert (=> b!1458088 m!1345471))

(declare-fun m!1345495 () Bool)

(assert (=> b!1458088 m!1345495))

(declare-fun m!1345497 () Bool)

(assert (=> start!125110 m!1345497))

(declare-fun m!1345499 () Bool)

(assert (=> start!125110 m!1345499))

(declare-fun m!1345501 () Bool)

(assert (=> b!1458090 m!1345501))

(declare-fun m!1345503 () Bool)

(assert (=> b!1458087 m!1345503))

(assert (=> b!1458087 m!1345483))

(declare-fun m!1345505 () Bool)

(assert (=> b!1458087 m!1345505))

(declare-fun m!1345507 () Bool)

(assert (=> b!1458087 m!1345507))

(declare-fun m!1345509 () Bool)

(assert (=> b!1458087 m!1345509))

(assert (=> b!1458087 m!1345471))

(assert (=> b!1458078 m!1345483))

(declare-fun m!1345511 () Bool)

(assert (=> b!1458078 m!1345511))

(assert (=> b!1458078 m!1345505))

(assert (=> b!1458078 m!1345507))

(assert (=> b!1458078 m!1345471))

(declare-fun m!1345513 () Bool)

(assert (=> b!1458071 m!1345513))

(assert (=> b!1458071 m!1345513))

(declare-fun m!1345515 () Bool)

(assert (=> b!1458071 m!1345515))

(assert (=> b!1458075 m!1345471))

(assert (=> b!1458075 m!1345471))

(declare-fun m!1345517 () Bool)

(assert (=> b!1458075 m!1345517))

(assert (=> b!1458081 m!1345483))

(declare-fun m!1345519 () Bool)

(assert (=> b!1458081 m!1345519))

(assert (=> b!1458080 m!1345471))

(assert (=> b!1458080 m!1345471))

(declare-fun m!1345521 () Bool)

(assert (=> b!1458080 m!1345521))

(assert (=> b!1458080 m!1345521))

(assert (=> b!1458080 m!1345471))

(declare-fun m!1345523 () Bool)

(assert (=> b!1458080 m!1345523))

(check-sat (not b!1458071) (not b!1458077) (not b!1458083) (not b!1458079) (not b!1458089) (not b!1458086) (not b!1458080) (not b!1458069) (not b!1458090) (not b!1458087) (not start!125110) (not b!1458082) (not b!1458075) (not b!1458070) (not b!1458076) (not b!1458088))
(check-sat)
