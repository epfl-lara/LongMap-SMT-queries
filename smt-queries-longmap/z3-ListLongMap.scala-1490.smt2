; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28322 () Bool)

(assert start!28322)

(declare-fun b!290086 () Bool)

(declare-fun res!151619 () Bool)

(declare-fun e!183561 () Bool)

(assert (=> b!290086 (=> (not res!151619) (not e!183561))))

(declare-datatypes ((array!14629 0))(
  ( (array!14630 (arr!6942 (Array (_ BitVec 32) (_ BitVec 64))) (size!7295 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14629)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14629 (_ BitVec 32)) Bool)

(assert (=> b!290086 (= res!151619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290087 () Bool)

(declare-fun res!151624 () Bool)

(declare-fun e!183560 () Bool)

(assert (=> b!290087 (=> (not res!151624) (not e!183560))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290087 (= res!151624 (validKeyInArray!0 k0!2524))))

(declare-fun b!290088 () Bool)

(assert (=> b!290088 (= e!183560 e!183561)))

(declare-fun res!151623 () Bool)

(assert (=> b!290088 (=> (not res!151623) (not e!183561))))

(declare-fun lt!143174 () Bool)

(declare-datatypes ((SeekEntryResult!2090 0))(
  ( (MissingZero!2090 (index!10530 (_ BitVec 32))) (Found!2090 (index!10531 (_ BitVec 32))) (Intermediate!2090 (undefined!2902 Bool) (index!10532 (_ BitVec 32)) (x!28742 (_ BitVec 32))) (Undefined!2090) (MissingVacant!2090 (index!10533 (_ BitVec 32))) )
))
(declare-fun lt!143175 () SeekEntryResult!2090)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290088 (= res!151623 (or lt!143174 (= lt!143175 (MissingVacant!2090 i!1256))))))

(assert (=> b!290088 (= lt!143174 (= lt!143175 (MissingZero!2090 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14629 (_ BitVec 32)) SeekEntryResult!2090)

(assert (=> b!290088 (= lt!143175 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290089 () Bool)

(declare-fun e!183564 () Bool)

(assert (=> b!290089 (= e!183561 e!183564)))

(declare-fun res!151617 () Bool)

(assert (=> b!290089 (=> (not res!151617) (not e!183564))))

(assert (=> b!290089 (= res!151617 (and (not lt!143174) (= lt!143175 (MissingVacant!2090 i!1256))))))

(declare-fun lt!143178 () SeekEntryResult!2090)

(declare-fun lt!143176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14629 (_ BitVec 32)) SeekEntryResult!2090)

(assert (=> b!290089 (= lt!143178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143176 k0!2524 (array!14630 (store (arr!6942 a!3312) i!1256 k0!2524) (size!7295 a!3312)) mask!3809))))

(declare-fun lt!143173 () SeekEntryResult!2090)

(assert (=> b!290089 (= lt!143173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143176 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290089 (= lt!143176 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151621 () Bool)

(assert (=> start!28322 (=> (not res!151621) (not e!183560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28322 (= res!151621 (validMask!0 mask!3809))))

(assert (=> start!28322 e!183560))

(assert (=> start!28322 true))

(declare-fun array_inv!4914 (array!14629) Bool)

(assert (=> start!28322 (array_inv!4914 a!3312)))

(declare-fun b!290090 () Bool)

(declare-fun res!151618 () Bool)

(assert (=> b!290090 (=> (not res!151618) (not e!183560))))

(declare-fun arrayContainsKey!0 (array!14629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290090 (= res!151618 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290091 () Bool)

(declare-fun res!151622 () Bool)

(assert (=> b!290091 (=> (not res!151622) (not e!183560))))

(assert (=> b!290091 (= res!151622 (and (= (size!7295 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7295 a!3312))))))

(declare-fun b!290092 () Bool)

(declare-fun e!183562 () Bool)

(assert (=> b!290092 (= e!183562 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(assert (=> b!290092 (= (index!10532 lt!143173) i!1256)))

(declare-fun b!290093 () Bool)

(assert (=> b!290093 (= e!183564 e!183562)))

(declare-fun res!151620 () Bool)

(assert (=> b!290093 (=> (not res!151620) (not e!183562))))

(declare-fun lt!143177 () Bool)

(assert (=> b!290093 (= res!151620 (and (or lt!143177 (not (undefined!2902 lt!143173))) (not lt!143177) (= (select (arr!6942 a!3312) (index!10532 lt!143173)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290093 (= lt!143177 (not ((_ is Intermediate!2090) lt!143173)))))

(assert (= (and start!28322 res!151621) b!290091))

(assert (= (and b!290091 res!151622) b!290087))

(assert (= (and b!290087 res!151624) b!290090))

(assert (= (and b!290090 res!151618) b!290088))

(assert (= (and b!290088 res!151623) b!290086))

(assert (= (and b!290086 res!151619) b!290089))

(assert (= (and b!290089 res!151617) b!290093))

(assert (= (and b!290093 res!151620) b!290092))

(declare-fun m!303755 () Bool)

(assert (=> b!290090 m!303755))

(declare-fun m!303757 () Bool)

(assert (=> b!290088 m!303757))

(declare-fun m!303759 () Bool)

(assert (=> start!28322 m!303759))

(declare-fun m!303761 () Bool)

(assert (=> start!28322 m!303761))

(declare-fun m!303763 () Bool)

(assert (=> b!290087 m!303763))

(declare-fun m!303765 () Bool)

(assert (=> b!290089 m!303765))

(declare-fun m!303767 () Bool)

(assert (=> b!290089 m!303767))

(declare-fun m!303769 () Bool)

(assert (=> b!290089 m!303769))

(declare-fun m!303771 () Bool)

(assert (=> b!290089 m!303771))

(declare-fun m!303773 () Bool)

(assert (=> b!290093 m!303773))

(declare-fun m!303775 () Bool)

(assert (=> b!290086 m!303775))

(check-sat (not b!290090) (not b!290089) (not b!290088) (not start!28322) (not b!290087) (not b!290086))
(check-sat)
