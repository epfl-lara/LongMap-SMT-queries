; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44972 () Bool)

(assert start!44972)

(declare-fun b!493315 () Bool)

(declare-fun e!289721 () Bool)

(declare-fun e!289722 () Bool)

(assert (=> b!493315 (= e!289721 (not e!289722))))

(declare-fun res!295940 () Bool)

(assert (=> b!493315 (=> res!295940 e!289722)))

(declare-fun lt!223149 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31918 0))(
  ( (array!31919 (arr!15343 (Array (_ BitVec 32) (_ BitVec 64))) (size!15707 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31918)

(declare-datatypes ((SeekEntryResult!3766 0))(
  ( (MissingZero!3766 (index!17243 (_ BitVec 32))) (Found!3766 (index!17244 (_ BitVec 32))) (Intermediate!3766 (undefined!4578 Bool) (index!17245 (_ BitVec 32)) (x!46473 (_ BitVec 32))) (Undefined!3766) (MissingVacant!3766 (index!17246 (_ BitVec 32))) )
))
(declare-fun lt!223146 () SeekEntryResult!3766)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31918 (_ BitVec 32)) SeekEntryResult!3766)

(assert (=> b!493315 (= res!295940 (= lt!223146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223149 (select (store (arr!15343 a!3235) i!1204 k0!2280) j!176) (array!31919 (store (arr!15343 a!3235) i!1204 k0!2280) (size!15707 a!3235)) mask!3524)))))

(declare-fun lt!223145 () (_ BitVec 32))

