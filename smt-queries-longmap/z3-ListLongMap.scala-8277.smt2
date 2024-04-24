; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100998 () Bool)

(assert start!100998)

(declare-fun b_free!25933 () Bool)

(declare-fun b_next!25933 () Bool)

(assert (=> start!100998 (= b_free!25933 (not b_next!25933))))

(declare-fun tp!90802 () Bool)

(declare-fun b_and!42855 () Bool)

(assert (=> start!100998 (= tp!90802 b_and!42855)))

(declare-datatypes ((V!45977 0))(
  ( (V!45978 (val!15375 Int)) )
))
(declare-datatypes ((tuple2!19736 0))(
  ( (tuple2!19737 (_1!9879 (_ BitVec 64)) (_2!9879 V!45977)) )
))
(declare-datatypes ((List!26544 0))(
  ( (Nil!26541) (Cons!26540 (h!27758 tuple2!19736) (t!39449 List!26544)) )
))
(declare-datatypes ((ListLongMap!17713 0))(
  ( (ListLongMap!17714 (toList!8872 List!26544)) )
))
(declare-fun call!58595 () ListLongMap!17713)

(declare-fun call!58597 () ListLongMap!17713)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!685545 () Bool)

(declare-fun b!1206992 () Bool)

(declare-fun -!1814 (ListLongMap!17713 (_ BitVec 64)) ListLongMap!17713)

(assert (=> b!1206992 (= e!685545 (= call!58595 (-!1814 call!58597 k0!934)))))

(declare-fun b!1206993 () Bool)

(declare-fun res!802437 () Bool)

(declare-fun e!685538 () Bool)

(assert (=> b!1206993 (=> (not res!802437) (not e!685538))))

