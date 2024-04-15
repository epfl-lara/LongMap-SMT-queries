; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127148 () Bool)

(assert start!127148)

(declare-fun lt!651282 () (_ BitVec 32))

(declare-fun b!1494639 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99730 0))(
  ( (array!99731 (arr!48133 (Array (_ BitVec 32) (_ BitVec 64))) (size!48685 (_ BitVec 32))) )
))
(declare-fun lt!651285 () array!99730)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!651283 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!837165 () Bool)

(declare-datatypes ((SeekEntryResult!12398 0))(
  ( (MissingZero!12398 (index!51984 (_ BitVec 32))) (Found!12398 (index!51985 (_ BitVec 32))) (Intermediate!12398 (undefined!13210 Bool) (index!51986 (_ BitVec 32)) (x!133587 (_ BitVec 32))) (Undefined!12398) (MissingVacant!12398 (index!51987 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99730 (_ BitVec 32)) SeekEntryResult!12398)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99730 (_ BitVec 32)) SeekEntryResult!12398)

(assert (=> b!1494639 (= e!837165 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651282 intermediateAfterIndex!19 lt!651283 lt!651285 mask!2687) (seekEntryOrOpen!0 lt!651283 lt!651285 mask!2687)))))

(declare-fun b!1494640 () Bool)

(declare-fun res!1016944 () Bool)

(declare-fun e!837173 () Bool)

