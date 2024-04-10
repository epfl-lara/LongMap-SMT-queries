; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25408 () Bool)

(assert start!25408)

(declare-fun b!264672 () Bool)

(declare-fun res!129184 () Bool)

(declare-fun e!171466 () Bool)

(assert (=> b!264672 (=> (not res!129184) (not e!171466))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264672 (= res!129184 (validKeyInArray!0 k!2698))))

(declare-fun res!129183 () Bool)

(assert (=> start!25408 (=> (not res!129183) (not e!171466))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25408 (= res!129183 (validMask!0 mask!4002))))

(assert (=> start!25408 e!171466))

(assert (=> start!25408 true))

(declare-datatypes ((array!12704 0))(
  ( (array!12705 (arr!6011 (Array (_ BitVec 32) (_ BitVec 64))) (size!6363 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12704)

(declare-fun array_inv!3974 (array!12704) Bool)

(assert (=> start!25408 (array_inv!3974 a!3436)))

(declare-fun b!264674 () Bool)

(assert (=> b!264674 (= e!171466 false)))

(declare-datatypes ((SeekEntryResult!1202 0))(
  ( (MissingZero!1202 (index!6978 (_ BitVec 32))) (Found!1202 (index!6979 (_ BitVec 32))) (Intermediate!1202 (undefined!2014 Bool) (index!6980 (_ BitVec 32)) (x!25311 (_ BitVec 32))) (Undefined!1202) (MissingVacant!1202 (index!6981 (_ BitVec 32))) )
))
(declare-fun lt!133888 () SeekEntryResult!1202)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12704 (_ BitVec 32)) SeekEntryResult!1202)

(assert (=> b!264674 (= lt!133888 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264673 () Bool)

(declare-fun res!129185 () Bool)

(assert (=> b!264673 (=> (not res!129185) (not e!171466))))

(declare-fun arrayContainsKey!0 (array!12704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264673 (= res!129185 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264671 () Bool)

(declare-fun res!129186 () Bool)

(assert (=> b!264671 (=> (not res!129186) (not e!171466))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264671 (= res!129186 (and (= (size!6363 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6363 a!3436))))))

(assert (= (and start!25408 res!129183) b!264671))

(assert (= (and b!264671 res!129186) b!264672))

(assert (= (and b!264672 res!129184) b!264673))

(assert (= (and b!264673 res!129185) b!264674))

(declare-fun m!281685 () Bool)

(assert (=> b!264672 m!281685))

(declare-fun m!281687 () Bool)

(assert (=> start!25408 m!281687))

(declare-fun m!281689 () Bool)

(assert (=> start!25408 m!281689))

(declare-fun m!281691 () Bool)

(assert (=> b!264674 m!281691))

(declare-fun m!281693 () Bool)

(assert (=> b!264673 m!281693))

(push 1)

(assert (not b!264672))

(assert (not b!264673))

(assert (not start!25408))

(assert (not b!264674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

