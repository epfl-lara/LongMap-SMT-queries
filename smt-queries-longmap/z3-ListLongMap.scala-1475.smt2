; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28238 () Bool)

(assert start!28238)

(declare-fun b!289213 () Bool)

(declare-fun res!150839 () Bool)

(declare-fun e!183112 () Bool)

(assert (=> b!289213 (=> (not res!150839) (not e!183112))))

(declare-datatypes ((array!14552 0))(
  ( (array!14553 (arr!6903 (Array (_ BitVec 32) (_ BitVec 64))) (size!7255 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14552)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289213 (= res!150839 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289214 () Bool)

(declare-fun res!150841 () Bool)

(assert (=> b!289214 (=> (not res!150841) (not e!183112))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289214 (= res!150841 (and (= (size!7255 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7255 a!3312))))))

(declare-fun b!289215 () Bool)

(declare-fun e!183111 () Bool)

(declare-fun e!183109 () Bool)

(assert (=> b!289215 (= e!183111 e!183109)))

(declare-fun res!150840 () Bool)

(assert (=> b!289215 (=> (not res!150840) (not e!183109))))

(declare-datatypes ((SeekEntryResult!2052 0))(
  ( (MissingZero!2052 (index!10378 (_ BitVec 32))) (Found!2052 (index!10379 (_ BitVec 32))) (Intermediate!2052 (undefined!2864 Bool) (index!10380 (_ BitVec 32)) (x!28585 (_ BitVec 32))) (Undefined!2052) (MissingVacant!2052 (index!10381 (_ BitVec 32))) )
))
(declare-fun lt!142665 () SeekEntryResult!2052)

(declare-fun lt!142664 () Bool)

(assert (=> b!289215 (= res!150840 (and (or lt!142664 (not (undefined!2864 lt!142665))) (or lt!142664 (not (= (select (arr!6903 a!3312) (index!10380 lt!142665)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142664 (not (= (select (arr!6903 a!3312) (index!10380 lt!142665)) k0!2524))) (not lt!142664)))))

(get-info :version)

(assert (=> b!289215 (= lt!142664 (not ((_ is Intermediate!2052) lt!142665)))))

(declare-fun b!289216 () Bool)

(declare-fun e!183110 () Bool)

(assert (=> b!289216 (= e!183112 e!183110)))

(declare-fun res!150836 () Bool)

(assert (=> b!289216 (=> (not res!150836) (not e!183110))))

(declare-fun lt!142663 () SeekEntryResult!2052)

(declare-fun lt!142661 () Bool)

(assert (=> b!289216 (= res!150836 (or lt!142661 (= lt!142663 (MissingVacant!2052 i!1256))))))

(assert (=> b!289216 (= lt!142661 (= lt!142663 (MissingZero!2052 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14552 (_ BitVec 32)) SeekEntryResult!2052)

(assert (=> b!289216 (= lt!142663 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!150838 () Bool)

(assert (=> start!28238 (=> (not res!150838) (not e!183112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28238 (= res!150838 (validMask!0 mask!3809))))

(assert (=> start!28238 e!183112))

(assert (=> start!28238 true))

(declare-fun array_inv!4866 (array!14552) Bool)

(assert (=> start!28238 (array_inv!4866 a!3312)))

(declare-fun b!289217 () Bool)

(assert (=> b!289217 (= e!183110 e!183111)))

(declare-fun res!150843 () Bool)

(assert (=> b!289217 (=> (not res!150843) (not e!183111))))

(assert (=> b!289217 (= res!150843 lt!142661)))

(declare-fun lt!142662 () (_ BitVec 32))

(declare-fun lt!142666 () SeekEntryResult!2052)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14552 (_ BitVec 32)) SeekEntryResult!2052)

(assert (=> b!289217 (= lt!142666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142662 k0!2524 (array!14553 (store (arr!6903 a!3312) i!1256 k0!2524) (size!7255 a!3312)) mask!3809))))

(assert (=> b!289217 (= lt!142665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142662 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289217 (= lt!142662 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289218 () Bool)

(declare-fun res!150837 () Bool)

(assert (=> b!289218 (=> (not res!150837) (not e!183110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14552 (_ BitVec 32)) Bool)

(assert (=> b!289218 (= res!150837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289219 () Bool)

(assert (=> b!289219 (= e!183109 (not true))))

(assert (=> b!289219 (and (= (select (arr!6903 a!3312) (index!10380 lt!142665)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10380 lt!142665) i!1256))))

(declare-fun b!289220 () Bool)

(declare-fun res!150842 () Bool)

(assert (=> b!289220 (=> (not res!150842) (not e!183112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289220 (= res!150842 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28238 res!150838) b!289214))

(assert (= (and b!289214 res!150841) b!289220))

(assert (= (and b!289220 res!150842) b!289213))

(assert (= (and b!289213 res!150839) b!289216))

(assert (= (and b!289216 res!150836) b!289218))

(assert (= (and b!289218 res!150837) b!289217))

(assert (= (and b!289217 res!150843) b!289215))

(assert (= (and b!289215 res!150840) b!289219))

(declare-fun m!303379 () Bool)

(assert (=> b!289219 m!303379))

(declare-fun m!303381 () Bool)

(assert (=> b!289217 m!303381))

(declare-fun m!303383 () Bool)

(assert (=> b!289217 m!303383))

(declare-fun m!303385 () Bool)

(assert (=> b!289217 m!303385))

(declare-fun m!303387 () Bool)

(assert (=> b!289217 m!303387))

(declare-fun m!303389 () Bool)

(assert (=> start!28238 m!303389))

(declare-fun m!303391 () Bool)

(assert (=> start!28238 m!303391))

(assert (=> b!289215 m!303379))

(declare-fun m!303393 () Bool)

(assert (=> b!289220 m!303393))

(declare-fun m!303395 () Bool)

(assert (=> b!289216 m!303395))

(declare-fun m!303397 () Bool)

(assert (=> b!289218 m!303397))

(declare-fun m!303399 () Bool)

(assert (=> b!289213 m!303399))

(check-sat (not b!289220) (not b!289218) (not b!289213) (not b!289217) (not b!289216) (not start!28238))
(check-sat)
