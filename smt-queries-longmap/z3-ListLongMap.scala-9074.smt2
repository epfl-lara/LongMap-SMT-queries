; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109228 () Bool)

(assert start!109228)

(declare-fun b_free!28717 () Bool)

(declare-fun b_next!28717 () Bool)

(assert (=> start!109228 (= b_free!28717 (not b_next!28717))))

(declare-fun tp!101271 () Bool)

(declare-fun b_and!46789 () Bool)

(assert (=> start!109228 (= tp!101271 b_and!46789)))

(declare-fun b!1292088 () Bool)

(declare-fun e!737523 () Bool)

(declare-fun e!737522 () Bool)

(declare-fun mapRes!53096 () Bool)

(assert (=> b!1292088 (= e!737523 (and e!737522 mapRes!53096))))

(declare-fun condMapEmpty!53096 () Bool)

(declare-datatypes ((V!50913 0))(
  ( (V!50914 (val!17253 Int)) )
))
(declare-datatypes ((ValueCell!16280 0))(
  ( (ValueCellFull!16280 (v!19855 V!50913)) (EmptyCell!16280) )
))
(declare-datatypes ((array!85631 0))(
  ( (array!85632 (arr!41317 (Array (_ BitVec 32) ValueCell!16280)) (size!41869 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85631)

(declare-fun mapDefault!53096 () ValueCell!16280)

(assert (=> b!1292088 (= condMapEmpty!53096 (= (arr!41317 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16280)) mapDefault!53096)))))

(declare-fun b!1292089 () Bool)

(declare-fun res!858515 () Bool)

(declare-fun e!737526 () Bool)

(assert (=> b!1292089 (=> (not res!858515) (not e!737526))))

(declare-datatypes ((array!85633 0))(
  ( (array!85634 (arr!41318 (Array (_ BitVec 32) (_ BitVec 64))) (size!41870 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85633)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292089 (= res!858515 (not (validKeyInArray!0 (select (arr!41318 _keys!1741) from!2144))))))

(declare-fun b!1292090 () Bool)

(declare-fun res!858518 () Bool)

(assert (=> b!1292090 (=> (not res!858518) (not e!737526))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1292090 (= res!858518 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41870 _keys!1741))))))

(declare-fun b!1292091 () Bool)

(declare-fun res!858517 () Bool)

(assert (=> b!1292091 (=> (not res!858517) (not e!737526))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85633 (_ BitVec 32)) Bool)

(assert (=> b!1292091 (= res!858517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292092 () Bool)

(declare-fun res!858516 () Bool)

(assert (=> b!1292092 (=> (not res!858516) (not e!737526))))

(assert (=> b!1292092 (= res!858516 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41870 _keys!1741))))))

(declare-fun mapIsEmpty!53096 () Bool)

(assert (=> mapIsEmpty!53096 mapRes!53096))

(declare-fun b!1292093 () Bool)

(declare-fun res!858520 () Bool)

