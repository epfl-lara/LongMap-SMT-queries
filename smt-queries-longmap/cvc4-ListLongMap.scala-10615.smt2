; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124832 () Bool)

(assert start!124832)

(declare-fun b!1448940 () Bool)

(declare-fun res!980438 () Bool)

(declare-fun e!815983 () Bool)

(assert (=> b!1448940 (=> (not res!980438) (not e!815983))))

(declare-datatypes ((array!98280 0))(
  ( (array!98281 (arr!47428 (Array (_ BitVec 32) (_ BitVec 64))) (size!47978 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98280)

(declare-datatypes ((List!33929 0))(
  ( (Nil!33926) (Cons!33925 (h!35275 (_ BitVec 64)) (t!48623 List!33929)) )
))
(declare-fun arrayNoDuplicates!0 (array!98280 (_ BitVec 32) List!33929) Bool)

(assert (=> b!1448940 (= res!980438 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33926))))

(declare-fun b!1448941 () Bool)

(declare-fun e!815981 () Bool)

(assert (=> b!1448941 (= e!815981 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11680 0))(
  ( (MissingZero!11680 (index!49112 (_ BitVec 32))) (Found!11680 (index!49113 (_ BitVec 32))) (Intermediate!11680 (undefined!12492 Bool) (index!49114 (_ BitVec 32)) (x!130777 (_ BitVec 32))) (Undefined!11680) (MissingVacant!11680 (index!49115 (_ BitVec 32))) )
))
(declare-fun lt!635720 () SeekEntryResult!11680)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98280 (_ BitVec 32)) SeekEntryResult!11680)

(assert (=> b!1448941 (= lt!635720 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47428 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448942 () Bool)

(declare-fun e!815982 () Bool)

(assert (=> b!1448942 (= e!815982 (not e!815981))))

(declare-fun res!980445 () Bool)

(assert (=> b!1448942 (=> res!980445 e!815981)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448942 (= res!980445 (or (and (= (select (arr!47428 a!2862) index!646) (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47428 a!2862) index!646) (select (arr!47428 a!2862) j!93))) (not (= (select (arr!47428 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815975 () Bool)

(assert (=> b!1448942 e!815975))

(declare-fun res!980441 () Bool)

(assert (=> b!1448942 (=> (not res!980441) (not e!815975))))

(declare-fun lt!635715 () SeekEntryResult!11680)

(assert (=> b!1448942 (= res!980441 (and (= lt!635715 (Found!11680 j!93)) (or (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) (select (arr!47428 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98280 (_ BitVec 32)) SeekEntryResult!11680)

(assert (=> b!1448942 (= lt!635715 (seekEntryOrOpen!0 (select (arr!47428 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98280 (_ BitVec 32)) Bool)

(assert (=> b!1448942 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48856 0))(
  ( (Unit!48857) )
))
(declare-fun lt!635718 () Unit!48856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48856)

(assert (=> b!1448942 (= lt!635718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!980433 () Bool)

(assert (=> start!124832 (=> (not res!980433) (not e!815983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124832 (= res!980433 (validMask!0 mask!2687))))

(assert (=> start!124832 e!815983))

(assert (=> start!124832 true))

(declare-fun array_inv!36456 (array!98280) Bool)

(assert (=> start!124832 (array_inv!36456 a!2862)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448943 () Bool)

(declare-fun e!815976 () Bool)

(assert (=> b!1448943 (= e!815976 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448944 () Bool)

(declare-fun e!815978 () Bool)

(assert (=> b!1448944 (= e!815978 e!815976)))

(declare-fun res!980442 () Bool)

(assert (=> b!1448944 (=> (not res!980442) (not e!815976))))

(assert (=> b!1448944 (= res!980442 (= lt!635715 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47428 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448945 () Bool)

(declare-fun e!815977 () Bool)

(assert (=> b!1448945 (= e!815983 e!815977)))

(declare-fun res!980448 () Bool)

(assert (=> b!1448945 (=> (not res!980448) (not e!815977))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448945 (= res!980448 (= (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635716 () array!98280)

(assert (=> b!1448945 (= lt!635716 (array!98281 (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47978 a!2862)))))

(declare-fun b!1448946 () Bool)

(declare-fun res!980443 () Bool)

(assert (=> b!1448946 (=> (not res!980443) (not e!815983))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448946 (= res!980443 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47978 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47978 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47978 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!635719 () (_ BitVec 64))

(declare-fun b!1448947 () Bool)

(declare-fun lt!635721 () SeekEntryResult!11680)

(declare-fun e!815980 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98280 (_ BitVec 32)) SeekEntryResult!11680)

(assert (=> b!1448947 (= e!815980 (= lt!635721 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635719 lt!635716 mask!2687)))))

(declare-fun b!1448948 () Bool)

(declare-fun e!815984 () Bool)

(assert (=> b!1448948 (= e!815977 e!815984)))

(declare-fun res!980436 () Bool)

(assert (=> b!1448948 (=> (not res!980436) (not e!815984))))

(declare-fun lt!635717 () SeekEntryResult!11680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448948 (= res!980436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47428 a!2862) j!93) mask!2687) (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!635717))))

(assert (=> b!1448948 (= lt!635717 (Intermediate!11680 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448949 () Bool)

(declare-fun res!980439 () Bool)

(assert (=> b!1448949 (=> (not res!980439) (not e!815984))))

(assert (=> b!1448949 (= res!980439 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!635717))))

(declare-fun b!1448950 () Bool)

(assert (=> b!1448950 (= e!815975 e!815978)))

(declare-fun res!980434 () Bool)

(assert (=> b!1448950 (=> res!980434 e!815978)))

(assert (=> b!1448950 (= res!980434 (or (and (= (select (arr!47428 a!2862) index!646) (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47428 a!2862) index!646) (select (arr!47428 a!2862) j!93))) (not (= (select (arr!47428 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448951 () Bool)

(declare-fun res!980435 () Bool)

(assert (=> b!1448951 (=> (not res!980435) (not e!815983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448951 (= res!980435 (validKeyInArray!0 (select (arr!47428 a!2862) i!1006)))))

(declare-fun b!1448952 () Bool)

(declare-fun res!980437 () Bool)

(assert (=> b!1448952 (=> (not res!980437) (not e!815983))))

(assert (=> b!1448952 (= res!980437 (validKeyInArray!0 (select (arr!47428 a!2862) j!93)))))

(declare-fun b!1448953 () Bool)

(assert (=> b!1448953 (= e!815984 e!815982)))

(declare-fun res!980447 () Bool)

(assert (=> b!1448953 (=> (not res!980447) (not e!815982))))

(assert (=> b!1448953 (= res!980447 (= lt!635721 (Intermediate!11680 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448953 (= lt!635721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635719 mask!2687) lt!635719 lt!635716 mask!2687))))

(assert (=> b!1448953 (= lt!635719 (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448954 () Bool)

(declare-fun res!980446 () Bool)

(assert (=> b!1448954 (=> (not res!980446) (not e!815983))))

(assert (=> b!1448954 (= res!980446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448955 () Bool)

(declare-fun res!980444 () Bool)

(assert (=> b!1448955 (=> (not res!980444) (not e!815982))))

(assert (=> b!1448955 (= res!980444 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448956 () Bool)

(declare-fun res!980440 () Bool)

(assert (=> b!1448956 (=> (not res!980440) (not e!815983))))

(assert (=> b!1448956 (= res!980440 (and (= (size!47978 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47978 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47978 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448957 () Bool)

(declare-fun res!980449 () Bool)

(assert (=> b!1448957 (=> (not res!980449) (not e!815982))))

(assert (=> b!1448957 (= res!980449 e!815980)))

(declare-fun c!133764 () Bool)

(assert (=> b!1448957 (= c!133764 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448958 () Bool)

(assert (=> b!1448958 (= e!815980 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635719 lt!635716 mask!2687) (seekEntryOrOpen!0 lt!635719 lt!635716 mask!2687)))))

(assert (= (and start!124832 res!980433) b!1448956))

(assert (= (and b!1448956 res!980440) b!1448951))

(assert (= (and b!1448951 res!980435) b!1448952))

(assert (= (and b!1448952 res!980437) b!1448954))

(assert (= (and b!1448954 res!980446) b!1448940))

(assert (= (and b!1448940 res!980438) b!1448946))

(assert (= (and b!1448946 res!980443) b!1448945))

(assert (= (and b!1448945 res!980448) b!1448948))

(assert (= (and b!1448948 res!980436) b!1448949))

(assert (= (and b!1448949 res!980439) b!1448953))

(assert (= (and b!1448953 res!980447) b!1448957))

(assert (= (and b!1448957 c!133764) b!1448947))

(assert (= (and b!1448957 (not c!133764)) b!1448958))

(assert (= (and b!1448957 res!980449) b!1448955))

(assert (= (and b!1448955 res!980444) b!1448942))

(assert (= (and b!1448942 res!980441) b!1448950))

(assert (= (and b!1448950 (not res!980434)) b!1448944))

(assert (= (and b!1448944 res!980442) b!1448943))

(assert (= (and b!1448942 (not res!980445)) b!1448941))

(declare-fun m!1337677 () Bool)

(assert (=> b!1448942 m!1337677))

(declare-fun m!1337679 () Bool)

(assert (=> b!1448942 m!1337679))

(declare-fun m!1337681 () Bool)

(assert (=> b!1448942 m!1337681))

(declare-fun m!1337683 () Bool)

(assert (=> b!1448942 m!1337683))

(declare-fun m!1337685 () Bool)

(assert (=> b!1448942 m!1337685))

(declare-fun m!1337687 () Bool)

(assert (=> b!1448942 m!1337687))

(declare-fun m!1337689 () Bool)

(assert (=> b!1448942 m!1337689))

(declare-fun m!1337691 () Bool)

(assert (=> b!1448942 m!1337691))

(assert (=> b!1448942 m!1337687))

(assert (=> b!1448952 m!1337687))

(assert (=> b!1448952 m!1337687))

(declare-fun m!1337693 () Bool)

(assert (=> b!1448952 m!1337693))

(assert (=> b!1448950 m!1337685))

(assert (=> b!1448950 m!1337679))

(assert (=> b!1448950 m!1337683))

(assert (=> b!1448950 m!1337687))

(declare-fun m!1337695 () Bool)

(assert (=> b!1448958 m!1337695))

(declare-fun m!1337697 () Bool)

(assert (=> b!1448958 m!1337697))

(declare-fun m!1337699 () Bool)

(assert (=> start!124832 m!1337699))

(declare-fun m!1337701 () Bool)

(assert (=> start!124832 m!1337701))

(assert (=> b!1448948 m!1337687))

(assert (=> b!1448948 m!1337687))

(declare-fun m!1337703 () Bool)

(assert (=> b!1448948 m!1337703))

(assert (=> b!1448948 m!1337703))

(assert (=> b!1448948 m!1337687))

(declare-fun m!1337705 () Bool)

(assert (=> b!1448948 m!1337705))

(declare-fun m!1337707 () Bool)

(assert (=> b!1448954 m!1337707))

(assert (=> b!1448944 m!1337687))

(assert (=> b!1448944 m!1337687))

(declare-fun m!1337709 () Bool)

(assert (=> b!1448944 m!1337709))

(assert (=> b!1448949 m!1337687))

(assert (=> b!1448949 m!1337687))

(declare-fun m!1337711 () Bool)

(assert (=> b!1448949 m!1337711))

(declare-fun m!1337713 () Bool)

(assert (=> b!1448951 m!1337713))

(assert (=> b!1448951 m!1337713))

(declare-fun m!1337715 () Bool)

(assert (=> b!1448951 m!1337715))

(assert (=> b!1448941 m!1337687))

(assert (=> b!1448941 m!1337687))

(declare-fun m!1337717 () Bool)

(assert (=> b!1448941 m!1337717))

(assert (=> b!1448945 m!1337679))

(declare-fun m!1337719 () Bool)

(assert (=> b!1448945 m!1337719))

(declare-fun m!1337721 () Bool)

(assert (=> b!1448940 m!1337721))

(declare-fun m!1337723 () Bool)

(assert (=> b!1448947 m!1337723))

(declare-fun m!1337725 () Bool)

(assert (=> b!1448953 m!1337725))

(assert (=> b!1448953 m!1337725))

(declare-fun m!1337727 () Bool)

(assert (=> b!1448953 m!1337727))

(assert (=> b!1448953 m!1337679))

(declare-fun m!1337729 () Bool)

(assert (=> b!1448953 m!1337729))

(push 1)

