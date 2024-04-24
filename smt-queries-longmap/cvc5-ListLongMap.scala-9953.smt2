; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117812 () Bool)

(assert start!117812)

(declare-fun res!923162 () Bool)

(declare-fun e!783305 () Bool)

(assert (=> start!117812 (=> (not res!923162) (not e!783305))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94214 0))(
  ( (array!94215 (arr!45495 (Array (_ BitVec 32) (_ BitVec 64))) (size!46046 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94214)

(assert (=> start!117812 (= res!923162 (and (bvslt (size!46046 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46046 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117812 e!783305))

(declare-fun array_inv!34776 (array!94214) Bool)

(assert (=> start!117812 (array_inv!34776 a!3931)))

(assert (=> start!117812 true))

(declare-fun b!1382017 () Bool)

(declare-fun res!923163 () Bool)

(assert (=> b!1382017 (=> (not res!923163) (not e!783305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382017 (= res!923163 (validKeyInArray!0 (select (arr!45495 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1382018 () Bool)

(assert (=> b!1382018 (= e!783305 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!46046 a!3931)))))

(assert (= (and start!117812 res!923162) b!1382017))

(assert (= (and b!1382017 res!923163) b!1382018))

(declare-fun m!1267573 () Bool)

(assert (=> start!117812 m!1267573))

(declare-fun m!1267575 () Bool)

(assert (=> b!1382017 m!1267575))

(assert (=> b!1382017 m!1267575))

(declare-fun m!1267577 () Bool)

(assert (=> b!1382017 m!1267577))

(push 1)

(assert (not start!117812))

(assert (not b!1382017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

