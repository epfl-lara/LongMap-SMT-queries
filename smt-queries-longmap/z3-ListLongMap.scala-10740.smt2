; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125548 () Bool)

(assert start!125548)

(declare-fun b!1469202 () Bool)

(declare-fun res!997827 () Bool)

(declare-fun e!824823 () Bool)

(assert (=> b!1469202 (=> (not res!997827) (not e!824823))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98974 0))(
  ( (array!98975 (arr!47776 (Array (_ BitVec 32) (_ BitVec 64))) (size!48328 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98974)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469202 (= res!997827 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48328 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48328 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48328 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469203 () Bool)

(declare-fun res!997819 () Bool)

(assert (=> b!1469203 (=> (not res!997819) (not e!824823))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98974 (_ BitVec 32)) Bool)

(assert (=> b!1469203 (= res!997819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-datatypes ((SeekEntryResult!12041 0))(
  ( (MissingZero!12041 (index!50556 (_ BitVec 32))) (Found!12041 (index!50557 (_ BitVec 32))) (Intermediate!12041 (undefined!12853 Bool) (index!50558 (_ BitVec 32)) (x!132133 (_ BitVec 32))) (Undefined!12041) (MissingVacant!12041 (index!50559 (_ BitVec 32))) )
))
(declare-fun lt!642314 () SeekEntryResult!12041)

(declare-fun e!824820 () Bool)

(declare-fun lt!642311 () array!98974)

(declare-fun b!1469204 () Bool)

(declare-fun lt!642312 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!12041)

(assert (=> b!1469204 (= e!824820 (not (= lt!642314 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642312 lt!642311 mask!2687))))))

(declare-fun b!1469205 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!12041)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!12041)

(assert (=> b!1469205 (= e!824820 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642312 lt!642311 mask!2687) (seekEntryOrOpen!0 lt!642312 lt!642311 mask!2687))))))

(declare-fun b!1469206 () Bool)

(declare-fun res!997818 () Bool)

