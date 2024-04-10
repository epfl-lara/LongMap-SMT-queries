; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133576 () Bool)

(assert start!133576)

(declare-fun b_free!31993 () Bool)

(declare-fun b_next!31993 () Bool)

(assert (=> start!133576 (= b_free!31993 (not b_next!31993))))

(declare-fun tp!113103 () Bool)

(declare-fun b_and!51497 () Bool)

(assert (=> start!133576 (= tp!113103 b_and!51497)))

(declare-fun b!1561674 () Bool)

(declare-fun res!1067771 () Bool)

(declare-fun e!870270 () Bool)

(assert (=> b!1561674 (=> (not res!1067771) (not e!870270))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104036 0))(
  ( (array!104037 (arr!50210 (Array (_ BitVec 32) (_ BitVec 64))) (size!50760 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104036)

(assert (=> b!1561674 (= res!1067771 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50760 _keys!637)) (bvslt from!782 (size!50760 _keys!637))))))

(declare-fun mapIsEmpty!59364 () Bool)

(declare-fun mapRes!59364 () Bool)

(assert (=> mapIsEmpty!59364 mapRes!59364))

(declare-fun b!1561675 () Bool)

(declare-fun res!1067772 () Bool)

(assert (=> b!1561675 (=> (not res!1067772) (not e!870270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561675 (= res!1067772 (validKeyInArray!0 (select (arr!50210 _keys!637) from!782)))))

(declare-fun res!1067773 () Bool)

(assert (=> start!133576 (=> (not res!1067773) (not e!870270))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133576 (= res!1067773 (validMask!0 mask!947))))

(assert (=> start!133576 e!870270))

(assert (=> start!133576 tp!113103))

(declare-fun tp_is_empty!38659 () Bool)

(assert (=> start!133576 tp_is_empty!38659))

(assert (=> start!133576 true))

(declare-fun array_inv!39029 (array!104036) Bool)

(assert (=> start!133576 (array_inv!39029 _keys!637)))

(declare-datatypes ((V!59753 0))(
  ( (V!59754 (val!19413 Int)) )
))
(declare-datatypes ((ValueCell!18299 0))(
  ( (ValueCellFull!18299 (v!22165 V!59753)) (EmptyCell!18299) )
))
(declare-datatypes ((array!104038 0))(
  ( (array!104039 (arr!50211 (Array (_ BitVec 32) ValueCell!18299)) (size!50761 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104038)

(declare-fun e!870272 () Bool)

(declare-fun array_inv!39030 (array!104038) Bool)

(assert (=> start!133576 (and (array_inv!39030 _values!487) e!870272)))

(declare-fun mapNonEmpty!59364 () Bool)

(declare-fun tp!113102 () Bool)

(declare-fun e!870271 () Bool)

(assert (=> mapNonEmpty!59364 (= mapRes!59364 (and tp!113102 e!870271))))

(declare-fun mapRest!59364 () (Array (_ BitVec 32) ValueCell!18299))

(declare-fun mapKey!59364 () (_ BitVec 32))

(declare-fun mapValue!59364 () ValueCell!18299)

(assert (=> mapNonEmpty!59364 (= (arr!50211 _values!487) (store mapRest!59364 mapKey!59364 mapValue!59364))))

(declare-fun b!1561676 () Bool)

(declare-fun e!870273 () Bool)

(assert (=> b!1561676 (= e!870272 (and e!870273 mapRes!59364))))

(declare-fun condMapEmpty!59364 () Bool)

(declare-fun mapDefault!59364 () ValueCell!18299)

