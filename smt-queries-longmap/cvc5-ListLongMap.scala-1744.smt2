; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31974 () Bool)

(assert start!31974)

(declare-fun b!319182 () Bool)

(declare-fun res!173713 () Bool)

(declare-fun e!198236 () Bool)

(assert (=> b!319182 (=> (not res!173713) (not e!198236))))

(declare-datatypes ((array!16285 0))(
  ( (array!16286 (arr!7706 (Array (_ BitVec 32) (_ BitVec 64))) (size!8059 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16285)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319182 (= res!173713 (and (= (size!8059 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8059 a!3305))))))

(declare-fun res!173714 () Bool)

(assert (=> start!31974 (=> (not res!173714) (not e!198236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31974 (= res!173714 (validMask!0 mask!3777))))

(assert (=> start!31974 e!198236))

(assert (=> start!31974 true))

(declare-fun array_inv!5678 (array!16285) Bool)

(assert (=> start!31974 (array_inv!5678 a!3305)))

(declare-fun b!319185 () Bool)

(assert (=> b!319185 (= e!198236 false)))

(declare-datatypes ((SeekEntryResult!2836 0))(
  ( (MissingZero!2836 (index!13520 (_ BitVec 32))) (Found!2836 (index!13521 (_ BitVec 32))) (Intermediate!2836 (undefined!3648 Bool) (index!13522 (_ BitVec 32)) (x!31809 (_ BitVec 32))) (Undefined!2836) (MissingVacant!2836 (index!13523 (_ BitVec 32))) )
))
(declare-fun lt!155570 () SeekEntryResult!2836)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16285 (_ BitVec 32)) SeekEntryResult!2836)

(assert (=> b!319185 (= lt!155570 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319184 () Bool)

(declare-fun res!173712 () Bool)

(assert (=> b!319184 (=> (not res!173712) (not e!198236))))

(declare-fun arrayContainsKey!0 (array!16285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319184 (= res!173712 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319183 () Bool)

(declare-fun res!173715 () Bool)

(assert (=> b!319183 (=> (not res!173715) (not e!198236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319183 (= res!173715 (validKeyInArray!0 k!2497))))

(assert (= (and start!31974 res!173714) b!319182))

(assert (= (and b!319182 res!173713) b!319183))

(assert (= (and b!319183 res!173715) b!319184))

(assert (= (and b!319184 res!173712) b!319185))

(declare-fun m!327327 () Bool)

(assert (=> start!31974 m!327327))

(declare-fun m!327329 () Bool)

(assert (=> start!31974 m!327329))

(declare-fun m!327331 () Bool)

(assert (=> b!319185 m!327331))

(declare-fun m!327333 () Bool)

(assert (=> b!319184 m!327333))

(declare-fun m!327335 () Bool)

(assert (=> b!319183 m!327335))

(push 1)

(assert (not b!319183))

(assert (not b!319185))

(assert (not b!319184))

(assert (not start!31974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

