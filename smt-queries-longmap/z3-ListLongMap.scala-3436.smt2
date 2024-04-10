; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47738 () Bool)

(assert start!47738)

(declare-fun b!525298 () Bool)

(declare-fun e!306288 () Bool)

(declare-fun e!306293 () Bool)

(assert (=> b!525298 (= e!306288 e!306293)))

(declare-fun res!322092 () Bool)

(assert (=> b!525298 (=> (not res!322092) (not e!306293))))

(declare-datatypes ((SeekEntryResult!4506 0))(
  ( (MissingZero!4506 (index!20236 (_ BitVec 32))) (Found!4506 (index!20237 (_ BitVec 32))) (Intermediate!4506 (undefined!5318 Bool) (index!20238 (_ BitVec 32)) (x!49215 (_ BitVec 32))) (Undefined!4506) (MissingVacant!4506 (index!20239 (_ BitVec 32))) )
))
(declare-fun lt!241302 () SeekEntryResult!4506)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525298 (= res!322092 (or (= lt!241302 (MissingZero!4506 i!1204)) (= lt!241302 (MissingVacant!4506 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((array!33375 0))(
  ( (array!33376 (arr!16039 (Array (_ BitVec 32) (_ BitVec 64))) (size!16403 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33375)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33375 (_ BitVec 32)) SeekEntryResult!4506)

(assert (=> b!525298 (= lt!241302 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525299 () Bool)

(declare-fun res!322091 () Bool)

(assert (=> b!525299 (=> (not res!322091) (not e!306288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525299 (= res!322091 (validKeyInArray!0 k0!2280))))

(declare-fun b!525300 () Bool)

(declare-fun e!306292 () Bool)

(assert (=> b!525300 (= e!306293 (not e!306292))))

(declare-fun res!322087 () Bool)

(assert (=> b!525300 (=> res!322087 e!306292)))

(declare-fun lt!241298 () (_ BitVec 64))

(declare-fun lt!241299 () (_ BitVec 32))

(declare-fun lt!241296 () array!33375)

(declare-fun lt!241301 () SeekEntryResult!4506)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33375 (_ BitVec 32)) SeekEntryResult!4506)

(assert (=> b!525300 (= res!322087 (= lt!241301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241299 lt!241298 lt!241296 mask!3524)))))

(declare-fun lt!241297 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525300 (= lt!241301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241297 (select (arr!16039 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525300 (= lt!241299 (toIndex!0 lt!241298 mask!3524))))

(assert (=> b!525300 (= lt!241298 (select (store (arr!16039 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525300 (= lt!241297 (toIndex!0 (select (arr!16039 a!3235) j!176) mask!3524))))

(assert (=> b!525300 (= lt!241296 (array!33376 (store (arr!16039 a!3235) i!1204 k0!2280) (size!16403 a!3235)))))

(declare-fun e!306289 () Bool)

(assert (=> b!525300 e!306289))

(declare-fun res!322089 () Bool)

(assert (=> b!525300 (=> (not res!322089) (not e!306289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33375 (_ BitVec 32)) Bool)

(assert (=> b!525300 (= res!322089 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16476 0))(
  ( (Unit!16477) )
))
(declare-fun lt!241303 () Unit!16476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16476)

(assert (=> b!525300 (= lt!241303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525301 () Bool)

(declare-fun res!322094 () Bool)

(assert (=> b!525301 (=> (not res!322094) (not e!306288))))

(assert (=> b!525301 (= res!322094 (validKeyInArray!0 (select (arr!16039 a!3235) j!176)))))

(declare-fun b!525302 () Bool)

(declare-fun res!322086 () Bool)

(assert (=> b!525302 (=> (not res!322086) (not e!306288))))

(declare-fun arrayContainsKey!0 (array!33375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525302 (= res!322086 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!322090 () Bool)

(assert (=> start!47738 (=> (not res!322090) (not e!306288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47738 (= res!322090 (validMask!0 mask!3524))))

(assert (=> start!47738 e!306288))

(assert (=> start!47738 true))

(declare-fun array_inv!11835 (array!33375) Bool)

(assert (=> start!47738 (array_inv!11835 a!3235)))

(declare-fun b!525303 () Bool)

(declare-fun res!322093 () Bool)

(assert (=> b!525303 (=> (not res!322093) (not e!306288))))

(assert (=> b!525303 (= res!322093 (and (= (size!16403 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16403 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16403 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525304 () Bool)

(declare-fun e!306294 () Bool)

(assert (=> b!525304 (= e!306294 false)))

(declare-fun b!525305 () Bool)

(declare-fun res!322083 () Bool)

(assert (=> b!525305 (=> (not res!322083) (not e!306293))))

(assert (=> b!525305 (= res!322083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525306 () Bool)

(declare-fun e!306291 () Unit!16476)

(declare-fun Unit!16478 () Unit!16476)

(assert (=> b!525306 (= e!306291 Unit!16478)))

(declare-fun b!525307 () Bool)

(declare-fun res!322085 () Bool)

(assert (=> b!525307 (=> res!322085 e!306292)))

(get-info :version)

(assert (=> b!525307 (= res!322085 (or (undefined!5318 lt!241301) (not ((_ is Intermediate!4506) lt!241301))))))

(declare-fun b!525308 () Bool)

(declare-fun Unit!16479 () Unit!16476)

(assert (=> b!525308 (= e!306291 Unit!16479)))

(declare-fun lt!241294 () Unit!16476)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33375 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16476)

(assert (=> b!525308 (= lt!241294 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241297 #b00000000000000000000000000000000 (index!20238 lt!241301) (x!49215 lt!241301) mask!3524))))

(declare-fun res!322088 () Bool)

(assert (=> b!525308 (= res!322088 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241297 lt!241298 lt!241296 mask!3524) (Intermediate!4506 false (index!20238 lt!241301) (x!49215 lt!241301))))))

(assert (=> b!525308 (=> (not res!322088) (not e!306294))))

(assert (=> b!525308 e!306294))

(declare-fun b!525309 () Bool)

(assert (=> b!525309 (= e!306289 (= (seekEntryOrOpen!0 (select (arr!16039 a!3235) j!176) a!3235 mask!3524) (Found!4506 j!176)))))

(declare-fun b!525310 () Bool)

(assert (=> b!525310 (= e!306292 true)))

(assert (=> b!525310 (= (index!20238 lt!241301) i!1204)))

(declare-fun lt!241295 () Unit!16476)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33375 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16476)

(assert (=> b!525310 (= lt!241295 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241297 #b00000000000000000000000000000000 (index!20238 lt!241301) (x!49215 lt!241301) mask!3524))))

(assert (=> b!525310 (and (or (= (select (arr!16039 a!3235) (index!20238 lt!241301)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16039 a!3235) (index!20238 lt!241301)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16039 a!3235) (index!20238 lt!241301)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16039 a!3235) (index!20238 lt!241301)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241300 () Unit!16476)

(assert (=> b!525310 (= lt!241300 e!306291)))

(declare-fun c!61913 () Bool)

(assert (=> b!525310 (= c!61913 (= (select (arr!16039 a!3235) (index!20238 lt!241301)) (select (arr!16039 a!3235) j!176)))))

(assert (=> b!525310 (and (bvslt (x!49215 lt!241301) #b01111111111111111111111111111110) (or (= (select (arr!16039 a!3235) (index!20238 lt!241301)) (select (arr!16039 a!3235) j!176)) (= (select (arr!16039 a!3235) (index!20238 lt!241301)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16039 a!3235) (index!20238 lt!241301)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525311 () Bool)

(declare-fun res!322084 () Bool)

(assert (=> b!525311 (=> (not res!322084) (not e!306293))))

(declare-datatypes ((List!10197 0))(
  ( (Nil!10194) (Cons!10193 (h!11124 (_ BitVec 64)) (t!16425 List!10197)) )
))
(declare-fun arrayNoDuplicates!0 (array!33375 (_ BitVec 32) List!10197) Bool)

(assert (=> b!525311 (= res!322084 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10194))))

(assert (= (and start!47738 res!322090) b!525303))

(assert (= (and b!525303 res!322093) b!525301))

(assert (= (and b!525301 res!322094) b!525299))

(assert (= (and b!525299 res!322091) b!525302))

(assert (= (and b!525302 res!322086) b!525298))

(assert (= (and b!525298 res!322092) b!525305))

(assert (= (and b!525305 res!322083) b!525311))

(assert (= (and b!525311 res!322084) b!525300))

(assert (= (and b!525300 res!322089) b!525309))

(assert (= (and b!525300 (not res!322087)) b!525307))

(assert (= (and b!525307 (not res!322085)) b!525310))

(assert (= (and b!525310 c!61913) b!525308))

(assert (= (and b!525310 (not c!61913)) b!525306))

(assert (= (and b!525308 res!322088) b!525304))

(declare-fun m!505949 () Bool)

(assert (=> b!525308 m!505949))

(declare-fun m!505951 () Bool)

(assert (=> b!525308 m!505951))

(declare-fun m!505953 () Bool)

(assert (=> b!525309 m!505953))

(assert (=> b!525309 m!505953))

(declare-fun m!505955 () Bool)

(assert (=> b!525309 m!505955))

(declare-fun m!505957 () Bool)

(assert (=> b!525300 m!505957))

(declare-fun m!505959 () Bool)

(assert (=> b!525300 m!505959))

(declare-fun m!505961 () Bool)

(assert (=> b!525300 m!505961))

(declare-fun m!505963 () Bool)

(assert (=> b!525300 m!505963))

(assert (=> b!525300 m!505953))

(declare-fun m!505965 () Bool)

(assert (=> b!525300 m!505965))

(assert (=> b!525300 m!505953))

(declare-fun m!505967 () Bool)

(assert (=> b!525300 m!505967))

(declare-fun m!505969 () Bool)

(assert (=> b!525300 m!505969))

(assert (=> b!525300 m!505953))

(declare-fun m!505971 () Bool)

(assert (=> b!525300 m!505971))

(assert (=> b!525301 m!505953))

(assert (=> b!525301 m!505953))

(declare-fun m!505973 () Bool)

(assert (=> b!525301 m!505973))

(declare-fun m!505975 () Bool)

(assert (=> start!47738 m!505975))

(declare-fun m!505977 () Bool)

(assert (=> start!47738 m!505977))

(declare-fun m!505979 () Bool)

(assert (=> b!525299 m!505979))

(declare-fun m!505981 () Bool)

(assert (=> b!525298 m!505981))

(declare-fun m!505983 () Bool)

(assert (=> b!525302 m!505983))

(declare-fun m!505985 () Bool)

(assert (=> b!525305 m!505985))

(declare-fun m!505987 () Bool)

(assert (=> b!525310 m!505987))

(declare-fun m!505989 () Bool)

(assert (=> b!525310 m!505989))

(assert (=> b!525310 m!505953))

(declare-fun m!505991 () Bool)

(assert (=> b!525311 m!505991))

(check-sat (not start!47738) (not b!525311) (not b!525305) (not b!525299) (not b!525301) (not b!525309) (not b!525302) (not b!525310) (not b!525300) (not b!525308) (not b!525298))
(check-sat)
