; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112154 () Bool)

(assert start!112154)

(declare-fun b_free!30549 () Bool)

(declare-fun b_next!30549 () Bool)

(assert (=> start!112154 (= b_free!30549 (not b_next!30549))))

(declare-fun tp!107284 () Bool)

(declare-fun b_and!49199 () Bool)

(assert (=> start!112154 (= tp!107284 b_and!49199)))

(declare-fun mapIsEmpty!56362 () Bool)

(declare-fun mapRes!56362 () Bool)

(assert (=> mapIsEmpty!56362 mapRes!56362))

(declare-fun b!1328280 () Bool)

(declare-fun res!881312 () Bool)

(declare-fun e!757321 () Bool)

(assert (=> b!1328280 (=> (not res!881312) (not e!757321))))

(declare-datatypes ((array!89812 0))(
  ( (array!89813 (arr!43372 (Array (_ BitVec 32) (_ BitVec 64))) (size!43922 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89812)

(declare-datatypes ((List!30714 0))(
  ( (Nil!30711) (Cons!30710 (h!31919 (_ BitVec 64)) (t!44720 List!30714)) )
))
(declare-fun arrayNoDuplicates!0 (array!89812 (_ BitVec 32) List!30714) Bool)

(assert (=> b!1328280 (= res!881312 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30711))))

(declare-fun b!1328281 () Bool)

(assert (=> b!1328281 (= e!757321 false)))

(declare-datatypes ((V!53715 0))(
  ( (V!53716 (val!18304 Int)) )
))
(declare-datatypes ((ValueCell!17331 0))(
  ( (ValueCellFull!17331 (v!20941 V!53715)) (EmptyCell!17331) )
))
(declare-datatypes ((array!89814 0))(
  ( (array!89815 (arr!43373 (Array (_ BitVec 32) ValueCell!17331)) (size!43923 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89814)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!590821 () Bool)

(declare-fun minValue!1262 () V!53715)

(declare-fun zeroValue!1262 () V!53715)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23558 0))(
  ( (tuple2!23559 (_1!11790 (_ BitVec 64)) (_2!11790 V!53715)) )
))
(declare-datatypes ((List!30715 0))(
  ( (Nil!30712) (Cons!30711 (h!31920 tuple2!23558) (t!44721 List!30715)) )
))
(declare-datatypes ((ListLongMap!21215 0))(
  ( (ListLongMap!21216 (toList!10623 List!30715)) )
))
(declare-fun contains!8787 (ListLongMap!21215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5614 (array!89812 array!89814 (_ BitVec 32) (_ BitVec 32) V!53715 V!53715 (_ BitVec 32) Int) ListLongMap!21215)

(assert (=> b!1328281 (= lt!590821 (contains!8787 (getCurrentListMap!5614 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328282 () Bool)

(declare-fun e!757320 () Bool)

(declare-fun e!757319 () Bool)

(assert (=> b!1328282 (= e!757320 (and e!757319 mapRes!56362))))

(declare-fun condMapEmpty!56362 () Bool)

(declare-fun mapDefault!56362 () ValueCell!17331)

(assert (=> b!1328282 (= condMapEmpty!56362 (= (arr!43373 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17331)) mapDefault!56362)))))

(declare-fun res!881309 () Bool)

(assert (=> start!112154 (=> (not res!881309) (not e!757321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112154 (= res!881309 (validMask!0 mask!1998))))

(assert (=> start!112154 e!757321))

(declare-fun array_inv!32727 (array!89814) Bool)

(assert (=> start!112154 (and (array_inv!32727 _values!1320) e!757320)))

(assert (=> start!112154 true))

(declare-fun array_inv!32728 (array!89812) Bool)

(assert (=> start!112154 (array_inv!32728 _keys!1590)))

(assert (=> start!112154 tp!107284))

(declare-fun tp_is_empty!36459 () Bool)

(assert (=> start!112154 tp_is_empty!36459))

(declare-fun b!1328283 () Bool)

(declare-fun e!757318 () Bool)

(assert (=> b!1328283 (= e!757318 tp_is_empty!36459)))

(declare-fun b!1328284 () Bool)

(assert (=> b!1328284 (= e!757319 tp_is_empty!36459)))

(declare-fun b!1328285 () Bool)

(declare-fun res!881311 () Bool)

(assert (=> b!1328285 (=> (not res!881311) (not e!757321))))

(assert (=> b!1328285 (= res!881311 (and (= (size!43923 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43922 _keys!1590) (size!43923 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56362 () Bool)

(declare-fun tp!107283 () Bool)

(assert (=> mapNonEmpty!56362 (= mapRes!56362 (and tp!107283 e!757318))))

(declare-fun mapValue!56362 () ValueCell!17331)

(declare-fun mapRest!56362 () (Array (_ BitVec 32) ValueCell!17331))

(declare-fun mapKey!56362 () (_ BitVec 32))

(assert (=> mapNonEmpty!56362 (= (arr!43373 _values!1320) (store mapRest!56362 mapKey!56362 mapValue!56362))))

(declare-fun b!1328286 () Bool)

(declare-fun res!881313 () Bool)

(assert (=> b!1328286 (=> (not res!881313) (not e!757321))))

(assert (=> b!1328286 (= res!881313 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43922 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328287 () Bool)

(declare-fun res!881310 () Bool)

(assert (=> b!1328287 (=> (not res!881310) (not e!757321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89812 (_ BitVec 32)) Bool)

(assert (=> b!1328287 (= res!881310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112154 res!881309) b!1328285))

(assert (= (and b!1328285 res!881311) b!1328287))

(assert (= (and b!1328287 res!881310) b!1328280))

(assert (= (and b!1328280 res!881312) b!1328286))

(assert (= (and b!1328286 res!881313) b!1328281))

(assert (= (and b!1328282 condMapEmpty!56362) mapIsEmpty!56362))

(assert (= (and b!1328282 (not condMapEmpty!56362)) mapNonEmpty!56362))

(get-info :version)

(assert (= (and mapNonEmpty!56362 ((_ is ValueCellFull!17331) mapValue!56362)) b!1328283))

(assert (= (and b!1328282 ((_ is ValueCellFull!17331) mapDefault!56362)) b!1328284))

(assert (= start!112154 b!1328282))

(declare-fun m!1217305 () Bool)

(assert (=> b!1328287 m!1217305))

(declare-fun m!1217307 () Bool)

(assert (=> b!1328281 m!1217307))

(assert (=> b!1328281 m!1217307))

(declare-fun m!1217309 () Bool)

(assert (=> b!1328281 m!1217309))

(declare-fun m!1217311 () Bool)

(assert (=> start!112154 m!1217311))

(declare-fun m!1217313 () Bool)

(assert (=> start!112154 m!1217313))

(declare-fun m!1217315 () Bool)

(assert (=> start!112154 m!1217315))

(declare-fun m!1217317 () Bool)

(assert (=> b!1328280 m!1217317))

(declare-fun m!1217319 () Bool)

(assert (=> mapNonEmpty!56362 m!1217319))

(check-sat (not mapNonEmpty!56362) tp_is_empty!36459 (not b!1328287) (not start!112154) (not b!1328280) b_and!49199 (not b_next!30549) (not b!1328281))
(check-sat b_and!49199 (not b_next!30549))
