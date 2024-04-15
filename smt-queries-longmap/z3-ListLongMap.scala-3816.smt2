; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52304 () Bool)

(assert start!52304)

(declare-fun b!570753 () Bool)

(declare-fun e!328236 () Bool)

(declare-fun e!328237 () Bool)

(assert (=> b!570753 (= e!328236 (not e!328237))))

(declare-fun res!360684 () Bool)

(assert (=> b!570753 (=> res!360684 e!328237)))

(declare-datatypes ((SeekEntryResult!5623 0))(
  ( (MissingZero!5623 (index!24719 (_ BitVec 32))) (Found!5623 (index!24720 (_ BitVec 32))) (Intermediate!5623 (undefined!6435 Bool) (index!24721 (_ BitVec 32)) (x!53598 (_ BitVec 32))) (Undefined!5623) (MissingVacant!5623 (index!24722 (_ BitVec 32))) )
))
(declare-fun lt!260129 () SeekEntryResult!5623)

(get-info :version)

(assert (=> b!570753 (= res!360684 (or (undefined!6435 lt!260129) (not ((_ is Intermediate!5623) lt!260129))))))

(declare-fun e!328234 () Bool)

(assert (=> b!570753 e!328234))

(declare-fun res!360685 () Bool)

(assert (=> b!570753 (=> (not res!360685) (not e!328234))))

(declare-fun lt!260123 () SeekEntryResult!5623)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570753 (= res!360685 (= lt!260123 (Found!5623 j!142)))))

