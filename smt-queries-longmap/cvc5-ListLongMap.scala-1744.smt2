; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31984 () Bool)

(assert start!31984)

(declare-fun res!173818 () Bool)

(declare-fun e!198400 () Bool)

(assert (=> start!31984 (=> (not res!173818) (not e!198400))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31984 (= res!173818 (validMask!0 mask!3777))))

(assert (=> start!31984 e!198400))

(assert (=> start!31984 true))

(declare-datatypes ((array!16291 0))(
  ( (array!16292 (arr!7709 (Array (_ BitVec 32) (_ BitVec 64))) (size!8061 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16291)

(declare-fun array_inv!5672 (array!16291) Bool)

(assert (=> start!31984 (array_inv!5672 a!3305)))

(declare-fun b!319433 () Bool)

(declare-fun res!173820 () Bool)

(assert (=> b!319433 (=> (not res!173820) (not e!198400))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319433 (= res!173820 (and (= (size!8061 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8061 a!3305))))))

(declare-fun b!319435 () Bool)

(declare-fun res!173817 () Bool)

(assert (=> b!319435 (=> (not res!173817) (not e!198400))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319435 (= res!173817 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319436 () Bool)

(assert (=> b!319436 (= e!198400 false)))

(declare-datatypes ((SeekEntryResult!2840 0))(
  ( (MissingZero!2840 (index!13536 (_ BitVec 32))) (Found!2840 (index!13537 (_ BitVec 32))) (Intermediate!2840 (undefined!3652 Bool) (index!13538 (_ BitVec 32)) (x!31818 (_ BitVec 32))) (Undefined!2840) (MissingVacant!2840 (index!13539 (_ BitVec 32))) )
))
(declare-fun lt!155799 () SeekEntryResult!2840)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16291 (_ BitVec 32)) SeekEntryResult!2840)

(assert (=> b!319436 (= lt!155799 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319434 () Bool)

(declare-fun res!173819 () Bool)

(assert (=> b!319434 (=> (not res!173819) (not e!198400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319434 (= res!173819 (validKeyInArray!0 k!2497))))

(assert (= (and start!31984 res!173818) b!319433))

(assert (= (and b!319433 res!173820) b!319434))

(assert (= (and b!319434 res!173819) b!319435))

(assert (= (and b!319435 res!173817) b!319436))

(declare-fun m!328037 () Bool)

(assert (=> start!31984 m!328037))

(declare-fun m!328039 () Bool)

(assert (=> start!31984 m!328039))

(declare-fun m!328041 () Bool)

(assert (=> b!319435 m!328041))

(declare-fun m!328043 () Bool)

(assert (=> b!319436 m!328043))

(declare-fun m!328045 () Bool)

(assert (=> b!319434 m!328045))

(push 1)

(assert (not b!319434))

(assert (not b!319436))

(assert (not b!319435))

(assert (not start!31984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

