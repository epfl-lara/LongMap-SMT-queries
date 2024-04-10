; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112388 () Bool)

(assert start!112388)

(declare-fun b_free!30783 () Bool)

(declare-fun b_next!30783 () Bool)

(assert (=> start!112388 (= b_free!30783 (not b_next!30783))))

(declare-fun tp!107986 () Bool)

(declare-fun b_and!49621 () Bool)

(assert (=> start!112388 (= tp!107986 b_and!49621)))

(declare-fun b!1332439 () Bool)

(declare-fun res!884235 () Bool)

(declare-fun e!759075 () Bool)

(assert (=> b!1332439 (=> (not res!884235) (not e!759075))))

(declare-datatypes ((array!90266 0))(
  ( (array!90267 (arr!43599 (Array (_ BitVec 32) (_ BitVec 64))) (size!44149 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90266)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90266 (_ BitVec 32)) Bool)

(assert (=> b!1332439 (= res!884235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332440 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1332440 (= e!759075 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54027 0))(
  ( (V!54028 (val!18421 Int)) )
))
(declare-datatypes ((tuple2!23740 0))(
  ( (tuple2!23741 (_1!11881 (_ BitVec 64)) (_2!11881 V!54027)) )
))
(declare-datatypes ((List!30883 0))(
  ( (Nil!30880) (Cons!30879 (h!32088 tuple2!23740) (t!45079 List!30883)) )
))
(declare-datatypes ((ListLongMap!21397 0))(
  ( (ListLongMap!21398 (toList!10714 List!30883)) )
))
(declare-fun lt!592011 () ListLongMap!21397)

(declare-fun minValue!1262 () V!54027)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8878 (ListLongMap!21397 (_ BitVec 64)) Bool)

(declare-fun +!4707 (ListLongMap!21397 tuple2!23740) ListLongMap!21397)

(assert (=> b!1332440 (contains!8878 (+!4707 lt!592011 (tuple2!23741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43863 0))(
  ( (Unit!43864) )
))
(declare-fun lt!592007 () Unit!43863)

(declare-fun addStillContains!1186 (ListLongMap!21397 (_ BitVec 64) V!54027 (_ BitVec 64)) Unit!43863)

(assert (=> b!1332440 (= lt!592007 (addStillContains!1186 lt!592011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332440 (contains!8878 lt!592011 k0!1153)))

(declare-fun lt!592012 () V!54027)

(declare-fun lt!592008 () Unit!43863)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!294 ((_ BitVec 64) (_ BitVec 64) V!54027 ListLongMap!21397) Unit!43863)

(assert (=> b!1332440 (= lt!592008 (lemmaInListMapAfterAddingDiffThenInBefore!294 k0!1153 (select (arr!43599 _keys!1590) from!1980) lt!592012 lt!592011))))

(declare-fun lt!592010 () ListLongMap!21397)

(assert (=> b!1332440 (contains!8878 lt!592010 k0!1153)))

(declare-fun lt!592009 () Unit!43863)

(assert (=> b!1332440 (= lt!592009 (lemmaInListMapAfterAddingDiffThenInBefore!294 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592010))))

(assert (=> b!1332440 (= lt!592010 (+!4707 lt!592011 (tuple2!23741 (select (arr!43599 _keys!1590) from!1980) lt!592012)))))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((ValueCell!17448 0))(
  ( (ValueCellFull!17448 (v!21058 V!54027)) (EmptyCell!17448) )
))
(declare-datatypes ((array!90268 0))(
  ( (array!90269 (arr!43600 (Array (_ BitVec 32) ValueCell!17448)) (size!44150 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90268)

(declare-fun get!21997 (ValueCell!17448 V!54027) V!54027)

(declare-fun dynLambda!3646 (Int (_ BitVec 64)) V!54027)

(assert (=> b!1332440 (= lt!592012 (get!21997 (select (arr!43600 _values!1320) from!1980) (dynLambda!3646 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54027)

(declare-fun getCurrentListMapNoExtraKeys!6345 (array!90266 array!90268 (_ BitVec 32) (_ BitVec 32) V!54027 V!54027 (_ BitVec 32) Int) ListLongMap!21397)

(assert (=> b!1332440 (= lt!592011 (getCurrentListMapNoExtraKeys!6345 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!884228 () Bool)

(assert (=> start!112388 (=> (not res!884228) (not e!759075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112388 (= res!884228 (validMask!0 mask!1998))))

(assert (=> start!112388 e!759075))

(declare-fun e!759076 () Bool)

(declare-fun array_inv!32885 (array!90268) Bool)

(assert (=> start!112388 (and (array_inv!32885 _values!1320) e!759076)))

(assert (=> start!112388 true))

(declare-fun array_inv!32886 (array!90266) Bool)

(assert (=> start!112388 (array_inv!32886 _keys!1590)))

(assert (=> start!112388 tp!107986))

(declare-fun tp_is_empty!36693 () Bool)

(assert (=> start!112388 tp_is_empty!36693))

(declare-fun b!1332441 () Bool)

(declare-fun res!884233 () Bool)

(assert (=> b!1332441 (=> (not res!884233) (not e!759075))))

(assert (=> b!1332441 (= res!884233 (and (= (size!44150 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44149 _keys!1590) (size!44150 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332442 () Bool)

(declare-fun res!884234 () Bool)

(assert (=> b!1332442 (=> (not res!884234) (not e!759075))))

(assert (=> b!1332442 (= res!884234 (not (= (select (arr!43599 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332443 () Bool)

(declare-fun res!884227 () Bool)

(assert (=> b!1332443 (=> (not res!884227) (not e!759075))))

(declare-datatypes ((List!30884 0))(
  ( (Nil!30881) (Cons!30880 (h!32089 (_ BitVec 64)) (t!45080 List!30884)) )
))
(declare-fun arrayNoDuplicates!0 (array!90266 (_ BitVec 32) List!30884) Bool)

(assert (=> b!1332443 (= res!884227 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30881))))

(declare-fun b!1332444 () Bool)

(declare-fun res!884230 () Bool)

(assert (=> b!1332444 (=> (not res!884230) (not e!759075))))

(assert (=> b!1332444 (= res!884230 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332445 () Bool)

(declare-fun e!759072 () Bool)

(assert (=> b!1332445 (= e!759072 tp_is_empty!36693)))

(declare-fun b!1332446 () Bool)

(declare-fun res!884229 () Bool)

(assert (=> b!1332446 (=> (not res!884229) (not e!759075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332446 (= res!884229 (validKeyInArray!0 (select (arr!43599 _keys!1590) from!1980)))))

(declare-fun b!1332447 () Bool)

(declare-fun res!884232 () Bool)

(assert (=> b!1332447 (=> (not res!884232) (not e!759075))))

(declare-fun getCurrentListMap!5695 (array!90266 array!90268 (_ BitVec 32) (_ BitVec 32) V!54027 V!54027 (_ BitVec 32) Int) ListLongMap!21397)

(assert (=> b!1332447 (= res!884232 (contains!8878 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332448 () Bool)

(declare-fun e!759074 () Bool)

(assert (=> b!1332448 (= e!759074 tp_is_empty!36693)))

(declare-fun mapNonEmpty!56713 () Bool)

(declare-fun mapRes!56713 () Bool)

(declare-fun tp!107985 () Bool)

(assert (=> mapNonEmpty!56713 (= mapRes!56713 (and tp!107985 e!759074))))

(declare-fun mapValue!56713 () ValueCell!17448)

(declare-fun mapKey!56713 () (_ BitVec 32))

(declare-fun mapRest!56713 () (Array (_ BitVec 32) ValueCell!17448))

(assert (=> mapNonEmpty!56713 (= (arr!43600 _values!1320) (store mapRest!56713 mapKey!56713 mapValue!56713))))

(declare-fun b!1332449 () Bool)

(declare-fun res!884231 () Bool)

(assert (=> b!1332449 (=> (not res!884231) (not e!759075))))

(assert (=> b!1332449 (= res!884231 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44149 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332450 () Bool)

(assert (=> b!1332450 (= e!759076 (and e!759072 mapRes!56713))))

(declare-fun condMapEmpty!56713 () Bool)

(declare-fun mapDefault!56713 () ValueCell!17448)

(assert (=> b!1332450 (= condMapEmpty!56713 (= (arr!43600 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17448)) mapDefault!56713)))))

(declare-fun mapIsEmpty!56713 () Bool)

(assert (=> mapIsEmpty!56713 mapRes!56713))

(assert (= (and start!112388 res!884228) b!1332441))

(assert (= (and b!1332441 res!884233) b!1332439))

(assert (= (and b!1332439 res!884235) b!1332443))

(assert (= (and b!1332443 res!884227) b!1332449))

(assert (= (and b!1332449 res!884231) b!1332447))

(assert (= (and b!1332447 res!884232) b!1332442))

(assert (= (and b!1332442 res!884234) b!1332446))

(assert (= (and b!1332446 res!884229) b!1332444))

(assert (= (and b!1332444 res!884230) b!1332440))

(assert (= (and b!1332450 condMapEmpty!56713) mapIsEmpty!56713))

(assert (= (and b!1332450 (not condMapEmpty!56713)) mapNonEmpty!56713))

(get-info :version)

(assert (= (and mapNonEmpty!56713 ((_ is ValueCellFull!17448) mapValue!56713)) b!1332448))

(assert (= (and b!1332450 ((_ is ValueCellFull!17448) mapDefault!56713)) b!1332445))

(assert (= start!112388 b!1332450))

(declare-fun b_lambda!24043 () Bool)

(assert (=> (not b_lambda!24043) (not b!1332440)))

(declare-fun t!45078 () Bool)

(declare-fun tb!11999 () Bool)

(assert (=> (and start!112388 (= defaultEntry!1323 defaultEntry!1323) t!45078) tb!11999))

(declare-fun result!25069 () Bool)

(assert (=> tb!11999 (= result!25069 tp_is_empty!36693)))

(assert (=> b!1332440 t!45078))

(declare-fun b_and!49623 () Bool)

(assert (= b_and!49621 (and (=> t!45078 result!25069) b_and!49623)))

(declare-fun m!1221251 () Bool)

(assert (=> b!1332440 m!1221251))

(declare-fun m!1221253 () Bool)

(assert (=> b!1332440 m!1221253))

(declare-fun m!1221255 () Bool)

(assert (=> b!1332440 m!1221255))

(assert (=> b!1332440 m!1221253))

(declare-fun m!1221257 () Bool)

(assert (=> b!1332440 m!1221257))

(declare-fun m!1221259 () Bool)

(assert (=> b!1332440 m!1221259))

(declare-fun m!1221261 () Bool)

(assert (=> b!1332440 m!1221261))

(declare-fun m!1221263 () Bool)

(assert (=> b!1332440 m!1221263))

(declare-fun m!1221265 () Bool)

(assert (=> b!1332440 m!1221265))

(assert (=> b!1332440 m!1221265))

(declare-fun m!1221267 () Bool)

(assert (=> b!1332440 m!1221267))

(declare-fun m!1221269 () Bool)

(assert (=> b!1332440 m!1221269))

(assert (=> b!1332440 m!1221263))

(declare-fun m!1221271 () Bool)

(assert (=> b!1332440 m!1221271))

(declare-fun m!1221273 () Bool)

(assert (=> b!1332440 m!1221273))

(assert (=> b!1332440 m!1221255))

(declare-fun m!1221275 () Bool)

(assert (=> b!1332440 m!1221275))

(assert (=> b!1332446 m!1221265))

(assert (=> b!1332446 m!1221265))

(declare-fun m!1221277 () Bool)

(assert (=> b!1332446 m!1221277))

(declare-fun m!1221279 () Bool)

(assert (=> b!1332447 m!1221279))

(assert (=> b!1332447 m!1221279))

(declare-fun m!1221281 () Bool)

(assert (=> b!1332447 m!1221281))

(declare-fun m!1221283 () Bool)

(assert (=> b!1332443 m!1221283))

(declare-fun m!1221285 () Bool)

(assert (=> start!112388 m!1221285))

(declare-fun m!1221287 () Bool)

(assert (=> start!112388 m!1221287))

(declare-fun m!1221289 () Bool)

(assert (=> start!112388 m!1221289))

(declare-fun m!1221291 () Bool)

(assert (=> mapNonEmpty!56713 m!1221291))

(assert (=> b!1332442 m!1221265))

(declare-fun m!1221293 () Bool)

(assert (=> b!1332439 m!1221293))

(check-sat (not mapNonEmpty!56713) (not b!1332439) (not b!1332446) b_and!49623 (not b_lambda!24043) (not start!112388) (not b!1332443) (not b_next!30783) (not b!1332440) (not b!1332447) tp_is_empty!36693)
(check-sat b_and!49623 (not b_next!30783))
