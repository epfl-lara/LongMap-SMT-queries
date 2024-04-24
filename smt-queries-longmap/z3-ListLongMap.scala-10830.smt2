; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127104 () Bool)

(assert start!127104)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!835583 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99715 0))(
  ( (array!99716 (arr!48124 (Array (_ BitVec 32) (_ BitVec 64))) (size!48675 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99715)

(declare-fun b!1490569 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490569 (= e!835583 (and (or (= (select (arr!48124 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48124 a!2862) intermediateBeforeIndex!19) (select (arr!48124 a!2862) j!93))) (let ((bdg!54672 (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48124 a!2862) index!646) bdg!54672) (= (select (arr!48124 a!2862) index!646) (select (arr!48124 a!2862) j!93))) (= (select (arr!48124 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54672 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-datatypes ((SeekEntryResult!12261 0))(
  ( (MissingZero!12261 (index!51436 (_ BitVec 32))) (Found!12261 (index!51437 (_ BitVec 32))) (Intermediate!12261 (undefined!13073 Bool) (index!51438 (_ BitVec 32)) (x!133222 (_ BitVec 32))) (Undefined!12261) (MissingVacant!12261 (index!51439 (_ BitVec 32))) )
))
(declare-fun lt!649986 () SeekEntryResult!12261)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!835580 () Bool)

(declare-fun lt!649981 () array!99715)

(declare-fun lt!649985 () (_ BitVec 64))

(declare-fun b!1490570 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99715 (_ BitVec 32)) SeekEntryResult!12261)

(assert (=> b!1490570 (= e!835580 (= lt!649986 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649985 lt!649981 mask!2687)))))

(declare-fun b!1490571 () Bool)

(declare-fun e!835585 () Bool)

(declare-fun e!835584 () Bool)

(assert (=> b!1490571 (= e!835585 e!835584)))

(declare-fun res!1013030 () Bool)

(assert (=> b!1490571 (=> (not res!1013030) (not e!835584))))

(assert (=> b!1490571 (= res!1013030 (= (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490571 (= lt!649981 (array!99716 (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48675 a!2862)))))

(declare-fun b!1490572 () Bool)

(declare-fun e!835581 () Bool)

(assert (=> b!1490572 (= e!835584 e!835581)))

(declare-fun res!1013019 () Bool)

(assert (=> b!1490572 (=> (not res!1013019) (not e!835581))))

(declare-fun lt!649983 () SeekEntryResult!12261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490572 (= res!1013019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48124 a!2862) j!93) mask!2687) (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!649983))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490572 (= lt!649983 (Intermediate!12261 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490573 () Bool)

(declare-fun e!835587 () Bool)

(declare-fun lt!649987 () (_ BitVec 32))

(assert (=> b!1490573 (= e!835587 (not (= lt!649986 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649987 lt!649985 lt!649981 mask!2687))))))

(declare-fun b!1490574 () Bool)

(declare-fun res!1013024 () Bool)

(assert (=> b!1490574 (=> (not res!1013024) (not e!835583))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99715 (_ BitVec 32)) SeekEntryResult!12261)

(assert (=> b!1490574 (= res!1013024 (= (seekEntryOrOpen!0 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) (Found!12261 j!93)))))

(declare-fun b!1490575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99715 (_ BitVec 32)) SeekEntryResult!12261)

(assert (=> b!1490575 (= e!835580 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649985 lt!649981 mask!2687) (seekEntryOrOpen!0 lt!649985 lt!649981 mask!2687)))))

(declare-fun b!1490576 () Bool)

(declare-fun res!1013036 () Bool)

(assert (=> b!1490576 (=> (not res!1013036) (not e!835585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490576 (= res!1013036 (validKeyInArray!0 (select (arr!48124 a!2862) i!1006)))))

(declare-fun b!1490577 () Bool)

(declare-fun lt!649982 () SeekEntryResult!12261)

(assert (=> b!1490577 (= e!835587 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649987 intermediateAfterIndex!19 lt!649985 lt!649981 mask!2687) lt!649982)))))

(declare-fun b!1490578 () Bool)

(declare-fun e!835578 () Bool)

(declare-fun e!835586 () Bool)

(assert (=> b!1490578 (= e!835578 e!835586)))

(declare-fun res!1013032 () Bool)

(assert (=> b!1490578 (=> res!1013032 e!835586)))

(assert (=> b!1490578 (= res!1013032 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649987 #b00000000000000000000000000000000) (bvsge lt!649987 (size!48675 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490578 (= lt!649987 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1490578 (= lt!649982 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649985 lt!649981 mask!2687))))

(assert (=> b!1490578 (= lt!649982 (seekEntryOrOpen!0 lt!649985 lt!649981 mask!2687))))

(declare-fun b!1490579 () Bool)

(declare-fun res!1013023 () Bool)

(declare-fun e!835579 () Bool)

(assert (=> b!1490579 (=> (not res!1013023) (not e!835579))))

(assert (=> b!1490579 (= res!1013023 e!835580)))

(declare-fun c!138312 () Bool)

(assert (=> b!1490579 (= c!138312 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490580 () Bool)

(declare-fun res!1013026 () Bool)

(assert (=> b!1490580 (=> (not res!1013026) (not e!835585))))

(assert (=> b!1490580 (= res!1013026 (and (= (size!48675 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48675 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48675 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490581 () Bool)

(assert (=> b!1490581 (= e!835586 true)))

(declare-fun lt!649980 () Bool)

(assert (=> b!1490581 (= lt!649980 e!835587)))

(declare-fun c!138313 () Bool)

(assert (=> b!1490581 (= c!138313 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490582 () Bool)

(declare-fun res!1013028 () Bool)

(assert (=> b!1490582 (=> (not res!1013028) (not e!835579))))

(assert (=> b!1490582 (= res!1013028 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490583 () Bool)

(declare-fun res!1013033 () Bool)

(assert (=> b!1490583 (=> (not res!1013033) (not e!835585))))

(assert (=> b!1490583 (= res!1013033 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48675 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48675 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48675 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490584 () Bool)

(declare-fun res!1013022 () Bool)

(assert (=> b!1490584 (=> (not res!1013022) (not e!835585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99715 (_ BitVec 32)) Bool)

(assert (=> b!1490584 (= res!1013022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1013031 () Bool)

(assert (=> start!127104 (=> (not res!1013031) (not e!835585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127104 (= res!1013031 (validMask!0 mask!2687))))

(assert (=> start!127104 e!835585))

(assert (=> start!127104 true))

(declare-fun array_inv!37405 (array!99715) Bool)

(assert (=> start!127104 (array_inv!37405 a!2862)))

(declare-fun b!1490585 () Bool)

(assert (=> b!1490585 (= e!835581 e!835579)))

(declare-fun res!1013025 () Bool)

(assert (=> b!1490585 (=> (not res!1013025) (not e!835579))))

(assert (=> b!1490585 (= res!1013025 (= lt!649986 (Intermediate!12261 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490585 (= lt!649986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649985 mask!2687) lt!649985 lt!649981 mask!2687))))

(assert (=> b!1490585 (= lt!649985 (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490586 () Bool)

(declare-fun res!1013027 () Bool)

(assert (=> b!1490586 (=> (not res!1013027) (not e!835585))))

(declare-datatypes ((List!34612 0))(
  ( (Nil!34609) (Cons!34608 (h!36005 (_ BitVec 64)) (t!49298 List!34612)) )
))
(declare-fun arrayNoDuplicates!0 (array!99715 (_ BitVec 32) List!34612) Bool)

(assert (=> b!1490586 (= res!1013027 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34609))))

(declare-fun b!1490587 () Bool)

(assert (=> b!1490587 (= e!835579 (not e!835578))))

(declare-fun res!1013035 () Bool)

(assert (=> b!1490587 (=> res!1013035 e!835578)))

(assert (=> b!1490587 (= res!1013035 (or (and (= (select (arr!48124 a!2862) index!646) (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48124 a!2862) index!646) (select (arr!48124 a!2862) j!93))) (= (select (arr!48124 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1490587 e!835583))

(declare-fun res!1013034 () Bool)

(assert (=> b!1490587 (=> (not res!1013034) (not e!835583))))

(assert (=> b!1490587 (= res!1013034 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49895 0))(
  ( (Unit!49896) )
))
(declare-fun lt!649984 () Unit!49895)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49895)

(assert (=> b!1490587 (= lt!649984 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490588 () Bool)

(declare-fun res!1013029 () Bool)

(assert (=> b!1490588 (=> (not res!1013029) (not e!835585))))

(assert (=> b!1490588 (= res!1013029 (validKeyInArray!0 (select (arr!48124 a!2862) j!93)))))

(declare-fun b!1490589 () Bool)

(declare-fun res!1013021 () Bool)

(assert (=> b!1490589 (=> res!1013021 e!835586)))

(assert (=> b!1490589 (= res!1013021 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649987 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!649983)))))

(declare-fun b!1490590 () Bool)

(declare-fun res!1013020 () Bool)

(assert (=> b!1490590 (=> (not res!1013020) (not e!835581))))

(assert (=> b!1490590 (= res!1013020 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!649983))))

(assert (= (and start!127104 res!1013031) b!1490580))

(assert (= (and b!1490580 res!1013026) b!1490576))

(assert (= (and b!1490576 res!1013036) b!1490588))

(assert (= (and b!1490588 res!1013029) b!1490584))

(assert (= (and b!1490584 res!1013022) b!1490586))

(assert (= (and b!1490586 res!1013027) b!1490583))

(assert (= (and b!1490583 res!1013033) b!1490571))

(assert (= (and b!1490571 res!1013030) b!1490572))

(assert (= (and b!1490572 res!1013019) b!1490590))

(assert (= (and b!1490590 res!1013020) b!1490585))

(assert (= (and b!1490585 res!1013025) b!1490579))

(assert (= (and b!1490579 c!138312) b!1490570))

(assert (= (and b!1490579 (not c!138312)) b!1490575))

(assert (= (and b!1490579 res!1013023) b!1490582))

(assert (= (and b!1490582 res!1013028) b!1490587))

(assert (= (and b!1490587 res!1013034) b!1490574))

(assert (= (and b!1490574 res!1013024) b!1490569))

(assert (= (and b!1490587 (not res!1013035)) b!1490578))

(assert (= (and b!1490578 (not res!1013032)) b!1490589))

(assert (= (and b!1490589 (not res!1013021)) b!1490581))

(assert (= (and b!1490581 c!138313) b!1490573))

(assert (= (and b!1490581 (not c!138313)) b!1490577))

(declare-fun m!1374871 () Bool)

(assert (=> b!1490571 m!1374871))

(declare-fun m!1374873 () Bool)

(assert (=> b!1490571 m!1374873))

(declare-fun m!1374875 () Bool)

(assert (=> b!1490584 m!1374875))

(declare-fun m!1374877 () Bool)

(assert (=> start!127104 m!1374877))

(declare-fun m!1374879 () Bool)

(assert (=> start!127104 m!1374879))

(declare-fun m!1374881 () Bool)

(assert (=> b!1490570 m!1374881))

(declare-fun m!1374883 () Bool)

(assert (=> b!1490573 m!1374883))

(declare-fun m!1374885 () Bool)

(assert (=> b!1490589 m!1374885))

(assert (=> b!1490589 m!1374885))

(declare-fun m!1374887 () Bool)

(assert (=> b!1490589 m!1374887))

(assert (=> b!1490572 m!1374885))

(assert (=> b!1490572 m!1374885))

(declare-fun m!1374889 () Bool)

(assert (=> b!1490572 m!1374889))

(assert (=> b!1490572 m!1374889))

(assert (=> b!1490572 m!1374885))

(declare-fun m!1374891 () Bool)

(assert (=> b!1490572 m!1374891))

(declare-fun m!1374893 () Bool)

(assert (=> b!1490578 m!1374893))

(declare-fun m!1374895 () Bool)

(assert (=> b!1490578 m!1374895))

(declare-fun m!1374897 () Bool)

(assert (=> b!1490578 m!1374897))

(assert (=> b!1490574 m!1374885))

(assert (=> b!1490574 m!1374885))

(declare-fun m!1374899 () Bool)

(assert (=> b!1490574 m!1374899))

(declare-fun m!1374901 () Bool)

(assert (=> b!1490587 m!1374901))

(assert (=> b!1490587 m!1374871))

(declare-fun m!1374903 () Bool)

(assert (=> b!1490587 m!1374903))

(declare-fun m!1374905 () Bool)

(assert (=> b!1490587 m!1374905))

(declare-fun m!1374907 () Bool)

(assert (=> b!1490587 m!1374907))

(assert (=> b!1490587 m!1374885))

(declare-fun m!1374909 () Bool)

(assert (=> b!1490585 m!1374909))

(assert (=> b!1490585 m!1374909))

(declare-fun m!1374911 () Bool)

(assert (=> b!1490585 m!1374911))

(assert (=> b!1490585 m!1374871))

(declare-fun m!1374913 () Bool)

(assert (=> b!1490585 m!1374913))

(declare-fun m!1374915 () Bool)

(assert (=> b!1490586 m!1374915))

(assert (=> b!1490569 m!1374871))

(declare-fun m!1374917 () Bool)

(assert (=> b!1490569 m!1374917))

(assert (=> b!1490569 m!1374903))

(assert (=> b!1490569 m!1374905))

(assert (=> b!1490569 m!1374885))

(assert (=> b!1490588 m!1374885))

(assert (=> b!1490588 m!1374885))

(declare-fun m!1374919 () Bool)

(assert (=> b!1490588 m!1374919))

(declare-fun m!1374921 () Bool)

(assert (=> b!1490577 m!1374921))

(assert (=> b!1490590 m!1374885))

(assert (=> b!1490590 m!1374885))

(declare-fun m!1374923 () Bool)

(assert (=> b!1490590 m!1374923))

(assert (=> b!1490575 m!1374895))

(assert (=> b!1490575 m!1374897))

(declare-fun m!1374925 () Bool)

(assert (=> b!1490576 m!1374925))

(assert (=> b!1490576 m!1374925))

(declare-fun m!1374927 () Bool)

(assert (=> b!1490576 m!1374927))

(check-sat (not b!1490589) (not b!1490573) (not b!1490586) (not b!1490588) (not b!1490574) (not start!127104) (not b!1490585) (not b!1490576) (not b!1490575) (not b!1490577) (not b!1490572) (not b!1490578) (not b!1490570) (not b!1490590) (not b!1490584) (not b!1490587))
(check-sat)
