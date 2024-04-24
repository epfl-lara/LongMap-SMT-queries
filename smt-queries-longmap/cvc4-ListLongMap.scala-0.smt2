; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6 () Bool)

(assert start!6)

(assert (=> start!6 false))

(push 1)

(check-sat)

(pop 1)

