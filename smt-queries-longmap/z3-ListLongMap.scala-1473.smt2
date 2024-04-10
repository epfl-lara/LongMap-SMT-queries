; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28226 () Bool)

(assert start!28226)

(declare-fun b!289069 () Bool)

(declare-fun e!183019 () Bool)

(assert (=> b!289069 (= e!183019 (not true))))

(declare-datatypes ((array!14540 0))(
  ( (array!14541 (arr!6897 (Array (_ BitVec 32) (_ BitVec 64))) (size!7249 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14540)

(declare-datatypes ((SeekEntryResult!2046 0))(
  ( (MissingZero!2046 (index!10354 (_ BitVec 32))) (Found!2046 (index!10355 (_ BitVec 32))) (Intermediate!2046 (undefined!2858 Bool) (index!10356 (_ BitVec 32)) (x!28563 (_ BitVec 32))) (Undefined!2046) (MissingVacant!2046 (index!10357 (_ BitVec 32))) )
))
(declare-fun lt!142556 () SeekEntryResult!2046)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289069 (and (= (select (arr!6897 a!3312) (index!10356 lt!142556)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10356 lt!142556) i!1256))))

(declare-fun b!289070 () Bool)

(declare-fun res!150698 () Bool)

(declare-fun e!183021 () Bool)

(assert (=> b!289070 (=> (not res!150698) (not e!183021))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289070 (= res!150698 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289071 () Bool)

(declare-fun e!183022 () Bool)

(assert (=> b!289071 (= e!183022 e!183019)))

(declare-fun res!150697 () Bool)

(assert (=> b!289071 (=> (not res!150697) (not e!183019))))

(declare-fun lt!142555 () Bool)

(assert (=> b!289071 (= res!150697 (and (or lt!142555 (not (undefined!2858 lt!142556))) (or lt!142555 (not (= (select (arr!6897 a!3312) (index!10356 lt!142556)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142555 (not (= (select (arr!6897 a!3312) (index!10356 lt!142556)) k0!2524))) (not lt!142555)))))

(get-info :version)

(assert (=> b!289071 (= lt!142555 (not ((_ is Intermediate!2046) lt!142556)))))

(declare-fun b!289072 () Bool)

(declare-fun e!183023 () Bool)

(assert (=> b!289072 (= e!183023 e!183022)))

(declare-fun res!150692 () Bool)

(assert (=> b!289072 (=> (not res!150692) (not e!183022))))

(declare-fun lt!142557 () Bool)

(assert (=> b!289072 (= res!150692 lt!142557)))

(declare-fun lt!142554 () (_ BitVec 32))

(declare-fun lt!142553 () SeekEntryResult!2046)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14540 (_ BitVec 32)) SeekEntryResult!2046)

(assert (=> b!289072 (= lt!142553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142554 k0!2524 (array!14541 (store (arr!6897 a!3312) i!1256 k0!2524) (size!7249 a!3312)) mask!3809))))

(assert (=> b!289072 (= lt!142556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142554 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289072 (= lt!142554 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289073 () Bool)

(assert (=> b!289073 (= e!183021 e!183023)))

(declare-fun res!150693 () Bool)

(assert (=> b!289073 (=> (not res!150693) (not e!183023))))

(declare-fun lt!142558 () SeekEntryResult!2046)

(assert (=> b!289073 (= res!150693 (or lt!142557 (= lt!142558 (MissingVacant!2046 i!1256))))))

(assert (=> b!289073 (= lt!142557 (= lt!142558 (MissingZero!2046 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14540 (_ BitVec 32)) SeekEntryResult!2046)

(assert (=> b!289073 (= lt!142558 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289074 () Bool)

(declare-fun res!150694 () Bool)

(assert (=> b!289074 (=> (not res!150694) (not e!183023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14540 (_ BitVec 32)) Bool)

(assert (=> b!289074 (= res!150694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150695 () Bool)

(assert (=> start!28226 (=> (not res!150695) (not e!183021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28226 (= res!150695 (validMask!0 mask!3809))))

(assert (=> start!28226 e!183021))

(assert (=> start!28226 true))

(declare-fun array_inv!4860 (array!14540) Bool)

(assert (=> start!28226 (array_inv!4860 a!3312)))

(declare-fun b!289075 () Bool)

(declare-fun res!150696 () Bool)

(assert (=> b!289075 (=> (not res!150696) (not e!183021))))

(assert (=> b!289075 (= res!150696 (and (= (size!7249 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7249 a!3312))))))

(declare-fun b!289076 () Bool)

(declare-fun res!150699 () Bool)

(assert (=> b!289076 (=> (not res!150699) (not e!183021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289076 (= res!150699 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28226 res!150695) b!289075))

(assert (= (and b!289075 res!150696) b!289076))

(assert (= (and b!289076 res!150699) b!289070))

(assert (= (and b!289070 res!150698) b!289073))

(assert (= (and b!289073 res!150693) b!289074))

(assert (= (and b!289074 res!150694) b!289072))

(assert (= (and b!289072 res!150692) b!289071))

(assert (= (and b!289071 res!150697) b!289069))

(declare-fun m!303247 () Bool)

(assert (=> b!289076 m!303247))

(declare-fun m!303249 () Bool)

(assert (=> b!289072 m!303249))

(declare-fun m!303251 () Bool)

(assert (=> b!289072 m!303251))

(declare-fun m!303253 () Bool)

(assert (=> b!289072 m!303253))

(declare-fun m!303255 () Bool)

(assert (=> b!289072 m!303255))

(declare-fun m!303257 () Bool)

(assert (=> b!289070 m!303257))

(declare-fun m!303259 () Bool)

(assert (=> b!289071 m!303259))

(declare-fun m!303261 () Bool)

(assert (=> b!289073 m!303261))

(declare-fun m!303263 () Bool)

(assert (=> b!289074 m!303263))

(declare-fun m!303265 () Bool)

(assert (=> start!28226 m!303265))

(declare-fun m!303267 () Bool)

(assert (=> start!28226 m!303267))

(assert (=> b!289069 m!303259))

(check-sat (not b!289072) (not b!289074) (not start!28226) (not b!289073) (not b!289070) (not b!289076))
(check-sat)
