; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50418 () Bool)

(assert start!50418)

(declare-fun b!551302 () Bool)

(declare-fun e!318139 () Bool)

(declare-fun e!318140 () Bool)

(assert (=> b!551302 (= e!318139 e!318140)))

(declare-fun res!344231 () Bool)

(assert (=> b!551302 (=> (not res!344231) (not e!318140))))

(declare-datatypes ((SeekEntryResult!5142 0))(
  ( (MissingZero!5142 (index!22795 (_ BitVec 32))) (Found!5142 (index!22796 (_ BitVec 32))) (Intermediate!5142 (undefined!5954 Bool) (index!22797 (_ BitVec 32)) (x!51727 (_ BitVec 32))) (Undefined!5142) (MissingVacant!5142 (index!22798 (_ BitVec 32))) )
))
(declare-fun lt!250624 () SeekEntryResult!5142)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551302 (= res!344231 (or (= lt!250624 (MissingZero!5142 i!1132)) (= lt!250624 (MissingVacant!5142 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34766 0))(
  ( (array!34767 (arr!16696 (Array (_ BitVec 32) (_ BitVec 64))) (size!17061 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34766)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34766 (_ BitVec 32)) SeekEntryResult!5142)

(assert (=> b!551302 (= lt!250624 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551303 () Bool)

(declare-fun res!344224 () Bool)

(assert (=> b!551303 (=> (not res!344224) (not e!318140))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34766 (_ BitVec 32)) SeekEntryResult!5142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551303 (= res!344224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118)) mask!3119)))))

(declare-fun b!551304 () Bool)

(declare-fun res!344229 () Bool)

(assert (=> b!551304 (=> (not res!344229) (not e!318139))))

