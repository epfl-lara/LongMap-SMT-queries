; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124910 () Bool)

(assert start!124910)

(declare-fun b!1451228 () Bool)

(declare-fun e!817130 () Bool)

(declare-fun lt!636591 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11719 0))(
  ( (MissingZero!11719 (index!49268 (_ BitVec 32))) (Found!11719 (index!49269 (_ BitVec 32))) (Intermediate!11719 (undefined!12531 Bool) (index!49270 (_ BitVec 32)) (x!130920 (_ BitVec 32))) (Undefined!11719) (MissingVacant!11719 (index!49271 (_ BitVec 32))) )
))
(declare-fun lt!636590 () SeekEntryResult!11719)

(declare-datatypes ((array!98358 0))(
  ( (array!98359 (arr!47467 (Array (_ BitVec 32) (_ BitVec 64))) (size!48017 (_ BitVec 32))) )
))
(declare-fun lt!636592 () array!98358)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98358 (_ BitVec 32)) SeekEntryResult!11719)

(assert (=> b!1451228 (= e!817130 (= lt!636590 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636591 lt!636592 mask!2687)))))

(declare-fun b!1451229 () Bool)

(declare-fun res!982496 () Bool)

(declare-fun e!817136 () Bool)

(assert (=> b!1451229 (=> (not res!982496) (not e!817136))))

(assert (=> b!1451229 (= res!982496 e!817130)))

