; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28258 () Bool)

(assert start!28258)

(declare-fun b!289656 () Bool)

(declare-fun res!151173 () Bool)

(declare-fun e!183364 () Bool)

(assert (=> b!289656 (=> (not res!151173) (not e!183364))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289656 (= res!151173 (validKeyInArray!0 k0!2524))))

(declare-fun b!289657 () Bool)

(declare-fun res!151179 () Bool)

(assert (=> b!289657 (=> (not res!151179) (not e!183364))))

(declare-datatypes ((array!14577 0))(
  ( (array!14578 (arr!6916 (Array (_ BitVec 32) (_ BitVec 64))) (size!7268 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14577)

(declare-fun arrayContainsKey!0 (array!14577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289657 (= res!151179 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289658 () Bool)

(declare-datatypes ((Unit!9078 0))(
  ( (Unit!9079) )
))
(declare-fun e!183363 () Unit!9078)

(declare-fun e!183365 () Unit!9078)

(assert (=> b!289658 (= e!183363 e!183365)))

(declare-fun c!46804 () Bool)

(declare-datatypes ((SeekEntryResult!2030 0))(
  ( (MissingZero!2030 (index!10290 (_ BitVec 32))) (Found!2030 (index!10291 (_ BitVec 32))) (Intermediate!2030 (undefined!2842 Bool) (index!10292 (_ BitVec 32)) (x!28603 (_ BitVec 32))) (Undefined!2030) (MissingVacant!2030 (index!10293 (_ BitVec 32))) )
))
(declare-fun lt!142993 () SeekEntryResult!2030)

(get-info :version)

(assert (=> b!289658 (= c!46804 ((_ is Intermediate!2030) lt!142993))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun b!289659 () Bool)

(declare-fun lt!142995 () SeekEntryResult!2030)

(assert (=> b!289659 (and (= lt!142995 lt!142993) (= (select (store (arr!6916 a!3312) i!1256 k0!2524) (index!10292 lt!142993)) k0!2524))))

(declare-fun lt!142992 () Unit!9078)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!142996 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9078)

(assert (=> b!289659 (= lt!142992 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142996 (index!10292 lt!142993) (x!28603 lt!142993) mask!3809))))

(assert (=> b!289659 (and (= (select (arr!6916 a!3312) (index!10292 lt!142993)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10292 lt!142993) i!1256))))

(declare-fun Unit!9080 () Unit!9078)

(assert (=> b!289659 (= e!183365 Unit!9080)))

(declare-fun b!289660 () Bool)

(declare-fun e!183367 () Bool)

(declare-fun e!183368 () Bool)

(assert (=> b!289660 (= e!183367 e!183368)))

(declare-fun res!151177 () Bool)

(assert (=> b!289660 (=> (not res!151177) (not e!183368))))

(declare-fun lt!142994 () Bool)

(assert (=> b!289660 (= res!151177 lt!142994)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14577 (_ BitVec 32)) SeekEntryResult!2030)

(assert (=> b!289660 (= lt!142995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142996 k0!2524 (array!14578 (store (arr!6916 a!3312) i!1256 k0!2524) (size!7268 a!3312)) mask!3809))))

(assert (=> b!289660 (= lt!142993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142996 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289660 (= lt!142996 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289661 () Bool)

(declare-fun res!151174 () Bool)

(assert (=> b!289661 (=> (not res!151174) (not e!183367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14577 (_ BitVec 32)) Bool)

(assert (=> b!289661 (= res!151174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289662 () Bool)

(declare-fun Unit!9081 () Unit!9078)

(assert (=> b!289662 (= e!183363 Unit!9081)))

(assert (=> b!289662 false))

(declare-fun res!151178 () Bool)

(assert (=> start!28258 (=> (not res!151178) (not e!183364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28258 (= res!151178 (validMask!0 mask!3809))))

(assert (=> start!28258 e!183364))

(assert (=> start!28258 true))

(declare-fun array_inv!4866 (array!14577) Bool)

(assert (=> start!28258 (array_inv!4866 a!3312)))

(declare-fun b!289663 () Bool)

(assert (=> b!289663 (= e!183364 e!183367)))

(declare-fun res!151176 () Bool)

(assert (=> b!289663 (=> (not res!151176) (not e!183367))))

(declare-fun lt!142997 () SeekEntryResult!2030)

(assert (=> b!289663 (= res!151176 (or lt!142994 (= lt!142997 (MissingVacant!2030 i!1256))))))

(assert (=> b!289663 (= lt!142994 (= lt!142997 (MissingZero!2030 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14577 (_ BitVec 32)) SeekEntryResult!2030)

(assert (=> b!289663 (= lt!142997 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289664 () Bool)

(assert (=> b!289664 (= e!183368 false)))

(declare-fun lt!142998 () Unit!9078)

(assert (=> b!289664 (= lt!142998 e!183363)))

(declare-fun c!46803 () Bool)

(assert (=> b!289664 (= c!46803 (or (and ((_ is Intermediate!2030) lt!142993) (undefined!2842 lt!142993)) (and ((_ is Intermediate!2030) lt!142993) (= (select (arr!6916 a!3312) (index!10292 lt!142993)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2030) lt!142993) (= (select (arr!6916 a!3312) (index!10292 lt!142993)) k0!2524))))))

(declare-fun b!289665 () Bool)

(declare-fun res!151175 () Bool)

(assert (=> b!289665 (=> (not res!151175) (not e!183364))))

(assert (=> b!289665 (= res!151175 (and (= (size!7268 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7268 a!3312))))))

(declare-fun b!289666 () Bool)

(assert (=> b!289666 false))

(declare-fun Unit!9082 () Unit!9078)

(assert (=> b!289666 (= e!183365 Unit!9082)))

(assert (= (and start!28258 res!151178) b!289665))

(assert (= (and b!289665 res!151175) b!289656))

(assert (= (and b!289656 res!151173) b!289657))

(assert (= (and b!289657 res!151179) b!289663))

(assert (= (and b!289663 res!151176) b!289661))

(assert (= (and b!289661 res!151174) b!289660))

(assert (= (and b!289660 res!151177) b!289664))

(assert (= (and b!289664 c!46803) b!289662))

(assert (= (and b!289664 (not c!46803)) b!289658))

(assert (= (and b!289658 c!46804) b!289659))

(assert (= (and b!289658 (not c!46804)) b!289666))

(declare-fun m!303917 () Bool)

(assert (=> b!289656 m!303917))

(declare-fun m!303919 () Bool)

(assert (=> start!28258 m!303919))

(declare-fun m!303921 () Bool)

(assert (=> start!28258 m!303921))

(declare-fun m!303923 () Bool)

(assert (=> b!289664 m!303923))

(declare-fun m!303925 () Bool)

(assert (=> b!289660 m!303925))

(declare-fun m!303927 () Bool)

(assert (=> b!289660 m!303927))

(declare-fun m!303929 () Bool)

(assert (=> b!289660 m!303929))

(declare-fun m!303931 () Bool)

(assert (=> b!289660 m!303931))

(declare-fun m!303933 () Bool)

(assert (=> b!289663 m!303933))

(assert (=> b!289659 m!303925))

(declare-fun m!303935 () Bool)

(assert (=> b!289659 m!303935))

(declare-fun m!303937 () Bool)

(assert (=> b!289659 m!303937))

(assert (=> b!289659 m!303923))

(declare-fun m!303939 () Bool)

(assert (=> b!289661 m!303939))

(declare-fun m!303941 () Bool)

(assert (=> b!289657 m!303941))

(check-sat (not b!289657) (not b!289659) (not b!289663) (not start!28258) (not b!289661) (not b!289660) (not b!289656))
(check-sat)
