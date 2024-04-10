; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135470 () Bool)

(assert start!135470)

(declare-fun res!1075467 () Bool)

(declare-fun e!877882 () Bool)

(assert (=> start!135470 (=> (not res!1075467) (not e!877882))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135470 (= res!1075467 (validMask!0 mask!877))))

(assert (=> start!135470 e!877882))

(assert (=> start!135470 true))

(declare-datatypes ((array!105201 0))(
  ( (array!105202 (arr!50751 (Array (_ BitVec 32) (_ BitVec 64))) (size!51301 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105201)

(declare-fun array_inv!39478 (array!105201) Bool)

(assert (=> start!135470 (array_inv!39478 _keys!591)))

(declare-fun b!1574173 () Bool)

(declare-fun res!1075466 () Bool)

(assert (=> b!1574173 (=> (not res!1075466) (not e!877882))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574173 (= res!1075466 (and (= (size!51301 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51301 _keys!591)) (bvslt i!537 (size!51301 _keys!591))))))

(declare-fun b!1574174 () Bool)

(declare-fun res!1075465 () Bool)

(assert (=> b!1574174 (=> (not res!1075465) (not e!877882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574174 (= res!1075465 (not (validKeyInArray!0 (select (arr!50751 _keys!591) i!537))))))

(declare-fun b!1574175 () Bool)

(assert (=> b!1574175 (= e!877882 (bvslt (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135470 res!1075467) b!1574173))

(assert (= (and b!1574173 res!1075466) b!1574174))

(assert (= (and b!1574174 res!1075465) b!1574175))

(declare-fun m!1447433 () Bool)

(assert (=> start!135470 m!1447433))

(declare-fun m!1447435 () Bool)

(assert (=> start!135470 m!1447435))

(declare-fun m!1447437 () Bool)

(assert (=> b!1574174 m!1447437))

(assert (=> b!1574174 m!1447437))

(declare-fun m!1447439 () Bool)

(assert (=> b!1574174 m!1447439))

(push 1)

(assert (not start!135470))

