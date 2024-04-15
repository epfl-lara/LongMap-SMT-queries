; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31932 () Bool)

(assert start!31932)

(declare-fun res!173562 () Bool)

(declare-fun e!198151 () Bool)

(assert (=> start!31932 (=> (not res!173562) (not e!198151))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31932 (= res!173562 (validMask!0 mask!3777))))

(assert (=> start!31932 e!198151))

(assert (=> start!31932 true))

(declare-datatypes ((array!16256 0))(
  ( (array!16257 (arr!7692 (Array (_ BitVec 32) (_ BitVec 64))) (size!8045 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16256)

(declare-fun array_inv!5664 (array!16256) Bool)

(assert (=> start!31932 (array_inv!5664 a!3305)))

(declare-fun b!319030 () Bool)

(declare-fun res!173560 () Bool)

(assert (=> b!319030 (=> (not res!173560) (not e!198151))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319030 (= res!173560 (and (= (size!8045 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8045 a!3305))))))

(declare-fun b!319031 () Bool)

(declare-fun res!173561 () Bool)

(assert (=> b!319031 (=> (not res!173561) (not e!198151))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319031 (= res!173561 (validKeyInArray!0 k0!2497))))

(declare-fun b!319032 () Bool)

(assert (=> b!319032 (= e!198151 (bvsge #b00000000000000000000000000000000 (size!8045 a!3305)))))

(assert (= (and start!31932 res!173562) b!319030))

(assert (= (and b!319030 res!173560) b!319031))

(assert (= (and b!319031 res!173561) b!319032))

(declare-fun m!327217 () Bool)

(assert (=> start!31932 m!327217))

(declare-fun m!327219 () Bool)

(assert (=> start!31932 m!327219))

(declare-fun m!327221 () Bool)

(assert (=> b!319031 m!327221))

(check-sat (not start!31932) (not b!319031))
(check-sat)
