; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125816 () Bool)

(assert start!125816)

(declare-fun b!1472970 () Bool)

(declare-fun e!826575 () Bool)

(declare-fun e!826573 () Bool)

(assert (=> b!1472970 (= e!826575 e!826573)))

(declare-fun res!1000573 () Bool)

(assert (=> b!1472970 (=> (not res!1000573) (not e!826573))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99150 0))(
  ( (array!99151 (arr!47860 (Array (_ BitVec 32) (_ BitVec 64))) (size!48410 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99150)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472970 (= res!1000573 (= (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643740 () array!99150)

(assert (=> b!1472970 (= lt!643740 (array!99151 (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48410 a!2862)))))

(declare-fun b!1472971 () Bool)

(declare-fun res!1000576 () Bool)

(assert (=> b!1472971 (=> (not res!1000576) (not e!826575))))

(declare-datatypes ((List!34361 0))(
  ( (Nil!34358) (Cons!34357 (h!35713 (_ BitVec 64)) (t!49055 List!34361)) )
))
(declare-fun arrayNoDuplicates!0 (array!99150 (_ BitVec 32) List!34361) Bool)

(assert (=> b!1472971 (= res!1000576 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34358))))

(declare-fun res!1000577 () Bool)

(assert (=> start!125816 (=> (not res!1000577) (not e!826575))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125816 (= res!1000577 (validMask!0 mask!2687))))

(assert (=> start!125816 e!826575))

(assert (=> start!125816 true))

(declare-fun array_inv!36888 (array!99150) Bool)

(assert (=> start!125816 (array_inv!36888 a!2862)))

(declare-fun b!1472972 () Bool)

(declare-fun res!1000569 () Bool)

(assert (=> b!1472972 (=> (not res!1000569) (not e!826575))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472972 (= res!1000569 (and (= (size!48410 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48410 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48410 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472973 () Bool)

(declare-fun res!1000578 () Bool)

(assert (=> b!1472973 (=> (not res!1000578) (not e!826575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472973 (= res!1000578 (validKeyInArray!0 (select (arr!47860 a!2862) j!93)))))

(declare-fun lt!643743 () (_ BitVec 64))

(declare-fun b!1472974 () Bool)

(declare-fun e!826576 () Bool)

(declare-datatypes ((SeekEntryResult!12100 0))(
  ( (MissingZero!12100 (index!50792 (_ BitVec 32))) (Found!12100 (index!50793 (_ BitVec 32))) (Intermediate!12100 (undefined!12912 Bool) (index!50794 (_ BitVec 32)) (x!132367 (_ BitVec 32))) (Undefined!12100) (MissingVacant!12100 (index!50795 (_ BitVec 32))) )
))
(declare-fun lt!643738 () SeekEntryResult!12100)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99150 (_ BitVec 32)) SeekEntryResult!12100)

(assert (=> b!1472974 (= e!826576 (= lt!643738 (seekEntryOrOpen!0 lt!643743 lt!643740 mask!2687)))))

(declare-fun b!1472975 () Bool)

(declare-fun res!1000581 () Bool)

(assert (=> b!1472975 (=> (not res!1000581) (not e!826575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99150 (_ BitVec 32)) Bool)

(assert (=> b!1472975 (= res!1000581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472976 () Bool)

(declare-fun res!1000575 () Bool)

(assert (=> b!1472976 (=> (not res!1000575) (not e!826575))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472976 (= res!1000575 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48410 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48410 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48410 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472977 () Bool)

(declare-fun e!826572 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99150 (_ BitVec 32)) SeekEntryResult!12100)

(assert (=> b!1472977 (= e!826572 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643743 lt!643740 mask!2687) (seekEntryOrOpen!0 lt!643743 lt!643740 mask!2687)))))

(declare-fun lt!643742 () SeekEntryResult!12100)

(declare-fun b!1472978 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99150 (_ BitVec 32)) SeekEntryResult!12100)

(assert (=> b!1472978 (= e!826572 (= lt!643742 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643743 lt!643740 mask!2687)))))

(declare-fun b!1472979 () Bool)

(declare-fun e!826577 () Bool)

(declare-fun e!826574 () Bool)

(assert (=> b!1472979 (= e!826577 e!826574)))

(declare-fun res!1000574 () Bool)

(assert (=> b!1472979 (=> (not res!1000574) (not e!826574))))

(assert (=> b!1472979 (= res!1000574 (= lt!643742 (Intermediate!12100 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472979 (= lt!643742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643743 mask!2687) lt!643743 lt!643740 mask!2687))))

(assert (=> b!1472979 (= lt!643743 (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472980 () Bool)

(assert (=> b!1472980 (= e!826573 e!826577)))

(declare-fun res!1000579 () Bool)

(assert (=> b!1472980 (=> (not res!1000579) (not e!826577))))

(declare-fun lt!643741 () SeekEntryResult!12100)

(assert (=> b!1472980 (= res!1000579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643741))))

(assert (=> b!1472980 (= lt!643741 (Intermediate!12100 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472981 () Bool)

(assert (=> b!1472981 (= e!826574 (not e!826576))))

(declare-fun res!1000570 () Bool)

(assert (=> b!1472981 (=> res!1000570 e!826576)))

(assert (=> b!1472981 (= res!1000570 (or (not (= (select (arr!47860 a!2862) index!646) (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47860 a!2862) index!646) (select (arr!47860 a!2862) j!93)))))))

(assert (=> b!1472981 (and (= lt!643738 (Found!12100 j!93)) (or (= (select (arr!47860 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47860 a!2862) intermediateBeforeIndex!19) (select (arr!47860 a!2862) j!93))))))

(assert (=> b!1472981 (= lt!643738 (seekEntryOrOpen!0 (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1472981 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49540 0))(
  ( (Unit!49541) )
))
(declare-fun lt!643739 () Unit!49540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49540)

(assert (=> b!1472981 (= lt!643739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472982 () Bool)

(declare-fun res!1000571 () Bool)

(assert (=> b!1472982 (=> (not res!1000571) (not e!826575))))

(assert (=> b!1472982 (= res!1000571 (validKeyInArray!0 (select (arr!47860 a!2862) i!1006)))))

(declare-fun b!1472983 () Bool)

(declare-fun res!1000580 () Bool)

(assert (=> b!1472983 (=> (not res!1000580) (not e!826574))))

(assert (=> b!1472983 (= res!1000580 e!826572)))

(declare-fun c!135714 () Bool)

(assert (=> b!1472983 (= c!135714 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472984 () Bool)

(declare-fun res!1000572 () Bool)

(assert (=> b!1472984 (=> (not res!1000572) (not e!826577))))

(assert (=> b!1472984 (= res!1000572 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643741))))

(declare-fun b!1472985 () Bool)

(declare-fun res!1000582 () Bool)

(assert (=> b!1472985 (=> (not res!1000582) (not e!826574))))

(assert (=> b!1472985 (= res!1000582 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125816 res!1000577) b!1472972))

(assert (= (and b!1472972 res!1000569) b!1472982))

(assert (= (and b!1472982 res!1000571) b!1472973))

(assert (= (and b!1472973 res!1000578) b!1472975))

(assert (= (and b!1472975 res!1000581) b!1472971))

(assert (= (and b!1472971 res!1000576) b!1472976))

(assert (= (and b!1472976 res!1000575) b!1472970))

(assert (= (and b!1472970 res!1000573) b!1472980))

(assert (= (and b!1472980 res!1000579) b!1472984))

(assert (= (and b!1472984 res!1000572) b!1472979))

(assert (= (and b!1472979 res!1000574) b!1472983))

(assert (= (and b!1472983 c!135714) b!1472978))

(assert (= (and b!1472983 (not c!135714)) b!1472977))

(assert (= (and b!1472983 res!1000580) b!1472985))

(assert (= (and b!1472985 res!1000582) b!1472981))

(assert (= (and b!1472981 (not res!1000570)) b!1472974))

(declare-fun m!1359647 () Bool)

(assert (=> b!1472980 m!1359647))

(assert (=> b!1472980 m!1359647))

(declare-fun m!1359649 () Bool)

(assert (=> b!1472980 m!1359649))

(assert (=> b!1472980 m!1359649))

(assert (=> b!1472980 m!1359647))

(declare-fun m!1359651 () Bool)

(assert (=> b!1472980 m!1359651))

(declare-fun m!1359653 () Bool)

(assert (=> b!1472971 m!1359653))

(declare-fun m!1359655 () Bool)

(assert (=> b!1472979 m!1359655))

(assert (=> b!1472979 m!1359655))

(declare-fun m!1359657 () Bool)

(assert (=> b!1472979 m!1359657))

(declare-fun m!1359659 () Bool)

(assert (=> b!1472979 m!1359659))

(declare-fun m!1359661 () Bool)

(assert (=> b!1472979 m!1359661))

(declare-fun m!1359663 () Bool)

(assert (=> start!125816 m!1359663))

(declare-fun m!1359665 () Bool)

(assert (=> start!125816 m!1359665))

(assert (=> b!1472973 m!1359647))

(assert (=> b!1472973 m!1359647))

(declare-fun m!1359667 () Bool)

(assert (=> b!1472973 m!1359667))

(declare-fun m!1359669 () Bool)

(assert (=> b!1472974 m!1359669))

(assert (=> b!1472970 m!1359659))

(declare-fun m!1359671 () Bool)

(assert (=> b!1472970 m!1359671))

(assert (=> b!1472984 m!1359647))

(assert (=> b!1472984 m!1359647))

(declare-fun m!1359673 () Bool)

(assert (=> b!1472984 m!1359673))

(declare-fun m!1359675 () Bool)

(assert (=> b!1472981 m!1359675))

(assert (=> b!1472981 m!1359659))

(declare-fun m!1359677 () Bool)

(assert (=> b!1472981 m!1359677))

(declare-fun m!1359679 () Bool)

(assert (=> b!1472981 m!1359679))

(declare-fun m!1359681 () Bool)

(assert (=> b!1472981 m!1359681))

(assert (=> b!1472981 m!1359647))

(declare-fun m!1359683 () Bool)

(assert (=> b!1472981 m!1359683))

(declare-fun m!1359685 () Bool)

(assert (=> b!1472981 m!1359685))

(assert (=> b!1472981 m!1359647))

(declare-fun m!1359687 () Bool)

(assert (=> b!1472978 m!1359687))

(declare-fun m!1359689 () Bool)

(assert (=> b!1472982 m!1359689))

(assert (=> b!1472982 m!1359689))

(declare-fun m!1359691 () Bool)

(assert (=> b!1472982 m!1359691))

(declare-fun m!1359693 () Bool)

(assert (=> b!1472977 m!1359693))

(assert (=> b!1472977 m!1359669))

(declare-fun m!1359695 () Bool)

(assert (=> b!1472975 m!1359695))

(push 1)

(assert (not b!1472979))

(assert (not b!1472978))

(assert (not b!1472984))

(assert (not b!1472974))

(assert (not b!1472981))

(assert (not b!1472971))

(assert (not b!1472975))

(assert (not b!1472977))

(assert (not b!1472982))

(assert (not b!1472980))

(assert (not b!1472973))

(assert (not start!125816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1473056 () Bool)

(declare-fun e!826624 () Bool)

(declare-fun e!826625 () Bool)

(assert (=> b!1473056 (= e!826624 e!826625)))

(declare-fun res!1000608 () Bool)

(assert (=> b!1473056 (=> (not res!1000608) (not e!826625))))

(declare-fun e!826622 () Bool)

(assert (=> b!1473056 (= res!1000608 (not e!826622))))

(declare-fun res!1000610 () Bool)

(assert (=> b!1473056 (=> (not res!1000610) (not e!826622))))

(assert (=> b!1473056 (= res!1000610 (validKeyInArray!0 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155551 () Bool)

(declare-fun res!1000609 () Bool)

(assert (=> d!155551 (=> res!1000609 e!826624)))

(assert (=> d!155551 (= res!1000609 (bvsge #b00000000000000000000000000000000 (size!48410 a!2862)))))

(assert (=> d!155551 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34358) e!826624)))

(declare-fun b!1473057 () Bool)

(declare-fun e!826623 () Bool)

(declare-fun call!67744 () Bool)

(assert (=> b!1473057 (= e!826623 call!67744)))

(declare-fun bm!67741 () Bool)

(declare-fun c!135738 () Bool)

(assert (=> bm!67741 (= call!67744 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135738 (Cons!34357 (select (arr!47860 a!2862) #b00000000000000000000000000000000) Nil!34358) Nil!34358)))))

(declare-fun b!1473058 () Bool)

(assert (=> b!1473058 (= e!826623 call!67744)))

(declare-fun b!1473059 () Bool)

(declare-fun contains!9903 (List!34361 (_ BitVec 64)) Bool)

(assert (=> b!1473059 (= e!826622 (contains!9903 Nil!34358 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1473060 () Bool)

(assert (=> b!1473060 (= e!826625 e!826623)))

(assert (=> b!1473060 (= c!135738 (validKeyInArray!0 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155551 (not res!1000609)) b!1473056))

(assert (= (and b!1473056 res!1000610) b!1473059))

(assert (= (and b!1473056 res!1000608) b!1473060))

(assert (= (and b!1473060 c!135738) b!1473058))

(assert (= (and b!1473060 (not c!135738)) b!1473057))

(assert (= (or b!1473058 b!1473057) bm!67741))

(declare-fun m!1359723 () Bool)

(assert (=> b!1473056 m!1359723))

(assert (=> b!1473056 m!1359723))

(declare-fun m!1359725 () Bool)

(assert (=> b!1473056 m!1359725))

(assert (=> bm!67741 m!1359723))

(declare-fun m!1359727 () Bool)

(assert (=> bm!67741 m!1359727))

(assert (=> b!1473059 m!1359723))

(assert (=> b!1473059 m!1359723))

(declare-fun m!1359729 () Bool)

(assert (=> b!1473059 m!1359729))

(assert (=> b!1473060 m!1359723))

(assert (=> b!1473060 m!1359723))

(assert (=> b!1473060 m!1359725))

(assert (=> b!1472971 d!155551))

(declare-fun d!155557 () Bool)

(assert (=> d!155557 (= (validKeyInArray!0 (select (arr!47860 a!2862) i!1006)) (and (not (= (select (arr!47860 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47860 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472982 d!155557))

(declare-fun d!155559 () Bool)

(assert (=> d!155559 (= (validKeyInArray!0 (select (arr!47860 a!2862) j!93)) (and (not (= (select (arr!47860 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47860 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472973 d!155559))

(declare-fun b!1473139 () Bool)

(declare-fun lt!643793 () SeekEntryResult!12100)

(assert (=> b!1473139 (and (bvsge (index!50794 lt!643793) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643793) (size!48410 a!2862)))))

(declare-fun e!826675 () Bool)

(assert (=> b!1473139 (= e!826675 (= (select (arr!47860 a!2862) (index!50794 lt!643793)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473140 () Bool)

(declare-fun e!826674 () Bool)

(declare-fun e!826672 () Bool)

(assert (=> b!1473140 (= e!826674 e!826672)))

(declare-fun res!1000637 () Bool)

(assert (=> b!1473140 (= res!1000637 (and (is-Intermediate!12100 lt!643793) (not (undefined!12912 lt!643793)) (bvslt (x!132367 lt!643793) #b01111111111111111111111111111110) (bvsge (x!132367 lt!643793) #b00000000000000000000000000000000) (bvsge (x!132367 lt!643793) x!665)))))

(assert (=> b!1473140 (=> (not res!1000637) (not e!826672))))

(declare-fun b!1473142 () Bool)

(declare-fun e!826673 () SeekEntryResult!12100)

(declare-fun e!826671 () SeekEntryResult!12100)

(assert (=> b!1473142 (= e!826673 e!826671)))

(declare-fun lt!643794 () (_ BitVec 64))

(declare-fun c!135768 () Bool)

(assert (=> b!1473142 (= c!135768 (or (= lt!643794 (select (arr!47860 a!2862) j!93)) (= (bvadd lt!643794 lt!643794) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473143 () Bool)

(assert (=> b!1473143 (= e!826673 (Intermediate!12100 true index!646 x!665))))

(declare-fun b!1473144 () Bool)

(assert (=> b!1473144 (and (bvsge (index!50794 lt!643793) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643793) (size!48410 a!2862)))))

(declare-fun res!1000636 () Bool)

(assert (=> b!1473144 (= res!1000636 (= (select (arr!47860 a!2862) (index!50794 lt!643793)) (select (arr!47860 a!2862) j!93)))))

(assert (=> b!1473144 (=> res!1000636 e!826675)))

(assert (=> b!1473144 (= e!826672 e!826675)))

(declare-fun b!1473145 () Bool)

(assert (=> b!1473145 (and (bvsge (index!50794 lt!643793) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643793) (size!48410 a!2862)))))

(declare-fun res!1000638 () Bool)

(assert (=> b!1473145 (= res!1000638 (= (select (arr!47860 a!2862) (index!50794 lt!643793)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473145 (=> res!1000638 e!826675)))

(declare-fun b!1473141 () Bool)

(assert (=> b!1473141 (= e!826671 (Intermediate!12100 false index!646 x!665))))

(declare-fun d!155561 () Bool)

(assert (=> d!155561 e!826674))

(declare-fun c!135767 () Bool)

(assert (=> d!155561 (= c!135767 (and (is-Intermediate!12100 lt!643793) (undefined!12912 lt!643793)))))

(assert (=> d!155561 (= lt!643793 e!826673)))

(declare-fun c!135766 () Bool)

(assert (=> d!155561 (= c!135766 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155561 (= lt!643794 (select (arr!47860 a!2862) index!646))))

(assert (=> d!155561 (validMask!0 mask!2687)))

(assert (=> d!155561 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643793)))

(declare-fun b!1473146 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473146 (= e!826671 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473147 () Bool)

(assert (=> b!1473147 (= e!826674 (bvsge (x!132367 lt!643793) #b01111111111111111111111111111110))))

(assert (= (and d!155561 c!135766) b!1473143))

(assert (= (and d!155561 (not c!135766)) b!1473142))

(assert (= (and b!1473142 c!135768) b!1473141))

(assert (= (and b!1473142 (not c!135768)) b!1473146))

(assert (= (and d!155561 c!135767) b!1473147))

(assert (= (and d!155561 (not c!135767)) b!1473140))

(assert (= (and b!1473140 res!1000637) b!1473144))

(assert (= (and b!1473144 (not res!1000636)) b!1473145))

(assert (= (and b!1473145 (not res!1000638)) b!1473139))

(declare-fun m!1359755 () Bool)

(assert (=> b!1473146 m!1359755))

(assert (=> b!1473146 m!1359755))

(assert (=> b!1473146 m!1359647))

(declare-fun m!1359757 () Bool)

(assert (=> b!1473146 m!1359757))

(assert (=> d!155561 m!1359681))

(assert (=> d!155561 m!1359663))

(declare-fun m!1359759 () Bool)

(assert (=> b!1473139 m!1359759))

(assert (=> b!1473145 m!1359759))

(assert (=> b!1473144 m!1359759))

(assert (=> b!1472984 d!155561))

(declare-fun b!1473148 () Bool)

(declare-fun lt!643795 () SeekEntryResult!12100)

(assert (=> b!1473148 (and (bvsge (index!50794 lt!643795) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643795) (size!48410 lt!643740)))))

(declare-fun e!826680 () Bool)

(assert (=> b!1473148 (= e!826680 (= (select (arr!47860 lt!643740) (index!50794 lt!643795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473149 () Bool)

(declare-fun e!826679 () Bool)

(declare-fun e!826677 () Bool)

(assert (=> b!1473149 (= e!826679 e!826677)))

(declare-fun res!1000640 () Bool)

(assert (=> b!1473149 (= res!1000640 (and (is-Intermediate!12100 lt!643795) (not (undefined!12912 lt!643795)) (bvslt (x!132367 lt!643795) #b01111111111111111111111111111110) (bvsge (x!132367 lt!643795) #b00000000000000000000000000000000) (bvsge (x!132367 lt!643795) #b00000000000000000000000000000000)))))

(assert (=> b!1473149 (=> (not res!1000640) (not e!826677))))

(declare-fun b!1473151 () Bool)

(declare-fun e!826678 () SeekEntryResult!12100)

(declare-fun e!826676 () SeekEntryResult!12100)

(assert (=> b!1473151 (= e!826678 e!826676)))

(declare-fun c!135771 () Bool)

(declare-fun lt!643796 () (_ BitVec 64))

(assert (=> b!1473151 (= c!135771 (or (= lt!643796 lt!643743) (= (bvadd lt!643796 lt!643796) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473152 () Bool)

(assert (=> b!1473152 (= e!826678 (Intermediate!12100 true (toIndex!0 lt!643743 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473153 () Bool)

(assert (=> b!1473153 (and (bvsge (index!50794 lt!643795) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643795) (size!48410 lt!643740)))))

(declare-fun res!1000639 () Bool)

(assert (=> b!1473153 (= res!1000639 (= (select (arr!47860 lt!643740) (index!50794 lt!643795)) lt!643743))))

(assert (=> b!1473153 (=> res!1000639 e!826680)))

(assert (=> b!1473153 (= e!826677 e!826680)))

(declare-fun b!1473154 () Bool)

(assert (=> b!1473154 (and (bvsge (index!50794 lt!643795) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643795) (size!48410 lt!643740)))))

(declare-fun res!1000641 () Bool)

(assert (=> b!1473154 (= res!1000641 (= (select (arr!47860 lt!643740) (index!50794 lt!643795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473154 (=> res!1000641 e!826680)))

(declare-fun b!1473150 () Bool)

(assert (=> b!1473150 (= e!826676 (Intermediate!12100 false (toIndex!0 lt!643743 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155571 () Bool)

(assert (=> d!155571 e!826679))

(declare-fun c!135770 () Bool)

(assert (=> d!155571 (= c!135770 (and (is-Intermediate!12100 lt!643795) (undefined!12912 lt!643795)))))

(assert (=> d!155571 (= lt!643795 e!826678)))

(declare-fun c!135769 () Bool)

(assert (=> d!155571 (= c!135769 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155571 (= lt!643796 (select (arr!47860 lt!643740) (toIndex!0 lt!643743 mask!2687)))))

(assert (=> d!155571 (validMask!0 mask!2687)))

(assert (=> d!155571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643743 mask!2687) lt!643743 lt!643740 mask!2687) lt!643795)))

(declare-fun b!1473155 () Bool)

(assert (=> b!1473155 (= e!826676 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643743 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643743 lt!643740 mask!2687))))

(declare-fun b!1473156 () Bool)

(assert (=> b!1473156 (= e!826679 (bvsge (x!132367 lt!643795) #b01111111111111111111111111111110))))

(assert (= (and d!155571 c!135769) b!1473152))

(assert (= (and d!155571 (not c!135769)) b!1473151))

(assert (= (and b!1473151 c!135771) b!1473150))

(assert (= (and b!1473151 (not c!135771)) b!1473155))

(assert (= (and d!155571 c!135770) b!1473156))

(assert (= (and d!155571 (not c!135770)) b!1473149))

(assert (= (and b!1473149 res!1000640) b!1473153))

(assert (= (and b!1473153 (not res!1000639)) b!1473154))

(assert (= (and b!1473154 (not res!1000641)) b!1473148))

(assert (=> b!1473155 m!1359655))

(declare-fun m!1359761 () Bool)

(assert (=> b!1473155 m!1359761))

(assert (=> b!1473155 m!1359761))

(declare-fun m!1359763 () Bool)

(assert (=> b!1473155 m!1359763))

(assert (=> d!155571 m!1359655))

(declare-fun m!1359765 () Bool)

(assert (=> d!155571 m!1359765))

(assert (=> d!155571 m!1359663))

(declare-fun m!1359767 () Bool)

(assert (=> b!1473148 m!1359767))

(assert (=> b!1473154 m!1359767))

(assert (=> b!1473153 m!1359767))

(assert (=> b!1472979 d!155571))

(declare-fun d!155573 () Bool)

(declare-fun lt!643822 () (_ BitVec 32))

(declare-fun lt!643821 () (_ BitVec 32))

(assert (=> d!155573 (= lt!643822 (bvmul (bvxor lt!643821 (bvlshr lt!643821 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155573 (= lt!643821 ((_ extract 31 0) (bvand (bvxor lt!643743 (bvlshr lt!643743 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155573 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000642 (let ((h!35716 ((_ extract 31 0) (bvand (bvxor lt!643743 (bvlshr lt!643743 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132374 (bvmul (bvxor h!35716 (bvlshr h!35716 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132374 (bvlshr x!132374 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000642 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000642 #b00000000000000000000000000000000))))))

(assert (=> d!155573 (= (toIndex!0 lt!643743 mask!2687) (bvand (bvxor lt!643822 (bvlshr lt!643822 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472979 d!155573))

(declare-fun b!1473191 () Bool)

(declare-fun lt!643823 () SeekEntryResult!12100)

(assert (=> b!1473191 (and (bvsge (index!50794 lt!643823) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643823) (size!48410 a!2862)))))

(declare-fun e!826704 () Bool)

(assert (=> b!1473191 (= e!826704 (= (select (arr!47860 a!2862) (index!50794 lt!643823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473192 () Bool)

(declare-fun e!826703 () Bool)

(declare-fun e!826701 () Bool)

(assert (=> b!1473192 (= e!826703 e!826701)))

(declare-fun res!1000652 () Bool)

(assert (=> b!1473192 (= res!1000652 (and (is-Intermediate!12100 lt!643823) (not (undefined!12912 lt!643823)) (bvslt (x!132367 lt!643823) #b01111111111111111111111111111110) (bvsge (x!132367 lt!643823) #b00000000000000000000000000000000) (bvsge (x!132367 lt!643823) #b00000000000000000000000000000000)))))

(assert (=> b!1473192 (=> (not res!1000652) (not e!826701))))

(declare-fun b!1473194 () Bool)

(declare-fun e!826702 () SeekEntryResult!12100)

(declare-fun e!826700 () SeekEntryResult!12100)

(assert (=> b!1473194 (= e!826702 e!826700)))

(declare-fun c!135787 () Bool)

(declare-fun lt!643824 () (_ BitVec 64))

(assert (=> b!1473194 (= c!135787 (or (= lt!643824 (select (arr!47860 a!2862) j!93)) (= (bvadd lt!643824 lt!643824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473195 () Bool)

(assert (=> b!1473195 (= e!826702 (Intermediate!12100 true (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473196 () Bool)

(assert (=> b!1473196 (and (bvsge (index!50794 lt!643823) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643823) (size!48410 a!2862)))))

(declare-fun res!1000651 () Bool)

(assert (=> b!1473196 (= res!1000651 (= (select (arr!47860 a!2862) (index!50794 lt!643823)) (select (arr!47860 a!2862) j!93)))))

(assert (=> b!1473196 (=> res!1000651 e!826704)))

(assert (=> b!1473196 (= e!826701 e!826704)))

(declare-fun b!1473197 () Bool)

(assert (=> b!1473197 (and (bvsge (index!50794 lt!643823) #b00000000000000000000000000000000) (bvslt (index!50794 lt!643823) (size!48410 a!2862)))))

(declare-fun res!1000653 () Bool)

(assert (=> b!1473197 (= res!1000653 (= (select (arr!47860 a!2862) (index!50794 lt!643823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473197 (=> res!1000653 e!826704)))

(declare-fun b!1473193 () Bool)

(assert (=> b!1473193 (= e!826700 (Intermediate!12100 false (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155591 () Bool)

(assert (=> d!155591 e!826703))

(declare-fun c!135786 () Bool)

(assert (=> d!155591 (= c!135786 (and (is-Intermediate!12100 lt!643823) (undefined!12912 lt!643823)))))

(assert (=> d!155591 (= lt!643823 e!826702)))

(declare-fun c!135785 () Bool)

(assert (=> d!155591 (= c!135785 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155591 (= lt!643824 (select (arr!47860 a!2862) (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687)))))

(assert (=> d!155591 (validMask!0 mask!2687)))

(assert (=> d!155591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643823)))

(declare-fun b!1473198 () Bool)

(assert (=> b!1473198 (= e!826700 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473199 () Bool)

(assert (=> b!1473199 (= e!826703 (bvsge (x!132367 lt!643823) #b01111111111111111111111111111110))))

(assert (= (and d!155591 c!135785) b!1473195))

(assert (= (and d!155591 (not c!135785)) b!1473194))

(assert (= (and b!1473194 c!135787) b!1473193))

(assert (= (and b!1473194 (not c!135787)) b!1473198))

(assert (= (and d!155591 c!135786) b!1473199))

(assert (= (and d!155591 (not c!135786)) b!1473192))

(assert (= (and b!1473192 res!1000652) b!1473196))

(assert (= (and b!1473196 (not res!1000651)) b!1473197))

(assert (= (and b!1473197 (not res!1000653)) b!1473191))

(assert (=> b!1473198 m!1359649))

(declare-fun m!1359813 () Bool)

(assert (=> b!1473198 m!1359813))

(assert (=> b!1473198 m!1359813))

(assert (=> b!1473198 m!1359647))

(declare-fun m!1359815 () Bool)

(assert (=> b!1473198 m!1359815))

(assert (=> d!155591 m!1359649))

(declare-fun m!1359817 () Bool)

(assert (=> d!155591 m!1359817))

(assert (=> d!155591 m!1359663))

(declare-fun m!1359819 () Bool)

(assert (=> b!1473191 m!1359819))

(assert (=> b!1473197 m!1359819))

(assert (=> b!1473196 m!1359819))

(assert (=> b!1472980 d!155591))

(declare-fun d!155597 () Bool)

(declare-fun lt!643830 () (_ BitVec 32))

(declare-fun lt!643829 () (_ BitVec 32))

(assert (=> d!155597 (= lt!643830 (bvmul (bvxor lt!643829 (bvlshr lt!643829 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155597 (= lt!643829 ((_ extract 31 0) (bvand (bvxor (select (arr!47860 a!2862) j!93) (bvlshr (select (arr!47860 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155597 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000642 (let ((h!35716 ((_ extract 31 0) (bvand (bvxor (select (arr!47860 a!2862) j!93) (bvlshr (select (arr!47860 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132374 (bvmul (bvxor h!35716 (bvlshr h!35716 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132374 (bvlshr x!132374 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000642 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000642 #b00000000000000000000000000000000))))))

(assert (=> d!155597 (= (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (bvand (bvxor lt!643830 (bvlshr lt!643830 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472980 d!155597))

(declare-fun d!155599 () Bool)

(assert (=> d!155599 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125816 d!155599))

(declare-fun d!155607 () Bool)

(assert (=> d!155607 (= (array_inv!36888 a!2862) (bvsge (size!48410 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125816 d!155607))

(declare-fun b!1473257 () Bool)

(declare-fun c!135808 () Bool)

(declare-fun lt!643849 () (_ BitVec 64))

(assert (=> b!1473257 (= c!135808 (= lt!643849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826742 () SeekEntryResult!12100)

(declare-fun e!826743 () SeekEntryResult!12100)

(assert (=> b!1473257 (= e!826742 e!826743)))

(declare-fun b!1473258 () Bool)

(declare-fun e!826744 () SeekEntryResult!12100)

(assert (=> b!1473258 (= e!826744 e!826742)))

(declare-fun lt!643850 () SeekEntryResult!12100)

(assert (=> b!1473258 (= lt!643849 (select (arr!47860 a!2862) (index!50794 lt!643850)))))

(declare-fun c!135807 () Bool)

(assert (=> b!1473258 (= c!135807 (= lt!643849 (select (arr!47860 a!2862) j!93)))))

(declare-fun d!155611 () Bool)

(declare-fun lt!643848 () SeekEntryResult!12100)

(assert (=> d!155611 (and (or (is-Undefined!12100 lt!643848) (not (is-Found!12100 lt!643848)) (and (bvsge (index!50793 lt!643848) #b00000000000000000000000000000000) (bvslt (index!50793 lt!643848) (size!48410 a!2862)))) (or (is-Undefined!12100 lt!643848) (is-Found!12100 lt!643848) (not (is-MissingZero!12100 lt!643848)) (and (bvsge (index!50792 lt!643848) #b00000000000000000000000000000000) (bvslt (index!50792 lt!643848) (size!48410 a!2862)))) (or (is-Undefined!12100 lt!643848) (is-Found!12100 lt!643848) (is-MissingZero!12100 lt!643848) (not (is-MissingVacant!12100 lt!643848)) (and (bvsge (index!50795 lt!643848) #b00000000000000000000000000000000) (bvslt (index!50795 lt!643848) (size!48410 a!2862)))) (or (is-Undefined!12100 lt!643848) (ite (is-Found!12100 lt!643848) (= (select (arr!47860 a!2862) (index!50793 lt!643848)) (select (arr!47860 a!2862) j!93)) (ite (is-MissingZero!12100 lt!643848) (= (select (arr!47860 a!2862) (index!50792 lt!643848)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12100 lt!643848) (= (select (arr!47860 a!2862) (index!50795 lt!643848)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155611 (= lt!643848 e!826744)))

(declare-fun c!135806 () Bool)

(assert (=> d!155611 (= c!135806 (and (is-Intermediate!12100 lt!643850) (undefined!12912 lt!643850)))))

(assert (=> d!155611 (= lt!643850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155611 (validMask!0 mask!2687)))

(assert (=> d!155611 (= (seekEntryOrOpen!0 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643848)))

(declare-fun b!1473259 () Bool)

(assert (=> b!1473259 (= e!826743 (MissingZero!12100 (index!50794 lt!643850)))))

(declare-fun b!1473260 () Bool)

(assert (=> b!1473260 (= e!826743 (seekKeyOrZeroReturnVacant!0 (x!132367 lt!643850) (index!50794 lt!643850) (index!50794 lt!643850) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473261 () Bool)

(assert (=> b!1473261 (= e!826742 (Found!12100 (index!50794 lt!643850)))))

(declare-fun b!1473262 () Bool)

(assert (=> b!1473262 (= e!826744 Undefined!12100)))

(assert (= (and d!155611 c!135806) b!1473262))

(assert (= (and d!155611 (not c!135806)) b!1473258))

(assert (= (and b!1473258 c!135807) b!1473261))

(assert (= (and b!1473258 (not c!135807)) b!1473257))

(assert (= (and b!1473257 c!135808) b!1473259))

(assert (= (and b!1473257 (not c!135808)) b!1473260))

(declare-fun m!1359845 () Bool)

(assert (=> b!1473258 m!1359845))

(assert (=> d!155611 m!1359663))

(assert (=> d!155611 m!1359649))

(assert (=> d!155611 m!1359647))

(assert (=> d!155611 m!1359651))

(declare-fun m!1359847 () Bool)

(assert (=> d!155611 m!1359847))

(assert (=> d!155611 m!1359647))

(assert (=> d!155611 m!1359649))

(declare-fun m!1359849 () Bool)

(assert (=> d!155611 m!1359849))

(declare-fun m!1359851 () Bool)

(assert (=> d!155611 m!1359851))

(assert (=> b!1473260 m!1359647))

(declare-fun m!1359853 () Bool)

(assert (=> b!1473260 m!1359853))

(assert (=> b!1472981 d!155611))

(declare-fun b!1473289 () Bool)

(declare-fun e!826760 () Bool)

(declare-fun e!826761 () Bool)

(assert (=> b!1473289 (= e!826760 e!826761)))

(declare-fun c!135820 () Bool)

(assert (=> b!1473289 (= c!135820 (validKeyInArray!0 (select (arr!47860 a!2862) j!93)))))

(declare-fun b!1473290 () Bool)

(declare-fun e!826762 () Bool)

(assert (=> b!1473290 (= e!826761 e!826762)))

(declare-fun lt!643865 () (_ BitVec 64))

(assert (=> b!1473290 (= lt!643865 (select (arr!47860 a!2862) j!93))))

(declare-fun lt!643864 () Unit!49540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99150 (_ BitVec 64) (_ BitVec 32)) Unit!49540)

(assert (=> b!1473290 (= lt!643864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643865 j!93))))

(declare-fun arrayContainsKey!0 (array!99150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1473290 (arrayContainsKey!0 a!2862 lt!643865 #b00000000000000000000000000000000)))

(declare-fun lt!643863 () Unit!49540)

(assert (=> b!1473290 (= lt!643863 lt!643864)))

(declare-fun res!1000679 () Bool)

(assert (=> b!1473290 (= res!1000679 (= (seekEntryOrOpen!0 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) (Found!12100 j!93)))))

(assert (=> b!1473290 (=> (not res!1000679) (not e!826762))))

(declare-fun b!1473291 () Bool)

(declare-fun call!67757 () Bool)

(assert (=> b!1473291 (= e!826762 call!67757)))

(declare-fun d!155621 () Bool)

(declare-fun res!1000680 () Bool)

(assert (=> d!155621 (=> res!1000680 e!826760)))

(assert (=> d!155621 (= res!1000680 (bvsge j!93 (size!48410 a!2862)))))

(assert (=> d!155621 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!826760)))

(declare-fun bm!67754 () Bool)

(assert (=> bm!67754 (= call!67757 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1473292 () Bool)

(assert (=> b!1473292 (= e!826761 call!67757)))

(assert (= (and d!155621 (not res!1000680)) b!1473289))

(assert (= (and b!1473289 c!135820) b!1473290))

(assert (= (and b!1473289 (not c!135820)) b!1473292))

(assert (= (and b!1473290 res!1000679) b!1473291))

(assert (= (or b!1473291 b!1473292) bm!67754))

(assert (=> b!1473289 m!1359647))

(assert (=> b!1473289 m!1359647))

(assert (=> b!1473289 m!1359667))

(assert (=> b!1473290 m!1359647))

(declare-fun m!1359861 () Bool)

(assert (=> b!1473290 m!1359861))

(declare-fun m!1359863 () Bool)

(assert (=> b!1473290 m!1359863))

(assert (=> b!1473290 m!1359647))

(assert (=> b!1473290 m!1359683))

(declare-fun m!1359865 () Bool)

(assert (=> bm!67754 m!1359865))

(assert (=> b!1472981 d!155621))

(declare-fun d!155625 () Bool)

(assert (=> d!155625 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643868 () Unit!49540)

(declare-fun choose!38 (array!99150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49540)

(assert (=> d!155625 (= lt!643868 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155625 (validMask!0 mask!2687)))

(assert (=> d!155625 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643868)))

(declare-fun bs!42540 () Bool)

(assert (= bs!42540 d!155625))

(assert (=> bs!42540 m!1359685))

(declare-fun m!1359867 () Bool)

(assert (=> bs!42540 m!1359867))

(assert (=> bs!42540 m!1359663))

(assert (=> b!1472981 d!155625))

(declare-fun b!1473323 () Bool)

(declare-fun e!826780 () SeekEntryResult!12100)

(assert (=> b!1473323 (= e!826780 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643743 lt!643740 mask!2687))))

