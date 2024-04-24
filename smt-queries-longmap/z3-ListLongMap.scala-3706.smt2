; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50898 () Bool)

(assert start!50898)

(declare-fun res!349068 () Bool)

(declare-fun e!320754 () Bool)

(assert (=> start!50898 (=> (not res!349068) (not e!320754))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50898 (= res!349068 (validMask!0 mask!3119))))

(assert (=> start!50898 e!320754))

(assert (=> start!50898 true))

(declare-datatypes ((array!35070 0))(
  ( (array!35071 (arr!16843 (Array (_ BitVec 32) (_ BitVec 64))) (size!17207 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35070)

(declare-fun array_inv!12702 (array!35070) Bool)

(assert (=> start!50898 (array_inv!12702 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!556759 () Bool)

(declare-fun e!320753 () Bool)

(declare-datatypes ((SeekEntryResult!5248 0))(
  ( (MissingZero!5248 (index!23219 (_ BitVec 32))) (Found!5248 (index!23220 (_ BitVec 32))) (Intermediate!5248 (undefined!6060 Bool) (index!23221 (_ BitVec 32)) (x!52261 (_ BitVec 32))) (Undefined!5248) (MissingVacant!5248 (index!23222 (_ BitVec 32))) )
))
(declare-fun lt!253032 () SeekEntryResult!5248)

(get-info :version)

(assert (=> b!556759 (= e!320753 (not (or (not ((_ is Intermediate!5248) lt!253032)) (undefined!6060 lt!253032) (= (select (arr!16843 a!3118) (index!23221 lt!253032)) (select (arr!16843 a!3118) j!142)) (= (select (arr!16843 a!3118) (index!23221 lt!253032)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23221 lt!253032) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253032) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!320755 () Bool)

(assert (=> b!556759 e!320755))

(declare-fun res!349075 () Bool)

(assert (=> b!556759 (=> (not res!349075) (not e!320755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35070 (_ BitVec 32)) Bool)

(assert (=> b!556759 (= res!349075 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17341 0))(
  ( (Unit!17342) )
))
(declare-fun lt!253030 () Unit!17341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17341)

(assert (=> b!556759 (= lt!253030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556760 () Bool)

(declare-fun e!320756 () Bool)

(assert (=> b!556760 (= e!320754 e!320756)))

(declare-fun res!349072 () Bool)

(assert (=> b!556760 (=> (not res!349072) (not e!320756))))

(declare-fun lt!253033 () SeekEntryResult!5248)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556760 (= res!349072 (or (= lt!253033 (MissingZero!5248 i!1132)) (= lt!253033 (MissingVacant!5248 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35070 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!556760 (= lt!253033 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556761 () Bool)

(declare-fun res!349069 () Bool)

(assert (=> b!556761 (=> (not res!349069) (not e!320754))))

(declare-fun arrayContainsKey!0 (array!35070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556761 (= res!349069 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556762 () Bool)

(assert (=> b!556762 (= e!320756 e!320753)))

(declare-fun res!349067 () Bool)

(assert (=> b!556762 (=> (not res!349067) (not e!320753))))

(declare-fun lt!253031 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35070 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!556762 (= res!349067 (= lt!253032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253031 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)) mask!3119)))))

(declare-fun lt!253029 () (_ BitVec 32))

(assert (=> b!556762 (= lt!253032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253029 (select (arr!16843 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556762 (= lt!253031 (toIndex!0 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556762 (= lt!253029 (toIndex!0 (select (arr!16843 a!3118) j!142) mask!3119))))

(declare-fun b!556763 () Bool)

(declare-fun res!349074 () Bool)

(assert (=> b!556763 (=> (not res!349074) (not e!320756))))

(assert (=> b!556763 (= res!349074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556764 () Bool)

(assert (=> b!556764 (= e!320755 (= (seekEntryOrOpen!0 (select (arr!16843 a!3118) j!142) a!3118 mask!3119) (Found!5248 j!142)))))

(declare-fun b!556765 () Bool)

(declare-fun res!349071 () Bool)

(assert (=> b!556765 (=> (not res!349071) (not e!320754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556765 (= res!349071 (validKeyInArray!0 (select (arr!16843 a!3118) j!142)))))

(declare-fun b!556766 () Bool)

(declare-fun res!349070 () Bool)

(assert (=> b!556766 (=> (not res!349070) (not e!320754))))

(assert (=> b!556766 (= res!349070 (validKeyInArray!0 k0!1914))))

(declare-fun b!556767 () Bool)

(declare-fun res!349066 () Bool)

(assert (=> b!556767 (=> (not res!349066) (not e!320756))))

(declare-datatypes ((List!10830 0))(
  ( (Nil!10827) (Cons!10826 (h!11814 (_ BitVec 64)) (t!17050 List!10830)) )
))
(declare-fun arrayNoDuplicates!0 (array!35070 (_ BitVec 32) List!10830) Bool)

(assert (=> b!556767 (= res!349066 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10827))))

(declare-fun b!556768 () Bool)

(declare-fun res!349073 () Bool)

(assert (=> b!556768 (=> (not res!349073) (not e!320754))))

(assert (=> b!556768 (= res!349073 (and (= (size!17207 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17207 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17207 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50898 res!349068) b!556768))

(assert (= (and b!556768 res!349073) b!556765))

(assert (= (and b!556765 res!349071) b!556766))

(assert (= (and b!556766 res!349070) b!556761))

(assert (= (and b!556761 res!349069) b!556760))

(assert (= (and b!556760 res!349072) b!556763))

(assert (= (and b!556763 res!349074) b!556767))

(assert (= (and b!556767 res!349066) b!556762))

(assert (= (and b!556762 res!349067) b!556759))

(assert (= (and b!556759 res!349075) b!556764))

(declare-fun m!534917 () Bool)

(assert (=> start!50898 m!534917))

(declare-fun m!534919 () Bool)

(assert (=> start!50898 m!534919))

(declare-fun m!534921 () Bool)

(assert (=> b!556761 m!534921))

(declare-fun m!534923 () Bool)

(assert (=> b!556759 m!534923))

(declare-fun m!534925 () Bool)

(assert (=> b!556759 m!534925))

(declare-fun m!534927 () Bool)

(assert (=> b!556759 m!534927))

(declare-fun m!534929 () Bool)

(assert (=> b!556759 m!534929))

(declare-fun m!534931 () Bool)

(assert (=> b!556760 m!534931))

(declare-fun m!534933 () Bool)

(assert (=> b!556766 m!534933))

(assert (=> b!556765 m!534925))

(assert (=> b!556765 m!534925))

(declare-fun m!534935 () Bool)

(assert (=> b!556765 m!534935))

(assert (=> b!556762 m!534925))

(declare-fun m!534937 () Bool)

(assert (=> b!556762 m!534937))

(assert (=> b!556762 m!534925))

(declare-fun m!534939 () Bool)

(assert (=> b!556762 m!534939))

(declare-fun m!534941 () Bool)

(assert (=> b!556762 m!534941))

(declare-fun m!534943 () Bool)

(assert (=> b!556762 m!534943))

(assert (=> b!556762 m!534941))

(declare-fun m!534945 () Bool)

(assert (=> b!556762 m!534945))

(assert (=> b!556762 m!534925))

(declare-fun m!534947 () Bool)

(assert (=> b!556762 m!534947))

(assert (=> b!556762 m!534941))

(declare-fun m!534949 () Bool)

(assert (=> b!556763 m!534949))

(declare-fun m!534951 () Bool)

(assert (=> b!556767 m!534951))

(assert (=> b!556764 m!534925))

(assert (=> b!556764 m!534925))

(declare-fun m!534953 () Bool)

(assert (=> b!556764 m!534953))

(check-sat (not b!556760) (not b!556759) (not start!50898) (not b!556761) (not b!556767) (not b!556764) (not b!556763) (not b!556762) (not b!556766) (not b!556765))
(check-sat)
(get-model)

(declare-fun d!83397 () Bool)

(assert (=> d!83397 (= (validKeyInArray!0 (select (arr!16843 a!3118) j!142)) (and (not (= (select (arr!16843 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16843 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556765 d!83397))

(declare-fun b!556842 () Bool)

(declare-fun e!320796 () SeekEntryResult!5248)

(declare-fun lt!253070 () SeekEntryResult!5248)

(assert (=> b!556842 (= e!320796 (Found!5248 (index!23221 lt!253070)))))

(declare-fun e!320794 () SeekEntryResult!5248)

(declare-fun b!556843 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35070 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!556843 (= e!320794 (seekKeyOrZeroReturnVacant!0 (x!52261 lt!253070) (index!23221 lt!253070) (index!23221 lt!253070) k0!1914 a!3118 mask!3119))))

(declare-fun b!556844 () Bool)

(declare-fun e!320795 () SeekEntryResult!5248)

(assert (=> b!556844 (= e!320795 e!320796)))

(declare-fun lt!253071 () (_ BitVec 64))

(assert (=> b!556844 (= lt!253071 (select (arr!16843 a!3118) (index!23221 lt!253070)))))

(declare-fun c!64191 () Bool)

(assert (=> b!556844 (= c!64191 (= lt!253071 k0!1914))))

(declare-fun b!556845 () Bool)

(declare-fun c!64192 () Bool)

(assert (=> b!556845 (= c!64192 (= lt!253071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556845 (= e!320796 e!320794)))

(declare-fun b!556846 () Bool)

(assert (=> b!556846 (= e!320794 (MissingZero!5248 (index!23221 lt!253070)))))

(declare-fun d!83399 () Bool)

(declare-fun lt!253072 () SeekEntryResult!5248)

(assert (=> d!83399 (and (or ((_ is Undefined!5248) lt!253072) (not ((_ is Found!5248) lt!253072)) (and (bvsge (index!23220 lt!253072) #b00000000000000000000000000000000) (bvslt (index!23220 lt!253072) (size!17207 a!3118)))) (or ((_ is Undefined!5248) lt!253072) ((_ is Found!5248) lt!253072) (not ((_ is MissingZero!5248) lt!253072)) (and (bvsge (index!23219 lt!253072) #b00000000000000000000000000000000) (bvslt (index!23219 lt!253072) (size!17207 a!3118)))) (or ((_ is Undefined!5248) lt!253072) ((_ is Found!5248) lt!253072) ((_ is MissingZero!5248) lt!253072) (not ((_ is MissingVacant!5248) lt!253072)) (and (bvsge (index!23222 lt!253072) #b00000000000000000000000000000000) (bvslt (index!23222 lt!253072) (size!17207 a!3118)))) (or ((_ is Undefined!5248) lt!253072) (ite ((_ is Found!5248) lt!253072) (= (select (arr!16843 a!3118) (index!23220 lt!253072)) k0!1914) (ite ((_ is MissingZero!5248) lt!253072) (= (select (arr!16843 a!3118) (index!23219 lt!253072)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5248) lt!253072) (= (select (arr!16843 a!3118) (index!23222 lt!253072)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83399 (= lt!253072 e!320795)))

(declare-fun c!64193 () Bool)

(assert (=> d!83399 (= c!64193 (and ((_ is Intermediate!5248) lt!253070) (undefined!6060 lt!253070)))))

(assert (=> d!83399 (= lt!253070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83399 (validMask!0 mask!3119)))

(assert (=> d!83399 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253072)))

(declare-fun b!556841 () Bool)

(assert (=> b!556841 (= e!320795 Undefined!5248)))

(assert (= (and d!83399 c!64193) b!556841))

(assert (= (and d!83399 (not c!64193)) b!556844))

(assert (= (and b!556844 c!64191) b!556842))

(assert (= (and b!556844 (not c!64191)) b!556845))

(assert (= (and b!556845 c!64192) b!556846))

(assert (= (and b!556845 (not c!64192)) b!556843))

(declare-fun m!535031 () Bool)

(assert (=> b!556843 m!535031))

(declare-fun m!535033 () Bool)

(assert (=> b!556844 m!535033))

(declare-fun m!535035 () Bool)

(assert (=> d!83399 m!535035))

(declare-fun m!535037 () Bool)

(assert (=> d!83399 m!535037))

(declare-fun m!535039 () Bool)

(assert (=> d!83399 m!535039))

(assert (=> d!83399 m!534917))

(declare-fun m!535041 () Bool)

(assert (=> d!83399 m!535041))

(assert (=> d!83399 m!535037))

(declare-fun m!535043 () Bool)

(assert (=> d!83399 m!535043))

(assert (=> b!556760 d!83399))

(declare-fun d!83405 () Bool)

(declare-fun res!349140 () Bool)

(declare-fun e!320801 () Bool)

(assert (=> d!83405 (=> res!349140 e!320801)))

(assert (=> d!83405 (= res!349140 (= (select (arr!16843 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83405 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!320801)))

(declare-fun b!556851 () Bool)

(declare-fun e!320802 () Bool)

(assert (=> b!556851 (= e!320801 e!320802)))

(declare-fun res!349141 () Bool)

(assert (=> b!556851 (=> (not res!349141) (not e!320802))))

(assert (=> b!556851 (= res!349141 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17207 a!3118)))))

(declare-fun b!556852 () Bool)

(assert (=> b!556852 (= e!320802 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83405 (not res!349140)) b!556851))

(assert (= (and b!556851 res!349141) b!556852))

(declare-fun m!535045 () Bool)

(assert (=> d!83405 m!535045))

(declare-fun m!535047 () Bool)

(assert (=> b!556852 m!535047))

(assert (=> b!556761 d!83405))

(declare-fun d!83407 () Bool)

(assert (=> d!83407 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556766 d!83407))

(declare-fun b!556871 () Bool)

(declare-fun e!320817 () Bool)

(declare-fun contains!2820 (List!10830 (_ BitVec 64)) Bool)

(assert (=> b!556871 (= e!320817 (contains!2820 Nil!10827 (select (arr!16843 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556872 () Bool)

(declare-fun e!320815 () Bool)

(declare-fun call!32337 () Bool)

(assert (=> b!556872 (= e!320815 call!32337)))

(declare-fun b!556873 () Bool)

(declare-fun e!320818 () Bool)

(declare-fun e!320816 () Bool)

(assert (=> b!556873 (= e!320818 e!320816)))

(declare-fun res!349148 () Bool)

(assert (=> b!556873 (=> (not res!349148) (not e!320816))))

(assert (=> b!556873 (= res!349148 (not e!320817))))

(declare-fun res!349150 () Bool)

(assert (=> b!556873 (=> (not res!349150) (not e!320817))))

(assert (=> b!556873 (= res!349150 (validKeyInArray!0 (select (arr!16843 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556874 () Bool)

(assert (=> b!556874 (= e!320816 e!320815)))

(declare-fun c!64200 () Bool)

(assert (=> b!556874 (= c!64200 (validKeyInArray!0 (select (arr!16843 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32334 () Bool)

(assert (=> bm!32334 (= call!32337 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64200 (Cons!10826 (select (arr!16843 a!3118) #b00000000000000000000000000000000) Nil!10827) Nil!10827)))))

(declare-fun b!556875 () Bool)

(assert (=> b!556875 (= e!320815 call!32337)))

(declare-fun d!83409 () Bool)

(declare-fun res!349149 () Bool)

(assert (=> d!83409 (=> res!349149 e!320818)))

(assert (=> d!83409 (= res!349149 (bvsge #b00000000000000000000000000000000 (size!17207 a!3118)))))

(assert (=> d!83409 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10827) e!320818)))

(assert (= (and d!83409 (not res!349149)) b!556873))

(assert (= (and b!556873 res!349150) b!556871))

(assert (= (and b!556873 res!349148) b!556874))

(assert (= (and b!556874 c!64200) b!556872))

(assert (= (and b!556874 (not c!64200)) b!556875))

(assert (= (or b!556872 b!556875) bm!32334))

(assert (=> b!556871 m!535045))

(assert (=> b!556871 m!535045))

(declare-fun m!535049 () Bool)

(assert (=> b!556871 m!535049))

(assert (=> b!556873 m!535045))

(assert (=> b!556873 m!535045))

(declare-fun m!535051 () Bool)

(assert (=> b!556873 m!535051))

(assert (=> b!556874 m!535045))

(assert (=> b!556874 m!535045))

(assert (=> b!556874 m!535051))

(assert (=> bm!32334 m!535045))

(declare-fun m!535053 () Bool)

(assert (=> bm!32334 m!535053))

(assert (=> b!556767 d!83409))

(declare-fun b!556940 () Bool)

(declare-fun e!320858 () SeekEntryResult!5248)

(assert (=> b!556940 (= e!320858 (Intermediate!5248 false lt!253031 #b00000000000000000000000000000000))))

(declare-fun lt!253105 () SeekEntryResult!5248)

(declare-fun b!556941 () Bool)

(assert (=> b!556941 (and (bvsge (index!23221 lt!253105) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253105) (size!17207 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)))))))

(declare-fun e!320861 () Bool)

(assert (=> b!556941 (= e!320861 (= (select (arr!16843 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118))) (index!23221 lt!253105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!556942 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556942 (= e!320858 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253031 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)) mask!3119))))

(declare-fun d!83413 () Bool)

(declare-fun e!320862 () Bool)

(assert (=> d!83413 e!320862))

(declare-fun c!64224 () Bool)

(assert (=> d!83413 (= c!64224 (and ((_ is Intermediate!5248) lt!253105) (undefined!6060 lt!253105)))))

(declare-fun e!320859 () SeekEntryResult!5248)

(assert (=> d!83413 (= lt!253105 e!320859)))

(declare-fun c!64226 () Bool)

(assert (=> d!83413 (= c!64226 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253104 () (_ BitVec 64))

(assert (=> d!83413 (= lt!253104 (select (arr!16843 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118))) lt!253031))))

(assert (=> d!83413 (validMask!0 mask!3119)))

(assert (=> d!83413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253031 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)) mask!3119) lt!253105)))

(declare-fun b!556943 () Bool)

(assert (=> b!556943 (and (bvsge (index!23221 lt!253105) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253105) (size!17207 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)))))))

(declare-fun res!349170 () Bool)

(assert (=> b!556943 (= res!349170 (= (select (arr!16843 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118))) (index!23221 lt!253105)) (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!556943 (=> res!349170 e!320861)))

(declare-fun e!320860 () Bool)

(assert (=> b!556943 (= e!320860 e!320861)))

(declare-fun b!556944 () Bool)

(assert (=> b!556944 (= e!320859 (Intermediate!5248 true lt!253031 #b00000000000000000000000000000000))))

(declare-fun b!556945 () Bool)

(assert (=> b!556945 (= e!320862 e!320860)))

(declare-fun res!349169 () Bool)

(assert (=> b!556945 (= res!349169 (and ((_ is Intermediate!5248) lt!253105) (not (undefined!6060 lt!253105)) (bvslt (x!52261 lt!253105) #b01111111111111111111111111111110) (bvsge (x!52261 lt!253105) #b00000000000000000000000000000000) (bvsge (x!52261 lt!253105) #b00000000000000000000000000000000)))))

(assert (=> b!556945 (=> (not res!349169) (not e!320860))))

(declare-fun b!556946 () Bool)

(assert (=> b!556946 (= e!320862 (bvsge (x!52261 lt!253105) #b01111111111111111111111111111110))))

(declare-fun b!556947 () Bool)

(assert (=> b!556947 (and (bvsge (index!23221 lt!253105) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253105) (size!17207 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118)))))))

(declare-fun res!349171 () Bool)

(assert (=> b!556947 (= res!349171 (= (select (arr!16843 (array!35071 (store (arr!16843 a!3118) i!1132 k0!1914) (size!17207 a!3118))) (index!23221 lt!253105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556947 (=> res!349171 e!320861)))

(declare-fun b!556948 () Bool)

(assert (=> b!556948 (= e!320859 e!320858)))

(declare-fun c!64225 () Bool)

(assert (=> b!556948 (= c!64225 (or (= lt!253104 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253104 lt!253104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83413 c!64226) b!556944))

(assert (= (and d!83413 (not c!64226)) b!556948))

(assert (= (and b!556948 c!64225) b!556940))

(assert (= (and b!556948 (not c!64225)) b!556942))

(assert (= (and d!83413 c!64224) b!556946))

(assert (= (and d!83413 (not c!64224)) b!556945))

(assert (= (and b!556945 res!349169) b!556943))

(assert (= (and b!556943 (not res!349170)) b!556947))

(assert (= (and b!556947 (not res!349171)) b!556941))

(declare-fun m!535097 () Bool)

(assert (=> b!556947 m!535097))

(assert (=> b!556941 m!535097))

(declare-fun m!535099 () Bool)

(assert (=> d!83413 m!535099))

(assert (=> d!83413 m!534917))

(declare-fun m!535101 () Bool)

(assert (=> b!556942 m!535101))

(assert (=> b!556942 m!535101))

(assert (=> b!556942 m!534941))

(declare-fun m!535103 () Bool)

(assert (=> b!556942 m!535103))

(assert (=> b!556943 m!535097))

(assert (=> b!556762 d!83413))

(declare-fun b!556949 () Bool)

(declare-fun e!320863 () SeekEntryResult!5248)

(assert (=> b!556949 (= e!320863 (Intermediate!5248 false lt!253029 #b00000000000000000000000000000000))))

(declare-fun b!556950 () Bool)

(declare-fun lt!253107 () SeekEntryResult!5248)

(assert (=> b!556950 (and (bvsge (index!23221 lt!253107) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253107) (size!17207 a!3118)))))

(declare-fun e!320866 () Bool)

(assert (=> b!556950 (= e!320866 (= (select (arr!16843 a!3118) (index!23221 lt!253107)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!556951 () Bool)

(assert (=> b!556951 (= e!320863 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253029 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16843 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83431 () Bool)

(declare-fun e!320867 () Bool)

(assert (=> d!83431 e!320867))

(declare-fun c!64227 () Bool)

(assert (=> d!83431 (= c!64227 (and ((_ is Intermediate!5248) lt!253107) (undefined!6060 lt!253107)))))

(declare-fun e!320864 () SeekEntryResult!5248)

(assert (=> d!83431 (= lt!253107 e!320864)))

(declare-fun c!64229 () Bool)

(assert (=> d!83431 (= c!64229 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253106 () (_ BitVec 64))

(assert (=> d!83431 (= lt!253106 (select (arr!16843 a!3118) lt!253029))))

(assert (=> d!83431 (validMask!0 mask!3119)))

(assert (=> d!83431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253029 (select (arr!16843 a!3118) j!142) a!3118 mask!3119) lt!253107)))

(declare-fun b!556952 () Bool)

(assert (=> b!556952 (and (bvsge (index!23221 lt!253107) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253107) (size!17207 a!3118)))))

(declare-fun res!349173 () Bool)

(assert (=> b!556952 (= res!349173 (= (select (arr!16843 a!3118) (index!23221 lt!253107)) (select (arr!16843 a!3118) j!142)))))

(assert (=> b!556952 (=> res!349173 e!320866)))

(declare-fun e!320865 () Bool)

(assert (=> b!556952 (= e!320865 e!320866)))

(declare-fun b!556953 () Bool)

(assert (=> b!556953 (= e!320864 (Intermediate!5248 true lt!253029 #b00000000000000000000000000000000))))

(declare-fun b!556954 () Bool)

(assert (=> b!556954 (= e!320867 e!320865)))

(declare-fun res!349172 () Bool)

(assert (=> b!556954 (= res!349172 (and ((_ is Intermediate!5248) lt!253107) (not (undefined!6060 lt!253107)) (bvslt (x!52261 lt!253107) #b01111111111111111111111111111110) (bvsge (x!52261 lt!253107) #b00000000000000000000000000000000) (bvsge (x!52261 lt!253107) #b00000000000000000000000000000000)))))

(assert (=> b!556954 (=> (not res!349172) (not e!320865))))

(declare-fun b!556955 () Bool)

(assert (=> b!556955 (= e!320867 (bvsge (x!52261 lt!253107) #b01111111111111111111111111111110))))

(declare-fun b!556956 () Bool)

(assert (=> b!556956 (and (bvsge (index!23221 lt!253107) #b00000000000000000000000000000000) (bvslt (index!23221 lt!253107) (size!17207 a!3118)))))

(declare-fun res!349174 () Bool)

(assert (=> b!556956 (= res!349174 (= (select (arr!16843 a!3118) (index!23221 lt!253107)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556956 (=> res!349174 e!320866)))

(declare-fun b!556957 () Bool)

(assert (=> b!556957 (= e!320864 e!320863)))

(declare-fun c!64228 () Bool)

(assert (=> b!556957 (= c!64228 (or (= lt!253106 (select (arr!16843 a!3118) j!142)) (= (bvadd lt!253106 lt!253106) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83431 c!64229) b!556953))

(assert (= (and d!83431 (not c!64229)) b!556957))

(assert (= (and b!556957 c!64228) b!556949))

(assert (= (and b!556957 (not c!64228)) b!556951))

(assert (= (and d!83431 c!64227) b!556955))

(assert (= (and d!83431 (not c!64227)) b!556954))

(assert (= (and b!556954 res!349172) b!556952))

(assert (= (and b!556952 (not res!349173)) b!556956))

(assert (= (and b!556956 (not res!349174)) b!556950))

(declare-fun m!535105 () Bool)

(assert (=> b!556956 m!535105))

(assert (=> b!556950 m!535105))

(declare-fun m!535107 () Bool)

(assert (=> d!83431 m!535107))

(assert (=> d!83431 m!534917))

(declare-fun m!535109 () Bool)

(assert (=> b!556951 m!535109))

(assert (=> b!556951 m!535109))

(assert (=> b!556951 m!534925))

(declare-fun m!535111 () Bool)

(assert (=> b!556951 m!535111))

(assert (=> b!556952 m!535105))

(assert (=> b!556762 d!83431))

(declare-fun d!83433 () Bool)

(declare-fun lt!253116 () (_ BitVec 32))

(declare-fun lt!253115 () (_ BitVec 32))

(assert (=> d!83433 (= lt!253116 (bvmul (bvxor lt!253115 (bvlshr lt!253115 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83433 (= lt!253115 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83433 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349175 (let ((h!11817 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52265 (bvmul (bvxor h!11817 (bvlshr h!11817 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52265 (bvlshr x!52265 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349175 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349175 #b00000000000000000000000000000000))))))

(assert (=> d!83433 (= (toIndex!0 (select (store (arr!16843 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253116 (bvlshr lt!253116 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556762 d!83433))

(declare-fun d!83437 () Bool)

(declare-fun lt!253118 () (_ BitVec 32))

(declare-fun lt!253117 () (_ BitVec 32))

(assert (=> d!83437 (= lt!253118 (bvmul (bvxor lt!253117 (bvlshr lt!253117 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83437 (= lt!253117 ((_ extract 31 0) (bvand (bvxor (select (arr!16843 a!3118) j!142) (bvlshr (select (arr!16843 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83437 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349175 (let ((h!11817 ((_ extract 31 0) (bvand (bvxor (select (arr!16843 a!3118) j!142) (bvlshr (select (arr!16843 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52265 (bvmul (bvxor h!11817 (bvlshr h!11817 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52265 (bvlshr x!52265 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349175 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349175 #b00000000000000000000000000000000))))))

(assert (=> d!83437 (= (toIndex!0 (select (arr!16843 a!3118) j!142) mask!3119) (bvand (bvxor lt!253118 (bvlshr lt!253118 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556762 d!83437))

(declare-fun b!557005 () Bool)

(declare-fun e!320899 () Bool)

(declare-fun call!32346 () Bool)

(assert (=> b!557005 (= e!320899 call!32346)))

(declare-fun d!83439 () Bool)

(declare-fun res!349195 () Bool)

(declare-fun e!320901 () Bool)

(assert (=> d!83439 (=> res!349195 e!320901)))

(assert (=> d!83439 (= res!349195 (bvsge #b00000000000000000000000000000000 (size!17207 a!3118)))))

(assert (=> d!83439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320901)))

(declare-fun b!557006 () Bool)

(declare-fun e!320900 () Bool)

(assert (=> b!557006 (= e!320900 call!32346)))

(declare-fun b!557007 () Bool)

(assert (=> b!557007 (= e!320901 e!320899)))

(declare-fun c!64244 () Bool)

(assert (=> b!557007 (= c!64244 (validKeyInArray!0 (select (arr!16843 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557008 () Bool)

(assert (=> b!557008 (= e!320899 e!320900)))

(declare-fun lt!253130 () (_ BitVec 64))

(assert (=> b!557008 (= lt!253130 (select (arr!16843 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253131 () Unit!17341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35070 (_ BitVec 64) (_ BitVec 32)) Unit!17341)

(assert (=> b!557008 (= lt!253131 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253130 #b00000000000000000000000000000000))))

(assert (=> b!557008 (arrayContainsKey!0 a!3118 lt!253130 #b00000000000000000000000000000000)))

(declare-fun lt!253129 () Unit!17341)

(assert (=> b!557008 (= lt!253129 lt!253131)))

(declare-fun res!349196 () Bool)

(assert (=> b!557008 (= res!349196 (= (seekEntryOrOpen!0 (select (arr!16843 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5248 #b00000000000000000000000000000000)))))

(assert (=> b!557008 (=> (not res!349196) (not e!320900))))

(declare-fun bm!32343 () Bool)

(assert (=> bm!32343 (= call!32346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83439 (not res!349195)) b!557007))

(assert (= (and b!557007 c!64244) b!557008))

(assert (= (and b!557007 (not c!64244)) b!557005))

(assert (= (and b!557008 res!349196) b!557006))

(assert (= (or b!557006 b!557005) bm!32343))

(assert (=> b!557007 m!535045))

(assert (=> b!557007 m!535045))

(assert (=> b!557007 m!535051))

(assert (=> b!557008 m!535045))

(declare-fun m!535131 () Bool)

(assert (=> b!557008 m!535131))

(declare-fun m!535133 () Bool)

(assert (=> b!557008 m!535133))

(assert (=> b!557008 m!535045))

(declare-fun m!535135 () Bool)

(assert (=> b!557008 m!535135))

(declare-fun m!535137 () Bool)

(assert (=> bm!32343 m!535137))

(assert (=> b!556763 d!83439))

(declare-fun d!83443 () Bool)

(assert (=> d!83443 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50898 d!83443))

(declare-fun d!83453 () Bool)

(assert (=> d!83453 (= (array_inv!12702 a!3118) (bvsge (size!17207 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50898 d!83453))

(declare-fun b!557037 () Bool)

(declare-fun e!320916 () Bool)

(declare-fun call!32347 () Bool)

(assert (=> b!557037 (= e!320916 call!32347)))

(declare-fun d!83455 () Bool)

(declare-fun res!349204 () Bool)

(declare-fun e!320918 () Bool)

(assert (=> d!83455 (=> res!349204 e!320918)))

(assert (=> d!83455 (= res!349204 (bvsge j!142 (size!17207 a!3118)))))

(assert (=> d!83455 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320918)))

(declare-fun b!557038 () Bool)

(declare-fun e!320917 () Bool)

(assert (=> b!557038 (= e!320917 call!32347)))

(declare-fun b!557039 () Bool)

(assert (=> b!557039 (= e!320918 e!320916)))

(declare-fun c!64255 () Bool)

(assert (=> b!557039 (= c!64255 (validKeyInArray!0 (select (arr!16843 a!3118) j!142)))))

(declare-fun b!557040 () Bool)

(assert (=> b!557040 (= e!320916 e!320917)))

(declare-fun lt!253149 () (_ BitVec 64))

(assert (=> b!557040 (= lt!253149 (select (arr!16843 a!3118) j!142))))

(declare-fun lt!253150 () Unit!17341)

(assert (=> b!557040 (= lt!253150 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253149 j!142))))

(assert (=> b!557040 (arrayContainsKey!0 a!3118 lt!253149 #b00000000000000000000000000000000)))

(declare-fun lt!253148 () Unit!17341)

(assert (=> b!557040 (= lt!253148 lt!253150)))

(declare-fun res!349205 () Bool)

(assert (=> b!557040 (= res!349205 (= (seekEntryOrOpen!0 (select (arr!16843 a!3118) j!142) a!3118 mask!3119) (Found!5248 j!142)))))

(assert (=> b!557040 (=> (not res!349205) (not e!320917))))

(declare-fun bm!32344 () Bool)

(assert (=> bm!32344 (= call!32347 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83455 (not res!349204)) b!557039))

(assert (= (and b!557039 c!64255) b!557040))

(assert (= (and b!557039 (not c!64255)) b!557037))

(assert (= (and b!557040 res!349205) b!557038))

(assert (= (or b!557038 b!557037) bm!32344))

(assert (=> b!557039 m!534925))

(assert (=> b!557039 m!534925))

(assert (=> b!557039 m!534935))

(assert (=> b!557040 m!534925))

(declare-fun m!535155 () Bool)

(assert (=> b!557040 m!535155))

(declare-fun m!535157 () Bool)

(assert (=> b!557040 m!535157))

(assert (=> b!557040 m!534925))

(assert (=> b!557040 m!534953))

(declare-fun m!535159 () Bool)

(assert (=> bm!32344 m!535159))

(assert (=> b!556759 d!83455))

(declare-fun d!83457 () Bool)

(assert (=> d!83457 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253161 () Unit!17341)

(declare-fun choose!38 (array!35070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17341)

(assert (=> d!83457 (= lt!253161 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83457 (validMask!0 mask!3119)))

(assert (=> d!83457 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253161)))

(declare-fun bs!17360 () Bool)

(assert (= bs!17360 d!83457))

(assert (=> bs!17360 m!534927))

(declare-fun m!535161 () Bool)

(assert (=> bs!17360 m!535161))

(assert (=> bs!17360 m!534917))

(assert (=> b!556759 d!83457))

(declare-fun b!557067 () Bool)

(declare-fun e!320938 () SeekEntryResult!5248)

(declare-fun lt!253162 () SeekEntryResult!5248)

(assert (=> b!557067 (= e!320938 (Found!5248 (index!23221 lt!253162)))))

(declare-fun e!320936 () SeekEntryResult!5248)

(declare-fun b!557068 () Bool)

(assert (=> b!557068 (= e!320936 (seekKeyOrZeroReturnVacant!0 (x!52261 lt!253162) (index!23221 lt!253162) (index!23221 lt!253162) (select (arr!16843 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557069 () Bool)

(declare-fun e!320937 () SeekEntryResult!5248)

(assert (=> b!557069 (= e!320937 e!320938)))

(declare-fun lt!253163 () (_ BitVec 64))

(assert (=> b!557069 (= lt!253163 (select (arr!16843 a!3118) (index!23221 lt!253162)))))

(declare-fun c!64263 () Bool)

(assert (=> b!557069 (= c!64263 (= lt!253163 (select (arr!16843 a!3118) j!142)))))

(declare-fun b!557070 () Bool)

(declare-fun c!64264 () Bool)

(assert (=> b!557070 (= c!64264 (= lt!253163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557070 (= e!320938 e!320936)))

(declare-fun b!557071 () Bool)

(assert (=> b!557071 (= e!320936 (MissingZero!5248 (index!23221 lt!253162)))))

(declare-fun d!83459 () Bool)

(declare-fun lt!253164 () SeekEntryResult!5248)

(assert (=> d!83459 (and (or ((_ is Undefined!5248) lt!253164) (not ((_ is Found!5248) lt!253164)) (and (bvsge (index!23220 lt!253164) #b00000000000000000000000000000000) (bvslt (index!23220 lt!253164) (size!17207 a!3118)))) (or ((_ is Undefined!5248) lt!253164) ((_ is Found!5248) lt!253164) (not ((_ is MissingZero!5248) lt!253164)) (and (bvsge (index!23219 lt!253164) #b00000000000000000000000000000000) (bvslt (index!23219 lt!253164) (size!17207 a!3118)))) (or ((_ is Undefined!5248) lt!253164) ((_ is Found!5248) lt!253164) ((_ is MissingZero!5248) lt!253164) (not ((_ is MissingVacant!5248) lt!253164)) (and (bvsge (index!23222 lt!253164) #b00000000000000000000000000000000) (bvslt (index!23222 lt!253164) (size!17207 a!3118)))) (or ((_ is Undefined!5248) lt!253164) (ite ((_ is Found!5248) lt!253164) (= (select (arr!16843 a!3118) (index!23220 lt!253164)) (select (arr!16843 a!3118) j!142)) (ite ((_ is MissingZero!5248) lt!253164) (= (select (arr!16843 a!3118) (index!23219 lt!253164)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5248) lt!253164) (= (select (arr!16843 a!3118) (index!23222 lt!253164)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83459 (= lt!253164 e!320937)))

(declare-fun c!64265 () Bool)

(assert (=> d!83459 (= c!64265 (and ((_ is Intermediate!5248) lt!253162) (undefined!6060 lt!253162)))))

(assert (=> d!83459 (= lt!253162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16843 a!3118) j!142) mask!3119) (select (arr!16843 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83459 (validMask!0 mask!3119)))

(assert (=> d!83459 (= (seekEntryOrOpen!0 (select (arr!16843 a!3118) j!142) a!3118 mask!3119) lt!253164)))

(declare-fun b!557066 () Bool)

(assert (=> b!557066 (= e!320937 Undefined!5248)))

(assert (= (and d!83459 c!64265) b!557066))

(assert (= (and d!83459 (not c!64265)) b!557069))

(assert (= (and b!557069 c!64263) b!557067))

(assert (= (and b!557069 (not c!64263)) b!557070))

(assert (= (and b!557070 c!64264) b!557071))

(assert (= (and b!557070 (not c!64264)) b!557068))

(assert (=> b!557068 m!534925))

(declare-fun m!535171 () Bool)

(assert (=> b!557068 m!535171))

(declare-fun m!535173 () Bool)

(assert (=> b!557069 m!535173))

(declare-fun m!535175 () Bool)

(assert (=> d!83459 m!535175))

(assert (=> d!83459 m!534937))

(assert (=> d!83459 m!534925))

(declare-fun m!535177 () Bool)

(assert (=> d!83459 m!535177))

(assert (=> d!83459 m!534917))

(declare-fun m!535179 () Bool)

(assert (=> d!83459 m!535179))

(assert (=> d!83459 m!534925))

(assert (=> d!83459 m!534937))

(declare-fun m!535181 () Bool)

(assert (=> d!83459 m!535181))

(assert (=> b!556764 d!83459))

(check-sat (not b!557068) (not b!557008) (not d!83399) (not b!557040) (not b!557007) (not d!83457) (not b!556871) (not d!83413) (not b!557039) (not d!83431) (not d!83459) (not bm!32344) (not b!556951) (not b!556873) (not bm!32343) (not bm!32334) (not b!556843) (not b!556852) (not b!556942) (not b!556874))
(check-sat)
