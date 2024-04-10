; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52620 () Bool)

(assert start!52620)

(declare-fun b!574241 () Bool)

(declare-fun e!330378 () Bool)

(declare-fun e!330379 () Bool)

(assert (=> b!574241 (= e!330378 e!330379)))

(declare-fun res!363209 () Bool)

(assert (=> b!574241 (=> (not res!363209) (not e!330379))))

(declare-datatypes ((SeekEntryResult!5680 0))(
  ( (MissingZero!5680 (index!24947 (_ BitVec 32))) (Found!5680 (index!24948 (_ BitVec 32))) (Intermediate!5680 (undefined!6492 Bool) (index!24949 (_ BitVec 32)) (x!53823 (_ BitVec 32))) (Undefined!5680) (MissingVacant!5680 (index!24950 (_ BitVec 32))) )
))
(declare-fun lt!262281 () SeekEntryResult!5680)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!262285 () SeekEntryResult!5680)

(declare-datatypes ((array!35891 0))(
  ( (array!35892 (arr!17231 (Array (_ BitVec 32) (_ BitVec 64))) (size!17595 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35891)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35891 (_ BitVec 32)) SeekEntryResult!5680)

(assert (=> b!574241 (= res!363209 (= lt!262285 (seekKeyOrZeroReturnVacant!0 (x!53823 lt!262281) (index!24949 lt!262281) (index!24949 lt!262281) (select (arr!17231 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574242 () Bool)

(declare-fun e!330384 () Bool)

(declare-fun e!330383 () Bool)

(assert (=> b!574242 (= e!330384 e!330383)))

(declare-fun res!363215 () Bool)

(assert (=> b!574242 (=> res!363215 e!330383)))

(assert (=> b!574242 (= res!363215 (or (undefined!6492 lt!262281) (not (is-Intermediate!5680 lt!262281))))))

(declare-fun b!574243 () Bool)

(declare-fun res!363214 () Bool)

(declare-fun e!330377 () Bool)

(assert (=> b!574243 (=> (not res!363214) (not e!330377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574243 (= res!363214 (validKeyInArray!0 (select (arr!17231 a!3118) j!142)))))

(declare-fun res!363211 () Bool)

(assert (=> start!52620 (=> (not res!363211) (not e!330377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52620 (= res!363211 (validMask!0 mask!3119))))

(assert (=> start!52620 e!330377))

(assert (=> start!52620 true))

(declare-fun array_inv!13027 (array!35891) Bool)

(assert (=> start!52620 (array_inv!13027 a!3118)))

(declare-fun b!574244 () Bool)

(assert (=> b!574244 (= e!330383 e!330378)))

(declare-fun res!363207 () Bool)

(assert (=> b!574244 (=> res!363207 e!330378)))

(declare-fun lt!262280 () (_ BitVec 64))

(assert (=> b!574244 (= res!363207 (or (= lt!262280 (select (arr!17231 a!3118) j!142)) (= lt!262280 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574244 (= lt!262280 (select (arr!17231 a!3118) (index!24949 lt!262281)))))

(declare-fun b!574245 () Bool)

(declare-fun res!363206 () Bool)

(declare-fun e!330380 () Bool)

(assert (=> b!574245 (=> (not res!363206) (not e!330380))))

(declare-datatypes ((List!11311 0))(
  ( (Nil!11308) (Cons!11307 (h!12340 (_ BitVec 64)) (t!17539 List!11311)) )
))
(declare-fun arrayNoDuplicates!0 (array!35891 (_ BitVec 32) List!11311) Bool)

(assert (=> b!574245 (= res!363206 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11308))))

(declare-fun b!574246 () Bool)

(declare-fun res!363213 () Bool)

(assert (=> b!574246 (=> (not res!363213) (not e!330380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35891 (_ BitVec 32)) Bool)

(assert (=> b!574246 (= res!363213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574247 () Bool)

(declare-fun res!363203 () Bool)

(assert (=> b!574247 (=> (not res!363203) (not e!330377))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!574247 (= res!363203 (validKeyInArray!0 k!1914))))

(declare-fun b!574248 () Bool)

(assert (=> b!574248 (= e!330377 e!330380)))

(declare-fun res!363208 () Bool)

(assert (=> b!574248 (=> (not res!363208) (not e!330380))))

(declare-fun lt!262288 () SeekEntryResult!5680)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574248 (= res!363208 (or (= lt!262288 (MissingZero!5680 i!1132)) (= lt!262288 (MissingVacant!5680 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35891 (_ BitVec 32)) SeekEntryResult!5680)

(assert (=> b!574248 (= lt!262288 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!574249 () Bool)

(declare-fun res!363204 () Bool)

(assert (=> b!574249 (=> (not res!363204) (not e!330377))))

(declare-fun arrayContainsKey!0 (array!35891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574249 (= res!363204 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574250 () Bool)

(declare-fun e!330381 () Bool)

(assert (=> b!574250 (= e!330381 (not (or (undefined!6492 lt!262281) (not (is-Intermediate!5680 lt!262281)) (let ((bdg!18009 (select (arr!17231 a!3118) (index!24949 lt!262281)))) (or (= bdg!18009 (select (arr!17231 a!3118) j!142)) (= bdg!18009 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24949 lt!262281) #b00000000000000000000000000000000) (bvsge (index!24949 lt!262281) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53823 lt!262281) #b01111111111111111111111111111110) (bvslt (x!53823 lt!262281) #b00000000000000000000000000000000) (= bdg!18009 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!574250 e!330384))

(declare-fun res!363212 () Bool)

(assert (=> b!574250 (=> (not res!363212) (not e!330384))))

(assert (=> b!574250 (= res!363212 (= lt!262285 (Found!5680 j!142)))))

(assert (=> b!574250 (= lt!262285 (seekEntryOrOpen!0 (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574250 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18062 0))(
  ( (Unit!18063) )
))
(declare-fun lt!262287 () Unit!18062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18062)

(assert (=> b!574250 (= lt!262287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574251 () Bool)

(declare-fun res!363210 () Bool)

(assert (=> b!574251 (=> (not res!363210) (not e!330377))))

(assert (=> b!574251 (= res!363210 (and (= (size!17595 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17595 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17595 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574252 () Bool)

(assert (=> b!574252 (= e!330380 e!330381)))

(declare-fun res!363205 () Bool)

(assert (=> b!574252 (=> (not res!363205) (not e!330381))))

(declare-fun lt!262283 () (_ BitVec 64))

(declare-fun lt!262286 () (_ BitVec 32))

(declare-fun lt!262282 () array!35891)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35891 (_ BitVec 32)) SeekEntryResult!5680)

(assert (=> b!574252 (= res!363205 (= lt!262281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262286 lt!262283 lt!262282 mask!3119)))))

(declare-fun lt!262284 () (_ BitVec 32))

(assert (=> b!574252 (= lt!262281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262284 (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574252 (= lt!262286 (toIndex!0 lt!262283 mask!3119))))

(assert (=> b!574252 (= lt!262283 (select (store (arr!17231 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!574252 (= lt!262284 (toIndex!0 (select (arr!17231 a!3118) j!142) mask!3119))))

(assert (=> b!574252 (= lt!262282 (array!35892 (store (arr!17231 a!3118) i!1132 k!1914) (size!17595 a!3118)))))

(declare-fun b!574253 () Bool)

(assert (=> b!574253 (= e!330379 (= (seekEntryOrOpen!0 lt!262283 lt!262282 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53823 lt!262281) (index!24949 lt!262281) (index!24949 lt!262281) lt!262283 lt!262282 mask!3119)))))

(assert (= (and start!52620 res!363211) b!574251))

(assert (= (and b!574251 res!363210) b!574243))

(assert (= (and b!574243 res!363214) b!574247))

(assert (= (and b!574247 res!363203) b!574249))

(assert (= (and b!574249 res!363204) b!574248))

(assert (= (and b!574248 res!363208) b!574246))

(assert (= (and b!574246 res!363213) b!574245))

(assert (= (and b!574245 res!363206) b!574252))

(assert (= (and b!574252 res!363205) b!574250))

(assert (= (and b!574250 res!363212) b!574242))

(assert (= (and b!574242 (not res!363215)) b!574244))

(assert (= (and b!574244 (not res!363207)) b!574241))

(assert (= (and b!574241 res!363209) b!574253))

(declare-fun m!553165 () Bool)

(assert (=> b!574241 m!553165))

(assert (=> b!574241 m!553165))

(declare-fun m!553167 () Bool)

(assert (=> b!574241 m!553167))

(assert (=> b!574250 m!553165))

(declare-fun m!553169 () Bool)

(assert (=> b!574250 m!553169))

(declare-fun m!553171 () Bool)

(assert (=> b!574250 m!553171))

(declare-fun m!553173 () Bool)

(assert (=> b!574250 m!553173))

(assert (=> b!574250 m!553165))

(declare-fun m!553175 () Bool)

(assert (=> b!574250 m!553175))

(declare-fun m!553177 () Bool)

(assert (=> b!574252 m!553177))

(assert (=> b!574252 m!553165))

(declare-fun m!553179 () Bool)

(assert (=> b!574252 m!553179))

(assert (=> b!574252 m!553165))

(declare-fun m!553181 () Bool)

(assert (=> b!574252 m!553181))

(assert (=> b!574252 m!553165))

(declare-fun m!553183 () Bool)

(assert (=> b!574252 m!553183))

(declare-fun m!553185 () Bool)

(assert (=> b!574252 m!553185))

(declare-fun m!553187 () Bool)

(assert (=> b!574252 m!553187))

(declare-fun m!553189 () Bool)

(assert (=> b!574253 m!553189))

(declare-fun m!553191 () Bool)

(assert (=> b!574253 m!553191))

(declare-fun m!553193 () Bool)

(assert (=> b!574246 m!553193))

(assert (=> b!574244 m!553165))

(assert (=> b!574244 m!553171))

(declare-fun m!553195 () Bool)

(assert (=> b!574247 m!553195))

(declare-fun m!553197 () Bool)

(assert (=> start!52620 m!553197))

(declare-fun m!553199 () Bool)

(assert (=> start!52620 m!553199))

(declare-fun m!553201 () Bool)

(assert (=> b!574245 m!553201))

(declare-fun m!553203 () Bool)

(assert (=> b!574249 m!553203))

(declare-fun m!553205 () Bool)

(assert (=> b!574248 m!553205))

(assert (=> b!574243 m!553165))

(assert (=> b!574243 m!553165))

(declare-fun m!553207 () Bool)

(assert (=> b!574243 m!553207))

(push 1)

(assert (not b!574241))

(assert (not b!574245))

(assert (not start!52620))

(assert (not b!574246))

(assert (not b!574249))

(assert (not b!574253))

(assert (not b!574248))

(assert (not b!574250))

(assert (not b!574252))

(assert (not b!574243))

(assert (not b!574247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!574296 () Bool)

(declare-fun e!330410 () SeekEntryResult!5680)

(declare-fun lt!262314 () SeekEntryResult!5680)

(assert (=> b!574296 (= e!330410 (Found!5680 (index!24949 lt!262314)))))

(declare-fun b!574297 () Bool)

(declare-fun c!65899 () Bool)

(declare-fun lt!262315 () (_ BitVec 64))

(assert (=> b!574297 (= c!65899 (= lt!262315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330409 () SeekEntryResult!5680)

(assert (=> b!574297 (= e!330410 e!330409)))

(declare-fun b!574298 () Bool)

(assert (=> b!574298 (= e!330409 (MissingZero!5680 (index!24949 lt!262314)))))

(declare-fun b!574299 () Bool)

(declare-fun e!330411 () SeekEntryResult!5680)

(assert (=> b!574299 (= e!330411 Undefined!5680)))

(declare-fun b!574301 () Bool)

(assert (=> b!574301 (= e!330411 e!330410)))

(assert (=> b!574301 (= lt!262315 (select (arr!17231 lt!262282) (index!24949 lt!262314)))))

(declare-fun c!65900 () Bool)

(assert (=> b!574301 (= c!65900 (= lt!262315 lt!262283))))

(declare-fun d!85073 () Bool)

(declare-fun lt!262313 () SeekEntryResult!5680)

(assert (=> d!85073 (and (or (is-Undefined!5680 lt!262313) (not (is-Found!5680 lt!262313)) (and (bvsge (index!24948 lt!262313) #b00000000000000000000000000000000) (bvslt (index!24948 lt!262313) (size!17595 lt!262282)))) (or (is-Undefined!5680 lt!262313) (is-Found!5680 lt!262313) (not (is-MissingZero!5680 lt!262313)) (and (bvsge (index!24947 lt!262313) #b00000000000000000000000000000000) (bvslt (index!24947 lt!262313) (size!17595 lt!262282)))) (or (is-Undefined!5680 lt!262313) (is-Found!5680 lt!262313) (is-MissingZero!5680 lt!262313) (not (is-MissingVacant!5680 lt!262313)) (and (bvsge (index!24950 lt!262313) #b00000000000000000000000000000000) (bvslt (index!24950 lt!262313) (size!17595 lt!262282)))) (or (is-Undefined!5680 lt!262313) (ite (is-Found!5680 lt!262313) (= (select (arr!17231 lt!262282) (index!24948 lt!262313)) lt!262283) (ite (is-MissingZero!5680 lt!262313) (= (select (arr!17231 lt!262282) (index!24947 lt!262313)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5680 lt!262313) (= (select (arr!17231 lt!262282) (index!24950 lt!262313)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85073 (= lt!262313 e!330411)))

(declare-fun c!65898 () Bool)

(assert (=> d!85073 (= c!65898 (and (is-Intermediate!5680 lt!262314) (undefined!6492 lt!262314)))))

(assert (=> d!85073 (= lt!262314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262283 mask!3119) lt!262283 lt!262282 mask!3119))))

(assert (=> d!85073 (validMask!0 mask!3119)))

(assert (=> d!85073 (= (seekEntryOrOpen!0 lt!262283 lt!262282 mask!3119) lt!262313)))

(declare-fun b!574300 () Bool)

(assert (=> b!574300 (= e!330409 (seekKeyOrZeroReturnVacant!0 (x!53823 lt!262314) (index!24949 lt!262314) (index!24949 lt!262314) lt!262283 lt!262282 mask!3119))))

(assert (= (and d!85073 c!65898) b!574299))

(assert (= (and d!85073 (not c!65898)) b!574301))

(assert (= (and b!574301 c!65900) b!574296))

(assert (= (and b!574301 (not c!65900)) b!574297))

(assert (= (and b!574297 c!65899) b!574298))

(assert (= (and b!574297 (not c!65899)) b!574300))

(declare-fun m!553227 () Bool)

(assert (=> b!574301 m!553227))

(declare-fun m!553229 () Bool)

(assert (=> d!85073 m!553229))

(declare-fun m!553231 () Bool)

(assert (=> d!85073 m!553231))

(assert (=> d!85073 m!553197))

(declare-fun m!553233 () Bool)

(assert (=> d!85073 m!553233))

(assert (=> d!85073 m!553177))

(declare-fun m!553235 () Bool)

(assert (=> d!85073 m!553235))

(assert (=> d!85073 m!553177))

(declare-fun m!553237 () Bool)

(assert (=> b!574300 m!553237))

(assert (=> b!574253 d!85073))

(declare-fun b!574336 () Bool)

(declare-fun e!330432 () SeekEntryResult!5680)

(declare-fun e!330431 () SeekEntryResult!5680)

(assert (=> b!574336 (= e!330432 e!330431)))

(declare-fun c!65919 () Bool)

(declare-fun lt!262332 () (_ BitVec 64))

(assert (=> b!574336 (= c!65919 (= lt!262332 lt!262283))))

(declare-fun lt!262333 () SeekEntryResult!5680)

(declare-fun d!85081 () Bool)

(assert (=> d!85081 (and (or (is-Undefined!5680 lt!262333) (not (is-Found!5680 lt!262333)) (and (bvsge (index!24948 lt!262333) #b00000000000000000000000000000000) (bvslt (index!24948 lt!262333) (size!17595 lt!262282)))) (or (is-Undefined!5680 lt!262333) (is-Found!5680 lt!262333) (not (is-MissingVacant!5680 lt!262333)) (not (= (index!24950 lt!262333) (index!24949 lt!262281))) (and (bvsge (index!24950 lt!262333) #b00000000000000000000000000000000) (bvslt (index!24950 lt!262333) (size!17595 lt!262282)))) (or (is-Undefined!5680 lt!262333) (ite (is-Found!5680 lt!262333) (= (select (arr!17231 lt!262282) (index!24948 lt!262333)) lt!262283) (and (is-MissingVacant!5680 lt!262333) (= (index!24950 lt!262333) (index!24949 lt!262281)) (= (select (arr!17231 lt!262282) (index!24950 lt!262333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85081 (= lt!262333 e!330432)))

(declare-fun c!65918 () Bool)

(assert (=> d!85081 (= c!65918 (bvsge (x!53823 lt!262281) #b01111111111111111111111111111110))))

(assert (=> d!85081 (= lt!262332 (select (arr!17231 lt!262282) (index!24949 lt!262281)))))

(assert (=> d!85081 (validMask!0 mask!3119)))

(assert (=> d!85081 (= (seekKeyOrZeroReturnVacant!0 (x!53823 lt!262281) (index!24949 lt!262281) (index!24949 lt!262281) lt!262283 lt!262282 mask!3119) lt!262333)))

(declare-fun b!574337 () Bool)

(declare-fun c!65917 () Bool)

(assert (=> b!574337 (= c!65917 (= lt!262332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330430 () SeekEntryResult!5680)

(assert (=> b!574337 (= e!330431 e!330430)))

(declare-fun b!574338 () Bool)

(assert (=> b!574338 (= e!330430 (MissingVacant!5680 (index!24949 lt!262281)))))

(declare-fun b!574339 () Bool)

(assert (=> b!574339 (= e!330432 Undefined!5680)))

(declare-fun b!574340 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574340 (= e!330430 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53823 lt!262281) #b00000000000000000000000000000001) (nextIndex!0 (index!24949 lt!262281) (x!53823 lt!262281) mask!3119) (index!24949 lt!262281) lt!262283 lt!262282 mask!3119))))

(declare-fun b!574341 () Bool)

(assert (=> b!574341 (= e!330431 (Found!5680 (index!24949 lt!262281)))))

(assert (= (and d!85081 c!65918) b!574339))

(assert (= (and d!85081 (not c!65918)) b!574336))

(assert (= (and b!574336 c!65919) b!574341))

(assert (= (and b!574336 (not c!65919)) b!574337))

(assert (= (and b!574337 c!65917) b!574338))

(assert (= (and b!574337 (not c!65917)) b!574340))

(declare-fun m!553261 () Bool)

(assert (=> d!85081 m!553261))

(declare-fun m!553263 () Bool)

(assert (=> d!85081 m!553263))

(declare-fun m!553265 () Bool)

(assert (=> d!85081 m!553265))

(assert (=> d!85081 m!553197))

(declare-fun m!553267 () Bool)

(assert (=> b!574340 m!553267))

(assert (=> b!574340 m!553267))

(declare-fun m!553269 () Bool)

(assert (=> b!574340 m!553269))

(assert (=> b!574253 d!85081))

(declare-fun d!85091 () Bool)

(assert (=> d!85091 (= (validKeyInArray!0 (select (arr!17231 a!3118) j!142)) (and (not (= (select (arr!17231 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17231 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574243 d!85091))

(declare-fun b!574342 () Bool)

(declare-fun e!330434 () SeekEntryResult!5680)

(declare-fun lt!262335 () SeekEntryResult!5680)

(assert (=> b!574342 (= e!330434 (Found!5680 (index!24949 lt!262335)))))

(declare-fun b!574343 () Bool)

(declare-fun c!65921 () Bool)

(declare-fun lt!262336 () (_ BitVec 64))

(assert (=> b!574343 (= c!65921 (= lt!262336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330433 () SeekEntryResult!5680)

(assert (=> b!574343 (= e!330434 e!330433)))

(declare-fun b!574344 () Bool)

(assert (=> b!574344 (= e!330433 (MissingZero!5680 (index!24949 lt!262335)))))

(declare-fun b!574345 () Bool)

(declare-fun e!330435 () SeekEntryResult!5680)

(assert (=> b!574345 (= e!330435 Undefined!5680)))

(declare-fun b!574347 () Bool)

(assert (=> b!574347 (= e!330435 e!330434)))

(assert (=> b!574347 (= lt!262336 (select (arr!17231 a!3118) (index!24949 lt!262335)))))

(declare-fun c!65922 () Bool)

(assert (=> b!574347 (= c!65922 (= lt!262336 (select (arr!17231 a!3118) j!142)))))

(declare-fun d!85095 () Bool)

(declare-fun lt!262334 () SeekEntryResult!5680)

(assert (=> d!85095 (and (or (is-Undefined!5680 lt!262334) (not (is-Found!5680 lt!262334)) (and (bvsge (index!24948 lt!262334) #b00000000000000000000000000000000) (bvslt (index!24948 lt!262334) (size!17595 a!3118)))) (or (is-Undefined!5680 lt!262334) (is-Found!5680 lt!262334) (not (is-MissingZero!5680 lt!262334)) (and (bvsge (index!24947 lt!262334) #b00000000000000000000000000000000) (bvslt (index!24947 lt!262334) (size!17595 a!3118)))) (or (is-Undefined!5680 lt!262334) (is-Found!5680 lt!262334) (is-MissingZero!5680 lt!262334) (not (is-MissingVacant!5680 lt!262334)) (and (bvsge (index!24950 lt!262334) #b00000000000000000000000000000000) (bvslt (index!24950 lt!262334) (size!17595 a!3118)))) (or (is-Undefined!5680 lt!262334) (ite (is-Found!5680 lt!262334) (= (select (arr!17231 a!3118) (index!24948 lt!262334)) (select (arr!17231 a!3118) j!142)) (ite (is-MissingZero!5680 lt!262334) (= (select (arr!17231 a!3118) (index!24947 lt!262334)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5680 lt!262334) (= (select (arr!17231 a!3118) (index!24950 lt!262334)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85095 (= lt!262334 e!330435)))

(declare-fun c!65920 () Bool)

(assert (=> d!85095 (= c!65920 (and (is-Intermediate!5680 lt!262335) (undefined!6492 lt!262335)))))

(assert (=> d!85095 (= lt!262335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17231 a!3118) j!142) mask!3119) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85095 (validMask!0 mask!3119)))

(assert (=> d!85095 (= (seekEntryOrOpen!0 (select (arr!17231 a!3118) j!142) a!3118 mask!3119) lt!262334)))

(declare-fun b!574346 () Bool)

(assert (=> b!574346 (= e!330433 (seekKeyOrZeroReturnVacant!0 (x!53823 lt!262335) (index!24949 lt!262335) (index!24949 lt!262335) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85095 c!65920) b!574345))

(assert (= (and d!85095 (not c!65920)) b!574347))

(assert (= (and b!574347 c!65922) b!574342))

(assert (= (and b!574347 (not c!65922)) b!574343))

(assert (= (and b!574343 c!65921) b!574344))

(assert (= (and b!574343 (not c!65921)) b!574346))

(declare-fun m!553271 () Bool)

(assert (=> b!574347 m!553271))

(declare-fun m!553273 () Bool)

(assert (=> d!85095 m!553273))

(declare-fun m!553275 () Bool)

(assert (=> d!85095 m!553275))

(assert (=> d!85095 m!553197))

(declare-fun m!553277 () Bool)

(assert (=> d!85095 m!553277))

(assert (=> d!85095 m!553179))

(assert (=> d!85095 m!553165))

(declare-fun m!553279 () Bool)

(assert (=> d!85095 m!553279))

(assert (=> d!85095 m!553165))

(assert (=> d!85095 m!553179))

(assert (=> b!574346 m!553165))

(declare-fun m!553281 () Bool)

(assert (=> b!574346 m!553281))

(assert (=> b!574250 d!85095))

(declare-fun d!85101 () Bool)

(declare-fun res!363241 () Bool)

(declare-fun e!330464 () Bool)

(assert (=> d!85101 (=> res!363241 e!330464)))

(assert (=> d!85101 (= res!363241 (bvsge j!142 (size!17595 a!3118)))))

(assert (=> d!85101 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330464)))

(declare-fun b!574392 () Bool)

(declare-fun e!330462 () Bool)

(declare-fun e!330463 () Bool)

(assert (=> b!574392 (= e!330462 e!330463)))

(declare-fun lt!262351 () (_ BitVec 64))

(assert (=> b!574392 (= lt!262351 (select (arr!17231 a!3118) j!142))))

(declare-fun lt!262352 () Unit!18062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35891 (_ BitVec 64) (_ BitVec 32)) Unit!18062)

(assert (=> b!574392 (= lt!262352 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262351 j!142))))

(assert (=> b!574392 (arrayContainsKey!0 a!3118 lt!262351 #b00000000000000000000000000000000)))

(declare-fun lt!262353 () Unit!18062)

(assert (=> b!574392 (= lt!262353 lt!262352)))

(declare-fun res!363242 () Bool)

(assert (=> b!574392 (= res!363242 (= (seekEntryOrOpen!0 (select (arr!17231 a!3118) j!142) a!3118 mask!3119) (Found!5680 j!142)))))

(assert (=> b!574392 (=> (not res!363242) (not e!330463))))

(declare-fun call!32673 () Bool)

(declare-fun bm!32670 () Bool)

(assert (=> bm!32670 (= call!32673 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574393 () Bool)

(assert (=> b!574393 (= e!330463 call!32673)))

(declare-fun b!574394 () Bool)

(assert (=> b!574394 (= e!330462 call!32673)))

(declare-fun b!574395 () Bool)

(assert (=> b!574395 (= e!330464 e!330462)))

(declare-fun c!65937 () Bool)

(assert (=> b!574395 (= c!65937 (validKeyInArray!0 (select (arr!17231 a!3118) j!142)))))

(assert (= (and d!85101 (not res!363241)) b!574395))

(assert (= (and b!574395 c!65937) b!574392))

(assert (= (and b!574395 (not c!65937)) b!574394))

(assert (= (and b!574392 res!363242) b!574393))

(assert (= (or b!574393 b!574394) bm!32670))

(assert (=> b!574392 m!553165))

(declare-fun m!553299 () Bool)

(assert (=> b!574392 m!553299))

(declare-fun m!553301 () Bool)

(assert (=> b!574392 m!553301))

(assert (=> b!574392 m!553165))

(assert (=> b!574392 m!553175))

(declare-fun m!553303 () Bool)

(assert (=> bm!32670 m!553303))

(assert (=> b!574395 m!553165))

(assert (=> b!574395 m!553165))

(assert (=> b!574395 m!553207))

(assert (=> b!574250 d!85101))

(declare-fun d!85107 () Bool)

(assert (=> d!85107 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262364 () Unit!18062)

(declare-fun choose!38 (array!35891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18062)

(assert (=> d!85107 (= lt!262364 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85107 (validMask!0 mask!3119)))

(assert (=> d!85107 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262364)))

(declare-fun bs!17771 () Bool)

(assert (= bs!17771 d!85107))

(assert (=> bs!17771 m!553169))

(declare-fun m!553305 () Bool)

(assert (=> bs!17771 m!553305))

(assert (=> bs!17771 m!553197))

(assert (=> b!574250 d!85107))

(declare-fun d!85117 () Bool)

(assert (=> d!85117 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52620 d!85117))

(declare-fun d!85125 () Bool)

(assert (=> d!85125 (= (array_inv!13027 a!3118) (bvsge (size!17595 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52620 d!85125))

(declare-fun b!574426 () Bool)

(declare-fun e!330485 () SeekEntryResult!5680)

(declare-fun e!330484 () SeekEntryResult!5680)

(assert (=> b!574426 (= e!330485 e!330484)))

(declare-fun lt!262377 () (_ BitVec 64))

(declare-fun c!65952 () Bool)

(assert (=> b!574426 (= c!65952 (= lt!262377 (select (arr!17231 a!3118) j!142)))))

(declare-fun lt!262378 () SeekEntryResult!5680)

(declare-fun d!85127 () Bool)

(assert (=> d!85127 (and (or (is-Undefined!5680 lt!262378) (not (is-Found!5680 lt!262378)) (and (bvsge (index!24948 lt!262378) #b00000000000000000000000000000000) (bvslt (index!24948 lt!262378) (size!17595 a!3118)))) (or (is-Undefined!5680 lt!262378) (is-Found!5680 lt!262378) (not (is-MissingVacant!5680 lt!262378)) (not (= (index!24950 lt!262378) (index!24949 lt!262281))) (and (bvsge (index!24950 lt!262378) #b00000000000000000000000000000000) (bvslt (index!24950 lt!262378) (size!17595 a!3118)))) (or (is-Undefined!5680 lt!262378) (ite (is-Found!5680 lt!262378) (= (select (arr!17231 a!3118) (index!24948 lt!262378)) (select (arr!17231 a!3118) j!142)) (and (is-MissingVacant!5680 lt!262378) (= (index!24950 lt!262378) (index!24949 lt!262281)) (= (select (arr!17231 a!3118) (index!24950 lt!262378)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85127 (= lt!262378 e!330485)))

(declare-fun c!65951 () Bool)

(assert (=> d!85127 (= c!65951 (bvsge (x!53823 lt!262281) #b01111111111111111111111111111110))))

(assert (=> d!85127 (= lt!262377 (select (arr!17231 a!3118) (index!24949 lt!262281)))))

(assert (=> d!85127 (validMask!0 mask!3119)))

(assert (=> d!85127 (= (seekKeyOrZeroReturnVacant!0 (x!53823 lt!262281) (index!24949 lt!262281) (index!24949 lt!262281) (select (arr!17231 a!3118) j!142) a!3118 mask!3119) lt!262378)))

(declare-fun b!574427 () Bool)

(declare-fun c!65950 () Bool)

(assert (=> b!574427 (= c!65950 (= lt!262377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330483 () SeekEntryResult!5680)

(assert (=> b!574427 (= e!330484 e!330483)))

(declare-fun b!574428 () Bool)

(assert (=> b!574428 (= e!330483 (MissingVacant!5680 (index!24949 lt!262281)))))

(declare-fun b!574429 () Bool)

(assert (=> b!574429 (= e!330485 Undefined!5680)))

(declare-fun b!574430 () Bool)

(assert (=> b!574430 (= e!330483 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53823 lt!262281) #b00000000000000000000000000000001) (nextIndex!0 (index!24949 lt!262281) (x!53823 lt!262281) mask!3119) (index!24949 lt!262281) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574431 () Bool)

(assert (=> b!574431 (= e!330484 (Found!5680 (index!24949 lt!262281)))))

(assert (= (and d!85127 c!65951) b!574429))

(assert (= (and d!85127 (not c!65951)) b!574426))

(assert (= (and b!574426 c!65952) b!574431))

(assert (= (and b!574426 (not c!65952)) b!574427))

(assert (= (and b!574427 c!65950) b!574428))

(assert (= (and b!574427 (not c!65950)) b!574430))

(declare-fun m!553333 () Bool)

(assert (=> d!85127 m!553333))

(declare-fun m!553335 () Bool)

(assert (=> d!85127 m!553335))

(assert (=> d!85127 m!553171))

(assert (=> d!85127 m!553197))

(assert (=> b!574430 m!553267))

(assert (=> b!574430 m!553267))

(assert (=> b!574430 m!553165))

(declare-fun m!553337 () Bool)

(assert (=> b!574430 m!553337))

(assert (=> b!574241 d!85127))

(declare-fun b!574496 () Bool)

(declare-fun e!330524 () Bool)

(declare-fun e!330523 () Bool)

(assert (=> b!574496 (= e!330524 e!330523)))

(declare-fun res!363264 () Bool)

(declare-fun lt!262410 () SeekEntryResult!5680)

(assert (=> b!574496 (= res!363264 (and (is-Intermediate!5680 lt!262410) (not (undefined!6492 lt!262410)) (bvslt (x!53823 lt!262410) #b01111111111111111111111111111110) (bvsge (x!53823 lt!262410) #b00000000000000000000000000000000) (bvsge (x!53823 lt!262410) #b00000000000000000000000000000000)))))

(assert (=> b!574496 (=> (not res!363264) (not e!330523))))

(declare-fun b!574497 () Bool)

(declare-fun e!330525 () SeekEntryResult!5680)

(assert (=> b!574497 (= e!330525 (Intermediate!5680 false lt!262286 #b00000000000000000000000000000000))))

(declare-fun b!574498 () Bool)

(assert (=> b!574498 (and (bvsge (index!24949 lt!262410) #b00000000000000000000000000000000) (bvslt (index!24949 lt!262410) (size!17595 lt!262282)))))

(declare-fun res!363263 () Bool)

(assert (=> b!574498 (= res!363263 (= (select (arr!17231 lt!262282) (index!24949 lt!262410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330526 () Bool)

(assert (=> b!574498 (=> res!363263 e!330526)))

(declare-fun d!85129 () Bool)

(assert (=> d!85129 e!330524))

(declare-fun c!65979 () Bool)

(assert (=> d!85129 (= c!65979 (and (is-Intermediate!5680 lt!262410) (undefined!6492 lt!262410)))))

(declare-fun e!330527 () SeekEntryResult!5680)

(assert (=> d!85129 (= lt!262410 e!330527)))

(declare-fun c!65980 () Bool)

(assert (=> d!85129 (= c!65980 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262409 () (_ BitVec 64))

(assert (=> d!85129 (= lt!262409 (select (arr!17231 lt!262282) lt!262286))))

(assert (=> d!85129 (validMask!0 mask!3119)))

(assert (=> d!85129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262286 lt!262283 lt!262282 mask!3119) lt!262410)))

(declare-fun b!574499 () Bool)

(assert (=> b!574499 (= e!330525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262286 #b00000000000000000000000000000000 mask!3119) lt!262283 lt!262282 mask!3119))))

(declare-fun b!574500 () Bool)

(assert (=> b!574500 (and (bvsge (index!24949 lt!262410) #b00000000000000000000000000000000) (bvslt (index!24949 lt!262410) (size!17595 lt!262282)))))

(declare-fun res!363265 () Bool)

(assert (=> b!574500 (= res!363265 (= (select (arr!17231 lt!262282) (index!24949 lt!262410)) lt!262283))))

(assert (=> b!574500 (=> res!363265 e!330526)))

(assert (=> b!574500 (= e!330523 e!330526)))

(declare-fun b!574501 () Bool)

(assert (=> b!574501 (= e!330527 e!330525)))

(declare-fun c!65978 () Bool)

(assert (=> b!574501 (= c!65978 (or (= lt!262409 lt!262283) (= (bvadd lt!262409 lt!262409) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574502 () Bool)

(assert (=> b!574502 (= e!330527 (Intermediate!5680 true lt!262286 #b00000000000000000000000000000000))))

(declare-fun b!574503 () Bool)

(assert (=> b!574503 (and (bvsge (index!24949 lt!262410) #b00000000000000000000000000000000) (bvslt (index!24949 lt!262410) (size!17595 lt!262282)))))

(assert (=> b!574503 (= e!330526 (= (select (arr!17231 lt!262282) (index!24949 lt!262410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574504 () Bool)

(assert (=> b!574504 (= e!330524 (bvsge (x!53823 lt!262410) #b01111111111111111111111111111110))))

(assert (= (and d!85129 c!65980) b!574502))

(assert (= (and d!85129 (not c!65980)) b!574501))

(assert (= (and b!574501 c!65978) b!574497))

(assert (= (and b!574501 (not c!65978)) b!574499))

(assert (= (and d!85129 c!65979) b!574504))

(assert (= (and d!85129 (not c!65979)) b!574496))

(assert (= (and b!574496 res!363264) b!574500))

(assert (= (and b!574500 (not res!363265)) b!574498))

(assert (= (and b!574498 (not res!363263)) b!574503))

(declare-fun m!553389 () Bool)

(assert (=> d!85129 m!553389))

(assert (=> d!85129 m!553197))

(declare-fun m!553391 () Bool)

(assert (=> b!574499 m!553391))

(assert (=> b!574499 m!553391))

(declare-fun m!553393 () Bool)

(assert (=> b!574499 m!553393))

(declare-fun m!553395 () Bool)

(assert (=> b!574503 m!553395))

(assert (=> b!574500 m!553395))

(assert (=> b!574498 m!553395))

(assert (=> b!574252 d!85129))

(declare-fun b!574505 () Bool)

(declare-fun e!330529 () Bool)

(declare-fun e!330528 () Bool)

(assert (=> b!574505 (= e!330529 e!330528)))

(declare-fun res!363267 () Bool)

(declare-fun lt!262412 () SeekEntryResult!5680)

(assert (=> b!574505 (= res!363267 (and (is-Intermediate!5680 lt!262412) (not (undefined!6492 lt!262412)) (bvslt (x!53823 lt!262412) #b01111111111111111111111111111110) (bvsge (x!53823 lt!262412) #b00000000000000000000000000000000) (bvsge (x!53823 lt!262412) #b00000000000000000000000000000000)))))

(assert (=> b!574505 (=> (not res!363267) (not e!330528))))

(declare-fun b!574506 () Bool)

(declare-fun e!330530 () SeekEntryResult!5680)

(assert (=> b!574506 (= e!330530 (Intermediate!5680 false lt!262284 #b00000000000000000000000000000000))))

(declare-fun b!574507 () Bool)

(assert (=> b!574507 (and (bvsge (index!24949 lt!262412) #b00000000000000000000000000000000) (bvslt (index!24949 lt!262412) (size!17595 a!3118)))))

(declare-fun res!363266 () Bool)

(assert (=> b!574507 (= res!363266 (= (select (arr!17231 a!3118) (index!24949 lt!262412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330531 () Bool)

(assert (=> b!574507 (=> res!363266 e!330531)))

(declare-fun d!85145 () Bool)

(assert (=> d!85145 e!330529))

(declare-fun c!65982 () Bool)

(assert (=> d!85145 (= c!65982 (and (is-Intermediate!5680 lt!262412) (undefined!6492 lt!262412)))))

(declare-fun e!330532 () SeekEntryResult!5680)

(assert (=> d!85145 (= lt!262412 e!330532)))

(declare-fun c!65983 () Bool)

(assert (=> d!85145 (= c!65983 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262411 () (_ BitVec 64))

(assert (=> d!85145 (= lt!262411 (select (arr!17231 a!3118) lt!262284))))

(assert (=> d!85145 (validMask!0 mask!3119)))

(assert (=> d!85145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262284 (select (arr!17231 a!3118) j!142) a!3118 mask!3119) lt!262412)))

(declare-fun b!574508 () Bool)

(assert (=> b!574508 (= e!330530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262284 #b00000000000000000000000000000000 mask!3119) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574509 () Bool)

(assert (=> b!574509 (and (bvsge (index!24949 lt!262412) #b00000000000000000000000000000000) (bvslt (index!24949 lt!262412) (size!17595 a!3118)))))

(declare-fun res!363268 () Bool)

(assert (=> b!574509 (= res!363268 (= (select (arr!17231 a!3118) (index!24949 lt!262412)) (select (arr!17231 a!3118) j!142)))))

(assert (=> b!574509 (=> res!363268 e!330531)))

(assert (=> b!574509 (= e!330528 e!330531)))

(declare-fun b!574510 () Bool)

(assert (=> b!574510 (= e!330532 e!330530)))

(declare-fun c!65981 () Bool)

(assert (=> b!574510 (= c!65981 (or (= lt!262411 (select (arr!17231 a!3118) j!142)) (= (bvadd lt!262411 lt!262411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574511 () Bool)

(assert (=> b!574511 (= e!330532 (Intermediate!5680 true lt!262284 #b00000000000000000000000000000000))))

(declare-fun b!574512 () Bool)

(assert (=> b!574512 (and (bvsge (index!24949 lt!262412) #b00000000000000000000000000000000) (bvslt (index!24949 lt!262412) (size!17595 a!3118)))))

(assert (=> b!574512 (= e!330531 (= (select (arr!17231 a!3118) (index!24949 lt!262412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574513 () Bool)

(assert (=> b!574513 (= e!330529 (bvsge (x!53823 lt!262412) #b01111111111111111111111111111110))))

(assert (= (and d!85145 c!65983) b!574511))

(assert (= (and d!85145 (not c!65983)) b!574510))

(assert (= (and b!574510 c!65981) b!574506))

(assert (= (and b!574510 (not c!65981)) b!574508))

(assert (= (and d!85145 c!65982) b!574513))

(assert (= (and d!85145 (not c!65982)) b!574505))

(assert (= (and b!574505 res!363267) b!574509))

(assert (= (and b!574509 (not res!363268)) b!574507))

(assert (= (and b!574507 (not res!363266)) b!574512))

(declare-fun m!553397 () Bool)

(assert (=> d!85145 m!553397))

(assert (=> d!85145 m!553197))

(declare-fun m!553399 () Bool)

(assert (=> b!574508 m!553399))

(assert (=> b!574508 m!553399))

(assert (=> b!574508 m!553165))

(declare-fun m!553401 () Bool)

(assert (=> b!574508 m!553401))

(declare-fun m!553403 () Bool)

(assert (=> b!574512 m!553403))

(assert (=> b!574509 m!553403))

(assert (=> b!574507 m!553403))

(assert (=> b!574252 d!85145))

(declare-fun d!85149 () Bool)

(declare-fun lt!262422 () (_ BitVec 32))

(declare-fun lt!262421 () (_ BitVec 32))

(assert (=> d!85149 (= lt!262422 (bvmul (bvxor lt!262421 (bvlshr lt!262421 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85149 (= lt!262421 ((_ extract 31 0) (bvand (bvxor lt!262283 (bvlshr lt!262283 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85149 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363269 (let ((h!12342 ((_ extract 31 0) (bvand (bvxor lt!262283 (bvlshr lt!262283 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53830 (bvmul (bvxor h!12342 (bvlshr h!12342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53830 (bvlshr x!53830 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363269 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363269 #b00000000000000000000000000000000))))))

(assert (=> d!85149 (= (toIndex!0 lt!262283 mask!3119) (bvand (bvxor lt!262422 (bvlshr lt!262422 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574252 d!85149))

(declare-fun d!85151 () Bool)

(declare-fun lt!262424 () (_ BitVec 32))

(declare-fun lt!262423 () (_ BitVec 32))

(assert (=> d!85151 (= lt!262424 (bvmul (bvxor lt!262423 (bvlshr lt!262423 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85151 (= lt!262423 ((_ extract 31 0) (bvand (bvxor (select (arr!17231 a!3118) j!142) (bvlshr (select (arr!17231 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85151 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363269 (let ((h!12342 ((_ extract 31 0) (bvand (bvxor (select (arr!17231 a!3118) j!142) (bvlshr (select (arr!17231 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53830 (bvmul (bvxor h!12342 (bvlshr h!12342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53830 (bvlshr x!53830 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363269 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363269 #b00000000000000000000000000000000))))))

(assert (=> d!85151 (= (toIndex!0 (select (arr!17231 a!3118) j!142) mask!3119) (bvand (bvxor lt!262424 (bvlshr lt!262424 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574252 d!85151))

(declare-fun b!574547 () Bool)

(declare-fun e!330556 () SeekEntryResult!5680)

(declare-fun lt!262426 () SeekEntryResult!5680)

(assert (=> b!574547 (= e!330556 (Found!5680 (index!24949 lt!262426)))))

(declare-fun b!574548 () Bool)

(declare-fun c!65994 () Bool)

(declare-fun lt!262427 () (_ BitVec 64))

(assert (=> b!574548 (= c!65994 (= lt!262427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330555 () SeekEntryResult!5680)

(assert (=> b!574548 (= e!330556 e!330555)))

(declare-fun b!574549 () Bool)

(assert (=> b!574549 (= e!330555 (MissingZero!5680 (index!24949 lt!262426)))))

(declare-fun b!574550 () Bool)

(declare-fun e!330557 () SeekEntryResult!5680)

(assert (=> b!574550 (= e!330557 Undefined!5680)))

(declare-fun b!574552 () Bool)

(assert (=> b!574552 (= e!330557 e!330556)))

(assert (=> b!574552 (= lt!262427 (select (arr!17231 a!3118) (index!24949 lt!262426)))))

(declare-fun c!65995 () Bool)

(assert (=> b!574552 (= c!65995 (= lt!262427 k!1914))))

