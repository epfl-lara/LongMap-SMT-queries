; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28114 () Bool)

(assert start!28114)

(declare-fun b!288085 () Bool)

(declare-fun e!182410 () Bool)

(declare-fun e!182408 () Bool)

(assert (=> b!288085 (= e!182410 e!182408)))

(declare-fun res!149854 () Bool)

(assert (=> b!288085 (=> (not res!149854) (not e!182408))))

(declare-fun lt!141881 () Bool)

(assert (=> b!288085 (= res!149854 lt!141881)))

(declare-datatypes ((SeekEntryResult!2014 0))(
  ( (MissingZero!2014 (index!10226 (_ BitVec 32))) (Found!2014 (index!10227 (_ BitVec 32))) (Intermediate!2014 (undefined!2826 Bool) (index!10228 (_ BitVec 32)) (x!28437 (_ BitVec 32))) (Undefined!2014) (MissingVacant!2014 (index!10229 (_ BitVec 32))) )
))
(declare-fun lt!141883 () SeekEntryResult!2014)

(declare-datatypes ((array!14473 0))(
  ( (array!14474 (arr!6865 (Array (_ BitVec 32) (_ BitVec 64))) (size!7217 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14473)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!141882 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14473 (_ BitVec 32)) SeekEntryResult!2014)

(assert (=> b!288085 (= lt!141883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141882 k!2524 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312)) mask!3809))))

(declare-fun lt!141884 () SeekEntryResult!2014)

