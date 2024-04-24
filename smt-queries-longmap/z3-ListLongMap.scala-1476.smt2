; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28234 () Bool)

(assert start!28234)

(declare-fun b!289308 () Bool)

(declare-fun e!183167 () Bool)

(declare-fun e!183163 () Bool)

(assert (=> b!289308 (= e!183167 e!183163)))

(declare-fun res!150910 () Bool)

(assert (=> b!289308 (=> (not res!150910) (not e!183163))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142760 () Bool)

(declare-datatypes ((SeekEntryResult!2018 0))(
  ( (MissingZero!2018 (index!10242 (_ BitVec 32))) (Found!2018 (index!10243 (_ BitVec 32))) (Intermediate!2018 (undefined!2830 Bool) (index!10244 (_ BitVec 32)) (x!28559 (_ BitVec 32))) (Undefined!2018) (MissingVacant!2018 (index!10245 (_ BitVec 32))) )
))
(declare-fun lt!142759 () SeekEntryResult!2018)

(assert (=> b!289308 (= res!150910 (or lt!142760 (= lt!142759 (MissingVacant!2018 i!1256))))))

(assert (=> b!289308 (= lt!142760 (= lt!142759 (MissingZero!2018 i!1256)))))

(declare-datatypes ((array!14553 0))(
  ( (array!14554 (arr!6904 (Array (_ BitVec 32) (_ BitVec 64))) (size!7256 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14553)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14553 (_ BitVec 32)) SeekEntryResult!2018)

(assert (=> b!289308 (= lt!142759 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289309 () Bool)

(declare-fun res!150905 () Bool)

(assert (=> b!289309 (=> (not res!150905) (not e!183167))))

(declare-fun arrayContainsKey!0 (array!14553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289309 (= res!150905 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289310 () Bool)

(declare-fun res!150907 () Bool)

(assert (=> b!289310 (=> (not res!150907) (not e!183167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289310 (= res!150907 (validKeyInArray!0 k0!2524))))

(declare-fun b!289311 () Bool)

(declare-fun res!150906 () Bool)

(assert (=> b!289311 (=> (not res!150906) (not e!183167))))

(assert (=> b!289311 (= res!150906 (and (= (size!7256 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7256 a!3312))))))

(declare-fun b!289312 () Bool)

(declare-fun res!150908 () Bool)

(assert (=> b!289312 (=> (not res!150908) (not e!183163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14553 (_ BitVec 32)) Bool)

(assert (=> b!289312 (= res!150908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289313 () Bool)

(declare-fun e!183165 () Bool)

(assert (=> b!289313 (= e!183165 (not true))))

(declare-fun lt!142758 () SeekEntryResult!2018)

(assert (=> b!289313 (and (= (select (arr!6904 a!3312) (index!10244 lt!142758)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10244 lt!142758) i!1256))))

(declare-fun b!289314 () Bool)

(declare-fun e!183164 () Bool)

(assert (=> b!289314 (= e!183163 e!183164)))

(declare-fun res!150911 () Bool)

(assert (=> b!289314 (=> (not res!150911) (not e!183164))))

(assert (=> b!289314 (= res!150911 lt!142760)))

(declare-fun lt!142761 () (_ BitVec 32))

(declare-fun lt!142756 () SeekEntryResult!2018)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14553 (_ BitVec 32)) SeekEntryResult!2018)

(assert (=> b!289314 (= lt!142756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142761 k0!2524 (array!14554 (store (arr!6904 a!3312) i!1256 k0!2524) (size!7256 a!3312)) mask!3809))))

(assert (=> b!289314 (= lt!142758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142761 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289314 (= lt!142761 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150909 () Bool)

(assert (=> start!28234 (=> (not res!150909) (not e!183167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28234 (= res!150909 (validMask!0 mask!3809))))

(assert (=> start!28234 e!183167))

(assert (=> start!28234 true))

(declare-fun array_inv!4854 (array!14553) Bool)

(assert (=> start!28234 (array_inv!4854 a!3312)))

(declare-fun b!289315 () Bool)

(assert (=> b!289315 (= e!183164 e!183165)))

(declare-fun res!150912 () Bool)

(assert (=> b!289315 (=> (not res!150912) (not e!183165))))

(declare-fun lt!142757 () Bool)

(assert (=> b!289315 (= res!150912 (and (or lt!142757 (not (undefined!2830 lt!142758))) (or lt!142757 (not (= (select (arr!6904 a!3312) (index!10244 lt!142758)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142757 (not (= (select (arr!6904 a!3312) (index!10244 lt!142758)) k0!2524))) (not lt!142757)))))

(get-info :version)

(assert (=> b!289315 (= lt!142757 (not ((_ is Intermediate!2018) lt!142758)))))

(assert (= (and start!28234 res!150909) b!289311))

(assert (= (and b!289311 res!150906) b!289310))

(assert (= (and b!289310 res!150907) b!289309))

(assert (= (and b!289309 res!150905) b!289308))

(assert (= (and b!289308 res!150910) b!289312))

(assert (= (and b!289312 res!150908) b!289314))

(assert (= (and b!289314 res!150911) b!289315))

(assert (= (and b!289315 res!150912) b!289313))

(declare-fun m!303629 () Bool)

(assert (=> b!289313 m!303629))

(declare-fun m!303631 () Bool)

(assert (=> b!289312 m!303631))

(declare-fun m!303633 () Bool)

(assert (=> b!289309 m!303633))

(assert (=> b!289315 m!303629))

(declare-fun m!303635 () Bool)

(assert (=> b!289314 m!303635))

(declare-fun m!303637 () Bool)

(assert (=> b!289314 m!303637))

(declare-fun m!303639 () Bool)

(assert (=> b!289314 m!303639))

(declare-fun m!303641 () Bool)

(assert (=> b!289314 m!303641))

(declare-fun m!303643 () Bool)

(assert (=> b!289310 m!303643))

(declare-fun m!303645 () Bool)

(assert (=> b!289308 m!303645))

(declare-fun m!303647 () Bool)

(assert (=> start!28234 m!303647))

(declare-fun m!303649 () Bool)

(assert (=> start!28234 m!303649))

(check-sat (not b!289314) (not b!289312) (not b!289308) (not b!289309) (not b!289310) (not start!28234))
(check-sat)
