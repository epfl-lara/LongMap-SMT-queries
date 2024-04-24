; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112538 () Bool)

(assert start!112538)

(declare-fun b_free!30709 () Bool)

(declare-fun b_next!30709 () Bool)

(assert (=> start!112538 (= b_free!30709 (not b_next!30709))))

(declare-fun tp!107764 () Bool)

(declare-fun b_and!49475 () Bool)

(assert (=> start!112538 (= tp!107764 b_and!49475)))

(declare-fun b!1332332 () Bool)

(declare-fun e!759360 () Bool)

(declare-fun tp_is_empty!36619 () Bool)

(assert (=> b!1332332 (= e!759360 tp_is_empty!36619)))

(declare-fun mapNonEmpty!56602 () Bool)

(declare-fun mapRes!56602 () Bool)

(declare-fun tp!107763 () Bool)

(assert (=> mapNonEmpty!56602 (= mapRes!56602 (and tp!107763 e!759360))))

(declare-datatypes ((V!53929 0))(
  ( (V!53930 (val!18384 Int)) )
))
(declare-datatypes ((ValueCell!17411 0))(
  ( (ValueCellFull!17411 (v!21016 V!53929)) (EmptyCell!17411) )
))
(declare-datatypes ((array!90229 0))(
  ( (array!90230 (arr!43576 (Array (_ BitVec 32) ValueCell!17411)) (size!44127 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90229)

(declare-fun mapKey!56602 () (_ BitVec 32))

(declare-fun mapRest!56602 () (Array (_ BitVec 32) ValueCell!17411))

(declare-fun mapValue!56602 () ValueCell!17411)

(assert (=> mapNonEmpty!56602 (= (arr!43576 _values!1320) (store mapRest!56602 mapKey!56602 mapValue!56602))))

(declare-fun b!1332333 () Bool)

(declare-fun e!759364 () Bool)

(declare-fun e!759363 () Bool)

(assert (=> b!1332333 (= e!759364 (and e!759363 mapRes!56602))))

(declare-fun condMapEmpty!56602 () Bool)

(declare-fun mapDefault!56602 () ValueCell!17411)

(assert (=> b!1332333 (= condMapEmpty!56602 (= (arr!43576 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17411)) mapDefault!56602)))))

(declare-fun b!1332334 () Bool)

(declare-fun res!883754 () Bool)

(declare-fun e!759361 () Bool)

(assert (=> b!1332334 (=> (not res!883754) (not e!759361))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90231 0))(
  ( (array!90232 (arr!43577 (Array (_ BitVec 32) (_ BitVec 64))) (size!44128 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90231)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53929)

(declare-fun zeroValue!1262 () V!53929)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23712 0))(
  ( (tuple2!23713 (_1!11867 (_ BitVec 64)) (_2!11867 V!53929)) )
))
(declare-datatypes ((List!30878 0))(
  ( (Nil!30875) (Cons!30874 (h!32092 tuple2!23712) (t!44992 List!30878)) )
))
(declare-datatypes ((ListLongMap!21377 0))(
  ( (ListLongMap!21378 (toList!10704 List!30878)) )
))
(declare-fun contains!8880 (ListLongMap!21377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5674 (array!90231 array!90229 (_ BitVec 32) (_ BitVec 32) V!53929 V!53929 (_ BitVec 32) Int) ListLongMap!21377)

(assert (=> b!1332334 (= res!883754 (contains!8880 (getCurrentListMap!5674 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332335 () Bool)

(declare-fun res!883748 () Bool)

(assert (=> b!1332335 (=> (not res!883748) (not e!759361))))

(assert (=> b!1332335 (= res!883748 (not (= (select (arr!43577 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!883750 () Bool)

(assert (=> start!112538 (=> (not res!883750) (not e!759361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112538 (= res!883750 (validMask!0 mask!1998))))

(assert (=> start!112538 e!759361))

(declare-fun array_inv!33151 (array!90229) Bool)

(assert (=> start!112538 (and (array_inv!33151 _values!1320) e!759364)))

(assert (=> start!112538 true))

(declare-fun array_inv!33152 (array!90231) Bool)

(assert (=> start!112538 (array_inv!33152 _keys!1590)))

(assert (=> start!112538 tp!107764))

(assert (=> start!112538 tp_is_empty!36619))

(declare-fun b!1332336 () Bool)

(declare-fun res!883753 () Bool)

(assert (=> b!1332336 (=> (not res!883753) (not e!759361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90231 (_ BitVec 32)) Bool)

(assert (=> b!1332336 (= res!883753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332337 () Bool)

(declare-fun res!883752 () Bool)

(assert (=> b!1332337 (=> (not res!883752) (not e!759361))))

(assert (=> b!1332337 (= res!883752 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332338 () Bool)

(assert (=> b!1332338 (= e!759361 (not true))))

(declare-fun lt!591854 () ListLongMap!21377)

(assert (=> b!1332338 (contains!8880 lt!591854 k0!1153)))

(declare-fun lt!591851 () V!53929)

(declare-datatypes ((Unit!43746 0))(
  ( (Unit!43747) )
))
(declare-fun lt!591853 () Unit!43746)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!261 ((_ BitVec 64) (_ BitVec 64) V!53929 ListLongMap!21377) Unit!43746)

(assert (=> b!1332338 (= lt!591853 (lemmaInListMapAfterAddingDiffThenInBefore!261 k0!1153 (select (arr!43577 _keys!1590) from!1980) lt!591851 lt!591854))))

(declare-fun lt!591855 () ListLongMap!21377)

(assert (=> b!1332338 (contains!8880 lt!591855 k0!1153)))

(declare-fun lt!591852 () Unit!43746)

(assert (=> b!1332338 (= lt!591852 (lemmaInListMapAfterAddingDiffThenInBefore!261 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591855))))

(declare-fun +!4718 (ListLongMap!21377 tuple2!23712) ListLongMap!21377)

(assert (=> b!1332338 (= lt!591855 (+!4718 lt!591854 (tuple2!23713 (select (arr!43577 _keys!1590) from!1980) lt!591851)))))

(declare-fun get!21987 (ValueCell!17411 V!53929) V!53929)

(declare-fun dynLambda!3672 (Int (_ BitVec 64)) V!53929)

(assert (=> b!1332338 (= lt!591851 (get!21987 (select (arr!43576 _values!1320) from!1980) (dynLambda!3672 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6362 (array!90231 array!90229 (_ BitVec 32) (_ BitVec 32) V!53929 V!53929 (_ BitVec 32) Int) ListLongMap!21377)

(assert (=> b!1332338 (= lt!591854 (getCurrentListMapNoExtraKeys!6362 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332339 () Bool)

(declare-fun res!883749 () Bool)

(assert (=> b!1332339 (=> (not res!883749) (not e!759361))))

(assert (=> b!1332339 (= res!883749 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44128 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56602 () Bool)

(assert (=> mapIsEmpty!56602 mapRes!56602))

(declare-fun b!1332340 () Bool)

(declare-fun res!883751 () Bool)

(assert (=> b!1332340 (=> (not res!883751) (not e!759361))))

(declare-datatypes ((List!30879 0))(
  ( (Nil!30876) (Cons!30875 (h!32093 (_ BitVec 64)) (t!44993 List!30879)) )
))
(declare-fun arrayNoDuplicates!0 (array!90231 (_ BitVec 32) List!30879) Bool)

(assert (=> b!1332340 (= res!883751 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30876))))

(declare-fun b!1332341 () Bool)

(assert (=> b!1332341 (= e!759363 tp_is_empty!36619)))

(declare-fun b!1332342 () Bool)

(declare-fun res!883746 () Bool)

(assert (=> b!1332342 (=> (not res!883746) (not e!759361))))

(assert (=> b!1332342 (= res!883746 (and (= (size!44127 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44128 _keys!1590) (size!44127 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332343 () Bool)

(declare-fun res!883747 () Bool)

(assert (=> b!1332343 (=> (not res!883747) (not e!759361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332343 (= res!883747 (validKeyInArray!0 (select (arr!43577 _keys!1590) from!1980)))))

(assert (= (and start!112538 res!883750) b!1332342))

(assert (= (and b!1332342 res!883746) b!1332336))

(assert (= (and b!1332336 res!883753) b!1332340))

(assert (= (and b!1332340 res!883751) b!1332339))

(assert (= (and b!1332339 res!883749) b!1332334))

(assert (= (and b!1332334 res!883754) b!1332335))

(assert (= (and b!1332335 res!883748) b!1332343))

(assert (= (and b!1332343 res!883747) b!1332337))

(assert (= (and b!1332337 res!883752) b!1332338))

(assert (= (and b!1332333 condMapEmpty!56602) mapIsEmpty!56602))

(assert (= (and b!1332333 (not condMapEmpty!56602)) mapNonEmpty!56602))

(get-info :version)

(assert (= (and mapNonEmpty!56602 ((_ is ValueCellFull!17411) mapValue!56602)) b!1332332))

(assert (= (and b!1332333 ((_ is ValueCellFull!17411) mapDefault!56602)) b!1332341))

(assert (= start!112538 b!1332333))

(declare-fun b_lambda!23963 () Bool)

(assert (=> (not b_lambda!23963) (not b!1332338)))

(declare-fun t!44991 () Bool)

(declare-fun tb!11917 () Bool)

(assert (=> (and start!112538 (= defaultEntry!1323 defaultEntry!1323) t!44991) tb!11917))

(declare-fun result!24913 () Bool)

(assert (=> tb!11917 (= result!24913 tp_is_empty!36619)))

(assert (=> b!1332338 t!44991))

(declare-fun b_and!49477 () Bool)

(assert (= b_and!49475 (and (=> t!44991 result!24913) b_and!49477)))

(declare-fun m!1221293 () Bool)

(assert (=> b!1332336 m!1221293))

(declare-fun m!1221295 () Bool)

(assert (=> b!1332343 m!1221295))

(assert (=> b!1332343 m!1221295))

(declare-fun m!1221297 () Bool)

(assert (=> b!1332343 m!1221297))

(declare-fun m!1221299 () Bool)

(assert (=> b!1332338 m!1221299))

(declare-fun m!1221301 () Bool)

(assert (=> b!1332338 m!1221301))

(assert (=> b!1332338 m!1221299))

(declare-fun m!1221303 () Bool)

(assert (=> b!1332338 m!1221303))

(assert (=> b!1332338 m!1221295))

(declare-fun m!1221305 () Bool)

(assert (=> b!1332338 m!1221305))

(declare-fun m!1221307 () Bool)

(assert (=> b!1332338 m!1221307))

(declare-fun m!1221309 () Bool)

(assert (=> b!1332338 m!1221309))

(assert (=> b!1332338 m!1221301))

(declare-fun m!1221311 () Bool)

(assert (=> b!1332338 m!1221311))

(assert (=> b!1332338 m!1221295))

(declare-fun m!1221313 () Bool)

(assert (=> b!1332338 m!1221313))

(declare-fun m!1221315 () Bool)

(assert (=> b!1332338 m!1221315))

(declare-fun m!1221317 () Bool)

(assert (=> b!1332340 m!1221317))

(assert (=> b!1332335 m!1221295))

(declare-fun m!1221319 () Bool)

(assert (=> start!112538 m!1221319))

(declare-fun m!1221321 () Bool)

(assert (=> start!112538 m!1221321))

(declare-fun m!1221323 () Bool)

(assert (=> start!112538 m!1221323))

(declare-fun m!1221325 () Bool)

(assert (=> b!1332334 m!1221325))

(assert (=> b!1332334 m!1221325))

(declare-fun m!1221327 () Bool)

(assert (=> b!1332334 m!1221327))

(declare-fun m!1221329 () Bool)

(assert (=> mapNonEmpty!56602 m!1221329))

(check-sat tp_is_empty!36619 (not mapNonEmpty!56602) (not b!1332338) (not b!1332343) (not b!1332334) (not b!1332336) (not b_next!30709) (not start!112538) (not b_lambda!23963) b_and!49477 (not b!1332340))
(check-sat b_and!49477 (not b_next!30709))
