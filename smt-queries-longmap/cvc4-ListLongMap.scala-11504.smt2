; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133874 () Bool)

(assert start!133874)

(declare-fun b_free!32135 () Bool)

(declare-fun b_next!32135 () Bool)

(assert (=> start!133874 (= b_free!32135 (not b_next!32135))))

(declare-fun tp!113700 () Bool)

(declare-fun b_and!51705 () Bool)

(assert (=> start!133874 (= tp!113700 b_and!51705)))

(declare-fun b!1565141 () Bool)

(declare-fun res!1069960 () Bool)

(declare-fun e!872389 () Bool)

(assert (=> b!1565141 (=> (not res!1069960) (not e!872389))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104504 0))(
  ( (array!104505 (arr!50441 (Array (_ BitVec 32) (_ BitVec 64))) (size!50991 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104504)

(declare-datatypes ((V!60085 0))(
  ( (V!60086 (val!19538 Int)) )
))
(declare-datatypes ((ValueCell!18424 0))(
  ( (ValueCellFull!18424 (v!22292 V!60085)) (EmptyCell!18424) )
))
(declare-datatypes ((array!104506 0))(
  ( (array!104507 (arr!50442 (Array (_ BitVec 32) ValueCell!18424)) (size!50992 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104506)

(assert (=> b!1565141 (= res!1069960 (and (= (size!50992 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50991 _keys!637) (size!50992 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59749 () Bool)

(declare-fun mapRes!59749 () Bool)

(assert (=> mapIsEmpty!59749 mapRes!59749))

(declare-fun b!1565142 () Bool)

(declare-fun res!1069958 () Bool)

(assert (=> b!1565142 (=> (not res!1069958) (not e!872389))))

(declare-datatypes ((List!36594 0))(
  ( (Nil!36591) (Cons!36590 (h!38036 (_ BitVec 64)) (t!51441 List!36594)) )
))
(declare-fun arrayNoDuplicates!0 (array!104504 (_ BitVec 32) List!36594) Bool)

(assert (=> b!1565142 (= res!1069958 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36591))))

(declare-fun b!1565143 () Bool)

(declare-fun e!872386 () Bool)

(declare-fun tp_is_empty!38909 () Bool)

(assert (=> b!1565143 (= e!872386 tp_is_empty!38909)))

(declare-fun b!1565144 () Bool)

(declare-fun res!1069957 () Bool)

(assert (=> b!1565144 (=> (not res!1069957) (not e!872389))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565144 (= res!1069957 (validKeyInArray!0 (select (arr!50441 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59749 () Bool)

(declare-fun tp!113701 () Bool)

(declare-fun e!872384 () Bool)

(assert (=> mapNonEmpty!59749 (= mapRes!59749 (and tp!113701 e!872384))))

(declare-fun mapRest!59749 () (Array (_ BitVec 32) ValueCell!18424))

(declare-fun mapValue!59749 () ValueCell!18424)

(declare-fun mapKey!59749 () (_ BitVec 32))

(assert (=> mapNonEmpty!59749 (= (arr!50442 _values!487) (store mapRest!59749 mapKey!59749 mapValue!59749))))

(declare-fun b!1565146 () Bool)

(declare-fun res!1069955 () Bool)

(assert (=> b!1565146 (=> (not res!1069955) (not e!872389))))

(assert (=> b!1565146 (= res!1069955 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50991 _keys!637)) (bvslt from!782 (size!50991 _keys!637))))))

(declare-fun b!1565147 () Bool)

(assert (=> b!1565147 (= e!872384 tp_is_empty!38909)))

(declare-fun b!1565148 () Bool)

(declare-fun e!872385 () Bool)

(assert (=> b!1565148 (= e!872385 (and e!872386 mapRes!59749))))

(declare-fun condMapEmpty!59749 () Bool)

(declare-fun mapDefault!59749 () ValueCell!18424)

