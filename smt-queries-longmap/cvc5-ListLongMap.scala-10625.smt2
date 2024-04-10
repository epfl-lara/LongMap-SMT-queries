; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124888 () Bool)

(assert start!124888)

(declare-fun b!1450583 () Bool)

(declare-fun e!816822 () Bool)

(declare-fun e!816816 () Bool)

(assert (=> b!1450583 (= e!816822 e!816816)))

(declare-fun res!981915 () Bool)

(assert (=> b!1450583 (=> (not res!981915) (not e!816816))))

(declare-datatypes ((SeekEntryResult!11708 0))(
  ( (MissingZero!11708 (index!49224 (_ BitVec 32))) (Found!11708 (index!49225 (_ BitVec 32))) (Intermediate!11708 (undefined!12520 Bool) (index!49226 (_ BitVec 32)) (x!130885 (_ BitVec 32))) (Undefined!11708) (MissingVacant!11708 (index!49227 (_ BitVec 32))) )
))
(declare-fun lt!636351 () SeekEntryResult!11708)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98336 0))(
  ( (array!98337 (arr!47456 (Array (_ BitVec 32) (_ BitVec 64))) (size!48006 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98336)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98336 (_ BitVec 32)) SeekEntryResult!11708)

(assert (=> b!1450583 (= res!981915 (= lt!636351 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47456 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450584 () Bool)

(declare-fun e!816821 () Bool)

(declare-fun e!816823 () Bool)

(assert (=> b!1450584 (= e!816821 (not e!816823))))

(declare-fun res!981913 () Bool)

(assert (=> b!1450584 (=> res!981913 e!816823)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450584 (= res!981913 (or (and (= (select (arr!47456 a!2862) index!646) (select (store (arr!47456 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47456 a!2862) index!646) (select (arr!47456 a!2862) j!93))) (not (= (select (arr!47456 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47456 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816815 () Bool)

(assert (=> b!1450584 e!816815))

(declare-fun res!981910 () Bool)

(assert (=> b!1450584 (=> (not res!981910) (not e!816815))))

(declare-fun lt!636350 () SeekEntryResult!11708)

(assert (=> b!1450584 (= res!981910 (and (= lt!636351 lt!636350) (or (= (select (arr!47456 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47456 a!2862) intermediateBeforeIndex!19) (select (arr!47456 a!2862) j!93)))))))

(assert (=> b!1450584 (= lt!636350 (Found!11708 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98336 (_ BitVec 32)) SeekEntryResult!11708)

(assert (=> b!1450584 (= lt!636351 (seekEntryOrOpen!0 (select (arr!47456 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98336 (_ BitVec 32)) Bool)

(assert (=> b!1450584 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48912 0))(
  ( (Unit!48913) )
))
(declare-fun lt!636356 () Unit!48912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48912)

(assert (=> b!1450584 (= lt!636356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450585 () Bool)

(declare-fun res!981923 () Bool)

(declare-fun e!816820 () Bool)

(assert (=> b!1450585 (=> (not res!981923) (not e!816820))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450585 (= res!981923 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48006 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48006 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48006 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450586 () Bool)

(declare-fun res!981912 () Bool)

(assert (=> b!1450586 (=> (not res!981912) (not e!816820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450586 (= res!981912 (validKeyInArray!0 (select (arr!47456 a!2862) j!93)))))

(declare-fun b!1450587 () Bool)

(declare-fun res!981909 () Bool)

(declare-fun e!816818 () Bool)

(assert (=> b!1450587 (=> (not res!981909) (not e!816818))))

(declare-fun lt!636357 () SeekEntryResult!11708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98336 (_ BitVec 32)) SeekEntryResult!11708)

(assert (=> b!1450587 (= res!981909 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47456 a!2862) j!93) a!2862 mask!2687) lt!636357))))

(declare-fun b!1450588 () Bool)

(declare-fun e!816819 () Bool)

(assert (=> b!1450588 (= e!816820 e!816819)))

(declare-fun res!981914 () Bool)

(assert (=> b!1450588 (=> (not res!981914) (not e!816819))))

(assert (=> b!1450588 (= res!981914 (= (select (store (arr!47456 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636354 () array!98336)

(assert (=> b!1450588 (= lt!636354 (array!98337 (store (arr!47456 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48006 a!2862)))))

(declare-fun e!816817 () Bool)

(declare-fun b!1450589 () Bool)

(declare-fun lt!636353 () (_ BitVec 64))

(assert (=> b!1450589 (= e!816817 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636353 lt!636354 mask!2687) (seekEntryOrOpen!0 lt!636353 lt!636354 mask!2687)))))

(declare-fun b!1450590 () Bool)

(assert (=> b!1450590 (= e!816819 e!816818)))

(declare-fun res!981922 () Bool)

(assert (=> b!1450590 (=> (not res!981922) (not e!816818))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450590 (= res!981922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47456 a!2862) j!93) mask!2687) (select (arr!47456 a!2862) j!93) a!2862 mask!2687) lt!636357))))

(assert (=> b!1450590 (= lt!636357 (Intermediate!11708 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450591 () Bool)

(declare-fun res!981919 () Bool)

(assert (=> b!1450591 (=> (not res!981919) (not e!816821))))

(assert (=> b!1450591 (= res!981919 e!816817)))

(declare-fun c!133848 () Bool)

(assert (=> b!1450591 (= c!133848 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450592 () Bool)

(declare-fun res!981920 () Bool)

(assert (=> b!1450592 (=> res!981920 e!816823)))

(assert (=> b!1450592 (= res!981920 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47456 a!2862) j!93) a!2862 mask!2687) lt!636350)))))

(declare-fun res!981925 () Bool)

(assert (=> start!124888 (=> (not res!981925) (not e!816820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124888 (= res!981925 (validMask!0 mask!2687))))

(assert (=> start!124888 e!816820))

(assert (=> start!124888 true))

(declare-fun array_inv!36484 (array!98336) Bool)

(assert (=> start!124888 (array_inv!36484 a!2862)))

(declare-fun b!1450593 () Bool)

(declare-fun res!981917 () Bool)

(assert (=> b!1450593 (=> (not res!981917) (not e!816820))))

(assert (=> b!1450593 (= res!981917 (validKeyInArray!0 (select (arr!47456 a!2862) i!1006)))))

(declare-fun b!1450594 () Bool)

(assert (=> b!1450594 (= e!816815 e!816822)))

(declare-fun res!981908 () Bool)

(assert (=> b!1450594 (=> res!981908 e!816822)))

(assert (=> b!1450594 (= res!981908 (or (and (= (select (arr!47456 a!2862) index!646) (select (store (arr!47456 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47456 a!2862) index!646) (select (arr!47456 a!2862) j!93))) (not (= (select (arr!47456 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450595 () Bool)

(assert (=> b!1450595 (= e!816816 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450596 () Bool)

(declare-fun res!981918 () Bool)

(assert (=> b!1450596 (=> (not res!981918) (not e!816821))))

(assert (=> b!1450596 (= res!981918 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450597 () Bool)

(declare-fun res!981911 () Bool)

(assert (=> b!1450597 (=> (not res!981911) (not e!816820))))

(assert (=> b!1450597 (= res!981911 (and (= (size!48006 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48006 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48006 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450598 () Bool)

(assert (=> b!1450598 (= e!816818 e!816821)))

(declare-fun res!981924 () Bool)

(assert (=> b!1450598 (=> (not res!981924) (not e!816821))))

(declare-fun lt!636355 () SeekEntryResult!11708)

(assert (=> b!1450598 (= res!981924 (= lt!636355 (Intermediate!11708 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1450598 (= lt!636355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636353 mask!2687) lt!636353 lt!636354 mask!2687))))

(assert (=> b!1450598 (= lt!636353 (select (store (arr!47456 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450599 () Bool)

(declare-fun res!981916 () Bool)

(assert (=> b!1450599 (=> (not res!981916) (not e!816820))))

(assert (=> b!1450599 (= res!981916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450600 () Bool)

(assert (=> b!1450600 (= e!816823 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1450600 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636353 lt!636354 mask!2687) lt!636350)))

(declare-fun lt!636352 () Unit!48912)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48912)

(assert (=> b!1450600 (= lt!636352 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450601 () Bool)

(declare-fun res!981921 () Bool)

(assert (=> b!1450601 (=> (not res!981921) (not e!816820))))

(declare-datatypes ((List!33957 0))(
  ( (Nil!33954) (Cons!33953 (h!35303 (_ BitVec 64)) (t!48651 List!33957)) )
))
(declare-fun arrayNoDuplicates!0 (array!98336 (_ BitVec 32) List!33957) Bool)

(assert (=> b!1450601 (= res!981921 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33954))))

(declare-fun b!1450602 () Bool)

(assert (=> b!1450602 (= e!816817 (= lt!636355 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636353 lt!636354 mask!2687)))))

(assert (= (and start!124888 res!981925) b!1450597))

(assert (= (and b!1450597 res!981911) b!1450593))

(assert (= (and b!1450593 res!981917) b!1450586))

(assert (= (and b!1450586 res!981912) b!1450599))

(assert (= (and b!1450599 res!981916) b!1450601))

(assert (= (and b!1450601 res!981921) b!1450585))

(assert (= (and b!1450585 res!981923) b!1450588))

(assert (= (and b!1450588 res!981914) b!1450590))

(assert (= (and b!1450590 res!981922) b!1450587))

(assert (= (and b!1450587 res!981909) b!1450598))

(assert (= (and b!1450598 res!981924) b!1450591))

(assert (= (and b!1450591 c!133848) b!1450602))

(assert (= (and b!1450591 (not c!133848)) b!1450589))

(assert (= (and b!1450591 res!981919) b!1450596))

(assert (= (and b!1450596 res!981918) b!1450584))

(assert (= (and b!1450584 res!981910) b!1450594))

(assert (= (and b!1450594 (not res!981908)) b!1450583))

(assert (= (and b!1450583 res!981915) b!1450595))

(assert (= (and b!1450584 (not res!981913)) b!1450592))

(assert (= (and b!1450592 (not res!981920)) b!1450600))

(declare-fun m!1339219 () Bool)

(assert (=> b!1450587 m!1339219))

(assert (=> b!1450587 m!1339219))

(declare-fun m!1339221 () Bool)

(assert (=> b!1450587 m!1339221))

(declare-fun m!1339223 () Bool)

(assert (=> b!1450598 m!1339223))

(assert (=> b!1450598 m!1339223))

(declare-fun m!1339225 () Bool)

(assert (=> b!1450598 m!1339225))

(declare-fun m!1339227 () Bool)

(assert (=> b!1450598 m!1339227))

(declare-fun m!1339229 () Bool)

(assert (=> b!1450598 m!1339229))

(declare-fun m!1339231 () Bool)

(assert (=> b!1450601 m!1339231))

(declare-fun m!1339233 () Bool)

(assert (=> b!1450594 m!1339233))

(assert (=> b!1450594 m!1339227))

(declare-fun m!1339235 () Bool)

(assert (=> b!1450594 m!1339235))

(assert (=> b!1450594 m!1339219))

(declare-fun m!1339237 () Bool)

(assert (=> b!1450589 m!1339237))

(declare-fun m!1339239 () Bool)

(assert (=> b!1450589 m!1339239))

(declare-fun m!1339241 () Bool)

(assert (=> b!1450599 m!1339241))

(assert (=> b!1450592 m!1339219))

(assert (=> b!1450592 m!1339219))

(declare-fun m!1339243 () Bool)

(assert (=> b!1450592 m!1339243))

(declare-fun m!1339245 () Bool)

(assert (=> b!1450584 m!1339245))

(assert (=> b!1450584 m!1339227))

(declare-fun m!1339247 () Bool)

(assert (=> b!1450584 m!1339247))

(assert (=> b!1450584 m!1339235))

(assert (=> b!1450584 m!1339233))

(assert (=> b!1450584 m!1339219))

(declare-fun m!1339249 () Bool)

(assert (=> b!1450584 m!1339249))

(declare-fun m!1339251 () Bool)

(assert (=> b!1450584 m!1339251))

(assert (=> b!1450584 m!1339219))

(assert (=> b!1450600 m!1339237))

(declare-fun m!1339253 () Bool)

(assert (=> b!1450600 m!1339253))

(assert (=> b!1450590 m!1339219))

(assert (=> b!1450590 m!1339219))

(declare-fun m!1339255 () Bool)

(assert (=> b!1450590 m!1339255))

(assert (=> b!1450590 m!1339255))

(assert (=> b!1450590 m!1339219))

(declare-fun m!1339257 () Bool)

(assert (=> b!1450590 m!1339257))

(declare-fun m!1339259 () Bool)

(assert (=> b!1450602 m!1339259))

(assert (=> b!1450588 m!1339227))

(declare-fun m!1339261 () Bool)

(assert (=> b!1450588 m!1339261))

(declare-fun m!1339263 () Bool)

(assert (=> start!124888 m!1339263))

(declare-fun m!1339265 () Bool)

(assert (=> start!124888 m!1339265))

(assert (=> b!1450583 m!1339219))

(assert (=> b!1450583 m!1339219))

(declare-fun m!1339267 () Bool)

(assert (=> b!1450583 m!1339267))

(declare-fun m!1339269 () Bool)

(assert (=> b!1450593 m!1339269))

(assert (=> b!1450593 m!1339269))

(declare-fun m!1339271 () Bool)

(assert (=> b!1450593 m!1339271))

(assert (=> b!1450586 m!1339219))

(assert (=> b!1450586 m!1339219))

(declare-fun m!1339273 () Bool)

(assert (=> b!1450586 m!1339273))

(push 1)

