; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117598 () Bool)

(assert start!117598)

(declare-fun res!922695 () Bool)

(declare-fun e!782509 () Bool)

(assert (=> start!117598 (=> (not res!922695) (not e!782509))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94116 0))(
  ( (array!94117 (arr!45451 (Array (_ BitVec 32) (_ BitVec 64))) (size!46001 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94116)

(assert (=> start!117598 (= res!922695 (and (bvslt (size!46001 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46001 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117598 e!782509))

(declare-fun array_inv!34479 (array!94116) Bool)

(assert (=> start!117598 (array_inv!34479 a!3931)))

(assert (=> start!117598 true))

(declare-fun b!1380761 () Bool)

(declare-fun res!922696 () Bool)

(assert (=> b!1380761 (=> (not res!922696) (not e!782509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380761 (= res!922696 (not (validKeyInArray!0 (select (arr!45451 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380762 () Bool)

(assert (=> b!1380762 (= e!782509 (bvsgt from!3309 to!105))))

(assert (= (and start!117598 res!922695) b!1380761))

(assert (= (and b!1380761 res!922696) b!1380762))

(declare-fun m!1265991 () Bool)

(assert (=> start!117598 m!1265991))

(declare-fun m!1265993 () Bool)

(assert (=> b!1380761 m!1265993))

(assert (=> b!1380761 m!1265993))

(declare-fun m!1265995 () Bool)

(assert (=> b!1380761 m!1265995))

(push 1)

(assert (not start!117598))

(assert (not b!1380761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

