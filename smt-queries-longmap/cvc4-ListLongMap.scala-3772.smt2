; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51630 () Bool)

(assert start!51630)

(declare-fun b!565053 () Bool)

(declare-fun res!356208 () Bool)

(declare-fun e!325338 () Bool)

(assert (=> b!565053 (=> (not res!356208) (not e!325338))))

(declare-datatypes ((array!35495 0))(
  ( (array!35496 (arr!17048 (Array (_ BitVec 32) (_ BitVec 64))) (size!17412 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35495)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35495 (_ BitVec 32)) Bool)

(assert (=> b!565053 (= res!356208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565054 () Bool)

(declare-fun e!325337 () Bool)

(assert (=> b!565054 (= e!325337 e!325338)))

(declare-fun res!356206 () Bool)

(assert (=> b!565054 (=> (not res!356206) (not e!325338))))

(declare-datatypes ((SeekEntryResult!5497 0))(
  ( (MissingZero!5497 (index!24215 (_ BitVec 32))) (Found!5497 (index!24216 (_ BitVec 32))) (Intermediate!5497 (undefined!6309 Bool) (index!24217 (_ BitVec 32)) (x!53080 (_ BitVec 32))) (Undefined!5497) (MissingVacant!5497 (index!24218 (_ BitVec 32))) )
))
(declare-fun lt!257739 () SeekEntryResult!5497)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565054 (= res!356206 (or (= lt!257739 (MissingZero!5497 i!1132)) (= lt!257739 (MissingVacant!5497 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35495 (_ BitVec 32)) SeekEntryResult!5497)

(assert (=> b!565054 (= lt!257739 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565055 () Bool)

(declare-fun res!356213 () Bool)

(assert (=> b!565055 (=> (not res!356213) (not e!325338))))

(declare-datatypes ((List!11128 0))(
  ( (Nil!11125) (Cons!11124 (h!12127 (_ BitVec 64)) (t!17356 List!11128)) )
))
(declare-fun arrayNoDuplicates!0 (array!35495 (_ BitVec 32) List!11128) Bool)

(assert (=> b!565055 (= res!356213 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11125))))

(declare-fun res!356212 () Bool)

(assert (=> start!51630 (=> (not res!356212) (not e!325337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51630 (= res!356212 (validMask!0 mask!3119))))

(assert (=> start!51630 e!325337))

(assert (=> start!51630 true))

(declare-fun array_inv!12844 (array!35495) Bool)

(assert (=> start!51630 (array_inv!12844 a!3118)))

(declare-fun b!565056 () Bool)

(declare-fun res!356211 () Bool)

(assert (=> b!565056 (=> (not res!356211) (not e!325337))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565056 (= res!356211 (and (= (size!17412 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17412 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17412 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565057 () Bool)

(assert (=> b!565057 (= e!325338 (not (= (seekEntryOrOpen!0 (select (arr!17048 a!3118) j!142) a!3118 mask!3119) (Found!5497 j!142))))))

(assert (=> b!565057 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17696 0))(
  ( (Unit!17697) )
))
(declare-fun lt!257740 () Unit!17696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17696)

(assert (=> b!565057 (= lt!257740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565058 () Bool)

(declare-fun res!356207 () Bool)

(assert (=> b!565058 (=> (not res!356207) (not e!325337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565058 (= res!356207 (validKeyInArray!0 (select (arr!17048 a!3118) j!142)))))

(declare-fun b!565059 () Bool)

(declare-fun res!356209 () Bool)

(assert (=> b!565059 (=> (not res!356209) (not e!325338))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35495 (_ BitVec 32)) SeekEntryResult!5497)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565059 (= res!356209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) (select (arr!17048 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118)) mask!3119)))))

(declare-fun b!565060 () Bool)

(declare-fun res!356205 () Bool)

(assert (=> b!565060 (=> (not res!356205) (not e!325337))))

(declare-fun arrayContainsKey!0 (array!35495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565060 (= res!356205 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565061 () Bool)

(declare-fun res!356210 () Bool)

(assert (=> b!565061 (=> (not res!356210) (not e!325337))))

(assert (=> b!565061 (= res!356210 (validKeyInArray!0 k!1914))))

(assert (= (and start!51630 res!356212) b!565056))

(assert (= (and b!565056 res!356211) b!565058))

(assert (= (and b!565058 res!356207) b!565061))

(assert (= (and b!565061 res!356210) b!565060))

(assert (= (and b!565060 res!356205) b!565054))

(assert (= (and b!565054 res!356206) b!565053))

(assert (= (and b!565053 res!356208) b!565055))

(assert (= (and b!565055 res!356213) b!565059))

(assert (= (and b!565059 res!356209) b!565057))

(declare-fun m!543585 () Bool)

(assert (=> start!51630 m!543585))

(declare-fun m!543587 () Bool)

(assert (=> start!51630 m!543587))

(declare-fun m!543589 () Bool)

(assert (=> b!565057 m!543589))

(assert (=> b!565057 m!543589))

(declare-fun m!543591 () Bool)

(assert (=> b!565057 m!543591))

(declare-fun m!543593 () Bool)

(assert (=> b!565057 m!543593))

(declare-fun m!543595 () Bool)

(assert (=> b!565057 m!543595))

(declare-fun m!543597 () Bool)

(assert (=> b!565054 m!543597))

(declare-fun m!543599 () Bool)

(assert (=> b!565053 m!543599))

(assert (=> b!565058 m!543589))

(assert (=> b!565058 m!543589))

(declare-fun m!543601 () Bool)

(assert (=> b!565058 m!543601))

(declare-fun m!543603 () Bool)

(assert (=> b!565060 m!543603))

(assert (=> b!565059 m!543589))

(declare-fun m!543605 () Bool)

(assert (=> b!565059 m!543605))

(assert (=> b!565059 m!543589))

(declare-fun m!543607 () Bool)

(assert (=> b!565059 m!543607))

(declare-fun m!543609 () Bool)

(assert (=> b!565059 m!543609))

(assert (=> b!565059 m!543607))

(declare-fun m!543611 () Bool)

(assert (=> b!565059 m!543611))

(assert (=> b!565059 m!543605))

(assert (=> b!565059 m!543589))

(declare-fun m!543613 () Bool)

(assert (=> b!565059 m!543613))

(declare-fun m!543615 () Bool)

(assert (=> b!565059 m!543615))

(assert (=> b!565059 m!543607))

(assert (=> b!565059 m!543609))

(declare-fun m!543617 () Bool)

(assert (=> b!565061 m!543617))

(declare-fun m!543619 () Bool)

(assert (=> b!565055 m!543619))

(push 1)

(assert (not start!51630))

(assert (not b!565059))

(assert (not b!565057))

(assert (not b!565055))

(assert (not b!565058))

(assert (not b!565060))

(assert (not b!565054))

(assert (not b!565053))

(assert (not b!565061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83979 () Bool)

(declare-fun res!356219 () Bool)

(declare-fun e!325355 () Bool)

(assert (=> d!83979 (=> res!356219 e!325355)))

(assert (=> d!83979 (= res!356219 (bvsge #b00000000000000000000000000000000 (size!17412 a!3118)))))

(assert (=> d!83979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325355)))

(declare-fun b!565088 () Bool)

(declare-fun e!325354 () Bool)

(assert (=> b!565088 (= e!325355 e!325354)))

(declare-fun c!64781 () Bool)

(assert (=> b!565088 (= c!64781 (validKeyInArray!0 (select (arr!17048 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32456 () Bool)

(declare-fun call!32459 () Bool)

(assert (=> bm!32456 (= call!32459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!565089 () Bool)

(declare-fun e!325356 () Bool)

(assert (=> b!565089 (= e!325356 call!32459)))

(declare-fun b!565090 () Bool)

(assert (=> b!565090 (= e!325354 call!32459)))

(declare-fun b!565091 () Bool)

(assert (=> b!565091 (= e!325354 e!325356)))

(declare-fun lt!257758 () (_ BitVec 64))

(assert (=> b!565091 (= lt!257758 (select (arr!17048 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!257756 () Unit!17696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35495 (_ BitVec 64) (_ BitVec 32)) Unit!17696)

(assert (=> b!565091 (= lt!257756 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257758 #b00000000000000000000000000000000))))

(assert (=> b!565091 (arrayContainsKey!0 a!3118 lt!257758 #b00000000000000000000000000000000)))

(declare-fun lt!257757 () Unit!17696)

(assert (=> b!565091 (= lt!257757 lt!257756)))

(declare-fun res!356218 () Bool)

(assert (=> b!565091 (= res!356218 (= (seekEntryOrOpen!0 (select (arr!17048 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5497 #b00000000000000000000000000000000)))))

(assert (=> b!565091 (=> (not res!356218) (not e!325356))))

(assert (= (and d!83979 (not res!356219)) b!565088))

(assert (= (and b!565088 c!64781) b!565091))

(assert (= (and b!565088 (not c!64781)) b!565090))

(assert (= (and b!565091 res!356218) b!565089))

(assert (= (or b!565089 b!565090) bm!32456))

(declare-fun m!543635 () Bool)

(assert (=> b!565088 m!543635))

(assert (=> b!565088 m!543635))

(declare-fun m!543637 () Bool)

(assert (=> b!565088 m!543637))

(declare-fun m!543639 () Bool)

(assert (=> bm!32456 m!543639))

(assert (=> b!565091 m!543635))

(declare-fun m!543641 () Bool)

(assert (=> b!565091 m!543641))

(declare-fun m!543643 () Bool)

(assert (=> b!565091 m!543643))

(assert (=> b!565091 m!543635))

(declare-fun m!543645 () Bool)

(assert (=> b!565091 m!543645))

(assert (=> b!565053 d!83979))

(declare-fun d!83985 () Bool)

(assert (=> d!83985 (= (validKeyInArray!0 (select (arr!17048 a!3118) j!142)) (and (not (= (select (arr!17048 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17048 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565058 d!83985))

(declare-fun b!565154 () Bool)

(declare-fun lt!257791 () SeekEntryResult!5497)

(assert (=> b!565154 (and (bvsge (index!24217 lt!257791) #b00000000000000000000000000000000) (bvslt (index!24217 lt!257791) (size!17412 a!3118)))))

(declare-fun e!325395 () Bool)

(assert (=> b!565154 (= e!325395 (= (select (arr!17048 a!3118) (index!24217 lt!257791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!565155 () Bool)

(assert (=> b!565155 (and (bvsge (index!24217 lt!257791) #b00000000000000000000000000000000) (bvslt (index!24217 lt!257791) (size!17412 a!3118)))))

(declare-fun res!356237 () Bool)

(assert (=> b!565155 (= res!356237 (= (select (arr!17048 a!3118) (index!24217 lt!257791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565155 (=> res!356237 e!325395)))

(declare-fun d!83987 () Bool)

(declare-fun e!325397 () Bool)

(assert (=> d!83987 e!325397))

(declare-fun c!64807 () Bool)

(assert (=> d!83987 (= c!64807 (and (is-Intermediate!5497 lt!257791) (undefined!6309 lt!257791)))))

(declare-fun e!325398 () SeekEntryResult!5497)

(assert (=> d!83987 (= lt!257791 e!325398)))

(declare-fun c!64805 () Bool)

(assert (=> d!83987 (= c!64805 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257790 () (_ BitVec 64))

(assert (=> d!83987 (= lt!257790 (select (arr!17048 a!3118) (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119)))))

(assert (=> d!83987 (validMask!0 mask!3119)))

(assert (=> d!83987 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) (select (arr!17048 a!3118) j!142) a!3118 mask!3119) lt!257791)))

(declare-fun b!565156 () Bool)

(declare-fun e!325394 () SeekEntryResult!5497)

(assert (=> b!565156 (= e!325398 e!325394)))

(declare-fun c!64806 () Bool)

(assert (=> b!565156 (= c!64806 (or (= lt!257790 (select (arr!17048 a!3118) j!142)) (= (bvadd lt!257790 lt!257790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565157 () Bool)

(assert (=> b!565157 (= e!325397 (bvsge (x!53080 lt!257791) #b01111111111111111111111111111110))))

(declare-fun b!565158 () Bool)

(assert (=> b!565158 (= e!325398 (Intermediate!5497 true (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565159 () Bool)

(declare-fun e!325396 () Bool)

(assert (=> b!565159 (= e!325397 e!325396)))

(declare-fun res!356238 () Bool)

(assert (=> b!565159 (= res!356238 (and (is-Intermediate!5497 lt!257791) (not (undefined!6309 lt!257791)) (bvslt (x!53080 lt!257791) #b01111111111111111111111111111110) (bvsge (x!53080 lt!257791) #b00000000000000000000000000000000) (bvsge (x!53080 lt!257791) #b00000000000000000000000000000000)))))

(assert (=> b!565159 (=> (not res!356238) (not e!325396))))

(declare-fun b!565160 () Bool)

(assert (=> b!565160 (and (bvsge (index!24217 lt!257791) #b00000000000000000000000000000000) (bvslt (index!24217 lt!257791) (size!17412 a!3118)))))

(declare-fun res!356236 () Bool)

(assert (=> b!565160 (= res!356236 (= (select (arr!17048 a!3118) (index!24217 lt!257791)) (select (arr!17048 a!3118) j!142)))))

(assert (=> b!565160 (=> res!356236 e!325395)))

(assert (=> b!565160 (= e!325396 e!325395)))

(declare-fun b!565161 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565161 (= e!325394 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!17048 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565162 () Bool)

(assert (=> b!565162 (= e!325394 (Intermediate!5497 false (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(assert (= (and d!83987 c!64805) b!565158))

(assert (= (and d!83987 (not c!64805)) b!565156))

(assert (= (and b!565156 c!64806) b!565162))

(assert (= (and b!565156 (not c!64806)) b!565161))

(assert (= (and d!83987 c!64807) b!565157))

(assert (= (and d!83987 (not c!64807)) b!565159))

(assert (= (and b!565159 res!356238) b!565160))

(assert (= (and b!565160 (not res!356236)) b!565155))

(assert (= (and b!565155 (not res!356237)) b!565154))

(declare-fun m!543683 () Bool)

(assert (=> b!565155 m!543683))

(assert (=> b!565161 m!543605))

(declare-fun m!543685 () Bool)

(assert (=> b!565161 m!543685))

(assert (=> b!565161 m!543685))

(assert (=> b!565161 m!543589))

(declare-fun m!543687 () Bool)

(assert (=> b!565161 m!543687))

(assert (=> d!83987 m!543605))

(declare-fun m!543689 () Bool)

(assert (=> d!83987 m!543689))

(assert (=> d!83987 m!543585))

(assert (=> b!565154 m!543683))

(assert (=> b!565160 m!543683))

(assert (=> b!565059 d!83987))

(declare-fun d!84001 () Bool)

(declare-fun lt!257800 () (_ BitVec 32))

(declare-fun lt!257799 () (_ BitVec 32))

(assert (=> d!84001 (= lt!257800 (bvmul (bvxor lt!257799 (bvlshr lt!257799 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84001 (= lt!257799 ((_ extract 31 0) (bvand (bvxor (select (arr!17048 a!3118) j!142) (bvlshr (select (arr!17048 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84001 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356239 (let ((h!12128 ((_ extract 31 0) (bvand (bvxor (select (arr!17048 a!3118) j!142) (bvlshr (select (arr!17048 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53082 (bvmul (bvxor h!12128 (bvlshr h!12128 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53082 (bvlshr x!53082 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356239 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356239 #b00000000000000000000000000000000))))))

(assert (=> d!84001 (= (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) (bvand (bvxor lt!257800 (bvlshr lt!257800 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565059 d!84001))

(declare-fun lt!257802 () SeekEntryResult!5497)

(declare-fun b!565182 () Bool)

(assert (=> b!565182 (and (bvsge (index!24217 lt!257802) #b00000000000000000000000000000000) (bvslt (index!24217 lt!257802) (size!17412 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118)))))))

(declare-fun e!325415 () Bool)

(assert (=> b!565182 (= e!325415 (= (select (arr!17048 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118))) (index!24217 lt!257802)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!565183 () Bool)

(assert (=> b!565183 (and (bvsge (index!24217 lt!257802) #b00000000000000000000000000000000) (bvslt (index!24217 lt!257802) (size!17412 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118)))))))

(declare-fun res!356252 () Bool)

(assert (=> b!565183 (= res!356252 (= (select (arr!17048 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118))) (index!24217 lt!257802)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565183 (=> res!356252 e!325415)))

(declare-fun d!84005 () Bool)

(declare-fun e!325417 () Bool)

(assert (=> d!84005 e!325417))

(declare-fun c!64814 () Bool)

(assert (=> d!84005 (= c!64814 (and (is-Intermediate!5497 lt!257802) (undefined!6309 lt!257802)))))

(declare-fun e!325418 () SeekEntryResult!5497)

(assert (=> d!84005 (= lt!257802 e!325418)))

(declare-fun c!64812 () Bool)

(assert (=> d!84005 (= c!64812 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257801 () (_ BitVec 64))

(assert (=> d!84005 (= lt!257801 (select (arr!17048 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118))) (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119)))))

(assert (=> d!84005 (validMask!0 mask!3119)))

(assert (=> d!84005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118)) mask!3119) lt!257802)))

(declare-fun b!565184 () Bool)

(declare-fun e!325414 () SeekEntryResult!5497)

(assert (=> b!565184 (= e!325418 e!325414)))

(declare-fun c!64813 () Bool)

(assert (=> b!565184 (= c!64813 (or (= lt!257801 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!257801 lt!257801) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565185 () Bool)

(assert (=> b!565185 (= e!325417 (bvsge (x!53080 lt!257802) #b01111111111111111111111111111110))))

(declare-fun b!565186 () Bool)

(assert (=> b!565186 (= e!325418 (Intermediate!5497 true (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565187 () Bool)

(declare-fun e!325416 () Bool)

(assert (=> b!565187 (= e!325417 e!325416)))

(declare-fun res!356253 () Bool)

(assert (=> b!565187 (= res!356253 (and (is-Intermediate!5497 lt!257802) (not (undefined!6309 lt!257802)) (bvslt (x!53080 lt!257802) #b01111111111111111111111111111110) (bvsge (x!53080 lt!257802) #b00000000000000000000000000000000) (bvsge (x!53080 lt!257802) #b00000000000000000000000000000000)))))

(assert (=> b!565187 (=> (not res!356253) (not e!325416))))

(declare-fun b!565188 () Bool)

(assert (=> b!565188 (and (bvsge (index!24217 lt!257802) #b00000000000000000000000000000000) (bvslt (index!24217 lt!257802) (size!17412 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118)))))))

(declare-fun res!356251 () Bool)

(assert (=> b!565188 (= res!356251 (= (select (arr!17048 (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118))) (index!24217 lt!257802)) (select (store (arr!17048 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!565188 (=> res!356251 e!325415)))

(assert (=> b!565188 (= e!325416 e!325415)))

(declare-fun b!565189 () Bool)

(assert (=> b!565189 (= e!325414 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) (array!35496 (store (arr!17048 a!3118) i!1132 k!1914) (size!17412 a!3118)) mask!3119))))

(declare-fun b!565190 () Bool)

(assert (=> b!565190 (= e!325414 (Intermediate!5497 false (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(assert (= (and d!84005 c!64812) b!565186))

(assert (= (and d!84005 (not c!64812)) b!565184))

(assert (= (and b!565184 c!64813) b!565190))

(assert (= (and b!565184 (not c!64813)) b!565189))

(assert (= (and d!84005 c!64814) b!565185))

(assert (= (and d!84005 (not c!64814)) b!565187))

(assert (= (and b!565187 res!356253) b!565188))

(assert (= (and b!565188 (not res!356251)) b!565183))

(assert (= (and b!565183 (not res!356252)) b!565182))

(declare-fun m!543701 () Bool)

(assert (=> b!565183 m!543701))

(assert (=> b!565189 m!543609))

(declare-fun m!543705 () Bool)

(assert (=> b!565189 m!543705))

(assert (=> b!565189 m!543705))

(assert (=> b!565189 m!543607))

(declare-fun m!543707 () Bool)

(assert (=> b!565189 m!543707))

(assert (=> d!84005 m!543609))

(declare-fun m!543709 () Bool)

(assert (=> d!84005 m!543709))

(assert (=> d!84005 m!543585))

(assert (=> b!565182 m!543701))

(assert (=> b!565188 m!543701))

(assert (=> b!565059 d!84005))

(declare-fun d!84013 () Bool)

(declare-fun lt!257807 () (_ BitVec 32))

(declare-fun lt!257806 () (_ BitVec 32))

(assert (=> d!84013 (= lt!257807 (bvmul (bvxor lt!257806 (bvlshr lt!257806 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84013 (= lt!257806 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84013 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356239 (let ((h!12128 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53082 (bvmul (bvxor h!12128 (bvlshr h!12128 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53082 (bvlshr x!53082 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356239 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356239 #b00000000000000000000000000000000))))))

(assert (=> d!84013 (= (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!257807 (bvlshr lt!257807 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565059 d!84013))

(declare-fun b!565245 () Bool)

(declare-fun e!325451 () SeekEntryResult!5497)

(declare-fun lt!257824 () SeekEntryResult!5497)

(assert (=> b!565245 (= e!325451 (Found!5497 (index!24217 lt!257824)))))

(declare-fun d!84015 () Bool)

(declare-fun lt!257823 () SeekEntryResult!5497)

(assert (=> d!84015 (and (or (is-Undefined!5497 lt!257823) (not (is-Found!5497 lt!257823)) (and (bvsge (index!24216 lt!257823) #b00000000000000000000000000000000) (bvslt (index!24216 lt!257823) (size!17412 a!3118)))) (or (is-Undefined!5497 lt!257823) (is-Found!5497 lt!257823) (not (is-MissingZero!5497 lt!257823)) (and (bvsge (index!24215 lt!257823) #b00000000000000000000000000000000) (bvslt (index!24215 lt!257823) (size!17412 a!3118)))) (or (is-Undefined!5497 lt!257823) (is-Found!5497 lt!257823) (is-MissingZero!5497 lt!257823) (not (is-MissingVacant!5497 lt!257823)) (and (bvsge (index!24218 lt!257823) #b00000000000000000000000000000000) (bvslt (index!24218 lt!257823) (size!17412 a!3118)))) (or (is-Undefined!5497 lt!257823) (ite (is-Found!5497 lt!257823) (= (select (arr!17048 a!3118) (index!24216 lt!257823)) k!1914) (ite (is-MissingZero!5497 lt!257823) (= (select (arr!17048 a!3118) (index!24215 lt!257823)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5497 lt!257823) (= (select (arr!17048 a!3118) (index!24218 lt!257823)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325453 () SeekEntryResult!5497)

(assert (=> d!84015 (= lt!257823 e!325453)))

(declare-fun c!64835 () Bool)

(assert (=> d!84015 (= c!64835 (and (is-Intermediate!5497 lt!257824) (undefined!6309 lt!257824)))))

(assert (=> d!84015 (= lt!257824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84015 (validMask!0 mask!3119)))

(assert (=> d!84015 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!257823)))

(declare-fun b!565246 () Bool)

(declare-fun e!325452 () SeekEntryResult!5497)

(assert (=> b!565246 (= e!325452 (MissingZero!5497 (index!24217 lt!257824)))))

(declare-fun b!565247 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35495 (_ BitVec 32)) SeekEntryResult!5497)

(assert (=> b!565247 (= e!325452 (seekKeyOrZeroReturnVacant!0 (x!53080 lt!257824) (index!24217 lt!257824) (index!24217 lt!257824) k!1914 a!3118 mask!3119))))

(declare-fun b!565248 () Bool)

(assert (=> b!565248 (= e!325453 e!325451)))

(declare-fun lt!257822 () (_ BitVec 64))

(assert (=> b!565248 (= lt!257822 (select (arr!17048 a!3118) (index!24217 lt!257824)))))

(declare-fun c!64833 () Bool)

(assert (=> b!565248 (= c!64833 (= lt!257822 k!1914))))

(declare-fun b!565249 () Bool)

(declare-fun c!64834 () Bool)

(assert (=> b!565249 (= c!64834 (= lt!257822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565249 (= e!325451 e!325452)))

(declare-fun b!565250 () Bool)

(assert (=> b!565250 (= e!325453 Undefined!5497)))

(assert (= (and d!84015 c!64835) b!565250))

(assert (= (and d!84015 (not c!64835)) b!565248))

(assert (= (and b!565248 c!64833) b!565245))

(assert (= (and b!565248 (not c!64833)) b!565249))

(assert (= (and b!565249 c!64834) b!565246))

(assert (= (and b!565249 (not c!64834)) b!565247))

(declare-fun m!543713 () Bool)

(assert (=> d!84015 m!543713))

(declare-fun m!543715 () Bool)

(assert (=> d!84015 m!543715))

(assert (=> d!84015 m!543713))

(declare-fun m!543717 () Bool)

(assert (=> d!84015 m!543717))

(declare-fun m!543719 () Bool)

(assert (=> d!84015 m!543719))

(declare-fun m!543721 () Bool)

(assert (=> d!84015 m!543721))

(assert (=> d!84015 m!543585))

(declare-fun m!543723 () Bool)

(assert (=> b!565247 m!543723))

(declare-fun m!543725 () Bool)

(assert (=> b!565248 m!543725))

(assert (=> b!565054 d!84015))

(declare-fun b!565288 () Bool)

(declare-fun e!325477 () Bool)

(declare-fun e!325480 () Bool)

(assert (=> b!565288 (= e!325477 e!325480)))

(declare-fun res!356290 () Bool)

(assert (=> b!565288 (=> (not res!356290) (not e!325480))))

(declare-fun e!325479 () Bool)

(assert (=> b!565288 (= res!356290 (not e!325479))))

(declare-fun res!356291 () Bool)

(assert (=> b!565288 (=> (not res!356291) (not e!325479))))

(assert (=> b!565288 (= res!356291 (validKeyInArray!0 (select (arr!17048 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32468 () Bool)

(declare-fun call!32471 () Bool)

(declare-fun c!64847 () Bool)

(assert (=> bm!32468 (= call!32471 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64847 (Cons!11124 (select (arr!17048 a!3118) #b00000000000000000000000000000000) Nil!11125) Nil!11125)))))

(declare-fun b!565289 () Bool)

(declare-fun contains!2863 (List!11128 (_ BitVec 64)) Bool)

(assert (=> b!565289 (= e!325479 (contains!2863 Nil!11125 (select (arr!17048 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565290 () Bool)

(declare-fun e!325478 () Bool)

(assert (=> b!565290 (= e!325478 call!32471)))

(declare-fun d!84023 () Bool)

(declare-fun res!356289 () Bool)

(assert (=> d!84023 (=> res!356289 e!325477)))

(assert (=> d!84023 (= res!356289 (bvsge #b00000000000000000000000000000000 (size!17412 a!3118)))))

(assert (=> d!84023 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11125) e!325477)))

(declare-fun b!565291 () Bool)

(assert (=> b!565291 (= e!325480 e!325478)))

(assert (=> b!565291 (= c!64847 (validKeyInArray!0 (select (arr!17048 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565292 () Bool)

(assert (=> b!565292 (= e!325478 call!32471)))

(assert (= (and d!84023 (not res!356289)) b!565288))

(assert (= (and b!565288 res!356291) b!565289))

(assert (= (and b!565288 res!356290) b!565291))

(assert (= (and b!565291 c!64847) b!565290))

(assert (= (and b!565291 (not c!64847)) b!565292))

(assert (= (or b!565290 b!565292) bm!32468))

(assert (=> b!565288 m!543635))

(assert (=> b!565288 m!543635))

(assert (=> b!565288 m!543637))

(assert (=> bm!32468 m!543635))

(declare-fun m!543745 () Bool)

(assert (=> bm!32468 m!543745))

(assert (=> b!565289 m!543635))

(assert (=> b!565289 m!543635))

(declare-fun m!543749 () Bool)

(assert (=> b!565289 m!543749))

(assert (=> b!565291 m!543635))

(assert (=> b!565291 m!543635))

(assert (=> b!565291 m!543637))

(assert (=> b!565055 d!84023))

(declare-fun d!84033 () Bool)

(declare-fun res!356303 () Bool)

(declare-fun e!325499 () Bool)

(assert (=> d!84033 (=> res!356303 e!325499)))

(assert (=> d!84033 (= res!356303 (= (select (arr!17048 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84033 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!325499)))

(declare-fun b!565320 () Bool)

(declare-fun e!325500 () Bool)

(assert (=> b!565320 (= e!325499 e!325500)))

(declare-fun res!356304 () Bool)

(assert (=> b!565320 (=> (not res!356304) (not e!325500))))

(assert (=> b!565320 (= res!356304 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17412 a!3118)))))

(declare-fun b!565321 () Bool)

(assert (=> b!565321 (= e!325500 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84033 (not res!356303)) b!565320))

(assert (= (and b!565320 res!356304) b!565321))

(assert (=> d!84033 m!543635))

(declare-fun m!543785 () Bool)

(assert (=> b!565321 m!543785))

(assert (=> b!565060 d!84033))

(declare-fun d!84047 () Bool)

(assert (=> d!84047 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565061 d!84047))

(declare-fun d!84049 () Bool)

(assert (=> d!84049 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51630 d!84049))

(declare-fun d!84055 () Bool)

(assert (=> d!84055 (= (array_inv!12844 a!3118) (bvsge (size!17412 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51630 d!84055))

(declare-fun b!565328 () Bool)

(declare-fun e!325507 () SeekEntryResult!5497)

(declare-fun lt!257863 () SeekEntryResult!5497)

(assert (=> b!565328 (= e!325507 (Found!5497 (index!24217 lt!257863)))))

(declare-fun d!84057 () Bool)

(declare-fun lt!257862 () SeekEntryResult!5497)

(assert (=> d!84057 (and (or (is-Undefined!5497 lt!257862) (not (is-Found!5497 lt!257862)) (and (bvsge (index!24216 lt!257862) #b00000000000000000000000000000000) (bvslt (index!24216 lt!257862) (size!17412 a!3118)))) (or (is-Undefined!5497 lt!257862) (is-Found!5497 lt!257862) (not (is-MissingZero!5497 lt!257862)) (and (bvsge (index!24215 lt!257862) #b00000000000000000000000000000000) (bvslt (index!24215 lt!257862) (size!17412 a!3118)))) (or (is-Undefined!5497 lt!257862) (is-Found!5497 lt!257862) (is-MissingZero!5497 lt!257862) (not (is-MissingVacant!5497 lt!257862)) (and (bvsge (index!24218 lt!257862) #b00000000000000000000000000000000) (bvslt (index!24218 lt!257862) (size!17412 a!3118)))) (or (is-Undefined!5497 lt!257862) (ite (is-Found!5497 lt!257862) (= (select (arr!17048 a!3118) (index!24216 lt!257862)) (select (arr!17048 a!3118) j!142)) (ite (is-MissingZero!5497 lt!257862) (= (select (arr!17048 a!3118) (index!24215 lt!257862)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5497 lt!257862) (= (select (arr!17048 a!3118) (index!24218 lt!257862)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325509 () SeekEntryResult!5497)

(assert (=> d!84057 (= lt!257862 e!325509)))

(declare-fun c!64858 () Bool)

(assert (=> d!84057 (= c!64858 (and (is-Intermediate!5497 lt!257863) (undefined!6309 lt!257863)))))

(assert (=> d!84057 (= lt!257863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) (select (arr!17048 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84057 (validMask!0 mask!3119)))

(assert (=> d!84057 (= (seekEntryOrOpen!0 (select (arr!17048 a!3118) j!142) a!3118 mask!3119) lt!257862)))

(declare-fun b!565329 () Bool)

(declare-fun e!325508 () SeekEntryResult!5497)

(assert (=> b!565329 (= e!325508 (MissingZero!5497 (index!24217 lt!257863)))))

(declare-fun b!565330 () Bool)

(assert (=> b!565330 (= e!325508 (seekKeyOrZeroReturnVacant!0 (x!53080 lt!257863) (index!24217 lt!257863) (index!24217 lt!257863) (select (arr!17048 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565331 () Bool)

(assert (=> b!565331 (= e!325509 e!325507)))

(declare-fun lt!257861 () (_ BitVec 64))

(assert (=> b!565331 (= lt!257861 (select (arr!17048 a!3118) (index!24217 lt!257863)))))

(declare-fun c!64856 () Bool)

(assert (=> b!565331 (= c!64856 (= lt!257861 (select (arr!17048 a!3118) j!142)))))

(declare-fun b!565332 () Bool)

(declare-fun c!64857 () Bool)

(assert (=> b!565332 (= c!64857 (= lt!257861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565332 (= e!325507 e!325508)))

(declare-fun b!565333 () Bool)

(assert (=> b!565333 (= e!325509 Undefined!5497)))

(assert (= (and d!84057 c!64858) b!565333))

(assert (= (and d!84057 (not c!64858)) b!565331))

(assert (= (and b!565331 c!64856) b!565328))

(assert (= (and b!565331 (not c!64856)) b!565332))

(assert (= (and b!565332 c!64857) b!565329))

(assert (= (and b!565332 (not c!64857)) b!565330))

(assert (=> d!84057 m!543605))

(assert (=> d!84057 m!543589))

(assert (=> d!84057 m!543613))

(assert (=> d!84057 m!543589))

(assert (=> d!84057 m!543605))

(declare-fun m!543797 () Bool)

(assert (=> d!84057 m!543797))

(declare-fun m!543799 () Bool)

(assert (=> d!84057 m!543799))

(declare-fun m!543801 () Bool)

(assert (=> d!84057 m!543801))

(assert (=> d!84057 m!543585))

(assert (=> b!565330 m!543589))

(declare-fun m!543803 () Bool)

(assert (=> b!565330 m!543803))

(declare-fun m!543805 () Bool)

(assert (=> b!565331 m!543805))

(assert (=> b!565057 d!84057))

(declare-fun d!84061 () Bool)

(declare-fun res!356312 () Bool)

(declare-fun e!325511 () Bool)

(assert (=> d!84061 (=> res!356312 e!325511)))

(assert (=> d!84061 (= res!356312 (bvsge j!142 (size!17412 a!3118)))))

(assert (=> d!84061 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325511)))

(declare-fun b!565334 () Bool)

(declare-fun e!325510 () Bool)

(assert (=> b!565334 (= e!325511 e!325510)))

(declare-fun c!64859 () Bool)

(assert (=> b!565334 (= c!64859 (validKeyInArray!0 (select (arr!17048 a!3118) j!142)))))

(declare-fun bm!32471 () Bool)

(declare-fun call!32474 () Bool)

(assert (=> bm!32471 (= call!32474 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!565335 () Bool)

(declare-fun e!325512 () Bool)

(assert (=> b!565335 (= e!325512 call!32474)))

(declare-fun b!565336 () Bool)

(assert (=> b!565336 (= e!325510 call!32474)))

(declare-fun b!565337 () Bool)

(assert (=> b!565337 (= e!325510 e!325512)))

(declare-fun lt!257866 () (_ BitVec 64))

(assert (=> b!565337 (= lt!257866 (select (arr!17048 a!3118) j!142))))

(declare-fun lt!257864 () Unit!17696)

(assert (=> b!565337 (= lt!257864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257866 j!142))))

(assert (=> b!565337 (arrayContainsKey!0 a!3118 lt!257866 #b00000000000000000000000000000000)))

(declare-fun lt!257865 () Unit!17696)

(assert (=> b!565337 (= lt!257865 lt!257864)))

(declare-fun res!356311 () Bool)

(assert (=> b!565337 (= res!356311 (= (seekEntryOrOpen!0 (select (arr!17048 a!3118) j!142) a!3118 mask!3119) (Found!5497 j!142)))))

(assert (=> b!565337 (=> (not res!356311) (not e!325512))))

(assert (= (and d!84061 (not res!356312)) b!565334))

(assert (= (and b!565334 c!64859) b!565337))

(assert (= (and b!565334 (not c!64859)) b!565336))

(assert (= (and b!565337 res!356311) b!565335))

(assert (= (or b!565335 b!565336) bm!32471))

(assert (=> b!565334 m!543589))

(assert (=> b!565334 m!543589))

(assert (=> b!565334 m!543601))

(declare-fun m!543807 () Bool)

(assert (=> bm!32471 m!543807))

(assert (=> b!565337 m!543589))

(declare-fun m!543809 () Bool)

(assert (=> b!565337 m!543809))

(declare-fun m!543811 () Bool)

(assert (=> b!565337 m!543811))

(assert (=> b!565337 m!543589))

(assert (=> b!565337 m!543591))

(assert (=> b!565057 d!84061))

(declare-fun d!84065 () Bool)

(assert (=> d!84065 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257869 () Unit!17696)

(declare-fun choose!38 (array!35495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17696)

(assert (=> d!84065 (= lt!257869 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84065 (validMask!0 mask!3119)))

(assert (=> d!84065 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!257869)))

(declare-fun bs!17559 () Bool)

(assert (= bs!17559 d!84065))

(assert (=> bs!17559 m!543593))

(declare-fun m!543813 () Bool)

(assert (=> bs!17559 m!543813))

(assert (=> bs!17559 m!543585))

(assert (=> b!565057 d!84065))

(push 1)

