; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117576 () Bool)

(assert start!117576)

(declare-fun res!922615 () Bool)

(declare-fun e!782424 () Bool)

(assert (=> start!117576 (=> (not res!922615) (not e!782424))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94048 0))(
  ( (array!94049 (arr!45417 (Array (_ BitVec 32) (_ BitVec 64))) (size!45969 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94048)

(assert (=> start!117576 (= res!922615 (and (bvslt (size!45969 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45969 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117576 e!782424))

(declare-fun array_inv!34650 (array!94048) Bool)

(assert (=> start!117576 (array_inv!34650 a!3931)))

(assert (=> start!117576 true))

(declare-fun b!1380638 () Bool)

(declare-fun res!922616 () Bool)

(assert (=> b!1380638 (=> (not res!922616) (not e!782424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380638 (= res!922616 (validKeyInArray!0 (select (arr!45417 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380639 () Bool)

(assert (=> b!1380639 (= e!782424 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45969 a!3931)))))

(assert (= (and start!117576 res!922615) b!1380638))

(assert (= (and b!1380638 res!922616) b!1380639))

(declare-fun m!1265433 () Bool)

(assert (=> start!117576 m!1265433))

(declare-fun m!1265435 () Bool)

(assert (=> b!1380638 m!1265435))

(assert (=> b!1380638 m!1265435))

(declare-fun m!1265437 () Bool)

(assert (=> b!1380638 m!1265437))

(push 1)

(assert (not b!1380638))

(assert (not start!117576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

