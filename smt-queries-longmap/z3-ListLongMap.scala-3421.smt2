; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47438 () Bool)

(assert start!47438)

(declare-fun b!522315 () Bool)

(declare-fun e!304649 () Bool)

(assert (=> b!522315 (= e!304649 false)))

(declare-fun b!522316 () Bool)

(declare-fun res!320040 () Bool)

(declare-fun e!304646 () Bool)

(assert (=> b!522316 (=> (not res!320040) (not e!304646))))

(declare-datatypes ((array!33265 0))(
  ( (array!33266 (arr!15988 (Array (_ BitVec 32) (_ BitVec 64))) (size!16352 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33265)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522316 (= res!320040 (validKeyInArray!0 (select (arr!15988 a!3235) j!176)))))

(declare-fun b!522317 () Bool)

(declare-fun res!320039 () Bool)

(assert (=> b!522317 (=> (not res!320039) (not e!304646))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522317 (= res!320039 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522318 () Bool)

(declare-fun res!320033 () Bool)

(declare-fun e!304650 () Bool)

(assert (=> b!522318 (=> res!320033 e!304650)))

(declare-datatypes ((SeekEntryResult!4411 0))(
  ( (MissingZero!4411 (index!19847 (_ BitVec 32))) (Found!4411 (index!19848 (_ BitVec 32))) (Intermediate!4411 (undefined!5223 Bool) (index!19849 (_ BitVec 32)) (x!48970 (_ BitVec 32))) (Undefined!4411) (MissingVacant!4411 (index!19850 (_ BitVec 32))) )
))
(declare-fun lt!239579 () SeekEntryResult!4411)

(get-info :version)

(assert (=> b!522318 (= res!320033 (or (undefined!5223 lt!239579) (not ((_ is Intermediate!4411) lt!239579))))))

(declare-fun b!522319 () Bool)

(declare-datatypes ((Unit!16255 0))(
  ( (Unit!16256) )
))
(declare-fun e!304648 () Unit!16255)

(declare-fun Unit!16257 () Unit!16255)

(assert (=> b!522319 (= e!304648 Unit!16257)))

(declare-fun lt!239573 () Unit!16255)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239574 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16255)

(assert (=> b!522319 (= lt!239573 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239574 #b00000000000000000000000000000000 (index!19849 lt!239579) (x!48970 lt!239579) mask!3524))))

(declare-fun lt!239580 () array!33265)

(declare-fun res!320035 () Bool)

(declare-fun lt!239575 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33265 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!522319 (= res!320035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239574 lt!239575 lt!239580 mask!3524) (Intermediate!4411 false (index!19849 lt!239579) (x!48970 lt!239579))))))

(assert (=> b!522319 (=> (not res!320035) (not e!304649))))

(assert (=> b!522319 e!304649))

(declare-fun b!522320 () Bool)

(declare-fun res!320043 () Bool)

(assert (=> b!522320 (=> (not res!320043) (not e!304646))))

(assert (=> b!522320 (= res!320043 (validKeyInArray!0 k0!2280))))

(declare-fun res!320034 () Bool)

(assert (=> start!47438 (=> (not res!320034) (not e!304646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47438 (= res!320034 (validMask!0 mask!3524))))

(assert (=> start!47438 e!304646))

(assert (=> start!47438 true))

(declare-fun array_inv!11847 (array!33265) Bool)

(assert (=> start!47438 (array_inv!11847 a!3235)))

(declare-fun b!522321 () Bool)

(declare-fun e!304645 () Bool)

(assert (=> b!522321 (= e!304646 e!304645)))

(declare-fun res!320044 () Bool)

(assert (=> b!522321 (=> (not res!320044) (not e!304645))))

(declare-fun lt!239576 () SeekEntryResult!4411)

(assert (=> b!522321 (= res!320044 (or (= lt!239576 (MissingZero!4411 i!1204)) (= lt!239576 (MissingVacant!4411 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33265 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!522321 (= lt!239576 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522322 () Bool)

(declare-fun Unit!16258 () Unit!16255)

(assert (=> b!522322 (= e!304648 Unit!16258)))

(declare-fun b!522323 () Bool)

(declare-fun res!320042 () Bool)

(assert (=> b!522323 (=> (not res!320042) (not e!304645))))

(declare-datatypes ((List!10053 0))(
  ( (Nil!10050) (Cons!10049 (h!10971 (_ BitVec 64)) (t!16273 List!10053)) )
))
(declare-fun arrayNoDuplicates!0 (array!33265 (_ BitVec 32) List!10053) Bool)

(assert (=> b!522323 (= res!320042 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10050))))

(declare-fun b!522324 () Bool)

(declare-fun res!320038 () Bool)

(assert (=> b!522324 (=> (not res!320038) (not e!304646))))

(assert (=> b!522324 (= res!320038 (and (= (size!16352 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16352 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16352 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!304647 () Bool)

(declare-fun b!522325 () Bool)

(assert (=> b!522325 (= e!304647 (= (seekEntryOrOpen!0 (select (arr!15988 a!3235) j!176) a!3235 mask!3524) (Found!4411 j!176)))))

(declare-fun b!522326 () Bool)

(declare-fun res!320037 () Bool)

(assert (=> b!522326 (=> (not res!320037) (not e!304645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33265 (_ BitVec 32)) Bool)

(assert (=> b!522326 (= res!320037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522327 () Bool)

(assert (=> b!522327 (= e!304645 (not e!304650))))

(declare-fun res!320041 () Bool)

(assert (=> b!522327 (=> res!320041 e!304650)))

(declare-fun lt!239581 () (_ BitVec 32))

(assert (=> b!522327 (= res!320041 (= lt!239579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239581 lt!239575 lt!239580 mask!3524)))))

(assert (=> b!522327 (= lt!239579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239574 (select (arr!15988 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522327 (= lt!239581 (toIndex!0 lt!239575 mask!3524))))

(assert (=> b!522327 (= lt!239575 (select (store (arr!15988 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522327 (= lt!239574 (toIndex!0 (select (arr!15988 a!3235) j!176) mask!3524))))

(assert (=> b!522327 (= lt!239580 (array!33266 (store (arr!15988 a!3235) i!1204 k0!2280) (size!16352 a!3235)))))

(assert (=> b!522327 e!304647))

(declare-fun res!320036 () Bool)

(assert (=> b!522327 (=> (not res!320036) (not e!304647))))

(assert (=> b!522327 (= res!320036 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239577 () Unit!16255)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16255)

(assert (=> b!522327 (= lt!239577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522328 () Bool)

(assert (=> b!522328 (= e!304650 true)))

(assert (=> b!522328 (and (or (= (select (arr!15988 a!3235) (index!19849 lt!239579)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15988 a!3235) (index!19849 lt!239579)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15988 a!3235) (index!19849 lt!239579)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15988 a!3235) (index!19849 lt!239579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239578 () Unit!16255)

(assert (=> b!522328 (= lt!239578 e!304648)))

(declare-fun c!61442 () Bool)

(assert (=> b!522328 (= c!61442 (= (select (arr!15988 a!3235) (index!19849 lt!239579)) (select (arr!15988 a!3235) j!176)))))

(assert (=> b!522328 (and (bvslt (x!48970 lt!239579) #b01111111111111111111111111111110) (or (= (select (arr!15988 a!3235) (index!19849 lt!239579)) (select (arr!15988 a!3235) j!176)) (= (select (arr!15988 a!3235) (index!19849 lt!239579)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15988 a!3235) (index!19849 lt!239579)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47438 res!320034) b!522324))

(assert (= (and b!522324 res!320038) b!522316))

(assert (= (and b!522316 res!320040) b!522320))

(assert (= (and b!522320 res!320043) b!522317))

(assert (= (and b!522317 res!320039) b!522321))

(assert (= (and b!522321 res!320044) b!522326))

(assert (= (and b!522326 res!320037) b!522323))

(assert (= (and b!522323 res!320042) b!522327))

(assert (= (and b!522327 res!320036) b!522325))

(assert (= (and b!522327 (not res!320041)) b!522318))

(assert (= (and b!522318 (not res!320033)) b!522328))

(assert (= (and b!522328 c!61442) b!522319))

(assert (= (and b!522328 (not c!61442)) b!522322))

(assert (= (and b!522319 res!320035) b!522315))

(declare-fun m!503473 () Bool)

(assert (=> start!47438 m!503473))

(declare-fun m!503475 () Bool)

(assert (=> start!47438 m!503475))

(declare-fun m!503477 () Bool)

(assert (=> b!522317 m!503477))

(declare-fun m!503479 () Bool)

(assert (=> b!522320 m!503479))

(declare-fun m!503481 () Bool)

(assert (=> b!522327 m!503481))

(declare-fun m!503483 () Bool)

(assert (=> b!522327 m!503483))

(declare-fun m!503485 () Bool)

(assert (=> b!522327 m!503485))

(declare-fun m!503487 () Bool)

(assert (=> b!522327 m!503487))

(declare-fun m!503489 () Bool)

(assert (=> b!522327 m!503489))

(declare-fun m!503491 () Bool)

(assert (=> b!522327 m!503491))

(declare-fun m!503493 () Bool)

(assert (=> b!522327 m!503493))

(assert (=> b!522327 m!503491))

(declare-fun m!503495 () Bool)

(assert (=> b!522327 m!503495))

(assert (=> b!522327 m!503491))

(declare-fun m!503497 () Bool)

(assert (=> b!522327 m!503497))

(assert (=> b!522316 m!503491))

(assert (=> b!522316 m!503491))

(declare-fun m!503499 () Bool)

(assert (=> b!522316 m!503499))

(declare-fun m!503501 () Bool)

(assert (=> b!522326 m!503501))

(declare-fun m!503503 () Bool)

(assert (=> b!522328 m!503503))

(assert (=> b!522328 m!503491))

(declare-fun m!503505 () Bool)

(assert (=> b!522319 m!503505))

(declare-fun m!503507 () Bool)

(assert (=> b!522319 m!503507))

(declare-fun m!503509 () Bool)

(assert (=> b!522323 m!503509))

(declare-fun m!503511 () Bool)

(assert (=> b!522321 m!503511))

(assert (=> b!522325 m!503491))

(assert (=> b!522325 m!503491))

(declare-fun m!503513 () Bool)

(assert (=> b!522325 m!503513))

(check-sat (not b!522317) (not start!47438) (not b!522325) (not b!522320) (not b!522326) (not b!522316) (not b!522319) (not b!522323) (not b!522327) (not b!522321))
(check-sat)
