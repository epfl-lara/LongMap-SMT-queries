; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117706 () Bool)

(assert start!117706)

(declare-fun res!922749 () Bool)

(declare-fun e!782770 () Bool)

(assert (=> start!117706 (=> (not res!922749) (not e!782770))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94188 0))(
  ( (array!94189 (arr!45484 (Array (_ BitVec 32) (_ BitVec 64))) (size!46034 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94188)

(assert (=> start!117706 (= res!922749 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46034 a!3464)) (bvslt (size!46034 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117706 e!782770))

(assert (=> start!117706 true))

(declare-fun array_inv!34512 (array!94188) Bool)

(assert (=> start!117706 (array_inv!34512 a!3464)))

(declare-fun b!1381049 () Bool)

(declare-fun res!922750 () Bool)

(assert (=> b!1381049 (=> (not res!922750) (not e!782770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381049 (= res!922750 (validKeyInArray!0 (select (arr!45484 a!3464) from!2839)))))

(declare-fun b!1381050 () Bool)

(assert (=> b!1381050 (= e!782770 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117706 res!922749) b!1381049))

(assert (= (and b!1381049 res!922750) b!1381050))

(declare-fun m!1266267 () Bool)

(assert (=> start!117706 m!1266267))

(declare-fun m!1266269 () Bool)

(assert (=> b!1381049 m!1266269))

(assert (=> b!1381049 m!1266269))

(declare-fun m!1266271 () Bool)

(assert (=> b!1381049 m!1266271))

(push 1)

(assert (not b!1381049))

(assert (not start!117706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

