; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99454 () Bool)

(assert start!99454)

(declare-fun b_free!25039 () Bool)

(declare-fun b_next!25039 () Bool)

(assert (=> start!99454 (= b_free!25039 (not b_next!25039))))

(declare-fun tp!87830 () Bool)

(declare-fun b_and!40923 () Bool)

(assert (=> start!99454 (= tp!87830 b_and!40923)))

(declare-fun b!1175029 () Bool)

(declare-datatypes ((Unit!38608 0))(
  ( (Unit!38609) )
))
(declare-fun e!667905 () Unit!38608)

(declare-fun Unit!38610 () Unit!38608)

(assert (=> b!1175029 (= e!667905 Unit!38610)))

(declare-fun lt!529907 () Unit!38608)

(declare-datatypes ((array!75878 0))(
  ( (array!75879 (arr!36589 (Array (_ BitVec 32) (_ BitVec 64))) (size!37127 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75878)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38608)

(assert (=> b!1175029 (= lt!529907 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175029 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529902 () Unit!38608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75878 (_ BitVec 32) (_ BitVec 32)) Unit!38608)

(assert (=> b!1175029 (= lt!529902 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25788 0))(
  ( (Nil!25785) (Cons!25784 (h!26993 (_ BitVec 64)) (t!37810 List!25788)) )
))
(declare-fun arrayNoDuplicates!0 (array!75878 (_ BitVec 32) List!25788) Bool)

(assert (=> b!1175029 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25785)))

(declare-fun lt!529895 () Unit!38608)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75878 (_ BitVec 64) (_ BitVec 32) List!25788) Unit!38608)

(assert (=> b!1175029 (= lt!529895 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25785))))

(assert (=> b!1175029 false))

(declare-fun b!1175030 () Bool)

(declare-fun e!667911 () Bool)

(declare-fun e!667904 () Bool)

(assert (=> b!1175030 (= e!667911 (not e!667904))))

(declare-fun res!780376 () Bool)

(assert (=> b!1175030 (=> res!780376 e!667904)))

(assert (=> b!1175030 (= res!780376 (bvsgt from!1455 i!673))))

(assert (=> b!1175030 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529896 () Unit!38608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75878 (_ BitVec 64) (_ BitVec 32)) Unit!38608)

