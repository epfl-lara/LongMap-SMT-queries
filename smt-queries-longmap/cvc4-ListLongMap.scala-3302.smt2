; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45760 () Bool)

(assert start!45760)

(declare-datatypes ((SeekEntryResult!4105 0))(
  ( (MissingZero!4105 (index!18608 (_ BitVec 32))) (Found!4105 (index!18609 (_ BitVec 32))) (Intermediate!4105 (undefined!4917 Bool) (index!18610 (_ BitVec 32)) (x!47610 (_ BitVec 32))) (Undefined!4105) (MissingVacant!4105 (index!18611 (_ BitVec 32))) )
))
(declare-fun lt!231027 () SeekEntryResult!4105)

(declare-fun lt!231022 () SeekEntryResult!4105)

(declare-fun lt!231034 () (_ BitVec 32))

(declare-fun b!506316 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296356 () Bool)

(declare-datatypes ((array!32516 0))(
  ( (array!32517 (arr!15638 (Array (_ BitVec 32) (_ BitVec 64))) (size!16002 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32516)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32516 (_ BitVec 32)) SeekEntryResult!4105)

(assert (=> b!506316 (= e!296356 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!231034 (index!18610 lt!231027) (select (arr!15638 a!3235) j!176) a!3235 mask!3524) lt!231022)))))

(declare-fun b!506317 () Bool)

(declare-fun e!296352 () Bool)

(declare-fun e!296351 () Bool)

(assert (=> b!506317 (= e!296352 e!296351)))

(declare-fun res!307285 () Bool)

(assert (=> b!506317 (=> (not res!307285) (not e!296351))))

