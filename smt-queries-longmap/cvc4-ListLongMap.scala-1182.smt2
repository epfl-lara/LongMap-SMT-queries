; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25436 () Bool)

(assert start!25436)

(declare-fun res!129360 () Bool)

(declare-fun e!171551 () Bool)

(assert (=> start!25436 (=> (not res!129360) (not e!171551))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25436 (= res!129360 (validMask!0 mask!4002))))

(assert (=> start!25436 e!171551))

(assert (=> start!25436 true))

(declare-datatypes ((array!12732 0))(
  ( (array!12733 (arr!6025 (Array (_ BitVec 32) (_ BitVec 64))) (size!6377 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12732)

(declare-fun array_inv!3988 (array!12732) Bool)

(assert (=> start!25436 (array_inv!3988 a!3436)))

(declare-fun b!264850 () Bool)

(declare-fun res!129362 () Bool)

(assert (=> b!264850 (=> (not res!129362) (not e!171551))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264850 (= res!129362 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264849 () Bool)

(declare-fun res!129361 () Bool)

(assert (=> b!264849 (=> (not res!129361) (not e!171551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264849 (= res!129361 (validKeyInArray!0 k!2698))))

(declare-fun b!264848 () Bool)

(declare-fun res!129363 () Bool)

(assert (=> b!264848 (=> (not res!129363) (not e!171551))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264848 (= res!129363 (and (= (size!6377 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6377 a!3436))))))

(declare-fun b!264851 () Bool)

(assert (=> b!264851 (= e!171551 false)))

(declare-datatypes ((SeekEntryResult!1216 0))(
  ( (MissingZero!1216 (index!7034 (_ BitVec 32))) (Found!1216 (index!7035 (_ BitVec 32))) (Intermediate!1216 (undefined!2028 Bool) (index!7036 (_ BitVec 32)) (x!25357 (_ BitVec 32))) (Undefined!1216) (MissingVacant!1216 (index!7037 (_ BitVec 32))) )
))
(declare-fun lt!133921 () SeekEntryResult!1216)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12732 (_ BitVec 32)) SeekEntryResult!1216)

(assert (=> b!264851 (= lt!133921 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25436 res!129360) b!264848))

(assert (= (and b!264848 res!129363) b!264849))

(assert (= (and b!264849 res!129361) b!264850))

(assert (= (and b!264850 res!129362) b!264851))

(declare-fun m!281825 () Bool)

(assert (=> start!25436 m!281825))

(declare-fun m!281827 () Bool)

(assert (=> start!25436 m!281827))

(declare-fun m!281829 () Bool)

(assert (=> b!264850 m!281829))

(declare-fun m!281831 () Bool)

(assert (=> b!264849 m!281831))

(declare-fun m!281833 () Bool)

(assert (=> b!264851 m!281833))

(push 1)

(assert (not start!25436))

(assert (not b!264850))

(assert (not b!264849))

(assert (not b!264851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

