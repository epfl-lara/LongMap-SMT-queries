; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118108 () Bool)

(assert start!118108)

(declare-fun res!924338 () Bool)

(declare-fun e!783710 () Bool)

(assert (=> start!118108 (=> (not res!924338) (not e!783710))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118108 (= res!924338 (validMask!0 mask!2987))))

(assert (=> start!118108 e!783710))

(assert (=> start!118108 true))

(declare-datatypes ((array!94472 0))(
  ( (array!94473 (arr!45617 (Array (_ BitVec 32) (_ BitVec 64))) (size!46167 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94472)

(declare-fun array_inv!34645 (array!94472) Bool)

(assert (=> start!118108 (array_inv!34645 a!2938)))

(declare-fun b!1382746 () Bool)

(declare-fun res!924339 () Bool)

(assert (=> b!1382746 (=> (not res!924339) (not e!783710))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382746 (= res!924339 (and (= (size!46167 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46167 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46167 a!2938))))))

(declare-fun b!1382747 () Bool)

(declare-fun res!924340 () Bool)

(assert (=> b!1382747 (=> (not res!924340) (not e!783710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382747 (= res!924340 (validKeyInArray!0 (select (arr!45617 a!2938) i!1065)))))

(declare-fun b!1382748 () Bool)

(assert (=> b!1382748 (= e!783710 (and (bvsle #b00000000000000000000000000000000 (size!46167 a!2938)) (bvsge (size!46167 a!2938) #b01111111111111111111111111111111)))))

(assert (= (and start!118108 res!924338) b!1382746))

(assert (= (and b!1382746 res!924339) b!1382747))

(assert (= (and b!1382747 res!924340) b!1382748))

(declare-fun m!1267875 () Bool)

(assert (=> start!118108 m!1267875))

(declare-fun m!1267877 () Bool)

(assert (=> start!118108 m!1267877))

(declare-fun m!1267879 () Bool)

(assert (=> b!1382747 m!1267879))

(assert (=> b!1382747 m!1267879))

(declare-fun m!1267881 () Bool)

(assert (=> b!1382747 m!1267881))

(push 1)

(assert (not b!1382747))

(assert (not start!118108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

