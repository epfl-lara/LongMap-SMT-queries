; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109446 () Bool)

(assert start!109446)

(declare-fun b_free!28711 () Bool)

(declare-fun b_next!28711 () Bool)

(assert (=> start!109446 (= b_free!28711 (not b_next!28711))))

(declare-fun tp!101252 () Bool)

(declare-fun b_and!46803 () Bool)

(assert (=> start!109446 (= tp!101252 b_and!46803)))

(declare-fun b!1293357 () Bool)

(declare-fun e!738354 () Bool)

(declare-fun tp_is_empty!34351 () Bool)

(assert (=> b!1293357 (= e!738354 tp_is_empty!34351)))

(declare-fun b!1293358 () Bool)

(declare-fun res!858995 () Bool)

(declare-fun e!738355 () Bool)

(assert (=> b!1293358 (=> (not res!858995) (not e!738355))))

(declare-datatypes ((array!85769 0))(
  ( (array!85770 (arr!41381 (Array (_ BitVec 32) (_ BitVec 64))) (size!41932 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85769)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85769 (_ BitVec 32)) Bool)

(assert (=> b!1293358 (= res!858995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53087 () Bool)

(declare-fun mapRes!53087 () Bool)

(declare-fun tp!101251 () Bool)

(assert (=> mapNonEmpty!53087 (= mapRes!53087 (and tp!101251 e!738354))))

(declare-fun mapKey!53087 () (_ BitVec 32))

(declare-datatypes ((V!50905 0))(
  ( (V!50906 (val!17250 Int)) )
))
(declare-datatypes ((ValueCell!16277 0))(
  ( (ValueCellFull!16277 (v!19848 V!50905)) (EmptyCell!16277) )
))
(declare-fun mapRest!53087 () (Array (_ BitVec 32) ValueCell!16277))

(declare-datatypes ((array!85771 0))(
  ( (array!85772 (arr!41382 (Array (_ BitVec 32) ValueCell!16277)) (size!41933 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85771)

(declare-fun mapValue!53087 () ValueCell!16277)

(assert (=> mapNonEmpty!53087 (= (arr!41382 _values!1445) (store mapRest!53087 mapKey!53087 mapValue!53087))))

(declare-fun b!1293359 () Bool)

(declare-fun e!738356 () Bool)

(assert (=> b!1293359 (= e!738356 tp_is_empty!34351)))

(declare-fun b!1293360 () Bool)

(declare-fun res!858996 () Bool)

(assert (=> b!1293360 (=> (not res!858996) (not e!738355))))

(declare-fun minValue!1387 () V!50905)

(declare-fun zeroValue!1387 () V!50905)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22202 0))(
  ( (tuple2!22203 (_1!11112 (_ BitVec 64)) (_2!11112 V!50905)) )
))
(declare-datatypes ((List!29373 0))(
  ( (Nil!29370) (Cons!29369 (h!30587 tuple2!22202) (t!42929 List!29373)) )
))
(declare-datatypes ((ListLongMap!19867 0))(
  ( (ListLongMap!19868 (toList!9949 List!29373)) )
))
(declare-fun contains!8080 (ListLongMap!19867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4982 (array!85769 array!85771 (_ BitVec 32) (_ BitVec 32) V!50905 V!50905 (_ BitVec 32) Int) ListLongMap!19867)

(assert (=> b!1293360 (= res!858996 (contains!8080 (getCurrentListMap!4982 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293361 () Bool)

(declare-fun res!858991 () Bool)

(assert (=> b!1293361 (=> (not res!858991) (not e!738355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293361 (= res!858991 (not (validKeyInArray!0 (select (arr!41381 _keys!1741) from!2144))))))

(declare-fun b!1293362 () Bool)

(declare-fun res!858994 () Bool)

(assert (=> b!1293362 (=> (not res!858994) (not e!738355))))

(assert (=> b!1293362 (= res!858994 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41932 _keys!1741))))))

(declare-fun b!1293363 () Bool)

(declare-fun res!858990 () Bool)

(assert (=> b!1293363 (=> (not res!858990) (not e!738355))))

(declare-datatypes ((List!29374 0))(
  ( (Nil!29371) (Cons!29370 (h!30588 (_ BitVec 64)) (t!42930 List!29374)) )
))
(declare-fun arrayNoDuplicates!0 (array!85769 (_ BitVec 32) List!29374) Bool)

(assert (=> b!1293363 (= res!858990 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29371))))

(declare-fun res!858992 () Bool)

(assert (=> start!109446 (=> (not res!858992) (not e!738355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109446 (= res!858992 (validMask!0 mask!2175))))

(assert (=> start!109446 e!738355))

(assert (=> start!109446 tp_is_empty!34351))

(assert (=> start!109446 true))

(declare-fun e!738353 () Bool)

(declare-fun array_inv!31583 (array!85771) Bool)

(assert (=> start!109446 (and (array_inv!31583 _values!1445) e!738353)))

(declare-fun array_inv!31584 (array!85769) Bool)

(assert (=> start!109446 (array_inv!31584 _keys!1741)))

(assert (=> start!109446 tp!101252))

(declare-fun mapIsEmpty!53087 () Bool)

(assert (=> mapIsEmpty!53087 mapRes!53087))

(declare-fun b!1293364 () Bool)

(assert (=> b!1293364 (= e!738353 (and e!738356 mapRes!53087))))

(declare-fun condMapEmpty!53087 () Bool)

(declare-fun mapDefault!53087 () ValueCell!16277)

(assert (=> b!1293364 (= condMapEmpty!53087 (= (arr!41382 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16277)) mapDefault!53087)))))

(declare-fun b!1293365 () Bool)

(declare-fun res!858997 () Bool)

(assert (=> b!1293365 (=> (not res!858997) (not e!738355))))

(assert (=> b!1293365 (= res!858997 (and (= (size!41933 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41932 _keys!1741) (size!41933 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293366 () Bool)

(assert (=> b!1293366 (= e!738355 (not true))))

(assert (=> b!1293366 (not (contains!8080 (ListLongMap!19868 Nil!29370) k0!1205))))

(declare-datatypes ((Unit!42741 0))(
  ( (Unit!42742) )
))
(declare-fun lt!579786 () Unit!42741)

(declare-fun emptyContainsNothing!116 ((_ BitVec 64)) Unit!42741)

(assert (=> b!1293366 (= lt!579786 (emptyContainsNothing!116 k0!1205))))

(declare-fun b!1293367 () Bool)

(declare-fun res!858993 () Bool)

(assert (=> b!1293367 (=> (not res!858993) (not e!738355))))

(assert (=> b!1293367 (= res!858993 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41932 _keys!1741))))))

(assert (= (and start!109446 res!858992) b!1293365))

(assert (= (and b!1293365 res!858997) b!1293358))

(assert (= (and b!1293358 res!858995) b!1293363))

(assert (= (and b!1293363 res!858990) b!1293367))

(assert (= (and b!1293367 res!858993) b!1293360))

(assert (= (and b!1293360 res!858996) b!1293362))

(assert (= (and b!1293362 res!858994) b!1293361))

(assert (= (and b!1293361 res!858991) b!1293366))

(assert (= (and b!1293364 condMapEmpty!53087) mapIsEmpty!53087))

(assert (= (and b!1293364 (not condMapEmpty!53087)) mapNonEmpty!53087))

(get-info :version)

(assert (= (and mapNonEmpty!53087 ((_ is ValueCellFull!16277) mapValue!53087)) b!1293357))

(assert (= (and b!1293364 ((_ is ValueCellFull!16277) mapDefault!53087)) b!1293359))

(assert (= start!109446 b!1293364))

(declare-fun m!1186329 () Bool)

(assert (=> start!109446 m!1186329))

(declare-fun m!1186331 () Bool)

(assert (=> start!109446 m!1186331))

(declare-fun m!1186333 () Bool)

(assert (=> start!109446 m!1186333))

(declare-fun m!1186335 () Bool)

(assert (=> b!1293361 m!1186335))

(assert (=> b!1293361 m!1186335))

(declare-fun m!1186337 () Bool)

(assert (=> b!1293361 m!1186337))

(declare-fun m!1186339 () Bool)

(assert (=> b!1293363 m!1186339))

(declare-fun m!1186341 () Bool)

(assert (=> b!1293358 m!1186341))

(declare-fun m!1186343 () Bool)

(assert (=> b!1293366 m!1186343))

(declare-fun m!1186345 () Bool)

(assert (=> b!1293366 m!1186345))

(declare-fun m!1186347 () Bool)

(assert (=> b!1293360 m!1186347))

(assert (=> b!1293360 m!1186347))

(declare-fun m!1186349 () Bool)

(assert (=> b!1293360 m!1186349))

(declare-fun m!1186351 () Bool)

(assert (=> mapNonEmpty!53087 m!1186351))

(check-sat (not b!1293361) tp_is_empty!34351 (not start!109446) (not b!1293366) (not mapNonEmpty!53087) (not b_next!28711) b_and!46803 (not b!1293360) (not b!1293358) (not b!1293363))
(check-sat b_and!46803 (not b_next!28711))
