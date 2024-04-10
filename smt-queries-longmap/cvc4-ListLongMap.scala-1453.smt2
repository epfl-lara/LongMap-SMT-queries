; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28012 () Bool)

(assert start!28012)

(declare-fun b!287376 () Bool)

(declare-fun res!149265 () Bool)

(declare-fun e!182014 () Bool)

(assert (=> b!287376 (=> (not res!149265) (not e!182014))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14416 0))(
  ( (array!14417 (arr!6838 (Array (_ BitVec 32) (_ BitVec 64))) (size!7190 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14416)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287376 (= res!149265 (and (= (size!7190 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7190 a!3312))))))

(declare-fun b!287377 () Bool)

(declare-fun e!182013 () Bool)

(assert (=> b!287377 (= e!182013 false)))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1987 0))(
  ( (MissingZero!1987 (index!10118 (_ BitVec 32))) (Found!1987 (index!10119 (_ BitVec 32))) (Intermediate!1987 (undefined!2799 Bool) (index!10120 (_ BitVec 32)) (x!28332 (_ BitVec 32))) (Undefined!1987) (MissingVacant!1987 (index!10121 (_ BitVec 32))) )
))
(declare-fun lt!141481 () SeekEntryResult!1987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14416 (_ BitVec 32)) SeekEntryResult!1987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287377 (= lt!141481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287378 () Bool)

(declare-fun res!149263 () Bool)

(assert (=> b!287378 (=> (not res!149263) (not e!182014))))

(declare-fun arrayContainsKey!0 (array!14416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287378 (= res!149263 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287380 () Bool)

(declare-fun res!149266 () Bool)

(assert (=> b!287380 (=> (not res!149266) (not e!182014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287380 (= res!149266 (validKeyInArray!0 k!2524))))

(declare-fun b!287381 () Bool)

(assert (=> b!287381 (= e!182014 e!182013)))

(declare-fun res!149264 () Bool)

(assert (=> b!287381 (=> (not res!149264) (not e!182013))))

(declare-fun lt!141480 () SeekEntryResult!1987)

(assert (=> b!287381 (= res!149264 (or (= lt!141480 (MissingZero!1987 i!1256)) (= lt!141480 (MissingVacant!1987 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14416 (_ BitVec 32)) SeekEntryResult!1987)

(assert (=> b!287381 (= lt!141480 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287379 () Bool)

(declare-fun res!149267 () Bool)

(assert (=> b!287379 (=> (not res!149267) (not e!182013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14416 (_ BitVec 32)) Bool)

(assert (=> b!287379 (= res!149267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!149268 () Bool)

(assert (=> start!28012 (=> (not res!149268) (not e!182014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28012 (= res!149268 (validMask!0 mask!3809))))

(assert (=> start!28012 e!182014))

(assert (=> start!28012 true))

(declare-fun array_inv!4801 (array!14416) Bool)

(assert (=> start!28012 (array_inv!4801 a!3312)))

(assert (= (and start!28012 res!149268) b!287376))

(assert (= (and b!287376 res!149265) b!287380))

(assert (= (and b!287380 res!149266) b!287378))

(assert (= (and b!287378 res!149263) b!287381))

(assert (= (and b!287381 res!149264) b!287379))

(assert (= (and b!287379 res!149267) b!287377))

(declare-fun m!301811 () Bool)

(assert (=> b!287379 m!301811))

(declare-fun m!301813 () Bool)

(assert (=> b!287381 m!301813))

(declare-fun m!301815 () Bool)

(assert (=> start!28012 m!301815))

(declare-fun m!301817 () Bool)

(assert (=> start!28012 m!301817))

(declare-fun m!301819 () Bool)

(assert (=> b!287378 m!301819))

(declare-fun m!301821 () Bool)

(assert (=> b!287377 m!301821))

(assert (=> b!287377 m!301821))

(declare-fun m!301823 () Bool)

(assert (=> b!287377 m!301823))

(declare-fun m!301825 () Bool)

(assert (=> b!287380 m!301825))

(push 1)

(assert (not start!28012))

(assert (not b!287380))

(assert (not b!287377))

(assert (not b!287378))

(assert (not b!287381))

(assert (not b!287379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

