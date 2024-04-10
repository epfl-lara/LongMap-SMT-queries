; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124568 () Bool)

(assert start!124568)

(declare-fun b!1441897 () Bool)

(declare-fun res!974192 () Bool)

(declare-fun e!812759 () Bool)

(assert (=> b!1441897 (=> (not res!974192) (not e!812759))))

(declare-datatypes ((array!98016 0))(
  ( (array!98017 (arr!47296 (Array (_ BitVec 32) (_ BitVec 64))) (size!47846 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98016)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441897 (= res!974192 (validKeyInArray!0 (select (arr!47296 a!2862) i!1006)))))

(declare-fun lt!633398 () array!98016)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633399 () (_ BitVec 64))

(declare-fun e!812758 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11548 0))(
  ( (MissingZero!11548 (index!48584 (_ BitVec 32))) (Found!11548 (index!48585 (_ BitVec 32))) (Intermediate!11548 (undefined!12360 Bool) (index!48586 (_ BitVec 32)) (x!130293 (_ BitVec 32))) (Undefined!11548) (MissingVacant!11548 (index!48587 (_ BitVec 32))) )
))
(declare-fun lt!633397 () SeekEntryResult!11548)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1441898 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98016 (_ BitVec 32)) SeekEntryResult!11548)

(assert (=> b!1441898 (= e!812758 (= lt!633397 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633399 lt!633398 mask!2687)))))

(declare-fun b!1441899 () Bool)

(declare-fun res!974185 () Bool)

