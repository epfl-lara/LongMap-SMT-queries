; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124886 () Bool)

(assert start!124886)

(declare-fun b!1450523 () Bool)

(declare-fun e!816790 () Bool)

(declare-fun e!816791 () Bool)

(assert (=> b!1450523 (= e!816790 e!816791)))

(declare-fun res!981854 () Bool)

(assert (=> b!1450523 (=> (not res!981854) (not e!816791))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98334 0))(
  ( (array!98335 (arr!47455 (Array (_ BitVec 32) (_ BitVec 64))) (size!48005 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98334)

(assert (=> b!1450523 (= res!981854 (= (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636327 () array!98334)

(assert (=> b!1450523 (= lt!636327 (array!98335 (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48005 a!2862)))))

(declare-fun b!1450524 () Bool)

(declare-fun e!816793 () Bool)

(declare-fun e!816786 () Bool)

(assert (=> b!1450524 (= e!816793 e!816786)))

(declare-fun res!981857 () Bool)

(assert (=> b!1450524 (=> res!981857 e!816786)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1450524 (= res!981857 (or (and (= (select (arr!47455 a!2862) index!646) (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47455 a!2862) index!646) (select (arr!47455 a!2862) j!93))) (not (= (select (arr!47455 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450525 () Bool)

(declare-fun res!981867 () Bool)

(assert (=> b!1450525 (=> (not res!981867) (not e!816790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450525 (= res!981867 (validKeyInArray!0 (select (arr!47455 a!2862) i!1006)))))

(declare-fun b!1450526 () Bool)

(declare-fun res!981871 () Bool)

(declare-fun e!816794 () Bool)

(assert (=> b!1450526 (=> (not res!981871) (not e!816794))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450526 (= res!981871 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450527 () Bool)

(declare-fun e!816789 () Bool)

(assert (=> b!1450527 (= e!816789 true)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11707 0))(
  ( (MissingZero!11707 (index!49220 (_ BitVec 32))) (Found!11707 (index!49221 (_ BitVec 32))) (Intermediate!11707 (undefined!12519 Bool) (index!49222 (_ BitVec 32)) (x!130876 (_ BitVec 32))) (Undefined!11707) (MissingVacant!11707 (index!49223 (_ BitVec 32))) )
))
(declare-fun lt!636329 () SeekEntryResult!11707)

(declare-fun lt!636328 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98334 (_ BitVec 32)) SeekEntryResult!11707)

(assert (=> b!1450527 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636328 lt!636327 mask!2687) lt!636329)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!48910 0))(
  ( (Unit!48911) )
))
(declare-fun lt!636326 () Unit!48910)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48910)

(assert (=> b!1450527 (= lt!636326 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450528 () Bool)

(declare-fun res!981856 () Bool)

(assert (=> b!1450528 (=> (not res!981856) (not e!816790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98334 (_ BitVec 32)) Bool)

(assert (=> b!1450528 (= res!981856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!981855 () Bool)

(assert (=> start!124886 (=> (not res!981855) (not e!816790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124886 (= res!981855 (validMask!0 mask!2687))))

(assert (=> start!124886 e!816790))

(assert (=> start!124886 true))

(declare-fun array_inv!36483 (array!98334) Bool)

(assert (=> start!124886 (array_inv!36483 a!2862)))

(declare-fun b!1450529 () Bool)

(declare-fun res!981870 () Bool)

(assert (=> b!1450529 (=> (not res!981870) (not e!816790))))

(assert (=> b!1450529 (= res!981870 (and (= (size!48005 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48005 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48005 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450530 () Bool)

(declare-fun res!981864 () Bool)

(assert (=> b!1450530 (=> (not res!981864) (not e!816790))))

(assert (=> b!1450530 (= res!981864 (validKeyInArray!0 (select (arr!47455 a!2862) j!93)))))

(declare-fun b!1450531 () Bool)

(assert (=> b!1450531 (= e!816794 (not e!816789))))

(declare-fun res!981863 () Bool)

(assert (=> b!1450531 (=> res!981863 e!816789)))

(assert (=> b!1450531 (= res!981863 (or (and (= (select (arr!47455 a!2862) index!646) (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47455 a!2862) index!646) (select (arr!47455 a!2862) j!93))) (not (= (select (arr!47455 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450531 e!816793))

(declare-fun res!981861 () Bool)

(assert (=> b!1450531 (=> (not res!981861) (not e!816793))))

(declare-fun lt!636333 () SeekEntryResult!11707)

(assert (=> b!1450531 (= res!981861 (and (= lt!636333 lt!636329) (or (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) (select (arr!47455 a!2862) j!93)))))))

(assert (=> b!1450531 (= lt!636329 (Found!11707 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98334 (_ BitVec 32)) SeekEntryResult!11707)

(assert (=> b!1450531 (= lt!636333 (seekEntryOrOpen!0 (select (arr!47455 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450531 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636330 () Unit!48910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48910)

(assert (=> b!1450531 (= lt!636330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450532 () Bool)

(declare-fun e!816792 () Bool)

(assert (=> b!1450532 (= e!816792 e!816794)))

(declare-fun res!981866 () Bool)

(assert (=> b!1450532 (=> (not res!981866) (not e!816794))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!636331 () SeekEntryResult!11707)

(assert (=> b!1450532 (= res!981866 (= lt!636331 (Intermediate!11707 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98334 (_ BitVec 32)) SeekEntryResult!11707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450532 (= lt!636331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636328 mask!2687) lt!636328 lt!636327 mask!2687))))

(assert (=> b!1450532 (= lt!636328 (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!816787 () Bool)

(declare-fun b!1450533 () Bool)

(assert (=> b!1450533 (= e!816787 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636328 lt!636327 mask!2687) (seekEntryOrOpen!0 lt!636328 lt!636327 mask!2687)))))

(declare-fun b!1450534 () Bool)

(declare-fun res!981862 () Bool)

(assert (=> b!1450534 (=> (not res!981862) (not e!816790))))

(assert (=> b!1450534 (= res!981862 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48005 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48005 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48005 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450535 () Bool)

(declare-fun e!816788 () Bool)

(assert (=> b!1450535 (= e!816786 e!816788)))

(declare-fun res!981859 () Bool)

(assert (=> b!1450535 (=> (not res!981859) (not e!816788))))

(assert (=> b!1450535 (= res!981859 (= lt!636333 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47455 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450536 () Bool)

(assert (=> b!1450536 (= e!816791 e!816792)))

(declare-fun res!981869 () Bool)

(assert (=> b!1450536 (=> (not res!981869) (not e!816792))))

(declare-fun lt!636332 () SeekEntryResult!11707)

(assert (=> b!1450536 (= res!981869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47455 a!2862) j!93) mask!2687) (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!636332))))

(assert (=> b!1450536 (= lt!636332 (Intermediate!11707 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450537 () Bool)

(declare-fun res!981868 () Bool)

(assert (=> b!1450537 (=> res!981868 e!816789)))

(assert (=> b!1450537 (= res!981868 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!636329)))))

(declare-fun b!1450538 () Bool)

(declare-fun res!981858 () Bool)

(assert (=> b!1450538 (=> (not res!981858) (not e!816790))))

(declare-datatypes ((List!33956 0))(
  ( (Nil!33953) (Cons!33952 (h!35302 (_ BitVec 64)) (t!48650 List!33956)) )
))
(declare-fun arrayNoDuplicates!0 (array!98334 (_ BitVec 32) List!33956) Bool)

(assert (=> b!1450538 (= res!981858 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33953))))

(declare-fun b!1450539 () Bool)

(assert (=> b!1450539 (= e!816788 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450540 () Bool)

(assert (=> b!1450540 (= e!816787 (= lt!636331 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636328 lt!636327 mask!2687)))))

(declare-fun b!1450541 () Bool)

(declare-fun res!981860 () Bool)

(assert (=> b!1450541 (=> (not res!981860) (not e!816792))))

(assert (=> b!1450541 (= res!981860 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!636332))))

(declare-fun b!1450542 () Bool)

(declare-fun res!981865 () Bool)

(assert (=> b!1450542 (=> (not res!981865) (not e!816794))))

(assert (=> b!1450542 (= res!981865 e!816787)))

(declare-fun c!133845 () Bool)

(assert (=> b!1450542 (= c!133845 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124886 res!981855) b!1450529))

(assert (= (and b!1450529 res!981870) b!1450525))

(assert (= (and b!1450525 res!981867) b!1450530))

(assert (= (and b!1450530 res!981864) b!1450528))

(assert (= (and b!1450528 res!981856) b!1450538))

(assert (= (and b!1450538 res!981858) b!1450534))

(assert (= (and b!1450534 res!981862) b!1450523))

(assert (= (and b!1450523 res!981854) b!1450536))

(assert (= (and b!1450536 res!981869) b!1450541))

(assert (= (and b!1450541 res!981860) b!1450532))

(assert (= (and b!1450532 res!981866) b!1450542))

(assert (= (and b!1450542 c!133845) b!1450540))

(assert (= (and b!1450542 (not c!133845)) b!1450533))

(assert (= (and b!1450542 res!981865) b!1450526))

(assert (= (and b!1450526 res!981871) b!1450531))

(assert (= (and b!1450531 res!981861) b!1450524))

(assert (= (and b!1450524 (not res!981857)) b!1450535))

(assert (= (and b!1450535 res!981859) b!1450539))

(assert (= (and b!1450531 (not res!981863)) b!1450537))

(assert (= (and b!1450537 (not res!981868)) b!1450527))

(declare-fun m!1339163 () Bool)

(assert (=> b!1450537 m!1339163))

(assert (=> b!1450537 m!1339163))

(declare-fun m!1339165 () Bool)

(assert (=> b!1450537 m!1339165))

(declare-fun m!1339167 () Bool)

(assert (=> b!1450528 m!1339167))

(declare-fun m!1339169 () Bool)

(assert (=> b!1450538 m!1339169))

(declare-fun m!1339171 () Bool)

(assert (=> b!1450532 m!1339171))

(assert (=> b!1450532 m!1339171))

(declare-fun m!1339173 () Bool)

(assert (=> b!1450532 m!1339173))

(declare-fun m!1339175 () Bool)

(assert (=> b!1450532 m!1339175))

(declare-fun m!1339177 () Bool)

(assert (=> b!1450532 m!1339177))

(assert (=> b!1450536 m!1339163))

(assert (=> b!1450536 m!1339163))

(declare-fun m!1339179 () Bool)

(assert (=> b!1450536 m!1339179))

(assert (=> b!1450536 m!1339179))

(assert (=> b!1450536 m!1339163))

(declare-fun m!1339181 () Bool)

(assert (=> b!1450536 m!1339181))

(declare-fun m!1339183 () Bool)

(assert (=> b!1450533 m!1339183))

(declare-fun m!1339185 () Bool)

(assert (=> b!1450533 m!1339185))

(declare-fun m!1339187 () Bool)

(assert (=> start!124886 m!1339187))

(declare-fun m!1339189 () Bool)

(assert (=> start!124886 m!1339189))

(declare-fun m!1339191 () Bool)

(assert (=> b!1450531 m!1339191))

(assert (=> b!1450531 m!1339175))

(declare-fun m!1339193 () Bool)

(assert (=> b!1450531 m!1339193))

(declare-fun m!1339195 () Bool)

(assert (=> b!1450531 m!1339195))

(declare-fun m!1339197 () Bool)

(assert (=> b!1450531 m!1339197))

(assert (=> b!1450531 m!1339163))

(declare-fun m!1339199 () Bool)

(assert (=> b!1450531 m!1339199))

(declare-fun m!1339201 () Bool)

(assert (=> b!1450531 m!1339201))

(assert (=> b!1450531 m!1339163))

(declare-fun m!1339203 () Bool)

(assert (=> b!1450525 m!1339203))

(assert (=> b!1450525 m!1339203))

(declare-fun m!1339205 () Bool)

(assert (=> b!1450525 m!1339205))

(assert (=> b!1450524 m!1339197))

(assert (=> b!1450524 m!1339175))

(assert (=> b!1450524 m!1339195))

(assert (=> b!1450524 m!1339163))

(assert (=> b!1450541 m!1339163))

(assert (=> b!1450541 m!1339163))

(declare-fun m!1339207 () Bool)

(assert (=> b!1450541 m!1339207))

(declare-fun m!1339209 () Bool)

(assert (=> b!1450540 m!1339209))

(assert (=> b!1450523 m!1339175))

(declare-fun m!1339211 () Bool)

(assert (=> b!1450523 m!1339211))

(assert (=> b!1450527 m!1339183))

(declare-fun m!1339213 () Bool)

(assert (=> b!1450527 m!1339213))

(assert (=> b!1450530 m!1339163))

(assert (=> b!1450530 m!1339163))

(declare-fun m!1339215 () Bool)

(assert (=> b!1450530 m!1339215))

(assert (=> b!1450535 m!1339163))

(assert (=> b!1450535 m!1339163))

(declare-fun m!1339217 () Bool)

(assert (=> b!1450535 m!1339217))

(push 1)

