; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28236 () Bool)

(assert start!28236)

(declare-fun b!289189 () Bool)

(declare-fun res!150813 () Bool)

(declare-fun e!183096 () Bool)

(assert (=> b!289189 (=> (not res!150813) (not e!183096))))

(declare-datatypes ((array!14550 0))(
  ( (array!14551 (arr!6902 (Array (_ BitVec 32) (_ BitVec 64))) (size!7254 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14550)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289189 (= res!150813 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289190 () Bool)

(declare-fun res!150815 () Bool)

(assert (=> b!289190 (=> (not res!150815) (not e!183096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289190 (= res!150815 (validKeyInArray!0 k!2524))))

(declare-fun b!289191 () Bool)

(declare-fun e!183098 () Bool)

(declare-fun e!183095 () Bool)

(assert (=> b!289191 (= e!183098 e!183095)))

(declare-fun res!150817 () Bool)

(assert (=> b!289191 (=> (not res!150817) (not e!183095))))

(declare-fun lt!142644 () Bool)

(assert (=> b!289191 (= res!150817 lt!142644)))

(declare-fun lt!142643 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2051 0))(
  ( (MissingZero!2051 (index!10374 (_ BitVec 32))) (Found!2051 (index!10375 (_ BitVec 32))) (Intermediate!2051 (undefined!2863 Bool) (index!10376 (_ BitVec 32)) (x!28584 (_ BitVec 32))) (Undefined!2051) (MissingVacant!2051 (index!10377 (_ BitVec 32))) )
))
(declare-fun lt!142645 () SeekEntryResult!2051)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14550 (_ BitVec 32)) SeekEntryResult!2051)

(assert (=> b!289191 (= lt!142645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142643 k!2524 (array!14551 (store (arr!6902 a!3312) i!1256 k!2524) (size!7254 a!3312)) mask!3809))))

(declare-fun lt!142647 () SeekEntryResult!2051)

(assert (=> b!289191 (= lt!142647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142643 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289191 (= lt!142643 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289192 () Bool)

(declare-fun res!150819 () Bool)

(assert (=> b!289192 (=> (not res!150819) (not e!183096))))

(assert (=> b!289192 (= res!150819 (and (= (size!7254 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7254 a!3312))))))

(declare-fun res!150816 () Bool)

(assert (=> start!28236 (=> (not res!150816) (not e!183096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28236 (= res!150816 (validMask!0 mask!3809))))

(assert (=> start!28236 e!183096))

(assert (=> start!28236 true))

(declare-fun array_inv!4865 (array!14550) Bool)

(assert (=> start!28236 (array_inv!4865 a!3312)))

(declare-fun b!289193 () Bool)

(declare-fun e!183097 () Bool)

(assert (=> b!289193 (= e!183095 e!183097)))

(declare-fun res!150814 () Bool)

(assert (=> b!289193 (=> (not res!150814) (not e!183097))))

(declare-fun lt!142648 () Bool)

(assert (=> b!289193 (= res!150814 (and (or lt!142648 (not (undefined!2863 lt!142647))) (or lt!142648 (not (= (select (arr!6902 a!3312) (index!10376 lt!142647)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142648 (not (= (select (arr!6902 a!3312) (index!10376 lt!142647)) k!2524))) (not lt!142648)))))

(assert (=> b!289193 (= lt!142648 (not (is-Intermediate!2051 lt!142647)))))

(declare-fun b!289194 () Bool)

(declare-fun res!150818 () Bool)

(assert (=> b!289194 (=> (not res!150818) (not e!183098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14550 (_ BitVec 32)) Bool)

(assert (=> b!289194 (= res!150818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289195 () Bool)

(assert (=> b!289195 (= e!183096 e!183098)))

(declare-fun res!150812 () Bool)

(assert (=> b!289195 (=> (not res!150812) (not e!183098))))

(declare-fun lt!142646 () SeekEntryResult!2051)

(assert (=> b!289195 (= res!150812 (or lt!142644 (= lt!142646 (MissingVacant!2051 i!1256))))))

(assert (=> b!289195 (= lt!142644 (= lt!142646 (MissingZero!2051 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14550 (_ BitVec 32)) SeekEntryResult!2051)

(assert (=> b!289195 (= lt!142646 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289196 () Bool)

(assert (=> b!289196 (= e!183097 (not true))))

(assert (=> b!289196 (and (= (select (arr!6902 a!3312) (index!10376 lt!142647)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10376 lt!142647) i!1256))))

(assert (= (and start!28236 res!150816) b!289192))

(assert (= (and b!289192 res!150819) b!289190))

(assert (= (and b!289190 res!150815) b!289189))

(assert (= (and b!289189 res!150813) b!289195))

(assert (= (and b!289195 res!150812) b!289194))

(assert (= (and b!289194 res!150818) b!289191))

(assert (= (and b!289191 res!150817) b!289193))

(assert (= (and b!289193 res!150814) b!289196))

(declare-fun m!303357 () Bool)

(assert (=> b!289196 m!303357))

(declare-fun m!303359 () Bool)

(assert (=> start!28236 m!303359))

(declare-fun m!303361 () Bool)

(assert (=> start!28236 m!303361))

(declare-fun m!303363 () Bool)

(assert (=> b!289191 m!303363))

(declare-fun m!303365 () Bool)

(assert (=> b!289191 m!303365))

(declare-fun m!303367 () Bool)

(assert (=> b!289191 m!303367))

(declare-fun m!303369 () Bool)

(assert (=> b!289191 m!303369))

(declare-fun m!303371 () Bool)

(assert (=> b!289195 m!303371))

(declare-fun m!303373 () Bool)

(assert (=> b!289189 m!303373))

(declare-fun m!303375 () Bool)

(assert (=> b!289194 m!303375))

(declare-fun m!303377 () Bool)

(assert (=> b!289190 m!303377))

(assert (=> b!289193 m!303357))

(push 1)

