; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117814 () Bool)

(assert start!117814)

(declare-fun res!923168 () Bool)

(declare-fun e!783311 () Bool)

(assert (=> start!117814 (=> (not res!923168) (not e!783311))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94216 0))(
  ( (array!94217 (arr!45496 (Array (_ BitVec 32) (_ BitVec 64))) (size!46047 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94216)

(assert (=> start!117814 (= res!923168 (and (bvslt (size!46047 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46047 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117814 e!783311))

(declare-fun array_inv!34777 (array!94216) Bool)

(assert (=> start!117814 (array_inv!34777 a!3931)))

(assert (=> start!117814 true))

(declare-fun b!1382023 () Bool)

(declare-fun res!923169 () Bool)

(assert (=> b!1382023 (=> (not res!923169) (not e!783311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382023 (= res!923169 (validKeyInArray!0 (select (arr!45496 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1382024 () Bool)

(assert (=> b!1382024 (= e!783311 (bvsgt from!3309 to!105))))

(assert (= (and start!117814 res!923168) b!1382023))

(assert (= (and b!1382023 res!923169) b!1382024))

(declare-fun m!1267579 () Bool)

(assert (=> start!117814 m!1267579))

(declare-fun m!1267581 () Bool)

(assert (=> b!1382023 m!1267581))

(assert (=> b!1382023 m!1267581))

(declare-fun m!1267583 () Bool)

(assert (=> b!1382023 m!1267583))

(check-sat (not b!1382023) (not start!117814))
(check-sat)
