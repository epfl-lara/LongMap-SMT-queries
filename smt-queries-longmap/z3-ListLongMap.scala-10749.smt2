; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125662 () Bool)

(assert start!125662)

(declare-fun b!1470777 () Bool)

(declare-fun res!998960 () Bool)

(declare-fun e!825561 () Bool)

(assert (=> b!1470777 (=> (not res!998960) (not e!825561))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470777 (= res!998960 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470778 () Bool)

(declare-fun res!998969 () Bool)

(declare-fun e!825560 () Bool)

(assert (=> b!1470778 (=> (not res!998969) (not e!825560))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99031 0))(
  ( (array!99032 (arr!47803 (Array (_ BitVec 32) (_ BitVec 64))) (size!48355 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99031)

(assert (=> b!1470778 (= res!998969 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48355 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48355 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48355 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470780 () Bool)

(declare-fun e!825558 () Bool)

(assert (=> b!1470780 (= e!825558 e!825561)))

(declare-fun res!998970 () Bool)

(assert (=> b!1470780 (=> (not res!998970) (not e!825561))))

(declare-datatypes ((SeekEntryResult!12068 0))(
  ( (MissingZero!12068 (index!50664 (_ BitVec 32))) (Found!12068 (index!50665 (_ BitVec 32))) (Intermediate!12068 (undefined!12880 Bool) (index!50666 (_ BitVec 32)) (x!132241 (_ BitVec 32))) (Undefined!12068) (MissingVacant!12068 (index!50667 (_ BitVec 32))) )
))
(declare-fun lt!642860 () SeekEntryResult!12068)

(assert (=> b!1470780 (= res!998970 (= lt!642860 (Intermediate!12068 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642859 () (_ BitVec 64))

(declare-fun lt!642857 () array!99031)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99031 (_ BitVec 32)) SeekEntryResult!12068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470780 (= lt!642860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642859 mask!2687) lt!642859 lt!642857 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1470780 (= lt!642859 (select (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470781 () Bool)

(assert (=> b!1470781 (= e!825561 (not (or (= (select (arr!47803 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47803 a!2862) intermediateBeforeIndex!19) (select (arr!47803 a!2862) j!93)))))))

(declare-fun e!825564 () Bool)

(assert (=> b!1470781 e!825564))

(declare-fun res!998958 () Bool)

(assert (=> b!1470781 (=> (not res!998958) (not e!825564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99031 (_ BitVec 32)) Bool)

(assert (=> b!1470781 (= res!998958 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49317 0))(
  ( (Unit!49318) )
))
(declare-fun lt!642858 () Unit!49317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49317)

(assert (=> b!1470781 (= lt!642858 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470782 () Bool)

(declare-fun e!825562 () Bool)

(assert (=> b!1470782 (= e!825562 e!825558)))

(declare-fun res!998959 () Bool)

(assert (=> b!1470782 (=> (not res!998959) (not e!825558))))

(declare-fun lt!642861 () SeekEntryResult!12068)

(assert (=> b!1470782 (= res!998959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642861))))

(assert (=> b!1470782 (= lt!642861 (Intermediate!12068 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470783 () Bool)

(assert (=> b!1470783 (= e!825560 e!825562)))

(declare-fun res!998961 () Bool)

(assert (=> b!1470783 (=> (not res!998961) (not e!825562))))

(assert (=> b!1470783 (= res!998961 (= (select (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470783 (= lt!642857 (array!99032 (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48355 a!2862)))))

(declare-fun e!825559 () Bool)

(declare-fun b!1470784 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99031 (_ BitVec 32)) SeekEntryResult!12068)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99031 (_ BitVec 32)) SeekEntryResult!12068)

(assert (=> b!1470784 (= e!825559 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642859 lt!642857 mask!2687) (seekEntryOrOpen!0 lt!642859 lt!642857 mask!2687)))))

(declare-fun b!1470785 () Bool)

(declare-fun res!998967 () Bool)

(assert (=> b!1470785 (=> (not res!998967) (not e!825561))))

(assert (=> b!1470785 (= res!998967 e!825559)))

(declare-fun c!135424 () Bool)

(assert (=> b!1470785 (= c!135424 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470786 () Bool)

(assert (=> b!1470786 (= e!825564 (= (seekEntryOrOpen!0 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) (Found!12068 j!93)))))

(declare-fun b!1470787 () Bool)

(declare-fun res!998968 () Bool)

(assert (=> b!1470787 (=> (not res!998968) (not e!825558))))

(assert (=> b!1470787 (= res!998968 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642861))))

(declare-fun b!1470788 () Bool)

(declare-fun res!998964 () Bool)

(assert (=> b!1470788 (=> (not res!998964) (not e!825560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470788 (= res!998964 (validKeyInArray!0 (select (arr!47803 a!2862) j!93)))))

(declare-fun res!998962 () Bool)

(assert (=> start!125662 (=> (not res!998962) (not e!825560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125662 (= res!998962 (validMask!0 mask!2687))))

(assert (=> start!125662 e!825560))

(assert (=> start!125662 true))

(declare-fun array_inv!37036 (array!99031) Bool)

(assert (=> start!125662 (array_inv!37036 a!2862)))

(declare-fun b!1470779 () Bool)

(declare-fun res!998965 () Bool)

(assert (=> b!1470779 (=> (not res!998965) (not e!825560))))

(assert (=> b!1470779 (= res!998965 (and (= (size!48355 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48355 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48355 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470789 () Bool)

(declare-fun res!998971 () Bool)

(assert (=> b!1470789 (=> (not res!998971) (not e!825560))))

(assert (=> b!1470789 (= res!998971 (validKeyInArray!0 (select (arr!47803 a!2862) i!1006)))))

(declare-fun b!1470790 () Bool)

(declare-fun res!998966 () Bool)

(assert (=> b!1470790 (=> (not res!998966) (not e!825560))))

(assert (=> b!1470790 (= res!998966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470791 () Bool)

(declare-fun res!998963 () Bool)

(assert (=> b!1470791 (=> (not res!998963) (not e!825560))))

(declare-datatypes ((List!34382 0))(
  ( (Nil!34379) (Cons!34378 (h!35731 (_ BitVec 64)) (t!49068 List!34382)) )
))
(declare-fun arrayNoDuplicates!0 (array!99031 (_ BitVec 32) List!34382) Bool)

(assert (=> b!1470791 (= res!998963 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34379))))

(declare-fun b!1470792 () Bool)

(assert (=> b!1470792 (= e!825559 (= lt!642860 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642859 lt!642857 mask!2687)))))

(assert (= (and start!125662 res!998962) b!1470779))

(assert (= (and b!1470779 res!998965) b!1470789))

(assert (= (and b!1470789 res!998971) b!1470788))

(assert (= (and b!1470788 res!998964) b!1470790))

(assert (= (and b!1470790 res!998966) b!1470791))

(assert (= (and b!1470791 res!998963) b!1470778))

(assert (= (and b!1470778 res!998969) b!1470783))

(assert (= (and b!1470783 res!998961) b!1470782))

(assert (= (and b!1470782 res!998959) b!1470787))

(assert (= (and b!1470787 res!998968) b!1470780))

(assert (= (and b!1470780 res!998970) b!1470785))

(assert (= (and b!1470785 c!135424) b!1470792))

(assert (= (and b!1470785 (not c!135424)) b!1470784))

(assert (= (and b!1470785 res!998967) b!1470777))

(assert (= (and b!1470777 res!998960) b!1470781))

(assert (= (and b!1470781 res!998958) b!1470786))

(declare-fun m!1357251 () Bool)

(assert (=> b!1470788 m!1357251))

(assert (=> b!1470788 m!1357251))

(declare-fun m!1357253 () Bool)

(assert (=> b!1470788 m!1357253))

(declare-fun m!1357255 () Bool)

(assert (=> b!1470789 m!1357255))

(assert (=> b!1470789 m!1357255))

(declare-fun m!1357257 () Bool)

(assert (=> b!1470789 m!1357257))

(declare-fun m!1357259 () Bool)

(assert (=> b!1470791 m!1357259))

(declare-fun m!1357261 () Bool)

(assert (=> b!1470792 m!1357261))

(assert (=> b!1470786 m!1357251))

(assert (=> b!1470786 m!1357251))

(declare-fun m!1357263 () Bool)

(assert (=> b!1470786 m!1357263))

(declare-fun m!1357265 () Bool)

(assert (=> b!1470781 m!1357265))

(assert (=> b!1470781 m!1357251))

(declare-fun m!1357267 () Bool)

(assert (=> b!1470781 m!1357267))

(declare-fun m!1357269 () Bool)

(assert (=> b!1470781 m!1357269))

(assert (=> b!1470782 m!1357251))

(assert (=> b!1470782 m!1357251))

(declare-fun m!1357271 () Bool)

(assert (=> b!1470782 m!1357271))

(assert (=> b!1470782 m!1357271))

(assert (=> b!1470782 m!1357251))

(declare-fun m!1357273 () Bool)

(assert (=> b!1470782 m!1357273))

(declare-fun m!1357275 () Bool)

(assert (=> b!1470780 m!1357275))

(assert (=> b!1470780 m!1357275))

(declare-fun m!1357277 () Bool)

(assert (=> b!1470780 m!1357277))

(declare-fun m!1357279 () Bool)

(assert (=> b!1470780 m!1357279))

(declare-fun m!1357281 () Bool)

(assert (=> b!1470780 m!1357281))

(declare-fun m!1357283 () Bool)

(assert (=> b!1470790 m!1357283))

(declare-fun m!1357285 () Bool)

(assert (=> start!125662 m!1357285))

(declare-fun m!1357287 () Bool)

(assert (=> start!125662 m!1357287))

(declare-fun m!1357289 () Bool)

(assert (=> b!1470784 m!1357289))

(declare-fun m!1357291 () Bool)

(assert (=> b!1470784 m!1357291))

(assert (=> b!1470787 m!1357251))

(assert (=> b!1470787 m!1357251))

(declare-fun m!1357293 () Bool)

(assert (=> b!1470787 m!1357293))

(assert (=> b!1470783 m!1357279))

(declare-fun m!1357295 () Bool)

(assert (=> b!1470783 m!1357295))

(check-sat (not b!1470782) (not b!1470788) (not b!1470781) (not b!1470786) (not b!1470784) (not start!125662) (not b!1470789) (not b!1470792) (not b!1470790) (not b!1470787) (not b!1470780) (not b!1470791))
(check-sat)
(get-model)

(declare-fun b!1470898 () Bool)

(declare-fun e!825615 () Bool)

(declare-fun e!825613 () Bool)

(assert (=> b!1470898 (= e!825615 e!825613)))

(declare-fun c!135433 () Bool)

(assert (=> b!1470898 (= c!135433 (validKeyInArray!0 (select (arr!47803 a!2862) j!93)))))

(declare-fun call!67691 () Bool)

(declare-fun bm!67688 () Bool)

(assert (=> bm!67688 (= call!67691 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1470899 () Bool)

(assert (=> b!1470899 (= e!825613 call!67691)))

(declare-fun b!1470900 () Bool)

(declare-fun e!825614 () Bool)

(assert (=> b!1470900 (= e!825613 e!825614)))

(declare-fun lt!642898 () (_ BitVec 64))

(assert (=> b!1470900 (= lt!642898 (select (arr!47803 a!2862) j!93))))

(declare-fun lt!642899 () Unit!49317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99031 (_ BitVec 64) (_ BitVec 32)) Unit!49317)

(assert (=> b!1470900 (= lt!642899 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642898 j!93))))

(declare-fun arrayContainsKey!0 (array!99031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1470900 (arrayContainsKey!0 a!2862 lt!642898 #b00000000000000000000000000000000)))

(declare-fun lt!642900 () Unit!49317)

(assert (=> b!1470900 (= lt!642900 lt!642899)))

(declare-fun res!999060 () Bool)

(assert (=> b!1470900 (= res!999060 (= (seekEntryOrOpen!0 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) (Found!12068 j!93)))))

(assert (=> b!1470900 (=> (not res!999060) (not e!825614))))

(declare-fun d!155239 () Bool)

(declare-fun res!999061 () Bool)

(assert (=> d!155239 (=> res!999061 e!825615)))

(assert (=> d!155239 (= res!999061 (bvsge j!93 (size!48355 a!2862)))))

(assert (=> d!155239 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825615)))

(declare-fun b!1470897 () Bool)

(assert (=> b!1470897 (= e!825614 call!67691)))

(assert (= (and d!155239 (not res!999061)) b!1470898))

(assert (= (and b!1470898 c!135433) b!1470900))

(assert (= (and b!1470898 (not c!135433)) b!1470899))

(assert (= (and b!1470900 res!999060) b!1470897))

(assert (= (or b!1470897 b!1470899) bm!67688))

(assert (=> b!1470898 m!1357251))

(assert (=> b!1470898 m!1357251))

(assert (=> b!1470898 m!1357253))

(declare-fun m!1357389 () Bool)

(assert (=> bm!67688 m!1357389))

(assert (=> b!1470900 m!1357251))

(declare-fun m!1357391 () Bool)

(assert (=> b!1470900 m!1357391))

(declare-fun m!1357393 () Bool)

(assert (=> b!1470900 m!1357393))

(assert (=> b!1470900 m!1357251))

(assert (=> b!1470900 m!1357263))

(assert (=> b!1470781 d!155239))

(declare-fun d!155241 () Bool)

(assert (=> d!155241 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642903 () Unit!49317)

(declare-fun choose!38 (array!99031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49317)

(assert (=> d!155241 (= lt!642903 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155241 (validMask!0 mask!2687)))

(assert (=> d!155241 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!642903)))

(declare-fun bs!42472 () Bool)

(assert (= bs!42472 d!155241))

(assert (=> bs!42472 m!1357267))

(declare-fun m!1357395 () Bool)

(assert (=> bs!42472 m!1357395))

(assert (=> bs!42472 m!1357285))

(assert (=> b!1470781 d!155241))

(declare-fun b!1470919 () Bool)

(declare-fun lt!642908 () SeekEntryResult!12068)

(assert (=> b!1470919 (and (bvsge (index!50666 lt!642908) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642908) (size!48355 lt!642857)))))

(declare-fun res!999068 () Bool)

(assert (=> b!1470919 (= res!999068 (= (select (arr!47803 lt!642857) (index!50666 lt!642908)) lt!642859))))

(declare-fun e!825627 () Bool)

(assert (=> b!1470919 (=> res!999068 e!825627)))

(declare-fun e!825628 () Bool)

(assert (=> b!1470919 (= e!825628 e!825627)))

(declare-fun b!1470920 () Bool)

(declare-fun e!825630 () Bool)

(assert (=> b!1470920 (= e!825630 (bvsge (x!132241 lt!642908) #b01111111111111111111111111111110))))

(declare-fun b!1470921 () Bool)

(assert (=> b!1470921 (and (bvsge (index!50666 lt!642908) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642908) (size!48355 lt!642857)))))

(assert (=> b!1470921 (= e!825627 (= (select (arr!47803 lt!642857) (index!50666 lt!642908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470922 () Bool)

(declare-fun e!825626 () SeekEntryResult!12068)

(declare-fun e!825629 () SeekEntryResult!12068)

(assert (=> b!1470922 (= e!825626 e!825629)))

(declare-fun c!135440 () Bool)

(declare-fun lt!642909 () (_ BitVec 64))

(assert (=> b!1470922 (= c!135440 (or (= lt!642909 lt!642859) (= (bvadd lt!642909 lt!642909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470923 () Bool)

(assert (=> b!1470923 (= e!825629 (Intermediate!12068 false index!646 x!665))))

(declare-fun b!1470925 () Bool)

(assert (=> b!1470925 (= e!825626 (Intermediate!12068 true index!646 x!665))))

(declare-fun b!1470926 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470926 (= e!825629 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!642859 lt!642857 mask!2687))))

(declare-fun b!1470927 () Bool)

(assert (=> b!1470927 (and (bvsge (index!50666 lt!642908) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642908) (size!48355 lt!642857)))))

(declare-fun res!999069 () Bool)

(assert (=> b!1470927 (= res!999069 (= (select (arr!47803 lt!642857) (index!50666 lt!642908)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470927 (=> res!999069 e!825627)))

(declare-fun b!1470924 () Bool)

(assert (=> b!1470924 (= e!825630 e!825628)))

(declare-fun res!999070 () Bool)

(get-info :version)

(assert (=> b!1470924 (= res!999070 (and ((_ is Intermediate!12068) lt!642908) (not (undefined!12880 lt!642908)) (bvslt (x!132241 lt!642908) #b01111111111111111111111111111110) (bvsge (x!132241 lt!642908) #b00000000000000000000000000000000) (bvsge (x!132241 lt!642908) x!665)))))

(assert (=> b!1470924 (=> (not res!999070) (not e!825628))))

(declare-fun d!155243 () Bool)

(assert (=> d!155243 e!825630))

(declare-fun c!135442 () Bool)

(assert (=> d!155243 (= c!135442 (and ((_ is Intermediate!12068) lt!642908) (undefined!12880 lt!642908)))))

(assert (=> d!155243 (= lt!642908 e!825626)))

(declare-fun c!135441 () Bool)

(assert (=> d!155243 (= c!135441 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155243 (= lt!642909 (select (arr!47803 lt!642857) index!646))))

(assert (=> d!155243 (validMask!0 mask!2687)))

(assert (=> d!155243 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642859 lt!642857 mask!2687) lt!642908)))

(assert (= (and d!155243 c!135441) b!1470925))

(assert (= (and d!155243 (not c!135441)) b!1470922))

(assert (= (and b!1470922 c!135440) b!1470923))

(assert (= (and b!1470922 (not c!135440)) b!1470926))

(assert (= (and d!155243 c!135442) b!1470920))

(assert (= (and d!155243 (not c!135442)) b!1470924))

(assert (= (and b!1470924 res!999070) b!1470919))

(assert (= (and b!1470919 (not res!999068)) b!1470927))

(assert (= (and b!1470927 (not res!999069)) b!1470921))

(declare-fun m!1357397 () Bool)

(assert (=> b!1470919 m!1357397))

(declare-fun m!1357399 () Bool)

(assert (=> b!1470926 m!1357399))

(assert (=> b!1470926 m!1357399))

(declare-fun m!1357401 () Bool)

(assert (=> b!1470926 m!1357401))

(declare-fun m!1357403 () Bool)

(assert (=> d!155243 m!1357403))

(assert (=> d!155243 m!1357285))

(assert (=> b!1470927 m!1357397))

(assert (=> b!1470921 m!1357397))

(assert (=> b!1470792 d!155243))

(declare-fun d!155245 () Bool)

(assert (=> d!155245 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125662 d!155245))

(declare-fun d!155253 () Bool)

(assert (=> d!155253 (= (array_inv!37036 a!2862) (bvsge (size!48355 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125662 d!155253))

(declare-fun b!1470938 () Bool)

(declare-fun e!825641 () Bool)

(declare-fun call!67694 () Bool)

(assert (=> b!1470938 (= e!825641 call!67694)))

(declare-fun bm!67691 () Bool)

(declare-fun c!135445 () Bool)

(assert (=> bm!67691 (= call!67694 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135445 (Cons!34378 (select (arr!47803 a!2862) #b00000000000000000000000000000000) Nil!34379) Nil!34379)))))

(declare-fun b!1470939 () Bool)

(declare-fun e!825639 () Bool)

(declare-fun contains!9863 (List!34382 (_ BitVec 64)) Bool)

(assert (=> b!1470939 (= e!825639 (contains!9863 Nil!34379 (select (arr!47803 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470940 () Bool)

(assert (=> b!1470940 (= e!825641 call!67694)))

(declare-fun d!155255 () Bool)

(declare-fun res!999079 () Bool)

(declare-fun e!825642 () Bool)

(assert (=> d!155255 (=> res!999079 e!825642)))

(assert (=> d!155255 (= res!999079 (bvsge #b00000000000000000000000000000000 (size!48355 a!2862)))))

(assert (=> d!155255 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34379) e!825642)))

(declare-fun b!1470941 () Bool)

(declare-fun e!825640 () Bool)

(assert (=> b!1470941 (= e!825640 e!825641)))

(assert (=> b!1470941 (= c!135445 (validKeyInArray!0 (select (arr!47803 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470942 () Bool)

(assert (=> b!1470942 (= e!825642 e!825640)))

(declare-fun res!999078 () Bool)

(assert (=> b!1470942 (=> (not res!999078) (not e!825640))))

(assert (=> b!1470942 (= res!999078 (not e!825639))))

(declare-fun res!999077 () Bool)

(assert (=> b!1470942 (=> (not res!999077) (not e!825639))))

(assert (=> b!1470942 (= res!999077 (validKeyInArray!0 (select (arr!47803 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155255 (not res!999079)) b!1470942))

(assert (= (and b!1470942 res!999077) b!1470939))

(assert (= (and b!1470942 res!999078) b!1470941))

(assert (= (and b!1470941 c!135445) b!1470938))

(assert (= (and b!1470941 (not c!135445)) b!1470940))

(assert (= (or b!1470938 b!1470940) bm!67691))

(declare-fun m!1357405 () Bool)

(assert (=> bm!67691 m!1357405))

(declare-fun m!1357407 () Bool)

(assert (=> bm!67691 m!1357407))

(assert (=> b!1470939 m!1357405))

(assert (=> b!1470939 m!1357405))

(declare-fun m!1357409 () Bool)

(assert (=> b!1470939 m!1357409))

(assert (=> b!1470941 m!1357405))

(assert (=> b!1470941 m!1357405))

(declare-fun m!1357411 () Bool)

(assert (=> b!1470941 m!1357411))

(assert (=> b!1470942 m!1357405))

(assert (=> b!1470942 m!1357405))

(assert (=> b!1470942 m!1357411))

(assert (=> b!1470791 d!155255))

(declare-fun b!1470951 () Bool)

(declare-fun lt!642914 () SeekEntryResult!12068)

(assert (=> b!1470951 (and (bvsge (index!50666 lt!642914) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642914) (size!48355 a!2862)))))

(declare-fun res!999080 () Bool)

(assert (=> b!1470951 (= res!999080 (= (select (arr!47803 a!2862) (index!50666 lt!642914)) (select (arr!47803 a!2862) j!93)))))

(declare-fun e!825648 () Bool)

(assert (=> b!1470951 (=> res!999080 e!825648)))

(declare-fun e!825649 () Bool)

(assert (=> b!1470951 (= e!825649 e!825648)))

(declare-fun b!1470952 () Bool)

(declare-fun e!825651 () Bool)

(assert (=> b!1470952 (= e!825651 (bvsge (x!132241 lt!642914) #b01111111111111111111111111111110))))

(declare-fun b!1470953 () Bool)

(assert (=> b!1470953 (and (bvsge (index!50666 lt!642914) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642914) (size!48355 a!2862)))))

(assert (=> b!1470953 (= e!825648 (= (select (arr!47803 a!2862) (index!50666 lt!642914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470954 () Bool)

(declare-fun e!825647 () SeekEntryResult!12068)

(declare-fun e!825650 () SeekEntryResult!12068)

(assert (=> b!1470954 (= e!825647 e!825650)))

(declare-fun c!135450 () Bool)

(declare-fun lt!642915 () (_ BitVec 64))

(assert (=> b!1470954 (= c!135450 (or (= lt!642915 (select (arr!47803 a!2862) j!93)) (= (bvadd lt!642915 lt!642915) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470955 () Bool)

(assert (=> b!1470955 (= e!825650 (Intermediate!12068 false (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470957 () Bool)

(assert (=> b!1470957 (= e!825647 (Intermediate!12068 true (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470958 () Bool)

(assert (=> b!1470958 (= e!825650 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470959 () Bool)

(assert (=> b!1470959 (and (bvsge (index!50666 lt!642914) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642914) (size!48355 a!2862)))))

(declare-fun res!999081 () Bool)

(assert (=> b!1470959 (= res!999081 (= (select (arr!47803 a!2862) (index!50666 lt!642914)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470959 (=> res!999081 e!825648)))

(declare-fun b!1470956 () Bool)

(assert (=> b!1470956 (= e!825651 e!825649)))

(declare-fun res!999082 () Bool)

(assert (=> b!1470956 (= res!999082 (and ((_ is Intermediate!12068) lt!642914) (not (undefined!12880 lt!642914)) (bvslt (x!132241 lt!642914) #b01111111111111111111111111111110) (bvsge (x!132241 lt!642914) #b00000000000000000000000000000000) (bvsge (x!132241 lt!642914) #b00000000000000000000000000000000)))))

(assert (=> b!1470956 (=> (not res!999082) (not e!825649))))

(declare-fun d!155257 () Bool)

(assert (=> d!155257 e!825651))

(declare-fun c!135452 () Bool)

(assert (=> d!155257 (= c!135452 (and ((_ is Intermediate!12068) lt!642914) (undefined!12880 lt!642914)))))

(assert (=> d!155257 (= lt!642914 e!825647)))

(declare-fun c!135451 () Bool)

(assert (=> d!155257 (= c!135451 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155257 (= lt!642915 (select (arr!47803 a!2862) (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687)))))

(assert (=> d!155257 (validMask!0 mask!2687)))

(assert (=> d!155257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642914)))

(assert (= (and d!155257 c!135451) b!1470957))

(assert (= (and d!155257 (not c!135451)) b!1470954))

(assert (= (and b!1470954 c!135450) b!1470955))

(assert (= (and b!1470954 (not c!135450)) b!1470958))

(assert (= (and d!155257 c!135452) b!1470952))

(assert (= (and d!155257 (not c!135452)) b!1470956))

(assert (= (and b!1470956 res!999082) b!1470951))

(assert (= (and b!1470951 (not res!999080)) b!1470959))

(assert (= (and b!1470959 (not res!999081)) b!1470953))

(declare-fun m!1357413 () Bool)

(assert (=> b!1470951 m!1357413))

(assert (=> b!1470958 m!1357271))

(declare-fun m!1357415 () Bool)

(assert (=> b!1470958 m!1357415))

(assert (=> b!1470958 m!1357415))

(assert (=> b!1470958 m!1357251))

(declare-fun m!1357417 () Bool)

(assert (=> b!1470958 m!1357417))

(assert (=> d!155257 m!1357271))

(declare-fun m!1357419 () Bool)

(assert (=> d!155257 m!1357419))

(assert (=> d!155257 m!1357285))

(assert (=> b!1470959 m!1357413))

(assert (=> b!1470953 m!1357413))

(assert (=> b!1470782 d!155257))

(declare-fun d!155259 () Bool)

(declare-fun lt!642927 () (_ BitVec 32))

(declare-fun lt!642926 () (_ BitVec 32))

(assert (=> d!155259 (= lt!642927 (bvmul (bvxor lt!642926 (bvlshr lt!642926 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155259 (= lt!642926 ((_ extract 31 0) (bvand (bvxor (select (arr!47803 a!2862) j!93) (bvlshr (select (arr!47803 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155259 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999089 (let ((h!35734 ((_ extract 31 0) (bvand (bvxor (select (arr!47803 a!2862) j!93) (bvlshr (select (arr!47803 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132247 (bvmul (bvxor h!35734 (bvlshr h!35734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132247 (bvlshr x!132247 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999089 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999089 #b00000000000000000000000000000000))))))

(assert (=> d!155259 (= (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) (bvand (bvxor lt!642927 (bvlshr lt!642927 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470782 d!155259))

(declare-fun b!1471073 () Bool)

(declare-fun e!825724 () SeekEntryResult!12068)

(assert (=> b!1471073 (= e!825724 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!642859 lt!642857 mask!2687))))

(declare-fun b!1471074 () Bool)

(declare-fun c!135487 () Bool)

(declare-fun lt!642953 () (_ BitVec 64))

(assert (=> b!1471074 (= c!135487 (= lt!642953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825723 () SeekEntryResult!12068)

(assert (=> b!1471074 (= e!825723 e!825724)))

(declare-fun b!1471075 () Bool)

(assert (=> b!1471075 (= e!825723 (Found!12068 index!646))))

(declare-fun b!1471076 () Bool)

(declare-fun e!825725 () SeekEntryResult!12068)

(assert (=> b!1471076 (= e!825725 Undefined!12068)))

(declare-fun b!1471077 () Bool)

(assert (=> b!1471077 (= e!825724 (MissingVacant!12068 intermediateAfterIndex!19))))

(declare-fun lt!642954 () SeekEntryResult!12068)

(declare-fun d!155263 () Bool)

(assert (=> d!155263 (and (or ((_ is Undefined!12068) lt!642954) (not ((_ is Found!12068) lt!642954)) (and (bvsge (index!50665 lt!642954) #b00000000000000000000000000000000) (bvslt (index!50665 lt!642954) (size!48355 lt!642857)))) (or ((_ is Undefined!12068) lt!642954) ((_ is Found!12068) lt!642954) (not ((_ is MissingVacant!12068) lt!642954)) (not (= (index!50667 lt!642954) intermediateAfterIndex!19)) (and (bvsge (index!50667 lt!642954) #b00000000000000000000000000000000) (bvslt (index!50667 lt!642954) (size!48355 lt!642857)))) (or ((_ is Undefined!12068) lt!642954) (ite ((_ is Found!12068) lt!642954) (= (select (arr!47803 lt!642857) (index!50665 lt!642954)) lt!642859) (and ((_ is MissingVacant!12068) lt!642954) (= (index!50667 lt!642954) intermediateAfterIndex!19) (= (select (arr!47803 lt!642857) (index!50667 lt!642954)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155263 (= lt!642954 e!825725)))

(declare-fun c!135488 () Bool)

(assert (=> d!155263 (= c!135488 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155263 (= lt!642953 (select (arr!47803 lt!642857) index!646))))

(assert (=> d!155263 (validMask!0 mask!2687)))

(assert (=> d!155263 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642859 lt!642857 mask!2687) lt!642954)))

(declare-fun b!1471078 () Bool)

(assert (=> b!1471078 (= e!825725 e!825723)))

(declare-fun c!135489 () Bool)

(assert (=> b!1471078 (= c!135489 (= lt!642953 lt!642859))))

(assert (= (and d!155263 c!135488) b!1471076))

(assert (= (and d!155263 (not c!135488)) b!1471078))

(assert (= (and b!1471078 c!135489) b!1471075))

(assert (= (and b!1471078 (not c!135489)) b!1471074))

(assert (= (and b!1471074 c!135487) b!1471077))

(assert (= (and b!1471074 (not c!135487)) b!1471073))

(assert (=> b!1471073 m!1357399))

(assert (=> b!1471073 m!1357399))

(declare-fun m!1357473 () Bool)

(assert (=> b!1471073 m!1357473))

(declare-fun m!1357475 () Bool)

(assert (=> d!155263 m!1357475))

(declare-fun m!1357477 () Bool)

(assert (=> d!155263 m!1357477))

(assert (=> d!155263 m!1357403))

(assert (=> d!155263 m!1357285))

(assert (=> b!1470784 d!155263))

(declare-fun b!1471126 () Bool)

(declare-fun e!825756 () SeekEntryResult!12068)

(assert (=> b!1471126 (= e!825756 Undefined!12068)))

(declare-fun b!1471127 () Bool)

(declare-fun e!825755 () SeekEntryResult!12068)

(declare-fun lt!642983 () SeekEntryResult!12068)

(assert (=> b!1471127 (= e!825755 (Found!12068 (index!50666 lt!642983)))))

(declare-fun b!1471128 () Bool)

(assert (=> b!1471128 (= e!825756 e!825755)))

(declare-fun lt!642982 () (_ BitVec 64))

(assert (=> b!1471128 (= lt!642982 (select (arr!47803 lt!642857) (index!50666 lt!642983)))))

(declare-fun c!135511 () Bool)

(assert (=> b!1471128 (= c!135511 (= lt!642982 lt!642859))))

(declare-fun b!1471129 () Bool)

(declare-fun c!135509 () Bool)

(assert (=> b!1471129 (= c!135509 (= lt!642982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825754 () SeekEntryResult!12068)

(assert (=> b!1471129 (= e!825755 e!825754)))

(declare-fun d!155281 () Bool)

(declare-fun lt!642981 () SeekEntryResult!12068)

(assert (=> d!155281 (and (or ((_ is Undefined!12068) lt!642981) (not ((_ is Found!12068) lt!642981)) (and (bvsge (index!50665 lt!642981) #b00000000000000000000000000000000) (bvslt (index!50665 lt!642981) (size!48355 lt!642857)))) (or ((_ is Undefined!12068) lt!642981) ((_ is Found!12068) lt!642981) (not ((_ is MissingZero!12068) lt!642981)) (and (bvsge (index!50664 lt!642981) #b00000000000000000000000000000000) (bvslt (index!50664 lt!642981) (size!48355 lt!642857)))) (or ((_ is Undefined!12068) lt!642981) ((_ is Found!12068) lt!642981) ((_ is MissingZero!12068) lt!642981) (not ((_ is MissingVacant!12068) lt!642981)) (and (bvsge (index!50667 lt!642981) #b00000000000000000000000000000000) (bvslt (index!50667 lt!642981) (size!48355 lt!642857)))) (or ((_ is Undefined!12068) lt!642981) (ite ((_ is Found!12068) lt!642981) (= (select (arr!47803 lt!642857) (index!50665 lt!642981)) lt!642859) (ite ((_ is MissingZero!12068) lt!642981) (= (select (arr!47803 lt!642857) (index!50664 lt!642981)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12068) lt!642981) (= (select (arr!47803 lt!642857) (index!50667 lt!642981)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155281 (= lt!642981 e!825756)))

(declare-fun c!135510 () Bool)

(assert (=> d!155281 (= c!135510 (and ((_ is Intermediate!12068) lt!642983) (undefined!12880 lt!642983)))))

(assert (=> d!155281 (= lt!642983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642859 mask!2687) lt!642859 lt!642857 mask!2687))))

(assert (=> d!155281 (validMask!0 mask!2687)))

(assert (=> d!155281 (= (seekEntryOrOpen!0 lt!642859 lt!642857 mask!2687) lt!642981)))

(declare-fun b!1471130 () Bool)

(assert (=> b!1471130 (= e!825754 (seekKeyOrZeroReturnVacant!0 (x!132241 lt!642983) (index!50666 lt!642983) (index!50666 lt!642983) lt!642859 lt!642857 mask!2687))))

(declare-fun b!1471131 () Bool)

(assert (=> b!1471131 (= e!825754 (MissingZero!12068 (index!50666 lt!642983)))))

(assert (= (and d!155281 c!135510) b!1471126))

(assert (= (and d!155281 (not c!135510)) b!1471128))

(assert (= (and b!1471128 c!135511) b!1471127))

(assert (= (and b!1471128 (not c!135511)) b!1471129))

(assert (= (and b!1471129 c!135509) b!1471131))

(assert (= (and b!1471129 (not c!135509)) b!1471130))

(declare-fun m!1357497 () Bool)

(assert (=> b!1471128 m!1357497))

(assert (=> d!155281 m!1357285))

(declare-fun m!1357499 () Bool)

(assert (=> d!155281 m!1357499))

(declare-fun m!1357501 () Bool)

(assert (=> d!155281 m!1357501))

(assert (=> d!155281 m!1357275))

(declare-fun m!1357503 () Bool)

(assert (=> d!155281 m!1357503))

(assert (=> d!155281 m!1357275))

(assert (=> d!155281 m!1357277))

(declare-fun m!1357505 () Bool)

(assert (=> b!1471130 m!1357505))

(assert (=> b!1470784 d!155281))

(declare-fun b!1471132 () Bool)

(declare-fun e!825759 () SeekEntryResult!12068)

(assert (=> b!1471132 (= e!825759 Undefined!12068)))

(declare-fun b!1471133 () Bool)

(declare-fun e!825758 () SeekEntryResult!12068)

(declare-fun lt!642986 () SeekEntryResult!12068)

(assert (=> b!1471133 (= e!825758 (Found!12068 (index!50666 lt!642986)))))

(declare-fun b!1471134 () Bool)

(assert (=> b!1471134 (= e!825759 e!825758)))

(declare-fun lt!642985 () (_ BitVec 64))

(assert (=> b!1471134 (= lt!642985 (select (arr!47803 a!2862) (index!50666 lt!642986)))))

(declare-fun c!135514 () Bool)

(assert (=> b!1471134 (= c!135514 (= lt!642985 (select (arr!47803 a!2862) j!93)))))

(declare-fun b!1471135 () Bool)

(declare-fun c!135512 () Bool)

(assert (=> b!1471135 (= c!135512 (= lt!642985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825757 () SeekEntryResult!12068)

(assert (=> b!1471135 (= e!825758 e!825757)))

(declare-fun d!155293 () Bool)

(declare-fun lt!642984 () SeekEntryResult!12068)

(assert (=> d!155293 (and (or ((_ is Undefined!12068) lt!642984) (not ((_ is Found!12068) lt!642984)) (and (bvsge (index!50665 lt!642984) #b00000000000000000000000000000000) (bvslt (index!50665 lt!642984) (size!48355 a!2862)))) (or ((_ is Undefined!12068) lt!642984) ((_ is Found!12068) lt!642984) (not ((_ is MissingZero!12068) lt!642984)) (and (bvsge (index!50664 lt!642984) #b00000000000000000000000000000000) (bvslt (index!50664 lt!642984) (size!48355 a!2862)))) (or ((_ is Undefined!12068) lt!642984) ((_ is Found!12068) lt!642984) ((_ is MissingZero!12068) lt!642984) (not ((_ is MissingVacant!12068) lt!642984)) (and (bvsge (index!50667 lt!642984) #b00000000000000000000000000000000) (bvslt (index!50667 lt!642984) (size!48355 a!2862)))) (or ((_ is Undefined!12068) lt!642984) (ite ((_ is Found!12068) lt!642984) (= (select (arr!47803 a!2862) (index!50665 lt!642984)) (select (arr!47803 a!2862) j!93)) (ite ((_ is MissingZero!12068) lt!642984) (= (select (arr!47803 a!2862) (index!50664 lt!642984)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12068) lt!642984) (= (select (arr!47803 a!2862) (index!50667 lt!642984)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155293 (= lt!642984 e!825759)))

(declare-fun c!135513 () Bool)

(assert (=> d!155293 (= c!135513 (and ((_ is Intermediate!12068) lt!642986) (undefined!12880 lt!642986)))))

(assert (=> d!155293 (= lt!642986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155293 (validMask!0 mask!2687)))

(assert (=> d!155293 (= (seekEntryOrOpen!0 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642984)))

(declare-fun b!1471136 () Bool)

(assert (=> b!1471136 (= e!825757 (seekKeyOrZeroReturnVacant!0 (x!132241 lt!642986) (index!50666 lt!642986) (index!50666 lt!642986) (select (arr!47803 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471137 () Bool)

(assert (=> b!1471137 (= e!825757 (MissingZero!12068 (index!50666 lt!642986)))))

(assert (= (and d!155293 c!135513) b!1471132))

(assert (= (and d!155293 (not c!135513)) b!1471134))

(assert (= (and b!1471134 c!135514) b!1471133))

(assert (= (and b!1471134 (not c!135514)) b!1471135))

(assert (= (and b!1471135 c!135512) b!1471137))

(assert (= (and b!1471135 (not c!135512)) b!1471136))

(declare-fun m!1357507 () Bool)

(assert (=> b!1471134 m!1357507))

(assert (=> d!155293 m!1357285))

(declare-fun m!1357509 () Bool)

(assert (=> d!155293 m!1357509))

(declare-fun m!1357511 () Bool)

(assert (=> d!155293 m!1357511))

(assert (=> d!155293 m!1357251))

(assert (=> d!155293 m!1357271))

(declare-fun m!1357513 () Bool)

(assert (=> d!155293 m!1357513))

(assert (=> d!155293 m!1357271))

(assert (=> d!155293 m!1357251))

(assert (=> d!155293 m!1357273))

(assert (=> b!1471136 m!1357251))

(declare-fun m!1357515 () Bool)

(assert (=> b!1471136 m!1357515))

(assert (=> b!1470786 d!155293))

(declare-fun d!155295 () Bool)

(assert (=> d!155295 (= (validKeyInArray!0 (select (arr!47803 a!2862) j!93)) (and (not (= (select (arr!47803 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47803 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470788 d!155295))

(declare-fun b!1471138 () Bool)

(declare-fun lt!642987 () SeekEntryResult!12068)

(assert (=> b!1471138 (and (bvsge (index!50666 lt!642987) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642987) (size!48355 a!2862)))))

(declare-fun res!999139 () Bool)

(assert (=> b!1471138 (= res!999139 (= (select (arr!47803 a!2862) (index!50666 lt!642987)) (select (arr!47803 a!2862) j!93)))))

(declare-fun e!825761 () Bool)

(assert (=> b!1471138 (=> res!999139 e!825761)))

(declare-fun e!825762 () Bool)

(assert (=> b!1471138 (= e!825762 e!825761)))

(declare-fun b!1471139 () Bool)

(declare-fun e!825764 () Bool)

(assert (=> b!1471139 (= e!825764 (bvsge (x!132241 lt!642987) #b01111111111111111111111111111110))))

(declare-fun b!1471140 () Bool)

(assert (=> b!1471140 (and (bvsge (index!50666 lt!642987) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642987) (size!48355 a!2862)))))

(assert (=> b!1471140 (= e!825761 (= (select (arr!47803 a!2862) (index!50666 lt!642987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471141 () Bool)

(declare-fun e!825760 () SeekEntryResult!12068)

(declare-fun e!825763 () SeekEntryResult!12068)

(assert (=> b!1471141 (= e!825760 e!825763)))

(declare-fun c!135515 () Bool)

(declare-fun lt!642988 () (_ BitVec 64))

(assert (=> b!1471141 (= c!135515 (or (= lt!642988 (select (arr!47803 a!2862) j!93)) (= (bvadd lt!642988 lt!642988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471142 () Bool)

(assert (=> b!1471142 (= e!825763 (Intermediate!12068 false index!646 x!665))))

(declare-fun b!1471144 () Bool)

(assert (=> b!1471144 (= e!825760 (Intermediate!12068 true index!646 x!665))))

(declare-fun b!1471145 () Bool)

(assert (=> b!1471145 (= e!825763 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471146 () Bool)

(assert (=> b!1471146 (and (bvsge (index!50666 lt!642987) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642987) (size!48355 a!2862)))))

(declare-fun res!999140 () Bool)

(assert (=> b!1471146 (= res!999140 (= (select (arr!47803 a!2862) (index!50666 lt!642987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471146 (=> res!999140 e!825761)))

(declare-fun b!1471143 () Bool)

(assert (=> b!1471143 (= e!825764 e!825762)))

(declare-fun res!999141 () Bool)

(assert (=> b!1471143 (= res!999141 (and ((_ is Intermediate!12068) lt!642987) (not (undefined!12880 lt!642987)) (bvslt (x!132241 lt!642987) #b01111111111111111111111111111110) (bvsge (x!132241 lt!642987) #b00000000000000000000000000000000) (bvsge (x!132241 lt!642987) x!665)))))

(assert (=> b!1471143 (=> (not res!999141) (not e!825762))))

(declare-fun d!155297 () Bool)

(assert (=> d!155297 e!825764))

(declare-fun c!135517 () Bool)

(assert (=> d!155297 (= c!135517 (and ((_ is Intermediate!12068) lt!642987) (undefined!12880 lt!642987)))))

(assert (=> d!155297 (= lt!642987 e!825760)))

(declare-fun c!135516 () Bool)

(assert (=> d!155297 (= c!135516 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155297 (= lt!642988 (select (arr!47803 a!2862) index!646))))

(assert (=> d!155297 (validMask!0 mask!2687)))

(assert (=> d!155297 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642987)))

(assert (= (and d!155297 c!135516) b!1471144))

(assert (= (and d!155297 (not c!135516)) b!1471141))

(assert (= (and b!1471141 c!135515) b!1471142))

(assert (= (and b!1471141 (not c!135515)) b!1471145))

(assert (= (and d!155297 c!135517) b!1471139))

(assert (= (and d!155297 (not c!135517)) b!1471143))

(assert (= (and b!1471143 res!999141) b!1471138))

(assert (= (and b!1471138 (not res!999139)) b!1471146))

(assert (= (and b!1471146 (not res!999140)) b!1471140))

(declare-fun m!1357517 () Bool)

(assert (=> b!1471138 m!1357517))

(assert (=> b!1471145 m!1357399))

(assert (=> b!1471145 m!1357399))

(assert (=> b!1471145 m!1357251))

(declare-fun m!1357519 () Bool)

(assert (=> b!1471145 m!1357519))

(declare-fun m!1357521 () Bool)

(assert (=> d!155297 m!1357521))

(assert (=> d!155297 m!1357285))

(assert (=> b!1471146 m!1357517))

(assert (=> b!1471140 m!1357517))

(assert (=> b!1470787 d!155297))

(declare-fun d!155299 () Bool)

(assert (=> d!155299 (= (validKeyInArray!0 (select (arr!47803 a!2862) i!1006)) (and (not (= (select (arr!47803 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47803 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470789 d!155299))

(declare-fun b!1471147 () Bool)

(declare-fun lt!642989 () SeekEntryResult!12068)

(assert (=> b!1471147 (and (bvsge (index!50666 lt!642989) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642989) (size!48355 lt!642857)))))

(declare-fun res!999142 () Bool)

(assert (=> b!1471147 (= res!999142 (= (select (arr!47803 lt!642857) (index!50666 lt!642989)) lt!642859))))

(declare-fun e!825766 () Bool)

(assert (=> b!1471147 (=> res!999142 e!825766)))

(declare-fun e!825767 () Bool)

(assert (=> b!1471147 (= e!825767 e!825766)))

(declare-fun b!1471148 () Bool)

(declare-fun e!825769 () Bool)

(assert (=> b!1471148 (= e!825769 (bvsge (x!132241 lt!642989) #b01111111111111111111111111111110))))

(declare-fun b!1471149 () Bool)

(assert (=> b!1471149 (and (bvsge (index!50666 lt!642989) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642989) (size!48355 lt!642857)))))

(assert (=> b!1471149 (= e!825766 (= (select (arr!47803 lt!642857) (index!50666 lt!642989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471150 () Bool)

(declare-fun e!825765 () SeekEntryResult!12068)

(declare-fun e!825768 () SeekEntryResult!12068)

(assert (=> b!1471150 (= e!825765 e!825768)))

(declare-fun c!135518 () Bool)

(declare-fun lt!642990 () (_ BitVec 64))

(assert (=> b!1471150 (= c!135518 (or (= lt!642990 lt!642859) (= (bvadd lt!642990 lt!642990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471151 () Bool)

(assert (=> b!1471151 (= e!825768 (Intermediate!12068 false (toIndex!0 lt!642859 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471153 () Bool)

(assert (=> b!1471153 (= e!825765 (Intermediate!12068 true (toIndex!0 lt!642859 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471154 () Bool)

(assert (=> b!1471154 (= e!825768 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!642859 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!642859 lt!642857 mask!2687))))

(declare-fun b!1471155 () Bool)

(assert (=> b!1471155 (and (bvsge (index!50666 lt!642989) #b00000000000000000000000000000000) (bvslt (index!50666 lt!642989) (size!48355 lt!642857)))))

(declare-fun res!999143 () Bool)

(assert (=> b!1471155 (= res!999143 (= (select (arr!47803 lt!642857) (index!50666 lt!642989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471155 (=> res!999143 e!825766)))

(declare-fun b!1471152 () Bool)

(assert (=> b!1471152 (= e!825769 e!825767)))

(declare-fun res!999144 () Bool)

(assert (=> b!1471152 (= res!999144 (and ((_ is Intermediate!12068) lt!642989) (not (undefined!12880 lt!642989)) (bvslt (x!132241 lt!642989) #b01111111111111111111111111111110) (bvsge (x!132241 lt!642989) #b00000000000000000000000000000000) (bvsge (x!132241 lt!642989) #b00000000000000000000000000000000)))))

(assert (=> b!1471152 (=> (not res!999144) (not e!825767))))

(declare-fun d!155301 () Bool)

(assert (=> d!155301 e!825769))

(declare-fun c!135520 () Bool)

(assert (=> d!155301 (= c!135520 (and ((_ is Intermediate!12068) lt!642989) (undefined!12880 lt!642989)))))

(assert (=> d!155301 (= lt!642989 e!825765)))

(declare-fun c!135519 () Bool)

(assert (=> d!155301 (= c!135519 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155301 (= lt!642990 (select (arr!47803 lt!642857) (toIndex!0 lt!642859 mask!2687)))))

(assert (=> d!155301 (validMask!0 mask!2687)))

(assert (=> d!155301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642859 mask!2687) lt!642859 lt!642857 mask!2687) lt!642989)))

(assert (= (and d!155301 c!135519) b!1471153))

(assert (= (and d!155301 (not c!135519)) b!1471150))

(assert (= (and b!1471150 c!135518) b!1471151))

(assert (= (and b!1471150 (not c!135518)) b!1471154))

(assert (= (and d!155301 c!135520) b!1471148))

(assert (= (and d!155301 (not c!135520)) b!1471152))

(assert (= (and b!1471152 res!999144) b!1471147))

(assert (= (and b!1471147 (not res!999142)) b!1471155))

(assert (= (and b!1471155 (not res!999143)) b!1471149))

(declare-fun m!1357523 () Bool)

(assert (=> b!1471147 m!1357523))

(assert (=> b!1471154 m!1357275))

(declare-fun m!1357525 () Bool)

(assert (=> b!1471154 m!1357525))

(assert (=> b!1471154 m!1357525))

(declare-fun m!1357527 () Bool)

(assert (=> b!1471154 m!1357527))

(assert (=> d!155301 m!1357275))

(declare-fun m!1357529 () Bool)

(assert (=> d!155301 m!1357529))

(assert (=> d!155301 m!1357285))

(assert (=> b!1471155 m!1357523))

(assert (=> b!1471149 m!1357523))

(assert (=> b!1470780 d!155301))

(declare-fun d!155303 () Bool)

(declare-fun lt!642992 () (_ BitVec 32))

(declare-fun lt!642991 () (_ BitVec 32))

(assert (=> d!155303 (= lt!642992 (bvmul (bvxor lt!642991 (bvlshr lt!642991 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155303 (= lt!642991 ((_ extract 31 0) (bvand (bvxor lt!642859 (bvlshr lt!642859 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155303 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999089 (let ((h!35734 ((_ extract 31 0) (bvand (bvxor lt!642859 (bvlshr lt!642859 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132247 (bvmul (bvxor h!35734 (bvlshr h!35734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132247 (bvlshr x!132247 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999089 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999089 #b00000000000000000000000000000000))))))

(assert (=> d!155303 (= (toIndex!0 lt!642859 mask!2687) (bvand (bvxor lt!642992 (bvlshr lt!642992 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470780 d!155303))

(declare-fun b!1471157 () Bool)

(declare-fun e!825772 () Bool)

(declare-fun e!825770 () Bool)

(assert (=> b!1471157 (= e!825772 e!825770)))

(declare-fun c!135521 () Bool)

(assert (=> b!1471157 (= c!135521 (validKeyInArray!0 (select (arr!47803 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67704 () Bool)

(declare-fun call!67707 () Bool)

(assert (=> bm!67704 (= call!67707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1471158 () Bool)

(assert (=> b!1471158 (= e!825770 call!67707)))

(declare-fun b!1471159 () Bool)

(declare-fun e!825771 () Bool)

(assert (=> b!1471159 (= e!825770 e!825771)))

(declare-fun lt!642993 () (_ BitVec 64))

(assert (=> b!1471159 (= lt!642993 (select (arr!47803 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!642994 () Unit!49317)

(assert (=> b!1471159 (= lt!642994 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642993 #b00000000000000000000000000000000))))

(assert (=> b!1471159 (arrayContainsKey!0 a!2862 lt!642993 #b00000000000000000000000000000000)))

(declare-fun lt!642995 () Unit!49317)

(assert (=> b!1471159 (= lt!642995 lt!642994)))

(declare-fun res!999145 () Bool)

(assert (=> b!1471159 (= res!999145 (= (seekEntryOrOpen!0 (select (arr!47803 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12068 #b00000000000000000000000000000000)))))

(assert (=> b!1471159 (=> (not res!999145) (not e!825771))))

(declare-fun d!155305 () Bool)

(declare-fun res!999146 () Bool)

(assert (=> d!155305 (=> res!999146 e!825772)))

(assert (=> d!155305 (= res!999146 (bvsge #b00000000000000000000000000000000 (size!48355 a!2862)))))

(assert (=> d!155305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825772)))

(declare-fun b!1471156 () Bool)

(assert (=> b!1471156 (= e!825771 call!67707)))

(assert (= (and d!155305 (not res!999146)) b!1471157))

(assert (= (and b!1471157 c!135521) b!1471159))

(assert (= (and b!1471157 (not c!135521)) b!1471158))

(assert (= (and b!1471159 res!999145) b!1471156))

(assert (= (or b!1471156 b!1471158) bm!67704))

(assert (=> b!1471157 m!1357405))

(assert (=> b!1471157 m!1357405))

(assert (=> b!1471157 m!1357411))

(declare-fun m!1357531 () Bool)

(assert (=> bm!67704 m!1357531))

(assert (=> b!1471159 m!1357405))

(declare-fun m!1357533 () Bool)

(assert (=> b!1471159 m!1357533))

(declare-fun m!1357535 () Bool)

(assert (=> b!1471159 m!1357535))

(assert (=> b!1471159 m!1357405))

(declare-fun m!1357537 () Bool)

(assert (=> b!1471159 m!1357537))

(assert (=> b!1470790 d!155305))

(check-sat (not b!1470941) (not b!1471157) (not bm!67688) (not d!155257) (not d!155281) (not b!1471130) (not d!155301) (not b!1470958) (not b!1471159) (not b!1471145) (not b!1471154) (not b!1470900) (not b!1471136) (not b!1470926) (not d!155297) (not b!1470898) (not d!155243) (not d!155293) (not b!1470939) (not bm!67691) (not b!1470942) (not d!155263) (not bm!67704) (not b!1471073) (not d!155241))
(check-sat)
