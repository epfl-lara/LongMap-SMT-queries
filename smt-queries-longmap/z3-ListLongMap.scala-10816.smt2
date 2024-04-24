; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126822 () Bool)

(assert start!126822)

(declare-fun b!1486634 () Bool)

(declare-fun e!833573 () Bool)

(declare-fun e!833571 () Bool)

(assert (=> b!1486634 (= e!833573 e!833571)))

(declare-fun res!1010281 () Bool)

(assert (=> b!1486634 (=> (not res!1010281) (not e!833571))))

(declare-fun lt!648559 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486634 (= res!1010281 (and (= index!646 intermediateAfterIndex!19) (= lt!648559 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486636 () Bool)

(declare-fun e!833580 () Bool)

(declare-fun e!833572 () Bool)

(assert (=> b!1486636 (= e!833580 e!833572)))

(declare-fun res!1010268 () Bool)

(assert (=> b!1486636 (=> (not res!1010268) (not e!833572))))

(declare-datatypes ((SeekEntryResult!12219 0))(
  ( (MissingZero!12219 (index!51268 (_ BitVec 32))) (Found!12219 (index!51269 (_ BitVec 32))) (Intermediate!12219 (undefined!13031 Bool) (index!51270 (_ BitVec 32)) (x!133032 (_ BitVec 32))) (Undefined!12219) (MissingVacant!12219 (index!51271 (_ BitVec 32))) )
))
(declare-fun lt!648563 () SeekEntryResult!12219)

(declare-datatypes ((array!99622 0))(
  ( (array!99623 (arr!48082 (Array (_ BitVec 32) (_ BitVec 64))) (size!48633 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99622)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99622 (_ BitVec 32)) SeekEntryResult!12219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486636 (= res!1010268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48082 a!2862) j!93) mask!2687) (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!648563))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486636 (= lt!648563 (Intermediate!12219 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486637 () Bool)

(declare-fun res!1010272 () Bool)

(declare-fun e!833574 () Bool)

(assert (=> b!1486637 (=> (not res!1010272) (not e!833574))))

(declare-datatypes ((List!34570 0))(
  ( (Nil!34567) (Cons!34566 (h!35954 (_ BitVec 64)) (t!49256 List!34570)) )
))
(declare-fun arrayNoDuplicates!0 (array!99622 (_ BitVec 32) List!34570) Bool)

(assert (=> b!1486637 (= res!1010272 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34567))))

(declare-fun b!1486638 () Bool)

(declare-fun res!1010283 () Bool)

(assert (=> b!1486638 (=> (not res!1010283) (not e!833572))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1486638 (= res!1010283 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!648563))))

(declare-fun b!1486639 () Bool)

(declare-fun res!1010282 () Bool)

(assert (=> b!1486639 (=> (not res!1010282) (not e!833574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486639 (= res!1010282 (validKeyInArray!0 (select (arr!48082 a!2862) j!93)))))

(declare-fun lt!648565 () array!99622)

(declare-fun e!833579 () Bool)

(declare-fun lt!648560 () (_ BitVec 64))

(declare-fun b!1486640 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99622 (_ BitVec 32)) SeekEntryResult!12219)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99622 (_ BitVec 32)) SeekEntryResult!12219)

(assert (=> b!1486640 (= e!833579 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648560 lt!648565 mask!2687) (seekEntryOrOpen!0 lt!648560 lt!648565 mask!2687)))))

(declare-fun b!1486641 () Bool)

(assert (=> b!1486641 (= e!833571 (= (seekEntryOrOpen!0 lt!648560 lt!648565 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648560 lt!648565 mask!2687)))))

(declare-fun b!1486642 () Bool)

(declare-fun res!1010279 () Bool)

