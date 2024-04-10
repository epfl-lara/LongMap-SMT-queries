; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108504 () Bool)

(assert start!108504)

(declare-fun b_free!28051 () Bool)

(declare-fun b_next!28051 () Bool)

(assert (=> start!108504 (= b_free!28051 (not b_next!28051))))

(declare-fun tp!99262 () Bool)

(declare-fun b_and!46111 () Bool)

(assert (=> start!108504 (= tp!99262 b_and!46111)))

(declare-fun res!850694 () Bool)

(declare-fun e!731746 () Bool)

(assert (=> start!108504 (=> (not res!850694) (not e!731746))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108504 (= res!850694 (validMask!0 mask!2175))))

(assert (=> start!108504 e!731746))

(declare-fun tp_is_empty!33691 () Bool)

(assert (=> start!108504 tp_is_empty!33691))

(assert (=> start!108504 true))

(declare-datatypes ((V!50025 0))(
  ( (V!50026 (val!16920 Int)) )
))
(declare-datatypes ((ValueCell!15947 0))(
  ( (ValueCellFull!15947 (v!19520 V!50025)) (EmptyCell!15947) )
))
(declare-datatypes ((array!84458 0))(
  ( (array!84459 (arr!40733 (Array (_ BitVec 32) ValueCell!15947)) (size!41283 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84458)

(declare-fun e!731748 () Bool)

(declare-fun array_inv!30913 (array!84458) Bool)

(assert (=> start!108504 (and (array_inv!30913 _values!1445) e!731748)))

(declare-datatypes ((array!84460 0))(
  ( (array!84461 (arr!40734 (Array (_ BitVec 32) (_ BitVec 64))) (size!41284 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84460)

(declare-fun array_inv!30914 (array!84460) Bool)

(assert (=> start!108504 (array_inv!30914 _keys!1741)))

(assert (=> start!108504 tp!99262))

(declare-fun b!1280665 () Bool)

(declare-fun res!850691 () Bool)

(assert (=> b!1280665 (=> (not res!850691) (not e!731746))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280665 (= res!850691 (and (= (size!41283 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41284 _keys!1741) (size!41283 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280666 () Bool)

(declare-fun res!850697 () Bool)

(assert (=> b!1280666 (=> (not res!850697) (not e!731746))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280666 (= res!850697 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41284 _keys!1741))))))

(declare-fun b!1280667 () Bool)

(declare-fun res!850696 () Bool)

(assert (=> b!1280667 (=> (not res!850696) (not e!731746))))

(declare-datatypes ((List!28855 0))(
  ( (Nil!28852) (Cons!28851 (h!30060 (_ BitVec 64)) (t!42395 List!28855)) )
))
(declare-fun arrayNoDuplicates!0 (array!84460 (_ BitVec 32) List!28855) Bool)

(assert (=> b!1280667 (= res!850696 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28852))))

(declare-fun mapIsEmpty!52088 () Bool)

(declare-fun mapRes!52088 () Bool)

(assert (=> mapIsEmpty!52088 mapRes!52088))

(declare-fun b!1280668 () Bool)

(declare-fun res!850692 () Bool)

(assert (=> b!1280668 (=> (not res!850692) (not e!731746))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1280668 (= res!850692 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41284 _keys!1741)) (not (= (select (arr!40734 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1280669 () Bool)

(assert (=> b!1280669 (= e!731746 (not true))))

(declare-fun minValue!1387 () V!50025)

(declare-fun zeroValue!1387 () V!50025)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21658 0))(
  ( (tuple2!21659 (_1!10840 (_ BitVec 64)) (_2!10840 V!50025)) )
))
(declare-datatypes ((List!28856 0))(
  ( (Nil!28853) (Cons!28852 (h!30061 tuple2!21658) (t!42396 List!28856)) )
))
(declare-datatypes ((ListLongMap!19315 0))(
  ( (ListLongMap!19316 (toList!9673 List!28856)) )
))
(declare-fun contains!7788 (ListLongMap!19315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4757 (array!84460 array!84458 (_ BitVec 32) (_ BitVec 32) V!50025 V!50025 (_ BitVec 32) Int) ListLongMap!19315)

(assert (=> b!1280669 (contains!7788 (getCurrentListMap!4757 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42403 0))(
  ( (Unit!42404) )
))
(declare-fun lt!576149 () Unit!42403)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!6 (array!84460 array!84458 (_ BitVec 32) (_ BitVec 32) V!50025 V!50025 (_ BitVec 64) (_ BitVec 32) Int) Unit!42403)

(assert (=> b!1280669 (= lt!576149 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!6 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280670 () Bool)

(declare-fun res!850693 () Bool)

(assert (=> b!1280670 (=> (not res!850693) (not e!731746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84460 (_ BitVec 32)) Bool)

(assert (=> b!1280670 (= res!850693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280671 () Bool)

(declare-fun res!850695 () Bool)

(assert (=> b!1280671 (=> (not res!850695) (not e!731746))))

(assert (=> b!1280671 (= res!850695 (contains!7788 (getCurrentListMap!4757 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280672 () Bool)

(declare-fun e!731747 () Bool)

(assert (=> b!1280672 (= e!731747 tp_is_empty!33691)))

(declare-fun mapNonEmpty!52088 () Bool)

(declare-fun tp!99263 () Bool)

(declare-fun e!731749 () Bool)

(assert (=> mapNonEmpty!52088 (= mapRes!52088 (and tp!99263 e!731749))))

(declare-fun mapRest!52088 () (Array (_ BitVec 32) ValueCell!15947))

(declare-fun mapValue!52088 () ValueCell!15947)

(declare-fun mapKey!52088 () (_ BitVec 32))

(assert (=> mapNonEmpty!52088 (= (arr!40733 _values!1445) (store mapRest!52088 mapKey!52088 mapValue!52088))))

(declare-fun b!1280673 () Bool)

(assert (=> b!1280673 (= e!731748 (and e!731747 mapRes!52088))))

(declare-fun condMapEmpty!52088 () Bool)

(declare-fun mapDefault!52088 () ValueCell!15947)

