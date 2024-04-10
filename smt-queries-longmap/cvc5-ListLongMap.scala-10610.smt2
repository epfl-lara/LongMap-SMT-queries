; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124798 () Bool)

(assert start!124798)

(declare-fun b!1447971 () Bool)

(declare-fun e!815473 () Bool)

(assert (=> b!1447971 (= e!815473 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11663 0))(
  ( (MissingZero!11663 (index!49044 (_ BitVec 32))) (Found!11663 (index!49045 (_ BitVec 32))) (Intermediate!11663 (undefined!12475 Bool) (index!49046 (_ BitVec 32)) (x!130720 (_ BitVec 32))) (Undefined!11663) (MissingVacant!11663 (index!49047 (_ BitVec 32))) )
))
(declare-fun lt!635364 () SeekEntryResult!11663)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98246 0))(
  ( (array!98247 (arr!47411 (Array (_ BitVec 32) (_ BitVec 64))) (size!47961 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98246)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98246 (_ BitVec 32)) SeekEntryResult!11663)

(assert (=> b!1447971 (= lt!635364 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47411 a!2862) j!93) a!2862 mask!2687))))

(declare-fun lt!635358 () (_ BitVec 64))

(declare-fun lt!635363 () SeekEntryResult!11663)

(declare-fun lt!635361 () array!98246)

(declare-fun e!815469 () Bool)

(declare-fun b!1447972 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98246 (_ BitVec 32)) SeekEntryResult!11663)

(assert (=> b!1447972 (= e!815469 (= lt!635363 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635358 lt!635361 mask!2687)))))

(declare-fun b!1447973 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98246 (_ BitVec 32)) SeekEntryResult!11663)

(assert (=> b!1447973 (= e!815469 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635358 lt!635361 mask!2687) (seekEntryOrOpen!0 lt!635358 lt!635361 mask!2687)))))

(declare-fun b!1447974 () Bool)

(declare-fun e!815467 () Bool)

(declare-fun e!815465 () Bool)

(assert (=> b!1447974 (= e!815467 e!815465)))

(declare-fun res!979573 () Bool)

