; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28620 () Bool)

(assert start!28620)

(declare-fun b!292605 () Bool)

(declare-fun res!153666 () Bool)

(declare-fun e!185106 () Bool)

(assert (=> b!292605 (=> (not res!153666) (not e!185106))))

(declare-datatypes ((array!14799 0))(
  ( (array!14800 (arr!7022 (Array (_ BitVec 32) (_ BitVec 64))) (size!7374 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14799)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14799 (_ BitVec 32)) Bool)

(assert (=> b!292605 (= res!153666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292606 () Bool)

(declare-fun res!153664 () Bool)

(declare-fun e!185108 () Bool)

(assert (=> b!292606 (=> (not res!153664) (not e!185108))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292606 (= res!153664 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292607 () Bool)

(declare-fun res!153663 () Bool)

(assert (=> b!292607 (=> (not res!153663) (not e!185108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292607 (= res!153663 (validKeyInArray!0 k!2524))))

(declare-fun b!292608 () Bool)

(declare-fun res!153661 () Bool)

(assert (=> b!292608 (=> (not res!153661) (not e!185108))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292608 (= res!153661 (and (= (size!7374 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7374 a!3312))))))

(declare-fun b!292609 () Bool)

(assert (=> b!292609 (= e!185106 false)))

(declare-fun lt!144954 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2171 0))(
  ( (MissingZero!2171 (index!10854 (_ BitVec 32))) (Found!2171 (index!10855 (_ BitVec 32))) (Intermediate!2171 (undefined!2983 Bool) (index!10856 (_ BitVec 32)) (x!29042 (_ BitVec 32))) (Undefined!2171) (MissingVacant!2171 (index!10857 (_ BitVec 32))) )
))
(declare-fun lt!144955 () SeekEntryResult!2171)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14799 (_ BitVec 32)) SeekEntryResult!2171)

(assert (=> b!292609 (= lt!144955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144954 k!2524 (array!14800 (store (arr!7022 a!3312) i!1256 k!2524) (size!7374 a!3312)) mask!3809))))

(declare-fun lt!144952 () SeekEntryResult!2171)

(assert (=> b!292609 (= lt!144952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144954 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292609 (= lt!144954 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292610 () Bool)

(assert (=> b!292610 (= e!185108 e!185106)))

(declare-fun res!153665 () Bool)

(assert (=> b!292610 (=> (not res!153665) (not e!185106))))

(declare-fun lt!144953 () SeekEntryResult!2171)

(assert (=> b!292610 (= res!153665 (or (= lt!144953 (MissingZero!2171 i!1256)) (= lt!144953 (MissingVacant!2171 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14799 (_ BitVec 32)) SeekEntryResult!2171)

(assert (=> b!292610 (= lt!144953 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!153662 () Bool)

(assert (=> start!28620 (=> (not res!153662) (not e!185108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28620 (= res!153662 (validMask!0 mask!3809))))

(assert (=> start!28620 e!185108))

(assert (=> start!28620 true))

(declare-fun array_inv!4985 (array!14799) Bool)

(assert (=> start!28620 (array_inv!4985 a!3312)))

(assert (= (and start!28620 res!153662) b!292608))

(assert (= (and b!292608 res!153661) b!292607))

(assert (= (and b!292607 res!153663) b!292606))

(assert (= (and b!292606 res!153664) b!292610))

(assert (= (and b!292610 res!153665) b!292605))

(assert (= (and b!292605 res!153666) b!292609))

(declare-fun m!306357 () Bool)

(assert (=> b!292609 m!306357))

(declare-fun m!306359 () Bool)

(assert (=> b!292609 m!306359))

(declare-fun m!306361 () Bool)

(assert (=> b!292609 m!306361))

(declare-fun m!306363 () Bool)

(assert (=> b!292609 m!306363))

(declare-fun m!306365 () Bool)

(assert (=> b!292610 m!306365))

(declare-fun m!306367 () Bool)

(assert (=> start!28620 m!306367))

(declare-fun m!306369 () Bool)

(assert (=> start!28620 m!306369))

(declare-fun m!306371 () Bool)

(assert (=> b!292606 m!306371))

(declare-fun m!306373 () Bool)

(assert (=> b!292605 m!306373))

(declare-fun m!306375 () Bool)

(assert (=> b!292607 m!306375))

(push 1)

(assert (not b!292607))

(assert (not b!292609))

(assert (not b!292606))

(assert (not start!28620))

(assert (not b!292610))

(assert (not b!292605))

(check-sat)

(pop 1)

