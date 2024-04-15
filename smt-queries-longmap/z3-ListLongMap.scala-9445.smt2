; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112278 () Bool)

(assert start!112278)

(declare-fun b_free!30673 () Bool)

(declare-fun b_next!30673 () Bool)

(assert (=> start!112278 (= b_free!30673 (not b_next!30673))))

(declare-fun tp!107656 () Bool)

(declare-fun b_and!49383 () Bool)

(assert (=> start!112278 (= tp!107656 b_and!49383)))

(declare-fun b!1330279 () Bool)

(declare-fun res!882714 () Bool)

(declare-fun e!758214 () Bool)

(assert (=> b!1330279 (=> (not res!882714) (not e!758214))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330279 (= res!882714 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882719 () Bool)

(assert (=> start!112278 (=> (not res!882719) (not e!758214))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112278 (= res!882719 (validMask!0 mask!1998))))

(assert (=> start!112278 e!758214))

(declare-datatypes ((V!53881 0))(
  ( (V!53882 (val!18366 Int)) )
))
(declare-datatypes ((ValueCell!17393 0))(
  ( (ValueCellFull!17393 (v!21002 V!53881)) (EmptyCell!17393) )
))
(declare-datatypes ((array!89987 0))(
  ( (array!89988 (arr!43460 (Array (_ BitVec 32) ValueCell!17393)) (size!44012 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89987)

(declare-fun e!758218 () Bool)

(declare-fun array_inv!32961 (array!89987) Bool)

(assert (=> start!112278 (and (array_inv!32961 _values!1320) e!758218)))

(assert (=> start!112278 true))

(declare-datatypes ((array!89989 0))(
  ( (array!89990 (arr!43461 (Array (_ BitVec 32) (_ BitVec 64))) (size!44013 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89989)

(declare-fun array_inv!32962 (array!89989) Bool)

(assert (=> start!112278 (array_inv!32962 _keys!1590)))

(assert (=> start!112278 tp!107656))

(declare-fun tp_is_empty!36583 () Bool)

(assert (=> start!112278 tp_is_empty!36583))

(declare-fun b!1330280 () Bool)

(declare-fun res!882715 () Bool)

(assert (=> b!1330280 (=> (not res!882715) (not e!758214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89989 (_ BitVec 32)) Bool)

(assert (=> b!1330280 (= res!882715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330281 () Bool)

(declare-fun e!758215 () Bool)

(declare-fun mapRes!56548 () Bool)

(assert (=> b!1330281 (= e!758218 (and e!758215 mapRes!56548))))

(declare-fun condMapEmpty!56548 () Bool)

(declare-fun mapDefault!56548 () ValueCell!17393)

(assert (=> b!1330281 (= condMapEmpty!56548 (= (arr!43460 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17393)) mapDefault!56548)))))

(declare-fun b!1330282 () Bool)

(declare-fun res!882720 () Bool)

(assert (=> b!1330282 (=> (not res!882720) (not e!758214))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53881)

(declare-fun zeroValue!1262 () V!53881)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23712 0))(
  ( (tuple2!23713 (_1!11867 (_ BitVec 64)) (_2!11867 V!53881)) )
))
(declare-datatypes ((List!30856 0))(
  ( (Nil!30853) (Cons!30852 (h!32061 tuple2!23712) (t!44934 List!30856)) )
))
(declare-datatypes ((ListLongMap!21369 0))(
  ( (ListLongMap!21370 (toList!10700 List!30856)) )
))
(declare-fun contains!8792 (ListLongMap!21369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5564 (array!89989 array!89987 (_ BitVec 32) (_ BitVec 32) V!53881 V!53881 (_ BitVec 32) Int) ListLongMap!21369)

(assert (=> b!1330282 (= res!882720 (contains!8792 (getCurrentListMap!5564 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56548 () Bool)

(declare-fun tp!107657 () Bool)

(declare-fun e!758217 () Bool)

(assert (=> mapNonEmpty!56548 (= mapRes!56548 (and tp!107657 e!758217))))

(declare-fun mapValue!56548 () ValueCell!17393)

(declare-fun mapKey!56548 () (_ BitVec 32))

(declare-fun mapRest!56548 () (Array (_ BitVec 32) ValueCell!17393))

(assert (=> mapNonEmpty!56548 (= (arr!43460 _values!1320) (store mapRest!56548 mapKey!56548 mapValue!56548))))

(declare-fun b!1330283 () Bool)

(declare-fun res!882717 () Bool)

(assert (=> b!1330283 (=> (not res!882717) (not e!758214))))

(assert (=> b!1330283 (= res!882717 (and (= (size!44012 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44013 _keys!1590) (size!44012 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330284 () Bool)

(declare-fun res!882721 () Bool)

(assert (=> b!1330284 (=> (not res!882721) (not e!758214))))

(declare-datatypes ((List!30857 0))(
  ( (Nil!30854) (Cons!30853 (h!32062 (_ BitVec 64)) (t!44935 List!30857)) )
))
(declare-fun arrayNoDuplicates!0 (array!89989 (_ BitVec 32) List!30857) Bool)

(assert (=> b!1330284 (= res!882721 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30854))))

(declare-fun b!1330285 () Bool)

(declare-fun res!882718 () Bool)

(assert (=> b!1330285 (=> (not res!882718) (not e!758214))))

(assert (=> b!1330285 (= res!882718 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44013 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330286 () Bool)

(declare-fun res!882716 () Bool)

(assert (=> b!1330286 (=> (not res!882716) (not e!758214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330286 (= res!882716 (validKeyInArray!0 (select (arr!43461 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56548 () Bool)

(assert (=> mapIsEmpty!56548 mapRes!56548))

(declare-fun b!1330287 () Bool)

(assert (=> b!1330287 (= e!758215 tp_is_empty!36583)))

(declare-fun b!1330288 () Bool)

(declare-fun res!882713 () Bool)

(assert (=> b!1330288 (=> (not res!882713) (not e!758214))))

(assert (=> b!1330288 (= res!882713 (not (= (select (arr!43461 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330289 () Bool)

(assert (=> b!1330289 (= e!758214 (not true))))

(declare-fun lt!590919 () ListLongMap!21369)

(assert (=> b!1330289 (contains!8792 lt!590919 k0!1153)))

(declare-datatypes ((Unit!43580 0))(
  ( (Unit!43581) )
))
(declare-fun lt!590921 () Unit!43580)

(declare-fun lt!590923 () V!53881)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!240 ((_ BitVec 64) (_ BitVec 64) V!53881 ListLongMap!21369) Unit!43580)

(assert (=> b!1330289 (= lt!590921 (lemmaInListMapAfterAddingDiffThenInBefore!240 k0!1153 (select (arr!43461 _keys!1590) from!1980) lt!590923 lt!590919))))

(declare-fun lt!590922 () ListLongMap!21369)

(assert (=> b!1330289 (contains!8792 lt!590922 k0!1153)))

(declare-fun lt!590920 () Unit!43580)

(assert (=> b!1330289 (= lt!590920 (lemmaInListMapAfterAddingDiffThenInBefore!240 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590922))))

(declare-fun +!4684 (ListLongMap!21369 tuple2!23712) ListLongMap!21369)

(assert (=> b!1330289 (= lt!590922 (+!4684 lt!590919 (tuple2!23713 (select (arr!43461 _keys!1590) from!1980) lt!590923)))))

(declare-fun get!21905 (ValueCell!17393 V!53881) V!53881)

(declare-fun dynLambda!3614 (Int (_ BitVec 64)) V!53881)

(assert (=> b!1330289 (= lt!590923 (get!21905 (select (arr!43460 _values!1320) from!1980) (dynLambda!3614 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6322 (array!89989 array!89987 (_ BitVec 32) (_ BitVec 32) V!53881 V!53881 (_ BitVec 32) Int) ListLongMap!21369)

(assert (=> b!1330289 (= lt!590919 (getCurrentListMapNoExtraKeys!6322 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330290 () Bool)

(assert (=> b!1330290 (= e!758217 tp_is_empty!36583)))

(assert (= (and start!112278 res!882719) b!1330283))

(assert (= (and b!1330283 res!882717) b!1330280))

(assert (= (and b!1330280 res!882715) b!1330284))

(assert (= (and b!1330284 res!882721) b!1330285))

(assert (= (and b!1330285 res!882718) b!1330282))

(assert (= (and b!1330282 res!882720) b!1330288))

(assert (= (and b!1330288 res!882713) b!1330286))

(assert (= (and b!1330286 res!882716) b!1330279))

(assert (= (and b!1330279 res!882714) b!1330289))

(assert (= (and b!1330281 condMapEmpty!56548) mapIsEmpty!56548))

(assert (= (and b!1330281 (not condMapEmpty!56548)) mapNonEmpty!56548))

(get-info :version)

(assert (= (and mapNonEmpty!56548 ((_ is ValueCellFull!17393) mapValue!56548)) b!1330290))

(assert (= (and b!1330281 ((_ is ValueCellFull!17393) mapDefault!56548)) b!1330287))

(assert (= start!112278 b!1330281))

(declare-fun b_lambda!23923 () Bool)

(assert (=> (not b_lambda!23923) (not b!1330289)))

(declare-fun t!44933 () Bool)

(declare-fun tb!11881 () Bool)

(assert (=> (and start!112278 (= defaultEntry!1323 defaultEntry!1323) t!44933) tb!11881))

(declare-fun result!24841 () Bool)

(assert (=> tb!11881 (= result!24841 tp_is_empty!36583)))

(assert (=> b!1330289 t!44933))

(declare-fun b_and!49385 () Bool)

(assert (= b_and!49383 (and (=> t!44933 result!24841) b_and!49385)))

(declare-fun m!1218495 () Bool)

(assert (=> b!1330289 m!1218495))

(declare-fun m!1218497 () Bool)

(assert (=> b!1330289 m!1218497))

(declare-fun m!1218499 () Bool)

(assert (=> b!1330289 m!1218499))

(declare-fun m!1218501 () Bool)

(assert (=> b!1330289 m!1218501))

(assert (=> b!1330289 m!1218499))

(declare-fun m!1218503 () Bool)

(assert (=> b!1330289 m!1218503))

(declare-fun m!1218505 () Bool)

(assert (=> b!1330289 m!1218505))

(declare-fun m!1218507 () Bool)

(assert (=> b!1330289 m!1218507))

(declare-fun m!1218509 () Bool)

(assert (=> b!1330289 m!1218509))

(assert (=> b!1330289 m!1218501))

(assert (=> b!1330289 m!1218507))

(declare-fun m!1218511 () Bool)

(assert (=> b!1330289 m!1218511))

(declare-fun m!1218513 () Bool)

(assert (=> b!1330289 m!1218513))

(declare-fun m!1218515 () Bool)

(assert (=> b!1330280 m!1218515))

(declare-fun m!1218517 () Bool)

(assert (=> mapNonEmpty!56548 m!1218517))

(declare-fun m!1218519 () Bool)

(assert (=> b!1330284 m!1218519))

(declare-fun m!1218521 () Bool)

(assert (=> b!1330282 m!1218521))

(assert (=> b!1330282 m!1218521))

(declare-fun m!1218523 () Bool)

(assert (=> b!1330282 m!1218523))

(assert (=> b!1330286 m!1218507))

(assert (=> b!1330286 m!1218507))

(declare-fun m!1218525 () Bool)

(assert (=> b!1330286 m!1218525))

(declare-fun m!1218527 () Bool)

(assert (=> start!112278 m!1218527))

(declare-fun m!1218529 () Bool)

(assert (=> start!112278 m!1218529))

(declare-fun m!1218531 () Bool)

(assert (=> start!112278 m!1218531))

(assert (=> b!1330288 m!1218507))

(check-sat (not b!1330282) b_and!49385 tp_is_empty!36583 (not b_next!30673) (not b_lambda!23923) (not mapNonEmpty!56548) (not b!1330280) (not start!112278) (not b!1330289) (not b!1330286) (not b!1330284))
(check-sat b_and!49385 (not b_next!30673))
