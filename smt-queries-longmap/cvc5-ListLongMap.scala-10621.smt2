; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124864 () Bool)

(assert start!124864)

(declare-fun b!1449863 () Bool)

(declare-fun res!981277 () Bool)

(declare-fun e!816456 () Bool)

(assert (=> b!1449863 (=> (not res!981277) (not e!816456))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98312 0))(
  ( (array!98313 (arr!47444 (Array (_ BitVec 32) (_ BitVec 64))) (size!47994 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98312)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449863 (= res!981277 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47994 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47994 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47994 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449864 () Bool)

(declare-fun res!981260 () Bool)

(declare-fun e!816461 () Bool)

(assert (=> b!1449864 (=> (not res!981260) (not e!816461))))

(declare-datatypes ((SeekEntryResult!11696 0))(
  ( (MissingZero!11696 (index!49176 (_ BitVec 32))) (Found!11696 (index!49177 (_ BitVec 32))) (Intermediate!11696 (undefined!12508 Bool) (index!49178 (_ BitVec 32)) (x!130841 (_ BitVec 32))) (Undefined!11696) (MissingVacant!11696 (index!49179 (_ BitVec 32))) )
))
(declare-fun lt!636062 () SeekEntryResult!11696)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98312 (_ BitVec 32)) SeekEntryResult!11696)

(assert (=> b!1449864 (= res!981260 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47444 a!2862) j!93) a!2862 mask!2687) lt!636062))))

(declare-fun lt!636068 () (_ BitVec 64))

(declare-fun b!1449865 () Bool)

(declare-fun lt!636066 () array!98312)

(declare-fun e!816460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98312 (_ BitVec 32)) SeekEntryResult!11696)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98312 (_ BitVec 32)) SeekEntryResult!11696)

(assert (=> b!1449865 (= e!816460 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636068 lt!636066 mask!2687) (seekEntryOrOpen!0 lt!636068 lt!636066 mask!2687)))))

(declare-fun b!1449866 () Bool)

(declare-fun res!981272 () Bool)

(declare-fun e!816455 () Bool)

(assert (=> b!1449866 (=> res!981272 e!816455)))

(declare-fun lt!636067 () SeekEntryResult!11696)

(assert (=> b!1449866 (= res!981272 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47444 a!2862) j!93) a!2862 mask!2687) lt!636067)))))

(declare-fun b!1449867 () Bool)

(declare-fun res!981269 () Bool)

(assert (=> b!1449867 (=> (not res!981269) (not e!816456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449867 (= res!981269 (validKeyInArray!0 (select (arr!47444 a!2862) j!93)))))

(declare-fun b!1449868 () Bool)

(declare-fun lt!636069 () SeekEntryResult!11696)

(assert (=> b!1449868 (= e!816460 (= lt!636069 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636068 lt!636066 mask!2687)))))

(declare-fun b!1449869 () Bool)

(assert (=> b!1449869 (= e!816455 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1449869 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636068 lt!636066 mask!2687) lt!636067)))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((Unit!48888 0))(
  ( (Unit!48889) )
))
(declare-fun lt!636065 () Unit!48888)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48888)

