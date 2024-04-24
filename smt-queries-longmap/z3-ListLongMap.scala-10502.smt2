; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123880 () Bool)

(assert start!123880)

(declare-fun b!1434881 () Bool)

(declare-fun res!967707 () Bool)

(declare-fun e!809991 () Bool)

(assert (=> b!1434881 (=> (not res!967707) (not e!809991))))

(declare-datatypes ((SeekEntryResult!11321 0))(
  ( (MissingZero!11321 (index!47676 (_ BitVec 32))) (Found!11321 (index!47677 (_ BitVec 32))) (Intermediate!11321 (undefined!12133 Bool) (index!47678 (_ BitVec 32)) (x!129484 (_ BitVec 32))) (Undefined!11321) (MissingVacant!11321 (index!47679 (_ BitVec 32))) )
))
(declare-fun lt!631565 () SeekEntryResult!11321)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97676 0))(
  ( (array!97677 (arr!47140 (Array (_ BitVec 32) (_ BitVec 64))) (size!47691 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97676)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97676 (_ BitVec 32)) SeekEntryResult!11321)

(assert (=> b!1434881 (= res!967707 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47140 a!2831) j!81) a!2831 mask!2608) lt!631565))))

(declare-fun b!1434882 () Bool)

(declare-fun e!809996 () Bool)

(declare-fun e!809993 () Bool)

(assert (=> b!1434882 (= e!809996 e!809993)))

(declare-fun res!967716 () Bool)

(assert (=> b!1434882 (=> (not res!967716) (not e!809993))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434882 (= res!967716 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) (select (arr!47140 a!2831) j!81) a!2831 mask!2608) lt!631565))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1434882 (= lt!631565 (Intermediate!11321 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun e!809992 () Bool)

(declare-fun b!1434883 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97676 (_ BitVec 32)) SeekEntryResult!11321)

(assert (=> b!1434883 (= e!809992 (= (seekEntryOrOpen!0 (select (arr!47140 a!2831) j!81) a!2831 mask!2608) (Found!11321 j!81)))))

(declare-fun b!1434884 () Bool)

(declare-fun res!967719 () Bool)

