; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125970 () Bool)

(assert start!125970)

(declare-fun b!1472680 () Bool)

(declare-fun res!999652 () Bool)

(declare-fun e!826740 () Bool)

(assert (=> b!1472680 (=> (not res!999652) (not e!826740))))

(declare-datatypes ((array!99199 0))(
  ( (array!99200 (arr!47881 (Array (_ BitVec 32) (_ BitVec 64))) (size!48432 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99199)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472680 (= res!999652 (validKeyInArray!0 (select (arr!47881 a!2862) i!1006)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!826743 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1472681 () Bool)

(declare-datatypes ((SeekEntryResult!12018 0))(
  ( (MissingZero!12018 (index!50464 (_ BitVec 32))) (Found!12018 (index!50465 (_ BitVec 32))) (Intermediate!12018 (undefined!12830 Bool) (index!50466 (_ BitVec 32)) (x!132229 (_ BitVec 32))) (Undefined!12018) (MissingVacant!12018 (index!50467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99199 (_ BitVec 32)) SeekEntryResult!12018)

(assert (=> b!1472681 (= e!826743 (= (seekEntryOrOpen!0 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) (Found!12018 j!93)))))

(declare-fun b!1472682 () Bool)

(declare-fun res!999659 () Bool)

(declare-fun e!826738 () Bool)

(assert (=> b!1472682 (=> (not res!999659) (not e!826738))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472682 (= res!999659 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472683 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472683 (= e!826738 (not (or (= (select (arr!47881 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47881 a!2862) intermediateBeforeIndex!19) (select (arr!47881 a!2862) j!93)))))))

(assert (=> b!1472683 e!826743))

(declare-fun res!999651 () Bool)

(assert (=> b!1472683 (=> (not res!999651) (not e!826743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99199 (_ BitVec 32)) Bool)

(assert (=> b!1472683 (= res!999651 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49409 0))(
  ( (Unit!49410) )
))
(declare-fun lt!643730 () Unit!49409)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49409)

(assert (=> b!1472683 (= lt!643730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472684 () Bool)

(declare-fun res!999655 () Bool)

(assert (=> b!1472684 (=> (not res!999655) (not e!826740))))

(declare-datatypes ((List!34369 0))(
  ( (Nil!34366) (Cons!34365 (h!35732 (_ BitVec 64)) (t!49055 List!34369)) )
))
(declare-fun arrayNoDuplicates!0 (array!99199 (_ BitVec 32) List!34369) Bool)

(assert (=> b!1472684 (= res!999655 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34366))))

(declare-fun b!1472685 () Bool)

(declare-fun e!826737 () Bool)

(assert (=> b!1472685 (= e!826740 e!826737)))

(declare-fun res!999658 () Bool)

(assert (=> b!1472685 (=> (not res!999658) (not e!826737))))

(assert (=> b!1472685 (= res!999658 (= (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643728 () array!99199)

(assert (=> b!1472685 (= lt!643728 (array!99200 (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48432 a!2862)))))

(declare-fun b!1472686 () Bool)

(declare-fun e!826741 () Bool)

(assert (=> b!1472686 (= e!826737 e!826741)))

(declare-fun res!999648 () Bool)

(assert (=> b!1472686 (=> (not res!999648) (not e!826741))))

(declare-fun lt!643731 () SeekEntryResult!12018)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99199 (_ BitVec 32)) SeekEntryResult!12018)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472686 (= res!999648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!643731))))

(assert (=> b!1472686 (= lt!643731 (Intermediate!12018 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472687 () Bool)

(declare-fun res!999653 () Bool)

(assert (=> b!1472687 (=> (not res!999653) (not e!826738))))

(declare-fun e!826739 () Bool)

(assert (=> b!1472687 (= res!999653 e!826739)))

(declare-fun c!136039 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472687 (= c!136039 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472688 () Bool)

(declare-fun res!999647 () Bool)

(assert (=> b!1472688 (=> (not res!999647) (not e!826740))))

(assert (=> b!1472688 (= res!999647 (and (= (size!48432 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48432 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48432 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472689 () Bool)

(assert (=> b!1472689 (= e!826741 e!826738)))

(declare-fun res!999656 () Bool)

(assert (=> b!1472689 (=> (not res!999656) (not e!826738))))

(declare-fun lt!643729 () SeekEntryResult!12018)

(assert (=> b!1472689 (= res!999656 (= lt!643729 (Intermediate!12018 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643732 () (_ BitVec 64))

(assert (=> b!1472689 (= lt!643729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643732 mask!2687) lt!643732 lt!643728 mask!2687))))

(assert (=> b!1472689 (= lt!643732 (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472691 () Bool)

(declare-fun res!999649 () Bool)

(assert (=> b!1472691 (=> (not res!999649) (not e!826740))))

(assert (=> b!1472691 (= res!999649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472692 () Bool)

(declare-fun res!999650 () Bool)

(assert (=> b!1472692 (=> (not res!999650) (not e!826740))))

(assert (=> b!1472692 (= res!999650 (validKeyInArray!0 (select (arr!47881 a!2862) j!93)))))

(declare-fun b!1472693 () Bool)

(declare-fun res!999646 () Bool)

(assert (=> b!1472693 (=> (not res!999646) (not e!826740))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472693 (= res!999646 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48432 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48432 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48432 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472694 () Bool)

(assert (=> b!1472694 (= e!826739 (= lt!643729 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643732 lt!643728 mask!2687)))))

(declare-fun b!1472695 () Bool)

(declare-fun res!999657 () Bool)

(assert (=> b!1472695 (=> (not res!999657) (not e!826741))))

(assert (=> b!1472695 (= res!999657 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!643731))))

(declare-fun b!1472690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99199 (_ BitVec 32)) SeekEntryResult!12018)

(assert (=> b!1472690 (= e!826739 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643732 lt!643728 mask!2687) (seekEntryOrOpen!0 lt!643732 lt!643728 mask!2687)))))

(declare-fun res!999654 () Bool)

(assert (=> start!125970 (=> (not res!999654) (not e!826740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125970 (= res!999654 (validMask!0 mask!2687))))

(assert (=> start!125970 e!826740))

(assert (=> start!125970 true))

(declare-fun array_inv!37162 (array!99199) Bool)

(assert (=> start!125970 (array_inv!37162 a!2862)))

(assert (= (and start!125970 res!999654) b!1472688))

(assert (= (and b!1472688 res!999647) b!1472680))

(assert (= (and b!1472680 res!999652) b!1472692))

(assert (= (and b!1472692 res!999650) b!1472691))

(assert (= (and b!1472691 res!999649) b!1472684))

(assert (= (and b!1472684 res!999655) b!1472693))

(assert (= (and b!1472693 res!999646) b!1472685))

(assert (= (and b!1472685 res!999658) b!1472686))

(assert (= (and b!1472686 res!999648) b!1472695))

(assert (= (and b!1472695 res!999657) b!1472689))

(assert (= (and b!1472689 res!999656) b!1472687))

(assert (= (and b!1472687 c!136039) b!1472694))

(assert (= (and b!1472687 (not c!136039)) b!1472690))

(assert (= (and b!1472687 res!999653) b!1472682))

(assert (= (and b!1472682 res!999659) b!1472683))

(assert (= (and b!1472683 res!999651) b!1472681))

(declare-fun m!1359613 () Bool)

(assert (=> b!1472692 m!1359613))

(assert (=> b!1472692 m!1359613))

(declare-fun m!1359615 () Bool)

(assert (=> b!1472692 m!1359615))

(declare-fun m!1359617 () Bool)

(assert (=> b!1472694 m!1359617))

(declare-fun m!1359619 () Bool)

(assert (=> b!1472684 m!1359619))

(declare-fun m!1359621 () Bool)

(assert (=> b!1472683 m!1359621))

(assert (=> b!1472683 m!1359613))

(declare-fun m!1359623 () Bool)

(assert (=> b!1472683 m!1359623))

(declare-fun m!1359625 () Bool)

(assert (=> b!1472683 m!1359625))

(declare-fun m!1359627 () Bool)

(assert (=> b!1472685 m!1359627))

(declare-fun m!1359629 () Bool)

(assert (=> b!1472685 m!1359629))

(assert (=> b!1472695 m!1359613))

(assert (=> b!1472695 m!1359613))

(declare-fun m!1359631 () Bool)

(assert (=> b!1472695 m!1359631))

(declare-fun m!1359633 () Bool)

(assert (=> start!125970 m!1359633))

(declare-fun m!1359635 () Bool)

(assert (=> start!125970 m!1359635))

(declare-fun m!1359637 () Bool)

(assert (=> b!1472680 m!1359637))

(assert (=> b!1472680 m!1359637))

(declare-fun m!1359639 () Bool)

(assert (=> b!1472680 m!1359639))

(declare-fun m!1359641 () Bool)

(assert (=> b!1472690 m!1359641))

(declare-fun m!1359643 () Bool)

(assert (=> b!1472690 m!1359643))

(declare-fun m!1359645 () Bool)

(assert (=> b!1472689 m!1359645))

(assert (=> b!1472689 m!1359645))

(declare-fun m!1359647 () Bool)

(assert (=> b!1472689 m!1359647))

(assert (=> b!1472689 m!1359627))

(declare-fun m!1359649 () Bool)

(assert (=> b!1472689 m!1359649))

(declare-fun m!1359651 () Bool)

(assert (=> b!1472691 m!1359651))

(assert (=> b!1472681 m!1359613))

(assert (=> b!1472681 m!1359613))

(declare-fun m!1359653 () Bool)

(assert (=> b!1472681 m!1359653))

(assert (=> b!1472686 m!1359613))

(assert (=> b!1472686 m!1359613))

(declare-fun m!1359655 () Bool)

(assert (=> b!1472686 m!1359655))

(assert (=> b!1472686 m!1359655))

(assert (=> b!1472686 m!1359613))

(declare-fun m!1359657 () Bool)

(assert (=> b!1472686 m!1359657))

(check-sat (not b!1472691) (not b!1472689) (not b!1472686) (not b!1472695) (not b!1472694) (not b!1472680) (not b!1472692) (not b!1472684) (not b!1472683) (not b!1472690) (not start!125970) (not b!1472681))
(check-sat)
(get-model)

(declare-fun b!1472810 () Bool)

(declare-fun e!826797 () SeekEntryResult!12018)

(declare-fun e!826800 () SeekEntryResult!12018)

(assert (=> b!1472810 (= e!826797 e!826800)))

(declare-fun lt!643767 () (_ BitVec 64))

(declare-fun c!136054 () Bool)

(assert (=> b!1472810 (= c!136054 (or (= lt!643767 (select (arr!47881 a!2862) j!93)) (= (bvadd lt!643767 lt!643767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472811 () Bool)

(declare-fun e!826798 () Bool)

(declare-fun e!826799 () Bool)

(assert (=> b!1472811 (= e!826798 e!826799)))

(declare-fun res!999750 () Bool)

(declare-fun lt!643768 () SeekEntryResult!12018)

(get-info :version)

(assert (=> b!1472811 (= res!999750 (and ((_ is Intermediate!12018) lt!643768) (not (undefined!12830 lt!643768)) (bvslt (x!132229 lt!643768) #b01111111111111111111111111111110) (bvsge (x!132229 lt!643768) #b00000000000000000000000000000000) (bvsge (x!132229 lt!643768) #b00000000000000000000000000000000)))))

(assert (=> b!1472811 (=> (not res!999750) (not e!826799))))

(declare-fun b!1472812 () Bool)

(assert (=> b!1472812 (= e!826798 (bvsge (x!132229 lt!643768) #b01111111111111111111111111111110))))

(declare-fun b!1472813 () Bool)

(assert (=> b!1472813 (and (bvsge (index!50466 lt!643768) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643768) (size!48432 a!2862)))))

(declare-fun res!999751 () Bool)

(assert (=> b!1472813 (= res!999751 (= (select (arr!47881 a!2862) (index!50466 lt!643768)) (select (arr!47881 a!2862) j!93)))))

(declare-fun e!826796 () Bool)

(assert (=> b!1472813 (=> res!999751 e!826796)))

(assert (=> b!1472813 (= e!826799 e!826796)))

(declare-fun d!155905 () Bool)

(assert (=> d!155905 e!826798))

(declare-fun c!136053 () Bool)

(assert (=> d!155905 (= c!136053 (and ((_ is Intermediate!12018) lt!643768) (undefined!12830 lt!643768)))))

(assert (=> d!155905 (= lt!643768 e!826797)))

(declare-fun c!136052 () Bool)

(assert (=> d!155905 (= c!136052 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155905 (= lt!643767 (select (arr!47881 a!2862) (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687)))))

(assert (=> d!155905 (validMask!0 mask!2687)))

(assert (=> d!155905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!643768)))

(declare-fun b!1472814 () Bool)

(assert (=> b!1472814 (= e!826800 (Intermediate!12018 false (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1472815 () Bool)

(assert (=> b!1472815 (and (bvsge (index!50466 lt!643768) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643768) (size!48432 a!2862)))))

(declare-fun res!999752 () Bool)

(assert (=> b!1472815 (= res!999752 (= (select (arr!47881 a!2862) (index!50466 lt!643768)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472815 (=> res!999752 e!826796)))

(declare-fun b!1472816 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472816 (= e!826800 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1472817 () Bool)

(assert (=> b!1472817 (and (bvsge (index!50466 lt!643768) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643768) (size!48432 a!2862)))))

(assert (=> b!1472817 (= e!826796 (= (select (arr!47881 a!2862) (index!50466 lt!643768)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472818 () Bool)

(assert (=> b!1472818 (= e!826797 (Intermediate!12018 true (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155905 c!136052) b!1472818))

(assert (= (and d!155905 (not c!136052)) b!1472810))

(assert (= (and b!1472810 c!136054) b!1472814))

(assert (= (and b!1472810 (not c!136054)) b!1472816))

(assert (= (and d!155905 c!136053) b!1472812))

(assert (= (and d!155905 (not c!136053)) b!1472811))

(assert (= (and b!1472811 res!999750) b!1472813))

(assert (= (and b!1472813 (not res!999751)) b!1472815))

(assert (= (and b!1472815 (not res!999752)) b!1472817))

(assert (=> d!155905 m!1359655))

(declare-fun m!1359751 () Bool)

(assert (=> d!155905 m!1359751))

(assert (=> d!155905 m!1359633))

(declare-fun m!1359753 () Bool)

(assert (=> b!1472815 m!1359753))

(assert (=> b!1472817 m!1359753))

(assert (=> b!1472816 m!1359655))

(declare-fun m!1359755 () Bool)

(assert (=> b!1472816 m!1359755))

(assert (=> b!1472816 m!1359755))

(assert (=> b!1472816 m!1359613))

(declare-fun m!1359757 () Bool)

(assert (=> b!1472816 m!1359757))

(assert (=> b!1472813 m!1359753))

(assert (=> b!1472686 d!155905))

(declare-fun d!155907 () Bool)

(declare-fun lt!643774 () (_ BitVec 32))

(declare-fun lt!643773 () (_ BitVec 32))

(assert (=> d!155907 (= lt!643774 (bvmul (bvxor lt!643773 (bvlshr lt!643773 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155907 (= lt!643773 ((_ extract 31 0) (bvand (bvxor (select (arr!47881 a!2862) j!93) (bvlshr (select (arr!47881 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155907 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999753 (let ((h!35735 ((_ extract 31 0) (bvand (bvxor (select (arr!47881 a!2862) j!93) (bvlshr (select (arr!47881 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132233 (bvmul (bvxor h!35735 (bvlshr h!35735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132233 (bvlshr x!132233 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999753 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999753 #b00000000000000000000000000000000))))))

(assert (=> d!155907 (= (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (bvand (bvxor lt!643774 (bvlshr lt!643774 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472686 d!155907))

(declare-fun b!1472827 () Bool)

(declare-fun e!826809 () Bool)

(declare-fun e!826808 () Bool)

(assert (=> b!1472827 (= e!826809 e!826808)))

(declare-fun lt!643782 () (_ BitVec 64))

(assert (=> b!1472827 (= lt!643782 (select (arr!47881 a!2862) j!93))))

(declare-fun lt!643781 () Unit!49409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99199 (_ BitVec 64) (_ BitVec 32)) Unit!49409)

(assert (=> b!1472827 (= lt!643781 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643782 j!93))))

(declare-fun arrayContainsKey!0 (array!99199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1472827 (arrayContainsKey!0 a!2862 lt!643782 #b00000000000000000000000000000000)))

(declare-fun lt!643783 () Unit!49409)

(assert (=> b!1472827 (= lt!643783 lt!643781)))

(declare-fun res!999758 () Bool)

(assert (=> b!1472827 (= res!999758 (= (seekEntryOrOpen!0 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) (Found!12018 j!93)))))

(assert (=> b!1472827 (=> (not res!999758) (not e!826808))))

(declare-fun b!1472828 () Bool)

(declare-fun call!67812 () Bool)

(assert (=> b!1472828 (= e!826809 call!67812)))

(declare-fun b!1472829 () Bool)

(assert (=> b!1472829 (= e!826808 call!67812)))

(declare-fun bm!67809 () Bool)

(assert (=> bm!67809 (= call!67812 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155909 () Bool)

(declare-fun res!999759 () Bool)

(declare-fun e!826807 () Bool)

(assert (=> d!155909 (=> res!999759 e!826807)))

(assert (=> d!155909 (= res!999759 (bvsge j!93 (size!48432 a!2862)))))

(assert (=> d!155909 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!826807)))

(declare-fun b!1472830 () Bool)

(assert (=> b!1472830 (= e!826807 e!826809)))

(declare-fun c!136057 () Bool)

(assert (=> b!1472830 (= c!136057 (validKeyInArray!0 (select (arr!47881 a!2862) j!93)))))

(assert (= (and d!155909 (not res!999759)) b!1472830))

(assert (= (and b!1472830 c!136057) b!1472827))

(assert (= (and b!1472830 (not c!136057)) b!1472828))

(assert (= (and b!1472827 res!999758) b!1472829))

(assert (= (or b!1472829 b!1472828) bm!67809))

(assert (=> b!1472827 m!1359613))

(declare-fun m!1359759 () Bool)

(assert (=> b!1472827 m!1359759))

(declare-fun m!1359761 () Bool)

(assert (=> b!1472827 m!1359761))

(assert (=> b!1472827 m!1359613))

(assert (=> b!1472827 m!1359653))

(declare-fun m!1359763 () Bool)

(assert (=> bm!67809 m!1359763))

(assert (=> b!1472830 m!1359613))

(assert (=> b!1472830 m!1359613))

(assert (=> b!1472830 m!1359615))

(assert (=> b!1472683 d!155909))

(declare-fun d!155911 () Bool)

(assert (=> d!155911 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643786 () Unit!49409)

(declare-fun choose!38 (array!99199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49409)

(assert (=> d!155911 (= lt!643786 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155911 (validMask!0 mask!2687)))

(assert (=> d!155911 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643786)))

(declare-fun bs!42511 () Bool)

(assert (= bs!42511 d!155911))

(assert (=> bs!42511 m!1359623))

(declare-fun m!1359765 () Bool)

(assert (=> bs!42511 m!1359765))

(assert (=> bs!42511 m!1359633))

(assert (=> b!1472683 d!155911))

(declare-fun d!155913 () Bool)

(assert (=> d!155913 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125970 d!155913))

(declare-fun d!155919 () Bool)

(assert (=> d!155919 (= (array_inv!37162 a!2862) (bvsge (size!48432 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125970 d!155919))

(declare-fun b!1472846 () Bool)

(declare-fun e!826823 () SeekEntryResult!12018)

(declare-fun e!826826 () SeekEntryResult!12018)

(assert (=> b!1472846 (= e!826823 e!826826)))

(declare-fun c!136063 () Bool)

(declare-fun lt!643787 () (_ BitVec 64))

(assert (=> b!1472846 (= c!136063 (or (= lt!643787 lt!643732) (= (bvadd lt!643787 lt!643787) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472847 () Bool)

(declare-fun e!826824 () Bool)

(declare-fun e!826825 () Bool)

(assert (=> b!1472847 (= e!826824 e!826825)))

(declare-fun res!999769 () Bool)

(declare-fun lt!643788 () SeekEntryResult!12018)

(assert (=> b!1472847 (= res!999769 (and ((_ is Intermediate!12018) lt!643788) (not (undefined!12830 lt!643788)) (bvslt (x!132229 lt!643788) #b01111111111111111111111111111110) (bvsge (x!132229 lt!643788) #b00000000000000000000000000000000) (bvsge (x!132229 lt!643788) x!665)))))

(assert (=> b!1472847 (=> (not res!999769) (not e!826825))))

(declare-fun b!1472848 () Bool)

(assert (=> b!1472848 (= e!826824 (bvsge (x!132229 lt!643788) #b01111111111111111111111111111110))))

(declare-fun b!1472849 () Bool)

(assert (=> b!1472849 (and (bvsge (index!50466 lt!643788) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643788) (size!48432 lt!643728)))))

(declare-fun res!999770 () Bool)

(assert (=> b!1472849 (= res!999770 (= (select (arr!47881 lt!643728) (index!50466 lt!643788)) lt!643732))))

(declare-fun e!826822 () Bool)

(assert (=> b!1472849 (=> res!999770 e!826822)))

(assert (=> b!1472849 (= e!826825 e!826822)))

(declare-fun d!155921 () Bool)

(assert (=> d!155921 e!826824))

(declare-fun c!136062 () Bool)

(assert (=> d!155921 (= c!136062 (and ((_ is Intermediate!12018) lt!643788) (undefined!12830 lt!643788)))))

(assert (=> d!155921 (= lt!643788 e!826823)))

(declare-fun c!136061 () Bool)

(assert (=> d!155921 (= c!136061 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155921 (= lt!643787 (select (arr!47881 lt!643728) index!646))))

(assert (=> d!155921 (validMask!0 mask!2687)))

(assert (=> d!155921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643732 lt!643728 mask!2687) lt!643788)))

(declare-fun b!1472850 () Bool)

(assert (=> b!1472850 (= e!826826 (Intermediate!12018 false index!646 x!665))))

(declare-fun b!1472851 () Bool)

(assert (=> b!1472851 (and (bvsge (index!50466 lt!643788) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643788) (size!48432 lt!643728)))))

(declare-fun res!999771 () Bool)

(assert (=> b!1472851 (= res!999771 (= (select (arr!47881 lt!643728) (index!50466 lt!643788)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472851 (=> res!999771 e!826822)))

(declare-fun b!1472852 () Bool)

(assert (=> b!1472852 (= e!826826 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!643732 lt!643728 mask!2687))))

(declare-fun b!1472853 () Bool)

(assert (=> b!1472853 (and (bvsge (index!50466 lt!643788) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643788) (size!48432 lt!643728)))))

(assert (=> b!1472853 (= e!826822 (= (select (arr!47881 lt!643728) (index!50466 lt!643788)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472854 () Bool)

(assert (=> b!1472854 (= e!826823 (Intermediate!12018 true index!646 x!665))))

(assert (= (and d!155921 c!136061) b!1472854))

(assert (= (and d!155921 (not c!136061)) b!1472846))

(assert (= (and b!1472846 c!136063) b!1472850))

(assert (= (and b!1472846 (not c!136063)) b!1472852))

(assert (= (and d!155921 c!136062) b!1472848))

(assert (= (and d!155921 (not c!136062)) b!1472847))

(assert (= (and b!1472847 res!999769) b!1472849))

(assert (= (and b!1472849 (not res!999770)) b!1472851))

(assert (= (and b!1472851 (not res!999771)) b!1472853))

(declare-fun m!1359775 () Bool)

(assert (=> d!155921 m!1359775))

(assert (=> d!155921 m!1359633))

(declare-fun m!1359777 () Bool)

(assert (=> b!1472851 m!1359777))

(assert (=> b!1472853 m!1359777))

(declare-fun m!1359779 () Bool)

(assert (=> b!1472852 m!1359779))

(assert (=> b!1472852 m!1359779))

(declare-fun m!1359781 () Bool)

(assert (=> b!1472852 m!1359781))

(assert (=> b!1472849 m!1359777))

(assert (=> b!1472694 d!155921))

(declare-fun b!1472855 () Bool)

(declare-fun e!826828 () SeekEntryResult!12018)

(declare-fun e!826831 () SeekEntryResult!12018)

(assert (=> b!1472855 (= e!826828 e!826831)))

(declare-fun c!136066 () Bool)

(declare-fun lt!643789 () (_ BitVec 64))

(assert (=> b!1472855 (= c!136066 (or (= lt!643789 (select (arr!47881 a!2862) j!93)) (= (bvadd lt!643789 lt!643789) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472856 () Bool)

(declare-fun e!826829 () Bool)

(declare-fun e!826830 () Bool)

(assert (=> b!1472856 (= e!826829 e!826830)))

(declare-fun res!999772 () Bool)

(declare-fun lt!643790 () SeekEntryResult!12018)

(assert (=> b!1472856 (= res!999772 (and ((_ is Intermediate!12018) lt!643790) (not (undefined!12830 lt!643790)) (bvslt (x!132229 lt!643790) #b01111111111111111111111111111110) (bvsge (x!132229 lt!643790) #b00000000000000000000000000000000) (bvsge (x!132229 lt!643790) x!665)))))

(assert (=> b!1472856 (=> (not res!999772) (not e!826830))))

(declare-fun b!1472857 () Bool)

(assert (=> b!1472857 (= e!826829 (bvsge (x!132229 lt!643790) #b01111111111111111111111111111110))))

(declare-fun b!1472858 () Bool)

(assert (=> b!1472858 (and (bvsge (index!50466 lt!643790) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643790) (size!48432 a!2862)))))

(declare-fun res!999773 () Bool)

(assert (=> b!1472858 (= res!999773 (= (select (arr!47881 a!2862) (index!50466 lt!643790)) (select (arr!47881 a!2862) j!93)))))

(declare-fun e!826827 () Bool)

(assert (=> b!1472858 (=> res!999773 e!826827)))

(assert (=> b!1472858 (= e!826830 e!826827)))

(declare-fun d!155923 () Bool)

(assert (=> d!155923 e!826829))

(declare-fun c!136065 () Bool)

(assert (=> d!155923 (= c!136065 (and ((_ is Intermediate!12018) lt!643790) (undefined!12830 lt!643790)))))

(assert (=> d!155923 (= lt!643790 e!826828)))

(declare-fun c!136064 () Bool)

(assert (=> d!155923 (= c!136064 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155923 (= lt!643789 (select (arr!47881 a!2862) index!646))))

(assert (=> d!155923 (validMask!0 mask!2687)))

(assert (=> d!155923 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!643790)))

(declare-fun b!1472859 () Bool)

(assert (=> b!1472859 (= e!826831 (Intermediate!12018 false index!646 x!665))))

(declare-fun b!1472860 () Bool)

(assert (=> b!1472860 (and (bvsge (index!50466 lt!643790) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643790) (size!48432 a!2862)))))

(declare-fun res!999774 () Bool)

(assert (=> b!1472860 (= res!999774 (= (select (arr!47881 a!2862) (index!50466 lt!643790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472860 (=> res!999774 e!826827)))

(declare-fun b!1472861 () Bool)

(assert (=> b!1472861 (= e!826831 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1472862 () Bool)

(assert (=> b!1472862 (and (bvsge (index!50466 lt!643790) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643790) (size!48432 a!2862)))))

(assert (=> b!1472862 (= e!826827 (= (select (arr!47881 a!2862) (index!50466 lt!643790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472863 () Bool)

(assert (=> b!1472863 (= e!826828 (Intermediate!12018 true index!646 x!665))))

(assert (= (and d!155923 c!136064) b!1472863))

(assert (= (and d!155923 (not c!136064)) b!1472855))

(assert (= (and b!1472855 c!136066) b!1472859))

(assert (= (and b!1472855 (not c!136066)) b!1472861))

(assert (= (and d!155923 c!136065) b!1472857))

(assert (= (and d!155923 (not c!136065)) b!1472856))

(assert (= (and b!1472856 res!999772) b!1472858))

(assert (= (and b!1472858 (not res!999773)) b!1472860))

(assert (= (and b!1472860 (not res!999774)) b!1472862))

(declare-fun m!1359783 () Bool)

(assert (=> d!155923 m!1359783))

(assert (=> d!155923 m!1359633))

(declare-fun m!1359785 () Bool)

(assert (=> b!1472860 m!1359785))

(assert (=> b!1472862 m!1359785))

(assert (=> b!1472861 m!1359779))

(assert (=> b!1472861 m!1359779))

(assert (=> b!1472861 m!1359613))

(declare-fun m!1359787 () Bool)

(assert (=> b!1472861 m!1359787))

(assert (=> b!1472858 m!1359785))

(assert (=> b!1472695 d!155923))

(declare-fun b!1472886 () Bool)

(declare-fun e!826852 () Bool)

(declare-fun call!67821 () Bool)

(assert (=> b!1472886 (= e!826852 call!67821)))

(declare-fun b!1472887 () Bool)

(assert (=> b!1472887 (= e!826852 call!67821)))

(declare-fun d!155925 () Bool)

(declare-fun res!999789 () Bool)

(declare-fun e!826850 () Bool)

(assert (=> d!155925 (=> res!999789 e!826850)))

(assert (=> d!155925 (= res!999789 (bvsge #b00000000000000000000000000000000 (size!48432 a!2862)))))

(assert (=> d!155925 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34366) e!826850)))

(declare-fun b!1472888 () Bool)

(declare-fun e!826851 () Bool)

(declare-fun contains!9946 (List!34369 (_ BitVec 64)) Bool)

(assert (=> b!1472888 (= e!826851 (contains!9946 Nil!34366 (select (arr!47881 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1472889 () Bool)

(declare-fun e!826849 () Bool)

(assert (=> b!1472889 (= e!826849 e!826852)))

(declare-fun c!136072 () Bool)

(assert (=> b!1472889 (= c!136072 (validKeyInArray!0 (select (arr!47881 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67818 () Bool)

(assert (=> bm!67818 (= call!67821 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136072 (Cons!34365 (select (arr!47881 a!2862) #b00000000000000000000000000000000) Nil!34366) Nil!34366)))))

(declare-fun b!1472890 () Bool)

(assert (=> b!1472890 (= e!826850 e!826849)))

(declare-fun res!999788 () Bool)

(assert (=> b!1472890 (=> (not res!999788) (not e!826849))))

(assert (=> b!1472890 (= res!999788 (not e!826851))))

(declare-fun res!999787 () Bool)

(assert (=> b!1472890 (=> (not res!999787) (not e!826851))))

(assert (=> b!1472890 (= res!999787 (validKeyInArray!0 (select (arr!47881 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155925 (not res!999789)) b!1472890))

(assert (= (and b!1472890 res!999787) b!1472888))

(assert (= (and b!1472890 res!999788) b!1472889))

(assert (= (and b!1472889 c!136072) b!1472886))

(assert (= (and b!1472889 (not c!136072)) b!1472887))

(assert (= (or b!1472886 b!1472887) bm!67818))

(declare-fun m!1359797 () Bool)

(assert (=> b!1472888 m!1359797))

(assert (=> b!1472888 m!1359797))

(declare-fun m!1359799 () Bool)

(assert (=> b!1472888 m!1359799))

(assert (=> b!1472889 m!1359797))

(assert (=> b!1472889 m!1359797))

(declare-fun m!1359801 () Bool)

(assert (=> b!1472889 m!1359801))

(assert (=> bm!67818 m!1359797))

(declare-fun m!1359803 () Bool)

(assert (=> bm!67818 m!1359803))

(assert (=> b!1472890 m!1359797))

(assert (=> b!1472890 m!1359797))

(assert (=> b!1472890 m!1359801))

(assert (=> b!1472684 d!155925))

(declare-fun b!1472915 () Bool)

(declare-fun e!826865 () SeekEntryResult!12018)

(assert (=> b!1472915 (= e!826865 Undefined!12018)))

(declare-fun b!1472916 () Bool)

(declare-fun e!826866 () SeekEntryResult!12018)

(assert (=> b!1472916 (= e!826866 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!643732 lt!643728 mask!2687))))

(declare-fun b!1472917 () Bool)

(declare-fun e!826867 () SeekEntryResult!12018)

(assert (=> b!1472917 (= e!826867 (Found!12018 index!646))))

(declare-fun b!1472918 () Bool)

(declare-fun c!136087 () Bool)

(declare-fun lt!643811 () (_ BitVec 64))

(assert (=> b!1472918 (= c!136087 (= lt!643811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472918 (= e!826867 e!826866)))

(declare-fun lt!643810 () SeekEntryResult!12018)

(declare-fun d!155929 () Bool)

(assert (=> d!155929 (and (or ((_ is Undefined!12018) lt!643810) (not ((_ is Found!12018) lt!643810)) (and (bvsge (index!50465 lt!643810) #b00000000000000000000000000000000) (bvslt (index!50465 lt!643810) (size!48432 lt!643728)))) (or ((_ is Undefined!12018) lt!643810) ((_ is Found!12018) lt!643810) (not ((_ is MissingVacant!12018) lt!643810)) (not (= (index!50467 lt!643810) intermediateAfterIndex!19)) (and (bvsge (index!50467 lt!643810) #b00000000000000000000000000000000) (bvslt (index!50467 lt!643810) (size!48432 lt!643728)))) (or ((_ is Undefined!12018) lt!643810) (ite ((_ is Found!12018) lt!643810) (= (select (arr!47881 lt!643728) (index!50465 lt!643810)) lt!643732) (and ((_ is MissingVacant!12018) lt!643810) (= (index!50467 lt!643810) intermediateAfterIndex!19) (= (select (arr!47881 lt!643728) (index!50467 lt!643810)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155929 (= lt!643810 e!826865)))

(declare-fun c!136086 () Bool)

(assert (=> d!155929 (= c!136086 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155929 (= lt!643811 (select (arr!47881 lt!643728) index!646))))

(assert (=> d!155929 (validMask!0 mask!2687)))

(assert (=> d!155929 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643732 lt!643728 mask!2687) lt!643810)))

(declare-fun b!1472919 () Bool)

(assert (=> b!1472919 (= e!826866 (MissingVacant!12018 intermediateAfterIndex!19))))

(declare-fun b!1472920 () Bool)

(assert (=> b!1472920 (= e!826865 e!826867)))

(declare-fun c!136085 () Bool)

(assert (=> b!1472920 (= c!136085 (= lt!643811 lt!643732))))

(assert (= (and d!155929 c!136086) b!1472915))

(assert (= (and d!155929 (not c!136086)) b!1472920))

(assert (= (and b!1472920 c!136085) b!1472917))

(assert (= (and b!1472920 (not c!136085)) b!1472918))

(assert (= (and b!1472918 c!136087) b!1472919))

(assert (= (and b!1472918 (not c!136087)) b!1472916))

(assert (=> b!1472916 m!1359779))

(assert (=> b!1472916 m!1359779))

(declare-fun m!1359805 () Bool)

(assert (=> b!1472916 m!1359805))

(declare-fun m!1359807 () Bool)

(assert (=> d!155929 m!1359807))

(declare-fun m!1359809 () Bool)

(assert (=> d!155929 m!1359809))

(assert (=> d!155929 m!1359775))

(assert (=> d!155929 m!1359633))

(assert (=> b!1472690 d!155929))

(declare-fun b!1472990 () Bool)

(declare-fun e!826906 () SeekEntryResult!12018)

(assert (=> b!1472990 (= e!826906 Undefined!12018)))

(declare-fun d!155933 () Bool)

(declare-fun lt!643838 () SeekEntryResult!12018)

(assert (=> d!155933 (and (or ((_ is Undefined!12018) lt!643838) (not ((_ is Found!12018) lt!643838)) (and (bvsge (index!50465 lt!643838) #b00000000000000000000000000000000) (bvslt (index!50465 lt!643838) (size!48432 lt!643728)))) (or ((_ is Undefined!12018) lt!643838) ((_ is Found!12018) lt!643838) (not ((_ is MissingZero!12018) lt!643838)) (and (bvsge (index!50464 lt!643838) #b00000000000000000000000000000000) (bvslt (index!50464 lt!643838) (size!48432 lt!643728)))) (or ((_ is Undefined!12018) lt!643838) ((_ is Found!12018) lt!643838) ((_ is MissingZero!12018) lt!643838) (not ((_ is MissingVacant!12018) lt!643838)) (and (bvsge (index!50467 lt!643838) #b00000000000000000000000000000000) (bvslt (index!50467 lt!643838) (size!48432 lt!643728)))) (or ((_ is Undefined!12018) lt!643838) (ite ((_ is Found!12018) lt!643838) (= (select (arr!47881 lt!643728) (index!50465 lt!643838)) lt!643732) (ite ((_ is MissingZero!12018) lt!643838) (= (select (arr!47881 lt!643728) (index!50464 lt!643838)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12018) lt!643838) (= (select (arr!47881 lt!643728) (index!50467 lt!643838)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155933 (= lt!643838 e!826906)))

(declare-fun c!136119 () Bool)

(declare-fun lt!643837 () SeekEntryResult!12018)

(assert (=> d!155933 (= c!136119 (and ((_ is Intermediate!12018) lt!643837) (undefined!12830 lt!643837)))))

(assert (=> d!155933 (= lt!643837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643732 mask!2687) lt!643732 lt!643728 mask!2687))))

(assert (=> d!155933 (validMask!0 mask!2687)))

(assert (=> d!155933 (= (seekEntryOrOpen!0 lt!643732 lt!643728 mask!2687) lt!643838)))

(declare-fun e!826904 () SeekEntryResult!12018)

(declare-fun b!1472991 () Bool)

(assert (=> b!1472991 (= e!826904 (seekKeyOrZeroReturnVacant!0 (x!132229 lt!643837) (index!50466 lt!643837) (index!50466 lt!643837) lt!643732 lt!643728 mask!2687))))

(declare-fun b!1472992 () Bool)

(declare-fun e!826905 () SeekEntryResult!12018)

(assert (=> b!1472992 (= e!826905 (Found!12018 (index!50466 lt!643837)))))

(declare-fun b!1472993 () Bool)

(assert (=> b!1472993 (= e!826904 (MissingZero!12018 (index!50466 lt!643837)))))

(declare-fun b!1472994 () Bool)

(declare-fun c!136120 () Bool)

(declare-fun lt!643836 () (_ BitVec 64))

(assert (=> b!1472994 (= c!136120 (= lt!643836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472994 (= e!826905 e!826904)))

(declare-fun b!1472995 () Bool)

(assert (=> b!1472995 (= e!826906 e!826905)))

(assert (=> b!1472995 (= lt!643836 (select (arr!47881 lt!643728) (index!50466 lt!643837)))))

(declare-fun c!136118 () Bool)

(assert (=> b!1472995 (= c!136118 (= lt!643836 lt!643732))))

(assert (= (and d!155933 c!136119) b!1472990))

(assert (= (and d!155933 (not c!136119)) b!1472995))

(assert (= (and b!1472995 c!136118) b!1472992))

(assert (= (and b!1472995 (not c!136118)) b!1472994))

(assert (= (and b!1472994 c!136120) b!1472993))

(assert (= (and b!1472994 (not c!136120)) b!1472991))

(assert (=> d!155933 m!1359633))

(assert (=> d!155933 m!1359645))

(declare-fun m!1359849 () Bool)

(assert (=> d!155933 m!1359849))

(declare-fun m!1359851 () Bool)

(assert (=> d!155933 m!1359851))

(declare-fun m!1359853 () Bool)

(assert (=> d!155933 m!1359853))

(assert (=> d!155933 m!1359645))

(assert (=> d!155933 m!1359647))

(declare-fun m!1359855 () Bool)

(assert (=> b!1472991 m!1359855))

(declare-fun m!1359857 () Bool)

(assert (=> b!1472995 m!1359857))

(assert (=> b!1472690 d!155933))

(declare-fun b!1472996 () Bool)

(declare-fun e!826909 () Bool)

(declare-fun e!826908 () Bool)

(assert (=> b!1472996 (= e!826909 e!826908)))

(declare-fun lt!643840 () (_ BitVec 64))

(assert (=> b!1472996 (= lt!643840 (select (arr!47881 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643839 () Unit!49409)

(assert (=> b!1472996 (= lt!643839 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643840 #b00000000000000000000000000000000))))

(assert (=> b!1472996 (arrayContainsKey!0 a!2862 lt!643840 #b00000000000000000000000000000000)))

(declare-fun lt!643841 () Unit!49409)

(assert (=> b!1472996 (= lt!643841 lt!643839)))

(declare-fun res!999799 () Bool)

(assert (=> b!1472996 (= res!999799 (= (seekEntryOrOpen!0 (select (arr!47881 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12018 #b00000000000000000000000000000000)))))

(assert (=> b!1472996 (=> (not res!999799) (not e!826908))))

(declare-fun b!1472997 () Bool)

(declare-fun call!67822 () Bool)

(assert (=> b!1472997 (= e!826909 call!67822)))

(declare-fun b!1472998 () Bool)

(assert (=> b!1472998 (= e!826908 call!67822)))

(declare-fun bm!67819 () Bool)

(assert (=> bm!67819 (= call!67822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155943 () Bool)

(declare-fun res!999800 () Bool)

(declare-fun e!826907 () Bool)

(assert (=> d!155943 (=> res!999800 e!826907)))

(assert (=> d!155943 (= res!999800 (bvsge #b00000000000000000000000000000000 (size!48432 a!2862)))))

(assert (=> d!155943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!826907)))

(declare-fun b!1472999 () Bool)

(assert (=> b!1472999 (= e!826907 e!826909)))

(declare-fun c!136121 () Bool)

(assert (=> b!1472999 (= c!136121 (validKeyInArray!0 (select (arr!47881 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155943 (not res!999800)) b!1472999))

(assert (= (and b!1472999 c!136121) b!1472996))

(assert (= (and b!1472999 (not c!136121)) b!1472997))

(assert (= (and b!1472996 res!999799) b!1472998))

(assert (= (or b!1472998 b!1472997) bm!67819))

(assert (=> b!1472996 m!1359797))

(declare-fun m!1359859 () Bool)

(assert (=> b!1472996 m!1359859))

(declare-fun m!1359861 () Bool)

(assert (=> b!1472996 m!1359861))

(assert (=> b!1472996 m!1359797))

(declare-fun m!1359863 () Bool)

(assert (=> b!1472996 m!1359863))

(declare-fun m!1359865 () Bool)

(assert (=> bm!67819 m!1359865))

(assert (=> b!1472999 m!1359797))

(assert (=> b!1472999 m!1359797))

(assert (=> b!1472999 m!1359801))

(assert (=> b!1472691 d!155943))

(declare-fun d!155945 () Bool)

(assert (=> d!155945 (= (validKeyInArray!0 (select (arr!47881 a!2862) i!1006)) (and (not (= (select (arr!47881 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47881 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472680 d!155945))

(declare-fun b!1473000 () Bool)

(declare-fun e!826912 () SeekEntryResult!12018)

(assert (=> b!1473000 (= e!826912 Undefined!12018)))

(declare-fun d!155947 () Bool)

(declare-fun lt!643844 () SeekEntryResult!12018)

(assert (=> d!155947 (and (or ((_ is Undefined!12018) lt!643844) (not ((_ is Found!12018) lt!643844)) (and (bvsge (index!50465 lt!643844) #b00000000000000000000000000000000) (bvslt (index!50465 lt!643844) (size!48432 a!2862)))) (or ((_ is Undefined!12018) lt!643844) ((_ is Found!12018) lt!643844) (not ((_ is MissingZero!12018) lt!643844)) (and (bvsge (index!50464 lt!643844) #b00000000000000000000000000000000) (bvslt (index!50464 lt!643844) (size!48432 a!2862)))) (or ((_ is Undefined!12018) lt!643844) ((_ is Found!12018) lt!643844) ((_ is MissingZero!12018) lt!643844) (not ((_ is MissingVacant!12018) lt!643844)) (and (bvsge (index!50467 lt!643844) #b00000000000000000000000000000000) (bvslt (index!50467 lt!643844) (size!48432 a!2862)))) (or ((_ is Undefined!12018) lt!643844) (ite ((_ is Found!12018) lt!643844) (= (select (arr!47881 a!2862) (index!50465 lt!643844)) (select (arr!47881 a!2862) j!93)) (ite ((_ is MissingZero!12018) lt!643844) (= (select (arr!47881 a!2862) (index!50464 lt!643844)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12018) lt!643844) (= (select (arr!47881 a!2862) (index!50467 lt!643844)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155947 (= lt!643844 e!826912)))

(declare-fun c!136123 () Bool)

(declare-fun lt!643843 () SeekEntryResult!12018)

(assert (=> d!155947 (= c!136123 (and ((_ is Intermediate!12018) lt!643843) (undefined!12830 lt!643843)))))

(assert (=> d!155947 (= lt!643843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155947 (validMask!0 mask!2687)))

(assert (=> d!155947 (= (seekEntryOrOpen!0 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!643844)))

(declare-fun e!826910 () SeekEntryResult!12018)

(declare-fun b!1473001 () Bool)

(assert (=> b!1473001 (= e!826910 (seekKeyOrZeroReturnVacant!0 (x!132229 lt!643843) (index!50466 lt!643843) (index!50466 lt!643843) (select (arr!47881 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473002 () Bool)

(declare-fun e!826911 () SeekEntryResult!12018)

(assert (=> b!1473002 (= e!826911 (Found!12018 (index!50466 lt!643843)))))

(declare-fun b!1473003 () Bool)

(assert (=> b!1473003 (= e!826910 (MissingZero!12018 (index!50466 lt!643843)))))

(declare-fun b!1473004 () Bool)

(declare-fun c!136124 () Bool)

(declare-fun lt!643842 () (_ BitVec 64))

(assert (=> b!1473004 (= c!136124 (= lt!643842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473004 (= e!826911 e!826910)))

(declare-fun b!1473005 () Bool)

(assert (=> b!1473005 (= e!826912 e!826911)))

(assert (=> b!1473005 (= lt!643842 (select (arr!47881 a!2862) (index!50466 lt!643843)))))

(declare-fun c!136122 () Bool)

(assert (=> b!1473005 (= c!136122 (= lt!643842 (select (arr!47881 a!2862) j!93)))))

(assert (= (and d!155947 c!136123) b!1473000))

(assert (= (and d!155947 (not c!136123)) b!1473005))

(assert (= (and b!1473005 c!136122) b!1473002))

(assert (= (and b!1473005 (not c!136122)) b!1473004))

(assert (= (and b!1473004 c!136124) b!1473003))

(assert (= (and b!1473004 (not c!136124)) b!1473001))

(assert (=> d!155947 m!1359633))

(assert (=> d!155947 m!1359613))

(assert (=> d!155947 m!1359655))

(declare-fun m!1359867 () Bool)

(assert (=> d!155947 m!1359867))

(declare-fun m!1359869 () Bool)

(assert (=> d!155947 m!1359869))

(declare-fun m!1359871 () Bool)

(assert (=> d!155947 m!1359871))

(assert (=> d!155947 m!1359655))

(assert (=> d!155947 m!1359613))

(assert (=> d!155947 m!1359657))

(assert (=> b!1473001 m!1359613))

(declare-fun m!1359873 () Bool)

(assert (=> b!1473001 m!1359873))

(declare-fun m!1359875 () Bool)

(assert (=> b!1473005 m!1359875))

(assert (=> b!1472681 d!155947))

(declare-fun d!155949 () Bool)

(assert (=> d!155949 (= (validKeyInArray!0 (select (arr!47881 a!2862) j!93)) (and (not (= (select (arr!47881 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47881 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472692 d!155949))

(declare-fun b!1473006 () Bool)

(declare-fun e!826914 () SeekEntryResult!12018)

(declare-fun e!826917 () SeekEntryResult!12018)

(assert (=> b!1473006 (= e!826914 e!826917)))

(declare-fun c!136127 () Bool)

(declare-fun lt!643845 () (_ BitVec 64))

(assert (=> b!1473006 (= c!136127 (or (= lt!643845 lt!643732) (= (bvadd lt!643845 lt!643845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473007 () Bool)

(declare-fun e!826915 () Bool)

(declare-fun e!826916 () Bool)

(assert (=> b!1473007 (= e!826915 e!826916)))

(declare-fun res!999801 () Bool)

(declare-fun lt!643846 () SeekEntryResult!12018)

(assert (=> b!1473007 (= res!999801 (and ((_ is Intermediate!12018) lt!643846) (not (undefined!12830 lt!643846)) (bvslt (x!132229 lt!643846) #b01111111111111111111111111111110) (bvsge (x!132229 lt!643846) #b00000000000000000000000000000000) (bvsge (x!132229 lt!643846) #b00000000000000000000000000000000)))))

(assert (=> b!1473007 (=> (not res!999801) (not e!826916))))

(declare-fun b!1473008 () Bool)

(assert (=> b!1473008 (= e!826915 (bvsge (x!132229 lt!643846) #b01111111111111111111111111111110))))

(declare-fun b!1473009 () Bool)

(assert (=> b!1473009 (and (bvsge (index!50466 lt!643846) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643846) (size!48432 lt!643728)))))

(declare-fun res!999802 () Bool)

(assert (=> b!1473009 (= res!999802 (= (select (arr!47881 lt!643728) (index!50466 lt!643846)) lt!643732))))

(declare-fun e!826913 () Bool)

(assert (=> b!1473009 (=> res!999802 e!826913)))

(assert (=> b!1473009 (= e!826916 e!826913)))

(declare-fun d!155951 () Bool)

(assert (=> d!155951 e!826915))

(declare-fun c!136126 () Bool)

(assert (=> d!155951 (= c!136126 (and ((_ is Intermediate!12018) lt!643846) (undefined!12830 lt!643846)))))

(assert (=> d!155951 (= lt!643846 e!826914)))

(declare-fun c!136125 () Bool)

(assert (=> d!155951 (= c!136125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155951 (= lt!643845 (select (arr!47881 lt!643728) (toIndex!0 lt!643732 mask!2687)))))

(assert (=> d!155951 (validMask!0 mask!2687)))

(assert (=> d!155951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643732 mask!2687) lt!643732 lt!643728 mask!2687) lt!643846)))

(declare-fun b!1473010 () Bool)

(assert (=> b!1473010 (= e!826917 (Intermediate!12018 false (toIndex!0 lt!643732 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473011 () Bool)

(assert (=> b!1473011 (and (bvsge (index!50466 lt!643846) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643846) (size!48432 lt!643728)))))

(declare-fun res!999803 () Bool)

(assert (=> b!1473011 (= res!999803 (= (select (arr!47881 lt!643728) (index!50466 lt!643846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473011 (=> res!999803 e!826913)))

(declare-fun b!1473012 () Bool)

(assert (=> b!1473012 (= e!826917 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643732 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!643732 lt!643728 mask!2687))))

(declare-fun b!1473013 () Bool)

(assert (=> b!1473013 (and (bvsge (index!50466 lt!643846) #b00000000000000000000000000000000) (bvslt (index!50466 lt!643846) (size!48432 lt!643728)))))

(assert (=> b!1473013 (= e!826913 (= (select (arr!47881 lt!643728) (index!50466 lt!643846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473014 () Bool)

(assert (=> b!1473014 (= e!826914 (Intermediate!12018 true (toIndex!0 lt!643732 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155951 c!136125) b!1473014))

(assert (= (and d!155951 (not c!136125)) b!1473006))

(assert (= (and b!1473006 c!136127) b!1473010))

(assert (= (and b!1473006 (not c!136127)) b!1473012))

(assert (= (and d!155951 c!136126) b!1473008))

(assert (= (and d!155951 (not c!136126)) b!1473007))

(assert (= (and b!1473007 res!999801) b!1473009))

(assert (= (and b!1473009 (not res!999802)) b!1473011))

(assert (= (and b!1473011 (not res!999803)) b!1473013))

(assert (=> d!155951 m!1359645))

(declare-fun m!1359877 () Bool)

(assert (=> d!155951 m!1359877))

(assert (=> d!155951 m!1359633))

(declare-fun m!1359879 () Bool)

(assert (=> b!1473011 m!1359879))

(assert (=> b!1473013 m!1359879))

(assert (=> b!1473012 m!1359645))

(declare-fun m!1359881 () Bool)

(assert (=> b!1473012 m!1359881))

(assert (=> b!1473012 m!1359881))

(declare-fun m!1359883 () Bool)

(assert (=> b!1473012 m!1359883))

(assert (=> b!1473009 m!1359879))

(assert (=> b!1472689 d!155951))

(declare-fun d!155953 () Bool)

(declare-fun lt!643848 () (_ BitVec 32))

(declare-fun lt!643847 () (_ BitVec 32))

(assert (=> d!155953 (= lt!643848 (bvmul (bvxor lt!643847 (bvlshr lt!643847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155953 (= lt!643847 ((_ extract 31 0) (bvand (bvxor lt!643732 (bvlshr lt!643732 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155953 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999753 (let ((h!35735 ((_ extract 31 0) (bvand (bvxor lt!643732 (bvlshr lt!643732 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132233 (bvmul (bvxor h!35735 (bvlshr h!35735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132233 (bvlshr x!132233 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999753 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999753 #b00000000000000000000000000000000))))))

(assert (=> d!155953 (= (toIndex!0 lt!643732 mask!2687) (bvand (bvxor lt!643848 (bvlshr lt!643848 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472689 d!155953))

(check-sat (not b!1472888) (not b!1472916) (not d!155905) (not b!1472830) (not d!155933) (not b!1472889) (not b!1472991) (not b!1472861) (not d!155921) (not d!155911) (not b!1473001) (not b!1472852) (not b!1472816) (not bm!67819) (not bm!67818) (not b!1472999) (not b!1472996) (not b!1472827) (not d!155923) (not d!155951) (not b!1473012) (not b!1472890) (not d!155929) (not d!155947) (not bm!67809))
(check-sat)
