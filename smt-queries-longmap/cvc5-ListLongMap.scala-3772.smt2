; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51626 () Bool)

(assert start!51626)

(declare-fun b!564999 () Bool)

(declare-fun e!325318 () Bool)

(declare-fun e!325320 () Bool)

(assert (=> b!564999 (= e!325318 e!325320)))

(declare-fun res!356153 () Bool)

(assert (=> b!564999 (=> (not res!356153) (not e!325320))))

(declare-datatypes ((SeekEntryResult!5495 0))(
  ( (MissingZero!5495 (index!24207 (_ BitVec 32))) (Found!5495 (index!24208 (_ BitVec 32))) (Intermediate!5495 (undefined!6307 Bool) (index!24209 (_ BitVec 32)) (x!53078 (_ BitVec 32))) (Undefined!5495) (MissingVacant!5495 (index!24210 (_ BitVec 32))) )
))
(declare-fun lt!257727 () SeekEntryResult!5495)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564999 (= res!356153 (or (= lt!257727 (MissingZero!5495 i!1132)) (= lt!257727 (MissingVacant!5495 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35491 0))(
  ( (array!35492 (arr!17046 (Array (_ BitVec 32) (_ BitVec 64))) (size!17410 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35491)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35491 (_ BitVec 32)) SeekEntryResult!5495)

(assert (=> b!564999 (= lt!257727 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!356157 () Bool)

(assert (=> start!51626 (=> (not res!356157) (not e!325318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51626 (= res!356157 (validMask!0 mask!3119))))

(assert (=> start!51626 e!325318))

(assert (=> start!51626 true))

(declare-fun array_inv!12842 (array!35491) Bool)

(assert (=> start!51626 (array_inv!12842 a!3118)))

(declare-fun b!565000 () Bool)

(declare-fun res!356152 () Bool)

(assert (=> b!565000 (=> (not res!356152) (not e!325318))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565000 (= res!356152 (validKeyInArray!0 (select (arr!17046 a!3118) j!142)))))

(declare-fun b!565001 () Bool)

(declare-fun res!356151 () Bool)

(assert (=> b!565001 (=> (not res!356151) (not e!325320))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35491 (_ BitVec 32)) SeekEntryResult!5495)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565001 (= res!356151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) (select (arr!17046 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118)) mask!3119)))))

(declare-fun b!565002 () Bool)

(declare-fun res!356159 () Bool)

(assert (=> b!565002 (=> (not res!356159) (not e!325318))))

(declare-fun arrayContainsKey!0 (array!35491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565002 (= res!356159 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565003 () Bool)

(declare-fun res!356155 () Bool)

(assert (=> b!565003 (=> (not res!356155) (not e!325320))))

(declare-datatypes ((List!11126 0))(
  ( (Nil!11123) (Cons!11122 (h!12125 (_ BitVec 64)) (t!17354 List!11126)) )
))
(declare-fun arrayNoDuplicates!0 (array!35491 (_ BitVec 32) List!11126) Bool)

(assert (=> b!565003 (= res!356155 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11123))))

(declare-fun b!565004 () Bool)

(assert (=> b!565004 (= e!325320 (not (= (seekEntryOrOpen!0 (select (arr!17046 a!3118) j!142) a!3118 mask!3119) (Found!5495 j!142))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35491 (_ BitVec 32)) Bool)

(assert (=> b!565004 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17692 0))(
  ( (Unit!17693) )
))
(declare-fun lt!257728 () Unit!17692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17692)

(assert (=> b!565004 (= lt!257728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565005 () Bool)

(declare-fun res!356158 () Bool)

(assert (=> b!565005 (=> (not res!356158) (not e!325318))))

(assert (=> b!565005 (= res!356158 (validKeyInArray!0 k!1914))))

(declare-fun b!565006 () Bool)

(declare-fun res!356156 () Bool)

(assert (=> b!565006 (=> (not res!356156) (not e!325320))))

(assert (=> b!565006 (= res!356156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565007 () Bool)

(declare-fun res!356154 () Bool)

(assert (=> b!565007 (=> (not res!356154) (not e!325318))))

(assert (=> b!565007 (= res!356154 (and (= (size!17410 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17410 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17410 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51626 res!356157) b!565007))

(assert (= (and b!565007 res!356154) b!565000))

(assert (= (and b!565000 res!356152) b!565005))

(assert (= (and b!565005 res!356158) b!565002))

(assert (= (and b!565002 res!356159) b!564999))

(assert (= (and b!564999 res!356153) b!565006))

(assert (= (and b!565006 res!356156) b!565003))

(assert (= (and b!565003 res!356155) b!565001))

(assert (= (and b!565001 res!356151) b!565004))

(declare-fun m!543513 () Bool)

(assert (=> b!565004 m!543513))

(assert (=> b!565004 m!543513))

(declare-fun m!543515 () Bool)

(assert (=> b!565004 m!543515))

(declare-fun m!543517 () Bool)

(assert (=> b!565004 m!543517))

(declare-fun m!543519 () Bool)

(assert (=> b!565004 m!543519))

(declare-fun m!543521 () Bool)

(assert (=> b!565002 m!543521))

(declare-fun m!543523 () Bool)

(assert (=> b!565006 m!543523))

(declare-fun m!543525 () Bool)

(assert (=> start!51626 m!543525))

(declare-fun m!543527 () Bool)

(assert (=> start!51626 m!543527))

(declare-fun m!543529 () Bool)

(assert (=> b!565003 m!543529))

(assert (=> b!565001 m!543513))

(declare-fun m!543531 () Bool)

(assert (=> b!565001 m!543531))

(assert (=> b!565001 m!543513))

(declare-fun m!543533 () Bool)

(assert (=> b!565001 m!543533))

(declare-fun m!543535 () Bool)

(assert (=> b!565001 m!543535))

(assert (=> b!565001 m!543533))

(declare-fun m!543537 () Bool)

(assert (=> b!565001 m!543537))

(assert (=> b!565001 m!543531))

(assert (=> b!565001 m!543513))

(declare-fun m!543539 () Bool)

(assert (=> b!565001 m!543539))

(declare-fun m!543541 () Bool)

(assert (=> b!565001 m!543541))

(assert (=> b!565001 m!543533))

(assert (=> b!565001 m!543535))

(assert (=> b!565000 m!543513))

(assert (=> b!565000 m!543513))

(declare-fun m!543543 () Bool)

(assert (=> b!565000 m!543543))

(declare-fun m!543545 () Bool)

(assert (=> b!564999 m!543545))

(declare-fun m!543547 () Bool)

(assert (=> b!565005 m!543547))

(push 1)

(assert (not b!564999))

(assert (not b!565006))

(assert (not b!565004))

(assert (not start!51626))

(assert (not b!565001))

(assert (not b!565002))

(assert (not b!565005))

(assert (not b!565003))

(assert (not b!565000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!565116 () Bool)

(declare-fun e!325373 () SeekEntryResult!5495)

(declare-fun e!325374 () SeekEntryResult!5495)

(assert (=> b!565116 (= e!325373 e!325374)))

(declare-fun lt!257774 () (_ BitVec 64))

(declare-fun lt!257776 () SeekEntryResult!5495)

(assert (=> b!565116 (= lt!257774 (select (arr!17046 a!3118) (index!24209 lt!257776)))))

(declare-fun c!64793 () Bool)

(assert (=> b!565116 (= c!64793 (= lt!257774 k!1914))))

(declare-fun b!565117 () Bool)

(declare-fun e!325372 () SeekEntryResult!5495)

(assert (=> b!565117 (= e!325372 (MissingZero!5495 (index!24209 lt!257776)))))

(declare-fun b!565118 () Bool)

(declare-fun c!64791 () Bool)

(assert (=> b!565118 (= c!64791 (= lt!257774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565118 (= e!325374 e!325372)))

(declare-fun b!565120 () Bool)

(assert (=> b!565120 (= e!325374 (Found!5495 (index!24209 lt!257776)))))

(declare-fun b!565121 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35491 (_ BitVec 32)) SeekEntryResult!5495)

(assert (=> b!565121 (= e!325372 (seekKeyOrZeroReturnVacant!0 (x!53078 lt!257776) (index!24209 lt!257776) (index!24209 lt!257776) k!1914 a!3118 mask!3119))))

(declare-fun d!83981 () Bool)

(declare-fun lt!257775 () SeekEntryResult!5495)

(assert (=> d!83981 (and (or (is-Undefined!5495 lt!257775) (not (is-Found!5495 lt!257775)) (and (bvsge (index!24208 lt!257775) #b00000000000000000000000000000000) (bvslt (index!24208 lt!257775) (size!17410 a!3118)))) (or (is-Undefined!5495 lt!257775) (is-Found!5495 lt!257775) (not (is-MissingZero!5495 lt!257775)) (and (bvsge (index!24207 lt!257775) #b00000000000000000000000000000000) (bvslt (index!24207 lt!257775) (size!17410 a!3118)))) (or (is-Undefined!5495 lt!257775) (is-Found!5495 lt!257775) (is-MissingZero!5495 lt!257775) (not (is-MissingVacant!5495 lt!257775)) (and (bvsge (index!24210 lt!257775) #b00000000000000000000000000000000) (bvslt (index!24210 lt!257775) (size!17410 a!3118)))) (or (is-Undefined!5495 lt!257775) (ite (is-Found!5495 lt!257775) (= (select (arr!17046 a!3118) (index!24208 lt!257775)) k!1914) (ite (is-MissingZero!5495 lt!257775) (= (select (arr!17046 a!3118) (index!24207 lt!257775)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5495 lt!257775) (= (select (arr!17046 a!3118) (index!24210 lt!257775)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83981 (= lt!257775 e!325373)))

(declare-fun c!64792 () Bool)

(assert (=> d!83981 (= c!64792 (and (is-Intermediate!5495 lt!257776) (undefined!6307 lt!257776)))))

(assert (=> d!83981 (= lt!257776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83981 (validMask!0 mask!3119)))

(assert (=> d!83981 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!257775)))

(declare-fun b!565119 () Bool)

(assert (=> b!565119 (= e!325373 Undefined!5495)))

(assert (= (and d!83981 c!64792) b!565119))

(assert (= (and d!83981 (not c!64792)) b!565116))

(assert (= (and b!565116 c!64793) b!565120))

(assert (= (and b!565116 (not c!64793)) b!565118))

(assert (= (and b!565118 c!64791) b!565117))

(assert (= (and b!565118 (not c!64791)) b!565121))

(declare-fun m!543659 () Bool)

(assert (=> b!565116 m!543659))

(declare-fun m!543661 () Bool)

(assert (=> b!565121 m!543661))

(declare-fun m!543663 () Bool)

(assert (=> d!83981 m!543663))

(declare-fun m!543665 () Bool)

(assert (=> d!83981 m!543665))

(assert (=> d!83981 m!543663))

(declare-fun m!543667 () Bool)

(assert (=> d!83981 m!543667))

(declare-fun m!543669 () Bool)

(assert (=> d!83981 m!543669))

(declare-fun m!543671 () Bool)

(assert (=> d!83981 m!543671))

(assert (=> d!83981 m!543525))

(assert (=> b!564999 d!83981))

(declare-fun b!565122 () Bool)

(declare-fun e!325376 () SeekEntryResult!5495)

(declare-fun e!325377 () SeekEntryResult!5495)

(assert (=> b!565122 (= e!325376 e!325377)))

(declare-fun lt!257777 () (_ BitVec 64))

(declare-fun lt!257779 () SeekEntryResult!5495)

(assert (=> b!565122 (= lt!257777 (select (arr!17046 a!3118) (index!24209 lt!257779)))))

(declare-fun c!64796 () Bool)

(assert (=> b!565122 (= c!64796 (= lt!257777 (select (arr!17046 a!3118) j!142)))))

(declare-fun b!565123 () Bool)

(declare-fun e!325375 () SeekEntryResult!5495)

(assert (=> b!565123 (= e!325375 (MissingZero!5495 (index!24209 lt!257779)))))

(declare-fun b!565124 () Bool)

(declare-fun c!64794 () Bool)

(assert (=> b!565124 (= c!64794 (= lt!257777 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565124 (= e!325377 e!325375)))

(declare-fun b!565126 () Bool)

(assert (=> b!565126 (= e!325377 (Found!5495 (index!24209 lt!257779)))))

(declare-fun b!565127 () Bool)

(assert (=> b!565127 (= e!325375 (seekKeyOrZeroReturnVacant!0 (x!53078 lt!257779) (index!24209 lt!257779) (index!24209 lt!257779) (select (arr!17046 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83991 () Bool)

(declare-fun lt!257778 () SeekEntryResult!5495)

(assert (=> d!83991 (and (or (is-Undefined!5495 lt!257778) (not (is-Found!5495 lt!257778)) (and (bvsge (index!24208 lt!257778) #b00000000000000000000000000000000) (bvslt (index!24208 lt!257778) (size!17410 a!3118)))) (or (is-Undefined!5495 lt!257778) (is-Found!5495 lt!257778) (not (is-MissingZero!5495 lt!257778)) (and (bvsge (index!24207 lt!257778) #b00000000000000000000000000000000) (bvslt (index!24207 lt!257778) (size!17410 a!3118)))) (or (is-Undefined!5495 lt!257778) (is-Found!5495 lt!257778) (is-MissingZero!5495 lt!257778) (not (is-MissingVacant!5495 lt!257778)) (and (bvsge (index!24210 lt!257778) #b00000000000000000000000000000000) (bvslt (index!24210 lt!257778) (size!17410 a!3118)))) (or (is-Undefined!5495 lt!257778) (ite (is-Found!5495 lt!257778) (= (select (arr!17046 a!3118) (index!24208 lt!257778)) (select (arr!17046 a!3118) j!142)) (ite (is-MissingZero!5495 lt!257778) (= (select (arr!17046 a!3118) (index!24207 lt!257778)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5495 lt!257778) (= (select (arr!17046 a!3118) (index!24210 lt!257778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83991 (= lt!257778 e!325376)))

(declare-fun c!64795 () Bool)

(assert (=> d!83991 (= c!64795 (and (is-Intermediate!5495 lt!257779) (undefined!6307 lt!257779)))))

(assert (=> d!83991 (= lt!257779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) (select (arr!17046 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83991 (validMask!0 mask!3119)))

(assert (=> d!83991 (= (seekEntryOrOpen!0 (select (arr!17046 a!3118) j!142) a!3118 mask!3119) lt!257778)))

(declare-fun b!565125 () Bool)

(assert (=> b!565125 (= e!325376 Undefined!5495)))

(assert (= (and d!83991 c!64795) b!565125))

(assert (= (and d!83991 (not c!64795)) b!565122))

(assert (= (and b!565122 c!64796) b!565126))

(assert (= (and b!565122 (not c!64796)) b!565124))

(assert (= (and b!565124 c!64794) b!565123))

(assert (= (and b!565124 (not c!64794)) b!565127))

(declare-fun m!543673 () Bool)

(assert (=> b!565122 m!543673))

(assert (=> b!565127 m!543513))

(declare-fun m!543675 () Bool)

(assert (=> b!565127 m!543675))

(assert (=> d!83991 m!543513))

(assert (=> d!83991 m!543531))

(declare-fun m!543677 () Bool)

(assert (=> d!83991 m!543677))

(assert (=> d!83991 m!543531))

(assert (=> d!83991 m!543513))

(assert (=> d!83991 m!543539))

(declare-fun m!543679 () Bool)

(assert (=> d!83991 m!543679))

(declare-fun m!543681 () Bool)

(assert (=> d!83991 m!543681))

(assert (=> d!83991 m!543525))

(assert (=> b!565004 d!83991))

(declare-fun b!565163 () Bool)

(declare-fun e!325399 () Bool)

(declare-fun e!325401 () Bool)

(assert (=> b!565163 (= e!325399 e!325401)))

(declare-fun c!64808 () Bool)

(assert (=> b!565163 (= c!64808 (validKeyInArray!0 (select (arr!17046 a!3118) j!142)))))

(declare-fun call!32465 () Bool)

(declare-fun bm!32462 () Bool)

(assert (=> bm!32462 (= call!32465 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83993 () Bool)

(declare-fun res!356241 () Bool)

(assert (=> d!83993 (=> res!356241 e!325399)))

(assert (=> d!83993 (= res!356241 (bvsge j!142 (size!17410 a!3118)))))

(assert (=> d!83993 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325399)))

(declare-fun b!565164 () Bool)

(assert (=> b!565164 (= e!325401 call!32465)))

(declare-fun b!565165 () Bool)

(declare-fun e!325400 () Bool)

(assert (=> b!565165 (= e!325401 e!325400)))

(declare-fun lt!257794 () (_ BitVec 64))

(assert (=> b!565165 (= lt!257794 (select (arr!17046 a!3118) j!142))))

(declare-fun lt!257793 () Unit!17692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35491 (_ BitVec 64) (_ BitVec 32)) Unit!17692)

(assert (=> b!565165 (= lt!257793 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257794 j!142))))

(assert (=> b!565165 (arrayContainsKey!0 a!3118 lt!257794 #b00000000000000000000000000000000)))

(declare-fun lt!257792 () Unit!17692)

(assert (=> b!565165 (= lt!257792 lt!257793)))

(declare-fun res!356240 () Bool)

(assert (=> b!565165 (= res!356240 (= (seekEntryOrOpen!0 (select (arr!17046 a!3118) j!142) a!3118 mask!3119) (Found!5495 j!142)))))

(assert (=> b!565165 (=> (not res!356240) (not e!325400))))

(declare-fun b!565166 () Bool)

(assert (=> b!565166 (= e!325400 call!32465)))

(assert (= (and d!83993 (not res!356241)) b!565163))

(assert (= (and b!565163 c!64808) b!565165))

(assert (= (and b!565163 (not c!64808)) b!565164))

(assert (= (and b!565165 res!356240) b!565166))

(assert (= (or b!565166 b!565164) bm!32462))

(assert (=> b!565163 m!543513))

(assert (=> b!565163 m!543513))

(assert (=> b!565163 m!543543))

(declare-fun m!543691 () Bool)

(assert (=> bm!32462 m!543691))

(assert (=> b!565165 m!543513))

(declare-fun m!543693 () Bool)

(assert (=> b!565165 m!543693))

(declare-fun m!543695 () Bool)

(assert (=> b!565165 m!543695))

(assert (=> b!565165 m!543513))

(assert (=> b!565165 m!543515))

(assert (=> b!565004 d!83993))

(declare-fun d!84003 () Bool)

(assert (=> d!84003 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257805 () Unit!17692)

(declare-fun choose!38 (array!35491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17692)

(assert (=> d!84003 (= lt!257805 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84003 (validMask!0 mask!3119)))

(assert (=> d!84003 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!257805)))

(declare-fun bs!17557 () Bool)

(assert (= bs!17557 d!84003))

(assert (=> bs!17557 m!543517))

(declare-fun m!543703 () Bool)

(assert (=> bs!17557 m!543703))

(assert (=> bs!17557 m!543525))

(assert (=> b!565004 d!84003))

(declare-fun d!84011 () Bool)

(assert (=> d!84011 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565005 d!84011))

(declare-fun d!84017 () Bool)

(assert (=> d!84017 (= (validKeyInArray!0 (select (arr!17046 a!3118) j!142)) (and (not (= (select (arr!17046 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17046 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565000 d!84017))

(declare-fun b!565251 () Bool)

(declare-fun e!325456 () SeekEntryResult!5495)

(declare-fun e!325458 () SeekEntryResult!5495)

(assert (=> b!565251 (= e!325456 e!325458)))

(declare-fun c!64838 () Bool)

(declare-fun lt!257826 () (_ BitVec 64))

(assert (=> b!565251 (= c!64838 (or (= lt!257826 (select (arr!17046 a!3118) j!142)) (= (bvadd lt!257826 lt!257826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565252 () Bool)

(declare-fun lt!257825 () SeekEntryResult!5495)

(assert (=> b!565252 (and (bvsge (index!24209 lt!257825) #b00000000000000000000000000000000) (bvslt (index!24209 lt!257825) (size!17410 a!3118)))))

(declare-fun e!325454 () Bool)

(assert (=> b!565252 (= e!325454 (= (select (arr!17046 a!3118) (index!24209 lt!257825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!565253 () Bool)

(declare-fun e!325455 () Bool)

(declare-fun e!325457 () Bool)

(assert (=> b!565253 (= e!325455 e!325457)))

(declare-fun res!356272 () Bool)

(assert (=> b!565253 (= res!356272 (and (is-Intermediate!5495 lt!257825) (not (undefined!6307 lt!257825)) (bvslt (x!53078 lt!257825) #b01111111111111111111111111111110) (bvsge (x!53078 lt!257825) #b00000000000000000000000000000000) (bvsge (x!53078 lt!257825) #b00000000000000000000000000000000)))))

(assert (=> b!565253 (=> (not res!356272) (not e!325457))))

(declare-fun b!565254 () Bool)

(assert (=> b!565254 (and (bvsge (index!24209 lt!257825) #b00000000000000000000000000000000) (bvslt (index!24209 lt!257825) (size!17410 a!3118)))))

(declare-fun res!356273 () Bool)

(assert (=> b!565254 (= res!356273 (= (select (arr!17046 a!3118) (index!24209 lt!257825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565254 (=> res!356273 e!325454)))

(declare-fun d!84019 () Bool)

(assert (=> d!84019 e!325455))

(declare-fun c!64836 () Bool)

(assert (=> d!84019 (= c!64836 (and (is-Intermediate!5495 lt!257825) (undefined!6307 lt!257825)))))

(assert (=> d!84019 (= lt!257825 e!325456)))

(declare-fun c!64837 () Bool)

(assert (=> d!84019 (= c!64837 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84019 (= lt!257826 (select (arr!17046 a!3118) (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119)))))

(assert (=> d!84019 (validMask!0 mask!3119)))

(assert (=> d!84019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) (select (arr!17046 a!3118) j!142) a!3118 mask!3119) lt!257825)))

(declare-fun b!565255 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565255 (= e!325458 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!17046 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565256 () Bool)

(assert (=> b!565256 (= e!325456 (Intermediate!5495 true (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565257 () Bool)

(assert (=> b!565257 (= e!325455 (bvsge (x!53078 lt!257825) #b01111111111111111111111111111110))))

(declare-fun b!565258 () Bool)

(assert (=> b!565258 (and (bvsge (index!24209 lt!257825) #b00000000000000000000000000000000) (bvslt (index!24209 lt!257825) (size!17410 a!3118)))))

(declare-fun res!356274 () Bool)

(assert (=> b!565258 (= res!356274 (= (select (arr!17046 a!3118) (index!24209 lt!257825)) (select (arr!17046 a!3118) j!142)))))

(assert (=> b!565258 (=> res!356274 e!325454)))

(assert (=> b!565258 (= e!325457 e!325454)))

(declare-fun b!565259 () Bool)

(assert (=> b!565259 (= e!325458 (Intermediate!5495 false (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(assert (= (and d!84019 c!64837) b!565256))

(assert (= (and d!84019 (not c!64837)) b!565251))

(assert (= (and b!565251 c!64838) b!565259))

(assert (= (and b!565251 (not c!64838)) b!565255))

(assert (= (and d!84019 c!64836) b!565257))

(assert (= (and d!84019 (not c!64836)) b!565253))

(assert (= (and b!565253 res!356272) b!565258))

(assert (= (and b!565258 (not res!356274)) b!565254))

(assert (= (and b!565254 (not res!356273)) b!565252))

(declare-fun m!543727 () Bool)

(assert (=> b!565258 m!543727))

(assert (=> b!565252 m!543727))

(assert (=> b!565255 m!543531))

(declare-fun m!543729 () Bool)

(assert (=> b!565255 m!543729))

(assert (=> b!565255 m!543729))

(assert (=> b!565255 m!543513))

(declare-fun m!543731 () Bool)

(assert (=> b!565255 m!543731))

(assert (=> d!84019 m!543531))

(declare-fun m!543733 () Bool)

(assert (=> d!84019 m!543733))

(assert (=> d!84019 m!543525))

(assert (=> b!565254 m!543727))

(assert (=> b!565001 d!84019))

(declare-fun d!84025 () Bool)

(declare-fun lt!257836 () (_ BitVec 32))

(declare-fun lt!257835 () (_ BitVec 32))

(assert (=> d!84025 (= lt!257836 (bvmul (bvxor lt!257835 (bvlshr lt!257835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84025 (= lt!257835 ((_ extract 31 0) (bvand (bvxor (select (arr!17046 a!3118) j!142) (bvlshr (select (arr!17046 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84025 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356278 (let ((h!12129 ((_ extract 31 0) (bvand (bvxor (select (arr!17046 a!3118) j!142) (bvlshr (select (arr!17046 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53085 (bvmul (bvxor h!12129 (bvlshr h!12129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53085 (bvlshr x!53085 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356278 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356278 #b00000000000000000000000000000000))))))

(assert (=> d!84025 (= (toIndex!0 (select (arr!17046 a!3118) j!142) mask!3119) (bvand (bvxor lt!257836 (bvlshr lt!257836 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565001 d!84025))

(declare-fun b!565279 () Bool)

(declare-fun e!325474 () SeekEntryResult!5495)

(declare-fun e!325476 () SeekEntryResult!5495)

(assert (=> b!565279 (= e!325474 e!325476)))

(declare-fun c!64846 () Bool)

(declare-fun lt!257840 () (_ BitVec 64))

(assert (=> b!565279 (= c!64846 (or (= lt!257840 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!257840 lt!257840) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!257839 () SeekEntryResult!5495)

(declare-fun b!565280 () Bool)

(assert (=> b!565280 (and (bvsge (index!24209 lt!257839) #b00000000000000000000000000000000) (bvslt (index!24209 lt!257839) (size!17410 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118)))))))

(declare-fun e!325472 () Bool)

(assert (=> b!565280 (= e!325472 (= (select (arr!17046 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118))) (index!24209 lt!257839)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!565281 () Bool)

(declare-fun e!325473 () Bool)

(declare-fun e!325475 () Bool)

(assert (=> b!565281 (= e!325473 e!325475)))

(declare-fun res!356286 () Bool)

(assert (=> b!565281 (= res!356286 (and (is-Intermediate!5495 lt!257839) (not (undefined!6307 lt!257839)) (bvslt (x!53078 lt!257839) #b01111111111111111111111111111110) (bvsge (x!53078 lt!257839) #b00000000000000000000000000000000) (bvsge (x!53078 lt!257839) #b00000000000000000000000000000000)))))

(assert (=> b!565281 (=> (not res!356286) (not e!325475))))

(declare-fun b!565282 () Bool)

(assert (=> b!565282 (and (bvsge (index!24209 lt!257839) #b00000000000000000000000000000000) (bvslt (index!24209 lt!257839) (size!17410 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118)))))))

(declare-fun res!356287 () Bool)

(assert (=> b!565282 (= res!356287 (= (select (arr!17046 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118))) (index!24209 lt!257839)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565282 (=> res!356287 e!325472)))

(declare-fun d!84029 () Bool)

(assert (=> d!84029 e!325473))

(declare-fun c!64844 () Bool)

(assert (=> d!84029 (= c!64844 (and (is-Intermediate!5495 lt!257839) (undefined!6307 lt!257839)))))

(assert (=> d!84029 (= lt!257839 e!325474)))

(declare-fun c!64845 () Bool)

(assert (=> d!84029 (= c!64845 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84029 (= lt!257840 (select (arr!17046 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118))) (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119)))))

(assert (=> d!84029 (validMask!0 mask!3119)))

(assert (=> d!84029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118)) mask!3119) lt!257839)))

(declare-fun b!565283 () Bool)

(assert (=> b!565283 (= e!325476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118)) mask!3119))))

(declare-fun b!565284 () Bool)

(assert (=> b!565284 (= e!325474 (Intermediate!5495 true (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565285 () Bool)

(assert (=> b!565285 (= e!325473 (bvsge (x!53078 lt!257839) #b01111111111111111111111111111110))))

(declare-fun b!565286 () Bool)

(assert (=> b!565286 (and (bvsge (index!24209 lt!257839) #b00000000000000000000000000000000) (bvslt (index!24209 lt!257839) (size!17410 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118)))))))

(declare-fun res!356288 () Bool)

(assert (=> b!565286 (= res!356288 (= (select (arr!17046 (array!35492 (store (arr!17046 a!3118) i!1132 k!1914) (size!17410 a!3118))) (index!24209 lt!257839)) (select (store (arr!17046 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!565286 (=> res!356288 e!325472)))

(assert (=> b!565286 (= e!325475 e!325472)))

(declare-fun b!565287 () Bool)

(assert (=> b!565287 (= e!325476 (Intermediate!5495 false (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(assert (= (and d!84029 c!64845) b!565284))

(assert (= (and d!84029 (not c!64845)) b!565279))

(assert (= (and b!565279 c!64846) b!565287))

(assert (= (and b!565279 (not c!64846)) b!565283))

(assert (= (and d!84029 c!64844) b!565285))

(assert (= (and d!84029 (not c!64844)) b!565281))

(assert (= (and b!565281 res!356286) b!565286))

(assert (= (and b!565286 (not res!356288)) b!565282))

(assert (= (and b!565282 (not res!356287)) b!565280))

(declare-fun m!543743 () Bool)

(assert (=> b!565286 m!543743))

(assert (=> b!565280 m!543743))

(assert (=> b!565283 m!543535))

(declare-fun m!543747 () Bool)

(assert (=> b!565283 m!543747))

(assert (=> b!565283 m!543747))

(assert (=> b!565283 m!543533))

(declare-fun m!543751 () Bool)

(assert (=> b!565283 m!543751))

(assert (=> d!84029 m!543535))

(declare-fun m!543753 () Bool)

(assert (=> d!84029 m!543753))

(assert (=> d!84029 m!543525))

(assert (=> b!565282 m!543743))

(assert (=> b!565001 d!84029))

(declare-fun d!84035 () Bool)

(declare-fun lt!257846 () (_ BitVec 32))

(declare-fun lt!257845 () (_ BitVec 32))

(assert (=> d!84035 (= lt!257846 (bvmul (bvxor lt!257845 (bvlshr lt!257845 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84035 (= lt!257845 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84035 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356278 (let ((h!12129 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53085 (bvmul (bvxor h!12129 (bvlshr h!12129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53085 (bvlshr x!53085 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356278 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356278 #b00000000000000000000000000000000))))))

(assert (=> d!84035 (= (toIndex!0 (select (store (arr!17046 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!257846 (bvlshr lt!257846 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565001 d!84035))

(declare-fun b!565302 () Bool)

(declare-fun e!325486 () Bool)

(declare-fun e!325488 () Bool)

(assert (=> b!565302 (= e!325486 e!325488)))

(declare-fun c!64851 () Bool)

(assert (=> b!565302 (= c!64851 (validKeyInArray!0 (select (arr!17046 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32469 () Bool)

(declare-fun call!32472 () Bool)

(assert (=> bm!32469 (= call!32472 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84037 () Bool)

(declare-fun res!356296 () Bool)

(assert (=> d!84037 (=> res!356296 e!325486)))

(assert (=> d!84037 (= res!356296 (bvsge #b00000000000000000000000000000000 (size!17410 a!3118)))))

(assert (=> d!84037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325486)))

(declare-fun b!565303 () Bool)

(assert (=> b!565303 (= e!325488 call!32472)))

(declare-fun b!565304 () Bool)

(declare-fun e!325487 () Bool)

(assert (=> b!565304 (= e!325488 e!325487)))

(declare-fun lt!257849 () (_ BitVec 64))

(assert (=> b!565304 (= lt!257849 (select (arr!17046 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!257848 () Unit!17692)

(assert (=> b!565304 (= lt!257848 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257849 #b00000000000000000000000000000000))))

(assert (=> b!565304 (arrayContainsKey!0 a!3118 lt!257849 #b00000000000000000000000000000000)))

(declare-fun lt!257847 () Unit!17692)

(assert (=> b!565304 (= lt!257847 lt!257848)))

(declare-fun res!356295 () Bool)

(assert (=> b!565304 (= res!356295 (= (seekEntryOrOpen!0 (select (arr!17046 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5495 #b00000000000000000000000000000000)))))

(assert (=> b!565304 (=> (not res!356295) (not e!325487))))

(declare-fun b!565305 () Bool)

(assert (=> b!565305 (= e!325487 call!32472)))

(assert (= (and d!84037 (not res!356296)) b!565302))

(assert (= (and b!565302 c!64851) b!565304))

(assert (= (and b!565302 (not c!64851)) b!565303))

(assert (= (and b!565304 res!356295) b!565305))

(assert (= (or b!565305 b!565303) bm!32469))

(declare-fun m!543763 () Bool)

(assert (=> b!565302 m!543763))

(assert (=> b!565302 m!543763))

(declare-fun m!543765 () Bool)

(assert (=> b!565302 m!543765))

(declare-fun m!543767 () Bool)

(assert (=> bm!32469 m!543767))

(assert (=> b!565304 m!543763))

(declare-fun m!543769 () Bool)

(assert (=> b!565304 m!543769))

(declare-fun m!543771 () Bool)

(assert (=> b!565304 m!543771))

(assert (=> b!565304 m!543763))

(declare-fun m!543773 () Bool)

(assert (=> b!565304 m!543773))

(assert (=> b!565006 d!84037))

(declare-fun d!84043 () Bool)

(declare-fun res!356309 () Bool)

(declare-fun e!325505 () Bool)

(assert (=> d!84043 (=> res!356309 e!325505)))

(assert (=> d!84043 (= res!356309 (= (select (arr!17046 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84043 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!325505)))

(declare-fun b!565326 () Bool)

(declare-fun e!325506 () Bool)

(assert (=> b!565326 (= e!325505 e!325506)))

(declare-fun res!356310 () Bool)

(assert (=> b!565326 (=> (not res!356310) (not e!325506))))

(assert (=> b!565326 (= res!356310 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17410 a!3118)))))

(declare-fun b!565327 () Bool)

(assert (=> b!565327 (= e!325506 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84043 (not res!356309)) b!565326))

(assert (= (and b!565326 res!356310) b!565327))

(assert (=> d!84043 m!543763))

(declare-fun m!543793 () Bool)

(assert (=> b!565327 m!543793))

(assert (=> b!565002 d!84043))

(declare-fun d!84053 () Bool)

(assert (=> d!84053 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51626 d!84053))

(declare-fun d!84059 () Bool)

(assert (=> d!84059 (= (array_inv!12842 a!3118) (bvsge (size!17410 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51626 d!84059))

(declare-fun b!565348 () Bool)

(declare-fun e!325523 () Bool)

(declare-fun e!325524 () Bool)

(assert (=> b!565348 (= e!325523 e!325524)))

(declare-fun res!356321 () Bool)

(assert (=> b!565348 (=> (not res!356321) (not e!325524))))

(declare-fun e!325522 () Bool)

(assert (=> b!565348 (= res!356321 (not e!325522))))

(declare-fun res!356320 () Bool)

(assert (=> b!565348 (=> (not res!356320) (not e!325522))))

(assert (=> b!565348 (= res!356320 (validKeyInArray!0 (select (arr!17046 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565349 () Bool)

(declare-fun e!325521 () Bool)

(declare-fun call!32477 () Bool)

(assert (=> b!565349 (= e!325521 call!32477)))

(declare-fun b!565350 () Bool)

(declare-fun contains!2864 (List!11126 (_ BitVec 64)) Bool)

(assert (=> b!565350 (= e!325522 (contains!2864 Nil!11123 (select (arr!17046 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565351 () Bool)

(assert (=> b!565351 (= e!325521 call!32477)))

(declare-fun d!84063 () Bool)

(declare-fun res!356319 () Bool)

(assert (=> d!84063 (=> res!356319 e!325523)))

(assert (=> d!84063 (= res!356319 (bvsge #b00000000000000000000000000000000 (size!17410 a!3118)))))

(assert (=> d!84063 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11123) e!325523)))

(declare-fun bm!32474 () Bool)

(declare-fun c!64862 () Bool)

(assert (=> bm!32474 (= call!32477 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64862 (Cons!11122 (select (arr!17046 a!3118) #b00000000000000000000000000000000) Nil!11123) Nil!11123)))))

(declare-fun b!565352 () Bool)

(assert (=> b!565352 (= e!325524 e!325521)))

(assert (=> b!565352 (= c!64862 (validKeyInArray!0 (select (arr!17046 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84063 (not res!356319)) b!565348))

(assert (= (and b!565348 res!356320) b!565350))

(assert (= (and b!565348 res!356321) b!565352))

(assert (= (and b!565352 c!64862) b!565351))

(assert (= (and b!565352 (not c!64862)) b!565349))

(assert (= (or b!565351 b!565349) bm!32474))

(assert (=> b!565348 m!543763))

(assert (=> b!565348 m!543763))

(assert (=> b!565348 m!543765))

(assert (=> b!565350 m!543763))

(assert (=> b!565350 m!543763))

(declare-fun m!543815 () Bool)

(assert (=> b!565350 m!543815))

(assert (=> bm!32474 m!543763))

(declare-fun m!543817 () Bool)

(assert (=> bm!32474 m!543817))

(assert (=> b!565352 m!543763))

(assert (=> b!565352 m!543763))

(assert (=> b!565352 m!543765))

(assert (=> b!565003 d!84063))

(push 1)

