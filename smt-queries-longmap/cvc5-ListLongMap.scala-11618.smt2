; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135564 () Bool)

(assert start!135564)

(declare-fun res!1075700 () Bool)

(declare-fun e!878041 () Bool)

(assert (=> start!135564 (=> (not res!1075700) (not e!878041))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135564 (= res!1075700 (validMask!0 mask!898))))

(assert (=> start!135564 e!878041))

(assert (=> start!135564 true))

(declare-datatypes ((array!105252 0))(
  ( (array!105253 (arr!50773 (Array (_ BitVec 32) (_ BitVec 64))) (size!51323 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105252)

(declare-fun array_inv!39500 (array!105252) Bool)

(assert (=> start!135564 (array_inv!39500 _keys!605)))

(declare-fun b!1574407 () Bool)

(declare-fun res!1075699 () Bool)

(assert (=> b!1574407 (=> (not res!1075699) (not e!878041))))

(assert (=> b!1574407 (= res!1075699 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51323 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574408 () Bool)

(declare-fun res!1075701 () Bool)

(assert (=> b!1574408 (=> (not res!1075701) (not e!878041))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574408 (= res!1075701 (validKeyInArray!0 k!761))))

(declare-fun b!1574409 () Bool)

(assert (=> b!1574409 (= e!878041 false)))

(declare-fun lt!674788 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574409 (= lt!674788 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135564 res!1075700) b!1574407))

(assert (= (and b!1574407 res!1075699) b!1574408))

(assert (= (and b!1574408 res!1075701) b!1574409))

(declare-fun m!1447645 () Bool)

(assert (=> start!135564 m!1447645))

(declare-fun m!1447647 () Bool)

(assert (=> start!135564 m!1447647))

(declare-fun m!1447649 () Bool)

(assert (=> b!1574408 m!1447649))

(declare-fun m!1447651 () Bool)

(assert (=> b!1574409 m!1447651))

(push 1)

(assert (not b!1574409))

(assert (not start!135564))

(assert (not b!1574408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

