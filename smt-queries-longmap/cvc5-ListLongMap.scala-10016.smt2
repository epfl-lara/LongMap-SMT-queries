; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118200 () Bool)

(assert start!118200)

(declare-fun res!924542 () Bool)

(declare-fun e!783851 () Bool)

(assert (=> start!118200 (=> (not res!924542) (not e!783851))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118200 (= res!924542 (validMask!0 mask!2987))))

(assert (=> start!118200 e!783851))

(assert (=> start!118200 true))

(declare-datatypes ((array!94503 0))(
  ( (array!94504 (arr!45629 (Array (_ BitVec 32) (_ BitVec 64))) (size!46179 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94503)

(declare-fun array_inv!34657 (array!94503) Bool)

(assert (=> start!118200 (array_inv!34657 a!2938)))

(declare-fun b!1382950 () Bool)

(declare-fun res!924543 () Bool)

(assert (=> b!1382950 (=> (not res!924543) (not e!783851))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382950 (= res!924543 (and (= (size!46179 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46179 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46179 a!2938))))))

(declare-fun b!1382951 () Bool)

(declare-fun res!924544 () Bool)

(assert (=> b!1382951 (=> (not res!924544) (not e!783851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382951 (= res!924544 (validKeyInArray!0 (select (arr!45629 a!2938) i!1065)))))

(declare-fun b!1382952 () Bool)

(assert (=> b!1382952 (= e!783851 false)))

(declare-fun lt!608499 () Bool)

(declare-datatypes ((List!32157 0))(
  ( (Nil!32154) (Cons!32153 (h!33362 (_ BitVec 64)) (t!46851 List!32157)) )
))
(declare-fun arrayNoDuplicates!0 (array!94503 (_ BitVec 32) List!32157) Bool)

(assert (=> b!1382952 (= lt!608499 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32154))))

(assert (= (and start!118200 res!924542) b!1382950))

(assert (= (and b!1382950 res!924543) b!1382951))

(assert (= (and b!1382951 res!924544) b!1382952))

(declare-fun m!1268055 () Bool)

(assert (=> start!118200 m!1268055))

(declare-fun m!1268057 () Bool)

(assert (=> start!118200 m!1268057))

(declare-fun m!1268059 () Bool)

(assert (=> b!1382951 m!1268059))

(assert (=> b!1382951 m!1268059))

(declare-fun m!1268061 () Bool)

(assert (=> b!1382951 m!1268061))

(declare-fun m!1268063 () Bool)

(assert (=> b!1382952 m!1268063))

(push 1)

(assert (not b!1382951))

(assert (not b!1382952))

(assert (not start!118200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)
