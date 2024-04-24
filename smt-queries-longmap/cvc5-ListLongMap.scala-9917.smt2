; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117506 () Bool)

(assert start!117506)

(declare-fun res!922596 () Bool)

(declare-fun e!782405 () Bool)

(assert (=> start!117506 (=> (not res!922596) (not e!782405))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93986 0))(
  ( (array!93987 (arr!45387 (Array (_ BitVec 32) (_ BitVec 64))) (size!45938 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93986)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117506 (= res!922596 (and (bvslt (size!45938 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45938 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117506 e!782405))

(declare-fun array_inv!34668 (array!93986) Bool)

(assert (=> start!117506 (array_inv!34668 a!4010)))

(assert (=> start!117506 true))

(declare-fun b!1380947 () Bool)

(assert (=> b!1380947 (= e!782405 false)))

(declare-fun lt!608170 () Bool)

(declare-fun isPivot!0 (array!93986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380947 (= lt!608170 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and start!117506 res!922596) b!1380947))

(declare-fun m!1266441 () Bool)

(assert (=> start!117506 m!1266441))

(declare-fun m!1266443 () Bool)

(assert (=> b!1380947 m!1266443))

(push 1)

(assert (not start!117506))

(assert (not b!1380947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

