; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28388 () Bool)

(assert start!28388)

(declare-fun b!290518 () Bool)

(declare-fun res!151912 () Bool)

(declare-fun e!183829 () Bool)

(assert (=> b!290518 (=> (not res!151912) (not e!183829))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290518 (= res!151912 (validKeyInArray!0 k0!2524))))

(declare-fun b!290519 () Bool)

(declare-fun e!183827 () Bool)

(declare-fun e!183831 () Bool)

(assert (=> b!290519 (= e!183827 e!183831)))

(declare-fun res!151910 () Bool)

(assert (=> b!290519 (=> (not res!151910) (not e!183831))))

(declare-datatypes ((SeekEntryResult!2099 0))(
  ( (MissingZero!2099 (index!10566 (_ BitVec 32))) (Found!2099 (index!10567 (_ BitVec 32))) (Intermediate!2099 (undefined!2911 Bool) (index!10568 (_ BitVec 32)) (x!28781 (_ BitVec 32))) (Undefined!2099) (MissingVacant!2099 (index!10569 (_ BitVec 32))) )
))
(declare-fun lt!143431 () SeekEntryResult!2099)

(declare-datatypes ((array!14650 0))(
  ( (array!14651 (arr!6951 (Array (_ BitVec 32) (_ BitVec 64))) (size!7304 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14650)

(declare-fun lt!143433 () Bool)

(assert (=> b!290519 (= res!151910 (and (or lt!143433 (not (undefined!2911 lt!143431))) (not lt!143433) (= (select (arr!6951 a!3312) (index!10568 lt!143431)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290519 (= lt!143433 (not ((_ is Intermediate!2099) lt!143431)))))

(declare-fun b!290520 () Bool)

(declare-fun res!151911 () Bool)

(assert (=> b!290520 (=> (not res!151911) (not e!183829))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290520 (= res!151911 (and (= (size!7304 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7304 a!3312))))))

(declare-fun b!290521 () Bool)

(declare-fun e!183830 () Bool)

(assert (=> b!290521 (= e!183830 e!183827)))

(declare-fun res!151914 () Bool)

(assert (=> b!290521 (=> (not res!151914) (not e!183827))))

(declare-fun lt!143432 () SeekEntryResult!2099)

(declare-fun lt!143435 () Bool)

(assert (=> b!290521 (= res!151914 (and (not lt!143435) (= lt!143432 (MissingVacant!2099 i!1256))))))

(declare-fun lt!143436 () SeekEntryResult!2099)

(declare-fun lt!143434 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14650 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!290521 (= lt!143436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143434 k0!2524 (array!14651 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7304 a!3312)) mask!3809))))

(assert (=> b!290521 (= lt!143431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143434 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290521 (= lt!143434 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151913 () Bool)

(assert (=> start!28388 (=> (not res!151913) (not e!183829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28388 (= res!151913 (validMask!0 mask!3809))))

(assert (=> start!28388 e!183829))

(assert (=> start!28388 true))

(declare-fun array_inv!4923 (array!14650) Bool)

(assert (=> start!28388 (array_inv!4923 a!3312)))

(declare-fun b!290522 () Bool)

(declare-fun res!151909 () Bool)

(assert (=> b!290522 (=> (not res!151909) (not e!183830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14650 (_ BitVec 32)) Bool)

(assert (=> b!290522 (= res!151909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290523 () Bool)

(assert (=> b!290523 (= e!183829 e!183830)))

(declare-fun res!151915 () Bool)

(assert (=> b!290523 (=> (not res!151915) (not e!183830))))

(assert (=> b!290523 (= res!151915 (or lt!143435 (= lt!143432 (MissingVacant!2099 i!1256))))))

(assert (=> b!290523 (= lt!143435 (= lt!143432 (MissingZero!2099 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14650 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!290523 (= lt!143432 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290524 () Bool)

(declare-fun res!151908 () Bool)

(assert (=> b!290524 (=> (not res!151908) (not e!183829))))

(declare-fun arrayContainsKey!0 (array!14650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290524 (= res!151908 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290525 () Bool)

(assert (=> b!290525 (= e!183831 (not true))))

(assert (=> b!290525 (= (index!10568 lt!143431) i!1256)))

(assert (= (and start!28388 res!151913) b!290520))

(assert (= (and b!290520 res!151911) b!290518))

(assert (= (and b!290518 res!151912) b!290524))

(assert (= (and b!290524 res!151908) b!290523))

(assert (= (and b!290523 res!151915) b!290522))

(assert (= (and b!290522 res!151909) b!290521))

(assert (= (and b!290521 res!151914) b!290519))

(assert (= (and b!290519 res!151910) b!290525))

(declare-fun m!304073 () Bool)

(assert (=> b!290523 m!304073))

(declare-fun m!304075 () Bool)

(assert (=> b!290519 m!304075))

(declare-fun m!304077 () Bool)

(assert (=> b!290522 m!304077))

(declare-fun m!304079 () Bool)

(assert (=> start!28388 m!304079))

(declare-fun m!304081 () Bool)

(assert (=> start!28388 m!304081))

(declare-fun m!304083 () Bool)

(assert (=> b!290518 m!304083))

(declare-fun m!304085 () Bool)

(assert (=> b!290524 m!304085))

(declare-fun m!304087 () Bool)

(assert (=> b!290521 m!304087))

(declare-fun m!304089 () Bool)

(assert (=> b!290521 m!304089))

(declare-fun m!304091 () Bool)

(assert (=> b!290521 m!304091))

(declare-fun m!304093 () Bool)

(assert (=> b!290521 m!304093))

(check-sat (not b!290524) (not start!28388) (not b!290521) (not b!290523) (not b!290522) (not b!290518))
(check-sat)
