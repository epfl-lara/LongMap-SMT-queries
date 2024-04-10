; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135574 () Bool)

(assert start!135574)

(declare-fun res!1075745 () Bool)

(declare-fun e!878072 () Bool)

(assert (=> start!135574 (=> (not res!1075745) (not e!878072))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135574 (= res!1075745 (validMask!0 mask!898))))

(assert (=> start!135574 e!878072))

(assert (=> start!135574 true))

(declare-datatypes ((array!105262 0))(
  ( (array!105263 (arr!50778 (Array (_ BitVec 32) (_ BitVec 64))) (size!51328 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105262)

(declare-fun array_inv!39505 (array!105262) Bool)

(assert (=> start!135574 (array_inv!39505 _keys!605)))

(declare-fun b!1574452 () Bool)

(declare-fun res!1075744 () Bool)

(assert (=> b!1574452 (=> (not res!1075744) (not e!878072))))

(assert (=> b!1574452 (= res!1075744 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51328 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574453 () Bool)

(declare-fun res!1075746 () Bool)

(assert (=> b!1574453 (=> (not res!1075746) (not e!878072))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574453 (= res!1075746 (validKeyInArray!0 k!761))))

(declare-fun b!1574454 () Bool)

(assert (=> b!1574454 (= e!878072 false)))

(declare-fun lt!674803 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574454 (= lt!674803 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135574 res!1075745) b!1574452))

(assert (= (and b!1574452 res!1075744) b!1574453))

(assert (= (and b!1574453 res!1075746) b!1574454))

(declare-fun m!1447685 () Bool)

(assert (=> start!135574 m!1447685))

(declare-fun m!1447687 () Bool)

(assert (=> start!135574 m!1447687))

(declare-fun m!1447689 () Bool)

(assert (=> b!1574453 m!1447689))

(declare-fun m!1447691 () Bool)

(assert (=> b!1574454 m!1447691))

(push 1)

(assert (not b!1574454))

(assert (not start!135574))

(assert (not b!1574453))

(check-sat)

