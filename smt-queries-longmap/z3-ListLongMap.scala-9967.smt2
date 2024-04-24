; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117934 () Bool)

(assert start!117934)

(declare-fun res!923258 () Bool)

(declare-fun e!783608 () Bool)

(assert (=> start!117934 (=> (not res!923258) (not e!783608))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94300 0))(
  ( (array!94301 (arr!45535 (Array (_ BitVec 32) (_ BitVec 64))) (size!46086 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94300)

(assert (=> start!117934 (= res!923258 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46086 a!3464)) (bvslt (size!46086 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117934 e!783608))

(assert (=> start!117934 true))

(declare-fun array_inv!34816 (array!94300) Bool)

(assert (=> start!117934 (array_inv!34816 a!3464)))

(declare-fun b!1382347 () Bool)

(declare-fun res!923259 () Bool)

(assert (=> b!1382347 (=> (not res!923259) (not e!783608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382347 (= res!923259 (validKeyInArray!0 (select (arr!45535 a!3464) from!2839)))))

(declare-fun b!1382348 () Bool)

(assert (=> b!1382348 (= e!783608 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117934 res!923258) b!1382347))

(assert (= (and b!1382347 res!923259) b!1382348))

(declare-fun m!1267891 () Bool)

(assert (=> start!117934 m!1267891))

(declare-fun m!1267893 () Bool)

(assert (=> b!1382347 m!1267893))

(assert (=> b!1382347 m!1267893))

(declare-fun m!1267895 () Bool)

(assert (=> b!1382347 m!1267895))

(check-sat (not start!117934) (not b!1382347))
(check-sat)
