; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117964 () Bool)

(assert start!117964)

(declare-fun res!923294 () Bool)

(declare-fun e!783671 () Bool)

(assert (=> start!117964 (=> (not res!923294) (not e!783671))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94330 0))(
  ( (array!94331 (arr!45550 (Array (_ BitVec 32) (_ BitVec 64))) (size!46101 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94330)

(assert (=> start!117964 (= res!923294 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46101 a!3464)) (bvslt (size!46101 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117964 e!783671))

(assert (=> start!117964 true))

(declare-fun array_inv!34831 (array!94330) Bool)

(assert (=> start!117964 (array_inv!34831 a!3464)))

(declare-fun b!1382383 () Bool)

(declare-fun res!923295 () Bool)

(assert (=> b!1382383 (=> (not res!923295) (not e!783671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382383 (= res!923295 (validKeyInArray!0 (select (arr!45550 a!3464) from!2839)))))

(declare-fun b!1382384 () Bool)

(assert (=> b!1382384 (= e!783671 (bvsge (bvsub (size!46101 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46101 a!3464) from!2839)))))

(assert (= (and start!117964 res!923294) b!1382383))

(assert (= (and b!1382383 res!923295) b!1382384))

(declare-fun m!1267945 () Bool)

(assert (=> start!117964 m!1267945))

(declare-fun m!1267947 () Bool)

(assert (=> b!1382383 m!1267947))

(assert (=> b!1382383 m!1267947))

(declare-fun m!1267949 () Bool)

(assert (=> b!1382383 m!1267949))

(check-sat (not b!1382383) (not start!117964))
(check-sat)
