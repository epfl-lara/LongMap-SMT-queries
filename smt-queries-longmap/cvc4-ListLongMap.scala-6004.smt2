; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77880 () Bool)

(assert start!77880)

(declare-fun b_free!16439 () Bool)

(declare-fun b_next!16439 () Bool)

(assert (=> start!77880 (= b_free!16439 (not b_next!16439))))

(declare-fun tp!57581 () Bool)

(declare-fun b_and!27007 () Bool)

(assert (=> start!77880 (= tp!57581 b_and!27007)))

(declare-fun mapIsEmpty!30001 () Bool)

(declare-fun mapRes!30001 () Bool)

(assert (=> mapIsEmpty!30001 mapRes!30001))

(declare-fun b!909370 () Bool)

(declare-fun e!509732 () Bool)

(declare-fun tp_is_empty!18857 () Bool)

(assert (=> b!909370 (= e!509732 tp_is_empty!18857)))

(declare-fun b!909371 () Bool)

(declare-fun e!509736 () Bool)

(assert (=> b!909371 (= e!509736 false)))

(declare-datatypes ((V!30107 0))(
  ( (V!30108 (val!9479 Int)) )
))
(declare-datatypes ((ValueCell!8947 0))(
  ( (ValueCellFull!8947 (v!11986 V!30107)) (EmptyCell!8947) )
))
(declare-datatypes ((array!53740 0))(
  ( (array!53741 (arr!25828 (Array (_ BitVec 32) ValueCell!8947)) (size!26287 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53740)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30107)

(declare-datatypes ((array!53742 0))(
  ( (array!53743 (arr!25829 (Array (_ BitVec 32) (_ BitVec 64))) (size!26288 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53742)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30107)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!409985 () Bool)

(declare-datatypes ((tuple2!12356 0))(
  ( (tuple2!12357 (_1!6189 (_ BitVec 64)) (_2!6189 V!30107)) )
))
(declare-datatypes ((List!18148 0))(
  ( (Nil!18145) (Cons!18144 (h!19290 tuple2!12356) (t!25729 List!18148)) )
))
(declare-datatypes ((ListLongMap!11053 0))(
  ( (ListLongMap!11054 (toList!5542 List!18148)) )
))
(declare-fun contains!4584 (ListLongMap!11053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2804 (array!53742 array!53740 (_ BitVec 32) (_ BitVec 32) V!30107 V!30107 (_ BitVec 32) Int) ListLongMap!11053)

(assert (=> b!909371 (= lt!409985 (contains!4584 (getCurrentListMap!2804 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30001 () Bool)

(declare-fun tp!57582 () Bool)

(declare-fun e!509735 () Bool)

(assert (=> mapNonEmpty!30001 (= mapRes!30001 (and tp!57582 e!509735))))

(declare-fun mapRest!30001 () (Array (_ BitVec 32) ValueCell!8947))

(declare-fun mapValue!30001 () ValueCell!8947)

(declare-fun mapKey!30001 () (_ BitVec 32))

(assert (=> mapNonEmpty!30001 (= (arr!25828 _values!1152) (store mapRest!30001 mapKey!30001 mapValue!30001))))

(declare-fun res!613773 () Bool)

(assert (=> start!77880 (=> (not res!613773) (not e!509736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77880 (= res!613773 (validMask!0 mask!1756))))

(assert (=> start!77880 e!509736))

(declare-fun e!509734 () Bool)

(declare-fun array_inv!20208 (array!53740) Bool)

(assert (=> start!77880 (and (array_inv!20208 _values!1152) e!509734)))

(assert (=> start!77880 tp!57581))

(assert (=> start!77880 true))

(assert (=> start!77880 tp_is_empty!18857))

(declare-fun array_inv!20209 (array!53742) Bool)

(assert (=> start!77880 (array_inv!20209 _keys!1386)))

(declare-fun b!909372 () Bool)

(declare-fun res!613771 () Bool)

(assert (=> b!909372 (=> (not res!613771) (not e!509736))))

(declare-datatypes ((List!18149 0))(
  ( (Nil!18146) (Cons!18145 (h!19291 (_ BitVec 64)) (t!25730 List!18149)) )
))
(declare-fun arrayNoDuplicates!0 (array!53742 (_ BitVec 32) List!18149) Bool)

(assert (=> b!909372 (= res!613771 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18146))))

(declare-fun b!909373 () Bool)

(declare-fun res!613772 () Bool)

(assert (=> b!909373 (=> (not res!613772) (not e!509736))))

(assert (=> b!909373 (= res!613772 (and (= (size!26287 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26288 _keys!1386) (size!26287 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909374 () Bool)

(assert (=> b!909374 (= e!509734 (and e!509732 mapRes!30001))))

(declare-fun condMapEmpty!30001 () Bool)

(declare-fun mapDefault!30001 () ValueCell!8947)

