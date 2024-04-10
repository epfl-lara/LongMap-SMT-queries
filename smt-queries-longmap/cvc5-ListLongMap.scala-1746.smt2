; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31996 () Bool)

(assert start!31996)

(declare-fun b!319507 () Bool)

(declare-fun res!173891 () Bool)

(declare-fun e!198436 () Bool)

(assert (=> b!319507 (=> (not res!173891) (not e!198436))))

(declare-datatypes ((array!16303 0))(
  ( (array!16304 (arr!7715 (Array (_ BitVec 32) (_ BitVec 64))) (size!8067 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16303)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319507 (= res!173891 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319508 () Bool)

(assert (=> b!319508 (= e!198436 (bvsgt #b00000000000000000000000000000000 (size!8067 a!3305)))))

(declare-fun b!319509 () Bool)

(declare-fun res!173892 () Bool)

(assert (=> b!319509 (=> (not res!173892) (not e!198436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319509 (= res!173892 (validKeyInArray!0 k!2497))))

(declare-fun b!319511 () Bool)

(declare-fun res!173895 () Bool)

(assert (=> b!319511 (=> (not res!173895) (not e!198436))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319511 (= res!173895 (and (= (size!8067 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8067 a!3305))))))

(declare-fun b!319510 () Bool)

(declare-fun res!173893 () Bool)

(assert (=> b!319510 (=> (not res!173893) (not e!198436))))

(declare-datatypes ((SeekEntryResult!2846 0))(
  ( (MissingZero!2846 (index!13560 (_ BitVec 32))) (Found!2846 (index!13561 (_ BitVec 32))) (Intermediate!2846 (undefined!3658 Bool) (index!13562 (_ BitVec 32)) (x!31840 (_ BitVec 32))) (Undefined!2846) (MissingVacant!2846 (index!13563 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16303 (_ BitVec 32)) SeekEntryResult!2846)

(assert (=> b!319510 (= res!173893 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2846 i!1250)))))

(declare-fun res!173894 () Bool)

(assert (=> start!31996 (=> (not res!173894) (not e!198436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31996 (= res!173894 (validMask!0 mask!3777))))

(assert (=> start!31996 e!198436))

(assert (=> start!31996 true))

(declare-fun array_inv!5678 (array!16303) Bool)

(assert (=> start!31996 (array_inv!5678 a!3305)))

(assert (= (and start!31996 res!173894) b!319511))

(assert (= (and b!319511 res!173895) b!319509))

(assert (= (and b!319509 res!173892) b!319507))

(assert (= (and b!319507 res!173891) b!319510))

(assert (= (and b!319510 res!173893) b!319508))

(declare-fun m!328097 () Bool)

(assert (=> b!319507 m!328097))

(declare-fun m!328099 () Bool)

(assert (=> b!319509 m!328099))

(declare-fun m!328101 () Bool)

(assert (=> b!319510 m!328101))

(declare-fun m!328103 () Bool)

(assert (=> start!31996 m!328103))

(declare-fun m!328105 () Bool)

(assert (=> start!31996 m!328105))

(push 1)

(assert (not start!31996))

(assert (not b!319507))

(assert (not b!319510))

(assert (not b!319509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

