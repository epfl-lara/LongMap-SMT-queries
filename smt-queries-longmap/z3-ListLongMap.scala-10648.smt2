; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125244 () Bool)

(assert start!125244)

(declare-fun b!1455829 () Bool)

(declare-fun res!985849 () Bool)

(declare-fun e!819397 () Bool)

(assert (=> b!1455829 (=> (not res!985849) (not e!819397))))

(declare-datatypes ((array!98587 0))(
  ( (array!98588 (arr!47578 (Array (_ BitVec 32) (_ BitVec 64))) (size!48129 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98587)

(declare-datatypes ((List!34066 0))(
  ( (Nil!34063) (Cons!34062 (h!35423 (_ BitVec 64)) (t!48752 List!34066)) )
))
(declare-fun arrayNoDuplicates!0 (array!98587 (_ BitVec 32) List!34066) Bool)

(assert (=> b!1455829 (= res!985849 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34063))))

(declare-fun b!1455830 () Bool)

(declare-fun e!819399 () Bool)

(declare-fun e!819398 () Bool)

(assert (=> b!1455830 (= e!819399 e!819398)))

(declare-fun res!985841 () Bool)

(assert (=> b!1455830 (=> res!985841 e!819398)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638089 () (_ BitVec 32))

(assert (=> b!1455830 (= res!985841 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638089 #b00000000000000000000000000000000) (bvsge lt!638089 (size!48129 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455830 (= lt!638089 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!638088 () (_ BitVec 64))

(declare-fun lt!638093 () array!98587)

(declare-datatypes ((SeekEntryResult!11727 0))(
  ( (MissingZero!11727 (index!49300 (_ BitVec 32))) (Found!11727 (index!49301 (_ BitVec 32))) (Intermediate!11727 (undefined!12539 Bool) (index!49302 (_ BitVec 32)) (x!131112 (_ BitVec 32))) (Undefined!11727) (MissingVacant!11727 (index!49303 (_ BitVec 32))) )
))
(declare-fun lt!638090 () SeekEntryResult!11727)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98587 (_ BitVec 32)) SeekEntryResult!11727)

(assert (=> b!1455830 (= lt!638090 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638088 lt!638093 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98587 (_ BitVec 32)) SeekEntryResult!11727)

(assert (=> b!1455830 (= lt!638090 (seekEntryOrOpen!0 lt!638088 lt!638093 mask!2687))))

(declare-fun res!985847 () Bool)

(assert (=> start!125244 (=> (not res!985847) (not e!819397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125244 (= res!985847 (validMask!0 mask!2687))))

(assert (=> start!125244 e!819397))

(assert (=> start!125244 true))

(declare-fun array_inv!36859 (array!98587) Bool)

(assert (=> start!125244 (array_inv!36859 a!2862)))

(declare-fun b!1455831 () Bool)

(declare-fun res!985839 () Bool)

(assert (=> b!1455831 (=> (not res!985839) (not e!819397))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455831 (= res!985839 (and (= (size!48129 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48129 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48129 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455832 () Bool)

(declare-fun res!985850 () Bool)

(declare-fun e!819394 () Bool)

(assert (=> b!1455832 (=> (not res!985850) (not e!819394))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455832 (= res!985850 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1455833 () Bool)

(declare-fun e!819392 () Bool)

(assert (=> b!1455833 (= e!819392 (and (or (= (select (arr!47578 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47578 a!2862) intermediateBeforeIndex!19) (select (arr!47578 a!2862) j!93))) (let ((bdg!53072 (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47578 a!2862) index!646) bdg!53072) (= (select (arr!47578 a!2862) index!646) (select (arr!47578 a!2862) j!93))) (= (select (arr!47578 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53072 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455834 () Bool)

(declare-fun res!985840 () Bool)

(declare-fun e!819391 () Bool)

(assert (=> b!1455834 (=> (not res!985840) (not e!819391))))

(declare-fun lt!638094 () SeekEntryResult!11727)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98587 (_ BitVec 32)) SeekEntryResult!11727)

(assert (=> b!1455834 (= res!985840 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!638094))))

(declare-fun b!1455835 () Bool)

(declare-fun res!985848 () Bool)

(assert (=> b!1455835 (=> (not res!985848) (not e!819397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455835 (= res!985848 (validKeyInArray!0 (select (arr!47578 a!2862) j!93)))))

(declare-fun b!1455836 () Bool)

(declare-fun res!985856 () Bool)

(assert (=> b!1455836 (=> (not res!985856) (not e!819397))))

(assert (=> b!1455836 (= res!985856 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48129 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48129 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48129 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455837 () Bool)

(assert (=> b!1455837 (= e!819391 e!819394)))

(declare-fun res!985842 () Bool)

(assert (=> b!1455837 (=> (not res!985842) (not e!819394))))

(declare-fun lt!638091 () SeekEntryResult!11727)

(assert (=> b!1455837 (= res!985842 (= lt!638091 (Intermediate!11727 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455837 (= lt!638091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638088 mask!2687) lt!638088 lt!638093 mask!2687))))

(assert (=> b!1455837 (= lt!638088 (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455838 () Bool)

(declare-fun e!819393 () Bool)

(assert (=> b!1455838 (= e!819393 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638088 lt!638093 mask!2687) (seekEntryOrOpen!0 lt!638088 lt!638093 mask!2687)))))

(declare-fun b!1455839 () Bool)

(declare-fun e!819395 () Bool)

(assert (=> b!1455839 (= e!819397 e!819395)))

(declare-fun res!985846 () Bool)

(assert (=> b!1455839 (=> (not res!985846) (not e!819395))))

(assert (=> b!1455839 (= res!985846 (= (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455839 (= lt!638093 (array!98588 (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48129 a!2862)))))

(declare-fun b!1455840 () Bool)

(assert (=> b!1455840 (= e!819395 e!819391)))

(declare-fun res!985855 () Bool)

(assert (=> b!1455840 (=> (not res!985855) (not e!819391))))

(assert (=> b!1455840 (= res!985855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47578 a!2862) j!93) mask!2687) (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!638094))))

(assert (=> b!1455840 (= lt!638094 (Intermediate!11727 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455841 () Bool)

(assert (=> b!1455841 (= e!819394 (not e!819399))))

(declare-fun res!985853 () Bool)

(assert (=> b!1455841 (=> res!985853 e!819399)))

(assert (=> b!1455841 (= res!985853 (or (and (= (select (arr!47578 a!2862) index!646) (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47578 a!2862) index!646) (select (arr!47578 a!2862) j!93))) (= (select (arr!47578 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455841 e!819392))

(declare-fun res!985851 () Bool)

(assert (=> b!1455841 (=> (not res!985851) (not e!819392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98587 (_ BitVec 32)) Bool)

(assert (=> b!1455841 (= res!985851 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48983 0))(
  ( (Unit!48984) )
))
(declare-fun lt!638095 () Unit!48983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48983)

(assert (=> b!1455841 (= lt!638095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455842 () Bool)

(assert (=> b!1455842 (= e!819398 true)))

(declare-fun lt!638092 () Bool)

(declare-fun e!819396 () Bool)

(assert (=> b!1455842 (= lt!638092 e!819396)))

(declare-fun c!134514 () Bool)

(assert (=> b!1455842 (= c!134514 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455843 () Bool)

(assert (=> b!1455843 (= e!819396 (not (= lt!638091 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638089 lt!638088 lt!638093 mask!2687))))))

(declare-fun b!1455844 () Bool)

(declare-fun res!985845 () Bool)

(assert (=> b!1455844 (=> (not res!985845) (not e!819394))))

(assert (=> b!1455844 (= res!985845 e!819393)))

(declare-fun c!134515 () Bool)

(assert (=> b!1455844 (= c!134515 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455845 () Bool)

(declare-fun res!985852 () Bool)

(assert (=> b!1455845 (=> res!985852 e!819398)))

(assert (=> b!1455845 (= res!985852 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638089 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!638094)))))

(declare-fun b!1455846 () Bool)

(declare-fun res!985844 () Bool)

(assert (=> b!1455846 (=> (not res!985844) (not e!819397))))

(assert (=> b!1455846 (= res!985844 (validKeyInArray!0 (select (arr!47578 a!2862) i!1006)))))

(declare-fun b!1455847 () Bool)

(declare-fun res!985843 () Bool)

(assert (=> b!1455847 (=> (not res!985843) (not e!819392))))

(assert (=> b!1455847 (= res!985843 (= (seekEntryOrOpen!0 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) (Found!11727 j!93)))))

(declare-fun b!1455848 () Bool)

(assert (=> b!1455848 (= e!819393 (= lt!638091 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638088 lt!638093 mask!2687)))))

(declare-fun b!1455849 () Bool)

(declare-fun res!985854 () Bool)

(assert (=> b!1455849 (=> (not res!985854) (not e!819397))))

(assert (=> b!1455849 (= res!985854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455850 () Bool)

(assert (=> b!1455850 (= e!819396 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638089 intermediateAfterIndex!19 lt!638088 lt!638093 mask!2687) lt!638090)))))

(assert (= (and start!125244 res!985847) b!1455831))

(assert (= (and b!1455831 res!985839) b!1455846))

(assert (= (and b!1455846 res!985844) b!1455835))

(assert (= (and b!1455835 res!985848) b!1455849))

(assert (= (and b!1455849 res!985854) b!1455829))

(assert (= (and b!1455829 res!985849) b!1455836))

(assert (= (and b!1455836 res!985856) b!1455839))

(assert (= (and b!1455839 res!985846) b!1455840))

(assert (= (and b!1455840 res!985855) b!1455834))

(assert (= (and b!1455834 res!985840) b!1455837))

(assert (= (and b!1455837 res!985842) b!1455844))

(assert (= (and b!1455844 c!134515) b!1455848))

(assert (= (and b!1455844 (not c!134515)) b!1455838))

(assert (= (and b!1455844 res!985845) b!1455832))

(assert (= (and b!1455832 res!985850) b!1455841))

(assert (= (and b!1455841 res!985851) b!1455847))

(assert (= (and b!1455847 res!985843) b!1455833))

(assert (= (and b!1455841 (not res!985853)) b!1455830))

(assert (= (and b!1455830 (not res!985841)) b!1455845))

(assert (= (and b!1455845 (not res!985852)) b!1455842))

(assert (= (and b!1455842 c!134514) b!1455843))

(assert (= (and b!1455842 (not c!134514)) b!1455850))

(declare-fun m!1344277 () Bool)

(assert (=> b!1455841 m!1344277))

(declare-fun m!1344279 () Bool)

(assert (=> b!1455841 m!1344279))

(declare-fun m!1344281 () Bool)

(assert (=> b!1455841 m!1344281))

(declare-fun m!1344283 () Bool)

(assert (=> b!1455841 m!1344283))

(declare-fun m!1344285 () Bool)

(assert (=> b!1455841 m!1344285))

(declare-fun m!1344287 () Bool)

(assert (=> b!1455841 m!1344287))

(assert (=> b!1455839 m!1344279))

(declare-fun m!1344289 () Bool)

(assert (=> b!1455839 m!1344289))

(assert (=> b!1455835 m!1344287))

(assert (=> b!1455835 m!1344287))

(declare-fun m!1344291 () Bool)

(assert (=> b!1455835 m!1344291))

(assert (=> b!1455840 m!1344287))

(assert (=> b!1455840 m!1344287))

(declare-fun m!1344293 () Bool)

(assert (=> b!1455840 m!1344293))

(assert (=> b!1455840 m!1344293))

(assert (=> b!1455840 m!1344287))

(declare-fun m!1344295 () Bool)

(assert (=> b!1455840 m!1344295))

(declare-fun m!1344297 () Bool)

(assert (=> b!1455829 m!1344297))

(declare-fun m!1344299 () Bool)

(assert (=> b!1455850 m!1344299))

(declare-fun m!1344301 () Bool)

(assert (=> start!125244 m!1344301))

(declare-fun m!1344303 () Bool)

(assert (=> start!125244 m!1344303))

(assert (=> b!1455847 m!1344287))

(assert (=> b!1455847 m!1344287))

(declare-fun m!1344305 () Bool)

(assert (=> b!1455847 m!1344305))

(assert (=> b!1455845 m!1344287))

(assert (=> b!1455845 m!1344287))

(declare-fun m!1344307 () Bool)

(assert (=> b!1455845 m!1344307))

(declare-fun m!1344309 () Bool)

(assert (=> b!1455843 m!1344309))

(declare-fun m!1344311 () Bool)

(assert (=> b!1455849 m!1344311))

(declare-fun m!1344313 () Bool)

(assert (=> b!1455830 m!1344313))

(declare-fun m!1344315 () Bool)

(assert (=> b!1455830 m!1344315))

(declare-fun m!1344317 () Bool)

(assert (=> b!1455830 m!1344317))

(declare-fun m!1344319 () Bool)

(assert (=> b!1455846 m!1344319))

(assert (=> b!1455846 m!1344319))

(declare-fun m!1344321 () Bool)

(assert (=> b!1455846 m!1344321))

(assert (=> b!1455833 m!1344279))

(declare-fun m!1344323 () Bool)

(assert (=> b!1455833 m!1344323))

(assert (=> b!1455833 m!1344281))

(assert (=> b!1455833 m!1344283))

(assert (=> b!1455833 m!1344287))

(assert (=> b!1455834 m!1344287))

(assert (=> b!1455834 m!1344287))

(declare-fun m!1344325 () Bool)

(assert (=> b!1455834 m!1344325))

(assert (=> b!1455838 m!1344315))

(assert (=> b!1455838 m!1344317))

(declare-fun m!1344327 () Bool)

(assert (=> b!1455848 m!1344327))

(declare-fun m!1344329 () Bool)

(assert (=> b!1455837 m!1344329))

(assert (=> b!1455837 m!1344329))

(declare-fun m!1344331 () Bool)

(assert (=> b!1455837 m!1344331))

(assert (=> b!1455837 m!1344279))

(declare-fun m!1344333 () Bool)

(assert (=> b!1455837 m!1344333))

(check-sat (not b!1455834) (not b!1455843) (not b!1455835) (not b!1455846) (not b!1455838) (not b!1455848) (not b!1455849) (not b!1455841) (not b!1455840) (not b!1455847) (not b!1455829) (not b!1455850) (not start!125244) (not b!1455845) (not b!1455830) (not b!1455837))
(check-sat)
