; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112908 () Bool)

(assert start!112908)

(declare-fun b_free!31021 () Bool)

(declare-fun b_next!31021 () Bool)

(assert (=> start!112908 (= b_free!31021 (not b_next!31021))))

(declare-fun tp!108703 () Bool)

(declare-fun b_and!49981 () Bool)

(assert (=> start!112908 (= tp!108703 b_and!49981)))

(declare-fun b!1338008 () Bool)

(declare-fun res!887621 () Bool)

(declare-fun e!762025 () Bool)

(assert (=> b!1338008 (=> (not res!887621) (not e!762025))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90835 0))(
  ( (array!90836 (arr!43878 (Array (_ BitVec 32) (_ BitVec 64))) (size!44429 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90835)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1338008 (= res!887621 (not (= (select (arr!43878 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1338009 () Bool)

(declare-fun e!762028 () Bool)

(declare-fun e!762026 () Bool)

(declare-fun mapRes!57074 () Bool)

(assert (=> b!1338009 (= e!762028 (and e!762026 mapRes!57074))))

(declare-fun condMapEmpty!57074 () Bool)

(declare-datatypes ((V!54345 0))(
  ( (V!54346 (val!18540 Int)) )
))
(declare-datatypes ((ValueCell!17567 0))(
  ( (ValueCellFull!17567 (v!21175 V!54345)) (EmptyCell!17567) )
))
(declare-datatypes ((array!90837 0))(
  ( (array!90838 (arr!43879 (Array (_ BitVec 32) ValueCell!17567)) (size!44430 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90837)

(declare-fun mapDefault!57074 () ValueCell!17567)

(assert (=> b!1338009 (= condMapEmpty!57074 (= (arr!43879 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17567)) mapDefault!57074)))))

(declare-fun b!1338010 () Bool)

(declare-fun res!887619 () Bool)

(assert (=> b!1338010 (=> (not res!887619) (not e!762025))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54345)

(declare-fun zeroValue!1262 () V!54345)

(declare-datatypes ((tuple2!23956 0))(
  ( (tuple2!23957 (_1!11989 (_ BitVec 64)) (_2!11989 V!54345)) )
))
(declare-datatypes ((List!31098 0))(
  ( (Nil!31095) (Cons!31094 (h!32312 tuple2!23956) (t!45392 List!31098)) )
))
(declare-datatypes ((ListLongMap!21621 0))(
  ( (ListLongMap!21622 (toList!10826 List!31098)) )
))
(declare-fun contains!9003 (ListLongMap!21621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5781 (array!90835 array!90837 (_ BitVec 32) (_ BitVec 32) V!54345 V!54345 (_ BitVec 32) Int) ListLongMap!21621)

(assert (=> b!1338010 (= res!887619 (contains!9003 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1338011 () Bool)

(declare-fun res!887618 () Bool)

(assert (=> b!1338011 (=> (not res!887618) (not e!762025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338011 (= res!887618 (validKeyInArray!0 (select (arr!43878 _keys!1590) from!1980)))))

(declare-fun res!887615 () Bool)

(assert (=> start!112908 (=> (not res!887615) (not e!762025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112908 (= res!887615 (validMask!0 mask!1998))))

(assert (=> start!112908 e!762025))

(declare-fun array_inv!33357 (array!90837) Bool)

(assert (=> start!112908 (and (array_inv!33357 _values!1320) e!762028)))

(assert (=> start!112908 true))

(declare-fun array_inv!33358 (array!90835) Bool)

(assert (=> start!112908 (array_inv!33358 _keys!1590)))

(assert (=> start!112908 tp!108703))

(declare-fun tp_is_empty!36931 () Bool)

(assert (=> start!112908 tp_is_empty!36931))

(declare-fun b!1338012 () Bool)

(declare-fun res!887617 () Bool)

(assert (=> b!1338012 (=> (not res!887617) (not e!762025))))

(declare-datatypes ((List!31099 0))(
  ( (Nil!31096) (Cons!31095 (h!32313 (_ BitVec 64)) (t!45393 List!31099)) )
))
(declare-fun arrayNoDuplicates!0 (array!90835 (_ BitVec 32) List!31099) Bool)

(assert (=> b!1338012 (= res!887617 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31096))))

(declare-fun b!1338013 () Bool)

(assert (=> b!1338013 (= e!762025 (not true))))

(declare-fun lt!593299 () ListLongMap!21621)

(assert (=> b!1338013 (contains!9003 lt!593299 k0!1153)))

(declare-fun lt!593298 () V!54345)

(declare-datatypes ((Unit!43861 0))(
  ( (Unit!43862) )
))
(declare-fun lt!593301 () Unit!43861)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!311 ((_ BitVec 64) (_ BitVec 64) V!54345 ListLongMap!21621) Unit!43861)

(assert (=> b!1338013 (= lt!593301 (lemmaInListMapAfterAddingDiffThenInBefore!311 k0!1153 (select (arr!43878 _keys!1590) from!1980) lt!593298 lt!593299))))

(declare-fun lt!593300 () ListLongMap!21621)

(assert (=> b!1338013 (contains!9003 lt!593300 k0!1153)))

(declare-fun lt!593302 () Unit!43861)

(assert (=> b!1338013 (= lt!593302 (lemmaInListMapAfterAddingDiffThenInBefore!311 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593300))))

(declare-fun +!4776 (ListLongMap!21621 tuple2!23956) ListLongMap!21621)

(assert (=> b!1338013 (= lt!593300 (+!4776 lt!593299 (tuple2!23957 (select (arr!43878 _keys!1590) from!1980) lt!593298)))))

(declare-fun get!22152 (ValueCell!17567 V!54345) V!54345)

(declare-fun dynLambda!3730 (Int (_ BitVec 64)) V!54345)

(assert (=> b!1338013 (= lt!593298 (get!22152 (select (arr!43879 _values!1320) from!1980) (dynLambda!3730 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6425 (array!90835 array!90837 (_ BitVec 32) (_ BitVec 32) V!54345 V!54345 (_ BitVec 32) Int) ListLongMap!21621)

(assert (=> b!1338013 (= lt!593299 (getCurrentListMapNoExtraKeys!6425 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338014 () Bool)

(declare-fun res!887620 () Bool)

(assert (=> b!1338014 (=> (not res!887620) (not e!762025))))

(assert (=> b!1338014 (= res!887620 (and (= (size!44430 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44429 _keys!1590) (size!44430 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1338015 () Bool)

(declare-fun res!887622 () Bool)

(assert (=> b!1338015 (=> (not res!887622) (not e!762025))))

(assert (=> b!1338015 (= res!887622 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338016 () Bool)

(assert (=> b!1338016 (= e!762026 tp_is_empty!36931)))

(declare-fun mapIsEmpty!57074 () Bool)

(assert (=> mapIsEmpty!57074 mapRes!57074))

(declare-fun b!1338017 () Bool)

(declare-fun res!887623 () Bool)

(assert (=> b!1338017 (=> (not res!887623) (not e!762025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90835 (_ BitVec 32)) Bool)

(assert (=> b!1338017 (= res!887623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!57074 () Bool)

(declare-fun tp!108704 () Bool)

(declare-fun e!762024 () Bool)

(assert (=> mapNonEmpty!57074 (= mapRes!57074 (and tp!108704 e!762024))))

(declare-fun mapRest!57074 () (Array (_ BitVec 32) ValueCell!17567))

(declare-fun mapKey!57074 () (_ BitVec 32))

(declare-fun mapValue!57074 () ValueCell!17567)

(assert (=> mapNonEmpty!57074 (= (arr!43879 _values!1320) (store mapRest!57074 mapKey!57074 mapValue!57074))))

(declare-fun b!1338018 () Bool)

(declare-fun res!887616 () Bool)

(assert (=> b!1338018 (=> (not res!887616) (not e!762025))))

(assert (=> b!1338018 (= res!887616 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44429 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338019 () Bool)

(assert (=> b!1338019 (= e!762024 tp_is_empty!36931)))

(assert (= (and start!112908 res!887615) b!1338014))

(assert (= (and b!1338014 res!887620) b!1338017))

(assert (= (and b!1338017 res!887623) b!1338012))

(assert (= (and b!1338012 res!887617) b!1338018))

(assert (= (and b!1338018 res!887616) b!1338010))

(assert (= (and b!1338010 res!887619) b!1338008))

(assert (= (and b!1338008 res!887621) b!1338011))

(assert (= (and b!1338011 res!887618) b!1338015))

(assert (= (and b!1338015 res!887622) b!1338013))

(assert (= (and b!1338009 condMapEmpty!57074) mapIsEmpty!57074))

(assert (= (and b!1338009 (not condMapEmpty!57074)) mapNonEmpty!57074))

(get-info :version)

(assert (= (and mapNonEmpty!57074 ((_ is ValueCellFull!17567) mapValue!57074)) b!1338019))

(assert (= (and b!1338009 ((_ is ValueCellFull!17567) mapDefault!57074)) b!1338016))

(assert (= start!112908 b!1338009))

(declare-fun b_lambda!24173 () Bool)

(assert (=> (not b_lambda!24173) (not b!1338013)))

(declare-fun t!45391 () Bool)

(declare-fun tb!12097 () Bool)

(assert (=> (and start!112908 (= defaultEntry!1323 defaultEntry!1323) t!45391) tb!12097))

(declare-fun result!25275 () Bool)

(assert (=> tb!12097 (= result!25275 tp_is_empty!36931)))

(assert (=> b!1338013 t!45391))

(declare-fun b_and!49983 () Bool)

(assert (= b_and!49981 (and (=> t!45391 result!25275) b_and!49983)))

(declare-fun m!1226367 () Bool)

(assert (=> start!112908 m!1226367))

(declare-fun m!1226369 () Bool)

(assert (=> start!112908 m!1226369))

(declare-fun m!1226371 () Bool)

(assert (=> start!112908 m!1226371))

(declare-fun m!1226373 () Bool)

(assert (=> b!1338010 m!1226373))

(assert (=> b!1338010 m!1226373))

(declare-fun m!1226375 () Bool)

(assert (=> b!1338010 m!1226375))

(declare-fun m!1226377 () Bool)

(assert (=> b!1338011 m!1226377))

(assert (=> b!1338011 m!1226377))

(declare-fun m!1226379 () Bool)

(assert (=> b!1338011 m!1226379))

(declare-fun m!1226381 () Bool)

(assert (=> mapNonEmpty!57074 m!1226381))

(assert (=> b!1338013 m!1226377))

(declare-fun m!1226383 () Bool)

(assert (=> b!1338013 m!1226383))

(declare-fun m!1226385 () Bool)

(assert (=> b!1338013 m!1226385))

(declare-fun m!1226387 () Bool)

(assert (=> b!1338013 m!1226387))

(assert (=> b!1338013 m!1226385))

(declare-fun m!1226389 () Bool)

(assert (=> b!1338013 m!1226389))

(declare-fun m!1226391 () Bool)

(assert (=> b!1338013 m!1226391))

(declare-fun m!1226393 () Bool)

(assert (=> b!1338013 m!1226393))

(declare-fun m!1226395 () Bool)

(assert (=> b!1338013 m!1226395))

(declare-fun m!1226397 () Bool)

(assert (=> b!1338013 m!1226397))

(assert (=> b!1338013 m!1226387))

(declare-fun m!1226399 () Bool)

(assert (=> b!1338013 m!1226399))

(assert (=> b!1338013 m!1226377))

(declare-fun m!1226401 () Bool)

(assert (=> b!1338017 m!1226401))

(assert (=> b!1338008 m!1226377))

(declare-fun m!1226403 () Bool)

(assert (=> b!1338012 m!1226403))

(check-sat tp_is_empty!36931 (not mapNonEmpty!57074) (not b!1338010) (not b!1338011) (not b!1338012) b_and!49983 (not b!1338013) (not b_next!31021) (not start!112908) (not b_lambda!24173) (not b!1338017))
(check-sat b_and!49983 (not b_next!31021))
