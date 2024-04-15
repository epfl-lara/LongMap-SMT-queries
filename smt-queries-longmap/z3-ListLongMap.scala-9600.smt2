; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113462 () Bool)

(assert start!113462)

(declare-fun b_free!31513 () Bool)

(declare-fun b_next!31513 () Bool)

(assert (=> start!113462 (= b_free!31513 (not b_next!31513))))

(declare-fun tp!110344 () Bool)

(declare-fun b_and!50783 () Bool)

(assert (=> start!113462 (= tp!110344 b_and!50783)))

(declare-fun b!1346935 () Bool)

(declare-fun res!893793 () Bool)

(declare-fun e!766372 () Bool)

(assert (=> b!1346935 (=> (not res!893793) (not e!766372))))

(declare-datatypes ((array!91803 0))(
  ( (array!91804 (arr!44358 (Array (_ BitVec 32) (_ BitVec 64))) (size!44910 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91803)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91803 (_ BitVec 32)) Bool)

(assert (=> b!1346935 (= res!893793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!893795 () Bool)

(assert (=> start!113462 (=> (not res!893795) (not e!766372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113462 (= res!893795 (validMask!0 mask!1977))))

(assert (=> start!113462 e!766372))

(declare-fun tp_is_empty!37513 () Bool)

(assert (=> start!113462 tp_is_empty!37513))

(assert (=> start!113462 true))

(declare-fun array_inv!33615 (array!91803) Bool)

(assert (=> start!113462 (array_inv!33615 _keys!1571)))

(declare-datatypes ((V!55121 0))(
  ( (V!55122 (val!18831 Int)) )
))
(declare-datatypes ((ValueCell!17858 0))(
  ( (ValueCellFull!17858 (v!21478 V!55121)) (EmptyCell!17858) )
))
(declare-datatypes ((array!91805 0))(
  ( (array!91806 (arr!44359 (Array (_ BitVec 32) ValueCell!17858)) (size!44911 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91805)

(declare-fun e!766375 () Bool)

(declare-fun array_inv!33616 (array!91805) Bool)

(assert (=> start!113462 (and (array_inv!33616 _values!1303) e!766375)))

(assert (=> start!113462 tp!110344))

(declare-fun minValue!1245 () V!55121)

(declare-fun zeroValue!1245 () V!55121)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun b!1346936 () Bool)

(declare-datatypes ((tuple2!24346 0))(
  ( (tuple2!24347 (_1!12184 (_ BitVec 64)) (_2!12184 V!55121)) )
))
(declare-datatypes ((List!31481 0))(
  ( (Nil!31478) (Cons!31477 (h!32686 tuple2!24346) (t!46065 List!31481)) )
))
(declare-datatypes ((ListLongMap!22003 0))(
  ( (ListLongMap!22004 (toList!11017 List!31481)) )
))
(declare-fun contains!9120 (ListLongMap!22003 (_ BitVec 64)) Bool)

(declare-fun +!4865 (ListLongMap!22003 tuple2!24346) ListLongMap!22003)

(declare-fun getCurrentListMapNoExtraKeys!6513 (array!91803 array!91805 (_ BitVec 32) (_ BitVec 32) V!55121 V!55121 (_ BitVec 32) Int) ListLongMap!22003)

(declare-fun get!22409 (ValueCell!17858 V!55121) V!55121)

(declare-fun dynLambda!3795 (Int (_ BitVec 64)) V!55121)

(assert (=> b!1346936 (= e!766372 (not (contains!9120 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))))

(declare-fun b!1346937 () Bool)

(declare-fun e!766376 () Bool)

(assert (=> b!1346937 (= e!766376 tp_is_empty!37513)))

(declare-fun b!1346938 () Bool)

(declare-fun res!893794 () Bool)

(assert (=> b!1346938 (=> (not res!893794) (not e!766372))))

(declare-fun getCurrentListMap!5854 (array!91803 array!91805 (_ BitVec 32) (_ BitVec 32) V!55121 V!55121 (_ BitVec 32) Int) ListLongMap!22003)

(assert (=> b!1346938 (= res!893794 (contains!9120 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57976 () Bool)

(declare-fun mapRes!57976 () Bool)

(assert (=> mapIsEmpty!57976 mapRes!57976))

(declare-fun b!1346939 () Bool)

(declare-fun res!893789 () Bool)

(assert (=> b!1346939 (=> (not res!893789) (not e!766372))))

(assert (=> b!1346939 (= res!893789 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346940 () Bool)

(declare-fun e!766374 () Bool)

(assert (=> b!1346940 (= e!766374 tp_is_empty!37513)))

(declare-fun b!1346941 () Bool)

(declare-fun res!893791 () Bool)

(assert (=> b!1346941 (=> (not res!893791) (not e!766372))))

(assert (=> b!1346941 (= res!893791 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1346942 () Bool)

(declare-fun res!893797 () Bool)

(assert (=> b!1346942 (=> (not res!893797) (not e!766372))))

(assert (=> b!1346942 (= res!893797 (not (= (select (arr!44358 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346943 () Bool)

(declare-fun res!893790 () Bool)

(assert (=> b!1346943 (=> (not res!893790) (not e!766372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346943 (= res!893790 (validKeyInArray!0 (select (arr!44358 _keys!1571) from!1960)))))

(declare-fun b!1346944 () Bool)

(declare-fun res!893792 () Bool)

(assert (=> b!1346944 (=> (not res!893792) (not e!766372))))

(assert (=> b!1346944 (= res!893792 (and (= (size!44911 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44910 _keys!1571) (size!44911 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346945 () Bool)

(assert (=> b!1346945 (= e!766375 (and e!766374 mapRes!57976))))

(declare-fun condMapEmpty!57976 () Bool)

(declare-fun mapDefault!57976 () ValueCell!17858)

(assert (=> b!1346945 (= condMapEmpty!57976 (= (arr!44359 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17858)) mapDefault!57976)))))

(declare-fun b!1346946 () Bool)

(declare-fun res!893796 () Bool)

(assert (=> b!1346946 (=> (not res!893796) (not e!766372))))

(declare-datatypes ((List!31482 0))(
  ( (Nil!31479) (Cons!31478 (h!32687 (_ BitVec 64)) (t!46066 List!31482)) )
))
(declare-fun arrayNoDuplicates!0 (array!91803 (_ BitVec 32) List!31482) Bool)

(assert (=> b!1346946 (= res!893796 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31479))))

(declare-fun mapNonEmpty!57976 () Bool)

(declare-fun tp!110345 () Bool)

(assert (=> mapNonEmpty!57976 (= mapRes!57976 (and tp!110345 e!766376))))

(declare-fun mapKey!57976 () (_ BitVec 32))

(declare-fun mapRest!57976 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapValue!57976 () ValueCell!17858)

(assert (=> mapNonEmpty!57976 (= (arr!44359 _values!1303) (store mapRest!57976 mapKey!57976 mapValue!57976))))

(assert (= (and start!113462 res!893795) b!1346944))

(assert (= (and b!1346944 res!893792) b!1346935))

(assert (= (and b!1346935 res!893793) b!1346946))

(assert (= (and b!1346946 res!893796) b!1346939))

(assert (= (and b!1346939 res!893789) b!1346938))

(assert (= (and b!1346938 res!893794) b!1346942))

(assert (= (and b!1346942 res!893797) b!1346943))

(assert (= (and b!1346943 res!893790) b!1346941))

(assert (= (and b!1346941 res!893791) b!1346936))

(assert (= (and b!1346945 condMapEmpty!57976) mapIsEmpty!57976))

(assert (= (and b!1346945 (not condMapEmpty!57976)) mapNonEmpty!57976))

(get-info :version)

(assert (= (and mapNonEmpty!57976 ((_ is ValueCellFull!17858) mapValue!57976)) b!1346937))

(assert (= (and b!1346945 ((_ is ValueCellFull!17858) mapDefault!57976)) b!1346940))

(assert (= start!113462 b!1346945))

(declare-fun b_lambda!24547 () Bool)

(assert (=> (not b_lambda!24547) (not b!1346936)))

(declare-fun t!46064 () Bool)

(declare-fun tb!12387 () Bool)

(assert (=> (and start!113462 (= defaultEntry!1306 defaultEntry!1306) t!46064) tb!12387))

(declare-fun result!25873 () Bool)

(assert (=> tb!12387 (= result!25873 tp_is_empty!37513)))

(assert (=> b!1346936 t!46064))

(declare-fun b_and!50785 () Bool)

(assert (= b_and!50783 (and (=> t!46064 result!25873) b_and!50785)))

(declare-fun m!1233427 () Bool)

(assert (=> b!1346935 m!1233427))

(declare-fun m!1233429 () Bool)

(assert (=> b!1346943 m!1233429))

(assert (=> b!1346943 m!1233429))

(declare-fun m!1233431 () Bool)

(assert (=> b!1346943 m!1233431))

(declare-fun m!1233433 () Bool)

(assert (=> start!113462 m!1233433))

(declare-fun m!1233435 () Bool)

(assert (=> start!113462 m!1233435))

(declare-fun m!1233437 () Bool)

(assert (=> start!113462 m!1233437))

(declare-fun m!1233439 () Bool)

(assert (=> b!1346936 m!1233439))

(declare-fun m!1233441 () Bool)

(assert (=> b!1346936 m!1233441))

(declare-fun m!1233443 () Bool)

(assert (=> b!1346936 m!1233443))

(declare-fun m!1233445 () Bool)

(assert (=> b!1346936 m!1233445))

(declare-fun m!1233447 () Bool)

(assert (=> b!1346936 m!1233447))

(declare-fun m!1233449 () Bool)

(assert (=> b!1346936 m!1233449))

(assert (=> b!1346936 m!1233443))

(declare-fun m!1233451 () Bool)

(assert (=> b!1346936 m!1233451))

(assert (=> b!1346936 m!1233445))

(assert (=> b!1346936 m!1233447))

(assert (=> b!1346936 m!1233429))

(assert (=> b!1346936 m!1233451))

(assert (=> b!1346936 m!1233439))

(declare-fun m!1233453 () Bool)

(assert (=> b!1346946 m!1233453))

(assert (=> b!1346942 m!1233429))

(declare-fun m!1233455 () Bool)

(assert (=> mapNonEmpty!57976 m!1233455))

(declare-fun m!1233457 () Bool)

(assert (=> b!1346938 m!1233457))

(assert (=> b!1346938 m!1233457))

(declare-fun m!1233459 () Bool)

(assert (=> b!1346938 m!1233459))

(check-sat (not start!113462) (not b!1346943) (not b!1346936) (not mapNonEmpty!57976) (not b!1346935) b_and!50785 (not b!1346946) tp_is_empty!37513 (not b_next!31513) (not b_lambda!24547) (not b!1346938))
(check-sat b_and!50785 (not b_next!31513))
(get-model)

(declare-fun b_lambda!24553 () Bool)

(assert (= b_lambda!24547 (or (and start!113462 b_free!31513) b_lambda!24553)))

(check-sat (not start!113462) (not b!1346943) (not b!1346938) (not b!1346936) (not mapNonEmpty!57976) (not b!1346935) (not b_lambda!24553) b_and!50785 (not b!1346946) tp_is_empty!37513 (not b_next!31513))
(check-sat b_and!50785 (not b_next!31513))
(get-model)

(declare-fun d!144179 () Bool)

(declare-fun e!766411 () Bool)

(assert (=> d!144179 e!766411))

(declare-fun res!893854 () Bool)

(assert (=> d!144179 (=> res!893854 e!766411)))

(declare-fun lt!595383 () Bool)

(assert (=> d!144179 (= res!893854 (not lt!595383))))

(declare-fun lt!595385 () Bool)

(assert (=> d!144179 (= lt!595383 lt!595385)))

(declare-datatypes ((Unit!43968 0))(
  ( (Unit!43969) )
))
(declare-fun lt!595386 () Unit!43968)

(declare-fun e!766412 () Unit!43968)

(assert (=> d!144179 (= lt!595386 e!766412)))

(declare-fun c!126283 () Bool)

(assert (=> d!144179 (= c!126283 lt!595385)))

(declare-fun containsKey!740 (List!31481 (_ BitVec 64)) Bool)

(assert (=> d!144179 (= lt!595385 (containsKey!740 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144179 (= (contains!9120 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!595383)))

(declare-fun b!1347031 () Bool)

(declare-fun lt!595384 () Unit!43968)

(assert (=> b!1347031 (= e!766412 lt!595384)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!487 (List!31481 (_ BitVec 64)) Unit!43968)

(assert (=> b!1347031 (= lt!595384 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!774 0))(
  ( (Some!773 (v!21481 V!55121)) (None!772) )
))
(declare-fun isDefined!530 (Option!774) Bool)

(declare-fun getValueByKey!723 (List!31481 (_ BitVec 64)) Option!774)

(assert (=> b!1347031 (isDefined!530 (getValueByKey!723 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1347032 () Bool)

(declare-fun Unit!43970 () Unit!43968)

(assert (=> b!1347032 (= e!766412 Unit!43970)))

(declare-fun b!1347033 () Bool)

(assert (=> b!1347033 (= e!766411 (isDefined!530 (getValueByKey!723 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144179 c!126283) b!1347031))

(assert (= (and d!144179 (not c!126283)) b!1347032))

(assert (= (and d!144179 (not res!893854)) b!1347033))

(declare-fun m!1233529 () Bool)

(assert (=> d!144179 m!1233529))

(declare-fun m!1233531 () Bool)

(assert (=> b!1347031 m!1233531))

(declare-fun m!1233533 () Bool)

(assert (=> b!1347031 m!1233533))

(assert (=> b!1347031 m!1233533))

(declare-fun m!1233535 () Bool)

(assert (=> b!1347031 m!1233535))

(assert (=> b!1347033 m!1233533))

(assert (=> b!1347033 m!1233533))

(assert (=> b!1347033 m!1233535))

(assert (=> b!1346938 d!144179))

(declare-fun b!1347076 () Bool)

(declare-fun e!766439 () Bool)

(declare-fun e!766450 () Bool)

(assert (=> b!1347076 (= e!766439 e!766450)))

(declare-fun res!893881 () Bool)

(declare-fun call!65038 () Bool)

(assert (=> b!1347076 (= res!893881 call!65038)))

(assert (=> b!1347076 (=> (not res!893881) (not e!766450))))

(declare-fun bm!65030 () Bool)

(declare-fun call!65033 () ListLongMap!22003)

(declare-fun call!65036 () ListLongMap!22003)

(assert (=> bm!65030 (= call!65033 call!65036)))

(declare-fun b!1347077 () Bool)

(declare-fun e!766447 () ListLongMap!22003)

(declare-fun call!65035 () ListLongMap!22003)

(assert (=> b!1347077 (= e!766447 call!65035)))

(declare-fun bm!65031 () Bool)

(declare-fun lt!595433 () ListLongMap!22003)

(assert (=> bm!65031 (= call!65038 (contains!9120 lt!595433 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347078 () Bool)

(declare-fun e!766442 () Bool)

(assert (=> b!1347078 (= e!766442 (validKeyInArray!0 (select (arr!44358 _keys!1571) from!1960)))))

(declare-fun b!1347079 () Bool)

(declare-fun e!766451 () Bool)

(declare-fun e!766443 () Bool)

(assert (=> b!1347079 (= e!766451 e!766443)))

(declare-fun res!893876 () Bool)

(declare-fun call!65037 () Bool)

(assert (=> b!1347079 (= res!893876 call!65037)))

(assert (=> b!1347079 (=> (not res!893876) (not e!766443))))

(declare-fun b!1347080 () Bool)

(declare-fun e!766445 () ListLongMap!22003)

(declare-fun e!766444 () ListLongMap!22003)

(assert (=> b!1347080 (= e!766445 e!766444)))

(declare-fun c!126301 () Bool)

(assert (=> b!1347080 (= c!126301 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65032 () Bool)

(declare-fun call!65039 () ListLongMap!22003)

(declare-fun call!65034 () ListLongMap!22003)

(assert (=> bm!65032 (= call!65039 call!65034)))

(declare-fun bm!65033 () Bool)

(assert (=> bm!65033 (= call!65036 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1347081 () Bool)

(assert (=> b!1347081 (= e!766447 call!65039)))

(declare-fun b!1347082 () Bool)

(declare-fun e!766440 () Unit!43968)

(declare-fun lt!595440 () Unit!43968)

(assert (=> b!1347082 (= e!766440 lt!595440)))

(declare-fun lt!595438 () ListLongMap!22003)

(assert (=> b!1347082 (= lt!595438 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595452 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595436 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595436 (select (arr!44358 _keys!1571) from!1960))))

(declare-fun lt!595441 () Unit!43968)

(declare-fun addStillContains!1206 (ListLongMap!22003 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!43968)

(assert (=> b!1347082 (= lt!595441 (addStillContains!1206 lt!595438 lt!595452 zeroValue!1245 lt!595436))))

(assert (=> b!1347082 (contains!9120 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245)) lt!595436)))

(declare-fun lt!595448 () Unit!43968)

(assert (=> b!1347082 (= lt!595448 lt!595441)))

(declare-fun lt!595442 () ListLongMap!22003)

(assert (=> b!1347082 (= lt!595442 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595432 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595432 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595450 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595450 (select (arr!44358 _keys!1571) from!1960))))

(declare-fun lt!595446 () Unit!43968)

(declare-fun addApplyDifferent!568 (ListLongMap!22003 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!43968)

(assert (=> b!1347082 (= lt!595446 (addApplyDifferent!568 lt!595442 lt!595432 minValue!1245 lt!595450))))

(declare-fun apply!1030 (ListLongMap!22003 (_ BitVec 64)) V!55121)

(assert (=> b!1347082 (= (apply!1030 (+!4865 lt!595442 (tuple2!24347 lt!595432 minValue!1245)) lt!595450) (apply!1030 lt!595442 lt!595450))))

(declare-fun lt!595444 () Unit!43968)

(assert (=> b!1347082 (= lt!595444 lt!595446)))

(declare-fun lt!595447 () ListLongMap!22003)

(assert (=> b!1347082 (= lt!595447 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595445 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595443 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595443 (select (arr!44358 _keys!1571) from!1960))))

(declare-fun lt!595439 () Unit!43968)

(assert (=> b!1347082 (= lt!595439 (addApplyDifferent!568 lt!595447 lt!595445 zeroValue!1245 lt!595443))))

(assert (=> b!1347082 (= (apply!1030 (+!4865 lt!595447 (tuple2!24347 lt!595445 zeroValue!1245)) lt!595443) (apply!1030 lt!595447 lt!595443))))

(declare-fun lt!595449 () Unit!43968)

(assert (=> b!1347082 (= lt!595449 lt!595439)))

(declare-fun lt!595435 () ListLongMap!22003)

(assert (=> b!1347082 (= lt!595435 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595431 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595437 () (_ BitVec 64))

(assert (=> b!1347082 (= lt!595437 (select (arr!44358 _keys!1571) from!1960))))

(assert (=> b!1347082 (= lt!595440 (addApplyDifferent!568 lt!595435 lt!595431 minValue!1245 lt!595437))))

(assert (=> b!1347082 (= (apply!1030 (+!4865 lt!595435 (tuple2!24347 lt!595431 minValue!1245)) lt!595437) (apply!1030 lt!595435 lt!595437))))

(declare-fun d!144181 () Bool)

(declare-fun e!766448 () Bool)

(assert (=> d!144181 e!766448))

(declare-fun res!893878 () Bool)

(assert (=> d!144181 (=> (not res!893878) (not e!766448))))

(assert (=> d!144181 (= res!893878 (or (bvsge from!1960 (size!44910 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)))))))

(declare-fun lt!595451 () ListLongMap!22003)

(assert (=> d!144181 (= lt!595433 lt!595451)))

(declare-fun lt!595434 () Unit!43968)

(assert (=> d!144181 (= lt!595434 e!766440)))

(declare-fun c!126297 () Bool)

(declare-fun e!766446 () Bool)

(assert (=> d!144181 (= c!126297 e!766446)))

(declare-fun res!893873 () Bool)

(assert (=> d!144181 (=> (not res!893873) (not e!766446))))

(assert (=> d!144181 (= res!893873 (bvslt from!1960 (size!44910 _keys!1571)))))

(assert (=> d!144181 (= lt!595451 e!766445)))

(declare-fun c!126298 () Bool)

(assert (=> d!144181 (= c!126298 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144181 (validMask!0 mask!1977)))

(assert (=> d!144181 (= (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!595433)))

(declare-fun b!1347083 () Bool)

(assert (=> b!1347083 (= e!766446 (validKeyInArray!0 (select (arr!44358 _keys!1571) from!1960)))))

(declare-fun b!1347084 () Bool)

(assert (=> b!1347084 (= e!766445 (+!4865 call!65034 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1347085 () Bool)

(assert (=> b!1347085 (= e!766439 (not call!65038))))

(declare-fun b!1347086 () Bool)

(assert (=> b!1347086 (= e!766450 (= (apply!1030 lt!595433 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1347087 () Bool)

(assert (=> b!1347087 (= e!766443 (= (apply!1030 lt!595433 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun bm!65034 () Bool)

(assert (=> bm!65034 (= call!65037 (contains!9120 lt!595433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!766441 () Bool)

(declare-fun b!1347088 () Bool)

(assert (=> b!1347088 (= e!766441 (= (apply!1030 lt!595433 (select (arr!44358 _keys!1571) from!1960)) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347088 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44911 _values!1303)))))

(assert (=> b!1347088 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)))))

(declare-fun b!1347089 () Bool)

(declare-fun Unit!43971 () Unit!43968)

(assert (=> b!1347089 (= e!766440 Unit!43971)))

(declare-fun b!1347090 () Bool)

(assert (=> b!1347090 (= e!766451 (not call!65037))))

(declare-fun b!1347091 () Bool)

(assert (=> b!1347091 (= e!766448 e!766439)))

(declare-fun c!126299 () Bool)

(assert (=> b!1347091 (= c!126299 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65035 () Bool)

(assert (=> bm!65035 (= call!65035 call!65033)))

(declare-fun b!1347092 () Bool)

(declare-fun res!893875 () Bool)

(assert (=> b!1347092 (=> (not res!893875) (not e!766448))))

(assert (=> b!1347092 (= res!893875 e!766451)))

(declare-fun c!126296 () Bool)

(assert (=> b!1347092 (= c!126296 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347093 () Bool)

(declare-fun res!893874 () Bool)

(assert (=> b!1347093 (=> (not res!893874) (not e!766448))))

(declare-fun e!766449 () Bool)

(assert (=> b!1347093 (= res!893874 e!766449)))

(declare-fun res!893877 () Bool)

(assert (=> b!1347093 (=> res!893877 e!766449)))

(assert (=> b!1347093 (= res!893877 (not e!766442))))

(declare-fun res!893879 () Bool)

(assert (=> b!1347093 (=> (not res!893879) (not e!766442))))

(assert (=> b!1347093 (= res!893879 (bvslt from!1960 (size!44910 _keys!1571)))))

(declare-fun b!1347094 () Bool)

(assert (=> b!1347094 (= e!766444 call!65039)))

(declare-fun b!1347095 () Bool)

(assert (=> b!1347095 (= e!766449 e!766441)))

(declare-fun res!893880 () Bool)

(assert (=> b!1347095 (=> (not res!893880) (not e!766441))))

(assert (=> b!1347095 (= res!893880 (contains!9120 lt!595433 (select (arr!44358 _keys!1571) from!1960)))))

(assert (=> b!1347095 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)))))

(declare-fun bm!65036 () Bool)

(assert (=> bm!65036 (= call!65034 (+!4865 (ite c!126298 call!65036 (ite c!126301 call!65033 call!65035)) (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1347096 () Bool)

(declare-fun c!126300 () Bool)

(assert (=> b!1347096 (= c!126300 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1347096 (= e!766444 e!766447)))

(assert (= (and d!144181 c!126298) b!1347084))

(assert (= (and d!144181 (not c!126298)) b!1347080))

(assert (= (and b!1347080 c!126301) b!1347094))

(assert (= (and b!1347080 (not c!126301)) b!1347096))

(assert (= (and b!1347096 c!126300) b!1347081))

(assert (= (and b!1347096 (not c!126300)) b!1347077))

(assert (= (or b!1347081 b!1347077) bm!65035))

(assert (= (or b!1347094 bm!65035) bm!65030))

(assert (= (or b!1347094 b!1347081) bm!65032))

(assert (= (or b!1347084 bm!65030) bm!65033))

(assert (= (or b!1347084 bm!65032) bm!65036))

(assert (= (and d!144181 res!893873) b!1347083))

(assert (= (and d!144181 c!126297) b!1347082))

(assert (= (and d!144181 (not c!126297)) b!1347089))

(assert (= (and d!144181 res!893878) b!1347093))

(assert (= (and b!1347093 res!893879) b!1347078))

(assert (= (and b!1347093 (not res!893877)) b!1347095))

(assert (= (and b!1347095 res!893880) b!1347088))

(assert (= (and b!1347093 res!893874) b!1347092))

(assert (= (and b!1347092 c!126296) b!1347079))

(assert (= (and b!1347092 (not c!126296)) b!1347090))

(assert (= (and b!1347079 res!893876) b!1347087))

(assert (= (or b!1347079 b!1347090) bm!65034))

(assert (= (and b!1347092 res!893875) b!1347091))

(assert (= (and b!1347091 c!126299) b!1347076))

(assert (= (and b!1347091 (not c!126299)) b!1347085))

(assert (= (and b!1347076 res!893881) b!1347086))

(assert (= (or b!1347076 b!1347085) bm!65031))

(declare-fun b_lambda!24555 () Bool)

(assert (=> (not b_lambda!24555) (not b!1347088)))

(assert (=> b!1347088 t!46064))

(declare-fun b_and!50795 () Bool)

(assert (= b_and!50785 (and (=> t!46064 result!25873) b_and!50795)))

(declare-fun m!1233537 () Bool)

(assert (=> b!1347087 m!1233537))

(assert (=> b!1347088 m!1233447))

(assert (=> b!1347088 m!1233445))

(assert (=> b!1347088 m!1233447))

(assert (=> b!1347088 m!1233449))

(assert (=> b!1347088 m!1233445))

(assert (=> b!1347088 m!1233429))

(assert (=> b!1347088 m!1233429))

(declare-fun m!1233539 () Bool)

(assert (=> b!1347088 m!1233539))

(declare-fun m!1233541 () Bool)

(assert (=> bm!65036 m!1233541))

(declare-fun m!1233543 () Bool)

(assert (=> bm!65034 m!1233543))

(declare-fun m!1233545 () Bool)

(assert (=> b!1347082 m!1233545))

(declare-fun m!1233547 () Bool)

(assert (=> b!1347082 m!1233547))

(declare-fun m!1233549 () Bool)

(assert (=> b!1347082 m!1233549))

(declare-fun m!1233551 () Bool)

(assert (=> b!1347082 m!1233551))

(declare-fun m!1233553 () Bool)

(assert (=> b!1347082 m!1233553))

(declare-fun m!1233555 () Bool)

(assert (=> b!1347082 m!1233555))

(declare-fun m!1233557 () Bool)

(assert (=> b!1347082 m!1233557))

(assert (=> b!1347082 m!1233545))

(declare-fun m!1233559 () Bool)

(assert (=> b!1347082 m!1233559))

(declare-fun m!1233561 () Bool)

(assert (=> b!1347082 m!1233561))

(declare-fun m!1233563 () Bool)

(assert (=> b!1347082 m!1233563))

(assert (=> b!1347082 m!1233549))

(declare-fun m!1233565 () Bool)

(assert (=> b!1347082 m!1233565))

(assert (=> b!1347082 m!1233429))

(declare-fun m!1233567 () Bool)

(assert (=> b!1347082 m!1233567))

(declare-fun m!1233569 () Bool)

(assert (=> b!1347082 m!1233569))

(declare-fun m!1233571 () Bool)

(assert (=> b!1347082 m!1233571))

(assert (=> b!1347082 m!1233555))

(declare-fun m!1233573 () Bool)

(assert (=> b!1347082 m!1233573))

(assert (=> b!1347082 m!1233561))

(declare-fun m!1233575 () Bool)

(assert (=> b!1347082 m!1233575))

(declare-fun m!1233577 () Bool)

(assert (=> b!1347086 m!1233577))

(declare-fun m!1233579 () Bool)

(assert (=> bm!65031 m!1233579))

(assert (=> d!144181 m!1233433))

(assert (=> b!1347095 m!1233429))

(assert (=> b!1347095 m!1233429))

(declare-fun m!1233581 () Bool)

(assert (=> b!1347095 m!1233581))

(assert (=> b!1347083 m!1233429))

(assert (=> b!1347083 m!1233429))

(assert (=> b!1347083 m!1233431))

(declare-fun m!1233583 () Bool)

(assert (=> b!1347084 m!1233583))

(assert (=> bm!65033 m!1233559))

(assert (=> b!1347078 m!1233429))

(assert (=> b!1347078 m!1233429))

(assert (=> b!1347078 m!1233431))

(assert (=> b!1346938 d!144181))

(declare-fun bm!65039 () Bool)

(declare-fun call!65042 () Bool)

(declare-fun c!126304 () Bool)

(assert (=> bm!65039 (= call!65042 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126304 (Cons!31478 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) Nil!31479) Nil!31479)))))

(declare-fun b!1347107 () Bool)

(declare-fun e!766463 () Bool)

(declare-fun e!766460 () Bool)

(assert (=> b!1347107 (= e!766463 e!766460)))

(assert (=> b!1347107 (= c!126304 (validKeyInArray!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347108 () Bool)

(declare-fun e!766461 () Bool)

(assert (=> b!1347108 (= e!766461 e!766463)))

(declare-fun res!893889 () Bool)

(assert (=> b!1347108 (=> (not res!893889) (not e!766463))))

(declare-fun e!766462 () Bool)

(assert (=> b!1347108 (= res!893889 (not e!766462))))

(declare-fun res!893890 () Bool)

(assert (=> b!1347108 (=> (not res!893890) (not e!766462))))

(assert (=> b!1347108 (= res!893890 (validKeyInArray!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347109 () Bool)

(assert (=> b!1347109 (= e!766460 call!65042)))

(declare-fun b!1347110 () Bool)

(declare-fun contains!9123 (List!31482 (_ BitVec 64)) Bool)

(assert (=> b!1347110 (= e!766462 (contains!9123 Nil!31479 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347111 () Bool)

(assert (=> b!1347111 (= e!766460 call!65042)))

(declare-fun d!144183 () Bool)

(declare-fun res!893888 () Bool)

(assert (=> d!144183 (=> res!893888 e!766461)))

(assert (=> d!144183 (= res!893888 (bvsge #b00000000000000000000000000000000 (size!44910 _keys!1571)))))

(assert (=> d!144183 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31479) e!766461)))

(assert (= (and d!144183 (not res!893888)) b!1347108))

(assert (= (and b!1347108 res!893890) b!1347110))

(assert (= (and b!1347108 res!893889) b!1347107))

(assert (= (and b!1347107 c!126304) b!1347109))

(assert (= (and b!1347107 (not c!126304)) b!1347111))

(assert (= (or b!1347109 b!1347111) bm!65039))

(declare-fun m!1233585 () Bool)

(assert (=> bm!65039 m!1233585))

(declare-fun m!1233587 () Bool)

(assert (=> bm!65039 m!1233587))

(assert (=> b!1347107 m!1233585))

(assert (=> b!1347107 m!1233585))

(declare-fun m!1233589 () Bool)

(assert (=> b!1347107 m!1233589))

(assert (=> b!1347108 m!1233585))

(assert (=> b!1347108 m!1233585))

(assert (=> b!1347108 m!1233589))

(assert (=> b!1347110 m!1233585))

(assert (=> b!1347110 m!1233585))

(declare-fun m!1233591 () Bool)

(assert (=> b!1347110 m!1233591))

(assert (=> b!1346946 d!144183))

(declare-fun d!144185 () Bool)

(declare-fun e!766466 () Bool)

(assert (=> d!144185 e!766466))

(declare-fun res!893895 () Bool)

(assert (=> d!144185 (=> (not res!893895) (not e!766466))))

(declare-fun lt!595462 () ListLongMap!22003)

(assert (=> d!144185 (= res!893895 (contains!9120 lt!595462 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!595464 () List!31481)

(assert (=> d!144185 (= lt!595462 (ListLongMap!22004 lt!595464))))

(declare-fun lt!595461 () Unit!43968)

(declare-fun lt!595463 () Unit!43968)

(assert (=> d!144185 (= lt!595461 lt!595463)))

(assert (=> d!144185 (= (getValueByKey!723 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!366 (List!31481 (_ BitVec 64) V!55121) Unit!43968)

(assert (=> d!144185 (= lt!595463 (lemmaContainsTupThenGetReturnValue!366 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!495 (List!31481 (_ BitVec 64) V!55121) List!31481)

(assert (=> d!144185 (= lt!595464 (insertStrictlySorted!495 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144185 (= (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!595462)))

(declare-fun b!1347116 () Bool)

(declare-fun res!893896 () Bool)

(assert (=> b!1347116 (=> (not res!893896) (not e!766466))))

(assert (=> b!1347116 (= res!893896 (= (getValueByKey!723 (toList!11017 lt!595462) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1347117 () Bool)

(declare-fun contains!9124 (List!31481 tuple2!24346) Bool)

(assert (=> b!1347117 (= e!766466 (contains!9124 (toList!11017 lt!595462) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144185 res!893895) b!1347116))

(assert (= (and b!1347116 res!893896) b!1347117))

(declare-fun m!1233593 () Bool)

(assert (=> d!144185 m!1233593))

(declare-fun m!1233595 () Bool)

(assert (=> d!144185 m!1233595))

(declare-fun m!1233597 () Bool)

(assert (=> d!144185 m!1233597))

(declare-fun m!1233599 () Bool)

(assert (=> d!144185 m!1233599))

(declare-fun m!1233601 () Bool)

(assert (=> b!1347116 m!1233601))

(declare-fun m!1233603 () Bool)

(assert (=> b!1347117 m!1233603))

(assert (=> b!1346936 d!144185))

(declare-fun d!144187 () Bool)

(declare-fun c!126307 () Bool)

(assert (=> d!144187 (= c!126307 ((_ is ValueCellFull!17858) (select (arr!44359 _values!1303) from!1960)))))

(declare-fun e!766469 () V!55121)

(assert (=> d!144187 (= (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!766469)))

(declare-fun b!1347122 () Bool)

(declare-fun get!22411 (ValueCell!17858 V!55121) V!55121)

(assert (=> b!1347122 (= e!766469 (get!22411 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347123 () Bool)

(declare-fun get!22412 (ValueCell!17858 V!55121) V!55121)

(assert (=> b!1347123 (= e!766469 (get!22412 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144187 c!126307) b!1347122))

(assert (= (and d!144187 (not c!126307)) b!1347123))

(assert (=> b!1347122 m!1233445))

(assert (=> b!1347122 m!1233447))

(declare-fun m!1233605 () Bool)

(assert (=> b!1347122 m!1233605))

(assert (=> b!1347123 m!1233445))

(assert (=> b!1347123 m!1233447))

(declare-fun m!1233607 () Bool)

(assert (=> b!1347123 m!1233607))

(assert (=> b!1346936 d!144187))

(declare-fun d!144189 () Bool)

(declare-fun e!766470 () Bool)

(assert (=> d!144189 e!766470))

(declare-fun res!893897 () Bool)

(assert (=> d!144189 (=> (not res!893897) (not e!766470))))

(declare-fun lt!595466 () ListLongMap!22003)

(assert (=> d!144189 (= res!893897 (contains!9120 lt!595466 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!595468 () List!31481)

(assert (=> d!144189 (= lt!595466 (ListLongMap!22004 lt!595468))))

(declare-fun lt!595465 () Unit!43968)

(declare-fun lt!595467 () Unit!43968)

(assert (=> d!144189 (= lt!595465 lt!595467)))

(assert (=> d!144189 (= (getValueByKey!723 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144189 (= lt!595467 (lemmaContainsTupThenGetReturnValue!366 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144189 (= lt!595468 (insertStrictlySorted!495 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144189 (= (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!595466)))

(declare-fun b!1347124 () Bool)

(declare-fun res!893898 () Bool)

(assert (=> b!1347124 (=> (not res!893898) (not e!766470))))

(assert (=> b!1347124 (= res!893898 (= (getValueByKey!723 (toList!11017 lt!595466) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1347125 () Bool)

(assert (=> b!1347125 (= e!766470 (contains!9124 (toList!11017 lt!595466) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144189 res!893897) b!1347124))

(assert (= (and b!1347124 res!893898) b!1347125))

(declare-fun m!1233609 () Bool)

(assert (=> d!144189 m!1233609))

(declare-fun m!1233611 () Bool)

(assert (=> d!144189 m!1233611))

(declare-fun m!1233613 () Bool)

(assert (=> d!144189 m!1233613))

(declare-fun m!1233615 () Bool)

(assert (=> d!144189 m!1233615))

(declare-fun m!1233617 () Bool)

(assert (=> b!1347124 m!1233617))

(declare-fun m!1233619 () Bool)

(assert (=> b!1347125 m!1233619))

(assert (=> b!1346936 d!144189))

(declare-fun d!144191 () Bool)

(declare-fun e!766471 () Bool)

(assert (=> d!144191 e!766471))

(declare-fun res!893899 () Bool)

(assert (=> d!144191 (=> res!893899 e!766471)))

(declare-fun lt!595469 () Bool)

(assert (=> d!144191 (= res!893899 (not lt!595469))))

(declare-fun lt!595471 () Bool)

(assert (=> d!144191 (= lt!595469 lt!595471)))

(declare-fun lt!595472 () Unit!43968)

(declare-fun e!766472 () Unit!43968)

(assert (=> d!144191 (= lt!595472 e!766472)))

(declare-fun c!126308 () Bool)

(assert (=> d!144191 (= c!126308 lt!595471)))

(assert (=> d!144191 (= lt!595471 (containsKey!740 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> d!144191 (= (contains!9120 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142) lt!595469)))

(declare-fun b!1347126 () Bool)

(declare-fun lt!595470 () Unit!43968)

(assert (=> b!1347126 (= e!766472 lt!595470)))

(assert (=> b!1347126 (= lt!595470 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> b!1347126 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun b!1347127 () Bool)

(declare-fun Unit!43972 () Unit!43968)

(assert (=> b!1347127 (= e!766472 Unit!43972)))

(declare-fun b!1347128 () Bool)

(assert (=> b!1347128 (= e!766471 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)))))

(assert (= (and d!144191 c!126308) b!1347126))

(assert (= (and d!144191 (not c!126308)) b!1347127))

(assert (= (and d!144191 (not res!893899)) b!1347128))

(declare-fun m!1233621 () Bool)

(assert (=> d!144191 m!1233621))

(declare-fun m!1233623 () Bool)

(assert (=> b!1347126 m!1233623))

(declare-fun m!1233625 () Bool)

(assert (=> b!1347126 m!1233625))

(assert (=> b!1347126 m!1233625))

(declare-fun m!1233627 () Bool)

(assert (=> b!1347126 m!1233627))

(assert (=> b!1347128 m!1233625))

(assert (=> b!1347128 m!1233625))

(assert (=> b!1347128 m!1233627))

(assert (=> b!1346936 d!144191))

(declare-fun bm!65042 () Bool)

(declare-fun call!65045 () ListLongMap!22003)

(assert (=> bm!65042 (= call!65045 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1347153 () Bool)

(declare-fun lt!595489 () Unit!43968)

(declare-fun lt!595490 () Unit!43968)

(assert (=> b!1347153 (= lt!595489 lt!595490)))

(declare-fun lt!595491 () V!55121)

(declare-fun lt!595493 () (_ BitVec 64))

(declare-fun lt!595492 () (_ BitVec 64))

(declare-fun lt!595487 () ListLongMap!22003)

(assert (=> b!1347153 (not (contains!9120 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491)) lt!595492))))

(declare-fun addStillNotContains!489 (ListLongMap!22003 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!43968)

(assert (=> b!1347153 (= lt!595490 (addStillNotContains!489 lt!595487 lt!595493 lt!595491 lt!595492))))

(assert (=> b!1347153 (= lt!595492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1347153 (= lt!595491 (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1347153 (= lt!595493 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1347153 (= lt!595487 call!65045)))

(declare-fun e!766493 () ListLongMap!22003)

(assert (=> b!1347153 (= e!766493 (+!4865 call!65045 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!144193 () Bool)

(declare-fun e!766491 () Bool)

(assert (=> d!144193 e!766491))

(declare-fun res!893909 () Bool)

(assert (=> d!144193 (=> (not res!893909) (not e!766491))))

(declare-fun lt!595488 () ListLongMap!22003)

(assert (=> d!144193 (= res!893909 (not (contains!9120 lt!595488 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766487 () ListLongMap!22003)

(assert (=> d!144193 (= lt!595488 e!766487)))

(declare-fun c!126320 () Bool)

(assert (=> d!144193 (= c!126320 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44910 _keys!1571)))))

(assert (=> d!144193 (validMask!0 mask!1977)))

(assert (=> d!144193 (= (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!595488)))

(declare-fun b!1347154 () Bool)

(assert (=> b!1347154 (= e!766493 call!65045)))

(declare-fun b!1347155 () Bool)

(assert (=> b!1347155 (= e!766487 (ListLongMap!22004 Nil!31478))))

(declare-fun b!1347156 () Bool)

(declare-fun e!766489 () Bool)

(assert (=> b!1347156 (= e!766489 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1347156 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1347157 () Bool)

(declare-fun res!893911 () Bool)

(assert (=> b!1347157 (=> (not res!893911) (not e!766491))))

(assert (=> b!1347157 (= res!893911 (not (contains!9120 lt!595488 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347158 () Bool)

(assert (=> b!1347158 (= e!766487 e!766493)))

(declare-fun c!126319 () Bool)

(assert (=> b!1347158 (= c!126319 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1347159 () Bool)

(declare-fun e!766488 () Bool)

(declare-fun e!766492 () Bool)

(assert (=> b!1347159 (= e!766488 e!766492)))

(assert (=> b!1347159 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44910 _keys!1571)))))

(declare-fun res!893910 () Bool)

(assert (=> b!1347159 (= res!893910 (contains!9120 lt!595488 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1347159 (=> (not res!893910) (not e!766492))))

(declare-fun e!766490 () Bool)

(declare-fun b!1347160 () Bool)

(assert (=> b!1347160 (= e!766490 (= lt!595488 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1347161 () Bool)

(assert (=> b!1347161 (= e!766491 e!766488)))

(declare-fun c!126318 () Bool)

(assert (=> b!1347161 (= c!126318 e!766489)))

(declare-fun res!893908 () Bool)

(assert (=> b!1347161 (=> (not res!893908) (not e!766489))))

(assert (=> b!1347161 (= res!893908 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44910 _keys!1571)))))

(declare-fun b!1347162 () Bool)

(declare-fun isEmpty!1097 (ListLongMap!22003) Bool)

(assert (=> b!1347162 (= e!766490 (isEmpty!1097 lt!595488))))

(declare-fun b!1347163 () Bool)

(assert (=> b!1347163 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44910 _keys!1571)))))

(assert (=> b!1347163 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44911 _values!1303)))))

(assert (=> b!1347163 (= e!766492 (= (apply!1030 lt!595488 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347164 () Bool)

(assert (=> b!1347164 (= e!766488 e!766490)))

(declare-fun c!126317 () Bool)

(assert (=> b!1347164 (= c!126317 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44910 _keys!1571)))))

(assert (= (and d!144193 c!126320) b!1347155))

(assert (= (and d!144193 (not c!126320)) b!1347158))

(assert (= (and b!1347158 c!126319) b!1347153))

(assert (= (and b!1347158 (not c!126319)) b!1347154))

(assert (= (or b!1347153 b!1347154) bm!65042))

(assert (= (and d!144193 res!893909) b!1347157))

(assert (= (and b!1347157 res!893911) b!1347161))

(assert (= (and b!1347161 res!893908) b!1347156))

(assert (= (and b!1347161 c!126318) b!1347159))

(assert (= (and b!1347161 (not c!126318)) b!1347164))

(assert (= (and b!1347159 res!893910) b!1347163))

(assert (= (and b!1347164 c!126317) b!1347160))

(assert (= (and b!1347164 (not c!126317)) b!1347162))

(declare-fun b_lambda!24557 () Bool)

(assert (=> (not b_lambda!24557) (not b!1347153)))

(assert (=> b!1347153 t!46064))

(declare-fun b_and!50797 () Bool)

(assert (= b_and!50795 (and (=> t!46064 result!25873) b_and!50797)))

(declare-fun b_lambda!24559 () Bool)

(assert (=> (not b_lambda!24559) (not b!1347163)))

(assert (=> b!1347163 t!46064))

(declare-fun b_and!50799 () Bool)

(assert (= b_and!50797 (and (=> t!46064 result!25873) b_and!50799)))

(declare-fun m!1233629 () Bool)

(assert (=> b!1347158 m!1233629))

(assert (=> b!1347158 m!1233629))

(declare-fun m!1233631 () Bool)

(assert (=> b!1347158 m!1233631))

(declare-fun m!1233633 () Bool)

(assert (=> b!1347162 m!1233633))

(assert (=> b!1347159 m!1233629))

(assert (=> b!1347159 m!1233629))

(declare-fun m!1233635 () Bool)

(assert (=> b!1347159 m!1233635))

(declare-fun m!1233637 () Bool)

(assert (=> b!1347157 m!1233637))

(declare-fun m!1233639 () Bool)

(assert (=> b!1347160 m!1233639))

(assert (=> b!1347156 m!1233629))

(assert (=> b!1347156 m!1233629))

(assert (=> b!1347156 m!1233631))

(assert (=> b!1347163 m!1233629))

(declare-fun m!1233641 () Bool)

(assert (=> b!1347163 m!1233641))

(assert (=> b!1347163 m!1233629))

(declare-fun m!1233643 () Bool)

(assert (=> b!1347163 m!1233643))

(assert (=> b!1347163 m!1233447))

(declare-fun m!1233645 () Bool)

(assert (=> b!1347163 m!1233645))

(assert (=> b!1347163 m!1233447))

(assert (=> b!1347163 m!1233643))

(assert (=> bm!65042 m!1233639))

(declare-fun m!1233647 () Bool)

(assert (=> d!144193 m!1233647))

(assert (=> d!144193 m!1233433))

(declare-fun m!1233649 () Bool)

(assert (=> b!1347153 m!1233649))

(declare-fun m!1233651 () Bool)

(assert (=> b!1347153 m!1233651))

(assert (=> b!1347153 m!1233649))

(declare-fun m!1233653 () Bool)

(assert (=> b!1347153 m!1233653))

(assert (=> b!1347153 m!1233643))

(assert (=> b!1347153 m!1233447))

(assert (=> b!1347153 m!1233645))

(assert (=> b!1347153 m!1233447))

(assert (=> b!1347153 m!1233643))

(declare-fun m!1233655 () Bool)

(assert (=> b!1347153 m!1233655))

(assert (=> b!1347153 m!1233629))

(assert (=> b!1346936 d!144193))

(declare-fun bm!65045 () Bool)

(declare-fun call!65048 () Bool)

(assert (=> bm!65045 (= call!65048 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1347173 () Bool)

(declare-fun e!766501 () Bool)

(assert (=> b!1347173 (= e!766501 call!65048)))

(declare-fun d!144195 () Bool)

(declare-fun res!893916 () Bool)

(declare-fun e!766502 () Bool)

(assert (=> d!144195 (=> res!893916 e!766502)))

(assert (=> d!144195 (= res!893916 (bvsge #b00000000000000000000000000000000 (size!44910 _keys!1571)))))

(assert (=> d!144195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!766502)))

(declare-fun b!1347174 () Bool)

(declare-fun e!766500 () Bool)

(assert (=> b!1347174 (= e!766500 call!65048)))

(declare-fun b!1347175 () Bool)

(assert (=> b!1347175 (= e!766501 e!766500)))

(declare-fun lt!595502 () (_ BitVec 64))

(assert (=> b!1347175 (= lt!595502 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!595500 () Unit!43968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91803 (_ BitVec 64) (_ BitVec 32)) Unit!43968)

(assert (=> b!1347175 (= lt!595500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595502 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1347175 (arrayContainsKey!0 _keys!1571 lt!595502 #b00000000000000000000000000000000)))

(declare-fun lt!595501 () Unit!43968)

(assert (=> b!1347175 (= lt!595501 lt!595500)))

(declare-fun res!893917 () Bool)

(declare-datatypes ((SeekEntryResult!10055 0))(
  ( (MissingZero!10055 (index!42591 (_ BitVec 32))) (Found!10055 (index!42592 (_ BitVec 32))) (Intermediate!10055 (undefined!10867 Bool) (index!42593 (_ BitVec 32)) (x!120556 (_ BitVec 32))) (Undefined!10055) (MissingVacant!10055 (index!42594 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91803 (_ BitVec 32)) SeekEntryResult!10055)

(assert (=> b!1347175 (= res!893917 (= (seekEntryOrOpen!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10055 #b00000000000000000000000000000000)))))

(assert (=> b!1347175 (=> (not res!893917) (not e!766500))))

(declare-fun b!1347176 () Bool)

(assert (=> b!1347176 (= e!766502 e!766501)))

(declare-fun c!126323 () Bool)

(assert (=> b!1347176 (= c!126323 (validKeyInArray!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144195 (not res!893916)) b!1347176))

(assert (= (and b!1347176 c!126323) b!1347175))

(assert (= (and b!1347176 (not c!126323)) b!1347173))

(assert (= (and b!1347175 res!893917) b!1347174))

(assert (= (or b!1347174 b!1347173) bm!65045))

(declare-fun m!1233657 () Bool)

(assert (=> bm!65045 m!1233657))

(assert (=> b!1347175 m!1233585))

(declare-fun m!1233659 () Bool)

(assert (=> b!1347175 m!1233659))

(declare-fun m!1233661 () Bool)

(assert (=> b!1347175 m!1233661))

(assert (=> b!1347175 m!1233585))

(declare-fun m!1233663 () Bool)

(assert (=> b!1347175 m!1233663))

(assert (=> b!1347176 m!1233585))

(assert (=> b!1347176 m!1233585))

(assert (=> b!1347176 m!1233589))

(assert (=> b!1346935 d!144195))

(declare-fun d!144197 () Bool)

(assert (=> d!144197 (= (validKeyInArray!0 (select (arr!44358 _keys!1571) from!1960)) (and (not (= (select (arr!44358 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44358 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1346943 d!144197))

(declare-fun d!144199 () Bool)

(assert (=> d!144199 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113462 d!144199))

(declare-fun d!144201 () Bool)

(assert (=> d!144201 (= (array_inv!33615 _keys!1571) (bvsge (size!44910 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113462 d!144201))

(declare-fun d!144203 () Bool)

(assert (=> d!144203 (= (array_inv!33616 _values!1303) (bvsge (size!44911 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113462 d!144203))

(declare-fun mapNonEmpty!57985 () Bool)

(declare-fun mapRes!57985 () Bool)

(declare-fun tp!110360 () Bool)

(declare-fun e!766508 () Bool)

(assert (=> mapNonEmpty!57985 (= mapRes!57985 (and tp!110360 e!766508))))

(declare-fun mapValue!57985 () ValueCell!17858)

(declare-fun mapRest!57985 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapKey!57985 () (_ BitVec 32))

(assert (=> mapNonEmpty!57985 (= mapRest!57976 (store mapRest!57985 mapKey!57985 mapValue!57985))))

(declare-fun b!1347184 () Bool)

(declare-fun e!766507 () Bool)

(assert (=> b!1347184 (= e!766507 tp_is_empty!37513)))

(declare-fun condMapEmpty!57985 () Bool)

(declare-fun mapDefault!57985 () ValueCell!17858)

(assert (=> mapNonEmpty!57976 (= condMapEmpty!57985 (= mapRest!57976 ((as const (Array (_ BitVec 32) ValueCell!17858)) mapDefault!57985)))))

(assert (=> mapNonEmpty!57976 (= tp!110345 (and e!766507 mapRes!57985))))

(declare-fun b!1347183 () Bool)

(assert (=> b!1347183 (= e!766508 tp_is_empty!37513)))

(declare-fun mapIsEmpty!57985 () Bool)

(assert (=> mapIsEmpty!57985 mapRes!57985))

(assert (= (and mapNonEmpty!57976 condMapEmpty!57985) mapIsEmpty!57985))

(assert (= (and mapNonEmpty!57976 (not condMapEmpty!57985)) mapNonEmpty!57985))

(assert (= (and mapNonEmpty!57985 ((_ is ValueCellFull!17858) mapValue!57985)) b!1347183))

(assert (= (and mapNonEmpty!57976 ((_ is ValueCellFull!17858) mapDefault!57985)) b!1347184))

(declare-fun m!1233665 () Bool)

(assert (=> mapNonEmpty!57985 m!1233665))

(declare-fun b_lambda!24561 () Bool)

(assert (= b_lambda!24555 (or (and start!113462 b_free!31513) b_lambda!24561)))

(declare-fun b_lambda!24563 () Bool)

(assert (= b_lambda!24557 (or (and start!113462 b_free!31513) b_lambda!24563)))

(declare-fun b_lambda!24565 () Bool)

(assert (= b_lambda!24559 (or (and start!113462 b_free!31513) b_lambda!24565)))

(check-sat (not b!1347116) (not b!1347125) (not b!1347083) (not b!1347107) (not b!1347031) (not b!1347123) (not bm!65039) (not b!1347158) (not d!144179) (not b!1347156) (not b_lambda!24563) (not bm!65042) (not b!1347078) (not bm!65031) (not b!1347176) (not b!1347108) (not bm!65036) (not b!1347128) (not b!1347087) (not mapNonEmpty!57985) (not d!144189) (not b!1347084) (not b!1347175) (not b!1347160) (not b!1347088) (not b!1347082) (not b!1347124) (not b!1347122) (not d!144185) (not b!1347086) b_and!50799 (not d!144191) (not bm!65034) (not d!144193) (not b_lambda!24565) (not b_lambda!24553) (not bm!65033) (not b!1347153) (not b!1347095) (not b!1347163) (not b!1347117) (not b!1347159) (not b!1347033) (not b_lambda!24561) tp_is_empty!37513 (not b_next!31513) (not b!1347162) (not bm!65045) (not b!1347157) (not b!1347126) (not b!1347110) (not d!144181))
(check-sat b_and!50799 (not b_next!31513))
(get-model)

(declare-fun d!144205 () Bool)

(declare-fun isEmpty!1098 (Option!774) Bool)

(assert (=> d!144205 (= (isDefined!530 (getValueByKey!723 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1098 (getValueByKey!723 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38586 () Bool)

(assert (= bs!38586 d!144205))

(assert (=> bs!38586 m!1233533))

(declare-fun m!1233667 () Bool)

(assert (=> bs!38586 m!1233667))

(assert (=> b!1347033 d!144205))

(declare-fun b!1347193 () Bool)

(declare-fun e!766513 () Option!774)

(assert (=> b!1347193 (= e!766513 (Some!773 (_2!12184 (h!32686 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1347195 () Bool)

(declare-fun e!766514 () Option!774)

(assert (=> b!1347195 (= e!766514 (getValueByKey!723 (t!46065 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(declare-fun b!1347196 () Bool)

(assert (=> b!1347196 (= e!766514 None!772)))

(declare-fun b!1347194 () Bool)

(assert (=> b!1347194 (= e!766513 e!766514)))

(declare-fun c!126329 () Bool)

(assert (=> b!1347194 (= c!126329 (and ((_ is Cons!31477) (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12184 (h!32686 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun d!144207 () Bool)

(declare-fun c!126328 () Bool)

(assert (=> d!144207 (= c!126328 (and ((_ is Cons!31477) (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12184 (h!32686 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144207 (= (getValueByKey!723 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!766513)))

(assert (= (and d!144207 c!126328) b!1347193))

(assert (= (and d!144207 (not c!126328)) b!1347194))

(assert (= (and b!1347194 c!126329) b!1347195))

(assert (= (and b!1347194 (not c!126329)) b!1347196))

(declare-fun m!1233669 () Bool)

(assert (=> b!1347195 m!1233669))

(assert (=> b!1347033 d!144207))

(declare-fun call!65049 () ListLongMap!22003)

(declare-fun bm!65046 () Bool)

(assert (=> bm!65046 (= call!65049 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1347197 () Bool)

(declare-fun lt!595505 () Unit!43968)

(declare-fun lt!595506 () Unit!43968)

(assert (=> b!1347197 (= lt!595505 lt!595506)))

(declare-fun lt!595503 () ListLongMap!22003)

(declare-fun lt!595509 () (_ BitVec 64))

(declare-fun lt!595507 () V!55121)

(declare-fun lt!595508 () (_ BitVec 64))

(assert (=> b!1347197 (not (contains!9120 (+!4865 lt!595503 (tuple2!24347 lt!595509 lt!595507)) lt!595508))))

(assert (=> b!1347197 (= lt!595506 (addStillNotContains!489 lt!595503 lt!595509 lt!595507 lt!595508))))

(assert (=> b!1347197 (= lt!595508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1347197 (= lt!595507 (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1347197 (= lt!595509 (select (arr!44358 _keys!1571) from!1960))))

(assert (=> b!1347197 (= lt!595503 call!65049)))

(declare-fun e!766521 () ListLongMap!22003)

(assert (=> b!1347197 (= e!766521 (+!4865 call!65049 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!144209 () Bool)

(declare-fun e!766519 () Bool)

(assert (=> d!144209 e!766519))

(declare-fun res!893919 () Bool)

(assert (=> d!144209 (=> (not res!893919) (not e!766519))))

(declare-fun lt!595504 () ListLongMap!22003)

(assert (=> d!144209 (= res!893919 (not (contains!9120 lt!595504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766515 () ListLongMap!22003)

(assert (=> d!144209 (= lt!595504 e!766515)))

(declare-fun c!126333 () Bool)

(assert (=> d!144209 (= c!126333 (bvsge from!1960 (size!44910 _keys!1571)))))

(assert (=> d!144209 (validMask!0 mask!1977)))

(assert (=> d!144209 (= (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!595504)))

(declare-fun b!1347198 () Bool)

(assert (=> b!1347198 (= e!766521 call!65049)))

(declare-fun b!1347199 () Bool)

(assert (=> b!1347199 (= e!766515 (ListLongMap!22004 Nil!31478))))

(declare-fun b!1347200 () Bool)

(declare-fun e!766517 () Bool)

(assert (=> b!1347200 (= e!766517 (validKeyInArray!0 (select (arr!44358 _keys!1571) from!1960)))))

(assert (=> b!1347200 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1347201 () Bool)

(declare-fun res!893921 () Bool)

(assert (=> b!1347201 (=> (not res!893921) (not e!766519))))

(assert (=> b!1347201 (= res!893921 (not (contains!9120 lt!595504 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347202 () Bool)

(assert (=> b!1347202 (= e!766515 e!766521)))

(declare-fun c!126332 () Bool)

(assert (=> b!1347202 (= c!126332 (validKeyInArray!0 (select (arr!44358 _keys!1571) from!1960)))))

(declare-fun b!1347203 () Bool)

(declare-fun e!766516 () Bool)

(declare-fun e!766520 () Bool)

(assert (=> b!1347203 (= e!766516 e!766520)))

(assert (=> b!1347203 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)))))

(declare-fun res!893920 () Bool)

(assert (=> b!1347203 (= res!893920 (contains!9120 lt!595504 (select (arr!44358 _keys!1571) from!1960)))))

(assert (=> b!1347203 (=> (not res!893920) (not e!766520))))

(declare-fun e!766518 () Bool)

(declare-fun b!1347204 () Bool)

(assert (=> b!1347204 (= e!766518 (= lt!595504 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1347205 () Bool)

(assert (=> b!1347205 (= e!766519 e!766516)))

(declare-fun c!126331 () Bool)

(assert (=> b!1347205 (= c!126331 e!766517)))

(declare-fun res!893918 () Bool)

(assert (=> b!1347205 (=> (not res!893918) (not e!766517))))

(assert (=> b!1347205 (= res!893918 (bvslt from!1960 (size!44910 _keys!1571)))))

(declare-fun b!1347206 () Bool)

(assert (=> b!1347206 (= e!766518 (isEmpty!1097 lt!595504))))

(declare-fun b!1347207 () Bool)

(assert (=> b!1347207 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)))))

(assert (=> b!1347207 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44911 _values!1303)))))

(assert (=> b!1347207 (= e!766520 (= (apply!1030 lt!595504 (select (arr!44358 _keys!1571) from!1960)) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347208 () Bool)

(assert (=> b!1347208 (= e!766516 e!766518)))

(declare-fun c!126330 () Bool)

(assert (=> b!1347208 (= c!126330 (bvslt from!1960 (size!44910 _keys!1571)))))

(assert (= (and d!144209 c!126333) b!1347199))

(assert (= (and d!144209 (not c!126333)) b!1347202))

(assert (= (and b!1347202 c!126332) b!1347197))

(assert (= (and b!1347202 (not c!126332)) b!1347198))

(assert (= (or b!1347197 b!1347198) bm!65046))

(assert (= (and d!144209 res!893919) b!1347201))

(assert (= (and b!1347201 res!893921) b!1347205))

(assert (= (and b!1347205 res!893918) b!1347200))

(assert (= (and b!1347205 c!126331) b!1347203))

(assert (= (and b!1347205 (not c!126331)) b!1347208))

(assert (= (and b!1347203 res!893920) b!1347207))

(assert (= (and b!1347208 c!126330) b!1347204))

(assert (= (and b!1347208 (not c!126330)) b!1347206))

(declare-fun b_lambda!24567 () Bool)

(assert (=> (not b_lambda!24567) (not b!1347197)))

(assert (=> b!1347197 t!46064))

(declare-fun b_and!50801 () Bool)

(assert (= b_and!50799 (and (=> t!46064 result!25873) b_and!50801)))

(declare-fun b_lambda!24569 () Bool)

(assert (=> (not b_lambda!24569) (not b!1347207)))

(assert (=> b!1347207 t!46064))

(declare-fun b_and!50803 () Bool)

(assert (= b_and!50801 (and (=> t!46064 result!25873) b_and!50803)))

(assert (=> b!1347202 m!1233429))

(assert (=> b!1347202 m!1233429))

(assert (=> b!1347202 m!1233431))

(declare-fun m!1233671 () Bool)

(assert (=> b!1347206 m!1233671))

(assert (=> b!1347203 m!1233429))

(assert (=> b!1347203 m!1233429))

(declare-fun m!1233673 () Bool)

(assert (=> b!1347203 m!1233673))

(declare-fun m!1233675 () Bool)

(assert (=> b!1347201 m!1233675))

(declare-fun m!1233677 () Bool)

(assert (=> b!1347204 m!1233677))

(assert (=> b!1347200 m!1233429))

(assert (=> b!1347200 m!1233429))

(assert (=> b!1347200 m!1233431))

(assert (=> b!1347207 m!1233429))

(declare-fun m!1233679 () Bool)

(assert (=> b!1347207 m!1233679))

(assert (=> b!1347207 m!1233429))

(assert (=> b!1347207 m!1233445))

(assert (=> b!1347207 m!1233447))

(assert (=> b!1347207 m!1233449))

(assert (=> b!1347207 m!1233447))

(assert (=> b!1347207 m!1233445))

(assert (=> bm!65046 m!1233677))

(declare-fun m!1233681 () Bool)

(assert (=> d!144209 m!1233681))

(assert (=> d!144209 m!1233433))

(declare-fun m!1233683 () Bool)

(assert (=> b!1347197 m!1233683))

(declare-fun m!1233685 () Bool)

(assert (=> b!1347197 m!1233685))

(assert (=> b!1347197 m!1233683))

(declare-fun m!1233687 () Bool)

(assert (=> b!1347197 m!1233687))

(assert (=> b!1347197 m!1233445))

(assert (=> b!1347197 m!1233447))

(assert (=> b!1347197 m!1233449))

(assert (=> b!1347197 m!1233447))

(assert (=> b!1347197 m!1233445))

(declare-fun m!1233689 () Bool)

(assert (=> b!1347197 m!1233689))

(assert (=> b!1347197 m!1233429))

(assert (=> bm!65033 d!144209))

(declare-fun d!144211 () Bool)

(assert (=> d!144211 (= (get!22411 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21478 (select (arr!44359 _values!1303) from!1960)))))

(assert (=> b!1347122 d!144211))

(declare-fun bm!65047 () Bool)

(declare-fun call!65050 () Bool)

(assert (=> bm!65047 (= call!65050 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1347209 () Bool)

(declare-fun e!766523 () Bool)

(assert (=> b!1347209 (= e!766523 call!65050)))

(declare-fun d!144213 () Bool)

(declare-fun res!893922 () Bool)

(declare-fun e!766524 () Bool)

(assert (=> d!144213 (=> res!893922 e!766524)))

(assert (=> d!144213 (= res!893922 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(assert (=> d!144213 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!766524)))

(declare-fun b!1347210 () Bool)

(declare-fun e!766522 () Bool)

(assert (=> b!1347210 (= e!766522 call!65050)))

(declare-fun b!1347211 () Bool)

(assert (=> b!1347211 (= e!766523 e!766522)))

(declare-fun lt!595512 () (_ BitVec 64))

(assert (=> b!1347211 (= lt!595512 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!595510 () Unit!43968)

(assert (=> b!1347211 (= lt!595510 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595512 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1347211 (arrayContainsKey!0 _keys!1571 lt!595512 #b00000000000000000000000000000000)))

(declare-fun lt!595511 () Unit!43968)

(assert (=> b!1347211 (= lt!595511 lt!595510)))

(declare-fun res!893923 () Bool)

(assert (=> b!1347211 (= res!893923 (= (seekEntryOrOpen!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10055 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1347211 (=> (not res!893923) (not e!766522))))

(declare-fun b!1347212 () Bool)

(assert (=> b!1347212 (= e!766524 e!766523)))

(declare-fun c!126334 () Bool)

(assert (=> b!1347212 (= c!126334 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144213 (not res!893922)) b!1347212))

(assert (= (and b!1347212 c!126334) b!1347211))

(assert (= (and b!1347212 (not c!126334)) b!1347209))

(assert (= (and b!1347211 res!893923) b!1347210))

(assert (= (or b!1347210 b!1347209) bm!65047))

(declare-fun m!1233691 () Bool)

(assert (=> bm!65047 m!1233691))

(declare-fun m!1233693 () Bool)

(assert (=> b!1347211 m!1233693))

(declare-fun m!1233695 () Bool)

(assert (=> b!1347211 m!1233695))

(declare-fun m!1233697 () Bool)

(assert (=> b!1347211 m!1233697))

(assert (=> b!1347211 m!1233693))

(declare-fun m!1233699 () Bool)

(assert (=> b!1347211 m!1233699))

(assert (=> b!1347212 m!1233693))

(assert (=> b!1347212 m!1233693))

(declare-fun m!1233701 () Bool)

(assert (=> b!1347212 m!1233701))

(assert (=> bm!65045 d!144213))

(declare-fun d!144215 () Bool)

(assert (=> d!144215 (= (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)) (not (isEmpty!1098 (getValueByKey!723 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))))

(declare-fun bs!38587 () Bool)

(assert (= bs!38587 d!144215))

(assert (=> bs!38587 m!1233625))

(declare-fun m!1233703 () Bool)

(assert (=> bs!38587 m!1233703))

(assert (=> b!1347128 d!144215))

(declare-fun b!1347213 () Bool)

(declare-fun e!766525 () Option!774)

(assert (=> b!1347213 (= e!766525 (Some!773 (_2!12184 (h!32686 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))))

(declare-fun b!1347215 () Bool)

(declare-fun e!766526 () Option!774)

(assert (=> b!1347215 (= e!766526 (getValueByKey!723 (t!46065 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) k0!1142))))

(declare-fun b!1347216 () Bool)

(assert (=> b!1347216 (= e!766526 None!772)))

(declare-fun b!1347214 () Bool)

(assert (=> b!1347214 (= e!766525 e!766526)))

(declare-fun c!126336 () Bool)

(assert (=> b!1347214 (= c!126336 (and ((_ is Cons!31477) (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (not (= (_1!12184 (h!32686 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142))))))

(declare-fun c!126335 () Bool)

(declare-fun d!144217 () Bool)

(assert (=> d!144217 (= c!126335 (and ((_ is Cons!31477) (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (= (_1!12184 (h!32686 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(assert (=> d!144217 (= (getValueByKey!723 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) e!766525)))

(assert (= (and d!144217 c!126335) b!1347213))

(assert (= (and d!144217 (not c!126335)) b!1347214))

(assert (= (and b!1347214 c!126336) b!1347215))

(assert (= (and b!1347214 (not c!126336)) b!1347216))

(declare-fun m!1233705 () Bool)

(assert (=> b!1347215 m!1233705))

(assert (=> b!1347128 d!144217))

(declare-fun d!144219 () Bool)

(declare-fun get!22413 (Option!774) V!55121)

(assert (=> d!144219 (= (apply!1030 lt!595488 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22413 (getValueByKey!723 (toList!11017 lt!595488) (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38588 () Bool)

(assert (= bs!38588 d!144219))

(assert (=> bs!38588 m!1233629))

(declare-fun m!1233707 () Bool)

(assert (=> bs!38588 m!1233707))

(assert (=> bs!38588 m!1233707))

(declare-fun m!1233709 () Bool)

(assert (=> bs!38588 m!1233709))

(assert (=> b!1347163 d!144219))

(declare-fun d!144221 () Bool)

(declare-fun c!126337 () Bool)

(assert (=> d!144221 (= c!126337 ((_ is ValueCellFull!17858) (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!766527 () V!55121)

(assert (=> d!144221 (= (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!766527)))

(declare-fun b!1347217 () Bool)

(assert (=> b!1347217 (= e!766527 (get!22411 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347218 () Bool)

(assert (=> b!1347218 (= e!766527 (get!22412 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144221 c!126337) b!1347217))

(assert (= (and d!144221 (not c!126337)) b!1347218))

(assert (=> b!1347217 m!1233643))

(assert (=> b!1347217 m!1233447))

(declare-fun m!1233711 () Bool)

(assert (=> b!1347217 m!1233711))

(assert (=> b!1347218 m!1233643))

(assert (=> b!1347218 m!1233447))

(declare-fun m!1233713 () Bool)

(assert (=> b!1347218 m!1233713))

(assert (=> b!1347163 d!144221))

(declare-fun d!144223 () Bool)

(assert (=> d!144223 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun lt!595515 () Unit!43968)

(declare-fun choose!1980 (List!31481 (_ BitVec 64)) Unit!43968)

(assert (=> d!144223 (= lt!595515 (choose!1980 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun e!766530 () Bool)

(assert (=> d!144223 e!766530))

(declare-fun res!893926 () Bool)

(assert (=> d!144223 (=> (not res!893926) (not e!766530))))

(declare-fun isStrictlySorted!878 (List!31481) Bool)

(assert (=> d!144223 (= res!893926 (isStrictlySorted!878 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144223 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) lt!595515)))

(declare-fun b!1347221 () Bool)

(assert (=> b!1347221 (= e!766530 (containsKey!740 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (= (and d!144223 res!893926) b!1347221))

(assert (=> d!144223 m!1233625))

(assert (=> d!144223 m!1233625))

(assert (=> d!144223 m!1233627))

(declare-fun m!1233715 () Bool)

(assert (=> d!144223 m!1233715))

(declare-fun m!1233717 () Bool)

(assert (=> d!144223 m!1233717))

(assert (=> b!1347221 m!1233621))

(assert (=> b!1347126 d!144223))

(assert (=> b!1347126 d!144215))

(assert (=> b!1347126 d!144217))

(declare-fun d!144225 () Bool)

(assert (=> d!144225 (isDefined!530 (getValueByKey!723 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!595516 () Unit!43968)

(assert (=> d!144225 (= lt!595516 (choose!1980 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!766531 () Bool)

(assert (=> d!144225 e!766531))

(declare-fun res!893927 () Bool)

(assert (=> d!144225 (=> (not res!893927) (not e!766531))))

(assert (=> d!144225 (= res!893927 (isStrictlySorted!878 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144225 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!595516)))

(declare-fun b!1347222 () Bool)

(assert (=> b!1347222 (= e!766531 (containsKey!740 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144225 res!893927) b!1347222))

(assert (=> d!144225 m!1233533))

(assert (=> d!144225 m!1233533))

(assert (=> d!144225 m!1233535))

(declare-fun m!1233719 () Bool)

(assert (=> d!144225 m!1233719))

(declare-fun m!1233721 () Bool)

(assert (=> d!144225 m!1233721))

(assert (=> b!1347222 m!1233529))

(assert (=> b!1347031 d!144225))

(assert (=> b!1347031 d!144205))

(assert (=> b!1347031 d!144207))

(declare-fun d!144227 () Bool)

(declare-fun isEmpty!1099 (List!31481) Bool)

(assert (=> d!144227 (= (isEmpty!1097 lt!595488) (isEmpty!1099 (toList!11017 lt!595488)))))

(declare-fun bs!38589 () Bool)

(assert (= bs!38589 d!144227))

(declare-fun m!1233723 () Bool)

(assert (=> bs!38589 m!1233723))

(assert (=> b!1347162 d!144227))

(assert (=> b!1347078 d!144197))

(declare-fun bm!65048 () Bool)

(declare-fun call!65051 () ListLongMap!22003)

(assert (=> bm!65048 (= call!65051 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1347223 () Bool)

(declare-fun lt!595519 () Unit!43968)

(declare-fun lt!595520 () Unit!43968)

(assert (=> b!1347223 (= lt!595519 lt!595520)))

(declare-fun lt!595522 () (_ BitVec 64))

(declare-fun lt!595517 () ListLongMap!22003)

(declare-fun lt!595523 () (_ BitVec 64))

(declare-fun lt!595521 () V!55121)

(assert (=> b!1347223 (not (contains!9120 (+!4865 lt!595517 (tuple2!24347 lt!595523 lt!595521)) lt!595522))))

(assert (=> b!1347223 (= lt!595520 (addStillNotContains!489 lt!595517 lt!595523 lt!595521 lt!595522))))

(assert (=> b!1347223 (= lt!595522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1347223 (= lt!595521 (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1347223 (= lt!595523 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)))))

(assert (=> b!1347223 (= lt!595517 call!65051)))

(declare-fun e!766538 () ListLongMap!22003)

(assert (=> b!1347223 (= e!766538 (+!4865 call!65051 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!144229 () Bool)

(declare-fun e!766536 () Bool)

(assert (=> d!144229 e!766536))

(declare-fun res!893929 () Bool)

(assert (=> d!144229 (=> (not res!893929) (not e!766536))))

(declare-fun lt!595518 () ListLongMap!22003)

(assert (=> d!144229 (= res!893929 (not (contains!9120 lt!595518 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766532 () ListLongMap!22003)

(assert (=> d!144229 (= lt!595518 e!766532)))

(declare-fun c!126341 () Bool)

(assert (=> d!144229 (= c!126341 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(assert (=> d!144229 (validMask!0 mask!1977)))

(assert (=> d!144229 (= (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306) lt!595518)))

(declare-fun b!1347224 () Bool)

(assert (=> b!1347224 (= e!766538 call!65051)))

(declare-fun b!1347225 () Bool)

(assert (=> b!1347225 (= e!766532 (ListLongMap!22004 Nil!31478))))

(declare-fun b!1347226 () Bool)

(declare-fun e!766534 () Bool)

(assert (=> b!1347226 (= e!766534 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1347226 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1347227 () Bool)

(declare-fun res!893931 () Bool)

(assert (=> b!1347227 (=> (not res!893931) (not e!766536))))

(assert (=> b!1347227 (= res!893931 (not (contains!9120 lt!595518 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347228 () Bool)

(assert (=> b!1347228 (= e!766532 e!766538)))

(declare-fun c!126340 () Bool)

(assert (=> b!1347228 (= c!126340 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(declare-fun b!1347229 () Bool)

(declare-fun e!766533 () Bool)

(declare-fun e!766537 () Bool)

(assert (=> b!1347229 (= e!766533 e!766537)))

(assert (=> b!1347229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(declare-fun res!893930 () Bool)

(assert (=> b!1347229 (= res!893930 (contains!9120 lt!595518 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1347229 (=> (not res!893930) (not e!766537))))

(declare-fun b!1347230 () Bool)

(declare-fun e!766535 () Bool)

(assert (=> b!1347230 (= e!766535 (= lt!595518 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1347231 () Bool)

(assert (=> b!1347231 (= e!766536 e!766533)))

(declare-fun c!126339 () Bool)

(assert (=> b!1347231 (= c!126339 e!766534)))

(declare-fun res!893928 () Bool)

(assert (=> b!1347231 (=> (not res!893928) (not e!766534))))

(assert (=> b!1347231 (= res!893928 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(declare-fun b!1347232 () Bool)

(assert (=> b!1347232 (= e!766535 (isEmpty!1097 lt!595518))))

(declare-fun b!1347233 () Bool)

(assert (=> b!1347233 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(assert (=> b!1347233 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44911 _values!1303)))))

(assert (=> b!1347233 (= e!766537 (= (apply!1030 lt!595518 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347234 () Bool)

(assert (=> b!1347234 (= e!766533 e!766535)))

(declare-fun c!126338 () Bool)

(assert (=> b!1347234 (= c!126338 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(assert (= (and d!144229 c!126341) b!1347225))

(assert (= (and d!144229 (not c!126341)) b!1347228))

(assert (= (and b!1347228 c!126340) b!1347223))

(assert (= (and b!1347228 (not c!126340)) b!1347224))

(assert (= (or b!1347223 b!1347224) bm!65048))

(assert (= (and d!144229 res!893929) b!1347227))

(assert (= (and b!1347227 res!893931) b!1347231))

(assert (= (and b!1347231 res!893928) b!1347226))

(assert (= (and b!1347231 c!126339) b!1347229))

(assert (= (and b!1347231 (not c!126339)) b!1347234))

(assert (= (and b!1347229 res!893930) b!1347233))

(assert (= (and b!1347234 c!126338) b!1347230))

(assert (= (and b!1347234 (not c!126338)) b!1347232))

(declare-fun b_lambda!24571 () Bool)

(assert (=> (not b_lambda!24571) (not b!1347223)))

(assert (=> b!1347223 t!46064))

(declare-fun b_and!50805 () Bool)

(assert (= b_and!50803 (and (=> t!46064 result!25873) b_and!50805)))

(declare-fun b_lambda!24573 () Bool)

(assert (=> (not b_lambda!24573) (not b!1347233)))

(assert (=> b!1347233 t!46064))

(declare-fun b_and!50807 () Bool)

(assert (= b_and!50805 (and (=> t!46064 result!25873) b_and!50807)))

(declare-fun m!1233725 () Bool)

(assert (=> b!1347228 m!1233725))

(assert (=> b!1347228 m!1233725))

(declare-fun m!1233727 () Bool)

(assert (=> b!1347228 m!1233727))

(declare-fun m!1233729 () Bool)

(assert (=> b!1347232 m!1233729))

(assert (=> b!1347229 m!1233725))

(assert (=> b!1347229 m!1233725))

(declare-fun m!1233731 () Bool)

(assert (=> b!1347229 m!1233731))

(declare-fun m!1233733 () Bool)

(assert (=> b!1347227 m!1233733))

(declare-fun m!1233735 () Bool)

(assert (=> b!1347230 m!1233735))

(assert (=> b!1347226 m!1233725))

(assert (=> b!1347226 m!1233725))

(assert (=> b!1347226 m!1233727))

(assert (=> b!1347233 m!1233725))

(declare-fun m!1233737 () Bool)

(assert (=> b!1347233 m!1233737))

(assert (=> b!1347233 m!1233725))

(declare-fun m!1233739 () Bool)

(assert (=> b!1347233 m!1233739))

(assert (=> b!1347233 m!1233447))

(declare-fun m!1233741 () Bool)

(assert (=> b!1347233 m!1233741))

(assert (=> b!1347233 m!1233447))

(assert (=> b!1347233 m!1233739))

(assert (=> bm!65048 m!1233735))

(declare-fun m!1233743 () Bool)

(assert (=> d!144229 m!1233743))

(assert (=> d!144229 m!1233433))

(declare-fun m!1233745 () Bool)

(assert (=> b!1347223 m!1233745))

(declare-fun m!1233747 () Bool)

(assert (=> b!1347223 m!1233747))

(assert (=> b!1347223 m!1233745))

(declare-fun m!1233749 () Bool)

(assert (=> b!1347223 m!1233749))

(assert (=> b!1347223 m!1233739))

(assert (=> b!1347223 m!1233447))

(assert (=> b!1347223 m!1233741))

(assert (=> b!1347223 m!1233447))

(assert (=> b!1347223 m!1233739))

(declare-fun m!1233751 () Bool)

(assert (=> b!1347223 m!1233751))

(assert (=> b!1347223 m!1233725))

(assert (=> b!1347160 d!144229))

(declare-fun d!144231 () Bool)

(declare-fun e!766539 () Bool)

(assert (=> d!144231 e!766539))

(declare-fun res!893932 () Bool)

(assert (=> d!144231 (=> (not res!893932) (not e!766539))))

(declare-fun lt!595525 () ListLongMap!22003)

(assert (=> d!144231 (= res!893932 (contains!9120 lt!595525 (_1!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!595527 () List!31481)

(assert (=> d!144231 (= lt!595525 (ListLongMap!22004 lt!595527))))

(declare-fun lt!595524 () Unit!43968)

(declare-fun lt!595526 () Unit!43968)

(assert (=> d!144231 (= lt!595524 lt!595526)))

(assert (=> d!144231 (= (getValueByKey!723 lt!595527 (_1!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!773 (_2!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144231 (= lt!595526 (lemmaContainsTupThenGetReturnValue!366 lt!595527 (_1!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144231 (= lt!595527 (insertStrictlySorted!495 (toList!11017 (ite c!126298 call!65036 (ite c!126301 call!65033 call!65035))) (_1!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144231 (= (+!4865 (ite c!126298 call!65036 (ite c!126301 call!65033 call!65035)) (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!595525)))

(declare-fun b!1347235 () Bool)

(declare-fun res!893933 () Bool)

(assert (=> b!1347235 (=> (not res!893933) (not e!766539))))

(assert (=> b!1347235 (= res!893933 (= (getValueByKey!723 (toList!11017 lt!595525) (_1!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!773 (_2!12184 (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1347236 () Bool)

(assert (=> b!1347236 (= e!766539 (contains!9124 (toList!11017 lt!595525) (ite (or c!126298 c!126301) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144231 res!893932) b!1347235))

(assert (= (and b!1347235 res!893933) b!1347236))

(declare-fun m!1233753 () Bool)

(assert (=> d!144231 m!1233753))

(declare-fun m!1233755 () Bool)

(assert (=> d!144231 m!1233755))

(declare-fun m!1233757 () Bool)

(assert (=> d!144231 m!1233757))

(declare-fun m!1233759 () Bool)

(assert (=> d!144231 m!1233759))

(declare-fun m!1233761 () Bool)

(assert (=> b!1347235 m!1233761))

(declare-fun m!1233763 () Bool)

(assert (=> b!1347236 m!1233763))

(assert (=> bm!65036 d!144231))

(declare-fun b!1347237 () Bool)

(declare-fun e!766540 () Option!774)

(assert (=> b!1347237 (= e!766540 (Some!773 (_2!12184 (h!32686 (toList!11017 lt!595466)))))))

(declare-fun b!1347239 () Bool)

(declare-fun e!766541 () Option!774)

(assert (=> b!1347239 (= e!766541 (getValueByKey!723 (t!46065 (toList!11017 lt!595466)) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347240 () Bool)

(assert (=> b!1347240 (= e!766541 None!772)))

(declare-fun b!1347238 () Bool)

(assert (=> b!1347238 (= e!766540 e!766541)))

(declare-fun c!126343 () Bool)

(assert (=> b!1347238 (= c!126343 (and ((_ is Cons!31477) (toList!11017 lt!595466)) (not (= (_1!12184 (h!32686 (toList!11017 lt!595466))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun d!144233 () Bool)

(declare-fun c!126342 () Bool)

(assert (=> d!144233 (= c!126342 (and ((_ is Cons!31477) (toList!11017 lt!595466)) (= (_1!12184 (h!32686 (toList!11017 lt!595466))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144233 (= (getValueByKey!723 (toList!11017 lt!595466) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) e!766540)))

(assert (= (and d!144233 c!126342) b!1347237))

(assert (= (and d!144233 (not c!126342)) b!1347238))

(assert (= (and b!1347238 c!126343) b!1347239))

(assert (= (and b!1347238 (not c!126343)) b!1347240))

(declare-fun m!1233765 () Bool)

(assert (=> b!1347239 m!1233765))

(assert (=> b!1347124 d!144233))

(declare-fun d!144235 () Bool)

(declare-fun e!766542 () Bool)

(assert (=> d!144235 e!766542))

(declare-fun res!893934 () Bool)

(assert (=> d!144235 (=> res!893934 e!766542)))

(declare-fun lt!595528 () Bool)

(assert (=> d!144235 (= res!893934 (not lt!595528))))

(declare-fun lt!595530 () Bool)

(assert (=> d!144235 (= lt!595528 lt!595530)))

(declare-fun lt!595531 () Unit!43968)

(declare-fun e!766543 () Unit!43968)

(assert (=> d!144235 (= lt!595531 e!766543)))

(declare-fun c!126344 () Bool)

(assert (=> d!144235 (= c!126344 lt!595530)))

(assert (=> d!144235 (= lt!595530 (containsKey!740 (toList!11017 lt!595433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144235 (= (contains!9120 lt!595433 #b1000000000000000000000000000000000000000000000000000000000000000) lt!595528)))

(declare-fun b!1347241 () Bool)

(declare-fun lt!595529 () Unit!43968)

(assert (=> b!1347241 (= e!766543 lt!595529)))

(assert (=> b!1347241 (= lt!595529 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347241 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347242 () Bool)

(declare-fun Unit!43973 () Unit!43968)

(assert (=> b!1347242 (= e!766543 Unit!43973)))

(declare-fun b!1347243 () Bool)

(assert (=> b!1347243 (= e!766542 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144235 c!126344) b!1347241))

(assert (= (and d!144235 (not c!126344)) b!1347242))

(assert (= (and d!144235 (not res!893934)) b!1347243))

(declare-fun m!1233767 () Bool)

(assert (=> d!144235 m!1233767))

(declare-fun m!1233769 () Bool)

(assert (=> b!1347241 m!1233769))

(declare-fun m!1233771 () Bool)

(assert (=> b!1347241 m!1233771))

(assert (=> b!1347241 m!1233771))

(declare-fun m!1233773 () Bool)

(assert (=> b!1347241 m!1233773))

(assert (=> b!1347243 m!1233771))

(assert (=> b!1347243 m!1233771))

(assert (=> b!1347243 m!1233773))

(assert (=> bm!65031 d!144235))

(declare-fun d!144237 () Bool)

(declare-fun e!766544 () Bool)

(assert (=> d!144237 e!766544))

(declare-fun res!893935 () Bool)

(assert (=> d!144237 (=> res!893935 e!766544)))

(declare-fun lt!595532 () Bool)

(assert (=> d!144237 (= res!893935 (not lt!595532))))

(declare-fun lt!595534 () Bool)

(assert (=> d!144237 (= lt!595532 lt!595534)))

(declare-fun lt!595535 () Unit!43968)

(declare-fun e!766545 () Unit!43968)

(assert (=> d!144237 (= lt!595535 e!766545)))

(declare-fun c!126345 () Bool)

(assert (=> d!144237 (= c!126345 lt!595534)))

(assert (=> d!144237 (= lt!595534 (containsKey!740 (toList!11017 lt!595488) (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144237 (= (contains!9120 lt!595488 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!595532)))

(declare-fun b!1347244 () Bool)

(declare-fun lt!595533 () Unit!43968)

(assert (=> b!1347244 (= e!766545 lt!595533)))

(assert (=> b!1347244 (= lt!595533 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595488) (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1347244 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595488) (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1347245 () Bool)

(declare-fun Unit!43974 () Unit!43968)

(assert (=> b!1347245 (= e!766545 Unit!43974)))

(declare-fun b!1347246 () Bool)

(assert (=> b!1347246 (= e!766544 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595488) (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144237 c!126345) b!1347244))

(assert (= (and d!144237 (not c!126345)) b!1347245))

(assert (= (and d!144237 (not res!893935)) b!1347246))

(assert (=> d!144237 m!1233629))

(declare-fun m!1233775 () Bool)

(assert (=> d!144237 m!1233775))

(assert (=> b!1347244 m!1233629))

(declare-fun m!1233777 () Bool)

(assert (=> b!1347244 m!1233777))

(assert (=> b!1347244 m!1233629))

(assert (=> b!1347244 m!1233707))

(assert (=> b!1347244 m!1233707))

(declare-fun m!1233779 () Bool)

(assert (=> b!1347244 m!1233779))

(assert (=> b!1347246 m!1233629))

(assert (=> b!1347246 m!1233707))

(assert (=> b!1347246 m!1233707))

(assert (=> b!1347246 m!1233779))

(assert (=> b!1347159 d!144237))

(declare-fun d!144239 () Bool)

(declare-fun e!766546 () Bool)

(assert (=> d!144239 e!766546))

(declare-fun res!893936 () Bool)

(assert (=> d!144239 (=> res!893936 e!766546)))

(declare-fun lt!595536 () Bool)

(assert (=> d!144239 (= res!893936 (not lt!595536))))

(declare-fun lt!595538 () Bool)

(assert (=> d!144239 (= lt!595536 lt!595538)))

(declare-fun lt!595539 () Unit!43968)

(declare-fun e!766547 () Unit!43968)

(assert (=> d!144239 (= lt!595539 e!766547)))

(declare-fun c!126346 () Bool)

(assert (=> d!144239 (= c!126346 lt!595538)))

(assert (=> d!144239 (= lt!595538 (containsKey!740 (toList!11017 lt!595433) (select (arr!44358 _keys!1571) from!1960)))))

(assert (=> d!144239 (= (contains!9120 lt!595433 (select (arr!44358 _keys!1571) from!1960)) lt!595536)))

(declare-fun b!1347247 () Bool)

(declare-fun lt!595537 () Unit!43968)

(assert (=> b!1347247 (= e!766547 lt!595537)))

(assert (=> b!1347247 (= lt!595537 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595433) (select (arr!44358 _keys!1571) from!1960)))))

(assert (=> b!1347247 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595433) (select (arr!44358 _keys!1571) from!1960)))))

(declare-fun b!1347248 () Bool)

(declare-fun Unit!43975 () Unit!43968)

(assert (=> b!1347248 (= e!766547 Unit!43975)))

(declare-fun b!1347249 () Bool)

(assert (=> b!1347249 (= e!766546 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595433) (select (arr!44358 _keys!1571) from!1960))))))

(assert (= (and d!144239 c!126346) b!1347247))

(assert (= (and d!144239 (not c!126346)) b!1347248))

(assert (= (and d!144239 (not res!893936)) b!1347249))

(assert (=> d!144239 m!1233429))

(declare-fun m!1233781 () Bool)

(assert (=> d!144239 m!1233781))

(assert (=> b!1347247 m!1233429))

(declare-fun m!1233783 () Bool)

(assert (=> b!1347247 m!1233783))

(assert (=> b!1347247 m!1233429))

(declare-fun m!1233785 () Bool)

(assert (=> b!1347247 m!1233785))

(assert (=> b!1347247 m!1233785))

(declare-fun m!1233787 () Bool)

(assert (=> b!1347247 m!1233787))

(assert (=> b!1347249 m!1233429))

(assert (=> b!1347249 m!1233785))

(assert (=> b!1347249 m!1233785))

(assert (=> b!1347249 m!1233787))

(assert (=> b!1347095 d!144239))

(declare-fun d!144241 () Bool)

(declare-fun lt!595542 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!661 (List!31481) (InoxSet tuple2!24346))

(assert (=> d!144241 (= lt!595542 (select (content!661 (toList!11017 lt!595466)) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(declare-fun e!766553 () Bool)

(assert (=> d!144241 (= lt!595542 e!766553)))

(declare-fun res!893942 () Bool)

(assert (=> d!144241 (=> (not res!893942) (not e!766553))))

(assert (=> d!144241 (= res!893942 ((_ is Cons!31477) (toList!11017 lt!595466)))))

(assert (=> d!144241 (= (contains!9124 (toList!11017 lt!595466) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!595542)))

(declare-fun b!1347254 () Bool)

(declare-fun e!766552 () Bool)

(assert (=> b!1347254 (= e!766553 e!766552)))

(declare-fun res!893941 () Bool)

(assert (=> b!1347254 (=> res!893941 e!766552)))

(assert (=> b!1347254 (= res!893941 (= (h!32686 (toList!11017 lt!595466)) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(declare-fun b!1347255 () Bool)

(assert (=> b!1347255 (= e!766552 (contains!9124 (t!46065 (toList!11017 lt!595466)) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144241 res!893942) b!1347254))

(assert (= (and b!1347254 (not res!893941)) b!1347255))

(declare-fun m!1233789 () Bool)

(assert (=> d!144241 m!1233789))

(declare-fun m!1233791 () Bool)

(assert (=> d!144241 m!1233791))

(declare-fun m!1233793 () Bool)

(assert (=> b!1347255 m!1233793))

(assert (=> b!1347125 d!144241))

(declare-fun d!144243 () Bool)

(declare-fun lt!595543 () Bool)

(assert (=> d!144243 (= lt!595543 (select (content!661 (toList!11017 lt!595462)) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!766555 () Bool)

(assert (=> d!144243 (= lt!595543 e!766555)))

(declare-fun res!893944 () Bool)

(assert (=> d!144243 (=> (not res!893944) (not e!766555))))

(assert (=> d!144243 (= res!893944 ((_ is Cons!31477) (toList!11017 lt!595462)))))

(assert (=> d!144243 (= (contains!9124 (toList!11017 lt!595462) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!595543)))

(declare-fun b!1347256 () Bool)

(declare-fun e!766554 () Bool)

(assert (=> b!1347256 (= e!766555 e!766554)))

(declare-fun res!893943 () Bool)

(assert (=> b!1347256 (=> res!893943 e!766554)))

(assert (=> b!1347256 (= res!893943 (= (h!32686 (toList!11017 lt!595462)) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347257 () Bool)

(assert (=> b!1347257 (= e!766554 (contains!9124 (t!46065 (toList!11017 lt!595462)) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144243 res!893944) b!1347256))

(assert (= (and b!1347256 (not res!893943)) b!1347257))

(declare-fun m!1233795 () Bool)

(assert (=> d!144243 m!1233795))

(declare-fun m!1233797 () Bool)

(assert (=> d!144243 m!1233797))

(declare-fun m!1233799 () Bool)

(assert (=> b!1347257 m!1233799))

(assert (=> b!1347117 d!144243))

(declare-fun d!144245 () Bool)

(declare-fun e!766556 () Bool)

(assert (=> d!144245 e!766556))

(declare-fun res!893945 () Bool)

(assert (=> d!144245 (=> res!893945 e!766556)))

(declare-fun lt!595544 () Bool)

(assert (=> d!144245 (= res!893945 (not lt!595544))))

(declare-fun lt!595546 () Bool)

(assert (=> d!144245 (= lt!595544 lt!595546)))

(declare-fun lt!595547 () Unit!43968)

(declare-fun e!766557 () Unit!43968)

(assert (=> d!144245 (= lt!595547 e!766557)))

(declare-fun c!126347 () Bool)

(assert (=> d!144245 (= c!126347 lt!595546)))

(assert (=> d!144245 (= lt!595546 (containsKey!740 (toList!11017 lt!595488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144245 (= (contains!9120 lt!595488 #b1000000000000000000000000000000000000000000000000000000000000000) lt!595544)))

(declare-fun b!1347258 () Bool)

(declare-fun lt!595545 () Unit!43968)

(assert (=> b!1347258 (= e!766557 lt!595545)))

(assert (=> b!1347258 (= lt!595545 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347258 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347259 () Bool)

(declare-fun Unit!43976 () Unit!43968)

(assert (=> b!1347259 (= e!766557 Unit!43976)))

(declare-fun b!1347260 () Bool)

(assert (=> b!1347260 (= e!766556 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144245 c!126347) b!1347258))

(assert (= (and d!144245 (not c!126347)) b!1347259))

(assert (= (and d!144245 (not res!893945)) b!1347260))

(declare-fun m!1233801 () Bool)

(assert (=> d!144245 m!1233801))

(declare-fun m!1233803 () Bool)

(assert (=> b!1347258 m!1233803))

(declare-fun m!1233805 () Bool)

(assert (=> b!1347258 m!1233805))

(assert (=> b!1347258 m!1233805))

(declare-fun m!1233807 () Bool)

(assert (=> b!1347258 m!1233807))

(assert (=> b!1347260 m!1233805))

(assert (=> b!1347260 m!1233805))

(assert (=> b!1347260 m!1233807))

(assert (=> b!1347157 d!144245))

(declare-fun d!144247 () Bool)

(declare-fun lt!595550 () Bool)

(declare-fun content!662 (List!31482) (InoxSet (_ BitVec 64)))

(assert (=> d!144247 (= lt!595550 (select (content!662 Nil!31479) (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!766563 () Bool)

(assert (=> d!144247 (= lt!595550 e!766563)))

(declare-fun res!893950 () Bool)

(assert (=> d!144247 (=> (not res!893950) (not e!766563))))

(assert (=> d!144247 (= res!893950 ((_ is Cons!31478) Nil!31479))))

(assert (=> d!144247 (= (contains!9123 Nil!31479 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)) lt!595550)))

(declare-fun b!1347265 () Bool)

(declare-fun e!766562 () Bool)

(assert (=> b!1347265 (= e!766563 e!766562)))

(declare-fun res!893951 () Bool)

(assert (=> b!1347265 (=> res!893951 e!766562)))

(assert (=> b!1347265 (= res!893951 (= (h!32687 Nil!31479) (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347266 () Bool)

(assert (=> b!1347266 (= e!766562 (contains!9123 (t!46066 Nil!31479) (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144247 res!893950) b!1347265))

(assert (= (and b!1347265 (not res!893951)) b!1347266))

(declare-fun m!1233809 () Bool)

(assert (=> d!144247 m!1233809))

(assert (=> d!144247 m!1233585))

(declare-fun m!1233811 () Bool)

(assert (=> d!144247 m!1233811))

(assert (=> b!1347266 m!1233585))

(declare-fun m!1233813 () Bool)

(assert (=> b!1347266 m!1233813))

(assert (=> b!1347110 d!144247))

(declare-fun d!144249 () Bool)

(assert (=> d!144249 (= (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347158 d!144249))

(declare-fun d!144251 () Bool)

(assert (=> d!144251 (= (validKeyInArray!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347108 d!144251))

(declare-fun b!1347267 () Bool)

(declare-fun e!766564 () Option!774)

(assert (=> b!1347267 (= e!766564 (Some!773 (_2!12184 (h!32686 (toList!11017 lt!595462)))))))

(declare-fun e!766565 () Option!774)

(declare-fun b!1347269 () Bool)

(assert (=> b!1347269 (= e!766565 (getValueByKey!723 (t!46065 (toList!11017 lt!595462)) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347270 () Bool)

(assert (=> b!1347270 (= e!766565 None!772)))

(declare-fun b!1347268 () Bool)

(assert (=> b!1347268 (= e!766564 e!766565)))

(declare-fun c!126349 () Bool)

(assert (=> b!1347268 (= c!126349 (and ((_ is Cons!31477) (toList!11017 lt!595462)) (not (= (_1!12184 (h!32686 (toList!11017 lt!595462))) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!144253 () Bool)

(declare-fun c!126348 () Bool)

(assert (=> d!144253 (= c!126348 (and ((_ is Cons!31477) (toList!11017 lt!595462)) (= (_1!12184 (h!32686 (toList!11017 lt!595462))) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144253 (= (getValueByKey!723 (toList!11017 lt!595462) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!766564)))

(assert (= (and d!144253 c!126348) b!1347267))

(assert (= (and d!144253 (not c!126348)) b!1347268))

(assert (= (and b!1347268 c!126349) b!1347269))

(assert (= (and b!1347268 (not c!126349)) b!1347270))

(declare-fun m!1233815 () Bool)

(assert (=> b!1347269 m!1233815))

(assert (=> b!1347116 d!144253))

(assert (=> b!1347156 d!144249))

(assert (=> b!1347107 d!144251))

(declare-fun d!144255 () Bool)

(declare-fun e!766566 () Bool)

(assert (=> d!144255 e!766566))

(declare-fun res!893952 () Bool)

(assert (=> d!144255 (=> (not res!893952) (not e!766566))))

(declare-fun lt!595552 () ListLongMap!22003)

(assert (=> d!144255 (= res!893952 (contains!9120 lt!595552 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!595554 () List!31481)

(assert (=> d!144255 (= lt!595552 (ListLongMap!22004 lt!595554))))

(declare-fun lt!595551 () Unit!43968)

(declare-fun lt!595553 () Unit!43968)

(assert (=> d!144255 (= lt!595551 lt!595553)))

(assert (=> d!144255 (= (getValueByKey!723 lt!595554 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144255 (= lt!595553 (lemmaContainsTupThenGetReturnValue!366 lt!595554 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144255 (= lt!595554 (insertStrictlySorted!495 (toList!11017 call!65045) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144255 (= (+!4865 call!65045 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!595552)))

(declare-fun b!1347271 () Bool)

(declare-fun res!893953 () Bool)

(assert (=> b!1347271 (=> (not res!893953) (not e!766566))))

(assert (=> b!1347271 (= res!893953 (= (getValueByKey!723 (toList!11017 lt!595552) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1347272 () Bool)

(assert (=> b!1347272 (= e!766566 (contains!9124 (toList!11017 lt!595552) (tuple2!24347 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22409 (select (arr!44359 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144255 res!893952) b!1347271))

(assert (= (and b!1347271 res!893953) b!1347272))

(declare-fun m!1233817 () Bool)

(assert (=> d!144255 m!1233817))

(declare-fun m!1233819 () Bool)

(assert (=> d!144255 m!1233819))

(declare-fun m!1233821 () Bool)

(assert (=> d!144255 m!1233821))

(declare-fun m!1233823 () Bool)

(assert (=> d!144255 m!1233823))

(declare-fun m!1233825 () Bool)

(assert (=> b!1347271 m!1233825))

(declare-fun m!1233827 () Bool)

(assert (=> b!1347272 m!1233827))

(assert (=> b!1347153 d!144255))

(declare-fun d!144257 () Bool)

(declare-fun e!766567 () Bool)

(assert (=> d!144257 e!766567))

(declare-fun res!893954 () Bool)

(assert (=> d!144257 (=> (not res!893954) (not e!766567))))

(declare-fun lt!595556 () ListLongMap!22003)

(assert (=> d!144257 (= res!893954 (contains!9120 lt!595556 (_1!12184 (tuple2!24347 lt!595493 lt!595491))))))

(declare-fun lt!595558 () List!31481)

(assert (=> d!144257 (= lt!595556 (ListLongMap!22004 lt!595558))))

(declare-fun lt!595555 () Unit!43968)

(declare-fun lt!595557 () Unit!43968)

(assert (=> d!144257 (= lt!595555 lt!595557)))

(assert (=> d!144257 (= (getValueByKey!723 lt!595558 (_1!12184 (tuple2!24347 lt!595493 lt!595491))) (Some!773 (_2!12184 (tuple2!24347 lt!595493 lt!595491))))))

(assert (=> d!144257 (= lt!595557 (lemmaContainsTupThenGetReturnValue!366 lt!595558 (_1!12184 (tuple2!24347 lt!595493 lt!595491)) (_2!12184 (tuple2!24347 lt!595493 lt!595491))))))

(assert (=> d!144257 (= lt!595558 (insertStrictlySorted!495 (toList!11017 lt!595487) (_1!12184 (tuple2!24347 lt!595493 lt!595491)) (_2!12184 (tuple2!24347 lt!595493 lt!595491))))))

(assert (=> d!144257 (= (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491)) lt!595556)))

(declare-fun b!1347273 () Bool)

(declare-fun res!893955 () Bool)

(assert (=> b!1347273 (=> (not res!893955) (not e!766567))))

(assert (=> b!1347273 (= res!893955 (= (getValueByKey!723 (toList!11017 lt!595556) (_1!12184 (tuple2!24347 lt!595493 lt!595491))) (Some!773 (_2!12184 (tuple2!24347 lt!595493 lt!595491)))))))

(declare-fun b!1347274 () Bool)

(assert (=> b!1347274 (= e!766567 (contains!9124 (toList!11017 lt!595556) (tuple2!24347 lt!595493 lt!595491)))))

(assert (= (and d!144257 res!893954) b!1347273))

(assert (= (and b!1347273 res!893955) b!1347274))

(declare-fun m!1233829 () Bool)

(assert (=> d!144257 m!1233829))

(declare-fun m!1233831 () Bool)

(assert (=> d!144257 m!1233831))

(declare-fun m!1233833 () Bool)

(assert (=> d!144257 m!1233833))

(declare-fun m!1233835 () Bool)

(assert (=> d!144257 m!1233835))

(declare-fun m!1233837 () Bool)

(assert (=> b!1347273 m!1233837))

(declare-fun m!1233839 () Bool)

(assert (=> b!1347274 m!1233839))

(assert (=> b!1347153 d!144257))

(assert (=> b!1347153 d!144221))

(declare-fun d!144259 () Bool)

(assert (=> d!144259 (not (contains!9120 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491)) lt!595492))))

(declare-fun lt!595561 () Unit!43968)

(declare-fun choose!1981 (ListLongMap!22003 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!43968)

(assert (=> d!144259 (= lt!595561 (choose!1981 lt!595487 lt!595493 lt!595491 lt!595492))))

(declare-fun e!766570 () Bool)

(assert (=> d!144259 e!766570))

(declare-fun res!893958 () Bool)

(assert (=> d!144259 (=> (not res!893958) (not e!766570))))

(assert (=> d!144259 (= res!893958 (not (contains!9120 lt!595487 lt!595492)))))

(assert (=> d!144259 (= (addStillNotContains!489 lt!595487 lt!595493 lt!595491 lt!595492) lt!595561)))

(declare-fun b!1347278 () Bool)

(assert (=> b!1347278 (= e!766570 (not (= lt!595493 lt!595492)))))

(assert (= (and d!144259 res!893958) b!1347278))

(assert (=> d!144259 m!1233649))

(assert (=> d!144259 m!1233649))

(assert (=> d!144259 m!1233653))

(declare-fun m!1233841 () Bool)

(assert (=> d!144259 m!1233841))

(declare-fun m!1233843 () Bool)

(assert (=> d!144259 m!1233843))

(assert (=> b!1347153 d!144259))

(declare-fun d!144261 () Bool)

(declare-fun e!766571 () Bool)

(assert (=> d!144261 e!766571))

(declare-fun res!893959 () Bool)

(assert (=> d!144261 (=> res!893959 e!766571)))

(declare-fun lt!595562 () Bool)

(assert (=> d!144261 (= res!893959 (not lt!595562))))

(declare-fun lt!595564 () Bool)

(assert (=> d!144261 (= lt!595562 lt!595564)))

(declare-fun lt!595565 () Unit!43968)

(declare-fun e!766572 () Unit!43968)

(assert (=> d!144261 (= lt!595565 e!766572)))

(declare-fun c!126350 () Bool)

(assert (=> d!144261 (= c!126350 lt!595564)))

(assert (=> d!144261 (= lt!595564 (containsKey!740 (toList!11017 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491))) lt!595492))))

(assert (=> d!144261 (= (contains!9120 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491)) lt!595492) lt!595562)))

(declare-fun b!1347279 () Bool)

(declare-fun lt!595563 () Unit!43968)

(assert (=> b!1347279 (= e!766572 lt!595563)))

(assert (=> b!1347279 (= lt!595563 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491))) lt!595492))))

(assert (=> b!1347279 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491))) lt!595492))))

(declare-fun b!1347280 () Bool)

(declare-fun Unit!43977 () Unit!43968)

(assert (=> b!1347280 (= e!766572 Unit!43977)))

(declare-fun b!1347281 () Bool)

(assert (=> b!1347281 (= e!766571 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 lt!595487 (tuple2!24347 lt!595493 lt!595491))) lt!595492)))))

(assert (= (and d!144261 c!126350) b!1347279))

(assert (= (and d!144261 (not c!126350)) b!1347280))

(assert (= (and d!144261 (not res!893959)) b!1347281))

(declare-fun m!1233845 () Bool)

(assert (=> d!144261 m!1233845))

(declare-fun m!1233847 () Bool)

(assert (=> b!1347279 m!1233847))

(declare-fun m!1233849 () Bool)

(assert (=> b!1347279 m!1233849))

(assert (=> b!1347279 m!1233849))

(declare-fun m!1233851 () Bool)

(assert (=> b!1347279 m!1233851))

(assert (=> b!1347281 m!1233849))

(assert (=> b!1347281 m!1233849))

(assert (=> b!1347281 m!1233851))

(assert (=> b!1347153 d!144261))

(declare-fun call!65052 () Bool)

(declare-fun c!126351 () Bool)

(declare-fun bm!65049 () Bool)

(assert (=> bm!65049 (= call!65052 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126351 (Cons!31478 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126304 (Cons!31478 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) Nil!31479) Nil!31479)) (ite c!126304 (Cons!31478 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) Nil!31479) Nil!31479))))))

(declare-fun b!1347282 () Bool)

(declare-fun e!766576 () Bool)

(declare-fun e!766573 () Bool)

(assert (=> b!1347282 (= e!766576 e!766573)))

(assert (=> b!1347282 (= c!126351 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1347283 () Bool)

(declare-fun e!766574 () Bool)

(assert (=> b!1347283 (= e!766574 e!766576)))

(declare-fun res!893961 () Bool)

(assert (=> b!1347283 (=> (not res!893961) (not e!766576))))

(declare-fun e!766575 () Bool)

(assert (=> b!1347283 (= res!893961 (not e!766575))))

(declare-fun res!893962 () Bool)

(assert (=> b!1347283 (=> (not res!893962) (not e!766575))))

(assert (=> b!1347283 (= res!893962 (validKeyInArray!0 (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1347284 () Bool)

(assert (=> b!1347284 (= e!766573 call!65052)))

(declare-fun b!1347285 () Bool)

(assert (=> b!1347285 (= e!766575 (contains!9123 (ite c!126304 (Cons!31478 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) Nil!31479) Nil!31479) (select (arr!44358 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1347286 () Bool)

(assert (=> b!1347286 (= e!766573 call!65052)))

(declare-fun d!144263 () Bool)

(declare-fun res!893960 () Bool)

(assert (=> d!144263 (=> res!893960 e!766574)))

(assert (=> d!144263 (= res!893960 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(assert (=> d!144263 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126304 (Cons!31478 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) Nil!31479) Nil!31479)) e!766574)))

(assert (= (and d!144263 (not res!893960)) b!1347283))

(assert (= (and b!1347283 res!893962) b!1347285))

(assert (= (and b!1347283 res!893961) b!1347282))

(assert (= (and b!1347282 c!126351) b!1347284))

(assert (= (and b!1347282 (not c!126351)) b!1347286))

(assert (= (or b!1347284 b!1347286) bm!65049))

(assert (=> bm!65049 m!1233693))

(declare-fun m!1233853 () Bool)

(assert (=> bm!65049 m!1233853))

(assert (=> b!1347282 m!1233693))

(assert (=> b!1347282 m!1233693))

(assert (=> b!1347282 m!1233701))

(assert (=> b!1347283 m!1233693))

(assert (=> b!1347283 m!1233693))

(assert (=> b!1347283 m!1233701))

(assert (=> b!1347285 m!1233693))

(assert (=> b!1347285 m!1233693))

(declare-fun m!1233855 () Bool)

(assert (=> b!1347285 m!1233855))

(assert (=> bm!65039 d!144263))

(declare-fun d!144265 () Bool)

(declare-fun e!766577 () Bool)

(assert (=> d!144265 e!766577))

(declare-fun res!893963 () Bool)

(assert (=> d!144265 (=> res!893963 e!766577)))

(declare-fun lt!595566 () Bool)

(assert (=> d!144265 (= res!893963 (not lt!595566))))

(declare-fun lt!595568 () Bool)

(assert (=> d!144265 (= lt!595566 lt!595568)))

(declare-fun lt!595569 () Unit!43968)

(declare-fun e!766578 () Unit!43968)

(assert (=> d!144265 (= lt!595569 e!766578)))

(declare-fun c!126352 () Bool)

(assert (=> d!144265 (= c!126352 lt!595568)))

(assert (=> d!144265 (= lt!595568 (containsKey!740 (toList!11017 lt!595488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144265 (= (contains!9120 lt!595488 #b0000000000000000000000000000000000000000000000000000000000000000) lt!595566)))

(declare-fun b!1347287 () Bool)

(declare-fun lt!595567 () Unit!43968)

(assert (=> b!1347287 (= e!766578 lt!595567)))

(assert (=> b!1347287 (= lt!595567 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347287 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347288 () Bool)

(declare-fun Unit!43978 () Unit!43968)

(assert (=> b!1347288 (= e!766578 Unit!43978)))

(declare-fun b!1347289 () Bool)

(assert (=> b!1347289 (= e!766577 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144265 c!126352) b!1347287))

(assert (= (and d!144265 (not c!126352)) b!1347288))

(assert (= (and d!144265 (not res!893963)) b!1347289))

(declare-fun m!1233857 () Bool)

(assert (=> d!144265 m!1233857))

(declare-fun m!1233859 () Bool)

(assert (=> b!1347287 m!1233859))

(declare-fun m!1233861 () Bool)

(assert (=> b!1347287 m!1233861))

(assert (=> b!1347287 m!1233861))

(declare-fun m!1233863 () Bool)

(assert (=> b!1347287 m!1233863))

(assert (=> b!1347289 m!1233861))

(assert (=> b!1347289 m!1233861))

(assert (=> b!1347289 m!1233863))

(assert (=> d!144193 d!144265))

(assert (=> d!144193 d!144199))

(declare-fun d!144267 () Bool)

(declare-fun res!893968 () Bool)

(declare-fun e!766583 () Bool)

(assert (=> d!144267 (=> res!893968 e!766583)))

(assert (=> d!144267 (= res!893968 (and ((_ is Cons!31477) (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (= (_1!12184 (h!32686 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(assert (=> d!144267 (= (containsKey!740 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) e!766583)))

(declare-fun b!1347294 () Bool)

(declare-fun e!766584 () Bool)

(assert (=> b!1347294 (= e!766583 e!766584)))

(declare-fun res!893969 () Bool)

(assert (=> b!1347294 (=> (not res!893969) (not e!766584))))

(assert (=> b!1347294 (= res!893969 (and (or (not ((_ is Cons!31477) (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) (bvsle (_1!12184 (h!32686 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)) ((_ is Cons!31477) (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (bvslt (_1!12184 (h!32686 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(declare-fun b!1347295 () Bool)

(assert (=> b!1347295 (= e!766584 (containsKey!740 (t!46065 (toList!11017 (+!4865 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) k0!1142))))

(assert (= (and d!144267 (not res!893968)) b!1347294))

(assert (= (and b!1347294 res!893969) b!1347295))

(declare-fun m!1233865 () Bool)

(assert (=> b!1347295 m!1233865))

(assert (=> d!144191 d!144267))

(assert (=> bm!65042 d!144229))

(assert (=> d!144181 d!144199))

(declare-fun d!144269 () Bool)

(declare-fun e!766585 () Bool)

(assert (=> d!144269 e!766585))

(declare-fun res!893970 () Bool)

(assert (=> d!144269 (=> res!893970 e!766585)))

(declare-fun lt!595570 () Bool)

(assert (=> d!144269 (= res!893970 (not lt!595570))))

(declare-fun lt!595572 () Bool)

(assert (=> d!144269 (= lt!595570 lt!595572)))

(declare-fun lt!595573 () Unit!43968)

(declare-fun e!766586 () Unit!43968)

(assert (=> d!144269 (= lt!595573 e!766586)))

(declare-fun c!126353 () Bool)

(assert (=> d!144269 (= c!126353 lt!595572)))

(assert (=> d!144269 (= lt!595572 (containsKey!740 (toList!11017 lt!595433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144269 (= (contains!9120 lt!595433 #b0000000000000000000000000000000000000000000000000000000000000000) lt!595570)))

(declare-fun b!1347296 () Bool)

(declare-fun lt!595571 () Unit!43968)

(assert (=> b!1347296 (= e!766586 lt!595571)))

(assert (=> b!1347296 (= lt!595571 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347296 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347297 () Bool)

(declare-fun Unit!43979 () Unit!43968)

(assert (=> b!1347297 (= e!766586 Unit!43979)))

(declare-fun b!1347298 () Bool)

(assert (=> b!1347298 (= e!766585 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144269 c!126353) b!1347296))

(assert (= (and d!144269 (not c!126353)) b!1347297))

(assert (= (and d!144269 (not res!893970)) b!1347298))

(declare-fun m!1233867 () Bool)

(assert (=> d!144269 m!1233867))

(declare-fun m!1233869 () Bool)

(assert (=> b!1347296 m!1233869))

(declare-fun m!1233871 () Bool)

(assert (=> b!1347296 m!1233871))

(assert (=> b!1347296 m!1233871))

(declare-fun m!1233873 () Bool)

(assert (=> b!1347296 m!1233873))

(assert (=> b!1347298 m!1233871))

(assert (=> b!1347298 m!1233871))

(assert (=> b!1347298 m!1233873))

(assert (=> bm!65034 d!144269))

(declare-fun d!144271 () Bool)

(declare-fun e!766587 () Bool)

(assert (=> d!144271 e!766587))

(declare-fun res!893971 () Bool)

(assert (=> d!144271 (=> res!893971 e!766587)))

(declare-fun lt!595574 () Bool)

(assert (=> d!144271 (= res!893971 (not lt!595574))))

(declare-fun lt!595576 () Bool)

(assert (=> d!144271 (= lt!595574 lt!595576)))

(declare-fun lt!595577 () Unit!43968)

(declare-fun e!766588 () Unit!43968)

(assert (=> d!144271 (= lt!595577 e!766588)))

(declare-fun c!126354 () Bool)

(assert (=> d!144271 (= c!126354 lt!595576)))

(assert (=> d!144271 (= lt!595576 (containsKey!740 (toList!11017 lt!595466) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144271 (= (contains!9120 lt!595466 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!595574)))

(declare-fun b!1347299 () Bool)

(declare-fun lt!595575 () Unit!43968)

(assert (=> b!1347299 (= e!766588 lt!595575)))

(assert (=> b!1347299 (= lt!595575 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595466) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> b!1347299 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595466) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347300 () Bool)

(declare-fun Unit!43980 () Unit!43968)

(assert (=> b!1347300 (= e!766588 Unit!43980)))

(declare-fun b!1347301 () Bool)

(assert (=> b!1347301 (= e!766587 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595466) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144271 c!126354) b!1347299))

(assert (= (and d!144271 (not c!126354)) b!1347300))

(assert (= (and d!144271 (not res!893971)) b!1347301))

(declare-fun m!1233875 () Bool)

(assert (=> d!144271 m!1233875))

(declare-fun m!1233877 () Bool)

(assert (=> b!1347299 m!1233877))

(assert (=> b!1347299 m!1233617))

(assert (=> b!1347299 m!1233617))

(declare-fun m!1233879 () Bool)

(assert (=> b!1347299 m!1233879))

(assert (=> b!1347301 m!1233617))

(assert (=> b!1347301 m!1233617))

(assert (=> b!1347301 m!1233879))

(assert (=> d!144189 d!144271))

(declare-fun b!1347302 () Bool)

(declare-fun e!766589 () Option!774)

(assert (=> b!1347302 (= e!766589 (Some!773 (_2!12184 (h!32686 lt!595468))))))

(declare-fun b!1347304 () Bool)

(declare-fun e!766590 () Option!774)

(assert (=> b!1347304 (= e!766590 (getValueByKey!723 (t!46065 lt!595468) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347305 () Bool)

(assert (=> b!1347305 (= e!766590 None!772)))

(declare-fun b!1347303 () Bool)

(assert (=> b!1347303 (= e!766589 e!766590)))

(declare-fun c!126356 () Bool)

(assert (=> b!1347303 (= c!126356 (and ((_ is Cons!31477) lt!595468) (not (= (_1!12184 (h!32686 lt!595468)) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun d!144273 () Bool)

(declare-fun c!126355 () Bool)

(assert (=> d!144273 (= c!126355 (and ((_ is Cons!31477) lt!595468) (= (_1!12184 (h!32686 lt!595468)) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144273 (= (getValueByKey!723 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) e!766589)))

(assert (= (and d!144273 c!126355) b!1347302))

(assert (= (and d!144273 (not c!126355)) b!1347303))

(assert (= (and b!1347303 c!126356) b!1347304))

(assert (= (and b!1347303 (not c!126356)) b!1347305))

(declare-fun m!1233881 () Bool)

(assert (=> b!1347304 m!1233881))

(assert (=> d!144189 d!144273))

(declare-fun d!144275 () Bool)

(assert (=> d!144275 (= (getValueByKey!723 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!595580 () Unit!43968)

(declare-fun choose!1982 (List!31481 (_ BitVec 64) V!55121) Unit!43968)

(assert (=> d!144275 (= lt!595580 (choose!1982 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun e!766593 () Bool)

(assert (=> d!144275 e!766593))

(declare-fun res!893976 () Bool)

(assert (=> d!144275 (=> (not res!893976) (not e!766593))))

(assert (=> d!144275 (= res!893976 (isStrictlySorted!878 lt!595468))))

(assert (=> d!144275 (= (lemmaContainsTupThenGetReturnValue!366 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!595580)))

(declare-fun b!1347310 () Bool)

(declare-fun res!893977 () Bool)

(assert (=> b!1347310 (=> (not res!893977) (not e!766593))))

(assert (=> b!1347310 (= res!893977 (containsKey!740 lt!595468 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347311 () Bool)

(assert (=> b!1347311 (= e!766593 (contains!9124 lt!595468 (tuple2!24347 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144275 res!893976) b!1347310))

(assert (= (and b!1347310 res!893977) b!1347311))

(assert (=> d!144275 m!1233611))

(declare-fun m!1233883 () Bool)

(assert (=> d!144275 m!1233883))

(declare-fun m!1233885 () Bool)

(assert (=> d!144275 m!1233885))

(declare-fun m!1233887 () Bool)

(assert (=> b!1347310 m!1233887))

(declare-fun m!1233889 () Bool)

(assert (=> b!1347311 m!1233889))

(assert (=> d!144189 d!144275))

(declare-fun b!1347332 () Bool)

(declare-fun res!893982 () Bool)

(declare-fun e!766606 () Bool)

(assert (=> b!1347332 (=> (not res!893982) (not e!766606))))

(declare-fun lt!595583 () List!31481)

(assert (=> b!1347332 (= res!893982 (containsKey!740 lt!595583 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347333 () Bool)

(declare-fun e!766608 () List!31481)

(declare-fun e!766607 () List!31481)

(assert (=> b!1347333 (= e!766608 e!766607)))

(declare-fun c!126365 () Bool)

(assert (=> b!1347333 (= c!126365 (and ((_ is Cons!31477) (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12184 (h!32686 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1347334 () Bool)

(declare-fun e!766605 () List!31481)

(declare-fun call!65061 () List!31481)

(assert (=> b!1347334 (= e!766605 call!65061)))

(declare-fun e!766604 () List!31481)

(declare-fun b!1347335 () Bool)

(assert (=> b!1347335 (= e!766604 (insertStrictlySorted!495 (t!46065 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347336 () Bool)

(declare-fun call!65060 () List!31481)

(assert (=> b!1347336 (= e!766608 call!65060)))

(declare-fun c!126366 () Bool)

(declare-fun b!1347337 () Bool)

(assert (=> b!1347337 (= e!766604 (ite c!126365 (t!46065 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!126366 (Cons!31477 (h!32686 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!46065 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!31478)))))

(declare-fun b!1347338 () Bool)

(declare-fun call!65059 () List!31481)

(assert (=> b!1347338 (= e!766607 call!65059)))

(declare-fun bm!65056 () Bool)

(assert (=> bm!65056 (= call!65059 call!65060)))

(declare-fun bm!65057 () Bool)

(declare-fun c!126367 () Bool)

(declare-fun $colon$colon!674 (List!31481 tuple2!24346) List!31481)

(assert (=> bm!65057 (= call!65060 ($colon$colon!674 e!766604 (ite c!126367 (h!32686 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!24347 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun c!126368 () Bool)

(assert (=> bm!65057 (= c!126368 c!126367)))

(declare-fun d!144277 () Bool)

(assert (=> d!144277 e!766606))

(declare-fun res!893983 () Bool)

(assert (=> d!144277 (=> (not res!893983) (not e!766606))))

(assert (=> d!144277 (= res!893983 (isStrictlySorted!878 lt!595583))))

(assert (=> d!144277 (= lt!595583 e!766608)))

(assert (=> d!144277 (= c!126367 (and ((_ is Cons!31477) (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12184 (h!32686 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144277 (isStrictlySorted!878 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144277 (= (insertStrictlySorted!495 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!595583)))

(declare-fun b!1347339 () Bool)

(assert (=> b!1347339 (= e!766605 call!65061)))

(declare-fun b!1347340 () Bool)

(assert (=> b!1347340 (= c!126366 (and ((_ is Cons!31477) (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!12184 (h!32686 (toList!11017 (+!4865 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> b!1347340 (= e!766607 e!766605)))

(declare-fun bm!65058 () Bool)

(assert (=> bm!65058 (= call!65061 call!65059)))

(declare-fun b!1347341 () Bool)

(assert (=> b!1347341 (= e!766606 (contains!9124 lt!595583 (tuple2!24347 (_1!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12184 (tuple2!24347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144277 c!126367) b!1347336))

(assert (= (and d!144277 (not c!126367)) b!1347333))

(assert (= (and b!1347333 c!126365) b!1347338))

(assert (= (and b!1347333 (not c!126365)) b!1347340))

(assert (= (and b!1347340 c!126366) b!1347339))

(assert (= (and b!1347340 (not c!126366)) b!1347334))

(assert (= (or b!1347339 b!1347334) bm!65058))

(assert (= (or b!1347338 bm!65058) bm!65056))

(assert (= (or b!1347336 bm!65056) bm!65057))

(assert (= (and bm!65057 c!126368) b!1347335))

(assert (= (and bm!65057 (not c!126368)) b!1347337))

(assert (= (and d!144277 res!893983) b!1347332))

(assert (= (and b!1347332 res!893982) b!1347341))

(declare-fun m!1233891 () Bool)

(assert (=> b!1347341 m!1233891))

(declare-fun m!1233893 () Bool)

(assert (=> b!1347335 m!1233893))

(declare-fun m!1233895 () Bool)

(assert (=> bm!65057 m!1233895))

(declare-fun m!1233897 () Bool)

(assert (=> d!144277 m!1233897))

(declare-fun m!1233899 () Bool)

(assert (=> d!144277 m!1233899))

(declare-fun m!1233901 () Bool)

(assert (=> b!1347332 m!1233901))

(assert (=> d!144189 d!144277))

(declare-fun d!144279 () Bool)

(assert (=> d!144279 (= (apply!1030 lt!595433 (select (arr!44358 _keys!1571) from!1960)) (get!22413 (getValueByKey!723 (toList!11017 lt!595433) (select (arr!44358 _keys!1571) from!1960))))))

(declare-fun bs!38590 () Bool)

(assert (= bs!38590 d!144279))

(assert (=> bs!38590 m!1233429))

(assert (=> bs!38590 m!1233785))

(assert (=> bs!38590 m!1233785))

(declare-fun m!1233903 () Bool)

(assert (=> bs!38590 m!1233903))

(assert (=> b!1347088 d!144279))

(assert (=> b!1347088 d!144187))

(declare-fun d!144281 () Bool)

(assert (=> d!144281 (= (apply!1030 lt!595433 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22413 (getValueByKey!723 (toList!11017 lt!595433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38591 () Bool)

(assert (= bs!38591 d!144281))

(assert (=> bs!38591 m!1233871))

(assert (=> bs!38591 m!1233871))

(declare-fun m!1233905 () Bool)

(assert (=> bs!38591 m!1233905))

(assert (=> b!1347087 d!144281))

(declare-fun d!144283 () Bool)

(declare-fun res!893984 () Bool)

(declare-fun e!766609 () Bool)

(assert (=> d!144283 (=> res!893984 e!766609)))

(assert (=> d!144283 (= res!893984 (and ((_ is Cons!31477) (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12184 (h!32686 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144283 (= (containsKey!740 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!766609)))

(declare-fun b!1347342 () Bool)

(declare-fun e!766610 () Bool)

(assert (=> b!1347342 (= e!766609 e!766610)))

(declare-fun res!893985 () Bool)

(assert (=> b!1347342 (=> (not res!893985) (not e!766610))))

(assert (=> b!1347342 (= res!893985 (and (or (not ((_ is Cons!31477) (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12184 (h!32686 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31477) (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12184 (h!32686 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1347343 () Bool)

(assert (=> b!1347343 (= e!766610 (containsKey!740 (t!46065 (toList!11017 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144283 (not res!893984)) b!1347342))

(assert (= (and b!1347342 res!893985) b!1347343))

(declare-fun m!1233907 () Bool)

(assert (=> b!1347343 m!1233907))

(assert (=> d!144179 d!144283))

(declare-fun d!144285 () Bool)

(assert (=> d!144285 (= (apply!1030 lt!595433 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22413 (getValueByKey!723 (toList!11017 lt!595433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38592 () Bool)

(assert (= bs!38592 d!144285))

(assert (=> bs!38592 m!1233771))

(assert (=> bs!38592 m!1233771))

(declare-fun m!1233909 () Bool)

(assert (=> bs!38592 m!1233909))

(assert (=> b!1347086 d!144285))

(declare-fun d!144287 () Bool)

(declare-fun e!766611 () Bool)

(assert (=> d!144287 e!766611))

(declare-fun res!893986 () Bool)

(assert (=> d!144287 (=> (not res!893986) (not e!766611))))

(declare-fun lt!595585 () ListLongMap!22003)

(assert (=> d!144287 (= res!893986 (contains!9120 lt!595585 (_1!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!595587 () List!31481)

(assert (=> d!144287 (= lt!595585 (ListLongMap!22004 lt!595587))))

(declare-fun lt!595584 () Unit!43968)

(declare-fun lt!595586 () Unit!43968)

(assert (=> d!144287 (= lt!595584 lt!595586)))

(assert (=> d!144287 (= (getValueByKey!723 lt!595587 (_1!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!773 (_2!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144287 (= lt!595586 (lemmaContainsTupThenGetReturnValue!366 lt!595587 (_1!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144287 (= lt!595587 (insertStrictlySorted!495 (toList!11017 call!65034) (_1!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144287 (= (+!4865 call!65034 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!595585)))

(declare-fun b!1347344 () Bool)

(declare-fun res!893987 () Bool)

(assert (=> b!1347344 (=> (not res!893987) (not e!766611))))

(assert (=> b!1347344 (= res!893987 (= (getValueByKey!723 (toList!11017 lt!595585) (_1!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!773 (_2!12184 (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1347345 () Bool)

(assert (=> b!1347345 (= e!766611 (contains!9124 (toList!11017 lt!595585) (tuple2!24347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144287 res!893986) b!1347344))

(assert (= (and b!1347344 res!893987) b!1347345))

(declare-fun m!1233911 () Bool)

(assert (=> d!144287 m!1233911))

(declare-fun m!1233913 () Bool)

(assert (=> d!144287 m!1233913))

(declare-fun m!1233915 () Bool)

(assert (=> d!144287 m!1233915))

(declare-fun m!1233917 () Bool)

(assert (=> d!144287 m!1233917))

(declare-fun m!1233919 () Bool)

(assert (=> b!1347344 m!1233919))

(declare-fun m!1233921 () Bool)

(assert (=> b!1347345 m!1233921))

(assert (=> b!1347084 d!144287))

(declare-fun d!144289 () Bool)

(declare-fun e!766612 () Bool)

(assert (=> d!144289 e!766612))

(declare-fun res!893988 () Bool)

(assert (=> d!144289 (=> res!893988 e!766612)))

(declare-fun lt!595588 () Bool)

(assert (=> d!144289 (= res!893988 (not lt!595588))))

(declare-fun lt!595590 () Bool)

(assert (=> d!144289 (= lt!595588 lt!595590)))

(declare-fun lt!595591 () Unit!43968)

(declare-fun e!766613 () Unit!43968)

(assert (=> d!144289 (= lt!595591 e!766613)))

(declare-fun c!126369 () Bool)

(assert (=> d!144289 (= c!126369 lt!595590)))

(assert (=> d!144289 (= lt!595590 (containsKey!740 (toList!11017 lt!595462) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144289 (= (contains!9120 lt!595462 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!595588)))

(declare-fun b!1347346 () Bool)

(declare-fun lt!595589 () Unit!43968)

(assert (=> b!1347346 (= e!766613 lt!595589)))

(assert (=> b!1347346 (= lt!595589 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 lt!595462) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1347346 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595462) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347347 () Bool)

(declare-fun Unit!43981 () Unit!43968)

(assert (=> b!1347347 (= e!766613 Unit!43981)))

(declare-fun b!1347348 () Bool)

(assert (=> b!1347348 (= e!766612 (isDefined!530 (getValueByKey!723 (toList!11017 lt!595462) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144289 c!126369) b!1347346))

(assert (= (and d!144289 (not c!126369)) b!1347347))

(assert (= (and d!144289 (not res!893988)) b!1347348))

(declare-fun m!1233923 () Bool)

(assert (=> d!144289 m!1233923))

(declare-fun m!1233925 () Bool)

(assert (=> b!1347346 m!1233925))

(assert (=> b!1347346 m!1233601))

(assert (=> b!1347346 m!1233601))

(declare-fun m!1233927 () Bool)

(assert (=> b!1347346 m!1233927))

(assert (=> b!1347348 m!1233601))

(assert (=> b!1347348 m!1233601))

(assert (=> b!1347348 m!1233927))

(assert (=> d!144185 d!144289))

(declare-fun b!1347349 () Bool)

(declare-fun e!766614 () Option!774)

(assert (=> b!1347349 (= e!766614 (Some!773 (_2!12184 (h!32686 lt!595464))))))

(declare-fun e!766615 () Option!774)

(declare-fun b!1347351 () Bool)

(assert (=> b!1347351 (= e!766615 (getValueByKey!723 (t!46065 lt!595464) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347352 () Bool)

(assert (=> b!1347352 (= e!766615 None!772)))

(declare-fun b!1347350 () Bool)

(assert (=> b!1347350 (= e!766614 e!766615)))

(declare-fun c!126371 () Bool)

(assert (=> b!1347350 (= c!126371 (and ((_ is Cons!31477) lt!595464) (not (= (_1!12184 (h!32686 lt!595464)) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126370 () Bool)

(declare-fun d!144291 () Bool)

(assert (=> d!144291 (= c!126370 (and ((_ is Cons!31477) lt!595464) (= (_1!12184 (h!32686 lt!595464)) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144291 (= (getValueByKey!723 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!766614)))

(assert (= (and d!144291 c!126370) b!1347349))

(assert (= (and d!144291 (not c!126370)) b!1347350))

(assert (= (and b!1347350 c!126371) b!1347351))

(assert (= (and b!1347350 (not c!126371)) b!1347352))

(declare-fun m!1233929 () Bool)

(assert (=> b!1347351 m!1233929))

(assert (=> d!144185 d!144291))

(declare-fun d!144293 () Bool)

(assert (=> d!144293 (= (getValueByKey!723 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!595592 () Unit!43968)

(assert (=> d!144293 (= lt!595592 (choose!1982 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!766616 () Bool)

(assert (=> d!144293 e!766616))

(declare-fun res!893989 () Bool)

(assert (=> d!144293 (=> (not res!893989) (not e!766616))))

(assert (=> d!144293 (= res!893989 (isStrictlySorted!878 lt!595464))))

(assert (=> d!144293 (= (lemmaContainsTupThenGetReturnValue!366 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!595592)))

(declare-fun b!1347353 () Bool)

(declare-fun res!893990 () Bool)

(assert (=> b!1347353 (=> (not res!893990) (not e!766616))))

(assert (=> b!1347353 (= res!893990 (containsKey!740 lt!595464 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347354 () Bool)

(assert (=> b!1347354 (= e!766616 (contains!9124 lt!595464 (tuple2!24347 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144293 res!893989) b!1347353))

(assert (= (and b!1347353 res!893990) b!1347354))

(assert (=> d!144293 m!1233595))

(declare-fun m!1233931 () Bool)

(assert (=> d!144293 m!1233931))

(declare-fun m!1233933 () Bool)

(assert (=> d!144293 m!1233933))

(declare-fun m!1233935 () Bool)

(assert (=> b!1347353 m!1233935))

(declare-fun m!1233937 () Bool)

(assert (=> b!1347354 m!1233937))

(assert (=> d!144185 d!144293))

(declare-fun b!1347355 () Bool)

(declare-fun res!893991 () Bool)

(declare-fun e!766619 () Bool)

(assert (=> b!1347355 (=> (not res!893991) (not e!766619))))

(declare-fun lt!595593 () List!31481)

(assert (=> b!1347355 (= res!893991 (containsKey!740 lt!595593 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347356 () Bool)

(declare-fun e!766621 () List!31481)

(declare-fun e!766620 () List!31481)

(assert (=> b!1347356 (= e!766621 e!766620)))

(declare-fun c!126372 () Bool)

(assert (=> b!1347356 (= c!126372 (and ((_ is Cons!31477) (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12184 (h!32686 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1347357 () Bool)

(declare-fun e!766618 () List!31481)

(declare-fun call!65064 () List!31481)

(assert (=> b!1347357 (= e!766618 call!65064)))

(declare-fun e!766617 () List!31481)

(declare-fun b!1347358 () Bool)

(assert (=> b!1347358 (= e!766617 (insertStrictlySorted!495 (t!46065 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347359 () Bool)

(declare-fun call!65063 () List!31481)

(assert (=> b!1347359 (= e!766621 call!65063)))

(declare-fun c!126373 () Bool)

(declare-fun b!1347360 () Bool)

(assert (=> b!1347360 (= e!766617 (ite c!126372 (t!46065 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (ite c!126373 (Cons!31477 (h!32686 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (t!46065 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) Nil!31478)))))

(declare-fun b!1347361 () Bool)

(declare-fun call!65062 () List!31481)

(assert (=> b!1347361 (= e!766620 call!65062)))

(declare-fun bm!65059 () Bool)

(assert (=> bm!65059 (= call!65062 call!65063)))

(declare-fun bm!65060 () Bool)

(declare-fun c!126374 () Bool)

(assert (=> bm!65060 (= call!65063 ($colon$colon!674 e!766617 (ite c!126374 (h!32686 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (tuple2!24347 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126375 () Bool)

(assert (=> bm!65060 (= c!126375 c!126374)))

(declare-fun d!144295 () Bool)

(assert (=> d!144295 e!766619))

(declare-fun res!893992 () Bool)

(assert (=> d!144295 (=> (not res!893992) (not e!766619))))

(assert (=> d!144295 (= res!893992 (isStrictlySorted!878 lt!595593))))

(assert (=> d!144295 (= lt!595593 e!766621)))

(assert (=> d!144295 (= c!126374 (and ((_ is Cons!31477) (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12184 (h!32686 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144295 (isStrictlySorted!878 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))))

(assert (=> d!144295 (= (insertStrictlySorted!495 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!595593)))

(declare-fun b!1347362 () Bool)

(assert (=> b!1347362 (= e!766618 call!65064)))

(declare-fun b!1347363 () Bool)

(assert (=> b!1347363 (= c!126373 (and ((_ is Cons!31477) (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvsgt (_1!12184 (h!32686 (toList!11017 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1347363 (= e!766620 e!766618)))

(declare-fun bm!65061 () Bool)

(assert (=> bm!65061 (= call!65064 call!65062)))

(declare-fun b!1347364 () Bool)

(assert (=> b!1347364 (= e!766619 (contains!9124 lt!595593 (tuple2!24347 (_1!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12184 (tuple2!24347 (select (arr!44358 _keys!1571) from!1960) (get!22409 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144295 c!126374) b!1347359))

(assert (= (and d!144295 (not c!126374)) b!1347356))

(assert (= (and b!1347356 c!126372) b!1347361))

(assert (= (and b!1347356 (not c!126372)) b!1347363))

(assert (= (and b!1347363 c!126373) b!1347362))

(assert (= (and b!1347363 (not c!126373)) b!1347357))

(assert (= (or b!1347362 b!1347357) bm!65061))

(assert (= (or b!1347361 bm!65061) bm!65059))

(assert (= (or b!1347359 bm!65059) bm!65060))

(assert (= (and bm!65060 c!126375) b!1347358))

(assert (= (and bm!65060 (not c!126375)) b!1347360))

(assert (= (and d!144295 res!893992) b!1347355))

(assert (= (and b!1347355 res!893991) b!1347364))

(declare-fun m!1233939 () Bool)

(assert (=> b!1347364 m!1233939))

(declare-fun m!1233941 () Bool)

(assert (=> b!1347358 m!1233941))

(declare-fun m!1233943 () Bool)

(assert (=> bm!65060 m!1233943))

(declare-fun m!1233945 () Bool)

(assert (=> d!144295 m!1233945))

(declare-fun m!1233947 () Bool)

(assert (=> d!144295 m!1233947))

(declare-fun m!1233949 () Bool)

(assert (=> b!1347355 m!1233949))

(assert (=> d!144185 d!144295))

(assert (=> b!1347083 d!144197))

(assert (=> b!1347176 d!144251))

(declare-fun d!144297 () Bool)

(declare-fun e!766622 () Bool)

(assert (=> d!144297 e!766622))

(declare-fun res!893993 () Bool)

(assert (=> d!144297 (=> (not res!893993) (not e!766622))))

(declare-fun lt!595595 () ListLongMap!22003)

(assert (=> d!144297 (= res!893993 (contains!9120 lt!595595 (_1!12184 (tuple2!24347 lt!595445 zeroValue!1245))))))

(declare-fun lt!595597 () List!31481)

(assert (=> d!144297 (= lt!595595 (ListLongMap!22004 lt!595597))))

(declare-fun lt!595594 () Unit!43968)

(declare-fun lt!595596 () Unit!43968)

(assert (=> d!144297 (= lt!595594 lt!595596)))

(assert (=> d!144297 (= (getValueByKey!723 lt!595597 (_1!12184 (tuple2!24347 lt!595445 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595445 zeroValue!1245))))))

(assert (=> d!144297 (= lt!595596 (lemmaContainsTupThenGetReturnValue!366 lt!595597 (_1!12184 (tuple2!24347 lt!595445 zeroValue!1245)) (_2!12184 (tuple2!24347 lt!595445 zeroValue!1245))))))

(assert (=> d!144297 (= lt!595597 (insertStrictlySorted!495 (toList!11017 lt!595447) (_1!12184 (tuple2!24347 lt!595445 zeroValue!1245)) (_2!12184 (tuple2!24347 lt!595445 zeroValue!1245))))))

(assert (=> d!144297 (= (+!4865 lt!595447 (tuple2!24347 lt!595445 zeroValue!1245)) lt!595595)))

(declare-fun b!1347365 () Bool)

(declare-fun res!893994 () Bool)

(assert (=> b!1347365 (=> (not res!893994) (not e!766622))))

(assert (=> b!1347365 (= res!893994 (= (getValueByKey!723 (toList!11017 lt!595595) (_1!12184 (tuple2!24347 lt!595445 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595445 zeroValue!1245)))))))

(declare-fun b!1347366 () Bool)

(assert (=> b!1347366 (= e!766622 (contains!9124 (toList!11017 lt!595595) (tuple2!24347 lt!595445 zeroValue!1245)))))

(assert (= (and d!144297 res!893993) b!1347365))

(assert (= (and b!1347365 res!893994) b!1347366))

(declare-fun m!1233951 () Bool)

(assert (=> d!144297 m!1233951))

(declare-fun m!1233953 () Bool)

(assert (=> d!144297 m!1233953))

(declare-fun m!1233955 () Bool)

(assert (=> d!144297 m!1233955))

(declare-fun m!1233957 () Bool)

(assert (=> d!144297 m!1233957))

(declare-fun m!1233959 () Bool)

(assert (=> b!1347365 m!1233959))

(declare-fun m!1233961 () Bool)

(assert (=> b!1347366 m!1233961))

(assert (=> b!1347082 d!144297))

(declare-fun d!144299 () Bool)

(declare-fun e!766623 () Bool)

(assert (=> d!144299 e!766623))

(declare-fun res!893995 () Bool)

(assert (=> d!144299 (=> (not res!893995) (not e!766623))))

(declare-fun lt!595599 () ListLongMap!22003)

(assert (=> d!144299 (= res!893995 (contains!9120 lt!595599 (_1!12184 (tuple2!24347 lt!595452 zeroValue!1245))))))

(declare-fun lt!595601 () List!31481)

(assert (=> d!144299 (= lt!595599 (ListLongMap!22004 lt!595601))))

(declare-fun lt!595598 () Unit!43968)

(declare-fun lt!595600 () Unit!43968)

(assert (=> d!144299 (= lt!595598 lt!595600)))

(assert (=> d!144299 (= (getValueByKey!723 lt!595601 (_1!12184 (tuple2!24347 lt!595452 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595452 zeroValue!1245))))))

(assert (=> d!144299 (= lt!595600 (lemmaContainsTupThenGetReturnValue!366 lt!595601 (_1!12184 (tuple2!24347 lt!595452 zeroValue!1245)) (_2!12184 (tuple2!24347 lt!595452 zeroValue!1245))))))

(assert (=> d!144299 (= lt!595601 (insertStrictlySorted!495 (toList!11017 lt!595438) (_1!12184 (tuple2!24347 lt!595452 zeroValue!1245)) (_2!12184 (tuple2!24347 lt!595452 zeroValue!1245))))))

(assert (=> d!144299 (= (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245)) lt!595599)))

(declare-fun b!1347367 () Bool)

(declare-fun res!893996 () Bool)

(assert (=> b!1347367 (=> (not res!893996) (not e!766623))))

(assert (=> b!1347367 (= res!893996 (= (getValueByKey!723 (toList!11017 lt!595599) (_1!12184 (tuple2!24347 lt!595452 zeroValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595452 zeroValue!1245)))))))

(declare-fun b!1347368 () Bool)

(assert (=> b!1347368 (= e!766623 (contains!9124 (toList!11017 lt!595599) (tuple2!24347 lt!595452 zeroValue!1245)))))

(assert (= (and d!144299 res!893995) b!1347367))

(assert (= (and b!1347367 res!893996) b!1347368))

(declare-fun m!1233963 () Bool)

(assert (=> d!144299 m!1233963))

(declare-fun m!1233965 () Bool)

(assert (=> d!144299 m!1233965))

(declare-fun m!1233967 () Bool)

(assert (=> d!144299 m!1233967))

(declare-fun m!1233969 () Bool)

(assert (=> d!144299 m!1233969))

(declare-fun m!1233971 () Bool)

(assert (=> b!1347367 m!1233971))

(declare-fun m!1233973 () Bool)

(assert (=> b!1347368 m!1233973))

(assert (=> b!1347082 d!144299))

(declare-fun d!144301 () Bool)

(assert (=> d!144301 (= (apply!1030 (+!4865 lt!595442 (tuple2!24347 lt!595432 minValue!1245)) lt!595450) (apply!1030 lt!595442 lt!595450))))

(declare-fun lt!595604 () Unit!43968)

(declare-fun choose!1983 (ListLongMap!22003 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!43968)

(assert (=> d!144301 (= lt!595604 (choose!1983 lt!595442 lt!595432 minValue!1245 lt!595450))))

(declare-fun e!766626 () Bool)

(assert (=> d!144301 e!766626))

(declare-fun res!893999 () Bool)

(assert (=> d!144301 (=> (not res!893999) (not e!766626))))

(assert (=> d!144301 (= res!893999 (contains!9120 lt!595442 lt!595450))))

(assert (=> d!144301 (= (addApplyDifferent!568 lt!595442 lt!595432 minValue!1245 lt!595450) lt!595604)))

(declare-fun b!1347372 () Bool)

(assert (=> b!1347372 (= e!766626 (not (= lt!595450 lt!595432)))))

(assert (= (and d!144301 res!893999) b!1347372))

(assert (=> d!144301 m!1233561))

(assert (=> d!144301 m!1233575))

(assert (=> d!144301 m!1233561))

(declare-fun m!1233975 () Bool)

(assert (=> d!144301 m!1233975))

(assert (=> d!144301 m!1233573))

(declare-fun m!1233977 () Bool)

(assert (=> d!144301 m!1233977))

(assert (=> b!1347082 d!144301))

(declare-fun d!144303 () Bool)

(declare-fun e!766627 () Bool)

(assert (=> d!144303 e!766627))

(declare-fun res!894000 () Bool)

(assert (=> d!144303 (=> (not res!894000) (not e!766627))))

(declare-fun lt!595606 () ListLongMap!22003)

(assert (=> d!144303 (= res!894000 (contains!9120 lt!595606 (_1!12184 (tuple2!24347 lt!595431 minValue!1245))))))

(declare-fun lt!595608 () List!31481)

(assert (=> d!144303 (= lt!595606 (ListLongMap!22004 lt!595608))))

(declare-fun lt!595605 () Unit!43968)

(declare-fun lt!595607 () Unit!43968)

(assert (=> d!144303 (= lt!595605 lt!595607)))

(assert (=> d!144303 (= (getValueByKey!723 lt!595608 (_1!12184 (tuple2!24347 lt!595431 minValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595431 minValue!1245))))))

(assert (=> d!144303 (= lt!595607 (lemmaContainsTupThenGetReturnValue!366 lt!595608 (_1!12184 (tuple2!24347 lt!595431 minValue!1245)) (_2!12184 (tuple2!24347 lt!595431 minValue!1245))))))

(assert (=> d!144303 (= lt!595608 (insertStrictlySorted!495 (toList!11017 lt!595435) (_1!12184 (tuple2!24347 lt!595431 minValue!1245)) (_2!12184 (tuple2!24347 lt!595431 minValue!1245))))))

(assert (=> d!144303 (= (+!4865 lt!595435 (tuple2!24347 lt!595431 minValue!1245)) lt!595606)))

(declare-fun b!1347373 () Bool)

(declare-fun res!894001 () Bool)

(assert (=> b!1347373 (=> (not res!894001) (not e!766627))))

(assert (=> b!1347373 (= res!894001 (= (getValueByKey!723 (toList!11017 lt!595606) (_1!12184 (tuple2!24347 lt!595431 minValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595431 minValue!1245)))))))

(declare-fun b!1347374 () Bool)

(assert (=> b!1347374 (= e!766627 (contains!9124 (toList!11017 lt!595606) (tuple2!24347 lt!595431 minValue!1245)))))

(assert (= (and d!144303 res!894000) b!1347373))

(assert (= (and b!1347373 res!894001) b!1347374))

(declare-fun m!1233979 () Bool)

(assert (=> d!144303 m!1233979))

(declare-fun m!1233981 () Bool)

(assert (=> d!144303 m!1233981))

(declare-fun m!1233983 () Bool)

(assert (=> d!144303 m!1233983))

(declare-fun m!1233985 () Bool)

(assert (=> d!144303 m!1233985))

(declare-fun m!1233987 () Bool)

(assert (=> b!1347373 m!1233987))

(declare-fun m!1233989 () Bool)

(assert (=> b!1347374 m!1233989))

(assert (=> b!1347082 d!144303))

(declare-fun d!144305 () Bool)

(assert (=> d!144305 (= (apply!1030 (+!4865 lt!595442 (tuple2!24347 lt!595432 minValue!1245)) lt!595450) (get!22413 (getValueByKey!723 (toList!11017 (+!4865 lt!595442 (tuple2!24347 lt!595432 minValue!1245))) lt!595450)))))

(declare-fun bs!38593 () Bool)

(assert (= bs!38593 d!144305))

(declare-fun m!1233991 () Bool)

(assert (=> bs!38593 m!1233991))

(assert (=> bs!38593 m!1233991))

(declare-fun m!1233993 () Bool)

(assert (=> bs!38593 m!1233993))

(assert (=> b!1347082 d!144305))

(declare-fun d!144307 () Bool)

(declare-fun e!766628 () Bool)

(assert (=> d!144307 e!766628))

(declare-fun res!894002 () Bool)

(assert (=> d!144307 (=> res!894002 e!766628)))

(declare-fun lt!595609 () Bool)

(assert (=> d!144307 (= res!894002 (not lt!595609))))

(declare-fun lt!595611 () Bool)

(assert (=> d!144307 (= lt!595609 lt!595611)))

(declare-fun lt!595612 () Unit!43968)

(declare-fun e!766629 () Unit!43968)

(assert (=> d!144307 (= lt!595612 e!766629)))

(declare-fun c!126376 () Bool)

(assert (=> d!144307 (= c!126376 lt!595611)))

(assert (=> d!144307 (= lt!595611 (containsKey!740 (toList!11017 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245))) lt!595436))))

(assert (=> d!144307 (= (contains!9120 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245)) lt!595436) lt!595609)))

(declare-fun b!1347375 () Bool)

(declare-fun lt!595610 () Unit!43968)

(assert (=> b!1347375 (= e!766629 lt!595610)))

(assert (=> b!1347375 (= lt!595610 (lemmaContainsKeyImpliesGetValueByKeyDefined!487 (toList!11017 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245))) lt!595436))))

(assert (=> b!1347375 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245))) lt!595436))))

(declare-fun b!1347376 () Bool)

(declare-fun Unit!43982 () Unit!43968)

(assert (=> b!1347376 (= e!766629 Unit!43982)))

(declare-fun b!1347377 () Bool)

(assert (=> b!1347377 (= e!766628 (isDefined!530 (getValueByKey!723 (toList!11017 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245))) lt!595436)))))

(assert (= (and d!144307 c!126376) b!1347375))

(assert (= (and d!144307 (not c!126376)) b!1347376))

(assert (= (and d!144307 (not res!894002)) b!1347377))

(declare-fun m!1233995 () Bool)

(assert (=> d!144307 m!1233995))

(declare-fun m!1233997 () Bool)

(assert (=> b!1347375 m!1233997))

(declare-fun m!1233999 () Bool)

(assert (=> b!1347375 m!1233999))

(assert (=> b!1347375 m!1233999))

(declare-fun m!1234001 () Bool)

(assert (=> b!1347375 m!1234001))

(assert (=> b!1347377 m!1233999))

(assert (=> b!1347377 m!1233999))

(assert (=> b!1347377 m!1234001))

(assert (=> b!1347082 d!144307))

(declare-fun d!144309 () Bool)

(assert (=> d!144309 (= (apply!1030 (+!4865 lt!595435 (tuple2!24347 lt!595431 minValue!1245)) lt!595437) (get!22413 (getValueByKey!723 (toList!11017 (+!4865 lt!595435 (tuple2!24347 lt!595431 minValue!1245))) lt!595437)))))

(declare-fun bs!38594 () Bool)

(assert (= bs!38594 d!144309))

(declare-fun m!1234003 () Bool)

(assert (=> bs!38594 m!1234003))

(assert (=> bs!38594 m!1234003))

(declare-fun m!1234005 () Bool)

(assert (=> bs!38594 m!1234005))

(assert (=> b!1347082 d!144309))

(declare-fun d!144311 () Bool)

(assert (=> d!144311 (= (apply!1030 lt!595435 lt!595437) (get!22413 (getValueByKey!723 (toList!11017 lt!595435) lt!595437)))))

(declare-fun bs!38595 () Bool)

(assert (= bs!38595 d!144311))

(declare-fun m!1234007 () Bool)

(assert (=> bs!38595 m!1234007))

(assert (=> bs!38595 m!1234007))

(declare-fun m!1234009 () Bool)

(assert (=> bs!38595 m!1234009))

(assert (=> b!1347082 d!144311))

(declare-fun d!144313 () Bool)

(assert (=> d!144313 (= (apply!1030 (+!4865 lt!595447 (tuple2!24347 lt!595445 zeroValue!1245)) lt!595443) (get!22413 (getValueByKey!723 (toList!11017 (+!4865 lt!595447 (tuple2!24347 lt!595445 zeroValue!1245))) lt!595443)))))

(declare-fun bs!38596 () Bool)

(assert (= bs!38596 d!144313))

(declare-fun m!1234011 () Bool)

(assert (=> bs!38596 m!1234011))

(assert (=> bs!38596 m!1234011))

(declare-fun m!1234013 () Bool)

(assert (=> bs!38596 m!1234013))

(assert (=> b!1347082 d!144313))

(declare-fun d!144315 () Bool)

(assert (=> d!144315 (= (apply!1030 (+!4865 lt!595447 (tuple2!24347 lt!595445 zeroValue!1245)) lt!595443) (apply!1030 lt!595447 lt!595443))))

(declare-fun lt!595613 () Unit!43968)

(assert (=> d!144315 (= lt!595613 (choose!1983 lt!595447 lt!595445 zeroValue!1245 lt!595443))))

(declare-fun e!766630 () Bool)

(assert (=> d!144315 e!766630))

(declare-fun res!894003 () Bool)

(assert (=> d!144315 (=> (not res!894003) (not e!766630))))

(assert (=> d!144315 (= res!894003 (contains!9120 lt!595447 lt!595443))))

(assert (=> d!144315 (= (addApplyDifferent!568 lt!595447 lt!595445 zeroValue!1245 lt!595443) lt!595613)))

(declare-fun b!1347378 () Bool)

(assert (=> b!1347378 (= e!766630 (not (= lt!595443 lt!595445)))))

(assert (= (and d!144315 res!894003) b!1347378))

(assert (=> d!144315 m!1233545))

(assert (=> d!144315 m!1233547))

(assert (=> d!144315 m!1233545))

(declare-fun m!1234015 () Bool)

(assert (=> d!144315 m!1234015))

(assert (=> d!144315 m!1233551))

(declare-fun m!1234017 () Bool)

(assert (=> d!144315 m!1234017))

(assert (=> b!1347082 d!144315))

(declare-fun d!144317 () Bool)

(assert (=> d!144317 (= (apply!1030 lt!595447 lt!595443) (get!22413 (getValueByKey!723 (toList!11017 lt!595447) lt!595443)))))

(declare-fun bs!38597 () Bool)

(assert (= bs!38597 d!144317))

(declare-fun m!1234019 () Bool)

(assert (=> bs!38597 m!1234019))

(assert (=> bs!38597 m!1234019))

(declare-fun m!1234021 () Bool)

(assert (=> bs!38597 m!1234021))

(assert (=> b!1347082 d!144317))

(declare-fun d!144319 () Bool)

(declare-fun e!766631 () Bool)

(assert (=> d!144319 e!766631))

(declare-fun res!894004 () Bool)

(assert (=> d!144319 (=> (not res!894004) (not e!766631))))

(declare-fun lt!595615 () ListLongMap!22003)

(assert (=> d!144319 (= res!894004 (contains!9120 lt!595615 (_1!12184 (tuple2!24347 lt!595432 minValue!1245))))))

(declare-fun lt!595617 () List!31481)

(assert (=> d!144319 (= lt!595615 (ListLongMap!22004 lt!595617))))

(declare-fun lt!595614 () Unit!43968)

(declare-fun lt!595616 () Unit!43968)

(assert (=> d!144319 (= lt!595614 lt!595616)))

(assert (=> d!144319 (= (getValueByKey!723 lt!595617 (_1!12184 (tuple2!24347 lt!595432 minValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595432 minValue!1245))))))

(assert (=> d!144319 (= lt!595616 (lemmaContainsTupThenGetReturnValue!366 lt!595617 (_1!12184 (tuple2!24347 lt!595432 minValue!1245)) (_2!12184 (tuple2!24347 lt!595432 minValue!1245))))))

(assert (=> d!144319 (= lt!595617 (insertStrictlySorted!495 (toList!11017 lt!595442) (_1!12184 (tuple2!24347 lt!595432 minValue!1245)) (_2!12184 (tuple2!24347 lt!595432 minValue!1245))))))

(assert (=> d!144319 (= (+!4865 lt!595442 (tuple2!24347 lt!595432 minValue!1245)) lt!595615)))

(declare-fun b!1347379 () Bool)

(declare-fun res!894005 () Bool)

(assert (=> b!1347379 (=> (not res!894005) (not e!766631))))

(assert (=> b!1347379 (= res!894005 (= (getValueByKey!723 (toList!11017 lt!595615) (_1!12184 (tuple2!24347 lt!595432 minValue!1245))) (Some!773 (_2!12184 (tuple2!24347 lt!595432 minValue!1245)))))))

(declare-fun b!1347380 () Bool)

(assert (=> b!1347380 (= e!766631 (contains!9124 (toList!11017 lt!595615) (tuple2!24347 lt!595432 minValue!1245)))))

(assert (= (and d!144319 res!894004) b!1347379))

(assert (= (and b!1347379 res!894005) b!1347380))

(declare-fun m!1234023 () Bool)

(assert (=> d!144319 m!1234023))

(declare-fun m!1234025 () Bool)

(assert (=> d!144319 m!1234025))

(declare-fun m!1234027 () Bool)

(assert (=> d!144319 m!1234027))

(declare-fun m!1234029 () Bool)

(assert (=> d!144319 m!1234029))

(declare-fun m!1234031 () Bool)

(assert (=> b!1347379 m!1234031))

(declare-fun m!1234033 () Bool)

(assert (=> b!1347380 m!1234033))

(assert (=> b!1347082 d!144319))

(declare-fun d!144321 () Bool)

(assert (=> d!144321 (contains!9120 (+!4865 lt!595438 (tuple2!24347 lt!595452 zeroValue!1245)) lt!595436)))

(declare-fun lt!595620 () Unit!43968)

(declare-fun choose!1984 (ListLongMap!22003 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!43968)

(assert (=> d!144321 (= lt!595620 (choose!1984 lt!595438 lt!595452 zeroValue!1245 lt!595436))))

(assert (=> d!144321 (contains!9120 lt!595438 lt!595436)))

(assert (=> d!144321 (= (addStillContains!1206 lt!595438 lt!595452 zeroValue!1245 lt!595436) lt!595620)))

(declare-fun bs!38598 () Bool)

(assert (= bs!38598 d!144321))

(assert (=> bs!38598 m!1233549))

(assert (=> bs!38598 m!1233549))

(assert (=> bs!38598 m!1233565))

(declare-fun m!1234035 () Bool)

(assert (=> bs!38598 m!1234035))

(declare-fun m!1234037 () Bool)

(assert (=> bs!38598 m!1234037))

(assert (=> b!1347082 d!144321))

(declare-fun d!144323 () Bool)

(assert (=> d!144323 (= (apply!1030 lt!595442 lt!595450) (get!22413 (getValueByKey!723 (toList!11017 lt!595442) lt!595450)))))

(declare-fun bs!38599 () Bool)

(assert (= bs!38599 d!144323))

(declare-fun m!1234039 () Bool)

(assert (=> bs!38599 m!1234039))

(assert (=> bs!38599 m!1234039))

(declare-fun m!1234041 () Bool)

(assert (=> bs!38599 m!1234041))

(assert (=> b!1347082 d!144323))

(assert (=> b!1347082 d!144209))

(declare-fun d!144325 () Bool)

(assert (=> d!144325 (= (apply!1030 (+!4865 lt!595435 (tuple2!24347 lt!595431 minValue!1245)) lt!595437) (apply!1030 lt!595435 lt!595437))))

(declare-fun lt!595621 () Unit!43968)

(assert (=> d!144325 (= lt!595621 (choose!1983 lt!595435 lt!595431 minValue!1245 lt!595437))))

(declare-fun e!766632 () Bool)

(assert (=> d!144325 e!766632))

(declare-fun res!894006 () Bool)

(assert (=> d!144325 (=> (not res!894006) (not e!766632))))

(assert (=> d!144325 (= res!894006 (contains!9120 lt!595435 lt!595437))))

(assert (=> d!144325 (= (addApplyDifferent!568 lt!595435 lt!595431 minValue!1245 lt!595437) lt!595621)))

(declare-fun b!1347382 () Bool)

(assert (=> b!1347382 (= e!766632 (not (= lt!595437 lt!595431)))))

(assert (= (and d!144325 res!894006) b!1347382))

(assert (=> d!144325 m!1233555))

(assert (=> d!144325 m!1233557))

(assert (=> d!144325 m!1233555))

(declare-fun m!1234043 () Bool)

(assert (=> d!144325 m!1234043))

(assert (=> d!144325 m!1233553))

(declare-fun m!1234045 () Bool)

(assert (=> d!144325 m!1234045))

(assert (=> b!1347082 d!144325))

(declare-fun d!144327 () Bool)

(assert (=> d!144327 (= (get!22412 (select (arr!44359 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347123 d!144327))

(declare-fun d!144329 () Bool)

(assert (=> d!144329 (arrayContainsKey!0 _keys!1571 lt!595502 #b00000000000000000000000000000000)))

(declare-fun lt!595624 () Unit!43968)

(declare-fun choose!13 (array!91803 (_ BitVec 64) (_ BitVec 32)) Unit!43968)

(assert (=> d!144329 (= lt!595624 (choose!13 _keys!1571 lt!595502 #b00000000000000000000000000000000))))

(assert (=> d!144329 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144329 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595502 #b00000000000000000000000000000000) lt!595624)))

(declare-fun bs!38600 () Bool)

(assert (= bs!38600 d!144329))

(assert (=> bs!38600 m!1233661))

(declare-fun m!1234047 () Bool)

(assert (=> bs!38600 m!1234047))

(assert (=> b!1347175 d!144329))

(declare-fun d!144331 () Bool)

(declare-fun res!894011 () Bool)

(declare-fun e!766637 () Bool)

(assert (=> d!144331 (=> res!894011 e!766637)))

(assert (=> d!144331 (= res!894011 (= (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) lt!595502))))

(assert (=> d!144331 (= (arrayContainsKey!0 _keys!1571 lt!595502 #b00000000000000000000000000000000) e!766637)))

(declare-fun b!1347387 () Bool)

(declare-fun e!766638 () Bool)

(assert (=> b!1347387 (= e!766637 e!766638)))

(declare-fun res!894012 () Bool)

(assert (=> b!1347387 (=> (not res!894012) (not e!766638))))

(assert (=> b!1347387 (= res!894012 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44910 _keys!1571)))))

(declare-fun b!1347388 () Bool)

(assert (=> b!1347388 (= e!766638 (arrayContainsKey!0 _keys!1571 lt!595502 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144331 (not res!894011)) b!1347387))

(assert (= (and b!1347387 res!894012) b!1347388))

(assert (=> d!144331 m!1233585))

(declare-fun m!1234049 () Bool)

(assert (=> b!1347388 m!1234049))

(assert (=> b!1347175 d!144331))

(declare-fun d!144333 () Bool)

(declare-fun lt!595631 () SeekEntryResult!10055)

(assert (=> d!144333 (and (or ((_ is Undefined!10055) lt!595631) (not ((_ is Found!10055) lt!595631)) (and (bvsge (index!42592 lt!595631) #b00000000000000000000000000000000) (bvslt (index!42592 lt!595631) (size!44910 _keys!1571)))) (or ((_ is Undefined!10055) lt!595631) ((_ is Found!10055) lt!595631) (not ((_ is MissingZero!10055) lt!595631)) (and (bvsge (index!42591 lt!595631) #b00000000000000000000000000000000) (bvslt (index!42591 lt!595631) (size!44910 _keys!1571)))) (or ((_ is Undefined!10055) lt!595631) ((_ is Found!10055) lt!595631) ((_ is MissingZero!10055) lt!595631) (not ((_ is MissingVacant!10055) lt!595631)) (and (bvsge (index!42594 lt!595631) #b00000000000000000000000000000000) (bvslt (index!42594 lt!595631) (size!44910 _keys!1571)))) (or ((_ is Undefined!10055) lt!595631) (ite ((_ is Found!10055) lt!595631) (= (select (arr!44358 _keys!1571) (index!42592 lt!595631)) (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10055) lt!595631) (= (select (arr!44358 _keys!1571) (index!42591 lt!595631)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10055) lt!595631) (= (select (arr!44358 _keys!1571) (index!42594 lt!595631)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!766647 () SeekEntryResult!10055)

(assert (=> d!144333 (= lt!595631 e!766647)))

(declare-fun c!126383 () Bool)

(declare-fun lt!595633 () SeekEntryResult!10055)

(assert (=> d!144333 (= c!126383 (and ((_ is Intermediate!10055) lt!595633) (undefined!10867 lt!595633)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91803 (_ BitVec 32)) SeekEntryResult!10055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144333 (= lt!595633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144333 (validMask!0 mask!1977)))

(assert (=> d!144333 (= (seekEntryOrOpen!0 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!595631)))

(declare-fun b!1347401 () Bool)

(declare-fun c!126384 () Bool)

(declare-fun lt!595632 () (_ BitVec 64))

(assert (=> b!1347401 (= c!126384 (= lt!595632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!766646 () SeekEntryResult!10055)

(declare-fun e!766645 () SeekEntryResult!10055)

(assert (=> b!1347401 (= e!766646 e!766645)))

(declare-fun b!1347402 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91803 (_ BitVec 32)) SeekEntryResult!10055)

(assert (=> b!1347402 (= e!766645 (seekKeyOrZeroReturnVacant!0 (x!120556 lt!595633) (index!42593 lt!595633) (index!42593 lt!595633) (select (arr!44358 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun b!1347403 () Bool)

(assert (=> b!1347403 (= e!766645 (MissingZero!10055 (index!42593 lt!595633)))))

(declare-fun b!1347404 () Bool)

(assert (=> b!1347404 (= e!766647 e!766646)))

(assert (=> b!1347404 (= lt!595632 (select (arr!44358 _keys!1571) (index!42593 lt!595633)))))

(declare-fun c!126385 () Bool)

(assert (=> b!1347404 (= c!126385 (= lt!595632 (select (arr!44358 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347405 () Bool)

(assert (=> b!1347405 (= e!766646 (Found!10055 (index!42593 lt!595633)))))

(declare-fun b!1347406 () Bool)

(assert (=> b!1347406 (= e!766647 Undefined!10055)))

(assert (= (and d!144333 c!126383) b!1347406))

(assert (= (and d!144333 (not c!126383)) b!1347404))

(assert (= (and b!1347404 c!126385) b!1347405))

(assert (= (and b!1347404 (not c!126385)) b!1347401))

(assert (= (and b!1347401 c!126384) b!1347403))

(assert (= (and b!1347401 (not c!126384)) b!1347402))

(declare-fun m!1234051 () Bool)

(assert (=> d!144333 m!1234051))

(assert (=> d!144333 m!1233585))

(declare-fun m!1234053 () Bool)

(assert (=> d!144333 m!1234053))

(assert (=> d!144333 m!1234053))

(assert (=> d!144333 m!1233585))

(declare-fun m!1234055 () Bool)

(assert (=> d!144333 m!1234055))

(assert (=> d!144333 m!1233433))

(declare-fun m!1234057 () Bool)

(assert (=> d!144333 m!1234057))

(declare-fun m!1234059 () Bool)

(assert (=> d!144333 m!1234059))

(assert (=> b!1347402 m!1233585))

(declare-fun m!1234061 () Bool)

(assert (=> b!1347402 m!1234061))

(declare-fun m!1234063 () Bool)

(assert (=> b!1347404 m!1234063))

(assert (=> b!1347175 d!144333))

(declare-fun mapNonEmpty!57986 () Bool)

(declare-fun mapRes!57986 () Bool)

(declare-fun tp!110361 () Bool)

(declare-fun e!766649 () Bool)

(assert (=> mapNonEmpty!57986 (= mapRes!57986 (and tp!110361 e!766649))))

(declare-fun mapKey!57986 () (_ BitVec 32))

(declare-fun mapRest!57986 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapValue!57986 () ValueCell!17858)

(assert (=> mapNonEmpty!57986 (= mapRest!57985 (store mapRest!57986 mapKey!57986 mapValue!57986))))

(declare-fun b!1347408 () Bool)

(declare-fun e!766648 () Bool)

(assert (=> b!1347408 (= e!766648 tp_is_empty!37513)))

(declare-fun condMapEmpty!57986 () Bool)

(declare-fun mapDefault!57986 () ValueCell!17858)

(assert (=> mapNonEmpty!57985 (= condMapEmpty!57986 (= mapRest!57985 ((as const (Array (_ BitVec 32) ValueCell!17858)) mapDefault!57986)))))

(assert (=> mapNonEmpty!57985 (= tp!110360 (and e!766648 mapRes!57986))))

(declare-fun b!1347407 () Bool)

(assert (=> b!1347407 (= e!766649 tp_is_empty!37513)))

(declare-fun mapIsEmpty!57986 () Bool)

(assert (=> mapIsEmpty!57986 mapRes!57986))

(assert (= (and mapNonEmpty!57985 condMapEmpty!57986) mapIsEmpty!57986))

(assert (= (and mapNonEmpty!57985 (not condMapEmpty!57986)) mapNonEmpty!57986))

(assert (= (and mapNonEmpty!57986 ((_ is ValueCellFull!17858) mapValue!57986)) b!1347407))

(assert (= (and mapNonEmpty!57985 ((_ is ValueCellFull!17858) mapDefault!57986)) b!1347408))

(declare-fun m!1234065 () Bool)

(assert (=> mapNonEmpty!57986 m!1234065))

(declare-fun b_lambda!24575 () Bool)

(assert (= b_lambda!24573 (or (and start!113462 b_free!31513) b_lambda!24575)))

(declare-fun b_lambda!24577 () Bool)

(assert (= b_lambda!24569 (or (and start!113462 b_free!31513) b_lambda!24577)))

(declare-fun b_lambda!24579 () Bool)

(assert (= b_lambda!24567 (or (and start!113462 b_free!31513) b_lambda!24579)))

(declare-fun b_lambda!24581 () Bool)

(assert (= b_lambda!24571 (or (and start!113462 b_free!31513) b_lambda!24581)))

(check-sat (not d!144257) (not b!1347229) (not b!1347289) (not b!1347230) (not d!144303) (not b!1347226) (not b!1347272) (not b!1347203) (not b!1347375) (not d!144231) (not d!144309) (not b!1347354) (not b!1347257) (not b_lambda!24579) (not d!144299) (not b!1347367) (not d!144319) (not d!144225) (not bm!65048) (not d!144333) (not b!1347282) (not d!144323) (not bm!65060) (not b!1347227) (not b!1347211) (not b!1347271) (not b!1347296) (not b!1347341) (not d!144261) (not d!144313) (not b!1347235) (not b!1347365) (not b_lambda!24575) (not b_lambda!24581) (not bm!65049) (not b!1347239) (not b!1347379) (not d!144265) (not b!1347377) (not b!1347255) (not b!1347283) (not d!144235) (not d!144329) (not d!144295) (not b!1347285) (not d!144325) (not d!144315) (not d!144321) (not b!1347388) (not b!1347223) (not b!1347247) (not d!144301) (not d!144239) (not b!1347355) (not b!1347212) (not d!144287) (not d!144307) (not b!1347335) (not b!1347351) (not d!144269) (not b!1347380) (not b!1347299) (not b!1347343) (not b!1347222) (not d!144305) (not b!1347215) (not b!1347246) (not b!1347364) (not b!1347243) (not b!1347311) (not b!1347301) (not d!144297) (not b!1347348) (not d!144317) (not b!1347195) (not d!144275) (not b_lambda!24565) (not b!1347374) (not b!1347295) (not b!1347287) (not b_lambda!24553) (not d!144259) (not mapNonEmpty!57986) (not b!1347249) (not b_lambda!24577) (not d!144243) (not b!1347228) (not b!1347332) (not b!1347232) (not b!1347202) (not d!144219) (not b!1347366) (not b!1347368) (not d!144229) (not d!144289) (not b!1347279) (not d!144271) (not d!144277) (not d!144205) (not b!1347402) (not b!1347269) (not b!1347273) (not d!144311) (not d!144223) (not b!1347373) (not b!1347274) (not d!144245) (not b!1347244) (not d!144241) (not b!1347344) (not b!1347345) (not b!1347207) (not b!1347236) (not b_lambda!24561) (not bm!65046) (not d!144227) tp_is_empty!37513 (not b!1347233) (not b!1347204) b_and!50807 (not d!144247) (not b!1347358) (not b_next!31513) (not d!144215) (not b!1347201) (not b!1347266) (not b!1347221) (not b!1347260) (not bm!65057) (not b!1347310) (not d!144293) (not d!144255) (not b!1347241) (not b!1347258) (not d!144281) (not b_lambda!24563) (not b!1347353) (not b!1347200) (not b!1347281) (not d!144279) (not b!1347304) (not b!1347206) (not b!1347346) (not d!144209) (not d!144237) (not bm!65047) (not b!1347218) (not d!144285) (not b!1347217) (not b!1347298) (not b!1347197))
(check-sat b_and!50807 (not b_next!31513))
