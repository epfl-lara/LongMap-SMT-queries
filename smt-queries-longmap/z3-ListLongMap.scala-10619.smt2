; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125070 () Bool)

(assert start!125070)

(declare-fun b!1450837 () Bool)

(declare-fun e!817114 () Bool)

(declare-fun e!817115 () Bool)

(assert (=> b!1450837 (= e!817114 e!817115)))

(declare-fun res!981461 () Bool)

(assert (=> b!1450837 (=> (not res!981461) (not e!817115))))

(declare-datatypes ((SeekEntryResult!11640 0))(
  ( (MissingZero!11640 (index!48952 (_ BitVec 32))) (Found!11640 (index!48953 (_ BitVec 32))) (Intermediate!11640 (undefined!12452 Bool) (index!48954 (_ BitVec 32)) (x!130793 (_ BitVec 32))) (Undefined!11640) (MissingVacant!11640 (index!48955 (_ BitVec 32))) )
))
(declare-fun lt!636409 () SeekEntryResult!11640)

(declare-datatypes ((array!98413 0))(
  ( (array!98414 (arr!47491 (Array (_ BitVec 32) (_ BitVec 64))) (size!48042 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98413)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98413 (_ BitVec 32)) SeekEntryResult!11640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450837 (= res!981461 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47491 a!2862) j!93) mask!2687) (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!636409))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450837 (= lt!636409 (Intermediate!11640 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450838 () Bool)

(declare-fun res!981451 () Bool)

(declare-fun e!817121 () Bool)

(assert (=> b!1450838 (=> (not res!981451) (not e!817121))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450838 (= res!981451 (and (= (size!48042 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48042 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48042 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450839 () Bool)

(declare-fun e!817119 () Bool)

(declare-fun e!817122 () Bool)

(assert (=> b!1450839 (= e!817119 (not e!817122))))

(declare-fun res!981455 () Bool)

(assert (=> b!1450839 (=> res!981455 e!817122)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450839 (= res!981455 (or (and (= (select (arr!47491 a!2862) index!646) (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47491 a!2862) index!646) (select (arr!47491 a!2862) j!93))) (not (= (select (arr!47491 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!817117 () Bool)

(assert (=> b!1450839 e!817117))

(declare-fun res!981460 () Bool)

(assert (=> b!1450839 (=> (not res!981460) (not e!817117))))

(declare-fun lt!636406 () SeekEntryResult!11640)

(assert (=> b!1450839 (= res!981460 (and (= lt!636406 (Found!11640 j!93)) (or (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) (select (arr!47491 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98413 (_ BitVec 32)) SeekEntryResult!11640)

(assert (=> b!1450839 (= lt!636406 (seekEntryOrOpen!0 (select (arr!47491 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98413 (_ BitVec 32)) Bool)

(assert (=> b!1450839 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48809 0))(
  ( (Unit!48810) )
))
(declare-fun lt!636407 () Unit!48809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48809)

(assert (=> b!1450839 (= lt!636407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450840 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817118 () Bool)

(assert (=> b!1450840 (= e!817118 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450841 () Bool)

(assert (=> b!1450841 (= e!817115 e!817119)))

(declare-fun res!981454 () Bool)

(assert (=> b!1450841 (=> (not res!981454) (not e!817119))))

(declare-fun lt!636408 () SeekEntryResult!11640)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450841 (= res!981454 (= lt!636408 (Intermediate!11640 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636403 () array!98413)

(declare-fun lt!636404 () (_ BitVec 64))

(assert (=> b!1450841 (= lt!636408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636404 mask!2687) lt!636404 lt!636403 mask!2687))))

(assert (=> b!1450841 (= lt!636404 (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!817120 () Bool)

(declare-fun b!1450842 () Bool)

(assert (=> b!1450842 (= e!817120 (= lt!636408 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636404 lt!636403 mask!2687)))))

(declare-fun b!1450843 () Bool)

(declare-fun res!981445 () Bool)

(assert (=> b!1450843 (=> (not res!981445) (not e!817115))))

(assert (=> b!1450843 (= res!981445 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!636409))))

(declare-fun b!1450844 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98413 (_ BitVec 32)) SeekEntryResult!11640)

(assert (=> b!1450844 (= e!817120 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636404 lt!636403 mask!2687) (seekEntryOrOpen!0 lt!636404 lt!636403 mask!2687)))))

(declare-fun b!1450845 () Bool)

(declare-fun res!981450 () Bool)

(assert (=> b!1450845 (=> (not res!981450) (not e!817121))))

(assert (=> b!1450845 (= res!981450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!981446 () Bool)

(assert (=> start!125070 (=> (not res!981446) (not e!817121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125070 (= res!981446 (validMask!0 mask!2687))))

(assert (=> start!125070 e!817121))

(assert (=> start!125070 true))

(declare-fun array_inv!36772 (array!98413) Bool)

(assert (=> start!125070 (array_inv!36772 a!2862)))

(declare-fun b!1450846 () Bool)

(declare-fun res!981452 () Bool)

(assert (=> b!1450846 (=> (not res!981452) (not e!817121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450846 (= res!981452 (validKeyInArray!0 (select (arr!47491 a!2862) j!93)))))

(declare-fun b!1450847 () Bool)

(declare-fun res!981448 () Bool)

(assert (=> b!1450847 (=> (not res!981448) (not e!817119))))

(assert (=> b!1450847 (= res!981448 e!817120)))

(declare-fun c!134215 () Bool)

(assert (=> b!1450847 (= c!134215 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450848 () Bool)

(assert (=> b!1450848 (= e!817122 true)))

(declare-fun lt!636405 () SeekEntryResult!11640)

(assert (=> b!1450848 (= lt!636405 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47491 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1450849 () Bool)

(declare-fun e!817116 () Bool)

(assert (=> b!1450849 (= e!817116 e!817118)))

(declare-fun res!981457 () Bool)

(assert (=> b!1450849 (=> (not res!981457) (not e!817118))))

(assert (=> b!1450849 (= res!981457 (= lt!636406 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47491 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450850 () Bool)

(declare-fun res!981449 () Bool)

(assert (=> b!1450850 (=> (not res!981449) (not e!817121))))

(assert (=> b!1450850 (= res!981449 (validKeyInArray!0 (select (arr!47491 a!2862) i!1006)))))

(declare-fun b!1450851 () Bool)

(declare-fun res!981458 () Bool)

(assert (=> b!1450851 (=> (not res!981458) (not e!817119))))

(assert (=> b!1450851 (= res!981458 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450852 () Bool)

(assert (=> b!1450852 (= e!817121 e!817114)))

(declare-fun res!981456 () Bool)

(assert (=> b!1450852 (=> (not res!981456) (not e!817114))))

(assert (=> b!1450852 (= res!981456 (= (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450852 (= lt!636403 (array!98414 (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48042 a!2862)))))

(declare-fun b!1450853 () Bool)

(declare-fun res!981453 () Bool)

(assert (=> b!1450853 (=> (not res!981453) (not e!817121))))

(declare-datatypes ((List!33979 0))(
  ( (Nil!33976) (Cons!33975 (h!35336 (_ BitVec 64)) (t!48665 List!33979)) )
))
(declare-fun arrayNoDuplicates!0 (array!98413 (_ BitVec 32) List!33979) Bool)

(assert (=> b!1450853 (= res!981453 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33976))))

(declare-fun b!1450854 () Bool)

(declare-fun res!981459 () Bool)

(assert (=> b!1450854 (=> (not res!981459) (not e!817121))))

(assert (=> b!1450854 (= res!981459 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48042 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48042 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48042 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450855 () Bool)

(assert (=> b!1450855 (= e!817117 e!817116)))

(declare-fun res!981447 () Bool)

(assert (=> b!1450855 (=> res!981447 e!817116)))

(assert (=> b!1450855 (= res!981447 (or (and (= (select (arr!47491 a!2862) index!646) (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47491 a!2862) index!646) (select (arr!47491 a!2862) j!93))) (not (= (select (arr!47491 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!125070 res!981446) b!1450838))

(assert (= (and b!1450838 res!981451) b!1450850))

(assert (= (and b!1450850 res!981449) b!1450846))

(assert (= (and b!1450846 res!981452) b!1450845))

(assert (= (and b!1450845 res!981450) b!1450853))

(assert (= (and b!1450853 res!981453) b!1450854))

(assert (= (and b!1450854 res!981459) b!1450852))

(assert (= (and b!1450852 res!981456) b!1450837))

(assert (= (and b!1450837 res!981461) b!1450843))

(assert (= (and b!1450843 res!981445) b!1450841))

(assert (= (and b!1450841 res!981454) b!1450847))

(assert (= (and b!1450847 c!134215) b!1450842))

(assert (= (and b!1450847 (not c!134215)) b!1450844))

(assert (= (and b!1450847 res!981448) b!1450851))

(assert (= (and b!1450851 res!981458) b!1450839))

(assert (= (and b!1450839 res!981460) b!1450855))

(assert (= (and b!1450855 (not res!981447)) b!1450849))

(assert (= (and b!1450849 res!981457) b!1450840))

(assert (= (and b!1450839 (not res!981455)) b!1450848))

(declare-fun m!1339657 () Bool)

(assert (=> b!1450841 m!1339657))

(assert (=> b!1450841 m!1339657))

(declare-fun m!1339659 () Bool)

(assert (=> b!1450841 m!1339659))

(declare-fun m!1339661 () Bool)

(assert (=> b!1450841 m!1339661))

(declare-fun m!1339663 () Bool)

(assert (=> b!1450841 m!1339663))

(declare-fun m!1339665 () Bool)

(assert (=> b!1450855 m!1339665))

(assert (=> b!1450855 m!1339661))

(declare-fun m!1339667 () Bool)

(assert (=> b!1450855 m!1339667))

(declare-fun m!1339669 () Bool)

(assert (=> b!1450855 m!1339669))

(assert (=> b!1450849 m!1339669))

(assert (=> b!1450849 m!1339669))

(declare-fun m!1339671 () Bool)

(assert (=> b!1450849 m!1339671))

(assert (=> b!1450843 m!1339669))

(assert (=> b!1450843 m!1339669))

(declare-fun m!1339673 () Bool)

(assert (=> b!1450843 m!1339673))

(assert (=> b!1450852 m!1339661))

(declare-fun m!1339675 () Bool)

(assert (=> b!1450852 m!1339675))

(declare-fun m!1339677 () Bool)

(assert (=> b!1450853 m!1339677))

(declare-fun m!1339679 () Bool)

(assert (=> start!125070 m!1339679))

(declare-fun m!1339681 () Bool)

(assert (=> start!125070 m!1339681))

(declare-fun m!1339683 () Bool)

(assert (=> b!1450842 m!1339683))

(assert (=> b!1450848 m!1339669))

(assert (=> b!1450848 m!1339669))

(declare-fun m!1339685 () Bool)

(assert (=> b!1450848 m!1339685))

(declare-fun m!1339687 () Bool)

(assert (=> b!1450844 m!1339687))

(declare-fun m!1339689 () Bool)

(assert (=> b!1450844 m!1339689))

(declare-fun m!1339691 () Bool)

(assert (=> b!1450850 m!1339691))

(assert (=> b!1450850 m!1339691))

(declare-fun m!1339693 () Bool)

(assert (=> b!1450850 m!1339693))

(assert (=> b!1450837 m!1339669))

(assert (=> b!1450837 m!1339669))

(declare-fun m!1339695 () Bool)

(assert (=> b!1450837 m!1339695))

(assert (=> b!1450837 m!1339695))

(assert (=> b!1450837 m!1339669))

(declare-fun m!1339697 () Bool)

(assert (=> b!1450837 m!1339697))

(declare-fun m!1339699 () Bool)

(assert (=> b!1450839 m!1339699))

(assert (=> b!1450839 m!1339661))

(declare-fun m!1339701 () Bool)

(assert (=> b!1450839 m!1339701))

(assert (=> b!1450839 m!1339667))

(assert (=> b!1450839 m!1339665))

(assert (=> b!1450839 m!1339669))

(declare-fun m!1339703 () Bool)

(assert (=> b!1450839 m!1339703))

(declare-fun m!1339705 () Bool)

(assert (=> b!1450839 m!1339705))

(assert (=> b!1450839 m!1339669))

(declare-fun m!1339707 () Bool)

(assert (=> b!1450845 m!1339707))

(assert (=> b!1450846 m!1339669))

(assert (=> b!1450846 m!1339669))

(declare-fun m!1339709 () Bool)

(assert (=> b!1450846 m!1339709))

(check-sat (not b!1450841) (not b!1450843) (not b!1450848) (not start!125070) (not b!1450850) (not b!1450837) (not b!1450853) (not b!1450845) (not b!1450846) (not b!1450844) (not b!1450849) (not b!1450839) (not b!1450842))
(check-sat)
