; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133570 () Bool)

(assert start!133570)

(declare-fun b_free!31987 () Bool)

(declare-fun b_next!31987 () Bool)

(assert (=> start!133570 (= b_free!31987 (not b_next!31987))))

(declare-fun tp!113084 () Bool)

(declare-fun b_and!51485 () Bool)

(assert (=> start!133570 (= tp!113084 b_and!51485)))

(declare-fun mapIsEmpty!59355 () Bool)

(declare-fun mapRes!59355 () Bool)

(assert (=> mapIsEmpty!59355 mapRes!59355))

(declare-fun b!1561587 () Bool)

(declare-fun res!1067720 () Bool)

(declare-fun e!870229 () Bool)

(assert (=> b!1561587 (=> (not res!1067720) (not e!870229))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104024 0))(
  ( (array!104025 (arr!50204 (Array (_ BitVec 32) (_ BitVec 64))) (size!50754 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104024)

(assert (=> b!1561587 (= res!1067720 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50754 _keys!637)) (bvslt from!782 (size!50754 _keys!637))))))

(declare-fun res!1067719 () Bool)

(assert (=> start!133570 (=> (not res!1067719) (not e!870229))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133570 (= res!1067719 (validMask!0 mask!947))))

(assert (=> start!133570 e!870229))

(assert (=> start!133570 tp!113084))

(declare-fun tp_is_empty!38653 () Bool)

(assert (=> start!133570 tp_is_empty!38653))

(assert (=> start!133570 true))

(declare-fun array_inv!39023 (array!104024) Bool)

(assert (=> start!133570 (array_inv!39023 _keys!637)))

(declare-datatypes ((V!59745 0))(
  ( (V!59746 (val!19410 Int)) )
))
(declare-datatypes ((ValueCell!18296 0))(
  ( (ValueCellFull!18296 (v!22162 V!59745)) (EmptyCell!18296) )
))
(declare-datatypes ((array!104026 0))(
  ( (array!104027 (arr!50205 (Array (_ BitVec 32) ValueCell!18296)) (size!50755 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104026)

(declare-fun e!870225 () Bool)

(declare-fun array_inv!39024 (array!104026) Bool)

(assert (=> start!133570 (and (array_inv!39024 _values!487) e!870225)))

(declare-fun b!1561588 () Bool)

(declare-fun e!870226 () Bool)

(assert (=> b!1561588 (= e!870226 tp_is_empty!38653)))

(declare-fun b!1561589 () Bool)

(declare-fun res!1067716 () Bool)

(assert (=> b!1561589 (=> (not res!1067716) (not e!870229))))

(declare-datatypes ((List!36447 0))(
  ( (Nil!36444) (Cons!36443 (h!37889 (_ BitVec 64)) (t!51224 List!36447)) )
))
(declare-fun arrayNoDuplicates!0 (array!104024 (_ BitVec 32) List!36447) Bool)

(assert (=> b!1561589 (= res!1067716 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36444))))

(declare-fun b!1561590 () Bool)

(declare-fun e!870228 () Bool)

(assert (=> b!1561590 (= e!870228 tp_is_empty!38653)))

(declare-fun mapNonEmpty!59355 () Bool)

(declare-fun tp!113085 () Bool)

(assert (=> mapNonEmpty!59355 (= mapRes!59355 (and tp!113085 e!870226))))

(declare-fun mapValue!59355 () ValueCell!18296)

(declare-fun mapKey!59355 () (_ BitVec 32))

(declare-fun mapRest!59355 () (Array (_ BitVec 32) ValueCell!18296))

(assert (=> mapNonEmpty!59355 (= (arr!50205 _values!487) (store mapRest!59355 mapKey!59355 mapValue!59355))))

(declare-fun b!1561591 () Bool)

(declare-fun res!1067721 () Bool)

(assert (=> b!1561591 (=> (not res!1067721) (not e!870229))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561591 (= res!1067721 (and (= (size!50755 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50754 _keys!637) (size!50755 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561592 () Bool)

(assert (=> b!1561592 (= e!870225 (and e!870228 mapRes!59355))))

(declare-fun condMapEmpty!59355 () Bool)

(declare-fun mapDefault!59355 () ValueCell!18296)

