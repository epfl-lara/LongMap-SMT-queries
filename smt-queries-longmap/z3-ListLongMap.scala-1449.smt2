; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27928 () Bool)

(assert start!27928)

(declare-fun res!148968 () Bool)

(declare-fun e!181794 () Bool)

(assert (=> start!27928 (=> (not res!148968) (not e!181794))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27928 (= res!148968 (validMask!0 mask!3809))))

(assert (=> start!27928 e!181794))

(assert (=> start!27928 true))

(declare-datatypes ((array!14382 0))(
  ( (array!14383 (arr!6823 (Array (_ BitVec 32) (_ BitVec 64))) (size!7175 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14382)

(declare-fun array_inv!4773 (array!14382) Bool)

(assert (=> start!27928 (array_inv!4773 a!3312)))

(declare-fun b!286982 () Bool)

(declare-fun res!148971 () Bool)

(assert (=> b!286982 (=> (not res!148971) (not e!181794))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286982 (= res!148971 (and (= (size!7175 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7175 a!3312))))))

(declare-fun b!286983 () Bool)

(declare-fun e!181796 () Bool)

(assert (=> b!286983 (= e!181794 e!181796)))

(declare-fun res!148966 () Bool)

(assert (=> b!286983 (=> (not res!148966) (not e!181796))))

(declare-datatypes ((SeekEntryResult!1937 0))(
  ( (MissingZero!1937 (index!9918 (_ BitVec 32))) (Found!1937 (index!9919 (_ BitVec 32))) (Intermediate!1937 (undefined!2749 Bool) (index!9920 (_ BitVec 32)) (x!28244 (_ BitVec 32))) (Undefined!1937) (MissingVacant!1937 (index!9921 (_ BitVec 32))) )
))
(declare-fun lt!141365 () SeekEntryResult!1937)

(assert (=> b!286983 (= res!148966 (or (= lt!141365 (MissingZero!1937 i!1256)) (= lt!141365 (MissingVacant!1937 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14382 (_ BitVec 32)) SeekEntryResult!1937)

(assert (=> b!286983 (= lt!141365 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286984 () Bool)

(declare-fun res!148967 () Bool)

(assert (=> b!286984 (=> (not res!148967) (not e!181794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286984 (= res!148967 (validKeyInArray!0 k0!2524))))

(declare-fun b!286985 () Bool)

(declare-fun res!148970 () Bool)

(assert (=> b!286985 (=> (not res!148970) (not e!181796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14382 (_ BitVec 32)) Bool)

(assert (=> b!286985 (= res!148970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286986 () Bool)

(declare-fun res!148969 () Bool)

(assert (=> b!286986 (=> (not res!148969) (not e!181794))))

(declare-fun arrayContainsKey!0 (array!14382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286986 (= res!148969 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286987 () Bool)

(assert (=> b!286987 (= e!181796 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141366 () SeekEntryResult!1937)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14382 (_ BitVec 32)) SeekEntryResult!1937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286987 (= lt!141366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and start!27928 res!148968) b!286982))

(assert (= (and b!286982 res!148971) b!286984))

(assert (= (and b!286984 res!148967) b!286986))

(assert (= (and b!286986 res!148969) b!286983))

(assert (= (and b!286983 res!148966) b!286985))

(assert (= (and b!286985 res!148970) b!286987))

(declare-fun m!301697 () Bool)

(assert (=> b!286987 m!301697))

(assert (=> b!286987 m!301697))

(declare-fun m!301699 () Bool)

(assert (=> b!286987 m!301699))

(declare-fun m!301701 () Bool)

(assert (=> b!286983 m!301701))

(declare-fun m!301703 () Bool)

(assert (=> b!286986 m!301703))

(declare-fun m!301705 () Bool)

(assert (=> start!27928 m!301705))

(declare-fun m!301707 () Bool)

(assert (=> start!27928 m!301707))

(declare-fun m!301709 () Bool)

(assert (=> b!286985 m!301709))

(declare-fun m!301711 () Bool)

(assert (=> b!286984 m!301711))

(check-sat (not b!286983) (not b!286985) (not start!27928) (not b!286986) (not b!286987) (not b!286984))
(check-sat)
