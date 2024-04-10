; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25404 () Bool)

(assert start!25404)

(declare-fun b!264650 () Bool)

(declare-fun e!171455 () Bool)

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!264650 (= e!171455 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun res!129160 () Bool)

(assert (=> start!25404 (=> (not res!129160) (not e!171455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25404 (= res!129160 (validMask!0 mask!4002))))

(assert (=> start!25404 e!171455))

(assert (=> start!25404 true))

(declare-datatypes ((array!12700 0))(
  ( (array!12701 (arr!6009 (Array (_ BitVec 32) (_ BitVec 64))) (size!6361 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12700)

(declare-fun array_inv!3972 (array!12700) Bool)

(assert (=> start!25404 (array_inv!3972 a!3436)))

(declare-fun b!264648 () Bool)

(declare-fun res!129162 () Bool)

(assert (=> b!264648 (=> (not res!129162) (not e!171455))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264648 (= res!129162 (validKeyInArray!0 k0!2698))))

(declare-fun b!264647 () Bool)

(declare-fun res!129159 () Bool)

(assert (=> b!264647 (=> (not res!129159) (not e!171455))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264647 (= res!129159 (and (= (size!6361 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6361 a!3436))))))

(declare-fun b!264649 () Bool)

(declare-fun res!129161 () Bool)

(assert (=> b!264649 (=> (not res!129161) (not e!171455))))

(declare-fun arrayContainsKey!0 (array!12700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264649 (= res!129161 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25404 res!129160) b!264647))

(assert (= (and b!264647 res!129159) b!264648))

(assert (= (and b!264648 res!129162) b!264649))

(assert (= (and b!264649 res!129161) b!264650))

(declare-fun m!281669 () Bool)

(assert (=> start!25404 m!281669))

(declare-fun m!281671 () Bool)

(assert (=> start!25404 m!281671))

(declare-fun m!281673 () Bool)

(assert (=> b!264648 m!281673))

(declare-fun m!281675 () Bool)

(assert (=> b!264649 m!281675))

(check-sat (not start!25404) (not b!264648) (not b!264649))
(check-sat)
