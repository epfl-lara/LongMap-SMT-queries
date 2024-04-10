; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29462 () Bool)

(assert start!29462)

(declare-fun b!298065 () Bool)

(declare-fun res!157188 () Bool)

(declare-fun e!188331 () Bool)

(assert (=> b!298065 (=> (not res!157188) (not e!188331))))

(declare-datatypes ((array!15079 0))(
  ( (array!15080 (arr!7144 (Array (_ BitVec 32) (_ BitVec 64))) (size!7496 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15079)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298065 (= res!157188 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298066 () Bool)

(declare-fun res!157186 () Bool)

(assert (=> b!298066 (=> (not res!157186) (not e!188331))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!298066 (= res!157186 (and (= (size!7496 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7496 a!3312))))))

(declare-fun e!188330 () Bool)

(declare-datatypes ((SeekEntryResult!2293 0))(
  ( (MissingZero!2293 (index!11345 (_ BitVec 32))) (Found!2293 (index!11346 (_ BitVec 32))) (Intermediate!2293 (undefined!3105 Bool) (index!11347 (_ BitVec 32)) (x!29564 (_ BitVec 32))) (Undefined!2293) (MissingVacant!2293 (index!11348 (_ BitVec 32))) )
))
(declare-fun lt!148173 () SeekEntryResult!2293)

(declare-fun b!298067 () Bool)

(declare-fun lt!148172 () SeekEntryResult!2293)

(declare-fun lt!148175 () Bool)

(assert (=> b!298067 (= e!188330 (and (not lt!148175) (= lt!148172 (MissingVacant!2293 i!1256)) (is-Intermediate!2293 lt!148173) (undefined!3105 lt!148173)))))

(declare-fun lt!148176 () SeekEntryResult!2293)

(declare-fun lt!148174 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15079 (_ BitVec 32)) SeekEntryResult!2293)

(assert (=> b!298067 (= lt!148176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148174 k!2524 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312)) mask!3809))))

