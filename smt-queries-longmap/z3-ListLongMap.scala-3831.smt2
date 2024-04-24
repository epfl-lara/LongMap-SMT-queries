; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52584 () Bool)

(assert start!52584)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5623 0))(
  ( (MissingZero!5623 (index!24719 (_ BitVec 32))) (Found!5623 (index!24720 (_ BitVec 32))) (Intermediate!5623 (undefined!6435 Bool) (index!24721 (_ BitVec 32)) (x!53744 (_ BitVec 32))) (Undefined!5623) (MissingVacant!5623 (index!24722 (_ BitVec 32))) )
))
(declare-fun lt!262021 () SeekEntryResult!5623)

(declare-fun b!573748 () Bool)

(declare-fun lt!262016 () (_ BitVec 64))

(declare-datatypes ((array!35865 0))(
  ( (array!35866 (arr!17218 (Array (_ BitVec 32) (_ BitVec 64))) (size!17582 (_ BitVec 32))) )
))
(declare-fun lt!262019 () array!35865)

(declare-fun e!330088 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35865 (_ BitVec 32)) SeekEntryResult!5623)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35865 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!573748 (= e!330088 (= (seekEntryOrOpen!0 lt!262016 lt!262019 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262021) (index!24721 lt!262021) (index!24721 lt!262021) lt!262016 lt!262019 mask!3119)))))

(declare-fun b!573749 () Bool)

(declare-fun res!362886 () Bool)

(declare-fun e!330083 () Bool)

(assert (=> b!573749 (=> (not res!362886) (not e!330083))))

(declare-fun a!3118 () array!35865)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35865 (_ BitVec 32)) Bool)

