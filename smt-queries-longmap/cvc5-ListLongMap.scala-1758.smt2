; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32136 () Bool)

(assert start!32136)

(declare-datatypes ((array!16384 0))(
  ( (array!16385 (arr!7752 (Array (_ BitVec 32) (_ BitVec 64))) (size!8104 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16384)

(declare-fun e!198773 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!320364 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!320364 (= e!198773 (and (= (select (arr!7752 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8104 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320365 () Bool)

(declare-fun res!174662 () Bool)

(assert (=> b!320365 (=> (not res!174662) (not e!198773))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320365 (= res!174662 (validKeyInArray!0 k!2497))))

(declare-fun b!320367 () Bool)

(declare-fun res!174660 () Bool)

(assert (=> b!320367 (=> (not res!174660) (not e!198773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16384 (_ BitVec 32)) Bool)

(assert (=> b!320367 (= res!174660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320368 () Bool)

(declare-fun res!174657 () Bool)

(assert (=> b!320368 (=> (not res!174657) (not e!198773))))

(declare-fun arrayContainsKey!0 (array!16384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320368 (= res!174657 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320369 () Bool)

(declare-fun res!174663 () Bool)

(assert (=> b!320369 (=> (not res!174663) (not e!198773))))

(declare-datatypes ((SeekEntryResult!2848 0))(
  ( (MissingZero!2848 (index!13568 (_ BitVec 32))) (Found!2848 (index!13569 (_ BitVec 32))) (Intermediate!2848 (undefined!3660 Bool) (index!13570 (_ BitVec 32)) (x!31938 (_ BitVec 32))) (Undefined!2848) (MissingVacant!2848 (index!13571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16384 (_ BitVec 32)) SeekEntryResult!2848)

(assert (=> b!320369 (= res!174663 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2848 i!1250)))))

(declare-fun b!320370 () Bool)

(declare-fun res!174659 () Bool)

(assert (=> b!320370 (=> (not res!174659) (not e!198773))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16384 (_ BitVec 32)) SeekEntryResult!2848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320370 (= res!174659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2848 false resIndex!58 resX!58)))))

(declare-fun b!320366 () Bool)

(declare-fun res!174661 () Bool)

(assert (=> b!320366 (=> (not res!174661) (not e!198773))))

(assert (=> b!320366 (= res!174661 (and (= (size!8104 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8104 a!3305))))))

(declare-fun res!174658 () Bool)

(assert (=> start!32136 (=> (not res!174658) (not e!198773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32136 (= res!174658 (validMask!0 mask!3777))))

(assert (=> start!32136 e!198773))

(declare-fun array_inv!5702 (array!16384) Bool)

(assert (=> start!32136 (array_inv!5702 a!3305)))

(assert (=> start!32136 true))

(assert (= (and start!32136 res!174658) b!320366))

(assert (= (and b!320366 res!174661) b!320365))

(assert (= (and b!320365 res!174662) b!320368))

(assert (= (and b!320368 res!174657) b!320369))

(assert (= (and b!320369 res!174663) b!320367))

(assert (= (and b!320367 res!174660) b!320370))

(assert (= (and b!320370 res!174659) b!320364))

(declare-fun m!328975 () Bool)

(assert (=> b!320368 m!328975))

(declare-fun m!328977 () Bool)

(assert (=> b!320365 m!328977))

(declare-fun m!328979 () Bool)

(assert (=> b!320364 m!328979))

(declare-fun m!328981 () Bool)

(assert (=> b!320369 m!328981))

(declare-fun m!328983 () Bool)

(assert (=> b!320370 m!328983))

(assert (=> b!320370 m!328983))

(declare-fun m!328985 () Bool)

(assert (=> b!320370 m!328985))

(declare-fun m!328987 () Bool)

(assert (=> b!320367 m!328987))

(declare-fun m!328989 () Bool)

(assert (=> start!32136 m!328989))

(declare-fun m!328991 () Bool)

(assert (=> start!32136 m!328991))

(push 1)

(assert (not b!320368))

(assert (not b!320365))

(assert (not b!320367))

(assert (not start!32136))

(assert (not b!320369))

(assert (not b!320370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