(assert (=> b!1447974 (=> (not res!979573) (not e!815465))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447974 (= res!979573 (= (select (store (arr!47411 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447974 (= lt!635361 (array!98247 (store (arr!47411 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47961 a!2862)))))

(declare-fun b!1447975 () Bool)

(declare-fun res!979581 () Bool)

(assert (=> b!1447975 (=> (not res!979581) (not e!815467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98246 (_ BitVec 32)) Bool)

(assert (=> b!1447975 (= res!979581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447976 () Bool)

(declare-fun res!979567 () Bool)

(assert (=> b!1447976 (=> (not res!979567) (not e!815467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447976 (= res!979567 (validKeyInArray!0 (select (arr!47411 a!2862) i!1006)))))

(declare-fun b!1447977 () Bool)

(declare-fun e!815466 () Bool)

(assert (=> b!1447977 (= e!815466 (not e!815473))))

(declare-fun res!979579 () Bool)

(assert (=> b!1447977 (=> res!979579 e!815473)))

(assert (=> b!1447977 (= res!979579 (or (and (= (select (arr!47411 a!2862) index!646) (select (store (arr!47411 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47411 a!2862) index!646) (select (arr!47411 a!2862) j!93))) (not (= (select (arr!47411 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47411 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815472 () Bool)

(assert (=> b!1447977 e!815472))

(declare-fun res!979582 () Bool)

(assert (=> b!1447977 (=> (not res!979582) (not e!815472))))

(declare-fun lt!635359 () SeekEntryResult!11663)

(assert (=> b!1447977 (= res!979582 (and (= lt!635359 (Found!11663 j!93)) (or (= (select (arr!47411 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47411 a!2862) intermediateBeforeIndex!19) (select (arr!47411 a!2862) j!93)))))))

(assert (=> b!1447977 (= lt!635359 (seekEntryOrOpen!0 (select (arr!47411 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447977 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48822 0))(
  ( (Unit!48823) )
))
(declare-fun lt!635362 () Unit!48822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48822)

(assert (=> b!1447977 (= lt!635362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447978 () Bool)

(declare-fun e!815470 () Bool)

(assert (=> b!1447978 (= e!815465 e!815470)))

(declare-fun res!979575 () Bool)

(assert (=> b!1447978 (=> (not res!979575) (not e!815470))))

(declare-fun lt!635360 () SeekEntryResult!11663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447978 (= res!979575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47411 a!2862) j!93) mask!2687) (select (arr!47411 a!2862) j!93) a!2862 mask!2687) lt!635360))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447978 (= lt!635360 (Intermediate!11663 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447979 () Bool)

(declare-fun res!979568 () Bool)

(assert (=> b!1447979 (=> (not res!979568) (not e!815467))))

(assert (=> b!1447979 (= res!979568 (and (= (size!47961 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47961 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47961 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447980 () Bool)

(declare-fun e!815468 () Bool)

(assert (=> b!1447980 (= e!815472 e!815468)))

(declare-fun res!979569 () Bool)

(assert (=> b!1447980 (=> res!979569 e!815468)))

(assert (=> b!1447980 (= res!979569 (or (and (= (select (arr!47411 a!2862) index!646) (select (store (arr!47411 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47411 a!2862) index!646) (select (arr!47411 a!2862) j!93))) (not (= (select (arr!47411 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447982 () Bool)

(declare-fun res!979578 () Bool)

(assert (=> b!1447982 (=> (not res!979578) (not e!815467))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447982 (= res!979578 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47961 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47961 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47961 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447983 () Bool)

(declare-fun e!815474 () Bool)

(assert (=> b!1447983 (= e!815468 e!815474)))

(declare-fun res!979576 () Bool)

(assert (=> b!1447983 (=> (not res!979576) (not e!815474))))

(assert (=> b!1447983 (= res!979576 (= lt!635359 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47411 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447984 () Bool)

(assert (=> b!1447984 (= e!815470 e!815466)))

(declare-fun res!979580 () Bool)

(assert (=> b!1447984 (=> (not res!979580) (not e!815466))))

(assert (=> b!1447984 (= res!979580 (= lt!635363 (Intermediate!11663 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447984 (= lt!635363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635358 mask!2687) lt!635358 lt!635361 mask!2687))))

(assert (=> b!1447984 (= lt!635358 (select (store (arr!47411 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!979577 () Bool)

(assert (=> start!124798 (=> (not res!979577) (not e!815467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124798 (= res!979577 (validMask!0 mask!2687))))

(assert (=> start!124798 e!815467))

(assert (=> start!124798 true))

(declare-fun array_inv!36439 (array!98246) Bool)

(assert (=> start!124798 (array_inv!36439 a!2862)))

(declare-fun b!1447981 () Bool)

(declare-fun res!979570 () Bool)

(assert (=> b!1447981 (=> (not res!979570) (not e!815466))))

(assert (=> b!1447981 (= res!979570 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447985 () Bool)

(assert (=> b!1447985 (= e!815474 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447986 () Bool)

(declare-fun res!979572 () Bool)

(assert (=> b!1447986 (=> (not res!979572) (not e!815467))))

(declare-datatypes ((List!33912 0))(
  ( (Nil!33909) (Cons!33908 (h!35258 (_ BitVec 64)) (t!48606 List!33912)) )
))
(declare-fun arrayNoDuplicates!0 (array!98246 (_ BitVec 32) List!33912) Bool)

(assert (=> b!1447986 (= res!979572 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33909))))

(declare-fun b!1447987 () Bool)

(declare-fun res!979574 () Bool)

(assert (=> b!1447987 (=> (not res!979574) (not e!815470))))

(assert (=> b!1447987 (= res!979574 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47411 a!2862) j!93) a!2862 mask!2687) lt!635360))))

(declare-fun b!1447988 () Bool)

(declare-fun res!979571 () Bool)

(assert (=> b!1447988 (=> (not res!979571) (not e!815466))))

(assert (=> b!1447988 (= res!979571 e!815469)))

(declare-fun c!133713 () Bool)

(assert (=> b!1447988 (= c!133713 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447989 () Bool)

(declare-fun res!979566 () Bool)

(assert (=> b!1447989 (=> (not res!979566) (not e!815467))))

(assert (=> b!1447989 (= res!979566 (validKeyInArray!0 (select (arr!47411 a!2862) j!93)))))

(assert (= (and start!124798 res!979577) b!1447979))

(assert (= (and b!1447979 res!979568) b!1447976))

(assert (= (and b!1447976 res!979567) b!1447989))

(assert (= (and b!1447989 res!979566) b!1447975))

(assert (= (and b!1447975 res!979581) b!1447986))

(assert (= (and b!1447986 res!979572) b!1447982))

(assert (= (and b!1447982 res!979578) b!1447974))

(assert (= (and b!1447974 res!979573) b!1447978))

(assert (= (and b!1447978 res!979575) b!1447987))

(assert (= (and b!1447987 res!979574) b!1447984))

(assert (= (and b!1447984 res!979580) b!1447988))

(assert (= (and b!1447988 c!133713) b!1447972))

(assert (= (and b!1447988 (not c!133713)) b!1447973))

(assert (= (and b!1447988 res!979571) b!1447981))

(assert (= (and b!1447981 res!979570) b!1447977))

(assert (= (and b!1447977 res!979582) b!1447980))

(assert (= (and b!1447980 (not res!979569)) b!1447983))

(assert (= (and b!1447983 res!979576) b!1447985))

(assert (= (and b!1447977 (not res!979579)) b!1447971))

(declare-fun m!1336759 () Bool)

(assert (=> b!1447984 m!1336759))

(assert (=> b!1447984 m!1336759))

(declare-fun m!1336761 () Bool)

(assert (=> b!1447984 m!1336761))

(declare-fun m!1336763 () Bool)

(assert (=> b!1447984 m!1336763))

(declare-fun m!1336765 () Bool)

(assert (=> b!1447984 m!1336765))

(declare-fun m!1336767 () Bool)

(assert (=> b!1447977 m!1336767))

(assert (=> b!1447977 m!1336763))

(declare-fun m!1336769 () Bool)

(assert (=> b!1447977 m!1336769))

(declare-fun m!1336771 () Bool)

(assert (=> b!1447977 m!1336771))

(declare-fun m!1336773 () Bool)

(assert (=> b!1447977 m!1336773))

(declare-fun m!1336775 () Bool)

(assert (=> b!1447977 m!1336775))

(declare-fun m!1336777 () Bool)

(assert (=> b!1447977 m!1336777))

(declare-fun m!1336779 () Bool)

(assert (=> b!1447977 m!1336779))

(assert (=> b!1447977 m!1336775))

(declare-fun m!1336781 () Bool)

(assert (=> b!1447986 m!1336781))

(assert (=> b!1447983 m!1336775))

(assert (=> b!1447983 m!1336775))

(declare-fun m!1336783 () Bool)

(assert (=> b!1447983 m!1336783))

(declare-fun m!1336785 () Bool)

(assert (=> b!1447972 m!1336785))

(assert (=> b!1447980 m!1336773))

(assert (=> b!1447980 m!1336763))

(assert (=> b!1447980 m!1336771))

(assert (=> b!1447980 m!1336775))

(assert (=> b!1447978 m!1336775))

(assert (=> b!1447978 m!1336775))

(declare-fun m!1336787 () Bool)

(assert (=> b!1447978 m!1336787))

(assert (=> b!1447978 m!1336787))

(assert (=> b!1447978 m!1336775))

(declare-fun m!1336789 () Bool)

(assert (=> b!1447978 m!1336789))

(assert (=> b!1447974 m!1336763))

(declare-fun m!1336791 () Bool)

(assert (=> b!1447974 m!1336791))

(assert (=> b!1447989 m!1336775))

(assert (=> b!1447989 m!1336775))

(declare-fun m!1336793 () Bool)

(assert (=> b!1447989 m!1336793))

(declare-fun m!1336795 () Bool)

(assert (=> b!1447976 m!1336795))

(assert (=> b!1447976 m!1336795))

(declare-fun m!1336797 () Bool)

(assert (=> b!1447976 m!1336797))

(assert (=> b!1447971 m!1336775))

(assert (=> b!1447971 m!1336775))

(declare-fun m!1336799 () Bool)

(assert (=> b!1447971 m!1336799))

(declare-fun m!1336801 () Bool)

(assert (=> b!1447973 m!1336801))

(declare-fun m!1336803 () Bool)

(assert (=> b!1447973 m!1336803))

(declare-fun m!1336805 () Bool)

(assert (=> b!1447975 m!1336805))

(declare-fun m!1336807 () Bool)

(assert (=> start!124798 m!1336807))

(declare-fun m!1336809 () Bool)

(assert (=> start!124798 m!1336809))

(assert (=> b!1447987 m!1336775))

(assert (=> b!1447987 m!1336775))

(declare-fun m!1336811 () Bool)

(assert (=> b!1447987 m!1336811))

(push 1)