(assert (=> b!573749 (= res!362886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573751 () Bool)

(declare-fun res!362883 () Bool)

(declare-fun e!330084 () Bool)

(assert (=> b!573751 (=> (not res!362883) (not e!330084))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573751 (= res!362883 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573752 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!330090 () Bool)

(get-info :version)

(assert (=> b!573752 (= e!330090 (not (or (undefined!6435 lt!262021) (not ((_ is Intermediate!5623) lt!262021)) (let ((bdg!17977 (select (arr!17218 a!3118) (index!24721 lt!262021)))) (or (= bdg!17977 (select (arr!17218 a!3118) j!142)) (= bdg!17977 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24721 lt!262021) #b00000000000000000000000000000000) (bvsge (index!24721 lt!262021) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!53744 lt!262021) #b01111111111111111111111111111110) (bvsge (x!53744 lt!262021) #b00000000000000000000000000000000)))))))))

(declare-fun e!330086 () Bool)

(assert (=> b!573752 e!330086))

(declare-fun res!362878 () Bool)

(assert (=> b!573752 (=> (not res!362878) (not e!330086))))

(declare-fun lt!262017 () SeekEntryResult!5623)

(assert (=> b!573752 (= res!362878 (= lt!262017 (Found!5623 j!142)))))

(assert (=> b!573752 (= lt!262017 (seekEntryOrOpen!0 (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!573752 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18019 0))(
  ( (Unit!18020) )
))
(declare-fun lt!262014 () Unit!18019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18019)

(assert (=> b!573752 (= lt!262014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573753 () Bool)

(declare-fun res!362885 () Bool)

(assert (=> b!573753 (=> (not res!362885) (not e!330083))))

(declare-datatypes ((List!11205 0))(
  ( (Nil!11202) (Cons!11201 (h!12234 (_ BitVec 64)) (t!17425 List!11205)) )
))
(declare-fun arrayNoDuplicates!0 (array!35865 (_ BitVec 32) List!11205) Bool)

(assert (=> b!573753 (= res!362885 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11202))))

(declare-fun b!573754 () Bool)

(declare-fun res!362879 () Bool)

(assert (=> b!573754 (=> (not res!362879) (not e!330084))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573754 (= res!362879 (and (= (size!17582 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17582 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17582 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573755 () Bool)

(assert (=> b!573755 (= e!330084 e!330083)))

(declare-fun res!362880 () Bool)

(assert (=> b!573755 (=> (not res!362880) (not e!330083))))

(declare-fun lt!262018 () SeekEntryResult!5623)

(assert (=> b!573755 (= res!362880 (or (= lt!262018 (MissingZero!5623 i!1132)) (= lt!262018 (MissingVacant!5623 i!1132))))))

(assert (=> b!573755 (= lt!262018 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573756 () Bool)

(declare-fun e!330085 () Bool)

(assert (=> b!573756 (= e!330085 e!330088)))

(declare-fun res!362884 () Bool)

(assert (=> b!573756 (=> (not res!362884) (not e!330088))))

(assert (=> b!573756 (= res!362884 (= lt!262017 (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262021) (index!24721 lt!262021) (index!24721 lt!262021) (select (arr!17218 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573750 () Bool)

(assert (=> b!573750 (= e!330083 e!330090)))

(declare-fun res!362888 () Bool)

(assert (=> b!573750 (=> (not res!362888) (not e!330090))))

(declare-fun lt!262015 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35865 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!573750 (= res!362888 (= lt!262021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262015 lt!262016 lt!262019 mask!3119)))))

(declare-fun lt!262020 () (_ BitVec 32))

(assert (=> b!573750 (= lt!262021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262020 (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573750 (= lt!262015 (toIndex!0 lt!262016 mask!3119))))

(assert (=> b!573750 (= lt!262016 (select (store (arr!17218 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573750 (= lt!262020 (toIndex!0 (select (arr!17218 a!3118) j!142) mask!3119))))

(assert (=> b!573750 (= lt!262019 (array!35866 (store (arr!17218 a!3118) i!1132 k0!1914) (size!17582 a!3118)))))

(declare-fun res!362881 () Bool)

(assert (=> start!52584 (=> (not res!362881) (not e!330084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52584 (= res!362881 (validMask!0 mask!3119))))

(assert (=> start!52584 e!330084))

(assert (=> start!52584 true))

(declare-fun array_inv!13077 (array!35865) Bool)

(assert (=> start!52584 (array_inv!13077 a!3118)))

(declare-fun b!573757 () Bool)

(declare-fun res!362890 () Bool)

(assert (=> b!573757 (=> (not res!362890) (not e!330084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573757 (= res!362890 (validKeyInArray!0 (select (arr!17218 a!3118) j!142)))))

(declare-fun b!573758 () Bool)

(declare-fun e!330089 () Bool)

(assert (=> b!573758 (= e!330089 e!330085)))

(declare-fun res!362887 () Bool)

(assert (=> b!573758 (=> res!362887 e!330085)))

(declare-fun lt!262013 () (_ BitVec 64))

(assert (=> b!573758 (= res!362887 (or (= lt!262013 (select (arr!17218 a!3118) j!142)) (= lt!262013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573758 (= lt!262013 (select (arr!17218 a!3118) (index!24721 lt!262021)))))

(declare-fun b!573759 () Bool)

(declare-fun res!362889 () Bool)

(assert (=> b!573759 (=> (not res!362889) (not e!330084))))

(assert (=> b!573759 (= res!362889 (validKeyInArray!0 k0!1914))))

(declare-fun b!573760 () Bool)

(assert (=> b!573760 (= e!330086 e!330089)))

(declare-fun res!362882 () Bool)

(assert (=> b!573760 (=> res!362882 e!330089)))

(assert (=> b!573760 (= res!362882 (or (undefined!6435 lt!262021) (not ((_ is Intermediate!5623) lt!262021))))))

(assert (= (and start!52584 res!362881) b!573754))

(assert (= (and b!573754 res!362879) b!573757))

(assert (= (and b!573757 res!362890) b!573759))

(assert (= (and b!573759 res!362889) b!573751))

(assert (= (and b!573751 res!362883) b!573755))

(assert (= (and b!573755 res!362880) b!573749))

(assert (= (and b!573749 res!362886) b!573753))

(assert (= (and b!573753 res!362885) b!573750))

(assert (= (and b!573750 res!362888) b!573752))

(assert (= (and b!573752 res!362878) b!573760))

(assert (= (and b!573760 (not res!362882)) b!573758))

(assert (= (and b!573758 (not res!362887)) b!573756))

(assert (= (and b!573756 res!362884) b!573748))

(declare-fun m!552863 () Bool)

(assert (=> start!52584 m!552863))

(declare-fun m!552865 () Bool)

(assert (=> start!52584 m!552865))

(declare-fun m!552867 () Bool)

(assert (=> b!573759 m!552867))

(declare-fun m!552869 () Bool)

(assert (=> b!573752 m!552869))

(declare-fun m!552871 () Bool)

(assert (=> b!573752 m!552871))

(declare-fun m!552873 () Bool)

(assert (=> b!573752 m!552873))

(declare-fun m!552875 () Bool)

(assert (=> b!573752 m!552875))

(assert (=> b!573752 m!552871))

(declare-fun m!552877 () Bool)

(assert (=> b!573752 m!552877))

(assert (=> b!573757 m!552871))

(assert (=> b!573757 m!552871))

(declare-fun m!552879 () Bool)

(assert (=> b!573757 m!552879))

(declare-fun m!552881 () Bool)

(assert (=> b!573749 m!552881))

(declare-fun m!552883 () Bool)

(assert (=> b!573753 m!552883))

(declare-fun m!552885 () Bool)

(assert (=> b!573755 m!552885))

(assert (=> b!573750 m!552871))

(declare-fun m!552887 () Bool)

(assert (=> b!573750 m!552887))

(assert (=> b!573750 m!552871))

(declare-fun m!552889 () Bool)

(assert (=> b!573750 m!552889))

(declare-fun m!552891 () Bool)

(assert (=> b!573750 m!552891))

(declare-fun m!552893 () Bool)

(assert (=> b!573750 m!552893))

(declare-fun m!552895 () Bool)

(assert (=> b!573750 m!552895))

(assert (=> b!573750 m!552871))

(declare-fun m!552897 () Bool)

(assert (=> b!573750 m!552897))

(declare-fun m!552899 () Bool)

(assert (=> b!573751 m!552899))

(declare-fun m!552901 () Bool)

(assert (=> b!573748 m!552901))

(declare-fun m!552903 () Bool)

(assert (=> b!573748 m!552903))

(assert (=> b!573758 m!552871))

(assert (=> b!573758 m!552869))

(assert (=> b!573756 m!552871))

(assert (=> b!573756 m!552871))

(declare-fun m!552905 () Bool)

(assert (=> b!573756 m!552905))

(check-sat (not b!573759) (not b!573757) (not b!573748) (not b!573753) (not b!573749) (not b!573751) (not start!52584) (not b!573755) (not b!573750) (not b!573752) (not b!573756))
(check-sat)
(get-model)

(declare-fun b!573852 () Bool)

(declare-fun e!330146 () SeekEntryResult!5623)

(assert (=> b!573852 (= e!330146 Undefined!5623)))

(declare-fun b!573853 () Bool)

(declare-fun c!65803 () Bool)

(declare-fun lt!262082 () (_ BitVec 64))

(assert (=> b!573853 (= c!65803 (= lt!262082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330147 () SeekEntryResult!5623)

(declare-fun e!330145 () SeekEntryResult!5623)

(assert (=> b!573853 (= e!330147 e!330145)))

(declare-fun b!573854 () Bool)

(declare-fun lt!262084 () SeekEntryResult!5623)

(assert (=> b!573854 (= e!330147 (Found!5623 (index!24721 lt!262084)))))

(declare-fun b!573855 () Bool)

(assert (=> b!573855 (= e!330146 e!330147)))

(assert (=> b!573855 (= lt!262082 (select (arr!17218 a!3118) (index!24721 lt!262084)))))

(declare-fun c!65804 () Bool)

(assert (=> b!573855 (= c!65804 (= lt!262082 (select (arr!17218 a!3118) j!142)))))

(declare-fun b!573856 () Bool)

(assert (=> b!573856 (= e!330145 (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262084) (index!24721 lt!262084) (index!24721 lt!262084) (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85069 () Bool)

(declare-fun lt!262083 () SeekEntryResult!5623)

(assert (=> d!85069 (and (or ((_ is Undefined!5623) lt!262083) (not ((_ is Found!5623) lt!262083)) (and (bvsge (index!24720 lt!262083) #b00000000000000000000000000000000) (bvslt (index!24720 lt!262083) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262083) ((_ is Found!5623) lt!262083) (not ((_ is MissingZero!5623) lt!262083)) (and (bvsge (index!24719 lt!262083) #b00000000000000000000000000000000) (bvslt (index!24719 lt!262083) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262083) ((_ is Found!5623) lt!262083) ((_ is MissingZero!5623) lt!262083) (not ((_ is MissingVacant!5623) lt!262083)) (and (bvsge (index!24722 lt!262083) #b00000000000000000000000000000000) (bvslt (index!24722 lt!262083) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262083) (ite ((_ is Found!5623) lt!262083) (= (select (arr!17218 a!3118) (index!24720 lt!262083)) (select (arr!17218 a!3118) j!142)) (ite ((_ is MissingZero!5623) lt!262083) (= (select (arr!17218 a!3118) (index!24719 lt!262083)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5623) lt!262083) (= (select (arr!17218 a!3118) (index!24722 lt!262083)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85069 (= lt!262083 e!330146)))

(declare-fun c!65802 () Bool)

(assert (=> d!85069 (= c!65802 (and ((_ is Intermediate!5623) lt!262084) (undefined!6435 lt!262084)))))

(assert (=> d!85069 (= lt!262084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17218 a!3118) j!142) mask!3119) (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85069 (validMask!0 mask!3119)))

(assert (=> d!85069 (= (seekEntryOrOpen!0 (select (arr!17218 a!3118) j!142) a!3118 mask!3119) lt!262083)))

(declare-fun b!573851 () Bool)

(assert (=> b!573851 (= e!330145 (MissingZero!5623 (index!24721 lt!262084)))))

(assert (= (and d!85069 c!65802) b!573852))

(assert (= (and d!85069 (not c!65802)) b!573855))

(assert (= (and b!573855 c!65804) b!573854))

(assert (= (and b!573855 (not c!65804)) b!573853))

(assert (= (and b!573853 c!65803) b!573851))

(assert (= (and b!573853 (not c!65803)) b!573856))

(declare-fun m!552995 () Bool)

(assert (=> b!573855 m!552995))

(assert (=> b!573856 m!552871))

(declare-fun m!552997 () Bool)

(assert (=> b!573856 m!552997))

(assert (=> d!85069 m!552897))

(assert (=> d!85069 m!552871))

(declare-fun m!552999 () Bool)

(assert (=> d!85069 m!552999))

(declare-fun m!553001 () Bool)

(assert (=> d!85069 m!553001))

(declare-fun m!553003 () Bool)

(assert (=> d!85069 m!553003))

(assert (=> d!85069 m!552871))

(assert (=> d!85069 m!552897))

(declare-fun m!553005 () Bool)

(assert (=> d!85069 m!553005))

(assert (=> d!85069 m!552863))

(assert (=> b!573752 d!85069))

(declare-fun call!32652 () Bool)

(declare-fun bm!32649 () Bool)

(assert (=> bm!32649 (= call!32652 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573878 () Bool)

(declare-fun e!330160 () Bool)

(assert (=> b!573878 (= e!330160 call!32652)))

(declare-fun b!573879 () Bool)

(declare-fun e!330162 () Bool)

(assert (=> b!573879 (= e!330162 e!330160)))

(declare-fun lt!262099 () (_ BitVec 64))

(assert (=> b!573879 (= lt!262099 (select (arr!17218 a!3118) j!142))))

(declare-fun lt!262098 () Unit!18019)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35865 (_ BitVec 64) (_ BitVec 32)) Unit!18019)

(assert (=> b!573879 (= lt!262098 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262099 j!142))))

(assert (=> b!573879 (arrayContainsKey!0 a!3118 lt!262099 #b00000000000000000000000000000000)))

(declare-fun lt!262097 () Unit!18019)

(assert (=> b!573879 (= lt!262097 lt!262098)))

(declare-fun res!362973 () Bool)

(assert (=> b!573879 (= res!362973 (= (seekEntryOrOpen!0 (select (arr!17218 a!3118) j!142) a!3118 mask!3119) (Found!5623 j!142)))))

(assert (=> b!573879 (=> (not res!362973) (not e!330160))))

(declare-fun b!573880 () Bool)

(assert (=> b!573880 (= e!330162 call!32652)))

(declare-fun b!573877 () Bool)

(declare-fun e!330161 () Bool)

(assert (=> b!573877 (= e!330161 e!330162)))

(declare-fun c!65813 () Bool)

(assert (=> b!573877 (= c!65813 (validKeyInArray!0 (select (arr!17218 a!3118) j!142)))))

(declare-fun d!85073 () Bool)

(declare-fun res!362974 () Bool)

(assert (=> d!85073 (=> res!362974 e!330161)))

(assert (=> d!85073 (= res!362974 (bvsge j!142 (size!17582 a!3118)))))

(assert (=> d!85073 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330161)))

(assert (= (and d!85073 (not res!362974)) b!573877))

(assert (= (and b!573877 c!65813) b!573879))

(assert (= (and b!573877 (not c!65813)) b!573880))

(assert (= (and b!573879 res!362973) b!573878))

(assert (= (or b!573878 b!573880) bm!32649))

(declare-fun m!553007 () Bool)

(assert (=> bm!32649 m!553007))

(assert (=> b!573879 m!552871))

(declare-fun m!553009 () Bool)

(assert (=> b!573879 m!553009))

(declare-fun m!553011 () Bool)

(assert (=> b!573879 m!553011))

(assert (=> b!573879 m!552871))

(assert (=> b!573879 m!552877))

(assert (=> b!573877 m!552871))

(assert (=> b!573877 m!552871))

(assert (=> b!573877 m!552879))

(assert (=> b!573752 d!85073))

(declare-fun d!85075 () Bool)

(assert (=> d!85075 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262105 () Unit!18019)

(declare-fun choose!38 (array!35865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18019)

(assert (=> d!85075 (= lt!262105 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85075 (validMask!0 mask!3119)))

(assert (=> d!85075 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262105)))

(declare-fun bs!17780 () Bool)

(assert (= bs!17780 d!85075))

(assert (=> bs!17780 m!552873))

(declare-fun m!553025 () Bool)

(assert (=> bs!17780 m!553025))

(assert (=> bs!17780 m!552863))

(assert (=> b!573752 d!85075))

(declare-fun d!85079 () Bool)

(assert (=> d!85079 (= (validKeyInArray!0 (select (arr!17218 a!3118) j!142)) (and (not (= (select (arr!17218 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17218 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573757 d!85079))

(declare-fun d!85081 () Bool)

(assert (=> d!85081 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52584 d!85081))

(declare-fun d!85087 () Bool)

(assert (=> d!85087 (= (array_inv!13077 a!3118) (bvsge (size!17582 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52584 d!85087))

(declare-fun d!85091 () Bool)

(assert (=> d!85091 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573759 d!85091))

(declare-fun b!573900 () Bool)

(declare-fun e!330176 () SeekEntryResult!5623)

(assert (=> b!573900 (= e!330176 Undefined!5623)))

(declare-fun b!573901 () Bool)

(declare-fun c!65821 () Bool)

(declare-fun lt!262118 () (_ BitVec 64))

(assert (=> b!573901 (= c!65821 (= lt!262118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330177 () SeekEntryResult!5623)

(declare-fun e!330175 () SeekEntryResult!5623)

(assert (=> b!573901 (= e!330177 e!330175)))

(declare-fun b!573902 () Bool)

(declare-fun lt!262120 () SeekEntryResult!5623)

(assert (=> b!573902 (= e!330177 (Found!5623 (index!24721 lt!262120)))))

(declare-fun b!573903 () Bool)

(assert (=> b!573903 (= e!330176 e!330177)))

(assert (=> b!573903 (= lt!262118 (select (arr!17218 lt!262019) (index!24721 lt!262120)))))

(declare-fun c!65822 () Bool)

(assert (=> b!573903 (= c!65822 (= lt!262118 lt!262016))))

(declare-fun b!573904 () Bool)

(assert (=> b!573904 (= e!330175 (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262120) (index!24721 lt!262120) (index!24721 lt!262120) lt!262016 lt!262019 mask!3119))))

(declare-fun d!85093 () Bool)

(declare-fun lt!262119 () SeekEntryResult!5623)

(assert (=> d!85093 (and (or ((_ is Undefined!5623) lt!262119) (not ((_ is Found!5623) lt!262119)) (and (bvsge (index!24720 lt!262119) #b00000000000000000000000000000000) (bvslt (index!24720 lt!262119) (size!17582 lt!262019)))) (or ((_ is Undefined!5623) lt!262119) ((_ is Found!5623) lt!262119) (not ((_ is MissingZero!5623) lt!262119)) (and (bvsge (index!24719 lt!262119) #b00000000000000000000000000000000) (bvslt (index!24719 lt!262119) (size!17582 lt!262019)))) (or ((_ is Undefined!5623) lt!262119) ((_ is Found!5623) lt!262119) ((_ is MissingZero!5623) lt!262119) (not ((_ is MissingVacant!5623) lt!262119)) (and (bvsge (index!24722 lt!262119) #b00000000000000000000000000000000) (bvslt (index!24722 lt!262119) (size!17582 lt!262019)))) (or ((_ is Undefined!5623) lt!262119) (ite ((_ is Found!5623) lt!262119) (= (select (arr!17218 lt!262019) (index!24720 lt!262119)) lt!262016) (ite ((_ is MissingZero!5623) lt!262119) (= (select (arr!17218 lt!262019) (index!24719 lt!262119)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5623) lt!262119) (= (select (arr!17218 lt!262019) (index!24722 lt!262119)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85093 (= lt!262119 e!330176)))

(declare-fun c!65820 () Bool)

(assert (=> d!85093 (= c!65820 (and ((_ is Intermediate!5623) lt!262120) (undefined!6435 lt!262120)))))

(assert (=> d!85093 (= lt!262120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262016 mask!3119) lt!262016 lt!262019 mask!3119))))

(assert (=> d!85093 (validMask!0 mask!3119)))

(assert (=> d!85093 (= (seekEntryOrOpen!0 lt!262016 lt!262019 mask!3119) lt!262119)))

(declare-fun b!573899 () Bool)

(assert (=> b!573899 (= e!330175 (MissingZero!5623 (index!24721 lt!262120)))))

(assert (= (and d!85093 c!65820) b!573900))

(assert (= (and d!85093 (not c!65820)) b!573903))

(assert (= (and b!573903 c!65822) b!573902))

(assert (= (and b!573903 (not c!65822)) b!573901))

(assert (= (and b!573901 c!65821) b!573899))

(assert (= (and b!573901 (not c!65821)) b!573904))

(declare-fun m!553045 () Bool)

(assert (=> b!573903 m!553045))

(declare-fun m!553051 () Bool)

(assert (=> b!573904 m!553051))

(assert (=> d!85093 m!552893))

(declare-fun m!553053 () Bool)

(assert (=> d!85093 m!553053))

(declare-fun m!553055 () Bool)

(assert (=> d!85093 m!553055))

(declare-fun m!553057 () Bool)

(assert (=> d!85093 m!553057))

(assert (=> d!85093 m!552893))

(declare-fun m!553059 () Bool)

(assert (=> d!85093 m!553059))

(assert (=> d!85093 m!552863))

(assert (=> b!573748 d!85093))

(declare-fun b!573947 () Bool)

(declare-fun e!330203 () SeekEntryResult!5623)

(assert (=> b!573947 (= e!330203 Undefined!5623)))

(declare-fun b!573948 () Bool)

(declare-fun e!330202 () SeekEntryResult!5623)

(assert (=> b!573948 (= e!330202 (MissingVacant!5623 (index!24721 lt!262021)))))

(declare-fun b!573949 () Bool)

(declare-fun e!330204 () SeekEntryResult!5623)

(assert (=> b!573949 (= e!330204 (Found!5623 (index!24721 lt!262021)))))

(declare-fun b!573950 () Bool)

(declare-fun c!65843 () Bool)

(declare-fun lt!262134 () (_ BitVec 64))

(assert (=> b!573950 (= c!65843 (= lt!262134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573950 (= e!330204 e!330202)))

(declare-fun b!573951 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573951 (= e!330202 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53744 lt!262021) #b00000000000000000000000000000001) (nextIndex!0 (index!24721 lt!262021) (bvadd (x!53744 lt!262021) #b00000000000000000000000000000001) mask!3119) (index!24721 lt!262021) lt!262016 lt!262019 mask!3119))))

(declare-fun d!85099 () Bool)

(declare-fun lt!262135 () SeekEntryResult!5623)

(assert (=> d!85099 (and (or ((_ is Undefined!5623) lt!262135) (not ((_ is Found!5623) lt!262135)) (and (bvsge (index!24720 lt!262135) #b00000000000000000000000000000000) (bvslt (index!24720 lt!262135) (size!17582 lt!262019)))) (or ((_ is Undefined!5623) lt!262135) ((_ is Found!5623) lt!262135) (not ((_ is MissingVacant!5623) lt!262135)) (not (= (index!24722 lt!262135) (index!24721 lt!262021))) (and (bvsge (index!24722 lt!262135) #b00000000000000000000000000000000) (bvslt (index!24722 lt!262135) (size!17582 lt!262019)))) (or ((_ is Undefined!5623) lt!262135) (ite ((_ is Found!5623) lt!262135) (= (select (arr!17218 lt!262019) (index!24720 lt!262135)) lt!262016) (and ((_ is MissingVacant!5623) lt!262135) (= (index!24722 lt!262135) (index!24721 lt!262021)) (= (select (arr!17218 lt!262019) (index!24722 lt!262135)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85099 (= lt!262135 e!330203)))

(declare-fun c!65841 () Bool)

(assert (=> d!85099 (= c!65841 (bvsge (x!53744 lt!262021) #b01111111111111111111111111111110))))

(assert (=> d!85099 (= lt!262134 (select (arr!17218 lt!262019) (index!24721 lt!262021)))))

(assert (=> d!85099 (validMask!0 mask!3119)))

(assert (=> d!85099 (= (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262021) (index!24721 lt!262021) (index!24721 lt!262021) lt!262016 lt!262019 mask!3119) lt!262135)))

(declare-fun b!573952 () Bool)

(assert (=> b!573952 (= e!330203 e!330204)))

(declare-fun c!65842 () Bool)

(assert (=> b!573952 (= c!65842 (= lt!262134 lt!262016))))

(assert (= (and d!85099 c!65841) b!573947))

(assert (= (and d!85099 (not c!65841)) b!573952))

(assert (= (and b!573952 c!65842) b!573949))

(assert (= (and b!573952 (not c!65842)) b!573950))

(assert (= (and b!573950 c!65843) b!573948))

(assert (= (and b!573950 (not c!65843)) b!573951))

(declare-fun m!553073 () Bool)

(assert (=> b!573951 m!553073))

(assert (=> b!573951 m!553073))

(declare-fun m!553075 () Bool)

(assert (=> b!573951 m!553075))

(declare-fun m!553077 () Bool)

(assert (=> d!85099 m!553077))

(declare-fun m!553079 () Bool)

(assert (=> d!85099 m!553079))

(declare-fun m!553081 () Bool)

(assert (=> d!85099 m!553081))

(assert (=> d!85099 m!552863))

(assert (=> b!573748 d!85099))

(declare-fun b!573996 () Bool)

(declare-fun e!330237 () Bool)

(declare-fun call!32661 () Bool)

(assert (=> b!573996 (= e!330237 call!32661)))

(declare-fun bm!32658 () Bool)

(declare-fun c!65858 () Bool)

(assert (=> bm!32658 (= call!32661 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65858 (Cons!11201 (select (arr!17218 a!3118) #b00000000000000000000000000000000) Nil!11202) Nil!11202)))))

(declare-fun b!573997 () Bool)

(declare-fun e!330234 () Bool)

(assert (=> b!573997 (= e!330234 e!330237)))

(assert (=> b!573997 (= c!65858 (validKeyInArray!0 (select (arr!17218 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573998 () Bool)

(assert (=> b!573998 (= e!330237 call!32661)))

(declare-fun b!573999 () Bool)

(declare-fun e!330236 () Bool)

(declare-fun contains!2858 (List!11205 (_ BitVec 64)) Bool)

(assert (=> b!573999 (= e!330236 (contains!2858 Nil!11202 (select (arr!17218 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574000 () Bool)

(declare-fun e!330235 () Bool)

(assert (=> b!574000 (= e!330235 e!330234)))

(declare-fun res!363003 () Bool)

(assert (=> b!574000 (=> (not res!363003) (not e!330234))))

(assert (=> b!574000 (= res!363003 (not e!330236))))

(declare-fun res!363004 () Bool)

(assert (=> b!574000 (=> (not res!363004) (not e!330236))))

(assert (=> b!574000 (= res!363004 (validKeyInArray!0 (select (arr!17218 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85107 () Bool)

(declare-fun res!363002 () Bool)

(assert (=> d!85107 (=> res!363002 e!330235)))

(assert (=> d!85107 (= res!363002 (bvsge #b00000000000000000000000000000000 (size!17582 a!3118)))))

(assert (=> d!85107 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11202) e!330235)))

(assert (= (and d!85107 (not res!363002)) b!574000))

(assert (= (and b!574000 res!363004) b!573999))

(assert (= (and b!574000 res!363003) b!573997))

(assert (= (and b!573997 c!65858) b!573996))

(assert (= (and b!573997 (not c!65858)) b!573998))

(assert (= (or b!573996 b!573998) bm!32658))

(declare-fun m!553099 () Bool)

(assert (=> bm!32658 m!553099))

(declare-fun m!553101 () Bool)

(assert (=> bm!32658 m!553101))

(assert (=> b!573997 m!553099))

(assert (=> b!573997 m!553099))

(declare-fun m!553103 () Bool)

(assert (=> b!573997 m!553103))

(assert (=> b!573999 m!553099))

(assert (=> b!573999 m!553099))

(declare-fun m!553105 () Bool)

(assert (=> b!573999 m!553105))

(assert (=> b!574000 m!553099))

(assert (=> b!574000 m!553099))

(assert (=> b!574000 m!553103))

(assert (=> b!573753 d!85107))

(declare-fun b!574068 () Bool)

(declare-fun lt!262161 () SeekEntryResult!5623)

(assert (=> b!574068 (and (bvsge (index!24721 lt!262161) #b00000000000000000000000000000000) (bvslt (index!24721 lt!262161) (size!17582 lt!262019)))))

(declare-fun res!363029 () Bool)

(assert (=> b!574068 (= res!363029 (= (select (arr!17218 lt!262019) (index!24721 lt!262161)) lt!262016))))

(declare-fun e!330279 () Bool)

(assert (=> b!574068 (=> res!363029 e!330279)))

(declare-fun e!330280 () Bool)

(assert (=> b!574068 (= e!330280 e!330279)))

(declare-fun b!574069 () Bool)

(declare-fun e!330281 () SeekEntryResult!5623)

(assert (=> b!574069 (= e!330281 (Intermediate!5623 false lt!262015 #b00000000000000000000000000000000))))

(declare-fun b!574070 () Bool)

(assert (=> b!574070 (= e!330281 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262015 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!262016 lt!262019 mask!3119))))

(declare-fun b!574071 () Bool)

(declare-fun e!330278 () SeekEntryResult!5623)

(assert (=> b!574071 (= e!330278 (Intermediate!5623 true lt!262015 #b00000000000000000000000000000000))))

(declare-fun b!574072 () Bool)

(assert (=> b!574072 (and (bvsge (index!24721 lt!262161) #b00000000000000000000000000000000) (bvslt (index!24721 lt!262161) (size!17582 lt!262019)))))

(assert (=> b!574072 (= e!330279 (= (select (arr!17218 lt!262019) (index!24721 lt!262161)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574073 () Bool)

(declare-fun e!330282 () Bool)

(assert (=> b!574073 (= e!330282 e!330280)))

(declare-fun res!363030 () Bool)

(assert (=> b!574073 (= res!363030 (and ((_ is Intermediate!5623) lt!262161) (not (undefined!6435 lt!262161)) (bvslt (x!53744 lt!262161) #b01111111111111111111111111111110) (bvsge (x!53744 lt!262161) #b00000000000000000000000000000000) (bvsge (x!53744 lt!262161) #b00000000000000000000000000000000)))))

(assert (=> b!574073 (=> (not res!363030) (not e!330280))))

(declare-fun d!85113 () Bool)

(assert (=> d!85113 e!330282))

(declare-fun c!65882 () Bool)

(assert (=> d!85113 (= c!65882 (and ((_ is Intermediate!5623) lt!262161) (undefined!6435 lt!262161)))))

(assert (=> d!85113 (= lt!262161 e!330278)))

(declare-fun c!65883 () Bool)

(assert (=> d!85113 (= c!65883 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262160 () (_ BitVec 64))

(assert (=> d!85113 (= lt!262160 (select (arr!17218 lt!262019) lt!262015))))

(assert (=> d!85113 (validMask!0 mask!3119)))

(assert (=> d!85113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262015 lt!262016 lt!262019 mask!3119) lt!262161)))

(declare-fun b!574074 () Bool)

(assert (=> b!574074 (= e!330278 e!330281)))

(declare-fun c!65881 () Bool)

(assert (=> b!574074 (= c!65881 (or (= lt!262160 lt!262016) (= (bvadd lt!262160 lt!262160) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574075 () Bool)

(assert (=> b!574075 (= e!330282 (bvsge (x!53744 lt!262161) #b01111111111111111111111111111110))))

(declare-fun b!574076 () Bool)

(assert (=> b!574076 (and (bvsge (index!24721 lt!262161) #b00000000000000000000000000000000) (bvslt (index!24721 lt!262161) (size!17582 lt!262019)))))

(declare-fun res!363028 () Bool)

(assert (=> b!574076 (= res!363028 (= (select (arr!17218 lt!262019) (index!24721 lt!262161)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574076 (=> res!363028 e!330279)))

(assert (= (and d!85113 c!65883) b!574071))

(assert (= (and d!85113 (not c!65883)) b!574074))

(assert (= (and b!574074 c!65881) b!574069))

(assert (= (and b!574074 (not c!65881)) b!574070))

(assert (= (and d!85113 c!65882) b!574075))

(assert (= (and d!85113 (not c!65882)) b!574073))

(assert (= (and b!574073 res!363030) b!574068))

(assert (= (and b!574068 (not res!363029)) b!574076))

(assert (= (and b!574076 (not res!363028)) b!574072))

(declare-fun m!553145 () Bool)

(assert (=> b!574076 m!553145))

(assert (=> b!574072 m!553145))

(declare-fun m!553147 () Bool)

(assert (=> d!85113 m!553147))

(assert (=> d!85113 m!552863))

(assert (=> b!574068 m!553145))

(declare-fun m!553149 () Bool)

(assert (=> b!574070 m!553149))

(assert (=> b!574070 m!553149))

(declare-fun m!553151 () Bool)

(assert (=> b!574070 m!553151))

(assert (=> b!573750 d!85113))

(declare-fun b!574094 () Bool)

(declare-fun lt!262169 () SeekEntryResult!5623)

(assert (=> b!574094 (and (bvsge (index!24721 lt!262169) #b00000000000000000000000000000000) (bvslt (index!24721 lt!262169) (size!17582 a!3118)))))

(declare-fun res!363035 () Bool)

(assert (=> b!574094 (= res!363035 (= (select (arr!17218 a!3118) (index!24721 lt!262169)) (select (arr!17218 a!3118) j!142)))))

(declare-fun e!330293 () Bool)

(assert (=> b!574094 (=> res!363035 e!330293)))

(declare-fun e!330294 () Bool)

(assert (=> b!574094 (= e!330294 e!330293)))

(declare-fun b!574095 () Bool)

(declare-fun e!330295 () SeekEntryResult!5623)

(assert (=> b!574095 (= e!330295 (Intermediate!5623 false lt!262020 #b00000000000000000000000000000000))))

(declare-fun b!574096 () Bool)

(assert (=> b!574096 (= e!330295 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262020 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574097 () Bool)

(declare-fun e!330292 () SeekEntryResult!5623)

(assert (=> b!574097 (= e!330292 (Intermediate!5623 true lt!262020 #b00000000000000000000000000000000))))

(declare-fun b!574098 () Bool)

(assert (=> b!574098 (and (bvsge (index!24721 lt!262169) #b00000000000000000000000000000000) (bvslt (index!24721 lt!262169) (size!17582 a!3118)))))

(assert (=> b!574098 (= e!330293 (= (select (arr!17218 a!3118) (index!24721 lt!262169)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574099 () Bool)

(declare-fun e!330296 () Bool)

(assert (=> b!574099 (= e!330296 e!330294)))

(declare-fun res!363036 () Bool)

(assert (=> b!574099 (= res!363036 (and ((_ is Intermediate!5623) lt!262169) (not (undefined!6435 lt!262169)) (bvslt (x!53744 lt!262169) #b01111111111111111111111111111110) (bvsge (x!53744 lt!262169) #b00000000000000000000000000000000) (bvsge (x!53744 lt!262169) #b00000000000000000000000000000000)))))

(assert (=> b!574099 (=> (not res!363036) (not e!330294))))

(declare-fun d!85129 () Bool)

(assert (=> d!85129 e!330296))

(declare-fun c!65892 () Bool)

(assert (=> d!85129 (= c!65892 (and ((_ is Intermediate!5623) lt!262169) (undefined!6435 lt!262169)))))

(assert (=> d!85129 (= lt!262169 e!330292)))

(declare-fun c!65893 () Bool)

(assert (=> d!85129 (= c!65893 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262168 () (_ BitVec 64))

(assert (=> d!85129 (= lt!262168 (select (arr!17218 a!3118) lt!262020))))

(assert (=> d!85129 (validMask!0 mask!3119)))

(assert (=> d!85129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262020 (select (arr!17218 a!3118) j!142) a!3118 mask!3119) lt!262169)))

(declare-fun b!574100 () Bool)

(assert (=> b!574100 (= e!330292 e!330295)))

(declare-fun c!65891 () Bool)

(assert (=> b!574100 (= c!65891 (or (= lt!262168 (select (arr!17218 a!3118) j!142)) (= (bvadd lt!262168 lt!262168) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574101 () Bool)

(assert (=> b!574101 (= e!330296 (bvsge (x!53744 lt!262169) #b01111111111111111111111111111110))))

(declare-fun b!574102 () Bool)

(assert (=> b!574102 (and (bvsge (index!24721 lt!262169) #b00000000000000000000000000000000) (bvslt (index!24721 lt!262169) (size!17582 a!3118)))))

(declare-fun res!363034 () Bool)

(assert (=> b!574102 (= res!363034 (= (select (arr!17218 a!3118) (index!24721 lt!262169)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574102 (=> res!363034 e!330293)))

(assert (= (and d!85129 c!65893) b!574097))

(assert (= (and d!85129 (not c!65893)) b!574100))

(assert (= (and b!574100 c!65891) b!574095))

(assert (= (and b!574100 (not c!65891)) b!574096))

(assert (= (and d!85129 c!65892) b!574101))

(assert (= (and d!85129 (not c!65892)) b!574099))

(assert (= (and b!574099 res!363036) b!574094))

(assert (= (and b!574094 (not res!363035)) b!574102))

(assert (= (and b!574102 (not res!363034)) b!574098))

(declare-fun m!553161 () Bool)

(assert (=> b!574102 m!553161))

(assert (=> b!574098 m!553161))

(declare-fun m!553163 () Bool)

(assert (=> d!85129 m!553163))

(assert (=> d!85129 m!552863))

(assert (=> b!574094 m!553161))

(declare-fun m!553165 () Bool)

(assert (=> b!574096 m!553165))

(assert (=> b!574096 m!553165))

(assert (=> b!574096 m!552871))

(declare-fun m!553167 () Bool)

(assert (=> b!574096 m!553167))

(assert (=> b!573750 d!85129))

(declare-fun d!85133 () Bool)

(declare-fun lt!262183 () (_ BitVec 32))

(declare-fun lt!262182 () (_ BitVec 32))

(assert (=> d!85133 (= lt!262183 (bvmul (bvxor lt!262182 (bvlshr lt!262182 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85133 (= lt!262182 ((_ extract 31 0) (bvand (bvxor lt!262016 (bvlshr lt!262016 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85133 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363044 (let ((h!12238 ((_ extract 31 0) (bvand (bvxor lt!262016 (bvlshr lt!262016 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53754 (bvmul (bvxor h!12238 (bvlshr h!12238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53754 (bvlshr x!53754 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363044 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363044 #b00000000000000000000000000000000))))))

(assert (=> d!85133 (= (toIndex!0 lt!262016 mask!3119) (bvand (bvxor lt!262183 (bvlshr lt!262183 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573750 d!85133))

(declare-fun d!85139 () Bool)

(declare-fun lt!262189 () (_ BitVec 32))

(declare-fun lt!262188 () (_ BitVec 32))

(assert (=> d!85139 (= lt!262189 (bvmul (bvxor lt!262188 (bvlshr lt!262188 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85139 (= lt!262188 ((_ extract 31 0) (bvand (bvxor (select (arr!17218 a!3118) j!142) (bvlshr (select (arr!17218 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85139 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363044 (let ((h!12238 ((_ extract 31 0) (bvand (bvxor (select (arr!17218 a!3118) j!142) (bvlshr (select (arr!17218 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53754 (bvmul (bvxor h!12238 (bvlshr h!12238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53754 (bvlshr x!53754 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363044 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363044 #b00000000000000000000000000000000))))))

(assert (=> d!85139 (= (toIndex!0 (select (arr!17218 a!3118) j!142) mask!3119) (bvand (bvxor lt!262189 (bvlshr lt!262189 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573750 d!85139))

(declare-fun b!574132 () Bool)

(declare-fun e!330314 () SeekEntryResult!5623)

(assert (=> b!574132 (= e!330314 Undefined!5623)))

(declare-fun b!574133 () Bool)

(declare-fun c!65903 () Bool)

(declare-fun lt!262190 () (_ BitVec 64))

(assert (=> b!574133 (= c!65903 (= lt!262190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330315 () SeekEntryResult!5623)

(declare-fun e!330313 () SeekEntryResult!5623)

(assert (=> b!574133 (= e!330315 e!330313)))

(declare-fun b!574134 () Bool)

(declare-fun lt!262192 () SeekEntryResult!5623)

(assert (=> b!574134 (= e!330315 (Found!5623 (index!24721 lt!262192)))))

(declare-fun b!574135 () Bool)

(assert (=> b!574135 (= e!330314 e!330315)))

(assert (=> b!574135 (= lt!262190 (select (arr!17218 a!3118) (index!24721 lt!262192)))))

(declare-fun c!65904 () Bool)

(assert (=> b!574135 (= c!65904 (= lt!262190 k0!1914))))

(declare-fun b!574136 () Bool)

(assert (=> b!574136 (= e!330313 (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262192) (index!24721 lt!262192) (index!24721 lt!262192) k0!1914 a!3118 mask!3119))))

(declare-fun d!85143 () Bool)

(declare-fun lt!262191 () SeekEntryResult!5623)

(assert (=> d!85143 (and (or ((_ is Undefined!5623) lt!262191) (not ((_ is Found!5623) lt!262191)) (and (bvsge (index!24720 lt!262191) #b00000000000000000000000000000000) (bvslt (index!24720 lt!262191) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262191) ((_ is Found!5623) lt!262191) (not ((_ is MissingZero!5623) lt!262191)) (and (bvsge (index!24719 lt!262191) #b00000000000000000000000000000000) (bvslt (index!24719 lt!262191) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262191) ((_ is Found!5623) lt!262191) ((_ is MissingZero!5623) lt!262191) (not ((_ is MissingVacant!5623) lt!262191)) (and (bvsge (index!24722 lt!262191) #b00000000000000000000000000000000) (bvslt (index!24722 lt!262191) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262191) (ite ((_ is Found!5623) lt!262191) (= (select (arr!17218 a!3118) (index!24720 lt!262191)) k0!1914) (ite ((_ is MissingZero!5623) lt!262191) (= (select (arr!17218 a!3118) (index!24719 lt!262191)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5623) lt!262191) (= (select (arr!17218 a!3118) (index!24722 lt!262191)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85143 (= lt!262191 e!330314)))

(declare-fun c!65902 () Bool)

(assert (=> d!85143 (= c!65902 (and ((_ is Intermediate!5623) lt!262192) (undefined!6435 lt!262192)))))

(assert (=> d!85143 (= lt!262192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85143 (validMask!0 mask!3119)))

(assert (=> d!85143 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262191)))

(declare-fun b!574131 () Bool)

(assert (=> b!574131 (= e!330313 (MissingZero!5623 (index!24721 lt!262192)))))

(assert (= (and d!85143 c!65902) b!574132))

(assert (= (and d!85143 (not c!65902)) b!574135))

(assert (= (and b!574135 c!65904) b!574134))

(assert (= (and b!574135 (not c!65904)) b!574133))

(assert (= (and b!574133 c!65903) b!574131))

(assert (= (and b!574133 (not c!65903)) b!574136))

(declare-fun m!553185 () Bool)

(assert (=> b!574135 m!553185))

(declare-fun m!553187 () Bool)

(assert (=> b!574136 m!553187))

(declare-fun m!553189 () Bool)

(assert (=> d!85143 m!553189))

(declare-fun m!553191 () Bool)

(assert (=> d!85143 m!553191))

(declare-fun m!553193 () Bool)

(assert (=> d!85143 m!553193))

(declare-fun m!553195 () Bool)

(assert (=> d!85143 m!553195))

(assert (=> d!85143 m!553189))

(declare-fun m!553197 () Bool)

(assert (=> d!85143 m!553197))

(assert (=> d!85143 m!552863))

(assert (=> b!573755 d!85143))

(declare-fun bm!32660 () Bool)

(declare-fun call!32663 () Bool)

(assert (=> bm!32660 (= call!32663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574138 () Bool)

(declare-fun e!330316 () Bool)

(assert (=> b!574138 (= e!330316 call!32663)))

(declare-fun b!574139 () Bool)

(declare-fun e!330318 () Bool)

(assert (=> b!574139 (= e!330318 e!330316)))

(declare-fun lt!262195 () (_ BitVec 64))

(assert (=> b!574139 (= lt!262195 (select (arr!17218 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262194 () Unit!18019)

(assert (=> b!574139 (= lt!262194 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262195 #b00000000000000000000000000000000))))

(assert (=> b!574139 (arrayContainsKey!0 a!3118 lt!262195 #b00000000000000000000000000000000)))

(declare-fun lt!262193 () Unit!18019)

(assert (=> b!574139 (= lt!262193 lt!262194)))

(declare-fun res!363051 () Bool)

(assert (=> b!574139 (= res!363051 (= (seekEntryOrOpen!0 (select (arr!17218 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5623 #b00000000000000000000000000000000)))))

(assert (=> b!574139 (=> (not res!363051) (not e!330316))))

(declare-fun b!574140 () Bool)

(assert (=> b!574140 (= e!330318 call!32663)))

(declare-fun b!574137 () Bool)

(declare-fun e!330317 () Bool)

(assert (=> b!574137 (= e!330317 e!330318)))

(declare-fun c!65905 () Bool)

(assert (=> b!574137 (= c!65905 (validKeyInArray!0 (select (arr!17218 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85147 () Bool)

(declare-fun res!363052 () Bool)

(assert (=> d!85147 (=> res!363052 e!330317)))

(assert (=> d!85147 (= res!363052 (bvsge #b00000000000000000000000000000000 (size!17582 a!3118)))))

(assert (=> d!85147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330317)))

(assert (= (and d!85147 (not res!363052)) b!574137))

(assert (= (and b!574137 c!65905) b!574139))

(assert (= (and b!574137 (not c!65905)) b!574140))

(assert (= (and b!574139 res!363051) b!574138))

(assert (= (or b!574138 b!574140) bm!32660))

(declare-fun m!553199 () Bool)

(assert (=> bm!32660 m!553199))

(assert (=> b!574139 m!553099))

(declare-fun m!553201 () Bool)

(assert (=> b!574139 m!553201))

(declare-fun m!553203 () Bool)

(assert (=> b!574139 m!553203))

(assert (=> b!574139 m!553099))

(declare-fun m!553205 () Bool)

(assert (=> b!574139 m!553205))

(assert (=> b!574137 m!553099))

(assert (=> b!574137 m!553099))

(assert (=> b!574137 m!553103))

(assert (=> b!573749 d!85147))

(declare-fun d!85149 () Bool)

(declare-fun res!363058 () Bool)

(declare-fun e!330323 () Bool)

(assert (=> d!85149 (=> res!363058 e!330323)))

(assert (=> d!85149 (= res!363058 (= (select (arr!17218 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85149 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330323)))

(declare-fun b!574145 () Bool)

(declare-fun e!330324 () Bool)

(assert (=> b!574145 (= e!330323 e!330324)))

(declare-fun res!363059 () Bool)

(assert (=> b!574145 (=> (not res!363059) (not e!330324))))

(assert (=> b!574145 (= res!363059 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17582 a!3118)))))

(declare-fun b!574146 () Bool)

(assert (=> b!574146 (= e!330324 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85149 (not res!363058)) b!574145))

(assert (= (and b!574145 res!363059) b!574146))

(assert (=> d!85149 m!553099))

(declare-fun m!553207 () Bool)

(assert (=> b!574146 m!553207))

(assert (=> b!573751 d!85149))

(declare-fun b!574147 () Bool)

(declare-fun e!330326 () SeekEntryResult!5623)

(assert (=> b!574147 (= e!330326 Undefined!5623)))

(declare-fun b!574148 () Bool)

(declare-fun e!330325 () SeekEntryResult!5623)

(assert (=> b!574148 (= e!330325 (MissingVacant!5623 (index!24721 lt!262021)))))

(declare-fun b!574149 () Bool)

(declare-fun e!330327 () SeekEntryResult!5623)

(assert (=> b!574149 (= e!330327 (Found!5623 (index!24721 lt!262021)))))

(declare-fun b!574150 () Bool)

(declare-fun c!65908 () Bool)

(declare-fun lt!262200 () (_ BitVec 64))

(assert (=> b!574150 (= c!65908 (= lt!262200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574150 (= e!330327 e!330325)))

(declare-fun b!574151 () Bool)

(assert (=> b!574151 (= e!330325 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53744 lt!262021) #b00000000000000000000000000000001) (nextIndex!0 (index!24721 lt!262021) (bvadd (x!53744 lt!262021) #b00000000000000000000000000000001) mask!3119) (index!24721 lt!262021) (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85151 () Bool)

(declare-fun lt!262201 () SeekEntryResult!5623)

(assert (=> d!85151 (and (or ((_ is Undefined!5623) lt!262201) (not ((_ is Found!5623) lt!262201)) (and (bvsge (index!24720 lt!262201) #b00000000000000000000000000000000) (bvslt (index!24720 lt!262201) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262201) ((_ is Found!5623) lt!262201) (not ((_ is MissingVacant!5623) lt!262201)) (not (= (index!24722 lt!262201) (index!24721 lt!262021))) (and (bvsge (index!24722 lt!262201) #b00000000000000000000000000000000) (bvslt (index!24722 lt!262201) (size!17582 a!3118)))) (or ((_ is Undefined!5623) lt!262201) (ite ((_ is Found!5623) lt!262201) (= (select (arr!17218 a!3118) (index!24720 lt!262201)) (select (arr!17218 a!3118) j!142)) (and ((_ is MissingVacant!5623) lt!262201) (= (index!24722 lt!262201) (index!24721 lt!262021)) (= (select (arr!17218 a!3118) (index!24722 lt!262201)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85151 (= lt!262201 e!330326)))

(declare-fun c!65906 () Bool)

(assert (=> d!85151 (= c!65906 (bvsge (x!53744 lt!262021) #b01111111111111111111111111111110))))

(assert (=> d!85151 (= lt!262200 (select (arr!17218 a!3118) (index!24721 lt!262021)))))

(assert (=> d!85151 (validMask!0 mask!3119)))

(assert (=> d!85151 (= (seekKeyOrZeroReturnVacant!0 (x!53744 lt!262021) (index!24721 lt!262021) (index!24721 lt!262021) (select (arr!17218 a!3118) j!142) a!3118 mask!3119) lt!262201)))

(declare-fun b!574152 () Bool)

(assert (=> b!574152 (= e!330326 e!330327)))

(declare-fun c!65907 () Bool)

(assert (=> b!574152 (= c!65907 (= lt!262200 (select (arr!17218 a!3118) j!142)))))

(assert (= (and d!85151 c!65906) b!574147))

(assert (= (and d!85151 (not c!65906)) b!574152))

(assert (= (and b!574152 c!65907) b!574149))

(assert (= (and b!574152 (not c!65907)) b!574150))

(assert (= (and b!574150 c!65908) b!574148))

(assert (= (and b!574150 (not c!65908)) b!574151))

(assert (=> b!574151 m!553073))

(assert (=> b!574151 m!553073))

(assert (=> b!574151 m!552871))

(declare-fun m!553209 () Bool)

(assert (=> b!574151 m!553209))

(declare-fun m!553211 () Bool)

(assert (=> d!85151 m!553211))

(declare-fun m!553213 () Bool)

(assert (=> d!85151 m!553213))

(assert (=> d!85151 m!552869))

(assert (=> d!85151 m!552863))

(assert (=> b!573756 d!85151))

(check-sat (not d!85099) (not bm!32660) (not b!574146) (not d!85075) (not b!574137) (not b!574070) (not b!574139) (not b!573999) (not b!574151) (not b!574136) (not b!573879) (not b!573904) (not b!573951) (not d!85093) (not d!85113) (not b!574000) (not d!85151) (not d!85069) (not b!573856) (not b!573997) (not d!85143) (not d!85129) (not b!574096) (not b!573877) (not bm!32649) (not bm!32658))
(check-sat)
