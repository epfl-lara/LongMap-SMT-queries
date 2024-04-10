; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135476 () Bool)

(assert start!135476)

(declare-fun res!1075493 () Bool)

(declare-fun e!877900 () Bool)

(assert (=> start!135476 (=> (not res!1075493) (not e!877900))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135476 (= res!1075493 (validMask!0 mask!877))))

(assert (=> start!135476 e!877900))

(assert (=> start!135476 true))

(declare-datatypes ((array!105207 0))(
  ( (array!105208 (arr!50754 (Array (_ BitVec 32) (_ BitVec 64))) (size!51304 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105207)

(declare-fun array_inv!39481 (array!105207) Bool)

(assert (=> start!135476 (array_inv!39481 _keys!591)))

(declare-fun b!1574200 () Bool)

(declare-fun res!1075492 () Bool)

(assert (=> b!1574200 (=> (not res!1075492) (not e!877900))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574200 (= res!1075492 (and (= (size!51304 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51304 _keys!591)) (bvslt i!537 (size!51304 _keys!591))))))

(declare-fun b!1574201 () Bool)

(declare-fun res!1075494 () Bool)

(assert (=> b!1574201 (=> (not res!1075494) (not e!877900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574201 (= res!1075494 (validKeyInArray!0 (select (arr!50754 _keys!591) i!537)))))

(declare-fun b!1574202 () Bool)

(assert (=> b!1574202 (= e!877900 (bvsge (size!51304 _keys!591) #b01111111111111111111111111111111))))

(assert (= (and start!135476 res!1075493) b!1574200))

(assert (= (and b!1574200 res!1075492) b!1574201))

(assert (= (and b!1574201 res!1075494) b!1574202))

(declare-fun m!1447457 () Bool)

(assert (=> start!135476 m!1447457))

(declare-fun m!1447459 () Bool)

(assert (=> start!135476 m!1447459))

(declare-fun m!1447461 () Bool)

(assert (=> b!1574201 m!1447461))

(assert (=> b!1574201 m!1447461))

(declare-fun m!1447463 () Bool)

(assert (=> b!1574201 m!1447463))

(push 1)

(assert (not start!135476))

(assert (not b!1574201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

