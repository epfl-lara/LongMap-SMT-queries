; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108802 () Bool)

(assert start!108802)

(declare-fun b_free!28315 () Bool)

(declare-fun b_next!28315 () Bool)

(assert (=> start!108802 (= b_free!28315 (not b_next!28315))))

(declare-fun tp!100061 () Bool)

(declare-fun b_and!46381 () Bool)

(assert (=> start!108802 (= tp!100061 b_and!46381)))

(declare-fun b!1284818 () Bool)

(declare-fun res!853514 () Bool)

(declare-fun e!733925 () Bool)

(assert (=> b!1284818 (=> (not res!853514) (not e!733925))))

(declare-datatypes ((array!84968 0))(
  ( (array!84969 (arr!40986 (Array (_ BitVec 32) (_ BitVec 64))) (size!41536 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84968)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84968 (_ BitVec 32)) Bool)

(assert (=> b!1284818 (= res!853514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284819 () Bool)

(declare-fun res!853509 () Bool)

(assert (=> b!1284819 (=> (not res!853509) (not e!733925))))

(declare-datatypes ((V!50377 0))(
  ( (V!50378 (val!17052 Int)) )
))
(declare-datatypes ((ValueCell!16079 0))(
  ( (ValueCellFull!16079 (v!19654 V!50377)) (EmptyCell!16079) )
))
(declare-datatypes ((array!84970 0))(
  ( (array!84971 (arr!40987 (Array (_ BitVec 32) ValueCell!16079)) (size!41537 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84970)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284819 (= res!853509 (and (= (size!41537 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41536 _keys!1741) (size!41537 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52490 () Bool)

(declare-fun mapRes!52490 () Bool)

(declare-fun tp!100060 () Bool)

(declare-fun e!733924 () Bool)

(assert (=> mapNonEmpty!52490 (= mapRes!52490 (and tp!100060 e!733924))))

(declare-fun mapValue!52490 () ValueCell!16079)

(declare-fun mapRest!52490 () (Array (_ BitVec 32) ValueCell!16079))

(declare-fun mapKey!52490 () (_ BitVec 32))

(assert (=> mapNonEmpty!52490 (= (arr!40987 _values!1445) (store mapRest!52490 mapKey!52490 mapValue!52490))))

(declare-fun mapIsEmpty!52490 () Bool)

(assert (=> mapIsEmpty!52490 mapRes!52490))

(declare-fun b!1284820 () Bool)

(declare-fun res!853510 () Bool)

(assert (=> b!1284820 (=> (not res!853510) (not e!733925))))

(declare-fun minValue!1387 () V!50377)

(declare-fun zeroValue!1387 () V!50377)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21848 0))(
  ( (tuple2!21849 (_1!10935 (_ BitVec 64)) (_2!10935 V!50377)) )
))
(declare-datatypes ((List!29043 0))(
  ( (Nil!29040) (Cons!29039 (h!30248 tuple2!21848) (t!42587 List!29043)) )
))
(declare-datatypes ((ListLongMap!19505 0))(
  ( (ListLongMap!19506 (toList!9768 List!29043)) )
))
(declare-fun contains!7885 (ListLongMap!19505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4847 (array!84968 array!84970 (_ BitVec 32) (_ BitVec 32) V!50377 V!50377 (_ BitVec 32) Int) ListLongMap!19505)

(assert (=> b!1284820 (= res!853510 (contains!7885 (getCurrentListMap!4847 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!853513 () Bool)

(assert (=> start!108802 (=> (not res!853513) (not e!733925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108802 (= res!853513 (validMask!0 mask!2175))))

(assert (=> start!108802 e!733925))

(declare-fun tp_is_empty!33955 () Bool)

(assert (=> start!108802 tp_is_empty!33955))

(assert (=> start!108802 true))

(declare-fun e!733921 () Bool)

(declare-fun array_inv!31087 (array!84970) Bool)

(assert (=> start!108802 (and (array_inv!31087 _values!1445) e!733921)))

(declare-fun array_inv!31088 (array!84968) Bool)

(assert (=> start!108802 (array_inv!31088 _keys!1741)))

(assert (=> start!108802 tp!100061))

(declare-fun b!1284821 () Bool)

(declare-fun res!853508 () Bool)

(assert (=> b!1284821 (=> (not res!853508) (not e!733925))))

(assert (=> b!1284821 (= res!853508 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41536 _keys!1741))))))

(declare-fun b!1284822 () Bool)

(declare-fun res!853511 () Bool)

(assert (=> b!1284822 (=> (not res!853511) (not e!733925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284822 (= res!853511 (validKeyInArray!0 (select (arr!40986 _keys!1741) from!2144)))))

(declare-fun b!1284823 () Bool)

(assert (=> b!1284823 (= e!733925 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41536 _keys!1741))))))

(declare-fun b!1284824 () Bool)

(declare-fun res!853512 () Bool)

(assert (=> b!1284824 (=> (not res!853512) (not e!733925))))

(assert (=> b!1284824 (= res!853512 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41536 _keys!1741))))))

(declare-fun b!1284825 () Bool)

(assert (=> b!1284825 (= e!733924 tp_is_empty!33955)))

(declare-fun b!1284826 () Bool)

(declare-fun e!733923 () Bool)

(assert (=> b!1284826 (= e!733923 tp_is_empty!33955)))

(declare-fun b!1284827 () Bool)

(assert (=> b!1284827 (= e!733921 (and e!733923 mapRes!52490))))

(declare-fun condMapEmpty!52490 () Bool)

(declare-fun mapDefault!52490 () ValueCell!16079)

