; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25406 () Bool)

(assert start!25406)

(declare-fun res!129171 () Bool)

(declare-fun e!171473 () Bool)

(assert (=> start!25406 (=> (not res!129171) (not e!171473))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25406 (= res!129171 (validMask!0 mask!4002))))

(assert (=> start!25406 e!171473))

(assert (=> start!25406 true))

(declare-datatypes ((array!12697 0))(
  ( (array!12698 (arr!6007 (Array (_ BitVec 32) (_ BitVec 64))) (size!6359 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12697)

(declare-fun array_inv!3957 (array!12697) Bool)

(assert (=> start!25406 (array_inv!3957 a!3436)))

(declare-fun b!264683 () Bool)

(declare-fun res!129168 () Bool)

(assert (=> b!264683 (=> (not res!129168) (not e!171473))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264683 (= res!129168 (validKeyInArray!0 k0!2698))))

(declare-fun b!264685 () Bool)

(assert (=> b!264685 (= e!171473 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264682 () Bool)

(declare-fun res!129169 () Bool)

(assert (=> b!264682 (=> (not res!129169) (not e!171473))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264682 (= res!129169 (and (= (size!6359 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6359 a!3436))))))

(declare-fun b!264684 () Bool)

(declare-fun res!129170 () Bool)

(assert (=> b!264684 (=> (not res!129170) (not e!171473))))

(declare-fun arrayContainsKey!0 (array!12697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264684 (= res!129170 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25406 res!129171) b!264682))

(assert (= (and b!264682 res!129169) b!264683))

(assert (= (and b!264683 res!129168) b!264684))

(assert (= (and b!264684 res!129170) b!264685))

(declare-fun m!281843 () Bool)

(assert (=> start!25406 m!281843))

(declare-fun m!281845 () Bool)

(assert (=> start!25406 m!281845))

(declare-fun m!281847 () Bool)

(assert (=> b!264683 m!281847))

(declare-fun m!281849 () Bool)

(assert (=> b!264684 m!281849))

(check-sat (not b!264683) (not b!264684) (not start!25406))
(check-sat)