(assert (=> b!1441899 (=> (not res!974185) (not e!812759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98016 (_ BitVec 32)) Bool)

(assert (=> b!1441899 (= res!974185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441900 () Bool)

(declare-fun res!974194 () Bool)

(assert (=> b!1441900 (=> (not res!974194) (not e!812759))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441900 (= res!974194 (and (= (size!47846 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47846 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47846 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!974188 () Bool)

(assert (=> start!124568 (=> (not res!974188) (not e!812759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124568 (= res!974188 (validMask!0 mask!2687))))

(assert (=> start!124568 e!812759))

(assert (=> start!124568 true))

(declare-fun array_inv!36324 (array!98016) Bool)

(assert (=> start!124568 (array_inv!36324 a!2862)))

(declare-fun b!1441901 () Bool)

(declare-fun e!812762 () Bool)

(assert (=> b!1441901 (= e!812759 e!812762)))

(declare-fun res!974191 () Bool)

(assert (=> b!1441901 (=> (not res!974191) (not e!812762))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441901 (= res!974191 (= (select (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441901 (= lt!633398 (array!98017 (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47846 a!2862)))))

(declare-fun b!1441902 () Bool)

(declare-fun res!974184 () Bool)

(assert (=> b!1441902 (=> (not res!974184) (not e!812759))))

(assert (=> b!1441902 (= res!974184 (validKeyInArray!0 (select (arr!47296 a!2862) j!93)))))

(declare-fun b!1441903 () Bool)

(declare-fun res!974186 () Bool)

(declare-fun e!812761 () Bool)

(assert (=> b!1441903 (=> (not res!974186) (not e!812761))))

(assert (=> b!1441903 (= res!974186 e!812758)))

(declare-fun c!133368 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441903 (= c!133368 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441904 () Bool)

(declare-fun res!974193 () Bool)

(assert (=> b!1441904 (=> (not res!974193) (not e!812759))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441904 (= res!974193 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47846 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47846 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47846 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441905 () Bool)

(declare-fun res!974182 () Bool)

(assert (=> b!1441905 (=> (not res!974182) (not e!812759))))

(declare-datatypes ((List!33797 0))(
  ( (Nil!33794) (Cons!33793 (h!35143 (_ BitVec 64)) (t!48491 List!33797)) )
))
(declare-fun arrayNoDuplicates!0 (array!98016 (_ BitVec 32) List!33797) Bool)

(assert (=> b!1441905 (= res!974182 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33794))))

(declare-fun b!1441906 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98016 (_ BitVec 32)) SeekEntryResult!11548)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98016 (_ BitVec 32)) SeekEntryResult!11548)

(assert (=> b!1441906 (= e!812758 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633399 lt!633398 mask!2687) (seekEntryOrOpen!0 lt!633399 lt!633398 mask!2687)))))

(declare-fun b!1441907 () Bool)

(declare-fun res!974190 () Bool)

(assert (=> b!1441907 (=> (not res!974190) (not e!812761))))

(assert (=> b!1441907 (= res!974190 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441908 () Bool)

(assert (=> b!1441908 (= e!812761 (not true))))

(assert (=> b!1441908 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48592 0))(
  ( (Unit!48593) )
))
(declare-fun lt!633395 () Unit!48592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48592)

(assert (=> b!1441908 (= lt!633395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441909 () Bool)

(declare-fun e!812757 () Bool)

(assert (=> b!1441909 (= e!812757 e!812761)))

(declare-fun res!974189 () Bool)

(assert (=> b!1441909 (=> (not res!974189) (not e!812761))))

(assert (=> b!1441909 (= res!974189 (= lt!633397 (Intermediate!11548 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441909 (= lt!633397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633399 mask!2687) lt!633399 lt!633398 mask!2687))))

(assert (=> b!1441909 (= lt!633399 (select (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441910 () Bool)

(declare-fun res!974187 () Bool)

(assert (=> b!1441910 (=> (not res!974187) (not e!812757))))

(declare-fun lt!633396 () SeekEntryResult!11548)

(assert (=> b!1441910 (= res!974187 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47296 a!2862) j!93) a!2862 mask!2687) lt!633396))))

(declare-fun b!1441911 () Bool)

(assert (=> b!1441911 (= e!812762 e!812757)))

(declare-fun res!974183 () Bool)

(assert (=> b!1441911 (=> (not res!974183) (not e!812757))))

(assert (=> b!1441911 (= res!974183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47296 a!2862) j!93) mask!2687) (select (arr!47296 a!2862) j!93) a!2862 mask!2687) lt!633396))))

(assert (=> b!1441911 (= lt!633396 (Intermediate!11548 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124568 res!974188) b!1441900))

(assert (= (and b!1441900 res!974194) b!1441897))

(assert (= (and b!1441897 res!974192) b!1441902))

(assert (= (and b!1441902 res!974184) b!1441899))

(assert (= (and b!1441899 res!974185) b!1441905))

(assert (= (and b!1441905 res!974182) b!1441904))

(assert (= (and b!1441904 res!974193) b!1441901))

(assert (= (and b!1441901 res!974191) b!1441911))

(assert (= (and b!1441911 res!974183) b!1441910))

(assert (= (and b!1441910 res!974187) b!1441909))

(assert (= (and b!1441909 res!974189) b!1441903))

(assert (= (and b!1441903 c!133368) b!1441898))

(assert (= (and b!1441903 (not c!133368)) b!1441906))

(assert (= (and b!1441903 res!974186) b!1441907))

(assert (= (and b!1441907 res!974190) b!1441908))

(declare-fun m!1331089 () Bool)

(assert (=> b!1441908 m!1331089))

(declare-fun m!1331091 () Bool)

(assert (=> b!1441908 m!1331091))

(declare-fun m!1331093 () Bool)

(assert (=> b!1441898 m!1331093))

(declare-fun m!1331095 () Bool)

(assert (=> b!1441901 m!1331095))

(declare-fun m!1331097 () Bool)

(assert (=> b!1441901 m!1331097))

(declare-fun m!1331099 () Bool)

(assert (=> b!1441899 m!1331099))

(declare-fun m!1331101 () Bool)

(assert (=> b!1441902 m!1331101))

(assert (=> b!1441902 m!1331101))

(declare-fun m!1331103 () Bool)

(assert (=> b!1441902 m!1331103))

(declare-fun m!1331105 () Bool)

(assert (=> b!1441906 m!1331105))

(declare-fun m!1331107 () Bool)

(assert (=> b!1441906 m!1331107))

(declare-fun m!1331109 () Bool)

(assert (=> start!124568 m!1331109))

(declare-fun m!1331111 () Bool)

(assert (=> start!124568 m!1331111))

(declare-fun m!1331113 () Bool)

(assert (=> b!1441909 m!1331113))

(assert (=> b!1441909 m!1331113))

(declare-fun m!1331115 () Bool)

(assert (=> b!1441909 m!1331115))

(assert (=> b!1441909 m!1331095))

(declare-fun m!1331117 () Bool)

(assert (=> b!1441909 m!1331117))

(declare-fun m!1331119 () Bool)

(assert (=> b!1441897 m!1331119))

(assert (=> b!1441897 m!1331119))

(declare-fun m!1331121 () Bool)

(assert (=> b!1441897 m!1331121))

(assert (=> b!1441911 m!1331101))

(assert (=> b!1441911 m!1331101))

(declare-fun m!1331123 () Bool)

(assert (=> b!1441911 m!1331123))

(assert (=> b!1441911 m!1331123))

(assert (=> b!1441911 m!1331101))

(declare-fun m!1331125 () Bool)

(assert (=> b!1441911 m!1331125))

(declare-fun m!1331127 () Bool)

(assert (=> b!1441905 m!1331127))

(assert (=> b!1441910 m!1331101))

(assert (=> b!1441910 m!1331101))

(declare-fun m!1331129 () Bool)

(assert (=> b!1441910 m!1331129))

(push 1)

(assert (not b!1441897))

(assert (not b!1441902))

(assert (not b!1441908))

(assert (not b!1441899))