(declare-fun lt!231030 () SeekEntryResult!4105)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506317 (= res!307285 (or (= lt!231030 (MissingZero!4105 i!1204)) (= lt!231030 (MissingVacant!4105 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32516 (_ BitVec 32)) SeekEntryResult!4105)

(assert (=> b!506317 (= lt!231030 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506318 () Bool)

(declare-fun res!307288 () Bool)

(assert (=> b!506318 (=> (not res!307288) (not e!296352))))

(declare-fun arrayContainsKey!0 (array!32516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506318 (= res!307288 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506319 () Bool)

(declare-datatypes ((Unit!15496 0))(
  ( (Unit!15497) )
))
(declare-fun e!296354 () Unit!15496)

(declare-fun Unit!15498 () Unit!15496)

(assert (=> b!506319 (= e!296354 Unit!15498)))

(declare-fun res!307281 () Bool)

(assert (=> start!45760 (=> (not res!307281) (not e!296352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45760 (= res!307281 (validMask!0 mask!3524))))

(assert (=> start!45760 e!296352))

(assert (=> start!45760 true))

(declare-fun array_inv!11434 (array!32516) Bool)

(assert (=> start!45760 (array_inv!11434 a!3235)))

(declare-fun b!506320 () Bool)

(declare-fun e!296349 () Bool)

(assert (=> b!506320 (= e!296351 (not e!296349))))

(declare-fun res!307280 () Bool)

(assert (=> b!506320 (=> res!307280 e!296349)))

(declare-fun lt!231025 () SeekEntryResult!4105)

(assert (=> b!506320 (= res!307280 (or (= lt!231027 lt!231025) (undefined!4917 lt!231027) (not (is-Intermediate!4105 lt!231027))))))

(declare-fun lt!231032 () (_ BitVec 32))

(declare-fun lt!231026 () array!32516)

(declare-fun lt!231023 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32516 (_ BitVec 32)) SeekEntryResult!4105)

(assert (=> b!506320 (= lt!231025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231032 lt!231023 lt!231026 mask!3524))))

(assert (=> b!506320 (= lt!231027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231034 (select (arr!15638 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506320 (= lt!231032 (toIndex!0 lt!231023 mask!3524))))

(assert (=> b!506320 (= lt!231023 (select (store (arr!15638 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!506320 (= lt!231034 (toIndex!0 (select (arr!15638 a!3235) j!176) mask!3524))))

(assert (=> b!506320 (= lt!231026 (array!32517 (store (arr!15638 a!3235) i!1204 k!2280) (size!16002 a!3235)))))

(assert (=> b!506320 (= lt!231022 (Found!4105 j!176))))

(declare-fun e!296358 () Bool)

(assert (=> b!506320 e!296358))

(declare-fun res!307279 () Bool)

(assert (=> b!506320 (=> (not res!307279) (not e!296358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32516 (_ BitVec 32)) Bool)

(assert (=> b!506320 (= res!307279 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!231028 () Unit!15496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15496)

(assert (=> b!506320 (= lt!231028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506321 () Bool)

(declare-fun e!296353 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506321 (= e!296353 (validKeyInArray!0 lt!231023))))

(declare-fun b!506322 () Bool)

(declare-fun e!296357 () Bool)

(assert (=> b!506322 (= e!296349 e!296357)))

(declare-fun res!307277 () Bool)

(assert (=> b!506322 (=> res!307277 e!296357)))

(assert (=> b!506322 (= res!307277 (or (bvsgt (x!47610 lt!231027) #b01111111111111111111111111111110) (bvslt lt!231034 #b00000000000000000000000000000000) (bvsge lt!231034 (size!16002 a!3235)) (bvslt (index!18610 lt!231027) #b00000000000000000000000000000000) (bvsge (index!18610 lt!231027) (size!16002 a!3235)) (not (= lt!231027 (Intermediate!4105 false (index!18610 lt!231027) (x!47610 lt!231027))))))))

(assert (=> b!506322 (= (index!18610 lt!231027) i!1204)))

(declare-fun lt!231031 () Unit!15496)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15496)

(assert (=> b!506322 (= lt!231031 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!231034 #b00000000000000000000000000000000 (index!18610 lt!231027) (x!47610 lt!231027) mask!3524))))

(assert (=> b!506322 (and (or (= (select (arr!15638 a!3235) (index!18610 lt!231027)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15638 a!3235) (index!18610 lt!231027)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15638 a!3235) (index!18610 lt!231027)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15638 a!3235) (index!18610 lt!231027)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!231024 () Unit!15496)

(assert (=> b!506322 (= lt!231024 e!296354)))

(declare-fun c!59798 () Bool)

(assert (=> b!506322 (= c!59798 (= (select (arr!15638 a!3235) (index!18610 lt!231027)) (select (arr!15638 a!3235) j!176)))))

(assert (=> b!506322 (and (bvslt (x!47610 lt!231027) #b01111111111111111111111111111110) (or (= (select (arr!15638 a!3235) (index!18610 lt!231027)) (select (arr!15638 a!3235) j!176)) (= (select (arr!15638 a!3235) (index!18610 lt!231027)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15638 a!3235) (index!18610 lt!231027)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!506323 () Bool)

(declare-fun res!307278 () Bool)

(assert (=> b!506323 (=> (not res!307278) (not e!296351))))

(declare-datatypes ((List!9796 0))(
  ( (Nil!9793) (Cons!9792 (h!10669 (_ BitVec 64)) (t!16024 List!9796)) )
))
(declare-fun arrayNoDuplicates!0 (array!32516 (_ BitVec 32) List!9796) Bool)

(assert (=> b!506323 (= res!307278 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9793))))

(declare-fun b!506324 () Bool)

(assert (=> b!506324 (= e!296358 (= (seekEntryOrOpen!0 (select (arr!15638 a!3235) j!176) a!3235 mask!3524) (Found!4105 j!176)))))

(declare-fun b!506325 () Bool)

(declare-fun res!307283 () Bool)

(assert (=> b!506325 (=> res!307283 e!296357)))

(assert (=> b!506325 (= res!307283 (not (= lt!231025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231034 lt!231023 lt!231026 mask!3524))))))

(declare-fun b!506326 () Bool)

(declare-fun res!307282 () Bool)

(assert (=> b!506326 (=> (not res!307282) (not e!296352))))

(assert (=> b!506326 (= res!307282 (and (= (size!16002 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16002 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16002 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506327 () Bool)

(declare-fun res!307286 () Bool)

(assert (=> b!506327 (=> res!307286 e!296357)))

(assert (=> b!506327 (= res!307286 e!296356)))

(declare-fun res!307289 () Bool)

(assert (=> b!506327 (=> (not res!307289) (not e!296356))))

(assert (=> b!506327 (= res!307289 (bvsgt #b00000000000000000000000000000000 (x!47610 lt!231027)))))

(declare-fun b!506328 () Bool)

(assert (=> b!506328 (= e!296357 e!296353)))

(declare-fun res!307287 () Bool)

(assert (=> b!506328 (=> res!307287 e!296353)))

(assert (=> b!506328 (= res!307287 (bvslt mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!506328 (= (seekEntryOrOpen!0 lt!231023 lt!231026 mask!3524) lt!231022)))

(declare-fun lt!231033 () Unit!15496)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15496)

(assert (=> b!506328 (= lt!231033 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!231034 #b00000000000000000000000000000000 (index!18610 lt!231027) (x!47610 lt!231027) mask!3524))))

(declare-fun b!506329 () Bool)

(declare-fun e!296355 () Bool)

(assert (=> b!506329 (= e!296355 false)))

(declare-fun b!506330 () Bool)

(declare-fun res!307291 () Bool)

(assert (=> b!506330 (=> (not res!307291) (not e!296351))))

(assert (=> b!506330 (= res!307291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506331 () Bool)

(declare-fun Unit!15499 () Unit!15496)

(assert (=> b!506331 (= e!296354 Unit!15499)))

(declare-fun lt!231029 () Unit!15496)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15496)

(assert (=> b!506331 (= lt!231029 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!231034 #b00000000000000000000000000000000 (index!18610 lt!231027) (x!47610 lt!231027) mask!3524))))

(declare-fun res!307290 () Bool)

(assert (=> b!506331 (= res!307290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231034 lt!231023 lt!231026 mask!3524) (Intermediate!4105 false (index!18610 lt!231027) (x!47610 lt!231027))))))

(assert (=> b!506331 (=> (not res!307290) (not e!296355))))

(assert (=> b!506331 e!296355))

(declare-fun b!506332 () Bool)

(declare-fun res!307284 () Bool)

(assert (=> b!506332 (=> (not res!307284) (not e!296352))))

(assert (=> b!506332 (= res!307284 (validKeyInArray!0 k!2280))))

(declare-fun b!506333 () Bool)

(declare-fun res!307292 () Bool)

(assert (=> b!506333 (=> (not res!307292) (not e!296352))))

(assert (=> b!506333 (= res!307292 (validKeyInArray!0 (select (arr!15638 a!3235) j!176)))))

(assert (= (and start!45760 res!307281) b!506326))

(assert (= (and b!506326 res!307282) b!506333))

(assert (= (and b!506333 res!307292) b!506332))

(assert (= (and b!506332 res!307284) b!506318))

(assert (= (and b!506318 res!307288) b!506317))

(assert (= (and b!506317 res!307285) b!506330))

(assert (= (and b!506330 res!307291) b!506323))

(assert (= (and b!506323 res!307278) b!506320))

(assert (= (and b!506320 res!307279) b!506324))

(assert (= (and b!506320 (not res!307280)) b!506322))

(assert (= (and b!506322 c!59798) b!506331))

(assert (= (and b!506322 (not c!59798)) b!506319))

(assert (= (and b!506331 res!307290) b!506329))

(assert (= (and b!506322 (not res!307277)) b!506327))

(assert (= (and b!506327 res!307289) b!506316))

(assert (= (and b!506327 (not res!307286)) b!506325))

(assert (= (and b!506325 (not res!307283)) b!506328))

(assert (= (and b!506328 (not res!307287)) b!506321))

(declare-fun m!486959 () Bool)

(assert (=> start!45760 m!486959))

(declare-fun m!486961 () Bool)

(assert (=> start!45760 m!486961))

(declare-fun m!486963 () Bool)

(assert (=> b!506320 m!486963))

(declare-fun m!486965 () Bool)

(assert (=> b!506320 m!486965))

(declare-fun m!486967 () Bool)

(assert (=> b!506320 m!486967))

(declare-fun m!486969 () Bool)

(assert (=> b!506320 m!486969))

(declare-fun m!486971 () Bool)

(assert (=> b!506320 m!486971))

(declare-fun m!486973 () Bool)

(assert (=> b!506320 m!486973))

(assert (=> b!506320 m!486963))

(declare-fun m!486975 () Bool)

(assert (=> b!506320 m!486975))

(assert (=> b!506320 m!486963))

(declare-fun m!486977 () Bool)

(assert (=> b!506320 m!486977))

(declare-fun m!486979 () Bool)

(assert (=> b!506320 m!486979))

(declare-fun m!486981 () Bool)

(assert (=> b!506321 m!486981))

(declare-fun m!486983 () Bool)

(assert (=> b!506317 m!486983))

(assert (=> b!506324 m!486963))

(assert (=> b!506324 m!486963))

(declare-fun m!486985 () Bool)

(assert (=> b!506324 m!486985))

(declare-fun m!486987 () Bool)

(assert (=> b!506331 m!486987))

(declare-fun m!486989 () Bool)

(assert (=> b!506331 m!486989))

(assert (=> b!506333 m!486963))

(assert (=> b!506333 m!486963))

(declare-fun m!486991 () Bool)

(assert (=> b!506333 m!486991))

(declare-fun m!486993 () Bool)

(assert (=> b!506318 m!486993))

(assert (=> b!506325 m!486989))

(declare-fun m!486995 () Bool)

(assert (=> b!506330 m!486995))

(declare-fun m!486997 () Bool)

(assert (=> b!506332 m!486997))

(declare-fun m!486999 () Bool)

(assert (=> b!506328 m!486999))

(declare-fun m!487001 () Bool)

(assert (=> b!506328 m!487001))

(assert (=> b!506316 m!486963))

(assert (=> b!506316 m!486963))

(declare-fun m!487003 () Bool)

(assert (=> b!506316 m!487003))

(declare-fun m!487005 () Bool)

(assert (=> b!506322 m!487005))

(declare-fun m!487007 () Bool)

(assert (=> b!506322 m!487007))

(assert (=> b!506322 m!486963))

(declare-fun m!487009 () Bool)

(assert (=> b!506323 m!487009))

(push 1)

