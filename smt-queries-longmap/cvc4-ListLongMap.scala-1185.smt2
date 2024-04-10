; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25454 () Bool)

(assert start!25454)

(declare-fun b!264957 () Bool)

(declare-fun res!129470 () Bool)

(declare-fun e!171605 () Bool)

(assert (=> b!264957 (=> (not res!129470) (not e!171605))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264957 (= res!129470 (validKeyInArray!0 k!2698))))

(declare-datatypes ((array!12750 0))(
  ( (array!12751 (arr!6034 (Array (_ BitVec 32) (_ BitVec 64))) (size!6386 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12750)

(declare-datatypes ((SeekEntryResult!1225 0))(
  ( (MissingZero!1225 (index!7070 (_ BitVec 32))) (Found!1225 (index!7071 (_ BitVec 32))) (Intermediate!1225 (undefined!2037 Bool) (index!7072 (_ BitVec 32)) (x!25390 (_ BitVec 32))) (Undefined!1225) (MissingVacant!1225 (index!7073 (_ BitVec 32))) )
))
(declare-fun lt!133948 () SeekEntryResult!1225)

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun b!264959 () Bool)

(assert (=> b!264959 (= e!171605 (and (or (= lt!133948 (MissingZero!1225 i!1355)) (= lt!133948 (MissingVacant!1225 i!1355))) (bvsgt #b00000000000000000000000000000000 (size!6386 a!3436))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12750 (_ BitVec 32)) SeekEntryResult!1225)

(assert (=> b!264959 (= lt!133948 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264956 () Bool)

(declare-fun res!129469 () Bool)

(assert (=> b!264956 (=> (not res!129469) (not e!171605))))

(assert (=> b!264956 (= res!129469 (and (= (size!6386 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6386 a!3436))))))

(declare-fun b!264958 () Bool)

(declare-fun res!129471 () Bool)

(assert (=> b!264958 (=> (not res!129471) (not e!171605))))

(declare-fun arrayContainsKey!0 (array!12750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264958 (= res!129471 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129468 () Bool)

(assert (=> start!25454 (=> (not res!129468) (not e!171605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25454 (= res!129468 (validMask!0 mask!4002))))

(assert (=> start!25454 e!171605))

(assert (=> start!25454 true))

(declare-fun array_inv!3997 (array!12750) Bool)

(assert (=> start!25454 (array_inv!3997 a!3436)))

(assert (= (and start!25454 res!129468) b!264956))

(assert (= (and b!264956 res!129469) b!264957))

(assert (= (and b!264957 res!129470) b!264958))

(assert (= (and b!264958 res!129471) b!264959))

(declare-fun m!281915 () Bool)

(assert (=> b!264957 m!281915))

(declare-fun m!281917 () Bool)

(assert (=> b!264959 m!281917))

(declare-fun m!281919 () Bool)

(assert (=> b!264958 m!281919))

(declare-fun m!281921 () Bool)

(assert (=> start!25454 m!281921))

(declare-fun m!281923 () Bool)

(assert (=> start!25454 m!281923))

(push 1)

(assert (not b!264959))

(assert (not b!264958))

(assert (not start!25454))

(assert (not b!264957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

