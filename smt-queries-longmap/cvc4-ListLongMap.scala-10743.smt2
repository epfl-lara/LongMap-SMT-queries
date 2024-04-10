; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125600 () Bool)

(assert start!125600)

(declare-fun b!1469844 () Bool)

(declare-fun e!825136 () Bool)

(declare-fun e!825137 () Bool)

(assert (=> b!1469844 (= e!825136 e!825137)))

(declare-fun res!998279 () Bool)

(assert (=> b!1469844 (=> (not res!998279) (not e!825137))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99048 0))(
  ( (array!99049 (arr!47812 (Array (_ BitVec 32) (_ BitVec 64))) (size!48362 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99048)

(assert (=> b!1469844 (= res!998279 (= (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642695 () array!99048)

(assert (=> b!1469844 (= lt!642695 (array!99049 (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48362 a!2862)))))

(declare-fun res!998280 () Bool)

(assert (=> start!125600 (=> (not res!998280) (not e!825136))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125600 (= res!998280 (validMask!0 mask!2687))))

(assert (=> start!125600 e!825136))

(assert (=> start!125600 true))

(declare-fun array_inv!36840 (array!99048) Bool)

(assert (=> start!125600 (array_inv!36840 a!2862)))

(declare-fun b!1469845 () Bool)

(declare-fun res!998283 () Bool)

(assert (=> b!1469845 (=> (not res!998283) (not e!825136))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469845 (= res!998283 (and (= (size!48362 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48362 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48362 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469846 () Bool)

(declare-fun e!825135 () Bool)

(assert (=> b!1469846 (= e!825137 e!825135)))

(declare-fun res!998284 () Bool)

(assert (=> b!1469846 (=> (not res!998284) (not e!825135))))

(declare-datatypes ((SeekEntryResult!12052 0))(
  ( (MissingZero!12052 (index!50600 (_ BitVec 32))) (Found!12052 (index!50601 (_ BitVec 32))) (Intermediate!12052 (undefined!12864 Bool) (index!50602 (_ BitVec 32)) (x!132173 (_ BitVec 32))) (Undefined!12052) (MissingVacant!12052 (index!50603 (_ BitVec 32))) )
))
(declare-fun lt!642693 () SeekEntryResult!12052)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99048 (_ BitVec 32)) SeekEntryResult!12052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469846 (= res!998284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47812 a!2862) j!93) mask!2687) (select (arr!47812 a!2862) j!93) a!2862 mask!2687) lt!642693))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469846 (= lt!642693 (Intermediate!12052 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469847 () Bool)

(declare-fun res!998277 () Bool)

(assert (=> b!1469847 (=> (not res!998277) (not e!825136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469847 (= res!998277 (validKeyInArray!0 (select (arr!47812 a!2862) i!1006)))))

(declare-fun lt!642692 () SeekEntryResult!12052)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1469848 () Bool)

(declare-fun lt!642696 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!825134 () Bool)

(assert (=> b!1469848 (= e!825134 (not (= lt!642692 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642696 lt!642695 mask!2687))))))

(declare-fun b!1469849 () Bool)

(declare-fun res!998282 () Bool)

(assert (=> b!1469849 (=> (not res!998282) (not e!825136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99048 (_ BitVec 32)) Bool)

(assert (=> b!1469849 (= res!998282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469850 () Bool)

(declare-fun res!998278 () Bool)

(assert (=> b!1469850 (=> (not res!998278) (not e!825136))))

(declare-datatypes ((List!34313 0))(
  ( (Nil!34310) (Cons!34309 (h!35659 (_ BitVec 64)) (t!49007 List!34313)) )
))
(declare-fun arrayNoDuplicates!0 (array!99048 (_ BitVec 32) List!34313) Bool)

(assert (=> b!1469850 (= res!998278 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34310))))

(declare-fun b!1469851 () Bool)

(declare-fun e!825133 () Bool)

(assert (=> b!1469851 (= e!825135 e!825133)))

(declare-fun res!998287 () Bool)

(assert (=> b!1469851 (=> (not res!998287) (not e!825133))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469851 (= res!998287 (= lt!642692 (Intermediate!12052 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469851 (= lt!642692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642696 mask!2687) lt!642696 lt!642695 mask!2687))))

(assert (=> b!1469851 (= lt!642696 (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469852 () Bool)

(declare-fun res!998281 () Bool)

(assert (=> b!1469852 (=> (not res!998281) (not e!825135))))

(assert (=> b!1469852 (= res!998281 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47812 a!2862) j!93) a!2862 mask!2687) lt!642693))))

(declare-fun b!1469853 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99048 (_ BitVec 32)) SeekEntryResult!12052)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99048 (_ BitVec 32)) SeekEntryResult!12052)

(assert (=> b!1469853 (= e!825134 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642696 lt!642695 mask!2687) (seekEntryOrOpen!0 lt!642696 lt!642695 mask!2687))))))

(declare-fun b!1469854 () Bool)

(assert (=> b!1469854 (= e!825133 false)))

(declare-fun lt!642694 () Bool)

(assert (=> b!1469854 (= lt!642694 e!825134)))

(declare-fun c!135294 () Bool)

(assert (=> b!1469854 (= c!135294 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469855 () Bool)

(declare-fun res!998286 () Bool)

(assert (=> b!1469855 (=> (not res!998286) (not e!825136))))

(assert (=> b!1469855 (= res!998286 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48362 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48362 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48362 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469856 () Bool)

(declare-fun res!998285 () Bool)

(assert (=> b!1469856 (=> (not res!998285) (not e!825136))))

(assert (=> b!1469856 (= res!998285 (validKeyInArray!0 (select (arr!47812 a!2862) j!93)))))

(assert (= (and start!125600 res!998280) b!1469845))

(assert (= (and b!1469845 res!998283) b!1469847))

(assert (= (and b!1469847 res!998277) b!1469856))

(assert (= (and b!1469856 res!998285) b!1469849))

(assert (= (and b!1469849 res!998282) b!1469850))

(assert (= (and b!1469850 res!998278) b!1469855))

(assert (= (and b!1469855 res!998286) b!1469844))

(assert (= (and b!1469844 res!998279) b!1469846))

(assert (= (and b!1469846 res!998284) b!1469852))

(assert (= (and b!1469852 res!998281) b!1469851))

(assert (= (and b!1469851 res!998287) b!1469854))

(assert (= (and b!1469854 c!135294) b!1469848))

(assert (= (and b!1469854 (not c!135294)) b!1469853))

(declare-fun m!1356995 () Bool)

(assert (=> b!1469853 m!1356995))

(declare-fun m!1356997 () Bool)

(assert (=> b!1469853 m!1356997))

(declare-fun m!1356999 () Bool)

(assert (=> start!125600 m!1356999))

(declare-fun m!1357001 () Bool)

(assert (=> start!125600 m!1357001))

(declare-fun m!1357003 () Bool)

(assert (=> b!1469849 m!1357003))

(declare-fun m!1357005 () Bool)

(assert (=> b!1469847 m!1357005))

(assert (=> b!1469847 m!1357005))

(declare-fun m!1357007 () Bool)

(assert (=> b!1469847 m!1357007))

(declare-fun m!1357009 () Bool)

(assert (=> b!1469850 m!1357009))

(declare-fun m!1357011 () Bool)

(assert (=> b!1469848 m!1357011))

(declare-fun m!1357013 () Bool)

(assert (=> b!1469851 m!1357013))

(assert (=> b!1469851 m!1357013))

(declare-fun m!1357015 () Bool)

(assert (=> b!1469851 m!1357015))

(declare-fun m!1357017 () Bool)

(assert (=> b!1469851 m!1357017))

(declare-fun m!1357019 () Bool)

(assert (=> b!1469851 m!1357019))

(assert (=> b!1469844 m!1357017))

(declare-fun m!1357021 () Bool)

(assert (=> b!1469844 m!1357021))

(declare-fun m!1357023 () Bool)

(assert (=> b!1469852 m!1357023))

(assert (=> b!1469852 m!1357023))

(declare-fun m!1357025 () Bool)

(assert (=> b!1469852 m!1357025))

(assert (=> b!1469856 m!1357023))

(assert (=> b!1469856 m!1357023))

(declare-fun m!1357027 () Bool)

(assert (=> b!1469856 m!1357027))

(assert (=> b!1469846 m!1357023))

(assert (=> b!1469846 m!1357023))

(declare-fun m!1357029 () Bool)

(assert (=> b!1469846 m!1357029))

(assert (=> b!1469846 m!1357029))

(assert (=> b!1469846 m!1357023))

(declare-fun m!1357031 () Bool)

(assert (=> b!1469846 m!1357031))

(push 1)

(assert (not b!1469848))

(assert (not b!1469856))

(assert (not b!1469851))

(assert (not b!1469850))

