; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117826 () Bool)

(assert start!117826)

(declare-fun res!923204 () Bool)

(declare-fun e!783347 () Bool)

(assert (=> start!117826 (=> (not res!923204) (not e!783347))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94228 0))(
  ( (array!94229 (arr!45502 (Array (_ BitVec 32) (_ BitVec 64))) (size!46053 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94228)

(assert (=> start!117826 (= res!923204 (and (bvslt (size!46053 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46053 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117826 e!783347))

(declare-fun array_inv!34783 (array!94228) Bool)

(assert (=> start!117826 (array_inv!34783 a!3931)))

(assert (=> start!117826 true))

(declare-fun b!1382059 () Bool)

(declare-fun res!923205 () Bool)

(assert (=> b!1382059 (=> (not res!923205) (not e!783347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382059 (= res!923205 (not (validKeyInArray!0 (select (arr!45502 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1382060 () Bool)

(assert (=> b!1382060 (= e!783347 (bvsgt from!3309 to!105))))

(assert (= (and start!117826 res!923204) b!1382059))

(assert (= (and b!1382059 res!923205) b!1382060))

(declare-fun m!1267615 () Bool)

(assert (=> start!117826 m!1267615))

(declare-fun m!1267617 () Bool)

(assert (=> b!1382059 m!1267617))

(assert (=> b!1382059 m!1267617))

(declare-fun m!1267619 () Bool)

(assert (=> b!1382059 m!1267619))

(check-sat (not start!117826) (not b!1382059))
(check-sat)
