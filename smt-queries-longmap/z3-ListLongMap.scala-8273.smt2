; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100680 () Bool)

(assert start!100680)

(declare-fun b_free!25911 () Bool)

(declare-fun b_next!25911 () Bool)

(assert (=> start!100680 (= b_free!25911 (not b_next!25911))))

(declare-fun tp!90729 () Bool)

(declare-fun b_and!42769 () Bool)

(assert (=> start!100680 (= tp!90729 b_and!42769)))

(declare-fun mapIsEmpty!47772 () Bool)

(declare-fun mapRes!47772 () Bool)

(assert (=> mapIsEmpty!47772 mapRes!47772))

(declare-fun b!1204425 () Bool)

(declare-fun e!683970 () Bool)

(declare-fun e!683961 () Bool)

(assert (=> b!1204425 (= e!683970 e!683961)))

(declare-fun res!801297 () Bool)

(assert (=> b!1204425 (=> (not res!801297) (not e!683961))))

(declare-datatypes ((array!78007 0))(
  ( (array!78008 (arr!37646 (Array (_ BitVec 32) (_ BitVec 64))) (size!38182 (_ BitVec 32))) )
))
(declare-fun lt!546181 () array!78007)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78007 (_ BitVec 32)) Bool)

(assert (=> b!1204425 (= res!801297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546181 mask!1564))))

(declare-fun _keys!1208 () array!78007)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204425 (= lt!546181 (array!78008 (store (arr!37646 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38182 _keys!1208)))))

(declare-fun bm!58217 () Bool)

(declare-datatypes ((V!45947 0))(
  ( (V!45948 (val!15364 Int)) )
))
(declare-datatypes ((tuple2!19700 0))(
  ( (tuple2!19701 (_1!9861 (_ BitVec 64)) (_2!9861 V!45947)) )
))
(declare-datatypes ((List!26509 0))(
  ( (Nil!26506) (Cons!26505 (h!27714 tuple2!19700) (t!39400 List!26509)) )
))
(declare-datatypes ((ListLongMap!17669 0))(
  ( (ListLongMap!17670 (toList!8850 List!26509)) )
))
(declare-fun call!58227 () ListLongMap!17669)

(declare-fun call!58224 () ListLongMap!17669)

(assert (=> bm!58217 (= call!58227 call!58224)))

(declare-fun b!1204426 () Bool)

(declare-fun res!801308 () Bool)

(assert (=> b!1204426 (=> (not res!801308) (not e!683970))))

