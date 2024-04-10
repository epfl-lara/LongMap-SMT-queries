; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117580 () Bool)

(assert start!117580)

(declare-fun res!922641 () Bool)

(declare-fun e!782455 () Bool)

(assert (=> start!117580 (=> (not res!922641) (not e!782455))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94098 0))(
  ( (array!94099 (arr!45442 (Array (_ BitVec 32) (_ BitVec 64))) (size!45992 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94098)

(assert (=> start!117580 (= res!922641 (and (bvslt (size!45992 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45992 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117580 e!782455))

(declare-fun array_inv!34470 (array!94098) Bool)

(assert (=> start!117580 (array_inv!34470 a!3931)))

(assert (=> start!117580 true))

(declare-fun b!1380707 () Bool)

(declare-fun res!922642 () Bool)

(assert (=> b!1380707 (=> (not res!922642) (not e!782455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380707 (= res!922642 (validKeyInArray!0 (select (arr!45442 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380708 () Bool)

(assert (=> b!1380708 (= e!782455 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45992 a!3931)))))

(assert (= (and start!117580 res!922641) b!1380707))

(assert (= (and b!1380707 res!922642) b!1380708))

(declare-fun m!1265937 () Bool)

(assert (=> start!117580 m!1265937))

(declare-fun m!1265939 () Bool)

(assert (=> b!1380707 m!1265939))

(assert (=> b!1380707 m!1265939))

(declare-fun m!1265941 () Bool)

(assert (=> b!1380707 m!1265941))

(push 1)

(assert (not b!1380707))

(assert (not start!117580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

