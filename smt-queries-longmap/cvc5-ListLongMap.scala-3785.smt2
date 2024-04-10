; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51824 () Bool)

(assert start!51824)

(declare-fun b!566762 () Bool)

(declare-fun res!357531 () Bool)

(declare-fun e!326173 () Bool)

(assert (=> b!566762 (=> (not res!357531) (not e!326173))))

(declare-datatypes ((array!35575 0))(
  ( (array!35576 (arr!17085 (Array (_ BitVec 32) (_ BitVec 64))) (size!17449 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35575)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566762 (= res!357531 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566763 () Bool)

(declare-fun e!326171 () Bool)

(declare-datatypes ((SeekEntryResult!5534 0))(
  ( (MissingZero!5534 (index!24363 (_ BitVec 32))) (Found!5534 (index!24364 (_ BitVec 32))) (Intermediate!5534 (undefined!6346 Bool) (index!24365 (_ BitVec 32)) (x!53233 (_ BitVec 32))) (Undefined!5534) (MissingVacant!5534 (index!24366 (_ BitVec 32))) )
))
(declare-fun lt!258289 () SeekEntryResult!5534)

(assert (=> b!566763 (= e!326171 (not (or (not (is-Intermediate!5534 lt!258289)) (undefined!6346 lt!258289) (and (bvsge (index!24365 lt!258289) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258289) (size!17449 a!3118))))))))

(declare-fun e!326172 () Bool)

(assert (=> b!566763 e!326172))

(declare-fun res!357530 () Bool)

(assert (=> b!566763 (=> (not res!357530) (not e!326172))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35575 (_ BitVec 32)) Bool)

(assert (=> b!566763 (= res!357530 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17770 0))(
  ( (Unit!17771) )
))
(declare-fun lt!258292 () Unit!17770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17770)

(assert (=> b!566763 (= lt!258292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566764 () Bool)

(declare-fun res!357533 () Bool)

(declare-fun e!326174 () Bool)

(assert (=> b!566764 (=> (not res!357533) (not e!326174))))

(declare-datatypes ((List!11165 0))(
  ( (Nil!11162) (Cons!11161 (h!12170 (_ BitVec 64)) (t!17393 List!11165)) )
))
(declare-fun arrayNoDuplicates!0 (array!35575 (_ BitVec 32) List!11165) Bool)

(assert (=> b!566764 (= res!357533 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11162))))

(declare-fun b!566765 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35575 (_ BitVec 32)) SeekEntryResult!5534)

(assert (=> b!566765 (= e!326172 (= (seekEntryOrOpen!0 (select (arr!17085 a!3118) j!142) a!3118 mask!3119) (Found!5534 j!142)))))

(declare-fun b!566766 () Bool)

(declare-fun res!357539 () Bool)

(assert (=> b!566766 (=> (not res!357539) (not e!326173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566766 (= res!357539 (validKeyInArray!0 k!1914))))

(declare-fun b!566767 () Bool)

(declare-fun res!357532 () Bool)

(assert (=> b!566767 (=> (not res!357532) (not e!326173))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566767 (= res!357532 (and (= (size!17449 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17449 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17449 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566768 () Bool)

(assert (=> b!566768 (= e!326174 e!326171)))

(declare-fun res!357534 () Bool)

(assert (=> b!566768 (=> (not res!357534) (not e!326171))))

(declare-fun lt!258290 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35575 (_ BitVec 32)) SeekEntryResult!5534)

(assert (=> b!566768 (= res!357534 (= lt!258289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258290 (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118)) mask!3119)))))

(declare-fun lt!258291 () (_ BitVec 32))

(assert (=> b!566768 (= lt!258289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258291 (select (arr!17085 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566768 (= lt!258290 (toIndex!0 (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!566768 (= lt!258291 (toIndex!0 (select (arr!17085 a!3118) j!142) mask!3119))))

(declare-fun b!566769 () Bool)

(declare-fun res!357535 () Bool)

(assert (=> b!566769 (=> (not res!357535) (not e!326173))))

(assert (=> b!566769 (= res!357535 (validKeyInArray!0 (select (arr!17085 a!3118) j!142)))))

(declare-fun b!566770 () Bool)

(declare-fun res!357536 () Bool)

(assert (=> b!566770 (=> (not res!357536) (not e!326174))))

(assert (=> b!566770 (= res!357536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357537 () Bool)

(assert (=> start!51824 (=> (not res!357537) (not e!326173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51824 (= res!357537 (validMask!0 mask!3119))))

(assert (=> start!51824 e!326173))

(assert (=> start!51824 true))

(declare-fun array_inv!12881 (array!35575) Bool)

(assert (=> start!51824 (array_inv!12881 a!3118)))

(declare-fun b!566771 () Bool)

(assert (=> b!566771 (= e!326173 e!326174)))

(declare-fun res!357538 () Bool)

(assert (=> b!566771 (=> (not res!357538) (not e!326174))))

(declare-fun lt!258288 () SeekEntryResult!5534)

(assert (=> b!566771 (= res!357538 (or (= lt!258288 (MissingZero!5534 i!1132)) (= lt!258288 (MissingVacant!5534 i!1132))))))

(assert (=> b!566771 (= lt!258288 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51824 res!357537) b!566767))

(assert (= (and b!566767 res!357532) b!566769))

(assert (= (and b!566769 res!357535) b!566766))

(assert (= (and b!566766 res!357539) b!566762))

(assert (= (and b!566762 res!357531) b!566771))

(assert (= (and b!566771 res!357538) b!566770))

(assert (= (and b!566770 res!357536) b!566764))

(assert (= (and b!566764 res!357533) b!566768))

(assert (= (and b!566768 res!357534) b!566763))

(assert (= (and b!566763 res!357530) b!566765))

(declare-fun m!545361 () Bool)

(assert (=> b!566765 m!545361))

(assert (=> b!566765 m!545361))

(declare-fun m!545363 () Bool)

(assert (=> b!566765 m!545363))

(declare-fun m!545365 () Bool)

(assert (=> b!566766 m!545365))

(assert (=> b!566768 m!545361))

(declare-fun m!545367 () Bool)

(assert (=> b!566768 m!545367))

(declare-fun m!545369 () Bool)

(assert (=> b!566768 m!545369))

(declare-fun m!545371 () Bool)

(assert (=> b!566768 m!545371))

(assert (=> b!566768 m!545361))

(assert (=> b!566768 m!545361))

(declare-fun m!545373 () Bool)

(assert (=> b!566768 m!545373))

(assert (=> b!566768 m!545369))

(declare-fun m!545375 () Bool)

(assert (=> b!566768 m!545375))

(assert (=> b!566768 m!545369))

(declare-fun m!545377 () Bool)

(assert (=> b!566768 m!545377))

(declare-fun m!545379 () Bool)

(assert (=> start!51824 m!545379))

(declare-fun m!545381 () Bool)

(assert (=> start!51824 m!545381))

(declare-fun m!545383 () Bool)

(assert (=> b!566771 m!545383))

(declare-fun m!545385 () Bool)

(assert (=> b!566770 m!545385))

(declare-fun m!545387 () Bool)

(assert (=> b!566762 m!545387))

(declare-fun m!545389 () Bool)

(assert (=> b!566763 m!545389))

(declare-fun m!545391 () Bool)

(assert (=> b!566763 m!545391))

(declare-fun m!545393 () Bool)

(assert (=> b!566764 m!545393))

(assert (=> b!566769 m!545361))

(assert (=> b!566769 m!545361))

(declare-fun m!545395 () Bool)

(assert (=> b!566769 m!545395))

(push 1)

(assert (not b!566764))

(assert (not b!566770))

(assert (not b!566765))

(assert (not b!566769))

(assert (not b!566762))

(assert (not start!51824))

(assert (not b!566768))

(assert (not b!566766))

(assert (not b!566763))

(assert (not b!566771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84191 () Bool)

(declare-fun res!357604 () Bool)

(declare-fun e!326213 () Bool)

(assert (=> d!84191 (=> res!357604 e!326213)))

(assert (=> d!84191 (= res!357604 (bvsge #b00000000000000000000000000000000 (size!17449 a!3118)))))

(assert (=> d!84191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326213)))

(declare-fun b!566840 () Bool)

(declare-fun e!326214 () Bool)

(declare-fun call!32501 () Bool)

(assert (=> b!566840 (= e!326214 call!32501)))

(declare-fun bm!32498 () Bool)

(assert (=> bm!32498 (= call!32501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566841 () Bool)

(declare-fun e!326212 () Bool)

(assert (=> b!566841 (= e!326213 e!326212)))

(declare-fun c!64967 () Bool)

(assert (=> b!566841 (= c!64967 (validKeyInArray!0 (select (arr!17085 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566842 () Bool)

(assert (=> b!566842 (= e!326212 call!32501)))

(declare-fun b!566843 () Bool)

(assert (=> b!566843 (= e!326212 e!326214)))

(declare-fun lt!258329 () (_ BitVec 64))

(assert (=> b!566843 (= lt!258329 (select (arr!17085 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258330 () Unit!17770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35575 (_ BitVec 64) (_ BitVec 32)) Unit!17770)

(assert (=> b!566843 (= lt!258330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258329 #b00000000000000000000000000000000))))

(assert (=> b!566843 (arrayContainsKey!0 a!3118 lt!258329 #b00000000000000000000000000000000)))

(declare-fun lt!258331 () Unit!17770)

(assert (=> b!566843 (= lt!258331 lt!258330)))

(declare-fun res!357605 () Bool)

(assert (=> b!566843 (= res!357605 (= (seekEntryOrOpen!0 (select (arr!17085 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5534 #b00000000000000000000000000000000)))))

(assert (=> b!566843 (=> (not res!357605) (not e!326214))))

(assert (= (and d!84191 (not res!357604)) b!566841))

(assert (= (and b!566841 c!64967) b!566843))

(assert (= (and b!566841 (not c!64967)) b!566842))

(assert (= (and b!566843 res!357605) b!566840))

(assert (= (or b!566840 b!566842) bm!32498))

(declare-fun m!545469 () Bool)

(assert (=> bm!32498 m!545469))

(declare-fun m!545471 () Bool)

(assert (=> b!566841 m!545471))

(assert (=> b!566841 m!545471))

(declare-fun m!545473 () Bool)

(assert (=> b!566841 m!545473))

(assert (=> b!566843 m!545471))

(declare-fun m!545475 () Bool)

(assert (=> b!566843 m!545475))

(declare-fun m!545477 () Bool)

(assert (=> b!566843 m!545477))

(assert (=> b!566843 m!545471))

(declare-fun m!545479 () Bool)

(assert (=> b!566843 m!545479))

(assert (=> b!566770 d!84191))

(declare-fun b!566899 () Bool)

(declare-fun c!64988 () Bool)

(declare-fun lt!258348 () (_ BitVec 64))

(assert (=> b!566899 (= c!64988 (= lt!258348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326251 () SeekEntryResult!5534)

(declare-fun e!326250 () SeekEntryResult!5534)

(assert (=> b!566899 (= e!326251 e!326250)))

(declare-fun d!84193 () Bool)

(declare-fun lt!258349 () SeekEntryResult!5534)

(assert (=> d!84193 (and (or (is-Undefined!5534 lt!258349) (not (is-Found!5534 lt!258349)) (and (bvsge (index!24364 lt!258349) #b00000000000000000000000000000000) (bvslt (index!24364 lt!258349) (size!17449 a!3118)))) (or (is-Undefined!5534 lt!258349) (is-Found!5534 lt!258349) (not (is-MissingZero!5534 lt!258349)) (and (bvsge (index!24363 lt!258349) #b00000000000000000000000000000000) (bvslt (index!24363 lt!258349) (size!17449 a!3118)))) (or (is-Undefined!5534 lt!258349) (is-Found!5534 lt!258349) (is-MissingZero!5534 lt!258349) (not (is-MissingVacant!5534 lt!258349)) (and (bvsge (index!24366 lt!258349) #b00000000000000000000000000000000) (bvslt (index!24366 lt!258349) (size!17449 a!3118)))) (or (is-Undefined!5534 lt!258349) (ite (is-Found!5534 lt!258349) (= (select (arr!17085 a!3118) (index!24364 lt!258349)) (select (arr!17085 a!3118) j!142)) (ite (is-MissingZero!5534 lt!258349) (= (select (arr!17085 a!3118) (index!24363 lt!258349)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5534 lt!258349) (= (select (arr!17085 a!3118) (index!24366 lt!258349)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326252 () SeekEntryResult!5534)

(assert (=> d!84193 (= lt!258349 e!326252)))

(declare-fun c!64989 () Bool)

(declare-fun lt!258347 () SeekEntryResult!5534)

(assert (=> d!84193 (= c!64989 (and (is-Intermediate!5534 lt!258347) (undefined!6346 lt!258347)))))

(assert (=> d!84193 (= lt!258347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17085 a!3118) j!142) mask!3119) (select (arr!17085 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84193 (validMask!0 mask!3119)))

(assert (=> d!84193 (= (seekEntryOrOpen!0 (select (arr!17085 a!3118) j!142) a!3118 mask!3119) lt!258349)))

(declare-fun b!566900 () Bool)

(assert (=> b!566900 (= e!326250 (MissingZero!5534 (index!24365 lt!258347)))))

(declare-fun b!566901 () Bool)

(assert (=> b!566901 (= e!326251 (Found!5534 (index!24365 lt!258347)))))

(declare-fun b!566902 () Bool)

(assert (=> b!566902 (= e!326252 Undefined!5534)))

(declare-fun b!566903 () Bool)

(assert (=> b!566903 (= e!326252 e!326251)))

(assert (=> b!566903 (= lt!258348 (select (arr!17085 a!3118) (index!24365 lt!258347)))))

(declare-fun c!64990 () Bool)

(assert (=> b!566903 (= c!64990 (= lt!258348 (select (arr!17085 a!3118) j!142)))))

(declare-fun b!566904 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35575 (_ BitVec 32)) SeekEntryResult!5534)

(assert (=> b!566904 (= e!326250 (seekKeyOrZeroReturnVacant!0 (x!53233 lt!258347) (index!24365 lt!258347) (index!24365 lt!258347) (select (arr!17085 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84193 c!64989) b!566902))

(assert (= (and d!84193 (not c!64989)) b!566903))

(assert (= (and b!566903 c!64990) b!566901))

(assert (= (and b!566903 (not c!64990)) b!566899))

(assert (= (and b!566899 c!64988) b!566900))

(assert (= (and b!566899 (not c!64988)) b!566904))

(assert (=> d!84193 m!545361))

(assert (=> d!84193 m!545367))

(declare-fun m!545501 () Bool)

(assert (=> d!84193 m!545501))

(declare-fun m!545503 () Bool)

(assert (=> d!84193 m!545503))

(assert (=> d!84193 m!545379))

(declare-fun m!545505 () Bool)

(assert (=> d!84193 m!545505))

(assert (=> d!84193 m!545367))

(assert (=> d!84193 m!545361))

(declare-fun m!545507 () Bool)

(assert (=> d!84193 m!545507))

(declare-fun m!545509 () Bool)

(assert (=> b!566903 m!545509))

(assert (=> b!566904 m!545361))

(declare-fun m!545511 () Bool)

(assert (=> b!566904 m!545511))

(assert (=> b!566765 d!84193))

(declare-fun b!566905 () Bool)

(declare-fun c!64991 () Bool)

(declare-fun lt!258351 () (_ BitVec 64))

(assert (=> b!566905 (= c!64991 (= lt!258351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326254 () SeekEntryResult!5534)

(declare-fun e!326253 () SeekEntryResult!5534)

(assert (=> b!566905 (= e!326254 e!326253)))

(declare-fun d!84203 () Bool)

(declare-fun lt!258352 () SeekEntryResult!5534)

(assert (=> d!84203 (and (or (is-Undefined!5534 lt!258352) (not (is-Found!5534 lt!258352)) (and (bvsge (index!24364 lt!258352) #b00000000000000000000000000000000) (bvslt (index!24364 lt!258352) (size!17449 a!3118)))) (or (is-Undefined!5534 lt!258352) (is-Found!5534 lt!258352) (not (is-MissingZero!5534 lt!258352)) (and (bvsge (index!24363 lt!258352) #b00000000000000000000000000000000) (bvslt (index!24363 lt!258352) (size!17449 a!3118)))) (or (is-Undefined!5534 lt!258352) (is-Found!5534 lt!258352) (is-MissingZero!5534 lt!258352) (not (is-MissingVacant!5534 lt!258352)) (and (bvsge (index!24366 lt!258352) #b00000000000000000000000000000000) (bvslt (index!24366 lt!258352) (size!17449 a!3118)))) (or (is-Undefined!5534 lt!258352) (ite (is-Found!5534 lt!258352) (= (select (arr!17085 a!3118) (index!24364 lt!258352)) k!1914) (ite (is-MissingZero!5534 lt!258352) (= (select (arr!17085 a!3118) (index!24363 lt!258352)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5534 lt!258352) (= (select (arr!17085 a!3118) (index!24366 lt!258352)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326255 () SeekEntryResult!5534)

(assert (=> d!84203 (= lt!258352 e!326255)))

(declare-fun c!64992 () Bool)

(declare-fun lt!258350 () SeekEntryResult!5534)

(assert (=> d!84203 (= c!64992 (and (is-Intermediate!5534 lt!258350) (undefined!6346 lt!258350)))))

(assert (=> d!84203 (= lt!258350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84203 (validMask!0 mask!3119)))

(assert (=> d!84203 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258352)))

(declare-fun b!566906 () Bool)

(assert (=> b!566906 (= e!326253 (MissingZero!5534 (index!24365 lt!258350)))))

(declare-fun b!566907 () Bool)

(assert (=> b!566907 (= e!326254 (Found!5534 (index!24365 lt!258350)))))

(declare-fun b!566908 () Bool)

(assert (=> b!566908 (= e!326255 Undefined!5534)))

(declare-fun b!566909 () Bool)

(assert (=> b!566909 (= e!326255 e!326254)))

(assert (=> b!566909 (= lt!258351 (select (arr!17085 a!3118) (index!24365 lt!258350)))))

(declare-fun c!64993 () Bool)

(assert (=> b!566909 (= c!64993 (= lt!258351 k!1914))))

(declare-fun b!566910 () Bool)

(assert (=> b!566910 (= e!326253 (seekKeyOrZeroReturnVacant!0 (x!53233 lt!258350) (index!24365 lt!258350) (index!24365 lt!258350) k!1914 a!3118 mask!3119))))

(assert (= (and d!84203 c!64992) b!566908))

(assert (= (and d!84203 (not c!64992)) b!566909))

(assert (= (and b!566909 c!64993) b!566907))

(assert (= (and b!566909 (not c!64993)) b!566905))

(assert (= (and b!566905 c!64991) b!566906))

(assert (= (and b!566905 (not c!64991)) b!566910))

(declare-fun m!545513 () Bool)

(assert (=> d!84203 m!545513))

(declare-fun m!545515 () Bool)

(assert (=> d!84203 m!545515))

(declare-fun m!545517 () Bool)

(assert (=> d!84203 m!545517))

(assert (=> d!84203 m!545379))

(declare-fun m!545519 () Bool)

(assert (=> d!84203 m!545519))

(assert (=> d!84203 m!545513))

(declare-fun m!545521 () Bool)

(assert (=> d!84203 m!545521))

(declare-fun m!545523 () Bool)

(assert (=> b!566909 m!545523))

(declare-fun m!545525 () Bool)

(assert (=> b!566910 m!545525))

(assert (=> b!566771 d!84203))

(declare-fun d!84205 () Bool)

(assert (=> d!84205 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566766 d!84205))

(declare-fun d!84209 () Bool)

(assert (=> d!84209 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51824 d!84209))

(declare-fun d!84213 () Bool)

(assert (=> d!84213 (= (array_inv!12881 a!3118) (bvsge (size!17449 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51824 d!84213))

(declare-fun d!84215 () Bool)

(declare-fun res!357634 () Bool)

(declare-fun e!326279 () Bool)

(assert (=> d!84215 (=> res!357634 e!326279)))

(assert (=> d!84215 (= res!357634 (= (select (arr!17085 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84215 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326279)))

(declare-fun b!566944 () Bool)

(declare-fun e!326280 () Bool)

(assert (=> b!566944 (= e!326279 e!326280)))

(declare-fun res!357635 () Bool)

(assert (=> b!566944 (=> (not res!357635) (not e!326280))))

(assert (=> b!566944 (= res!357635 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17449 a!3118)))))

(declare-fun b!566945 () Bool)

(assert (=> b!566945 (= e!326280 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84215 (not res!357634)) b!566944))

(assert (= (and b!566944 res!357635) b!566945))

(assert (=> d!84215 m!545471))

(declare-fun m!545541 () Bool)

(assert (=> b!566945 m!545541))

(assert (=> b!566762 d!84215))

(declare-fun d!84217 () Bool)

(declare-fun e!326318 () Bool)

(assert (=> d!84217 e!326318))

(declare-fun c!65020 () Bool)

(declare-fun lt!258382 () SeekEntryResult!5534)

(assert (=> d!84217 (= c!65020 (and (is-Intermediate!5534 lt!258382) (undefined!6346 lt!258382)))))

(declare-fun e!326316 () SeekEntryResult!5534)

(assert (=> d!84217 (= lt!258382 e!326316)))

(declare-fun c!65021 () Bool)

(assert (=> d!84217 (= c!65021 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258383 () (_ BitVec 64))

(assert (=> d!84217 (= lt!258383 (select (arr!17085 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118))) lt!258290))))

(assert (=> d!84217 (validMask!0 mask!3119)))

(assert (=> d!84217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258290 (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118)) mask!3119) lt!258382)))

(declare-fun b!567000 () Bool)

(declare-fun e!326319 () SeekEntryResult!5534)

(assert (=> b!567000 (= e!326316 e!326319)))

(declare-fun c!65019 () Bool)

(assert (=> b!567000 (= c!65019 (or (= lt!258383 (select (store (arr!17085 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!258383 lt!258383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567001 () Bool)

(assert (=> b!567001 (and (bvsge (index!24365 lt!258382) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258382) (size!17449 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118)))))))

(declare-fun e!326317 () Bool)

(assert (=> b!567001 (= e!326317 (= (select (arr!17085 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118))) (index!24365 lt!258382)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567002 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567002 (= e!326319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258290 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118)) mask!3119))))

(declare-fun b!567003 () Bool)

(assert (=> b!567003 (and (bvsge (index!24365 lt!258382) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258382) (size!17449 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118)))))))

(declare-fun res!357661 () Bool)

(assert (=> b!567003 (= res!357661 (= (select (arr!17085 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118))) (index!24365 lt!258382)) (select (store (arr!17085 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!567003 (=> res!357661 e!326317)))

(declare-fun e!326320 () Bool)

(assert (=> b!567003 (= e!326320 e!326317)))

(declare-fun b!567004 () Bool)

(assert (=> b!567004 (= e!326319 (Intermediate!5534 false lt!258290 #b00000000000000000000000000000000))))

(declare-fun b!567005 () Bool)

(assert (=> b!567005 (and (bvsge (index!24365 lt!258382) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258382) (size!17449 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118)))))))

(declare-fun res!357660 () Bool)

(assert (=> b!567005 (= res!357660 (= (select (arr!17085 (array!35576 (store (arr!17085 a!3118) i!1132 k!1914) (size!17449 a!3118))) (index!24365 lt!258382)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567005 (=> res!357660 e!326317)))

(declare-fun b!567006 () Bool)

(assert (=> b!567006 (= e!326318 (bvsge (x!53233 lt!258382) #b01111111111111111111111111111110))))

(declare-fun b!567007 () Bool)

(assert (=> b!567007 (= e!326318 e!326320)))

(declare-fun res!357662 () Bool)

(assert (=> b!567007 (= res!357662 (and (is-Intermediate!5534 lt!258382) (not (undefined!6346 lt!258382)) (bvslt (x!53233 lt!258382) #b01111111111111111111111111111110) (bvsge (x!53233 lt!258382) #b00000000000000000000000000000000) (bvsge (x!53233 lt!258382) #b00000000000000000000000000000000)))))

(assert (=> b!567007 (=> (not res!357662) (not e!326320))))

(declare-fun b!567008 () Bool)

(assert (=> b!567008 (= e!326316 (Intermediate!5534 true lt!258290 #b00000000000000000000000000000000))))

(assert (= (and d!84217 c!65021) b!567008))

(assert (= (and d!84217 (not c!65021)) b!567000))

(assert (= (and b!567000 c!65019) b!567004))

(assert (= (and b!567000 (not c!65019)) b!567002))

(assert (= (and d!84217 c!65020) b!567006))

(assert (= (and d!84217 (not c!65020)) b!567007))

(assert (= (and b!567007 res!357662) b!567003))

(assert (= (and b!567003 (not res!357661)) b!567005))

(assert (= (and b!567005 (not res!357660)) b!567001))

(declare-fun m!545563 () Bool)

(assert (=> d!84217 m!545563))

(assert (=> d!84217 m!545379))

(declare-fun m!545565 () Bool)

(assert (=> b!567003 m!545565))

(declare-fun m!545567 () Bool)

(assert (=> b!567002 m!545567))

(assert (=> b!567002 m!545567))

(assert (=> b!567002 m!545369))

(declare-fun m!545569 () Bool)

(assert (=> b!567002 m!545569))

(assert (=> b!567001 m!545565))

(assert (=> b!567005 m!545565))

(assert (=> b!566768 d!84217))

(declare-fun d!84235 () Bool)

(declare-fun e!326329 () Bool)

(assert (=> d!84235 e!326329))

(declare-fun c!65025 () Bool)

(declare-fun lt!258390 () SeekEntryResult!5534)

(assert (=> d!84235 (= c!65025 (and (is-Intermediate!5534 lt!258390) (undefined!6346 lt!258390)))))

(declare-fun e!326327 () SeekEntryResult!5534)

(assert (=> d!84235 (= lt!258390 e!326327)))

(declare-fun c!65026 () Bool)

(assert (=> d!84235 (= c!65026 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258391 () (_ BitVec 64))

(assert (=> d!84235 (= lt!258391 (select (arr!17085 a!3118) lt!258291))))

(assert (=> d!84235 (validMask!0 mask!3119)))

(assert (=> d!84235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258291 (select (arr!17085 a!3118) j!142) a!3118 mask!3119) lt!258390)))

(declare-fun b!567017 () Bool)

(declare-fun e!326330 () SeekEntryResult!5534)

(assert (=> b!567017 (= e!326327 e!326330)))

(declare-fun c!65024 () Bool)

(assert (=> b!567017 (= c!65024 (or (= lt!258391 (select (arr!17085 a!3118) j!142)) (= (bvadd lt!258391 lt!258391) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567018 () Bool)

(assert (=> b!567018 (and (bvsge (index!24365 lt!258390) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258390) (size!17449 a!3118)))))

(declare-fun e!326328 () Bool)

(assert (=> b!567018 (= e!326328 (= (select (arr!17085 a!3118) (index!24365 lt!258390)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567019 () Bool)

(assert (=> b!567019 (= e!326330 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258291 #b00000000000000000000000000000000 mask!3119) (select (arr!17085 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567020 () Bool)

(assert (=> b!567020 (and (bvsge (index!24365 lt!258390) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258390) (size!17449 a!3118)))))

(declare-fun res!357668 () Bool)

(assert (=> b!567020 (= res!357668 (= (select (arr!17085 a!3118) (index!24365 lt!258390)) (select (arr!17085 a!3118) j!142)))))

(assert (=> b!567020 (=> res!357668 e!326328)))

(declare-fun e!326331 () Bool)

(assert (=> b!567020 (= e!326331 e!326328)))

(declare-fun b!567021 () Bool)

(assert (=> b!567021 (= e!326330 (Intermediate!5534 false lt!258291 #b00000000000000000000000000000000))))

(declare-fun b!567022 () Bool)

(assert (=> b!567022 (and (bvsge (index!24365 lt!258390) #b00000000000000000000000000000000) (bvslt (index!24365 lt!258390) (size!17449 a!3118)))))

(declare-fun res!357667 () Bool)

(assert (=> b!567022 (= res!357667 (= (select (arr!17085 a!3118) (index!24365 lt!258390)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567022 (=> res!357667 e!326328)))

(declare-fun b!567023 () Bool)

(assert (=> b!567023 (= e!326329 (bvsge (x!53233 lt!258390) #b01111111111111111111111111111110))))

(declare-fun b!567024 () Bool)

(assert (=> b!567024 (= e!326329 e!326331)))

(declare-fun res!357669 () Bool)

(assert (=> b!567024 (= res!357669 (and (is-Intermediate!5534 lt!258390) (not (undefined!6346 lt!258390)) (bvslt (x!53233 lt!258390) #b01111111111111111111111111111110) (bvsge (x!53233 lt!258390) #b00000000000000000000000000000000) (bvsge (x!53233 lt!258390) #b00000000000000000000000000000000)))))

(assert (=> b!567024 (=> (not res!357669) (not e!326331))))

(declare-fun b!567025 () Bool)

(assert (=> b!567025 (= e!326327 (Intermediate!5534 true lt!258291 #b00000000000000000000000000000000))))

(assert (= (and d!84235 c!65026) b!567025))

(assert (= (and d!84235 (not c!65026)) b!567017))

(assert (= (and b!567017 c!65024) b!567021))

(assert (= (and b!567017 (not c!65024)) b!567019))

(assert (= (and d!84235 c!65025) b!567023))

(assert (= (and d!84235 (not c!65025)) b!567024))

(assert (= (and b!567024 res!357669) b!567020))

(assert (= (and b!567020 (not res!357668)) b!567022))

(assert (= (and b!567022 (not res!357667)) b!567018))

(declare-fun m!545571 () Bool)

(assert (=> d!84235 m!545571))

(assert (=> d!84235 m!545379))

(declare-fun m!545573 () Bool)

(assert (=> b!567020 m!545573))

(declare-fun m!545575 () Bool)

(assert (=> b!567019 m!545575))

(assert (=> b!567019 m!545575))

(assert (=> b!567019 m!545361))

(declare-fun m!545577 () Bool)

(assert (=> b!567019 m!545577))

(assert (=> b!567018 m!545573))

(assert (=> b!567022 m!545573))

(assert (=> b!566768 d!84235))

(declare-fun d!84237 () Bool)

(declare-fun lt!258404 () (_ BitVec 32))

(declare-fun lt!258403 () (_ BitVec 32))

(assert (=> d!84237 (= lt!258404 (bvmul (bvxor lt!258403 (bvlshr lt!258403 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84237 (= lt!258403 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84237 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357670 (let ((h!12173 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53238 (bvmul (bvxor h!12173 (bvlshr h!12173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53238 (bvlshr x!53238 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357670 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357670 #b00000000000000000000000000000000))))))

(assert (=> d!84237 (= (toIndex!0 (select (store (arr!17085 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!258404 (bvlshr lt!258404 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566768 d!84237))

(declare-fun d!84245 () Bool)

(declare-fun lt!258406 () (_ BitVec 32))

(declare-fun lt!258405 () (_ BitVec 32))

(assert (=> d!84245 (= lt!258406 (bvmul (bvxor lt!258405 (bvlshr lt!258405 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84245 (= lt!258405 ((_ extract 31 0) (bvand (bvxor (select (arr!17085 a!3118) j!142) (bvlshr (select (arr!17085 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84245 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357670 (let ((h!12173 ((_ extract 31 0) (bvand (bvxor (select (arr!17085 a!3118) j!142) (bvlshr (select (arr!17085 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53238 (bvmul (bvxor h!12173 (bvlshr h!12173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53238 (bvlshr x!53238 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357670 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357670 #b00000000000000000000000000000000))))))

(assert (=> d!84245 (= (toIndex!0 (select (arr!17085 a!3118) j!142) mask!3119) (bvand (bvxor lt!258406 (bvlshr lt!258406 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566768 d!84245))

(declare-fun d!84247 () Bool)

(declare-fun res!357680 () Bool)

(declare-fun e!326346 () Bool)

(assert (=> d!84247 (=> res!357680 e!326346)))

(assert (=> d!84247 (= res!357680 (bvsge j!142 (size!17449 a!3118)))))

(assert (=> d!84247 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326346)))

(declare-fun b!567048 () Bool)

(declare-fun e!326347 () Bool)

(declare-fun call!32514 () Bool)

(assert (=> b!567048 (= e!326347 call!32514)))

(declare-fun bm!32511 () Bool)

(assert (=> bm!32511 (= call!32514 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567049 () Bool)

(declare-fun e!326345 () Bool)

(assert (=> b!567049 (= e!326346 e!326345)))

(declare-fun c!65034 () Bool)

(assert (=> b!567049 (= c!65034 (validKeyInArray!0 (select (arr!17085 a!3118) j!142)))))

(declare-fun b!567050 () Bool)

(assert (=> b!567050 (= e!326345 call!32514)))

(declare-fun b!567051 () Bool)

(assert (=> b!567051 (= e!326345 e!326347)))

(declare-fun lt!258407 () (_ BitVec 64))

(assert (=> b!567051 (= lt!258407 (select (arr!17085 a!3118) j!142))))

(declare-fun lt!258408 () Unit!17770)

(assert (=> b!567051 (= lt!258408 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258407 j!142))))

(assert (=> b!567051 (arrayContainsKey!0 a!3118 lt!258407 #b00000000000000000000000000000000)))

(declare-fun lt!258409 () Unit!17770)

(assert (=> b!567051 (= lt!258409 lt!258408)))

(declare-fun res!357681 () Bool)

(assert (=> b!567051 (= res!357681 (= (seekEntryOrOpen!0 (select (arr!17085 a!3118) j!142) a!3118 mask!3119) (Found!5534 j!142)))))

(assert (=> b!567051 (=> (not res!357681) (not e!326347))))

(assert (= (and d!84247 (not res!357680)) b!567049))

(assert (= (and b!567049 c!65034) b!567051))

(assert (= (and b!567049 (not c!65034)) b!567050))

(assert (= (and b!567051 res!357681) b!567048))

(assert (= (or b!567048 b!567050) bm!32511))

(declare-fun m!545601 () Bool)

(assert (=> bm!32511 m!545601))

(assert (=> b!567049 m!545361))

(assert (=> b!567049 m!545361))

(assert (=> b!567049 m!545395))

(assert (=> b!567051 m!545361))

(declare-fun m!545603 () Bool)

(assert (=> b!567051 m!545603))

(declare-fun m!545605 () Bool)

(assert (=> b!567051 m!545605))

(assert (=> b!567051 m!545361))

(assert (=> b!567051 m!545363))

(assert (=> b!566763 d!84247))

(declare-fun d!84249 () Bool)

(assert (=> d!84249 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258429 () Unit!17770)

(declare-fun choose!38 (array!35575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17770)

(assert (=> d!84249 (= lt!258429 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84249 (validMask!0 mask!3119)))

(assert (=> d!84249 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258429)))

(declare-fun bs!17604 () Bool)

(assert (= bs!17604 d!84249))

(assert (=> bs!17604 m!545389))

(declare-fun m!545631 () Bool)

(assert (=> bs!17604 m!545631))

(assert (=> bs!17604 m!545379))

(assert (=> b!566763 d!84249))

(declare-fun d!84261 () Bool)

(assert (=> d!84261 (= (validKeyInArray!0 (select (arr!17085 a!3118) j!142)) (and (not (= (select (arr!17085 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17085 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566769 d!84261))

(declare-fun b!567072 () Bool)

(declare-fun e!326364 () Bool)

(declare-fun e!326365 () Bool)

(assert (=> b!567072 (= e!326364 e!326365)))

(declare-fun res!357690 () Bool)

(assert (=> b!567072 (=> (not res!357690) (not e!326365))))

(declare-fun e!326363 () Bool)

(assert (=> b!567072 (= res!357690 (not e!326363))))

(declare-fun res!357692 () Bool)

(assert (=> b!567072 (=> (not res!357692) (not e!326363))))

(assert (=> b!567072 (= res!357692 (validKeyInArray!0 (select (arr!17085 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567073 () Bool)

(declare-fun e!326362 () Bool)

(declare-fun call!32518 () Bool)

(assert (=> b!567073 (= e!326362 call!32518)))

(declare-fun d!84263 () Bool)

(declare-fun res!357691 () Bool)

(assert (=> d!84263 (=> res!357691 e!326364)))

(assert (=> d!84263 (= res!357691 (bvsge #b00000000000000000000000000000000 (size!17449 a!3118)))))

(assert (=> d!84263 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11162) e!326364)))

(declare-fun b!567074 () Bool)

(assert (=> b!567074 (= e!326365 e!326362)))

(declare-fun c!65041 () Bool)

(assert (=> b!567074 (= c!65041 (validKeyInArray!0 (select (arr!17085 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567075 () Bool)

(declare-fun contains!2870 (List!11165 (_ BitVec 64)) Bool)

(assert (=> b!567075 (= e!326363 (contains!2870 Nil!11162 (select (arr!17085 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567076 () Bool)

(assert (=> b!567076 (= e!326362 call!32518)))

(declare-fun bm!32515 () Bool)

(assert (=> bm!32515 (= call!32518 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65041 (Cons!11161 (select (arr!17085 a!3118) #b00000000000000000000000000000000) Nil!11162) Nil!11162)))))

(assert (= (and d!84263 (not res!357691)) b!567072))

(assert (= (and b!567072 res!357692) b!567075))

(assert (= (and b!567072 res!357690) b!567074))

(assert (= (and b!567074 c!65041) b!567073))

(assert (= (and b!567074 (not c!65041)) b!567076))

(assert (= (or b!567073 b!567076) bm!32515))

(assert (=> b!567072 m!545471))

(assert (=> b!567072 m!545471))

(assert (=> b!567072 m!545473))

(assert (=> b!567074 m!545471))

(assert (=> b!567074 m!545471))

(assert (=> b!567074 m!545473))

(assert (=> b!567075 m!545471))

(assert (=> b!567075 m!545471))

(declare-fun m!545633 () Bool)

(assert (=> b!567075 m!545633))

(assert (=> bm!32515 m!545471))

(declare-fun m!545635 () Bool)

(assert (=> bm!32515 m!545635))

(assert (=> b!566764 d!84263))

(push 1)

(assert (not b!567019))

(assert (not b!566841))

(assert (not bm!32515))

(assert (not b!566843))

(assert (not d!84217))

(assert (not b!567002))

(assert (not d!84203))

(assert (not bm!32498))

(assert (not d!84249))

(assert (not b!567075))

(assert (not b!566904))

(assert (not d!84235))

(assert (not b!567049))

(assert (not b!566945))

(assert (not b!567051))

(assert (not b!567072))

(assert (not b!567074))

(assert (not d!84193))

(assert (not bm!32511))

(assert (not b!566910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

