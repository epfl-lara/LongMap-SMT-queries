; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47780 () Bool)

(assert start!47780)

(declare-fun b!526329 () Bool)

(declare-datatypes ((Unit!16543 0))(
  ( (Unit!16544) )
))
(declare-fun e!306796 () Unit!16543)

(declare-fun Unit!16545 () Unit!16543)

(assert (=> b!526329 (= e!306796 Unit!16545)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!242086 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4483 0))(
  ( (MissingZero!4483 (index!20144 (_ BitVec 32))) (Found!4483 (index!20145 (_ BitVec 32))) (Intermediate!4483 (undefined!5295 Bool) (index!20146 (_ BitVec 32)) (x!49261 (_ BitVec 32))) (Undefined!4483) (MissingVacant!4483 (index!20147 (_ BitVec 32))) )
))
(declare-fun lt!242095 () SeekEntryResult!4483)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!33418 0))(
  ( (array!33419 (arr!16060 (Array (_ BitVec 32) (_ BitVec 64))) (size!16424 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33418)

(declare-fun lt!242089 () Unit!16543)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16543)

(assert (=> b!526329 (= lt!242089 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242086 #b00000000000000000000000000000000 (index!20146 lt!242095) (x!49261 lt!242095) mask!3524))))

(declare-fun lt!242093 () (_ BitVec 64))

(declare-fun res!323019 () Bool)

(declare-fun lt!242088 () array!33418)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33418 (_ BitVec 32)) SeekEntryResult!4483)

(assert (=> b!526329 (= res!323019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242086 lt!242093 lt!242088 mask!3524) (Intermediate!4483 false (index!20146 lt!242095) (x!49261 lt!242095))))))

(declare-fun e!306797 () Bool)

(assert (=> b!526329 (=> (not res!323019) (not e!306797))))

(assert (=> b!526329 e!306797))

(declare-fun b!526330 () Bool)

(declare-fun res!323021 () Bool)

(declare-fun e!306798 () Bool)

(assert (=> b!526330 (=> (not res!323021) (not e!306798))))

(declare-datatypes ((List!10125 0))(
  ( (Nil!10122) (Cons!10121 (h!11052 (_ BitVec 64)) (t!16345 List!10125)) )
))
(declare-fun arrayNoDuplicates!0 (array!33418 (_ BitVec 32) List!10125) Bool)

(assert (=> b!526330 (= res!323021 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10122))))

(declare-fun res!323016 () Bool)

(declare-fun e!306799 () Bool)

