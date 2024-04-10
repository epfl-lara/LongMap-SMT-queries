; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117732 () Bool)

(assert start!117732)

(declare-fun res!922773 () Bool)

(declare-fun e!782821 () Bool)

(assert (=> start!117732 (=> (not res!922773) (not e!782821))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94214 0))(
  ( (array!94215 (arr!45497 (Array (_ BitVec 32) (_ BitVec 64))) (size!46047 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94214)

(assert (=> start!117732 (= res!922773 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46047 a!3464)) (bvslt (size!46047 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117732 e!782821))

(assert (=> start!117732 true))

(declare-fun array_inv!34525 (array!94214) Bool)

(assert (=> start!117732 (array_inv!34525 a!3464)))

(declare-fun b!1381073 () Bool)

(declare-fun res!922774 () Bool)

(assert (=> b!1381073 (=> (not res!922774) (not e!782821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381073 (= res!922774 (validKeyInArray!0 (select (arr!45497 a!3464) from!2839)))))

(declare-fun b!1381074 () Bool)

(assert (=> b!1381074 (= e!782821 (bvsge (bvsub (size!46047 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46047 a!3464) from!2839)))))

(assert (= (and start!117732 res!922773) b!1381073))

(assert (= (and b!1381073 res!922774) b!1381074))

(declare-fun m!1266309 () Bool)

(assert (=> start!117732 m!1266309))

(declare-fun m!1266311 () Bool)

(assert (=> b!1381073 m!1266311))

(assert (=> b!1381073 m!1266311))

(declare-fun m!1266313 () Bool)

(assert (=> b!1381073 m!1266313))

(push 1)

(assert (not start!117732))

(assert (not b!1381073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

