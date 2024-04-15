; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28238 () Bool)

(assert start!28238)

(declare-fun b!289114 () Bool)

(declare-fun res!150793 () Bool)

(declare-fun e!183038 () Bool)

(assert (=> b!289114 (=> (not res!150793) (not e!183038))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14545 0))(
  ( (array!14546 (arr!6900 (Array (_ BitVec 32) (_ BitVec 64))) (size!7253 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14545)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289114 (= res!150793 (and (= (size!7253 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7253 a!3312))))))

(declare-fun res!150791 () Bool)

(assert (=> start!28238 (=> (not res!150791) (not e!183038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28238 (= res!150791 (validMask!0 mask!3809))))

(assert (=> start!28238 e!183038))

(assert (=> start!28238 true))

(declare-fun array_inv!4872 (array!14545) Bool)

(assert (=> start!28238 (array_inv!4872 a!3312)))

(declare-fun b!289115 () Bool)

(declare-fun res!150790 () Bool)

(assert (=> b!289115 (=> (not res!150790) (not e!183038))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289115 (= res!150790 (validKeyInArray!0 k0!2524))))

(declare-fun b!289116 () Bool)

(declare-fun e!183040 () Bool)

(declare-fun e!183039 () Bool)

(assert (=> b!289116 (= e!183040 e!183039)))

(declare-fun res!150796 () Bool)

(assert (=> b!289116 (=> (not res!150796) (not e!183039))))

(declare-datatypes ((SeekEntryResult!2048 0))(
  ( (MissingZero!2048 (index!10362 (_ BitVec 32))) (Found!2048 (index!10363 (_ BitVec 32))) (Intermediate!2048 (undefined!2860 Bool) (index!10364 (_ BitVec 32)) (x!28588 (_ BitVec 32))) (Undefined!2048) (MissingVacant!2048 (index!10365 (_ BitVec 32))) )
))
(declare-fun lt!142516 () SeekEntryResult!2048)

(declare-fun lt!142518 () Bool)

(assert (=> b!289116 (= res!150796 (and (or lt!142518 (not (undefined!2860 lt!142516))) (or lt!142518 (not (= (select (arr!6900 a!3312) (index!10364 lt!142516)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142518 (not (= (select (arr!6900 a!3312) (index!10364 lt!142516)) k0!2524))) (not lt!142518)))))

(get-info :version)

(assert (=> b!289116 (= lt!142518 (not ((_ is Intermediate!2048) lt!142516)))))

(declare-fun b!289117 () Bool)

(declare-fun res!150789 () Bool)

(assert (=> b!289117 (=> (not res!150789) (not e!183038))))

(declare-fun arrayContainsKey!0 (array!14545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289117 (= res!150789 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289118 () Bool)

(declare-fun e!183042 () Bool)

(assert (=> b!289118 (= e!183042 e!183040)))

(declare-fun res!150794 () Bool)

(assert (=> b!289118 (=> (not res!150794) (not e!183040))))

(declare-fun lt!142521 () Bool)

(assert (=> b!289118 (= res!150794 lt!142521)))

(declare-fun lt!142519 () (_ BitVec 32))

(declare-fun lt!142520 () SeekEntryResult!2048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14545 (_ BitVec 32)) SeekEntryResult!2048)

(assert (=> b!289118 (= lt!142520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142519 k0!2524 (array!14546 (store (arr!6900 a!3312) i!1256 k0!2524) (size!7253 a!3312)) mask!3809))))

(assert (=> b!289118 (= lt!142516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142519 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289118 (= lt!142519 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289119 () Bool)

(assert (=> b!289119 (= e!183038 e!183042)))

(declare-fun res!150795 () Bool)

(assert (=> b!289119 (=> (not res!150795) (not e!183042))))

(declare-fun lt!142517 () SeekEntryResult!2048)

(assert (=> b!289119 (= res!150795 (or lt!142521 (= lt!142517 (MissingVacant!2048 i!1256))))))

(assert (=> b!289119 (= lt!142521 (= lt!142517 (MissingZero!2048 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14545 (_ BitVec 32)) SeekEntryResult!2048)

(assert (=> b!289119 (= lt!142517 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289120 () Bool)

(assert (=> b!289120 (= e!183039 (not true))))

(assert (=> b!289120 (and (= (select (arr!6900 a!3312) (index!10364 lt!142516)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10364 lt!142516) i!1256))))

(declare-fun b!289121 () Bool)

(declare-fun res!150792 () Bool)

(assert (=> b!289121 (=> (not res!150792) (not e!183042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14545 (_ BitVec 32)) Bool)

(assert (=> b!289121 (= res!150792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28238 res!150791) b!289114))

(assert (= (and b!289114 res!150793) b!289115))

(assert (= (and b!289115 res!150790) b!289117))

(assert (= (and b!289117 res!150789) b!289119))

(assert (= (and b!289119 res!150795) b!289121))

(assert (= (and b!289121 res!150792) b!289118))

(assert (= (and b!289118 res!150794) b!289116))

(assert (= (and b!289116 res!150796) b!289120))

(declare-fun m!302831 () Bool)

(assert (=> b!289117 m!302831))

(declare-fun m!302833 () Bool)

(assert (=> b!289118 m!302833))

(declare-fun m!302835 () Bool)

(assert (=> b!289118 m!302835))

(declare-fun m!302837 () Bool)

(assert (=> b!289118 m!302837))

(declare-fun m!302839 () Bool)

(assert (=> b!289118 m!302839))

(declare-fun m!302841 () Bool)

(assert (=> b!289119 m!302841))

(declare-fun m!302843 () Bool)

(assert (=> b!289116 m!302843))

(declare-fun m!302845 () Bool)

(assert (=> b!289115 m!302845))

(declare-fun m!302847 () Bool)

(assert (=> start!28238 m!302847))

(declare-fun m!302849 () Bool)

(assert (=> start!28238 m!302849))

(assert (=> b!289120 m!302843))

(declare-fun m!302851 () Bool)

(assert (=> b!289121 m!302851))

(check-sat (not b!289117) (not start!28238) (not b!289121) (not b!289119) (not b!289118) (not b!289115))
(check-sat)
