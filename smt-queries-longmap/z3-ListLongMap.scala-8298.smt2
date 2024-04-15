; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101092 () Bool)

(assert start!101092)

(declare-fun b_free!26059 () Bool)

(declare-fun b_next!26059 () Bool)

(assert (=> start!101092 (= b_free!26059 (not b_next!26059))))

(declare-fun tp!91196 () Bool)

(declare-fun b_and!43191 () Bool)

(assert (=> start!101092 (= tp!91196 b_and!43191)))

(declare-fun b!1212431 () Bool)

(declare-fun e!688536 () Bool)

(declare-fun e!688534 () Bool)

(assert (=> b!1212431 (= e!688536 e!688534)))

(declare-fun res!805253 () Bool)

(assert (=> b!1212431 (=> (not res!805253) (not e!688534))))

(declare-datatypes ((array!78226 0))(
  ( (array!78227 (arr!37749 (Array (_ BitVec 32) (_ BitVec 64))) (size!38287 (_ BitVec 32))) )
))
(declare-fun lt!550871 () array!78226)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78226 (_ BitVec 32)) Bool)

(assert (=> b!1212431 (= res!805253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550871 mask!1564))))

(declare-fun _keys!1208 () array!78226)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212431 (= lt!550871 (array!78227 (store (arr!37749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38287 _keys!1208)))))

(declare-fun b!1212432 () Bool)

(declare-fun e!688540 () Bool)

(declare-datatypes ((V!46145 0))(
  ( (V!46146 (val!15438 Int)) )
))
(declare-datatypes ((tuple2!19914 0))(
  ( (tuple2!19915 (_1!9968 (_ BitVec 64)) (_2!9968 V!46145)) )
))
(declare-datatypes ((List!26691 0))(
  ( (Nil!26688) (Cons!26687 (h!27896 tuple2!19914) (t!39721 List!26691)) )
))
(declare-datatypes ((ListLongMap!17883 0))(
  ( (ListLongMap!17884 (toList!8957 List!26691)) )
))
(declare-fun call!60148 () ListLongMap!17883)

(declare-fun call!60149 () ListLongMap!17883)

