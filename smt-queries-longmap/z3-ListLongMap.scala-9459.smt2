; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112586 () Bool)

(assert start!112586)

(declare-fun b_free!30757 () Bool)

(declare-fun b_next!30757 () Bool)

(assert (=> start!112586 (= b_free!30757 (not b_next!30757))))

(declare-fun tp!107907 () Bool)

(declare-fun b_and!49571 () Bool)

(assert (=> start!112586 (= tp!107907 b_and!49571)))

(declare-fun b!1333244 () Bool)

(declare-fun res!884394 () Bool)

(declare-fun e!759723 () Bool)

(assert (=> b!1333244 (=> (not res!884394) (not e!759723))))

(declare-datatypes ((V!53993 0))(
  ( (V!53994 (val!18408 Int)) )
))
(declare-datatypes ((ValueCell!17435 0))(
  ( (ValueCellFull!17435 (v!21040 V!53993)) (EmptyCell!17435) )
))
(declare-datatypes ((array!90319 0))(
  ( (array!90320 (arr!43621 (Array (_ BitVec 32) ValueCell!17435)) (size!44172 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90319)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90321 0))(
  ( (array!90322 (arr!43622 (Array (_ BitVec 32) (_ BitVec 64))) (size!44173 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90321)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53993)

(declare-fun zeroValue!1262 () V!53993)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23750 0))(
  ( (tuple2!23751 (_1!11886 (_ BitVec 64)) (_2!11886 V!53993)) )
))
(declare-datatypes ((List!30911 0))(
  ( (Nil!30908) (Cons!30907 (h!32125 tuple2!23750) (t!45073 List!30911)) )
))
(declare-datatypes ((ListLongMap!21415 0))(
  ( (ListLongMap!21416 (toList!10723 List!30911)) )
))
(declare-fun contains!8899 (ListLongMap!21415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5692 (array!90321 array!90319 (_ BitVec 32) (_ BitVec 32) V!53993 V!53993 (_ BitVec 32) Int) ListLongMap!21415)

(assert (=> b!1333244 (= res!884394 (contains!8899 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333245 () Bool)

(declare-fun res!884398 () Bool)

(assert (=> b!1333245 (=> (not res!884398) (not e!759723))))

(declare-datatypes ((List!30912 0))(
  ( (Nil!30909) (Cons!30908 (h!32126 (_ BitVec 64)) (t!45074 List!30912)) )
))
(declare-fun arrayNoDuplicates!0 (array!90321 (_ BitVec 32) List!30912) Bool)

(assert (=> b!1333245 (= res!884398 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30909))))

(declare-fun mapIsEmpty!56674 () Bool)

(declare-fun mapRes!56674 () Bool)

(assert (=> mapIsEmpty!56674 mapRes!56674))

(declare-fun b!1333246 () Bool)

(declare-fun e!759722 () Bool)

(declare-fun tp_is_empty!36667 () Bool)

(assert (=> b!1333246 (= e!759722 tp_is_empty!36667)))

(declare-fun res!884395 () Bool)

(assert (=> start!112586 (=> (not res!884395) (not e!759723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112586 (= res!884395 (validMask!0 mask!1998))))

(assert (=> start!112586 e!759723))

(declare-fun e!759721 () Bool)

(declare-fun array_inv!33183 (array!90319) Bool)

(assert (=> start!112586 (and (array_inv!33183 _values!1320) e!759721)))

(assert (=> start!112586 true))

(declare-fun array_inv!33184 (array!90321) Bool)

(assert (=> start!112586 (array_inv!33184 _keys!1590)))

(assert (=> start!112586 tp!107907))

(assert (=> start!112586 tp_is_empty!36667))

(declare-fun b!1333247 () Bool)

(declare-fun res!884401 () Bool)

(assert (=> b!1333247 (=> (not res!884401) (not e!759723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90321 (_ BitVec 32)) Bool)

(assert (=> b!1333247 (= res!884401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333248 () Bool)

(declare-fun res!884397 () Bool)

(assert (=> b!1333248 (=> (not res!884397) (not e!759723))))

(assert (=> b!1333248 (= res!884397 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44173 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333249 () Bool)

(declare-fun e!759720 () Bool)

(assert (=> b!1333249 (= e!759721 (and e!759720 mapRes!56674))))

(declare-fun condMapEmpty!56674 () Bool)

(declare-fun mapDefault!56674 () ValueCell!17435)

(assert (=> b!1333249 (= condMapEmpty!56674 (= (arr!43621 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17435)) mapDefault!56674)))))

(declare-fun b!1333250 () Bool)

(declare-fun res!884400 () Bool)

(assert (=> b!1333250 (=> (not res!884400) (not e!759723))))

(assert (=> b!1333250 (= res!884400 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1333251 () Bool)

(declare-fun res!884396 () Bool)

(assert (=> b!1333251 (=> (not res!884396) (not e!759723))))

(assert (=> b!1333251 (= res!884396 (and (= (size!44172 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44173 _keys!1590) (size!44172 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333252 () Bool)

(declare-fun res!884402 () Bool)

(assert (=> b!1333252 (=> (not res!884402) (not e!759723))))

(assert (=> b!1333252 (= res!884402 (not (= (select (arr!43622 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333253 () Bool)

(assert (=> b!1333253 (= e!759720 tp_is_empty!36667)))

(declare-fun b!1333254 () Bool)

(declare-fun res!884399 () Bool)

(assert (=> b!1333254 (=> (not res!884399) (not e!759723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333254 (= res!884399 (validKeyInArray!0 (select (arr!43622 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56674 () Bool)

(declare-fun tp!107908 () Bool)

(assert (=> mapNonEmpty!56674 (= mapRes!56674 (and tp!107908 e!759722))))

(declare-fun mapKey!56674 () (_ BitVec 32))

(declare-fun mapRest!56674 () (Array (_ BitVec 32) ValueCell!17435))

(declare-fun mapValue!56674 () ValueCell!17435)

(assert (=> mapNonEmpty!56674 (= (arr!43621 _values!1320) (store mapRest!56674 mapKey!56674 mapValue!56674))))

(declare-fun b!1333255 () Bool)

(assert (=> b!1333255 (= e!759723 (not true))))

(declare-fun lt!592254 () ListLongMap!21415)

(declare-fun +!4733 (ListLongMap!21415 tuple2!23750) ListLongMap!21415)

(assert (=> b!1333255 (contains!8899 (+!4733 lt!592254 (tuple2!23751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43776 0))(
  ( (Unit!43777) )
))
(declare-fun lt!592250 () Unit!43776)

(declare-fun addStillContains!1179 (ListLongMap!21415 (_ BitVec 64) V!53993 (_ BitVec 64)) Unit!43776)

(assert (=> b!1333255 (= lt!592250 (addStillContains!1179 lt!592254 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333255 (contains!8899 lt!592254 k0!1153)))

(declare-fun lt!592251 () Unit!43776)

(declare-fun lt!592252 () V!53993)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!276 ((_ BitVec 64) (_ BitVec 64) V!53993 ListLongMap!21415) Unit!43776)

(assert (=> b!1333255 (= lt!592251 (lemmaInListMapAfterAddingDiffThenInBefore!276 k0!1153 (select (arr!43622 _keys!1590) from!1980) lt!592252 lt!592254))))

(declare-fun lt!592249 () ListLongMap!21415)

(assert (=> b!1333255 (contains!8899 lt!592249 k0!1153)))

(declare-fun lt!592253 () Unit!43776)

(assert (=> b!1333255 (= lt!592253 (lemmaInListMapAfterAddingDiffThenInBefore!276 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592249))))

(assert (=> b!1333255 (= lt!592249 (+!4733 lt!592254 (tuple2!23751 (select (arr!43622 _keys!1590) from!1980) lt!592252)))))

(declare-fun get!22018 (ValueCell!17435 V!53993) V!53993)

(declare-fun dynLambda!3687 (Int (_ BitVec 64)) V!53993)

(assert (=> b!1333255 (= lt!592252 (get!22018 (select (arr!43621 _values!1320) from!1980) (dynLambda!3687 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6377 (array!90321 array!90319 (_ BitVec 32) (_ BitVec 32) V!53993 V!53993 (_ BitVec 32) Int) ListLongMap!21415)

(assert (=> b!1333255 (= lt!592254 (getCurrentListMapNoExtraKeys!6377 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(assert (= (and start!112586 res!884395) b!1333251))

(assert (= (and b!1333251 res!884396) b!1333247))

(assert (= (and b!1333247 res!884401) b!1333245))

(assert (= (and b!1333245 res!884398) b!1333248))

(assert (= (and b!1333248 res!884397) b!1333244))

(assert (= (and b!1333244 res!884394) b!1333252))

(assert (= (and b!1333252 res!884402) b!1333254))

(assert (= (and b!1333254 res!884399) b!1333250))

(assert (= (and b!1333250 res!884400) b!1333255))

(assert (= (and b!1333249 condMapEmpty!56674) mapIsEmpty!56674))

(assert (= (and b!1333249 (not condMapEmpty!56674)) mapNonEmpty!56674))

(get-info :version)

(assert (= (and mapNonEmpty!56674 ((_ is ValueCellFull!17435) mapValue!56674)) b!1333246))

(assert (= (and b!1333249 ((_ is ValueCellFull!17435) mapDefault!56674)) b!1333253))

(assert (= start!112586 b!1333249))

(declare-fun b_lambda!24011 () Bool)

(assert (=> (not b_lambda!24011) (not b!1333255)))

(declare-fun t!45072 () Bool)

(declare-fun tb!11965 () Bool)

(assert (=> (and start!112586 (= defaultEntry!1323 defaultEntry!1323) t!45072) tb!11965))

(declare-fun result!25009 () Bool)

(assert (=> tb!11965 (= result!25009 tp_is_empty!36667)))

(assert (=> b!1333255 t!45072))

(declare-fun b_and!49573 () Bool)

(assert (= b_and!49571 (and (=> t!45072 result!25009) b_and!49573)))

(declare-fun m!1222277 () Bool)

(assert (=> b!1333245 m!1222277))

(declare-fun m!1222279 () Bool)

(assert (=> mapNonEmpty!56674 m!1222279))

(declare-fun m!1222281 () Bool)

(assert (=> b!1333254 m!1222281))

(assert (=> b!1333254 m!1222281))

(declare-fun m!1222283 () Bool)

(assert (=> b!1333254 m!1222283))

(assert (=> b!1333252 m!1222281))

(declare-fun m!1222285 () Bool)

(assert (=> b!1333244 m!1222285))

(assert (=> b!1333244 m!1222285))

(declare-fun m!1222287 () Bool)

(assert (=> b!1333244 m!1222287))

(assert (=> b!1333255 m!1222281))

(declare-fun m!1222289 () Bool)

(assert (=> b!1333255 m!1222289))

(declare-fun m!1222291 () Bool)

(assert (=> b!1333255 m!1222291))

(declare-fun m!1222293 () Bool)

(assert (=> b!1333255 m!1222293))

(assert (=> b!1333255 m!1222291))

(declare-fun m!1222295 () Bool)

(assert (=> b!1333255 m!1222295))

(declare-fun m!1222297 () Bool)

(assert (=> b!1333255 m!1222297))

(assert (=> b!1333255 m!1222297))

(declare-fun m!1222299 () Bool)

(assert (=> b!1333255 m!1222299))

(declare-fun m!1222301 () Bool)

(assert (=> b!1333255 m!1222301))

(declare-fun m!1222303 () Bool)

(assert (=> b!1333255 m!1222303))

(declare-fun m!1222305 () Bool)

(assert (=> b!1333255 m!1222305))

(assert (=> b!1333255 m!1222293))

(declare-fun m!1222307 () Bool)

(assert (=> b!1333255 m!1222307))

(assert (=> b!1333255 m!1222281))

(declare-fun m!1222309 () Bool)

(assert (=> b!1333255 m!1222309))

(declare-fun m!1222311 () Bool)

(assert (=> b!1333255 m!1222311))

(declare-fun m!1222313 () Bool)

(assert (=> start!112586 m!1222313))

(declare-fun m!1222315 () Bool)

(assert (=> start!112586 m!1222315))

(declare-fun m!1222317 () Bool)

(assert (=> start!112586 m!1222317))

(declare-fun m!1222319 () Bool)

(assert (=> b!1333247 m!1222319))

(check-sat (not b!1333244) b_and!49573 (not b_next!30757) (not b!1333255) (not b!1333245) (not mapNonEmpty!56674) (not b_lambda!24011) (not b!1333247) (not start!112586) (not b!1333254) tp_is_empty!36667)
(check-sat b_and!49573 (not b_next!30757))
