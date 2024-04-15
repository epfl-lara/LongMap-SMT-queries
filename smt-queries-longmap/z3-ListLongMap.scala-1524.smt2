; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28670 () Bool)

(assert start!28670)

(declare-fun res!154056 () Bool)

(declare-fun e!185248 () Bool)

(assert (=> start!28670 (=> (not res!154056) (not e!185248))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28670 (= res!154056 (validMask!0 mask!3809))))

(assert (=> start!28670 e!185248))

(assert (=> start!28670 true))

(declare-datatypes ((array!14842 0))(
  ( (array!14843 (arr!7044 (Array (_ BitVec 32) (_ BitVec 64))) (size!7397 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14842)

(declare-fun array_inv!5016 (array!14842) Bool)

(assert (=> start!28670 (array_inv!5016 a!3312)))

(declare-fun b!292944 () Bool)

(declare-fun res!154055 () Bool)

(assert (=> b!292944 (=> (not res!154055) (not e!185248))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292944 (= res!154055 (validKeyInArray!0 k0!2524))))

(declare-fun b!292945 () Bool)

(declare-fun e!185249 () Bool)

(assert (=> b!292945 (= e!185249 false)))

(declare-datatypes ((SeekEntryResult!2192 0))(
  ( (MissingZero!2192 (index!10938 (_ BitVec 32))) (Found!2192 (index!10939 (_ BitVec 32))) (Intermediate!2192 (undefined!3004 Bool) (index!10940 (_ BitVec 32)) (x!29134 (_ BitVec 32))) (Undefined!2192) (MissingVacant!2192 (index!10941 (_ BitVec 32))) )
))
(declare-fun lt!145091 () SeekEntryResult!2192)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14842 (_ BitVec 32)) SeekEntryResult!2192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292945 (= lt!145091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!292946 () Bool)

(declare-fun res!154053 () Bool)

(assert (=> b!292946 (=> (not res!154053) (not e!185248))))

(declare-fun arrayContainsKey!0 (array!14842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292946 (= res!154053 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292947 () Bool)

(declare-fun res!154057 () Bool)

(assert (=> b!292947 (=> (not res!154057) (not e!185248))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292947 (= res!154057 (and (= (size!7397 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7397 a!3312))))))

(declare-fun b!292948 () Bool)

(declare-fun res!154052 () Bool)

(assert (=> b!292948 (=> (not res!154052) (not e!185249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14842 (_ BitVec 32)) Bool)

(assert (=> b!292948 (= res!154052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292949 () Bool)

(assert (=> b!292949 (= e!185248 e!185249)))

(declare-fun res!154054 () Bool)

(assert (=> b!292949 (=> (not res!154054) (not e!185249))))

(declare-fun lt!145092 () SeekEntryResult!2192)

(assert (=> b!292949 (= res!154054 (or (= lt!145092 (MissingZero!2192 i!1256)) (= lt!145092 (MissingVacant!2192 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14842 (_ BitVec 32)) SeekEntryResult!2192)

(assert (=> b!292949 (= lt!145092 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28670 res!154056) b!292947))

(assert (= (and b!292947 res!154057) b!292944))

(assert (= (and b!292944 res!154055) b!292946))

(assert (= (and b!292946 res!154053) b!292949))

(assert (= (and b!292949 res!154054) b!292948))

(assert (= (and b!292948 res!154052) b!292945))

(declare-fun m!306305 () Bool)

(assert (=> b!292944 m!306305))

(declare-fun m!306307 () Bool)

(assert (=> b!292948 m!306307))

(declare-fun m!306309 () Bool)

(assert (=> b!292949 m!306309))

(declare-fun m!306311 () Bool)

(assert (=> b!292945 m!306311))

(assert (=> b!292945 m!306311))

(declare-fun m!306313 () Bool)

(assert (=> b!292945 m!306313))

(declare-fun m!306315 () Bool)

(assert (=> b!292946 m!306315))

(declare-fun m!306317 () Bool)

(assert (=> start!28670 m!306317))

(declare-fun m!306319 () Bool)

(assert (=> start!28670 m!306319))

(check-sat (not b!292945) (not b!292946) (not b!292948) (not b!292949) (not b!292944) (not start!28670))
(check-sat)
