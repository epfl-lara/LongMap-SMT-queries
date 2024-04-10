; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28640 () Bool)

(assert start!28640)

(declare-fun b!292785 () Bool)

(declare-fun e!185197 () Bool)

(declare-fun e!185196 () Bool)

(assert (=> b!292785 (= e!185197 e!185196)))

(declare-fun res!153845 () Bool)

(assert (=> b!292785 (=> (not res!153845) (not e!185196))))

(declare-datatypes ((SeekEntryResult!2181 0))(
  ( (MissingZero!2181 (index!10894 (_ BitVec 32))) (Found!2181 (index!10895 (_ BitVec 32))) (Intermediate!2181 (undefined!2993 Bool) (index!10896 (_ BitVec 32)) (x!29076 (_ BitVec 32))) (Undefined!2181) (MissingVacant!2181 (index!10897 (_ BitVec 32))) )
))
(declare-fun lt!145072 () SeekEntryResult!2181)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292785 (= res!153845 (or (= lt!145072 (MissingZero!2181 i!1256)) (= lt!145072 (MissingVacant!2181 i!1256))))))

(declare-datatypes ((array!14819 0))(
  ( (array!14820 (arr!7032 (Array (_ BitVec 32) (_ BitVec 64))) (size!7384 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14819)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14819 (_ BitVec 32)) SeekEntryResult!2181)

(assert (=> b!292785 (= lt!145072 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292787 () Bool)

(declare-fun res!153842 () Bool)

(assert (=> b!292787 (=> (not res!153842) (not e!185197))))

(assert (=> b!292787 (= res!153842 (and (= (size!7384 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7384 a!3312))))))

(declare-fun b!292788 () Bool)

(declare-fun res!153844 () Bool)

(assert (=> b!292788 (=> (not res!153844) (not e!185197))))

(declare-fun arrayContainsKey!0 (array!14819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292788 (= res!153844 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292789 () Bool)

(declare-fun res!153843 () Bool)

(assert (=> b!292789 (=> (not res!153843) (not e!185196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14819 (_ BitVec 32)) Bool)

(assert (=> b!292789 (= res!153843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292790 () Bool)

(assert (=> b!292790 (= e!185196 false)))

(declare-fun lt!145075 () SeekEntryResult!2181)

(declare-fun lt!145074 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14819 (_ BitVec 32)) SeekEntryResult!2181)

(assert (=> b!292790 (= lt!145075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145074 k0!2524 (array!14820 (store (arr!7032 a!3312) i!1256 k0!2524) (size!7384 a!3312)) mask!3809))))

(declare-fun lt!145073 () SeekEntryResult!2181)

(assert (=> b!292790 (= lt!145073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145074 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292790 (= lt!145074 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153841 () Bool)

(assert (=> start!28640 (=> (not res!153841) (not e!185197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28640 (= res!153841 (validMask!0 mask!3809))))

(assert (=> start!28640 e!185197))

(assert (=> start!28640 true))

(declare-fun array_inv!4995 (array!14819) Bool)

(assert (=> start!28640 (array_inv!4995 a!3312)))

(declare-fun b!292786 () Bool)

(declare-fun res!153846 () Bool)

(assert (=> b!292786 (=> (not res!153846) (not e!185197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292786 (= res!153846 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28640 res!153841) b!292787))

(assert (= (and b!292787 res!153842) b!292786))

(assert (= (and b!292786 res!153846) b!292788))

(assert (= (and b!292788 res!153844) b!292785))

(assert (= (and b!292785 res!153845) b!292789))

(assert (= (and b!292789 res!153843) b!292790))

(declare-fun m!306557 () Bool)

(assert (=> b!292789 m!306557))

(declare-fun m!306559 () Bool)

(assert (=> start!28640 m!306559))

(declare-fun m!306561 () Bool)

(assert (=> start!28640 m!306561))

(declare-fun m!306563 () Bool)

(assert (=> b!292786 m!306563))

(declare-fun m!306565 () Bool)

(assert (=> b!292788 m!306565))

(declare-fun m!306567 () Bool)

(assert (=> b!292785 m!306567))

(declare-fun m!306569 () Bool)

(assert (=> b!292790 m!306569))

(declare-fun m!306571 () Bool)

(assert (=> b!292790 m!306571))

(declare-fun m!306573 () Bool)

(assert (=> b!292790 m!306573))

(declare-fun m!306575 () Bool)

(assert (=> b!292790 m!306575))

(check-sat (not b!292788) (not b!292786) (not b!292789) (not b!292785) (not start!28640) (not b!292790))
(check-sat)