(assert (=> start!47780 (=> (not res!323016) (not e!306799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47780 (= res!323016 (validMask!0 mask!3524))))

(assert (=> start!47780 e!306799))

(assert (=> start!47780 true))

(declare-fun array_inv!11919 (array!33418) Bool)

(assert (=> start!47780 (array_inv!11919 a!3235)))

(declare-fun b!526331 () Bool)

(declare-fun e!306800 () Bool)

(assert (=> b!526331 (= e!306800 true)))

(assert (=> b!526331 (= (index!20146 lt!242095) i!1204)))

(declare-fun lt!242091 () Unit!16543)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16543)

(assert (=> b!526331 (= lt!242091 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242086 #b00000000000000000000000000000000 (index!20146 lt!242095) (x!49261 lt!242095) mask!3524))))

(assert (=> b!526331 (and (or (= (select (arr!16060 a!3235) (index!20146 lt!242095)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16060 a!3235) (index!20146 lt!242095)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16060 a!3235) (index!20146 lt!242095)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16060 a!3235) (index!20146 lt!242095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242094 () Unit!16543)

(assert (=> b!526331 (= lt!242094 e!306796)))

(declare-fun c!61964 () Bool)

(assert (=> b!526331 (= c!61964 (= (select (arr!16060 a!3235) (index!20146 lt!242095)) (select (arr!16060 a!3235) j!176)))))

(assert (=> b!526331 (and (bvslt (x!49261 lt!242095) #b01111111111111111111111111111110) (or (= (select (arr!16060 a!3235) (index!20146 lt!242095)) (select (arr!16060 a!3235) j!176)) (= (select (arr!16060 a!3235) (index!20146 lt!242095)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16060 a!3235) (index!20146 lt!242095)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526332 () Bool)

(declare-fun res!323015 () Bool)

(assert (=> b!526332 (=> (not res!323015) (not e!306799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526332 (= res!323015 (validKeyInArray!0 (select (arr!16060 a!3235) j!176)))))

(declare-fun b!526333 () Bool)

(declare-fun res!323012 () Bool)

(assert (=> b!526333 (=> (not res!323012) (not e!306799))))

(assert (=> b!526333 (= res!323012 (validKeyInArray!0 k0!2280))))

(declare-fun b!526334 () Bool)

(assert (=> b!526334 (= e!306798 (not e!306800))))

(declare-fun res!323020 () Bool)

(assert (=> b!526334 (=> res!323020 e!306800)))

(declare-fun lt!242087 () (_ BitVec 32))

(assert (=> b!526334 (= res!323020 (= lt!242095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242087 lt!242093 lt!242088 mask!3524)))))

(assert (=> b!526334 (= lt!242095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242086 (select (arr!16060 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526334 (= lt!242087 (toIndex!0 lt!242093 mask!3524))))

(assert (=> b!526334 (= lt!242093 (select (store (arr!16060 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526334 (= lt!242086 (toIndex!0 (select (arr!16060 a!3235) j!176) mask!3524))))

(assert (=> b!526334 (= lt!242088 (array!33419 (store (arr!16060 a!3235) i!1204 k0!2280) (size!16424 a!3235)))))

(declare-fun e!306801 () Bool)

(assert (=> b!526334 e!306801))

(declare-fun res!323014 () Bool)

(assert (=> b!526334 (=> (not res!323014) (not e!306801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33418 (_ BitVec 32)) Bool)

(assert (=> b!526334 (= res!323014 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242092 () Unit!16543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16543)

(assert (=> b!526334 (= lt!242092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526335 () Bool)

(declare-fun res!323023 () Bool)

(assert (=> b!526335 (=> res!323023 e!306800)))

(get-info :version)

(assert (=> b!526335 (= res!323023 (or (undefined!5295 lt!242095) (not ((_ is Intermediate!4483) lt!242095))))))

(declare-fun b!526336 () Bool)

(assert (=> b!526336 (= e!306797 false)))

(declare-fun b!526337 () Bool)

(declare-fun res!323018 () Bool)

(assert (=> b!526337 (=> (not res!323018) (not e!306798))))

(assert (=> b!526337 (= res!323018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526338 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33418 (_ BitVec 32)) SeekEntryResult!4483)

(assert (=> b!526338 (= e!306801 (= (seekEntryOrOpen!0 (select (arr!16060 a!3235) j!176) a!3235 mask!3524) (Found!4483 j!176)))))

(declare-fun b!526339 () Bool)

(assert (=> b!526339 (= e!306799 e!306798)))

(declare-fun res!323017 () Bool)

(assert (=> b!526339 (=> (not res!323017) (not e!306798))))

(declare-fun lt!242090 () SeekEntryResult!4483)

(assert (=> b!526339 (= res!323017 (or (= lt!242090 (MissingZero!4483 i!1204)) (= lt!242090 (MissingVacant!4483 i!1204))))))

(assert (=> b!526339 (= lt!242090 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526340 () Bool)

(declare-fun res!323013 () Bool)

(assert (=> b!526340 (=> (not res!323013) (not e!306799))))

(declare-fun arrayContainsKey!0 (array!33418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526340 (= res!323013 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526341 () Bool)

(declare-fun Unit!16546 () Unit!16543)

(assert (=> b!526341 (= e!306796 Unit!16546)))

(declare-fun b!526342 () Bool)

(declare-fun res!323022 () Bool)

(assert (=> b!526342 (=> (not res!323022) (not e!306799))))

(assert (=> b!526342 (= res!323022 (and (= (size!16424 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16424 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16424 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47780 res!323016) b!526342))

(assert (= (and b!526342 res!323022) b!526332))

(assert (= (and b!526332 res!323015) b!526333))

(assert (= (and b!526333 res!323012) b!526340))

(assert (= (and b!526340 res!323013) b!526339))

(assert (= (and b!526339 res!323017) b!526337))

(assert (= (and b!526337 res!323018) b!526330))

(assert (= (and b!526330 res!323021) b!526334))

(assert (= (and b!526334 res!323014) b!526338))

(assert (= (and b!526334 (not res!323020)) b!526335))

(assert (= (and b!526335 (not res!323023)) b!526331))

(assert (= (and b!526331 c!61964) b!526329))

(assert (= (and b!526331 (not c!61964)) b!526341))

(assert (= (and b!526329 res!323019) b!526336))

(declare-fun m!507277 () Bool)

(assert (=> b!526334 m!507277))

(declare-fun m!507279 () Bool)

(assert (=> b!526334 m!507279))

(declare-fun m!507281 () Bool)

(assert (=> b!526334 m!507281))

(declare-fun m!507283 () Bool)

(assert (=> b!526334 m!507283))

(assert (=> b!526334 m!507281))

(declare-fun m!507285 () Bool)

(assert (=> b!526334 m!507285))

(declare-fun m!507287 () Bool)

(assert (=> b!526334 m!507287))

(declare-fun m!507289 () Bool)

(assert (=> b!526334 m!507289))

(declare-fun m!507291 () Bool)

(assert (=> b!526334 m!507291))

(assert (=> b!526334 m!507281))

(declare-fun m!507293 () Bool)

(assert (=> b!526334 m!507293))

(assert (=> b!526338 m!507281))

(assert (=> b!526338 m!507281))

(declare-fun m!507295 () Bool)

(assert (=> b!526338 m!507295))

(declare-fun m!507297 () Bool)

(assert (=> b!526339 m!507297))

(declare-fun m!507299 () Bool)

(assert (=> start!47780 m!507299))

(declare-fun m!507301 () Bool)

(assert (=> start!47780 m!507301))

(declare-fun m!507303 () Bool)

(assert (=> b!526331 m!507303))

(declare-fun m!507305 () Bool)

(assert (=> b!526331 m!507305))

(assert (=> b!526331 m!507281))

(assert (=> b!526332 m!507281))

(assert (=> b!526332 m!507281))

(declare-fun m!507307 () Bool)

(assert (=> b!526332 m!507307))

(declare-fun m!507309 () Bool)

(assert (=> b!526337 m!507309))

(declare-fun m!507311 () Bool)

(assert (=> b!526340 m!507311))

(declare-fun m!507313 () Bool)

(assert (=> b!526333 m!507313))

(declare-fun m!507315 () Bool)

(assert (=> b!526329 m!507315))

(declare-fun m!507317 () Bool)

(assert (=> b!526329 m!507317))

(declare-fun m!507319 () Bool)

(assert (=> b!526330 m!507319))

(check-sat (not b!526333) (not b!526339) (not b!526330) (not b!526332) (not b!526338) (not b!526331) (not b!526334) (not start!47780) (not b!526329) (not b!526337) (not b!526340))
(check-sat)
