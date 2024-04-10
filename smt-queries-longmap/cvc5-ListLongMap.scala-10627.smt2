; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124900 () Bool)

(assert start!124900)

(declare-fun b!1450945 () Bool)

(declare-fun e!816997 () Bool)

(declare-fun e!817001 () Bool)

(assert (=> b!1450945 (= e!816997 (not e!817001))))

(declare-fun res!982245 () Bool)

(assert (=> b!1450945 (=> res!982245 e!817001)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98348 0))(
  ( (array!98349 (arr!47462 (Array (_ BitVec 32) (_ BitVec 64))) (size!48012 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98348)

(assert (=> b!1450945 (= res!982245 (or (and (= (select (arr!47462 a!2862) index!646) (select (store (arr!47462 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47462 a!2862) index!646) (select (arr!47462 a!2862) j!93))) (not (= (select (arr!47462 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47462 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!817005 () Bool)

(assert (=> b!1450945 e!817005))

(declare-fun res!982251 () Bool)

(assert (=> b!1450945 (=> (not res!982251) (not e!817005))))

(declare-datatypes ((SeekEntryResult!11714 0))(
  ( (MissingZero!11714 (index!49248 (_ BitVec 32))) (Found!11714 (index!49249 (_ BitVec 32))) (Intermediate!11714 (undefined!12526 Bool) (index!49250 (_ BitVec 32)) (x!130907 (_ BitVec 32))) (Undefined!11714) (MissingVacant!11714 (index!49251 (_ BitVec 32))) )
))
(declare-fun lt!636500 () SeekEntryResult!11714)

(declare-fun lt!636499 () SeekEntryResult!11714)

(assert (=> b!1450945 (= res!982251 (and (= lt!636499 lt!636500) (or (= (select (arr!47462 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47462 a!2862) intermediateBeforeIndex!19) (select (arr!47462 a!2862) j!93)))))))

(assert (=> b!1450945 (= lt!636500 (Found!11714 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98348 (_ BitVec 32)) SeekEntryResult!11714)

(assert (=> b!1450945 (= lt!636499 (seekEntryOrOpen!0 (select (arr!47462 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98348 (_ BitVec 32)) Bool)

(assert (=> b!1450945 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48924 0))(
  ( (Unit!48925) )
))
(declare-fun lt!636501 () Unit!48924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48924)

(assert (=> b!1450945 (= lt!636501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1450946 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!817004 () Bool)

(assert (=> b!1450946 (= e!817004 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450947 () Bool)

(declare-fun e!816999 () Bool)

(declare-fun lt!636496 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450947 (= e!816999 (validKeyInArray!0 lt!636496))))

(declare-fun lt!636498 () SeekEntryResult!11714)

(declare-fun b!1450948 () Bool)

(declare-fun e!817007 () Bool)

(declare-fun lt!636497 () array!98348)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98348 (_ BitVec 32)) SeekEntryResult!11714)

(assert (=> b!1450948 (= e!817007 (= lt!636498 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636496 lt!636497 mask!2687)))))

(declare-fun b!1450949 () Bool)

(declare-fun res!982241 () Bool)

(declare-fun e!817000 () Bool)

(assert (=> b!1450949 (=> (not res!982241) (not e!817000))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450949 (= res!982241 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48012 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48012 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48012 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450950 () Bool)

(declare-fun e!817006 () Bool)

(assert (=> b!1450950 (= e!817000 e!817006)))

(declare-fun res!982239 () Bool)

(assert (=> b!1450950 (=> (not res!982239) (not e!817006))))

(assert (=> b!1450950 (= res!982239 (= (select (store (arr!47462 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450950 (= lt!636497 (array!98349 (store (arr!47462 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48012 a!2862)))))

(declare-fun b!1450951 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98348 (_ BitVec 32)) SeekEntryResult!11714)

(assert (=> b!1450951 (= e!817007 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636496 lt!636497 mask!2687) (seekEntryOrOpen!0 lt!636496 lt!636497 mask!2687)))))

(declare-fun b!1450952 () Bool)

(declare-fun res!982252 () Bool)

(assert (=> b!1450952 (=> (not res!982252) (not e!817000))))

(declare-datatypes ((List!33963 0))(
  ( (Nil!33960) (Cons!33959 (h!35309 (_ BitVec 64)) (t!48657 List!33963)) )
))
(declare-fun arrayNoDuplicates!0 (array!98348 (_ BitVec 32) List!33963) Bool)

(assert (=> b!1450952 (= res!982252 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33960))))

(declare-fun b!1450953 () Bool)

(declare-fun res!982238 () Bool)

(assert (=> b!1450953 (=> (not res!982238) (not e!817000))))

(assert (=> b!1450953 (= res!982238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450954 () Bool)

(declare-fun res!982236 () Bool)

(assert (=> b!1450954 (=> (not res!982236) (not e!817000))))

(assert (=> b!1450954 (= res!982236 (validKeyInArray!0 (select (arr!47462 a!2862) j!93)))))

(declare-fun b!1450955 () Bool)

(declare-fun res!982242 () Bool)

(assert (=> b!1450955 (=> (not res!982242) (not e!816997))))

(assert (=> b!1450955 (= res!982242 e!817007)))

(declare-fun c!133866 () Bool)

(assert (=> b!1450955 (= c!133866 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450956 () Bool)

(declare-fun res!982249 () Bool)

(assert (=> b!1450956 (=> (not res!982249) (not e!817000))))

(assert (=> b!1450956 (= res!982249 (and (= (size!48012 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48012 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48012 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450957 () Bool)

(declare-fun res!982235 () Bool)

(assert (=> b!1450957 (=> (not res!982235) (not e!816997))))

(assert (=> b!1450957 (= res!982235 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450958 () Bool)

(declare-fun e!817003 () Bool)

(assert (=> b!1450958 (= e!817005 e!817003)))

(declare-fun res!982250 () Bool)

(assert (=> b!1450958 (=> res!982250 e!817003)))

(assert (=> b!1450958 (= res!982250 (or (and (= (select (arr!47462 a!2862) index!646) (select (store (arr!47462 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47462 a!2862) index!646) (select (arr!47462 a!2862) j!93))) (not (= (select (arr!47462 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!982247 () Bool)

(assert (=> start!124900 (=> (not res!982247) (not e!817000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124900 (= res!982247 (validMask!0 mask!2687))))

(assert (=> start!124900 e!817000))

(assert (=> start!124900 true))

(declare-fun array_inv!36490 (array!98348) Bool)

(assert (=> start!124900 (array_inv!36490 a!2862)))

(declare-fun b!1450959 () Bool)

(declare-fun e!816998 () Bool)

(assert (=> b!1450959 (= e!816998 e!816997)))

(declare-fun res!982237 () Bool)

(assert (=> b!1450959 (=> (not res!982237) (not e!816997))))

(assert (=> b!1450959 (= res!982237 (= lt!636498 (Intermediate!11714 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450959 (= lt!636498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636496 mask!2687) lt!636496 lt!636497 mask!2687))))

(assert (=> b!1450959 (= lt!636496 (select (store (arr!47462 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450960 () Bool)

(assert (=> b!1450960 (= e!817003 e!817004)))

(declare-fun res!982244 () Bool)

(assert (=> b!1450960 (=> (not res!982244) (not e!817004))))

(assert (=> b!1450960 (= res!982244 (= lt!636499 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47462 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450961 () Bool)

(declare-fun res!982248 () Bool)

(assert (=> b!1450961 (=> (not res!982248) (not e!817000))))

(assert (=> b!1450961 (= res!982248 (validKeyInArray!0 (select (arr!47462 a!2862) i!1006)))))

(declare-fun b!1450962 () Bool)

(declare-fun res!982246 () Bool)

(assert (=> b!1450962 (=> (not res!982246) (not e!816998))))

(declare-fun lt!636495 () SeekEntryResult!11714)

(assert (=> b!1450962 (= res!982246 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47462 a!2862) j!93) a!2862 mask!2687) lt!636495))))

(declare-fun b!1450963 () Bool)

(declare-fun res!982234 () Bool)

(assert (=> b!1450963 (=> res!982234 e!817001)))

(assert (=> b!1450963 (= res!982234 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47462 a!2862) j!93) a!2862 mask!2687) lt!636500)))))

(declare-fun b!1450964 () Bool)

(assert (=> b!1450964 (= e!817006 e!816998)))

(declare-fun res!982243 () Bool)

(assert (=> b!1450964 (=> (not res!982243) (not e!816998))))

(assert (=> b!1450964 (= res!982243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47462 a!2862) j!93) mask!2687) (select (arr!47462 a!2862) j!93) a!2862 mask!2687) lt!636495))))

(assert (=> b!1450964 (= lt!636495 (Intermediate!11714 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450965 () Bool)

(assert (=> b!1450965 (= e!817001 e!816999)))

(declare-fun res!982240 () Bool)

(assert (=> b!1450965 (=> res!982240 e!816999)))

(assert (=> b!1450965 (= res!982240 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1450965 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636496 lt!636497 mask!2687) lt!636500)))

(declare-fun lt!636494 () Unit!48924)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48924)

(assert (=> b!1450965 (= lt!636494 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!124900 res!982247) b!1450956))

(assert (= (and b!1450956 res!982249) b!1450961))

(assert (= (and b!1450961 res!982248) b!1450954))

(assert (= (and b!1450954 res!982236) b!1450953))

(assert (= (and b!1450953 res!982238) b!1450952))

(assert (= (and b!1450952 res!982252) b!1450949))

(assert (= (and b!1450949 res!982241) b!1450950))

(assert (= (and b!1450950 res!982239) b!1450964))

(assert (= (and b!1450964 res!982243) b!1450962))

(assert (= (and b!1450962 res!982246) b!1450959))

(assert (= (and b!1450959 res!982237) b!1450955))

(assert (= (and b!1450955 c!133866) b!1450948))

(assert (= (and b!1450955 (not c!133866)) b!1450951))

(assert (= (and b!1450955 res!982242) b!1450957))

(assert (= (and b!1450957 res!982235) b!1450945))

(assert (= (and b!1450945 res!982251) b!1450958))

(assert (= (and b!1450958 (not res!982250)) b!1450960))

(assert (= (and b!1450960 res!982244) b!1450946))

(assert (= (and b!1450945 (not res!982245)) b!1450963))

(assert (= (and b!1450963 (not res!982234)) b!1450965))

(assert (= (and b!1450965 (not res!982240)) b!1450947))

(declare-fun m!1339555 () Bool)

(assert (=> b!1450945 m!1339555))

(declare-fun m!1339557 () Bool)

(assert (=> b!1450945 m!1339557))

(declare-fun m!1339559 () Bool)

(assert (=> b!1450945 m!1339559))

(declare-fun m!1339561 () Bool)

(assert (=> b!1450945 m!1339561))

(declare-fun m!1339563 () Bool)

(assert (=> b!1450945 m!1339563))

(declare-fun m!1339565 () Bool)

(assert (=> b!1450945 m!1339565))

(declare-fun m!1339567 () Bool)

(assert (=> b!1450945 m!1339567))

(declare-fun m!1339569 () Bool)

(assert (=> b!1450945 m!1339569))

(assert (=> b!1450945 m!1339565))

(assert (=> b!1450958 m!1339563))

(assert (=> b!1450958 m!1339557))

(assert (=> b!1450958 m!1339561))

(assert (=> b!1450958 m!1339565))

(declare-fun m!1339571 () Bool)

(assert (=> b!1450952 m!1339571))

(declare-fun m!1339573 () Bool)

(assert (=> b!1450959 m!1339573))

(assert (=> b!1450959 m!1339573))

(declare-fun m!1339575 () Bool)

(assert (=> b!1450959 m!1339575))

(assert (=> b!1450959 m!1339557))

(declare-fun m!1339577 () Bool)

(assert (=> b!1450959 m!1339577))

(declare-fun m!1339579 () Bool)

(assert (=> b!1450953 m!1339579))

(assert (=> b!1450954 m!1339565))

(assert (=> b!1450954 m!1339565))

(declare-fun m!1339581 () Bool)

(assert (=> b!1450954 m!1339581))

(assert (=> b!1450963 m!1339565))

(assert (=> b!1450963 m!1339565))

(declare-fun m!1339583 () Bool)

(assert (=> b!1450963 m!1339583))

(declare-fun m!1339585 () Bool)

(assert (=> b!1450948 m!1339585))

(assert (=> b!1450960 m!1339565))

(assert (=> b!1450960 m!1339565))

(declare-fun m!1339587 () Bool)

(assert (=> b!1450960 m!1339587))

(declare-fun m!1339589 () Bool)

(assert (=> b!1450951 m!1339589))

(declare-fun m!1339591 () Bool)

(assert (=> b!1450951 m!1339591))

(assert (=> b!1450964 m!1339565))

(assert (=> b!1450964 m!1339565))

(declare-fun m!1339593 () Bool)

(assert (=> b!1450964 m!1339593))

(assert (=> b!1450964 m!1339593))

(assert (=> b!1450964 m!1339565))

(declare-fun m!1339595 () Bool)

(assert (=> b!1450964 m!1339595))

(declare-fun m!1339597 () Bool)

(assert (=> start!124900 m!1339597))

(declare-fun m!1339599 () Bool)

(assert (=> start!124900 m!1339599))

(declare-fun m!1339601 () Bool)

(assert (=> b!1450947 m!1339601))

(assert (=> b!1450965 m!1339589))

(declare-fun m!1339603 () Bool)

(assert (=> b!1450965 m!1339603))

(declare-fun m!1339605 () Bool)

(assert (=> b!1450961 m!1339605))

(assert (=> b!1450961 m!1339605))

(declare-fun m!1339607 () Bool)

(assert (=> b!1450961 m!1339607))

(assert (=> b!1450962 m!1339565))

(assert (=> b!1450962 m!1339565))

(declare-fun m!1339609 () Bool)

(assert (=> b!1450962 m!1339609))

(assert (=> b!1450950 m!1339557))

(declare-fun m!1339611 () Bool)

(assert (=> b!1450950 m!1339611))

(push 1)

