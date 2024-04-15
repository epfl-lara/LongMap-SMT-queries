; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28332 () Bool)

(assert start!28332)

(declare-fun b!290206 () Bool)

(declare-fun e!183635 () Bool)

(declare-fun e!183637 () Bool)

(assert (=> b!290206 (= e!183635 e!183637)))

(declare-fun res!151742 () Bool)

(assert (=> b!290206 (=> (not res!151742) (not e!183637))))

(declare-datatypes ((SeekEntryResult!2095 0))(
  ( (MissingZero!2095 (index!10550 (_ BitVec 32))) (Found!2095 (index!10551 (_ BitVec 32))) (Intermediate!2095 (undefined!2907 Bool) (index!10552 (_ BitVec 32)) (x!28755 (_ BitVec 32))) (Undefined!2095) (MissingVacant!2095 (index!10553 (_ BitVec 32))) )
))
(declare-fun lt!143263 () SeekEntryResult!2095)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143265 () Bool)

(assert (=> b!290206 (= res!151742 (and (not lt!143265) (= lt!143263 (MissingVacant!2095 i!1256))))))

(declare-datatypes ((array!14639 0))(
  ( (array!14640 (arr!6947 (Array (_ BitVec 32) (_ BitVec 64))) (size!7300 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14639)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!143264 () (_ BitVec 32))

(declare-fun lt!143268 () SeekEntryResult!2095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14639 (_ BitVec 32)) SeekEntryResult!2095)

(assert (=> b!290206 (= lt!143268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143264 k!2524 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312)) mask!3809))))

(declare-fun lt!143267 () SeekEntryResult!2095)

