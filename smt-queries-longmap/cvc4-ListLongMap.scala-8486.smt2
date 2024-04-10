; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103438 () Bool)

(assert start!103438)

(declare-fun res!827553 () Bool)

(declare-fun e!702956 () Bool)

(assert (=> start!103438 (=> (not res!827553) (not e!702956))))

(declare-datatypes ((array!79920 0))(
  ( (array!79921 (arr!38557 (Array (_ BitVec 32) (_ BitVec 64))) (size!39093 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79920)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103438 (= res!827553 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39093 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39093 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103438 e!702956))

(assert (=> start!103438 true))

(declare-fun array_inv!29405 (array!79920) Bool)

(assert (=> start!103438 (array_inv!29405 a!3575)))

(declare-fun b!1240267 () Bool)

(declare-fun res!827554 () Bool)

(assert (=> b!1240267 (=> (not res!827554) (not e!702956))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240267 (= res!827554 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240268 () Bool)

(assert (=> b!1240268 (= e!702956 (and (bvsgt from!2953 newFrom!281) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!103438 res!827553) b!1240267))

(assert (= (and b!1240267 res!827554) b!1240268))

(declare-fun m!1143609 () Bool)

(assert (=> start!103438 m!1143609))

(declare-fun m!1143611 () Bool)

(assert (=> b!1240267 m!1143611))

(push 1)

