; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45666 () Bool)

(assert start!45666)

(declare-fun res!305307 () Bool)

(declare-fun e!295060 () Bool)

(assert (=> start!45666 (=> (not res!305307) (not e!295060))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45666 (= res!305307 (validMask!0 mask!3524))))

(assert (=> start!45666 e!295060))

(assert (=> start!45666 true))

(declare-datatypes ((array!32432 0))(
  ( (array!32433 (arr!15596 (Array (_ BitVec 32) (_ BitVec 64))) (size!15961 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32432)

(declare-fun array_inv!11479 (array!32432) Bool)

(assert (=> start!45666 (array_inv!11479 a!3235)))

(declare-fun b!503946 () Bool)

(declare-fun res!305305 () Bool)

(assert (=> b!503946 (=> (not res!305305) (not e!295060))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503946 (= res!305305 (validKeyInArray!0 (select (arr!15596 a!3235) j!176)))))

(declare-datatypes ((SeekEntryResult!4060 0))(
  ( (MissingZero!4060 (index!18428 (_ BitVec 32))) (Found!4060 (index!18429 (_ BitVec 32))) (Intermediate!4060 (undefined!4872 Bool) (index!18430 (_ BitVec 32)) (x!47456 (_ BitVec 32))) (Undefined!4060) (MissingVacant!4060 (index!18431 (_ BitVec 32))) )
))
(declare-fun lt!229298 () SeekEntryResult!4060)

(declare-fun e!295068 () Bool)

(declare-fun lt!229297 () (_ BitVec 32))

(declare-fun b!503947 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32432 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!503947 (= e!295068 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229297 (index!18430 lt!229298) (select (arr!15596 a!3235) j!176) a!3235 mask!3524) (Found!4060 j!176))))))

(declare-fun b!503948 () Bool)

(declare-fun res!305301 () Bool)

(declare-fun e!295063 () Bool)

(assert (=> b!503948 (=> (not res!305301) (not e!295063))))

(declare-datatypes ((List!9793 0))(
  ( (Nil!9790) (Cons!9789 (h!10666 (_ BitVec 64)) (t!16012 List!9793)) )
))
(declare-fun arrayNoDuplicates!0 (array!32432 (_ BitVec 32) List!9793) Bool)

(assert (=> b!503948 (= res!305301 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9790))))

(declare-fun b!503949 () Bool)

(declare-fun res!305302 () Bool)

(declare-fun e!295067 () Bool)

(assert (=> b!503949 (=> res!305302 e!295067)))

(assert (=> b!503949 (= res!305302 e!295068)))

(declare-fun res!305306 () Bool)

(assert (=> b!503949 (=> (not res!305306) (not e!295068))))

