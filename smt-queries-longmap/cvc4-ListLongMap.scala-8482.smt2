; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103414 () Bool)

(assert start!103414)

(declare-fun res!827443 () Bool)

(declare-fun e!702885 () Bool)

(assert (=> start!103414 (=> (not res!827443) (not e!702885))))

(declare-datatypes ((array!79896 0))(
  ( (array!79897 (arr!38545 (Array (_ BitVec 32) (_ BitVec 64))) (size!39081 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79896)

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-fun from!2953 () (_ BitVec 32))

(assert (=> start!103414 (= res!827443 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39081 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39081 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103414 e!702885))

(assert (=> start!103414 true))

(declare-fun array_inv!29393 (array!79896) Bool)

(assert (=> start!103414 (array_inv!29393 a!3575)))

(declare-fun b!1240160 () Bool)

(assert (=> b!1240160 (= e!702885 (not true))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240160 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41211 0))(
  ( (Unit!41212) )
))
(declare-fun lt!561896 () Unit!41211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79896 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41211)

(assert (=> b!1240160 (= lt!561896 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240157 () Bool)

(declare-fun res!827446 () Bool)

(assert (=> b!1240157 (=> (not res!827446) (not e!702885))))

(assert (=> b!1240157 (= res!827446 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240158 () Bool)

(declare-fun res!827445 () Bool)

(assert (=> b!1240158 (=> (not res!827445) (not e!702885))))

(assert (=> b!1240158 (= res!827445 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39081 a!3575))))))

(declare-fun b!1240159 () Bool)

(declare-fun res!827444 () Bool)

(assert (=> b!1240159 (=> (not res!827444) (not e!702885))))

(assert (=> b!1240159 (= res!827444 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(assert (= (and start!103414 res!827443) b!1240157))

(assert (= (and b!1240157 res!827446) b!1240158))

(assert (= (and b!1240158 res!827445) b!1240159))

(assert (= (and b!1240159 res!827444) b!1240160))

(declare-fun m!1143519 () Bool)

(assert (=> start!103414 m!1143519))

(declare-fun m!1143521 () Bool)

(assert (=> b!1240160 m!1143521))

(declare-fun m!1143523 () Bool)

(assert (=> b!1240160 m!1143523))

(declare-fun m!1143525 () Bool)

(assert (=> b!1240157 m!1143525))

(declare-fun m!1143527 () Bool)

(assert (=> b!1240159 m!1143527))

(push 1)

(assert (not b!1240160))