(assert (=> b!1434884 (=> (not res!967719) (not e!809996))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434884 (= res!967719 (and (= (size!47691 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47691 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47691 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434885 () Bool)

(declare-fun res!967720 () Bool)

(assert (=> b!1434885 (=> (not res!967720) (not e!809996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97676 (_ BitVec 32)) Bool)

(assert (=> b!1434885 (= res!967720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434886 () Bool)

(declare-fun res!967713 () Bool)

(assert (=> b!1434886 (=> (not res!967713) (not e!809996))))

(declare-datatypes ((List!33637 0))(
  ( (Nil!33634) (Cons!33633 (h!34970 (_ BitVec 64)) (t!48323 List!33637)) )
))
(declare-fun arrayNoDuplicates!0 (array!97676 (_ BitVec 32) List!33637) Bool)

(assert (=> b!1434886 (= res!967713 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33634))))

(declare-fun res!967710 () Bool)

(assert (=> start!123880 (=> (not res!967710) (not e!809996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123880 (= res!967710 (validMask!0 mask!2608))))

(assert (=> start!123880 e!809996))

(assert (=> start!123880 true))

(declare-fun array_inv!36421 (array!97676) Bool)

(assert (=> start!123880 (array_inv!36421 a!2831)))

(declare-fun b!1434887 () Bool)

(declare-fun res!967708 () Bool)

(assert (=> b!1434887 (=> (not res!967708) (not e!809991))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434887 (= res!967708 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434888 () Bool)

(declare-fun res!967709 () Bool)

(assert (=> b!1434888 (=> (not res!967709) (not e!809996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434888 (= res!967709 (validKeyInArray!0 (select (arr!47140 a!2831) j!81)))))

(declare-fun b!1434889 () Bool)

(assert (=> b!1434889 (= e!809993 e!809991)))

(declare-fun res!967711 () Bool)

(assert (=> b!1434889 (=> (not res!967711) (not e!809991))))

(declare-fun lt!631564 () SeekEntryResult!11321)

(declare-fun lt!631561 () (_ BitVec 64))

(declare-fun lt!631560 () array!97676)

(assert (=> b!1434889 (= res!967711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631561 mask!2608) lt!631561 lt!631560 mask!2608) lt!631564))))

(assert (=> b!1434889 (= lt!631564 (Intermediate!11321 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434889 (= lt!631561 (select (store (arr!47140 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434889 (= lt!631560 (array!97677 (store (arr!47140 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47691 a!2831)))))

(declare-fun b!1434890 () Bool)

(declare-fun e!809995 () Bool)

(assert (=> b!1434890 (= e!809991 (not e!809995))))

(declare-fun res!967717 () Bool)

(assert (=> b!1434890 (=> res!967717 e!809995)))

(assert (=> b!1434890 (= res!967717 (or (= (select (arr!47140 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47140 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47140 a!2831) index!585) (select (arr!47140 a!2831) j!81)) (= (select (store (arr!47140 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434890 e!809992))

(declare-fun res!967712 () Bool)

(assert (=> b!1434890 (=> (not res!967712) (not e!809992))))

(assert (=> b!1434890 (= res!967712 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48419 0))(
  ( (Unit!48420) )
))
(declare-fun lt!631563 () Unit!48419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48419)

(assert (=> b!1434890 (= lt!631563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434891 () Bool)

(declare-fun res!967714 () Bool)

(assert (=> b!1434891 (=> (not res!967714) (not e!809996))))

(assert (=> b!1434891 (= res!967714 (validKeyInArray!0 (select (arr!47140 a!2831) i!982)))))

(declare-fun b!1434892 () Bool)

(declare-fun res!967718 () Bool)

(assert (=> b!1434892 (=> (not res!967718) (not e!809991))))

(assert (=> b!1434892 (= res!967718 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631561 lt!631560 mask!2608) lt!631564))))

(declare-fun b!1434893 () Bool)

(declare-fun res!967715 () Bool)

(assert (=> b!1434893 (=> (not res!967715) (not e!809996))))

(assert (=> b!1434893 (= res!967715 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47691 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47691 a!2831))))))

(declare-fun b!1434894 () Bool)

(declare-fun lt!631562 () (_ BitVec 32))

(assert (=> b!1434894 (= e!809995 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (and (bvsge lt!631562 #b00000000000000000000000000000000) (bvslt lt!631562 (size!47691 a!2831)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434894 (= lt!631562 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(assert (= (and start!123880 res!967710) b!1434884))

(assert (= (and b!1434884 res!967719) b!1434891))

(assert (= (and b!1434891 res!967714) b!1434888))

(assert (= (and b!1434888 res!967709) b!1434885))

(assert (= (and b!1434885 res!967720) b!1434886))

(assert (= (and b!1434886 res!967713) b!1434893))

(assert (= (and b!1434893 res!967715) b!1434882))

(assert (= (and b!1434882 res!967716) b!1434889))

(assert (= (and b!1434889 res!967711) b!1434881))

(assert (= (and b!1434881 res!967707) b!1434892))

(assert (= (and b!1434892 res!967718) b!1434887))

(assert (= (and b!1434887 res!967708) b!1434890))

(assert (= (and b!1434890 res!967712) b!1434883))

(assert (= (and b!1434890 (not res!967717)) b!1434894))

(declare-fun m!1324711 () Bool)

(assert (=> b!1434892 m!1324711))

(declare-fun m!1324713 () Bool)

(assert (=> b!1434888 m!1324713))

(assert (=> b!1434888 m!1324713))

(declare-fun m!1324715 () Bool)

(assert (=> b!1434888 m!1324715))

(assert (=> b!1434881 m!1324713))

(assert (=> b!1434881 m!1324713))

(declare-fun m!1324717 () Bool)

(assert (=> b!1434881 m!1324717))

(declare-fun m!1324719 () Bool)

(assert (=> b!1434885 m!1324719))

(declare-fun m!1324721 () Bool)

(assert (=> b!1434890 m!1324721))

(declare-fun m!1324723 () Bool)

(assert (=> b!1434890 m!1324723))

(declare-fun m!1324725 () Bool)

(assert (=> b!1434890 m!1324725))

(declare-fun m!1324727 () Bool)

(assert (=> b!1434890 m!1324727))

(assert (=> b!1434890 m!1324713))

(declare-fun m!1324729 () Bool)

(assert (=> b!1434890 m!1324729))

(declare-fun m!1324731 () Bool)

(assert (=> b!1434894 m!1324731))

(assert (=> b!1434882 m!1324713))

(assert (=> b!1434882 m!1324713))

(declare-fun m!1324733 () Bool)

(assert (=> b!1434882 m!1324733))

(assert (=> b!1434882 m!1324733))

(assert (=> b!1434882 m!1324713))

(declare-fun m!1324735 () Bool)

(assert (=> b!1434882 m!1324735))

(declare-fun m!1324737 () Bool)

(assert (=> b!1434886 m!1324737))

(assert (=> b!1434883 m!1324713))

(assert (=> b!1434883 m!1324713))

(declare-fun m!1324739 () Bool)

(assert (=> b!1434883 m!1324739))

(declare-fun m!1324741 () Bool)

(assert (=> start!123880 m!1324741))

(declare-fun m!1324743 () Bool)

(assert (=> start!123880 m!1324743))

(declare-fun m!1324745 () Bool)

(assert (=> b!1434889 m!1324745))

(assert (=> b!1434889 m!1324745))

(declare-fun m!1324747 () Bool)

(assert (=> b!1434889 m!1324747))

(assert (=> b!1434889 m!1324721))

(declare-fun m!1324749 () Bool)

(assert (=> b!1434889 m!1324749))

(declare-fun m!1324751 () Bool)

(assert (=> b!1434891 m!1324751))

(assert (=> b!1434891 m!1324751))

(declare-fun m!1324753 () Bool)

(assert (=> b!1434891 m!1324753))

(check-sat (not b!1434881) (not b!1434890) (not b!1434883) (not b!1434892) (not b!1434888) (not b!1434886) (not b!1434882) (not b!1434894) (not b!1434889) (not b!1434885) (not start!123880) (not b!1434891))
(check-sat)
(get-model)

(declare-fun d!154487 () Bool)

(assert (=> d!154487 (= (validKeyInArray!0 (select (arr!47140 a!2831) j!81)) (and (not (= (select (arr!47140 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47140 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434888 d!154487))

(declare-fun b!1434987 () Bool)

(declare-fun e!810039 () Bool)

(declare-fun e!810040 () Bool)

(assert (=> b!1434987 (= e!810039 e!810040)))

(declare-fun c!133096 () Bool)

(assert (=> b!1434987 (= c!133096 (validKeyInArray!0 (select (arr!47140 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434988 () Bool)

(declare-fun call!67578 () Bool)

(assert (=> b!1434988 (= e!810040 call!67578)))

(declare-fun b!1434989 () Bool)

(declare-fun e!810041 () Bool)

(assert (=> b!1434989 (= e!810041 call!67578)))

(declare-fun bm!67575 () Bool)

(assert (=> bm!67575 (= call!67578 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154489 () Bool)

(declare-fun res!967809 () Bool)

(assert (=> d!154489 (=> res!967809 e!810039)))

(assert (=> d!154489 (= res!967809 (bvsge #b00000000000000000000000000000000 (size!47691 a!2831)))))

(assert (=> d!154489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!810039)))

(declare-fun b!1434990 () Bool)

(assert (=> b!1434990 (= e!810040 e!810041)))

(declare-fun lt!631609 () (_ BitVec 64))

(assert (=> b!1434990 (= lt!631609 (select (arr!47140 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631608 () Unit!48419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97676 (_ BitVec 64) (_ BitVec 32)) Unit!48419)

(assert (=> b!1434990 (= lt!631608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631609 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434990 (arrayContainsKey!0 a!2831 lt!631609 #b00000000000000000000000000000000)))

(declare-fun lt!631610 () Unit!48419)

(assert (=> b!1434990 (= lt!631610 lt!631608)))

(declare-fun res!967810 () Bool)

(assert (=> b!1434990 (= res!967810 (= (seekEntryOrOpen!0 (select (arr!47140 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11321 #b00000000000000000000000000000000)))))

(assert (=> b!1434990 (=> (not res!967810) (not e!810041))))

(assert (= (and d!154489 (not res!967809)) b!1434987))

(assert (= (and b!1434987 c!133096) b!1434990))

(assert (= (and b!1434987 (not c!133096)) b!1434988))

(assert (= (and b!1434990 res!967810) b!1434989))

(assert (= (or b!1434989 b!1434988) bm!67575))

(declare-fun m!1324843 () Bool)

(assert (=> b!1434987 m!1324843))

(assert (=> b!1434987 m!1324843))

(declare-fun m!1324845 () Bool)

(assert (=> b!1434987 m!1324845))

(declare-fun m!1324847 () Bool)

(assert (=> bm!67575 m!1324847))

(assert (=> b!1434990 m!1324843))

(declare-fun m!1324849 () Bool)

(assert (=> b!1434990 m!1324849))

(declare-fun m!1324851 () Bool)

(assert (=> b!1434990 m!1324851))

(assert (=> b!1434990 m!1324843))

(declare-fun m!1324853 () Bool)

(assert (=> b!1434990 m!1324853))

(assert (=> b!1434885 d!154489))

(declare-fun b!1435001 () Bool)

(declare-fun e!810050 () Bool)

(declare-fun call!67581 () Bool)

(assert (=> b!1435001 (= e!810050 call!67581)))

(declare-fun b!1435002 () Bool)

(declare-fun e!810052 () Bool)

(declare-fun e!810053 () Bool)

(assert (=> b!1435002 (= e!810052 e!810053)))

(declare-fun res!967818 () Bool)

(assert (=> b!1435002 (=> (not res!967818) (not e!810053))))

(declare-fun e!810051 () Bool)

(assert (=> b!1435002 (= res!967818 (not e!810051))))

(declare-fun res!967817 () Bool)

(assert (=> b!1435002 (=> (not res!967817) (not e!810051))))

(assert (=> b!1435002 (= res!967817 (validKeyInArray!0 (select (arr!47140 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435003 () Bool)

(assert (=> b!1435003 (= e!810053 e!810050)))

(declare-fun c!133099 () Bool)

(assert (=> b!1435003 (= c!133099 (validKeyInArray!0 (select (arr!47140 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67578 () Bool)

(assert (=> bm!67578 (= call!67581 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133099 (Cons!33633 (select (arr!47140 a!2831) #b00000000000000000000000000000000) Nil!33634) Nil!33634)))))

(declare-fun b!1435004 () Bool)

(declare-fun contains!9915 (List!33637 (_ BitVec 64)) Bool)

(assert (=> b!1435004 (= e!810051 (contains!9915 Nil!33634 (select (arr!47140 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435005 () Bool)

(assert (=> b!1435005 (= e!810050 call!67581)))

(declare-fun d!154491 () Bool)

(declare-fun res!967819 () Bool)

(assert (=> d!154491 (=> res!967819 e!810052)))

(assert (=> d!154491 (= res!967819 (bvsge #b00000000000000000000000000000000 (size!47691 a!2831)))))

(assert (=> d!154491 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33634) e!810052)))

(assert (= (and d!154491 (not res!967819)) b!1435002))

(assert (= (and b!1435002 res!967817) b!1435004))

(assert (= (and b!1435002 res!967818) b!1435003))

(assert (= (and b!1435003 c!133099) b!1435001))

(assert (= (and b!1435003 (not c!133099)) b!1435005))

(assert (= (or b!1435001 b!1435005) bm!67578))

(assert (=> b!1435002 m!1324843))

(assert (=> b!1435002 m!1324843))

(assert (=> b!1435002 m!1324845))

(assert (=> b!1435003 m!1324843))

(assert (=> b!1435003 m!1324843))

(assert (=> b!1435003 m!1324845))

(assert (=> bm!67578 m!1324843))

(declare-fun m!1324855 () Bool)

(assert (=> bm!67578 m!1324855))

(assert (=> b!1435004 m!1324843))

(assert (=> b!1435004 m!1324843))

(declare-fun m!1324857 () Bool)

(assert (=> b!1435004 m!1324857))

(assert (=> b!1434886 d!154491))

(declare-fun d!154493 () Bool)

(declare-fun lt!631613 () (_ BitVec 32))

(assert (=> d!154493 (and (bvsge lt!631613 #b00000000000000000000000000000000) (bvslt lt!631613 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154493 (= lt!631613 (choose!52 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(assert (=> d!154493 (validMask!0 mask!2608)))

(assert (=> d!154493 (= (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631613)))

(declare-fun bs!41746 () Bool)

(assert (= bs!41746 d!154493))

(declare-fun m!1324859 () Bool)

(assert (=> bs!41746 m!1324859))

(assert (=> bs!41746 m!1324741))

(assert (=> b!1434894 d!154493))

(declare-fun b!1435018 () Bool)

(declare-fun e!810062 () SeekEntryResult!11321)

(declare-fun lt!631622 () SeekEntryResult!11321)

(assert (=> b!1435018 (= e!810062 (MissingZero!11321 (index!47678 lt!631622)))))

(declare-fun b!1435019 () Bool)

(declare-fun c!133108 () Bool)

(declare-fun lt!631620 () (_ BitVec 64))

(assert (=> b!1435019 (= c!133108 (= lt!631620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810060 () SeekEntryResult!11321)

(assert (=> b!1435019 (= e!810060 e!810062)))

(declare-fun d!154495 () Bool)

(declare-fun lt!631621 () SeekEntryResult!11321)

(get-info :version)

(assert (=> d!154495 (and (or ((_ is Undefined!11321) lt!631621) (not ((_ is Found!11321) lt!631621)) (and (bvsge (index!47677 lt!631621) #b00000000000000000000000000000000) (bvslt (index!47677 lt!631621) (size!47691 a!2831)))) (or ((_ is Undefined!11321) lt!631621) ((_ is Found!11321) lt!631621) (not ((_ is MissingZero!11321) lt!631621)) (and (bvsge (index!47676 lt!631621) #b00000000000000000000000000000000) (bvslt (index!47676 lt!631621) (size!47691 a!2831)))) (or ((_ is Undefined!11321) lt!631621) ((_ is Found!11321) lt!631621) ((_ is MissingZero!11321) lt!631621) (not ((_ is MissingVacant!11321) lt!631621)) (and (bvsge (index!47679 lt!631621) #b00000000000000000000000000000000) (bvslt (index!47679 lt!631621) (size!47691 a!2831)))) (or ((_ is Undefined!11321) lt!631621) (ite ((_ is Found!11321) lt!631621) (= (select (arr!47140 a!2831) (index!47677 lt!631621)) (select (arr!47140 a!2831) j!81)) (ite ((_ is MissingZero!11321) lt!631621) (= (select (arr!47140 a!2831) (index!47676 lt!631621)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11321) lt!631621) (= (select (arr!47140 a!2831) (index!47679 lt!631621)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!810061 () SeekEntryResult!11321)

(assert (=> d!154495 (= lt!631621 e!810061)))

(declare-fun c!133106 () Bool)

(assert (=> d!154495 (= c!133106 (and ((_ is Intermediate!11321) lt!631622) (undefined!12133 lt!631622)))))

(assert (=> d!154495 (= lt!631622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) (select (arr!47140 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154495 (validMask!0 mask!2608)))

(assert (=> d!154495 (= (seekEntryOrOpen!0 (select (arr!47140 a!2831) j!81) a!2831 mask!2608) lt!631621)))

(declare-fun b!1435020 () Bool)

(assert (=> b!1435020 (= e!810061 Undefined!11321)))

(declare-fun b!1435021 () Bool)

(assert (=> b!1435021 (= e!810061 e!810060)))

(assert (=> b!1435021 (= lt!631620 (select (arr!47140 a!2831) (index!47678 lt!631622)))))

(declare-fun c!133107 () Bool)

(assert (=> b!1435021 (= c!133107 (= lt!631620 (select (arr!47140 a!2831) j!81)))))

(declare-fun b!1435022 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97676 (_ BitVec 32)) SeekEntryResult!11321)

(assert (=> b!1435022 (= e!810062 (seekKeyOrZeroReturnVacant!0 (x!129484 lt!631622) (index!47678 lt!631622) (index!47678 lt!631622) (select (arr!47140 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435023 () Bool)

(assert (=> b!1435023 (= e!810060 (Found!11321 (index!47678 lt!631622)))))

(assert (= (and d!154495 c!133106) b!1435020))

(assert (= (and d!154495 (not c!133106)) b!1435021))

(assert (= (and b!1435021 c!133107) b!1435023))

(assert (= (and b!1435021 (not c!133107)) b!1435019))

(assert (= (and b!1435019 c!133108) b!1435018))

(assert (= (and b!1435019 (not c!133108)) b!1435022))

(assert (=> d!154495 m!1324733))

(assert (=> d!154495 m!1324713))

(assert (=> d!154495 m!1324735))

(declare-fun m!1324861 () Bool)

(assert (=> d!154495 m!1324861))

(assert (=> d!154495 m!1324741))

(declare-fun m!1324863 () Bool)

(assert (=> d!154495 m!1324863))

(assert (=> d!154495 m!1324713))

(assert (=> d!154495 m!1324733))

(declare-fun m!1324865 () Bool)

(assert (=> d!154495 m!1324865))

(declare-fun m!1324867 () Bool)

(assert (=> b!1435021 m!1324867))

(assert (=> b!1435022 m!1324713))

(declare-fun m!1324869 () Bool)

(assert (=> b!1435022 m!1324869))

(assert (=> b!1434883 d!154495))

(declare-fun b!1435079 () Bool)

(declare-fun e!810096 () SeekEntryResult!11321)

(declare-fun e!810092 () SeekEntryResult!11321)

(assert (=> b!1435079 (= e!810096 e!810092)))

(declare-fun c!133129 () Bool)

(declare-fun lt!631638 () (_ BitVec 64))

(assert (=> b!1435079 (= c!133129 (or (= lt!631638 lt!631561) (= (bvadd lt!631638 lt!631638) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435080 () Bool)

(assert (=> b!1435080 (= e!810092 (Intermediate!11321 false index!585 x!605))))

(declare-fun b!1435081 () Bool)

(declare-fun e!810094 () Bool)

(declare-fun lt!631637 () SeekEntryResult!11321)

(assert (=> b!1435081 (= e!810094 (bvsge (x!129484 lt!631637) #b01111111111111111111111111111110))))

(declare-fun b!1435082 () Bool)

(declare-fun e!810095 () Bool)

(assert (=> b!1435082 (= e!810094 e!810095)))

(declare-fun res!967836 () Bool)

(assert (=> b!1435082 (= res!967836 (and ((_ is Intermediate!11321) lt!631637) (not (undefined!12133 lt!631637)) (bvslt (x!129484 lt!631637) #b01111111111111111111111111111110) (bvsge (x!129484 lt!631637) #b00000000000000000000000000000000) (bvsge (x!129484 lt!631637) x!605)))))

(assert (=> b!1435082 (=> (not res!967836) (not e!810095))))

(declare-fun b!1435083 () Bool)

(assert (=> b!1435083 (and (bvsge (index!47678 lt!631637) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631637) (size!47691 lt!631560)))))

(declare-fun res!967835 () Bool)

(assert (=> b!1435083 (= res!967835 (= (select (arr!47140 lt!631560) (index!47678 lt!631637)) lt!631561))))

(declare-fun e!810093 () Bool)

(assert (=> b!1435083 (=> res!967835 e!810093)))

(assert (=> b!1435083 (= e!810095 e!810093)))

(declare-fun b!1435085 () Bool)

(assert (=> b!1435085 (= e!810092 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!631561 lt!631560 mask!2608))))

(declare-fun d!154503 () Bool)

(assert (=> d!154503 e!810094))

(declare-fun c!133128 () Bool)

(assert (=> d!154503 (= c!133128 (and ((_ is Intermediate!11321) lt!631637) (undefined!12133 lt!631637)))))

(assert (=> d!154503 (= lt!631637 e!810096)))

(declare-fun c!133130 () Bool)

(assert (=> d!154503 (= c!133130 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154503 (= lt!631638 (select (arr!47140 lt!631560) index!585))))

(assert (=> d!154503 (validMask!0 mask!2608)))

(assert (=> d!154503 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631561 lt!631560 mask!2608) lt!631637)))

(declare-fun b!1435086 () Bool)

(assert (=> b!1435086 (= e!810096 (Intermediate!11321 true index!585 x!605))))

(declare-fun b!1435087 () Bool)

(assert (=> b!1435087 (and (bvsge (index!47678 lt!631637) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631637) (size!47691 lt!631560)))))

(assert (=> b!1435087 (= e!810093 (= (select (arr!47140 lt!631560) (index!47678 lt!631637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435088 () Bool)

(assert (=> b!1435088 (and (bvsge (index!47678 lt!631637) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631637) (size!47691 lt!631560)))))

(declare-fun res!967837 () Bool)

(assert (=> b!1435088 (= res!967837 (= (select (arr!47140 lt!631560) (index!47678 lt!631637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435088 (=> res!967837 e!810093)))

(assert (= (and d!154503 c!133130) b!1435086))

(assert (= (and d!154503 (not c!133130)) b!1435079))

(assert (= (and b!1435079 c!133129) b!1435080))

(assert (= (and b!1435079 (not c!133129)) b!1435085))

(assert (= (and d!154503 c!133128) b!1435081))

(assert (= (and d!154503 (not c!133128)) b!1435082))

(assert (= (and b!1435082 res!967836) b!1435083))

(assert (= (and b!1435083 (not res!967835)) b!1435088))

(assert (= (and b!1435088 (not res!967837)) b!1435087))

(declare-fun m!1324877 () Bool)

(assert (=> b!1435083 m!1324877))

(declare-fun m!1324879 () Bool)

(assert (=> b!1435085 m!1324879))

(assert (=> b!1435085 m!1324879))

(declare-fun m!1324881 () Bool)

(assert (=> b!1435085 m!1324881))

(assert (=> b!1435088 m!1324877))

(declare-fun m!1324883 () Bool)

(assert (=> d!154503 m!1324883))

(assert (=> d!154503 m!1324741))

(assert (=> b!1435087 m!1324877))

(assert (=> b!1434892 d!154503))

(declare-fun b!1435096 () Bool)

(declare-fun e!810107 () SeekEntryResult!11321)

(declare-fun e!810103 () SeekEntryResult!11321)

(assert (=> b!1435096 (= e!810107 e!810103)))

(declare-fun lt!631640 () (_ BitVec 64))

(declare-fun c!133134 () Bool)

(assert (=> b!1435096 (= c!133134 (or (= lt!631640 (select (arr!47140 a!2831) j!81)) (= (bvadd lt!631640 lt!631640) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435097 () Bool)

(assert (=> b!1435097 (= e!810103 (Intermediate!11321 false index!585 x!605))))

(declare-fun b!1435098 () Bool)

(declare-fun e!810105 () Bool)

(declare-fun lt!631639 () SeekEntryResult!11321)

(assert (=> b!1435098 (= e!810105 (bvsge (x!129484 lt!631639) #b01111111111111111111111111111110))))

(declare-fun b!1435099 () Bool)

(declare-fun e!810106 () Bool)

(assert (=> b!1435099 (= e!810105 e!810106)))

(declare-fun res!967845 () Bool)

(assert (=> b!1435099 (= res!967845 (and ((_ is Intermediate!11321) lt!631639) (not (undefined!12133 lt!631639)) (bvslt (x!129484 lt!631639) #b01111111111111111111111111111110) (bvsge (x!129484 lt!631639) #b00000000000000000000000000000000) (bvsge (x!129484 lt!631639) x!605)))))

(assert (=> b!1435099 (=> (not res!967845) (not e!810106))))

(declare-fun b!1435100 () Bool)

(assert (=> b!1435100 (and (bvsge (index!47678 lt!631639) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631639) (size!47691 a!2831)))))

(declare-fun res!967844 () Bool)

(assert (=> b!1435100 (= res!967844 (= (select (arr!47140 a!2831) (index!47678 lt!631639)) (select (arr!47140 a!2831) j!81)))))

(declare-fun e!810104 () Bool)

(assert (=> b!1435100 (=> res!967844 e!810104)))

(assert (=> b!1435100 (= e!810106 e!810104)))

(declare-fun b!1435101 () Bool)

(assert (=> b!1435101 (= e!810103 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47140 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154509 () Bool)

(assert (=> d!154509 e!810105))

(declare-fun c!133133 () Bool)

(assert (=> d!154509 (= c!133133 (and ((_ is Intermediate!11321) lt!631639) (undefined!12133 lt!631639)))))

(assert (=> d!154509 (= lt!631639 e!810107)))

(declare-fun c!133135 () Bool)

(assert (=> d!154509 (= c!133135 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154509 (= lt!631640 (select (arr!47140 a!2831) index!585))))

(assert (=> d!154509 (validMask!0 mask!2608)))

(assert (=> d!154509 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47140 a!2831) j!81) a!2831 mask!2608) lt!631639)))

(declare-fun b!1435102 () Bool)

(assert (=> b!1435102 (= e!810107 (Intermediate!11321 true index!585 x!605))))

(declare-fun b!1435103 () Bool)

(assert (=> b!1435103 (and (bvsge (index!47678 lt!631639) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631639) (size!47691 a!2831)))))

(assert (=> b!1435103 (= e!810104 (= (select (arr!47140 a!2831) (index!47678 lt!631639)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435104 () Bool)

(assert (=> b!1435104 (and (bvsge (index!47678 lt!631639) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631639) (size!47691 a!2831)))))

(declare-fun res!967846 () Bool)

(assert (=> b!1435104 (= res!967846 (= (select (arr!47140 a!2831) (index!47678 lt!631639)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435104 (=> res!967846 e!810104)))

(assert (= (and d!154509 c!133135) b!1435102))

(assert (= (and d!154509 (not c!133135)) b!1435096))

(assert (= (and b!1435096 c!133134) b!1435097))

(assert (= (and b!1435096 (not c!133134)) b!1435101))

(assert (= (and d!154509 c!133133) b!1435098))

(assert (= (and d!154509 (not c!133133)) b!1435099))

(assert (= (and b!1435099 res!967845) b!1435100))

(assert (= (and b!1435100 (not res!967844)) b!1435104))

(assert (= (and b!1435104 (not res!967846)) b!1435103))

(declare-fun m!1324885 () Bool)

(assert (=> b!1435100 m!1324885))

(assert (=> b!1435101 m!1324879))

(assert (=> b!1435101 m!1324879))

(assert (=> b!1435101 m!1324713))

(declare-fun m!1324887 () Bool)

(assert (=> b!1435101 m!1324887))

(assert (=> b!1435104 m!1324885))

(assert (=> d!154509 m!1324725))

(assert (=> d!154509 m!1324741))

(assert (=> b!1435103 m!1324885))

(assert (=> b!1434881 d!154509))

(declare-fun b!1435105 () Bool)

(declare-fun e!810112 () SeekEntryResult!11321)

(declare-fun e!810108 () SeekEntryResult!11321)

(assert (=> b!1435105 (= e!810112 e!810108)))

(declare-fun lt!631642 () (_ BitVec 64))

(declare-fun c!133137 () Bool)

(assert (=> b!1435105 (= c!133137 (or (= lt!631642 (select (arr!47140 a!2831) j!81)) (= (bvadd lt!631642 lt!631642) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435106 () Bool)

(assert (=> b!1435106 (= e!810108 (Intermediate!11321 false (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435107 () Bool)

(declare-fun e!810110 () Bool)

(declare-fun lt!631641 () SeekEntryResult!11321)

(assert (=> b!1435107 (= e!810110 (bvsge (x!129484 lt!631641) #b01111111111111111111111111111110))))

(declare-fun b!1435108 () Bool)

(declare-fun e!810111 () Bool)

(assert (=> b!1435108 (= e!810110 e!810111)))

(declare-fun res!967848 () Bool)

(assert (=> b!1435108 (= res!967848 (and ((_ is Intermediate!11321) lt!631641) (not (undefined!12133 lt!631641)) (bvslt (x!129484 lt!631641) #b01111111111111111111111111111110) (bvsge (x!129484 lt!631641) #b00000000000000000000000000000000) (bvsge (x!129484 lt!631641) #b00000000000000000000000000000000)))))

(assert (=> b!1435108 (=> (not res!967848) (not e!810111))))

(declare-fun b!1435109 () Bool)

(assert (=> b!1435109 (and (bvsge (index!47678 lt!631641) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631641) (size!47691 a!2831)))))

(declare-fun res!967847 () Bool)

(assert (=> b!1435109 (= res!967847 (= (select (arr!47140 a!2831) (index!47678 lt!631641)) (select (arr!47140 a!2831) j!81)))))

(declare-fun e!810109 () Bool)

(assert (=> b!1435109 (=> res!967847 e!810109)))

(assert (=> b!1435109 (= e!810111 e!810109)))

(declare-fun b!1435110 () Bool)

(assert (=> b!1435110 (= e!810108 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47140 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154511 () Bool)

(assert (=> d!154511 e!810110))

(declare-fun c!133136 () Bool)

(assert (=> d!154511 (= c!133136 (and ((_ is Intermediate!11321) lt!631641) (undefined!12133 lt!631641)))))

(assert (=> d!154511 (= lt!631641 e!810112)))

(declare-fun c!133138 () Bool)

(assert (=> d!154511 (= c!133138 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154511 (= lt!631642 (select (arr!47140 a!2831) (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608)))))

(assert (=> d!154511 (validMask!0 mask!2608)))

(assert (=> d!154511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) (select (arr!47140 a!2831) j!81) a!2831 mask!2608) lt!631641)))

(declare-fun b!1435111 () Bool)

(assert (=> b!1435111 (= e!810112 (Intermediate!11321 true (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435112 () Bool)

(assert (=> b!1435112 (and (bvsge (index!47678 lt!631641) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631641) (size!47691 a!2831)))))

(assert (=> b!1435112 (= e!810109 (= (select (arr!47140 a!2831) (index!47678 lt!631641)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435113 () Bool)

(assert (=> b!1435113 (and (bvsge (index!47678 lt!631641) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631641) (size!47691 a!2831)))))

(declare-fun res!967849 () Bool)

(assert (=> b!1435113 (= res!967849 (= (select (arr!47140 a!2831) (index!47678 lt!631641)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435113 (=> res!967849 e!810109)))

(assert (= (and d!154511 c!133138) b!1435111))

(assert (= (and d!154511 (not c!133138)) b!1435105))

(assert (= (and b!1435105 c!133137) b!1435106))

(assert (= (and b!1435105 (not c!133137)) b!1435110))

(assert (= (and d!154511 c!133136) b!1435107))

(assert (= (and d!154511 (not c!133136)) b!1435108))

(assert (= (and b!1435108 res!967848) b!1435109))

(assert (= (and b!1435109 (not res!967847)) b!1435113))

(assert (= (and b!1435113 (not res!967849)) b!1435112))

(declare-fun m!1324889 () Bool)

(assert (=> b!1435109 m!1324889))

(assert (=> b!1435110 m!1324733))

(declare-fun m!1324891 () Bool)

(assert (=> b!1435110 m!1324891))

(assert (=> b!1435110 m!1324891))

(assert (=> b!1435110 m!1324713))

(declare-fun m!1324893 () Bool)

(assert (=> b!1435110 m!1324893))

(assert (=> b!1435113 m!1324889))

(assert (=> d!154511 m!1324733))

(declare-fun m!1324895 () Bool)

(assert (=> d!154511 m!1324895))

(assert (=> d!154511 m!1324741))

(assert (=> b!1435112 m!1324889))

(assert (=> b!1434882 d!154511))

(declare-fun d!154513 () Bool)

(declare-fun lt!631659 () (_ BitVec 32))

(declare-fun lt!631658 () (_ BitVec 32))

(assert (=> d!154513 (= lt!631659 (bvmul (bvxor lt!631658 (bvlshr lt!631658 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154513 (= lt!631658 ((_ extract 31 0) (bvand (bvxor (select (arr!47140 a!2831) j!81) (bvlshr (select (arr!47140 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154513 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967852 (let ((h!34973 ((_ extract 31 0) (bvand (bvxor (select (arr!47140 a!2831) j!81) (bvlshr (select (arr!47140 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129491 (bvmul (bvxor h!34973 (bvlshr h!34973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129491 (bvlshr x!129491 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967852 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967852 #b00000000000000000000000000000000))))))

(assert (=> d!154513 (= (toIndex!0 (select (arr!47140 a!2831) j!81) mask!2608) (bvand (bvxor lt!631659 (bvlshr lt!631659 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434882 d!154513))

(declare-fun d!154521 () Bool)

(assert (=> d!154521 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123880 d!154521))

(declare-fun d!154531 () Bool)

(assert (=> d!154531 (= (array_inv!36421 a!2831) (bvsge (size!47691 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123880 d!154531))

(declare-fun d!154537 () Bool)

(assert (=> d!154537 (= (validKeyInArray!0 (select (arr!47140 a!2831) i!982)) (and (not (= (select (arr!47140 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47140 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434891 d!154537))

(declare-fun b!1435154 () Bool)

(declare-fun e!810146 () SeekEntryResult!11321)

(declare-fun e!810142 () SeekEntryResult!11321)

(assert (=> b!1435154 (= e!810146 e!810142)))

(declare-fun c!133150 () Bool)

(declare-fun lt!631667 () (_ BitVec 64))

(assert (=> b!1435154 (= c!133150 (or (= lt!631667 lt!631561) (= (bvadd lt!631667 lt!631667) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435155 () Bool)

(assert (=> b!1435155 (= e!810142 (Intermediate!11321 false (toIndex!0 lt!631561 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435156 () Bool)

(declare-fun e!810144 () Bool)

(declare-fun lt!631666 () SeekEntryResult!11321)

(assert (=> b!1435156 (= e!810144 (bvsge (x!129484 lt!631666) #b01111111111111111111111111111110))))

(declare-fun b!1435157 () Bool)

(declare-fun e!810145 () Bool)

(assert (=> b!1435157 (= e!810144 e!810145)))

(declare-fun res!967872 () Bool)

(assert (=> b!1435157 (= res!967872 (and ((_ is Intermediate!11321) lt!631666) (not (undefined!12133 lt!631666)) (bvslt (x!129484 lt!631666) #b01111111111111111111111111111110) (bvsge (x!129484 lt!631666) #b00000000000000000000000000000000) (bvsge (x!129484 lt!631666) #b00000000000000000000000000000000)))))

(assert (=> b!1435157 (=> (not res!967872) (not e!810145))))

(declare-fun b!1435158 () Bool)

(assert (=> b!1435158 (and (bvsge (index!47678 lt!631666) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631666) (size!47691 lt!631560)))))

(declare-fun res!967871 () Bool)

(assert (=> b!1435158 (= res!967871 (= (select (arr!47140 lt!631560) (index!47678 lt!631666)) lt!631561))))

(declare-fun e!810143 () Bool)

(assert (=> b!1435158 (=> res!967871 e!810143)))

(assert (=> b!1435158 (= e!810145 e!810143)))

(declare-fun b!1435159 () Bool)

(assert (=> b!1435159 (= e!810142 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631561 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!631561 lt!631560 mask!2608))))

(declare-fun d!154539 () Bool)

(assert (=> d!154539 e!810144))

(declare-fun c!133149 () Bool)

(assert (=> d!154539 (= c!133149 (and ((_ is Intermediate!11321) lt!631666) (undefined!12133 lt!631666)))))

(assert (=> d!154539 (= lt!631666 e!810146)))

(declare-fun c!133151 () Bool)

(assert (=> d!154539 (= c!133151 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154539 (= lt!631667 (select (arr!47140 lt!631560) (toIndex!0 lt!631561 mask!2608)))))

(assert (=> d!154539 (validMask!0 mask!2608)))

(assert (=> d!154539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631561 mask!2608) lt!631561 lt!631560 mask!2608) lt!631666)))

(declare-fun b!1435160 () Bool)

(assert (=> b!1435160 (= e!810146 (Intermediate!11321 true (toIndex!0 lt!631561 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435161 () Bool)

(assert (=> b!1435161 (and (bvsge (index!47678 lt!631666) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631666) (size!47691 lt!631560)))))

(assert (=> b!1435161 (= e!810143 (= (select (arr!47140 lt!631560) (index!47678 lt!631666)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435162 () Bool)

(assert (=> b!1435162 (and (bvsge (index!47678 lt!631666) #b00000000000000000000000000000000) (bvslt (index!47678 lt!631666) (size!47691 lt!631560)))))

(declare-fun res!967873 () Bool)

(assert (=> b!1435162 (= res!967873 (= (select (arr!47140 lt!631560) (index!47678 lt!631666)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435162 (=> res!967873 e!810143)))

(assert (= (and d!154539 c!133151) b!1435160))

(assert (= (and d!154539 (not c!133151)) b!1435154))

(assert (= (and b!1435154 c!133150) b!1435155))

(assert (= (and b!1435154 (not c!133150)) b!1435159))

(assert (= (and d!154539 c!133149) b!1435156))

(assert (= (and d!154539 (not c!133149)) b!1435157))

(assert (= (and b!1435157 res!967872) b!1435158))

(assert (= (and b!1435158 (not res!967871)) b!1435162))

(assert (= (and b!1435162 (not res!967873)) b!1435161))

(declare-fun m!1324927 () Bool)

(assert (=> b!1435158 m!1324927))

(assert (=> b!1435159 m!1324745))

(declare-fun m!1324929 () Bool)

(assert (=> b!1435159 m!1324929))

(assert (=> b!1435159 m!1324929))

(declare-fun m!1324931 () Bool)

(assert (=> b!1435159 m!1324931))

(assert (=> b!1435162 m!1324927))

(assert (=> d!154539 m!1324745))

(declare-fun m!1324933 () Bool)

(assert (=> d!154539 m!1324933))

(assert (=> d!154539 m!1324741))

(assert (=> b!1435161 m!1324927))

(assert (=> b!1434889 d!154539))

(declare-fun d!154541 () Bool)

(declare-fun lt!631671 () (_ BitVec 32))

(declare-fun lt!631670 () (_ BitVec 32))

(assert (=> d!154541 (= lt!631671 (bvmul (bvxor lt!631670 (bvlshr lt!631670 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154541 (= lt!631670 ((_ extract 31 0) (bvand (bvxor lt!631561 (bvlshr lt!631561 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154541 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967852 (let ((h!34973 ((_ extract 31 0) (bvand (bvxor lt!631561 (bvlshr lt!631561 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129491 (bvmul (bvxor h!34973 (bvlshr h!34973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129491 (bvlshr x!129491 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967852 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967852 #b00000000000000000000000000000000))))))

(assert (=> d!154541 (= (toIndex!0 lt!631561 mask!2608) (bvand (bvxor lt!631671 (bvlshr lt!631671 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434889 d!154541))

(declare-fun b!1435163 () Bool)

(declare-fun e!810147 () Bool)

(declare-fun e!810148 () Bool)

(assert (=> b!1435163 (= e!810147 e!810148)))

(declare-fun c!133152 () Bool)

(assert (=> b!1435163 (= c!133152 (validKeyInArray!0 (select (arr!47140 a!2831) j!81)))))

(declare-fun b!1435164 () Bool)

(declare-fun call!67589 () Bool)

(assert (=> b!1435164 (= e!810148 call!67589)))

(declare-fun b!1435165 () Bool)

(declare-fun e!810149 () Bool)

(assert (=> b!1435165 (= e!810149 call!67589)))

(declare-fun bm!67586 () Bool)

(assert (=> bm!67586 (= call!67589 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154543 () Bool)

(declare-fun res!967874 () Bool)

(assert (=> d!154543 (=> res!967874 e!810147)))

(assert (=> d!154543 (= res!967874 (bvsge j!81 (size!47691 a!2831)))))

(assert (=> d!154543 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!810147)))

(declare-fun b!1435166 () Bool)

(assert (=> b!1435166 (= e!810148 e!810149)))

(declare-fun lt!631673 () (_ BitVec 64))

(assert (=> b!1435166 (= lt!631673 (select (arr!47140 a!2831) j!81))))

(declare-fun lt!631672 () Unit!48419)

(assert (=> b!1435166 (= lt!631672 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631673 j!81))))

(assert (=> b!1435166 (arrayContainsKey!0 a!2831 lt!631673 #b00000000000000000000000000000000)))

(declare-fun lt!631674 () Unit!48419)

(assert (=> b!1435166 (= lt!631674 lt!631672)))

(declare-fun res!967875 () Bool)

(assert (=> b!1435166 (= res!967875 (= (seekEntryOrOpen!0 (select (arr!47140 a!2831) j!81) a!2831 mask!2608) (Found!11321 j!81)))))

(assert (=> b!1435166 (=> (not res!967875) (not e!810149))))

(assert (= (and d!154543 (not res!967874)) b!1435163))

(assert (= (and b!1435163 c!133152) b!1435166))

(assert (= (and b!1435163 (not c!133152)) b!1435164))

(assert (= (and b!1435166 res!967875) b!1435165))

(assert (= (or b!1435165 b!1435164) bm!67586))

(assert (=> b!1435163 m!1324713))

(assert (=> b!1435163 m!1324713))

(assert (=> b!1435163 m!1324715))

(declare-fun m!1324937 () Bool)

(assert (=> bm!67586 m!1324937))

(assert (=> b!1435166 m!1324713))

(declare-fun m!1324939 () Bool)

(assert (=> b!1435166 m!1324939))

(declare-fun m!1324941 () Bool)

(assert (=> b!1435166 m!1324941))

(assert (=> b!1435166 m!1324713))

(assert (=> b!1435166 m!1324739))

(assert (=> b!1434890 d!154543))

(declare-fun d!154547 () Bool)

(assert (=> d!154547 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631682 () Unit!48419)

(declare-fun choose!38 (array!97676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48419)

(assert (=> d!154547 (= lt!631682 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154547 (validMask!0 mask!2608)))

(assert (=> d!154547 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631682)))

(declare-fun bs!41749 () Bool)

(assert (= bs!41749 d!154547))

(assert (=> bs!41749 m!1324727))

(declare-fun m!1324957 () Bool)

(assert (=> bs!41749 m!1324957))

(assert (=> bs!41749 m!1324741))

(assert (=> b!1434890 d!154547))

(check-sat (not b!1435101) (not b!1435003) (not bm!67586) (not d!154495) (not b!1435163) (not b!1434987) (not bm!67578) (not d!154547) (not b!1434990) (not b!1435159) (not d!154511) (not b!1435110) (not b!1435002) (not d!154509) (not b!1435022) (not b!1435004) (not b!1435085) (not d!154493) (not d!154503) (not bm!67575) (not b!1435166) (not d!154539))
(check-sat)
