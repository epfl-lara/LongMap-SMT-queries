; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30156 () Bool)

(assert start!30156)

(declare-datatypes ((array!15320 0))(
  ( (array!15321 (arr!7249 (Array (_ BitVec 32) (_ BitVec 64))) (size!7601 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15320)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!190479 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun b!302079 () Bool)

(assert (=> b!302079 (= e!190479 (and (= (select (arr!7249 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7601 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302080 () Bool)

(declare-fun res!159742 () Bool)

(assert (=> b!302080 (=> (not res!159742) (not e!190479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15320 (_ BitVec 32)) Bool)

(assert (=> b!302080 (= res!159742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302081 () Bool)

(declare-fun res!159740 () Bool)

(assert (=> b!302081 (=> (not res!159740) (not e!190479))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2354 0))(
  ( (MissingZero!2354 (index!11592 (_ BitVec 32))) (Found!2354 (index!11593 (_ BitVec 32))) (Intermediate!2354 (undefined!3166 Bool) (index!11594 (_ BitVec 32)) (x!29970 (_ BitVec 32))) (Undefined!2354) (MissingVacant!2354 (index!11595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15320 (_ BitVec 32)) SeekEntryResult!2354)

(assert (=> b!302081 (= res!159740 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2354 i!1240)))))

(declare-fun b!302082 () Bool)

(declare-fun res!159738 () Bool)

(assert (=> b!302082 (=> (not res!159738) (not e!190479))))

(declare-fun arrayContainsKey!0 (array!15320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302082 (= res!159738 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159743 () Bool)

(assert (=> start!30156 (=> (not res!159743) (not e!190479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30156 (= res!159743 (validMask!0 mask!3709))))

(assert (=> start!30156 e!190479))

(declare-fun array_inv!5199 (array!15320) Bool)

(assert (=> start!30156 (array_inv!5199 a!3293)))

(assert (=> start!30156 true))

(declare-fun b!302083 () Bool)

(declare-fun res!159744 () Bool)

(assert (=> b!302083 (=> (not res!159744) (not e!190479))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15320 (_ BitVec 32)) SeekEntryResult!2354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302083 (= res!159744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2354 false resIndex!52 resX!52)))))

(declare-fun b!302084 () Bool)

(declare-fun res!159741 () Bool)

(assert (=> b!302084 (=> (not res!159741) (not e!190479))))

(assert (=> b!302084 (= res!159741 (and (= (size!7601 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7601 a!3293))))))

(declare-fun b!302085 () Bool)

(declare-fun res!159739 () Bool)

(assert (=> b!302085 (=> (not res!159739) (not e!190479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302085 (= res!159739 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30156 res!159743) b!302084))

(assert (= (and b!302084 res!159741) b!302085))

(assert (= (and b!302085 res!159739) b!302082))

(assert (= (and b!302082 res!159738) b!302081))

(assert (= (and b!302081 res!159740) b!302080))

(assert (= (and b!302080 res!159742) b!302083))

(assert (= (and b!302083 res!159744) b!302079))

(declare-fun m!313879 () Bool)

(assert (=> b!302082 m!313879))

(declare-fun m!313881 () Bool)

(assert (=> b!302080 m!313881))

(declare-fun m!313883 () Bool)

(assert (=> b!302085 m!313883))

(declare-fun m!313885 () Bool)

(assert (=> b!302081 m!313885))

(declare-fun m!313887 () Bool)

(assert (=> start!30156 m!313887))

(declare-fun m!313889 () Bool)

(assert (=> start!30156 m!313889))

(declare-fun m!313891 () Bool)

(assert (=> b!302079 m!313891))

(declare-fun m!313893 () Bool)

(assert (=> b!302083 m!313893))

(assert (=> b!302083 m!313893))

(declare-fun m!313895 () Bool)

(assert (=> b!302083 m!313895))

(check-sat (not start!30156) (not b!302080) (not b!302085) (not b!302082) (not b!302081) (not b!302083))
(check-sat)
(get-model)

(declare-fun b!302160 () Bool)

(declare-fun e!190514 () SeekEntryResult!2354)

(assert (=> b!302160 (= e!190514 (Intermediate!2354 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!302161 () Bool)

(declare-fun e!190516 () SeekEntryResult!2354)

(assert (=> b!302161 (= e!190516 e!190514)))

(declare-fun c!48776 () Bool)

(declare-fun lt!150017 () (_ BitVec 64))

(assert (=> b!302161 (= c!48776 (or (= lt!150017 k0!2441) (= (bvadd lt!150017 lt!150017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!302162 () Bool)

(declare-fun lt!150018 () SeekEntryResult!2354)

(assert (=> b!302162 (and (bvsge (index!11594 lt!150018) #b00000000000000000000000000000000) (bvslt (index!11594 lt!150018) (size!7601 a!3293)))))

(declare-fun res!159804 () Bool)

(assert (=> b!302162 (= res!159804 (= (select (arr!7249 a!3293) (index!11594 lt!150018)) k0!2441))))

(declare-fun e!190515 () Bool)

(assert (=> b!302162 (=> res!159804 e!190515)))

(declare-fun e!190517 () Bool)

(assert (=> b!302162 (= e!190517 e!190515)))

(declare-fun b!302163 () Bool)

(assert (=> b!302163 (and (bvsge (index!11594 lt!150018) #b00000000000000000000000000000000) (bvslt (index!11594 lt!150018) (size!7601 a!3293)))))

(assert (=> b!302163 (= e!190515 (= (select (arr!7249 a!3293) (index!11594 lt!150018)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!302164 () Bool)

(declare-fun e!190518 () Bool)

(assert (=> b!302164 (= e!190518 (bvsge (x!29970 lt!150018) #b01111111111111111111111111111110))))

(declare-fun b!302165 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302165 (= e!190514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!302166 () Bool)

(assert (=> b!302166 (and (bvsge (index!11594 lt!150018) #b00000000000000000000000000000000) (bvslt (index!11594 lt!150018) (size!7601 a!3293)))))

(declare-fun res!159805 () Bool)

(assert (=> b!302166 (= res!159805 (= (select (arr!7249 a!3293) (index!11594 lt!150018)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!302166 (=> res!159805 e!190515)))

(declare-fun d!67989 () Bool)

(assert (=> d!67989 e!190518))

(declare-fun c!48778 () Bool)

(get-info :version)

(assert (=> d!67989 (= c!48778 (and ((_ is Intermediate!2354) lt!150018) (undefined!3166 lt!150018)))))

(assert (=> d!67989 (= lt!150018 e!190516)))

(declare-fun c!48777 () Bool)

(assert (=> d!67989 (= c!48777 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67989 (= lt!150017 (select (arr!7249 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!67989 (validMask!0 mask!3709)))

(assert (=> d!67989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150018)))

(declare-fun b!302167 () Bool)

(assert (=> b!302167 (= e!190516 (Intermediate!2354 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!302168 () Bool)

(assert (=> b!302168 (= e!190518 e!190517)))

(declare-fun res!159803 () Bool)

(assert (=> b!302168 (= res!159803 (and ((_ is Intermediate!2354) lt!150018) (not (undefined!3166 lt!150018)) (bvslt (x!29970 lt!150018) #b01111111111111111111111111111110) (bvsge (x!29970 lt!150018) #b00000000000000000000000000000000) (bvsge (x!29970 lt!150018) #b00000000000000000000000000000000)))))

(assert (=> b!302168 (=> (not res!159803) (not e!190517))))

(assert (= (and d!67989 c!48777) b!302167))

(assert (= (and d!67989 (not c!48777)) b!302161))

(assert (= (and b!302161 c!48776) b!302160))

(assert (= (and b!302161 (not c!48776)) b!302165))

(assert (= (and d!67989 c!48778) b!302164))

(assert (= (and d!67989 (not c!48778)) b!302168))

(assert (= (and b!302168 res!159803) b!302162))

(assert (= (and b!302162 (not res!159804)) b!302166))

(assert (= (and b!302166 (not res!159805)) b!302163))

(declare-fun m!313947 () Bool)

(assert (=> b!302162 m!313947))

(assert (=> d!67989 m!313893))

(declare-fun m!313949 () Bool)

(assert (=> d!67989 m!313949))

(assert (=> d!67989 m!313887))

(assert (=> b!302165 m!313893))

(declare-fun m!313951 () Bool)

(assert (=> b!302165 m!313951))

(assert (=> b!302165 m!313951))

(declare-fun m!313953 () Bool)

(assert (=> b!302165 m!313953))

(assert (=> b!302166 m!313947))

(assert (=> b!302163 m!313947))

(assert (=> b!302083 d!67989))

(declare-fun d!67999 () Bool)

(declare-fun lt!150031 () (_ BitVec 32))

(declare-fun lt!150030 () (_ BitVec 32))

(assert (=> d!67999 (= lt!150031 (bvmul (bvxor lt!150030 (bvlshr lt!150030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67999 (= lt!150030 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67999 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159808 (let ((h!5243 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29974 (bvmul (bvxor h!5243 (bvlshr h!5243 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29974 (bvlshr x!29974 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159808 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159808 #b00000000000000000000000000000000))))))

(assert (=> d!67999 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150031 (bvlshr lt!150031 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!302083 d!67999))

(declare-fun d!68001 () Bool)

(declare-fun res!159819 () Bool)

(declare-fun e!190536 () Bool)

(assert (=> d!68001 (=> res!159819 e!190536)))

(assert (=> d!68001 (= res!159819 (= (select (arr!7249 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68001 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190536)))

(declare-fun b!302195 () Bool)

(declare-fun e!190537 () Bool)

(assert (=> b!302195 (= e!190536 e!190537)))

(declare-fun res!159820 () Bool)

(assert (=> b!302195 (=> (not res!159820) (not e!190537))))

(assert (=> b!302195 (= res!159820 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7601 a!3293)))))

(declare-fun b!302196 () Bool)

(assert (=> b!302196 (= e!190537 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68001 (not res!159819)) b!302195))

(assert (= (and b!302195 res!159820) b!302196))

(declare-fun m!313955 () Bool)

(assert (=> d!68001 m!313955))

(declare-fun m!313957 () Bool)

(assert (=> b!302196 m!313957))

(assert (=> b!302082 d!68001))

(declare-fun b!302236 () Bool)

(declare-fun c!48805 () Bool)

(declare-fun lt!150057 () (_ BitVec 64))

(assert (=> b!302236 (= c!48805 (= lt!150057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190558 () SeekEntryResult!2354)

(declare-fun e!190559 () SeekEntryResult!2354)

(assert (=> b!302236 (= e!190558 e!190559)))

(declare-fun b!302237 () Bool)

(declare-fun lt!150056 () SeekEntryResult!2354)

(assert (=> b!302237 (= e!190558 (Found!2354 (index!11594 lt!150056)))))

(declare-fun b!302238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15320 (_ BitVec 32)) SeekEntryResult!2354)

(assert (=> b!302238 (= e!190559 (seekKeyOrZeroReturnVacant!0 (x!29970 lt!150056) (index!11594 lt!150056) (index!11594 lt!150056) k0!2441 a!3293 mask!3709))))

(declare-fun b!302239 () Bool)

(assert (=> b!302239 (= e!190559 (MissingZero!2354 (index!11594 lt!150056)))))

(declare-fun b!302240 () Bool)

(declare-fun e!190560 () SeekEntryResult!2354)

(assert (=> b!302240 (= e!190560 Undefined!2354)))

(declare-fun b!302241 () Bool)

(assert (=> b!302241 (= e!190560 e!190558)))

(assert (=> b!302241 (= lt!150057 (select (arr!7249 a!3293) (index!11594 lt!150056)))))

(declare-fun c!48806 () Bool)

(assert (=> b!302241 (= c!48806 (= lt!150057 k0!2441))))

(declare-fun d!68003 () Bool)

(declare-fun lt!150055 () SeekEntryResult!2354)

(assert (=> d!68003 (and (or ((_ is Undefined!2354) lt!150055) (not ((_ is Found!2354) lt!150055)) (and (bvsge (index!11593 lt!150055) #b00000000000000000000000000000000) (bvslt (index!11593 lt!150055) (size!7601 a!3293)))) (or ((_ is Undefined!2354) lt!150055) ((_ is Found!2354) lt!150055) (not ((_ is MissingZero!2354) lt!150055)) (and (bvsge (index!11592 lt!150055) #b00000000000000000000000000000000) (bvslt (index!11592 lt!150055) (size!7601 a!3293)))) (or ((_ is Undefined!2354) lt!150055) ((_ is Found!2354) lt!150055) ((_ is MissingZero!2354) lt!150055) (not ((_ is MissingVacant!2354) lt!150055)) (and (bvsge (index!11595 lt!150055) #b00000000000000000000000000000000) (bvslt (index!11595 lt!150055) (size!7601 a!3293)))) (or ((_ is Undefined!2354) lt!150055) (ite ((_ is Found!2354) lt!150055) (= (select (arr!7249 a!3293) (index!11593 lt!150055)) k0!2441) (ite ((_ is MissingZero!2354) lt!150055) (= (select (arr!7249 a!3293) (index!11592 lt!150055)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2354) lt!150055) (= (select (arr!7249 a!3293) (index!11595 lt!150055)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68003 (= lt!150055 e!190560)))

(declare-fun c!48804 () Bool)

(assert (=> d!68003 (= c!48804 (and ((_ is Intermediate!2354) lt!150056) (undefined!3166 lt!150056)))))

(assert (=> d!68003 (= lt!150056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68003 (validMask!0 mask!3709)))

(assert (=> d!68003 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150055)))

(assert (= (and d!68003 c!48804) b!302240))

(assert (= (and d!68003 (not c!48804)) b!302241))

(assert (= (and b!302241 c!48806) b!302237))

(assert (= (and b!302241 (not c!48806)) b!302236))

(assert (= (and b!302236 c!48805) b!302239))

(assert (= (and b!302236 (not c!48805)) b!302238))

(declare-fun m!313977 () Bool)

(assert (=> b!302238 m!313977))

(declare-fun m!313979 () Bool)

(assert (=> b!302241 m!313979))

(assert (=> d!68003 m!313893))

(assert (=> d!68003 m!313895))

(assert (=> d!68003 m!313887))

(assert (=> d!68003 m!313893))

(declare-fun m!313981 () Bool)

(assert (=> d!68003 m!313981))

(declare-fun m!313983 () Bool)

(assert (=> d!68003 m!313983))

(declare-fun m!313985 () Bool)

(assert (=> d!68003 m!313985))

(assert (=> b!302081 d!68003))

(declare-fun d!68013 () Bool)

(assert (=> d!68013 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!302085 d!68013))

(declare-fun d!68015 () Bool)

(assert (=> d!68015 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30156 d!68015))

(declare-fun d!68025 () Bool)

(assert (=> d!68025 (= (array_inv!5199 a!3293) (bvsge (size!7601 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30156 d!68025))

(declare-fun b!302292 () Bool)

(declare-fun e!190592 () Bool)

(declare-fun e!190594 () Bool)

(assert (=> b!302292 (= e!190592 e!190594)))

(declare-fun c!48824 () Bool)

(assert (=> b!302292 (= c!48824 (validKeyInArray!0 (select (arr!7249 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!302293 () Bool)

(declare-fun call!25874 () Bool)

(assert (=> b!302293 (= e!190594 call!25874)))

(declare-fun b!302294 () Bool)

(declare-fun e!190593 () Bool)

(assert (=> b!302294 (= e!190593 call!25874)))

(declare-fun d!68027 () Bool)

(declare-fun res!159842 () Bool)

(assert (=> d!68027 (=> res!159842 e!190592)))

(assert (=> d!68027 (= res!159842 (bvsge #b00000000000000000000000000000000 (size!7601 a!3293)))))

(assert (=> d!68027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190592)))

(declare-fun bm!25871 () Bool)

(assert (=> bm!25871 (= call!25874 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!302295 () Bool)

(assert (=> b!302295 (= e!190594 e!190593)))

(declare-fun lt!150078 () (_ BitVec 64))

(assert (=> b!302295 (= lt!150078 (select (arr!7249 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9347 0))(
  ( (Unit!9348) )
))
(declare-fun lt!150079 () Unit!9347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15320 (_ BitVec 64) (_ BitVec 32)) Unit!9347)

(assert (=> b!302295 (= lt!150079 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150078 #b00000000000000000000000000000000))))

(assert (=> b!302295 (arrayContainsKey!0 a!3293 lt!150078 #b00000000000000000000000000000000)))

(declare-fun lt!150077 () Unit!9347)

(assert (=> b!302295 (= lt!150077 lt!150079)))

(declare-fun res!159841 () Bool)

(assert (=> b!302295 (= res!159841 (= (seekEntryOrOpen!0 (select (arr!7249 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2354 #b00000000000000000000000000000000)))))

(assert (=> b!302295 (=> (not res!159841) (not e!190593))))

(assert (= (and d!68027 (not res!159842)) b!302292))

(assert (= (and b!302292 c!48824) b!302295))

(assert (= (and b!302292 (not c!48824)) b!302293))

(assert (= (and b!302295 res!159841) b!302294))

(assert (= (or b!302294 b!302293) bm!25871))

(assert (=> b!302292 m!313955))

(assert (=> b!302292 m!313955))

(declare-fun m!314001 () Bool)

(assert (=> b!302292 m!314001))

(declare-fun m!314003 () Bool)

(assert (=> bm!25871 m!314003))

(assert (=> b!302295 m!313955))

(declare-fun m!314005 () Bool)

(assert (=> b!302295 m!314005))

(declare-fun m!314007 () Bool)

(assert (=> b!302295 m!314007))

(assert (=> b!302295 m!313955))

(declare-fun m!314009 () Bool)

(assert (=> b!302295 m!314009))

(assert (=> b!302080 d!68027))

(check-sat (not b!302196) (not b!302292) (not bm!25871) (not b!302165) (not b!302295) (not b!302238) (not d!68003) (not d!67989))
(check-sat)
