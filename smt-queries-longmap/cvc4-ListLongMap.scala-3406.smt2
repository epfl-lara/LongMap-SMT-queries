; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47230 () Bool)

(assert start!47230)

(declare-fun res!318245 () Bool)

(declare-fun e!303366 () Bool)

(assert (=> start!47230 (=> (not res!318245) (not e!303366))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47230 (= res!318245 (validMask!0 mask!3524))))

(assert (=> start!47230 e!303366))

(assert (=> start!47230 true))

(declare-datatypes ((array!33182 0))(
  ( (array!33183 (arr!15950 (Array (_ BitVec 32) (_ BitVec 64))) (size!16314 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33182)

(declare-fun array_inv!11746 (array!33182) Bool)

(assert (=> start!47230 (array_inv!11746 a!3235)))

(declare-fun b!519916 () Bool)

(declare-fun res!318247 () Bool)

(assert (=> b!519916 (=> (not res!318247) (not e!303366))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519916 (= res!318247 (and (= (size!16314 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16314 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16314 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519917 () Bool)

(declare-fun res!318242 () Bool)

(declare-fun e!303364 () Bool)

(assert (=> b!519917 (=> res!318242 e!303364)))

(declare-datatypes ((SeekEntryResult!4417 0))(
  ( (MissingZero!4417 (index!19865 (_ BitVec 32))) (Found!4417 (index!19866 (_ BitVec 32))) (Intermediate!4417 (undefined!5229 Bool) (index!19867 (_ BitVec 32)) (x!48841 (_ BitVec 32))) (Undefined!4417) (MissingVacant!4417 (index!19868 (_ BitVec 32))) )
))
(declare-fun lt!238120 () SeekEntryResult!4417)

(assert (=> b!519917 (= res!318242 (or (undefined!5229 lt!238120) (not (is-Intermediate!4417 lt!238120))))))

(declare-fun b!519918 () Bool)

(declare-datatypes ((Unit!16120 0))(
  ( (Unit!16121) )
))
(declare-fun e!303360 () Unit!16120)

(declare-fun Unit!16122 () Unit!16120)

(assert (=> b!519918 (= e!303360 Unit!16122)))

(declare-fun lt!238118 () (_ BitVec 32))

(declare-fun lt!238113 () Unit!16120)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33182 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16120)

(assert (=> b!519918 (= lt!238113 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238118 #b00000000000000000000000000000000 (index!19867 lt!238120) (x!48841 lt!238120) mask!3524))))

(declare-fun lt!238112 () array!33182)

(declare-fun res!318250 () Bool)

(declare-fun lt!238117 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33182 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!519918 (= res!318250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238118 lt!238117 lt!238112 mask!3524) (Intermediate!4417 false (index!19867 lt!238120) (x!48841 lt!238120))))))

(declare-fun e!303362 () Bool)

(assert (=> b!519918 (=> (not res!318250) (not e!303362))))

(assert (=> b!519918 e!303362))

(declare-fun b!519919 () Bool)

(declare-fun res!318243 () Bool)

(declare-fun e!303363 () Bool)

(assert (=> b!519919 (=> (not res!318243) (not e!303363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33182 (_ BitVec 32)) Bool)

(assert (=> b!519919 (= res!318243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519920 () Bool)

(assert (=> b!519920 (= e!303362 false)))

(declare-fun b!519921 () Bool)

(declare-fun res!318246 () Bool)

(assert (=> b!519921 (=> (not res!318246) (not e!303363))))

(declare-datatypes ((List!10108 0))(
  ( (Nil!10105) (Cons!10104 (h!11020 (_ BitVec 64)) (t!16336 List!10108)) )
))
(declare-fun arrayNoDuplicates!0 (array!33182 (_ BitVec 32) List!10108) Bool)

(assert (=> b!519921 (= res!318246 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10105))))

(declare-fun b!519922 () Bool)

(assert (=> b!519922 (= e!303366 e!303363)))

(declare-fun res!318248 () Bool)

(assert (=> b!519922 (=> (not res!318248) (not e!303363))))

(declare-fun lt!238119 () SeekEntryResult!4417)

(assert (=> b!519922 (= res!318248 (or (= lt!238119 (MissingZero!4417 i!1204)) (= lt!238119 (MissingVacant!4417 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33182 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!519922 (= lt!238119 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!519923 () Bool)

(assert (=> b!519923 (= e!303364 (not (= (select (arr!15950 a!3235) (index!19867 lt!238120)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!519923 (or (= (select (arr!15950 a!3235) (index!19867 lt!238120)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15950 a!3235) (index!19867 lt!238120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238116 () Unit!16120)

(assert (=> b!519923 (= lt!238116 e!303360)))

(declare-fun c!61136 () Bool)

(assert (=> b!519923 (= c!61136 (= (select (arr!15950 a!3235) (index!19867 lt!238120)) (select (arr!15950 a!3235) j!176)))))

(assert (=> b!519923 (and (bvslt (x!48841 lt!238120) #b01111111111111111111111111111110) (or (= (select (arr!15950 a!3235) (index!19867 lt!238120)) (select (arr!15950 a!3235) j!176)) (= (select (arr!15950 a!3235) (index!19867 lt!238120)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15950 a!3235) (index!19867 lt!238120)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519924 () Bool)

(declare-fun res!318251 () Bool)

(assert (=> b!519924 (=> (not res!318251) (not e!303366))))

(declare-fun arrayContainsKey!0 (array!33182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519924 (= res!318251 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519925 () Bool)

(declare-fun res!318244 () Bool)

(assert (=> b!519925 (=> (not res!318244) (not e!303366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519925 (= res!318244 (validKeyInArray!0 (select (arr!15950 a!3235) j!176)))))

(declare-fun b!519926 () Bool)

(declare-fun res!318240 () Bool)

(assert (=> b!519926 (=> (not res!318240) (not e!303366))))

(assert (=> b!519926 (= res!318240 (validKeyInArray!0 k!2280))))

(declare-fun b!519927 () Bool)

(assert (=> b!519927 (= e!303363 (not e!303364))))

(declare-fun res!318249 () Bool)

(assert (=> b!519927 (=> res!318249 e!303364)))

(declare-fun lt!238114 () (_ BitVec 32))

(assert (=> b!519927 (= res!318249 (= lt!238120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238114 lt!238117 lt!238112 mask!3524)))))

(assert (=> b!519927 (= lt!238120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238118 (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519927 (= lt!238114 (toIndex!0 lt!238117 mask!3524))))

(assert (=> b!519927 (= lt!238117 (select (store (arr!15950 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!519927 (= lt!238118 (toIndex!0 (select (arr!15950 a!3235) j!176) mask!3524))))

(assert (=> b!519927 (= lt!238112 (array!33183 (store (arr!15950 a!3235) i!1204 k!2280) (size!16314 a!3235)))))

(declare-fun e!303361 () Bool)

(assert (=> b!519927 e!303361))

(declare-fun res!318241 () Bool)

(assert (=> b!519927 (=> (not res!318241) (not e!303361))))

(assert (=> b!519927 (= res!318241 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238115 () Unit!16120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16120)

(assert (=> b!519927 (= lt!238115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519928 () Bool)

(declare-fun Unit!16123 () Unit!16120)

(assert (=> b!519928 (= e!303360 Unit!16123)))

(declare-fun b!519929 () Bool)

(assert (=> b!519929 (= e!303361 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) j!176) a!3235 mask!3524) (Found!4417 j!176)))))

(assert (= (and start!47230 res!318245) b!519916))

(assert (= (and b!519916 res!318247) b!519925))

(assert (= (and b!519925 res!318244) b!519926))

(assert (= (and b!519926 res!318240) b!519924))

(assert (= (and b!519924 res!318251) b!519922))

(assert (= (and b!519922 res!318248) b!519919))

(assert (= (and b!519919 res!318243) b!519921))

(assert (= (and b!519921 res!318246) b!519927))

(assert (= (and b!519927 res!318241) b!519929))

(assert (= (and b!519927 (not res!318249)) b!519917))

(assert (= (and b!519917 (not res!318242)) b!519923))

(assert (= (and b!519923 c!61136) b!519918))

(assert (= (and b!519923 (not c!61136)) b!519928))

(assert (= (and b!519918 res!318250) b!519920))

(declare-fun m!501015 () Bool)

(assert (=> b!519927 m!501015))

(declare-fun m!501017 () Bool)

(assert (=> b!519927 m!501017))

(declare-fun m!501019 () Bool)

(assert (=> b!519927 m!501019))

(declare-fun m!501021 () Bool)

(assert (=> b!519927 m!501021))

(declare-fun m!501023 () Bool)

(assert (=> b!519927 m!501023))

(declare-fun m!501025 () Bool)

(assert (=> b!519927 m!501025))

(assert (=> b!519927 m!501023))

(declare-fun m!501027 () Bool)

(assert (=> b!519927 m!501027))

(assert (=> b!519927 m!501023))

(declare-fun m!501029 () Bool)

(assert (=> b!519927 m!501029))

(declare-fun m!501031 () Bool)

(assert (=> b!519927 m!501031))

(declare-fun m!501033 () Bool)

(assert (=> b!519923 m!501033))

(assert (=> b!519923 m!501023))

(declare-fun m!501035 () Bool)

(assert (=> b!519926 m!501035))

(declare-fun m!501037 () Bool)

(assert (=> b!519918 m!501037))

(declare-fun m!501039 () Bool)

(assert (=> b!519918 m!501039))

(declare-fun m!501041 () Bool)

(assert (=> start!47230 m!501041))

(declare-fun m!501043 () Bool)

(assert (=> start!47230 m!501043))

(assert (=> b!519929 m!501023))

(assert (=> b!519929 m!501023))

(declare-fun m!501045 () Bool)

(assert (=> b!519929 m!501045))

(assert (=> b!519925 m!501023))

(assert (=> b!519925 m!501023))

(declare-fun m!501047 () Bool)

(assert (=> b!519925 m!501047))

(declare-fun m!501049 () Bool)

(assert (=> b!519924 m!501049))

(declare-fun m!501051 () Bool)

(assert (=> b!519922 m!501051))

(declare-fun m!501053 () Bool)

(assert (=> b!519919 m!501053))

(declare-fun m!501055 () Bool)

(assert (=> b!519921 m!501055))

(push 1)

(assert (not b!519921))

(assert (not b!519929))

(assert (not b!519919))

(assert (not b!519927))

(assert (not start!47230))

(assert (not b!519925))

(assert (not b!519926))

(assert (not b!519924))

(assert (not b!519918))

(assert (not b!519922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80187 () Bool)

(declare-fun e!303409 () Bool)

(assert (=> d!80187 e!303409))

(declare-fun res!318281 () Bool)

(assert (=> d!80187 (=> (not res!318281) (not e!303409))))

(assert (=> d!80187 (= res!318281 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16314 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16314 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16314 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16314 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16314 a!3235))))))

(declare-fun lt!238160 () Unit!16120)

(declare-fun choose!47 (array!33182 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16120)

(assert (=> d!80187 (= lt!238160 (choose!47 a!3235 i!1204 k!2280 j!176 lt!238118 #b00000000000000000000000000000000 (index!19867 lt!238120) (x!48841 lt!238120) mask!3524))))

(assert (=> d!80187 (validMask!0 mask!3524)))

(assert (=> d!80187 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238118 #b00000000000000000000000000000000 (index!19867 lt!238120) (x!48841 lt!238120) mask!3524) lt!238160)))

(declare-fun b!519994 () Bool)

(assert (=> b!519994 (= e!303409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238118 (select (store (arr!15950 a!3235) i!1204 k!2280) j!176) (array!33183 (store (arr!15950 a!3235) i!1204 k!2280) (size!16314 a!3235)) mask!3524) (Intermediate!4417 false (index!19867 lt!238120) (x!48841 lt!238120))))))

(assert (= (and d!80187 res!318281) b!519994))

(declare-fun m!501093 () Bool)

(assert (=> d!80187 m!501093))

(assert (=> d!80187 m!501041))

(assert (=> b!519994 m!501015))

(assert (=> b!519994 m!501021))

(assert (=> b!519994 m!501021))

(declare-fun m!501095 () Bool)

(assert (=> b!519994 m!501095))

(assert (=> b!519918 d!80187))

(declare-fun b!520047 () Bool)

(declare-fun lt!238180 () SeekEntryResult!4417)

(assert (=> b!520047 (and (bvsge (index!19867 lt!238180) #b00000000000000000000000000000000) (bvslt (index!19867 lt!238180) (size!16314 lt!238112)))))

(declare-fun e!303441 () Bool)

(assert (=> b!520047 (= e!303441 (= (select (arr!15950 lt!238112) (index!19867 lt!238180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520048 () Bool)

(declare-fun e!303443 () SeekEntryResult!4417)

(declare-fun e!303439 () SeekEntryResult!4417)

(assert (=> b!520048 (= e!303443 e!303439)))

(declare-fun c!61176 () Bool)

(declare-fun lt!238181 () (_ BitVec 64))

(assert (=> b!520048 (= c!61176 (or (= lt!238181 lt!238117) (= (bvadd lt!238181 lt!238181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520049 () Bool)

(assert (=> b!520049 (= e!303439 (Intermediate!4417 false lt!238118 #b00000000000000000000000000000000))))

(declare-fun b!520050 () Bool)

(assert (=> b!520050 (and (bvsge (index!19867 lt!238180) #b00000000000000000000000000000000) (bvslt (index!19867 lt!238180) (size!16314 lt!238112)))))

(declare-fun res!318292 () Bool)

(assert (=> b!520050 (= res!318292 (= (select (arr!15950 lt!238112) (index!19867 lt!238180)) lt!238117))))

(assert (=> b!520050 (=> res!318292 e!303441)))

(declare-fun e!303442 () Bool)

(assert (=> b!520050 (= e!303442 e!303441)))

(declare-fun b!520051 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520051 (= e!303439 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238118 #b00000000000000000000000000000000 mask!3524) lt!238117 lt!238112 mask!3524))))

(declare-fun b!520052 () Bool)

(assert (=> b!520052 (= e!303443 (Intermediate!4417 true lt!238118 #b00000000000000000000000000000000))))

(declare-fun b!520053 () Bool)

(declare-fun e!303440 () Bool)

(assert (=> b!520053 (= e!303440 e!303442)))

(declare-fun res!318294 () Bool)

(assert (=> b!520053 (= res!318294 (and (is-Intermediate!4417 lt!238180) (not (undefined!5229 lt!238180)) (bvslt (x!48841 lt!238180) #b01111111111111111111111111111110) (bvsge (x!48841 lt!238180) #b00000000000000000000000000000000) (bvsge (x!48841 lt!238180) #b00000000000000000000000000000000)))))

(assert (=> b!520053 (=> (not res!318294) (not e!303442))))

(declare-fun b!520054 () Bool)

(assert (=> b!520054 (and (bvsge (index!19867 lt!238180) #b00000000000000000000000000000000) (bvslt (index!19867 lt!238180) (size!16314 lt!238112)))))

(declare-fun res!318293 () Bool)

(assert (=> b!520054 (= res!318293 (= (select (arr!15950 lt!238112) (index!19867 lt!238180)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520054 (=> res!318293 e!303441)))

(declare-fun b!520055 () Bool)

(assert (=> b!520055 (= e!303440 (bvsge (x!48841 lt!238180) #b01111111111111111111111111111110))))

(declare-fun d!80197 () Bool)

(assert (=> d!80197 e!303440))

(declare-fun c!61177 () Bool)

(assert (=> d!80197 (= c!61177 (and (is-Intermediate!4417 lt!238180) (undefined!5229 lt!238180)))))

(assert (=> d!80197 (= lt!238180 e!303443)))

(declare-fun c!61178 () Bool)

(assert (=> d!80197 (= c!61178 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80197 (= lt!238181 (select (arr!15950 lt!238112) lt!238118))))

(assert (=> d!80197 (validMask!0 mask!3524)))

(assert (=> d!80197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238118 lt!238117 lt!238112 mask!3524) lt!238180)))

(assert (= (and d!80197 c!61178) b!520052))

(assert (= (and d!80197 (not c!61178)) b!520048))

(assert (= (and b!520048 c!61176) b!520049))

(assert (= (and b!520048 (not c!61176)) b!520051))

(assert (= (and d!80197 c!61177) b!520055))

(assert (= (and d!80197 (not c!61177)) b!520053))

(assert (= (and b!520053 res!318294) b!520050))

(assert (= (and b!520050 (not res!318292)) b!520054))

(assert (= (and b!520054 (not res!318293)) b!520047))

(declare-fun m!501113 () Bool)

(assert (=> b!520054 m!501113))

(declare-fun m!501115 () Bool)

(assert (=> d!80197 m!501115))

(assert (=> d!80197 m!501041))

(declare-fun m!501117 () Bool)

(assert (=> b!520051 m!501117))

(assert (=> b!520051 m!501117))

(declare-fun m!501121 () Bool)

(assert (=> b!520051 m!501121))

(assert (=> b!520047 m!501113))

(assert (=> b!520050 m!501113))

(assert (=> b!519918 d!80197))

(declare-fun d!80203 () Bool)

(declare-fun lt!238213 () SeekEntryResult!4417)

(assert (=> d!80203 (and (or (is-Undefined!4417 lt!238213) (not (is-Found!4417 lt!238213)) (and (bvsge (index!19866 lt!238213) #b00000000000000000000000000000000) (bvslt (index!19866 lt!238213) (size!16314 a!3235)))) (or (is-Undefined!4417 lt!238213) (is-Found!4417 lt!238213) (not (is-MissingZero!4417 lt!238213)) (and (bvsge (index!19865 lt!238213) #b00000000000000000000000000000000) (bvslt (index!19865 lt!238213) (size!16314 a!3235)))) (or (is-Undefined!4417 lt!238213) (is-Found!4417 lt!238213) (is-MissingZero!4417 lt!238213) (not (is-MissingVacant!4417 lt!238213)) (and (bvsge (index!19868 lt!238213) #b00000000000000000000000000000000) (bvslt (index!19868 lt!238213) (size!16314 a!3235)))) (or (is-Undefined!4417 lt!238213) (ite (is-Found!4417 lt!238213) (= (select (arr!15950 a!3235) (index!19866 lt!238213)) (select (arr!15950 a!3235) j!176)) (ite (is-MissingZero!4417 lt!238213) (= (select (arr!15950 a!3235) (index!19865 lt!238213)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4417 lt!238213) (= (select (arr!15950 a!3235) (index!19868 lt!238213)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303476 () SeekEntryResult!4417)

(assert (=> d!80203 (= lt!238213 e!303476)))

(declare-fun c!61198 () Bool)

(declare-fun lt!238215 () SeekEntryResult!4417)

(assert (=> d!80203 (= c!61198 (and (is-Intermediate!4417 lt!238215) (undefined!5229 lt!238215)))))

(assert (=> d!80203 (= lt!238215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15950 a!3235) j!176) mask!3524) (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80203 (validMask!0 mask!3524)))

(assert (=> d!80203 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) j!176) a!3235 mask!3524) lt!238213)))

(declare-fun b!520106 () Bool)

(declare-fun e!303478 () SeekEntryResult!4417)

(assert (=> b!520106 (= e!303476 e!303478)))

(declare-fun lt!238214 () (_ BitVec 64))

(assert (=> b!520106 (= lt!238214 (select (arr!15950 a!3235) (index!19867 lt!238215)))))

(declare-fun c!61197 () Bool)

(assert (=> b!520106 (= c!61197 (= lt!238214 (select (arr!15950 a!3235) j!176)))))

(declare-fun b!520107 () Bool)

(assert (=> b!520107 (= e!303478 (Found!4417 (index!19867 lt!238215)))))

(declare-fun b!520108 () Bool)

(assert (=> b!520108 (= e!303476 Undefined!4417)))

(declare-fun e!303477 () SeekEntryResult!4417)

(declare-fun b!520109 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33182 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!520109 (= e!303477 (seekKeyOrZeroReturnVacant!0 (x!48841 lt!238215) (index!19867 lt!238215) (index!19867 lt!238215) (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520110 () Bool)

(declare-fun c!61196 () Bool)

(assert (=> b!520110 (= c!61196 (= lt!238214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520110 (= e!303478 e!303477)))

(declare-fun b!520111 () Bool)

(assert (=> b!520111 (= e!303477 (MissingZero!4417 (index!19867 lt!238215)))))

(assert (= (and d!80203 c!61198) b!520108))

(assert (= (and d!80203 (not c!61198)) b!520106))

(assert (= (and b!520106 c!61197) b!520107))

(assert (= (and b!520106 (not c!61197)) b!520110))

(assert (= (and b!520110 c!61196) b!520111))

(assert (= (and b!520110 (not c!61196)) b!520109))

(assert (=> d!80203 m!501027))

(assert (=> d!80203 m!501023))

(declare-fun m!501177 () Bool)

(assert (=> d!80203 m!501177))

(declare-fun m!501179 () Bool)

(assert (=> d!80203 m!501179))

(declare-fun m!501181 () Bool)

(assert (=> d!80203 m!501181))

(declare-fun m!501183 () Bool)

(assert (=> d!80203 m!501183))

(assert (=> d!80203 m!501023))

(assert (=> d!80203 m!501027))

(assert (=> d!80203 m!501041))

(declare-fun m!501185 () Bool)

(assert (=> b!520106 m!501185))

(assert (=> b!520109 m!501023))

(declare-fun m!501187 () Bool)

(assert (=> b!520109 m!501187))

(assert (=> b!519929 d!80203))

(declare-fun d!80227 () Bool)

(declare-fun res!318316 () Bool)

(declare-fun e!303487 () Bool)

(assert (=> d!80227 (=> res!318316 e!303487)))

(assert (=> d!80227 (= res!318316 (= (select (arr!15950 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80227 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!303487)))

(declare-fun b!520124 () Bool)

(declare-fun e!303488 () Bool)

(assert (=> b!520124 (= e!303487 e!303488)))

(declare-fun res!318317 () Bool)

(assert (=> b!520124 (=> (not res!318317) (not e!303488))))

(assert (=> b!520124 (= res!318317 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16314 a!3235)))))

(declare-fun b!520125 () Bool)

(assert (=> b!520125 (= e!303488 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80227 (not res!318316)) b!520124))

(assert (= (and b!520124 res!318317) b!520125))

(declare-fun m!501189 () Bool)

(assert (=> d!80227 m!501189))

(declare-fun m!501191 () Bool)

(assert (=> b!520125 m!501191))

(assert (=> b!519924 d!80227))

(declare-fun b!520178 () Bool)

(declare-fun e!303523 () Bool)

(declare-fun e!303524 () Bool)

(assert (=> b!520178 (= e!303523 e!303524)))

(declare-fun lt!238234 () (_ BitVec 64))

(assert (=> b!520178 (= lt!238234 (select (arr!15950 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238233 () Unit!16120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33182 (_ BitVec 64) (_ BitVec 32)) Unit!16120)

(assert (=> b!520178 (= lt!238233 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238234 #b00000000000000000000000000000000))))

(assert (=> b!520178 (arrayContainsKey!0 a!3235 lt!238234 #b00000000000000000000000000000000)))

(declare-fun lt!238235 () Unit!16120)

(assert (=> b!520178 (= lt!238235 lt!238233)))

(declare-fun res!318341 () Bool)

(assert (=> b!520178 (= res!318341 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4417 #b00000000000000000000000000000000)))))

(assert (=> b!520178 (=> (not res!318341) (not e!303524))))

(declare-fun bm!31776 () Bool)

(declare-fun call!31779 () Bool)

(assert (=> bm!31776 (= call!31779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520180 () Bool)

(assert (=> b!520180 (= e!303523 call!31779)))

(declare-fun b!520181 () Bool)

(declare-fun e!303522 () Bool)

(assert (=> b!520181 (= e!303522 e!303523)))

(declare-fun c!61218 () Bool)

(assert (=> b!520181 (= c!61218 (validKeyInArray!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520179 () Bool)

(assert (=> b!520179 (= e!303524 call!31779)))

(declare-fun d!80229 () Bool)

(declare-fun res!318340 () Bool)

(assert (=> d!80229 (=> res!318340 e!303522)))

(assert (=> d!80229 (= res!318340 (bvsge #b00000000000000000000000000000000 (size!16314 a!3235)))))

(assert (=> d!80229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303522)))

(assert (= (and d!80229 (not res!318340)) b!520181))

(assert (= (and b!520181 c!61218) b!520178))

(assert (= (and b!520181 (not c!61218)) b!520180))

(assert (= (and b!520178 res!318341) b!520179))

(assert (= (or b!520179 b!520180) bm!31776))

(assert (=> b!520178 m!501189))

(declare-fun m!501221 () Bool)

(assert (=> b!520178 m!501221))

(declare-fun m!501223 () Bool)

(assert (=> b!520178 m!501223))

(assert (=> b!520178 m!501189))

(declare-fun m!501225 () Bool)

(assert (=> b!520178 m!501225))

(declare-fun m!501227 () Bool)

(assert (=> bm!31776 m!501227))

(assert (=> b!520181 m!501189))

(assert (=> b!520181 m!501189))

(declare-fun m!501229 () Bool)

(assert (=> b!520181 m!501229))

(assert (=> b!519919 d!80229))

(declare-fun d!80243 () Bool)

(declare-fun lt!238236 () SeekEntryResult!4417)

(assert (=> d!80243 (and (or (is-Undefined!4417 lt!238236) (not (is-Found!4417 lt!238236)) (and (bvsge (index!19866 lt!238236) #b00000000000000000000000000000000) (bvslt (index!19866 lt!238236) (size!16314 a!3235)))) (or (is-Undefined!4417 lt!238236) (is-Found!4417 lt!238236) (not (is-MissingZero!4417 lt!238236)) (and (bvsge (index!19865 lt!238236) #b00000000000000000000000000000000) (bvslt (index!19865 lt!238236) (size!16314 a!3235)))) (or (is-Undefined!4417 lt!238236) (is-Found!4417 lt!238236) (is-MissingZero!4417 lt!238236) (not (is-MissingVacant!4417 lt!238236)) (and (bvsge (index!19868 lt!238236) #b00000000000000000000000000000000) (bvslt (index!19868 lt!238236) (size!16314 a!3235)))) (or (is-Undefined!4417 lt!238236) (ite (is-Found!4417 lt!238236) (= (select (arr!15950 a!3235) (index!19866 lt!238236)) k!2280) (ite (is-MissingZero!4417 lt!238236) (= (select (arr!15950 a!3235) (index!19865 lt!238236)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4417 lt!238236) (= (select (arr!15950 a!3235) (index!19868 lt!238236)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303525 () SeekEntryResult!4417)

(assert (=> d!80243 (= lt!238236 e!303525)))

(declare-fun c!61221 () Bool)

(declare-fun lt!238238 () SeekEntryResult!4417)

(assert (=> d!80243 (= c!61221 (and (is-Intermediate!4417 lt!238238) (undefined!5229 lt!238238)))))

(assert (=> d!80243 (= lt!238238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80243 (validMask!0 mask!3524)))

(assert (=> d!80243 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!238236)))

(declare-fun b!520182 () Bool)

(declare-fun e!303527 () SeekEntryResult!4417)

(assert (=> b!520182 (= e!303525 e!303527)))

(declare-fun lt!238237 () (_ BitVec 64))

(assert (=> b!520182 (= lt!238237 (select (arr!15950 a!3235) (index!19867 lt!238238)))))

(declare-fun c!61220 () Bool)

(assert (=> b!520182 (= c!61220 (= lt!238237 k!2280))))

(declare-fun b!520183 () Bool)

(assert (=> b!520183 (= e!303527 (Found!4417 (index!19867 lt!238238)))))

(declare-fun b!520184 () Bool)

(assert (=> b!520184 (= e!303525 Undefined!4417)))

(declare-fun b!520185 () Bool)

(declare-fun e!303526 () SeekEntryResult!4417)

(assert (=> b!520185 (= e!303526 (seekKeyOrZeroReturnVacant!0 (x!48841 lt!238238) (index!19867 lt!238238) (index!19867 lt!238238) k!2280 a!3235 mask!3524))))

(declare-fun b!520186 () Bool)

(declare-fun c!61219 () Bool)

(assert (=> b!520186 (= c!61219 (= lt!238237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520186 (= e!303527 e!303526)))

(declare-fun b!520187 () Bool)

(assert (=> b!520187 (= e!303526 (MissingZero!4417 (index!19867 lt!238238)))))

(assert (= (and d!80243 c!61221) b!520184))

(assert (= (and d!80243 (not c!61221)) b!520182))

(assert (= (and b!520182 c!61220) b!520183))

(assert (= (and b!520182 (not c!61220)) b!520186))

(assert (= (and b!520186 c!61219) b!520187))

(assert (= (and b!520186 (not c!61219)) b!520185))

(declare-fun m!501231 () Bool)

(assert (=> d!80243 m!501231))

(declare-fun m!501233 () Bool)

(assert (=> d!80243 m!501233))

(declare-fun m!501235 () Bool)

(assert (=> d!80243 m!501235))

(declare-fun m!501237 () Bool)

(assert (=> d!80243 m!501237))

(declare-fun m!501239 () Bool)

(assert (=> d!80243 m!501239))

(assert (=> d!80243 m!501231))

(assert (=> d!80243 m!501041))

(declare-fun m!501241 () Bool)

(assert (=> b!520182 m!501241))

(declare-fun m!501243 () Bool)

(assert (=> b!520185 m!501243))

(assert (=> b!519922 d!80243))

(declare-fun d!80245 () Bool)

(assert (=> d!80245 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47230 d!80245))

(declare-fun d!80249 () Bool)

(assert (=> d!80249 (= (array_inv!11746 a!3235) (bvsge (size!16314 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47230 d!80249))

(declare-fun d!80251 () Bool)

(assert (=> d!80251 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519926 d!80251))

(declare-fun b!520203 () Bool)

(declare-fun e!303540 () Bool)

(declare-fun call!31783 () Bool)

(assert (=> b!520203 (= e!303540 call!31783)))

(declare-fun bm!31780 () Bool)

(declare-fun c!61225 () Bool)

(assert (=> bm!31780 (= call!31783 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61225 (Cons!10104 (select (arr!15950 a!3235) #b00000000000000000000000000000000) Nil!10105) Nil!10105)))))

(declare-fun b!520204 () Bool)

(declare-fun e!303541 () Bool)

(declare-fun e!303542 () Bool)

(assert (=> b!520204 (= e!303541 e!303542)))

(declare-fun res!318352 () Bool)

(assert (=> b!520204 (=> (not res!318352) (not e!303542))))

(declare-fun e!303543 () Bool)

(assert (=> b!520204 (= res!318352 (not e!303543))))

(declare-fun res!318351 () Bool)

(assert (=> b!520204 (=> (not res!318351) (not e!303543))))

(assert (=> b!520204 (= res!318351 (validKeyInArray!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80257 () Bool)

(declare-fun res!318353 () Bool)

(assert (=> d!80257 (=> res!318353 e!303541)))

(assert (=> d!80257 (= res!318353 (bvsge #b00000000000000000000000000000000 (size!16314 a!3235)))))

(assert (=> d!80257 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10105) e!303541)))

(declare-fun b!520205 () Bool)

(assert (=> b!520205 (= e!303542 e!303540)))

(assert (=> b!520205 (= c!61225 (validKeyInArray!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520206 () Bool)

(declare-fun contains!2759 (List!10108 (_ BitVec 64)) Bool)

(assert (=> b!520206 (= e!303543 (contains!2759 Nil!10105 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520207 () Bool)

(assert (=> b!520207 (= e!303540 call!31783)))

(assert (= (and d!80257 (not res!318353)) b!520204))

(assert (= (and b!520204 res!318351) b!520206))

(assert (= (and b!520204 res!318352) b!520205))

(assert (= (and b!520205 c!61225) b!520203))

(assert (= (and b!520205 (not c!61225)) b!520207))

(assert (= (or b!520203 b!520207) bm!31780))

(assert (=> bm!31780 m!501189))

(declare-fun m!501251 () Bool)

(assert (=> bm!31780 m!501251))

(assert (=> b!520204 m!501189))

(assert (=> b!520204 m!501189))

(assert (=> b!520204 m!501229))

(assert (=> b!520205 m!501189))

(assert (=> b!520205 m!501189))

(assert (=> b!520205 m!501229))

(assert (=> b!520206 m!501189))

(assert (=> b!520206 m!501189))

(declare-fun m!501253 () Bool)

(assert (=> b!520206 m!501253))

(assert (=> b!519921 d!80257))

(declare-fun b!520208 () Bool)

(declare-fun lt!238242 () SeekEntryResult!4417)

(assert (=> b!520208 (and (bvsge (index!19867 lt!238242) #b00000000000000000000000000000000) (bvslt (index!19867 lt!238242) (size!16314 lt!238112)))))

(declare-fun e!303546 () Bool)

(assert (=> b!520208 (= e!303546 (= (select (arr!15950 lt!238112) (index!19867 lt!238242)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520209 () Bool)

(declare-fun e!303548 () SeekEntryResult!4417)

(declare-fun e!303544 () SeekEntryResult!4417)

(assert (=> b!520209 (= e!303548 e!303544)))

(declare-fun c!61226 () Bool)

(declare-fun lt!238243 () (_ BitVec 64))

(assert (=> b!520209 (= c!61226 (or (= lt!238243 lt!238117) (= (bvadd lt!238243 lt!238243) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520210 () Bool)

(assert (=> b!520210 (= e!303544 (Intermediate!4417 false lt!238114 #b00000000000000000000000000000000))))

(declare-fun b!520211 () Bool)

(assert (=> b!520211 (and (bvsge (index!19867 lt!238242) #b00000000000000000000000000000000) (bvslt (index!19867 lt!238242) (size!16314 lt!238112)))))

(declare-fun res!318354 () Bool)

(assert (=> b!520211 (= res!318354 (= (select (arr!15950 lt!238112) (index!19867 lt!238242)) lt!238117))))

(assert (=> b!520211 (=> res!318354 e!303546)))

(declare-fun e!303547 () Bool)

(assert (=> b!520211 (= e!303547 e!303546)))

(declare-fun b!520212 () Bool)

(assert (=> b!520212 (= e!303544 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238114 #b00000000000000000000000000000000 mask!3524) lt!238117 lt!238112 mask!3524))))

(declare-fun b!520213 () Bool)

(assert (=> b!520213 (= e!303548 (Intermediate!4417 true lt!238114 #b00000000000000000000000000000000))))

(declare-fun b!520214 () Bool)

(declare-fun e!303545 () Bool)

(assert (=> b!520214 (= e!303545 e!303547)))

(declare-fun res!318356 () Bool)

(assert (=> b!520214 (= res!318356 (and (is-Intermediate!4417 lt!238242) (not (undefined!5229 lt!238242)) (bvslt (x!48841 lt!238242) #b01111111111111111111111111111110) (bvsge (x!48841 lt!238242) #b00000000000000000000000000000000) (bvsge (x!48841 lt!238242) #b00000000000000000000000000000000)))))

(assert (=> b!520214 (=> (not res!318356) (not e!303547))))

(declare-fun b!520215 () Bool)

(assert (=> b!520215 (and (bvsge (index!19867 lt!238242) #b00000000000000000000000000000000) (bvslt (index!19867 lt!238242) (size!16314 lt!238112)))))

(declare-fun res!318355 () Bool)

(assert (=> b!520215 (= res!318355 (= (select (arr!15950 lt!238112) (index!19867 lt!238242)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520215 (=> res!318355 e!303546)))

(declare-fun b!520216 () Bool)

(assert (=> b!520216 (= e!303545 (bvsge (x!48841 lt!238242) #b01111111111111111111111111111110))))

(declare-fun d!80259 () Bool)

(assert (=> d!80259 e!303545))

(declare-fun c!61227 () Bool)

(assert (=> d!80259 (= c!61227 (and (is-Intermediate!4417 lt!238242) (undefined!5229 lt!238242)))))

(assert (=> d!80259 (= lt!238242 e!303548)))

(declare-fun c!61228 () Bool)

(assert (=> d!80259 (= c!61228 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80259 (= lt!238243 (select (arr!15950 lt!238112) lt!238114))))

(assert (=> d!80259 (validMask!0 mask!3524)))

(assert (=> d!80259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238114 lt!238117 lt!238112 mask!3524) lt!238242)))

(assert (= (and d!80259 c!61228) b!520213))

(assert (= (and d!80259 (not c!61228)) b!520209))

(assert (= (and b!520209 c!61226) b!520210))

(assert (= (and b!520209 (not c!61226)) b!520212))

(assert (= (and d!80259 c!61227) b!520216))

(assert (= (and d!80259 (not c!61227)) b!520214))

(assert (= (and b!520214 res!318356) b!520211))

(assert (= (and b!520211 (not res!318354)) b!520215))

(assert (= (and b!520215 (not res!318355)) b!520208))

(declare-fun m!501255 () Bool)

(assert (=> b!520215 m!501255))

(declare-fun m!501257 () Bool)

(assert (=> d!80259 m!501257))

(assert (=> d!80259 m!501041))

(declare-fun m!501259 () Bool)

(assert (=> b!520212 m!501259))

(assert (=> b!520212 m!501259))

(declare-fun m!501261 () Bool)

