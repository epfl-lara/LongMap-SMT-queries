; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125930 () Bool)

(assert start!125930)

(declare-fun b!1474764 () Bool)

(declare-fun e!827414 () Bool)

(declare-fun e!827412 () Bool)

(assert (=> b!1474764 (= e!827414 e!827412)))

(declare-fun res!1001939 () Bool)

(assert (=> b!1474764 (=> (not res!1001939) (not e!827412))))

(declare-datatypes ((SeekEntryResult!12127 0))(
  ( (MissingZero!12127 (index!50900 (_ BitVec 32))) (Found!12127 (index!50901 (_ BitVec 32))) (Intermediate!12127 (undefined!12939 Bool) (index!50902 (_ BitVec 32)) (x!132475 (_ BitVec 32))) (Undefined!12127) (MissingVacant!12127 (index!50903 (_ BitVec 32))) )
))
(declare-fun lt!644359 () SeekEntryResult!12127)

(declare-datatypes ((array!99207 0))(
  ( (array!99208 (arr!47887 (Array (_ BitVec 32) (_ BitVec 64))) (size!48437 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99207)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99207 (_ BitVec 32)) SeekEntryResult!12127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474764 (= res!1001939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!644359))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474764 (= lt!644359 (Intermediate!12127 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!827413 () Bool)

(declare-fun lt!644360 () SeekEntryResult!12127)

(declare-fun b!1474765 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99207 (_ BitVec 32)) SeekEntryResult!12127)

(assert (=> b!1474765 (= e!827413 (= lt!644360 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1474766 () Bool)

(declare-fun res!1001929 () Bool)

(declare-fun e!827411 () Bool)

(assert (=> b!1474766 (=> (not res!1001929) (not e!827411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474766 (= res!1001929 (validKeyInArray!0 (select (arr!47887 a!2862) j!93)))))

(declare-fun b!1474767 () Bool)

(assert (=> b!1474767 (= e!827411 e!827414)))

(declare-fun res!1001937 () Bool)

(assert (=> b!1474767 (=> (not res!1001937) (not e!827414))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474767 (= res!1001937 (= (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644356 () array!99207)

(assert (=> b!1474767 (= lt!644356 (array!99208 (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48437 a!2862)))))

(declare-fun b!1474768 () Bool)

(declare-fun e!827410 () Bool)

(assert (=> b!1474768 (= e!827410 (not e!827413))))

(declare-fun res!1001932 () Bool)

(assert (=> b!1474768 (=> res!1001932 e!827413)))

(assert (=> b!1474768 (= res!1001932 (or (and (= (select (arr!47887 a!2862) index!646) (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47887 a!2862) index!646) (select (arr!47887 a!2862) j!93))) (not (= (select (arr!47887 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474768 (and (= lt!644360 (Found!12127 j!93)) (or (= (select (arr!47887 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47887 a!2862) intermediateBeforeIndex!19) (select (arr!47887 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99207 (_ BitVec 32)) SeekEntryResult!12127)

(assert (=> b!1474768 (= lt!644360 (seekEntryOrOpen!0 (select (arr!47887 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99207 (_ BitVec 32)) Bool)

(assert (=> b!1474768 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49594 0))(
  ( (Unit!49595) )
))
(declare-fun lt!644357 () Unit!49594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49594)

(assert (=> b!1474768 (= lt!644357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474769 () Bool)

(declare-fun res!1001938 () Bool)

(assert (=> b!1474769 (=> (not res!1001938) (not e!827410))))

(declare-fun e!827409 () Bool)

(assert (=> b!1474769 (= res!1001938 e!827409)))

(declare-fun c!135933 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474769 (= c!135933 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1001931 () Bool)

(assert (=> start!125930 (=> (not res!1001931) (not e!827411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125930 (= res!1001931 (validMask!0 mask!2687))))

(assert (=> start!125930 e!827411))

(assert (=> start!125930 true))

(declare-fun array_inv!36915 (array!99207) Bool)

(assert (=> start!125930 (array_inv!36915 a!2862)))

(declare-fun b!1474770 () Bool)

(declare-fun res!1001930 () Bool)

(assert (=> b!1474770 (=> (not res!1001930) (not e!827411))))

(assert (=> b!1474770 (= res!1001930 (validKeyInArray!0 (select (arr!47887 a!2862) i!1006)))))

(declare-fun b!1474771 () Bool)

(declare-fun res!1001941 () Bool)

(assert (=> b!1474771 (=> (not res!1001941) (not e!827412))))

(assert (=> b!1474771 (= res!1001941 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!644359))))

(declare-fun lt!644358 () (_ BitVec 64))

(declare-fun b!1474772 () Bool)

(assert (=> b!1474772 (= e!827409 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644358 lt!644356 mask!2687) (seekEntryOrOpen!0 lt!644358 lt!644356 mask!2687)))))

(declare-fun b!1474773 () Bool)

(assert (=> b!1474773 (= e!827412 e!827410)))

(declare-fun res!1001928 () Bool)

(assert (=> b!1474773 (=> (not res!1001928) (not e!827410))))

(declare-fun lt!644361 () SeekEntryResult!12127)

(assert (=> b!1474773 (= res!1001928 (= lt!644361 (Intermediate!12127 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474773 (= lt!644361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644358 mask!2687) lt!644358 lt!644356 mask!2687))))

(assert (=> b!1474773 (= lt!644358 (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474774 () Bool)

(declare-fun res!1001935 () Bool)

(assert (=> b!1474774 (=> (not res!1001935) (not e!827411))))

(assert (=> b!1474774 (= res!1001935 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48437 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48437 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48437 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474775 () Bool)

(declare-fun res!1001934 () Bool)

(assert (=> b!1474775 (=> (not res!1001934) (not e!827411))))

(assert (=> b!1474775 (= res!1001934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474776 () Bool)

(declare-fun res!1001936 () Bool)

(assert (=> b!1474776 (=> (not res!1001936) (not e!827410))))

(assert (=> b!1474776 (= res!1001936 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474777 () Bool)

(declare-fun res!1001940 () Bool)

(assert (=> b!1474777 (=> (not res!1001940) (not e!827411))))

(declare-datatypes ((List!34388 0))(
  ( (Nil!34385) (Cons!34384 (h!35743 (_ BitVec 64)) (t!49082 List!34388)) )
))
(declare-fun arrayNoDuplicates!0 (array!99207 (_ BitVec 32) List!34388) Bool)

(assert (=> b!1474777 (= res!1001940 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34385))))

(declare-fun b!1474778 () Bool)

(assert (=> b!1474778 (= e!827409 (= lt!644361 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644358 lt!644356 mask!2687)))))

(declare-fun b!1474779 () Bool)

(declare-fun res!1001933 () Bool)

(assert (=> b!1474779 (=> (not res!1001933) (not e!827411))))

(assert (=> b!1474779 (= res!1001933 (and (= (size!48437 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48437 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48437 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125930 res!1001931) b!1474779))

(assert (= (and b!1474779 res!1001933) b!1474770))

(assert (= (and b!1474770 res!1001930) b!1474766))

(assert (= (and b!1474766 res!1001929) b!1474775))

(assert (= (and b!1474775 res!1001934) b!1474777))

(assert (= (and b!1474777 res!1001940) b!1474774))

(assert (= (and b!1474774 res!1001935) b!1474767))

(assert (= (and b!1474767 res!1001937) b!1474764))

(assert (= (and b!1474764 res!1001939) b!1474771))

(assert (= (and b!1474771 res!1001941) b!1474773))

(assert (= (and b!1474773 res!1001928) b!1474769))

(assert (= (and b!1474769 c!135933) b!1474778))

(assert (= (and b!1474769 (not c!135933)) b!1474772))

(assert (= (and b!1474769 res!1001938) b!1474776))

(assert (= (and b!1474776 res!1001936) b!1474768))

(assert (= (and b!1474768 (not res!1001932)) b!1474765))

(declare-fun m!1361199 () Bool)

(assert (=> start!125930 m!1361199))

(declare-fun m!1361201 () Bool)

(assert (=> start!125930 m!1361201))

(declare-fun m!1361203 () Bool)

(assert (=> b!1474770 m!1361203))

(assert (=> b!1474770 m!1361203))

(declare-fun m!1361205 () Bool)

(assert (=> b!1474770 m!1361205))

(declare-fun m!1361207 () Bool)

(assert (=> b!1474768 m!1361207))

(declare-fun m!1361209 () Bool)

(assert (=> b!1474768 m!1361209))

(declare-fun m!1361211 () Bool)

(assert (=> b!1474768 m!1361211))

(declare-fun m!1361213 () Bool)

(assert (=> b!1474768 m!1361213))

(declare-fun m!1361215 () Bool)

(assert (=> b!1474768 m!1361215))

(declare-fun m!1361217 () Bool)

(assert (=> b!1474768 m!1361217))

(declare-fun m!1361219 () Bool)

(assert (=> b!1474768 m!1361219))

(declare-fun m!1361221 () Bool)

(assert (=> b!1474768 m!1361221))

(assert (=> b!1474768 m!1361217))

(assert (=> b!1474766 m!1361217))

(assert (=> b!1474766 m!1361217))

(declare-fun m!1361223 () Bool)

(assert (=> b!1474766 m!1361223))

(declare-fun m!1361225 () Bool)

(assert (=> b!1474778 m!1361225))

(declare-fun m!1361227 () Bool)

(assert (=> b!1474775 m!1361227))

(assert (=> b!1474764 m!1361217))

(assert (=> b!1474764 m!1361217))

(declare-fun m!1361229 () Bool)

(assert (=> b!1474764 m!1361229))

(assert (=> b!1474764 m!1361229))

(assert (=> b!1474764 m!1361217))

(declare-fun m!1361231 () Bool)

(assert (=> b!1474764 m!1361231))

(assert (=> b!1474771 m!1361217))

(assert (=> b!1474771 m!1361217))

(declare-fun m!1361233 () Bool)

(assert (=> b!1474771 m!1361233))

(declare-fun m!1361235 () Bool)

(assert (=> b!1474772 m!1361235))

(declare-fun m!1361237 () Bool)

(assert (=> b!1474772 m!1361237))

(declare-fun m!1361239 () Bool)

(assert (=> b!1474773 m!1361239))

(assert (=> b!1474773 m!1361239))

(declare-fun m!1361241 () Bool)

(assert (=> b!1474773 m!1361241))

(assert (=> b!1474773 m!1361209))

(declare-fun m!1361243 () Bool)

(assert (=> b!1474773 m!1361243))

(declare-fun m!1361245 () Bool)

(assert (=> b!1474777 m!1361245))

(assert (=> b!1474767 m!1361209))

(declare-fun m!1361247 () Bool)

(assert (=> b!1474767 m!1361247))

(assert (=> b!1474765 m!1361217))

(assert (=> b!1474765 m!1361217))

(declare-fun m!1361249 () Bool)

(assert (=> b!1474765 m!1361249))

(push 1)

(assert (not b!1474775))

(assert (not b!1474773))

(assert (not b!1474771))

(assert (not b!1474770))

(assert (not b!1474778))

(assert (not b!1474764))

(assert (not b!1474766))

(assert (not start!125930))

(assert (not b!1474768))

(assert (not b!1474772))

(assert (not b!1474765))

(assert (not b!1474777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!827507 () SeekEntryResult!12127)

(declare-fun b!1474937 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474937 (= e!827507 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47887 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474938 () Bool)

(declare-fun e!827508 () SeekEntryResult!12127)

(assert (=> b!1474938 (= e!827508 e!827507)))

(declare-fun lt!644429 () (_ BitVec 64))

(declare-fun c!135993 () Bool)

(assert (=> b!1474938 (= c!135993 (or (= lt!644429 (select (arr!47887 a!2862) j!93)) (= (bvadd lt!644429 lt!644429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474939 () Bool)

(assert (=> b!1474939 (= e!827508 (Intermediate!12127 true (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474940 () Bool)

(assert (=> b!1474940 (= e!827507 (Intermediate!12127 false (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474941 () Bool)

(declare-fun e!827509 () Bool)

(declare-fun lt!644430 () SeekEntryResult!12127)

(assert (=> b!1474941 (= e!827509 (bvsge (x!132475 lt!644430) #b01111111111111111111111111111110))))

(declare-fun b!1474942 () Bool)

(assert (=> b!1474942 (and (bvsge (index!50902 lt!644430) #b00000000000000000000000000000000) (bvslt (index!50902 lt!644430) (size!48437 a!2862)))))

(declare-fun res!1001984 () Bool)

(assert (=> b!1474942 (= res!1001984 (= (select (arr!47887 a!2862) (index!50902 lt!644430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827505 () Bool)

(assert (=> b!1474942 (=> res!1001984 e!827505)))

(declare-fun b!1474944 () Bool)

(declare-fun e!827506 () Bool)

(assert (=> b!1474944 (= e!827509 e!827506)))

(declare-fun res!1001986 () Bool)

(assert (=> b!1474944 (= res!1001986 (and (is-Intermediate!12127 lt!644430) (not (undefined!12939 lt!644430)) (bvslt (x!132475 lt!644430) #b01111111111111111111111111111110) (bvsge (x!132475 lt!644430) #b00000000000000000000000000000000) (bvsge (x!132475 lt!644430) #b00000000000000000000000000000000)))))

(assert (=> b!1474944 (=> (not res!1001986) (not e!827506))))

(declare-fun b!1474945 () Bool)

(assert (=> b!1474945 (and (bvsge (index!50902 lt!644430) #b00000000000000000000000000000000) (bvslt (index!50902 lt!644430) (size!48437 a!2862)))))

(declare-fun res!1001985 () Bool)

(assert (=> b!1474945 (= res!1001985 (= (select (arr!47887 a!2862) (index!50902 lt!644430)) (select (arr!47887 a!2862) j!93)))))

(assert (=> b!1474945 (=> res!1001985 e!827505)))

(assert (=> b!1474945 (= e!827506 e!827505)))

(declare-fun d!155681 () Bool)

(assert (=> d!155681 e!827509))

(declare-fun c!135994 () Bool)

(assert (=> d!155681 (= c!135994 (and (is-Intermediate!12127 lt!644430) (undefined!12939 lt!644430)))))

(assert (=> d!155681 (= lt!644430 e!827508)))

(declare-fun c!135992 () Bool)

(assert (=> d!155681 (= c!135992 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155681 (= lt!644429 (select (arr!47887 a!2862) (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687)))))

(assert (=> d!155681 (validMask!0 mask!2687)))

(assert (=> d!155681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!644430)))

(declare-fun b!1474943 () Bool)

(assert (=> b!1474943 (and (bvsge (index!50902 lt!644430) #b00000000000000000000000000000000) (bvslt (index!50902 lt!644430) (size!48437 a!2862)))))

(assert (=> b!1474943 (= e!827505 (= (select (arr!47887 a!2862) (index!50902 lt!644430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155681 c!135992) b!1474939))

(assert (= (and d!155681 (not c!135992)) b!1474938))

(assert (= (and b!1474938 c!135993) b!1474940))

(assert (= (and b!1474938 (not c!135993)) b!1474937))

(assert (= (and d!155681 c!135994) b!1474941))

(assert (= (and d!155681 (not c!135994)) b!1474944))

(assert (= (and b!1474944 res!1001986) b!1474945))

(assert (= (and b!1474945 (not res!1001985)) b!1474942))

(assert (= (and b!1474942 (not res!1001984)) b!1474943))

(declare-fun m!1361337 () Bool)

(assert (=> b!1474942 m!1361337))

(assert (=> d!155681 m!1361229))

(declare-fun m!1361339 () Bool)

(assert (=> d!155681 m!1361339))

(assert (=> d!155681 m!1361199))

(assert (=> b!1474943 m!1361337))

(assert (=> b!1474937 m!1361229))

(declare-fun m!1361341 () Bool)

(assert (=> b!1474937 m!1361341))

(assert (=> b!1474937 m!1361341))

(assert (=> b!1474937 m!1361217))

(declare-fun m!1361343 () Bool)

(assert (=> b!1474937 m!1361343))

(assert (=> b!1474945 m!1361337))

(assert (=> b!1474764 d!155681))

(declare-fun d!155701 () Bool)

(declare-fun lt!644443 () (_ BitVec 32))

(declare-fun lt!644442 () (_ BitVec 32))

(assert (=> d!155701 (= lt!644443 (bvmul (bvxor lt!644442 (bvlshr lt!644442 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155701 (= lt!644442 ((_ extract 31 0) (bvand (bvxor (select (arr!47887 a!2862) j!93) (bvlshr (select (arr!47887 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155701 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001990 (let ((h!35745 ((_ extract 31 0) (bvand (bvxor (select (arr!47887 a!2862) j!93) (bvlshr (select (arr!47887 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132481 (bvmul (bvxor h!35745 (bvlshr h!35745 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132481 (bvlshr x!132481 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001990 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001990 #b00000000000000000000000000000000))))))

(assert (=> d!155701 (= (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) (bvand (bvxor lt!644443 (bvlshr lt!644443 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474764 d!155701))

(declare-fun d!155709 () Bool)

(assert (=> d!155709 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125930 d!155709))

(declare-fun d!155711 () Bool)

(assert (=> d!155711 (= (array_inv!36915 a!2862) (bvsge (size!48437 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125930 d!155711))

(declare-fun bm!67769 () Bool)

(declare-fun call!67772 () Bool)

(assert (=> bm!67769 (= call!67772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475005 () Bool)

(declare-fun e!827547 () Bool)

(declare-fun e!827549 () Bool)

(assert (=> b!1475005 (= e!827547 e!827549)))

(declare-fun c!136015 () Bool)

(assert (=> b!1475005 (= c!136015 (validKeyInArray!0 (select (arr!47887 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475007 () Bool)

(assert (=> b!1475007 (= e!827549 call!67772)))

(declare-fun b!1475008 () Bool)

(declare-fun e!827548 () Bool)

(assert (=> b!1475008 (= e!827549 e!827548)))

(declare-fun lt!644458 () (_ BitVec 64))

(assert (=> b!1475008 (= lt!644458 (select (arr!47887 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644456 () Unit!49594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99207 (_ BitVec 64) (_ BitVec 32)) Unit!49594)

(assert (=> b!1475008 (= lt!644456 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644458 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1475008 (arrayContainsKey!0 a!2862 lt!644458 #b00000000000000000000000000000000)))

(declare-fun lt!644457 () Unit!49594)

(assert (=> b!1475008 (= lt!644457 lt!644456)))

(declare-fun res!1002007 () Bool)

(assert (=> b!1475008 (= res!1002007 (= (seekEntryOrOpen!0 (select (arr!47887 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12127 #b00000000000000000000000000000000)))))

(assert (=> b!1475008 (=> (not res!1002007) (not e!827548))))

(declare-fun d!155713 () Bool)

(declare-fun res!1002008 () Bool)

(assert (=> d!155713 (=> res!1002008 e!827547)))

(assert (=> d!155713 (= res!1002008 (bvsge #b00000000000000000000000000000000 (size!48437 a!2862)))))

(assert (=> d!155713 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827547)))

(declare-fun b!1475006 () Bool)

(assert (=> b!1475006 (= e!827548 call!67772)))

(assert (= (and d!155713 (not res!1002008)) b!1475005))

(assert (= (and b!1475005 c!136015) b!1475008))

(assert (= (and b!1475005 (not c!136015)) b!1475007))

(assert (= (and b!1475008 res!1002007) b!1475006))

(assert (= (or b!1475006 b!1475007) bm!67769))

(declare-fun m!1361369 () Bool)

(assert (=> bm!67769 m!1361369))

(declare-fun m!1361371 () Bool)

(assert (=> b!1475005 m!1361371))

(assert (=> b!1475005 m!1361371))

(declare-fun m!1361373 () Bool)

(assert (=> b!1475005 m!1361373))

(assert (=> b!1475008 m!1361371))

(declare-fun m!1361375 () Bool)

(assert (=> b!1475008 m!1361375))

(declare-fun m!1361377 () Bool)

(assert (=> b!1475008 m!1361377))

(assert (=> b!1475008 m!1361371))

(declare-fun m!1361379 () Bool)

(assert (=> b!1475008 m!1361379))

(assert (=> b!1474775 d!155713))

(declare-fun b!1475039 () Bool)

(declare-fun e!827566 () SeekEntryResult!12127)

(assert (=> b!1475039 (= e!827566 (Found!12127 index!646))))

(declare-fun b!1475040 () Bool)

(declare-fun c!136031 () Bool)

(declare-fun lt!644472 () (_ BitVec 64))

(assert (=> b!1475040 (= c!136031 (= lt!644472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827567 () SeekEntryResult!12127)

(assert (=> b!1475040 (= e!827566 e!827567)))

(declare-fun b!1475041 () Bool)

(declare-fun e!827565 () SeekEntryResult!12127)

(assert (=> b!1475041 (= e!827565 e!827566)))

(declare-fun c!136033 () Bool)

(assert (=> b!1475041 (= c!136033 (= lt!644472 (select (arr!47887 a!2862) j!93)))))

(declare-fun d!155719 () Bool)

(declare-fun lt!644473 () SeekEntryResult!12127)

(assert (=> d!155719 (and (or (is-Undefined!12127 lt!644473) (not (is-Found!12127 lt!644473)) (and (bvsge (index!50901 lt!644473) #b00000000000000000000000000000000) (bvslt (index!50901 lt!644473) (size!48437 a!2862)))) (or (is-Undefined!12127 lt!644473) (is-Found!12127 lt!644473) (not (is-MissingVacant!12127 lt!644473)) (not (= (index!50903 lt!644473) index!646)) (and (bvsge (index!50903 lt!644473) #b00000000000000000000000000000000) (bvslt (index!50903 lt!644473) (size!48437 a!2862)))) (or (is-Undefined!12127 lt!644473) (ite (is-Found!12127 lt!644473) (= (select (arr!47887 a!2862) (index!50901 lt!644473)) (select (arr!47887 a!2862) j!93)) (and (is-MissingVacant!12127 lt!644473) (= (index!50903 lt!644473) index!646) (= (select (arr!47887 a!2862) (index!50903 lt!644473)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155719 (= lt!644473 e!827565)))

(declare-fun c!136032 () Bool)

(assert (=> d!155719 (= c!136032 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155719 (= lt!644472 (select (arr!47887 a!2862) index!646))))

(assert (=> d!155719 (validMask!0 mask!2687)))

(assert (=> d!155719 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!644473)))

(declare-fun b!1475042 () Bool)

(assert (=> b!1475042 (= e!827567 (MissingVacant!12127 index!646))))

(declare-fun b!1475043 () Bool)

(assert (=> b!1475043 (= e!827567 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475044 () Bool)

(assert (=> b!1475044 (= e!827565 Undefined!12127)))

(assert (= (and d!155719 c!136032) b!1475044))

(assert (= (and d!155719 (not c!136032)) b!1475041))

(assert (= (and b!1475041 c!136033) b!1475039))

(assert (= (and b!1475041 (not c!136033)) b!1475040))

(assert (= (and b!1475040 c!136031) b!1475042))

(assert (= (and b!1475040 (not c!136031)) b!1475043))

(declare-fun m!1361389 () Bool)

(assert (=> d!155719 m!1361389))

(declare-fun m!1361391 () Bool)

(assert (=> d!155719 m!1361391))

(assert (=> d!155719 m!1361215))

(assert (=> d!155719 m!1361199))

(declare-fun m!1361395 () Bool)

(assert (=> b!1475043 m!1361395))

(assert (=> b!1475043 m!1361395))

(assert (=> b!1475043 m!1361217))

(declare-fun m!1361397 () Bool)

(assert (=> b!1475043 m!1361397))

(assert (=> b!1474765 d!155719))

(declare-fun d!155723 () Bool)

(assert (=> d!155723 (= (validKeyInArray!0 (select (arr!47887 a!2862) j!93)) (and (not (= (select (arr!47887 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47887 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474766 d!155723))

(declare-fun b!1475071 () Bool)

(declare-fun e!827586 () Bool)

(declare-fun call!67776 () Bool)

(assert (=> b!1475071 (= e!827586 call!67776)))

(declare-fun b!1475072 () Bool)

(declare-fun e!827585 () Bool)

(assert (=> b!1475072 (= e!827585 e!827586)))

(declare-fun c!136043 () Bool)

(assert (=> b!1475072 (= c!136043 (validKeyInArray!0 (select (arr!47887 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475073 () Bool)

(declare-fun e!827588 () Bool)

(declare-fun contains!9906 (List!34388 (_ BitVec 64)) Bool)

(assert (=> b!1475073 (= e!827588 (contains!9906 Nil!34385 (select (arr!47887 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155727 () Bool)

(declare-fun res!1002019 () Bool)

(declare-fun e!827587 () Bool)

(assert (=> d!155727 (=> res!1002019 e!827587)))

(assert (=> d!155727 (= res!1002019 (bvsge #b00000000000000000000000000000000 (size!48437 a!2862)))))

(assert (=> d!155727 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34385) e!827587)))

(declare-fun b!1475074 () Bool)

(assert (=> b!1475074 (= e!827586 call!67776)))

(declare-fun b!1475075 () Bool)

(assert (=> b!1475075 (= e!827587 e!827585)))

(declare-fun res!1002018 () Bool)

(assert (=> b!1475075 (=> (not res!1002018) (not e!827585))))

(assert (=> b!1475075 (= res!1002018 (not e!827588))))

(declare-fun res!1002017 () Bool)

(assert (=> b!1475075 (=> (not res!1002017) (not e!827588))))

(assert (=> b!1475075 (= res!1002017 (validKeyInArray!0 (select (arr!47887 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67773 () Bool)

(assert (=> bm!67773 (= call!67776 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136043 (Cons!34384 (select (arr!47887 a!2862) #b00000000000000000000000000000000) Nil!34385) Nil!34385)))))

(assert (= (and d!155727 (not res!1002019)) b!1475075))

(assert (= (and b!1475075 res!1002017) b!1475073))

(assert (= (and b!1475075 res!1002018) b!1475072))

(assert (= (and b!1475072 c!136043) b!1475071))

(assert (= (and b!1475072 (not c!136043)) b!1475074))

(assert (= (or b!1475071 b!1475074) bm!67773))

(assert (=> b!1475072 m!1361371))

(assert (=> b!1475072 m!1361371))

(assert (=> b!1475072 m!1361373))

(assert (=> b!1475073 m!1361371))

(assert (=> b!1475073 m!1361371))

(declare-fun m!1361423 () Bool)

(assert (=> b!1475073 m!1361423))

(assert (=> b!1475075 m!1361371))

(assert (=> b!1475075 m!1361371))

(assert (=> b!1475075 m!1361373))

(assert (=> bm!67773 m!1361371))

(declare-fun m!1361425 () Bool)

(assert (=> bm!67773 m!1361425))

(assert (=> b!1474777 d!155727))

(declare-fun b!1475076 () Bool)

(declare-fun e!827591 () SeekEntryResult!12127)

(assert (=> b!1475076 (= e!827591 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644358 lt!644356 mask!2687))))

(declare-fun b!1475077 () Bool)

(declare-fun e!827592 () SeekEntryResult!12127)

(assert (=> b!1475077 (= e!827592 e!827591)))

(declare-fun c!136045 () Bool)

(declare-fun lt!644485 () (_ BitVec 64))

(assert (=> b!1475077 (= c!136045 (or (= lt!644485 lt!644358) (= (bvadd lt!644485 lt!644485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475078 () Bool)

(assert (=> b!1475078 (= e!827592 (Intermediate!12127 true index!646 x!665))))

(declare-fun b!1475079 () Bool)

(assert (=> b!1475079 (= e!827591 (Intermediate!12127 false index!646 x!665))))

(declare-fun b!1475080 () Bool)

(declare-fun e!827593 () Bool)

(declare-fun lt!644486 () SeekEntryResult!12127)

(assert (=> b!1475080 (= e!827593 (bvsge (x!132475 lt!644486) #b01111111111111111111111111111110))))

(declare-fun b!1475081 () Bool)

(assert (=> b!1475081 (and (bvsge (index!50902 lt!644486) #b00000000000000000000000000000000) (bvslt (index!50902 lt!644486) (size!48437 lt!644356)))))

(declare-fun res!1002020 () Bool)

(assert (=> b!1475081 (= res!1002020 (= (select (arr!47887 lt!644356) (index!50902 lt!644486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827589 () Bool)

(assert (=> b!1475081 (=> res!1002020 e!827589)))

(declare-fun b!1475083 () Bool)

(declare-fun e!827590 () Bool)

(assert (=> b!1475083 (= e!827593 e!827590)))

(declare-fun res!1002022 () Bool)

(assert (=> b!1475083 (= res!1002022 (and (is-Intermediate!12127 lt!644486) (not (undefined!12939 lt!644486)) (bvslt (x!132475 lt!644486) #b01111111111111111111111111111110) (bvsge (x!132475 lt!644486) #b00000000000000000000000000000000) (bvsge (x!132475 lt!644486) x!665)))))

(assert (=> b!1475083 (=> (not res!1002022) (not e!827590))))

(declare-fun b!1475084 () Bool)

(assert (=> b!1475084 (and (bvsge (index!50902 lt!644486) #b00000000000000000000000000000000) (bvslt (index!50902 lt!644486) (size!48437 lt!644356)))))

(declare-fun res!1002021 () Bool)

(assert (=> b!1475084 (= res!1002021 (= (select (arr!47887 lt!644356) (index!50902 lt!644486)) lt!644358))))

(assert (=> b!1475084 (=> res!1002021 e!827589)))

(assert (=> b!1475084 (= e!827590 e!827589)))

(declare-fun d!155737 () Bool)

(assert (=> d!155737 e!827593))

(declare-fun c!136046 () Bool)

(assert (=> d!155737 (= c!136046 (and (is-Intermediate!12127 lt!644486) (undefined!12939 lt!644486)))))

(assert (=> d!155737 (= lt!644486 e!827592)))

(declare-fun c!136044 () Bool)

(assert (=> d!155737 (= c!136044 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155737 (= lt!644485 (select (arr!47887 lt!644356) index!646))))

(assert (=> d!155737 (validMask!0 mask!2687)))

(assert (=> d!155737 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644358 lt!644356 mask!2687) lt!644486)))

(declare-fun b!1475082 () Bool)

(assert (=> b!1475082 (and (bvsge (index!50902 lt!644486) #b00000000000000000000000000000000) (bvslt (index!50902 lt!644486) (size!48437 lt!644356)))))

(assert (=> b!1475082 (= e!827589 (= (select (arr!47887 lt!644356) (index!50902 lt!644486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155737 c!136044) b!1475078))

(assert (= (and d!155737 (not c!136044)) b!1475077))

(assert (= (and b!1475077 c!136045) b!1475079))

(assert (= (and b!1475077 (not c!136045)) b!1475076))

(assert (= (and d!155737 c!136046) b!1475080))

(assert (= (and d!155737 (not c!136046)) b!1475083))

(assert (= (and b!1475083 res!1002022) b!1475084))

(assert (= (and b!1475084 (not res!1002021)) b!1475081))

(assert (= (and b!1475081 (not res!1002020)) b!1475082))

(declare-fun m!1361427 () Bool)

(assert (=> b!1475081 m!1361427))

(declare-fun m!1361429 () Bool)

(assert (=> d!155737 m!1361429))

(assert (=> d!155737 m!1361199))

(assert (=> b!1475082 m!1361427))

(assert (=> b!1475076 m!1361395))

(assert (=> b!1475076 m!1361395))

(declare-fun m!1361431 () Bool)

(assert (=> b!1475076 m!1361431))

(assert (=> b!1475084 m!1361427))

(assert (=> b!1474778 d!155737))

(declare-fun b!1475125 () Bool)

(declare-fun e!827618 () SeekEntryResult!12127)

(declare-fun lt!644505 () SeekEntryResult!12127)

(assert (=> b!1475125 (= e!827618 (Found!12127 (index!50902 lt!644505)))))

(declare-fun b!1475126 () Bool)

(declare-fun c!136062 () Bool)

(declare-fun lt!644506 () (_ BitVec 64))

(assert (=> b!1475126 (= c!136062 (= lt!644506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827620 () SeekEntryResult!12127)

(assert (=> b!1475126 (= e!827618 e!827620)))

(declare-fun b!1475127 () Bool)

