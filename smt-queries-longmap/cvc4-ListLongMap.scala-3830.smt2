; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52470 () Bool)

(assert start!52470)

(declare-fun b!573128 () Bool)

(declare-fun res!362641 () Bool)

(declare-fun e!329706 () Bool)

(assert (=> b!573128 (=> (not res!362641) (not e!329706))))

(declare-datatypes ((array!35867 0))(
  ( (array!35868 (arr!17222 (Array (_ BitVec 32) (_ BitVec 64))) (size!17586 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35867)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573128 (= res!362641 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!362636 () Bool)

(assert (=> start!52470 (=> (not res!362636) (not e!329706))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52470 (= res!362636 (validMask!0 mask!3119))))

(assert (=> start!52470 e!329706))

(assert (=> start!52470 true))

(declare-fun array_inv!13018 (array!35867) Bool)

(assert (=> start!52470 (array_inv!13018 a!3118)))

(declare-fun b!573129 () Bool)

(declare-fun e!329700 () Bool)

(declare-fun e!329702 () Bool)

(assert (=> b!573129 (= e!329700 e!329702)))

(declare-fun res!362648 () Bool)

(assert (=> b!573129 (=> (not res!362648) (not e!329702))))

(declare-fun lt!261716 () array!35867)

(declare-fun lt!261720 () (_ BitVec 32))

(declare-fun lt!261715 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5671 0))(
  ( (MissingZero!5671 (index!24911 (_ BitVec 32))) (Found!5671 (index!24912 (_ BitVec 32))) (Intermediate!5671 (undefined!6483 Bool) (index!24913 (_ BitVec 32)) (x!53772 (_ BitVec 32))) (Undefined!5671) (MissingVacant!5671 (index!24914 (_ BitVec 32))) )
))
(declare-fun lt!261718 () SeekEntryResult!5671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35867 (_ BitVec 32)) SeekEntryResult!5671)

(assert (=> b!573129 (= res!362648 (= lt!261718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261720 lt!261715 lt!261716 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261717 () (_ BitVec 32))

(assert (=> b!573129 (= lt!261718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261717 (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573129 (= lt!261720 (toIndex!0 lt!261715 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573129 (= lt!261715 (select (store (arr!17222 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!573129 (= lt!261717 (toIndex!0 (select (arr!17222 a!3118) j!142) mask!3119))))

(assert (=> b!573129 (= lt!261716 (array!35868 (store (arr!17222 a!3118) i!1132 k!1914) (size!17586 a!3118)))))

(declare-fun b!573130 () Bool)

(declare-fun e!329699 () Bool)

(declare-fun e!329703 () Bool)

(assert (=> b!573130 (= e!329699 e!329703)))

(declare-fun res!362640 () Bool)

(assert (=> b!573130 (=> res!362640 e!329703)))

(declare-fun lt!261719 () (_ BitVec 64))

(assert (=> b!573130 (= res!362640 (or (= lt!261719 (select (arr!17222 a!3118) j!142)) (= lt!261719 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573130 (= lt!261719 (select (arr!17222 a!3118) (index!24913 lt!261718)))))

(declare-fun b!573131 () Bool)

(declare-fun res!362638 () Bool)

(assert (=> b!573131 (=> (not res!362638) (not e!329700))))

(declare-datatypes ((List!11302 0))(
  ( (Nil!11299) (Cons!11298 (h!12325 (_ BitVec 64)) (t!17530 List!11302)) )
))
(declare-fun arrayNoDuplicates!0 (array!35867 (_ BitVec 32) List!11302) Bool)

(assert (=> b!573131 (= res!362638 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11299))))

(declare-fun b!573132 () Bool)

(declare-fun e!329705 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35867 (_ BitVec 32)) SeekEntryResult!5671)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35867 (_ BitVec 32)) SeekEntryResult!5671)

(assert (=> b!573132 (= e!329705 (= (seekEntryOrOpen!0 lt!261715 lt!261716 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261718) (index!24913 lt!261718) (index!24913 lt!261718) lt!261715 lt!261716 mask!3119)))))

(declare-fun b!573133 () Bool)

(declare-fun res!362646 () Bool)

(assert (=> b!573133 (=> (not res!362646) (not e!329706))))

(assert (=> b!573133 (= res!362646 (and (= (size!17586 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17586 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17586 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573134 () Bool)

(assert (=> b!573134 (= e!329702 (not (or (undefined!6483 lt!261718) (not (is-Intermediate!5671 lt!261718)) (let ((bdg!17961 (select (arr!17222 a!3118) (index!24913 lt!261718)))) (or (= bdg!17961 (select (arr!17222 a!3118) j!142)) (= bdg!17961 #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!24913 lt!261718) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261718) (bvadd #b00000000000000000000000000000001 mask!3119))))))))))

(declare-fun e!329701 () Bool)

(assert (=> b!573134 e!329701))

(declare-fun res!362639 () Bool)

(assert (=> b!573134 (=> (not res!362639) (not e!329701))))

(declare-fun lt!261721 () SeekEntryResult!5671)

(assert (=> b!573134 (= res!362639 (= lt!261721 (Found!5671 j!142)))))

(assert (=> b!573134 (= lt!261721 (seekEntryOrOpen!0 (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35867 (_ BitVec 32)) Bool)

(assert (=> b!573134 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18044 0))(
  ( (Unit!18045) )
))
(declare-fun lt!261714 () Unit!18044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18044)

(assert (=> b!573134 (= lt!261714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573135 () Bool)

(assert (=> b!573135 (= e!329706 e!329700)))

(declare-fun res!362644 () Bool)

(assert (=> b!573135 (=> (not res!362644) (not e!329700))))

(declare-fun lt!261713 () SeekEntryResult!5671)

(assert (=> b!573135 (= res!362644 (or (= lt!261713 (MissingZero!5671 i!1132)) (= lt!261713 (MissingVacant!5671 i!1132))))))

(assert (=> b!573135 (= lt!261713 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!573136 () Bool)

(assert (=> b!573136 (= e!329703 e!329705)))

(declare-fun res!362642 () Bool)

(assert (=> b!573136 (=> (not res!362642) (not e!329705))))

(assert (=> b!573136 (= res!362642 (= lt!261721 (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261718) (index!24913 lt!261718) (index!24913 lt!261718) (select (arr!17222 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573137 () Bool)

(declare-fun res!362645 () Bool)

(assert (=> b!573137 (=> (not res!362645) (not e!329706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573137 (= res!362645 (validKeyInArray!0 (select (arr!17222 a!3118) j!142)))))

(declare-fun b!573138 () Bool)

(declare-fun res!362643 () Bool)

(assert (=> b!573138 (=> (not res!362643) (not e!329706))))

(assert (=> b!573138 (= res!362643 (validKeyInArray!0 k!1914))))

(declare-fun b!573139 () Bool)

(assert (=> b!573139 (= e!329701 e!329699)))

(declare-fun res!362637 () Bool)

(assert (=> b!573139 (=> res!362637 e!329699)))

(assert (=> b!573139 (= res!362637 (or (undefined!6483 lt!261718) (not (is-Intermediate!5671 lt!261718))))))

(declare-fun b!573140 () Bool)

(declare-fun res!362647 () Bool)

(assert (=> b!573140 (=> (not res!362647) (not e!329700))))

(assert (=> b!573140 (= res!362647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52470 res!362636) b!573133))

(assert (= (and b!573133 res!362646) b!573137))

(assert (= (and b!573137 res!362645) b!573138))

(assert (= (and b!573138 res!362643) b!573128))

(assert (= (and b!573128 res!362641) b!573135))

(assert (= (and b!573135 res!362644) b!573140))

(assert (= (and b!573140 res!362647) b!573131))

(assert (= (and b!573131 res!362638) b!573129))

(assert (= (and b!573129 res!362648) b!573134))

(assert (= (and b!573134 res!362639) b!573139))

(assert (= (and b!573139 (not res!362637)) b!573130))

(assert (= (and b!573130 (not res!362640)) b!573136))

(assert (= (and b!573136 res!362642) b!573132))

(declare-fun m!552193 () Bool)

(assert (=> b!573137 m!552193))

(assert (=> b!573137 m!552193))

(declare-fun m!552195 () Bool)

(assert (=> b!573137 m!552195))

(declare-fun m!552197 () Bool)

(assert (=> b!573140 m!552197))

(declare-fun m!552199 () Bool)

(assert (=> b!573138 m!552199))

(declare-fun m!552201 () Bool)

(assert (=> start!52470 m!552201))

(declare-fun m!552203 () Bool)

(assert (=> start!52470 m!552203))

(assert (=> b!573134 m!552193))

(declare-fun m!552205 () Bool)

(assert (=> b!573134 m!552205))

(declare-fun m!552207 () Bool)

(assert (=> b!573134 m!552207))

(declare-fun m!552209 () Bool)

(assert (=> b!573134 m!552209))

(assert (=> b!573134 m!552193))

(declare-fun m!552211 () Bool)

(assert (=> b!573134 m!552211))

(declare-fun m!552213 () Bool)

(assert (=> b!573135 m!552213))

(declare-fun m!552215 () Bool)

(assert (=> b!573128 m!552215))

(assert (=> b!573130 m!552193))

(assert (=> b!573130 m!552209))

(assert (=> b!573136 m!552193))

(assert (=> b!573136 m!552193))

(declare-fun m!552217 () Bool)

(assert (=> b!573136 m!552217))

(assert (=> b!573129 m!552193))

(declare-fun m!552219 () Bool)

(assert (=> b!573129 m!552219))

(assert (=> b!573129 m!552193))

(declare-fun m!552221 () Bool)

(assert (=> b!573129 m!552221))

(assert (=> b!573129 m!552193))

(declare-fun m!552223 () Bool)

(assert (=> b!573129 m!552223))

(declare-fun m!552225 () Bool)

(assert (=> b!573129 m!552225))

(declare-fun m!552227 () Bool)

(assert (=> b!573129 m!552227))

(declare-fun m!552229 () Bool)

(assert (=> b!573129 m!552229))

(declare-fun m!552231 () Bool)

(assert (=> b!573132 m!552231))

(declare-fun m!552233 () Bool)

(assert (=> b!573132 m!552233))

(declare-fun m!552235 () Bool)

(assert (=> b!573131 m!552235))

(push 1)

(assert (not b!573135))

(assert (not b!573136))

(assert (not b!573131))

(assert (not b!573134))

(assert (not b!573132))

(assert (not b!573140))

(assert (not b!573138))

(assert (not b!573128))

(assert (not b!573137))

(assert (not b!573129))

(assert (not start!52470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!573202 () Bool)

(declare-fun e!329746 () Bool)

(declare-fun call!32630 () Bool)

(assert (=> b!573202 (= e!329746 call!32630)))

(declare-fun b!573203 () Bool)

(assert (=> b!573203 (= e!329746 call!32630)))

(declare-fun b!573204 () Bool)

(declare-fun e!329748 () Bool)

(declare-fun e!329747 () Bool)

(assert (=> b!573204 (= e!329748 e!329747)))

(declare-fun res!362665 () Bool)

(assert (=> b!573204 (=> (not res!362665) (not e!329747))))

(declare-fun e!329745 () Bool)

(assert (=> b!573204 (= res!362665 (not e!329745))))

(declare-fun res!362666 () Bool)

(assert (=> b!573204 (=> (not res!362666) (not e!329745))))

(assert (=> b!573204 (= res!362666 (validKeyInArray!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573205 () Bool)

(declare-fun contains!2884 (List!11302 (_ BitVec 64)) Bool)

(assert (=> b!573205 (= e!329745 (contains!2884 Nil!11299 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573206 () Bool)

(assert (=> b!573206 (= e!329747 e!329746)))

(declare-fun c!65627 () Bool)

(assert (=> b!573206 (= c!65627 (validKeyInArray!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84855 () Bool)

(declare-fun res!362664 () Bool)

(assert (=> d!84855 (=> res!362664 e!329748)))

(assert (=> d!84855 (= res!362664 (bvsge #b00000000000000000000000000000000 (size!17586 a!3118)))))

(assert (=> d!84855 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11299) e!329748)))

(declare-fun bm!32627 () Bool)

(assert (=> bm!32627 (= call!32630 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65627 (Cons!11298 (select (arr!17222 a!3118) #b00000000000000000000000000000000) Nil!11299) Nil!11299)))))

(assert (= (and d!84855 (not res!362664)) b!573204))

(assert (= (and b!573204 res!362666) b!573205))

(assert (= (and b!573204 res!362665) b!573206))

(assert (= (and b!573206 c!65627) b!573202))

(assert (= (and b!573206 (not c!65627)) b!573203))

(assert (= (or b!573202 b!573203) bm!32627))

(declare-fun m!552267 () Bool)

(assert (=> b!573204 m!552267))

(assert (=> b!573204 m!552267))

(declare-fun m!552269 () Bool)

(assert (=> b!573204 m!552269))

(assert (=> b!573205 m!552267))

(assert (=> b!573205 m!552267))

(declare-fun m!552271 () Bool)

(assert (=> b!573205 m!552271))

(assert (=> b!573206 m!552267))

(assert (=> b!573206 m!552267))

(assert (=> b!573206 m!552269))

(assert (=> bm!32627 m!552267))

(declare-fun m!552273 () Bool)

(assert (=> bm!32627 m!552273))

(assert (=> b!573131 d!84855))

(declare-fun b!573267 () Bool)

(declare-fun e!329784 () SeekEntryResult!5671)

(assert (=> b!573267 (= e!329784 (Found!5671 (index!24913 lt!261718)))))

(declare-fun e!329786 () SeekEntryResult!5671)

(declare-fun b!573268 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573268 (= e!329786 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53772 lt!261718) #b00000000000000000000000000000001) (nextIndex!0 (index!24913 lt!261718) (x!53772 lt!261718) mask!3119) (index!24913 lt!261718) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573269 () Bool)

(assert (=> b!573269 (= e!329786 (MissingVacant!5671 (index!24913 lt!261718)))))

(declare-fun d!84863 () Bool)

(declare-fun lt!261767 () SeekEntryResult!5671)

(assert (=> d!84863 (and (or (is-Undefined!5671 lt!261767) (not (is-Found!5671 lt!261767)) (and (bvsge (index!24912 lt!261767) #b00000000000000000000000000000000) (bvslt (index!24912 lt!261767) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261767) (is-Found!5671 lt!261767) (not (is-MissingVacant!5671 lt!261767)) (not (= (index!24914 lt!261767) (index!24913 lt!261718))) (and (bvsge (index!24914 lt!261767) #b00000000000000000000000000000000) (bvslt (index!24914 lt!261767) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261767) (ite (is-Found!5671 lt!261767) (= (select (arr!17222 a!3118) (index!24912 lt!261767)) (select (arr!17222 a!3118) j!142)) (and (is-MissingVacant!5671 lt!261767) (= (index!24914 lt!261767) (index!24913 lt!261718)) (= (select (arr!17222 a!3118) (index!24914 lt!261767)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!329785 () SeekEntryResult!5671)

(assert (=> d!84863 (= lt!261767 e!329785)))

(declare-fun c!65650 () Bool)

(assert (=> d!84863 (= c!65650 (bvsge (x!53772 lt!261718) #b01111111111111111111111111111110))))

(declare-fun lt!261766 () (_ BitVec 64))

(assert (=> d!84863 (= lt!261766 (select (arr!17222 a!3118) (index!24913 lt!261718)))))

(assert (=> d!84863 (validMask!0 mask!3119)))

(assert (=> d!84863 (= (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261718) (index!24913 lt!261718) (index!24913 lt!261718) (select (arr!17222 a!3118) j!142) a!3118 mask!3119) lt!261767)))

(declare-fun b!573270 () Bool)

(assert (=> b!573270 (= e!329785 e!329784)))

(declare-fun c!65649 () Bool)

(assert (=> b!573270 (= c!65649 (= lt!261766 (select (arr!17222 a!3118) j!142)))))

(declare-fun b!573271 () Bool)

(declare-fun c!65651 () Bool)

(assert (=> b!573271 (= c!65651 (= lt!261766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573271 (= e!329784 e!329786)))

(declare-fun b!573272 () Bool)

(assert (=> b!573272 (= e!329785 Undefined!5671)))

(assert (= (and d!84863 c!65650) b!573272))

(assert (= (and d!84863 (not c!65650)) b!573270))

(assert (= (and b!573270 c!65649) b!573267))

(assert (= (and b!573270 (not c!65649)) b!573271))

(assert (= (and b!573271 c!65651) b!573269))

(assert (= (and b!573271 (not c!65651)) b!573268))

(declare-fun m!552303 () Bool)

(assert (=> b!573268 m!552303))

(assert (=> b!573268 m!552303))

(assert (=> b!573268 m!552193))

(declare-fun m!552305 () Bool)

(assert (=> b!573268 m!552305))

(declare-fun m!552307 () Bool)

(assert (=> d!84863 m!552307))

(declare-fun m!552309 () Bool)

(assert (=> d!84863 m!552309))

(assert (=> d!84863 m!552209))

(assert (=> d!84863 m!552201))

(assert (=> b!573136 d!84863))

(declare-fun d!84875 () Bool)

(assert (=> d!84875 (= (validKeyInArray!0 (select (arr!17222 a!3118) j!142)) (and (not (= (select (arr!17222 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17222 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573137 d!84875))

(declare-fun d!84877 () Bool)

(assert (=> d!84877 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52470 d!84877))

(declare-fun d!84881 () Bool)

(assert (=> d!84881 (= (array_inv!13018 a!3118) (bvsge (size!17586 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52470 d!84881))

(declare-fun b!573383 () Bool)

(declare-fun e!329850 () SeekEntryResult!5671)

(declare-fun lt!261818 () SeekEntryResult!5671)

(assert (=> b!573383 (= e!329850 (Found!5671 (index!24913 lt!261818)))))

(declare-fun b!573384 () Bool)

(declare-fun e!329849 () SeekEntryResult!5671)

(assert (=> b!573384 (= e!329849 (MissingZero!5671 (index!24913 lt!261818)))))

(declare-fun b!573386 () Bool)

(declare-fun e!329851 () SeekEntryResult!5671)

(assert (=> b!573386 (= e!329851 Undefined!5671)))

(declare-fun b!573387 () Bool)

(declare-fun c!65697 () Bool)

(declare-fun lt!261819 () (_ BitVec 64))

(assert (=> b!573387 (= c!65697 (= lt!261819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573387 (= e!329850 e!329849)))

(declare-fun b!573388 () Bool)

(assert (=> b!573388 (= e!329851 e!329850)))

(assert (=> b!573388 (= lt!261819 (select (arr!17222 a!3118) (index!24913 lt!261818)))))

(declare-fun c!65696 () Bool)

(assert (=> b!573388 (= c!65696 (= lt!261819 k!1914))))

(declare-fun b!573385 () Bool)

(assert (=> b!573385 (= e!329849 (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261818) (index!24913 lt!261818) (index!24913 lt!261818) k!1914 a!3118 mask!3119))))

(declare-fun d!84885 () Bool)

(declare-fun lt!261817 () SeekEntryResult!5671)

(assert (=> d!84885 (and (or (is-Undefined!5671 lt!261817) (not (is-Found!5671 lt!261817)) (and (bvsge (index!24912 lt!261817) #b00000000000000000000000000000000) (bvslt (index!24912 lt!261817) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261817) (is-Found!5671 lt!261817) (not (is-MissingZero!5671 lt!261817)) (and (bvsge (index!24911 lt!261817) #b00000000000000000000000000000000) (bvslt (index!24911 lt!261817) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261817) (is-Found!5671 lt!261817) (is-MissingZero!5671 lt!261817) (not (is-MissingVacant!5671 lt!261817)) (and (bvsge (index!24914 lt!261817) #b00000000000000000000000000000000) (bvslt (index!24914 lt!261817) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261817) (ite (is-Found!5671 lt!261817) (= (select (arr!17222 a!3118) (index!24912 lt!261817)) k!1914) (ite (is-MissingZero!5671 lt!261817) (= (select (arr!17222 a!3118) (index!24911 lt!261817)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5671 lt!261817) (= (select (arr!17222 a!3118) (index!24914 lt!261817)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84885 (= lt!261817 e!329851)))

(declare-fun c!65698 () Bool)

(assert (=> d!84885 (= c!65698 (and (is-Intermediate!5671 lt!261818) (undefined!6483 lt!261818)))))

(assert (=> d!84885 (= lt!261818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84885 (validMask!0 mask!3119)))

(assert (=> d!84885 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!261817)))

(assert (= (and d!84885 c!65698) b!573386))

(assert (= (and d!84885 (not c!65698)) b!573388))

(assert (= (and b!573388 c!65696) b!573383))

(assert (= (and b!573388 (not c!65696)) b!573387))

(assert (= (and b!573387 c!65697) b!573384))

(assert (= (and b!573387 (not c!65697)) b!573385))

(declare-fun m!552377 () Bool)

(assert (=> b!573388 m!552377))

(declare-fun m!552379 () Bool)

(assert (=> b!573385 m!552379))

(assert (=> d!84885 m!552201))

(declare-fun m!552381 () Bool)

(assert (=> d!84885 m!552381))

(declare-fun m!552383 () Bool)

(assert (=> d!84885 m!552383))

(declare-fun m!552385 () Bool)

(assert (=> d!84885 m!552385))

(assert (=> d!84885 m!552383))

(declare-fun m!552387 () Bool)

(assert (=> d!84885 m!552387))

(declare-fun m!552389 () Bool)

(assert (=> d!84885 m!552389))

(assert (=> b!573135 d!84885))

(declare-fun b!573442 () Bool)

(declare-fun e!329889 () Bool)

(declare-fun call!32644 () Bool)

(assert (=> b!573442 (= e!329889 call!32644)))

(declare-fun d!84913 () Bool)

(declare-fun res!362728 () Bool)

(declare-fun e!329888 () Bool)

(assert (=> d!84913 (=> res!362728 e!329888)))

(assert (=> d!84913 (= res!362728 (bvsge #b00000000000000000000000000000000 (size!17586 a!3118)))))

(assert (=> d!84913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!329888)))

(declare-fun b!573443 () Bool)

(declare-fun e!329890 () Bool)

(assert (=> b!573443 (= e!329888 e!329890)))

(declare-fun c!65716 () Bool)

(assert (=> b!573443 (= c!65716 (validKeyInArray!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32641 () Bool)

(assert (=> bm!32641 (= call!32644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573444 () Bool)

(assert (=> b!573444 (= e!329890 e!329889)))

(declare-fun lt!261848 () (_ BitVec 64))

(assert (=> b!573444 (= lt!261848 (select (arr!17222 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261847 () Unit!18044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35867 (_ BitVec 64) (_ BitVec 32)) Unit!18044)

(assert (=> b!573444 (= lt!261847 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261848 #b00000000000000000000000000000000))))

(assert (=> b!573444 (arrayContainsKey!0 a!3118 lt!261848 #b00000000000000000000000000000000)))

(declare-fun lt!261846 () Unit!18044)

(assert (=> b!573444 (= lt!261846 lt!261847)))

(declare-fun res!362729 () Bool)

(assert (=> b!573444 (= res!362729 (= (seekEntryOrOpen!0 (select (arr!17222 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5671 #b00000000000000000000000000000000)))))

(assert (=> b!573444 (=> (not res!362729) (not e!329889))))

(declare-fun b!573445 () Bool)

(assert (=> b!573445 (= e!329890 call!32644)))

(assert (= (and d!84913 (not res!362728)) b!573443))

(assert (= (and b!573443 c!65716) b!573444))

(assert (= (and b!573443 (not c!65716)) b!573445))

(assert (= (and b!573444 res!362729) b!573442))

(assert (= (or b!573442 b!573445) bm!32641))

(assert (=> b!573443 m!552267))

(assert (=> b!573443 m!552267))

(assert (=> b!573443 m!552269))

(declare-fun m!552449 () Bool)

(assert (=> bm!32641 m!552449))

(assert (=> b!573444 m!552267))

(declare-fun m!552451 () Bool)

(assert (=> b!573444 m!552451))

(declare-fun m!552453 () Bool)

(assert (=> b!573444 m!552453))

(assert (=> b!573444 m!552267))

(declare-fun m!552455 () Bool)

(assert (=> b!573444 m!552455))

(assert (=> b!573140 d!84913))

(declare-fun d!84931 () Bool)

(declare-fun res!362734 () Bool)

(declare-fun e!329895 () Bool)

(assert (=> d!84931 (=> res!362734 e!329895)))

(assert (=> d!84931 (= res!362734 (= (select (arr!17222 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84931 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!329895)))

(declare-fun b!573450 () Bool)

(declare-fun e!329896 () Bool)

(assert (=> b!573450 (= e!329895 e!329896)))

(declare-fun res!362735 () Bool)

(assert (=> b!573450 (=> (not res!362735) (not e!329896))))

(assert (=> b!573450 (= res!362735 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17586 a!3118)))))

(declare-fun b!573451 () Bool)

(assert (=> b!573451 (= e!329896 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84931 (not res!362734)) b!573450))

(assert (= (and b!573450 res!362735) b!573451))

(assert (=> d!84931 m!552267))

(declare-fun m!552459 () Bool)

(assert (=> b!573451 m!552459))

(assert (=> b!573128 d!84931))

(declare-fun b!573483 () Bool)

(declare-fun lt!261859 () SeekEntryResult!5671)

(assert (=> b!573483 (and (bvsge (index!24913 lt!261859) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261859) (size!17586 lt!261716)))))

(declare-fun res!362749 () Bool)

(assert (=> b!573483 (= res!362749 (= (select (arr!17222 lt!261716) (index!24913 lt!261859)) lt!261715))))

(declare-fun e!329917 () Bool)

(assert (=> b!573483 (=> res!362749 e!329917)))

(declare-fun e!329919 () Bool)

(assert (=> b!573483 (= e!329919 e!329917)))

(declare-fun b!573484 () Bool)

(declare-fun e!329918 () Bool)

(assert (=> b!573484 (= e!329918 (bvsge (x!53772 lt!261859) #b01111111111111111111111111111110))))

(declare-fun b!573485 () Bool)

(assert (=> b!573485 (= e!329918 e!329919)))

(declare-fun res!362748 () Bool)

(assert (=> b!573485 (= res!362748 (and (is-Intermediate!5671 lt!261859) (not (undefined!6483 lt!261859)) (bvslt (x!53772 lt!261859) #b01111111111111111111111111111110) (bvsge (x!53772 lt!261859) #b00000000000000000000000000000000) (bvsge (x!53772 lt!261859) #b00000000000000000000000000000000)))))

(assert (=> b!573485 (=> (not res!362748) (not e!329919))))

(declare-fun b!573486 () Bool)

(declare-fun e!329920 () SeekEntryResult!5671)

(assert (=> b!573486 (= e!329920 (Intermediate!5671 true lt!261720 #b00000000000000000000000000000000))))

(declare-fun b!573487 () Bool)

(declare-fun e!329916 () SeekEntryResult!5671)

(assert (=> b!573487 (= e!329920 e!329916)))

(declare-fun c!65728 () Bool)

(declare-fun lt!261858 () (_ BitVec 64))

(assert (=> b!573487 (= c!65728 (or (= lt!261858 lt!261715) (= (bvadd lt!261858 lt!261858) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573488 () Bool)

(assert (=> b!573488 (= e!329916 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261720 #b00000000000000000000000000000000 mask!3119) lt!261715 lt!261716 mask!3119))))

(declare-fun b!573482 () Bool)

(assert (=> b!573482 (and (bvsge (index!24913 lt!261859) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261859) (size!17586 lt!261716)))))

(assert (=> b!573482 (= e!329917 (= (select (arr!17222 lt!261716) (index!24913 lt!261859)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84935 () Bool)

(assert (=> d!84935 e!329918))

(declare-fun c!65726 () Bool)

(assert (=> d!84935 (= c!65726 (and (is-Intermediate!5671 lt!261859) (undefined!6483 lt!261859)))))

(assert (=> d!84935 (= lt!261859 e!329920)))

(declare-fun c!65727 () Bool)

(assert (=> d!84935 (= c!65727 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84935 (= lt!261858 (select (arr!17222 lt!261716) lt!261720))))

(assert (=> d!84935 (validMask!0 mask!3119)))

(assert (=> d!84935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261720 lt!261715 lt!261716 mask!3119) lt!261859)))

(declare-fun b!573489 () Bool)

(assert (=> b!573489 (and (bvsge (index!24913 lt!261859) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261859) (size!17586 lt!261716)))))

(declare-fun res!362750 () Bool)

(assert (=> b!573489 (= res!362750 (= (select (arr!17222 lt!261716) (index!24913 lt!261859)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573489 (=> res!362750 e!329917)))

(declare-fun b!573490 () Bool)

(assert (=> b!573490 (= e!329916 (Intermediate!5671 false lt!261720 #b00000000000000000000000000000000))))

(assert (= (and d!84935 c!65727) b!573486))

(assert (= (and d!84935 (not c!65727)) b!573487))

(assert (= (and b!573487 c!65728) b!573490))

(assert (= (and b!573487 (not c!65728)) b!573488))

(assert (= (and d!84935 c!65726) b!573484))

(assert (= (and d!84935 (not c!65726)) b!573485))

(assert (= (and b!573485 res!362748) b!573483))

(assert (= (and b!573483 (not res!362749)) b!573489))

(assert (= (and b!573489 (not res!362750)) b!573482))

(declare-fun m!552469 () Bool)

(assert (=> b!573488 m!552469))

(assert (=> b!573488 m!552469))

(declare-fun m!552471 () Bool)

(assert (=> b!573488 m!552471))

(declare-fun m!552473 () Bool)

(assert (=> b!573483 m!552473))

(assert (=> b!573489 m!552473))

(assert (=> b!573482 m!552473))

(declare-fun m!552475 () Bool)

(assert (=> d!84935 m!552475))

(assert (=> d!84935 m!552201))

(assert (=> b!573129 d!84935))

(declare-fun b!573492 () Bool)

(declare-fun lt!261861 () SeekEntryResult!5671)

(assert (=> b!573492 (and (bvsge (index!24913 lt!261861) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261861) (size!17586 a!3118)))))

(declare-fun res!362752 () Bool)

(assert (=> b!573492 (= res!362752 (= (select (arr!17222 a!3118) (index!24913 lt!261861)) (select (arr!17222 a!3118) j!142)))))

(declare-fun e!329922 () Bool)

(assert (=> b!573492 (=> res!362752 e!329922)))

(declare-fun e!329924 () Bool)

(assert (=> b!573492 (= e!329924 e!329922)))

(declare-fun b!573493 () Bool)

(declare-fun e!329923 () Bool)

(assert (=> b!573493 (= e!329923 (bvsge (x!53772 lt!261861) #b01111111111111111111111111111110))))

(declare-fun b!573494 () Bool)

(assert (=> b!573494 (= e!329923 e!329924)))

(declare-fun res!362751 () Bool)

(assert (=> b!573494 (= res!362751 (and (is-Intermediate!5671 lt!261861) (not (undefined!6483 lt!261861)) (bvslt (x!53772 lt!261861) #b01111111111111111111111111111110) (bvsge (x!53772 lt!261861) #b00000000000000000000000000000000) (bvsge (x!53772 lt!261861) #b00000000000000000000000000000000)))))

(assert (=> b!573494 (=> (not res!362751) (not e!329924))))

(declare-fun b!573495 () Bool)

(declare-fun e!329925 () SeekEntryResult!5671)

(assert (=> b!573495 (= e!329925 (Intermediate!5671 true lt!261717 #b00000000000000000000000000000000))))

(declare-fun b!573496 () Bool)

(declare-fun e!329921 () SeekEntryResult!5671)

(assert (=> b!573496 (= e!329925 e!329921)))

(declare-fun lt!261860 () (_ BitVec 64))

(declare-fun c!65731 () Bool)

(assert (=> b!573496 (= c!65731 (or (= lt!261860 (select (arr!17222 a!3118) j!142)) (= (bvadd lt!261860 lt!261860) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573497 () Bool)

(assert (=> b!573497 (= e!329921 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261717 #b00000000000000000000000000000000 mask!3119) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573491 () Bool)

(assert (=> b!573491 (and (bvsge (index!24913 lt!261861) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261861) (size!17586 a!3118)))))

(assert (=> b!573491 (= e!329922 (= (select (arr!17222 a!3118) (index!24913 lt!261861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84939 () Bool)

(assert (=> d!84939 e!329923))

(declare-fun c!65729 () Bool)

(assert (=> d!84939 (= c!65729 (and (is-Intermediate!5671 lt!261861) (undefined!6483 lt!261861)))))

(assert (=> d!84939 (= lt!261861 e!329925)))

(declare-fun c!65730 () Bool)

(assert (=> d!84939 (= c!65730 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84939 (= lt!261860 (select (arr!17222 a!3118) lt!261717))))

(assert (=> d!84939 (validMask!0 mask!3119)))

(assert (=> d!84939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261717 (select (arr!17222 a!3118) j!142) a!3118 mask!3119) lt!261861)))

(declare-fun b!573498 () Bool)

(assert (=> b!573498 (and (bvsge (index!24913 lt!261861) #b00000000000000000000000000000000) (bvslt (index!24913 lt!261861) (size!17586 a!3118)))))

(declare-fun res!362753 () Bool)

(assert (=> b!573498 (= res!362753 (= (select (arr!17222 a!3118) (index!24913 lt!261861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573498 (=> res!362753 e!329922)))

(declare-fun b!573499 () Bool)

(assert (=> b!573499 (= e!329921 (Intermediate!5671 false lt!261717 #b00000000000000000000000000000000))))

(assert (= (and d!84939 c!65730) b!573495))

(assert (= (and d!84939 (not c!65730)) b!573496))

(assert (= (and b!573496 c!65731) b!573499))

(assert (= (and b!573496 (not c!65731)) b!573497))

(assert (= (and d!84939 c!65729) b!573493))

(assert (= (and d!84939 (not c!65729)) b!573494))

(assert (= (and b!573494 res!362751) b!573492))

(assert (= (and b!573492 (not res!362752)) b!573498))

(assert (= (and b!573498 (not res!362753)) b!573491))

(declare-fun m!552477 () Bool)

(assert (=> b!573497 m!552477))

(assert (=> b!573497 m!552477))

(assert (=> b!573497 m!552193))

(declare-fun m!552479 () Bool)

(assert (=> b!573497 m!552479))

(declare-fun m!552481 () Bool)

(assert (=> b!573492 m!552481))

(assert (=> b!573498 m!552481))

(assert (=> b!573491 m!552481))

(declare-fun m!552483 () Bool)

(assert (=> d!84939 m!552483))

(assert (=> d!84939 m!552201))

(assert (=> b!573129 d!84939))

(declare-fun d!84941 () Bool)

(declare-fun lt!261867 () (_ BitVec 32))

(declare-fun lt!261866 () (_ BitVec 32))

(assert (=> d!84941 (= lt!261867 (bvmul (bvxor lt!261866 (bvlshr lt!261866 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84941 (= lt!261866 ((_ extract 31 0) (bvand (bvxor lt!261715 (bvlshr lt!261715 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84941 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362754 (let ((h!12328 ((_ extract 31 0) (bvand (bvxor lt!261715 (bvlshr lt!261715 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53781 (bvmul (bvxor h!12328 (bvlshr h!12328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53781 (bvlshr x!53781 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362754 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362754 #b00000000000000000000000000000000))))))

(assert (=> d!84941 (= (toIndex!0 lt!261715 mask!3119) (bvand (bvxor lt!261867 (bvlshr lt!261867 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573129 d!84941))

(declare-fun d!84943 () Bool)

(declare-fun lt!261869 () (_ BitVec 32))

(declare-fun lt!261868 () (_ BitVec 32))

(assert (=> d!84943 (= lt!261869 (bvmul (bvxor lt!261868 (bvlshr lt!261868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84943 (= lt!261868 ((_ extract 31 0) (bvand (bvxor (select (arr!17222 a!3118) j!142) (bvlshr (select (arr!17222 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84943 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362754 (let ((h!12328 ((_ extract 31 0) (bvand (bvxor (select (arr!17222 a!3118) j!142) (bvlshr (select (arr!17222 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53781 (bvmul (bvxor h!12328 (bvlshr h!12328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53781 (bvlshr x!53781 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362754 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362754 #b00000000000000000000000000000000))))))

(assert (=> d!84943 (= (toIndex!0 (select (arr!17222 a!3118) j!142) mask!3119) (bvand (bvxor lt!261869 (bvlshr lt!261869 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573129 d!84943))

(declare-fun b!573500 () Bool)

(declare-fun e!329927 () SeekEntryResult!5671)

(declare-fun lt!261871 () SeekEntryResult!5671)

(assert (=> b!573500 (= e!329927 (Found!5671 (index!24913 lt!261871)))))

(declare-fun b!573501 () Bool)

(declare-fun e!329926 () SeekEntryResult!5671)

(assert (=> b!573501 (= e!329926 (MissingZero!5671 (index!24913 lt!261871)))))

(declare-fun b!573503 () Bool)

(declare-fun e!329928 () SeekEntryResult!5671)

(assert (=> b!573503 (= e!329928 Undefined!5671)))

(declare-fun b!573504 () Bool)

(declare-fun c!65733 () Bool)

(declare-fun lt!261872 () (_ BitVec 64))

(assert (=> b!573504 (= c!65733 (= lt!261872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573504 (= e!329927 e!329926)))

(declare-fun b!573505 () Bool)

(assert (=> b!573505 (= e!329928 e!329927)))

(assert (=> b!573505 (= lt!261872 (select (arr!17222 a!3118) (index!24913 lt!261871)))))

(declare-fun c!65732 () Bool)

(assert (=> b!573505 (= c!65732 (= lt!261872 (select (arr!17222 a!3118) j!142)))))

(declare-fun b!573502 () Bool)

(assert (=> b!573502 (= e!329926 (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261871) (index!24913 lt!261871) (index!24913 lt!261871) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84945 () Bool)

(declare-fun lt!261870 () SeekEntryResult!5671)

(assert (=> d!84945 (and (or (is-Undefined!5671 lt!261870) (not (is-Found!5671 lt!261870)) (and (bvsge (index!24912 lt!261870) #b00000000000000000000000000000000) (bvslt (index!24912 lt!261870) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261870) (is-Found!5671 lt!261870) (not (is-MissingZero!5671 lt!261870)) (and (bvsge (index!24911 lt!261870) #b00000000000000000000000000000000) (bvslt (index!24911 lt!261870) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261870) (is-Found!5671 lt!261870) (is-MissingZero!5671 lt!261870) (not (is-MissingVacant!5671 lt!261870)) (and (bvsge (index!24914 lt!261870) #b00000000000000000000000000000000) (bvslt (index!24914 lt!261870) (size!17586 a!3118)))) (or (is-Undefined!5671 lt!261870) (ite (is-Found!5671 lt!261870) (= (select (arr!17222 a!3118) (index!24912 lt!261870)) (select (arr!17222 a!3118) j!142)) (ite (is-MissingZero!5671 lt!261870) (= (select (arr!17222 a!3118) (index!24911 lt!261870)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5671 lt!261870) (= (select (arr!17222 a!3118) (index!24914 lt!261870)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84945 (= lt!261870 e!329928)))

(declare-fun c!65734 () Bool)

(assert (=> d!84945 (= c!65734 (and (is-Intermediate!5671 lt!261871) (undefined!6483 lt!261871)))))

(assert (=> d!84945 (= lt!261871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17222 a!3118) j!142) mask!3119) (select (arr!17222 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84945 (validMask!0 mask!3119)))

(assert (=> d!84945 (= (seekEntryOrOpen!0 (select (arr!17222 a!3118) j!142) a!3118 mask!3119) lt!261870)))

(assert (= (and d!84945 c!65734) b!573503))

(assert (= (and d!84945 (not c!65734)) b!573505))

(assert (= (and b!573505 c!65732) b!573500))

(assert (= (and b!573505 (not c!65732)) b!573504))

(assert (= (and b!573504 c!65733) b!573501))

(assert (= (and b!573504 (not c!65733)) b!573502))

(declare-fun m!552485 () Bool)

(assert (=> b!573505 m!552485))

(assert (=> b!573502 m!552193))

(declare-fun m!552487 () Bool)

(assert (=> b!573502 m!552487))

(assert (=> d!84945 m!552201))

(declare-fun m!552489 () Bool)

(assert (=> d!84945 m!552489))

(assert (=> d!84945 m!552193))

(assert (=> d!84945 m!552219))

(declare-fun m!552491 () Bool)

(assert (=> d!84945 m!552491))

(assert (=> d!84945 m!552219))

(assert (=> d!84945 m!552193))

(declare-fun m!552493 () Bool)

(assert (=> d!84945 m!552493))

(declare-fun m!552495 () Bool)

(assert (=> d!84945 m!552495))

(assert (=> b!573134 d!84945))

(declare-fun b!573506 () Bool)

(declare-fun e!329930 () Bool)

(declare-fun call!32645 () Bool)

(assert (=> b!573506 (= e!329930 call!32645)))

(declare-fun d!84947 () Bool)

(declare-fun res!362755 () Bool)

(declare-fun e!329929 () Bool)

(assert (=> d!84947 (=> res!362755 e!329929)))

(assert (=> d!84947 (= res!362755 (bvsge j!142 (size!17586 a!3118)))))

(assert (=> d!84947 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!329929)))

(declare-fun b!573507 () Bool)

(declare-fun e!329931 () Bool)

(assert (=> b!573507 (= e!329929 e!329931)))

(declare-fun c!65735 () Bool)

(assert (=> b!573507 (= c!65735 (validKeyInArray!0 (select (arr!17222 a!3118) j!142)))))

(declare-fun bm!32642 () Bool)

(assert (=> bm!32642 (= call!32645 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573508 () Bool)

(assert (=> b!573508 (= e!329931 e!329930)))

(declare-fun lt!261875 () (_ BitVec 64))

(assert (=> b!573508 (= lt!261875 (select (arr!17222 a!3118) j!142))))

(declare-fun lt!261874 () Unit!18044)

(assert (=> b!573508 (= lt!261874 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261875 j!142))))

(assert (=> b!573508 (arrayContainsKey!0 a!3118 lt!261875 #b00000000000000000000000000000000)))

(declare-fun lt!261873 () Unit!18044)

(assert (=> b!573508 (= lt!261873 lt!261874)))

(declare-fun res!362756 () Bool)

(assert (=> b!573508 (= res!362756 (= (seekEntryOrOpen!0 (select (arr!17222 a!3118) j!142) a!3118 mask!3119) (Found!5671 j!142)))))

(assert (=> b!573508 (=> (not res!362756) (not e!329930))))

(declare-fun b!573509 () Bool)

(assert (=> b!573509 (= e!329931 call!32645)))

(assert (= (and d!84947 (not res!362755)) b!573507))

(assert (= (and b!573507 c!65735) b!573508))

(assert (= (and b!573507 (not c!65735)) b!573509))

(assert (= (and b!573508 res!362756) b!573506))

(assert (= (or b!573506 b!573509) bm!32642))

(assert (=> b!573507 m!552193))

(assert (=> b!573507 m!552193))

(assert (=> b!573507 m!552195))

(declare-fun m!552497 () Bool)

(assert (=> bm!32642 m!552497))

(assert (=> b!573508 m!552193))

(declare-fun m!552499 () Bool)

(assert (=> b!573508 m!552499))

(declare-fun m!552501 () Bool)

(assert (=> b!573508 m!552501))

(assert (=> b!573508 m!552193))

(assert (=> b!573508 m!552211))

(assert (=> b!573134 d!84947))

(declare-fun d!84949 () Bool)

(assert (=> d!84949 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!261878 () Unit!18044)

(declare-fun choose!38 (array!35867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18044)

(assert (=> d!84949 (= lt!261878 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84949 (validMask!0 mask!3119)))

(assert (=> d!84949 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!261878)))

(declare-fun bs!17757 () Bool)

(assert (= bs!17757 d!84949))

(assert (=> bs!17757 m!552205))

(declare-fun m!552503 () Bool)

(assert (=> bs!17757 m!552503))

(assert (=> bs!17757 m!552201))

(assert (=> b!573134 d!84949))

(declare-fun b!573510 () Bool)

(declare-fun e!329933 () SeekEntryResult!5671)

(declare-fun lt!261880 () SeekEntryResult!5671)

(assert (=> b!573510 (= e!329933 (Found!5671 (index!24913 lt!261880)))))

(declare-fun b!573511 () Bool)

(declare-fun e!329932 () SeekEntryResult!5671)

(assert (=> b!573511 (= e!329932 (MissingZero!5671 (index!24913 lt!261880)))))

(declare-fun b!573513 () Bool)

(declare-fun e!329934 () SeekEntryResult!5671)

(assert (=> b!573513 (= e!329934 Undefined!5671)))

(declare-fun b!573514 () Bool)

(declare-fun c!65737 () Bool)

(declare-fun lt!261881 () (_ BitVec 64))

(assert (=> b!573514 (= c!65737 (= lt!261881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573514 (= e!329933 e!329932)))

(declare-fun b!573515 () Bool)

(assert (=> b!573515 (= e!329934 e!329933)))

(assert (=> b!573515 (= lt!261881 (select (arr!17222 lt!261716) (index!24913 lt!261880)))))

(declare-fun c!65736 () Bool)

(assert (=> b!573515 (= c!65736 (= lt!261881 lt!261715))))

(declare-fun b!573512 () Bool)

(assert (=> b!573512 (= e!329932 (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261880) (index!24913 lt!261880) (index!24913 lt!261880) lt!261715 lt!261716 mask!3119))))

(declare-fun d!84951 () Bool)

(declare-fun lt!261879 () SeekEntryResult!5671)

(assert (=> d!84951 (and (or (is-Undefined!5671 lt!261879) (not (is-Found!5671 lt!261879)) (and (bvsge (index!24912 lt!261879) #b00000000000000000000000000000000) (bvslt (index!24912 lt!261879) (size!17586 lt!261716)))) (or (is-Undefined!5671 lt!261879) (is-Found!5671 lt!261879) (not (is-MissingZero!5671 lt!261879)) (and (bvsge (index!24911 lt!261879) #b00000000000000000000000000000000) (bvslt (index!24911 lt!261879) (size!17586 lt!261716)))) (or (is-Undefined!5671 lt!261879) (is-Found!5671 lt!261879) (is-MissingZero!5671 lt!261879) (not (is-MissingVacant!5671 lt!261879)) (and (bvsge (index!24914 lt!261879) #b00000000000000000000000000000000) (bvslt (index!24914 lt!261879) (size!17586 lt!261716)))) (or (is-Undefined!5671 lt!261879) (ite (is-Found!5671 lt!261879) (= (select (arr!17222 lt!261716) (index!24912 lt!261879)) lt!261715) (ite (is-MissingZero!5671 lt!261879) (= (select (arr!17222 lt!261716) (index!24911 lt!261879)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5671 lt!261879) (= (select (arr!17222 lt!261716) (index!24914 lt!261879)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84951 (= lt!261879 e!329934)))

(declare-fun c!65738 () Bool)

(assert (=> d!84951 (= c!65738 (and (is-Intermediate!5671 lt!261880) (undefined!6483 lt!261880)))))

(assert (=> d!84951 (= lt!261880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261715 mask!3119) lt!261715 lt!261716 mask!3119))))

(assert (=> d!84951 (validMask!0 mask!3119)))

(assert (=> d!84951 (= (seekEntryOrOpen!0 lt!261715 lt!261716 mask!3119) lt!261879)))

(assert (= (and d!84951 c!65738) b!573513))

(assert (= (and d!84951 (not c!65738)) b!573515))

(assert (= (and b!573515 c!65736) b!573510))

(assert (= (and b!573515 (not c!65736)) b!573514))

(assert (= (and b!573514 c!65737) b!573511))

(assert (= (and b!573514 (not c!65737)) b!573512))

(declare-fun m!552505 () Bool)

(assert (=> b!573515 m!552505))

(declare-fun m!552507 () Bool)

(assert (=> b!573512 m!552507))

(assert (=> d!84951 m!552201))

(declare-fun m!552509 () Bool)

(assert (=> d!84951 m!552509))

(assert (=> d!84951 m!552229))

(declare-fun m!552511 () Bool)

(assert (=> d!84951 m!552511))

(assert (=> d!84951 m!552229))

(declare-fun m!552513 () Bool)

(assert (=> d!84951 m!552513))

(declare-fun m!552515 () Bool)

(assert (=> d!84951 m!552515))

(assert (=> b!573132 d!84951))

(declare-fun b!573516 () Bool)

(declare-fun e!329935 () SeekEntryResult!5671)

(assert (=> b!573516 (= e!329935 (Found!5671 (index!24913 lt!261718)))))

(declare-fun b!573517 () Bool)

(declare-fun e!329937 () SeekEntryResult!5671)

(assert (=> b!573517 (= e!329937 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53772 lt!261718) #b00000000000000000000000000000001) (nextIndex!0 (index!24913 lt!261718) (x!53772 lt!261718) mask!3119) (index!24913 lt!261718) lt!261715 lt!261716 mask!3119))))

(declare-fun b!573518 () Bool)

(assert (=> b!573518 (= e!329937 (MissingVacant!5671 (index!24913 lt!261718)))))

(declare-fun lt!261883 () SeekEntryResult!5671)

(declare-fun d!84953 () Bool)

(assert (=> d!84953 (and (or (is-Undefined!5671 lt!261883) (not (is-Found!5671 lt!261883)) (and (bvsge (index!24912 lt!261883) #b00000000000000000000000000000000) (bvslt (index!24912 lt!261883) (size!17586 lt!261716)))) (or (is-Undefined!5671 lt!261883) (is-Found!5671 lt!261883) (not (is-MissingVacant!5671 lt!261883)) (not (= (index!24914 lt!261883) (index!24913 lt!261718))) (and (bvsge (index!24914 lt!261883) #b00000000000000000000000000000000) (bvslt (index!24914 lt!261883) (size!17586 lt!261716)))) (or (is-Undefined!5671 lt!261883) (ite (is-Found!5671 lt!261883) (= (select (arr!17222 lt!261716) (index!24912 lt!261883)) lt!261715) (and (is-MissingVacant!5671 lt!261883) (= (index!24914 lt!261883) (index!24913 lt!261718)) (= (select (arr!17222 lt!261716) (index!24914 lt!261883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!329936 () SeekEntryResult!5671)

(assert (=> d!84953 (= lt!261883 e!329936)))

(declare-fun c!65740 () Bool)

(assert (=> d!84953 (= c!65740 (bvsge (x!53772 lt!261718) #b01111111111111111111111111111110))))

(declare-fun lt!261882 () (_ BitVec 64))

(assert (=> d!84953 (= lt!261882 (select (arr!17222 lt!261716) (index!24913 lt!261718)))))

(assert (=> d!84953 (validMask!0 mask!3119)))

(assert (=> d!84953 (= (seekKeyOrZeroReturnVacant!0 (x!53772 lt!261718) (index!24913 lt!261718) (index!24913 lt!261718) lt!261715 lt!261716 mask!3119) lt!261883)))

(declare-fun b!573519 () Bool)

(assert (=> b!573519 (= e!329936 e!329935)))

(declare-fun c!65739 () Bool)

(assert (=> b!573519 (= c!65739 (= lt!261882 lt!261715))))

(declare-fun b!573520 () Bool)

(declare-fun c!65741 () Bool)

(assert (=> b!573520 (= c!65741 (= lt!261882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573520 (= e!329935 e!329937)))

(declare-fun b!573521 () Bool)

(assert (=> b!573521 (= e!329936 Undefined!5671)))

(assert (= (and d!84953 c!65740) b!573521))

(assert (= (and d!84953 (not c!65740)) b!573519))

(assert (= (and b!573519 c!65739) b!573516))

(assert (= (and b!573519 (not c!65739)) b!573520))

(assert (= (and b!573520 c!65741) b!573518))

(assert (= (and b!573520 (not c!65741)) b!573517))

(assert (=> b!573517 m!552303))

(assert (=> b!573517 m!552303))

(declare-fun m!552517 () Bool)

(assert (=> b!573517 m!552517))

(declare-fun m!552519 () Bool)

(assert (=> d!84953 m!552519))

(declare-fun m!552521 () Bool)

(assert (=> d!84953 m!552521))

(declare-fun m!552523 () Bool)

(assert (=> d!84953 m!552523))

(assert (=> d!84953 m!552201))

(assert (=> b!573132 d!84953))

(declare-fun d!84955 () Bool)

(assert (=> d!84955 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573138 d!84955))

(push 1)

