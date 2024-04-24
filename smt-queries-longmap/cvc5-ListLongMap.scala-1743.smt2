; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31968 () Bool)

(assert start!31968)

(declare-fun b!319369 () Bool)

(declare-fun res!173803 () Bool)

(declare-fun e!198359 () Bool)

(assert (=> b!319369 (=> (not res!173803) (not e!198359))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319369 (= res!173803 (validKeyInArray!0 k!2497))))

(declare-fun b!319368 () Bool)

(declare-fun res!173804 () Bool)

(assert (=> b!319368 (=> (not res!173804) (not e!198359))))

(declare-datatypes ((array!16288 0))(
  ( (array!16289 (arr!7707 (Array (_ BitVec 32) (_ BitVec 64))) (size!8059 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16288)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319368 (= res!173804 (and (= (size!8059 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8059 a!3305))))))

(declare-fun b!319370 () Bool)

(declare-fun res!173805 () Bool)

(assert (=> b!319370 (=> (not res!173805) (not e!198359))))

(declare-fun arrayContainsKey!0 (array!16288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319370 (= res!173805 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319371 () Bool)

(assert (=> b!319371 (= e!198359 false)))

(declare-datatypes ((SeekEntryResult!2803 0))(
  ( (MissingZero!2803 (index!13388 (_ BitVec 32))) (Found!2803 (index!13389 (_ BitVec 32))) (Intermediate!2803 (undefined!3615 Bool) (index!13390 (_ BitVec 32)) (x!31770 (_ BitVec 32))) (Undefined!2803) (MissingVacant!2803 (index!13391 (_ BitVec 32))) )
))
(declare-fun lt!155814 () SeekEntryResult!2803)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16288 (_ BitVec 32)) SeekEntryResult!2803)

(assert (=> b!319371 (= lt!155814 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun res!173802 () Bool)

(assert (=> start!31968 (=> (not res!173802) (not e!198359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31968 (= res!173802 (validMask!0 mask!3777))))

(assert (=> start!31968 e!198359))

(assert (=> start!31968 true))

(declare-fun array_inv!5657 (array!16288) Bool)

(assert (=> start!31968 (array_inv!5657 a!3305)))

(assert (= (and start!31968 res!173802) b!319368))

(assert (= (and b!319368 res!173804) b!319369))

(assert (= (and b!319369 res!173803) b!319370))

(assert (= (and b!319370 res!173805) b!319371))

(declare-fun m!328203 () Bool)

(assert (=> b!319369 m!328203))

(declare-fun m!328205 () Bool)

(assert (=> b!319370 m!328205))

(declare-fun m!328207 () Bool)

(assert (=> b!319371 m!328207))

(declare-fun m!328209 () Bool)

(assert (=> start!31968 m!328209))

(declare-fun m!328211 () Bool)

(assert (=> start!31968 m!328211))

(push 1)

(assert (not b!319369))

(assert (not b!319371))

(assert (not b!319370))

(assert (not start!31968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