(assert (=> b!290206 (= lt!143267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143264 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290206 (= lt!143264 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290207 () Bool)

(declare-fun res!151744 () Bool)

(declare-fun e!183638 () Bool)

(assert (=> b!290207 (=> (not res!151744) (not e!183638))))

(assert (=> b!290207 (= res!151744 (and (= (size!7300 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7300 a!3312))))))

(declare-fun b!290208 () Bool)

(declare-fun e!183639 () Bool)

(assert (=> b!290208 (= e!183637 e!183639)))

(declare-fun res!151737 () Bool)

(assert (=> b!290208 (=> (not res!151737) (not e!183639))))

(declare-fun lt!143266 () Bool)

(assert (=> b!290208 (= res!151737 (and (or lt!143266 (not (undefined!2907 lt!143267))) (not lt!143266) (= (select (arr!6947 a!3312) (index!10552 lt!143267)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290208 (= lt!143266 (not (is-Intermediate!2095 lt!143267)))))

(declare-fun b!290209 () Bool)

(declare-fun res!151739 () Bool)

(assert (=> b!290209 (=> (not res!151739) (not e!183635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14639 (_ BitVec 32)) Bool)

(assert (=> b!290209 (= res!151739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290210 () Bool)

(assert (=> b!290210 (= e!183638 e!183635)))

(declare-fun res!151741 () Bool)

(assert (=> b!290210 (=> (not res!151741) (not e!183635))))

(assert (=> b!290210 (= res!151741 (or lt!143265 (= lt!143263 (MissingVacant!2095 i!1256))))))

(assert (=> b!290210 (= lt!143265 (= lt!143263 (MissingZero!2095 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14639 (_ BitVec 32)) SeekEntryResult!2095)

(assert (=> b!290210 (= lt!143263 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290211 () Bool)

(assert (=> b!290211 (= e!183639 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(assert (=> b!290211 (= (index!10552 lt!143267) i!1256)))

(declare-fun b!290212 () Bool)

(declare-fun res!151740 () Bool)

(assert (=> b!290212 (=> (not res!151740) (not e!183638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290212 (= res!151740 (validKeyInArray!0 k!2524))))

(declare-fun res!151743 () Bool)

(assert (=> start!28332 (=> (not res!151743) (not e!183638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28332 (= res!151743 (validMask!0 mask!3809))))

(assert (=> start!28332 e!183638))

(assert (=> start!28332 true))

(declare-fun array_inv!4919 (array!14639) Bool)

(assert (=> start!28332 (array_inv!4919 a!3312)))

(declare-fun b!290213 () Bool)

(declare-fun res!151738 () Bool)

(assert (=> b!290213 (=> (not res!151738) (not e!183638))))

(declare-fun arrayContainsKey!0 (array!14639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290213 (= res!151738 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28332 res!151743) b!290207))

(assert (= (and b!290207 res!151744) b!290212))

(assert (= (and b!290212 res!151740) b!290213))

(assert (= (and b!290213 res!151738) b!290210))

(assert (= (and b!290210 res!151741) b!290209))

(assert (= (and b!290209 res!151739) b!290206))

(assert (= (and b!290206 res!151742) b!290208))

(assert (= (and b!290208 res!151737) b!290211))

(declare-fun m!303865 () Bool)

(assert (=> start!28332 m!303865))

(declare-fun m!303867 () Bool)

(assert (=> start!28332 m!303867))

(declare-fun m!303869 () Bool)

(assert (=> b!290206 m!303869))

(declare-fun m!303871 () Bool)

(assert (=> b!290206 m!303871))

(declare-fun m!303873 () Bool)

(assert (=> b!290206 m!303873))

(declare-fun m!303875 () Bool)

(assert (=> b!290206 m!303875))

(declare-fun m!303877 () Bool)

(assert (=> b!290209 m!303877))

(declare-fun m!303879 () Bool)

(assert (=> b!290210 m!303879))

(declare-fun m!303881 () Bool)

(assert (=> b!290213 m!303881))

(declare-fun m!303883 () Bool)

(assert (=> b!290212 m!303883))

(declare-fun m!303885 () Bool)

(assert (=> b!290208 m!303885))

(push 1)

(assert (not b!290206))

(assert (not start!28332))

(assert (not b!290209))

(assert (not b!290213))

(assert (not b!290210))

(assert (not b!290212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66127 () Bool)

(declare-fun lt!143281 () SeekEntryResult!2095)

(assert (=> d!66127 (and (or (is-Undefined!2095 lt!143281) (not (is-Found!2095 lt!143281)) (and (bvsge (index!10551 lt!143281) #b00000000000000000000000000000000) (bvslt (index!10551 lt!143281) (size!7300 a!3312)))) (or (is-Undefined!2095 lt!143281) (is-Found!2095 lt!143281) (not (is-MissingZero!2095 lt!143281)) (and (bvsge (index!10550 lt!143281) #b00000000000000000000000000000000) (bvslt (index!10550 lt!143281) (size!7300 a!3312)))) (or (is-Undefined!2095 lt!143281) (is-Found!2095 lt!143281) (is-MissingZero!2095 lt!143281) (not (is-MissingVacant!2095 lt!143281)) (and (bvsge (index!10553 lt!143281) #b00000000000000000000000000000000) (bvslt (index!10553 lt!143281) (size!7300 a!3312)))) (or (is-Undefined!2095 lt!143281) (ite (is-Found!2095 lt!143281) (= (select (arr!6947 a!3312) (index!10551 lt!143281)) k!2524) (ite (is-MissingZero!2095 lt!143281) (= (select (arr!6947 a!3312) (index!10550 lt!143281)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2095 lt!143281) (= (select (arr!6947 a!3312) (index!10553 lt!143281)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!183653 () SeekEntryResult!2095)

(assert (=> d!66127 (= lt!143281 e!183653)))

(declare-fun c!46808 () Bool)

(declare-fun lt!143283 () SeekEntryResult!2095)

(assert (=> d!66127 (= c!46808 (and (is-Intermediate!2095 lt!143283) (undefined!2907 lt!143283)))))

(assert (=> d!66127 (= lt!143283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66127 (validMask!0 mask!3809)))

(assert (=> d!66127 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!143281)))

(declare-fun b!290238 () Bool)

(assert (=> b!290238 (= e!183653 Undefined!2095)))

(declare-fun b!290239 () Bool)

(declare-fun e!183652 () SeekEntryResult!2095)

(assert (=> b!290239 (= e!183652 (MissingZero!2095 (index!10552 lt!143283)))))

(declare-fun b!290240 () Bool)

(declare-fun c!46810 () Bool)

(declare-fun lt!143282 () (_ BitVec 64))

(assert (=> b!290240 (= c!46810 (= lt!143282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183654 () SeekEntryResult!2095)

(assert (=> b!290240 (= e!183654 e!183652)))

(declare-fun b!290241 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14639 (_ BitVec 32)) SeekEntryResult!2095)

(assert (=> b!290241 (= e!183652 (seekKeyOrZeroReturnVacant!0 (x!28755 lt!143283) (index!10552 lt!143283) (index!10552 lt!143283) k!2524 a!3312 mask!3809))))

(declare-fun b!290242 () Bool)

(assert (=> b!290242 (= e!183654 (Found!2095 (index!10552 lt!143283)))))

(declare-fun b!290243 () Bool)

(assert (=> b!290243 (= e!183653 e!183654)))

(assert (=> b!290243 (= lt!143282 (select (arr!6947 a!3312) (index!10552 lt!143283)))))

(declare-fun c!46809 () Bool)

(assert (=> b!290243 (= c!46809 (= lt!143282 k!2524))))

(assert (= (and d!66127 c!46808) b!290238))

(assert (= (and d!66127 (not c!46808)) b!290243))

(assert (= (and b!290243 c!46809) b!290242))

(assert (= (and b!290243 (not c!46809)) b!290240))

(assert (= (and b!290240 c!46810) b!290239))

(assert (= (and b!290240 (not c!46810)) b!290241))

(declare-fun m!303887 () Bool)

(assert (=> d!66127 m!303887))

(assert (=> d!66127 m!303875))

(assert (=> d!66127 m!303875))

(declare-fun m!303889 () Bool)

(assert (=> d!66127 m!303889))

(assert (=> d!66127 m!303865))

(declare-fun m!303891 () Bool)

(assert (=> d!66127 m!303891))

(declare-fun m!303893 () Bool)

(assert (=> d!66127 m!303893))

(declare-fun m!303895 () Bool)

(assert (=> b!290241 m!303895))

(declare-fun m!303897 () Bool)

(assert (=> b!290243 m!303897))

(assert (=> b!290210 d!66127))

(declare-fun e!183674 () SeekEntryResult!2095)

(declare-fun b!290280 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290280 (= e!183674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143264 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312)) mask!3809))))

(declare-fun b!290281 () Bool)

(declare-fun e!183676 () Bool)

(declare-fun lt!143301 () SeekEntryResult!2095)

(assert (=> b!290281 (= e!183676 (bvsge (x!28755 lt!143301) #b01111111111111111111111111111110))))

(declare-fun b!290282 () Bool)

(assert (=> b!290282 (= e!183674 (Intermediate!2095 false lt!143264 #b00000000000000000000000000000000))))

(declare-fun b!290283 () Bool)

(assert (=> b!290283 (and (bvsge (index!10552 lt!143301) #b00000000000000000000000000000000) (bvslt (index!10552 lt!143301) (size!7300 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312)))))))

(declare-fun res!151753 () Bool)

(assert (=> b!290283 (= res!151753 (= (select (arr!6947 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312))) (index!10552 lt!143301)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183675 () Bool)

(assert (=> b!290283 (=> res!151753 e!183675)))

(declare-fun d!66129 () Bool)

(assert (=> d!66129 e!183676))

(declare-fun c!46828 () Bool)

(assert (=> d!66129 (= c!46828 (and (is-Intermediate!2095 lt!143301) (undefined!2907 lt!143301)))))

(declare-fun e!183678 () SeekEntryResult!2095)

(assert (=> d!66129 (= lt!143301 e!183678)))

(declare-fun c!46826 () Bool)

(assert (=> d!66129 (= c!46826 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!143302 () (_ BitVec 64))

(assert (=> d!66129 (= lt!143302 (select (arr!6947 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312))) lt!143264))))

(assert (=> d!66129 (validMask!0 mask!3809)))

(assert (=> d!66129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143264 k!2524 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312)) mask!3809) lt!143301)))

(declare-fun b!290284 () Bool)

(assert (=> b!290284 (= e!183678 (Intermediate!2095 true lt!143264 #b00000000000000000000000000000000))))

(declare-fun b!290285 () Bool)

(declare-fun e!183677 () Bool)

(assert (=> b!290285 (= e!183676 e!183677)))

(declare-fun res!151751 () Bool)

(assert (=> b!290285 (= res!151751 (and (is-Intermediate!2095 lt!143301) (not (undefined!2907 lt!143301)) (bvslt (x!28755 lt!143301) #b01111111111111111111111111111110) (bvsge (x!28755 lt!143301) #b00000000000000000000000000000000) (bvsge (x!28755 lt!143301) #b00000000000000000000000000000000)))))

(assert (=> b!290285 (=> (not res!151751) (not e!183677))))

(declare-fun b!290286 () Bool)

(assert (=> b!290286 (and (bvsge (index!10552 lt!143301) #b00000000000000000000000000000000) (bvslt (index!10552 lt!143301) (size!7300 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312)))))))

(assert (=> b!290286 (= e!183675 (= (select (arr!6947 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312))) (index!10552 lt!143301)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290287 () Bool)

(assert (=> b!290287 (and (bvsge (index!10552 lt!143301) #b00000000000000000000000000000000) (bvslt (index!10552 lt!143301) (size!7300 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312)))))))

(declare-fun res!151752 () Bool)

(assert (=> b!290287 (= res!151752 (= (select (arr!6947 (array!14640 (store (arr!6947 a!3312) i!1256 k!2524) (size!7300 a!3312))) (index!10552 lt!143301)) k!2524))))

(assert (=> b!290287 (=> res!151752 e!183675)))

(assert (=> b!290287 (= e!183677 e!183675)))

(declare-fun b!290288 () Bool)

(assert (=> b!290288 (= e!183678 e!183674)))

(declare-fun c!46827 () Bool)

(assert (=> b!290288 (= c!46827 (or (= lt!143302 k!2524) (= (bvadd lt!143302 lt!143302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66129 c!46826) b!290284))

(assert (= (and d!66129 (not c!46826)) b!290288))

(assert (= (and b!290288 c!46827) b!290282))

(assert (= (and b!290288 (not c!46827)) b!290280))

(assert (= (and d!66129 c!46828) b!290281))

(assert (= (and d!66129 (not c!46828)) b!290285))

(assert (= (and b!290285 res!151751) b!290287))

(assert (= (and b!290287 (not res!151752)) b!290283))

(assert (= (and b!290283 (not res!151753)) b!290286))

(declare-fun m!303911 () Bool)

(assert (=> b!290280 m!303911))

(assert (=> b!290280 m!303911))

(declare-fun m!303913 () Bool)

(assert (=> b!290280 m!303913))

(declare-fun m!303915 () Bool)

(assert (=> b!290287 m!303915))

(assert (=> b!290283 m!303915))

(declare-fun m!303917 () Bool)

(assert (=> d!66129 m!303917))

(assert (=> d!66129 m!303865))

(assert (=> b!290286 m!303915))

(assert (=> b!290206 d!66129))

(declare-fun b!290299 () Bool)

(declare-fun e!183683 () SeekEntryResult!2095)

(assert (=> b!290299 (= e!183683 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143264 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!290300 () Bool)

(declare-fun e!183685 () Bool)

(declare-fun lt!143303 () SeekEntryResult!2095)

(assert (=> b!290300 (= e!183685 (bvsge (x!28755 lt!143303) #b01111111111111111111111111111110))))

(declare-fun b!290301 () Bool)

(assert (=> b!290301 (= e!183683 (Intermediate!2095 false lt!143264 #b00000000000000000000000000000000))))

(declare-fun b!290302 () Bool)

(assert (=> b!290302 (and (bvsge (index!10552 lt!143303) #b00000000000000000000000000000000) (bvslt (index!10552 lt!143303) (size!7300 a!3312)))))

(declare-fun res!151756 () Bool)

(assert (=> b!290302 (= res!151756 (= (select (arr!6947 a!3312) (index!10552 lt!143303)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183684 () Bool)

(assert (=> b!290302 (=> res!151756 e!183684)))

(declare-fun d!66137 () Bool)

(assert (=> d!66137 e!183685))

(declare-fun c!46835 () Bool)

(assert (=> d!66137 (= c!46835 (and (is-Intermediate!2095 lt!143303) (undefined!2907 lt!143303)))))

(declare-fun e!183687 () SeekEntryResult!2095)

(assert (=> d!66137 (= lt!143303 e!183687)))

(declare-fun c!46833 () Bool)

(assert (=> d!66137 (= c!46833 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!143304 () (_ BitVec 64))

(assert (=> d!66137 (= lt!143304 (select (arr!6947 a!3312) lt!143264))))

(assert (=> d!66137 (validMask!0 mask!3809)))

(assert (=> d!66137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143264 k!2524 a!3312 mask!3809) lt!143303)))

(declare-fun b!290303 () Bool)

(assert (=> b!290303 (= e!183687 (Intermediate!2095 true lt!143264 #b00000000000000000000000000000000))))

(declare-fun b!290304 () Bool)

(declare-fun e!183686 () Bool)

(assert (=> b!290304 (= e!183685 e!183686)))

(declare-fun res!151754 () Bool)

(assert (=> b!290304 (= res!151754 (and (is-Intermediate!2095 lt!143303) (not (undefined!2907 lt!143303)) (bvslt (x!28755 lt!143303) #b01111111111111111111111111111110) (bvsge (x!28755 lt!143303) #b00000000000000000000000000000000) (bvsge (x!28755 lt!143303) #b00000000000000000000000000000000)))))

(assert (=> b!290304 (=> (not res!151754) (not e!183686))))

(declare-fun b!290305 () Bool)

(assert (=> b!290305 (and (bvsge (index!10552 lt!143303) #b00000000000000000000000000000000) (bvslt (index!10552 lt!143303) (size!7300 a!3312)))))

(assert (=> b!290305 (= e!183684 (= (select (arr!6947 a!3312) (index!10552 lt!143303)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290306 () Bool)

(assert (=> b!290306 (and (bvsge (index!10552 lt!143303) #b00000000000000000000000000000000) (bvslt (index!10552 lt!143303) (size!7300 a!3312)))))

(declare-fun res!151755 () Bool)

(assert (=> b!290306 (= res!151755 (= (select (arr!6947 a!3312) (index!10552 lt!143303)) k!2524))))

(assert (=> b!290306 (=> res!151755 e!183684)))

(assert (=> b!290306 (= e!183686 e!183684)))

(declare-fun b!290307 () Bool)

(assert (=> b!290307 (= e!183687 e!183683)))

(declare-fun c!46834 () Bool)

(assert (=> b!290307 (= c!46834 (or (= lt!143304 k!2524) (= (bvadd lt!143304 lt!143304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66137 c!46833) b!290303))

(assert (= (and d!66137 (not c!46833)) b!290307))

(assert (= (and b!290307 c!46834) b!290301))

(assert (= (and b!290307 (not c!46834)) b!290299))

(assert (= (and d!66137 c!46835) b!290300))

(assert (= (and d!66137 (not c!46835)) b!290304))

(assert (= (and b!290304 res!151754) b!290306))

(assert (= (and b!290306 (not res!151755)) b!290302))

(assert (= (and b!290302 (not res!151756)) b!290305))

(assert (=> b!290299 m!303911))

(assert (=> b!290299 m!303911))

(declare-fun m!303919 () Bool)

(assert (=> b!290299 m!303919))

(declare-fun m!303921 () Bool)

(assert (=> b!290306 m!303921))

(assert (=> b!290302 m!303921))

(declare-fun m!303923 () Bool)

(assert (=> d!66137 m!303923))

(assert (=> d!66137 m!303865))

(assert (=> b!290305 m!303921))

(assert (=> b!290206 d!66137))

(declare-fun d!66139 () Bool)

(declare-fun lt!143317 () (_ BitVec 32))

(declare-fun lt!143316 () (_ BitVec 32))

(assert (=> d!66139 (= lt!143317 (bvmul (bvxor lt!143316 (bvlshr lt!143316 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66139 (= lt!143316 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66139 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!151763 (let ((h!5227 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28758 (bvmul (bvxor h!5227 (bvlshr h!5227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28758 (bvlshr x!28758 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!151763 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!151763 #b00000000000000000000000000000000))))))

(assert (=> d!66139 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!143317 (bvlshr lt!143317 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!290206 d!66139))

(declare-fun d!66145 () Bool)

(assert (=> d!66145 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28332 d!66145))

(declare-fun d!66155 () Bool)

(assert (=> d!66155 (= (array_inv!4919 a!3312) (bvsge (size!7300 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28332 d!66155))

(declare-fun d!66159 () Bool)

(assert (=> d!66159 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!290212 d!66159))

(declare-fun d!66163 () Bool)

(declare-fun res!151787 () Bool)

(declare-fun e!183723 () Bool)

(assert (=> d!66163 (=> res!151787 e!183723)))

(assert (=> d!66163 (= res!151787 (= (select (arr!6947 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66163 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!183723)))

(declare-fun b!290356 () Bool)

(declare-fun e!183724 () Bool)

(assert (=> b!290356 (= e!183723 e!183724)))

(declare-fun res!151788 () Bool)

(assert (=> b!290356 (=> (not res!151788) (not e!183724))))

(assert (=> b!290356 (= res!151788 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7300 a!3312)))))

(declare-fun b!290357 () Bool)

(assert (=> b!290357 (= e!183724 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66163 (not res!151787)) b!290356))

(assert (= (and b!290356 res!151788) b!290357))

(declare-fun m!303959 () Bool)

(assert (=> d!66163 m!303959))

(declare-fun m!303961 () Bool)

(assert (=> b!290357 m!303961))

(assert (=> b!290213 d!66163))

(declare-fun b!290367 () Bool)

(declare-fun e!183732 () Bool)

(declare-fun e!183733 () Bool)

(assert (=> b!290367 (= e!183732 e!183733)))

(declare-fun c!46849 () Bool)

(assert (=> b!290367 (= c!46849 (validKeyInArray!0 (select (arr!6947 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!290368 () Bool)

(declare-fun e!183731 () Bool)

(assert (=> b!290368 (= e!183733 e!183731)))

(declare-fun lt!143332 () (_ BitVec 64))

(assert (=> b!290368 (= lt!143332 (select (arr!6947 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9090 0))(
  ( (Unit!9091) )
))
(declare-fun lt!143330 () Unit!9090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14639 (_ BitVec 64) (_ BitVec 32)) Unit!9090)

(assert (=> b!290368 (= lt!143330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!143332 #b00000000000000000000000000000000))))

(assert (=> b!290368 (arrayContainsKey!0 a!3312 lt!143332 #b00000000000000000000000000000000)))

(declare-fun lt!143331 () Unit!9090)

(assert (=> b!290368 (= lt!143331 lt!143330)))

(declare-fun res!151794 () Bool)

(assert (=> b!290368 (= res!151794 (= (seekEntryOrOpen!0 (select (arr!6947 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2095 #b00000000000000000000000000000000)))))

(assert (=> b!290368 (=> (not res!151794) (not e!183731))))

(declare-fun b!290369 () Bool)

(declare-fun call!25612 () Bool)

(assert (=> b!290369 (= e!183731 call!25612)))

(declare-fun bm!25609 () Bool)

(assert (=> bm!25609 (= call!25612 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!290366 () Bool)

(assert (=> b!290366 (= e!183733 call!25612)))

(declare-fun d!66167 () Bool)

(declare-fun res!151793 () Bool)

(assert (=> d!66167 (=> res!151793 e!183732)))

(assert (=> d!66167 (= res!151793 (bvsge #b00000000000000000000000000000000 (size!7300 a!3312)))))

(assert (=> d!66167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!183732)))

(assert (= (and d!66167 (not res!151793)) b!290367))

(assert (= (and b!290367 c!46849) b!290368))

(assert (= (and b!290367 (not c!46849)) b!290366))

(assert (= (and b!290368 res!151794) b!290369))

(assert (= (or b!290369 b!290366) bm!25609))

(assert (=> b!290367 m!303959))

(assert (=> b!290367 m!303959))

(declare-fun m!303963 () Bool)

(assert (=> b!290367 m!303963))

(assert (=> b!290368 m!303959))

(declare-fun m!303965 () Bool)

(assert (=> b!290368 m!303965))

(declare-fun m!303967 () Bool)

(assert (=> b!290368 m!303967))

(assert (=> b!290368 m!303959))

(declare-fun m!303969 () Bool)

(assert (=> b!290368 m!303969))

(declare-fun m!303971 () Bool)

(assert (=> bm!25609 m!303971))

(assert (=> b!290209 d!66167))

(push 1)

(assert (not b!290299))

(assert (not d!66129))

(assert (not b!290241))

(assert (not d!66127))

(assert (not bm!25609))

(assert (not b!290368))

(assert (not b!290357))

(assert (not b!290367))

(assert (not b!290280))

(assert (not d!66137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

