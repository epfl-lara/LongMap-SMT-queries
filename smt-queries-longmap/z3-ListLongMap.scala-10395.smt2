; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122444 () Bool)

(assert start!122444)

(declare-fun b!1418759 () Bool)

(declare-fun e!802807 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418759 (= e!802807 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1418760 () Bool)

(declare-fun res!954424 () Bool)

(assert (=> b!1418760 (=> (not res!954424) (not e!802807))))

(declare-datatypes ((array!96840 0))(
  ( (array!96841 (arr!46741 (Array (_ BitVec 32) (_ BitVec 64))) (size!47293 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96840)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96840 (_ BitVec 32)) Bool)

(assert (=> b!1418760 (= res!954424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418761 () Bool)

(declare-fun res!954420 () Bool)

(assert (=> b!1418761 (=> (not res!954420) (not e!802807))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418761 (= res!954420 (and (= (size!47293 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47293 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47293 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418762 () Bool)

(declare-fun res!954418 () Bool)

(assert (=> b!1418762 (=> (not res!954418) (not e!802807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418762 (= res!954418 (validKeyInArray!0 (select (arr!46741 a!2831) i!982)))))

(declare-fun b!1418763 () Bool)

(declare-fun res!954419 () Bool)

(assert (=> b!1418763 (=> (not res!954419) (not e!802807))))

(assert (=> b!1418763 (= res!954419 (validKeyInArray!0 (select (arr!46741 a!2831) j!81)))))

(declare-fun b!1418765 () Bool)

(declare-fun res!954421 () Bool)

(assert (=> b!1418765 (=> (not res!954421) (not e!802807))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11053 0))(
  ( (MissingZero!11053 (index!46604 (_ BitVec 32))) (Found!11053 (index!46605 (_ BitVec 32))) (Intermediate!11053 (undefined!11865 Bool) (index!46606 (_ BitVec 32)) (x!128264 (_ BitVec 32))) (Undefined!11053) (MissingVacant!11053 (index!46607 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96840 (_ BitVec 32)) SeekEntryResult!11053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418765 (= res!954421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608) (select (arr!46741 a!2831) j!81) a!2831 mask!2608) (Intermediate!11053 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418766 () Bool)

(declare-fun res!954422 () Bool)

(assert (=> b!1418766 (=> (not res!954422) (not e!802807))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418766 (= res!954422 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47293 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47293 a!2831))))))

(declare-fun b!1418764 () Bool)

(declare-fun res!954423 () Bool)

(assert (=> b!1418764 (=> (not res!954423) (not e!802807))))

(declare-datatypes ((List!33329 0))(
  ( (Nil!33326) (Cons!33325 (h!34621 (_ BitVec 64)) (t!48015 List!33329)) )
))
(declare-fun arrayNoDuplicates!0 (array!96840 (_ BitVec 32) List!33329) Bool)

(assert (=> b!1418764 (= res!954423 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33326))))

(declare-fun res!954417 () Bool)

(assert (=> start!122444 (=> (not res!954417) (not e!802807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122444 (= res!954417 (validMask!0 mask!2608))))

(assert (=> start!122444 e!802807))

(assert (=> start!122444 true))

(declare-fun array_inv!35974 (array!96840) Bool)

(assert (=> start!122444 (array_inv!35974 a!2831)))

(assert (= (and start!122444 res!954417) b!1418761))

(assert (= (and b!1418761 res!954420) b!1418762))

(assert (= (and b!1418762 res!954418) b!1418763))

(assert (= (and b!1418763 res!954419) b!1418760))

(assert (= (and b!1418760 res!954424) b!1418764))

(assert (= (and b!1418764 res!954423) b!1418766))

(assert (= (and b!1418766 res!954422) b!1418765))

(assert (= (and b!1418765 res!954421) b!1418759))

(declare-fun m!1308899 () Bool)

(assert (=> b!1418760 m!1308899))

(declare-fun m!1308901 () Bool)

(assert (=> start!122444 m!1308901))

(declare-fun m!1308903 () Bool)

(assert (=> start!122444 m!1308903))

(declare-fun m!1308905 () Bool)

(assert (=> b!1418763 m!1308905))

(assert (=> b!1418763 m!1308905))

(declare-fun m!1308907 () Bool)

(assert (=> b!1418763 m!1308907))

(assert (=> b!1418765 m!1308905))

(assert (=> b!1418765 m!1308905))

(declare-fun m!1308909 () Bool)

(assert (=> b!1418765 m!1308909))

(assert (=> b!1418765 m!1308909))

(assert (=> b!1418765 m!1308905))

(declare-fun m!1308911 () Bool)

(assert (=> b!1418765 m!1308911))

(declare-fun m!1308913 () Bool)

(assert (=> b!1418764 m!1308913))

(declare-fun m!1308915 () Bool)

(assert (=> b!1418762 m!1308915))

(assert (=> b!1418762 m!1308915))

(declare-fun m!1308917 () Bool)

(assert (=> b!1418762 m!1308917))

(check-sat (not b!1418763) (not start!122444) (not b!1418762) (not b!1418765) (not b!1418764) (not b!1418760))
(check-sat)
(get-model)

(declare-fun b!1418825 () Bool)

(declare-fun e!802829 () Bool)

(declare-fun contains!9804 (List!33329 (_ BitVec 64)) Bool)

(assert (=> b!1418825 (= e!802829 (contains!9804 Nil!33326 (select (arr!46741 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418826 () Bool)

(declare-fun e!802831 () Bool)

(declare-fun call!67268 () Bool)

(assert (=> b!1418826 (= e!802831 call!67268)))

(declare-fun bm!67265 () Bool)

(declare-fun c!131659 () Bool)

(assert (=> bm!67265 (= call!67268 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131659 (Cons!33325 (select (arr!46741 a!2831) #b00000000000000000000000000000000) Nil!33326) Nil!33326)))))

(declare-fun b!1418827 () Bool)

(assert (=> b!1418827 (= e!802831 call!67268)))

(declare-fun b!1418828 () Bool)

(declare-fun e!802830 () Bool)

(declare-fun e!802832 () Bool)

(assert (=> b!1418828 (= e!802830 e!802832)))

(declare-fun res!954479 () Bool)

(assert (=> b!1418828 (=> (not res!954479) (not e!802832))))

(assert (=> b!1418828 (= res!954479 (not e!802829))))

(declare-fun res!954480 () Bool)

(assert (=> b!1418828 (=> (not res!954480) (not e!802829))))

(assert (=> b!1418828 (= res!954480 (validKeyInArray!0 (select (arr!46741 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152803 () Bool)

(declare-fun res!954481 () Bool)

(assert (=> d!152803 (=> res!954481 e!802830)))

(assert (=> d!152803 (= res!954481 (bvsge #b00000000000000000000000000000000 (size!47293 a!2831)))))

(assert (=> d!152803 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33326) e!802830)))

(declare-fun b!1418829 () Bool)

(assert (=> b!1418829 (= e!802832 e!802831)))

(assert (=> b!1418829 (= c!131659 (validKeyInArray!0 (select (arr!46741 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152803 (not res!954481)) b!1418828))

(assert (= (and b!1418828 res!954480) b!1418825))

(assert (= (and b!1418828 res!954479) b!1418829))

(assert (= (and b!1418829 c!131659) b!1418827))

(assert (= (and b!1418829 (not c!131659)) b!1418826))

(assert (= (or b!1418827 b!1418826) bm!67265))

(declare-fun m!1308959 () Bool)

(assert (=> b!1418825 m!1308959))

(assert (=> b!1418825 m!1308959))

(declare-fun m!1308961 () Bool)

(assert (=> b!1418825 m!1308961))

(assert (=> bm!67265 m!1308959))

(declare-fun m!1308963 () Bool)

(assert (=> bm!67265 m!1308963))

(assert (=> b!1418828 m!1308959))

(assert (=> b!1418828 m!1308959))

(declare-fun m!1308965 () Bool)

(assert (=> b!1418828 m!1308965))

(assert (=> b!1418829 m!1308959))

(assert (=> b!1418829 m!1308959))

(assert (=> b!1418829 m!1308965))

(assert (=> b!1418764 d!152803))

(declare-fun d!152805 () Bool)

(assert (=> d!152805 (= (validKeyInArray!0 (select (arr!46741 a!2831) j!81)) (and (not (= (select (arr!46741 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46741 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418763 d!152805))

(declare-fun d!152807 () Bool)

(assert (=> d!152807 (= (validKeyInArray!0 (select (arr!46741 a!2831) i!982)) (and (not (= (select (arr!46741 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46741 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418762 d!152807))

(declare-fun d!152809 () Bool)

(assert (=> d!152809 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122444 d!152809))

(declare-fun d!152815 () Bool)

(assert (=> d!152815 (= (array_inv!35974 a!2831) (bvsge (size!47293 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122444 d!152815))

(declare-fun bm!67268 () Bool)

(declare-fun call!67271 () Bool)

(assert (=> bm!67268 (= call!67271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418838 () Bool)

(declare-fun e!802839 () Bool)

(declare-fun e!802841 () Bool)

(assert (=> b!1418838 (= e!802839 e!802841)))

(declare-fun c!131662 () Bool)

(assert (=> b!1418838 (= c!131662 (validKeyInArray!0 (select (arr!46741 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418839 () Bool)

(declare-fun e!802840 () Bool)

(assert (=> b!1418839 (= e!802841 e!802840)))

(declare-fun lt!625477 () (_ BitVec 64))

(assert (=> b!1418839 (= lt!625477 (select (arr!46741 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47917 0))(
  ( (Unit!47918) )
))
(declare-fun lt!625478 () Unit!47917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96840 (_ BitVec 64) (_ BitVec 32)) Unit!47917)

(assert (=> b!1418839 (= lt!625478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625477 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418839 (arrayContainsKey!0 a!2831 lt!625477 #b00000000000000000000000000000000)))

(declare-fun lt!625476 () Unit!47917)

(assert (=> b!1418839 (= lt!625476 lt!625478)))

(declare-fun res!954487 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96840 (_ BitVec 32)) SeekEntryResult!11053)

(assert (=> b!1418839 (= res!954487 (= (seekEntryOrOpen!0 (select (arr!46741 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11053 #b00000000000000000000000000000000)))))

(assert (=> b!1418839 (=> (not res!954487) (not e!802840))))

(declare-fun b!1418840 () Bool)

(assert (=> b!1418840 (= e!802840 call!67271)))

(declare-fun d!152817 () Bool)

(declare-fun res!954486 () Bool)

(assert (=> d!152817 (=> res!954486 e!802839)))

(assert (=> d!152817 (= res!954486 (bvsge #b00000000000000000000000000000000 (size!47293 a!2831)))))

(assert (=> d!152817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802839)))

(declare-fun b!1418841 () Bool)

(assert (=> b!1418841 (= e!802841 call!67271)))

(assert (= (and d!152817 (not res!954486)) b!1418838))

(assert (= (and b!1418838 c!131662) b!1418839))

(assert (= (and b!1418838 (not c!131662)) b!1418841))

(assert (= (and b!1418839 res!954487) b!1418840))

(assert (= (or b!1418840 b!1418841) bm!67268))

(declare-fun m!1308967 () Bool)

(assert (=> bm!67268 m!1308967))

(assert (=> b!1418838 m!1308959))

(assert (=> b!1418838 m!1308959))

(assert (=> b!1418838 m!1308965))

(assert (=> b!1418839 m!1308959))

(declare-fun m!1308969 () Bool)

(assert (=> b!1418839 m!1308969))

(declare-fun m!1308971 () Bool)

(assert (=> b!1418839 m!1308971))

(assert (=> b!1418839 m!1308959))

(declare-fun m!1308973 () Bool)

(assert (=> b!1418839 m!1308973))

(assert (=> b!1418760 d!152817))

(declare-fun b!1418890 () Bool)

(declare-fun e!802875 () Bool)

(declare-fun e!802872 () Bool)

(assert (=> b!1418890 (= e!802875 e!802872)))

(declare-fun res!954507 () Bool)

(declare-fun lt!625497 () SeekEntryResult!11053)

(get-info :version)

(assert (=> b!1418890 (= res!954507 (and ((_ is Intermediate!11053) lt!625497) (not (undefined!11865 lt!625497)) (bvslt (x!128264 lt!625497) #b01111111111111111111111111111110) (bvsge (x!128264 lt!625497) #b00000000000000000000000000000000) (bvsge (x!128264 lt!625497) #b00000000000000000000000000000000)))))

(assert (=> b!1418890 (=> (not res!954507) (not e!802872))))

(declare-fun b!1418891 () Bool)

(assert (=> b!1418891 (and (bvsge (index!46606 lt!625497) #b00000000000000000000000000000000) (bvslt (index!46606 lt!625497) (size!47293 a!2831)))))

(declare-fun res!954506 () Bool)

(assert (=> b!1418891 (= res!954506 (= (select (arr!46741 a!2831) (index!46606 lt!625497)) (select (arr!46741 a!2831) j!81)))))

(declare-fun e!802873 () Bool)

(assert (=> b!1418891 (=> res!954506 e!802873)))

(assert (=> b!1418891 (= e!802872 e!802873)))

(declare-fun e!802874 () SeekEntryResult!11053)

(declare-fun b!1418892 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418892 (= e!802874 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46741 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1418893 () Bool)

(assert (=> b!1418893 (and (bvsge (index!46606 lt!625497) #b00000000000000000000000000000000) (bvslt (index!46606 lt!625497) (size!47293 a!2831)))))

(assert (=> b!1418893 (= e!802873 (= (select (arr!46741 a!2831) (index!46606 lt!625497)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1418894 () Bool)

(assert (=> b!1418894 (= e!802874 (Intermediate!11053 false (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1418895 () Bool)

(declare-fun e!802871 () SeekEntryResult!11053)

(assert (=> b!1418895 (= e!802871 (Intermediate!11053 true (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1418896 () Bool)

(assert (=> b!1418896 (= e!802871 e!802874)))

(declare-fun c!131679 () Bool)

(declare-fun lt!625496 () (_ BitVec 64))

(assert (=> b!1418896 (= c!131679 (or (= lt!625496 (select (arr!46741 a!2831) j!81)) (= (bvadd lt!625496 lt!625496) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1418897 () Bool)

(assert (=> b!1418897 (= e!802875 (bvsge (x!128264 lt!625497) #b01111111111111111111111111111110))))

(declare-fun b!1418898 () Bool)

(assert (=> b!1418898 (and (bvsge (index!46606 lt!625497) #b00000000000000000000000000000000) (bvslt (index!46606 lt!625497) (size!47293 a!2831)))))

(declare-fun res!954508 () Bool)

(assert (=> b!1418898 (= res!954508 (= (select (arr!46741 a!2831) (index!46606 lt!625497)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1418898 (=> res!954508 e!802873)))

(declare-fun d!152825 () Bool)

(assert (=> d!152825 e!802875))

(declare-fun c!131680 () Bool)

(assert (=> d!152825 (= c!131680 (and ((_ is Intermediate!11053) lt!625497) (undefined!11865 lt!625497)))))

(assert (=> d!152825 (= lt!625497 e!802871)))

(declare-fun c!131678 () Bool)

(assert (=> d!152825 (= c!131678 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152825 (= lt!625496 (select (arr!46741 a!2831) (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608)))))

(assert (=> d!152825 (validMask!0 mask!2608)))

(assert (=> d!152825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608) (select (arr!46741 a!2831) j!81) a!2831 mask!2608) lt!625497)))

(assert (= (and d!152825 c!131678) b!1418895))

(assert (= (and d!152825 (not c!131678)) b!1418896))

(assert (= (and b!1418896 c!131679) b!1418894))

(assert (= (and b!1418896 (not c!131679)) b!1418892))

(assert (= (and d!152825 c!131680) b!1418897))

(assert (= (and d!152825 (not c!131680)) b!1418890))

(assert (= (and b!1418890 res!954507) b!1418891))

(assert (= (and b!1418891 (not res!954506)) b!1418898))

(assert (= (and b!1418898 (not res!954508)) b!1418893))

(assert (=> d!152825 m!1308909))

(declare-fun m!1308987 () Bool)

(assert (=> d!152825 m!1308987))

(assert (=> d!152825 m!1308901))

(declare-fun m!1308989 () Bool)

(assert (=> b!1418891 m!1308989))

(assert (=> b!1418898 m!1308989))

(assert (=> b!1418892 m!1308909))

(declare-fun m!1308991 () Bool)

(assert (=> b!1418892 m!1308991))

(assert (=> b!1418892 m!1308991))

(assert (=> b!1418892 m!1308905))

(declare-fun m!1308993 () Bool)

(assert (=> b!1418892 m!1308993))

(assert (=> b!1418893 m!1308989))

(assert (=> b!1418765 d!152825))

(declare-fun d!152829 () Bool)

(declare-fun lt!625505 () (_ BitVec 32))

(declare-fun lt!625504 () (_ BitVec 32))

(assert (=> d!152829 (= lt!625505 (bvmul (bvxor lt!625504 (bvlshr lt!625504 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152829 (= lt!625504 ((_ extract 31 0) (bvand (bvxor (select (arr!46741 a!2831) j!81) (bvlshr (select (arr!46741 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152829 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954509 (let ((h!34624 ((_ extract 31 0) (bvand (bvxor (select (arr!46741 a!2831) j!81) (bvlshr (select (arr!46741 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128269 (bvmul (bvxor h!34624 (bvlshr h!34624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128269 (bvlshr x!128269 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954509 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954509 #b00000000000000000000000000000000))))))

(assert (=> d!152829 (= (toIndex!0 (select (arr!46741 a!2831) j!81) mask!2608) (bvand (bvxor lt!625505 (bvlshr lt!625505 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418765 d!152829))

(check-sat (not b!1418839) (not d!152825) (not b!1418892) (not b!1418838) (not b!1418825) (not b!1418828) (not bm!67265) (not bm!67268) (not b!1418829))
(check-sat)
