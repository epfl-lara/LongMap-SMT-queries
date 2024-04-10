; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108768 () Bool)

(assert start!108768)

(declare-fun b_free!28281 () Bool)

(declare-fun b_next!28281 () Bool)

(assert (=> start!108768 (= b_free!28281 (not b_next!28281))))

(declare-fun tp!99958 () Bool)

(declare-fun b_and!46347 () Bool)

(assert (=> start!108768 (= tp!99958 b_and!46347)))

(declare-fun b!1284404 () Bool)

(declare-fun res!853247 () Bool)

(declare-fun e!733666 () Bool)

(assert (=> b!1284404 (=> (not res!853247) (not e!733666))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50331 0))(
  ( (V!50332 (val!17035 Int)) )
))
(declare-datatypes ((ValueCell!16062 0))(
  ( (ValueCellFull!16062 (v!19637 V!50331)) (EmptyCell!16062) )
))
(declare-datatypes ((array!84900 0))(
  ( (array!84901 (arr!40952 (Array (_ BitVec 32) ValueCell!16062)) (size!41502 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84900)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84902 0))(
  ( (array!84903 (arr!40953 (Array (_ BitVec 32) (_ BitVec 64))) (size!41503 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84902)

(assert (=> b!1284404 (= res!853247 (and (= (size!41502 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41503 _keys!1741) (size!41502 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284405 () Bool)

(declare-fun res!853249 () Bool)

(assert (=> b!1284405 (=> (not res!853249) (not e!733666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84902 (_ BitVec 32)) Bool)

(assert (=> b!1284405 (= res!853249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284406 () Bool)

(declare-fun res!853248 () Bool)

(assert (=> b!1284406 (=> (not res!853248) (not e!733666))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284406 (= res!853248 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41503 _keys!1741))))))

(declare-fun b!1284407 () Bool)

(assert (=> b!1284407 (= e!733666 false)))

(declare-fun minValue!1387 () V!50331)

(declare-fun zeroValue!1387 () V!50331)

(declare-fun lt!576808 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21828 0))(
  ( (tuple2!21829 (_1!10925 (_ BitVec 64)) (_2!10925 V!50331)) )
))
(declare-datatypes ((List!29020 0))(
  ( (Nil!29017) (Cons!29016 (h!30225 tuple2!21828) (t!42564 List!29020)) )
))
(declare-datatypes ((ListLongMap!19485 0))(
  ( (ListLongMap!19486 (toList!9758 List!29020)) )
))
(declare-fun contains!7875 (ListLongMap!19485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4837 (array!84902 array!84900 (_ BitVec 32) (_ BitVec 32) V!50331 V!50331 (_ BitVec 32) Int) ListLongMap!19485)

(assert (=> b!1284407 (= lt!576808 (contains!7875 (getCurrentListMap!4837 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284408 () Bool)

(declare-fun e!733670 () Bool)

(declare-fun e!733668 () Bool)

(declare-fun mapRes!52439 () Bool)

(assert (=> b!1284408 (= e!733670 (and e!733668 mapRes!52439))))

(declare-fun condMapEmpty!52439 () Bool)

(declare-fun mapDefault!52439 () ValueCell!16062)

(assert (=> b!1284408 (= condMapEmpty!52439 (= (arr!40952 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16062)) mapDefault!52439)))))

(declare-fun b!1284409 () Bool)

(declare-fun tp_is_empty!33921 () Bool)

(assert (=> b!1284409 (= e!733668 tp_is_empty!33921)))

(declare-fun b!1284410 () Bool)

(declare-fun e!733667 () Bool)

(assert (=> b!1284410 (= e!733667 tp_is_empty!33921)))

(declare-fun mapIsEmpty!52439 () Bool)

(assert (=> mapIsEmpty!52439 mapRes!52439))

(declare-fun res!853250 () Bool)

(assert (=> start!108768 (=> (not res!853250) (not e!733666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108768 (= res!853250 (validMask!0 mask!2175))))

(assert (=> start!108768 e!733666))

(assert (=> start!108768 tp_is_empty!33921))

(assert (=> start!108768 true))

(declare-fun array_inv!31059 (array!84900) Bool)

(assert (=> start!108768 (and (array_inv!31059 _values!1445) e!733670)))

(declare-fun array_inv!31060 (array!84902) Bool)

(assert (=> start!108768 (array_inv!31060 _keys!1741)))

(assert (=> start!108768 tp!99958))

(declare-fun b!1284411 () Bool)

(declare-fun res!853251 () Bool)

(assert (=> b!1284411 (=> (not res!853251) (not e!733666))))

(declare-datatypes ((List!29021 0))(
  ( (Nil!29018) (Cons!29017 (h!30226 (_ BitVec 64)) (t!42565 List!29021)) )
))
(declare-fun arrayNoDuplicates!0 (array!84902 (_ BitVec 32) List!29021) Bool)

(assert (=> b!1284411 (= res!853251 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29018))))

(declare-fun mapNonEmpty!52439 () Bool)

(declare-fun tp!99959 () Bool)

(assert (=> mapNonEmpty!52439 (= mapRes!52439 (and tp!99959 e!733667))))

(declare-fun mapValue!52439 () ValueCell!16062)

(declare-fun mapRest!52439 () (Array (_ BitVec 32) ValueCell!16062))

(declare-fun mapKey!52439 () (_ BitVec 32))

(assert (=> mapNonEmpty!52439 (= (arr!40952 _values!1445) (store mapRest!52439 mapKey!52439 mapValue!52439))))

(assert (= (and start!108768 res!853250) b!1284404))

(assert (= (and b!1284404 res!853247) b!1284405))

(assert (= (and b!1284405 res!853249) b!1284411))

(assert (= (and b!1284411 res!853251) b!1284406))

(assert (= (and b!1284406 res!853248) b!1284407))

(assert (= (and b!1284408 condMapEmpty!52439) mapIsEmpty!52439))

(assert (= (and b!1284408 (not condMapEmpty!52439)) mapNonEmpty!52439))

(get-info :version)

(assert (= (and mapNonEmpty!52439 ((_ is ValueCellFull!16062) mapValue!52439)) b!1284410))

(assert (= (and b!1284408 ((_ is ValueCellFull!16062) mapDefault!52439)) b!1284409))

(assert (= start!108768 b!1284408))

(declare-fun m!1178101 () Bool)

(assert (=> b!1284407 m!1178101))

(assert (=> b!1284407 m!1178101))

(declare-fun m!1178103 () Bool)

(assert (=> b!1284407 m!1178103))

(declare-fun m!1178105 () Bool)

(assert (=> b!1284411 m!1178105))

(declare-fun m!1178107 () Bool)

(assert (=> mapNonEmpty!52439 m!1178107))

(declare-fun m!1178109 () Bool)

(assert (=> b!1284405 m!1178109))

(declare-fun m!1178111 () Bool)

(assert (=> start!108768 m!1178111))

(declare-fun m!1178113 () Bool)

(assert (=> start!108768 m!1178113))

(declare-fun m!1178115 () Bool)

(assert (=> start!108768 m!1178115))

(check-sat (not b!1284407) (not b!1284411) (not b!1284405) tp_is_empty!33921 b_and!46347 (not b_next!28281) (not mapNonEmpty!52439) (not start!108768))
(check-sat b_and!46347 (not b_next!28281))