(assert (=> b!1292093 (=> (not res!858520) (not e!737526))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292093 (= res!858520 (and (= (size!41869 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41870 _keys!1741) (size!41869 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53096 () Bool)

(declare-fun tp!101270 () Bool)

(declare-fun e!737524 () Bool)

(assert (=> mapNonEmpty!53096 (= mapRes!53096 (and tp!101270 e!737524))))

(declare-fun mapRest!53096 () (Array (_ BitVec 32) ValueCell!16280))

(declare-fun mapValue!53096 () ValueCell!16280)

(declare-fun mapKey!53096 () (_ BitVec 32))

(assert (=> mapNonEmpty!53096 (= (arr!41317 _values!1445) (store mapRest!53096 mapKey!53096 mapValue!53096))))

(declare-fun b!1292094 () Bool)

(declare-fun res!858522 () Bool)

(assert (=> b!1292094 (=> (not res!858522) (not e!737526))))

(declare-datatypes ((List!29384 0))(
  ( (Nil!29381) (Cons!29380 (h!30589 (_ BitVec 64)) (t!42940 List!29384)) )
))
(declare-fun arrayNoDuplicates!0 (array!85633 (_ BitVec 32) List!29384) Bool)

(assert (=> b!1292094 (= res!858522 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29381))))

(declare-fun res!858521 () Bool)

(assert (=> start!109228 (=> (not res!858521) (not e!737526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109228 (= res!858521 (validMask!0 mask!2175))))

(assert (=> start!109228 e!737526))

(declare-fun tp_is_empty!34357 () Bool)

(assert (=> start!109228 tp_is_empty!34357))

(assert (=> start!109228 true))

(declare-fun array_inv!31465 (array!85631) Bool)

(assert (=> start!109228 (and (array_inv!31465 _values!1445) e!737523)))

(declare-fun array_inv!31466 (array!85633) Bool)

(assert (=> start!109228 (array_inv!31466 _keys!1741)))

(assert (=> start!109228 tp!101271))

(declare-fun b!1292087 () Bool)

(assert (=> b!1292087 (= e!737526 (not true))))

(declare-datatypes ((tuple2!22230 0))(
  ( (tuple2!22231 (_1!11126 (_ BitVec 64)) (_2!11126 V!50913)) )
))
(declare-datatypes ((List!29385 0))(
  ( (Nil!29382) (Cons!29381 (h!30590 tuple2!22230) (t!42941 List!29385)) )
))
(declare-datatypes ((ListLongMap!19887 0))(
  ( (ListLongMap!19888 (toList!9959 List!29385)) )
))
(declare-fun contains!8007 (ListLongMap!19887 (_ BitVec 64)) Bool)

(assert (=> b!1292087 (not (contains!8007 (ListLongMap!19888 Nil!29382) k0!1205))))

(declare-datatypes ((Unit!42606 0))(
  ( (Unit!42607) )
))
(declare-fun lt!579133 () Unit!42606)

(declare-fun emptyContainsNothing!100 ((_ BitVec 64)) Unit!42606)

(assert (=> b!1292087 (= lt!579133 (emptyContainsNothing!100 k0!1205))))

(declare-fun b!1292095 () Bool)

(assert (=> b!1292095 (= e!737522 tp_is_empty!34357)))

(declare-fun b!1292096 () Bool)

(assert (=> b!1292096 (= e!737524 tp_is_empty!34357)))

(declare-fun b!1292097 () Bool)

(declare-fun res!858519 () Bool)

(assert (=> b!1292097 (=> (not res!858519) (not e!737526))))

(declare-fun minValue!1387 () V!50913)

(declare-fun zeroValue!1387 () V!50913)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4903 (array!85633 array!85631 (_ BitVec 32) (_ BitVec 32) V!50913 V!50913 (_ BitVec 32) Int) ListLongMap!19887)

(assert (=> b!1292097 (= res!858519 (contains!8007 (getCurrentListMap!4903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109228 res!858521) b!1292093))

(assert (= (and b!1292093 res!858520) b!1292091))

(assert (= (and b!1292091 res!858517) b!1292094))

(assert (= (and b!1292094 res!858522) b!1292092))

(assert (= (and b!1292092 res!858516) b!1292097))

(assert (= (and b!1292097 res!858519) b!1292090))

(assert (= (and b!1292090 res!858518) b!1292089))

(assert (= (and b!1292089 res!858515) b!1292087))

(assert (= (and b!1292088 condMapEmpty!53096) mapIsEmpty!53096))

(assert (= (and b!1292088 (not condMapEmpty!53096)) mapNonEmpty!53096))

(get-info :version)

(assert (= (and mapNonEmpty!53096 ((_ is ValueCellFull!16280) mapValue!53096)) b!1292096))

(assert (= (and b!1292088 ((_ is ValueCellFull!16280) mapDefault!53096)) b!1292095))

(assert (= start!109228 b!1292088))

(declare-fun m!1184283 () Bool)

(assert (=> b!1292097 m!1184283))

(assert (=> b!1292097 m!1184283))

(declare-fun m!1184285 () Bool)

(assert (=> b!1292097 m!1184285))

(declare-fun m!1184287 () Bool)

(assert (=> b!1292089 m!1184287))

(assert (=> b!1292089 m!1184287))

(declare-fun m!1184289 () Bool)

(assert (=> b!1292089 m!1184289))

(declare-fun m!1184291 () Bool)

(assert (=> b!1292087 m!1184291))

(declare-fun m!1184293 () Bool)

(assert (=> b!1292087 m!1184293))

(declare-fun m!1184295 () Bool)

(assert (=> mapNonEmpty!53096 m!1184295))

(declare-fun m!1184297 () Bool)

(assert (=> b!1292091 m!1184297))

(declare-fun m!1184299 () Bool)

(assert (=> b!1292094 m!1184299))

(declare-fun m!1184301 () Bool)

(assert (=> start!109228 m!1184301))

(declare-fun m!1184303 () Bool)

(assert (=> start!109228 m!1184303))

(declare-fun m!1184305 () Bool)

(assert (=> start!109228 m!1184305))

(check-sat (not b!1292097) (not b!1292094) (not mapNonEmpty!53096) tp_is_empty!34357 (not b!1292087) (not b!1292089) (not b_next!28717) b_and!46789 (not b!1292091) (not start!109228))
(check-sat b_and!46789 (not b_next!28717))