(assert (=> b!1486642 (=> (not res!1010279) (not e!833574))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486642 (= res!1010279 (and (= (size!48633 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48633 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48633 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486643 () Bool)

(declare-fun e!833578 () Bool)

(assert (=> b!1486643 (= e!833578 true)))

(declare-fun lt!648562 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486643 (= lt!648562 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1486644 () Bool)

(declare-fun e!833577 () Bool)

(assert (=> b!1486644 (= e!833572 e!833577)))

(declare-fun res!1010277 () Bool)

(assert (=> b!1486644 (=> (not res!1010277) (not e!833577))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!648564 () SeekEntryResult!12219)

(assert (=> b!1486644 (= res!1010277 (= lt!648564 (Intermediate!12219 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486644 (= lt!648564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648560 mask!2687) lt!648560 lt!648565 mask!2687))))

(assert (=> b!1486644 (= lt!648560 (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486645 () Bool)

(assert (=> b!1486645 (= e!833577 (not e!833578))))

(declare-fun res!1010275 () Bool)

(assert (=> b!1486645 (=> res!1010275 e!833578)))

(assert (=> b!1486645 (= res!1010275 (or (and (= (select (arr!48082 a!2862) index!646) (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48082 a!2862) index!646) (select (arr!48082 a!2862) j!93))) (= (select (arr!48082 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833576 () Bool)

(assert (=> b!1486645 e!833576))

(declare-fun res!1010271 () Bool)

(assert (=> b!1486645 (=> (not res!1010271) (not e!833576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99622 (_ BitVec 32)) Bool)

(assert (=> b!1486645 (= res!1010271 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49811 0))(
  ( (Unit!49812) )
))
(declare-fun lt!648561 () Unit!49811)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49811)

(assert (=> b!1486645 (= lt!648561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486646 () Bool)

(declare-fun res!1010285 () Bool)

(assert (=> b!1486646 (=> (not res!1010285) (not e!833574))))

(assert (=> b!1486646 (= res!1010285 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48633 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48633 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48633 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1010278 () Bool)

(assert (=> start!126822 (=> (not res!1010278) (not e!833574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126822 (= res!1010278 (validMask!0 mask!2687))))

(assert (=> start!126822 e!833574))

(assert (=> start!126822 true))

(declare-fun array_inv!37363 (array!99622) Bool)

(assert (=> start!126822 (array_inv!37363 a!2862)))

(declare-fun b!1486635 () Bool)

(declare-fun res!1010270 () Bool)

(assert (=> b!1486635 (=> (not res!1010270) (not e!833577))))

(assert (=> b!1486635 (= res!1010270 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486647 () Bool)

(declare-fun res!1010276 () Bool)

(assert (=> b!1486647 (=> (not res!1010276) (not e!833576))))

(assert (=> b!1486647 (= res!1010276 (= (seekEntryOrOpen!0 (select (arr!48082 a!2862) j!93) a!2862 mask!2687) (Found!12219 j!93)))))

(declare-fun b!1486648 () Bool)

(declare-fun res!1010280 () Bool)

(assert (=> b!1486648 (=> (not res!1010280) (not e!833574))))

(assert (=> b!1486648 (= res!1010280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486649 () Bool)

(assert (=> b!1486649 (= e!833574 e!833580)))

(declare-fun res!1010269 () Bool)

(assert (=> b!1486649 (=> (not res!1010269) (not e!833580))))

(assert (=> b!1486649 (= res!1010269 (= (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486649 (= lt!648565 (array!99623 (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48633 a!2862)))))

(declare-fun b!1486650 () Bool)

(declare-fun res!1010273 () Bool)

(assert (=> b!1486650 (=> (not res!1010273) (not e!833576))))

(assert (=> b!1486650 (= res!1010273 (or (= (select (arr!48082 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48082 a!2862) intermediateBeforeIndex!19) (select (arr!48082 a!2862) j!93))))))

(declare-fun b!1486651 () Bool)

(declare-fun res!1010267 () Bool)

(assert (=> b!1486651 (=> (not res!1010267) (not e!833574))))

(assert (=> b!1486651 (= res!1010267 (validKeyInArray!0 (select (arr!48082 a!2862) i!1006)))))

(declare-fun b!1486652 () Bool)

(assert (=> b!1486652 (= e!833579 (= lt!648564 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648560 lt!648565 mask!2687)))))

(declare-fun b!1486653 () Bool)

(assert (=> b!1486653 (= e!833576 e!833573)))

(declare-fun res!1010284 () Bool)

(assert (=> b!1486653 (=> res!1010284 e!833573)))

(assert (=> b!1486653 (= res!1010284 (or (and (= (select (arr!48082 a!2862) index!646) lt!648559) (= (select (arr!48082 a!2862) index!646) (select (arr!48082 a!2862) j!93))) (= (select (arr!48082 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486653 (= lt!648559 (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486654 () Bool)

(declare-fun res!1010274 () Bool)

(assert (=> b!1486654 (=> (not res!1010274) (not e!833577))))

(assert (=> b!1486654 (= res!1010274 e!833579)))

(declare-fun c!137716 () Bool)

(assert (=> b!1486654 (= c!137716 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126822 res!1010278) b!1486642))

(assert (= (and b!1486642 res!1010279) b!1486651))

(assert (= (and b!1486651 res!1010267) b!1486639))

(assert (= (and b!1486639 res!1010282) b!1486648))

(assert (= (and b!1486648 res!1010280) b!1486637))

(assert (= (and b!1486637 res!1010272) b!1486646))

(assert (= (and b!1486646 res!1010285) b!1486649))

(assert (= (and b!1486649 res!1010269) b!1486636))

(assert (= (and b!1486636 res!1010268) b!1486638))

(assert (= (and b!1486638 res!1010283) b!1486644))

(assert (= (and b!1486644 res!1010277) b!1486654))

(assert (= (and b!1486654 c!137716) b!1486652))

(assert (= (and b!1486654 (not c!137716)) b!1486640))

(assert (= (and b!1486654 res!1010274) b!1486635))

(assert (= (and b!1486635 res!1010270) b!1486645))

(assert (= (and b!1486645 res!1010271) b!1486647))

(assert (= (and b!1486647 res!1010276) b!1486650))

(assert (= (and b!1486650 res!1010273) b!1486653))

(assert (= (and b!1486653 (not res!1010284)) b!1486634))

(assert (= (and b!1486634 res!1010281) b!1486641))

(assert (= (and b!1486645 (not res!1010275)) b!1486643))

(declare-fun m!1371835 () Bool)

(assert (=> b!1486645 m!1371835))

(declare-fun m!1371837 () Bool)

(assert (=> b!1486645 m!1371837))

(declare-fun m!1371839 () Bool)

(assert (=> b!1486645 m!1371839))

(declare-fun m!1371841 () Bool)

(assert (=> b!1486645 m!1371841))

(declare-fun m!1371843 () Bool)

(assert (=> b!1486645 m!1371843))

(declare-fun m!1371845 () Bool)

(assert (=> b!1486645 m!1371845))

(assert (=> b!1486649 m!1371837))

(declare-fun m!1371847 () Bool)

(assert (=> b!1486649 m!1371847))

(declare-fun m!1371849 () Bool)

(assert (=> b!1486651 m!1371849))

(assert (=> b!1486651 m!1371849))

(declare-fun m!1371851 () Bool)

(assert (=> b!1486651 m!1371851))

(declare-fun m!1371853 () Bool)

(assert (=> b!1486641 m!1371853))

(declare-fun m!1371855 () Bool)

(assert (=> b!1486641 m!1371855))

(assert (=> b!1486653 m!1371841))

(assert (=> b!1486653 m!1371845))

(assert (=> b!1486653 m!1371837))

(assert (=> b!1486653 m!1371839))

(assert (=> b!1486647 m!1371845))

(assert (=> b!1486647 m!1371845))

(declare-fun m!1371857 () Bool)

(assert (=> b!1486647 m!1371857))

(assert (=> b!1486636 m!1371845))

(assert (=> b!1486636 m!1371845))

(declare-fun m!1371859 () Bool)

(assert (=> b!1486636 m!1371859))

(assert (=> b!1486636 m!1371859))

(assert (=> b!1486636 m!1371845))

(declare-fun m!1371861 () Bool)

(assert (=> b!1486636 m!1371861))

(declare-fun m!1371863 () Bool)

(assert (=> start!126822 m!1371863))

(declare-fun m!1371865 () Bool)

(assert (=> start!126822 m!1371865))

(assert (=> b!1486639 m!1371845))

(assert (=> b!1486639 m!1371845))

(declare-fun m!1371867 () Bool)

(assert (=> b!1486639 m!1371867))

(declare-fun m!1371869 () Bool)

(assert (=> b!1486650 m!1371869))

(assert (=> b!1486650 m!1371845))

(declare-fun m!1371871 () Bool)

(assert (=> b!1486637 m!1371871))

(assert (=> b!1486638 m!1371845))

(assert (=> b!1486638 m!1371845))

(declare-fun m!1371873 () Bool)

(assert (=> b!1486638 m!1371873))

(declare-fun m!1371875 () Bool)

(assert (=> b!1486643 m!1371875))

(assert (=> b!1486640 m!1371855))

(assert (=> b!1486640 m!1371853))

(declare-fun m!1371877 () Bool)

(assert (=> b!1486644 m!1371877))

(assert (=> b!1486644 m!1371877))

(declare-fun m!1371879 () Bool)

(assert (=> b!1486644 m!1371879))

(assert (=> b!1486644 m!1371837))

(declare-fun m!1371881 () Bool)

(assert (=> b!1486644 m!1371881))

(declare-fun m!1371883 () Bool)

(assert (=> b!1486648 m!1371883))

(declare-fun m!1371885 () Bool)

(assert (=> b!1486652 m!1371885))

(check-sat (not b!1486640) (not b!1486637) (not b!1486648) (not b!1486651) (not b!1486643) (not b!1486645) (not b!1486636) (not b!1486638) (not start!126822) (not b!1486644) (not b!1486652) (not b!1486639) (not b!1486647) (not b!1486641))
(check-sat)
