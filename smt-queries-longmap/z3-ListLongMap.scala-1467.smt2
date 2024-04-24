; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28180 () Bool)

(assert start!28180)

(declare-fun b!288660 () Bool)

(declare-fun res!150260 () Bool)

(declare-fun e!182758 () Bool)

(assert (=> b!288660 (=> (not res!150260) (not e!182758))))

(declare-datatypes ((array!14499 0))(
  ( (array!14500 (arr!6877 (Array (_ BitVec 32) (_ BitVec 64))) (size!7229 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14499)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14499 (_ BitVec 32)) Bool)

(assert (=> b!288660 (= res!150260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288661 () Bool)

(declare-fun e!182762 () Bool)

(assert (=> b!288661 (= e!182762 (not true))))

(declare-datatypes ((SeekEntryResult!1991 0))(
  ( (MissingZero!1991 (index!10134 (_ BitVec 32))) (Found!1991 (index!10135 (_ BitVec 32))) (Intermediate!1991 (undefined!2803 Bool) (index!10136 (_ BitVec 32)) (x!28460 (_ BitVec 32))) (Undefined!1991) (MissingVacant!1991 (index!10137 (_ BitVec 32))) )
))
(declare-fun lt!142271 () SeekEntryResult!1991)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288661 (and (= (select (arr!6877 a!3312) (index!10136 lt!142271)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10136 lt!142271) i!1256))))

(declare-fun b!288663 () Bool)

(declare-fun e!182760 () Bool)

(assert (=> b!288663 (= e!182758 e!182760)))

(declare-fun res!150258 () Bool)

(assert (=> b!288663 (=> (not res!150258) (not e!182760))))

(declare-fun lt!142274 () Bool)

(assert (=> b!288663 (= res!150258 lt!142274)))

(declare-fun lt!142272 () SeekEntryResult!1991)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!142273 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14499 (_ BitVec 32)) SeekEntryResult!1991)

(assert (=> b!288663 (= lt!142272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142273 k0!2524 (array!14500 (store (arr!6877 a!3312) i!1256 k0!2524) (size!7229 a!3312)) mask!3809))))

(assert (=> b!288663 (= lt!142271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142273 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288663 (= lt!142273 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288664 () Bool)

(assert (=> b!288664 (= e!182760 e!182762)))

(declare-fun res!150257 () Bool)

(assert (=> b!288664 (=> (not res!150257) (not e!182762))))

(declare-fun lt!142270 () Bool)

(assert (=> b!288664 (= res!150257 (and (or lt!142270 (not (undefined!2803 lt!142271))) (or lt!142270 (not (= (select (arr!6877 a!3312) (index!10136 lt!142271)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142270 (not (= (select (arr!6877 a!3312) (index!10136 lt!142271)) k0!2524))) (not lt!142270)))))

(get-info :version)

(assert (=> b!288664 (= lt!142270 (not ((_ is Intermediate!1991) lt!142271)))))

(declare-fun b!288665 () Bool)

(declare-fun res!150262 () Bool)

(declare-fun e!182759 () Bool)

(assert (=> b!288665 (=> (not res!150262) (not e!182759))))

(declare-fun arrayContainsKey!0 (array!14499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288665 (= res!150262 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288666 () Bool)

(declare-fun res!150263 () Bool)

(assert (=> b!288666 (=> (not res!150263) (not e!182759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288666 (= res!150263 (validKeyInArray!0 k0!2524))))

(declare-fun b!288667 () Bool)

(assert (=> b!288667 (= e!182759 e!182758)))

(declare-fun res!150261 () Bool)

(assert (=> b!288667 (=> (not res!150261) (not e!182758))))

(declare-fun lt!142275 () SeekEntryResult!1991)

(assert (=> b!288667 (= res!150261 (or lt!142274 (= lt!142275 (MissingVacant!1991 i!1256))))))

(assert (=> b!288667 (= lt!142274 (= lt!142275 (MissingZero!1991 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14499 (_ BitVec 32)) SeekEntryResult!1991)

(assert (=> b!288667 (= lt!142275 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!150264 () Bool)

(assert (=> start!28180 (=> (not res!150264) (not e!182759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28180 (= res!150264 (validMask!0 mask!3809))))

(assert (=> start!28180 e!182759))

(assert (=> start!28180 true))

(declare-fun array_inv!4827 (array!14499) Bool)

(assert (=> start!28180 (array_inv!4827 a!3312)))

(declare-fun b!288662 () Bool)

(declare-fun res!150259 () Bool)

(assert (=> b!288662 (=> (not res!150259) (not e!182759))))

(assert (=> b!288662 (= res!150259 (and (= (size!7229 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7229 a!3312))))))

(assert (= (and start!28180 res!150264) b!288662))

(assert (= (and b!288662 res!150259) b!288666))

(assert (= (and b!288666 res!150263) b!288665))

(assert (= (and b!288665 res!150262) b!288667))

(assert (= (and b!288667 res!150261) b!288660))

(assert (= (and b!288660 res!150260) b!288663))

(assert (= (and b!288663 res!150258) b!288664))

(assert (= (and b!288664 res!150257) b!288661))

(declare-fun m!303035 () Bool)

(assert (=> b!288663 m!303035))

(declare-fun m!303037 () Bool)

(assert (=> b!288663 m!303037))

(declare-fun m!303039 () Bool)

(assert (=> b!288663 m!303039))

(declare-fun m!303041 () Bool)

(assert (=> b!288663 m!303041))

(declare-fun m!303043 () Bool)

(assert (=> b!288660 m!303043))

(declare-fun m!303045 () Bool)

(assert (=> b!288661 m!303045))

(assert (=> b!288664 m!303045))

(declare-fun m!303047 () Bool)

(assert (=> start!28180 m!303047))

(declare-fun m!303049 () Bool)

(assert (=> start!28180 m!303049))

(declare-fun m!303051 () Bool)

(assert (=> b!288666 m!303051))

(declare-fun m!303053 () Bool)

(assert (=> b!288665 m!303053))

(declare-fun m!303055 () Bool)

(assert (=> b!288667 m!303055))

(check-sat (not start!28180) (not b!288660) (not b!288666) (not b!288663) (not b!288667) (not b!288665))
(check-sat)
