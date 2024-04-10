; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124448 () Bool)

(assert start!124448)

(declare-fun b!1439867 () Bool)

(declare-fun e!812004 () Bool)

(declare-fun e!812005 () Bool)

(assert (=> b!1439867 (= e!812004 e!812005)))

(declare-fun res!972294 () Bool)

(assert (=> b!1439867 (=> (not res!972294) (not e!812005))))

(declare-datatypes ((SeekEntryResult!11488 0))(
  ( (MissingZero!11488 (index!48344 (_ BitVec 32))) (Found!11488 (index!48345 (_ BitVec 32))) (Intermediate!11488 (undefined!12300 Bool) (index!48346 (_ BitVec 32)) (x!130073 (_ BitVec 32))) (Undefined!11488) (MissingVacant!11488 (index!48347 (_ BitVec 32))) )
))
(declare-fun lt!632877 () SeekEntryResult!11488)

(declare-datatypes ((array!97896 0))(
  ( (array!97897 (arr!47236 (Array (_ BitVec 32) (_ BitVec 64))) (size!47786 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97896)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97896 (_ BitVec 32)) SeekEntryResult!11488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439867 (= res!972294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47236 a!2862) j!93) mask!2687) (select (arr!47236 a!2862) j!93) a!2862 mask!2687) lt!632877))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439867 (= lt!632877 (Intermediate!11488 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439868 () Bool)

(declare-fun res!972301 () Bool)

(assert (=> b!1439868 (=> (not res!972301) (not e!812005))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439868 (= res!972301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97897 (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47786 a!2862)) mask!2687) (Intermediate!11488 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439869 () Bool)

(declare-fun res!972303 () Bool)

(assert (=> b!1439869 (=> (not res!972303) (not e!812004))))

(declare-datatypes ((List!33737 0))(
  ( (Nil!33734) (Cons!33733 (h!35083 (_ BitVec 64)) (t!48431 List!33737)) )
))
(declare-fun arrayNoDuplicates!0 (array!97896 (_ BitVec 32) List!33737) Bool)

(assert (=> b!1439869 (= res!972303 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33734))))

(declare-fun b!1439870 () Bool)

(declare-fun res!972300 () Bool)

(assert (=> b!1439870 (=> (not res!972300) (not e!812004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97896 (_ BitVec 32)) Bool)

(assert (=> b!1439870 (= res!972300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439871 () Bool)

(declare-fun res!972295 () Bool)

(assert (=> b!1439871 (=> (not res!972295) (not e!812004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439871 (= res!972295 (validKeyInArray!0 (select (arr!47236 a!2862) j!93)))))

(declare-fun b!1439872 () Bool)

(declare-fun res!972296 () Bool)

(assert (=> b!1439872 (=> (not res!972296) (not e!812004))))

(assert (=> b!1439872 (= res!972296 (and (= (size!47786 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47786 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47786 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439873 () Bool)

(declare-fun res!972304 () Bool)

(assert (=> b!1439873 (=> (not res!972304) (not e!812004))))

(assert (=> b!1439873 (= res!972304 (validKeyInArray!0 (select (arr!47236 a!2862) i!1006)))))

(declare-fun b!1439874 () Bool)

(declare-fun res!972299 () Bool)

(assert (=> b!1439874 (=> (not res!972299) (not e!812005))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1439874 (= res!972299 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47236 a!2862) j!93) a!2862 mask!2687) lt!632877))))

(declare-fun res!972298 () Bool)

(assert (=> start!124448 (=> (not res!972298) (not e!812004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124448 (= res!972298 (validMask!0 mask!2687))))

(assert (=> start!124448 e!812004))

(assert (=> start!124448 true))

(declare-fun array_inv!36264 (array!97896) Bool)

(assert (=> start!124448 (array_inv!36264 a!2862)))

(declare-fun b!1439875 () Bool)

(assert (=> b!1439875 (= e!812005 (not (validKeyInArray!0 (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439876 () Bool)

(declare-fun res!972297 () Bool)

(assert (=> b!1439876 (=> (not res!972297) (not e!812005))))

(assert (=> b!1439876 (= res!972297 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439877 () Bool)

(declare-fun res!972302 () Bool)

(assert (=> b!1439877 (=> (not res!972302) (not e!812004))))

(assert (=> b!1439877 (= res!972302 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47786 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47786 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47786 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124448 res!972298) b!1439872))

(assert (= (and b!1439872 res!972296) b!1439873))

(assert (= (and b!1439873 res!972304) b!1439871))

(assert (= (and b!1439871 res!972295) b!1439870))

(assert (= (and b!1439870 res!972300) b!1439869))

(assert (= (and b!1439869 res!972303) b!1439877))

(assert (= (and b!1439877 res!972302) b!1439867))

(assert (= (and b!1439867 res!972294) b!1439874))

(assert (= (and b!1439874 res!972299) b!1439868))

(assert (= (and b!1439868 res!972301) b!1439876))

(assert (= (and b!1439876 res!972297) b!1439875))

(declare-fun m!1328985 () Bool)

(assert (=> b!1439870 m!1328985))

(declare-fun m!1328987 () Bool)

(assert (=> b!1439867 m!1328987))

(assert (=> b!1439867 m!1328987))

(declare-fun m!1328989 () Bool)

(assert (=> b!1439867 m!1328989))

(assert (=> b!1439867 m!1328989))

(assert (=> b!1439867 m!1328987))

(declare-fun m!1328991 () Bool)

(assert (=> b!1439867 m!1328991))

(declare-fun m!1328993 () Bool)

(assert (=> start!124448 m!1328993))

(declare-fun m!1328995 () Bool)

(assert (=> start!124448 m!1328995))

(declare-fun m!1328997 () Bool)

(assert (=> b!1439868 m!1328997))

(declare-fun m!1328999 () Bool)

(assert (=> b!1439868 m!1328999))

(assert (=> b!1439868 m!1328999))

(declare-fun m!1329001 () Bool)

(assert (=> b!1439868 m!1329001))

(assert (=> b!1439868 m!1329001))

(assert (=> b!1439868 m!1328999))

(declare-fun m!1329003 () Bool)

(assert (=> b!1439868 m!1329003))

(assert (=> b!1439875 m!1328997))

(assert (=> b!1439875 m!1328999))

(assert (=> b!1439875 m!1328999))

(declare-fun m!1329005 () Bool)

(assert (=> b!1439875 m!1329005))

(assert (=> b!1439871 m!1328987))

(assert (=> b!1439871 m!1328987))

(declare-fun m!1329007 () Bool)

(assert (=> b!1439871 m!1329007))

(assert (=> b!1439874 m!1328987))

(assert (=> b!1439874 m!1328987))

(declare-fun m!1329009 () Bool)

(assert (=> b!1439874 m!1329009))

(assert (=> b!1439877 m!1328997))

(declare-fun m!1329011 () Bool)

(assert (=> b!1439877 m!1329011))

(declare-fun m!1329013 () Bool)

(assert (=> b!1439873 m!1329013))

(assert (=> b!1439873 m!1329013))

(declare-fun m!1329015 () Bool)

(assert (=> b!1439873 m!1329015))

(declare-fun m!1329017 () Bool)

(assert (=> b!1439869 m!1329017))

(push 1)

(assert (not b!1439868))

(assert (not b!1439871))

(assert (not b!1439874))

(assert (not start!124448))

(assert (not b!1439875))

(assert (not b!1439867))

(assert (not b!1439873))

(assert (not b!1439870))

(assert (not b!1439869))

(check-sat)

(pop 1)

(push 1)

