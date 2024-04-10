; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4640 () Bool)

(assert start!4640)

(declare-fun b_free!1287 () Bool)

(declare-fun b_next!1287 () Bool)

(assert (=> start!4640 (= b_free!1287 (not b_next!1287))))

(declare-fun tp!5311 () Bool)

(declare-fun b_and!2121 () Bool)

(assert (=> start!4640 (= tp!5311 b_and!2121)))

(declare-fun b!36258 () Bool)

(declare-fun res!21944 () Bool)

(declare-fun e!22900 () Bool)

(assert (=> b!36258 (=> (not res!21944) (not e!22900))))

(declare-datatypes ((array!2499 0))(
  ( (array!2500 (arr!1193 (Array (_ BitVec 32) (_ BitVec 64))) (size!1294 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2499)

(declare-datatypes ((List!951 0))(
  ( (Nil!948) (Cons!947 (h!1515 (_ BitVec 64)) (t!3664 List!951)) )
))
(declare-fun arrayNoDuplicates!0 (array!2499 (_ BitVec 32) List!951) Bool)

(assert (=> b!36258 (= res!21944 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!948))))

(declare-fun b!36259 () Bool)

(assert (=> b!36259 (= e!22900 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!2013 0))(
  ( (V!2014 (val!847 Int)) )
))
(declare-datatypes ((ValueCell!621 0))(
  ( (ValueCellFull!621 (v!1947 V!2013)) (EmptyCell!621) )
))
(declare-datatypes ((array!2501 0))(
  ( (array!2502 (arr!1194 (Array (_ BitVec 32) ValueCell!621)) (size!1295 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2501)

(declare-fun lt!13443 () Bool)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!2013)

(declare-fun minValue!1443 () V!2013)

(declare-datatypes ((tuple2!1356 0))(
  ( (tuple2!1357 (_1!689 (_ BitVec 64)) (_2!689 V!2013)) )
))
(declare-datatypes ((List!952 0))(
  ( (Nil!949) (Cons!948 (h!1516 tuple2!1356) (t!3665 List!952)) )
))
(declare-datatypes ((ListLongMap!933 0))(
  ( (ListLongMap!934 (toList!482 List!952)) )
))
(declare-fun contains!433 (ListLongMap!933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!306 (array!2499 array!2501 (_ BitVec 32) (_ BitVec 32) V!2013 V!2013 (_ BitVec 32) Int) ListLongMap!933)

(assert (=> b!36259 (= lt!13443 (contains!433 (getCurrentListMap!306 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun res!21943 () Bool)

(assert (=> start!4640 (=> (not res!21943) (not e!22900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4640 (= res!21943 (validMask!0 mask!2294))))

(assert (=> start!4640 e!22900))

(assert (=> start!4640 true))

(assert (=> start!4640 tp!5311))

(declare-fun e!22898 () Bool)

(declare-fun array_inv!835 (array!2501) Bool)

(assert (=> start!4640 (and (array_inv!835 _values!1501) e!22898)))

(declare-fun array_inv!836 (array!2499) Bool)

(assert (=> start!4640 (array_inv!836 _keys!1833)))

(declare-fun tp_is_empty!1641 () Bool)

(assert (=> start!4640 tp_is_empty!1641))

(declare-fun b!36260 () Bool)

(declare-fun e!22897 () Bool)

(assert (=> b!36260 (= e!22897 tp_is_empty!1641)))

(declare-fun b!36261 () Bool)

(declare-fun res!21942 () Bool)

(assert (=> b!36261 (=> (not res!21942) (not e!22900))))

(assert (=> b!36261 (= res!21942 (and (= (size!1295 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1294 _keys!1833) (size!1295 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2021 () Bool)

(declare-fun mapRes!2021 () Bool)

(assert (=> mapIsEmpty!2021 mapRes!2021))

(declare-fun b!36262 () Bool)

(declare-fun e!22899 () Bool)

(assert (=> b!36262 (= e!22898 (and e!22899 mapRes!2021))))

(declare-fun condMapEmpty!2021 () Bool)

(declare-fun mapDefault!2021 () ValueCell!621)

(assert (=> b!36262 (= condMapEmpty!2021 (= (arr!1194 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!621)) mapDefault!2021)))))

(declare-fun b!36263 () Bool)

(declare-fun res!21941 () Bool)

(assert (=> b!36263 (=> (not res!21941) (not e!22900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!36263 (= res!21941 (validKeyInArray!0 k0!1304))))

(declare-fun b!36264 () Bool)

(declare-fun res!21945 () Bool)

(assert (=> b!36264 (=> (not res!21945) (not e!22900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2499 (_ BitVec 32)) Bool)

(assert (=> b!36264 (= res!21945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!2021 () Bool)

(declare-fun tp!5312 () Bool)

(assert (=> mapNonEmpty!2021 (= mapRes!2021 (and tp!5312 e!22897))))

(declare-fun mapValue!2021 () ValueCell!621)

(declare-fun mapKey!2021 () (_ BitVec 32))

(declare-fun mapRest!2021 () (Array (_ BitVec 32) ValueCell!621))

(assert (=> mapNonEmpty!2021 (= (arr!1194 _values!1501) (store mapRest!2021 mapKey!2021 mapValue!2021))))

(declare-fun b!36265 () Bool)

(assert (=> b!36265 (= e!22899 tp_is_empty!1641)))

(assert (= (and start!4640 res!21943) b!36261))

(assert (= (and b!36261 res!21942) b!36264))

(assert (= (and b!36264 res!21945) b!36258))

(assert (= (and b!36258 res!21944) b!36263))

(assert (= (and b!36263 res!21941) b!36259))

(assert (= (and b!36262 condMapEmpty!2021) mapIsEmpty!2021))

(assert (= (and b!36262 (not condMapEmpty!2021)) mapNonEmpty!2021))

(get-info :version)

(assert (= (and mapNonEmpty!2021 ((_ is ValueCellFull!621) mapValue!2021)) b!36260))

(assert (= (and b!36262 ((_ is ValueCellFull!621) mapDefault!2021)) b!36265))

(assert (= start!4640 b!36262))

(declare-fun m!29229 () Bool)

(assert (=> mapNonEmpty!2021 m!29229))

(declare-fun m!29231 () Bool)

(assert (=> b!36264 m!29231))

(declare-fun m!29233 () Bool)

(assert (=> b!36258 m!29233))

(declare-fun m!29235 () Bool)

(assert (=> start!4640 m!29235))

(declare-fun m!29237 () Bool)

(assert (=> start!4640 m!29237))

(declare-fun m!29239 () Bool)

(assert (=> start!4640 m!29239))

(declare-fun m!29241 () Bool)

(assert (=> b!36263 m!29241))

(declare-fun m!29243 () Bool)

(assert (=> b!36259 m!29243))

(assert (=> b!36259 m!29243))

(declare-fun m!29245 () Bool)

(assert (=> b!36259 m!29245))

(check-sat (not start!4640) (not b!36264) b_and!2121 tp_is_empty!1641 (not b!36263) (not mapNonEmpty!2021) (not b!36258) (not b!36259) (not b_next!1287))
(check-sat b_and!2121 (not b_next!1287))
