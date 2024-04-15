; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112272 () Bool)

(assert start!112272)

(declare-fun b_free!30667 () Bool)

(declare-fun b_next!30667 () Bool)

(assert (=> start!112272 (= b_free!30667 (not b_next!30667))))

(declare-fun tp!107639 () Bool)

(declare-fun b_and!49371 () Bool)

(assert (=> start!112272 (= tp!107639 b_and!49371)))

(declare-fun b!1330165 () Bool)

(declare-fun res!882635 () Bool)

(declare-fun e!758169 () Bool)

(assert (=> b!1330165 (=> (not res!882635) (not e!758169))))

(declare-datatypes ((array!89977 0))(
  ( (array!89978 (arr!43455 (Array (_ BitVec 32) (_ BitVec 64))) (size!44007 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89977)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330165 (= res!882635 (validKeyInArray!0 (select (arr!43455 _keys!1590) from!1980)))))

(declare-fun b!1330166 () Bool)

(assert (=> b!1330166 (= e!758169 (not true))))

(declare-datatypes ((V!53873 0))(
  ( (V!53874 (val!18363 Int)) )
))
(declare-datatypes ((tuple2!23708 0))(
  ( (tuple2!23709 (_1!11865 (_ BitVec 64)) (_2!11865 V!53873)) )
))
(declare-datatypes ((List!30853 0))(
  ( (Nil!30850) (Cons!30849 (h!32058 tuple2!23708) (t!44925 List!30853)) )
))
(declare-datatypes ((ListLongMap!21365 0))(
  ( (ListLongMap!21366 (toList!10698 List!30853)) )
))
(declare-fun lt!590896 () ListLongMap!21365)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8790 (ListLongMap!21365 (_ BitVec 64)) Bool)

(assert (=> b!1330166 (contains!8790 lt!590896 k0!1153)))

(declare-fun minValue!1262 () V!53873)

(declare-datatypes ((Unit!43576 0))(
  ( (Unit!43577) )
))
(declare-fun lt!590895 () Unit!43576)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!238 ((_ BitVec 64) (_ BitVec 64) V!53873 ListLongMap!21365) Unit!43576)

(assert (=> b!1330166 (= lt!590895 (lemmaInListMapAfterAddingDiffThenInBefore!238 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590896))))

