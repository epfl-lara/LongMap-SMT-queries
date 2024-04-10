; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50260 () Bool)

(assert start!50260)

(declare-fun b!550241 () Bool)

(declare-fun res!343385 () Bool)

(declare-fun e!317633 () Bool)

(assert (=> b!550241 (=> (not res!343385) (not e!317633))))

(declare-datatypes ((array!34713 0))(
  ( (array!34714 (arr!16672 (Array (_ BitVec 32) (_ BitVec 64))) (size!17036 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34713)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34713 (_ BitVec 32)) Bool)

(assert (=> b!550241 (= res!343385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!317632 () Bool)

(declare-fun b!550242 () Bool)

(declare-datatypes ((SeekEntryResult!5121 0))(
  ( (MissingZero!5121 (index!22711 (_ BitVec 32))) (Found!5121 (index!22712 (_ BitVec 32))) (Intermediate!5121 (undefined!5933 Bool) (index!22713 (_ BitVec 32)) (x!51635 (_ BitVec 32))) (Undefined!5121) (MissingVacant!5121 (index!22714 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34713 (_ BitVec 32)) SeekEntryResult!5121)

(assert (=> b!550242 (= e!317632 (= (seekEntryOrOpen!0 (select (arr!16672 a!3118) j!142) a!3118 mask!3119) (Found!5121 j!142)))))

(declare-fun b!550243 () Bool)

(assert (=> b!550243 (= e!317633 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(assert (=> b!550243 e!317632))

(declare-fun res!343391 () Bool)

(assert (=> b!550243 (=> (not res!343391) (not e!317632))))

(assert (=> b!550243 (= res!343391 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17016 0))(
  ( (Unit!17017) )
))
(declare-fun lt!250441 () Unit!17016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17016)

(assert (=> b!550243 (= lt!250441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550244 () Bool)

(declare-fun res!343393 () Bool)

(assert (=> b!550244 (=> (not res!343393) (not e!317633))))

(declare-datatypes ((List!10752 0))(
  ( (Nil!10749) (Cons!10748 (h!11721 (_ BitVec 64)) (t!16980 List!10752)) )
))
(declare-fun arrayNoDuplicates!0 (array!34713 (_ BitVec 32) List!10752) Bool)

(assert (=> b!550244 (= res!343393 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10749))))

(declare-fun b!550245 () Bool)

(declare-fun res!343388 () Bool)

(declare-fun e!317634 () Bool)

(assert (=> b!550245 (=> (not res!343388) (not e!317634))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550245 (= res!343388 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550246 () Bool)

(declare-fun res!343392 () Bool)

(assert (=> b!550246 (=> (not res!343392) (not e!317634))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550246 (= res!343392 (and (= (size!17036 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17036 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17036 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!343387 () Bool)

(assert (=> start!50260 (=> (not res!343387) (not e!317634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50260 (= res!343387 (validMask!0 mask!3119))))

(assert (=> start!50260 e!317634))

(assert (=> start!50260 true))

(declare-fun array_inv!12468 (array!34713) Bool)

(assert (=> start!50260 (array_inv!12468 a!3118)))

(declare-fun b!550247 () Bool)

(declare-fun res!343389 () Bool)

(assert (=> b!550247 (=> (not res!343389) (not e!317633))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34713 (_ BitVec 32)) SeekEntryResult!5121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550247 (= res!343389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) (select (arr!16672 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)) mask!3119)))))

(declare-fun b!550248 () Bool)

(assert (=> b!550248 (= e!317634 e!317633)))

(declare-fun res!343394 () Bool)

(assert (=> b!550248 (=> (not res!343394) (not e!317633))))

(declare-fun lt!250440 () SeekEntryResult!5121)

(assert (=> b!550248 (= res!343394 (or (= lt!250440 (MissingZero!5121 i!1132)) (= lt!250440 (MissingVacant!5121 i!1132))))))

(assert (=> b!550248 (= lt!250440 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550249 () Bool)

(declare-fun res!343390 () Bool)

(assert (=> b!550249 (=> (not res!343390) (not e!317634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550249 (= res!343390 (validKeyInArray!0 (select (arr!16672 a!3118) j!142)))))

(declare-fun b!550250 () Bool)

(declare-fun res!343386 () Bool)

(assert (=> b!550250 (=> (not res!343386) (not e!317634))))

(assert (=> b!550250 (= res!343386 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50260 res!343387) b!550246))

(assert (= (and b!550246 res!343392) b!550249))

(assert (= (and b!550249 res!343390) b!550250))

(assert (= (and b!550250 res!343386) b!550245))

(assert (= (and b!550245 res!343388) b!550248))

(assert (= (and b!550248 res!343394) b!550241))

(assert (= (and b!550241 res!343385) b!550244))

(assert (= (and b!550244 res!343393) b!550247))

(assert (= (and b!550247 res!343389) b!550243))

(assert (= (and b!550243 res!343391) b!550242))

(declare-fun m!527283 () Bool)

(assert (=> b!550245 m!527283))

(declare-fun m!527285 () Bool)

(assert (=> b!550241 m!527285))

(declare-fun m!527287 () Bool)

(assert (=> b!550250 m!527287))

(declare-fun m!527289 () Bool)

(assert (=> b!550248 m!527289))

(declare-fun m!527291 () Bool)

(assert (=> start!50260 m!527291))

(declare-fun m!527293 () Bool)

(assert (=> start!50260 m!527293))

(declare-fun m!527295 () Bool)

(assert (=> b!550243 m!527295))

(declare-fun m!527297 () Bool)

(assert (=> b!550243 m!527297))

(declare-fun m!527299 () Bool)

(assert (=> b!550242 m!527299))

(assert (=> b!550242 m!527299))

(declare-fun m!527301 () Bool)

(assert (=> b!550242 m!527301))

(assert (=> b!550247 m!527299))

(declare-fun m!527303 () Bool)

(assert (=> b!550247 m!527303))

(assert (=> b!550247 m!527299))

(declare-fun m!527305 () Bool)

(assert (=> b!550247 m!527305))

(declare-fun m!527307 () Bool)

(assert (=> b!550247 m!527307))

(assert (=> b!550247 m!527305))

(declare-fun m!527309 () Bool)

(assert (=> b!550247 m!527309))

(assert (=> b!550247 m!527303))

(assert (=> b!550247 m!527299))

(declare-fun m!527311 () Bool)

(assert (=> b!550247 m!527311))

(declare-fun m!527313 () Bool)

(assert (=> b!550247 m!527313))

(assert (=> b!550247 m!527305))

(assert (=> b!550247 m!527307))

(assert (=> b!550249 m!527299))

(assert (=> b!550249 m!527299))

(declare-fun m!527315 () Bool)

(assert (=> b!550249 m!527315))

(declare-fun m!527317 () Bool)

(assert (=> b!550244 m!527317))

(check-sat (not start!50260) (not b!550241) (not b!550242) (not b!550248) (not b!550243) (not b!550245) (not b!550247) (not b!550250) (not b!550249) (not b!550244))
(check-sat)
(get-model)

(declare-fun b!550289 () Bool)

(declare-fun e!317653 () Bool)

(declare-fun call!32249 () Bool)

(assert (=> b!550289 (= e!317653 call!32249)))

(declare-fun bm!32246 () Bool)

(assert (=> bm!32246 (= call!32249 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!550290 () Bool)

(declare-fun e!317655 () Bool)

(assert (=> b!550290 (= e!317655 call!32249)))

(declare-fun b!550291 () Bool)

(assert (=> b!550291 (= e!317655 e!317653)))

(declare-fun lt!250456 () (_ BitVec 64))

(assert (=> b!550291 (= lt!250456 (select (arr!16672 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250454 () Unit!17016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34713 (_ BitVec 64) (_ BitVec 32)) Unit!17016)

(assert (=> b!550291 (= lt!250454 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250456 #b00000000000000000000000000000000))))

(assert (=> b!550291 (arrayContainsKey!0 a!3118 lt!250456 #b00000000000000000000000000000000)))

(declare-fun lt!250455 () Unit!17016)

(assert (=> b!550291 (= lt!250455 lt!250454)))

(declare-fun res!343430 () Bool)

(assert (=> b!550291 (= res!343430 (= (seekEntryOrOpen!0 (select (arr!16672 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5121 #b00000000000000000000000000000000)))))

(assert (=> b!550291 (=> (not res!343430) (not e!317653))))

(declare-fun b!550292 () Bool)

(declare-fun e!317654 () Bool)

(assert (=> b!550292 (= e!317654 e!317655)))

(declare-fun c!63761 () Bool)

(assert (=> b!550292 (= c!63761 (validKeyInArray!0 (select (arr!16672 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82809 () Bool)

(declare-fun res!343429 () Bool)

(assert (=> d!82809 (=> res!343429 e!317654)))

(assert (=> d!82809 (= res!343429 (bvsge #b00000000000000000000000000000000 (size!17036 a!3118)))))

(assert (=> d!82809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317654)))

(assert (= (and d!82809 (not res!343429)) b!550292))

(assert (= (and b!550292 c!63761) b!550291))

(assert (= (and b!550292 (not c!63761)) b!550290))

(assert (= (and b!550291 res!343430) b!550289))

(assert (= (or b!550289 b!550290) bm!32246))

(declare-fun m!527355 () Bool)

(assert (=> bm!32246 m!527355))

(declare-fun m!527357 () Bool)

(assert (=> b!550291 m!527357))

(declare-fun m!527359 () Bool)

(assert (=> b!550291 m!527359))

(declare-fun m!527361 () Bool)

(assert (=> b!550291 m!527361))

(assert (=> b!550291 m!527357))

(declare-fun m!527363 () Bool)

(assert (=> b!550291 m!527363))

(assert (=> b!550292 m!527357))

(assert (=> b!550292 m!527357))

(declare-fun m!527365 () Bool)

(assert (=> b!550292 m!527365))

(assert (=> b!550241 d!82809))

(declare-fun d!82811 () Bool)

(assert (=> d!82811 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50260 d!82811))

(declare-fun d!82825 () Bool)

(assert (=> d!82825 (= (array_inv!12468 a!3118) (bvsge (size!17036 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50260 d!82825))

(declare-fun d!82827 () Bool)

(declare-fun res!343444 () Bool)

(declare-fun e!317672 () Bool)

(assert (=> d!82827 (=> res!343444 e!317672)))

(assert (=> d!82827 (= res!343444 (= (select (arr!16672 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82827 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!317672)))

(declare-fun b!550312 () Bool)

(declare-fun e!317673 () Bool)

(assert (=> b!550312 (= e!317672 e!317673)))

(declare-fun res!343445 () Bool)

(assert (=> b!550312 (=> (not res!343445) (not e!317673))))

(assert (=> b!550312 (= res!343445 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17036 a!3118)))))

(declare-fun b!550313 () Bool)

(assert (=> b!550313 (= e!317673 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82827 (not res!343444)) b!550312))

(assert (= (and b!550312 res!343445) b!550313))

(assert (=> d!82827 m!527357))

(declare-fun m!527375 () Bool)

(assert (=> b!550313 m!527375))

(assert (=> b!550245 d!82827))

(declare-fun d!82829 () Bool)

(assert (=> d!82829 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550250 d!82829))

(declare-fun d!82831 () Bool)

(assert (=> d!82831 (= (validKeyInArray!0 (select (arr!16672 a!3118) j!142)) (and (not (= (select (arr!16672 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16672 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550249 d!82831))

(declare-fun b!550336 () Bool)

(declare-fun e!317694 () Bool)

(declare-fun contains!2834 (List!10752 (_ BitVec 64)) Bool)

(assert (=> b!550336 (= e!317694 (contains!2834 Nil!10749 (select (arr!16672 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82833 () Bool)

(declare-fun res!343458 () Bool)

(declare-fun e!317693 () Bool)

(assert (=> d!82833 (=> res!343458 e!317693)))

(assert (=> d!82833 (= res!343458 (bvsge #b00000000000000000000000000000000 (size!17036 a!3118)))))

(assert (=> d!82833 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10749) e!317693)))

(declare-fun b!550337 () Bool)

(declare-fun e!317691 () Bool)

(declare-fun call!32258 () Bool)

(assert (=> b!550337 (= e!317691 call!32258)))

(declare-fun b!550338 () Bool)

(assert (=> b!550338 (= e!317691 call!32258)))

(declare-fun bm!32255 () Bool)

(declare-fun c!63770 () Bool)

(assert (=> bm!32255 (= call!32258 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63770 (Cons!10748 (select (arr!16672 a!3118) #b00000000000000000000000000000000) Nil!10749) Nil!10749)))))

(declare-fun b!550339 () Bool)

(declare-fun e!317692 () Bool)

(assert (=> b!550339 (= e!317693 e!317692)))

(declare-fun res!343459 () Bool)

(assert (=> b!550339 (=> (not res!343459) (not e!317692))))

(assert (=> b!550339 (= res!343459 (not e!317694))))

(declare-fun res!343460 () Bool)

(assert (=> b!550339 (=> (not res!343460) (not e!317694))))

(assert (=> b!550339 (= res!343460 (validKeyInArray!0 (select (arr!16672 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550340 () Bool)

(assert (=> b!550340 (= e!317692 e!317691)))

(assert (=> b!550340 (= c!63770 (validKeyInArray!0 (select (arr!16672 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82833 (not res!343458)) b!550339))

(assert (= (and b!550339 res!343460) b!550336))

(assert (= (and b!550339 res!343459) b!550340))

(assert (= (and b!550340 c!63770) b!550338))

(assert (= (and b!550340 (not c!63770)) b!550337))

(assert (= (or b!550338 b!550337) bm!32255))

(assert (=> b!550336 m!527357))

(assert (=> b!550336 m!527357))

(declare-fun m!527385 () Bool)

(assert (=> b!550336 m!527385))

(assert (=> bm!32255 m!527357))

(declare-fun m!527387 () Bool)

(assert (=> bm!32255 m!527387))

(assert (=> b!550339 m!527357))

(assert (=> b!550339 m!527357))

(assert (=> b!550339 m!527365))

(assert (=> b!550340 m!527357))

(assert (=> b!550340 m!527357))

(assert (=> b!550340 m!527365))

(assert (=> b!550244 d!82833))

(declare-fun b!550341 () Bool)

(declare-fun e!317695 () Bool)

(declare-fun call!32259 () Bool)

(assert (=> b!550341 (= e!317695 call!32259)))

(declare-fun bm!32256 () Bool)

(assert (=> bm!32256 (= call!32259 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!550342 () Bool)

(declare-fun e!317697 () Bool)

(assert (=> b!550342 (= e!317697 call!32259)))

(declare-fun b!550343 () Bool)

(assert (=> b!550343 (= e!317697 e!317695)))

(declare-fun lt!250468 () (_ BitVec 64))

(assert (=> b!550343 (= lt!250468 (select (arr!16672 a!3118) j!142))))

(declare-fun lt!250466 () Unit!17016)

(assert (=> b!550343 (= lt!250466 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250468 j!142))))

(assert (=> b!550343 (arrayContainsKey!0 a!3118 lt!250468 #b00000000000000000000000000000000)))

(declare-fun lt!250467 () Unit!17016)

(assert (=> b!550343 (= lt!250467 lt!250466)))

(declare-fun res!343462 () Bool)

(assert (=> b!550343 (= res!343462 (= (seekEntryOrOpen!0 (select (arr!16672 a!3118) j!142) a!3118 mask!3119) (Found!5121 j!142)))))

(assert (=> b!550343 (=> (not res!343462) (not e!317695))))

(declare-fun b!550344 () Bool)

(declare-fun e!317696 () Bool)

(assert (=> b!550344 (= e!317696 e!317697)))

(declare-fun c!63771 () Bool)

(assert (=> b!550344 (= c!63771 (validKeyInArray!0 (select (arr!16672 a!3118) j!142)))))

(declare-fun d!82837 () Bool)

(declare-fun res!343461 () Bool)

(assert (=> d!82837 (=> res!343461 e!317696)))

(assert (=> d!82837 (= res!343461 (bvsge j!142 (size!17036 a!3118)))))

(assert (=> d!82837 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!317696)))

(assert (= (and d!82837 (not res!343461)) b!550344))

(assert (= (and b!550344 c!63771) b!550343))

(assert (= (and b!550344 (not c!63771)) b!550342))

(assert (= (and b!550343 res!343462) b!550341))

(assert (= (or b!550341 b!550342) bm!32256))

(declare-fun m!527389 () Bool)

(assert (=> bm!32256 m!527389))

(assert (=> b!550343 m!527299))

(declare-fun m!527391 () Bool)

(assert (=> b!550343 m!527391))

(declare-fun m!527393 () Bool)

(assert (=> b!550343 m!527393))

(assert (=> b!550343 m!527299))

(assert (=> b!550343 m!527301))

(assert (=> b!550344 m!527299))

(assert (=> b!550344 m!527299))

(assert (=> b!550344 m!527315))

(assert (=> b!550243 d!82837))

(declare-fun d!82839 () Bool)

(assert (=> d!82839 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250477 () Unit!17016)

(declare-fun choose!38 (array!34713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17016)

(assert (=> d!82839 (= lt!250477 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82839 (validMask!0 mask!3119)))

(assert (=> d!82839 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250477)))

(declare-fun bs!17152 () Bool)

(assert (= bs!17152 d!82839))

(assert (=> bs!17152 m!527295))

(declare-fun m!527395 () Bool)

(assert (=> bs!17152 m!527395))

(assert (=> bs!17152 m!527291))

(assert (=> b!550243 d!82839))

(declare-fun b!550405 () Bool)

(declare-fun c!63801 () Bool)

(declare-fun lt!250498 () (_ BitVec 64))

(assert (=> b!550405 (= c!63801 (= lt!250498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317731 () SeekEntryResult!5121)

(declare-fun e!317729 () SeekEntryResult!5121)

(assert (=> b!550405 (= e!317731 e!317729)))

(declare-fun b!550406 () Bool)

(declare-fun e!317730 () SeekEntryResult!5121)

(assert (=> b!550406 (= e!317730 Undefined!5121)))

(declare-fun b!550407 () Bool)

(declare-fun lt!250497 () SeekEntryResult!5121)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34713 (_ BitVec 32)) SeekEntryResult!5121)

(assert (=> b!550407 (= e!317729 (seekKeyOrZeroReturnVacant!0 (x!51635 lt!250497) (index!22713 lt!250497) (index!22713 lt!250497) k0!1914 a!3118 mask!3119))))

(declare-fun d!82841 () Bool)

(declare-fun lt!250499 () SeekEntryResult!5121)

(get-info :version)

(assert (=> d!82841 (and (or ((_ is Undefined!5121) lt!250499) (not ((_ is Found!5121) lt!250499)) (and (bvsge (index!22712 lt!250499) #b00000000000000000000000000000000) (bvslt (index!22712 lt!250499) (size!17036 a!3118)))) (or ((_ is Undefined!5121) lt!250499) ((_ is Found!5121) lt!250499) (not ((_ is MissingZero!5121) lt!250499)) (and (bvsge (index!22711 lt!250499) #b00000000000000000000000000000000) (bvslt (index!22711 lt!250499) (size!17036 a!3118)))) (or ((_ is Undefined!5121) lt!250499) ((_ is Found!5121) lt!250499) ((_ is MissingZero!5121) lt!250499) (not ((_ is MissingVacant!5121) lt!250499)) (and (bvsge (index!22714 lt!250499) #b00000000000000000000000000000000) (bvslt (index!22714 lt!250499) (size!17036 a!3118)))) (or ((_ is Undefined!5121) lt!250499) (ite ((_ is Found!5121) lt!250499) (= (select (arr!16672 a!3118) (index!22712 lt!250499)) k0!1914) (ite ((_ is MissingZero!5121) lt!250499) (= (select (arr!16672 a!3118) (index!22711 lt!250499)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5121) lt!250499) (= (select (arr!16672 a!3118) (index!22714 lt!250499)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82841 (= lt!250499 e!317730)))

(declare-fun c!63799 () Bool)

(assert (=> d!82841 (= c!63799 (and ((_ is Intermediate!5121) lt!250497) (undefined!5933 lt!250497)))))

(assert (=> d!82841 (= lt!250497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82841 (validMask!0 mask!3119)))

(assert (=> d!82841 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250499)))

(declare-fun b!550408 () Bool)

(assert (=> b!550408 (= e!317731 (Found!5121 (index!22713 lt!250497)))))

(declare-fun b!550409 () Bool)

(assert (=> b!550409 (= e!317730 e!317731)))

(assert (=> b!550409 (= lt!250498 (select (arr!16672 a!3118) (index!22713 lt!250497)))))

(declare-fun c!63800 () Bool)

(assert (=> b!550409 (= c!63800 (= lt!250498 k0!1914))))

(declare-fun b!550410 () Bool)

(assert (=> b!550410 (= e!317729 (MissingZero!5121 (index!22713 lt!250497)))))

(assert (= (and d!82841 c!63799) b!550406))

(assert (= (and d!82841 (not c!63799)) b!550409))

(assert (= (and b!550409 c!63800) b!550408))

(assert (= (and b!550409 (not c!63800)) b!550405))

(assert (= (and b!550405 c!63801) b!550410))

(assert (= (and b!550405 (not c!63801)) b!550407))

(declare-fun m!527411 () Bool)

(assert (=> b!550407 m!527411))

(declare-fun m!527413 () Bool)

(assert (=> d!82841 m!527413))

(declare-fun m!527415 () Bool)

(assert (=> d!82841 m!527415))

(declare-fun m!527417 () Bool)

(assert (=> d!82841 m!527417))

(assert (=> d!82841 m!527417))

(declare-fun m!527419 () Bool)

(assert (=> d!82841 m!527419))

(declare-fun m!527421 () Bool)

(assert (=> d!82841 m!527421))

(assert (=> d!82841 m!527291))

(declare-fun m!527423 () Bool)

(assert (=> b!550409 m!527423))

(assert (=> b!550248 d!82841))

(declare-fun e!317787 () SeekEntryResult!5121)

(declare-fun b!550490 () Bool)

(assert (=> b!550490 (= e!317787 (Intermediate!5121 false (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550491 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550491 (= e!317787 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16672 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550492 () Bool)

(declare-fun e!317788 () Bool)

(declare-fun e!317789 () Bool)

(assert (=> b!550492 (= e!317788 e!317789)))

(declare-fun res!343506 () Bool)

(declare-fun lt!250528 () SeekEntryResult!5121)

(assert (=> b!550492 (= res!343506 (and ((_ is Intermediate!5121) lt!250528) (not (undefined!5933 lt!250528)) (bvslt (x!51635 lt!250528) #b01111111111111111111111111111110) (bvsge (x!51635 lt!250528) #b00000000000000000000000000000000) (bvsge (x!51635 lt!250528) #b00000000000000000000000000000000)))))

(assert (=> b!550492 (=> (not res!343506) (not e!317789))))

(declare-fun b!550493 () Bool)

(assert (=> b!550493 (and (bvsge (index!22713 lt!250528) #b00000000000000000000000000000000) (bvslt (index!22713 lt!250528) (size!17036 a!3118)))))

(declare-fun e!317785 () Bool)

(assert (=> b!550493 (= e!317785 (= (select (arr!16672 a!3118) (index!22713 lt!250528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!82849 () Bool)

(assert (=> d!82849 e!317788))

(declare-fun c!63825 () Bool)

(assert (=> d!82849 (= c!63825 (and ((_ is Intermediate!5121) lt!250528) (undefined!5933 lt!250528)))))

(declare-fun e!317786 () SeekEntryResult!5121)

(assert (=> d!82849 (= lt!250528 e!317786)))

(declare-fun c!63824 () Bool)

(assert (=> d!82849 (= c!63824 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250529 () (_ BitVec 64))

(assert (=> d!82849 (= lt!250529 (select (arr!16672 a!3118) (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119)))))

(assert (=> d!82849 (validMask!0 mask!3119)))

(assert (=> d!82849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) (select (arr!16672 a!3118) j!142) a!3118 mask!3119) lt!250528)))

(declare-fun b!550494 () Bool)

(assert (=> b!550494 (and (bvsge (index!22713 lt!250528) #b00000000000000000000000000000000) (bvslt (index!22713 lt!250528) (size!17036 a!3118)))))

(declare-fun res!343507 () Bool)

(assert (=> b!550494 (= res!343507 (= (select (arr!16672 a!3118) (index!22713 lt!250528)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550494 (=> res!343507 e!317785)))

(declare-fun b!550495 () Bool)

(assert (=> b!550495 (= e!317786 (Intermediate!5121 true (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550496 () Bool)

(assert (=> b!550496 (= e!317788 (bvsge (x!51635 lt!250528) #b01111111111111111111111111111110))))

(declare-fun b!550497 () Bool)

(assert (=> b!550497 (and (bvsge (index!22713 lt!250528) #b00000000000000000000000000000000) (bvslt (index!22713 lt!250528) (size!17036 a!3118)))))

(declare-fun res!343505 () Bool)

(assert (=> b!550497 (= res!343505 (= (select (arr!16672 a!3118) (index!22713 lt!250528)) (select (arr!16672 a!3118) j!142)))))

(assert (=> b!550497 (=> res!343505 e!317785)))

(assert (=> b!550497 (= e!317789 e!317785)))

(declare-fun b!550498 () Bool)

(assert (=> b!550498 (= e!317786 e!317787)))

(declare-fun c!63826 () Bool)

(assert (=> b!550498 (= c!63826 (or (= lt!250529 (select (arr!16672 a!3118) j!142)) (= (bvadd lt!250529 lt!250529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82849 c!63824) b!550495))

(assert (= (and d!82849 (not c!63824)) b!550498))

(assert (= (and b!550498 c!63826) b!550490))

(assert (= (and b!550498 (not c!63826)) b!550491))

(assert (= (and d!82849 c!63825) b!550496))

(assert (= (and d!82849 (not c!63825)) b!550492))

(assert (= (and b!550492 res!343506) b!550497))

(assert (= (and b!550497 (not res!343505)) b!550494))

(assert (= (and b!550494 (not res!343507)) b!550493))

(declare-fun m!527485 () Bool)

(assert (=> b!550497 m!527485))

(assert (=> b!550493 m!527485))

(assert (=> d!82849 m!527303))

(declare-fun m!527487 () Bool)

(assert (=> d!82849 m!527487))

(assert (=> d!82849 m!527291))

(assert (=> b!550491 m!527303))

(declare-fun m!527489 () Bool)

(assert (=> b!550491 m!527489))

(assert (=> b!550491 m!527489))

(assert (=> b!550491 m!527299))

(declare-fun m!527491 () Bool)

(assert (=> b!550491 m!527491))

(assert (=> b!550494 m!527485))

(assert (=> b!550247 d!82849))

(declare-fun d!82875 () Bool)

(declare-fun lt!250545 () (_ BitVec 32))

(declare-fun lt!250544 () (_ BitVec 32))

(assert (=> d!82875 (= lt!250545 (bvmul (bvxor lt!250544 (bvlshr lt!250544 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82875 (= lt!250544 ((_ extract 31 0) (bvand (bvxor (select (arr!16672 a!3118) j!142) (bvlshr (select (arr!16672 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82875 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343508 (let ((h!11724 ((_ extract 31 0) (bvand (bvxor (select (arr!16672 a!3118) j!142) (bvlshr (select (arr!16672 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51640 (bvmul (bvxor h!11724 (bvlshr h!11724 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51640 (bvlshr x!51640 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343508 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343508 #b00000000000000000000000000000000))))))

(assert (=> d!82875 (= (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) (bvand (bvxor lt!250545 (bvlshr lt!250545 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550247 d!82875))

(declare-fun b!550515 () Bool)

(declare-fun e!317802 () SeekEntryResult!5121)

(assert (=> b!550515 (= e!317802 (Intermediate!5121 false (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550516 () Bool)

(assert (=> b!550516 (= e!317802 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)) mask!3119))))

(declare-fun b!550517 () Bool)

(declare-fun e!317803 () Bool)

(declare-fun e!317804 () Bool)

(assert (=> b!550517 (= e!317803 e!317804)))

(declare-fun res!343514 () Bool)

(declare-fun lt!250546 () SeekEntryResult!5121)

(assert (=> b!550517 (= res!343514 (and ((_ is Intermediate!5121) lt!250546) (not (undefined!5933 lt!250546)) (bvslt (x!51635 lt!250546) #b01111111111111111111111111111110) (bvsge (x!51635 lt!250546) #b00000000000000000000000000000000) (bvsge (x!51635 lt!250546) #b00000000000000000000000000000000)))))

(assert (=> b!550517 (=> (not res!343514) (not e!317804))))

(declare-fun b!550518 () Bool)

(assert (=> b!550518 (and (bvsge (index!22713 lt!250546) #b00000000000000000000000000000000) (bvslt (index!22713 lt!250546) (size!17036 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)))))))

(declare-fun e!317800 () Bool)

(assert (=> b!550518 (= e!317800 (= (select (arr!16672 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118))) (index!22713 lt!250546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!82877 () Bool)

(assert (=> d!82877 e!317803))

(declare-fun c!63834 () Bool)

(assert (=> d!82877 (= c!63834 (and ((_ is Intermediate!5121) lt!250546) (undefined!5933 lt!250546)))))

(declare-fun e!317801 () SeekEntryResult!5121)

(assert (=> d!82877 (= lt!250546 e!317801)))

(declare-fun c!63833 () Bool)

(assert (=> d!82877 (= c!63833 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250547 () (_ BitVec 64))

(assert (=> d!82877 (= lt!250547 (select (arr!16672 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118))) (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!82877 (validMask!0 mask!3119)))

(assert (=> d!82877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)) mask!3119) lt!250546)))

(declare-fun b!550519 () Bool)

(assert (=> b!550519 (and (bvsge (index!22713 lt!250546) #b00000000000000000000000000000000) (bvslt (index!22713 lt!250546) (size!17036 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)))))))

(declare-fun res!343515 () Bool)

(assert (=> b!550519 (= res!343515 (= (select (arr!16672 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118))) (index!22713 lt!250546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550519 (=> res!343515 e!317800)))

(declare-fun b!550520 () Bool)

(assert (=> b!550520 (= e!317801 (Intermediate!5121 true (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550521 () Bool)

(assert (=> b!550521 (= e!317803 (bvsge (x!51635 lt!250546) #b01111111111111111111111111111110))))

(declare-fun b!550522 () Bool)

(assert (=> b!550522 (and (bvsge (index!22713 lt!250546) #b00000000000000000000000000000000) (bvslt (index!22713 lt!250546) (size!17036 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118)))))))

(declare-fun res!343513 () Bool)

(assert (=> b!550522 (= res!343513 (= (select (arr!16672 (array!34714 (store (arr!16672 a!3118) i!1132 k0!1914) (size!17036 a!3118))) (index!22713 lt!250546)) (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!550522 (=> res!343513 e!317800)))

(assert (=> b!550522 (= e!317804 e!317800)))

(declare-fun b!550523 () Bool)

(assert (=> b!550523 (= e!317801 e!317802)))

(declare-fun c!63835 () Bool)

(assert (=> b!550523 (= c!63835 (or (= lt!250547 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250547 lt!250547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82877 c!63833) b!550520))

(assert (= (and d!82877 (not c!63833)) b!550523))

(assert (= (and b!550523 c!63835) b!550515))

(assert (= (and b!550523 (not c!63835)) b!550516))

(assert (= (and d!82877 c!63834) b!550521))

(assert (= (and d!82877 (not c!63834)) b!550517))

(assert (= (and b!550517 res!343514) b!550522))

(assert (= (and b!550522 (not res!343513)) b!550519))

(assert (= (and b!550519 (not res!343515)) b!550518))

(declare-fun m!527493 () Bool)

(assert (=> b!550522 m!527493))

(assert (=> b!550518 m!527493))

(assert (=> d!82877 m!527307))

(declare-fun m!527495 () Bool)

(assert (=> d!82877 m!527495))

(assert (=> d!82877 m!527291))

(assert (=> b!550516 m!527307))

(declare-fun m!527497 () Bool)

(assert (=> b!550516 m!527497))

(assert (=> b!550516 m!527497))

(assert (=> b!550516 m!527305))

(declare-fun m!527499 () Bool)

(assert (=> b!550516 m!527499))

(assert (=> b!550519 m!527493))

(assert (=> b!550247 d!82877))

(declare-fun d!82879 () Bool)

(declare-fun lt!250552 () (_ BitVec 32))

(declare-fun lt!250551 () (_ BitVec 32))

(assert (=> d!82879 (= lt!250552 (bvmul (bvxor lt!250551 (bvlshr lt!250551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82879 (= lt!250551 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82879 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343508 (let ((h!11724 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51640 (bvmul (bvxor h!11724 (bvlshr h!11724 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51640 (bvlshr x!51640 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343508 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343508 #b00000000000000000000000000000000))))))

(assert (=> d!82879 (= (toIndex!0 (select (store (arr!16672 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250552 (bvlshr lt!250552 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550247 d!82879))

(declare-fun b!550538 () Bool)

(declare-fun c!63841 () Bool)

(declare-fun lt!250554 () (_ BitVec 64))

(assert (=> b!550538 (= c!63841 (= lt!250554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317816 () SeekEntryResult!5121)

(declare-fun e!317814 () SeekEntryResult!5121)

(assert (=> b!550538 (= e!317816 e!317814)))

(declare-fun b!550539 () Bool)

(declare-fun e!317815 () SeekEntryResult!5121)

(assert (=> b!550539 (= e!317815 Undefined!5121)))

(declare-fun b!550540 () Bool)

(declare-fun lt!250553 () SeekEntryResult!5121)

(assert (=> b!550540 (= e!317814 (seekKeyOrZeroReturnVacant!0 (x!51635 lt!250553) (index!22713 lt!250553) (index!22713 lt!250553) (select (arr!16672 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!82881 () Bool)

(declare-fun lt!250555 () SeekEntryResult!5121)

(assert (=> d!82881 (and (or ((_ is Undefined!5121) lt!250555) (not ((_ is Found!5121) lt!250555)) (and (bvsge (index!22712 lt!250555) #b00000000000000000000000000000000) (bvslt (index!22712 lt!250555) (size!17036 a!3118)))) (or ((_ is Undefined!5121) lt!250555) ((_ is Found!5121) lt!250555) (not ((_ is MissingZero!5121) lt!250555)) (and (bvsge (index!22711 lt!250555) #b00000000000000000000000000000000) (bvslt (index!22711 lt!250555) (size!17036 a!3118)))) (or ((_ is Undefined!5121) lt!250555) ((_ is Found!5121) lt!250555) ((_ is MissingZero!5121) lt!250555) (not ((_ is MissingVacant!5121) lt!250555)) (and (bvsge (index!22714 lt!250555) #b00000000000000000000000000000000) (bvslt (index!22714 lt!250555) (size!17036 a!3118)))) (or ((_ is Undefined!5121) lt!250555) (ite ((_ is Found!5121) lt!250555) (= (select (arr!16672 a!3118) (index!22712 lt!250555)) (select (arr!16672 a!3118) j!142)) (ite ((_ is MissingZero!5121) lt!250555) (= (select (arr!16672 a!3118) (index!22711 lt!250555)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5121) lt!250555) (= (select (arr!16672 a!3118) (index!22714 lt!250555)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82881 (= lt!250555 e!317815)))

(declare-fun c!63839 () Bool)

(assert (=> d!82881 (= c!63839 (and ((_ is Intermediate!5121) lt!250553) (undefined!5933 lt!250553)))))

(assert (=> d!82881 (= lt!250553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16672 a!3118) j!142) mask!3119) (select (arr!16672 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82881 (validMask!0 mask!3119)))

(assert (=> d!82881 (= (seekEntryOrOpen!0 (select (arr!16672 a!3118) j!142) a!3118 mask!3119) lt!250555)))

(declare-fun b!550541 () Bool)

(assert (=> b!550541 (= e!317816 (Found!5121 (index!22713 lt!250553)))))

(declare-fun b!550542 () Bool)

(assert (=> b!550542 (= e!317815 e!317816)))

(assert (=> b!550542 (= lt!250554 (select (arr!16672 a!3118) (index!22713 lt!250553)))))

(declare-fun c!63840 () Bool)

(assert (=> b!550542 (= c!63840 (= lt!250554 (select (arr!16672 a!3118) j!142)))))

(declare-fun b!550543 () Bool)

(assert (=> b!550543 (= e!317814 (MissingZero!5121 (index!22713 lt!250553)))))

(assert (= (and d!82881 c!63839) b!550539))

(assert (= (and d!82881 (not c!63839)) b!550542))

(assert (= (and b!550542 c!63840) b!550541))

(assert (= (and b!550542 (not c!63840)) b!550538))

(assert (= (and b!550538 c!63841) b!550543))

(assert (= (and b!550538 (not c!63841)) b!550540))

(assert (=> b!550540 m!527299))

(declare-fun m!527509 () Bool)

(assert (=> b!550540 m!527509))

(declare-fun m!527511 () Bool)

(assert (=> d!82881 m!527511))

(declare-fun m!527514 () Bool)

(assert (=> d!82881 m!527514))

(assert (=> d!82881 m!527299))

(assert (=> d!82881 m!527303))

(assert (=> d!82881 m!527303))

(assert (=> d!82881 m!527299))

(assert (=> d!82881 m!527311))

(declare-fun m!527521 () Bool)

(assert (=> d!82881 m!527521))

(assert (=> d!82881 m!527291))

(declare-fun m!527523 () Bool)

(assert (=> b!550542 m!527523))

(assert (=> b!550242 d!82881))

(check-sat (not b!550292) (not b!550407) (not d!82881) (not d!82849) (not b!550344) (not d!82839) (not d!82877) (not bm!32255) (not b!550336) (not b!550340) (not b!550491) (not b!550516) (not bm!32256) (not b!550339) (not b!550540) (not bm!32246) (not b!550313) (not d!82841) (not b!550343) (not b!550291))
(check-sat)