(assert (=> b!288085 (= lt!141884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141882 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288085 (= lt!141882 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288086 () Bool)

(declare-fun res!149855 () Bool)

(assert (=> b!288086 (=> (not res!149855) (not e!182410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14473 (_ BitVec 32)) Bool)

(assert (=> b!288086 (= res!149855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288087 () Bool)

(declare-fun e!182409 () Bool)

(assert (=> b!288087 (= e!182408 e!182409)))

(declare-fun res!149850 () Bool)

(assert (=> b!288087 (=> (not res!149850) (not e!182409))))

(declare-fun lt!141886 () Bool)

(assert (=> b!288087 (= res!149850 (and (or lt!141886 (not (undefined!2826 lt!141884))) (or lt!141886 (not (= (select (arr!6865 a!3312) (index!10228 lt!141884)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141886 (not (= (select (arr!6865 a!3312) (index!10228 lt!141884)) k!2524))) (not lt!141886)))))

(assert (=> b!288087 (= lt!141886 (not (is-Intermediate!2014 lt!141884)))))

(declare-fun b!288088 () Bool)

(assert (=> b!288088 (= e!182409 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(assert (=> b!288088 (and (= (select (arr!6865 a!3312) (index!10228 lt!141884)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10228 lt!141884) i!1256))))

(declare-fun b!288089 () Bool)

(declare-fun e!182407 () Bool)

(assert (=> b!288089 (= e!182407 e!182410)))

(declare-fun res!149852 () Bool)

(assert (=> b!288089 (=> (not res!149852) (not e!182410))))

(declare-fun lt!141885 () SeekEntryResult!2014)

(assert (=> b!288089 (= res!149852 (or lt!141881 (= lt!141885 (MissingVacant!2014 i!1256))))))

(assert (=> b!288089 (= lt!141881 (= lt!141885 (MissingZero!2014 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14473 (_ BitVec 32)) SeekEntryResult!2014)

(assert (=> b!288089 (= lt!141885 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!149856 () Bool)

(assert (=> start!28114 (=> (not res!149856) (not e!182407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28114 (= res!149856 (validMask!0 mask!3809))))

(assert (=> start!28114 e!182407))

(assert (=> start!28114 true))

(declare-fun array_inv!4828 (array!14473) Bool)

(assert (=> start!28114 (array_inv!4828 a!3312)))

(declare-fun b!288090 () Bool)

(declare-fun res!149849 () Bool)

(assert (=> b!288090 (=> (not res!149849) (not e!182407))))

(declare-fun arrayContainsKey!0 (array!14473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288090 (= res!149849 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288091 () Bool)

(declare-fun res!149851 () Bool)

(assert (=> b!288091 (=> (not res!149851) (not e!182407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288091 (= res!149851 (validKeyInArray!0 k!2524))))

(declare-fun b!288092 () Bool)

(declare-fun res!149853 () Bool)

(assert (=> b!288092 (=> (not res!149853) (not e!182407))))

(assert (=> b!288092 (= res!149853 (and (= (size!7217 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7217 a!3312))))))

(assert (= (and start!28114 res!149856) b!288092))

(assert (= (and b!288092 res!149853) b!288091))

(assert (= (and b!288091 res!149851) b!288090))

(assert (= (and b!288090 res!149849) b!288089))

(assert (= (and b!288089 res!149852) b!288086))

(assert (= (and b!288086 res!149855) b!288085))

(assert (= (and b!288085 res!149854) b!288087))

(assert (= (and b!288087 res!149850) b!288088))

(declare-fun m!302423 () Bool)

(assert (=> b!288090 m!302423))

(declare-fun m!302425 () Bool)

(assert (=> b!288087 m!302425))

(assert (=> b!288088 m!302425))

(declare-fun m!302427 () Bool)

(assert (=> start!28114 m!302427))

(declare-fun m!302429 () Bool)

(assert (=> start!28114 m!302429))

(declare-fun m!302431 () Bool)

(assert (=> b!288086 m!302431))

(declare-fun m!302433 () Bool)

(assert (=> b!288091 m!302433))

(declare-fun m!302435 () Bool)

(assert (=> b!288085 m!302435))

(declare-fun m!302437 () Bool)

(assert (=> b!288085 m!302437))

(declare-fun m!302439 () Bool)

(assert (=> b!288085 m!302439))

(declare-fun m!302441 () Bool)

(assert (=> b!288085 m!302441))

(declare-fun m!302443 () Bool)

(assert (=> b!288089 m!302443))

(push 1)

(assert (not b!288086))

(assert (not start!28114))

(assert (not b!288085))

(assert (not b!288091))

(assert (not b!288089))

(assert (not b!288090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!288201 () Bool)

(declare-fun lt!141928 () SeekEntryResult!2014)

(assert (=> b!288201 (and (bvsge (index!10228 lt!141928) #b00000000000000000000000000000000) (bvslt (index!10228 lt!141928) (size!7217 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312)))))))

(declare-fun res!149903 () Bool)

(assert (=> b!288201 (= res!149903 (= (select (arr!6865 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312))) (index!10228 lt!141928)) k!2524))))

(declare-fun e!182480 () Bool)

(assert (=> b!288201 (=> res!149903 e!182480)))

(declare-fun e!182477 () Bool)

(assert (=> b!288201 (= e!182477 e!182480)))

(declare-fun b!288202 () Bool)

(declare-fun e!182479 () Bool)

(assert (=> b!288202 (= e!182479 e!182477)))

(declare-fun res!149901 () Bool)

(assert (=> b!288202 (= res!149901 (and (is-Intermediate!2014 lt!141928) (not (undefined!2826 lt!141928)) (bvslt (x!28437 lt!141928) #b01111111111111111111111111111110) (bvsge (x!28437 lt!141928) #b00000000000000000000000000000000) (bvsge (x!28437 lt!141928) #b00000000000000000000000000000000)))))

(assert (=> b!288202 (=> (not res!149901) (not e!182477))))

(declare-fun b!288203 () Bool)

(declare-fun e!182481 () SeekEntryResult!2014)

(declare-fun e!182478 () SeekEntryResult!2014)

(assert (=> b!288203 (= e!182481 e!182478)))

(declare-fun c!46713 () Bool)

(declare-fun lt!141929 () (_ BitVec 64))

(assert (=> b!288203 (= c!46713 (or (= lt!141929 k!2524) (= (bvadd lt!141929 lt!141929) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288204 () Bool)

(assert (=> b!288204 (= e!182478 (Intermediate!2014 false lt!141882 #b00000000000000000000000000000000))))

(declare-fun b!288205 () Bool)

(assert (=> b!288205 (= e!182479 (bvsge (x!28437 lt!141928) #b01111111111111111111111111111110))))

(declare-fun b!288206 () Bool)

(assert (=> b!288206 (and (bvsge (index!10228 lt!141928) #b00000000000000000000000000000000) (bvslt (index!10228 lt!141928) (size!7217 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312)))))))

(declare-fun res!149902 () Bool)

(assert (=> b!288206 (= res!149902 (= (select (arr!6865 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312))) (index!10228 lt!141928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288206 (=> res!149902 e!182480)))

(declare-fun b!288207 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288207 (= e!182478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141882 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312)) mask!3809))))

(declare-fun d!66179 () Bool)

(assert (=> d!66179 e!182479))

(declare-fun c!46711 () Bool)

(assert (=> d!66179 (= c!46711 (and (is-Intermediate!2014 lt!141928) (undefined!2826 lt!141928)))))

(assert (=> d!66179 (= lt!141928 e!182481)))

(declare-fun c!46712 () Bool)

(assert (=> d!66179 (= c!46712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66179 (= lt!141929 (select (arr!6865 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312))) lt!141882))))

(assert (=> d!66179 (validMask!0 mask!3809)))

(assert (=> d!66179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141882 k!2524 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312)) mask!3809) lt!141928)))

(declare-fun b!288208 () Bool)

(assert (=> b!288208 (= e!182481 (Intermediate!2014 true lt!141882 #b00000000000000000000000000000000))))

(declare-fun b!288209 () Bool)

(assert (=> b!288209 (and (bvsge (index!10228 lt!141928) #b00000000000000000000000000000000) (bvslt (index!10228 lt!141928) (size!7217 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312)))))))

(assert (=> b!288209 (= e!182480 (= (select (arr!6865 (array!14474 (store (arr!6865 a!3312) i!1256 k!2524) (size!7217 a!3312))) (index!10228 lt!141928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66179 c!46712) b!288208))

(assert (= (and d!66179 (not c!46712)) b!288203))

(assert (= (and b!288203 c!46713) b!288204))

(assert (= (and b!288203 (not c!46713)) b!288207))

(assert (= (and d!66179 c!46711) b!288205))

(assert (= (and d!66179 (not c!46711)) b!288202))

(assert (= (and b!288202 res!149901) b!288201))

(assert (= (and b!288201 (not res!149903)) b!288206))

(assert (= (and b!288206 (not res!149902)) b!288209))

(declare-fun m!302487 () Bool)

(assert (=> b!288201 m!302487))

(assert (=> b!288209 m!302487))

(declare-fun m!302489 () Bool)

(assert (=> b!288207 m!302489))

(assert (=> b!288207 m!302489))

(declare-fun m!302491 () Bool)

(assert (=> b!288207 m!302491))

(declare-fun m!302493 () Bool)

(assert (=> d!66179 m!302493))

(assert (=> d!66179 m!302427))

(assert (=> b!288206 m!302487))

(assert (=> b!288085 d!66179))

(declare-fun b!288214 () Bool)

(declare-fun lt!141930 () SeekEntryResult!2014)

(assert (=> b!288214 (and (bvsge (index!10228 lt!141930) #b00000000000000000000000000000000) (bvslt (index!10228 lt!141930) (size!7217 a!3312)))))

(declare-fun res!149910 () Bool)

(assert (=> b!288214 (= res!149910 (= (select (arr!6865 a!3312) (index!10228 lt!141930)) k!2524))))

(declare-fun e!182489 () Bool)

(assert (=> b!288214 (=> res!149910 e!182489)))

(declare-fun e!182486 () Bool)

(assert (=> b!288214 (= e!182486 e!182489)))

(declare-fun b!288215 () Bool)

(declare-fun e!182488 () Bool)

(assert (=> b!288215 (= e!182488 e!182486)))

(declare-fun res!149908 () Bool)

(assert (=> b!288215 (= res!149908 (and (is-Intermediate!2014 lt!141930) (not (undefined!2826 lt!141930)) (bvslt (x!28437 lt!141930) #b01111111111111111111111111111110) (bvsge (x!28437 lt!141930) #b00000000000000000000000000000000) (bvsge (x!28437 lt!141930) #b00000000000000000000000000000000)))))

(assert (=> b!288215 (=> (not res!149908) (not e!182486))))

(declare-fun b!288216 () Bool)

(declare-fun e!182490 () SeekEntryResult!2014)

(declare-fun e!182487 () SeekEntryResult!2014)

(assert (=> b!288216 (= e!182490 e!182487)))

(declare-fun c!46716 () Bool)

(declare-fun lt!141931 () (_ BitVec 64))

(assert (=> b!288216 (= c!46716 (or (= lt!141931 k!2524) (= (bvadd lt!141931 lt!141931) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288217 () Bool)

(assert (=> b!288217 (= e!182487 (Intermediate!2014 false lt!141882 #b00000000000000000000000000000000))))

(declare-fun b!288218 () Bool)

(assert (=> b!288218 (= e!182488 (bvsge (x!28437 lt!141930) #b01111111111111111111111111111110))))

(declare-fun b!288219 () Bool)

(assert (=> b!288219 (and (bvsge (index!10228 lt!141930) #b00000000000000000000000000000000) (bvslt (index!10228 lt!141930) (size!7217 a!3312)))))

(declare-fun res!149909 () Bool)

(assert (=> b!288219 (= res!149909 (= (select (arr!6865 a!3312) (index!10228 lt!141930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!288219 (=> res!149909 e!182489)))

(declare-fun b!288220 () Bool)

(assert (=> b!288220 (= e!182487 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141882 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!66193 () Bool)

(assert (=> d!66193 e!182488))

(declare-fun c!46714 () Bool)

(assert (=> d!66193 (= c!46714 (and (is-Intermediate!2014 lt!141930) (undefined!2826 lt!141930)))))

(assert (=> d!66193 (= lt!141930 e!182490)))

(declare-fun c!46715 () Bool)

(assert (=> d!66193 (= c!46715 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66193 (= lt!141931 (select (arr!6865 a!3312) lt!141882))))

(assert (=> d!66193 (validMask!0 mask!3809)))

(assert (=> d!66193 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141882 k!2524 a!3312 mask!3809) lt!141930)))

(declare-fun b!288221 () Bool)

(assert (=> b!288221 (= e!182490 (Intermediate!2014 true lt!141882 #b00000000000000000000000000000000))))

(declare-fun b!288222 () Bool)

(assert (=> b!288222 (and (bvsge (index!10228 lt!141930) #b00000000000000000000000000000000) (bvslt (index!10228 lt!141930) (size!7217 a!3312)))))

(assert (=> b!288222 (= e!182489 (= (select (arr!6865 a!3312) (index!10228 lt!141930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66193 c!46715) b!288221))

(assert (= (and d!66193 (not c!46715)) b!288216))

(assert (= (and b!288216 c!46716) b!288217))

(assert (= (and b!288216 (not c!46716)) b!288220))

(assert (= (and d!66193 c!46714) b!288218))

(assert (= (and d!66193 (not c!46714)) b!288215))

(assert (= (and b!288215 res!149908) b!288214))

(assert (= (and b!288214 (not res!149910)) b!288219))

(assert (= (and b!288219 (not res!149909)) b!288222))

(declare-fun m!302499 () Bool)

(assert (=> b!288214 m!302499))

(assert (=> b!288222 m!302499))

(assert (=> b!288220 m!302489))

(assert (=> b!288220 m!302489))

(declare-fun m!302501 () Bool)

(assert (=> b!288220 m!302501))

(declare-fun m!302503 () Bool)

(assert (=> d!66193 m!302503))

(assert (=> d!66193 m!302427))

(assert (=> b!288219 m!302499))

(assert (=> b!288085 d!66193))

(declare-fun d!66197 () Bool)

(declare-fun lt!141937 () (_ BitVec 32))

(declare-fun lt!141936 () (_ BitVec 32))

(assert (=> d!66197 (= lt!141937 (bvmul (bvxor lt!141936 (bvlshr lt!141936 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66197 (= lt!141936 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66197 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149913 (let ((h!5258 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28443 (bvmul (bvxor h!5258 (bvlshr h!5258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28443 (bvlshr x!28443 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149913 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149913 #b00000000000000000000000000000000))))))

(assert (=> d!66197 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141937 (bvlshr lt!141937 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!288085 d!66197))

(declare-fun d!66199 () Bool)

(assert (=> d!66199 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!288091 d!66199))

(declare-fun d!66201 () Bool)

(assert (=> d!66201 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28114 d!66201))

(declare-fun d!66209 () Bool)

(assert (=> d!66209 (= (array_inv!4828 a!3312) (bvsge (size!7217 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28114 d!66209))

(declare-fun b!288269 () Bool)

(declare-fun e!182520 () Bool)

(declare-fun call!25633 () Bool)

(assert (=> b!288269 (= e!182520 call!25633)))

(declare-fun d!66211 () Bool)

(declare-fun res!149924 () Bool)

(declare-fun e!182521 () Bool)

(assert (=> d!66211 (=> res!149924 e!182521)))

(assert (=> d!66211 (= res!149924 (bvsge #b00000000000000000000000000000000 (size!7217 a!3312)))))

(assert (=> d!66211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182521)))

(declare-fun b!288270 () Bool)

(assert (=> b!288270 (= e!182521 e!182520)))

(declare-fun c!46734 () Bool)

(assert (=> b!288270 (= c!46734 (validKeyInArray!0 (select (arr!6865 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!288271 () Bool)

(declare-fun e!182522 () Bool)

(assert (=> b!288271 (= e!182520 e!182522)))

(declare-fun lt!141967 () (_ BitVec 64))

(assert (=> b!288271 (= lt!141967 (select (arr!6865 a!3312) #b00000000000000000000000000000000))))

