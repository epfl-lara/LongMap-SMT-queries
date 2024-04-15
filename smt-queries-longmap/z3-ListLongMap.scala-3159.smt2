; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44514 () Bool)

(assert start!44514)

(declare-fun b!488459 () Bool)

(declare-fun res!291650 () Bool)

(declare-fun e!287325 () Bool)

(assert (=> b!488459 (=> (not res!291650) (not e!287325))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31634 0))(
  ( (array!31635 (arr!15206 (Array (_ BitVec 32) (_ BitVec 64))) (size!15571 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31634)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488459 (= res!291650 (and (= (size!15571 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15571 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15571 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488460 () Bool)

(declare-fun e!287323 () Bool)

(assert (=> b!488460 (= e!287325 e!287323)))

(declare-fun res!291648 () Bool)

(assert (=> b!488460 (=> (not res!291648) (not e!287323))))

(declare-datatypes ((SeekEntryResult!3670 0))(
  ( (MissingZero!3670 (index!16859 (_ BitVec 32))) (Found!3670 (index!16860 (_ BitVec 32))) (Intermediate!3670 (undefined!4482 Bool) (index!16861 (_ BitVec 32)) (x!45984 (_ BitVec 32))) (Undefined!3670) (MissingVacant!3670 (index!16862 (_ BitVec 32))) )
))
(declare-fun lt!220278 () SeekEntryResult!3670)

(assert (=> b!488460 (= res!291648 (or (= lt!220278 (MissingZero!3670 i!1204)) (= lt!220278 (MissingVacant!3670 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31634 (_ BitVec 32)) SeekEntryResult!3670)

(assert (=> b!488460 (= lt!220278 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488461 () Bool)

(assert (=> b!488461 (= e!287323 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220277 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488461 (= lt!220277 (toIndex!0 (select (store (arr!15206 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287324 () Bool)

(assert (=> b!488461 e!287324))

(declare-fun res!291652 () Bool)

(assert (=> b!488461 (=> (not res!291652) (not e!287324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31634 (_ BitVec 32)) Bool)

(assert (=> b!488461 (= res!291652 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14272 0))(
  ( (Unit!14273) )
))
(declare-fun lt!220279 () Unit!14272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14272)

(assert (=> b!488461 (= lt!220279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488462 () Bool)

(assert (=> b!488462 (= e!287324 (= (seekEntryOrOpen!0 (select (arr!15206 a!3235) j!176) a!3235 mask!3524) (Found!3670 j!176)))))

(declare-fun b!488463 () Bool)

(declare-fun res!291655 () Bool)

(assert (=> b!488463 (=> (not res!291655) (not e!287325))))

(declare-fun arrayContainsKey!0 (array!31634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488463 (= res!291655 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!291651 () Bool)

(assert (=> start!44514 (=> (not res!291651) (not e!287325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44514 (= res!291651 (validMask!0 mask!3524))))

(assert (=> start!44514 e!287325))

(assert (=> start!44514 true))

(declare-fun array_inv!11089 (array!31634) Bool)

(assert (=> start!44514 (array_inv!11089 a!3235)))

(declare-fun b!488464 () Bool)

(declare-fun res!291649 () Bool)

(assert (=> b!488464 (=> (not res!291649) (not e!287323))))

(declare-datatypes ((List!9403 0))(
  ( (Nil!9400) (Cons!9399 (h!10258 (_ BitVec 64)) (t!15622 List!9403)) )
))
(declare-fun arrayNoDuplicates!0 (array!31634 (_ BitVec 32) List!9403) Bool)

(assert (=> b!488464 (= res!291649 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9400))))

(declare-fun b!488465 () Bool)

(declare-fun res!291656 () Bool)

(assert (=> b!488465 (=> (not res!291656) (not e!287325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488465 (= res!291656 (validKeyInArray!0 k0!2280))))

(declare-fun b!488466 () Bool)

(declare-fun res!291654 () Bool)

(assert (=> b!488466 (=> (not res!291654) (not e!287323))))

(assert (=> b!488466 (= res!291654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488467 () Bool)

(declare-fun res!291653 () Bool)

(assert (=> b!488467 (=> (not res!291653) (not e!287325))))

(assert (=> b!488467 (= res!291653 (validKeyInArray!0 (select (arr!15206 a!3235) j!176)))))

(assert (= (and start!44514 res!291651) b!488459))

(assert (= (and b!488459 res!291650) b!488467))

(assert (= (and b!488467 res!291653) b!488465))

(assert (= (and b!488465 res!291656) b!488463))

(assert (= (and b!488463 res!291655) b!488460))

(assert (= (and b!488460 res!291648) b!488466))

(assert (= (and b!488466 res!291654) b!488464))

(assert (= (and b!488464 res!291649) b!488461))

(assert (= (and b!488461 res!291652) b!488462))

(declare-fun m!467695 () Bool)

(assert (=> start!44514 m!467695))

(declare-fun m!467697 () Bool)

(assert (=> start!44514 m!467697))

(declare-fun m!467699 () Bool)

(assert (=> b!488465 m!467699))

(declare-fun m!467701 () Bool)

(assert (=> b!488460 m!467701))

(declare-fun m!467703 () Bool)

(assert (=> b!488463 m!467703))

(declare-fun m!467705 () Bool)

(assert (=> b!488466 m!467705))

(declare-fun m!467707 () Bool)

(assert (=> b!488464 m!467707))

(declare-fun m!467709 () Bool)

(assert (=> b!488462 m!467709))

(assert (=> b!488462 m!467709))

(declare-fun m!467711 () Bool)

(assert (=> b!488462 m!467711))

(assert (=> b!488467 m!467709))

(assert (=> b!488467 m!467709))

(declare-fun m!467713 () Bool)

(assert (=> b!488467 m!467713))

(declare-fun m!467715 () Bool)

(assert (=> b!488461 m!467715))

(declare-fun m!467717 () Bool)

(assert (=> b!488461 m!467717))

(declare-fun m!467719 () Bool)

(assert (=> b!488461 m!467719))

(declare-fun m!467721 () Bool)

(assert (=> b!488461 m!467721))

(assert (=> b!488461 m!467719))

(declare-fun m!467723 () Bool)

(assert (=> b!488461 m!467723))

(check-sat (not b!488461) (not b!488467) (not b!488466) (not b!488460) (not start!44514) (not b!488464) (not b!488465) (not b!488462) (not b!488463))
(check-sat)
