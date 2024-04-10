; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69692 () Bool)

(assert start!69692)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44113 0))(
  ( (array!44114 (arr!21126 (Array (_ BitVec 32) (_ BitVec 64))) (size!21547 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44113)

(assert (=> start!69692 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21547 a!4395)) (bvslt (size!21547 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsgt from!3750 to!546))))

(assert (=> start!69692 true))

(declare-fun array_inv!16922 (array!44113) Bool)

(assert (=> start!69692 (array_inv!16922 a!4395)))

(declare-fun bs!22480 () Bool)

(assert (= bs!22480 start!69692))

(declare-fun m!754307 () Bool)

(assert (=> bs!22480 m!754307))

(push 1)

(assert (not start!69692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

