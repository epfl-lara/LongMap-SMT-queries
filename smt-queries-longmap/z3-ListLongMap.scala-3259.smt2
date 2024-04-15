; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45414 () Bool)

(assert start!45414)

(declare-fun e!292554 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32249 0))(
  ( (array!32250 (arr!15506 (Array (_ BitVec 32) (_ BitVec 64))) (size!15871 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32249)

(declare-fun b!499277 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3970 0))(
  ( (MissingZero!3970 (index!18062 (_ BitVec 32))) (Found!3970 (index!18063 (_ BitVec 32))) (Intermediate!3970 (undefined!4782 Bool) (index!18064 (_ BitVec 32)) (x!47114 (_ BitVec 32))) (Undefined!3970) (MissingVacant!3970 (index!18065 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32249 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!499277 (= e!292554 (= (seekEntryOrOpen!0 (select (arr!15506 a!3235) j!176) a!3235 mask!3524) (Found!3970 j!176)))))

(declare-fun b!499278 () Bool)

(declare-fun res!301375 () Bool)

(declare-fun e!292557 () Bool)

(assert (=> b!499278 (=> (not res!301375) (not e!292557))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499278 (= res!301375 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499279 () Bool)

(declare-fun res!301379 () Bool)

(assert (=> b!499279 (=> (not res!301379) (not e!292557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499279 (= res!301379 (validKeyInArray!0 (select (arr!15506 a!3235) j!176)))))

(declare-fun b!499280 () Bool)

(declare-fun res!301378 () Bool)

(declare-fun e!292556 () Bool)

(assert (=> b!499280 (=> (not res!301378) (not e!292556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32249 (_ BitVec 32)) Bool)

(assert (=> b!499280 (= res!301378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499281 () Bool)

(declare-fun e!292559 () Bool)

(declare-fun e!292560 () Bool)

(assert (=> b!499281 (= e!292559 e!292560)))

(declare-fun res!301372 () Bool)

(assert (=> b!499281 (=> res!301372 e!292560)))

(declare-fun lt!226292 () (_ BitVec 32))

(declare-fun lt!226285 () SeekEntryResult!3970)

(assert (=> b!499281 (= res!301372 (or (bvsgt #b00000000000000000000000000000000 (x!47114 lt!226285)) (bvsgt (x!47114 lt!226285) #b01111111111111111111111111111110) (bvslt lt!226292 #b00000000000000000000000000000000) (bvsge lt!226292 (size!15871 a!3235)) (bvslt (index!18064 lt!226285) #b00000000000000000000000000000000) (bvsge (index!18064 lt!226285) (size!15871 a!3235)) (not (= lt!226285 (Intermediate!3970 false (index!18064 lt!226285) (x!47114 lt!226285))))))))

(assert (=> b!499281 (and (or (= (select (arr!15506 a!3235) (index!18064 lt!226285)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15506 a!3235) (index!18064 lt!226285)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15506 a!3235) (index!18064 lt!226285)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15506 a!3235) (index!18064 lt!226285)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14950 0))(
  ( (Unit!14951) )
))
(declare-fun lt!226291 () Unit!14950)

(declare-fun e!292558 () Unit!14950)

(assert (=> b!499281 (= lt!226291 e!292558)))

(declare-fun c!59232 () Bool)

(assert (=> b!499281 (= c!59232 (= (select (arr!15506 a!3235) (index!18064 lt!226285)) (select (arr!15506 a!3235) j!176)))))

(assert (=> b!499281 (and (bvslt (x!47114 lt!226285) #b01111111111111111111111111111110) (or (= (select (arr!15506 a!3235) (index!18064 lt!226285)) (select (arr!15506 a!3235) j!176)) (= (select (arr!15506 a!3235) (index!18064 lt!226285)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15506 a!3235) (index!18064 lt!226285)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499282 () Bool)

(assert (=> b!499282 (= e!292556 (not e!292559))))

(declare-fun res!301371 () Bool)

(assert (=> b!499282 (=> res!301371 e!292559)))

(declare-fun lt!226288 () array!32249)

(declare-fun lt!226287 () (_ BitVec 32))

(declare-fun lt!226286 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32249 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!499282 (= res!301371 (= lt!226285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226287 lt!226286 lt!226288 mask!3524)))))

(assert (=> b!499282 (= lt!226285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226292 (select (arr!15506 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499282 (= lt!226287 (toIndex!0 lt!226286 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499282 (= lt!226286 (select (store (arr!15506 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499282 (= lt!226292 (toIndex!0 (select (arr!15506 a!3235) j!176) mask!3524))))

(assert (=> b!499282 (= lt!226288 (array!32250 (store (arr!15506 a!3235) i!1204 k0!2280) (size!15871 a!3235)))))

(assert (=> b!499282 e!292554))

(declare-fun res!301376 () Bool)

(assert (=> b!499282 (=> (not res!301376) (not e!292554))))

(assert (=> b!499282 (= res!301376 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226293 () Unit!14950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14950)

(assert (=> b!499282 (= lt!226293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499283 () Bool)

(declare-fun Unit!14952 () Unit!14950)

(assert (=> b!499283 (= e!292558 Unit!14952)))

(declare-fun b!499284 () Bool)

(declare-fun e!292553 () Bool)

(assert (=> b!499284 (= e!292553 false)))

(declare-fun res!301373 () Bool)

(assert (=> start!45414 (=> (not res!301373) (not e!292557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45414 (= res!301373 (validMask!0 mask!3524))))

(assert (=> start!45414 e!292557))

(assert (=> start!45414 true))

(declare-fun array_inv!11389 (array!32249) Bool)

(assert (=> start!45414 (array_inv!11389 a!3235)))

(declare-fun b!499285 () Bool)

(declare-fun res!301370 () Bool)

(assert (=> b!499285 (=> res!301370 e!292559)))

(get-info :version)

(assert (=> b!499285 (= res!301370 (or (undefined!4782 lt!226285) (not ((_ is Intermediate!3970) lt!226285))))))

(declare-fun b!499286 () Bool)

(declare-fun res!301368 () Bool)

(assert (=> b!499286 (=> (not res!301368) (not e!292557))))

(assert (=> b!499286 (= res!301368 (validKeyInArray!0 k0!2280))))

(declare-fun b!499287 () Bool)

(assert (=> b!499287 (= e!292557 e!292556)))

(declare-fun res!301374 () Bool)

(assert (=> b!499287 (=> (not res!301374) (not e!292556))))

(declare-fun lt!226294 () SeekEntryResult!3970)

(assert (=> b!499287 (= res!301374 (or (= lt!226294 (MissingZero!3970 i!1204)) (= lt!226294 (MissingVacant!3970 i!1204))))))

(assert (=> b!499287 (= lt!226294 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499288 () Bool)

(declare-fun res!301367 () Bool)

(assert (=> b!499288 (=> (not res!301367) (not e!292557))))

(assert (=> b!499288 (= res!301367 (and (= (size!15871 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15871 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15871 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499289 () Bool)

(assert (=> b!499289 (= e!292560 true)))

(declare-fun lt!226290 () SeekEntryResult!3970)

(assert (=> b!499289 (= lt!226290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226292 lt!226286 lt!226288 mask!3524))))

(declare-fun b!499290 () Bool)

(declare-fun res!301369 () Bool)

(assert (=> b!499290 (=> (not res!301369) (not e!292556))))

(declare-datatypes ((List!9703 0))(
  ( (Nil!9700) (Cons!9699 (h!10573 (_ BitVec 64)) (t!15922 List!9703)) )
))
(declare-fun arrayNoDuplicates!0 (array!32249 (_ BitVec 32) List!9703) Bool)

(assert (=> b!499290 (= res!301369 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9700))))

(declare-fun b!499291 () Bool)

(declare-fun Unit!14953 () Unit!14950)

(assert (=> b!499291 (= e!292558 Unit!14953)))

(declare-fun lt!226289 () Unit!14950)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14950)

(assert (=> b!499291 (= lt!226289 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226292 #b00000000000000000000000000000000 (index!18064 lt!226285) (x!47114 lt!226285) mask!3524))))

(declare-fun res!301377 () Bool)

(assert (=> b!499291 (= res!301377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226292 lt!226286 lt!226288 mask!3524) (Intermediate!3970 false (index!18064 lt!226285) (x!47114 lt!226285))))))

(assert (=> b!499291 (=> (not res!301377) (not e!292553))))

(assert (=> b!499291 e!292553))

(assert (= (and start!45414 res!301373) b!499288))

(assert (= (and b!499288 res!301367) b!499279))

(assert (= (and b!499279 res!301379) b!499286))

(assert (= (and b!499286 res!301368) b!499278))

(assert (= (and b!499278 res!301375) b!499287))

(assert (= (and b!499287 res!301374) b!499280))

(assert (= (and b!499280 res!301378) b!499290))

(assert (= (and b!499290 res!301369) b!499282))

(assert (= (and b!499282 res!301376) b!499277))

(assert (= (and b!499282 (not res!301371)) b!499285))

(assert (= (and b!499285 (not res!301370)) b!499281))

(assert (= (and b!499281 c!59232) b!499291))

(assert (= (and b!499281 (not c!59232)) b!499283))

(assert (= (and b!499291 res!301377) b!499284))

(assert (= (and b!499281 (not res!301372)) b!499289))

(declare-fun m!479989 () Bool)

(assert (=> b!499282 m!479989))

(declare-fun m!479991 () Bool)

(assert (=> b!499282 m!479991))

(declare-fun m!479993 () Bool)

(assert (=> b!499282 m!479993))

(declare-fun m!479995 () Bool)

(assert (=> b!499282 m!479995))

(declare-fun m!479997 () Bool)

(assert (=> b!499282 m!479997))

(declare-fun m!479999 () Bool)

(assert (=> b!499282 m!479999))

(assert (=> b!499282 m!479995))

(declare-fun m!480001 () Bool)

(assert (=> b!499282 m!480001))

(declare-fun m!480003 () Bool)

(assert (=> b!499282 m!480003))

(declare-fun m!480005 () Bool)

(assert (=> b!499282 m!480005))

(assert (=> b!499282 m!479995))

(declare-fun m!480007 () Bool)

(assert (=> b!499278 m!480007))

(declare-fun m!480009 () Bool)

(assert (=> b!499281 m!480009))

(assert (=> b!499281 m!479995))

(declare-fun m!480011 () Bool)

(assert (=> b!499280 m!480011))

(declare-fun m!480013 () Bool)

(assert (=> b!499289 m!480013))

(assert (=> b!499279 m!479995))

(assert (=> b!499279 m!479995))

(declare-fun m!480015 () Bool)

(assert (=> b!499279 m!480015))

(declare-fun m!480017 () Bool)

(assert (=> start!45414 m!480017))

(declare-fun m!480019 () Bool)

(assert (=> start!45414 m!480019))

(declare-fun m!480021 () Bool)

(assert (=> b!499290 m!480021))

(assert (=> b!499277 m!479995))

(assert (=> b!499277 m!479995))

(declare-fun m!480023 () Bool)

(assert (=> b!499277 m!480023))

(declare-fun m!480025 () Bool)

(assert (=> b!499286 m!480025))

(declare-fun m!480027 () Bool)

(assert (=> b!499291 m!480027))

(assert (=> b!499291 m!480013))

(declare-fun m!480029 () Bool)

(assert (=> b!499287 m!480029))

(check-sat (not b!499277) (not b!499289) (not b!499291) (not b!499287) (not b!499280) (not start!45414) (not b!499279) (not b!499278) (not b!499286) (not b!499282) (not b!499290))
(check-sat)
