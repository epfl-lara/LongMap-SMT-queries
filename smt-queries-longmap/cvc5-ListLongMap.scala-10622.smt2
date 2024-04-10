; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124870 () Bool)

(assert start!124870)

(declare-fun b!1450043 () Bool)

(declare-fun e!816545 () Bool)

(declare-fun e!816554 () Bool)

(assert (=> b!1450043 (= e!816545 e!816554)))

(declare-fun res!981427 () Bool)

(assert (=> b!1450043 (=> (not res!981427) (not e!816554))))

(declare-datatypes ((SeekEntryResult!11699 0))(
  ( (MissingZero!11699 (index!49188 (_ BitVec 32))) (Found!11699 (index!49189 (_ BitVec 32))) (Intermediate!11699 (undefined!12511 Bool) (index!49190 (_ BitVec 32)) (x!130852 (_ BitVec 32))) (Undefined!11699) (MissingVacant!11699 (index!49191 (_ BitVec 32))) )
))
(declare-fun lt!636139 () SeekEntryResult!11699)

(declare-datatypes ((array!98318 0))(
  ( (array!98319 (arr!47447 (Array (_ BitVec 32) (_ BitVec 64))) (size!47997 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98318)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98318 (_ BitVec 32)) SeekEntryResult!11699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450043 (= res!981427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47447 a!2862) j!93) mask!2687) (select (arr!47447 a!2862) j!93) a!2862 mask!2687) lt!636139))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450043 (= lt!636139 (Intermediate!11699 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450044 () Bool)

(declare-fun res!981436 () Bool)

(assert (=> b!1450044 (=> (not res!981436) (not e!816554))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1450044 (= res!981436 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47447 a!2862) j!93) a!2862 mask!2687) lt!636139))))

(declare-fun b!1450045 () Bool)

(declare-fun e!816552 () Bool)

(assert (=> b!1450045 (= e!816552 e!816545)))

(declare-fun res!981422 () Bool)

