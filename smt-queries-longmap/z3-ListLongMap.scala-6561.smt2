; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83418 () Bool)

(assert start!83418)

(declare-fun b_free!19243 () Bool)

(declare-fun b_next!19243 () Bool)

(assert (=> start!83418 (= b_free!19243 (not b_next!19243))))

(declare-fun tp!67008 () Bool)

(declare-fun b_and!30741 () Bool)

(assert (=> start!83418 (= tp!67008 b_and!30741)))

(declare-fun mapIsEmpty!35221 () Bool)

(declare-fun mapRes!35221 () Bool)

(assert (=> mapIsEmpty!35221 mapRes!35221))

(declare-fun b!972352 () Bool)

(declare-fun e!548205 () Bool)

(assert (=> b!972352 (= e!548205 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34505 0))(
  ( (V!34506 (val!11121 Int)) )
))
(declare-datatypes ((tuple2!14260 0))(
  ( (tuple2!14261 (_1!7141 (_ BitVec 64)) (_2!7141 V!34505)) )
))
(declare-datatypes ((List!20114 0))(
  ( (Nil!20111) (Cons!20110 (h!21278 tuple2!14260) (t!28469 List!20114)) )
))
(declare-datatypes ((ListLongMap!12959 0))(
  ( (ListLongMap!12960 (toList!6495 List!20114)) )
))
(declare-fun lt!432195 () ListLongMap!12959)

