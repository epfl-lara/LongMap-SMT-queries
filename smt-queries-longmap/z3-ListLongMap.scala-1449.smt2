; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27932 () Bool)

(assert start!27932)

(declare-fun res!148850 () Bool)

(declare-fun e!181671 () Bool)

(assert (=> start!27932 (=> (not res!148850) (not e!181671))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27932 (= res!148850 (validMask!0 mask!3809))))

(assert (=> start!27932 e!181671))

(assert (=> start!27932 true))

(declare-datatypes ((array!14374 0))(
  ( (array!14375 (arr!6819 (Array (_ BitVec 32) (_ BitVec 64))) (size!7172 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14374)

(declare-fun array_inv!4791 (array!14374) Bool)

(assert (=> start!27932 (array_inv!4791 a!3312)))

(declare-fun b!286788 () Bool)

(declare-fun e!181669 () Bool)

(assert (=> b!286788 (= e!181671 e!181669)))

(declare-fun res!148852 () Bool)

(assert (=> b!286788 (=> (not res!148852) (not e!181669))))

(declare-datatypes ((SeekEntryResult!1967 0))(
  ( (MissingZero!1967 (index!10038 (_ BitVec 32))) (Found!1967 (index!10039 (_ BitVec 32))) (Intermediate!1967 (undefined!2779 Bool) (index!10040 (_ BitVec 32)) (x!28273 (_ BitVec 32))) (Undefined!1967) (MissingVacant!1967 (index!10041 (_ BitVec 32))) )
))
(declare-fun lt!141125 () SeekEntryResult!1967)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286788 (= res!148852 (or (= lt!141125 (MissingZero!1967 i!1256)) (= lt!141125 (MissingVacant!1967 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14374 (_ BitVec 32)) SeekEntryResult!1967)

(assert (=> b!286788 (= lt!141125 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286789 () Bool)

(declare-fun res!148854 () Bool)

(assert (=> b!286789 (=> (not res!148854) (not e!181671))))

(declare-fun arrayContainsKey!0 (array!14374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286789 (= res!148854 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286790 () Bool)

(declare-fun res!148855 () Bool)

(assert (=> b!286790 (=> (not res!148855) (not e!181669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14374 (_ BitVec 32)) Bool)

(assert (=> b!286790 (= res!148855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286791 () Bool)

(declare-fun res!148853 () Bool)

(assert (=> b!286791 (=> (not res!148853) (not e!181671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286791 (= res!148853 (validKeyInArray!0 k0!2524))))

(declare-fun b!286792 () Bool)

(declare-fun res!148851 () Bool)

(assert (=> b!286792 (=> (not res!148851) (not e!181671))))

(assert (=> b!286792 (= res!148851 (and (= (size!7172 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7172 a!3312))))))

(declare-fun b!286793 () Bool)

(assert (=> b!286793 (= e!181669 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141126 () SeekEntryResult!1967)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14374 (_ BitVec 32)) SeekEntryResult!1967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286793 (= lt!141126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and start!27932 res!148850) b!286792))

(assert (= (and b!286792 res!148851) b!286791))

(assert (= (and b!286791 res!148853) b!286789))

(assert (= (and b!286789 res!148854) b!286788))

(assert (= (and b!286788 res!148852) b!286790))

(assert (= (and b!286790 res!148855) b!286793))

(declare-fun m!300899 () Bool)

(assert (=> start!27932 m!300899))

(declare-fun m!300901 () Bool)

(assert (=> start!27932 m!300901))

(declare-fun m!300903 () Bool)

(assert (=> b!286791 m!300903))

(declare-fun m!300905 () Bool)

(assert (=> b!286788 m!300905))

(declare-fun m!300907 () Bool)

(assert (=> b!286793 m!300907))

(assert (=> b!286793 m!300907))

(declare-fun m!300909 () Bool)

(assert (=> b!286793 m!300909))

(declare-fun m!300911 () Bool)

(assert (=> b!286789 m!300911))

(declare-fun m!300913 () Bool)

(assert (=> b!286790 m!300913))

(check-sat (not start!27932) (not b!286790) (not b!286788) (not b!286791) (not b!286789) (not b!286793))
(check-sat)
