; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28228 () Bool)

(assert start!28228)

(declare-fun b!289236 () Bool)

(declare-fun res!150836 () Bool)

(declare-fun e!183119 () Bool)

(assert (=> b!289236 (=> (not res!150836) (not e!183119))))

(declare-datatypes ((array!14547 0))(
  ( (array!14548 (arr!6901 (Array (_ BitVec 32) (_ BitVec 64))) (size!7253 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14547)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289236 (= res!150836 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289237 () Bool)

(declare-fun res!150835 () Bool)

(assert (=> b!289237 (=> (not res!150835) (not e!183119))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289237 (= res!150835 (and (= (size!7253 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7253 a!3312))))))

(declare-fun res!150833 () Bool)

(assert (=> start!28228 (=> (not res!150833) (not e!183119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28228 (= res!150833 (validMask!0 mask!3809))))

(assert (=> start!28228 e!183119))

(assert (=> start!28228 true))

(declare-fun array_inv!4851 (array!14547) Bool)

(assert (=> start!28228 (array_inv!4851 a!3312)))

(declare-fun b!289238 () Bool)

(declare-fun res!150839 () Bool)

(declare-fun e!183122 () Bool)

(assert (=> b!289238 (=> (not res!150839) (not e!183122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14547 (_ BitVec 32)) Bool)

(assert (=> b!289238 (= res!150839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289239 () Bool)

(declare-fun e!183120 () Bool)

(assert (=> b!289239 (= e!183122 e!183120)))

(declare-fun res!150840 () Bool)

(assert (=> b!289239 (=> (not res!150840) (not e!183120))))

(declare-fun lt!142702 () Bool)

(assert (=> b!289239 (= res!150840 lt!142702)))

(declare-datatypes ((SeekEntryResult!2015 0))(
  ( (MissingZero!2015 (index!10230 (_ BitVec 32))) (Found!2015 (index!10231 (_ BitVec 32))) (Intermediate!2015 (undefined!2827 Bool) (index!10232 (_ BitVec 32)) (x!28548 (_ BitVec 32))) (Undefined!2015) (MissingVacant!2015 (index!10233 (_ BitVec 32))) )
))
(declare-fun lt!142703 () SeekEntryResult!2015)

(declare-fun lt!142704 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14547 (_ BitVec 32)) SeekEntryResult!2015)

(assert (=> b!289239 (= lt!142703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142704 k0!2524 (array!14548 (store (arr!6901 a!3312) i!1256 k0!2524) (size!7253 a!3312)) mask!3809))))

(declare-fun lt!142707 () SeekEntryResult!2015)

(assert (=> b!289239 (= lt!142707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142704 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289239 (= lt!142704 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289240 () Bool)

(declare-fun e!183118 () Bool)

(assert (=> b!289240 (= e!183120 e!183118)))

(declare-fun res!150834 () Bool)

(assert (=> b!289240 (=> (not res!150834) (not e!183118))))

(declare-fun lt!142705 () Bool)

(assert (=> b!289240 (= res!150834 (and (or lt!142705 (not (undefined!2827 lt!142707))) (or lt!142705 (not (= (select (arr!6901 a!3312) (index!10232 lt!142707)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142705 (not (= (select (arr!6901 a!3312) (index!10232 lt!142707)) k0!2524))) (not lt!142705)))))

(get-info :version)

(assert (=> b!289240 (= lt!142705 (not ((_ is Intermediate!2015) lt!142707)))))

(declare-fun b!289241 () Bool)

(assert (=> b!289241 (= e!183119 e!183122)))

(declare-fun res!150838 () Bool)

(assert (=> b!289241 (=> (not res!150838) (not e!183122))))

(declare-fun lt!142706 () SeekEntryResult!2015)

(assert (=> b!289241 (= res!150838 (or lt!142702 (= lt!142706 (MissingVacant!2015 i!1256))))))

(assert (=> b!289241 (= lt!142702 (= lt!142706 (MissingZero!2015 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14547 (_ BitVec 32)) SeekEntryResult!2015)

(assert (=> b!289241 (= lt!142706 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289242 () Bool)

(declare-fun res!150837 () Bool)

(assert (=> b!289242 (=> (not res!150837) (not e!183119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289242 (= res!150837 (validKeyInArray!0 k0!2524))))

(declare-fun b!289243 () Bool)

(assert (=> b!289243 (= e!183118 (not true))))

(assert (=> b!289243 (and (= (select (arr!6901 a!3312) (index!10232 lt!142707)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10232 lt!142707) i!1256))))

(assert (= (and start!28228 res!150833) b!289237))

(assert (= (and b!289237 res!150835) b!289242))

(assert (= (and b!289242 res!150837) b!289236))

(assert (= (and b!289236 res!150836) b!289241))

(assert (= (and b!289241 res!150838) b!289238))

(assert (= (and b!289238 res!150839) b!289239))

(assert (= (and b!289239 res!150840) b!289240))

(assert (= (and b!289240 res!150834) b!289243))

(declare-fun m!303563 () Bool)

(assert (=> b!289236 m!303563))

(declare-fun m!303565 () Bool)

(assert (=> b!289238 m!303565))

(declare-fun m!303567 () Bool)

(assert (=> b!289241 m!303567))

(declare-fun m!303569 () Bool)

(assert (=> b!289239 m!303569))

(declare-fun m!303571 () Bool)

(assert (=> b!289239 m!303571))

(declare-fun m!303573 () Bool)

(assert (=> b!289239 m!303573))

(declare-fun m!303575 () Bool)

(assert (=> b!289239 m!303575))

(declare-fun m!303577 () Bool)

(assert (=> b!289243 m!303577))

(declare-fun m!303579 () Bool)

(assert (=> b!289242 m!303579))

(assert (=> b!289240 m!303577))

(declare-fun m!303581 () Bool)

(assert (=> start!28228 m!303581))

(declare-fun m!303583 () Bool)

(assert (=> start!28228 m!303583))

(check-sat (not b!289239) (not start!28228) (not b!289236) (not b!289242) (not b!289241) (not b!289238))
(check-sat)
