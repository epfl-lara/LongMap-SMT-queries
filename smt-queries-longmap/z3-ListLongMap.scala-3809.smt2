; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52210 () Bool)

(assert start!52210)

(declare-fun b!570017 () Bool)

(declare-fun res!360039 () Bool)

(declare-fun e!327832 () Bool)

(assert (=> b!570017 (=> (not res!360039) (not e!327832))))

(declare-datatypes ((array!35733 0))(
  ( (array!35734 (arr!17158 (Array (_ BitVec 32) (_ BitVec 64))) (size!17522 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35733)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570017 (= res!360039 (validKeyInArray!0 (select (arr!17158 a!3118) j!142)))))

(declare-fun b!570018 () Bool)

(declare-fun res!360041 () Bool)

(declare-fun e!327834 () Bool)

(assert (=> b!570018 (=> (not res!360041) (not e!327834))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35733 (_ BitVec 32)) Bool)

(assert (=> b!570018 (= res!360041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570019 () Bool)

(declare-fun res!360038 () Bool)

(assert (=> b!570019 (=> (not res!360038) (not e!327834))))

(declare-datatypes ((List!11238 0))(
  ( (Nil!11235) (Cons!11234 (h!12255 (_ BitVec 64)) (t!17466 List!11238)) )
))
(declare-fun arrayNoDuplicates!0 (array!35733 (_ BitVec 32) List!11238) Bool)

(assert (=> b!570019 (= res!360038 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11235))))

(declare-fun b!570020 () Bool)

(declare-fun res!360040 () Bool)

(assert (=> b!570020 (=> (not res!360040) (not e!327832))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570020 (= res!360040 (and (= (size!17522 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17522 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17522 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570021 () Bool)

(declare-fun res!360036 () Bool)

(assert (=> b!570021 (=> (not res!360036) (not e!327832))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!570021 (= res!360036 (validKeyInArray!0 k0!1914))))

(declare-fun b!570022 () Bool)

(declare-fun e!327830 () Bool)

(declare-fun e!327831 () Bool)

(assert (=> b!570022 (= e!327830 (not e!327831))))

(declare-fun res!360035 () Bool)

(assert (=> b!570022 (=> res!360035 e!327831)))

(declare-datatypes ((SeekEntryResult!5607 0))(
  ( (MissingZero!5607 (index!24655 (_ BitVec 32))) (Found!5607 (index!24656 (_ BitVec 32))) (Intermediate!5607 (undefined!6419 Bool) (index!24657 (_ BitVec 32)) (x!53522 (_ BitVec 32))) (Undefined!5607) (MissingVacant!5607 (index!24658 (_ BitVec 32))) )
))
(declare-fun lt!259843 () SeekEntryResult!5607)

(get-info :version)

(assert (=> b!570022 (= res!360035 (or (undefined!6419 lt!259843) (not ((_ is Intermediate!5607) lt!259843)) (= (select (arr!17158 a!3118) (index!24657 lt!259843)) (select (arr!17158 a!3118) j!142)) (= (select (arr!17158 a!3118) (index!24657 lt!259843)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!259845 () SeekEntryResult!5607)

(assert (=> b!570022 (= lt!259845 (Found!5607 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35733 (_ BitVec 32)) SeekEntryResult!5607)

(assert (=> b!570022 (= lt!259845 (seekEntryOrOpen!0 (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570022 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17916 0))(
  ( (Unit!17917) )
))
(declare-fun lt!259841 () Unit!17916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17916)

(assert (=> b!570022 (= lt!259841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570023 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35733 (_ BitVec 32)) SeekEntryResult!5607)

(assert (=> b!570023 (= e!327831 (= lt!259845 (seekKeyOrZeroReturnVacant!0 (x!53522 lt!259843) (index!24657 lt!259843) (index!24657 lt!259843) (select (arr!17158 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570024 () Bool)

(assert (=> b!570024 (= e!327832 e!327834)))

(declare-fun res!360043 () Bool)

(assert (=> b!570024 (=> (not res!360043) (not e!327834))))

(declare-fun lt!259846 () SeekEntryResult!5607)

(assert (=> b!570024 (= res!360043 (or (= lt!259846 (MissingZero!5607 i!1132)) (= lt!259846 (MissingVacant!5607 i!1132))))))

(assert (=> b!570024 (= lt!259846 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570025 () Bool)

(assert (=> b!570025 (= e!327834 e!327830)))

(declare-fun res!360037 () Bool)

(assert (=> b!570025 (=> (not res!360037) (not e!327830))))

(declare-fun lt!259842 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35733 (_ BitVec 32)) SeekEntryResult!5607)

(assert (=> b!570025 (= res!360037 (= lt!259843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259842 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)) mask!3119)))))

(declare-fun lt!259844 () (_ BitVec 32))

(assert (=> b!570025 (= lt!259843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259844 (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570025 (= lt!259842 (toIndex!0 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570025 (= lt!259844 (toIndex!0 (select (arr!17158 a!3118) j!142) mask!3119))))

(declare-fun b!570026 () Bool)

(declare-fun res!360042 () Bool)

(assert (=> b!570026 (=> (not res!360042) (not e!327832))))

(declare-fun arrayContainsKey!0 (array!35733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570026 (= res!360042 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!360044 () Bool)

(assert (=> start!52210 (=> (not res!360044) (not e!327832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52210 (= res!360044 (validMask!0 mask!3119))))

(assert (=> start!52210 e!327832))

(assert (=> start!52210 true))

(declare-fun array_inv!12954 (array!35733) Bool)

(assert (=> start!52210 (array_inv!12954 a!3118)))

(assert (= (and start!52210 res!360044) b!570020))

(assert (= (and b!570020 res!360040) b!570017))

(assert (= (and b!570017 res!360039) b!570021))

(assert (= (and b!570021 res!360036) b!570026))

(assert (= (and b!570026 res!360042) b!570024))

(assert (= (and b!570024 res!360043) b!570018))

(assert (= (and b!570018 res!360041) b!570019))

(assert (= (and b!570019 res!360038) b!570025))

(assert (= (and b!570025 res!360037) b!570022))

(assert (= (and b!570022 (not res!360035)) b!570023))

(declare-fun m!548941 () Bool)

(assert (=> b!570017 m!548941))

(assert (=> b!570017 m!548941))

(declare-fun m!548943 () Bool)

(assert (=> b!570017 m!548943))

(declare-fun m!548945 () Bool)

(assert (=> b!570024 m!548945))

(declare-fun m!548947 () Bool)

(assert (=> b!570022 m!548947))

(assert (=> b!570022 m!548941))

(declare-fun m!548949 () Bool)

(assert (=> b!570022 m!548949))

(declare-fun m!548951 () Bool)

(assert (=> b!570022 m!548951))

(assert (=> b!570022 m!548941))

(declare-fun m!548953 () Bool)

(assert (=> b!570022 m!548953))

(declare-fun m!548955 () Bool)

(assert (=> b!570026 m!548955))

(declare-fun m!548957 () Bool)

(assert (=> b!570019 m!548957))

(declare-fun m!548959 () Bool)

(assert (=> b!570018 m!548959))

(assert (=> b!570023 m!548941))

(assert (=> b!570023 m!548941))

(declare-fun m!548961 () Bool)

(assert (=> b!570023 m!548961))

(declare-fun m!548963 () Bool)

(assert (=> b!570021 m!548963))

(assert (=> b!570025 m!548941))

(declare-fun m!548965 () Bool)

(assert (=> b!570025 m!548965))

(assert (=> b!570025 m!548941))

(declare-fun m!548967 () Bool)

(assert (=> b!570025 m!548967))

(assert (=> b!570025 m!548941))

(declare-fun m!548969 () Bool)

(assert (=> b!570025 m!548969))

(assert (=> b!570025 m!548969))

(declare-fun m!548971 () Bool)

(assert (=> b!570025 m!548971))

(declare-fun m!548973 () Bool)

(assert (=> b!570025 m!548973))

(assert (=> b!570025 m!548969))

(declare-fun m!548975 () Bool)

(assert (=> b!570025 m!548975))

(declare-fun m!548977 () Bool)

(assert (=> start!52210 m!548977))

(declare-fun m!548979 () Bool)

(assert (=> start!52210 m!548979))

(check-sat (not b!570021) (not b!570024) (not b!570017) (not start!52210) (not b!570026) (not b!570019) (not b!570023) (not b!570022) (not b!570018) (not b!570025))
(check-sat)
(get-model)

(declare-fun d!84603 () Bool)

(declare-fun res!360079 () Bool)

(declare-fun e!327854 () Bool)

(assert (=> d!84603 (=> res!360079 e!327854)))

(assert (=> d!84603 (= res!360079 (= (select (arr!17158 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84603 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!327854)))

(declare-fun b!570061 () Bool)

(declare-fun e!327855 () Bool)

(assert (=> b!570061 (= e!327854 e!327855)))

(declare-fun res!360080 () Bool)

(assert (=> b!570061 (=> (not res!360080) (not e!327855))))

(assert (=> b!570061 (= res!360080 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17522 a!3118)))))

(declare-fun b!570062 () Bool)

(assert (=> b!570062 (= e!327855 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84603 (not res!360079)) b!570061))

(assert (= (and b!570061 res!360080) b!570062))

(declare-fun m!549021 () Bool)

(assert (=> d!84603 m!549021))

(declare-fun m!549023 () Bool)

(assert (=> b!570062 m!549023))

(assert (=> b!570026 d!84603))

(declare-fun d!84605 () Bool)

(assert (=> d!84605 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570021 d!84605))

(declare-fun b!570096 () Bool)

(declare-fun e!327881 () SeekEntryResult!5607)

(assert (=> b!570096 (= e!327881 (Intermediate!5607 false lt!259842 #b00000000000000000000000000000000))))

(declare-fun d!84607 () Bool)

(declare-fun e!327880 () Bool)

(assert (=> d!84607 e!327880))

(declare-fun c!65356 () Bool)

(declare-fun lt!259870 () SeekEntryResult!5607)

(assert (=> d!84607 (= c!65356 (and ((_ is Intermediate!5607) lt!259870) (undefined!6419 lt!259870)))))

(declare-fun e!327879 () SeekEntryResult!5607)

(assert (=> d!84607 (= lt!259870 e!327879)))

(declare-fun c!65357 () Bool)

(assert (=> d!84607 (= c!65357 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!259869 () (_ BitVec 64))

(assert (=> d!84607 (= lt!259869 (select (arr!17158 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118))) lt!259842))))

(assert (=> d!84607 (validMask!0 mask!3119)))

(assert (=> d!84607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259842 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)) mask!3119) lt!259870)))

(declare-fun b!570097 () Bool)

(declare-fun e!327882 () Bool)

(assert (=> b!570097 (= e!327880 e!327882)))

(declare-fun res!360098 () Bool)

(assert (=> b!570097 (= res!360098 (and ((_ is Intermediate!5607) lt!259870) (not (undefined!6419 lt!259870)) (bvslt (x!53522 lt!259870) #b01111111111111111111111111111110) (bvsge (x!53522 lt!259870) #b00000000000000000000000000000000) (bvsge (x!53522 lt!259870) #b00000000000000000000000000000000)))))

(assert (=> b!570097 (=> (not res!360098) (not e!327882))))

(declare-fun b!570098 () Bool)

(assert (=> b!570098 (= e!327879 (Intermediate!5607 true lt!259842 #b00000000000000000000000000000000))))

(declare-fun b!570099 () Bool)

(assert (=> b!570099 (= e!327879 e!327881)))

(declare-fun c!65355 () Bool)

(assert (=> b!570099 (= c!65355 (or (= lt!259869 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!259869 lt!259869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570100 () Bool)

(assert (=> b!570100 (and (bvsge (index!24657 lt!259870) #b00000000000000000000000000000000) (bvslt (index!24657 lt!259870) (size!17522 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)))))))

(declare-fun res!360097 () Bool)

(assert (=> b!570100 (= res!360097 (= (select (arr!17158 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118))) (index!24657 lt!259870)) (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!327878 () Bool)

(assert (=> b!570100 (=> res!360097 e!327878)))

(assert (=> b!570100 (= e!327882 e!327878)))

(declare-fun b!570101 () Bool)

(assert (=> b!570101 (= e!327880 (bvsge (x!53522 lt!259870) #b01111111111111111111111111111110))))

(declare-fun b!570102 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570102 (= e!327881 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259842 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)) mask!3119))))

(declare-fun b!570103 () Bool)

(assert (=> b!570103 (and (bvsge (index!24657 lt!259870) #b00000000000000000000000000000000) (bvslt (index!24657 lt!259870) (size!17522 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)))))))

(assert (=> b!570103 (= e!327878 (= (select (arr!17158 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118))) (index!24657 lt!259870)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570104 () Bool)

(assert (=> b!570104 (and (bvsge (index!24657 lt!259870) #b00000000000000000000000000000000) (bvslt (index!24657 lt!259870) (size!17522 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)))))))

(declare-fun res!360096 () Bool)

(assert (=> b!570104 (= res!360096 (= (select (arr!17158 (array!35734 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118))) (index!24657 lt!259870)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570104 (=> res!360096 e!327878)))

(assert (= (and d!84607 c!65357) b!570098))

(assert (= (and d!84607 (not c!65357)) b!570099))

(assert (= (and b!570099 c!65355) b!570096))

(assert (= (and b!570099 (not c!65355)) b!570102))

(assert (= (and d!84607 c!65356) b!570101))

(assert (= (and d!84607 (not c!65356)) b!570097))

(assert (= (and b!570097 res!360098) b!570100))

(assert (= (and b!570100 (not res!360097)) b!570104))

(assert (= (and b!570104 (not res!360096)) b!570103))

(declare-fun m!549033 () Bool)

(assert (=> b!570103 m!549033))

(assert (=> b!570100 m!549033))

(declare-fun m!549035 () Bool)

(assert (=> b!570102 m!549035))

(assert (=> b!570102 m!549035))

(assert (=> b!570102 m!548969))

(declare-fun m!549037 () Bool)

(assert (=> b!570102 m!549037))

(assert (=> b!570104 m!549033))

(declare-fun m!549039 () Bool)

(assert (=> d!84607 m!549039))

(assert (=> d!84607 m!548977))

(assert (=> b!570025 d!84607))

(declare-fun b!570105 () Bool)

(declare-fun e!327886 () SeekEntryResult!5607)

(assert (=> b!570105 (= e!327886 (Intermediate!5607 false lt!259844 #b00000000000000000000000000000000))))

(declare-fun d!84617 () Bool)

(declare-fun e!327885 () Bool)

(assert (=> d!84617 e!327885))

(declare-fun c!65359 () Bool)

(declare-fun lt!259872 () SeekEntryResult!5607)

(assert (=> d!84617 (= c!65359 (and ((_ is Intermediate!5607) lt!259872) (undefined!6419 lt!259872)))))

(declare-fun e!327884 () SeekEntryResult!5607)

(assert (=> d!84617 (= lt!259872 e!327884)))

(declare-fun c!65360 () Bool)

(assert (=> d!84617 (= c!65360 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!259871 () (_ BitVec 64))

(assert (=> d!84617 (= lt!259871 (select (arr!17158 a!3118) lt!259844))))

(assert (=> d!84617 (validMask!0 mask!3119)))

(assert (=> d!84617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259844 (select (arr!17158 a!3118) j!142) a!3118 mask!3119) lt!259872)))

(declare-fun b!570106 () Bool)

(declare-fun e!327887 () Bool)

(assert (=> b!570106 (= e!327885 e!327887)))

(declare-fun res!360101 () Bool)

(assert (=> b!570106 (= res!360101 (and ((_ is Intermediate!5607) lt!259872) (not (undefined!6419 lt!259872)) (bvslt (x!53522 lt!259872) #b01111111111111111111111111111110) (bvsge (x!53522 lt!259872) #b00000000000000000000000000000000) (bvsge (x!53522 lt!259872) #b00000000000000000000000000000000)))))

(assert (=> b!570106 (=> (not res!360101) (not e!327887))))

(declare-fun b!570107 () Bool)

(assert (=> b!570107 (= e!327884 (Intermediate!5607 true lt!259844 #b00000000000000000000000000000000))))

(declare-fun b!570108 () Bool)

(assert (=> b!570108 (= e!327884 e!327886)))

(declare-fun c!65358 () Bool)

(assert (=> b!570108 (= c!65358 (or (= lt!259871 (select (arr!17158 a!3118) j!142)) (= (bvadd lt!259871 lt!259871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570109 () Bool)

(assert (=> b!570109 (and (bvsge (index!24657 lt!259872) #b00000000000000000000000000000000) (bvslt (index!24657 lt!259872) (size!17522 a!3118)))))

(declare-fun res!360100 () Bool)

(assert (=> b!570109 (= res!360100 (= (select (arr!17158 a!3118) (index!24657 lt!259872)) (select (arr!17158 a!3118) j!142)))))

(declare-fun e!327883 () Bool)

(assert (=> b!570109 (=> res!360100 e!327883)))

(assert (=> b!570109 (= e!327887 e!327883)))

(declare-fun b!570110 () Bool)

(assert (=> b!570110 (= e!327885 (bvsge (x!53522 lt!259872) #b01111111111111111111111111111110))))

(declare-fun b!570111 () Bool)

(assert (=> b!570111 (= e!327886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259844 #b00000000000000000000000000000000 mask!3119) (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570112 () Bool)

(assert (=> b!570112 (and (bvsge (index!24657 lt!259872) #b00000000000000000000000000000000) (bvslt (index!24657 lt!259872) (size!17522 a!3118)))))

(assert (=> b!570112 (= e!327883 (= (select (arr!17158 a!3118) (index!24657 lt!259872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570113 () Bool)

(assert (=> b!570113 (and (bvsge (index!24657 lt!259872) #b00000000000000000000000000000000) (bvslt (index!24657 lt!259872) (size!17522 a!3118)))))

(declare-fun res!360099 () Bool)

(assert (=> b!570113 (= res!360099 (= (select (arr!17158 a!3118) (index!24657 lt!259872)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570113 (=> res!360099 e!327883)))

(assert (= (and d!84617 c!65360) b!570107))

(assert (= (and d!84617 (not c!65360)) b!570108))

(assert (= (and b!570108 c!65358) b!570105))

(assert (= (and b!570108 (not c!65358)) b!570111))

(assert (= (and d!84617 c!65359) b!570110))

(assert (= (and d!84617 (not c!65359)) b!570106))

(assert (= (and b!570106 res!360101) b!570109))

(assert (= (and b!570109 (not res!360100)) b!570113))

(assert (= (and b!570113 (not res!360099)) b!570112))

(declare-fun m!549041 () Bool)

(assert (=> b!570112 m!549041))

(assert (=> b!570109 m!549041))

(declare-fun m!549043 () Bool)

(assert (=> b!570111 m!549043))

(assert (=> b!570111 m!549043))

(assert (=> b!570111 m!548941))

(declare-fun m!549045 () Bool)

(assert (=> b!570111 m!549045))

(assert (=> b!570113 m!549041))

(declare-fun m!549047 () Bool)

(assert (=> d!84617 m!549047))

(assert (=> d!84617 m!548977))

(assert (=> b!570025 d!84617))

(declare-fun d!84619 () Bool)

(declare-fun lt!259882 () (_ BitVec 32))

(declare-fun lt!259881 () (_ BitVec 32))

(assert (=> d!84619 (= lt!259882 (bvmul (bvxor lt!259881 (bvlshr lt!259881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84619 (= lt!259881 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84619 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360106 (let ((h!12257 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53525 (bvmul (bvxor h!12257 (bvlshr h!12257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53525 (bvlshr x!53525 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360106 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360106 #b00000000000000000000000000000000))))))

(assert (=> d!84619 (= (toIndex!0 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!259882 (bvlshr lt!259882 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570025 d!84619))

(declare-fun d!84623 () Bool)

(declare-fun lt!259884 () (_ BitVec 32))

(declare-fun lt!259883 () (_ BitVec 32))

(assert (=> d!84623 (= lt!259884 (bvmul (bvxor lt!259883 (bvlshr lt!259883 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84623 (= lt!259883 ((_ extract 31 0) (bvand (bvxor (select (arr!17158 a!3118) j!142) (bvlshr (select (arr!17158 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84623 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360106 (let ((h!12257 ((_ extract 31 0) (bvand (bvxor (select (arr!17158 a!3118) j!142) (bvlshr (select (arr!17158 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53525 (bvmul (bvxor h!12257 (bvlshr h!12257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53525 (bvlshr x!53525 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360106 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360106 #b00000000000000000000000000000000))))))

(assert (=> d!84623 (= (toIndex!0 (select (arr!17158 a!3118) j!142) mask!3119) (bvand (bvxor lt!259884 (bvlshr lt!259884 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570025 d!84623))

(declare-fun b!570196 () Bool)

(declare-fun e!327935 () SeekEntryResult!5607)

(declare-fun lt!259906 () SeekEntryResult!5607)

(assert (=> b!570196 (= e!327935 (Found!5607 (index!24657 lt!259906)))))

(declare-fun b!570197 () Bool)

(declare-fun e!327933 () SeekEntryResult!5607)

(assert (=> b!570197 (= e!327933 Undefined!5607)))

(declare-fun b!570198 () Bool)

(assert (=> b!570198 (= e!327933 e!327935)))

(declare-fun lt!259905 () (_ BitVec 64))

(assert (=> b!570198 (= lt!259905 (select (arr!17158 a!3118) (index!24657 lt!259906)))))

(declare-fun c!65393 () Bool)

(assert (=> b!570198 (= c!65393 (= lt!259905 k0!1914))))

(declare-fun b!570199 () Bool)

(declare-fun c!65394 () Bool)

(assert (=> b!570199 (= c!65394 (= lt!259905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327934 () SeekEntryResult!5607)

(assert (=> b!570199 (= e!327935 e!327934)))

(declare-fun b!570200 () Bool)

(assert (=> b!570200 (= e!327934 (MissingZero!5607 (index!24657 lt!259906)))))

(declare-fun b!570201 () Bool)

(assert (=> b!570201 (= e!327934 (seekKeyOrZeroReturnVacant!0 (x!53522 lt!259906) (index!24657 lt!259906) (index!24657 lt!259906) k0!1914 a!3118 mask!3119))))

(declare-fun d!84625 () Bool)

(declare-fun lt!259907 () SeekEntryResult!5607)

(assert (=> d!84625 (and (or ((_ is Undefined!5607) lt!259907) (not ((_ is Found!5607) lt!259907)) (and (bvsge (index!24656 lt!259907) #b00000000000000000000000000000000) (bvslt (index!24656 lt!259907) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259907) ((_ is Found!5607) lt!259907) (not ((_ is MissingZero!5607) lt!259907)) (and (bvsge (index!24655 lt!259907) #b00000000000000000000000000000000) (bvslt (index!24655 lt!259907) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259907) ((_ is Found!5607) lt!259907) ((_ is MissingZero!5607) lt!259907) (not ((_ is MissingVacant!5607) lt!259907)) (and (bvsge (index!24658 lt!259907) #b00000000000000000000000000000000) (bvslt (index!24658 lt!259907) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259907) (ite ((_ is Found!5607) lt!259907) (= (select (arr!17158 a!3118) (index!24656 lt!259907)) k0!1914) (ite ((_ is MissingZero!5607) lt!259907) (= (select (arr!17158 a!3118) (index!24655 lt!259907)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5607) lt!259907) (= (select (arr!17158 a!3118) (index!24658 lt!259907)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84625 (= lt!259907 e!327933)))

(declare-fun c!65392 () Bool)

(assert (=> d!84625 (= c!65392 (and ((_ is Intermediate!5607) lt!259906) (undefined!6419 lt!259906)))))

(assert (=> d!84625 (= lt!259906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84625 (validMask!0 mask!3119)))

(assert (=> d!84625 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!259907)))

(assert (= (and d!84625 c!65392) b!570197))

(assert (= (and d!84625 (not c!65392)) b!570198))

(assert (= (and b!570198 c!65393) b!570196))

(assert (= (and b!570198 (not c!65393)) b!570199))

(assert (= (and b!570199 c!65394) b!570200))

(assert (= (and b!570199 (not c!65394)) b!570201))

(declare-fun m!549077 () Bool)

(assert (=> b!570198 m!549077))

(declare-fun m!549079 () Bool)

(assert (=> b!570201 m!549079))

(declare-fun m!549081 () Bool)

(assert (=> d!84625 m!549081))

(declare-fun m!549083 () Bool)

(assert (=> d!84625 m!549083))

(declare-fun m!549085 () Bool)

(assert (=> d!84625 m!549085))

(declare-fun m!549087 () Bool)

(assert (=> d!84625 m!549087))

(assert (=> d!84625 m!548977))

(assert (=> d!84625 m!549087))

(declare-fun m!549089 () Bool)

(assert (=> d!84625 m!549089))

(assert (=> b!570024 d!84625))

(declare-fun bm!32585 () Bool)

(declare-fun call!32588 () Bool)

(declare-fun c!65405 () Bool)

(assert (=> bm!32585 (= call!32588 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65405 (Cons!11234 (select (arr!17158 a!3118) #b00000000000000000000000000000000) Nil!11235) Nil!11235)))))

(declare-fun d!84635 () Bool)

(declare-fun res!360143 () Bool)

(declare-fun e!327963 () Bool)

(assert (=> d!84635 (=> res!360143 e!327963)))

(assert (=> d!84635 (= res!360143 (bvsge #b00000000000000000000000000000000 (size!17522 a!3118)))))

(assert (=> d!84635 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11235) e!327963)))

(declare-fun b!570238 () Bool)

(declare-fun e!327962 () Bool)

(declare-fun e!327961 () Bool)

(assert (=> b!570238 (= e!327962 e!327961)))

(assert (=> b!570238 (= c!65405 (validKeyInArray!0 (select (arr!17158 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570239 () Bool)

(declare-fun e!327960 () Bool)

(declare-fun contains!2879 (List!11238 (_ BitVec 64)) Bool)

(assert (=> b!570239 (= e!327960 (contains!2879 Nil!11235 (select (arr!17158 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570240 () Bool)

(assert (=> b!570240 (= e!327963 e!327962)))

(declare-fun res!360141 () Bool)

(assert (=> b!570240 (=> (not res!360141) (not e!327962))))

(assert (=> b!570240 (= res!360141 (not e!327960))))

(declare-fun res!360142 () Bool)

(assert (=> b!570240 (=> (not res!360142) (not e!327960))))

(assert (=> b!570240 (= res!360142 (validKeyInArray!0 (select (arr!17158 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570241 () Bool)

(assert (=> b!570241 (= e!327961 call!32588)))

(declare-fun b!570242 () Bool)

(assert (=> b!570242 (= e!327961 call!32588)))

(assert (= (and d!84635 (not res!360143)) b!570240))

(assert (= (and b!570240 res!360142) b!570239))

(assert (= (and b!570240 res!360141) b!570238))

(assert (= (and b!570238 c!65405) b!570242))

(assert (= (and b!570238 (not c!65405)) b!570241))

(assert (= (or b!570242 b!570241) bm!32585))

(assert (=> bm!32585 m!549021))

(declare-fun m!549107 () Bool)

(assert (=> bm!32585 m!549107))

(assert (=> b!570238 m!549021))

(assert (=> b!570238 m!549021))

(declare-fun m!549109 () Bool)

(assert (=> b!570238 m!549109))

(assert (=> b!570239 m!549021))

(assert (=> b!570239 m!549021))

(declare-fun m!549111 () Bool)

(assert (=> b!570239 m!549111))

(assert (=> b!570240 m!549021))

(assert (=> b!570240 m!549021))

(assert (=> b!570240 m!549109))

(assert (=> b!570019 d!84635))

(declare-fun b!570252 () Bool)

(declare-fun e!327971 () Bool)

(declare-fun e!327972 () Bool)

(assert (=> b!570252 (= e!327971 e!327972)))

(declare-fun c!65408 () Bool)

(assert (=> b!570252 (= c!65408 (validKeyInArray!0 (select (arr!17158 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32588 () Bool)

(declare-fun call!32591 () Bool)

(assert (=> bm!32588 (= call!32591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84645 () Bool)

(declare-fun res!360149 () Bool)

(assert (=> d!84645 (=> res!360149 e!327971)))

(assert (=> d!84645 (= res!360149 (bvsge #b00000000000000000000000000000000 (size!17522 a!3118)))))

(assert (=> d!84645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327971)))

(declare-fun b!570251 () Bool)

(declare-fun e!327970 () Bool)

(assert (=> b!570251 (= e!327972 e!327970)))

(declare-fun lt!259935 () (_ BitVec 64))

(assert (=> b!570251 (= lt!259935 (select (arr!17158 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!259934 () Unit!17916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35733 (_ BitVec 64) (_ BitVec 32)) Unit!17916)

(assert (=> b!570251 (= lt!259934 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259935 #b00000000000000000000000000000000))))

(assert (=> b!570251 (arrayContainsKey!0 a!3118 lt!259935 #b00000000000000000000000000000000)))

(declare-fun lt!259936 () Unit!17916)

(assert (=> b!570251 (= lt!259936 lt!259934)))

(declare-fun res!360148 () Bool)

(assert (=> b!570251 (= res!360148 (= (seekEntryOrOpen!0 (select (arr!17158 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5607 #b00000000000000000000000000000000)))))

(assert (=> b!570251 (=> (not res!360148) (not e!327970))))

(declare-fun b!570253 () Bool)

(assert (=> b!570253 (= e!327972 call!32591)))

(declare-fun b!570254 () Bool)

(assert (=> b!570254 (= e!327970 call!32591)))

(assert (= (and d!84645 (not res!360149)) b!570252))

(assert (= (and b!570252 c!65408) b!570251))

(assert (= (and b!570252 (not c!65408)) b!570253))

(assert (= (and b!570251 res!360148) b!570254))

(assert (= (or b!570254 b!570253) bm!32588))

(assert (=> b!570252 m!549021))

(assert (=> b!570252 m!549021))

(assert (=> b!570252 m!549109))

(declare-fun m!549113 () Bool)

(assert (=> bm!32588 m!549113))

(assert (=> b!570251 m!549021))

(declare-fun m!549115 () Bool)

(assert (=> b!570251 m!549115))

(declare-fun m!549117 () Bool)

(assert (=> b!570251 m!549117))

(assert (=> b!570251 m!549021))

(declare-fun m!549119 () Bool)

(assert (=> b!570251 m!549119))

(assert (=> b!570018 d!84645))

(declare-fun d!84651 () Bool)

(assert (=> d!84651 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52210 d!84651))

(declare-fun d!84661 () Bool)

(assert (=> d!84661 (= (array_inv!12954 a!3118) (bvsge (size!17522 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52210 d!84661))

(declare-fun b!570321 () Bool)

(declare-fun e!328011 () SeekEntryResult!5607)

(assert (=> b!570321 (= e!328011 Undefined!5607)))

(declare-fun lt!259975 () SeekEntryResult!5607)

(declare-fun d!84663 () Bool)

(assert (=> d!84663 (and (or ((_ is Undefined!5607) lt!259975) (not ((_ is Found!5607) lt!259975)) (and (bvsge (index!24656 lt!259975) #b00000000000000000000000000000000) (bvslt (index!24656 lt!259975) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259975) ((_ is Found!5607) lt!259975) (not ((_ is MissingVacant!5607) lt!259975)) (not (= (index!24658 lt!259975) (index!24657 lt!259843))) (and (bvsge (index!24658 lt!259975) #b00000000000000000000000000000000) (bvslt (index!24658 lt!259975) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259975) (ite ((_ is Found!5607) lt!259975) (= (select (arr!17158 a!3118) (index!24656 lt!259975)) (select (arr!17158 a!3118) j!142)) (and ((_ is MissingVacant!5607) lt!259975) (= (index!24658 lt!259975) (index!24657 lt!259843)) (= (select (arr!17158 a!3118) (index!24658 lt!259975)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84663 (= lt!259975 e!328011)))

(declare-fun c!65440 () Bool)

(assert (=> d!84663 (= c!65440 (bvsge (x!53522 lt!259843) #b01111111111111111111111111111110))))

(declare-fun lt!259974 () (_ BitVec 64))

(assert (=> d!84663 (= lt!259974 (select (arr!17158 a!3118) (index!24657 lt!259843)))))

(assert (=> d!84663 (validMask!0 mask!3119)))

(assert (=> d!84663 (= (seekKeyOrZeroReturnVacant!0 (x!53522 lt!259843) (index!24657 lt!259843) (index!24657 lt!259843) (select (arr!17158 a!3118) j!142) a!3118 mask!3119) lt!259975)))

(declare-fun e!328009 () SeekEntryResult!5607)

(declare-fun b!570322 () Bool)

(assert (=> b!570322 (= e!328009 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53522 lt!259843) #b00000000000000000000000000000001) (nextIndex!0 (index!24657 lt!259843) (x!53522 lt!259843) mask!3119) (index!24657 lt!259843) (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570323 () Bool)

(declare-fun c!65439 () Bool)

(assert (=> b!570323 (= c!65439 (= lt!259974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328010 () SeekEntryResult!5607)

(assert (=> b!570323 (= e!328010 e!328009)))

(declare-fun b!570324 () Bool)

(assert (=> b!570324 (= e!328011 e!328010)))

(declare-fun c!65441 () Bool)

(assert (=> b!570324 (= c!65441 (= lt!259974 (select (arr!17158 a!3118) j!142)))))

(declare-fun b!570325 () Bool)

(assert (=> b!570325 (= e!328009 (MissingVacant!5607 (index!24657 lt!259843)))))

(declare-fun b!570326 () Bool)

(assert (=> b!570326 (= e!328010 (Found!5607 (index!24657 lt!259843)))))

(assert (= (and d!84663 c!65440) b!570321))

(assert (= (and d!84663 (not c!65440)) b!570324))

(assert (= (and b!570324 c!65441) b!570326))

(assert (= (and b!570324 (not c!65441)) b!570323))

(assert (= (and b!570323 c!65439) b!570325))

(assert (= (and b!570323 (not c!65439)) b!570322))

(declare-fun m!549167 () Bool)

(assert (=> d!84663 m!549167))

(declare-fun m!549169 () Bool)

(assert (=> d!84663 m!549169))

(assert (=> d!84663 m!548947))

(assert (=> d!84663 m!548977))

(declare-fun m!549171 () Bool)

(assert (=> b!570322 m!549171))

(assert (=> b!570322 m!549171))

(assert (=> b!570322 m!548941))

(declare-fun m!549173 () Bool)

(assert (=> b!570322 m!549173))

(assert (=> b!570023 d!84663))

(declare-fun b!570327 () Bool)

(declare-fun e!328014 () SeekEntryResult!5607)

(declare-fun lt!259977 () SeekEntryResult!5607)

(assert (=> b!570327 (= e!328014 (Found!5607 (index!24657 lt!259977)))))

(declare-fun b!570328 () Bool)

(declare-fun e!328012 () SeekEntryResult!5607)

(assert (=> b!570328 (= e!328012 Undefined!5607)))

(declare-fun b!570329 () Bool)

(assert (=> b!570329 (= e!328012 e!328014)))

(declare-fun lt!259976 () (_ BitVec 64))

(assert (=> b!570329 (= lt!259976 (select (arr!17158 a!3118) (index!24657 lt!259977)))))

(declare-fun c!65443 () Bool)

(assert (=> b!570329 (= c!65443 (= lt!259976 (select (arr!17158 a!3118) j!142)))))

(declare-fun b!570330 () Bool)

(declare-fun c!65444 () Bool)

(assert (=> b!570330 (= c!65444 (= lt!259976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328013 () SeekEntryResult!5607)

(assert (=> b!570330 (= e!328014 e!328013)))

(declare-fun b!570331 () Bool)

(assert (=> b!570331 (= e!328013 (MissingZero!5607 (index!24657 lt!259977)))))

(declare-fun b!570332 () Bool)

(assert (=> b!570332 (= e!328013 (seekKeyOrZeroReturnVacant!0 (x!53522 lt!259977) (index!24657 lt!259977) (index!24657 lt!259977) (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84673 () Bool)

(declare-fun lt!259978 () SeekEntryResult!5607)

(assert (=> d!84673 (and (or ((_ is Undefined!5607) lt!259978) (not ((_ is Found!5607) lt!259978)) (and (bvsge (index!24656 lt!259978) #b00000000000000000000000000000000) (bvslt (index!24656 lt!259978) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259978) ((_ is Found!5607) lt!259978) (not ((_ is MissingZero!5607) lt!259978)) (and (bvsge (index!24655 lt!259978) #b00000000000000000000000000000000) (bvslt (index!24655 lt!259978) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259978) ((_ is Found!5607) lt!259978) ((_ is MissingZero!5607) lt!259978) (not ((_ is MissingVacant!5607) lt!259978)) (and (bvsge (index!24658 lt!259978) #b00000000000000000000000000000000) (bvslt (index!24658 lt!259978) (size!17522 a!3118)))) (or ((_ is Undefined!5607) lt!259978) (ite ((_ is Found!5607) lt!259978) (= (select (arr!17158 a!3118) (index!24656 lt!259978)) (select (arr!17158 a!3118) j!142)) (ite ((_ is MissingZero!5607) lt!259978) (= (select (arr!17158 a!3118) (index!24655 lt!259978)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5607) lt!259978) (= (select (arr!17158 a!3118) (index!24658 lt!259978)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84673 (= lt!259978 e!328012)))

(declare-fun c!65442 () Bool)

(assert (=> d!84673 (= c!65442 (and ((_ is Intermediate!5607) lt!259977) (undefined!6419 lt!259977)))))

(assert (=> d!84673 (= lt!259977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17158 a!3118) j!142) mask!3119) (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84673 (validMask!0 mask!3119)))

(assert (=> d!84673 (= (seekEntryOrOpen!0 (select (arr!17158 a!3118) j!142) a!3118 mask!3119) lt!259978)))

(assert (= (and d!84673 c!65442) b!570328))

(assert (= (and d!84673 (not c!65442)) b!570329))

(assert (= (and b!570329 c!65443) b!570327))

(assert (= (and b!570329 (not c!65443)) b!570330))

(assert (= (and b!570330 c!65444) b!570331))

(assert (= (and b!570330 (not c!65444)) b!570332))

(declare-fun m!549175 () Bool)

(assert (=> b!570329 m!549175))

(assert (=> b!570332 m!548941))

(declare-fun m!549177 () Bool)

(assert (=> b!570332 m!549177))

(declare-fun m!549179 () Bool)

(assert (=> d!84673 m!549179))

(declare-fun m!549181 () Bool)

(assert (=> d!84673 m!549181))

(declare-fun m!549183 () Bool)

(assert (=> d!84673 m!549183))

(assert (=> d!84673 m!548941))

(assert (=> d!84673 m!548965))

(assert (=> d!84673 m!548977))

(assert (=> d!84673 m!548965))

(assert (=> d!84673 m!548941))

(declare-fun m!549185 () Bool)

(assert (=> d!84673 m!549185))

(assert (=> b!570022 d!84673))

(declare-fun b!570334 () Bool)

(declare-fun e!328016 () Bool)

(declare-fun e!328017 () Bool)

(assert (=> b!570334 (= e!328016 e!328017)))

(declare-fun c!65445 () Bool)

(assert (=> b!570334 (= c!65445 (validKeyInArray!0 (select (arr!17158 a!3118) j!142)))))

(declare-fun call!32595 () Bool)

(declare-fun bm!32592 () Bool)

(assert (=> bm!32592 (= call!32595 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84675 () Bool)

(declare-fun res!360157 () Bool)

(assert (=> d!84675 (=> res!360157 e!328016)))

(assert (=> d!84675 (= res!360157 (bvsge j!142 (size!17522 a!3118)))))

(assert (=> d!84675 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328016)))

(declare-fun b!570333 () Bool)

(declare-fun e!328015 () Bool)

(assert (=> b!570333 (= e!328017 e!328015)))

(declare-fun lt!259980 () (_ BitVec 64))

(assert (=> b!570333 (= lt!259980 (select (arr!17158 a!3118) j!142))))

(declare-fun lt!259979 () Unit!17916)

(assert (=> b!570333 (= lt!259979 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259980 j!142))))

(assert (=> b!570333 (arrayContainsKey!0 a!3118 lt!259980 #b00000000000000000000000000000000)))

(declare-fun lt!259981 () Unit!17916)

(assert (=> b!570333 (= lt!259981 lt!259979)))

(declare-fun res!360156 () Bool)

(assert (=> b!570333 (= res!360156 (= (seekEntryOrOpen!0 (select (arr!17158 a!3118) j!142) a!3118 mask!3119) (Found!5607 j!142)))))

(assert (=> b!570333 (=> (not res!360156) (not e!328015))))

(declare-fun b!570335 () Bool)

(assert (=> b!570335 (= e!328017 call!32595)))

(declare-fun b!570336 () Bool)

(assert (=> b!570336 (= e!328015 call!32595)))

(assert (= (and d!84675 (not res!360157)) b!570334))

(assert (= (and b!570334 c!65445) b!570333))

(assert (= (and b!570334 (not c!65445)) b!570335))

(assert (= (and b!570333 res!360156) b!570336))

(assert (= (or b!570336 b!570335) bm!32592))

(assert (=> b!570334 m!548941))

(assert (=> b!570334 m!548941))

(assert (=> b!570334 m!548943))

(declare-fun m!549187 () Bool)

(assert (=> bm!32592 m!549187))

(assert (=> b!570333 m!548941))

(declare-fun m!549189 () Bool)

(assert (=> b!570333 m!549189))

(declare-fun m!549191 () Bool)

(assert (=> b!570333 m!549191))

(assert (=> b!570333 m!548941))

(assert (=> b!570333 m!548953))

(assert (=> b!570022 d!84675))

(declare-fun d!84677 () Bool)

(assert (=> d!84677 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259990 () Unit!17916)

(declare-fun choose!38 (array!35733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17916)

(assert (=> d!84677 (= lt!259990 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84677 (validMask!0 mask!3119)))

(assert (=> d!84677 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259990)))

(declare-fun bs!17687 () Bool)

(assert (= bs!17687 d!84677))

(assert (=> bs!17687 m!548949))

(declare-fun m!549193 () Bool)

(assert (=> bs!17687 m!549193))

(assert (=> bs!17687 m!548977))

(assert (=> b!570022 d!84677))

(declare-fun d!84679 () Bool)

(assert (=> d!84679 (= (validKeyInArray!0 (select (arr!17158 a!3118) j!142)) (and (not (= (select (arr!17158 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17158 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570017 d!84679))

(check-sat (not b!570334) (not b!570251) (not d!84607) (not d!84625) (not bm!32585) (not b!570333) (not d!84663) (not b!570111) (not bm!32592) (not d!84617) (not b!570332) (not d!84677) (not b!570062) (not b!570239) (not bm!32588) (not b!570238) (not b!570102) (not b!570240) (not d!84673) (not b!570322) (not b!570252) (not b!570201))
(check-sat)
