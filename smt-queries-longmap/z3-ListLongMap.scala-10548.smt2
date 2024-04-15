; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124396 () Bool)

(assert start!124396)

(declare-fun b!1439350 () Bool)

(declare-fun res!971896 () Bool)

(declare-fun e!811791 () Bool)

(assert (=> b!1439350 (=> (not res!971896) (not e!811791))))

(declare-datatypes ((array!97822 0))(
  ( (array!97823 (arr!47200 (Array (_ BitVec 32) (_ BitVec 64))) (size!47752 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97822)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97822 (_ BitVec 32)) Bool)

(assert (=> b!1439350 (= res!971896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439351 () Bool)

(declare-fun e!811790 () Bool)

(assert (=> b!1439351 (= e!811790 false)))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11477 0))(
  ( (MissingZero!11477 (index!48300 (_ BitVec 32))) (Found!11477 (index!48301 (_ BitVec 32))) (Intermediate!11477 (undefined!12289 Bool) (index!48302 (_ BitVec 32)) (x!130033 (_ BitVec 32))) (Undefined!11477) (MissingVacant!11477 (index!48303 (_ BitVec 32))) )
))
(declare-fun lt!632595 () SeekEntryResult!11477)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97822 (_ BitVec 32)) SeekEntryResult!11477)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439351 (= lt!632595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47200 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47200 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97823 (store (arr!47200 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47752 a!2862)) mask!2687))))

(declare-fun res!971895 () Bool)

(assert (=> start!124396 (=> (not res!971895) (not e!811791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124396 (= res!971895 (validMask!0 mask!2687))))

(assert (=> start!124396 e!811791))

(assert (=> start!124396 true))

(declare-fun array_inv!36433 (array!97822) Bool)

(assert (=> start!124396 (array_inv!36433 a!2862)))

(declare-fun b!1439352 () Bool)

(declare-fun res!971898 () Bool)

(assert (=> b!1439352 (=> (not res!971898) (not e!811791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439352 (= res!971898 (validKeyInArray!0 (select (arr!47200 a!2862) i!1006)))))

(declare-fun b!1439353 () Bool)

(declare-fun res!971902 () Bool)

(assert (=> b!1439353 (=> (not res!971902) (not e!811790))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632594 () SeekEntryResult!11477)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439353 (= res!971902 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47200 a!2862) j!93) a!2862 mask!2687) lt!632594))))

(declare-fun b!1439354 () Bool)

(declare-fun res!971900 () Bool)

(assert (=> b!1439354 (=> (not res!971900) (not e!811791))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439354 (= res!971900 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47752 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47752 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47752 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47200 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439355 () Bool)

(assert (=> b!1439355 (= e!811791 e!811790)))

(declare-fun res!971897 () Bool)

(assert (=> b!1439355 (=> (not res!971897) (not e!811790))))

(assert (=> b!1439355 (= res!971897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47200 a!2862) j!93) mask!2687) (select (arr!47200 a!2862) j!93) a!2862 mask!2687) lt!632594))))

(assert (=> b!1439355 (= lt!632594 (Intermediate!11477 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439356 () Bool)

(declare-fun res!971899 () Bool)

(assert (=> b!1439356 (=> (not res!971899) (not e!811791))))

(assert (=> b!1439356 (= res!971899 (and (= (size!47752 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47752 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47752 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439357 () Bool)

(declare-fun res!971901 () Bool)

(assert (=> b!1439357 (=> (not res!971901) (not e!811791))))

(assert (=> b!1439357 (= res!971901 (validKeyInArray!0 (select (arr!47200 a!2862) j!93)))))

(declare-fun b!1439358 () Bool)

(declare-fun res!971894 () Bool)

(assert (=> b!1439358 (=> (not res!971894) (not e!811791))))

(declare-datatypes ((List!33779 0))(
  ( (Nil!33776) (Cons!33775 (h!35125 (_ BitVec 64)) (t!48465 List!33779)) )
))
(declare-fun arrayNoDuplicates!0 (array!97822 (_ BitVec 32) List!33779) Bool)

(assert (=> b!1439358 (= res!971894 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33776))))

(assert (= (and start!124396 res!971895) b!1439356))

(assert (= (and b!1439356 res!971899) b!1439352))

(assert (= (and b!1439352 res!971898) b!1439357))

(assert (= (and b!1439357 res!971901) b!1439350))

(assert (= (and b!1439350 res!971896) b!1439358))

(assert (= (and b!1439358 res!971894) b!1439354))

(assert (= (and b!1439354 res!971900) b!1439355))

(assert (= (and b!1439355 res!971897) b!1439353))

(assert (= (and b!1439353 res!971902) b!1439351))

(declare-fun m!1327953 () Bool)

(assert (=> b!1439352 m!1327953))

(assert (=> b!1439352 m!1327953))

(declare-fun m!1327955 () Bool)

(assert (=> b!1439352 m!1327955))

(declare-fun m!1327957 () Bool)

(assert (=> b!1439357 m!1327957))

(assert (=> b!1439357 m!1327957))

(declare-fun m!1327959 () Bool)

(assert (=> b!1439357 m!1327959))

(declare-fun m!1327961 () Bool)

(assert (=> b!1439354 m!1327961))

(declare-fun m!1327963 () Bool)

(assert (=> b!1439354 m!1327963))

(assert (=> b!1439351 m!1327961))

(declare-fun m!1327965 () Bool)

(assert (=> b!1439351 m!1327965))

(assert (=> b!1439351 m!1327965))

(declare-fun m!1327967 () Bool)

(assert (=> b!1439351 m!1327967))

(assert (=> b!1439351 m!1327967))

(assert (=> b!1439351 m!1327965))

(declare-fun m!1327969 () Bool)

(assert (=> b!1439351 m!1327969))

(declare-fun m!1327971 () Bool)

(assert (=> b!1439358 m!1327971))

(declare-fun m!1327973 () Bool)

(assert (=> start!124396 m!1327973))

(declare-fun m!1327975 () Bool)

(assert (=> start!124396 m!1327975))

(assert (=> b!1439353 m!1327957))

(assert (=> b!1439353 m!1327957))

(declare-fun m!1327977 () Bool)

(assert (=> b!1439353 m!1327977))

(declare-fun m!1327979 () Bool)

(assert (=> b!1439350 m!1327979))

(assert (=> b!1439355 m!1327957))

(assert (=> b!1439355 m!1327957))

(declare-fun m!1327981 () Bool)

(assert (=> b!1439355 m!1327981))

(assert (=> b!1439355 m!1327981))

(assert (=> b!1439355 m!1327957))

(declare-fun m!1327983 () Bool)

(assert (=> b!1439355 m!1327983))

(check-sat (not b!1439358) (not b!1439352) (not b!1439350) (not b!1439357) (not b!1439351) (not b!1439353) (not b!1439355) (not start!124396))
(check-sat)
