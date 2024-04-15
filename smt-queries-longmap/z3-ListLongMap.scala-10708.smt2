; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125356 () Bool)

(assert start!125356)

(declare-fun b!1466016 () Bool)

(declare-fun res!994891 () Bool)

(declare-fun e!823653 () Bool)

(assert (=> b!1466016 (=> (not res!994891) (not e!823653))))

(declare-datatypes ((array!98782 0))(
  ( (array!98783 (arr!47680 (Array (_ BitVec 32) (_ BitVec 64))) (size!48232 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98782)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466016 (= res!994891 (validKeyInArray!0 (select (arr!47680 a!2862) i!1006)))))

(declare-fun b!1466017 () Bool)

(declare-fun res!994883 () Bool)

(declare-fun e!823646 () Bool)

(assert (=> b!1466017 (=> res!994883 e!823646)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466017 (= res!994883 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!823648 () Bool)

(declare-fun lt!641441 () array!98782)

(declare-fun b!1466018 () Bool)

(declare-fun lt!641439 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11957 0))(
  ( (MissingZero!11957 (index!50220 (_ BitVec 32))) (Found!11957 (index!50221 (_ BitVec 32))) (Intermediate!11957 (undefined!12769 Bool) (index!50222 (_ BitVec 32)) (x!131793 (_ BitVec 32))) (Undefined!11957) (MissingVacant!11957 (index!50223 (_ BitVec 32))) )
))
(declare-fun lt!641438 () SeekEntryResult!11957)

(declare-fun lt!641435 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98782 (_ BitVec 32)) SeekEntryResult!11957)

(assert (=> b!1466018 (= e!823648 (not (= lt!641438 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 lt!641435 lt!641441 mask!2687))))))

(declare-fun b!1466019 () Bool)

(declare-fun e!823652 () Bool)

(assert (=> b!1466019 (= e!823653 e!823652)))

(declare-fun res!994889 () Bool)

(assert (=> b!1466019 (=> (not res!994889) (not e!823652))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466019 (= res!994889 (= (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466019 (= lt!641441 (array!98783 (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48232 a!2862)))))

(declare-fun b!1466020 () Bool)

(declare-fun res!994882 () Bool)

(declare-fun e!823651 () Bool)

(assert (=> b!1466020 (=> (not res!994882) (not e!823651))))

(declare-fun lt!641436 () SeekEntryResult!11957)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1466020 (= res!994882 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!641436))))

(declare-fun b!1466021 () Bool)

(declare-fun res!994894 () Bool)

(assert (=> b!1466021 (=> (not res!994894) (not e!823653))))

(assert (=> b!1466021 (= res!994894 (validKeyInArray!0 (select (arr!47680 a!2862) j!93)))))

(declare-fun b!1466022 () Bool)

(declare-fun res!994893 () Bool)

(assert (=> b!1466022 (=> (not res!994893) (not e!823653))))

