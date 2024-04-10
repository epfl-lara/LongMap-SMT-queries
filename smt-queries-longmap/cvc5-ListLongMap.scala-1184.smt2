; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25444 () Bool)

(assert start!25444)

(declare-fun res!129410 () Bool)

(declare-fun e!171575 () Bool)

(assert (=> start!25444 (=> (not res!129410) (not e!171575))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25444 (= res!129410 (validMask!0 mask!4002))))

(assert (=> start!25444 e!171575))

(assert (=> start!25444 true))

(declare-datatypes ((array!12740 0))(
  ( (array!12741 (arr!6029 (Array (_ BitVec 32) (_ BitVec 64))) (size!6381 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12740)

(declare-fun array_inv!3992 (array!12740) Bool)

(assert (=> start!25444 (array_inv!3992 a!3436)))

(declare-fun b!264896 () Bool)

(declare-fun res!129409 () Bool)

(assert (=> b!264896 (=> (not res!129409) (not e!171575))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264896 (= res!129409 (and (= (size!6381 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6381 a!3436))))))

(declare-fun b!264897 () Bool)

(declare-fun res!129411 () Bool)

(assert (=> b!264897 (=> (not res!129411) (not e!171575))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264897 (= res!129411 (validKeyInArray!0 k!2698))))

(declare-fun b!264899 () Bool)

(assert (=> b!264899 (= e!171575 false)))

(declare-datatypes ((SeekEntryResult!1220 0))(
  ( (MissingZero!1220 (index!7050 (_ BitVec 32))) (Found!1220 (index!7051 (_ BitVec 32))) (Intermediate!1220 (undefined!2032 Bool) (index!7052 (_ BitVec 32)) (x!25377 (_ BitVec 32))) (Undefined!1220) (MissingVacant!1220 (index!7053 (_ BitVec 32))) )
))
(declare-fun lt!133933 () SeekEntryResult!1220)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12740 (_ BitVec 32)) SeekEntryResult!1220)

(assert (=> b!264899 (= lt!133933 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264898 () Bool)

(declare-fun res!129408 () Bool)

(assert (=> b!264898 (=> (not res!129408) (not e!171575))))

(declare-fun arrayContainsKey!0 (array!12740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264898 (= res!129408 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25444 res!129410) b!264896))

(assert (= (and b!264896 res!129409) b!264897))

(assert (= (and b!264897 res!129411) b!264898))

(assert (= (and b!264898 res!129408) b!264899))

(declare-fun m!281865 () Bool)

(assert (=> start!25444 m!281865))

(declare-fun m!281867 () Bool)

(assert (=> start!25444 m!281867))

(declare-fun m!281869 () Bool)

(assert (=> b!264897 m!281869))

(declare-fun m!281871 () Bool)

(assert (=> b!264899 m!281871))

(declare-fun m!281873 () Bool)

(assert (=> b!264898 m!281873))

(push 1)

(assert (not b!264899))

(assert (not b!264898))

(assert (not start!25444))

(assert (not b!264897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

