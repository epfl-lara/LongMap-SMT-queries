; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112430 () Bool)

(assert start!112430)

(declare-fun b_free!30601 () Bool)

(declare-fun b_next!30601 () Bool)

(assert (=> start!112430 (= b_free!30601 (not b_next!30601))))

(declare-fun tp!107440 () Bool)

(declare-fun b_and!49259 () Bool)

(assert (=> start!112430 (= tp!107440 b_and!49259)))

(declare-fun b!1330280 () Bool)

(declare-fun e!758552 () Bool)

(declare-fun tp_is_empty!36511 () Bool)

(assert (=> b!1330280 (= e!758552 tp_is_empty!36511)))

(declare-fun b!1330281 () Bool)

(declare-fun res!882292 () Bool)

(declare-fun e!758550 () Bool)

(assert (=> b!1330281 (=> (not res!882292) (not e!758550))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330281 (= res!882292 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330282 () Bool)

(declare-fun res!882289 () Bool)

(assert (=> b!1330282 (=> (not res!882289) (not e!758550))))

(declare-datatypes ((V!53785 0))(
  ( (V!53786 (val!18330 Int)) )
))
(declare-datatypes ((ValueCell!17357 0))(
  ( (ValueCellFull!17357 (v!20962 V!53785)) (EmptyCell!17357) )
))
(declare-datatypes ((array!90023 0))(
  ( (array!90024 (arr!43473 (Array (_ BitVec 32) ValueCell!17357)) (size!44024 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90023)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90025 0))(
  ( (array!90026 (arr!43474 (Array (_ BitVec 32) (_ BitVec 64))) (size!44025 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90025)

(assert (=> b!1330282 (= res!882289 (and (= (size!44024 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44025 _keys!1590) (size!44024 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330283 () Bool)

(declare-fun e!758554 () Bool)

(assert (=> b!1330283 (= e!758554 tp_is_empty!36511)))

(declare-fun b!1330284 () Bool)

(declare-fun e!758551 () Bool)

(declare-fun mapRes!56440 () Bool)

(assert (=> b!1330284 (= e!758551 (and e!758554 mapRes!56440))))

(declare-fun condMapEmpty!56440 () Bool)

(declare-fun mapDefault!56440 () ValueCell!17357)

(assert (=> b!1330284 (= condMapEmpty!56440 (= (arr!43473 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17357)) mapDefault!56440)))))

(declare-fun b!1330285 () Bool)

(declare-fun res!882295 () Bool)

(assert (=> b!1330285 (=> (not res!882295) (not e!758550))))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53785)

(declare-fun zeroValue!1262 () V!53785)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23624 0))(
  ( (tuple2!23625 (_1!11823 (_ BitVec 64)) (_2!11823 V!53785)) )
))
(declare-datatypes ((List!30799 0))(
  ( (Nil!30796) (Cons!30795 (h!32013 tuple2!23624) (t!44805 List!30799)) )
))
(declare-datatypes ((ListLongMap!21289 0))(
  ( (ListLongMap!21290 (toList!10660 List!30799)) )
))
(declare-fun contains!8836 (ListLongMap!21289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5637 (array!90025 array!90023 (_ BitVec 32) (_ BitVec 32) V!53785 V!53785 (_ BitVec 32) Int) ListLongMap!21289)

(assert (=> b!1330285 (= res!882295 (contains!8836 (getCurrentListMap!5637 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56440 () Bool)

(declare-fun tp!107439 () Bool)

(assert (=> mapNonEmpty!56440 (= mapRes!56440 (and tp!107439 e!758552))))

(declare-fun mapValue!56440 () ValueCell!17357)

(declare-fun mapRest!56440 () (Array (_ BitVec 32) ValueCell!17357))

(declare-fun mapKey!56440 () (_ BitVec 32))

(assert (=> mapNonEmpty!56440 (= (arr!43473 _values!1320) (store mapRest!56440 mapKey!56440 mapValue!56440))))

(declare-fun b!1330286 () Bool)

(declare-fun res!882294 () Bool)

(assert (=> b!1330286 (=> (not res!882294) (not e!758550))))

(declare-datatypes ((List!30800 0))(
  ( (Nil!30797) (Cons!30796 (h!32014 (_ BitVec 64)) (t!44806 List!30800)) )
))
(declare-fun arrayNoDuplicates!0 (array!90025 (_ BitVec 32) List!30800) Bool)

(assert (=> b!1330286 (= res!882294 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30797))))

(declare-fun b!1330287 () Bool)

(declare-fun res!882290 () Bool)

(assert (=> b!1330287 (=> (not res!882290) (not e!758550))))

(assert (=> b!1330287 (= res!882290 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44025 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330288 () Bool)

(assert (=> b!1330288 (= e!758550 false)))

(declare-fun lt!591366 () Bool)

(declare-fun +!4683 (ListLongMap!21289 tuple2!23624) ListLongMap!21289)

(declare-fun getCurrentListMapNoExtraKeys!6327 (array!90025 array!90023 (_ BitVec 32) (_ BitVec 32) V!53785 V!53785 (_ BitVec 32) Int) ListLongMap!21289)

(declare-fun get!21916 (ValueCell!17357 V!53785) V!53785)

(declare-fun dynLambda!3637 (Int (_ BitVec 64)) V!53785)

(assert (=> b!1330288 (= lt!591366 (contains!8836 (+!4683 (+!4683 (getCurrentListMapNoExtraKeys!6327 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23625 (select (arr!43474 _keys!1590) from!1980) (get!21916 (select (arr!43473 _values!1320) from!1980) (dynLambda!3637 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1330289 () Bool)

(declare-fun res!882296 () Bool)

(assert (=> b!1330289 (=> (not res!882296) (not e!758550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90025 (_ BitVec 32)) Bool)

(assert (=> b!1330289 (= res!882296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!882293 () Bool)

(assert (=> start!112430 (=> (not res!882293) (not e!758550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112430 (= res!882293 (validMask!0 mask!1998))))

(assert (=> start!112430 e!758550))

(declare-fun array_inv!33085 (array!90023) Bool)

(assert (=> start!112430 (and (array_inv!33085 _values!1320) e!758551)))

(assert (=> start!112430 true))

(declare-fun array_inv!33086 (array!90025) Bool)

(assert (=> start!112430 (array_inv!33086 _keys!1590)))

(assert (=> start!112430 tp!107440))

(assert (=> start!112430 tp_is_empty!36511))

(declare-fun b!1330290 () Bool)

(declare-fun res!882288 () Bool)

(assert (=> b!1330290 (=> (not res!882288) (not e!758550))))

(assert (=> b!1330290 (= res!882288 (not (= (select (arr!43474 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330291 () Bool)

(declare-fun res!882291 () Bool)

(assert (=> b!1330291 (=> (not res!882291) (not e!758550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330291 (= res!882291 (validKeyInArray!0 (select (arr!43474 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56440 () Bool)

(assert (=> mapIsEmpty!56440 mapRes!56440))

(assert (= (and start!112430 res!882293) b!1330282))

(assert (= (and b!1330282 res!882289) b!1330289))

(assert (= (and b!1330289 res!882296) b!1330286))

(assert (= (and b!1330286 res!882294) b!1330287))

(assert (= (and b!1330287 res!882290) b!1330285))

(assert (= (and b!1330285 res!882295) b!1330290))

(assert (= (and b!1330290 res!882288) b!1330291))

(assert (= (and b!1330291 res!882291) b!1330281))

(assert (= (and b!1330281 res!882292) b!1330288))

(assert (= (and b!1330284 condMapEmpty!56440) mapIsEmpty!56440))

(assert (= (and b!1330284 (not condMapEmpty!56440)) mapNonEmpty!56440))

(get-info :version)

(assert (= (and mapNonEmpty!56440 ((_ is ValueCellFull!17357) mapValue!56440)) b!1330280))

(assert (= (and b!1330284 ((_ is ValueCellFull!17357) mapDefault!56440)) b!1330283))

(assert (= start!112430 b!1330284))

(declare-fun b_lambda!23855 () Bool)

(assert (=> (not b_lambda!23855) (not b!1330288)))

(declare-fun t!44804 () Bool)

(declare-fun tb!11809 () Bool)

(assert (=> (and start!112430 (= defaultEntry!1323 defaultEntry!1323) t!44804) tb!11809))

(declare-fun result!24697 () Bool)

(assert (=> tb!11809 (= result!24697 tp_is_empty!36511)))

(assert (=> b!1330288 t!44804))

(declare-fun b_and!49261 () Bool)

(assert (= b_and!49259 (and (=> t!44804 result!24697) b_and!49261)))

(declare-fun m!1219385 () Bool)

(assert (=> b!1330288 m!1219385))

(declare-fun m!1219387 () Bool)

(assert (=> b!1330288 m!1219387))

(declare-fun m!1219389 () Bool)

(assert (=> b!1330288 m!1219389))

(declare-fun m!1219391 () Bool)

(assert (=> b!1330288 m!1219391))

(declare-fun m!1219393 () Bool)

(assert (=> b!1330288 m!1219393))

(assert (=> b!1330288 m!1219387))

(declare-fun m!1219395 () Bool)

(assert (=> b!1330288 m!1219395))

(assert (=> b!1330288 m!1219385))

(assert (=> b!1330288 m!1219389))

(declare-fun m!1219397 () Bool)

(assert (=> b!1330288 m!1219397))

(assert (=> b!1330288 m!1219391))

(assert (=> b!1330288 m!1219395))

(declare-fun m!1219399 () Bool)

(assert (=> b!1330288 m!1219399))

(declare-fun m!1219401 () Bool)

(assert (=> b!1330285 m!1219401))

(assert (=> b!1330285 m!1219401))

(declare-fun m!1219403 () Bool)

(assert (=> b!1330285 m!1219403))

(declare-fun m!1219405 () Bool)

(assert (=> mapNonEmpty!56440 m!1219405))

(declare-fun m!1219407 () Bool)

(assert (=> start!112430 m!1219407))

(declare-fun m!1219409 () Bool)

(assert (=> start!112430 m!1219409))

(declare-fun m!1219411 () Bool)

(assert (=> start!112430 m!1219411))

(assert (=> b!1330290 m!1219397))

(declare-fun m!1219413 () Bool)

(assert (=> b!1330289 m!1219413))

(declare-fun m!1219415 () Bool)

(assert (=> b!1330286 m!1219415))

(assert (=> b!1330291 m!1219397))

(assert (=> b!1330291 m!1219397))

(declare-fun m!1219417 () Bool)

(assert (=> b!1330291 m!1219417))

(check-sat (not b!1330285) (not b!1330291) (not b!1330289) (not b_next!30601) (not mapNonEmpty!56440) (not b!1330288) (not start!112430) (not b_lambda!23855) (not b!1330286) tp_is_empty!36511 b_and!49261)
(check-sat b_and!49261 (not b_next!30601))