(assert (=> b!551304 (= res!344229 (and (= (size!17061 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17061 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17061 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551305 () Bool)

(declare-fun res!344225 () Bool)

(assert (=> b!551305 (=> (not res!344225) (not e!318140))))

(declare-datatypes ((List!10815 0))(
  ( (Nil!10812) (Cons!10811 (h!11790 (_ BitVec 64)) (t!17034 List!10815)) )
))
(declare-fun arrayNoDuplicates!0 (array!34766 (_ BitVec 32) List!10815) Bool)

(assert (=> b!551305 (= res!344225 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10812))))

(declare-fun b!551306 () Bool)

(declare-fun e!318141 () Bool)

(assert (=> b!551306 (= e!318141 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (Found!5142 j!142)))))

(declare-fun b!551307 () Bool)

(declare-fun res!344230 () Bool)

(assert (=> b!551307 (=> (not res!344230) (not e!318139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551307 (= res!344230 (validKeyInArray!0 k!1914))))

(declare-fun res!344227 () Bool)

(assert (=> start!50418 (=> (not res!344227) (not e!318139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50418 (= res!344227 (validMask!0 mask!3119))))

(assert (=> start!50418 e!318139))

(assert (=> start!50418 true))

(declare-fun array_inv!12579 (array!34766) Bool)

(assert (=> start!50418 (array_inv!12579 a!3118)))

(declare-fun b!551308 () Bool)

(declare-fun res!344226 () Bool)

(assert (=> b!551308 (=> (not res!344226) (not e!318139))))

(declare-fun arrayContainsKey!0 (array!34766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551308 (= res!344226 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551309 () Bool)

(declare-fun res!344223 () Bool)

(assert (=> b!551309 (=> (not res!344223) (not e!318140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34766 (_ BitVec 32)) Bool)

(assert (=> b!551309 (= res!344223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551310 () Bool)

(assert (=> b!551310 (= e!318140 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(assert (=> b!551310 e!318141))

(declare-fun res!344222 () Bool)

(assert (=> b!551310 (=> (not res!344222) (not e!318141))))

(assert (=> b!551310 (= res!344222 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17044 0))(
  ( (Unit!17045) )
))
(declare-fun lt!250623 () Unit!17044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17044)

(assert (=> b!551310 (= lt!250623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551311 () Bool)

(declare-fun res!344228 () Bool)

(assert (=> b!551311 (=> (not res!344228) (not e!318139))))

(assert (=> b!551311 (= res!344228 (validKeyInArray!0 (select (arr!16696 a!3118) j!142)))))

(assert (= (and start!50418 res!344227) b!551304))

(assert (= (and b!551304 res!344229) b!551311))

(assert (= (and b!551311 res!344228) b!551307))

(assert (= (and b!551307 res!344230) b!551308))

(assert (= (and b!551308 res!344226) b!551302))

(assert (= (and b!551302 res!344231) b!551309))

(assert (= (and b!551309 res!344223) b!551305))

(assert (= (and b!551305 res!344225) b!551303))

(assert (= (and b!551303 res!344224) b!551310))

(assert (= (and b!551310 res!344222) b!551306))

(declare-fun m!527813 () Bool)

(assert (=> b!551308 m!527813))

(declare-fun m!527815 () Bool)

(assert (=> b!551310 m!527815))

(declare-fun m!527817 () Bool)

(assert (=> b!551310 m!527817))

(declare-fun m!527819 () Bool)

(assert (=> b!551307 m!527819))

(declare-fun m!527821 () Bool)

(assert (=> b!551309 m!527821))

(declare-fun m!527823 () Bool)

(assert (=> b!551302 m!527823))

(declare-fun m!527825 () Bool)

(assert (=> b!551303 m!527825))

(declare-fun m!527827 () Bool)

(assert (=> b!551303 m!527827))

(assert (=> b!551303 m!527825))

(declare-fun m!527829 () Bool)

(assert (=> b!551303 m!527829))

(declare-fun m!527831 () Bool)

(assert (=> b!551303 m!527831))

(assert (=> b!551303 m!527829))

(declare-fun m!527833 () Bool)

(assert (=> b!551303 m!527833))

(assert (=> b!551303 m!527827))

(assert (=> b!551303 m!527825))

(declare-fun m!527835 () Bool)

(assert (=> b!551303 m!527835))

(declare-fun m!527837 () Bool)

(assert (=> b!551303 m!527837))

(assert (=> b!551303 m!527829))

(assert (=> b!551303 m!527831))

(assert (=> b!551306 m!527825))

(assert (=> b!551306 m!527825))

(declare-fun m!527839 () Bool)

(assert (=> b!551306 m!527839))

(declare-fun m!527841 () Bool)

(assert (=> b!551305 m!527841))

(declare-fun m!527843 () Bool)

(assert (=> start!50418 m!527843))

(declare-fun m!527845 () Bool)

(assert (=> start!50418 m!527845))

(assert (=> b!551311 m!527825))

(assert (=> b!551311 m!527825))

(declare-fun m!527847 () Bool)

(assert (=> b!551311 m!527847))

(push 1)

(assert (not b!551307))

(assert (not b!551306))

(assert (not b!551305))

(assert (not b!551302))

(assert (not b!551310))

(assert (not b!551308))

(assert (not b!551311))

(assert (not b!551309))

(assert (not b!551303))

(assert (not start!50418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82803 () Bool)

(assert (=> d!82803 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551307 d!82803))

(declare-fun b!551351 () Bool)

(declare-fun e!318169 () SeekEntryResult!5142)

(declare-fun lt!250644 () SeekEntryResult!5142)

(assert (=> b!551351 (= e!318169 (MissingZero!5142 (index!22797 lt!250644)))))

(declare-fun b!551352 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34766 (_ BitVec 32)) SeekEntryResult!5142)

(assert (=> b!551352 (= e!318169 (seekKeyOrZeroReturnVacant!0 (x!51727 lt!250644) (index!22797 lt!250644) (index!22797 lt!250644) k!1914 a!3118 mask!3119))))

(declare-fun b!551353 () Bool)

(declare-fun e!318170 () SeekEntryResult!5142)

(declare-fun e!318171 () SeekEntryResult!5142)

(assert (=> b!551353 (= e!318170 e!318171)))

(declare-fun lt!250643 () (_ BitVec 64))

(assert (=> b!551353 (= lt!250643 (select (arr!16696 a!3118) (index!22797 lt!250644)))))

(declare-fun c!63887 () Bool)

(assert (=> b!551353 (= c!63887 (= lt!250643 k!1914))))

(declare-fun b!551354 () Bool)

(assert (=> b!551354 (= e!318170 Undefined!5142)))

(declare-fun b!551355 () Bool)

(assert (=> b!551355 (= e!318171 (Found!5142 (index!22797 lt!250644)))))

(declare-fun b!551356 () Bool)

(declare-fun c!63886 () Bool)

(assert (=> b!551356 (= c!63886 (= lt!250643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551356 (= e!318171 e!318169)))

(declare-fun d!82805 () Bool)

(declare-fun lt!250645 () SeekEntryResult!5142)

(assert (=> d!82805 (and (or (is-Undefined!5142 lt!250645) (not (is-Found!5142 lt!250645)) (and (bvsge (index!22796 lt!250645) #b00000000000000000000000000000000) (bvslt (index!22796 lt!250645) (size!17061 a!3118)))) (or (is-Undefined!5142 lt!250645) (is-Found!5142 lt!250645) (not (is-MissingZero!5142 lt!250645)) (and (bvsge (index!22795 lt!250645) #b00000000000000000000000000000000) (bvslt (index!22795 lt!250645) (size!17061 a!3118)))) (or (is-Undefined!5142 lt!250645) (is-Found!5142 lt!250645) (is-MissingZero!5142 lt!250645) (not (is-MissingVacant!5142 lt!250645)) (and (bvsge (index!22798 lt!250645) #b00000000000000000000000000000000) (bvslt (index!22798 lt!250645) (size!17061 a!3118)))) (or (is-Undefined!5142 lt!250645) (ite (is-Found!5142 lt!250645) (= (select (arr!16696 a!3118) (index!22796 lt!250645)) k!1914) (ite (is-MissingZero!5142 lt!250645) (= (select (arr!16696 a!3118) (index!22795 lt!250645)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5142 lt!250645) (= (select (arr!16696 a!3118) (index!22798 lt!250645)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82805 (= lt!250645 e!318170)))

(declare-fun c!63888 () Bool)

(assert (=> d!82805 (= c!63888 (and (is-Intermediate!5142 lt!250644) (undefined!5954 lt!250644)))))

(assert (=> d!82805 (= lt!250644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82805 (validMask!0 mask!3119)))

(assert (=> d!82805 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!250645)))

(assert (= (and d!82805 c!63888) b!551354))

(assert (= (and d!82805 (not c!63888)) b!551353))

(assert (= (and b!551353 c!63887) b!551355))

(assert (= (and b!551353 (not c!63887)) b!551356))

(assert (= (and b!551356 c!63886) b!551351))

(assert (= (and b!551356 (not c!63886)) b!551352))

(declare-fun m!527865 () Bool)

(assert (=> b!551352 m!527865))

(declare-fun m!527867 () Bool)

(assert (=> b!551353 m!527867))

(declare-fun m!527869 () Bool)

(assert (=> d!82805 m!527869))

(declare-fun m!527871 () Bool)

(assert (=> d!82805 m!527871))

(declare-fun m!527873 () Bool)

(assert (=> d!82805 m!527873))

(assert (=> d!82805 m!527873))

(declare-fun m!527875 () Bool)

(assert (=> d!82805 m!527875))

(declare-fun m!527877 () Bool)

(assert (=> d!82805 m!527877))

(assert (=> d!82805 m!527843))

(assert (=> b!551302 d!82805))

(declare-fun d!82815 () Bool)

(assert (=> d!82815 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50418 d!82815))

(declare-fun d!82817 () Bool)

(assert (=> d!82817 (= (array_inv!12579 a!3118) (bvsge (size!17061 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50418 d!82817))

(declare-fun d!82819 () Bool)

(declare-fun res!344251 () Bool)

(declare-fun e!318182 () Bool)

(assert (=> d!82819 (=> res!344251 e!318182)))

(assert (=> d!82819 (= res!344251 (= (select (arr!16696 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82819 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!318182)))

(declare-fun b!551373 () Bool)

(declare-fun e!318183 () Bool)

(assert (=> b!551373 (= e!318182 e!318183)))

(declare-fun res!344252 () Bool)

(assert (=> b!551373 (=> (not res!344252) (not e!318183))))

(assert (=> b!551373 (= res!344252 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17061 a!3118)))))

(declare-fun b!551374 () Bool)

(assert (=> b!551374 (= e!318183 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82819 (not res!344251)) b!551373))

(assert (= (and b!551373 res!344252) b!551374))

(declare-fun m!527879 () Bool)

(assert (=> d!82819 m!527879))

(declare-fun m!527881 () Bool)

(assert (=> b!551374 m!527881))

(assert (=> b!551308 d!82819))

(declare-fun b!551429 () Bool)

(declare-fun e!318218 () Bool)

(declare-fun lt!250677 () SeekEntryResult!5142)

(assert (=> b!551429 (= e!318218 (bvsge (x!51727 lt!250677) #b01111111111111111111111111111110))))

(declare-fun b!551430 () Bool)

(assert (=> b!551430 (and (bvsge (index!22797 lt!250677) #b00000000000000000000000000000000) (bvslt (index!22797 lt!250677) (size!17061 a!3118)))))

(declare-fun e!318216 () Bool)

(assert (=> b!551430 (= e!318216 (= (select (arr!16696 a!3118) (index!22797 lt!250677)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!82821 () Bool)

(assert (=> d!82821 e!318218))

(declare-fun c!63918 () Bool)

(assert (=> d!82821 (= c!63918 (and (is-Intermediate!5142 lt!250677) (undefined!5954 lt!250677)))))

(declare-fun e!318215 () SeekEntryResult!5142)

(assert (=> d!82821 (= lt!250677 e!318215)))

(declare-fun c!63916 () Bool)

(assert (=> d!82821 (= c!63916 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250678 () (_ BitVec 64))

(assert (=> d!82821 (= lt!250678 (select (arr!16696 a!3118) (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119)))))

(assert (=> d!82821 (validMask!0 mask!3119)))

(assert (=> d!82821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119) lt!250677)))

(declare-fun b!551431 () Bool)

(assert (=> b!551431 (= e!318215 (Intermediate!5142 true (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551432 () Bool)

(assert (=> b!551432 (and (bvsge (index!22797 lt!250677) #b00000000000000000000000000000000) (bvslt (index!22797 lt!250677) (size!17061 a!3118)))))

(declare-fun res!344266 () Bool)

(assert (=> b!551432 (= res!344266 (= (select (arr!16696 a!3118) (index!22797 lt!250677)) (select (arr!16696 a!3118) j!142)))))

(assert (=> b!551432 (=> res!344266 e!318216)))

(declare-fun e!318217 () Bool)

(assert (=> b!551432 (= e!318217 e!318216)))

(declare-fun b!551433 () Bool)

(assert (=> b!551433 (and (bvsge (index!22797 lt!250677) #b00000000000000000000000000000000) (bvslt (index!22797 lt!250677) (size!17061 a!3118)))))

(declare-fun res!344267 () Bool)

(assert (=> b!551433 (= res!344267 (= (select (arr!16696 a!3118) (index!22797 lt!250677)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551433 (=> res!344267 e!318216)))

(declare-fun e!318219 () SeekEntryResult!5142)

(declare-fun b!551434 () Bool)

(assert (=> b!551434 (= e!318219 (Intermediate!5142 false (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551435 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551435 (= e!318219 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551436 () Bool)

(assert (=> b!551436 (= e!318218 e!318217)))

(declare-fun res!344265 () Bool)

(assert (=> b!551436 (= res!344265 (and (is-Intermediate!5142 lt!250677) (not (undefined!5954 lt!250677)) (bvslt (x!51727 lt!250677) #b01111111111111111111111111111110) (bvsge (x!51727 lt!250677) #b00000000000000000000000000000000) (bvsge (x!51727 lt!250677) #b00000000000000000000000000000000)))))

(assert (=> b!551436 (=> (not res!344265) (not e!318217))))

(declare-fun b!551437 () Bool)

(assert (=> b!551437 (= e!318215 e!318219)))

(declare-fun c!63917 () Bool)

(assert (=> b!551437 (= c!63917 (or (= lt!250678 (select (arr!16696 a!3118) j!142)) (= (bvadd lt!250678 lt!250678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82821 c!63916) b!551431))

(assert (= (and d!82821 (not c!63916)) b!551437))

(assert (= (and b!551437 c!63917) b!551434))

(assert (= (and b!551437 (not c!63917)) b!551435))

(assert (= (and d!82821 c!63918) b!551429))

(assert (= (and d!82821 (not c!63918)) b!551436))

(assert (= (and b!551436 res!344265) b!551432))

(assert (= (and b!551432 (not res!344266)) b!551433))

(assert (= (and b!551433 (not res!344267)) b!551430))

(declare-fun m!527913 () Bool)

(assert (=> b!551433 m!527913))

(assert (=> b!551435 m!527827))

(declare-fun m!527915 () Bool)

(assert (=> b!551435 m!527915))

(assert (=> b!551435 m!527915))

(assert (=> b!551435 m!527825))

(declare-fun m!527917 () Bool)

(assert (=> b!551435 m!527917))

(assert (=> d!82821 m!527827))

(declare-fun m!527919 () Bool)

(assert (=> d!82821 m!527919))

(assert (=> d!82821 m!527843))

(assert (=> b!551432 m!527913))

(assert (=> b!551430 m!527913))

(assert (=> b!551303 d!82821))

(declare-fun d!82831 () Bool)

(declare-fun lt!250684 () (_ BitVec 32))

(declare-fun lt!250683 () (_ BitVec 32))

(assert (=> d!82831 (= lt!250684 (bvmul (bvxor lt!250683 (bvlshr lt!250683 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82831 (= lt!250683 ((_ extract 31 0) (bvand (bvxor (select (arr!16696 a!3118) j!142) (bvlshr (select (arr!16696 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82831 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344268 (let ((h!11791 ((_ extract 31 0) (bvand (bvxor (select (arr!16696 a!3118) j!142) (bvlshr (select (arr!16696 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51729 (bvmul (bvxor h!11791 (bvlshr h!11791 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51729 (bvlshr x!51729 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344268 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344268 #b00000000000000000000000000000000))))))

(assert (=> d!82831 (= (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (bvand (bvxor lt!250684 (bvlshr lt!250684 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551303 d!82831))

(declare-fun b!551438 () Bool)

(declare-fun e!318223 () Bool)

(declare-fun lt!250685 () SeekEntryResult!5142)

(assert (=> b!551438 (= e!318223 (bvsge (x!51727 lt!250685) #b01111111111111111111111111111110))))

(declare-fun b!551439 () Bool)

(assert (=> b!551439 (and (bvsge (index!22797 lt!250685) #b00000000000000000000000000000000) (bvslt (index!22797 lt!250685) (size!17061 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118)))))))

(declare-fun e!318221 () Bool)

(assert (=> b!551439 (= e!318221 (= (select (arr!16696 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118))) (index!22797 lt!250685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!82833 () Bool)

(assert (=> d!82833 e!318223))

(declare-fun c!63921 () Bool)

(assert (=> d!82833 (= c!63921 (and (is-Intermediate!5142 lt!250685) (undefined!5954 lt!250685)))))

(declare-fun e!318220 () SeekEntryResult!5142)

(assert (=> d!82833 (= lt!250685 e!318220)))

(declare-fun c!63919 () Bool)

(assert (=> d!82833 (= c!63919 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250686 () (_ BitVec 64))

(assert (=> d!82833 (= lt!250686 (select (arr!16696 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118))) (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119)))))

(assert (=> d!82833 (validMask!0 mask!3119)))

(assert (=> d!82833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118)) mask!3119) lt!250685)))

(declare-fun b!551440 () Bool)

(assert (=> b!551440 (= e!318220 (Intermediate!5142 true (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551441 () Bool)

(assert (=> b!551441 (and (bvsge (index!22797 lt!250685) #b00000000000000000000000000000000) (bvslt (index!22797 lt!250685) (size!17061 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118)))))))

(declare-fun res!344270 () Bool)

(assert (=> b!551441 (= res!344270 (= (select (arr!16696 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118))) (index!22797 lt!250685)) (select (store (arr!16696 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!551441 (=> res!344270 e!318221)))

(declare-fun e!318222 () Bool)

(assert (=> b!551441 (= e!318222 e!318221)))

(declare-fun b!551442 () Bool)

(assert (=> b!551442 (and (bvsge (index!22797 lt!250685) #b00000000000000000000000000000000) (bvslt (index!22797 lt!250685) (size!17061 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118)))))))

(declare-fun res!344271 () Bool)

(assert (=> b!551442 (= res!344271 (= (select (arr!16696 (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118))) (index!22797 lt!250685)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551442 (=> res!344271 e!318221)))

(declare-fun b!551443 () Bool)

(declare-fun e!318224 () SeekEntryResult!5142)

(assert (=> b!551443 (= e!318224 (Intermediate!5142 false (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551444 () Bool)

(assert (=> b!551444 (= e!318224 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) (array!34767 (store (arr!16696 a!3118) i!1132 k!1914) (size!17061 a!3118)) mask!3119))))

(declare-fun b!551445 () Bool)

(assert (=> b!551445 (= e!318223 e!318222)))

(declare-fun res!344269 () Bool)

(assert (=> b!551445 (= res!344269 (and (is-Intermediate!5142 lt!250685) (not (undefined!5954 lt!250685)) (bvslt (x!51727 lt!250685) #b01111111111111111111111111111110) (bvsge (x!51727 lt!250685) #b00000000000000000000000000000000) (bvsge (x!51727 lt!250685) #b00000000000000000000000000000000)))))

(assert (=> b!551445 (=> (not res!344269) (not e!318222))))

(declare-fun b!551446 () Bool)

(assert (=> b!551446 (= e!318220 e!318224)))

(declare-fun c!63920 () Bool)

(assert (=> b!551446 (= c!63920 (or (= lt!250686 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!250686 lt!250686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82833 c!63919) b!551440))

(assert (= (and d!82833 (not c!63919)) b!551446))

(assert (= (and b!551446 c!63920) b!551443))

(assert (= (and b!551446 (not c!63920)) b!551444))

(assert (= (and d!82833 c!63921) b!551438))

(assert (= (and d!82833 (not c!63921)) b!551445))

(assert (= (and b!551445 res!344269) b!551441))

(assert (= (and b!551441 (not res!344270)) b!551442))

(assert (= (and b!551442 (not res!344271)) b!551439))

(declare-fun m!527921 () Bool)

(assert (=> b!551442 m!527921))

(assert (=> b!551444 m!527831))

(declare-fun m!527923 () Bool)

(assert (=> b!551444 m!527923))

(assert (=> b!551444 m!527923))

(assert (=> b!551444 m!527829))

(declare-fun m!527925 () Bool)

(assert (=> b!551444 m!527925))

(assert (=> d!82833 m!527831))

(declare-fun m!527927 () Bool)

(assert (=> d!82833 m!527927))

(assert (=> d!82833 m!527843))

(assert (=> b!551441 m!527921))

(assert (=> b!551439 m!527921))

(assert (=> b!551303 d!82833))

(declare-fun d!82835 () Bool)

(declare-fun lt!250690 () (_ BitVec 32))

(declare-fun lt!250689 () (_ BitVec 32))

(assert (=> d!82835 (= lt!250690 (bvmul (bvxor lt!250689 (bvlshr lt!250689 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82835 (= lt!250689 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82835 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344268 (let ((h!11791 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51729 (bvmul (bvxor h!11791 (bvlshr h!11791 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51729 (bvlshr x!51729 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344268 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344268 #b00000000000000000000000000000000))))))

(assert (=> d!82835 (= (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!250690 (bvlshr lt!250690 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551303 d!82835))

(declare-fun b!551465 () Bool)

(declare-fun e!318241 () Bool)

(declare-fun e!318239 () Bool)

(assert (=> b!551465 (= e!318241 e!318239)))

(declare-fun lt!250700 () (_ BitVec 64))

(assert (=> b!551465 (= lt!250700 (select (arr!16696 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250698 () Unit!17044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34766 (_ BitVec 64) (_ BitVec 32)) Unit!17044)

(assert (=> b!551465 (= lt!250698 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250700 #b00000000000000000000000000000000))))

(assert (=> b!551465 (arrayContainsKey!0 a!3118 lt!250700 #b00000000000000000000000000000000)))

(declare-fun lt!250699 () Unit!17044)

(assert (=> b!551465 (= lt!250699 lt!250698)))

(declare-fun res!344283 () Bool)

(assert (=> b!551465 (= res!344283 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5142 #b00000000000000000000000000000000)))))

(assert (=> b!551465 (=> (not res!344283) (not e!318239))))

(declare-fun b!551466 () Bool)

(declare-fun call!32277 () Bool)

(assert (=> b!551466 (= e!318239 call!32277)))

(declare-fun b!551467 () Bool)

(declare-fun e!318240 () Bool)

(assert (=> b!551467 (= e!318240 e!318241)))

(declare-fun c!63926 () Bool)

(assert (=> b!551467 (= c!63926 (validKeyInArray!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82837 () Bool)

(declare-fun res!344282 () Bool)

(assert (=> d!82837 (=> res!344282 e!318240)))

(assert (=> d!82837 (= res!344282 (bvsge #b00000000000000000000000000000000 (size!17061 a!3118)))))

(assert (=> d!82837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318240)))

(declare-fun bm!32274 () Bool)

(assert (=> bm!32274 (= call!32277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551468 () Bool)

(assert (=> b!551468 (= e!318241 call!32277)))

(assert (= (and d!82837 (not res!344282)) b!551467))

(assert (= (and b!551467 c!63926) b!551465))

(assert (= (and b!551467 (not c!63926)) b!551468))

(assert (= (and b!551465 res!344283) b!551466))

(assert (= (or b!551466 b!551468) bm!32274))

(assert (=> b!551465 m!527879))

(declare-fun m!527931 () Bool)

(assert (=> b!551465 m!527931))

(declare-fun m!527933 () Bool)

(assert (=> b!551465 m!527933))

(assert (=> b!551465 m!527879))

(declare-fun m!527935 () Bool)

(assert (=> b!551465 m!527935))

(assert (=> b!551467 m!527879))

(assert (=> b!551467 m!527879))

(declare-fun m!527937 () Bool)

(assert (=> b!551467 m!527937))

(declare-fun m!527939 () Bool)

(assert (=> bm!32274 m!527939))

(assert (=> b!551309 d!82837))

(declare-fun b!551469 () Bool)

(declare-fun e!318244 () Bool)

(declare-fun e!318242 () Bool)

(assert (=> b!551469 (= e!318244 e!318242)))

(declare-fun lt!250703 () (_ BitVec 64))

(assert (=> b!551469 (= lt!250703 (select (arr!16696 a!3118) j!142))))

(declare-fun lt!250701 () Unit!17044)

(assert (=> b!551469 (= lt!250701 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250703 j!142))))

(assert (=> b!551469 (arrayContainsKey!0 a!3118 lt!250703 #b00000000000000000000000000000000)))

(declare-fun lt!250702 () Unit!17044)

(assert (=> b!551469 (= lt!250702 lt!250701)))

(declare-fun res!344285 () Bool)

(assert (=> b!551469 (= res!344285 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (Found!5142 j!142)))))

(assert (=> b!551469 (=> (not res!344285) (not e!318242))))

(declare-fun b!551470 () Bool)

(declare-fun call!32278 () Bool)

(assert (=> b!551470 (= e!318242 call!32278)))

(declare-fun b!551471 () Bool)

(declare-fun e!318243 () Bool)

(assert (=> b!551471 (= e!318243 e!318244)))

(declare-fun c!63927 () Bool)

(assert (=> b!551471 (= c!63927 (validKeyInArray!0 (select (arr!16696 a!3118) j!142)))))

(declare-fun d!82843 () Bool)

(declare-fun res!344284 () Bool)

(assert (=> d!82843 (=> res!344284 e!318243)))

(assert (=> d!82843 (= res!344284 (bvsge j!142 (size!17061 a!3118)))))

(assert (=> d!82843 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318243)))

(declare-fun bm!32275 () Bool)

(assert (=> bm!32275 (= call!32278 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551472 () Bool)

(assert (=> b!551472 (= e!318244 call!32278)))

(assert (= (and d!82843 (not res!344284)) b!551471))

(assert (= (and b!551471 c!63927) b!551469))

(assert (= (and b!551471 (not c!63927)) b!551472))

(assert (= (and b!551469 res!344285) b!551470))

(assert (= (or b!551470 b!551472) bm!32275))

(assert (=> b!551469 m!527825))

(declare-fun m!527941 () Bool)

(assert (=> b!551469 m!527941))

(declare-fun m!527943 () Bool)

(assert (=> b!551469 m!527943))

(assert (=> b!551469 m!527825))

(assert (=> b!551469 m!527839))

(assert (=> b!551471 m!527825))

(assert (=> b!551471 m!527825))

(assert (=> b!551471 m!527847))

(declare-fun m!527945 () Bool)

(assert (=> bm!32275 m!527945))

(assert (=> b!551310 d!82843))

(declare-fun d!82845 () Bool)

(assert (=> d!82845 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250713 () Unit!17044)

(declare-fun choose!38 (array!34766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17044)

(assert (=> d!82845 (= lt!250713 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82845 (validMask!0 mask!3119)))

(assert (=> d!82845 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250713)))

(declare-fun bs!17154 () Bool)

(assert (= bs!17154 d!82845))

(assert (=> bs!17154 m!527815))

(declare-fun m!527963 () Bool)

(assert (=> bs!17154 m!527963))

(assert (=> bs!17154 m!527843))

(assert (=> b!551310 d!82845))

(declare-fun b!551510 () Bool)

(declare-fun e!318271 () Bool)

(declare-fun call!32283 () Bool)

(assert (=> b!551510 (= e!318271 call!32283)))

(declare-fun d!82851 () Bool)

(declare-fun res!344304 () Bool)

(declare-fun e!318270 () Bool)

(assert (=> d!82851 (=> res!344304 e!318270)))

(assert (=> d!82851 (= res!344304 (bvsge #b00000000000000000000000000000000 (size!17061 a!3118)))))

(assert (=> d!82851 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10812) e!318270)))

(declare-fun b!551511 () Bool)

(assert (=> b!551511 (= e!318271 call!32283)))

(declare-fun b!551512 () Bool)

(declare-fun e!318272 () Bool)

(declare-fun contains!2821 (List!10815 (_ BitVec 64)) Bool)

(assert (=> b!551512 (= e!318272 (contains!2821 Nil!10812 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551513 () Bool)

(declare-fun e!318273 () Bool)

(assert (=> b!551513 (= e!318270 e!318273)))

(declare-fun res!344303 () Bool)

(assert (=> b!551513 (=> (not res!344303) (not e!318273))))

(assert (=> b!551513 (= res!344303 (not e!318272))))

(declare-fun res!344305 () Bool)

(assert (=> b!551513 (=> (not res!344305) (not e!318272))))

(assert (=> b!551513 (= res!344305 (validKeyInArray!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551514 () Bool)

(assert (=> b!551514 (= e!318273 e!318271)))

(declare-fun c!63938 () Bool)

(assert (=> b!551514 (= c!63938 (validKeyInArray!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32280 () Bool)

(assert (=> bm!32280 (= call!32283 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63938 (Cons!10811 (select (arr!16696 a!3118) #b00000000000000000000000000000000) Nil!10812) Nil!10812)))))

(assert (= (and d!82851 (not res!344304)) b!551513))

(assert (= (and b!551513 res!344305) b!551512))

(assert (= (and b!551513 res!344303) b!551514))

(assert (= (and b!551514 c!63938) b!551510))

(assert (= (and b!551514 (not c!63938)) b!551511))

(assert (= (or b!551510 b!551511) bm!32280))

(assert (=> b!551512 m!527879))

(assert (=> b!551512 m!527879))

(declare-fun m!527965 () Bool)

(assert (=> b!551512 m!527965))

(assert (=> b!551513 m!527879))

(assert (=> b!551513 m!527879))

(assert (=> b!551513 m!527937))

(assert (=> b!551514 m!527879))

(assert (=> b!551514 m!527879))

(assert (=> b!551514 m!527937))

(assert (=> bm!32280 m!527879))

(declare-fun m!527967 () Bool)

(assert (=> bm!32280 m!527967))

(assert (=> b!551305 d!82851))

(declare-fun d!82853 () Bool)

(assert (=> d!82853 (= (validKeyInArray!0 (select (arr!16696 a!3118) j!142)) (and (not (= (select (arr!16696 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16696 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551311 d!82853))

(declare-fun b!551515 () Bool)

(declare-fun e!318274 () SeekEntryResult!5142)

(declare-fun lt!250715 () SeekEntryResult!5142)

(assert (=> b!551515 (= e!318274 (MissingZero!5142 (index!22797 lt!250715)))))

(declare-fun b!551516 () Bool)

(assert (=> b!551516 (= e!318274 (seekKeyOrZeroReturnVacant!0 (x!51727 lt!250715) (index!22797 lt!250715) (index!22797 lt!250715) (select (arr!16696 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551517 () Bool)

(declare-fun e!318275 () SeekEntryResult!5142)

(declare-fun e!318276 () SeekEntryResult!5142)

(assert (=> b!551517 (= e!318275 e!318276)))

(declare-fun lt!250714 () (_ BitVec 64))

(assert (=> b!551517 (= lt!250714 (select (arr!16696 a!3118) (index!22797 lt!250715)))))

(declare-fun c!63940 () Bool)

(assert (=> b!551517 (= c!63940 (= lt!250714 (select (arr!16696 a!3118) j!142)))))

(declare-fun b!551518 () Bool)

(assert (=> b!551518 (= e!318275 Undefined!5142)))

(declare-fun b!551519 () Bool)

(assert (=> b!551519 (= e!318276 (Found!5142 (index!22797 lt!250715)))))

(declare-fun b!551520 () Bool)

(declare-fun c!63939 () Bool)

(assert (=> b!551520 (= c!63939 (= lt!250714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551520 (= e!318276 e!318274)))

(declare-fun d!82855 () Bool)

(declare-fun lt!250716 () SeekEntryResult!5142)

(assert (=> d!82855 (and (or (is-Undefined!5142 lt!250716) (not (is-Found!5142 lt!250716)) (and (bvsge (index!22796 lt!250716) #b00000000000000000000000000000000) (bvslt (index!22796 lt!250716) (size!17061 a!3118)))) (or (is-Undefined!5142 lt!250716) (is-Found!5142 lt!250716) (not (is-MissingZero!5142 lt!250716)) (and (bvsge (index!22795 lt!250716) #b00000000000000000000000000000000) (bvslt (index!22795 lt!250716) (size!17061 a!3118)))) (or (is-Undefined!5142 lt!250716) (is-Found!5142 lt!250716) (is-MissingZero!5142 lt!250716) (not (is-MissingVacant!5142 lt!250716)) (and (bvsge (index!22798 lt!250716) #b00000000000000000000000000000000) (bvslt (index!22798 lt!250716) (size!17061 a!3118)))) (or (is-Undefined!5142 lt!250716) (ite (is-Found!5142 lt!250716) (= (select (arr!16696 a!3118) (index!22796 lt!250716)) (select (arr!16696 a!3118) j!142)) (ite (is-MissingZero!5142 lt!250716) (= (select (arr!16696 a!3118) (index!22795 lt!250716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5142 lt!250716) (= (select (arr!16696 a!3118) (index!22798 lt!250716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82855 (= lt!250716 e!318275)))

(declare-fun c!63941 () Bool)

(assert (=> d!82855 (= c!63941 (and (is-Intermediate!5142 lt!250715) (undefined!5954 lt!250715)))))

(assert (=> d!82855 (= lt!250715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82855 (validMask!0 mask!3119)))

(assert (=> d!82855 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) lt!250716)))

(assert (= (and d!82855 c!63941) b!551518))

(assert (= (and d!82855 (not c!63941)) b!551517))

(assert (= (and b!551517 c!63940) b!551519))

(assert (= (and b!551517 (not c!63940)) b!551520))

(assert (= (and b!551520 c!63939) b!551515))

(assert (= (and b!551520 (not c!63939)) b!551516))

(assert (=> b!551516 m!527825))

(declare-fun m!527969 () Bool)

(assert (=> b!551516 m!527969))

(declare-fun m!527971 () Bool)

(assert (=> b!551517 m!527971))

(declare-fun m!527973 () Bool)

(assert (=> d!82855 m!527973))

(declare-fun m!527975 () Bool)

(assert (=> d!82855 m!527975))

(assert (=> d!82855 m!527825))

(assert (=> d!82855 m!527827))

(assert (=> d!82855 m!527827))

(assert (=> d!82855 m!527825))

(assert (=> d!82855 m!527835))

(declare-fun m!527977 () Bool)

(assert (=> d!82855 m!527977))

(assert (=> d!82855 m!527843))

(assert (=> b!551306 d!82855))

(push 1)

(assert (not b!551465))

(assert (not b!551514))

(assert (not d!82855))

(assert (not d!82805))

(assert (not bm!32275))

(assert (not b!551512))

(assert (not b!551352))

(assert (not b!551374))

(assert (not bm!32280))

(assert (not b!551516))

(assert (not d!82845))

(assert (not bm!32274))

(assert (not b!551513))

(assert (not d!82821))

(assert (not b!551467))

(assert (not b!551435))

(assert (not b!551444))

(assert (not b!551469))

(assert (not b!551471))

(assert (not d!82833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