(declare-datatypes ((array!78087 0))(
  ( (array!78088 (arr!37678 (Array (_ BitVec 32) (_ BitVec 64))) (size!38215 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78087)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206993 (= res!802437 (= (select (arr!37678 _keys!1208) i!673) k0!934))))

(declare-fun b!1206994 () Bool)

(declare-datatypes ((Unit!39931 0))(
  ( (Unit!39932) )
))
(declare-fun e!685534 () Unit!39931)

(declare-fun lt!547369 () Unit!39931)

(assert (=> b!1206994 (= e!685534 lt!547369)))

(declare-fun lt!547373 () Unit!39931)

(declare-fun call!58594 () Unit!39931)

(assert (=> b!1206994 (= lt!547373 call!58594)))

(declare-fun lt!547376 () ListLongMap!17713)

(declare-fun call!58593 () ListLongMap!17713)

(assert (=> b!1206994 (= lt!547376 call!58593)))

(declare-fun call!58591 () Bool)

(assert (=> b!1206994 call!58591))

(declare-fun minValue!944 () V!45977)

(declare-fun addStillContains!1020 (ListLongMap!17713 (_ BitVec 64) V!45977 (_ BitVec 64)) Unit!39931)

(assert (=> b!1206994 (= lt!547369 (addStillContains!1020 lt!547376 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6951 (ListLongMap!17713 (_ BitVec 64)) Bool)

(declare-fun +!4036 (ListLongMap!17713 tuple2!19736) ListLongMap!17713)

(assert (=> b!1206994 (contains!6951 (+!4036 lt!547376 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1206995 () Bool)

(declare-fun e!685540 () Unit!39931)

(declare-fun Unit!39933 () Unit!39931)

(assert (=> b!1206995 (= e!685540 Unit!39933)))

(declare-fun b!1206996 () Bool)

(declare-fun res!802435 () Bool)

(assert (=> b!1206996 (=> (not res!802435) (not e!685538))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206996 (= res!802435 (validMask!0 mask!1564))))

(declare-fun b!1206997 () Bool)

(declare-fun e!685542 () Bool)

(declare-fun e!685536 () Bool)

(declare-fun mapRes!47811 () Bool)

(assert (=> b!1206997 (= e!685542 (and e!685536 mapRes!47811))))

(declare-fun condMapEmpty!47811 () Bool)

(declare-datatypes ((ValueCell!14609 0))(
  ( (ValueCellFull!14609 (v!18015 V!45977)) (EmptyCell!14609) )
))
(declare-datatypes ((array!78089 0))(
  ( (array!78090 (arr!37679 (Array (_ BitVec 32) ValueCell!14609)) (size!38216 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78089)

(declare-fun mapDefault!47811 () ValueCell!14609)

(assert (=> b!1206997 (= condMapEmpty!47811 (= (arr!37679 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14609)) mapDefault!47811)))))

(declare-fun b!1206998 () Bool)

(declare-fun e!685544 () Bool)

(assert (=> b!1206998 (= e!685538 e!685544)))

(declare-fun res!802446 () Bool)

(assert (=> b!1206998 (=> (not res!802446) (not e!685544))))

(declare-fun lt!547364 () array!78087)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78087 (_ BitVec 32)) Bool)

(assert (=> b!1206998 (= res!802446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547364 mask!1564))))

(assert (=> b!1206998 (= lt!547364 (array!78088 (store (arr!37678 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38215 _keys!1208)))))

(declare-fun bm!58587 () Bool)

(declare-fun call!58596 () ListLongMap!17713)

(assert (=> bm!58587 (= call!58596 call!58593)))

(declare-fun bm!58588 () Bool)

(declare-fun call!58592 () Bool)

(assert (=> bm!58588 (= call!58592 call!58591)))

(declare-fun b!1206999 () Bool)

(declare-fun e!685535 () Bool)

(assert (=> b!1206999 (= e!685544 (not e!685535))))

(declare-fun res!802443 () Bool)

(assert (=> b!1206999 (=> res!802443 e!685535)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1206999 (= res!802443 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206999 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547372 () Unit!39931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78087 (_ BitVec 64) (_ BitVec 32)) Unit!39931)

(assert (=> b!1206999 (= lt!547372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1207000 () Bool)

(declare-fun res!802447 () Bool)

(assert (=> b!1207000 (=> (not res!802447) (not e!685538))))

(assert (=> b!1207000 (= res!802447 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38215 _keys!1208))))))

(declare-fun b!1207001 () Bool)

(declare-fun res!802433 () Bool)

(assert (=> b!1207001 (=> (not res!802433) (not e!685538))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1207001 (= res!802433 (and (= (size!38216 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38215 _keys!1208) (size!38216 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1207002 () Bool)

(declare-fun res!802442 () Bool)

(assert (=> b!1207002 (=> (not res!802442) (not e!685544))))

(declare-datatypes ((List!26545 0))(
  ( (Nil!26542) (Cons!26541 (h!27759 (_ BitVec 64)) (t!39450 List!26545)) )
))
(declare-fun arrayNoDuplicates!0 (array!78087 (_ BitVec 32) List!26545) Bool)

(assert (=> b!1207002 (= res!802442 (arrayNoDuplicates!0 lt!547364 #b00000000000000000000000000000000 Nil!26542))))

(declare-fun res!802434 () Bool)

(assert (=> start!100998 (=> (not res!802434) (not e!685538))))

(assert (=> start!100998 (= res!802434 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38215 _keys!1208))))))

(assert (=> start!100998 e!685538))

(declare-fun tp_is_empty!30637 () Bool)

(assert (=> start!100998 tp_is_empty!30637))

(declare-fun array_inv!28772 (array!78087) Bool)

(assert (=> start!100998 (array_inv!28772 _keys!1208)))

(assert (=> start!100998 true))

(assert (=> start!100998 tp!90802))

(declare-fun array_inv!28773 (array!78089) Bool)

(assert (=> start!100998 (and (array_inv!28773 _values!996) e!685542)))

(declare-fun b!1207003 () Bool)

(assert (=> b!1207003 (= e!685536 tp_is_empty!30637)))

(declare-fun zeroValue!944 () V!45977)

(declare-fun c!118730 () Bool)

(declare-fun bm!58589 () Bool)

(declare-fun lt!547367 () ListLongMap!17713)

(declare-fun c!118731 () Bool)

(assert (=> bm!58589 (= call!58594 (addStillContains!1020 lt!547367 (ite (or c!118730 c!118731) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118730 c!118731) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1207004 () Bool)

(declare-fun e!685537 () Bool)

(assert (=> b!1207004 (= e!685537 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58590 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!547362 () array!78089)

(declare-fun getCurrentListMapNoExtraKeys!5335 (array!78087 array!78089 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 32) Int) ListLongMap!17713)

(assert (=> bm!58590 (= call!58595 (getCurrentListMapNoExtraKeys!5335 lt!547364 lt!547362 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207005 () Bool)

(declare-fun e!685539 () Bool)

(assert (=> b!1207005 (= e!685539 true)))

(declare-fun e!685541 () Bool)

(assert (=> b!1207005 e!685541))

(declare-fun res!802438 () Bool)

(assert (=> b!1207005 (=> (not res!802438) (not e!685541))))

(assert (=> b!1207005 (= res!802438 e!685537)))

(declare-fun c!118728 () Bool)

(assert (=> b!1207005 (= c!118728 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547363 () Unit!39931)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!574 (array!78087 array!78089 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 64) (_ BitVec 32) Int) Unit!39931)

(assert (=> b!1207005 (= lt!547363 (lemmaListMapContainsThenArrayContainsFrom!574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547370 () Unit!39931)

(assert (=> b!1207005 (= lt!547370 e!685534)))

(declare-fun lt!547368 () Bool)

(assert (=> b!1207005 (= c!118730 (and (not lt!547368) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207005 (= lt!547368 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1207006 () Bool)

(declare-fun lt!547374 () Unit!39931)

(assert (=> b!1207006 (= e!685540 lt!547374)))

(declare-fun call!58590 () Unit!39931)

(assert (=> b!1207006 (= lt!547374 call!58590)))

(assert (=> b!1207006 call!58592))

(declare-fun b!1207007 () Bool)

(declare-fun e!685533 () Unit!39931)

(assert (=> b!1207007 (= e!685534 e!685533)))

(assert (=> b!1207007 (= c!118731 (and (not lt!547368) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58591 () Bool)

(assert (=> bm!58591 (= call!58593 (+!4036 lt!547367 (ite (or c!118730 c!118731) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!47811 () Bool)

(assert (=> mapIsEmpty!47811 mapRes!47811))

(declare-fun b!1207008 () Bool)

(declare-fun e!685546 () Bool)

(assert (=> b!1207008 (= e!685535 e!685546)))

(declare-fun res!802445 () Bool)

(assert (=> b!1207008 (=> res!802445 e!685546)))

(assert (=> b!1207008 (= res!802445 (not (= from!1455 i!673)))))

(declare-fun lt!547366 () ListLongMap!17713)

(assert (=> b!1207008 (= lt!547366 (getCurrentListMapNoExtraKeys!5335 lt!547364 lt!547362 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3258 (Int (_ BitVec 64)) V!45977)

(assert (=> b!1207008 (= lt!547362 (array!78090 (store (arr!37679 _values!996) i!673 (ValueCellFull!14609 (dynLambda!3258 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38216 _values!996)))))

(declare-fun lt!547375 () ListLongMap!17713)

(assert (=> b!1207008 (= lt!547375 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207009 () Bool)

(declare-fun res!802440 () Bool)

(assert (=> b!1207009 (=> (not res!802440) (not e!685538))))

(assert (=> b!1207009 (= res!802440 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26542))))

(declare-fun b!1207010 () Bool)

(declare-fun e!685543 () Bool)

(assert (=> b!1207010 (= e!685543 e!685539)))

(declare-fun res!802436 () Bool)

(assert (=> b!1207010 (=> res!802436 e!685539)))

(assert (=> b!1207010 (= res!802436 (not (contains!6951 lt!547367 k0!934)))))

(assert (=> b!1207010 (= lt!547367 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58592 () Bool)

(assert (=> bm!58592 (= call!58590 call!58594)))

(declare-fun bm!58593 () Bool)

(assert (=> bm!58593 (= call!58591 (contains!6951 (ite c!118730 lt!547376 call!58596) k0!934))))

(declare-fun b!1207011 () Bool)

(assert (=> b!1207011 (= e!685537 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547368) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1207012 () Bool)

(declare-fun res!802441 () Bool)

(assert (=> b!1207012 (=> (not res!802441) (not e!685538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207012 (= res!802441 (validKeyInArray!0 k0!934))))

(declare-fun b!1207013 () Bool)

(assert (=> b!1207013 (= e!685546 e!685543)))

(declare-fun res!802439 () Bool)

(assert (=> b!1207013 (=> res!802439 e!685543)))

(assert (=> b!1207013 (= res!802439 (not (= (select (arr!37678 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1207013 e!685545))

(declare-fun c!118727 () Bool)

(assert (=> b!1207013 (= c!118727 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547365 () Unit!39931)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1032 (array!78087 array!78089 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39931)

(assert (=> b!1207013 (= lt!547365 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207014 () Bool)

(declare-fun c!118729 () Bool)

(assert (=> b!1207014 (= c!118729 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547368))))

(assert (=> b!1207014 (= e!685533 e!685540)))

(declare-fun b!1207015 () Bool)

(assert (=> b!1207015 (= e!685541 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207016 () Bool)

(assert (=> b!1207016 call!58592))

(declare-fun lt!547371 () Unit!39931)

(assert (=> b!1207016 (= lt!547371 call!58590)))

(assert (=> b!1207016 (= e!685533 lt!547371)))

(declare-fun b!1207017 () Bool)

(assert (=> b!1207017 (= e!685545 (= call!58595 call!58597))))

(declare-fun bm!58594 () Bool)

(assert (=> bm!58594 (= call!58597 (getCurrentListMapNoExtraKeys!5335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207018 () Bool)

(declare-fun e!685548 () Bool)

(assert (=> b!1207018 (= e!685548 tp_is_empty!30637)))

(declare-fun mapNonEmpty!47811 () Bool)

(declare-fun tp!90801 () Bool)

(assert (=> mapNonEmpty!47811 (= mapRes!47811 (and tp!90801 e!685548))))

(declare-fun mapValue!47811 () ValueCell!14609)

(declare-fun mapKey!47811 () (_ BitVec 32))

(declare-fun mapRest!47811 () (Array (_ BitVec 32) ValueCell!14609))

(assert (=> mapNonEmpty!47811 (= (arr!37679 _values!996) (store mapRest!47811 mapKey!47811 mapValue!47811))))

(declare-fun b!1207019 () Bool)

(declare-fun res!802444 () Bool)

(assert (=> b!1207019 (=> (not res!802444) (not e!685538))))

(assert (=> b!1207019 (= res!802444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100998 res!802434) b!1206996))

(assert (= (and b!1206996 res!802435) b!1207001))

(assert (= (and b!1207001 res!802433) b!1207019))

(assert (= (and b!1207019 res!802444) b!1207009))

(assert (= (and b!1207009 res!802440) b!1207000))

(assert (= (and b!1207000 res!802447) b!1207012))

(assert (= (and b!1207012 res!802441) b!1206993))

(assert (= (and b!1206993 res!802437) b!1206998))

(assert (= (and b!1206998 res!802446) b!1207002))

(assert (= (and b!1207002 res!802442) b!1206999))

(assert (= (and b!1206999 (not res!802443)) b!1207008))

(assert (= (and b!1207008 (not res!802445)) b!1207013))

(assert (= (and b!1207013 c!118727) b!1206992))

(assert (= (and b!1207013 (not c!118727)) b!1207017))

(assert (= (or b!1206992 b!1207017) bm!58590))

(assert (= (or b!1206992 b!1207017) bm!58594))

(assert (= (and b!1207013 (not res!802439)) b!1207010))

(assert (= (and b!1207010 (not res!802436)) b!1207005))

(assert (= (and b!1207005 c!118730) b!1206994))

(assert (= (and b!1207005 (not c!118730)) b!1207007))

(assert (= (and b!1207007 c!118731) b!1207016))

(assert (= (and b!1207007 (not c!118731)) b!1207014))

(assert (= (and b!1207014 c!118729) b!1207006))

(assert (= (and b!1207014 (not c!118729)) b!1206995))

(assert (= (or b!1207016 b!1207006) bm!58592))

(assert (= (or b!1207016 b!1207006) bm!58587))

(assert (= (or b!1207016 b!1207006) bm!58588))

(assert (= (or b!1206994 bm!58588) bm!58593))

(assert (= (or b!1206994 bm!58592) bm!58589))

(assert (= (or b!1206994 bm!58587) bm!58591))

(assert (= (and b!1207005 c!118728) b!1207004))

(assert (= (and b!1207005 (not c!118728)) b!1207011))

(assert (= (and b!1207005 res!802438) b!1207015))

(assert (= (and b!1206997 condMapEmpty!47811) mapIsEmpty!47811))

(assert (= (and b!1206997 (not condMapEmpty!47811)) mapNonEmpty!47811))

(get-info :version)

(assert (= (and mapNonEmpty!47811 ((_ is ValueCellFull!14609) mapValue!47811)) b!1207018))

(assert (= (and b!1206997 ((_ is ValueCellFull!14609) mapDefault!47811)) b!1207003))

(assert (= start!100998 b!1206997))

(declare-fun b_lambda!21331 () Bool)

(assert (=> (not b_lambda!21331) (not b!1207008)))

(declare-fun t!39448 () Bool)

(declare-fun tb!10725 () Bool)

(assert (=> (and start!100998 (= defaultEntry!1004 defaultEntry!1004) t!39448) tb!10725))

(declare-fun result!22043 () Bool)

(assert (=> tb!10725 (= result!22043 tp_is_empty!30637)))

(assert (=> b!1207008 t!39448))

(declare-fun b_and!42857 () Bool)

(assert (= b_and!42855 (and (=> t!39448 result!22043) b_and!42857)))

(declare-fun m!1113125 () Bool)

(assert (=> b!1207002 m!1113125))

(declare-fun m!1113127 () Bool)

(assert (=> b!1207019 m!1113127))

(declare-fun m!1113129 () Bool)

(assert (=> b!1207012 m!1113129))

(declare-fun m!1113131 () Bool)

(assert (=> b!1207005 m!1113131))

(declare-fun m!1113133 () Bool)

(assert (=> b!1206996 m!1113133))

(declare-fun m!1113135 () Bool)

(assert (=> bm!58594 m!1113135))

(declare-fun m!1113137 () Bool)

(assert (=> b!1207008 m!1113137))

(declare-fun m!1113139 () Bool)

(assert (=> b!1207008 m!1113139))

(declare-fun m!1113141 () Bool)

(assert (=> b!1207008 m!1113141))

(declare-fun m!1113143 () Bool)

(assert (=> b!1207008 m!1113143))

(declare-fun m!1113145 () Bool)

(assert (=> b!1207004 m!1113145))

(declare-fun m!1113147 () Bool)

(assert (=> b!1207010 m!1113147))

(assert (=> b!1207010 m!1113135))

(declare-fun m!1113149 () Bool)

(assert (=> b!1206992 m!1113149))

(assert (=> b!1207015 m!1113145))

(declare-fun m!1113151 () Bool)

(assert (=> b!1206998 m!1113151))

(declare-fun m!1113153 () Bool)

(assert (=> b!1206998 m!1113153))

(declare-fun m!1113155 () Bool)

(assert (=> b!1207009 m!1113155))

(declare-fun m!1113157 () Bool)

(assert (=> bm!58593 m!1113157))

(declare-fun m!1113159 () Bool)

(assert (=> b!1206994 m!1113159))

(declare-fun m!1113161 () Bool)

(assert (=> b!1206994 m!1113161))

(assert (=> b!1206994 m!1113161))

(declare-fun m!1113163 () Bool)

(assert (=> b!1206994 m!1113163))

(declare-fun m!1113165 () Bool)

(assert (=> b!1207013 m!1113165))

(declare-fun m!1113167 () Bool)

(assert (=> b!1207013 m!1113167))

(declare-fun m!1113169 () Bool)

(assert (=> start!100998 m!1113169))

(declare-fun m!1113171 () Bool)

(assert (=> start!100998 m!1113171))

(declare-fun m!1113173 () Bool)

(assert (=> b!1206999 m!1113173))

(declare-fun m!1113175 () Bool)

(assert (=> b!1206999 m!1113175))

(declare-fun m!1113177 () Bool)

(assert (=> bm!58590 m!1113177))

(declare-fun m!1113179 () Bool)

(assert (=> bm!58591 m!1113179))

(declare-fun m!1113181 () Bool)

(assert (=> b!1206993 m!1113181))

(declare-fun m!1113183 () Bool)

(assert (=> bm!58589 m!1113183))

(declare-fun m!1113185 () Bool)

(assert (=> mapNonEmpty!47811 m!1113185))

(check-sat (not b!1206996) (not start!100998) (not b!1207002) (not mapNonEmpty!47811) (not b!1207004) (not bm!58590) (not b!1207009) (not b!1207019) (not b!1207010) (not bm!58593) (not b!1207005) (not b!1207008) b_and!42857 (not b!1207015) (not bm!58589) (not b!1206992) (not b_next!25933) (not b!1206999) tp_is_empty!30637 (not b!1207012) (not b_lambda!21331) (not b!1206994) (not b!1206998) (not bm!58594) (not b!1207013) (not bm!58591))
(check-sat b_and!42857 (not b_next!25933))