(declare-datatypes ((ValueCell!17390 0))(
  ( (ValueCellFull!17390 (v!20999 V!53873)) (EmptyCell!17390) )
))
(declare-datatypes ((array!89979 0))(
  ( (array!89980 (arr!43456 (Array (_ BitVec 32) ValueCell!17390)) (size!44008 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89979)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53873)

(declare-fun +!4682 (ListLongMap!21365 tuple2!23708) ListLongMap!21365)

(declare-fun getCurrentListMapNoExtraKeys!6320 (array!89977 array!89979 (_ BitVec 32) (_ BitVec 32) V!53873 V!53873 (_ BitVec 32) Int) ListLongMap!21365)

(declare-fun get!21901 (ValueCell!17390 V!53873) V!53873)

(declare-fun dynLambda!3612 (Int (_ BitVec 64)) V!53873)

(assert (=> b!1330166 (= lt!590896 (+!4682 (getCurrentListMapNoExtraKeys!6320 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23709 (select (arr!43455 _keys!1590) from!1980) (get!21901 (select (arr!43456 _values!1320) from!1980) (dynLambda!3612 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330167 () Bool)

(declare-fun e!758173 () Bool)

(declare-fun e!758172 () Bool)

(declare-fun mapRes!56539 () Bool)

(assert (=> b!1330167 (= e!758173 (and e!758172 mapRes!56539))))

(declare-fun condMapEmpty!56539 () Bool)

(declare-fun mapDefault!56539 () ValueCell!17390)

(assert (=> b!1330167 (= condMapEmpty!56539 (= (arr!43456 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17390)) mapDefault!56539)))))

(declare-fun mapNonEmpty!56539 () Bool)

(declare-fun tp!107638 () Bool)

(declare-fun e!758170 () Bool)

(assert (=> mapNonEmpty!56539 (= mapRes!56539 (and tp!107638 e!758170))))

(declare-fun mapValue!56539 () ValueCell!17390)

(declare-fun mapRest!56539 () (Array (_ BitVec 32) ValueCell!17390))

(declare-fun mapKey!56539 () (_ BitVec 32))

(assert (=> mapNonEmpty!56539 (= (arr!43456 _values!1320) (store mapRest!56539 mapKey!56539 mapValue!56539))))

(declare-fun b!1330168 () Bool)

(declare-fun res!882639 () Bool)

(assert (=> b!1330168 (=> (not res!882639) (not e!758169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89977 (_ BitVec 32)) Bool)

(assert (=> b!1330168 (= res!882639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330169 () Bool)

(declare-fun res!882633 () Bool)

(assert (=> b!1330169 (=> (not res!882633) (not e!758169))))

(declare-datatypes ((List!30854 0))(
  ( (Nil!30851) (Cons!30850 (h!32059 (_ BitVec 64)) (t!44926 List!30854)) )
))
(declare-fun arrayNoDuplicates!0 (array!89977 (_ BitVec 32) List!30854) Bool)

(assert (=> b!1330169 (= res!882633 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30851))))

(declare-fun res!882636 () Bool)

(assert (=> start!112272 (=> (not res!882636) (not e!758169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112272 (= res!882636 (validMask!0 mask!1998))))

(assert (=> start!112272 e!758169))

(declare-fun array_inv!32957 (array!89979) Bool)

(assert (=> start!112272 (and (array_inv!32957 _values!1320) e!758173)))

(assert (=> start!112272 true))

(declare-fun array_inv!32958 (array!89977) Bool)

(assert (=> start!112272 (array_inv!32958 _keys!1590)))

(assert (=> start!112272 tp!107639))

(declare-fun tp_is_empty!36577 () Bool)

(assert (=> start!112272 tp_is_empty!36577))

(declare-fun b!1330170 () Bool)

(assert (=> b!1330170 (= e!758172 tp_is_empty!36577)))

(declare-fun b!1330171 () Bool)

(assert (=> b!1330171 (= e!758170 tp_is_empty!36577)))

(declare-fun b!1330172 () Bool)

(declare-fun res!882632 () Bool)

(assert (=> b!1330172 (=> (not res!882632) (not e!758169))))

(assert (=> b!1330172 (= res!882632 (not (= (select (arr!43455 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330173 () Bool)

(declare-fun res!882637 () Bool)

(assert (=> b!1330173 (=> (not res!882637) (not e!758169))))

(assert (=> b!1330173 (= res!882637 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330174 () Bool)

(declare-fun res!882634 () Bool)

(assert (=> b!1330174 (=> (not res!882634) (not e!758169))))

(assert (=> b!1330174 (= res!882634 (and (= (size!44008 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44007 _keys!1590) (size!44008 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330175 () Bool)

(declare-fun res!882640 () Bool)

(assert (=> b!1330175 (=> (not res!882640) (not e!758169))))

(assert (=> b!1330175 (= res!882640 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44007 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56539 () Bool)

(assert (=> mapIsEmpty!56539 mapRes!56539))

(declare-fun b!1330176 () Bool)

(declare-fun res!882638 () Bool)

(assert (=> b!1330176 (=> (not res!882638) (not e!758169))))

(declare-fun getCurrentListMap!5563 (array!89977 array!89979 (_ BitVec 32) (_ BitVec 32) V!53873 V!53873 (_ BitVec 32) Int) ListLongMap!21365)

(assert (=> b!1330176 (= res!882638 (contains!8790 (getCurrentListMap!5563 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112272 res!882636) b!1330174))

(assert (= (and b!1330174 res!882634) b!1330168))

(assert (= (and b!1330168 res!882639) b!1330169))

(assert (= (and b!1330169 res!882633) b!1330175))

(assert (= (and b!1330175 res!882640) b!1330176))

(assert (= (and b!1330176 res!882638) b!1330172))

(assert (= (and b!1330172 res!882632) b!1330165))

(assert (= (and b!1330165 res!882635) b!1330173))

(assert (= (and b!1330173 res!882637) b!1330166))

(assert (= (and b!1330167 condMapEmpty!56539) mapIsEmpty!56539))

(assert (= (and b!1330167 (not condMapEmpty!56539)) mapNonEmpty!56539))

(get-info :version)

(assert (= (and mapNonEmpty!56539 ((_ is ValueCellFull!17390) mapValue!56539)) b!1330171))

(assert (= (and b!1330167 ((_ is ValueCellFull!17390) mapDefault!56539)) b!1330170))

(assert (= start!112272 b!1330167))

(declare-fun b_lambda!23917 () Bool)

(assert (=> (not b_lambda!23917) (not b!1330166)))

(declare-fun t!44924 () Bool)

(declare-fun tb!11875 () Bool)

(assert (=> (and start!112272 (= defaultEntry!1323 defaultEntry!1323) t!44924) tb!11875))

(declare-fun result!24829 () Bool)

(assert (=> tb!11875 (= result!24829 tp_is_empty!36577)))

(assert (=> b!1330166 t!44924))

(declare-fun b_and!49373 () Bool)

(assert (= b_and!49371 (and (=> t!44924 result!24829) b_and!49373)))

(declare-fun m!1218393 () Bool)

(assert (=> b!1330172 m!1218393))

(declare-fun m!1218395 () Bool)

(assert (=> mapNonEmpty!56539 m!1218395))

(declare-fun m!1218397 () Bool)

(assert (=> b!1330176 m!1218397))

(assert (=> b!1330176 m!1218397))

(declare-fun m!1218399 () Bool)

(assert (=> b!1330176 m!1218399))

(declare-fun m!1218401 () Bool)

(assert (=> start!112272 m!1218401))

(declare-fun m!1218403 () Bool)

(assert (=> start!112272 m!1218403))

(declare-fun m!1218405 () Bool)

(assert (=> start!112272 m!1218405))

(declare-fun m!1218407 () Bool)

(assert (=> b!1330166 m!1218407))

(declare-fun m!1218409 () Bool)

(assert (=> b!1330166 m!1218409))

(declare-fun m!1218411 () Bool)

(assert (=> b!1330166 m!1218411))

(declare-fun m!1218413 () Bool)

(assert (=> b!1330166 m!1218413))

(declare-fun m!1218415 () Bool)

(assert (=> b!1330166 m!1218415))

(assert (=> b!1330166 m!1218409))

(declare-fun m!1218417 () Bool)

(assert (=> b!1330166 m!1218417))

(declare-fun m!1218419 () Bool)

(assert (=> b!1330166 m!1218419))

(assert (=> b!1330166 m!1218411))

(assert (=> b!1330166 m!1218415))

(assert (=> b!1330166 m!1218393))

(declare-fun m!1218421 () Bool)

(assert (=> b!1330169 m!1218421))

(assert (=> b!1330165 m!1218393))

(assert (=> b!1330165 m!1218393))

(declare-fun m!1218423 () Bool)

(assert (=> b!1330165 m!1218423))

(declare-fun m!1218425 () Bool)

(assert (=> b!1330168 m!1218425))

(check-sat (not b!1330169) b_and!49373 (not b!1330168) (not b!1330166) (not mapNonEmpty!56539) (not b!1330176) (not b_next!30667) tp_is_empty!36577 (not b_lambda!23917) (not start!112272) (not b!1330165))
(check-sat b_and!49373 (not b_next!30667))
