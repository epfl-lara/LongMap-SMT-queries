; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28242 () Bool)

(assert start!28242)

(declare-fun b!289261 () Bool)

(declare-fun res!150887 () Bool)

(declare-fun e!183139 () Bool)

(assert (=> b!289261 (=> (not res!150887) (not e!183139))))

(declare-datatypes ((array!14556 0))(
  ( (array!14557 (arr!6905 (Array (_ BitVec 32) (_ BitVec 64))) (size!7257 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14556)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289261 (= res!150887 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289262 () Bool)

(declare-fun e!183143 () Bool)

(assert (=> b!289262 (= e!183139 e!183143)))

(declare-fun res!150889 () Bool)

(assert (=> b!289262 (=> (not res!150889) (not e!183143))))

(declare-datatypes ((SeekEntryResult!2054 0))(
  ( (MissingZero!2054 (index!10386 (_ BitVec 32))) (Found!2054 (index!10387 (_ BitVec 32))) (Intermediate!2054 (undefined!2866 Bool) (index!10388 (_ BitVec 32)) (x!28595 (_ BitVec 32))) (Undefined!2054) (MissingVacant!2054 (index!10389 (_ BitVec 32))) )
))
(declare-fun lt!142700 () SeekEntryResult!2054)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142701 () Bool)

(assert (=> b!289262 (= res!150889 (or lt!142701 (= lt!142700 (MissingVacant!2054 i!1256))))))

(assert (=> b!289262 (= lt!142701 (= lt!142700 (MissingZero!2054 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14556 (_ BitVec 32)) SeekEntryResult!2054)

(assert (=> b!289262 (= lt!142700 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289263 () Bool)

(declare-fun res!150885 () Bool)

(assert (=> b!289263 (=> (not res!150885) (not e!183139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289263 (= res!150885 (validKeyInArray!0 k!2524))))

(declare-fun b!289264 () Bool)

(declare-fun e!183140 () Bool)

(declare-fun e!183142 () Bool)

(assert (=> b!289264 (= e!183140 e!183142)))

(declare-fun res!150884 () Bool)

(assert (=> b!289264 (=> (not res!150884) (not e!183142))))

(declare-fun lt!142697 () SeekEntryResult!2054)

(declare-fun lt!142702 () Bool)

(assert (=> b!289264 (= res!150884 (and (or lt!142702 (not (undefined!2866 lt!142697))) (or lt!142702 (not (= (select (arr!6905 a!3312) (index!10388 lt!142697)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142702 (not (= (select (arr!6905 a!3312) (index!10388 lt!142697)) k!2524))) (not lt!142702)))))

(assert (=> b!289264 (= lt!142702 (not (is-Intermediate!2054 lt!142697)))))

(declare-fun b!289265 () Bool)

(assert (=> b!289265 (= e!183143 e!183140)))

(declare-fun res!150891 () Bool)

(assert (=> b!289265 (=> (not res!150891) (not e!183140))))

(assert (=> b!289265 (= res!150891 lt!142701)))

(declare-fun lt!142699 () SeekEntryResult!2054)

(declare-fun lt!142698 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14556 (_ BitVec 32)) SeekEntryResult!2054)

(assert (=> b!289265 (= lt!142699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142698 k!2524 (array!14557 (store (arr!6905 a!3312) i!1256 k!2524) (size!7257 a!3312)) mask!3809))))

(assert (=> b!289265 (= lt!142697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142698 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289265 (= lt!142698 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289266 () Bool)

(declare-fun res!150886 () Bool)

(assert (=> b!289266 (=> (not res!150886) (not e!183143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14556 (_ BitVec 32)) Bool)

(assert (=> b!289266 (= res!150886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289267 () Bool)

(declare-fun res!150888 () Bool)

(assert (=> b!289267 (=> (not res!150888) (not e!183139))))

(assert (=> b!289267 (= res!150888 (and (= (size!7257 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7257 a!3312))))))

(declare-fun b!289268 () Bool)

(assert (=> b!289268 (= e!183142 (not true))))

(assert (=> b!289268 (and (= (select (arr!6905 a!3312) (index!10388 lt!142697)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10388 lt!142697) i!1256))))

(declare-fun res!150890 () Bool)

(assert (=> start!28242 (=> (not res!150890) (not e!183139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28242 (= res!150890 (validMask!0 mask!3809))))

(assert (=> start!28242 e!183139))

(assert (=> start!28242 true))

(declare-fun array_inv!4868 (array!14556) Bool)

(assert (=> start!28242 (array_inv!4868 a!3312)))

(assert (= (and start!28242 res!150890) b!289267))

(assert (= (and b!289267 res!150888) b!289263))

(assert (= (and b!289263 res!150885) b!289261))

(assert (= (and b!289261 res!150887) b!289262))

(assert (= (and b!289262 res!150889) b!289266))

(assert (= (and b!289266 res!150886) b!289265))

(assert (= (and b!289265 res!150891) b!289264))

(assert (= (and b!289264 res!150884) b!289268))

(declare-fun m!303423 () Bool)

(assert (=> b!289266 m!303423))

(declare-fun m!303425 () Bool)

(assert (=> b!289268 m!303425))

(declare-fun m!303427 () Bool)

(assert (=> start!28242 m!303427))

(declare-fun m!303429 () Bool)

(assert (=> start!28242 m!303429))

(declare-fun m!303431 () Bool)

(assert (=> b!289263 m!303431))

(declare-fun m!303433 () Bool)

(assert (=> b!289262 m!303433))

(assert (=> b!289264 m!303425))

(declare-fun m!303435 () Bool)

(assert (=> b!289261 m!303435))

(declare-fun m!303437 () Bool)

(assert (=> b!289265 m!303437))

(declare-fun m!303439 () Bool)

(assert (=> b!289265 m!303439))

(declare-fun m!303441 () Bool)

(assert (=> b!289265 m!303441))

(declare-fun m!303443 () Bool)

(assert (=> b!289265 m!303443))

(push 1)

(assert (not b!289263))

(assert (not b!289262))

(assert (not start!28242))

(assert (not b!289261))

(assert (not b!289265))

(assert (not b!289266))

(check-sat)

(pop 1)

