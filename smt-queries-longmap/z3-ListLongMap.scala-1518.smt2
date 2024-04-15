; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28634 () Bool)

(assert start!28634)

(declare-fun b!292620 () Bool)

(declare-fun e!185088 () Bool)

(assert (=> b!292620 (= e!185088 false)))

(declare-datatypes ((SeekEntryResult!2174 0))(
  ( (MissingZero!2174 (index!10866 (_ BitVec 32))) (Found!2174 (index!10867 (_ BitVec 32))) (Intermediate!2174 (undefined!2986 Bool) (index!10868 (_ BitVec 32)) (x!29068 (_ BitVec 32))) (Undefined!2174) (MissingVacant!2174 (index!10869 (_ BitVec 32))) )
))
(declare-fun lt!144880 () SeekEntryResult!2174)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14806 0))(
  ( (array!14807 (arr!7026 (Array (_ BitVec 32) (_ BitVec 64))) (size!7379 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14806)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!144879 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14806 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!292620 (= lt!144880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144879 k0!2524 (array!14807 (store (arr!7026 a!3312) i!1256 k0!2524) (size!7379 a!3312)) mask!3809))))

(declare-fun lt!144881 () SeekEntryResult!2174)

(assert (=> b!292620 (= lt!144881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144879 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292620 (= lt!144879 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292621 () Bool)

(declare-fun res!153732 () Bool)

(declare-fun e!185086 () Bool)

(assert (=> b!292621 (=> (not res!153732) (not e!185086))))

(declare-fun arrayContainsKey!0 (array!14806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292621 (= res!153732 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292622 () Bool)

(declare-fun res!153731 () Bool)

(assert (=> b!292622 (=> (not res!153731) (not e!185086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292622 (= res!153731 (validKeyInArray!0 k0!2524))))

(declare-fun b!292623 () Bool)

(declare-fun res!153729 () Bool)

(assert (=> b!292623 (=> (not res!153729) (not e!185086))))

(assert (=> b!292623 (= res!153729 (and (= (size!7379 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7379 a!3312))))))

(declare-fun b!292625 () Bool)

(declare-fun res!153728 () Bool)

(assert (=> b!292625 (=> (not res!153728) (not e!185088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14806 (_ BitVec 32)) Bool)

(assert (=> b!292625 (= res!153728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153730 () Bool)

(assert (=> start!28634 (=> (not res!153730) (not e!185086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28634 (= res!153730 (validMask!0 mask!3809))))

(assert (=> start!28634 e!185086))

(assert (=> start!28634 true))

(declare-fun array_inv!4998 (array!14806) Bool)

(assert (=> start!28634 (array_inv!4998 a!3312)))

(declare-fun b!292624 () Bool)

(assert (=> b!292624 (= e!185086 e!185088)))

(declare-fun res!153733 () Bool)

(assert (=> b!292624 (=> (not res!153733) (not e!185088))))

(declare-fun lt!144882 () SeekEntryResult!2174)

(assert (=> b!292624 (= res!153733 (or (= lt!144882 (MissingZero!2174 i!1256)) (= lt!144882 (MissingVacant!2174 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14806 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!292624 (= lt!144882 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28634 res!153730) b!292623))

(assert (= (and b!292623 res!153729) b!292622))

(assert (= (and b!292622 res!153731) b!292621))

(assert (= (and b!292621 res!153732) b!292624))

(assert (= (and b!292624 res!153733) b!292625))

(assert (= (and b!292625 res!153728) b!292620))

(declare-fun m!305945 () Bool)

(assert (=> start!28634 m!305945))

(declare-fun m!305947 () Bool)

(assert (=> start!28634 m!305947))

(declare-fun m!305949 () Bool)

(assert (=> b!292622 m!305949))

(declare-fun m!305951 () Bool)

(assert (=> b!292625 m!305951))

(declare-fun m!305953 () Bool)

(assert (=> b!292621 m!305953))

(declare-fun m!305955 () Bool)

(assert (=> b!292624 m!305955))

(declare-fun m!305957 () Bool)

(assert (=> b!292620 m!305957))

(declare-fun m!305959 () Bool)

(assert (=> b!292620 m!305959))

(declare-fun m!305961 () Bool)

(assert (=> b!292620 m!305961))

(declare-fun m!305963 () Bool)

(assert (=> b!292620 m!305963))

(check-sat (not b!292625) (not b!292622) (not b!292621) (not start!28634) (not b!292620) (not b!292624))
(check-sat)
