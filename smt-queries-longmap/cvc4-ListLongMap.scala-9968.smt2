; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117712 () Bool)

(assert start!117712)

(declare-fun res!922767 () Bool)

(declare-fun e!782788 () Bool)

(assert (=> start!117712 (=> (not res!922767) (not e!782788))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94194 0))(
  ( (array!94195 (arr!45487 (Array (_ BitVec 32) (_ BitVec 64))) (size!46037 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94194)

(assert (=> start!117712 (= res!922767 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46037 a!3464)) (bvslt (size!46037 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117712 e!782788))

(assert (=> start!117712 true))

(declare-fun array_inv!34515 (array!94194) Bool)

(assert (=> start!117712 (array_inv!34515 a!3464)))

(declare-fun b!1381067 () Bool)

(declare-fun res!922768 () Bool)

(assert (=> b!1381067 (=> (not res!922768) (not e!782788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381067 (= res!922768 (not (validKeyInArray!0 (select (arr!45487 a!3464) from!2839))))))

(declare-fun b!1381068 () Bool)

(assert (=> b!1381068 (= e!782788 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117712 res!922767) b!1381067))

(assert (= (and b!1381067 res!922768) b!1381068))

(declare-fun m!1266285 () Bool)

(assert (=> start!117712 m!1266285))

(declare-fun m!1266287 () Bool)

(assert (=> b!1381067 m!1266287))

(assert (=> b!1381067 m!1266287))

(declare-fun m!1266289 () Bool)

(assert (=> b!1381067 m!1266289))

(push 1)

(assert (not start!117712))

(assert (not b!1381067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