(assert (=> b!1449869 (= lt!636065 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449870 () Bool)

(declare-fun e!816459 () Bool)

(declare-fun e!816458 () Bool)

(assert (=> b!1449870 (= e!816459 e!816458)))

(declare-fun res!981276 () Bool)

(assert (=> b!1449870 (=> res!981276 e!816458)))

(assert (=> b!1449870 (= res!981276 (or (and (= (select (arr!47444 a!2862) index!646) (select (store (arr!47444 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47444 a!2862) index!646) (select (arr!47444 a!2862) j!93))) (not (= (select (arr!47444 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449871 () Bool)

(declare-fun e!816463 () Bool)

(assert (=> b!1449871 (= e!816456 e!816463)))

(declare-fun res!981263 () Bool)

(assert (=> b!1449871 (=> (not res!981263) (not e!816463))))

(assert (=> b!1449871 (= res!981263 (= (select (store (arr!47444 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449871 (= lt!636066 (array!98313 (store (arr!47444 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47994 a!2862)))))

(declare-fun b!1449872 () Bool)

(declare-fun res!981264 () Bool)

(assert (=> b!1449872 (=> (not res!981264) (not e!816456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98312 (_ BitVec 32)) Bool)

(assert (=> b!1449872 (= res!981264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449873 () Bool)

(declare-fun res!981268 () Bool)

(assert (=> b!1449873 (=> (not res!981268) (not e!816456))))

(assert (=> b!1449873 (= res!981268 (and (= (size!47994 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47994 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47994 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449874 () Bool)

(declare-fun res!981265 () Bool)

(assert (=> b!1449874 (=> (not res!981265) (not e!816456))))

(declare-datatypes ((List!33945 0))(
  ( (Nil!33942) (Cons!33941 (h!35291 (_ BitVec 64)) (t!48639 List!33945)) )
))
(declare-fun arrayNoDuplicates!0 (array!98312 (_ BitVec 32) List!33945) Bool)

(assert (=> b!1449874 (= res!981265 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33942))))

(declare-fun b!1449875 () Bool)

(declare-fun e!816457 () Bool)

(assert (=> b!1449875 (= e!816461 e!816457)))

(declare-fun res!981274 () Bool)

(assert (=> b!1449875 (=> (not res!981274) (not e!816457))))

(assert (=> b!1449875 (= res!981274 (= lt!636069 (Intermediate!11696 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449875 (= lt!636069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636068 mask!2687) lt!636068 lt!636066 mask!2687))))

(assert (=> b!1449875 (= lt!636068 (select (store (arr!47444 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449876 () Bool)

(assert (=> b!1449876 (= e!816463 e!816461)))

(declare-fun res!981261 () Bool)

(assert (=> b!1449876 (=> (not res!981261) (not e!816461))))

(assert (=> b!1449876 (= res!981261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47444 a!2862) j!93) mask!2687) (select (arr!47444 a!2862) j!93) a!2862 mask!2687) lt!636062))))

(assert (=> b!1449876 (= lt!636062 (Intermediate!11696 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!981262 () Bool)

(assert (=> start!124864 (=> (not res!981262) (not e!816456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124864 (= res!981262 (validMask!0 mask!2687))))

(assert (=> start!124864 e!816456))

(assert (=> start!124864 true))

(declare-fun array_inv!36472 (array!98312) Bool)

(assert (=> start!124864 (array_inv!36472 a!2862)))

(declare-fun b!1449877 () Bool)

(declare-fun res!981266 () Bool)

(assert (=> b!1449877 (=> (not res!981266) (not e!816457))))

(assert (=> b!1449877 (= res!981266 e!816460)))

(declare-fun c!133812 () Bool)

(assert (=> b!1449877 (= c!133812 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449878 () Bool)

(declare-fun res!981275 () Bool)

(assert (=> b!1449878 (=> (not res!981275) (not e!816457))))

(assert (=> b!1449878 (= res!981275 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449879 () Bool)

(declare-fun res!981271 () Bool)

(assert (=> b!1449879 (=> (not res!981271) (not e!816456))))

(assert (=> b!1449879 (= res!981271 (validKeyInArray!0 (select (arr!47444 a!2862) i!1006)))))

(declare-fun b!1449880 () Bool)

(declare-fun e!816462 () Bool)

(assert (=> b!1449880 (= e!816458 e!816462)))

(declare-fun res!981270 () Bool)

(assert (=> b!1449880 (=> (not res!981270) (not e!816462))))

(declare-fun lt!636063 () SeekEntryResult!11696)

(assert (=> b!1449880 (= res!981270 (= lt!636063 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47444 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449881 () Bool)

(assert (=> b!1449881 (= e!816462 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449882 () Bool)

(assert (=> b!1449882 (= e!816457 (not e!816455))))

(declare-fun res!981273 () Bool)

(assert (=> b!1449882 (=> res!981273 e!816455)))

(assert (=> b!1449882 (= res!981273 (or (and (= (select (arr!47444 a!2862) index!646) (select (store (arr!47444 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47444 a!2862) index!646) (select (arr!47444 a!2862) j!93))) (not (= (select (arr!47444 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47444 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449882 e!816459))

(declare-fun res!981267 () Bool)

(assert (=> b!1449882 (=> (not res!981267) (not e!816459))))

(assert (=> b!1449882 (= res!981267 (and (= lt!636063 lt!636067) (or (= (select (arr!47444 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47444 a!2862) intermediateBeforeIndex!19) (select (arr!47444 a!2862) j!93)))))))

(assert (=> b!1449882 (= lt!636067 (Found!11696 j!93))))

(assert (=> b!1449882 (= lt!636063 (seekEntryOrOpen!0 (select (arr!47444 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449882 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636064 () Unit!48888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48888)

(assert (=> b!1449882 (= lt!636064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124864 res!981262) b!1449873))

(assert (= (and b!1449873 res!981268) b!1449879))

(assert (= (and b!1449879 res!981271) b!1449867))

(assert (= (and b!1449867 res!981269) b!1449872))

(assert (= (and b!1449872 res!981264) b!1449874))

(assert (= (and b!1449874 res!981265) b!1449863))

(assert (= (and b!1449863 res!981277) b!1449871))

(assert (= (and b!1449871 res!981263) b!1449876))

(assert (= (and b!1449876 res!981261) b!1449864))

(assert (= (and b!1449864 res!981260) b!1449875))

(assert (= (and b!1449875 res!981274) b!1449877))

(assert (= (and b!1449877 c!133812) b!1449868))

(assert (= (and b!1449877 (not c!133812)) b!1449865))

(assert (= (and b!1449877 res!981266) b!1449878))

(assert (= (and b!1449878 res!981275) b!1449882))

(assert (= (and b!1449882 res!981267) b!1449870))

(assert (= (and b!1449870 (not res!981276)) b!1449880))

(assert (= (and b!1449880 res!981270) b!1449881))

(assert (= (and b!1449882 (not res!981273)) b!1449866))

(assert (= (and b!1449866 (not res!981272)) b!1449869))

(declare-fun m!1338547 () Bool)

(assert (=> b!1449870 m!1338547))

(declare-fun m!1338549 () Bool)

(assert (=> b!1449870 m!1338549))

(declare-fun m!1338551 () Bool)

(assert (=> b!1449870 m!1338551))

(declare-fun m!1338553 () Bool)

(assert (=> b!1449870 m!1338553))

(declare-fun m!1338555 () Bool)

(assert (=> b!1449865 m!1338555))

(declare-fun m!1338557 () Bool)

(assert (=> b!1449865 m!1338557))

(declare-fun m!1338559 () Bool)

(assert (=> b!1449868 m!1338559))

(declare-fun m!1338561 () Bool)

(assert (=> b!1449882 m!1338561))

(assert (=> b!1449882 m!1338549))

(declare-fun m!1338563 () Bool)

(assert (=> b!1449882 m!1338563))

(assert (=> b!1449882 m!1338551))

(assert (=> b!1449882 m!1338547))

(assert (=> b!1449882 m!1338553))

(declare-fun m!1338565 () Bool)

(assert (=> b!1449882 m!1338565))

(declare-fun m!1338567 () Bool)

(assert (=> b!1449882 m!1338567))

(assert (=> b!1449882 m!1338553))

(assert (=> b!1449871 m!1338549))

(declare-fun m!1338569 () Bool)

(assert (=> b!1449871 m!1338569))

(assert (=> b!1449876 m!1338553))

(assert (=> b!1449876 m!1338553))

(declare-fun m!1338571 () Bool)

(assert (=> b!1449876 m!1338571))

(assert (=> b!1449876 m!1338571))

(assert (=> b!1449876 m!1338553))

(declare-fun m!1338573 () Bool)

(assert (=> b!1449876 m!1338573))

(assert (=> b!1449867 m!1338553))

(assert (=> b!1449867 m!1338553))

(declare-fun m!1338575 () Bool)

(assert (=> b!1449867 m!1338575))

(assert (=> b!1449880 m!1338553))

(assert (=> b!1449880 m!1338553))

(declare-fun m!1338577 () Bool)

(assert (=> b!1449880 m!1338577))

(assert (=> b!1449864 m!1338553))

(assert (=> b!1449864 m!1338553))

(declare-fun m!1338579 () Bool)

(assert (=> b!1449864 m!1338579))

(declare-fun m!1338581 () Bool)

(assert (=> b!1449872 m!1338581))

(assert (=> b!1449866 m!1338553))

(assert (=> b!1449866 m!1338553))

(declare-fun m!1338583 () Bool)

(assert (=> b!1449866 m!1338583))

(declare-fun m!1338585 () Bool)

(assert (=> start!124864 m!1338585))

(declare-fun m!1338587 () Bool)

(assert (=> start!124864 m!1338587))

(declare-fun m!1338589 () Bool)

(assert (=> b!1449879 m!1338589))

(assert (=> b!1449879 m!1338589))

(declare-fun m!1338591 () Bool)

(assert (=> b!1449879 m!1338591))

(declare-fun m!1338593 () Bool)

(assert (=> b!1449875 m!1338593))

(assert (=> b!1449875 m!1338593))

(declare-fun m!1338595 () Bool)

(assert (=> b!1449875 m!1338595))

(assert (=> b!1449875 m!1338549))

(declare-fun m!1338597 () Bool)

(assert (=> b!1449875 m!1338597))

(assert (=> b!1449869 m!1338555))

(declare-fun m!1338599 () Bool)

(assert (=> b!1449869 m!1338599))

(declare-fun m!1338601 () Bool)

(assert (=> b!1449874 m!1338601))

(push 1)