(declare-fun c!133881 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451229 (= c!133881 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451230 () Bool)

(declare-fun res!982501 () Bool)

(declare-fun e!817131 () Bool)

(assert (=> b!1451230 (=> (not res!982501) (not e!817131))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98358)

(assert (=> b!1451230 (= res!982501 (and (= (size!48017 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48017 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48017 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451231 () Bool)

(declare-fun e!817135 () Bool)

(declare-fun e!817132 () Bool)

(assert (=> b!1451231 (= e!817135 e!817132)))

(declare-fun res!982498 () Bool)

(assert (=> b!1451231 (=> (not res!982498) (not e!817132))))

(declare-fun lt!636593 () SeekEntryResult!11719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451231 (= res!982498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47467 a!2862) j!93) mask!2687) (select (arr!47467 a!2862) j!93) a!2862 mask!2687) lt!636593))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451231 (= lt!636593 (Intermediate!11719 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!982489 () Bool)

(assert (=> start!124910 (=> (not res!982489) (not e!817131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124910 (= res!982489 (validMask!0 mask!2687))))

(assert (=> start!124910 e!817131))

(assert (=> start!124910 true))

(declare-fun array_inv!36495 (array!98358) Bool)

(assert (=> start!124910 (array_inv!36495 a!2862)))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1451232 () Bool)

(declare-fun e!817134 () Bool)

(assert (=> b!1451232 (= e!817134 (and (or (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) (select (arr!47467 a!2862) j!93))) (or (and (= (select (arr!47467 a!2862) index!646) (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47467 a!2862) index!646) (select (arr!47467 a!2862) j!93))) (= (select (arr!47467 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451233 () Bool)

(assert (=> b!1451233 (= e!817132 e!817136)))

(declare-fun res!982493 () Bool)

(assert (=> b!1451233 (=> (not res!982493) (not e!817136))))

(assert (=> b!1451233 (= res!982493 (= lt!636590 (Intermediate!11719 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451233 (= lt!636590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636591 mask!2687) lt!636591 lt!636592 mask!2687))))

(assert (=> b!1451233 (= lt!636591 (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451234 () Bool)

(declare-fun res!982500 () Bool)

(assert (=> b!1451234 (=> (not res!982500) (not e!817136))))

(assert (=> b!1451234 (= res!982500 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451235 () Bool)

(assert (=> b!1451235 (= e!817136 (not true))))

(assert (=> b!1451235 e!817134))

(declare-fun res!982491 () Bool)

(assert (=> b!1451235 (=> (not res!982491) (not e!817134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98358 (_ BitVec 32)) Bool)

(assert (=> b!1451235 (= res!982491 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48934 0))(
  ( (Unit!48935) )
))
(declare-fun lt!636594 () Unit!48934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48934)

(assert (=> b!1451235 (= lt!636594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451236 () Bool)

(declare-fun res!982492 () Bool)

(assert (=> b!1451236 (=> (not res!982492) (not e!817134))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98358 (_ BitVec 32)) SeekEntryResult!11719)

(assert (=> b!1451236 (= res!982492 (= (seekEntryOrOpen!0 (select (arr!47467 a!2862) j!93) a!2862 mask!2687) (Found!11719 j!93)))))

(declare-fun b!1451237 () Bool)

(declare-fun res!982499 () Bool)

(assert (=> b!1451237 (=> (not res!982499) (not e!817131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451237 (= res!982499 (validKeyInArray!0 (select (arr!47467 a!2862) i!1006)))))

(declare-fun b!1451238 () Bool)

(declare-fun res!982494 () Bool)

(assert (=> b!1451238 (=> (not res!982494) (not e!817131))))

(assert (=> b!1451238 (= res!982494 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48017 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48017 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48017 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451239 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98358 (_ BitVec 32)) SeekEntryResult!11719)

(assert (=> b!1451239 (= e!817130 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636591 lt!636592 mask!2687) (seekEntryOrOpen!0 lt!636591 lt!636592 mask!2687)))))

(declare-fun b!1451240 () Bool)

(declare-fun res!982490 () Bool)

(assert (=> b!1451240 (=> (not res!982490) (not e!817131))))

(declare-datatypes ((List!33968 0))(
  ( (Nil!33965) (Cons!33964 (h!35314 (_ BitVec 64)) (t!48662 List!33968)) )
))
(declare-fun arrayNoDuplicates!0 (array!98358 (_ BitVec 32) List!33968) Bool)

(assert (=> b!1451240 (= res!982490 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33965))))

(declare-fun b!1451241 () Bool)

(declare-fun res!982495 () Bool)

(assert (=> b!1451241 (=> (not res!982495) (not e!817131))))

(assert (=> b!1451241 (= res!982495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451242 () Bool)

(declare-fun res!982488 () Bool)

(assert (=> b!1451242 (=> (not res!982488) (not e!817131))))

(assert (=> b!1451242 (= res!982488 (validKeyInArray!0 (select (arr!47467 a!2862) j!93)))))

(declare-fun b!1451243 () Bool)

(assert (=> b!1451243 (= e!817131 e!817135)))

(declare-fun res!982487 () Bool)

(assert (=> b!1451243 (=> (not res!982487) (not e!817135))))

(assert (=> b!1451243 (= res!982487 (= (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451243 (= lt!636592 (array!98359 (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48017 a!2862)))))

(declare-fun b!1451244 () Bool)

(declare-fun res!982497 () Bool)

(assert (=> b!1451244 (=> (not res!982497) (not e!817132))))

(assert (=> b!1451244 (= res!982497 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47467 a!2862) j!93) a!2862 mask!2687) lt!636593))))

(assert (= (and start!124910 res!982489) b!1451230))

(assert (= (and b!1451230 res!982501) b!1451237))

(assert (= (and b!1451237 res!982499) b!1451242))

(assert (= (and b!1451242 res!982488) b!1451241))

(assert (= (and b!1451241 res!982495) b!1451240))

(assert (= (and b!1451240 res!982490) b!1451238))

(assert (= (and b!1451238 res!982494) b!1451243))

(assert (= (and b!1451243 res!982487) b!1451231))

(assert (= (and b!1451231 res!982498) b!1451244))

(assert (= (and b!1451244 res!982497) b!1451233))

(assert (= (and b!1451233 res!982493) b!1451229))

(assert (= (and b!1451229 c!133881) b!1451228))

(assert (= (and b!1451229 (not c!133881)) b!1451239))

(assert (= (and b!1451229 res!982496) b!1451234))

(assert (= (and b!1451234 res!982500) b!1451235))

(assert (= (and b!1451235 res!982491) b!1451236))

(assert (= (and b!1451236 res!982492) b!1451232))

(declare-fun m!1339829 () Bool)

(assert (=> b!1451232 m!1339829))

(declare-fun m!1339831 () Bool)

(assert (=> b!1451232 m!1339831))

(declare-fun m!1339833 () Bool)

(assert (=> b!1451232 m!1339833))

(declare-fun m!1339835 () Bool)

(assert (=> b!1451232 m!1339835))

(declare-fun m!1339837 () Bool)

(assert (=> b!1451232 m!1339837))

(declare-fun m!1339839 () Bool)

(assert (=> b!1451228 m!1339839))

(assert (=> b!1451244 m!1339837))

(assert (=> b!1451244 m!1339837))

(declare-fun m!1339841 () Bool)

(assert (=> b!1451244 m!1339841))

(declare-fun m!1339843 () Bool)

(assert (=> b!1451241 m!1339843))

(declare-fun m!1339845 () Bool)

(assert (=> start!124910 m!1339845))

(declare-fun m!1339847 () Bool)

(assert (=> start!124910 m!1339847))

(declare-fun m!1339849 () Bool)

(assert (=> b!1451237 m!1339849))

(assert (=> b!1451237 m!1339849))

(declare-fun m!1339851 () Bool)

(assert (=> b!1451237 m!1339851))

(assert (=> b!1451231 m!1339837))

(assert (=> b!1451231 m!1339837))

(declare-fun m!1339853 () Bool)

(assert (=> b!1451231 m!1339853))

(assert (=> b!1451231 m!1339853))

(assert (=> b!1451231 m!1339837))

(declare-fun m!1339855 () Bool)

(assert (=> b!1451231 m!1339855))

(assert (=> b!1451242 m!1339837))

(assert (=> b!1451242 m!1339837))

(declare-fun m!1339857 () Bool)

(assert (=> b!1451242 m!1339857))

(assert (=> b!1451236 m!1339837))

(assert (=> b!1451236 m!1339837))

(declare-fun m!1339859 () Bool)

(assert (=> b!1451236 m!1339859))

(declare-fun m!1339861 () Bool)

(assert (=> b!1451233 m!1339861))

(assert (=> b!1451233 m!1339861))

(declare-fun m!1339863 () Bool)

(assert (=> b!1451233 m!1339863))

(assert (=> b!1451233 m!1339829))

(declare-fun m!1339865 () Bool)

(assert (=> b!1451233 m!1339865))

(declare-fun m!1339867 () Bool)

(assert (=> b!1451239 m!1339867))

(declare-fun m!1339869 () Bool)

(assert (=> b!1451239 m!1339869))

(declare-fun m!1339871 () Bool)

(assert (=> b!1451240 m!1339871))

(assert (=> b!1451243 m!1339829))

(declare-fun m!1339873 () Bool)

(assert (=> b!1451243 m!1339873))

(declare-fun m!1339875 () Bool)

(assert (=> b!1451235 m!1339875))

(declare-fun m!1339877 () Bool)

(assert (=> b!1451235 m!1339877))

(push 1)

