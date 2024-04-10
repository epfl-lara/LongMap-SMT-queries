; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109250 () Bool)

(assert start!109250)

(declare-fun b_free!28739 () Bool)

(declare-fun b_next!28739 () Bool)

(assert (=> start!109250 (= b_free!28739 (not b_next!28739))))

(declare-fun tp!101335 () Bool)

(declare-fun b_and!46829 () Bool)

(assert (=> start!109250 (= tp!101335 b_and!46829)))

(declare-fun b!1292514 () Bool)

(declare-fun e!737719 () Bool)

(declare-fun tp_is_empty!34379 () Bool)

(assert (=> b!1292514 (= e!737719 tp_is_empty!34379)))

(declare-fun mapIsEmpty!53129 () Bool)

(declare-fun mapRes!53129 () Bool)

(assert (=> mapIsEmpty!53129 mapRes!53129))

(declare-fun b!1292516 () Bool)

(declare-fun res!858807 () Bool)

(declare-fun e!737716 () Bool)

(assert (=> b!1292516 (=> (not res!858807) (not e!737716))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85790 0))(
  ( (array!85791 (arr!41396 (Array (_ BitVec 32) (_ BitVec 64))) (size!41946 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85790)

(assert (=> b!1292516 (= res!858807 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41946 _keys!1741))))))

(declare-fun b!1292517 () Bool)

(declare-fun res!858812 () Bool)

(assert (=> b!1292517 (=> (not res!858812) (not e!737716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292517 (= res!858812 (not (validKeyInArray!0 (select (arr!41396 _keys!1741) from!2144))))))

(declare-fun b!1292518 () Bool)

(declare-fun e!737720 () Bool)

(assert (=> b!1292518 (= e!737720 tp_is_empty!34379)))

(declare-fun mapNonEmpty!53129 () Bool)

(declare-fun tp!101336 () Bool)

(assert (=> mapNonEmpty!53129 (= mapRes!53129 (and tp!101336 e!737720))))

(declare-datatypes ((V!50941 0))(
  ( (V!50942 (val!17264 Int)) )
))
(declare-datatypes ((ValueCell!16291 0))(
  ( (ValueCellFull!16291 (v!19867 V!50941)) (EmptyCell!16291) )
))
(declare-fun mapValue!53129 () ValueCell!16291)

(declare-fun mapRest!53129 () (Array (_ BitVec 32) ValueCell!16291))

(declare-datatypes ((array!85792 0))(
  ( (array!85793 (arr!41397 (Array (_ BitVec 32) ValueCell!16291)) (size!41947 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85792)

(declare-fun mapKey!53129 () (_ BitVec 32))

(assert (=> mapNonEmpty!53129 (= (arr!41397 _values!1445) (store mapRest!53129 mapKey!53129 mapValue!53129))))

(declare-fun b!1292519 () Bool)

(declare-fun res!858810 () Bool)

(assert (=> b!1292519 (=> (not res!858810) (not e!737716))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1292519 (= res!858810 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41946 _keys!1741))))))

(declare-fun b!1292520 () Bool)

(declare-fun res!858809 () Bool)

(assert (=> b!1292520 (=> (not res!858809) (not e!737716))))

(declare-fun minValue!1387 () V!50941)

(declare-fun zeroValue!1387 () V!50941)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22212 0))(
  ( (tuple2!22213 (_1!11117 (_ BitVec 64)) (_2!11117 V!50941)) )
))
(declare-datatypes ((List!29364 0))(
  ( (Nil!29361) (Cons!29360 (h!30569 tuple2!22212) (t!42928 List!29364)) )
))
(declare-datatypes ((ListLongMap!19869 0))(
  ( (ListLongMap!19870 (toList!9950 List!29364)) )
))
(declare-fun contains!8068 (ListLongMap!19869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4996 (array!85790 array!85792 (_ BitVec 32) (_ BitVec 32) V!50941 V!50941 (_ BitVec 32) Int) ListLongMap!19869)

(assert (=> b!1292520 (= res!858809 (contains!8068 (getCurrentListMap!4996 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292521 () Bool)

(declare-fun res!858808 () Bool)

(assert (=> b!1292521 (=> (not res!858808) (not e!737716))))

(declare-datatypes ((List!29365 0))(
  ( (Nil!29362) (Cons!29361 (h!30570 (_ BitVec 64)) (t!42929 List!29365)) )
))
(declare-fun arrayNoDuplicates!0 (array!85790 (_ BitVec 32) List!29365) Bool)

(assert (=> b!1292521 (= res!858808 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29362))))

(declare-fun b!1292522 () Bool)

(declare-fun res!858806 () Bool)

(assert (=> b!1292522 (=> (not res!858806) (not e!737716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85790 (_ BitVec 32)) Bool)

(assert (=> b!1292522 (= res!858806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292515 () Bool)

(declare-fun e!737717 () Bool)

(assert (=> b!1292515 (= e!737717 (and e!737719 mapRes!53129))))

(declare-fun condMapEmpty!53129 () Bool)

(declare-fun mapDefault!53129 () ValueCell!16291)

