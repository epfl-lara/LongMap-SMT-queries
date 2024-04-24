; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109632 () Bool)

(assert start!109632)

(declare-fun b_free!28897 () Bool)

(declare-fun b_next!28897 () Bool)

(assert (=> start!109632 (= b_free!28897 (not b_next!28897))))

(declare-fun tp!101809 () Bool)

(declare-fun b_and!46989 () Bool)

(assert (=> start!109632 (= tp!101809 b_and!46989)))

(declare-fun b!1296572 () Bool)

(declare-fun res!861373 () Bool)

(declare-fun e!739895 () Bool)

(assert (=> b!1296572 (=> (not res!861373) (not e!739895))))

(declare-datatypes ((V!51153 0))(
  ( (V!51154 (val!17343 Int)) )
))
(declare-fun minValue!1387 () V!51153)

(declare-fun zeroValue!1387 () V!51153)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16370 0))(
  ( (ValueCellFull!16370 (v!19941 V!51153)) (EmptyCell!16370) )
))
(declare-datatypes ((array!86127 0))(
  ( (array!86128 (arr!41560 (Array (_ BitVec 32) ValueCell!16370)) (size!42111 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86127)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86129 0))(
  ( (array!86130 (arr!41561 (Array (_ BitVec 32) (_ BitVec 64))) (size!42112 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86129)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22334 0))(
  ( (tuple2!22335 (_1!11178 (_ BitVec 64)) (_2!11178 V!51153)) )
))
(declare-datatypes ((List!29500 0))(
  ( (Nil!29497) (Cons!29496 (h!30714 tuple2!22334) (t!43056 List!29500)) )
))
(declare-datatypes ((ListLongMap!19999 0))(
  ( (ListLongMap!20000 (toList!10015 List!29500)) )
))
(declare-fun contains!8146 (ListLongMap!19999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5039 (array!86129 array!86127 (_ BitVec 32) (_ BitVec 32) V!51153 V!51153 (_ BitVec 32) Int) ListLongMap!19999)

(assert (=> b!1296572 (= res!861373 (contains!8146 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296573 () Bool)

(declare-fun e!739897 () Bool)

(declare-fun tp_is_empty!34537 () Bool)

(assert (=> b!1296573 (= e!739897 tp_is_empty!34537)))

(declare-fun b!1296574 () Bool)

(declare-fun res!861371 () Bool)

(assert (=> b!1296574 (=> (not res!861371) (not e!739895))))

(assert (=> b!1296574 (= res!861371 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42112 _keys!1741))))))

(declare-fun b!1296575 () Bool)

(declare-fun res!861372 () Bool)

(assert (=> b!1296575 (=> (not res!861372) (not e!739895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296575 (= res!861372 (not (validKeyInArray!0 (select (arr!41561 _keys!1741) from!2144))))))

(declare-fun b!1296576 () Bool)

(declare-fun e!739898 () Bool)

(assert (=> b!1296576 (= e!739898 tp_is_empty!34537)))

(declare-fun b!1296577 () Bool)

(declare-fun e!739896 () Bool)

(assert (=> b!1296577 (= e!739895 (not e!739896))))

(declare-fun res!861375 () Bool)

(assert (=> b!1296577 (=> res!861375 e!739896)))

(assert (=> b!1296577 (= res!861375 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296577 (not (contains!8146 (ListLongMap!20000 Nil!29497) k0!1205))))

(declare-datatypes ((Unit!42861 0))(
  ( (Unit!42862) )
))
(declare-fun lt!580341 () Unit!42861)

(declare-fun emptyContainsNothing!173 ((_ BitVec 64)) Unit!42861)

(assert (=> b!1296577 (= lt!580341 (emptyContainsNothing!173 k0!1205))))

(declare-fun b!1296578 () Bool)

(declare-fun res!861369 () Bool)

(assert (=> b!1296578 (=> (not res!861369) (not e!739895))))

(declare-datatypes ((List!29501 0))(
  ( (Nil!29498) (Cons!29497 (h!30715 (_ BitVec 64)) (t!43057 List!29501)) )
))
(declare-fun arrayNoDuplicates!0 (array!86129 (_ BitVec 32) List!29501) Bool)

(assert (=> b!1296578 (= res!861369 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29498))))

(declare-fun mapNonEmpty!53366 () Bool)

(declare-fun mapRes!53366 () Bool)

(declare-fun tp!101810 () Bool)

(assert (=> mapNonEmpty!53366 (= mapRes!53366 (and tp!101810 e!739898))))

(declare-fun mapValue!53366 () ValueCell!16370)

(declare-fun mapKey!53366 () (_ BitVec 32))

(declare-fun mapRest!53366 () (Array (_ BitVec 32) ValueCell!16370))

(assert (=> mapNonEmpty!53366 (= (arr!41560 _values!1445) (store mapRest!53366 mapKey!53366 mapValue!53366))))

(declare-fun b!1296579 () Bool)

(declare-fun res!861374 () Bool)

(assert (=> b!1296579 (=> (not res!861374) (not e!739895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86129 (_ BitVec 32)) Bool)

(assert (=> b!1296579 (= res!861374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296580 () Bool)

(declare-fun e!739894 () Bool)

(assert (=> b!1296580 (= e!739894 (and e!739897 mapRes!53366))))

(declare-fun condMapEmpty!53366 () Bool)

(declare-fun mapDefault!53366 () ValueCell!16370)

(assert (=> b!1296580 (= condMapEmpty!53366 (= (arr!41560 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16370)) mapDefault!53366)))))

(declare-fun b!1296581 () Bool)

(declare-fun res!861376 () Bool)

(assert (=> b!1296581 (=> (not res!861376) (not e!739895))))

(assert (=> b!1296581 (= res!861376 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42112 _keys!1741))))))

(declare-fun res!861368 () Bool)

(assert (=> start!109632 (=> (not res!861368) (not e!739895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109632 (= res!861368 (validMask!0 mask!2175))))

(assert (=> start!109632 e!739895))

(assert (=> start!109632 tp_is_empty!34537))

(assert (=> start!109632 true))

(declare-fun array_inv!31701 (array!86127) Bool)

(assert (=> start!109632 (and (array_inv!31701 _values!1445) e!739894)))

(declare-fun array_inv!31702 (array!86129) Bool)

(assert (=> start!109632 (array_inv!31702 _keys!1741)))

(assert (=> start!109632 tp!101809))

(declare-fun b!1296582 () Bool)

(declare-fun res!861370 () Bool)

(assert (=> b!1296582 (=> (not res!861370) (not e!739895))))

(assert (=> b!1296582 (= res!861370 (and (= (size!42111 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42112 _keys!1741) (size!42111 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296583 () Bool)

(assert (=> b!1296583 (= e!739896 true)))

(declare-fun lt!580340 () ListLongMap!19999)

(declare-fun +!4459 (ListLongMap!19999 tuple2!22334) ListLongMap!19999)

(assert (=> b!1296583 (not (contains!8146 (+!4459 lt!580340 (tuple2!22335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580339 () Unit!42861)

(declare-fun addStillNotContains!435 (ListLongMap!19999 (_ BitVec 64) V!51153 (_ BitVec 64)) Unit!42861)

(assert (=> b!1296583 (= lt!580339 (addStillNotContains!435 lt!580340 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6101 (array!86129 array!86127 (_ BitVec 32) (_ BitVec 32) V!51153 V!51153 (_ BitVec 32) Int) ListLongMap!19999)

(assert (=> b!1296583 (= lt!580340 (getCurrentListMapNoExtraKeys!6101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53366 () Bool)

(assert (=> mapIsEmpty!53366 mapRes!53366))

(assert (= (and start!109632 res!861368) b!1296582))

(assert (= (and b!1296582 res!861370) b!1296579))

(assert (= (and b!1296579 res!861374) b!1296578))

(assert (= (and b!1296578 res!861369) b!1296574))

(assert (= (and b!1296574 res!861371) b!1296572))

(assert (= (and b!1296572 res!861373) b!1296581))

(assert (= (and b!1296581 res!861376) b!1296575))

(assert (= (and b!1296575 res!861372) b!1296577))

(assert (= (and b!1296577 (not res!861375)) b!1296583))

(assert (= (and b!1296580 condMapEmpty!53366) mapIsEmpty!53366))

(assert (= (and b!1296580 (not condMapEmpty!53366)) mapNonEmpty!53366))

(get-info :version)

(assert (= (and mapNonEmpty!53366 ((_ is ValueCellFull!16370) mapValue!53366)) b!1296576))

(assert (= (and b!1296580 ((_ is ValueCellFull!16370) mapDefault!53366)) b!1296573))

(assert (= start!109632 b!1296580))

(declare-fun m!1188921 () Bool)

(assert (=> b!1296577 m!1188921))

(declare-fun m!1188923 () Bool)

(assert (=> b!1296577 m!1188923))

(declare-fun m!1188925 () Bool)

(assert (=> mapNonEmpty!53366 m!1188925))

(declare-fun m!1188927 () Bool)

(assert (=> b!1296579 m!1188927))

(declare-fun m!1188929 () Bool)

(assert (=> b!1296575 m!1188929))

(assert (=> b!1296575 m!1188929))

(declare-fun m!1188931 () Bool)

(assert (=> b!1296575 m!1188931))

(declare-fun m!1188933 () Bool)

(assert (=> b!1296572 m!1188933))

(assert (=> b!1296572 m!1188933))

(declare-fun m!1188935 () Bool)

(assert (=> b!1296572 m!1188935))

(declare-fun m!1188937 () Bool)

(assert (=> start!109632 m!1188937))

(declare-fun m!1188939 () Bool)

(assert (=> start!109632 m!1188939))

(declare-fun m!1188941 () Bool)

(assert (=> start!109632 m!1188941))

(declare-fun m!1188943 () Bool)

(assert (=> b!1296578 m!1188943))

(declare-fun m!1188945 () Bool)

(assert (=> b!1296583 m!1188945))

(assert (=> b!1296583 m!1188945))

(declare-fun m!1188947 () Bool)

(assert (=> b!1296583 m!1188947))

(declare-fun m!1188949 () Bool)

(assert (=> b!1296583 m!1188949))

(declare-fun m!1188951 () Bool)

(assert (=> b!1296583 m!1188951))

(check-sat b_and!46989 (not b!1296578) (not b!1296572) (not b!1296577) (not mapNonEmpty!53366) (not b!1296575) (not start!109632) (not b!1296579) (not b!1296583) (not b_next!28897) tp_is_empty!34537)
(check-sat b_and!46989 (not b_next!28897))
