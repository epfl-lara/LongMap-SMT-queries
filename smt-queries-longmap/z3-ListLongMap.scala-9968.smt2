; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117940 () Bool)

(assert start!117940)

(declare-fun res!923276 () Bool)

(declare-fun e!783626 () Bool)

(assert (=> start!117940 (=> (not res!923276) (not e!783626))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94306 0))(
  ( (array!94307 (arr!45538 (Array (_ BitVec 32) (_ BitVec 64))) (size!46089 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94306)

(assert (=> start!117940 (= res!923276 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46089 a!3464)) (bvslt (size!46089 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117940 e!783626))

(assert (=> start!117940 true))

(declare-fun array_inv!34819 (array!94306) Bool)

(assert (=> start!117940 (array_inv!34819 a!3464)))

(declare-fun b!1382365 () Bool)

(declare-fun res!923277 () Bool)

(assert (=> b!1382365 (=> (not res!923277) (not e!783626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382365 (= res!923277 (not (validKeyInArray!0 (select (arr!45538 a!3464) from!2839))))))

(declare-fun b!1382366 () Bool)

(assert (=> b!1382366 (= e!783626 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117940 res!923276) b!1382365))

(assert (= (and b!1382365 res!923277) b!1382366))

(declare-fun m!1267909 () Bool)

(assert (=> start!117940 m!1267909))

(declare-fun m!1267911 () Bool)

(assert (=> b!1382365 m!1267911))

(assert (=> b!1382365 m!1267911))

(declare-fun m!1267913 () Bool)

(assert (=> b!1382365 m!1267913))

(check-sat (not b!1382365) (not start!117940))
(check-sat)
