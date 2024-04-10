; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126750 () Bool)

(assert start!126750)

(declare-fun b!1488070 () Bool)

(declare-fun e!834107 () Bool)

(declare-fun e!834109 () Bool)

(assert (=> b!1488070 (= e!834107 e!834109)))

(declare-fun res!1012013 () Bool)

(assert (=> b!1488070 (=> (not res!1012013) (not e!834109))))

(declare-datatypes ((SeekEntryResult!12306 0))(
  ( (MissingZero!12306 (index!51616 (_ BitVec 32))) (Found!12306 (index!51617 (_ BitVec 32))) (Intermediate!12306 (undefined!13118 Bool) (index!51618 (_ BitVec 32)) (x!133206 (_ BitVec 32))) (Undefined!12306) (MissingVacant!12306 (index!51619 (_ BitVec 32))) )
))
(declare-fun lt!649054 () SeekEntryResult!12306)

(declare-datatypes ((array!99586 0))(
  ( (array!99587 (arr!48066 (Array (_ BitVec 32) (_ BitVec 64))) (size!48616 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99586)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99586 (_ BitVec 32)) SeekEntryResult!12306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488070 (= res!1012013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649054))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488070 (= lt!649054 (Intermediate!12306 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488071 () Bool)

(declare-fun e!834103 () Bool)

(assert (=> b!1488071 (= e!834109 e!834103)))

(declare-fun res!1012014 () Bool)

(assert (=> b!1488071 (=> (not res!1012014) (not e!834103))))

(declare-fun lt!649050 () SeekEntryResult!12306)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488071 (= res!1012014 (= lt!649050 (Intermediate!12306 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649055 () array!99586)

(declare-fun lt!649056 () (_ BitVec 64))

(assert (=> b!1488071 (= lt!649050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649056 mask!2687) lt!649056 lt!649055 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488071 (= lt!649056 (select (store (arr!48066 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!649052 () SeekEntryResult!12306)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!834101 () Bool)

(declare-fun lt!649053 () (_ BitVec 32))

(declare-fun b!1488072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99586 (_ BitVec 32)) SeekEntryResult!12306)

(assert (=> b!1488072 (= e!834101 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649053 intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687) lt!649052))))

(declare-fun b!1488073 () Bool)

(declare-fun res!1012015 () Bool)

(declare-fun e!834108 () Bool)

(assert (=> b!1488073 (=> (not res!1012015) (not e!834108))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99586 (_ BitVec 32)) SeekEntryResult!12306)

(assert (=> b!1488073 (= res!1012015 (= (seekEntryOrOpen!0 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) (Found!12306 j!93)))))

(declare-fun b!1488074 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!834105 () Bool)

(assert (=> b!1488074 (= e!834105 (= lt!649050 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649056 lt!649055 mask!2687)))))

(declare-fun b!1488075 () Bool)

(declare-fun res!1012008 () Bool)

(declare-fun e!834104 () Bool)

(assert (=> b!1488075 (=> (not res!1012008) (not e!834104))))

(assert (=> b!1488075 (= res!1012008 (and (= (size!48616 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48616 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48616 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488076 () Bool)

(assert (=> b!1488076 (= e!834105 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687) (seekEntryOrOpen!0 lt!649056 lt!649055 mask!2687)))))

(declare-fun b!1488077 () Bool)

(declare-fun res!1012006 () Bool)

(assert (=> b!1488077 (=> (not res!1012006) (not e!834104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488077 (= res!1012006 (validKeyInArray!0 (select (arr!48066 a!2862) j!93)))))

(declare-fun b!1488078 () Bool)

(declare-fun res!1012011 () Bool)

(assert (=> b!1488078 (=> (not res!1012011) (not e!834103))))

(assert (=> b!1488078 (= res!1012011 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488079 () Bool)

(declare-fun res!1012004 () Bool)

(assert (=> b!1488079 (=> (not res!1012004) (not e!834109))))

(assert (=> b!1488079 (= res!1012004 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649054))))

(declare-fun b!1488080 () Bool)

(assert (=> b!1488080 (= e!834101 (= lt!649050 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649053 lt!649056 lt!649055 mask!2687)))))

(declare-fun b!1488081 () Bool)

(declare-fun res!1012019 () Bool)

(assert (=> b!1488081 (=> (not res!1012019) (not e!834103))))

(assert (=> b!1488081 (= res!1012019 e!834105)))

(declare-fun c!137559 () Bool)

(assert (=> b!1488081 (= c!137559 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488082 () Bool)

(declare-fun res!1012009 () Bool)

(assert (=> b!1488082 (=> (not res!1012009) (not e!834104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99586 (_ BitVec 32)) Bool)

(assert (=> b!1488082 (= res!1012009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1012021 () Bool)

(assert (=> start!126750 (=> (not res!1012021) (not e!834104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126750 (= res!1012021 (validMask!0 mask!2687))))

(assert (=> start!126750 e!834104))

(assert (=> start!126750 true))

(declare-fun array_inv!37094 (array!99586) Bool)

(assert (=> start!126750 (array_inv!37094 a!2862)))

(declare-fun b!1488069 () Bool)

(assert (=> b!1488069 (= e!834108 (and (or (= (select (arr!48066 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48066 a!2862) intermediateBeforeIndex!19) (select (arr!48066 a!2862) j!93))) (let ((bdg!54639 (select (store (arr!48066 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48066 a!2862) index!646) bdg!54639) (= (select (arr!48066 a!2862) index!646) (select (arr!48066 a!2862) j!93))) (= (select (arr!48066 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54639 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488083 () Bool)

(assert (=> b!1488083 (= e!834104 e!834107)))

(declare-fun res!1012016 () Bool)

(assert (=> b!1488083 (=> (not res!1012016) (not e!834107))))

(assert (=> b!1488083 (= res!1012016 (= (select (store (arr!48066 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488083 (= lt!649055 (array!99587 (store (arr!48066 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48616 a!2862)))))

(declare-fun b!1488084 () Bool)

(declare-fun e!834102 () Bool)

(assert (=> b!1488084 (= e!834102 e!834101)))

(declare-fun c!137558 () Bool)

(assert (=> b!1488084 (= c!137558 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488085 () Bool)

(declare-fun e!834106 () Bool)

(assert (=> b!1488085 (= e!834103 (not e!834106))))

(declare-fun res!1012005 () Bool)

(assert (=> b!1488085 (=> res!1012005 e!834106)))

(assert (=> b!1488085 (= res!1012005 (or (and (= (select (arr!48066 a!2862) index!646) (select (store (arr!48066 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48066 a!2862) index!646) (select (arr!48066 a!2862) j!93))) (= (select (arr!48066 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488085 e!834108))

(declare-fun res!1012018 () Bool)

(assert (=> b!1488085 (=> (not res!1012018) (not e!834108))))

(assert (=> b!1488085 (= res!1012018 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49952 0))(
  ( (Unit!49953) )
))
(declare-fun lt!649051 () Unit!49952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49952)

(assert (=> b!1488085 (= lt!649051 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488086 () Bool)

(declare-fun res!1012010 () Bool)

(assert (=> b!1488086 (=> res!1012010 e!834102)))

(assert (=> b!1488086 (= res!1012010 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649053 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649054)))))

(declare-fun b!1488087 () Bool)

(declare-fun res!1012012 () Bool)

(assert (=> b!1488087 (=> (not res!1012012) (not e!834104))))

(assert (=> b!1488087 (= res!1012012 (validKeyInArray!0 (select (arr!48066 a!2862) i!1006)))))

(declare-fun b!1488088 () Bool)

(declare-fun res!1012020 () Bool)

(assert (=> b!1488088 (=> (not res!1012020) (not e!834104))))

(assert (=> b!1488088 (= res!1012020 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48616 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48616 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48616 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488089 () Bool)

(declare-fun res!1012017 () Bool)

(assert (=> b!1488089 (=> (not res!1012017) (not e!834104))))

(declare-datatypes ((List!34567 0))(
  ( (Nil!34564) (Cons!34563 (h!35943 (_ BitVec 64)) (t!49261 List!34567)) )
))
(declare-fun arrayNoDuplicates!0 (array!99586 (_ BitVec 32) List!34567) Bool)

(assert (=> b!1488089 (= res!1012017 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34564))))

(declare-fun b!1488090 () Bool)

(assert (=> b!1488090 (= e!834106 e!834102)))

(declare-fun res!1012007 () Bool)

(assert (=> b!1488090 (=> res!1012007 e!834102)))

(assert (=> b!1488090 (= res!1012007 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649053 #b00000000000000000000000000000000) (bvsge lt!649053 (size!48616 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488090 (= lt!649053 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1488090 (= lt!649052 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687))))

(assert (=> b!1488090 (= lt!649052 (seekEntryOrOpen!0 lt!649056 lt!649055 mask!2687))))

(assert (= (and start!126750 res!1012021) b!1488075))

(assert (= (and b!1488075 res!1012008) b!1488087))

(assert (= (and b!1488087 res!1012012) b!1488077))

(assert (= (and b!1488077 res!1012006) b!1488082))

(assert (= (and b!1488082 res!1012009) b!1488089))

(assert (= (and b!1488089 res!1012017) b!1488088))

(assert (= (and b!1488088 res!1012020) b!1488083))

(assert (= (and b!1488083 res!1012016) b!1488070))

(assert (= (and b!1488070 res!1012013) b!1488079))

(assert (= (and b!1488079 res!1012004) b!1488071))

(assert (= (and b!1488071 res!1012014) b!1488081))

(assert (= (and b!1488081 c!137559) b!1488074))

(assert (= (and b!1488081 (not c!137559)) b!1488076))

(assert (= (and b!1488081 res!1012019) b!1488078))

(assert (= (and b!1488078 res!1012011) b!1488085))

(assert (= (and b!1488085 res!1012018) b!1488073))

(assert (= (and b!1488073 res!1012015) b!1488069))

(assert (= (and b!1488085 (not res!1012005)) b!1488090))

(assert (= (and b!1488090 (not res!1012007)) b!1488086))

(assert (= (and b!1488086 (not res!1012010)) b!1488084))

(assert (= (and b!1488084 c!137558) b!1488080))

(assert (= (and b!1488084 (not c!137558)) b!1488072))

(declare-fun m!1372583 () Bool)

(assert (=> b!1488076 m!1372583))

(declare-fun m!1372585 () Bool)

(assert (=> b!1488076 m!1372585))

(declare-fun m!1372587 () Bool)

(assert (=> b!1488072 m!1372587))

(declare-fun m!1372589 () Bool)

(assert (=> b!1488087 m!1372589))

(assert (=> b!1488087 m!1372589))

(declare-fun m!1372591 () Bool)

(assert (=> b!1488087 m!1372591))

(declare-fun m!1372593 () Bool)

(assert (=> b!1488085 m!1372593))

(declare-fun m!1372595 () Bool)

(assert (=> b!1488085 m!1372595))

(declare-fun m!1372597 () Bool)

(assert (=> b!1488085 m!1372597))

(declare-fun m!1372599 () Bool)

(assert (=> b!1488085 m!1372599))

(declare-fun m!1372601 () Bool)

(assert (=> b!1488085 m!1372601))

(declare-fun m!1372603 () Bool)

(assert (=> b!1488085 m!1372603))

(declare-fun m!1372605 () Bool)

(assert (=> b!1488074 m!1372605))

(declare-fun m!1372607 () Bool)

(assert (=> start!126750 m!1372607))

(declare-fun m!1372609 () Bool)

(assert (=> start!126750 m!1372609))

(assert (=> b!1488086 m!1372603))

(assert (=> b!1488086 m!1372603))

(declare-fun m!1372611 () Bool)

(assert (=> b!1488086 m!1372611))

(declare-fun m!1372613 () Bool)

(assert (=> b!1488090 m!1372613))

(assert (=> b!1488090 m!1372583))

(assert (=> b!1488090 m!1372585))

(assert (=> b!1488073 m!1372603))

(assert (=> b!1488073 m!1372603))

(declare-fun m!1372615 () Bool)

(assert (=> b!1488073 m!1372615))

(assert (=> b!1488083 m!1372595))

(declare-fun m!1372617 () Bool)

(assert (=> b!1488083 m!1372617))

(assert (=> b!1488079 m!1372603))

(assert (=> b!1488079 m!1372603))

(declare-fun m!1372619 () Bool)

(assert (=> b!1488079 m!1372619))

(assert (=> b!1488069 m!1372595))

(declare-fun m!1372621 () Bool)

(assert (=> b!1488069 m!1372621))

(assert (=> b!1488069 m!1372597))

(assert (=> b!1488069 m!1372599))

(assert (=> b!1488069 m!1372603))

(declare-fun m!1372623 () Bool)

(assert (=> b!1488071 m!1372623))

(assert (=> b!1488071 m!1372623))

(declare-fun m!1372625 () Bool)

(assert (=> b!1488071 m!1372625))

(assert (=> b!1488071 m!1372595))

(declare-fun m!1372627 () Bool)

(assert (=> b!1488071 m!1372627))

(declare-fun m!1372629 () Bool)

(assert (=> b!1488080 m!1372629))

(assert (=> b!1488077 m!1372603))

(assert (=> b!1488077 m!1372603))

(declare-fun m!1372631 () Bool)

(assert (=> b!1488077 m!1372631))

(declare-fun m!1372633 () Bool)

(assert (=> b!1488089 m!1372633))

(declare-fun m!1372635 () Bool)

(assert (=> b!1488082 m!1372635))

(assert (=> b!1488070 m!1372603))

(assert (=> b!1488070 m!1372603))

(declare-fun m!1372637 () Bool)

(assert (=> b!1488070 m!1372637))

(assert (=> b!1488070 m!1372637))

(assert (=> b!1488070 m!1372603))

(declare-fun m!1372639 () Bool)

(assert (=> b!1488070 m!1372639))

(check-sat (not b!1488079) (not b!1488070) (not b!1488074) (not b!1488077) (not start!126750) (not b!1488072) (not b!1488090) (not b!1488086) (not b!1488089) (not b!1488073) (not b!1488076) (not b!1488071) (not b!1488087) (not b!1488085) (not b!1488080) (not b!1488082))
(check-sat)
(get-model)

(declare-fun d!156659 () Bool)

(declare-fun e!834151 () Bool)

(assert (=> d!156659 e!834151))

(declare-fun c!137573 () Bool)

(declare-fun lt!649083 () SeekEntryResult!12306)

(get-info :version)

(assert (=> d!156659 (= c!137573 (and ((_ is Intermediate!12306) lt!649083) (undefined!13118 lt!649083)))))

(declare-fun e!834155 () SeekEntryResult!12306)

(assert (=> d!156659 (= lt!649083 e!834155)))

(declare-fun c!137574 () Bool)

(assert (=> d!156659 (= c!137574 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649082 () (_ BitVec 64))

(assert (=> d!156659 (= lt!649082 (select (arr!48066 lt!649055) lt!649053))))

(assert (=> d!156659 (validMask!0 mask!2687)))

(assert (=> d!156659 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649053 lt!649056 lt!649055 mask!2687) lt!649083)))

(declare-fun b!1488175 () Bool)

(assert (=> b!1488175 (and (bvsge (index!51618 lt!649083) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649083) (size!48616 lt!649055)))))

(declare-fun res!1012083 () Bool)

(assert (=> b!1488175 (= res!1012083 (= (select (arr!48066 lt!649055) (index!51618 lt!649083)) lt!649056))))

(declare-fun e!834154 () Bool)

(assert (=> b!1488175 (=> res!1012083 e!834154)))

(declare-fun e!834152 () Bool)

(assert (=> b!1488175 (= e!834152 e!834154)))

(declare-fun b!1488176 () Bool)

(assert (=> b!1488176 (= e!834151 (bvsge (x!133206 lt!649083) #b01111111111111111111111111111110))))

(declare-fun b!1488177 () Bool)

(declare-fun e!834153 () SeekEntryResult!12306)

(assert (=> b!1488177 (= e!834153 (Intermediate!12306 false lt!649053 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488178 () Bool)

(assert (=> b!1488178 (= e!834153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649053 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!649056 lt!649055 mask!2687))))

(declare-fun b!1488179 () Bool)

(assert (=> b!1488179 (= e!834155 (Intermediate!12306 true lt!649053 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488180 () Bool)

(assert (=> b!1488180 (and (bvsge (index!51618 lt!649083) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649083) (size!48616 lt!649055)))))

(declare-fun res!1012082 () Bool)

(assert (=> b!1488180 (= res!1012082 (= (select (arr!48066 lt!649055) (index!51618 lt!649083)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488180 (=> res!1012082 e!834154)))

(declare-fun b!1488181 () Bool)

(assert (=> b!1488181 (and (bvsge (index!51618 lt!649083) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649083) (size!48616 lt!649055)))))

(assert (=> b!1488181 (= e!834154 (= (select (arr!48066 lt!649055) (index!51618 lt!649083)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488182 () Bool)

(assert (=> b!1488182 (= e!834151 e!834152)))

(declare-fun res!1012084 () Bool)

(assert (=> b!1488182 (= res!1012084 (and ((_ is Intermediate!12306) lt!649083) (not (undefined!13118 lt!649083)) (bvslt (x!133206 lt!649083) #b01111111111111111111111111111110) (bvsge (x!133206 lt!649083) #b00000000000000000000000000000000) (bvsge (x!133206 lt!649083) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1488182 (=> (not res!1012084) (not e!834152))))

(declare-fun b!1488183 () Bool)

(assert (=> b!1488183 (= e!834155 e!834153)))

(declare-fun c!137572 () Bool)

(assert (=> b!1488183 (= c!137572 (or (= lt!649082 lt!649056) (= (bvadd lt!649082 lt!649082) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156659 c!137574) b!1488179))

(assert (= (and d!156659 (not c!137574)) b!1488183))

(assert (= (and b!1488183 c!137572) b!1488177))

(assert (= (and b!1488183 (not c!137572)) b!1488178))

(assert (= (and d!156659 c!137573) b!1488176))

(assert (= (and d!156659 (not c!137573)) b!1488182))

(assert (= (and b!1488182 res!1012084) b!1488175))

(assert (= (and b!1488175 (not res!1012083)) b!1488180))

(assert (= (and b!1488180 (not res!1012082)) b!1488181))

(declare-fun m!1372699 () Bool)

(assert (=> b!1488180 m!1372699))

(declare-fun m!1372701 () Bool)

(assert (=> b!1488178 m!1372701))

(assert (=> b!1488178 m!1372701))

(declare-fun m!1372703 () Bool)

(assert (=> b!1488178 m!1372703))

(declare-fun m!1372705 () Bool)

(assert (=> d!156659 m!1372705))

(assert (=> d!156659 m!1372607))

(assert (=> b!1488175 m!1372699))

(assert (=> b!1488181 m!1372699))

(assert (=> b!1488080 d!156659))

(declare-fun d!156661 () Bool)

(assert (=> d!156661 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126750 d!156661))

(declare-fun d!156663 () Bool)

(assert (=> d!156663 (= (array_inv!37094 a!2862) (bvsge (size!48616 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126750 d!156663))

(declare-fun d!156665 () Bool)

(declare-fun e!834156 () Bool)

(assert (=> d!156665 e!834156))

(declare-fun c!137576 () Bool)

(declare-fun lt!649085 () SeekEntryResult!12306)

(assert (=> d!156665 (= c!137576 (and ((_ is Intermediate!12306) lt!649085) (undefined!13118 lt!649085)))))

(declare-fun e!834160 () SeekEntryResult!12306)

(assert (=> d!156665 (= lt!649085 e!834160)))

(declare-fun c!137577 () Bool)

(assert (=> d!156665 (= c!137577 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!649084 () (_ BitVec 64))

(assert (=> d!156665 (= lt!649084 (select (arr!48066 a!2862) (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687)))))

(assert (=> d!156665 (validMask!0 mask!2687)))

(assert (=> d!156665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649085)))

(declare-fun b!1488184 () Bool)

(assert (=> b!1488184 (and (bvsge (index!51618 lt!649085) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649085) (size!48616 a!2862)))))

(declare-fun res!1012086 () Bool)

(assert (=> b!1488184 (= res!1012086 (= (select (arr!48066 a!2862) (index!51618 lt!649085)) (select (arr!48066 a!2862) j!93)))))

(declare-fun e!834159 () Bool)

(assert (=> b!1488184 (=> res!1012086 e!834159)))

(declare-fun e!834157 () Bool)

(assert (=> b!1488184 (= e!834157 e!834159)))

(declare-fun b!1488185 () Bool)

(assert (=> b!1488185 (= e!834156 (bvsge (x!133206 lt!649085) #b01111111111111111111111111111110))))

(declare-fun e!834158 () SeekEntryResult!12306)

(declare-fun b!1488186 () Bool)

(assert (=> b!1488186 (= e!834158 (Intermediate!12306 false (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488187 () Bool)

(assert (=> b!1488187 (= e!834158 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48066 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488188 () Bool)

(assert (=> b!1488188 (= e!834160 (Intermediate!12306 true (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488189 () Bool)

(assert (=> b!1488189 (and (bvsge (index!51618 lt!649085) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649085) (size!48616 a!2862)))))

(declare-fun res!1012085 () Bool)

(assert (=> b!1488189 (= res!1012085 (= (select (arr!48066 a!2862) (index!51618 lt!649085)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488189 (=> res!1012085 e!834159)))

(declare-fun b!1488190 () Bool)

(assert (=> b!1488190 (and (bvsge (index!51618 lt!649085) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649085) (size!48616 a!2862)))))

(assert (=> b!1488190 (= e!834159 (= (select (arr!48066 a!2862) (index!51618 lt!649085)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488191 () Bool)

(assert (=> b!1488191 (= e!834156 e!834157)))

(declare-fun res!1012087 () Bool)

(assert (=> b!1488191 (= res!1012087 (and ((_ is Intermediate!12306) lt!649085) (not (undefined!13118 lt!649085)) (bvslt (x!133206 lt!649085) #b01111111111111111111111111111110) (bvsge (x!133206 lt!649085) #b00000000000000000000000000000000) (bvsge (x!133206 lt!649085) #b00000000000000000000000000000000)))))

(assert (=> b!1488191 (=> (not res!1012087) (not e!834157))))

(declare-fun b!1488192 () Bool)

(assert (=> b!1488192 (= e!834160 e!834158)))

(declare-fun c!137575 () Bool)

(assert (=> b!1488192 (= c!137575 (or (= lt!649084 (select (arr!48066 a!2862) j!93)) (= (bvadd lt!649084 lt!649084) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156665 c!137577) b!1488188))

(assert (= (and d!156665 (not c!137577)) b!1488192))

(assert (= (and b!1488192 c!137575) b!1488186))

(assert (= (and b!1488192 (not c!137575)) b!1488187))

(assert (= (and d!156665 c!137576) b!1488185))

(assert (= (and d!156665 (not c!137576)) b!1488191))

(assert (= (and b!1488191 res!1012087) b!1488184))

(assert (= (and b!1488184 (not res!1012086)) b!1488189))

(assert (= (and b!1488189 (not res!1012085)) b!1488190))

(declare-fun m!1372707 () Bool)

(assert (=> b!1488189 m!1372707))

(assert (=> b!1488187 m!1372637))

(declare-fun m!1372709 () Bool)

(assert (=> b!1488187 m!1372709))

(assert (=> b!1488187 m!1372709))

(assert (=> b!1488187 m!1372603))

(declare-fun m!1372711 () Bool)

(assert (=> b!1488187 m!1372711))

(assert (=> d!156665 m!1372637))

(declare-fun m!1372713 () Bool)

(assert (=> d!156665 m!1372713))

(assert (=> d!156665 m!1372607))

(assert (=> b!1488184 m!1372707))

(assert (=> b!1488190 m!1372707))

(assert (=> b!1488070 d!156665))

(declare-fun d!156667 () Bool)

(declare-fun lt!649091 () (_ BitVec 32))

(declare-fun lt!649090 () (_ BitVec 32))

(assert (=> d!156667 (= lt!649091 (bvmul (bvxor lt!649090 (bvlshr lt!649090 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156667 (= lt!649090 ((_ extract 31 0) (bvand (bvxor (select (arr!48066 a!2862) j!93) (bvlshr (select (arr!48066 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156667 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012088 (let ((h!35945 ((_ extract 31 0) (bvand (bvxor (select (arr!48066 a!2862) j!93) (bvlshr (select (arr!48066 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133209 (bvmul (bvxor h!35945 (bvlshr h!35945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133209 (bvlshr x!133209 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012088 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012088 #b00000000000000000000000000000000))))))

(assert (=> d!156667 (= (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) (bvand (bvxor lt!649091 (bvlshr lt!649091 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488070 d!156667))

(declare-fun d!156669 () Bool)

(declare-fun e!834161 () Bool)

(assert (=> d!156669 e!834161))

(declare-fun c!137579 () Bool)

(declare-fun lt!649093 () SeekEntryResult!12306)

(assert (=> d!156669 (= c!137579 (and ((_ is Intermediate!12306) lt!649093) (undefined!13118 lt!649093)))))

(declare-fun e!834165 () SeekEntryResult!12306)

(assert (=> d!156669 (= lt!649093 e!834165)))

(declare-fun c!137580 () Bool)

(assert (=> d!156669 (= c!137580 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649092 () (_ BitVec 64))

(assert (=> d!156669 (= lt!649092 (select (arr!48066 a!2862) index!646))))

(assert (=> d!156669 (validMask!0 mask!2687)))

(assert (=> d!156669 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649093)))

(declare-fun b!1488193 () Bool)

(assert (=> b!1488193 (and (bvsge (index!51618 lt!649093) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649093) (size!48616 a!2862)))))

(declare-fun res!1012090 () Bool)

(assert (=> b!1488193 (= res!1012090 (= (select (arr!48066 a!2862) (index!51618 lt!649093)) (select (arr!48066 a!2862) j!93)))))

(declare-fun e!834164 () Bool)

(assert (=> b!1488193 (=> res!1012090 e!834164)))

(declare-fun e!834162 () Bool)

(assert (=> b!1488193 (= e!834162 e!834164)))

(declare-fun b!1488194 () Bool)

(assert (=> b!1488194 (= e!834161 (bvsge (x!133206 lt!649093) #b01111111111111111111111111111110))))

(declare-fun b!1488195 () Bool)

(declare-fun e!834163 () SeekEntryResult!12306)

(assert (=> b!1488195 (= e!834163 (Intermediate!12306 false index!646 x!665))))

(declare-fun b!1488196 () Bool)

(assert (=> b!1488196 (= e!834163 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48066 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488197 () Bool)

(assert (=> b!1488197 (= e!834165 (Intermediate!12306 true index!646 x!665))))

(declare-fun b!1488198 () Bool)

(assert (=> b!1488198 (and (bvsge (index!51618 lt!649093) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649093) (size!48616 a!2862)))))

(declare-fun res!1012089 () Bool)

(assert (=> b!1488198 (= res!1012089 (= (select (arr!48066 a!2862) (index!51618 lt!649093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488198 (=> res!1012089 e!834164)))

(declare-fun b!1488199 () Bool)

(assert (=> b!1488199 (and (bvsge (index!51618 lt!649093) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649093) (size!48616 a!2862)))))

(assert (=> b!1488199 (= e!834164 (= (select (arr!48066 a!2862) (index!51618 lt!649093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488200 () Bool)

(assert (=> b!1488200 (= e!834161 e!834162)))

(declare-fun res!1012091 () Bool)

(assert (=> b!1488200 (= res!1012091 (and ((_ is Intermediate!12306) lt!649093) (not (undefined!13118 lt!649093)) (bvslt (x!133206 lt!649093) #b01111111111111111111111111111110) (bvsge (x!133206 lt!649093) #b00000000000000000000000000000000) (bvsge (x!133206 lt!649093) x!665)))))

(assert (=> b!1488200 (=> (not res!1012091) (not e!834162))))

(declare-fun b!1488201 () Bool)

(assert (=> b!1488201 (= e!834165 e!834163)))

(declare-fun c!137578 () Bool)

(assert (=> b!1488201 (= c!137578 (or (= lt!649092 (select (arr!48066 a!2862) j!93)) (= (bvadd lt!649092 lt!649092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156669 c!137580) b!1488197))

(assert (= (and d!156669 (not c!137580)) b!1488201))

(assert (= (and b!1488201 c!137578) b!1488195))

(assert (= (and b!1488201 (not c!137578)) b!1488196))

(assert (= (and d!156669 c!137579) b!1488194))

(assert (= (and d!156669 (not c!137579)) b!1488200))

(assert (= (and b!1488200 res!1012091) b!1488193))

(assert (= (and b!1488193 (not res!1012090)) b!1488198))

(assert (= (and b!1488198 (not res!1012089)) b!1488199))

(declare-fun m!1372715 () Bool)

(assert (=> b!1488198 m!1372715))

(assert (=> b!1488196 m!1372613))

(assert (=> b!1488196 m!1372613))

(assert (=> b!1488196 m!1372603))

(declare-fun m!1372717 () Bool)

(assert (=> b!1488196 m!1372717))

(assert (=> d!156669 m!1372599))

(assert (=> d!156669 m!1372607))

(assert (=> b!1488193 m!1372715))

(assert (=> b!1488199 m!1372715))

(assert (=> b!1488079 d!156669))

(declare-fun d!156671 () Bool)

(declare-fun lt!649096 () (_ BitVec 32))

(assert (=> d!156671 (and (bvsge lt!649096 #b00000000000000000000000000000000) (bvslt lt!649096 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156671 (= lt!649096 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156671 (validMask!0 mask!2687)))

(assert (=> d!156671 (= (nextIndex!0 index!646 x!665 mask!2687) lt!649096)))

(declare-fun bs!42794 () Bool)

(assert (= bs!42794 d!156671))

(declare-fun m!1372719 () Bool)

(assert (=> bs!42794 m!1372719))

(assert (=> bs!42794 m!1372607))

(assert (=> b!1488090 d!156671))

(declare-fun lt!649102 () SeekEntryResult!12306)

(declare-fun d!156673 () Bool)

(assert (=> d!156673 (and (or ((_ is Undefined!12306) lt!649102) (not ((_ is Found!12306) lt!649102)) (and (bvsge (index!51617 lt!649102) #b00000000000000000000000000000000) (bvslt (index!51617 lt!649102) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649102) ((_ is Found!12306) lt!649102) (not ((_ is MissingVacant!12306) lt!649102)) (not (= (index!51619 lt!649102) intermediateAfterIndex!19)) (and (bvsge (index!51619 lt!649102) #b00000000000000000000000000000000) (bvslt (index!51619 lt!649102) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649102) (ite ((_ is Found!12306) lt!649102) (= (select (arr!48066 lt!649055) (index!51617 lt!649102)) lt!649056) (and ((_ is MissingVacant!12306) lt!649102) (= (index!51619 lt!649102) intermediateAfterIndex!19) (= (select (arr!48066 lt!649055) (index!51619 lt!649102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!834174 () SeekEntryResult!12306)

(assert (=> d!156673 (= lt!649102 e!834174)))

(declare-fun c!137589 () Bool)

(assert (=> d!156673 (= c!137589 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649101 () (_ BitVec 64))

(assert (=> d!156673 (= lt!649101 (select (arr!48066 lt!649055) index!646))))

(assert (=> d!156673 (validMask!0 mask!2687)))

(assert (=> d!156673 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687) lt!649102)))

(declare-fun b!1488214 () Bool)

(declare-fun e!834173 () SeekEntryResult!12306)

(assert (=> b!1488214 (= e!834174 e!834173)))

(declare-fun c!137587 () Bool)

(assert (=> b!1488214 (= c!137587 (= lt!649101 lt!649056))))

(declare-fun b!1488215 () Bool)

(assert (=> b!1488215 (= e!834174 Undefined!12306)))

(declare-fun b!1488216 () Bool)

(declare-fun e!834172 () SeekEntryResult!12306)

(assert (=> b!1488216 (= e!834172 (MissingVacant!12306 intermediateAfterIndex!19))))

(declare-fun b!1488217 () Bool)

(declare-fun c!137588 () Bool)

(assert (=> b!1488217 (= c!137588 (= lt!649101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488217 (= e!834173 e!834172)))

(declare-fun b!1488218 () Bool)

(assert (=> b!1488218 (= e!834173 (Found!12306 index!646))))

(declare-fun b!1488219 () Bool)

(assert (=> b!1488219 (= e!834172 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687))))

(assert (= (and d!156673 c!137589) b!1488215))

(assert (= (and d!156673 (not c!137589)) b!1488214))

(assert (= (and b!1488214 c!137587) b!1488218))

(assert (= (and b!1488214 (not c!137587)) b!1488217))

(assert (= (and b!1488217 c!137588) b!1488216))

(assert (= (and b!1488217 (not c!137588)) b!1488219))

(declare-fun m!1372721 () Bool)

(assert (=> d!156673 m!1372721))

(declare-fun m!1372723 () Bool)

(assert (=> d!156673 m!1372723))

(declare-fun m!1372725 () Bool)

(assert (=> d!156673 m!1372725))

(assert (=> d!156673 m!1372607))

(assert (=> b!1488219 m!1372613))

(assert (=> b!1488219 m!1372613))

(declare-fun m!1372727 () Bool)

(assert (=> b!1488219 m!1372727))

(assert (=> b!1488090 d!156673))

(declare-fun b!1488233 () Bool)

(declare-fun c!137596 () Bool)

(declare-fun lt!649109 () (_ BitVec 64))

(assert (=> b!1488233 (= c!137596 (= lt!649109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834182 () SeekEntryResult!12306)

(declare-fun e!834183 () SeekEntryResult!12306)

(assert (=> b!1488233 (= e!834182 e!834183)))

(declare-fun b!1488234 () Bool)

(declare-fun e!834181 () SeekEntryResult!12306)

(assert (=> b!1488234 (= e!834181 e!834182)))

(declare-fun lt!649110 () SeekEntryResult!12306)

(assert (=> b!1488234 (= lt!649109 (select (arr!48066 lt!649055) (index!51618 lt!649110)))))

(declare-fun c!137598 () Bool)

(assert (=> b!1488234 (= c!137598 (= lt!649109 lt!649056))))

(declare-fun b!1488235 () Bool)

(assert (=> b!1488235 (= e!834181 Undefined!12306)))

(declare-fun b!1488236 () Bool)

(assert (=> b!1488236 (= e!834183 (MissingZero!12306 (index!51618 lt!649110)))))

(declare-fun b!1488237 () Bool)

(assert (=> b!1488237 (= e!834183 (seekKeyOrZeroReturnVacant!0 (x!133206 lt!649110) (index!51618 lt!649110) (index!51618 lt!649110) lt!649056 lt!649055 mask!2687))))

(declare-fun d!156675 () Bool)

(declare-fun lt!649111 () SeekEntryResult!12306)

(assert (=> d!156675 (and (or ((_ is Undefined!12306) lt!649111) (not ((_ is Found!12306) lt!649111)) (and (bvsge (index!51617 lt!649111) #b00000000000000000000000000000000) (bvslt (index!51617 lt!649111) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649111) ((_ is Found!12306) lt!649111) (not ((_ is MissingZero!12306) lt!649111)) (and (bvsge (index!51616 lt!649111) #b00000000000000000000000000000000) (bvslt (index!51616 lt!649111) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649111) ((_ is Found!12306) lt!649111) ((_ is MissingZero!12306) lt!649111) (not ((_ is MissingVacant!12306) lt!649111)) (and (bvsge (index!51619 lt!649111) #b00000000000000000000000000000000) (bvslt (index!51619 lt!649111) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649111) (ite ((_ is Found!12306) lt!649111) (= (select (arr!48066 lt!649055) (index!51617 lt!649111)) lt!649056) (ite ((_ is MissingZero!12306) lt!649111) (= (select (arr!48066 lt!649055) (index!51616 lt!649111)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12306) lt!649111) (= (select (arr!48066 lt!649055) (index!51619 lt!649111)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156675 (= lt!649111 e!834181)))

(declare-fun c!137597 () Bool)

(assert (=> d!156675 (= c!137597 (and ((_ is Intermediate!12306) lt!649110) (undefined!13118 lt!649110)))))

(assert (=> d!156675 (= lt!649110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649056 mask!2687) lt!649056 lt!649055 mask!2687))))

(assert (=> d!156675 (validMask!0 mask!2687)))

(assert (=> d!156675 (= (seekEntryOrOpen!0 lt!649056 lt!649055 mask!2687) lt!649111)))

(declare-fun b!1488232 () Bool)

(assert (=> b!1488232 (= e!834182 (Found!12306 (index!51618 lt!649110)))))

(assert (= (and d!156675 c!137597) b!1488235))

(assert (= (and d!156675 (not c!137597)) b!1488234))

(assert (= (and b!1488234 c!137598) b!1488232))

(assert (= (and b!1488234 (not c!137598)) b!1488233))

(assert (= (and b!1488233 c!137596) b!1488236))

(assert (= (and b!1488233 (not c!137596)) b!1488237))

(declare-fun m!1372729 () Bool)

(assert (=> b!1488234 m!1372729))

(declare-fun m!1372731 () Bool)

(assert (=> b!1488237 m!1372731))

(assert (=> d!156675 m!1372607))

(declare-fun m!1372733 () Bool)

(assert (=> d!156675 m!1372733))

(assert (=> d!156675 m!1372623))

(declare-fun m!1372735 () Bool)

(assert (=> d!156675 m!1372735))

(declare-fun m!1372737 () Bool)

(assert (=> d!156675 m!1372737))

(assert (=> d!156675 m!1372623))

(assert (=> d!156675 m!1372625))

(assert (=> b!1488090 d!156675))

(declare-fun d!156683 () Bool)

(declare-fun lt!649113 () SeekEntryResult!12306)

(assert (=> d!156683 (and (or ((_ is Undefined!12306) lt!649113) (not ((_ is Found!12306) lt!649113)) (and (bvsge (index!51617 lt!649113) #b00000000000000000000000000000000) (bvslt (index!51617 lt!649113) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649113) ((_ is Found!12306) lt!649113) (not ((_ is MissingVacant!12306) lt!649113)) (not (= (index!51619 lt!649113) intermediateAfterIndex!19)) (and (bvsge (index!51619 lt!649113) #b00000000000000000000000000000000) (bvslt (index!51619 lt!649113) (size!48616 lt!649055)))) (or ((_ is Undefined!12306) lt!649113) (ite ((_ is Found!12306) lt!649113) (= (select (arr!48066 lt!649055) (index!51617 lt!649113)) lt!649056) (and ((_ is MissingVacant!12306) lt!649113) (= (index!51619 lt!649113) intermediateAfterIndex!19) (= (select (arr!48066 lt!649055) (index!51619 lt!649113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!834186 () SeekEntryResult!12306)

(assert (=> d!156683 (= lt!649113 e!834186)))

(declare-fun c!137601 () Bool)

(assert (=> d!156683 (= c!137601 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649112 () (_ BitVec 64))

(assert (=> d!156683 (= lt!649112 (select (arr!48066 lt!649055) lt!649053))))

(assert (=> d!156683 (validMask!0 mask!2687)))

(assert (=> d!156683 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649053 intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687) lt!649113)))

(declare-fun b!1488238 () Bool)

(declare-fun e!834185 () SeekEntryResult!12306)

(assert (=> b!1488238 (= e!834186 e!834185)))

(declare-fun c!137599 () Bool)

(assert (=> b!1488238 (= c!137599 (= lt!649112 lt!649056))))

(declare-fun b!1488239 () Bool)

(assert (=> b!1488239 (= e!834186 Undefined!12306)))

(declare-fun b!1488240 () Bool)

(declare-fun e!834184 () SeekEntryResult!12306)

(assert (=> b!1488240 (= e!834184 (MissingVacant!12306 intermediateAfterIndex!19))))

(declare-fun b!1488241 () Bool)

(declare-fun c!137600 () Bool)

(assert (=> b!1488241 (= c!137600 (= lt!649112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488241 (= e!834185 e!834184)))

(declare-fun b!1488242 () Bool)

(assert (=> b!1488242 (= e!834185 (Found!12306 lt!649053))))

(declare-fun b!1488243 () Bool)

(assert (=> b!1488243 (= e!834184 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649053 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!649056 lt!649055 mask!2687))))

(assert (= (and d!156683 c!137601) b!1488239))

(assert (= (and d!156683 (not c!137601)) b!1488238))

(assert (= (and b!1488238 c!137599) b!1488242))

(assert (= (and b!1488238 (not c!137599)) b!1488241))

(assert (= (and b!1488241 c!137600) b!1488240))

(assert (= (and b!1488241 (not c!137600)) b!1488243))

(declare-fun m!1372739 () Bool)

(assert (=> d!156683 m!1372739))

(declare-fun m!1372741 () Bool)

(assert (=> d!156683 m!1372741))

(assert (=> d!156683 m!1372705))

(assert (=> d!156683 m!1372607))

(assert (=> b!1488243 m!1372701))

(assert (=> b!1488243 m!1372701))

(declare-fun m!1372743 () Bool)

(assert (=> b!1488243 m!1372743))

(assert (=> b!1488072 d!156683))

(declare-fun b!1488245 () Bool)

(declare-fun c!137602 () Bool)

(declare-fun lt!649114 () (_ BitVec 64))

(assert (=> b!1488245 (= c!137602 (= lt!649114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834188 () SeekEntryResult!12306)

(declare-fun e!834189 () SeekEntryResult!12306)

(assert (=> b!1488245 (= e!834188 e!834189)))

(declare-fun b!1488246 () Bool)

(declare-fun e!834187 () SeekEntryResult!12306)

(assert (=> b!1488246 (= e!834187 e!834188)))

(declare-fun lt!649115 () SeekEntryResult!12306)

(assert (=> b!1488246 (= lt!649114 (select (arr!48066 a!2862) (index!51618 lt!649115)))))

(declare-fun c!137604 () Bool)

(assert (=> b!1488246 (= c!137604 (= lt!649114 (select (arr!48066 a!2862) j!93)))))

(declare-fun b!1488247 () Bool)

(assert (=> b!1488247 (= e!834187 Undefined!12306)))

(declare-fun b!1488248 () Bool)

(assert (=> b!1488248 (= e!834189 (MissingZero!12306 (index!51618 lt!649115)))))

(declare-fun b!1488249 () Bool)

(assert (=> b!1488249 (= e!834189 (seekKeyOrZeroReturnVacant!0 (x!133206 lt!649115) (index!51618 lt!649115) (index!51618 lt!649115) (select (arr!48066 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156685 () Bool)

(declare-fun lt!649116 () SeekEntryResult!12306)

(assert (=> d!156685 (and (or ((_ is Undefined!12306) lt!649116) (not ((_ is Found!12306) lt!649116)) (and (bvsge (index!51617 lt!649116) #b00000000000000000000000000000000) (bvslt (index!51617 lt!649116) (size!48616 a!2862)))) (or ((_ is Undefined!12306) lt!649116) ((_ is Found!12306) lt!649116) (not ((_ is MissingZero!12306) lt!649116)) (and (bvsge (index!51616 lt!649116) #b00000000000000000000000000000000) (bvslt (index!51616 lt!649116) (size!48616 a!2862)))) (or ((_ is Undefined!12306) lt!649116) ((_ is Found!12306) lt!649116) ((_ is MissingZero!12306) lt!649116) (not ((_ is MissingVacant!12306) lt!649116)) (and (bvsge (index!51619 lt!649116) #b00000000000000000000000000000000) (bvslt (index!51619 lt!649116) (size!48616 a!2862)))) (or ((_ is Undefined!12306) lt!649116) (ite ((_ is Found!12306) lt!649116) (= (select (arr!48066 a!2862) (index!51617 lt!649116)) (select (arr!48066 a!2862) j!93)) (ite ((_ is MissingZero!12306) lt!649116) (= (select (arr!48066 a!2862) (index!51616 lt!649116)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12306) lt!649116) (= (select (arr!48066 a!2862) (index!51619 lt!649116)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156685 (= lt!649116 e!834187)))

(declare-fun c!137603 () Bool)

(assert (=> d!156685 (= c!137603 (and ((_ is Intermediate!12306) lt!649115) (undefined!13118 lt!649115)))))

(assert (=> d!156685 (= lt!649115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48066 a!2862) j!93) mask!2687) (select (arr!48066 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156685 (validMask!0 mask!2687)))

(assert (=> d!156685 (= (seekEntryOrOpen!0 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649116)))

(declare-fun b!1488244 () Bool)

(assert (=> b!1488244 (= e!834188 (Found!12306 (index!51618 lt!649115)))))

(assert (= (and d!156685 c!137603) b!1488247))

(assert (= (and d!156685 (not c!137603)) b!1488246))

(assert (= (and b!1488246 c!137604) b!1488244))

(assert (= (and b!1488246 (not c!137604)) b!1488245))

(assert (= (and b!1488245 c!137602) b!1488248))

(assert (= (and b!1488245 (not c!137602)) b!1488249))

(declare-fun m!1372745 () Bool)

(assert (=> b!1488246 m!1372745))

(assert (=> b!1488249 m!1372603))

(declare-fun m!1372747 () Bool)

(assert (=> b!1488249 m!1372747))

(assert (=> d!156685 m!1372607))

(declare-fun m!1372749 () Bool)

(assert (=> d!156685 m!1372749))

(assert (=> d!156685 m!1372603))

(assert (=> d!156685 m!1372637))

(declare-fun m!1372751 () Bool)

(assert (=> d!156685 m!1372751))

(declare-fun m!1372753 () Bool)

(assert (=> d!156685 m!1372753))

(assert (=> d!156685 m!1372637))

(assert (=> d!156685 m!1372603))

(assert (=> d!156685 m!1372639))

(assert (=> b!1488073 d!156685))

(declare-fun d!156687 () Bool)

(declare-fun e!834190 () Bool)

(assert (=> d!156687 e!834190))

(declare-fun c!137606 () Bool)

(declare-fun lt!649118 () SeekEntryResult!12306)

(assert (=> d!156687 (= c!137606 (and ((_ is Intermediate!12306) lt!649118) (undefined!13118 lt!649118)))))

(declare-fun e!834194 () SeekEntryResult!12306)

(assert (=> d!156687 (= lt!649118 e!834194)))

(declare-fun c!137607 () Bool)

(assert (=> d!156687 (= c!137607 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!649117 () (_ BitVec 64))

(assert (=> d!156687 (= lt!649117 (select (arr!48066 lt!649055) (toIndex!0 lt!649056 mask!2687)))))

(assert (=> d!156687 (validMask!0 mask!2687)))

(assert (=> d!156687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649056 mask!2687) lt!649056 lt!649055 mask!2687) lt!649118)))

(declare-fun b!1488250 () Bool)

(assert (=> b!1488250 (and (bvsge (index!51618 lt!649118) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649118) (size!48616 lt!649055)))))

(declare-fun res!1012093 () Bool)

(assert (=> b!1488250 (= res!1012093 (= (select (arr!48066 lt!649055) (index!51618 lt!649118)) lt!649056))))

(declare-fun e!834193 () Bool)

(assert (=> b!1488250 (=> res!1012093 e!834193)))

(declare-fun e!834191 () Bool)

(assert (=> b!1488250 (= e!834191 e!834193)))

(declare-fun b!1488251 () Bool)

(assert (=> b!1488251 (= e!834190 (bvsge (x!133206 lt!649118) #b01111111111111111111111111111110))))

(declare-fun b!1488252 () Bool)

(declare-fun e!834192 () SeekEntryResult!12306)

(assert (=> b!1488252 (= e!834192 (Intermediate!12306 false (toIndex!0 lt!649056 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488253 () Bool)

(assert (=> b!1488253 (= e!834192 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!649056 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!649056 lt!649055 mask!2687))))

(declare-fun b!1488254 () Bool)

(assert (=> b!1488254 (= e!834194 (Intermediate!12306 true (toIndex!0 lt!649056 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488255 () Bool)

(assert (=> b!1488255 (and (bvsge (index!51618 lt!649118) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649118) (size!48616 lt!649055)))))

(declare-fun res!1012092 () Bool)

(assert (=> b!1488255 (= res!1012092 (= (select (arr!48066 lt!649055) (index!51618 lt!649118)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488255 (=> res!1012092 e!834193)))

(declare-fun b!1488256 () Bool)

(assert (=> b!1488256 (and (bvsge (index!51618 lt!649118) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649118) (size!48616 lt!649055)))))

(assert (=> b!1488256 (= e!834193 (= (select (arr!48066 lt!649055) (index!51618 lt!649118)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488257 () Bool)

(assert (=> b!1488257 (= e!834190 e!834191)))

(declare-fun res!1012094 () Bool)

(assert (=> b!1488257 (= res!1012094 (and ((_ is Intermediate!12306) lt!649118) (not (undefined!13118 lt!649118)) (bvslt (x!133206 lt!649118) #b01111111111111111111111111111110) (bvsge (x!133206 lt!649118) #b00000000000000000000000000000000) (bvsge (x!133206 lt!649118) #b00000000000000000000000000000000)))))

(assert (=> b!1488257 (=> (not res!1012094) (not e!834191))))

(declare-fun b!1488258 () Bool)

(assert (=> b!1488258 (= e!834194 e!834192)))

(declare-fun c!137605 () Bool)

(assert (=> b!1488258 (= c!137605 (or (= lt!649117 lt!649056) (= (bvadd lt!649117 lt!649117) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156687 c!137607) b!1488254))

(assert (= (and d!156687 (not c!137607)) b!1488258))

(assert (= (and b!1488258 c!137605) b!1488252))

(assert (= (and b!1488258 (not c!137605)) b!1488253))

(assert (= (and d!156687 c!137606) b!1488251))

(assert (= (and d!156687 (not c!137606)) b!1488257))

(assert (= (and b!1488257 res!1012094) b!1488250))

(assert (= (and b!1488250 (not res!1012093)) b!1488255))

(assert (= (and b!1488255 (not res!1012092)) b!1488256))

(declare-fun m!1372755 () Bool)

(assert (=> b!1488255 m!1372755))

(assert (=> b!1488253 m!1372623))

(declare-fun m!1372757 () Bool)

(assert (=> b!1488253 m!1372757))

(assert (=> b!1488253 m!1372757))

(declare-fun m!1372759 () Bool)

(assert (=> b!1488253 m!1372759))

(assert (=> d!156687 m!1372623))

(declare-fun m!1372761 () Bool)

(assert (=> d!156687 m!1372761))

(assert (=> d!156687 m!1372607))

(assert (=> b!1488250 m!1372755))

(assert (=> b!1488256 m!1372755))

(assert (=> b!1488071 d!156687))

(declare-fun d!156689 () Bool)

(declare-fun lt!649124 () (_ BitVec 32))

(declare-fun lt!649123 () (_ BitVec 32))

(assert (=> d!156689 (= lt!649124 (bvmul (bvxor lt!649123 (bvlshr lt!649123 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156689 (= lt!649123 ((_ extract 31 0) (bvand (bvxor lt!649056 (bvlshr lt!649056 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156689 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012088 (let ((h!35945 ((_ extract 31 0) (bvand (bvxor lt!649056 (bvlshr lt!649056 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133209 (bvmul (bvxor h!35945 (bvlshr h!35945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133209 (bvlshr x!133209 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012088 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012088 #b00000000000000000000000000000000))))))

(assert (=> d!156689 (= (toIndex!0 lt!649056 mask!2687) (bvand (bvxor lt!649124 (bvlshr lt!649124 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488071 d!156689))

(declare-fun b!1488321 () Bool)

(declare-fun e!834232 () Bool)

(declare-fun call!67918 () Bool)

(assert (=> b!1488321 (= e!834232 call!67918)))

(declare-fun bm!67915 () Bool)

(assert (=> bm!67915 (= call!67918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488323 () Bool)

(declare-fun e!834231 () Bool)

(declare-fun e!834233 () Bool)

(assert (=> b!1488323 (= e!834231 e!834233)))

(declare-fun c!137628 () Bool)

(assert (=> b!1488323 (= c!137628 (validKeyInArray!0 (select (arr!48066 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488324 () Bool)

(assert (=> b!1488324 (= e!834233 e!834232)))

(declare-fun lt!649139 () (_ BitVec 64))

(assert (=> b!1488324 (= lt!649139 (select (arr!48066 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!649141 () Unit!49952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99586 (_ BitVec 64) (_ BitVec 32)) Unit!49952)

(assert (=> b!1488324 (= lt!649141 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649139 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1488324 (arrayContainsKey!0 a!2862 lt!649139 #b00000000000000000000000000000000)))

(declare-fun lt!649140 () Unit!49952)

(assert (=> b!1488324 (= lt!649140 lt!649141)))

(declare-fun res!1012119 () Bool)

(assert (=> b!1488324 (= res!1012119 (= (seekEntryOrOpen!0 (select (arr!48066 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12306 #b00000000000000000000000000000000)))))

(assert (=> b!1488324 (=> (not res!1012119) (not e!834232))))

(declare-fun d!156691 () Bool)

(declare-fun res!1012118 () Bool)

(assert (=> d!156691 (=> res!1012118 e!834231)))

(assert (=> d!156691 (= res!1012118 (bvsge #b00000000000000000000000000000000 (size!48616 a!2862)))))

(assert (=> d!156691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!834231)))

(declare-fun b!1488322 () Bool)

(assert (=> b!1488322 (= e!834233 call!67918)))

(assert (= (and d!156691 (not res!1012118)) b!1488323))

(assert (= (and b!1488323 c!137628) b!1488324))

(assert (= (and b!1488323 (not c!137628)) b!1488322))

(assert (= (and b!1488324 res!1012119) b!1488321))

(assert (= (or b!1488321 b!1488322) bm!67915))

(declare-fun m!1372779 () Bool)

(assert (=> bm!67915 m!1372779))

(declare-fun m!1372781 () Bool)

(assert (=> b!1488323 m!1372781))

(assert (=> b!1488323 m!1372781))

(declare-fun m!1372783 () Bool)

(assert (=> b!1488323 m!1372783))

(assert (=> b!1488324 m!1372781))

(declare-fun m!1372785 () Bool)

(assert (=> b!1488324 m!1372785))

(declare-fun m!1372787 () Bool)

(assert (=> b!1488324 m!1372787))

(assert (=> b!1488324 m!1372781))

(declare-fun m!1372789 () Bool)

(assert (=> b!1488324 m!1372789))

(assert (=> b!1488082 d!156691))

(declare-fun d!156697 () Bool)

(declare-fun e!834234 () Bool)

(assert (=> d!156697 e!834234))

(declare-fun c!137630 () Bool)

(declare-fun lt!649143 () SeekEntryResult!12306)

(assert (=> d!156697 (= c!137630 (and ((_ is Intermediate!12306) lt!649143) (undefined!13118 lt!649143)))))

(declare-fun e!834238 () SeekEntryResult!12306)

(assert (=> d!156697 (= lt!649143 e!834238)))

(declare-fun c!137631 () Bool)

(assert (=> d!156697 (= c!137631 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649142 () (_ BitVec 64))

(assert (=> d!156697 (= lt!649142 (select (arr!48066 a!2862) lt!649053))))

(assert (=> d!156697 (validMask!0 mask!2687)))

(assert (=> d!156697 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649053 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) lt!649143)))

(declare-fun b!1488325 () Bool)

(assert (=> b!1488325 (and (bvsge (index!51618 lt!649143) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649143) (size!48616 a!2862)))))

(declare-fun res!1012121 () Bool)

(assert (=> b!1488325 (= res!1012121 (= (select (arr!48066 a!2862) (index!51618 lt!649143)) (select (arr!48066 a!2862) j!93)))))

(declare-fun e!834237 () Bool)

(assert (=> b!1488325 (=> res!1012121 e!834237)))

(declare-fun e!834235 () Bool)

(assert (=> b!1488325 (= e!834235 e!834237)))

(declare-fun b!1488326 () Bool)

(assert (=> b!1488326 (= e!834234 (bvsge (x!133206 lt!649143) #b01111111111111111111111111111110))))

(declare-fun b!1488327 () Bool)

(declare-fun e!834236 () SeekEntryResult!12306)

(assert (=> b!1488327 (= e!834236 (Intermediate!12306 false lt!649053 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488328 () Bool)

(assert (=> b!1488328 (= e!834236 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649053 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48066 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488329 () Bool)

(assert (=> b!1488329 (= e!834238 (Intermediate!12306 true lt!649053 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488330 () Bool)

(assert (=> b!1488330 (and (bvsge (index!51618 lt!649143) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649143) (size!48616 a!2862)))))

(declare-fun res!1012120 () Bool)

(assert (=> b!1488330 (= res!1012120 (= (select (arr!48066 a!2862) (index!51618 lt!649143)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488330 (=> res!1012120 e!834237)))

(declare-fun b!1488331 () Bool)

(assert (=> b!1488331 (and (bvsge (index!51618 lt!649143) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649143) (size!48616 a!2862)))))

(assert (=> b!1488331 (= e!834237 (= (select (arr!48066 a!2862) (index!51618 lt!649143)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488332 () Bool)

(assert (=> b!1488332 (= e!834234 e!834235)))

(declare-fun res!1012122 () Bool)

(assert (=> b!1488332 (= res!1012122 (and ((_ is Intermediate!12306) lt!649143) (not (undefined!13118 lt!649143)) (bvslt (x!133206 lt!649143) #b01111111111111111111111111111110) (bvsge (x!133206 lt!649143) #b00000000000000000000000000000000) (bvsge (x!133206 lt!649143) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1488332 (=> (not res!1012122) (not e!834235))))

(declare-fun b!1488333 () Bool)

(assert (=> b!1488333 (= e!834238 e!834236)))

(declare-fun c!137629 () Bool)

(assert (=> b!1488333 (= c!137629 (or (= lt!649142 (select (arr!48066 a!2862) j!93)) (= (bvadd lt!649142 lt!649142) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156697 c!137631) b!1488329))

(assert (= (and d!156697 (not c!137631)) b!1488333))

(assert (= (and b!1488333 c!137629) b!1488327))

(assert (= (and b!1488333 (not c!137629)) b!1488328))

(assert (= (and d!156697 c!137630) b!1488326))

(assert (= (and d!156697 (not c!137630)) b!1488332))

(assert (= (and b!1488332 res!1012122) b!1488325))

(assert (= (and b!1488325 (not res!1012121)) b!1488330))

(assert (= (and b!1488330 (not res!1012120)) b!1488331))

(declare-fun m!1372791 () Bool)

(assert (=> b!1488330 m!1372791))

(assert (=> b!1488328 m!1372701))

(assert (=> b!1488328 m!1372701))

(assert (=> b!1488328 m!1372603))

(declare-fun m!1372793 () Bool)

(assert (=> b!1488328 m!1372793))

(declare-fun m!1372795 () Bool)

(assert (=> d!156697 m!1372795))

(assert (=> d!156697 m!1372607))

(assert (=> b!1488325 m!1372791))

(assert (=> b!1488331 m!1372791))

(assert (=> b!1488086 d!156697))

(declare-fun d!156699 () Bool)

(declare-fun e!834239 () Bool)

(assert (=> d!156699 e!834239))

(declare-fun c!137633 () Bool)

(declare-fun lt!649151 () SeekEntryResult!12306)

(assert (=> d!156699 (= c!137633 (and ((_ is Intermediate!12306) lt!649151) (undefined!13118 lt!649151)))))

(declare-fun e!834243 () SeekEntryResult!12306)

(assert (=> d!156699 (= lt!649151 e!834243)))

(declare-fun c!137634 () Bool)

(assert (=> d!156699 (= c!137634 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649150 () (_ BitVec 64))

(assert (=> d!156699 (= lt!649150 (select (arr!48066 lt!649055) index!646))))

(assert (=> d!156699 (validMask!0 mask!2687)))

(assert (=> d!156699 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649056 lt!649055 mask!2687) lt!649151)))

(declare-fun b!1488334 () Bool)

(assert (=> b!1488334 (and (bvsge (index!51618 lt!649151) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649151) (size!48616 lt!649055)))))

(declare-fun res!1012124 () Bool)

(assert (=> b!1488334 (= res!1012124 (= (select (arr!48066 lt!649055) (index!51618 lt!649151)) lt!649056))))

(declare-fun e!834242 () Bool)

(assert (=> b!1488334 (=> res!1012124 e!834242)))

(declare-fun e!834240 () Bool)

(assert (=> b!1488334 (= e!834240 e!834242)))

(declare-fun b!1488335 () Bool)

(assert (=> b!1488335 (= e!834239 (bvsge (x!133206 lt!649151) #b01111111111111111111111111111110))))

(declare-fun b!1488336 () Bool)

(declare-fun e!834241 () SeekEntryResult!12306)

(assert (=> b!1488336 (= e!834241 (Intermediate!12306 false index!646 x!665))))

(declare-fun b!1488337 () Bool)

(assert (=> b!1488337 (= e!834241 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!649056 lt!649055 mask!2687))))

(declare-fun b!1488338 () Bool)

(assert (=> b!1488338 (= e!834243 (Intermediate!12306 true index!646 x!665))))

(declare-fun b!1488339 () Bool)

(assert (=> b!1488339 (and (bvsge (index!51618 lt!649151) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649151) (size!48616 lt!649055)))))

(declare-fun res!1012123 () Bool)

(assert (=> b!1488339 (= res!1012123 (= (select (arr!48066 lt!649055) (index!51618 lt!649151)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488339 (=> res!1012123 e!834242)))

(declare-fun b!1488340 () Bool)

(assert (=> b!1488340 (and (bvsge (index!51618 lt!649151) #b00000000000000000000000000000000) (bvslt (index!51618 lt!649151) (size!48616 lt!649055)))))

(assert (=> b!1488340 (= e!834242 (= (select (arr!48066 lt!649055) (index!51618 lt!649151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488341 () Bool)

(assert (=> b!1488341 (= e!834239 e!834240)))

(declare-fun res!1012125 () Bool)

(assert (=> b!1488341 (= res!1012125 (and ((_ is Intermediate!12306) lt!649151) (not (undefined!13118 lt!649151)) (bvslt (x!133206 lt!649151) #b01111111111111111111111111111110) (bvsge (x!133206 lt!649151) #b00000000000000000000000000000000) (bvsge (x!133206 lt!649151) x!665)))))

(assert (=> b!1488341 (=> (not res!1012125) (not e!834240))))

(declare-fun b!1488342 () Bool)

(assert (=> b!1488342 (= e!834243 e!834241)))

(declare-fun c!137632 () Bool)

(assert (=> b!1488342 (= c!137632 (or (= lt!649150 lt!649056) (= (bvadd lt!649150 lt!649150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156699 c!137634) b!1488338))

(assert (= (and d!156699 (not c!137634)) b!1488342))

(assert (= (and b!1488342 c!137632) b!1488336))

(assert (= (and b!1488342 (not c!137632)) b!1488337))

(assert (= (and d!156699 c!137633) b!1488335))

(assert (= (and d!156699 (not c!137633)) b!1488341))

(assert (= (and b!1488341 res!1012125) b!1488334))

(assert (= (and b!1488334 (not res!1012124)) b!1488339))

(assert (= (and b!1488339 (not res!1012123)) b!1488340))

(declare-fun m!1372797 () Bool)

(assert (=> b!1488339 m!1372797))

(assert (=> b!1488337 m!1372613))

(assert (=> b!1488337 m!1372613))

(declare-fun m!1372799 () Bool)

(assert (=> b!1488337 m!1372799))

(assert (=> d!156699 m!1372725))

(assert (=> d!156699 m!1372607))

(assert (=> b!1488334 m!1372797))

(assert (=> b!1488340 m!1372797))

(assert (=> b!1488074 d!156699))

(declare-fun b!1488352 () Bool)

(declare-fun e!834250 () Bool)

(declare-fun call!67919 () Bool)

(assert (=> b!1488352 (= e!834250 call!67919)))

(declare-fun bm!67916 () Bool)

(assert (=> bm!67916 (= call!67919 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488354 () Bool)

(declare-fun e!834249 () Bool)

(declare-fun e!834251 () Bool)

(assert (=> b!1488354 (= e!834249 e!834251)))

(declare-fun c!137638 () Bool)

(assert (=> b!1488354 (= c!137638 (validKeyInArray!0 (select (arr!48066 a!2862) j!93)))))

(declare-fun b!1488355 () Bool)

(assert (=> b!1488355 (= e!834251 e!834250)))

(declare-fun lt!649154 () (_ BitVec 64))

(assert (=> b!1488355 (= lt!649154 (select (arr!48066 a!2862) j!93))))

(declare-fun lt!649156 () Unit!49952)

(assert (=> b!1488355 (= lt!649156 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649154 j!93))))

(assert (=> b!1488355 (arrayContainsKey!0 a!2862 lt!649154 #b00000000000000000000000000000000)))

(declare-fun lt!649155 () Unit!49952)

(assert (=> b!1488355 (= lt!649155 lt!649156)))

(declare-fun res!1012130 () Bool)

(assert (=> b!1488355 (= res!1012130 (= (seekEntryOrOpen!0 (select (arr!48066 a!2862) j!93) a!2862 mask!2687) (Found!12306 j!93)))))

(assert (=> b!1488355 (=> (not res!1012130) (not e!834250))))

(declare-fun d!156703 () Bool)

(declare-fun res!1012129 () Bool)

(assert (=> d!156703 (=> res!1012129 e!834249)))

(assert (=> d!156703 (= res!1012129 (bvsge j!93 (size!48616 a!2862)))))

(assert (=> d!156703 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!834249)))

(declare-fun b!1488353 () Bool)

(assert (=> b!1488353 (= e!834251 call!67919)))

(assert (= (and d!156703 (not res!1012129)) b!1488354))

(assert (= (and b!1488354 c!137638) b!1488355))

(assert (= (and b!1488354 (not c!137638)) b!1488353))

(assert (= (and b!1488355 res!1012130) b!1488352))

(assert (= (or b!1488352 b!1488353) bm!67916))

(declare-fun m!1372809 () Bool)

(assert (=> bm!67916 m!1372809))

(assert (=> b!1488354 m!1372603))

(assert (=> b!1488354 m!1372603))

(assert (=> b!1488354 m!1372631))

(assert (=> b!1488355 m!1372603))

(declare-fun m!1372811 () Bool)

(assert (=> b!1488355 m!1372811))

(declare-fun m!1372813 () Bool)

(assert (=> b!1488355 m!1372813))

(assert (=> b!1488355 m!1372603))

(assert (=> b!1488355 m!1372615))

(assert (=> b!1488085 d!156703))

(declare-fun d!156707 () Bool)

(assert (=> d!156707 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649162 () Unit!49952)

(declare-fun choose!38 (array!99586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49952)

(assert (=> d!156707 (= lt!649162 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156707 (validMask!0 mask!2687)))

(assert (=> d!156707 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!649162)))

(declare-fun bs!42796 () Bool)

(assert (= bs!42796 d!156707))

(assert (=> bs!42796 m!1372601))

(declare-fun m!1372817 () Bool)

(assert (=> bs!42796 m!1372817))

(assert (=> bs!42796 m!1372607))

(assert (=> b!1488085 d!156707))

(declare-fun d!156711 () Bool)

(declare-fun res!1012138 () Bool)

(declare-fun e!834263 () Bool)

(assert (=> d!156711 (=> res!1012138 e!834263)))

(assert (=> d!156711 (= res!1012138 (bvsge #b00000000000000000000000000000000 (size!48616 a!2862)))))

(assert (=> d!156711 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34564) e!834263)))

(declare-fun b!1488366 () Bool)

(declare-fun e!834260 () Bool)

(assert (=> b!1488366 (= e!834263 e!834260)))

(declare-fun res!1012137 () Bool)

(assert (=> b!1488366 (=> (not res!1012137) (not e!834260))))

(declare-fun e!834262 () Bool)

(assert (=> b!1488366 (= res!1012137 (not e!834262))))

(declare-fun res!1012139 () Bool)

(assert (=> b!1488366 (=> (not res!1012139) (not e!834262))))

(assert (=> b!1488366 (= res!1012139 (validKeyInArray!0 (select (arr!48066 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67919 () Bool)

(declare-fun call!67922 () Bool)

(declare-fun c!137641 () Bool)

(assert (=> bm!67919 (= call!67922 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137641 (Cons!34563 (select (arr!48066 a!2862) #b00000000000000000000000000000000) Nil!34564) Nil!34564)))))

(declare-fun b!1488367 () Bool)

(declare-fun e!834261 () Bool)

(assert (=> b!1488367 (= e!834261 call!67922)))

(declare-fun b!1488368 () Bool)

(declare-fun contains!9922 (List!34567 (_ BitVec 64)) Bool)

(assert (=> b!1488368 (= e!834262 (contains!9922 Nil!34564 (select (arr!48066 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488369 () Bool)

(assert (=> b!1488369 (= e!834260 e!834261)))

(assert (=> b!1488369 (= c!137641 (validKeyInArray!0 (select (arr!48066 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488370 () Bool)

(assert (=> b!1488370 (= e!834261 call!67922)))

(assert (= (and d!156711 (not res!1012138)) b!1488366))

(assert (= (and b!1488366 res!1012139) b!1488368))

(assert (= (and b!1488366 res!1012137) b!1488369))

(assert (= (and b!1488369 c!137641) b!1488367))

(assert (= (and b!1488369 (not c!137641)) b!1488370))

(assert (= (or b!1488367 b!1488370) bm!67919))

(assert (=> b!1488366 m!1372781))

(assert (=> b!1488366 m!1372781))

(assert (=> b!1488366 m!1372783))

(assert (=> bm!67919 m!1372781))

(declare-fun m!1372819 () Bool)

(assert (=> bm!67919 m!1372819))

(assert (=> b!1488368 m!1372781))

(assert (=> b!1488368 m!1372781))

(declare-fun m!1372821 () Bool)

(assert (=> b!1488368 m!1372821))

(assert (=> b!1488369 m!1372781))

(assert (=> b!1488369 m!1372781))

(assert (=> b!1488369 m!1372783))

(assert (=> b!1488089 d!156711))

(assert (=> b!1488076 d!156673))

(assert (=> b!1488076 d!156675))

(declare-fun d!156713 () Bool)

(assert (=> d!156713 (= (validKeyInArray!0 (select (arr!48066 a!2862) i!1006)) (and (not (= (select (arr!48066 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48066 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488087 d!156713))

(declare-fun d!156715 () Bool)

(assert (=> d!156715 (= (validKeyInArray!0 (select (arr!48066 a!2862) j!93)) (and (not (= (select (arr!48066 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48066 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488077 d!156715))

(check-sat (not d!156669) (not b!1488328) (not d!156707) (not b!1488337) (not bm!67916) (not b!1488243) (not b!1488354) (not d!156697) (not b!1488196) (not d!156683) (not b!1488249) (not d!156685) (not b!1488369) (not b!1488368) (not b!1488366) (not d!156659) (not b!1488323) (not d!156671) (not b!1488219) (not d!156675) (not b!1488253) (not b!1488355) (not b!1488237) (not bm!67915) (not d!156673) (not b!1488324) (not d!156665) (not bm!67919) (not b!1488178) (not b!1488187) (not d!156687) (not d!156699))
(check-sat)
