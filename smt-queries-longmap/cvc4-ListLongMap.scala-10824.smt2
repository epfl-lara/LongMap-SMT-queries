; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126662 () Bool)

(assert start!126662)

(declare-fun b!1486945 () Bool)

(declare-fun res!1011257 () Bool)

(declare-fun e!833521 () Bool)

(assert (=> b!1486945 (=> (not res!1011257) (not e!833521))))

(declare-datatypes ((array!99561 0))(
  ( (array!99562 (arr!48055 (Array (_ BitVec 32) (_ BitVec 64))) (size!48605 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99561)

(declare-datatypes ((List!34556 0))(
  ( (Nil!34553) (Cons!34552 (h!35929 (_ BitVec 64)) (t!49250 List!34556)) )
))
(declare-fun arrayNoDuplicates!0 (array!99561 (_ BitVec 32) List!34556) Bool)

(assert (=> b!1486945 (= res!1011257 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34553))))

(declare-fun b!1486947 () Bool)

(declare-fun e!833520 () Bool)

(declare-fun e!833513 () Bool)

(assert (=> b!1486947 (= e!833520 e!833513)))

(declare-fun res!1011253 () Bool)

(assert (=> b!1486947 (=> res!1011253 e!833513)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!648637 () (_ BitVec 64))

(assert (=> b!1486947 (= res!1011253 (or (and (= (select (arr!48055 a!2862) index!646) lt!648637) (= (select (arr!48055 a!2862) index!646) (select (arr!48055 a!2862) j!93))) (= (select (arr!48055 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486947 (= lt!648637 (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486948 () Bool)

(declare-fun e!833515 () Bool)

(assert (=> b!1486948 (= e!833521 e!833515)))

(declare-fun res!1011248 () Bool)

(assert (=> b!1486948 (=> (not res!1011248) (not e!833515))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486948 (= res!1011248 (= (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648642 () array!99561)

(assert (=> b!1486948 (= lt!648642 (array!99562 (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48605 a!2862)))))

(declare-fun b!1486949 () Bool)

(declare-fun res!1011261 () Bool)

(assert (=> b!1486949 (=> (not res!1011261) (not e!833521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486949 (= res!1011261 (validKeyInArray!0 (select (arr!48055 a!2862) j!93)))))

(declare-fun b!1486950 () Bool)

(declare-fun e!833517 () Bool)

(declare-fun e!833514 () Bool)

(assert (=> b!1486950 (= e!833517 e!833514)))

(declare-fun res!1011262 () Bool)

(assert (=> b!1486950 (=> (not res!1011262) (not e!833514))))

(declare-datatypes ((SeekEntryResult!12295 0))(
  ( (MissingZero!12295 (index!51572 (_ BitVec 32))) (Found!12295 (index!51573 (_ BitVec 32))) (Intermediate!12295 (undefined!13107 Bool) (index!51574 (_ BitVec 32)) (x!133151 (_ BitVec 32))) (Undefined!12295) (MissingVacant!12295 (index!51575 (_ BitVec 32))) )
))
(declare-fun lt!648641 () SeekEntryResult!12295)

(assert (=> b!1486950 (= res!1011262 (= lt!648641 (Intermediate!12295 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!648638 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99561 (_ BitVec 32)) SeekEntryResult!12295)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486950 (= lt!648641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648638 mask!2687) lt!648638 lt!648642 mask!2687))))

(assert (=> b!1486950 (= lt!648638 (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486951 () Bool)

(declare-fun e!833522 () Bool)

(assert (=> b!1486951 (= e!833522 true)))

(declare-fun lt!648636 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486951 (= lt!648636 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486952 () Bool)

(assert (=> b!1486952 (= e!833515 e!833517)))

(declare-fun res!1011258 () Bool)

(assert (=> b!1486952 (=> (not res!1011258) (not e!833517))))

(declare-fun lt!648639 () SeekEntryResult!12295)

(assert (=> b!1486952 (= res!1011258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48055 a!2862) j!93) mask!2687) (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!648639))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486952 (= lt!648639 (Intermediate!12295 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486953 () Bool)

(declare-fun res!1011263 () Bool)

(assert (=> b!1486953 (=> (not res!1011263) (not e!833521))))

(assert (=> b!1486953 (= res!1011263 (validKeyInArray!0 (select (arr!48055 a!2862) i!1006)))))

(declare-fun b!1486954 () Bool)

(declare-fun res!1011265 () Bool)

(assert (=> b!1486954 (=> (not res!1011265) (not e!833520))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99561 (_ BitVec 32)) SeekEntryResult!12295)

(assert (=> b!1486954 (= res!1011265 (= (seekEntryOrOpen!0 (select (arr!48055 a!2862) j!93) a!2862 mask!2687) (Found!12295 j!93)))))

(declare-fun b!1486955 () Bool)

(declare-fun res!1011254 () Bool)

(assert (=> b!1486955 (=> (not res!1011254) (not e!833521))))

(assert (=> b!1486955 (= res!1011254 (and (= (size!48605 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48605 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48605 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486956 () Bool)

(declare-fun res!1011259 () Bool)

(assert (=> b!1486956 (=> (not res!1011259) (not e!833517))))

(assert (=> b!1486956 (= res!1011259 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!648639))))

(declare-fun b!1486957 () Bool)

(assert (=> b!1486957 (= e!833514 (not e!833522))))

(declare-fun res!1011249 () Bool)

(assert (=> b!1486957 (=> res!1011249 e!833522)))

(assert (=> b!1486957 (= res!1011249 (or (and (= (select (arr!48055 a!2862) index!646) (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48055 a!2862) index!646) (select (arr!48055 a!2862) j!93))) (= (select (arr!48055 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486957 e!833520))

(declare-fun res!1011251 () Bool)

(assert (=> b!1486957 (=> (not res!1011251) (not e!833520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99561 (_ BitVec 32)) Bool)

(assert (=> b!1486957 (= res!1011251 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49930 0))(
  ( (Unit!49931) )
))
(declare-fun lt!648640 () Unit!49930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49930)

(assert (=> b!1486957 (= lt!648640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486958 () Bool)

(declare-fun res!1011247 () Bool)

(assert (=> b!1486958 (=> (not res!1011247) (not e!833520))))

(assert (=> b!1486958 (= res!1011247 (or (= (select (arr!48055 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48055 a!2862) intermediateBeforeIndex!19) (select (arr!48055 a!2862) j!93))))))

(declare-fun res!1011252 () Bool)

(assert (=> start!126662 (=> (not res!1011252) (not e!833521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126662 (= res!1011252 (validMask!0 mask!2687))))

(assert (=> start!126662 e!833521))

(assert (=> start!126662 true))

(declare-fun array_inv!37083 (array!99561) Bool)

(assert (=> start!126662 (array_inv!37083 a!2862)))

(declare-fun b!1486946 () Bool)

(declare-fun res!1011250 () Bool)

(assert (=> b!1486946 (=> (not res!1011250) (not e!833514))))

(declare-fun e!833519 () Bool)

(assert (=> b!1486946 (= res!1011250 e!833519)))

(declare-fun c!137373 () Bool)

(assert (=> b!1486946 (= c!137373 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486959 () Bool)

(declare-fun res!1011264 () Bool)

(assert (=> b!1486959 (=> (not res!1011264) (not e!833521))))

(assert (=> b!1486959 (= res!1011264 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48605 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48605 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48605 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486960 () Bool)

(declare-fun res!1011260 () Bool)

(assert (=> b!1486960 (=> (not res!1011260) (not e!833514))))

(assert (=> b!1486960 (= res!1011260 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486961 () Bool)

(declare-fun e!833518 () Bool)

(assert (=> b!1486961 (= e!833513 e!833518)))

(declare-fun res!1011256 () Bool)

(assert (=> b!1486961 (=> (not res!1011256) (not e!833518))))

(assert (=> b!1486961 (= res!1011256 (and (= index!646 intermediateAfterIndex!19) (= lt!648637 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486962 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99561 (_ BitVec 32)) SeekEntryResult!12295)

(assert (=> b!1486962 (= e!833518 (= (seekEntryOrOpen!0 lt!648638 lt!648642 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648638 lt!648642 mask!2687)))))

(declare-fun b!1486963 () Bool)

(assert (=> b!1486963 (= e!833519 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648638 lt!648642 mask!2687) (seekEntryOrOpen!0 lt!648638 lt!648642 mask!2687)))))

(declare-fun b!1486964 () Bool)

(assert (=> b!1486964 (= e!833519 (= lt!648641 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648638 lt!648642 mask!2687)))))

(declare-fun b!1486965 () Bool)

(declare-fun res!1011255 () Bool)

(assert (=> b!1486965 (=> (not res!1011255) (not e!833521))))

(assert (=> b!1486965 (= res!1011255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126662 res!1011252) b!1486955))

(assert (= (and b!1486955 res!1011254) b!1486953))

(assert (= (and b!1486953 res!1011263) b!1486949))

(assert (= (and b!1486949 res!1011261) b!1486965))

(assert (= (and b!1486965 res!1011255) b!1486945))

(assert (= (and b!1486945 res!1011257) b!1486959))

(assert (= (and b!1486959 res!1011264) b!1486948))

(assert (= (and b!1486948 res!1011248) b!1486952))

(assert (= (and b!1486952 res!1011258) b!1486956))

(assert (= (and b!1486956 res!1011259) b!1486950))

(assert (= (and b!1486950 res!1011262) b!1486946))

(assert (= (and b!1486946 c!137373) b!1486964))

(assert (= (and b!1486946 (not c!137373)) b!1486963))

(assert (= (and b!1486946 res!1011250) b!1486960))

(assert (= (and b!1486960 res!1011260) b!1486957))

(assert (= (and b!1486957 res!1011251) b!1486954))

(assert (= (and b!1486954 res!1011265) b!1486958))

(assert (= (and b!1486958 res!1011247) b!1486947))

(assert (= (and b!1486947 (not res!1011253)) b!1486961))

(assert (= (and b!1486961 res!1011256) b!1486962))

(assert (= (and b!1486957 (not res!1011249)) b!1486951))

(declare-fun m!1371735 () Bool)

(assert (=> b!1486962 m!1371735))

(declare-fun m!1371737 () Bool)

(assert (=> b!1486962 m!1371737))

(declare-fun m!1371739 () Bool)

(assert (=> b!1486964 m!1371739))

(declare-fun m!1371741 () Bool)

(assert (=> b!1486952 m!1371741))

(assert (=> b!1486952 m!1371741))

(declare-fun m!1371743 () Bool)

(assert (=> b!1486952 m!1371743))

(assert (=> b!1486952 m!1371743))

(assert (=> b!1486952 m!1371741))

(declare-fun m!1371745 () Bool)

(assert (=> b!1486952 m!1371745))

(declare-fun m!1371747 () Bool)

(assert (=> b!1486948 m!1371747))

(declare-fun m!1371749 () Bool)

(assert (=> b!1486948 m!1371749))

(assert (=> b!1486949 m!1371741))

(assert (=> b!1486949 m!1371741))

(declare-fun m!1371751 () Bool)

(assert (=> b!1486949 m!1371751))

(declare-fun m!1371753 () Bool)

(assert (=> b!1486945 m!1371753))

(declare-fun m!1371755 () Bool)

(assert (=> start!126662 m!1371755))

(declare-fun m!1371757 () Bool)

(assert (=> start!126662 m!1371757))

(declare-fun m!1371759 () Bool)

(assert (=> b!1486965 m!1371759))

(declare-fun m!1371761 () Bool)

(assert (=> b!1486957 m!1371761))

(assert (=> b!1486957 m!1371747))

(declare-fun m!1371763 () Bool)

(assert (=> b!1486957 m!1371763))

(declare-fun m!1371765 () Bool)

(assert (=> b!1486957 m!1371765))

(declare-fun m!1371767 () Bool)

(assert (=> b!1486957 m!1371767))

(assert (=> b!1486957 m!1371741))

(declare-fun m!1371769 () Bool)

(assert (=> b!1486950 m!1371769))

(assert (=> b!1486950 m!1371769))

(declare-fun m!1371771 () Bool)

(assert (=> b!1486950 m!1371771))

(assert (=> b!1486950 m!1371747))

(declare-fun m!1371773 () Bool)

(assert (=> b!1486950 m!1371773))

(assert (=> b!1486954 m!1371741))

(assert (=> b!1486954 m!1371741))

(declare-fun m!1371775 () Bool)

(assert (=> b!1486954 m!1371775))

(assert (=> b!1486956 m!1371741))

(assert (=> b!1486956 m!1371741))

(declare-fun m!1371777 () Bool)

(assert (=> b!1486956 m!1371777))

(declare-fun m!1371779 () Bool)

(assert (=> b!1486958 m!1371779))

(assert (=> b!1486958 m!1371741))

(assert (=> b!1486947 m!1371765))

(assert (=> b!1486947 m!1371741))

(assert (=> b!1486947 m!1371747))

(assert (=> b!1486947 m!1371763))

(declare-fun m!1371781 () Bool)

(assert (=> b!1486951 m!1371781))

(declare-fun m!1371783 () Bool)

(assert (=> b!1486953 m!1371783))

(assert (=> b!1486953 m!1371783))

(declare-fun m!1371785 () Bool)

(assert (=> b!1486953 m!1371785))

(assert (=> b!1486963 m!1371737))

(assert (=> b!1486963 m!1371735))

(push 1)

