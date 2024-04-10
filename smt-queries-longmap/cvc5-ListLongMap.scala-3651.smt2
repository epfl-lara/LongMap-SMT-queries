; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50342 () Bool)

(assert start!50342)

(declare-fun b!550862 () Bool)

(declare-fun res!343832 () Bool)

(declare-fun e!317951 () Bool)

(assert (=> b!550862 (=> (not res!343832) (not e!317951))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34738 0))(
  ( (array!34739 (arr!16683 (Array (_ BitVec 32) (_ BitVec 64))) (size!17047 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34738)

(assert (=> b!550862 (= res!343832 (and (= (size!17047 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17047 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17047 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550863 () Bool)

(declare-fun res!343828 () Bool)

(assert (=> b!550863 (=> (not res!343828) (not e!317951))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550863 (= res!343828 (validKeyInArray!0 k!1914))))

(declare-fun b!550864 () Bool)

(declare-fun e!317955 () Bool)

(declare-fun lt!250639 () (_ BitVec 32))

(assert (=> b!550864 (= e!317955 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!250639 #b00000000000000000000000000000000) (bvslt lt!250639 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!317952 () Bool)

(assert (=> b!550864 e!317952))

(declare-fun res!343826 () Bool)

(assert (=> b!550864 (=> (not res!343826) (not e!317952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34738 (_ BitVec 32)) Bool)

(assert (=> b!550864 (= res!343826 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17038 0))(
  ( (Unit!17039) )
))
(declare-fun lt!250638 () Unit!17038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17038)

(assert (=> b!550864 (= lt!250638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550865 () Bool)

(declare-datatypes ((SeekEntryResult!5132 0))(
  ( (MissingZero!5132 (index!22755 (_ BitVec 32))) (Found!5132 (index!22756 (_ BitVec 32))) (Intermediate!5132 (undefined!5944 Bool) (index!22757 (_ BitVec 32)) (x!51684 (_ BitVec 32))) (Undefined!5132) (MissingVacant!5132 (index!22758 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34738 (_ BitVec 32)) SeekEntryResult!5132)

(assert (=> b!550865 (= e!317952 (= (seekEntryOrOpen!0 (select (arr!16683 a!3118) j!142) a!3118 mask!3119) (Found!5132 j!142)))))

(declare-fun b!550866 () Bool)

(declare-fun res!343830 () Bool)

(declare-fun e!317953 () Bool)

(assert (=> b!550866 (=> (not res!343830) (not e!317953))))

(assert (=> b!550866 (= res!343830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550867 () Bool)

(assert (=> b!550867 (= e!317953 e!317955)))

(declare-fun res!343829 () Bool)

(assert (=> b!550867 (=> (not res!343829) (not e!317955))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34738 (_ BitVec 32)) SeekEntryResult!5132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550867 (= res!343829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250639 (select (arr!16683 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118)) mask!3119)))))

(assert (=> b!550867 (= lt!250639 (toIndex!0 (select (arr!16683 a!3118) j!142) mask!3119))))

(declare-fun res!343824 () Bool)

(assert (=> start!50342 (=> (not res!343824) (not e!317951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50342 (= res!343824 (validMask!0 mask!3119))))

(assert (=> start!50342 e!317951))

(assert (=> start!50342 true))

(declare-fun array_inv!12479 (array!34738) Bool)

(assert (=> start!50342 (array_inv!12479 a!3118)))

(declare-fun b!550868 () Bool)

(assert (=> b!550868 (= e!317951 e!317953)))

(declare-fun res!343823 () Bool)

(assert (=> b!550868 (=> (not res!343823) (not e!317953))))

(declare-fun lt!250637 () SeekEntryResult!5132)

(assert (=> b!550868 (= res!343823 (or (= lt!250637 (MissingZero!5132 i!1132)) (= lt!250637 (MissingVacant!5132 i!1132))))))

(assert (=> b!550868 (= lt!250637 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550869 () Bool)

(declare-fun res!343825 () Bool)

(assert (=> b!550869 (=> (not res!343825) (not e!317953))))

(declare-datatypes ((List!10763 0))(
  ( (Nil!10760) (Cons!10759 (h!11735 (_ BitVec 64)) (t!16991 List!10763)) )
))
(declare-fun arrayNoDuplicates!0 (array!34738 (_ BitVec 32) List!10763) Bool)

(assert (=> b!550869 (= res!343825 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10760))))

(declare-fun b!550870 () Bool)

(declare-fun res!343831 () Bool)

(assert (=> b!550870 (=> (not res!343831) (not e!317951))))

(declare-fun arrayContainsKey!0 (array!34738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550870 (= res!343831 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550871 () Bool)

(declare-fun res!343827 () Bool)

(assert (=> b!550871 (=> (not res!343827) (not e!317951))))

(assert (=> b!550871 (= res!343827 (validKeyInArray!0 (select (arr!16683 a!3118) j!142)))))

(assert (= (and start!50342 res!343824) b!550862))

(assert (= (and b!550862 res!343832) b!550871))

(assert (= (and b!550871 res!343827) b!550863))

(assert (= (and b!550863 res!343828) b!550870))

(assert (= (and b!550870 res!343831) b!550868))

(assert (= (and b!550868 res!343823) b!550866))

(assert (= (and b!550866 res!343830) b!550869))

(assert (= (and b!550869 res!343825) b!550867))

(assert (= (and b!550867 res!343829) b!550864))

(assert (= (and b!550864 res!343826) b!550865))

(declare-fun m!527877 () Bool)

(assert (=> b!550868 m!527877))

(declare-fun m!527879 () Bool)

(assert (=> b!550871 m!527879))

(assert (=> b!550871 m!527879))

(declare-fun m!527881 () Bool)

(assert (=> b!550871 m!527881))

(assert (=> b!550867 m!527879))

(declare-fun m!527883 () Bool)

(assert (=> b!550867 m!527883))

(assert (=> b!550867 m!527879))

(declare-fun m!527885 () Bool)

(assert (=> b!550867 m!527885))

(declare-fun m!527887 () Bool)

(assert (=> b!550867 m!527887))

(assert (=> b!550867 m!527885))

(declare-fun m!527889 () Bool)

(assert (=> b!550867 m!527889))

(assert (=> b!550867 m!527879))

(declare-fun m!527891 () Bool)

(assert (=> b!550867 m!527891))

(declare-fun m!527893 () Bool)

(assert (=> b!550867 m!527893))

(assert (=> b!550867 m!527885))

(assert (=> b!550867 m!527887))

(declare-fun m!527895 () Bool)

(assert (=> b!550863 m!527895))

(declare-fun m!527897 () Bool)

(assert (=> b!550869 m!527897))

(assert (=> b!550865 m!527879))

(assert (=> b!550865 m!527879))

(declare-fun m!527899 () Bool)

(assert (=> b!550865 m!527899))

(declare-fun m!527901 () Bool)

(assert (=> start!50342 m!527901))

(declare-fun m!527903 () Bool)

(assert (=> start!50342 m!527903))

(declare-fun m!527905 () Bool)

(assert (=> b!550864 m!527905))

(declare-fun m!527907 () Bool)

(assert (=> b!550864 m!527907))

(declare-fun m!527909 () Bool)

(assert (=> b!550866 m!527909))

(declare-fun m!527911 () Bool)

(assert (=> b!550870 m!527911))

(push 1)

(assert (not b!550869))

(assert (not b!550871))

(assert (not b!550866))

(assert (not start!50342))

(assert (not b!550863))

(assert (not b!550868))

(assert (not b!550865))

(assert (not b!550870))

(assert (not b!550867))

(assert (not b!550864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82909 () Bool)

(declare-fun e!318006 () Bool)

(assert (=> d!82909 e!318006))

(declare-fun c!63862 () Bool)

(declare-fun lt!250674 () SeekEntryResult!5132)

(assert (=> d!82909 (= c!63862 (and (is-Intermediate!5132 lt!250674) (undefined!5944 lt!250674)))))

(declare-fun e!318007 () SeekEntryResult!5132)

(assert (=> d!82909 (= lt!250674 e!318007)))

(declare-fun c!63863 () Bool)

(assert (=> d!82909 (= c!63863 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250675 () (_ BitVec 64))

(assert (=> d!82909 (= lt!250675 (select (arr!16683 a!3118) lt!250639))))

(assert (=> d!82909 (validMask!0 mask!3119)))

(assert (=> d!82909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250639 (select (arr!16683 a!3118) j!142) a!3118 mask!3119) lt!250674)))

(declare-fun b!550962 () Bool)

(assert (=> b!550962 (and (bvsge (index!22757 lt!250674) #b00000000000000000000000000000000) (bvslt (index!22757 lt!250674) (size!17047 a!3118)))))

(declare-fun res!343906 () Bool)

(assert (=> b!550962 (= res!343906 (= (select (arr!16683 a!3118) (index!22757 lt!250674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318005 () Bool)

(assert (=> b!550962 (=> res!343906 e!318005)))

(declare-fun b!550963 () Bool)

(declare-fun e!318008 () Bool)

(assert (=> b!550963 (= e!318006 e!318008)))

(declare-fun res!343905 () Bool)

(assert (=> b!550963 (= res!343905 (and (is-Intermediate!5132 lt!250674) (not (undefined!5944 lt!250674)) (bvslt (x!51684 lt!250674) #b01111111111111111111111111111110) (bvsge (x!51684 lt!250674) #b00000000000000000000000000000000) (bvsge (x!51684 lt!250674) #b00000000000000000000000000000000)))))

(assert (=> b!550963 (=> (not res!343905) (not e!318008))))

(declare-fun b!550964 () Bool)

(assert (=> b!550964 (and (bvsge (index!22757 lt!250674) #b00000000000000000000000000000000) (bvslt (index!22757 lt!250674) (size!17047 a!3118)))))

(assert (=> b!550964 (= e!318005 (= (select (arr!16683 a!3118) (index!22757 lt!250674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550965 () Bool)

(declare-fun e!318009 () SeekEntryResult!5132)

(assert (=> b!550965 (= e!318007 e!318009)))

(declare-fun c!63861 () Bool)

(assert (=> b!550965 (= c!63861 (or (= lt!250675 (select (arr!16683 a!3118) j!142)) (= (bvadd lt!250675 lt!250675) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550966 () Bool)

(assert (=> b!550966 (= e!318007 (Intermediate!5132 true lt!250639 #b00000000000000000000000000000000))))

(declare-fun b!550967 () Bool)

(assert (=> b!550967 (= e!318006 (bvsge (x!51684 lt!250674) #b01111111111111111111111111111110))))

(declare-fun b!550968 () Bool)

(assert (=> b!550968 (and (bvsge (index!22757 lt!250674) #b00000000000000000000000000000000) (bvslt (index!22757 lt!250674) (size!17047 a!3118)))))

(declare-fun res!343907 () Bool)

(assert (=> b!550968 (= res!343907 (= (select (arr!16683 a!3118) (index!22757 lt!250674)) (select (arr!16683 a!3118) j!142)))))

(assert (=> b!550968 (=> res!343907 e!318005)))

(assert (=> b!550968 (= e!318008 e!318005)))

(declare-fun b!550969 () Bool)

(assert (=> b!550969 (= e!318009 (Intermediate!5132 false lt!250639 #b00000000000000000000000000000000))))

(declare-fun b!550970 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550970 (= e!318009 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!250639 #b00000000000000000000000000000000 mask!3119) (select (arr!16683 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!82909 c!63863) b!550966))

(assert (= (and d!82909 (not c!63863)) b!550965))

(assert (= (and b!550965 c!63861) b!550969))

(assert (= (and b!550965 (not c!63861)) b!550970))

(assert (= (and d!82909 c!63862) b!550967))

(assert (= (and d!82909 (not c!63862)) b!550963))

(assert (= (and b!550963 res!343905) b!550968))

(assert (= (and b!550968 (not res!343907)) b!550962))

(assert (= (and b!550962 (not res!343906)) b!550964))

(declare-fun m!527993 () Bool)

(assert (=> b!550970 m!527993))

(assert (=> b!550970 m!527993))

(assert (=> b!550970 m!527879))

(declare-fun m!527995 () Bool)

(assert (=> b!550970 m!527995))

(declare-fun m!527997 () Bool)

(assert (=> b!550964 m!527997))

(assert (=> b!550962 m!527997))

(assert (=> b!550968 m!527997))

(declare-fun m!527999 () Bool)

(assert (=> d!82909 m!527999))

(assert (=> d!82909 m!527901))

(assert (=> b!550867 d!82909))

(declare-fun d!82917 () Bool)

(declare-fun e!318011 () Bool)

(assert (=> d!82917 e!318011))

(declare-fun c!63865 () Bool)

(declare-fun lt!250676 () SeekEntryResult!5132)

(assert (=> d!82917 (= c!63865 (and (is-Intermediate!5132 lt!250676) (undefined!5944 lt!250676)))))

(declare-fun e!318012 () SeekEntryResult!5132)

(assert (=> d!82917 (= lt!250676 e!318012)))

(declare-fun c!63866 () Bool)

(assert (=> d!82917 (= c!63866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250677 () (_ BitVec 64))

(assert (=> d!82917 (= lt!250677 (select (arr!16683 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118))) (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119)))))

(assert (=> d!82917 (validMask!0 mask!3119)))

(assert (=> d!82917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118)) mask!3119) lt!250676)))

(declare-fun b!550971 () Bool)

(assert (=> b!550971 (and (bvsge (index!22757 lt!250676) #b00000000000000000000000000000000) (bvslt (index!22757 lt!250676) (size!17047 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118)))))))

(declare-fun res!343909 () Bool)

(assert (=> b!550971 (= res!343909 (= (select (arr!16683 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118))) (index!22757 lt!250676)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318010 () Bool)

(assert (=> b!550971 (=> res!343909 e!318010)))

(declare-fun b!550972 () Bool)

(declare-fun e!318013 () Bool)

(assert (=> b!550972 (= e!318011 e!318013)))

(declare-fun res!343908 () Bool)

(assert (=> b!550972 (= res!343908 (and (is-Intermediate!5132 lt!250676) (not (undefined!5944 lt!250676)) (bvslt (x!51684 lt!250676) #b01111111111111111111111111111110) (bvsge (x!51684 lt!250676) #b00000000000000000000000000000000) (bvsge (x!51684 lt!250676) #b00000000000000000000000000000000)))))

(assert (=> b!550972 (=> (not res!343908) (not e!318013))))

(declare-fun b!550973 () Bool)

(assert (=> b!550973 (and (bvsge (index!22757 lt!250676) #b00000000000000000000000000000000) (bvslt (index!22757 lt!250676) (size!17047 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118)))))))

(assert (=> b!550973 (= e!318010 (= (select (arr!16683 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118))) (index!22757 lt!250676)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550974 () Bool)

(declare-fun e!318014 () SeekEntryResult!5132)

(assert (=> b!550974 (= e!318012 e!318014)))

(declare-fun c!63864 () Bool)

(assert (=> b!550974 (= c!63864 (or (= lt!250677 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!250677 lt!250677) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550975 () Bool)

(assert (=> b!550975 (= e!318012 (Intermediate!5132 true (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550976 () Bool)

(assert (=> b!550976 (= e!318011 (bvsge (x!51684 lt!250676) #b01111111111111111111111111111110))))

(declare-fun b!550977 () Bool)

(assert (=> b!550977 (and (bvsge (index!22757 lt!250676) #b00000000000000000000000000000000) (bvslt (index!22757 lt!250676) (size!17047 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118)))))))

(declare-fun res!343910 () Bool)

(assert (=> b!550977 (= res!343910 (= (select (arr!16683 (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118))) (index!22757 lt!250676)) (select (store (arr!16683 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!550977 (=> res!343910 e!318010)))

(assert (=> b!550977 (= e!318013 e!318010)))

(declare-fun b!550978 () Bool)

(assert (=> b!550978 (= e!318014 (Intermediate!5132 false (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550979 () Bool)

(assert (=> b!550979 (= e!318014 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) (array!34739 (store (arr!16683 a!3118) i!1132 k!1914) (size!17047 a!3118)) mask!3119))))

(assert (= (and d!82917 c!63866) b!550975))

(assert (= (and d!82917 (not c!63866)) b!550974))

(assert (= (and b!550974 c!63864) b!550978))

(assert (= (and b!550974 (not c!63864)) b!550979))

(assert (= (and d!82917 c!63865) b!550976))

(assert (= (and d!82917 (not c!63865)) b!550972))

(assert (= (and b!550972 res!343908) b!550977))

(assert (= (and b!550977 (not res!343910)) b!550971))

(assert (= (and b!550971 (not res!343909)) b!550973))

(assert (=> b!550979 m!527887))

(declare-fun m!528001 () Bool)

(assert (=> b!550979 m!528001))

(assert (=> b!550979 m!528001))

(assert (=> b!550979 m!527885))

(declare-fun m!528003 () Bool)

(assert (=> b!550979 m!528003))

(declare-fun m!528005 () Bool)

(assert (=> b!550973 m!528005))

(assert (=> b!550971 m!528005))

(assert (=> b!550977 m!528005))

(assert (=> d!82917 m!527887))

(declare-fun m!528007 () Bool)

(assert (=> d!82917 m!528007))

(assert (=> d!82917 m!527901))

(assert (=> b!550867 d!82917))

(declare-fun d!82919 () Bool)

(declare-fun lt!250683 () (_ BitVec 32))

(declare-fun lt!250682 () (_ BitVec 32))

(assert (=> d!82919 (= lt!250683 (bvmul (bvxor lt!250682 (bvlshr lt!250682 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82919 (= lt!250682 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82919 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343911 (let ((h!11738 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51688 (bvmul (bvxor h!11738 (bvlshr h!11738 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51688 (bvlshr x!51688 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343911 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343911 #b00000000000000000000000000000000))))))

(assert (=> d!82919 (= (toIndex!0 (select (store (arr!16683 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!250683 (bvlshr lt!250683 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550867 d!82919))

(declare-fun d!82921 () Bool)

(declare-fun lt!250689 () (_ BitVec 32))

(declare-fun lt!250688 () (_ BitVec 32))

(assert (=> d!82921 (= lt!250689 (bvmul (bvxor lt!250688 (bvlshr lt!250688 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82921 (= lt!250688 ((_ extract 31 0) (bvand (bvxor (select (arr!16683 a!3118) j!142) (bvlshr (select (arr!16683 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82921 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343911 (let ((h!11738 ((_ extract 31 0) (bvand (bvxor (select (arr!16683 a!3118) j!142) (bvlshr (select (arr!16683 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51688 (bvmul (bvxor h!11738 (bvlshr h!11738 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51688 (bvlshr x!51688 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343911 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343911 #b00000000000000000000000000000000))))))

(assert (=> d!82921 (= (toIndex!0 (select (arr!16683 a!3118) j!142) mask!3119) (bvand (bvxor lt!250689 (bvlshr lt!250689 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550867 d!82921))

(declare-fun d!82923 () Bool)

(assert (=> d!82923 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50342 d!82923))

(declare-fun d!82929 () Bool)

(assert (=> d!82929 (= (array_inv!12479 a!3118) (bvsge (size!17047 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50342 d!82929))

(declare-fun d!82933 () Bool)

(assert (=> d!82933 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550863 d!82933))

(declare-fun d!82935 () Bool)

(declare-fun lt!250725 () SeekEntryResult!5132)

(assert (=> d!82935 (and (or (is-Undefined!5132 lt!250725) (not (is-Found!5132 lt!250725)) (and (bvsge (index!22756 lt!250725) #b00000000000000000000000000000000) (bvslt (index!22756 lt!250725) (size!17047 a!3118)))) (or (is-Undefined!5132 lt!250725) (is-Found!5132 lt!250725) (not (is-MissingZero!5132 lt!250725)) (and (bvsge (index!22755 lt!250725) #b00000000000000000000000000000000) (bvslt (index!22755 lt!250725) (size!17047 a!3118)))) (or (is-Undefined!5132 lt!250725) (is-Found!5132 lt!250725) (is-MissingZero!5132 lt!250725) (not (is-MissingVacant!5132 lt!250725)) (and (bvsge (index!22758 lt!250725) #b00000000000000000000000000000000) (bvslt (index!22758 lt!250725) (size!17047 a!3118)))) (or (is-Undefined!5132 lt!250725) (ite (is-Found!5132 lt!250725) (= (select (arr!16683 a!3118) (index!22756 lt!250725)) k!1914) (ite (is-MissingZero!5132 lt!250725) (= (select (arr!16683 a!3118) (index!22755 lt!250725)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5132 lt!250725) (= (select (arr!16683 a!3118) (index!22758 lt!250725)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318071 () SeekEntryResult!5132)

(assert (=> d!82935 (= lt!250725 e!318071)))

(declare-fun c!63903 () Bool)

(declare-fun lt!250723 () SeekEntryResult!5132)

(assert (=> d!82935 (= c!63903 (and (is-Intermediate!5132 lt!250723) (undefined!5944 lt!250723)))))

(assert (=> d!82935 (= lt!250723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82935 (validMask!0 mask!3119)))

(assert (=> d!82935 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!250725)))

(declare-fun b!551079 () Bool)

(declare-fun e!318072 () SeekEntryResult!5132)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34738 (_ BitVec 32)) SeekEntryResult!5132)

(assert (=> b!551079 (= e!318072 (seekKeyOrZeroReturnVacant!0 (x!51684 lt!250723) (index!22757 lt!250723) (index!22757 lt!250723) k!1914 a!3118 mask!3119))))

(declare-fun b!551080 () Bool)

(declare-fun e!318073 () SeekEntryResult!5132)

(assert (=> b!551080 (= e!318071 e!318073)))

(declare-fun lt!250724 () (_ BitVec 64))

(assert (=> b!551080 (= lt!250724 (select (arr!16683 a!3118) (index!22757 lt!250723)))))

(declare-fun c!63904 () Bool)

(assert (=> b!551080 (= c!63904 (= lt!250724 k!1914))))

(declare-fun b!551081 () Bool)

(assert (=> b!551081 (= e!318071 Undefined!5132)))

(declare-fun b!551082 () Bool)

(declare-fun c!63905 () Bool)

(assert (=> b!551082 (= c!63905 (= lt!250724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551082 (= e!318073 e!318072)))

(declare-fun b!551083 () Bool)

(assert (=> b!551083 (= e!318072 (MissingZero!5132 (index!22757 lt!250723)))))

(declare-fun b!551084 () Bool)

(assert (=> b!551084 (= e!318073 (Found!5132 (index!22757 lt!250723)))))

(assert (= (and d!82935 c!63903) b!551081))

(assert (= (and d!82935 (not c!63903)) b!551080))

(assert (= (and b!551080 c!63904) b!551084))

(assert (= (and b!551080 (not c!63904)) b!551082))

(assert (= (and b!551082 c!63905) b!551083))

(assert (= (and b!551082 (not c!63905)) b!551079))

(declare-fun m!528049 () Bool)

(assert (=> d!82935 m!528049))

(assert (=> d!82935 m!527901))

(declare-fun m!528051 () Bool)

(assert (=> d!82935 m!528051))

(declare-fun m!528053 () Bool)

(assert (=> d!82935 m!528053))

(declare-fun m!528055 () Bool)

(assert (=> d!82935 m!528055))

(declare-fun m!528057 () Bool)

(assert (=> d!82935 m!528057))

(assert (=> d!82935 m!528055))

(declare-fun m!528059 () Bool)

(assert (=> b!551079 m!528059))

(declare-fun m!528061 () Bool)

(assert (=> b!551080 m!528061))

(assert (=> b!550868 d!82935))

(declare-fun d!82947 () Bool)

(declare-fun res!343948 () Bool)

(declare-fun e!318089 () Bool)

(assert (=> d!82947 (=> res!343948 e!318089)))

(assert (=> d!82947 (= res!343948 (= (select (arr!16683 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82947 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!318089)))

(declare-fun b!551110 () Bool)

(declare-fun e!318090 () Bool)

(assert (=> b!551110 (= e!318089 e!318090)))

(declare-fun res!343949 () Bool)

(assert (=> b!551110 (=> (not res!343949) (not e!318090))))

(assert (=> b!551110 (= res!343949 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17047 a!3118)))))

(declare-fun b!551111 () Bool)

(assert (=> b!551111 (= e!318090 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82947 (not res!343948)) b!551110))

(assert (= (and b!551110 res!343949) b!551111))

(declare-fun m!528071 () Bool)

(assert (=> d!82947 m!528071))

(declare-fun m!528073 () Bool)

(assert (=> b!551111 m!528073))

(assert (=> b!550870 d!82947))

(declare-fun bm!32271 () Bool)

(declare-fun call!32274 () Bool)

(declare-fun c!63924 () Bool)

(assert (=> bm!32271 (= call!32274 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63924 (Cons!10759 (select (arr!16683 a!3118) #b00000000000000000000000000000000) Nil!10760) Nil!10760)))))

(declare-fun b!551138 () Bool)

(declare-fun e!318111 () Bool)

(assert (=> b!551138 (= e!318111 call!32274)))

(declare-fun d!82951 () Bool)

(declare-fun res!343959 () Bool)

(declare-fun e!318108 () Bool)

(assert (=> d!82951 (=> res!343959 e!318108)))

(assert (=> d!82951 (= res!343959 (bvsge #b00000000000000000000000000000000 (size!17047 a!3118)))))

(assert (=> d!82951 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10760) e!318108)))

(declare-fun b!551139 () Bool)

(declare-fun e!318109 () Bool)

(declare-fun contains!2836 (List!10763 (_ BitVec 64)) Bool)

(assert (=> b!551139 (= e!318109 (contains!2836 Nil!10760 (select (arr!16683 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551140 () Bool)

(declare-fun e!318110 () Bool)

(assert (=> b!551140 (= e!318108 e!318110)))

(declare-fun res!343960 () Bool)

(assert (=> b!551140 (=> (not res!343960) (not e!318110))))

(assert (=> b!551140 (= res!343960 (not e!318109))))

(declare-fun res!343958 () Bool)

(assert (=> b!551140 (=> (not res!343958) (not e!318109))))

(assert (=> b!551140 (= res!343958 (validKeyInArray!0 (select (arr!16683 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551141 () Bool)

(assert (=> b!551141 (= e!318110 e!318111)))

(assert (=> b!551141 (= c!63924 (validKeyInArray!0 (select (arr!16683 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551142 () Bool)

(assert (=> b!551142 (= e!318111 call!32274)))

(assert (= (and d!82951 (not res!343959)) b!551140))

(assert (= (and b!551140 res!343958) b!551139))

(assert (= (and b!551140 res!343960) b!551141))

(assert (= (and b!551141 c!63924) b!551138))

(assert (= (and b!551141 (not c!63924)) b!551142))

(assert (= (or b!551138 b!551142) bm!32271))

(assert (=> bm!32271 m!528071))

(declare-fun m!528113 () Bool)

(assert (=> bm!32271 m!528113))

(assert (=> b!551139 m!528071))

(assert (=> b!551139 m!528071))

(declare-fun m!528115 () Bool)

(assert (=> b!551139 m!528115))

(assert (=> b!551140 m!528071))

(assert (=> b!551140 m!528071))

(declare-fun m!528117 () Bool)

(assert (=> b!551140 m!528117))

(assert (=> b!551141 m!528071))

(assert (=> b!551141 m!528071))

(assert (=> b!551141 m!528117))

(assert (=> b!550869 d!82951))

(declare-fun call!32280 () Bool)

(declare-fun bm!32277 () Bool)

(assert (=> bm!32277 (= call!32280 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551169 () Bool)

(declare-fun e!318132 () Bool)

(declare-fun e!318130 () Bool)

(assert (=> b!551169 (= e!318132 e!318130)))

(declare-fun lt!250771 () (_ BitVec 64))

(assert (=> b!551169 (= lt!250771 (select (arr!16683 a!3118) j!142))))

(declare-fun lt!250770 () Unit!17038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34738 (_ BitVec 64) (_ BitVec 32)) Unit!17038)

(assert (=> b!551169 (= lt!250770 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250771 j!142))))

(assert (=> b!551169 (arrayContainsKey!0 a!3118 lt!250771 #b00000000000000000000000000000000)))

(declare-fun lt!250769 () Unit!17038)

(assert (=> b!551169 (= lt!250769 lt!250770)))

(declare-fun res!343972 () Bool)

(assert (=> b!551169 (= res!343972 (= (seekEntryOrOpen!0 (select (arr!16683 a!3118) j!142) a!3118 mask!3119) (Found!5132 j!142)))))

(assert (=> b!551169 (=> (not res!343972) (not e!318130))))

(declare-fun b!551170 () Bool)

(assert (=> b!551170 (= e!318132 call!32280)))

(declare-fun d!82963 () Bool)

(declare-fun res!343971 () Bool)

(declare-fun e!318131 () Bool)

(assert (=> d!82963 (=> res!343971 e!318131)))

(assert (=> d!82963 (= res!343971 (bvsge j!142 (size!17047 a!3118)))))

(assert (=> d!82963 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318131)))

(declare-fun b!551171 () Bool)

(assert (=> b!551171 (= e!318131 e!318132)))

(declare-fun c!63933 () Bool)

(assert (=> b!551171 (= c!63933 (validKeyInArray!0 (select (arr!16683 a!3118) j!142)))))

(declare-fun b!551172 () Bool)

(assert (=> b!551172 (= e!318130 call!32280)))

(assert (= (and d!82963 (not res!343971)) b!551171))

(assert (= (and b!551171 c!63933) b!551169))

(assert (= (and b!551171 (not c!63933)) b!551170))

(assert (= (and b!551169 res!343972) b!551172))

(assert (= (or b!551172 b!551170) bm!32277))

(declare-fun m!528137 () Bool)

(assert (=> bm!32277 m!528137))

(assert (=> b!551169 m!527879))

(declare-fun m!528139 () Bool)

(assert (=> b!551169 m!528139))

(declare-fun m!528141 () Bool)

(assert (=> b!551169 m!528141))

(assert (=> b!551169 m!527879))

(assert (=> b!551169 m!527899))

(assert (=> b!551171 m!527879))

(assert (=> b!551171 m!527879))

(assert (=> b!551171 m!527881))

(assert (=> b!550864 d!82963))

(declare-fun d!82973 () Bool)

(assert (=> d!82973 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250777 () Unit!17038)

(declare-fun choose!38 (array!34738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17038)

(assert (=> d!82973 (= lt!250777 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82973 (validMask!0 mask!3119)))

(assert (=> d!82973 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250777)))

(declare-fun bs!17169 () Bool)

(assert (= bs!17169 d!82973))

(assert (=> bs!17169 m!527905))

(declare-fun m!528149 () Bool)

(assert (=> bs!17169 m!528149))

(assert (=> bs!17169 m!527901))

(assert (=> b!550864 d!82973))

(declare-fun d!82979 () Bool)

(assert (=> d!82979 (= (validKeyInArray!0 (select (arr!16683 a!3118) j!142)) (and (not (= (select (arr!16683 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16683 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550871 d!82979))

(declare-fun bm!32281 () Bool)

(declare-fun call!32284 () Bool)

(assert (=> bm!32281 (= call!32284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551194 () Bool)

(declare-fun e!318153 () Bool)

(declare-fun e!318151 () Bool)

(assert (=> b!551194 (= e!318153 e!318151)))

(declare-fun lt!250780 () (_ BitVec 64))

(assert (=> b!551194 (= lt!250780 (select (arr!16683 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250779 () Unit!17038)

(assert (=> b!551194 (= lt!250779 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250780 #b00000000000000000000000000000000))))

(assert (=> b!551194 (arrayContainsKey!0 a!3118 lt!250780 #b00000000000000000000000000000000)))

(declare-fun lt!250778 () Unit!17038)

(assert (=> b!551194 (= lt!250778 lt!250779)))

(declare-fun res!343989 () Bool)

(assert (=> b!551194 (= res!343989 (= (seekEntryOrOpen!0 (select (arr!16683 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5132 #b00000000000000000000000000000000)))))

(assert (=> b!551194 (=> (not res!343989) (not e!318151))))

(declare-fun b!551195 () Bool)

(assert (=> b!551195 (= e!318153 call!32284)))

(declare-fun d!82981 () Bool)

(declare-fun res!343988 () Bool)

(declare-fun e!318152 () Bool)

(assert (=> d!82981 (=> res!343988 e!318152)))

(assert (=> d!82981 (= res!343988 (bvsge #b00000000000000000000000000000000 (size!17047 a!3118)))))

(assert (=> d!82981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318152)))

(declare-fun b!551196 () Bool)

(assert (=> b!551196 (= e!318152 e!318153)))

(declare-fun c!63937 () Bool)

(assert (=> b!551196 (= c!63937 (validKeyInArray!0 (select (arr!16683 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551197 () Bool)

(assert (=> b!551197 (= e!318151 call!32284)))

(assert (= (and d!82981 (not res!343988)) b!551196))

(assert (= (and b!551196 c!63937) b!551194))

(assert (= (and b!551196 (not c!63937)) b!551195))

(assert (= (and b!551194 res!343989) b!551197))

(assert (= (or b!551197 b!551195) bm!32281))

(declare-fun m!528153 () Bool)

(assert (=> bm!32281 m!528153))

(assert (=> b!551194 m!528071))

(declare-fun m!528157 () Bool)

(assert (=> b!551194 m!528157))

(declare-fun m!528159 () Bool)

(assert (=> b!551194 m!528159))

(assert (=> b!551194 m!528071))

(declare-fun m!528161 () Bool)

(assert (=> b!551194 m!528161))

(assert (=> b!551196 m!528071))

(assert (=> b!551196 m!528071))

(assert (=> b!551196 m!528117))

(assert (=> b!550866 d!82981))

(declare-fun d!82987 () Bool)

(declare-fun lt!250786 () SeekEntryResult!5132)

(assert (=> d!82987 (and (or (is-Undefined!5132 lt!250786) (not (is-Found!5132 lt!250786)) (and (bvsge (index!22756 lt!250786) #b00000000000000000000000000000000) (bvslt (index!22756 lt!250786) (size!17047 a!3118)))) (or (is-Undefined!5132 lt!250786) (is-Found!5132 lt!250786) (not (is-MissingZero!5132 lt!250786)) (and (bvsge (index!22755 lt!250786) #b00000000000000000000000000000000) (bvslt (index!22755 lt!250786) (size!17047 a!3118)))) (or (is-Undefined!5132 lt!250786) (is-Found!5132 lt!250786) (is-MissingZero!5132 lt!250786) (not (is-MissingVacant!5132 lt!250786)) (and (bvsge (index!22758 lt!250786) #b00000000000000000000000000000000) (bvslt (index!22758 lt!250786) (size!17047 a!3118)))) (or (is-Undefined!5132 lt!250786) (ite (is-Found!5132 lt!250786) (= (select (arr!16683 a!3118) (index!22756 lt!250786)) (select (arr!16683 a!3118) j!142)) (ite (is-MissingZero!5132 lt!250786) (= (select (arr!16683 a!3118) (index!22755 lt!250786)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5132 lt!250786) (= (select (arr!16683 a!3118) (index!22758 lt!250786)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318157 () SeekEntryResult!5132)

(assert (=> d!82987 (= lt!250786 e!318157)))

(declare-fun c!63939 () Bool)

(declare-fun lt!250784 () SeekEntryResult!5132)

(assert (=> d!82987 (= c!63939 (and (is-Intermediate!5132 lt!250784) (undefined!5944 lt!250784)))))

(assert (=> d!82987 (= lt!250784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16683 a!3118) j!142) mask!3119) (select (arr!16683 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82987 (validMask!0 mask!3119)))

(assert (=> d!82987 (= (seekEntryOrOpen!0 (select (arr!16683 a!3118) j!142) a!3118 mask!3119) lt!250786)))

(declare-fun e!318158 () SeekEntryResult!5132)

(declare-fun b!551202 () Bool)

(assert (=> b!551202 (= e!318158 (seekKeyOrZeroReturnVacant!0 (x!51684 lt!250784) (index!22757 lt!250784) (index!22757 lt!250784) (select (arr!16683 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551203 () Bool)

(declare-fun e!318159 () SeekEntryResult!5132)

(assert (=> b!551203 (= e!318157 e!318159)))

(declare-fun lt!250785 () (_ BitVec 64))

(assert (=> b!551203 (= lt!250785 (select (arr!16683 a!3118) (index!22757 lt!250784)))))

(declare-fun c!63940 () Bool)

(assert (=> b!551203 (= c!63940 (= lt!250785 (select (arr!16683 a!3118) j!142)))))

(declare-fun b!551204 () Bool)

(assert (=> b!551204 (= e!318157 Undefined!5132)))

(declare-fun b!551205 () Bool)

(declare-fun c!63941 () Bool)

(assert (=> b!551205 (= c!63941 (= lt!250785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551205 (= e!318159 e!318158)))

(declare-fun b!551206 () Bool)

(assert (=> b!551206 (= e!318158 (MissingZero!5132 (index!22757 lt!250784)))))

(declare-fun b!551207 () Bool)

(assert (=> b!551207 (= e!318159 (Found!5132 (index!22757 lt!250784)))))

(assert (= (and d!82987 c!63939) b!551204))

(assert (= (and d!82987 (not c!63939)) b!551203))

(assert (= (and b!551203 c!63940) b!551207))

(assert (= (and b!551203 (not c!63940)) b!551205))

(assert (= (and b!551205 c!63941) b!551206))

(assert (= (and b!551205 (not c!63941)) b!551202))

(declare-fun m!528173 () Bool)

(assert (=> d!82987 m!528173))

(assert (=> d!82987 m!527901))

(declare-fun m!528175 () Bool)

(assert (=> d!82987 m!528175))

(declare-fun m!528177 () Bool)

(assert (=> d!82987 m!528177))

(assert (=> d!82987 m!527883))

(assert (=> d!82987 m!527879))

(declare-fun m!528179 () Bool)

(assert (=> d!82987 m!528179))

(assert (=> d!82987 m!527879))

(assert (=> d!82987 m!527883))

(assert (=> b!551202 m!527879))

(declare-fun m!528181 () Bool)

(assert (=> b!551202 m!528181))

(declare-fun m!528183 () Bool)

(assert (=> b!551203 m!528183))

(assert (=> b!550865 d!82987))

(push 1)

(assert (not bm!32271))

(assert (not b!551079))

(assert (not bm!32281))

(assert (not b!551141))

(assert (not b!551169))

(assert (not b!551202))

(assert (not b!551139))

(assert (not d!82935))

(assert (not b!550979))

(assert (not b!551194))

(assert (not b!551196))

(assert (not b!551171))

(assert (not b!550970))

(assert (not d!82987))

(assert (not d!82973))

(assert (not d!82917))

(assert (not d!82909))

(assert (not bm!32277))

(assert (not b!551140))

(assert (not b!551111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

