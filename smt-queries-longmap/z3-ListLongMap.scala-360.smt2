; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6964 () Bool)

(assert start!6964)

(declare-datatypes ((array!2955 0))(
  ( (array!2956 (arr!1421 (Array (_ BitVec 32) (_ BitVec 64))) (size!1639 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2955)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6964 (and (bvslt (size!1639 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1639 a!4412)) (= (size!1639 a!4412) size!30) (bvslt size!30 #b00000000000000000000000000000000))))

(declare-fun array_inv!844 (array!2955) Bool)

(assert (=> start!6964 (array_inv!844 a!4412)))

(assert (=> start!6964 true))

(declare-fun bs!2080 () Bool)

(assert (= bs!2080 start!6964))

(declare-fun m!39653 () Bool)

(assert (=> bs!2080 m!39653))

(check-sat (not start!6964))
(check-sat)
