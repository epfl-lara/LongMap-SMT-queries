; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125116 () Bool)

(assert start!125116)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1458267 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98542 0))(
  ( (array!98543 (arr!47560 (Array (_ BitVec 32) (_ BitVec 64))) (size!48112 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98542)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun e!820244 () Bool)

(assert (=> b!1458267 (= e!820244 (and (or (= (select (arr!47560 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47560 a!2862) intermediateBeforeIndex!19) (select (arr!47560 a!2862) j!93))) (let ((bdg!53431 (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47560 a!2862) index!646) bdg!53431) (= (select (arr!47560 a!2862) index!646) (select (arr!47560 a!2862) j!93))) (= (select (arr!47560 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53431 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458268 () Bool)

(declare-fun res!988503 () Bool)

(declare-fun e!820241 () Bool)

(assert (=> b!1458268 (=> (not res!988503) (not e!820241))))

(declare-fun e!820240 () Bool)

(assert (=> b!1458268 (= res!988503 e!820240)))

(declare-fun c!134397 () Bool)

(assert (=> b!1458268 (= c!134397 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458269 () Bool)

(declare-fun res!988499 () Bool)

(assert (=> b!1458269 (=> (not res!988499) (not e!820241))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458269 (= res!988499 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458270 () Bool)

(declare-fun res!988506 () Bool)

(declare-fun e!820236 () Bool)

(assert (=> b!1458270 (=> (not res!988506) (not e!820236))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98542 (_ BitVec 32)) Bool)

(assert (=> b!1458270 (= res!988506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458271 () Bool)

(declare-fun res!988509 () Bool)

(assert (=> b!1458271 (=> (not res!988509) (not e!820236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458271 (= res!988509 (validKeyInArray!0 (select (arr!47560 a!2862) j!93)))))

(declare-fun b!1458272 () Bool)

(declare-fun e!820239 () Bool)

(declare-fun e!820245 () Bool)

(assert (=> b!1458272 (= e!820239 e!820245)))

(declare-fun res!988514 () Bool)

(assert (=> b!1458272 (=> res!988514 e!820245)))

(declare-fun lt!638819 () (_ BitVec 32))

(assert (=> b!1458272 (= res!988514 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638819 #b00000000000000000000000000000000) (bvsge lt!638819 (size!48112 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458272 (= lt!638819 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638816 () (_ BitVec 64))

(declare-fun lt!638821 () array!98542)

(declare-datatypes ((SeekEntryResult!11837 0))(
  ( (MissingZero!11837 (index!49740 (_ BitVec 32))) (Found!11837 (index!49741 (_ BitVec 32))) (Intermediate!11837 (undefined!12649 Bool) (index!49742 (_ BitVec 32)) (x!131353 (_ BitVec 32))) (Undefined!11837) (MissingVacant!11837 (index!49743 (_ BitVec 32))) )
))
(declare-fun lt!638822 () SeekEntryResult!11837)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98542 (_ BitVec 32)) SeekEntryResult!11837)

(assert (=> b!1458272 (= lt!638822 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638816 lt!638821 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98542 (_ BitVec 32)) SeekEntryResult!11837)

(assert (=> b!1458272 (= lt!638822 (seekEntryOrOpen!0 lt!638816 lt!638821 mask!2687))))

(declare-fun b!1458274 () Bool)

(declare-fun e!820242 () Bool)

(assert (=> b!1458274 (= e!820236 e!820242)))

(declare-fun res!988501 () Bool)

(assert (=> b!1458274 (=> (not res!988501) (not e!820242))))

(assert (=> b!1458274 (= res!988501 (= (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458274 (= lt!638821 (array!98543 (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48112 a!2862)))))

(declare-fun b!1458275 () Bool)

(assert (=> b!1458275 (= e!820241 (not e!820239))))

(declare-fun res!988511 () Bool)

(assert (=> b!1458275 (=> res!988511 e!820239)))

(assert (=> b!1458275 (= res!988511 (or (and (= (select (arr!47560 a!2862) index!646) (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47560 a!2862) index!646) (select (arr!47560 a!2862) j!93))) (= (select (arr!47560 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458275 e!820244))

(declare-fun res!988516 () Bool)

(assert (=> b!1458275 (=> (not res!988516) (not e!820244))))

(assert (=> b!1458275 (= res!988516 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49011 0))(
  ( (Unit!49012) )
))
(declare-fun lt!638820 () Unit!49011)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49011)

(assert (=> b!1458275 (= lt!638820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458276 () Bool)

(declare-fun res!988513 () Bool)

(assert (=> b!1458276 (=> (not res!988513) (not e!820236))))

(assert (=> b!1458276 (= res!988513 (and (= (size!48112 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48112 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48112 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458277 () Bool)

(declare-fun res!988505 () Bool)

(assert (=> b!1458277 (=> (not res!988505) (not e!820236))))

(assert (=> b!1458277 (= res!988505 (validKeyInArray!0 (select (arr!47560 a!2862) i!1006)))))

(declare-fun b!1458278 () Bool)

(declare-fun res!988504 () Bool)

(assert (=> b!1458278 (=> (not res!988504) (not e!820236))))

(declare-datatypes ((List!34139 0))(
  ( (Nil!34136) (Cons!34135 (h!35485 (_ BitVec 64)) (t!48825 List!34139)) )
))
(declare-fun arrayNoDuplicates!0 (array!98542 (_ BitVec 32) List!34139) Bool)

(assert (=> b!1458278 (= res!988504 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34136))))

(declare-fun lt!638818 () SeekEntryResult!11837)

(declare-fun b!1458279 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98542 (_ BitVec 32)) SeekEntryResult!11837)

(assert (=> b!1458279 (= e!820240 (= lt!638818 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638816 lt!638821 mask!2687)))))

(declare-fun b!1458280 () Bool)

(declare-fun res!988502 () Bool)

(assert (=> b!1458280 (=> (not res!988502) (not e!820244))))

(assert (=> b!1458280 (= res!988502 (= (seekEntryOrOpen!0 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) (Found!11837 j!93)))))

(declare-fun b!1458281 () Bool)

(assert (=> b!1458281 (= e!820240 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638816 lt!638821 mask!2687) (seekEntryOrOpen!0 lt!638816 lt!638821 mask!2687)))))

(declare-fun b!1458282 () Bool)

(declare-fun e!820238 () Bool)

(assert (=> b!1458282 (= e!820238 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638819 intermediateAfterIndex!19 lt!638816 lt!638821 mask!2687) lt!638822)))))

(declare-fun b!1458283 () Bool)

(declare-fun res!988507 () Bool)

(assert (=> b!1458283 (=> (not res!988507) (not e!820236))))

(assert (=> b!1458283 (= res!988507 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48112 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48112 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48112 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458284 () Bool)

(declare-fun e!820237 () Bool)

(assert (=> b!1458284 (= e!820237 e!820241)))

(declare-fun res!988515 () Bool)

(assert (=> b!1458284 (=> (not res!988515) (not e!820241))))

(assert (=> b!1458284 (= res!988515 (= lt!638818 (Intermediate!11837 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458284 (= lt!638818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638816 mask!2687) lt!638816 lt!638821 mask!2687))))

(assert (=> b!1458284 (= lt!638816 (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458273 () Bool)

(declare-fun res!988508 () Bool)

(assert (=> b!1458273 (=> res!988508 e!820245)))

(declare-fun lt!638823 () SeekEntryResult!11837)

(assert (=> b!1458273 (= res!988508 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638819 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!638823)))))

(declare-fun res!988500 () Bool)

(assert (=> start!125116 (=> (not res!988500) (not e!820236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125116 (= res!988500 (validMask!0 mask!2687))))

(assert (=> start!125116 e!820236))

(assert (=> start!125116 true))

(declare-fun array_inv!36793 (array!98542) Bool)

(assert (=> start!125116 (array_inv!36793 a!2862)))

(declare-fun b!1458285 () Bool)

(declare-fun res!988510 () Bool)

(assert (=> b!1458285 (=> (not res!988510) (not e!820237))))

(assert (=> b!1458285 (= res!988510 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!638823))))

(declare-fun b!1458286 () Bool)

(assert (=> b!1458286 (= e!820242 e!820237)))

(declare-fun res!988512 () Bool)

(assert (=> b!1458286 (=> (not res!988512) (not e!820237))))

(assert (=> b!1458286 (= res!988512 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47560 a!2862) j!93) mask!2687) (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!638823))))

(assert (=> b!1458286 (= lt!638823 (Intermediate!11837 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458287 () Bool)

(assert (=> b!1458287 (= e!820245 true)))

(declare-fun lt!638817 () Bool)

(assert (=> b!1458287 (= lt!638817 e!820238)))

(declare-fun c!134398 () Bool)

(assert (=> b!1458287 (= c!134398 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458288 () Bool)

(assert (=> b!1458288 (= e!820238 (not (= lt!638818 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638819 lt!638816 lt!638821 mask!2687))))))

(assert (= (and start!125116 res!988500) b!1458276))

(assert (= (and b!1458276 res!988513) b!1458277))

(assert (= (and b!1458277 res!988505) b!1458271))

(assert (= (and b!1458271 res!988509) b!1458270))

(assert (= (and b!1458270 res!988506) b!1458278))

(assert (= (and b!1458278 res!988504) b!1458283))

(assert (= (and b!1458283 res!988507) b!1458274))

(assert (= (and b!1458274 res!988501) b!1458286))

(assert (= (and b!1458286 res!988512) b!1458285))

(assert (= (and b!1458285 res!988510) b!1458284))

(assert (= (and b!1458284 res!988515) b!1458268))

(assert (= (and b!1458268 c!134397) b!1458279))

(assert (= (and b!1458268 (not c!134397)) b!1458281))

(assert (= (and b!1458268 res!988503) b!1458269))

(assert (= (and b!1458269 res!988499) b!1458275))

(assert (= (and b!1458275 res!988516) b!1458280))

(assert (= (and b!1458280 res!988502) b!1458267))

(assert (= (and b!1458275 (not res!988511)) b!1458272))

(assert (= (and b!1458272 (not res!988514)) b!1458273))

(assert (= (and b!1458273 (not res!988508)) b!1458287))

(assert (= (and b!1458287 c!134398) b!1458288))

(assert (= (and b!1458287 (not c!134398)) b!1458282))

(declare-fun m!1345641 () Bool)

(assert (=> b!1458285 m!1345641))

(assert (=> b!1458285 m!1345641))

(declare-fun m!1345643 () Bool)

(assert (=> b!1458285 m!1345643))

(declare-fun m!1345645 () Bool)

(assert (=> b!1458279 m!1345645))

(declare-fun m!1345647 () Bool)

(assert (=> b!1458275 m!1345647))

(declare-fun m!1345649 () Bool)

(assert (=> b!1458275 m!1345649))

(declare-fun m!1345651 () Bool)

(assert (=> b!1458275 m!1345651))

(declare-fun m!1345653 () Bool)

(assert (=> b!1458275 m!1345653))

(declare-fun m!1345655 () Bool)

(assert (=> b!1458275 m!1345655))

(assert (=> b!1458275 m!1345641))

(assert (=> b!1458273 m!1345641))

(assert (=> b!1458273 m!1345641))

(declare-fun m!1345657 () Bool)

(assert (=> b!1458273 m!1345657))

(assert (=> b!1458286 m!1345641))

(assert (=> b!1458286 m!1345641))

(declare-fun m!1345659 () Bool)

(assert (=> b!1458286 m!1345659))

(assert (=> b!1458286 m!1345659))

(assert (=> b!1458286 m!1345641))

(declare-fun m!1345661 () Bool)

(assert (=> b!1458286 m!1345661))

(assert (=> b!1458267 m!1345649))

(declare-fun m!1345663 () Bool)

(assert (=> b!1458267 m!1345663))

(assert (=> b!1458267 m!1345651))

(assert (=> b!1458267 m!1345653))

(assert (=> b!1458267 m!1345641))

(declare-fun m!1345665 () Bool)

(assert (=> b!1458284 m!1345665))

(assert (=> b!1458284 m!1345665))

(declare-fun m!1345667 () Bool)

(assert (=> b!1458284 m!1345667))

(assert (=> b!1458284 m!1345649))

(declare-fun m!1345669 () Bool)

(assert (=> b!1458284 m!1345669))

(assert (=> b!1458271 m!1345641))

(assert (=> b!1458271 m!1345641))

(declare-fun m!1345671 () Bool)

(assert (=> b!1458271 m!1345671))

(declare-fun m!1345673 () Bool)

(assert (=> b!1458272 m!1345673))

(declare-fun m!1345675 () Bool)

(assert (=> b!1458272 m!1345675))

(declare-fun m!1345677 () Bool)

(assert (=> b!1458272 m!1345677))

(declare-fun m!1345679 () Bool)

(assert (=> b!1458288 m!1345679))

(declare-fun m!1345681 () Bool)

(assert (=> b!1458282 m!1345681))

(declare-fun m!1345683 () Bool)

(assert (=> b!1458278 m!1345683))

(declare-fun m!1345685 () Bool)

(assert (=> b!1458270 m!1345685))

(assert (=> b!1458281 m!1345675))

(assert (=> b!1458281 m!1345677))

(assert (=> b!1458280 m!1345641))

(assert (=> b!1458280 m!1345641))

(declare-fun m!1345687 () Bool)

(assert (=> b!1458280 m!1345687))

(assert (=> b!1458274 m!1345649))

(declare-fun m!1345689 () Bool)

(assert (=> b!1458274 m!1345689))

(declare-fun m!1345691 () Bool)

(assert (=> b!1458277 m!1345691))

(assert (=> b!1458277 m!1345691))

(declare-fun m!1345693 () Bool)

(assert (=> b!1458277 m!1345693))

(declare-fun m!1345695 () Bool)

(assert (=> start!125116 m!1345695))

(declare-fun m!1345697 () Bool)

(assert (=> start!125116 m!1345697))

(check-sat (not b!1458270) (not b!1458288) (not b!1458286) (not b!1458281) (not b!1458275) (not b!1458282) (not b!1458280) (not b!1458272) (not b!1458284) (not b!1458279) (not b!1458285) (not b!1458271) (not b!1458277) (not b!1458273) (not start!125116) (not b!1458278))
(check-sat)
