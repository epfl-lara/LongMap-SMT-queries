; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108824 () Bool)

(assert start!108824)

(declare-fun b_free!28337 () Bool)

(declare-fun b_next!28337 () Bool)

(assert (=> start!108824 (= b_free!28337 (not b_next!28337))))

(declare-fun tp!100126 () Bool)

(declare-fun b_and!46403 () Bool)

(assert (=> start!108824 (= tp!100126 b_and!46403)))

(declare-fun mapIsEmpty!52523 () Bool)

(declare-fun mapRes!52523 () Bool)

(assert (=> mapIsEmpty!52523 mapRes!52523))

(declare-fun res!853767 () Bool)

(declare-fun e!734087 () Bool)

(assert (=> start!108824 (=> (not res!853767) (not e!734087))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108824 (= res!853767 (validMask!0 mask!2175))))

(assert (=> start!108824 e!734087))

(declare-fun tp_is_empty!33977 () Bool)

(assert (=> start!108824 tp_is_empty!33977))

(assert (=> start!108824 true))

(declare-datatypes ((V!50405 0))(
  ( (V!50406 (val!17063 Int)) )
))
(declare-datatypes ((ValueCell!16090 0))(
  ( (ValueCellFull!16090 (v!19665 V!50405)) (EmptyCell!16090) )
))
(declare-datatypes ((array!85012 0))(
  ( (array!85013 (arr!41008 (Array (_ BitVec 32) ValueCell!16090)) (size!41558 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85012)

(declare-fun e!734088 () Bool)

(declare-fun array_inv!31103 (array!85012) Bool)

(assert (=> start!108824 (and (array_inv!31103 _values!1445) e!734088)))

(declare-datatypes ((array!85014 0))(
  ( (array!85015 (arr!41009 (Array (_ BitVec 32) (_ BitVec 64))) (size!41559 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85014)

(declare-fun array_inv!31104 (array!85014) Bool)

(assert (=> start!108824 (array_inv!31104 _keys!1741)))

(assert (=> start!108824 tp!100126))

(declare-fun b!1285175 () Bool)

(declare-fun res!853769 () Bool)

(assert (=> b!1285175 (=> (not res!853769) (not e!734087))))

(declare-datatypes ((List!29061 0))(
  ( (Nil!29058) (Cons!29057 (h!30266 (_ BitVec 64)) (t!42605 List!29061)) )
))
(declare-fun arrayNoDuplicates!0 (array!85014 (_ BitVec 32) List!29061) Bool)

(assert (=> b!1285175 (= res!853769 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29058))))

(declare-fun mapNonEmpty!52523 () Bool)

(declare-fun tp!100127 () Bool)

(declare-fun e!734089 () Bool)

(assert (=> mapNonEmpty!52523 (= mapRes!52523 (and tp!100127 e!734089))))

(declare-fun mapKey!52523 () (_ BitVec 32))

(declare-fun mapValue!52523 () ValueCell!16090)

(declare-fun mapRest!52523 () (Array (_ BitVec 32) ValueCell!16090))

(assert (=> mapNonEmpty!52523 (= (arr!41008 _values!1445) (store mapRest!52523 mapKey!52523 mapValue!52523))))

(declare-fun b!1285176 () Bool)

(declare-fun res!853766 () Bool)

(assert (=> b!1285176 (=> (not res!853766) (not e!734087))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285176 (= res!853766 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41559 _keys!1741))))))

(declare-fun b!1285177 () Bool)

(assert (=> b!1285177 (= e!734089 tp_is_empty!33977)))

(declare-fun b!1285178 () Bool)

(assert (=> b!1285178 (= e!734087 false)))

(declare-fun minValue!1387 () V!50405)

(declare-fun zeroValue!1387 () V!50405)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576883 () Bool)

(declare-datatypes ((tuple2!21868 0))(
  ( (tuple2!21869 (_1!10945 (_ BitVec 64)) (_2!10945 V!50405)) )
))
(declare-datatypes ((List!29062 0))(
  ( (Nil!29059) (Cons!29058 (h!30267 tuple2!21868) (t!42606 List!29062)) )
))
(declare-datatypes ((ListLongMap!19525 0))(
  ( (ListLongMap!19526 (toList!9778 List!29062)) )
))
(declare-fun contains!7895 (ListLongMap!19525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4856 (array!85014 array!85012 (_ BitVec 32) (_ BitVec 32) V!50405 V!50405 (_ BitVec 32) Int) ListLongMap!19525)

(assert (=> b!1285178 (= lt!576883 (contains!7895 (getCurrentListMap!4856 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285179 () Bool)

(declare-fun res!853768 () Bool)

(assert (=> b!1285179 (=> (not res!853768) (not e!734087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85014 (_ BitVec 32)) Bool)

(assert (=> b!1285179 (= res!853768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285180 () Bool)

(declare-fun res!853770 () Bool)

(assert (=> b!1285180 (=> (not res!853770) (not e!734087))))

(assert (=> b!1285180 (= res!853770 (and (= (size!41558 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41559 _keys!1741) (size!41558 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285181 () Bool)

(declare-fun e!734090 () Bool)

(assert (=> b!1285181 (= e!734090 tp_is_empty!33977)))

(declare-fun b!1285182 () Bool)

(assert (=> b!1285182 (= e!734088 (and e!734090 mapRes!52523))))

(declare-fun condMapEmpty!52523 () Bool)

(declare-fun mapDefault!52523 () ValueCell!16090)

