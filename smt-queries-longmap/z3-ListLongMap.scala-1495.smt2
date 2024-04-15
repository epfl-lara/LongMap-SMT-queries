; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28400 () Bool)

(assert start!28400)

(declare-fun b!290662 () Bool)

(declare-fun res!152055 () Bool)

(declare-fun e!183921 () Bool)

(assert (=> b!290662 (=> (not res!152055) (not e!183921))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290662 (= res!152055 (validKeyInArray!0 k0!2524))))

(declare-fun b!290663 () Bool)

(declare-fun e!183917 () Bool)

(declare-fun e!183919 () Bool)

(assert (=> b!290663 (= e!183917 e!183919)))

(declare-fun res!152058 () Bool)

(assert (=> b!290663 (=> (not res!152058) (not e!183919))))

(declare-datatypes ((SeekEntryResult!2105 0))(
  ( (MissingZero!2105 (index!10590 (_ BitVec 32))) (Found!2105 (index!10591 (_ BitVec 32))) (Intermediate!2105 (undefined!2917 Bool) (index!10592 (_ BitVec 32)) (x!28803 (_ BitVec 32))) (Undefined!2105) (MissingVacant!2105 (index!10593 (_ BitVec 32))) )
))
(declare-fun lt!143541 () SeekEntryResult!2105)

(declare-datatypes ((array!14662 0))(
  ( (array!14663 (arr!6957 (Array (_ BitVec 32) (_ BitVec 64))) (size!7310 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14662)

(declare-fun lt!143543 () Bool)

(assert (=> b!290663 (= res!152058 (and (or lt!143543 (not (undefined!2917 lt!143541))) (not lt!143543) (= (select (arr!6957 a!3312) (index!10592 lt!143541)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290663 (= lt!143543 (not ((_ is Intermediate!2105) lt!143541)))))

(declare-fun b!290664 () Bool)

(declare-fun res!152059 () Bool)

(assert (=> b!290664 (=> (not res!152059) (not e!183921))))

(declare-fun arrayContainsKey!0 (array!14662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290664 (= res!152059 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290665 () Bool)

(assert (=> b!290665 (= e!183919 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290665 (= (index!10592 lt!143541) i!1256)))

(declare-fun b!290666 () Bool)

(declare-fun e!183920 () Bool)

(assert (=> b!290666 (= e!183921 e!183920)))

(declare-fun res!152054 () Bool)

(assert (=> b!290666 (=> (not res!152054) (not e!183920))))

(declare-fun lt!143542 () SeekEntryResult!2105)

(declare-fun lt!143540 () Bool)

(assert (=> b!290666 (= res!152054 (or lt!143540 (= lt!143542 (MissingVacant!2105 i!1256))))))

(assert (=> b!290666 (= lt!143540 (= lt!143542 (MissingZero!2105 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14662 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!290666 (= lt!143542 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!152057 () Bool)

(assert (=> start!28400 (=> (not res!152057) (not e!183921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28400 (= res!152057 (validMask!0 mask!3809))))

(assert (=> start!28400 e!183921))

(assert (=> start!28400 true))

(declare-fun array_inv!4929 (array!14662) Bool)

(assert (=> start!28400 (array_inv!4929 a!3312)))

(declare-fun b!290667 () Bool)

(declare-fun res!152056 () Bool)

(assert (=> b!290667 (=> (not res!152056) (not e!183920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14662 (_ BitVec 32)) Bool)

(assert (=> b!290667 (= res!152056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290668 () Bool)

(declare-fun res!152053 () Bool)

(assert (=> b!290668 (=> (not res!152053) (not e!183921))))

(assert (=> b!290668 (= res!152053 (and (= (size!7310 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7310 a!3312))))))

(declare-fun b!290669 () Bool)

(assert (=> b!290669 (= e!183920 e!183917)))

(declare-fun res!152052 () Bool)

(assert (=> b!290669 (=> (not res!152052) (not e!183917))))

(assert (=> b!290669 (= res!152052 (and (not lt!143540) (= lt!143542 (MissingVacant!2105 i!1256))))))

(declare-fun lt!143539 () (_ BitVec 32))

(declare-fun lt!143544 () SeekEntryResult!2105)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14662 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!290669 (= lt!143544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143539 k0!2524 (array!14663 (store (arr!6957 a!3312) i!1256 k0!2524) (size!7310 a!3312)) mask!3809))))

(assert (=> b!290669 (= lt!143541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143539 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290669 (= lt!143539 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28400 res!152057) b!290668))

(assert (= (and b!290668 res!152053) b!290662))

(assert (= (and b!290662 res!152055) b!290664))

(assert (= (and b!290664 res!152059) b!290666))

(assert (= (and b!290666 res!152054) b!290667))

(assert (= (and b!290667 res!152056) b!290669))

(assert (= (and b!290669 res!152052) b!290663))

(assert (= (and b!290663 res!152058) b!290665))

(declare-fun m!304205 () Bool)

(assert (=> b!290666 m!304205))

(declare-fun m!304207 () Bool)

(assert (=> b!290664 m!304207))

(declare-fun m!304209 () Bool)

(assert (=> b!290667 m!304209))

(declare-fun m!304211 () Bool)

(assert (=> b!290662 m!304211))

(declare-fun m!304213 () Bool)

(assert (=> start!28400 m!304213))

(declare-fun m!304215 () Bool)

(assert (=> start!28400 m!304215))

(declare-fun m!304217 () Bool)

(assert (=> b!290669 m!304217))

(declare-fun m!304219 () Bool)

(assert (=> b!290669 m!304219))

(declare-fun m!304221 () Bool)

(assert (=> b!290669 m!304221))

(declare-fun m!304223 () Bool)

(assert (=> b!290669 m!304223))

(declare-fun m!304225 () Bool)

(assert (=> b!290663 m!304225))

(check-sat (not b!290667) (not b!290669) (not b!290664) (not start!28400) (not b!290666) (not b!290662))
(check-sat)
