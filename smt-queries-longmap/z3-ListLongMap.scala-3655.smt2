; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50472 () Bool)

(assert start!50472)

(declare-fun b!551713 () Bool)

(declare-fun res!344386 () Bool)

(declare-fun e!318419 () Bool)

(assert (=> b!551713 (=> (not res!344386) (not e!318419))))

(declare-datatypes ((array!34758 0))(
  ( (array!34759 (arr!16690 (Array (_ BitVec 32) (_ BitVec 64))) (size!17054 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34758)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551713 (= res!344386 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!344395 () Bool)

(assert (=> start!50472 (=> (not res!344395) (not e!318419))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50472 (= res!344395 (validMask!0 mask!3119))))

(assert (=> start!50472 e!318419))

(assert (=> start!50472 true))

(declare-fun array_inv!12549 (array!34758) Bool)

(assert (=> start!50472 (array_inv!12549 a!3118)))

(declare-fun b!551714 () Bool)

(declare-fun res!344389 () Bool)

(declare-fun e!318420 () Bool)

(assert (=> b!551714 (=> (not res!344389) (not e!318420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34758 (_ BitVec 32)) Bool)

(assert (=> b!551714 (= res!344389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551715 () Bool)

(declare-fun res!344390 () Bool)

(assert (=> b!551715 (=> (not res!344390) (not e!318419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551715 (= res!344390 (validKeyInArray!0 k0!1914))))

(declare-fun b!551716 () Bool)

(declare-fun res!344394 () Bool)

(assert (=> b!551716 (=> (not res!344394) (not e!318419))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551716 (= res!344394 (and (= (size!17054 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17054 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17054 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551717 () Bool)

(assert (=> b!551717 (= e!318419 e!318420)))

(declare-fun res!344393 () Bool)

(assert (=> b!551717 (=> (not res!344393) (not e!318420))))

(declare-datatypes ((SeekEntryResult!5095 0))(
  ( (MissingZero!5095 (index!22607 (_ BitVec 32))) (Found!5095 (index!22608 (_ BitVec 32))) (Intermediate!5095 (undefined!5907 Bool) (index!22609 (_ BitVec 32)) (x!51688 (_ BitVec 32))) (Undefined!5095) (MissingVacant!5095 (index!22610 (_ BitVec 32))) )
))
(declare-fun lt!250956 () SeekEntryResult!5095)

(assert (=> b!551717 (= res!344393 (or (= lt!250956 (MissingZero!5095 i!1132)) (= lt!250956 (MissingVacant!5095 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34758 (_ BitVec 32)) SeekEntryResult!5095)

(assert (=> b!551717 (= lt!250956 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551718 () Bool)

(assert (=> b!551718 (= e!318420 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(declare-fun e!318418 () Bool)

(assert (=> b!551718 e!318418))

(declare-fun res!344392 () Bool)

(assert (=> b!551718 (=> (not res!344392) (not e!318418))))

(assert (=> b!551718 (= res!344392 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17035 0))(
  ( (Unit!17036) )
))
(declare-fun lt!250957 () Unit!17035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17035)

(assert (=> b!551718 (= lt!250957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551719 () Bool)

(declare-fun res!344387 () Bool)

(assert (=> b!551719 (=> (not res!344387) (not e!318419))))

(assert (=> b!551719 (= res!344387 (validKeyInArray!0 (select (arr!16690 a!3118) j!142)))))

(declare-fun b!551720 () Bool)

(declare-fun res!344391 () Bool)

(assert (=> b!551720 (=> (not res!344391) (not e!318420))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34758 (_ BitVec 32)) SeekEntryResult!5095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551720 (= res!344391 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) (select (arr!16690 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)) mask!3119)))))

(declare-fun b!551721 () Bool)

(assert (=> b!551721 (= e!318418 (= (seekEntryOrOpen!0 (select (arr!16690 a!3118) j!142) a!3118 mask!3119) (Found!5095 j!142)))))

(declare-fun b!551722 () Bool)

(declare-fun res!344388 () Bool)

(assert (=> b!551722 (=> (not res!344388) (not e!318420))))

(declare-datatypes ((List!10677 0))(
  ( (Nil!10674) (Cons!10673 (h!11655 (_ BitVec 64)) (t!16897 List!10677)) )
))
(declare-fun arrayNoDuplicates!0 (array!34758 (_ BitVec 32) List!10677) Bool)

(assert (=> b!551722 (= res!344388 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10674))))

(assert (= (and start!50472 res!344395) b!551716))

(assert (= (and b!551716 res!344394) b!551719))

(assert (= (and b!551719 res!344387) b!551715))

(assert (= (and b!551715 res!344390) b!551713))

(assert (= (and b!551713 res!344386) b!551717))

(assert (= (and b!551717 res!344393) b!551714))

(assert (= (and b!551714 res!344389) b!551722))

(assert (= (and b!551722 res!344388) b!551720))

(assert (= (and b!551720 res!344391) b!551718))

(assert (= (and b!551718 res!344392) b!551721))

(declare-fun m!528851 () Bool)

(assert (=> b!551718 m!528851))

(declare-fun m!528853 () Bool)

(assert (=> b!551718 m!528853))

(declare-fun m!528855 () Bool)

(assert (=> b!551719 m!528855))

(assert (=> b!551719 m!528855))

(declare-fun m!528857 () Bool)

(assert (=> b!551719 m!528857))

(declare-fun m!528859 () Bool)

(assert (=> b!551713 m!528859))

(declare-fun m!528861 () Bool)

(assert (=> start!50472 m!528861))

(declare-fun m!528863 () Bool)

(assert (=> start!50472 m!528863))

(declare-fun m!528865 () Bool)

(assert (=> b!551717 m!528865))

(assert (=> b!551721 m!528855))

(assert (=> b!551721 m!528855))

(declare-fun m!528867 () Bool)

(assert (=> b!551721 m!528867))

(assert (=> b!551720 m!528855))

(declare-fun m!528869 () Bool)

(assert (=> b!551720 m!528869))

(assert (=> b!551720 m!528855))

(declare-fun m!528871 () Bool)

(assert (=> b!551720 m!528871))

(declare-fun m!528873 () Bool)

(assert (=> b!551720 m!528873))

(assert (=> b!551720 m!528871))

(declare-fun m!528875 () Bool)

(assert (=> b!551720 m!528875))

(assert (=> b!551720 m!528869))

(assert (=> b!551720 m!528855))

(declare-fun m!528877 () Bool)

(assert (=> b!551720 m!528877))

(declare-fun m!528879 () Bool)

(assert (=> b!551720 m!528879))

(assert (=> b!551720 m!528871))

(assert (=> b!551720 m!528873))

(declare-fun m!528881 () Bool)

(assert (=> b!551714 m!528881))

(declare-fun m!528883 () Bool)

(assert (=> b!551722 m!528883))

(declare-fun m!528885 () Bool)

(assert (=> b!551715 m!528885))

(check-sat (not b!551721) (not b!551715) (not b!551717) (not b!551713) (not b!551718) (not b!551714) (not b!551722) (not b!551719) (not b!551720) (not start!50472))
(check-sat)
(get-model)

(declare-fun b!551801 () Bool)

(declare-fun e!318459 () SeekEntryResult!5095)

(declare-fun lt!250976 () SeekEntryResult!5095)

(assert (=> b!551801 (= e!318459 (MissingZero!5095 (index!22609 lt!250976)))))

(declare-fun b!551802 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34758 (_ BitVec 32)) SeekEntryResult!5095)

(assert (=> b!551802 (= e!318459 (seekKeyOrZeroReturnVacant!0 (x!51688 lt!250976) (index!22609 lt!250976) (index!22609 lt!250976) k0!1914 a!3118 mask!3119))))

(declare-fun b!551803 () Bool)

(declare-fun c!64006 () Bool)

(declare-fun lt!250977 () (_ BitVec 64))

(assert (=> b!551803 (= c!64006 (= lt!250977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318458 () SeekEntryResult!5095)

(assert (=> b!551803 (= e!318458 e!318459)))

(declare-fun d!83115 () Bool)

(declare-fun lt!250978 () SeekEntryResult!5095)

(get-info :version)

(assert (=> d!83115 (and (or ((_ is Undefined!5095) lt!250978) (not ((_ is Found!5095) lt!250978)) (and (bvsge (index!22608 lt!250978) #b00000000000000000000000000000000) (bvslt (index!22608 lt!250978) (size!17054 a!3118)))) (or ((_ is Undefined!5095) lt!250978) ((_ is Found!5095) lt!250978) (not ((_ is MissingZero!5095) lt!250978)) (and (bvsge (index!22607 lt!250978) #b00000000000000000000000000000000) (bvslt (index!22607 lt!250978) (size!17054 a!3118)))) (or ((_ is Undefined!5095) lt!250978) ((_ is Found!5095) lt!250978) ((_ is MissingZero!5095) lt!250978) (not ((_ is MissingVacant!5095) lt!250978)) (and (bvsge (index!22610 lt!250978) #b00000000000000000000000000000000) (bvslt (index!22610 lt!250978) (size!17054 a!3118)))) (or ((_ is Undefined!5095) lt!250978) (ite ((_ is Found!5095) lt!250978) (= (select (arr!16690 a!3118) (index!22608 lt!250978)) k0!1914) (ite ((_ is MissingZero!5095) lt!250978) (= (select (arr!16690 a!3118) (index!22607 lt!250978)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5095) lt!250978) (= (select (arr!16690 a!3118) (index!22610 lt!250978)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318457 () SeekEntryResult!5095)

(assert (=> d!83115 (= lt!250978 e!318457)))

(declare-fun c!64007 () Bool)

(assert (=> d!83115 (= c!64007 (and ((_ is Intermediate!5095) lt!250976) (undefined!5907 lt!250976)))))

(assert (=> d!83115 (= lt!250976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83115 (validMask!0 mask!3119)))

(assert (=> d!83115 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250978)))

(declare-fun b!551804 () Bool)

(assert (=> b!551804 (= e!318458 (Found!5095 (index!22609 lt!250976)))))

(declare-fun b!551805 () Bool)

(assert (=> b!551805 (= e!318457 Undefined!5095)))

(declare-fun b!551806 () Bool)

(assert (=> b!551806 (= e!318457 e!318458)))

(assert (=> b!551806 (= lt!250977 (select (arr!16690 a!3118) (index!22609 lt!250976)))))

(declare-fun c!64005 () Bool)

(assert (=> b!551806 (= c!64005 (= lt!250977 k0!1914))))

(assert (= (and d!83115 c!64007) b!551805))

(assert (= (and d!83115 (not c!64007)) b!551806))

(assert (= (and b!551806 c!64005) b!551804))

(assert (= (and b!551806 (not c!64005)) b!551803))

(assert (= (and b!551803 c!64006) b!551801))

(assert (= (and b!551803 (not c!64006)) b!551802))

(declare-fun m!528963 () Bool)

(assert (=> b!551802 m!528963))

(declare-fun m!528965 () Bool)

(assert (=> d!83115 m!528965))

(declare-fun m!528967 () Bool)

(assert (=> d!83115 m!528967))

(assert (=> d!83115 m!528861))

(declare-fun m!528969 () Bool)

(assert (=> d!83115 m!528969))

(declare-fun m!528971 () Bool)

(assert (=> d!83115 m!528971))

(declare-fun m!528973 () Bool)

(assert (=> d!83115 m!528973))

(assert (=> d!83115 m!528971))

(declare-fun m!528975 () Bool)

(assert (=> b!551806 m!528975))

(assert (=> b!551717 d!83115))

(declare-fun b!551817 () Bool)

(declare-fun e!318469 () Bool)

(declare-fun e!318470 () Bool)

(assert (=> b!551817 (= e!318469 e!318470)))

(declare-fun c!64010 () Bool)

(assert (=> b!551817 (= c!64010 (validKeyInArray!0 (select (arr!16690 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551818 () Bool)

(declare-fun e!318468 () Bool)

(assert (=> b!551818 (= e!318468 e!318469)))

(declare-fun res!344470 () Bool)

(assert (=> b!551818 (=> (not res!344470) (not e!318469))))

(declare-fun e!318471 () Bool)

(assert (=> b!551818 (= res!344470 (not e!318471))))

(declare-fun res!344469 () Bool)

(assert (=> b!551818 (=> (not res!344469) (not e!318471))))

(assert (=> b!551818 (= res!344469 (validKeyInArray!0 (select (arr!16690 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551820 () Bool)

(declare-fun contains!2814 (List!10677 (_ BitVec 64)) Bool)

(assert (=> b!551820 (= e!318471 (contains!2814 Nil!10674 (select (arr!16690 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551821 () Bool)

(declare-fun call!32295 () Bool)

(assert (=> b!551821 (= e!318470 call!32295)))

(declare-fun bm!32292 () Bool)

(assert (=> bm!32292 (= call!32295 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64010 (Cons!10673 (select (arr!16690 a!3118) #b00000000000000000000000000000000) Nil!10674) Nil!10674)))))

(declare-fun b!551819 () Bool)

(assert (=> b!551819 (= e!318470 call!32295)))

(declare-fun d!83123 () Bool)

(declare-fun res!344468 () Bool)

(assert (=> d!83123 (=> res!344468 e!318468)))

(assert (=> d!83123 (= res!344468 (bvsge #b00000000000000000000000000000000 (size!17054 a!3118)))))

(assert (=> d!83123 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10674) e!318468)))

(assert (= (and d!83123 (not res!344468)) b!551818))

(assert (= (and b!551818 res!344469) b!551820))

(assert (= (and b!551818 res!344470) b!551817))

(assert (= (and b!551817 c!64010) b!551819))

(assert (= (and b!551817 (not c!64010)) b!551821))

(assert (= (or b!551819 b!551821) bm!32292))

(declare-fun m!528977 () Bool)

(assert (=> b!551817 m!528977))

(assert (=> b!551817 m!528977))

(declare-fun m!528979 () Bool)

(assert (=> b!551817 m!528979))

(assert (=> b!551818 m!528977))

(assert (=> b!551818 m!528977))

(assert (=> b!551818 m!528979))

(assert (=> b!551820 m!528977))

(assert (=> b!551820 m!528977))

(declare-fun m!528981 () Bool)

(assert (=> b!551820 m!528981))

(assert (=> bm!32292 m!528977))

(declare-fun m!528983 () Bool)

(assert (=> bm!32292 m!528983))

(assert (=> b!551722 d!83123))

(declare-fun b!551822 () Bool)

(declare-fun e!318474 () SeekEntryResult!5095)

(declare-fun lt!250979 () SeekEntryResult!5095)

(assert (=> b!551822 (= e!318474 (MissingZero!5095 (index!22609 lt!250979)))))

(declare-fun b!551823 () Bool)

(assert (=> b!551823 (= e!318474 (seekKeyOrZeroReturnVacant!0 (x!51688 lt!250979) (index!22609 lt!250979) (index!22609 lt!250979) (select (arr!16690 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551824 () Bool)

(declare-fun c!64012 () Bool)

(declare-fun lt!250980 () (_ BitVec 64))

(assert (=> b!551824 (= c!64012 (= lt!250980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318473 () SeekEntryResult!5095)

(assert (=> b!551824 (= e!318473 e!318474)))

(declare-fun d!83129 () Bool)

(declare-fun lt!250981 () SeekEntryResult!5095)

(assert (=> d!83129 (and (or ((_ is Undefined!5095) lt!250981) (not ((_ is Found!5095) lt!250981)) (and (bvsge (index!22608 lt!250981) #b00000000000000000000000000000000) (bvslt (index!22608 lt!250981) (size!17054 a!3118)))) (or ((_ is Undefined!5095) lt!250981) ((_ is Found!5095) lt!250981) (not ((_ is MissingZero!5095) lt!250981)) (and (bvsge (index!22607 lt!250981) #b00000000000000000000000000000000) (bvslt (index!22607 lt!250981) (size!17054 a!3118)))) (or ((_ is Undefined!5095) lt!250981) ((_ is Found!5095) lt!250981) ((_ is MissingZero!5095) lt!250981) (not ((_ is MissingVacant!5095) lt!250981)) (and (bvsge (index!22610 lt!250981) #b00000000000000000000000000000000) (bvslt (index!22610 lt!250981) (size!17054 a!3118)))) (or ((_ is Undefined!5095) lt!250981) (ite ((_ is Found!5095) lt!250981) (= (select (arr!16690 a!3118) (index!22608 lt!250981)) (select (arr!16690 a!3118) j!142)) (ite ((_ is MissingZero!5095) lt!250981) (= (select (arr!16690 a!3118) (index!22607 lt!250981)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5095) lt!250981) (= (select (arr!16690 a!3118) (index!22610 lt!250981)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318472 () SeekEntryResult!5095)

(assert (=> d!83129 (= lt!250981 e!318472)))

(declare-fun c!64013 () Bool)

(assert (=> d!83129 (= c!64013 (and ((_ is Intermediate!5095) lt!250979) (undefined!5907 lt!250979)))))

(assert (=> d!83129 (= lt!250979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) (select (arr!16690 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83129 (validMask!0 mask!3119)))

(assert (=> d!83129 (= (seekEntryOrOpen!0 (select (arr!16690 a!3118) j!142) a!3118 mask!3119) lt!250981)))

(declare-fun b!551825 () Bool)

(assert (=> b!551825 (= e!318473 (Found!5095 (index!22609 lt!250979)))))

(declare-fun b!551826 () Bool)

(assert (=> b!551826 (= e!318472 Undefined!5095)))

(declare-fun b!551827 () Bool)

(assert (=> b!551827 (= e!318472 e!318473)))

(assert (=> b!551827 (= lt!250980 (select (arr!16690 a!3118) (index!22609 lt!250979)))))

(declare-fun c!64011 () Bool)

(assert (=> b!551827 (= c!64011 (= lt!250980 (select (arr!16690 a!3118) j!142)))))

(assert (= (and d!83129 c!64013) b!551826))

(assert (= (and d!83129 (not c!64013)) b!551827))

(assert (= (and b!551827 c!64011) b!551825))

(assert (= (and b!551827 (not c!64011)) b!551824))

(assert (= (and b!551824 c!64012) b!551822))

(assert (= (and b!551824 (not c!64012)) b!551823))

(assert (=> b!551823 m!528855))

(declare-fun m!528985 () Bool)

(assert (=> b!551823 m!528985))

(declare-fun m!528987 () Bool)

(assert (=> d!83129 m!528987))

(declare-fun m!528989 () Bool)

(assert (=> d!83129 m!528989))

(assert (=> d!83129 m!528861))

(declare-fun m!528991 () Bool)

(assert (=> d!83129 m!528991))

(assert (=> d!83129 m!528869))

(assert (=> d!83129 m!528855))

(assert (=> d!83129 m!528877))

(assert (=> d!83129 m!528855))

(assert (=> d!83129 m!528869))

(declare-fun m!528993 () Bool)

(assert (=> b!551827 m!528993))

(assert (=> b!551721 d!83129))

(declare-fun d!83131 () Bool)

(assert (=> d!83131 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551715 d!83131))

(declare-fun b!551892 () Bool)

(declare-fun lt!251019 () SeekEntryResult!5095)

(assert (=> b!551892 (and (bvsge (index!22609 lt!251019) #b00000000000000000000000000000000) (bvslt (index!22609 lt!251019) (size!17054 a!3118)))))

(declare-fun res!344491 () Bool)

(assert (=> b!551892 (= res!344491 (= (select (arr!16690 a!3118) (index!22609 lt!251019)) (select (arr!16690 a!3118) j!142)))))

(declare-fun e!318518 () Bool)

(assert (=> b!551892 (=> res!344491 e!318518)))

(declare-fun e!318517 () Bool)

(assert (=> b!551892 (= e!318517 e!318518)))

(declare-fun b!551893 () Bool)

(declare-fun e!318515 () SeekEntryResult!5095)

(assert (=> b!551893 (= e!318515 (Intermediate!5095 true (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551894 () Bool)

(declare-fun e!318516 () Bool)

(assert (=> b!551894 (= e!318516 (bvsge (x!51688 lt!251019) #b01111111111111111111111111111110))))

(declare-fun b!551895 () Bool)

(assert (=> b!551895 (and (bvsge (index!22609 lt!251019) #b00000000000000000000000000000000) (bvslt (index!22609 lt!251019) (size!17054 a!3118)))))

(assert (=> b!551895 (= e!318518 (= (select (arr!16690 a!3118) (index!22609 lt!251019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318519 () SeekEntryResult!5095)

(declare-fun b!551896 () Bool)

(assert (=> b!551896 (= e!318519 (Intermediate!5095 false (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551897 () Bool)

(assert (=> b!551897 (and (bvsge (index!22609 lt!251019) #b00000000000000000000000000000000) (bvslt (index!22609 lt!251019) (size!17054 a!3118)))))

(declare-fun res!344493 () Bool)

(assert (=> b!551897 (= res!344493 (= (select (arr!16690 a!3118) (index!22609 lt!251019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551897 (=> res!344493 e!318518)))

(declare-fun d!83133 () Bool)

(assert (=> d!83133 e!318516))

(declare-fun c!64038 () Bool)

(assert (=> d!83133 (= c!64038 (and ((_ is Intermediate!5095) lt!251019) (undefined!5907 lt!251019)))))

(assert (=> d!83133 (= lt!251019 e!318515)))

(declare-fun c!64037 () Bool)

(assert (=> d!83133 (= c!64037 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!251020 () (_ BitVec 64))

(assert (=> d!83133 (= lt!251020 (select (arr!16690 a!3118) (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119)))))

(assert (=> d!83133 (validMask!0 mask!3119)))

(assert (=> d!83133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) (select (arr!16690 a!3118) j!142) a!3118 mask!3119) lt!251019)))

(declare-fun b!551898 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551898 (= e!318519 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16690 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551899 () Bool)

(assert (=> b!551899 (= e!318516 e!318517)))

(declare-fun res!344492 () Bool)

(assert (=> b!551899 (= res!344492 (and ((_ is Intermediate!5095) lt!251019) (not (undefined!5907 lt!251019)) (bvslt (x!51688 lt!251019) #b01111111111111111111111111111110) (bvsge (x!51688 lt!251019) #b00000000000000000000000000000000) (bvsge (x!51688 lt!251019) #b00000000000000000000000000000000)))))

(assert (=> b!551899 (=> (not res!344492) (not e!318517))))

(declare-fun b!551900 () Bool)

(assert (=> b!551900 (= e!318515 e!318519)))

(declare-fun c!64036 () Bool)

(assert (=> b!551900 (= c!64036 (or (= lt!251020 (select (arr!16690 a!3118) j!142)) (= (bvadd lt!251020 lt!251020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83133 c!64037) b!551893))

(assert (= (and d!83133 (not c!64037)) b!551900))

(assert (= (and b!551900 c!64036) b!551896))

(assert (= (and b!551900 (not c!64036)) b!551898))

(assert (= (and d!83133 c!64038) b!551894))

(assert (= (and d!83133 (not c!64038)) b!551899))

(assert (= (and b!551899 res!344492) b!551892))

(assert (= (and b!551892 (not res!344491)) b!551897))

(assert (= (and b!551897 (not res!344493)) b!551895))

(declare-fun m!529039 () Bool)

(assert (=> b!551897 m!529039))

(assert (=> b!551898 m!528869))

(declare-fun m!529041 () Bool)

(assert (=> b!551898 m!529041))

(assert (=> b!551898 m!529041))

(assert (=> b!551898 m!528855))

(declare-fun m!529043 () Bool)

(assert (=> b!551898 m!529043))

(assert (=> b!551895 m!529039))

(assert (=> d!83133 m!528869))

(declare-fun m!529045 () Bool)

(assert (=> d!83133 m!529045))

(assert (=> d!83133 m!528861))

(assert (=> b!551892 m!529039))

(assert (=> b!551720 d!83133))

(declare-fun d!83147 () Bool)

(declare-fun lt!251030 () (_ BitVec 32))

(declare-fun lt!251029 () (_ BitVec 32))

(assert (=> d!83147 (= lt!251030 (bvmul (bvxor lt!251029 (bvlshr lt!251029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83147 (= lt!251029 ((_ extract 31 0) (bvand (bvxor (select (arr!16690 a!3118) j!142) (bvlshr (select (arr!16690 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83147 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344500 (let ((h!11658 ((_ extract 31 0) (bvand (bvxor (select (arr!16690 a!3118) j!142) (bvlshr (select (arr!16690 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51692 (bvmul (bvxor h!11658 (bvlshr h!11658 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51692 (bvlshr x!51692 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344500 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344500 #b00000000000000000000000000000000))))))

(assert (=> d!83147 (= (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) (bvand (bvxor lt!251030 (bvlshr lt!251030 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551720 d!83147))

(declare-fun lt!251031 () SeekEntryResult!5095)

(declare-fun b!551934 () Bool)

(assert (=> b!551934 (and (bvsge (index!22609 lt!251031) #b00000000000000000000000000000000) (bvslt (index!22609 lt!251031) (size!17054 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)))))))

(declare-fun res!344510 () Bool)

(assert (=> b!551934 (= res!344510 (= (select (arr!16690 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118))) (index!22609 lt!251031)) (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!318545 () Bool)

(assert (=> b!551934 (=> res!344510 e!318545)))

(declare-fun e!318544 () Bool)

(assert (=> b!551934 (= e!318544 e!318545)))

(declare-fun e!318542 () SeekEntryResult!5095)

(declare-fun b!551935 () Bool)

(assert (=> b!551935 (= e!318542 (Intermediate!5095 true (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551936 () Bool)

(declare-fun e!318543 () Bool)

(assert (=> b!551936 (= e!318543 (bvsge (x!51688 lt!251031) #b01111111111111111111111111111110))))

(declare-fun b!551937 () Bool)

(assert (=> b!551937 (and (bvsge (index!22609 lt!251031) #b00000000000000000000000000000000) (bvslt (index!22609 lt!251031) (size!17054 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)))))))

(assert (=> b!551937 (= e!318545 (= (select (arr!16690 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118))) (index!22609 lt!251031)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318546 () SeekEntryResult!5095)

(declare-fun b!551938 () Bool)

(assert (=> b!551938 (= e!318546 (Intermediate!5095 false (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551939 () Bool)

(assert (=> b!551939 (and (bvsge (index!22609 lt!251031) #b00000000000000000000000000000000) (bvslt (index!22609 lt!251031) (size!17054 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)))))))

(declare-fun res!344512 () Bool)

(assert (=> b!551939 (= res!344512 (= (select (arr!16690 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118))) (index!22609 lt!251031)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551939 (=> res!344512 e!318545)))

(declare-fun d!83151 () Bool)

(assert (=> d!83151 e!318543))

(declare-fun c!64050 () Bool)

(assert (=> d!83151 (= c!64050 (and ((_ is Intermediate!5095) lt!251031) (undefined!5907 lt!251031)))))

(assert (=> d!83151 (= lt!251031 e!318542)))

(declare-fun c!64049 () Bool)

(assert (=> d!83151 (= c!64049 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!251032 () (_ BitVec 64))

(assert (=> d!83151 (= lt!251032 (select (arr!16690 (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118))) (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!83151 (validMask!0 mask!3119)))

(assert (=> d!83151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)) mask!3119) lt!251031)))

(declare-fun b!551940 () Bool)

(assert (=> b!551940 (= e!318546 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) (array!34759 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)) mask!3119))))

(declare-fun b!551941 () Bool)

(assert (=> b!551941 (= e!318543 e!318544)))

(declare-fun res!344511 () Bool)

(assert (=> b!551941 (= res!344511 (and ((_ is Intermediate!5095) lt!251031) (not (undefined!5907 lt!251031)) (bvslt (x!51688 lt!251031) #b01111111111111111111111111111110) (bvsge (x!51688 lt!251031) #b00000000000000000000000000000000) (bvsge (x!51688 lt!251031) #b00000000000000000000000000000000)))))

(assert (=> b!551941 (=> (not res!344511) (not e!318544))))

(declare-fun b!551942 () Bool)

(assert (=> b!551942 (= e!318542 e!318546)))

(declare-fun c!64048 () Bool)

(assert (=> b!551942 (= c!64048 (or (= lt!251032 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!251032 lt!251032) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!83151 c!64049) b!551935))

(assert (= (and d!83151 (not c!64049)) b!551942))

(assert (= (and b!551942 c!64048) b!551938))

(assert (= (and b!551942 (not c!64048)) b!551940))

(assert (= (and d!83151 c!64050) b!551936))

(assert (= (and d!83151 (not c!64050)) b!551941))

(assert (= (and b!551941 res!344511) b!551934))

(assert (= (and b!551934 (not res!344510)) b!551939))

(assert (= (and b!551939 (not res!344512)) b!551937))

(declare-fun m!529051 () Bool)

(assert (=> b!551939 m!529051))

(assert (=> b!551940 m!528873))

(declare-fun m!529053 () Bool)

(assert (=> b!551940 m!529053))

(assert (=> b!551940 m!529053))

(assert (=> b!551940 m!528871))

(declare-fun m!529055 () Bool)

(assert (=> b!551940 m!529055))

(assert (=> b!551937 m!529051))

(assert (=> d!83151 m!528873))

(declare-fun m!529057 () Bool)

(assert (=> d!83151 m!529057))

(assert (=> d!83151 m!528861))

(assert (=> b!551934 m!529051))

(assert (=> b!551720 d!83151))

(declare-fun d!83153 () Bool)

(declare-fun lt!251034 () (_ BitVec 32))

(declare-fun lt!251033 () (_ BitVec 32))

(assert (=> d!83153 (= lt!251034 (bvmul (bvxor lt!251033 (bvlshr lt!251033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83153 (= lt!251033 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83153 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344500 (let ((h!11658 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51692 (bvmul (bvxor h!11658 (bvlshr h!11658 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51692 (bvlshr x!51692 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344500 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344500 #b00000000000000000000000000000000))))))

(assert (=> d!83153 (= (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!251034 (bvlshr lt!251034 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551720 d!83153))

(declare-fun b!551969 () Bool)

(declare-fun e!318565 () Bool)

(declare-fun e!318564 () Bool)

(assert (=> b!551969 (= e!318565 e!318564)))

(declare-fun c!64059 () Bool)

(assert (=> b!551969 (= c!64059 (validKeyInArray!0 (select (arr!16690 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551970 () Bool)

(declare-fun e!318563 () Bool)

(declare-fun call!32308 () Bool)

(assert (=> b!551970 (= e!318563 call!32308)))

(declare-fun b!551971 () Bool)

(assert (=> b!551971 (= e!318564 call!32308)))

(declare-fun d!83155 () Bool)

(declare-fun res!344524 () Bool)

(assert (=> d!83155 (=> res!344524 e!318565)))

(assert (=> d!83155 (= res!344524 (bvsge #b00000000000000000000000000000000 (size!17054 a!3118)))))

(assert (=> d!83155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318565)))

(declare-fun b!551972 () Bool)

(assert (=> b!551972 (= e!318564 e!318563)))

(declare-fun lt!251053 () (_ BitVec 64))

(assert (=> b!551972 (= lt!251053 (select (arr!16690 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!251054 () Unit!17035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34758 (_ BitVec 64) (_ BitVec 32)) Unit!17035)

(assert (=> b!551972 (= lt!251054 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251053 #b00000000000000000000000000000000))))

(assert (=> b!551972 (arrayContainsKey!0 a!3118 lt!251053 #b00000000000000000000000000000000)))

(declare-fun lt!251055 () Unit!17035)

(assert (=> b!551972 (= lt!251055 lt!251054)))

(declare-fun res!344525 () Bool)

(assert (=> b!551972 (= res!344525 (= (seekEntryOrOpen!0 (select (arr!16690 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5095 #b00000000000000000000000000000000)))))

(assert (=> b!551972 (=> (not res!344525) (not e!318563))))

(declare-fun bm!32305 () Bool)

(assert (=> bm!32305 (= call!32308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83155 (not res!344524)) b!551969))

(assert (= (and b!551969 c!64059) b!551972))

(assert (= (and b!551969 (not c!64059)) b!551971))

(assert (= (and b!551972 res!344525) b!551970))

(assert (= (or b!551970 b!551971) bm!32305))

(assert (=> b!551969 m!528977))

(assert (=> b!551969 m!528977))

(assert (=> b!551969 m!528979))

(assert (=> b!551972 m!528977))

(declare-fun m!529075 () Bool)

(assert (=> b!551972 m!529075))

(declare-fun m!529077 () Bool)

(assert (=> b!551972 m!529077))

(assert (=> b!551972 m!528977))

(declare-fun m!529079 () Bool)

(assert (=> b!551972 m!529079))

(declare-fun m!529081 () Bool)

(assert (=> bm!32305 m!529081))

(assert (=> b!551714 d!83155))

(declare-fun d!83167 () Bool)

(assert (=> d!83167 (= (validKeyInArray!0 (select (arr!16690 a!3118) j!142)) (and (not (= (select (arr!16690 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16690 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551719 d!83167))

(declare-fun d!83169 () Bool)

(assert (=> d!83169 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50472 d!83169))

(declare-fun d!83175 () Bool)

(assert (=> d!83175 (= (array_inv!12549 a!3118) (bvsge (size!17054 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50472 d!83175))

(declare-fun d!83177 () Bool)

(declare-fun res!344549 () Bool)

(declare-fun e!318597 () Bool)

(assert (=> d!83177 (=> res!344549 e!318597)))

(assert (=> d!83177 (= res!344549 (= (select (arr!16690 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83177 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318597)))

(declare-fun b!552019 () Bool)

(declare-fun e!318598 () Bool)

(assert (=> b!552019 (= e!318597 e!318598)))

(declare-fun res!344550 () Bool)

(assert (=> b!552019 (=> (not res!344550) (not e!318598))))

(assert (=> b!552019 (= res!344550 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17054 a!3118)))))

(declare-fun b!552020 () Bool)

(assert (=> b!552020 (= e!318598 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83177 (not res!344549)) b!552019))

(assert (= (and b!552019 res!344550) b!552020))

(assert (=> d!83177 m!528977))

(declare-fun m!529095 () Bool)

(assert (=> b!552020 m!529095))

(assert (=> b!551713 d!83177))

(declare-fun b!552021 () Bool)

(declare-fun e!318603 () Bool)

(declare-fun e!318602 () Bool)

(assert (=> b!552021 (= e!318603 e!318602)))

(declare-fun c!64072 () Bool)

(assert (=> b!552021 (= c!64072 (validKeyInArray!0 (select (arr!16690 a!3118) j!142)))))

(declare-fun b!552022 () Bool)

(declare-fun e!318601 () Bool)

(declare-fun call!32312 () Bool)

(assert (=> b!552022 (= e!318601 call!32312)))

(declare-fun b!552023 () Bool)

(assert (=> b!552023 (= e!318602 call!32312)))

(declare-fun d!83181 () Bool)

(declare-fun res!344551 () Bool)

(assert (=> d!83181 (=> res!344551 e!318603)))

(assert (=> d!83181 (= res!344551 (bvsge j!142 (size!17054 a!3118)))))

(assert (=> d!83181 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318603)))

(declare-fun b!552024 () Bool)

(assert (=> b!552024 (= e!318602 e!318601)))

(declare-fun lt!251068 () (_ BitVec 64))

(assert (=> b!552024 (= lt!251068 (select (arr!16690 a!3118) j!142))))

(declare-fun lt!251070 () Unit!17035)

(assert (=> b!552024 (= lt!251070 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251068 j!142))))

(assert (=> b!552024 (arrayContainsKey!0 a!3118 lt!251068 #b00000000000000000000000000000000)))

(declare-fun lt!251071 () Unit!17035)

(assert (=> b!552024 (= lt!251071 lt!251070)))

(declare-fun res!344553 () Bool)

(assert (=> b!552024 (= res!344553 (= (seekEntryOrOpen!0 (select (arr!16690 a!3118) j!142) a!3118 mask!3119) (Found!5095 j!142)))))

(assert (=> b!552024 (=> (not res!344553) (not e!318601))))

(declare-fun bm!32309 () Bool)

(assert (=> bm!32309 (= call!32312 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83181 (not res!344551)) b!552021))

(assert (= (and b!552021 c!64072) b!552024))

(assert (= (and b!552021 (not c!64072)) b!552023))

(assert (= (and b!552024 res!344553) b!552022))

(assert (= (or b!552022 b!552023) bm!32309))

(assert (=> b!552021 m!528855))

(assert (=> b!552021 m!528855))

(assert (=> b!552021 m!528857))

(assert (=> b!552024 m!528855))

(declare-fun m!529097 () Bool)

(assert (=> b!552024 m!529097))

(declare-fun m!529099 () Bool)

(assert (=> b!552024 m!529099))

(assert (=> b!552024 m!528855))

(assert (=> b!552024 m!528867))

(declare-fun m!529101 () Bool)

(assert (=> bm!32309 m!529101))

(assert (=> b!551718 d!83181))

(declare-fun d!83183 () Bool)

(assert (=> d!83183 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!251077 () Unit!17035)

(declare-fun choose!38 (array!34758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17035)

(assert (=> d!83183 (= lt!251077 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83183 (validMask!0 mask!3119)))

(assert (=> d!83183 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!251077)))

(declare-fun bs!17202 () Bool)

(assert (= bs!17202 d!83183))

(assert (=> bs!17202 m!528851))

(declare-fun m!529111 () Bool)

(assert (=> bs!17202 m!529111))

(assert (=> bs!17202 m!528861))

(assert (=> b!551718 d!83183))

(check-sat (not b!551820) (not bm!32309) (not b!551898) (not b!551818) (not b!552021) (not d!83129) (not d!83151) (not b!551969) (not b!551817) (not bm!32305) (not d!83183) (not b!551940) (not d!83115) (not b!551823) (not b!551972) (not b!552020) (not d!83133) (not bm!32292) (not b!552024) (not b!551802))
(check-sat)