(assert (=> b!1466022 (= res!994893 (and (= (size!48232 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48232 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48232 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466023 () Bool)

(declare-fun e!823650 () Bool)

(declare-fun e!823649 () Bool)

(assert (=> b!1466023 (= e!823650 (not e!823649))))

(declare-fun res!994896 () Bool)

(assert (=> b!1466023 (=> res!994896 e!823649)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466023 (= res!994896 (or (and (= (select (arr!47680 a!2862) index!646) (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47680 a!2862) index!646) (select (arr!47680 a!2862) j!93))) (= (select (arr!47680 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!641437 () SeekEntryResult!11957)

(assert (=> b!1466023 (and (= lt!641437 (Found!11957 j!93)) (or (= (select (arr!47680 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47680 a!2862) intermediateBeforeIndex!19) (select (arr!47680 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98782 (_ BitVec 32)) SeekEntryResult!11957)

(assert (=> b!1466023 (= lt!641437 (seekEntryOrOpen!0 (select (arr!47680 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98782 (_ BitVec 32)) Bool)

(assert (=> b!1466023 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49251 0))(
  ( (Unit!49252) )
))
(declare-fun lt!641442 () Unit!49251)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49251)

(assert (=> b!1466023 (= lt!641442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466024 () Bool)

(declare-fun e!823645 () Bool)

(assert (=> b!1466024 (= e!823645 (= lt!641438 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641435 lt!641441 mask!2687)))))

(declare-fun b!1466025 () Bool)

(assert (=> b!1466025 (= e!823651 e!823650)))

(declare-fun res!994890 () Bool)

(assert (=> b!1466025 (=> (not res!994890) (not e!823650))))

(assert (=> b!1466025 (= res!994890 (= lt!641438 (Intermediate!11957 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466025 (= lt!641438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641435 mask!2687) lt!641435 lt!641441 mask!2687))))

(assert (=> b!1466025 (= lt!641435 (select (store (arr!47680 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466026 () Bool)

(assert (=> b!1466026 (= e!823652 e!823651)))

(declare-fun res!994886 () Bool)

(assert (=> b!1466026 (=> (not res!994886) (not e!823651))))

(assert (=> b!1466026 (= res!994886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47680 a!2862) j!93) mask!2687) (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!641436))))

(assert (=> b!1466026 (= lt!641436 (Intermediate!11957 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466027 () Bool)

(declare-fun res!994884 () Bool)

(assert (=> b!1466027 (=> (not res!994884) (not e!823653))))

(assert (=> b!1466027 (= res!994884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466028 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98782 (_ BitVec 32)) SeekEntryResult!11957)

(assert (=> b!1466028 (= e!823645 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641435 lt!641441 mask!2687) (seekEntryOrOpen!0 lt!641435 lt!641441 mask!2687)))))

(declare-fun b!1466029 () Bool)

(declare-fun res!994897 () Bool)

(assert (=> b!1466029 (=> (not res!994897) (not e!823653))))

(assert (=> b!1466029 (= res!994897 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48232 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48232 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48232 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466030 () Bool)

(assert (=> b!1466030 (= e!823649 e!823646)))

(declare-fun res!994887 () Bool)

(assert (=> b!1466030 (=> res!994887 e!823646)))

(assert (=> b!1466030 (= res!994887 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641439 #b00000000000000000000000000000000) (bvsge lt!641439 (size!48232 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466030 (= lt!641439 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466031 () Bool)

(declare-fun res!994892 () Bool)

(assert (=> b!1466031 (=> (not res!994892) (not e!823650))))

(assert (=> b!1466031 (= res!994892 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466032 () Bool)

(declare-fun res!994881 () Bool)

(assert (=> b!1466032 (=> (not res!994881) (not e!823650))))

(assert (=> b!1466032 (= res!994881 e!823645)))

(declare-fun c!135082 () Bool)

(assert (=> b!1466032 (= c!135082 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466033 () Bool)

(declare-fun res!994885 () Bool)

(assert (=> b!1466033 (=> res!994885 e!823646)))

(assert (=> b!1466033 (= res!994885 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 (select (arr!47680 a!2862) j!93) a!2862 mask!2687) lt!641436)))))

(declare-fun b!1466034 () Bool)

(assert (=> b!1466034 (= e!823648 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 intermediateAfterIndex!19 lt!641435 lt!641441 mask!2687) (seekEntryOrOpen!0 lt!641435 lt!641441 mask!2687))))))

(declare-fun b!1466035 () Bool)

(assert (=> b!1466035 (= e!823646 true)))

(assert (=> b!1466035 (= lt!641437 (seekEntryOrOpen!0 lt!641435 lt!641441 mask!2687))))

(declare-fun lt!641440 () Unit!49251)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49251)

(assert (=> b!1466035 (= lt!641440 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641439 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466036 () Bool)

(declare-fun res!994895 () Bool)

(assert (=> b!1466036 (=> res!994895 e!823646)))

(assert (=> b!1466036 (= res!994895 e!823648)))

(declare-fun c!135081 () Bool)

(assert (=> b!1466036 (= c!135081 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466037 () Bool)

(declare-fun res!994888 () Bool)

(assert (=> b!1466037 (=> (not res!994888) (not e!823653))))

(declare-datatypes ((List!34259 0))(
  ( (Nil!34256) (Cons!34255 (h!35605 (_ BitVec 64)) (t!48945 List!34259)) )
))
(declare-fun arrayNoDuplicates!0 (array!98782 (_ BitVec 32) List!34259) Bool)

(assert (=> b!1466037 (= res!994888 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34256))))

(declare-fun res!994880 () Bool)

(assert (=> start!125356 (=> (not res!994880) (not e!823653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125356 (= res!994880 (validMask!0 mask!2687))))

(assert (=> start!125356 e!823653))

(assert (=> start!125356 true))

(declare-fun array_inv!36913 (array!98782) Bool)

(assert (=> start!125356 (array_inv!36913 a!2862)))

(assert (= (and start!125356 res!994880) b!1466022))

(assert (= (and b!1466022 res!994893) b!1466016))

(assert (= (and b!1466016 res!994891) b!1466021))

(assert (= (and b!1466021 res!994894) b!1466027))

(assert (= (and b!1466027 res!994884) b!1466037))

(assert (= (and b!1466037 res!994888) b!1466029))

(assert (= (and b!1466029 res!994897) b!1466019))

(assert (= (and b!1466019 res!994889) b!1466026))

(assert (= (and b!1466026 res!994886) b!1466020))

(assert (= (and b!1466020 res!994882) b!1466025))

(assert (= (and b!1466025 res!994890) b!1466032))

(assert (= (and b!1466032 c!135082) b!1466024))

(assert (= (and b!1466032 (not c!135082)) b!1466028))

(assert (= (and b!1466032 res!994881) b!1466031))

(assert (= (and b!1466031 res!994892) b!1466023))

(assert (= (and b!1466023 (not res!994896)) b!1466030))

(assert (= (and b!1466030 (not res!994887)) b!1466033))

(assert (= (and b!1466033 (not res!994885)) b!1466036))

(assert (= (and b!1466036 c!135081) b!1466018))

(assert (= (and b!1466036 (not c!135081)) b!1466034))

(assert (= (and b!1466036 (not res!994895)) b!1466017))

(assert (= (and b!1466017 (not res!994883)) b!1466035))

(declare-fun m!1352547 () Bool)

(assert (=> b!1466021 m!1352547))

(assert (=> b!1466021 m!1352547))

(declare-fun m!1352549 () Bool)

(assert (=> b!1466021 m!1352549))

(declare-fun m!1352551 () Bool)

(assert (=> b!1466028 m!1352551))

(declare-fun m!1352553 () Bool)

(assert (=> b!1466028 m!1352553))

(declare-fun m!1352555 () Bool)

(assert (=> b!1466024 m!1352555))

(declare-fun m!1352557 () Bool)

(assert (=> b!1466027 m!1352557))

(assert (=> b!1466026 m!1352547))

(assert (=> b!1466026 m!1352547))

(declare-fun m!1352559 () Bool)

(assert (=> b!1466026 m!1352559))

(assert (=> b!1466026 m!1352559))

(assert (=> b!1466026 m!1352547))

(declare-fun m!1352561 () Bool)

(assert (=> b!1466026 m!1352561))

(declare-fun m!1352563 () Bool)

(assert (=> b!1466034 m!1352563))

(assert (=> b!1466034 m!1352553))

(assert (=> b!1466033 m!1352547))

(assert (=> b!1466033 m!1352547))

(declare-fun m!1352565 () Bool)

(assert (=> b!1466033 m!1352565))

(declare-fun m!1352567 () Bool)

(assert (=> b!1466030 m!1352567))

(declare-fun m!1352569 () Bool)

(assert (=> b!1466016 m!1352569))

(assert (=> b!1466016 m!1352569))

(declare-fun m!1352571 () Bool)

(assert (=> b!1466016 m!1352571))

(declare-fun m!1352573 () Bool)

(assert (=> b!1466023 m!1352573))

(declare-fun m!1352575 () Bool)

(assert (=> b!1466023 m!1352575))

(declare-fun m!1352577 () Bool)

(assert (=> b!1466023 m!1352577))

(declare-fun m!1352579 () Bool)

(assert (=> b!1466023 m!1352579))

(declare-fun m!1352581 () Bool)

(assert (=> b!1466023 m!1352581))

(assert (=> b!1466023 m!1352547))

(declare-fun m!1352583 () Bool)

(assert (=> b!1466023 m!1352583))

(declare-fun m!1352585 () Bool)

(assert (=> b!1466023 m!1352585))

(assert (=> b!1466023 m!1352547))

(declare-fun m!1352587 () Bool)

(assert (=> b!1466018 m!1352587))

(assert (=> b!1466020 m!1352547))

(assert (=> b!1466020 m!1352547))

(declare-fun m!1352589 () Bool)

(assert (=> b!1466020 m!1352589))

(assert (=> b!1466019 m!1352575))

(declare-fun m!1352591 () Bool)

(assert (=> b!1466019 m!1352591))

(declare-fun m!1352593 () Bool)

(assert (=> b!1466037 m!1352593))

(assert (=> b!1466035 m!1352553))

(declare-fun m!1352595 () Bool)

(assert (=> b!1466035 m!1352595))

(declare-fun m!1352597 () Bool)

(assert (=> b!1466025 m!1352597))

(assert (=> b!1466025 m!1352597))

(declare-fun m!1352599 () Bool)

(assert (=> b!1466025 m!1352599))

(assert (=> b!1466025 m!1352575))

(declare-fun m!1352601 () Bool)

(assert (=> b!1466025 m!1352601))

(declare-fun m!1352603 () Bool)

(assert (=> start!125356 m!1352603))

(declare-fun m!1352605 () Bool)

(assert (=> start!125356 m!1352605))

(check-sat (not b!1466016) (not b!1466026) (not b!1466033) (not b!1466030) (not b!1466025) (not b!1466023) (not b!1466037) (not b!1466028) (not start!125356) (not b!1466034) (not b!1466018) (not b!1466035) (not b!1466021) (not b!1466024) (not b!1466027) (not b!1466020))
(check-sat)
