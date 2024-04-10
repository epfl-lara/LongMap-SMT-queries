; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28600 () Bool)

(assert start!28600)

(declare-fun b!292425 () Bool)

(declare-fun e!185017 () Bool)

(declare-fun e!185018 () Bool)

(assert (=> b!292425 (= e!185017 e!185018)))

(declare-fun res!153485 () Bool)

(assert (=> b!292425 (=> (not res!153485) (not e!185018))))

(declare-datatypes ((SeekEntryResult!2161 0))(
  ( (MissingZero!2161 (index!10814 (_ BitVec 32))) (Found!2161 (index!10815 (_ BitVec 32))) (Intermediate!2161 (undefined!2973 Bool) (index!10816 (_ BitVec 32)) (x!29000 (_ BitVec 32))) (Undefined!2161) (MissingVacant!2161 (index!10817 (_ BitVec 32))) )
))
(declare-fun lt!144834 () SeekEntryResult!2161)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292425 (= res!153485 (or (= lt!144834 (MissingZero!2161 i!1256)) (= lt!144834 (MissingVacant!2161 i!1256))))))

(declare-datatypes ((array!14779 0))(
  ( (array!14780 (arr!7012 (Array (_ BitVec 32) (_ BitVec 64))) (size!7364 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14779)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14779 (_ BitVec 32)) SeekEntryResult!2161)

(assert (=> b!292425 (= lt!144834 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292426 () Bool)

(declare-fun res!153484 () Bool)

(assert (=> b!292426 (=> (not res!153484) (not e!185017))))

(assert (=> b!292426 (= res!153484 (and (= (size!7364 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7364 a!3312))))))

(declare-fun res!153482 () Bool)

(assert (=> start!28600 (=> (not res!153482) (not e!185017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28600 (= res!153482 (validMask!0 mask!3809))))

(assert (=> start!28600 e!185017))

(assert (=> start!28600 true))

(declare-fun array_inv!4975 (array!14779) Bool)

(assert (=> start!28600 (array_inv!4975 a!3312)))

(declare-fun b!292427 () Bool)

(declare-fun res!153481 () Bool)

(assert (=> b!292427 (=> (not res!153481) (not e!185017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292427 (= res!153481 (validKeyInArray!0 k!2524))))

(declare-fun b!292428 () Bool)

(assert (=> b!292428 (= e!185018 false)))

(declare-fun lt!144832 () (_ BitVec 32))

(declare-fun lt!144835 () SeekEntryResult!2161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14779 (_ BitVec 32)) SeekEntryResult!2161)

(assert (=> b!292428 (= lt!144835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144832 k!2524 (array!14780 (store (arr!7012 a!3312) i!1256 k!2524) (size!7364 a!3312)) mask!3809))))

(declare-fun lt!144833 () SeekEntryResult!2161)

(assert (=> b!292428 (= lt!144833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144832 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292428 (= lt!144832 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292429 () Bool)

(declare-fun res!153486 () Bool)

(assert (=> b!292429 (=> (not res!153486) (not e!185017))))

(declare-fun arrayContainsKey!0 (array!14779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292429 (= res!153486 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292430 () Bool)

(declare-fun res!153483 () Bool)

(assert (=> b!292430 (=> (not res!153483) (not e!185018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14779 (_ BitVec 32)) Bool)

(assert (=> b!292430 (= res!153483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28600 res!153482) b!292426))

(assert (= (and b!292426 res!153484) b!292427))

(assert (= (and b!292427 res!153481) b!292429))

(assert (= (and b!292429 res!153486) b!292425))

(assert (= (and b!292425 res!153485) b!292430))

(assert (= (and b!292430 res!153483) b!292428))

(declare-fun m!306157 () Bool)

(assert (=> b!292427 m!306157))

(declare-fun m!306159 () Bool)

(assert (=> b!292425 m!306159))

(declare-fun m!306161 () Bool)

(assert (=> b!292429 m!306161))

(declare-fun m!306163 () Bool)

(assert (=> start!28600 m!306163))

(declare-fun m!306165 () Bool)

(assert (=> start!28600 m!306165))

(declare-fun m!306167 () Bool)

(assert (=> b!292430 m!306167))

(declare-fun m!306169 () Bool)

(assert (=> b!292428 m!306169))

(declare-fun m!306171 () Bool)

(assert (=> b!292428 m!306171))

(declare-fun m!306173 () Bool)

(assert (=> b!292428 m!306173))

(declare-fun m!306175 () Bool)

(assert (=> b!292428 m!306175))

(push 1)

(assert (not b!292425))

(assert (not b!292429))

(assert (not b!292428))

(assert (not start!28600))

(assert (not b!292427))

(assert (not b!292430))

(check-sat)