(assert (=> b!1494640 (=> (not res!1016944) (not e!837173))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494640 (= res!1016944 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494641 () Bool)

(declare-fun e!837171 () Bool)

(assert (=> b!1494641 (= e!837171 e!837165)))

(declare-fun c!138391 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494641 (= c!138391 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1494642 () Bool)

(declare-fun e!837167 () Bool)

(declare-fun e!837169 () Bool)

(assert (=> b!1494642 (= e!837167 e!837169)))

(declare-fun res!1016936 () Bool)

(assert (=> b!1494642 (=> (not res!1016936) (not e!837169))))

(declare-fun a!2862 () array!99730)

(assert (=> b!1494642 (= res!1016936 (= (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494642 (= lt!651285 (array!99731 (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48685 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!837172 () Bool)

(declare-fun b!1494643 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1494643 (= e!837172 (or (= (select (arr!48133 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48133 a!2862) intermediateBeforeIndex!19) (select (arr!48133 a!2862) j!93))))))

(declare-fun b!1494644 () Bool)

(declare-fun res!1016932 () Bool)

(assert (=> b!1494644 (=> (not res!1016932) (not e!837167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494644 (= res!1016932 (validKeyInArray!0 (select (arr!48133 a!2862) j!93)))))

(declare-fun b!1494645 () Bool)

(declare-fun e!837166 () Bool)

(assert (=> b!1494645 (= e!837166 e!837171)))

(declare-fun res!1016937 () Bool)

(assert (=> b!1494645 (=> res!1016937 e!837171)))

(assert (=> b!1494645 (= res!1016937 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651282 #b00000000000000000000000000000000) (bvsge lt!651282 (size!48685 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494645 (= lt!651282 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494646 () Bool)

(declare-fun res!1016935 () Bool)

(assert (=> b!1494646 (=> (not res!1016935) (not e!837167))))

(assert (=> b!1494646 (= res!1016935 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48685 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48685 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48685 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494647 () Bool)

(declare-fun res!1016929 () Bool)

(declare-fun e!837170 () Bool)

(assert (=> b!1494647 (=> (not res!1016929) (not e!837170))))

(declare-fun lt!651284 () SeekEntryResult!12398)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99730 (_ BitVec 32)) SeekEntryResult!12398)

(assert (=> b!1494647 (= res!1016929 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651284))))

(declare-fun b!1494648 () Bool)

(assert (=> b!1494648 (= e!837170 e!837173)))

(declare-fun res!1016940 () Bool)

(assert (=> b!1494648 (=> (not res!1016940) (not e!837173))))

(declare-fun lt!651286 () SeekEntryResult!12398)

(assert (=> b!1494648 (= res!1016940 (= lt!651286 (Intermediate!12398 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494648 (= lt!651286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651283 mask!2687) lt!651283 lt!651285 mask!2687))))

(assert (=> b!1494648 (= lt!651283 (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494649 () Bool)

(assert (=> b!1494649 (= e!837165 (= lt!651286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651282 lt!651283 lt!651285 mask!2687)))))

(declare-fun b!1494650 () Bool)

(declare-fun res!1016933 () Bool)

(assert (=> b!1494650 (=> (not res!1016933) (not e!837173))))

(declare-fun e!837168 () Bool)

(assert (=> b!1494650 (= res!1016933 e!837168)))

(declare-fun c!138390 () Bool)

(assert (=> b!1494650 (= c!138390 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494651 () Bool)

(declare-fun res!1016939 () Bool)

(assert (=> b!1494651 (=> (not res!1016939) (not e!837167))))

(assert (=> b!1494651 (= res!1016939 (validKeyInArray!0 (select (arr!48133 a!2862) i!1006)))))

(declare-fun b!1494652 () Bool)

(declare-fun res!1016927 () Bool)

(assert (=> b!1494652 (=> (not res!1016927) (not e!837172))))

(assert (=> b!1494652 (= res!1016927 (= (seekEntryOrOpen!0 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) (Found!12398 j!93)))))

(declare-fun b!1494653 () Bool)

(declare-fun res!1016941 () Bool)

(assert (=> b!1494653 (=> (not res!1016941) (not e!837167))))

(assert (=> b!1494653 (= res!1016941 (and (= (size!48685 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48685 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48685 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494654 () Bool)

(assert (=> b!1494654 (= e!837173 (not e!837166))))

(declare-fun res!1016931 () Bool)

(assert (=> b!1494654 (=> res!1016931 e!837166)))

(assert (=> b!1494654 (= res!1016931 (or (and (= (select (arr!48133 a!2862) index!646) (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48133 a!2862) index!646) (select (arr!48133 a!2862) j!93))) (= (select (arr!48133 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494654 e!837172))

(declare-fun res!1016943 () Bool)

(assert (=> b!1494654 (=> (not res!1016943) (not e!837172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99730 (_ BitVec 32)) Bool)

(assert (=> b!1494654 (= res!1016943 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49977 0))(
  ( (Unit!49978) )
))
(declare-fun lt!651287 () Unit!49977)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49977)

(assert (=> b!1494654 (= lt!651287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494655 () Bool)

(declare-fun res!1016938 () Bool)

(assert (=> b!1494655 (=> (not res!1016938) (not e!837167))))

(assert (=> b!1494655 (= res!1016938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494657 () Bool)

(assert (=> b!1494657 (= e!837168 (= lt!651286 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651283 lt!651285 mask!2687)))))

(declare-fun b!1494658 () Bool)

(assert (=> b!1494658 (= e!837169 e!837170)))

(declare-fun res!1016942 () Bool)

(assert (=> b!1494658 (=> (not res!1016942) (not e!837170))))

(assert (=> b!1494658 (= res!1016942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651284))))

(assert (=> b!1494658 (= lt!651284 (Intermediate!12398 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494659 () Bool)

(declare-fun res!1016928 () Bool)

(assert (=> b!1494659 (=> res!1016928 e!837171)))

(assert (=> b!1494659 (= res!1016928 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651282 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651284)))))

(declare-fun b!1494660 () Bool)

(assert (=> b!1494660 (= e!837168 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651283 lt!651285 mask!2687) (seekEntryOrOpen!0 lt!651283 lt!651285 mask!2687)))))

(declare-fun res!1016930 () Bool)

(assert (=> start!127148 (=> (not res!1016930) (not e!837167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127148 (= res!1016930 (validMask!0 mask!2687))))

(assert (=> start!127148 e!837167))

(assert (=> start!127148 true))

(declare-fun array_inv!37366 (array!99730) Bool)

(assert (=> start!127148 (array_inv!37366 a!2862)))

(declare-fun b!1494656 () Bool)

(declare-fun res!1016934 () Bool)

(assert (=> b!1494656 (=> (not res!1016934) (not e!837167))))

(declare-datatypes ((List!34712 0))(
  ( (Nil!34709) (Cons!34708 (h!36100 (_ BitVec 64)) (t!49398 List!34712)) )
))
(declare-fun arrayNoDuplicates!0 (array!99730 (_ BitVec 32) List!34712) Bool)

(assert (=> b!1494656 (= res!1016934 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34709))))

(assert (= (and start!127148 res!1016930) b!1494653))

(assert (= (and b!1494653 res!1016941) b!1494651))

(assert (= (and b!1494651 res!1016939) b!1494644))

(assert (= (and b!1494644 res!1016932) b!1494655))

(assert (= (and b!1494655 res!1016938) b!1494656))

(assert (= (and b!1494656 res!1016934) b!1494646))

(assert (= (and b!1494646 res!1016935) b!1494642))

(assert (= (and b!1494642 res!1016936) b!1494658))

(assert (= (and b!1494658 res!1016942) b!1494647))

(assert (= (and b!1494647 res!1016929) b!1494648))

(assert (= (and b!1494648 res!1016940) b!1494650))

(assert (= (and b!1494650 c!138390) b!1494657))

(assert (= (and b!1494650 (not c!138390)) b!1494660))

(assert (= (and b!1494650 res!1016933) b!1494640))

(assert (= (and b!1494640 res!1016944) b!1494654))

(assert (= (and b!1494654 res!1016943) b!1494652))

(assert (= (and b!1494652 res!1016927) b!1494643))

(assert (= (and b!1494654 (not res!1016931)) b!1494645))

(assert (= (and b!1494645 (not res!1016937)) b!1494659))

(assert (= (and b!1494659 (not res!1016928)) b!1494641))

(assert (= (and b!1494641 c!138391) b!1494649))

(assert (= (and b!1494641 (not c!138391)) b!1494639))

(declare-fun m!1377681 () Bool)

(assert (=> b!1494658 m!1377681))

(assert (=> b!1494658 m!1377681))

(declare-fun m!1377683 () Bool)

(assert (=> b!1494658 m!1377683))

(assert (=> b!1494658 m!1377683))

(assert (=> b!1494658 m!1377681))

(declare-fun m!1377685 () Bool)

(assert (=> b!1494658 m!1377685))

(declare-fun m!1377687 () Bool)

(assert (=> start!127148 m!1377687))

(declare-fun m!1377689 () Bool)

(assert (=> start!127148 m!1377689))

(declare-fun m!1377691 () Bool)

(assert (=> b!1494654 m!1377691))

(declare-fun m!1377693 () Bool)

(assert (=> b!1494654 m!1377693))

(declare-fun m!1377695 () Bool)

(assert (=> b!1494654 m!1377695))

(declare-fun m!1377697 () Bool)

(assert (=> b!1494654 m!1377697))

(declare-fun m!1377699 () Bool)

(assert (=> b!1494654 m!1377699))

(assert (=> b!1494654 m!1377681))

(declare-fun m!1377701 () Bool)

(assert (=> b!1494655 m!1377701))

(assert (=> b!1494659 m!1377681))

(assert (=> b!1494659 m!1377681))

(declare-fun m!1377703 () Bool)

(assert (=> b!1494659 m!1377703))

(assert (=> b!1494652 m!1377681))

(assert (=> b!1494652 m!1377681))

(declare-fun m!1377705 () Bool)

(assert (=> b!1494652 m!1377705))

(declare-fun m!1377707 () Bool)

(assert (=> b!1494660 m!1377707))

(declare-fun m!1377709 () Bool)

(assert (=> b!1494660 m!1377709))

(assert (=> b!1494644 m!1377681))

(assert (=> b!1494644 m!1377681))

(declare-fun m!1377711 () Bool)

(assert (=> b!1494644 m!1377711))

(assert (=> b!1494647 m!1377681))

(assert (=> b!1494647 m!1377681))

(declare-fun m!1377713 () Bool)

(assert (=> b!1494647 m!1377713))

(declare-fun m!1377715 () Bool)

(assert (=> b!1494656 m!1377715))

(declare-fun m!1377717 () Bool)

(assert (=> b!1494643 m!1377717))

(assert (=> b!1494643 m!1377681))

(declare-fun m!1377719 () Bool)

(assert (=> b!1494657 m!1377719))

(declare-fun m!1377721 () Bool)

(assert (=> b!1494648 m!1377721))

(assert (=> b!1494648 m!1377721))

(declare-fun m!1377723 () Bool)

(assert (=> b!1494648 m!1377723))

(assert (=> b!1494648 m!1377693))

(declare-fun m!1377725 () Bool)

(assert (=> b!1494648 m!1377725))

(declare-fun m!1377727 () Bool)

(assert (=> b!1494645 m!1377727))

(assert (=> b!1494642 m!1377693))

(declare-fun m!1377729 () Bool)

(assert (=> b!1494642 m!1377729))

(declare-fun m!1377731 () Bool)

(assert (=> b!1494639 m!1377731))

(assert (=> b!1494639 m!1377709))

(declare-fun m!1377733 () Bool)

(assert (=> b!1494649 m!1377733))

(declare-fun m!1377735 () Bool)

(assert (=> b!1494651 m!1377735))

(assert (=> b!1494651 m!1377735))

(declare-fun m!1377737 () Bool)

(assert (=> b!1494651 m!1377737))

(check-sat (not b!1494651) (not b!1494657) (not b!1494660) (not b!1494639) (not b!1494656) (not b!1494644) (not b!1494648) (not b!1494647) (not b!1494645) (not b!1494654) (not b!1494658) (not b!1494659) (not b!1494655) (not start!127148) (not b!1494649) (not b!1494652))
(check-sat)
(get-model)

(declare-fun b!1494801 () Bool)

(declare-fun e!837242 () Bool)

(declare-fun call!67967 () Bool)

(assert (=> b!1494801 (= e!837242 call!67967)))

(declare-fun d!156911 () Bool)

(declare-fun res!1017058 () Bool)

(declare-fun e!837241 () Bool)

(assert (=> d!156911 (=> res!1017058 e!837241)))

(assert (=> d!156911 (= res!1017058 (bvsge j!93 (size!48685 a!2862)))))

(assert (=> d!156911 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837241)))

(declare-fun b!1494802 () Bool)

(declare-fun e!837240 () Bool)

(assert (=> b!1494802 (= e!837240 call!67967)))

(declare-fun b!1494803 () Bool)

(assert (=> b!1494803 (= e!837241 e!837240)))

(declare-fun c!138406 () Bool)

(assert (=> b!1494803 (= c!138406 (validKeyInArray!0 (select (arr!48133 a!2862) j!93)))))

(declare-fun bm!67964 () Bool)

(assert (=> bm!67964 (= call!67967 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494804 () Bool)

(assert (=> b!1494804 (= e!837240 e!837242)))

(declare-fun lt!651330 () (_ BitVec 64))

(assert (=> b!1494804 (= lt!651330 (select (arr!48133 a!2862) j!93))))

(declare-fun lt!651331 () Unit!49977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99730 (_ BitVec 64) (_ BitVec 32)) Unit!49977)

(assert (=> b!1494804 (= lt!651331 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651330 j!93))))

(declare-fun arrayContainsKey!0 (array!99730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1494804 (arrayContainsKey!0 a!2862 lt!651330 #b00000000000000000000000000000000)))

(declare-fun lt!651332 () Unit!49977)

(assert (=> b!1494804 (= lt!651332 lt!651331)))

(declare-fun res!1017057 () Bool)

(assert (=> b!1494804 (= res!1017057 (= (seekEntryOrOpen!0 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) (Found!12398 j!93)))))

(assert (=> b!1494804 (=> (not res!1017057) (not e!837242))))

(assert (= (and d!156911 (not res!1017058)) b!1494803))

(assert (= (and b!1494803 c!138406) b!1494804))

(assert (= (and b!1494803 (not c!138406)) b!1494802))

(assert (= (and b!1494804 res!1017057) b!1494801))

(assert (= (or b!1494801 b!1494802) bm!67964))

(assert (=> b!1494803 m!1377681))

(assert (=> b!1494803 m!1377681))

(assert (=> b!1494803 m!1377711))

(declare-fun m!1377855 () Bool)

(assert (=> bm!67964 m!1377855))

(assert (=> b!1494804 m!1377681))

(declare-fun m!1377857 () Bool)

(assert (=> b!1494804 m!1377857))

(declare-fun m!1377859 () Bool)

(assert (=> b!1494804 m!1377859))

(assert (=> b!1494804 m!1377681))

(assert (=> b!1494804 m!1377705))

(assert (=> b!1494654 d!156911))

(declare-fun d!156913 () Bool)

(assert (=> d!156913 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651335 () Unit!49977)

(declare-fun choose!38 (array!99730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49977)

(assert (=> d!156913 (= lt!651335 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156913 (validMask!0 mask!2687)))

(assert (=> d!156913 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651335)))

(declare-fun bs!42865 () Bool)

(assert (= bs!42865 d!156913))

(assert (=> bs!42865 m!1377699))

(declare-fun m!1377861 () Bool)

(assert (=> bs!42865 m!1377861))

(assert (=> bs!42865 m!1377687))

(assert (=> b!1494654 d!156913))

(declare-fun d!156915 () Bool)

(assert (=> d!156915 (= (validKeyInArray!0 (select (arr!48133 a!2862) j!93)) (and (not (= (select (arr!48133 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48133 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494644 d!156915))

(declare-fun b!1494805 () Bool)

(declare-fun e!837245 () Bool)

(declare-fun call!67968 () Bool)

(assert (=> b!1494805 (= e!837245 call!67968)))

(declare-fun d!156917 () Bool)

(declare-fun res!1017060 () Bool)

(declare-fun e!837244 () Bool)

(assert (=> d!156917 (=> res!1017060 e!837244)))

(assert (=> d!156917 (= res!1017060 (bvsge #b00000000000000000000000000000000 (size!48685 a!2862)))))

(assert (=> d!156917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837244)))

(declare-fun b!1494806 () Bool)

(declare-fun e!837243 () Bool)

(assert (=> b!1494806 (= e!837243 call!67968)))

(declare-fun b!1494807 () Bool)

(assert (=> b!1494807 (= e!837244 e!837243)))

(declare-fun c!138407 () Bool)

(assert (=> b!1494807 (= c!138407 (validKeyInArray!0 (select (arr!48133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67965 () Bool)

(assert (=> bm!67965 (= call!67968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494808 () Bool)

(assert (=> b!1494808 (= e!837243 e!837245)))

(declare-fun lt!651336 () (_ BitVec 64))

(assert (=> b!1494808 (= lt!651336 (select (arr!48133 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651337 () Unit!49977)

(assert (=> b!1494808 (= lt!651337 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651336 #b00000000000000000000000000000000))))

(assert (=> b!1494808 (arrayContainsKey!0 a!2862 lt!651336 #b00000000000000000000000000000000)))

(declare-fun lt!651338 () Unit!49977)

(assert (=> b!1494808 (= lt!651338 lt!651337)))

(declare-fun res!1017059 () Bool)

(assert (=> b!1494808 (= res!1017059 (= (seekEntryOrOpen!0 (select (arr!48133 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12398 #b00000000000000000000000000000000)))))

(assert (=> b!1494808 (=> (not res!1017059) (not e!837245))))

(assert (= (and d!156917 (not res!1017060)) b!1494807))

(assert (= (and b!1494807 c!138407) b!1494808))

(assert (= (and b!1494807 (not c!138407)) b!1494806))

(assert (= (and b!1494808 res!1017059) b!1494805))

(assert (= (or b!1494805 b!1494806) bm!67965))

(declare-fun m!1377863 () Bool)

(assert (=> b!1494807 m!1377863))

(assert (=> b!1494807 m!1377863))

(declare-fun m!1377865 () Bool)

(assert (=> b!1494807 m!1377865))

(declare-fun m!1377867 () Bool)

(assert (=> bm!67965 m!1377867))

(assert (=> b!1494808 m!1377863))

(declare-fun m!1377869 () Bool)

(assert (=> b!1494808 m!1377869))

(declare-fun m!1377871 () Bool)

(assert (=> b!1494808 m!1377871))

(assert (=> b!1494808 m!1377863))

(declare-fun m!1377873 () Bool)

(assert (=> b!1494808 m!1377873))

(assert (=> b!1494655 d!156917))

(declare-fun d!156919 () Bool)

(declare-fun lt!651341 () (_ BitVec 32))

(assert (=> d!156919 (and (bvsge lt!651341 #b00000000000000000000000000000000) (bvslt lt!651341 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156919 (= lt!651341 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156919 (validMask!0 mask!2687)))

(assert (=> d!156919 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651341)))

(declare-fun bs!42866 () Bool)

(assert (= bs!42866 d!156919))

(declare-fun m!1377875 () Bool)

(assert (=> bs!42866 m!1377875))

(assert (=> bs!42866 m!1377687))

(assert (=> b!1494645 d!156919))

(declare-fun d!156921 () Bool)

(declare-fun res!1017067 () Bool)

(declare-fun e!837255 () Bool)

(assert (=> d!156921 (=> res!1017067 e!837255)))

(assert (=> d!156921 (= res!1017067 (bvsge #b00000000000000000000000000000000 (size!48685 a!2862)))))

(assert (=> d!156921 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34709) e!837255)))

(declare-fun b!1494819 () Bool)

(declare-fun e!837256 () Bool)

(declare-fun e!837254 () Bool)

(assert (=> b!1494819 (= e!837256 e!837254)))

(declare-fun c!138410 () Bool)

(assert (=> b!1494819 (= c!138410 (validKeyInArray!0 (select (arr!48133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494820 () Bool)

(declare-fun call!67971 () Bool)

(assert (=> b!1494820 (= e!837254 call!67971)))

(declare-fun b!1494821 () Bool)

(assert (=> b!1494821 (= e!837254 call!67971)))

(declare-fun bm!67968 () Bool)

(assert (=> bm!67968 (= call!67971 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138410 (Cons!34708 (select (arr!48133 a!2862) #b00000000000000000000000000000000) Nil!34709) Nil!34709)))))

(declare-fun b!1494822 () Bool)

(assert (=> b!1494822 (= e!837255 e!837256)))

(declare-fun res!1017068 () Bool)

(assert (=> b!1494822 (=> (not res!1017068) (not e!837256))))

(declare-fun e!837257 () Bool)

(assert (=> b!1494822 (= res!1017068 (not e!837257))))

(declare-fun res!1017069 () Bool)

(assert (=> b!1494822 (=> (not res!1017069) (not e!837257))))

(assert (=> b!1494822 (= res!1017069 (validKeyInArray!0 (select (arr!48133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494823 () Bool)

(declare-fun contains!9898 (List!34712 (_ BitVec 64)) Bool)

(assert (=> b!1494823 (= e!837257 (contains!9898 Nil!34709 (select (arr!48133 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156921 (not res!1017067)) b!1494822))

(assert (= (and b!1494822 res!1017069) b!1494823))

(assert (= (and b!1494822 res!1017068) b!1494819))

(assert (= (and b!1494819 c!138410) b!1494821))

(assert (= (and b!1494819 (not c!138410)) b!1494820))

(assert (= (or b!1494821 b!1494820) bm!67968))

(assert (=> b!1494819 m!1377863))

(assert (=> b!1494819 m!1377863))

(assert (=> b!1494819 m!1377865))

(assert (=> bm!67968 m!1377863))

(declare-fun m!1377877 () Bool)

(assert (=> bm!67968 m!1377877))

(assert (=> b!1494822 m!1377863))

(assert (=> b!1494822 m!1377863))

(assert (=> b!1494822 m!1377865))

(assert (=> b!1494823 m!1377863))

(assert (=> b!1494823 m!1377863))

(declare-fun m!1377879 () Bool)

(assert (=> b!1494823 m!1377879))

(assert (=> b!1494656 d!156921))

(declare-fun b!1494836 () Bool)

(declare-fun e!837265 () SeekEntryResult!12398)

(assert (=> b!1494836 (= e!837265 Undefined!12398)))

(declare-fun b!1494837 () Bool)

(declare-fun e!837264 () SeekEntryResult!12398)

(assert (=> b!1494837 (= e!837265 e!837264)))

(declare-fun lt!651350 () (_ BitVec 64))

(declare-fun lt!651348 () SeekEntryResult!12398)

(assert (=> b!1494837 (= lt!651350 (select (arr!48133 a!2862) (index!51986 lt!651348)))))

(declare-fun c!138417 () Bool)

(assert (=> b!1494837 (= c!138417 (= lt!651350 (select (arr!48133 a!2862) j!93)))))

(declare-fun d!156923 () Bool)

(declare-fun lt!651349 () SeekEntryResult!12398)

(get-info :version)

(assert (=> d!156923 (and (or ((_ is Undefined!12398) lt!651349) (not ((_ is Found!12398) lt!651349)) (and (bvsge (index!51985 lt!651349) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651349) (size!48685 a!2862)))) (or ((_ is Undefined!12398) lt!651349) ((_ is Found!12398) lt!651349) (not ((_ is MissingZero!12398) lt!651349)) (and (bvsge (index!51984 lt!651349) #b00000000000000000000000000000000) (bvslt (index!51984 lt!651349) (size!48685 a!2862)))) (or ((_ is Undefined!12398) lt!651349) ((_ is Found!12398) lt!651349) ((_ is MissingZero!12398) lt!651349) (not ((_ is MissingVacant!12398) lt!651349)) (and (bvsge (index!51987 lt!651349) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651349) (size!48685 a!2862)))) (or ((_ is Undefined!12398) lt!651349) (ite ((_ is Found!12398) lt!651349) (= (select (arr!48133 a!2862) (index!51985 lt!651349)) (select (arr!48133 a!2862) j!93)) (ite ((_ is MissingZero!12398) lt!651349) (= (select (arr!48133 a!2862) (index!51984 lt!651349)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12398) lt!651349) (= (select (arr!48133 a!2862) (index!51987 lt!651349)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156923 (= lt!651349 e!837265)))

(declare-fun c!138419 () Bool)

(assert (=> d!156923 (= c!138419 (and ((_ is Intermediate!12398) lt!651348) (undefined!13210 lt!651348)))))

(assert (=> d!156923 (= lt!651348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156923 (validMask!0 mask!2687)))

(assert (=> d!156923 (= (seekEntryOrOpen!0 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651349)))

(declare-fun b!1494838 () Bool)

(declare-fun e!837266 () SeekEntryResult!12398)

(assert (=> b!1494838 (= e!837266 (MissingZero!12398 (index!51986 lt!651348)))))

(declare-fun b!1494839 () Bool)

(declare-fun c!138418 () Bool)

(assert (=> b!1494839 (= c!138418 (= lt!651350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494839 (= e!837264 e!837266)))

(declare-fun b!1494840 () Bool)

(assert (=> b!1494840 (= e!837264 (Found!12398 (index!51986 lt!651348)))))

(declare-fun b!1494841 () Bool)

(assert (=> b!1494841 (= e!837266 (seekKeyOrZeroReturnVacant!0 (x!133587 lt!651348) (index!51986 lt!651348) (index!51986 lt!651348) (select (arr!48133 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156923 c!138419) b!1494836))

(assert (= (and d!156923 (not c!138419)) b!1494837))

(assert (= (and b!1494837 c!138417) b!1494840))

(assert (= (and b!1494837 (not c!138417)) b!1494839))

(assert (= (and b!1494839 c!138418) b!1494838))

(assert (= (and b!1494839 (not c!138418)) b!1494841))

(declare-fun m!1377881 () Bool)

(assert (=> b!1494837 m!1377881))

(assert (=> d!156923 m!1377681))

(assert (=> d!156923 m!1377683))

(declare-fun m!1377883 () Bool)

(assert (=> d!156923 m!1377883))

(assert (=> d!156923 m!1377687))

(declare-fun m!1377885 () Bool)

(assert (=> d!156923 m!1377885))

(declare-fun m!1377887 () Bool)

(assert (=> d!156923 m!1377887))

(assert (=> d!156923 m!1377683))

(assert (=> d!156923 m!1377681))

(assert (=> d!156923 m!1377685))

(assert (=> b!1494841 m!1377681))

(declare-fun m!1377889 () Bool)

(assert (=> b!1494841 m!1377889))

(assert (=> b!1494652 d!156923))

(declare-fun b!1494860 () Bool)

(declare-fun lt!651355 () SeekEntryResult!12398)

(assert (=> b!1494860 (and (bvsge (index!51986 lt!651355) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651355) (size!48685 lt!651285)))))

(declare-fun res!1017076 () Bool)

(assert (=> b!1494860 (= res!1017076 (= (select (arr!48133 lt!651285) (index!51986 lt!651355)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837279 () Bool)

(assert (=> b!1494860 (=> res!1017076 e!837279)))

(declare-fun b!1494861 () Bool)

(assert (=> b!1494861 (and (bvsge (index!51986 lt!651355) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651355) (size!48685 lt!651285)))))

(declare-fun res!1017077 () Bool)

(assert (=> b!1494861 (= res!1017077 (= (select (arr!48133 lt!651285) (index!51986 lt!651355)) lt!651283))))

(assert (=> b!1494861 (=> res!1017077 e!837279)))

(declare-fun e!837280 () Bool)

(assert (=> b!1494861 (= e!837280 e!837279)))

(declare-fun b!1494862 () Bool)

(assert (=> b!1494862 (and (bvsge (index!51986 lt!651355) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651355) (size!48685 lt!651285)))))

(assert (=> b!1494862 (= e!837279 (= (select (arr!48133 lt!651285) (index!51986 lt!651355)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494863 () Bool)

(declare-fun e!837277 () SeekEntryResult!12398)

(assert (=> b!1494863 (= e!837277 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651282 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651283 lt!651285 mask!2687))))

(declare-fun d!156925 () Bool)

(declare-fun e!837281 () Bool)

(assert (=> d!156925 e!837281))

(declare-fun c!138428 () Bool)

(assert (=> d!156925 (= c!138428 (and ((_ is Intermediate!12398) lt!651355) (undefined!13210 lt!651355)))))

(declare-fun e!837278 () SeekEntryResult!12398)

(assert (=> d!156925 (= lt!651355 e!837278)))

(declare-fun c!138426 () Bool)

(assert (=> d!156925 (= c!138426 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651356 () (_ BitVec 64))

(assert (=> d!156925 (= lt!651356 (select (arr!48133 lt!651285) lt!651282))))

(assert (=> d!156925 (validMask!0 mask!2687)))

(assert (=> d!156925 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651282 lt!651283 lt!651285 mask!2687) lt!651355)))

(declare-fun b!1494864 () Bool)

(assert (=> b!1494864 (= e!837278 (Intermediate!12398 true lt!651282 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494865 () Bool)

(assert (=> b!1494865 (= e!837281 (bvsge (x!133587 lt!651355) #b01111111111111111111111111111110))))

(declare-fun b!1494866 () Bool)

(assert (=> b!1494866 (= e!837281 e!837280)))

(declare-fun res!1017078 () Bool)

(assert (=> b!1494866 (= res!1017078 (and ((_ is Intermediate!12398) lt!651355) (not (undefined!13210 lt!651355)) (bvslt (x!133587 lt!651355) #b01111111111111111111111111111110) (bvsge (x!133587 lt!651355) #b00000000000000000000000000000000) (bvsge (x!133587 lt!651355) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1494866 (=> (not res!1017078) (not e!837280))))

(declare-fun b!1494867 () Bool)

(assert (=> b!1494867 (= e!837277 (Intermediate!12398 false lt!651282 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494868 () Bool)

(assert (=> b!1494868 (= e!837278 e!837277)))

(declare-fun c!138427 () Bool)

(assert (=> b!1494868 (= c!138427 (or (= lt!651356 lt!651283) (= (bvadd lt!651356 lt!651356) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156925 c!138426) b!1494864))

(assert (= (and d!156925 (not c!138426)) b!1494868))

(assert (= (and b!1494868 c!138427) b!1494867))

(assert (= (and b!1494868 (not c!138427)) b!1494863))

(assert (= (and d!156925 c!138428) b!1494865))

(assert (= (and d!156925 (not c!138428)) b!1494866))

(assert (= (and b!1494866 res!1017078) b!1494861))

(assert (= (and b!1494861 (not res!1017077)) b!1494860))

(assert (= (and b!1494860 (not res!1017076)) b!1494862))

(declare-fun m!1377891 () Bool)

(assert (=> b!1494862 m!1377891))

(assert (=> b!1494861 m!1377891))

(declare-fun m!1377893 () Bool)

(assert (=> b!1494863 m!1377893))

(assert (=> b!1494863 m!1377893))

(declare-fun m!1377895 () Bool)

(assert (=> b!1494863 m!1377895))

(declare-fun m!1377897 () Bool)

(assert (=> d!156925 m!1377897))

(assert (=> d!156925 m!1377687))

(assert (=> b!1494860 m!1377891))

(assert (=> b!1494649 d!156925))

(declare-fun e!837299 () SeekEntryResult!12398)

(declare-fun b!1494899 () Bool)

(assert (=> b!1494899 (= e!837299 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651283 lt!651285 mask!2687))))

(declare-fun lt!651367 () SeekEntryResult!12398)

(declare-fun d!156929 () Bool)

(assert (=> d!156929 (and (or ((_ is Undefined!12398) lt!651367) (not ((_ is Found!12398) lt!651367)) (and (bvsge (index!51985 lt!651367) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651367) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651367) ((_ is Found!12398) lt!651367) (not ((_ is MissingVacant!12398) lt!651367)) (not (= (index!51987 lt!651367) intermediateAfterIndex!19)) (and (bvsge (index!51987 lt!651367) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651367) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651367) (ite ((_ is Found!12398) lt!651367) (= (select (arr!48133 lt!651285) (index!51985 lt!651367)) lt!651283) (and ((_ is MissingVacant!12398) lt!651367) (= (index!51987 lt!651367) intermediateAfterIndex!19) (= (select (arr!48133 lt!651285) (index!51987 lt!651367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!837297 () SeekEntryResult!12398)

(assert (=> d!156929 (= lt!651367 e!837297)))

(declare-fun c!138445 () Bool)

(assert (=> d!156929 (= c!138445 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651368 () (_ BitVec 64))

(assert (=> d!156929 (= lt!651368 (select (arr!48133 lt!651285) index!646))))

(assert (=> d!156929 (validMask!0 mask!2687)))

(assert (=> d!156929 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651283 lt!651285 mask!2687) lt!651367)))

(declare-fun b!1494900 () Bool)

(declare-fun c!138446 () Bool)

(assert (=> b!1494900 (= c!138446 (= lt!651368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837298 () SeekEntryResult!12398)

(assert (=> b!1494900 (= e!837298 e!837299)))

(declare-fun b!1494901 () Bool)

(assert (=> b!1494901 (= e!837299 (MissingVacant!12398 intermediateAfterIndex!19))))

(declare-fun b!1494902 () Bool)

(assert (=> b!1494902 (= e!837298 (Found!12398 index!646))))

(declare-fun b!1494903 () Bool)

(assert (=> b!1494903 (= e!837297 Undefined!12398)))

(declare-fun b!1494904 () Bool)

(assert (=> b!1494904 (= e!837297 e!837298)))

(declare-fun c!138444 () Bool)

(assert (=> b!1494904 (= c!138444 (= lt!651368 lt!651283))))

(assert (= (and d!156929 c!138445) b!1494903))

(assert (= (and d!156929 (not c!138445)) b!1494904))

(assert (= (and b!1494904 c!138444) b!1494902))

(assert (= (and b!1494904 (not c!138444)) b!1494900))

(assert (= (and b!1494900 c!138446) b!1494901))

(assert (= (and b!1494900 (not c!138446)) b!1494899))

(assert (=> b!1494899 m!1377727))

(assert (=> b!1494899 m!1377727))

(declare-fun m!1377909 () Bool)

(assert (=> b!1494899 m!1377909))

(declare-fun m!1377911 () Bool)

(assert (=> d!156929 m!1377911))

(declare-fun m!1377913 () Bool)

(assert (=> d!156929 m!1377913))

(declare-fun m!1377915 () Bool)

(assert (=> d!156929 m!1377915))

(assert (=> d!156929 m!1377687))

(assert (=> b!1494660 d!156929))

(declare-fun b!1494905 () Bool)

(declare-fun e!837301 () SeekEntryResult!12398)

(assert (=> b!1494905 (= e!837301 Undefined!12398)))

(declare-fun b!1494906 () Bool)

(declare-fun e!837300 () SeekEntryResult!12398)

(assert (=> b!1494906 (= e!837301 e!837300)))

(declare-fun lt!651371 () (_ BitVec 64))

(declare-fun lt!651369 () SeekEntryResult!12398)

(assert (=> b!1494906 (= lt!651371 (select (arr!48133 lt!651285) (index!51986 lt!651369)))))

(declare-fun c!138447 () Bool)

(assert (=> b!1494906 (= c!138447 (= lt!651371 lt!651283))))

(declare-fun d!156933 () Bool)

(declare-fun lt!651370 () SeekEntryResult!12398)

(assert (=> d!156933 (and (or ((_ is Undefined!12398) lt!651370) (not ((_ is Found!12398) lt!651370)) (and (bvsge (index!51985 lt!651370) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651370) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651370) ((_ is Found!12398) lt!651370) (not ((_ is MissingZero!12398) lt!651370)) (and (bvsge (index!51984 lt!651370) #b00000000000000000000000000000000) (bvslt (index!51984 lt!651370) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651370) ((_ is Found!12398) lt!651370) ((_ is MissingZero!12398) lt!651370) (not ((_ is MissingVacant!12398) lt!651370)) (and (bvsge (index!51987 lt!651370) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651370) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651370) (ite ((_ is Found!12398) lt!651370) (= (select (arr!48133 lt!651285) (index!51985 lt!651370)) lt!651283) (ite ((_ is MissingZero!12398) lt!651370) (= (select (arr!48133 lt!651285) (index!51984 lt!651370)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12398) lt!651370) (= (select (arr!48133 lt!651285) (index!51987 lt!651370)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156933 (= lt!651370 e!837301)))

(declare-fun c!138449 () Bool)

(assert (=> d!156933 (= c!138449 (and ((_ is Intermediate!12398) lt!651369) (undefined!13210 lt!651369)))))

(assert (=> d!156933 (= lt!651369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651283 mask!2687) lt!651283 lt!651285 mask!2687))))

(assert (=> d!156933 (validMask!0 mask!2687)))

(assert (=> d!156933 (= (seekEntryOrOpen!0 lt!651283 lt!651285 mask!2687) lt!651370)))

(declare-fun b!1494907 () Bool)

(declare-fun e!837302 () SeekEntryResult!12398)

(assert (=> b!1494907 (= e!837302 (MissingZero!12398 (index!51986 lt!651369)))))

(declare-fun b!1494908 () Bool)

(declare-fun c!138448 () Bool)

(assert (=> b!1494908 (= c!138448 (= lt!651371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494908 (= e!837300 e!837302)))

(declare-fun b!1494909 () Bool)

(assert (=> b!1494909 (= e!837300 (Found!12398 (index!51986 lt!651369)))))

(declare-fun b!1494910 () Bool)

(assert (=> b!1494910 (= e!837302 (seekKeyOrZeroReturnVacant!0 (x!133587 lt!651369) (index!51986 lt!651369) (index!51986 lt!651369) lt!651283 lt!651285 mask!2687))))

(assert (= (and d!156933 c!138449) b!1494905))

(assert (= (and d!156933 (not c!138449)) b!1494906))

(assert (= (and b!1494906 c!138447) b!1494909))

(assert (= (and b!1494906 (not c!138447)) b!1494908))

(assert (= (and b!1494908 c!138448) b!1494907))

(assert (= (and b!1494908 (not c!138448)) b!1494910))

(declare-fun m!1377917 () Bool)

(assert (=> b!1494906 m!1377917))

(assert (=> d!156933 m!1377721))

(declare-fun m!1377919 () Bool)

(assert (=> d!156933 m!1377919))

(assert (=> d!156933 m!1377687))

(declare-fun m!1377921 () Bool)

(assert (=> d!156933 m!1377921))

(declare-fun m!1377923 () Bool)

(assert (=> d!156933 m!1377923))

(assert (=> d!156933 m!1377721))

(assert (=> d!156933 m!1377723))

(declare-fun m!1377925 () Bool)

(assert (=> b!1494910 m!1377925))

(assert (=> b!1494660 d!156933))

(declare-fun e!837305 () SeekEntryResult!12398)

(declare-fun b!1494911 () Bool)

(assert (=> b!1494911 (= e!837305 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651282 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651283 lt!651285 mask!2687))))

(declare-fun lt!651372 () SeekEntryResult!12398)

(declare-fun d!156935 () Bool)

(assert (=> d!156935 (and (or ((_ is Undefined!12398) lt!651372) (not ((_ is Found!12398) lt!651372)) (and (bvsge (index!51985 lt!651372) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651372) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651372) ((_ is Found!12398) lt!651372) (not ((_ is MissingVacant!12398) lt!651372)) (not (= (index!51987 lt!651372) intermediateAfterIndex!19)) (and (bvsge (index!51987 lt!651372) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651372) (size!48685 lt!651285)))) (or ((_ is Undefined!12398) lt!651372) (ite ((_ is Found!12398) lt!651372) (= (select (arr!48133 lt!651285) (index!51985 lt!651372)) lt!651283) (and ((_ is MissingVacant!12398) lt!651372) (= (index!51987 lt!651372) intermediateAfterIndex!19) (= (select (arr!48133 lt!651285) (index!51987 lt!651372)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!837303 () SeekEntryResult!12398)

(assert (=> d!156935 (= lt!651372 e!837303)))

(declare-fun c!138451 () Bool)

(assert (=> d!156935 (= c!138451 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651373 () (_ BitVec 64))

(assert (=> d!156935 (= lt!651373 (select (arr!48133 lt!651285) lt!651282))))

(assert (=> d!156935 (validMask!0 mask!2687)))

(assert (=> d!156935 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651282 intermediateAfterIndex!19 lt!651283 lt!651285 mask!2687) lt!651372)))

(declare-fun b!1494912 () Bool)

(declare-fun c!138452 () Bool)

(assert (=> b!1494912 (= c!138452 (= lt!651373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837304 () SeekEntryResult!12398)

(assert (=> b!1494912 (= e!837304 e!837305)))

(declare-fun b!1494913 () Bool)

(assert (=> b!1494913 (= e!837305 (MissingVacant!12398 intermediateAfterIndex!19))))

(declare-fun b!1494914 () Bool)

(assert (=> b!1494914 (= e!837304 (Found!12398 lt!651282))))

(declare-fun b!1494915 () Bool)

(assert (=> b!1494915 (= e!837303 Undefined!12398)))

(declare-fun b!1494916 () Bool)

(assert (=> b!1494916 (= e!837303 e!837304)))

(declare-fun c!138450 () Bool)

(assert (=> b!1494916 (= c!138450 (= lt!651373 lt!651283))))

(assert (= (and d!156935 c!138451) b!1494915))

(assert (= (and d!156935 (not c!138451)) b!1494916))

(assert (= (and b!1494916 c!138450) b!1494914))

(assert (= (and b!1494916 (not c!138450)) b!1494912))

(assert (= (and b!1494912 c!138452) b!1494913))

(assert (= (and b!1494912 (not c!138452)) b!1494911))

(assert (=> b!1494911 m!1377893))

(assert (=> b!1494911 m!1377893))

(declare-fun m!1377927 () Bool)

(assert (=> b!1494911 m!1377927))

(declare-fun m!1377929 () Bool)

(assert (=> d!156935 m!1377929))

(declare-fun m!1377931 () Bool)

(assert (=> d!156935 m!1377931))

(assert (=> d!156935 m!1377897))

(assert (=> d!156935 m!1377687))

(assert (=> b!1494639 d!156935))

(assert (=> b!1494639 d!156933))

(declare-fun d!156937 () Bool)

(assert (=> d!156937 (= (validKeyInArray!0 (select (arr!48133 a!2862) i!1006)) (and (not (= (select (arr!48133 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48133 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494651 d!156937))

(declare-fun d!156939 () Bool)

(assert (=> d!156939 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127148 d!156939))

(declare-fun d!156941 () Bool)

(assert (=> d!156941 (= (array_inv!37366 a!2862) (bvsge (size!48685 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127148 d!156941))

(declare-fun b!1494935 () Bool)

(declare-fun lt!651383 () SeekEntryResult!12398)

(assert (=> b!1494935 (and (bvsge (index!51986 lt!651383) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651383) (size!48685 lt!651285)))))

(declare-fun res!1017079 () Bool)

(assert (=> b!1494935 (= res!1017079 (= (select (arr!48133 lt!651285) (index!51986 lt!651383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837317 () Bool)

(assert (=> b!1494935 (=> res!1017079 e!837317)))

(declare-fun b!1494936 () Bool)

(assert (=> b!1494936 (and (bvsge (index!51986 lt!651383) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651383) (size!48685 lt!651285)))))

(declare-fun res!1017080 () Bool)

(assert (=> b!1494936 (= res!1017080 (= (select (arr!48133 lt!651285) (index!51986 lt!651383)) lt!651283))))

(assert (=> b!1494936 (=> res!1017080 e!837317)))

(declare-fun e!837318 () Bool)

(assert (=> b!1494936 (= e!837318 e!837317)))

(declare-fun b!1494937 () Bool)

(assert (=> b!1494937 (and (bvsge (index!51986 lt!651383) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651383) (size!48685 lt!651285)))))

(assert (=> b!1494937 (= e!837317 (= (select (arr!48133 lt!651285) (index!51986 lt!651383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494938 () Bool)

(declare-fun e!837315 () SeekEntryResult!12398)

(assert (=> b!1494938 (= e!837315 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651283 lt!651285 mask!2687))))

(declare-fun d!156943 () Bool)

(declare-fun e!837319 () Bool)

(assert (=> d!156943 e!837319))

(declare-fun c!138464 () Bool)

(assert (=> d!156943 (= c!138464 (and ((_ is Intermediate!12398) lt!651383) (undefined!13210 lt!651383)))))

(declare-fun e!837316 () SeekEntryResult!12398)

(assert (=> d!156943 (= lt!651383 e!837316)))

(declare-fun c!138462 () Bool)

(assert (=> d!156943 (= c!138462 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651384 () (_ BitVec 64))

(assert (=> d!156943 (= lt!651384 (select (arr!48133 lt!651285) index!646))))

(assert (=> d!156943 (validMask!0 mask!2687)))

(assert (=> d!156943 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651283 lt!651285 mask!2687) lt!651383)))

(declare-fun b!1494939 () Bool)

(assert (=> b!1494939 (= e!837316 (Intermediate!12398 true index!646 x!665))))

(declare-fun b!1494940 () Bool)

(assert (=> b!1494940 (= e!837319 (bvsge (x!133587 lt!651383) #b01111111111111111111111111111110))))

(declare-fun b!1494941 () Bool)

(assert (=> b!1494941 (= e!837319 e!837318)))

(declare-fun res!1017081 () Bool)

(assert (=> b!1494941 (= res!1017081 (and ((_ is Intermediate!12398) lt!651383) (not (undefined!13210 lt!651383)) (bvslt (x!133587 lt!651383) #b01111111111111111111111111111110) (bvsge (x!133587 lt!651383) #b00000000000000000000000000000000) (bvsge (x!133587 lt!651383) x!665)))))

(assert (=> b!1494941 (=> (not res!1017081) (not e!837318))))

(declare-fun b!1494942 () Bool)

(assert (=> b!1494942 (= e!837315 (Intermediate!12398 false index!646 x!665))))

(declare-fun b!1494943 () Bool)

(assert (=> b!1494943 (= e!837316 e!837315)))

(declare-fun c!138463 () Bool)

(assert (=> b!1494943 (= c!138463 (or (= lt!651384 lt!651283) (= (bvadd lt!651384 lt!651384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156943 c!138462) b!1494939))

(assert (= (and d!156943 (not c!138462)) b!1494943))

(assert (= (and b!1494943 c!138463) b!1494942))

(assert (= (and b!1494943 (not c!138463)) b!1494938))

(assert (= (and d!156943 c!138464) b!1494940))

(assert (= (and d!156943 (not c!138464)) b!1494941))

(assert (= (and b!1494941 res!1017081) b!1494936))

(assert (= (and b!1494936 (not res!1017080)) b!1494935))

(assert (= (and b!1494935 (not res!1017079)) b!1494937))

(declare-fun m!1377943 () Bool)

(assert (=> b!1494937 m!1377943))

(assert (=> b!1494936 m!1377943))

(assert (=> b!1494938 m!1377727))

(assert (=> b!1494938 m!1377727))

(declare-fun m!1377945 () Bool)

(assert (=> b!1494938 m!1377945))

(assert (=> d!156943 m!1377915))

(assert (=> d!156943 m!1377687))

(assert (=> b!1494935 m!1377943))

(assert (=> b!1494657 d!156943))

(declare-fun b!1494944 () Bool)

(declare-fun lt!651385 () SeekEntryResult!12398)

(assert (=> b!1494944 (and (bvsge (index!51986 lt!651385) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651385) (size!48685 a!2862)))))

(declare-fun res!1017082 () Bool)

(assert (=> b!1494944 (= res!1017082 (= (select (arr!48133 a!2862) (index!51986 lt!651385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837322 () Bool)

(assert (=> b!1494944 (=> res!1017082 e!837322)))

(declare-fun b!1494945 () Bool)

(assert (=> b!1494945 (and (bvsge (index!51986 lt!651385) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651385) (size!48685 a!2862)))))

(declare-fun res!1017083 () Bool)

(assert (=> b!1494945 (= res!1017083 (= (select (arr!48133 a!2862) (index!51986 lt!651385)) (select (arr!48133 a!2862) j!93)))))

(assert (=> b!1494945 (=> res!1017083 e!837322)))

(declare-fun e!837323 () Bool)

(assert (=> b!1494945 (= e!837323 e!837322)))

(declare-fun b!1494946 () Bool)

(assert (=> b!1494946 (and (bvsge (index!51986 lt!651385) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651385) (size!48685 a!2862)))))

(assert (=> b!1494946 (= e!837322 (= (select (arr!48133 a!2862) (index!51986 lt!651385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494947 () Bool)

(declare-fun e!837320 () SeekEntryResult!12398)

(assert (=> b!1494947 (= e!837320 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156947 () Bool)

(declare-fun e!837324 () Bool)

(assert (=> d!156947 e!837324))

(declare-fun c!138467 () Bool)

(assert (=> d!156947 (= c!138467 (and ((_ is Intermediate!12398) lt!651385) (undefined!13210 lt!651385)))))

(declare-fun e!837321 () SeekEntryResult!12398)

(assert (=> d!156947 (= lt!651385 e!837321)))

(declare-fun c!138465 () Bool)

(assert (=> d!156947 (= c!138465 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651386 () (_ BitVec 64))

(assert (=> d!156947 (= lt!651386 (select (arr!48133 a!2862) index!646))))

(assert (=> d!156947 (validMask!0 mask!2687)))

(assert (=> d!156947 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651385)))

(declare-fun b!1494948 () Bool)

(assert (=> b!1494948 (= e!837321 (Intermediate!12398 true index!646 x!665))))

(declare-fun b!1494949 () Bool)

(assert (=> b!1494949 (= e!837324 (bvsge (x!133587 lt!651385) #b01111111111111111111111111111110))))

(declare-fun b!1494950 () Bool)

(assert (=> b!1494950 (= e!837324 e!837323)))

(declare-fun res!1017084 () Bool)

(assert (=> b!1494950 (= res!1017084 (and ((_ is Intermediate!12398) lt!651385) (not (undefined!13210 lt!651385)) (bvslt (x!133587 lt!651385) #b01111111111111111111111111111110) (bvsge (x!133587 lt!651385) #b00000000000000000000000000000000) (bvsge (x!133587 lt!651385) x!665)))))

(assert (=> b!1494950 (=> (not res!1017084) (not e!837323))))

(declare-fun b!1494951 () Bool)

(assert (=> b!1494951 (= e!837320 (Intermediate!12398 false index!646 x!665))))

(declare-fun b!1494952 () Bool)

(assert (=> b!1494952 (= e!837321 e!837320)))

(declare-fun c!138466 () Bool)

(assert (=> b!1494952 (= c!138466 (or (= lt!651386 (select (arr!48133 a!2862) j!93)) (= (bvadd lt!651386 lt!651386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156947 c!138465) b!1494948))

(assert (= (and d!156947 (not c!138465)) b!1494952))

(assert (= (and b!1494952 c!138466) b!1494951))

(assert (= (and b!1494952 (not c!138466)) b!1494947))

(assert (= (and d!156947 c!138467) b!1494949))

(assert (= (and d!156947 (not c!138467)) b!1494950))

(assert (= (and b!1494950 res!1017084) b!1494945))

(assert (= (and b!1494945 (not res!1017083)) b!1494944))

(assert (= (and b!1494944 (not res!1017082)) b!1494946))

(declare-fun m!1377947 () Bool)

(assert (=> b!1494946 m!1377947))

(assert (=> b!1494945 m!1377947))

(assert (=> b!1494947 m!1377727))

(assert (=> b!1494947 m!1377727))

(assert (=> b!1494947 m!1377681))

(declare-fun m!1377949 () Bool)

(assert (=> b!1494947 m!1377949))

(assert (=> d!156947 m!1377697))

(assert (=> d!156947 m!1377687))

(assert (=> b!1494944 m!1377947))

(assert (=> b!1494647 d!156947))

(declare-fun b!1494953 () Bool)

(declare-fun lt!651387 () SeekEntryResult!12398)

(assert (=> b!1494953 (and (bvsge (index!51986 lt!651387) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651387) (size!48685 a!2862)))))

(declare-fun res!1017085 () Bool)

(assert (=> b!1494953 (= res!1017085 (= (select (arr!48133 a!2862) (index!51986 lt!651387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837327 () Bool)

(assert (=> b!1494953 (=> res!1017085 e!837327)))

(declare-fun b!1494954 () Bool)

(assert (=> b!1494954 (and (bvsge (index!51986 lt!651387) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651387) (size!48685 a!2862)))))

(declare-fun res!1017086 () Bool)

(assert (=> b!1494954 (= res!1017086 (= (select (arr!48133 a!2862) (index!51986 lt!651387)) (select (arr!48133 a!2862) j!93)))))

(assert (=> b!1494954 (=> res!1017086 e!837327)))

(declare-fun e!837328 () Bool)

(assert (=> b!1494954 (= e!837328 e!837327)))

(declare-fun b!1494955 () Bool)

(assert (=> b!1494955 (and (bvsge (index!51986 lt!651387) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651387) (size!48685 a!2862)))))

(assert (=> b!1494955 (= e!837327 (= (select (arr!48133 a!2862) (index!51986 lt!651387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494956 () Bool)

(declare-fun e!837325 () SeekEntryResult!12398)

(assert (=> b!1494956 (= e!837325 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156949 () Bool)

(declare-fun e!837329 () Bool)

(assert (=> d!156949 e!837329))

(declare-fun c!138470 () Bool)

(assert (=> d!156949 (= c!138470 (and ((_ is Intermediate!12398) lt!651387) (undefined!13210 lt!651387)))))

(declare-fun e!837326 () SeekEntryResult!12398)

(assert (=> d!156949 (= lt!651387 e!837326)))

(declare-fun c!138468 () Bool)

(assert (=> d!156949 (= c!138468 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651388 () (_ BitVec 64))

(assert (=> d!156949 (= lt!651388 (select (arr!48133 a!2862) (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687)))))

(assert (=> d!156949 (validMask!0 mask!2687)))

(assert (=> d!156949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651387)))

(declare-fun b!1494957 () Bool)

(assert (=> b!1494957 (= e!837326 (Intermediate!12398 true (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494958 () Bool)

(assert (=> b!1494958 (= e!837329 (bvsge (x!133587 lt!651387) #b01111111111111111111111111111110))))

(declare-fun b!1494959 () Bool)

(assert (=> b!1494959 (= e!837329 e!837328)))

(declare-fun res!1017087 () Bool)

(assert (=> b!1494959 (= res!1017087 (and ((_ is Intermediate!12398) lt!651387) (not (undefined!13210 lt!651387)) (bvslt (x!133587 lt!651387) #b01111111111111111111111111111110) (bvsge (x!133587 lt!651387) #b00000000000000000000000000000000) (bvsge (x!133587 lt!651387) #b00000000000000000000000000000000)))))

(assert (=> b!1494959 (=> (not res!1017087) (not e!837328))))

(declare-fun b!1494960 () Bool)

(assert (=> b!1494960 (= e!837325 (Intermediate!12398 false (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494961 () Bool)

(assert (=> b!1494961 (= e!837326 e!837325)))

(declare-fun c!138469 () Bool)

(assert (=> b!1494961 (= c!138469 (or (= lt!651388 (select (arr!48133 a!2862) j!93)) (= (bvadd lt!651388 lt!651388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156949 c!138468) b!1494957))

(assert (= (and d!156949 (not c!138468)) b!1494961))

(assert (= (and b!1494961 c!138469) b!1494960))

(assert (= (and b!1494961 (not c!138469)) b!1494956))

(assert (= (and d!156949 c!138470) b!1494958))

(assert (= (and d!156949 (not c!138470)) b!1494959))

(assert (= (and b!1494959 res!1017087) b!1494954))

(assert (= (and b!1494954 (not res!1017086)) b!1494953))

(assert (= (and b!1494953 (not res!1017085)) b!1494955))

(declare-fun m!1377951 () Bool)

(assert (=> b!1494955 m!1377951))

(assert (=> b!1494954 m!1377951))

(assert (=> b!1494956 m!1377683))

(declare-fun m!1377953 () Bool)

(assert (=> b!1494956 m!1377953))

(assert (=> b!1494956 m!1377953))

(assert (=> b!1494956 m!1377681))

(declare-fun m!1377955 () Bool)

(assert (=> b!1494956 m!1377955))

(assert (=> d!156949 m!1377683))

(declare-fun m!1377957 () Bool)

(assert (=> d!156949 m!1377957))

(assert (=> d!156949 m!1377687))

(assert (=> b!1494953 m!1377951))

(assert (=> b!1494658 d!156949))

(declare-fun d!156951 () Bool)

(declare-fun lt!651394 () (_ BitVec 32))

(declare-fun lt!651393 () (_ BitVec 32))

(assert (=> d!156951 (= lt!651394 (bvmul (bvxor lt!651393 (bvlshr lt!651393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156951 (= lt!651393 ((_ extract 31 0) (bvand (bvxor (select (arr!48133 a!2862) j!93) (bvlshr (select (arr!48133 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156951 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017088 (let ((h!36103 ((_ extract 31 0) (bvand (bvxor (select (arr!48133 a!2862) j!93) (bvlshr (select (arr!48133 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133594 (bvmul (bvxor h!36103 (bvlshr h!36103 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133594 (bvlshr x!133594 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017088 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017088 #b00000000000000000000000000000000))))))

(assert (=> d!156951 (= (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) (bvand (bvxor lt!651394 (bvlshr lt!651394 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494658 d!156951))

(declare-fun b!1494962 () Bool)

(declare-fun lt!651395 () SeekEntryResult!12398)

(assert (=> b!1494962 (and (bvsge (index!51986 lt!651395) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651395) (size!48685 lt!651285)))))

(declare-fun res!1017089 () Bool)

(assert (=> b!1494962 (= res!1017089 (= (select (arr!48133 lt!651285) (index!51986 lt!651395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837332 () Bool)

(assert (=> b!1494962 (=> res!1017089 e!837332)))

(declare-fun b!1494963 () Bool)

(assert (=> b!1494963 (and (bvsge (index!51986 lt!651395) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651395) (size!48685 lt!651285)))))

(declare-fun res!1017090 () Bool)

(assert (=> b!1494963 (= res!1017090 (= (select (arr!48133 lt!651285) (index!51986 lt!651395)) lt!651283))))

(assert (=> b!1494963 (=> res!1017090 e!837332)))

(declare-fun e!837333 () Bool)

(assert (=> b!1494963 (= e!837333 e!837332)))

(declare-fun b!1494964 () Bool)

(assert (=> b!1494964 (and (bvsge (index!51986 lt!651395) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651395) (size!48685 lt!651285)))))

(assert (=> b!1494964 (= e!837332 (= (select (arr!48133 lt!651285) (index!51986 lt!651395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837330 () SeekEntryResult!12398)

(declare-fun b!1494965 () Bool)

(assert (=> b!1494965 (= e!837330 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651283 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651283 lt!651285 mask!2687))))

(declare-fun d!156953 () Bool)

(declare-fun e!837334 () Bool)

(assert (=> d!156953 e!837334))

(declare-fun c!138473 () Bool)

(assert (=> d!156953 (= c!138473 (and ((_ is Intermediate!12398) lt!651395) (undefined!13210 lt!651395)))))

(declare-fun e!837331 () SeekEntryResult!12398)

(assert (=> d!156953 (= lt!651395 e!837331)))

(declare-fun c!138471 () Bool)

(assert (=> d!156953 (= c!138471 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651396 () (_ BitVec 64))

(assert (=> d!156953 (= lt!651396 (select (arr!48133 lt!651285) (toIndex!0 lt!651283 mask!2687)))))

(assert (=> d!156953 (validMask!0 mask!2687)))

(assert (=> d!156953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651283 mask!2687) lt!651283 lt!651285 mask!2687) lt!651395)))

(declare-fun b!1494966 () Bool)

(assert (=> b!1494966 (= e!837331 (Intermediate!12398 true (toIndex!0 lt!651283 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494967 () Bool)

(assert (=> b!1494967 (= e!837334 (bvsge (x!133587 lt!651395) #b01111111111111111111111111111110))))

(declare-fun b!1494968 () Bool)

(assert (=> b!1494968 (= e!837334 e!837333)))

(declare-fun res!1017091 () Bool)

(assert (=> b!1494968 (= res!1017091 (and ((_ is Intermediate!12398) lt!651395) (not (undefined!13210 lt!651395)) (bvslt (x!133587 lt!651395) #b01111111111111111111111111111110) (bvsge (x!133587 lt!651395) #b00000000000000000000000000000000) (bvsge (x!133587 lt!651395) #b00000000000000000000000000000000)))))

(assert (=> b!1494968 (=> (not res!1017091) (not e!837333))))

(declare-fun b!1494969 () Bool)

(assert (=> b!1494969 (= e!837330 (Intermediate!12398 false (toIndex!0 lt!651283 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494970 () Bool)

(assert (=> b!1494970 (= e!837331 e!837330)))

(declare-fun c!138472 () Bool)

(assert (=> b!1494970 (= c!138472 (or (= lt!651396 lt!651283) (= (bvadd lt!651396 lt!651396) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156953 c!138471) b!1494966))

(assert (= (and d!156953 (not c!138471)) b!1494970))

(assert (= (and b!1494970 c!138472) b!1494969))

(assert (= (and b!1494970 (not c!138472)) b!1494965))

(assert (= (and d!156953 c!138473) b!1494967))

(assert (= (and d!156953 (not c!138473)) b!1494968))

(assert (= (and b!1494968 res!1017091) b!1494963))

(assert (= (and b!1494963 (not res!1017090)) b!1494962))

(assert (= (and b!1494962 (not res!1017089)) b!1494964))

(declare-fun m!1377959 () Bool)

(assert (=> b!1494964 m!1377959))

(assert (=> b!1494963 m!1377959))

(assert (=> b!1494965 m!1377721))

(declare-fun m!1377961 () Bool)

(assert (=> b!1494965 m!1377961))

(assert (=> b!1494965 m!1377961))

(declare-fun m!1377963 () Bool)

(assert (=> b!1494965 m!1377963))

(assert (=> d!156953 m!1377721))

(declare-fun m!1377965 () Bool)

(assert (=> d!156953 m!1377965))

(assert (=> d!156953 m!1377687))

(assert (=> b!1494962 m!1377959))

(assert (=> b!1494648 d!156953))

(declare-fun d!156955 () Bool)

(declare-fun lt!651398 () (_ BitVec 32))

(declare-fun lt!651397 () (_ BitVec 32))

(assert (=> d!156955 (= lt!651398 (bvmul (bvxor lt!651397 (bvlshr lt!651397 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156955 (= lt!651397 ((_ extract 31 0) (bvand (bvxor lt!651283 (bvlshr lt!651283 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156955 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017088 (let ((h!36103 ((_ extract 31 0) (bvand (bvxor lt!651283 (bvlshr lt!651283 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133594 (bvmul (bvxor h!36103 (bvlshr h!36103 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133594 (bvlshr x!133594 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017088 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017088 #b00000000000000000000000000000000))))))

(assert (=> d!156955 (= (toIndex!0 lt!651283 mask!2687) (bvand (bvxor lt!651398 (bvlshr lt!651398 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494648 d!156955))

(declare-fun b!1494971 () Bool)

(declare-fun lt!651399 () SeekEntryResult!12398)

(assert (=> b!1494971 (and (bvsge (index!51986 lt!651399) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651399) (size!48685 a!2862)))))

(declare-fun res!1017092 () Bool)

(assert (=> b!1494971 (= res!1017092 (= (select (arr!48133 a!2862) (index!51986 lt!651399)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837337 () Bool)

(assert (=> b!1494971 (=> res!1017092 e!837337)))

(declare-fun b!1494972 () Bool)

(assert (=> b!1494972 (and (bvsge (index!51986 lt!651399) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651399) (size!48685 a!2862)))))

(declare-fun res!1017093 () Bool)

(assert (=> b!1494972 (= res!1017093 (= (select (arr!48133 a!2862) (index!51986 lt!651399)) (select (arr!48133 a!2862) j!93)))))

(assert (=> b!1494972 (=> res!1017093 e!837337)))

(declare-fun e!837338 () Bool)

(assert (=> b!1494972 (= e!837338 e!837337)))

(declare-fun b!1494973 () Bool)

(assert (=> b!1494973 (and (bvsge (index!51986 lt!651399) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651399) (size!48685 a!2862)))))

(assert (=> b!1494973 (= e!837337 (= (select (arr!48133 a!2862) (index!51986 lt!651399)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494974 () Bool)

(declare-fun e!837335 () SeekEntryResult!12398)

(assert (=> b!1494974 (= e!837335 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651282 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156957 () Bool)

(declare-fun e!837339 () Bool)

(assert (=> d!156957 e!837339))

(declare-fun c!138476 () Bool)

(assert (=> d!156957 (= c!138476 (and ((_ is Intermediate!12398) lt!651399) (undefined!13210 lt!651399)))))

(declare-fun e!837336 () SeekEntryResult!12398)

(assert (=> d!156957 (= lt!651399 e!837336)))

(declare-fun c!138474 () Bool)

(assert (=> d!156957 (= c!138474 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651400 () (_ BitVec 64))

(assert (=> d!156957 (= lt!651400 (select (arr!48133 a!2862) lt!651282))))

(assert (=> d!156957 (validMask!0 mask!2687)))

(assert (=> d!156957 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651282 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!651399)))

(declare-fun b!1494975 () Bool)

(assert (=> b!1494975 (= e!837336 (Intermediate!12398 true lt!651282 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494976 () Bool)

(assert (=> b!1494976 (= e!837339 (bvsge (x!133587 lt!651399) #b01111111111111111111111111111110))))

(declare-fun b!1494977 () Bool)

(assert (=> b!1494977 (= e!837339 e!837338)))

(declare-fun res!1017094 () Bool)

(assert (=> b!1494977 (= res!1017094 (and ((_ is Intermediate!12398) lt!651399) (not (undefined!13210 lt!651399)) (bvslt (x!133587 lt!651399) #b01111111111111111111111111111110) (bvsge (x!133587 lt!651399) #b00000000000000000000000000000000) (bvsge (x!133587 lt!651399) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1494977 (=> (not res!1017094) (not e!837338))))

(declare-fun b!1494978 () Bool)

(assert (=> b!1494978 (= e!837335 (Intermediate!12398 false lt!651282 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494979 () Bool)

(assert (=> b!1494979 (= e!837336 e!837335)))

(declare-fun c!138475 () Bool)

(assert (=> b!1494979 (= c!138475 (or (= lt!651400 (select (arr!48133 a!2862) j!93)) (= (bvadd lt!651400 lt!651400) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156957 c!138474) b!1494975))

(assert (= (and d!156957 (not c!138474)) b!1494979))

(assert (= (and b!1494979 c!138475) b!1494978))

(assert (= (and b!1494979 (not c!138475)) b!1494974))

(assert (= (and d!156957 c!138476) b!1494976))

(assert (= (and d!156957 (not c!138476)) b!1494977))

(assert (= (and b!1494977 res!1017094) b!1494972))

(assert (= (and b!1494972 (not res!1017093)) b!1494971))

(assert (= (and b!1494971 (not res!1017092)) b!1494973))

(declare-fun m!1377967 () Bool)

(assert (=> b!1494973 m!1377967))

(assert (=> b!1494972 m!1377967))

(assert (=> b!1494974 m!1377893))

(assert (=> b!1494974 m!1377893))

(assert (=> b!1494974 m!1377681))

(declare-fun m!1377969 () Bool)

(assert (=> b!1494974 m!1377969))

(declare-fun m!1377971 () Bool)

(assert (=> d!156957 m!1377971))

(assert (=> d!156957 m!1377687))

(assert (=> b!1494971 m!1377967))

(assert (=> b!1494659 d!156957))

(check-sat (not d!156953) (not d!156949) (not b!1494863) (not d!156923) (not d!156943) (not bm!67964) (not b!1494899) (not d!156925) (not b!1494823) (not d!156935) (not b!1494974) (not b!1494804) (not bm!67965) (not b!1494956) (not b!1494803) (not b!1494965) (not b!1494911) (not b!1494938) (not b!1494808) (not bm!67968) (not b!1494819) (not b!1494910) (not d!156947) (not b!1494841) (not b!1494947) (not d!156933) (not d!156919) (not d!156957) (not b!1494807) (not b!1494822) (not d!156913) (not d!156929))
(check-sat)
