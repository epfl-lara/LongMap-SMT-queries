; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51222 () Bool)

(assert start!51222)

(declare-fun b!559232 () Bool)

(declare-fun res!350753 () Bool)

(declare-fun e!322179 () Bool)

(assert (=> b!559232 (=> (not res!350753) (not e!322179))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35160 0))(
  ( (array!35161 (arr!16882 (Array (_ BitVec 32) (_ BitVec 64))) (size!17246 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35160)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!559232 (= res!350753 (and (= (size!17246 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17246 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17246 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559233 () Bool)

(declare-fun e!322181 () Bool)

(declare-fun e!322180 () Bool)

(assert (=> b!559233 (= e!322181 e!322180)))

(declare-fun res!350764 () Bool)

(assert (=> b!559233 (=> (not res!350764) (not e!322180))))

(declare-datatypes ((SeekEntryResult!5287 0))(
  ( (MissingZero!5287 (index!23375 (_ BitVec 32))) (Found!5287 (index!23376 (_ BitVec 32))) (Intermediate!5287 (undefined!6099 Bool) (index!23377 (_ BitVec 32)) (x!52431 (_ BitVec 32))) (Undefined!5287) (MissingVacant!5287 (index!23378 (_ BitVec 32))) )
))
(declare-fun lt!254173 () SeekEntryResult!5287)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!254176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35160 (_ BitVec 32)) SeekEntryResult!5287)

(assert (=> b!559233 (= res!350764 (= lt!254173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254176 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)) mask!3119)))))

(declare-fun lt!254174 () (_ BitVec 32))

(assert (=> b!559233 (= lt!254173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254174 (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559233 (= lt!254176 (toIndex!0 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!559233 (= lt!254174 (toIndex!0 (select (arr!16882 a!3118) j!142) mask!3119))))

(declare-fun b!559234 () Bool)

(declare-fun res!350760 () Bool)

(assert (=> b!559234 (=> (not res!350760) (not e!322179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559234 (= res!350760 (validKeyInArray!0 (select (arr!16882 a!3118) j!142)))))

(declare-fun b!559235 () Bool)

(declare-fun e!322182 () Bool)

(declare-fun lt!254171 () SeekEntryResult!5287)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35160 (_ BitVec 32)) SeekEntryResult!5287)

(assert (=> b!559235 (= e!322182 (= lt!254171 (seekKeyOrZeroReturnVacant!0 (x!52431 lt!254173) (index!23377 lt!254173) (index!23377 lt!254173) (select (arr!16882 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559236 () Bool)

(declare-fun res!350763 () Bool)

(assert (=> b!559236 (=> (not res!350763) (not e!322181))))

(declare-datatypes ((List!10869 0))(
  ( (Nil!10866) (Cons!10865 (h!11865 (_ BitVec 64)) (t!17089 List!10869)) )
))
(declare-fun arrayNoDuplicates!0 (array!35160 (_ BitVec 32) List!10869) Bool)

(assert (=> b!559236 (= res!350763 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10866))))

(declare-fun b!559237 () Bool)

(declare-fun res!350762 () Bool)

(assert (=> b!559237 (=> (not res!350762) (not e!322179))))

(assert (=> b!559237 (= res!350762 (validKeyInArray!0 k0!1914))))

(declare-fun b!559238 () Bool)

(get-info :version)

(assert (=> b!559238 (= e!322180 (not (or (undefined!6099 lt!254173) (not ((_ is Intermediate!5287) lt!254173)) (let ((bdg!16952 (select (arr!16882 a!3118) (index!23377 lt!254173)))) (or (= bdg!16952 (select (arr!16882 a!3118) j!142)) (= bdg!16952 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23377 lt!254173) #b00000000000000000000000000000000) (bvsge (index!23377 lt!254173) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52431 lt!254173) #b01111111111111111111111111111110) (bvsge (x!52431 lt!254173) #b00000000000000000000000000000000)))))))))

(declare-fun e!322178 () Bool)

(assert (=> b!559238 e!322178))

(declare-fun res!350754 () Bool)

(assert (=> b!559238 (=> (not res!350754) (not e!322178))))

(assert (=> b!559238 (= res!350754 (= lt!254171 (Found!5287 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35160 (_ BitVec 32)) SeekEntryResult!5287)

(assert (=> b!559238 (= lt!254171 (seekEntryOrOpen!0 (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35160 (_ BitVec 32)) Bool)

(assert (=> b!559238 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17419 0))(
  ( (Unit!17420) )
))
(declare-fun lt!254172 () Unit!17419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17419)

(assert (=> b!559238 (= lt!254172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!350756 () Bool)

(assert (=> start!51222 (=> (not res!350756) (not e!322179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51222 (= res!350756 (validMask!0 mask!3119))))

(assert (=> start!51222 e!322179))

(assert (=> start!51222 true))

(declare-fun array_inv!12741 (array!35160) Bool)

(assert (=> start!51222 (array_inv!12741 a!3118)))

(declare-fun b!559239 () Bool)

(declare-fun res!350755 () Bool)

(assert (=> b!559239 (=> (not res!350755) (not e!322181))))

(assert (=> b!559239 (= res!350755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559240 () Bool)

(declare-fun e!322176 () Bool)

(assert (=> b!559240 (= e!322178 e!322176)))

(declare-fun res!350759 () Bool)

(assert (=> b!559240 (=> res!350759 e!322176)))

(assert (=> b!559240 (= res!350759 (or (undefined!6099 lt!254173) (not ((_ is Intermediate!5287) lt!254173))))))

(declare-fun b!559241 () Bool)

(assert (=> b!559241 (= e!322179 e!322181)))

(declare-fun res!350758 () Bool)

(assert (=> b!559241 (=> (not res!350758) (not e!322181))))

(declare-fun lt!254170 () SeekEntryResult!5287)

(assert (=> b!559241 (= res!350758 (or (= lt!254170 (MissingZero!5287 i!1132)) (= lt!254170 (MissingVacant!5287 i!1132))))))

(assert (=> b!559241 (= lt!254170 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559242 () Bool)

(assert (=> b!559242 (= e!322176 e!322182)))

(declare-fun res!350761 () Bool)

(assert (=> b!559242 (=> res!350761 e!322182)))

(declare-fun lt!254175 () (_ BitVec 64))

(assert (=> b!559242 (= res!350761 (or (= lt!254175 (select (arr!16882 a!3118) j!142)) (= lt!254175 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559242 (= lt!254175 (select (arr!16882 a!3118) (index!23377 lt!254173)))))

(declare-fun b!559243 () Bool)

(declare-fun res!350757 () Bool)

(assert (=> b!559243 (=> (not res!350757) (not e!322179))))

(declare-fun arrayContainsKey!0 (array!35160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559243 (= res!350757 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51222 res!350756) b!559232))

(assert (= (and b!559232 res!350753) b!559234))

(assert (= (and b!559234 res!350760) b!559237))

(assert (= (and b!559237 res!350762) b!559243))

(assert (= (and b!559243 res!350757) b!559241))

(assert (= (and b!559241 res!350758) b!559239))

(assert (= (and b!559239 res!350755) b!559236))

(assert (= (and b!559236 res!350763) b!559233))

(assert (= (and b!559233 res!350764) b!559238))

(assert (= (and b!559238 res!350754) b!559240))

(assert (= (and b!559240 (not res!350759)) b!559242))

(assert (= (and b!559242 (not res!350761)) b!559235))

(declare-fun m!537281 () Bool)

(assert (=> b!559236 m!537281))

(declare-fun m!537283 () Bool)

(assert (=> b!559241 m!537283))

(declare-fun m!537285 () Bool)

(assert (=> b!559233 m!537285))

(declare-fun m!537287 () Bool)

(assert (=> b!559233 m!537287))

(assert (=> b!559233 m!537285))

(declare-fun m!537289 () Bool)

(assert (=> b!559233 m!537289))

(assert (=> b!559233 m!537285))

(declare-fun m!537291 () Bool)

(assert (=> b!559233 m!537291))

(assert (=> b!559233 m!537289))

(declare-fun m!537293 () Bool)

(assert (=> b!559233 m!537293))

(declare-fun m!537295 () Bool)

(assert (=> b!559233 m!537295))

(assert (=> b!559233 m!537289))

(declare-fun m!537297 () Bool)

(assert (=> b!559233 m!537297))

(assert (=> b!559238 m!537285))

(declare-fun m!537299 () Bool)

(assert (=> b!559238 m!537299))

(declare-fun m!537301 () Bool)

(assert (=> b!559238 m!537301))

(assert (=> b!559238 m!537285))

(declare-fun m!537303 () Bool)

(assert (=> b!559238 m!537303))

(declare-fun m!537305 () Bool)

(assert (=> b!559238 m!537305))

(assert (=> b!559234 m!537285))

(assert (=> b!559234 m!537285))

(declare-fun m!537307 () Bool)

(assert (=> b!559234 m!537307))

(declare-fun m!537309 () Bool)

(assert (=> b!559237 m!537309))

(declare-fun m!537311 () Bool)

(assert (=> b!559239 m!537311))

(assert (=> b!559242 m!537285))

(assert (=> b!559242 m!537305))

(declare-fun m!537313 () Bool)

(assert (=> start!51222 m!537313))

(declare-fun m!537315 () Bool)

(assert (=> start!51222 m!537315))

(declare-fun m!537317 () Bool)

(assert (=> b!559243 m!537317))

(assert (=> b!559235 m!537285))

(assert (=> b!559235 m!537285))

(declare-fun m!537319 () Bool)

(assert (=> b!559235 m!537319))

(check-sat (not b!559233) (not b!559243) (not b!559235) (not b!559236) (not b!559237) (not b!559238) (not b!559234) (not b!559239) (not b!559241) (not start!51222))
(check-sat)
(get-model)

(declare-fun b!559334 () Bool)

(declare-fun e!322237 () SeekEntryResult!5287)

(assert (=> b!559334 (= e!322237 (Intermediate!5287 true lt!254176 #b00000000000000000000000000000000))))

(declare-fun b!559335 () Bool)

(declare-fun e!322236 () SeekEntryResult!5287)

(assert (=> b!559335 (= e!322237 e!322236)))

(declare-fun lt!254223 () (_ BitVec 64))

(declare-fun c!64591 () Bool)

(assert (=> b!559335 (= c!64591 (or (= lt!254223 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!254223 lt!254223) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559336 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559336 (= e!322236 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254176 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)) mask!3119))))

(declare-fun lt!254224 () SeekEntryResult!5287)

(declare-fun b!559337 () Bool)

(assert (=> b!559337 (and (bvsge (index!23377 lt!254224) #b00000000000000000000000000000000) (bvslt (index!23377 lt!254224) (size!17246 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)))))))

(declare-fun res!350845 () Bool)

(assert (=> b!559337 (= res!350845 (= (select (arr!16882 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118))) (index!23377 lt!254224)) (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!322239 () Bool)

(assert (=> b!559337 (=> res!350845 e!322239)))

(declare-fun e!322235 () Bool)

(assert (=> b!559337 (= e!322235 e!322239)))

(declare-fun b!559338 () Bool)

(declare-fun e!322238 () Bool)

(assert (=> b!559338 (= e!322238 (bvsge (x!52431 lt!254224) #b01111111111111111111111111111110))))

(declare-fun b!559339 () Bool)

(assert (=> b!559339 (and (bvsge (index!23377 lt!254224) #b00000000000000000000000000000000) (bvslt (index!23377 lt!254224) (size!17246 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)))))))

(assert (=> b!559339 (= e!322239 (= (select (arr!16882 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118))) (index!23377 lt!254224)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559341 () Bool)

(assert (=> b!559341 (= e!322238 e!322235)))

(declare-fun res!350843 () Bool)

(assert (=> b!559341 (= res!350843 (and ((_ is Intermediate!5287) lt!254224) (not (undefined!6099 lt!254224)) (bvslt (x!52431 lt!254224) #b01111111111111111111111111111110) (bvsge (x!52431 lt!254224) #b00000000000000000000000000000000) (bvsge (x!52431 lt!254224) #b00000000000000000000000000000000)))))

(assert (=> b!559341 (=> (not res!350843) (not e!322235))))

(declare-fun b!559342 () Bool)

(assert (=> b!559342 (and (bvsge (index!23377 lt!254224) #b00000000000000000000000000000000) (bvslt (index!23377 lt!254224) (size!17246 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)))))))

(declare-fun res!350844 () Bool)

(assert (=> b!559342 (= res!350844 (= (select (arr!16882 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118))) (index!23377 lt!254224)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559342 (=> res!350844 e!322239)))

(declare-fun b!559340 () Bool)

(assert (=> b!559340 (= e!322236 (Intermediate!5287 false lt!254176 #b00000000000000000000000000000000))))

(declare-fun d!83789 () Bool)

(assert (=> d!83789 e!322238))

(declare-fun c!64592 () Bool)

(assert (=> d!83789 (= c!64592 (and ((_ is Intermediate!5287) lt!254224) (undefined!6099 lt!254224)))))

(assert (=> d!83789 (= lt!254224 e!322237)))

(declare-fun c!64590 () Bool)

(assert (=> d!83789 (= c!64590 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83789 (= lt!254223 (select (arr!16882 (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118))) lt!254176))))

(assert (=> d!83789 (validMask!0 mask!3119)))

(assert (=> d!83789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254176 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) (array!35161 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)) mask!3119) lt!254224)))

(assert (= (and d!83789 c!64590) b!559334))

(assert (= (and d!83789 (not c!64590)) b!559335))

(assert (= (and b!559335 c!64591) b!559340))

(assert (= (and b!559335 (not c!64591)) b!559336))

(assert (= (and d!83789 c!64592) b!559338))

(assert (= (and d!83789 (not c!64592)) b!559341))

(assert (= (and b!559341 res!350843) b!559337))

(assert (= (and b!559337 (not res!350845)) b!559342))

(assert (= (and b!559342 (not res!350844)) b!559339))

(declare-fun m!537401 () Bool)

(assert (=> d!83789 m!537401))

(assert (=> d!83789 m!537313))

(declare-fun m!537403 () Bool)

(assert (=> b!559336 m!537403))

(assert (=> b!559336 m!537403))

(assert (=> b!559336 m!537289))

(declare-fun m!537405 () Bool)

(assert (=> b!559336 m!537405))

(declare-fun m!537407 () Bool)

(assert (=> b!559337 m!537407))

(assert (=> b!559339 m!537407))

(assert (=> b!559342 m!537407))

(assert (=> b!559233 d!83789))

(declare-fun b!559347 () Bool)

(declare-fun e!322246 () SeekEntryResult!5287)

(assert (=> b!559347 (= e!322246 (Intermediate!5287 true lt!254174 #b00000000000000000000000000000000))))

(declare-fun b!559348 () Bool)

(declare-fun e!322245 () SeekEntryResult!5287)

(assert (=> b!559348 (= e!322246 e!322245)))

(declare-fun lt!254225 () (_ BitVec 64))

(declare-fun c!64594 () Bool)

(assert (=> b!559348 (= c!64594 (or (= lt!254225 (select (arr!16882 a!3118) j!142)) (= (bvadd lt!254225 lt!254225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559349 () Bool)

(assert (=> b!559349 (= e!322245 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254174 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559350 () Bool)

(declare-fun lt!254226 () SeekEntryResult!5287)

(assert (=> b!559350 (and (bvsge (index!23377 lt!254226) #b00000000000000000000000000000000) (bvslt (index!23377 lt!254226) (size!17246 a!3118)))))

(declare-fun res!350852 () Bool)

(assert (=> b!559350 (= res!350852 (= (select (arr!16882 a!3118) (index!23377 lt!254226)) (select (arr!16882 a!3118) j!142)))))

(declare-fun e!322248 () Bool)

(assert (=> b!559350 (=> res!350852 e!322248)))

(declare-fun e!322244 () Bool)

(assert (=> b!559350 (= e!322244 e!322248)))

(declare-fun b!559351 () Bool)

(declare-fun e!322247 () Bool)

(assert (=> b!559351 (= e!322247 (bvsge (x!52431 lt!254226) #b01111111111111111111111111111110))))

(declare-fun b!559352 () Bool)

(assert (=> b!559352 (and (bvsge (index!23377 lt!254226) #b00000000000000000000000000000000) (bvslt (index!23377 lt!254226) (size!17246 a!3118)))))

(assert (=> b!559352 (= e!322248 (= (select (arr!16882 a!3118) (index!23377 lt!254226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559354 () Bool)

(assert (=> b!559354 (= e!322247 e!322244)))

(declare-fun res!350850 () Bool)

(assert (=> b!559354 (= res!350850 (and ((_ is Intermediate!5287) lt!254226) (not (undefined!6099 lt!254226)) (bvslt (x!52431 lt!254226) #b01111111111111111111111111111110) (bvsge (x!52431 lt!254226) #b00000000000000000000000000000000) (bvsge (x!52431 lt!254226) #b00000000000000000000000000000000)))))

(assert (=> b!559354 (=> (not res!350850) (not e!322244))))

(declare-fun b!559355 () Bool)

(assert (=> b!559355 (and (bvsge (index!23377 lt!254226) #b00000000000000000000000000000000) (bvslt (index!23377 lt!254226) (size!17246 a!3118)))))

(declare-fun res!350851 () Bool)

(assert (=> b!559355 (= res!350851 (= (select (arr!16882 a!3118) (index!23377 lt!254226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559355 (=> res!350851 e!322248)))

(declare-fun b!559353 () Bool)

(assert (=> b!559353 (= e!322245 (Intermediate!5287 false lt!254174 #b00000000000000000000000000000000))))

(declare-fun d!83795 () Bool)

(assert (=> d!83795 e!322247))

(declare-fun c!64595 () Bool)

(assert (=> d!83795 (= c!64595 (and ((_ is Intermediate!5287) lt!254226) (undefined!6099 lt!254226)))))

(assert (=> d!83795 (= lt!254226 e!322246)))

(declare-fun c!64593 () Bool)

(assert (=> d!83795 (= c!64593 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83795 (= lt!254225 (select (arr!16882 a!3118) lt!254174))))

(assert (=> d!83795 (validMask!0 mask!3119)))

(assert (=> d!83795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254174 (select (arr!16882 a!3118) j!142) a!3118 mask!3119) lt!254226)))

(assert (= (and d!83795 c!64593) b!559347))

(assert (= (and d!83795 (not c!64593)) b!559348))

(assert (= (and b!559348 c!64594) b!559353))

(assert (= (and b!559348 (not c!64594)) b!559349))

(assert (= (and d!83795 c!64595) b!559351))

(assert (= (and d!83795 (not c!64595)) b!559354))

(assert (= (and b!559354 res!350850) b!559350))

(assert (= (and b!559350 (not res!350852)) b!559355))

(assert (= (and b!559355 (not res!350851)) b!559352))

(declare-fun m!537413 () Bool)

(assert (=> d!83795 m!537413))

(assert (=> d!83795 m!537313))

(declare-fun m!537415 () Bool)

(assert (=> b!559349 m!537415))

(assert (=> b!559349 m!537415))

(assert (=> b!559349 m!537285))

(declare-fun m!537417 () Bool)

(assert (=> b!559349 m!537417))

(declare-fun m!537419 () Bool)

(assert (=> b!559350 m!537419))

(assert (=> b!559352 m!537419))

(assert (=> b!559355 m!537419))

(assert (=> b!559233 d!83795))

(declare-fun d!83799 () Bool)

(declare-fun lt!254232 () (_ BitVec 32))

(declare-fun lt!254231 () (_ BitVec 32))

(assert (=> d!83799 (= lt!254232 (bvmul (bvxor lt!254231 (bvlshr lt!254231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83799 (= lt!254231 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83799 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350855 (let ((h!11868 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52435 (bvmul (bvxor h!11868 (bvlshr h!11868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52435 (bvlshr x!52435 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350855 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350855 #b00000000000000000000000000000000))))))

(assert (=> d!83799 (= (toIndex!0 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!254232 (bvlshr lt!254232 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559233 d!83799))

(declare-fun d!83801 () Bool)

(declare-fun lt!254234 () (_ BitVec 32))

(declare-fun lt!254233 () (_ BitVec 32))

(assert (=> d!83801 (= lt!254234 (bvmul (bvxor lt!254233 (bvlshr lt!254233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83801 (= lt!254233 ((_ extract 31 0) (bvand (bvxor (select (arr!16882 a!3118) j!142) (bvlshr (select (arr!16882 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83801 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350855 (let ((h!11868 ((_ extract 31 0) (bvand (bvxor (select (arr!16882 a!3118) j!142) (bvlshr (select (arr!16882 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52435 (bvmul (bvxor h!11868 (bvlshr h!11868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52435 (bvlshr x!52435 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350855 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350855 #b00000000000000000000000000000000))))))

(assert (=> d!83801 (= (toIndex!0 (select (arr!16882 a!3118) j!142) mask!3119) (bvand (bvxor lt!254234 (bvlshr lt!254234 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559233 d!83801))

(declare-fun b!559406 () Bool)

(declare-fun c!64614 () Bool)

(declare-fun lt!254250 () (_ BitVec 64))

(assert (=> b!559406 (= c!64614 (= lt!254250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322278 () SeekEntryResult!5287)

(declare-fun e!322279 () SeekEntryResult!5287)

(assert (=> b!559406 (= e!322278 e!322279)))

(declare-fun b!559407 () Bool)

(declare-fun e!322277 () SeekEntryResult!5287)

(assert (=> b!559407 (= e!322277 e!322278)))

(declare-fun lt!254249 () SeekEntryResult!5287)

(assert (=> b!559407 (= lt!254250 (select (arr!16882 a!3118) (index!23377 lt!254249)))))

(declare-fun c!64616 () Bool)

(assert (=> b!559407 (= c!64616 (= lt!254250 (select (arr!16882 a!3118) j!142)))))

(declare-fun b!559408 () Bool)

(assert (=> b!559408 (= e!322278 (Found!5287 (index!23377 lt!254249)))))

(declare-fun d!83803 () Bool)

(declare-fun lt!254251 () SeekEntryResult!5287)

(assert (=> d!83803 (and (or ((_ is Undefined!5287) lt!254251) (not ((_ is Found!5287) lt!254251)) (and (bvsge (index!23376 lt!254251) #b00000000000000000000000000000000) (bvslt (index!23376 lt!254251) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254251) ((_ is Found!5287) lt!254251) (not ((_ is MissingZero!5287) lt!254251)) (and (bvsge (index!23375 lt!254251) #b00000000000000000000000000000000) (bvslt (index!23375 lt!254251) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254251) ((_ is Found!5287) lt!254251) ((_ is MissingZero!5287) lt!254251) (not ((_ is MissingVacant!5287) lt!254251)) (and (bvsge (index!23378 lt!254251) #b00000000000000000000000000000000) (bvslt (index!23378 lt!254251) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254251) (ite ((_ is Found!5287) lt!254251) (= (select (arr!16882 a!3118) (index!23376 lt!254251)) (select (arr!16882 a!3118) j!142)) (ite ((_ is MissingZero!5287) lt!254251) (= (select (arr!16882 a!3118) (index!23375 lt!254251)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5287) lt!254251) (= (select (arr!16882 a!3118) (index!23378 lt!254251)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83803 (= lt!254251 e!322277)))

(declare-fun c!64615 () Bool)

(assert (=> d!83803 (= c!64615 (and ((_ is Intermediate!5287) lt!254249) (undefined!6099 lt!254249)))))

(assert (=> d!83803 (= lt!254249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16882 a!3118) j!142) mask!3119) (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83803 (validMask!0 mask!3119)))

(assert (=> d!83803 (= (seekEntryOrOpen!0 (select (arr!16882 a!3118) j!142) a!3118 mask!3119) lt!254251)))

(declare-fun b!559409 () Bool)

(assert (=> b!559409 (= e!322277 Undefined!5287)))

(declare-fun b!559410 () Bool)

(assert (=> b!559410 (= e!322279 (MissingZero!5287 (index!23377 lt!254249)))))

(declare-fun b!559411 () Bool)

(assert (=> b!559411 (= e!322279 (seekKeyOrZeroReturnVacant!0 (x!52431 lt!254249) (index!23377 lt!254249) (index!23377 lt!254249) (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83803 c!64615) b!559409))

(assert (= (and d!83803 (not c!64615)) b!559407))

(assert (= (and b!559407 c!64616) b!559408))

(assert (= (and b!559407 (not c!64616)) b!559406))

(assert (= (and b!559406 c!64614) b!559410))

(assert (= (and b!559406 (not c!64614)) b!559411))

(declare-fun m!537437 () Bool)

(assert (=> b!559407 m!537437))

(assert (=> d!83803 m!537285))

(assert (=> d!83803 m!537287))

(assert (=> d!83803 m!537313))

(assert (=> d!83803 m!537287))

(assert (=> d!83803 m!537285))

(declare-fun m!537439 () Bool)

(assert (=> d!83803 m!537439))

(declare-fun m!537441 () Bool)

(assert (=> d!83803 m!537441))

(declare-fun m!537443 () Bool)

(assert (=> d!83803 m!537443))

(declare-fun m!537445 () Bool)

(assert (=> d!83803 m!537445))

(assert (=> b!559411 m!537285))

(declare-fun m!537447 () Bool)

(assert (=> b!559411 m!537447))

(assert (=> b!559238 d!83803))

(declare-fun call!32421 () Bool)

(declare-fun bm!32418 () Bool)

(assert (=> bm!32418 (= call!32421 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559438 () Bool)

(declare-fun e!322297 () Bool)

(assert (=> b!559438 (= e!322297 call!32421)))

(declare-fun d!83811 () Bool)

(declare-fun res!350873 () Bool)

(declare-fun e!322296 () Bool)

(assert (=> d!83811 (=> res!350873 e!322296)))

(assert (=> d!83811 (= res!350873 (bvsge j!142 (size!17246 a!3118)))))

(assert (=> d!83811 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322296)))

(declare-fun b!559439 () Bool)

(declare-fun e!322295 () Bool)

(assert (=> b!559439 (= e!322295 call!32421)))

(declare-fun b!559440 () Bool)

(assert (=> b!559440 (= e!322296 e!322295)))

(declare-fun c!64628 () Bool)

(assert (=> b!559440 (= c!64628 (validKeyInArray!0 (select (arr!16882 a!3118) j!142)))))

(declare-fun b!559441 () Bool)

(assert (=> b!559441 (= e!322295 e!322297)))

(declare-fun lt!254275 () (_ BitVec 64))

(assert (=> b!559441 (= lt!254275 (select (arr!16882 a!3118) j!142))))

(declare-fun lt!254277 () Unit!17419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35160 (_ BitVec 64) (_ BitVec 32)) Unit!17419)

(assert (=> b!559441 (= lt!254277 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254275 j!142))))

(assert (=> b!559441 (arrayContainsKey!0 a!3118 lt!254275 #b00000000000000000000000000000000)))

(declare-fun lt!254276 () Unit!17419)

(assert (=> b!559441 (= lt!254276 lt!254277)))

(declare-fun res!350874 () Bool)

(assert (=> b!559441 (= res!350874 (= (seekEntryOrOpen!0 (select (arr!16882 a!3118) j!142) a!3118 mask!3119) (Found!5287 j!142)))))

(assert (=> b!559441 (=> (not res!350874) (not e!322297))))

(assert (= (and d!83811 (not res!350873)) b!559440))

(assert (= (and b!559440 c!64628) b!559441))

(assert (= (and b!559440 (not c!64628)) b!559439))

(assert (= (and b!559441 res!350874) b!559438))

(assert (= (or b!559438 b!559439) bm!32418))

(declare-fun m!537461 () Bool)

(assert (=> bm!32418 m!537461))

(assert (=> b!559440 m!537285))

(assert (=> b!559440 m!537285))

(assert (=> b!559440 m!537307))

(assert (=> b!559441 m!537285))

(declare-fun m!537463 () Bool)

(assert (=> b!559441 m!537463))

(declare-fun m!537465 () Bool)

(assert (=> b!559441 m!537465))

(assert (=> b!559441 m!537285))

(assert (=> b!559441 m!537303))

(assert (=> b!559238 d!83811))

(declare-fun d!83821 () Bool)

(assert (=> d!83821 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254290 () Unit!17419)

(declare-fun choose!38 (array!35160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17419)

(assert (=> d!83821 (= lt!254290 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83821 (validMask!0 mask!3119)))

(assert (=> d!83821 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254290)))

(declare-fun bs!17411 () Bool)

(assert (= bs!17411 d!83821))

(assert (=> bs!17411 m!537299))

(declare-fun m!537467 () Bool)

(assert (=> bs!17411 m!537467))

(assert (=> bs!17411 m!537313))

(assert (=> b!559238 d!83821))

(declare-fun bm!32421 () Bool)

(declare-fun call!32424 () Bool)

(assert (=> bm!32421 (= call!32424 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559462 () Bool)

(declare-fun e!322312 () Bool)

(assert (=> b!559462 (= e!322312 call!32424)))

(declare-fun d!83823 () Bool)

(declare-fun res!350879 () Bool)

(declare-fun e!322311 () Bool)

(assert (=> d!83823 (=> res!350879 e!322311)))

(assert (=> d!83823 (= res!350879 (bvsge #b00000000000000000000000000000000 (size!17246 a!3118)))))

(assert (=> d!83823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322311)))

(declare-fun b!559463 () Bool)

(declare-fun e!322310 () Bool)

(assert (=> b!559463 (= e!322310 call!32424)))

(declare-fun b!559464 () Bool)

(assert (=> b!559464 (= e!322311 e!322310)))

(declare-fun c!64637 () Bool)

(assert (=> b!559464 (= c!64637 (validKeyInArray!0 (select (arr!16882 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559465 () Bool)

(assert (=> b!559465 (= e!322310 e!322312)))

(declare-fun lt!254291 () (_ BitVec 64))

(assert (=> b!559465 (= lt!254291 (select (arr!16882 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254293 () Unit!17419)

(assert (=> b!559465 (= lt!254293 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254291 #b00000000000000000000000000000000))))

(assert (=> b!559465 (arrayContainsKey!0 a!3118 lt!254291 #b00000000000000000000000000000000)))

(declare-fun lt!254292 () Unit!17419)

(assert (=> b!559465 (= lt!254292 lt!254293)))

(declare-fun res!350880 () Bool)

(assert (=> b!559465 (= res!350880 (= (seekEntryOrOpen!0 (select (arr!16882 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5287 #b00000000000000000000000000000000)))))

(assert (=> b!559465 (=> (not res!350880) (not e!322312))))

(assert (= (and d!83823 (not res!350879)) b!559464))

(assert (= (and b!559464 c!64637) b!559465))

(assert (= (and b!559464 (not c!64637)) b!559463))

(assert (= (and b!559465 res!350880) b!559462))

(assert (= (or b!559462 b!559463) bm!32421))

(declare-fun m!537469 () Bool)

(assert (=> bm!32421 m!537469))

(declare-fun m!537471 () Bool)

(assert (=> b!559464 m!537471))

(assert (=> b!559464 m!537471))

(declare-fun m!537473 () Bool)

(assert (=> b!559464 m!537473))

(assert (=> b!559465 m!537471))

(declare-fun m!537475 () Bool)

(assert (=> b!559465 m!537475))

(declare-fun m!537477 () Bool)

(assert (=> b!559465 m!537477))

(assert (=> b!559465 m!537471))

(declare-fun m!537479 () Bool)

(assert (=> b!559465 m!537479))

(assert (=> b!559239 d!83823))

(declare-fun d!83825 () Bool)

(assert (=> d!83825 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51222 d!83825))

(declare-fun d!83833 () Bool)

(assert (=> d!83833 (= (array_inv!12741 a!3118) (bvsge (size!17246 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51222 d!83833))

(declare-fun d!83835 () Bool)

(assert (=> d!83835 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559237 d!83835))

(declare-fun d!83837 () Bool)

(declare-fun res!350896 () Bool)

(declare-fun e!322335 () Bool)

(assert (=> d!83837 (=> res!350896 e!322335)))

(assert (=> d!83837 (= res!350896 (= (select (arr!16882 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83837 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!322335)))

(declare-fun b!559495 () Bool)

(declare-fun e!322336 () Bool)

(assert (=> b!559495 (= e!322335 e!322336)))

(declare-fun res!350897 () Bool)

(assert (=> b!559495 (=> (not res!350897) (not e!322336))))

(assert (=> b!559495 (= res!350897 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17246 a!3118)))))

(declare-fun b!559496 () Bool)

(assert (=> b!559496 (= e!322336 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83837 (not res!350896)) b!559495))

(assert (= (and b!559495 res!350897) b!559496))

(assert (=> d!83837 m!537471))

(declare-fun m!537505 () Bool)

(assert (=> b!559496 m!537505))

(assert (=> b!559243 d!83837))

(declare-fun b!559497 () Bool)

(declare-fun c!64645 () Bool)

(declare-fun lt!254303 () (_ BitVec 64))

(assert (=> b!559497 (= c!64645 (= lt!254303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322338 () SeekEntryResult!5287)

(declare-fun e!322339 () SeekEntryResult!5287)

(assert (=> b!559497 (= e!322338 e!322339)))

(declare-fun b!559498 () Bool)

(declare-fun e!322337 () SeekEntryResult!5287)

(assert (=> b!559498 (= e!322337 e!322338)))

(declare-fun lt!254302 () SeekEntryResult!5287)

(assert (=> b!559498 (= lt!254303 (select (arr!16882 a!3118) (index!23377 lt!254302)))))

(declare-fun c!64647 () Bool)

(assert (=> b!559498 (= c!64647 (= lt!254303 k0!1914))))

(declare-fun b!559499 () Bool)

(assert (=> b!559499 (= e!322338 (Found!5287 (index!23377 lt!254302)))))

(declare-fun d!83841 () Bool)

(declare-fun lt!254304 () SeekEntryResult!5287)

(assert (=> d!83841 (and (or ((_ is Undefined!5287) lt!254304) (not ((_ is Found!5287) lt!254304)) (and (bvsge (index!23376 lt!254304) #b00000000000000000000000000000000) (bvslt (index!23376 lt!254304) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254304) ((_ is Found!5287) lt!254304) (not ((_ is MissingZero!5287) lt!254304)) (and (bvsge (index!23375 lt!254304) #b00000000000000000000000000000000) (bvslt (index!23375 lt!254304) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254304) ((_ is Found!5287) lt!254304) ((_ is MissingZero!5287) lt!254304) (not ((_ is MissingVacant!5287) lt!254304)) (and (bvsge (index!23378 lt!254304) #b00000000000000000000000000000000) (bvslt (index!23378 lt!254304) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254304) (ite ((_ is Found!5287) lt!254304) (= (select (arr!16882 a!3118) (index!23376 lt!254304)) k0!1914) (ite ((_ is MissingZero!5287) lt!254304) (= (select (arr!16882 a!3118) (index!23375 lt!254304)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5287) lt!254304) (= (select (arr!16882 a!3118) (index!23378 lt!254304)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83841 (= lt!254304 e!322337)))

(declare-fun c!64646 () Bool)

(assert (=> d!83841 (= c!64646 (and ((_ is Intermediate!5287) lt!254302) (undefined!6099 lt!254302)))))

(assert (=> d!83841 (= lt!254302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83841 (validMask!0 mask!3119)))

(assert (=> d!83841 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!254304)))

(declare-fun b!559500 () Bool)

(assert (=> b!559500 (= e!322337 Undefined!5287)))

(declare-fun b!559501 () Bool)

(assert (=> b!559501 (= e!322339 (MissingZero!5287 (index!23377 lt!254302)))))

(declare-fun b!559502 () Bool)

(assert (=> b!559502 (= e!322339 (seekKeyOrZeroReturnVacant!0 (x!52431 lt!254302) (index!23377 lt!254302) (index!23377 lt!254302) k0!1914 a!3118 mask!3119))))

(assert (= (and d!83841 c!64646) b!559500))

(assert (= (and d!83841 (not c!64646)) b!559498))

(assert (= (and b!559498 c!64647) b!559499))

(assert (= (and b!559498 (not c!64647)) b!559497))

(assert (= (and b!559497 c!64645) b!559501))

(assert (= (and b!559497 (not c!64645)) b!559502))

(declare-fun m!537507 () Bool)

(assert (=> b!559498 m!537507))

(declare-fun m!537509 () Bool)

(assert (=> d!83841 m!537509))

(assert (=> d!83841 m!537313))

(assert (=> d!83841 m!537509))

(declare-fun m!537511 () Bool)

(assert (=> d!83841 m!537511))

(declare-fun m!537513 () Bool)

(assert (=> d!83841 m!537513))

(declare-fun m!537515 () Bool)

(assert (=> d!83841 m!537515))

(declare-fun m!537517 () Bool)

(assert (=> d!83841 m!537517))

(declare-fun m!537519 () Bool)

(assert (=> b!559502 m!537519))

(assert (=> b!559241 d!83841))

(declare-fun b!559525 () Bool)

(declare-fun e!322357 () Bool)

(declare-fun contains!2831 (List!10869 (_ BitVec 64)) Bool)

(assert (=> b!559525 (= e!322357 (contains!2831 Nil!10866 (select (arr!16882 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559526 () Bool)

(declare-fun e!322356 () Bool)

(declare-fun call!32431 () Bool)

(assert (=> b!559526 (= e!322356 call!32431)))

(declare-fun b!559527 () Bool)

(declare-fun e!322355 () Bool)

(assert (=> b!559527 (= e!322355 e!322356)))

(declare-fun c!64656 () Bool)

(assert (=> b!559527 (= c!64656 (validKeyInArray!0 (select (arr!16882 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559528 () Bool)

(assert (=> b!559528 (= e!322356 call!32431)))

(declare-fun d!83843 () Bool)

(declare-fun res!350906 () Bool)

(declare-fun e!322354 () Bool)

(assert (=> d!83843 (=> res!350906 e!322354)))

(assert (=> d!83843 (= res!350906 (bvsge #b00000000000000000000000000000000 (size!17246 a!3118)))))

(assert (=> d!83843 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10866) e!322354)))

(declare-fun b!559529 () Bool)

(assert (=> b!559529 (= e!322354 e!322355)))

(declare-fun res!350905 () Bool)

(assert (=> b!559529 (=> (not res!350905) (not e!322355))))

(assert (=> b!559529 (= res!350905 (not e!322357))))

(declare-fun res!350904 () Bool)

(assert (=> b!559529 (=> (not res!350904) (not e!322357))))

(assert (=> b!559529 (= res!350904 (validKeyInArray!0 (select (arr!16882 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32428 () Bool)

(assert (=> bm!32428 (= call!32431 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64656 (Cons!10865 (select (arr!16882 a!3118) #b00000000000000000000000000000000) Nil!10866) Nil!10866)))))

(assert (= (and d!83843 (not res!350906)) b!559529))

(assert (= (and b!559529 res!350904) b!559525))

(assert (= (and b!559529 res!350905) b!559527))

(assert (= (and b!559527 c!64656) b!559528))

(assert (= (and b!559527 (not c!64656)) b!559526))

(assert (= (or b!559528 b!559526) bm!32428))

(assert (=> b!559525 m!537471))

(assert (=> b!559525 m!537471))

(declare-fun m!537521 () Bool)

(assert (=> b!559525 m!537521))

(assert (=> b!559527 m!537471))

(assert (=> b!559527 m!537471))

(assert (=> b!559527 m!537473))

(assert (=> b!559529 m!537471))

(assert (=> b!559529 m!537471))

(assert (=> b!559529 m!537473))

(assert (=> bm!32428 m!537471))

(declare-fun m!537523 () Bool)

(assert (=> bm!32428 m!537523))

(assert (=> b!559236 d!83843))

(declare-fun d!83845 () Bool)

(assert (=> d!83845 (= (validKeyInArray!0 (select (arr!16882 a!3118) j!142)) (and (not (= (select (arr!16882 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16882 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559234 d!83845))

(declare-fun b!559582 () Bool)

(declare-fun c!64679 () Bool)

(declare-fun lt!254339 () (_ BitVec 64))

(assert (=> b!559582 (= c!64679 (= lt!254339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322390 () SeekEntryResult!5287)

(declare-fun e!322388 () SeekEntryResult!5287)

(assert (=> b!559582 (= e!322390 e!322388)))

(declare-fun b!559583 () Bool)

(declare-fun e!322389 () SeekEntryResult!5287)

(assert (=> b!559583 (= e!322389 Undefined!5287)))

(declare-fun b!559585 () Bool)

(assert (=> b!559585 (= e!322390 (Found!5287 (index!23377 lt!254173)))))

(declare-fun b!559586 () Bool)

(assert (=> b!559586 (= e!322388 (MissingVacant!5287 (index!23377 lt!254173)))))

(declare-fun b!559587 () Bool)

(assert (=> b!559587 (= e!322389 e!322390)))

(declare-fun c!64681 () Bool)

(assert (=> b!559587 (= c!64681 (= lt!254339 (select (arr!16882 a!3118) j!142)))))

(declare-fun d!83847 () Bool)

(declare-fun lt!254340 () SeekEntryResult!5287)

(assert (=> d!83847 (and (or ((_ is Undefined!5287) lt!254340) (not ((_ is Found!5287) lt!254340)) (and (bvsge (index!23376 lt!254340) #b00000000000000000000000000000000) (bvslt (index!23376 lt!254340) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254340) ((_ is Found!5287) lt!254340) (not ((_ is MissingVacant!5287) lt!254340)) (not (= (index!23378 lt!254340) (index!23377 lt!254173))) (and (bvsge (index!23378 lt!254340) #b00000000000000000000000000000000) (bvslt (index!23378 lt!254340) (size!17246 a!3118)))) (or ((_ is Undefined!5287) lt!254340) (ite ((_ is Found!5287) lt!254340) (= (select (arr!16882 a!3118) (index!23376 lt!254340)) (select (arr!16882 a!3118) j!142)) (and ((_ is MissingVacant!5287) lt!254340) (= (index!23378 lt!254340) (index!23377 lt!254173)) (= (select (arr!16882 a!3118) (index!23378 lt!254340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83847 (= lt!254340 e!322389)))

(declare-fun c!64680 () Bool)

(assert (=> d!83847 (= c!64680 (bvsge (x!52431 lt!254173) #b01111111111111111111111111111110))))

(assert (=> d!83847 (= lt!254339 (select (arr!16882 a!3118) (index!23377 lt!254173)))))

(assert (=> d!83847 (validMask!0 mask!3119)))

(assert (=> d!83847 (= (seekKeyOrZeroReturnVacant!0 (x!52431 lt!254173) (index!23377 lt!254173) (index!23377 lt!254173) (select (arr!16882 a!3118) j!142) a!3118 mask!3119) lt!254340)))

(declare-fun b!559584 () Bool)

(assert (=> b!559584 (= e!322388 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52431 lt!254173) #b00000000000000000000000000000001) (nextIndex!0 (index!23377 lt!254173) (bvadd (x!52431 lt!254173) #b00000000000000000000000000000001) mask!3119) (index!23377 lt!254173) (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83847 c!64680) b!559583))

(assert (= (and d!83847 (not c!64680)) b!559587))

(assert (= (and b!559587 c!64681) b!559585))

(assert (= (and b!559587 (not c!64681)) b!559582))

(assert (= (and b!559582 c!64679) b!559586))

(assert (= (and b!559582 (not c!64679)) b!559584))

(declare-fun m!537561 () Bool)

(assert (=> d!83847 m!537561))

(declare-fun m!537563 () Bool)

(assert (=> d!83847 m!537563))

(assert (=> d!83847 m!537305))

(assert (=> d!83847 m!537313))

(declare-fun m!537565 () Bool)

(assert (=> b!559584 m!537565))

(assert (=> b!559584 m!537565))

(assert (=> b!559584 m!537285))

(declare-fun m!537569 () Bool)

(assert (=> b!559584 m!537569))

(assert (=> b!559235 d!83847))

(check-sat (not b!559525) (not bm!32421) (not b!559502) (not d!83841) (not b!559465) (not bm!32418) (not b!559440) (not b!559496) (not b!559584) (not b!559527) (not bm!32428) (not d!83847) (not b!559411) (not b!559529) (not d!83821) (not b!559441) (not d!83795) (not b!559336) (not d!83789) (not d!83803) (not b!559464) (not b!559349))
(check-sat)
