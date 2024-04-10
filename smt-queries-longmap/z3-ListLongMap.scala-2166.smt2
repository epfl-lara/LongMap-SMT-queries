; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36332 () Bool)

(assert start!36332)

(declare-fun res!202727 () Bool)

(declare-fun e!222609 () Bool)

(assert (=> start!36332 (=> (not res!202727) (not e!222609))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20612 0))(
  ( (array!20613 (arr!9785 (Array (_ BitVec 32) (_ BitVec 64))) (size!10137 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20612)

(assert (=> start!36332 (= res!202727 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10137 a!4289))))))

(assert (=> start!36332 e!222609))

(assert (=> start!36332 true))

(declare-fun array_inv!7227 (array!20612) Bool)

(assert (=> start!36332 (array_inv!7227 a!4289)))

(declare-fun b!363566 () Bool)

(declare-fun res!202728 () Bool)

(assert (=> b!363566 (=> (not res!202728) (not e!222609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363566 (= res!202728 (not (validKeyInArray!0 (select (arr!9785 a!4289) i!1472))))))

(declare-fun b!363567 () Bool)

(declare-fun res!202729 () Bool)

(assert (=> b!363567 (=> (not res!202729) (not e!222609))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363567 (= res!202729 (validKeyInArray!0 k0!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363568 () Bool)

(assert (=> b!363568 (= e!222609 (and (bvslt (size!10137 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10137 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36332 res!202727) b!363566))

(assert (= (and b!363566 res!202728) b!363567))

(assert (= (and b!363567 res!202729) b!363568))

(declare-fun m!360691 () Bool)

(assert (=> start!36332 m!360691))

(declare-fun m!360693 () Bool)

(assert (=> b!363566 m!360693))

(assert (=> b!363566 m!360693))

(declare-fun m!360695 () Bool)

(assert (=> b!363566 m!360695))

(declare-fun m!360697 () Bool)

(assert (=> b!363567 m!360697))

(check-sat (not b!363567) (not start!36332) (not b!363566))
(check-sat)
