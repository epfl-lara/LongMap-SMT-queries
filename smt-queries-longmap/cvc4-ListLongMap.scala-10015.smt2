; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118192 () Bool)

(assert start!118192)

(declare-fun res!924500 () Bool)

(declare-fun e!783807 () Bool)

(assert (=> start!118192 (=> (not res!924500) (not e!783807))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118192 (= res!924500 (validMask!0 mask!2987))))

(assert (=> start!118192 e!783807))

(assert (=> start!118192 true))

(declare-datatypes ((array!94448 0))(
  ( (array!94449 (arr!45602 (Array (_ BitVec 32) (_ BitVec 64))) (size!46154 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94448)

(declare-fun array_inv!34835 (array!94448) Bool)

(assert (=> start!118192 (array_inv!34835 a!2938)))

(declare-fun b!1382863 () Bool)

(declare-fun res!924498 () Bool)

(assert (=> b!1382863 (=> (not res!924498) (not e!783807))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382863 (= res!924498 (and (= (size!46154 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46154 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46154 a!2938))))))

(declare-fun b!1382864 () Bool)

(declare-fun res!924499 () Bool)

(assert (=> b!1382864 (=> (not res!924499) (not e!783807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382864 (= res!924499 (validKeyInArray!0 (select (arr!45602 a!2938) i!1065)))))

(declare-fun b!1382865 () Bool)

(assert (=> b!1382865 (= e!783807 false)))

(declare-fun lt!608309 () Bool)

(declare-datatypes ((List!32208 0))(
  ( (Nil!32205) (Cons!32204 (h!33413 (_ BitVec 64)) (t!46894 List!32208)) )
))
(declare-fun arrayNoDuplicates!0 (array!94448 (_ BitVec 32) List!32208) Bool)

(assert (=> b!1382865 (= lt!608309 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32205))))

(assert (= (and start!118192 res!924500) b!1382863))

(assert (= (and b!1382863 res!924498) b!1382864))

(assert (= (and b!1382864 res!924499) b!1382865))

(declare-fun m!1267531 () Bool)

(assert (=> start!118192 m!1267531))

(declare-fun m!1267533 () Bool)

(assert (=> start!118192 m!1267533))

(declare-fun m!1267535 () Bool)

(assert (=> b!1382864 m!1267535))

(assert (=> b!1382864 m!1267535))

(declare-fun m!1267537 () Bool)

(assert (=> b!1382864 m!1267537))

(declare-fun m!1267539 () Bool)

(assert (=> b!1382865 m!1267539))

(push 1)

(assert (not b!1382864))

(assert (not start!118192))

(assert (not b!1382865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

