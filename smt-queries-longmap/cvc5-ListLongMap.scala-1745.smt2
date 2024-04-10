; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31990 () Bool)

(assert start!31990)

(declare-fun b!319470 () Bool)

(declare-fun res!173855 () Bool)

(declare-fun e!198417 () Bool)

(assert (=> b!319470 (=> (not res!173855) (not e!198417))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319470 (= res!173855 (validKeyInArray!0 k!2497))))

(declare-fun b!319472 () Bool)

(assert (=> b!319472 (= e!198417 false)))

(declare-datatypes ((array!16297 0))(
  ( (array!16298 (arr!7712 (Array (_ BitVec 32) (_ BitVec 64))) (size!8064 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16297)

(declare-datatypes ((SeekEntryResult!2843 0))(
  ( (MissingZero!2843 (index!13548 (_ BitVec 32))) (Found!2843 (index!13549 (_ BitVec 32))) (Intermediate!2843 (undefined!3655 Bool) (index!13550 (_ BitVec 32)) (x!31829 (_ BitVec 32))) (Undefined!2843) (MissingVacant!2843 (index!13551 (_ BitVec 32))) )
))
(declare-fun lt!155808 () SeekEntryResult!2843)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16297 (_ BitVec 32)) SeekEntryResult!2843)

(assert (=> b!319472 (= lt!155808 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319469 () Bool)

(declare-fun res!173854 () Bool)

(assert (=> b!319469 (=> (not res!173854) (not e!198417))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319469 (= res!173854 (and (= (size!8064 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8064 a!3305))))))

(declare-fun b!319471 () Bool)

(declare-fun res!173856 () Bool)

(assert (=> b!319471 (=> (not res!173856) (not e!198417))))

(declare-fun arrayContainsKey!0 (array!16297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319471 (= res!173856 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173853 () Bool)

(assert (=> start!31990 (=> (not res!173853) (not e!198417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31990 (= res!173853 (validMask!0 mask!3777))))

(assert (=> start!31990 e!198417))

(assert (=> start!31990 true))

(declare-fun array_inv!5675 (array!16297) Bool)

(assert (=> start!31990 (array_inv!5675 a!3305)))

(assert (= (and start!31990 res!173853) b!319469))

(assert (= (and b!319469 res!173854) b!319470))

(assert (= (and b!319470 res!173855) b!319471))

(assert (= (and b!319471 res!173856) b!319472))

(declare-fun m!328067 () Bool)

(assert (=> b!319470 m!328067))

(declare-fun m!328069 () Bool)

(assert (=> b!319472 m!328069))

(declare-fun m!328071 () Bool)

(assert (=> b!319471 m!328071))

(declare-fun m!328073 () Bool)

(assert (=> start!31990 m!328073))

(declare-fun m!328075 () Bool)

(assert (=> start!31990 m!328075))

(push 1)

(assert (not b!319470))

(assert (not b!319471))

(assert (not start!31990))

(assert (not b!319472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

