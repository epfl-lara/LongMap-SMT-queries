; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69690 () Bool)

(assert start!69690)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44128 0))(
  ( (array!44129 (arr!21134 (Array (_ BitVec 32) (_ BitVec 64))) (size!21555 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44128)

(assert (=> start!69690 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21555 a!4395)) (bvslt (size!21555 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvsge (bvsub to!546 (bvadd #b00000000000000000000000000000001 from!3750)) (bvsub to!546 from!3750)))))

(assert (=> start!69690 true))

(declare-fun array_inv!17017 (array!44128) Bool)

(assert (=> start!69690 (array_inv!17017 a!4395)))

(declare-fun bs!22467 () Bool)

(assert (= bs!22467 start!69690))

(declare-fun m!753583 () Bool)

(assert (=> bs!22467 m!753583))

(check-sat (not start!69690))
(check-sat)
