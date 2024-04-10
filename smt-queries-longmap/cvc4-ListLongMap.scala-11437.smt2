; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133424 () Bool)

(assert start!133424)

(declare-fun b!1559790 () Bool)

(declare-fun res!1066621 () Bool)

(declare-fun e!869133 () Bool)

(assert (=> b!1559790 (=> (not res!1066621) (not e!869133))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103740 0))(
  ( (array!103741 (arr!50062 (Array (_ BitVec 32) (_ BitVec 64))) (size!50612 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103740)

(declare-datatypes ((V!59549 0))(
  ( (V!59550 (val!19337 Int)) )
))
(declare-datatypes ((ValueCell!18223 0))(
  ( (ValueCellFull!18223 (v!22089 V!59549)) (EmptyCell!18223) )
))
(declare-datatypes ((array!103742 0))(
  ( (array!103743 (arr!50063 (Array (_ BitVec 32) ValueCell!18223)) (size!50613 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103742)

(assert (=> b!1559790 (= res!1066621 (and (= (size!50613 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50612 _keys!637) (size!50613 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559791 () Bool)

(declare-fun res!1066623 () Bool)

(assert (=> b!1559791 (=> (not res!1066623) (not e!869133))))

(declare-datatypes ((List!36364 0))(
  ( (Nil!36361) (Cons!36360 (h!37806 (_ BitVec 64)) (t!51097 List!36364)) )
))
(declare-fun arrayNoDuplicates!0 (array!103740 (_ BitVec 32) List!36364) Bool)

(assert (=> b!1559791 (= res!1066623 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36361))))

(declare-fun b!1559792 () Bool)

(declare-fun e!869130 () Bool)

(declare-fun e!869131 () Bool)

(declare-fun mapRes!59136 () Bool)

(assert (=> b!1559792 (= e!869130 (and e!869131 mapRes!59136))))

(declare-fun condMapEmpty!59136 () Bool)

(declare-fun mapDefault!59136 () ValueCell!18223)

