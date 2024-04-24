; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28390 () Bool)

(assert start!28390)

(declare-fun res!152097 () Bool)

(declare-fun e!183999 () Bool)

(assert (=> start!28390 (=> (not res!152097) (not e!183999))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28390 (= res!152097 (validMask!0 mask!3809))))

(assert (=> start!28390 e!183999))

(assert (=> start!28390 true))

(declare-datatypes ((array!14664 0))(
  ( (array!14665 (arr!6958 (Array (_ BitVec 32) (_ BitVec 64))) (size!7310 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14664)

(declare-fun array_inv!4908 (array!14664) Bool)

(assert (=> start!28390 (array_inv!4908 a!3312)))

(declare-fun b!290784 () Bool)

(declare-fun e!184001 () Bool)

(declare-fun e!183997 () Bool)

(assert (=> b!290784 (= e!184001 e!183997)))

(declare-fun res!152102 () Bool)

(assert (=> b!290784 (=> (not res!152102) (not e!183997))))

(declare-fun lt!143728 () Bool)

(declare-datatypes ((SeekEntryResult!2072 0))(
  ( (MissingZero!2072 (index!10458 (_ BitVec 32))) (Found!2072 (index!10459 (_ BitVec 32))) (Intermediate!2072 (undefined!2884 Bool) (index!10460 (_ BitVec 32)) (x!28763 (_ BitVec 32))) (Undefined!2072) (MissingVacant!2072 (index!10461 (_ BitVec 32))) )
))
(declare-fun lt!143726 () SeekEntryResult!2072)

(assert (=> b!290784 (= res!152102 (and (or lt!143728 (not (undefined!2884 lt!143726))) (not lt!143728) (= (select (arr!6958 a!3312) (index!10460 lt!143726)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290784 (= lt!143728 (not ((_ is Intermediate!2072) lt!143726)))))

(declare-fun b!290785 () Bool)

(declare-fun res!152101 () Bool)

(assert (=> b!290785 (=> (not res!152101) (not e!183999))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290785 (= res!152101 (and (= (size!7310 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7310 a!3312))))))

(declare-fun b!290786 () Bool)

(declare-fun e!183998 () Bool)

(assert (=> b!290786 (= e!183998 e!184001)))

(declare-fun res!152103 () Bool)

(assert (=> b!290786 (=> (not res!152103) (not e!184001))))

(declare-fun lt!143727 () Bool)

(declare-fun lt!143725 () SeekEntryResult!2072)

(assert (=> b!290786 (= res!152103 (and (not lt!143727) (= lt!143725 (MissingVacant!2072 i!1256))))))

(declare-fun lt!143730 () (_ BitVec 32))

(declare-fun lt!143729 () SeekEntryResult!2072)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14664 (_ BitVec 32)) SeekEntryResult!2072)

(assert (=> b!290786 (= lt!143729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143730 k0!2524 (array!14665 (store (arr!6958 a!3312) i!1256 k0!2524) (size!7310 a!3312)) mask!3809))))

(assert (=> b!290786 (= lt!143726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143730 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290786 (= lt!143730 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290787 () Bool)

(assert (=> b!290787 (= e!183999 e!183998)))

(declare-fun res!152098 () Bool)

(assert (=> b!290787 (=> (not res!152098) (not e!183998))))

(assert (=> b!290787 (= res!152098 (or lt!143727 (= lt!143725 (MissingVacant!2072 i!1256))))))

(assert (=> b!290787 (= lt!143727 (= lt!143725 (MissingZero!2072 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14664 (_ BitVec 32)) SeekEntryResult!2072)

(assert (=> b!290787 (= lt!143725 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290788 () Bool)

(declare-fun res!152100 () Bool)

(assert (=> b!290788 (=> (not res!152100) (not e!183999))))

(declare-fun arrayContainsKey!0 (array!14664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290788 (= res!152100 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290789 () Bool)

(assert (=> b!290789 (= e!183997 (not true))))

(assert (=> b!290789 (= (index!10460 lt!143726) i!1256)))

(declare-fun b!290790 () Bool)

(declare-fun res!152099 () Bool)

(assert (=> b!290790 (=> (not res!152099) (not e!183999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290790 (= res!152099 (validKeyInArray!0 k0!2524))))

(declare-fun b!290791 () Bool)

(declare-fun res!152096 () Bool)

(assert (=> b!290791 (=> (not res!152096) (not e!183998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14664 (_ BitVec 32)) Bool)

(assert (=> b!290791 (= res!152096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28390 res!152097) b!290785))

(assert (= (and b!290785 res!152101) b!290790))

(assert (= (and b!290790 res!152099) b!290788))

(assert (= (and b!290788 res!152100) b!290787))

(assert (= (and b!290787 res!152098) b!290791))

(assert (= (and b!290791 res!152096) b!290786))

(assert (= (and b!290786 res!152103) b!290784))

(assert (= (and b!290784 res!152102) b!290789))

(declare-fun m!304937 () Bool)

(assert (=> b!290787 m!304937))

(declare-fun m!304939 () Bool)

(assert (=> b!290786 m!304939))

(declare-fun m!304941 () Bool)

(assert (=> b!290786 m!304941))

(declare-fun m!304943 () Bool)

(assert (=> b!290786 m!304943))

(declare-fun m!304945 () Bool)

(assert (=> b!290786 m!304945))

(declare-fun m!304947 () Bool)

(assert (=> b!290791 m!304947))

(declare-fun m!304949 () Bool)

(assert (=> start!28390 m!304949))

(declare-fun m!304951 () Bool)

(assert (=> start!28390 m!304951))

(declare-fun m!304953 () Bool)

(assert (=> b!290788 m!304953))

(declare-fun m!304955 () Bool)

(assert (=> b!290790 m!304955))

(declare-fun m!304957 () Bool)

(assert (=> b!290784 m!304957))

(check-sat (not b!290790) (not b!290788) (not b!290791) (not b!290787) (not start!28390) (not b!290786))
(check-sat)
