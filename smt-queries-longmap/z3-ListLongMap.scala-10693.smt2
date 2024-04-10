; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125298 () Bool)

(assert start!125298)

(declare-fun b!1463307 () Bool)

(declare-fun e!822466 () Bool)

(declare-fun e!822465 () Bool)

(assert (=> b!1463307 (= e!822466 e!822465)))

(declare-fun res!992589 () Bool)

(assert (=> b!1463307 (=> res!992589 e!822465)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640728 () (_ BitVec 32))

(declare-datatypes ((array!98746 0))(
  ( (array!98747 (arr!47661 (Array (_ BitVec 32) (_ BitVec 64))) (size!48211 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98746)

(assert (=> b!1463307 (= res!992589 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640728 #b00000000000000000000000000000000) (bvsge lt!640728 (size!48211 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463307 (= lt!640728 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463308 () Bool)

(assert (=> b!1463308 (= e!822465 true)))

(declare-fun lt!640729 () Bool)

(declare-fun e!822462 () Bool)

(assert (=> b!1463308 (= lt!640729 e!822462)))

(declare-fun c!134873 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463308 (= c!134873 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!992585 () Bool)

(declare-fun e!822467 () Bool)

(assert (=> start!125298 (=> (not res!992585) (not e!822467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125298 (= res!992585 (validMask!0 mask!2687))))

(assert (=> start!125298 e!822467))

(assert (=> start!125298 true))

(declare-fun array_inv!36689 (array!98746) Bool)

(assert (=> start!125298 (array_inv!36689 a!2862)))

(declare-fun b!1463309 () Bool)

(declare-fun res!992594 () Bool)

(assert (=> b!1463309 (=> (not res!992594) (not e!822467))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463309 (= res!992594 (and (= (size!48211 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48211 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48211 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463310 () Bool)

(declare-fun res!992591 () Bool)

(assert (=> b!1463310 (=> (not res!992591) (not e!822467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98746 (_ BitVec 32)) Bool)

(assert (=> b!1463310 (= res!992591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463311 () Bool)

(declare-fun res!992582 () Bool)

(assert (=> b!1463311 (=> (not res!992582) (not e!822467))))

(declare-datatypes ((List!34162 0))(
  ( (Nil!34159) (Cons!34158 (h!35508 (_ BitVec 64)) (t!48856 List!34162)) )
))
(declare-fun arrayNoDuplicates!0 (array!98746 (_ BitVec 32) List!34162) Bool)

(assert (=> b!1463311 (= res!992582 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34159))))

(declare-fun b!1463312 () Bool)

(declare-fun res!992595 () Bool)

(assert (=> b!1463312 (=> (not res!992595) (not e!822467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463312 (= res!992595 (validKeyInArray!0 (select (arr!47661 a!2862) j!93)))))

(declare-fun b!1463313 () Bool)

(declare-fun res!992587 () Bool)

(assert (=> b!1463313 (=> (not res!992587) (not e!822467))))

(assert (=> b!1463313 (= res!992587 (validKeyInArray!0 (select (arr!47661 a!2862) i!1006)))))

(declare-fun b!1463314 () Bool)

(declare-fun res!992583 () Bool)

(declare-fun e!822469 () Bool)

(assert (=> b!1463314 (=> (not res!992583) (not e!822469))))

(declare-datatypes ((SeekEntryResult!11913 0))(
  ( (MissingZero!11913 (index!50044 (_ BitVec 32))) (Found!11913 (index!50045 (_ BitVec 32))) (Intermediate!11913 (undefined!12725 Bool) (index!50046 (_ BitVec 32)) (x!131634 (_ BitVec 32))) (Undefined!11913) (MissingVacant!11913 (index!50047 (_ BitVec 32))) )
))
(declare-fun lt!640726 () SeekEntryResult!11913)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98746 (_ BitVec 32)) SeekEntryResult!11913)

(assert (=> b!1463314 (= res!992583 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47661 a!2862) j!93) a!2862 mask!2687) lt!640726))))

(declare-fun b!1463315 () Bool)

(declare-fun e!822461 () Bool)

(assert (=> b!1463315 (= e!822467 e!822461)))

(declare-fun res!992590 () Bool)

(assert (=> b!1463315 (=> (not res!992590) (not e!822461))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463315 (= res!992590 (= (select (store (arr!47661 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640725 () array!98746)

(assert (=> b!1463315 (= lt!640725 (array!98747 (store (arr!47661 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48211 a!2862)))))

(declare-fun b!1463316 () Bool)

(declare-fun res!992599 () Bool)

(declare-fun e!822470 () Bool)

(assert (=> b!1463316 (=> (not res!992599) (not e!822470))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463316 (= res!992599 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463317 () Bool)

(declare-fun res!992597 () Bool)

(assert (=> b!1463317 (=> (not res!992597) (not e!822467))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463317 (= res!992597 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48211 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48211 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48211 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463318 () Bool)

(declare-fun lt!640731 () SeekEntryResult!11913)

(declare-fun lt!640727 () (_ BitVec 64))

(assert (=> b!1463318 (= e!822462 (not (= lt!640731 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640728 lt!640727 lt!640725 mask!2687))))))

(declare-fun e!822464 () Bool)

(declare-fun b!1463319 () Bool)

(assert (=> b!1463319 (= e!822464 (or (= (select (arr!47661 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47661 a!2862) intermediateBeforeIndex!19) (select (arr!47661 a!2862) j!93))))))

(declare-fun b!1463320 () Bool)

(declare-fun e!822468 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98746 (_ BitVec 32)) SeekEntryResult!11913)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98746 (_ BitVec 32)) SeekEntryResult!11913)

(assert (=> b!1463320 (= e!822468 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640727 lt!640725 mask!2687) (seekEntryOrOpen!0 lt!640727 lt!640725 mask!2687)))))

(declare-fun b!1463321 () Bool)

(assert (=> b!1463321 (= e!822469 e!822470)))

(declare-fun res!992592 () Bool)

(assert (=> b!1463321 (=> (not res!992592) (not e!822470))))

(assert (=> b!1463321 (= res!992592 (= lt!640731 (Intermediate!11913 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463321 (= lt!640731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640727 mask!2687) lt!640727 lt!640725 mask!2687))))

(assert (=> b!1463321 (= lt!640727 (select (store (arr!47661 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463322 () Bool)

(declare-fun res!992596 () Bool)

(assert (=> b!1463322 (=> (not res!992596) (not e!822470))))

(assert (=> b!1463322 (= res!992596 e!822468)))

(declare-fun c!134874 () Bool)

(assert (=> b!1463322 (= c!134874 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463323 () Bool)

(declare-fun res!992598 () Bool)

(assert (=> b!1463323 (=> res!992598 e!822465)))

(assert (=> b!1463323 (= res!992598 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640728 (select (arr!47661 a!2862) j!93) a!2862 mask!2687) lt!640726)))))

(declare-fun b!1463324 () Bool)

(assert (=> b!1463324 (= e!822468 (= lt!640731 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640727 lt!640725 mask!2687)))))

(declare-fun b!1463325 () Bool)

(assert (=> b!1463325 (= e!822470 (not e!822466))))

(declare-fun res!992593 () Bool)

(assert (=> b!1463325 (=> res!992593 e!822466)))

(assert (=> b!1463325 (= res!992593 (or (and (= (select (arr!47661 a!2862) index!646) (select (store (arr!47661 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47661 a!2862) index!646) (select (arr!47661 a!2862) j!93))) (= (select (arr!47661 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463325 e!822464))

(declare-fun res!992588 () Bool)

(assert (=> b!1463325 (=> (not res!992588) (not e!822464))))

(assert (=> b!1463325 (= res!992588 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49322 0))(
  ( (Unit!49323) )
))
(declare-fun lt!640730 () Unit!49322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49322)

(assert (=> b!1463325 (= lt!640730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463326 () Bool)

(assert (=> b!1463326 (= e!822462 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640728 intermediateAfterIndex!19 lt!640727 lt!640725 mask!2687) (seekEntryOrOpen!0 lt!640727 lt!640725 mask!2687))))))

(declare-fun b!1463327 () Bool)

(declare-fun res!992586 () Bool)

(assert (=> b!1463327 (=> (not res!992586) (not e!822464))))

(assert (=> b!1463327 (= res!992586 (= (seekEntryOrOpen!0 (select (arr!47661 a!2862) j!93) a!2862 mask!2687) (Found!11913 j!93)))))

(declare-fun b!1463328 () Bool)

(assert (=> b!1463328 (= e!822461 e!822469)))

(declare-fun res!992584 () Bool)

(assert (=> b!1463328 (=> (not res!992584) (not e!822469))))

(assert (=> b!1463328 (= res!992584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47661 a!2862) j!93) mask!2687) (select (arr!47661 a!2862) j!93) a!2862 mask!2687) lt!640726))))

(assert (=> b!1463328 (= lt!640726 (Intermediate!11913 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125298 res!992585) b!1463309))

(assert (= (and b!1463309 res!992594) b!1463313))

(assert (= (and b!1463313 res!992587) b!1463312))

(assert (= (and b!1463312 res!992595) b!1463310))

(assert (= (and b!1463310 res!992591) b!1463311))

(assert (= (and b!1463311 res!992582) b!1463317))

(assert (= (and b!1463317 res!992597) b!1463315))

(assert (= (and b!1463315 res!992590) b!1463328))

(assert (= (and b!1463328 res!992584) b!1463314))

(assert (= (and b!1463314 res!992583) b!1463321))

(assert (= (and b!1463321 res!992592) b!1463322))

(assert (= (and b!1463322 c!134874) b!1463324))

(assert (= (and b!1463322 (not c!134874)) b!1463320))

(assert (= (and b!1463322 res!992596) b!1463316))

(assert (= (and b!1463316 res!992599) b!1463325))

(assert (= (and b!1463325 res!992588) b!1463327))

(assert (= (and b!1463327 res!992586) b!1463319))

(assert (= (and b!1463325 (not res!992593)) b!1463307))

(assert (= (and b!1463307 (not res!992589)) b!1463323))

(assert (= (and b!1463323 (not res!992598)) b!1463308))

(assert (= (and b!1463308 c!134873) b!1463318))

(assert (= (and b!1463308 (not c!134873)) b!1463326))

(declare-fun m!1350659 () Bool)

(assert (=> b!1463324 m!1350659))

(declare-fun m!1350661 () Bool)

(assert (=> b!1463310 m!1350661))

(declare-fun m!1350663 () Bool)

(assert (=> b!1463315 m!1350663))

(declare-fun m!1350665 () Bool)

(assert (=> b!1463315 m!1350665))

(declare-fun m!1350667 () Bool)

(assert (=> b!1463307 m!1350667))

(declare-fun m!1350669 () Bool)

(assert (=> b!1463314 m!1350669))

(assert (=> b!1463314 m!1350669))

(declare-fun m!1350671 () Bool)

(assert (=> b!1463314 m!1350671))

(assert (=> b!1463323 m!1350669))

(assert (=> b!1463323 m!1350669))

(declare-fun m!1350673 () Bool)

(assert (=> b!1463323 m!1350673))

(declare-fun m!1350675 () Bool)

(assert (=> b!1463311 m!1350675))

(declare-fun m!1350677 () Bool)

(assert (=> b!1463321 m!1350677))

(assert (=> b!1463321 m!1350677))

(declare-fun m!1350679 () Bool)

(assert (=> b!1463321 m!1350679))

(assert (=> b!1463321 m!1350663))

(declare-fun m!1350681 () Bool)

(assert (=> b!1463321 m!1350681))

(declare-fun m!1350683 () Bool)

(assert (=> b!1463325 m!1350683))

(assert (=> b!1463325 m!1350663))

(declare-fun m!1350685 () Bool)

(assert (=> b!1463325 m!1350685))

(declare-fun m!1350687 () Bool)

(assert (=> b!1463325 m!1350687))

(declare-fun m!1350689 () Bool)

(assert (=> b!1463325 m!1350689))

(assert (=> b!1463325 m!1350669))

(assert (=> b!1463328 m!1350669))

(assert (=> b!1463328 m!1350669))

(declare-fun m!1350691 () Bool)

(assert (=> b!1463328 m!1350691))

(assert (=> b!1463328 m!1350691))

(assert (=> b!1463328 m!1350669))

(declare-fun m!1350693 () Bool)

(assert (=> b!1463328 m!1350693))

(declare-fun m!1350695 () Bool)

(assert (=> b!1463313 m!1350695))

(assert (=> b!1463313 m!1350695))

(declare-fun m!1350697 () Bool)

(assert (=> b!1463313 m!1350697))

(assert (=> b!1463312 m!1350669))

(assert (=> b!1463312 m!1350669))

(declare-fun m!1350699 () Bool)

(assert (=> b!1463312 m!1350699))

(declare-fun m!1350701 () Bool)

(assert (=> b!1463318 m!1350701))

(declare-fun m!1350703 () Bool)

(assert (=> start!125298 m!1350703))

(declare-fun m!1350705 () Bool)

(assert (=> start!125298 m!1350705))

(declare-fun m!1350707 () Bool)

(assert (=> b!1463319 m!1350707))

(assert (=> b!1463319 m!1350669))

(declare-fun m!1350709 () Bool)

(assert (=> b!1463326 m!1350709))

(declare-fun m!1350711 () Bool)

(assert (=> b!1463326 m!1350711))

(assert (=> b!1463327 m!1350669))

(assert (=> b!1463327 m!1350669))

(declare-fun m!1350713 () Bool)

(assert (=> b!1463327 m!1350713))

(declare-fun m!1350715 () Bool)

(assert (=> b!1463320 m!1350715))

(assert (=> b!1463320 m!1350711))

(check-sat (not b!1463312) (not b!1463328) (not b!1463326) (not b!1463318) (not b!1463324) (not b!1463320) (not b!1463310) (not b!1463313) (not b!1463327) (not b!1463323) (not b!1463325) (not b!1463307) (not start!125298) (not b!1463311) (not b!1463314) (not b!1463321))
(check-sat)
