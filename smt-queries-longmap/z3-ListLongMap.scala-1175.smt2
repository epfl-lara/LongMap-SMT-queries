; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25380 () Bool)

(assert start!25380)

(declare-fun res!129114 () Bool)

(declare-fun e!171436 () Bool)

(assert (=> start!25380 (=> (not res!129114) (not e!171436))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25380 (= res!129114 (validMask!0 mask!4002))))

(assert (=> start!25380 e!171436))

(assert (=> start!25380 true))

(declare-datatypes ((array!12683 0))(
  ( (array!12684 (arr!6001 (Array (_ BitVec 32) (_ BitVec 64))) (size!6353 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12683)

(declare-fun array_inv!3951 (array!12683) Bool)

(assert (=> start!25380 (array_inv!3951 a!3436)))

(declare-fun b!264626 () Bool)

(declare-fun res!129112 () Bool)

(assert (=> b!264626 (=> (not res!129112) (not e!171436))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264626 (= res!129112 (and (= (size!6353 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6353 a!3436))))))

(declare-fun b!264627 () Bool)

(declare-fun res!129113 () Bool)

(assert (=> b!264627 (=> (not res!129113) (not e!171436))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264627 (= res!129113 (validKeyInArray!0 k0!2698))))

(declare-fun b!264628 () Bool)

(assert (=> b!264628 (= e!171436 (bvsge #b00000000000000000000000000000000 (size!6353 a!3436)))))

(assert (= (and start!25380 res!129114) b!264626))

(assert (= (and b!264626 res!129112) b!264627))

(assert (= (and b!264627 res!129113) b!264628))

(declare-fun m!281807 () Bool)

(assert (=> start!25380 m!281807))

(declare-fun m!281809 () Bool)

(assert (=> start!25380 m!281809))

(declare-fun m!281811 () Bool)

(assert (=> b!264627 m!281811))

(check-sat (not b!264627) (not start!25380))
(check-sat)