(assert (=> b!1469206 (=> (not res!997818) (not e!824823))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469206 (= res!997818 (and (= (size!48328 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48328 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48328 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469207 () Bool)

(declare-fun e!824821 () Bool)

(declare-fun e!824818 () Bool)

(assert (=> b!1469207 (= e!824821 e!824818)))

(declare-fun res!997823 () Bool)

(assert (=> b!1469207 (=> (not res!997823) (not e!824818))))

(assert (=> b!1469207 (= res!997823 (= lt!642314 (Intermediate!12041 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469207 (= lt!642314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642312 mask!2687) lt!642312 lt!642311 mask!2687))))

(assert (=> b!1469207 (= lt!642312 (select (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469208 () Bool)

(declare-fun e!824819 () Bool)

(assert (=> b!1469208 (= e!824819 e!824821)))

(declare-fun res!997824 () Bool)

(assert (=> b!1469208 (=> (not res!997824) (not e!824821))))

(declare-fun lt!642313 () SeekEntryResult!12041)

(assert (=> b!1469208 (= res!997824 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47776 a!2862) j!93) mask!2687) (select (arr!47776 a!2862) j!93) a!2862 mask!2687) lt!642313))))

(assert (=> b!1469208 (= lt!642313 (Intermediate!12041 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997828 () Bool)

(assert (=> start!125548 (=> (not res!997828) (not e!824823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125548 (= res!997828 (validMask!0 mask!2687))))

(assert (=> start!125548 e!824823))

(assert (=> start!125548 true))

(declare-fun array_inv!37009 (array!98974) Bool)

(assert (=> start!125548 (array_inv!37009 a!2862)))

(declare-fun b!1469209 () Bool)

(assert (=> b!1469209 (= e!824818 false)))

(declare-fun lt!642315 () Bool)

(assert (=> b!1469209 (= lt!642315 e!824820)))

(declare-fun c!135205 () Bool)

(assert (=> b!1469209 (= c!135205 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469210 () Bool)

(declare-fun res!997821 () Bool)

(assert (=> b!1469210 (=> (not res!997821) (not e!824823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469210 (= res!997821 (validKeyInArray!0 (select (arr!47776 a!2862) j!93)))))

(declare-fun b!1469211 () Bool)

(declare-fun res!997825 () Bool)

(assert (=> b!1469211 (=> (not res!997825) (not e!824823))))

(declare-datatypes ((List!34355 0))(
  ( (Nil!34352) (Cons!34351 (h!35701 (_ BitVec 64)) (t!49041 List!34355)) )
))
(declare-fun arrayNoDuplicates!0 (array!98974 (_ BitVec 32) List!34355) Bool)

(assert (=> b!1469211 (= res!997825 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34352))))

(declare-fun b!1469212 () Bool)

(declare-fun res!997822 () Bool)

(assert (=> b!1469212 (=> (not res!997822) (not e!824821))))

(assert (=> b!1469212 (= res!997822 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47776 a!2862) j!93) a!2862 mask!2687) lt!642313))))

(declare-fun b!1469213 () Bool)

(assert (=> b!1469213 (= e!824823 e!824819)))

(declare-fun res!997826 () Bool)

(assert (=> b!1469213 (=> (not res!997826) (not e!824819))))

(assert (=> b!1469213 (= res!997826 (= (select (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469213 (= lt!642311 (array!98975 (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48328 a!2862)))))

(declare-fun b!1469214 () Bool)

(declare-fun res!997820 () Bool)

(assert (=> b!1469214 (=> (not res!997820) (not e!824823))))

(assert (=> b!1469214 (= res!997820 (validKeyInArray!0 (select (arr!47776 a!2862) i!1006)))))

(assert (= (and start!125548 res!997828) b!1469206))

(assert (= (and b!1469206 res!997818) b!1469214))

(assert (= (and b!1469214 res!997820) b!1469210))

(assert (= (and b!1469210 res!997821) b!1469203))

(assert (= (and b!1469203 res!997819) b!1469211))

(assert (= (and b!1469211 res!997825) b!1469202))

(assert (= (and b!1469202 res!997827) b!1469213))

(assert (= (and b!1469213 res!997826) b!1469208))

(assert (= (and b!1469208 res!997824) b!1469212))

(assert (= (and b!1469212 res!997822) b!1469207))

(assert (= (and b!1469207 res!997823) b!1469209))

(assert (= (and b!1469209 c!135205) b!1469204))

(assert (= (and b!1469209 (not c!135205)) b!1469205))

(declare-fun m!1355901 () Bool)

(assert (=> b!1469208 m!1355901))

(assert (=> b!1469208 m!1355901))

(declare-fun m!1355903 () Bool)

(assert (=> b!1469208 m!1355903))

(assert (=> b!1469208 m!1355903))

(assert (=> b!1469208 m!1355901))

(declare-fun m!1355905 () Bool)

(assert (=> b!1469208 m!1355905))

(declare-fun m!1355907 () Bool)

(assert (=> start!125548 m!1355907))

(declare-fun m!1355909 () Bool)

(assert (=> start!125548 m!1355909))

(assert (=> b!1469210 m!1355901))

(assert (=> b!1469210 m!1355901))

(declare-fun m!1355911 () Bool)

(assert (=> b!1469210 m!1355911))

(declare-fun m!1355913 () Bool)

(assert (=> b!1469211 m!1355913))

(declare-fun m!1355915 () Bool)

(assert (=> b!1469203 m!1355915))

(assert (=> b!1469212 m!1355901))

(assert (=> b!1469212 m!1355901))

(declare-fun m!1355917 () Bool)

(assert (=> b!1469212 m!1355917))

(declare-fun m!1355919 () Bool)

(assert (=> b!1469204 m!1355919))

(declare-fun m!1355921 () Bool)

(assert (=> b!1469214 m!1355921))

(assert (=> b!1469214 m!1355921))

(declare-fun m!1355923 () Bool)

(assert (=> b!1469214 m!1355923))

(declare-fun m!1355925 () Bool)

(assert (=> b!1469213 m!1355925))

(declare-fun m!1355927 () Bool)

(assert (=> b!1469213 m!1355927))

(declare-fun m!1355929 () Bool)

(assert (=> b!1469205 m!1355929))

(declare-fun m!1355931 () Bool)

(assert (=> b!1469205 m!1355931))

(declare-fun m!1355933 () Bool)

(assert (=> b!1469207 m!1355933))

(assert (=> b!1469207 m!1355933))

(declare-fun m!1355935 () Bool)

(assert (=> b!1469207 m!1355935))

(assert (=> b!1469207 m!1355925))

(declare-fun m!1355937 () Bool)

(assert (=> b!1469207 m!1355937))

(check-sat (not b!1469208) (not b!1469210) (not b!1469211) (not b!1469212) (not start!125548) (not b!1469203) (not b!1469205) (not b!1469204) (not b!1469207) (not b!1469214))
(check-sat)
