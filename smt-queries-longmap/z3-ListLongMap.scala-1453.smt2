; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28004 () Bool)

(assert start!28004)

(declare-fun b!287193 () Bool)

(declare-fun res!149132 () Bool)

(declare-fun e!181894 () Bool)

(assert (=> b!287193 (=> (not res!149132) (not e!181894))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287193 (= res!149132 (validKeyInArray!0 k0!2524))))

(declare-fun res!149133 () Bool)

(assert (=> start!28004 (=> (not res!149133) (not e!181894))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28004 (= res!149133 (validMask!0 mask!3809))))

(assert (=> start!28004 e!181894))

(assert (=> start!28004 true))

(declare-datatypes ((array!14401 0))(
  ( (array!14402 (arr!6831 (Array (_ BitVec 32) (_ BitVec 64))) (size!7184 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14401)

(declare-fun array_inv!4803 (array!14401) Bool)

(assert (=> start!28004 (array_inv!4803 a!3312)))

(declare-fun b!287194 () Bool)

(declare-fun res!149136 () Bool)

(declare-fun e!181896 () Bool)

(assert (=> b!287194 (=> (not res!149136) (not e!181896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14401 (_ BitVec 32)) Bool)

(assert (=> b!287194 (= res!149136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287195 () Bool)

(declare-fun res!149137 () Bool)

(assert (=> b!287195 (=> (not res!149137) (not e!181894))))

(declare-fun arrayContainsKey!0 (array!14401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287195 (= res!149137 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287196 () Bool)

(assert (=> b!287196 (= e!181894 e!181896)))

(declare-fun res!149135 () Bool)

(assert (=> b!287196 (=> (not res!149135) (not e!181896))))

(declare-datatypes ((SeekEntryResult!1979 0))(
  ( (MissingZero!1979 (index!10086 (_ BitVec 32))) (Found!1979 (index!10087 (_ BitVec 32))) (Intermediate!1979 (undefined!2791 Bool) (index!10088 (_ BitVec 32)) (x!28323 (_ BitVec 32))) (Undefined!1979) (MissingVacant!1979 (index!10089 (_ BitVec 32))) )
))
(declare-fun lt!141288 () SeekEntryResult!1979)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287196 (= res!149135 (or (= lt!141288 (MissingZero!1979 i!1256)) (= lt!141288 (MissingVacant!1979 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14401 (_ BitVec 32)) SeekEntryResult!1979)

(assert (=> b!287196 (= lt!141288 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287197 () Bool)

(declare-fun res!149134 () Bool)

(assert (=> b!287197 (=> (not res!149134) (not e!181894))))

(assert (=> b!287197 (= res!149134 (and (= (size!7184 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7184 a!3312))))))

(declare-fun b!287198 () Bool)

(assert (=> b!287198 (= e!181896 false)))

(declare-fun lt!141287 () SeekEntryResult!1979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14401 (_ BitVec 32)) SeekEntryResult!1979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287198 (= lt!141287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and start!28004 res!149133) b!287197))

(assert (= (and b!287197 res!149134) b!287193))

(assert (= (and b!287193 res!149132) b!287195))

(assert (= (and b!287195 res!149137) b!287196))

(assert (= (and b!287196 res!149135) b!287194))

(assert (= (and b!287194 res!149136) b!287198))

(declare-fun m!301187 () Bool)

(assert (=> start!28004 m!301187))

(declare-fun m!301189 () Bool)

(assert (=> start!28004 m!301189))

(declare-fun m!301191 () Bool)

(assert (=> b!287193 m!301191))

(declare-fun m!301193 () Bool)

(assert (=> b!287195 m!301193))

(declare-fun m!301195 () Bool)

(assert (=> b!287194 m!301195))

(declare-fun m!301197 () Bool)

(assert (=> b!287196 m!301197))

(declare-fun m!301199 () Bool)

(assert (=> b!287198 m!301199))

(assert (=> b!287198 m!301199))

(declare-fun m!301201 () Bool)

(assert (=> b!287198 m!301201))

(check-sat (not b!287198) (not start!28004) (not b!287195) (not b!287196) (not b!287194) (not b!287193))
(check-sat)
