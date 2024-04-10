; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118112 () Bool)

(assert start!118112)

(declare-fun res!924357 () Bool)

(declare-fun e!783722 () Bool)

(assert (=> start!118112 (=> (not res!924357) (not e!783722))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118112 (= res!924357 (validMask!0 mask!2987))))

(assert (=> start!118112 e!783722))

(assert (=> start!118112 true))

(declare-datatypes ((array!94476 0))(
  ( (array!94477 (arr!45619 (Array (_ BitVec 32) (_ BitVec 64))) (size!46169 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94476)

(declare-fun array_inv!34647 (array!94476) Bool)

(assert (=> start!118112 (array_inv!34647 a!2938)))

(declare-fun b!1382764 () Bool)

(declare-fun res!924358 () Bool)

(assert (=> b!1382764 (=> (not res!924358) (not e!783722))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382764 (= res!924358 (and (= (size!46169 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46169 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46169 a!2938))))))

(declare-fun b!1382765 () Bool)

(declare-fun res!924356 () Bool)

(assert (=> b!1382765 (=> (not res!924356) (not e!783722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382765 (= res!924356 (validKeyInArray!0 (select (arr!45619 a!2938) i!1065)))))

(declare-fun b!1382766 () Bool)

(assert (=> b!1382766 (= e!783722 (and (bvsle #b00000000000000000000000000000000 (size!46169 a!2938)) (bvsge (size!46169 a!2938) #b01111111111111111111111111111111)))))

(assert (= (and start!118112 res!924357) b!1382764))

(assert (= (and b!1382764 res!924358) b!1382765))

(assert (= (and b!1382765 res!924356) b!1382766))

(declare-fun m!1267891 () Bool)

(assert (=> start!118112 m!1267891))

(declare-fun m!1267893 () Bool)

(assert (=> start!118112 m!1267893))

(declare-fun m!1267895 () Bool)

(assert (=> b!1382765 m!1267895))

(assert (=> b!1382765 m!1267895))

(declare-fun m!1267897 () Bool)

(assert (=> b!1382765 m!1267897))

(push 1)

(assert (not b!1382765))

(assert (not start!118112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

