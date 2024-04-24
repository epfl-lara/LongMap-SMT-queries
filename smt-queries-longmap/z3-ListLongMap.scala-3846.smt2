; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52932 () Bool)

(assert start!52932)

(declare-fun lt!263807 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5668 0))(
  ( (MissingZero!5668 (index!24899 (_ BitVec 32))) (Found!5668 (index!24900 (_ BitVec 32))) (Intermediate!5668 (undefined!6480 Bool) (index!24901 (_ BitVec 32)) (x!53942 (_ BitVec 32))) (Undefined!5668) (MissingVacant!5668 (index!24902 (_ BitVec 32))) )
))
(declare-fun lt!263814 () SeekEntryResult!5668)

(declare-fun e!331813 () Bool)

(declare-datatypes ((array!35967 0))(
  ( (array!35968 (arr!17263 (Array (_ BitVec 32) (_ BitVec 64))) (size!17627 (_ BitVec 32))) )
))
(declare-fun lt!263813 () array!35967)

(declare-fun b!576742 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35967 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!576742 (= e!331813 (= lt!263814 (seekEntryOrOpen!0 lt!263807 lt!263813 mask!3119)))))

(declare-fun b!576743 () Bool)

(declare-fun res!364871 () Bool)

(declare-fun e!331814 () Bool)

(assert (=> b!576743 (=> (not res!364871) (not e!331814))))

(declare-fun a!3118 () array!35967)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576743 (= res!364871 (validKeyInArray!0 (select (arr!17263 a!3118) j!142)))))

(declare-fun b!576744 () Bool)

(declare-fun e!331815 () Bool)

(assert (=> b!576744 (= e!331815 (not e!331813))))

(declare-fun res!364870 () Bool)

(assert (=> b!576744 (=> res!364870 e!331813)))

(declare-fun lt!263809 () Bool)

(declare-fun lt!263812 () SeekEntryResult!5668)

(assert (=> b!576744 (= res!364870 (or (and (not lt!263809) (undefined!6480 lt!263812)) (and (not lt!263809) (not (undefined!6480 lt!263812)))))))

(get-info :version)

(assert (=> b!576744 (= lt!263809 (not ((_ is Intermediate!5668) lt!263812)))))

(assert (=> b!576744 (= lt!263814 (Found!5668 j!142))))

