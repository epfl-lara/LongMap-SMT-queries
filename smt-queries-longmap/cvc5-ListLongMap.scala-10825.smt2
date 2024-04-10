; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126664 () Bool)

(assert start!126664)

(declare-fun b!1487008 () Bool)

(declare-fun res!1011307 () Bool)

(declare-fun e!833543 () Bool)

(assert (=> b!1487008 (=> (not res!1011307) (not e!833543))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99563 0))(
  ( (array!99564 (arr!48056 (Array (_ BitVec 32) (_ BitVec 64))) (size!48606 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99563)

(assert (=> b!1487008 (= res!1011307 (and (= (size!48606 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48606 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48606 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487009 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648661 () array!99563)

(declare-fun lt!648660 () (_ BitVec 64))

(declare-fun e!833546 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12296 0))(
  ( (MissingZero!12296 (index!51576 (_ BitVec 32))) (Found!12296 (index!51577 (_ BitVec 32))) (Intermediate!12296 (undefined!13108 Bool) (index!51578 (_ BitVec 32)) (x!133160 (_ BitVec 32))) (Undefined!12296) (MissingVacant!12296 (index!51579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99563 (_ BitVec 32)) SeekEntryResult!12296)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99563 (_ BitVec 32)) SeekEntryResult!12296)

(assert (=> b!1487009 (= e!833546 (= (seekEntryOrOpen!0 lt!648660 lt!648661 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648660 lt!648661 mask!2687)))))

(declare-fun e!833545 () Bool)

(declare-fun b!1487010 () Bool)

(assert (=> b!1487010 (= e!833545 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648660 lt!648661 mask!2687) (seekEntryOrOpen!0 lt!648660 lt!648661 mask!2687)))))

(declare-fun b!1487011 () Bool)

(declare-fun e!833552 () Bool)

(assert (=> b!1487011 (= e!833543 e!833552)))

(declare-fun res!1011306 () Bool)

(assert (=> b!1487011 (=> (not res!1011306) (not e!833552))))

(assert (=> b!1487011 (= res!1011306 (= (select (store (arr!48056 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487011 (= lt!648661 (array!99564 (store (arr!48056 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48606 a!2862)))))

(declare-fun b!1487012 () Bool)

(declare-fun e!833549 () Bool)

(declare-fun e!833544 () Bool)

(assert (=> b!1487012 (= e!833549 e!833544)))

(declare-fun res!1011314 () Bool)

(assert (=> b!1487012 (=> (not res!1011314) (not e!833544))))

(declare-fun lt!648659 () SeekEntryResult!12296)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1487012 (= res!1011314 (= lt!648659 (Intermediate!12296 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99563 (_ BitVec 32)) SeekEntryResult!12296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487012 (= lt!648659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648660 mask!2687) lt!648660 lt!648661 mask!2687))))

(assert (=> b!1487012 (= lt!648660 (select (store (arr!48056 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487013 () Bool)

(declare-fun res!1011313 () Bool)

(declare-fun e!833550 () Bool)

(assert (=> b!1487013 (=> (not res!1011313) (not e!833550))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1487013 (= res!1011313 (or (= (select (arr!48056 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48056 a!2862) intermediateBeforeIndex!19) (select (arr!48056 a!2862) j!93))))))

(declare-fun b!1487014 () Bool)

(declare-fun res!1011319 () Bool)

(assert (=> b!1487014 (=> (not res!1011319) (not e!833543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487014 (= res!1011319 (validKeyInArray!0 (select (arr!48056 a!2862) i!1006)))))

(declare-fun b!1487015 () Bool)

(declare-fun res!1011305 () Bool)

(assert (=> b!1487015 (=> (not res!1011305) (not e!833544))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487015 (= res!1011305 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487016 () Bool)

(assert (=> b!1487016 (= e!833545 (= lt!648659 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648660 lt!648661 mask!2687)))))

(declare-fun b!1487017 () Bool)

(declare-fun e!833547 () Bool)

(assert (=> b!1487017 (= e!833544 (not e!833547))))

(declare-fun res!1011311 () Bool)

(assert (=> b!1487017 (=> res!1011311 e!833547)))

(assert (=> b!1487017 (= res!1011311 (or (and (= (select (arr!48056 a!2862) index!646) (select (store (arr!48056 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48056 a!2862) index!646) (select (arr!48056 a!2862) j!93))) (= (select (arr!48056 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487017 e!833550))

(declare-fun res!1011312 () Bool)

(assert (=> b!1487017 (=> (not res!1011312) (not e!833550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99563 (_ BitVec 32)) Bool)

(assert (=> b!1487017 (= res!1011312 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49932 0))(
  ( (Unit!49933) )
))
(declare-fun lt!648657 () Unit!49932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49932)

(assert (=> b!1487017 (= lt!648657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487018 () Bool)

(assert (=> b!1487018 (= e!833552 e!833549)))

(declare-fun res!1011322 () Bool)

(assert (=> b!1487018 (=> (not res!1011322) (not e!833549))))

(declare-fun lt!648658 () SeekEntryResult!12296)

(assert (=> b!1487018 (= res!1011322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48056 a!2862) j!93) mask!2687) (select (arr!48056 a!2862) j!93) a!2862 mask!2687) lt!648658))))

(assert (=> b!1487018 (= lt!648658 (Intermediate!12296 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487019 () Bool)

(declare-fun res!1011318 () Bool)

(assert (=> b!1487019 (=> (not res!1011318) (not e!833543))))

(declare-datatypes ((List!34557 0))(
  ( (Nil!34554) (Cons!34553 (h!35930 (_ BitVec 64)) (t!49251 List!34557)) )
))
(declare-fun arrayNoDuplicates!0 (array!99563 (_ BitVec 32) List!34557) Bool)

(assert (=> b!1487019 (= res!1011318 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34554))))

(declare-fun b!1487020 () Bool)

(declare-fun res!1011317 () Bool)

(assert (=> b!1487020 (=> (not res!1011317) (not e!833550))))

(assert (=> b!1487020 (= res!1011317 (= (seekEntryOrOpen!0 (select (arr!48056 a!2862) j!93) a!2862 mask!2687) (Found!12296 j!93)))))

(declare-fun b!1487021 () Bool)

(declare-fun res!1011309 () Bool)

(assert (=> b!1487021 (=> (not res!1011309) (not e!833544))))

(assert (=> b!1487021 (= res!1011309 e!833545)))

(declare-fun c!137376 () Bool)

(assert (=> b!1487021 (= c!137376 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487022 () Bool)

(declare-fun e!833548 () Bool)

(assert (=> b!1487022 (= e!833548 e!833546)))

(declare-fun res!1011316 () Bool)

(assert (=> b!1487022 (=> (not res!1011316) (not e!833546))))

(declare-fun lt!648663 () (_ BitVec 64))

(assert (=> b!1487022 (= res!1011316 (and (= index!646 intermediateAfterIndex!19) (= lt!648663 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487023 () Bool)

(declare-fun res!1011315 () Bool)

(assert (=> b!1487023 (=> (not res!1011315) (not e!833543))))

(assert (=> b!1487023 (= res!1011315 (validKeyInArray!0 (select (arr!48056 a!2862) j!93)))))

(declare-fun b!1487024 () Bool)

(declare-fun res!1011304 () Bool)

(assert (=> b!1487024 (=> (not res!1011304) (not e!833543))))

(assert (=> b!1487024 (= res!1011304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487025 () Bool)

(declare-fun res!1011308 () Bool)

(assert (=> b!1487025 (=> (not res!1011308) (not e!833549))))

(assert (=> b!1487025 (= res!1011308 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48056 a!2862) j!93) a!2862 mask!2687) lt!648658))))

(declare-fun b!1487026 () Bool)

(declare-fun res!1011320 () Bool)

(assert (=> b!1487026 (=> (not res!1011320) (not e!833543))))

(assert (=> b!1487026 (= res!1011320 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48606 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48606 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48606 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487028 () Bool)

(assert (=> b!1487028 (= e!833550 e!833548)))

(declare-fun res!1011321 () Bool)

(assert (=> b!1487028 (=> res!1011321 e!833548)))

(assert (=> b!1487028 (= res!1011321 (or (and (= (select (arr!48056 a!2862) index!646) lt!648663) (= (select (arr!48056 a!2862) index!646) (select (arr!48056 a!2862) j!93))) (= (select (arr!48056 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487028 (= lt!648663 (select (store (arr!48056 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487027 () Bool)

(assert (=> b!1487027 (= e!833547 true)))

(declare-fun lt!648662 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487027 (= lt!648662 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1011310 () Bool)

(assert (=> start!126664 (=> (not res!1011310) (not e!833543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126664 (= res!1011310 (validMask!0 mask!2687))))

(assert (=> start!126664 e!833543))

(assert (=> start!126664 true))

(declare-fun array_inv!37084 (array!99563) Bool)

(assert (=> start!126664 (array_inv!37084 a!2862)))

(assert (= (and start!126664 res!1011310) b!1487008))

(assert (= (and b!1487008 res!1011307) b!1487014))

(assert (= (and b!1487014 res!1011319) b!1487023))

(assert (= (and b!1487023 res!1011315) b!1487024))

(assert (= (and b!1487024 res!1011304) b!1487019))

(assert (= (and b!1487019 res!1011318) b!1487026))

(assert (= (and b!1487026 res!1011320) b!1487011))

(assert (= (and b!1487011 res!1011306) b!1487018))

(assert (= (and b!1487018 res!1011322) b!1487025))

(assert (= (and b!1487025 res!1011308) b!1487012))

(assert (= (and b!1487012 res!1011314) b!1487021))

(assert (= (and b!1487021 c!137376) b!1487016))

(assert (= (and b!1487021 (not c!137376)) b!1487010))

(assert (= (and b!1487021 res!1011309) b!1487015))

(assert (= (and b!1487015 res!1011305) b!1487017))

(assert (= (and b!1487017 res!1011312) b!1487020))

(assert (= (and b!1487020 res!1011317) b!1487013))

(assert (= (and b!1487013 res!1011313) b!1487028))

(assert (= (and b!1487028 (not res!1011321)) b!1487022))

(assert (= (and b!1487022 res!1011316) b!1487009))

(assert (= (and b!1487017 (not res!1011311)) b!1487027))

(declare-fun m!1371787 () Bool)

(assert (=> start!126664 m!1371787))

(declare-fun m!1371789 () Bool)

(assert (=> start!126664 m!1371789))

(declare-fun m!1371791 () Bool)

(assert (=> b!1487014 m!1371791))

(assert (=> b!1487014 m!1371791))

(declare-fun m!1371793 () Bool)

(assert (=> b!1487014 m!1371793))

(declare-fun m!1371795 () Bool)

(assert (=> b!1487016 m!1371795))

(declare-fun m!1371797 () Bool)

(assert (=> b!1487012 m!1371797))

(assert (=> b!1487012 m!1371797))

(declare-fun m!1371799 () Bool)

(assert (=> b!1487012 m!1371799))

(declare-fun m!1371801 () Bool)

(assert (=> b!1487012 m!1371801))

(declare-fun m!1371803 () Bool)

(assert (=> b!1487012 m!1371803))

(declare-fun m!1371805 () Bool)

(assert (=> b!1487013 m!1371805))

(declare-fun m!1371807 () Bool)

(assert (=> b!1487013 m!1371807))

(assert (=> b!1487020 m!1371807))

(assert (=> b!1487020 m!1371807))

(declare-fun m!1371809 () Bool)

(assert (=> b!1487020 m!1371809))

(declare-fun m!1371811 () Bool)

(assert (=> b!1487019 m!1371811))

(declare-fun m!1371813 () Bool)

(assert (=> b!1487027 m!1371813))

(assert (=> b!1487023 m!1371807))

(assert (=> b!1487023 m!1371807))

(declare-fun m!1371815 () Bool)

(assert (=> b!1487023 m!1371815))

(declare-fun m!1371817 () Bool)

(assert (=> b!1487010 m!1371817))

(declare-fun m!1371819 () Bool)

(assert (=> b!1487010 m!1371819))

(assert (=> b!1487025 m!1371807))

(assert (=> b!1487025 m!1371807))

(declare-fun m!1371821 () Bool)

(assert (=> b!1487025 m!1371821))

(declare-fun m!1371823 () Bool)

(assert (=> b!1487028 m!1371823))

(assert (=> b!1487028 m!1371807))

(assert (=> b!1487028 m!1371801))

(declare-fun m!1371825 () Bool)

(assert (=> b!1487028 m!1371825))

(declare-fun m!1371827 () Bool)

(assert (=> b!1487024 m!1371827))

(assert (=> b!1487009 m!1371819))

(assert (=> b!1487009 m!1371817))

(declare-fun m!1371829 () Bool)

(assert (=> b!1487017 m!1371829))

(assert (=> b!1487017 m!1371801))

(assert (=> b!1487017 m!1371825))

(assert (=> b!1487017 m!1371823))

(declare-fun m!1371831 () Bool)

(assert (=> b!1487017 m!1371831))

(assert (=> b!1487017 m!1371807))

(assert (=> b!1487011 m!1371801))

(declare-fun m!1371833 () Bool)

(assert (=> b!1487011 m!1371833))

(assert (=> b!1487018 m!1371807))

(assert (=> b!1487018 m!1371807))

(declare-fun m!1371835 () Bool)

(assert (=> b!1487018 m!1371835))

(assert (=> b!1487018 m!1371835))

(assert (=> b!1487018 m!1371807))

(declare-fun m!1371837 () Bool)

(assert (=> b!1487018 m!1371837))

(push 1)

