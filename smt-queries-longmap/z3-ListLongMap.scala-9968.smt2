; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117710 () Bool)

(assert start!117710)

(declare-fun res!922761 () Bool)

(declare-fun e!782782 () Bool)

(assert (=> start!117710 (=> (not res!922761) (not e!782782))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94192 0))(
  ( (array!94193 (arr!45486 (Array (_ BitVec 32) (_ BitVec 64))) (size!46036 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94192)

(assert (=> start!117710 (= res!922761 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46036 a!3464)) (bvslt (size!46036 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117710 e!782782))

(assert (=> start!117710 true))

(declare-fun array_inv!34514 (array!94192) Bool)

(assert (=> start!117710 (array_inv!34514 a!3464)))

(declare-fun b!1381061 () Bool)

(declare-fun res!922762 () Bool)

(assert (=> b!1381061 (=> (not res!922762) (not e!782782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381061 (= res!922762 (not (validKeyInArray!0 (select (arr!45486 a!3464) from!2839))))))

(declare-fun b!1381062 () Bool)

(assert (=> b!1381062 (= e!782782 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117710 res!922761) b!1381061))

(assert (= (and b!1381061 res!922762) b!1381062))

(declare-fun m!1266279 () Bool)

(assert (=> start!117710 m!1266279))

(declare-fun m!1266281 () Bool)

(assert (=> b!1381061 m!1266281))

(assert (=> b!1381061 m!1266281))

(declare-fun m!1266283 () Bool)

(assert (=> b!1381061 m!1266283))

(check-sat (not start!117710) (not b!1381061))
(check-sat)
