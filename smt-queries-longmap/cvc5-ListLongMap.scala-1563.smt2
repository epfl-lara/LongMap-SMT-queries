; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29770 () Bool)

(assert start!29770)

(declare-fun b!299871 () Bool)

(declare-fun res!158048 () Bool)

(declare-fun e!189391 () Bool)

(assert (=> b!299871 (=> (not res!158048) (not e!189391))))

(declare-datatypes ((array!15138 0))(
  ( (array!15139 (arr!7166 (Array (_ BitVec 32) (_ BitVec 64))) (size!7518 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15138)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15138 (_ BitVec 32)) Bool)

(assert (=> b!299871 (= res!158048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299872 () Bool)

(declare-fun e!189389 () Bool)

(assert (=> b!299872 (= e!189389 e!189391)))

(declare-fun res!158047 () Bool)

(assert (=> b!299872 (=> (not res!158047) (not e!189391))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2315 0))(
  ( (MissingZero!2315 (index!11436 (_ BitVec 32))) (Found!2315 (index!11437 (_ BitVec 32))) (Intermediate!2315 (undefined!3127 Bool) (index!11438 (_ BitVec 32)) (x!29689 (_ BitVec 32))) (Undefined!2315) (MissingVacant!2315 (index!11439 (_ BitVec 32))) )
))
(declare-fun lt!149135 () SeekEntryResult!2315)

(declare-fun lt!149138 () Bool)

(assert (=> b!299872 (= res!158047 (or lt!149138 (= lt!149135 (MissingVacant!2315 i!1256))))))

(assert (=> b!299872 (= lt!149138 (= lt!149135 (MissingZero!2315 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15138 (_ BitVec 32)) SeekEntryResult!2315)

(assert (=> b!299872 (= lt!149135 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!299873 () Bool)

(declare-fun res!158049 () Bool)

(assert (=> b!299873 (=> (not res!158049) (not e!189389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299873 (= res!158049 (validKeyInArray!0 k!2524))))

(declare-fun res!158045 () Bool)

(assert (=> start!29770 (=> (not res!158045) (not e!189389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29770 (= res!158045 (validMask!0 mask!3809))))

(assert (=> start!29770 e!189389))

(assert (=> start!29770 true))

(declare-fun array_inv!5129 (array!15138) Bool)

(assert (=> start!29770 (array_inv!5129 a!3312)))

(declare-fun b!299874 () Bool)

(declare-fun res!158046 () Bool)

(assert (=> b!299874 (=> (not res!158046) (not e!189389))))

(declare-fun arrayContainsKey!0 (array!15138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299874 (= res!158046 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299875 () Bool)

(declare-fun res!158044 () Bool)

(assert (=> b!299875 (=> (not res!158044) (not e!189389))))

(assert (=> b!299875 (= res!158044 (and (= (size!7518 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7518 a!3312))))))

(declare-fun b!299876 () Bool)

(declare-fun lt!149137 () SeekEntryResult!2315)

(assert (=> b!299876 (= e!189391 (and (not lt!149138) (= lt!149135 (MissingVacant!2315 i!1256)) (let ((bdg!6452 (not (is-Intermediate!2315 lt!149137)))) (and (or bdg!6452 (not (undefined!3127 lt!149137))) (or bdg!6452 (not (= (select (arr!7166 a!3312) (index!11438 lt!149137)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6452) (= (select (arr!7166 a!3312) (index!11438 lt!149137)) k!2524)))))))

(declare-fun lt!149139 () (_ BitVec 32))

(declare-fun lt!149136 () SeekEntryResult!2315)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15138 (_ BitVec 32)) SeekEntryResult!2315)

(assert (=> b!299876 (= lt!149136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149139 k!2524 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312)) mask!3809))))

(assert (=> b!299876 (= lt!149137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149139 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299876 (= lt!149139 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29770 res!158045) b!299875))

(assert (= (and b!299875 res!158044) b!299873))

(assert (= (and b!299873 res!158049) b!299874))

(assert (= (and b!299874 res!158046) b!299872))

(assert (= (and b!299872 res!158047) b!299871))

(assert (= (and b!299871 res!158048) b!299876))

(declare-fun m!311997 () Bool)

(assert (=> b!299873 m!311997))

(declare-fun m!311999 () Bool)

(assert (=> start!29770 m!311999))

(declare-fun m!312001 () Bool)

(assert (=> start!29770 m!312001))

(declare-fun m!312003 () Bool)

(assert (=> b!299874 m!312003))

(declare-fun m!312005 () Bool)

(assert (=> b!299871 m!312005))

(declare-fun m!312007 () Bool)

(assert (=> b!299872 m!312007))

(declare-fun m!312009 () Bool)

(assert (=> b!299876 m!312009))

(declare-fun m!312011 () Bool)

(assert (=> b!299876 m!312011))

(declare-fun m!312013 () Bool)

(assert (=> b!299876 m!312013))

(declare-fun m!312015 () Bool)

(assert (=> b!299876 m!312015))

(declare-fun m!312017 () Bool)

(assert (=> b!299876 m!312017))

(push 1)

(assert (not b!299873))

(assert (not b!299871))

(assert (not b!299872))

(assert (not b!299876))

(assert (not b!299874))

(assert (not start!29770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67659 () Bool)

(assert (=> d!67659 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29770 d!67659))

(declare-fun d!67667 () Bool)

(assert (=> d!67667 (= (array_inv!5129 a!3312) (bvsge (size!7518 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29770 d!67667))

(declare-fun b!299945 () Bool)

(declare-fun e!189432 () Bool)

(declare-fun call!25840 () Bool)

(assert (=> b!299945 (= e!189432 call!25840)))

(declare-fun bm!25837 () Bool)

(assert (=> bm!25837 (= call!25840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299946 () Bool)

(declare-fun e!189434 () Bool)

(assert (=> b!299946 (= e!189434 call!25840)))

(declare-fun b!299947 () Bool)

(assert (=> b!299947 (= e!189432 e!189434)))

(declare-fun lt!149182 () (_ BitVec 64))

(assert (=> b!299947 (= lt!149182 (select (arr!7166 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9357 0))(
  ( (Unit!9358) )
))
(declare-fun lt!149181 () Unit!9357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15138 (_ BitVec 64) (_ BitVec 32)) Unit!9357)

(assert (=> b!299947 (= lt!149181 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149182 #b00000000000000000000000000000000))))

(assert (=> b!299947 (arrayContainsKey!0 a!3312 lt!149182 #b00000000000000000000000000000000)))

(declare-fun lt!149180 () Unit!9357)

(assert (=> b!299947 (= lt!149180 lt!149181)))

(declare-fun res!158102 () Bool)

(assert (=> b!299947 (= res!158102 (= (seekEntryOrOpen!0 (select (arr!7166 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2315 #b00000000000000000000000000000000)))))

(assert (=> b!299947 (=> (not res!158102) (not e!189434))))

(declare-fun b!299948 () Bool)

(declare-fun e!189433 () Bool)

(assert (=> b!299948 (= e!189433 e!189432)))

(declare-fun c!48513 () Bool)

(assert (=> b!299948 (= c!48513 (validKeyInArray!0 (select (arr!7166 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67669 () Bool)

(declare-fun res!158103 () Bool)

(assert (=> d!67669 (=> res!158103 e!189433)))

(assert (=> d!67669 (= res!158103 (bvsge #b00000000000000000000000000000000 (size!7518 a!3312)))))

(assert (=> d!67669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189433)))

(assert (= (and d!67669 (not res!158103)) b!299948))

(assert (= (and b!299948 c!48513) b!299947))

(assert (= (and b!299948 (not c!48513)) b!299945))

(assert (= (and b!299947 res!158102) b!299946))

(assert (= (or b!299946 b!299945) bm!25837))

(declare-fun m!312067 () Bool)

(assert (=> bm!25837 m!312067))

(declare-fun m!312069 () Bool)

(assert (=> b!299947 m!312069))

(declare-fun m!312071 () Bool)

(assert (=> b!299947 m!312071))

(declare-fun m!312073 () Bool)

(assert (=> b!299947 m!312073))

(assert (=> b!299947 m!312069))

(declare-fun m!312075 () Bool)

(assert (=> b!299947 m!312075))

(assert (=> b!299948 m!312069))

(assert (=> b!299948 m!312069))

(declare-fun m!312077 () Bool)

(assert (=> b!299948 m!312077))

(assert (=> b!299871 d!67669))

(declare-fun lt!149216 () SeekEntryResult!2315)

(declare-fun b!300021 () Bool)

(assert (=> b!300021 (and (bvsge (index!11438 lt!149216) #b00000000000000000000000000000000) (bvslt (index!11438 lt!149216) (size!7518 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312)))))))

(declare-fun e!189481 () Bool)

(assert (=> b!300021 (= e!189481 (= (select (arr!7166 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312))) (index!11438 lt!149216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300022 () Bool)

(declare-fun e!189483 () Bool)

(declare-fun e!189480 () Bool)

(assert (=> b!300022 (= e!189483 e!189480)))

(declare-fun res!158129 () Bool)

(assert (=> b!300022 (= res!158129 (and (is-Intermediate!2315 lt!149216) (not (undefined!3127 lt!149216)) (bvslt (x!29689 lt!149216) #b01111111111111111111111111111110) (bvsge (x!29689 lt!149216) #b00000000000000000000000000000000) (bvsge (x!29689 lt!149216) #b00000000000000000000000000000000)))))

(assert (=> b!300022 (=> (not res!158129) (not e!189480))))

(declare-fun b!300024 () Bool)

(assert (=> b!300024 (and (bvsge (index!11438 lt!149216) #b00000000000000000000000000000000) (bvslt (index!11438 lt!149216) (size!7518 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312)))))))

(declare-fun res!158131 () Bool)

(assert (=> b!300024 (= res!158131 (= (select (arr!7166 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312))) (index!11438 lt!149216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300024 (=> res!158131 e!189481)))

(declare-fun e!189482 () SeekEntryResult!2315)

(declare-fun b!300025 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300025 (= e!189482 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149139 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312)) mask!3809))))

(declare-fun b!300026 () Bool)

(assert (=> b!300026 (= e!189482 (Intermediate!2315 false lt!149139 #b00000000000000000000000000000000))))

(declare-fun b!300027 () Bool)

(assert (=> b!300027 (= e!189483 (bvsge (x!29689 lt!149216) #b01111111111111111111111111111110))))

(declare-fun b!300023 () Bool)

(assert (=> b!300023 (and (bvsge (index!11438 lt!149216) #b00000000000000000000000000000000) (bvslt (index!11438 lt!149216) (size!7518 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312)))))))

(declare-fun res!158130 () Bool)

(assert (=> b!300023 (= res!158130 (= (select (arr!7166 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312))) (index!11438 lt!149216)) k!2524))))

(assert (=> b!300023 (=> res!158130 e!189481)))

(assert (=> b!300023 (= e!189480 e!189481)))

(declare-fun d!67671 () Bool)

(assert (=> d!67671 e!189483))

(declare-fun c!48540 () Bool)

(assert (=> d!67671 (= c!48540 (and (is-Intermediate!2315 lt!149216) (undefined!3127 lt!149216)))))

(declare-fun e!189479 () SeekEntryResult!2315)

(assert (=> d!67671 (= lt!149216 e!189479)))

(declare-fun c!48539 () Bool)

(assert (=> d!67671 (= c!48539 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149215 () (_ BitVec 64))

(assert (=> d!67671 (= lt!149215 (select (arr!7166 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312))) lt!149139))))

(assert (=> d!67671 (validMask!0 mask!3809)))

(assert (=> d!67671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149139 k!2524 (array!15139 (store (arr!7166 a!3312) i!1256 k!2524) (size!7518 a!3312)) mask!3809) lt!149216)))

(declare-fun b!300028 () Bool)

(assert (=> b!300028 (= e!189479 e!189482)))

(declare-fun c!48538 () Bool)

(assert (=> b!300028 (= c!48538 (or (= lt!149215 k!2524) (= (bvadd lt!149215 lt!149215) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300029 () Bool)

(assert (=> b!300029 (= e!189479 (Intermediate!2315 true lt!149139 #b00000000000000000000000000000000))))

(assert (= (and d!67671 c!48539) b!300029))

(assert (= (and d!67671 (not c!48539)) b!300028))

(assert (= (and b!300028 c!48538) b!300026))

(assert (= (and b!300028 (not c!48538)) b!300025))

(assert (= (and d!67671 c!48540) b!300027))

(assert (= (and d!67671 (not c!48540)) b!300022))

(assert (= (and b!300022 res!158129) b!300023))

(assert (= (and b!300023 (not res!158130)) b!300024))

(assert (= (and b!300024 (not res!158131)) b!300021))

(declare-fun m!312119 () Bool)

(assert (=> b!300023 m!312119))

(assert (=> b!300021 m!312119))

(declare-fun m!312121 () Bool)

(assert (=> b!300025 m!312121))

(assert (=> b!300025 m!312121))

(declare-fun m!312123 () Bool)

(assert (=> b!300025 m!312123))

(declare-fun m!312125 () Bool)

(assert (=> d!67671 m!312125))

(assert (=> d!67671 m!311999))

(assert (=> b!300024 m!312119))

(assert (=> b!299876 d!67671))

(declare-fun b!300030 () Bool)

(declare-fun lt!149218 () SeekEntryResult!2315)

(assert (=> b!300030 (and (bvsge (index!11438 lt!149218) #b00000000000000000000000000000000) (bvslt (index!11438 lt!149218) (size!7518 a!3312)))))

(declare-fun e!189486 () Bool)

(assert (=> b!300030 (= e!189486 (= (select (arr!7166 a!3312) (index!11438 lt!149218)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300031 () Bool)

(declare-fun e!189488 () Bool)

(declare-fun e!189485 () Bool)

(assert (=> b!300031 (= e!189488 e!189485)))

(declare-fun res!158132 () Bool)

(assert (=> b!300031 (= res!158132 (and (is-Intermediate!2315 lt!149218) (not (undefined!3127 lt!149218)) (bvslt (x!29689 lt!149218) #b01111111111111111111111111111110) (bvsge (x!29689 lt!149218) #b00000000000000000000000000000000) (bvsge (x!29689 lt!149218) #b00000000000000000000000000000000)))))

(assert (=> b!300031 (=> (not res!158132) (not e!189485))))

(declare-fun b!300033 () Bool)

(assert (=> b!300033 (and (bvsge (index!11438 lt!149218) #b00000000000000000000000000000000) (bvslt (index!11438 lt!149218) (size!7518 a!3312)))))

(declare-fun res!158134 () Bool)

(assert (=> b!300033 (= res!158134 (= (select (arr!7166 a!3312) (index!11438 lt!149218)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300033 (=> res!158134 e!189486)))

(declare-fun b!300034 () Bool)

(declare-fun e!189487 () SeekEntryResult!2315)

(assert (=> b!300034 (= e!189487 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149139 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!300035 () Bool)

(assert (=> b!300035 (= e!189487 (Intermediate!2315 false lt!149139 #b00000000000000000000000000000000))))

(declare-fun b!300036 () Bool)

(assert (=> b!300036 (= e!189488 (bvsge (x!29689 lt!149218) #b01111111111111111111111111111110))))

(declare-fun b!300032 () Bool)

(assert (=> b!300032 (and (bvsge (index!11438 lt!149218) #b00000000000000000000000000000000) (bvslt (index!11438 lt!149218) (size!7518 a!3312)))))

(declare-fun res!158133 () Bool)

(assert (=> b!300032 (= res!158133 (= (select (arr!7166 a!3312) (index!11438 lt!149218)) k!2524))))

(assert (=> b!300032 (=> res!158133 e!189486)))

(assert (=> b!300032 (= e!189485 e!189486)))

(declare-fun d!67685 () Bool)

(assert (=> d!67685 e!189488))

(declare-fun c!48543 () Bool)

(assert (=> d!67685 (= c!48543 (and (is-Intermediate!2315 lt!149218) (undefined!3127 lt!149218)))))

(declare-fun e!189484 () SeekEntryResult!2315)

(assert (=> d!67685 (= lt!149218 e!189484)))

(declare-fun c!48542 () Bool)

(assert (=> d!67685 (= c!48542 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149217 () (_ BitVec 64))

(assert (=> d!67685 (= lt!149217 (select (arr!7166 a!3312) lt!149139))))

(assert (=> d!67685 (validMask!0 mask!3809)))

(assert (=> d!67685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149139 k!2524 a!3312 mask!3809) lt!149218)))

(declare-fun b!300037 () Bool)

(assert (=> b!300037 (= e!189484 e!189487)))

(declare-fun c!48541 () Bool)

(assert (=> b!300037 (= c!48541 (or (= lt!149217 k!2524) (= (bvadd lt!149217 lt!149217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300038 () Bool)

(assert (=> b!300038 (= e!189484 (Intermediate!2315 true lt!149139 #b00000000000000000000000000000000))))

(assert (= (and d!67685 c!48542) b!300038))

(assert (= (and d!67685 (not c!48542)) b!300037))

(assert (= (and b!300037 c!48541) b!300035))

(assert (= (and b!300037 (not c!48541)) b!300034))

(assert (= (and d!67685 c!48543) b!300036))

(assert (= (and d!67685 (not c!48543)) b!300031))

(assert (= (and b!300031 res!158132) b!300032))

(assert (= (and b!300032 (not res!158133)) b!300033))

(assert (= (and b!300033 (not res!158134)) b!300030))

(declare-fun m!312127 () Bool)

(assert (=> b!300032 m!312127))

(assert (=> b!300030 m!312127))

(assert (=> b!300034 m!312121))

(assert (=> b!300034 m!312121))

(declare-fun m!312129 () Bool)

(assert (=> b!300034 m!312129))

(declare-fun m!312131 () Bool)

(assert (=> d!67685 m!312131))

(assert (=> d!67685 m!311999))

(assert (=> b!300033 m!312127))

(assert (=> b!299876 d!67685))

(declare-fun d!67687 () Bool)

(declare-fun lt!149224 () (_ BitVec 32))

(declare-fun lt!149223 () (_ BitVec 32))

(assert (=> d!67687 (= lt!149224 (bvmul (bvxor lt!149223 (bvlshr lt!149223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67687 (= lt!149223 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67687 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158135 (let ((h!5320 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29695 (bvmul (bvxor h!5320 (bvlshr h!5320 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29695 (bvlshr x!29695 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158135 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158135 #b00000000000000000000000000000000))))))

(assert (=> d!67687 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!149224 (bvlshr lt!149224 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299876 d!67687))

(declare-fun d!67689 () Bool)

(declare-fun lt!149256 () SeekEntryResult!2315)

(assert (=> d!67689 (and (or (is-Undefined!2315 lt!149256) (not (is-Found!2315 lt!149256)) (and (bvsge (index!11437 lt!149256) #b00000000000000000000000000000000) (bvslt (index!11437 lt!149256) (size!7518 a!3312)))) (or (is-Undefined!2315 lt!149256) (is-Found!2315 lt!149256) (not (is-MissingZero!2315 lt!149256)) (and (bvsge (index!11436 lt!149256) #b00000000000000000000000000000000) (bvslt (index!11436 lt!149256) (size!7518 a!3312)))) (or (is-Undefined!2315 lt!149256) (is-Found!2315 lt!149256) (is-MissingZero!2315 lt!149256) (not (is-MissingVacant!2315 lt!149256)) (and (bvsge (index!11439 lt!149256) #b00000000000000000000000000000000) (bvslt (index!11439 lt!149256) (size!7518 a!3312)))) (or (is-Undefined!2315 lt!149256) (ite (is-Found!2315 lt!149256) (= (select (arr!7166 a!3312) (index!11437 lt!149256)) k!2524) (ite (is-MissingZero!2315 lt!149256) (= (select (arr!7166 a!3312) (index!11436 lt!149256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2315 lt!149256) (= (select (arr!7166 a!3312) (index!11439 lt!149256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189524 () SeekEntryResult!2315)

(assert (=> d!67689 (= lt!149256 e!189524)))

(declare-fun c!48573 () Bool)

(declare-fun lt!149254 () SeekEntryResult!2315)

(assert (=> d!67689 (= c!48573 (and (is-Intermediate!2315 lt!149254) (undefined!3127 lt!149254)))))

(assert (=> d!67689 (= lt!149254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67689 (validMask!0 mask!3809)))

(assert (=> d!67689 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149256)))

(declare-fun b!300105 () Bool)

(assert (=> b!300105 (= e!189524 Undefined!2315)))

(declare-fun e!189526 () SeekEntryResult!2315)

(declare-fun b!300106 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15138 (_ BitVec 32)) SeekEntryResult!2315)

(assert (=> b!300106 (= e!189526 (seekKeyOrZeroReturnVacant!0 (x!29689 lt!149254) (index!11438 lt!149254) (index!11438 lt!149254) k!2524 a!3312 mask!3809))))

(declare-fun b!300107 () Bool)

(assert (=> b!300107 (= e!189526 (MissingZero!2315 (index!11438 lt!149254)))))

(declare-fun b!300108 () Bool)

(declare-fun c!48572 () Bool)

(declare-fun lt!149255 () (_ BitVec 64))

(assert (=> b!300108 (= c!48572 (= lt!149255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189525 () SeekEntryResult!2315)

(assert (=> b!300108 (= e!189525 e!189526)))

(declare-fun b!300109 () Bool)

(assert (=> b!300109 (= e!189525 (Found!2315 (index!11438 lt!149254)))))

(declare-fun b!300110 () Bool)

(assert (=> b!300110 (= e!189524 e!189525)))

(assert (=> b!300110 (= lt!149255 (select (arr!7166 a!3312) (index!11438 lt!149254)))))

(declare-fun c!48571 () Bool)

(assert (=> b!300110 (= c!48571 (= lt!149255 k!2524))))

(assert (= (and d!67689 c!48573) b!300105))

(assert (= (and d!67689 (not c!48573)) b!300110))

(assert (= (and b!300110 c!48571) b!300109))

(assert (= (and b!300110 (not c!48571)) b!300108))

(assert (= (and b!300108 c!48572) b!300107))

(assert (= (and b!300108 (not c!48572)) b!300106))

(declare-fun m!312159 () Bool)

(assert (=> d!67689 m!312159))

(assert (=> d!67689 m!312017))

(assert (=> d!67689 m!311999))

(declare-fun m!312161 () Bool)

(assert (=> d!67689 m!312161))

(declare-fun m!312163 () Bool)

(assert (=> d!67689 m!312163))

(assert (=> d!67689 m!312017))

(declare-fun m!312165 () Bool)

(assert (=> d!67689 m!312165))

(declare-fun m!312167 () Bool)

(assert (=> b!300106 m!312167))

(declare-fun m!312169 () Bool)

(assert (=> b!300110 m!312169))

(assert (=> b!299872 d!67689))

(declare-fun d!67701 () Bool)

(declare-fun res!158153 () Bool)

(declare-fun e!189531 () Bool)

(assert (=> d!67701 (=> res!158153 e!189531)))

(assert (=> d!67701 (= res!158153 (= (select (arr!7166 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67701 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!189531)))

(declare-fun b!300115 () Bool)

(declare-fun e!189532 () Bool)

(assert (=> b!300115 (= e!189531 e!189532)))

(declare-fun res!158154 () Bool)

(assert (=> b!300115 (=> (not res!158154) (not e!189532))))

(assert (=> b!300115 (= res!158154 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7518 a!3312)))))

(declare-fun b!300116 () Bool)

(assert (=> b!300116 (= e!189532 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67701 (not res!158153)) b!300115))

(assert (= (and b!300115 res!158154) b!300116))

(assert (=> d!67701 m!312069))

(declare-fun m!312171 () Bool)

(assert (=> b!300116 m!312171))

(assert (=> b!299874 d!67701))

(declare-fun d!67705 () Bool)

(assert (=> d!67705 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299873 d!67705))

(push 1)

