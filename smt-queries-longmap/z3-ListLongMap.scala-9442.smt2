; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112484 () Bool)

(assert start!112484)

(declare-fun b_free!30655 () Bool)

(declare-fun b_next!30655 () Bool)

(assert (=> start!112484 (= b_free!30655 (not b_next!30655))))

(declare-fun tp!107602 () Bool)

(declare-fun b_and!49367 () Bool)

(assert (=> start!112484 (= tp!107602 b_and!49367)))

(declare-fun b!1331306 () Bool)

(declare-fun res!883018 () Bool)

(declare-fun e!758959 () Bool)

(assert (=> b!1331306 (=> (not res!883018) (not e!758959))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90129 0))(
  ( (array!90130 (arr!43526 (Array (_ BitVec 32) (_ BitVec 64))) (size!44077 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90129)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331306 (= res!883018 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44077 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331307 () Bool)

(declare-fun res!883025 () Bool)

(assert (=> b!1331307 (=> (not res!883025) (not e!758959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331307 (= res!883025 (validKeyInArray!0 (select (arr!43526 _keys!1590) from!1980)))))

(declare-fun b!1331308 () Bool)

(assert (=> b!1331308 (= e!758959 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!53857 0))(
  ( (V!53858 (val!18357 Int)) )
))
(declare-datatypes ((tuple2!23674 0))(
  ( (tuple2!23675 (_1!11848 (_ BitVec 64)) (_2!11848 V!53857)) )
))
(declare-datatypes ((List!30843 0))(
  ( (Nil!30840) (Cons!30839 (h!32057 tuple2!23674) (t!44903 List!30843)) )
))
(declare-datatypes ((ListLongMap!21339 0))(
  ( (ListLongMap!21340 (toList!10685 List!30843)) )
))
(declare-fun lt!591522 () ListLongMap!21339)

(declare-fun contains!8861 (ListLongMap!21339 (_ BitVec 64)) Bool)

(assert (=> b!1331308 (contains!8861 lt!591522 k0!1153)))

(declare-datatypes ((Unit!43718 0))(
  ( (Unit!43719) )
))
(declare-fun lt!591521 () Unit!43718)

(declare-fun minValue!1262 () V!53857)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!247 ((_ BitVec 64) (_ BitVec 64) V!53857 ListLongMap!21339) Unit!43718)

(assert (=> b!1331308 (= lt!591521 (lemmaInListMapAfterAddingDiffThenInBefore!247 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591522))))

(declare-datatypes ((ValueCell!17384 0))(
  ( (ValueCellFull!17384 (v!20989 V!53857)) (EmptyCell!17384) )
))
(declare-datatypes ((array!90131 0))(
  ( (array!90132 (arr!43527 (Array (_ BitVec 32) ValueCell!17384)) (size!44078 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90131)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53857)

(declare-fun +!4704 (ListLongMap!21339 tuple2!23674) ListLongMap!21339)

(declare-fun getCurrentListMapNoExtraKeys!6348 (array!90129 array!90131 (_ BitVec 32) (_ BitVec 32) V!53857 V!53857 (_ BitVec 32) Int) ListLongMap!21339)

(declare-fun get!21955 (ValueCell!17384 V!53857) V!53857)

(declare-fun dynLambda!3658 (Int (_ BitVec 64)) V!53857)

(assert (=> b!1331308 (= lt!591522 (+!4704 (getCurrentListMapNoExtraKeys!6348 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23675 (select (arr!43526 _keys!1590) from!1980) (get!21955 (select (arr!43527 _values!1320) from!1980) (dynLambda!3658 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1331309 () Bool)

(declare-fun e!758956 () Bool)

(declare-fun e!758955 () Bool)

(declare-fun mapRes!56521 () Bool)

(assert (=> b!1331309 (= e!758956 (and e!758955 mapRes!56521))))

(declare-fun condMapEmpty!56521 () Bool)

(declare-fun mapDefault!56521 () ValueCell!17384)

(assert (=> b!1331309 (= condMapEmpty!56521 (= (arr!43527 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17384)) mapDefault!56521)))))

(declare-fun res!883024 () Bool)

(assert (=> start!112484 (=> (not res!883024) (not e!758959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112484 (= res!883024 (validMask!0 mask!1998))))

(assert (=> start!112484 e!758959))

(declare-fun array_inv!33121 (array!90131) Bool)

(assert (=> start!112484 (and (array_inv!33121 _values!1320) e!758956)))

(assert (=> start!112484 true))

(declare-fun array_inv!33122 (array!90129) Bool)

(assert (=> start!112484 (array_inv!33122 _keys!1590)))

(assert (=> start!112484 tp!107602))

(declare-fun tp_is_empty!36565 () Bool)

(assert (=> start!112484 tp_is_empty!36565))

(declare-fun b!1331310 () Bool)

(declare-fun e!758957 () Bool)

(assert (=> b!1331310 (= e!758957 tp_is_empty!36565)))

(declare-fun b!1331311 () Bool)

(declare-fun res!883019 () Bool)

(assert (=> b!1331311 (=> (not res!883019) (not e!758959))))

(assert (=> b!1331311 (= res!883019 (and (= (size!44078 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44077 _keys!1590) (size!44078 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331312 () Bool)

(declare-fun res!883021 () Bool)

(assert (=> b!1331312 (=> (not res!883021) (not e!758959))))

(assert (=> b!1331312 (= res!883021 (not (= (select (arr!43526 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331313 () Bool)

(declare-fun res!883023 () Bool)

(assert (=> b!1331313 (=> (not res!883023) (not e!758959))))

(assert (=> b!1331313 (= res!883023 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56521 () Bool)

(assert (=> mapIsEmpty!56521 mapRes!56521))

(declare-fun mapNonEmpty!56521 () Bool)

(declare-fun tp!107601 () Bool)

(assert (=> mapNonEmpty!56521 (= mapRes!56521 (and tp!107601 e!758957))))

(declare-fun mapValue!56521 () ValueCell!17384)

(declare-fun mapRest!56521 () (Array (_ BitVec 32) ValueCell!17384))

(declare-fun mapKey!56521 () (_ BitVec 32))

(assert (=> mapNonEmpty!56521 (= (arr!43527 _values!1320) (store mapRest!56521 mapKey!56521 mapValue!56521))))

(declare-fun b!1331314 () Bool)

(declare-fun res!883017 () Bool)

(assert (=> b!1331314 (=> (not res!883017) (not e!758959))))

(declare-datatypes ((List!30844 0))(
  ( (Nil!30841) (Cons!30840 (h!32058 (_ BitVec 64)) (t!44904 List!30844)) )
))
(declare-fun arrayNoDuplicates!0 (array!90129 (_ BitVec 32) List!30844) Bool)

(assert (=> b!1331314 (= res!883017 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30841))))

(declare-fun b!1331315 () Bool)

(assert (=> b!1331315 (= e!758955 tp_is_empty!36565)))

(declare-fun b!1331316 () Bool)

(declare-fun res!883020 () Bool)

(assert (=> b!1331316 (=> (not res!883020) (not e!758959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90129 (_ BitVec 32)) Bool)

(assert (=> b!1331316 (= res!883020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331317 () Bool)

(declare-fun res!883022 () Bool)

(assert (=> b!1331317 (=> (not res!883022) (not e!758959))))

(declare-fun getCurrentListMap!5656 (array!90129 array!90131 (_ BitVec 32) (_ BitVec 32) V!53857 V!53857 (_ BitVec 32) Int) ListLongMap!21339)

(assert (=> b!1331317 (= res!883022 (contains!8861 (getCurrentListMap!5656 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112484 res!883024) b!1331311))

(assert (= (and b!1331311 res!883019) b!1331316))

(assert (= (and b!1331316 res!883020) b!1331314))

(assert (= (and b!1331314 res!883017) b!1331306))

(assert (= (and b!1331306 res!883018) b!1331317))

(assert (= (and b!1331317 res!883022) b!1331312))

(assert (= (and b!1331312 res!883021) b!1331307))

(assert (= (and b!1331307 res!883025) b!1331313))

(assert (= (and b!1331313 res!883023) b!1331308))

(assert (= (and b!1331309 condMapEmpty!56521) mapIsEmpty!56521))

(assert (= (and b!1331309 (not condMapEmpty!56521)) mapNonEmpty!56521))

(get-info :version)

(assert (= (and mapNonEmpty!56521 ((_ is ValueCellFull!17384) mapValue!56521)) b!1331310))

(assert (= (and b!1331309 ((_ is ValueCellFull!17384) mapDefault!56521)) b!1331315))

(assert (= start!112484 b!1331309))

(declare-fun b_lambda!23909 () Bool)

(assert (=> (not b_lambda!23909) (not b!1331308)))

(declare-fun t!44902 () Bool)

(declare-fun tb!11863 () Bool)

(assert (=> (and start!112484 (= defaultEntry!1323 defaultEntry!1323) t!44902) tb!11863))

(declare-fun result!24805 () Bool)

(assert (=> tb!11863 (= result!24805 tp_is_empty!36565)))

(assert (=> b!1331308 t!44902))

(declare-fun b_and!49369 () Bool)

(assert (= b_and!49367 (and (=> t!44902 result!24805) b_and!49369)))

(declare-fun m!1220303 () Bool)

(assert (=> mapNonEmpty!56521 m!1220303))

(declare-fun m!1220305 () Bool)

(assert (=> b!1331316 m!1220305))

(declare-fun m!1220307 () Bool)

(assert (=> b!1331314 m!1220307))

(declare-fun m!1220309 () Bool)

(assert (=> b!1331308 m!1220309))

(declare-fun m!1220311 () Bool)

(assert (=> b!1331308 m!1220311))

(assert (=> b!1331308 m!1220309))

(declare-fun m!1220313 () Bool)

(assert (=> b!1331308 m!1220313))

(declare-fun m!1220315 () Bool)

(assert (=> b!1331308 m!1220315))

(declare-fun m!1220317 () Bool)

(assert (=> b!1331308 m!1220317))

(assert (=> b!1331308 m!1220311))

(declare-fun m!1220319 () Bool)

(assert (=> b!1331308 m!1220319))

(declare-fun m!1220321 () Bool)

(assert (=> b!1331308 m!1220321))

(assert (=> b!1331308 m!1220317))

(declare-fun m!1220323 () Bool)

(assert (=> b!1331308 m!1220323))

(declare-fun m!1220325 () Bool)

(assert (=> b!1331317 m!1220325))

(assert (=> b!1331317 m!1220325))

(declare-fun m!1220327 () Bool)

(assert (=> b!1331317 m!1220327))

(assert (=> b!1331307 m!1220319))

(assert (=> b!1331307 m!1220319))

(declare-fun m!1220329 () Bool)

(assert (=> b!1331307 m!1220329))

(declare-fun m!1220331 () Bool)

(assert (=> start!112484 m!1220331))

(declare-fun m!1220333 () Bool)

(assert (=> start!112484 m!1220333))

(declare-fun m!1220335 () Bool)

(assert (=> start!112484 m!1220335))

(assert (=> b!1331312 m!1220319))

(check-sat (not b!1331307) tp_is_empty!36565 (not start!112484) (not b_next!30655) (not b_lambda!23909) (not b!1331316) (not b!1331317) b_and!49369 (not b!1331308) (not mapNonEmpty!56521) (not b!1331314))
(check-sat b_and!49369 (not b_next!30655))
