; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101388 () Bool)

(assert start!101388)

(declare-fun b_free!26259 () Bool)

(declare-fun b_next!26259 () Bool)

(assert (=> start!101388 (= b_free!26259 (not b_next!26259))))

(declare-fun tp!91804 () Bool)

(declare-fun b_and!43671 () Bool)

(assert (=> start!101388 (= tp!91804 b_and!43671)))

(declare-fun b!1218559 () Bool)

(declare-fun e!691843 () Bool)

(declare-fun tp_is_empty!30963 () Bool)

(assert (=> b!1218559 (= e!691843 tp_is_empty!30963)))

(declare-fun b!1218560 () Bool)

(declare-fun res!809331 () Bool)

(declare-fun e!691846 () Bool)

(assert (=> b!1218560 (=> (not res!809331) (not e!691846))))

(declare-datatypes ((array!78699 0))(
  ( (array!78700 (arr!37982 (Array (_ BitVec 32) (_ BitVec 64))) (size!38518 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78699)

(declare-datatypes ((List!26790 0))(
  ( (Nil!26787) (Cons!26786 (h!27995 (_ BitVec 64)) (t!40029 List!26790)) )
))
(declare-fun arrayNoDuplicates!0 (array!78699 (_ BitVec 32) List!26790) Bool)

(assert (=> b!1218560 (= res!809331 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26787))))

(declare-fun b!1218561 () Bool)

(declare-fun res!809328 () Bool)

(assert (=> b!1218561 (=> (not res!809328) (not e!691846))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1218561 (= res!809328 (= (select (arr!37982 _keys!1208) i!673) k0!934))))

(declare-fun res!809322 () Bool)

(assert (=> start!101388 (=> (not res!809322) (not e!691846))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101388 (= res!809322 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38518 _keys!1208))))))

(assert (=> start!101388 e!691846))

(assert (=> start!101388 tp_is_empty!30963))

(declare-fun array_inv!28906 (array!78699) Bool)

(assert (=> start!101388 (array_inv!28906 _keys!1208)))

(assert (=> start!101388 true))

(assert (=> start!101388 tp!91804))

