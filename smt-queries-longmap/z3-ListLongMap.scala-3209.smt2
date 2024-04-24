; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44990 () Bool)

(assert start!44990)

(declare-fun b!493585 () Bool)

(declare-fun res!296210 () Bool)

(declare-fun e!289827 () Bool)

(assert (=> b!493585 (=> (not res!296210) (not e!289827))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493585 (= res!296210 (validKeyInArray!0 k0!2280))))

(declare-fun b!493586 () Bool)

(declare-fun res!296215 () Bool)

(assert (=> b!493586 (=> (not res!296215) (not e!289827))))

(declare-datatypes ((array!31936 0))(
  ( (array!31937 (arr!15352 (Array (_ BitVec 32) (_ BitVec 64))) (size!15716 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31936)

(declare-fun arrayContainsKey!0 (array!31936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493586 (= res!296215 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493587 () Bool)

(declare-fun e!289830 () Bool)

(assert (=> b!493587 (= e!289827 e!289830)))

(declare-fun res!296209 () Bool)

(assert (=> b!493587 (=> (not res!296209) (not e!289830))))

(declare-datatypes ((SeekEntryResult!3775 0))(
  ( (MissingZero!3775 (index!17279 (_ BitVec 32))) (Found!3775 (index!17280 (_ BitVec 32))) (Intermediate!3775 (undefined!4587 Bool) (index!17281 (_ BitVec 32)) (x!46506 (_ BitVec 32))) (Undefined!3775) (MissingVacant!3775 (index!17282 (_ BitVec 32))) )
))
(declare-fun lt!223309 () SeekEntryResult!3775)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493587 (= res!296209 (or (= lt!223309 (MissingZero!3775 i!1204)) (= lt!223309 (MissingVacant!3775 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31936 (_ BitVec 32)) SeekEntryResult!3775)

(assert (=> b!493587 (= lt!223309 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493589 () Bool)

(declare-fun e!289828 () Bool)

(assert (=> b!493589 (= e!289830 (not e!289828))))

(declare-fun res!296213 () Bool)

(assert (=> b!493589 (=> res!296213 e!289828)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223307 () (_ BitVec 32))

(declare-fun lt!223310 () SeekEntryResult!3775)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31936 (_ BitVec 32)) SeekEntryResult!3775)

(assert (=> b!493589 (= res!296213 (= lt!223310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223307 (select (store (arr!15352 a!3235) i!1204 k0!2280) j!176) (array!31937 (store (arr!15352 a!3235) i!1204 k0!2280) (size!15716 a!3235)) mask!3524)))))

(declare-fun lt!223308 () (_ BitVec 32))

(assert (=> b!493589 (= lt!223310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223308 (select (arr!15352 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493589 (= lt!223307 (toIndex!0 (select (store (arr!15352 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493589 (= lt!223308 (toIndex!0 (select (arr!15352 a!3235) j!176) mask!3524))))

(declare-fun lt!223312 () SeekEntryResult!3775)

(assert (=> b!493589 (= lt!223312 (Found!3775 j!176))))

(assert (=> b!493589 (= lt!223312 (seekEntryOrOpen!0 (select (arr!15352 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31936 (_ BitVec 32)) Bool)

(assert (=> b!493589 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14557 0))(
  ( (Unit!14558) )
))
(declare-fun lt!223311 () Unit!14557)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14557)

(assert (=> b!493589 (= lt!223311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493590 () Bool)

(declare-fun res!296212 () Bool)

(assert (=> b!493590 (=> (not res!296212) (not e!289827))))

(assert (=> b!493590 (= res!296212 (validKeyInArray!0 (select (arr!15352 a!3235) j!176)))))

(declare-fun b!493591 () Bool)

(declare-fun res!296216 () Bool)

(assert (=> b!493591 (=> (not res!296216) (not e!289830))))

(assert (=> b!493591 (= res!296216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493592 () Bool)

(assert (=> b!493592 (= e!289828 true)))

(assert (=> b!493592 (= lt!223312 Undefined!3775)))

(declare-fun res!296218 () Bool)

(assert (=> start!44990 (=> (not res!296218) (not e!289827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44990 (= res!296218 (validMask!0 mask!3524))))

(assert (=> start!44990 e!289827))

(assert (=> start!44990 true))

(declare-fun array_inv!11211 (array!31936) Bool)

(assert (=> start!44990 (array_inv!11211 a!3235)))

(declare-fun b!493588 () Bool)

(declare-fun res!296214 () Bool)

(assert (=> b!493588 (=> (not res!296214) (not e!289827))))

(assert (=> b!493588 (= res!296214 (and (= (size!15716 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15716 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15716 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493593 () Bool)

(declare-fun res!296211 () Bool)

(assert (=> b!493593 (=> (not res!296211) (not e!289830))))

(declare-datatypes ((List!9417 0))(
  ( (Nil!9414) (Cons!9413 (h!10281 (_ BitVec 64)) (t!15637 List!9417)) )
))
(declare-fun arrayNoDuplicates!0 (array!31936 (_ BitVec 32) List!9417) Bool)

(assert (=> b!493593 (= res!296211 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9414))))

(declare-fun b!493594 () Bool)

(declare-fun res!296217 () Bool)

(assert (=> b!493594 (=> res!296217 e!289828)))

(get-info :version)

(assert (=> b!493594 (= res!296217 (or (not ((_ is Intermediate!3775) lt!223310)) (not (undefined!4587 lt!223310))))))

(assert (= (and start!44990 res!296218) b!493588))

(assert (= (and b!493588 res!296214) b!493590))

(assert (= (and b!493590 res!296212) b!493585))

(assert (= (and b!493585 res!296210) b!493586))

(assert (= (and b!493586 res!296215) b!493587))

(assert (= (and b!493587 res!296209) b!493591))

(assert (= (and b!493591 res!296216) b!493593))

(assert (= (and b!493593 res!296211) b!493589))

(assert (= (and b!493589 (not res!296213)) b!493594))

(assert (= (and b!493594 (not res!296217)) b!493592))

(declare-fun m!474715 () Bool)

(assert (=> b!493585 m!474715))

(declare-fun m!474717 () Bool)

(assert (=> start!44990 m!474717))

(declare-fun m!474719 () Bool)

(assert (=> start!44990 m!474719))

(declare-fun m!474721 () Bool)

(assert (=> b!493586 m!474721))

(declare-fun m!474723 () Bool)

(assert (=> b!493590 m!474723))

(assert (=> b!493590 m!474723))

(declare-fun m!474725 () Bool)

(assert (=> b!493590 m!474725))

(declare-fun m!474727 () Bool)

(assert (=> b!493587 m!474727))

(declare-fun m!474729 () Bool)

(assert (=> b!493591 m!474729))

(declare-fun m!474731 () Bool)

(assert (=> b!493589 m!474731))

(declare-fun m!474733 () Bool)

(assert (=> b!493589 m!474733))

(declare-fun m!474735 () Bool)

(assert (=> b!493589 m!474735))

(declare-fun m!474737 () Bool)

(assert (=> b!493589 m!474737))

(assert (=> b!493589 m!474731))

(assert (=> b!493589 m!474723))

(declare-fun m!474739 () Bool)

(assert (=> b!493589 m!474739))

(assert (=> b!493589 m!474723))

(assert (=> b!493589 m!474723))

(declare-fun m!474741 () Bool)

(assert (=> b!493589 m!474741))

(declare-fun m!474743 () Bool)

(assert (=> b!493589 m!474743))

(assert (=> b!493589 m!474723))

(declare-fun m!474745 () Bool)

(assert (=> b!493589 m!474745))

(assert (=> b!493589 m!474731))

(declare-fun m!474747 () Bool)

(assert (=> b!493589 m!474747))

(declare-fun m!474749 () Bool)

(assert (=> b!493593 m!474749))

(check-sat (not b!493593) (not b!493585) (not b!493587) (not b!493589) (not b!493590) (not b!493586) (not b!493591) (not start!44990))
(check-sat)
