; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125086 () Bool)

(assert start!125086)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638460 () (_ BitVec 64))

(declare-datatypes ((array!98512 0))(
  ( (array!98513 (arr!47545 (Array (_ BitVec 32) (_ BitVec 64))) (size!48097 (_ BitVec 32))) )
))
(declare-fun lt!638459 () array!98512)

(declare-datatypes ((SeekEntryResult!11822 0))(
  ( (MissingZero!11822 (index!49680 (_ BitVec 32))) (Found!11822 (index!49681 (_ BitVec 32))) (Intermediate!11822 (undefined!12634 Bool) (index!49682 (_ BitVec 32)) (x!131298 (_ BitVec 32))) (Undefined!11822) (MissingVacant!11822 (index!49683 (_ BitVec 32))) )
))
(declare-fun lt!638462 () SeekEntryResult!11822)

(declare-fun lt!638463 () (_ BitVec 32))

(declare-fun e!819786 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1457277 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98512 (_ BitVec 32)) SeekEntryResult!11822)

(assert (=> b!1457277 (= e!819786 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638463 intermediateAfterIndex!19 lt!638460 lt!638459 mask!2687) lt!638462)))))

(declare-fun b!1457278 () Bool)

(declare-fun res!987702 () Bool)

(declare-fun e!819795 () Bool)

