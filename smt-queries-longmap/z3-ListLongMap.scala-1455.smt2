; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28070 () Bool)

(assert start!28070)

(declare-fun b!287655 () Bool)

(declare-fun res!149424 () Bool)

(declare-fun e!182177 () Bool)

(assert (=> b!287655 (=> (not res!149424) (not e!182177))))

(declare-datatypes ((array!14429 0))(
  ( (array!14430 (arr!6843 (Array (_ BitVec 32) (_ BitVec 64))) (size!7195 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14429)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287655 (= res!149424 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149420 () Bool)

(assert (=> start!28070 (=> (not res!149420) (not e!182177))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28070 (= res!149420 (validMask!0 mask!3809))))

(assert (=> start!28070 e!182177))

(assert (=> start!28070 true))

(declare-fun array_inv!4806 (array!14429) Bool)

(assert (=> start!28070 (array_inv!4806 a!3312)))

(declare-fun b!287656 () Bool)

(declare-fun e!182176 () Bool)

(assert (=> b!287656 (= e!182177 e!182176)))

(declare-fun res!149419 () Bool)

(assert (=> b!287656 (=> (not res!149419) (not e!182176))))

(declare-datatypes ((SeekEntryResult!1992 0))(
  ( (MissingZero!1992 (index!10138 (_ BitVec 32))) (Found!1992 (index!10139 (_ BitVec 32))) (Intermediate!1992 (undefined!2804 Bool) (index!10140 (_ BitVec 32)) (x!28359 (_ BitVec 32))) (Undefined!1992) (MissingVacant!1992 (index!10141 (_ BitVec 32))) )
))
(declare-fun lt!141610 () SeekEntryResult!1992)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287656 (= res!149419 (or (= lt!141610 (MissingZero!1992 i!1256)) (= lt!141610 (MissingVacant!1992 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14429 (_ BitVec 32)) SeekEntryResult!1992)

(assert (=> b!287656 (= lt!141610 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287657 () Bool)

(assert (=> b!287657 (= e!182176 false)))

(declare-fun lt!141609 () SeekEntryResult!1992)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14429 (_ BitVec 32)) SeekEntryResult!1992)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287657 (= lt!141609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287658 () Bool)

(declare-fun res!149421 () Bool)

(assert (=> b!287658 (=> (not res!149421) (not e!182176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14429 (_ BitVec 32)) Bool)

(assert (=> b!287658 (= res!149421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287659 () Bool)

(declare-fun res!149422 () Bool)

(assert (=> b!287659 (=> (not res!149422) (not e!182177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287659 (= res!149422 (validKeyInArray!0 k0!2524))))

(declare-fun b!287660 () Bool)

(declare-fun res!149423 () Bool)

(assert (=> b!287660 (=> (not res!149423) (not e!182177))))

(assert (=> b!287660 (= res!149423 (and (= (size!7195 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7195 a!3312))))))

(assert (= (and start!28070 res!149420) b!287660))

(assert (= (and b!287660 res!149423) b!287659))

(assert (= (and b!287659 res!149422) b!287655))

(assert (= (and b!287655 res!149424) b!287656))

(assert (= (and b!287656 res!149419) b!287658))

(assert (= (and b!287658 res!149421) b!287657))

(declare-fun m!301993 () Bool)

(assert (=> b!287656 m!301993))

(declare-fun m!301995 () Bool)

(assert (=> start!28070 m!301995))

(declare-fun m!301997 () Bool)

(assert (=> start!28070 m!301997))

(declare-fun m!301999 () Bool)

(assert (=> b!287655 m!301999))

(declare-fun m!302001 () Bool)

(assert (=> b!287657 m!302001))

(assert (=> b!287657 m!302001))

(declare-fun m!302003 () Bool)

(assert (=> b!287657 m!302003))

(declare-fun m!302005 () Bool)

(assert (=> b!287658 m!302005))

(declare-fun m!302007 () Bool)

(assert (=> b!287659 m!302007))

(check-sat (not start!28070) (not b!287655) (not b!287658) (not b!287657) (not b!287656) (not b!287659))
(check-sat)
