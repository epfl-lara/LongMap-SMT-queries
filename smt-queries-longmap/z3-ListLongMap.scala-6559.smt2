; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83240 () Bool)

(assert start!83240)

(declare-fun b_free!19233 () Bool)

(declare-fun b_next!19233 () Bool)

(assert (=> start!83240 (= b_free!19233 (not b_next!19233))))

(declare-fun tp!66978 () Bool)

(declare-fun b_and!30721 () Bool)

(assert (=> start!83240 (= tp!66978 b_and!30721)))

(declare-fun b!971299 () Bool)

(declare-fun res!650120 () Bool)

(declare-fun e!547549 () Bool)

(assert (=> b!971299 (=> (not res!650120) (not e!547549))))

(declare-datatypes ((array!60311 0))(
  ( (array!60312 (arr!29019 (Array (_ BitVec 32) (_ BitVec 64))) (size!29498 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60311)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60311 (_ BitVec 32)) Bool)

(assert (=> b!971299 (= res!650120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35206 () Bool)

(declare-fun mapRes!35206 () Bool)

(declare-fun tp!66977 () Bool)

(declare-fun e!547547 () Bool)

(assert (=> mapNonEmpty!35206 (= mapRes!35206 (and tp!66977 e!547547))))

(declare-datatypes ((V!34491 0))(
  ( (V!34492 (val!11116 Int)) )
))
(declare-datatypes ((ValueCell!10584 0))(
  ( (ValueCellFull!10584 (v!13675 V!34491)) (EmptyCell!10584) )
))
(declare-datatypes ((array!60313 0))(
  ( (array!60314 (arr!29020 (Array (_ BitVec 32) ValueCell!10584)) (size!29499 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60313)

(declare-fun mapRest!35206 () (Array (_ BitVec 32) ValueCell!10584))

(declare-fun mapKey!35206 () (_ BitVec 32))

(declare-fun mapValue!35206 () ValueCell!10584)

(assert (=> mapNonEmpty!35206 (= (arr!29020 _values!1425) (store mapRest!35206 mapKey!35206 mapValue!35206))))

(declare-fun res!650119 () Bool)

(assert (=> start!83240 (=> (not res!650119) (not e!547549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83240 (= res!650119 (validMask!0 mask!2147))))

(assert (=> start!83240 e!547549))

(assert (=> start!83240 true))

(declare-fun e!547545 () Bool)

(declare-fun array_inv!22457 (array!60313) Bool)

(assert (=> start!83240 (and (array_inv!22457 _values!1425) e!547545)))

(declare-fun tp_is_empty!22131 () Bool)

(assert (=> start!83240 tp_is_empty!22131))

(assert (=> start!83240 tp!66978))

(declare-fun array_inv!22458 (array!60311) Bool)

(assert (=> start!83240 (array_inv!22458 _keys!1717)))

(declare-fun b!971300 () Bool)

(declare-fun e!547546 () Bool)

(assert (=> b!971300 (= e!547545 (and e!547546 mapRes!35206))))

(declare-fun condMapEmpty!35206 () Bool)

(declare-fun mapDefault!35206 () ValueCell!10584)

(assert (=> b!971300 (= condMapEmpty!35206 (= (arr!29020 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10584)) mapDefault!35206)))))

(declare-fun mapIsEmpty!35206 () Bool)

(assert (=> mapIsEmpty!35206 mapRes!35206))

(declare-fun b!971301 () Bool)

(declare-fun res!650124 () Bool)

(assert (=> b!971301 (=> (not res!650124) (not e!547549))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971301 (= res!650124 (and (= (size!29499 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29498 _keys!1717) (size!29499 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971302 () Bool)

(assert (=> b!971302 (= e!547549 false)))

(declare-datatypes ((tuple2!14246 0))(
  ( (tuple2!14247 (_1!7134 (_ BitVec 64)) (_2!7134 V!34491)) )
))
(declare-datatypes ((List!20114 0))(
  ( (Nil!20111) (Cons!20110 (h!21272 tuple2!14246) (t!28477 List!20114)) )
))
(declare-datatypes ((ListLongMap!12943 0))(
  ( (ListLongMap!12944 (toList!6487 List!20114)) )
))
(declare-fun lt!431819 () ListLongMap!12943)

(declare-fun zeroValue!1367 () V!34491)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34491)

(declare-fun getCurrentListMap!3720 (array!60311 array!60313 (_ BitVec 32) (_ BitVec 32) V!34491 V!34491 (_ BitVec 32) Int) ListLongMap!12943)

(assert (=> b!971302 (= lt!431819 (getCurrentListMap!3720 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971303 () Bool)

(declare-fun res!650121 () Bool)

(assert (=> b!971303 (=> (not res!650121) (not e!547549))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971303 (= res!650121 (validKeyInArray!0 (select (arr!29019 _keys!1717) i!822)))))

(declare-fun b!971304 () Bool)

(declare-fun res!650118 () Bool)

(assert (=> b!971304 (=> (not res!650118) (not e!547549))))

(declare-fun contains!5588 (ListLongMap!12943 (_ BitVec 64)) Bool)

(assert (=> b!971304 (= res!650118 (contains!5588 (getCurrentListMap!3720 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29019 _keys!1717) i!822)))))

(declare-fun b!971305 () Bool)

(assert (=> b!971305 (= e!547546 tp_is_empty!22131)))

(declare-fun b!971306 () Bool)

(assert (=> b!971306 (= e!547547 tp_is_empty!22131)))

(declare-fun b!971307 () Bool)

(declare-fun res!650122 () Bool)

(assert (=> b!971307 (=> (not res!650122) (not e!547549))))

(assert (=> b!971307 (= res!650122 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29498 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29498 _keys!1717))))))

(declare-fun b!971308 () Bool)

(declare-fun res!650123 () Bool)

(assert (=> b!971308 (=> (not res!650123) (not e!547549))))

(declare-datatypes ((List!20115 0))(
  ( (Nil!20112) (Cons!20111 (h!21273 (_ BitVec 64)) (t!28478 List!20115)) )
))
(declare-fun arrayNoDuplicates!0 (array!60311 (_ BitVec 32) List!20115) Bool)

(assert (=> b!971308 (= res!650123 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20112))))

(assert (= (and start!83240 res!650119) b!971301))

(assert (= (and b!971301 res!650124) b!971299))

(assert (= (and b!971299 res!650120) b!971308))

(assert (= (and b!971308 res!650123) b!971307))

(assert (= (and b!971307 res!650122) b!971303))

(assert (= (and b!971303 res!650121) b!971304))

(assert (= (and b!971304 res!650118) b!971302))

(assert (= (and b!971300 condMapEmpty!35206) mapIsEmpty!35206))

(assert (= (and b!971300 (not condMapEmpty!35206)) mapNonEmpty!35206))

(get-info :version)

(assert (= (and mapNonEmpty!35206 ((_ is ValueCellFull!10584) mapValue!35206)) b!971306))

(assert (= (and b!971300 ((_ is ValueCellFull!10584) mapDefault!35206)) b!971305))

(assert (= start!83240 b!971300))

(declare-fun m!898793 () Bool)

(assert (=> b!971304 m!898793))

(declare-fun m!898795 () Bool)

(assert (=> b!971304 m!898795))

(assert (=> b!971304 m!898793))

(assert (=> b!971304 m!898795))

(declare-fun m!898797 () Bool)

(assert (=> b!971304 m!898797))

(declare-fun m!898799 () Bool)

(assert (=> b!971299 m!898799))

(declare-fun m!898801 () Bool)

(assert (=> mapNonEmpty!35206 m!898801))

(declare-fun m!898803 () Bool)

(assert (=> b!971308 m!898803))

(declare-fun m!898805 () Bool)

(assert (=> start!83240 m!898805))

(declare-fun m!898807 () Bool)

(assert (=> start!83240 m!898807))

(declare-fun m!898809 () Bool)

(assert (=> start!83240 m!898809))

(declare-fun m!898811 () Bool)

(assert (=> b!971302 m!898811))

(assert (=> b!971303 m!898795))

(assert (=> b!971303 m!898795))

(declare-fun m!898813 () Bool)

(assert (=> b!971303 m!898813))

(check-sat (not b!971308) (not start!83240) (not b_next!19233) b_and!30721 (not b!971299) (not b!971304) (not b!971303) tp_is_empty!22131 (not mapNonEmpty!35206) (not b!971302))
(check-sat b_and!30721 (not b_next!19233))