(assert (=> b!1457278 (=> (not res!987702) (not e!819795))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98512)

(assert (=> b!1457278 (= res!987702 (and (= (size!48097 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48097 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48097 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457279 () Bool)

(declare-fun res!987705 () Bool)

(assert (=> b!1457279 (=> (not res!987705) (not e!819795))))

(declare-datatypes ((List!34124 0))(
  ( (Nil!34121) (Cons!34120 (h!35470 (_ BitVec 64)) (t!48810 List!34124)) )
))
(declare-fun arrayNoDuplicates!0 (array!98512 (_ BitVec 32) List!34124) Bool)

(assert (=> b!1457279 (= res!987705 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34121))))

(declare-fun e!819793 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1457280 () Bool)

(declare-fun lt!638456 () SeekEntryResult!11822)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98512 (_ BitVec 32)) SeekEntryResult!11822)

(assert (=> b!1457280 (= e!819793 (= lt!638456 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638460 lt!638459 mask!2687)))))

(declare-fun b!1457281 () Bool)

(declare-fun res!987700 () Bool)

(declare-fun e!819790 () Bool)

(assert (=> b!1457281 (=> (not res!987700) (not e!819790))))

(assert (=> b!1457281 (= res!987700 e!819793)))

(declare-fun c!134308 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457281 (= c!134308 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457282 () Bool)

(declare-fun res!987701 () Bool)

(declare-fun e!819788 () Bool)

(assert (=> b!1457282 (=> (not res!987701) (not e!819788))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98512 (_ BitVec 32)) SeekEntryResult!11822)

(assert (=> b!1457282 (= res!987701 (= (seekEntryOrOpen!0 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) (Found!11822 j!93)))))

(declare-fun b!1457283 () Bool)

(declare-fun e!819794 () Bool)

(assert (=> b!1457283 (= e!819794 e!819790)))

(declare-fun res!987703 () Bool)

(assert (=> b!1457283 (=> (not res!987703) (not e!819790))))

(assert (=> b!1457283 (= res!987703 (= lt!638456 (Intermediate!11822 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457283 (= lt!638456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638460 mask!2687) lt!638460 lt!638459 mask!2687))))

(assert (=> b!1457283 (= lt!638460 (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1457284 () Bool)

(assert (=> b!1457284 (= e!819788 (and (or (= (select (arr!47545 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47545 a!2862) intermediateBeforeIndex!19) (select (arr!47545 a!2862) j!93))) (let ((bdg!53341 (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47545 a!2862) index!646) bdg!53341) (= (select (arr!47545 a!2862) index!646) (select (arr!47545 a!2862) j!93))) (= (select (arr!47545 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53341 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457285 () Bool)

(declare-fun res!987697 () Bool)

(assert (=> b!1457285 (=> (not res!987697) (not e!819795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457285 (= res!987697 (validKeyInArray!0 (select (arr!47545 a!2862) i!1006)))))

(declare-fun b!1457286 () Bool)

(declare-fun res!987706 () Bool)

(assert (=> b!1457286 (=> (not res!987706) (not e!819794))))

(declare-fun lt!638457 () SeekEntryResult!11822)

(assert (=> b!1457286 (= res!987706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!638457))))

(declare-fun b!1457287 () Bool)

(assert (=> b!1457287 (= e!819793 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638460 lt!638459 mask!2687) (seekEntryOrOpen!0 lt!638460 lt!638459 mask!2687)))))

(declare-fun b!1457288 () Bool)

(declare-fun res!987694 () Bool)

(assert (=> b!1457288 (=> (not res!987694) (not e!819795))))

(assert (=> b!1457288 (= res!987694 (validKeyInArray!0 (select (arr!47545 a!2862) j!93)))))

(declare-fun b!1457289 () Bool)

(declare-fun e!819787 () Bool)

(assert (=> b!1457289 (= e!819787 e!819794)))

(declare-fun res!987695 () Bool)

(assert (=> b!1457289 (=> (not res!987695) (not e!819794))))

(assert (=> b!1457289 (= res!987695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47545 a!2862) j!93) mask!2687) (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!638457))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457289 (= lt!638457 (Intermediate!11822 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457290 () Bool)

(declare-fun res!987693 () Bool)

(assert (=> b!1457290 (=> (not res!987693) (not e!819790))))

(assert (=> b!1457290 (= res!987693 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457291 () Bool)

(declare-fun e!819789 () Bool)

(assert (=> b!1457291 (= e!819790 (not e!819789))))

(declare-fun res!987698 () Bool)

(assert (=> b!1457291 (=> res!987698 e!819789)))

(assert (=> b!1457291 (= res!987698 (or (and (= (select (arr!47545 a!2862) index!646) (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47545 a!2862) index!646) (select (arr!47545 a!2862) j!93))) (= (select (arr!47545 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457291 e!819788))

(declare-fun res!987690 () Bool)

(assert (=> b!1457291 (=> (not res!987690) (not e!819788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98512 (_ BitVec 32)) Bool)

(assert (=> b!1457291 (= res!987690 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48981 0))(
  ( (Unit!48982) )
))
(declare-fun lt!638461 () Unit!48981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48981)

(assert (=> b!1457291 (= lt!638461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457292 () Bool)

(assert (=> b!1457292 (= e!819795 e!819787)))

(declare-fun res!987699 () Bool)

(assert (=> b!1457292 (=> (not res!987699) (not e!819787))))

(assert (=> b!1457292 (= res!987699 (= (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457292 (= lt!638459 (array!98513 (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48097 a!2862)))))

(declare-fun b!1457293 () Bool)

(declare-fun e!819791 () Bool)

(assert (=> b!1457293 (= e!819791 true)))

(declare-fun lt!638458 () Bool)

(assert (=> b!1457293 (= lt!638458 e!819786)))

(declare-fun c!134307 () Bool)

(assert (=> b!1457293 (= c!134307 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457294 () Bool)

(assert (=> b!1457294 (= e!819789 e!819791)))

(declare-fun res!987691 () Bool)

(assert (=> b!1457294 (=> res!987691 e!819791)))

(assert (=> b!1457294 (= res!987691 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638463 #b00000000000000000000000000000000) (bvsge lt!638463 (size!48097 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457294 (= lt!638463 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457294 (= lt!638462 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638460 lt!638459 mask!2687))))

(assert (=> b!1457294 (= lt!638462 (seekEntryOrOpen!0 lt!638460 lt!638459 mask!2687))))

(declare-fun b!1457295 () Bool)

(declare-fun res!987689 () Bool)

(assert (=> b!1457295 (=> (not res!987689) (not e!819795))))

(assert (=> b!1457295 (= res!987689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!987692 () Bool)

(assert (=> start!125086 (=> (not res!987692) (not e!819795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125086 (= res!987692 (validMask!0 mask!2687))))

(assert (=> start!125086 e!819795))

(assert (=> start!125086 true))

(declare-fun array_inv!36778 (array!98512) Bool)

(assert (=> start!125086 (array_inv!36778 a!2862)))

(declare-fun b!1457296 () Bool)

(declare-fun res!987696 () Bool)

(assert (=> b!1457296 (=> (not res!987696) (not e!819795))))

(assert (=> b!1457296 (= res!987696 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48097 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48097 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48097 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457297 () Bool)

(assert (=> b!1457297 (= e!819786 (not (= lt!638456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638463 lt!638460 lt!638459 mask!2687))))))

(declare-fun b!1457298 () Bool)

(declare-fun res!987704 () Bool)

(assert (=> b!1457298 (=> res!987704 e!819791)))

(assert (=> b!1457298 (= res!987704 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638463 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!638457)))))

(assert (= (and start!125086 res!987692) b!1457278))

(assert (= (and b!1457278 res!987702) b!1457285))

(assert (= (and b!1457285 res!987697) b!1457288))

(assert (= (and b!1457288 res!987694) b!1457295))

(assert (= (and b!1457295 res!987689) b!1457279))

(assert (= (and b!1457279 res!987705) b!1457296))

(assert (= (and b!1457296 res!987696) b!1457292))

(assert (= (and b!1457292 res!987699) b!1457289))

(assert (= (and b!1457289 res!987695) b!1457286))

(assert (= (and b!1457286 res!987706) b!1457283))

(assert (= (and b!1457283 res!987703) b!1457281))

(assert (= (and b!1457281 c!134308) b!1457280))

(assert (= (and b!1457281 (not c!134308)) b!1457287))

(assert (= (and b!1457281 res!987700) b!1457290))

(assert (= (and b!1457290 res!987693) b!1457291))

(assert (= (and b!1457291 res!987690) b!1457282))

(assert (= (and b!1457282 res!987701) b!1457284))

(assert (= (and b!1457291 (not res!987698)) b!1457294))

(assert (= (and b!1457294 (not res!987691)) b!1457298))

(assert (= (and b!1457298 (not res!987704)) b!1457293))

(assert (= (and b!1457293 c!134307) b!1457297))

(assert (= (and b!1457293 (not c!134307)) b!1457277))

(declare-fun m!1344771 () Bool)

(assert (=> b!1457295 m!1344771))

(declare-fun m!1344773 () Bool)

(assert (=> b!1457287 m!1344773))

(declare-fun m!1344775 () Bool)

(assert (=> b!1457287 m!1344775))

(declare-fun m!1344777 () Bool)

(assert (=> b!1457283 m!1344777))

(assert (=> b!1457283 m!1344777))

(declare-fun m!1344779 () Bool)

(assert (=> b!1457283 m!1344779))

(declare-fun m!1344781 () Bool)

(assert (=> b!1457283 m!1344781))

(declare-fun m!1344783 () Bool)

(assert (=> b!1457283 m!1344783))

(declare-fun m!1344785 () Bool)

(assert (=> b!1457291 m!1344785))

(assert (=> b!1457291 m!1344781))

(declare-fun m!1344787 () Bool)

(assert (=> b!1457291 m!1344787))

(declare-fun m!1344789 () Bool)

(assert (=> b!1457291 m!1344789))

(declare-fun m!1344791 () Bool)

(assert (=> b!1457291 m!1344791))

(declare-fun m!1344793 () Bool)

(assert (=> b!1457291 m!1344793))

(declare-fun m!1344795 () Bool)

(assert (=> b!1457280 m!1344795))

(assert (=> b!1457289 m!1344793))

(assert (=> b!1457289 m!1344793))

(declare-fun m!1344797 () Bool)

(assert (=> b!1457289 m!1344797))

(assert (=> b!1457289 m!1344797))

(assert (=> b!1457289 m!1344793))

(declare-fun m!1344799 () Bool)

(assert (=> b!1457289 m!1344799))

(declare-fun m!1344801 () Bool)

(assert (=> b!1457297 m!1344801))

(declare-fun m!1344803 () Bool)

(assert (=> b!1457277 m!1344803))

(assert (=> b!1457288 m!1344793))

(assert (=> b!1457288 m!1344793))

(declare-fun m!1344805 () Bool)

(assert (=> b!1457288 m!1344805))

(assert (=> b!1457282 m!1344793))

(assert (=> b!1457282 m!1344793))

(declare-fun m!1344807 () Bool)

(assert (=> b!1457282 m!1344807))

(declare-fun m!1344809 () Bool)

(assert (=> start!125086 m!1344809))

(declare-fun m!1344811 () Bool)

(assert (=> start!125086 m!1344811))

(declare-fun m!1344813 () Bool)

(assert (=> b!1457285 m!1344813))

(assert (=> b!1457285 m!1344813))

(declare-fun m!1344815 () Bool)

(assert (=> b!1457285 m!1344815))

(assert (=> b!1457298 m!1344793))

(assert (=> b!1457298 m!1344793))

(declare-fun m!1344817 () Bool)

(assert (=> b!1457298 m!1344817))

(declare-fun m!1344819 () Bool)

(assert (=> b!1457279 m!1344819))

(assert (=> b!1457284 m!1344781))

(declare-fun m!1344821 () Bool)

(assert (=> b!1457284 m!1344821))

(assert (=> b!1457284 m!1344787))

(assert (=> b!1457284 m!1344789))

(assert (=> b!1457284 m!1344793))

(assert (=> b!1457286 m!1344793))

(assert (=> b!1457286 m!1344793))

(declare-fun m!1344823 () Bool)

(assert (=> b!1457286 m!1344823))

(assert (=> b!1457292 m!1344781))

(declare-fun m!1344825 () Bool)

(assert (=> b!1457292 m!1344825))

(declare-fun m!1344827 () Bool)

(assert (=> b!1457294 m!1344827))

(assert (=> b!1457294 m!1344773))

(assert (=> b!1457294 m!1344775))

(check-sat (not b!1457280) (not b!1457291) (not b!1457279) (not b!1457288) (not b!1457295) (not b!1457287) (not b!1457283) (not b!1457289) (not b!1457277) (not start!125086) (not b!1457286) (not b!1457297) (not b!1457294) (not b!1457298) (not b!1457285) (not b!1457282))
(check-sat)
