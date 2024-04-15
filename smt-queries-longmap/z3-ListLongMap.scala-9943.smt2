; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117476 () Bool)

(assert start!117476)

(declare-fun res!922477 () Bool)

(declare-fun e!782064 () Bool)

(assert (=> start!117476 (=> (not res!922477) (not e!782064))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!93981 0))(
  ( (array!93982 (arr!45385 (Array (_ BitVec 32) (_ BitVec 64))) (size!45937 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!93981)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117476 (= res!922477 (and (bvslt (size!45937 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45937 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117476 e!782064))

(declare-fun array_inv!34618 (array!93981) Bool)

(assert (=> start!117476 (array_inv!34618 a!3961)))

(assert (=> start!117476 true))

(declare-fun b!1380182 () Bool)

(declare-fun res!922478 () Bool)

(assert (=> b!1380182 (=> (not res!922478) (not e!782064))))

(declare-fun isPivot!0 (array!93981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380182 (= res!922478 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380183 () Bool)

(assert (=> b!1380183 (= e!782064 (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) (size!45937 a!3961)))))

(assert (= (and start!117476 res!922477) b!1380182))

(assert (= (and b!1380182 res!922478) b!1380183))

(declare-fun m!1264947 () Bool)

(assert (=> start!117476 m!1264947))

(declare-fun m!1264949 () Bool)

(assert (=> b!1380182 m!1264949))

(check-sat (not start!117476) (not b!1380182))
(check-sat)
