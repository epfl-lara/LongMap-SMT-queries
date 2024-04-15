; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29510 () Bool)

(assert start!29510)

(declare-fun b!298160 () Bool)

(declare-fun res!157269 () Bool)

(declare-fun e!188366 () Bool)

(assert (=> b!298160 (=> (not res!157269) (not e!188366))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15085 0))(
  ( (array!15086 (arr!7146 (Array (_ BitVec 32) (_ BitVec 64))) (size!7499 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15085)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!298160 (= res!157269 (and (= (size!7499 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7499 a!3312))))))

(declare-fun e!188368 () Bool)

(declare-fun lt!148134 () Bool)

(declare-datatypes ((SeekEntryResult!2294 0))(
  ( (MissingZero!2294 (index!11349 (_ BitVec 32))) (Found!2294 (index!11350 (_ BitVec 32))) (Intermediate!2294 (undefined!3106 Bool) (index!11351 (_ BitVec 32)) (x!29591 (_ BitVec 32))) (Undefined!2294) (MissingVacant!2294 (index!11352 (_ BitVec 32))) )
))
(declare-fun lt!148136 () SeekEntryResult!2294)

(declare-fun lt!148135 () SeekEntryResult!2294)

(declare-fun b!298161 () Bool)

(get-info :version)

(assert (=> b!298161 (= e!188368 (and (not lt!148134) (= lt!148136 (MissingVacant!2294 i!1256)) (let ((bdg!6419 (not ((_ is Intermediate!2294) lt!148135)))) (and (or bdg!6419 (not (undefined!3106 lt!148135))) (not bdg!6419) (or (bvslt (index!11351 lt!148135) #b00000000000000000000000000000000) (bvsge (index!11351 lt!148135) (size!7499 a!3312)))))))))

(declare-fun lt!148137 () SeekEntryResult!2294)

(declare-fun lt!148133 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15085 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!298161 (= lt!148137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148133 k0!2524 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312)) mask!3809))))

(assert (=> b!298161 (= lt!148135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148133 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298161 (= lt!148133 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298162 () Bool)

(declare-fun res!157266 () Bool)

(assert (=> b!298162 (=> (not res!157266) (not e!188366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298162 (= res!157266 (validKeyInArray!0 k0!2524))))

(declare-fun b!298163 () Bool)

(assert (=> b!298163 (= e!188366 e!188368)))

(declare-fun res!157268 () Bool)

(assert (=> b!298163 (=> (not res!157268) (not e!188368))))

(assert (=> b!298163 (= res!157268 (or lt!148134 (= lt!148136 (MissingVacant!2294 i!1256))))))

(assert (=> b!298163 (= lt!148134 (= lt!148136 (MissingZero!2294 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15085 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!298163 (= lt!148136 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!157265 () Bool)

(assert (=> start!29510 (=> (not res!157265) (not e!188366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29510 (= res!157265 (validMask!0 mask!3809))))

(assert (=> start!29510 e!188366))

(assert (=> start!29510 true))

(declare-fun array_inv!5118 (array!15085) Bool)

(assert (=> start!29510 (array_inv!5118 a!3312)))

(declare-fun b!298164 () Bool)

(declare-fun res!157270 () Bool)

(assert (=> b!298164 (=> (not res!157270) (not e!188368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15085 (_ BitVec 32)) Bool)

(assert (=> b!298164 (= res!157270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298165 () Bool)

(declare-fun res!157267 () Bool)

(assert (=> b!298165 (=> (not res!157267) (not e!188366))))

(declare-fun arrayContainsKey!0 (array!15085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298165 (= res!157267 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29510 res!157265) b!298160))

(assert (= (and b!298160 res!157269) b!298162))

(assert (= (and b!298162 res!157266) b!298165))

(assert (= (and b!298165 res!157267) b!298163))

(assert (= (and b!298163 res!157268) b!298164))

(assert (= (and b!298164 res!157270) b!298161))

(declare-fun m!310233 () Bool)

(assert (=> b!298165 m!310233))

(declare-fun m!310235 () Bool)

(assert (=> b!298163 m!310235))

(declare-fun m!310237 () Bool)

(assert (=> b!298164 m!310237))

(declare-fun m!310239 () Bool)

(assert (=> b!298161 m!310239))

(declare-fun m!310241 () Bool)

(assert (=> b!298161 m!310241))

(declare-fun m!310243 () Bool)

(assert (=> b!298161 m!310243))

(declare-fun m!310245 () Bool)

(assert (=> b!298161 m!310245))

(declare-fun m!310247 () Bool)

(assert (=> start!29510 m!310247))

(declare-fun m!310249 () Bool)

(assert (=> start!29510 m!310249))

(declare-fun m!310251 () Bool)

(assert (=> b!298162 m!310251))

(check-sat (not b!298161) (not start!29510) (not b!298164) (not b!298162) (not b!298163) (not b!298165))
(check-sat)
(get-model)

(declare-fun lt!148172 () SeekEntryResult!2294)

(declare-fun b!298220 () Bool)

(assert (=> b!298220 (and (bvsge (index!11351 lt!148172) #b00000000000000000000000000000000) (bvslt (index!11351 lt!148172) (size!7499 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312)))))))

(declare-fun res!157313 () Bool)

(assert (=> b!298220 (= res!157313 (= (select (arr!7146 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312))) (index!11351 lt!148172)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188398 () Bool)

(assert (=> b!298220 (=> res!157313 e!188398)))

(declare-fun b!298221 () Bool)

(assert (=> b!298221 (and (bvsge (index!11351 lt!148172) #b00000000000000000000000000000000) (bvslt (index!11351 lt!148172) (size!7499 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312)))))))

(assert (=> b!298221 (= e!188398 (= (select (arr!7146 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312))) (index!11351 lt!148172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67157 () Bool)

(declare-fun e!188400 () Bool)

(assert (=> d!67157 e!188400))

(declare-fun c!48040 () Bool)

(assert (=> d!67157 (= c!48040 (and ((_ is Intermediate!2294) lt!148172) (undefined!3106 lt!148172)))))

(declare-fun e!188401 () SeekEntryResult!2294)

(assert (=> d!67157 (= lt!148172 e!188401)))

(declare-fun c!48041 () Bool)

(assert (=> d!67157 (= c!48041 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148173 () (_ BitVec 64))

(assert (=> d!67157 (= lt!148173 (select (arr!7146 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312))) lt!148133))))

(assert (=> d!67157 (validMask!0 mask!3809)))

(assert (=> d!67157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148133 k0!2524 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312)) mask!3809) lt!148172)))

(declare-fun b!298222 () Bool)

(declare-fun e!188399 () SeekEntryResult!2294)

(assert (=> b!298222 (= e!188399 (Intermediate!2294 false lt!148133 #b00000000000000000000000000000000))))

(declare-fun b!298223 () Bool)

(assert (=> b!298223 (= e!188400 (bvsge (x!29591 lt!148172) #b01111111111111111111111111111110))))

(declare-fun b!298224 () Bool)

(assert (=> b!298224 (and (bvsge (index!11351 lt!148172) #b00000000000000000000000000000000) (bvslt (index!11351 lt!148172) (size!7499 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312)))))))

(declare-fun res!157314 () Bool)

(assert (=> b!298224 (= res!157314 (= (select (arr!7146 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312))) (index!11351 lt!148172)) k0!2524))))

(assert (=> b!298224 (=> res!157314 e!188398)))

(declare-fun e!188397 () Bool)

(assert (=> b!298224 (= e!188397 e!188398)))

(declare-fun b!298225 () Bool)

(assert (=> b!298225 (= e!188401 e!188399)))

(declare-fun c!48039 () Bool)

(assert (=> b!298225 (= c!48039 (or (= lt!148173 k0!2524) (= (bvadd lt!148173 lt!148173) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298226 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298226 (= e!188399 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148133 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15086 (store (arr!7146 a!3312) i!1256 k0!2524) (size!7499 a!3312)) mask!3809))))

(declare-fun b!298227 () Bool)

(assert (=> b!298227 (= e!188400 e!188397)))

(declare-fun res!157315 () Bool)

(assert (=> b!298227 (= res!157315 (and ((_ is Intermediate!2294) lt!148172) (not (undefined!3106 lt!148172)) (bvslt (x!29591 lt!148172) #b01111111111111111111111111111110) (bvsge (x!29591 lt!148172) #b00000000000000000000000000000000) (bvsge (x!29591 lt!148172) #b00000000000000000000000000000000)))))

(assert (=> b!298227 (=> (not res!157315) (not e!188397))))

(declare-fun b!298228 () Bool)

(assert (=> b!298228 (= e!188401 (Intermediate!2294 true lt!148133 #b00000000000000000000000000000000))))

(assert (= (and d!67157 c!48041) b!298228))

(assert (= (and d!67157 (not c!48041)) b!298225))

(assert (= (and b!298225 c!48039) b!298222))

(assert (= (and b!298225 (not c!48039)) b!298226))

(assert (= (and d!67157 c!48040) b!298223))

(assert (= (and d!67157 (not c!48040)) b!298227))

(assert (= (and b!298227 res!157315) b!298224))

(assert (= (and b!298224 (not res!157314)) b!298220))

(assert (= (and b!298220 (not res!157313)) b!298221))

(declare-fun m!310293 () Bool)

(assert (=> b!298226 m!310293))

(assert (=> b!298226 m!310293))

(declare-fun m!310295 () Bool)

(assert (=> b!298226 m!310295))

(declare-fun m!310297 () Bool)

(assert (=> b!298220 m!310297))

(declare-fun m!310299 () Bool)

(assert (=> d!67157 m!310299))

(assert (=> d!67157 m!310247))

(assert (=> b!298221 m!310297))

(assert (=> b!298224 m!310297))

(assert (=> b!298161 d!67157))

(declare-fun b!298229 () Bool)

(declare-fun lt!148174 () SeekEntryResult!2294)

(assert (=> b!298229 (and (bvsge (index!11351 lt!148174) #b00000000000000000000000000000000) (bvslt (index!11351 lt!148174) (size!7499 a!3312)))))

(declare-fun res!157316 () Bool)

(assert (=> b!298229 (= res!157316 (= (select (arr!7146 a!3312) (index!11351 lt!148174)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188403 () Bool)

(assert (=> b!298229 (=> res!157316 e!188403)))

(declare-fun b!298230 () Bool)

(assert (=> b!298230 (and (bvsge (index!11351 lt!148174) #b00000000000000000000000000000000) (bvslt (index!11351 lt!148174) (size!7499 a!3312)))))

(assert (=> b!298230 (= e!188403 (= (select (arr!7146 a!3312) (index!11351 lt!148174)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67163 () Bool)

(declare-fun e!188405 () Bool)

(assert (=> d!67163 e!188405))

(declare-fun c!48043 () Bool)

(assert (=> d!67163 (= c!48043 (and ((_ is Intermediate!2294) lt!148174) (undefined!3106 lt!148174)))))

(declare-fun e!188406 () SeekEntryResult!2294)

(assert (=> d!67163 (= lt!148174 e!188406)))

(declare-fun c!48044 () Bool)

(assert (=> d!67163 (= c!48044 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148175 () (_ BitVec 64))

(assert (=> d!67163 (= lt!148175 (select (arr!7146 a!3312) lt!148133))))

(assert (=> d!67163 (validMask!0 mask!3809)))

(assert (=> d!67163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148133 k0!2524 a!3312 mask!3809) lt!148174)))

(declare-fun b!298231 () Bool)

(declare-fun e!188404 () SeekEntryResult!2294)

(assert (=> b!298231 (= e!188404 (Intermediate!2294 false lt!148133 #b00000000000000000000000000000000))))

(declare-fun b!298232 () Bool)

(assert (=> b!298232 (= e!188405 (bvsge (x!29591 lt!148174) #b01111111111111111111111111111110))))

(declare-fun b!298233 () Bool)

(assert (=> b!298233 (and (bvsge (index!11351 lt!148174) #b00000000000000000000000000000000) (bvslt (index!11351 lt!148174) (size!7499 a!3312)))))

(declare-fun res!157317 () Bool)

(assert (=> b!298233 (= res!157317 (= (select (arr!7146 a!3312) (index!11351 lt!148174)) k0!2524))))

(assert (=> b!298233 (=> res!157317 e!188403)))

(declare-fun e!188402 () Bool)

(assert (=> b!298233 (= e!188402 e!188403)))

(declare-fun b!298234 () Bool)

(assert (=> b!298234 (= e!188406 e!188404)))

(declare-fun c!48042 () Bool)

(assert (=> b!298234 (= c!48042 (or (= lt!148175 k0!2524) (= (bvadd lt!148175 lt!148175) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298235 () Bool)

(assert (=> b!298235 (= e!188404 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148133 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298236 () Bool)

(assert (=> b!298236 (= e!188405 e!188402)))

(declare-fun res!157318 () Bool)

(assert (=> b!298236 (= res!157318 (and ((_ is Intermediate!2294) lt!148174) (not (undefined!3106 lt!148174)) (bvslt (x!29591 lt!148174) #b01111111111111111111111111111110) (bvsge (x!29591 lt!148174) #b00000000000000000000000000000000) (bvsge (x!29591 lt!148174) #b00000000000000000000000000000000)))))

(assert (=> b!298236 (=> (not res!157318) (not e!188402))))

(declare-fun b!298237 () Bool)

(assert (=> b!298237 (= e!188406 (Intermediate!2294 true lt!148133 #b00000000000000000000000000000000))))

(assert (= (and d!67163 c!48044) b!298237))

(assert (= (and d!67163 (not c!48044)) b!298234))

(assert (= (and b!298234 c!48042) b!298231))

(assert (= (and b!298234 (not c!48042)) b!298235))

(assert (= (and d!67163 c!48043) b!298232))

(assert (= (and d!67163 (not c!48043)) b!298236))

(assert (= (and b!298236 res!157318) b!298233))

(assert (= (and b!298233 (not res!157317)) b!298229))

(assert (= (and b!298229 (not res!157316)) b!298230))

(assert (=> b!298235 m!310293))

(assert (=> b!298235 m!310293))

(declare-fun m!310301 () Bool)

(assert (=> b!298235 m!310301))

(declare-fun m!310303 () Bool)

(assert (=> b!298229 m!310303))

(declare-fun m!310305 () Bool)

(assert (=> d!67163 m!310305))

(assert (=> d!67163 m!310247))

(assert (=> b!298230 m!310303))

(assert (=> b!298233 m!310303))

(assert (=> b!298161 d!67163))

(declare-fun d!67165 () Bool)

(declare-fun lt!148190 () (_ BitVec 32))

(declare-fun lt!148189 () (_ BitVec 32))

(assert (=> d!67165 (= lt!148190 (bvmul (bvxor lt!148189 (bvlshr lt!148189 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67165 (= lt!148189 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67165 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157321 (let ((h!5275 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29595 (bvmul (bvxor h!5275 (bvlshr h!5275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29595 (bvlshr x!29595 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157321 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157321 #b00000000000000000000000000000000))))))

(assert (=> d!67165 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148190 (bvlshr lt!148190 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298161 d!67165))

(declare-fun d!67173 () Bool)

(declare-fun res!157336 () Bool)

(declare-fun e!188426 () Bool)

(assert (=> d!67173 (=> res!157336 e!188426)))

(assert (=> d!67173 (= res!157336 (= (select (arr!7146 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67173 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188426)))

(declare-fun b!298260 () Bool)

(declare-fun e!188427 () Bool)

(assert (=> b!298260 (= e!188426 e!188427)))

(declare-fun res!157337 () Bool)

(assert (=> b!298260 (=> (not res!157337) (not e!188427))))

(assert (=> b!298260 (= res!157337 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7499 a!3312)))))

(declare-fun b!298261 () Bool)

(assert (=> b!298261 (= e!188427 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67173 (not res!157336)) b!298260))

(assert (= (and b!298260 res!157337) b!298261))

(declare-fun m!310323 () Bool)

(assert (=> d!67173 m!310323))

(declare-fun m!310325 () Bool)

(assert (=> b!298261 m!310325))

(assert (=> b!298165 d!67173))

(declare-fun d!67177 () Bool)

(assert (=> d!67177 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29510 d!67177))

(declare-fun d!67179 () Bool)

(assert (=> d!67179 (= (array_inv!5118 a!3312) (bvsge (size!7499 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29510 d!67179))

(declare-fun b!298324 () Bool)

(declare-fun e!188464 () Bool)

(declare-fun call!25760 () Bool)

(assert (=> b!298324 (= e!188464 call!25760)))

(declare-fun b!298325 () Bool)

(declare-fun e!188465 () Bool)

(assert (=> b!298325 (= e!188465 call!25760)))

(declare-fun b!298326 () Bool)

(declare-fun e!188466 () Bool)

(assert (=> b!298326 (= e!188466 e!188465)))

(declare-fun c!48068 () Bool)

(assert (=> b!298326 (= c!48068 (validKeyInArray!0 (select (arr!7146 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298327 () Bool)

(assert (=> b!298327 (= e!188465 e!188464)))

(declare-fun lt!148210 () (_ BitVec 64))

(assert (=> b!298327 (= lt!148210 (select (arr!7146 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9265 0))(
  ( (Unit!9266) )
))
(declare-fun lt!148211 () Unit!9265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15085 (_ BitVec 64) (_ BitVec 32)) Unit!9265)

(assert (=> b!298327 (= lt!148211 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148210 #b00000000000000000000000000000000))))

(assert (=> b!298327 (arrayContainsKey!0 a!3312 lt!148210 #b00000000000000000000000000000000)))

(declare-fun lt!148209 () Unit!9265)

(assert (=> b!298327 (= lt!148209 lt!148211)))

(declare-fun res!157361 () Bool)

(assert (=> b!298327 (= res!157361 (= (seekEntryOrOpen!0 (select (arr!7146 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2294 #b00000000000000000000000000000000)))))

(assert (=> b!298327 (=> (not res!157361) (not e!188464))))

(declare-fun bm!25757 () Bool)

(assert (=> bm!25757 (= call!25760 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67181 () Bool)

(declare-fun res!157360 () Bool)

(assert (=> d!67181 (=> res!157360 e!188466)))

(assert (=> d!67181 (= res!157360 (bvsge #b00000000000000000000000000000000 (size!7499 a!3312)))))

(assert (=> d!67181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188466)))

(assert (= (and d!67181 (not res!157360)) b!298326))

(assert (= (and b!298326 c!48068) b!298327))

(assert (= (and b!298326 (not c!48068)) b!298325))

(assert (= (and b!298327 res!157361) b!298324))

(assert (= (or b!298324 b!298325) bm!25757))

(assert (=> b!298326 m!310323))

(assert (=> b!298326 m!310323))

(declare-fun m!310341 () Bool)

(assert (=> b!298326 m!310341))

(assert (=> b!298327 m!310323))

(declare-fun m!310343 () Bool)

(assert (=> b!298327 m!310343))

(declare-fun m!310345 () Bool)

(assert (=> b!298327 m!310345))

(assert (=> b!298327 m!310323))

(declare-fun m!310347 () Bool)

(assert (=> b!298327 m!310347))

(declare-fun m!310349 () Bool)

(assert (=> bm!25757 m!310349))

(assert (=> b!298164 d!67181))

(declare-fun d!67187 () Bool)

(assert (=> d!67187 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298162 d!67187))

(declare-fun b!298382 () Bool)

(declare-fun e!188498 () SeekEntryResult!2294)

(assert (=> b!298382 (= e!188498 Undefined!2294)))

(declare-fun d!67191 () Bool)

(declare-fun lt!148250 () SeekEntryResult!2294)

(assert (=> d!67191 (and (or ((_ is Undefined!2294) lt!148250) (not ((_ is Found!2294) lt!148250)) (and (bvsge (index!11350 lt!148250) #b00000000000000000000000000000000) (bvslt (index!11350 lt!148250) (size!7499 a!3312)))) (or ((_ is Undefined!2294) lt!148250) ((_ is Found!2294) lt!148250) (not ((_ is MissingZero!2294) lt!148250)) (and (bvsge (index!11349 lt!148250) #b00000000000000000000000000000000) (bvslt (index!11349 lt!148250) (size!7499 a!3312)))) (or ((_ is Undefined!2294) lt!148250) ((_ is Found!2294) lt!148250) ((_ is MissingZero!2294) lt!148250) (not ((_ is MissingVacant!2294) lt!148250)) (and (bvsge (index!11352 lt!148250) #b00000000000000000000000000000000) (bvslt (index!11352 lt!148250) (size!7499 a!3312)))) (or ((_ is Undefined!2294) lt!148250) (ite ((_ is Found!2294) lt!148250) (= (select (arr!7146 a!3312) (index!11350 lt!148250)) k0!2524) (ite ((_ is MissingZero!2294) lt!148250) (= (select (arr!7146 a!3312) (index!11349 lt!148250)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2294) lt!148250) (= (select (arr!7146 a!3312) (index!11352 lt!148250)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67191 (= lt!148250 e!188498)))

(declare-fun c!48092 () Bool)

(declare-fun lt!148249 () SeekEntryResult!2294)

(assert (=> d!67191 (= c!48092 (and ((_ is Intermediate!2294) lt!148249) (undefined!3106 lt!148249)))))

(assert (=> d!67191 (= lt!148249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67191 (validMask!0 mask!3809)))

(assert (=> d!67191 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148250)))

(declare-fun b!298383 () Bool)

(declare-fun e!188500 () SeekEntryResult!2294)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15085 (_ BitVec 32)) SeekEntryResult!2294)

(assert (=> b!298383 (= e!188500 (seekKeyOrZeroReturnVacant!0 (x!29591 lt!148249) (index!11351 lt!148249) (index!11351 lt!148249) k0!2524 a!3312 mask!3809))))

(declare-fun b!298384 () Bool)

(declare-fun e!188499 () SeekEntryResult!2294)

(assert (=> b!298384 (= e!188499 (Found!2294 (index!11351 lt!148249)))))

(declare-fun b!298385 () Bool)

(assert (=> b!298385 (= e!188498 e!188499)))

(declare-fun lt!148251 () (_ BitVec 64))

(assert (=> b!298385 (= lt!148251 (select (arr!7146 a!3312) (index!11351 lt!148249)))))

(declare-fun c!48091 () Bool)

(assert (=> b!298385 (= c!48091 (= lt!148251 k0!2524))))

(declare-fun b!298386 () Bool)

(declare-fun c!48090 () Bool)

(assert (=> b!298386 (= c!48090 (= lt!148251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298386 (= e!188499 e!188500)))

(declare-fun b!298387 () Bool)

(assert (=> b!298387 (= e!188500 (MissingZero!2294 (index!11351 lt!148249)))))

(assert (= (and d!67191 c!48092) b!298382))

(assert (= (and d!67191 (not c!48092)) b!298385))

(assert (= (and b!298385 c!48091) b!298384))

(assert (= (and b!298385 (not c!48091)) b!298386))

(assert (= (and b!298386 c!48090) b!298387))

(assert (= (and b!298386 (not c!48090)) b!298383))

(assert (=> d!67191 m!310245))

(declare-fun m!310375 () Bool)

(assert (=> d!67191 m!310375))

(declare-fun m!310377 () Bool)

(assert (=> d!67191 m!310377))

(declare-fun m!310379 () Bool)

(assert (=> d!67191 m!310379))

(assert (=> d!67191 m!310245))

(declare-fun m!310381 () Bool)

(assert (=> d!67191 m!310381))

(assert (=> d!67191 m!310247))

(declare-fun m!310383 () Bool)

(assert (=> b!298383 m!310383))

(declare-fun m!310385 () Bool)

(assert (=> b!298385 m!310385))

(assert (=> b!298163 d!67191))

(check-sat (not d!67191) (not bm!25757) (not b!298327) (not b!298326) (not b!298235) (not b!298261) (not d!67163) (not b!298226) (not d!67157) (not b!298383))
(check-sat)
