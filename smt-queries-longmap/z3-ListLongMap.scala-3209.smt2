; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44988 () Bool)

(assert start!44988)

(declare-fun b!493375 () Bool)

(declare-fun e!289694 () Bool)

(assert (=> b!493375 (= e!289694 true)))

(declare-datatypes ((SeekEntryResult!3820 0))(
  ( (MissingZero!3820 (index!17459 (_ BitVec 32))) (Found!3820 (index!17460 (_ BitVec 32))) (Intermediate!3820 (undefined!4632 Bool) (index!17461 (_ BitVec 32)) (x!46549 (_ BitVec 32))) (Undefined!3820) (MissingVacant!3820 (index!17462 (_ BitVec 32))) )
))
(declare-fun lt!223062 () SeekEntryResult!3820)

(assert (=> b!493375 (= lt!223062 Undefined!3820)))

(declare-fun res!296088 () Bool)

(declare-fun e!289693 () Bool)

(assert (=> start!44988 (=> (not res!296088) (not e!289693))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44988 (= res!296088 (validMask!0 mask!3524))))

(assert (=> start!44988 e!289693))

(assert (=> start!44988 true))

(declare-datatypes ((array!31943 0))(
  ( (array!31944 (arr!15356 (Array (_ BitVec 32) (_ BitVec 64))) (size!15721 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31943)

(declare-fun array_inv!11239 (array!31943) Bool)

(assert (=> start!44988 (array_inv!11239 a!3235)))

(declare-fun b!493376 () Bool)

(declare-fun res!296089 () Bool)

(assert (=> b!493376 (=> res!296089 e!289694)))

(declare-fun lt!223065 () SeekEntryResult!3820)

(get-info :version)

(assert (=> b!493376 (= res!296089 (or (not ((_ is Intermediate!3820) lt!223065)) (not (undefined!4632 lt!223065))))))

(declare-fun b!493377 () Bool)

(declare-fun e!289692 () Bool)

(assert (=> b!493377 (= e!289693 e!289692)))

(declare-fun res!296091 () Bool)

(assert (=> b!493377 (=> (not res!296091) (not e!289692))))

(declare-fun lt!223066 () SeekEntryResult!3820)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493377 (= res!296091 (or (= lt!223066 (MissingZero!3820 i!1204)) (= lt!223066 (MissingVacant!3820 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31943 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!493377 (= lt!223066 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493378 () Bool)

(declare-fun res!296096 () Bool)

(assert (=> b!493378 (=> (not res!296096) (not e!289692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31943 (_ BitVec 32)) Bool)

(assert (=> b!493378 (= res!296096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493379 () Bool)

(declare-fun res!296090 () Bool)

(assert (=> b!493379 (=> (not res!296090) (not e!289693))))

(declare-fun arrayContainsKey!0 (array!31943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493379 (= res!296090 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493380 () Bool)

(declare-fun res!296094 () Bool)

(assert (=> b!493380 (=> (not res!296094) (not e!289693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493380 (= res!296094 (validKeyInArray!0 k0!2280))))

(declare-fun b!493381 () Bool)

(assert (=> b!493381 (= e!289692 (not e!289694))))

(declare-fun res!296095 () Bool)

(assert (=> b!493381 (=> res!296095 e!289694)))

(declare-fun lt!223063 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31943 (_ BitVec 32)) SeekEntryResult!3820)

(assert (=> b!493381 (= res!296095 (= lt!223065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223063 (select (store (arr!15356 a!3235) i!1204 k0!2280) j!176) (array!31944 (store (arr!15356 a!3235) i!1204 k0!2280) (size!15721 a!3235)) mask!3524)))))

(declare-fun lt!223064 () (_ BitVec 32))

(assert (=> b!493381 (= lt!223065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223064 (select (arr!15356 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493381 (= lt!223063 (toIndex!0 (select (store (arr!15356 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493381 (= lt!223064 (toIndex!0 (select (arr!15356 a!3235) j!176) mask!3524))))

(assert (=> b!493381 (= lt!223062 (Found!3820 j!176))))

(assert (=> b!493381 (= lt!223062 (seekEntryOrOpen!0 (select (arr!15356 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493381 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14572 0))(
  ( (Unit!14573) )
))
(declare-fun lt!223061 () Unit!14572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14572)

(assert (=> b!493381 (= lt!223061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493382 () Bool)

(declare-fun res!296092 () Bool)

(assert (=> b!493382 (=> (not res!296092) (not e!289693))))

(assert (=> b!493382 (= res!296092 (and (= (size!15721 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15721 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15721 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493383 () Bool)

(declare-fun res!296093 () Bool)

(assert (=> b!493383 (=> (not res!296093) (not e!289692))))

(declare-datatypes ((List!9553 0))(
  ( (Nil!9550) (Cons!9549 (h!10417 (_ BitVec 64)) (t!15772 List!9553)) )
))
(declare-fun arrayNoDuplicates!0 (array!31943 (_ BitVec 32) List!9553) Bool)

(assert (=> b!493383 (= res!296093 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9550))))

(declare-fun b!493384 () Bool)

(declare-fun res!296087 () Bool)

(assert (=> b!493384 (=> (not res!296087) (not e!289693))))

(assert (=> b!493384 (= res!296087 (validKeyInArray!0 (select (arr!15356 a!3235) j!176)))))

(assert (= (and start!44988 res!296088) b!493382))

(assert (= (and b!493382 res!296092) b!493384))

(assert (= (and b!493384 res!296087) b!493380))

(assert (= (and b!493380 res!296094) b!493379))

(assert (= (and b!493379 res!296090) b!493377))

(assert (= (and b!493377 res!296091) b!493378))

(assert (= (and b!493378 res!296096) b!493383))

(assert (= (and b!493383 res!296093) b!493381))

(assert (= (and b!493381 (not res!296095)) b!493376))

(assert (= (and b!493376 (not res!296089)) b!493375))

(declare-fun m!473779 () Bool)

(assert (=> b!493381 m!473779))

(declare-fun m!473781 () Bool)

(assert (=> b!493381 m!473781))

(declare-fun m!473783 () Bool)

(assert (=> b!493381 m!473783))

(declare-fun m!473785 () Bool)

(assert (=> b!493381 m!473785))

(declare-fun m!473787 () Bool)

(assert (=> b!493381 m!473787))

(assert (=> b!493381 m!473785))

(declare-fun m!473789 () Bool)

(assert (=> b!493381 m!473789))

(assert (=> b!493381 m!473785))

(declare-fun m!473791 () Bool)

(assert (=> b!493381 m!473791))

(assert (=> b!493381 m!473783))

(declare-fun m!473793 () Bool)

(assert (=> b!493381 m!473793))

(assert (=> b!493381 m!473785))

(declare-fun m!473795 () Bool)

(assert (=> b!493381 m!473795))

(assert (=> b!493381 m!473783))

(declare-fun m!473797 () Bool)

(assert (=> b!493381 m!473797))

(declare-fun m!473799 () Bool)

(assert (=> b!493378 m!473799))

(declare-fun m!473801 () Bool)

(assert (=> b!493383 m!473801))

(declare-fun m!473803 () Bool)

(assert (=> b!493377 m!473803))

(assert (=> b!493384 m!473785))

(assert (=> b!493384 m!473785))

(declare-fun m!473805 () Bool)

(assert (=> b!493384 m!473805))

(declare-fun m!473807 () Bool)

(assert (=> b!493379 m!473807))

(declare-fun m!473809 () Bool)

(assert (=> b!493380 m!473809))

(declare-fun m!473811 () Bool)

(assert (=> start!44988 m!473811))

(declare-fun m!473813 () Bool)

(assert (=> start!44988 m!473813))

(check-sat (not start!44988) (not b!493377) (not b!493384) (not b!493381) (not b!493380) (not b!493378) (not b!493383) (not b!493379))
(check-sat)
