; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117590 () Bool)

(assert start!117590)

(declare-fun res!922657 () Bool)

(declare-fun e!782466 () Bool)

(assert (=> start!117590 (=> (not res!922657) (not e!782466))))

(declare-fun to!105 () (_ BitVec 32))

(declare-datatypes ((array!94062 0))(
  ( (array!94063 (arr!45424 (Array (_ BitVec 32) (_ BitVec 64))) (size!45976 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94062)

(declare-fun from!3309 () (_ BitVec 32))

(assert (=> start!117590 (= res!922657 (and (bvslt (size!45976 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45976 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117590 e!782466))

(declare-fun array_inv!34657 (array!94062) Bool)

(assert (=> start!117590 (array_inv!34657 a!3931)))

(assert (=> start!117590 true))

(declare-fun b!1380680 () Bool)

(declare-fun res!922658 () Bool)

(assert (=> b!1380680 (=> (not res!922658) (not e!782466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380680 (= res!922658 (not (validKeyInArray!0 (select (arr!45424 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380681 () Bool)

(assert (=> b!1380681 (= e!782466 (bvsgt from!3309 to!105))))

(assert (= (and start!117590 res!922657) b!1380680))

(assert (= (and b!1380680 res!922658) b!1380681))

(declare-fun m!1265475 () Bool)

(assert (=> start!117590 m!1265475))

(declare-fun m!1265477 () Bool)

(assert (=> b!1380680 m!1265477))

(assert (=> b!1380680 m!1265477))

(declare-fun m!1265479 () Bool)

(assert (=> b!1380680 m!1265479))

(check-sat (not b!1380680) (not start!117590))
(check-sat)
