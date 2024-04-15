; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28088 () Bool)

(assert start!28088)

(declare-fun b!287706 () Bool)

(declare-fun e!182175 () Bool)

(declare-fun e!182173 () Bool)

(assert (=> b!287706 (= e!182175 e!182173)))

(declare-fun res!149525 () Bool)

(assert (=> b!287706 (=> (not res!149525) (not e!182173))))

(declare-datatypes ((SeekEntryResult!1997 0))(
  ( (MissingZero!1997 (index!10158 (_ BitVec 32))) (Found!1997 (index!10159 (_ BitVec 32))) (Intermediate!1997 (undefined!2809 Bool) (index!10160 (_ BitVec 32)) (x!28395 (_ BitVec 32))) (Undefined!1997) (MissingVacant!1997 (index!10161 (_ BitVec 32))) )
))
(declare-fun lt!141536 () SeekEntryResult!1997)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287706 (= res!149525 (or (= lt!141536 (MissingZero!1997 i!1256)) (= lt!141536 (MissingVacant!1997 i!1256))))))

(declare-datatypes ((array!14440 0))(
  ( (array!14441 (arr!6849 (Array (_ BitVec 32) (_ BitVec 64))) (size!7202 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14440)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14440 (_ BitVec 32)) SeekEntryResult!1997)

(assert (=> b!287706 (= lt!141536 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287707 () Bool)

(declare-fun res!149526 () Bool)

(assert (=> b!287707 (=> (not res!149526) (not e!182175))))

(assert (=> b!287707 (= res!149526 (and (= (size!7202 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7202 a!3312))))))

(declare-fun b!287708 () Bool)

(assert (=> b!287708 (= e!182173 false)))

(declare-fun lt!141535 () SeekEntryResult!1997)

(declare-fun lt!141534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14440 (_ BitVec 32)) SeekEntryResult!1997)

(assert (=> b!287708 (= lt!141535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141534 k0!2524 (array!14441 (store (arr!6849 a!3312) i!1256 k0!2524) (size!7202 a!3312)) mask!3809))))

(declare-fun lt!141537 () SeekEntryResult!1997)

(assert (=> b!287708 (= lt!141537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141534 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287708 (= lt!141534 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287709 () Bool)

(declare-fun res!149527 () Bool)

(assert (=> b!287709 (=> (not res!149527) (not e!182173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14440 (_ BitVec 32)) Bool)

(assert (=> b!287709 (= res!149527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!149523 () Bool)

(assert (=> start!28088 (=> (not res!149523) (not e!182175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28088 (= res!149523 (validMask!0 mask!3809))))

(assert (=> start!28088 e!182175))

(assert (=> start!28088 true))

(declare-fun array_inv!4821 (array!14440) Bool)

(assert (=> start!28088 (array_inv!4821 a!3312)))

(declare-fun b!287710 () Bool)

(declare-fun res!149522 () Bool)

(assert (=> b!287710 (=> (not res!149522) (not e!182175))))

(declare-fun arrayContainsKey!0 (array!14440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287710 (= res!149522 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287711 () Bool)

(declare-fun res!149524 () Bool)

(assert (=> b!287711 (=> (not res!149524) (not e!182175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287711 (= res!149524 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28088 res!149523) b!287707))

(assert (= (and b!287707 res!149526) b!287711))

(assert (= (and b!287711 res!149524) b!287710))

(assert (= (and b!287710 res!149522) b!287706))

(assert (= (and b!287706 res!149525) b!287709))

(assert (= (and b!287709 res!149527) b!287708))

(declare-fun m!301601 () Bool)

(assert (=> b!287706 m!301601))

(declare-fun m!301603 () Bool)

(assert (=> b!287708 m!301603))

(declare-fun m!301605 () Bool)

(assert (=> b!287708 m!301605))

(declare-fun m!301607 () Bool)

(assert (=> b!287708 m!301607))

(declare-fun m!301609 () Bool)

(assert (=> b!287708 m!301609))

(declare-fun m!301611 () Bool)

(assert (=> start!28088 m!301611))

(declare-fun m!301613 () Bool)

(assert (=> start!28088 m!301613))

(declare-fun m!301615 () Bool)

(assert (=> b!287710 m!301615))

(declare-fun m!301617 () Bool)

(assert (=> b!287711 m!301617))

(declare-fun m!301619 () Bool)

(assert (=> b!287709 m!301619))

(check-sat (not b!287706) (not b!287710) (not start!28088) (not b!287708) (not b!287711) (not b!287709))
(check-sat)
