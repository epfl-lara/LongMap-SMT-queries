; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116932 () Bool)

(assert start!116932)

(declare-datatypes ((array!93601 0))(
  ( (array!93602 (arr!45204 (Array (_ BitVec 32) (_ BitVec 64))) (size!45754 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93601)

(declare-fun from!3579 () (_ BitVec 32))

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!116932 (and (bvslt (size!45754 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45754 a!4212)) (bvslt to!375 #b00000000000000000000000000000000))))

(declare-fun array_inv!34232 (array!93601) Bool)

(assert (=> start!116932 (array_inv!34232 a!4212)))

(assert (=> start!116932 true))

(declare-fun bs!39598 () Bool)

(assert (= bs!39598 start!116932))

(declare-fun m!1262047 () Bool)

(assert (=> bs!39598 m!1262047))

(check-sat (not start!116932))
(check-sat)