(declare-datatypes ((V!46411 0))(
  ( (V!46412 (val!15538 Int)) )
))
(declare-datatypes ((ValueCell!14772 0))(
  ( (ValueCellFull!14772 (v!18193 V!46411)) (EmptyCell!14772) )
))
(declare-datatypes ((array!78701 0))(
  ( (array!78702 (arr!37983 (Array (_ BitVec 32) ValueCell!14772)) (size!38519 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78701)

(declare-fun e!691841 () Bool)

(declare-fun array_inv!28907 (array!78701) Bool)

(assert (=> start!101388 (and (array_inv!28907 _values!996) e!691841)))

(declare-fun b!1218562 () Bool)

(declare-fun e!691840 () Bool)

(assert (=> b!1218562 (= e!691846 e!691840)))

(declare-fun res!809333 () Bool)

(assert (=> b!1218562 (=> (not res!809333) (not e!691840))))

(declare-fun lt!553958 () array!78699)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78699 (_ BitVec 32)) Bool)

(assert (=> b!1218562 (= res!809333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553958 mask!1564))))

(assert (=> b!1218562 (= lt!553958 (array!78700 (store (arr!37982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38518 _keys!1208)))))

(declare-fun b!1218563 () Bool)

(declare-fun res!809324 () Bool)

(assert (=> b!1218563 (=> (not res!809324) (not e!691846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218563 (= res!809324 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48325 () Bool)

(declare-fun mapRes!48325 () Bool)

(declare-fun tp!91805 () Bool)

(declare-fun e!691850 () Bool)

(assert (=> mapNonEmpty!48325 (= mapRes!48325 (and tp!91805 e!691850))))

(declare-fun mapValue!48325 () ValueCell!14772)

(declare-fun mapRest!48325 () (Array (_ BitVec 32) ValueCell!14772))

(declare-fun mapKey!48325 () (_ BitVec 32))

(assert (=> mapNonEmpty!48325 (= (arr!37983 _values!996) (store mapRest!48325 mapKey!48325 mapValue!48325))))

(declare-fun b!1218564 () Bool)

(declare-fun e!691842 () Bool)

(declare-fun e!691847 () Bool)

(assert (=> b!1218564 (= e!691842 e!691847)))

(declare-fun res!809327 () Bool)

(assert (=> b!1218564 (=> res!809327 e!691847)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218564 (= res!809327 (not (validKeyInArray!0 (select (arr!37982 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19988 0))(
  ( (tuple2!19989 (_1!10005 (_ BitVec 64)) (_2!10005 V!46411)) )
))
(declare-datatypes ((List!26791 0))(
  ( (Nil!26788) (Cons!26787 (h!27996 tuple2!19988) (t!40030 List!26791)) )
))
(declare-datatypes ((ListLongMap!17957 0))(
  ( (ListLongMap!17958 (toList!8994 List!26791)) )
))
(declare-fun lt!553955 () ListLongMap!17957)

(declare-fun lt!553953 () ListLongMap!17957)

(assert (=> b!1218564 (= lt!553955 lt!553953)))

(declare-fun lt!553960 () ListLongMap!17957)

(declare-fun -!1908 (ListLongMap!17957 (_ BitVec 64)) ListLongMap!17957)

(assert (=> b!1218564 (= lt!553953 (-!1908 lt!553960 k0!934))))

(declare-fun zeroValue!944 () V!46411)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!553956 () array!78701)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46411)

(declare-fun getCurrentListMapNoExtraKeys!5420 (array!78699 array!78701 (_ BitVec 32) (_ BitVec 32) V!46411 V!46411 (_ BitVec 32) Int) ListLongMap!17957)

(assert (=> b!1218564 (= lt!553955 (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218564 (= lt!553960 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40392 0))(
  ( (Unit!40393) )
))
(declare-fun lt!553957 () Unit!40392)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1115 (array!78699 array!78701 (_ BitVec 32) (_ BitVec 32) V!46411 V!46411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40392)

(assert (=> b!1218564 (= lt!553957 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1115 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218565 () Bool)

(declare-fun e!691848 () Bool)

(assert (=> b!1218565 (= e!691848 e!691842)))

(declare-fun res!809332 () Bool)

(assert (=> b!1218565 (=> res!809332 e!691842)))

(assert (=> b!1218565 (= res!809332 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553961 () ListLongMap!17957)

(assert (=> b!1218565 (= lt!553961 (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553959 () V!46411)

(assert (=> b!1218565 (= lt!553956 (array!78702 (store (arr!37983 _values!996) i!673 (ValueCellFull!14772 lt!553959)) (size!38519 _values!996)))))

(declare-fun dynLambda!3303 (Int (_ BitVec 64)) V!46411)

(assert (=> b!1218565 (= lt!553959 (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553962 () ListLongMap!17957)

(assert (=> b!1218565 (= lt!553962 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218566 () Bool)

(assert (=> b!1218566 (= e!691840 (not e!691848))))

(declare-fun res!809334 () Bool)

(assert (=> b!1218566 (=> res!809334 e!691848)))

(assert (=> b!1218566 (= res!809334 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218566 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553954 () Unit!40392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78699 (_ BitVec 64) (_ BitVec 32)) Unit!40392)

(assert (=> b!1218566 (= lt!553954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218567 () Bool)

(assert (=> b!1218567 (= e!691850 tp_is_empty!30963)))

(declare-fun b!1218568 () Bool)

(declare-fun res!809326 () Bool)

(assert (=> b!1218568 (=> (not res!809326) (not e!691846))))

(assert (=> b!1218568 (= res!809326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218569 () Bool)

(declare-fun e!691849 () Bool)

(declare-fun e!691844 () Bool)

(assert (=> b!1218569 (= e!691849 e!691844)))

(declare-fun res!809336 () Bool)

(assert (=> b!1218569 (=> res!809336 e!691844)))

(assert (=> b!1218569 (= res!809336 (not (= (select (arr!37982 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218570 () Bool)

(declare-fun res!809330 () Bool)

(assert (=> b!1218570 (=> (not res!809330) (not e!691846))))

(assert (=> b!1218570 (= res!809330 (and (= (size!38519 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38518 _keys!1208) (size!38519 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218571 () Bool)

(assert (=> b!1218571 (= e!691841 (and e!691843 mapRes!48325))))

(declare-fun condMapEmpty!48325 () Bool)

(declare-fun mapDefault!48325 () ValueCell!14772)

(assert (=> b!1218571 (= condMapEmpty!48325 (= (arr!37983 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14772)) mapDefault!48325)))))

(declare-fun b!1218572 () Bool)

(assert (=> b!1218572 (= e!691847 (or (not (= (select (arr!37982 _keys!1208) from!1455) k0!934)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (size!38518 _keys!1208) #b01111111111111111111111111111111)))))

(assert (=> b!1218572 e!691849))

(declare-fun res!809335 () Bool)

(assert (=> b!1218572 (=> (not res!809335) (not e!691849))))

(declare-fun +!4063 (ListLongMap!17957 tuple2!19988) ListLongMap!17957)

(declare-fun get!19360 (ValueCell!14772 V!46411) V!46411)

(assert (=> b!1218572 (= res!809335 (= lt!553961 (+!4063 lt!553953 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))))))

(declare-fun b!1218573 () Bool)

(declare-fun res!809325 () Bool)

(assert (=> b!1218573 (=> (not res!809325) (not e!691846))))

(assert (=> b!1218573 (= res!809325 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48325 () Bool)

(assert (=> mapIsEmpty!48325 mapRes!48325))

(declare-fun b!1218574 () Bool)

(declare-fun res!809329 () Bool)

(assert (=> b!1218574 (=> (not res!809329) (not e!691840))))

(assert (=> b!1218574 (= res!809329 (arrayNoDuplicates!0 lt!553958 #b00000000000000000000000000000000 Nil!26787))))

(declare-fun b!1218575 () Bool)

(assert (=> b!1218575 (= e!691844 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218576 () Bool)

(declare-fun res!809323 () Bool)

(assert (=> b!1218576 (=> (not res!809323) (not e!691846))))

(assert (=> b!1218576 (= res!809323 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38518 _keys!1208))))))

(assert (= (and start!101388 res!809322) b!1218563))

(assert (= (and b!1218563 res!809324) b!1218570))

(assert (= (and b!1218570 res!809330) b!1218568))

(assert (= (and b!1218568 res!809326) b!1218560))

(assert (= (and b!1218560 res!809331) b!1218576))

(assert (= (and b!1218576 res!809323) b!1218573))

(assert (= (and b!1218573 res!809325) b!1218561))

(assert (= (and b!1218561 res!809328) b!1218562))

(assert (= (and b!1218562 res!809333) b!1218574))

(assert (= (and b!1218574 res!809329) b!1218566))

(assert (= (and b!1218566 (not res!809334)) b!1218565))

(assert (= (and b!1218565 (not res!809332)) b!1218564))

(assert (= (and b!1218564 (not res!809327)) b!1218572))

(assert (= (and b!1218572 res!809335) b!1218569))

(assert (= (and b!1218569 (not res!809336)) b!1218575))

(assert (= (and b!1218571 condMapEmpty!48325) mapIsEmpty!48325))

(assert (= (and b!1218571 (not condMapEmpty!48325)) mapNonEmpty!48325))

(get-info :version)

(assert (= (and mapNonEmpty!48325 ((_ is ValueCellFull!14772) mapValue!48325)) b!1218567))

(assert (= (and b!1218571 ((_ is ValueCellFull!14772) mapDefault!48325)) b!1218559))

(assert (= start!101388 b!1218571))

(declare-fun b_lambda!22011 () Bool)

(assert (=> (not b_lambda!22011) (not b!1218565)))

(declare-fun t!40028 () Bool)

(declare-fun tb!11059 () Bool)

(assert (=> (and start!101388 (= defaultEntry!1004 defaultEntry!1004) t!40028) tb!11059))

(declare-fun result!22719 () Bool)

(assert (=> tb!11059 (= result!22719 tp_is_empty!30963)))

(assert (=> b!1218565 t!40028))

(declare-fun b_and!43673 () Bool)

(assert (= b_and!43671 (and (=> t!40028 result!22719) b_and!43673)))

(declare-fun m!1123297 () Bool)

(assert (=> b!1218569 m!1123297))

(declare-fun m!1123299 () Bool)

(assert (=> start!101388 m!1123299))

(declare-fun m!1123301 () Bool)

(assert (=> start!101388 m!1123301))

(declare-fun m!1123303 () Bool)

(assert (=> b!1218560 m!1123303))

(declare-fun m!1123305 () Bool)

(assert (=> b!1218573 m!1123305))

(declare-fun m!1123307 () Bool)

(assert (=> b!1218575 m!1123307))

(assert (=> b!1218572 m!1123297))

(declare-fun m!1123309 () Bool)

(assert (=> b!1218572 m!1123309))

(assert (=> b!1218572 m!1123309))

(declare-fun m!1123311 () Bool)

(assert (=> b!1218572 m!1123311))

(declare-fun m!1123313 () Bool)

(assert (=> b!1218572 m!1123313))

(declare-fun m!1123315 () Bool)

(assert (=> b!1218565 m!1123315))

(declare-fun m!1123317 () Bool)

(assert (=> b!1218565 m!1123317))

(declare-fun m!1123319 () Bool)

(assert (=> b!1218565 m!1123319))

(declare-fun m!1123321 () Bool)

(assert (=> b!1218565 m!1123321))

(declare-fun m!1123323 () Bool)

(assert (=> b!1218562 m!1123323))

(declare-fun m!1123325 () Bool)

(assert (=> b!1218562 m!1123325))

(declare-fun m!1123327 () Bool)

(assert (=> b!1218563 m!1123327))

(declare-fun m!1123329 () Bool)

(assert (=> b!1218561 m!1123329))

(declare-fun m!1123331 () Bool)

(assert (=> b!1218566 m!1123331))

(declare-fun m!1123333 () Bool)

(assert (=> b!1218566 m!1123333))

(declare-fun m!1123335 () Bool)

(assert (=> b!1218574 m!1123335))

(declare-fun m!1123337 () Bool)

(assert (=> mapNonEmpty!48325 m!1123337))

(declare-fun m!1123339 () Bool)

(assert (=> b!1218564 m!1123339))

(declare-fun m!1123341 () Bool)

(assert (=> b!1218564 m!1123341))

(declare-fun m!1123343 () Bool)

(assert (=> b!1218564 m!1123343))

(assert (=> b!1218564 m!1123297))

(assert (=> b!1218564 m!1123297))

(declare-fun m!1123345 () Bool)

(assert (=> b!1218564 m!1123345))

(declare-fun m!1123347 () Bool)

(assert (=> b!1218564 m!1123347))

(declare-fun m!1123349 () Bool)

(assert (=> b!1218568 m!1123349))

(check-sat (not b!1218563) (not b!1218562) b_and!43673 (not mapNonEmpty!48325) (not b!1218564) (not b!1218565) (not b_next!26259) (not b_lambda!22011) (not b!1218566) (not b!1218573) tp_is_empty!30963 (not b!1218560) (not b!1218575) (not b!1218572) (not start!101388) (not b!1218568) (not b!1218574))
(check-sat b_and!43673 (not b_next!26259))
(get-model)

(declare-fun b_lambda!22015 () Bool)

(assert (= b_lambda!22011 (or (and start!101388 b_free!26259) b_lambda!22015)))

(check-sat (not b!1218563) (not b!1218562) (not b_lambda!22015) b_and!43673 (not mapNonEmpty!48325) (not b!1218564) (not b!1218565) (not b_next!26259) (not b!1218566) (not b!1218573) tp_is_empty!30963 (not b!1218560) (not b!1218575) (not b!1218572) (not start!101388) (not b!1218568) (not b!1218574))
(check-sat b_and!43673 (not b_next!26259))
(get-model)

(declare-fun b!1218643 () Bool)

(declare-fun e!691891 () Bool)

(declare-fun call!60649 () Bool)

(assert (=> b!1218643 (= e!691891 call!60649)))

(declare-fun d!133641 () Bool)

(declare-fun res!809386 () Bool)

(declare-fun e!691890 () Bool)

(assert (=> d!133641 (=> res!809386 e!691890)))

(assert (=> d!133641 (= res!809386 (bvsge #b00000000000000000000000000000000 (size!38518 _keys!1208)))))

(assert (=> d!133641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!691890)))

(declare-fun bm!60646 () Bool)

(assert (=> bm!60646 (= call!60649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1218644 () Bool)

(declare-fun e!691892 () Bool)

(assert (=> b!1218644 (= e!691892 call!60649)))

(declare-fun b!1218645 () Bool)

(assert (=> b!1218645 (= e!691892 e!691891)))

(declare-fun lt!554001 () (_ BitVec 64))

(assert (=> b!1218645 (= lt!554001 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553999 () Unit!40392)

(assert (=> b!1218645 (= lt!553999 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554001 #b00000000000000000000000000000000))))

(assert (=> b!1218645 (arrayContainsKey!0 _keys!1208 lt!554001 #b00000000000000000000000000000000)))

(declare-fun lt!554000 () Unit!40392)

(assert (=> b!1218645 (= lt!554000 lt!553999)))

(declare-fun res!809387 () Bool)

(declare-datatypes ((SeekEntryResult!9945 0))(
  ( (MissingZero!9945 (index!42151 (_ BitVec 32))) (Found!9945 (index!42152 (_ BitVec 32))) (Intermediate!9945 (undefined!10757 Bool) (index!42153 (_ BitVec 32)) (x!107354 (_ BitVec 32))) (Undefined!9945) (MissingVacant!9945 (index!42154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78699 (_ BitVec 32)) SeekEntryResult!9945)

(assert (=> b!1218645 (= res!809387 (= (seekEntryOrOpen!0 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9945 #b00000000000000000000000000000000)))))

(assert (=> b!1218645 (=> (not res!809387) (not e!691891))))

(declare-fun b!1218646 () Bool)

(assert (=> b!1218646 (= e!691890 e!691892)))

(declare-fun c!120127 () Bool)

(assert (=> b!1218646 (= c!120127 (validKeyInArray!0 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133641 (not res!809386)) b!1218646))

(assert (= (and b!1218646 c!120127) b!1218645))

(assert (= (and b!1218646 (not c!120127)) b!1218644))

(assert (= (and b!1218645 res!809387) b!1218643))

(assert (= (or b!1218643 b!1218644) bm!60646))

(declare-fun m!1123405 () Bool)

(assert (=> bm!60646 m!1123405))

(declare-fun m!1123407 () Bool)

(assert (=> b!1218645 m!1123407))

(declare-fun m!1123409 () Bool)

(assert (=> b!1218645 m!1123409))

(declare-fun m!1123411 () Bool)

(assert (=> b!1218645 m!1123411))

(assert (=> b!1218645 m!1123407))

(declare-fun m!1123413 () Bool)

(assert (=> b!1218645 m!1123413))

(assert (=> b!1218646 m!1123407))

(assert (=> b!1218646 m!1123407))

(declare-fun m!1123415 () Bool)

(assert (=> b!1218646 m!1123415))

(assert (=> b!1218568 d!133641))

(declare-fun d!133643 () Bool)

(declare-fun res!809392 () Bool)

(declare-fun e!691897 () Bool)

(assert (=> d!133643 (=> res!809392 e!691897)))

(assert (=> d!133643 (= res!809392 (= (select (arr!37982 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133643 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691897)))

(declare-fun b!1218651 () Bool)

(declare-fun e!691898 () Bool)

(assert (=> b!1218651 (= e!691897 e!691898)))

(declare-fun res!809393 () Bool)

(assert (=> b!1218651 (=> (not res!809393) (not e!691898))))

(assert (=> b!1218651 (= res!809393 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38518 _keys!1208)))))

(declare-fun b!1218652 () Bool)

(assert (=> b!1218652 (= e!691898 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133643 (not res!809392)) b!1218651))

(assert (= (and b!1218651 res!809393) b!1218652))

(assert (=> d!133643 m!1123407))

(declare-fun m!1123417 () Bool)

(assert (=> b!1218652 m!1123417))

(assert (=> b!1218566 d!133643))

(declare-fun d!133645 () Bool)

(assert (=> d!133645 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554004 () Unit!40392)

(declare-fun choose!13 (array!78699 (_ BitVec 64) (_ BitVec 32)) Unit!40392)

(assert (=> d!133645 (= lt!554004 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133645 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133645 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554004)))

(declare-fun bs!34331 () Bool)

(assert (= bs!34331 d!133645))

(assert (=> bs!34331 m!1123331))

(declare-fun m!1123419 () Bool)

(assert (=> bs!34331 m!1123419))

(assert (=> b!1218566 d!133645))

(declare-fun d!133647 () Bool)

(declare-fun res!809394 () Bool)

(declare-fun e!691899 () Bool)

(assert (=> d!133647 (=> res!809394 e!691899)))

(assert (=> d!133647 (= res!809394 (= (select (arr!37982 _keys!1208) i!673) k0!934))))

(assert (=> d!133647 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!691899)))

(declare-fun b!1218653 () Bool)

(declare-fun e!691900 () Bool)

(assert (=> b!1218653 (= e!691899 e!691900)))

(declare-fun res!809395 () Bool)

(assert (=> b!1218653 (=> (not res!809395) (not e!691900))))

(assert (=> b!1218653 (= res!809395 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38518 _keys!1208)))))

(declare-fun b!1218654 () Bool)

(assert (=> b!1218654 (= e!691900 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133647 (not res!809394)) b!1218653))

(assert (= (and b!1218653 res!809395) b!1218654))

(assert (=> d!133647 m!1123329))

(declare-fun m!1123421 () Bool)

(assert (=> b!1218654 m!1123421))

(assert (=> b!1218575 d!133647))

(declare-fun lt!554024 () ListLongMap!17957)

(declare-fun e!691919 () Bool)

(declare-fun b!1218679 () Bool)

(assert (=> b!1218679 (= e!691919 (= lt!554024 (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218680 () Bool)

(declare-fun e!691920 () Bool)

(assert (=> b!1218680 (= e!691920 e!691919)))

(declare-fun c!120139 () Bool)

(assert (=> b!1218680 (= c!120139 (bvslt from!1455 (size!38518 lt!553958)))))

(declare-fun b!1218681 () Bool)

(declare-fun lt!554023 () Unit!40392)

(declare-fun lt!554022 () Unit!40392)

(assert (=> b!1218681 (= lt!554023 lt!554022)))

(declare-fun lt!554025 () V!46411)

(declare-fun lt!554020 () (_ BitVec 64))

(declare-fun lt!554021 () ListLongMap!17957)

(declare-fun lt!554019 () (_ BitVec 64))

(declare-fun contains!7011 (ListLongMap!17957 (_ BitVec 64)) Bool)

(assert (=> b!1218681 (not (contains!7011 (+!4063 lt!554021 (tuple2!19989 lt!554019 lt!554025)) lt!554020))))

(declare-fun addStillNotContains!300 (ListLongMap!17957 (_ BitVec 64) V!46411 (_ BitVec 64)) Unit!40392)

(assert (=> b!1218681 (= lt!554022 (addStillNotContains!300 lt!554021 lt!554019 lt!554025 lt!554020))))

(assert (=> b!1218681 (= lt!554020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218681 (= lt!554025 (get!19360 (select (arr!37983 lt!553956) from!1455) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218681 (= lt!554019 (select (arr!37982 lt!553958) from!1455))))

(declare-fun call!60652 () ListLongMap!17957)

(assert (=> b!1218681 (= lt!554021 call!60652)))

(declare-fun e!691921 () ListLongMap!17957)

(assert (=> b!1218681 (= e!691921 (+!4063 call!60652 (tuple2!19989 (select (arr!37982 lt!553958) from!1455) (get!19360 (select (arr!37983 lt!553956) from!1455) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60649 () Bool)

(assert (=> bm!60649 (= call!60652 (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218683 () Bool)

(declare-fun isEmpty!996 (ListLongMap!17957) Bool)

(assert (=> b!1218683 (= e!691919 (isEmpty!996 lt!554024))))

(declare-fun b!1218684 () Bool)

(assert (=> b!1218684 (= e!691921 call!60652)))

(declare-fun b!1218685 () Bool)

(assert (=> b!1218685 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38518 lt!553958)))))

(assert (=> b!1218685 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38519 lt!553956)))))

(declare-fun e!691918 () Bool)

(declare-fun apply!972 (ListLongMap!17957 (_ BitVec 64)) V!46411)

(assert (=> b!1218685 (= e!691918 (= (apply!972 lt!554024 (select (arr!37982 lt!553958) from!1455)) (get!19360 (select (arr!37983 lt!553956) from!1455) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218686 () Bool)

(declare-fun res!809405 () Bool)

(declare-fun e!691916 () Bool)

(assert (=> b!1218686 (=> (not res!809405) (not e!691916))))

(assert (=> b!1218686 (= res!809405 (not (contains!7011 lt!554024 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218687 () Bool)

(declare-fun e!691917 () ListLongMap!17957)

(assert (=> b!1218687 (= e!691917 e!691921)))

(declare-fun c!120138 () Bool)

(assert (=> b!1218687 (= c!120138 (validKeyInArray!0 (select (arr!37982 lt!553958) from!1455)))))

(declare-fun b!1218688 () Bool)

(assert (=> b!1218688 (= e!691916 e!691920)))

(declare-fun c!120136 () Bool)

(declare-fun e!691915 () Bool)

(assert (=> b!1218688 (= c!120136 e!691915)))

(declare-fun res!809406 () Bool)

(assert (=> b!1218688 (=> (not res!809406) (not e!691915))))

(assert (=> b!1218688 (= res!809406 (bvslt from!1455 (size!38518 lt!553958)))))

(declare-fun b!1218689 () Bool)

(assert (=> b!1218689 (= e!691917 (ListLongMap!17958 Nil!26788))))

(declare-fun b!1218690 () Bool)

(assert (=> b!1218690 (= e!691920 e!691918)))

(assert (=> b!1218690 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38518 lt!553958)))))

(declare-fun res!809407 () Bool)

(assert (=> b!1218690 (= res!809407 (contains!7011 lt!554024 (select (arr!37982 lt!553958) from!1455)))))

(assert (=> b!1218690 (=> (not res!809407) (not e!691918))))

(declare-fun d!133649 () Bool)

(assert (=> d!133649 e!691916))

(declare-fun res!809404 () Bool)

(assert (=> d!133649 (=> (not res!809404) (not e!691916))))

(assert (=> d!133649 (= res!809404 (not (contains!7011 lt!554024 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133649 (= lt!554024 e!691917)))

(declare-fun c!120137 () Bool)

(assert (=> d!133649 (= c!120137 (bvsge from!1455 (size!38518 lt!553958)))))

(assert (=> d!133649 (validMask!0 mask!1564)))

(assert (=> d!133649 (= (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554024)))

(declare-fun b!1218682 () Bool)

(assert (=> b!1218682 (= e!691915 (validKeyInArray!0 (select (arr!37982 lt!553958) from!1455)))))

(assert (=> b!1218682 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!133649 c!120137) b!1218689))

(assert (= (and d!133649 (not c!120137)) b!1218687))

(assert (= (and b!1218687 c!120138) b!1218681))

(assert (= (and b!1218687 (not c!120138)) b!1218684))

(assert (= (or b!1218681 b!1218684) bm!60649))

(assert (= (and d!133649 res!809404) b!1218686))

(assert (= (and b!1218686 res!809405) b!1218688))

(assert (= (and b!1218688 res!809406) b!1218682))

(assert (= (and b!1218688 c!120136) b!1218690))

(assert (= (and b!1218688 (not c!120136)) b!1218680))

(assert (= (and b!1218690 res!809407) b!1218685))

(assert (= (and b!1218680 c!120139) b!1218679))

(assert (= (and b!1218680 (not c!120139)) b!1218683))

(declare-fun b_lambda!22017 () Bool)

(assert (=> (not b_lambda!22017) (not b!1218681)))

(assert (=> b!1218681 t!40028))

(declare-fun b_and!43679 () Bool)

(assert (= b_and!43673 (and (=> t!40028 result!22719) b_and!43679)))

(declare-fun b_lambda!22019 () Bool)

(assert (=> (not b_lambda!22019) (not b!1218685)))

(assert (=> b!1218685 t!40028))

(declare-fun b_and!43681 () Bool)

(assert (= b_and!43679 (and (=> t!40028 result!22719) b_and!43681)))

(declare-fun m!1123423 () Bool)

(assert (=> b!1218682 m!1123423))

(assert (=> b!1218682 m!1123423))

(declare-fun m!1123425 () Bool)

(assert (=> b!1218682 m!1123425))

(assert (=> b!1218681 m!1123319))

(declare-fun m!1123427 () Bool)

(assert (=> b!1218681 m!1123427))

(declare-fun m!1123429 () Bool)

(assert (=> b!1218681 m!1123429))

(declare-fun m!1123431 () Bool)

(assert (=> b!1218681 m!1123431))

(declare-fun m!1123433 () Bool)

(assert (=> b!1218681 m!1123433))

(assert (=> b!1218681 m!1123423))

(assert (=> b!1218681 m!1123433))

(declare-fun m!1123435 () Bool)

(assert (=> b!1218681 m!1123435))

(assert (=> b!1218681 m!1123427))

(assert (=> b!1218681 m!1123319))

(declare-fun m!1123437 () Bool)

(assert (=> b!1218681 m!1123437))

(declare-fun m!1123439 () Bool)

(assert (=> bm!60649 m!1123439))

(assert (=> b!1218687 m!1123423))

(assert (=> b!1218687 m!1123423))

(assert (=> b!1218687 m!1123425))

(declare-fun m!1123441 () Bool)

(assert (=> d!133649 m!1123441))

(assert (=> d!133649 m!1123327))

(assert (=> b!1218679 m!1123439))

(assert (=> b!1218690 m!1123423))

(assert (=> b!1218690 m!1123423))

(declare-fun m!1123443 () Bool)

(assert (=> b!1218690 m!1123443))

(declare-fun m!1123445 () Bool)

(assert (=> b!1218683 m!1123445))

(declare-fun m!1123447 () Bool)

(assert (=> b!1218686 m!1123447))

(assert (=> b!1218685 m!1123319))

(assert (=> b!1218685 m!1123427))

(assert (=> b!1218685 m!1123319))

(assert (=> b!1218685 m!1123437))

(assert (=> b!1218685 m!1123427))

(assert (=> b!1218685 m!1123423))

(declare-fun m!1123449 () Bool)

(assert (=> b!1218685 m!1123449))

(assert (=> b!1218685 m!1123423))

(assert (=> b!1218565 d!133649))

(declare-fun b!1218691 () Bool)

(declare-fun e!691926 () Bool)

(declare-fun lt!554031 () ListLongMap!17957)

(assert (=> b!1218691 (= e!691926 (= lt!554031 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218692 () Bool)

(declare-fun e!691927 () Bool)

(assert (=> b!1218692 (= e!691927 e!691926)))

(declare-fun c!120143 () Bool)

(assert (=> b!1218692 (= c!120143 (bvslt from!1455 (size!38518 _keys!1208)))))

(declare-fun b!1218693 () Bool)

(declare-fun lt!554030 () Unit!40392)

(declare-fun lt!554029 () Unit!40392)

(assert (=> b!1218693 (= lt!554030 lt!554029)))

(declare-fun lt!554028 () ListLongMap!17957)

(declare-fun lt!554026 () (_ BitVec 64))

(declare-fun lt!554032 () V!46411)

(declare-fun lt!554027 () (_ BitVec 64))

(assert (=> b!1218693 (not (contains!7011 (+!4063 lt!554028 (tuple2!19989 lt!554026 lt!554032)) lt!554027))))

(assert (=> b!1218693 (= lt!554029 (addStillNotContains!300 lt!554028 lt!554026 lt!554032 lt!554027))))

(assert (=> b!1218693 (= lt!554027 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218693 (= lt!554032 (get!19360 (select (arr!37983 _values!996) from!1455) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218693 (= lt!554026 (select (arr!37982 _keys!1208) from!1455))))

(declare-fun call!60653 () ListLongMap!17957)

(assert (=> b!1218693 (= lt!554028 call!60653)))

(declare-fun e!691928 () ListLongMap!17957)

(assert (=> b!1218693 (= e!691928 (+!4063 call!60653 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60650 () Bool)

(assert (=> bm!60650 (= call!60653 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218695 () Bool)

(assert (=> b!1218695 (= e!691926 (isEmpty!996 lt!554031))))

(declare-fun b!1218696 () Bool)

(assert (=> b!1218696 (= e!691928 call!60653)))

(declare-fun b!1218697 () Bool)

(assert (=> b!1218697 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38518 _keys!1208)))))

(assert (=> b!1218697 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38519 _values!996)))))

(declare-fun e!691925 () Bool)

(assert (=> b!1218697 (= e!691925 (= (apply!972 lt!554031 (select (arr!37982 _keys!1208) from!1455)) (get!19360 (select (arr!37983 _values!996) from!1455) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218698 () Bool)

(declare-fun res!809409 () Bool)

(declare-fun e!691923 () Bool)

(assert (=> b!1218698 (=> (not res!809409) (not e!691923))))

(assert (=> b!1218698 (= res!809409 (not (contains!7011 lt!554031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218699 () Bool)

(declare-fun e!691924 () ListLongMap!17957)

(assert (=> b!1218699 (= e!691924 e!691928)))

(declare-fun c!120142 () Bool)

(assert (=> b!1218699 (= c!120142 (validKeyInArray!0 (select (arr!37982 _keys!1208) from!1455)))))

(declare-fun b!1218700 () Bool)

(assert (=> b!1218700 (= e!691923 e!691927)))

(declare-fun c!120140 () Bool)

(declare-fun e!691922 () Bool)

(assert (=> b!1218700 (= c!120140 e!691922)))

(declare-fun res!809410 () Bool)

(assert (=> b!1218700 (=> (not res!809410) (not e!691922))))

(assert (=> b!1218700 (= res!809410 (bvslt from!1455 (size!38518 _keys!1208)))))

(declare-fun b!1218701 () Bool)

(assert (=> b!1218701 (= e!691924 (ListLongMap!17958 Nil!26788))))

(declare-fun b!1218702 () Bool)

(assert (=> b!1218702 (= e!691927 e!691925)))

(assert (=> b!1218702 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38518 _keys!1208)))))

(declare-fun res!809411 () Bool)

(assert (=> b!1218702 (= res!809411 (contains!7011 lt!554031 (select (arr!37982 _keys!1208) from!1455)))))

(assert (=> b!1218702 (=> (not res!809411) (not e!691925))))

(declare-fun d!133651 () Bool)

(assert (=> d!133651 e!691923))

(declare-fun res!809408 () Bool)

(assert (=> d!133651 (=> (not res!809408) (not e!691923))))

(assert (=> d!133651 (= res!809408 (not (contains!7011 lt!554031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133651 (= lt!554031 e!691924)))

(declare-fun c!120141 () Bool)

(assert (=> d!133651 (= c!120141 (bvsge from!1455 (size!38518 _keys!1208)))))

(assert (=> d!133651 (validMask!0 mask!1564)))

(assert (=> d!133651 (= (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554031)))

(declare-fun b!1218694 () Bool)

(assert (=> b!1218694 (= e!691922 (validKeyInArray!0 (select (arr!37982 _keys!1208) from!1455)))))

(assert (=> b!1218694 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!133651 c!120141) b!1218701))

(assert (= (and d!133651 (not c!120141)) b!1218699))

(assert (= (and b!1218699 c!120142) b!1218693))

(assert (= (and b!1218699 (not c!120142)) b!1218696))

(assert (= (or b!1218693 b!1218696) bm!60650))

(assert (= (and d!133651 res!809408) b!1218698))

(assert (= (and b!1218698 res!809409) b!1218700))

(assert (= (and b!1218700 res!809410) b!1218694))

(assert (= (and b!1218700 c!120140) b!1218702))

(assert (= (and b!1218700 (not c!120140)) b!1218692))

(assert (= (and b!1218702 res!809411) b!1218697))

(assert (= (and b!1218692 c!120143) b!1218691))

(assert (= (and b!1218692 (not c!120143)) b!1218695))

(declare-fun b_lambda!22021 () Bool)

(assert (=> (not b_lambda!22021) (not b!1218693)))

(assert (=> b!1218693 t!40028))

(declare-fun b_and!43683 () Bool)

(assert (= b_and!43681 (and (=> t!40028 result!22719) b_and!43683)))

(declare-fun b_lambda!22023 () Bool)

(assert (=> (not b_lambda!22023) (not b!1218697)))

(assert (=> b!1218697 t!40028))

(declare-fun b_and!43685 () Bool)

(assert (= b_and!43683 (and (=> t!40028 result!22719) b_and!43685)))

(assert (=> b!1218694 m!1123297))

(assert (=> b!1218694 m!1123297))

(assert (=> b!1218694 m!1123345))

(assert (=> b!1218693 m!1123319))

(assert (=> b!1218693 m!1123309))

(declare-fun m!1123451 () Bool)

(assert (=> b!1218693 m!1123451))

(declare-fun m!1123453 () Bool)

(assert (=> b!1218693 m!1123453))

(declare-fun m!1123455 () Bool)

(assert (=> b!1218693 m!1123455))

(assert (=> b!1218693 m!1123297))

(assert (=> b!1218693 m!1123455))

(declare-fun m!1123457 () Bool)

(assert (=> b!1218693 m!1123457))

(assert (=> b!1218693 m!1123309))

(assert (=> b!1218693 m!1123319))

(declare-fun m!1123459 () Bool)

(assert (=> b!1218693 m!1123459))

(declare-fun m!1123461 () Bool)

(assert (=> bm!60650 m!1123461))

(assert (=> b!1218699 m!1123297))

(assert (=> b!1218699 m!1123297))

(assert (=> b!1218699 m!1123345))

(declare-fun m!1123463 () Bool)

(assert (=> d!133651 m!1123463))

(assert (=> d!133651 m!1123327))

(assert (=> b!1218691 m!1123461))

(assert (=> b!1218702 m!1123297))

(assert (=> b!1218702 m!1123297))

(declare-fun m!1123465 () Bool)

(assert (=> b!1218702 m!1123465))

(declare-fun m!1123467 () Bool)

(assert (=> b!1218695 m!1123467))

(declare-fun m!1123469 () Bool)

(assert (=> b!1218698 m!1123469))

(assert (=> b!1218697 m!1123319))

(assert (=> b!1218697 m!1123309))

(assert (=> b!1218697 m!1123319))

(assert (=> b!1218697 m!1123459))

(assert (=> b!1218697 m!1123309))

(assert (=> b!1218697 m!1123297))

(declare-fun m!1123471 () Bool)

(assert (=> b!1218697 m!1123471))

(assert (=> b!1218697 m!1123297))

(assert (=> b!1218565 d!133651))

(declare-fun b!1218714 () Bool)

(declare-fun e!691938 () Bool)

(declare-fun e!691937 () Bool)

(assert (=> b!1218714 (= e!691938 e!691937)))

(declare-fun res!809418 () Bool)

(assert (=> b!1218714 (=> (not res!809418) (not e!691937))))

(declare-fun e!691940 () Bool)

(assert (=> b!1218714 (= res!809418 (not e!691940))))

(declare-fun res!809420 () Bool)

(assert (=> b!1218714 (=> (not res!809420) (not e!691940))))

(assert (=> b!1218714 (= res!809420 (validKeyInArray!0 (select (arr!37982 lt!553958) #b00000000000000000000000000000000)))))

(declare-fun b!1218715 () Bool)

(declare-fun e!691939 () Bool)

(declare-fun call!60656 () Bool)

(assert (=> b!1218715 (= e!691939 call!60656)))

(declare-fun bm!60653 () Bool)

(declare-fun c!120146 () Bool)

(assert (=> bm!60653 (= call!60656 (arrayNoDuplicates!0 lt!553958 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120146 (Cons!26786 (select (arr!37982 lt!553958) #b00000000000000000000000000000000) Nil!26787) Nil!26787)))))

(declare-fun b!1218716 () Bool)

(assert (=> b!1218716 (= e!691937 e!691939)))

(assert (=> b!1218716 (= c!120146 (validKeyInArray!0 (select (arr!37982 lt!553958) #b00000000000000000000000000000000)))))

(declare-fun b!1218717 () Bool)

(declare-fun contains!7012 (List!26790 (_ BitVec 64)) Bool)

(assert (=> b!1218717 (= e!691940 (contains!7012 Nil!26787 (select (arr!37982 lt!553958) #b00000000000000000000000000000000)))))

(declare-fun d!133653 () Bool)

(declare-fun res!809419 () Bool)

(assert (=> d!133653 (=> res!809419 e!691938)))

(assert (=> d!133653 (= res!809419 (bvsge #b00000000000000000000000000000000 (size!38518 lt!553958)))))

(assert (=> d!133653 (= (arrayNoDuplicates!0 lt!553958 #b00000000000000000000000000000000 Nil!26787) e!691938)))

(declare-fun b!1218713 () Bool)

(assert (=> b!1218713 (= e!691939 call!60656)))

(assert (= (and d!133653 (not res!809419)) b!1218714))

(assert (= (and b!1218714 res!809420) b!1218717))

(assert (= (and b!1218714 res!809418) b!1218716))

(assert (= (and b!1218716 c!120146) b!1218713))

(assert (= (and b!1218716 (not c!120146)) b!1218715))

(assert (= (or b!1218713 b!1218715) bm!60653))

(declare-fun m!1123473 () Bool)

(assert (=> b!1218714 m!1123473))

(assert (=> b!1218714 m!1123473))

(declare-fun m!1123475 () Bool)

(assert (=> b!1218714 m!1123475))

(assert (=> bm!60653 m!1123473))

(declare-fun m!1123477 () Bool)

(assert (=> bm!60653 m!1123477))

(assert (=> b!1218716 m!1123473))

(assert (=> b!1218716 m!1123473))

(assert (=> b!1218716 m!1123475))

(assert (=> b!1218717 m!1123473))

(assert (=> b!1218717 m!1123473))

(declare-fun m!1123479 () Bool)

(assert (=> b!1218717 m!1123479))

(assert (=> b!1218574 d!133653))

(declare-fun d!133655 () Bool)

(assert (=> d!133655 (= (array_inv!28906 _keys!1208) (bvsge (size!38518 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101388 d!133655))

(declare-fun d!133657 () Bool)

(assert (=> d!133657 (= (array_inv!28907 _values!996) (bvsge (size!38519 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101388 d!133657))

(declare-fun d!133659 () Bool)

(assert (=> d!133659 (= (validKeyInArray!0 (select (arr!37982 _keys!1208) from!1455)) (and (not (= (select (arr!37982 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37982 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218564 d!133659))

(declare-fun b!1218718 () Bool)

(declare-fun lt!554038 () ListLongMap!17957)

(declare-fun e!691945 () Bool)

(assert (=> b!1218718 (= e!691945 (= lt!554038 (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218719 () Bool)

(declare-fun e!691946 () Bool)

(assert (=> b!1218719 (= e!691946 e!691945)))

(declare-fun c!120150 () Bool)

(assert (=> b!1218719 (= c!120150 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 lt!553958)))))

(declare-fun b!1218720 () Bool)

(declare-fun lt!554037 () Unit!40392)

(declare-fun lt!554036 () Unit!40392)

(assert (=> b!1218720 (= lt!554037 lt!554036)))

(declare-fun lt!554035 () ListLongMap!17957)

(declare-fun lt!554033 () (_ BitVec 64))

(declare-fun lt!554034 () (_ BitVec 64))

(declare-fun lt!554039 () V!46411)

(assert (=> b!1218720 (not (contains!7011 (+!4063 lt!554035 (tuple2!19989 lt!554033 lt!554039)) lt!554034))))

(assert (=> b!1218720 (= lt!554036 (addStillNotContains!300 lt!554035 lt!554033 lt!554039 lt!554034))))

(assert (=> b!1218720 (= lt!554034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218720 (= lt!554039 (get!19360 (select (arr!37983 lt!553956) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218720 (= lt!554033 (select (arr!37982 lt!553958) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60657 () ListLongMap!17957)

(assert (=> b!1218720 (= lt!554035 call!60657)))

(declare-fun e!691947 () ListLongMap!17957)

(assert (=> b!1218720 (= e!691947 (+!4063 call!60657 (tuple2!19989 (select (arr!37982 lt!553958) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19360 (select (arr!37983 lt!553956) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60654 () Bool)

(assert (=> bm!60654 (= call!60657 (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218722 () Bool)

(assert (=> b!1218722 (= e!691945 (isEmpty!996 lt!554038))))

(declare-fun b!1218723 () Bool)

(assert (=> b!1218723 (= e!691947 call!60657)))

(declare-fun b!1218724 () Bool)

(assert (=> b!1218724 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 lt!553958)))))

(assert (=> b!1218724 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38519 lt!553956)))))

(declare-fun e!691944 () Bool)

(assert (=> b!1218724 (= e!691944 (= (apply!972 lt!554038 (select (arr!37982 lt!553958) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19360 (select (arr!37983 lt!553956) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218725 () Bool)

(declare-fun res!809422 () Bool)

(declare-fun e!691942 () Bool)

(assert (=> b!1218725 (=> (not res!809422) (not e!691942))))

(assert (=> b!1218725 (= res!809422 (not (contains!7011 lt!554038 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218726 () Bool)

(declare-fun e!691943 () ListLongMap!17957)

(assert (=> b!1218726 (= e!691943 e!691947)))

(declare-fun c!120149 () Bool)

(assert (=> b!1218726 (= c!120149 (validKeyInArray!0 (select (arr!37982 lt!553958) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1218727 () Bool)

(assert (=> b!1218727 (= e!691942 e!691946)))

(declare-fun c!120147 () Bool)

(declare-fun e!691941 () Bool)

(assert (=> b!1218727 (= c!120147 e!691941)))

(declare-fun res!809423 () Bool)

(assert (=> b!1218727 (=> (not res!809423) (not e!691941))))

(assert (=> b!1218727 (= res!809423 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 lt!553958)))))

(declare-fun b!1218728 () Bool)

(assert (=> b!1218728 (= e!691943 (ListLongMap!17958 Nil!26788))))

(declare-fun b!1218729 () Bool)

(assert (=> b!1218729 (= e!691946 e!691944)))

(assert (=> b!1218729 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 lt!553958)))))

(declare-fun res!809424 () Bool)

(assert (=> b!1218729 (= res!809424 (contains!7011 lt!554038 (select (arr!37982 lt!553958) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218729 (=> (not res!809424) (not e!691944))))

(declare-fun d!133661 () Bool)

(assert (=> d!133661 e!691942))

(declare-fun res!809421 () Bool)

(assert (=> d!133661 (=> (not res!809421) (not e!691942))))

(assert (=> d!133661 (= res!809421 (not (contains!7011 lt!554038 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133661 (= lt!554038 e!691943)))

(declare-fun c!120148 () Bool)

(assert (=> d!133661 (= c!120148 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 lt!553958)))))

(assert (=> d!133661 (validMask!0 mask!1564)))

(assert (=> d!133661 (= (getCurrentListMapNoExtraKeys!5420 lt!553958 lt!553956 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554038)))

(declare-fun b!1218721 () Bool)

(assert (=> b!1218721 (= e!691941 (validKeyInArray!0 (select (arr!37982 lt!553958) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218721 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!133661 c!120148) b!1218728))

(assert (= (and d!133661 (not c!120148)) b!1218726))

(assert (= (and b!1218726 c!120149) b!1218720))

(assert (= (and b!1218726 (not c!120149)) b!1218723))

(assert (= (or b!1218720 b!1218723) bm!60654))

(assert (= (and d!133661 res!809421) b!1218725))

(assert (= (and b!1218725 res!809422) b!1218727))

(assert (= (and b!1218727 res!809423) b!1218721))

(assert (= (and b!1218727 c!120147) b!1218729))

(assert (= (and b!1218727 (not c!120147)) b!1218719))

(assert (= (and b!1218729 res!809424) b!1218724))

(assert (= (and b!1218719 c!120150) b!1218718))

(assert (= (and b!1218719 (not c!120150)) b!1218722))

(declare-fun b_lambda!22025 () Bool)

(assert (=> (not b_lambda!22025) (not b!1218720)))

(assert (=> b!1218720 t!40028))

(declare-fun b_and!43687 () Bool)

(assert (= b_and!43685 (and (=> t!40028 result!22719) b_and!43687)))

(declare-fun b_lambda!22027 () Bool)

(assert (=> (not b_lambda!22027) (not b!1218724)))

(assert (=> b!1218724 t!40028))

(declare-fun b_and!43689 () Bool)

(assert (= b_and!43687 (and (=> t!40028 result!22719) b_and!43689)))

(declare-fun m!1123481 () Bool)

(assert (=> b!1218721 m!1123481))

(assert (=> b!1218721 m!1123481))

(declare-fun m!1123483 () Bool)

(assert (=> b!1218721 m!1123483))

(assert (=> b!1218720 m!1123319))

(declare-fun m!1123485 () Bool)

(assert (=> b!1218720 m!1123485))

(declare-fun m!1123487 () Bool)

(assert (=> b!1218720 m!1123487))

(declare-fun m!1123489 () Bool)

(assert (=> b!1218720 m!1123489))

(declare-fun m!1123491 () Bool)

(assert (=> b!1218720 m!1123491))

(assert (=> b!1218720 m!1123481))

(assert (=> b!1218720 m!1123491))

(declare-fun m!1123493 () Bool)

(assert (=> b!1218720 m!1123493))

(assert (=> b!1218720 m!1123485))

(assert (=> b!1218720 m!1123319))

(declare-fun m!1123495 () Bool)

(assert (=> b!1218720 m!1123495))

(declare-fun m!1123497 () Bool)

(assert (=> bm!60654 m!1123497))

(assert (=> b!1218726 m!1123481))

(assert (=> b!1218726 m!1123481))

(assert (=> b!1218726 m!1123483))

(declare-fun m!1123499 () Bool)

(assert (=> d!133661 m!1123499))

(assert (=> d!133661 m!1123327))

(assert (=> b!1218718 m!1123497))

(assert (=> b!1218729 m!1123481))

(assert (=> b!1218729 m!1123481))

(declare-fun m!1123501 () Bool)

(assert (=> b!1218729 m!1123501))

(declare-fun m!1123503 () Bool)

(assert (=> b!1218722 m!1123503))

(declare-fun m!1123505 () Bool)

(assert (=> b!1218725 m!1123505))

(assert (=> b!1218724 m!1123319))

(assert (=> b!1218724 m!1123485))

(assert (=> b!1218724 m!1123319))

(assert (=> b!1218724 m!1123495))

(assert (=> b!1218724 m!1123485))

(assert (=> b!1218724 m!1123481))

(declare-fun m!1123507 () Bool)

(assert (=> b!1218724 m!1123507))

(assert (=> b!1218724 m!1123481))

(assert (=> b!1218564 d!133661))

(declare-fun call!60662 () ListLongMap!17957)

(declare-fun bm!60659 () Bool)

(assert (=> bm!60659 (= call!60662 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60663 () ListLongMap!17957)

(declare-fun bm!60660 () Bool)

(assert (=> bm!60660 (= call!60663 (getCurrentListMapNoExtraKeys!5420 (array!78700 (store (arr!37982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38518 _keys!1208)) (array!78702 (store (arr!37983 _values!996) i!673 (ValueCellFull!14772 (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38519 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218736 () Bool)

(declare-fun e!691953 () Bool)

(declare-fun e!691952 () Bool)

(assert (=> b!1218736 (= e!691953 e!691952)))

(declare-fun c!120153 () Bool)

(assert (=> b!1218736 (= c!120153 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133663 () Bool)

(assert (=> d!133663 e!691953))

(declare-fun res!809427 () Bool)

(assert (=> d!133663 (=> (not res!809427) (not e!691953))))

(assert (=> d!133663 (= res!809427 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38518 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38518 _keys!1208))))))))

(declare-fun lt!554042 () Unit!40392)

(declare-fun choose!1823 (array!78699 array!78701 (_ BitVec 32) (_ BitVec 32) V!46411 V!46411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40392)

(assert (=> d!133663 (= lt!554042 (choose!1823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133663 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 _keys!1208)))))

(assert (=> d!133663 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1115 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554042)))

(declare-fun b!1218737 () Bool)

(assert (=> b!1218737 (= e!691952 (= call!60663 (-!1908 call!60662 k0!934)))))

(assert (=> b!1218737 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38519 _values!996)))))

(declare-fun b!1218738 () Bool)

(assert (=> b!1218738 (= e!691952 (= call!60663 call!60662))))

(assert (=> b!1218738 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38519 _values!996)))))

(assert (= (and d!133663 res!809427) b!1218736))

(assert (= (and b!1218736 c!120153) b!1218737))

(assert (= (and b!1218736 (not c!120153)) b!1218738))

(assert (= (or b!1218737 b!1218738) bm!60659))

(assert (= (or b!1218737 b!1218738) bm!60660))

(declare-fun b_lambda!22029 () Bool)

(assert (=> (not b_lambda!22029) (not bm!60660)))

(assert (=> bm!60660 t!40028))

(declare-fun b_and!43691 () Bool)

(assert (= b_and!43689 (and (=> t!40028 result!22719) b_and!43691)))

(assert (=> bm!60659 m!1123341))

(assert (=> bm!60660 m!1123325))

(assert (=> bm!60660 m!1123319))

(declare-fun m!1123509 () Bool)

(assert (=> bm!60660 m!1123509))

(declare-fun m!1123511 () Bool)

(assert (=> bm!60660 m!1123511))

(declare-fun m!1123513 () Bool)

(assert (=> d!133663 m!1123513))

(declare-fun m!1123515 () Bool)

(assert (=> b!1218737 m!1123515))

(assert (=> b!1218564 d!133663))

(declare-fun d!133665 () Bool)

(declare-fun lt!554045 () ListLongMap!17957)

(assert (=> d!133665 (not (contains!7011 lt!554045 k0!934))))

(declare-fun removeStrictlySorted!105 (List!26791 (_ BitVec 64)) List!26791)

(assert (=> d!133665 (= lt!554045 (ListLongMap!17958 (removeStrictlySorted!105 (toList!8994 lt!553960) k0!934)))))

(assert (=> d!133665 (= (-!1908 lt!553960 k0!934) lt!554045)))

(declare-fun bs!34332 () Bool)

(assert (= bs!34332 d!133665))

(declare-fun m!1123517 () Bool)

(assert (=> bs!34332 m!1123517))

(declare-fun m!1123519 () Bool)

(assert (=> bs!34332 m!1123519))

(assert (=> b!1218564 d!133665))

(declare-fun b!1218739 () Bool)

(declare-fun lt!554051 () ListLongMap!17957)

(declare-fun e!691958 () Bool)

(assert (=> b!1218739 (= e!691958 (= lt!554051 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218740 () Bool)

(declare-fun e!691959 () Bool)

(assert (=> b!1218740 (= e!691959 e!691958)))

(declare-fun c!120157 () Bool)

(assert (=> b!1218740 (= c!120157 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 _keys!1208)))))

(declare-fun b!1218741 () Bool)

(declare-fun lt!554050 () Unit!40392)

(declare-fun lt!554049 () Unit!40392)

(assert (=> b!1218741 (= lt!554050 lt!554049)))

(declare-fun lt!554047 () (_ BitVec 64))

(declare-fun lt!554046 () (_ BitVec 64))

(declare-fun lt!554048 () ListLongMap!17957)

(declare-fun lt!554052 () V!46411)

(assert (=> b!1218741 (not (contains!7011 (+!4063 lt!554048 (tuple2!19989 lt!554046 lt!554052)) lt!554047))))

(assert (=> b!1218741 (= lt!554049 (addStillNotContains!300 lt!554048 lt!554046 lt!554052 lt!554047))))

(assert (=> b!1218741 (= lt!554047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218741 (= lt!554052 (get!19360 (select (arr!37983 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218741 (= lt!554046 (select (arr!37982 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60664 () ListLongMap!17957)

(assert (=> b!1218741 (= lt!554048 call!60664)))

(declare-fun e!691960 () ListLongMap!17957)

(assert (=> b!1218741 (= e!691960 (+!4063 call!60664 (tuple2!19989 (select (arr!37982 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19360 (select (arr!37983 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60661 () Bool)

(assert (=> bm!60661 (= call!60664 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218743 () Bool)

(assert (=> b!1218743 (= e!691958 (isEmpty!996 lt!554051))))

(declare-fun b!1218744 () Bool)

(assert (=> b!1218744 (= e!691960 call!60664)))

(declare-fun b!1218745 () Bool)

(assert (=> b!1218745 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 _keys!1208)))))

(assert (=> b!1218745 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38519 _values!996)))))

(declare-fun e!691957 () Bool)

(assert (=> b!1218745 (= e!691957 (= (apply!972 lt!554051 (select (arr!37982 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19360 (select (arr!37983 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218746 () Bool)

(declare-fun res!809429 () Bool)

(declare-fun e!691955 () Bool)

(assert (=> b!1218746 (=> (not res!809429) (not e!691955))))

(assert (=> b!1218746 (= res!809429 (not (contains!7011 lt!554051 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218747 () Bool)

(declare-fun e!691956 () ListLongMap!17957)

(assert (=> b!1218747 (= e!691956 e!691960)))

(declare-fun c!120156 () Bool)

(assert (=> b!1218747 (= c!120156 (validKeyInArray!0 (select (arr!37982 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1218748 () Bool)

(assert (=> b!1218748 (= e!691955 e!691959)))

(declare-fun c!120154 () Bool)

(declare-fun e!691954 () Bool)

(assert (=> b!1218748 (= c!120154 e!691954)))

(declare-fun res!809430 () Bool)

(assert (=> b!1218748 (=> (not res!809430) (not e!691954))))

(assert (=> b!1218748 (= res!809430 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 _keys!1208)))))

(declare-fun b!1218749 () Bool)

(assert (=> b!1218749 (= e!691956 (ListLongMap!17958 Nil!26788))))

(declare-fun b!1218750 () Bool)

(assert (=> b!1218750 (= e!691959 e!691957)))

(assert (=> b!1218750 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 _keys!1208)))))

(declare-fun res!809431 () Bool)

(assert (=> b!1218750 (= res!809431 (contains!7011 lt!554051 (select (arr!37982 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218750 (=> (not res!809431) (not e!691957))))

(declare-fun d!133667 () Bool)

(assert (=> d!133667 e!691955))

(declare-fun res!809428 () Bool)

(assert (=> d!133667 (=> (not res!809428) (not e!691955))))

(assert (=> d!133667 (= res!809428 (not (contains!7011 lt!554051 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133667 (= lt!554051 e!691956)))

(declare-fun c!120155 () Bool)

(assert (=> d!133667 (= c!120155 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38518 _keys!1208)))))

(assert (=> d!133667 (validMask!0 mask!1564)))

(assert (=> d!133667 (= (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554051)))

(declare-fun b!1218742 () Bool)

(assert (=> b!1218742 (= e!691954 (validKeyInArray!0 (select (arr!37982 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218742 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!133667 c!120155) b!1218749))

(assert (= (and d!133667 (not c!120155)) b!1218747))

(assert (= (and b!1218747 c!120156) b!1218741))

(assert (= (and b!1218747 (not c!120156)) b!1218744))

(assert (= (or b!1218741 b!1218744) bm!60661))

(assert (= (and d!133667 res!809428) b!1218746))

(assert (= (and b!1218746 res!809429) b!1218748))

(assert (= (and b!1218748 res!809430) b!1218742))

(assert (= (and b!1218748 c!120154) b!1218750))

(assert (= (and b!1218748 (not c!120154)) b!1218740))

(assert (= (and b!1218750 res!809431) b!1218745))

(assert (= (and b!1218740 c!120157) b!1218739))

(assert (= (and b!1218740 (not c!120157)) b!1218743))

(declare-fun b_lambda!22031 () Bool)

(assert (=> (not b_lambda!22031) (not b!1218741)))

(assert (=> b!1218741 t!40028))

(declare-fun b_and!43693 () Bool)

(assert (= b_and!43691 (and (=> t!40028 result!22719) b_and!43693)))

(declare-fun b_lambda!22033 () Bool)

(assert (=> (not b_lambda!22033) (not b!1218745)))

(assert (=> b!1218745 t!40028))

(declare-fun b_and!43695 () Bool)

(assert (= b_and!43693 (and (=> t!40028 result!22719) b_and!43695)))

(declare-fun m!1123521 () Bool)

(assert (=> b!1218742 m!1123521))

(assert (=> b!1218742 m!1123521))

(declare-fun m!1123523 () Bool)

(assert (=> b!1218742 m!1123523))

(assert (=> b!1218741 m!1123319))

(declare-fun m!1123525 () Bool)

(assert (=> b!1218741 m!1123525))

(declare-fun m!1123527 () Bool)

(assert (=> b!1218741 m!1123527))

(declare-fun m!1123529 () Bool)

(assert (=> b!1218741 m!1123529))

(declare-fun m!1123531 () Bool)

(assert (=> b!1218741 m!1123531))

(assert (=> b!1218741 m!1123521))

(assert (=> b!1218741 m!1123531))

(declare-fun m!1123533 () Bool)

(assert (=> b!1218741 m!1123533))

(assert (=> b!1218741 m!1123525))

(assert (=> b!1218741 m!1123319))

(declare-fun m!1123535 () Bool)

(assert (=> b!1218741 m!1123535))

(declare-fun m!1123537 () Bool)

(assert (=> bm!60661 m!1123537))

(assert (=> b!1218747 m!1123521))

(assert (=> b!1218747 m!1123521))

(assert (=> b!1218747 m!1123523))

(declare-fun m!1123539 () Bool)

(assert (=> d!133667 m!1123539))

(assert (=> d!133667 m!1123327))

(assert (=> b!1218739 m!1123537))

(assert (=> b!1218750 m!1123521))

(assert (=> b!1218750 m!1123521))

(declare-fun m!1123541 () Bool)

(assert (=> b!1218750 m!1123541))

(declare-fun m!1123543 () Bool)

(assert (=> b!1218743 m!1123543))

(declare-fun m!1123545 () Bool)

(assert (=> b!1218746 m!1123545))

(assert (=> b!1218745 m!1123319))

(assert (=> b!1218745 m!1123525))

(assert (=> b!1218745 m!1123319))

(assert (=> b!1218745 m!1123535))

(assert (=> b!1218745 m!1123525))

(assert (=> b!1218745 m!1123521))

(declare-fun m!1123547 () Bool)

(assert (=> b!1218745 m!1123547))

(assert (=> b!1218745 m!1123521))

(assert (=> b!1218564 d!133667))

(declare-fun d!133669 () Bool)

(assert (=> d!133669 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218573 d!133669))

(declare-fun d!133671 () Bool)

(assert (=> d!133671 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1218563 d!133671))

(declare-fun d!133673 () Bool)

(declare-fun e!691963 () Bool)

(assert (=> d!133673 e!691963))

(declare-fun res!809437 () Bool)

(assert (=> d!133673 (=> (not res!809437) (not e!691963))))

(declare-fun lt!554061 () ListLongMap!17957)

(assert (=> d!133673 (= res!809437 (contains!7011 lt!554061 (_1!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))))))

(declare-fun lt!554064 () List!26791)

(assert (=> d!133673 (= lt!554061 (ListLongMap!17958 lt!554064))))

(declare-fun lt!554063 () Unit!40392)

(declare-fun lt!554062 () Unit!40392)

(assert (=> d!133673 (= lt!554063 lt!554062)))

(declare-datatypes ((Option!694 0))(
  ( (Some!693 (v!18195 V!46411)) (None!692) )
))
(declare-fun getValueByKey!643 (List!26791 (_ BitVec 64)) Option!694)

(assert (=> d!133673 (= (getValueByKey!643 lt!554064 (_1!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))) (Some!693 (_2!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!320 (List!26791 (_ BitVec 64) V!46411) Unit!40392)

(assert (=> d!133673 (= lt!554062 (lemmaContainsTupThenGetReturnValue!320 lt!554064 (_1!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959))) (_2!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))))))

(declare-fun insertStrictlySorted!413 (List!26791 (_ BitVec 64) V!46411) List!26791)

(assert (=> d!133673 (= lt!554064 (insertStrictlySorted!413 (toList!8994 lt!553953) (_1!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959))) (_2!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))))))

(assert (=> d!133673 (= (+!4063 lt!553953 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959))) lt!554061)))

(declare-fun b!1218755 () Bool)

(declare-fun res!809436 () Bool)

(assert (=> b!1218755 (=> (not res!809436) (not e!691963))))

(assert (=> b!1218755 (= res!809436 (= (getValueByKey!643 (toList!8994 lt!554061) (_1!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959)))) (Some!693 (_2!10005 (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959))))))))

(declare-fun b!1218756 () Bool)

(declare-fun contains!7013 (List!26791 tuple2!19988) Bool)

(assert (=> b!1218756 (= e!691963 (contains!7013 (toList!8994 lt!554061) (tuple2!19989 (select (arr!37982 _keys!1208) from!1455) (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959))))))

(assert (= (and d!133673 res!809437) b!1218755))

(assert (= (and b!1218755 res!809436) b!1218756))

(declare-fun m!1123549 () Bool)

(assert (=> d!133673 m!1123549))

(declare-fun m!1123551 () Bool)

(assert (=> d!133673 m!1123551))

(declare-fun m!1123553 () Bool)

(assert (=> d!133673 m!1123553))

(declare-fun m!1123555 () Bool)

(assert (=> d!133673 m!1123555))

(declare-fun m!1123557 () Bool)

(assert (=> b!1218755 m!1123557))

(declare-fun m!1123559 () Bool)

(assert (=> b!1218756 m!1123559))

(assert (=> b!1218572 d!133673))

(declare-fun d!133675 () Bool)

(declare-fun c!120160 () Bool)

(assert (=> d!133675 (= c!120160 ((_ is ValueCellFull!14772) (select (arr!37983 _values!996) from!1455)))))

(declare-fun e!691966 () V!46411)

(assert (=> d!133675 (= (get!19360 (select (arr!37983 _values!996) from!1455) lt!553959) e!691966)))

(declare-fun b!1218761 () Bool)

(declare-fun get!19362 (ValueCell!14772 V!46411) V!46411)

(assert (=> b!1218761 (= e!691966 (get!19362 (select (arr!37983 _values!996) from!1455) lt!553959))))

(declare-fun b!1218762 () Bool)

(declare-fun get!19363 (ValueCell!14772 V!46411) V!46411)

(assert (=> b!1218762 (= e!691966 (get!19363 (select (arr!37983 _values!996) from!1455) lt!553959))))

(assert (= (and d!133675 c!120160) b!1218761))

(assert (= (and d!133675 (not c!120160)) b!1218762))

(assert (=> b!1218761 m!1123309))

(declare-fun m!1123561 () Bool)

(assert (=> b!1218761 m!1123561))

(assert (=> b!1218762 m!1123309))

(declare-fun m!1123563 () Bool)

(assert (=> b!1218762 m!1123563))

(assert (=> b!1218572 d!133675))

(declare-fun b!1218763 () Bool)

(declare-fun e!691968 () Bool)

(declare-fun call!60665 () Bool)

(assert (=> b!1218763 (= e!691968 call!60665)))

(declare-fun d!133677 () Bool)

(declare-fun res!809438 () Bool)

(declare-fun e!691967 () Bool)

(assert (=> d!133677 (=> res!809438 e!691967)))

(assert (=> d!133677 (= res!809438 (bvsge #b00000000000000000000000000000000 (size!38518 lt!553958)))))

(assert (=> d!133677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553958 mask!1564) e!691967)))

(declare-fun bm!60662 () Bool)

(assert (=> bm!60662 (= call!60665 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553958 mask!1564))))

(declare-fun b!1218764 () Bool)

(declare-fun e!691969 () Bool)

(assert (=> b!1218764 (= e!691969 call!60665)))

(declare-fun b!1218765 () Bool)

(assert (=> b!1218765 (= e!691969 e!691968)))

(declare-fun lt!554067 () (_ BitVec 64))

(assert (=> b!1218765 (= lt!554067 (select (arr!37982 lt!553958) #b00000000000000000000000000000000))))

(declare-fun lt!554065 () Unit!40392)

(assert (=> b!1218765 (= lt!554065 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553958 lt!554067 #b00000000000000000000000000000000))))

(assert (=> b!1218765 (arrayContainsKey!0 lt!553958 lt!554067 #b00000000000000000000000000000000)))

(declare-fun lt!554066 () Unit!40392)

(assert (=> b!1218765 (= lt!554066 lt!554065)))

(declare-fun res!809439 () Bool)

(assert (=> b!1218765 (= res!809439 (= (seekEntryOrOpen!0 (select (arr!37982 lt!553958) #b00000000000000000000000000000000) lt!553958 mask!1564) (Found!9945 #b00000000000000000000000000000000)))))

(assert (=> b!1218765 (=> (not res!809439) (not e!691968))))

(declare-fun b!1218766 () Bool)

(assert (=> b!1218766 (= e!691967 e!691969)))

(declare-fun c!120161 () Bool)

(assert (=> b!1218766 (= c!120161 (validKeyInArray!0 (select (arr!37982 lt!553958) #b00000000000000000000000000000000)))))

(assert (= (and d!133677 (not res!809438)) b!1218766))

(assert (= (and b!1218766 c!120161) b!1218765))

(assert (= (and b!1218766 (not c!120161)) b!1218764))

(assert (= (and b!1218765 res!809439) b!1218763))

(assert (= (or b!1218763 b!1218764) bm!60662))

(declare-fun m!1123565 () Bool)

(assert (=> bm!60662 m!1123565))

(assert (=> b!1218765 m!1123473))

(declare-fun m!1123567 () Bool)

(assert (=> b!1218765 m!1123567))

(declare-fun m!1123569 () Bool)

(assert (=> b!1218765 m!1123569))

(assert (=> b!1218765 m!1123473))

(declare-fun m!1123571 () Bool)

(assert (=> b!1218765 m!1123571))

(assert (=> b!1218766 m!1123473))

(assert (=> b!1218766 m!1123473))

(assert (=> b!1218766 m!1123475))

(assert (=> b!1218562 d!133677))

(declare-fun b!1218768 () Bool)

(declare-fun e!691971 () Bool)

(declare-fun e!691970 () Bool)

(assert (=> b!1218768 (= e!691971 e!691970)))

(declare-fun res!809440 () Bool)

(assert (=> b!1218768 (=> (not res!809440) (not e!691970))))

(declare-fun e!691973 () Bool)

(assert (=> b!1218768 (= res!809440 (not e!691973))))

(declare-fun res!809442 () Bool)

(assert (=> b!1218768 (=> (not res!809442) (not e!691973))))

(assert (=> b!1218768 (= res!809442 (validKeyInArray!0 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1218769 () Bool)

(declare-fun e!691972 () Bool)

(declare-fun call!60666 () Bool)

(assert (=> b!1218769 (= e!691972 call!60666)))

(declare-fun bm!60663 () Bool)

(declare-fun c!120162 () Bool)

(assert (=> bm!60663 (= call!60666 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120162 (Cons!26786 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000) Nil!26787) Nil!26787)))))

(declare-fun b!1218770 () Bool)

(assert (=> b!1218770 (= e!691970 e!691972)))

(assert (=> b!1218770 (= c!120162 (validKeyInArray!0 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1218771 () Bool)

(assert (=> b!1218771 (= e!691973 (contains!7012 Nil!26787 (select (arr!37982 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133679 () Bool)

(declare-fun res!809441 () Bool)

(assert (=> d!133679 (=> res!809441 e!691971)))

(assert (=> d!133679 (= res!809441 (bvsge #b00000000000000000000000000000000 (size!38518 _keys!1208)))))

(assert (=> d!133679 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26787) e!691971)))

(declare-fun b!1218767 () Bool)

(assert (=> b!1218767 (= e!691972 call!60666)))

(assert (= (and d!133679 (not res!809441)) b!1218768))

(assert (= (and b!1218768 res!809442) b!1218771))

(assert (= (and b!1218768 res!809440) b!1218770))

(assert (= (and b!1218770 c!120162) b!1218767))

(assert (= (and b!1218770 (not c!120162)) b!1218769))

(assert (= (or b!1218767 b!1218769) bm!60663))

(assert (=> b!1218768 m!1123407))

(assert (=> b!1218768 m!1123407))

(assert (=> b!1218768 m!1123415))

(assert (=> bm!60663 m!1123407))

(declare-fun m!1123573 () Bool)

(assert (=> bm!60663 m!1123573))

(assert (=> b!1218770 m!1123407))

(assert (=> b!1218770 m!1123407))

(assert (=> b!1218770 m!1123415))

(assert (=> b!1218771 m!1123407))

(assert (=> b!1218771 m!1123407))

(declare-fun m!1123575 () Bool)

(assert (=> b!1218771 m!1123575))

(assert (=> b!1218560 d!133679))

(declare-fun mapIsEmpty!48331 () Bool)

(declare-fun mapRes!48331 () Bool)

(assert (=> mapIsEmpty!48331 mapRes!48331))

(declare-fun condMapEmpty!48331 () Bool)

(declare-fun mapDefault!48331 () ValueCell!14772)

(assert (=> mapNonEmpty!48325 (= condMapEmpty!48331 (= mapRest!48325 ((as const (Array (_ BitVec 32) ValueCell!14772)) mapDefault!48331)))))

(declare-fun e!691978 () Bool)

(assert (=> mapNonEmpty!48325 (= tp!91805 (and e!691978 mapRes!48331))))

(declare-fun b!1218778 () Bool)

(declare-fun e!691979 () Bool)

(assert (=> b!1218778 (= e!691979 tp_is_empty!30963)))

(declare-fun mapNonEmpty!48331 () Bool)

(declare-fun tp!91814 () Bool)

(assert (=> mapNonEmpty!48331 (= mapRes!48331 (and tp!91814 e!691979))))

(declare-fun mapRest!48331 () (Array (_ BitVec 32) ValueCell!14772))

(declare-fun mapKey!48331 () (_ BitVec 32))

(declare-fun mapValue!48331 () ValueCell!14772)

(assert (=> mapNonEmpty!48331 (= mapRest!48325 (store mapRest!48331 mapKey!48331 mapValue!48331))))

(declare-fun b!1218779 () Bool)

(assert (=> b!1218779 (= e!691978 tp_is_empty!30963)))

(assert (= (and mapNonEmpty!48325 condMapEmpty!48331) mapIsEmpty!48331))

(assert (= (and mapNonEmpty!48325 (not condMapEmpty!48331)) mapNonEmpty!48331))

(assert (= (and mapNonEmpty!48331 ((_ is ValueCellFull!14772) mapValue!48331)) b!1218778))

(assert (= (and mapNonEmpty!48325 ((_ is ValueCellFull!14772) mapDefault!48331)) b!1218779))

(declare-fun m!1123577 () Bool)

(assert (=> mapNonEmpty!48331 m!1123577))

(declare-fun b_lambda!22035 () Bool)

(assert (= b_lambda!22031 (or (and start!101388 b_free!26259) b_lambda!22035)))

(declare-fun b_lambda!22037 () Bool)

(assert (= b_lambda!22021 (or (and start!101388 b_free!26259) b_lambda!22037)))

(declare-fun b_lambda!22039 () Bool)

(assert (= b_lambda!22025 (or (and start!101388 b_free!26259) b_lambda!22039)))

(declare-fun b_lambda!22041 () Bool)

(assert (= b_lambda!22019 (or (and start!101388 b_free!26259) b_lambda!22041)))

(declare-fun b_lambda!22043 () Bool)

(assert (= b_lambda!22029 (or (and start!101388 b_free!26259) b_lambda!22043)))

(declare-fun b_lambda!22045 () Bool)

(assert (= b_lambda!22033 (or (and start!101388 b_free!26259) b_lambda!22045)))

(declare-fun b_lambda!22047 () Bool)

(assert (= b_lambda!22017 (or (and start!101388 b_free!26259) b_lambda!22047)))

(declare-fun b_lambda!22049 () Bool)

(assert (= b_lambda!22027 (or (and start!101388 b_free!26259) b_lambda!22049)))

(declare-fun b_lambda!22051 () Bool)

(assert (= b_lambda!22023 (or (and start!101388 b_free!26259) b_lambda!22051)))

(check-sat (not b_lambda!22045) tp_is_empty!30963 (not bm!60660) (not b!1218693) (not b_next!26259) (not b!1218741) (not b!1218694) (not bm!60659) (not bm!60653) (not b!1218765) (not b_lambda!22035) (not d!133667) (not bm!60663) (not b!1218681) (not b_lambda!22015) (not b!1218652) (not b!1218756) (not b!1218721) (not b!1218762) (not bm!60654) (not b!1218755) (not b_lambda!22051) (not b!1218691) (not b!1218685) (not b!1218746) (not b!1218716) b_and!43695 (not b!1218743) (not b!1218747) (not d!133661) (not bm!60646) (not b!1218714) (not mapNonEmpty!48331) (not b!1218718) (not b!1218725) (not b!1218742) (not b!1218720) (not b!1218768) (not d!133665) (not b!1218766) (not b!1218697) (not b!1218682) (not b!1218687) (not b!1218679) (not b!1218722) (not d!133645) (not b!1218771) (not b!1218770) (not b_lambda!22041) (not bm!60650) (not b!1218654) (not d!133673) (not d!133663) (not bm!60662) (not b!1218645) (not b_lambda!22049) (not b!1218699) (not b!1218726) (not b!1218702) (not b!1218690) (not b!1218695) (not b_lambda!22039) (not b_lambda!22047) (not b!1218717) (not b!1218683) (not b!1218745) (not b!1218724) (not b!1218698) (not b!1218737) (not d!133651) (not b_lambda!22037) (not bm!60649) (not b!1218686) (not bm!60661) (not b_lambda!22043) (not b!1218646) (not b!1218729) (not b!1218761) (not d!133649) (not b!1218739) (not b!1218750))
(check-sat b_and!43695 (not b_next!26259))
