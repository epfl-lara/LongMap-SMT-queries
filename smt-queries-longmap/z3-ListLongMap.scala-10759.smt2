; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125782 () Bool)

(assert start!125782)

(declare-fun b!1472679 () Bool)

(declare-fun res!1000414 () Bool)

(declare-fun e!826413 () Bool)

(assert (=> b!1472679 (=> (not res!1000414) (not e!826413))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472679 (= res!1000414 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472680 () Bool)

(declare-fun e!826414 () Bool)

(declare-fun e!826419 () Bool)

(assert (=> b!1472680 (= e!826414 e!826419)))

(declare-fun res!1000418 () Bool)

(assert (=> b!1472680 (=> (not res!1000418) (not e!826419))))

(declare-datatypes ((array!99094 0))(
  ( (array!99095 (arr!47833 (Array (_ BitVec 32) (_ BitVec 64))) (size!48385 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99094)

(assert (=> b!1472680 (= res!1000418 (= (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643469 () array!99094)

(assert (=> b!1472680 (= lt!643469 (array!99095 (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48385 a!2862)))))

(declare-fun b!1472681 () Bool)

(declare-fun res!1000407 () Bool)

(assert (=> b!1472681 (=> (not res!1000407) (not e!826413))))

(declare-fun e!826417 () Bool)

(assert (=> b!1472681 (= res!1000407 e!826417)))

(declare-fun c!135652 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472681 (= c!135652 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472682 () Bool)

(declare-fun res!1000411 () Bool)

(assert (=> b!1472682 (=> (not res!1000411) (not e!826414))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99094 (_ BitVec 32)) Bool)

(assert (=> b!1472682 (= res!1000411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472684 () Bool)

(declare-fun lt!643470 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12098 0))(
  ( (MissingZero!12098 (index!50784 (_ BitVec 32))) (Found!12098 (index!50785 (_ BitVec 32))) (Intermediate!12098 (undefined!12910 Bool) (index!50786 (_ BitVec 32)) (x!132360 (_ BitVec 32))) (Undefined!12098) (MissingVacant!12098 (index!50787 (_ BitVec 32))) )
))
(declare-fun lt!643471 () SeekEntryResult!12098)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!12098)

(assert (=> b!1472684 (= e!826417 (= lt!643471 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643470 lt!643469 mask!2687)))))

(declare-fun b!1472685 () Bool)

(declare-fun res!1000417 () Bool)

(assert (=> b!1472685 (=> (not res!1000417) (not e!826414))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472685 (= res!1000417 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48385 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48385 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48385 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472686 () Bool)

(declare-fun res!1000412 () Bool)

(assert (=> b!1472686 (=> (not res!1000412) (not e!826414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472686 (= res!1000412 (validKeyInArray!0 (select (arr!47833 a!2862) i!1006)))))

(declare-fun b!1472687 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!12098)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!12098)

(assert (=> b!1472687 (= e!826417 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643470 lt!643469 mask!2687) (seekEntryOrOpen!0 lt!643470 lt!643469 mask!2687)))))

(declare-fun b!1472688 () Bool)

(declare-fun e!826416 () Bool)

(assert (=> b!1472688 (= e!826419 e!826416)))

(declare-fun res!1000409 () Bool)

(assert (=> b!1472688 (=> (not res!1000409) (not e!826416))))

(declare-fun lt!643468 () SeekEntryResult!12098)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472688 (= res!1000409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643468))))

(assert (=> b!1472688 (= lt!643468 (Intermediate!12098 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472689 () Bool)

(declare-fun e!826415 () Bool)

(assert (=> b!1472689 (= e!826413 (not e!826415))))

(declare-fun res!1000415 () Bool)

(assert (=> b!1472689 (=> res!1000415 e!826415)))

(assert (=> b!1472689 (= res!1000415 (or (not (= (select (arr!47833 a!2862) index!646) (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47833 a!2862) index!646) (select (arr!47833 a!2862) j!93)))))))

(declare-fun lt!643473 () SeekEntryResult!12098)

(assert (=> b!1472689 (and (= lt!643473 (Found!12098 j!93)) (or (= (select (arr!47833 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47833 a!2862) intermediateBeforeIndex!19) (select (arr!47833 a!2862) j!93))))))

(assert (=> b!1472689 (= lt!643473 (seekEntryOrOpen!0 (select (arr!47833 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1472689 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49377 0))(
  ( (Unit!49378) )
))
(declare-fun lt!643472 () Unit!49377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49377)

(assert (=> b!1472689 (= lt!643472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472690 () Bool)

(declare-fun res!1000419 () Bool)

(assert (=> b!1472690 (=> (not res!1000419) (not e!826414))))

(assert (=> b!1472690 (= res!1000419 (and (= (size!48385 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48385 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48385 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472691 () Bool)

(assert (=> b!1472691 (= e!826416 e!826413)))

(declare-fun res!1000416 () Bool)

(assert (=> b!1472691 (=> (not res!1000416) (not e!826413))))

(assert (=> b!1472691 (= res!1000416 (= lt!643471 (Intermediate!12098 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472691 (= lt!643471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643470 mask!2687) lt!643470 lt!643469 mask!2687))))

(assert (=> b!1472691 (= lt!643470 (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472692 () Bool)

(declare-fun res!1000413 () Bool)

(assert (=> b!1472692 (=> (not res!1000413) (not e!826416))))

(assert (=> b!1472692 (= res!1000413 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643468))))

(declare-fun b!1472683 () Bool)

(assert (=> b!1472683 (= e!826415 (= lt!643473 (seekEntryOrOpen!0 lt!643470 lt!643469 mask!2687)))))

(declare-fun res!1000410 () Bool)

(assert (=> start!125782 (=> (not res!1000410) (not e!826414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125782 (= res!1000410 (validMask!0 mask!2687))))

(assert (=> start!125782 e!826414))

(assert (=> start!125782 true))

(declare-fun array_inv!37066 (array!99094) Bool)

(assert (=> start!125782 (array_inv!37066 a!2862)))

(declare-fun b!1472693 () Bool)

(declare-fun res!1000408 () Bool)

(assert (=> b!1472693 (=> (not res!1000408) (not e!826414))))

(assert (=> b!1472693 (= res!1000408 (validKeyInArray!0 (select (arr!47833 a!2862) j!93)))))

(declare-fun b!1472694 () Bool)

(declare-fun res!1000420 () Bool)

(assert (=> b!1472694 (=> (not res!1000420) (not e!826414))))

(declare-datatypes ((List!34412 0))(
  ( (Nil!34409) (Cons!34408 (h!35764 (_ BitVec 64)) (t!49098 List!34412)) )
))
(declare-fun arrayNoDuplicates!0 (array!99094 (_ BitVec 32) List!34412) Bool)

(assert (=> b!1472694 (= res!1000420 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34409))))

(assert (= (and start!125782 res!1000410) b!1472690))

(assert (= (and b!1472690 res!1000419) b!1472686))

(assert (= (and b!1472686 res!1000412) b!1472693))

(assert (= (and b!1472693 res!1000408) b!1472682))

(assert (= (and b!1472682 res!1000411) b!1472694))

(assert (= (and b!1472694 res!1000420) b!1472685))

(assert (= (and b!1472685 res!1000417) b!1472680))

(assert (= (and b!1472680 res!1000418) b!1472688))

(assert (= (and b!1472688 res!1000409) b!1472692))

(assert (= (and b!1472692 res!1000413) b!1472691))

(assert (= (and b!1472691 res!1000416) b!1472681))

(assert (= (and b!1472681 c!135652) b!1472684))

(assert (= (and b!1472681 (not c!135652)) b!1472687))

(assert (= (and b!1472681 res!1000407) b!1472679))

(assert (= (and b!1472679 res!1000414) b!1472689))

(assert (= (and b!1472689 (not res!1000415)) b!1472683))

(declare-fun m!1358871 () Bool)

(assert (=> b!1472688 m!1358871))

(assert (=> b!1472688 m!1358871))

(declare-fun m!1358873 () Bool)

(assert (=> b!1472688 m!1358873))

(assert (=> b!1472688 m!1358873))

(assert (=> b!1472688 m!1358871))

(declare-fun m!1358875 () Bool)

(assert (=> b!1472688 m!1358875))

(declare-fun m!1358877 () Bool)

(assert (=> b!1472682 m!1358877))

(declare-fun m!1358879 () Bool)

(assert (=> b!1472687 m!1358879))

(declare-fun m!1358881 () Bool)

(assert (=> b!1472687 m!1358881))

(assert (=> b!1472693 m!1358871))

(assert (=> b!1472693 m!1358871))

(declare-fun m!1358883 () Bool)

(assert (=> b!1472693 m!1358883))

(assert (=> b!1472692 m!1358871))

(assert (=> b!1472692 m!1358871))

(declare-fun m!1358885 () Bool)

(assert (=> b!1472692 m!1358885))

(declare-fun m!1358887 () Bool)

(assert (=> b!1472680 m!1358887))

(declare-fun m!1358889 () Bool)

(assert (=> b!1472680 m!1358889))

(declare-fun m!1358891 () Bool)

(assert (=> start!125782 m!1358891))

(declare-fun m!1358893 () Bool)

(assert (=> start!125782 m!1358893))

(declare-fun m!1358895 () Bool)

(assert (=> b!1472691 m!1358895))

(assert (=> b!1472691 m!1358895))

(declare-fun m!1358897 () Bool)

(assert (=> b!1472691 m!1358897))

(assert (=> b!1472691 m!1358887))

(declare-fun m!1358899 () Bool)

(assert (=> b!1472691 m!1358899))

(declare-fun m!1358901 () Bool)

(assert (=> b!1472689 m!1358901))

(assert (=> b!1472689 m!1358887))

(declare-fun m!1358903 () Bool)

(assert (=> b!1472689 m!1358903))

(declare-fun m!1358905 () Bool)

(assert (=> b!1472689 m!1358905))

(declare-fun m!1358907 () Bool)

(assert (=> b!1472689 m!1358907))

(assert (=> b!1472689 m!1358871))

(declare-fun m!1358909 () Bool)

(assert (=> b!1472689 m!1358909))

(declare-fun m!1358911 () Bool)

(assert (=> b!1472689 m!1358911))

(assert (=> b!1472689 m!1358871))

(declare-fun m!1358913 () Bool)

(assert (=> b!1472684 m!1358913))

(declare-fun m!1358915 () Bool)

(assert (=> b!1472694 m!1358915))

(assert (=> b!1472683 m!1358881))

(declare-fun m!1358917 () Bool)

(assert (=> b!1472686 m!1358917))

(assert (=> b!1472686 m!1358917))

(declare-fun m!1358919 () Bool)

(assert (=> b!1472686 m!1358919))

(check-sat (not b!1472683) (not b!1472688) (not b!1472691) (not b!1472686) (not b!1472692) (not b!1472687) (not b!1472689) (not start!125782) (not b!1472693) (not b!1472694) (not b!1472682) (not b!1472684))
(check-sat)
(get-model)

(declare-fun b!1472809 () Bool)

(declare-fun lt!643515 () SeekEntryResult!12098)

(assert (=> b!1472809 (and (bvsge (index!50786 lt!643515) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643515) (size!48385 lt!643469)))))

(declare-fun res!1000511 () Bool)

(assert (=> b!1472809 (= res!1000511 (= (select (arr!47833 lt!643469) (index!50786 lt!643515)) lt!643470))))

(declare-fun e!826476 () Bool)

(assert (=> b!1472809 (=> res!1000511 e!826476)))

(declare-fun e!826474 () Bool)

(assert (=> b!1472809 (= e!826474 e!826476)))

(declare-fun b!1472810 () Bool)

(declare-fun e!826475 () Bool)

(assert (=> b!1472810 (= e!826475 (bvsge (x!132360 lt!643515) #b01111111111111111111111111111110))))

(declare-fun b!1472811 () Bool)

(assert (=> b!1472811 (and (bvsge (index!50786 lt!643515) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643515) (size!48385 lt!643469)))))

(assert (=> b!1472811 (= e!826476 (= (select (arr!47833 lt!643469) (index!50786 lt!643515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472812 () Bool)

(declare-fun e!826472 () SeekEntryResult!12098)

(declare-fun e!826473 () SeekEntryResult!12098)

(assert (=> b!1472812 (= e!826472 e!826473)))

(declare-fun c!135666 () Bool)

(declare-fun lt!643514 () (_ BitVec 64))

(assert (=> b!1472812 (= c!135666 (or (= lt!643514 lt!643470) (= (bvadd lt!643514 lt!643514) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472813 () Bool)

(assert (=> b!1472813 (= e!826475 e!826474)))

(declare-fun res!1000513 () Bool)

(get-info :version)

(assert (=> b!1472813 (= res!1000513 (and ((_ is Intermediate!12098) lt!643515) (not (undefined!12910 lt!643515)) (bvslt (x!132360 lt!643515) #b01111111111111111111111111111110) (bvsge (x!132360 lt!643515) #b00000000000000000000000000000000) (bvsge (x!132360 lt!643515) #b00000000000000000000000000000000)))))

(assert (=> b!1472813 (=> (not res!1000513) (not e!826474))))

(declare-fun b!1472814 () Bool)

(assert (=> b!1472814 (= e!826473 (Intermediate!12098 false (toIndex!0 lt!643470 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1472815 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472815 (= e!826473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643470 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643470 lt!643469 mask!2687))))

(declare-fun d!155361 () Bool)

(assert (=> d!155361 e!826475))

(declare-fun c!135665 () Bool)

(assert (=> d!155361 (= c!135665 (and ((_ is Intermediate!12098) lt!643515) (undefined!12910 lt!643515)))))

(assert (=> d!155361 (= lt!643515 e!826472)))

(declare-fun c!135667 () Bool)

(assert (=> d!155361 (= c!135667 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155361 (= lt!643514 (select (arr!47833 lt!643469) (toIndex!0 lt!643470 mask!2687)))))

(assert (=> d!155361 (validMask!0 mask!2687)))

(assert (=> d!155361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643470 mask!2687) lt!643470 lt!643469 mask!2687) lt!643515)))

(declare-fun b!1472816 () Bool)

(assert (=> b!1472816 (= e!826472 (Intermediate!12098 true (toIndex!0 lt!643470 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1472817 () Bool)

(assert (=> b!1472817 (and (bvsge (index!50786 lt!643515) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643515) (size!48385 lt!643469)))))

(declare-fun res!1000512 () Bool)

(assert (=> b!1472817 (= res!1000512 (= (select (arr!47833 lt!643469) (index!50786 lt!643515)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472817 (=> res!1000512 e!826476)))

(assert (= (and d!155361 c!135667) b!1472816))

(assert (= (and d!155361 (not c!135667)) b!1472812))

(assert (= (and b!1472812 c!135666) b!1472814))

(assert (= (and b!1472812 (not c!135666)) b!1472815))

(assert (= (and d!155361 c!135665) b!1472810))

(assert (= (and d!155361 (not c!135665)) b!1472813))

(assert (= (and b!1472813 res!1000513) b!1472809))

(assert (= (and b!1472809 (not res!1000511)) b!1472817))

(assert (= (and b!1472817 (not res!1000512)) b!1472811))

(assert (=> b!1472815 m!1358895))

(declare-fun m!1359021 () Bool)

(assert (=> b!1472815 m!1359021))

(assert (=> b!1472815 m!1359021))

(declare-fun m!1359023 () Bool)

(assert (=> b!1472815 m!1359023))

(declare-fun m!1359025 () Bool)

(assert (=> b!1472809 m!1359025))

(assert (=> b!1472817 m!1359025))

(assert (=> b!1472811 m!1359025))

(assert (=> d!155361 m!1358895))

(declare-fun m!1359027 () Bool)

(assert (=> d!155361 m!1359027))

(assert (=> d!155361 m!1358891))

(assert (=> b!1472691 d!155361))

(declare-fun d!155363 () Bool)

(declare-fun lt!643521 () (_ BitVec 32))

(declare-fun lt!643520 () (_ BitVec 32))

(assert (=> d!155363 (= lt!643521 (bvmul (bvxor lt!643520 (bvlshr lt!643520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155363 (= lt!643520 ((_ extract 31 0) (bvand (bvxor lt!643470 (bvlshr lt!643470 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155363 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000514 (let ((h!35767 ((_ extract 31 0) (bvand (bvxor lt!643470 (bvlshr lt!643470 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132364 (bvmul (bvxor h!35767 (bvlshr h!35767 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132364 (bvlshr x!132364 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000514 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000514 #b00000000000000000000000000000000))))))

(assert (=> d!155363 (= (toIndex!0 lt!643470 mask!2687) (bvand (bvxor lt!643521 (bvlshr lt!643521 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472691 d!155363))

(declare-fun d!155365 () Bool)

(assert (=> d!155365 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125782 d!155365))

(declare-fun d!155367 () Bool)

(assert (=> d!155367 (= (array_inv!37066 a!2862) (bvsge (size!48385 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125782 d!155367))

(declare-fun b!1472818 () Bool)

(declare-fun lt!643523 () SeekEntryResult!12098)

(assert (=> b!1472818 (and (bvsge (index!50786 lt!643523) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643523) (size!48385 a!2862)))))

(declare-fun res!1000515 () Bool)

(assert (=> b!1472818 (= res!1000515 (= (select (arr!47833 a!2862) (index!50786 lt!643523)) (select (arr!47833 a!2862) j!93)))))

(declare-fun e!826481 () Bool)

(assert (=> b!1472818 (=> res!1000515 e!826481)))

(declare-fun e!826479 () Bool)

(assert (=> b!1472818 (= e!826479 e!826481)))

(declare-fun b!1472819 () Bool)

(declare-fun e!826480 () Bool)

(assert (=> b!1472819 (= e!826480 (bvsge (x!132360 lt!643523) #b01111111111111111111111111111110))))

(declare-fun b!1472820 () Bool)

(assert (=> b!1472820 (and (bvsge (index!50786 lt!643523) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643523) (size!48385 a!2862)))))

(assert (=> b!1472820 (= e!826481 (= (select (arr!47833 a!2862) (index!50786 lt!643523)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472821 () Bool)

(declare-fun e!826477 () SeekEntryResult!12098)

(declare-fun e!826478 () SeekEntryResult!12098)

(assert (=> b!1472821 (= e!826477 e!826478)))

(declare-fun c!135669 () Bool)

(declare-fun lt!643522 () (_ BitVec 64))

(assert (=> b!1472821 (= c!135669 (or (= lt!643522 (select (arr!47833 a!2862) j!93)) (= (bvadd lt!643522 lt!643522) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472822 () Bool)

(assert (=> b!1472822 (= e!826480 e!826479)))

(declare-fun res!1000517 () Bool)

(assert (=> b!1472822 (= res!1000517 (and ((_ is Intermediate!12098) lt!643523) (not (undefined!12910 lt!643523)) (bvslt (x!132360 lt!643523) #b01111111111111111111111111111110) (bvsge (x!132360 lt!643523) #b00000000000000000000000000000000) (bvsge (x!132360 lt!643523) x!665)))))

(assert (=> b!1472822 (=> (not res!1000517) (not e!826479))))

(declare-fun b!1472823 () Bool)

(assert (=> b!1472823 (= e!826478 (Intermediate!12098 false index!646 x!665))))

(declare-fun b!1472824 () Bool)

(assert (=> b!1472824 (= e!826478 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155369 () Bool)

(assert (=> d!155369 e!826480))

(declare-fun c!135668 () Bool)

(assert (=> d!155369 (= c!135668 (and ((_ is Intermediate!12098) lt!643523) (undefined!12910 lt!643523)))))

(assert (=> d!155369 (= lt!643523 e!826477)))

(declare-fun c!135670 () Bool)

(assert (=> d!155369 (= c!135670 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155369 (= lt!643522 (select (arr!47833 a!2862) index!646))))

(assert (=> d!155369 (validMask!0 mask!2687)))

(assert (=> d!155369 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643523)))

(declare-fun b!1472825 () Bool)

(assert (=> b!1472825 (= e!826477 (Intermediate!12098 true index!646 x!665))))

(declare-fun b!1472826 () Bool)

(assert (=> b!1472826 (and (bvsge (index!50786 lt!643523) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643523) (size!48385 a!2862)))))

(declare-fun res!1000516 () Bool)

(assert (=> b!1472826 (= res!1000516 (= (select (arr!47833 a!2862) (index!50786 lt!643523)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472826 (=> res!1000516 e!826481)))

(assert (= (and d!155369 c!135670) b!1472825))

(assert (= (and d!155369 (not c!135670)) b!1472821))

(assert (= (and b!1472821 c!135669) b!1472823))

(assert (= (and b!1472821 (not c!135669)) b!1472824))

(assert (= (and d!155369 c!135668) b!1472819))

(assert (= (and d!155369 (not c!135668)) b!1472822))

(assert (= (and b!1472822 res!1000517) b!1472818))

(assert (= (and b!1472818 (not res!1000515)) b!1472826))

(assert (= (and b!1472826 (not res!1000516)) b!1472820))

(declare-fun m!1359029 () Bool)

(assert (=> b!1472824 m!1359029))

(assert (=> b!1472824 m!1359029))

(assert (=> b!1472824 m!1358871))

(declare-fun m!1359031 () Bool)

(assert (=> b!1472824 m!1359031))

(declare-fun m!1359033 () Bool)

(assert (=> b!1472818 m!1359033))

(assert (=> b!1472826 m!1359033))

(assert (=> b!1472820 m!1359033))

(assert (=> d!155369 m!1358907))

(assert (=> d!155369 m!1358891))

(assert (=> b!1472692 d!155369))

(declare-fun b!1472827 () Bool)

(declare-fun lt!643525 () SeekEntryResult!12098)

(assert (=> b!1472827 (and (bvsge (index!50786 lt!643525) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643525) (size!48385 a!2862)))))

(declare-fun res!1000518 () Bool)

(assert (=> b!1472827 (= res!1000518 (= (select (arr!47833 a!2862) (index!50786 lt!643525)) (select (arr!47833 a!2862) j!93)))))

(declare-fun e!826486 () Bool)

(assert (=> b!1472827 (=> res!1000518 e!826486)))

(declare-fun e!826484 () Bool)

(assert (=> b!1472827 (= e!826484 e!826486)))

(declare-fun b!1472828 () Bool)

(declare-fun e!826485 () Bool)

(assert (=> b!1472828 (= e!826485 (bvsge (x!132360 lt!643525) #b01111111111111111111111111111110))))

(declare-fun b!1472829 () Bool)

(assert (=> b!1472829 (and (bvsge (index!50786 lt!643525) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643525) (size!48385 a!2862)))))

(assert (=> b!1472829 (= e!826486 (= (select (arr!47833 a!2862) (index!50786 lt!643525)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472830 () Bool)

(declare-fun e!826482 () SeekEntryResult!12098)

(declare-fun e!826483 () SeekEntryResult!12098)

(assert (=> b!1472830 (= e!826482 e!826483)))

(declare-fun c!135672 () Bool)

(declare-fun lt!643524 () (_ BitVec 64))

(assert (=> b!1472830 (= c!135672 (or (= lt!643524 (select (arr!47833 a!2862) j!93)) (= (bvadd lt!643524 lt!643524) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472831 () Bool)

(assert (=> b!1472831 (= e!826485 e!826484)))

(declare-fun res!1000520 () Bool)

(assert (=> b!1472831 (= res!1000520 (and ((_ is Intermediate!12098) lt!643525) (not (undefined!12910 lt!643525)) (bvslt (x!132360 lt!643525) #b01111111111111111111111111111110) (bvsge (x!132360 lt!643525) #b00000000000000000000000000000000) (bvsge (x!132360 lt!643525) #b00000000000000000000000000000000)))))

(assert (=> b!1472831 (=> (not res!1000520) (not e!826484))))

(declare-fun b!1472832 () Bool)

(assert (=> b!1472832 (= e!826483 (Intermediate!12098 false (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1472833 () Bool)

(assert (=> b!1472833 (= e!826483 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155371 () Bool)

(assert (=> d!155371 e!826485))

(declare-fun c!135671 () Bool)

(assert (=> d!155371 (= c!135671 (and ((_ is Intermediate!12098) lt!643525) (undefined!12910 lt!643525)))))

(assert (=> d!155371 (= lt!643525 e!826482)))

(declare-fun c!135673 () Bool)

(assert (=> d!155371 (= c!135673 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155371 (= lt!643524 (select (arr!47833 a!2862) (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687)))))

(assert (=> d!155371 (validMask!0 mask!2687)))

(assert (=> d!155371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643525)))

(declare-fun b!1472834 () Bool)

(assert (=> b!1472834 (= e!826482 (Intermediate!12098 true (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1472835 () Bool)

(assert (=> b!1472835 (and (bvsge (index!50786 lt!643525) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643525) (size!48385 a!2862)))))

(declare-fun res!1000519 () Bool)

(assert (=> b!1472835 (= res!1000519 (= (select (arr!47833 a!2862) (index!50786 lt!643525)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472835 (=> res!1000519 e!826486)))

(assert (= (and d!155371 c!135673) b!1472834))

(assert (= (and d!155371 (not c!135673)) b!1472830))

(assert (= (and b!1472830 c!135672) b!1472832))

(assert (= (and b!1472830 (not c!135672)) b!1472833))

(assert (= (and d!155371 c!135671) b!1472828))

(assert (= (and d!155371 (not c!135671)) b!1472831))

(assert (= (and b!1472831 res!1000520) b!1472827))

(assert (= (and b!1472827 (not res!1000518)) b!1472835))

(assert (= (and b!1472835 (not res!1000519)) b!1472829))

(assert (=> b!1472833 m!1358873))

(declare-fun m!1359035 () Bool)

(assert (=> b!1472833 m!1359035))

(assert (=> b!1472833 m!1359035))

(assert (=> b!1472833 m!1358871))

(declare-fun m!1359037 () Bool)

(assert (=> b!1472833 m!1359037))

(declare-fun m!1359039 () Bool)

(assert (=> b!1472827 m!1359039))

(assert (=> b!1472835 m!1359039))

(assert (=> b!1472829 m!1359039))

(assert (=> d!155371 m!1358873))

(declare-fun m!1359041 () Bool)

(assert (=> d!155371 m!1359041))

(assert (=> d!155371 m!1358891))

(assert (=> b!1472688 d!155371))

(declare-fun d!155373 () Bool)

(declare-fun lt!643527 () (_ BitVec 32))

(declare-fun lt!643526 () (_ BitVec 32))

(assert (=> d!155373 (= lt!643527 (bvmul (bvxor lt!643526 (bvlshr lt!643526 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155373 (= lt!643526 ((_ extract 31 0) (bvand (bvxor (select (arr!47833 a!2862) j!93) (bvlshr (select (arr!47833 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155373 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000514 (let ((h!35767 ((_ extract 31 0) (bvand (bvxor (select (arr!47833 a!2862) j!93) (bvlshr (select (arr!47833 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132364 (bvmul (bvxor h!35767 (bvlshr h!35767 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132364 (bvlshr x!132364 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000514 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000514 #b00000000000000000000000000000000))))))

(assert (=> d!155373 (= (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) (bvand (bvxor lt!643527 (bvlshr lt!643527 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472688 d!155373))

(declare-fun b!1472848 () Bool)

(declare-fun e!826495 () SeekEntryResult!12098)

(declare-fun lt!643535 () SeekEntryResult!12098)

(assert (=> b!1472848 (= e!826495 (Found!12098 (index!50786 lt!643535)))))

(declare-fun b!1472849 () Bool)

(declare-fun e!826493 () SeekEntryResult!12098)

(assert (=> b!1472849 (= e!826493 e!826495)))

(declare-fun lt!643536 () (_ BitVec 64))

(assert (=> b!1472849 (= lt!643536 (select (arr!47833 a!2862) (index!50786 lt!643535)))))

(declare-fun c!135680 () Bool)

(assert (=> b!1472849 (= c!135680 (= lt!643536 (select (arr!47833 a!2862) j!93)))))

(declare-fun b!1472850 () Bool)

(declare-fun e!826494 () SeekEntryResult!12098)

(assert (=> b!1472850 (= e!826494 (MissingZero!12098 (index!50786 lt!643535)))))

(declare-fun d!155375 () Bool)

(declare-fun lt!643534 () SeekEntryResult!12098)

(assert (=> d!155375 (and (or ((_ is Undefined!12098) lt!643534) (not ((_ is Found!12098) lt!643534)) (and (bvsge (index!50785 lt!643534) #b00000000000000000000000000000000) (bvslt (index!50785 lt!643534) (size!48385 a!2862)))) (or ((_ is Undefined!12098) lt!643534) ((_ is Found!12098) lt!643534) (not ((_ is MissingZero!12098) lt!643534)) (and (bvsge (index!50784 lt!643534) #b00000000000000000000000000000000) (bvslt (index!50784 lt!643534) (size!48385 a!2862)))) (or ((_ is Undefined!12098) lt!643534) ((_ is Found!12098) lt!643534) ((_ is MissingZero!12098) lt!643534) (not ((_ is MissingVacant!12098) lt!643534)) (and (bvsge (index!50787 lt!643534) #b00000000000000000000000000000000) (bvslt (index!50787 lt!643534) (size!48385 a!2862)))) (or ((_ is Undefined!12098) lt!643534) (ite ((_ is Found!12098) lt!643534) (= (select (arr!47833 a!2862) (index!50785 lt!643534)) (select (arr!47833 a!2862) j!93)) (ite ((_ is MissingZero!12098) lt!643534) (= (select (arr!47833 a!2862) (index!50784 lt!643534)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12098) lt!643534) (= (select (arr!47833 a!2862) (index!50787 lt!643534)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155375 (= lt!643534 e!826493)))

(declare-fun c!135682 () Bool)

(assert (=> d!155375 (= c!135682 (and ((_ is Intermediate!12098) lt!643535) (undefined!12910 lt!643535)))))

(assert (=> d!155375 (= lt!643535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155375 (validMask!0 mask!2687)))

(assert (=> d!155375 (= (seekEntryOrOpen!0 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643534)))

(declare-fun b!1472851 () Bool)

(assert (=> b!1472851 (= e!826494 (seekKeyOrZeroReturnVacant!0 (x!132360 lt!643535) (index!50786 lt!643535) (index!50786 lt!643535) (select (arr!47833 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1472852 () Bool)

(declare-fun c!135681 () Bool)

(assert (=> b!1472852 (= c!135681 (= lt!643536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472852 (= e!826495 e!826494)))

(declare-fun b!1472853 () Bool)

(assert (=> b!1472853 (= e!826493 Undefined!12098)))

(assert (= (and d!155375 c!135682) b!1472853))

(assert (= (and d!155375 (not c!135682)) b!1472849))

(assert (= (and b!1472849 c!135680) b!1472848))

(assert (= (and b!1472849 (not c!135680)) b!1472852))

(assert (= (and b!1472852 c!135681) b!1472850))

(assert (= (and b!1472852 (not c!135681)) b!1472851))

(declare-fun m!1359043 () Bool)

(assert (=> b!1472849 m!1359043))

(declare-fun m!1359045 () Bool)

(assert (=> d!155375 m!1359045))

(assert (=> d!155375 m!1358871))

(assert (=> d!155375 m!1358873))

(assert (=> d!155375 m!1358873))

(assert (=> d!155375 m!1358871))

(assert (=> d!155375 m!1358875))

(assert (=> d!155375 m!1358891))

(declare-fun m!1359047 () Bool)

(assert (=> d!155375 m!1359047))

(declare-fun m!1359049 () Bool)

(assert (=> d!155375 m!1359049))

(assert (=> b!1472851 m!1358871))

(declare-fun m!1359051 () Bool)

(assert (=> b!1472851 m!1359051))

(assert (=> b!1472689 d!155375))

(declare-fun b!1472862 () Bool)

(declare-fun e!826503 () Bool)

(declare-fun call!67712 () Bool)

(assert (=> b!1472862 (= e!826503 call!67712)))

(declare-fun b!1472863 () Bool)

(declare-fun e!826502 () Bool)

(assert (=> b!1472863 (= e!826502 call!67712)))

(declare-fun d!155383 () Bool)

(declare-fun res!1000525 () Bool)

(declare-fun e!826504 () Bool)

(assert (=> d!155383 (=> res!1000525 e!826504)))

(assert (=> d!155383 (= res!1000525 (bvsge j!93 (size!48385 a!2862)))))

(assert (=> d!155383 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!826504)))

(declare-fun bm!67709 () Bool)

(assert (=> bm!67709 (= call!67712 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1472864 () Bool)

(assert (=> b!1472864 (= e!826504 e!826502)))

(declare-fun c!135685 () Bool)

(assert (=> b!1472864 (= c!135685 (validKeyInArray!0 (select (arr!47833 a!2862) j!93)))))

(declare-fun b!1472865 () Bool)

(assert (=> b!1472865 (= e!826502 e!826503)))

(declare-fun lt!643545 () (_ BitVec 64))

(assert (=> b!1472865 (= lt!643545 (select (arr!47833 a!2862) j!93))))

(declare-fun lt!643543 () Unit!49377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99094 (_ BitVec 64) (_ BitVec 32)) Unit!49377)

(assert (=> b!1472865 (= lt!643543 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643545 j!93))))

(declare-fun arrayContainsKey!0 (array!99094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1472865 (arrayContainsKey!0 a!2862 lt!643545 #b00000000000000000000000000000000)))

(declare-fun lt!643544 () Unit!49377)

(assert (=> b!1472865 (= lt!643544 lt!643543)))

(declare-fun res!1000526 () Bool)

(assert (=> b!1472865 (= res!1000526 (= (seekEntryOrOpen!0 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) (Found!12098 j!93)))))

(assert (=> b!1472865 (=> (not res!1000526) (not e!826503))))

(assert (= (and d!155383 (not res!1000525)) b!1472864))

(assert (= (and b!1472864 c!135685) b!1472865))

(assert (= (and b!1472864 (not c!135685)) b!1472863))

(assert (= (and b!1472865 res!1000526) b!1472862))

(assert (= (or b!1472862 b!1472863) bm!67709))

(declare-fun m!1359053 () Bool)

(assert (=> bm!67709 m!1359053))

(assert (=> b!1472864 m!1358871))

(assert (=> b!1472864 m!1358871))

(assert (=> b!1472864 m!1358883))

(assert (=> b!1472865 m!1358871))

(declare-fun m!1359055 () Bool)

(assert (=> b!1472865 m!1359055))

(declare-fun m!1359057 () Bool)

(assert (=> b!1472865 m!1359057))

(assert (=> b!1472865 m!1358871))

(assert (=> b!1472865 m!1358909))

(assert (=> b!1472689 d!155383))

(declare-fun d!155387 () Bool)

(assert (=> d!155387 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643552 () Unit!49377)

(declare-fun choose!38 (array!99094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49377)

(assert (=> d!155387 (= lt!643552 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155387 (validMask!0 mask!2687)))

(assert (=> d!155387 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643552)))

(declare-fun bs!42505 () Bool)

(assert (= bs!42505 d!155387))

(assert (=> bs!42505 m!1358911))

(declare-fun m!1359059 () Bool)

(assert (=> bs!42505 m!1359059))

(assert (=> bs!42505 m!1358891))

(assert (=> b!1472689 d!155387))

(declare-fun b!1472939 () Bool)

(declare-fun e!826547 () SeekEntryResult!12098)

(declare-fun e!826549 () SeekEntryResult!12098)

(assert (=> b!1472939 (= e!826547 e!826549)))

(declare-fun c!135714 () Bool)

(declare-fun lt!643586 () (_ BitVec 64))

(assert (=> b!1472939 (= c!135714 (= lt!643586 lt!643470))))

(declare-fun b!1472940 () Bool)

(declare-fun e!826548 () SeekEntryResult!12098)

(assert (=> b!1472940 (= e!826548 (MissingVacant!12098 intermediateAfterIndex!19))))

(declare-fun b!1472941 () Bool)

(assert (=> b!1472941 (= e!826548 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643470 lt!643469 mask!2687))))

(declare-fun b!1472943 () Bool)

(declare-fun c!135715 () Bool)

(assert (=> b!1472943 (= c!135715 (= lt!643586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472943 (= e!826549 e!826548)))

(declare-fun b!1472944 () Bool)

(assert (=> b!1472944 (= e!826547 Undefined!12098)))

(declare-fun lt!643587 () SeekEntryResult!12098)

(declare-fun d!155389 () Bool)

(assert (=> d!155389 (and (or ((_ is Undefined!12098) lt!643587) (not ((_ is Found!12098) lt!643587)) (and (bvsge (index!50785 lt!643587) #b00000000000000000000000000000000) (bvslt (index!50785 lt!643587) (size!48385 lt!643469)))) (or ((_ is Undefined!12098) lt!643587) ((_ is Found!12098) lt!643587) (not ((_ is MissingVacant!12098) lt!643587)) (not (= (index!50787 lt!643587) intermediateAfterIndex!19)) (and (bvsge (index!50787 lt!643587) #b00000000000000000000000000000000) (bvslt (index!50787 lt!643587) (size!48385 lt!643469)))) (or ((_ is Undefined!12098) lt!643587) (ite ((_ is Found!12098) lt!643587) (= (select (arr!47833 lt!643469) (index!50785 lt!643587)) lt!643470) (and ((_ is MissingVacant!12098) lt!643587) (= (index!50787 lt!643587) intermediateAfterIndex!19) (= (select (arr!47833 lt!643469) (index!50787 lt!643587)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155389 (= lt!643587 e!826547)))

(declare-fun c!135716 () Bool)

(assert (=> d!155389 (= c!135716 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155389 (= lt!643586 (select (arr!47833 lt!643469) index!646))))

(assert (=> d!155389 (validMask!0 mask!2687)))

(assert (=> d!155389 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643470 lt!643469 mask!2687) lt!643587)))

(declare-fun b!1472942 () Bool)

(assert (=> b!1472942 (= e!826549 (Found!12098 index!646))))

(assert (= (and d!155389 c!135716) b!1472944))

(assert (= (and d!155389 (not c!135716)) b!1472939))

(assert (= (and b!1472939 c!135714) b!1472942))

(assert (= (and b!1472939 (not c!135714)) b!1472943))

(assert (= (and b!1472943 c!135715) b!1472940))

(assert (= (and b!1472943 (not c!135715)) b!1472941))

(assert (=> b!1472941 m!1359029))

(assert (=> b!1472941 m!1359029))

(declare-fun m!1359079 () Bool)

(assert (=> b!1472941 m!1359079))

(declare-fun m!1359081 () Bool)

(assert (=> d!155389 m!1359081))

(declare-fun m!1359083 () Bool)

(assert (=> d!155389 m!1359083))

(declare-fun m!1359085 () Bool)

(assert (=> d!155389 m!1359085))

(assert (=> d!155389 m!1358891))

(assert (=> b!1472687 d!155389))

(declare-fun b!1472949 () Bool)

(declare-fun e!826555 () SeekEntryResult!12098)

(declare-fun lt!643592 () SeekEntryResult!12098)

(assert (=> b!1472949 (= e!826555 (Found!12098 (index!50786 lt!643592)))))

(declare-fun b!1472950 () Bool)

(declare-fun e!826553 () SeekEntryResult!12098)

(assert (=> b!1472950 (= e!826553 e!826555)))

(declare-fun lt!643593 () (_ BitVec 64))

(assert (=> b!1472950 (= lt!643593 (select (arr!47833 lt!643469) (index!50786 lt!643592)))))

(declare-fun c!135718 () Bool)

(assert (=> b!1472950 (= c!135718 (= lt!643593 lt!643470))))

(declare-fun b!1472951 () Bool)

(declare-fun e!826554 () SeekEntryResult!12098)

(assert (=> b!1472951 (= e!826554 (MissingZero!12098 (index!50786 lt!643592)))))

(declare-fun d!155397 () Bool)

(declare-fun lt!643591 () SeekEntryResult!12098)

(assert (=> d!155397 (and (or ((_ is Undefined!12098) lt!643591) (not ((_ is Found!12098) lt!643591)) (and (bvsge (index!50785 lt!643591) #b00000000000000000000000000000000) (bvslt (index!50785 lt!643591) (size!48385 lt!643469)))) (or ((_ is Undefined!12098) lt!643591) ((_ is Found!12098) lt!643591) (not ((_ is MissingZero!12098) lt!643591)) (and (bvsge (index!50784 lt!643591) #b00000000000000000000000000000000) (bvslt (index!50784 lt!643591) (size!48385 lt!643469)))) (or ((_ is Undefined!12098) lt!643591) ((_ is Found!12098) lt!643591) ((_ is MissingZero!12098) lt!643591) (not ((_ is MissingVacant!12098) lt!643591)) (and (bvsge (index!50787 lt!643591) #b00000000000000000000000000000000) (bvslt (index!50787 lt!643591) (size!48385 lt!643469)))) (or ((_ is Undefined!12098) lt!643591) (ite ((_ is Found!12098) lt!643591) (= (select (arr!47833 lt!643469) (index!50785 lt!643591)) lt!643470) (ite ((_ is MissingZero!12098) lt!643591) (= (select (arr!47833 lt!643469) (index!50784 lt!643591)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12098) lt!643591) (= (select (arr!47833 lt!643469) (index!50787 lt!643591)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155397 (= lt!643591 e!826553)))

(declare-fun c!135720 () Bool)

(assert (=> d!155397 (= c!135720 (and ((_ is Intermediate!12098) lt!643592) (undefined!12910 lt!643592)))))

(assert (=> d!155397 (= lt!643592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643470 mask!2687) lt!643470 lt!643469 mask!2687))))

(assert (=> d!155397 (validMask!0 mask!2687)))

(assert (=> d!155397 (= (seekEntryOrOpen!0 lt!643470 lt!643469 mask!2687) lt!643591)))

(declare-fun b!1472952 () Bool)

(assert (=> b!1472952 (= e!826554 (seekKeyOrZeroReturnVacant!0 (x!132360 lt!643592) (index!50786 lt!643592) (index!50786 lt!643592) lt!643470 lt!643469 mask!2687))))

(declare-fun b!1472953 () Bool)

(declare-fun c!135719 () Bool)

(assert (=> b!1472953 (= c!135719 (= lt!643593 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472953 (= e!826555 e!826554)))

(declare-fun b!1472954 () Bool)

(assert (=> b!1472954 (= e!826553 Undefined!12098)))

(assert (= (and d!155397 c!135720) b!1472954))

(assert (= (and d!155397 (not c!135720)) b!1472950))

(assert (= (and b!1472950 c!135718) b!1472949))

(assert (= (and b!1472950 (not c!135718)) b!1472953))

(assert (= (and b!1472953 c!135719) b!1472951))

(assert (= (and b!1472953 (not c!135719)) b!1472952))

(declare-fun m!1359093 () Bool)

(assert (=> b!1472950 m!1359093))

(declare-fun m!1359095 () Bool)

(assert (=> d!155397 m!1359095))

(assert (=> d!155397 m!1358895))

(assert (=> d!155397 m!1358895))

(assert (=> d!155397 m!1358897))

(assert (=> d!155397 m!1358891))

(declare-fun m!1359097 () Bool)

(assert (=> d!155397 m!1359097))

(declare-fun m!1359099 () Bool)

(assert (=> d!155397 m!1359099))

(declare-fun m!1359101 () Bool)

(assert (=> b!1472952 m!1359101))

(assert (=> b!1472687 d!155397))

(declare-fun d!155401 () Bool)

(assert (=> d!155401 (= (validKeyInArray!0 (select (arr!47833 a!2862) i!1006)) (and (not (= (select (arr!47833 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47833 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472686 d!155401))

(assert (=> b!1472683 d!155397))

(declare-fun b!1472959 () Bool)

(declare-fun e!826560 () Bool)

(declare-fun call!67719 () Bool)

(assert (=> b!1472959 (= e!826560 call!67719)))

(declare-fun b!1472960 () Bool)

(declare-fun e!826559 () Bool)

(assert (=> b!1472960 (= e!826559 call!67719)))

(declare-fun d!155405 () Bool)

(declare-fun res!1000549 () Bool)

(declare-fun e!826561 () Bool)

(assert (=> d!155405 (=> res!1000549 e!826561)))

(assert (=> d!155405 (= res!1000549 (bvsge #b00000000000000000000000000000000 (size!48385 a!2862)))))

(assert (=> d!155405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!826561)))

(declare-fun bm!67716 () Bool)

(assert (=> bm!67716 (= call!67719 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1472961 () Bool)

(assert (=> b!1472961 (= e!826561 e!826559)))

(declare-fun c!135722 () Bool)

(assert (=> b!1472961 (= c!135722 (validKeyInArray!0 (select (arr!47833 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1472962 () Bool)

(assert (=> b!1472962 (= e!826559 e!826560)))

(declare-fun lt!643599 () (_ BitVec 64))

(assert (=> b!1472962 (= lt!643599 (select (arr!47833 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643597 () Unit!49377)

(assert (=> b!1472962 (= lt!643597 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643599 #b00000000000000000000000000000000))))

(assert (=> b!1472962 (arrayContainsKey!0 a!2862 lt!643599 #b00000000000000000000000000000000)))

(declare-fun lt!643598 () Unit!49377)

(assert (=> b!1472962 (= lt!643598 lt!643597)))

(declare-fun res!1000550 () Bool)

(assert (=> b!1472962 (= res!1000550 (= (seekEntryOrOpen!0 (select (arr!47833 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12098 #b00000000000000000000000000000000)))))

(assert (=> b!1472962 (=> (not res!1000550) (not e!826560))))

(assert (= (and d!155405 (not res!1000549)) b!1472961))

(assert (= (and b!1472961 c!135722) b!1472962))

(assert (= (and b!1472961 (not c!135722)) b!1472960))

(assert (= (and b!1472962 res!1000550) b!1472959))

(assert (= (or b!1472959 b!1472960) bm!67716))

(declare-fun m!1359115 () Bool)

(assert (=> bm!67716 m!1359115))

(declare-fun m!1359117 () Bool)

(assert (=> b!1472961 m!1359117))

(assert (=> b!1472961 m!1359117))

(declare-fun m!1359119 () Bool)

(assert (=> b!1472961 m!1359119))

(assert (=> b!1472962 m!1359117))

(declare-fun m!1359121 () Bool)

(assert (=> b!1472962 m!1359121))

(declare-fun m!1359123 () Bool)

(assert (=> b!1472962 m!1359123))

(assert (=> b!1472962 m!1359117))

(declare-fun m!1359125 () Bool)

(assert (=> b!1472962 m!1359125))

(assert (=> b!1472682 d!155405))

(declare-fun d!155411 () Bool)

(assert (=> d!155411 (= (validKeyInArray!0 (select (arr!47833 a!2862) j!93)) (and (not (= (select (arr!47833 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47833 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472693 d!155411))

(declare-fun b!1472963 () Bool)

(declare-fun lt!643601 () SeekEntryResult!12098)

(assert (=> b!1472963 (and (bvsge (index!50786 lt!643601) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643601) (size!48385 lt!643469)))))

(declare-fun res!1000551 () Bool)

(assert (=> b!1472963 (= res!1000551 (= (select (arr!47833 lt!643469) (index!50786 lt!643601)) lt!643470))))

(declare-fun e!826566 () Bool)

(assert (=> b!1472963 (=> res!1000551 e!826566)))

(declare-fun e!826564 () Bool)

(assert (=> b!1472963 (= e!826564 e!826566)))

(declare-fun b!1472964 () Bool)

(declare-fun e!826565 () Bool)

(assert (=> b!1472964 (= e!826565 (bvsge (x!132360 lt!643601) #b01111111111111111111111111111110))))

(declare-fun b!1472965 () Bool)

(assert (=> b!1472965 (and (bvsge (index!50786 lt!643601) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643601) (size!48385 lt!643469)))))

(assert (=> b!1472965 (= e!826566 (= (select (arr!47833 lt!643469) (index!50786 lt!643601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1472966 () Bool)

(declare-fun e!826562 () SeekEntryResult!12098)

(declare-fun e!826563 () SeekEntryResult!12098)

(assert (=> b!1472966 (= e!826562 e!826563)))

(declare-fun c!135724 () Bool)

(declare-fun lt!643600 () (_ BitVec 64))

(assert (=> b!1472966 (= c!135724 (or (= lt!643600 lt!643470) (= (bvadd lt!643600 lt!643600) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1472967 () Bool)

(assert (=> b!1472967 (= e!826565 e!826564)))

(declare-fun res!1000553 () Bool)

(assert (=> b!1472967 (= res!1000553 (and ((_ is Intermediate!12098) lt!643601) (not (undefined!12910 lt!643601)) (bvslt (x!132360 lt!643601) #b01111111111111111111111111111110) (bvsge (x!132360 lt!643601) #b00000000000000000000000000000000) (bvsge (x!132360 lt!643601) x!665)))))

(assert (=> b!1472967 (=> (not res!1000553) (not e!826564))))

(declare-fun b!1472968 () Bool)

(assert (=> b!1472968 (= e!826563 (Intermediate!12098 false index!646 x!665))))

(declare-fun b!1472969 () Bool)

(assert (=> b!1472969 (= e!826563 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!643470 lt!643469 mask!2687))))

(declare-fun d!155413 () Bool)

(assert (=> d!155413 e!826565))

(declare-fun c!135723 () Bool)

(assert (=> d!155413 (= c!135723 (and ((_ is Intermediate!12098) lt!643601) (undefined!12910 lt!643601)))))

(assert (=> d!155413 (= lt!643601 e!826562)))

(declare-fun c!135725 () Bool)

(assert (=> d!155413 (= c!135725 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155413 (= lt!643600 (select (arr!47833 lt!643469) index!646))))

(assert (=> d!155413 (validMask!0 mask!2687)))

(assert (=> d!155413 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643470 lt!643469 mask!2687) lt!643601)))

(declare-fun b!1472970 () Bool)

(assert (=> b!1472970 (= e!826562 (Intermediate!12098 true index!646 x!665))))

(declare-fun b!1472971 () Bool)

(assert (=> b!1472971 (and (bvsge (index!50786 lt!643601) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643601) (size!48385 lt!643469)))))

(declare-fun res!1000552 () Bool)

(assert (=> b!1472971 (= res!1000552 (= (select (arr!47833 lt!643469) (index!50786 lt!643601)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472971 (=> res!1000552 e!826566)))

(assert (= (and d!155413 c!135725) b!1472970))

(assert (= (and d!155413 (not c!135725)) b!1472966))

(assert (= (and b!1472966 c!135724) b!1472968))

(assert (= (and b!1472966 (not c!135724)) b!1472969))

(assert (= (and d!155413 c!135723) b!1472964))

(assert (= (and d!155413 (not c!135723)) b!1472967))

(assert (= (and b!1472967 res!1000553) b!1472963))

(assert (= (and b!1472963 (not res!1000551)) b!1472971))

(assert (= (and b!1472971 (not res!1000552)) b!1472965))

(assert (=> b!1472969 m!1359029))

(assert (=> b!1472969 m!1359029))

(declare-fun m!1359127 () Bool)

(assert (=> b!1472969 m!1359127))

(declare-fun m!1359129 () Bool)

(assert (=> b!1472963 m!1359129))

(assert (=> b!1472971 m!1359129))

(assert (=> b!1472965 m!1359129))

(assert (=> d!155413 m!1359085))

(assert (=> d!155413 m!1358891))

(assert (=> b!1472684 d!155413))

(declare-fun b!1472997 () Bool)

(declare-fun e!826590 () Bool)

(declare-fun e!826589 () Bool)

(assert (=> b!1472997 (= e!826590 e!826589)))

(declare-fun res!1000571 () Bool)

(assert (=> b!1472997 (=> (not res!1000571) (not e!826589))))

(declare-fun e!826588 () Bool)

(assert (=> b!1472997 (= res!1000571 (not e!826588))))

(declare-fun res!1000570 () Bool)

(assert (=> b!1472997 (=> (not res!1000570) (not e!826588))))

(assert (=> b!1472997 (= res!1000570 (validKeyInArray!0 (select (arr!47833 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1472998 () Bool)

(declare-fun e!826587 () Bool)

(assert (=> b!1472998 (= e!826589 e!826587)))

(declare-fun c!135731 () Bool)

(assert (=> b!1472998 (= c!135731 (validKeyInArray!0 (select (arr!47833 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1472999 () Bool)

(declare-fun call!67725 () Bool)

(assert (=> b!1472999 (= e!826587 call!67725)))

(declare-fun b!1473000 () Bool)

(assert (=> b!1473000 (= e!826587 call!67725)))

(declare-fun d!155415 () Bool)

(declare-fun res!1000569 () Bool)

(assert (=> d!155415 (=> res!1000569 e!826590)))

(assert (=> d!155415 (= res!1000569 (bvsge #b00000000000000000000000000000000 (size!48385 a!2862)))))

(assert (=> d!155415 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34409) e!826590)))

(declare-fun bm!67722 () Bool)

(assert (=> bm!67722 (= call!67725 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135731 (Cons!34408 (select (arr!47833 a!2862) #b00000000000000000000000000000000) Nil!34409) Nil!34409)))))

(declare-fun b!1473001 () Bool)

(declare-fun contains!9866 (List!34412 (_ BitVec 64)) Bool)

(assert (=> b!1473001 (= e!826588 (contains!9866 Nil!34409 (select (arr!47833 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155415 (not res!1000569)) b!1472997))

(assert (= (and b!1472997 res!1000570) b!1473001))

(assert (= (and b!1472997 res!1000571) b!1472998))

(assert (= (and b!1472998 c!135731) b!1472999))

(assert (= (and b!1472998 (not c!135731)) b!1473000))

(assert (= (or b!1472999 b!1473000) bm!67722))

(assert (=> b!1472997 m!1359117))

(assert (=> b!1472997 m!1359117))

(assert (=> b!1472997 m!1359119))

(assert (=> b!1472998 m!1359117))

(assert (=> b!1472998 m!1359117))

(assert (=> b!1472998 m!1359119))

(assert (=> bm!67722 m!1359117))

(declare-fun m!1359137 () Bool)

(assert (=> bm!67722 m!1359137))

(assert (=> b!1473001 m!1359117))

(assert (=> b!1473001 m!1359117))

(declare-fun m!1359139 () Bool)

(assert (=> b!1473001 m!1359139))

(assert (=> b!1472694 d!155415))

(check-sat (not d!155413) (not d!155389) (not bm!67709) (not b!1473001) (not bm!67722) (not b!1472962) (not d!155369) (not b!1472952) (not b!1472815) (not b!1472969) (not b!1472941) (not d!155371) (not b!1472824) (not d!155375) (not b!1472851) (not b!1472961) (not b!1472997) (not bm!67716) (not b!1472998) (not b!1472833) (not d!155361) (not d!155397) (not b!1472864) (not b!1472865) (not d!155387))
(check-sat)
