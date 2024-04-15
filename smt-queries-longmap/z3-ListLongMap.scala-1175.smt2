; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25380 () Bool)

(assert start!25380)

(declare-fun res!128997 () Bool)

(declare-fun e!171311 () Bool)

(assert (=> start!25380 (=> (not res!128997) (not e!171311))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25380 (= res!128997 (validMask!0 mask!4002))))

(assert (=> start!25380 e!171311))

(assert (=> start!25380 true))

(declare-datatypes ((array!12677 0))(
  ( (array!12678 (arr!5997 (Array (_ BitVec 32) (_ BitVec 64))) (size!6350 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12677)

(declare-fun array_inv!3969 (array!12677) Bool)

(assert (=> start!25380 (array_inv!3969 a!3436)))

(declare-fun b!264432 () Bool)

(declare-fun res!128998 () Bool)

(assert (=> b!264432 (=> (not res!128998) (not e!171311))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264432 (= res!128998 (and (= (size!6350 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6350 a!3436))))))

(declare-fun b!264433 () Bool)

(declare-fun res!128996 () Bool)

(assert (=> b!264433 (=> (not res!128996) (not e!171311))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264433 (= res!128996 (validKeyInArray!0 k0!2698))))

(declare-fun b!264434 () Bool)

(assert (=> b!264434 (= e!171311 (bvsge #b00000000000000000000000000000000 (size!6350 a!3436)))))

(assert (= (and start!25380 res!128997) b!264432))

(assert (= (and b!264432 res!128998) b!264433))

(assert (= (and b!264433 res!128996) b!264434))

(declare-fun m!281009 () Bool)

(assert (=> start!25380 m!281009))

(declare-fun m!281011 () Bool)

(assert (=> start!25380 m!281011))

(declare-fun m!281013 () Bool)

(assert (=> b!264433 m!281013))

(check-sat (not start!25380) (not b!264433))
(check-sat)
