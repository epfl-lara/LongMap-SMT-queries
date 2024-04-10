; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83270 () Bool)

(assert start!83270)

(declare-fun b_free!19263 () Bool)

(declare-fun b_next!19263 () Bool)

(assert (=> start!83270 (= b_free!19263 (not b_next!19263))))

(declare-fun tp!67068 () Bool)

(declare-fun b_and!30751 () Bool)

(assert (=> start!83270 (= tp!67068 b_and!30751)))

(declare-fun b!971749 () Bool)

(declare-fun res!650433 () Bool)

(declare-fun e!547774 () Bool)

(assert (=> b!971749 (=> (not res!650433) (not e!547774))))

(declare-datatypes ((array!60369 0))(
  ( (array!60370 (arr!29048 (Array (_ BitVec 32) (_ BitVec 64))) (size!29527 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60369)

(declare-datatypes ((List!20134 0))(
  ( (Nil!20131) (Cons!20130 (h!21292 (_ BitVec 64)) (t!28497 List!20134)) )
))
(declare-fun arrayNoDuplicates!0 (array!60369 (_ BitVec 32) List!20134) Bool)

(assert (=> b!971749 (= res!650433 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20131))))

(declare-fun b!971750 () Bool)

(declare-fun res!650439 () Bool)

(assert (=> b!971750 (=> (not res!650439) (not e!547774))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34531 0))(
  ( (V!34532 (val!11131 Int)) )
))
(declare-datatypes ((ValueCell!10599 0))(
  ( (ValueCellFull!10599 (v!13690 V!34531)) (EmptyCell!10599) )
))
(declare-datatypes ((array!60371 0))(
  ( (array!60372 (arr!29049 (Array (_ BitVec 32) ValueCell!10599)) (size!29528 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60371)

(declare-fun zeroValue!1367 () V!34531)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34531)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14268 0))(
  ( (tuple2!14269 (_1!7145 (_ BitVec 64)) (_2!7145 V!34531)) )
))
(declare-datatypes ((List!20135 0))(
  ( (Nil!20132) (Cons!20131 (h!21293 tuple2!14268) (t!28498 List!20135)) )
))
(declare-datatypes ((ListLongMap!12965 0))(
  ( (ListLongMap!12966 (toList!6498 List!20135)) )
))
(declare-fun contains!5598 (ListLongMap!12965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3731 (array!60369 array!60371 (_ BitVec 32) (_ BitVec 32) V!34531 V!34531 (_ BitVec 32) Int) ListLongMap!12965)

(assert (=> b!971750 (= res!650439 (contains!5598 (getCurrentListMap!3731 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29048 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35251 () Bool)

(declare-fun mapRes!35251 () Bool)

(assert (=> mapIsEmpty!35251 mapRes!35251))

(declare-fun b!971752 () Bool)

(declare-fun res!650438 () Bool)

(assert (=> b!971752 (=> (not res!650438) (not e!547774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60369 (_ BitVec 32)) Bool)

(assert (=> b!971752 (= res!650438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971753 () Bool)

(declare-fun e!547772 () Bool)

(declare-fun tp_is_empty!22161 () Bool)

(assert (=> b!971753 (= e!547772 tp_is_empty!22161)))

(declare-fun b!971754 () Bool)

(assert (=> b!971754 (= e!547774 false)))

(declare-fun lt!431864 () ListLongMap!12965)

(assert (=> b!971754 (= lt!431864 (getCurrentListMap!3731 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971755 () Bool)

(declare-fun res!650434 () Bool)

(assert (=> b!971755 (=> (not res!650434) (not e!547774))))

(assert (=> b!971755 (= res!650434 (and (= (size!29528 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29527 _keys!1717) (size!29528 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!650435 () Bool)

(assert (=> start!83270 (=> (not res!650435) (not e!547774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83270 (= res!650435 (validMask!0 mask!2147))))

(assert (=> start!83270 e!547774))

(assert (=> start!83270 true))

(declare-fun e!547773 () Bool)

(declare-fun array_inv!22475 (array!60371) Bool)

(assert (=> start!83270 (and (array_inv!22475 _values!1425) e!547773)))

(assert (=> start!83270 tp_is_empty!22161))

(assert (=> start!83270 tp!67068))

(declare-fun array_inv!22476 (array!60369) Bool)

(assert (=> start!83270 (array_inv!22476 _keys!1717)))

(declare-fun b!971751 () Bool)

(declare-fun e!547771 () Bool)

(assert (=> b!971751 (= e!547773 (and e!547771 mapRes!35251))))

(declare-fun condMapEmpty!35251 () Bool)

(declare-fun mapDefault!35251 () ValueCell!10599)

(assert (=> b!971751 (= condMapEmpty!35251 (= (arr!29049 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10599)) mapDefault!35251)))))

(declare-fun b!971756 () Bool)

(declare-fun res!650437 () Bool)

(assert (=> b!971756 (=> (not res!650437) (not e!547774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971756 (= res!650437 (validKeyInArray!0 (select (arr!29048 _keys!1717) i!822)))))

(declare-fun b!971757 () Bool)

(assert (=> b!971757 (= e!547771 tp_is_empty!22161)))

(declare-fun mapNonEmpty!35251 () Bool)

(declare-fun tp!67067 () Bool)

(assert (=> mapNonEmpty!35251 (= mapRes!35251 (and tp!67067 e!547772))))

(declare-fun mapValue!35251 () ValueCell!10599)

(declare-fun mapKey!35251 () (_ BitVec 32))

(declare-fun mapRest!35251 () (Array (_ BitVec 32) ValueCell!10599))

(assert (=> mapNonEmpty!35251 (= (arr!29049 _values!1425) (store mapRest!35251 mapKey!35251 mapValue!35251))))

(declare-fun b!971758 () Bool)

(declare-fun res!650436 () Bool)

(assert (=> b!971758 (=> (not res!650436) (not e!547774))))

(assert (=> b!971758 (= res!650436 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29527 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29527 _keys!1717))))))

(assert (= (and start!83270 res!650435) b!971755))

(assert (= (and b!971755 res!650434) b!971752))

(assert (= (and b!971752 res!650438) b!971749))

(assert (= (and b!971749 res!650433) b!971758))

(assert (= (and b!971758 res!650436) b!971756))

(assert (= (and b!971756 res!650437) b!971750))

(assert (= (and b!971750 res!650439) b!971754))

(assert (= (and b!971751 condMapEmpty!35251) mapIsEmpty!35251))

(assert (= (and b!971751 (not condMapEmpty!35251)) mapNonEmpty!35251))

(get-info :version)

(assert (= (and mapNonEmpty!35251 ((_ is ValueCellFull!10599) mapValue!35251)) b!971753))

(assert (= (and b!971751 ((_ is ValueCellFull!10599) mapDefault!35251)) b!971757))

(assert (= start!83270 b!971751))

(declare-fun m!899123 () Bool)

(assert (=> b!971752 m!899123))

(declare-fun m!899125 () Bool)

(assert (=> start!83270 m!899125))

(declare-fun m!899127 () Bool)

(assert (=> start!83270 m!899127))

(declare-fun m!899129 () Bool)

(assert (=> start!83270 m!899129))

(declare-fun m!899131 () Bool)

(assert (=> b!971750 m!899131))

(declare-fun m!899133 () Bool)

(assert (=> b!971750 m!899133))

(assert (=> b!971750 m!899131))

(assert (=> b!971750 m!899133))

(declare-fun m!899135 () Bool)

(assert (=> b!971750 m!899135))

(declare-fun m!899137 () Bool)

(assert (=> mapNonEmpty!35251 m!899137))

(assert (=> b!971756 m!899133))

(assert (=> b!971756 m!899133))

(declare-fun m!899139 () Bool)

(assert (=> b!971756 m!899139))

(declare-fun m!899141 () Bool)

(assert (=> b!971754 m!899141))

(declare-fun m!899143 () Bool)

(assert (=> b!971749 m!899143))

(check-sat (not b!971754) tp_is_empty!22161 (not start!83270) (not b!971750) (not b!971749) (not b_next!19263) (not mapNonEmpty!35251) (not b!971756) (not b!971752) b_and!30751)
(check-sat b_and!30751 (not b_next!19263))