(declare-datatypes ((ValueCell!10589 0))(
  ( (ValueCellFull!10589 (v!13677 V!34505)) (EmptyCell!10589) )
))
(declare-datatypes ((array!60356 0))(
  ( (array!60357 (arr!29037 (Array (_ BitVec 32) ValueCell!10589)) (size!29517 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60356)

(declare-fun zeroValue!1367 () V!34505)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34505)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60358 0))(
  ( (array!60359 (arr!29038 (Array (_ BitVec 32) (_ BitVec 64))) (size!29518 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60358)

(declare-fun getCurrentListMap!3728 (array!60358 array!60356 (_ BitVec 32) (_ BitVec 32) V!34505 V!34505 (_ BitVec 32) Int) ListLongMap!12959)

(assert (=> b!972352 (= lt!432195 (getCurrentListMap!3728 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972353 () Bool)

(declare-fun e!548206 () Bool)

(declare-fun tp_is_empty!22141 () Bool)

(assert (=> b!972353 (= e!548206 tp_is_empty!22141)))

(declare-fun b!972354 () Bool)

(declare-fun res!650572 () Bool)

(assert (=> b!972354 (=> (not res!650572) (not e!548205))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5609 (ListLongMap!12959 (_ BitVec 64)) Bool)

(assert (=> b!972354 (= res!650572 (contains!5609 (getCurrentListMap!3728 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29038 _keys!1717) i!822)))))

(declare-fun b!972355 () Bool)

(declare-fun res!650569 () Bool)

(assert (=> b!972355 (=> (not res!650569) (not e!548205))))

(assert (=> b!972355 (= res!650569 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29518 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29518 _keys!1717))))))

(declare-fun b!972356 () Bool)

(declare-fun e!548203 () Bool)

(declare-fun e!548204 () Bool)

(assert (=> b!972356 (= e!548203 (and e!548204 mapRes!35221))))

(declare-fun condMapEmpty!35221 () Bool)

(declare-fun mapDefault!35221 () ValueCell!10589)

(assert (=> b!972356 (= condMapEmpty!35221 (= (arr!29037 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10589)) mapDefault!35221)))))

(declare-fun b!972358 () Bool)

(assert (=> b!972358 (= e!548204 tp_is_empty!22141)))

(declare-fun b!972359 () Bool)

(declare-fun res!650567 () Bool)

(assert (=> b!972359 (=> (not res!650567) (not e!548205))))

(declare-datatypes ((List!20115 0))(
  ( (Nil!20112) (Cons!20111 (h!21279 (_ BitVec 64)) (t!28470 List!20115)) )
))
(declare-fun arrayNoDuplicates!0 (array!60358 (_ BitVec 32) List!20115) Bool)

(assert (=> b!972359 (= res!650567 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20112))))

(declare-fun b!972360 () Bool)

(declare-fun res!650568 () Bool)

(assert (=> b!972360 (=> (not res!650568) (not e!548205))))

(assert (=> b!972360 (= res!650568 (and (= (size!29517 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29518 _keys!1717) (size!29517 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35221 () Bool)

(declare-fun tp!67009 () Bool)

(assert (=> mapNonEmpty!35221 (= mapRes!35221 (and tp!67009 e!548206))))

(declare-fun mapRest!35221 () (Array (_ BitVec 32) ValueCell!10589))

(declare-fun mapValue!35221 () ValueCell!10589)

(declare-fun mapKey!35221 () (_ BitVec 32))

(assert (=> mapNonEmpty!35221 (= (arr!29037 _values!1425) (store mapRest!35221 mapKey!35221 mapValue!35221))))

(declare-fun b!972361 () Bool)

(declare-fun res!650571 () Bool)

(assert (=> b!972361 (=> (not res!650571) (not e!548205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972361 (= res!650571 (validKeyInArray!0 (select (arr!29038 _keys!1717) i!822)))))

(declare-fun b!972357 () Bool)

(declare-fun res!650573 () Bool)

(assert (=> b!972357 (=> (not res!650573) (not e!548205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60358 (_ BitVec 32)) Bool)

(assert (=> b!972357 (= res!650573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650570 () Bool)

(assert (=> start!83418 (=> (not res!650570) (not e!548205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83418 (= res!650570 (validMask!0 mask!2147))))

(assert (=> start!83418 e!548205))

(assert (=> start!83418 true))

(declare-fun array_inv!22519 (array!60356) Bool)

(assert (=> start!83418 (and (array_inv!22519 _values!1425) e!548203)))

(assert (=> start!83418 tp_is_empty!22141))

(assert (=> start!83418 tp!67008))

(declare-fun array_inv!22520 (array!60358) Bool)

(assert (=> start!83418 (array_inv!22520 _keys!1717)))

(assert (= (and start!83418 res!650570) b!972360))

(assert (= (and b!972360 res!650568) b!972357))

(assert (= (and b!972357 res!650573) b!972359))

(assert (= (and b!972359 res!650567) b!972355))

(assert (= (and b!972355 res!650569) b!972361))

(assert (= (and b!972361 res!650571) b!972354))

(assert (= (and b!972354 res!650572) b!972352))

(assert (= (and b!972356 condMapEmpty!35221) mapIsEmpty!35221))

(assert (= (and b!972356 (not condMapEmpty!35221)) mapNonEmpty!35221))

(get-info :version)

(assert (= (and mapNonEmpty!35221 ((_ is ValueCellFull!10589) mapValue!35221)) b!972353))

(assert (= (and b!972356 ((_ is ValueCellFull!10589) mapDefault!35221)) b!972358))

(assert (= start!83418 b!972356))

(declare-fun m!900197 () Bool)

(assert (=> b!972361 m!900197))

(assert (=> b!972361 m!900197))

(declare-fun m!900199 () Bool)

(assert (=> b!972361 m!900199))

(declare-fun m!900201 () Bool)

(assert (=> b!972352 m!900201))

(declare-fun m!900203 () Bool)

(assert (=> mapNonEmpty!35221 m!900203))

(declare-fun m!900205 () Bool)

(assert (=> b!972357 m!900205))

(declare-fun m!900207 () Bool)

(assert (=> start!83418 m!900207))

(declare-fun m!900209 () Bool)

(assert (=> start!83418 m!900209))

(declare-fun m!900211 () Bool)

(assert (=> start!83418 m!900211))

(declare-fun m!900213 () Bool)

(assert (=> b!972359 m!900213))

(declare-fun m!900215 () Bool)

(assert (=> b!972354 m!900215))

(assert (=> b!972354 m!900197))

(assert (=> b!972354 m!900215))

(assert (=> b!972354 m!900197))

(declare-fun m!900217 () Bool)

(assert (=> b!972354 m!900217))

(check-sat (not b!972352) (not b_next!19243) (not b!972357) (not b!972354) (not mapNonEmpty!35221) (not b!972361) (not start!83418) b_and!30741 tp_is_empty!22141 (not b!972359))
(check-sat b_and!30741 (not b_next!19243))