(assert (=> b!1212432 (= e!688540 (= call!60148 call!60149))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1212433 () Bool)

(declare-fun lt!550863 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!688548 () Bool)

(assert (=> b!1212433 (= e!688548 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550863) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212434 () Bool)

(declare-fun res!805257 () Bool)

(assert (=> b!1212434 (=> (not res!805257) (not e!688536))))

(declare-datatypes ((List!26692 0))(
  ( (Nil!26689) (Cons!26688 (h!27897 (_ BitVec 64)) (t!39722 List!26692)) )
))
(declare-fun arrayNoDuplicates!0 (array!78226 (_ BitVec 32) List!26692) Bool)

(assert (=> b!1212434 (= res!805257 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26689))))

(declare-fun b!1212435 () Bool)

(declare-fun e!688542 () Bool)

(declare-fun e!688541 () Bool)

(assert (=> b!1212435 (= e!688542 e!688541)))

(declare-fun res!805265 () Bool)

(assert (=> b!1212435 (=> res!805265 e!688541)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1212435 (= res!805265 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46145)

(declare-datatypes ((ValueCell!14672 0))(
  ( (ValueCellFull!14672 (v!18089 V!46145)) (EmptyCell!14672) )
))
(declare-datatypes ((array!78228 0))(
  ( (array!78229 (arr!37750 (Array (_ BitVec 32) ValueCell!14672)) (size!38288 (_ BitVec 32))) )
))
(declare-fun lt!550861 () array!78228)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46145)

(declare-fun lt!550856 () ListLongMap!17883)

(declare-fun getCurrentListMapNoExtraKeys!5398 (array!78226 array!78228 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 32) Int) ListLongMap!17883)

(assert (=> b!1212435 (= lt!550856 (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550868 () V!46145)

(declare-fun _values!996 () array!78228)

(assert (=> b!1212435 (= lt!550861 (array!78229 (store (arr!37750 _values!996) i!673 (ValueCellFull!14672 lt!550868)) (size!38288 _values!996)))))

(declare-fun dynLambda!3254 (Int (_ BitVec 64)) V!46145)

(assert (=> b!1212435 (= lt!550868 (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550866 () ListLongMap!17883)

(assert (=> b!1212435 (= lt!550866 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun c!119662 () Bool)

(declare-fun bm!60143 () Bool)

(assert (=> bm!60143 (= call!60148 (getCurrentListMapNoExtraKeys!5398 (ite c!119662 _keys!1208 lt!550871) (ite c!119662 _values!996 lt!550861) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212436 () Bool)

(assert (=> b!1212436 (= e!688534 (not e!688542))))

(declare-fun res!805263 () Bool)

(assert (=> b!1212436 (=> res!805263 e!688542)))

(assert (=> b!1212436 (= res!805263 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212436 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40048 0))(
  ( (Unit!40049) )
))
(declare-fun lt!550860 () Unit!40048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78226 (_ BitVec 64) (_ BitVec 32)) Unit!40048)

(assert (=> b!1212436 (= lt!550860 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!60144 () Bool)

(assert (=> bm!60144 (= call!60149 (getCurrentListMapNoExtraKeys!5398 (ite c!119662 lt!550871 _keys!1208) (ite c!119662 lt!550861 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212437 () Bool)

(declare-fun e!688543 () Bool)

(declare-fun tp_is_empty!30763 () Bool)

(assert (=> b!1212437 (= e!688543 tp_is_empty!30763)))

(declare-fun b!1212438 () Bool)

(declare-fun res!805258 () Bool)

(assert (=> b!1212438 (=> (not res!805258) (not e!688536))))

(assert (=> b!1212438 (= res!805258 (and (= (size!38288 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38287 _keys!1208) (size!38288 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1212439 () Bool)

(declare-fun e!688533 () Bool)

(assert (=> b!1212439 (= e!688541 e!688533)))

(declare-fun res!805259 () Bool)

(assert (=> b!1212439 (=> res!805259 e!688533)))

(assert (=> b!1212439 (= res!805259 (not (= (select (arr!37749 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212439 e!688540))

(assert (=> b!1212439 (= c!119662 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550873 () Unit!40048)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1073 (array!78226 array!78228 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> b!1212439 (= lt!550873 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1073 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212440 () Bool)

(declare-fun res!805266 () Bool)

(assert (=> b!1212440 (=> (not res!805266) (not e!688536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212440 (= res!805266 (validMask!0 mask!1564))))

(declare-fun b!1212441 () Bool)

(declare-fun call!60147 () Bool)

(assert (=> b!1212441 call!60147))

(declare-fun lt!550858 () Unit!40048)

(declare-fun call!60146 () Unit!40048)

(assert (=> b!1212441 (= lt!550858 call!60146)))

(declare-fun e!688538 () Unit!40048)

(assert (=> b!1212441 (= e!688538 lt!550858)))

(declare-fun b!1212442 () Bool)

(assert (=> b!1212442 (= e!688548 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212443 () Bool)

(declare-fun -!1834 (ListLongMap!17883 (_ BitVec 64)) ListLongMap!17883)

(assert (=> b!1212443 (= e!688540 (= call!60149 (-!1834 call!60148 k0!934)))))

(declare-fun b!1212444 () Bool)

(declare-fun res!805267 () Bool)

(assert (=> b!1212444 (=> (not res!805267) (not e!688536))))

(assert (=> b!1212444 (= res!805267 (= (select (arr!37749 _keys!1208) i!673) k0!934))))

(declare-fun call!60152 () ListLongMap!17883)

(declare-fun c!119663 () Bool)

(declare-fun lt!550855 () ListLongMap!17883)

(declare-fun lt!550864 () ListLongMap!17883)

(declare-fun bm!60145 () Bool)

(declare-fun c!119664 () Bool)

(declare-fun +!4077 (ListLongMap!17883 tuple2!19914) ListLongMap!17883)

(assert (=> bm!60145 (= call!60152 (+!4077 (ite c!119663 lt!550855 lt!550864) (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1212445 () Bool)

(declare-fun e!688545 () Unit!40048)

(declare-fun Unit!40050 () Unit!40048)

(assert (=> b!1212445 (= e!688545 Unit!40050)))

(declare-fun b!1212446 () Bool)

(declare-fun e!688544 () Unit!40048)

(assert (=> b!1212446 (= e!688544 e!688538)))

(declare-fun c!119665 () Bool)

(assert (=> b!1212446 (= c!119665 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550863))))

(declare-fun b!1212447 () Bool)

(declare-fun e!688546 () Bool)

(assert (=> b!1212447 (= e!688546 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212448 () Bool)

(declare-fun res!805261 () Bool)

(assert (=> b!1212448 (=> (not res!805261) (not e!688536))))

(assert (=> b!1212448 (= res!805261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212449 () Bool)

(assert (=> b!1212449 (= c!119664 (and (not lt!550863) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688549 () Unit!40048)

(assert (=> b!1212449 (= e!688549 e!688544)))

(declare-fun b!1212450 () Bool)

(declare-fun res!805260 () Bool)

(assert (=> b!1212450 (=> (not res!805260) (not e!688536))))

(assert (=> b!1212450 (= res!805260 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38287 _keys!1208))))))

(declare-fun b!1212451 () Bool)

(declare-fun res!805264 () Bool)

(assert (=> b!1212451 (=> (not res!805264) (not e!688534))))

(assert (=> b!1212451 (= res!805264 (arrayNoDuplicates!0 lt!550871 #b00000000000000000000000000000000 Nil!26689))))

(declare-fun b!1212452 () Bool)

(declare-fun Unit!40051 () Unit!40048)

(assert (=> b!1212452 (= e!688538 Unit!40051)))

(declare-fun b!1212453 () Bool)

(declare-fun res!805256 () Bool)

(assert (=> b!1212453 (=> (not res!805256) (not e!688536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212453 (= res!805256 (validKeyInArray!0 k0!934))))

(declare-fun b!1212454 () Bool)

(declare-fun e!688537 () Bool)

(declare-fun mapRes!48016 () Bool)

(assert (=> b!1212454 (= e!688537 (and e!688543 mapRes!48016))))

(declare-fun condMapEmpty!48016 () Bool)

(declare-fun mapDefault!48016 () ValueCell!14672)

(assert (=> b!1212454 (= condMapEmpty!48016 (= (arr!37750 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14672)) mapDefault!48016)))))

(declare-fun bm!60146 () Bool)

(declare-fun call!60151 () ListLongMap!17883)

(assert (=> bm!60146 (= call!60151 call!60152)))

(declare-fun res!805262 () Bool)

(assert (=> start!101092 (=> (not res!805262) (not e!688536))))

(assert (=> start!101092 (= res!805262 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38287 _keys!1208))))))

(assert (=> start!101092 e!688536))

(assert (=> start!101092 tp_is_empty!30763))

(declare-fun array_inv!28860 (array!78226) Bool)

(assert (=> start!101092 (array_inv!28860 _keys!1208)))

(assert (=> start!101092 true))

(assert (=> start!101092 tp!91196))

(declare-fun array_inv!28861 (array!78228) Bool)

(assert (=> start!101092 (and (array_inv!28861 _values!996) e!688537)))

(declare-fun bm!60147 () Bool)

(declare-fun call!60153 () Bool)

(declare-fun contains!6963 (ListLongMap!17883 (_ BitVec 64)) Bool)

(assert (=> bm!60147 (= call!60153 (contains!6963 (ite c!119663 lt!550855 call!60151) k0!934))))

(declare-fun b!1212455 () Bool)

(declare-fun lt!550869 () ListLongMap!17883)

(assert (=> b!1212455 (= e!688533 (= lt!550869 lt!550856))))

(declare-fun e!688547 () Bool)

(assert (=> b!1212455 e!688547))

(declare-fun res!805255 () Bool)

(assert (=> b!1212455 (=> (not res!805255) (not e!688547))))

(assert (=> b!1212455 (= res!805255 (= lt!550869 lt!550864))))

(assert (=> b!1212455 (= lt!550869 (-!1834 lt!550866 k0!934))))

(declare-fun lt!550853 () V!46145)

(assert (=> b!1212455 (= (-!1834 (+!4077 lt!550864 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)) (select (arr!37749 _keys!1208) from!1455)) lt!550864)))

(declare-fun lt!550857 () Unit!40048)

(declare-fun addThenRemoveForNewKeyIsSame!269 (ListLongMap!17883 (_ BitVec 64) V!46145) Unit!40048)

(assert (=> b!1212455 (= lt!550857 (addThenRemoveForNewKeyIsSame!269 lt!550864 (select (arr!37749 _keys!1208) from!1455) lt!550853))))

(declare-fun get!19258 (ValueCell!14672 V!46145) V!46145)

(assert (=> b!1212455 (= lt!550853 (get!19258 (select (arr!37750 _values!996) from!1455) lt!550868))))

(declare-fun lt!550870 () Unit!40048)

(assert (=> b!1212455 (= lt!550870 e!688545)))

(declare-fun c!119661 () Bool)

(assert (=> b!1212455 (= c!119661 (contains!6963 lt!550864 k0!934))))

(assert (=> b!1212455 (= lt!550864 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60148 () Bool)

(assert (=> bm!60148 (= call!60147 call!60153)))

(declare-fun b!1212456 () Bool)

(assert (=> b!1212456 (contains!6963 call!60152 k0!934)))

(declare-fun lt!550859 () Unit!40048)

(declare-fun addStillContains!1062 (ListLongMap!17883 (_ BitVec 64) V!46145 (_ BitVec 64)) Unit!40048)

(assert (=> b!1212456 (= lt!550859 (addStillContains!1062 lt!550855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1212456 call!60153))

(assert (=> b!1212456 (= lt!550855 (+!4077 lt!550864 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550865 () Unit!40048)

(declare-fun call!60150 () Unit!40048)

(assert (=> b!1212456 (= lt!550865 call!60150)))

(assert (=> b!1212456 (= e!688549 lt!550859)))

(declare-fun mapNonEmpty!48016 () Bool)

(declare-fun tp!91195 () Bool)

(declare-fun e!688539 () Bool)

(assert (=> mapNonEmpty!48016 (= mapRes!48016 (and tp!91195 e!688539))))

(declare-fun mapValue!48016 () ValueCell!14672)

(declare-fun mapRest!48016 () (Array (_ BitVec 32) ValueCell!14672))

(declare-fun mapKey!48016 () (_ BitVec 32))

(assert (=> mapNonEmpty!48016 (= (arr!37750 _values!996) (store mapRest!48016 mapKey!48016 mapValue!48016))))

(declare-fun mapIsEmpty!48016 () Bool)

(assert (=> mapIsEmpty!48016 mapRes!48016))

(declare-fun b!1212457 () Bool)

(assert (=> b!1212457 (= e!688539 tp_is_empty!30763)))

(declare-fun bm!60149 () Bool)

(assert (=> bm!60149 (= call!60146 call!60150)))

(declare-fun b!1212458 () Bool)

(declare-fun lt!550854 () Unit!40048)

(assert (=> b!1212458 (= e!688544 lt!550854)))

(assert (=> b!1212458 (= lt!550854 call!60146)))

(assert (=> b!1212458 call!60147))

(declare-fun bm!60150 () Bool)

(assert (=> bm!60150 (= call!60150 (addStillContains!1062 lt!550864 (ite (or c!119663 c!119664) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119663 c!119664) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1212459 () Bool)

(declare-fun Unit!40052 () Unit!40048)

(assert (=> b!1212459 (= e!688545 Unit!40052)))

(assert (=> b!1212459 (= lt!550863 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212459 (= c!119663 (and (not lt!550863) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550872 () Unit!40048)

(assert (=> b!1212459 (= lt!550872 e!688549)))

(declare-fun lt!550867 () Unit!40048)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!602 (array!78226 array!78228 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> b!1212459 (= lt!550867 (lemmaListMapContainsThenArrayContainsFrom!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119666 () Bool)

(assert (=> b!1212459 (= c!119666 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805254 () Bool)

(assert (=> b!1212459 (= res!805254 e!688548)))

(assert (=> b!1212459 (=> (not res!805254) (not e!688546))))

(assert (=> b!1212459 e!688546))

(declare-fun lt!550862 () Unit!40048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78226 (_ BitVec 32) (_ BitVec 32)) Unit!40048)

(assert (=> b!1212459 (= lt!550862 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212459 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26689)))

(declare-fun lt!550874 () Unit!40048)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78226 (_ BitVec 64) (_ BitVec 32) List!26692) Unit!40048)

(assert (=> b!1212459 (= lt!550874 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26689))))

(assert (=> b!1212459 false))

(declare-fun b!1212460 () Bool)

(assert (=> b!1212460 (= e!688547 (= lt!550869 (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!101092 res!805262) b!1212440))

(assert (= (and b!1212440 res!805266) b!1212438))

(assert (= (and b!1212438 res!805258) b!1212448))

(assert (= (and b!1212448 res!805261) b!1212434))

(assert (= (and b!1212434 res!805257) b!1212450))

(assert (= (and b!1212450 res!805260) b!1212453))

(assert (= (and b!1212453 res!805256) b!1212444))

(assert (= (and b!1212444 res!805267) b!1212431))

(assert (= (and b!1212431 res!805253) b!1212451))

(assert (= (and b!1212451 res!805264) b!1212436))

(assert (= (and b!1212436 (not res!805263)) b!1212435))

(assert (= (and b!1212435 (not res!805265)) b!1212439))

(assert (= (and b!1212439 c!119662) b!1212443))

(assert (= (and b!1212439 (not c!119662)) b!1212432))

(assert (= (or b!1212443 b!1212432) bm!60143))

(assert (= (or b!1212443 b!1212432) bm!60144))

(assert (= (and b!1212439 (not res!805259)) b!1212455))

(assert (= (and b!1212455 c!119661) b!1212459))

(assert (= (and b!1212455 (not c!119661)) b!1212445))

(assert (= (and b!1212459 c!119663) b!1212456))

(assert (= (and b!1212459 (not c!119663)) b!1212449))

(assert (= (and b!1212449 c!119664) b!1212458))

(assert (= (and b!1212449 (not c!119664)) b!1212446))

(assert (= (and b!1212446 c!119665) b!1212441))

(assert (= (and b!1212446 (not c!119665)) b!1212452))

(assert (= (or b!1212458 b!1212441) bm!60149))

(assert (= (or b!1212458 b!1212441) bm!60146))

(assert (= (or b!1212458 b!1212441) bm!60148))

(assert (= (or b!1212456 bm!60148) bm!60147))

(assert (= (or b!1212456 bm!60149) bm!60150))

(assert (= (or b!1212456 bm!60146) bm!60145))

(assert (= (and b!1212459 c!119666) b!1212442))

(assert (= (and b!1212459 (not c!119666)) b!1212433))

(assert (= (and b!1212459 res!805254) b!1212447))

(assert (= (and b!1212455 res!805255) b!1212460))

(assert (= (and b!1212454 condMapEmpty!48016) mapIsEmpty!48016))

(assert (= (and b!1212454 (not condMapEmpty!48016)) mapNonEmpty!48016))

(get-info :version)

(assert (= (and mapNonEmpty!48016 ((_ is ValueCellFull!14672) mapValue!48016)) b!1212457))

(assert (= (and b!1212454 ((_ is ValueCellFull!14672) mapDefault!48016)) b!1212437))

(assert (= start!101092 b!1212454))

(declare-fun b_lambda!21671 () Bool)

(assert (=> (not b_lambda!21671) (not b!1212435)))

(declare-fun t!39720 () Bool)

(declare-fun tb!10851 () Bool)

(assert (=> (and start!101092 (= defaultEntry!1004 defaultEntry!1004) t!39720) tb!10851))

(declare-fun result!22305 () Bool)

(assert (=> tb!10851 (= result!22305 tp_is_empty!30763)))

(assert (=> b!1212435 t!39720))

(declare-fun b_and!43193 () Bool)

(assert (= b_and!43191 (and (=> t!39720 result!22305) b_and!43193)))

(declare-fun m!1117255 () Bool)

(assert (=> b!1212431 m!1117255))

(declare-fun m!1117257 () Bool)

(assert (=> b!1212431 m!1117257))

(declare-fun m!1117259 () Bool)

(assert (=> b!1212447 m!1117259))

(declare-fun m!1117261 () Bool)

(assert (=> bm!60144 m!1117261))

(declare-fun m!1117263 () Bool)

(assert (=> b!1212436 m!1117263))

(declare-fun m!1117265 () Bool)

(assert (=> b!1212436 m!1117265))

(declare-fun m!1117267 () Bool)

(assert (=> mapNonEmpty!48016 m!1117267))

(declare-fun m!1117269 () Bool)

(assert (=> b!1212453 m!1117269))

(declare-fun m!1117271 () Bool)

(assert (=> b!1212434 m!1117271))

(declare-fun m!1117273 () Bool)

(assert (=> b!1212456 m!1117273))

(declare-fun m!1117275 () Bool)

(assert (=> b!1212456 m!1117275))

(declare-fun m!1117277 () Bool)

(assert (=> b!1212456 m!1117277))

(declare-fun m!1117279 () Bool)

(assert (=> b!1212444 m!1117279))

(declare-fun m!1117281 () Bool)

(assert (=> b!1212435 m!1117281))

(declare-fun m!1117283 () Bool)

(assert (=> b!1212435 m!1117283))

(declare-fun m!1117285 () Bool)

(assert (=> b!1212435 m!1117285))

(declare-fun m!1117287 () Bool)

(assert (=> b!1212435 m!1117287))

(declare-fun m!1117289 () Bool)

(assert (=> b!1212448 m!1117289))

(declare-fun m!1117291 () Bool)

(assert (=> b!1212460 m!1117291))

(declare-fun m!1117293 () Bool)

(assert (=> bm!60143 m!1117293))

(declare-fun m!1117295 () Bool)

(assert (=> bm!60147 m!1117295))

(declare-fun m!1117297 () Bool)

(assert (=> b!1212459 m!1117297))

(declare-fun m!1117299 () Bool)

(assert (=> b!1212459 m!1117299))

(declare-fun m!1117301 () Bool)

(assert (=> b!1212459 m!1117301))

(declare-fun m!1117303 () Bool)

(assert (=> b!1212459 m!1117303))

(declare-fun m!1117305 () Bool)

(assert (=> b!1212451 m!1117305))

(declare-fun m!1117307 () Bool)

(assert (=> b!1212440 m!1117307))

(declare-fun m!1117309 () Bool)

(assert (=> b!1212443 m!1117309))

(declare-fun m!1117311 () Bool)

(assert (=> bm!60150 m!1117311))

(assert (=> b!1212442 m!1117259))

(declare-fun m!1117313 () Bool)

(assert (=> b!1212439 m!1117313))

(declare-fun m!1117315 () Bool)

(assert (=> b!1212439 m!1117315))

(declare-fun m!1117317 () Bool)

(assert (=> bm!60145 m!1117317))

(declare-fun m!1117319 () Bool)

(assert (=> b!1212455 m!1117319))

(assert (=> b!1212455 m!1117313))

(declare-fun m!1117321 () Bool)

(assert (=> b!1212455 m!1117321))

(assert (=> b!1212455 m!1117319))

(declare-fun m!1117323 () Bool)

(assert (=> b!1212455 m!1117323))

(declare-fun m!1117325 () Bool)

(assert (=> b!1212455 m!1117325))

(declare-fun m!1117327 () Bool)

(assert (=> b!1212455 m!1117327))

(assert (=> b!1212455 m!1117313))

(declare-fun m!1117329 () Bool)

(assert (=> b!1212455 m!1117329))

(declare-fun m!1117331 () Bool)

(assert (=> b!1212455 m!1117331))

(assert (=> b!1212455 m!1117327))

(assert (=> b!1212455 m!1117313))

(declare-fun m!1117333 () Bool)

(assert (=> b!1212455 m!1117333))

(declare-fun m!1117335 () Bool)

(assert (=> start!101092 m!1117335))

(declare-fun m!1117337 () Bool)

(assert (=> start!101092 m!1117337))

(check-sat (not b!1212453) (not b!1212439) (not b_lambda!21671) (not b!1212434) (not bm!60144) (not b!1212448) (not b!1212456) (not b!1212459) (not b!1212440) (not b!1212436) (not b!1212443) (not bm!60150) (not bm!60143) (not b!1212435) (not start!101092) (not mapNonEmpty!48016) (not b!1212460) (not b!1212442) b_and!43193 (not b_next!26059) (not bm!60145) (not b!1212451) (not b!1212447) (not b!1212431) tp_is_empty!30763 (not b!1212455) (not bm!60147))
(check-sat b_and!43193 (not b_next!26059))
(get-model)

(declare-fun b_lambda!21677 () Bool)

(assert (= b_lambda!21671 (or (and start!101092 b_free!26059) b_lambda!21677)))

(check-sat (not b!1212453) (not b!1212439) (not b!1212434) (not bm!60144) (not b!1212448) (not b_lambda!21677) (not b!1212456) (not b!1212459) (not b!1212440) (not b!1212436) (not b!1212443) (not bm!60150) (not bm!60143) (not b!1212435) (not start!101092) (not mapNonEmpty!48016) (not b!1212460) (not b!1212442) b_and!43193 (not b_next!26059) (not bm!60145) (not b!1212451) (not b!1212447) (not b!1212431) tp_is_empty!30763 (not b!1212455) (not bm!60147))
(check-sat b_and!43193 (not b_next!26059))
(get-model)

(declare-fun call!60207 () ListLongMap!17883)

(declare-fun e!688657 () Bool)

(declare-fun b!1212653 () Bool)

(declare-fun call!60206 () ListLongMap!17883)

(assert (=> b!1212653 (= e!688657 (= call!60207 (-!1834 call!60206 k0!934)))))

(assert (=> b!1212653 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38288 _values!996)))))

(declare-fun b!1212654 () Bool)

(assert (=> b!1212654 (= e!688657 (= call!60207 call!60206))))

(assert (=> b!1212654 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38288 _values!996)))))

(declare-fun bm!60203 () Bool)

(assert (=> bm!60203 (= call!60206 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60204 () Bool)

(assert (=> bm!60204 (= call!60207 (getCurrentListMapNoExtraKeys!5398 (array!78227 (store (arr!37749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38287 _keys!1208)) (array!78229 (store (arr!37750 _values!996) i!673 (ValueCellFull!14672 (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38288 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133279 () Bool)

(declare-fun e!688656 () Bool)

(assert (=> d!133279 e!688656))

(declare-fun res!805360 () Bool)

(assert (=> d!133279 (=> (not res!805360) (not e!688656))))

(assert (=> d!133279 (= res!805360 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38287 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38287 _keys!1208))))))))

(declare-fun lt!551009 () Unit!40048)

(declare-fun choose!1825 (array!78226 array!78228 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> d!133279 (= lt!551009 (choose!1825 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133279 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 _keys!1208)))))

(assert (=> d!133279 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1073 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551009)))

(declare-fun b!1212655 () Bool)

(assert (=> b!1212655 (= e!688656 e!688657)))

(declare-fun c!119705 () Bool)

(assert (=> b!1212655 (= c!119705 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!133279 res!805360) b!1212655))

(assert (= (and b!1212655 c!119705) b!1212653))

(assert (= (and b!1212655 (not c!119705)) b!1212654))

(assert (= (or b!1212653 b!1212654) bm!60203))

(assert (= (or b!1212653 b!1212654) bm!60204))

(declare-fun b_lambda!21679 () Bool)

(assert (=> (not b_lambda!21679) (not bm!60204)))

(assert (=> bm!60204 t!39720))

(declare-fun b_and!43203 () Bool)

(assert (= b_and!43193 (and (=> t!39720 result!22305) b_and!43203)))

(declare-fun m!1117499 () Bool)

(assert (=> b!1212653 m!1117499))

(assert (=> bm!60203 m!1117331))

(assert (=> bm!60204 m!1117257))

(assert (=> bm!60204 m!1117285))

(declare-fun m!1117501 () Bool)

(assert (=> bm!60204 m!1117501))

(declare-fun m!1117503 () Bool)

(assert (=> bm!60204 m!1117503))

(declare-fun m!1117505 () Bool)

(assert (=> d!133279 m!1117505))

(assert (=> b!1212439 d!133279))

(declare-fun d!133281 () Bool)

(declare-fun e!688662 () Bool)

(assert (=> d!133281 e!688662))

(declare-fun res!805363 () Bool)

(assert (=> d!133281 (=> res!805363 e!688662)))

(declare-fun lt!551018 () Bool)

(assert (=> d!133281 (= res!805363 (not lt!551018))))

(declare-fun lt!551019 () Bool)

(assert (=> d!133281 (= lt!551018 lt!551019)))

(declare-fun lt!551020 () Unit!40048)

(declare-fun e!688663 () Unit!40048)

(assert (=> d!133281 (= lt!551020 e!688663)))

(declare-fun c!119708 () Bool)

(assert (=> d!133281 (= c!119708 lt!551019)))

(declare-fun containsKey!596 (List!26691 (_ BitVec 64)) Bool)

(assert (=> d!133281 (= lt!551019 (containsKey!596 (toList!8957 call!60152) k0!934))))

(assert (=> d!133281 (= (contains!6963 call!60152 k0!934) lt!551018)))

(declare-fun b!1212662 () Bool)

(declare-fun lt!551021 () Unit!40048)

(assert (=> b!1212662 (= e!688663 lt!551021)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!425 (List!26691 (_ BitVec 64)) Unit!40048)

(assert (=> b!1212662 (= lt!551021 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8957 call!60152) k0!934))))

(declare-datatypes ((Option!693 0))(
  ( (Some!692 (v!18092 V!46145)) (None!691) )
))
(declare-fun isDefined!468 (Option!693) Bool)

(declare-fun getValueByKey!642 (List!26691 (_ BitVec 64)) Option!693)

(assert (=> b!1212662 (isDefined!468 (getValueByKey!642 (toList!8957 call!60152) k0!934))))

(declare-fun b!1212663 () Bool)

(declare-fun Unit!40060 () Unit!40048)

(assert (=> b!1212663 (= e!688663 Unit!40060)))

(declare-fun b!1212664 () Bool)

(assert (=> b!1212664 (= e!688662 (isDefined!468 (getValueByKey!642 (toList!8957 call!60152) k0!934)))))

(assert (= (and d!133281 c!119708) b!1212662))

(assert (= (and d!133281 (not c!119708)) b!1212663))

(assert (= (and d!133281 (not res!805363)) b!1212664))

(declare-fun m!1117507 () Bool)

(assert (=> d!133281 m!1117507))

(declare-fun m!1117509 () Bool)

(assert (=> b!1212662 m!1117509))

(declare-fun m!1117511 () Bool)

(assert (=> b!1212662 m!1117511))

(assert (=> b!1212662 m!1117511))

(declare-fun m!1117513 () Bool)

(assert (=> b!1212662 m!1117513))

(assert (=> b!1212664 m!1117511))

(assert (=> b!1212664 m!1117511))

(assert (=> b!1212664 m!1117513))

(assert (=> b!1212456 d!133281))

(declare-fun d!133283 () Bool)

(assert (=> d!133283 (contains!6963 (+!4077 lt!550855 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!551024 () Unit!40048)

(declare-fun choose!1826 (ListLongMap!17883 (_ BitVec 64) V!46145 (_ BitVec 64)) Unit!40048)

(assert (=> d!133283 (= lt!551024 (choose!1826 lt!550855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133283 (contains!6963 lt!550855 k0!934)))

(assert (=> d!133283 (= (addStillContains!1062 lt!550855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!551024)))

(declare-fun bs!34190 () Bool)

(assert (= bs!34190 d!133283))

(declare-fun m!1117515 () Bool)

(assert (=> bs!34190 m!1117515))

(assert (=> bs!34190 m!1117515))

(declare-fun m!1117517 () Bool)

(assert (=> bs!34190 m!1117517))

(declare-fun m!1117519 () Bool)

(assert (=> bs!34190 m!1117519))

(declare-fun m!1117521 () Bool)

(assert (=> bs!34190 m!1117521))

(assert (=> b!1212456 d!133283))

(declare-fun d!133285 () Bool)

(declare-fun e!688666 () Bool)

(assert (=> d!133285 e!688666))

(declare-fun res!805368 () Bool)

(assert (=> d!133285 (=> (not res!805368) (not e!688666))))

(declare-fun lt!551034 () ListLongMap!17883)

(assert (=> d!133285 (= res!805368 (contains!6963 lt!551034 (_1!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!551036 () List!26691)

(assert (=> d!133285 (= lt!551034 (ListLongMap!17884 lt!551036))))

(declare-fun lt!551035 () Unit!40048)

(declare-fun lt!551033 () Unit!40048)

(assert (=> d!133285 (= lt!551035 lt!551033)))

(assert (=> d!133285 (= (getValueByKey!642 lt!551036 (_1!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!692 (_2!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!318 (List!26691 (_ BitVec 64) V!46145) Unit!40048)

(assert (=> d!133285 (= lt!551033 (lemmaContainsTupThenGetReturnValue!318 lt!551036 (_1!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!411 (List!26691 (_ BitVec 64) V!46145) List!26691)

(assert (=> d!133285 (= lt!551036 (insertStrictlySorted!411 (toList!8957 lt!550864) (_1!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133285 (= (+!4077 lt!550864 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!551034)))

(declare-fun b!1212670 () Bool)

(declare-fun res!805369 () Bool)

(assert (=> b!1212670 (=> (not res!805369) (not e!688666))))

(assert (=> b!1212670 (= res!805369 (= (getValueByKey!642 (toList!8957 lt!551034) (_1!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!692 (_2!9968 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1212671 () Bool)

(declare-fun contains!6964 (List!26691 tuple2!19914) Bool)

(assert (=> b!1212671 (= e!688666 (contains!6964 (toList!8957 lt!551034) (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133285 res!805368) b!1212670))

(assert (= (and b!1212670 res!805369) b!1212671))

(declare-fun m!1117523 () Bool)

(assert (=> d!133285 m!1117523))

(declare-fun m!1117525 () Bool)

(assert (=> d!133285 m!1117525))

(declare-fun m!1117527 () Bool)

(assert (=> d!133285 m!1117527))

(declare-fun m!1117529 () Bool)

(assert (=> d!133285 m!1117529))

(declare-fun m!1117531 () Bool)

(assert (=> b!1212670 m!1117531))

(declare-fun m!1117533 () Bool)

(assert (=> b!1212671 m!1117533))

(assert (=> b!1212456 d!133285))

(declare-fun b!1212680 () Bool)

(declare-fun e!688674 () Bool)

(declare-fun e!688675 () Bool)

(assert (=> b!1212680 (= e!688674 e!688675)))

(declare-fun lt!551045 () (_ BitVec 64))

(assert (=> b!1212680 (= lt!551045 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!551043 () Unit!40048)

(assert (=> b!1212680 (= lt!551043 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!551045 #b00000000000000000000000000000000))))

(assert (=> b!1212680 (arrayContainsKey!0 _keys!1208 lt!551045 #b00000000000000000000000000000000)))

(declare-fun lt!551044 () Unit!40048)

(assert (=> b!1212680 (= lt!551044 lt!551043)))

(declare-fun res!805375 () Bool)

(declare-datatypes ((SeekEntryResult!9941 0))(
  ( (MissingZero!9941 (index!42135 (_ BitVec 32))) (Found!9941 (index!42136 (_ BitVec 32))) (Intermediate!9941 (undefined!10753 Bool) (index!42137 (_ BitVec 32)) (x!106852 (_ BitVec 32))) (Undefined!9941) (MissingVacant!9941 (index!42138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78226 (_ BitVec 32)) SeekEntryResult!9941)

(assert (=> b!1212680 (= res!805375 (= (seekEntryOrOpen!0 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9941 #b00000000000000000000000000000000)))))

(assert (=> b!1212680 (=> (not res!805375) (not e!688675))))

(declare-fun d!133287 () Bool)

(declare-fun res!805374 () Bool)

(declare-fun e!688673 () Bool)

(assert (=> d!133287 (=> res!805374 e!688673)))

(assert (=> d!133287 (= res!805374 (bvsge #b00000000000000000000000000000000 (size!38287 _keys!1208)))))

(assert (=> d!133287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!688673)))

(declare-fun b!1212681 () Bool)

(declare-fun call!60210 () Bool)

(assert (=> b!1212681 (= e!688674 call!60210)))

(declare-fun bm!60207 () Bool)

(assert (=> bm!60207 (= call!60210 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1212682 () Bool)

(assert (=> b!1212682 (= e!688675 call!60210)))

(declare-fun b!1212683 () Bool)

(assert (=> b!1212683 (= e!688673 e!688674)))

(declare-fun c!119711 () Bool)

(assert (=> b!1212683 (= c!119711 (validKeyInArray!0 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133287 (not res!805374)) b!1212683))

(assert (= (and b!1212683 c!119711) b!1212680))

(assert (= (and b!1212683 (not c!119711)) b!1212681))

(assert (= (and b!1212680 res!805375) b!1212682))

(assert (= (or b!1212682 b!1212681) bm!60207))

(declare-fun m!1117535 () Bool)

(assert (=> b!1212680 m!1117535))

(declare-fun m!1117537 () Bool)

(assert (=> b!1212680 m!1117537))

(declare-fun m!1117539 () Bool)

(assert (=> b!1212680 m!1117539))

(assert (=> b!1212680 m!1117535))

(declare-fun m!1117541 () Bool)

(assert (=> b!1212680 m!1117541))

(declare-fun m!1117543 () Bool)

(assert (=> bm!60207 m!1117543))

(assert (=> b!1212683 m!1117535))

(assert (=> b!1212683 m!1117535))

(declare-fun m!1117545 () Bool)

(assert (=> b!1212683 m!1117545))

(assert (=> b!1212448 d!133287))

(declare-fun d!133289 () Bool)

(assert (=> d!133289 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1212440 d!133289))

(declare-fun b!1212684 () Bool)

(declare-fun e!688677 () Bool)

(declare-fun e!688678 () Bool)

(assert (=> b!1212684 (= e!688677 e!688678)))

(declare-fun lt!551048 () (_ BitVec 64))

(assert (=> b!1212684 (= lt!551048 (select (arr!37749 lt!550871) #b00000000000000000000000000000000))))

(declare-fun lt!551046 () Unit!40048)

(assert (=> b!1212684 (= lt!551046 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!550871 lt!551048 #b00000000000000000000000000000000))))

(assert (=> b!1212684 (arrayContainsKey!0 lt!550871 lt!551048 #b00000000000000000000000000000000)))

(declare-fun lt!551047 () Unit!40048)

(assert (=> b!1212684 (= lt!551047 lt!551046)))

(declare-fun res!805377 () Bool)

(assert (=> b!1212684 (= res!805377 (= (seekEntryOrOpen!0 (select (arr!37749 lt!550871) #b00000000000000000000000000000000) lt!550871 mask!1564) (Found!9941 #b00000000000000000000000000000000)))))

(assert (=> b!1212684 (=> (not res!805377) (not e!688678))))

(declare-fun d!133291 () Bool)

(declare-fun res!805376 () Bool)

(declare-fun e!688676 () Bool)

(assert (=> d!133291 (=> res!805376 e!688676)))

(assert (=> d!133291 (= res!805376 (bvsge #b00000000000000000000000000000000 (size!38287 lt!550871)))))

(assert (=> d!133291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550871 mask!1564) e!688676)))

(declare-fun b!1212685 () Bool)

(declare-fun call!60211 () Bool)

(assert (=> b!1212685 (= e!688677 call!60211)))

(declare-fun bm!60208 () Bool)

(assert (=> bm!60208 (= call!60211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!550871 mask!1564))))

(declare-fun b!1212686 () Bool)

(assert (=> b!1212686 (= e!688678 call!60211)))

(declare-fun b!1212687 () Bool)

(assert (=> b!1212687 (= e!688676 e!688677)))

(declare-fun c!119712 () Bool)

(assert (=> b!1212687 (= c!119712 (validKeyInArray!0 (select (arr!37749 lt!550871) #b00000000000000000000000000000000)))))

(assert (= (and d!133291 (not res!805376)) b!1212687))

(assert (= (and b!1212687 c!119712) b!1212684))

(assert (= (and b!1212687 (not c!119712)) b!1212685))

(assert (= (and b!1212684 res!805377) b!1212686))

(assert (= (or b!1212686 b!1212685) bm!60208))

(declare-fun m!1117547 () Bool)

(assert (=> b!1212684 m!1117547))

(declare-fun m!1117549 () Bool)

(assert (=> b!1212684 m!1117549))

(declare-fun m!1117551 () Bool)

(assert (=> b!1212684 m!1117551))

(assert (=> b!1212684 m!1117547))

(declare-fun m!1117553 () Bool)

(assert (=> b!1212684 m!1117553))

(declare-fun m!1117555 () Bool)

(assert (=> bm!60208 m!1117555))

(assert (=> b!1212687 m!1117547))

(assert (=> b!1212687 m!1117547))

(declare-fun m!1117557 () Bool)

(assert (=> b!1212687 m!1117557))

(assert (=> b!1212431 d!133291))

(declare-fun d!133293 () Bool)

(declare-fun res!805382 () Bool)

(declare-fun e!688683 () Bool)

(assert (=> d!133293 (=> res!805382 e!688683)))

(assert (=> d!133293 (= res!805382 (= (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133293 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!688683)))

(declare-fun b!1212692 () Bool)

(declare-fun e!688684 () Bool)

(assert (=> b!1212692 (= e!688683 e!688684)))

(declare-fun res!805383 () Bool)

(assert (=> b!1212692 (=> (not res!805383) (not e!688684))))

(assert (=> b!1212692 (= res!805383 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38287 _keys!1208)))))

(declare-fun b!1212693 () Bool)

(assert (=> b!1212693 (= e!688684 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133293 (not res!805382)) b!1212692))

(assert (= (and b!1212692 res!805383) b!1212693))

(declare-fun m!1117559 () Bool)

(assert (=> d!133293 m!1117559))

(declare-fun m!1117561 () Bool)

(assert (=> b!1212693 m!1117561))

(assert (=> b!1212442 d!133293))

(declare-fun b!1212704 () Bool)

(declare-fun e!688693 () Bool)

(declare-fun e!688695 () Bool)

(assert (=> b!1212704 (= e!688693 e!688695)))

(declare-fun res!805392 () Bool)

(assert (=> b!1212704 (=> (not res!805392) (not e!688695))))

(declare-fun e!688694 () Bool)

(assert (=> b!1212704 (= res!805392 (not e!688694))))

(declare-fun res!805390 () Bool)

(assert (=> b!1212704 (=> (not res!805390) (not e!688694))))

(assert (=> b!1212704 (= res!805390 (validKeyInArray!0 (select (arr!37749 lt!550871) #b00000000000000000000000000000000)))))

(declare-fun d!133295 () Bool)

(declare-fun res!805391 () Bool)

(assert (=> d!133295 (=> res!805391 e!688693)))

(assert (=> d!133295 (= res!805391 (bvsge #b00000000000000000000000000000000 (size!38287 lt!550871)))))

(assert (=> d!133295 (= (arrayNoDuplicates!0 lt!550871 #b00000000000000000000000000000000 Nil!26689) e!688693)))

(declare-fun b!1212705 () Bool)

(declare-fun e!688696 () Bool)

(assert (=> b!1212705 (= e!688695 e!688696)))

(declare-fun c!119715 () Bool)

(assert (=> b!1212705 (= c!119715 (validKeyInArray!0 (select (arr!37749 lt!550871) #b00000000000000000000000000000000)))))

(declare-fun b!1212706 () Bool)

(declare-fun contains!6965 (List!26692 (_ BitVec 64)) Bool)

(assert (=> b!1212706 (= e!688694 (contains!6965 Nil!26689 (select (arr!37749 lt!550871) #b00000000000000000000000000000000)))))

(declare-fun b!1212707 () Bool)

(declare-fun call!60214 () Bool)

(assert (=> b!1212707 (= e!688696 call!60214)))

(declare-fun bm!60211 () Bool)

(assert (=> bm!60211 (= call!60214 (arrayNoDuplicates!0 lt!550871 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119715 (Cons!26688 (select (arr!37749 lt!550871) #b00000000000000000000000000000000) Nil!26689) Nil!26689)))))

(declare-fun b!1212708 () Bool)

(assert (=> b!1212708 (= e!688696 call!60214)))

(assert (= (and d!133295 (not res!805391)) b!1212704))

(assert (= (and b!1212704 res!805390) b!1212706))

(assert (= (and b!1212704 res!805392) b!1212705))

(assert (= (and b!1212705 c!119715) b!1212708))

(assert (= (and b!1212705 (not c!119715)) b!1212707))

(assert (= (or b!1212708 b!1212707) bm!60211))

(assert (=> b!1212704 m!1117547))

(assert (=> b!1212704 m!1117547))

(assert (=> b!1212704 m!1117557))

(assert (=> b!1212705 m!1117547))

(assert (=> b!1212705 m!1117547))

(assert (=> b!1212705 m!1117557))

(assert (=> b!1212706 m!1117547))

(assert (=> b!1212706 m!1117547))

(declare-fun m!1117563 () Bool)

(assert (=> b!1212706 m!1117563))

(assert (=> bm!60211 m!1117547))

(declare-fun m!1117565 () Bool)

(assert (=> bm!60211 m!1117565))

(assert (=> b!1212451 d!133295))

(declare-fun d!133297 () Bool)

(assert (=> d!133297 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1212453 d!133297))

(declare-fun d!133299 () Bool)

(declare-fun lt!551051 () ListLongMap!17883)

(assert (=> d!133299 (not (contains!6963 lt!551051 k0!934))))

(declare-fun removeStrictlySorted!102 (List!26691 (_ BitVec 64)) List!26691)

(assert (=> d!133299 (= lt!551051 (ListLongMap!17884 (removeStrictlySorted!102 (toList!8957 call!60148) k0!934)))))

(assert (=> d!133299 (= (-!1834 call!60148 k0!934) lt!551051)))

(declare-fun bs!34191 () Bool)

(assert (= bs!34191 d!133299))

(declare-fun m!1117567 () Bool)

(assert (=> bs!34191 m!1117567))

(declare-fun m!1117569 () Bool)

(assert (=> bs!34191 m!1117569))

(assert (=> b!1212443 d!133299))

(declare-fun b!1212709 () Bool)

(declare-fun e!688697 () Bool)

(declare-fun e!688699 () Bool)

(assert (=> b!1212709 (= e!688697 e!688699)))

(declare-fun res!805395 () Bool)

(assert (=> b!1212709 (=> (not res!805395) (not e!688699))))

(declare-fun e!688698 () Bool)

(assert (=> b!1212709 (= res!805395 (not e!688698))))

(declare-fun res!805393 () Bool)

(assert (=> b!1212709 (=> (not res!805393) (not e!688698))))

(assert (=> b!1212709 (= res!805393 (validKeyInArray!0 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133301 () Bool)

(declare-fun res!805394 () Bool)

(assert (=> d!133301 (=> res!805394 e!688697)))

(assert (=> d!133301 (= res!805394 (bvsge #b00000000000000000000000000000000 (size!38287 _keys!1208)))))

(assert (=> d!133301 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26689) e!688697)))

(declare-fun b!1212710 () Bool)

(declare-fun e!688700 () Bool)

(assert (=> b!1212710 (= e!688699 e!688700)))

(declare-fun c!119716 () Bool)

(assert (=> b!1212710 (= c!119716 (validKeyInArray!0 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1212711 () Bool)

(assert (=> b!1212711 (= e!688698 (contains!6965 Nil!26689 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1212712 () Bool)

(declare-fun call!60215 () Bool)

(assert (=> b!1212712 (= e!688700 call!60215)))

(declare-fun bm!60212 () Bool)

(assert (=> bm!60212 (= call!60215 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119716 (Cons!26688 (select (arr!37749 _keys!1208) #b00000000000000000000000000000000) Nil!26689) Nil!26689)))))

(declare-fun b!1212713 () Bool)

(assert (=> b!1212713 (= e!688700 call!60215)))

(assert (= (and d!133301 (not res!805394)) b!1212709))

(assert (= (and b!1212709 res!805393) b!1212711))

(assert (= (and b!1212709 res!805395) b!1212710))

(assert (= (and b!1212710 c!119716) b!1212713))

(assert (= (and b!1212710 (not c!119716)) b!1212712))

(assert (= (or b!1212713 b!1212712) bm!60212))

(assert (=> b!1212709 m!1117535))

(assert (=> b!1212709 m!1117535))

(assert (=> b!1212709 m!1117545))

(assert (=> b!1212710 m!1117535))

(assert (=> b!1212710 m!1117535))

(assert (=> b!1212710 m!1117545))

(assert (=> b!1212711 m!1117535))

(assert (=> b!1212711 m!1117535))

(declare-fun m!1117571 () Bool)

(assert (=> b!1212711 m!1117571))

(assert (=> bm!60212 m!1117535))

(declare-fun m!1117573 () Bool)

(assert (=> bm!60212 m!1117573))

(assert (=> b!1212434 d!133301))

(declare-fun b!1212738 () Bool)

(declare-fun e!688719 () Bool)

(declare-fun e!688721 () Bool)

(assert (=> b!1212738 (= e!688719 e!688721)))

(assert (=> b!1212738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 _keys!1208 lt!550871))))))

(declare-fun res!805405 () Bool)

(declare-fun lt!551066 () ListLongMap!17883)

(assert (=> b!1212738 (= res!805405 (contains!6963 lt!551066 (select (arr!37749 (ite c!119662 _keys!1208 lt!550871)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212738 (=> (not res!805405) (not e!688721))))

(declare-fun e!688717 () Bool)

(declare-fun b!1212739 () Bool)

(assert (=> b!1212739 (= e!688717 (validKeyInArray!0 (select (arr!37749 (ite c!119662 _keys!1208 lt!550871)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212739 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1212740 () Bool)

(declare-fun e!688720 () Bool)

(declare-fun isEmpty!998 (ListLongMap!17883) Bool)

(assert (=> b!1212740 (= e!688720 (isEmpty!998 lt!551066))))

(declare-fun b!1212742 () Bool)

(declare-fun lt!551069 () Unit!40048)

(declare-fun lt!551068 () Unit!40048)

(assert (=> b!1212742 (= lt!551069 lt!551068)))

(declare-fun lt!551067 () V!46145)

(declare-fun lt!551072 () (_ BitVec 64))

(declare-fun lt!551071 () ListLongMap!17883)

(declare-fun lt!551070 () (_ BitVec 64))

(assert (=> b!1212742 (not (contains!6963 (+!4077 lt!551071 (tuple2!19915 lt!551070 lt!551067)) lt!551072))))

(declare-fun addStillNotContains!298 (ListLongMap!17883 (_ BitVec 64) V!46145 (_ BitVec 64)) Unit!40048)

(assert (=> b!1212742 (= lt!551068 (addStillNotContains!298 lt!551071 lt!551070 lt!551067 lt!551072))))

(assert (=> b!1212742 (= lt!551072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212742 (= lt!551067 (get!19258 (select (arr!37750 (ite c!119662 _values!996 lt!550861)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212742 (= lt!551070 (select (arr!37749 (ite c!119662 _keys!1208 lt!550871)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60218 () ListLongMap!17883)

(assert (=> b!1212742 (= lt!551071 call!60218)))

(declare-fun e!688716 () ListLongMap!17883)

(assert (=> b!1212742 (= e!688716 (+!4077 call!60218 (tuple2!19915 (select (arr!37749 (ite c!119662 _keys!1208 lt!550871)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19258 (select (arr!37750 (ite c!119662 _values!996 lt!550861)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212743 () Bool)

(declare-fun e!688715 () ListLongMap!17883)

(assert (=> b!1212743 (= e!688715 (ListLongMap!17884 Nil!26688))))

(declare-fun b!1212744 () Bool)

(assert (=> b!1212744 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 _keys!1208 lt!550871))))))

(assert (=> b!1212744 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38288 (ite c!119662 _values!996 lt!550861))))))

(declare-fun apply!962 (ListLongMap!17883 (_ BitVec 64)) V!46145)

(assert (=> b!1212744 (= e!688721 (= (apply!962 lt!551066 (select (arr!37749 (ite c!119662 _keys!1208 lt!550871)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19258 (select (arr!37750 (ite c!119662 _values!996 lt!550861)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212745 () Bool)

(assert (=> b!1212745 (= e!688716 call!60218)))

(declare-fun b!1212746 () Bool)

(assert (=> b!1212746 (= e!688715 e!688716)))

(declare-fun c!119727 () Bool)

(assert (=> b!1212746 (= c!119727 (validKeyInArray!0 (select (arr!37749 (ite c!119662 _keys!1208 lt!550871)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212747 () Bool)

(declare-fun res!805406 () Bool)

(declare-fun e!688718 () Bool)

(assert (=> b!1212747 (=> (not res!805406) (not e!688718))))

(assert (=> b!1212747 (= res!805406 (not (contains!6963 lt!551066 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!60215 () Bool)

(assert (=> bm!60215 (= call!60218 (getCurrentListMapNoExtraKeys!5398 (ite c!119662 _keys!1208 lt!550871) (ite c!119662 _values!996 lt!550861) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212748 () Bool)

(assert (=> b!1212748 (= e!688718 e!688719)))

(declare-fun c!119726 () Bool)

(assert (=> b!1212748 (= c!119726 e!688717)))

(declare-fun res!805404 () Bool)

(assert (=> b!1212748 (=> (not res!805404) (not e!688717))))

(assert (=> b!1212748 (= res!805404 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 _keys!1208 lt!550871))))))

(declare-fun b!1212749 () Bool)

(assert (=> b!1212749 (= e!688719 e!688720)))

(declare-fun c!119725 () Bool)

(assert (=> b!1212749 (= c!119725 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 _keys!1208 lt!550871))))))

(declare-fun d!133303 () Bool)

(assert (=> d!133303 e!688718))

(declare-fun res!805407 () Bool)

(assert (=> d!133303 (=> (not res!805407) (not e!688718))))

(assert (=> d!133303 (= res!805407 (not (contains!6963 lt!551066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133303 (= lt!551066 e!688715)))

(declare-fun c!119728 () Bool)

(assert (=> d!133303 (= c!119728 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 _keys!1208 lt!550871))))))

(assert (=> d!133303 (validMask!0 mask!1564)))

(assert (=> d!133303 (= (getCurrentListMapNoExtraKeys!5398 (ite c!119662 _keys!1208 lt!550871) (ite c!119662 _values!996 lt!550861) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551066)))

(declare-fun b!1212741 () Bool)

(assert (=> b!1212741 (= e!688720 (= lt!551066 (getCurrentListMapNoExtraKeys!5398 (ite c!119662 _keys!1208 lt!550871) (ite c!119662 _values!996 lt!550861) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133303 c!119728) b!1212743))

(assert (= (and d!133303 (not c!119728)) b!1212746))

(assert (= (and b!1212746 c!119727) b!1212742))

(assert (= (and b!1212746 (not c!119727)) b!1212745))

(assert (= (or b!1212742 b!1212745) bm!60215))

(assert (= (and d!133303 res!805407) b!1212747))

(assert (= (and b!1212747 res!805406) b!1212748))

(assert (= (and b!1212748 res!805404) b!1212739))

(assert (= (and b!1212748 c!119726) b!1212738))

(assert (= (and b!1212748 (not c!119726)) b!1212749))

(assert (= (and b!1212738 res!805405) b!1212744))

(assert (= (and b!1212749 c!119725) b!1212741))

(assert (= (and b!1212749 (not c!119725)) b!1212740))

(declare-fun b_lambda!21681 () Bool)

(assert (=> (not b_lambda!21681) (not b!1212742)))

(assert (=> b!1212742 t!39720))

(declare-fun b_and!43205 () Bool)

(assert (= b_and!43203 (and (=> t!39720 result!22305) b_and!43205)))

(declare-fun b_lambda!21683 () Bool)

(assert (=> (not b_lambda!21683) (not b!1212744)))

(assert (=> b!1212744 t!39720))

(declare-fun b_and!43207 () Bool)

(assert (= b_and!43205 (and (=> t!39720 result!22305) b_and!43207)))

(declare-fun m!1117575 () Bool)

(assert (=> bm!60215 m!1117575))

(declare-fun m!1117577 () Bool)

(assert (=> b!1212739 m!1117577))

(assert (=> b!1212739 m!1117577))

(declare-fun m!1117579 () Bool)

(assert (=> b!1212739 m!1117579))

(assert (=> b!1212738 m!1117577))

(assert (=> b!1212738 m!1117577))

(declare-fun m!1117581 () Bool)

(assert (=> b!1212738 m!1117581))

(assert (=> b!1212746 m!1117577))

(assert (=> b!1212746 m!1117577))

(assert (=> b!1212746 m!1117579))

(declare-fun m!1117583 () Bool)

(assert (=> b!1212747 m!1117583))

(declare-fun m!1117585 () Bool)

(assert (=> b!1212740 m!1117585))

(assert (=> b!1212744 m!1117577))

(assert (=> b!1212744 m!1117577))

(declare-fun m!1117587 () Bool)

(assert (=> b!1212744 m!1117587))

(declare-fun m!1117589 () Bool)

(assert (=> b!1212744 m!1117589))

(assert (=> b!1212744 m!1117285))

(assert (=> b!1212744 m!1117589))

(assert (=> b!1212744 m!1117285))

(declare-fun m!1117591 () Bool)

(assert (=> b!1212744 m!1117591))

(declare-fun m!1117593 () Bool)

(assert (=> d!133303 m!1117593))

(assert (=> d!133303 m!1117307))

(assert (=> b!1212742 m!1117577))

(declare-fun m!1117595 () Bool)

(assert (=> b!1212742 m!1117595))

(assert (=> b!1212742 m!1117595))

(declare-fun m!1117597 () Bool)

(assert (=> b!1212742 m!1117597))

(assert (=> b!1212742 m!1117589))

(assert (=> b!1212742 m!1117285))

(assert (=> b!1212742 m!1117589))

(assert (=> b!1212742 m!1117285))

(assert (=> b!1212742 m!1117591))

(declare-fun m!1117599 () Bool)

(assert (=> b!1212742 m!1117599))

(declare-fun m!1117601 () Bool)

(assert (=> b!1212742 m!1117601))

(assert (=> b!1212741 m!1117575))

(assert (=> bm!60143 d!133303))

(declare-fun d!133305 () Bool)

(assert (=> d!133305 (contains!6963 (+!4077 lt!550864 (tuple2!19915 (ite (or c!119663 c!119664) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119663 c!119664) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!551073 () Unit!40048)

(assert (=> d!133305 (= lt!551073 (choose!1826 lt!550864 (ite (or c!119663 c!119664) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119663 c!119664) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133305 (contains!6963 lt!550864 k0!934)))

(assert (=> d!133305 (= (addStillContains!1062 lt!550864 (ite (or c!119663 c!119664) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119663 c!119664) zeroValue!944 minValue!944) k0!934) lt!551073)))

(declare-fun bs!34192 () Bool)

(assert (= bs!34192 d!133305))

(declare-fun m!1117603 () Bool)

(assert (=> bs!34192 m!1117603))

(assert (=> bs!34192 m!1117603))

(declare-fun m!1117605 () Bool)

(assert (=> bs!34192 m!1117605))

(declare-fun m!1117607 () Bool)

(assert (=> bs!34192 m!1117607))

(assert (=> bs!34192 m!1117329))

(assert (=> bm!60150 d!133305))

(declare-fun b!1212750 () Bool)

(declare-fun e!688726 () Bool)

(declare-fun e!688728 () Bool)

(assert (=> b!1212750 (= e!688726 e!688728)))

(assert (=> b!1212750 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38287 lt!550871)))))

(declare-fun res!805409 () Bool)

(declare-fun lt!551074 () ListLongMap!17883)

(assert (=> b!1212750 (= res!805409 (contains!6963 lt!551074 (select (arr!37749 lt!550871) from!1455)))))

(assert (=> b!1212750 (=> (not res!805409) (not e!688728))))

(declare-fun b!1212751 () Bool)

(declare-fun e!688724 () Bool)

(assert (=> b!1212751 (= e!688724 (validKeyInArray!0 (select (arr!37749 lt!550871) from!1455)))))

(assert (=> b!1212751 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1212752 () Bool)

(declare-fun e!688727 () Bool)

(assert (=> b!1212752 (= e!688727 (isEmpty!998 lt!551074))))

(declare-fun b!1212754 () Bool)

(declare-fun lt!551077 () Unit!40048)

(declare-fun lt!551076 () Unit!40048)

(assert (=> b!1212754 (= lt!551077 lt!551076)))

(declare-fun lt!551080 () (_ BitVec 64))

(declare-fun lt!551078 () (_ BitVec 64))

(declare-fun lt!551079 () ListLongMap!17883)

(declare-fun lt!551075 () V!46145)

(assert (=> b!1212754 (not (contains!6963 (+!4077 lt!551079 (tuple2!19915 lt!551078 lt!551075)) lt!551080))))

(assert (=> b!1212754 (= lt!551076 (addStillNotContains!298 lt!551079 lt!551078 lt!551075 lt!551080))))

(assert (=> b!1212754 (= lt!551080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212754 (= lt!551075 (get!19258 (select (arr!37750 lt!550861) from!1455) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212754 (= lt!551078 (select (arr!37749 lt!550871) from!1455))))

(declare-fun call!60219 () ListLongMap!17883)

(assert (=> b!1212754 (= lt!551079 call!60219)))

(declare-fun e!688723 () ListLongMap!17883)

(assert (=> b!1212754 (= e!688723 (+!4077 call!60219 (tuple2!19915 (select (arr!37749 lt!550871) from!1455) (get!19258 (select (arr!37750 lt!550861) from!1455) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212755 () Bool)

(declare-fun e!688722 () ListLongMap!17883)

(assert (=> b!1212755 (= e!688722 (ListLongMap!17884 Nil!26688))))

(declare-fun b!1212756 () Bool)

(assert (=> b!1212756 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38287 lt!550871)))))

(assert (=> b!1212756 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38288 lt!550861)))))

(assert (=> b!1212756 (= e!688728 (= (apply!962 lt!551074 (select (arr!37749 lt!550871) from!1455)) (get!19258 (select (arr!37750 lt!550861) from!1455) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212757 () Bool)

(assert (=> b!1212757 (= e!688723 call!60219)))

(declare-fun b!1212758 () Bool)

(assert (=> b!1212758 (= e!688722 e!688723)))

(declare-fun c!119731 () Bool)

(assert (=> b!1212758 (= c!119731 (validKeyInArray!0 (select (arr!37749 lt!550871) from!1455)))))

(declare-fun b!1212759 () Bool)

(declare-fun res!805410 () Bool)

(declare-fun e!688725 () Bool)

(assert (=> b!1212759 (=> (not res!805410) (not e!688725))))

(assert (=> b!1212759 (= res!805410 (not (contains!6963 lt!551074 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!60216 () Bool)

(assert (=> bm!60216 (= call!60219 (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212760 () Bool)

(assert (=> b!1212760 (= e!688725 e!688726)))

(declare-fun c!119730 () Bool)

(assert (=> b!1212760 (= c!119730 e!688724)))

(declare-fun res!805408 () Bool)

(assert (=> b!1212760 (=> (not res!805408) (not e!688724))))

(assert (=> b!1212760 (= res!805408 (bvslt from!1455 (size!38287 lt!550871)))))

(declare-fun b!1212761 () Bool)

(assert (=> b!1212761 (= e!688726 e!688727)))

(declare-fun c!119729 () Bool)

(assert (=> b!1212761 (= c!119729 (bvslt from!1455 (size!38287 lt!550871)))))

(declare-fun d!133307 () Bool)

(assert (=> d!133307 e!688725))

(declare-fun res!805411 () Bool)

(assert (=> d!133307 (=> (not res!805411) (not e!688725))))

(assert (=> d!133307 (= res!805411 (not (contains!6963 lt!551074 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133307 (= lt!551074 e!688722)))

(declare-fun c!119732 () Bool)

(assert (=> d!133307 (= c!119732 (bvsge from!1455 (size!38287 lt!550871)))))

(assert (=> d!133307 (validMask!0 mask!1564)))

(assert (=> d!133307 (= (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!551074)))

(declare-fun b!1212753 () Bool)

(assert (=> b!1212753 (= e!688727 (= lt!551074 (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133307 c!119732) b!1212755))

(assert (= (and d!133307 (not c!119732)) b!1212758))

(assert (= (and b!1212758 c!119731) b!1212754))

(assert (= (and b!1212758 (not c!119731)) b!1212757))

(assert (= (or b!1212754 b!1212757) bm!60216))

(assert (= (and d!133307 res!805411) b!1212759))

(assert (= (and b!1212759 res!805410) b!1212760))

(assert (= (and b!1212760 res!805408) b!1212751))

(assert (= (and b!1212760 c!119730) b!1212750))

(assert (= (and b!1212760 (not c!119730)) b!1212761))

(assert (= (and b!1212750 res!805409) b!1212756))

(assert (= (and b!1212761 c!119729) b!1212753))

(assert (= (and b!1212761 (not c!119729)) b!1212752))

(declare-fun b_lambda!21685 () Bool)

(assert (=> (not b_lambda!21685) (not b!1212754)))

(assert (=> b!1212754 t!39720))

(declare-fun b_and!43209 () Bool)

(assert (= b_and!43207 (and (=> t!39720 result!22305) b_and!43209)))

(declare-fun b_lambda!21687 () Bool)

(assert (=> (not b_lambda!21687) (not b!1212756)))

(assert (=> b!1212756 t!39720))

(declare-fun b_and!43211 () Bool)

(assert (= b_and!43209 (and (=> t!39720 result!22305) b_and!43211)))

(declare-fun m!1117609 () Bool)

(assert (=> bm!60216 m!1117609))

(declare-fun m!1117611 () Bool)

(assert (=> b!1212751 m!1117611))

(assert (=> b!1212751 m!1117611))

(declare-fun m!1117613 () Bool)

(assert (=> b!1212751 m!1117613))

(assert (=> b!1212750 m!1117611))

(assert (=> b!1212750 m!1117611))

(declare-fun m!1117615 () Bool)

(assert (=> b!1212750 m!1117615))

(assert (=> b!1212758 m!1117611))

(assert (=> b!1212758 m!1117611))

(assert (=> b!1212758 m!1117613))

(declare-fun m!1117617 () Bool)

(assert (=> b!1212759 m!1117617))

(declare-fun m!1117619 () Bool)

(assert (=> b!1212752 m!1117619))

(assert (=> b!1212756 m!1117611))

(assert (=> b!1212756 m!1117611))

(declare-fun m!1117621 () Bool)

(assert (=> b!1212756 m!1117621))

(declare-fun m!1117623 () Bool)

(assert (=> b!1212756 m!1117623))

(assert (=> b!1212756 m!1117285))

(assert (=> b!1212756 m!1117623))

(assert (=> b!1212756 m!1117285))

(declare-fun m!1117625 () Bool)

(assert (=> b!1212756 m!1117625))

(declare-fun m!1117627 () Bool)

(assert (=> d!133307 m!1117627))

(assert (=> d!133307 m!1117307))

(assert (=> b!1212754 m!1117611))

(declare-fun m!1117629 () Bool)

(assert (=> b!1212754 m!1117629))

(assert (=> b!1212754 m!1117629))

(declare-fun m!1117631 () Bool)

(assert (=> b!1212754 m!1117631))

(assert (=> b!1212754 m!1117623))

(assert (=> b!1212754 m!1117285))

(assert (=> b!1212754 m!1117623))

(assert (=> b!1212754 m!1117285))

(assert (=> b!1212754 m!1117625))

(declare-fun m!1117633 () Bool)

(assert (=> b!1212754 m!1117633))

(declare-fun m!1117635 () Bool)

(assert (=> b!1212754 m!1117635))

(assert (=> b!1212753 m!1117609))

(assert (=> b!1212435 d!133307))

(declare-fun b!1212762 () Bool)

(declare-fun e!688733 () Bool)

(declare-fun e!688735 () Bool)

(assert (=> b!1212762 (= e!688733 e!688735)))

(assert (=> b!1212762 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38287 _keys!1208)))))

(declare-fun lt!551081 () ListLongMap!17883)

(declare-fun res!805413 () Bool)

(assert (=> b!1212762 (= res!805413 (contains!6963 lt!551081 (select (arr!37749 _keys!1208) from!1455)))))

(assert (=> b!1212762 (=> (not res!805413) (not e!688735))))

(declare-fun b!1212763 () Bool)

(declare-fun e!688731 () Bool)

(assert (=> b!1212763 (= e!688731 (validKeyInArray!0 (select (arr!37749 _keys!1208) from!1455)))))

(assert (=> b!1212763 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1212764 () Bool)

(declare-fun e!688734 () Bool)

(assert (=> b!1212764 (= e!688734 (isEmpty!998 lt!551081))))

(declare-fun b!1212766 () Bool)

(declare-fun lt!551084 () Unit!40048)

(declare-fun lt!551083 () Unit!40048)

(assert (=> b!1212766 (= lt!551084 lt!551083)))

(declare-fun lt!551087 () (_ BitVec 64))

(declare-fun lt!551085 () (_ BitVec 64))

(declare-fun lt!551082 () V!46145)

(declare-fun lt!551086 () ListLongMap!17883)

(assert (=> b!1212766 (not (contains!6963 (+!4077 lt!551086 (tuple2!19915 lt!551085 lt!551082)) lt!551087))))

(assert (=> b!1212766 (= lt!551083 (addStillNotContains!298 lt!551086 lt!551085 lt!551082 lt!551087))))

(assert (=> b!1212766 (= lt!551087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212766 (= lt!551082 (get!19258 (select (arr!37750 _values!996) from!1455) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212766 (= lt!551085 (select (arr!37749 _keys!1208) from!1455))))

(declare-fun call!60220 () ListLongMap!17883)

(assert (=> b!1212766 (= lt!551086 call!60220)))

(declare-fun e!688730 () ListLongMap!17883)

(assert (=> b!1212766 (= e!688730 (+!4077 call!60220 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) (get!19258 (select (arr!37750 _values!996) from!1455) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212767 () Bool)

(declare-fun e!688729 () ListLongMap!17883)

(assert (=> b!1212767 (= e!688729 (ListLongMap!17884 Nil!26688))))

(declare-fun b!1212768 () Bool)

(assert (=> b!1212768 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38287 _keys!1208)))))

(assert (=> b!1212768 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38288 _values!996)))))

(assert (=> b!1212768 (= e!688735 (= (apply!962 lt!551081 (select (arr!37749 _keys!1208) from!1455)) (get!19258 (select (arr!37750 _values!996) from!1455) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212769 () Bool)

(assert (=> b!1212769 (= e!688730 call!60220)))

(declare-fun b!1212770 () Bool)

(assert (=> b!1212770 (= e!688729 e!688730)))

(declare-fun c!119735 () Bool)

(assert (=> b!1212770 (= c!119735 (validKeyInArray!0 (select (arr!37749 _keys!1208) from!1455)))))

(declare-fun b!1212771 () Bool)

(declare-fun res!805414 () Bool)

(declare-fun e!688732 () Bool)

(assert (=> b!1212771 (=> (not res!805414) (not e!688732))))

(assert (=> b!1212771 (= res!805414 (not (contains!6963 lt!551081 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!60217 () Bool)

(assert (=> bm!60217 (= call!60220 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212772 () Bool)

(assert (=> b!1212772 (= e!688732 e!688733)))

(declare-fun c!119734 () Bool)

(assert (=> b!1212772 (= c!119734 e!688731)))

(declare-fun res!805412 () Bool)

(assert (=> b!1212772 (=> (not res!805412) (not e!688731))))

(assert (=> b!1212772 (= res!805412 (bvslt from!1455 (size!38287 _keys!1208)))))

(declare-fun b!1212773 () Bool)

(assert (=> b!1212773 (= e!688733 e!688734)))

(declare-fun c!119733 () Bool)

(assert (=> b!1212773 (= c!119733 (bvslt from!1455 (size!38287 _keys!1208)))))

(declare-fun d!133309 () Bool)

(assert (=> d!133309 e!688732))

(declare-fun res!805415 () Bool)

(assert (=> d!133309 (=> (not res!805415) (not e!688732))))

(assert (=> d!133309 (= res!805415 (not (contains!6963 lt!551081 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133309 (= lt!551081 e!688729)))

(declare-fun c!119736 () Bool)

(assert (=> d!133309 (= c!119736 (bvsge from!1455 (size!38287 _keys!1208)))))

(assert (=> d!133309 (validMask!0 mask!1564)))

(assert (=> d!133309 (= (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!551081)))

(declare-fun b!1212765 () Bool)

(assert (=> b!1212765 (= e!688734 (= lt!551081 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133309 c!119736) b!1212767))

(assert (= (and d!133309 (not c!119736)) b!1212770))

(assert (= (and b!1212770 c!119735) b!1212766))

(assert (= (and b!1212770 (not c!119735)) b!1212769))

(assert (= (or b!1212766 b!1212769) bm!60217))

(assert (= (and d!133309 res!805415) b!1212771))

(assert (= (and b!1212771 res!805414) b!1212772))

(assert (= (and b!1212772 res!805412) b!1212763))

(assert (= (and b!1212772 c!119734) b!1212762))

(assert (= (and b!1212772 (not c!119734)) b!1212773))

(assert (= (and b!1212762 res!805413) b!1212768))

(assert (= (and b!1212773 c!119733) b!1212765))

(assert (= (and b!1212773 (not c!119733)) b!1212764))

(declare-fun b_lambda!21689 () Bool)

(assert (=> (not b_lambda!21689) (not b!1212766)))

(assert (=> b!1212766 t!39720))

(declare-fun b_and!43213 () Bool)

(assert (= b_and!43211 (and (=> t!39720 result!22305) b_and!43213)))

(declare-fun b_lambda!21691 () Bool)

(assert (=> (not b_lambda!21691) (not b!1212768)))

(assert (=> b!1212768 t!39720))

(declare-fun b_and!43215 () Bool)

(assert (= b_and!43213 (and (=> t!39720 result!22305) b_and!43215)))

(declare-fun m!1117637 () Bool)

(assert (=> bm!60217 m!1117637))

(assert (=> b!1212763 m!1117313))

(assert (=> b!1212763 m!1117313))

(declare-fun m!1117639 () Bool)

(assert (=> b!1212763 m!1117639))

(assert (=> b!1212762 m!1117313))

(assert (=> b!1212762 m!1117313))

(declare-fun m!1117641 () Bool)

(assert (=> b!1212762 m!1117641))

(assert (=> b!1212770 m!1117313))

(assert (=> b!1212770 m!1117313))

(assert (=> b!1212770 m!1117639))

(declare-fun m!1117643 () Bool)

(assert (=> b!1212771 m!1117643))

(declare-fun m!1117645 () Bool)

(assert (=> b!1212764 m!1117645))

(assert (=> b!1212768 m!1117313))

(assert (=> b!1212768 m!1117313))

(declare-fun m!1117647 () Bool)

(assert (=> b!1212768 m!1117647))

(assert (=> b!1212768 m!1117319))

(assert (=> b!1212768 m!1117285))

(assert (=> b!1212768 m!1117319))

(assert (=> b!1212768 m!1117285))

(declare-fun m!1117649 () Bool)

(assert (=> b!1212768 m!1117649))

(declare-fun m!1117651 () Bool)

(assert (=> d!133309 m!1117651))

(assert (=> d!133309 m!1117307))

(assert (=> b!1212766 m!1117313))

(declare-fun m!1117653 () Bool)

(assert (=> b!1212766 m!1117653))

(assert (=> b!1212766 m!1117653))

(declare-fun m!1117655 () Bool)

(assert (=> b!1212766 m!1117655))

(assert (=> b!1212766 m!1117319))

(assert (=> b!1212766 m!1117285))

(assert (=> b!1212766 m!1117319))

(assert (=> b!1212766 m!1117285))

(assert (=> b!1212766 m!1117649))

(declare-fun m!1117657 () Bool)

(assert (=> b!1212766 m!1117657))

(declare-fun m!1117659 () Bool)

(assert (=> b!1212766 m!1117659))

(assert (=> b!1212765 m!1117637))

(assert (=> b!1212435 d!133309))

(declare-fun d!133311 () Bool)

(declare-fun res!805416 () Bool)

(declare-fun e!688736 () Bool)

(assert (=> d!133311 (=> res!805416 e!688736)))

(assert (=> d!133311 (= res!805416 (= (select (arr!37749 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133311 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!688736)))

(declare-fun b!1212774 () Bool)

(declare-fun e!688737 () Bool)

(assert (=> b!1212774 (= e!688736 e!688737)))

(declare-fun res!805417 () Bool)

(assert (=> b!1212774 (=> (not res!805417) (not e!688737))))

(assert (=> b!1212774 (= res!805417 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38287 _keys!1208)))))

(declare-fun b!1212775 () Bool)

(assert (=> b!1212775 (= e!688737 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133311 (not res!805416)) b!1212774))

(assert (= (and b!1212774 res!805417) b!1212775))

(assert (=> d!133311 m!1117535))

(declare-fun m!1117661 () Bool)

(assert (=> b!1212775 m!1117661))

(assert (=> b!1212436 d!133311))

(declare-fun d!133313 () Bool)

(assert (=> d!133313 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551090 () Unit!40048)

(declare-fun choose!13 (array!78226 (_ BitVec 64) (_ BitVec 32)) Unit!40048)

(assert (=> d!133313 (= lt!551090 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133313 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133313 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!551090)))

(declare-fun bs!34193 () Bool)

(assert (= bs!34193 d!133313))

(assert (=> bs!34193 m!1117263))

(declare-fun m!1117663 () Bool)

(assert (=> bs!34193 m!1117663))

(assert (=> b!1212436 d!133313))

(declare-fun d!133315 () Bool)

(declare-fun e!688740 () Bool)

(assert (=> d!133315 e!688740))

(declare-fun c!119739 () Bool)

(assert (=> d!133315 (= c!119739 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!551093 () Unit!40048)

(declare-fun choose!1827 (array!78226 array!78228 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> d!133315 (= lt!551093 (choose!1827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133315 (validMask!0 mask!1564)))

(assert (=> d!133315 (= (lemmaListMapContainsThenArrayContainsFrom!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551093)))

(declare-fun b!1212780 () Bool)

(assert (=> b!1212780 (= e!688740 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212781 () Bool)

(assert (=> b!1212781 (= e!688740 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133315 c!119739) b!1212780))

(assert (= (and d!133315 (not c!119739)) b!1212781))

(declare-fun m!1117665 () Bool)

(assert (=> d!133315 m!1117665))

(assert (=> d!133315 m!1117307))

(assert (=> b!1212780 m!1117259))

(assert (=> b!1212459 d!133315))

(declare-fun d!133317 () Bool)

(assert (=> d!133317 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26689)))

(declare-fun lt!551096 () Unit!40048)

(declare-fun choose!39 (array!78226 (_ BitVec 32) (_ BitVec 32)) Unit!40048)

(assert (=> d!133317 (= lt!551096 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133317 (bvslt (size!38287 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133317 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!551096)))

(declare-fun bs!34194 () Bool)

(assert (= bs!34194 d!133317))

(assert (=> bs!34194 m!1117301))

(declare-fun m!1117667 () Bool)

(assert (=> bs!34194 m!1117667))

(assert (=> b!1212459 d!133317))

(declare-fun b!1212782 () Bool)

(declare-fun e!688741 () Bool)

(declare-fun e!688743 () Bool)

(assert (=> b!1212782 (= e!688741 e!688743)))

(declare-fun res!805420 () Bool)

(assert (=> b!1212782 (=> (not res!805420) (not e!688743))))

(declare-fun e!688742 () Bool)

(assert (=> b!1212782 (= res!805420 (not e!688742))))

(declare-fun res!805418 () Bool)

(assert (=> b!1212782 (=> (not res!805418) (not e!688742))))

(assert (=> b!1212782 (= res!805418 (validKeyInArray!0 (select (arr!37749 _keys!1208) from!1455)))))

(declare-fun d!133319 () Bool)

(declare-fun res!805419 () Bool)

(assert (=> d!133319 (=> res!805419 e!688741)))

(assert (=> d!133319 (= res!805419 (bvsge from!1455 (size!38287 _keys!1208)))))

(assert (=> d!133319 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26689) e!688741)))

(declare-fun b!1212783 () Bool)

(declare-fun e!688744 () Bool)

(assert (=> b!1212783 (= e!688743 e!688744)))

(declare-fun c!119740 () Bool)

(assert (=> b!1212783 (= c!119740 (validKeyInArray!0 (select (arr!37749 _keys!1208) from!1455)))))

(declare-fun b!1212784 () Bool)

(assert (=> b!1212784 (= e!688742 (contains!6965 Nil!26689 (select (arr!37749 _keys!1208) from!1455)))))

(declare-fun b!1212785 () Bool)

(declare-fun call!60221 () Bool)

(assert (=> b!1212785 (= e!688744 call!60221)))

(declare-fun bm!60218 () Bool)

(assert (=> bm!60218 (= call!60221 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119740 (Cons!26688 (select (arr!37749 _keys!1208) from!1455) Nil!26689) Nil!26689)))))

(declare-fun b!1212786 () Bool)

(assert (=> b!1212786 (= e!688744 call!60221)))

(assert (= (and d!133319 (not res!805419)) b!1212782))

(assert (= (and b!1212782 res!805418) b!1212784))

(assert (= (and b!1212782 res!805420) b!1212783))

(assert (= (and b!1212783 c!119740) b!1212786))

(assert (= (and b!1212783 (not c!119740)) b!1212785))

(assert (= (or b!1212786 b!1212785) bm!60218))

(assert (=> b!1212782 m!1117313))

(assert (=> b!1212782 m!1117313))

(assert (=> b!1212782 m!1117639))

(assert (=> b!1212783 m!1117313))

(assert (=> b!1212783 m!1117313))

(assert (=> b!1212783 m!1117639))

(assert (=> b!1212784 m!1117313))

(assert (=> b!1212784 m!1117313))

(declare-fun m!1117669 () Bool)

(assert (=> b!1212784 m!1117669))

(assert (=> bm!60218 m!1117313))

(declare-fun m!1117671 () Bool)

(assert (=> bm!60218 m!1117671))

(assert (=> b!1212459 d!133319))

(declare-fun d!133321 () Bool)

(assert (=> d!133321 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38287 _keys!1208)) (not (= (select (arr!37749 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!551099 () Unit!40048)

(declare-fun choose!21 (array!78226 (_ BitVec 64) (_ BitVec 32) List!26692) Unit!40048)

(assert (=> d!133321 (= lt!551099 (choose!21 _keys!1208 k0!934 from!1455 Nil!26689))))

(assert (=> d!133321 (bvslt (size!38287 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133321 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26689) lt!551099)))

(declare-fun bs!34195 () Bool)

(assert (= bs!34195 d!133321))

(assert (=> bs!34195 m!1117313))

(declare-fun m!1117673 () Bool)

(assert (=> bs!34195 m!1117673))

(assert (=> b!1212459 d!133321))

(declare-fun d!133323 () Bool)

(declare-fun e!688745 () Bool)

(assert (=> d!133323 e!688745))

(declare-fun res!805421 () Bool)

(assert (=> d!133323 (=> (not res!805421) (not e!688745))))

(declare-fun lt!551101 () ListLongMap!17883)

(assert (=> d!133323 (= res!805421 (contains!6963 lt!551101 (_1!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!551103 () List!26691)

(assert (=> d!133323 (= lt!551101 (ListLongMap!17884 lt!551103))))

(declare-fun lt!551102 () Unit!40048)

(declare-fun lt!551100 () Unit!40048)

(assert (=> d!133323 (= lt!551102 lt!551100)))

(assert (=> d!133323 (= (getValueByKey!642 lt!551103 (_1!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!692 (_2!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133323 (= lt!551100 (lemmaContainsTupThenGetReturnValue!318 lt!551103 (_1!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133323 (= lt!551103 (insertStrictlySorted!411 (toList!8957 (ite c!119663 lt!550855 lt!550864)) (_1!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133323 (= (+!4077 (ite c!119663 lt!550855 lt!550864) (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!551101)))

(declare-fun b!1212787 () Bool)

(declare-fun res!805422 () Bool)

(assert (=> b!1212787 (=> (not res!805422) (not e!688745))))

(assert (=> b!1212787 (= res!805422 (= (getValueByKey!642 (toList!8957 lt!551101) (_1!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!692 (_2!9968 (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1212788 () Bool)

(assert (=> b!1212788 (= e!688745 (contains!6964 (toList!8957 lt!551101) (ite c!119663 (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119664 (tuple2!19915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133323 res!805421) b!1212787))

(assert (= (and b!1212787 res!805422) b!1212788))

(declare-fun m!1117675 () Bool)

(assert (=> d!133323 m!1117675))

(declare-fun m!1117677 () Bool)

(assert (=> d!133323 m!1117677))

(declare-fun m!1117679 () Bool)

(assert (=> d!133323 m!1117679))

(declare-fun m!1117681 () Bool)

(assert (=> d!133323 m!1117681))

(declare-fun m!1117683 () Bool)

(assert (=> b!1212787 m!1117683))

(declare-fun m!1117685 () Bool)

(assert (=> b!1212788 m!1117685))

(assert (=> bm!60145 d!133323))

(declare-fun b!1212789 () Bool)

(declare-fun e!688750 () Bool)

(declare-fun e!688752 () Bool)

(assert (=> b!1212789 (= e!688750 e!688752)))

(assert (=> b!1212789 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 _keys!1208)))))

(declare-fun lt!551104 () ListLongMap!17883)

(declare-fun res!805424 () Bool)

(assert (=> b!1212789 (= res!805424 (contains!6963 lt!551104 (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212789 (=> (not res!805424) (not e!688752))))

(declare-fun b!1212790 () Bool)

(declare-fun e!688748 () Bool)

(assert (=> b!1212790 (= e!688748 (validKeyInArray!0 (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212790 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1212791 () Bool)

(declare-fun e!688751 () Bool)

(assert (=> b!1212791 (= e!688751 (isEmpty!998 lt!551104))))

(declare-fun b!1212793 () Bool)

(declare-fun lt!551107 () Unit!40048)

(declare-fun lt!551106 () Unit!40048)

(assert (=> b!1212793 (= lt!551107 lt!551106)))

(declare-fun lt!551105 () V!46145)

(declare-fun lt!551110 () (_ BitVec 64))

(declare-fun lt!551109 () ListLongMap!17883)

(declare-fun lt!551108 () (_ BitVec 64))

(assert (=> b!1212793 (not (contains!6963 (+!4077 lt!551109 (tuple2!19915 lt!551108 lt!551105)) lt!551110))))

(assert (=> b!1212793 (= lt!551106 (addStillNotContains!298 lt!551109 lt!551108 lt!551105 lt!551110))))

(assert (=> b!1212793 (= lt!551110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212793 (= lt!551105 (get!19258 (select (arr!37750 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212793 (= lt!551108 (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60222 () ListLongMap!17883)

(assert (=> b!1212793 (= lt!551109 call!60222)))

(declare-fun e!688747 () ListLongMap!17883)

(assert (=> b!1212793 (= e!688747 (+!4077 call!60222 (tuple2!19915 (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19258 (select (arr!37750 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212794 () Bool)

(declare-fun e!688746 () ListLongMap!17883)

(assert (=> b!1212794 (= e!688746 (ListLongMap!17884 Nil!26688))))

(declare-fun b!1212795 () Bool)

(assert (=> b!1212795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 _keys!1208)))))

(assert (=> b!1212795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38288 _values!996)))))

(assert (=> b!1212795 (= e!688752 (= (apply!962 lt!551104 (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19258 (select (arr!37750 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212796 () Bool)

(assert (=> b!1212796 (= e!688747 call!60222)))

(declare-fun b!1212797 () Bool)

(assert (=> b!1212797 (= e!688746 e!688747)))

(declare-fun c!119743 () Bool)

(assert (=> b!1212797 (= c!119743 (validKeyInArray!0 (select (arr!37749 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212798 () Bool)

(declare-fun res!805425 () Bool)

(declare-fun e!688749 () Bool)

(assert (=> b!1212798 (=> (not res!805425) (not e!688749))))

(assert (=> b!1212798 (= res!805425 (not (contains!6963 lt!551104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!60219 () Bool)

(assert (=> bm!60219 (= call!60222 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212799 () Bool)

(assert (=> b!1212799 (= e!688749 e!688750)))

(declare-fun c!119742 () Bool)

(assert (=> b!1212799 (= c!119742 e!688748)))

(declare-fun res!805423 () Bool)

(assert (=> b!1212799 (=> (not res!805423) (not e!688748))))

(assert (=> b!1212799 (= res!805423 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 _keys!1208)))))

(declare-fun b!1212800 () Bool)

(assert (=> b!1212800 (= e!688750 e!688751)))

(declare-fun c!119741 () Bool)

(assert (=> b!1212800 (= c!119741 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 _keys!1208)))))

(declare-fun d!133325 () Bool)

(assert (=> d!133325 e!688749))

(declare-fun res!805426 () Bool)

(assert (=> d!133325 (=> (not res!805426) (not e!688749))))

(assert (=> d!133325 (= res!805426 (not (contains!6963 lt!551104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133325 (= lt!551104 e!688746)))

(declare-fun c!119744 () Bool)

(assert (=> d!133325 (= c!119744 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 _keys!1208)))))

(assert (=> d!133325 (validMask!0 mask!1564)))

(assert (=> d!133325 (= (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551104)))

(declare-fun b!1212792 () Bool)

(assert (=> b!1212792 (= e!688751 (= lt!551104 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133325 c!119744) b!1212794))

(assert (= (and d!133325 (not c!119744)) b!1212797))

(assert (= (and b!1212797 c!119743) b!1212793))

(assert (= (and b!1212797 (not c!119743)) b!1212796))

(assert (= (or b!1212793 b!1212796) bm!60219))

(assert (= (and d!133325 res!805426) b!1212798))

(assert (= (and b!1212798 res!805425) b!1212799))

(assert (= (and b!1212799 res!805423) b!1212790))

(assert (= (and b!1212799 c!119742) b!1212789))

(assert (= (and b!1212799 (not c!119742)) b!1212800))

(assert (= (and b!1212789 res!805424) b!1212795))

(assert (= (and b!1212800 c!119741) b!1212792))

(assert (= (and b!1212800 (not c!119741)) b!1212791))

(declare-fun b_lambda!21693 () Bool)

(assert (=> (not b_lambda!21693) (not b!1212793)))

(assert (=> b!1212793 t!39720))

(declare-fun b_and!43217 () Bool)

(assert (= b_and!43215 (and (=> t!39720 result!22305) b_and!43217)))

(declare-fun b_lambda!21695 () Bool)

(assert (=> (not b_lambda!21695) (not b!1212795)))

(assert (=> b!1212795 t!39720))

(declare-fun b_and!43219 () Bool)

(assert (= b_and!43217 (and (=> t!39720 result!22305) b_and!43219)))

(declare-fun m!1117687 () Bool)

(assert (=> bm!60219 m!1117687))

(assert (=> b!1212790 m!1117559))

(assert (=> b!1212790 m!1117559))

(declare-fun m!1117689 () Bool)

(assert (=> b!1212790 m!1117689))

(assert (=> b!1212789 m!1117559))

(assert (=> b!1212789 m!1117559))

(declare-fun m!1117691 () Bool)

(assert (=> b!1212789 m!1117691))

(assert (=> b!1212797 m!1117559))

(assert (=> b!1212797 m!1117559))

(assert (=> b!1212797 m!1117689))

(declare-fun m!1117693 () Bool)

(assert (=> b!1212798 m!1117693))

(declare-fun m!1117695 () Bool)

(assert (=> b!1212791 m!1117695))

(assert (=> b!1212795 m!1117559))

(assert (=> b!1212795 m!1117559))

(declare-fun m!1117697 () Bool)

(assert (=> b!1212795 m!1117697))

(declare-fun m!1117699 () Bool)

(assert (=> b!1212795 m!1117699))

(assert (=> b!1212795 m!1117285))

(assert (=> b!1212795 m!1117699))

(assert (=> b!1212795 m!1117285))

(declare-fun m!1117701 () Bool)

(assert (=> b!1212795 m!1117701))

(declare-fun m!1117703 () Bool)

(assert (=> d!133325 m!1117703))

(assert (=> d!133325 m!1117307))

(assert (=> b!1212793 m!1117559))

(declare-fun m!1117705 () Bool)

(assert (=> b!1212793 m!1117705))

(assert (=> b!1212793 m!1117705))

(declare-fun m!1117707 () Bool)

(assert (=> b!1212793 m!1117707))

(assert (=> b!1212793 m!1117699))

(assert (=> b!1212793 m!1117285))

(assert (=> b!1212793 m!1117699))

(assert (=> b!1212793 m!1117285))

(assert (=> b!1212793 m!1117701))

(declare-fun m!1117709 () Bool)

(assert (=> b!1212793 m!1117709))

(declare-fun m!1117711 () Bool)

(assert (=> b!1212793 m!1117711))

(assert (=> b!1212792 m!1117687))

(assert (=> b!1212455 d!133325))

(declare-fun d!133327 () Bool)

(declare-fun lt!551111 () ListLongMap!17883)

(assert (=> d!133327 (not (contains!6963 lt!551111 (select (arr!37749 _keys!1208) from!1455)))))

(assert (=> d!133327 (= lt!551111 (ListLongMap!17884 (removeStrictlySorted!102 (toList!8957 (+!4077 lt!550864 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))) (select (arr!37749 _keys!1208) from!1455))))))

(assert (=> d!133327 (= (-!1834 (+!4077 lt!550864 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)) (select (arr!37749 _keys!1208) from!1455)) lt!551111)))

(declare-fun bs!34196 () Bool)

(assert (= bs!34196 d!133327))

(assert (=> bs!34196 m!1117313))

(declare-fun m!1117713 () Bool)

(assert (=> bs!34196 m!1117713))

(assert (=> bs!34196 m!1117313))

(declare-fun m!1117715 () Bool)

(assert (=> bs!34196 m!1117715))

(assert (=> b!1212455 d!133327))

(declare-fun d!133329 () Bool)

(declare-fun lt!551112 () ListLongMap!17883)

(assert (=> d!133329 (not (contains!6963 lt!551112 k0!934))))

(assert (=> d!133329 (= lt!551112 (ListLongMap!17884 (removeStrictlySorted!102 (toList!8957 lt!550866) k0!934)))))

(assert (=> d!133329 (= (-!1834 lt!550866 k0!934) lt!551112)))

(declare-fun bs!34197 () Bool)

(assert (= bs!34197 d!133329))

(declare-fun m!1117717 () Bool)

(assert (=> bs!34197 m!1117717))

(declare-fun m!1117719 () Bool)

(assert (=> bs!34197 m!1117719))

(assert (=> b!1212455 d!133329))

(declare-fun d!133331 () Bool)

(assert (=> d!133331 (= (-!1834 (+!4077 lt!550864 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)) (select (arr!37749 _keys!1208) from!1455)) lt!550864)))

(declare-fun lt!551115 () Unit!40048)

(declare-fun choose!1828 (ListLongMap!17883 (_ BitVec 64) V!46145) Unit!40048)

(assert (=> d!133331 (= lt!551115 (choose!1828 lt!550864 (select (arr!37749 _keys!1208) from!1455) lt!550853))))

(assert (=> d!133331 (not (contains!6963 lt!550864 (select (arr!37749 _keys!1208) from!1455)))))

(assert (=> d!133331 (= (addThenRemoveForNewKeyIsSame!269 lt!550864 (select (arr!37749 _keys!1208) from!1455) lt!550853) lt!551115)))

(declare-fun bs!34198 () Bool)

(assert (= bs!34198 d!133331))

(assert (=> bs!34198 m!1117327))

(assert (=> bs!34198 m!1117327))

(assert (=> bs!34198 m!1117313))

(assert (=> bs!34198 m!1117333))

(assert (=> bs!34198 m!1117313))

(declare-fun m!1117721 () Bool)

(assert (=> bs!34198 m!1117721))

(assert (=> bs!34198 m!1117313))

(declare-fun m!1117723 () Bool)

(assert (=> bs!34198 m!1117723))

(assert (=> b!1212455 d!133331))

(declare-fun d!133333 () Bool)

(declare-fun c!119747 () Bool)

(assert (=> d!133333 (= c!119747 ((_ is ValueCellFull!14672) (select (arr!37750 _values!996) from!1455)))))

(declare-fun e!688755 () V!46145)

(assert (=> d!133333 (= (get!19258 (select (arr!37750 _values!996) from!1455) lt!550868) e!688755)))

(declare-fun b!1212805 () Bool)

(declare-fun get!19259 (ValueCell!14672 V!46145) V!46145)

(assert (=> b!1212805 (= e!688755 (get!19259 (select (arr!37750 _values!996) from!1455) lt!550868))))

(declare-fun b!1212806 () Bool)

(declare-fun get!19260 (ValueCell!14672 V!46145) V!46145)

(assert (=> b!1212806 (= e!688755 (get!19260 (select (arr!37750 _values!996) from!1455) lt!550868))))

(assert (= (and d!133333 c!119747) b!1212805))

(assert (= (and d!133333 (not c!119747)) b!1212806))

(assert (=> b!1212805 m!1117319))

(declare-fun m!1117725 () Bool)

(assert (=> b!1212805 m!1117725))

(assert (=> b!1212806 m!1117319))

(declare-fun m!1117727 () Bool)

(assert (=> b!1212806 m!1117727))

(assert (=> b!1212455 d!133333))

(declare-fun d!133335 () Bool)

(declare-fun e!688756 () Bool)

(assert (=> d!133335 e!688756))

(declare-fun res!805427 () Bool)

(assert (=> d!133335 (=> res!805427 e!688756)))

(declare-fun lt!551116 () Bool)

(assert (=> d!133335 (= res!805427 (not lt!551116))))

(declare-fun lt!551117 () Bool)

(assert (=> d!133335 (= lt!551116 lt!551117)))

(declare-fun lt!551118 () Unit!40048)

(declare-fun e!688757 () Unit!40048)

(assert (=> d!133335 (= lt!551118 e!688757)))

(declare-fun c!119748 () Bool)

(assert (=> d!133335 (= c!119748 lt!551117)))

(assert (=> d!133335 (= lt!551117 (containsKey!596 (toList!8957 lt!550864) k0!934))))

(assert (=> d!133335 (= (contains!6963 lt!550864 k0!934) lt!551116)))

(declare-fun b!1212807 () Bool)

(declare-fun lt!551119 () Unit!40048)

(assert (=> b!1212807 (= e!688757 lt!551119)))

(assert (=> b!1212807 (= lt!551119 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8957 lt!550864) k0!934))))

(assert (=> b!1212807 (isDefined!468 (getValueByKey!642 (toList!8957 lt!550864) k0!934))))

(declare-fun b!1212808 () Bool)

(declare-fun Unit!40061 () Unit!40048)

(assert (=> b!1212808 (= e!688757 Unit!40061)))

(declare-fun b!1212809 () Bool)

(assert (=> b!1212809 (= e!688756 (isDefined!468 (getValueByKey!642 (toList!8957 lt!550864) k0!934)))))

(assert (= (and d!133335 c!119748) b!1212807))

(assert (= (and d!133335 (not c!119748)) b!1212808))

(assert (= (and d!133335 (not res!805427)) b!1212809))

(declare-fun m!1117729 () Bool)

(assert (=> d!133335 m!1117729))

(declare-fun m!1117731 () Bool)

(assert (=> b!1212807 m!1117731))

(declare-fun m!1117733 () Bool)

(assert (=> b!1212807 m!1117733))

(assert (=> b!1212807 m!1117733))

(declare-fun m!1117735 () Bool)

(assert (=> b!1212807 m!1117735))

(assert (=> b!1212809 m!1117733))

(assert (=> b!1212809 m!1117733))

(assert (=> b!1212809 m!1117735))

(assert (=> b!1212455 d!133335))

(declare-fun d!133337 () Bool)

(declare-fun e!688758 () Bool)

(assert (=> d!133337 e!688758))

(declare-fun res!805428 () Bool)

(assert (=> d!133337 (=> (not res!805428) (not e!688758))))

(declare-fun lt!551121 () ListLongMap!17883)

(assert (=> d!133337 (= res!805428 (contains!6963 lt!551121 (_1!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))))))

(declare-fun lt!551123 () List!26691)

(assert (=> d!133337 (= lt!551121 (ListLongMap!17884 lt!551123))))

(declare-fun lt!551122 () Unit!40048)

(declare-fun lt!551120 () Unit!40048)

(assert (=> d!133337 (= lt!551122 lt!551120)))

(assert (=> d!133337 (= (getValueByKey!642 lt!551123 (_1!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))) (Some!692 (_2!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))))))

(assert (=> d!133337 (= lt!551120 (lemmaContainsTupThenGetReturnValue!318 lt!551123 (_1!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)) (_2!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))))))

(assert (=> d!133337 (= lt!551123 (insertStrictlySorted!411 (toList!8957 lt!550864) (_1!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)) (_2!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))))))

(assert (=> d!133337 (= (+!4077 lt!550864 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)) lt!551121)))

(declare-fun b!1212810 () Bool)

(declare-fun res!805429 () Bool)

(assert (=> b!1212810 (=> (not res!805429) (not e!688758))))

(assert (=> b!1212810 (= res!805429 (= (getValueByKey!642 (toList!8957 lt!551121) (_1!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853))) (Some!692 (_2!9968 (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)))))))

(declare-fun b!1212811 () Bool)

(assert (=> b!1212811 (= e!688758 (contains!6964 (toList!8957 lt!551121) (tuple2!19915 (select (arr!37749 _keys!1208) from!1455) lt!550853)))))

(assert (= (and d!133337 res!805428) b!1212810))

(assert (= (and b!1212810 res!805429) b!1212811))

(declare-fun m!1117737 () Bool)

(assert (=> d!133337 m!1117737))

(declare-fun m!1117739 () Bool)

(assert (=> d!133337 m!1117739))

(declare-fun m!1117741 () Bool)

(assert (=> d!133337 m!1117741))

(declare-fun m!1117743 () Bool)

(assert (=> d!133337 m!1117743))

(declare-fun m!1117745 () Bool)

(assert (=> b!1212810 m!1117745))

(declare-fun m!1117747 () Bool)

(assert (=> b!1212811 m!1117747))

(assert (=> b!1212455 d!133337))

(declare-fun b!1212812 () Bool)

(declare-fun e!688763 () Bool)

(declare-fun e!688765 () Bool)

(assert (=> b!1212812 (= e!688763 e!688765)))

(assert (=> b!1212812 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 lt!550871 _keys!1208))))))

(declare-fun res!805431 () Bool)

(declare-fun lt!551124 () ListLongMap!17883)

(assert (=> b!1212812 (= res!805431 (contains!6963 lt!551124 (select (arr!37749 (ite c!119662 lt!550871 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212812 (=> (not res!805431) (not e!688765))))

(declare-fun b!1212813 () Bool)

(declare-fun e!688761 () Bool)

(assert (=> b!1212813 (= e!688761 (validKeyInArray!0 (select (arr!37749 (ite c!119662 lt!550871 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212813 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1212814 () Bool)

(declare-fun e!688764 () Bool)

(assert (=> b!1212814 (= e!688764 (isEmpty!998 lt!551124))))

(declare-fun b!1212816 () Bool)

(declare-fun lt!551127 () Unit!40048)

(declare-fun lt!551126 () Unit!40048)

(assert (=> b!1212816 (= lt!551127 lt!551126)))

(declare-fun lt!551129 () ListLongMap!17883)

(declare-fun lt!551128 () (_ BitVec 64))

(declare-fun lt!551125 () V!46145)

(declare-fun lt!551130 () (_ BitVec 64))

(assert (=> b!1212816 (not (contains!6963 (+!4077 lt!551129 (tuple2!19915 lt!551128 lt!551125)) lt!551130))))

(assert (=> b!1212816 (= lt!551126 (addStillNotContains!298 lt!551129 lt!551128 lt!551125 lt!551130))))

(assert (=> b!1212816 (= lt!551130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212816 (= lt!551125 (get!19258 (select (arr!37750 (ite c!119662 lt!550861 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212816 (= lt!551128 (select (arr!37749 (ite c!119662 lt!550871 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60223 () ListLongMap!17883)

(assert (=> b!1212816 (= lt!551129 call!60223)))

(declare-fun e!688760 () ListLongMap!17883)

(assert (=> b!1212816 (= e!688760 (+!4077 call!60223 (tuple2!19915 (select (arr!37749 (ite c!119662 lt!550871 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19258 (select (arr!37750 (ite c!119662 lt!550861 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212817 () Bool)

(declare-fun e!688759 () ListLongMap!17883)

(assert (=> b!1212817 (= e!688759 (ListLongMap!17884 Nil!26688))))

(declare-fun b!1212818 () Bool)

(assert (=> b!1212818 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 lt!550871 _keys!1208))))))

(assert (=> b!1212818 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38288 (ite c!119662 lt!550861 _values!996))))))

(assert (=> b!1212818 (= e!688765 (= (apply!962 lt!551124 (select (arr!37749 (ite c!119662 lt!550871 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19258 (select (arr!37750 (ite c!119662 lt!550861 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212819 () Bool)

(assert (=> b!1212819 (= e!688760 call!60223)))

(declare-fun b!1212820 () Bool)

(assert (=> b!1212820 (= e!688759 e!688760)))

(declare-fun c!119751 () Bool)

(assert (=> b!1212820 (= c!119751 (validKeyInArray!0 (select (arr!37749 (ite c!119662 lt!550871 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212821 () Bool)

(declare-fun res!805432 () Bool)

(declare-fun e!688762 () Bool)

(assert (=> b!1212821 (=> (not res!805432) (not e!688762))))

(assert (=> b!1212821 (= res!805432 (not (contains!6963 lt!551124 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!60220 () Bool)

(assert (=> bm!60220 (= call!60223 (getCurrentListMapNoExtraKeys!5398 (ite c!119662 lt!550871 _keys!1208) (ite c!119662 lt!550861 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212822 () Bool)

(assert (=> b!1212822 (= e!688762 e!688763)))

(declare-fun c!119750 () Bool)

(assert (=> b!1212822 (= c!119750 e!688761)))

(declare-fun res!805430 () Bool)

(assert (=> b!1212822 (=> (not res!805430) (not e!688761))))

(assert (=> b!1212822 (= res!805430 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 lt!550871 _keys!1208))))))

(declare-fun b!1212823 () Bool)

(assert (=> b!1212823 (= e!688763 e!688764)))

(declare-fun c!119749 () Bool)

(assert (=> b!1212823 (= c!119749 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 lt!550871 _keys!1208))))))

(declare-fun d!133339 () Bool)

(assert (=> d!133339 e!688762))

(declare-fun res!805433 () Bool)

(assert (=> d!133339 (=> (not res!805433) (not e!688762))))

(assert (=> d!133339 (= res!805433 (not (contains!6963 lt!551124 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133339 (= lt!551124 e!688759)))

(declare-fun c!119752 () Bool)

(assert (=> d!133339 (= c!119752 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 (ite c!119662 lt!550871 _keys!1208))))))

(assert (=> d!133339 (validMask!0 mask!1564)))

(assert (=> d!133339 (= (getCurrentListMapNoExtraKeys!5398 (ite c!119662 lt!550871 _keys!1208) (ite c!119662 lt!550861 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551124)))

(declare-fun b!1212815 () Bool)

(assert (=> b!1212815 (= e!688764 (= lt!551124 (getCurrentListMapNoExtraKeys!5398 (ite c!119662 lt!550871 _keys!1208) (ite c!119662 lt!550861 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133339 c!119752) b!1212817))

(assert (= (and d!133339 (not c!119752)) b!1212820))

(assert (= (and b!1212820 c!119751) b!1212816))

(assert (= (and b!1212820 (not c!119751)) b!1212819))

(assert (= (or b!1212816 b!1212819) bm!60220))

(assert (= (and d!133339 res!805433) b!1212821))

(assert (= (and b!1212821 res!805432) b!1212822))

(assert (= (and b!1212822 res!805430) b!1212813))

(assert (= (and b!1212822 c!119750) b!1212812))

(assert (= (and b!1212822 (not c!119750)) b!1212823))

(assert (= (and b!1212812 res!805431) b!1212818))

(assert (= (and b!1212823 c!119749) b!1212815))

(assert (= (and b!1212823 (not c!119749)) b!1212814))

(declare-fun b_lambda!21697 () Bool)

(assert (=> (not b_lambda!21697) (not b!1212816)))

(assert (=> b!1212816 t!39720))

(declare-fun b_and!43221 () Bool)

(assert (= b_and!43219 (and (=> t!39720 result!22305) b_and!43221)))

(declare-fun b_lambda!21699 () Bool)

(assert (=> (not b_lambda!21699) (not b!1212818)))

(assert (=> b!1212818 t!39720))

(declare-fun b_and!43223 () Bool)

(assert (= b_and!43221 (and (=> t!39720 result!22305) b_and!43223)))

(declare-fun m!1117749 () Bool)

(assert (=> bm!60220 m!1117749))

(declare-fun m!1117751 () Bool)

(assert (=> b!1212813 m!1117751))

(assert (=> b!1212813 m!1117751))

(declare-fun m!1117753 () Bool)

(assert (=> b!1212813 m!1117753))

(assert (=> b!1212812 m!1117751))

(assert (=> b!1212812 m!1117751))

(declare-fun m!1117755 () Bool)

(assert (=> b!1212812 m!1117755))

(assert (=> b!1212820 m!1117751))

(assert (=> b!1212820 m!1117751))

(assert (=> b!1212820 m!1117753))

(declare-fun m!1117757 () Bool)

(assert (=> b!1212821 m!1117757))

(declare-fun m!1117759 () Bool)

(assert (=> b!1212814 m!1117759))

(assert (=> b!1212818 m!1117751))

(assert (=> b!1212818 m!1117751))

(declare-fun m!1117761 () Bool)

(assert (=> b!1212818 m!1117761))

(declare-fun m!1117763 () Bool)

(assert (=> b!1212818 m!1117763))

(assert (=> b!1212818 m!1117285))

(assert (=> b!1212818 m!1117763))

(assert (=> b!1212818 m!1117285))

(declare-fun m!1117765 () Bool)

(assert (=> b!1212818 m!1117765))

(declare-fun m!1117767 () Bool)

(assert (=> d!133339 m!1117767))

(assert (=> d!133339 m!1117307))

(assert (=> b!1212816 m!1117751))

(declare-fun m!1117769 () Bool)

(assert (=> b!1212816 m!1117769))

(assert (=> b!1212816 m!1117769))

(declare-fun m!1117771 () Bool)

(assert (=> b!1212816 m!1117771))

(assert (=> b!1212816 m!1117763))

(assert (=> b!1212816 m!1117285))

(assert (=> b!1212816 m!1117763))

(assert (=> b!1212816 m!1117285))

(assert (=> b!1212816 m!1117765))

(declare-fun m!1117773 () Bool)

(assert (=> b!1212816 m!1117773))

(declare-fun m!1117775 () Bool)

(assert (=> b!1212816 m!1117775))

(assert (=> b!1212815 m!1117749))

(assert (=> bm!60144 d!133339))

(declare-fun b!1212824 () Bool)

(declare-fun e!688770 () Bool)

(declare-fun e!688772 () Bool)

(assert (=> b!1212824 (= e!688770 e!688772)))

(assert (=> b!1212824 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 lt!550871)))))

(declare-fun lt!551131 () ListLongMap!17883)

(declare-fun res!805435 () Bool)

(assert (=> b!1212824 (= res!805435 (contains!6963 lt!551131 (select (arr!37749 lt!550871) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212824 (=> (not res!805435) (not e!688772))))

(declare-fun b!1212825 () Bool)

(declare-fun e!688768 () Bool)

(assert (=> b!1212825 (= e!688768 (validKeyInArray!0 (select (arr!37749 lt!550871) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212825 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1212826 () Bool)

(declare-fun e!688771 () Bool)

(assert (=> b!1212826 (= e!688771 (isEmpty!998 lt!551131))))

(declare-fun b!1212828 () Bool)

(declare-fun lt!551134 () Unit!40048)

(declare-fun lt!551133 () Unit!40048)

(assert (=> b!1212828 (= lt!551134 lt!551133)))

(declare-fun lt!551136 () ListLongMap!17883)

(declare-fun lt!551137 () (_ BitVec 64))

(declare-fun lt!551132 () V!46145)

(declare-fun lt!551135 () (_ BitVec 64))

(assert (=> b!1212828 (not (contains!6963 (+!4077 lt!551136 (tuple2!19915 lt!551135 lt!551132)) lt!551137))))

(assert (=> b!1212828 (= lt!551133 (addStillNotContains!298 lt!551136 lt!551135 lt!551132 lt!551137))))

(assert (=> b!1212828 (= lt!551137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212828 (= lt!551132 (get!19258 (select (arr!37750 lt!550861) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212828 (= lt!551135 (select (arr!37749 lt!550871) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60224 () ListLongMap!17883)

(assert (=> b!1212828 (= lt!551136 call!60224)))

(declare-fun e!688767 () ListLongMap!17883)

(assert (=> b!1212828 (= e!688767 (+!4077 call!60224 (tuple2!19915 (select (arr!37749 lt!550871) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19258 (select (arr!37750 lt!550861) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1212829 () Bool)

(declare-fun e!688766 () ListLongMap!17883)

(assert (=> b!1212829 (= e!688766 (ListLongMap!17884 Nil!26688))))

(declare-fun b!1212830 () Bool)

(assert (=> b!1212830 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 lt!550871)))))

(assert (=> b!1212830 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38288 lt!550861)))))

(assert (=> b!1212830 (= e!688772 (= (apply!962 lt!551131 (select (arr!37749 lt!550871) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19258 (select (arr!37750 lt!550861) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3254 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212831 () Bool)

(assert (=> b!1212831 (= e!688767 call!60224)))

(declare-fun b!1212832 () Bool)

(assert (=> b!1212832 (= e!688766 e!688767)))

(declare-fun c!119755 () Bool)

(assert (=> b!1212832 (= c!119755 (validKeyInArray!0 (select (arr!37749 lt!550871) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212833 () Bool)

(declare-fun res!805436 () Bool)

(declare-fun e!688769 () Bool)

(assert (=> b!1212833 (=> (not res!805436) (not e!688769))))

(assert (=> b!1212833 (= res!805436 (not (contains!6963 lt!551131 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!60221 () Bool)

(assert (=> bm!60221 (= call!60224 (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212834 () Bool)

(assert (=> b!1212834 (= e!688769 e!688770)))

(declare-fun c!119754 () Bool)

(assert (=> b!1212834 (= c!119754 e!688768)))

(declare-fun res!805434 () Bool)

(assert (=> b!1212834 (=> (not res!805434) (not e!688768))))

(assert (=> b!1212834 (= res!805434 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 lt!550871)))))

(declare-fun b!1212835 () Bool)

(assert (=> b!1212835 (= e!688770 e!688771)))

(declare-fun c!119753 () Bool)

(assert (=> b!1212835 (= c!119753 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 lt!550871)))))

(declare-fun d!133341 () Bool)

(assert (=> d!133341 e!688769))

(declare-fun res!805437 () Bool)

(assert (=> d!133341 (=> (not res!805437) (not e!688769))))

(assert (=> d!133341 (= res!805437 (not (contains!6963 lt!551131 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133341 (= lt!551131 e!688766)))

(declare-fun c!119756 () Bool)

(assert (=> d!133341 (= c!119756 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38287 lt!550871)))))

(assert (=> d!133341 (validMask!0 mask!1564)))

(assert (=> d!133341 (= (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551131)))

(declare-fun b!1212827 () Bool)

(assert (=> b!1212827 (= e!688771 (= lt!551131 (getCurrentListMapNoExtraKeys!5398 lt!550871 lt!550861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133341 c!119756) b!1212829))

(assert (= (and d!133341 (not c!119756)) b!1212832))

(assert (= (and b!1212832 c!119755) b!1212828))

(assert (= (and b!1212832 (not c!119755)) b!1212831))

(assert (= (or b!1212828 b!1212831) bm!60221))

(assert (= (and d!133341 res!805437) b!1212833))

(assert (= (and b!1212833 res!805436) b!1212834))

(assert (= (and b!1212834 res!805434) b!1212825))

(assert (= (and b!1212834 c!119754) b!1212824))

(assert (= (and b!1212834 (not c!119754)) b!1212835))

(assert (= (and b!1212824 res!805435) b!1212830))

(assert (= (and b!1212835 c!119753) b!1212827))

(assert (= (and b!1212835 (not c!119753)) b!1212826))

(declare-fun b_lambda!21701 () Bool)

(assert (=> (not b_lambda!21701) (not b!1212828)))

(assert (=> b!1212828 t!39720))

(declare-fun b_and!43225 () Bool)

(assert (= b_and!43223 (and (=> t!39720 result!22305) b_and!43225)))

(declare-fun b_lambda!21703 () Bool)

(assert (=> (not b_lambda!21703) (not b!1212830)))

(assert (=> b!1212830 t!39720))

(declare-fun b_and!43227 () Bool)

(assert (= b_and!43225 (and (=> t!39720 result!22305) b_and!43227)))

(declare-fun m!1117777 () Bool)

(assert (=> bm!60221 m!1117777))

(declare-fun m!1117779 () Bool)

(assert (=> b!1212825 m!1117779))

(assert (=> b!1212825 m!1117779))

(declare-fun m!1117781 () Bool)

(assert (=> b!1212825 m!1117781))

(assert (=> b!1212824 m!1117779))

(assert (=> b!1212824 m!1117779))

(declare-fun m!1117783 () Bool)

(assert (=> b!1212824 m!1117783))

(assert (=> b!1212832 m!1117779))

(assert (=> b!1212832 m!1117779))

(assert (=> b!1212832 m!1117781))

(declare-fun m!1117785 () Bool)

(assert (=> b!1212833 m!1117785))

(declare-fun m!1117787 () Bool)

(assert (=> b!1212826 m!1117787))

(assert (=> b!1212830 m!1117779))

(assert (=> b!1212830 m!1117779))

(declare-fun m!1117789 () Bool)

(assert (=> b!1212830 m!1117789))

(declare-fun m!1117791 () Bool)

(assert (=> b!1212830 m!1117791))

(assert (=> b!1212830 m!1117285))

(assert (=> b!1212830 m!1117791))

(assert (=> b!1212830 m!1117285))

(declare-fun m!1117793 () Bool)

(assert (=> b!1212830 m!1117793))

(declare-fun m!1117795 () Bool)

(assert (=> d!133341 m!1117795))

(assert (=> d!133341 m!1117307))

(assert (=> b!1212828 m!1117779))

(declare-fun m!1117797 () Bool)

(assert (=> b!1212828 m!1117797))

(assert (=> b!1212828 m!1117797))

(declare-fun m!1117799 () Bool)

(assert (=> b!1212828 m!1117799))

(assert (=> b!1212828 m!1117791))

(assert (=> b!1212828 m!1117285))

(assert (=> b!1212828 m!1117791))

(assert (=> b!1212828 m!1117285))

(assert (=> b!1212828 m!1117793))

(declare-fun m!1117801 () Bool)

(assert (=> b!1212828 m!1117801))

(declare-fun m!1117803 () Bool)

(assert (=> b!1212828 m!1117803))

(assert (=> b!1212827 m!1117777))

(assert (=> b!1212460 d!133341))

(declare-fun d!133343 () Bool)

(assert (=> d!133343 (= (array_inv!28860 _keys!1208) (bvsge (size!38287 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101092 d!133343))

(declare-fun d!133345 () Bool)

(assert (=> d!133345 (= (array_inv!28861 _values!996) (bvsge (size!38288 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101092 d!133345))

(declare-fun d!133347 () Bool)

(declare-fun e!688773 () Bool)

(assert (=> d!133347 e!688773))

(declare-fun res!805438 () Bool)

(assert (=> d!133347 (=> res!805438 e!688773)))

(declare-fun lt!551138 () Bool)

(assert (=> d!133347 (= res!805438 (not lt!551138))))

(declare-fun lt!551139 () Bool)

(assert (=> d!133347 (= lt!551138 lt!551139)))

(declare-fun lt!551140 () Unit!40048)

(declare-fun e!688774 () Unit!40048)

(assert (=> d!133347 (= lt!551140 e!688774)))

(declare-fun c!119757 () Bool)

(assert (=> d!133347 (= c!119757 lt!551139)))

(assert (=> d!133347 (= lt!551139 (containsKey!596 (toList!8957 (ite c!119663 lt!550855 call!60151)) k0!934))))

(assert (=> d!133347 (= (contains!6963 (ite c!119663 lt!550855 call!60151) k0!934) lt!551138)))

(declare-fun b!1212836 () Bool)

(declare-fun lt!551141 () Unit!40048)

(assert (=> b!1212836 (= e!688774 lt!551141)))

(assert (=> b!1212836 (= lt!551141 (lemmaContainsKeyImpliesGetValueByKeyDefined!425 (toList!8957 (ite c!119663 lt!550855 call!60151)) k0!934))))

(assert (=> b!1212836 (isDefined!468 (getValueByKey!642 (toList!8957 (ite c!119663 lt!550855 call!60151)) k0!934))))

(declare-fun b!1212837 () Bool)

(declare-fun Unit!40062 () Unit!40048)

(assert (=> b!1212837 (= e!688774 Unit!40062)))

(declare-fun b!1212838 () Bool)

(assert (=> b!1212838 (= e!688773 (isDefined!468 (getValueByKey!642 (toList!8957 (ite c!119663 lt!550855 call!60151)) k0!934)))))

(assert (= (and d!133347 c!119757) b!1212836))

(assert (= (and d!133347 (not c!119757)) b!1212837))

(assert (= (and d!133347 (not res!805438)) b!1212838))

(declare-fun m!1117805 () Bool)

(assert (=> d!133347 m!1117805))

(declare-fun m!1117807 () Bool)

(assert (=> b!1212836 m!1117807))

(declare-fun m!1117809 () Bool)

(assert (=> b!1212836 m!1117809))

(assert (=> b!1212836 m!1117809))

(declare-fun m!1117811 () Bool)

(assert (=> b!1212836 m!1117811))

(assert (=> b!1212838 m!1117809))

(assert (=> b!1212838 m!1117809))

(assert (=> b!1212838 m!1117811))

(assert (=> bm!60147 d!133347))

(assert (=> b!1212447 d!133293))

(declare-fun b!1212845 () Bool)

(declare-fun e!688779 () Bool)

(assert (=> b!1212845 (= e!688779 tp_is_empty!30763)))

(declare-fun b!1212846 () Bool)

(declare-fun e!688780 () Bool)

(assert (=> b!1212846 (= e!688780 tp_is_empty!30763)))

(declare-fun condMapEmpty!48025 () Bool)

(declare-fun mapDefault!48025 () ValueCell!14672)

(assert (=> mapNonEmpty!48016 (= condMapEmpty!48025 (= mapRest!48016 ((as const (Array (_ BitVec 32) ValueCell!14672)) mapDefault!48025)))))

(declare-fun mapRes!48025 () Bool)

(assert (=> mapNonEmpty!48016 (= tp!91195 (and e!688780 mapRes!48025))))

(declare-fun mapNonEmpty!48025 () Bool)

(declare-fun tp!91211 () Bool)

(assert (=> mapNonEmpty!48025 (= mapRes!48025 (and tp!91211 e!688779))))

(declare-fun mapRest!48025 () (Array (_ BitVec 32) ValueCell!14672))

(declare-fun mapKey!48025 () (_ BitVec 32))

(declare-fun mapValue!48025 () ValueCell!14672)

(assert (=> mapNonEmpty!48025 (= mapRest!48016 (store mapRest!48025 mapKey!48025 mapValue!48025))))

(declare-fun mapIsEmpty!48025 () Bool)

(assert (=> mapIsEmpty!48025 mapRes!48025))

(assert (= (and mapNonEmpty!48016 condMapEmpty!48025) mapIsEmpty!48025))

(assert (= (and mapNonEmpty!48016 (not condMapEmpty!48025)) mapNonEmpty!48025))

(assert (= (and mapNonEmpty!48025 ((_ is ValueCellFull!14672) mapValue!48025)) b!1212845))

(assert (= (and mapNonEmpty!48016 ((_ is ValueCellFull!14672) mapDefault!48025)) b!1212846))

(declare-fun m!1117813 () Bool)

(assert (=> mapNonEmpty!48025 m!1117813))

(declare-fun b_lambda!21705 () Bool)

(assert (= b_lambda!21697 (or (and start!101092 b_free!26059) b_lambda!21705)))

(declare-fun b_lambda!21707 () Bool)

(assert (= b_lambda!21703 (or (and start!101092 b_free!26059) b_lambda!21707)))

(declare-fun b_lambda!21709 () Bool)

(assert (= b_lambda!21695 (or (and start!101092 b_free!26059) b_lambda!21709)))

(declare-fun b_lambda!21711 () Bool)

(assert (= b_lambda!21683 (or (and start!101092 b_free!26059) b_lambda!21711)))

(declare-fun b_lambda!21713 () Bool)

(assert (= b_lambda!21691 (or (and start!101092 b_free!26059) b_lambda!21713)))

(declare-fun b_lambda!21715 () Bool)

(assert (= b_lambda!21693 (or (and start!101092 b_free!26059) b_lambda!21715)))

(declare-fun b_lambda!21717 () Bool)

(assert (= b_lambda!21701 (or (and start!101092 b_free!26059) b_lambda!21717)))

(declare-fun b_lambda!21719 () Bool)

(assert (= b_lambda!21687 (or (and start!101092 b_free!26059) b_lambda!21719)))

(declare-fun b_lambda!21721 () Bool)

(assert (= b_lambda!21699 (or (and start!101092 b_free!26059) b_lambda!21721)))

(declare-fun b_lambda!21723 () Bool)

(assert (= b_lambda!21681 (or (and start!101092 b_free!26059) b_lambda!21723)))

(declare-fun b_lambda!21725 () Bool)

(assert (= b_lambda!21689 (or (and start!101092 b_free!26059) b_lambda!21725)))

(declare-fun b_lambda!21727 () Bool)

(assert (= b_lambda!21679 (or (and start!101092 b_free!26059) b_lambda!21727)))

(declare-fun b_lambda!21729 () Bool)

(assert (= b_lambda!21685 (or (and start!101092 b_free!26059) b_lambda!21729)))

(check-sat (not d!133279) (not b!1212836) (not b_lambda!21715) (not b!1212814) (not d!133285) (not b!1212753) (not b_lambda!21705) (not bm!60216) (not bm!60217) (not b!1212711) (not b!1212782) (not b!1212789) (not b!1212762) (not d!133309) (not b_lambda!21711) (not b!1212764) (not b!1212768) (not b!1212671) (not b!1212759) (not b!1212787) (not d!133327) (not d!133325) (not bm!60218) (not b!1212744) (not b!1212746) (not d!133347) (not b!1212742) (not b!1212818) (not b!1212740) (not d!133337) b_and!43227 (not d!133307) (not d!133303) (not b_lambda!21723) (not d!133329) (not b!1212664) (not b!1212752) (not d!133341) (not b!1212797) (not bm!60215) (not d!133335) (not b!1212756) (not b!1212763) (not b!1212739) (not d!133321) (not b!1212806) (not b!1212812) (not b!1212832) (not bm!60211) (not b!1212771) (not b!1212828) (not d!133331) (not b_lambda!21727) (not mapNonEmpty!48025) (not b_lambda!21729) (not b!1212790) (not bm!60208) (not b!1212807) (not bm!60203) (not b!1212766) (not b_lambda!21709) (not b!1212813) (not b!1212680) (not b!1212758) (not b!1212784) (not b_next!26059) (not b_lambda!21725) (not b!1212683) (not b_lambda!21719) (not b!1212815) (not b!1212821) (not b!1212709) (not b!1212705) (not b!1212809) (not bm!60221) (not d!133315) (not b!1212670) (not b!1212792) (not b!1212738) (not b!1212791) (not b!1212693) (not b!1212798) (not b!1212780) tp_is_empty!30763 (not b!1212710) (not bm!60207) (not b_lambda!21713) (not b!1212830) (not b!1212750) (not b_lambda!21677) (not d!133299) (not b!1212765) (not b!1212704) (not d!133313) (not d!133339) (not b!1212795) (not b!1212653) (not b!1212662) (not b!1212706) (not b!1212816) (not b!1212754) (not b!1212827) (not b!1212775) (not b!1212687) (not bm!60204) (not b!1212770) (not b!1212838) (not b_lambda!21707) (not b!1212826) (not bm!60220) (not b!1212741) (not b!1212788) (not b!1212824) (not d!133283) (not b!1212783) (not b!1212684) (not b!1212833) (not b!1212825) (not bm!60219) (not b!1212810) (not bm!60212) (not b!1212751) (not b_lambda!21721) (not b!1212793) (not b!1212747) (not b!1212820) (not b!1212811) (not d!133323) (not d!133317) (not b_lambda!21717) (not d!133281) (not b!1212805) (not d!133305))
(check-sat b_and!43227 (not b_next!26059))
