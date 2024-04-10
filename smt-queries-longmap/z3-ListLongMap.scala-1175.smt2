; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25378 () Bool)

(assert start!25378)

(declare-fun res!129100 () Bool)

(declare-fun e!171418 () Bool)

(assert (=> start!25378 (=> (not res!129100) (not e!171418))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25378 (= res!129100 (validMask!0 mask!4002))))

(assert (=> start!25378 e!171418))

(assert (=> start!25378 true))

(declare-datatypes ((array!12687 0))(
  ( (array!12688 (arr!6003 (Array (_ BitVec 32) (_ BitVec 64))) (size!6355 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12687)

(declare-fun array_inv!3966 (array!12687) Bool)

(assert (=> start!25378 (array_inv!3966 a!3436)))

(declare-fun b!264588 () Bool)

(declare-fun res!129102 () Bool)

(assert (=> b!264588 (=> (not res!129102) (not e!171418))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264588 (= res!129102 (and (= (size!6355 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6355 a!3436))))))

(declare-fun b!264589 () Bool)

(declare-fun res!129101 () Bool)

(assert (=> b!264589 (=> (not res!129101) (not e!171418))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264589 (= res!129101 (validKeyInArray!0 k0!2698))))

(declare-fun b!264590 () Bool)

(assert (=> b!264590 (= e!171418 (bvsge #b00000000000000000000000000000000 (size!6355 a!3436)))))

(assert (= (and start!25378 res!129100) b!264588))

(assert (= (and b!264588 res!129102) b!264589))

(assert (= (and b!264589 res!129101) b!264590))

(declare-fun m!281631 () Bool)

(assert (=> start!25378 m!281631))

(declare-fun m!281633 () Bool)

(assert (=> start!25378 m!281633))

(declare-fun m!281635 () Bool)

(assert (=> b!264589 m!281635))

(check-sat (not start!25378) (not b!264589))
(check-sat)
