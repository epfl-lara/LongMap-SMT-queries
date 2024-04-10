; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28110 () Bool)

(assert start!28110)

(declare-fun b!288037 () Bool)

(declare-fun e!182379 () Bool)

(declare-fun e!182377 () Bool)

(assert (=> b!288037 (= e!182379 e!182377)))

(declare-fun res!149804 () Bool)

(assert (=> b!288037 (=> (not res!149804) (not e!182377))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2012 0))(
  ( (MissingZero!2012 (index!10218 (_ BitVec 32))) (Found!2012 (index!10219 (_ BitVec 32))) (Intermediate!2012 (undefined!2824 Bool) (index!10220 (_ BitVec 32)) (x!28435 (_ BitVec 32))) (Undefined!2012) (MissingVacant!2012 (index!10221 (_ BitVec 32))) )
))
(declare-fun lt!141848 () SeekEntryResult!2012)

(declare-fun lt!141849 () Bool)

(assert (=> b!288037 (= res!149804 (or lt!141849 (= lt!141848 (MissingVacant!2012 i!1256))))))

(assert (=> b!288037 (= lt!141849 (= lt!141848 (MissingZero!2012 i!1256)))))

(declare-datatypes ((array!14469 0))(
  ( (array!14470 (arr!6863 (Array (_ BitVec 32) (_ BitVec 64))) (size!7215 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14469)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14469 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!288037 (= lt!141848 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288038 () Bool)

(declare-fun e!182380 () Bool)

(declare-fun e!182381 () Bool)

(assert (=> b!288038 (= e!182380 e!182381)))

(declare-fun res!149805 () Bool)

(assert (=> b!288038 (=> (not res!149805) (not e!182381))))

(declare-fun lt!141846 () Bool)

(declare-fun lt!141850 () SeekEntryResult!2012)

(assert (=> b!288038 (= res!149805 (and (or lt!141846 (not (undefined!2824 lt!141850))) (or lt!141846 (not (= (select (arr!6863 a!3312) (index!10220 lt!141850)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141846 (not (= (select (arr!6863 a!3312) (index!10220 lt!141850)) k!2524))) (not lt!141846)))))

(assert (=> b!288038 (= lt!141846 (not (is-Intermediate!2012 lt!141850)))))

(declare-fun b!288039 () Bool)

(declare-fun res!149806 () Bool)

(assert (=> b!288039 (=> (not res!149806) (not e!182377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14469 (_ BitVec 32)) Bool)

(assert (=> b!288039 (= res!149806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288040 () Bool)

(declare-fun res!149801 () Bool)

(assert (=> b!288040 (=> (not res!149801) (not e!182379))))

(assert (=> b!288040 (= res!149801 (and (= (size!7215 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7215 a!3312))))))

(declare-fun b!288041 () Bool)

(assert (=> b!288041 (= e!182377 e!182380)))

(declare-fun res!149808 () Bool)

(assert (=> b!288041 (=> (not res!149808) (not e!182380))))

(assert (=> b!288041 (= res!149808 lt!141849)))

(declare-fun lt!141847 () (_ BitVec 32))

(declare-fun lt!141845 () SeekEntryResult!2012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14469 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!288041 (= lt!141845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141847 k!2524 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312)) mask!3809))))

(assert (=> b!288041 (= lt!141850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141847 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288041 (= lt!141847 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!149803 () Bool)

(assert (=> start!28110 (=> (not res!149803) (not e!182379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28110 (= res!149803 (validMask!0 mask!3809))))

(assert (=> start!28110 e!182379))

(assert (=> start!28110 true))

(declare-fun array_inv!4826 (array!14469) Bool)

(assert (=> start!28110 (array_inv!4826 a!3312)))

(declare-fun b!288042 () Bool)

(assert (=> b!288042 (= e!182381 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(assert (=> b!288042 (and (= (select (arr!6863 a!3312) (index!10220 lt!141850)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10220 lt!141850) i!1256))))

(declare-fun b!288043 () Bool)

(declare-fun res!149802 () Bool)

(assert (=> b!288043 (=> (not res!149802) (not e!182379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288043 (= res!149802 (validKeyInArray!0 k!2524))))

(declare-fun b!288044 () Bool)

(declare-fun res!149807 () Bool)

(assert (=> b!288044 (=> (not res!149807) (not e!182379))))

(declare-fun arrayContainsKey!0 (array!14469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288044 (= res!149807 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28110 res!149803) b!288040))

(assert (= (and b!288040 res!149801) b!288043))

(assert (= (and b!288043 res!149802) b!288044))

(assert (= (and b!288044 res!149807) b!288037))

(assert (= (and b!288037 res!149804) b!288039))

(assert (= (and b!288039 res!149806) b!288041))

(assert (= (and b!288041 res!149808) b!288038))

(assert (= (and b!288038 res!149805) b!288042))

(declare-fun m!302379 () Bool)

(assert (=> b!288042 m!302379))

(declare-fun m!302381 () Bool)

(assert (=> start!28110 m!302381))

(declare-fun m!302383 () Bool)

(assert (=> start!28110 m!302383))

(declare-fun m!302385 () Bool)

(assert (=> b!288044 m!302385))

(declare-fun m!302387 () Bool)

(assert (=> b!288043 m!302387))

(declare-fun m!302389 () Bool)

(assert (=> b!288041 m!302389))

(declare-fun m!302391 () Bool)

(assert (=> b!288041 m!302391))

(declare-fun m!302393 () Bool)

(assert (=> b!288041 m!302393))

(declare-fun m!302395 () Bool)

(assert (=> b!288041 m!302395))

(declare-fun m!302397 () Bool)

(assert (=> b!288037 m!302397))

(declare-fun m!302399 () Bool)

(assert (=> b!288039 m!302399))

(assert (=> b!288038 m!302379))

(push 1)

(assert (not b!288039))

(assert (not b!288043))

(assert (not b!288037))

(assert (not b!288041))

(assert (not start!28110))

(assert (not b!288044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!288147 () Bool)

(declare-fun e!182450 () SeekEntryResult!2012)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288147 (= e!182450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141847 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312)) mask!3809))))

(declare-fun d!66173 () Bool)

(declare-fun e!182451 () Bool)

(assert (=> d!66173 e!182451))

(declare-fun c!46693 () Bool)

(declare-fun lt!141905 () SeekEntryResult!2012)

(assert (=> d!66173 (= c!46693 (and (is-Intermediate!2012 lt!141905) (undefined!2824 lt!141905)))))

(declare-fun e!182449 () SeekEntryResult!2012)

(assert (=> d!66173 (= lt!141905 e!182449)))

(declare-fun c!46694 () Bool)

(assert (=> d!66173 (= c!46694 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!141904 () (_ BitVec 64))

(assert (=> d!66173 (= lt!141904 (select (arr!6863 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312))) lt!141847))))

(assert (=> d!66173 (validMask!0 mask!3809)))

(assert (=> d!66173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141847 k!2524 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312)) mask!3809) lt!141905)))

(declare-fun b!288148 () Bool)

(assert (=> b!288148 (and (bvsge (index!10220 lt!141905) #b00000000000000000000000000000000) (bvslt (index!10220 lt!141905) (size!7215 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312)))))))

(declare-fun res!149881 () Bool)

(assert (=> b!288148 (= res!149881 (= (select (arr!6863 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312))) (index!10220 lt!141905)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182448 () Bool)

(assert (=> b!288148 (=> res!149881 e!182448)))

(declare-fun b!288149 () Bool)

(assert (=> b!288149 (= e!182449 (Intermediate!2012 true lt!141847 #b00000000000000000000000000000000))))

(declare-fun b!288150 () Bool)

(assert (=> b!288150 (and (bvsge (index!10220 lt!141905) #b00000000000000000000000000000000) (bvslt (index!10220 lt!141905) (size!7215 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312)))))))

(declare-fun res!149883 () Bool)

(assert (=> b!288150 (= res!149883 (= (select (arr!6863 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312))) (index!10220 lt!141905)) k!2524))))

(assert (=> b!288150 (=> res!149883 e!182448)))

(declare-fun e!182447 () Bool)

(assert (=> b!288150 (= e!182447 e!182448)))

(declare-fun b!288151 () Bool)

(assert (=> b!288151 (= e!182449 e!182450)))

(declare-fun c!46695 () Bool)

(assert (=> b!288151 (= c!46695 (or (= lt!141904 k!2524) (= (bvadd lt!141904 lt!141904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288152 () Bool)

(assert (=> b!288152 (= e!182450 (Intermediate!2012 false lt!141847 #b00000000000000000000000000000000))))

(declare-fun b!288153 () Bool)

(assert (=> b!288153 (= e!182451 (bvsge (x!28435 lt!141905) #b01111111111111111111111111111110))))

(declare-fun b!288154 () Bool)

(assert (=> b!288154 (and (bvsge (index!10220 lt!141905) #b00000000000000000000000000000000) (bvslt (index!10220 lt!141905) (size!7215 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312)))))))

(assert (=> b!288154 (= e!182448 (= (select (arr!6863 (array!14470 (store (arr!6863 a!3312) i!1256 k!2524) (size!7215 a!3312))) (index!10220 lt!141905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288155 () Bool)

(assert (=> b!288155 (= e!182451 e!182447)))

(declare-fun res!149882 () Bool)

(assert (=> b!288155 (= res!149882 (and (is-Intermediate!2012 lt!141905) (not (undefined!2824 lt!141905)) (bvslt (x!28435 lt!141905) #b01111111111111111111111111111110) (bvsge (x!28435 lt!141905) #b00000000000000000000000000000000) (bvsge (x!28435 lt!141905) #b00000000000000000000000000000000)))))

(assert (=> b!288155 (=> (not res!149882) (not e!182447))))

(assert (= (and d!66173 c!46694) b!288149))

(assert (= (and d!66173 (not c!46694)) b!288151))

(assert (= (and b!288151 c!46695) b!288152))

(assert (= (and b!288151 (not c!46695)) b!288147))

(assert (= (and d!66173 c!46693) b!288153))

(assert (= (and d!66173 (not c!46693)) b!288155))

(assert (= (and b!288155 res!149882) b!288150))

(assert (= (and b!288150 (not res!149883)) b!288148))

(assert (= (and b!288148 (not res!149881)) b!288154))

(declare-fun m!302459 () Bool)

(assert (=> b!288147 m!302459))

(assert (=> b!288147 m!302459))

(declare-fun m!302461 () Bool)

(assert (=> b!288147 m!302461))

(declare-fun m!302463 () Bool)

(assert (=> b!288148 m!302463))

(declare-fun m!302465 () Bool)

(assert (=> d!66173 m!302465))

(assert (=> d!66173 m!302381))

(assert (=> b!288150 m!302463))

(assert (=> b!288154 m!302463))

(assert (=> b!288041 d!66173))

(declare-fun b!288165 () Bool)

(declare-fun e!182460 () SeekEntryResult!2012)

(assert (=> b!288165 (= e!182460 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141847 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!66181 () Bool)

(declare-fun e!182461 () Bool)

(assert (=> d!66181 e!182461))

(declare-fun c!46699 () Bool)

(declare-fun lt!141909 () SeekEntryResult!2012)

(assert (=> d!66181 (= c!46699 (and (is-Intermediate!2012 lt!141909) (undefined!2824 lt!141909)))))

(declare-fun e!182459 () SeekEntryResult!2012)

(assert (=> d!66181 (= lt!141909 e!182459)))

(declare-fun c!46700 () Bool)

(assert (=> d!66181 (= c!46700 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!141908 () (_ BitVec 64))

(assert (=> d!66181 (= lt!141908 (select (arr!6863 a!3312) lt!141847))))

(assert (=> d!66181 (validMask!0 mask!3809)))

(assert (=> d!66181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141847 k!2524 a!3312 mask!3809) lt!141909)))

(declare-fun b!288166 () Bool)

(assert (=> b!288166 (and (bvsge (index!10220 lt!141909) #b00000000000000000000000000000000) (bvslt (index!10220 lt!141909) (size!7215 a!3312)))))

(declare-fun res!149887 () Bool)

(assert (=> b!288166 (= res!149887 (= (select (arr!6863 a!3312) (index!10220 lt!141909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182458 () Bool)

(assert (=> b!288166 (=> res!149887 e!182458)))

(declare-fun b!288167 () Bool)

(assert (=> b!288167 (= e!182459 (Intermediate!2012 true lt!141847 #b00000000000000000000000000000000))))

(declare-fun b!288168 () Bool)

(assert (=> b!288168 (and (bvsge (index!10220 lt!141909) #b00000000000000000000000000000000) (bvslt (index!10220 lt!141909) (size!7215 a!3312)))))

(declare-fun res!149889 () Bool)

(assert (=> b!288168 (= res!149889 (= (select (arr!6863 a!3312) (index!10220 lt!141909)) k!2524))))

(assert (=> b!288168 (=> res!149889 e!182458)))

(declare-fun e!182457 () Bool)

(assert (=> b!288168 (= e!182457 e!182458)))

(declare-fun b!288169 () Bool)

(assert (=> b!288169 (= e!182459 e!182460)))

(declare-fun c!46701 () Bool)

(assert (=> b!288169 (= c!46701 (or (= lt!141908 k!2524) (= (bvadd lt!141908 lt!141908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!288170 () Bool)

(assert (=> b!288170 (= e!182460 (Intermediate!2012 false lt!141847 #b00000000000000000000000000000000))))

(declare-fun b!288171 () Bool)

(assert (=> b!288171 (= e!182461 (bvsge (x!28435 lt!141909) #b01111111111111111111111111111110))))

(declare-fun b!288172 () Bool)

(assert (=> b!288172 (and (bvsge (index!10220 lt!141909) #b00000000000000000000000000000000) (bvslt (index!10220 lt!141909) (size!7215 a!3312)))))

(assert (=> b!288172 (= e!182458 (= (select (arr!6863 a!3312) (index!10220 lt!141909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288173 () Bool)

(assert (=> b!288173 (= e!182461 e!182457)))

(declare-fun res!149888 () Bool)

(assert (=> b!288173 (= res!149888 (and (is-Intermediate!2012 lt!141909) (not (undefined!2824 lt!141909)) (bvslt (x!28435 lt!141909) #b01111111111111111111111111111110) (bvsge (x!28435 lt!141909) #b00000000000000000000000000000000) (bvsge (x!28435 lt!141909) #b00000000000000000000000000000000)))))

(assert (=> b!288173 (=> (not res!149888) (not e!182457))))

(assert (= (and d!66181 c!46700) b!288167))

(assert (= (and d!66181 (not c!46700)) b!288169))

(assert (= (and b!288169 c!46701) b!288170))

(assert (= (and b!288169 (not c!46701)) b!288165))

(assert (= (and d!66181 c!46699) b!288171))

(assert (= (and d!66181 (not c!46699)) b!288173))

(assert (= (and b!288173 res!149888) b!288168))

(assert (= (and b!288168 (not res!149889)) b!288166))

(assert (= (and b!288166 (not res!149887)) b!288172))

(assert (=> b!288165 m!302459))

(assert (=> b!288165 m!302459))

(declare-fun m!302475 () Bool)

(assert (=> b!288165 m!302475))

(declare-fun m!302477 () Bool)

(assert (=> b!288166 m!302477))

(declare-fun m!302479 () Bool)

(assert (=> d!66181 m!302479))

(assert (=> d!66181 m!302381))

(assert (=> b!288168 m!302477))

(assert (=> b!288172 m!302477))

(assert (=> b!288041 d!66181))

(declare-fun d!66185 () Bool)

(declare-fun lt!141925 () (_ BitVec 32))

(declare-fun lt!141924 () (_ BitVec 32))

(assert (=> d!66185 (= lt!141925 (bvmul (bvxor lt!141924 (bvlshr lt!141924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66185 (= lt!141924 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66185 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149893 (let ((h!5256 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28441 (bvmul (bvxor h!5256 (bvlshr h!5256 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28441 (bvlshr x!28441 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149893 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149893 #b00000000000000000000000000000000))))))

(assert (=> d!66185 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141925 (bvlshr lt!141925 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!288041 d!66185))

(declare-fun d!66189 () Bool)

(declare-fun res!149911 () Bool)

(declare-fun e!182491 () Bool)

(assert (=> d!66189 (=> res!149911 e!182491)))

(assert (=> d!66189 (= res!149911 (= (select (arr!6863 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66189 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!182491)))

(declare-fun b!288223 () Bool)

(declare-fun e!182492 () Bool)

(assert (=> b!288223 (= e!182491 e!182492)))

(declare-fun res!149912 () Bool)

(assert (=> b!288223 (=> (not res!149912) (not e!182492))))

(assert (=> b!288223 (= res!149912 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7215 a!3312)))))

(declare-fun b!288224 () Bool)

(assert (=> b!288224 (= e!182492 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66189 (not res!149911)) b!288223))

(assert (= (and b!288223 res!149912) b!288224))

(declare-fun m!302495 () Bool)

(assert (=> d!66189 m!302495))

(declare-fun m!302497 () Bool)

(assert (=> b!288224 m!302497))

(assert (=> b!288044 d!66189))

(declare-fun bm!25627 () Bool)

(declare-fun call!25630 () Bool)

(assert (=> bm!25627 (= call!25630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!288233 () Bool)

(declare-fun e!182501 () Bool)

(declare-fun e!182499 () Bool)

(assert (=> b!288233 (= e!182501 e!182499)))

(declare-fun c!46719 () Bool)

(assert (=> b!288233 (= c!46719 (validKeyInArray!0 (select (arr!6863 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!288234 () Bool)

(declare-fun e!182500 () Bool)

(assert (=> b!288234 (= e!182499 e!182500)))

(declare-fun lt!141944 () (_ BitVec 64))

(assert (=> b!288234 (= lt!141944 (select (arr!6863 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9076 0))(
  ( (Unit!9077) )
))
(declare-fun lt!141946 () Unit!9076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14469 (_ BitVec 64) (_ BitVec 32)) Unit!9076)

(assert (=> b!288234 (= lt!141946 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141944 #b00000000000000000000000000000000))))

(assert (=> b!288234 (arrayContainsKey!0 a!3312 lt!141944 #b00000000000000000000000000000000)))

(declare-fun lt!141945 () Unit!9076)

(assert (=> b!288234 (= lt!141945 lt!141946)))

(declare-fun res!149919 () Bool)

(assert (=> b!288234 (= res!149919 (= (seekEntryOrOpen!0 (select (arr!6863 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2012 #b00000000000000000000000000000000)))))

(assert (=> b!288234 (=> (not res!149919) (not e!182500))))

(declare-fun b!288235 () Bool)

(assert (=> b!288235 (= e!182499 call!25630)))

(declare-fun d!66195 () Bool)

(declare-fun res!149918 () Bool)

(assert (=> d!66195 (=> res!149918 e!182501)))

(assert (=> d!66195 (= res!149918 (bvsge #b00000000000000000000000000000000 (size!7215 a!3312)))))

(assert (=> d!66195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182501)))

(declare-fun b!288236 () Bool)

(assert (=> b!288236 (= e!182500 call!25630)))

(assert (= (and d!66195 (not res!149918)) b!288233))

(assert (= (and b!288233 c!46719) b!288234))

(assert (= (and b!288233 (not c!46719)) b!288235))

(assert (= (and b!288234 res!149919) b!288236))

(assert (= (or b!288236 b!288235) bm!25627))

(declare-fun m!302505 () Bool)

(assert (=> bm!25627 m!302505))

(assert (=> b!288233 m!302495))

(assert (=> b!288233 m!302495))

(declare-fun m!302507 () Bool)

(assert (=> b!288233 m!302507))

(assert (=> b!288234 m!302495))

(declare-fun m!302509 () Bool)

(assert (=> b!288234 m!302509))

(declare-fun m!302511 () Bool)

(assert (=> b!288234 m!302511))

(assert (=> b!288234 m!302495))

(declare-fun m!302513 () Bool)

(assert (=> b!288234 m!302513))

(assert (=> b!288039 d!66195))

(declare-fun b!288279 () Bool)

(declare-fun c!46738 () Bool)

(declare-fun lt!141972 () (_ BitVec 64))

(assert (=> b!288279 (= c!46738 (= lt!141972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182527 () SeekEntryResult!2012)

(declare-fun e!182528 () SeekEntryResult!2012)

(assert (=> b!288279 (= e!182527 e!182528)))

(declare-fun b!288280 () Bool)

(declare-fun lt!141971 () SeekEntryResult!2012)

(assert (=> b!288280 (= e!182527 (Found!2012 (index!10220 lt!141971)))))

(declare-fun b!288281 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14469 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!288281 (= e!182528 (seekKeyOrZeroReturnVacant!0 (x!28435 lt!141971) (index!10220 lt!141971) (index!10220 lt!141971) k!2524 a!3312 mask!3809))))

(declare-fun b!288282 () Bool)

(declare-fun e!182526 () SeekEntryResult!2012)

(assert (=> b!288282 (= e!182526 Undefined!2012)))

(declare-fun b!288283 () Bool)

(assert (=> b!288283 (= e!182526 e!182527)))

(assert (=> b!288283 (= lt!141972 (select (arr!6863 a!3312) (index!10220 lt!141971)))))

(declare-fun c!46740 () Bool)

(assert (=> b!288283 (= c!46740 (= lt!141972 k!2524))))

(declare-fun d!66207 () Bool)

(declare-fun lt!141973 () SeekEntryResult!2012)

(assert (=> d!66207 (and (or (is-Undefined!2012 lt!141973) (not (is-Found!2012 lt!141973)) (and (bvsge (index!10219 lt!141973) #b00000000000000000000000000000000) (bvslt (index!10219 lt!141973) (size!7215 a!3312)))) (or (is-Undefined!2012 lt!141973) (is-Found!2012 lt!141973) (not (is-MissingZero!2012 lt!141973)) (and (bvsge (index!10218 lt!141973) #b00000000000000000000000000000000) (bvslt (index!10218 lt!141973) (size!7215 a!3312)))) (or (is-Undefined!2012 lt!141973) (is-Found!2012 lt!141973) (is-MissingZero!2012 lt!141973) (not (is-MissingVacant!2012 lt!141973)) (and (bvsge (index!10221 lt!141973) #b00000000000000000000000000000000) (bvslt (index!10221 lt!141973) (size!7215 a!3312)))) (or (is-Undefined!2012 lt!141973) (ite (is-Found!2012 lt!141973) (= (select (arr!6863 a!3312) (index!10219 lt!141973)) k!2524) (ite (is-MissingZero!2012 lt!141973) (= (select (arr!6863 a!3312) (index!10218 lt!141973)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2012 lt!141973) (= (select (arr!6863 a!3312) (index!10221 lt!141973)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66207 (= lt!141973 e!182526)))

(declare-fun c!46739 () Bool)

(assert (=> d!66207 (= c!46739 (and (is-Intermediate!2012 lt!141971) (undefined!2824 lt!141971)))))

(assert (=> d!66207 (= lt!141971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66207 (validMask!0 mask!3809)))

(assert (=> d!66207 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141973)))

(declare-fun b!288284 () Bool)

(assert (=> b!288284 (= e!182528 (MissingZero!2012 (index!10220 lt!141971)))))

(assert (= (and d!66207 c!46739) b!288282))

(assert (= (and d!66207 (not c!46739)) b!288283))

(assert (= (and b!288283 c!46740) b!288280))

(assert (= (and b!288283 (not c!46740)) b!288279))

(assert (= (and b!288279 c!46738) b!288284))

(assert (= (and b!288279 (not c!46738)) b!288281))

(declare-fun m!302539 () Bool)

(assert (=> b!288281 m!302539))

(declare-fun m!302541 () Bool)

(assert (=> b!288283 m!302541))

(assert (=> d!66207 m!302395))

(assert (=> d!66207 m!302395))

(declare-fun m!302543 () Bool)

(assert (=> d!66207 m!302543))

(declare-fun m!302545 () Bool)

(assert (=> d!66207 m!302545))

(assert (=> d!66207 m!302381))

(declare-fun m!302547 () Bool)

(assert (=> d!66207 m!302547))

(declare-fun m!302549 () Bool)

(assert (=> d!66207 m!302549))

(assert (=> b!288037 d!66207))

(declare-fun d!66215 () Bool)

(assert (=> d!66215 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!288043 d!66215))

(declare-fun d!66217 () Bool)

(assert (=> d!66217 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28110 d!66217))

(declare-fun d!66219 () Bool)

(assert (=> d!66219 (= (array_inv!4826 a!3312) (bvsge (size!7215 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28110 d!66219))

(push 1)

