; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28106 () Bool)

(assert start!28106)

(declare-fun b!287989 () Bool)

(declare-fun res!149759 () Bool)

(declare-fun e!182348 () Bool)

(assert (=> b!287989 (=> (not res!149759) (not e!182348))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287989 (= res!149759 (validKeyInArray!0 k0!2524))))

(declare-fun b!287990 () Bool)

(declare-fun res!149760 () Bool)

(assert (=> b!287990 (=> (not res!149760) (not e!182348))))

(declare-datatypes ((array!14465 0))(
  ( (array!14466 (arr!6861 (Array (_ BitVec 32) (_ BitVec 64))) (size!7213 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14465)

(declare-fun arrayContainsKey!0 (array!14465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287990 (= res!149760 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287991 () Bool)

(declare-fun res!149758 () Bool)

(assert (=> b!287991 (=> (not res!149758) (not e!182348))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287991 (= res!149758 (and (= (size!7213 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7213 a!3312))))))

(declare-fun res!149755 () Bool)

(assert (=> start!28106 (=> (not res!149755) (not e!182348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28106 (= res!149755 (validMask!0 mask!3809))))

(assert (=> start!28106 e!182348))

(assert (=> start!28106 true))

(declare-fun array_inv!4824 (array!14465) Bool)

(assert (=> start!28106 (array_inv!4824 a!3312)))

(declare-fun b!287992 () Bool)

(declare-fun e!182349 () Bool)

(declare-fun e!182347 () Bool)

(assert (=> b!287992 (= e!182349 e!182347)))

(declare-fun res!149757 () Bool)

(assert (=> b!287992 (=> (not res!149757) (not e!182347))))

(declare-fun lt!141809 () Bool)

(assert (=> b!287992 (= res!149757 lt!141809)))

(declare-datatypes ((SeekEntryResult!2010 0))(
  ( (MissingZero!2010 (index!10210 (_ BitVec 32))) (Found!2010 (index!10211 (_ BitVec 32))) (Intermediate!2010 (undefined!2822 Bool) (index!10212 (_ BitVec 32)) (x!28425 (_ BitVec 32))) (Undefined!2010) (MissingVacant!2010 (index!10213 (_ BitVec 32))) )
))
(declare-fun lt!141810 () SeekEntryResult!2010)

(declare-fun lt!141811 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14465 (_ BitVec 32)) SeekEntryResult!2010)

(assert (=> b!287992 (= lt!141810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141811 k0!2524 (array!14466 (store (arr!6861 a!3312) i!1256 k0!2524) (size!7213 a!3312)) mask!3809))))

(declare-fun lt!141812 () SeekEntryResult!2010)

(assert (=> b!287992 (= lt!141812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141811 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287992 (= lt!141811 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287993 () Bool)

(declare-fun e!182350 () Bool)

(assert (=> b!287993 (= e!182347 e!182350)))

(declare-fun res!149753 () Bool)

(assert (=> b!287993 (=> (not res!149753) (not e!182350))))

(declare-fun lt!141814 () Bool)

(assert (=> b!287993 (= res!149753 (and (or lt!141814 (not (undefined!2822 lt!141812))) (or lt!141814 (not (= (select (arr!6861 a!3312) (index!10212 lt!141812)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141814 (not (= (select (arr!6861 a!3312) (index!10212 lt!141812)) k0!2524))) (not lt!141814)))))

(get-info :version)

(assert (=> b!287993 (= lt!141814 (not ((_ is Intermediate!2010) lt!141812)))))

(declare-fun b!287994 () Bool)

(declare-fun res!149756 () Bool)

(assert (=> b!287994 (=> (not res!149756) (not e!182349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14465 (_ BitVec 32)) Bool)

(assert (=> b!287994 (= res!149756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287995 () Bool)

(assert (=> b!287995 (= e!182348 e!182349)))

(declare-fun res!149754 () Bool)

(assert (=> b!287995 (=> (not res!149754) (not e!182349))))

(declare-fun lt!141813 () SeekEntryResult!2010)

(assert (=> b!287995 (= res!149754 (or lt!141809 (= lt!141813 (MissingVacant!2010 i!1256))))))

(assert (=> b!287995 (= lt!141809 (= lt!141813 (MissingZero!2010 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14465 (_ BitVec 32)) SeekEntryResult!2010)

(assert (=> b!287995 (= lt!141813 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287996 () Bool)

(assert (=> b!287996 (= e!182350 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(assert (=> b!287996 (and (= (select (arr!6861 a!3312) (index!10212 lt!141812)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10212 lt!141812) i!1256))))

(assert (= (and start!28106 res!149755) b!287991))

(assert (= (and b!287991 res!149758) b!287989))

(assert (= (and b!287989 res!149759) b!287990))

(assert (= (and b!287990 res!149760) b!287995))

(assert (= (and b!287995 res!149754) b!287994))

(assert (= (and b!287994 res!149756) b!287992))

(assert (= (and b!287992 res!149757) b!287993))

(assert (= (and b!287993 res!149753) b!287996))

(declare-fun m!302335 () Bool)

(assert (=> start!28106 m!302335))

(declare-fun m!302337 () Bool)

(assert (=> start!28106 m!302337))

(declare-fun m!302339 () Bool)

(assert (=> b!287992 m!302339))

(declare-fun m!302341 () Bool)

(assert (=> b!287992 m!302341))

(declare-fun m!302343 () Bool)

(assert (=> b!287992 m!302343))

(declare-fun m!302345 () Bool)

(assert (=> b!287992 m!302345))

(declare-fun m!302347 () Bool)

(assert (=> b!287989 m!302347))

(declare-fun m!302349 () Bool)

(assert (=> b!287995 m!302349))

(declare-fun m!302351 () Bool)

(assert (=> b!287990 m!302351))

(declare-fun m!302353 () Bool)

(assert (=> b!287993 m!302353))

(assert (=> b!287996 m!302353))

(declare-fun m!302355 () Bool)

(assert (=> b!287994 m!302355))

(check-sat (not b!287989) (not b!287995) (not start!28106) (not b!287994) (not b!287990) (not b!287992))
(check-sat)
