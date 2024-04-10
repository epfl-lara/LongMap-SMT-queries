; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85968 () Bool)

(assert start!85968)

(declare-fun res!666342 () Bool)

(declare-fun e!562045 () Bool)

(assert (=> start!85968 (=> (not res!666342) (not e!562045))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85968 (= res!666342 (validMask!0 mask!3464))))

(assert (=> start!85968 e!562045))

(declare-datatypes ((array!63018 0))(
  ( (array!63019 (arr!30342 (Array (_ BitVec 32) (_ BitVec 64))) (size!30844 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63018)

(declare-fun array_inv!23466 (array!63018) Bool)

(assert (=> start!85968 (array_inv!23466 a!3219)))

(assert (=> start!85968 true))

(declare-fun b!996136 () Bool)

(declare-fun res!666339 () Bool)

(declare-fun e!562043 () Bool)

(assert (=> b!996136 (=> (not res!666339) (not e!562043))))

(declare-datatypes ((List!21018 0))(
  ( (Nil!21015) (Cons!21014 (h!22176 (_ BitVec 64)) (t!30019 List!21018)) )
))
(declare-fun arrayNoDuplicates!0 (array!63018 (_ BitVec 32) List!21018) Bool)

(assert (=> b!996136 (= res!666339 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21015))))

(declare-fun b!996137 () Bool)

(declare-fun res!666343 () Bool)

(assert (=> b!996137 (=> (not res!666343) (not e!562045))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996137 (= res!666343 (validKeyInArray!0 (select (arr!30342 a!3219) j!170)))))

(declare-fun b!996138 () Bool)

(declare-fun res!666340 () Bool)

(assert (=> b!996138 (=> (not res!666340) (not e!562045))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996138 (= res!666340 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996139 () Bool)

(declare-fun res!666337 () Bool)

(assert (=> b!996139 (=> (not res!666337) (not e!562043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63018 (_ BitVec 32)) Bool)

(assert (=> b!996139 (= res!666337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996140 () Bool)

(declare-fun lt!441130 () (_ BitVec 32))

(assert (=> b!996140 (= e!562043 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441130 #b00000000000000000000000000000000) (bvsge lt!441130 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996140 (= lt!441130 (toIndex!0 (select (arr!30342 a!3219) j!170) mask!3464))))

(declare-fun b!996141 () Bool)

(declare-fun res!666345 () Bool)

(assert (=> b!996141 (=> (not res!666345) (not e!562045))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996141 (= res!666345 (and (= (size!30844 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30844 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30844 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996142 () Bool)

(declare-fun res!666341 () Bool)

(assert (=> b!996142 (=> (not res!666341) (not e!562043))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996142 (= res!666341 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30844 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30844 a!3219))))))

(declare-fun b!996143 () Bool)

(assert (=> b!996143 (= e!562045 e!562043)))

(declare-fun res!666344 () Bool)

(assert (=> b!996143 (=> (not res!666344) (not e!562043))))

(declare-datatypes ((SeekEntryResult!9274 0))(
  ( (MissingZero!9274 (index!39467 (_ BitVec 32))) (Found!9274 (index!39468 (_ BitVec 32))) (Intermediate!9274 (undefined!10086 Bool) (index!39469 (_ BitVec 32)) (x!86899 (_ BitVec 32))) (Undefined!9274) (MissingVacant!9274 (index!39470 (_ BitVec 32))) )
))
(declare-fun lt!441131 () SeekEntryResult!9274)

(assert (=> b!996143 (= res!666344 (or (= lt!441131 (MissingVacant!9274 i!1194)) (= lt!441131 (MissingZero!9274 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63018 (_ BitVec 32)) SeekEntryResult!9274)

(assert (=> b!996143 (= lt!441131 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996144 () Bool)

(declare-fun res!666338 () Bool)

(assert (=> b!996144 (=> (not res!666338) (not e!562045))))

(assert (=> b!996144 (= res!666338 (validKeyInArray!0 k!2224))))

(assert (= (and start!85968 res!666342) b!996141))

(assert (= (and b!996141 res!666345) b!996137))

(assert (= (and b!996137 res!666343) b!996144))

(assert (= (and b!996144 res!666338) b!996138))

(assert (= (and b!996138 res!666340) b!996143))

(assert (= (and b!996143 res!666344) b!996139))

(assert (= (and b!996139 res!666337) b!996136))

(assert (= (and b!996136 res!666339) b!996142))

(assert (= (and b!996142 res!666341) b!996140))

(declare-fun m!923349 () Bool)

(assert (=> b!996139 m!923349))

(declare-fun m!923351 () Bool)

(assert (=> b!996143 m!923351))

(declare-fun m!923353 () Bool)

(assert (=> start!85968 m!923353))

(declare-fun m!923355 () Bool)

(assert (=> start!85968 m!923355))

(declare-fun m!923357 () Bool)

(assert (=> b!996138 m!923357))

(declare-fun m!923359 () Bool)

(assert (=> b!996144 m!923359))

(declare-fun m!923361 () Bool)

(assert (=> b!996137 m!923361))

(assert (=> b!996137 m!923361))

(declare-fun m!923363 () Bool)

(assert (=> b!996137 m!923363))

(assert (=> b!996140 m!923361))

(assert (=> b!996140 m!923361))

(declare-fun m!923365 () Bool)

(assert (=> b!996140 m!923365))

(declare-fun m!923367 () Bool)

(assert (=> b!996136 m!923367))

(push 1)

(assert (not b!996138))

(assert (not b!996136))

(assert (not b!996139))

(assert (not b!996140))

(assert (not b!996144))

(assert (not b!996137))

(assert (not b!996143))

(assert (not start!85968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118963 () Bool)

(assert (=> d!118963 (= (validKeyInArray!0 (select (arr!30342 a!3219) j!170)) (and (not (= (select (arr!30342 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30342 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996137 d!118963))

(declare-fun d!118965 () Bool)

(assert (=> d!118965 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996144 d!118965))

(declare-fun d!118967 () Bool)

(declare-fun res!666363 () Bool)

(declare-fun e!562068 () Bool)

(assert (=> d!118967 (=> res!666363 e!562068)))

(assert (=> d!118967 (= res!666363 (= (select (arr!30342 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118967 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!562068)))

(declare-fun b!996172 () Bool)

(declare-fun e!562069 () Bool)

(assert (=> b!996172 (= e!562068 e!562069)))

(declare-fun res!666364 () Bool)

(assert (=> b!996172 (=> (not res!666364) (not e!562069))))

(assert (=> b!996172 (= res!666364 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30844 a!3219)))))

(declare-fun b!996173 () Bool)

(assert (=> b!996173 (= e!562069 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118967 (not res!666363)) b!996172))

(assert (= (and b!996172 res!666364) b!996173))

(declare-fun m!923377 () Bool)

(assert (=> d!118967 m!923377))

(declare-fun m!923379 () Bool)

(assert (=> b!996173 m!923379))

(assert (=> b!996138 d!118967))

(declare-fun b!996214 () Bool)

(declare-fun e!562095 () SeekEntryResult!9274)

(declare-fun lt!441158 () SeekEntryResult!9274)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63018 (_ BitVec 32)) SeekEntryResult!9274)

(assert (=> b!996214 (= e!562095 (seekKeyOrZeroReturnVacant!0 (x!86899 lt!441158) (index!39469 lt!441158) (index!39469 lt!441158) k!2224 a!3219 mask!3464))))

(declare-fun b!996215 () Bool)

(declare-fun c!101061 () Bool)

(declare-fun lt!441156 () (_ BitVec 64))

(assert (=> b!996215 (= c!101061 (= lt!441156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562094 () SeekEntryResult!9274)

(assert (=> b!996215 (= e!562094 e!562095)))

(declare-fun b!996216 () Bool)

(declare-fun e!562096 () SeekEntryResult!9274)

(assert (=> b!996216 (= e!562096 Undefined!9274)))

(declare-fun d!118969 () Bool)

(declare-fun lt!441157 () SeekEntryResult!9274)

(assert (=> d!118969 (and (or (is-Undefined!9274 lt!441157) (not (is-Found!9274 lt!441157)) (and (bvsge (index!39468 lt!441157) #b00000000000000000000000000000000) (bvslt (index!39468 lt!441157) (size!30844 a!3219)))) (or (is-Undefined!9274 lt!441157) (is-Found!9274 lt!441157) (not (is-MissingZero!9274 lt!441157)) (and (bvsge (index!39467 lt!441157) #b00000000000000000000000000000000) (bvslt (index!39467 lt!441157) (size!30844 a!3219)))) (or (is-Undefined!9274 lt!441157) (is-Found!9274 lt!441157) (is-MissingZero!9274 lt!441157) (not (is-MissingVacant!9274 lt!441157)) (and (bvsge (index!39470 lt!441157) #b00000000000000000000000000000000) (bvslt (index!39470 lt!441157) (size!30844 a!3219)))) (or (is-Undefined!9274 lt!441157) (ite (is-Found!9274 lt!441157) (= (select (arr!30342 a!3219) (index!39468 lt!441157)) k!2224) (ite (is-MissingZero!9274 lt!441157) (= (select (arr!30342 a!3219) (index!39467 lt!441157)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9274 lt!441157) (= (select (arr!30342 a!3219) (index!39470 lt!441157)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118969 (= lt!441157 e!562096)))

(declare-fun c!101063 () Bool)

(assert (=> d!118969 (= c!101063 (and (is-Intermediate!9274 lt!441158) (undefined!10086 lt!441158)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63018 (_ BitVec 32)) SeekEntryResult!9274)

(assert (=> d!118969 (= lt!441158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!118969 (validMask!0 mask!3464)))

(assert (=> d!118969 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441157)))

(declare-fun b!996217 () Bool)

(assert (=> b!996217 (= e!562094 (Found!9274 (index!39469 lt!441158)))))

(declare-fun b!996218 () Bool)

(assert (=> b!996218 (= e!562095 (MissingZero!9274 (index!39469 lt!441158)))))

(declare-fun b!996219 () Bool)

(assert (=> b!996219 (= e!562096 e!562094)))

(assert (=> b!996219 (= lt!441156 (select (arr!30342 a!3219) (index!39469 lt!441158)))))

(declare-fun c!101062 () Bool)

(assert (=> b!996219 (= c!101062 (= lt!441156 k!2224))))

(assert (= (and d!118969 c!101063) b!996216))

(assert (= (and d!118969 (not c!101063)) b!996219))

(assert (= (and b!996219 c!101062) b!996217))

(assert (= (and b!996219 (not c!101062)) b!996215))

(assert (= (and b!996215 c!101061) b!996218))

(assert (= (and b!996215 (not c!101061)) b!996214))

(declare-fun m!923409 () Bool)

(assert (=> b!996214 m!923409))

(declare-fun m!923411 () Bool)

(assert (=> d!118969 m!923411))

(declare-fun m!923413 () Bool)

(assert (=> d!118969 m!923413))

(declare-fun m!923415 () Bool)

(assert (=> d!118969 m!923415))

(assert (=> d!118969 m!923353))

(declare-fun m!923417 () Bool)

(assert (=> d!118969 m!923417))

(declare-fun m!923419 () Bool)

(assert (=> d!118969 m!923419))

(assert (=> d!118969 m!923413))

(declare-fun m!923421 () Bool)

(assert (=> b!996219 m!923421))

(assert (=> b!996143 d!118969))

(declare-fun d!118985 () Bool)

(declare-fun lt!441170 () (_ BitVec 32))

(declare-fun lt!441169 () (_ BitVec 32))

(assert (=> d!118985 (= lt!441170 (bvmul (bvxor lt!441169 (bvlshr lt!441169 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!118985 (= lt!441169 ((_ extract 31 0) (bvand (bvxor (select (arr!30342 a!3219) j!170) (bvlshr (select (arr!30342 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!118985 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!666374 (let ((h!22178 ((_ extract 31 0) (bvand (bvxor (select (arr!30342 a!3219) j!170) (bvlshr (select (arr!30342 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!86901 (bvmul (bvxor h!22178 (bvlshr h!22178 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!86901 (bvlshr x!86901 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!666374 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!666374 #b00000000000000000000000000000000))))))

(assert (=> d!118985 (= (toIndex!0 (select (arr!30342 a!3219) j!170) mask!3464) (bvand (bvxor lt!441170 (bvlshr lt!441170 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!996140 d!118985))

(declare-fun b!996264 () Bool)

(declare-fun e!562128 () Bool)

(declare-fun call!42233 () Bool)

(assert (=> b!996264 (= e!562128 call!42233)))

(declare-fun d!118991 () Bool)

(declare-fun res!666391 () Bool)

(declare-fun e!562129 () Bool)

(assert (=> d!118991 (=> res!666391 e!562129)))

(assert (=> d!118991 (= res!666391 (bvsge #b00000000000000000000000000000000 (size!30844 a!3219)))))

(assert (=> d!118991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562129)))

(declare-fun bm!42230 () Bool)

(assert (=> bm!42230 (= call!42233 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!996265 () Bool)

(declare-fun e!562127 () Bool)

(assert (=> b!996265 (= e!562127 call!42233)))

(declare-fun b!996266 () Bool)

(assert (=> b!996266 (= e!562129 e!562128)))

(declare-fun c!101078 () Bool)

(assert (=> b!996266 (= c!101078 (validKeyInArray!0 (select (arr!30342 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996267 () Bool)

(assert (=> b!996267 (= e!562128 e!562127)))

(declare-fun lt!441197 () (_ BitVec 64))

(assert (=> b!996267 (= lt!441197 (select (arr!30342 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32972 0))(
  ( (Unit!32973) )
))
(declare-fun lt!441196 () Unit!32972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63018 (_ BitVec 64) (_ BitVec 32)) Unit!32972)

(assert (=> b!996267 (= lt!441196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441197 #b00000000000000000000000000000000))))

(assert (=> b!996267 (arrayContainsKey!0 a!3219 lt!441197 #b00000000000000000000000000000000)))

(declare-fun lt!441195 () Unit!32972)

(assert (=> b!996267 (= lt!441195 lt!441196)))

(declare-fun res!666392 () Bool)

(assert (=> b!996267 (= res!666392 (= (seekEntryOrOpen!0 (select (arr!30342 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9274 #b00000000000000000000000000000000)))))

(assert (=> b!996267 (=> (not res!666392) (not e!562127))))

(assert (= (and d!118991 (not res!666391)) b!996266))

(assert (= (and b!996266 c!101078) b!996267))

(assert (= (and b!996266 (not c!101078)) b!996264))

(assert (= (and b!996267 res!666392) b!996265))

(assert (= (or b!996265 b!996264) bm!42230))

(declare-fun m!923433 () Bool)

(assert (=> bm!42230 m!923433))

(assert (=> b!996266 m!923377))

(assert (=> b!996266 m!923377))

(declare-fun m!923435 () Bool)

(assert (=> b!996266 m!923435))

(assert (=> b!996267 m!923377))

(declare-fun m!923437 () Bool)

(assert (=> b!996267 m!923437))

(declare-fun m!923441 () Bool)

(assert (=> b!996267 m!923441))

(assert (=> b!996267 m!923377))

(declare-fun m!923445 () Bool)

(assert (=> b!996267 m!923445))

(assert (=> b!996139 d!118991))

(declare-fun d!118997 () Bool)

(assert (=> d!118997 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85968 d!118997))

(declare-fun d!119003 () Bool)

(assert (=> d!119003 (= (array_inv!23466 a!3219) (bvsge (size!30844 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85968 d!119003))

(declare-fun bm!42236 () Bool)

(declare-fun call!42239 () Bool)

(declare-fun c!101084 () Bool)

(assert (=> bm!42236 (= call!42239 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101084 (Cons!21014 (select (arr!30342 a!3219) #b00000000000000000000000000000000) Nil!21015) Nil!21015)))))

(declare-fun b!996293 () Bool)

(declare-fun e!562151 () Bool)

(declare-fun contains!5867 (List!21018 (_ BitVec 64)) Bool)

(assert (=> b!996293 (= e!562151 (contains!5867 Nil!21015 (select (arr!30342 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996294 () Bool)

(declare-fun e!562153 () Bool)

(assert (=> b!996294 (= e!562153 call!42239)))

(declare-fun d!119005 () Bool)

(declare-fun res!666410 () Bool)

(declare-fun e!562152 () Bool)

(assert (=> d!119005 (=> res!666410 e!562152)))

(assert (=> d!119005 (= res!666410 (bvsge #b00000000000000000000000000000000 (size!30844 a!3219)))))

(assert (=> d!119005 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21015) e!562152)))

(declare-fun b!996295 () Bool)

(assert (=> b!996295 (= e!562153 call!42239)))

(declare-fun b!996296 () Bool)

(declare-fun e!562150 () Bool)

(assert (=> b!996296 (= e!562152 e!562150)))

(declare-fun res!666411 () Bool)

(assert (=> b!996296 (=> (not res!666411) (not e!562150))))

(assert (=> b!996296 (= res!666411 (not e!562151))))

(declare-fun res!666409 () Bool)

(assert (=> b!996296 (=> (not res!666409) (not e!562151))))

(assert (=> b!996296 (= res!666409 (validKeyInArray!0 (select (arr!30342 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996297 () Bool)

(assert (=> b!996297 (= e!562150 e!562153)))

(assert (=> b!996297 (= c!101084 (validKeyInArray!0 (select (arr!30342 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119005 (not res!666410)) b!996296))

(assert (= (and b!996296 res!666409) b!996293))

(assert (= (and b!996296 res!666411) b!996297))

(assert (= (and b!996297 c!101084) b!996294))

(assert (= (and b!996297 (not c!101084)) b!996295))

(assert (= (or b!996294 b!996295) bm!42236))

(assert (=> bm!42236 m!923377))

(declare-fun m!923461 () Bool)

(assert (=> bm!42236 m!923461))

(assert (=> b!996293 m!923377))

(assert (=> b!996293 m!923377))

(declare-fun m!923463 () Bool)

(assert (=> b!996293 m!923463))

(assert (=> b!996296 m!923377))

(assert (=> b!996296 m!923377))

(assert (=> b!996296 m!923435))

(assert (=> b!996297 m!923377))

(assert (=> b!996297 m!923377))

(assert (=> b!996297 m!923435))

(assert (=> b!996136 d!119005))

(push 1)

