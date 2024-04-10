; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45456 () Bool)

(assert start!45456)

(declare-fun b!500223 () Bool)

(declare-fun res!302090 () Bool)

(declare-fun e!293094 () Bool)

(assert (=> b!500223 (=> (not res!302090) (not e!293094))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32281 0))(
  ( (array!32282 (arr!15522 (Array (_ BitVec 32) (_ BitVec 64))) (size!15886 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32281)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500223 (= res!302090 (and (= (size!15886 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15886 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15886 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!293093 () Bool)

(declare-fun b!500224 () Bool)

(declare-datatypes ((SeekEntryResult!3989 0))(
  ( (MissingZero!3989 (index!18138 (_ BitVec 32))) (Found!3989 (index!18139 (_ BitVec 32))) (Intermediate!3989 (undefined!4801 Bool) (index!18140 (_ BitVec 32)) (x!47178 (_ BitVec 32))) (Undefined!3989) (MissingVacant!3989 (index!18141 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32281 (_ BitVec 32)) SeekEntryResult!3989)

(assert (=> b!500224 (= e!293093 (= (seekEntryOrOpen!0 (select (arr!15522 a!3235) j!176) a!3235 mask!3524) (Found!3989 j!176)))))

(declare-fun b!500225 () Bool)

(declare-fun e!293087 () Bool)

(assert (=> b!500225 (= e!293094 e!293087)))

(declare-fun res!302087 () Bool)

(assert (=> b!500225 (=> (not res!302087) (not e!293087))))

(declare-fun lt!226975 () SeekEntryResult!3989)

(assert (=> b!500225 (= res!302087 (or (= lt!226975 (MissingZero!3989 i!1204)) (= lt!226975 (MissingVacant!3989 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!500225 (= lt!226975 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500226 () Bool)

(declare-fun res!302086 () Bool)

(assert (=> b!500226 (=> (not res!302086) (not e!293094))))

(declare-fun arrayContainsKey!0 (array!32281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500226 (= res!302086 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500227 () Bool)

(declare-fun e!293090 () Bool)

(declare-fun e!293091 () Bool)

(assert (=> b!500227 (= e!293090 e!293091)))

(declare-fun res!302083 () Bool)

(assert (=> b!500227 (=> res!302083 e!293091)))

(declare-fun lt!226974 () (_ BitVec 32))

(declare-fun lt!226972 () SeekEntryResult!3989)

(assert (=> b!500227 (= res!302083 (or (bvsgt #b00000000000000000000000000000000 (x!47178 lt!226972)) (bvsgt (x!47178 lt!226972) #b01111111111111111111111111111110) (bvslt lt!226974 #b00000000000000000000000000000000) (bvsge lt!226974 (size!15886 a!3235)) (bvslt (index!18140 lt!226972) #b00000000000000000000000000000000) (bvsge (index!18140 lt!226972) (size!15886 a!3235)) (not (= lt!226972 (Intermediate!3989 false (index!18140 lt!226972) (x!47178 lt!226972))))))))

(assert (=> b!500227 (and (or (= (select (arr!15522 a!3235) (index!18140 lt!226972)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15522 a!3235) (index!18140 lt!226972)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15522 a!3235) (index!18140 lt!226972)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15522 a!3235) (index!18140 lt!226972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15032 0))(
  ( (Unit!15033) )
))
(declare-fun lt!226973 () Unit!15032)

(declare-fun e!293092 () Unit!15032)

(assert (=> b!500227 (= lt!226973 e!293092)))

(declare-fun c!59348 () Bool)

(assert (=> b!500227 (= c!59348 (= (select (arr!15522 a!3235) (index!18140 lt!226972)) (select (arr!15522 a!3235) j!176)))))

(assert (=> b!500227 (and (bvslt (x!47178 lt!226972) #b01111111111111111111111111111110) (or (= (select (arr!15522 a!3235) (index!18140 lt!226972)) (select (arr!15522 a!3235) j!176)) (= (select (arr!15522 a!3235) (index!18140 lt!226972)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15522 a!3235) (index!18140 lt!226972)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!302091 () Bool)

(assert (=> start!45456 (=> (not res!302091) (not e!293094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45456 (= res!302091 (validMask!0 mask!3524))))

(assert (=> start!45456 e!293094))

(assert (=> start!45456 true))

(declare-fun array_inv!11318 (array!32281) Bool)

(assert (=> start!45456 (array_inv!11318 a!3235)))

(declare-fun b!500228 () Bool)

(declare-fun Unit!15034 () Unit!15032)

(assert (=> b!500228 (= e!293092 Unit!15034)))

(declare-fun b!500229 () Bool)

(assert (=> b!500229 (= e!293091 true)))

(declare-fun lt!226970 () (_ BitVec 64))

(declare-fun lt!226969 () array!32281)

(declare-fun lt!226976 () SeekEntryResult!3989)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32281 (_ BitVec 32)) SeekEntryResult!3989)

(assert (=> b!500229 (= lt!226976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226974 lt!226970 lt!226969 mask!3524))))

(declare-fun b!500230 () Bool)

(declare-fun e!293088 () Bool)

(assert (=> b!500230 (= e!293088 false)))

(declare-fun b!500231 () Bool)

(declare-fun res!302092 () Bool)

(assert (=> b!500231 (=> (not res!302092) (not e!293094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500231 (= res!302092 (validKeyInArray!0 k!2280))))

(declare-fun b!500232 () Bool)

(declare-fun res!302084 () Bool)

(assert (=> b!500232 (=> (not res!302084) (not e!293094))))

(assert (=> b!500232 (= res!302084 (validKeyInArray!0 (select (arr!15522 a!3235) j!176)))))

(declare-fun b!500233 () Bool)

(declare-fun Unit!15035 () Unit!15032)

(assert (=> b!500233 (= e!293092 Unit!15035)))

(declare-fun lt!226977 () Unit!15032)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15032)

(assert (=> b!500233 (= lt!226977 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226974 #b00000000000000000000000000000000 (index!18140 lt!226972) (x!47178 lt!226972) mask!3524))))

(declare-fun res!302085 () Bool)

(assert (=> b!500233 (= res!302085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226974 lt!226970 lt!226969 mask!3524) (Intermediate!3989 false (index!18140 lt!226972) (x!47178 lt!226972))))))

(assert (=> b!500233 (=> (not res!302085) (not e!293088))))

(assert (=> b!500233 e!293088))

(declare-fun b!500234 () Bool)

(declare-fun res!302089 () Bool)

(assert (=> b!500234 (=> (not res!302089) (not e!293087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32281 (_ BitVec 32)) Bool)

(assert (=> b!500234 (= res!302089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500235 () Bool)

(declare-fun res!302093 () Bool)

(assert (=> b!500235 (=> (not res!302093) (not e!293087))))

(declare-datatypes ((List!9680 0))(
  ( (Nil!9677) (Cons!9676 (h!10550 (_ BitVec 64)) (t!15908 List!9680)) )
))
(declare-fun arrayNoDuplicates!0 (array!32281 (_ BitVec 32) List!9680) Bool)

(assert (=> b!500235 (= res!302093 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9677))))

(declare-fun b!500236 () Bool)

(assert (=> b!500236 (= e!293087 (not e!293090))))

(declare-fun res!302088 () Bool)

(assert (=> b!500236 (=> res!302088 e!293090)))

(declare-fun lt!226971 () (_ BitVec 32))

(assert (=> b!500236 (= res!302088 (= lt!226972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226971 lt!226970 lt!226969 mask!3524)))))

(assert (=> b!500236 (= lt!226972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226974 (select (arr!15522 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500236 (= lt!226971 (toIndex!0 lt!226970 mask!3524))))

(assert (=> b!500236 (= lt!226970 (select (store (arr!15522 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500236 (= lt!226974 (toIndex!0 (select (arr!15522 a!3235) j!176) mask!3524))))

(assert (=> b!500236 (= lt!226969 (array!32282 (store (arr!15522 a!3235) i!1204 k!2280) (size!15886 a!3235)))))

(assert (=> b!500236 e!293093))

(declare-fun res!302081 () Bool)

(assert (=> b!500236 (=> (not res!302081) (not e!293093))))

(assert (=> b!500236 (= res!302081 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226978 () Unit!15032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15032)

(assert (=> b!500236 (= lt!226978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500237 () Bool)

(declare-fun res!302082 () Bool)

(assert (=> b!500237 (=> res!302082 e!293090)))

(assert (=> b!500237 (= res!302082 (or (undefined!4801 lt!226972) (not (is-Intermediate!3989 lt!226972))))))

(assert (= (and start!45456 res!302091) b!500223))

(assert (= (and b!500223 res!302090) b!500232))

(assert (= (and b!500232 res!302084) b!500231))

(assert (= (and b!500231 res!302092) b!500226))

(assert (= (and b!500226 res!302086) b!500225))

(assert (= (and b!500225 res!302087) b!500234))

(assert (= (and b!500234 res!302089) b!500235))

(assert (= (and b!500235 res!302093) b!500236))

(assert (= (and b!500236 res!302081) b!500224))

(assert (= (and b!500236 (not res!302088)) b!500237))

(assert (= (and b!500237 (not res!302082)) b!500227))

(assert (= (and b!500227 c!59348) b!500233))

(assert (= (and b!500227 (not c!59348)) b!500228))

(assert (= (and b!500233 res!302085) b!500230))

(assert (= (and b!500227 (not res!302083)) b!500229))

(declare-fun m!481371 () Bool)

(assert (=> b!500236 m!481371))

(declare-fun m!481373 () Bool)

(assert (=> b!500236 m!481373))

(declare-fun m!481375 () Bool)

(assert (=> b!500236 m!481375))

(declare-fun m!481377 () Bool)

(assert (=> b!500236 m!481377))

(declare-fun m!481379 () Bool)

(assert (=> b!500236 m!481379))

(declare-fun m!481381 () Bool)

(assert (=> b!500236 m!481381))

(assert (=> b!500236 m!481379))

(declare-fun m!481383 () Bool)

(assert (=> b!500236 m!481383))

(assert (=> b!500236 m!481379))

(declare-fun m!481385 () Bool)

(assert (=> b!500236 m!481385))

(declare-fun m!481387 () Bool)

(assert (=> b!500236 m!481387))

(declare-fun m!481389 () Bool)

(assert (=> b!500235 m!481389))

(declare-fun m!481391 () Bool)

(assert (=> b!500225 m!481391))

(declare-fun m!481393 () Bool)

(assert (=> b!500234 m!481393))

(declare-fun m!481395 () Bool)

(assert (=> b!500226 m!481395))

(declare-fun m!481397 () Bool)

(assert (=> b!500229 m!481397))

(declare-fun m!481399 () Bool)

(assert (=> b!500231 m!481399))

(assert (=> b!500224 m!481379))

(assert (=> b!500224 m!481379))

(declare-fun m!481401 () Bool)

(assert (=> b!500224 m!481401))

(declare-fun m!481403 () Bool)

(assert (=> b!500233 m!481403))

(assert (=> b!500233 m!481397))

(assert (=> b!500232 m!481379))

(assert (=> b!500232 m!481379))

(declare-fun m!481405 () Bool)

(assert (=> b!500232 m!481405))

(declare-fun m!481407 () Bool)

(assert (=> b!500227 m!481407))

(assert (=> b!500227 m!481379))

(declare-fun m!481409 () Bool)

(assert (=> start!45456 m!481409))

(declare-fun m!481411 () Bool)

(assert (=> start!45456 m!481411))

(push 1)