(assert (=> b!493315 (= lt!223146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223145 (select (arr!15343 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493315 (= lt!223149 (toIndex!0 (select (store (arr!15343 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493315 (= lt!223145 (toIndex!0 (select (arr!15343 a!3235) j!176) mask!3524))))

(declare-fun lt!223150 () SeekEntryResult!3766)

(assert (=> b!493315 (= lt!223150 (Found!3766 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31918 (_ BitVec 32)) SeekEntryResult!3766)

(assert (=> b!493315 (= lt!223150 (seekEntryOrOpen!0 (select (arr!15343 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31918 (_ BitVec 32)) Bool)

(assert (=> b!493315 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14539 0))(
  ( (Unit!14540) )
))
(declare-fun lt!223148 () Unit!14539)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14539)

(assert (=> b!493315 (= lt!223148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493316 () Bool)

(declare-fun res!295948 () Bool)

(declare-fun e!289720 () Bool)

(assert (=> b!493316 (=> (not res!295948) (not e!289720))))

(assert (=> b!493316 (= res!295948 (and (= (size!15707 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15707 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15707 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493317 () Bool)

(assert (=> b!493317 (= e!289720 e!289721)))

(declare-fun res!295943 () Bool)

(assert (=> b!493317 (=> (not res!295943) (not e!289721))))

(declare-fun lt!223147 () SeekEntryResult!3766)

(assert (=> b!493317 (= res!295943 (or (= lt!223147 (MissingZero!3766 i!1204)) (= lt!223147 (MissingVacant!3766 i!1204))))))

(assert (=> b!493317 (= lt!223147 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!295942 () Bool)

(assert (=> start!44972 (=> (not res!295942) (not e!289720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44972 (= res!295942 (validMask!0 mask!3524))))

(assert (=> start!44972 e!289720))

(assert (=> start!44972 true))

(declare-fun array_inv!11202 (array!31918) Bool)

(assert (=> start!44972 (array_inv!11202 a!3235)))

(declare-fun b!493318 () Bool)

(declare-fun res!295944 () Bool)

(assert (=> b!493318 (=> (not res!295944) (not e!289720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493318 (= res!295944 (validKeyInArray!0 (select (arr!15343 a!3235) j!176)))))

(declare-fun b!493319 () Bool)

(declare-fun res!295946 () Bool)

(assert (=> b!493319 (=> (not res!295946) (not e!289720))))

(assert (=> b!493319 (= res!295946 (validKeyInArray!0 k0!2280))))

(declare-fun b!493320 () Bool)

(declare-fun res!295945 () Bool)

(assert (=> b!493320 (=> (not res!295945) (not e!289720))))

(declare-fun arrayContainsKey!0 (array!31918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493320 (= res!295945 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493321 () Bool)

(declare-fun res!295939 () Bool)

(assert (=> b!493321 (=> (not res!295939) (not e!289721))))

(assert (=> b!493321 (= res!295939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493322 () Bool)

(declare-fun res!295947 () Bool)

(assert (=> b!493322 (=> res!295947 e!289722)))

(get-info :version)

(assert (=> b!493322 (= res!295947 (or (not ((_ is Intermediate!3766) lt!223146)) (not (undefined!4578 lt!223146))))))

(declare-fun b!493323 () Bool)

(assert (=> b!493323 (= e!289722 true)))

(assert (=> b!493323 (= lt!223150 Undefined!3766)))

(declare-fun b!493324 () Bool)

(declare-fun res!295941 () Bool)

(assert (=> b!493324 (=> (not res!295941) (not e!289721))))

(declare-datatypes ((List!9408 0))(
  ( (Nil!9405) (Cons!9404 (h!10272 (_ BitVec 64)) (t!15628 List!9408)) )
))
(declare-fun arrayNoDuplicates!0 (array!31918 (_ BitVec 32) List!9408) Bool)

(assert (=> b!493324 (= res!295941 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9405))))

(assert (= (and start!44972 res!295942) b!493316))

(assert (= (and b!493316 res!295948) b!493318))

(assert (= (and b!493318 res!295944) b!493319))

(assert (= (and b!493319 res!295946) b!493320))

(assert (= (and b!493320 res!295945) b!493317))

(assert (= (and b!493317 res!295943) b!493321))

(assert (= (and b!493321 res!295939) b!493324))

(assert (= (and b!493324 res!295941) b!493315))

(assert (= (and b!493315 (not res!295940)) b!493322))

(assert (= (and b!493322 (not res!295947)) b!493323))

(declare-fun m!474391 () Bool)

(assert (=> b!493324 m!474391))

(declare-fun m!474393 () Bool)

(assert (=> b!493317 m!474393))

(declare-fun m!474395 () Bool)

(assert (=> start!44972 m!474395))

(declare-fun m!474397 () Bool)

(assert (=> start!44972 m!474397))

(declare-fun m!474399 () Bool)

(assert (=> b!493318 m!474399))

(assert (=> b!493318 m!474399))

(declare-fun m!474401 () Bool)

(assert (=> b!493318 m!474401))

(declare-fun m!474403 () Bool)

(assert (=> b!493320 m!474403))

(assert (=> b!493315 m!474399))

(declare-fun m!474405 () Bool)

(assert (=> b!493315 m!474405))

(declare-fun m!474407 () Bool)

(assert (=> b!493315 m!474407))

(declare-fun m!474409 () Bool)

(assert (=> b!493315 m!474409))

(declare-fun m!474411 () Bool)

(assert (=> b!493315 m!474411))

(assert (=> b!493315 m!474399))

(declare-fun m!474413 () Bool)

(assert (=> b!493315 m!474413))

(assert (=> b!493315 m!474411))

(declare-fun m!474415 () Bool)

(assert (=> b!493315 m!474415))

(assert (=> b!493315 m!474399))

(declare-fun m!474417 () Bool)

(assert (=> b!493315 m!474417))

(assert (=> b!493315 m!474399))

(declare-fun m!474419 () Bool)

(assert (=> b!493315 m!474419))

(assert (=> b!493315 m!474411))

(declare-fun m!474421 () Bool)

(assert (=> b!493315 m!474421))

(declare-fun m!474423 () Bool)

(assert (=> b!493319 m!474423))

(declare-fun m!474425 () Bool)

(assert (=> b!493321 m!474425))

(check-sat (not b!493319) (not b!493315) (not b!493318) (not b!493317) (not start!44972) (not b!493324) (not b!493320) (not b!493321))
(check-sat)
