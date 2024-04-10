; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52466 () Bool)

(assert start!52466)

(declare-fun b!573050 () Bool)

(declare-fun res!362563 () Bool)

(declare-fun e!329651 () Bool)

(assert (=> b!573050 (=> (not res!362563) (not e!329651))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35863 0))(
  ( (array!35864 (arr!17220 (Array (_ BitVec 32) (_ BitVec 64))) (size!17584 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35863)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!573050 (= res!362563 (and (= (size!17584 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17584 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17584 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573051 () Bool)

(declare-fun e!329656 () Bool)

(declare-fun e!329655 () Bool)

(assert (=> b!573051 (= e!329656 e!329655)))

(declare-fun res!362565 () Bool)

(assert (=> b!573051 (=> (not res!362565) (not e!329655))))

(declare-datatypes ((SeekEntryResult!5669 0))(
  ( (MissingZero!5669 (index!24903 (_ BitVec 32))) (Found!5669 (index!24904 (_ BitVec 32))) (Intermediate!5669 (undefined!6481 Bool) (index!24905 (_ BitVec 32)) (x!53770 (_ BitVec 32))) (Undefined!5669) (MissingVacant!5669 (index!24906 (_ BitVec 32))) )
))
(declare-fun lt!261660 () SeekEntryResult!5669)

(declare-fun lt!261666 () SeekEntryResult!5669)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35863 (_ BitVec 32)) SeekEntryResult!5669)

(assert (=> b!573051 (= res!362565 (= lt!261660 (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261666) (index!24905 lt!261666) (index!24905 lt!261666) (select (arr!17220 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573052 () Bool)

(declare-fun res!362568 () Bool)

(assert (=> b!573052 (=> (not res!362568) (not e!329651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573052 (= res!362568 (validKeyInArray!0 (select (arr!17220 a!3118) j!142)))))

(declare-fun b!573053 () Bool)

(declare-fun res!362564 () Bool)

(assert (=> b!573053 (=> (not res!362564) (not e!329651))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573053 (= res!362564 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573054 () Bool)

(declare-fun e!329652 () Bool)

(assert (=> b!573054 (= e!329651 e!329652)))

(declare-fun res!362567 () Bool)

(assert (=> b!573054 (=> (not res!362567) (not e!329652))))

(declare-fun lt!261661 () SeekEntryResult!5669)

(assert (=> b!573054 (= res!362567 (or (= lt!261661 (MissingZero!5669 i!1132)) (= lt!261661 (MissingVacant!5669 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35863 (_ BitVec 32)) SeekEntryResult!5669)

(assert (=> b!573054 (= lt!261661 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!573055 () Bool)

(declare-fun res!362561 () Bool)

(assert (=> b!573055 (=> (not res!362561) (not e!329652))))

(declare-datatypes ((List!11300 0))(
  ( (Nil!11297) (Cons!11296 (h!12323 (_ BitVec 64)) (t!17528 List!11300)) )
))
(declare-fun arrayNoDuplicates!0 (array!35863 (_ BitVec 32) List!11300) Bool)

(assert (=> b!573055 (= res!362561 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11297))))

(declare-fun res!362569 () Bool)

(assert (=> start!52466 (=> (not res!362569) (not e!329651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52466 (= res!362569 (validMask!0 mask!3119))))

(assert (=> start!52466 e!329651))

(assert (=> start!52466 true))

(declare-fun array_inv!13016 (array!35863) Bool)

(assert (=> start!52466 (array_inv!13016 a!3118)))

(declare-fun b!573056 () Bool)

(declare-fun e!329653 () Bool)

(assert (=> b!573056 (= e!329653 e!329656)))

(declare-fun res!362570 () Bool)

(assert (=> b!573056 (=> res!362570 e!329656)))

(declare-fun lt!261665 () (_ BitVec 64))

(assert (=> b!573056 (= res!362570 (or (= lt!261665 (select (arr!17220 a!3118) j!142)) (= lt!261665 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573056 (= lt!261665 (select (arr!17220 a!3118) (index!24905 lt!261666)))))

(declare-fun b!573057 () Bool)

(declare-fun res!362562 () Bool)

(assert (=> b!573057 (=> (not res!362562) (not e!329651))))

(assert (=> b!573057 (= res!362562 (validKeyInArray!0 k!1914))))

(declare-fun b!573058 () Bool)

(declare-fun e!329657 () Bool)

(assert (=> b!573058 (= e!329657 (not (or (undefined!6481 lt!261666) (not (is-Intermediate!5669 lt!261666)) (let ((bdg!17961 (select (arr!17220 a!3118) (index!24905 lt!261666)))) (or (= bdg!17961 (select (arr!17220 a!3118) j!142)) (= bdg!17961 #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!24905 lt!261666) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261666) (bvadd #b00000000000000000000000000000001 mask!3119))))))))))

(declare-fun e!329658 () Bool)

(assert (=> b!573058 e!329658))

(declare-fun res!362558 () Bool)

(assert (=> b!573058 (=> (not res!362558) (not e!329658))))

(assert (=> b!573058 (= res!362558 (= lt!261660 (Found!5669 j!142)))))

(assert (=> b!573058 (= lt!261660 (seekEntryOrOpen!0 (select (arr!17220 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35863 (_ BitVec 32)) Bool)

(assert (=> b!573058 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18040 0))(
  ( (Unit!18041) )
))
(declare-fun lt!261664 () Unit!18040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18040)

(assert (=> b!573058 (= lt!261664 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun lt!261659 () (_ BitVec 64))

(declare-fun b!573059 () Bool)

(declare-fun lt!261663 () array!35863)

(assert (=> b!573059 (= e!329655 (= (seekEntryOrOpen!0 lt!261659 lt!261663 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261666) (index!24905 lt!261666) (index!24905 lt!261666) lt!261659 lt!261663 mask!3119)))))

(declare-fun b!573060 () Bool)

(assert (=> b!573060 (= e!329652 e!329657)))

(declare-fun res!362560 () Bool)

(assert (=> b!573060 (=> (not res!362560) (not e!329657))))

(declare-fun lt!261667 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35863 (_ BitVec 32)) SeekEntryResult!5669)

(assert (=> b!573060 (= res!362560 (= lt!261666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261667 lt!261659 lt!261663 mask!3119)))))

(declare-fun lt!261662 () (_ BitVec 32))

(assert (=> b!573060 (= lt!261666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261662 (select (arr!17220 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573060 (= lt!261667 (toIndex!0 lt!261659 mask!3119))))

(assert (=> b!573060 (= lt!261659 (select (store (arr!17220 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!573060 (= lt!261662 (toIndex!0 (select (arr!17220 a!3118) j!142) mask!3119))))

(assert (=> b!573060 (= lt!261663 (array!35864 (store (arr!17220 a!3118) i!1132 k!1914) (size!17584 a!3118)))))

(declare-fun b!573061 () Bool)

(assert (=> b!573061 (= e!329658 e!329653)))

(declare-fun res!362559 () Bool)

(assert (=> b!573061 (=> res!362559 e!329653)))

(assert (=> b!573061 (= res!362559 (or (undefined!6481 lt!261666) (not (is-Intermediate!5669 lt!261666))))))

(declare-fun b!573062 () Bool)

(declare-fun res!362566 () Bool)

(assert (=> b!573062 (=> (not res!362566) (not e!329652))))

(assert (=> b!573062 (= res!362566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52466 res!362569) b!573050))

(assert (= (and b!573050 res!362563) b!573052))

(assert (= (and b!573052 res!362568) b!573057))

(assert (= (and b!573057 res!362562) b!573053))

(assert (= (and b!573053 res!362564) b!573054))

(assert (= (and b!573054 res!362567) b!573062))

(assert (= (and b!573062 res!362566) b!573055))

(assert (= (and b!573055 res!362561) b!573060))

(assert (= (and b!573060 res!362560) b!573058))

(assert (= (and b!573058 res!362558) b!573061))

(assert (= (and b!573061 (not res!362559)) b!573056))

(assert (= (and b!573056 (not res!362570)) b!573051))

(assert (= (and b!573051 res!362565) b!573059))

(declare-fun m!552105 () Bool)

(assert (=> b!573055 m!552105))

(declare-fun m!552107 () Bool)

(assert (=> b!573056 m!552107))

(declare-fun m!552109 () Bool)

(assert (=> b!573056 m!552109))

(assert (=> b!573052 m!552107))

(assert (=> b!573052 m!552107))

(declare-fun m!552111 () Bool)

(assert (=> b!573052 m!552111))

(declare-fun m!552113 () Bool)

(assert (=> b!573053 m!552113))

(assert (=> b!573058 m!552107))

(declare-fun m!552115 () Bool)

(assert (=> b!573058 m!552115))

(assert (=> b!573058 m!552109))

(declare-fun m!552117 () Bool)

(assert (=> b!573058 m!552117))

(assert (=> b!573058 m!552107))

(declare-fun m!552119 () Bool)

(assert (=> b!573058 m!552119))

(declare-fun m!552121 () Bool)

(assert (=> b!573054 m!552121))

(declare-fun m!552123 () Bool)

(assert (=> b!573059 m!552123))

(declare-fun m!552125 () Bool)

(assert (=> b!573059 m!552125))

(declare-fun m!552127 () Bool)

(assert (=> b!573057 m!552127))

(assert (=> b!573060 m!552107))

(declare-fun m!552129 () Bool)

(assert (=> b!573060 m!552129))

(assert (=> b!573060 m!552107))

(declare-fun m!552131 () Bool)

(assert (=> b!573060 m!552131))

(assert (=> b!573060 m!552107))

(declare-fun m!552133 () Bool)

(assert (=> b!573060 m!552133))

(declare-fun m!552135 () Bool)

(assert (=> b!573060 m!552135))

(declare-fun m!552137 () Bool)

(assert (=> b!573060 m!552137))

(declare-fun m!552139 () Bool)

(assert (=> b!573060 m!552139))

(declare-fun m!552141 () Bool)

(assert (=> b!573062 m!552141))

(assert (=> b!573051 m!552107))

(assert (=> b!573051 m!552107))

(declare-fun m!552143 () Bool)

(assert (=> b!573051 m!552143))

(declare-fun m!552145 () Bool)

(assert (=> start!52466 m!552145))

(declare-fun m!552147 () Bool)

(assert (=> start!52466 m!552147))

(push 1)

(assert (not b!573051))

(assert (not b!573058))

(assert (not b!573054))

(assert (not b!573062))

(assert (not b!573059))

(assert (not b!573055))

(assert (not b!573053))

(assert (not b!573060))

(assert (not b!573057))

(assert (not start!52466))

(assert (not b!573052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!573181 () Bool)

(declare-fun e!329730 () Bool)

(declare-fun contains!2883 (List!11300 (_ BitVec 64)) Bool)

(assert (=> b!573181 (= e!329730 (contains!2883 Nil!11297 (select (arr!17220 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573182 () Bool)

(declare-fun e!329733 () Bool)

(declare-fun e!329731 () Bool)

(assert (=> b!573182 (= e!329733 e!329731)))

(declare-fun c!65621 () Bool)

(assert (=> b!573182 (= c!65621 (validKeyInArray!0 (select (arr!17220 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573183 () Bool)

(declare-fun call!32627 () Bool)

(assert (=> b!573183 (= e!329731 call!32627)))

(declare-fun d!84853 () Bool)

(declare-fun res!362656 () Bool)

(declare-fun e!329732 () Bool)

(assert (=> d!84853 (=> res!362656 e!329732)))

(assert (=> d!84853 (= res!362656 (bvsge #b00000000000000000000000000000000 (size!17584 a!3118)))))

(assert (=> d!84853 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11297) e!329732)))

(declare-fun bm!32624 () Bool)

(assert (=> bm!32624 (= call!32627 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65621 (Cons!11296 (select (arr!17220 a!3118) #b00000000000000000000000000000000) Nil!11297) Nil!11297)))))

(declare-fun b!573184 () Bool)

(assert (=> b!573184 (= e!329732 e!329733)))

(declare-fun res!362657 () Bool)

(assert (=> b!573184 (=> (not res!362657) (not e!329733))))

(assert (=> b!573184 (= res!362657 (not e!329730))))

(declare-fun res!362655 () Bool)

(assert (=> b!573184 (=> (not res!362655) (not e!329730))))

(assert (=> b!573184 (= res!362655 (validKeyInArray!0 (select (arr!17220 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573185 () Bool)

(assert (=> b!573185 (= e!329731 call!32627)))

(assert (= (and d!84853 (not res!362656)) b!573184))

(assert (= (and b!573184 res!362655) b!573181))

(assert (= (and b!573184 res!362657) b!573182))

(assert (= (and b!573182 c!65621) b!573185))

(assert (= (and b!573182 (not c!65621)) b!573183))

(assert (= (or b!573185 b!573183) bm!32624))

(declare-fun m!552249 () Bool)

(assert (=> b!573181 m!552249))

(assert (=> b!573181 m!552249))

(declare-fun m!552251 () Bool)

(assert (=> b!573181 m!552251))

(assert (=> b!573182 m!552249))

(assert (=> b!573182 m!552249))

(declare-fun m!552253 () Bool)

(assert (=> b!573182 m!552253))

(assert (=> bm!32624 m!552249))

(declare-fun m!552255 () Bool)

(assert (=> bm!32624 m!552255))

(assert (=> b!573184 m!552249))

(assert (=> b!573184 m!552249))

(assert (=> b!573184 m!552253))

(assert (=> b!573055 d!84853))

(declare-fun b!573233 () Bool)

(declare-fun e!329768 () Bool)

(declare-fun e!329766 () Bool)

(assert (=> b!573233 (= e!329768 e!329766)))

(declare-fun res!362678 () Bool)

(declare-fun lt!261747 () SeekEntryResult!5669)

(assert (=> b!573233 (= res!362678 (and (is-Intermediate!5669 lt!261747) (not (undefined!6481 lt!261747)) (bvslt (x!53770 lt!261747) #b01111111111111111111111111111110) (bvsge (x!53770 lt!261747) #b00000000000000000000000000000000) (bvsge (x!53770 lt!261747) #b00000000000000000000000000000000)))))

(assert (=> b!573233 (=> (not res!362678) (not e!329766))))

(declare-fun e!329765 () SeekEntryResult!5669)

(declare-fun b!573234 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573234 (= e!329765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261667 #b00000000000000000000000000000000 mask!3119) lt!261659 lt!261663 mask!3119))))

(declare-fun b!573235 () Bool)

(assert (=> b!573235 (and (bvsge (index!24905 lt!261747) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261747) (size!17584 lt!261663)))))

(declare-fun e!329767 () Bool)

(assert (=> b!573235 (= e!329767 (= (select (arr!17220 lt!261663) (index!24905 lt!261747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573236 () Bool)

(assert (=> b!573236 (and (bvsge (index!24905 lt!261747) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261747) (size!17584 lt!261663)))))

(declare-fun res!362679 () Bool)

(assert (=> b!573236 (= res!362679 (= (select (arr!17220 lt!261663) (index!24905 lt!261747)) lt!261659))))

(assert (=> b!573236 (=> res!362679 e!329767)))

(assert (=> b!573236 (= e!329766 e!329767)))

(declare-fun b!573237 () Bool)

(declare-fun e!329769 () SeekEntryResult!5669)

(assert (=> b!573237 (= e!329769 e!329765)))

(declare-fun c!65636 () Bool)

(declare-fun lt!261748 () (_ BitVec 64))

(assert (=> b!573237 (= c!65636 (or (= lt!261748 lt!261659) (= (bvadd lt!261748 lt!261748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573238 () Bool)

(assert (=> b!573238 (= e!329765 (Intermediate!5669 false lt!261667 #b00000000000000000000000000000000))))

(declare-fun d!84857 () Bool)

(assert (=> d!84857 e!329768))

(declare-fun c!65638 () Bool)

(assert (=> d!84857 (= c!65638 (and (is-Intermediate!5669 lt!261747) (undefined!6481 lt!261747)))))

(assert (=> d!84857 (= lt!261747 e!329769)))

(declare-fun c!65637 () Bool)

(assert (=> d!84857 (= c!65637 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84857 (= lt!261748 (select (arr!17220 lt!261663) lt!261667))))

(assert (=> d!84857 (validMask!0 mask!3119)))

(assert (=> d!84857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261667 lt!261659 lt!261663 mask!3119) lt!261747)))

(declare-fun b!573239 () Bool)

(assert (=> b!573239 (= e!329768 (bvsge (x!53770 lt!261747) #b01111111111111111111111111111110))))

(declare-fun b!573240 () Bool)

(assert (=> b!573240 (= e!329769 (Intermediate!5669 true lt!261667 #b00000000000000000000000000000000))))

(declare-fun b!573241 () Bool)

(assert (=> b!573241 (and (bvsge (index!24905 lt!261747) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261747) (size!17584 lt!261663)))))

(declare-fun res!362677 () Bool)

(assert (=> b!573241 (= res!362677 (= (select (arr!17220 lt!261663) (index!24905 lt!261747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573241 (=> res!362677 e!329767)))

(assert (= (and d!84857 c!65637) b!573240))

(assert (= (and d!84857 (not c!65637)) b!573237))

(assert (= (and b!573237 c!65636) b!573238))

(assert (= (and b!573237 (not c!65636)) b!573234))

(assert (= (and d!84857 c!65638) b!573239))

(assert (= (and d!84857 (not c!65638)) b!573233))

(assert (= (and b!573233 res!362678) b!573236))

(assert (= (and b!573236 (not res!362679)) b!573241))

(assert (= (and b!573241 (not res!362677)) b!573235))

(declare-fun m!552275 () Bool)

(assert (=> b!573235 m!552275))

(declare-fun m!552277 () Bool)

(assert (=> d!84857 m!552277))

(assert (=> d!84857 m!552145))

(assert (=> b!573236 m!552275))

(declare-fun m!552279 () Bool)

(assert (=> b!573234 m!552279))

(assert (=> b!573234 m!552279))

(declare-fun m!552281 () Bool)

(assert (=> b!573234 m!552281))

(assert (=> b!573241 m!552275))

(assert (=> b!573060 d!84857))

(declare-fun b!573246 () Bool)

(declare-fun e!329776 () Bool)

(declare-fun e!329774 () Bool)

(assert (=> b!573246 (= e!329776 e!329774)))

(declare-fun res!362683 () Bool)

(declare-fun lt!261752 () SeekEntryResult!5669)

(assert (=> b!573246 (= res!362683 (and (is-Intermediate!5669 lt!261752) (not (undefined!6481 lt!261752)) (bvslt (x!53770 lt!261752) #b01111111111111111111111111111110) (bvsge (x!53770 lt!261752) #b00000000000000000000000000000000) (bvsge (x!53770 lt!261752) #b00000000000000000000000000000000)))))

(assert (=> b!573246 (=> (not res!362683) (not e!329774))))

(declare-fun b!573247 () Bool)

(declare-fun e!329773 () SeekEntryResult!5669)

(assert (=> b!573247 (= e!329773 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261662 #b00000000000000000000000000000000 mask!3119) (select (arr!17220 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573248 () Bool)

(assert (=> b!573248 (and (bvsge (index!24905 lt!261752) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261752) (size!17584 a!3118)))))

(declare-fun e!329775 () Bool)

(assert (=> b!573248 (= e!329775 (= (select (arr!17220 a!3118) (index!24905 lt!261752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573249 () Bool)

(assert (=> b!573249 (and (bvsge (index!24905 lt!261752) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261752) (size!17584 a!3118)))))

(declare-fun res!362684 () Bool)

(assert (=> b!573249 (= res!362684 (= (select (arr!17220 a!3118) (index!24905 lt!261752)) (select (arr!17220 a!3118) j!142)))))

(assert (=> b!573249 (=> res!362684 e!329775)))

(assert (=> b!573249 (= e!329774 e!329775)))

(declare-fun b!573250 () Bool)

(declare-fun e!329777 () SeekEntryResult!5669)

(assert (=> b!573250 (= e!329777 e!329773)))

(declare-fun lt!261753 () (_ BitVec 64))

(declare-fun c!65640 () Bool)

(assert (=> b!573250 (= c!65640 (or (= lt!261753 (select (arr!17220 a!3118) j!142)) (= (bvadd lt!261753 lt!261753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573251 () Bool)

(assert (=> b!573251 (= e!329773 (Intermediate!5669 false lt!261662 #b00000000000000000000000000000000))))

(declare-fun d!84865 () Bool)

(assert (=> d!84865 e!329776))

(declare-fun c!65642 () Bool)

(assert (=> d!84865 (= c!65642 (and (is-Intermediate!5669 lt!261752) (undefined!6481 lt!261752)))))

(assert (=> d!84865 (= lt!261752 e!329777)))

(declare-fun c!65641 () Bool)

(assert (=> d!84865 (= c!65641 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84865 (= lt!261753 (select (arr!17220 a!3118) lt!261662))))

(assert (=> d!84865 (validMask!0 mask!3119)))

(assert (=> d!84865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261662 (select (arr!17220 a!3118) j!142) a!3118 mask!3119) lt!261752)))

(declare-fun b!573252 () Bool)

(assert (=> b!573252 (= e!329776 (bvsge (x!53770 lt!261752) #b01111111111111111111111111111110))))

(declare-fun b!573253 () Bool)

(assert (=> b!573253 (= e!329777 (Intermediate!5669 true lt!261662 #b00000000000000000000000000000000))))

(declare-fun b!573254 () Bool)

(assert (=> b!573254 (and (bvsge (index!24905 lt!261752) #b00000000000000000000000000000000) (bvslt (index!24905 lt!261752) (size!17584 a!3118)))))

(declare-fun res!362682 () Bool)

(assert (=> b!573254 (= res!362682 (= (select (arr!17220 a!3118) (index!24905 lt!261752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573254 (=> res!362682 e!329775)))

(assert (= (and d!84865 c!65641) b!573253))

(assert (= (and d!84865 (not c!65641)) b!573250))

(assert (= (and b!573250 c!65640) b!573251))

(assert (= (and b!573250 (not c!65640)) b!573247))

(assert (= (and d!84865 c!65642) b!573252))

(assert (= (and d!84865 (not c!65642)) b!573246))

(assert (= (and b!573246 res!362683) b!573249))

(assert (= (and b!573249 (not res!362684)) b!573254))

(assert (= (and b!573254 (not res!362682)) b!573248))

(declare-fun m!552289 () Bool)

(assert (=> b!573248 m!552289))

(declare-fun m!552293 () Bool)

(assert (=> d!84865 m!552293))

(assert (=> d!84865 m!552145))

(assert (=> b!573249 m!552289))

(declare-fun m!552297 () Bool)

(assert (=> b!573247 m!552297))

(assert (=> b!573247 m!552297))

(assert (=> b!573247 m!552107))

(declare-fun m!552299 () Bool)

(assert (=> b!573247 m!552299))

(assert (=> b!573254 m!552289))

(assert (=> b!573060 d!84865))

(declare-fun d!84867 () Bool)

(declare-fun lt!261759 () (_ BitVec 32))

(declare-fun lt!261758 () (_ BitVec 32))

(assert (=> d!84867 (= lt!261759 (bvmul (bvxor lt!261758 (bvlshr lt!261758 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84867 (= lt!261758 ((_ extract 31 0) (bvand (bvxor lt!261659 (bvlshr lt!261659 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84867 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362685 (let ((h!12326 ((_ extract 31 0) (bvand (bvxor lt!261659 (bvlshr lt!261659 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53775 (bvmul (bvxor h!12326 (bvlshr h!12326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53775 (bvlshr x!53775 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362685 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362685 #b00000000000000000000000000000000))))))

(assert (=> d!84867 (= (toIndex!0 lt!261659 mask!3119) (bvand (bvxor lt!261759 (bvlshr lt!261759 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573060 d!84867))

(declare-fun d!84871 () Bool)

(declare-fun lt!261761 () (_ BitVec 32))

(declare-fun lt!261760 () (_ BitVec 32))

(assert (=> d!84871 (= lt!261761 (bvmul (bvxor lt!261760 (bvlshr lt!261760 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84871 (= lt!261760 ((_ extract 31 0) (bvand (bvxor (select (arr!17220 a!3118) j!142) (bvlshr (select (arr!17220 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84871 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362685 (let ((h!12326 ((_ extract 31 0) (bvand (bvxor (select (arr!17220 a!3118) j!142) (bvlshr (select (arr!17220 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53775 (bvmul (bvxor h!12326 (bvlshr h!12326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53775 (bvlshr x!53775 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362685 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362685 #b00000000000000000000000000000000))))))

(assert (=> d!84871 (= (toIndex!0 (select (arr!17220 a!3118) j!142) mask!3119) (bvand (bvxor lt!261761 (bvlshr lt!261761 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573060 d!84871))

(declare-fun e!329801 () SeekEntryResult!5669)

(declare-fun b!573297 () Bool)

(declare-fun lt!261780 () SeekEntryResult!5669)

(assert (=> b!573297 (= e!329801 (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261780) (index!24905 lt!261780) (index!24905 lt!261780) lt!261659 lt!261663 mask!3119))))

(declare-fun b!573298 () Bool)

(declare-fun e!329802 () SeekEntryResult!5669)

(assert (=> b!573298 (= e!329802 (Found!5669 (index!24905 lt!261780)))))

(declare-fun b!573299 () Bool)

(declare-fun e!329803 () SeekEntryResult!5669)

(assert (=> b!573299 (= e!329803 Undefined!5669)))

(declare-fun b!573300 () Bool)

(assert (=> b!573300 (= e!329801 (MissingZero!5669 (index!24905 lt!261780)))))

(declare-fun b!573301 () Bool)

(assert (=> b!573301 (= e!329803 e!329802)))

(declare-fun lt!261778 () (_ BitVec 64))

(assert (=> b!573301 (= lt!261778 (select (arr!17220 lt!261663) (index!24905 lt!261780)))))

(declare-fun c!65664 () Bool)

(assert (=> b!573301 (= c!65664 (= lt!261778 lt!261659))))

(declare-fun d!84873 () Bool)

(declare-fun lt!261779 () SeekEntryResult!5669)

(assert (=> d!84873 (and (or (is-Undefined!5669 lt!261779) (not (is-Found!5669 lt!261779)) (and (bvsge (index!24904 lt!261779) #b00000000000000000000000000000000) (bvslt (index!24904 lt!261779) (size!17584 lt!261663)))) (or (is-Undefined!5669 lt!261779) (is-Found!5669 lt!261779) (not (is-MissingZero!5669 lt!261779)) (and (bvsge (index!24903 lt!261779) #b00000000000000000000000000000000) (bvslt (index!24903 lt!261779) (size!17584 lt!261663)))) (or (is-Undefined!5669 lt!261779) (is-Found!5669 lt!261779) (is-MissingZero!5669 lt!261779) (not (is-MissingVacant!5669 lt!261779)) (and (bvsge (index!24906 lt!261779) #b00000000000000000000000000000000) (bvslt (index!24906 lt!261779) (size!17584 lt!261663)))) (or (is-Undefined!5669 lt!261779) (ite (is-Found!5669 lt!261779) (= (select (arr!17220 lt!261663) (index!24904 lt!261779)) lt!261659) (ite (is-MissingZero!5669 lt!261779) (= (select (arr!17220 lt!261663) (index!24903 lt!261779)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5669 lt!261779) (= (select (arr!17220 lt!261663) (index!24906 lt!261779)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84873 (= lt!261779 e!329803)))

(declare-fun c!65665 () Bool)

(assert (=> d!84873 (= c!65665 (and (is-Intermediate!5669 lt!261780) (undefined!6481 lt!261780)))))

(assert (=> d!84873 (= lt!261780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261659 mask!3119) lt!261659 lt!261663 mask!3119))))

(assert (=> d!84873 (validMask!0 mask!3119)))

(assert (=> d!84873 (= (seekEntryOrOpen!0 lt!261659 lt!261663 mask!3119) lt!261779)))

(declare-fun b!573302 () Bool)

(declare-fun c!65666 () Bool)

(assert (=> b!573302 (= c!65666 (= lt!261778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573302 (= e!329802 e!329801)))

(assert (= (and d!84873 c!65665) b!573299))

(assert (= (and d!84873 (not c!65665)) b!573301))

(assert (= (and b!573301 c!65664) b!573298))

(assert (= (and b!573301 (not c!65664)) b!573302))

(assert (= (and b!573302 c!65666) b!573300))

(assert (= (and b!573302 (not c!65666)) b!573297))

(declare-fun m!552311 () Bool)

(assert (=> b!573297 m!552311))

(declare-fun m!552313 () Bool)

(assert (=> b!573301 m!552313))

(assert (=> d!84873 m!552137))

(declare-fun m!552315 () Bool)

(assert (=> d!84873 m!552315))

(declare-fun m!552317 () Bool)

(assert (=> d!84873 m!552317))

(assert (=> d!84873 m!552137))

(assert (=> d!84873 m!552145))

(declare-fun m!552319 () Bool)

(assert (=> d!84873 m!552319))

(declare-fun m!552321 () Bool)

(assert (=> d!84873 m!552321))

(assert (=> b!573059 d!84873))

(declare-fun b!573339 () Bool)

(declare-fun e!329822 () SeekEntryResult!5669)

(assert (=> b!573339 (= e!329822 (MissingVacant!5669 (index!24905 lt!261666)))))

(declare-fun b!573340 () Bool)

(declare-fun e!329823 () SeekEntryResult!5669)

(assert (=> b!573340 (= e!329823 Undefined!5669)))

(declare-fun d!84879 () Bool)

(declare-fun lt!261790 () SeekEntryResult!5669)

(assert (=> d!84879 (and (or (is-Undefined!5669 lt!261790) (not (is-Found!5669 lt!261790)) (and (bvsge (index!24904 lt!261790) #b00000000000000000000000000000000) (bvslt (index!24904 lt!261790) (size!17584 lt!261663)))) (or (is-Undefined!5669 lt!261790) (is-Found!5669 lt!261790) (not (is-MissingVacant!5669 lt!261790)) (not (= (index!24906 lt!261790) (index!24905 lt!261666))) (and (bvsge (index!24906 lt!261790) #b00000000000000000000000000000000) (bvslt (index!24906 lt!261790) (size!17584 lt!261663)))) (or (is-Undefined!5669 lt!261790) (ite (is-Found!5669 lt!261790) (= (select (arr!17220 lt!261663) (index!24904 lt!261790)) lt!261659) (and (is-MissingVacant!5669 lt!261790) (= (index!24906 lt!261790) (index!24905 lt!261666)) (= (select (arr!17220 lt!261663) (index!24906 lt!261790)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84879 (= lt!261790 e!329823)))

(declare-fun c!65679 () Bool)

(assert (=> d!84879 (= c!65679 (bvsge (x!53770 lt!261666) #b01111111111111111111111111111110))))

(declare-fun lt!261789 () (_ BitVec 64))

(assert (=> d!84879 (= lt!261789 (select (arr!17220 lt!261663) (index!24905 lt!261666)))))

(assert (=> d!84879 (validMask!0 mask!3119)))

(assert (=> d!84879 (= (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261666) (index!24905 lt!261666) (index!24905 lt!261666) lt!261659 lt!261663 mask!3119) lt!261790)))

(declare-fun b!573341 () Bool)

(assert (=> b!573341 (= e!329822 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53770 lt!261666) #b00000000000000000000000000000001) (nextIndex!0 (index!24905 lt!261666) (x!53770 lt!261666) mask!3119) (index!24905 lt!261666) lt!261659 lt!261663 mask!3119))))

(declare-fun b!573342 () Bool)

(declare-fun e!329824 () SeekEntryResult!5669)

(assert (=> b!573342 (= e!329824 (Found!5669 (index!24905 lt!261666)))))

(declare-fun b!573343 () Bool)

(assert (=> b!573343 (= e!329823 e!329824)))

(declare-fun c!65680 () Bool)

(assert (=> b!573343 (= c!65680 (= lt!261789 lt!261659))))

(declare-fun b!573344 () Bool)

(declare-fun c!65681 () Bool)

(assert (=> b!573344 (= c!65681 (= lt!261789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573344 (= e!329824 e!329822)))

(assert (= (and d!84879 c!65679) b!573340))

(assert (= (and d!84879 (not c!65679)) b!573343))

(assert (= (and b!573343 c!65680) b!573342))

(assert (= (and b!573343 (not c!65680)) b!573344))

(assert (= (and b!573344 c!65681) b!573339))

(assert (= (and b!573344 (not c!65681)) b!573341))

(declare-fun m!552339 () Bool)

(assert (=> d!84879 m!552339))

(declare-fun m!552341 () Bool)

(assert (=> d!84879 m!552341))

(declare-fun m!552343 () Bool)

(assert (=> d!84879 m!552343))

(assert (=> d!84879 m!552145))

(declare-fun m!552345 () Bool)

(assert (=> b!573341 m!552345))

(assert (=> b!573341 m!552345))

(declare-fun m!552347 () Bool)

(assert (=> b!573341 m!552347))

(assert (=> b!573059 d!84879))

(declare-fun d!84889 () Bool)

(assert (=> d!84889 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52466 d!84889))

(declare-fun d!84895 () Bool)

(assert (=> d!84895 (= (array_inv!13016 a!3118) (bvsge (size!17584 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52466 d!84895))

(declare-fun lt!261801 () SeekEntryResult!5669)

(declare-fun b!573345 () Bool)

(declare-fun e!329825 () SeekEntryResult!5669)

(assert (=> b!573345 (= e!329825 (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261801) (index!24905 lt!261801) (index!24905 lt!261801) k!1914 a!3118 mask!3119))))

(declare-fun b!573346 () Bool)

(declare-fun e!329826 () SeekEntryResult!5669)

(assert (=> b!573346 (= e!329826 (Found!5669 (index!24905 lt!261801)))))

(declare-fun b!573347 () Bool)

(declare-fun e!329827 () SeekEntryResult!5669)

(assert (=> b!573347 (= e!329827 Undefined!5669)))

(declare-fun b!573348 () Bool)

(assert (=> b!573348 (= e!329825 (MissingZero!5669 (index!24905 lt!261801)))))

(declare-fun b!573349 () Bool)

(assert (=> b!573349 (= e!329827 e!329826)))

(declare-fun lt!261799 () (_ BitVec 64))

(assert (=> b!573349 (= lt!261799 (select (arr!17220 a!3118) (index!24905 lt!261801)))))

(declare-fun c!65682 () Bool)

(assert (=> b!573349 (= c!65682 (= lt!261799 k!1914))))

(declare-fun d!84897 () Bool)

(declare-fun lt!261800 () SeekEntryResult!5669)

(assert (=> d!84897 (and (or (is-Undefined!5669 lt!261800) (not (is-Found!5669 lt!261800)) (and (bvsge (index!24904 lt!261800) #b00000000000000000000000000000000) (bvslt (index!24904 lt!261800) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261800) (is-Found!5669 lt!261800) (not (is-MissingZero!5669 lt!261800)) (and (bvsge (index!24903 lt!261800) #b00000000000000000000000000000000) (bvslt (index!24903 lt!261800) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261800) (is-Found!5669 lt!261800) (is-MissingZero!5669 lt!261800) (not (is-MissingVacant!5669 lt!261800)) (and (bvsge (index!24906 lt!261800) #b00000000000000000000000000000000) (bvslt (index!24906 lt!261800) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261800) (ite (is-Found!5669 lt!261800) (= (select (arr!17220 a!3118) (index!24904 lt!261800)) k!1914) (ite (is-MissingZero!5669 lt!261800) (= (select (arr!17220 a!3118) (index!24903 lt!261800)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5669 lt!261800) (= (select (arr!17220 a!3118) (index!24906 lt!261800)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84897 (= lt!261800 e!329827)))

(declare-fun c!65683 () Bool)

(assert (=> d!84897 (= c!65683 (and (is-Intermediate!5669 lt!261801) (undefined!6481 lt!261801)))))

(assert (=> d!84897 (= lt!261801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84897 (validMask!0 mask!3119)))

(assert (=> d!84897 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!261800)))

(declare-fun b!573350 () Bool)

(declare-fun c!65684 () Bool)

(assert (=> b!573350 (= c!65684 (= lt!261799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573350 (= e!329826 e!329825)))

(assert (= (and d!84897 c!65683) b!573347))

(assert (= (and d!84897 (not c!65683)) b!573349))

(assert (= (and b!573349 c!65682) b!573346))

(assert (= (and b!573349 (not c!65682)) b!573350))

(assert (= (and b!573350 c!65684) b!573348))

(assert (= (and b!573350 (not c!65684)) b!573345))

(declare-fun m!552349 () Bool)

(assert (=> b!573345 m!552349))

(declare-fun m!552351 () Bool)

(assert (=> b!573349 m!552351))

(declare-fun m!552353 () Bool)

(assert (=> d!84897 m!552353))

(declare-fun m!552355 () Bool)

(assert (=> d!84897 m!552355))

(declare-fun m!552357 () Bool)

(assert (=> d!84897 m!552357))

(assert (=> d!84897 m!552353))

(assert (=> d!84897 m!552145))

(declare-fun m!552359 () Bool)

(assert (=> d!84897 m!552359))

(declare-fun m!552361 () Bool)

(assert (=> d!84897 m!552361))

(assert (=> b!573054 d!84897))

(declare-fun d!84899 () Bool)

(assert (=> d!84899 (= (validKeyInArray!0 (select (arr!17220 a!3118) j!142)) (and (not (= (select (arr!17220 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17220 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573052 d!84899))

(declare-fun d!84901 () Bool)

(declare-fun res!362703 () Bool)

(declare-fun e!329832 () Bool)

(assert (=> d!84901 (=> res!362703 e!329832)))

(assert (=> d!84901 (= res!362703 (= (select (arr!17220 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84901 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!329832)))

(declare-fun b!573355 () Bool)

(declare-fun e!329833 () Bool)

(assert (=> b!573355 (= e!329832 e!329833)))

(declare-fun res!362704 () Bool)

(assert (=> b!573355 (=> (not res!362704) (not e!329833))))

(assert (=> b!573355 (= res!362704 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17584 a!3118)))))

(declare-fun b!573356 () Bool)

(assert (=> b!573356 (= e!329833 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84901 (not res!362703)) b!573355))

(assert (= (and b!573355 res!362704) b!573356))

(assert (=> d!84901 m!552249))

(declare-fun m!552363 () Bool)

(assert (=> b!573356 m!552363))

(assert (=> b!573053 d!84901))

(declare-fun lt!261808 () SeekEntryResult!5669)

(declare-fun e!329834 () SeekEntryResult!5669)

(declare-fun b!573357 () Bool)

(assert (=> b!573357 (= e!329834 (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261808) (index!24905 lt!261808) (index!24905 lt!261808) (select (arr!17220 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573358 () Bool)

(declare-fun e!329835 () SeekEntryResult!5669)

(assert (=> b!573358 (= e!329835 (Found!5669 (index!24905 lt!261808)))))

(declare-fun b!573359 () Bool)

(declare-fun e!329836 () SeekEntryResult!5669)

(assert (=> b!573359 (= e!329836 Undefined!5669)))

(declare-fun b!573360 () Bool)

(assert (=> b!573360 (= e!329834 (MissingZero!5669 (index!24905 lt!261808)))))

(declare-fun b!573361 () Bool)

(assert (=> b!573361 (= e!329836 e!329835)))

(declare-fun lt!261806 () (_ BitVec 64))

(assert (=> b!573361 (= lt!261806 (select (arr!17220 a!3118) (index!24905 lt!261808)))))

(declare-fun c!65685 () Bool)

(assert (=> b!573361 (= c!65685 (= lt!261806 (select (arr!17220 a!3118) j!142)))))

(declare-fun d!84903 () Bool)

(declare-fun lt!261807 () SeekEntryResult!5669)

(assert (=> d!84903 (and (or (is-Undefined!5669 lt!261807) (not (is-Found!5669 lt!261807)) (and (bvsge (index!24904 lt!261807) #b00000000000000000000000000000000) (bvslt (index!24904 lt!261807) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261807) (is-Found!5669 lt!261807) (not (is-MissingZero!5669 lt!261807)) (and (bvsge (index!24903 lt!261807) #b00000000000000000000000000000000) (bvslt (index!24903 lt!261807) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261807) (is-Found!5669 lt!261807) (is-MissingZero!5669 lt!261807) (not (is-MissingVacant!5669 lt!261807)) (and (bvsge (index!24906 lt!261807) #b00000000000000000000000000000000) (bvslt (index!24906 lt!261807) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261807) (ite (is-Found!5669 lt!261807) (= (select (arr!17220 a!3118) (index!24904 lt!261807)) (select (arr!17220 a!3118) j!142)) (ite (is-MissingZero!5669 lt!261807) (= (select (arr!17220 a!3118) (index!24903 lt!261807)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5669 lt!261807) (= (select (arr!17220 a!3118) (index!24906 lt!261807)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84903 (= lt!261807 e!329836)))

(declare-fun c!65686 () Bool)

(assert (=> d!84903 (= c!65686 (and (is-Intermediate!5669 lt!261808) (undefined!6481 lt!261808)))))

(assert (=> d!84903 (= lt!261808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17220 a!3118) j!142) mask!3119) (select (arr!17220 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84903 (validMask!0 mask!3119)))

(assert (=> d!84903 (= (seekEntryOrOpen!0 (select (arr!17220 a!3118) j!142) a!3118 mask!3119) lt!261807)))

(declare-fun b!573362 () Bool)

(declare-fun c!65687 () Bool)

(assert (=> b!573362 (= c!65687 (= lt!261806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573362 (= e!329835 e!329834)))

(assert (= (and d!84903 c!65686) b!573359))

(assert (= (and d!84903 (not c!65686)) b!573361))

(assert (= (and b!573361 c!65685) b!573358))

(assert (= (and b!573361 (not c!65685)) b!573362))

(assert (= (and b!573362 c!65687) b!573360))

(assert (= (and b!573362 (not c!65687)) b!573357))

(assert (=> b!573357 m!552107))

(declare-fun m!552365 () Bool)

(assert (=> b!573357 m!552365))

(declare-fun m!552367 () Bool)

(assert (=> b!573361 m!552367))

(assert (=> d!84903 m!552129))

(assert (=> d!84903 m!552107))

(declare-fun m!552369 () Bool)

(assert (=> d!84903 m!552369))

(declare-fun m!552371 () Bool)

(assert (=> d!84903 m!552371))

(assert (=> d!84903 m!552107))

(assert (=> d!84903 m!552129))

(assert (=> d!84903 m!552145))

(declare-fun m!552373 () Bool)

(assert (=> d!84903 m!552373))

(declare-fun m!552375 () Bool)

(assert (=> d!84903 m!552375))

(assert (=> b!573058 d!84903))

(declare-fun b!573399 () Bool)

(declare-fun e!329861 () Bool)

(declare-fun call!32636 () Bool)

(assert (=> b!573399 (= e!329861 call!32636)))

(declare-fun b!573400 () Bool)

(declare-fun e!329860 () Bool)

(assert (=> b!573400 (= e!329860 call!32636)))

(declare-fun bm!32633 () Bool)

(assert (=> bm!32633 (= call!32636 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573401 () Bool)

(assert (=> b!573401 (= e!329861 e!329860)))

(declare-fun lt!261820 () (_ BitVec 64))

(assert (=> b!573401 (= lt!261820 (select (arr!17220 a!3118) j!142))))

(declare-fun lt!261822 () Unit!18040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35863 (_ BitVec 64) (_ BitVec 32)) Unit!18040)

(assert (=> b!573401 (= lt!261822 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261820 j!142))))

(assert (=> b!573401 (arrayContainsKey!0 a!3118 lt!261820 #b00000000000000000000000000000000)))

(declare-fun lt!261821 () Unit!18040)

(assert (=> b!573401 (= lt!261821 lt!261822)))

(declare-fun res!362716 () Bool)

(assert (=> b!573401 (= res!362716 (= (seekEntryOrOpen!0 (select (arr!17220 a!3118) j!142) a!3118 mask!3119) (Found!5669 j!142)))))

(assert (=> b!573401 (=> (not res!362716) (not e!329860))))

(declare-fun d!84905 () Bool)

(declare-fun res!362715 () Bool)

(declare-fun e!329862 () Bool)

(assert (=> d!84905 (=> res!362715 e!329862)))

(assert (=> d!84905 (= res!362715 (bvsge j!142 (size!17584 a!3118)))))

(assert (=> d!84905 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!329862)))

(declare-fun b!573402 () Bool)

(assert (=> b!573402 (= e!329862 e!329861)))

(declare-fun c!65701 () Bool)

(assert (=> b!573402 (= c!65701 (validKeyInArray!0 (select (arr!17220 a!3118) j!142)))))

(assert (= (and d!84905 (not res!362715)) b!573402))

(assert (= (and b!573402 c!65701) b!573401))

(assert (= (and b!573402 (not c!65701)) b!573399))

(assert (= (and b!573401 res!362716) b!573400))

(assert (= (or b!573400 b!573399) bm!32633))

(declare-fun m!552391 () Bool)

(assert (=> bm!32633 m!552391))

(assert (=> b!573401 m!552107))

(declare-fun m!552393 () Bool)

(assert (=> b!573401 m!552393))

(declare-fun m!552395 () Bool)

(assert (=> b!573401 m!552395))

(assert (=> b!573401 m!552107))

(assert (=> b!573401 m!552119))

(assert (=> b!573402 m!552107))

(assert (=> b!573402 m!552107))

(assert (=> b!573402 m!552111))

(assert (=> b!573058 d!84905))

(declare-fun d!84915 () Bool)

(assert (=> d!84915 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!261825 () Unit!18040)

(declare-fun choose!38 (array!35863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18040)

(assert (=> d!84915 (= lt!261825 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84915 (validMask!0 mask!3119)))

(assert (=> d!84915 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!261825)))

(declare-fun bs!17755 () Bool)

(assert (= bs!17755 d!84915))

(assert (=> bs!17755 m!552115))

(declare-fun m!552397 () Bool)

(assert (=> bs!17755 m!552397))

(assert (=> bs!17755 m!552145))

(assert (=> b!573058 d!84915))

(declare-fun b!573408 () Bool)

(declare-fun e!329867 () SeekEntryResult!5669)

(assert (=> b!573408 (= e!329867 (MissingVacant!5669 (index!24905 lt!261666)))))

(declare-fun b!573409 () Bool)

(declare-fun e!329868 () SeekEntryResult!5669)

(assert (=> b!573409 (= e!329868 Undefined!5669)))

(declare-fun d!84917 () Bool)

(declare-fun lt!261827 () SeekEntryResult!5669)

(assert (=> d!84917 (and (or (is-Undefined!5669 lt!261827) (not (is-Found!5669 lt!261827)) (and (bvsge (index!24904 lt!261827) #b00000000000000000000000000000000) (bvslt (index!24904 lt!261827) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261827) (is-Found!5669 lt!261827) (not (is-MissingVacant!5669 lt!261827)) (not (= (index!24906 lt!261827) (index!24905 lt!261666))) (and (bvsge (index!24906 lt!261827) #b00000000000000000000000000000000) (bvslt (index!24906 lt!261827) (size!17584 a!3118)))) (or (is-Undefined!5669 lt!261827) (ite (is-Found!5669 lt!261827) (= (select (arr!17220 a!3118) (index!24904 lt!261827)) (select (arr!17220 a!3118) j!142)) (and (is-MissingVacant!5669 lt!261827) (= (index!24906 lt!261827) (index!24905 lt!261666)) (= (select (arr!17220 a!3118) (index!24906 lt!261827)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84917 (= lt!261827 e!329868)))

(declare-fun c!65703 () Bool)

(assert (=> d!84917 (= c!65703 (bvsge (x!53770 lt!261666) #b01111111111111111111111111111110))))

(declare-fun lt!261826 () (_ BitVec 64))

(assert (=> d!84917 (= lt!261826 (select (arr!17220 a!3118) (index!24905 lt!261666)))))

(assert (=> d!84917 (validMask!0 mask!3119)))

(assert (=> d!84917 (= (seekKeyOrZeroReturnVacant!0 (x!53770 lt!261666) (index!24905 lt!261666) (index!24905 lt!261666) (select (arr!17220 a!3118) j!142) a!3118 mask!3119) lt!261827)))

(declare-fun b!573410 () Bool)

(assert (=> b!573410 (= e!329867 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53770 lt!261666) #b00000000000000000000000000000001) (nextIndex!0 (index!24905 lt!261666) (x!53770 lt!261666) mask!3119) (index!24905 lt!261666) (select (arr!17220 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573411 () Bool)

(declare-fun e!329869 () SeekEntryResult!5669)

(assert (=> b!573411 (= e!329869 (Found!5669 (index!24905 lt!261666)))))

(declare-fun b!573412 () Bool)

(assert (=> b!573412 (= e!329868 e!329869)))

(declare-fun c!65704 () Bool)

(assert (=> b!573412 (= c!65704 (= lt!261826 (select (arr!17220 a!3118) j!142)))))

(declare-fun b!573413 () Bool)

(declare-fun c!65705 () Bool)

(assert (=> b!573413 (= c!65705 (= lt!261826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573413 (= e!329869 e!329867)))

(assert (= (and d!84917 c!65703) b!573409))

(assert (= (and d!84917 (not c!65703)) b!573412))

(assert (= (and b!573412 c!65704) b!573411))

(assert (= (and b!573412 (not c!65704)) b!573413))

(assert (= (and b!573413 c!65705) b!573408))

(assert (= (and b!573413 (not c!65705)) b!573410))

(declare-fun m!552403 () Bool)

(assert (=> d!84917 m!552403))

(declare-fun m!552405 () Bool)

(assert (=> d!84917 m!552405))

(assert (=> d!84917 m!552109))

(assert (=> d!84917 m!552145))

(assert (=> b!573410 m!552345))

(assert (=> b!573410 m!552345))

(assert (=> b!573410 m!552107))

(declare-fun m!552407 () Bool)

(assert (=> b!573410 m!552407))

(assert (=> b!573051 d!84917))

(declare-fun d!84921 () Bool)

(assert (=> d!84921 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573057 d!84921))

(declare-fun b!573420 () Bool)

(declare-fun e!329874 () Bool)

(declare-fun call!32640 () Bool)

(assert (=> b!573420 (= e!329874 call!32640)))

(declare-fun b!573421 () Bool)

(declare-fun e!329873 () Bool)

(assert (=> b!573421 (= e!329873 call!32640)))

(declare-fun bm!32637 () Bool)

(assert (=> bm!32637 (= call!32640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573422 () Bool)

(assert (=> b!573422 (= e!329874 e!329873)))

(declare-fun lt!261831 () (_ BitVec 64))

(assert (=> b!573422 (= lt!261831 (select (arr!17220 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261833 () Unit!18040)

(assert (=> b!573422 (= lt!261833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261831 #b00000000000000000000000000000000))))

(assert (=> b!573422 (arrayContainsKey!0 a!3118 lt!261831 #b00000000000000000000000000000000)))

(declare-fun lt!261832 () Unit!18040)

(assert (=> b!573422 (= lt!261832 lt!261833)))

(declare-fun res!362721 () Bool)

(assert (=> b!573422 (= res!362721 (= (seekEntryOrOpen!0 (select (arr!17220 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5669 #b00000000000000000000000000000000)))))

(assert (=> b!573422 (=> (not res!362721) (not e!329873))))

(declare-fun d!84923 () Bool)

(declare-fun res!362720 () Bool)

(declare-fun e!329875 () Bool)

(assert (=> d!84923 (=> res!362720 e!329875)))

(assert (=> d!84923 (= res!362720 (bvsge #b00000000000000000000000000000000 (size!17584 a!3118)))))

(assert (=> d!84923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!329875)))

(declare-fun b!573423 () Bool)

(assert (=> b!573423 (= e!329875 e!329874)))

(declare-fun c!65709 () Bool)

(assert (=> b!573423 (= c!65709 (validKeyInArray!0 (select (arr!17220 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84923 (not res!362720)) b!573423))

(assert (= (and b!573423 c!65709) b!573422))

(assert (= (and b!573423 (not c!65709)) b!573420))

(assert (= (and b!573422 res!362721) b!573421))

(assert (= (or b!573421 b!573420) bm!32637))

(declare-fun m!552409 () Bool)

(assert (=> bm!32637 m!552409))

(assert (=> b!573422 m!552249))

(declare-fun m!552411 () Bool)

(assert (=> b!573422 m!552411))

(declare-fun m!552413 () Bool)

(assert (=> b!573422 m!552413))

(assert (=> b!573422 m!552249))

(declare-fun m!552415 () Bool)

(assert (=> b!573422 m!552415))

(assert (=> b!573423 m!552249))

(assert (=> b!573423 m!552249))

(assert (=> b!573423 m!552253))

(assert (=> b!573062 d!84923))

(push 1)

(assert (not d!84917))

(assert (not b!573402))

(assert (not d!84915))

(assert (not d!84879))

(assert (not d!84873))

(assert (not d!84857))

(assert (not b!573345))

(assert (not b!573182))

(assert (not b!573341))

(assert (not b!573410))

(assert (not bm!32637))

(assert (not bm!32633))

(assert (not b!573234))

(assert (not b!573297))

(assert (not d!84865))

(assert (not b!573422))

(assert (not b!573423))

(assert (not d!84903))

(assert (not b!573401))

(assert (not b!573247))

(assert (not b!573181))

(assert (not bm!32624))

(assert (not b!573357))

(assert (not d!84897))

(assert (not b!573184))

(assert (not b!573356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