(assert (=> b!1175030 (= lt!529896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175031 () Bool)

(declare-fun e!667903 () Bool)

(assert (=> b!1175031 (= e!667903 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175032 () Bool)

(declare-fun e!667909 () Bool)

(declare-fun e!667902 () Bool)

(assert (=> b!1175032 (= e!667909 e!667902)))

(declare-fun res!780381 () Bool)

(assert (=> b!1175032 (=> res!780381 e!667902)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175032 (= res!780381 (not (validKeyInArray!0 (select (arr!36589 _keys!1208) from!1455))))))

(declare-datatypes ((V!44553 0))(
  ( (V!44554 (val!14841 Int)) )
))
(declare-datatypes ((tuple2!19076 0))(
  ( (tuple2!19077 (_1!9549 (_ BitVec 64)) (_2!9549 V!44553)) )
))
(declare-datatypes ((List!25789 0))(
  ( (Nil!25786) (Cons!25785 (h!26994 tuple2!19076) (t!37811 List!25789)) )
))
(declare-datatypes ((ListLongMap!17045 0))(
  ( (ListLongMap!17046 (toList!8538 List!25789)) )
))
(declare-fun lt!529900 () ListLongMap!17045)

(declare-fun lt!529904 () ListLongMap!17045)

(assert (=> b!1175032 (= lt!529900 lt!529904)))

(declare-fun lt!529901 () ListLongMap!17045)

(declare-fun -!1522 (ListLongMap!17045 (_ BitVec 64)) ListLongMap!17045)

(assert (=> b!1175032 (= lt!529904 (-!1522 lt!529901 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!529908 () array!75878)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14075 0))(
  ( (ValueCellFull!14075 (v!17478 V!44553)) (EmptyCell!14075) )
))
(declare-datatypes ((array!75880 0))(
  ( (array!75881 (arr!36590 (Array (_ BitVec 32) ValueCell!14075)) (size!37128 (_ BitVec 32))) )
))
(declare-fun lt!529903 () array!75880)

(declare-fun minValue!944 () V!44553)

(declare-fun zeroValue!944 () V!44553)

(declare-fun getCurrentListMapNoExtraKeys!5008 (array!75878 array!75880 (_ BitVec 32) (_ BitVec 32) V!44553 V!44553 (_ BitVec 32) Int) ListLongMap!17045)

(assert (=> b!1175032 (= lt!529900 (getCurrentListMapNoExtraKeys!5008 lt!529908 lt!529903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75880)

(assert (=> b!1175032 (= lt!529901 (getCurrentListMapNoExtraKeys!5008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529905 () Unit!38608)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!786 (array!75878 array!75880 (_ BitVec 32) (_ BitVec 32) V!44553 V!44553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38608)

(assert (=> b!1175032 (= lt!529905 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46181 () Bool)

(declare-fun mapRes!46181 () Bool)

(declare-fun tp!87831 () Bool)

(declare-fun e!667908 () Bool)

(assert (=> mapNonEmpty!46181 (= mapRes!46181 (and tp!87831 e!667908))))

(declare-fun mapKey!46181 () (_ BitVec 32))

(declare-fun mapRest!46181 () (Array (_ BitVec 32) ValueCell!14075))

(declare-fun mapValue!46181 () ValueCell!14075)

(assert (=> mapNonEmpty!46181 (= (arr!36590 _values!996) (store mapRest!46181 mapKey!46181 mapValue!46181))))

(declare-fun b!1175033 () Bool)

(declare-fun res!780380 () Bool)

(assert (=> b!1175033 (=> (not res!780380) (not e!667911))))

(assert (=> b!1175033 (= res!780380 (arrayNoDuplicates!0 lt!529908 #b00000000000000000000000000000000 Nil!25785))))

(declare-fun b!1175034 () Bool)

(declare-fun Unit!38611 () Unit!38608)

(assert (=> b!1175034 (= e!667905 Unit!38611)))

(declare-fun mapIsEmpty!46181 () Bool)

(assert (=> mapIsEmpty!46181 mapRes!46181))

(declare-fun b!1175035 () Bool)

(assert (=> b!1175035 (= e!667904 e!667909)))

(declare-fun res!780372 () Bool)

(assert (=> b!1175035 (=> res!780372 e!667909)))

(assert (=> b!1175035 (= res!780372 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529897 () ListLongMap!17045)

(assert (=> b!1175035 (= lt!529897 (getCurrentListMapNoExtraKeys!5008 lt!529908 lt!529903 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529898 () V!44553)

(assert (=> b!1175035 (= lt!529903 (array!75881 (store (arr!36590 _values!996) i!673 (ValueCellFull!14075 lt!529898)) (size!37128 _values!996)))))

(declare-fun dynLambda!2925 (Int (_ BitVec 64)) V!44553)

(assert (=> b!1175035 (= lt!529898 (dynLambda!2925 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529899 () ListLongMap!17045)

(assert (=> b!1175035 (= lt!529899 (getCurrentListMapNoExtraKeys!5008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175037 () Bool)

(assert (=> b!1175037 (= e!667902 true)))

(assert (=> b!1175037 (not (= (select (arr!36589 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529906 () Unit!38608)

(assert (=> b!1175037 (= lt!529906 e!667905)))

(declare-fun c!116656 () Bool)

(assert (=> b!1175037 (= c!116656 (= (select (arr!36589 _keys!1208) from!1455) k0!934))))

(declare-fun e!667906 () Bool)

(assert (=> b!1175037 e!667906))

(declare-fun res!780385 () Bool)

(assert (=> b!1175037 (=> (not res!780385) (not e!667906))))

(declare-fun +!3845 (ListLongMap!17045 tuple2!19076) ListLongMap!17045)

(declare-fun get!18691 (ValueCell!14075 V!44553) V!44553)

(assert (=> b!1175037 (= res!780385 (= lt!529897 (+!3845 lt!529904 (tuple2!19077 (select (arr!36589 _keys!1208) from!1455) (get!18691 (select (arr!36590 _values!996) from!1455) lt!529898)))))))

(declare-fun b!1175038 () Bool)

(declare-fun res!780383 () Bool)

(declare-fun e!667907 () Bool)

(assert (=> b!1175038 (=> (not res!780383) (not e!667907))))

(assert (=> b!1175038 (= res!780383 (and (= (size!37128 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37127 _keys!1208) (size!37128 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175039 () Bool)

(declare-fun e!667910 () Bool)

(declare-fun e!667912 () Bool)

(assert (=> b!1175039 (= e!667910 (and e!667912 mapRes!46181))))

(declare-fun condMapEmpty!46181 () Bool)

(declare-fun mapDefault!46181 () ValueCell!14075)

(assert (=> b!1175039 (= condMapEmpty!46181 (= (arr!36590 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14075)) mapDefault!46181)))))

(declare-fun b!1175040 () Bool)

(declare-fun res!780382 () Bool)

(assert (=> b!1175040 (=> (not res!780382) (not e!667907))))

(assert (=> b!1175040 (= res!780382 (validKeyInArray!0 k0!934))))

(declare-fun b!1175041 () Bool)

(declare-fun res!780378 () Bool)

(assert (=> b!1175041 (=> (not res!780378) (not e!667907))))

(assert (=> b!1175041 (= res!780378 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37127 _keys!1208))))))

(declare-fun b!1175042 () Bool)

(assert (=> b!1175042 (= e!667907 e!667911)))

(declare-fun res!780371 () Bool)

(assert (=> b!1175042 (=> (not res!780371) (not e!667911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75878 (_ BitVec 32)) Bool)

(assert (=> b!1175042 (= res!780371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529908 mask!1564))))

(assert (=> b!1175042 (= lt!529908 (array!75879 (store (arr!36589 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37127 _keys!1208)))))

(declare-fun b!1175043 () Bool)

(declare-fun res!780373 () Bool)

(assert (=> b!1175043 (=> (not res!780373) (not e!667907))))

(assert (=> b!1175043 (= res!780373 (= (select (arr!36589 _keys!1208) i!673) k0!934))))

(declare-fun b!1175044 () Bool)

(declare-fun res!780379 () Bool)

(assert (=> b!1175044 (=> (not res!780379) (not e!667907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175044 (= res!780379 (validMask!0 mask!1564))))

(declare-fun b!1175045 () Bool)

(assert (=> b!1175045 (= e!667906 e!667903)))

(declare-fun res!780384 () Bool)

(assert (=> b!1175045 (=> res!780384 e!667903)))

(assert (=> b!1175045 (= res!780384 (not (= (select (arr!36589 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175046 () Bool)

(declare-fun res!780375 () Bool)

(assert (=> b!1175046 (=> (not res!780375) (not e!667907))))

(assert (=> b!1175046 (= res!780375 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25785))))

(declare-fun b!1175047 () Bool)

(declare-fun tp_is_empty!29569 () Bool)

(assert (=> b!1175047 (= e!667912 tp_is_empty!29569)))

(declare-fun b!1175048 () Bool)

(declare-fun res!780374 () Bool)

(assert (=> b!1175048 (=> (not res!780374) (not e!667907))))

(assert (=> b!1175048 (= res!780374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!780377 () Bool)

(assert (=> start!99454 (=> (not res!780377) (not e!667907))))

(assert (=> start!99454 (= res!780377 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37127 _keys!1208))))))

(assert (=> start!99454 e!667907))

(assert (=> start!99454 tp_is_empty!29569))

(declare-fun array_inv!28062 (array!75878) Bool)

(assert (=> start!99454 (array_inv!28062 _keys!1208)))

(assert (=> start!99454 true))

(assert (=> start!99454 tp!87830))

(declare-fun array_inv!28063 (array!75880) Bool)

(assert (=> start!99454 (and (array_inv!28063 _values!996) e!667910)))

(declare-fun b!1175036 () Bool)

(assert (=> b!1175036 (= e!667908 tp_is_empty!29569)))

(assert (= (and start!99454 res!780377) b!1175044))

(assert (= (and b!1175044 res!780379) b!1175038))

(assert (= (and b!1175038 res!780383) b!1175048))

(assert (= (and b!1175048 res!780374) b!1175046))

(assert (= (and b!1175046 res!780375) b!1175041))

(assert (= (and b!1175041 res!780378) b!1175040))

(assert (= (and b!1175040 res!780382) b!1175043))

(assert (= (and b!1175043 res!780373) b!1175042))

(assert (= (and b!1175042 res!780371) b!1175033))

(assert (= (and b!1175033 res!780380) b!1175030))

(assert (= (and b!1175030 (not res!780376)) b!1175035))

(assert (= (and b!1175035 (not res!780372)) b!1175032))

(assert (= (and b!1175032 (not res!780381)) b!1175037))

(assert (= (and b!1175037 res!780385) b!1175045))

(assert (= (and b!1175045 (not res!780384)) b!1175031))

(assert (= (and b!1175037 c!116656) b!1175029))

(assert (= (and b!1175037 (not c!116656)) b!1175034))

(assert (= (and b!1175039 condMapEmpty!46181) mapIsEmpty!46181))

(assert (= (and b!1175039 (not condMapEmpty!46181)) mapNonEmpty!46181))

(get-info :version)

(assert (= (and mapNonEmpty!46181 ((_ is ValueCellFull!14075) mapValue!46181)) b!1175036))

(assert (= (and b!1175039 ((_ is ValueCellFull!14075) mapDefault!46181)) b!1175047))

(assert (= start!99454 b!1175039))

(declare-fun b_lambda!20165 () Bool)

(assert (=> (not b_lambda!20165) (not b!1175035)))

(declare-fun t!37809 () Bool)

(declare-fun tb!9843 () Bool)

(assert (=> (and start!99454 (= defaultEntry!1004 defaultEntry!1004) t!37809) tb!9843))

(declare-fun result!20261 () Bool)

(assert (=> tb!9843 (= result!20261 tp_is_empty!29569)))

(assert (=> b!1175035 t!37809))

(declare-fun b_and!40925 () Bool)

(assert (= b_and!40923 (and (=> t!37809 result!20261) b_and!40925)))

(declare-fun m!1082441 () Bool)

(assert (=> b!1175032 m!1082441))

(declare-fun m!1082443 () Bool)

(assert (=> b!1175032 m!1082443))

(declare-fun m!1082445 () Bool)

(assert (=> b!1175032 m!1082445))

(declare-fun m!1082447 () Bool)

(assert (=> b!1175032 m!1082447))

(declare-fun m!1082449 () Bool)

(assert (=> b!1175032 m!1082449))

(declare-fun m!1082451 () Bool)

(assert (=> b!1175032 m!1082451))

(assert (=> b!1175032 m!1082449))

(declare-fun m!1082453 () Bool)

(assert (=> b!1175035 m!1082453))

(declare-fun m!1082455 () Bool)

(assert (=> b!1175035 m!1082455))

(declare-fun m!1082457 () Bool)

(assert (=> b!1175035 m!1082457))

(declare-fun m!1082459 () Bool)

(assert (=> b!1175035 m!1082459))

(declare-fun m!1082461 () Bool)

(assert (=> b!1175033 m!1082461))

(assert (=> b!1175037 m!1082449))

(declare-fun m!1082463 () Bool)

(assert (=> b!1175037 m!1082463))

(assert (=> b!1175037 m!1082463))

(declare-fun m!1082465 () Bool)

(assert (=> b!1175037 m!1082465))

(declare-fun m!1082467 () Bool)

(assert (=> b!1175037 m!1082467))

(declare-fun m!1082469 () Bool)

(assert (=> b!1175031 m!1082469))

(assert (=> b!1175045 m!1082449))

(declare-fun m!1082471 () Bool)

(assert (=> b!1175042 m!1082471))

(declare-fun m!1082473 () Bool)

(assert (=> b!1175042 m!1082473))

(declare-fun m!1082475 () Bool)

(assert (=> start!99454 m!1082475))

(declare-fun m!1082477 () Bool)

(assert (=> start!99454 m!1082477))

(declare-fun m!1082479 () Bool)

(assert (=> b!1175046 m!1082479))

(declare-fun m!1082481 () Bool)

(assert (=> mapNonEmpty!46181 m!1082481))

(declare-fun m!1082483 () Bool)

(assert (=> b!1175043 m!1082483))

(declare-fun m!1082485 () Bool)

(assert (=> b!1175029 m!1082485))

(declare-fun m!1082487 () Bool)

(assert (=> b!1175029 m!1082487))

(declare-fun m!1082489 () Bool)

(assert (=> b!1175029 m!1082489))

(declare-fun m!1082491 () Bool)

(assert (=> b!1175029 m!1082491))

(declare-fun m!1082493 () Bool)

(assert (=> b!1175029 m!1082493))

(declare-fun m!1082495 () Bool)

(assert (=> b!1175030 m!1082495))

(declare-fun m!1082497 () Bool)

(assert (=> b!1175030 m!1082497))

(declare-fun m!1082499 () Bool)

(assert (=> b!1175048 m!1082499))

(declare-fun m!1082501 () Bool)

(assert (=> b!1175044 m!1082501))

(declare-fun m!1082503 () Bool)

(assert (=> b!1175040 m!1082503))

(check-sat b_and!40925 (not b!1175035) (not b!1175037) (not start!99454) (not b_lambda!20165) (not b!1175029) (not b!1175040) (not b!1175033) (not b!1175048) (not b!1175032) (not b!1175046) (not b!1175042) (not b!1175030) (not b!1175031) (not mapNonEmpty!46181) (not b_next!25039) tp_is_empty!29569 (not b!1175044))
(check-sat b_and!40925 (not b_next!25039))
