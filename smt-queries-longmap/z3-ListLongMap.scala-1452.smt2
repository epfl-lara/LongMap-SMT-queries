; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28004 () Bool)

(assert start!28004)

(declare-fun res!149196 () Bool)

(declare-fun e!181978 () Bool)

(assert (=> start!28004 (=> (not res!149196) (not e!181978))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28004 (= res!149196 (validMask!0 mask!3809))))

(assert (=> start!28004 e!181978))

(assert (=> start!28004 true))

(declare-datatypes ((array!14408 0))(
  ( (array!14409 (arr!6834 (Array (_ BitVec 32) (_ BitVec 64))) (size!7186 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14408)

(declare-fun array_inv!4797 (array!14408) Bool)

(assert (=> start!28004 (array_inv!4797 a!3312)))

(declare-fun b!287304 () Bool)

(declare-fun e!181977 () Bool)

(assert (=> b!287304 (= e!181977 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!1983 0))(
  ( (MissingZero!1983 (index!10102 (_ BitVec 32))) (Found!1983 (index!10103 (_ BitVec 32))) (Intermediate!1983 (undefined!2795 Bool) (index!10104 (_ BitVec 32)) (x!28320 (_ BitVec 32))) (Undefined!1983) (MissingVacant!1983 (index!10105 (_ BitVec 32))) )
))
(declare-fun lt!141456 () SeekEntryResult!1983)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14408 (_ BitVec 32)) SeekEntryResult!1983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287304 (= lt!141456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287305 () Bool)

(declare-fun res!149191 () Bool)

(assert (=> b!287305 (=> (not res!149191) (not e!181978))))

(declare-fun arrayContainsKey!0 (array!14408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287305 (= res!149191 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287306 () Bool)

(declare-fun res!149192 () Bool)

(assert (=> b!287306 (=> (not res!149192) (not e!181978))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287306 (= res!149192 (and (= (size!7186 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7186 a!3312))))))

(declare-fun b!287307 () Bool)

(declare-fun res!149193 () Bool)

(assert (=> b!287307 (=> (not res!149193) (not e!181977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14408 (_ BitVec 32)) Bool)

(assert (=> b!287307 (= res!149193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287308 () Bool)

(assert (=> b!287308 (= e!181978 e!181977)))

(declare-fun res!149195 () Bool)

(assert (=> b!287308 (=> (not res!149195) (not e!181977))))

(declare-fun lt!141457 () SeekEntryResult!1983)

(assert (=> b!287308 (= res!149195 (or (= lt!141457 (MissingZero!1983 i!1256)) (= lt!141457 (MissingVacant!1983 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14408 (_ BitVec 32)) SeekEntryResult!1983)

(assert (=> b!287308 (= lt!141457 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287309 () Bool)

(declare-fun res!149194 () Bool)

(assert (=> b!287309 (=> (not res!149194) (not e!181978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287309 (= res!149194 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28004 res!149196) b!287306))

(assert (= (and b!287306 res!149192) b!287309))

(assert (= (and b!287309 res!149194) b!287305))

(assert (= (and b!287305 res!149191) b!287308))

(assert (= (and b!287308 res!149195) b!287307))

(assert (= (and b!287307 res!149193) b!287304))

(declare-fun m!301747 () Bool)

(assert (=> b!287308 m!301747))

(declare-fun m!301749 () Bool)

(assert (=> b!287304 m!301749))

(assert (=> b!287304 m!301749))

(declare-fun m!301751 () Bool)

(assert (=> b!287304 m!301751))

(declare-fun m!301753 () Bool)

(assert (=> start!28004 m!301753))

(declare-fun m!301755 () Bool)

(assert (=> start!28004 m!301755))

(declare-fun m!301757 () Bool)

(assert (=> b!287305 m!301757))

(declare-fun m!301759 () Bool)

(assert (=> b!287307 m!301759))

(declare-fun m!301761 () Bool)

(assert (=> b!287309 m!301761))

(check-sat (not b!287308) (not start!28004) (not b!287305) (not b!287307) (not b!287309) (not b!287304))
(check-sat)
