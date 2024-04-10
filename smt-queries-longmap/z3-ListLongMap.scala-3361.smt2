; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46220 () Bool)

(assert start!46220)

(declare-fun b!511790 () Bool)

(declare-fun res!312458 () Bool)

(declare-fun e!299007 () Bool)

(assert (=> b!511790 (=> (not res!312458) (not e!299007))))

(declare-datatypes ((array!32874 0))(
  ( (array!32875 (arr!15814 (Array (_ BitVec 32) (_ BitVec 64))) (size!16178 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32874)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511790 (= res!312458 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511791 () Bool)

(declare-fun res!312454 () Bool)

(assert (=> b!511791 (=> (not res!312454) (not e!299007))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511791 (= res!312454 (and (= (size!16178 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16178 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16178 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511792 () Bool)

(declare-fun res!312459 () Bool)

(declare-fun e!299005 () Bool)

(assert (=> b!511792 (=> (not res!312459) (not e!299005))))

(declare-datatypes ((List!9972 0))(
  ( (Nil!9969) (Cons!9968 (h!10848 (_ BitVec 64)) (t!16200 List!9972)) )
))
(declare-fun arrayNoDuplicates!0 (array!32874 (_ BitVec 32) List!9972) Bool)

(assert (=> b!511792 (= res!312459 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9969))))

(declare-fun res!312460 () Bool)

(assert (=> start!46220 (=> (not res!312460) (not e!299007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46220 (= res!312460 (validMask!0 mask!3524))))

(assert (=> start!46220 e!299007))

(assert (=> start!46220 true))

(declare-fun array_inv!11610 (array!32874) Bool)

(assert (=> start!46220 (array_inv!11610 a!3235)))

(declare-fun b!511793 () Bool)

(declare-fun res!312452 () Bool)

(assert (=> b!511793 (=> (not res!312452) (not e!299007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511793 (= res!312452 (validKeyInArray!0 (select (arr!15814 a!3235) j!176)))))

(declare-fun b!511794 () Bool)

(declare-fun res!312461 () Bool)

(declare-fun e!299004 () Bool)

(assert (=> b!511794 (=> res!312461 e!299004)))

(declare-datatypes ((SeekEntryResult!4281 0))(
  ( (MissingZero!4281 (index!19312 (_ BitVec 32))) (Found!4281 (index!19313 (_ BitVec 32))) (Intermediate!4281 (undefined!5093 Bool) (index!19314 (_ BitVec 32)) (x!48264 (_ BitVec 32))) (Undefined!4281) (MissingVacant!4281 (index!19315 (_ BitVec 32))) )
))
(declare-fun lt!234193 () SeekEntryResult!4281)

(get-info :version)

(assert (=> b!511794 (= res!312461 (or (not ((_ is Intermediate!4281) lt!234193)) (not (undefined!5093 lt!234193))))))

(declare-fun b!511795 () Bool)

(assert (=> b!511795 (= e!299005 (not e!299004))))

(declare-fun res!312457 () Bool)

(assert (=> b!511795 (=> res!312457 e!299004)))

(declare-fun lt!234191 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32874 (_ BitVec 32)) SeekEntryResult!4281)

(assert (=> b!511795 (= res!312457 (= lt!234193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234191 (select (store (arr!15814 a!3235) i!1204 k0!2280) j!176) (array!32875 (store (arr!15814 a!3235) i!1204 k0!2280) (size!16178 a!3235)) mask!3524)))))

(declare-fun lt!234196 () (_ BitVec 32))

(assert (=> b!511795 (= lt!234193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234196 (select (arr!15814 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511795 (= lt!234191 (toIndex!0 (select (store (arr!15814 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511795 (= lt!234196 (toIndex!0 (select (arr!15814 a!3235) j!176) mask!3524))))

(declare-fun lt!234195 () SeekEntryResult!4281)

(assert (=> b!511795 (= lt!234195 (Found!4281 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32874 (_ BitVec 32)) SeekEntryResult!4281)

(assert (=> b!511795 (= lt!234195 (seekEntryOrOpen!0 (select (arr!15814 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32874 (_ BitVec 32)) Bool)

(assert (=> b!511795 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15820 0))(
  ( (Unit!15821) )
))
(declare-fun lt!234194 () Unit!15820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15820)

(assert (=> b!511795 (= lt!234194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511796 () Bool)

(declare-fun res!312456 () Bool)

(assert (=> b!511796 (=> (not res!312456) (not e!299005))))

(assert (=> b!511796 (= res!312456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511797 () Bool)

(assert (=> b!511797 (= e!299004 true)))

(assert (=> b!511797 (= lt!234195 Undefined!4281)))

(declare-fun b!511798 () Bool)

(declare-fun res!312455 () Bool)

(assert (=> b!511798 (=> (not res!312455) (not e!299007))))

(assert (=> b!511798 (= res!312455 (validKeyInArray!0 k0!2280))))

(declare-fun b!511799 () Bool)

(assert (=> b!511799 (= e!299007 e!299005)))

(declare-fun res!312453 () Bool)

(assert (=> b!511799 (=> (not res!312453) (not e!299005))))

(declare-fun lt!234192 () SeekEntryResult!4281)

(assert (=> b!511799 (= res!312453 (or (= lt!234192 (MissingZero!4281 i!1204)) (= lt!234192 (MissingVacant!4281 i!1204))))))

(assert (=> b!511799 (= lt!234192 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46220 res!312460) b!511791))

(assert (= (and b!511791 res!312454) b!511793))

(assert (= (and b!511793 res!312452) b!511798))

(assert (= (and b!511798 res!312455) b!511790))

(assert (= (and b!511790 res!312458) b!511799))

(assert (= (and b!511799 res!312453) b!511796))

(assert (= (and b!511796 res!312456) b!511792))

(assert (= (and b!511792 res!312459) b!511795))

(assert (= (and b!511795 (not res!312457)) b!511794))

(assert (= (and b!511794 (not res!312461)) b!511797))

(declare-fun m!493317 () Bool)

(assert (=> b!511798 m!493317))

(declare-fun m!493319 () Bool)

(assert (=> b!511793 m!493319))

(assert (=> b!511793 m!493319))

(declare-fun m!493321 () Bool)

(assert (=> b!511793 m!493321))

(declare-fun m!493323 () Bool)

(assert (=> b!511790 m!493323))

(declare-fun m!493325 () Bool)

(assert (=> b!511799 m!493325))

(declare-fun m!493327 () Bool)

(assert (=> b!511796 m!493327))

(declare-fun m!493329 () Bool)

(assert (=> start!46220 m!493329))

(declare-fun m!493331 () Bool)

(assert (=> start!46220 m!493331))

(declare-fun m!493333 () Bool)

(assert (=> b!511795 m!493333))

(declare-fun m!493335 () Bool)

(assert (=> b!511795 m!493335))

(declare-fun m!493337 () Bool)

(assert (=> b!511795 m!493337))

(assert (=> b!511795 m!493319))

(declare-fun m!493339 () Bool)

(assert (=> b!511795 m!493339))

(assert (=> b!511795 m!493319))

(declare-fun m!493341 () Bool)

(assert (=> b!511795 m!493341))

(assert (=> b!511795 m!493319))

(declare-fun m!493343 () Bool)

(assert (=> b!511795 m!493343))

(assert (=> b!511795 m!493319))

(declare-fun m!493345 () Bool)

(assert (=> b!511795 m!493345))

(assert (=> b!511795 m!493337))

(declare-fun m!493347 () Bool)

(assert (=> b!511795 m!493347))

(assert (=> b!511795 m!493337))

(declare-fun m!493349 () Bool)

(assert (=> b!511795 m!493349))

(declare-fun m!493351 () Bool)

(assert (=> b!511792 m!493351))

(check-sat (not b!511796) (not b!511792) (not b!511799) (not b!511798) (not b!511790) (not b!511795) (not start!46220) (not b!511793))
(check-sat)
