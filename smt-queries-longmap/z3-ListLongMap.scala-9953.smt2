; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117578 () Bool)

(assert start!117578)

(declare-fun res!922635 () Bool)

(declare-fun e!782449 () Bool)

(assert (=> start!117578 (=> (not res!922635) (not e!782449))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94096 0))(
  ( (array!94097 (arr!45441 (Array (_ BitVec 32) (_ BitVec 64))) (size!45991 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94096)

(assert (=> start!117578 (= res!922635 (and (bvslt (size!45991 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45991 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117578 e!782449))

(declare-fun array_inv!34469 (array!94096) Bool)

(assert (=> start!117578 (array_inv!34469 a!3931)))

(assert (=> start!117578 true))

(declare-fun b!1380701 () Bool)

(declare-fun res!922636 () Bool)

(assert (=> b!1380701 (=> (not res!922636) (not e!782449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380701 (= res!922636 (validKeyInArray!0 (select (arr!45441 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380702 () Bool)

(assert (=> b!1380702 (= e!782449 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45991 a!3931)))))

(assert (= (and start!117578 res!922635) b!1380701))

(assert (= (and b!1380701 res!922636) b!1380702))

(declare-fun m!1265931 () Bool)

(assert (=> start!117578 m!1265931))

(declare-fun m!1265933 () Bool)

(assert (=> b!1380701 m!1265933))

(assert (=> b!1380701 m!1265933))

(declare-fun m!1265935 () Bool)

(assert (=> b!1380701 m!1265935))

(check-sat (not b!1380701) (not start!117578))
(check-sat)