(assert (=> b!1450045 (=> (not res!981422) (not e!816545))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450045 (= res!981422 (= (select (store (arr!47447 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636134 () array!98318)

(assert (=> b!1450045 (= lt!636134 (array!98319 (store (arr!47447 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47997 a!2862)))))

(declare-fun b!1450046 () Bool)

(declare-fun res!981434 () Bool)

(declare-fun e!816549 () Bool)

(assert (=> b!1450046 (=> (not res!981434) (not e!816549))))

(assert (=> b!1450046 (= res!981434 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450047 () Bool)

(declare-fun res!981429 () Bool)

(assert (=> b!1450047 (=> (not res!981429) (not e!816552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98318 (_ BitVec 32)) Bool)

(assert (=> b!1450047 (= res!981429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450048 () Bool)

(declare-fun lt!636136 () (_ BitVec 64))

(declare-fun e!816550 () Bool)

(declare-fun lt!636138 () SeekEntryResult!11699)

(assert (=> b!1450048 (= e!816550 (= lt!636138 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636136 lt!636134 mask!2687)))))

(declare-fun b!1450049 () Bool)

(declare-fun res!981424 () Bool)

(assert (=> b!1450049 (=> (not res!981424) (not e!816552))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450049 (= res!981424 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47997 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47997 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47997 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450050 () Bool)

(declare-fun e!816546 () Bool)

(assert (=> b!1450050 (= e!816546 true)))

(declare-fun lt!636140 () SeekEntryResult!11699)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98318 (_ BitVec 32)) SeekEntryResult!11699)

(assert (=> b!1450050 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636136 lt!636134 mask!2687) lt!636140)))

(declare-datatypes ((Unit!48894 0))(
  ( (Unit!48895) )
))
(declare-fun lt!636135 () Unit!48894)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48894)

(assert (=> b!1450050 (= lt!636135 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450051 () Bool)

(declare-fun res!981425 () Bool)

(assert (=> b!1450051 (=> (not res!981425) (not e!816549))))

(assert (=> b!1450051 (= res!981425 e!816550)))

(declare-fun c!133821 () Bool)

(assert (=> b!1450051 (= c!133821 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450052 () Bool)

(declare-fun res!981435 () Bool)

(assert (=> b!1450052 (=> (not res!981435) (not e!816552))))

(assert (=> b!1450052 (= res!981435 (and (= (size!47997 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47997 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47997 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450053 () Bool)

(declare-fun res!981431 () Bool)

(assert (=> b!1450053 (=> res!981431 e!816546)))

(assert (=> b!1450053 (= res!981431 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47447 a!2862) j!93) a!2862 mask!2687) lt!636140)))))

(declare-fun b!1450054 () Bool)

(declare-fun res!981426 () Bool)

(assert (=> b!1450054 (=> (not res!981426) (not e!816552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450054 (= res!981426 (validKeyInArray!0 (select (arr!47447 a!2862) j!93)))))

(declare-fun b!1450055 () Bool)

(assert (=> b!1450055 (= e!816549 (not e!816546))))

(declare-fun res!981439 () Bool)

(assert (=> b!1450055 (=> res!981439 e!816546)))

(assert (=> b!1450055 (= res!981439 (or (and (= (select (arr!47447 a!2862) index!646) (select (store (arr!47447 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47447 a!2862) index!646) (select (arr!47447 a!2862) j!93))) (not (= (select (arr!47447 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47447 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816548 () Bool)

(assert (=> b!1450055 e!816548))

(declare-fun res!981433 () Bool)

(assert (=> b!1450055 (=> (not res!981433) (not e!816548))))

(declare-fun lt!636141 () SeekEntryResult!11699)

(assert (=> b!1450055 (= res!981433 (and (= lt!636141 lt!636140) (or (= (select (arr!47447 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47447 a!2862) intermediateBeforeIndex!19) (select (arr!47447 a!2862) j!93)))))))

(assert (=> b!1450055 (= lt!636140 (Found!11699 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98318 (_ BitVec 32)) SeekEntryResult!11699)

(assert (=> b!1450055 (= lt!636141 (seekEntryOrOpen!0 (select (arr!47447 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450055 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636137 () Unit!48894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48894)

(assert (=> b!1450055 (= lt!636137 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450056 () Bool)

(declare-fun e!816551 () Bool)

(declare-fun e!816547 () Bool)

(assert (=> b!1450056 (= e!816551 e!816547)))

(declare-fun res!981438 () Bool)

(assert (=> b!1450056 (=> (not res!981438) (not e!816547))))

(assert (=> b!1450056 (= res!981438 (= lt!636141 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47447 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450057 () Bool)

(assert (=> b!1450057 (= e!816550 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636136 lt!636134 mask!2687) (seekEntryOrOpen!0 lt!636136 lt!636134 mask!2687)))))

(declare-fun res!981423 () Bool)

(assert (=> start!124870 (=> (not res!981423) (not e!816552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124870 (= res!981423 (validMask!0 mask!2687))))

(assert (=> start!124870 e!816552))

(assert (=> start!124870 true))

(declare-fun array_inv!36475 (array!98318) Bool)

(assert (=> start!124870 (array_inv!36475 a!2862)))

(declare-fun b!1450058 () Bool)

(assert (=> b!1450058 (= e!816547 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450059 () Bool)

(declare-fun res!981432 () Bool)

(assert (=> b!1450059 (=> (not res!981432) (not e!816552))))

(declare-datatypes ((List!33948 0))(
  ( (Nil!33945) (Cons!33944 (h!35294 (_ BitVec 64)) (t!48642 List!33948)) )
))
(declare-fun arrayNoDuplicates!0 (array!98318 (_ BitVec 32) List!33948) Bool)

(assert (=> b!1450059 (= res!981432 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33945))))

(declare-fun b!1450060 () Bool)

(declare-fun res!981430 () Bool)

(assert (=> b!1450060 (=> (not res!981430) (not e!816552))))

(assert (=> b!1450060 (= res!981430 (validKeyInArray!0 (select (arr!47447 a!2862) i!1006)))))

(declare-fun b!1450061 () Bool)

(assert (=> b!1450061 (= e!816548 e!816551)))

(declare-fun res!981428 () Bool)

(assert (=> b!1450061 (=> res!981428 e!816551)))

(assert (=> b!1450061 (= res!981428 (or (and (= (select (arr!47447 a!2862) index!646) (select (store (arr!47447 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47447 a!2862) index!646) (select (arr!47447 a!2862) j!93))) (not (= (select (arr!47447 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450062 () Bool)

(assert (=> b!1450062 (= e!816554 e!816549)))

(declare-fun res!981437 () Bool)

(assert (=> b!1450062 (=> (not res!981437) (not e!816549))))

(assert (=> b!1450062 (= res!981437 (= lt!636138 (Intermediate!11699 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1450062 (= lt!636138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636136 mask!2687) lt!636136 lt!636134 mask!2687))))

(assert (=> b!1450062 (= lt!636136 (select (store (arr!47447 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124870 res!981423) b!1450052))

(assert (= (and b!1450052 res!981435) b!1450060))

(assert (= (and b!1450060 res!981430) b!1450054))

(assert (= (and b!1450054 res!981426) b!1450047))

(assert (= (and b!1450047 res!981429) b!1450059))

(assert (= (and b!1450059 res!981432) b!1450049))

(assert (= (and b!1450049 res!981424) b!1450045))

(assert (= (and b!1450045 res!981422) b!1450043))

(assert (= (and b!1450043 res!981427) b!1450044))

(assert (= (and b!1450044 res!981436) b!1450062))

(assert (= (and b!1450062 res!981437) b!1450051))

(assert (= (and b!1450051 c!133821) b!1450048))

(assert (= (and b!1450051 (not c!133821)) b!1450057))

(assert (= (and b!1450051 res!981425) b!1450046))

(assert (= (and b!1450046 res!981434) b!1450055))

(assert (= (and b!1450055 res!981433) b!1450061))

(assert (= (and b!1450061 (not res!981428)) b!1450056))

(assert (= (and b!1450056 res!981438) b!1450058))

(assert (= (and b!1450055 (not res!981439)) b!1450053))

(assert (= (and b!1450053 (not res!981431)) b!1450050))

(declare-fun m!1338715 () Bool)

(assert (=> b!1450043 m!1338715))

(assert (=> b!1450043 m!1338715))

(declare-fun m!1338717 () Bool)

(assert (=> b!1450043 m!1338717))

(assert (=> b!1450043 m!1338717))

(assert (=> b!1450043 m!1338715))

(declare-fun m!1338719 () Bool)

(assert (=> b!1450043 m!1338719))

(declare-fun m!1338721 () Bool)

(assert (=> start!124870 m!1338721))

(declare-fun m!1338723 () Bool)

(assert (=> start!124870 m!1338723))

(declare-fun m!1338725 () Bool)

(assert (=> b!1450062 m!1338725))

(assert (=> b!1450062 m!1338725))

(declare-fun m!1338727 () Bool)

(assert (=> b!1450062 m!1338727))

(declare-fun m!1338729 () Bool)

(assert (=> b!1450062 m!1338729))

(declare-fun m!1338731 () Bool)

(assert (=> b!1450062 m!1338731))

(assert (=> b!1450053 m!1338715))

(assert (=> b!1450053 m!1338715))

(declare-fun m!1338733 () Bool)

(assert (=> b!1450053 m!1338733))

(declare-fun m!1338735 () Bool)

(assert (=> b!1450050 m!1338735))

(declare-fun m!1338737 () Bool)

(assert (=> b!1450050 m!1338737))

(declare-fun m!1338739 () Bool)

(assert (=> b!1450061 m!1338739))

(assert (=> b!1450061 m!1338729))

(declare-fun m!1338741 () Bool)

(assert (=> b!1450061 m!1338741))

(assert (=> b!1450061 m!1338715))

(assert (=> b!1450056 m!1338715))

(assert (=> b!1450056 m!1338715))

(declare-fun m!1338743 () Bool)

(assert (=> b!1450056 m!1338743))

(assert (=> b!1450057 m!1338735))

(declare-fun m!1338745 () Bool)

(assert (=> b!1450057 m!1338745))

(assert (=> b!1450045 m!1338729))

(declare-fun m!1338747 () Bool)

(assert (=> b!1450045 m!1338747))

(assert (=> b!1450054 m!1338715))

(assert (=> b!1450054 m!1338715))

(declare-fun m!1338749 () Bool)

(assert (=> b!1450054 m!1338749))

(assert (=> b!1450044 m!1338715))

(assert (=> b!1450044 m!1338715))

(declare-fun m!1338751 () Bool)

(assert (=> b!1450044 m!1338751))

(declare-fun m!1338753 () Bool)

(assert (=> b!1450047 m!1338753))

(declare-fun m!1338755 () Bool)

(assert (=> b!1450055 m!1338755))

(assert (=> b!1450055 m!1338729))

(declare-fun m!1338757 () Bool)

(assert (=> b!1450055 m!1338757))

(assert (=> b!1450055 m!1338741))

(assert (=> b!1450055 m!1338739))

(assert (=> b!1450055 m!1338715))

(declare-fun m!1338759 () Bool)

(assert (=> b!1450055 m!1338759))

(declare-fun m!1338761 () Bool)

(assert (=> b!1450055 m!1338761))

(assert (=> b!1450055 m!1338715))

(declare-fun m!1338763 () Bool)

(assert (=> b!1450060 m!1338763))

(assert (=> b!1450060 m!1338763))

(declare-fun m!1338765 () Bool)

(assert (=> b!1450060 m!1338765))

(declare-fun m!1338767 () Bool)

(assert (=> b!1450048 m!1338767))

(declare-fun m!1338769 () Bool)

(assert (=> b!1450059 m!1338769))

(push 1)

