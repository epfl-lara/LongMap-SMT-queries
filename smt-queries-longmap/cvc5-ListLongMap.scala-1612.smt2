; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30344 () Bool)

(assert start!30344)

(declare-fun b!303947 () Bool)

(declare-fun e!191119 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150290 () (_ BitVec 32))

(assert (=> b!303947 (= e!191119 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!150290 #b00000000000000000000000000000000) (bvsge lt!150290 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303947 (= lt!150290 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303948 () Bool)

(declare-fun res!161440 () Bool)

(declare-fun e!191117 () Bool)

(assert (=> b!303948 (=> (not res!161440) (not e!191117))))

(declare-datatypes ((array!15450 0))(
  ( (array!15451 (arr!7313 (Array (_ BitVec 32) (_ BitVec 64))) (size!7665 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15450)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303948 (= res!161440 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!161439 () Bool)

(assert (=> start!30344 (=> (not res!161439) (not e!191117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30344 (= res!161439 (validMask!0 mask!3709))))

(assert (=> start!30344 e!191117))

(declare-fun array_inv!5276 (array!15450) Bool)

(assert (=> start!30344 (array_inv!5276 a!3293)))

(assert (=> start!30344 true))

(declare-fun b!303949 () Bool)

(declare-fun res!161441 () Bool)

(assert (=> b!303949 (=> (not res!161441) (not e!191119))))

(declare-datatypes ((SeekEntryResult!2453 0))(
  ( (MissingZero!2453 (index!11988 (_ BitVec 32))) (Found!2453 (index!11989 (_ BitVec 32))) (Intermediate!2453 (undefined!3265 Bool) (index!11990 (_ BitVec 32)) (x!30246 (_ BitVec 32))) (Undefined!2453) (MissingVacant!2453 (index!11991 (_ BitVec 32))) )
))
(declare-fun lt!150291 () SeekEntryResult!2453)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15450 (_ BitVec 32)) SeekEntryResult!2453)

(assert (=> b!303949 (= res!161441 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150291))))

(declare-fun b!303950 () Bool)

(declare-fun res!161434 () Bool)

(assert (=> b!303950 (=> (not res!161434) (not e!191119))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303950 (= res!161434 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7313 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7313 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7313 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303951 () Bool)

(declare-fun res!161438 () Bool)

(assert (=> b!303951 (=> (not res!161438) (not e!191117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15450 (_ BitVec 32)) Bool)

(assert (=> b!303951 (= res!161438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303952 () Bool)

(declare-fun res!161433 () Bool)

(assert (=> b!303952 (=> (not res!161433) (not e!191117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303952 (= res!161433 (validKeyInArray!0 k!2441))))

(declare-fun b!303953 () Bool)

(declare-fun res!161435 () Bool)

(assert (=> b!303953 (=> (not res!161435) (not e!191117))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15450 (_ BitVec 32)) SeekEntryResult!2453)

(assert (=> b!303953 (= res!161435 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2453 i!1240)))))

(declare-fun b!303954 () Bool)

(declare-fun res!161437 () Bool)

(assert (=> b!303954 (=> (not res!161437) (not e!191119))))

(assert (=> b!303954 (= res!161437 (and (= (select (arr!7313 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7665 a!3293))))))

(declare-fun b!303955 () Bool)

(declare-fun res!161442 () Bool)

(assert (=> b!303955 (=> (not res!161442) (not e!191117))))

(assert (=> b!303955 (= res!161442 (and (= (size!7665 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7665 a!3293))))))

(declare-fun b!303956 () Bool)

(assert (=> b!303956 (= e!191117 e!191119)))

(declare-fun res!161436 () Bool)

(assert (=> b!303956 (=> (not res!161436) (not e!191119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303956 (= res!161436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150291))))

(assert (=> b!303956 (= lt!150291 (Intermediate!2453 false resIndex!52 resX!52))))

(assert (= (and start!30344 res!161439) b!303955))

(assert (= (and b!303955 res!161442) b!303952))

(assert (= (and b!303952 res!161433) b!303948))

(assert (= (and b!303948 res!161440) b!303953))

(assert (= (and b!303953 res!161435) b!303951))

(assert (= (and b!303951 res!161438) b!303956))

(assert (= (and b!303956 res!161436) b!303954))

(assert (= (and b!303954 res!161437) b!303949))

(assert (= (and b!303949 res!161441) b!303950))

(assert (= (and b!303950 res!161434) b!303947))

(declare-fun m!315197 () Bool)

(assert (=> b!303952 m!315197))

(declare-fun m!315199 () Bool)

(assert (=> b!303953 m!315199))

(declare-fun m!315201 () Bool)

(assert (=> b!303956 m!315201))

(assert (=> b!303956 m!315201))

(declare-fun m!315203 () Bool)

(assert (=> b!303956 m!315203))

(declare-fun m!315205 () Bool)

(assert (=> b!303947 m!315205))

(declare-fun m!315207 () Bool)

(assert (=> b!303949 m!315207))

(declare-fun m!315209 () Bool)

(assert (=> b!303951 m!315209))

(declare-fun m!315211 () Bool)

(assert (=> start!30344 m!315211))

(declare-fun m!315213 () Bool)

(assert (=> start!30344 m!315213))

(declare-fun m!315215 () Bool)

(assert (=> b!303950 m!315215))

(declare-fun m!315217 () Bool)

(assert (=> b!303954 m!315217))

(declare-fun m!315219 () Bool)

(assert (=> b!303948 m!315219))

(push 1)

(assert (not b!303947))

(assert (not b!303952))

(assert (not b!303956))

(assert (not b!303949))

(assert (not start!30344))

(assert (not b!303953))

(assert (not b!303951))

(assert (not b!303948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68057 () Bool)

(assert (=> d!68057 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!303952 d!68057))

(declare-fun d!68059 () Bool)

(declare-fun lt!150310 () (_ BitVec 32))

(assert (=> d!68059 (and (bvsge lt!150310 #b00000000000000000000000000000000) (bvslt lt!150310 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68059 (= lt!150310 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68059 (validMask!0 mask!3709)))

(assert (=> d!68059 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150310)))

(declare-fun bs!10709 () Bool)

(assert (= bs!10709 d!68059))

(declare-fun m!315273 () Bool)

(assert (=> bs!10709 m!315273))

(assert (=> bs!10709 m!315211))

(assert (=> b!303947 d!68059))

(declare-fun d!68063 () Bool)

(assert (=> d!68063 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30344 d!68063))

(declare-fun d!68073 () Bool)

(assert (=> d!68073 (= (array_inv!5276 a!3293) (bvsge (size!7665 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30344 d!68073))

(declare-fun b!304137 () Bool)

(declare-fun lt!150356 () SeekEntryResult!2453)

(assert (=> b!304137 (and (bvsge (index!11990 lt!150356) #b00000000000000000000000000000000) (bvslt (index!11990 lt!150356) (size!7665 a!3293)))))

(declare-fun res!161553 () Bool)

(assert (=> b!304137 (= res!161553 (= (select (arr!7313 a!3293) (index!11990 lt!150356)) k!2441))))

(declare-fun e!191216 () Bool)

(assert (=> b!304137 (=> res!161553 e!191216)))

(declare-fun e!191218 () Bool)

(assert (=> b!304137 (= e!191218 e!191216)))

(declare-fun b!304138 () Bool)

(assert (=> b!304138 (and (bvsge (index!11990 lt!150356) #b00000000000000000000000000000000) (bvslt (index!11990 lt!150356) (size!7665 a!3293)))))

(declare-fun res!161555 () Bool)

(assert (=> b!304138 (= res!161555 (= (select (arr!7313 a!3293) (index!11990 lt!150356)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304138 (=> res!161555 e!191216)))

(declare-fun b!304139 () Bool)

(assert (=> b!304139 (and (bvsge (index!11990 lt!150356) #b00000000000000000000000000000000) (bvslt (index!11990 lt!150356) (size!7665 a!3293)))))

(assert (=> b!304139 (= e!191216 (= (select (arr!7313 a!3293) (index!11990 lt!150356)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68075 () Bool)

(declare-fun e!191217 () Bool)

(assert (=> d!68075 e!191217))

(declare-fun c!48894 () Bool)

(assert (=> d!68075 (= c!48894 (and (is-Intermediate!2453 lt!150356) (undefined!3265 lt!150356)))))

(declare-fun e!191214 () SeekEntryResult!2453)

(assert (=> d!68075 (= lt!150356 e!191214)))

(declare-fun c!48892 () Bool)

(assert (=> d!68075 (= c!48892 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150357 () (_ BitVec 64))

(assert (=> d!68075 (= lt!150357 (select (arr!7313 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68075 (validMask!0 mask!3709)))

(assert (=> d!68075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150356)))

(declare-fun b!304140 () Bool)

(assert (=> b!304140 (= e!191214 (Intermediate!2453 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304141 () Bool)

(declare-fun e!191215 () SeekEntryResult!2453)

(assert (=> b!304141 (= e!191215 (Intermediate!2453 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304142 () Bool)

(assert (=> b!304142 (= e!191214 e!191215)))

(declare-fun c!48893 () Bool)

(assert (=> b!304142 (= c!48893 (or (= lt!150357 k!2441) (= (bvadd lt!150357 lt!150357) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304143 () Bool)

(assert (=> b!304143 (= e!191217 (bvsge (x!30246 lt!150356) #b01111111111111111111111111111110))))

(declare-fun b!304144 () Bool)

(assert (=> b!304144 (= e!191215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304145 () Bool)

(assert (=> b!304145 (= e!191217 e!191218)))

(declare-fun res!161554 () Bool)

(assert (=> b!304145 (= res!161554 (and (is-Intermediate!2453 lt!150356) (not (undefined!3265 lt!150356)) (bvslt (x!30246 lt!150356) #b01111111111111111111111111111110) (bvsge (x!30246 lt!150356) #b00000000000000000000000000000000) (bvsge (x!30246 lt!150356) #b00000000000000000000000000000000)))))

(assert (=> b!304145 (=> (not res!161554) (not e!191218))))

(assert (= (and d!68075 c!48892) b!304140))

(assert (= (and d!68075 (not c!48892)) b!304142))

(assert (= (and b!304142 c!48893) b!304141))

(assert (= (and b!304142 (not c!48893)) b!304144))

(assert (= (and d!68075 c!48894) b!304143))

(assert (= (and d!68075 (not c!48894)) b!304145))

(assert (= (and b!304145 res!161554) b!304137))

(assert (= (and b!304137 (not res!161553)) b!304138))

(assert (= (and b!304138 (not res!161555)) b!304139))

(declare-fun m!315317 () Bool)

(assert (=> b!304139 m!315317))

(assert (=> b!304144 m!315201))

(declare-fun m!315319 () Bool)

(assert (=> b!304144 m!315319))

(assert (=> b!304144 m!315319))

(declare-fun m!315321 () Bool)

(assert (=> b!304144 m!315321))

(assert (=> b!304137 m!315317))

(assert (=> d!68075 m!315201))

(declare-fun m!315323 () Bool)

(assert (=> d!68075 m!315323))

(assert (=> d!68075 m!315211))

(assert (=> b!304138 m!315317))

(assert (=> b!303956 d!68075))

(declare-fun d!68087 () Bool)

(declare-fun lt!150374 () (_ BitVec 32))

(declare-fun lt!150373 () (_ BitVec 32))

(assert (=> d!68087 (= lt!150374 (bvmul (bvxor lt!150373 (bvlshr lt!150373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68087 (= lt!150373 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68087 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!161556 (let ((h!5336 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30256 (bvmul (bvxor h!5336 (bvlshr h!5336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30256 (bvlshr x!30256 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!161556 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!161556 #b00000000000000000000000000000000))))))

(assert (=> d!68087 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!150374 (bvlshr lt!150374 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!303956 d!68087))

(declare-fun b!304169 () Bool)

(declare-fun e!191234 () Bool)

(declare-fun e!191235 () Bool)

(assert (=> b!304169 (= e!191234 e!191235)))

(declare-fun c!48903 () Bool)

(assert (=> b!304169 (= c!48903 (validKeyInArray!0 (select (arr!7313 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68093 () Bool)

(declare-fun res!161564 () Bool)

(assert (=> d!68093 (=> res!161564 e!191234)))

(assert (=> d!68093 (= res!161564 (bvsge #b00000000000000000000000000000000 (size!7665 a!3293)))))

(assert (=> d!68093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191234)))

(declare-fun bm!25897 () Bool)

(declare-fun call!25900 () Bool)

(assert (=> bm!25897 (= call!25900 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!304170 () Bool)

(declare-fun e!191233 () Bool)

(assert (=> b!304170 (= e!191233 call!25900)))

(declare-fun b!304171 () Bool)

(assert (=> b!304171 (= e!191235 call!25900)))

(declare-fun b!304172 () Bool)

(assert (=> b!304172 (= e!191235 e!191233)))

(declare-fun lt!150383 () (_ BitVec 64))

(assert (=> b!304172 (= lt!150383 (select (arr!7313 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9393 0))(
  ( (Unit!9394) )
))
(declare-fun lt!150382 () Unit!9393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15450 (_ BitVec 64) (_ BitVec 32)) Unit!9393)

(assert (=> b!304172 (= lt!150382 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150383 #b00000000000000000000000000000000))))

(assert (=> b!304172 (arrayContainsKey!0 a!3293 lt!150383 #b00000000000000000000000000000000)))

(declare-fun lt!150381 () Unit!9393)

(assert (=> b!304172 (= lt!150381 lt!150382)))

(declare-fun res!161565 () Bool)

(assert (=> b!304172 (= res!161565 (= (seekEntryOrOpen!0 (select (arr!7313 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2453 #b00000000000000000000000000000000)))))

(assert (=> b!304172 (=> (not res!161565) (not e!191233))))

(assert (= (and d!68093 (not res!161564)) b!304169))

(assert (= (and b!304169 c!48903) b!304172))

(assert (= (and b!304169 (not c!48903)) b!304171))

(assert (= (and b!304172 res!161565) b!304170))

(assert (= (or b!304170 b!304171) bm!25897))

(declare-fun m!315339 () Bool)

(assert (=> b!304169 m!315339))

(assert (=> b!304169 m!315339))

(declare-fun m!315341 () Bool)

(assert (=> b!304169 m!315341))

(declare-fun m!315343 () Bool)

(assert (=> bm!25897 m!315343))

(assert (=> b!304172 m!315339))

(declare-fun m!315345 () Bool)

(assert (=> b!304172 m!315345))

(declare-fun m!315347 () Bool)

(assert (=> b!304172 m!315347))

(assert (=> b!304172 m!315339))

(declare-fun m!315349 () Bool)

(assert (=> b!304172 m!315349))

(assert (=> b!303951 d!68093))

(declare-fun b!304173 () Bool)

(declare-fun lt!150384 () SeekEntryResult!2453)

(assert (=> b!304173 (and (bvsge (index!11990 lt!150384) #b00000000000000000000000000000000) (bvslt (index!11990 lt!150384) (size!7665 a!3293)))))

(declare-fun res!161566 () Bool)

(assert (=> b!304173 (= res!161566 (= (select (arr!7313 a!3293) (index!11990 lt!150384)) k!2441))))

(declare-fun e!191238 () Bool)

(assert (=> b!304173 (=> res!161566 e!191238)))

(declare-fun e!191240 () Bool)

(assert (=> b!304173 (= e!191240 e!191238)))

(declare-fun b!304174 () Bool)

(assert (=> b!304174 (and (bvsge (index!11990 lt!150384) #b00000000000000000000000000000000) (bvslt (index!11990 lt!150384) (size!7665 a!3293)))))

(declare-fun res!161568 () Bool)

(assert (=> b!304174 (= res!161568 (= (select (arr!7313 a!3293) (index!11990 lt!150384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304174 (=> res!161568 e!191238)))

(declare-fun b!304175 () Bool)

(assert (=> b!304175 (and (bvsge (index!11990 lt!150384) #b00000000000000000000000000000000) (bvslt (index!11990 lt!150384) (size!7665 a!3293)))))

(assert (=> b!304175 (= e!191238 (= (select (arr!7313 a!3293) (index!11990 lt!150384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68099 () Bool)

(declare-fun e!191239 () Bool)

(assert (=> d!68099 e!191239))

(declare-fun c!48906 () Bool)

(assert (=> d!68099 (= c!48906 (and (is-Intermediate!2453 lt!150384) (undefined!3265 lt!150384)))))

(declare-fun e!191236 () SeekEntryResult!2453)

(assert (=> d!68099 (= lt!150384 e!191236)))

(declare-fun c!48904 () Bool)

(assert (=> d!68099 (= c!48904 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!150385 () (_ BitVec 64))

(assert (=> d!68099 (= lt!150385 (select (arr!7313 a!3293) index!1781))))

(assert (=> d!68099 (validMask!0 mask!3709)))

(assert (=> d!68099 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150384)))

(declare-fun b!304176 () Bool)

(assert (=> b!304176 (= e!191236 (Intermediate!2453 true index!1781 x!1427))))

(declare-fun b!304177 () Bool)

(declare-fun e!191237 () SeekEntryResult!2453)

(assert (=> b!304177 (= e!191237 (Intermediate!2453 false index!1781 x!1427))))

(declare-fun b!304178 () Bool)

(assert (=> b!304178 (= e!191236 e!191237)))

(declare-fun c!48905 () Bool)

(assert (=> b!304178 (= c!48905 (or (= lt!150385 k!2441) (= (bvadd lt!150385 lt!150385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304179 () Bool)

(assert (=> b!304179 (= e!191239 (bvsge (x!30246 lt!150384) #b01111111111111111111111111111110))))

(declare-fun b!304180 () Bool)

(assert (=> b!304180 (= e!191237 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304181 () Bool)

(assert (=> b!304181 (= e!191239 e!191240)))

(declare-fun res!161567 () Bool)

(assert (=> b!304181 (= res!161567 (and (is-Intermediate!2453 lt!150384) (not (undefined!3265 lt!150384)) (bvslt (x!30246 lt!150384) #b01111111111111111111111111111110) (bvsge (x!30246 lt!150384) #b00000000000000000000000000000000) (bvsge (x!30246 lt!150384) x!1427)))))

(assert (=> b!304181 (=> (not res!161567) (not e!191240))))

(assert (= (and d!68099 c!48904) b!304176))

(assert (= (and d!68099 (not c!48904)) b!304178))

(assert (= (and b!304178 c!48905) b!304177))

(assert (= (and b!304178 (not c!48905)) b!304180))

(assert (= (and d!68099 c!48906) b!304179))

(assert (= (and d!68099 (not c!48906)) b!304181))

(assert (= (and b!304181 res!161567) b!304173))

(assert (= (and b!304173 (not res!161566)) b!304174))

(assert (= (and b!304174 (not res!161568)) b!304175))

(declare-fun m!315351 () Bool)

(assert (=> b!304175 m!315351))

(assert (=> b!304180 m!315205))

(assert (=> b!304180 m!315205))

(declare-fun m!315353 () Bool)

(assert (=> b!304180 m!315353))

(assert (=> b!304173 m!315351))

(assert (=> d!68099 m!315215))

(assert (=> d!68099 m!315211))

(assert (=> b!304174 m!315351))

(assert (=> b!303949 d!68099))

(declare-fun e!191254 () SeekEntryResult!2453)

(declare-fun lt!150401 () SeekEntryResult!2453)

(declare-fun b!304206 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15450 (_ BitVec 32)) SeekEntryResult!2453)

(assert (=> b!304206 (= e!191254 (seekKeyOrZeroReturnVacant!0 (x!30246 lt!150401) (index!11990 lt!150401) (index!11990 lt!150401) k!2441 a!3293 mask!3709))))

(declare-fun b!304207 () Bool)

(declare-fun e!191255 () SeekEntryResult!2453)

(assert (=> b!304207 (= e!191255 Undefined!2453)))

(declare-fun b!304208 () Bool)

(declare-fun e!191253 () SeekEntryResult!2453)

(assert (=> b!304208 (= e!191253 (Found!2453 (index!11990 lt!150401)))))

(declare-fun b!304209 () Bool)

(declare-fun c!48921 () Bool)

(declare-fun lt!150403 () (_ BitVec 64))

(assert (=> b!304209 (= c!48921 (= lt!150403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304209 (= e!191253 e!191254)))

(declare-fun d!68101 () Bool)

(declare-fun lt!150402 () SeekEntryResult!2453)

(assert (=> d!68101 (and (or (is-Undefined!2453 lt!150402) (not (is-Found!2453 lt!150402)) (and (bvsge (index!11989 lt!150402) #b00000000000000000000000000000000) (bvslt (index!11989 lt!150402) (size!7665 a!3293)))) (or (is-Undefined!2453 lt!150402) (is-Found!2453 lt!150402) (not (is-MissingZero!2453 lt!150402)) (and (bvsge (index!11988 lt!150402) #b00000000000000000000000000000000) (bvslt (index!11988 lt!150402) (size!7665 a!3293)))) (or (is-Undefined!2453 lt!150402) (is-Found!2453 lt!150402) (is-MissingZero!2453 lt!150402) (not (is-MissingVacant!2453 lt!150402)) (and (bvsge (index!11991 lt!150402) #b00000000000000000000000000000000) (bvslt (index!11991 lt!150402) (size!7665 a!3293)))) (or (is-Undefined!2453 lt!150402) (ite (is-Found!2453 lt!150402) (= (select (arr!7313 a!3293) (index!11989 lt!150402)) k!2441) (ite (is-MissingZero!2453 lt!150402) (= (select (arr!7313 a!3293) (index!11988 lt!150402)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2453 lt!150402) (= (select (arr!7313 a!3293) (index!11991 lt!150402)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68101 (= lt!150402 e!191255)))

(declare-fun c!48919 () Bool)

(assert (=> d!68101 (= c!48919 (and (is-Intermediate!2453 lt!150401) (undefined!3265 lt!150401)))))

(assert (=> d!68101 (= lt!150401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68101 (validMask!0 mask!3709)))

(assert (=> d!68101 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!150402)))

(declare-fun b!304210 () Bool)

(assert (=> b!304210 (= e!191254 (MissingZero!2453 (index!11990 lt!150401)))))

(declare-fun b!304211 () Bool)

(assert (=> b!304211 (= e!191255 e!191253)))

(assert (=> b!304211 (= lt!150403 (select (arr!7313 a!3293) (index!11990 lt!150401)))))

(declare-fun c!48920 () Bool)

(assert (=> b!304211 (= c!48920 (= lt!150403 k!2441))))

(assert (= (and d!68101 c!48919) b!304207))

(assert (= (and d!68101 (not c!48919)) b!304211))

(assert (= (and b!304211 c!48920) b!304208))

(assert (= (and b!304211 (not c!48920)) b!304209))

(assert (= (and b!304209 c!48921) b!304210))

(assert (= (and b!304209 (not c!48921)) b!304206))

(declare-fun m!315357 () Bool)

(assert (=> b!304206 m!315357))

(assert (=> d!68101 m!315211))

(declare-fun m!315359 () Bool)

(assert (=> d!68101 m!315359))

(assert (=> d!68101 m!315201))

(assert (=> d!68101 m!315203))

(assert (=> d!68101 m!315201))

(declare-fun m!315367 () Bool)

(assert (=> d!68101 m!315367))

(declare-fun m!315369 () Bool)

(assert (=> d!68101 m!315369))

(declare-fun m!315371 () Bool)

(assert (=> b!304211 m!315371))

(assert (=> b!303953 d!68101))

(declare-fun d!68105 () Bool)

(declare-fun res!161576 () Bool)

(declare-fun e!191268 () Bool)

(assert (=> d!68105 (=> res!161576 e!191268)))

(assert (=> d!68105 (= res!161576 (= (select (arr!7313 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68105 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!191268)))

(declare-fun b!304231 () Bool)

(declare-fun e!191269 () Bool)

(assert (=> b!304231 (= e!191268 e!191269)))

(declare-fun res!161577 () Bool)

(assert (=> b!304231 (=> (not res!161577) (not e!191269))))

(assert (=> b!304231 (= res!161577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7665 a!3293)))))

(declare-fun b!304232 () Bool)

(assert (=> b!304232 (= e!191269 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68105 (not res!161576)) b!304231))

(assert (= (and b!304231 res!161577) b!304232))

(assert (=> d!68105 m!315339))

(declare-fun m!315381 () Bool)

(assert (=> b!304232 m!315381))

(assert (=> b!303948 d!68105))

(push 1)

(assert (not d!68075))

(assert (not d!68101))

(assert (not b!304144))

(assert (not b!304172))

(assert (not d!68099))

(assert (not b!304169))

(assert (not d!68059))

(assert (not bm!25897))

(assert (not b!304180))

(assert (not b!304232))

(assert (not b!304206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