(assert (=> b!1204426 (= res!801308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204427 () Bool)

(declare-fun e!683963 () Bool)

(assert (=> b!1204427 (= e!683961 (not e!683963))))

(declare-fun res!801305 () Bool)

(assert (=> b!1204427 (=> res!801305 e!683963)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1204427 (= res!801305 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204427 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39936 0))(
  ( (Unit!39937) )
))
(declare-fun lt!546172 () Unit!39936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78007 (_ BitVec 64) (_ BitVec 32)) Unit!39936)

(assert (=> b!1204427 (= lt!546172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1204428 () Bool)

(declare-fun e!683958 () Bool)

(assert (=> b!1204428 (= e!683958 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204429 () Bool)

(declare-fun c!118078 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!546168 () Bool)

(assert (=> b!1204429 (= c!118078 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546168))))

(declare-fun e!683959 () Unit!39936)

(declare-fun e!683969 () Unit!39936)

(assert (=> b!1204429 (= e!683959 e!683969)))

(declare-fun b!1204430 () Bool)

(declare-fun e!683971 () Bool)

(declare-fun call!58221 () ListLongMap!17669)

(declare-fun call!58223 () ListLongMap!17669)

(assert (=> b!1204430 (= e!683971 (= call!58221 call!58223))))

(declare-fun b!1204431 () Bool)

(declare-fun e!683957 () Unit!39936)

(assert (=> b!1204431 (= e!683957 e!683959)))

(declare-fun c!118074 () Bool)

(assert (=> b!1204431 (= c!118074 (and (not lt!546168) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204432 () Bool)

(declare-fun e!683964 () Bool)

(declare-fun e!683968 () Bool)

(assert (=> b!1204432 (= e!683964 e!683968)))

(declare-fun res!801302 () Bool)

(assert (=> b!1204432 (=> res!801302 e!683968)))

(declare-fun lt!546176 () ListLongMap!17669)

(declare-fun contains!6908 (ListLongMap!17669 (_ BitVec 64)) Bool)

(assert (=> b!1204432 (= res!801302 (not (contains!6908 lt!546176 k0!934)))))

(declare-fun zeroValue!944 () V!45947)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14598 0))(
  ( (ValueCellFull!14598 (v!18006 V!45947)) (EmptyCell!14598) )
))
(declare-datatypes ((array!78009 0))(
  ( (array!78010 (arr!37647 (Array (_ BitVec 32) ValueCell!14598)) (size!38183 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78009)

(declare-fun minValue!944 () V!45947)

(declare-fun getCurrentListMapNoExtraKeys!5286 (array!78007 array!78009 (_ BitVec 32) (_ BitVec 32) V!45947 V!45947 (_ BitVec 32) Int) ListLongMap!17669)

(assert (=> b!1204432 (= lt!546176 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58218 () Bool)

(declare-fun call!58222 () Unit!39936)

(declare-fun call!58225 () Unit!39936)

(assert (=> bm!58218 (= call!58222 call!58225)))

(declare-fun b!1204433 () Bool)

(declare-fun res!801306 () Bool)

(assert (=> b!1204433 (=> (not res!801306) (not e!683970))))

(assert (=> b!1204433 (= res!801306 (and (= (size!38183 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38182 _keys!1208) (size!38183 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!58219 () Bool)

(declare-fun call!58220 () Bool)

(declare-fun call!58226 () Bool)

(assert (=> bm!58219 (= call!58220 call!58226)))

(declare-fun b!1204434 () Bool)

(assert (=> b!1204434 (= e!683968 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204434 e!683958))

(declare-fun c!118076 () Bool)

(assert (=> b!1204434 (= c!118076 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546171 () Unit!39936)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!561 (array!78007 array!78009 (_ BitVec 32) (_ BitVec 32) V!45947 V!45947 (_ BitVec 64) (_ BitVec 32) Int) Unit!39936)

(assert (=> b!1204434 (= lt!546171 (lemmaListMapContainsThenArrayContainsFrom!561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546182 () Unit!39936)

(assert (=> b!1204434 (= lt!546182 e!683957)))

(declare-fun c!118075 () Bool)

(assert (=> b!1204434 (= c!118075 (and (not lt!546168) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204434 (= lt!546168 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1204435 () Bool)

(declare-fun e!683967 () Bool)

(assert (=> b!1204435 (= e!683967 e!683964)))

(declare-fun res!801299 () Bool)

(assert (=> b!1204435 (=> res!801299 e!683964)))

(assert (=> b!1204435 (= res!801299 (not (= (select (arr!37646 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1204435 e!683971))

(declare-fun c!118077 () Bool)

(assert (=> b!1204435 (= c!118077 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546175 () Unit!39936)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1020 (array!78007 array!78009 (_ BitVec 32) (_ BitVec 32) V!45947 V!45947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39936)

(assert (=> b!1204435 (= lt!546175 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1020 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204436 () Bool)

(assert (=> b!1204436 (= e!683958 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546168) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1204437 () Bool)

(declare-fun res!801303 () Bool)

(assert (=> b!1204437 (=> (not res!801303) (not e!683970))))

(assert (=> b!1204437 (= res!801303 (= (select (arr!37646 _keys!1208) i!673) k0!934))))

(declare-fun b!1204438 () Bool)

(declare-fun res!801298 () Bool)

(assert (=> b!1204438 (=> (not res!801298) (not e!683970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204438 (= res!801298 (validMask!0 mask!1564))))

(declare-fun b!1204439 () Bool)

(declare-fun -!1816 (ListLongMap!17669 (_ BitVec 64)) ListLongMap!17669)

(assert (=> b!1204439 (= e!683971 (= call!58221 (-!1816 call!58223 k0!934)))))

(declare-fun b!1204440 () Bool)

(declare-fun res!801300 () Bool)

(assert (=> b!1204440 (=> (not res!801300) (not e!683970))))

(assert (=> b!1204440 (= res!801300 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38182 _keys!1208))))))

(declare-fun bm!58220 () Bool)

(assert (=> bm!58220 (= call!58223 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204441 () Bool)

(assert (=> b!1204441 (= e!683963 e!683967)))

(declare-fun res!801304 () Bool)

(assert (=> b!1204441 (=> res!801304 e!683967)))

(assert (=> b!1204441 (= res!801304 (not (= from!1455 i!673)))))

(declare-fun lt!546170 () ListLongMap!17669)

(declare-fun lt!546180 () array!78009)

(assert (=> b!1204441 (= lt!546170 (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3197 (Int (_ BitVec 64)) V!45947)

(assert (=> b!1204441 (= lt!546180 (array!78010 (store (arr!37647 _values!996) i!673 (ValueCellFull!14598 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38183 _values!996)))))

(declare-fun lt!546177 () ListLongMap!17669)

(assert (=> b!1204441 (= lt!546177 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1204442 () Bool)

(declare-fun e!683962 () Bool)

(declare-fun tp_is_empty!30615 () Bool)

(assert (=> b!1204442 (= e!683962 tp_is_empty!30615)))

(declare-fun bm!58221 () Bool)

(declare-fun addStillContains!1005 (ListLongMap!17669 (_ BitVec 64) V!45947 (_ BitVec 64)) Unit!39936)

(assert (=> bm!58221 (= call!58225 (addStillContains!1005 lt!546176 (ite (or c!118075 c!118074) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118075 c!118074) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1204443 () Bool)

(declare-fun e!683966 () Bool)

(assert (=> b!1204443 (= e!683966 (and e!683962 mapRes!47772))))

(declare-fun condMapEmpty!47772 () Bool)

(declare-fun mapDefault!47772 () ValueCell!14598)

(assert (=> b!1204443 (= condMapEmpty!47772 (= (arr!37647 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14598)) mapDefault!47772)))))

(declare-fun bm!58222 () Bool)

(declare-fun lt!546178 () ListLongMap!17669)

(declare-fun +!3976 (ListLongMap!17669 tuple2!19700) ListLongMap!17669)

(assert (=> bm!58222 (= call!58224 (+!3976 (ite c!118075 lt!546178 lt!546176) (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204444 () Bool)

(declare-fun e!683965 () Bool)

(assert (=> b!1204444 (= e!683965 tp_is_empty!30615)))

(declare-fun b!1204445 () Bool)

(assert (=> b!1204445 call!58220))

(declare-fun lt!546174 () Unit!39936)

(assert (=> b!1204445 (= lt!546174 call!58222)))

(assert (=> b!1204445 (= e!683959 lt!546174)))

(declare-fun mapNonEmpty!47772 () Bool)

(declare-fun tp!90730 () Bool)

(assert (=> mapNonEmpty!47772 (= mapRes!47772 (and tp!90730 e!683965))))

(declare-fun mapValue!47772 () ValueCell!14598)

(declare-fun mapKey!47772 () (_ BitVec 32))

(declare-fun mapRest!47772 () (Array (_ BitVec 32) ValueCell!14598))

(assert (=> mapNonEmpty!47772 (= (arr!37647 _values!996) (store mapRest!47772 mapKey!47772 mapValue!47772))))

(declare-fun b!1204446 () Bool)

(declare-fun lt!546179 () Unit!39936)

(assert (=> b!1204446 (= e!683957 lt!546179)))

(declare-fun lt!546173 () Unit!39936)

(assert (=> b!1204446 (= lt!546173 call!58225)))

(assert (=> b!1204446 (= lt!546178 (+!3976 lt!546176 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1204446 call!58226))

(assert (=> b!1204446 (= lt!546179 (addStillContains!1005 lt!546178 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1204446 (contains!6908 call!58224 k0!934)))

(declare-fun res!801301 () Bool)

(assert (=> start!100680 (=> (not res!801301) (not e!683970))))

(assert (=> start!100680 (= res!801301 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38182 _keys!1208))))))

(assert (=> start!100680 e!683970))

(assert (=> start!100680 tp_is_empty!30615))

(declare-fun array_inv!28682 (array!78007) Bool)

(assert (=> start!100680 (array_inv!28682 _keys!1208)))

(assert (=> start!100680 true))

(assert (=> start!100680 tp!90729))

(declare-fun array_inv!28683 (array!78009) Bool)

(assert (=> start!100680 (and (array_inv!28683 _values!996) e!683966)))

(declare-fun b!1204447 () Bool)

(declare-fun res!801307 () Bool)

(assert (=> b!1204447 (=> (not res!801307) (not e!683970))))

(declare-datatypes ((List!26510 0))(
  ( (Nil!26507) (Cons!26506 (h!27715 (_ BitVec 64)) (t!39401 List!26510)) )
))
(declare-fun arrayNoDuplicates!0 (array!78007 (_ BitVec 32) List!26510) Bool)

(assert (=> b!1204447 (= res!801307 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26507))))

(declare-fun b!1204448 () Bool)

(declare-fun res!801296 () Bool)

(assert (=> b!1204448 (=> (not res!801296) (not e!683961))))

(assert (=> b!1204448 (= res!801296 (arrayNoDuplicates!0 lt!546181 #b00000000000000000000000000000000 Nil!26507))))

(declare-fun b!1204449 () Bool)

(declare-fun lt!546169 () Unit!39936)

(assert (=> b!1204449 (= e!683969 lt!546169)))

(assert (=> b!1204449 (= lt!546169 call!58222)))

(assert (=> b!1204449 call!58220))

(declare-fun b!1204450 () Bool)

(declare-fun res!801309 () Bool)

(assert (=> b!1204450 (=> (not res!801309) (not e!683970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204450 (= res!801309 (validKeyInArray!0 k0!934))))

(declare-fun b!1204451 () Bool)

(declare-fun Unit!39938 () Unit!39936)

(assert (=> b!1204451 (= e!683969 Unit!39938)))

(declare-fun bm!58223 () Bool)

(assert (=> bm!58223 (= call!58221 (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58224 () Bool)

(assert (=> bm!58224 (= call!58226 (contains!6908 (ite c!118075 lt!546178 call!58227) k0!934))))

(assert (= (and start!100680 res!801301) b!1204438))

(assert (= (and b!1204438 res!801298) b!1204433))

(assert (= (and b!1204433 res!801306) b!1204426))

(assert (= (and b!1204426 res!801308) b!1204447))

(assert (= (and b!1204447 res!801307) b!1204440))

(assert (= (and b!1204440 res!801300) b!1204450))

(assert (= (and b!1204450 res!801309) b!1204437))

(assert (= (and b!1204437 res!801303) b!1204425))

(assert (= (and b!1204425 res!801297) b!1204448))

(assert (= (and b!1204448 res!801296) b!1204427))

(assert (= (and b!1204427 (not res!801305)) b!1204441))

(assert (= (and b!1204441 (not res!801304)) b!1204435))

(assert (= (and b!1204435 c!118077) b!1204439))

(assert (= (and b!1204435 (not c!118077)) b!1204430))

(assert (= (or b!1204439 b!1204430) bm!58223))

(assert (= (or b!1204439 b!1204430) bm!58220))

(assert (= (and b!1204435 (not res!801299)) b!1204432))

(assert (= (and b!1204432 (not res!801302)) b!1204434))

(assert (= (and b!1204434 c!118075) b!1204446))

(assert (= (and b!1204434 (not c!118075)) b!1204431))

(assert (= (and b!1204431 c!118074) b!1204445))

(assert (= (and b!1204431 (not c!118074)) b!1204429))

(assert (= (and b!1204429 c!118078) b!1204449))

(assert (= (and b!1204429 (not c!118078)) b!1204451))

(assert (= (or b!1204445 b!1204449) bm!58218))

(assert (= (or b!1204445 b!1204449) bm!58217))

(assert (= (or b!1204445 b!1204449) bm!58219))

(assert (= (or b!1204446 bm!58219) bm!58224))

(assert (= (or b!1204446 bm!58218) bm!58221))

(assert (= (or b!1204446 bm!58217) bm!58222))

(assert (= (and b!1204434 c!118076) b!1204428))

(assert (= (and b!1204434 (not c!118076)) b!1204436))

(assert (= (and b!1204443 condMapEmpty!47772) mapIsEmpty!47772))

(assert (= (and b!1204443 (not condMapEmpty!47772)) mapNonEmpty!47772))

(get-info :version)

(assert (= (and mapNonEmpty!47772 ((_ is ValueCellFull!14598) mapValue!47772)) b!1204444))

(assert (= (and b!1204443 ((_ is ValueCellFull!14598) mapDefault!47772)) b!1204442))

(assert (= start!100680 b!1204443))

(declare-fun b_lambda!21231 () Bool)

(assert (=> (not b_lambda!21231) (not b!1204441)))

(declare-fun t!39399 () Bool)

(declare-fun tb!10711 () Bool)

(assert (=> (and start!100680 (= defaultEntry!1004 defaultEntry!1004) t!39399) tb!10711))

(declare-fun result!22003 () Bool)

(assert (=> tb!10711 (= result!22003 tp_is_empty!30615)))

(assert (=> b!1204441 t!39399))

(declare-fun b_and!42771 () Bool)

(assert (= b_and!42769 (and (=> t!39399 result!22003) b_and!42771)))

(declare-fun m!1110403 () Bool)

(assert (=> b!1204450 m!1110403))

(declare-fun m!1110405 () Bool)

(assert (=> b!1204425 m!1110405))

(declare-fun m!1110407 () Bool)

(assert (=> b!1204425 m!1110407))

(declare-fun m!1110409 () Bool)

(assert (=> bm!58220 m!1110409))

(declare-fun m!1110411 () Bool)

(assert (=> b!1204435 m!1110411))

(declare-fun m!1110413 () Bool)

(assert (=> b!1204435 m!1110413))

(declare-fun m!1110415 () Bool)

(assert (=> b!1204426 m!1110415))

(declare-fun m!1110417 () Bool)

(assert (=> b!1204447 m!1110417))

(declare-fun m!1110419 () Bool)

(assert (=> b!1204438 m!1110419))

(declare-fun m!1110421 () Bool)

(assert (=> b!1204439 m!1110421))

(declare-fun m!1110423 () Bool)

(assert (=> bm!58223 m!1110423))

(declare-fun m!1110425 () Bool)

(assert (=> start!100680 m!1110425))

(declare-fun m!1110427 () Bool)

(assert (=> start!100680 m!1110427))

(declare-fun m!1110429 () Bool)

(assert (=> bm!58221 m!1110429))

(declare-fun m!1110431 () Bool)

(assert (=> b!1204432 m!1110431))

(assert (=> b!1204432 m!1110409))

(declare-fun m!1110433 () Bool)

(assert (=> b!1204437 m!1110433))

(declare-fun m!1110435 () Bool)

(assert (=> b!1204428 m!1110435))

(declare-fun m!1110437 () Bool)

(assert (=> b!1204448 m!1110437))

(declare-fun m!1110439 () Bool)

(assert (=> bm!58222 m!1110439))

(declare-fun m!1110441 () Bool)

(assert (=> b!1204427 m!1110441))

(declare-fun m!1110443 () Bool)

(assert (=> b!1204427 m!1110443))

(declare-fun m!1110445 () Bool)

(assert (=> mapNonEmpty!47772 m!1110445))

(declare-fun m!1110447 () Bool)

(assert (=> b!1204441 m!1110447))

(declare-fun m!1110449 () Bool)

(assert (=> b!1204441 m!1110449))

(declare-fun m!1110451 () Bool)

(assert (=> b!1204441 m!1110451))

(declare-fun m!1110453 () Bool)

(assert (=> b!1204441 m!1110453))

(declare-fun m!1110455 () Bool)

(assert (=> bm!58224 m!1110455))

(assert (=> b!1204434 m!1110435))

(declare-fun m!1110457 () Bool)

(assert (=> b!1204434 m!1110457))

(declare-fun m!1110459 () Bool)

(assert (=> b!1204446 m!1110459))

(declare-fun m!1110461 () Bool)

(assert (=> b!1204446 m!1110461))

(declare-fun m!1110463 () Bool)

(assert (=> b!1204446 m!1110463))

(check-sat (not bm!58222) (not b!1204425) (not b_lambda!21231) (not b!1204432) (not bm!58224) (not b!1204427) (not b!1204447) tp_is_empty!30615 (not b!1204438) (not bm!58221) (not b!1204450) (not mapNonEmpty!47772) (not b_next!25911) (not b!1204428) (not start!100680) (not bm!58220) (not b!1204435) (not b!1204448) (not b!1204446) (not b!1204426) (not b!1204441) (not bm!58223) b_and!42771 (not b!1204439) (not b!1204434))
(check-sat b_and!42771 (not b_next!25911))
(get-model)

(declare-fun b_lambda!21235 () Bool)

(assert (= b_lambda!21231 (or (and start!100680 b_free!25911) b_lambda!21235)))

(check-sat (not bm!58222) (not b!1204425) (not b!1204432) (not b!1204427) (not b!1204447) tp_is_empty!30615 (not b!1204438) (not bm!58221) (not b!1204450) (not mapNonEmpty!47772) (not b_next!25911) (not b!1204428) (not start!100680) (not bm!58220) (not bm!58224) (not b_lambda!21235) (not b!1204435) (not b!1204448) (not b!1204446) (not b!1204426) (not b!1204441) (not bm!58223) b_and!42771 (not b!1204439) (not b!1204434))
(check-sat b_and!42771 (not b_next!25911))
(get-model)

(declare-fun d!132783 () Bool)

(assert (=> d!132783 (contains!6908 (+!3976 lt!546176 (tuple2!19701 (ite (or c!118075 c!118074) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118075 c!118074) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546230 () Unit!39936)

(declare-fun choose!1792 (ListLongMap!17669 (_ BitVec 64) V!45947 (_ BitVec 64)) Unit!39936)

(assert (=> d!132783 (= lt!546230 (choose!1792 lt!546176 (ite (or c!118075 c!118074) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118075 c!118074) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132783 (contains!6908 lt!546176 k0!934)))

(assert (=> d!132783 (= (addStillContains!1005 lt!546176 (ite (or c!118075 c!118074) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118075 c!118074) zeroValue!944 minValue!944) k0!934) lt!546230)))

(declare-fun bs!34089 () Bool)

(assert (= bs!34089 d!132783))

(declare-fun m!1110527 () Bool)

(assert (=> bs!34089 m!1110527))

(assert (=> bs!34089 m!1110527))

(declare-fun m!1110529 () Bool)

(assert (=> bs!34089 m!1110529))

(declare-fun m!1110531 () Bool)

(assert (=> bs!34089 m!1110531))

(assert (=> bs!34089 m!1110431))

(assert (=> bm!58221 d!132783))

(declare-fun d!132785 () Bool)

(declare-fun res!801357 () Bool)

(declare-fun e!684024 () Bool)

(assert (=> d!132785 (=> res!801357 e!684024)))

(assert (=> d!132785 (= res!801357 (bvsge #b00000000000000000000000000000000 (size!38182 lt!546181)))))

(assert (=> d!132785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546181 mask!1564) e!684024)))

(declare-fun b!1204546 () Bool)

(declare-fun e!684023 () Bool)

(declare-fun call!58254 () Bool)

(assert (=> b!1204546 (= e!684023 call!58254)))

(declare-fun b!1204547 () Bool)

(assert (=> b!1204547 (= e!684024 e!684023)))

(declare-fun c!118096 () Bool)

(assert (=> b!1204547 (= c!118096 (validKeyInArray!0 (select (arr!37646 lt!546181) #b00000000000000000000000000000000)))))

(declare-fun b!1204548 () Bool)

(declare-fun e!684025 () Bool)

(assert (=> b!1204548 (= e!684025 call!58254)))

(declare-fun b!1204549 () Bool)

(assert (=> b!1204549 (= e!684023 e!684025)))

(declare-fun lt!546237 () (_ BitVec 64))

(assert (=> b!1204549 (= lt!546237 (select (arr!37646 lt!546181) #b00000000000000000000000000000000))))

(declare-fun lt!546239 () Unit!39936)

(assert (=> b!1204549 (= lt!546239 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546181 lt!546237 #b00000000000000000000000000000000))))

(assert (=> b!1204549 (arrayContainsKey!0 lt!546181 lt!546237 #b00000000000000000000000000000000)))

(declare-fun lt!546238 () Unit!39936)

(assert (=> b!1204549 (= lt!546238 lt!546239)))

(declare-fun res!801356 () Bool)

(declare-datatypes ((SeekEntryResult!9935 0))(
  ( (MissingZero!9935 (index!42111 (_ BitVec 32))) (Found!9935 (index!42112 (_ BitVec 32))) (Intermediate!9935 (undefined!10747 Bool) (index!42113 (_ BitVec 32)) (x!106418 (_ BitVec 32))) (Undefined!9935) (MissingVacant!9935 (index!42114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78007 (_ BitVec 32)) SeekEntryResult!9935)

(assert (=> b!1204549 (= res!801356 (= (seekEntryOrOpen!0 (select (arr!37646 lt!546181) #b00000000000000000000000000000000) lt!546181 mask!1564) (Found!9935 #b00000000000000000000000000000000)))))

(assert (=> b!1204549 (=> (not res!801356) (not e!684025))))

(declare-fun bm!58251 () Bool)

(assert (=> bm!58251 (= call!58254 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546181 mask!1564))))

(assert (= (and d!132785 (not res!801357)) b!1204547))

(assert (= (and b!1204547 c!118096) b!1204549))

(assert (= (and b!1204547 (not c!118096)) b!1204546))

(assert (= (and b!1204549 res!801356) b!1204548))

(assert (= (or b!1204548 b!1204546) bm!58251))

(declare-fun m!1110533 () Bool)

(assert (=> b!1204547 m!1110533))

(assert (=> b!1204547 m!1110533))

(declare-fun m!1110535 () Bool)

(assert (=> b!1204547 m!1110535))

(assert (=> b!1204549 m!1110533))

(declare-fun m!1110537 () Bool)

(assert (=> b!1204549 m!1110537))

(declare-fun m!1110539 () Bool)

(assert (=> b!1204549 m!1110539))

(assert (=> b!1204549 m!1110533))

(declare-fun m!1110541 () Bool)

(assert (=> b!1204549 m!1110541))

(declare-fun m!1110543 () Bool)

(assert (=> bm!58251 m!1110543))

(assert (=> b!1204425 d!132785))

(declare-fun d!132787 () Bool)

(assert (=> d!132787 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204450 d!132787))

(declare-fun b!1204574 () Bool)

(declare-fun lt!546256 () Unit!39936)

(declare-fun lt!546254 () Unit!39936)

(assert (=> b!1204574 (= lt!546256 lt!546254)))

(declare-fun lt!546255 () V!45947)

(declare-fun lt!546257 () (_ BitVec 64))

(declare-fun lt!546259 () (_ BitVec 64))

(declare-fun lt!546260 () ListLongMap!17669)

(assert (=> b!1204574 (not (contains!6908 (+!3976 lt!546260 (tuple2!19701 lt!546259 lt!546255)) lt!546257))))

(declare-fun addStillNotContains!290 (ListLongMap!17669 (_ BitVec 64) V!45947 (_ BitVec 64)) Unit!39936)

(assert (=> b!1204574 (= lt!546254 (addStillNotContains!290 lt!546260 lt!546259 lt!546255 lt!546257))))

(assert (=> b!1204574 (= lt!546257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19189 (ValueCell!14598 V!45947) V!45947)

(assert (=> b!1204574 (= lt!546255 (get!19189 (select (arr!37647 lt!546180) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204574 (= lt!546259 (select (arr!37646 lt!546181) from!1455))))

(declare-fun call!58257 () ListLongMap!17669)

(assert (=> b!1204574 (= lt!546260 call!58257)))

(declare-fun e!684044 () ListLongMap!17669)

(assert (=> b!1204574 (= e!684044 (+!3976 call!58257 (tuple2!19701 (select (arr!37646 lt!546181) from!1455) (get!19189 (select (arr!37647 lt!546180) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204575 () Bool)

(declare-fun e!684046 () ListLongMap!17669)

(assert (=> b!1204575 (= e!684046 e!684044)))

(declare-fun c!118107 () Bool)

(assert (=> b!1204575 (= c!118107 (validKeyInArray!0 (select (arr!37646 lt!546181) from!1455)))))

(declare-fun b!1204577 () Bool)

(assert (=> b!1204577 (= e!684046 (ListLongMap!17670 Nil!26506))))

(declare-fun b!1204578 () Bool)

(declare-fun res!801368 () Bool)

(declare-fun e!684045 () Bool)

(assert (=> b!1204578 (=> (not res!801368) (not e!684045))))

(declare-fun lt!546258 () ListLongMap!17669)

(assert (=> b!1204578 (= res!801368 (not (contains!6908 lt!546258 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204579 () Bool)

(declare-fun e!684040 () Bool)

(assert (=> b!1204579 (= e!684040 (= lt!546258 (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58254 () Bool)

(assert (=> bm!58254 (= call!58257 (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204580 () Bool)

(declare-fun e!684043 () Bool)

(declare-fun e!684042 () Bool)

(assert (=> b!1204580 (= e!684043 e!684042)))

(assert (=> b!1204580 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38182 lt!546181)))))

(declare-fun res!801366 () Bool)

(assert (=> b!1204580 (= res!801366 (contains!6908 lt!546258 (select (arr!37646 lt!546181) from!1455)))))

(assert (=> b!1204580 (=> (not res!801366) (not e!684042))))

(declare-fun b!1204581 () Bool)

(assert (=> b!1204581 (= e!684045 e!684043)))

(declare-fun c!118108 () Bool)

(declare-fun e!684041 () Bool)

(assert (=> b!1204581 (= c!118108 e!684041)))

(declare-fun res!801367 () Bool)

(assert (=> b!1204581 (=> (not res!801367) (not e!684041))))

(assert (=> b!1204581 (= res!801367 (bvslt from!1455 (size!38182 lt!546181)))))

(declare-fun b!1204582 () Bool)

(declare-fun isEmpty!984 (ListLongMap!17669) Bool)

(assert (=> b!1204582 (= e!684040 (isEmpty!984 lt!546258))))

(declare-fun b!1204583 () Bool)

(assert (=> b!1204583 (= e!684044 call!58257)))

(declare-fun b!1204584 () Bool)

(assert (=> b!1204584 (= e!684041 (validKeyInArray!0 (select (arr!37646 lt!546181) from!1455)))))

(assert (=> b!1204584 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204585 () Bool)

(assert (=> b!1204585 (= e!684043 e!684040)))

(declare-fun c!118106 () Bool)

(assert (=> b!1204585 (= c!118106 (bvslt from!1455 (size!38182 lt!546181)))))

(declare-fun b!1204576 () Bool)

(assert (=> b!1204576 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38182 lt!546181)))))

(assert (=> b!1204576 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38183 lt!546180)))))

(declare-fun apply!962 (ListLongMap!17669 (_ BitVec 64)) V!45947)

(assert (=> b!1204576 (= e!684042 (= (apply!962 lt!546258 (select (arr!37646 lt!546181) from!1455)) (get!19189 (select (arr!37647 lt!546180) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132789 () Bool)

(assert (=> d!132789 e!684045))

(declare-fun res!801369 () Bool)

(assert (=> d!132789 (=> (not res!801369) (not e!684045))))

(assert (=> d!132789 (= res!801369 (not (contains!6908 lt!546258 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132789 (= lt!546258 e!684046)))

(declare-fun c!118105 () Bool)

(assert (=> d!132789 (= c!118105 (bvsge from!1455 (size!38182 lt!546181)))))

(assert (=> d!132789 (validMask!0 mask!1564)))

(assert (=> d!132789 (= (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546258)))

(assert (= (and d!132789 c!118105) b!1204577))

(assert (= (and d!132789 (not c!118105)) b!1204575))

(assert (= (and b!1204575 c!118107) b!1204574))

(assert (= (and b!1204575 (not c!118107)) b!1204583))

(assert (= (or b!1204574 b!1204583) bm!58254))

(assert (= (and d!132789 res!801369) b!1204578))

(assert (= (and b!1204578 res!801368) b!1204581))

(assert (= (and b!1204581 res!801367) b!1204584))

(assert (= (and b!1204581 c!118108) b!1204580))

(assert (= (and b!1204581 (not c!118108)) b!1204585))

(assert (= (and b!1204580 res!801366) b!1204576))

(assert (= (and b!1204585 c!118106) b!1204579))

(assert (= (and b!1204585 (not c!118106)) b!1204582))

(declare-fun b_lambda!21237 () Bool)

(assert (=> (not b_lambda!21237) (not b!1204574)))

(assert (=> b!1204574 t!39399))

(declare-fun b_and!42777 () Bool)

(assert (= b_and!42771 (and (=> t!39399 result!22003) b_and!42777)))

(declare-fun b_lambda!21239 () Bool)

(assert (=> (not b_lambda!21239) (not b!1204576)))

(assert (=> b!1204576 t!39399))

(declare-fun b_and!42779 () Bool)

(assert (= b_and!42777 (and (=> t!39399 result!22003) b_and!42779)))

(declare-fun m!1110545 () Bool)

(assert (=> b!1204574 m!1110545))

(declare-fun m!1110547 () Bool)

(assert (=> b!1204574 m!1110547))

(declare-fun m!1110549 () Bool)

(assert (=> b!1204574 m!1110549))

(declare-fun m!1110551 () Bool)

(assert (=> b!1204574 m!1110551))

(declare-fun m!1110553 () Bool)

(assert (=> b!1204574 m!1110553))

(declare-fun m!1110555 () Bool)

(assert (=> b!1204574 m!1110555))

(assert (=> b!1204574 m!1110449))

(assert (=> b!1204574 m!1110547))

(assert (=> b!1204574 m!1110555))

(assert (=> b!1204574 m!1110449))

(declare-fun m!1110557 () Bool)

(assert (=> b!1204574 m!1110557))

(assert (=> b!1204576 m!1110545))

(assert (=> b!1204576 m!1110545))

(declare-fun m!1110559 () Bool)

(assert (=> b!1204576 m!1110559))

(assert (=> b!1204576 m!1110555))

(assert (=> b!1204576 m!1110449))

(assert (=> b!1204576 m!1110557))

(assert (=> b!1204576 m!1110555))

(assert (=> b!1204576 m!1110449))

(declare-fun m!1110561 () Bool)

(assert (=> b!1204578 m!1110561))

(assert (=> b!1204580 m!1110545))

(assert (=> b!1204580 m!1110545))

(declare-fun m!1110563 () Bool)

(assert (=> b!1204580 m!1110563))

(declare-fun m!1110565 () Bool)

(assert (=> d!132789 m!1110565))

(assert (=> d!132789 m!1110419))

(declare-fun m!1110567 () Bool)

(assert (=> b!1204579 m!1110567))

(assert (=> bm!58254 m!1110567))

(assert (=> b!1204584 m!1110545))

(assert (=> b!1204584 m!1110545))

(declare-fun m!1110569 () Bool)

(assert (=> b!1204584 m!1110569))

(assert (=> b!1204575 m!1110545))

(assert (=> b!1204575 m!1110545))

(assert (=> b!1204575 m!1110569))

(declare-fun m!1110571 () Bool)

(assert (=> b!1204582 m!1110571))

(assert (=> b!1204441 d!132789))

(declare-fun b!1204586 () Bool)

(declare-fun lt!546263 () Unit!39936)

(declare-fun lt!546261 () Unit!39936)

(assert (=> b!1204586 (= lt!546263 lt!546261)))

(declare-fun lt!546262 () V!45947)

(declare-fun lt!546266 () (_ BitVec 64))

(declare-fun lt!546267 () ListLongMap!17669)

(declare-fun lt!546264 () (_ BitVec 64))

(assert (=> b!1204586 (not (contains!6908 (+!3976 lt!546267 (tuple2!19701 lt!546266 lt!546262)) lt!546264))))

(assert (=> b!1204586 (= lt!546261 (addStillNotContains!290 lt!546267 lt!546266 lt!546262 lt!546264))))

(assert (=> b!1204586 (= lt!546264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204586 (= lt!546262 (get!19189 (select (arr!37647 _values!996) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204586 (= lt!546266 (select (arr!37646 _keys!1208) from!1455))))

(declare-fun call!58258 () ListLongMap!17669)

(assert (=> b!1204586 (= lt!546267 call!58258)))

(declare-fun e!684051 () ListLongMap!17669)

(assert (=> b!1204586 (= e!684051 (+!3976 call!58258 (tuple2!19701 (select (arr!37646 _keys!1208) from!1455) (get!19189 (select (arr!37647 _values!996) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204587 () Bool)

(declare-fun e!684053 () ListLongMap!17669)

(assert (=> b!1204587 (= e!684053 e!684051)))

(declare-fun c!118111 () Bool)

(assert (=> b!1204587 (= c!118111 (validKeyInArray!0 (select (arr!37646 _keys!1208) from!1455)))))

(declare-fun b!1204589 () Bool)

(assert (=> b!1204589 (= e!684053 (ListLongMap!17670 Nil!26506))))

(declare-fun b!1204590 () Bool)

(declare-fun res!801372 () Bool)

(declare-fun e!684052 () Bool)

(assert (=> b!1204590 (=> (not res!801372) (not e!684052))))

(declare-fun lt!546265 () ListLongMap!17669)

(assert (=> b!1204590 (= res!801372 (not (contains!6908 lt!546265 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684047 () Bool)

(declare-fun b!1204591 () Bool)

(assert (=> b!1204591 (= e!684047 (= lt!546265 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58255 () Bool)

(assert (=> bm!58255 (= call!58258 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204592 () Bool)

(declare-fun e!684050 () Bool)

(declare-fun e!684049 () Bool)

(assert (=> b!1204592 (= e!684050 e!684049)))

(assert (=> b!1204592 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38182 _keys!1208)))))

(declare-fun res!801370 () Bool)

(assert (=> b!1204592 (= res!801370 (contains!6908 lt!546265 (select (arr!37646 _keys!1208) from!1455)))))

(assert (=> b!1204592 (=> (not res!801370) (not e!684049))))

(declare-fun b!1204593 () Bool)

(assert (=> b!1204593 (= e!684052 e!684050)))

(declare-fun c!118112 () Bool)

(declare-fun e!684048 () Bool)

(assert (=> b!1204593 (= c!118112 e!684048)))

(declare-fun res!801371 () Bool)

(assert (=> b!1204593 (=> (not res!801371) (not e!684048))))

(assert (=> b!1204593 (= res!801371 (bvslt from!1455 (size!38182 _keys!1208)))))

(declare-fun b!1204594 () Bool)

(assert (=> b!1204594 (= e!684047 (isEmpty!984 lt!546265))))

(declare-fun b!1204595 () Bool)

(assert (=> b!1204595 (= e!684051 call!58258)))

(declare-fun b!1204596 () Bool)

(assert (=> b!1204596 (= e!684048 (validKeyInArray!0 (select (arr!37646 _keys!1208) from!1455)))))

(assert (=> b!1204596 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204597 () Bool)

(assert (=> b!1204597 (= e!684050 e!684047)))

(declare-fun c!118110 () Bool)

(assert (=> b!1204597 (= c!118110 (bvslt from!1455 (size!38182 _keys!1208)))))

(declare-fun b!1204588 () Bool)

(assert (=> b!1204588 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38182 _keys!1208)))))

(assert (=> b!1204588 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38183 _values!996)))))

(assert (=> b!1204588 (= e!684049 (= (apply!962 lt!546265 (select (arr!37646 _keys!1208) from!1455)) (get!19189 (select (arr!37647 _values!996) from!1455) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132791 () Bool)

(assert (=> d!132791 e!684052))

(declare-fun res!801373 () Bool)

(assert (=> d!132791 (=> (not res!801373) (not e!684052))))

(assert (=> d!132791 (= res!801373 (not (contains!6908 lt!546265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132791 (= lt!546265 e!684053)))

(declare-fun c!118109 () Bool)

(assert (=> d!132791 (= c!118109 (bvsge from!1455 (size!38182 _keys!1208)))))

(assert (=> d!132791 (validMask!0 mask!1564)))

(assert (=> d!132791 (= (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546265)))

(assert (= (and d!132791 c!118109) b!1204589))

(assert (= (and d!132791 (not c!118109)) b!1204587))

(assert (= (and b!1204587 c!118111) b!1204586))

(assert (= (and b!1204587 (not c!118111)) b!1204595))

(assert (= (or b!1204586 b!1204595) bm!58255))

(assert (= (and d!132791 res!801373) b!1204590))

(assert (= (and b!1204590 res!801372) b!1204593))

(assert (= (and b!1204593 res!801371) b!1204596))

(assert (= (and b!1204593 c!118112) b!1204592))

(assert (= (and b!1204593 (not c!118112)) b!1204597))

(assert (= (and b!1204592 res!801370) b!1204588))

(assert (= (and b!1204597 c!118110) b!1204591))

(assert (= (and b!1204597 (not c!118110)) b!1204594))

(declare-fun b_lambda!21241 () Bool)

(assert (=> (not b_lambda!21241) (not b!1204586)))

(assert (=> b!1204586 t!39399))

(declare-fun b_and!42781 () Bool)

(assert (= b_and!42779 (and (=> t!39399 result!22003) b_and!42781)))

(declare-fun b_lambda!21243 () Bool)

(assert (=> (not b_lambda!21243) (not b!1204588)))

(assert (=> b!1204588 t!39399))

(declare-fun b_and!42783 () Bool)

(assert (= b_and!42781 (and (=> t!39399 result!22003) b_and!42783)))

(assert (=> b!1204586 m!1110411))

(declare-fun m!1110573 () Bool)

(assert (=> b!1204586 m!1110573))

(declare-fun m!1110575 () Bool)

(assert (=> b!1204586 m!1110575))

(declare-fun m!1110577 () Bool)

(assert (=> b!1204586 m!1110577))

(declare-fun m!1110579 () Bool)

(assert (=> b!1204586 m!1110579))

(declare-fun m!1110581 () Bool)

(assert (=> b!1204586 m!1110581))

(assert (=> b!1204586 m!1110449))

(assert (=> b!1204586 m!1110573))

(assert (=> b!1204586 m!1110581))

(assert (=> b!1204586 m!1110449))

(declare-fun m!1110583 () Bool)

(assert (=> b!1204586 m!1110583))

(assert (=> b!1204588 m!1110411))

(assert (=> b!1204588 m!1110411))

(declare-fun m!1110585 () Bool)

(assert (=> b!1204588 m!1110585))

(assert (=> b!1204588 m!1110581))

(assert (=> b!1204588 m!1110449))

(assert (=> b!1204588 m!1110583))

(assert (=> b!1204588 m!1110581))

(assert (=> b!1204588 m!1110449))

(declare-fun m!1110587 () Bool)

(assert (=> b!1204590 m!1110587))

(assert (=> b!1204592 m!1110411))

(assert (=> b!1204592 m!1110411))

(declare-fun m!1110589 () Bool)

(assert (=> b!1204592 m!1110589))

(declare-fun m!1110591 () Bool)

(assert (=> d!132791 m!1110591))

(assert (=> d!132791 m!1110419))

(declare-fun m!1110593 () Bool)

(assert (=> b!1204591 m!1110593))

(assert (=> bm!58255 m!1110593))

(assert (=> b!1204596 m!1110411))

(assert (=> b!1204596 m!1110411))

(declare-fun m!1110595 () Bool)

(assert (=> b!1204596 m!1110595))

(assert (=> b!1204587 m!1110411))

(assert (=> b!1204587 m!1110411))

(assert (=> b!1204587 m!1110595))

(declare-fun m!1110597 () Bool)

(assert (=> b!1204594 m!1110597))

(assert (=> b!1204441 d!132791))

(declare-fun bm!58258 () Bool)

(declare-fun call!58261 () Bool)

(declare-fun c!118115 () Bool)

(assert (=> bm!58258 (= call!58261 (arrayNoDuplicates!0 lt!546181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118115 (Cons!26506 (select (arr!37646 lt!546181) #b00000000000000000000000000000000) Nil!26507) Nil!26507)))))

(declare-fun b!1204608 () Bool)

(declare-fun e!684064 () Bool)

(assert (=> b!1204608 (= e!684064 call!58261)))

(declare-fun b!1204609 () Bool)

(declare-fun e!684065 () Bool)

(declare-fun contains!6909 (List!26510 (_ BitVec 64)) Bool)

(assert (=> b!1204609 (= e!684065 (contains!6909 Nil!26507 (select (arr!37646 lt!546181) #b00000000000000000000000000000000)))))

(declare-fun b!1204610 () Bool)

(declare-fun e!684062 () Bool)

(declare-fun e!684063 () Bool)

(assert (=> b!1204610 (= e!684062 e!684063)))

(declare-fun res!801382 () Bool)

(assert (=> b!1204610 (=> (not res!801382) (not e!684063))))

(assert (=> b!1204610 (= res!801382 (not e!684065))))

(declare-fun res!801380 () Bool)

(assert (=> b!1204610 (=> (not res!801380) (not e!684065))))

(assert (=> b!1204610 (= res!801380 (validKeyInArray!0 (select (arr!37646 lt!546181) #b00000000000000000000000000000000)))))

(declare-fun b!1204611 () Bool)

(assert (=> b!1204611 (= e!684063 e!684064)))

(assert (=> b!1204611 (= c!118115 (validKeyInArray!0 (select (arr!37646 lt!546181) #b00000000000000000000000000000000)))))

(declare-fun d!132793 () Bool)

(declare-fun res!801381 () Bool)

(assert (=> d!132793 (=> res!801381 e!684062)))

(assert (=> d!132793 (= res!801381 (bvsge #b00000000000000000000000000000000 (size!38182 lt!546181)))))

(assert (=> d!132793 (= (arrayNoDuplicates!0 lt!546181 #b00000000000000000000000000000000 Nil!26507) e!684062)))

(declare-fun b!1204612 () Bool)

(assert (=> b!1204612 (= e!684064 call!58261)))

(assert (= (and d!132793 (not res!801381)) b!1204610))

(assert (= (and b!1204610 res!801380) b!1204609))

(assert (= (and b!1204610 res!801382) b!1204611))

(assert (= (and b!1204611 c!118115) b!1204608))

(assert (= (and b!1204611 (not c!118115)) b!1204612))

(assert (= (or b!1204608 b!1204612) bm!58258))

(assert (=> bm!58258 m!1110533))

(declare-fun m!1110599 () Bool)

(assert (=> bm!58258 m!1110599))

(assert (=> b!1204609 m!1110533))

(assert (=> b!1204609 m!1110533))

(declare-fun m!1110601 () Bool)

(assert (=> b!1204609 m!1110601))

(assert (=> b!1204610 m!1110533))

(assert (=> b!1204610 m!1110533))

(assert (=> b!1204610 m!1110535))

(assert (=> b!1204611 m!1110533))

(assert (=> b!1204611 m!1110533))

(assert (=> b!1204611 m!1110535))

(assert (=> b!1204448 d!132793))

(declare-fun b!1204613 () Bool)

(declare-fun lt!546270 () Unit!39936)

(declare-fun lt!546268 () Unit!39936)

(assert (=> b!1204613 (= lt!546270 lt!546268)))

(declare-fun lt!546271 () (_ BitVec 64))

(declare-fun lt!546273 () (_ BitVec 64))

(declare-fun lt!546269 () V!45947)

(declare-fun lt!546274 () ListLongMap!17669)

(assert (=> b!1204613 (not (contains!6908 (+!3976 lt!546274 (tuple2!19701 lt!546273 lt!546269)) lt!546271))))

(assert (=> b!1204613 (= lt!546268 (addStillNotContains!290 lt!546274 lt!546273 lt!546269 lt!546271))))

(assert (=> b!1204613 (= lt!546271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204613 (= lt!546269 (get!19189 (select (arr!37647 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204613 (= lt!546273 (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58262 () ListLongMap!17669)

(assert (=> b!1204613 (= lt!546274 call!58262)))

(declare-fun e!684070 () ListLongMap!17669)

(assert (=> b!1204613 (= e!684070 (+!3976 call!58262 (tuple2!19701 (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19189 (select (arr!37647 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204614 () Bool)

(declare-fun e!684072 () ListLongMap!17669)

(assert (=> b!1204614 (= e!684072 e!684070)))

(declare-fun c!118118 () Bool)

(assert (=> b!1204614 (= c!118118 (validKeyInArray!0 (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204616 () Bool)

(assert (=> b!1204616 (= e!684072 (ListLongMap!17670 Nil!26506))))

(declare-fun b!1204617 () Bool)

(declare-fun res!801385 () Bool)

(declare-fun e!684071 () Bool)

(assert (=> b!1204617 (=> (not res!801385) (not e!684071))))

(declare-fun lt!546272 () ListLongMap!17669)

(assert (=> b!1204617 (= res!801385 (not (contains!6908 lt!546272 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204618 () Bool)

(declare-fun e!684066 () Bool)

(assert (=> b!1204618 (= e!684066 (= lt!546272 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58259 () Bool)

(assert (=> bm!58259 (= call!58262 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204619 () Bool)

(declare-fun e!684069 () Bool)

(declare-fun e!684068 () Bool)

(assert (=> b!1204619 (= e!684069 e!684068)))

(assert (=> b!1204619 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _keys!1208)))))

(declare-fun res!801383 () Bool)

(assert (=> b!1204619 (= res!801383 (contains!6908 lt!546272 (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204619 (=> (not res!801383) (not e!684068))))

(declare-fun b!1204620 () Bool)

(assert (=> b!1204620 (= e!684071 e!684069)))

(declare-fun c!118119 () Bool)

(declare-fun e!684067 () Bool)

(assert (=> b!1204620 (= c!118119 e!684067)))

(declare-fun res!801384 () Bool)

(assert (=> b!1204620 (=> (not res!801384) (not e!684067))))

(assert (=> b!1204620 (= res!801384 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _keys!1208)))))

(declare-fun b!1204621 () Bool)

(assert (=> b!1204621 (= e!684066 (isEmpty!984 lt!546272))))

(declare-fun b!1204622 () Bool)

(assert (=> b!1204622 (= e!684070 call!58262)))

(declare-fun b!1204623 () Bool)

(assert (=> b!1204623 (= e!684067 (validKeyInArray!0 (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204623 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204624 () Bool)

(assert (=> b!1204624 (= e!684069 e!684066)))

(declare-fun c!118117 () Bool)

(assert (=> b!1204624 (= c!118117 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _keys!1208)))))

(declare-fun b!1204615 () Bool)

(assert (=> b!1204615 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _keys!1208)))))

(assert (=> b!1204615 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38183 _values!996)))))

(assert (=> b!1204615 (= e!684068 (= (apply!962 lt!546272 (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19189 (select (arr!37647 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132795 () Bool)

(assert (=> d!132795 e!684071))

(declare-fun res!801386 () Bool)

(assert (=> d!132795 (=> (not res!801386) (not e!684071))))

(assert (=> d!132795 (= res!801386 (not (contains!6908 lt!546272 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132795 (= lt!546272 e!684072)))

(declare-fun c!118116 () Bool)

(assert (=> d!132795 (= c!118116 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _keys!1208)))))

(assert (=> d!132795 (validMask!0 mask!1564)))

(assert (=> d!132795 (= (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546272)))

(assert (= (and d!132795 c!118116) b!1204616))

(assert (= (and d!132795 (not c!118116)) b!1204614))

(assert (= (and b!1204614 c!118118) b!1204613))

(assert (= (and b!1204614 (not c!118118)) b!1204622))

(assert (= (or b!1204613 b!1204622) bm!58259))

(assert (= (and d!132795 res!801386) b!1204617))

(assert (= (and b!1204617 res!801385) b!1204620))

(assert (= (and b!1204620 res!801384) b!1204623))

(assert (= (and b!1204620 c!118119) b!1204619))

(assert (= (and b!1204620 (not c!118119)) b!1204624))

(assert (= (and b!1204619 res!801383) b!1204615))

(assert (= (and b!1204624 c!118117) b!1204618))

(assert (= (and b!1204624 (not c!118117)) b!1204621))

(declare-fun b_lambda!21245 () Bool)

(assert (=> (not b_lambda!21245) (not b!1204613)))

(assert (=> b!1204613 t!39399))

(declare-fun b_and!42785 () Bool)

(assert (= b_and!42783 (and (=> t!39399 result!22003) b_and!42785)))

(declare-fun b_lambda!21247 () Bool)

(assert (=> (not b_lambda!21247) (not b!1204615)))

(assert (=> b!1204615 t!39399))

(declare-fun b_and!42787 () Bool)

(assert (= b_and!42785 (and (=> t!39399 result!22003) b_and!42787)))

(declare-fun m!1110603 () Bool)

(assert (=> b!1204613 m!1110603))

(declare-fun m!1110605 () Bool)

(assert (=> b!1204613 m!1110605))

(declare-fun m!1110607 () Bool)

(assert (=> b!1204613 m!1110607))

(declare-fun m!1110609 () Bool)

(assert (=> b!1204613 m!1110609))

(declare-fun m!1110611 () Bool)

(assert (=> b!1204613 m!1110611))

(declare-fun m!1110613 () Bool)

(assert (=> b!1204613 m!1110613))

(assert (=> b!1204613 m!1110449))

(assert (=> b!1204613 m!1110605))

(assert (=> b!1204613 m!1110613))

(assert (=> b!1204613 m!1110449))

(declare-fun m!1110615 () Bool)

(assert (=> b!1204613 m!1110615))

(assert (=> b!1204615 m!1110603))

(assert (=> b!1204615 m!1110603))

(declare-fun m!1110617 () Bool)

(assert (=> b!1204615 m!1110617))

(assert (=> b!1204615 m!1110613))

(assert (=> b!1204615 m!1110449))

(assert (=> b!1204615 m!1110615))

(assert (=> b!1204615 m!1110613))

(assert (=> b!1204615 m!1110449))

(declare-fun m!1110619 () Bool)

(assert (=> b!1204617 m!1110619))

(assert (=> b!1204619 m!1110603))

(assert (=> b!1204619 m!1110603))

(declare-fun m!1110621 () Bool)

(assert (=> b!1204619 m!1110621))

(declare-fun m!1110623 () Bool)

(assert (=> d!132795 m!1110623))

(assert (=> d!132795 m!1110419))

(declare-fun m!1110625 () Bool)

(assert (=> b!1204618 m!1110625))

(assert (=> bm!58259 m!1110625))

(assert (=> b!1204623 m!1110603))

(assert (=> b!1204623 m!1110603))

(declare-fun m!1110627 () Bool)

(assert (=> b!1204623 m!1110627))

(assert (=> b!1204614 m!1110603))

(assert (=> b!1204614 m!1110603))

(assert (=> b!1204614 m!1110627))

(declare-fun m!1110629 () Bool)

(assert (=> b!1204621 m!1110629))

(assert (=> bm!58220 d!132795))

(declare-fun d!132797 () Bool)

(declare-fun e!684078 () Bool)

(assert (=> d!132797 e!684078))

(declare-fun res!801389 () Bool)

(assert (=> d!132797 (=> res!801389 e!684078)))

(declare-fun lt!546284 () Bool)

(assert (=> d!132797 (= res!801389 (not lt!546284))))

(declare-fun lt!546286 () Bool)

(assert (=> d!132797 (= lt!546284 lt!546286)))

(declare-fun lt!546285 () Unit!39936)

(declare-fun e!684077 () Unit!39936)

(assert (=> d!132797 (= lt!546285 e!684077)))

(declare-fun c!118122 () Bool)

(assert (=> d!132797 (= c!118122 lt!546286)))

(declare-fun containsKey!589 (List!26509 (_ BitVec 64)) Bool)

(assert (=> d!132797 (= lt!546286 (containsKey!589 (toList!8850 lt!546176) k0!934))))

(assert (=> d!132797 (= (contains!6908 lt!546176 k0!934) lt!546284)))

(declare-fun b!1204631 () Bool)

(declare-fun lt!546283 () Unit!39936)

(assert (=> b!1204631 (= e!684077 lt!546283)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!419 (List!26509 (_ BitVec 64)) Unit!39936)

(assert (=> b!1204631 (= lt!546283 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8850 lt!546176) k0!934))))

(declare-datatypes ((Option!684 0))(
  ( (Some!683 (v!18008 V!45947)) (None!682) )
))
(declare-fun isDefined!458 (Option!684) Bool)

(declare-fun getValueByKey!633 (List!26509 (_ BitVec 64)) Option!684)

(assert (=> b!1204631 (isDefined!458 (getValueByKey!633 (toList!8850 lt!546176) k0!934))))

(declare-fun b!1204632 () Bool)

(declare-fun Unit!39941 () Unit!39936)

(assert (=> b!1204632 (= e!684077 Unit!39941)))

(declare-fun b!1204633 () Bool)

(assert (=> b!1204633 (= e!684078 (isDefined!458 (getValueByKey!633 (toList!8850 lt!546176) k0!934)))))

(assert (= (and d!132797 c!118122) b!1204631))

(assert (= (and d!132797 (not c!118122)) b!1204632))

(assert (= (and d!132797 (not res!801389)) b!1204633))

(declare-fun m!1110631 () Bool)

(assert (=> d!132797 m!1110631))

(declare-fun m!1110633 () Bool)

(assert (=> b!1204631 m!1110633))

(declare-fun m!1110635 () Bool)

(assert (=> b!1204631 m!1110635))

(assert (=> b!1204631 m!1110635))

(declare-fun m!1110637 () Bool)

(assert (=> b!1204631 m!1110637))

(assert (=> b!1204633 m!1110635))

(assert (=> b!1204633 m!1110635))

(assert (=> b!1204633 m!1110637))

(assert (=> b!1204432 d!132797))

(assert (=> b!1204432 d!132795))

(declare-fun bm!58260 () Bool)

(declare-fun call!58263 () Bool)

(declare-fun c!118123 () Bool)

(assert (=> bm!58260 (= call!58263 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118123 (Cons!26506 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000) Nil!26507) Nil!26507)))))

(declare-fun b!1204634 () Bool)

(declare-fun e!684081 () Bool)

(assert (=> b!1204634 (= e!684081 call!58263)))

(declare-fun b!1204635 () Bool)

(declare-fun e!684082 () Bool)

(assert (=> b!1204635 (= e!684082 (contains!6909 Nil!26507 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204636 () Bool)

(declare-fun e!684079 () Bool)

(declare-fun e!684080 () Bool)

(assert (=> b!1204636 (= e!684079 e!684080)))

(declare-fun res!801392 () Bool)

(assert (=> b!1204636 (=> (not res!801392) (not e!684080))))

(assert (=> b!1204636 (= res!801392 (not e!684082))))

(declare-fun res!801390 () Bool)

(assert (=> b!1204636 (=> (not res!801390) (not e!684082))))

(assert (=> b!1204636 (= res!801390 (validKeyInArray!0 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204637 () Bool)

(assert (=> b!1204637 (= e!684080 e!684081)))

(assert (=> b!1204637 (= c!118123 (validKeyInArray!0 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132799 () Bool)

(declare-fun res!801391 () Bool)

(assert (=> d!132799 (=> res!801391 e!684079)))

(assert (=> d!132799 (= res!801391 (bvsge #b00000000000000000000000000000000 (size!38182 _keys!1208)))))

(assert (=> d!132799 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26507) e!684079)))

(declare-fun b!1204638 () Bool)

(assert (=> b!1204638 (= e!684081 call!58263)))

(assert (= (and d!132799 (not res!801391)) b!1204636))

(assert (= (and b!1204636 res!801390) b!1204635))

(assert (= (and b!1204636 res!801392) b!1204637))

(assert (= (and b!1204637 c!118123) b!1204634))

(assert (= (and b!1204637 (not c!118123)) b!1204638))

(assert (= (or b!1204634 b!1204638) bm!58260))

(declare-fun m!1110639 () Bool)

(assert (=> bm!58260 m!1110639))

(declare-fun m!1110641 () Bool)

(assert (=> bm!58260 m!1110641))

(assert (=> b!1204635 m!1110639))

(assert (=> b!1204635 m!1110639))

(declare-fun m!1110643 () Bool)

(assert (=> b!1204635 m!1110643))

(assert (=> b!1204636 m!1110639))

(assert (=> b!1204636 m!1110639))

(declare-fun m!1110645 () Bool)

(assert (=> b!1204636 m!1110645))

(assert (=> b!1204637 m!1110639))

(assert (=> b!1204637 m!1110639))

(assert (=> b!1204637 m!1110645))

(assert (=> b!1204447 d!132799))

(declare-fun d!132801 () Bool)

(declare-fun e!684085 () Bool)

(assert (=> d!132801 e!684085))

(declare-fun res!801398 () Bool)

(assert (=> d!132801 (=> (not res!801398) (not e!684085))))

(declare-fun lt!546298 () ListLongMap!17669)

(assert (=> d!132801 (= res!801398 (contains!6908 lt!546298 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!546297 () List!26509)

(assert (=> d!132801 (= lt!546298 (ListLongMap!17670 lt!546297))))

(declare-fun lt!546296 () Unit!39936)

(declare-fun lt!546295 () Unit!39936)

(assert (=> d!132801 (= lt!546296 lt!546295)))

(assert (=> d!132801 (= (getValueByKey!633 lt!546297 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!683 (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!310 (List!26509 (_ BitVec 64) V!45947) Unit!39936)

(assert (=> d!132801 (= lt!546295 (lemmaContainsTupThenGetReturnValue!310 lt!546297 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!403 (List!26509 (_ BitVec 64) V!45947) List!26509)

(assert (=> d!132801 (= lt!546297 (insertStrictlySorted!403 (toList!8850 lt!546176) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132801 (= (+!3976 lt!546176 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!546298)))

(declare-fun b!1204643 () Bool)

(declare-fun res!801397 () Bool)

(assert (=> b!1204643 (=> (not res!801397) (not e!684085))))

(assert (=> b!1204643 (= res!801397 (= (getValueByKey!633 (toList!8850 lt!546298) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!683 (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1204644 () Bool)

(declare-fun contains!6910 (List!26509 tuple2!19700) Bool)

(assert (=> b!1204644 (= e!684085 (contains!6910 (toList!8850 lt!546298) (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132801 res!801398) b!1204643))

(assert (= (and b!1204643 res!801397) b!1204644))

(declare-fun m!1110647 () Bool)

(assert (=> d!132801 m!1110647))

(declare-fun m!1110649 () Bool)

(assert (=> d!132801 m!1110649))

(declare-fun m!1110651 () Bool)

(assert (=> d!132801 m!1110651))

(declare-fun m!1110653 () Bool)

(assert (=> d!132801 m!1110653))

(declare-fun m!1110655 () Bool)

(assert (=> b!1204643 m!1110655))

(declare-fun m!1110657 () Bool)

(assert (=> b!1204644 m!1110657))

(assert (=> b!1204446 d!132801))

(declare-fun d!132803 () Bool)

(assert (=> d!132803 (contains!6908 (+!3976 lt!546178 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546299 () Unit!39936)

(assert (=> d!132803 (= lt!546299 (choose!1792 lt!546178 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132803 (contains!6908 lt!546178 k0!934)))

(assert (=> d!132803 (= (addStillContains!1005 lt!546178 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546299)))

(declare-fun bs!34090 () Bool)

(assert (= bs!34090 d!132803))

(declare-fun m!1110659 () Bool)

(assert (=> bs!34090 m!1110659))

(assert (=> bs!34090 m!1110659))

(declare-fun m!1110661 () Bool)

(assert (=> bs!34090 m!1110661))

(declare-fun m!1110663 () Bool)

(assert (=> bs!34090 m!1110663))

(declare-fun m!1110665 () Bool)

(assert (=> bs!34090 m!1110665))

(assert (=> b!1204446 d!132803))

(declare-fun d!132805 () Bool)

(declare-fun e!684087 () Bool)

(assert (=> d!132805 e!684087))

(declare-fun res!801399 () Bool)

(assert (=> d!132805 (=> res!801399 e!684087)))

(declare-fun lt!546301 () Bool)

(assert (=> d!132805 (= res!801399 (not lt!546301))))

(declare-fun lt!546303 () Bool)

(assert (=> d!132805 (= lt!546301 lt!546303)))

(declare-fun lt!546302 () Unit!39936)

(declare-fun e!684086 () Unit!39936)

(assert (=> d!132805 (= lt!546302 e!684086)))

(declare-fun c!118124 () Bool)

(assert (=> d!132805 (= c!118124 lt!546303)))

(assert (=> d!132805 (= lt!546303 (containsKey!589 (toList!8850 call!58224) k0!934))))

(assert (=> d!132805 (= (contains!6908 call!58224 k0!934) lt!546301)))

(declare-fun b!1204645 () Bool)

(declare-fun lt!546300 () Unit!39936)

(assert (=> b!1204645 (= e!684086 lt!546300)))

(assert (=> b!1204645 (= lt!546300 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8850 call!58224) k0!934))))

(assert (=> b!1204645 (isDefined!458 (getValueByKey!633 (toList!8850 call!58224) k0!934))))

(declare-fun b!1204646 () Bool)

(declare-fun Unit!39942 () Unit!39936)

(assert (=> b!1204646 (= e!684086 Unit!39942)))

(declare-fun b!1204647 () Bool)

(assert (=> b!1204647 (= e!684087 (isDefined!458 (getValueByKey!633 (toList!8850 call!58224) k0!934)))))

(assert (= (and d!132805 c!118124) b!1204645))

(assert (= (and d!132805 (not c!118124)) b!1204646))

(assert (= (and d!132805 (not res!801399)) b!1204647))

(declare-fun m!1110667 () Bool)

(assert (=> d!132805 m!1110667))

(declare-fun m!1110669 () Bool)

(assert (=> b!1204645 m!1110669))

(declare-fun m!1110671 () Bool)

(assert (=> b!1204645 m!1110671))

(assert (=> b!1204645 m!1110671))

(declare-fun m!1110673 () Bool)

(assert (=> b!1204645 m!1110673))

(assert (=> b!1204647 m!1110671))

(assert (=> b!1204647 m!1110671))

(assert (=> b!1204647 m!1110673))

(assert (=> b!1204446 d!132805))

(declare-fun d!132807 () Bool)

(declare-fun lt!546306 () ListLongMap!17669)

(assert (=> d!132807 (not (contains!6908 lt!546306 k0!934))))

(declare-fun removeStrictlySorted!95 (List!26509 (_ BitVec 64)) List!26509)

(assert (=> d!132807 (= lt!546306 (ListLongMap!17670 (removeStrictlySorted!95 (toList!8850 call!58223) k0!934)))))

(assert (=> d!132807 (= (-!1816 call!58223 k0!934) lt!546306)))

(declare-fun bs!34091 () Bool)

(assert (= bs!34091 d!132807))

(declare-fun m!1110675 () Bool)

(assert (=> bs!34091 m!1110675))

(declare-fun m!1110677 () Bool)

(assert (=> bs!34091 m!1110677))

(assert (=> b!1204439 d!132807))

(declare-fun d!132809 () Bool)

(assert (=> d!132809 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1204438 d!132809))

(declare-fun d!132811 () Bool)

(assert (=> d!132811 (= (array_inv!28682 _keys!1208) (bvsge (size!38182 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100680 d!132811))

(declare-fun d!132813 () Bool)

(assert (=> d!132813 (= (array_inv!28683 _values!996) (bvsge (size!38183 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100680 d!132813))

(declare-fun d!132815 () Bool)

(declare-fun res!801404 () Bool)

(declare-fun e!684092 () Bool)

(assert (=> d!132815 (=> res!801404 e!684092)))

(assert (=> d!132815 (= res!801404 (= (select (arr!37646 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132815 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!684092)))

(declare-fun b!1204652 () Bool)

(declare-fun e!684093 () Bool)

(assert (=> b!1204652 (= e!684092 e!684093)))

(declare-fun res!801405 () Bool)

(assert (=> b!1204652 (=> (not res!801405) (not e!684093))))

(assert (=> b!1204652 (= res!801405 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38182 _keys!1208)))))

(declare-fun b!1204653 () Bool)

(assert (=> b!1204653 (= e!684093 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132815 (not res!801404)) b!1204652))

(assert (= (and b!1204652 res!801405) b!1204653))

(assert (=> d!132815 m!1110603))

(declare-fun m!1110679 () Bool)

(assert (=> b!1204653 m!1110679))

(assert (=> b!1204428 d!132815))

(declare-fun d!132817 () Bool)

(declare-fun res!801406 () Bool)

(declare-fun e!684094 () Bool)

(assert (=> d!132817 (=> res!801406 e!684094)))

(assert (=> d!132817 (= res!801406 (= (select (arr!37646 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132817 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684094)))

(declare-fun b!1204654 () Bool)

(declare-fun e!684095 () Bool)

(assert (=> b!1204654 (= e!684094 e!684095)))

(declare-fun res!801407 () Bool)

(assert (=> b!1204654 (=> (not res!801407) (not e!684095))))

(assert (=> b!1204654 (= res!801407 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38182 _keys!1208)))))

(declare-fun b!1204655 () Bool)

(assert (=> b!1204655 (= e!684095 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132817 (not res!801406)) b!1204654))

(assert (= (and b!1204654 res!801407) b!1204655))

(assert (=> d!132817 m!1110639))

(declare-fun m!1110681 () Bool)

(assert (=> b!1204655 m!1110681))

(assert (=> b!1204427 d!132817))

(declare-fun d!132819 () Bool)

(assert (=> d!132819 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546309 () Unit!39936)

(declare-fun choose!13 (array!78007 (_ BitVec 64) (_ BitVec 32)) Unit!39936)

(assert (=> d!132819 (= lt!546309 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132819 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132819 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546309)))

(declare-fun bs!34092 () Bool)

(assert (= bs!34092 d!132819))

(assert (=> bs!34092 m!1110441))

(declare-fun m!1110683 () Bool)

(assert (=> bs!34092 m!1110683))

(assert (=> b!1204427 d!132819))

(declare-fun d!132821 () Bool)

(declare-fun e!684097 () Bool)

(assert (=> d!132821 e!684097))

(declare-fun res!801408 () Bool)

(assert (=> d!132821 (=> res!801408 e!684097)))

(declare-fun lt!546311 () Bool)

(assert (=> d!132821 (= res!801408 (not lt!546311))))

(declare-fun lt!546313 () Bool)

(assert (=> d!132821 (= lt!546311 lt!546313)))

(declare-fun lt!546312 () Unit!39936)

(declare-fun e!684096 () Unit!39936)

(assert (=> d!132821 (= lt!546312 e!684096)))

(declare-fun c!118125 () Bool)

(assert (=> d!132821 (= c!118125 lt!546313)))

(assert (=> d!132821 (= lt!546313 (containsKey!589 (toList!8850 (ite c!118075 lt!546178 call!58227)) k0!934))))

(assert (=> d!132821 (= (contains!6908 (ite c!118075 lt!546178 call!58227) k0!934) lt!546311)))

(declare-fun b!1204656 () Bool)

(declare-fun lt!546310 () Unit!39936)

(assert (=> b!1204656 (= e!684096 lt!546310)))

(assert (=> b!1204656 (= lt!546310 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8850 (ite c!118075 lt!546178 call!58227)) k0!934))))

(assert (=> b!1204656 (isDefined!458 (getValueByKey!633 (toList!8850 (ite c!118075 lt!546178 call!58227)) k0!934))))

(declare-fun b!1204657 () Bool)

(declare-fun Unit!39943 () Unit!39936)

(assert (=> b!1204657 (= e!684096 Unit!39943)))

(declare-fun b!1204658 () Bool)

(assert (=> b!1204658 (= e!684097 (isDefined!458 (getValueByKey!633 (toList!8850 (ite c!118075 lt!546178 call!58227)) k0!934)))))

(assert (= (and d!132821 c!118125) b!1204656))

(assert (= (and d!132821 (not c!118125)) b!1204657))

(assert (= (and d!132821 (not res!801408)) b!1204658))

(declare-fun m!1110685 () Bool)

(assert (=> d!132821 m!1110685))

(declare-fun m!1110687 () Bool)

(assert (=> b!1204656 m!1110687))

(declare-fun m!1110689 () Bool)

(assert (=> b!1204656 m!1110689))

(assert (=> b!1204656 m!1110689))

(declare-fun m!1110691 () Bool)

(assert (=> b!1204656 m!1110691))

(assert (=> b!1204658 m!1110689))

(assert (=> b!1204658 m!1110689))

(assert (=> b!1204658 m!1110691))

(assert (=> bm!58224 d!132821))

(declare-fun d!132823 () Bool)

(declare-fun e!684098 () Bool)

(assert (=> d!132823 e!684098))

(declare-fun res!801410 () Bool)

(assert (=> d!132823 (=> (not res!801410) (not e!684098))))

(declare-fun lt!546317 () ListLongMap!17669)

(assert (=> d!132823 (= res!801410 (contains!6908 lt!546317 (_1!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!546316 () List!26509)

(assert (=> d!132823 (= lt!546317 (ListLongMap!17670 lt!546316))))

(declare-fun lt!546315 () Unit!39936)

(declare-fun lt!546314 () Unit!39936)

(assert (=> d!132823 (= lt!546315 lt!546314)))

(assert (=> d!132823 (= (getValueByKey!633 lt!546316 (_1!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!683 (_2!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132823 (= lt!546314 (lemmaContainsTupThenGetReturnValue!310 lt!546316 (_1!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132823 (= lt!546316 (insertStrictlySorted!403 (toList!8850 (ite c!118075 lt!546178 lt!546176)) (_1!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132823 (= (+!3976 (ite c!118075 lt!546178 lt!546176) (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!546317)))

(declare-fun b!1204659 () Bool)

(declare-fun res!801409 () Bool)

(assert (=> b!1204659 (=> (not res!801409) (not e!684098))))

(assert (=> b!1204659 (= res!801409 (= (getValueByKey!633 (toList!8850 lt!546317) (_1!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!683 (_2!9861 (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1204660 () Bool)

(assert (=> b!1204660 (= e!684098 (contains!6910 (toList!8850 lt!546317) (ite c!118075 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118074 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132823 res!801410) b!1204659))

(assert (= (and b!1204659 res!801409) b!1204660))

(declare-fun m!1110693 () Bool)

(assert (=> d!132823 m!1110693))

(declare-fun m!1110695 () Bool)

(assert (=> d!132823 m!1110695))

(declare-fun m!1110697 () Bool)

(assert (=> d!132823 m!1110697))

(declare-fun m!1110699 () Bool)

(assert (=> d!132823 m!1110699))

(declare-fun m!1110701 () Bool)

(assert (=> b!1204659 m!1110701))

(declare-fun m!1110703 () Bool)

(assert (=> b!1204660 m!1110703))

(assert (=> bm!58222 d!132823))

(declare-fun d!132825 () Bool)

(declare-fun e!684103 () Bool)

(assert (=> d!132825 e!684103))

(declare-fun res!801413 () Bool)

(assert (=> d!132825 (=> (not res!801413) (not e!684103))))

(assert (=> d!132825 (= res!801413 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38182 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38182 _keys!1208))))))))

(declare-fun lt!546320 () Unit!39936)

(declare-fun choose!1793 (array!78007 array!78009 (_ BitVec 32) (_ BitVec 32) V!45947 V!45947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39936)

(assert (=> d!132825 (= lt!546320 (choose!1793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132825 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _keys!1208)))))

(assert (=> d!132825 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1020 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546320)))

(declare-fun bm!58265 () Bool)

(declare-fun call!58269 () ListLongMap!17669)

(assert (=> bm!58265 (= call!58269 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204667 () Bool)

(declare-fun e!684104 () Bool)

(assert (=> b!1204667 (= e!684103 e!684104)))

(declare-fun c!118128 () Bool)

(assert (=> b!1204667 (= c!118128 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1204668 () Bool)

(declare-fun call!58268 () ListLongMap!17669)

(assert (=> b!1204668 (= e!684104 (= call!58268 call!58269))))

(assert (=> b!1204668 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38183 _values!996)))))

(declare-fun bm!58266 () Bool)

(assert (=> bm!58266 (= call!58268 (getCurrentListMapNoExtraKeys!5286 (array!78008 (store (arr!37646 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38182 _keys!1208)) (array!78010 (store (arr!37647 _values!996) i!673 (ValueCellFull!14598 (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38183 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204669 () Bool)

(assert (=> b!1204669 (= e!684104 (= call!58268 (-!1816 call!58269 k0!934)))))

(assert (=> b!1204669 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38183 _values!996)))))

(assert (= (and d!132825 res!801413) b!1204667))

(assert (= (and b!1204667 c!118128) b!1204669))

(assert (= (and b!1204667 (not c!118128)) b!1204668))

(assert (= (or b!1204669 b!1204668) bm!58265))

(assert (= (or b!1204669 b!1204668) bm!58266))

(declare-fun b_lambda!21249 () Bool)

(assert (=> (not b_lambda!21249) (not bm!58266)))

(assert (=> bm!58266 t!39399))

(declare-fun b_and!42789 () Bool)

(assert (= b_and!42787 (and (=> t!39399 result!22003) b_and!42789)))

(declare-fun m!1110705 () Bool)

(assert (=> d!132825 m!1110705))

(assert (=> bm!58265 m!1110409))

(assert (=> bm!58266 m!1110407))

(assert (=> bm!58266 m!1110449))

(assert (=> bm!58266 m!1110451))

(declare-fun m!1110707 () Bool)

(assert (=> bm!58266 m!1110707))

(declare-fun m!1110709 () Bool)

(assert (=> b!1204669 m!1110709))

(assert (=> b!1204435 d!132825))

(declare-fun d!132827 () Bool)

(declare-fun res!801415 () Bool)

(declare-fun e!684106 () Bool)

(assert (=> d!132827 (=> res!801415 e!684106)))

(assert (=> d!132827 (= res!801415 (bvsge #b00000000000000000000000000000000 (size!38182 _keys!1208)))))

(assert (=> d!132827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684106)))

(declare-fun b!1204670 () Bool)

(declare-fun e!684105 () Bool)

(declare-fun call!58270 () Bool)

(assert (=> b!1204670 (= e!684105 call!58270)))

(declare-fun b!1204671 () Bool)

(assert (=> b!1204671 (= e!684106 e!684105)))

(declare-fun c!118129 () Bool)

(assert (=> b!1204671 (= c!118129 (validKeyInArray!0 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204672 () Bool)

(declare-fun e!684107 () Bool)

(assert (=> b!1204672 (= e!684107 call!58270)))

(declare-fun b!1204673 () Bool)

(assert (=> b!1204673 (= e!684105 e!684107)))

(declare-fun lt!546321 () (_ BitVec 64))

(assert (=> b!1204673 (= lt!546321 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546323 () Unit!39936)

(assert (=> b!1204673 (= lt!546323 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546321 #b00000000000000000000000000000000))))

(assert (=> b!1204673 (arrayContainsKey!0 _keys!1208 lt!546321 #b00000000000000000000000000000000)))

(declare-fun lt!546322 () Unit!39936)

(assert (=> b!1204673 (= lt!546322 lt!546323)))

(declare-fun res!801414 () Bool)

(assert (=> b!1204673 (= res!801414 (= (seekEntryOrOpen!0 (select (arr!37646 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9935 #b00000000000000000000000000000000)))))

(assert (=> b!1204673 (=> (not res!801414) (not e!684107))))

(declare-fun bm!58267 () Bool)

(assert (=> bm!58267 (= call!58270 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!132827 (not res!801415)) b!1204671))

(assert (= (and b!1204671 c!118129) b!1204673))

(assert (= (and b!1204671 (not c!118129)) b!1204670))

(assert (= (and b!1204673 res!801414) b!1204672))

(assert (= (or b!1204672 b!1204670) bm!58267))

(assert (=> b!1204671 m!1110639))

(assert (=> b!1204671 m!1110639))

(assert (=> b!1204671 m!1110645))

(assert (=> b!1204673 m!1110639))

(declare-fun m!1110711 () Bool)

(assert (=> b!1204673 m!1110711))

(declare-fun m!1110713 () Bool)

(assert (=> b!1204673 m!1110713))

(assert (=> b!1204673 m!1110639))

(declare-fun m!1110715 () Bool)

(assert (=> b!1204673 m!1110715))

(declare-fun m!1110717 () Bool)

(assert (=> bm!58267 m!1110717))

(assert (=> b!1204426 d!132827))

(declare-fun b!1204674 () Bool)

(declare-fun lt!546326 () Unit!39936)

(declare-fun lt!546324 () Unit!39936)

(assert (=> b!1204674 (= lt!546326 lt!546324)))

(declare-fun lt!546327 () (_ BitVec 64))

(declare-fun lt!546330 () ListLongMap!17669)

(declare-fun lt!546329 () (_ BitVec 64))

(declare-fun lt!546325 () V!45947)

(assert (=> b!1204674 (not (contains!6908 (+!3976 lt!546330 (tuple2!19701 lt!546329 lt!546325)) lt!546327))))

(assert (=> b!1204674 (= lt!546324 (addStillNotContains!290 lt!546330 lt!546329 lt!546325 lt!546327))))

(assert (=> b!1204674 (= lt!546327 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204674 (= lt!546325 (get!19189 (select (arr!37647 lt!546180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204674 (= lt!546329 (select (arr!37646 lt!546181) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58271 () ListLongMap!17669)

(assert (=> b!1204674 (= lt!546330 call!58271)))

(declare-fun e!684112 () ListLongMap!17669)

(assert (=> b!1204674 (= e!684112 (+!3976 call!58271 (tuple2!19701 (select (arr!37646 lt!546181) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19189 (select (arr!37647 lt!546180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204675 () Bool)

(declare-fun e!684114 () ListLongMap!17669)

(assert (=> b!1204675 (= e!684114 e!684112)))

(declare-fun c!118132 () Bool)

(assert (=> b!1204675 (= c!118132 (validKeyInArray!0 (select (arr!37646 lt!546181) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204677 () Bool)

(assert (=> b!1204677 (= e!684114 (ListLongMap!17670 Nil!26506))))

(declare-fun b!1204678 () Bool)

(declare-fun res!801418 () Bool)

(declare-fun e!684113 () Bool)

(assert (=> b!1204678 (=> (not res!801418) (not e!684113))))

(declare-fun lt!546328 () ListLongMap!17669)

(assert (=> b!1204678 (= res!801418 (not (contains!6908 lt!546328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204679 () Bool)

(declare-fun e!684108 () Bool)

(assert (=> b!1204679 (= e!684108 (= lt!546328 (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58268 () Bool)

(assert (=> bm!58268 (= call!58271 (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204680 () Bool)

(declare-fun e!684111 () Bool)

(declare-fun e!684110 () Bool)

(assert (=> b!1204680 (= e!684111 e!684110)))

(assert (=> b!1204680 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 lt!546181)))))

(declare-fun res!801416 () Bool)

(assert (=> b!1204680 (= res!801416 (contains!6908 lt!546328 (select (arr!37646 lt!546181) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204680 (=> (not res!801416) (not e!684110))))

(declare-fun b!1204681 () Bool)

(assert (=> b!1204681 (= e!684113 e!684111)))

(declare-fun c!118133 () Bool)

(declare-fun e!684109 () Bool)

(assert (=> b!1204681 (= c!118133 e!684109)))

(declare-fun res!801417 () Bool)

(assert (=> b!1204681 (=> (not res!801417) (not e!684109))))

(assert (=> b!1204681 (= res!801417 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 lt!546181)))))

(declare-fun b!1204682 () Bool)

(assert (=> b!1204682 (= e!684108 (isEmpty!984 lt!546328))))

(declare-fun b!1204683 () Bool)

(assert (=> b!1204683 (= e!684112 call!58271)))

(declare-fun b!1204684 () Bool)

(assert (=> b!1204684 (= e!684109 (validKeyInArray!0 (select (arr!37646 lt!546181) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204684 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204685 () Bool)

(assert (=> b!1204685 (= e!684111 e!684108)))

(declare-fun c!118131 () Bool)

(assert (=> b!1204685 (= c!118131 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 lt!546181)))))

(declare-fun b!1204676 () Bool)

(assert (=> b!1204676 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 lt!546181)))))

(assert (=> b!1204676 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38183 lt!546180)))))

(assert (=> b!1204676 (= e!684110 (= (apply!962 lt!546328 (select (arr!37646 lt!546181) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19189 (select (arr!37647 lt!546180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3197 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132829 () Bool)

(assert (=> d!132829 e!684113))

(declare-fun res!801419 () Bool)

(assert (=> d!132829 (=> (not res!801419) (not e!684113))))

(assert (=> d!132829 (= res!801419 (not (contains!6908 lt!546328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132829 (= lt!546328 e!684114)))

(declare-fun c!118130 () Bool)

(assert (=> d!132829 (= c!118130 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 lt!546181)))))

(assert (=> d!132829 (validMask!0 mask!1564)))

(assert (=> d!132829 (= (getCurrentListMapNoExtraKeys!5286 lt!546181 lt!546180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546328)))

(assert (= (and d!132829 c!118130) b!1204677))

(assert (= (and d!132829 (not c!118130)) b!1204675))

(assert (= (and b!1204675 c!118132) b!1204674))

(assert (= (and b!1204675 (not c!118132)) b!1204683))

(assert (= (or b!1204674 b!1204683) bm!58268))

(assert (= (and d!132829 res!801419) b!1204678))

(assert (= (and b!1204678 res!801418) b!1204681))

(assert (= (and b!1204681 res!801417) b!1204684))

(assert (= (and b!1204681 c!118133) b!1204680))

(assert (= (and b!1204681 (not c!118133)) b!1204685))

(assert (= (and b!1204680 res!801416) b!1204676))

(assert (= (and b!1204685 c!118131) b!1204679))

(assert (= (and b!1204685 (not c!118131)) b!1204682))

(declare-fun b_lambda!21251 () Bool)

(assert (=> (not b_lambda!21251) (not b!1204674)))

(assert (=> b!1204674 t!39399))

(declare-fun b_and!42791 () Bool)

(assert (= b_and!42789 (and (=> t!39399 result!22003) b_and!42791)))

(declare-fun b_lambda!21253 () Bool)

(assert (=> (not b_lambda!21253) (not b!1204676)))

(assert (=> b!1204676 t!39399))

(declare-fun b_and!42793 () Bool)

(assert (= b_and!42791 (and (=> t!39399 result!22003) b_and!42793)))

(declare-fun m!1110719 () Bool)

(assert (=> b!1204674 m!1110719))

(declare-fun m!1110721 () Bool)

(assert (=> b!1204674 m!1110721))

(declare-fun m!1110723 () Bool)

(assert (=> b!1204674 m!1110723))

(declare-fun m!1110725 () Bool)

(assert (=> b!1204674 m!1110725))

(declare-fun m!1110727 () Bool)

(assert (=> b!1204674 m!1110727))

(declare-fun m!1110729 () Bool)

(assert (=> b!1204674 m!1110729))

(assert (=> b!1204674 m!1110449))

(assert (=> b!1204674 m!1110721))

(assert (=> b!1204674 m!1110729))

(assert (=> b!1204674 m!1110449))

(declare-fun m!1110731 () Bool)

(assert (=> b!1204674 m!1110731))

(assert (=> b!1204676 m!1110719))

(assert (=> b!1204676 m!1110719))

(declare-fun m!1110733 () Bool)

(assert (=> b!1204676 m!1110733))

(assert (=> b!1204676 m!1110729))

(assert (=> b!1204676 m!1110449))

(assert (=> b!1204676 m!1110731))

(assert (=> b!1204676 m!1110729))

(assert (=> b!1204676 m!1110449))

(declare-fun m!1110735 () Bool)

(assert (=> b!1204678 m!1110735))

(assert (=> b!1204680 m!1110719))

(assert (=> b!1204680 m!1110719))

(declare-fun m!1110737 () Bool)

(assert (=> b!1204680 m!1110737))

(declare-fun m!1110739 () Bool)

(assert (=> d!132829 m!1110739))

(assert (=> d!132829 m!1110419))

(declare-fun m!1110741 () Bool)

(assert (=> b!1204679 m!1110741))

(assert (=> bm!58268 m!1110741))

(assert (=> b!1204684 m!1110719))

(assert (=> b!1204684 m!1110719))

(declare-fun m!1110743 () Bool)

(assert (=> b!1204684 m!1110743))

(assert (=> b!1204675 m!1110719))

(assert (=> b!1204675 m!1110719))

(assert (=> b!1204675 m!1110743))

(declare-fun m!1110745 () Bool)

(assert (=> b!1204682 m!1110745))

(assert (=> bm!58223 d!132829))

(assert (=> b!1204434 d!132815))

(declare-fun d!132831 () Bool)

(declare-fun e!684117 () Bool)

(assert (=> d!132831 e!684117))

(declare-fun c!118136 () Bool)

(assert (=> d!132831 (= c!118136 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546333 () Unit!39936)

(declare-fun choose!1794 (array!78007 array!78009 (_ BitVec 32) (_ BitVec 32) V!45947 V!45947 (_ BitVec 64) (_ BitVec 32) Int) Unit!39936)

(assert (=> d!132831 (= lt!546333 (choose!1794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132831 (validMask!0 mask!1564)))

(assert (=> d!132831 (= (lemmaListMapContainsThenArrayContainsFrom!561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546333)))

(declare-fun b!1204690 () Bool)

(assert (=> b!1204690 (= e!684117 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204691 () Bool)

(assert (=> b!1204691 (= e!684117 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132831 c!118136) b!1204690))

(assert (= (and d!132831 (not c!118136)) b!1204691))

(declare-fun m!1110747 () Bool)

(assert (=> d!132831 m!1110747))

(assert (=> d!132831 m!1110419))

(assert (=> b!1204690 m!1110435))

(assert (=> b!1204434 d!132831))

(declare-fun mapNonEmpty!47778 () Bool)

(declare-fun mapRes!47778 () Bool)

(declare-fun tp!90739 () Bool)

(declare-fun e!684123 () Bool)

(assert (=> mapNonEmpty!47778 (= mapRes!47778 (and tp!90739 e!684123))))

(declare-fun mapRest!47778 () (Array (_ BitVec 32) ValueCell!14598))

(declare-fun mapKey!47778 () (_ BitVec 32))

(declare-fun mapValue!47778 () ValueCell!14598)

(assert (=> mapNonEmpty!47778 (= mapRest!47772 (store mapRest!47778 mapKey!47778 mapValue!47778))))

(declare-fun mapIsEmpty!47778 () Bool)

(assert (=> mapIsEmpty!47778 mapRes!47778))

(declare-fun b!1204698 () Bool)

(assert (=> b!1204698 (= e!684123 tp_is_empty!30615)))

(declare-fun condMapEmpty!47778 () Bool)

(declare-fun mapDefault!47778 () ValueCell!14598)

(assert (=> mapNonEmpty!47772 (= condMapEmpty!47778 (= mapRest!47772 ((as const (Array (_ BitVec 32) ValueCell!14598)) mapDefault!47778)))))

(declare-fun e!684122 () Bool)

(assert (=> mapNonEmpty!47772 (= tp!90730 (and e!684122 mapRes!47778))))

(declare-fun b!1204699 () Bool)

(assert (=> b!1204699 (= e!684122 tp_is_empty!30615)))

(assert (= (and mapNonEmpty!47772 condMapEmpty!47778) mapIsEmpty!47778))

(assert (= (and mapNonEmpty!47772 (not condMapEmpty!47778)) mapNonEmpty!47778))

(assert (= (and mapNonEmpty!47778 ((_ is ValueCellFull!14598) mapValue!47778)) b!1204698))

(assert (= (and mapNonEmpty!47772 ((_ is ValueCellFull!14598) mapDefault!47778)) b!1204699))

(declare-fun m!1110749 () Bool)

(assert (=> mapNonEmpty!47778 m!1110749))

(declare-fun b_lambda!21255 () Bool)

(assert (= b_lambda!21237 (or (and start!100680 b_free!25911) b_lambda!21255)))

(declare-fun b_lambda!21257 () Bool)

(assert (= b_lambda!21243 (or (and start!100680 b_free!25911) b_lambda!21257)))

(declare-fun b_lambda!21259 () Bool)

(assert (= b_lambda!21239 (or (and start!100680 b_free!25911) b_lambda!21259)))

(declare-fun b_lambda!21261 () Bool)

(assert (= b_lambda!21251 (or (and start!100680 b_free!25911) b_lambda!21261)))

(declare-fun b_lambda!21263 () Bool)

(assert (= b_lambda!21241 (or (and start!100680 b_free!25911) b_lambda!21263)))

(declare-fun b_lambda!21265 () Bool)

(assert (= b_lambda!21253 (or (and start!100680 b_free!25911) b_lambda!21265)))

(declare-fun b_lambda!21267 () Bool)

(assert (= b_lambda!21247 (or (and start!100680 b_free!25911) b_lambda!21267)))

(declare-fun b_lambda!21269 () Bool)

(assert (= b_lambda!21245 (or (and start!100680 b_free!25911) b_lambda!21269)))

(declare-fun b_lambda!21271 () Bool)

(assert (= b_lambda!21249 (or (and start!100680 b_free!25911) b_lambda!21271)))

(check-sat (not b!1204669) (not b!1204574) (not bm!58267) (not b!1204619) (not d!132823) (not b!1204594) (not bm!58259) (not b!1204621) (not b_lambda!21269) (not b_lambda!21263) (not b!1204588) (not b!1204635) (not b_next!25911) (not b_lambda!21257) (not b!1204584) (not b!1204644) (not b!1204596) (not b!1204645) (not d!132831) (not b!1204656) (not d!132795) (not b!1204676) (not b_lambda!21259) (not b!1204613) (not b!1204678) (not b!1204690) (not b!1204617) (not bm!58254) (not d!132797) (not bm!58268) (not d!132801) (not d!132821) (not b!1204623) (not b!1204587) (not d!132805) (not mapNonEmpty!47778) b_and!42793 (not b!1204547) (not b_lambda!21235) (not d!132807) (not b!1204609) (not b!1204647) (not b!1204549) (not bm!58266) (not b!1204582) (not b!1204653) (not bm!58260) (not d!132829) (not bm!58258) (not b!1204682) (not b!1204660) (not b_lambda!21255) (not b!1204671) (not b_lambda!21265) (not b!1204579) (not b!1204675) (not b!1204659) (not b!1204679) (not b!1204578) (not b!1204680) (not b!1204590) (not d!132803) (not d!132825) (not b!1204674) (not b!1204611) (not bm!58251) (not b!1204673) (not b!1204655) (not b!1204580) (not b!1204592) (not b!1204684) tp_is_empty!30615 (not b!1204637) (not d!132789) (not b_lambda!21267) (not d!132783) (not b!1204575) (not b!1204658) (not b_lambda!21271) (not b!1204591) (not b!1204614) (not bm!58255) (not b!1204636) (not bm!58265) (not b!1204631) (not b!1204615) (not b!1204618) (not b_lambda!21261) (not b!1204610) (not b!1204576) (not b!1204643) (not b!1204633) (not d!132791) (not d!132819) (not b!1204586))
(check-sat b_and!42793 (not b_next!25911))
