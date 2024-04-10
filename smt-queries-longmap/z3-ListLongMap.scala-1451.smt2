; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27998 () Bool)

(assert start!27998)

(declare-fun b!287250 () Bool)

(declare-fun res!149138 () Bool)

(declare-fun e!181952 () Bool)

(assert (=> b!287250 (=> (not res!149138) (not e!181952))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14402 0))(
  ( (array!14403 (arr!6831 (Array (_ BitVec 32) (_ BitVec 64))) (size!7183 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14402)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287250 (= res!149138 (and (= (size!7183 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7183 a!3312))))))

(declare-fun b!287251 () Bool)

(declare-fun e!181950 () Bool)

(assert (=> b!287251 (= e!181950 false)))

(declare-datatypes ((SeekEntryResult!1980 0))(
  ( (MissingZero!1980 (index!10090 (_ BitVec 32))) (Found!1980 (index!10091 (_ BitVec 32))) (Intermediate!1980 (undefined!2792 Bool) (index!10092 (_ BitVec 32)) (x!28309 (_ BitVec 32))) (Undefined!1980) (MissingVacant!1980 (index!10093 (_ BitVec 32))) )
))
(declare-fun lt!141438 () SeekEntryResult!1980)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14402 (_ BitVec 32)) SeekEntryResult!1980)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287251 (= lt!141438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287252 () Bool)

(declare-fun res!149139 () Bool)

(assert (=> b!287252 (=> (not res!149139) (not e!181952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287252 (= res!149139 (validKeyInArray!0 k0!2524))))

(declare-fun res!149137 () Bool)

(assert (=> start!27998 (=> (not res!149137) (not e!181952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27998 (= res!149137 (validMask!0 mask!3809))))

(assert (=> start!27998 e!181952))

(assert (=> start!27998 true))

(declare-fun array_inv!4794 (array!14402) Bool)

(assert (=> start!27998 (array_inv!4794 a!3312)))

(declare-fun b!287253 () Bool)

(declare-fun res!149141 () Bool)

(assert (=> b!287253 (=> (not res!149141) (not e!181952))))

(declare-fun arrayContainsKey!0 (array!14402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287253 (= res!149141 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287254 () Bool)

(assert (=> b!287254 (= e!181952 e!181950)))

(declare-fun res!149140 () Bool)

(assert (=> b!287254 (=> (not res!149140) (not e!181950))))

(declare-fun lt!141439 () SeekEntryResult!1980)

(assert (=> b!287254 (= res!149140 (or (= lt!141439 (MissingZero!1980 i!1256)) (= lt!141439 (MissingVacant!1980 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14402 (_ BitVec 32)) SeekEntryResult!1980)

(assert (=> b!287254 (= lt!141439 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287255 () Bool)

(declare-fun res!149142 () Bool)

(assert (=> b!287255 (=> (not res!149142) (not e!181950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14402 (_ BitVec 32)) Bool)

(assert (=> b!287255 (= res!149142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27998 res!149137) b!287250))

(assert (= (and b!287250 res!149138) b!287252))

(assert (= (and b!287252 res!149139) b!287253))

(assert (= (and b!287253 res!149141) b!287254))

(assert (= (and b!287254 res!149140) b!287255))

(assert (= (and b!287255 res!149142) b!287251))

(declare-fun m!301699 () Bool)

(assert (=> start!27998 m!301699))

(declare-fun m!301701 () Bool)

(assert (=> start!27998 m!301701))

(declare-fun m!301703 () Bool)

(assert (=> b!287255 m!301703))

(declare-fun m!301705 () Bool)

(assert (=> b!287251 m!301705))

(assert (=> b!287251 m!301705))

(declare-fun m!301707 () Bool)

(assert (=> b!287251 m!301707))

(declare-fun m!301709 () Bool)

(assert (=> b!287253 m!301709))

(declare-fun m!301711 () Bool)

(assert (=> b!287252 m!301711))

(declare-fun m!301713 () Bool)

(assert (=> b!287254 m!301713))

(check-sat (not b!287251) (not start!27998) (not b!287252) (not b!287253) (not b!287254) (not b!287255))
(check-sat)