(declare-datatypes ((array!35773 0))(
  ( (array!35774 (arr!17177 (Array (_ BitVec 32) (_ BitVec 64))) (size!17542 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35773)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35773 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!570753 (= lt!260123 (seekEntryOrOpen!0 (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35773 (_ BitVec 32)) Bool)

(assert (=> b!570753 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17934 0))(
  ( (Unit!17935) )
))
(declare-fun lt!260122 () Unit!17934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17934)

(assert (=> b!570753 (= lt!260122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570754 () Bool)

(declare-fun e!328231 () Bool)

(assert (=> b!570754 (= e!328237 e!328231)))

(declare-fun res!360683 () Bool)

(assert (=> b!570754 (=> res!360683 e!328231)))

(declare-fun lt!260131 () (_ BitVec 64))

(assert (=> b!570754 (= res!360683 (or (= lt!260131 (select (arr!17177 a!3118) j!142)) (= lt!260131 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!570754 (= lt!260131 (select (arr!17177 a!3118) (index!24721 lt!260129)))))

(declare-fun b!570755 () Bool)

(declare-fun e!328238 () Bool)

(declare-fun e!328233 () Bool)

(assert (=> b!570755 (= e!328238 e!328233)))

(declare-fun res!360677 () Bool)

(assert (=> b!570755 (=> res!360677 e!328233)))

(declare-fun lt!260125 () (_ BitVec 64))

(assert (=> b!570755 (= res!360677 (or (= lt!260125 (select (arr!17177 a!3118) j!142)) (= lt!260125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!570755 (= lt!260125 (select (arr!17177 a!3118) (index!24721 lt!260129)))))

(declare-fun b!570756 () Bool)

(declare-fun res!360689 () Bool)

(declare-fun e!328235 () Bool)

(assert (=> b!570756 (=> (not res!360689) (not e!328235))))

(declare-datatypes ((List!11296 0))(
  ( (Nil!11293) (Cons!11292 (h!12316 (_ BitVec 64)) (t!17515 List!11296)) )
))
(declare-fun arrayNoDuplicates!0 (array!35773 (_ BitVec 32) List!11296) Bool)

(assert (=> b!570756 (= res!360689 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11293))))

(declare-fun b!570757 () Bool)

(declare-fun res!360676 () Bool)

(declare-fun e!328239 () Bool)

(assert (=> b!570757 (=> (not res!360676) (not e!328239))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570757 (= res!360676 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570759 () Bool)

(declare-fun res!360688 () Bool)

(assert (=> b!570759 (=> (not res!360688) (not e!328239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570759 (= res!360688 (validKeyInArray!0 (select (arr!17177 a!3118) j!142)))))

(declare-fun b!570760 () Bool)

(declare-fun res!360678 () Bool)

(assert (=> b!570760 (=> (not res!360678) (not e!328239))))

(assert (=> b!570760 (= res!360678 (validKeyInArray!0 k0!1914))))

(declare-fun b!570761 () Bool)

(declare-fun lt!260127 () (_ BitVec 64))

(declare-fun lt!260124 () array!35773)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35773 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!570761 (= e!328231 (= (seekEntryOrOpen!0 lt!260127 lt!260124 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260129) (index!24721 lt!260129) (index!24721 lt!260129) lt!260127 lt!260124 mask!3119)))))

(declare-fun b!570762 () Bool)

(declare-fun res!360680 () Bool)

(assert (=> b!570762 (=> (not res!360680) (not e!328239))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570762 (= res!360680 (and (= (size!17542 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17542 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17542 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570763 () Bool)

(assert (=> b!570763 (= e!328235 e!328236)))

(declare-fun res!360681 () Bool)

(assert (=> b!570763 (=> (not res!360681) (not e!328236))))

(declare-fun lt!260130 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35773 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!570763 (= res!360681 (= lt!260129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260130 lt!260127 lt!260124 mask!3119)))))

(declare-fun lt!260128 () (_ BitVec 32))

(assert (=> b!570763 (= lt!260129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260128 (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570763 (= lt!260130 (toIndex!0 lt!260127 mask!3119))))

(assert (=> b!570763 (= lt!260127 (select (store (arr!17177 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!570763 (= lt!260128 (toIndex!0 (select (arr!17177 a!3118) j!142) mask!3119))))

(assert (=> b!570763 (= lt!260124 (array!35774 (store (arr!17177 a!3118) i!1132 k0!1914) (size!17542 a!3118)))))

(declare-fun b!570764 () Bool)

(assert (=> b!570764 (= e!328234 e!328238)))

(declare-fun res!360687 () Bool)

(assert (=> b!570764 (=> res!360687 e!328238)))

(assert (=> b!570764 (= res!360687 (or (undefined!6435 lt!260129) (not ((_ is Intermediate!5623) lt!260129))))))

(declare-fun b!570765 () Bool)

(assert (=> b!570765 (= e!328233 (= lt!260123 (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260129) (index!24721 lt!260129) (index!24721 lt!260129) (select (arr!17177 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570766 () Bool)

(assert (=> b!570766 (= e!328239 e!328235)))

(declare-fun res!360682 () Bool)

(assert (=> b!570766 (=> (not res!360682) (not e!328235))))

(declare-fun lt!260126 () SeekEntryResult!5623)

(assert (=> b!570766 (= res!360682 (or (= lt!260126 (MissingZero!5623 i!1132)) (= lt!260126 (MissingVacant!5623 i!1132))))))

(assert (=> b!570766 (= lt!260126 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570758 () Bool)

(declare-fun res!360686 () Bool)

(assert (=> b!570758 (=> (not res!360686) (not e!328235))))

(assert (=> b!570758 (= res!360686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!360679 () Bool)

(assert (=> start!52304 (=> (not res!360679) (not e!328239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52304 (= res!360679 (validMask!0 mask!3119))))

(assert (=> start!52304 e!328239))

(assert (=> start!52304 true))

(declare-fun array_inv!13060 (array!35773) Bool)

(assert (=> start!52304 (array_inv!13060 a!3118)))

(assert (= (and start!52304 res!360679) b!570762))

(assert (= (and b!570762 res!360680) b!570759))

(assert (= (and b!570759 res!360688) b!570760))

(assert (= (and b!570760 res!360678) b!570757))

(assert (= (and b!570757 res!360676) b!570766))

(assert (= (and b!570766 res!360682) b!570758))

(assert (= (and b!570758 res!360686) b!570756))

(assert (= (and b!570756 res!360689) b!570763))

(assert (= (and b!570763 res!360681) b!570753))

(assert (= (and b!570753 res!360685) b!570764))

(assert (= (and b!570764 (not res!360687)) b!570755))

(assert (= (and b!570755 (not res!360677)) b!570765))

(assert (= (and b!570753 (not res!360684)) b!570754))

(assert (= (and b!570754 (not res!360683)) b!570761))

(declare-fun m!549197 () Bool)

(assert (=> b!570756 m!549197))

(declare-fun m!549199 () Bool)

(assert (=> b!570753 m!549199))

(assert (=> b!570753 m!549199))

(declare-fun m!549201 () Bool)

(assert (=> b!570753 m!549201))

(declare-fun m!549203 () Bool)

(assert (=> b!570753 m!549203))

(declare-fun m!549205 () Bool)

(assert (=> b!570753 m!549205))

(assert (=> b!570765 m!549199))

(assert (=> b!570765 m!549199))

(declare-fun m!549207 () Bool)

(assert (=> b!570765 m!549207))

(declare-fun m!549209 () Bool)

(assert (=> start!52304 m!549209))

(declare-fun m!549211 () Bool)

(assert (=> start!52304 m!549211))

(declare-fun m!549213 () Bool)

(assert (=> b!570760 m!549213))

(declare-fun m!549215 () Bool)

(assert (=> b!570758 m!549215))

(assert (=> b!570755 m!549199))

(declare-fun m!549217 () Bool)

(assert (=> b!570755 m!549217))

(declare-fun m!549219 () Bool)

(assert (=> b!570757 m!549219))

(assert (=> b!570759 m!549199))

(assert (=> b!570759 m!549199))

(declare-fun m!549221 () Bool)

(assert (=> b!570759 m!549221))

(declare-fun m!549223 () Bool)

(assert (=> b!570761 m!549223))

(declare-fun m!549225 () Bool)

(assert (=> b!570761 m!549225))

(assert (=> b!570754 m!549199))

(assert (=> b!570754 m!549217))

(declare-fun m!549227 () Bool)

(assert (=> b!570763 m!549227))

(assert (=> b!570763 m!549199))

(declare-fun m!549229 () Bool)

(assert (=> b!570763 m!549229))

(assert (=> b!570763 m!549199))

(declare-fun m!549231 () Bool)

(assert (=> b!570763 m!549231))

(declare-fun m!549233 () Bool)

(assert (=> b!570763 m!549233))

(declare-fun m!549235 () Bool)

(assert (=> b!570763 m!549235))

(assert (=> b!570763 m!549199))

(declare-fun m!549237 () Bool)

(assert (=> b!570763 m!549237))

(declare-fun m!549239 () Bool)

(assert (=> b!570766 m!549239))

(check-sat (not b!570766) (not b!570760) (not b!570756) (not b!570753) (not b!570765) (not b!570761) (not b!570759) (not b!570757) (not b!570763) (not b!570758) (not start!52304))
(check-sat)
(get-model)

(declare-fun d!84505 () Bool)

(assert (=> d!84505 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570760 d!84505))

(declare-fun d!84507 () Bool)

(assert (=> d!84507 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52304 d!84507))

(declare-fun d!84509 () Bool)

(assert (=> d!84509 (= (array_inv!13060 a!3118) (bvsge (size!17542 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52304 d!84509))

(declare-fun b!570863 () Bool)

(declare-fun e!328300 () SeekEntryResult!5623)

(declare-fun lt!260200 () SeekEntryResult!5623)

(assert (=> b!570863 (= e!328300 (Found!5623 (index!24721 lt!260200)))))

(declare-fun e!328301 () SeekEntryResult!5623)

(declare-fun b!570864 () Bool)

(assert (=> b!570864 (= e!328301 (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260200) (index!24721 lt!260200) (index!24721 lt!260200) lt!260127 lt!260124 mask!3119))))

(declare-fun b!570866 () Bool)

(declare-fun c!65403 () Bool)

(declare-fun lt!260198 () (_ BitVec 64))

(assert (=> b!570866 (= c!65403 (= lt!260198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570866 (= e!328300 e!328301)))

(declare-fun b!570867 () Bool)

(assert (=> b!570867 (= e!328301 (MissingZero!5623 (index!24721 lt!260200)))))

(declare-fun b!570868 () Bool)

(declare-fun e!328302 () SeekEntryResult!5623)

(assert (=> b!570868 (= e!328302 Undefined!5623)))

(declare-fun b!570865 () Bool)

(assert (=> b!570865 (= e!328302 e!328300)))

(assert (=> b!570865 (= lt!260198 (select (arr!17177 lt!260124) (index!24721 lt!260200)))))

(declare-fun c!65402 () Bool)

(assert (=> b!570865 (= c!65402 (= lt!260198 lt!260127))))

(declare-fun d!84511 () Bool)

(declare-fun lt!260199 () SeekEntryResult!5623)

(assert (=> d!84511 (and (or ((_ is Undefined!5623) lt!260199) (not ((_ is Found!5623) lt!260199)) (and (bvsge (index!24720 lt!260199) #b00000000000000000000000000000000) (bvslt (index!24720 lt!260199) (size!17542 lt!260124)))) (or ((_ is Undefined!5623) lt!260199) ((_ is Found!5623) lt!260199) (not ((_ is MissingZero!5623) lt!260199)) (and (bvsge (index!24719 lt!260199) #b00000000000000000000000000000000) (bvslt (index!24719 lt!260199) (size!17542 lt!260124)))) (or ((_ is Undefined!5623) lt!260199) ((_ is Found!5623) lt!260199) ((_ is MissingZero!5623) lt!260199) (not ((_ is MissingVacant!5623) lt!260199)) (and (bvsge (index!24722 lt!260199) #b00000000000000000000000000000000) (bvslt (index!24722 lt!260199) (size!17542 lt!260124)))) (or ((_ is Undefined!5623) lt!260199) (ite ((_ is Found!5623) lt!260199) (= (select (arr!17177 lt!260124) (index!24720 lt!260199)) lt!260127) (ite ((_ is MissingZero!5623) lt!260199) (= (select (arr!17177 lt!260124) (index!24719 lt!260199)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5623) lt!260199) (= (select (arr!17177 lt!260124) (index!24722 lt!260199)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84511 (= lt!260199 e!328302)))

(declare-fun c!65401 () Bool)

(assert (=> d!84511 (= c!65401 (and ((_ is Intermediate!5623) lt!260200) (undefined!6435 lt!260200)))))

(assert (=> d!84511 (= lt!260200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!260127 mask!3119) lt!260127 lt!260124 mask!3119))))

(assert (=> d!84511 (validMask!0 mask!3119)))

(assert (=> d!84511 (= (seekEntryOrOpen!0 lt!260127 lt!260124 mask!3119) lt!260199)))

(assert (= (and d!84511 c!65401) b!570868))

(assert (= (and d!84511 (not c!65401)) b!570865))

(assert (= (and b!570865 c!65402) b!570863))

(assert (= (and b!570865 (not c!65402)) b!570866))

(assert (= (and b!570866 c!65403) b!570867))

(assert (= (and b!570866 (not c!65403)) b!570864))

(declare-fun m!549329 () Bool)

(assert (=> b!570864 m!549329))

(declare-fun m!549331 () Bool)

(assert (=> b!570865 m!549331))

(declare-fun m!549333 () Bool)

(assert (=> d!84511 m!549333))

(declare-fun m!549335 () Bool)

(assert (=> d!84511 m!549335))

(assert (=> d!84511 m!549209))

(declare-fun m!549337 () Bool)

(assert (=> d!84511 m!549337))

(assert (=> d!84511 m!549227))

(assert (=> d!84511 m!549227))

(declare-fun m!549339 () Bool)

(assert (=> d!84511 m!549339))

(assert (=> b!570761 d!84511))

(declare-fun b!570911 () Bool)

(declare-fun e!328332 () SeekEntryResult!5623)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570911 (= e!328332 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53598 lt!260129) #b00000000000000000000000000000001) (nextIndex!0 (index!24721 lt!260129) (x!53598 lt!260129) mask!3119) (index!24721 lt!260129) lt!260127 lt!260124 mask!3119))))

(declare-fun b!570912 () Bool)

(declare-fun e!328331 () SeekEntryResult!5623)

(declare-fun e!328330 () SeekEntryResult!5623)

(assert (=> b!570912 (= e!328331 e!328330)))

(declare-fun c!65421 () Bool)

(declare-fun lt!260220 () (_ BitVec 64))

(assert (=> b!570912 (= c!65421 (= lt!260220 lt!260127))))

(declare-fun b!570913 () Bool)

(assert (=> b!570913 (= e!328330 (Found!5623 (index!24721 lt!260129)))))

(declare-fun d!84515 () Bool)

(declare-fun lt!260221 () SeekEntryResult!5623)

(assert (=> d!84515 (and (or ((_ is Undefined!5623) lt!260221) (not ((_ is Found!5623) lt!260221)) (and (bvsge (index!24720 lt!260221) #b00000000000000000000000000000000) (bvslt (index!24720 lt!260221) (size!17542 lt!260124)))) (or ((_ is Undefined!5623) lt!260221) ((_ is Found!5623) lt!260221) (not ((_ is MissingVacant!5623) lt!260221)) (not (= (index!24722 lt!260221) (index!24721 lt!260129))) (and (bvsge (index!24722 lt!260221) #b00000000000000000000000000000000) (bvslt (index!24722 lt!260221) (size!17542 lt!260124)))) (or ((_ is Undefined!5623) lt!260221) (ite ((_ is Found!5623) lt!260221) (= (select (arr!17177 lt!260124) (index!24720 lt!260221)) lt!260127) (and ((_ is MissingVacant!5623) lt!260221) (= (index!24722 lt!260221) (index!24721 lt!260129)) (= (select (arr!17177 lt!260124) (index!24722 lt!260221)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84515 (= lt!260221 e!328331)))

(declare-fun c!65419 () Bool)

(assert (=> d!84515 (= c!65419 (bvsge (x!53598 lt!260129) #b01111111111111111111111111111110))))

(assert (=> d!84515 (= lt!260220 (select (arr!17177 lt!260124) (index!24721 lt!260129)))))

(assert (=> d!84515 (validMask!0 mask!3119)))

(assert (=> d!84515 (= (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260129) (index!24721 lt!260129) (index!24721 lt!260129) lt!260127 lt!260124 mask!3119) lt!260221)))

(declare-fun b!570914 () Bool)

(declare-fun c!65420 () Bool)

(assert (=> b!570914 (= c!65420 (= lt!260220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570914 (= e!328330 e!328332)))

(declare-fun b!570915 () Bool)

(assert (=> b!570915 (= e!328331 Undefined!5623)))

(declare-fun b!570916 () Bool)

(assert (=> b!570916 (= e!328332 (MissingVacant!5623 (index!24721 lt!260129)))))

(assert (= (and d!84515 c!65419) b!570915))

(assert (= (and d!84515 (not c!65419)) b!570912))

(assert (= (and b!570912 c!65421) b!570913))

(assert (= (and b!570912 (not c!65421)) b!570914))

(assert (= (and b!570914 c!65420) b!570916))

(assert (= (and b!570914 (not c!65420)) b!570911))

(declare-fun m!549355 () Bool)

(assert (=> b!570911 m!549355))

(assert (=> b!570911 m!549355))

(declare-fun m!549357 () Bool)

(assert (=> b!570911 m!549357))

(declare-fun m!549359 () Bool)

(assert (=> d!84515 m!549359))

(declare-fun m!549361 () Bool)

(assert (=> d!84515 m!549361))

(declare-fun m!549363 () Bool)

(assert (=> d!84515 m!549363))

(assert (=> d!84515 m!549209))

(assert (=> b!570761 d!84515))

(declare-fun b!570937 () Bool)

(declare-fun e!328348 () Bool)

(declare-fun e!328347 () Bool)

(assert (=> b!570937 (= e!328348 e!328347)))

(declare-fun c!65429 () Bool)

(assert (=> b!570937 (= c!65429 (validKeyInArray!0 (select (arr!17177 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570938 () Bool)

(declare-fun e!328346 () Bool)

(declare-fun call!32584 () Bool)

(assert (=> b!570938 (= e!328346 call!32584)))

(declare-fun d!84525 () Bool)

(declare-fun res!360793 () Bool)

(assert (=> d!84525 (=> res!360793 e!328348)))

(assert (=> d!84525 (= res!360793 (bvsge #b00000000000000000000000000000000 (size!17542 a!3118)))))

(assert (=> d!84525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!328348)))

(declare-fun b!570939 () Bool)

(assert (=> b!570939 (= e!328347 call!32584)))

(declare-fun bm!32581 () Bool)

(assert (=> bm!32581 (= call!32584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!570940 () Bool)

(assert (=> b!570940 (= e!328347 e!328346)))

(declare-fun lt!260237 () (_ BitVec 64))

(assert (=> b!570940 (= lt!260237 (select (arr!17177 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!260238 () Unit!17934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35773 (_ BitVec 64) (_ BitVec 32)) Unit!17934)

(assert (=> b!570940 (= lt!260238 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260237 #b00000000000000000000000000000000))))

(assert (=> b!570940 (arrayContainsKey!0 a!3118 lt!260237 #b00000000000000000000000000000000)))

(declare-fun lt!260239 () Unit!17934)

(assert (=> b!570940 (= lt!260239 lt!260238)))

(declare-fun res!360792 () Bool)

(assert (=> b!570940 (= res!360792 (= (seekEntryOrOpen!0 (select (arr!17177 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5623 #b00000000000000000000000000000000)))))

(assert (=> b!570940 (=> (not res!360792) (not e!328346))))

(assert (= (and d!84525 (not res!360793)) b!570937))

(assert (= (and b!570937 c!65429) b!570940))

(assert (= (and b!570937 (not c!65429)) b!570939))

(assert (= (and b!570940 res!360792) b!570938))

(assert (= (or b!570938 b!570939) bm!32581))

(declare-fun m!549377 () Bool)

(assert (=> b!570937 m!549377))

(assert (=> b!570937 m!549377))

(declare-fun m!549379 () Bool)

(assert (=> b!570937 m!549379))

(declare-fun m!549381 () Bool)

(assert (=> bm!32581 m!549381))

(assert (=> b!570940 m!549377))

(declare-fun m!549383 () Bool)

(assert (=> b!570940 m!549383))

(declare-fun m!549385 () Bool)

(assert (=> b!570940 m!549385))

(assert (=> b!570940 m!549377))

(declare-fun m!549387 () Bool)

(assert (=> b!570940 m!549387))

(assert (=> b!570758 d!84525))

(declare-fun d!84533 () Bool)

(declare-fun res!360802 () Bool)

(declare-fun e!328364 () Bool)

(assert (=> d!84533 (=> res!360802 e!328364)))

(assert (=> d!84533 (= res!360802 (= (select (arr!17177 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84533 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!328364)))

(declare-fun b!570963 () Bool)

(declare-fun e!328365 () Bool)

(assert (=> b!570963 (= e!328364 e!328365)))

(declare-fun res!360803 () Bool)

(assert (=> b!570963 (=> (not res!360803) (not e!328365))))

(assert (=> b!570963 (= res!360803 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17542 a!3118)))))

(declare-fun b!570964 () Bool)

(assert (=> b!570964 (= e!328365 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84533 (not res!360802)) b!570963))

(assert (= (and b!570963 res!360803) b!570964))

(assert (=> d!84533 m!549377))

(declare-fun m!549389 () Bool)

(assert (=> b!570964 m!549389))

(assert (=> b!570757 d!84533))

(declare-fun d!84535 () Bool)

(assert (=> d!84535 (= (validKeyInArray!0 (select (arr!17177 a!3118) j!142)) (and (not (= (select (arr!17177 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17177 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570759 d!84535))

(declare-fun b!570965 () Bool)

(declare-fun e!328366 () SeekEntryResult!5623)

(declare-fun lt!260251 () SeekEntryResult!5623)

(assert (=> b!570965 (= e!328366 (Found!5623 (index!24721 lt!260251)))))

(declare-fun b!570966 () Bool)

(declare-fun e!328367 () SeekEntryResult!5623)

(assert (=> b!570966 (= e!328367 (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260251) (index!24721 lt!260251) (index!24721 lt!260251) k0!1914 a!3118 mask!3119))))

(declare-fun b!570968 () Bool)

(declare-fun c!65439 () Bool)

(declare-fun lt!260249 () (_ BitVec 64))

(assert (=> b!570968 (= c!65439 (= lt!260249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570968 (= e!328366 e!328367)))

(declare-fun b!570969 () Bool)

(assert (=> b!570969 (= e!328367 (MissingZero!5623 (index!24721 lt!260251)))))

(declare-fun b!570970 () Bool)

(declare-fun e!328368 () SeekEntryResult!5623)

(assert (=> b!570970 (= e!328368 Undefined!5623)))

(declare-fun b!570967 () Bool)

(assert (=> b!570967 (= e!328368 e!328366)))

(assert (=> b!570967 (= lt!260249 (select (arr!17177 a!3118) (index!24721 lt!260251)))))

(declare-fun c!65438 () Bool)

(assert (=> b!570967 (= c!65438 (= lt!260249 k0!1914))))

(declare-fun d!84537 () Bool)

(declare-fun lt!260250 () SeekEntryResult!5623)

(assert (=> d!84537 (and (or ((_ is Undefined!5623) lt!260250) (not ((_ is Found!5623) lt!260250)) (and (bvsge (index!24720 lt!260250) #b00000000000000000000000000000000) (bvslt (index!24720 lt!260250) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260250) ((_ is Found!5623) lt!260250) (not ((_ is MissingZero!5623) lt!260250)) (and (bvsge (index!24719 lt!260250) #b00000000000000000000000000000000) (bvslt (index!24719 lt!260250) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260250) ((_ is Found!5623) lt!260250) ((_ is MissingZero!5623) lt!260250) (not ((_ is MissingVacant!5623) lt!260250)) (and (bvsge (index!24722 lt!260250) #b00000000000000000000000000000000) (bvslt (index!24722 lt!260250) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260250) (ite ((_ is Found!5623) lt!260250) (= (select (arr!17177 a!3118) (index!24720 lt!260250)) k0!1914) (ite ((_ is MissingZero!5623) lt!260250) (= (select (arr!17177 a!3118) (index!24719 lt!260250)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5623) lt!260250) (= (select (arr!17177 a!3118) (index!24722 lt!260250)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84537 (= lt!260250 e!328368)))

(declare-fun c!65437 () Bool)

(assert (=> d!84537 (= c!65437 (and ((_ is Intermediate!5623) lt!260251) (undefined!6435 lt!260251)))))

(assert (=> d!84537 (= lt!260251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84537 (validMask!0 mask!3119)))

(assert (=> d!84537 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!260250)))

(assert (= (and d!84537 c!65437) b!570970))

(assert (= (and d!84537 (not c!65437)) b!570967))

(assert (= (and b!570967 c!65438) b!570965))

(assert (= (and b!570967 (not c!65438)) b!570968))

(assert (= (and b!570968 c!65439) b!570969))

(assert (= (and b!570968 (not c!65439)) b!570966))

(declare-fun m!549397 () Bool)

(assert (=> b!570966 m!549397))

(declare-fun m!549399 () Bool)

(assert (=> b!570967 m!549399))

(declare-fun m!549401 () Bool)

(assert (=> d!84537 m!549401))

(declare-fun m!549403 () Bool)

(assert (=> d!84537 m!549403))

(assert (=> d!84537 m!549209))

(declare-fun m!549405 () Bool)

(assert (=> d!84537 m!549405))

(declare-fun m!549407 () Bool)

(assert (=> d!84537 m!549407))

(assert (=> d!84537 m!549407))

(declare-fun m!549409 () Bool)

(assert (=> d!84537 m!549409))

(assert (=> b!570766 d!84537))

(declare-fun e!328374 () SeekEntryResult!5623)

(declare-fun b!570977 () Bool)

(assert (=> b!570977 (= e!328374 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53598 lt!260129) #b00000000000000000000000000000001) (nextIndex!0 (index!24721 lt!260129) (x!53598 lt!260129) mask!3119) (index!24721 lt!260129) (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570978 () Bool)

(declare-fun e!328373 () SeekEntryResult!5623)

(declare-fun e!328372 () SeekEntryResult!5623)

(assert (=> b!570978 (= e!328373 e!328372)))

(declare-fun lt!260255 () (_ BitVec 64))

(declare-fun c!65445 () Bool)

(assert (=> b!570978 (= c!65445 (= lt!260255 (select (arr!17177 a!3118) j!142)))))

(declare-fun b!570979 () Bool)

(assert (=> b!570979 (= e!328372 (Found!5623 (index!24721 lt!260129)))))

(declare-fun lt!260256 () SeekEntryResult!5623)

(declare-fun d!84541 () Bool)

(assert (=> d!84541 (and (or ((_ is Undefined!5623) lt!260256) (not ((_ is Found!5623) lt!260256)) (and (bvsge (index!24720 lt!260256) #b00000000000000000000000000000000) (bvslt (index!24720 lt!260256) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260256) ((_ is Found!5623) lt!260256) (not ((_ is MissingVacant!5623) lt!260256)) (not (= (index!24722 lt!260256) (index!24721 lt!260129))) (and (bvsge (index!24722 lt!260256) #b00000000000000000000000000000000) (bvslt (index!24722 lt!260256) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260256) (ite ((_ is Found!5623) lt!260256) (= (select (arr!17177 a!3118) (index!24720 lt!260256)) (select (arr!17177 a!3118) j!142)) (and ((_ is MissingVacant!5623) lt!260256) (= (index!24722 lt!260256) (index!24721 lt!260129)) (= (select (arr!17177 a!3118) (index!24722 lt!260256)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84541 (= lt!260256 e!328373)))

(declare-fun c!65443 () Bool)

(assert (=> d!84541 (= c!65443 (bvsge (x!53598 lt!260129) #b01111111111111111111111111111110))))

(assert (=> d!84541 (= lt!260255 (select (arr!17177 a!3118) (index!24721 lt!260129)))))

(assert (=> d!84541 (validMask!0 mask!3119)))

(assert (=> d!84541 (= (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260129) (index!24721 lt!260129) (index!24721 lt!260129) (select (arr!17177 a!3118) j!142) a!3118 mask!3119) lt!260256)))

(declare-fun b!570980 () Bool)

(declare-fun c!65444 () Bool)

(assert (=> b!570980 (= c!65444 (= lt!260255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570980 (= e!328372 e!328374)))

(declare-fun b!570981 () Bool)

(assert (=> b!570981 (= e!328373 Undefined!5623)))

(declare-fun b!570982 () Bool)

(assert (=> b!570982 (= e!328374 (MissingVacant!5623 (index!24721 lt!260129)))))

(assert (= (and d!84541 c!65443) b!570981))

(assert (= (and d!84541 (not c!65443)) b!570978))

(assert (= (and b!570978 c!65445) b!570979))

(assert (= (and b!570978 (not c!65445)) b!570980))

(assert (= (and b!570980 c!65444) b!570982))

(assert (= (and b!570980 (not c!65444)) b!570977))

(assert (=> b!570977 m!549355))

(assert (=> b!570977 m!549355))

(assert (=> b!570977 m!549199))

(declare-fun m!549423 () Bool)

(assert (=> b!570977 m!549423))

(declare-fun m!549425 () Bool)

(assert (=> d!84541 m!549425))

(declare-fun m!549427 () Bool)

(assert (=> d!84541 m!549427))

(assert (=> d!84541 m!549217))

(assert (=> d!84541 m!549209))

(assert (=> b!570765 d!84541))

(declare-fun b!571013 () Bool)

(declare-fun e!328399 () Bool)

(declare-fun contains!2861 (List!11296 (_ BitVec 64)) Bool)

(assert (=> b!571013 (= e!328399 (contains!2861 Nil!11293 (select (arr!17177 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571014 () Bool)

(declare-fun e!328400 () Bool)

(declare-fun e!328398 () Bool)

(assert (=> b!571014 (= e!328400 e!328398)))

(declare-fun c!65455 () Bool)

(assert (=> b!571014 (= c!65455 (validKeyInArray!0 (select (arr!17177 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571015 () Bool)

(declare-fun call!32591 () Bool)

(assert (=> b!571015 (= e!328398 call!32591)))

(declare-fun d!84545 () Bool)

(declare-fun res!360818 () Bool)

(declare-fun e!328401 () Bool)

(assert (=> d!84545 (=> res!360818 e!328401)))

(assert (=> d!84545 (= res!360818 (bvsge #b00000000000000000000000000000000 (size!17542 a!3118)))))

(assert (=> d!84545 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11293) e!328401)))

(declare-fun b!571016 () Bool)

(assert (=> b!571016 (= e!328401 e!328400)))

(declare-fun res!360819 () Bool)

(assert (=> b!571016 (=> (not res!360819) (not e!328400))))

(assert (=> b!571016 (= res!360819 (not e!328399))))

(declare-fun res!360820 () Bool)

(assert (=> b!571016 (=> (not res!360820) (not e!328399))))

(assert (=> b!571016 (= res!360820 (validKeyInArray!0 (select (arr!17177 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32588 () Bool)

(assert (=> bm!32588 (= call!32591 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65455 (Cons!11292 (select (arr!17177 a!3118) #b00000000000000000000000000000000) Nil!11293) Nil!11293)))))

(declare-fun b!571017 () Bool)

(assert (=> b!571017 (= e!328398 call!32591)))

(assert (= (and d!84545 (not res!360818)) b!571016))

(assert (= (and b!571016 res!360820) b!571013))

(assert (= (and b!571016 res!360819) b!571014))

(assert (= (and b!571014 c!65455) b!571015))

(assert (= (and b!571014 (not c!65455)) b!571017))

(assert (= (or b!571015 b!571017) bm!32588))

(assert (=> b!571013 m!549377))

(assert (=> b!571013 m!549377))

(declare-fun m!549465 () Bool)

(assert (=> b!571013 m!549465))

(assert (=> b!571014 m!549377))

(assert (=> b!571014 m!549377))

(assert (=> b!571014 m!549379))

(assert (=> b!571016 m!549377))

(assert (=> b!571016 m!549377))

(assert (=> b!571016 m!549379))

(assert (=> bm!32588 m!549377))

(declare-fun m!549467 () Bool)

(assert (=> bm!32588 m!549467))

(assert (=> b!570756 d!84545))

(declare-fun b!571104 () Bool)

(declare-fun e!328455 () SeekEntryResult!5623)

(assert (=> b!571104 (= e!328455 (Intermediate!5623 false lt!260130 #b00000000000000000000000000000000))))

(declare-fun b!571105 () Bool)

(declare-fun e!328451 () Bool)

(declare-fun lt!260290 () SeekEntryResult!5623)

(assert (=> b!571105 (= e!328451 (bvsge (x!53598 lt!260290) #b01111111111111111111111111111110))))

(declare-fun b!571106 () Bool)

(assert (=> b!571106 (and (bvsge (index!24721 lt!260290) #b00000000000000000000000000000000) (bvslt (index!24721 lt!260290) (size!17542 lt!260124)))))

(declare-fun e!328453 () Bool)

(assert (=> b!571106 (= e!328453 (= (select (arr!17177 lt!260124) (index!24721 lt!260290)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!571107 () Bool)

(assert (=> b!571107 (and (bvsge (index!24721 lt!260290) #b00000000000000000000000000000000) (bvslt (index!24721 lt!260290) (size!17542 lt!260124)))))

(declare-fun res!360840 () Bool)

(assert (=> b!571107 (= res!360840 (= (select (arr!17177 lt!260124) (index!24721 lt!260290)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571107 (=> res!360840 e!328453)))

(declare-fun b!571108 () Bool)

(declare-fun e!328452 () SeekEntryResult!5623)

(assert (=> b!571108 (= e!328452 (Intermediate!5623 true lt!260130 #b00000000000000000000000000000000))))

(declare-fun b!571109 () Bool)

(assert (=> b!571109 (= e!328455 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260130 #b00000000000000000000000000000000 mask!3119) lt!260127 lt!260124 mask!3119))))

(declare-fun d!84557 () Bool)

(assert (=> d!84557 e!328451))

(declare-fun c!65491 () Bool)

(assert (=> d!84557 (= c!65491 (and ((_ is Intermediate!5623) lt!260290) (undefined!6435 lt!260290)))))

(assert (=> d!84557 (= lt!260290 e!328452)))

(declare-fun c!65489 () Bool)

(assert (=> d!84557 (= c!65489 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!260291 () (_ BitVec 64))

(assert (=> d!84557 (= lt!260291 (select (arr!17177 lt!260124) lt!260130))))

(assert (=> d!84557 (validMask!0 mask!3119)))

(assert (=> d!84557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260130 lt!260127 lt!260124 mask!3119) lt!260290)))

(declare-fun b!571110 () Bool)

(assert (=> b!571110 (and (bvsge (index!24721 lt!260290) #b00000000000000000000000000000000) (bvslt (index!24721 lt!260290) (size!17542 lt!260124)))))

(declare-fun res!360841 () Bool)

(assert (=> b!571110 (= res!360841 (= (select (arr!17177 lt!260124) (index!24721 lt!260290)) lt!260127))))

(assert (=> b!571110 (=> res!360841 e!328453)))

(declare-fun e!328454 () Bool)

(assert (=> b!571110 (= e!328454 e!328453)))

(declare-fun b!571111 () Bool)

(assert (=> b!571111 (= e!328451 e!328454)))

(declare-fun res!360839 () Bool)

(assert (=> b!571111 (= res!360839 (and ((_ is Intermediate!5623) lt!260290) (not (undefined!6435 lt!260290)) (bvslt (x!53598 lt!260290) #b01111111111111111111111111111110) (bvsge (x!53598 lt!260290) #b00000000000000000000000000000000) (bvsge (x!53598 lt!260290) #b00000000000000000000000000000000)))))

(assert (=> b!571111 (=> (not res!360839) (not e!328454))))

(declare-fun b!571112 () Bool)

(assert (=> b!571112 (= e!328452 e!328455)))

(declare-fun c!65490 () Bool)

(assert (=> b!571112 (= c!65490 (or (= lt!260291 lt!260127) (= (bvadd lt!260291 lt!260291) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84557 c!65489) b!571108))

(assert (= (and d!84557 (not c!65489)) b!571112))

(assert (= (and b!571112 c!65490) b!571104))

(assert (= (and b!571112 (not c!65490)) b!571109))

(assert (= (and d!84557 c!65491) b!571105))

(assert (= (and d!84557 (not c!65491)) b!571111))

(assert (= (and b!571111 res!360839) b!571110))

(assert (= (and b!571110 (not res!360841)) b!571107))

(assert (= (and b!571107 (not res!360840)) b!571106))

(declare-fun m!549505 () Bool)

(assert (=> b!571107 m!549505))

(assert (=> b!571106 m!549505))

(assert (=> b!571110 m!549505))

(declare-fun m!549507 () Bool)

(assert (=> d!84557 m!549507))

(assert (=> d!84557 m!549209))

(declare-fun m!549509 () Bool)

(assert (=> b!571109 m!549509))

(assert (=> b!571109 m!549509))

(declare-fun m!549511 () Bool)

(assert (=> b!571109 m!549511))

(assert (=> b!570763 d!84557))

(declare-fun b!571117 () Bool)

(declare-fun e!328464 () SeekEntryResult!5623)

(assert (=> b!571117 (= e!328464 (Intermediate!5623 false lt!260128 #b00000000000000000000000000000000))))

(declare-fun b!571118 () Bool)

(declare-fun e!328460 () Bool)

(declare-fun lt!260292 () SeekEntryResult!5623)

(assert (=> b!571118 (= e!328460 (bvsge (x!53598 lt!260292) #b01111111111111111111111111111110))))

(declare-fun b!571119 () Bool)

(assert (=> b!571119 (and (bvsge (index!24721 lt!260292) #b00000000000000000000000000000000) (bvslt (index!24721 lt!260292) (size!17542 a!3118)))))

(declare-fun e!328462 () Bool)

(assert (=> b!571119 (= e!328462 (= (select (arr!17177 a!3118) (index!24721 lt!260292)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!571120 () Bool)

(assert (=> b!571120 (and (bvsge (index!24721 lt!260292) #b00000000000000000000000000000000) (bvslt (index!24721 lt!260292) (size!17542 a!3118)))))

(declare-fun res!360847 () Bool)

(assert (=> b!571120 (= res!360847 (= (select (arr!17177 a!3118) (index!24721 lt!260292)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571120 (=> res!360847 e!328462)))

(declare-fun b!571121 () Bool)

(declare-fun e!328461 () SeekEntryResult!5623)

(assert (=> b!571121 (= e!328461 (Intermediate!5623 true lt!260128 #b00000000000000000000000000000000))))

(declare-fun b!571122 () Bool)

(assert (=> b!571122 (= e!328464 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260128 #b00000000000000000000000000000000 mask!3119) (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84571 () Bool)

(assert (=> d!84571 e!328460))

(declare-fun c!65494 () Bool)

(assert (=> d!84571 (= c!65494 (and ((_ is Intermediate!5623) lt!260292) (undefined!6435 lt!260292)))))

(assert (=> d!84571 (= lt!260292 e!328461)))

(declare-fun c!65492 () Bool)

(assert (=> d!84571 (= c!65492 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!260293 () (_ BitVec 64))

(assert (=> d!84571 (= lt!260293 (select (arr!17177 a!3118) lt!260128))))

(assert (=> d!84571 (validMask!0 mask!3119)))

(assert (=> d!84571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260128 (select (arr!17177 a!3118) j!142) a!3118 mask!3119) lt!260292)))

(declare-fun b!571123 () Bool)

(assert (=> b!571123 (and (bvsge (index!24721 lt!260292) #b00000000000000000000000000000000) (bvslt (index!24721 lt!260292) (size!17542 a!3118)))))

(declare-fun res!360848 () Bool)

(assert (=> b!571123 (= res!360848 (= (select (arr!17177 a!3118) (index!24721 lt!260292)) (select (arr!17177 a!3118) j!142)))))

(assert (=> b!571123 (=> res!360848 e!328462)))

(declare-fun e!328463 () Bool)

(assert (=> b!571123 (= e!328463 e!328462)))

(declare-fun b!571124 () Bool)

(assert (=> b!571124 (= e!328460 e!328463)))

(declare-fun res!360846 () Bool)

(assert (=> b!571124 (= res!360846 (and ((_ is Intermediate!5623) lt!260292) (not (undefined!6435 lt!260292)) (bvslt (x!53598 lt!260292) #b01111111111111111111111111111110) (bvsge (x!53598 lt!260292) #b00000000000000000000000000000000) (bvsge (x!53598 lt!260292) #b00000000000000000000000000000000)))))

(assert (=> b!571124 (=> (not res!360846) (not e!328463))))

(declare-fun b!571125 () Bool)

(assert (=> b!571125 (= e!328461 e!328464)))

(declare-fun c!65493 () Bool)

(assert (=> b!571125 (= c!65493 (or (= lt!260293 (select (arr!17177 a!3118) j!142)) (= (bvadd lt!260293 lt!260293) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84571 c!65492) b!571121))

(assert (= (and d!84571 (not c!65492)) b!571125))

(assert (= (and b!571125 c!65493) b!571117))

(assert (= (and b!571125 (not c!65493)) b!571122))

(assert (= (and d!84571 c!65494) b!571118))

(assert (= (and d!84571 (not c!65494)) b!571124))

(assert (= (and b!571124 res!360846) b!571123))

(assert (= (and b!571123 (not res!360848)) b!571120))

(assert (= (and b!571120 (not res!360847)) b!571119))

(declare-fun m!549513 () Bool)

(assert (=> b!571120 m!549513))

(assert (=> b!571119 m!549513))

(assert (=> b!571123 m!549513))

(declare-fun m!549515 () Bool)

(assert (=> d!84571 m!549515))

(assert (=> d!84571 m!549209))

(declare-fun m!549517 () Bool)

(assert (=> b!571122 m!549517))

(assert (=> b!571122 m!549517))

(assert (=> b!571122 m!549199))

(declare-fun m!549519 () Bool)

(assert (=> b!571122 m!549519))

(assert (=> b!570763 d!84571))

(declare-fun d!84573 () Bool)

(declare-fun lt!260312 () (_ BitVec 32))

(declare-fun lt!260311 () (_ BitVec 32))

(assert (=> d!84573 (= lt!260312 (bvmul (bvxor lt!260311 (bvlshr lt!260311 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84573 (= lt!260311 ((_ extract 31 0) (bvand (bvxor lt!260127 (bvlshr lt!260127 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84573 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360851 (let ((h!12319 ((_ extract 31 0) (bvand (bvxor lt!260127 (bvlshr lt!260127 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53606 (bvmul (bvxor h!12319 (bvlshr h!12319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53606 (bvlshr x!53606 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360851 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360851 #b00000000000000000000000000000000))))))

(assert (=> d!84573 (= (toIndex!0 lt!260127 mask!3119) (bvand (bvxor lt!260312 (bvlshr lt!260312 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570763 d!84573))

(declare-fun d!84585 () Bool)

(declare-fun lt!260314 () (_ BitVec 32))

(declare-fun lt!260313 () (_ BitVec 32))

(assert (=> d!84585 (= lt!260314 (bvmul (bvxor lt!260313 (bvlshr lt!260313 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84585 (= lt!260313 ((_ extract 31 0) (bvand (bvxor (select (arr!17177 a!3118) j!142) (bvlshr (select (arr!17177 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84585 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360851 (let ((h!12319 ((_ extract 31 0) (bvand (bvxor (select (arr!17177 a!3118) j!142) (bvlshr (select (arr!17177 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53606 (bvmul (bvxor h!12319 (bvlshr h!12319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53606 (bvlshr x!53606 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360851 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360851 #b00000000000000000000000000000000))))))

(assert (=> d!84585 (= (toIndex!0 (select (arr!17177 a!3118) j!142) mask!3119) (bvand (bvxor lt!260314 (bvlshr lt!260314 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570763 d!84585))

(declare-fun b!571176 () Bool)

(declare-fun e!328493 () SeekEntryResult!5623)

(declare-fun lt!260317 () SeekEntryResult!5623)

(assert (=> b!571176 (= e!328493 (Found!5623 (index!24721 lt!260317)))))

(declare-fun b!571177 () Bool)

(declare-fun e!328494 () SeekEntryResult!5623)

(assert (=> b!571177 (= e!328494 (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260317) (index!24721 lt!260317) (index!24721 lt!260317) (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571179 () Bool)

(declare-fun c!65515 () Bool)

(declare-fun lt!260315 () (_ BitVec 64))

(assert (=> b!571179 (= c!65515 (= lt!260315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571179 (= e!328493 e!328494)))

(declare-fun b!571180 () Bool)

(assert (=> b!571180 (= e!328494 (MissingZero!5623 (index!24721 lt!260317)))))

(declare-fun b!571181 () Bool)

(declare-fun e!328495 () SeekEntryResult!5623)

(assert (=> b!571181 (= e!328495 Undefined!5623)))

(declare-fun b!571178 () Bool)

(assert (=> b!571178 (= e!328495 e!328493)))

(assert (=> b!571178 (= lt!260315 (select (arr!17177 a!3118) (index!24721 lt!260317)))))

(declare-fun c!65514 () Bool)

(assert (=> b!571178 (= c!65514 (= lt!260315 (select (arr!17177 a!3118) j!142)))))

(declare-fun d!84587 () Bool)

(declare-fun lt!260316 () SeekEntryResult!5623)

(assert (=> d!84587 (and (or ((_ is Undefined!5623) lt!260316) (not ((_ is Found!5623) lt!260316)) (and (bvsge (index!24720 lt!260316) #b00000000000000000000000000000000) (bvslt (index!24720 lt!260316) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260316) ((_ is Found!5623) lt!260316) (not ((_ is MissingZero!5623) lt!260316)) (and (bvsge (index!24719 lt!260316) #b00000000000000000000000000000000) (bvslt (index!24719 lt!260316) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260316) ((_ is Found!5623) lt!260316) ((_ is MissingZero!5623) lt!260316) (not ((_ is MissingVacant!5623) lt!260316)) (and (bvsge (index!24722 lt!260316) #b00000000000000000000000000000000) (bvslt (index!24722 lt!260316) (size!17542 a!3118)))) (or ((_ is Undefined!5623) lt!260316) (ite ((_ is Found!5623) lt!260316) (= (select (arr!17177 a!3118) (index!24720 lt!260316)) (select (arr!17177 a!3118) j!142)) (ite ((_ is MissingZero!5623) lt!260316) (= (select (arr!17177 a!3118) (index!24719 lt!260316)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5623) lt!260316) (= (select (arr!17177 a!3118) (index!24722 lt!260316)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84587 (= lt!260316 e!328495)))

(declare-fun c!65513 () Bool)

(assert (=> d!84587 (= c!65513 (and ((_ is Intermediate!5623) lt!260317) (undefined!6435 lt!260317)))))

(assert (=> d!84587 (= lt!260317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17177 a!3118) j!142) mask!3119) (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84587 (validMask!0 mask!3119)))

(assert (=> d!84587 (= (seekEntryOrOpen!0 (select (arr!17177 a!3118) j!142) a!3118 mask!3119) lt!260316)))

(assert (= (and d!84587 c!65513) b!571181))

(assert (= (and d!84587 (not c!65513)) b!571178))

(assert (= (and b!571178 c!65514) b!571176))

(assert (= (and b!571178 (not c!65514)) b!571179))

(assert (= (and b!571179 c!65515) b!571180))

(assert (= (and b!571179 (not c!65515)) b!571177))

(assert (=> b!571177 m!549199))

(declare-fun m!549559 () Bool)

(assert (=> b!571177 m!549559))

(declare-fun m!549561 () Bool)

(assert (=> b!571178 m!549561))

(declare-fun m!549563 () Bool)

(assert (=> d!84587 m!549563))

(declare-fun m!549565 () Bool)

(assert (=> d!84587 m!549565))

(assert (=> d!84587 m!549209))

(declare-fun m!549567 () Bool)

(assert (=> d!84587 m!549567))

(assert (=> d!84587 m!549199))

(assert (=> d!84587 m!549229))

(assert (=> d!84587 m!549229))

(assert (=> d!84587 m!549199))

(declare-fun m!549569 () Bool)

(assert (=> d!84587 m!549569))

(assert (=> b!570753 d!84587))

(declare-fun b!571182 () Bool)

(declare-fun e!328498 () Bool)

(declare-fun e!328497 () Bool)

(assert (=> b!571182 (= e!328498 e!328497)))

(declare-fun c!65516 () Bool)

(assert (=> b!571182 (= c!65516 (validKeyInArray!0 (select (arr!17177 a!3118) j!142)))))

(declare-fun b!571183 () Bool)

(declare-fun e!328496 () Bool)

(declare-fun call!32598 () Bool)

(assert (=> b!571183 (= e!328496 call!32598)))

(declare-fun d!84589 () Bool)

(declare-fun res!360866 () Bool)

(assert (=> d!84589 (=> res!360866 e!328498)))

(assert (=> d!84589 (= res!360866 (bvsge j!142 (size!17542 a!3118)))))

(assert (=> d!84589 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328498)))

(declare-fun b!571184 () Bool)

(assert (=> b!571184 (= e!328497 call!32598)))

(declare-fun bm!32595 () Bool)

(assert (=> bm!32595 (= call!32598 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!571185 () Bool)

(assert (=> b!571185 (= e!328497 e!328496)))

(declare-fun lt!260318 () (_ BitVec 64))

(assert (=> b!571185 (= lt!260318 (select (arr!17177 a!3118) j!142))))

(declare-fun lt!260319 () Unit!17934)

(assert (=> b!571185 (= lt!260319 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260318 j!142))))

(assert (=> b!571185 (arrayContainsKey!0 a!3118 lt!260318 #b00000000000000000000000000000000)))

(declare-fun lt!260320 () Unit!17934)

(assert (=> b!571185 (= lt!260320 lt!260319)))

(declare-fun res!360865 () Bool)

(assert (=> b!571185 (= res!360865 (= (seekEntryOrOpen!0 (select (arr!17177 a!3118) j!142) a!3118 mask!3119) (Found!5623 j!142)))))

(assert (=> b!571185 (=> (not res!360865) (not e!328496))))

(assert (= (and d!84589 (not res!360866)) b!571182))

(assert (= (and b!571182 c!65516) b!571185))

(assert (= (and b!571182 (not c!65516)) b!571184))

(assert (= (and b!571185 res!360865) b!571183))

(assert (= (or b!571183 b!571184) bm!32595))

(assert (=> b!571182 m!549199))

(assert (=> b!571182 m!549199))

(assert (=> b!571182 m!549221))

(declare-fun m!549571 () Bool)

(assert (=> bm!32595 m!549571))

(assert (=> b!571185 m!549199))

(declare-fun m!549573 () Bool)

(assert (=> b!571185 m!549573))

(declare-fun m!549575 () Bool)

(assert (=> b!571185 m!549575))

(assert (=> b!571185 m!549199))

(assert (=> b!571185 m!549201))

(assert (=> b!570753 d!84589))

(declare-fun d!84591 () Bool)

(assert (=> d!84591 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!260331 () Unit!17934)

(declare-fun choose!38 (array!35773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17934)

(assert (=> d!84591 (= lt!260331 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84591 (validMask!0 mask!3119)))

(assert (=> d!84591 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!260331)))

(declare-fun bs!17682 () Bool)

(assert (= bs!17682 d!84591))

(assert (=> bs!17682 m!549203))

(declare-fun m!549577 () Bool)

(assert (=> bs!17682 m!549577))

(assert (=> bs!17682 m!549209))

(assert (=> b!570753 d!84591))

(check-sat (not b!570940) (not b!571016) (not bm!32581) (not d!84537) (not b!571014) (not d!84511) (not bm!32595) (not b!570966) (not d!84515) (not b!571109) (not d!84591) (not b!571122) (not bm!32588) (not b!571182) (not b!570977) (not d!84587) (not d!84557) (not b!571013) (not b!571177) (not b!570864) (not d!84541) (not b!570911) (not d!84571) (not b!570937) (not b!571185) (not b!570964))
(check-sat)
