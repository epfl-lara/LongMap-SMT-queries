; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28240 () Bool)

(assert start!28240)

(declare-fun b!289237 () Bool)

(declare-fun res!150863 () Bool)

(declare-fun e!183127 () Bool)

(assert (=> b!289237 (=> (not res!150863) (not e!183127))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14554 0))(
  ( (array!14555 (arr!6904 (Array (_ BitVec 32) (_ BitVec 64))) (size!7256 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14554)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289237 (= res!150863 (and (= (size!7256 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7256 a!3312))))))

(declare-fun res!150862 () Bool)

(assert (=> start!28240 (=> (not res!150862) (not e!183127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28240 (= res!150862 (validMask!0 mask!3809))))

(assert (=> start!28240 e!183127))

(assert (=> start!28240 true))

(declare-fun array_inv!4867 (array!14554) Bool)

(assert (=> start!28240 (array_inv!4867 a!3312)))

(declare-fun b!289238 () Bool)

(declare-fun res!150860 () Bool)

(assert (=> b!289238 (=> (not res!150860) (not e!183127))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289238 (= res!150860 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289239 () Bool)

(declare-fun e!183126 () Bool)

(assert (=> b!289239 (= e!183126 (not true))))

(declare-datatypes ((SeekEntryResult!2053 0))(
  ( (MissingZero!2053 (index!10382 (_ BitVec 32))) (Found!2053 (index!10383 (_ BitVec 32))) (Intermediate!2053 (undefined!2865 Bool) (index!10384 (_ BitVec 32)) (x!28586 (_ BitVec 32))) (Undefined!2053) (MissingVacant!2053 (index!10385 (_ BitVec 32))) )
))
(declare-fun lt!142680 () SeekEntryResult!2053)

(assert (=> b!289239 (and (= (select (arr!6904 a!3312) (index!10384 lt!142680)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10384 lt!142680) i!1256))))

(declare-fun b!289240 () Bool)

(declare-fun e!183125 () Bool)

(assert (=> b!289240 (= e!183125 e!183126)))

(declare-fun res!150867 () Bool)

(assert (=> b!289240 (=> (not res!150867) (not e!183126))))

(declare-fun lt!142679 () Bool)

(assert (=> b!289240 (= res!150867 (and (or lt!142679 (not (undefined!2865 lt!142680))) (or lt!142679 (not (= (select (arr!6904 a!3312) (index!10384 lt!142680)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142679 (not (= (select (arr!6904 a!3312) (index!10384 lt!142680)) k!2524))) (not lt!142679)))))

(assert (=> b!289240 (= lt!142679 (not (is-Intermediate!2053 lt!142680)))))

(declare-fun b!289241 () Bool)

(declare-fun e!183128 () Bool)

(assert (=> b!289241 (= e!183127 e!183128)))

(declare-fun res!150865 () Bool)

(assert (=> b!289241 (=> (not res!150865) (not e!183128))))

(declare-fun lt!142682 () Bool)

(declare-fun lt!142681 () SeekEntryResult!2053)

(assert (=> b!289241 (= res!150865 (or lt!142682 (= lt!142681 (MissingVacant!2053 i!1256))))))

(assert (=> b!289241 (= lt!142682 (= lt!142681 (MissingZero!2053 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14554 (_ BitVec 32)) SeekEntryResult!2053)

(assert (=> b!289241 (= lt!142681 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289242 () Bool)

(declare-fun res!150866 () Bool)

(assert (=> b!289242 (=> (not res!150866) (not e!183127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289242 (= res!150866 (validKeyInArray!0 k!2524))))

(declare-fun b!289243 () Bool)

(declare-fun res!150861 () Bool)

(assert (=> b!289243 (=> (not res!150861) (not e!183128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14554 (_ BitVec 32)) Bool)

(assert (=> b!289243 (= res!150861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289244 () Bool)

(assert (=> b!289244 (= e!183128 e!183125)))

(declare-fun res!150864 () Bool)

(assert (=> b!289244 (=> (not res!150864) (not e!183125))))

(assert (=> b!289244 (= res!150864 lt!142682)))

(declare-fun lt!142683 () SeekEntryResult!2053)

(declare-fun lt!142684 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14554 (_ BitVec 32)) SeekEntryResult!2053)

(assert (=> b!289244 (= lt!142683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142684 k!2524 (array!14555 (store (arr!6904 a!3312) i!1256 k!2524) (size!7256 a!3312)) mask!3809))))

(assert (=> b!289244 (= lt!142680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142684 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289244 (= lt!142684 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28240 res!150862) b!289237))

(assert (= (and b!289237 res!150863) b!289242))

(assert (= (and b!289242 res!150866) b!289238))

(assert (= (and b!289238 res!150860) b!289241))

(assert (= (and b!289241 res!150865) b!289243))

(assert (= (and b!289243 res!150861) b!289244))

(assert (= (and b!289244 res!150864) b!289240))

(assert (= (and b!289240 res!150867) b!289239))

(declare-fun m!303401 () Bool)

(assert (=> start!28240 m!303401))

(declare-fun m!303403 () Bool)

(assert (=> start!28240 m!303403))

(declare-fun m!303405 () Bool)

(assert (=> b!289244 m!303405))

(declare-fun m!303407 () Bool)

(assert (=> b!289244 m!303407))

(declare-fun m!303409 () Bool)

(assert (=> b!289244 m!303409))

(declare-fun m!303411 () Bool)

(assert (=> b!289244 m!303411))

(declare-fun m!303413 () Bool)

(assert (=> b!289240 m!303413))

(declare-fun m!303415 () Bool)

(assert (=> b!289238 m!303415))

(declare-fun m!303417 () Bool)

(assert (=> b!289242 m!303417))

(assert (=> b!289239 m!303413))

(declare-fun m!303419 () Bool)

(assert (=> b!289243 m!303419))

(declare-fun m!303421 () Bool)

(assert (=> b!289241 m!303421))

(push 1)

