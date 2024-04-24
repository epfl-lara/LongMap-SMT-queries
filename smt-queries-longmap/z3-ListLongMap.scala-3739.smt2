; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51474 () Bool)

(assert start!51474)

(declare-fun b!562237 () Bool)

(declare-datatypes ((array!35286 0))(
  ( (array!35287 (arr!16942 (Array (_ BitVec 32) (_ BitVec 64))) (size!17306 (_ BitVec 32))) )
))
(declare-fun lt!256039 () array!35286)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!324022 () Bool)

(declare-datatypes ((SeekEntryResult!5347 0))(
  ( (MissingZero!5347 (index!23615 (_ BitVec 32))) (Found!5347 (index!23616 (_ BitVec 32))) (Intermediate!5347 (undefined!6159 Bool) (index!23617 (_ BitVec 32)) (x!52669 (_ BitVec 32))) (Undefined!5347) (MissingVacant!5347 (index!23618 (_ BitVec 32))) )
))
(declare-fun lt!256037 () SeekEntryResult!5347)

(declare-fun lt!256042 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35286 (_ BitVec 32)) SeekEntryResult!5347)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35286 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!562237 (= e!324022 (= (seekEntryOrOpen!0 lt!256042 lt!256039 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52669 lt!256037) (index!23617 lt!256037) (index!23617 lt!256037) lt!256042 lt!256039 mask!3119)))))

(declare-fun b!562238 () Bool)

(declare-fun e!324019 () Bool)

(assert (=> b!562238 (= e!324019 (not true))))

(declare-fun e!324018 () Bool)

(assert (=> b!562238 e!324018))

(declare-fun res!353289 () Bool)

(assert (=> b!562238 (=> (not res!353289) (not e!324018))))

(declare-fun lt!256034 () SeekEntryResult!5347)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562238 (= res!353289 (= lt!256034 (Found!5347 j!142)))))

(declare-fun a!3118 () array!35286)

