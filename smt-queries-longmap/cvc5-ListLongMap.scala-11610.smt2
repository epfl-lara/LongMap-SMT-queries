; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135466 () Bool)

(assert start!135466)

(declare-fun res!1075448 () Bool)

(declare-fun e!877870 () Bool)

(assert (=> start!135466 (=> (not res!1075448) (not e!877870))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135466 (= res!1075448 (validMask!0 mask!877))))

(assert (=> start!135466 e!877870))

(assert (=> start!135466 true))

(declare-datatypes ((array!105197 0))(
  ( (array!105198 (arr!50749 (Array (_ BitVec 32) (_ BitVec 64))) (size!51299 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105197)

(declare-fun array_inv!39476 (array!105197) Bool)

(assert (=> start!135466 (array_inv!39476 _keys!591)))

(declare-fun b!1574155 () Bool)

(declare-fun res!1075447 () Bool)

(assert (=> b!1574155 (=> (not res!1075447) (not e!877870))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574155 (= res!1075447 (and (= (size!51299 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51299 _keys!591)) (bvslt i!537 (size!51299 _keys!591))))))

(declare-fun b!1574156 () Bool)

(declare-fun res!1075449 () Bool)

(assert (=> b!1574156 (=> (not res!1075449) (not e!877870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574156 (= res!1075449 (not (validKeyInArray!0 (select (arr!50749 _keys!591) i!537))))))

(declare-fun b!1574157 () Bool)

(assert (=> b!1574157 (= e!877870 (bvslt (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135466 res!1075448) b!1574155))

(assert (= (and b!1574155 res!1075447) b!1574156))

(assert (= (and b!1574156 res!1075449) b!1574157))

(declare-fun m!1447417 () Bool)

(assert (=> start!135466 m!1447417))

(declare-fun m!1447419 () Bool)

(assert (=> start!135466 m!1447419))

(declare-fun m!1447421 () Bool)

(assert (=> b!1574156 m!1447421))

(assert (=> b!1574156 m!1447421))

(declare-fun m!1447423 () Bool)

(assert (=> b!1574156 m!1447423))

(push 1)

(assert (not start!135466))

(assert (not b!1574156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