(assert (=> b!298067 (= lt!148173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148174 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298067 (= lt!148174 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298068 () Bool)

(assert (=> b!298068 (= e!188331 e!188330)))

(declare-fun res!157187 () Bool)

(assert (=> b!298068 (=> (not res!157187) (not e!188330))))

(assert (=> b!298068 (= res!157187 (or lt!148175 (= lt!148172 (MissingVacant!2293 i!1256))))))

(assert (=> b!298068 (= lt!148175 (= lt!148172 (MissingZero!2293 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15079 (_ BitVec 32)) SeekEntryResult!2293)

(assert (=> b!298068 (= lt!148172 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298069 () Bool)

(declare-fun res!157183 () Bool)

(assert (=> b!298069 (=> (not res!157183) (not e!188331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298069 (= res!157183 (validKeyInArray!0 k!2524))))

(declare-fun res!157185 () Bool)

(assert (=> start!29462 (=> (not res!157185) (not e!188331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29462 (= res!157185 (validMask!0 mask!3809))))

(assert (=> start!29462 e!188331))

(assert (=> start!29462 true))

(declare-fun array_inv!5107 (array!15079) Bool)

(assert (=> start!29462 (array_inv!5107 a!3312)))

(declare-fun b!298070 () Bool)

(declare-fun res!157184 () Bool)

(assert (=> b!298070 (=> (not res!157184) (not e!188330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15079 (_ BitVec 32)) Bool)

(assert (=> b!298070 (= res!157184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29462 res!157185) b!298066))

(assert (= (and b!298066 res!157186) b!298069))

(assert (= (and b!298069 res!157183) b!298065))

(assert (= (and b!298065 res!157188) b!298068))

(assert (= (and b!298068 res!157187) b!298070))

(assert (= (and b!298070 res!157184) b!298067))

(declare-fun m!310669 () Bool)

(assert (=> start!29462 m!310669))

(declare-fun m!310671 () Bool)

(assert (=> start!29462 m!310671))

(declare-fun m!310673 () Bool)

(assert (=> b!298068 m!310673))

(declare-fun m!310675 () Bool)

(assert (=> b!298065 m!310675))

(declare-fun m!310677 () Bool)

(assert (=> b!298067 m!310677))

(declare-fun m!310679 () Bool)

(assert (=> b!298067 m!310679))

(declare-fun m!310681 () Bool)

(assert (=> b!298067 m!310681))

(declare-fun m!310683 () Bool)

(assert (=> b!298067 m!310683))

(declare-fun m!310685 () Bool)

(assert (=> b!298070 m!310685))

(declare-fun m!310687 () Bool)

(assert (=> b!298069 m!310687))

(push 1)

(assert (not b!298068))

(assert (not start!29462))

(assert (not b!298065))

(assert (not b!298067))

(assert (not b!298070))

(assert (not b!298069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!298113 () Bool)

(declare-fun c!48043 () Bool)

(declare-fun lt!148199 () (_ BitVec 64))

(assert (=> b!298113 (= c!48043 (= lt!148199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188360 () SeekEntryResult!2293)

(declare-fun e!188361 () SeekEntryResult!2293)

(assert (=> b!298113 (= e!188360 e!188361)))

(declare-fun b!298114 () Bool)

(declare-fun lt!148200 () SeekEntryResult!2293)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15079 (_ BitVec 32)) SeekEntryResult!2293)

(assert (=> b!298114 (= e!188361 (seekKeyOrZeroReturnVacant!0 (x!29564 lt!148200) (index!11347 lt!148200) (index!11347 lt!148200) k!2524 a!3312 mask!3809))))

(declare-fun d!67295 () Bool)

(declare-fun lt!148198 () SeekEntryResult!2293)

(assert (=> d!67295 (and (or (is-Undefined!2293 lt!148198) (not (is-Found!2293 lt!148198)) (and (bvsge (index!11346 lt!148198) #b00000000000000000000000000000000) (bvslt (index!11346 lt!148198) (size!7496 a!3312)))) (or (is-Undefined!2293 lt!148198) (is-Found!2293 lt!148198) (not (is-MissingZero!2293 lt!148198)) (and (bvsge (index!11345 lt!148198) #b00000000000000000000000000000000) (bvslt (index!11345 lt!148198) (size!7496 a!3312)))) (or (is-Undefined!2293 lt!148198) (is-Found!2293 lt!148198) (is-MissingZero!2293 lt!148198) (not (is-MissingVacant!2293 lt!148198)) (and (bvsge (index!11348 lt!148198) #b00000000000000000000000000000000) (bvslt (index!11348 lt!148198) (size!7496 a!3312)))) (or (is-Undefined!2293 lt!148198) (ite (is-Found!2293 lt!148198) (= (select (arr!7144 a!3312) (index!11346 lt!148198)) k!2524) (ite (is-MissingZero!2293 lt!148198) (= (select (arr!7144 a!3312) (index!11345 lt!148198)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2293 lt!148198) (= (select (arr!7144 a!3312) (index!11348 lt!148198)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188362 () SeekEntryResult!2293)

(assert (=> d!67295 (= lt!148198 e!188362)))

(declare-fun c!48042 () Bool)

(assert (=> d!67295 (= c!48042 (and (is-Intermediate!2293 lt!148200) (undefined!3105 lt!148200)))))

(assert (=> d!67295 (= lt!148200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67295 (validMask!0 mask!3809)))

(assert (=> d!67295 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148198)))

(declare-fun b!298117 () Bool)

(assert (=> b!298117 (= e!188362 Undefined!2293)))

(declare-fun b!298118 () Bool)

(assert (=> b!298118 (= e!188362 e!188360)))

(assert (=> b!298118 (= lt!148199 (select (arr!7144 a!3312) (index!11347 lt!148200)))))

(declare-fun c!48044 () Bool)

(assert (=> b!298118 (= c!48044 (= lt!148199 k!2524))))

(declare-fun b!298119 () Bool)

(assert (=> b!298119 (= e!188360 (Found!2293 (index!11347 lt!148200)))))

(declare-fun b!298120 () Bool)

(assert (=> b!298120 (= e!188361 (MissingZero!2293 (index!11347 lt!148200)))))

(assert (= (and d!67295 c!48042) b!298117))

(assert (= (and d!67295 (not c!48042)) b!298118))

(assert (= (and b!298118 c!48044) b!298119))

(assert (= (and b!298118 (not c!48044)) b!298113))

(assert (= (and b!298113 c!48043) b!298120))

(assert (= (and b!298113 (not c!48043)) b!298114))

(declare-fun m!310705 () Bool)

(assert (=> b!298114 m!310705))

(assert (=> d!67295 m!310683))

(assert (=> d!67295 m!310683))

(declare-fun m!310707 () Bool)

(assert (=> d!67295 m!310707))

(declare-fun m!310709 () Bool)

(assert (=> d!67295 m!310709))

(declare-fun m!310711 () Bool)

(assert (=> d!67295 m!310711))

(declare-fun m!310713 () Bool)

(assert (=> d!67295 m!310713))

(assert (=> d!67295 m!310669))

(declare-fun m!310715 () Bool)

(assert (=> b!298118 m!310715))

(assert (=> b!298068 d!67295))

(declare-fun b!298203 () Bool)

(declare-fun e!188415 () SeekEntryResult!2293)

(assert (=> b!298203 (= e!188415 (Intermediate!2293 true lt!148174 #b00000000000000000000000000000000))))

(declare-fun b!298204 () Bool)

(declare-fun e!188413 () SeekEntryResult!2293)

(assert (=> b!298204 (= e!188413 (Intermediate!2293 false lt!148174 #b00000000000000000000000000000000))))

(declare-fun lt!148226 () SeekEntryResult!2293)

(declare-fun b!298205 () Bool)

(assert (=> b!298205 (and (bvsge (index!11347 lt!148226) #b00000000000000000000000000000000) (bvslt (index!11347 lt!148226) (size!7496 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312)))))))

(declare-fun res!157233 () Bool)

(assert (=> b!298205 (= res!157233 (= (select (arr!7144 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312))) (index!11347 lt!148226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188416 () Bool)

(assert (=> b!298205 (=> res!157233 e!188416)))

(declare-fun b!298206 () Bool)

(assert (=> b!298206 (and (bvsge (index!11347 lt!148226) #b00000000000000000000000000000000) (bvslt (index!11347 lt!148226) (size!7496 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312)))))))

(declare-fun res!157234 () Bool)

(assert (=> b!298206 (= res!157234 (= (select (arr!7144 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312))) (index!11347 lt!148226)) k!2524))))

(assert (=> b!298206 (=> res!157234 e!188416)))

(declare-fun e!188412 () Bool)

(assert (=> b!298206 (= e!188412 e!188416)))

(declare-fun d!67305 () Bool)

(declare-fun e!188414 () Bool)

(assert (=> d!67305 e!188414))

(declare-fun c!48071 () Bool)

(assert (=> d!67305 (= c!48071 (and (is-Intermediate!2293 lt!148226) (undefined!3105 lt!148226)))))

(assert (=> d!67305 (= lt!148226 e!188415)))

(declare-fun c!48070 () Bool)

(assert (=> d!67305 (= c!48070 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148227 () (_ BitVec 64))

(assert (=> d!67305 (= lt!148227 (select (arr!7144 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312))) lt!148174))))

(assert (=> d!67305 (validMask!0 mask!3809)))

(assert (=> d!67305 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148174 k!2524 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312)) mask!3809) lt!148226)))

(declare-fun b!298207 () Bool)

(assert (=> b!298207 (and (bvsge (index!11347 lt!148226) #b00000000000000000000000000000000) (bvslt (index!11347 lt!148226) (size!7496 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312)))))))

(assert (=> b!298207 (= e!188416 (= (select (arr!7144 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312))) (index!11347 lt!148226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298208 () Bool)

(assert (=> b!298208 (= e!188414 e!188412)))

(declare-fun res!157232 () Bool)

(assert (=> b!298208 (= res!157232 (and (is-Intermediate!2293 lt!148226) (not (undefined!3105 lt!148226)) (bvslt (x!29564 lt!148226) #b01111111111111111111111111111110) (bvsge (x!29564 lt!148226) #b00000000000000000000000000000000) (bvsge (x!29564 lt!148226) #b00000000000000000000000000000000)))))

(assert (=> b!298208 (=> (not res!157232) (not e!188412))))

(declare-fun b!298209 () Bool)

(assert (=> b!298209 (= e!188415 e!188413)))

(declare-fun c!48072 () Bool)

(assert (=> b!298209 (= c!48072 (or (= lt!148227 k!2524) (= (bvadd lt!148227 lt!148227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298210 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298210 (= e!188413 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148174 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15080 (store (arr!7144 a!3312) i!1256 k!2524) (size!7496 a!3312)) mask!3809))))

(declare-fun b!298211 () Bool)

(assert (=> b!298211 (= e!188414 (bvsge (x!29564 lt!148226) #b01111111111111111111111111111110))))

(assert (= (and d!67305 c!48070) b!298203))

(assert (= (and d!67305 (not c!48070)) b!298209))

(assert (= (and b!298209 c!48072) b!298204))

(assert (= (and b!298209 (not c!48072)) b!298210))

(assert (= (and d!67305 c!48071) b!298211))

(assert (= (and d!67305 (not c!48071)) b!298208))

(assert (= (and b!298208 res!157232) b!298206))

(assert (= (and b!298206 (not res!157234)) b!298205))

(assert (= (and b!298205 (not res!157233)) b!298207))

(declare-fun m!310745 () Bool)

(assert (=> d!67305 m!310745))

(assert (=> d!67305 m!310669))

(declare-fun m!310747 () Bool)

(assert (=> b!298206 m!310747))

(assert (=> b!298205 m!310747))

(assert (=> b!298207 m!310747))

(declare-fun m!310749 () Bool)

(assert (=> b!298210 m!310749))

(assert (=> b!298210 m!310749))

(declare-fun m!310751 () Bool)

(assert (=> b!298210 m!310751))

(assert (=> b!298067 d!67305))

(declare-fun b!298212 () Bool)

(declare-fun e!188420 () SeekEntryResult!2293)

(assert (=> b!298212 (= e!188420 (Intermediate!2293 true lt!148174 #b00000000000000000000000000000000))))

(declare-fun b!298213 () Bool)

(declare-fun e!188418 () SeekEntryResult!2293)

(assert (=> b!298213 (= e!188418 (Intermediate!2293 false lt!148174 #b00000000000000000000000000000000))))

(declare-fun b!298214 () Bool)

(declare-fun lt!148228 () SeekEntryResult!2293)

(assert (=> b!298214 (and (bvsge (index!11347 lt!148228) #b00000000000000000000000000000000) (bvslt (index!11347 lt!148228) (size!7496 a!3312)))))

(declare-fun res!157236 () Bool)

(assert (=> b!298214 (= res!157236 (= (select (arr!7144 a!3312) (index!11347 lt!148228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188421 () Bool)

(assert (=> b!298214 (=> res!157236 e!188421)))

(declare-fun b!298215 () Bool)

(assert (=> b!298215 (and (bvsge (index!11347 lt!148228) #b00000000000000000000000000000000) (bvslt (index!11347 lt!148228) (size!7496 a!3312)))))

(declare-fun res!157237 () Bool)

(assert (=> b!298215 (= res!157237 (= (select (arr!7144 a!3312) (index!11347 lt!148228)) k!2524))))

(assert (=> b!298215 (=> res!157237 e!188421)))

(declare-fun e!188417 () Bool)

(assert (=> b!298215 (= e!188417 e!188421)))

(declare-fun d!67319 () Bool)

(declare-fun e!188419 () Bool)

(assert (=> d!67319 e!188419))

(declare-fun c!48074 () Bool)

(assert (=> d!67319 (= c!48074 (and (is-Intermediate!2293 lt!148228) (undefined!3105 lt!148228)))))

(assert (=> d!67319 (= lt!148228 e!188420)))

(declare-fun c!48073 () Bool)

(assert (=> d!67319 (= c!48073 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148229 () (_ BitVec 64))

(assert (=> d!67319 (= lt!148229 (select (arr!7144 a!3312) lt!148174))))

(assert (=> d!67319 (validMask!0 mask!3809)))

(assert (=> d!67319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148174 k!2524 a!3312 mask!3809) lt!148228)))

(declare-fun b!298216 () Bool)

(assert (=> b!298216 (and (bvsge (index!11347 lt!148228) #b00000000000000000000000000000000) (bvslt (index!11347 lt!148228) (size!7496 a!3312)))))

(assert (=> b!298216 (= e!188421 (= (select (arr!7144 a!3312) (index!11347 lt!148228)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298217 () Bool)

(assert (=> b!298217 (= e!188419 e!188417)))

(declare-fun res!157235 () Bool)

(assert (=> b!298217 (= res!157235 (and (is-Intermediate!2293 lt!148228) (not (undefined!3105 lt!148228)) (bvslt (x!29564 lt!148228) #b01111111111111111111111111111110) (bvsge (x!29564 lt!148228) #b00000000000000000000000000000000) (bvsge (x!29564 lt!148228) #b00000000000000000000000000000000)))))

(assert (=> b!298217 (=> (not res!157235) (not e!188417))))

(declare-fun b!298218 () Bool)

(assert (=> b!298218 (= e!188420 e!188418)))

(declare-fun c!48075 () Bool)

(assert (=> b!298218 (= c!48075 (or (= lt!148229 k!2524) (= (bvadd lt!148229 lt!148229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298219 () Bool)

(assert (=> b!298219 (= e!188418 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148174 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298220 () Bool)

(assert (=> b!298220 (= e!188419 (bvsge (x!29564 lt!148228) #b01111111111111111111111111111110))))

(assert (= (and d!67319 c!48073) b!298212))

(assert (= (and d!67319 (not c!48073)) b!298218))

(assert (= (and b!298218 c!48075) b!298213))

(assert (= (and b!298218 (not c!48075)) b!298219))

(assert (= (and d!67319 c!48074) b!298220))

(assert (= (and d!67319 (not c!48074)) b!298217))

(assert (= (and b!298217 res!157235) b!298215))

(assert (= (and b!298215 (not res!157237)) b!298214))

(assert (= (and b!298214 (not res!157236)) b!298216))

(declare-fun m!310753 () Bool)

(assert (=> d!67319 m!310753))

(assert (=> d!67319 m!310669))

(declare-fun m!310755 () Bool)

(assert (=> b!298215 m!310755))

(assert (=> b!298214 m!310755))

(assert (=> b!298216 m!310755))

(assert (=> b!298219 m!310749))

(assert (=> b!298219 m!310749))

(declare-fun m!310757 () Bool)

(assert (=> b!298219 m!310757))

(assert (=> b!298067 d!67319))

(declare-fun d!67321 () Bool)

(declare-fun lt!148248 () (_ BitVec 32))

(declare-fun lt!148247 () (_ BitVec 32))

(assert (=> d!67321 (= lt!148248 (bvmul (bvxor lt!148247 (bvlshr lt!148247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67321 (= lt!148247 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67321 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157240 (let ((h!5305 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29569 (bvmul (bvxor h!5305 (bvlshr h!5305 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29569 (bvlshr x!29569 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157240 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157240 #b00000000000000000000000000000000))))))

(assert (=> d!67321 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148248 (bvlshr lt!148248 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298067 d!67321))

(declare-fun d!67329 () Bool)

(assert (=> d!67329 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298069 d!67329))

(declare-fun d!67331 () Bool)