(assert (=> b!576744 (= lt!263814 (seekEntryOrOpen!0 (select (arr!17263 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35967 (_ BitVec 32)) Bool)

(assert (=> b!576744 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18109 0))(
  ( (Unit!18110) )
))
(declare-fun lt!263815 () Unit!18109)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18109)

(assert (=> b!576744 (= lt!263815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576745 () Bool)

(declare-fun res!364876 () Bool)

(declare-fun e!331812 () Bool)

(assert (=> b!576745 (=> (not res!364876) (not e!331812))))

(declare-datatypes ((List!11250 0))(
  ( (Nil!11247) (Cons!11246 (h!12291 (_ BitVec 64)) (t!17470 List!11250)) )
))
(declare-fun arrayNoDuplicates!0 (array!35967 (_ BitVec 32) List!11250) Bool)

(assert (=> b!576745 (= res!364876 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11247))))

(declare-fun res!364873 () Bool)

(assert (=> start!52932 (=> (not res!364873) (not e!331814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52932 (= res!364873 (validMask!0 mask!3119))))

(assert (=> start!52932 e!331814))

(assert (=> start!52932 true))

(declare-fun array_inv!13122 (array!35967) Bool)

(assert (=> start!52932 (array_inv!13122 a!3118)))

(declare-fun b!576746 () Bool)

(declare-fun res!364879 () Bool)

(assert (=> b!576746 (=> (not res!364879) (not e!331814))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!576746 (= res!364879 (validKeyInArray!0 k0!1914))))

(declare-fun b!576747 () Bool)

(assert (=> b!576747 (= e!331814 e!331812)))

(declare-fun res!364878 () Bool)

(assert (=> b!576747 (=> (not res!364878) (not e!331812))))

(declare-fun lt!263810 () SeekEntryResult!5668)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576747 (= res!364878 (or (= lt!263810 (MissingZero!5668 i!1132)) (= lt!263810 (MissingVacant!5668 i!1132))))))

(assert (=> b!576747 (= lt!263810 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576748 () Bool)

(declare-fun res!364877 () Bool)

(assert (=> b!576748 (=> (not res!364877) (not e!331812))))

(assert (=> b!576748 (= res!364877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576749 () Bool)

(declare-fun res!364872 () Bool)

(assert (=> b!576749 (=> (not res!364872) (not e!331814))))

(declare-fun arrayContainsKey!0 (array!35967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576749 (= res!364872 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576750 () Bool)

(declare-fun res!364874 () Bool)

(assert (=> b!576750 (=> (not res!364874) (not e!331814))))

(assert (=> b!576750 (= res!364874 (and (= (size!17627 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17627 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17627 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576751 () Bool)

(assert (=> b!576751 (= e!331812 e!331815)))

(declare-fun res!364875 () Bool)

(assert (=> b!576751 (=> (not res!364875) (not e!331815))))

(declare-fun lt!263808 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35967 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!576751 (= res!364875 (= lt!263812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263808 lt!263807 lt!263813 mask!3119)))))

(declare-fun lt!263811 () (_ BitVec 32))

(assert (=> b!576751 (= lt!263812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263811 (select (arr!17263 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576751 (= lt!263808 (toIndex!0 lt!263807 mask!3119))))

(assert (=> b!576751 (= lt!263807 (select (store (arr!17263 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!576751 (= lt!263811 (toIndex!0 (select (arr!17263 a!3118) j!142) mask!3119))))

(assert (=> b!576751 (= lt!263813 (array!35968 (store (arr!17263 a!3118) i!1132 k0!1914) (size!17627 a!3118)))))

(assert (= (and start!52932 res!364873) b!576750))

(assert (= (and b!576750 res!364874) b!576743))

(assert (= (and b!576743 res!364871) b!576746))

(assert (= (and b!576746 res!364879) b!576749))

(assert (= (and b!576749 res!364872) b!576747))

(assert (= (and b!576747 res!364878) b!576748))

(assert (= (and b!576748 res!364877) b!576745))

(assert (= (and b!576745 res!364876) b!576751))

(assert (= (and b!576751 res!364875) b!576744))

(assert (= (and b!576744 (not res!364870)) b!576742))

(declare-fun m!555863 () Bool)

(assert (=> b!576745 m!555863))

(declare-fun m!555865 () Bool)

(assert (=> b!576744 m!555865))

(assert (=> b!576744 m!555865))

(declare-fun m!555867 () Bool)

(assert (=> b!576744 m!555867))

(declare-fun m!555869 () Bool)

(assert (=> b!576744 m!555869))

(declare-fun m!555871 () Bool)

(assert (=> b!576744 m!555871))

(declare-fun m!555873 () Bool)

(assert (=> b!576748 m!555873))

(declare-fun m!555875 () Bool)

(assert (=> b!576749 m!555875))

(declare-fun m!555877 () Bool)

(assert (=> b!576742 m!555877))

(declare-fun m!555879 () Bool)

(assert (=> b!576747 m!555879))

(assert (=> b!576743 m!555865))

(assert (=> b!576743 m!555865))

(declare-fun m!555881 () Bool)

(assert (=> b!576743 m!555881))

(assert (=> b!576751 m!555865))

(declare-fun m!555883 () Bool)

(assert (=> b!576751 m!555883))

(assert (=> b!576751 m!555865))

(declare-fun m!555885 () Bool)

(assert (=> b!576751 m!555885))

(assert (=> b!576751 m!555865))

(declare-fun m!555887 () Bool)

(assert (=> b!576751 m!555887))

(declare-fun m!555889 () Bool)

(assert (=> b!576751 m!555889))

(declare-fun m!555891 () Bool)

(assert (=> b!576751 m!555891))

(declare-fun m!555893 () Bool)

(assert (=> b!576751 m!555893))

(declare-fun m!555895 () Bool)

(assert (=> start!52932 m!555895))

(declare-fun m!555897 () Bool)

(assert (=> start!52932 m!555897))

(declare-fun m!555899 () Bool)

(assert (=> b!576746 m!555899))

(check-sat (not b!576749) (not b!576743) (not b!576745) (not b!576746) (not b!576742) (not start!52932) (not b!576744) (not b!576747) (not b!576748) (not b!576751))
(check-sat)
(get-model)

(declare-fun b!576824 () Bool)

(declare-fun e!331854 () SeekEntryResult!5668)

(declare-fun e!331852 () SeekEntryResult!5668)

(assert (=> b!576824 (= e!331854 e!331852)))

(declare-fun lt!263878 () (_ BitVec 64))

(declare-fun lt!263876 () SeekEntryResult!5668)

(assert (=> b!576824 (= lt!263878 (select (arr!17263 a!3118) (index!24901 lt!263876)))))

(declare-fun c!66311 () Bool)

(assert (=> b!576824 (= c!66311 (= lt!263878 (select (arr!17263 a!3118) j!142)))))

(declare-fun b!576825 () Bool)

(assert (=> b!576825 (= e!331854 Undefined!5668)))

(declare-fun b!576826 () Bool)

(declare-fun e!331853 () SeekEntryResult!5668)

(assert (=> b!576826 (= e!331853 (MissingZero!5668 (index!24901 lt!263876)))))

(declare-fun d!85513 () Bool)

(declare-fun lt!263877 () SeekEntryResult!5668)

(assert (=> d!85513 (and (or ((_ is Undefined!5668) lt!263877) (not ((_ is Found!5668) lt!263877)) (and (bvsge (index!24900 lt!263877) #b00000000000000000000000000000000) (bvslt (index!24900 lt!263877) (size!17627 a!3118)))) (or ((_ is Undefined!5668) lt!263877) ((_ is Found!5668) lt!263877) (not ((_ is MissingZero!5668) lt!263877)) (and (bvsge (index!24899 lt!263877) #b00000000000000000000000000000000) (bvslt (index!24899 lt!263877) (size!17627 a!3118)))) (or ((_ is Undefined!5668) lt!263877) ((_ is Found!5668) lt!263877) ((_ is MissingZero!5668) lt!263877) (not ((_ is MissingVacant!5668) lt!263877)) (and (bvsge (index!24902 lt!263877) #b00000000000000000000000000000000) (bvslt (index!24902 lt!263877) (size!17627 a!3118)))) (or ((_ is Undefined!5668) lt!263877) (ite ((_ is Found!5668) lt!263877) (= (select (arr!17263 a!3118) (index!24900 lt!263877)) (select (arr!17263 a!3118) j!142)) (ite ((_ is MissingZero!5668) lt!263877) (= (select (arr!17263 a!3118) (index!24899 lt!263877)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5668) lt!263877) (= (select (arr!17263 a!3118) (index!24902 lt!263877)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85513 (= lt!263877 e!331854)))

(declare-fun c!66309 () Bool)

(assert (=> d!85513 (= c!66309 (and ((_ is Intermediate!5668) lt!263876) (undefined!6480 lt!263876)))))

(assert (=> d!85513 (= lt!263876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17263 a!3118) j!142) mask!3119) (select (arr!17263 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85513 (validMask!0 mask!3119)))

(assert (=> d!85513 (= (seekEntryOrOpen!0 (select (arr!17263 a!3118) j!142) a!3118 mask!3119) lt!263877)))

(declare-fun b!576827 () Bool)

(declare-fun c!66310 () Bool)

(assert (=> b!576827 (= c!66310 (= lt!263878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576827 (= e!331852 e!331853)))

(declare-fun b!576828 () Bool)

(assert (=> b!576828 (= e!331852 (Found!5668 (index!24901 lt!263876)))))

(declare-fun b!576829 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35967 (_ BitVec 32)) SeekEntryResult!5668)

(assert (=> b!576829 (= e!331853 (seekKeyOrZeroReturnVacant!0 (x!53942 lt!263876) (index!24901 lt!263876) (index!24901 lt!263876) (select (arr!17263 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85513 c!66309) b!576825))

(assert (= (and d!85513 (not c!66309)) b!576824))

(assert (= (and b!576824 c!66311) b!576828))

(assert (= (and b!576824 (not c!66311)) b!576827))

(assert (= (and b!576827 c!66310) b!576826))

(assert (= (and b!576827 (not c!66310)) b!576829))

(declare-fun m!555977 () Bool)

(assert (=> b!576824 m!555977))

(assert (=> d!85513 m!555883))

(assert (=> d!85513 m!555865))

(declare-fun m!555979 () Bool)

(assert (=> d!85513 m!555979))

(declare-fun m!555981 () Bool)

(assert (=> d!85513 m!555981))

(assert (=> d!85513 m!555865))

(assert (=> d!85513 m!555883))

(assert (=> d!85513 m!555895))

(declare-fun m!555983 () Bool)

(assert (=> d!85513 m!555983))

(declare-fun m!555985 () Bool)

(assert (=> d!85513 m!555985))

(assert (=> b!576829 m!555865))

(declare-fun m!555987 () Bool)

(assert (=> b!576829 m!555987))

(assert (=> b!576744 d!85513))

(declare-fun b!576838 () Bool)

(declare-fun e!331863 () Bool)

(declare-fun call!32736 () Bool)

(assert (=> b!576838 (= e!331863 call!32736)))

(declare-fun d!85517 () Bool)

(declare-fun res!364944 () Bool)

(declare-fun e!331861 () Bool)

(assert (=> d!85517 (=> res!364944 e!331861)))

(assert (=> d!85517 (= res!364944 (bvsge j!142 (size!17627 a!3118)))))

(assert (=> d!85517 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331861)))

(declare-fun b!576839 () Bool)

(declare-fun e!331862 () Bool)

(assert (=> b!576839 (= e!331861 e!331862)))

(declare-fun c!66314 () Bool)

(assert (=> b!576839 (= c!66314 (validKeyInArray!0 (select (arr!17263 a!3118) j!142)))))

(declare-fun b!576840 () Bool)

(assert (=> b!576840 (= e!331862 call!32736)))

(declare-fun bm!32733 () Bool)

(assert (=> bm!32733 (= call!32736 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576841 () Bool)

(assert (=> b!576841 (= e!331862 e!331863)))

(declare-fun lt!263886 () (_ BitVec 64))

(assert (=> b!576841 (= lt!263886 (select (arr!17263 a!3118) j!142))))

(declare-fun lt!263885 () Unit!18109)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35967 (_ BitVec 64) (_ BitVec 32)) Unit!18109)

(assert (=> b!576841 (= lt!263885 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263886 j!142))))

(assert (=> b!576841 (arrayContainsKey!0 a!3118 lt!263886 #b00000000000000000000000000000000)))

(declare-fun lt!263887 () Unit!18109)

(assert (=> b!576841 (= lt!263887 lt!263885)))

(declare-fun res!364945 () Bool)

(assert (=> b!576841 (= res!364945 (= (seekEntryOrOpen!0 (select (arr!17263 a!3118) j!142) a!3118 mask!3119) (Found!5668 j!142)))))

(assert (=> b!576841 (=> (not res!364945) (not e!331863))))

(assert (= (and d!85517 (not res!364944)) b!576839))

(assert (= (and b!576839 c!66314) b!576841))

(assert (= (and b!576839 (not c!66314)) b!576840))

(assert (= (and b!576841 res!364945) b!576838))

(assert (= (or b!576838 b!576840) bm!32733))

(assert (=> b!576839 m!555865))

(assert (=> b!576839 m!555865))

(assert (=> b!576839 m!555881))

(declare-fun m!555989 () Bool)

(assert (=> bm!32733 m!555989))

(assert (=> b!576841 m!555865))

(declare-fun m!555991 () Bool)

(assert (=> b!576841 m!555991))

(declare-fun m!555993 () Bool)

(assert (=> b!576841 m!555993))

(assert (=> b!576841 m!555865))

(assert (=> b!576841 m!555867))

(assert (=> b!576744 d!85517))

(declare-fun d!85521 () Bool)

(assert (=> d!85521 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263905 () Unit!18109)

(declare-fun choose!38 (array!35967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18109)

(assert (=> d!85521 (= lt!263905 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85521 (validMask!0 mask!3119)))

(assert (=> d!85521 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263905)))

(declare-fun bs!17837 () Bool)

(assert (= bs!17837 d!85521))

(assert (=> bs!17837 m!555869))

(declare-fun m!556005 () Bool)

(assert (=> bs!17837 m!556005))

(assert (=> bs!17837 m!555895))

(assert (=> b!576744 d!85521))

(declare-fun b!576900 () Bool)

(declare-fun e!331901 () Bool)

(declare-fun e!331902 () Bool)

(assert (=> b!576900 (= e!331901 e!331902)))

(declare-fun c!66338 () Bool)

(assert (=> b!576900 (= c!66338 (validKeyInArray!0 (select (arr!17263 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576902 () Bool)

(declare-fun e!331899 () Bool)

(declare-fun contains!2869 (List!11250 (_ BitVec 64)) Bool)

(assert (=> b!576902 (= e!331899 (contains!2869 Nil!11247 (select (arr!17263 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32739 () Bool)

(declare-fun call!32742 () Bool)

(assert (=> bm!32739 (= call!32742 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66338 (Cons!11246 (select (arr!17263 a!3118) #b00000000000000000000000000000000) Nil!11247) Nil!11247)))))

(declare-fun b!576903 () Bool)

(assert (=> b!576903 (= e!331902 call!32742)))

(declare-fun b!576904 () Bool)

(declare-fun e!331900 () Bool)

(assert (=> b!576904 (= e!331900 e!331901)))

(declare-fun res!364959 () Bool)

(assert (=> b!576904 (=> (not res!364959) (not e!331901))))

(assert (=> b!576904 (= res!364959 (not e!331899))))

(declare-fun res!364960 () Bool)

(assert (=> b!576904 (=> (not res!364960) (not e!331899))))

(assert (=> b!576904 (= res!364960 (validKeyInArray!0 (select (arr!17263 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576901 () Bool)

(assert (=> b!576901 (= e!331902 call!32742)))

(declare-fun d!85523 () Bool)

(declare-fun res!364958 () Bool)

(assert (=> d!85523 (=> res!364958 e!331900)))

(assert (=> d!85523 (= res!364958 (bvsge #b00000000000000000000000000000000 (size!17627 a!3118)))))

(assert (=> d!85523 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11247) e!331900)))

(assert (= (and d!85523 (not res!364958)) b!576904))

(assert (= (and b!576904 res!364960) b!576902))

(assert (= (and b!576904 res!364959) b!576900))

(assert (= (and b!576900 c!66338) b!576901))

(assert (= (and b!576900 (not c!66338)) b!576903))

(assert (= (or b!576901 b!576903) bm!32739))

(declare-fun m!556029 () Bool)

(assert (=> b!576900 m!556029))

(assert (=> b!576900 m!556029))

(declare-fun m!556031 () Bool)

(assert (=> b!576900 m!556031))

(assert (=> b!576902 m!556029))

(assert (=> b!576902 m!556029))

(declare-fun m!556033 () Bool)

(assert (=> b!576902 m!556033))

(assert (=> bm!32739 m!556029))

(declare-fun m!556035 () Bool)

(assert (=> bm!32739 m!556035))

(assert (=> b!576904 m!556029))

(assert (=> b!576904 m!556029))

(assert (=> b!576904 m!556031))

(assert (=> b!576745 d!85523))

(declare-fun d!85531 () Bool)

(assert (=> d!85531 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52932 d!85531))

(declare-fun d!85547 () Bool)

(assert (=> d!85547 (= (array_inv!13122 a!3118) (bvsge (size!17627 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52932 d!85547))

(declare-fun b!576921 () Bool)

(declare-fun e!331914 () Bool)

(declare-fun call!32744 () Bool)

(assert (=> b!576921 (= e!331914 call!32744)))

(declare-fun d!85549 () Bool)

(declare-fun res!364963 () Bool)

(declare-fun e!331912 () Bool)

(assert (=> d!85549 (=> res!364963 e!331912)))

(assert (=> d!85549 (= res!364963 (bvsge #b00000000000000000000000000000000 (size!17627 a!3118)))))

(assert (=> d!85549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331912)))

(declare-fun b!576922 () Bool)

(declare-fun e!331913 () Bool)

(assert (=> b!576922 (= e!331912 e!331913)))

(declare-fun c!66346 () Bool)

(assert (=> b!576922 (= c!66346 (validKeyInArray!0 (select (arr!17263 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576923 () Bool)

(assert (=> b!576923 (= e!331913 call!32744)))

(declare-fun bm!32741 () Bool)

(assert (=> bm!32741 (= call!32744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576924 () Bool)

(assert (=> b!576924 (= e!331913 e!331914)))

(declare-fun lt!263931 () (_ BitVec 64))

(assert (=> b!576924 (= lt!263931 (select (arr!17263 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263930 () Unit!18109)

(assert (=> b!576924 (= lt!263930 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263931 #b00000000000000000000000000000000))))

(assert (=> b!576924 (arrayContainsKey!0 a!3118 lt!263931 #b00000000000000000000000000000000)))

(declare-fun lt!263932 () Unit!18109)

(assert (=> b!576924 (= lt!263932 lt!263930)))

(declare-fun res!364964 () Bool)

(assert (=> b!576924 (= res!364964 (= (seekEntryOrOpen!0 (select (arr!17263 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5668 #b00000000000000000000000000000000)))))

(assert (=> b!576924 (=> (not res!364964) (not e!331914))))

(assert (= (and d!85549 (not res!364963)) b!576922))

(assert (= (and b!576922 c!66346) b!576924))

(assert (= (and b!576922 (not c!66346)) b!576923))

(assert (= (and b!576924 res!364964) b!576921))

(assert (= (or b!576921 b!576923) bm!32741))

(assert (=> b!576922 m!556029))

(assert (=> b!576922 m!556029))

(assert (=> b!576922 m!556031))

(declare-fun m!556077 () Bool)

(assert (=> bm!32741 m!556077))

(assert (=> b!576924 m!556029))

(declare-fun m!556079 () Bool)

(assert (=> b!576924 m!556079))

(declare-fun m!556081 () Bool)

(assert (=> b!576924 m!556081))

(assert (=> b!576924 m!556029))

(declare-fun m!556083 () Bool)

(assert (=> b!576924 m!556083))

(assert (=> b!576748 d!85549))

(declare-fun d!85551 () Bool)

(assert (=> d!85551 (= (validKeyInArray!0 (select (arr!17263 a!3118) j!142)) (and (not (= (select (arr!17263 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17263 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576743 d!85551))

(declare-fun d!85553 () Bool)

(declare-fun res!364984 () Bool)

(declare-fun e!331941 () Bool)

(assert (=> d!85553 (=> res!364984 e!331941)))

(assert (=> d!85553 (= res!364984 (= (select (arr!17263 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85553 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!331941)))

(declare-fun b!576962 () Bool)

(declare-fun e!331942 () Bool)

(assert (=> b!576962 (= e!331941 e!331942)))

(declare-fun res!364985 () Bool)

(assert (=> b!576962 (=> (not res!364985) (not e!331942))))

(assert (=> b!576962 (= res!364985 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17627 a!3118)))))

(declare-fun b!576963 () Bool)

(assert (=> b!576963 (= e!331942 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85553 (not res!364984)) b!576962))

(assert (= (and b!576962 res!364985) b!576963))

(assert (=> d!85553 m!556029))

(declare-fun m!556089 () Bool)

(assert (=> b!576963 m!556089))

(assert (=> b!576749 d!85553))

(declare-fun b!576964 () Bool)

(declare-fun e!331945 () SeekEntryResult!5668)

(declare-fun e!331943 () SeekEntryResult!5668)

(assert (=> b!576964 (= e!331945 e!331943)))

(declare-fun lt!263939 () (_ BitVec 64))

(declare-fun lt!263937 () SeekEntryResult!5668)

(assert (=> b!576964 (= lt!263939 (select (arr!17263 a!3118) (index!24901 lt!263937)))))

(declare-fun c!66358 () Bool)

(assert (=> b!576964 (= c!66358 (= lt!263939 k0!1914))))

(declare-fun b!576965 () Bool)

(assert (=> b!576965 (= e!331945 Undefined!5668)))

(declare-fun b!576966 () Bool)

(declare-fun e!331944 () SeekEntryResult!5668)

(assert (=> b!576966 (= e!331944 (MissingZero!5668 (index!24901 lt!263937)))))

(declare-fun d!85557 () Bool)

(declare-fun lt!263938 () SeekEntryResult!5668)

(assert (=> d!85557 (and (or ((_ is Undefined!5668) lt!263938) (not ((_ is Found!5668) lt!263938)) (and (bvsge (index!24900 lt!263938) #b00000000000000000000000000000000) (bvslt (index!24900 lt!263938) (size!17627 a!3118)))) (or ((_ is Undefined!5668) lt!263938) ((_ is Found!5668) lt!263938) (not ((_ is MissingZero!5668) lt!263938)) (and (bvsge (index!24899 lt!263938) #b00000000000000000000000000000000) (bvslt (index!24899 lt!263938) (size!17627 a!3118)))) (or ((_ is Undefined!5668) lt!263938) ((_ is Found!5668) lt!263938) ((_ is MissingZero!5668) lt!263938) (not ((_ is MissingVacant!5668) lt!263938)) (and (bvsge (index!24902 lt!263938) #b00000000000000000000000000000000) (bvslt (index!24902 lt!263938) (size!17627 a!3118)))) (or ((_ is Undefined!5668) lt!263938) (ite ((_ is Found!5668) lt!263938) (= (select (arr!17263 a!3118) (index!24900 lt!263938)) k0!1914) (ite ((_ is MissingZero!5668) lt!263938) (= (select (arr!17263 a!3118) (index!24899 lt!263938)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5668) lt!263938) (= (select (arr!17263 a!3118) (index!24902 lt!263938)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85557 (= lt!263938 e!331945)))

(declare-fun c!66356 () Bool)

(assert (=> d!85557 (= c!66356 (and ((_ is Intermediate!5668) lt!263937) (undefined!6480 lt!263937)))))

(assert (=> d!85557 (= lt!263937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85557 (validMask!0 mask!3119)))

(assert (=> d!85557 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!263938)))

(declare-fun b!576967 () Bool)

(declare-fun c!66357 () Bool)

(assert (=> b!576967 (= c!66357 (= lt!263939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576967 (= e!331943 e!331944)))

(declare-fun b!576968 () Bool)

(assert (=> b!576968 (= e!331943 (Found!5668 (index!24901 lt!263937)))))

(declare-fun b!576969 () Bool)

(assert (=> b!576969 (= e!331944 (seekKeyOrZeroReturnVacant!0 (x!53942 lt!263937) (index!24901 lt!263937) (index!24901 lt!263937) k0!1914 a!3118 mask!3119))))

(assert (= (and d!85557 c!66356) b!576965))

(assert (= (and d!85557 (not c!66356)) b!576964))

(assert (= (and b!576964 c!66358) b!576968))

(assert (= (and b!576964 (not c!66358)) b!576967))

(assert (= (and b!576967 c!66357) b!576966))

(assert (= (and b!576967 (not c!66357)) b!576969))

(declare-fun m!556091 () Bool)

(assert (=> b!576964 m!556091))

(declare-fun m!556093 () Bool)

(assert (=> d!85557 m!556093))

(declare-fun m!556095 () Bool)

(assert (=> d!85557 m!556095))

(declare-fun m!556097 () Bool)

(assert (=> d!85557 m!556097))

(assert (=> d!85557 m!556093))

(assert (=> d!85557 m!555895))

(declare-fun m!556099 () Bool)

(assert (=> d!85557 m!556099))

(declare-fun m!556101 () Bool)

(assert (=> d!85557 m!556101))

(declare-fun m!556103 () Bool)

(assert (=> b!576969 m!556103))

(assert (=> b!576747 d!85557))

(declare-fun b!576970 () Bool)

(declare-fun e!331948 () SeekEntryResult!5668)

(declare-fun e!331946 () SeekEntryResult!5668)

(assert (=> b!576970 (= e!331948 e!331946)))

(declare-fun lt!263942 () (_ BitVec 64))

(declare-fun lt!263940 () SeekEntryResult!5668)

(assert (=> b!576970 (= lt!263942 (select (arr!17263 lt!263813) (index!24901 lt!263940)))))

(declare-fun c!66361 () Bool)

(assert (=> b!576970 (= c!66361 (= lt!263942 lt!263807))))

(declare-fun b!576971 () Bool)

(assert (=> b!576971 (= e!331948 Undefined!5668)))

(declare-fun b!576972 () Bool)

(declare-fun e!331947 () SeekEntryResult!5668)

(assert (=> b!576972 (= e!331947 (MissingZero!5668 (index!24901 lt!263940)))))

(declare-fun d!85559 () Bool)

(declare-fun lt!263941 () SeekEntryResult!5668)

(assert (=> d!85559 (and (or ((_ is Undefined!5668) lt!263941) (not ((_ is Found!5668) lt!263941)) (and (bvsge (index!24900 lt!263941) #b00000000000000000000000000000000) (bvslt (index!24900 lt!263941) (size!17627 lt!263813)))) (or ((_ is Undefined!5668) lt!263941) ((_ is Found!5668) lt!263941) (not ((_ is MissingZero!5668) lt!263941)) (and (bvsge (index!24899 lt!263941) #b00000000000000000000000000000000) (bvslt (index!24899 lt!263941) (size!17627 lt!263813)))) (or ((_ is Undefined!5668) lt!263941) ((_ is Found!5668) lt!263941) ((_ is MissingZero!5668) lt!263941) (not ((_ is MissingVacant!5668) lt!263941)) (and (bvsge (index!24902 lt!263941) #b00000000000000000000000000000000) (bvslt (index!24902 lt!263941) (size!17627 lt!263813)))) (or ((_ is Undefined!5668) lt!263941) (ite ((_ is Found!5668) lt!263941) (= (select (arr!17263 lt!263813) (index!24900 lt!263941)) lt!263807) (ite ((_ is MissingZero!5668) lt!263941) (= (select (arr!17263 lt!263813) (index!24899 lt!263941)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5668) lt!263941) (= (select (arr!17263 lt!263813) (index!24902 lt!263941)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85559 (= lt!263941 e!331948)))

(declare-fun c!66359 () Bool)

(assert (=> d!85559 (= c!66359 (and ((_ is Intermediate!5668) lt!263940) (undefined!6480 lt!263940)))))

(assert (=> d!85559 (= lt!263940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!263807 mask!3119) lt!263807 lt!263813 mask!3119))))

(assert (=> d!85559 (validMask!0 mask!3119)))

(assert (=> d!85559 (= (seekEntryOrOpen!0 lt!263807 lt!263813 mask!3119) lt!263941)))

(declare-fun b!576973 () Bool)

(declare-fun c!66360 () Bool)

(assert (=> b!576973 (= c!66360 (= lt!263942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576973 (= e!331946 e!331947)))

(declare-fun b!576974 () Bool)

(assert (=> b!576974 (= e!331946 (Found!5668 (index!24901 lt!263940)))))

(declare-fun b!576975 () Bool)

(assert (=> b!576975 (= e!331947 (seekKeyOrZeroReturnVacant!0 (x!53942 lt!263940) (index!24901 lt!263940) (index!24901 lt!263940) lt!263807 lt!263813 mask!3119))))

(assert (= (and d!85559 c!66359) b!576971))

(assert (= (and d!85559 (not c!66359)) b!576970))

(assert (= (and b!576970 c!66361) b!576974))

(assert (= (and b!576970 (not c!66361)) b!576973))

(assert (= (and b!576973 c!66360) b!576972))

(assert (= (and b!576973 (not c!66360)) b!576975))

(declare-fun m!556105 () Bool)

(assert (=> b!576970 m!556105))

(assert (=> d!85559 m!555887))

(declare-fun m!556107 () Bool)

(assert (=> d!85559 m!556107))

(declare-fun m!556109 () Bool)

(assert (=> d!85559 m!556109))

(assert (=> d!85559 m!555887))

(assert (=> d!85559 m!555895))

(declare-fun m!556111 () Bool)

(assert (=> d!85559 m!556111))

(declare-fun m!556113 () Bool)

(assert (=> d!85559 m!556113))

(declare-fun m!556115 () Bool)

(assert (=> b!576975 m!556115))

(assert (=> b!576742 d!85559))

(declare-fun b!577075 () Bool)

(declare-fun lt!263975 () SeekEntryResult!5668)

(assert (=> b!577075 (and (bvsge (index!24901 lt!263975) #b00000000000000000000000000000000) (bvslt (index!24901 lt!263975) (size!17627 lt!263813)))))

(declare-fun res!365035 () Bool)

(assert (=> b!577075 (= res!365035 (= (select (arr!17263 lt!263813) (index!24901 lt!263975)) lt!263807))))

(declare-fun e!332017 () Bool)

(assert (=> b!577075 (=> res!365035 e!332017)))

(declare-fun e!332014 () Bool)

(assert (=> b!577075 (= e!332014 e!332017)))

(declare-fun b!577076 () Bool)

(declare-fun e!332015 () SeekEntryResult!5668)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!577076 (= e!332015 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263808 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!263807 lt!263813 mask!3119))))

(declare-fun b!577077 () Bool)

(declare-fun e!332016 () SeekEntryResult!5668)

(assert (=> b!577077 (= e!332016 (Intermediate!5668 true lt!263808 #b00000000000000000000000000000000))))

(declare-fun d!85561 () Bool)

(declare-fun e!332013 () Bool)

(assert (=> d!85561 e!332013))

(declare-fun c!66389 () Bool)

(assert (=> d!85561 (= c!66389 (and ((_ is Intermediate!5668) lt!263975) (undefined!6480 lt!263975)))))

(assert (=> d!85561 (= lt!263975 e!332016)))

(declare-fun c!66390 () Bool)

(assert (=> d!85561 (= c!66390 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263976 () (_ BitVec 64))

(assert (=> d!85561 (= lt!263976 (select (arr!17263 lt!263813) lt!263808))))

(assert (=> d!85561 (validMask!0 mask!3119)))

(assert (=> d!85561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263808 lt!263807 lt!263813 mask!3119) lt!263975)))

(declare-fun b!577078 () Bool)

(assert (=> b!577078 (= e!332016 e!332015)))

(declare-fun c!66391 () Bool)

(assert (=> b!577078 (= c!66391 (or (= lt!263976 lt!263807) (= (bvadd lt!263976 lt!263976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!577079 () Bool)

(assert (=> b!577079 (= e!332015 (Intermediate!5668 false lt!263808 #b00000000000000000000000000000000))))

(declare-fun b!577080 () Bool)

(assert (=> b!577080 (and (bvsge (index!24901 lt!263975) #b00000000000000000000000000000000) (bvslt (index!24901 lt!263975) (size!17627 lt!263813)))))

(declare-fun res!365033 () Bool)

(assert (=> b!577080 (= res!365033 (= (select (arr!17263 lt!263813) (index!24901 lt!263975)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577080 (=> res!365033 e!332017)))

(declare-fun b!577081 () Bool)

(assert (=> b!577081 (= e!332013 (bvsge (x!53942 lt!263975) #b01111111111111111111111111111110))))

(declare-fun b!577082 () Bool)

(assert (=> b!577082 (and (bvsge (index!24901 lt!263975) #b00000000000000000000000000000000) (bvslt (index!24901 lt!263975) (size!17627 lt!263813)))))

(assert (=> b!577082 (= e!332017 (= (select (arr!17263 lt!263813) (index!24901 lt!263975)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577083 () Bool)

(assert (=> b!577083 (= e!332013 e!332014)))

(declare-fun res!365034 () Bool)

(assert (=> b!577083 (= res!365034 (and ((_ is Intermediate!5668) lt!263975) (not (undefined!6480 lt!263975)) (bvslt (x!53942 lt!263975) #b01111111111111111111111111111110) (bvsge (x!53942 lt!263975) #b00000000000000000000000000000000) (bvsge (x!53942 lt!263975) #b00000000000000000000000000000000)))))

(assert (=> b!577083 (=> (not res!365034) (not e!332014))))

(assert (= (and d!85561 c!66390) b!577077))

(assert (= (and d!85561 (not c!66390)) b!577078))

(assert (= (and b!577078 c!66391) b!577079))

(assert (= (and b!577078 (not c!66391)) b!577076))

(assert (= (and d!85561 c!66389) b!577081))

(assert (= (and d!85561 (not c!66389)) b!577083))

(assert (= (and b!577083 res!365034) b!577075))

(assert (= (and b!577075 (not res!365035)) b!577080))

(assert (= (and b!577080 (not res!365033)) b!577082))

(declare-fun m!556161 () Bool)

(assert (=> b!577082 m!556161))

(declare-fun m!556163 () Bool)

(assert (=> b!577076 m!556163))

(assert (=> b!577076 m!556163))

(declare-fun m!556165 () Bool)

(assert (=> b!577076 m!556165))

(declare-fun m!556167 () Bool)

(assert (=> d!85561 m!556167))

(assert (=> d!85561 m!555895))

(assert (=> b!577080 m!556161))

(assert (=> b!577075 m!556161))

(assert (=> b!576751 d!85561))

(declare-fun b!577084 () Bool)

(declare-fun lt!263977 () SeekEntryResult!5668)

(assert (=> b!577084 (and (bvsge (index!24901 lt!263977) #b00000000000000000000000000000000) (bvslt (index!24901 lt!263977) (size!17627 a!3118)))))

(declare-fun res!365038 () Bool)

(assert (=> b!577084 (= res!365038 (= (select (arr!17263 a!3118) (index!24901 lt!263977)) (select (arr!17263 a!3118) j!142)))))

(declare-fun e!332022 () Bool)

(assert (=> b!577084 (=> res!365038 e!332022)))

(declare-fun e!332019 () Bool)

(assert (=> b!577084 (= e!332019 e!332022)))

(declare-fun b!577085 () Bool)

(declare-fun e!332020 () SeekEntryResult!5668)

(assert (=> b!577085 (= e!332020 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263811 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17263 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!577086 () Bool)

(declare-fun e!332021 () SeekEntryResult!5668)

(assert (=> b!577086 (= e!332021 (Intermediate!5668 true lt!263811 #b00000000000000000000000000000000))))

(declare-fun d!85589 () Bool)

(declare-fun e!332018 () Bool)

(assert (=> d!85589 e!332018))

(declare-fun c!66392 () Bool)

(assert (=> d!85589 (= c!66392 (and ((_ is Intermediate!5668) lt!263977) (undefined!6480 lt!263977)))))

(assert (=> d!85589 (= lt!263977 e!332021)))

(declare-fun c!66393 () Bool)

(assert (=> d!85589 (= c!66393 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263978 () (_ BitVec 64))

(assert (=> d!85589 (= lt!263978 (select (arr!17263 a!3118) lt!263811))))

(assert (=> d!85589 (validMask!0 mask!3119)))

(assert (=> d!85589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263811 (select (arr!17263 a!3118) j!142) a!3118 mask!3119) lt!263977)))

(declare-fun b!577087 () Bool)

(assert (=> b!577087 (= e!332021 e!332020)))

(declare-fun c!66394 () Bool)

(assert (=> b!577087 (= c!66394 (or (= lt!263978 (select (arr!17263 a!3118) j!142)) (= (bvadd lt!263978 lt!263978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!577088 () Bool)

(assert (=> b!577088 (= e!332020 (Intermediate!5668 false lt!263811 #b00000000000000000000000000000000))))

(declare-fun b!577089 () Bool)

(assert (=> b!577089 (and (bvsge (index!24901 lt!263977) #b00000000000000000000000000000000) (bvslt (index!24901 lt!263977) (size!17627 a!3118)))))

(declare-fun res!365036 () Bool)

(assert (=> b!577089 (= res!365036 (= (select (arr!17263 a!3118) (index!24901 lt!263977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577089 (=> res!365036 e!332022)))

(declare-fun b!577090 () Bool)

(assert (=> b!577090 (= e!332018 (bvsge (x!53942 lt!263977) #b01111111111111111111111111111110))))

(declare-fun b!577091 () Bool)

(assert (=> b!577091 (and (bvsge (index!24901 lt!263977) #b00000000000000000000000000000000) (bvslt (index!24901 lt!263977) (size!17627 a!3118)))))

(assert (=> b!577091 (= e!332022 (= (select (arr!17263 a!3118) (index!24901 lt!263977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577092 () Bool)

(assert (=> b!577092 (= e!332018 e!332019)))

(declare-fun res!365037 () Bool)

(assert (=> b!577092 (= res!365037 (and ((_ is Intermediate!5668) lt!263977) (not (undefined!6480 lt!263977)) (bvslt (x!53942 lt!263977) #b01111111111111111111111111111110) (bvsge (x!53942 lt!263977) #b00000000000000000000000000000000) (bvsge (x!53942 lt!263977) #b00000000000000000000000000000000)))))

(assert (=> b!577092 (=> (not res!365037) (not e!332019))))

(assert (= (and d!85589 c!66393) b!577086))

(assert (= (and d!85589 (not c!66393)) b!577087))

(assert (= (and b!577087 c!66394) b!577088))

(assert (= (and b!577087 (not c!66394)) b!577085))

(assert (= (and d!85589 c!66392) b!577090))

(assert (= (and d!85589 (not c!66392)) b!577092))

(assert (= (and b!577092 res!365037) b!577084))

(assert (= (and b!577084 (not res!365038)) b!577089))

(assert (= (and b!577089 (not res!365036)) b!577091))

(declare-fun m!556169 () Bool)

(assert (=> b!577091 m!556169))

(declare-fun m!556171 () Bool)

(assert (=> b!577085 m!556171))

(assert (=> b!577085 m!556171))

(assert (=> b!577085 m!555865))

(declare-fun m!556173 () Bool)

(assert (=> b!577085 m!556173))

(declare-fun m!556175 () Bool)

(assert (=> d!85589 m!556175))

(assert (=> d!85589 m!555895))

(assert (=> b!577089 m!556169))

(assert (=> b!577084 m!556169))

(assert (=> b!576751 d!85589))

(declare-fun d!85591 () Bool)

(declare-fun lt!263984 () (_ BitVec 32))

(declare-fun lt!263983 () (_ BitVec 32))

(assert (=> d!85591 (= lt!263984 (bvmul (bvxor lt!263983 (bvlshr lt!263983 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85591 (= lt!263983 ((_ extract 31 0) (bvand (bvxor lt!263807 (bvlshr lt!263807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85591 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!365039 (let ((h!12296 ((_ extract 31 0) (bvand (bvxor lt!263807 (bvlshr lt!263807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53950 (bvmul (bvxor h!12296 (bvlshr h!12296 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53950 (bvlshr x!53950 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!365039 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!365039 #b00000000000000000000000000000000))))))

(assert (=> d!85591 (= (toIndex!0 lt!263807 mask!3119) (bvand (bvxor lt!263984 (bvlshr lt!263984 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576751 d!85591))

(declare-fun d!85593 () Bool)

(declare-fun lt!263986 () (_ BitVec 32))

(declare-fun lt!263985 () (_ BitVec 32))

(assert (=> d!85593 (= lt!263986 (bvmul (bvxor lt!263985 (bvlshr lt!263985 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85593 (= lt!263985 ((_ extract 31 0) (bvand (bvxor (select (arr!17263 a!3118) j!142) (bvlshr (select (arr!17263 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85593 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!365039 (let ((h!12296 ((_ extract 31 0) (bvand (bvxor (select (arr!17263 a!3118) j!142) (bvlshr (select (arr!17263 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53950 (bvmul (bvxor h!12296 (bvlshr h!12296 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53950 (bvlshr x!53950 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!365039 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!365039 #b00000000000000000000000000000000))))))

(assert (=> d!85593 (= (toIndex!0 (select (arr!17263 a!3118) j!142) mask!3119) (bvand (bvxor lt!263986 (bvlshr lt!263986 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576751 d!85593))

(declare-fun d!85595 () Bool)

(assert (=> d!85595 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576746 d!85595))

(check-sat (not b!576969) (not b!576975) (not b!576922) (not b!576841) (not b!576963) (not b!576902) (not b!576904) (not d!85589) (not d!85559) (not b!577076) (not b!576924) (not d!85561) (not b!576829) (not d!85557) (not b!576900) (not b!576839) (not d!85513) (not bm!32741) (not bm!32739) (not d!85521) (not bm!32733) (not b!577085))
(check-sat)
