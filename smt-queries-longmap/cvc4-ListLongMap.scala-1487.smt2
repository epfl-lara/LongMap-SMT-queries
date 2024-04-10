; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28312 () Bool)

(assert start!28312)

(declare-fun b!290103 () Bool)

(declare-fun e!183594 () Bool)

(assert (=> b!290103 (= e!183594 false)))

(declare-fun lt!143266 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14626 0))(
  ( (array!14627 (arr!6940 (Array (_ BitVec 32) (_ BitVec 64))) (size!7292 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14626)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2089 0))(
  ( (MissingZero!2089 (index!10526 (_ BitVec 32))) (Found!2089 (index!10527 (_ BitVec 32))) (Intermediate!2089 (undefined!2901 Bool) (index!10528 (_ BitVec 32)) (x!28718 (_ BitVec 32))) (Undefined!2089) (MissingVacant!2089 (index!10529 (_ BitVec 32))) )
))
(declare-fun lt!143267 () SeekEntryResult!2089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14626 (_ BitVec 32)) SeekEntryResult!2089)

(assert (=> b!290103 (= lt!143267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143266 k!2524 (array!14627 (store (arr!6940 a!3312) i!1256 k!2524) (size!7292 a!3312)) mask!3809))))

(declare-fun lt!143269 () SeekEntryResult!2089)

(assert (=> b!290103 (= lt!143269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143266 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290103 (= lt!143266 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290104 () Bool)

(declare-fun res!151584 () Bool)

(declare-fun e!183595 () Bool)

(assert (=> b!290104 (=> (not res!151584) (not e!183595))))

(declare-fun arrayContainsKey!0 (array!14626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290104 (= res!151584 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151583 () Bool)

(assert (=> start!28312 (=> (not res!151583) (not e!183595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28312 (= res!151583 (validMask!0 mask!3809))))

(assert (=> start!28312 e!183595))

(assert (=> start!28312 true))

(declare-fun array_inv!4903 (array!14626) Bool)

(assert (=> start!28312 (array_inv!4903 a!3312)))

(declare-fun b!290105 () Bool)

(declare-fun res!151585 () Bool)

(assert (=> b!290105 (=> (not res!151585) (not e!183595))))

(assert (=> b!290105 (= res!151585 (and (= (size!7292 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7292 a!3312))))))

(declare-fun b!290106 () Bool)

(declare-fun res!151582 () Bool)

(assert (=> b!290106 (=> (not res!151582) (not e!183595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290106 (= res!151582 (validKeyInArray!0 k!2524))))

(declare-fun b!290107 () Bool)

(declare-fun res!151587 () Bool)

(assert (=> b!290107 (=> (not res!151587) (not e!183594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14626 (_ BitVec 32)) Bool)

(assert (=> b!290107 (= res!151587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290108 () Bool)

(assert (=> b!290108 (= e!183595 e!183594)))

(declare-fun res!151586 () Bool)

(assert (=> b!290108 (=> (not res!151586) (not e!183594))))

(declare-fun lt!143268 () SeekEntryResult!2089)

(assert (=> b!290108 (= res!151586 (or (= lt!143268 (MissingZero!2089 i!1256)) (= lt!143268 (MissingVacant!2089 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14626 (_ BitVec 32)) SeekEntryResult!2089)

(assert (=> b!290108 (= lt!143268 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28312 res!151583) b!290105))

(assert (= (and b!290105 res!151585) b!290106))

(assert (= (and b!290106 res!151582) b!290104))

(assert (= (and b!290104 res!151584) b!290108))

(assert (= (and b!290108 res!151586) b!290107))

(assert (= (and b!290107 res!151587) b!290103))

(declare-fun m!304207 () Bool)

(assert (=> b!290104 m!304207))

(declare-fun m!304209 () Bool)

(assert (=> b!290103 m!304209))

(declare-fun m!304211 () Bool)

(assert (=> b!290103 m!304211))

(declare-fun m!304213 () Bool)

(assert (=> b!290103 m!304213))

(declare-fun m!304215 () Bool)

(assert (=> b!290103 m!304215))

(declare-fun m!304217 () Bool)

(assert (=> start!28312 m!304217))

(declare-fun m!304219 () Bool)

(assert (=> start!28312 m!304219))

(declare-fun m!304221 () Bool)

(assert (=> b!290106 m!304221))

(declare-fun m!304223 () Bool)

(assert (=> b!290108 m!304223))

(declare-fun m!304225 () Bool)

(assert (=> b!290107 m!304225))

(push 1)

(assert (not b!290106))

(assert (not b!290108))

(assert (not b!290107))

(assert (not b!290104))

(assert (not start!28312))

