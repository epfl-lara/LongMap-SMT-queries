; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46254 () Bool)

(assert start!46254)

(declare-fun res!313019 () Bool)

(declare-fun e!299109 () Bool)

(assert (=> start!46254 (=> (not res!313019) (not e!299109))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46254 (= res!313019 (validMask!0 mask!3524))))

(assert (=> start!46254 e!299109))

(assert (=> start!46254 true))

(declare-datatypes ((array!32918 0))(
  ( (array!32919 (arr!15836 (Array (_ BitVec 32) (_ BitVec 64))) (size!16201 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32918)

(declare-fun array_inv!11719 (array!32918) Bool)

(assert (=> start!46254 (array_inv!11719 a!3235)))

(declare-fun b!512209 () Bool)

(declare-fun e!299107 () Bool)

(assert (=> b!512209 (= e!299107 true)))

(declare-datatypes ((SeekEntryResult!4300 0))(
  ( (MissingZero!4300 (index!19388 (_ BitVec 32))) (Found!4300 (index!19389 (_ BitVec 32))) (Intermediate!4300 (undefined!5112 Bool) (index!19390 (_ BitVec 32)) (x!48342 (_ BitVec 32))) (Undefined!4300) (MissingVacant!4300 (index!19391 (_ BitVec 32))) )
))
(declare-fun lt!234372 () SeekEntryResult!4300)

(assert (=> b!512209 (= lt!234372 Undefined!4300)))

(declare-fun b!512210 () Bool)

(declare-fun res!313020 () Bool)

(assert (=> b!512210 (=> (not res!313020) (not e!299109))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512210 (= res!313020 (and (= (size!16201 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16201 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16201 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512211 () Bool)

(declare-fun res!313016 () Bool)

(assert (=> b!512211 (=> (not res!313016) (not e!299109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512211 (= res!313016 (validKeyInArray!0 (select (arr!15836 a!3235) j!176)))))

(declare-fun b!512212 () Bool)

(declare-fun e!299108 () Bool)

(assert (=> b!512212 (= e!299108 (not e!299107))))

(declare-fun res!313021 () Bool)

(assert (=> b!512212 (=> res!313021 e!299107)))

(declare-fun lt!234375 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!234376 () SeekEntryResult!4300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32918 (_ BitVec 32)) SeekEntryResult!4300)

(assert (=> b!512212 (= res!313021 (= lt!234376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234375 (select (store (arr!15836 a!3235) i!1204 k0!2280) j!176) (array!32919 (store (arr!15836 a!3235) i!1204 k0!2280) (size!16201 a!3235)) mask!3524)))))

(declare-fun lt!234374 () (_ BitVec 32))

(assert (=> b!512212 (= lt!234376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234374 (select (arr!15836 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512212 (= lt!234375 (toIndex!0 (select (store (arr!15836 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512212 (= lt!234374 (toIndex!0 (select (arr!15836 a!3235) j!176) mask!3524))))

(assert (=> b!512212 (= lt!234372 (Found!4300 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32918 (_ BitVec 32)) SeekEntryResult!4300)

(assert (=> b!512212 (= lt!234372 (seekEntryOrOpen!0 (select (arr!15836 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32918 (_ BitVec 32)) Bool)

(assert (=> b!512212 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15844 0))(
  ( (Unit!15845) )
))
(declare-fun lt!234371 () Unit!15844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15844)

(assert (=> b!512212 (= lt!234371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512213 () Bool)

(declare-fun res!313013 () Bool)

(assert (=> b!512213 (=> (not res!313013) (not e!299108))))

(assert (=> b!512213 (= res!313013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512214 () Bool)

(declare-fun res!313022 () Bool)

(assert (=> b!512214 (=> (not res!313022) (not e!299109))))

(declare-fun arrayContainsKey!0 (array!32918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512214 (= res!313022 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512215 () Bool)

(declare-fun res!313015 () Bool)

(assert (=> b!512215 (=> (not res!313015) (not e!299109))))

(assert (=> b!512215 (= res!313015 (validKeyInArray!0 k0!2280))))

(declare-fun b!512216 () Bool)

(declare-fun res!313017 () Bool)

(assert (=> b!512216 (=> res!313017 e!299107)))

(get-info :version)

(assert (=> b!512216 (= res!313017 (or (not ((_ is Intermediate!4300) lt!234376)) (not (undefined!5112 lt!234376))))))

(declare-fun b!512217 () Bool)

(declare-fun res!313018 () Bool)

(assert (=> b!512217 (=> (not res!313018) (not e!299108))))

(declare-datatypes ((List!10033 0))(
  ( (Nil!10030) (Cons!10029 (h!10909 (_ BitVec 64)) (t!16252 List!10033)) )
))
(declare-fun arrayNoDuplicates!0 (array!32918 (_ BitVec 32) List!10033) Bool)

(assert (=> b!512217 (= res!313018 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10030))))

(declare-fun b!512218 () Bool)

(assert (=> b!512218 (= e!299109 e!299108)))

(declare-fun res!313014 () Bool)

(assert (=> b!512218 (=> (not res!313014) (not e!299108))))

(declare-fun lt!234373 () SeekEntryResult!4300)

(assert (=> b!512218 (= res!313014 (or (= lt!234373 (MissingZero!4300 i!1204)) (= lt!234373 (MissingVacant!4300 i!1204))))))

(assert (=> b!512218 (= lt!234373 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46254 res!313019) b!512210))

(assert (= (and b!512210 res!313020) b!512211))

(assert (= (and b!512211 res!313016) b!512215))

(assert (= (and b!512215 res!313015) b!512214))

(assert (= (and b!512214 res!313022) b!512218))

(assert (= (and b!512218 res!313014) b!512213))

(assert (= (and b!512213 res!313013) b!512217))

(assert (= (and b!512217 res!313018) b!512212))

(assert (= (and b!512212 (not res!313021)) b!512216))

(assert (= (and b!512216 (not res!313017)) b!512209))

(declare-fun m!493393 () Bool)

(assert (=> b!512211 m!493393))

(assert (=> b!512211 m!493393))

(declare-fun m!493395 () Bool)

(assert (=> b!512211 m!493395))

(declare-fun m!493397 () Bool)

(assert (=> b!512213 m!493397))

(declare-fun m!493399 () Bool)

(assert (=> b!512218 m!493399))

(declare-fun m!493401 () Bool)

(assert (=> b!512215 m!493401))

(declare-fun m!493403 () Bool)

(assert (=> b!512217 m!493403))

(declare-fun m!493405 () Bool)

(assert (=> start!46254 m!493405))

(declare-fun m!493407 () Bool)

(assert (=> start!46254 m!493407))

(declare-fun m!493409 () Bool)

(assert (=> b!512212 m!493409))

(declare-fun m!493411 () Bool)

(assert (=> b!512212 m!493411))

(declare-fun m!493413 () Bool)

(assert (=> b!512212 m!493413))

(assert (=> b!512212 m!493393))

(declare-fun m!493415 () Bool)

(assert (=> b!512212 m!493415))

(assert (=> b!512212 m!493393))

(declare-fun m!493417 () Bool)

(assert (=> b!512212 m!493417))

(assert (=> b!512212 m!493393))

(declare-fun m!493419 () Bool)

(assert (=> b!512212 m!493419))

(assert (=> b!512212 m!493393))

(declare-fun m!493421 () Bool)

(assert (=> b!512212 m!493421))

(assert (=> b!512212 m!493413))

(declare-fun m!493423 () Bool)

(assert (=> b!512212 m!493423))

(assert (=> b!512212 m!493413))

(declare-fun m!493425 () Bool)

(assert (=> b!512212 m!493425))

(declare-fun m!493427 () Bool)

(assert (=> b!512214 m!493427))

(check-sat (not b!512212) (not b!512218) (not b!512211) (not start!46254) (not b!512214) (not b!512213) (not b!512215) (not b!512217))
(check-sat)