(assert (=> b!562238 (= lt!256034 (seekEntryOrOpen!0 (select (arr!16942 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35286 (_ BitVec 32)) Bool)

(assert (=> b!562238 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17539 0))(
  ( (Unit!17540) )
))
(declare-fun lt!256038 () Unit!17539)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17539)

(assert (=> b!562238 (= lt!256038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562239 () Bool)

(declare-fun e!324024 () Bool)

(declare-fun e!324020 () Bool)

(assert (=> b!562239 (= e!324024 e!324020)))

(declare-fun res!353285 () Bool)

(assert (=> b!562239 (=> (not res!353285) (not e!324020))))

(declare-fun lt!256040 () SeekEntryResult!5347)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562239 (= res!353285 (or (= lt!256040 (MissingZero!5347 i!1132)) (= lt!256040 (MissingVacant!5347 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!562239 (= lt!256040 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562240 () Bool)

(declare-fun res!353288 () Bool)

(assert (=> b!562240 (=> (not res!353288) (not e!324024))))

(declare-fun arrayContainsKey!0 (array!35286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562240 (= res!353288 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!353292 () Bool)

(assert (=> start!51474 (=> (not res!353292) (not e!324024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51474 (= res!353292 (validMask!0 mask!3119))))

(assert (=> start!51474 e!324024))

(assert (=> start!51474 true))

(declare-fun array_inv!12801 (array!35286) Bool)

(assert (=> start!51474 (array_inv!12801 a!3118)))

(declare-fun b!562241 () Bool)

(declare-fun res!353294 () Bool)

(assert (=> b!562241 (=> (not res!353294) (not e!324024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562241 (= res!353294 (validKeyInArray!0 (select (arr!16942 a!3118) j!142)))))

(declare-fun b!562242 () Bool)

(assert (=> b!562242 (= e!324020 e!324019)))

(declare-fun res!353293 () Bool)

(assert (=> b!562242 (=> (not res!353293) (not e!324019))))

(declare-fun lt!256036 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35286 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!562242 (= res!353293 (= lt!256037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256036 lt!256042 lt!256039 mask!3119)))))

(declare-fun lt!256035 () (_ BitVec 32))

(assert (=> b!562242 (= lt!256037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256035 (select (arr!16942 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562242 (= lt!256036 (toIndex!0 lt!256042 mask!3119))))

(assert (=> b!562242 (= lt!256042 (select (store (arr!16942 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562242 (= lt!256035 (toIndex!0 (select (arr!16942 a!3118) j!142) mask!3119))))

(assert (=> b!562242 (= lt!256039 (array!35287 (store (arr!16942 a!3118) i!1132 k0!1914) (size!17306 a!3118)))))

(declare-fun b!562243 () Bool)

(declare-fun e!324017 () Bool)

(assert (=> b!562243 (= e!324018 e!324017)))

(declare-fun res!353296 () Bool)

(assert (=> b!562243 (=> res!353296 e!324017)))

(get-info :version)

(assert (=> b!562243 (= res!353296 (or (undefined!6159 lt!256037) (not ((_ is Intermediate!5347) lt!256037))))))

(declare-fun b!562244 () Bool)

(declare-fun res!353286 () Bool)

(assert (=> b!562244 (=> (not res!353286) (not e!324020))))

(declare-datatypes ((List!10929 0))(
  ( (Nil!10926) (Cons!10925 (h!11931 (_ BitVec 64)) (t!17149 List!10929)) )
))
(declare-fun arrayNoDuplicates!0 (array!35286 (_ BitVec 32) List!10929) Bool)

(assert (=> b!562244 (= res!353286 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10926))))

(declare-fun b!562245 () Bool)

(declare-fun e!324021 () Bool)

(assert (=> b!562245 (= e!324017 e!324021)))

(declare-fun res!353291 () Bool)

(assert (=> b!562245 (=> res!353291 e!324021)))

(declare-fun lt!256041 () (_ BitVec 64))

(assert (=> b!562245 (= res!353291 (or (= lt!256041 (select (arr!16942 a!3118) j!142)) (= lt!256041 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562245 (= lt!256041 (select (arr!16942 a!3118) (index!23617 lt!256037)))))

(declare-fun b!562246 () Bool)

(assert (=> b!562246 (= e!324021 e!324022)))

(declare-fun res!353295 () Bool)

(assert (=> b!562246 (=> (not res!353295) (not e!324022))))

(assert (=> b!562246 (= res!353295 (= lt!256034 (seekKeyOrZeroReturnVacant!0 (x!52669 lt!256037) (index!23617 lt!256037) (index!23617 lt!256037) (select (arr!16942 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562247 () Bool)

(declare-fun res!353284 () Bool)

(assert (=> b!562247 (=> (not res!353284) (not e!324024))))

(assert (=> b!562247 (= res!353284 (and (= (size!17306 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17306 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17306 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562248 () Bool)

(declare-fun res!353290 () Bool)

(assert (=> b!562248 (=> (not res!353290) (not e!324024))))

(assert (=> b!562248 (= res!353290 (validKeyInArray!0 k0!1914))))

(declare-fun b!562249 () Bool)

(declare-fun res!353287 () Bool)

(assert (=> b!562249 (=> (not res!353287) (not e!324020))))

(assert (=> b!562249 (= res!353287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51474 res!353292) b!562247))

(assert (= (and b!562247 res!353284) b!562241))

(assert (= (and b!562241 res!353294) b!562248))

(assert (= (and b!562248 res!353290) b!562240))

(assert (= (and b!562240 res!353288) b!562239))

(assert (= (and b!562239 res!353285) b!562249))

(assert (= (and b!562249 res!353287) b!562244))

(assert (= (and b!562244 res!353286) b!562242))

(assert (= (and b!562242 res!353293) b!562238))

(assert (= (and b!562238 res!353289) b!562243))

(assert (= (and b!562243 (not res!353296)) b!562245))

(assert (= (and b!562245 (not res!353291)) b!562246))

(assert (= (and b!562246 res!353295) b!562237))

(declare-fun m!540347 () Bool)

(assert (=> b!562242 m!540347))

(declare-fun m!540349 () Bool)

(assert (=> b!562242 m!540349))

(declare-fun m!540351 () Bool)

(assert (=> b!562242 m!540351))

(declare-fun m!540353 () Bool)

(assert (=> b!562242 m!540353))

(declare-fun m!540355 () Bool)

(assert (=> b!562242 m!540355))

(assert (=> b!562242 m!540349))

(assert (=> b!562242 m!540349))

(declare-fun m!540357 () Bool)

(assert (=> b!562242 m!540357))

(declare-fun m!540359 () Bool)

(assert (=> b!562242 m!540359))

(assert (=> b!562238 m!540349))

(assert (=> b!562238 m!540349))

(declare-fun m!540361 () Bool)

(assert (=> b!562238 m!540361))

(declare-fun m!540363 () Bool)

(assert (=> b!562238 m!540363))

(declare-fun m!540365 () Bool)

(assert (=> b!562238 m!540365))

(declare-fun m!540367 () Bool)

(assert (=> b!562244 m!540367))

(declare-fun m!540369 () Bool)

(assert (=> b!562249 m!540369))

(declare-fun m!540371 () Bool)

(assert (=> b!562239 m!540371))

(declare-fun m!540373 () Bool)

(assert (=> start!51474 m!540373))

(declare-fun m!540375 () Bool)

(assert (=> start!51474 m!540375))

(assert (=> b!562241 m!540349))

(assert (=> b!562241 m!540349))

(declare-fun m!540377 () Bool)

(assert (=> b!562241 m!540377))

(declare-fun m!540379 () Bool)

(assert (=> b!562240 m!540379))

(assert (=> b!562246 m!540349))

(assert (=> b!562246 m!540349))

(declare-fun m!540381 () Bool)

(assert (=> b!562246 m!540381))

(declare-fun m!540383 () Bool)

(assert (=> b!562237 m!540383))

(declare-fun m!540385 () Bool)

(assert (=> b!562237 m!540385))

(assert (=> b!562245 m!540349))

(declare-fun m!540387 () Bool)

(assert (=> b!562245 m!540387))

(declare-fun m!540389 () Bool)

(assert (=> b!562248 m!540389))

(check-sat (not b!562240) (not b!562241) (not b!562238) (not b!562242) (not b!562239) (not b!562244) (not b!562248) (not b!562237) (not start!51474) (not b!562246) (not b!562249))
(check-sat)
