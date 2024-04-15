; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36310 () Bool)

(assert start!36310)

(declare-fun res!202562 () Bool)

(declare-fun e!222411 () Bool)

(assert (=> start!36310 (=> (not res!202562) (not e!222411))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20586 0))(
  ( (array!20587 (arr!9772 (Array (_ BitVec 32) (_ BitVec 64))) (size!10125 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20586)

(assert (=> start!36310 (= res!202562 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10125 a!4289))))))

(assert (=> start!36310 e!222411))

(assert (=> start!36310 true))

(declare-fun array_inv!7221 (array!20586) Bool)

(assert (=> start!36310 (array_inv!7221 a!4289)))

(declare-fun b!363259 () Bool)

(declare-fun res!202564 () Bool)

(assert (=> b!363259 (=> (not res!202564) (not e!222411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363259 (= res!202564 (not (validKeyInArray!0 (select (arr!9772 a!4289) i!1472))))))

(declare-fun b!363260 () Bool)

(declare-fun res!202563 () Bool)

(assert (=> b!363260 (=> (not res!202563) (not e!222411))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363260 (= res!202563 (validKeyInArray!0 k0!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363261 () Bool)

(assert (=> b!363261 (= e!222411 (and (bvslt (size!10125 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10125 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36310 res!202562) b!363259))

(assert (= (and b!363259 res!202564) b!363260))

(assert (= (and b!363260 res!202563) b!363261))

(declare-fun m!359935 () Bool)

(assert (=> start!36310 m!359935))

(declare-fun m!359937 () Bool)

(assert (=> b!363259 m!359937))

(assert (=> b!363259 m!359937))

(declare-fun m!359939 () Bool)

(assert (=> b!363259 m!359939))

(declare-fun m!359941 () Bool)

(assert (=> b!363260 m!359941))

(check-sat (not start!36310) (not b!363260) (not b!363259))
(check-sat)
