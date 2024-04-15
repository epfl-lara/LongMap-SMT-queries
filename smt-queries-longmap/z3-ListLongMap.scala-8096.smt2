; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99436 () Bool)

(assert start!99436)

(declare-fun b_free!25021 () Bool)

(declare-fun b_next!25021 () Bool)

(assert (=> start!99436 (= b_free!25021 (not b_next!25021))))

(declare-fun tp!87776 () Bool)

(declare-fun b_and!40887 () Bool)

(assert (=> start!99436 (= tp!87776 b_and!40887)))

(declare-fun b!1174471 () Bool)

(declare-fun res!779968 () Bool)

(declare-fun e!667586 () Bool)

(assert (=> b!1174471 (=> (not res!779968) (not e!667586))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75842 0))(
  ( (array!75843 (arr!36571 (Array (_ BitVec 32) (_ BitVec 64))) (size!37109 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75842)

(assert (=> b!1174471 (= res!779968 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37109 _keys!1208))))))

(declare-fun b!1174472 () Bool)

(declare-fun res!779979 () Bool)

(assert (=> b!1174472 (=> (not res!779979) (not e!667586))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174472 (= res!779979 (validMask!0 mask!1564))))

(declare-fun b!1174473 () Bool)

(declare-fun e!667579 () Bool)

(declare-fun e!667577 () Bool)

(assert (=> b!1174473 (= e!667579 e!667577)))

(declare-fun res!779978 () Bool)

