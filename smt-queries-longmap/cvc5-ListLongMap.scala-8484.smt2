; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103420 () Bool)

(assert start!103420)

(declare-fun res!827472 () Bool)

(declare-fun e!702871 () Bool)

(assert (=> start!103420 (=> (not res!827472) (not e!702871))))

(declare-datatypes ((array!79829 0))(
  ( (array!79830 (arr!38512 (Array (_ BitVec 32) (_ BitVec 64))) (size!39050 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79829)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103420 (= res!827472 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39050 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39050 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103420 e!702871))

(assert (=> start!103420 true))

(declare-fun array_inv!29495 (array!79829) Bool)

(assert (=> start!103420 (array_inv!29495 a!3575)))

(declare-fun b!1240143 () Bool)

(declare-fun res!827471 () Bool)

(assert (=> b!1240143 (=> (not res!827471) (not e!702871))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240143 (= res!827471 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240146 () Bool)

(assert (=> b!1240146 (= e!702871 (not true))))

(assert (=> b!1240146 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41068 0))(
  ( (Unit!41069) )
))
(declare-fun lt!561735 () Unit!41068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79829 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41068)

(assert (=> b!1240146 (= lt!561735 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240144 () Bool)

(declare-fun res!827473 () Bool)

(assert (=> b!1240144 (=> (not res!827473) (not e!702871))))

(assert (=> b!1240144 (= res!827473 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39050 a!3575))))))

(declare-fun b!1240145 () Bool)

(declare-fun res!827474 () Bool)

(assert (=> b!1240145 (=> (not res!827474) (not e!702871))))

(assert (=> b!1240145 (= res!827474 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(assert (= (and start!103420 res!827472) b!1240143))

(assert (= (and b!1240143 res!827471) b!1240144))

(assert (= (and b!1240144 res!827473) b!1240145))

(assert (= (and b!1240145 res!827474) b!1240146))

(declare-fun m!1143055 () Bool)

(assert (=> start!103420 m!1143055))

(declare-fun m!1143057 () Bool)

(assert (=> b!1240143 m!1143057))

(declare-fun m!1143059 () Bool)

(assert (=> b!1240146 m!1143059))

(declare-fun m!1143061 () Bool)

(assert (=> b!1240146 m!1143061))

(declare-fun m!1143063 () Bool)

(assert (=> b!1240145 m!1143063))

(push 1)

(assert (not start!103420))

(assert (not b!1240145))

(assert (not b!1240143))

(assert (not b!1240146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

