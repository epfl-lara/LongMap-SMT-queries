; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112734 () Bool)

(assert start!112734)

(declare-fun b_free!31045 () Bool)

(declare-fun b_next!31045 () Bool)

(assert (=> start!112734 (= b_free!31045 (not b_next!31045))))

(declare-fun tp!108780 () Bool)

(declare-fun b_and!50005 () Bool)

(assert (=> start!112734 (= tp!108780 b_and!50005)))

(declare-fun b!1337229 () Bool)

(declare-fun res!887429 () Bool)

(declare-fun e!761450 () Bool)

(assert (=> b!1337229 (=> (not res!887429) (not e!761450))))

(declare-datatypes ((array!90711 0))(
  ( (array!90712 (arr!43820 (Array (_ BitVec 32) (_ BitVec 64))) (size!44372 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90711)

(declare-datatypes ((List!31120 0))(
  ( (Nil!31117) (Cons!31116 (h!32325 (_ BitVec 64)) (t!45426 List!31120)) )
))
(declare-fun arrayNoDuplicates!0 (array!90711 (_ BitVec 32) List!31120) Bool)

(assert (=> b!1337229 (= res!887429 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31117))))

(declare-fun b!1337230 () Bool)

(declare-fun e!761453 () Bool)

(declare-fun tp_is_empty!36955 () Bool)

(assert (=> b!1337230 (= e!761453 tp_is_empty!36955)))

(declare-fun b!1337231 () Bool)

(declare-fun res!887432 () Bool)

(assert (=> b!1337231 (=> (not res!887432) (not e!761450))))

(declare-datatypes ((V!54377 0))(
  ( (V!54378 (val!18552 Int)) )
))
(declare-datatypes ((ValueCell!17579 0))(
  ( (ValueCellFull!17579 (v!21192 V!54377)) (EmptyCell!17579) )
))
(declare-datatypes ((array!90713 0))(
  ( (array!90714 (arr!43821 (Array (_ BitVec 32) ValueCell!17579)) (size!44373 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90713)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337231 (= res!887432 (and (= (size!44373 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44372 _keys!1590) (size!44373 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337232 () Bool)

(declare-fun e!761449 () Bool)

(declare-fun mapRes!57113 () Bool)

(assert (=> b!1337232 (= e!761449 (and e!761453 mapRes!57113))))

(declare-fun condMapEmpty!57113 () Bool)

(declare-fun mapDefault!57113 () ValueCell!17579)

(assert (=> b!1337232 (= condMapEmpty!57113 (= (arr!43821 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17579)) mapDefault!57113)))))

(declare-fun b!1337233 () Bool)

(declare-fun res!887430 () Bool)

(assert (=> b!1337233 (=> (not res!887430) (not e!761450))))

(assert (=> b!1337233 (= res!887430 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1337234 () Bool)

(declare-fun res!887427 () Bool)

(assert (=> b!1337234 (=> (not res!887427) (not e!761450))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337234 (= res!887427 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57113 () Bool)

(assert (=> mapIsEmpty!57113 mapRes!57113))

(declare-fun defaultEntry!1323 () Int)

(declare-fun b!1337235 () Bool)

(declare-fun minValue!1262 () V!54377)

(declare-fun zeroValue!1262 () V!54377)

(declare-datatypes ((tuple2!23990 0))(
  ( (tuple2!23991 (_1!12006 (_ BitVec 64)) (_2!12006 V!54377)) )
))
(declare-datatypes ((List!31121 0))(
  ( (Nil!31118) (Cons!31117 (h!32326 tuple2!23990) (t!45427 List!31121)) )
))
(declare-datatypes ((ListLongMap!21647 0))(
  ( (ListLongMap!21648 (toList!10839 List!31121)) )
))
(declare-fun contains!8935 (ListLongMap!21647 (_ BitVec 64)) Bool)

(declare-fun +!4769 (ListLongMap!21647 tuple2!23990) ListLongMap!21647)

(declare-fun getCurrentListMapNoExtraKeys!6412 (array!90711 array!90713 (_ BitVec 32) (_ BitVec 32) V!54377 V!54377 (_ BitVec 32) Int) ListLongMap!21647)

(declare-fun get!22119 (ValueCell!17579 V!54377) V!54377)

(declare-fun dynLambda!3699 (Int (_ BitVec 64)) V!54377)

(assert (=> b!1337235 (= e!761450 (not (contains!8935 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153)))))

(declare-fun b!1337236 () Bool)

(declare-fun res!887433 () Bool)

(assert (=> b!1337236 (=> (not res!887433) (not e!761450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90711 (_ BitVec 32)) Bool)

(assert (=> b!1337236 (= res!887433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337237 () Bool)

(declare-fun res!887431 () Bool)

(assert (=> b!1337237 (=> (not res!887431) (not e!761450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337237 (= res!887431 (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!57113 () Bool)

(declare-fun tp!108779 () Bool)

(declare-fun e!761452 () Bool)

(assert (=> mapNonEmpty!57113 (= mapRes!57113 (and tp!108779 e!761452))))

(declare-fun mapValue!57113 () ValueCell!17579)

(declare-fun mapRest!57113 () (Array (_ BitVec 32) ValueCell!17579))

(declare-fun mapKey!57113 () (_ BitVec 32))

(assert (=> mapNonEmpty!57113 (= (arr!43821 _values!1320) (store mapRest!57113 mapKey!57113 mapValue!57113))))

(declare-fun b!1337238 () Bool)

(assert (=> b!1337238 (= e!761452 tp_is_empty!36955)))

(declare-fun b!1337239 () Bool)

(declare-fun res!887428 () Bool)

(assert (=> b!1337239 (=> (not res!887428) (not e!761450))))

(assert (=> b!1337239 (= res!887428 (not (= (select (arr!43820 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337240 () Bool)

(declare-fun res!887425 () Bool)

(assert (=> b!1337240 (=> (not res!887425) (not e!761450))))

(declare-fun getCurrentListMap!5692 (array!90711 array!90713 (_ BitVec 32) (_ BitVec 32) V!54377 V!54377 (_ BitVec 32) Int) ListLongMap!21647)

(assert (=> b!1337240 (= res!887425 (contains!8935 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!887426 () Bool)

(assert (=> start!112734 (=> (not res!887426) (not e!761450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112734 (= res!887426 (validMask!0 mask!1998))))

(assert (=> start!112734 e!761450))

(declare-fun array_inv!33241 (array!90713) Bool)

(assert (=> start!112734 (and (array_inv!33241 _values!1320) e!761449)))

(assert (=> start!112734 true))

(declare-fun array_inv!33242 (array!90711) Bool)

(assert (=> start!112734 (array_inv!33242 _keys!1590)))

(assert (=> start!112734 tp!108780))

(assert (=> start!112734 tp_is_empty!36955))

(assert (= (and start!112734 res!887426) b!1337231))

(assert (= (and b!1337231 res!887432) b!1337236))

(assert (= (and b!1337236 res!887433) b!1337229))

(assert (= (and b!1337229 res!887429) b!1337234))

(assert (= (and b!1337234 res!887427) b!1337240))

(assert (= (and b!1337240 res!887425) b!1337239))

(assert (= (and b!1337239 res!887428) b!1337237))

(assert (= (and b!1337237 res!887431) b!1337233))

(assert (= (and b!1337233 res!887430) b!1337235))

(assert (= (and b!1337232 condMapEmpty!57113) mapIsEmpty!57113))

(assert (= (and b!1337232 (not condMapEmpty!57113)) mapNonEmpty!57113))

(get-info :version)

(assert (= (and mapNonEmpty!57113 ((_ is ValueCellFull!17579) mapValue!57113)) b!1337238))

(assert (= (and b!1337232 ((_ is ValueCellFull!17579) mapDefault!57113)) b!1337230))

(assert (= start!112734 b!1337232))

(declare-fun b_lambda!24199 () Bool)

(assert (=> (not b_lambda!24199) (not b!1337235)))

(declare-fun t!45425 () Bool)

(declare-fun tb!12109 () Bool)

(assert (=> (and start!112734 (= defaultEntry!1323 defaultEntry!1323) t!45425) tb!12109))

(declare-fun result!25301 () Bool)

(assert (=> tb!12109 (= result!25301 tp_is_empty!36955)))

(assert (=> b!1337235 t!45425))

(declare-fun b_and!50007 () Bool)

(assert (= b_and!50005 (and (=> t!45425 result!25301) b_and!50007)))

(declare-fun m!1224839 () Bool)

(assert (=> b!1337229 m!1224839))

(declare-fun m!1224841 () Bool)

(assert (=> start!112734 m!1224841))

(declare-fun m!1224843 () Bool)

(assert (=> start!112734 m!1224843))

(declare-fun m!1224845 () Bool)

(assert (=> start!112734 m!1224845))

(declare-fun m!1224847 () Bool)

(assert (=> b!1337236 m!1224847))

(declare-fun m!1224849 () Bool)

(assert (=> b!1337240 m!1224849))

(assert (=> b!1337240 m!1224849))

(declare-fun m!1224851 () Bool)

(assert (=> b!1337240 m!1224851))

(declare-fun m!1224853 () Bool)

(assert (=> b!1337235 m!1224853))

(declare-fun m!1224855 () Bool)

(assert (=> b!1337235 m!1224855))

(declare-fun m!1224857 () Bool)

(assert (=> b!1337235 m!1224857))

(declare-fun m!1224859 () Bool)

(assert (=> b!1337235 m!1224859))

(assert (=> b!1337235 m!1224853))

(declare-fun m!1224861 () Bool)

(assert (=> b!1337235 m!1224861))

(assert (=> b!1337235 m!1224857))

(declare-fun m!1224863 () Bool)

(assert (=> b!1337235 m!1224863))

(assert (=> b!1337235 m!1224855))

(assert (=> b!1337235 m!1224859))

(declare-fun m!1224865 () Bool)

(assert (=> b!1337235 m!1224865))

(assert (=> b!1337239 m!1224865))

(assert (=> b!1337237 m!1224865))

(assert (=> b!1337237 m!1224865))

(declare-fun m!1224867 () Bool)

(assert (=> b!1337237 m!1224867))

(declare-fun m!1224869 () Bool)

(assert (=> mapNonEmpty!57113 m!1224869))

(check-sat (not b_next!31045) (not b_lambda!24199) b_and!50007 (not b!1337229) (not start!112734) (not b!1337235) (not mapNonEmpty!57113) (not b!1337236) (not b!1337237) tp_is_empty!36955 (not b!1337240))
(check-sat b_and!50007 (not b_next!31045))
(get-model)

(declare-fun b_lambda!24205 () Bool)

(assert (= b_lambda!24199 (or (and start!112734 b_free!31045) b_lambda!24205)))

(check-sat (not b_next!31045) b_and!50007 (not b!1337229) (not start!112734) (not b_lambda!24205) (not b!1337235) (not mapNonEmpty!57113) (not b!1337236) (not b!1337237) tp_is_empty!36955 (not b!1337240))
(check-sat b_and!50007 (not b_next!31045))
(get-model)

(declare-fun d!143621 () Bool)

(declare-fun e!761488 () Bool)

(assert (=> d!143621 e!761488))

(declare-fun res!887490 () Bool)

(assert (=> d!143621 (=> res!887490 e!761488)))

(declare-fun lt!592912 () Bool)

(assert (=> d!143621 (= res!887490 (not lt!592912))))

(declare-fun lt!592913 () Bool)

(assert (=> d!143621 (= lt!592912 lt!592913)))

(declare-datatypes ((Unit!43750 0))(
  ( (Unit!43751) )
))
(declare-fun lt!592911 () Unit!43750)

(declare-fun e!761489 () Unit!43750)

(assert (=> d!143621 (= lt!592911 e!761489)))

(declare-fun c!126043 () Bool)

(assert (=> d!143621 (= c!126043 lt!592913)))

(declare-fun containsKey!737 (List!31121 (_ BitVec 64)) Bool)

(assert (=> d!143621 (= lt!592913 (containsKey!737 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (=> d!143621 (= (contains!8935 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153) lt!592912)))

(declare-fun b!1337325 () Bool)

(declare-fun lt!592914 () Unit!43750)

(assert (=> b!1337325 (= e!761489 lt!592914)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!484 (List!31121 (_ BitVec 64)) Unit!43750)

(assert (=> b!1337325 (= lt!592914 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-datatypes ((Option!771 0))(
  ( (Some!770 (v!21195 V!54377)) (None!769) )
))
(declare-fun isDefined!527 (Option!771) Bool)

(declare-fun getValueByKey!720 (List!31121 (_ BitVec 64)) Option!771)

(assert (=> b!1337325 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun b!1337326 () Bool)

(declare-fun Unit!43752 () Unit!43750)

(assert (=> b!1337326 (= e!761489 Unit!43752)))

(declare-fun b!1337327 () Bool)

(assert (=> b!1337327 (= e!761488 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153)))))

(assert (= (and d!143621 c!126043) b!1337325))

(assert (= (and d!143621 (not c!126043)) b!1337326))

(assert (= (and d!143621 (not res!887490)) b!1337327))

(declare-fun m!1224935 () Bool)

(assert (=> d!143621 m!1224935))

(declare-fun m!1224937 () Bool)

(assert (=> b!1337325 m!1224937))

(declare-fun m!1224939 () Bool)

(assert (=> b!1337325 m!1224939))

(assert (=> b!1337325 m!1224939))

(declare-fun m!1224941 () Bool)

(assert (=> b!1337325 m!1224941))

(assert (=> b!1337327 m!1224939))

(assert (=> b!1337327 m!1224939))

(assert (=> b!1337327 m!1224941))

(assert (=> b!1337235 d!143621))

(declare-fun d!143623 () Bool)

(declare-fun e!761492 () Bool)

(assert (=> d!143623 e!761492))

(declare-fun res!887495 () Bool)

(assert (=> d!143623 (=> (not res!887495) (not e!761492))))

(declare-fun lt!592926 () ListLongMap!21647)

(assert (=> d!143623 (= res!887495 (contains!8935 lt!592926 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592925 () List!31121)

(assert (=> d!143623 (= lt!592926 (ListLongMap!21648 lt!592925))))

(declare-fun lt!592923 () Unit!43750)

(declare-fun lt!592924 () Unit!43750)

(assert (=> d!143623 (= lt!592923 lt!592924)))

(assert (=> d!143623 (= (getValueByKey!720 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!770 (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!363 (List!31121 (_ BitVec 64) V!54377) Unit!43750)

(assert (=> d!143623 (= lt!592924 (lemmaContainsTupThenGetReturnValue!363 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!492 (List!31121 (_ BitVec 64) V!54377) List!31121)

(assert (=> d!143623 (= lt!592925 (insertStrictlySorted!492 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143623 (= (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592926)))

(declare-fun b!1337332 () Bool)

(declare-fun res!887496 () Bool)

(assert (=> b!1337332 (=> (not res!887496) (not e!761492))))

(assert (=> b!1337332 (= res!887496 (= (getValueByKey!720 (toList!10839 lt!592926) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!770 (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337333 () Bool)

(declare-fun contains!8936 (List!31121 tuple2!23990) Bool)

(assert (=> b!1337333 (= e!761492 (contains!8936 (toList!10839 lt!592926) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143623 res!887495) b!1337332))

(assert (= (and b!1337332 res!887496) b!1337333))

(declare-fun m!1224943 () Bool)

(assert (=> d!143623 m!1224943))

(declare-fun m!1224945 () Bool)

(assert (=> d!143623 m!1224945))

(declare-fun m!1224947 () Bool)

(assert (=> d!143623 m!1224947))

(declare-fun m!1224949 () Bool)

(assert (=> d!143623 m!1224949))

(declare-fun m!1224951 () Bool)

(assert (=> b!1337332 m!1224951))

(declare-fun m!1224953 () Bool)

(assert (=> b!1337333 m!1224953))

(assert (=> b!1337235 d!143623))

(declare-fun b!1337358 () Bool)

(declare-fun e!761511 () Bool)

(declare-fun e!761507 () Bool)

(assert (=> b!1337358 (= e!761511 e!761507)))

(declare-fun c!126053 () Bool)

(declare-fun e!761508 () Bool)

(assert (=> b!1337358 (= c!126053 e!761508)))

(declare-fun res!887508 () Bool)

(assert (=> b!1337358 (=> (not res!887508) (not e!761508))))

(assert (=> b!1337358 (= res!887508 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44372 _keys!1590)))))

(declare-fun d!143625 () Bool)

(assert (=> d!143625 e!761511))

(declare-fun res!887506 () Bool)

(assert (=> d!143625 (=> (not res!887506) (not e!761511))))

(declare-fun lt!592942 () ListLongMap!21647)

(assert (=> d!143625 (= res!887506 (not (contains!8935 lt!592942 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!761513 () ListLongMap!21647)

(assert (=> d!143625 (= lt!592942 e!761513)))

(declare-fun c!126052 () Bool)

(assert (=> d!143625 (= c!126052 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44372 _keys!1590)))))

(assert (=> d!143625 (validMask!0 mask!1998)))

(assert (=> d!143625 (= (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592942)))

(declare-fun b!1337359 () Bool)

(declare-fun e!761509 () ListLongMap!21647)

(assert (=> b!1337359 (= e!761513 e!761509)))

(declare-fun c!126054 () Bool)

(assert (=> b!1337359 (= c!126054 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1337360 () Bool)

(declare-fun e!761510 () Bool)

(assert (=> b!1337360 (= e!761507 e!761510)))

(assert (=> b!1337360 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44372 _keys!1590)))))

(declare-fun res!887507 () Bool)

(assert (=> b!1337360 (= res!887507 (contains!8935 lt!592942 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337360 (=> (not res!887507) (not e!761510))))

(declare-fun b!1337361 () Bool)

(declare-fun e!761512 () Bool)

(declare-fun isEmpty!1091 (ListLongMap!21647) Bool)

(assert (=> b!1337361 (= e!761512 (isEmpty!1091 lt!592942))))

(declare-fun b!1337362 () Bool)

(assert (=> b!1337362 (= e!761508 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337362 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1337363 () Bool)

(assert (=> b!1337363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44372 _keys!1590)))))

(assert (=> b!1337363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44373 _values!1320)))))

(declare-fun apply!1027 (ListLongMap!21647 (_ BitVec 64)) V!54377)

(assert (=> b!1337363 (= e!761510 (= (apply!1027 lt!592942 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337364 () Bool)

(declare-fun res!887505 () Bool)

(assert (=> b!1337364 (=> (not res!887505) (not e!761511))))

(assert (=> b!1337364 (= res!887505 (not (contains!8935 lt!592942 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!64889 () ListLongMap!21647)

(declare-fun bm!64886 () Bool)

(assert (=> bm!64886 (= call!64889 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337365 () Bool)

(assert (=> b!1337365 (= e!761513 (ListLongMap!21648 Nil!31118))))

(declare-fun b!1337366 () Bool)

(assert (=> b!1337366 (= e!761512 (= lt!592942 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337367 () Bool)

(declare-fun lt!592945 () Unit!43750)

(declare-fun lt!592941 () Unit!43750)

(assert (=> b!1337367 (= lt!592945 lt!592941)))

(declare-fun lt!592946 () ListLongMap!21647)

(declare-fun lt!592947 () (_ BitVec 64))

(declare-fun lt!592944 () V!54377)

(declare-fun lt!592943 () (_ BitVec 64))

(assert (=> b!1337367 (not (contains!8935 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944)) lt!592943))))

(declare-fun addStillNotContains!486 (ListLongMap!21647 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43750)

(assert (=> b!1337367 (= lt!592941 (addStillNotContains!486 lt!592946 lt!592947 lt!592944 lt!592943))))

(assert (=> b!1337367 (= lt!592943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337367 (= lt!592944 (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337367 (= lt!592947 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1337367 (= lt!592946 call!64889)))

(assert (=> b!1337367 (= e!761509 (+!4769 call!64889 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337368 () Bool)

(assert (=> b!1337368 (= e!761507 e!761512)))

(declare-fun c!126055 () Bool)

(assert (=> b!1337368 (= c!126055 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44372 _keys!1590)))))

(declare-fun b!1337369 () Bool)

(assert (=> b!1337369 (= e!761509 call!64889)))

(assert (= (and d!143625 c!126052) b!1337365))

(assert (= (and d!143625 (not c!126052)) b!1337359))

(assert (= (and b!1337359 c!126054) b!1337367))

(assert (= (and b!1337359 (not c!126054)) b!1337369))

(assert (= (or b!1337367 b!1337369) bm!64886))

(assert (= (and d!143625 res!887506) b!1337364))

(assert (= (and b!1337364 res!887505) b!1337358))

(assert (= (and b!1337358 res!887508) b!1337362))

(assert (= (and b!1337358 c!126053) b!1337360))

(assert (= (and b!1337358 (not c!126053)) b!1337368))

(assert (= (and b!1337360 res!887507) b!1337363))

(assert (= (and b!1337368 c!126055) b!1337366))

(assert (= (and b!1337368 (not c!126055)) b!1337361))

(declare-fun b_lambda!24207 () Bool)

(assert (=> (not b_lambda!24207) (not b!1337363)))

(assert (=> b!1337363 t!45425))

(declare-fun b_and!50017 () Bool)

(assert (= b_and!50007 (and (=> t!45425 result!25301) b_and!50017)))

(declare-fun b_lambda!24209 () Bool)

(assert (=> (not b_lambda!24209) (not b!1337367)))

(assert (=> b!1337367 t!45425))

(declare-fun b_and!50019 () Bool)

(assert (= b_and!50017 (and (=> t!45425 result!25301) b_and!50019)))

(declare-fun m!1224955 () Bool)

(assert (=> b!1337359 m!1224955))

(assert (=> b!1337359 m!1224955))

(declare-fun m!1224957 () Bool)

(assert (=> b!1337359 m!1224957))

(declare-fun m!1224959 () Bool)

(assert (=> b!1337361 m!1224959))

(assert (=> b!1337360 m!1224955))

(assert (=> b!1337360 m!1224955))

(declare-fun m!1224961 () Bool)

(assert (=> b!1337360 m!1224961))

(assert (=> b!1337367 m!1224853))

(assert (=> b!1337367 m!1224955))

(declare-fun m!1224963 () Bool)

(assert (=> b!1337367 m!1224963))

(declare-fun m!1224965 () Bool)

(assert (=> b!1337367 m!1224965))

(declare-fun m!1224967 () Bool)

(assert (=> b!1337367 m!1224967))

(declare-fun m!1224969 () Bool)

(assert (=> b!1337367 m!1224969))

(assert (=> b!1337367 m!1224965))

(assert (=> b!1337367 m!1224969))

(assert (=> b!1337367 m!1224853))

(declare-fun m!1224971 () Bool)

(assert (=> b!1337367 m!1224971))

(declare-fun m!1224973 () Bool)

(assert (=> b!1337367 m!1224973))

(declare-fun m!1224975 () Bool)

(assert (=> bm!64886 m!1224975))

(assert (=> b!1337363 m!1224853))

(assert (=> b!1337363 m!1224955))

(assert (=> b!1337363 m!1224969))

(assert (=> b!1337363 m!1224955))

(declare-fun m!1224977 () Bool)

(assert (=> b!1337363 m!1224977))

(assert (=> b!1337363 m!1224969))

(assert (=> b!1337363 m!1224853))

(assert (=> b!1337363 m!1224971))

(declare-fun m!1224979 () Bool)

(assert (=> d!143625 m!1224979))

(assert (=> d!143625 m!1224841))

(assert (=> b!1337362 m!1224955))

(assert (=> b!1337362 m!1224955))

(assert (=> b!1337362 m!1224957))

(assert (=> b!1337366 m!1224975))

(declare-fun m!1224981 () Bool)

(assert (=> b!1337364 m!1224981))

(assert (=> b!1337235 d!143625))

(declare-fun d!143627 () Bool)

(declare-fun c!126058 () Bool)

(assert (=> d!143627 (= c!126058 ((_ is ValueCellFull!17579) (select (arr!43821 _values!1320) from!1980)))))

(declare-fun e!761516 () V!54377)

(assert (=> d!143627 (= (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761516)))

(declare-fun b!1337374 () Bool)

(declare-fun get!22120 (ValueCell!17579 V!54377) V!54377)

(assert (=> b!1337374 (= e!761516 (get!22120 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337375 () Bool)

(declare-fun get!22121 (ValueCell!17579 V!54377) V!54377)

(assert (=> b!1337375 (= e!761516 (get!22121 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143627 c!126058) b!1337374))

(assert (= (and d!143627 (not c!126058)) b!1337375))

(assert (=> b!1337374 m!1224859))

(assert (=> b!1337374 m!1224853))

(declare-fun m!1224983 () Bool)

(assert (=> b!1337374 m!1224983))

(assert (=> b!1337375 m!1224859))

(assert (=> b!1337375 m!1224853))

(declare-fun m!1224985 () Bool)

(assert (=> b!1337375 m!1224985))

(assert (=> b!1337235 d!143627))

(declare-fun d!143629 () Bool)

(declare-fun e!761517 () Bool)

(assert (=> d!143629 e!761517))

(declare-fun res!887509 () Bool)

(assert (=> d!143629 (=> res!887509 e!761517)))

(declare-fun lt!592949 () Bool)

(assert (=> d!143629 (= res!887509 (not lt!592949))))

(declare-fun lt!592950 () Bool)

(assert (=> d!143629 (= lt!592949 lt!592950)))

(declare-fun lt!592948 () Unit!43750)

(declare-fun e!761518 () Unit!43750)

(assert (=> d!143629 (= lt!592948 e!761518)))

(declare-fun c!126059 () Bool)

(assert (=> d!143629 (= c!126059 lt!592950)))

(assert (=> d!143629 (= lt!592950 (containsKey!737 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143629 (= (contains!8935 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!592949)))

(declare-fun b!1337376 () Bool)

(declare-fun lt!592951 () Unit!43750)

(assert (=> b!1337376 (= e!761518 lt!592951)))

(assert (=> b!1337376 (= lt!592951 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1337376 (isDefined!527 (getValueByKey!720 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1337377 () Bool)

(declare-fun Unit!43753 () Unit!43750)

(assert (=> b!1337377 (= e!761518 Unit!43753)))

(declare-fun b!1337378 () Bool)

(assert (=> b!1337378 (= e!761517 (isDefined!527 (getValueByKey!720 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143629 c!126059) b!1337376))

(assert (= (and d!143629 (not c!126059)) b!1337377))

(assert (= (and d!143629 (not res!887509)) b!1337378))

(declare-fun m!1224987 () Bool)

(assert (=> d!143629 m!1224987))

(declare-fun m!1224989 () Bool)

(assert (=> b!1337376 m!1224989))

(declare-fun m!1224991 () Bool)

(assert (=> b!1337376 m!1224991))

(assert (=> b!1337376 m!1224991))

(declare-fun m!1224993 () Bool)

(assert (=> b!1337376 m!1224993))

(assert (=> b!1337378 m!1224991))

(assert (=> b!1337378 m!1224991))

(assert (=> b!1337378 m!1224993))

(assert (=> b!1337240 d!143629))

(declare-fun b!1337421 () Bool)

(declare-fun c!126074 () Bool)

(assert (=> b!1337421 (= c!126074 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761553 () ListLongMap!21647)

(declare-fun e!761548 () ListLongMap!21647)

(assert (=> b!1337421 (= e!761553 e!761548)))

(declare-fun bm!64901 () Bool)

(declare-fun call!64907 () Bool)

(declare-fun lt!593016 () ListLongMap!21647)

(assert (=> bm!64901 (= call!64907 (contains!8935 lt!593016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64902 () Bool)

(declare-fun call!64906 () ListLongMap!21647)

(declare-fun call!64910 () ListLongMap!21647)

(assert (=> bm!64902 (= call!64906 call!64910)))

(declare-fun bm!64903 () Bool)

(declare-fun call!64909 () Bool)

(assert (=> bm!64903 (= call!64909 (contains!8935 lt!593016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337422 () Bool)

(declare-fun e!761556 () Bool)

(assert (=> b!1337422 (= e!761556 (= (apply!1027 lt!593016 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1337423 () Bool)

(declare-fun e!761550 () ListLongMap!21647)

(declare-fun call!64904 () ListLongMap!21647)

(assert (=> b!1337423 (= e!761550 (+!4769 call!64904 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1337424 () Bool)

(declare-fun e!761557 () Bool)

(assert (=> b!1337424 (= e!761557 (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)))))

(declare-fun b!1337425 () Bool)

(declare-fun res!887528 () Bool)

(declare-fun e!761551 () Bool)

(assert (=> b!1337425 (=> (not res!887528) (not e!761551))))

(declare-fun e!761549 () Bool)

(assert (=> b!1337425 (= res!887528 e!761549)))

(declare-fun c!126073 () Bool)

(assert (=> b!1337425 (= c!126073 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1337426 () Bool)

(declare-fun call!64908 () ListLongMap!21647)

(assert (=> b!1337426 (= e!761548 call!64908)))

(declare-fun b!1337427 () Bool)

(declare-fun call!64905 () ListLongMap!21647)

(assert (=> b!1337427 (= e!761548 call!64905)))

(declare-fun b!1337428 () Bool)

(declare-fun e!761554 () Bool)

(declare-fun e!761555 () Bool)

(assert (=> b!1337428 (= e!761554 e!761555)))

(declare-fun res!887533 () Bool)

(assert (=> b!1337428 (=> (not res!887533) (not e!761555))))

(assert (=> b!1337428 (= res!887533 (contains!8935 lt!593016 (select (arr!43820 _keys!1590) from!1980)))))

(assert (=> b!1337428 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)))))

(declare-fun b!1337429 () Bool)

(declare-fun e!761546 () Bool)

(assert (=> b!1337429 (= e!761546 (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)))))

(declare-fun b!1337430 () Bool)

(assert (=> b!1337430 (= e!761550 e!761553)))

(declare-fun c!126076 () Bool)

(assert (=> b!1337430 (= c!126076 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337431 () Bool)

(declare-fun e!761545 () Unit!43750)

(declare-fun Unit!43754 () Unit!43750)

(assert (=> b!1337431 (= e!761545 Unit!43754)))

(declare-fun b!1337432 () Bool)

(declare-fun lt!593012 () Unit!43750)

(assert (=> b!1337432 (= e!761545 lt!593012)))

(declare-fun lt!593002 () ListLongMap!21647)

(assert (=> b!1337432 (= lt!593002 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593009 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!593009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593015 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!593015 (select (arr!43820 _keys!1590) from!1980))))

(declare-fun lt!593008 () Unit!43750)

(declare-fun addStillContains!1185 (ListLongMap!21647 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43750)

(assert (=> b!1337432 (= lt!593008 (addStillContains!1185 lt!593002 lt!593009 zeroValue!1262 lt!593015))))

(assert (=> b!1337432 (contains!8935 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262)) lt!593015)))

(declare-fun lt!593000 () Unit!43750)

(assert (=> b!1337432 (= lt!593000 lt!593008)))

(declare-fun lt!593007 () ListLongMap!21647)

(assert (=> b!1337432 (= lt!593007 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592997 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!592997 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593001 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!593001 (select (arr!43820 _keys!1590) from!1980))))

(declare-fun lt!593014 () Unit!43750)

(declare-fun addApplyDifferent!565 (ListLongMap!21647 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43750)

(assert (=> b!1337432 (= lt!593014 (addApplyDifferent!565 lt!593007 lt!592997 minValue!1262 lt!593001))))

(assert (=> b!1337432 (= (apply!1027 (+!4769 lt!593007 (tuple2!23991 lt!592997 minValue!1262)) lt!593001) (apply!1027 lt!593007 lt!593001))))

(declare-fun lt!592996 () Unit!43750)

(assert (=> b!1337432 (= lt!592996 lt!593014)))

(declare-fun lt!593010 () ListLongMap!21647)

(assert (=> b!1337432 (= lt!593010 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593011 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!593011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593003 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!593003 (select (arr!43820 _keys!1590) from!1980))))

(declare-fun lt!592998 () Unit!43750)

(assert (=> b!1337432 (= lt!592998 (addApplyDifferent!565 lt!593010 lt!593011 zeroValue!1262 lt!593003))))

(assert (=> b!1337432 (= (apply!1027 (+!4769 lt!593010 (tuple2!23991 lt!593011 zeroValue!1262)) lt!593003) (apply!1027 lt!593010 lt!593003))))

(declare-fun lt!593005 () Unit!43750)

(assert (=> b!1337432 (= lt!593005 lt!592998)))

(declare-fun lt!593004 () ListLongMap!21647)

(assert (=> b!1337432 (= lt!593004 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593017 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!593017 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592999 () (_ BitVec 64))

(assert (=> b!1337432 (= lt!592999 (select (arr!43820 _keys!1590) from!1980))))

(assert (=> b!1337432 (= lt!593012 (addApplyDifferent!565 lt!593004 lt!593017 minValue!1262 lt!592999))))

(assert (=> b!1337432 (= (apply!1027 (+!4769 lt!593004 (tuple2!23991 lt!593017 minValue!1262)) lt!592999) (apply!1027 lt!593004 lt!592999))))

(declare-fun b!1337433 () Bool)

(declare-fun e!761547 () Bool)

(assert (=> b!1337433 (= e!761547 e!761556)))

(declare-fun res!887529 () Bool)

(assert (=> b!1337433 (= res!887529 call!64907)))

(assert (=> b!1337433 (=> (not res!887529) (not e!761556))))

(declare-fun b!1337434 () Bool)

(assert (=> b!1337434 (= e!761553 call!64908)))

(declare-fun b!1337435 () Bool)

(assert (=> b!1337435 (= e!761547 (not call!64907))))

(declare-fun bm!64904 () Bool)

(assert (=> bm!64904 (= call!64910 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1337436 () Bool)

(declare-fun e!761552 () Bool)

(assert (=> b!1337436 (= e!761552 (= (apply!1027 lt!593016 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1337437 () Bool)

(assert (=> b!1337437 (= e!761549 e!761552)))

(declare-fun res!887534 () Bool)

(assert (=> b!1337437 (= res!887534 call!64909)))

(assert (=> b!1337437 (=> (not res!887534) (not e!761552))))

(declare-fun bm!64905 () Bool)

(assert (=> bm!64905 (= call!64908 call!64904)))

(declare-fun b!1337438 () Bool)

(declare-fun res!887536 () Bool)

(assert (=> b!1337438 (=> (not res!887536) (not e!761551))))

(assert (=> b!1337438 (= res!887536 e!761554)))

(declare-fun res!887532 () Bool)

(assert (=> b!1337438 (=> res!887532 e!761554)))

(assert (=> b!1337438 (= res!887532 (not e!761546))))

(declare-fun res!887530 () Bool)

(assert (=> b!1337438 (=> (not res!887530) (not e!761546))))

(assert (=> b!1337438 (= res!887530 (bvslt from!1980 (size!44372 _keys!1590)))))

(declare-fun b!1337439 () Bool)

(assert (=> b!1337439 (= e!761551 e!761547)))

(declare-fun c!126072 () Bool)

(assert (=> b!1337439 (= c!126072 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337440 () Bool)

(assert (=> b!1337440 (= e!761549 (not call!64909))))

(declare-fun bm!64906 () Bool)

(declare-fun c!126075 () Bool)

(assert (=> bm!64906 (= call!64904 (+!4769 (ite c!126075 call!64910 (ite c!126076 call!64906 call!64905)) (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun d!143631 () Bool)

(assert (=> d!143631 e!761551))

(declare-fun res!887531 () Bool)

(assert (=> d!143631 (=> (not res!887531) (not e!761551))))

(assert (=> d!143631 (= res!887531 (or (bvsge from!1980 (size!44372 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)))))))

(declare-fun lt!593013 () ListLongMap!21647)

(assert (=> d!143631 (= lt!593016 lt!593013)))

(declare-fun lt!593006 () Unit!43750)

(assert (=> d!143631 (= lt!593006 e!761545)))

(declare-fun c!126077 () Bool)

(assert (=> d!143631 (= c!126077 e!761557)))

(declare-fun res!887535 () Bool)

(assert (=> d!143631 (=> (not res!887535) (not e!761557))))

(assert (=> d!143631 (= res!887535 (bvslt from!1980 (size!44372 _keys!1590)))))

(assert (=> d!143631 (= lt!593013 e!761550)))

(assert (=> d!143631 (= c!126075 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143631 (validMask!0 mask!1998)))

(assert (=> d!143631 (= (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593016)))

(declare-fun bm!64907 () Bool)

(assert (=> bm!64907 (= call!64905 call!64906)))

(declare-fun b!1337441 () Bool)

(assert (=> b!1337441 (= e!761555 (= (apply!1027 lt!593016 (select (arr!43820 _keys!1590) from!1980)) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337441 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44373 _values!1320)))))

(assert (=> b!1337441 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)))))

(assert (= (and d!143631 c!126075) b!1337423))

(assert (= (and d!143631 (not c!126075)) b!1337430))

(assert (= (and b!1337430 c!126076) b!1337434))

(assert (= (and b!1337430 (not c!126076)) b!1337421))

(assert (= (and b!1337421 c!126074) b!1337426))

(assert (= (and b!1337421 (not c!126074)) b!1337427))

(assert (= (or b!1337426 b!1337427) bm!64907))

(assert (= (or b!1337434 bm!64907) bm!64902))

(assert (= (or b!1337434 b!1337426) bm!64905))

(assert (= (or b!1337423 bm!64902) bm!64904))

(assert (= (or b!1337423 bm!64905) bm!64906))

(assert (= (and d!143631 res!887535) b!1337424))

(assert (= (and d!143631 c!126077) b!1337432))

(assert (= (and d!143631 (not c!126077)) b!1337431))

(assert (= (and d!143631 res!887531) b!1337438))

(assert (= (and b!1337438 res!887530) b!1337429))

(assert (= (and b!1337438 (not res!887532)) b!1337428))

(assert (= (and b!1337428 res!887533) b!1337441))

(assert (= (and b!1337438 res!887536) b!1337425))

(assert (= (and b!1337425 c!126073) b!1337437))

(assert (= (and b!1337425 (not c!126073)) b!1337440))

(assert (= (and b!1337437 res!887534) b!1337436))

(assert (= (or b!1337437 b!1337440) bm!64903))

(assert (= (and b!1337425 res!887528) b!1337439))

(assert (= (and b!1337439 c!126072) b!1337433))

(assert (= (and b!1337439 (not c!126072)) b!1337435))

(assert (= (and b!1337433 res!887529) b!1337422))

(assert (= (or b!1337433 b!1337435) bm!64901))

(declare-fun b_lambda!24211 () Bool)

(assert (=> (not b_lambda!24211) (not b!1337441)))

(assert (=> b!1337441 t!45425))

(declare-fun b_and!50021 () Bool)

(assert (= b_and!50019 (and (=> t!45425 result!25301) b_and!50021)))

(declare-fun m!1224995 () Bool)

(assert (=> bm!64903 m!1224995))

(assert (=> d!143631 m!1224841))

(assert (=> b!1337428 m!1224865))

(assert (=> b!1337428 m!1224865))

(declare-fun m!1224997 () Bool)

(assert (=> b!1337428 m!1224997))

(assert (=> b!1337429 m!1224865))

(assert (=> b!1337429 m!1224865))

(assert (=> b!1337429 m!1224867))

(declare-fun m!1224999 () Bool)

(assert (=> bm!64906 m!1224999))

(declare-fun m!1225001 () Bool)

(assert (=> b!1337422 m!1225001))

(declare-fun m!1225003 () Bool)

(assert (=> b!1337432 m!1225003))

(declare-fun m!1225005 () Bool)

(assert (=> b!1337432 m!1225005))

(declare-fun m!1225007 () Bool)

(assert (=> b!1337432 m!1225007))

(declare-fun m!1225009 () Bool)

(assert (=> b!1337432 m!1225009))

(declare-fun m!1225011 () Bool)

(assert (=> b!1337432 m!1225011))

(declare-fun m!1225013 () Bool)

(assert (=> b!1337432 m!1225013))

(declare-fun m!1225015 () Bool)

(assert (=> b!1337432 m!1225015))

(declare-fun m!1225017 () Bool)

(assert (=> b!1337432 m!1225017))

(assert (=> b!1337432 m!1224865))

(declare-fun m!1225019 () Bool)

(assert (=> b!1337432 m!1225019))

(assert (=> b!1337432 m!1225007))

(declare-fun m!1225021 () Bool)

(assert (=> b!1337432 m!1225021))

(assert (=> b!1337432 m!1225009))

(declare-fun m!1225023 () Bool)

(assert (=> b!1337432 m!1225023))

(declare-fun m!1225025 () Bool)

(assert (=> b!1337432 m!1225025))

(assert (=> b!1337432 m!1225013))

(declare-fun m!1225027 () Bool)

(assert (=> b!1337432 m!1225027))

(declare-fun m!1225029 () Bool)

(assert (=> b!1337432 m!1225029))

(declare-fun m!1225031 () Bool)

(assert (=> b!1337432 m!1225031))

(assert (=> b!1337432 m!1225027))

(declare-fun m!1225033 () Bool)

(assert (=> b!1337432 m!1225033))

(declare-fun m!1225035 () Bool)

(assert (=> bm!64901 m!1225035))

(assert (=> b!1337441 m!1224853))

(assert (=> b!1337441 m!1224859))

(assert (=> b!1337441 m!1224859))

(assert (=> b!1337441 m!1224853))

(assert (=> b!1337441 m!1224861))

(assert (=> b!1337441 m!1224865))

(assert (=> b!1337441 m!1224865))

(declare-fun m!1225037 () Bool)

(assert (=> b!1337441 m!1225037))

(assert (=> bm!64904 m!1225023))

(declare-fun m!1225039 () Bool)

(assert (=> b!1337436 m!1225039))

(assert (=> b!1337424 m!1224865))

(assert (=> b!1337424 m!1224865))

(assert (=> b!1337424 m!1224867))

(declare-fun m!1225041 () Bool)

(assert (=> b!1337423 m!1225041))

(assert (=> b!1337240 d!143631))

(declare-fun d!143633 () Bool)

(declare-fun res!887545 () Bool)

(declare-fun e!761569 () Bool)

(assert (=> d!143633 (=> res!887545 e!761569)))

(assert (=> d!143633 (= res!887545 (bvsge #b00000000000000000000000000000000 (size!44372 _keys!1590)))))

(assert (=> d!143633 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31117) e!761569)))

(declare-fun b!1337452 () Bool)

(declare-fun e!761566 () Bool)

(declare-fun contains!8937 (List!31120 (_ BitVec 64)) Bool)

(assert (=> b!1337452 (= e!761566 (contains!8937 Nil!31117 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337453 () Bool)

(declare-fun e!761568 () Bool)

(assert (=> b!1337453 (= e!761569 e!761568)))

(declare-fun res!887544 () Bool)

(assert (=> b!1337453 (=> (not res!887544) (not e!761568))))

(assert (=> b!1337453 (= res!887544 (not e!761566))))

(declare-fun res!887543 () Bool)

(assert (=> b!1337453 (=> (not res!887543) (not e!761566))))

(assert (=> b!1337453 (= res!887543 (validKeyInArray!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337454 () Bool)

(declare-fun e!761567 () Bool)

(declare-fun call!64913 () Bool)

(assert (=> b!1337454 (= e!761567 call!64913)))

(declare-fun bm!64910 () Bool)

(declare-fun c!126080 () Bool)

(assert (=> bm!64910 (= call!64913 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126080 (Cons!31116 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) Nil!31117) Nil!31117)))))

(declare-fun b!1337455 () Bool)

(assert (=> b!1337455 (= e!761568 e!761567)))

(assert (=> b!1337455 (= c!126080 (validKeyInArray!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337456 () Bool)

(assert (=> b!1337456 (= e!761567 call!64913)))

(assert (= (and d!143633 (not res!887545)) b!1337453))

(assert (= (and b!1337453 res!887543) b!1337452))

(assert (= (and b!1337453 res!887544) b!1337455))

(assert (= (and b!1337455 c!126080) b!1337456))

(assert (= (and b!1337455 (not c!126080)) b!1337454))

(assert (= (or b!1337456 b!1337454) bm!64910))

(declare-fun m!1225043 () Bool)

(assert (=> b!1337452 m!1225043))

(assert (=> b!1337452 m!1225043))

(declare-fun m!1225045 () Bool)

(assert (=> b!1337452 m!1225045))

(assert (=> b!1337453 m!1225043))

(assert (=> b!1337453 m!1225043))

(declare-fun m!1225047 () Bool)

(assert (=> b!1337453 m!1225047))

(assert (=> bm!64910 m!1225043))

(declare-fun m!1225049 () Bool)

(assert (=> bm!64910 m!1225049))

(assert (=> b!1337455 m!1225043))

(assert (=> b!1337455 m!1225043))

(assert (=> b!1337455 m!1225047))

(assert (=> b!1337229 d!143633))

(declare-fun d!143635 () Bool)

(assert (=> d!143635 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112734 d!143635))

(declare-fun d!143637 () Bool)

(assert (=> d!143637 (= (array_inv!33241 _values!1320) (bvsge (size!44373 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112734 d!143637))

(declare-fun d!143639 () Bool)

(assert (=> d!143639 (= (array_inv!33242 _keys!1590) (bvsge (size!44372 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112734 d!143639))

(declare-fun bm!64913 () Bool)

(declare-fun call!64916 () Bool)

(assert (=> bm!64913 (= call!64916 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1337465 () Bool)

(declare-fun e!761577 () Bool)

(declare-fun e!761576 () Bool)

(assert (=> b!1337465 (= e!761577 e!761576)))

(declare-fun lt!593024 () (_ BitVec 64))

(assert (=> b!1337465 (= lt!593024 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593026 () Unit!43750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90711 (_ BitVec 64) (_ BitVec 32)) Unit!43750)

(assert (=> b!1337465 (= lt!593026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593024 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1337465 (arrayContainsKey!0 _keys!1590 lt!593024 #b00000000000000000000000000000000)))

(declare-fun lt!593025 () Unit!43750)

(assert (=> b!1337465 (= lt!593025 lt!593026)))

(declare-fun res!887550 () Bool)

(declare-datatypes ((SeekEntryResult!10048 0))(
  ( (MissingZero!10048 (index!42563 (_ BitVec 32))) (Found!10048 (index!42564 (_ BitVec 32))) (Intermediate!10048 (undefined!10860 Bool) (index!42565 (_ BitVec 32)) (x!119478 (_ BitVec 32))) (Undefined!10048) (MissingVacant!10048 (index!42566 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90711 (_ BitVec 32)) SeekEntryResult!10048)

(assert (=> b!1337465 (= res!887550 (= (seekEntryOrOpen!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10048 #b00000000000000000000000000000000)))))

(assert (=> b!1337465 (=> (not res!887550) (not e!761576))))

(declare-fun b!1337466 () Bool)

(declare-fun e!761578 () Bool)

(assert (=> b!1337466 (= e!761578 e!761577)))

(declare-fun c!126083 () Bool)

(assert (=> b!1337466 (= c!126083 (validKeyInArray!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337467 () Bool)

(assert (=> b!1337467 (= e!761577 call!64916)))

(declare-fun d!143641 () Bool)

(declare-fun res!887551 () Bool)

(assert (=> d!143641 (=> res!887551 e!761578)))

(assert (=> d!143641 (= res!887551 (bvsge #b00000000000000000000000000000000 (size!44372 _keys!1590)))))

(assert (=> d!143641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761578)))

(declare-fun b!1337468 () Bool)

(assert (=> b!1337468 (= e!761576 call!64916)))

(assert (= (and d!143641 (not res!887551)) b!1337466))

(assert (= (and b!1337466 c!126083) b!1337465))

(assert (= (and b!1337466 (not c!126083)) b!1337467))

(assert (= (and b!1337465 res!887550) b!1337468))

(assert (= (or b!1337468 b!1337467) bm!64913))

(declare-fun m!1225051 () Bool)

(assert (=> bm!64913 m!1225051))

(assert (=> b!1337465 m!1225043))

(declare-fun m!1225053 () Bool)

(assert (=> b!1337465 m!1225053))

(declare-fun m!1225055 () Bool)

(assert (=> b!1337465 m!1225055))

(assert (=> b!1337465 m!1225043))

(declare-fun m!1225057 () Bool)

(assert (=> b!1337465 m!1225057))

(assert (=> b!1337466 m!1225043))

(assert (=> b!1337466 m!1225043))

(assert (=> b!1337466 m!1225047))

(assert (=> b!1337236 d!143641))

(declare-fun d!143643 () Bool)

(assert (=> d!143643 (= (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)) (and (not (= (select (arr!43820 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43820 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337237 d!143643))

(declare-fun condMapEmpty!57122 () Bool)

(declare-fun mapDefault!57122 () ValueCell!17579)

(assert (=> mapNonEmpty!57113 (= condMapEmpty!57122 (= mapRest!57113 ((as const (Array (_ BitVec 32) ValueCell!17579)) mapDefault!57122)))))

(declare-fun e!761583 () Bool)

(declare-fun mapRes!57122 () Bool)

(assert (=> mapNonEmpty!57113 (= tp!108779 (and e!761583 mapRes!57122))))

(declare-fun b!1337475 () Bool)

(declare-fun e!761584 () Bool)

(assert (=> b!1337475 (= e!761584 tp_is_empty!36955)))

(declare-fun mapNonEmpty!57122 () Bool)

(declare-fun tp!108795 () Bool)

(assert (=> mapNonEmpty!57122 (= mapRes!57122 (and tp!108795 e!761584))))

(declare-fun mapRest!57122 () (Array (_ BitVec 32) ValueCell!17579))

(declare-fun mapValue!57122 () ValueCell!17579)

(declare-fun mapKey!57122 () (_ BitVec 32))

(assert (=> mapNonEmpty!57122 (= mapRest!57113 (store mapRest!57122 mapKey!57122 mapValue!57122))))

(declare-fun b!1337476 () Bool)

(assert (=> b!1337476 (= e!761583 tp_is_empty!36955)))

(declare-fun mapIsEmpty!57122 () Bool)

(assert (=> mapIsEmpty!57122 mapRes!57122))

(assert (= (and mapNonEmpty!57113 condMapEmpty!57122) mapIsEmpty!57122))

(assert (= (and mapNonEmpty!57113 (not condMapEmpty!57122)) mapNonEmpty!57122))

(assert (= (and mapNonEmpty!57122 ((_ is ValueCellFull!17579) mapValue!57122)) b!1337475))

(assert (= (and mapNonEmpty!57113 ((_ is ValueCellFull!17579) mapDefault!57122)) b!1337476))

(declare-fun m!1225059 () Bool)

(assert (=> mapNonEmpty!57122 m!1225059))

(declare-fun b_lambda!24213 () Bool)

(assert (= b_lambda!24207 (or (and start!112734 b_free!31045) b_lambda!24213)))

(declare-fun b_lambda!24215 () Bool)

(assert (= b_lambda!24211 (or (and start!112734 b_free!31045) b_lambda!24215)))

(declare-fun b_lambda!24217 () Bool)

(assert (= b_lambda!24209 (or (and start!112734 b_free!31045) b_lambda!24217)))

(check-sat (not b!1337362) (not b!1337455) (not b!1337359) (not b!1337375) (not bm!64886) tp_is_empty!36955 (not b!1337364) (not b!1337453) (not d!143629) (not b!1337432) (not b!1337363) (not b!1337452) (not b_next!31045) (not d!143623) (not b!1337429) (not b!1337374) (not b_lambda!24213) (not mapNonEmpty!57122) b_and!50021 (not b!1337465) (not d!143631) (not b!1337366) (not bm!64904) (not b!1337422) (not b!1337325) (not b_lambda!24215) (not b!1337333) (not bm!64910) (not b_lambda!24205) (not b!1337360) (not b!1337441) (not bm!64913) (not bm!64901) (not b!1337436) (not bm!64906) (not b!1337367) (not b_lambda!24217) (not b!1337466) (not d!143625) (not b!1337428) (not b!1337361) (not bm!64903) (not b!1337376) (not b!1337423) (not b!1337332) (not d!143621) (not b!1337424) (not b!1337327) (not b!1337378))
(check-sat b_and!50021 (not b_next!31045))
(get-model)

(declare-fun d!143645 () Bool)

(declare-fun e!761585 () Bool)

(assert (=> d!143645 e!761585))

(declare-fun res!887552 () Bool)

(assert (=> d!143645 (=> res!887552 e!761585)))

(declare-fun lt!593028 () Bool)

(assert (=> d!143645 (= res!887552 (not lt!593028))))

(declare-fun lt!593029 () Bool)

(assert (=> d!143645 (= lt!593028 lt!593029)))

(declare-fun lt!593027 () Unit!43750)

(declare-fun e!761586 () Unit!43750)

(assert (=> d!143645 (= lt!593027 e!761586)))

(declare-fun c!126084 () Bool)

(assert (=> d!143645 (= c!126084 lt!593029)))

(assert (=> d!143645 (= lt!593029 (containsKey!737 (toList!10839 lt!592926) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143645 (= (contains!8935 lt!592926 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593028)))

(declare-fun b!1337477 () Bool)

(declare-fun lt!593030 () Unit!43750)

(assert (=> b!1337477 (= e!761586 lt!593030)))

(assert (=> b!1337477 (= lt!593030 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!592926) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1337477 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592926) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337478 () Bool)

(declare-fun Unit!43755 () Unit!43750)

(assert (=> b!1337478 (= e!761586 Unit!43755)))

(declare-fun b!1337479 () Bool)

(assert (=> b!1337479 (= e!761585 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592926) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143645 c!126084) b!1337477))

(assert (= (and d!143645 (not c!126084)) b!1337478))

(assert (= (and d!143645 (not res!887552)) b!1337479))

(declare-fun m!1225061 () Bool)

(assert (=> d!143645 m!1225061))

(declare-fun m!1225063 () Bool)

(assert (=> b!1337477 m!1225063))

(assert (=> b!1337477 m!1224951))

(assert (=> b!1337477 m!1224951))

(declare-fun m!1225065 () Bool)

(assert (=> b!1337477 m!1225065))

(assert (=> b!1337479 m!1224951))

(assert (=> b!1337479 m!1224951))

(assert (=> b!1337479 m!1225065))

(assert (=> d!143623 d!143645))

(declare-fun b!1337488 () Bool)

(declare-fun e!761591 () Option!771)

(assert (=> b!1337488 (= e!761591 (Some!770 (_2!12006 (h!32326 lt!592925))))))

(declare-fun e!761592 () Option!771)

(declare-fun b!1337490 () Bool)

(assert (=> b!1337490 (= e!761592 (getValueByKey!720 (t!45427 lt!592925) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337489 () Bool)

(assert (=> b!1337489 (= e!761591 e!761592)))

(declare-fun c!126090 () Bool)

(assert (=> b!1337489 (= c!126090 (and ((_ is Cons!31117) lt!592925) (not (= (_1!12006 (h!32326 lt!592925)) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!143647 () Bool)

(declare-fun c!126089 () Bool)

(assert (=> d!143647 (= c!126089 (and ((_ is Cons!31117) lt!592925) (= (_1!12006 (h!32326 lt!592925)) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143647 (= (getValueByKey!720 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!761591)))

(declare-fun b!1337491 () Bool)

(assert (=> b!1337491 (= e!761592 None!769)))

(assert (= (and d!143647 c!126089) b!1337488))

(assert (= (and d!143647 (not c!126089)) b!1337489))

(assert (= (and b!1337489 c!126090) b!1337490))

(assert (= (and b!1337489 (not c!126090)) b!1337491))

(declare-fun m!1225067 () Bool)

(assert (=> b!1337490 m!1225067))

(assert (=> d!143623 d!143647))

(declare-fun d!143649 () Bool)

(assert (=> d!143649 (= (getValueByKey!720 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!770 (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593033 () Unit!43750)

(declare-fun choose!1971 (List!31121 (_ BitVec 64) V!54377) Unit!43750)

(assert (=> d!143649 (= lt!593033 (choose!1971 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!761595 () Bool)

(assert (=> d!143649 e!761595))

(declare-fun res!887557 () Bool)

(assert (=> d!143649 (=> (not res!887557) (not e!761595))))

(declare-fun isStrictlySorted!876 (List!31121) Bool)

(assert (=> d!143649 (= res!887557 (isStrictlySorted!876 lt!592925))))

(assert (=> d!143649 (= (lemmaContainsTupThenGetReturnValue!363 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593033)))

(declare-fun b!1337496 () Bool)

(declare-fun res!887558 () Bool)

(assert (=> b!1337496 (=> (not res!887558) (not e!761595))))

(assert (=> b!1337496 (= res!887558 (containsKey!737 lt!592925 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337497 () Bool)

(assert (=> b!1337497 (= e!761595 (contains!8936 lt!592925 (tuple2!23991 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143649 res!887557) b!1337496))

(assert (= (and b!1337496 res!887558) b!1337497))

(assert (=> d!143649 m!1224945))

(declare-fun m!1225069 () Bool)

(assert (=> d!143649 m!1225069))

(declare-fun m!1225071 () Bool)

(assert (=> d!143649 m!1225071))

(declare-fun m!1225073 () Bool)

(assert (=> b!1337496 m!1225073))

(declare-fun m!1225075 () Bool)

(assert (=> b!1337497 m!1225075))

(assert (=> d!143623 d!143649))

(declare-fun d!143651 () Bool)

(declare-fun e!761607 () Bool)

(assert (=> d!143651 e!761607))

(declare-fun res!887564 () Bool)

(assert (=> d!143651 (=> (not res!887564) (not e!761607))))

(declare-fun lt!593036 () List!31121)

(assert (=> d!143651 (= res!887564 (isStrictlySorted!876 lt!593036))))

(declare-fun e!761610 () List!31121)

(assert (=> d!143651 (= lt!593036 e!761610)))

(declare-fun c!126100 () Bool)

(assert (=> d!143651 (= c!126100 (and ((_ is Cons!31117) (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!12006 (h!32326 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143651 (isStrictlySorted!876 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))))

(assert (=> d!143651 (= (insertStrictlySorted!492 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593036)))

(declare-fun b!1337518 () Bool)

(declare-fun call!64923 () List!31121)

(assert (=> b!1337518 (= e!761610 call!64923)))

(declare-fun b!1337519 () Bool)

(declare-fun res!887563 () Bool)

(assert (=> b!1337519 (=> (not res!887563) (not e!761607))))

(assert (=> b!1337519 (= res!887563 (containsKey!737 lt!593036 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337520 () Bool)

(declare-fun e!761609 () List!31121)

(declare-fun call!64924 () List!31121)

(assert (=> b!1337520 (= e!761609 call!64924)))

(declare-fun e!761606 () List!31121)

(declare-fun bm!64920 () Bool)

(declare-fun $colon$colon!673 (List!31121 tuple2!23990) List!31121)

(assert (=> bm!64920 (= call!64923 ($colon$colon!673 e!761606 (ite c!126100 (h!32326 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (tuple2!23991 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126102 () Bool)

(assert (=> bm!64920 (= c!126102 c!126100)))

(declare-fun b!1337521 () Bool)

(declare-fun c!126099 () Bool)

(declare-fun c!126101 () Bool)

(assert (=> b!1337521 (= e!761606 (ite c!126101 (t!45427 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (ite c!126099 (Cons!31117 (h!32326 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (t!45427 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) Nil!31118)))))

(declare-fun b!1337522 () Bool)

(assert (=> b!1337522 (= e!761607 (contains!8936 lt!593036 (tuple2!23991 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!64921 () Bool)

(declare-fun call!64925 () List!31121)

(assert (=> bm!64921 (= call!64925 call!64923)))

(declare-fun b!1337523 () Bool)

(assert (=> b!1337523 (= e!761609 call!64924)))

(declare-fun bm!64922 () Bool)

(assert (=> bm!64922 (= call!64924 call!64925)))

(declare-fun b!1337524 () Bool)

(assert (=> b!1337524 (= c!126099 (and ((_ is Cons!31117) (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvsgt (_1!12006 (h!32326 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!761608 () List!31121)

(assert (=> b!1337524 (= e!761608 e!761609)))

(declare-fun b!1337525 () Bool)

(assert (=> b!1337525 (= e!761606 (insertStrictlySorted!492 (t!45427 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337526 () Bool)

(assert (=> b!1337526 (= e!761608 call!64925)))

(declare-fun b!1337527 () Bool)

(assert (=> b!1337527 (= e!761610 e!761608)))

(assert (=> b!1337527 (= c!126101 (and ((_ is Cons!31117) (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!12006 (h!32326 (toList!10839 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143651 c!126100) b!1337518))

(assert (= (and d!143651 (not c!126100)) b!1337527))

(assert (= (and b!1337527 c!126101) b!1337526))

(assert (= (and b!1337527 (not c!126101)) b!1337524))

(assert (= (and b!1337524 c!126099) b!1337520))

(assert (= (and b!1337524 (not c!126099)) b!1337523))

(assert (= (or b!1337520 b!1337523) bm!64922))

(assert (= (or b!1337526 bm!64922) bm!64921))

(assert (= (or b!1337518 bm!64921) bm!64920))

(assert (= (and bm!64920 c!126102) b!1337525))

(assert (= (and bm!64920 (not c!126102)) b!1337521))

(assert (= (and d!143651 res!887564) b!1337519))

(assert (= (and b!1337519 res!887563) b!1337522))

(declare-fun m!1225077 () Bool)

(assert (=> b!1337519 m!1225077))

(declare-fun m!1225079 () Bool)

(assert (=> bm!64920 m!1225079))

(declare-fun m!1225081 () Bool)

(assert (=> d!143651 m!1225081))

(declare-fun m!1225083 () Bool)

(assert (=> d!143651 m!1225083))

(declare-fun m!1225085 () Bool)

(assert (=> b!1337525 m!1225085))

(declare-fun m!1225087 () Bool)

(assert (=> b!1337522 m!1225087))

(assert (=> d!143623 d!143651))

(declare-fun d!143653 () Bool)

(declare-fun isEmpty!1092 (Option!771) Bool)

(assert (=> d!143653 (= (isDefined!527 (getValueByKey!720 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1092 (getValueByKey!720 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38268 () Bool)

(assert (= bs!38268 d!143653))

(assert (=> bs!38268 m!1224991))

(declare-fun m!1225089 () Bool)

(assert (=> bs!38268 m!1225089))

(assert (=> b!1337378 d!143653))

(declare-fun e!761611 () Option!771)

(declare-fun b!1337528 () Bool)

(assert (=> b!1337528 (= e!761611 (Some!770 (_2!12006 (h!32326 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun b!1337530 () Bool)

(declare-fun e!761612 () Option!771)

(assert (=> b!1337530 (= e!761612 (getValueByKey!720 (t!45427 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1337529 () Bool)

(assert (=> b!1337529 (= e!761611 e!761612)))

(declare-fun c!126104 () Bool)

(assert (=> b!1337529 (= c!126104 (and ((_ is Cons!31117) (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!12006 (h!32326 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun c!126103 () Bool)

(declare-fun d!143655 () Bool)

(assert (=> d!143655 (= c!126103 (and ((_ is Cons!31117) (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12006 (h!32326 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143655 (= (getValueByKey!720 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!761611)))

(declare-fun b!1337531 () Bool)

(assert (=> b!1337531 (= e!761612 None!769)))

(assert (= (and d!143655 c!126103) b!1337528))

(assert (= (and d!143655 (not c!126103)) b!1337529))

(assert (= (and b!1337529 c!126104) b!1337530))

(assert (= (and b!1337529 (not c!126104)) b!1337531))

(declare-fun m!1225091 () Bool)

(assert (=> b!1337530 m!1225091))

(assert (=> b!1337378 d!143655))

(declare-fun d!143657 () Bool)

(declare-fun get!22122 (Option!771) V!54377)

(assert (=> d!143657 (= (apply!1027 lt!593016 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22122 (getValueByKey!720 (toList!10839 lt!593016) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38269 () Bool)

(assert (= bs!38269 d!143657))

(declare-fun m!1225093 () Bool)

(assert (=> bs!38269 m!1225093))

(assert (=> bs!38269 m!1225093))

(declare-fun m!1225095 () Bool)

(assert (=> bs!38269 m!1225095))

(assert (=> b!1337422 d!143657))

(declare-fun d!143659 () Bool)

(assert (=> d!143659 (isDefined!527 (getValueByKey!720 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!593039 () Unit!43750)

(declare-fun choose!1972 (List!31121 (_ BitVec 64)) Unit!43750)

(assert (=> d!143659 (= lt!593039 (choose!1972 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!761615 () Bool)

(assert (=> d!143659 e!761615))

(declare-fun res!887567 () Bool)

(assert (=> d!143659 (=> (not res!887567) (not e!761615))))

(assert (=> d!143659 (= res!887567 (isStrictlySorted!876 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!143659 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!593039)))

(declare-fun b!1337534 () Bool)

(assert (=> b!1337534 (= e!761615 (containsKey!737 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!143659 res!887567) b!1337534))

(assert (=> d!143659 m!1224991))

(assert (=> d!143659 m!1224991))

(assert (=> d!143659 m!1224993))

(declare-fun m!1225097 () Bool)

(assert (=> d!143659 m!1225097))

(declare-fun m!1225099 () Bool)

(assert (=> d!143659 m!1225099))

(assert (=> b!1337534 m!1224987))

(assert (=> b!1337376 d!143659))

(assert (=> b!1337376 d!143653))

(assert (=> b!1337376 d!143655))

(declare-fun d!143661 () Bool)

(declare-fun e!761616 () Bool)

(assert (=> d!143661 e!761616))

(declare-fun res!887568 () Bool)

(assert (=> d!143661 (=> (not res!887568) (not e!761616))))

(declare-fun lt!593043 () ListLongMap!21647)

(assert (=> d!143661 (= res!887568 (contains!8935 lt!593043 (_1!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593042 () List!31121)

(assert (=> d!143661 (= lt!593043 (ListLongMap!21648 lt!593042))))

(declare-fun lt!593040 () Unit!43750)

(declare-fun lt!593041 () Unit!43750)

(assert (=> d!143661 (= lt!593040 lt!593041)))

(assert (=> d!143661 (= (getValueByKey!720 lt!593042 (_1!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!770 (_2!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143661 (= lt!593041 (lemmaContainsTupThenGetReturnValue!363 lt!593042 (_1!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143661 (= lt!593042 (insertStrictlySorted!492 (toList!10839 (ite c!126075 call!64910 (ite c!126076 call!64906 call!64905))) (_1!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143661 (= (+!4769 (ite c!126075 call!64910 (ite c!126076 call!64906 call!64905)) (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593043)))

(declare-fun b!1337535 () Bool)

(declare-fun res!887569 () Bool)

(assert (=> b!1337535 (=> (not res!887569) (not e!761616))))

(assert (=> b!1337535 (= res!887569 (= (getValueByKey!720 (toList!10839 lt!593043) (_1!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!770 (_2!12006 (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1337536 () Bool)

(assert (=> b!1337536 (= e!761616 (contains!8936 (toList!10839 lt!593043) (ite (or c!126075 c!126076) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143661 res!887568) b!1337535))

(assert (= (and b!1337535 res!887569) b!1337536))

(declare-fun m!1225101 () Bool)

(assert (=> d!143661 m!1225101))

(declare-fun m!1225103 () Bool)

(assert (=> d!143661 m!1225103))

(declare-fun m!1225105 () Bool)

(assert (=> d!143661 m!1225105))

(declare-fun m!1225107 () Bool)

(assert (=> d!143661 m!1225107))

(declare-fun m!1225109 () Bool)

(assert (=> b!1337535 m!1225109))

(declare-fun m!1225111 () Bool)

(assert (=> b!1337536 m!1225111))

(assert (=> bm!64906 d!143661))

(assert (=> b!1337424 d!143643))

(declare-fun d!143663 () Bool)

(assert (=> d!143663 (= (apply!1027 lt!593016 (select (arr!43820 _keys!1590) from!1980)) (get!22122 (getValueByKey!720 (toList!10839 lt!593016) (select (arr!43820 _keys!1590) from!1980))))))

(declare-fun bs!38270 () Bool)

(assert (= bs!38270 d!143663))

(assert (=> bs!38270 m!1224865))

(declare-fun m!1225113 () Bool)

(assert (=> bs!38270 m!1225113))

(assert (=> bs!38270 m!1225113))

(declare-fun m!1225115 () Bool)

(assert (=> bs!38270 m!1225115))

(assert (=> b!1337441 d!143663))

(assert (=> b!1337441 d!143627))

(declare-fun d!143665 () Bool)

(declare-fun e!761617 () Bool)

(assert (=> d!143665 e!761617))

(declare-fun res!887570 () Bool)

(assert (=> d!143665 (=> (not res!887570) (not e!761617))))

(declare-fun lt!593047 () ListLongMap!21647)

(assert (=> d!143665 (= res!887570 (contains!8935 lt!593047 (_1!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593046 () List!31121)

(assert (=> d!143665 (= lt!593047 (ListLongMap!21648 lt!593046))))

(declare-fun lt!593044 () Unit!43750)

(declare-fun lt!593045 () Unit!43750)

(assert (=> d!143665 (= lt!593044 lt!593045)))

(assert (=> d!143665 (= (getValueByKey!720 lt!593046 (_1!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!770 (_2!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143665 (= lt!593045 (lemmaContainsTupThenGetReturnValue!363 lt!593046 (_1!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143665 (= lt!593046 (insertStrictlySorted!492 (toList!10839 call!64904) (_1!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143665 (= (+!4769 call!64904 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593047)))

(declare-fun b!1337537 () Bool)

(declare-fun res!887571 () Bool)

(assert (=> b!1337537 (=> (not res!887571) (not e!761617))))

(assert (=> b!1337537 (= res!887571 (= (getValueByKey!720 (toList!10839 lt!593047) (_1!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!770 (_2!12006 (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1337538 () Bool)

(assert (=> b!1337538 (= e!761617 (contains!8936 (toList!10839 lt!593047) (tuple2!23991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143665 res!887570) b!1337537))

(assert (= (and b!1337537 res!887571) b!1337538))

(declare-fun m!1225117 () Bool)

(assert (=> d!143665 m!1225117))

(declare-fun m!1225119 () Bool)

(assert (=> d!143665 m!1225119))

(declare-fun m!1225121 () Bool)

(assert (=> d!143665 m!1225121))

(declare-fun m!1225123 () Bool)

(assert (=> d!143665 m!1225123))

(declare-fun m!1225125 () Bool)

(assert (=> b!1337537 m!1225125))

(declare-fun m!1225127 () Bool)

(assert (=> b!1337538 m!1225127))

(assert (=> b!1337423 d!143665))

(declare-fun d!143667 () Bool)

(assert (=> d!143667 (= (validKeyInArray!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337455 d!143667))

(declare-fun d!143669 () Bool)

(declare-fun res!887576 () Bool)

(declare-fun e!761622 () Bool)

(assert (=> d!143669 (=> res!887576 e!761622)))

(assert (=> d!143669 (= res!887576 (and ((_ is Cons!31117) (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12006 (h!32326 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(assert (=> d!143669 (= (containsKey!737 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) e!761622)))

(declare-fun b!1337543 () Bool)

(declare-fun e!761623 () Bool)

(assert (=> b!1337543 (= e!761622 e!761623)))

(declare-fun res!887577 () Bool)

(assert (=> b!1337543 (=> (not res!887577) (not e!761623))))

(assert (=> b!1337543 (= res!887577 (and (or (not ((_ is Cons!31117) (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (bvsle (_1!12006 (h!32326 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)) ((_ is Cons!31117) (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12006 (h!32326 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(declare-fun b!1337544 () Bool)

(assert (=> b!1337544 (= e!761623 (containsKey!737 (t!45427 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1153))))

(assert (= (and d!143669 (not res!887576)) b!1337543))

(assert (= (and b!1337543 res!887577) b!1337544))

(declare-fun m!1225129 () Bool)

(assert (=> b!1337544 m!1225129))

(assert (=> d!143621 d!143669))

(declare-fun d!143671 () Bool)

(declare-fun e!761624 () Bool)

(assert (=> d!143671 e!761624))

(declare-fun res!887578 () Bool)

(assert (=> d!143671 (=> res!887578 e!761624)))

(declare-fun lt!593049 () Bool)

(assert (=> d!143671 (= res!887578 (not lt!593049))))

(declare-fun lt!593050 () Bool)

(assert (=> d!143671 (= lt!593049 lt!593050)))

(declare-fun lt!593048 () Unit!43750)

(declare-fun e!761625 () Unit!43750)

(assert (=> d!143671 (= lt!593048 e!761625)))

(declare-fun c!126105 () Bool)

(assert (=> d!143671 (= c!126105 lt!593050)))

(assert (=> d!143671 (= lt!593050 (containsKey!737 (toList!10839 lt!593016) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143671 (= (contains!8935 lt!593016 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593049)))

(declare-fun b!1337545 () Bool)

(declare-fun lt!593051 () Unit!43750)

(assert (=> b!1337545 (= e!761625 lt!593051)))

(assert (=> b!1337545 (= lt!593051 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!593016) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337545 (isDefined!527 (getValueByKey!720 (toList!10839 lt!593016) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337546 () Bool)

(declare-fun Unit!43756 () Unit!43750)

(assert (=> b!1337546 (= e!761625 Unit!43756)))

(declare-fun b!1337547 () Bool)

(assert (=> b!1337547 (= e!761624 (isDefined!527 (getValueByKey!720 (toList!10839 lt!593016) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143671 c!126105) b!1337545))

(assert (= (and d!143671 (not c!126105)) b!1337546))

(assert (= (and d!143671 (not res!887578)) b!1337547))

(declare-fun m!1225131 () Bool)

(assert (=> d!143671 m!1225131))

(declare-fun m!1225133 () Bool)

(assert (=> b!1337545 m!1225133))

(assert (=> b!1337545 m!1225093))

(assert (=> b!1337545 m!1225093))

(declare-fun m!1225135 () Bool)

(assert (=> b!1337545 m!1225135))

(assert (=> b!1337547 m!1225093))

(assert (=> b!1337547 m!1225093))

(assert (=> b!1337547 m!1225135))

(assert (=> bm!64901 d!143671))

(declare-fun d!143673 () Bool)

(declare-fun res!887581 () Bool)

(declare-fun e!761629 () Bool)

(assert (=> d!143673 (=> res!887581 e!761629)))

(assert (=> d!143673 (= res!887581 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(assert (=> d!143673 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126080 (Cons!31116 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) Nil!31117) Nil!31117)) e!761629)))

(declare-fun b!1337548 () Bool)

(declare-fun e!761626 () Bool)

(assert (=> b!1337548 (= e!761626 (contains!8937 (ite c!126080 (Cons!31116 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) Nil!31117) Nil!31117) (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337549 () Bool)

(declare-fun e!761628 () Bool)

(assert (=> b!1337549 (= e!761629 e!761628)))

(declare-fun res!887580 () Bool)

(assert (=> b!1337549 (=> (not res!887580) (not e!761628))))

(assert (=> b!1337549 (= res!887580 (not e!761626))))

(declare-fun res!887579 () Bool)

(assert (=> b!1337549 (=> (not res!887579) (not e!761626))))

(assert (=> b!1337549 (= res!887579 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337550 () Bool)

(declare-fun e!761627 () Bool)

(declare-fun call!64926 () Bool)

(assert (=> b!1337550 (= e!761627 call!64926)))

(declare-fun bm!64923 () Bool)

(declare-fun c!126106 () Bool)

(assert (=> bm!64923 (= call!64926 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126106 (Cons!31116 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126080 (Cons!31116 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) Nil!31117) Nil!31117)) (ite c!126080 (Cons!31116 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) Nil!31117) Nil!31117))))))

(declare-fun b!1337551 () Bool)

(assert (=> b!1337551 (= e!761628 e!761627)))

(assert (=> b!1337551 (= c!126106 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337552 () Bool)

(assert (=> b!1337552 (= e!761627 call!64926)))

(assert (= (and d!143673 (not res!887581)) b!1337549))

(assert (= (and b!1337549 res!887579) b!1337548))

(assert (= (and b!1337549 res!887580) b!1337551))

(assert (= (and b!1337551 c!126106) b!1337552))

(assert (= (and b!1337551 (not c!126106)) b!1337550))

(assert (= (or b!1337552 b!1337550) bm!64923))

(declare-fun m!1225137 () Bool)

(assert (=> b!1337548 m!1225137))

(assert (=> b!1337548 m!1225137))

(declare-fun m!1225139 () Bool)

(assert (=> b!1337548 m!1225139))

(assert (=> b!1337549 m!1225137))

(assert (=> b!1337549 m!1225137))

(declare-fun m!1225141 () Bool)

(assert (=> b!1337549 m!1225141))

(assert (=> bm!64923 m!1225137))

(declare-fun m!1225143 () Bool)

(assert (=> bm!64923 m!1225143))

(assert (=> b!1337551 m!1225137))

(assert (=> b!1337551 m!1225137))

(assert (=> b!1337551 m!1225141))

(assert (=> bm!64910 d!143673))

(declare-fun d!143675 () Bool)

(declare-fun e!761630 () Bool)

(assert (=> d!143675 e!761630))

(declare-fun res!887582 () Bool)

(assert (=> d!143675 (=> res!887582 e!761630)))

(declare-fun lt!593053 () Bool)

(assert (=> d!143675 (= res!887582 (not lt!593053))))

(declare-fun lt!593054 () Bool)

(assert (=> d!143675 (= lt!593053 lt!593054)))

(declare-fun lt!593052 () Unit!43750)

(declare-fun e!761631 () Unit!43750)

(assert (=> d!143675 (= lt!593052 e!761631)))

(declare-fun c!126107 () Bool)

(assert (=> d!143675 (= c!126107 lt!593054)))

(assert (=> d!143675 (= lt!593054 (containsKey!737 (toList!10839 lt!593016) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143675 (= (contains!8935 lt!593016 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593053)))

(declare-fun b!1337553 () Bool)

(declare-fun lt!593055 () Unit!43750)

(assert (=> b!1337553 (= e!761631 lt!593055)))

(assert (=> b!1337553 (= lt!593055 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!593016) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337553 (isDefined!527 (getValueByKey!720 (toList!10839 lt!593016) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337554 () Bool)

(declare-fun Unit!43757 () Unit!43750)

(assert (=> b!1337554 (= e!761631 Unit!43757)))

(declare-fun b!1337555 () Bool)

(assert (=> b!1337555 (= e!761630 (isDefined!527 (getValueByKey!720 (toList!10839 lt!593016) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143675 c!126107) b!1337553))

(assert (= (and d!143675 (not c!126107)) b!1337554))

(assert (= (and d!143675 (not res!887582)) b!1337555))

(declare-fun m!1225145 () Bool)

(assert (=> d!143675 m!1225145))

(declare-fun m!1225147 () Bool)

(assert (=> b!1337553 m!1225147))

(declare-fun m!1225149 () Bool)

(assert (=> b!1337553 m!1225149))

(assert (=> b!1337553 m!1225149))

(declare-fun m!1225151 () Bool)

(assert (=> b!1337553 m!1225151))

(assert (=> b!1337555 m!1225149))

(assert (=> b!1337555 m!1225149))

(assert (=> b!1337555 m!1225151))

(assert (=> bm!64903 d!143675))

(assert (=> b!1337453 d!143667))

(declare-fun d!143677 () Bool)

(assert (=> d!143677 (not (contains!8935 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944)) lt!592943))))

(declare-fun lt!593058 () Unit!43750)

(declare-fun choose!1973 (ListLongMap!21647 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43750)

(assert (=> d!143677 (= lt!593058 (choose!1973 lt!592946 lt!592947 lt!592944 lt!592943))))

(declare-fun e!761634 () Bool)

(assert (=> d!143677 e!761634))

(declare-fun res!887585 () Bool)

(assert (=> d!143677 (=> (not res!887585) (not e!761634))))

(assert (=> d!143677 (= res!887585 (not (contains!8935 lt!592946 lt!592943)))))

(assert (=> d!143677 (= (addStillNotContains!486 lt!592946 lt!592947 lt!592944 lt!592943) lt!593058)))

(declare-fun b!1337559 () Bool)

(assert (=> b!1337559 (= e!761634 (not (= lt!592947 lt!592943)))))

(assert (= (and d!143677 res!887585) b!1337559))

(assert (=> d!143677 m!1224965))

(assert (=> d!143677 m!1224965))

(assert (=> d!143677 m!1224967))

(declare-fun m!1225153 () Bool)

(assert (=> d!143677 m!1225153))

(declare-fun m!1225155 () Bool)

(assert (=> d!143677 m!1225155))

(assert (=> b!1337367 d!143677))

(declare-fun d!143679 () Bool)

(declare-fun e!761635 () Bool)

(assert (=> d!143679 e!761635))

(declare-fun res!887586 () Bool)

(assert (=> d!143679 (=> (not res!887586) (not e!761635))))

(declare-fun lt!593062 () ListLongMap!21647)

(assert (=> d!143679 (= res!887586 (contains!8935 lt!593062 (_1!12006 (tuple2!23991 lt!592947 lt!592944))))))

(declare-fun lt!593061 () List!31121)

(assert (=> d!143679 (= lt!593062 (ListLongMap!21648 lt!593061))))

(declare-fun lt!593059 () Unit!43750)

(declare-fun lt!593060 () Unit!43750)

(assert (=> d!143679 (= lt!593059 lt!593060)))

(assert (=> d!143679 (= (getValueByKey!720 lt!593061 (_1!12006 (tuple2!23991 lt!592947 lt!592944))) (Some!770 (_2!12006 (tuple2!23991 lt!592947 lt!592944))))))

(assert (=> d!143679 (= lt!593060 (lemmaContainsTupThenGetReturnValue!363 lt!593061 (_1!12006 (tuple2!23991 lt!592947 lt!592944)) (_2!12006 (tuple2!23991 lt!592947 lt!592944))))))

(assert (=> d!143679 (= lt!593061 (insertStrictlySorted!492 (toList!10839 lt!592946) (_1!12006 (tuple2!23991 lt!592947 lt!592944)) (_2!12006 (tuple2!23991 lt!592947 lt!592944))))))

(assert (=> d!143679 (= (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944)) lt!593062)))

(declare-fun b!1337560 () Bool)

(declare-fun res!887587 () Bool)

(assert (=> b!1337560 (=> (not res!887587) (not e!761635))))

(assert (=> b!1337560 (= res!887587 (= (getValueByKey!720 (toList!10839 lt!593062) (_1!12006 (tuple2!23991 lt!592947 lt!592944))) (Some!770 (_2!12006 (tuple2!23991 lt!592947 lt!592944)))))))

(declare-fun b!1337561 () Bool)

(assert (=> b!1337561 (= e!761635 (contains!8936 (toList!10839 lt!593062) (tuple2!23991 lt!592947 lt!592944)))))

(assert (= (and d!143679 res!887586) b!1337560))

(assert (= (and b!1337560 res!887587) b!1337561))

(declare-fun m!1225157 () Bool)

(assert (=> d!143679 m!1225157))

(declare-fun m!1225159 () Bool)

(assert (=> d!143679 m!1225159))

(declare-fun m!1225161 () Bool)

(assert (=> d!143679 m!1225161))

(declare-fun m!1225163 () Bool)

(assert (=> d!143679 m!1225163))

(declare-fun m!1225165 () Bool)

(assert (=> b!1337560 m!1225165))

(declare-fun m!1225167 () Bool)

(assert (=> b!1337561 m!1225167))

(assert (=> b!1337367 d!143679))

(declare-fun d!143681 () Bool)

(declare-fun e!761636 () Bool)

(assert (=> d!143681 e!761636))

(declare-fun res!887588 () Bool)

(assert (=> d!143681 (=> res!887588 e!761636)))

(declare-fun lt!593064 () Bool)

(assert (=> d!143681 (= res!887588 (not lt!593064))))

(declare-fun lt!593065 () Bool)

(assert (=> d!143681 (= lt!593064 lt!593065)))

(declare-fun lt!593063 () Unit!43750)

(declare-fun e!761637 () Unit!43750)

(assert (=> d!143681 (= lt!593063 e!761637)))

(declare-fun c!126108 () Bool)

(assert (=> d!143681 (= c!126108 lt!593065)))

(assert (=> d!143681 (= lt!593065 (containsKey!737 (toList!10839 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944))) lt!592943))))

(assert (=> d!143681 (= (contains!8935 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944)) lt!592943) lt!593064)))

(declare-fun b!1337562 () Bool)

(declare-fun lt!593066 () Unit!43750)

(assert (=> b!1337562 (= e!761637 lt!593066)))

(assert (=> b!1337562 (= lt!593066 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944))) lt!592943))))

(assert (=> b!1337562 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944))) lt!592943))))

(declare-fun b!1337563 () Bool)

(declare-fun Unit!43758 () Unit!43750)

(assert (=> b!1337563 (= e!761637 Unit!43758)))

(declare-fun b!1337564 () Bool)

(assert (=> b!1337564 (= e!761636 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 lt!592946 (tuple2!23991 lt!592947 lt!592944))) lt!592943)))))

(assert (= (and d!143681 c!126108) b!1337562))

(assert (= (and d!143681 (not c!126108)) b!1337563))

(assert (= (and d!143681 (not res!887588)) b!1337564))

(declare-fun m!1225169 () Bool)

(assert (=> d!143681 m!1225169))

(declare-fun m!1225171 () Bool)

(assert (=> b!1337562 m!1225171))

(declare-fun m!1225173 () Bool)

(assert (=> b!1337562 m!1225173))

(assert (=> b!1337562 m!1225173))

(declare-fun m!1225175 () Bool)

(assert (=> b!1337562 m!1225175))

(assert (=> b!1337564 m!1225173))

(assert (=> b!1337564 m!1225173))

(assert (=> b!1337564 m!1225175))

(assert (=> b!1337367 d!143681))

(declare-fun d!143683 () Bool)

(declare-fun c!126109 () Bool)

(assert (=> d!143683 (= c!126109 ((_ is ValueCellFull!17579) (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!761638 () V!54377)

(assert (=> d!143683 (= (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761638)))

(declare-fun b!1337565 () Bool)

(assert (=> b!1337565 (= e!761638 (get!22120 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337566 () Bool)

(assert (=> b!1337566 (= e!761638 (get!22121 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143683 c!126109) b!1337565))

(assert (= (and d!143683 (not c!126109)) b!1337566))

(assert (=> b!1337565 m!1224969))

(assert (=> b!1337565 m!1224853))

(declare-fun m!1225177 () Bool)

(assert (=> b!1337565 m!1225177))

(assert (=> b!1337566 m!1224969))

(assert (=> b!1337566 m!1224853))

(declare-fun m!1225179 () Bool)

(assert (=> b!1337566 m!1225179))

(assert (=> b!1337367 d!143683))

(declare-fun d!143685 () Bool)

(declare-fun e!761639 () Bool)

(assert (=> d!143685 e!761639))

(declare-fun res!887589 () Bool)

(assert (=> d!143685 (=> (not res!887589) (not e!761639))))

(declare-fun lt!593070 () ListLongMap!21647)

(assert (=> d!143685 (= res!887589 (contains!8935 lt!593070 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593069 () List!31121)

(assert (=> d!143685 (= lt!593070 (ListLongMap!21648 lt!593069))))

(declare-fun lt!593067 () Unit!43750)

(declare-fun lt!593068 () Unit!43750)

(assert (=> d!143685 (= lt!593067 lt!593068)))

(assert (=> d!143685 (= (getValueByKey!720 lt!593069 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!770 (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143685 (= lt!593068 (lemmaContainsTupThenGetReturnValue!363 lt!593069 (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143685 (= lt!593069 (insertStrictlySorted!492 (toList!10839 call!64889) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143685 (= (+!4769 call!64889 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593070)))

(declare-fun b!1337567 () Bool)

(declare-fun res!887590 () Bool)

(assert (=> b!1337567 (=> (not res!887590) (not e!761639))))

(assert (=> b!1337567 (= res!887590 (= (getValueByKey!720 (toList!10839 lt!593070) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!770 (_2!12006 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337568 () Bool)

(assert (=> b!1337568 (= e!761639 (contains!8936 (toList!10839 lt!593070) (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143685 res!887589) b!1337567))

(assert (= (and b!1337567 res!887590) b!1337568))

(declare-fun m!1225181 () Bool)

(assert (=> d!143685 m!1225181))

(declare-fun m!1225183 () Bool)

(assert (=> d!143685 m!1225183))

(declare-fun m!1225185 () Bool)

(assert (=> d!143685 m!1225185))

(declare-fun m!1225187 () Bool)

(assert (=> d!143685 m!1225187))

(declare-fun m!1225189 () Bool)

(assert (=> b!1337567 m!1225189))

(declare-fun m!1225191 () Bool)

(assert (=> b!1337568 m!1225191))

(assert (=> b!1337367 d!143685))

(declare-fun d!143687 () Bool)

(declare-fun res!887591 () Bool)

(declare-fun e!761640 () Bool)

(assert (=> d!143687 (=> res!887591 e!761640)))

(assert (=> d!143687 (= res!887591 (and ((_ is Cons!31117) (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!12006 (h!32326 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143687 (= (containsKey!737 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!761640)))

(declare-fun b!1337569 () Bool)

(declare-fun e!761641 () Bool)

(assert (=> b!1337569 (= e!761640 e!761641)))

(declare-fun res!887592 () Bool)

(assert (=> b!1337569 (=> (not res!887592) (not e!761641))))

(assert (=> b!1337569 (= res!887592 (and (or (not ((_ is Cons!31117) (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!12006 (h!32326 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31117) (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!12006 (h!32326 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1337570 () Bool)

(assert (=> b!1337570 (= e!761641 (containsKey!737 (t!45427 (toList!10839 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!143687 (not res!887591)) b!1337569))

(assert (= (and b!1337569 res!887592) b!1337570))

(declare-fun m!1225193 () Bool)

(assert (=> b!1337570 m!1225193))

(assert (=> d!143629 d!143687))

(declare-fun b!1337571 () Bool)

(declare-fun e!761646 () Bool)

(declare-fun e!761642 () Bool)

(assert (=> b!1337571 (= e!761646 e!761642)))

(declare-fun c!126111 () Bool)

(declare-fun e!761643 () Bool)

(assert (=> b!1337571 (= c!126111 e!761643)))

(declare-fun res!887596 () Bool)

(assert (=> b!1337571 (=> (not res!887596) (not e!761643))))

(assert (=> b!1337571 (= res!887596 (bvslt from!1980 (size!44372 _keys!1590)))))

(declare-fun d!143689 () Bool)

(assert (=> d!143689 e!761646))

(declare-fun res!887594 () Bool)

(assert (=> d!143689 (=> (not res!887594) (not e!761646))))

(declare-fun lt!593072 () ListLongMap!21647)

(assert (=> d!143689 (= res!887594 (not (contains!8935 lt!593072 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!761648 () ListLongMap!21647)

(assert (=> d!143689 (= lt!593072 e!761648)))

(declare-fun c!126110 () Bool)

(assert (=> d!143689 (= c!126110 (bvsge from!1980 (size!44372 _keys!1590)))))

(assert (=> d!143689 (validMask!0 mask!1998)))

(assert (=> d!143689 (= (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593072)))

(declare-fun b!1337572 () Bool)

(declare-fun e!761644 () ListLongMap!21647)

(assert (=> b!1337572 (= e!761648 e!761644)))

(declare-fun c!126112 () Bool)

(assert (=> b!1337572 (= c!126112 (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)))))

(declare-fun b!1337573 () Bool)

(declare-fun e!761645 () Bool)

(assert (=> b!1337573 (= e!761642 e!761645)))

(assert (=> b!1337573 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)))))

(declare-fun res!887595 () Bool)

(assert (=> b!1337573 (= res!887595 (contains!8935 lt!593072 (select (arr!43820 _keys!1590) from!1980)))))

(assert (=> b!1337573 (=> (not res!887595) (not e!761645))))

(declare-fun b!1337574 () Bool)

(declare-fun e!761647 () Bool)

(assert (=> b!1337574 (= e!761647 (isEmpty!1091 lt!593072))))

(declare-fun b!1337575 () Bool)

(assert (=> b!1337575 (= e!761643 (validKeyInArray!0 (select (arr!43820 _keys!1590) from!1980)))))

(assert (=> b!1337575 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1337576 () Bool)

(assert (=> b!1337576 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44372 _keys!1590)))))

(assert (=> b!1337576 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44373 _values!1320)))))

(assert (=> b!1337576 (= e!761645 (= (apply!1027 lt!593072 (select (arr!43820 _keys!1590) from!1980)) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337577 () Bool)

(declare-fun res!887593 () Bool)

(assert (=> b!1337577 (=> (not res!887593) (not e!761646))))

(assert (=> b!1337577 (= res!887593 (not (contains!8935 lt!593072 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!64927 () ListLongMap!21647)

(declare-fun bm!64924 () Bool)

(assert (=> bm!64924 (= call!64927 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337578 () Bool)

(assert (=> b!1337578 (= e!761648 (ListLongMap!21648 Nil!31118))))

(declare-fun b!1337579 () Bool)

(assert (=> b!1337579 (= e!761647 (= lt!593072 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337580 () Bool)

(declare-fun lt!593075 () Unit!43750)

(declare-fun lt!593071 () Unit!43750)

(assert (=> b!1337580 (= lt!593075 lt!593071)))

(declare-fun lt!593077 () (_ BitVec 64))

(declare-fun lt!593073 () (_ BitVec 64))

(declare-fun lt!593076 () ListLongMap!21647)

(declare-fun lt!593074 () V!54377)

(assert (=> b!1337580 (not (contains!8935 (+!4769 lt!593076 (tuple2!23991 lt!593077 lt!593074)) lt!593073))))

(assert (=> b!1337580 (= lt!593071 (addStillNotContains!486 lt!593076 lt!593077 lt!593074 lt!593073))))

(assert (=> b!1337580 (= lt!593073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337580 (= lt!593074 (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337580 (= lt!593077 (select (arr!43820 _keys!1590) from!1980))))

(assert (=> b!1337580 (= lt!593076 call!64927)))

(assert (=> b!1337580 (= e!761644 (+!4769 call!64927 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337581 () Bool)

(assert (=> b!1337581 (= e!761642 e!761647)))

(declare-fun c!126113 () Bool)

(assert (=> b!1337581 (= c!126113 (bvslt from!1980 (size!44372 _keys!1590)))))

(declare-fun b!1337582 () Bool)

(assert (=> b!1337582 (= e!761644 call!64927)))

(assert (= (and d!143689 c!126110) b!1337578))

(assert (= (and d!143689 (not c!126110)) b!1337572))

(assert (= (and b!1337572 c!126112) b!1337580))

(assert (= (and b!1337572 (not c!126112)) b!1337582))

(assert (= (or b!1337580 b!1337582) bm!64924))

(assert (= (and d!143689 res!887594) b!1337577))

(assert (= (and b!1337577 res!887593) b!1337571))

(assert (= (and b!1337571 res!887596) b!1337575))

(assert (= (and b!1337571 c!126111) b!1337573))

(assert (= (and b!1337571 (not c!126111)) b!1337581))

(assert (= (and b!1337573 res!887595) b!1337576))

(assert (= (and b!1337581 c!126113) b!1337579))

(assert (= (and b!1337581 (not c!126113)) b!1337574))

(declare-fun b_lambda!24219 () Bool)

(assert (=> (not b_lambda!24219) (not b!1337576)))

(assert (=> b!1337576 t!45425))

(declare-fun b_and!50023 () Bool)

(assert (= b_and!50021 (and (=> t!45425 result!25301) b_and!50023)))

(declare-fun b_lambda!24221 () Bool)

(assert (=> (not b_lambda!24221) (not b!1337580)))

(assert (=> b!1337580 t!45425))

(declare-fun b_and!50025 () Bool)

(assert (= b_and!50023 (and (=> t!45425 result!25301) b_and!50025)))

(assert (=> b!1337572 m!1224865))

(assert (=> b!1337572 m!1224865))

(assert (=> b!1337572 m!1224867))

(declare-fun m!1225195 () Bool)

(assert (=> b!1337574 m!1225195))

(assert (=> b!1337573 m!1224865))

(assert (=> b!1337573 m!1224865))

(declare-fun m!1225197 () Bool)

(assert (=> b!1337573 m!1225197))

(assert (=> b!1337580 m!1224853))

(assert (=> b!1337580 m!1224865))

(declare-fun m!1225199 () Bool)

(assert (=> b!1337580 m!1225199))

(declare-fun m!1225201 () Bool)

(assert (=> b!1337580 m!1225201))

(declare-fun m!1225203 () Bool)

(assert (=> b!1337580 m!1225203))

(assert (=> b!1337580 m!1224859))

(assert (=> b!1337580 m!1225201))

(assert (=> b!1337580 m!1224859))

(assert (=> b!1337580 m!1224853))

(assert (=> b!1337580 m!1224861))

(declare-fun m!1225205 () Bool)

(assert (=> b!1337580 m!1225205))

(declare-fun m!1225207 () Bool)

(assert (=> bm!64924 m!1225207))

(assert (=> b!1337576 m!1224853))

(assert (=> b!1337576 m!1224865))

(assert (=> b!1337576 m!1224859))

(assert (=> b!1337576 m!1224865))

(declare-fun m!1225209 () Bool)

(assert (=> b!1337576 m!1225209))

(assert (=> b!1337576 m!1224859))

(assert (=> b!1337576 m!1224853))

(assert (=> b!1337576 m!1224861))

(declare-fun m!1225211 () Bool)

(assert (=> d!143689 m!1225211))

(assert (=> d!143689 m!1224841))

(assert (=> b!1337575 m!1224865))

(assert (=> b!1337575 m!1224865))

(assert (=> b!1337575 m!1224867))

(assert (=> b!1337579 m!1225207))

(declare-fun m!1225213 () Bool)

(assert (=> b!1337577 m!1225213))

(assert (=> bm!64904 d!143689))

(declare-fun d!143691 () Bool)

(assert (=> d!143691 (= (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153)) (not (isEmpty!1092 (getValueByKey!720 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))))

(declare-fun bs!38271 () Bool)

(assert (= bs!38271 d!143691))

(assert (=> bs!38271 m!1224939))

(declare-fun m!1225215 () Bool)

(assert (=> bs!38271 m!1225215))

(assert (=> b!1337327 d!143691))

(declare-fun b!1337583 () Bool)

(declare-fun e!761649 () Option!771)

(assert (=> b!1337583 (= e!761649 (Some!770 (_2!12006 (h!32326 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun e!761650 () Option!771)

(declare-fun b!1337585 () Bool)

(assert (=> b!1337585 (= e!761650 (getValueByKey!720 (t!45427 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1153))))

(declare-fun b!1337584 () Bool)

(assert (=> b!1337584 (= e!761649 e!761650)))

(declare-fun c!126115 () Bool)

(assert (=> b!1337584 (= c!126115 (and ((_ is Cons!31117) (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (not (= (_1!12006 (h!32326 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153))))))

(declare-fun d!143693 () Bool)

(declare-fun c!126114 () Bool)

(assert (=> d!143693 (= c!126114 (and ((_ is Cons!31117) (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12006 (h!32326 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(assert (=> d!143693 (= (getValueByKey!720 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) e!761649)))

(declare-fun b!1337586 () Bool)

(assert (=> b!1337586 (= e!761650 None!769)))

(assert (= (and d!143693 c!126114) b!1337583))

(assert (= (and d!143693 (not c!126114)) b!1337584))

(assert (= (and b!1337584 c!126115) b!1337585))

(assert (= (and b!1337584 (not c!126115)) b!1337586))

(declare-fun m!1225217 () Bool)

(assert (=> b!1337585 m!1225217))

(assert (=> b!1337327 d!143693))

(declare-fun b!1337587 () Bool)

(declare-fun e!761655 () Bool)

(declare-fun e!761651 () Bool)

(assert (=> b!1337587 (= e!761655 e!761651)))

(declare-fun c!126117 () Bool)

(declare-fun e!761652 () Bool)

(assert (=> b!1337587 (= c!126117 e!761652)))

(declare-fun res!887600 () Bool)

(assert (=> b!1337587 (=> (not res!887600) (not e!761652))))

(assert (=> b!1337587 (= res!887600 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(declare-fun d!143695 () Bool)

(assert (=> d!143695 e!761655))

(declare-fun res!887598 () Bool)

(assert (=> d!143695 (=> (not res!887598) (not e!761655))))

(declare-fun lt!593079 () ListLongMap!21647)

(assert (=> d!143695 (= res!887598 (not (contains!8935 lt!593079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!761657 () ListLongMap!21647)

(assert (=> d!143695 (= lt!593079 e!761657)))

(declare-fun c!126116 () Bool)

(assert (=> d!143695 (= c!126116 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(assert (=> d!143695 (validMask!0 mask!1998)))

(assert (=> d!143695 (= (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323) lt!593079)))

(declare-fun b!1337588 () Bool)

(declare-fun e!761653 () ListLongMap!21647)

(assert (=> b!1337588 (= e!761657 e!761653)))

(declare-fun c!126118 () Bool)

(assert (=> b!1337588 (= c!126118 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(declare-fun b!1337589 () Bool)

(declare-fun e!761654 () Bool)

(assert (=> b!1337589 (= e!761651 e!761654)))

(assert (=> b!1337589 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(declare-fun res!887599 () Bool)

(assert (=> b!1337589 (= res!887599 (contains!8935 lt!593079 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1337589 (=> (not res!887599) (not e!761654))))

(declare-fun b!1337590 () Bool)

(declare-fun e!761656 () Bool)

(assert (=> b!1337590 (= e!761656 (isEmpty!1091 lt!593079))))

(declare-fun b!1337591 () Bool)

(assert (=> b!1337591 (= e!761652 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1337591 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1337592 () Bool)

(assert (=> b!1337592 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(assert (=> b!1337592 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44373 _values!1320)))))

(assert (=> b!1337592 (= e!761654 (= (apply!1027 lt!593079 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337593 () Bool)

(declare-fun res!887597 () Bool)

(assert (=> b!1337593 (=> (not res!887597) (not e!761655))))

(assert (=> b!1337593 (= res!887597 (not (contains!8935 lt!593079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!64928 () ListLongMap!21647)

(declare-fun bm!64925 () Bool)

(assert (=> bm!64925 (= call!64928 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337594 () Bool)

(assert (=> b!1337594 (= e!761657 (ListLongMap!21648 Nil!31118))))

(declare-fun b!1337595 () Bool)

(assert (=> b!1337595 (= e!761656 (= lt!593079 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337596 () Bool)

(declare-fun lt!593082 () Unit!43750)

(declare-fun lt!593078 () Unit!43750)

(assert (=> b!1337596 (= lt!593082 lt!593078)))

(declare-fun lt!593083 () ListLongMap!21647)

(declare-fun lt!593080 () (_ BitVec 64))

(declare-fun lt!593081 () V!54377)

(declare-fun lt!593084 () (_ BitVec 64))

(assert (=> b!1337596 (not (contains!8935 (+!4769 lt!593083 (tuple2!23991 lt!593084 lt!593081)) lt!593080))))

(assert (=> b!1337596 (= lt!593078 (addStillNotContains!486 lt!593083 lt!593084 lt!593081 lt!593080))))

(assert (=> b!1337596 (= lt!593080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337596 (= lt!593081 (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337596 (= lt!593084 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)))))

(assert (=> b!1337596 (= lt!593083 call!64928)))

(assert (=> b!1337596 (= e!761653 (+!4769 call!64928 (tuple2!23991 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (get!22119 (select (arr!43821 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337597 () Bool)

(assert (=> b!1337597 (= e!761651 e!761656)))

(declare-fun c!126119 () Bool)

(assert (=> b!1337597 (= c!126119 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(declare-fun b!1337598 () Bool)

(assert (=> b!1337598 (= e!761653 call!64928)))

(assert (= (and d!143695 c!126116) b!1337594))

(assert (= (and d!143695 (not c!126116)) b!1337588))

(assert (= (and b!1337588 c!126118) b!1337596))

(assert (= (and b!1337588 (not c!126118)) b!1337598))

(assert (= (or b!1337596 b!1337598) bm!64925))

(assert (= (and d!143695 res!887598) b!1337593))

(assert (= (and b!1337593 res!887597) b!1337587))

(assert (= (and b!1337587 res!887600) b!1337591))

(assert (= (and b!1337587 c!126117) b!1337589))

(assert (= (and b!1337587 (not c!126117)) b!1337597))

(assert (= (and b!1337589 res!887599) b!1337592))

(assert (= (and b!1337597 c!126119) b!1337595))

(assert (= (and b!1337597 (not c!126119)) b!1337590))

(declare-fun b_lambda!24223 () Bool)

(assert (=> (not b_lambda!24223) (not b!1337592)))

(assert (=> b!1337592 t!45425))

(declare-fun b_and!50027 () Bool)

(assert (= b_and!50025 (and (=> t!45425 result!25301) b_and!50027)))

(declare-fun b_lambda!24225 () Bool)

(assert (=> (not b_lambda!24225) (not b!1337596)))

(assert (=> b!1337596 t!45425))

(declare-fun b_and!50029 () Bool)

(assert (= b_and!50027 (and (=> t!45425 result!25301) b_and!50029)))

(declare-fun m!1225219 () Bool)

(assert (=> b!1337588 m!1225219))

(assert (=> b!1337588 m!1225219))

(declare-fun m!1225221 () Bool)

(assert (=> b!1337588 m!1225221))

(declare-fun m!1225223 () Bool)

(assert (=> b!1337590 m!1225223))

(assert (=> b!1337589 m!1225219))

(assert (=> b!1337589 m!1225219))

(declare-fun m!1225225 () Bool)

(assert (=> b!1337589 m!1225225))

(assert (=> b!1337596 m!1224853))

(assert (=> b!1337596 m!1225219))

(declare-fun m!1225227 () Bool)

(assert (=> b!1337596 m!1225227))

(declare-fun m!1225229 () Bool)

(assert (=> b!1337596 m!1225229))

(declare-fun m!1225231 () Bool)

(assert (=> b!1337596 m!1225231))

(declare-fun m!1225233 () Bool)

(assert (=> b!1337596 m!1225233))

(assert (=> b!1337596 m!1225229))

(assert (=> b!1337596 m!1225233))

(assert (=> b!1337596 m!1224853))

(declare-fun m!1225235 () Bool)

(assert (=> b!1337596 m!1225235))

(declare-fun m!1225237 () Bool)

(assert (=> b!1337596 m!1225237))

(declare-fun m!1225239 () Bool)

(assert (=> bm!64925 m!1225239))

(assert (=> b!1337592 m!1224853))

(assert (=> b!1337592 m!1225219))

(assert (=> b!1337592 m!1225233))

(assert (=> b!1337592 m!1225219))

(declare-fun m!1225241 () Bool)

(assert (=> b!1337592 m!1225241))

(assert (=> b!1337592 m!1225233))

(assert (=> b!1337592 m!1224853))

(assert (=> b!1337592 m!1225235))

(declare-fun m!1225243 () Bool)

(assert (=> d!143695 m!1225243))

(assert (=> d!143695 m!1224841))

(assert (=> b!1337591 m!1225219))

(assert (=> b!1337591 m!1225219))

(assert (=> b!1337591 m!1225221))

(assert (=> b!1337595 m!1225239))

(declare-fun m!1225245 () Bool)

(assert (=> b!1337593 m!1225245))

(assert (=> b!1337366 d!143695))

(declare-fun d!143697 () Bool)

(assert (=> d!143697 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun lt!593085 () Unit!43750)

(assert (=> d!143697 (= lt!593085 (choose!1972 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun e!761658 () Bool)

(assert (=> d!143697 e!761658))

(declare-fun res!887601 () Bool)

(assert (=> d!143697 (=> (not res!887601) (not e!761658))))

(assert (=> d!143697 (= res!887601 (isStrictlySorted!876 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143697 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) lt!593085)))

(declare-fun b!1337599 () Bool)

(assert (=> b!1337599 (= e!761658 (containsKey!737 (toList!10839 (+!4769 (getCurrentListMapNoExtraKeys!6412 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (= (and d!143697 res!887601) b!1337599))

(assert (=> d!143697 m!1224939))

(assert (=> d!143697 m!1224939))

(assert (=> d!143697 m!1224941))

(declare-fun m!1225247 () Bool)

(assert (=> d!143697 m!1225247))

(declare-fun m!1225249 () Bool)

(assert (=> d!143697 m!1225249))

(assert (=> b!1337599 m!1224935))

(assert (=> b!1337325 d!143697))

(assert (=> b!1337325 d!143691))

(assert (=> b!1337325 d!143693))

(declare-fun d!143699 () Bool)

(declare-fun lt!593088 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!657 (List!31120) (InoxSet (_ BitVec 64)))

(assert (=> d!143699 (= lt!593088 (select (content!657 Nil!31117) (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!761664 () Bool)

(assert (=> d!143699 (= lt!593088 e!761664)))

(declare-fun res!887607 () Bool)

(assert (=> d!143699 (=> (not res!887607) (not e!761664))))

(assert (=> d!143699 (= res!887607 ((_ is Cons!31116) Nil!31117))))

(assert (=> d!143699 (= (contains!8937 Nil!31117 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)) lt!593088)))

(declare-fun b!1337604 () Bool)

(declare-fun e!761663 () Bool)

(assert (=> b!1337604 (= e!761664 e!761663)))

(declare-fun res!887606 () Bool)

(assert (=> b!1337604 (=> res!887606 e!761663)))

(assert (=> b!1337604 (= res!887606 (= (h!32325 Nil!31117) (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337605 () Bool)

(assert (=> b!1337605 (= e!761663 (contains!8937 (t!45426 Nil!31117) (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143699 res!887607) b!1337604))

(assert (= (and b!1337604 (not res!887606)) b!1337605))

(declare-fun m!1225251 () Bool)

(assert (=> d!143699 m!1225251))

(assert (=> d!143699 m!1225043))

(declare-fun m!1225253 () Bool)

(assert (=> d!143699 m!1225253))

(assert (=> b!1337605 m!1225043))

(declare-fun m!1225255 () Bool)

(assert (=> b!1337605 m!1225255))

(assert (=> b!1337452 d!143699))

(declare-fun d!143701 () Bool)

(declare-fun lt!593091 () Bool)

(declare-fun content!658 (List!31121) (InoxSet tuple2!23990))

(assert (=> d!143701 (= lt!593091 (select (content!658 (toList!10839 lt!592926)) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!761670 () Bool)

(assert (=> d!143701 (= lt!593091 e!761670)))

(declare-fun res!887613 () Bool)

(assert (=> d!143701 (=> (not res!887613) (not e!761670))))

(assert (=> d!143701 (= res!887613 ((_ is Cons!31117) (toList!10839 lt!592926)))))

(assert (=> d!143701 (= (contains!8936 (toList!10839 lt!592926) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593091)))

(declare-fun b!1337610 () Bool)

(declare-fun e!761669 () Bool)

(assert (=> b!1337610 (= e!761670 e!761669)))

(declare-fun res!887612 () Bool)

(assert (=> b!1337610 (=> res!887612 e!761669)))

(assert (=> b!1337610 (= res!887612 (= (h!32326 (toList!10839 lt!592926)) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337611 () Bool)

(assert (=> b!1337611 (= e!761669 (contains!8936 (t!45427 (toList!10839 lt!592926)) (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143701 res!887613) b!1337610))

(assert (= (and b!1337610 (not res!887612)) b!1337611))

(declare-fun m!1225257 () Bool)

(assert (=> d!143701 m!1225257))

(declare-fun m!1225259 () Bool)

(assert (=> d!143701 m!1225259))

(declare-fun m!1225261 () Bool)

(assert (=> b!1337611 m!1225261))

(assert (=> b!1337333 d!143701))

(assert (=> bm!64886 d!143695))

(declare-fun d!143703 () Bool)

(assert (=> d!143703 (= (apply!1027 lt!593016 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22122 (getValueByKey!720 (toList!10839 lt!593016) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38272 () Bool)

(assert (= bs!38272 d!143703))

(assert (=> bs!38272 m!1225149))

(assert (=> bs!38272 m!1225149))

(declare-fun m!1225263 () Bool)

(assert (=> bs!38272 m!1225263))

(assert (=> b!1337436 d!143703))

(assert (=> d!143631 d!143635))

(declare-fun b!1337612 () Bool)

(declare-fun e!761671 () Option!771)

(assert (=> b!1337612 (= e!761671 (Some!770 (_2!12006 (h!32326 (toList!10839 lt!592926)))))))

(declare-fun b!1337614 () Bool)

(declare-fun e!761672 () Option!771)

(assert (=> b!1337614 (= e!761672 (getValueByKey!720 (t!45427 (toList!10839 lt!592926)) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337613 () Bool)

(assert (=> b!1337613 (= e!761671 e!761672)))

(declare-fun c!126121 () Bool)

(assert (=> b!1337613 (= c!126121 (and ((_ is Cons!31117) (toList!10839 lt!592926)) (not (= (_1!12006 (h!32326 (toList!10839 lt!592926))) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126120 () Bool)

(declare-fun d!143705 () Bool)

(assert (=> d!143705 (= c!126120 (and ((_ is Cons!31117) (toList!10839 lt!592926)) (= (_1!12006 (h!32326 (toList!10839 lt!592926))) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143705 (= (getValueByKey!720 (toList!10839 lt!592926) (_1!12006 (tuple2!23991 (select (arr!43820 _keys!1590) from!1980) (get!22119 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!761671)))

(declare-fun b!1337615 () Bool)

(assert (=> b!1337615 (= e!761672 None!769)))

(assert (= (and d!143705 c!126120) b!1337612))

(assert (= (and d!143705 (not c!126120)) b!1337613))

(assert (= (and b!1337613 c!126121) b!1337614))

(assert (= (and b!1337613 (not c!126121)) b!1337615))

(declare-fun m!1225265 () Bool)

(assert (=> b!1337614 m!1225265))

(assert (=> b!1337332 d!143705))

(declare-fun d!143707 () Bool)

(declare-fun e!761673 () Bool)

(assert (=> d!143707 e!761673))

(declare-fun res!887614 () Bool)

(assert (=> d!143707 (=> res!887614 e!761673)))

(declare-fun lt!593093 () Bool)

(assert (=> d!143707 (= res!887614 (not lt!593093))))

(declare-fun lt!593094 () Bool)

(assert (=> d!143707 (= lt!593093 lt!593094)))

(declare-fun lt!593092 () Unit!43750)

(declare-fun e!761674 () Unit!43750)

(assert (=> d!143707 (= lt!593092 e!761674)))

(declare-fun c!126122 () Bool)

(assert (=> d!143707 (= c!126122 lt!593094)))

(assert (=> d!143707 (= lt!593094 (containsKey!737 (toList!10839 lt!592942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143707 (= (contains!8935 lt!592942 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593093)))

(declare-fun b!1337616 () Bool)

(declare-fun lt!593095 () Unit!43750)

(assert (=> b!1337616 (= e!761674 lt!593095)))

(assert (=> b!1337616 (= lt!593095 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!592942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337616 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337617 () Bool)

(declare-fun Unit!43759 () Unit!43750)

(assert (=> b!1337617 (= e!761674 Unit!43759)))

(declare-fun b!1337618 () Bool)

(assert (=> b!1337618 (= e!761673 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143707 c!126122) b!1337616))

(assert (= (and d!143707 (not c!126122)) b!1337617))

(assert (= (and d!143707 (not res!887614)) b!1337618))

(declare-fun m!1225267 () Bool)

(assert (=> d!143707 m!1225267))

(declare-fun m!1225269 () Bool)

(assert (=> b!1337616 m!1225269))

(declare-fun m!1225271 () Bool)

(assert (=> b!1337616 m!1225271))

(assert (=> b!1337616 m!1225271))

(declare-fun m!1225273 () Bool)

(assert (=> b!1337616 m!1225273))

(assert (=> b!1337618 m!1225271))

(assert (=> b!1337618 m!1225271))

(assert (=> b!1337618 m!1225273))

(assert (=> b!1337364 d!143707))

(declare-fun d!143709 () Bool)

(assert (=> d!143709 (= (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337362 d!143709))

(declare-fun d!143711 () Bool)

(assert (=> d!143711 (= (apply!1027 lt!592942 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22122 (getValueByKey!720 (toList!10839 lt!592942) (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38273 () Bool)

(assert (= bs!38273 d!143711))

(assert (=> bs!38273 m!1224955))

(declare-fun m!1225275 () Bool)

(assert (=> bs!38273 m!1225275))

(assert (=> bs!38273 m!1225275))

(declare-fun m!1225277 () Bool)

(assert (=> bs!38273 m!1225277))

(assert (=> b!1337363 d!143711))

(assert (=> b!1337363 d!143683))

(declare-fun d!143713 () Bool)

(declare-fun isEmpty!1093 (List!31121) Bool)

(assert (=> d!143713 (= (isEmpty!1091 lt!592942) (isEmpty!1093 (toList!10839 lt!592942)))))

(declare-fun bs!38274 () Bool)

(assert (= bs!38274 d!143713))

(declare-fun m!1225279 () Bool)

(assert (=> bs!38274 m!1225279))

(assert (=> b!1337361 d!143713))

(assert (=> b!1337466 d!143667))

(declare-fun d!143715 () Bool)

(declare-fun e!761675 () Bool)

(assert (=> d!143715 e!761675))

(declare-fun res!887615 () Bool)

(assert (=> d!143715 (=> (not res!887615) (not e!761675))))

(declare-fun lt!593099 () ListLongMap!21647)

(assert (=> d!143715 (= res!887615 (contains!8935 lt!593099 (_1!12006 (tuple2!23991 lt!593011 zeroValue!1262))))))

(declare-fun lt!593098 () List!31121)

(assert (=> d!143715 (= lt!593099 (ListLongMap!21648 lt!593098))))

(declare-fun lt!593096 () Unit!43750)

(declare-fun lt!593097 () Unit!43750)

(assert (=> d!143715 (= lt!593096 lt!593097)))

(assert (=> d!143715 (= (getValueByKey!720 lt!593098 (_1!12006 (tuple2!23991 lt!593011 zeroValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!593011 zeroValue!1262))))))

(assert (=> d!143715 (= lt!593097 (lemmaContainsTupThenGetReturnValue!363 lt!593098 (_1!12006 (tuple2!23991 lt!593011 zeroValue!1262)) (_2!12006 (tuple2!23991 lt!593011 zeroValue!1262))))))

(assert (=> d!143715 (= lt!593098 (insertStrictlySorted!492 (toList!10839 lt!593010) (_1!12006 (tuple2!23991 lt!593011 zeroValue!1262)) (_2!12006 (tuple2!23991 lt!593011 zeroValue!1262))))))

(assert (=> d!143715 (= (+!4769 lt!593010 (tuple2!23991 lt!593011 zeroValue!1262)) lt!593099)))

(declare-fun b!1337619 () Bool)

(declare-fun res!887616 () Bool)

(assert (=> b!1337619 (=> (not res!887616) (not e!761675))))

(assert (=> b!1337619 (= res!887616 (= (getValueByKey!720 (toList!10839 lt!593099) (_1!12006 (tuple2!23991 lt!593011 zeroValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!593011 zeroValue!1262)))))))

(declare-fun b!1337620 () Bool)

(assert (=> b!1337620 (= e!761675 (contains!8936 (toList!10839 lt!593099) (tuple2!23991 lt!593011 zeroValue!1262)))))

(assert (= (and d!143715 res!887615) b!1337619))

(assert (= (and b!1337619 res!887616) b!1337620))

(declare-fun m!1225281 () Bool)

(assert (=> d!143715 m!1225281))

(declare-fun m!1225283 () Bool)

(assert (=> d!143715 m!1225283))

(declare-fun m!1225285 () Bool)

(assert (=> d!143715 m!1225285))

(declare-fun m!1225287 () Bool)

(assert (=> d!143715 m!1225287))

(declare-fun m!1225289 () Bool)

(assert (=> b!1337619 m!1225289))

(declare-fun m!1225291 () Bool)

(assert (=> b!1337620 m!1225291))

(assert (=> b!1337432 d!143715))

(declare-fun d!143717 () Bool)

(assert (=> d!143717 (= (apply!1027 (+!4769 lt!593007 (tuple2!23991 lt!592997 minValue!1262)) lt!593001) (get!22122 (getValueByKey!720 (toList!10839 (+!4769 lt!593007 (tuple2!23991 lt!592997 minValue!1262))) lt!593001)))))

(declare-fun bs!38275 () Bool)

(assert (= bs!38275 d!143717))

(declare-fun m!1225293 () Bool)

(assert (=> bs!38275 m!1225293))

(assert (=> bs!38275 m!1225293))

(declare-fun m!1225295 () Bool)

(assert (=> bs!38275 m!1225295))

(assert (=> b!1337432 d!143717))

(declare-fun d!143719 () Bool)

(assert (=> d!143719 (= (apply!1027 (+!4769 lt!593010 (tuple2!23991 lt!593011 zeroValue!1262)) lt!593003) (apply!1027 lt!593010 lt!593003))))

(declare-fun lt!593102 () Unit!43750)

(declare-fun choose!1974 (ListLongMap!21647 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43750)

(assert (=> d!143719 (= lt!593102 (choose!1974 lt!593010 lt!593011 zeroValue!1262 lt!593003))))

(declare-fun e!761678 () Bool)

(assert (=> d!143719 e!761678))

(declare-fun res!887619 () Bool)

(assert (=> d!143719 (=> (not res!887619) (not e!761678))))

(assert (=> d!143719 (= res!887619 (contains!8935 lt!593010 lt!593003))))

(assert (=> d!143719 (= (addApplyDifferent!565 lt!593010 lt!593011 zeroValue!1262 lt!593003) lt!593102)))

(declare-fun b!1337624 () Bool)

(assert (=> b!1337624 (= e!761678 (not (= lt!593003 lt!593011)))))

(assert (= (and d!143719 res!887619) b!1337624))

(assert (=> d!143719 m!1225019))

(assert (=> d!143719 m!1225007))

(assert (=> d!143719 m!1225021))

(declare-fun m!1225297 () Bool)

(assert (=> d!143719 m!1225297))

(assert (=> d!143719 m!1225007))

(declare-fun m!1225299 () Bool)

(assert (=> d!143719 m!1225299))

(assert (=> b!1337432 d!143719))

(declare-fun d!143721 () Bool)

(assert (=> d!143721 (= (apply!1027 (+!4769 lt!593004 (tuple2!23991 lt!593017 minValue!1262)) lt!592999) (get!22122 (getValueByKey!720 (toList!10839 (+!4769 lt!593004 (tuple2!23991 lt!593017 minValue!1262))) lt!592999)))))

(declare-fun bs!38276 () Bool)

(assert (= bs!38276 d!143721))

(declare-fun m!1225301 () Bool)

(assert (=> bs!38276 m!1225301))

(assert (=> bs!38276 m!1225301))

(declare-fun m!1225303 () Bool)

(assert (=> bs!38276 m!1225303))

(assert (=> b!1337432 d!143721))

(declare-fun d!143723 () Bool)

(assert (=> d!143723 (= (apply!1027 lt!593010 lt!593003) (get!22122 (getValueByKey!720 (toList!10839 lt!593010) lt!593003)))))

(declare-fun bs!38277 () Bool)

(assert (= bs!38277 d!143723))

(declare-fun m!1225305 () Bool)

(assert (=> bs!38277 m!1225305))

(assert (=> bs!38277 m!1225305))

(declare-fun m!1225307 () Bool)

(assert (=> bs!38277 m!1225307))

(assert (=> b!1337432 d!143723))

(declare-fun d!143725 () Bool)

(declare-fun e!761679 () Bool)

(assert (=> d!143725 e!761679))

(declare-fun res!887620 () Bool)

(assert (=> d!143725 (=> res!887620 e!761679)))

(declare-fun lt!593104 () Bool)

(assert (=> d!143725 (= res!887620 (not lt!593104))))

(declare-fun lt!593105 () Bool)

(assert (=> d!143725 (= lt!593104 lt!593105)))

(declare-fun lt!593103 () Unit!43750)

(declare-fun e!761680 () Unit!43750)

(assert (=> d!143725 (= lt!593103 e!761680)))

(declare-fun c!126123 () Bool)

(assert (=> d!143725 (= c!126123 lt!593105)))

(assert (=> d!143725 (= lt!593105 (containsKey!737 (toList!10839 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262))) lt!593015))))

(assert (=> d!143725 (= (contains!8935 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262)) lt!593015) lt!593104)))

(declare-fun b!1337625 () Bool)

(declare-fun lt!593106 () Unit!43750)

(assert (=> b!1337625 (= e!761680 lt!593106)))

(assert (=> b!1337625 (= lt!593106 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262))) lt!593015))))

(assert (=> b!1337625 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262))) lt!593015))))

(declare-fun b!1337626 () Bool)

(declare-fun Unit!43760 () Unit!43750)

(assert (=> b!1337626 (= e!761680 Unit!43760)))

(declare-fun b!1337627 () Bool)

(assert (=> b!1337627 (= e!761679 (isDefined!527 (getValueByKey!720 (toList!10839 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262))) lt!593015)))))

(assert (= (and d!143725 c!126123) b!1337625))

(assert (= (and d!143725 (not c!126123)) b!1337626))

(assert (= (and d!143725 (not res!887620)) b!1337627))

(declare-fun m!1225309 () Bool)

(assert (=> d!143725 m!1225309))

(declare-fun m!1225311 () Bool)

(assert (=> b!1337625 m!1225311))

(declare-fun m!1225313 () Bool)

(assert (=> b!1337625 m!1225313))

(assert (=> b!1337625 m!1225313))

(declare-fun m!1225315 () Bool)

(assert (=> b!1337625 m!1225315))

(assert (=> b!1337627 m!1225313))

(assert (=> b!1337627 m!1225313))

(assert (=> b!1337627 m!1225315))

(assert (=> b!1337432 d!143725))

(declare-fun d!143727 () Bool)

(declare-fun e!761681 () Bool)

(assert (=> d!143727 e!761681))

(declare-fun res!887621 () Bool)

(assert (=> d!143727 (=> (not res!887621) (not e!761681))))

(declare-fun lt!593110 () ListLongMap!21647)

(assert (=> d!143727 (= res!887621 (contains!8935 lt!593110 (_1!12006 (tuple2!23991 lt!592997 minValue!1262))))))

(declare-fun lt!593109 () List!31121)

(assert (=> d!143727 (= lt!593110 (ListLongMap!21648 lt!593109))))

(declare-fun lt!593107 () Unit!43750)

(declare-fun lt!593108 () Unit!43750)

(assert (=> d!143727 (= lt!593107 lt!593108)))

(assert (=> d!143727 (= (getValueByKey!720 lt!593109 (_1!12006 (tuple2!23991 lt!592997 minValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!592997 minValue!1262))))))

(assert (=> d!143727 (= lt!593108 (lemmaContainsTupThenGetReturnValue!363 lt!593109 (_1!12006 (tuple2!23991 lt!592997 minValue!1262)) (_2!12006 (tuple2!23991 lt!592997 minValue!1262))))))

(assert (=> d!143727 (= lt!593109 (insertStrictlySorted!492 (toList!10839 lt!593007) (_1!12006 (tuple2!23991 lt!592997 minValue!1262)) (_2!12006 (tuple2!23991 lt!592997 minValue!1262))))))

(assert (=> d!143727 (= (+!4769 lt!593007 (tuple2!23991 lt!592997 minValue!1262)) lt!593110)))

(declare-fun b!1337628 () Bool)

(declare-fun res!887622 () Bool)

(assert (=> b!1337628 (=> (not res!887622) (not e!761681))))

(assert (=> b!1337628 (= res!887622 (= (getValueByKey!720 (toList!10839 lt!593110) (_1!12006 (tuple2!23991 lt!592997 minValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!592997 minValue!1262)))))))

(declare-fun b!1337629 () Bool)

(assert (=> b!1337629 (= e!761681 (contains!8936 (toList!10839 lt!593110) (tuple2!23991 lt!592997 minValue!1262)))))

(assert (= (and d!143727 res!887621) b!1337628))

(assert (= (and b!1337628 res!887622) b!1337629))

(declare-fun m!1225317 () Bool)

(assert (=> d!143727 m!1225317))

(declare-fun m!1225319 () Bool)

(assert (=> d!143727 m!1225319))

(declare-fun m!1225321 () Bool)

(assert (=> d!143727 m!1225321))

(declare-fun m!1225323 () Bool)

(assert (=> d!143727 m!1225323))

(declare-fun m!1225325 () Bool)

(assert (=> b!1337628 m!1225325))

(declare-fun m!1225327 () Bool)

(assert (=> b!1337629 m!1225327))

(assert (=> b!1337432 d!143727))

(declare-fun d!143729 () Bool)

(assert (=> d!143729 (= (apply!1027 lt!593004 lt!592999) (get!22122 (getValueByKey!720 (toList!10839 lt!593004) lt!592999)))))

(declare-fun bs!38278 () Bool)

(assert (= bs!38278 d!143729))

(declare-fun m!1225329 () Bool)

(assert (=> bs!38278 m!1225329))

(assert (=> bs!38278 m!1225329))

(declare-fun m!1225331 () Bool)

(assert (=> bs!38278 m!1225331))

(assert (=> b!1337432 d!143729))

(declare-fun d!143731 () Bool)

(declare-fun e!761682 () Bool)

(assert (=> d!143731 e!761682))

(declare-fun res!887623 () Bool)

(assert (=> d!143731 (=> (not res!887623) (not e!761682))))

(declare-fun lt!593114 () ListLongMap!21647)

(assert (=> d!143731 (= res!887623 (contains!8935 lt!593114 (_1!12006 (tuple2!23991 lt!593017 minValue!1262))))))

(declare-fun lt!593113 () List!31121)

(assert (=> d!143731 (= lt!593114 (ListLongMap!21648 lt!593113))))

(declare-fun lt!593111 () Unit!43750)

(declare-fun lt!593112 () Unit!43750)

(assert (=> d!143731 (= lt!593111 lt!593112)))

(assert (=> d!143731 (= (getValueByKey!720 lt!593113 (_1!12006 (tuple2!23991 lt!593017 minValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!593017 minValue!1262))))))

(assert (=> d!143731 (= lt!593112 (lemmaContainsTupThenGetReturnValue!363 lt!593113 (_1!12006 (tuple2!23991 lt!593017 minValue!1262)) (_2!12006 (tuple2!23991 lt!593017 minValue!1262))))))

(assert (=> d!143731 (= lt!593113 (insertStrictlySorted!492 (toList!10839 lt!593004) (_1!12006 (tuple2!23991 lt!593017 minValue!1262)) (_2!12006 (tuple2!23991 lt!593017 minValue!1262))))))

(assert (=> d!143731 (= (+!4769 lt!593004 (tuple2!23991 lt!593017 minValue!1262)) lt!593114)))

(declare-fun b!1337630 () Bool)

(declare-fun res!887624 () Bool)

(assert (=> b!1337630 (=> (not res!887624) (not e!761682))))

(assert (=> b!1337630 (= res!887624 (= (getValueByKey!720 (toList!10839 lt!593114) (_1!12006 (tuple2!23991 lt!593017 minValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!593017 minValue!1262)))))))

(declare-fun b!1337631 () Bool)

(assert (=> b!1337631 (= e!761682 (contains!8936 (toList!10839 lt!593114) (tuple2!23991 lt!593017 minValue!1262)))))

(assert (= (and d!143731 res!887623) b!1337630))

(assert (= (and b!1337630 res!887624) b!1337631))

(declare-fun m!1225333 () Bool)

(assert (=> d!143731 m!1225333))

(declare-fun m!1225335 () Bool)

(assert (=> d!143731 m!1225335))

(declare-fun m!1225337 () Bool)

(assert (=> d!143731 m!1225337))

(declare-fun m!1225339 () Bool)

(assert (=> d!143731 m!1225339))

(declare-fun m!1225341 () Bool)

(assert (=> b!1337630 m!1225341))

(declare-fun m!1225343 () Bool)

(assert (=> b!1337631 m!1225343))

(assert (=> b!1337432 d!143731))

(assert (=> b!1337432 d!143689))

(declare-fun d!143733 () Bool)

(assert (=> d!143733 (contains!8935 (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262)) lt!593015)))

(declare-fun lt!593117 () Unit!43750)

(declare-fun choose!1975 (ListLongMap!21647 (_ BitVec 64) V!54377 (_ BitVec 64)) Unit!43750)

(assert (=> d!143733 (= lt!593117 (choose!1975 lt!593002 lt!593009 zeroValue!1262 lt!593015))))

(assert (=> d!143733 (contains!8935 lt!593002 lt!593015)))

(assert (=> d!143733 (= (addStillContains!1185 lt!593002 lt!593009 zeroValue!1262 lt!593015) lt!593117)))

(declare-fun bs!38279 () Bool)

(assert (= bs!38279 d!143733))

(assert (=> bs!38279 m!1225013))

(assert (=> bs!38279 m!1225013))

(assert (=> bs!38279 m!1225015))

(declare-fun m!1225345 () Bool)

(assert (=> bs!38279 m!1225345))

(declare-fun m!1225347 () Bool)

(assert (=> bs!38279 m!1225347))

(assert (=> b!1337432 d!143733))

(declare-fun d!143735 () Bool)

(assert (=> d!143735 (= (apply!1027 (+!4769 lt!593007 (tuple2!23991 lt!592997 minValue!1262)) lt!593001) (apply!1027 lt!593007 lt!593001))))

(declare-fun lt!593118 () Unit!43750)

(assert (=> d!143735 (= lt!593118 (choose!1974 lt!593007 lt!592997 minValue!1262 lt!593001))))

(declare-fun e!761683 () Bool)

(assert (=> d!143735 e!761683))

(declare-fun res!887625 () Bool)

(assert (=> d!143735 (=> (not res!887625) (not e!761683))))

(assert (=> d!143735 (= res!887625 (contains!8935 lt!593007 lt!593001))))

(assert (=> d!143735 (= (addApplyDifferent!565 lt!593007 lt!592997 minValue!1262 lt!593001) lt!593118)))

(declare-fun b!1337633 () Bool)

(assert (=> b!1337633 (= e!761683 (not (= lt!593001 lt!592997)))))

(assert (= (and d!143735 res!887625) b!1337633))

(assert (=> d!143735 m!1225017))

(assert (=> d!143735 m!1225009))

(assert (=> d!143735 m!1225011))

(declare-fun m!1225349 () Bool)

(assert (=> d!143735 m!1225349))

(assert (=> d!143735 m!1225009))

(declare-fun m!1225351 () Bool)

(assert (=> d!143735 m!1225351))

(assert (=> b!1337432 d!143735))

(declare-fun d!143737 () Bool)

(declare-fun e!761684 () Bool)

(assert (=> d!143737 e!761684))

(declare-fun res!887626 () Bool)

(assert (=> d!143737 (=> (not res!887626) (not e!761684))))

(declare-fun lt!593122 () ListLongMap!21647)

(assert (=> d!143737 (= res!887626 (contains!8935 lt!593122 (_1!12006 (tuple2!23991 lt!593009 zeroValue!1262))))))

(declare-fun lt!593121 () List!31121)

(assert (=> d!143737 (= lt!593122 (ListLongMap!21648 lt!593121))))

(declare-fun lt!593119 () Unit!43750)

(declare-fun lt!593120 () Unit!43750)

(assert (=> d!143737 (= lt!593119 lt!593120)))

(assert (=> d!143737 (= (getValueByKey!720 lt!593121 (_1!12006 (tuple2!23991 lt!593009 zeroValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!593009 zeroValue!1262))))))

(assert (=> d!143737 (= lt!593120 (lemmaContainsTupThenGetReturnValue!363 lt!593121 (_1!12006 (tuple2!23991 lt!593009 zeroValue!1262)) (_2!12006 (tuple2!23991 lt!593009 zeroValue!1262))))))

(assert (=> d!143737 (= lt!593121 (insertStrictlySorted!492 (toList!10839 lt!593002) (_1!12006 (tuple2!23991 lt!593009 zeroValue!1262)) (_2!12006 (tuple2!23991 lt!593009 zeroValue!1262))))))

(assert (=> d!143737 (= (+!4769 lt!593002 (tuple2!23991 lt!593009 zeroValue!1262)) lt!593122)))

(declare-fun b!1337634 () Bool)

(declare-fun res!887627 () Bool)

(assert (=> b!1337634 (=> (not res!887627) (not e!761684))))

(assert (=> b!1337634 (= res!887627 (= (getValueByKey!720 (toList!10839 lt!593122) (_1!12006 (tuple2!23991 lt!593009 zeroValue!1262))) (Some!770 (_2!12006 (tuple2!23991 lt!593009 zeroValue!1262)))))))

(declare-fun b!1337635 () Bool)

(assert (=> b!1337635 (= e!761684 (contains!8936 (toList!10839 lt!593122) (tuple2!23991 lt!593009 zeroValue!1262)))))

(assert (= (and d!143737 res!887626) b!1337634))

(assert (= (and b!1337634 res!887627) b!1337635))

(declare-fun m!1225353 () Bool)

(assert (=> d!143737 m!1225353))

(declare-fun m!1225355 () Bool)

(assert (=> d!143737 m!1225355))

(declare-fun m!1225357 () Bool)

(assert (=> d!143737 m!1225357))

(declare-fun m!1225359 () Bool)

(assert (=> d!143737 m!1225359))

(declare-fun m!1225361 () Bool)

(assert (=> b!1337634 m!1225361))

(declare-fun m!1225363 () Bool)

(assert (=> b!1337635 m!1225363))

(assert (=> b!1337432 d!143737))

(declare-fun d!143739 () Bool)

(assert (=> d!143739 (= (apply!1027 (+!4769 lt!593010 (tuple2!23991 lt!593011 zeroValue!1262)) lt!593003) (get!22122 (getValueByKey!720 (toList!10839 (+!4769 lt!593010 (tuple2!23991 lt!593011 zeroValue!1262))) lt!593003)))))

(declare-fun bs!38280 () Bool)

(assert (= bs!38280 d!143739))

(declare-fun m!1225365 () Bool)

(assert (=> bs!38280 m!1225365))

(assert (=> bs!38280 m!1225365))

(declare-fun m!1225367 () Bool)

(assert (=> bs!38280 m!1225367))

(assert (=> b!1337432 d!143739))

(declare-fun d!143741 () Bool)

(assert (=> d!143741 (= (apply!1027 (+!4769 lt!593004 (tuple2!23991 lt!593017 minValue!1262)) lt!592999) (apply!1027 lt!593004 lt!592999))))

(declare-fun lt!593123 () Unit!43750)

(assert (=> d!143741 (= lt!593123 (choose!1974 lt!593004 lt!593017 minValue!1262 lt!592999))))

(declare-fun e!761685 () Bool)

(assert (=> d!143741 e!761685))

(declare-fun res!887628 () Bool)

(assert (=> d!143741 (=> (not res!887628) (not e!761685))))

(assert (=> d!143741 (= res!887628 (contains!8935 lt!593004 lt!592999))))

(assert (=> d!143741 (= (addApplyDifferent!565 lt!593004 lt!593017 minValue!1262 lt!592999) lt!593123)))

(declare-fun b!1337636 () Bool)

(assert (=> b!1337636 (= e!761685 (not (= lt!592999 lt!593017)))))

(assert (= (and d!143741 res!887628) b!1337636))

(assert (=> d!143741 m!1225031))

(assert (=> d!143741 m!1225027))

(assert (=> d!143741 m!1225033))

(declare-fun m!1225369 () Bool)

(assert (=> d!143741 m!1225369))

(assert (=> d!143741 m!1225027))

(declare-fun m!1225371 () Bool)

(assert (=> d!143741 m!1225371))

(assert (=> b!1337432 d!143741))

(declare-fun d!143743 () Bool)

(assert (=> d!143743 (= (apply!1027 lt!593007 lt!593001) (get!22122 (getValueByKey!720 (toList!10839 lt!593007) lt!593001)))))

(declare-fun bs!38281 () Bool)

(assert (= bs!38281 d!143743))

(declare-fun m!1225373 () Bool)

(assert (=> bs!38281 m!1225373))

(assert (=> bs!38281 m!1225373))

(declare-fun m!1225375 () Bool)

(assert (=> bs!38281 m!1225375))

(assert (=> b!1337432 d!143743))

(declare-fun d!143745 () Bool)

(declare-fun e!761686 () Bool)

(assert (=> d!143745 e!761686))

(declare-fun res!887629 () Bool)

(assert (=> d!143745 (=> res!887629 e!761686)))

(declare-fun lt!593125 () Bool)

(assert (=> d!143745 (= res!887629 (not lt!593125))))

(declare-fun lt!593126 () Bool)

(assert (=> d!143745 (= lt!593125 lt!593126)))

(declare-fun lt!593124 () Unit!43750)

(declare-fun e!761687 () Unit!43750)

(assert (=> d!143745 (= lt!593124 e!761687)))

(declare-fun c!126124 () Bool)

(assert (=> d!143745 (= c!126124 lt!593126)))

(assert (=> d!143745 (= lt!593126 (containsKey!737 (toList!10839 lt!592942) (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!143745 (= (contains!8935 lt!592942 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!593125)))

(declare-fun b!1337637 () Bool)

(declare-fun lt!593127 () Unit!43750)

(assert (=> b!1337637 (= e!761687 lt!593127)))

(assert (=> b!1337637 (= lt!593127 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!592942) (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337637 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592942) (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1337638 () Bool)

(declare-fun Unit!43761 () Unit!43750)

(assert (=> b!1337638 (= e!761687 Unit!43761)))

(declare-fun b!1337639 () Bool)

(assert (=> b!1337639 (= e!761686 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592942) (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!143745 c!126124) b!1337637))

(assert (= (and d!143745 (not c!126124)) b!1337638))

(assert (= (and d!143745 (not res!887629)) b!1337639))

(assert (=> d!143745 m!1224955))

(declare-fun m!1225377 () Bool)

(assert (=> d!143745 m!1225377))

(assert (=> b!1337637 m!1224955))

(declare-fun m!1225379 () Bool)

(assert (=> b!1337637 m!1225379))

(assert (=> b!1337637 m!1224955))

(assert (=> b!1337637 m!1225275))

(assert (=> b!1337637 m!1225275))

(declare-fun m!1225381 () Bool)

(assert (=> b!1337637 m!1225381))

(assert (=> b!1337639 m!1224955))

(assert (=> b!1337639 m!1225275))

(assert (=> b!1337639 m!1225275))

(assert (=> b!1337639 m!1225381))

(assert (=> b!1337360 d!143745))

(declare-fun d!143747 () Bool)

(assert (=> d!143747 (= (get!22121 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337375 d!143747))

(declare-fun d!143749 () Bool)

(declare-fun e!761688 () Bool)

(assert (=> d!143749 e!761688))

(declare-fun res!887630 () Bool)

(assert (=> d!143749 (=> res!887630 e!761688)))

(declare-fun lt!593129 () Bool)

(assert (=> d!143749 (= res!887630 (not lt!593129))))

(declare-fun lt!593130 () Bool)

(assert (=> d!143749 (= lt!593129 lt!593130)))

(declare-fun lt!593128 () Unit!43750)

(declare-fun e!761689 () Unit!43750)

(assert (=> d!143749 (= lt!593128 e!761689)))

(declare-fun c!126125 () Bool)

(assert (=> d!143749 (= c!126125 lt!593130)))

(assert (=> d!143749 (= lt!593130 (containsKey!737 (toList!10839 lt!593016) (select (arr!43820 _keys!1590) from!1980)))))

(assert (=> d!143749 (= (contains!8935 lt!593016 (select (arr!43820 _keys!1590) from!1980)) lt!593129)))

(declare-fun b!1337640 () Bool)

(declare-fun lt!593131 () Unit!43750)

(assert (=> b!1337640 (= e!761689 lt!593131)))

(assert (=> b!1337640 (= lt!593131 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!593016) (select (arr!43820 _keys!1590) from!1980)))))

(assert (=> b!1337640 (isDefined!527 (getValueByKey!720 (toList!10839 lt!593016) (select (arr!43820 _keys!1590) from!1980)))))

(declare-fun b!1337641 () Bool)

(declare-fun Unit!43762 () Unit!43750)

(assert (=> b!1337641 (= e!761689 Unit!43762)))

(declare-fun b!1337642 () Bool)

(assert (=> b!1337642 (= e!761688 (isDefined!527 (getValueByKey!720 (toList!10839 lt!593016) (select (arr!43820 _keys!1590) from!1980))))))

(assert (= (and d!143749 c!126125) b!1337640))

(assert (= (and d!143749 (not c!126125)) b!1337641))

(assert (= (and d!143749 (not res!887630)) b!1337642))

(assert (=> d!143749 m!1224865))

(declare-fun m!1225383 () Bool)

(assert (=> d!143749 m!1225383))

(assert (=> b!1337640 m!1224865))

(declare-fun m!1225385 () Bool)

(assert (=> b!1337640 m!1225385))

(assert (=> b!1337640 m!1224865))

(assert (=> b!1337640 m!1225113))

(assert (=> b!1337640 m!1225113))

(declare-fun m!1225387 () Bool)

(assert (=> b!1337640 m!1225387))

(assert (=> b!1337642 m!1224865))

(assert (=> b!1337642 m!1225113))

(assert (=> b!1337642 m!1225113))

(assert (=> b!1337642 m!1225387))

(assert (=> b!1337428 d!143749))

(declare-fun bm!64926 () Bool)

(declare-fun call!64929 () Bool)

(assert (=> bm!64926 (= call!64929 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1337643 () Bool)

(declare-fun e!761691 () Bool)

(declare-fun e!761690 () Bool)

(assert (=> b!1337643 (= e!761691 e!761690)))

(declare-fun lt!593132 () (_ BitVec 64))

(assert (=> b!1337643 (= lt!593132 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!593134 () Unit!43750)

(assert (=> b!1337643 (= lt!593134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593132 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1337643 (arrayContainsKey!0 _keys!1590 lt!593132 #b00000000000000000000000000000000)))

(declare-fun lt!593133 () Unit!43750)

(assert (=> b!1337643 (= lt!593133 lt!593134)))

(declare-fun res!887631 () Bool)

(assert (=> b!1337643 (= res!887631 (= (seekEntryOrOpen!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10048 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1337643 (=> (not res!887631) (not e!761690))))

(declare-fun b!1337644 () Bool)

(declare-fun e!761692 () Bool)

(assert (=> b!1337644 (= e!761692 e!761691)))

(declare-fun c!126126 () Bool)

(assert (=> b!1337644 (= c!126126 (validKeyInArray!0 (select (arr!43820 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337645 () Bool)

(assert (=> b!1337645 (= e!761691 call!64929)))

(declare-fun d!143751 () Bool)

(declare-fun res!887632 () Bool)

(assert (=> d!143751 (=> res!887632 e!761692)))

(assert (=> d!143751 (= res!887632 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(assert (=> d!143751 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!761692)))

(declare-fun b!1337646 () Bool)

(assert (=> b!1337646 (= e!761690 call!64929)))

(assert (= (and d!143751 (not res!887632)) b!1337644))

(assert (= (and b!1337644 c!126126) b!1337643))

(assert (= (and b!1337644 (not c!126126)) b!1337645))

(assert (= (and b!1337643 res!887631) b!1337646))

(assert (= (or b!1337646 b!1337645) bm!64926))

(declare-fun m!1225389 () Bool)

(assert (=> bm!64926 m!1225389))

(assert (=> b!1337643 m!1225137))

(declare-fun m!1225391 () Bool)

(assert (=> b!1337643 m!1225391))

(declare-fun m!1225393 () Bool)

(assert (=> b!1337643 m!1225393))

(assert (=> b!1337643 m!1225137))

(declare-fun m!1225395 () Bool)

(assert (=> b!1337643 m!1225395))

(assert (=> b!1337644 m!1225137))

(assert (=> b!1337644 m!1225137))

(assert (=> b!1337644 m!1225141))

(assert (=> bm!64913 d!143751))

(assert (=> b!1337359 d!143709))

(declare-fun d!143753 () Bool)

(assert (=> d!143753 (= (get!22120 (select (arr!43821 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21192 (select (arr!43821 _values!1320) from!1980)))))

(assert (=> b!1337374 d!143753))

(assert (=> b!1337429 d!143643))

(declare-fun d!143755 () Bool)

(assert (=> d!143755 (arrayContainsKey!0 _keys!1590 lt!593024 #b00000000000000000000000000000000)))

(declare-fun lt!593137 () Unit!43750)

(declare-fun choose!13 (array!90711 (_ BitVec 64) (_ BitVec 32)) Unit!43750)

(assert (=> d!143755 (= lt!593137 (choose!13 _keys!1590 lt!593024 #b00000000000000000000000000000000))))

(assert (=> d!143755 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143755 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593024 #b00000000000000000000000000000000) lt!593137)))

(declare-fun bs!38282 () Bool)

(assert (= bs!38282 d!143755))

(assert (=> bs!38282 m!1225055))

(declare-fun m!1225397 () Bool)

(assert (=> bs!38282 m!1225397))

(assert (=> b!1337465 d!143755))

(declare-fun d!143757 () Bool)

(declare-fun res!887637 () Bool)

(declare-fun e!761697 () Bool)

(assert (=> d!143757 (=> res!887637 e!761697)))

(assert (=> d!143757 (= res!887637 (= (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) lt!593024))))

(assert (=> d!143757 (= (arrayContainsKey!0 _keys!1590 lt!593024 #b00000000000000000000000000000000) e!761697)))

(declare-fun b!1337651 () Bool)

(declare-fun e!761698 () Bool)

(assert (=> b!1337651 (= e!761697 e!761698)))

(declare-fun res!887638 () Bool)

(assert (=> b!1337651 (=> (not res!887638) (not e!761698))))

(assert (=> b!1337651 (= res!887638 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44372 _keys!1590)))))

(declare-fun b!1337652 () Bool)

(assert (=> b!1337652 (= e!761698 (arrayContainsKey!0 _keys!1590 lt!593024 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143757 (not res!887637)) b!1337651))

(assert (= (and b!1337651 res!887638) b!1337652))

(assert (=> d!143757 m!1225043))

(declare-fun m!1225399 () Bool)

(assert (=> b!1337652 m!1225399))

(assert (=> b!1337465 d!143757))

(declare-fun b!1337665 () Bool)

(declare-fun e!761705 () SeekEntryResult!10048)

(assert (=> b!1337665 (= e!761705 Undefined!10048)))

(declare-fun b!1337666 () Bool)

(declare-fun e!761707 () SeekEntryResult!10048)

(assert (=> b!1337666 (= e!761705 e!761707)))

(declare-fun lt!593146 () (_ BitVec 64))

(declare-fun lt!593145 () SeekEntryResult!10048)

(assert (=> b!1337666 (= lt!593146 (select (arr!43820 _keys!1590) (index!42565 lt!593145)))))

(declare-fun c!126133 () Bool)

(assert (=> b!1337666 (= c!126133 (= lt!593146 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337667 () Bool)

(declare-fun e!761706 () SeekEntryResult!10048)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90711 (_ BitVec 32)) SeekEntryResult!10048)

(assert (=> b!1337667 (= e!761706 (seekKeyOrZeroReturnVacant!0 (x!119478 lt!593145) (index!42565 lt!593145) (index!42565 lt!593145) (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1337668 () Bool)

(assert (=> b!1337668 (= e!761707 (Found!10048 (index!42565 lt!593145)))))

(declare-fun d!143759 () Bool)

(declare-fun lt!593144 () SeekEntryResult!10048)

(assert (=> d!143759 (and (or ((_ is Undefined!10048) lt!593144) (not ((_ is Found!10048) lt!593144)) (and (bvsge (index!42564 lt!593144) #b00000000000000000000000000000000) (bvslt (index!42564 lt!593144) (size!44372 _keys!1590)))) (or ((_ is Undefined!10048) lt!593144) ((_ is Found!10048) lt!593144) (not ((_ is MissingZero!10048) lt!593144)) (and (bvsge (index!42563 lt!593144) #b00000000000000000000000000000000) (bvslt (index!42563 lt!593144) (size!44372 _keys!1590)))) (or ((_ is Undefined!10048) lt!593144) ((_ is Found!10048) lt!593144) ((_ is MissingZero!10048) lt!593144) (not ((_ is MissingVacant!10048) lt!593144)) (and (bvsge (index!42566 lt!593144) #b00000000000000000000000000000000) (bvslt (index!42566 lt!593144) (size!44372 _keys!1590)))) (or ((_ is Undefined!10048) lt!593144) (ite ((_ is Found!10048) lt!593144) (= (select (arr!43820 _keys!1590) (index!42564 lt!593144)) (select (arr!43820 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10048) lt!593144) (= (select (arr!43820 _keys!1590) (index!42563 lt!593144)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10048) lt!593144) (= (select (arr!43820 _keys!1590) (index!42566 lt!593144)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143759 (= lt!593144 e!761705)))

(declare-fun c!126135 () Bool)

(assert (=> d!143759 (= c!126135 (and ((_ is Intermediate!10048) lt!593145) (undefined!10860 lt!593145)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90711 (_ BitVec 32)) SeekEntryResult!10048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143759 (= lt!593145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!143759 (validMask!0 mask!1998)))

(assert (=> d!143759 (= (seekEntryOrOpen!0 (select (arr!43820 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!593144)))

(declare-fun b!1337669 () Bool)

(assert (=> b!1337669 (= e!761706 (MissingZero!10048 (index!42565 lt!593145)))))

(declare-fun b!1337670 () Bool)

(declare-fun c!126134 () Bool)

(assert (=> b!1337670 (= c!126134 (= lt!593146 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337670 (= e!761707 e!761706)))

(assert (= (and d!143759 c!126135) b!1337665))

(assert (= (and d!143759 (not c!126135)) b!1337666))

(assert (= (and b!1337666 c!126133) b!1337668))

(assert (= (and b!1337666 (not c!126133)) b!1337670))

(assert (= (and b!1337670 c!126134) b!1337669))

(assert (= (and b!1337670 (not c!126134)) b!1337667))

(declare-fun m!1225401 () Bool)

(assert (=> b!1337666 m!1225401))

(assert (=> b!1337667 m!1225043))

(declare-fun m!1225403 () Bool)

(assert (=> b!1337667 m!1225403))

(assert (=> d!143759 m!1225043))

(declare-fun m!1225405 () Bool)

(assert (=> d!143759 m!1225405))

(declare-fun m!1225407 () Bool)

(assert (=> d!143759 m!1225407))

(declare-fun m!1225409 () Bool)

(assert (=> d!143759 m!1225409))

(assert (=> d!143759 m!1224841))

(assert (=> d!143759 m!1225405))

(assert (=> d!143759 m!1225043))

(declare-fun m!1225411 () Bool)

(assert (=> d!143759 m!1225411))

(declare-fun m!1225413 () Bool)

(assert (=> d!143759 m!1225413))

(assert (=> b!1337465 d!143759))

(declare-fun d!143761 () Bool)

(declare-fun e!761708 () Bool)

(assert (=> d!143761 e!761708))

(declare-fun res!887639 () Bool)

(assert (=> d!143761 (=> res!887639 e!761708)))

(declare-fun lt!593148 () Bool)

(assert (=> d!143761 (= res!887639 (not lt!593148))))

(declare-fun lt!593149 () Bool)

(assert (=> d!143761 (= lt!593148 lt!593149)))

(declare-fun lt!593147 () Unit!43750)

(declare-fun e!761709 () Unit!43750)

(assert (=> d!143761 (= lt!593147 e!761709)))

(declare-fun c!126136 () Bool)

(assert (=> d!143761 (= c!126136 lt!593149)))

(assert (=> d!143761 (= lt!593149 (containsKey!737 (toList!10839 lt!592942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143761 (= (contains!8935 lt!592942 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593148)))

(declare-fun b!1337671 () Bool)

(declare-fun lt!593150 () Unit!43750)

(assert (=> b!1337671 (= e!761709 lt!593150)))

(assert (=> b!1337671 (= lt!593150 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10839 lt!592942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337671 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337672 () Bool)

(declare-fun Unit!43763 () Unit!43750)

(assert (=> b!1337672 (= e!761709 Unit!43763)))

(declare-fun b!1337673 () Bool)

(assert (=> b!1337673 (= e!761708 (isDefined!527 (getValueByKey!720 (toList!10839 lt!592942) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143761 c!126136) b!1337671))

(assert (= (and d!143761 (not c!126136)) b!1337672))

(assert (= (and d!143761 (not res!887639)) b!1337673))

(declare-fun m!1225415 () Bool)

(assert (=> d!143761 m!1225415))

(declare-fun m!1225417 () Bool)

(assert (=> b!1337671 m!1225417))

(declare-fun m!1225419 () Bool)

(assert (=> b!1337671 m!1225419))

(assert (=> b!1337671 m!1225419))

(declare-fun m!1225421 () Bool)

(assert (=> b!1337671 m!1225421))

(assert (=> b!1337673 m!1225419))

(assert (=> b!1337673 m!1225419))

(assert (=> b!1337673 m!1225421))

(assert (=> d!143625 d!143761))

(assert (=> d!143625 d!143635))

(declare-fun condMapEmpty!57123 () Bool)

(declare-fun mapDefault!57123 () ValueCell!17579)

(assert (=> mapNonEmpty!57122 (= condMapEmpty!57123 (= mapRest!57122 ((as const (Array (_ BitVec 32) ValueCell!17579)) mapDefault!57123)))))

(declare-fun e!761710 () Bool)

(declare-fun mapRes!57123 () Bool)

(assert (=> mapNonEmpty!57122 (= tp!108795 (and e!761710 mapRes!57123))))

(declare-fun b!1337674 () Bool)

(declare-fun e!761711 () Bool)

(assert (=> b!1337674 (= e!761711 tp_is_empty!36955)))

(declare-fun mapNonEmpty!57123 () Bool)

(declare-fun tp!108796 () Bool)

(assert (=> mapNonEmpty!57123 (= mapRes!57123 (and tp!108796 e!761711))))

(declare-fun mapValue!57123 () ValueCell!17579)

(declare-fun mapKey!57123 () (_ BitVec 32))

(declare-fun mapRest!57123 () (Array (_ BitVec 32) ValueCell!17579))

(assert (=> mapNonEmpty!57123 (= mapRest!57122 (store mapRest!57123 mapKey!57123 mapValue!57123))))

(declare-fun b!1337675 () Bool)

(assert (=> b!1337675 (= e!761710 tp_is_empty!36955)))

(declare-fun mapIsEmpty!57123 () Bool)

(assert (=> mapIsEmpty!57123 mapRes!57123))

(assert (= (and mapNonEmpty!57122 condMapEmpty!57123) mapIsEmpty!57123))

(assert (= (and mapNonEmpty!57122 (not condMapEmpty!57123)) mapNonEmpty!57123))

(assert (= (and mapNonEmpty!57123 ((_ is ValueCellFull!17579) mapValue!57123)) b!1337674))

(assert (= (and mapNonEmpty!57122 ((_ is ValueCellFull!17579) mapDefault!57123)) b!1337675))

(declare-fun m!1225423 () Bool)

(assert (=> mapNonEmpty!57123 m!1225423))

(declare-fun b_lambda!24227 () Bool)

(assert (= b_lambda!24219 (or (and start!112734 b_free!31045) b_lambda!24227)))

(declare-fun b_lambda!24229 () Bool)

(assert (= b_lambda!24223 (or (and start!112734 b_free!31045) b_lambda!24229)))

(declare-fun b_lambda!24231 () Bool)

(assert (= b_lambda!24221 (or (and start!112734 b_free!31045) b_lambda!24231)))

(declare-fun b_lambda!24233 () Bool)

(assert (= b_lambda!24225 (or (and start!112734 b_free!31045) b_lambda!24233)))

(check-sat (not d!143707) (not bm!64920) (not b!1337671) (not d!143659) (not b!1337596) (not b_next!31045) (not bm!64925) (not b!1337595) (not d!143733) (not b!1337566) (not b!1337548) (not b!1337644) (not d!143663) (not b_lambda!24233) (not b!1337620) (not bm!64923) (not b_lambda!24229) (not b!1337637) (not b_lambda!24213) (not b!1337567) (not b!1337635) (not b!1337627) (not bm!64924) (not d!143727) (not b!1337525) (not b!1337667) (not d!143717) (not b!1337616) (not b!1337530) (not b!1337538) (not b!1337642) (not d!143665) (not d!143719) (not b!1337652) (not b!1337496) (not d!143759) (not b!1337585) (not b!1337579) (not d!143677) (not b!1337490) (not b!1337536) (not d!143685) (not b!1337497) (not b!1337573) (not d!143743) (not d!143697) (not b!1337537) (not d!143721) (not b_lambda!24215) (not d!143653) (not d!143657) (not b_lambda!24205) (not b!1337643) (not b!1337640) (not d!143739) (not b!1337545) (not b!1337619) (not b!1337591) (not b!1337639) (not b!1337562) (not d!143711) (not b!1337547) (not b!1337580) (not d!143701) (not d!143745) (not b!1337588) (not b!1337553) (not b!1337576) (not d!143661) (not b_lambda!24227) (not d!143749) (not d!143699) (not b!1337634) (not d!143649) (not b!1337575) (not b!1337590) (not b!1337572) (not b!1337561) (not d!143755) (not b!1337560) tp_is_empty!36955 (not b!1337625) (not d!143737) (not b!1337611) (not b!1337599) (not b!1337479) (not b!1337535) (not b!1337592) (not d!143671) (not b!1337519) (not b!1337631) (not d!143645) (not d!143713) (not d!143681) (not b!1337534) (not b_lambda!24217) (not d!143651) (not b!1337614) (not b!1337549) (not d!143723) (not d!143741) (not d!143729) (not b!1337522) (not b_lambda!24231) (not d!143731) (not d!143675) (not b!1337628) (not b!1337605) (not d!143691) b_and!50029 (not b!1337544) (not b!1337589) (not b!1337564) (not d!143761) (not b!1337629) (not mapNonEmpty!57123) (not b!1337568) (not d!143703) (not b!1337593) (not b!1337477) (not b!1337630) (not b!1337565) (not d!143715) (not d!143725) (not b!1337673) (not d!143689) (not b!1337577) (not b!1337555) (not b!1337618) (not b!1337570) (not d!143735) (not d!143695) (not b!1337574) (not d!143679) (not b!1337551) (not bm!64926))
(check-sat b_and!50029 (not b_next!31045))
