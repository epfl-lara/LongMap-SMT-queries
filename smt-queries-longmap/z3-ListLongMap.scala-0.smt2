; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4 () Bool)

(assert start!4)

(assert (=> start!4 false))

(check-sat)
