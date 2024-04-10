; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124818 () Bool)

(assert start!124818)

(declare-fun b!1448541 () Bool)

(declare-fun res!980090 () Bool)

(declare-fun e!815765 () Bool)

(assert (=> b!1448541 (=> (not res!980090) (not e!815765))))

(declare-datatypes ((array!98266 0))(
  ( (array!98267 (arr!47421 (Array (_ BitVec 32) (_ BitVec 64))) (size!47971 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98266)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448541 (= res!980090 (validKeyInArray!0 (select (arr!47421 a!2862) j!93)))))

(declare-fun b!1448542 () Bool)

(declare-fun res!980079 () Bool)

(assert (=> b!1448542 (=> (not res!980079) (not e!815765))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448542 (= res!980079 (validKeyInArray!0 (select (arr!47421 a!2862) i!1006)))))

(declare-fun b!1448543 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!815767 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1448543 (= e!815767 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448544 () Bool)

(declare-fun res!980089 () Bool)

(declare-fun e!815773 () Bool)

(assert (=> b!1448544 (=> (not res!980089) (not e!815773))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448544 (= res!980089 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448545 () Bool)

(declare-fun res!980085 () Bool)

(assert (=> b!1448545 (=> (not res!980085) (not e!815765))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448545 (= res!980085 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47971 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47971 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47971 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448546 () Bool)

(declare-fun res!980078 () Bool)

(assert (=> b!1448546 (=> (not res!980078) (not e!815765))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98266 (_ BitVec 32)) Bool)

(assert (=> b!1448546 (= res!980078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448547 () Bool)

(declare-fun e!815774 () Bool)

(declare-fun e!815772 () Bool)

(assert (=> b!1448547 (= e!815774 e!815772)))

(declare-fun res!980086 () Bool)

(assert (=> b!1448547 (=> res!980086 e!815772)))

(assert (=> b!1448547 (= res!980086 (or (and (= (select (arr!47421 a!2862) index!646) (select (store (arr!47421 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47421 a!2862) index!646) (select (arr!47421 a!2862) j!93))) (not (= (select (arr!47421 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448548 () Bool)

(declare-fun res!980083 () Bool)

(declare-fun e!815766 () Bool)

(assert (=> b!1448548 (=> (not res!980083) (not e!815766))))

(declare-datatypes ((SeekEntryResult!11673 0))(
  ( (MissingZero!11673 (index!49084 (_ BitVec 32))) (Found!11673 (index!49085 (_ BitVec 32))) (Intermediate!11673 (undefined!12485 Bool) (index!49086 (_ BitVec 32)) (x!130754 (_ BitVec 32))) (Undefined!11673) (MissingVacant!11673 (index!49087 (_ BitVec 32))) )
))
(declare-fun lt!635573 () SeekEntryResult!11673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98266 (_ BitVec 32)) SeekEntryResult!11673)

(assert (=> b!1448548 (= res!980083 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47421 a!2862) j!93) a!2862 mask!2687) lt!635573))))

(declare-fun b!1448549 () Bool)

(declare-fun res!980087 () Bool)

(assert (=> b!1448549 (=> (not res!980087) (not e!815765))))

(assert (=> b!1448549 (= res!980087 (and (= (size!47971 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47971 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47971 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!635572 () (_ BitVec 64))

(declare-fun b!1448550 () Bool)

(declare-fun lt!635571 () array!98266)

(declare-fun lt!635568 () SeekEntryResult!11673)

(declare-fun e!815770 () Bool)

(assert (=> b!1448550 (= e!815770 (= lt!635568 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635572 lt!635571 mask!2687)))))

(declare-fun b!1448551 () Bool)

(declare-fun res!980077 () Bool)

(assert (=> b!1448551 (=> (not res!980077) (not e!815765))))

(declare-datatypes ((List!33922 0))(
  ( (Nil!33919) (Cons!33918 (h!35268 (_ BitVec 64)) (t!48616 List!33922)) )
))
(declare-fun arrayNoDuplicates!0 (array!98266 (_ BitVec 32) List!33922) Bool)

(assert (=> b!1448551 (= res!980077 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33919))))

(declare-fun b!1448552 () Bool)

(assert (=> b!1448552 (= e!815766 e!815773)))

(declare-fun res!980091 () Bool)

(assert (=> b!1448552 (=> (not res!980091) (not e!815773))))

(assert (=> b!1448552 (= res!980091 (= lt!635568 (Intermediate!11673 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448552 (= lt!635568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635572 mask!2687) lt!635572 lt!635571 mask!2687))))

(assert (=> b!1448552 (= lt!635572 (select (store (arr!47421 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448553 () Bool)

(declare-fun e!815769 () Bool)

(assert (=> b!1448553 (= e!815769 e!815766)))

(declare-fun res!980080 () Bool)

(assert (=> b!1448553 (=> (not res!980080) (not e!815766))))

(assert (=> b!1448553 (= res!980080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47421 a!2862) j!93) mask!2687) (select (arr!47421 a!2862) j!93) a!2862 mask!2687) lt!635573))))

(assert (=> b!1448553 (= lt!635573 (Intermediate!11673 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448554 () Bool)

(assert (=> b!1448554 (= e!815772 e!815767)))

(declare-fun res!980092 () Bool)

(assert (=> b!1448554 (=> (not res!980092) (not e!815767))))

(declare-fun lt!635569 () SeekEntryResult!11673)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98266 (_ BitVec 32)) SeekEntryResult!11673)

(assert (=> b!1448554 (= res!980092 (= lt!635569 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47421 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448555 () Bool)

(declare-fun e!815768 () Bool)

(assert (=> b!1448555 (= e!815768 true)))

(declare-fun lt!635570 () SeekEntryResult!11673)

(assert (=> b!1448555 (= lt!635570 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47421 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448556 () Bool)

(assert (=> b!1448556 (= e!815773 (not e!815768))))

(declare-fun res!980088 () Bool)

(assert (=> b!1448556 (=> res!980088 e!815768)))

(assert (=> b!1448556 (= res!980088 (or (and (= (select (arr!47421 a!2862) index!646) (select (store (arr!47421 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47421 a!2862) index!646) (select (arr!47421 a!2862) j!93))) (not (= (select (arr!47421 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47421 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448556 e!815774))

(declare-fun res!980081 () Bool)

(assert (=> b!1448556 (=> (not res!980081) (not e!815774))))

(assert (=> b!1448556 (= res!980081 (and (= lt!635569 (Found!11673 j!93)) (or (= (select (arr!47421 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47421 a!2862) intermediateBeforeIndex!19) (select (arr!47421 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98266 (_ BitVec 32)) SeekEntryResult!11673)

(assert (=> b!1448556 (= lt!635569 (seekEntryOrOpen!0 (select (arr!47421 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448556 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48842 0))(
  ( (Unit!48843) )
))
(declare-fun lt!635574 () Unit!48842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48842)

(assert (=> b!1448556 (= lt!635574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448557 () Bool)

(assert (=> b!1448557 (= e!815770 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635572 lt!635571 mask!2687) (seekEntryOrOpen!0 lt!635572 lt!635571 mask!2687)))))

(declare-fun res!980082 () Bool)

(assert (=> start!124818 (=> (not res!980082) (not e!815765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124818 (= res!980082 (validMask!0 mask!2687))))

(assert (=> start!124818 e!815765))

(assert (=> start!124818 true))

(declare-fun array_inv!36449 (array!98266) Bool)

(assert (=> start!124818 (array_inv!36449 a!2862)))

(declare-fun b!1448558 () Bool)

(declare-fun res!980084 () Bool)

(assert (=> b!1448558 (=> (not res!980084) (not e!815773))))

(assert (=> b!1448558 (= res!980084 e!815770)))

(declare-fun c!133743 () Bool)

(assert (=> b!1448558 (= c!133743 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448559 () Bool)

(assert (=> b!1448559 (= e!815765 e!815769)))

(declare-fun res!980076 () Bool)

(assert (=> b!1448559 (=> (not res!980076) (not e!815769))))

(assert (=> b!1448559 (= res!980076 (= (select (store (arr!47421 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448559 (= lt!635571 (array!98267 (store (arr!47421 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47971 a!2862)))))

(assert (= (and start!124818 res!980082) b!1448549))

(assert (= (and b!1448549 res!980087) b!1448542))

(assert (= (and b!1448542 res!980079) b!1448541))

(assert (= (and b!1448541 res!980090) b!1448546))

(assert (= (and b!1448546 res!980078) b!1448551))

(assert (= (and b!1448551 res!980077) b!1448545))

(assert (= (and b!1448545 res!980085) b!1448559))

(assert (= (and b!1448559 res!980076) b!1448553))

(assert (= (and b!1448553 res!980080) b!1448548))

(assert (= (and b!1448548 res!980083) b!1448552))

(assert (= (and b!1448552 res!980091) b!1448558))

(assert (= (and b!1448558 c!133743) b!1448550))

(assert (= (and b!1448558 (not c!133743)) b!1448557))

(assert (= (and b!1448558 res!980084) b!1448544))

(assert (= (and b!1448544 res!980089) b!1448556))

(assert (= (and b!1448556 res!980081) b!1448547))

(assert (= (and b!1448547 (not res!980086)) b!1448554))

(assert (= (and b!1448554 res!980092) b!1448543))

(assert (= (and b!1448556 (not res!980088)) b!1448555))

(declare-fun m!1337299 () Bool)

(assert (=> b!1448551 m!1337299))

(declare-fun m!1337301 () Bool)

(assert (=> b!1448550 m!1337301))

(declare-fun m!1337303 () Bool)

(assert (=> b!1448552 m!1337303))

(assert (=> b!1448552 m!1337303))

(declare-fun m!1337305 () Bool)

(assert (=> b!1448552 m!1337305))

(declare-fun m!1337307 () Bool)

(assert (=> b!1448552 m!1337307))

(declare-fun m!1337309 () Bool)

(assert (=> b!1448552 m!1337309))

(declare-fun m!1337311 () Bool)

(assert (=> b!1448557 m!1337311))

(declare-fun m!1337313 () Bool)

(assert (=> b!1448557 m!1337313))

(declare-fun m!1337315 () Bool)

(assert (=> start!124818 m!1337315))

(declare-fun m!1337317 () Bool)

(assert (=> start!124818 m!1337317))

(declare-fun m!1337319 () Bool)

(assert (=> b!1448546 m!1337319))

(declare-fun m!1337321 () Bool)

(assert (=> b!1448548 m!1337321))

(assert (=> b!1448548 m!1337321))

(declare-fun m!1337323 () Bool)

(assert (=> b!1448548 m!1337323))

(assert (=> b!1448541 m!1337321))

(assert (=> b!1448541 m!1337321))

(declare-fun m!1337325 () Bool)

(assert (=> b!1448541 m!1337325))

(declare-fun m!1337327 () Bool)

(assert (=> b!1448556 m!1337327))

(assert (=> b!1448556 m!1337307))

(declare-fun m!1337329 () Bool)

(assert (=> b!1448556 m!1337329))

(declare-fun m!1337331 () Bool)

(assert (=> b!1448556 m!1337331))

(declare-fun m!1337333 () Bool)

(assert (=> b!1448556 m!1337333))

(assert (=> b!1448556 m!1337321))

(declare-fun m!1337335 () Bool)

(assert (=> b!1448556 m!1337335))

(declare-fun m!1337337 () Bool)

(assert (=> b!1448556 m!1337337))

(assert (=> b!1448556 m!1337321))

(assert (=> b!1448547 m!1337333))

(assert (=> b!1448547 m!1337307))

(assert (=> b!1448547 m!1337331))

(assert (=> b!1448547 m!1337321))

(declare-fun m!1337339 () Bool)

(assert (=> b!1448542 m!1337339))

(assert (=> b!1448542 m!1337339))

(declare-fun m!1337341 () Bool)

(assert (=> b!1448542 m!1337341))

(assert (=> b!1448553 m!1337321))

(assert (=> b!1448553 m!1337321))

(declare-fun m!1337343 () Bool)

(assert (=> b!1448553 m!1337343))

(assert (=> b!1448553 m!1337343))

(assert (=> b!1448553 m!1337321))

(declare-fun m!1337345 () Bool)

(assert (=> b!1448553 m!1337345))

(assert (=> b!1448554 m!1337321))

(assert (=> b!1448554 m!1337321))

(declare-fun m!1337347 () Bool)

(assert (=> b!1448554 m!1337347))

(assert (=> b!1448555 m!1337321))

(assert (=> b!1448555 m!1337321))

(declare-fun m!1337349 () Bool)

(assert (=> b!1448555 m!1337349))

(assert (=> b!1448559 m!1337307))

(declare-fun m!1337351 () Bool)

(assert (=> b!1448559 m!1337351))

(check-sat (not start!124818) (not b!1448555) (not b!1448553) (not b!1448546) (not b!1448554) (not b!1448551) (not b!1448541) (not b!1448550) (not b!1448556) (not b!1448552) (not b!1448557) (not b!1448542) (not b!1448548))
(check-sat)