(assert (=> b!503949 (= res!305306 (bvsgt #b00000000000000000000000000000000 (x!47456 lt!229298)))))

(declare-fun b!503950 () Bool)

(declare-fun e!295065 () Bool)

(assert (=> b!503950 (= e!295065 e!295067)))

(declare-fun res!305299 () Bool)

(assert (=> b!503950 (=> res!305299 e!295067)))

(assert (=> b!503950 (= res!305299 (or (bvsgt (x!47456 lt!229298) #b01111111111111111111111111111110) (bvslt lt!229297 #b00000000000000000000000000000000) (bvsge lt!229297 (size!15961 a!3235)) (bvslt (index!18430 lt!229298) #b00000000000000000000000000000000) (bvsge (index!18430 lt!229298) (size!15961 a!3235)) (not (= lt!229298 (Intermediate!4060 false (index!18430 lt!229298) (x!47456 lt!229298))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503950 (= (index!18430 lt!229298) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!15310 0))(
  ( (Unit!15311) )
))
(declare-fun lt!229302 () Unit!15310)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32432 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15310)

(assert (=> b!503950 (= lt!229302 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229297 #b00000000000000000000000000000000 (index!18430 lt!229298) (x!47456 lt!229298) mask!3524))))

(assert (=> b!503950 (and (or (= (select (arr!15596 a!3235) (index!18430 lt!229298)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15596 a!3235) (index!18430 lt!229298)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15596 a!3235) (index!18430 lt!229298)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15596 a!3235) (index!18430 lt!229298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229293 () Unit!15310)

(declare-fun e!295064 () Unit!15310)

(assert (=> b!503950 (= lt!229293 e!295064)))

(declare-fun c!59604 () Bool)

(assert (=> b!503950 (= c!59604 (= (select (arr!15596 a!3235) (index!18430 lt!229298)) (select (arr!15596 a!3235) j!176)))))

(assert (=> b!503950 (and (bvslt (x!47456 lt!229298) #b01111111111111111111111111111110) (or (= (select (arr!15596 a!3235) (index!18430 lt!229298)) (select (arr!15596 a!3235) j!176)) (= (select (arr!15596 a!3235) (index!18430 lt!229298)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15596 a!3235) (index!18430 lt!229298)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503951 () Bool)

(declare-fun res!305308 () Bool)

(assert (=> b!503951 (=> res!305308 e!295065)))

(get-info :version)

(assert (=> b!503951 (= res!305308 (or (undefined!4872 lt!229298) (not ((_ is Intermediate!4060) lt!229298))))))

(declare-fun b!503952 () Bool)

(declare-fun Unit!15312 () Unit!15310)

(assert (=> b!503952 (= e!295064 Unit!15312)))

(declare-fun b!503953 () Bool)

(declare-fun res!305300 () Bool)

(assert (=> b!503953 (=> (not res!305300) (not e!295063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32432 (_ BitVec 32)) Bool)

(assert (=> b!503953 (= res!305300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503954 () Bool)

(declare-fun res!305303 () Bool)

(assert (=> b!503954 (=> (not res!305303) (not e!295060))))

(assert (=> b!503954 (= res!305303 (validKeyInArray!0 k0!2280))))

(declare-fun b!503955 () Bool)

(declare-fun res!305309 () Bool)

(assert (=> b!503955 (=> (not res!305309) (not e!295060))))

(declare-fun arrayContainsKey!0 (array!32432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503955 (= res!305309 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503956 () Bool)

(assert (=> b!503956 (= e!295063 (not e!295065))))

(declare-fun res!305304 () Bool)

(assert (=> b!503956 (=> res!305304 e!295065)))

(declare-fun lt!229303 () array!32432)

(declare-fun lt!229296 () (_ BitVec 64))

(declare-fun lt!229294 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32432 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!503956 (= res!305304 (= lt!229298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229294 lt!229296 lt!229303 mask!3524)))))

(assert (=> b!503956 (= lt!229298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229297 (select (arr!15596 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503956 (= lt!229294 (toIndex!0 lt!229296 mask!3524))))

(assert (=> b!503956 (= lt!229296 (select (store (arr!15596 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503956 (= lt!229297 (toIndex!0 (select (arr!15596 a!3235) j!176) mask!3524))))

(assert (=> b!503956 (= lt!229303 (array!32433 (store (arr!15596 a!3235) i!1204 k0!2280) (size!15961 a!3235)))))

(declare-fun e!295066 () Bool)

(assert (=> b!503956 e!295066))

(declare-fun res!305297 () Bool)

(assert (=> b!503956 (=> (not res!305297) (not e!295066))))

(assert (=> b!503956 (= res!305297 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229300 () Unit!15310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15310)

(assert (=> b!503956 (= lt!229300 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503957 () Bool)

(declare-fun res!305298 () Bool)

(assert (=> b!503957 (=> (not res!305298) (not e!295060))))

(assert (=> b!503957 (= res!305298 (and (= (size!15961 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15961 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15961 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503958 () Bool)

(declare-fun Unit!15313 () Unit!15310)

(assert (=> b!503958 (= e!295064 Unit!15313)))

(declare-fun lt!229301 () Unit!15310)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32432 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15310)

(assert (=> b!503958 (= lt!229301 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229297 #b00000000000000000000000000000000 (index!18430 lt!229298) (x!47456 lt!229298) mask!3524))))

(declare-fun res!305295 () Bool)

(assert (=> b!503958 (= res!305295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229297 lt!229296 lt!229303 mask!3524) (Intermediate!4060 false (index!18430 lt!229298) (x!47456 lt!229298))))))

(declare-fun e!295061 () Bool)

(assert (=> b!503958 (=> (not res!305295) (not e!295061))))

(assert (=> b!503958 e!295061))

(declare-fun b!503959 () Bool)

(assert (=> b!503959 (= e!295061 false)))

(declare-fun b!503960 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32432 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!503960 (= e!295066 (= (seekEntryOrOpen!0 (select (arr!15596 a!3235) j!176) a!3235 mask!3524) (Found!4060 j!176)))))

(declare-fun b!503961 () Bool)

(assert (=> b!503961 (= e!295060 e!295063)))

(declare-fun res!305296 () Bool)

(assert (=> b!503961 (=> (not res!305296) (not e!295063))))

(declare-fun lt!229295 () SeekEntryResult!4060)

(assert (=> b!503961 (= res!305296 (or (= lt!229295 (MissingZero!4060 i!1204)) (= lt!229295 (MissingVacant!4060 i!1204))))))

(assert (=> b!503961 (= lt!229295 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503962 () Bool)

(assert (=> b!503962 (= e!295067 true)))

(declare-fun lt!229299 () SeekEntryResult!4060)

(assert (=> b!503962 (= lt!229299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229297 lt!229296 lt!229303 mask!3524))))

(assert (= (and start!45666 res!305307) b!503957))

(assert (= (and b!503957 res!305298) b!503946))

(assert (= (and b!503946 res!305305) b!503954))

(assert (= (and b!503954 res!305303) b!503955))

(assert (= (and b!503955 res!305309) b!503961))

(assert (= (and b!503961 res!305296) b!503953))

(assert (= (and b!503953 res!305300) b!503948))

(assert (= (and b!503948 res!305301) b!503956))

(assert (= (and b!503956 res!305297) b!503960))

(assert (= (and b!503956 (not res!305304)) b!503951))

(assert (= (and b!503951 (not res!305308)) b!503950))

(assert (= (and b!503950 c!59604) b!503958))

(assert (= (and b!503950 (not c!59604)) b!503952))

(assert (= (and b!503958 res!305295) b!503959))

(assert (= (and b!503950 (not res!305299)) b!503949))

(assert (= (and b!503949 res!305306) b!503947))

(assert (= (and b!503949 (not res!305302)) b!503962))

(declare-fun m!484225 () Bool)

(assert (=> b!503953 m!484225))

(declare-fun m!484227 () Bool)

(assert (=> b!503954 m!484227))

(declare-fun m!484229 () Bool)

(assert (=> start!45666 m!484229))

(declare-fun m!484231 () Bool)

(assert (=> start!45666 m!484231))

(declare-fun m!484233 () Bool)

(assert (=> b!503950 m!484233))

(declare-fun m!484235 () Bool)

(assert (=> b!503950 m!484235))

(declare-fun m!484237 () Bool)

(assert (=> b!503950 m!484237))

(declare-fun m!484239 () Bool)

(assert (=> b!503948 m!484239))

(assert (=> b!503946 m!484237))

(assert (=> b!503946 m!484237))

(declare-fun m!484241 () Bool)

(assert (=> b!503946 m!484241))

(declare-fun m!484243 () Bool)

(assert (=> b!503955 m!484243))

(assert (=> b!503947 m!484237))

(assert (=> b!503947 m!484237))

(declare-fun m!484245 () Bool)

(assert (=> b!503947 m!484245))

(declare-fun m!484247 () Bool)

(assert (=> b!503958 m!484247))

(declare-fun m!484249 () Bool)

(assert (=> b!503958 m!484249))

(assert (=> b!503962 m!484249))

(assert (=> b!503960 m!484237))

(assert (=> b!503960 m!484237))

(declare-fun m!484251 () Bool)

(assert (=> b!503960 m!484251))

(declare-fun m!484253 () Bool)

(assert (=> b!503956 m!484253))

(declare-fun m!484255 () Bool)

(assert (=> b!503956 m!484255))

(assert (=> b!503956 m!484237))

(declare-fun m!484257 () Bool)

(assert (=> b!503956 m!484257))

(assert (=> b!503956 m!484237))

(declare-fun m!484259 () Bool)

(assert (=> b!503956 m!484259))

(assert (=> b!503956 m!484237))

(declare-fun m!484261 () Bool)

(assert (=> b!503956 m!484261))

(declare-fun m!484263 () Bool)

(assert (=> b!503956 m!484263))

(declare-fun m!484265 () Bool)

(assert (=> b!503956 m!484265))

(declare-fun m!484267 () Bool)

(assert (=> b!503956 m!484267))

(declare-fun m!484269 () Bool)

(assert (=> b!503961 m!484269))

(check-sat (not b!503954) (not b!503962) (not b!503961) (not b!503947) (not b!503948) (not b!503950) (not b!503958) (not b!503953) (not b!503956) (not b!503955) (not b!503960) (not b!503946) (not start!45666))
(check-sat)
