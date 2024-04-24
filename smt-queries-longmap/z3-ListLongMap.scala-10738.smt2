; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125844 () Bool)

(assert start!125844)

(declare-fun b!1470871 () Bool)

(declare-fun res!998316 () Bool)

(declare-fun e!825893 () Bool)

(assert (=> b!1470871 (=> (not res!998316) (not e!825893))))

(declare-datatypes ((array!99130 0))(
  ( (array!99131 (arr!47848 (Array (_ BitVec 32) (_ BitVec 64))) (size!48399 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99130)

(declare-datatypes ((List!34336 0))(
  ( (Nil!34333) (Cons!34332 (h!35696 (_ BitVec 64)) (t!49022 List!34336)) )
))
(declare-fun arrayNoDuplicates!0 (array!99130 (_ BitVec 32) List!34336) Bool)

(assert (=> b!1470871 (= res!998316 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34333))))

(declare-fun b!1470872 () Bool)

(declare-fun res!998309 () Bool)

(assert (=> b!1470872 (=> (not res!998309) (not e!825893))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99130 (_ BitVec 32)) Bool)

(assert (=> b!1470872 (= res!998309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470873 () Bool)

(declare-fun res!998312 () Bool)

(assert (=> b!1470873 (=> (not res!998312) (not e!825893))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470873 (= res!998312 (validKeyInArray!0 (select (arr!47848 a!2862) j!93)))))

(declare-fun b!1470874 () Bool)

(declare-fun res!998317 () Bool)

(assert (=> b!1470874 (=> (not res!998317) (not e!825893))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470874 (= res!998317 (and (= (size!48399 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48399 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48399 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!998308 () Bool)

(assert (=> start!125844 (=> (not res!998308) (not e!825893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125844 (= res!998308 (validMask!0 mask!2687))))

(assert (=> start!125844 e!825893))

(assert (=> start!125844 true))

(declare-fun array_inv!37129 (array!99130) Bool)

(assert (=> start!125844 (array_inv!37129 a!2862)))

(declare-fun b!1470875 () Bool)

(declare-fun e!825894 () Bool)

(declare-fun e!825890 () Bool)

(assert (=> b!1470875 (= e!825894 e!825890)))

(declare-fun res!998314 () Bool)

(assert (=> b!1470875 (=> (not res!998314) (not e!825890))))

(declare-datatypes ((SeekEntryResult!11985 0))(
  ( (MissingZero!11985 (index!50332 (_ BitVec 32))) (Found!11985 (index!50333 (_ BitVec 32))) (Intermediate!11985 (undefined!12797 Bool) (index!50334 (_ BitVec 32)) (x!132099 (_ BitVec 32))) (Undefined!11985) (MissingVacant!11985 (index!50335 (_ BitVec 32))) )
))
(declare-fun lt!643096 () SeekEntryResult!11985)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99130 (_ BitVec 32)) SeekEntryResult!11985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470875 (= res!998314 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47848 a!2862) j!93) mask!2687) (select (arr!47848 a!2862) j!93) a!2862 mask!2687) lt!643096))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470875 (= lt!643096 (Intermediate!11985 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470876 () Bool)

(assert (=> b!1470876 (= e!825893 e!825894)))

(declare-fun res!998310 () Bool)

(assert (=> b!1470876 (=> (not res!998310) (not e!825894))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470876 (= res!998310 (= (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643094 () array!99130)

(assert (=> b!1470876 (= lt!643094 (array!99131 (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48399 a!2862)))))

(declare-fun b!1470877 () Bool)

(declare-fun e!825892 () Bool)

(assert (=> b!1470877 (= e!825892 false)))

(declare-fun lt!643095 () Bool)

(declare-fun e!825891 () Bool)

(assert (=> b!1470877 (= lt!643095 e!825891)))

(declare-fun c!135802 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470877 (= c!135802 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470878 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643092 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99130 (_ BitVec 32)) SeekEntryResult!11985)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99130 (_ BitVec 32)) SeekEntryResult!11985)

(assert (=> b!1470878 (= e!825891 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643092 lt!643094 mask!2687) (seekEntryOrOpen!0 lt!643092 lt!643094 mask!2687))))))

(declare-fun b!1470879 () Bool)

(declare-fun res!998318 () Bool)

(assert (=> b!1470879 (=> (not res!998318) (not e!825893))))

(assert (=> b!1470879 (= res!998318 (validKeyInArray!0 (select (arr!47848 a!2862) i!1006)))))

(declare-fun b!1470880 () Bool)

(assert (=> b!1470880 (= e!825890 e!825892)))

(declare-fun res!998315 () Bool)

(assert (=> b!1470880 (=> (not res!998315) (not e!825892))))

(declare-fun lt!643093 () SeekEntryResult!11985)

(assert (=> b!1470880 (= res!998315 (= lt!643093 (Intermediate!11985 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470880 (= lt!643093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643092 mask!2687) lt!643092 lt!643094 mask!2687))))

(assert (=> b!1470880 (= lt!643092 (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470881 () Bool)

(declare-fun res!998311 () Bool)

(assert (=> b!1470881 (=> (not res!998311) (not e!825890))))

(assert (=> b!1470881 (= res!998311 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47848 a!2862) j!93) a!2862 mask!2687) lt!643096))))

(declare-fun b!1470882 () Bool)

(declare-fun res!998313 () Bool)

(assert (=> b!1470882 (=> (not res!998313) (not e!825893))))

(assert (=> b!1470882 (= res!998313 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48399 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48399 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48399 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470883 () Bool)

(assert (=> b!1470883 (= e!825891 (not (= lt!643093 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643092 lt!643094 mask!2687))))))

(assert (= (and start!125844 res!998308) b!1470874))

(assert (= (and b!1470874 res!998317) b!1470879))

(assert (= (and b!1470879 res!998318) b!1470873))

(assert (= (and b!1470873 res!998312) b!1470872))

(assert (= (and b!1470872 res!998309) b!1470871))

(assert (= (and b!1470871 res!998316) b!1470882))

(assert (= (and b!1470882 res!998313) b!1470876))

(assert (= (and b!1470876 res!998310) b!1470875))

(assert (= (and b!1470875 res!998314) b!1470881))

(assert (= (and b!1470881 res!998311) b!1470880))

(assert (= (and b!1470880 res!998315) b!1470877))

(assert (= (and b!1470877 c!135802) b!1470883))

(assert (= (and b!1470877 (not c!135802)) b!1470878))

(declare-fun m!1358035 () Bool)

(assert (=> b!1470881 m!1358035))

(assert (=> b!1470881 m!1358035))

(declare-fun m!1358037 () Bool)

(assert (=> b!1470881 m!1358037))

(assert (=> b!1470873 m!1358035))

(assert (=> b!1470873 m!1358035))

(declare-fun m!1358039 () Bool)

(assert (=> b!1470873 m!1358039))

(declare-fun m!1358041 () Bool)

(assert (=> start!125844 m!1358041))

(declare-fun m!1358043 () Bool)

(assert (=> start!125844 m!1358043))

(declare-fun m!1358045 () Bool)

(assert (=> b!1470880 m!1358045))

(assert (=> b!1470880 m!1358045))

(declare-fun m!1358047 () Bool)

(assert (=> b!1470880 m!1358047))

(declare-fun m!1358049 () Bool)

(assert (=> b!1470880 m!1358049))

(declare-fun m!1358051 () Bool)

(assert (=> b!1470880 m!1358051))

(assert (=> b!1470875 m!1358035))

(assert (=> b!1470875 m!1358035))

(declare-fun m!1358053 () Bool)

(assert (=> b!1470875 m!1358053))

(assert (=> b!1470875 m!1358053))

(assert (=> b!1470875 m!1358035))

(declare-fun m!1358055 () Bool)

(assert (=> b!1470875 m!1358055))

(declare-fun m!1358057 () Bool)

(assert (=> b!1470878 m!1358057))

(declare-fun m!1358059 () Bool)

(assert (=> b!1470878 m!1358059))

(assert (=> b!1470876 m!1358049))

(declare-fun m!1358061 () Bool)

(assert (=> b!1470876 m!1358061))

(declare-fun m!1358063 () Bool)

(assert (=> b!1470872 m!1358063))

(declare-fun m!1358065 () Bool)

(assert (=> b!1470879 m!1358065))

(assert (=> b!1470879 m!1358065))

(declare-fun m!1358067 () Bool)

(assert (=> b!1470879 m!1358067))

(declare-fun m!1358069 () Bool)

(assert (=> b!1470883 m!1358069))

(declare-fun m!1358071 () Bool)

(assert (=> b!1470871 m!1358071))

(check-sat (not start!125844) (not b!1470873) (not b!1470875) (not b!1470871) (not b!1470881) (not b!1470883) (not b!1470878) (not b!1470872) (not b!1470879) (not b!1470880))
(check-sat)