(assert (=> b!1174473 (=> res!779978 e!667577)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174473 (= res!779978 (not (= (select (arr!36571 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174474 () Bool)

(declare-fun e!667584 () Bool)

(declare-fun tp_is_empty!29551 () Bool)

(assert (=> b!1174474 (= e!667584 tp_is_empty!29551)))

(declare-fun b!1174475 () Bool)

(declare-fun e!667583 () Bool)

(declare-fun e!667580 () Bool)

(declare-fun mapRes!46154 () Bool)

(assert (=> b!1174475 (= e!667583 (and e!667580 mapRes!46154))))

(declare-fun condMapEmpty!46154 () Bool)

(declare-datatypes ((V!44529 0))(
  ( (V!44530 (val!14832 Int)) )
))
(declare-datatypes ((ValueCell!14066 0))(
  ( (ValueCellFull!14066 (v!17469 V!44529)) (EmptyCell!14066) )
))
(declare-datatypes ((array!75844 0))(
  ( (array!75845 (arr!36572 (Array (_ BitVec 32) ValueCell!14066)) (size!37110 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75844)

(declare-fun mapDefault!46154 () ValueCell!14066)

(assert (=> b!1174475 (= condMapEmpty!46154 (= (arr!36572 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14066)) mapDefault!46154)))))

(declare-fun b!1174476 () Bool)

(declare-datatypes ((Unit!38575 0))(
  ( (Unit!38576) )
))
(declare-fun e!667587 () Unit!38575)

(declare-fun Unit!38577 () Unit!38575)

(assert (=> b!1174476 (= e!667587 Unit!38577)))

(declare-fun mapNonEmpty!46154 () Bool)

(declare-fun tp!87777 () Bool)

(assert (=> mapNonEmpty!46154 (= mapRes!46154 (and tp!87777 e!667584))))

(declare-fun mapRest!46154 () (Array (_ BitVec 32) ValueCell!14066))

(declare-fun mapValue!46154 () ValueCell!14066)

(declare-fun mapKey!46154 () (_ BitVec 32))

(assert (=> mapNonEmpty!46154 (= (arr!36572 _values!996) (store mapRest!46154 mapKey!46154 mapValue!46154))))

(declare-fun res!779971 () Bool)

(assert (=> start!99436 (=> (not res!779971) (not e!667586))))

(assert (=> start!99436 (= res!779971 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37109 _keys!1208))))))

(assert (=> start!99436 e!667586))

(assert (=> start!99436 tp_is_empty!29551))

(declare-fun array_inv!28046 (array!75842) Bool)

(assert (=> start!99436 (array_inv!28046 _keys!1208)))

(assert (=> start!99436 true))

(assert (=> start!99436 tp!87776))

(declare-fun array_inv!28047 (array!75844) Bool)

(assert (=> start!99436 (and (array_inv!28047 _values!996) e!667583)))

(declare-fun b!1174477 () Bool)

(declare-fun e!667581 () Bool)

(declare-fun e!667578 () Bool)

(assert (=> b!1174477 (= e!667581 e!667578)))

(declare-fun res!779977 () Bool)

(assert (=> b!1174477 (=> res!779977 e!667578)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174477 (= res!779977 (not (validKeyInArray!0 (select (arr!36571 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19058 0))(
  ( (tuple2!19059 (_1!9540 (_ BitVec 64)) (_2!9540 V!44529)) )
))
(declare-datatypes ((List!25771 0))(
  ( (Nil!25768) (Cons!25767 (h!26976 tuple2!19058) (t!37775 List!25771)) )
))
(declare-datatypes ((ListLongMap!17027 0))(
  ( (ListLongMap!17028 (toList!8529 List!25771)) )
))
(declare-fun lt!529518 () ListLongMap!17027)

(declare-fun lt!529530 () ListLongMap!17027)

(assert (=> b!1174477 (= lt!529518 lt!529530)))

(declare-fun lt!529520 () ListLongMap!17027)

(declare-fun -!1515 (ListLongMap!17027 (_ BitVec 64)) ListLongMap!17027)

(assert (=> b!1174477 (= lt!529530 (-!1515 lt!529520 k0!934))))

(declare-fun zeroValue!944 () V!44529)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!529526 () array!75842)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529519 () array!75844)

(declare-fun minValue!944 () V!44529)

(declare-fun getCurrentListMapNoExtraKeys!5001 (array!75842 array!75844 (_ BitVec 32) (_ BitVec 32) V!44529 V!44529 (_ BitVec 32) Int) ListLongMap!17027)

(assert (=> b!1174477 (= lt!529518 (getCurrentListMapNoExtraKeys!5001 lt!529526 lt!529519 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174477 (= lt!529520 (getCurrentListMapNoExtraKeys!5001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529525 () Unit!38575)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!779 (array!75842 array!75844 (_ BitVec 32) (_ BitVec 32) V!44529 V!44529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38575)

(assert (=> b!1174477 (= lt!529525 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!779 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174478 () Bool)

(declare-fun res!779976 () Bool)

(assert (=> b!1174478 (=> (not res!779976) (not e!667586))))

(assert (=> b!1174478 (= res!779976 (validKeyInArray!0 k0!934))))

(declare-fun b!1174479 () Bool)

(declare-fun res!779972 () Bool)

(assert (=> b!1174479 (=> (not res!779972) (not e!667586))))

(assert (=> b!1174479 (= res!779972 (= (select (arr!36571 _keys!1208) i!673) k0!934))))

(declare-fun b!1174480 () Bool)

(declare-fun Unit!38578 () Unit!38575)

(assert (=> b!1174480 (= e!667587 Unit!38578)))

(declare-fun lt!529529 () Unit!38575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75842 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38575)

(assert (=> b!1174480 (= lt!529529 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174480 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529524 () Unit!38575)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75842 (_ BitVec 32) (_ BitVec 32)) Unit!38575)

(assert (=> b!1174480 (= lt!529524 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25772 0))(
  ( (Nil!25769) (Cons!25768 (h!26977 (_ BitVec 64)) (t!37776 List!25772)) )
))
(declare-fun arrayNoDuplicates!0 (array!75842 (_ BitVec 32) List!25772) Bool)

(assert (=> b!1174480 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25769)))

(declare-fun lt!529523 () Unit!38575)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75842 (_ BitVec 64) (_ BitVec 32) List!25772) Unit!38575)

(assert (=> b!1174480 (= lt!529523 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25769))))

(assert (=> b!1174480 false))

(declare-fun mapIsEmpty!46154 () Bool)

(assert (=> mapIsEmpty!46154 mapRes!46154))

(declare-fun b!1174481 () Bool)

(assert (=> b!1174481 (= e!667580 tp_is_empty!29551)))

(declare-fun b!1174482 () Bool)

(declare-fun res!779966 () Bool)

(declare-fun e!667588 () Bool)

(assert (=> b!1174482 (=> (not res!779966) (not e!667588))))

(assert (=> b!1174482 (= res!779966 (arrayNoDuplicates!0 lt!529526 #b00000000000000000000000000000000 Nil!25769))))

(declare-fun b!1174483 () Bool)

(declare-fun res!779975 () Bool)

(assert (=> b!1174483 (=> (not res!779975) (not e!667586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75842 (_ BitVec 32)) Bool)

(assert (=> b!1174483 (= res!779975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174484 () Bool)

(assert (=> b!1174484 (= e!667586 e!667588)))

(declare-fun res!779969 () Bool)

(assert (=> b!1174484 (=> (not res!779969) (not e!667588))))

(assert (=> b!1174484 (= res!779969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529526 mask!1564))))

(assert (=> b!1174484 (= lt!529526 (array!75843 (store (arr!36571 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37109 _keys!1208)))))

(declare-fun b!1174485 () Bool)

(assert (=> b!1174485 (= e!667578 true)))

(assert (=> b!1174485 (not (= (select (arr!36571 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529521 () Unit!38575)

(assert (=> b!1174485 (= lt!529521 e!667587)))

(declare-fun c!116629 () Bool)

(assert (=> b!1174485 (= c!116629 (= (select (arr!36571 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174485 e!667579))

(declare-fun res!779973 () Bool)

(assert (=> b!1174485 (=> (not res!779973) (not e!667579))))

(declare-fun lt!529522 () ListLongMap!17027)

(declare-fun lt!529528 () V!44529)

(declare-fun +!3837 (ListLongMap!17027 tuple2!19058) ListLongMap!17027)

(declare-fun get!18677 (ValueCell!14066 V!44529) V!44529)

(assert (=> b!1174485 (= res!779973 (= lt!529522 (+!3837 lt!529530 (tuple2!19059 (select (arr!36571 _keys!1208) from!1455) (get!18677 (select (arr!36572 _values!996) from!1455) lt!529528)))))))

(declare-fun b!1174486 () Bool)

(declare-fun e!667582 () Bool)

(assert (=> b!1174486 (= e!667582 e!667581)))

(declare-fun res!779970 () Bool)

(assert (=> b!1174486 (=> res!779970 e!667581)))

(assert (=> b!1174486 (= res!779970 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1174486 (= lt!529522 (getCurrentListMapNoExtraKeys!5001 lt!529526 lt!529519 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174486 (= lt!529519 (array!75845 (store (arr!36572 _values!996) i!673 (ValueCellFull!14066 lt!529528)) (size!37110 _values!996)))))

(declare-fun dynLambda!2919 (Int (_ BitVec 64)) V!44529)

(assert (=> b!1174486 (= lt!529528 (dynLambda!2919 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529527 () ListLongMap!17027)

(assert (=> b!1174486 (= lt!529527 (getCurrentListMapNoExtraKeys!5001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174487 () Bool)

(assert (=> b!1174487 (= e!667577 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174488 () Bool)

(declare-fun res!779980 () Bool)

(assert (=> b!1174488 (=> (not res!779980) (not e!667586))))

(assert (=> b!1174488 (= res!779980 (and (= (size!37110 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37109 _keys!1208) (size!37110 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174489 () Bool)

(declare-fun res!779974 () Bool)

(assert (=> b!1174489 (=> (not res!779974) (not e!667586))))

(assert (=> b!1174489 (= res!779974 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25769))))

(declare-fun b!1174490 () Bool)

(assert (=> b!1174490 (= e!667588 (not e!667582))))

(declare-fun res!779967 () Bool)

(assert (=> b!1174490 (=> res!779967 e!667582)))

(assert (=> b!1174490 (= res!779967 (bvsgt from!1455 i!673))))

(assert (=> b!1174490 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529517 () Unit!38575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75842 (_ BitVec 64) (_ BitVec 32)) Unit!38575)

(assert (=> b!1174490 (= lt!529517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99436 res!779971) b!1174472))

(assert (= (and b!1174472 res!779979) b!1174488))

(assert (= (and b!1174488 res!779980) b!1174483))

(assert (= (and b!1174483 res!779975) b!1174489))

(assert (= (and b!1174489 res!779974) b!1174471))

(assert (= (and b!1174471 res!779968) b!1174478))

(assert (= (and b!1174478 res!779976) b!1174479))

(assert (= (and b!1174479 res!779972) b!1174484))

(assert (= (and b!1174484 res!779969) b!1174482))

(assert (= (and b!1174482 res!779966) b!1174490))

(assert (= (and b!1174490 (not res!779967)) b!1174486))

(assert (= (and b!1174486 (not res!779970)) b!1174477))

(assert (= (and b!1174477 (not res!779977)) b!1174485))

(assert (= (and b!1174485 res!779973) b!1174473))

(assert (= (and b!1174473 (not res!779978)) b!1174487))

(assert (= (and b!1174485 c!116629) b!1174480))

(assert (= (and b!1174485 (not c!116629)) b!1174476))

(assert (= (and b!1174475 condMapEmpty!46154) mapIsEmpty!46154))

(assert (= (and b!1174475 (not condMapEmpty!46154)) mapNonEmpty!46154))

(get-info :version)

(assert (= (and mapNonEmpty!46154 ((_ is ValueCellFull!14066) mapValue!46154)) b!1174474))

(assert (= (and b!1174475 ((_ is ValueCellFull!14066) mapDefault!46154)) b!1174481))

(assert (= start!99436 b!1174475))

(declare-fun b_lambda!20147 () Bool)

(assert (=> (not b_lambda!20147) (not b!1174486)))

(declare-fun t!37774 () Bool)

(declare-fun tb!9825 () Bool)

(assert (=> (and start!99436 (= defaultEntry!1004 defaultEntry!1004) t!37774) tb!9825))

(declare-fun result!20225 () Bool)

(assert (=> tb!9825 (= result!20225 tp_is_empty!29551)))

(assert (=> b!1174486 t!37774))

(declare-fun b_and!40889 () Bool)

(assert (= b_and!40887 (and (=> t!37774 result!20225) b_and!40889)))

(declare-fun m!1081865 () Bool)

(assert (=> b!1174485 m!1081865))

(declare-fun m!1081867 () Bool)

(assert (=> b!1174485 m!1081867))

(assert (=> b!1174485 m!1081867))

(declare-fun m!1081869 () Bool)

(assert (=> b!1174485 m!1081869))

(declare-fun m!1081871 () Bool)

(assert (=> b!1174485 m!1081871))

(assert (=> b!1174473 m!1081865))

(declare-fun m!1081873 () Bool)

(assert (=> b!1174484 m!1081873))

(declare-fun m!1081875 () Bool)

(assert (=> b!1174484 m!1081875))

(declare-fun m!1081877 () Bool)

(assert (=> b!1174480 m!1081877))

(declare-fun m!1081879 () Bool)

(assert (=> b!1174480 m!1081879))

(declare-fun m!1081881 () Bool)

(assert (=> b!1174480 m!1081881))

(declare-fun m!1081883 () Bool)

(assert (=> b!1174480 m!1081883))

(declare-fun m!1081885 () Bool)

(assert (=> b!1174480 m!1081885))

(declare-fun m!1081887 () Bool)

(assert (=> b!1174482 m!1081887))

(declare-fun m!1081889 () Bool)

(assert (=> b!1174486 m!1081889))

(declare-fun m!1081891 () Bool)

(assert (=> b!1174486 m!1081891))

(declare-fun m!1081893 () Bool)

(assert (=> b!1174486 m!1081893))

(declare-fun m!1081895 () Bool)

(assert (=> b!1174486 m!1081895))

(declare-fun m!1081897 () Bool)

(assert (=> b!1174477 m!1081897))

(declare-fun m!1081899 () Bool)

(assert (=> b!1174477 m!1081899))

(assert (=> b!1174477 m!1081865))

(declare-fun m!1081901 () Bool)

(assert (=> b!1174477 m!1081901))

(assert (=> b!1174477 m!1081865))

(declare-fun m!1081903 () Bool)

(assert (=> b!1174477 m!1081903))

(declare-fun m!1081905 () Bool)

(assert (=> b!1174477 m!1081905))

(declare-fun m!1081907 () Bool)

(assert (=> b!1174479 m!1081907))

(declare-fun m!1081909 () Bool)

(assert (=> mapNonEmpty!46154 m!1081909))

(declare-fun m!1081911 () Bool)

(assert (=> b!1174489 m!1081911))

(declare-fun m!1081913 () Bool)

(assert (=> b!1174472 m!1081913))

(declare-fun m!1081915 () Bool)

(assert (=> b!1174490 m!1081915))

(declare-fun m!1081917 () Bool)

(assert (=> b!1174490 m!1081917))

(declare-fun m!1081919 () Bool)

(assert (=> start!99436 m!1081919))

(declare-fun m!1081921 () Bool)

(assert (=> start!99436 m!1081921))

(declare-fun m!1081923 () Bool)

(assert (=> b!1174487 m!1081923))

(declare-fun m!1081925 () Bool)

(assert (=> b!1174478 m!1081925))

(declare-fun m!1081927 () Bool)

(assert (=> b!1174483 m!1081927))

(check-sat (not b!1174487) (not mapNonEmpty!46154) (not b!1174482) (not b!1174472) (not start!99436) (not b!1174480) (not b!1174489) b_and!40889 (not b!1174485) (not b!1174477) (not b!1174484) (not b!1174478) (not b!1174483) (not b_next!25021) (not b_lambda!20147) (not b!1174490) tp_is_empty!29551 (not b!1174486))
(check-sat b_and!40889 (not b_next!25021))
