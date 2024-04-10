; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123576 () Bool)

(assert start!123576)

(declare-fun b!1432949 () Bool)

(declare-fun res!966817 () Bool)

(declare-fun e!808821 () Bool)

(assert (=> b!1432949 (=> (not res!966817) (not e!808821))))

(declare-datatypes ((array!97548 0))(
  ( (array!97549 (arr!47081 (Array (_ BitVec 32) (_ BitVec 64))) (size!47631 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97548)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432949 (= res!966817 (validKeyInArray!0 (select (arr!47081 a!2831) j!81)))))

(declare-fun b!1432950 () Bool)

(declare-fun res!966826 () Bool)

(assert (=> b!1432950 (=> (not res!966826) (not e!808821))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432950 (= res!966826 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47631 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47631 a!2831))))))

(declare-fun b!1432951 () Bool)

(declare-fun e!808823 () Bool)

(declare-fun e!808818 () Bool)

(assert (=> b!1432951 (= e!808823 (not e!808818))))

(declare-fun res!966814 () Bool)

(assert (=> b!1432951 (=> res!966814 e!808818)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432951 (= res!966814 (or (= (select (arr!47081 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47081 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47081 a!2831) index!585) (select (arr!47081 a!2831) j!81)) (= (select (store (arr!47081 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808819 () Bool)

(assert (=> b!1432951 e!808819))

(declare-fun res!966823 () Bool)

(assert (=> b!1432951 (=> (not res!966823) (not e!808819))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97548 (_ BitVec 32)) Bool)

(assert (=> b!1432951 (= res!966823 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48466 0))(
  ( (Unit!48467) )
))
(declare-fun lt!630814 () Unit!48466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48466)

(assert (=> b!1432951 (= lt!630814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432952 () Bool)

(declare-fun e!808822 () Bool)

(assert (=> b!1432952 (= e!808821 e!808822)))

(declare-fun res!966824 () Bool)

(assert (=> b!1432952 (=> (not res!966824) (not e!808822))))

(declare-datatypes ((SeekEntryResult!11360 0))(
  ( (MissingZero!11360 (index!47832 (_ BitVec 32))) (Found!11360 (index!47833 (_ BitVec 32))) (Intermediate!11360 (undefined!12172 Bool) (index!47834 (_ BitVec 32)) (x!129474 (_ BitVec 32))) (Undefined!11360) (MissingVacant!11360 (index!47835 (_ BitVec 32))) )
))
(declare-fun lt!630811 () SeekEntryResult!11360)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97548 (_ BitVec 32)) SeekEntryResult!11360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432952 (= res!966824 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) (select (arr!47081 a!2831) j!81) a!2831 mask!2608) lt!630811))))

(assert (=> b!1432952 (= lt!630811 (Intermediate!11360 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432953 () Bool)

(declare-fun res!966818 () Bool)

(assert (=> b!1432953 (=> (not res!966818) (not e!808821))))

(assert (=> b!1432953 (= res!966818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432954 () Bool)

(declare-fun res!966816 () Bool)

(assert (=> b!1432954 (=> (not res!966816) (not e!808823))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432954 (= res!966816 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432955 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97548 (_ BitVec 32)) SeekEntryResult!11360)

(assert (=> b!1432955 (= e!808819 (= (seekEntryOrOpen!0 (select (arr!47081 a!2831) j!81) a!2831 mask!2608) (Found!11360 j!81)))))

(declare-fun res!966819 () Bool)

(assert (=> start!123576 (=> (not res!966819) (not e!808821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123576 (= res!966819 (validMask!0 mask!2608))))

(assert (=> start!123576 e!808821))

(assert (=> start!123576 true))

(declare-fun array_inv!36109 (array!97548) Bool)

(assert (=> start!123576 (array_inv!36109 a!2831)))

(declare-fun b!1432956 () Bool)

(declare-fun res!966825 () Bool)

(assert (=> b!1432956 (=> (not res!966825) (not e!808821))))

(assert (=> b!1432956 (= res!966825 (validKeyInArray!0 (select (arr!47081 a!2831) i!982)))))

(declare-fun b!1432957 () Bool)

(declare-fun res!966820 () Bool)

(assert (=> b!1432957 (=> (not res!966820) (not e!808821))))

(assert (=> b!1432957 (= res!966820 (and (= (size!47631 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47631 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47631 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432958 () Bool)

(declare-fun res!966815 () Bool)

(assert (=> b!1432958 (=> (not res!966815) (not e!808823))))

(declare-fun lt!630816 () (_ BitVec 64))

(declare-fun lt!630815 () SeekEntryResult!11360)

(declare-fun lt!630813 () array!97548)

(assert (=> b!1432958 (= res!966815 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630816 lt!630813 mask!2608) lt!630815))))

(declare-fun b!1432959 () Bool)

(assert (=> b!1432959 (= e!808818 (and (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110)))))

(declare-fun lt!630812 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432959 (= lt!630812 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432960 () Bool)

(declare-fun res!966822 () Bool)

(assert (=> b!1432960 (=> (not res!966822) (not e!808821))))

(declare-datatypes ((List!33591 0))(
  ( (Nil!33588) (Cons!33587 (h!34910 (_ BitVec 64)) (t!48285 List!33591)) )
))
(declare-fun arrayNoDuplicates!0 (array!97548 (_ BitVec 32) List!33591) Bool)

(assert (=> b!1432960 (= res!966822 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33588))))

(declare-fun b!1432961 () Bool)

(assert (=> b!1432961 (= e!808822 e!808823)))

(declare-fun res!966821 () Bool)

(assert (=> b!1432961 (=> (not res!966821) (not e!808823))))

(assert (=> b!1432961 (= res!966821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630816 mask!2608) lt!630816 lt!630813 mask!2608) lt!630815))))

(assert (=> b!1432961 (= lt!630815 (Intermediate!11360 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432961 (= lt!630816 (select (store (arr!47081 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432961 (= lt!630813 (array!97549 (store (arr!47081 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47631 a!2831)))))

(declare-fun b!1432962 () Bool)

(declare-fun res!966813 () Bool)

(assert (=> b!1432962 (=> (not res!966813) (not e!808823))))

(assert (=> b!1432962 (= res!966813 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47081 a!2831) j!81) a!2831 mask!2608) lt!630811))))

(assert (= (and start!123576 res!966819) b!1432957))

(assert (= (and b!1432957 res!966820) b!1432956))

(assert (= (and b!1432956 res!966825) b!1432949))

(assert (= (and b!1432949 res!966817) b!1432953))

(assert (= (and b!1432953 res!966818) b!1432960))

(assert (= (and b!1432960 res!966822) b!1432950))

(assert (= (and b!1432950 res!966826) b!1432952))

(assert (= (and b!1432952 res!966824) b!1432961))

(assert (= (and b!1432961 res!966821) b!1432962))

(assert (= (and b!1432962 res!966813) b!1432958))

(assert (= (and b!1432958 res!966815) b!1432954))

(assert (= (and b!1432954 res!966816) b!1432951))

(assert (= (and b!1432951 res!966823) b!1432955))

(assert (= (and b!1432951 (not res!966814)) b!1432959))

(declare-fun m!1322781 () Bool)

(assert (=> b!1432951 m!1322781))

(declare-fun m!1322783 () Bool)

(assert (=> b!1432951 m!1322783))

(declare-fun m!1322785 () Bool)

(assert (=> b!1432951 m!1322785))

(declare-fun m!1322787 () Bool)

(assert (=> b!1432951 m!1322787))

(declare-fun m!1322789 () Bool)

(assert (=> b!1432951 m!1322789))

(declare-fun m!1322791 () Bool)

(assert (=> b!1432951 m!1322791))

(declare-fun m!1322793 () Bool)

(assert (=> b!1432960 m!1322793))

(declare-fun m!1322795 () Bool)

(assert (=> b!1432961 m!1322795))

(assert (=> b!1432961 m!1322795))

(declare-fun m!1322797 () Bool)

(assert (=> b!1432961 m!1322797))

(assert (=> b!1432961 m!1322781))

(declare-fun m!1322799 () Bool)

(assert (=> b!1432961 m!1322799))

(assert (=> b!1432949 m!1322789))

(assert (=> b!1432949 m!1322789))

(declare-fun m!1322801 () Bool)

(assert (=> b!1432949 m!1322801))

(declare-fun m!1322803 () Bool)

(assert (=> b!1432953 m!1322803))

(declare-fun m!1322805 () Bool)

(assert (=> b!1432958 m!1322805))

(assert (=> b!1432955 m!1322789))

(assert (=> b!1432955 m!1322789))

(declare-fun m!1322807 () Bool)

(assert (=> b!1432955 m!1322807))

(declare-fun m!1322809 () Bool)

(assert (=> b!1432956 m!1322809))

(assert (=> b!1432956 m!1322809))

(declare-fun m!1322811 () Bool)

(assert (=> b!1432956 m!1322811))

(declare-fun m!1322813 () Bool)

(assert (=> start!123576 m!1322813))

(declare-fun m!1322815 () Bool)

(assert (=> start!123576 m!1322815))

(declare-fun m!1322817 () Bool)

(assert (=> b!1432959 m!1322817))

(assert (=> b!1432962 m!1322789))

(assert (=> b!1432962 m!1322789))

(declare-fun m!1322819 () Bool)

(assert (=> b!1432962 m!1322819))

(assert (=> b!1432952 m!1322789))

(assert (=> b!1432952 m!1322789))

(declare-fun m!1322821 () Bool)

(assert (=> b!1432952 m!1322821))

(assert (=> b!1432952 m!1322821))

(assert (=> b!1432952 m!1322789))

(declare-fun m!1322823 () Bool)

(assert (=> b!1432952 m!1322823))

(push 1)

(assert (not b!1432959))

(assert (not start!123576))

(assert (not b!1432949))

(assert (not b!1432960))

(assert (not b!1432951))

(assert (not b!1432952))

(assert (not b!1432962))

(assert (not b!1432958))

(assert (not b!1432956))

(assert (not b!1432961))

(assert (not b!1432953))

(assert (not b!1432955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153991 () Bool)

(declare-fun res!966915 () Bool)

(declare-fun e!808879 () Bool)

(assert (=> d!153991 (=> res!966915 e!808879)))

(assert (=> d!153991 (= res!966915 (bvsge j!81 (size!47631 a!2831)))))

(assert (=> d!153991 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!808879)))

(declare-fun b!1433081 () Bool)

(declare-fun e!808880 () Bool)

(declare-fun call!67480 () Bool)

(assert (=> b!1433081 (= e!808880 call!67480)))

(declare-fun b!1433082 () Bool)

(declare-fun e!808881 () Bool)

(assert (=> b!1433082 (= e!808879 e!808881)))

(declare-fun c!132580 () Bool)

(assert (=> b!1433082 (= c!132580 (validKeyInArray!0 (select (arr!47081 a!2831) j!81)))))

(declare-fun bm!67477 () Bool)

(assert (=> bm!67477 (= call!67480 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433083 () Bool)

(assert (=> b!1433083 (= e!808881 call!67480)))

(declare-fun b!1433084 () Bool)

(assert (=> b!1433084 (= e!808881 e!808880)))

(declare-fun lt!630874 () (_ BitVec 64))

(assert (=> b!1433084 (= lt!630874 (select (arr!47081 a!2831) j!81))))

(declare-fun lt!630873 () Unit!48466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97548 (_ BitVec 64) (_ BitVec 32)) Unit!48466)

(assert (=> b!1433084 (= lt!630873 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630874 j!81))))

(declare-fun arrayContainsKey!0 (array!97548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433084 (arrayContainsKey!0 a!2831 lt!630874 #b00000000000000000000000000000000)))

(declare-fun lt!630872 () Unit!48466)

(assert (=> b!1433084 (= lt!630872 lt!630873)))

(declare-fun res!966916 () Bool)

(assert (=> b!1433084 (= res!966916 (= (seekEntryOrOpen!0 (select (arr!47081 a!2831) j!81) a!2831 mask!2608) (Found!11360 j!81)))))

(assert (=> b!1433084 (=> (not res!966916) (not e!808880))))

(assert (= (and d!153991 (not res!966915)) b!1433082))

(assert (= (and b!1433082 c!132580) b!1433084))

(assert (= (and b!1433082 (not c!132580)) b!1433083))

(assert (= (and b!1433084 res!966916) b!1433081))

(assert (= (or b!1433081 b!1433083) bm!67477))

(assert (=> b!1433082 m!1322789))

(assert (=> b!1433082 m!1322789))

(assert (=> b!1433082 m!1322801))

(declare-fun m!1322923 () Bool)

(assert (=> bm!67477 m!1322923))

(assert (=> b!1433084 m!1322789))

(declare-fun m!1322925 () Bool)

(assert (=> b!1433084 m!1322925))

(declare-fun m!1322927 () Bool)

(assert (=> b!1433084 m!1322927))

(assert (=> b!1433084 m!1322789))

(assert (=> b!1433084 m!1322807))

(assert (=> b!1432951 d!153991))

(declare-fun d!153995 () Bool)

(assert (=> d!153995 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630879 () Unit!48466)

(declare-fun choose!38 (array!97548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48466)

(assert (=> d!153995 (= lt!630879 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153995 (validMask!0 mask!2608)))

(assert (=> d!153995 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630879)))

(declare-fun bs!41732 () Bool)

(assert (= bs!41732 d!153995))

(assert (=> bs!41732 m!1322787))

(declare-fun m!1322929 () Bool)

(assert (=> bs!41732 m!1322929))

(assert (=> bs!41732 m!1322813))

(assert (=> b!1432951 d!153995))

(declare-fun b!1433167 () Bool)

(declare-fun e!808935 () SeekEntryResult!11360)

(assert (=> b!1433167 (= e!808935 (Intermediate!11360 true (toIndex!0 lt!630816 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433168 () Bool)

(declare-fun lt!630908 () SeekEntryResult!11360)

(assert (=> b!1433168 (and (bvsge (index!47834 lt!630908) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630908) (size!47631 lt!630813)))))

(declare-fun e!808934 () Bool)

(assert (=> b!1433168 (= e!808934 (= (select (arr!47081 lt!630813) (index!47834 lt!630908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433169 () Bool)

(declare-fun e!808936 () Bool)

(assert (=> b!1433169 (= e!808936 (bvsge (x!129474 lt!630908) #b01111111111111111111111111111110))))

(declare-fun b!1433170 () Bool)

(declare-fun e!808937 () SeekEntryResult!11360)

(assert (=> b!1433170 (= e!808937 (Intermediate!11360 false (toIndex!0 lt!630816 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153999 () Bool)

(assert (=> d!153999 e!808936))

(declare-fun c!132605 () Bool)

(assert (=> d!153999 (= c!132605 (and (is-Intermediate!11360 lt!630908) (undefined!12172 lt!630908)))))

(assert (=> d!153999 (= lt!630908 e!808935)))

(declare-fun c!132604 () Bool)

(assert (=> d!153999 (= c!132604 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!630907 () (_ BitVec 64))

(assert (=> d!153999 (= lt!630907 (select (arr!47081 lt!630813) (toIndex!0 lt!630816 mask!2608)))))

(assert (=> d!153999 (validMask!0 mask!2608)))

(assert (=> d!153999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630816 mask!2608) lt!630816 lt!630813 mask!2608) lt!630908)))

(declare-fun b!1433171 () Bool)

(assert (=> b!1433171 (and (bvsge (index!47834 lt!630908) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630908) (size!47631 lt!630813)))))

(declare-fun res!966955 () Bool)

(assert (=> b!1433171 (= res!966955 (= (select (arr!47081 lt!630813) (index!47834 lt!630908)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433171 (=> res!966955 e!808934)))

(declare-fun b!1433172 () Bool)

(assert (=> b!1433172 (and (bvsge (index!47834 lt!630908) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630908) (size!47631 lt!630813)))))

(declare-fun res!966954 () Bool)

(assert (=> b!1433172 (= res!966954 (= (select (arr!47081 lt!630813) (index!47834 lt!630908)) lt!630816))))

(assert (=> b!1433172 (=> res!966954 e!808934)))

(declare-fun e!808938 () Bool)

(assert (=> b!1433172 (= e!808938 e!808934)))

(declare-fun b!1433173 () Bool)

(assert (=> b!1433173 (= e!808935 e!808937)))

(declare-fun c!132606 () Bool)

(assert (=> b!1433173 (= c!132606 (or (= lt!630907 lt!630816) (= (bvadd lt!630907 lt!630907) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433174 () Bool)

(assert (=> b!1433174 (= e!808936 e!808938)))

(declare-fun res!966956 () Bool)

(assert (=> b!1433174 (= res!966956 (and (is-Intermediate!11360 lt!630908) (not (undefined!12172 lt!630908)) (bvslt (x!129474 lt!630908) #b01111111111111111111111111111110) (bvsge (x!129474 lt!630908) #b00000000000000000000000000000000) (bvsge (x!129474 lt!630908) #b00000000000000000000000000000000)))))

(assert (=> b!1433174 (=> (not res!966956) (not e!808938))))

(declare-fun b!1433175 () Bool)

(assert (=> b!1433175 (= e!808937 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630816 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630816 lt!630813 mask!2608))))

(assert (= (and d!153999 c!132604) b!1433167))

(assert (= (and d!153999 (not c!132604)) b!1433173))

(assert (= (and b!1433173 c!132606) b!1433170))

(assert (= (and b!1433173 (not c!132606)) b!1433175))

(assert (= (and d!153999 c!132605) b!1433169))

(assert (= (and d!153999 (not c!132605)) b!1433174))

(assert (= (and b!1433174 res!966956) b!1433172))

(assert (= (and b!1433172 (not res!966954)) b!1433171))

(assert (= (and b!1433171 (not res!966955)) b!1433168))

(assert (=> d!153999 m!1322795))

(declare-fun m!1322969 () Bool)

(assert (=> d!153999 m!1322969))

(assert (=> d!153999 m!1322813))

(declare-fun m!1322971 () Bool)

(assert (=> b!1433171 m!1322971))

(assert (=> b!1433175 m!1322795))

(declare-fun m!1322973 () Bool)

(assert (=> b!1433175 m!1322973))

(assert (=> b!1433175 m!1322973))

(declare-fun m!1322975 () Bool)

(assert (=> b!1433175 m!1322975))

(assert (=> b!1433172 m!1322971))

(assert (=> b!1433168 m!1322971))

(assert (=> b!1432961 d!153999))

(declare-fun d!154015 () Bool)

(declare-fun lt!630925 () (_ BitVec 32))

(declare-fun lt!630924 () (_ BitVec 32))

(assert (=> d!154015 (= lt!630925 (bvmul (bvxor lt!630924 (bvlshr lt!630924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154015 (= lt!630924 ((_ extract 31 0) (bvand (bvxor lt!630816 (bvlshr lt!630816 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154015 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966961 (let ((h!34914 ((_ extract 31 0) (bvand (bvxor lt!630816 (bvlshr lt!630816 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129481 (bvmul (bvxor h!34914 (bvlshr h!34914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129481 (bvlshr x!129481 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966961 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966961 #b00000000000000000000000000000000))))))

(assert (=> d!154015 (= (toIndex!0 lt!630816 mask!2608) (bvand (bvxor lt!630925 (bvlshr lt!630925 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432961 d!154015))

(declare-fun b!1433229 () Bool)

(declare-fun e!808976 () Bool)

(declare-fun e!808974 () Bool)

(assert (=> b!1433229 (= e!808976 e!808974)))

(declare-fun c!132622 () Bool)

(assert (=> b!1433229 (= c!132622 (validKeyInArray!0 (select (arr!47081 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67490 () Bool)

(declare-fun call!67493 () Bool)

(assert (=> bm!67490 (= call!67493 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132622 (Cons!33587 (select (arr!47081 a!2831) #b00000000000000000000000000000000) Nil!33588) Nil!33588)))))

(declare-fun b!1433231 () Bool)

(declare-fun e!808977 () Bool)

(declare-fun contains!9868 (List!33591 (_ BitVec 64)) Bool)

(assert (=> b!1433231 (= e!808977 (contains!9868 Nil!33588 (select (arr!47081 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433230 () Bool)

(assert (=> b!1433230 (= e!808974 call!67493)))

(declare-fun d!154019 () Bool)

(declare-fun res!966984 () Bool)

(declare-fun e!808975 () Bool)

(assert (=> d!154019 (=> res!966984 e!808975)))

(assert (=> d!154019 (= res!966984 (bvsge #b00000000000000000000000000000000 (size!47631 a!2831)))))

(assert (=> d!154019 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33588) e!808975)))

(declare-fun b!1433232 () Bool)

(assert (=> b!1433232 (= e!808975 e!808976)))

(declare-fun res!966982 () Bool)

(assert (=> b!1433232 (=> (not res!966982) (not e!808976))))

(assert (=> b!1433232 (= res!966982 (not e!808977))))

(declare-fun res!966983 () Bool)

(assert (=> b!1433232 (=> (not res!966983) (not e!808977))))

(assert (=> b!1433232 (= res!966983 (validKeyInArray!0 (select (arr!47081 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433233 () Bool)

(assert (=> b!1433233 (= e!808974 call!67493)))

(assert (= (and d!154019 (not res!966984)) b!1433232))

(assert (= (and b!1433232 res!966983) b!1433231))

(assert (= (and b!1433232 res!966982) b!1433229))

(assert (= (and b!1433229 c!132622) b!1433233))

(assert (= (and b!1433229 (not c!132622)) b!1433230))

(assert (= (or b!1433233 b!1433230) bm!67490))

(declare-fun m!1323001 () Bool)

(assert (=> b!1433229 m!1323001))

(assert (=> b!1433229 m!1323001))

(declare-fun m!1323003 () Bool)

(assert (=> b!1433229 m!1323003))

(assert (=> bm!67490 m!1323001))

(declare-fun m!1323005 () Bool)

(assert (=> bm!67490 m!1323005))

(assert (=> b!1433231 m!1323001))

(assert (=> b!1433231 m!1323001))

(declare-fun m!1323007 () Bool)

(assert (=> b!1433231 m!1323007))

(assert (=> b!1433232 m!1323001))

(assert (=> b!1433232 m!1323001))

(assert (=> b!1433232 m!1323003))

(assert (=> b!1432960 d!154019))

(declare-fun d!154033 () Bool)

(assert (=> d!154033 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123576 d!154033))

(declare-fun d!154041 () Bool)

(assert (=> d!154041 (= (array_inv!36109 a!2831) (bvsge (size!47631 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123576 d!154041))

(declare-fun d!154045 () Bool)

(assert (=> d!154045 (= (validKeyInArray!0 (select (arr!47081 a!2831) j!81)) (and (not (= (select (arr!47081 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47081 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432949 d!154045))

(declare-fun d!154049 () Bool)

(declare-fun res!966990 () Bool)

(declare-fun e!808986 () Bool)

(assert (=> d!154049 (=> res!966990 e!808986)))

(assert (=> d!154049 (= res!966990 (bvsge #b00000000000000000000000000000000 (size!47631 a!2831)))))

(assert (=> d!154049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808986)))

(declare-fun b!1433247 () Bool)

(declare-fun e!808987 () Bool)

(declare-fun call!67495 () Bool)

(assert (=> b!1433247 (= e!808987 call!67495)))

(declare-fun b!1433248 () Bool)

(declare-fun e!808988 () Bool)

(assert (=> b!1433248 (= e!808986 e!808988)))

(declare-fun c!132627 () Bool)

(assert (=> b!1433248 (= c!132627 (validKeyInArray!0 (select (arr!47081 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67492 () Bool)

(assert (=> bm!67492 (= call!67495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433249 () Bool)

(assert (=> b!1433249 (= e!808988 call!67495)))

(declare-fun b!1433250 () Bool)

(assert (=> b!1433250 (= e!808988 e!808987)))

(declare-fun lt!630953 () (_ BitVec 64))

(assert (=> b!1433250 (= lt!630953 (select (arr!47081 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630952 () Unit!48466)

(assert (=> b!1433250 (= lt!630952 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630953 #b00000000000000000000000000000000))))

(assert (=> b!1433250 (arrayContainsKey!0 a!2831 lt!630953 #b00000000000000000000000000000000)))

(declare-fun lt!630951 () Unit!48466)

(assert (=> b!1433250 (= lt!630951 lt!630952)))

(declare-fun res!966991 () Bool)

(assert (=> b!1433250 (= res!966991 (= (seekEntryOrOpen!0 (select (arr!47081 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11360 #b00000000000000000000000000000000)))))

(assert (=> b!1433250 (=> (not res!966991) (not e!808987))))

(assert (= (and d!154049 (not res!966990)) b!1433248))

(assert (= (and b!1433248 c!132627) b!1433250))

(assert (= (and b!1433248 (not c!132627)) b!1433249))

(assert (= (and b!1433250 res!966991) b!1433247))

(assert (= (or b!1433247 b!1433249) bm!67492))

(assert (=> b!1433248 m!1323001))

(assert (=> b!1433248 m!1323001))

(assert (=> b!1433248 m!1323003))

(declare-fun m!1323027 () Bool)

(assert (=> bm!67492 m!1323027))

(assert (=> b!1433250 m!1323001))

(declare-fun m!1323029 () Bool)

(assert (=> b!1433250 m!1323029))

(declare-fun m!1323031 () Bool)

(assert (=> b!1433250 m!1323031))

(assert (=> b!1433250 m!1323001))

(declare-fun m!1323033 () Bool)

(assert (=> b!1433250 m!1323033))

(assert (=> b!1432953 d!154049))

(declare-fun b!1433251 () Bool)

(declare-fun e!808990 () SeekEntryResult!11360)

(assert (=> b!1433251 (= e!808990 (Intermediate!11360 true (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433252 () Bool)

(declare-fun lt!630955 () SeekEntryResult!11360)

(assert (=> b!1433252 (and (bvsge (index!47834 lt!630955) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630955) (size!47631 a!2831)))))

(declare-fun e!808989 () Bool)

(assert (=> b!1433252 (= e!808989 (= (select (arr!47081 a!2831) (index!47834 lt!630955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433253 () Bool)

(declare-fun e!808991 () Bool)

(assert (=> b!1433253 (= e!808991 (bvsge (x!129474 lt!630955) #b01111111111111111111111111111110))))

(declare-fun b!1433254 () Bool)

(declare-fun e!808992 () SeekEntryResult!11360)

(assert (=> b!1433254 (= e!808992 (Intermediate!11360 false (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154051 () Bool)

(assert (=> d!154051 e!808991))

(declare-fun c!132629 () Bool)

(assert (=> d!154051 (= c!132629 (and (is-Intermediate!11360 lt!630955) (undefined!12172 lt!630955)))))

(assert (=> d!154051 (= lt!630955 e!808990)))

(declare-fun c!132628 () Bool)

(assert (=> d!154051 (= c!132628 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!630954 () (_ BitVec 64))

(assert (=> d!154051 (= lt!630954 (select (arr!47081 a!2831) (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608)))))

(assert (=> d!154051 (validMask!0 mask!2608)))

(assert (=> d!154051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) (select (arr!47081 a!2831) j!81) a!2831 mask!2608) lt!630955)))

(declare-fun b!1433255 () Bool)

(assert (=> b!1433255 (and (bvsge (index!47834 lt!630955) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630955) (size!47631 a!2831)))))

(declare-fun res!966993 () Bool)

(assert (=> b!1433255 (= res!966993 (= (select (arr!47081 a!2831) (index!47834 lt!630955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433255 (=> res!966993 e!808989)))

(declare-fun b!1433256 () Bool)

(assert (=> b!1433256 (and (bvsge (index!47834 lt!630955) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630955) (size!47631 a!2831)))))

(declare-fun res!966992 () Bool)

(assert (=> b!1433256 (= res!966992 (= (select (arr!47081 a!2831) (index!47834 lt!630955)) (select (arr!47081 a!2831) j!81)))))

(assert (=> b!1433256 (=> res!966992 e!808989)))

(declare-fun e!808993 () Bool)

(assert (=> b!1433256 (= e!808993 e!808989)))

(declare-fun b!1433257 () Bool)

(assert (=> b!1433257 (= e!808990 e!808992)))

(declare-fun c!132630 () Bool)

(assert (=> b!1433257 (= c!132630 (or (= lt!630954 (select (arr!47081 a!2831) j!81)) (= (bvadd lt!630954 lt!630954) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433258 () Bool)

(assert (=> b!1433258 (= e!808991 e!808993)))

(declare-fun res!966994 () Bool)

(assert (=> b!1433258 (= res!966994 (and (is-Intermediate!11360 lt!630955) (not (undefined!12172 lt!630955)) (bvslt (x!129474 lt!630955) #b01111111111111111111111111111110) (bvsge (x!129474 lt!630955) #b00000000000000000000000000000000) (bvsge (x!129474 lt!630955) #b00000000000000000000000000000000)))))

(assert (=> b!1433258 (=> (not res!966994) (not e!808993))))

(declare-fun b!1433259 () Bool)

(assert (=> b!1433259 (= e!808992 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47081 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154051 c!132628) b!1433251))

(assert (= (and d!154051 (not c!132628)) b!1433257))

(assert (= (and b!1433257 c!132630) b!1433254))

(assert (= (and b!1433257 (not c!132630)) b!1433259))

(assert (= (and d!154051 c!132629) b!1433253))

(assert (= (and d!154051 (not c!132629)) b!1433258))

(assert (= (and b!1433258 res!966994) b!1433256))

(assert (= (and b!1433256 (not res!966992)) b!1433255))

(assert (= (and b!1433255 (not res!966993)) b!1433252))

(assert (=> d!154051 m!1322821))

(declare-fun m!1323035 () Bool)

(assert (=> d!154051 m!1323035))

(assert (=> d!154051 m!1322813))

(declare-fun m!1323037 () Bool)

(assert (=> b!1433255 m!1323037))

(assert (=> b!1433259 m!1322821))

(declare-fun m!1323039 () Bool)

(assert (=> b!1433259 m!1323039))

(assert (=> b!1433259 m!1323039))

(assert (=> b!1433259 m!1322789))

(declare-fun m!1323041 () Bool)

(assert (=> b!1433259 m!1323041))

(assert (=> b!1433256 m!1323037))

(assert (=> b!1433252 m!1323037))

(assert (=> b!1432952 d!154051))

(declare-fun d!154055 () Bool)

(declare-fun lt!630957 () (_ BitVec 32))

(declare-fun lt!630956 () (_ BitVec 32))

(assert (=> d!154055 (= lt!630957 (bvmul (bvxor lt!630956 (bvlshr lt!630956 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154055 (= lt!630956 ((_ extract 31 0) (bvand (bvxor (select (arr!47081 a!2831) j!81) (bvlshr (select (arr!47081 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154055 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!966961 (let ((h!34914 ((_ extract 31 0) (bvand (bvxor (select (arr!47081 a!2831) j!81) (bvlshr (select (arr!47081 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129481 (bvmul (bvxor h!34914 (bvlshr h!34914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129481 (bvlshr x!129481 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!966961 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!966961 #b00000000000000000000000000000000))))))

(assert (=> d!154055 (= (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) (bvand (bvxor lt!630957 (bvlshr lt!630957 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1432952 d!154055))

(declare-fun b!1433260 () Bool)

(declare-fun e!808995 () SeekEntryResult!11360)

(assert (=> b!1433260 (= e!808995 (Intermediate!11360 true index!585 x!605))))

(declare-fun b!1433261 () Bool)

(declare-fun lt!630959 () SeekEntryResult!11360)

(assert (=> b!1433261 (and (bvsge (index!47834 lt!630959) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630959) (size!47631 a!2831)))))

(declare-fun e!808994 () Bool)

(assert (=> b!1433261 (= e!808994 (= (select (arr!47081 a!2831) (index!47834 lt!630959)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433262 () Bool)

(declare-fun e!808996 () Bool)

(assert (=> b!1433262 (= e!808996 (bvsge (x!129474 lt!630959) #b01111111111111111111111111111110))))

(declare-fun b!1433263 () Bool)

(declare-fun e!808997 () SeekEntryResult!11360)

(assert (=> b!1433263 (= e!808997 (Intermediate!11360 false index!585 x!605))))

(declare-fun d!154057 () Bool)

(assert (=> d!154057 e!808996))

(declare-fun c!132632 () Bool)

(assert (=> d!154057 (= c!132632 (and (is-Intermediate!11360 lt!630959) (undefined!12172 lt!630959)))))

(assert (=> d!154057 (= lt!630959 e!808995)))

(declare-fun c!132631 () Bool)

(assert (=> d!154057 (= c!132631 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!630958 () (_ BitVec 64))

(assert (=> d!154057 (= lt!630958 (select (arr!47081 a!2831) index!585))))

(assert (=> d!154057 (validMask!0 mask!2608)))

(assert (=> d!154057 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47081 a!2831) j!81) a!2831 mask!2608) lt!630959)))

(declare-fun b!1433264 () Bool)

(assert (=> b!1433264 (and (bvsge (index!47834 lt!630959) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630959) (size!47631 a!2831)))))

(declare-fun res!966996 () Bool)

(assert (=> b!1433264 (= res!966996 (= (select (arr!47081 a!2831) (index!47834 lt!630959)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433264 (=> res!966996 e!808994)))

(declare-fun b!1433265 () Bool)

(assert (=> b!1433265 (and (bvsge (index!47834 lt!630959) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630959) (size!47631 a!2831)))))

(declare-fun res!966995 () Bool)

(assert (=> b!1433265 (= res!966995 (= (select (arr!47081 a!2831) (index!47834 lt!630959)) (select (arr!47081 a!2831) j!81)))))

(assert (=> b!1433265 (=> res!966995 e!808994)))

(declare-fun e!808998 () Bool)

(assert (=> b!1433265 (= e!808998 e!808994)))

(declare-fun b!1433266 () Bool)

(assert (=> b!1433266 (= e!808995 e!808997)))

(declare-fun c!132633 () Bool)

(assert (=> b!1433266 (= c!132633 (or (= lt!630958 (select (arr!47081 a!2831) j!81)) (= (bvadd lt!630958 lt!630958) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433267 () Bool)

(assert (=> b!1433267 (= e!808996 e!808998)))

(declare-fun res!966997 () Bool)

(assert (=> b!1433267 (= res!966997 (and (is-Intermediate!11360 lt!630959) (not (undefined!12172 lt!630959)) (bvslt (x!129474 lt!630959) #b01111111111111111111111111111110) (bvsge (x!129474 lt!630959) #b00000000000000000000000000000000) (bvsge (x!129474 lt!630959) x!605)))))

(assert (=> b!1433267 (=> (not res!966997) (not e!808998))))

(declare-fun b!1433268 () Bool)

(assert (=> b!1433268 (= e!808997 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47081 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154057 c!132631) b!1433260))

(assert (= (and d!154057 (not c!132631)) b!1433266))

(assert (= (and b!1433266 c!132633) b!1433263))

(assert (= (and b!1433266 (not c!132633)) b!1433268))

(assert (= (and d!154057 c!132632) b!1433262))

(assert (= (and d!154057 (not c!132632)) b!1433267))

(assert (= (and b!1433267 res!966997) b!1433265))

(assert (= (and b!1433265 (not res!966995)) b!1433264))

(assert (= (and b!1433264 (not res!966996)) b!1433261))

(assert (=> d!154057 m!1322785))

(assert (=> d!154057 m!1322813))

(declare-fun m!1323043 () Bool)

(assert (=> b!1433264 m!1323043))

(assert (=> b!1433268 m!1322817))

(assert (=> b!1433268 m!1322817))

(assert (=> b!1433268 m!1322789))

(declare-fun m!1323045 () Bool)

(assert (=> b!1433268 m!1323045))

(assert (=> b!1433265 m!1323043))

(assert (=> b!1433261 m!1323043))

(assert (=> b!1432962 d!154057))

(declare-fun d!154061 () Bool)

(assert (=> d!154061 (= (validKeyInArray!0 (select (arr!47081 a!2831) i!982)) (and (not (= (select (arr!47081 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47081 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1432956 d!154061))

(declare-fun b!1433311 () Bool)

(declare-fun c!132654 () Bool)

(declare-fun lt!630980 () (_ BitVec 64))

(assert (=> b!1433311 (= c!132654 (= lt!630980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809021 () SeekEntryResult!11360)

(declare-fun e!809023 () SeekEntryResult!11360)

(assert (=> b!1433311 (= e!809021 e!809023)))

(declare-fun b!1433312 () Bool)

(declare-fun lt!630978 () SeekEntryResult!11360)

(assert (=> b!1433312 (= e!809023 (MissingZero!11360 (index!47834 lt!630978)))))

(declare-fun b!1433313 () Bool)

(declare-fun e!809022 () SeekEntryResult!11360)

(assert (=> b!1433313 (= e!809022 Undefined!11360)))

(declare-fun b!1433314 () Bool)

(assert (=> b!1433314 (= e!809022 e!809021)))

(assert (=> b!1433314 (= lt!630980 (select (arr!47081 a!2831) (index!47834 lt!630978)))))

(declare-fun c!132652 () Bool)

(assert (=> b!1433314 (= c!132652 (= lt!630980 (select (arr!47081 a!2831) j!81)))))

(declare-fun b!1433315 () Bool)

(assert (=> b!1433315 (= e!809021 (Found!11360 (index!47834 lt!630978)))))

(declare-fun b!1433316 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97548 (_ BitVec 32)) SeekEntryResult!11360)

(assert (=> b!1433316 (= e!809023 (seekKeyOrZeroReturnVacant!0 (x!129474 lt!630978) (index!47834 lt!630978) (index!47834 lt!630978) (select (arr!47081 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154063 () Bool)

(declare-fun lt!630979 () SeekEntryResult!11360)

(assert (=> d!154063 (and (or (is-Undefined!11360 lt!630979) (not (is-Found!11360 lt!630979)) (and (bvsge (index!47833 lt!630979) #b00000000000000000000000000000000) (bvslt (index!47833 lt!630979) (size!47631 a!2831)))) (or (is-Undefined!11360 lt!630979) (is-Found!11360 lt!630979) (not (is-MissingZero!11360 lt!630979)) (and (bvsge (index!47832 lt!630979) #b00000000000000000000000000000000) (bvslt (index!47832 lt!630979) (size!47631 a!2831)))) (or (is-Undefined!11360 lt!630979) (is-Found!11360 lt!630979) (is-MissingZero!11360 lt!630979) (not (is-MissingVacant!11360 lt!630979)) (and (bvsge (index!47835 lt!630979) #b00000000000000000000000000000000) (bvslt (index!47835 lt!630979) (size!47631 a!2831)))) (or (is-Undefined!11360 lt!630979) (ite (is-Found!11360 lt!630979) (= (select (arr!47081 a!2831) (index!47833 lt!630979)) (select (arr!47081 a!2831) j!81)) (ite (is-MissingZero!11360 lt!630979) (= (select (arr!47081 a!2831) (index!47832 lt!630979)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11360 lt!630979) (= (select (arr!47081 a!2831) (index!47835 lt!630979)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154063 (= lt!630979 e!809022)))

(declare-fun c!132653 () Bool)

(assert (=> d!154063 (= c!132653 (and (is-Intermediate!11360 lt!630978) (undefined!12172 lt!630978)))))

(assert (=> d!154063 (= lt!630978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47081 a!2831) j!81) mask!2608) (select (arr!47081 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154063 (validMask!0 mask!2608)))

(assert (=> d!154063 (= (seekEntryOrOpen!0 (select (arr!47081 a!2831) j!81) a!2831 mask!2608) lt!630979)))

(assert (= (and d!154063 c!132653) b!1433313))

(assert (= (and d!154063 (not c!132653)) b!1433314))

(assert (= (and b!1433314 c!132652) b!1433315))

(assert (= (and b!1433314 (not c!132652)) b!1433311))

(assert (= (and b!1433311 c!132654) b!1433312))

(assert (= (and b!1433311 (not c!132654)) b!1433316))

(declare-fun m!1323061 () Bool)

(assert (=> b!1433314 m!1323061))

(assert (=> b!1433316 m!1322789))

(declare-fun m!1323063 () Bool)

(assert (=> b!1433316 m!1323063))

(assert (=> d!154063 m!1322789))

(assert (=> d!154063 m!1322821))

(assert (=> d!154063 m!1322821))

(assert (=> d!154063 m!1322789))

(assert (=> d!154063 m!1322823))

(declare-fun m!1323065 () Bool)

(assert (=> d!154063 m!1323065))

(assert (=> d!154063 m!1322813))

(declare-fun m!1323067 () Bool)

(assert (=> d!154063 m!1323067))

(declare-fun m!1323069 () Bool)

(assert (=> d!154063 m!1323069))

(assert (=> b!1432955 d!154063))

(declare-fun d!154071 () Bool)

(declare-fun lt!630986 () (_ BitVec 32))

(assert (=> d!154071 (and (bvsge lt!630986 #b00000000000000000000000000000000) (bvslt lt!630986 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154071 (= lt!630986 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154071 (validMask!0 mask!2608)))

(assert (=> d!154071 (= (nextIndex!0 index!585 x!605 mask!2608) lt!630986)))

(declare-fun bs!41736 () Bool)

(assert (= bs!41736 d!154071))

(declare-fun m!1323081 () Bool)

(assert (=> bs!41736 m!1323081))

(assert (=> bs!41736 m!1322813))

(assert (=> b!1432959 d!154071))

(declare-fun b!1433323 () Bool)

(declare-fun e!809028 () SeekEntryResult!11360)

(assert (=> b!1433323 (= e!809028 (Intermediate!11360 true index!585 x!605))))

(declare-fun b!1433324 () Bool)

(declare-fun lt!630988 () SeekEntryResult!11360)

(assert (=> b!1433324 (and (bvsge (index!47834 lt!630988) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630988) (size!47631 lt!630813)))))

(declare-fun e!809027 () Bool)

(assert (=> b!1433324 (= e!809027 (= (select (arr!47081 lt!630813) (index!47834 lt!630988)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433325 () Bool)

(declare-fun e!809029 () Bool)

(assert (=> b!1433325 (= e!809029 (bvsge (x!129474 lt!630988) #b01111111111111111111111111111110))))

(declare-fun b!1433326 () Bool)

(declare-fun e!809030 () SeekEntryResult!11360)

(assert (=> b!1433326 (= e!809030 (Intermediate!11360 false index!585 x!605))))

(declare-fun d!154075 () Bool)

(assert (=> d!154075 e!809029))

(declare-fun c!132659 () Bool)

(assert (=> d!154075 (= c!132659 (and (is-Intermediate!11360 lt!630988) (undefined!12172 lt!630988)))))

(assert (=> d!154075 (= lt!630988 e!809028)))

(declare-fun c!132658 () Bool)

(assert (=> d!154075 (= c!132658 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!630987 () (_ BitVec 64))

(assert (=> d!154075 (= lt!630987 (select (arr!47081 lt!630813) index!585))))

(assert (=> d!154075 (validMask!0 mask!2608)))

(assert (=> d!154075 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630816 lt!630813 mask!2608) lt!630988)))

(declare-fun b!1433327 () Bool)

(assert (=> b!1433327 (and (bvsge (index!47834 lt!630988) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630988) (size!47631 lt!630813)))))

(declare-fun res!967005 () Bool)

(assert (=> b!1433327 (= res!967005 (= (select (arr!47081 lt!630813) (index!47834 lt!630988)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433327 (=> res!967005 e!809027)))

(declare-fun b!1433328 () Bool)

(assert (=> b!1433328 (and (bvsge (index!47834 lt!630988) #b00000000000000000000000000000000) (bvslt (index!47834 lt!630988) (size!47631 lt!630813)))))

(declare-fun res!967004 () Bool)

(assert (=> b!1433328 (= res!967004 (= (select (arr!47081 lt!630813) (index!47834 lt!630988)) lt!630816))))

(assert (=> b!1433328 (=> res!967004 e!809027)))

(declare-fun e!809031 () Bool)

(assert (=> b!1433328 (= e!809031 e!809027)))

(declare-fun b!1433329 () Bool)

(assert (=> b!1433329 (= e!809028 e!809030)))

(declare-fun c!132660 () Bool)

(assert (=> b!1433329 (= c!132660 (or (= lt!630987 lt!630816) (= (bvadd lt!630987 lt!630987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433330 () Bool)

(assert (=> b!1433330 (= e!809029 e!809031)))

(declare-fun res!967006 () Bool)

(assert (=> b!1433330 (= res!967006 (and (is-Intermediate!11360 lt!630988) (not (undefined!12172 lt!630988)) (bvslt (x!129474 lt!630988) #b01111111111111111111111111111110) (bvsge (x!129474 lt!630988) #b00000000000000000000000000000000) (bvsge (x!129474 lt!630988) x!605)))))

(assert (=> b!1433330 (=> (not res!967006) (not e!809031))))

(declare-fun b!1433331 () Bool)

(assert (=> b!1433331 (= e!809030 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630816 lt!630813 mask!2608))))

(assert (= (and d!154075 c!132658) b!1433323))

(assert (= (and d!154075 (not c!132658)) b!1433329))

(assert (= (and b!1433329 c!132660) b!1433326))

(assert (= (and b!1433329 (not c!132660)) b!1433331))

(assert (= (and d!154075 c!132659) b!1433325))

(assert (= (and d!154075 (not c!132659)) b!1433330))

(assert (= (and b!1433330 res!967006) b!1433328))

(assert (= (and b!1433328 (not res!967004)) b!1433327))

(assert (= (and b!1433327 (not res!967005)) b!1433324))

(declare-fun m!1323083 () Bool)

(assert (=> d!154075 m!1323083))

(assert (=> d!154075 m!1322813))

(declare-fun m!1323085 () Bool)

(assert (=> b!1433327 m!1323085))

(assert (=> b!1433331 m!1322817))

(assert (=> b!1433331 m!1322817))

(declare-fun m!1323087 () Bool)

(assert (=> b!1433331 m!1323087))

(assert (=> b!1433328 m!1323085))

(assert (=> b!1433324 m!1323085))

(assert (=> b!1432958 d!154075))

(push 1)

(assert (not b!1433175))

(assert (not b!1433250))

(assert (not b!1433084))

(assert (not b!1433268))

(assert (not d!154063))

(assert (not b!1433316))

(assert (not b!1433229))

(assert (not bm!67492))

(assert (not d!154075))

(assert (not b!1433331))

(assert (not d!154057))

(assert (not d!154071))

(assert (not b!1433232))

(assert (not bm!67477))

(assert (not b!1433248))

(assert (not bm!67490))

(assert (not b!1433259))

(assert (not b!1433231))

(assert (not d!153995))

(assert (not d!154051))

(assert (not d!153999))

(assert (not b!1433082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

