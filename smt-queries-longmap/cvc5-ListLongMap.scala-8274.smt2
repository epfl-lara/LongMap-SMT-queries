; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100714 () Bool)

(assert start!100714)

(declare-fun b_free!25915 () Bool)

(declare-fun b_next!25915 () Bool)

(assert (=> start!100714 (= b_free!25915 (not b_next!25915))))

(declare-fun tp!90744 () Bool)

(declare-fun b_and!42795 () Bool)

(assert (=> start!100714 (= tp!90744 b_and!42795)))

(declare-fun b!1204756 () Bool)

(declare-fun res!801461 () Bool)

(declare-fun e!684162 () Bool)

(assert (=> b!1204756 (=> (not res!801461) (not e!684162))))

(declare-datatypes ((array!78017 0))(
  ( (array!78018 (arr!37650 (Array (_ BitVec 32) (_ BitVec 64))) (size!38186 (_ BitVec 32))) )
))
(declare-fun lt!546373 () array!78017)

(declare-datatypes ((List!26512 0))(
  ( (Nil!26509) (Cons!26508 (h!27717 (_ BitVec 64)) (t!39407 List!26512)) )
))
(declare-fun arrayNoDuplicates!0 (array!78017 (_ BitVec 32) List!26512) Bool)

(assert (=> b!1204756 (= res!801461 (arrayNoDuplicates!0 lt!546373 #b00000000000000000000000000000000 Nil!26509))))

(declare-fun b!1204757 () Bool)

(declare-fun res!801457 () Bool)

(declare-fun e!684158 () Bool)

(assert (=> b!1204757 (=> (not res!801457) (not e!684158))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204757 (= res!801457 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!45953 0))(
  ( (V!45954 (val!15366 Int)) )
))
(declare-fun zeroValue!944 () V!45953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!58285 () Bool)

(declare-datatypes ((tuple2!19704 0))(
  ( (tuple2!19705 (_1!9863 (_ BitVec 64)) (_2!9863 V!45953)) )
))
(declare-datatypes ((List!26513 0))(
  ( (Nil!26510) (Cons!26509 (h!27718 tuple2!19704) (t!39408 List!26513)) )
))
(declare-datatypes ((ListLongMap!17673 0))(
  ( (ListLongMap!17674 (toList!8852 List!26513)) )
))
(declare-fun call!58291 () ListLongMap!17673)

(declare-fun minValue!944 () V!45953)

(declare-datatypes ((ValueCell!14600 0))(
  ( (ValueCellFull!14600 (v!18009 V!45953)) (EmptyCell!14600) )
))
(declare-datatypes ((array!78019 0))(
  ( (array!78020 (arr!37651 (Array (_ BitVec 32) ValueCell!14600)) (size!38187 (_ BitVec 32))) )
))
(declare-fun lt!546370 () array!78019)

(declare-fun getCurrentListMapNoExtraKeys!5288 (array!78017 array!78019 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) Int) ListLongMap!17673)

(assert (=> bm!58285 (= call!58291 (getCurrentListMapNoExtraKeys!5288 lt!546373 lt!546370 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204758 () Bool)

(declare-fun e!684170 () Bool)

(declare-fun e!684156 () Bool)

(assert (=> b!1204758 (= e!684170 e!684156)))

(declare-fun res!801450 () Bool)

(assert (=> b!1204758 (=> res!801450 e!684156)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204758 (= res!801450 (not (= from!1455 i!673)))))

(declare-fun lt!546364 () ListLongMap!17673)

(assert (=> b!1204758 (= lt!546364 (getCurrentListMapNoExtraKeys!5288 lt!546373 lt!546370 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78019)

(declare-fun dynLambda!3198 (Int (_ BitVec 64)) V!45953)

(assert (=> b!1204758 (= lt!546370 (array!78020 (store (arr!37651 _values!996) i!673 (ValueCellFull!14600 (dynLambda!3198 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38187 _values!996)))))

(declare-fun _keys!1208 () array!78017)

(declare-fun lt!546367 () ListLongMap!17673)

(assert (=> b!1204758 (= lt!546367 (getCurrentListMapNoExtraKeys!5288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun c!118147 () Bool)

(declare-datatypes ((Unit!39944 0))(
  ( (Unit!39945) )
))
(declare-fun call!58293 () Unit!39944)

(declare-fun lt!546366 () ListLongMap!17673)

(declare-fun bm!58286 () Bool)

(declare-fun c!118149 () Bool)

(declare-fun addStillContains!1006 (ListLongMap!17673 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39944)

(assert (=> bm!58286 (= call!58293 (addStillContains!1006 lt!546366 (ite (or c!118149 c!118147) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118149 c!118147) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1204759 () Bool)

(declare-fun res!801451 () Bool)

(assert (=> b!1204759 (=> (not res!801451) (not e!684158))))

(assert (=> b!1204759 (= res!801451 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38186 _keys!1208))))))

(declare-fun b!1204760 () Bool)

(declare-fun e!684167 () Bool)

(declare-fun tp_is_empty!30619 () Bool)

(assert (=> b!1204760 (= e!684167 tp_is_empty!30619)))

(declare-fun b!1204761 () Bool)

(declare-fun e!684166 () Unit!39944)

(declare-fun lt!546376 () Unit!39944)

(assert (=> b!1204761 (= e!684166 lt!546376)))

(declare-fun lt!546368 () Unit!39944)

(assert (=> b!1204761 (= lt!546368 call!58293)))

(declare-fun lt!546378 () ListLongMap!17673)

(declare-fun call!58289 () ListLongMap!17673)

(assert (=> b!1204761 (= lt!546378 call!58289)))

(declare-fun call!58288 () Bool)

(assert (=> b!1204761 call!58288))

(assert (=> b!1204761 (= lt!546376 (addStillContains!1006 lt!546378 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6911 (ListLongMap!17673 (_ BitVec 64)) Bool)

(declare-fun +!3978 (ListLongMap!17673 tuple2!19704) ListLongMap!17673)

(assert (=> b!1204761 (contains!6911 (+!3978 lt!546378 (tuple2!19705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1204762 () Bool)

(declare-fun res!801458 () Bool)

(assert (=> b!1204762 (=> (not res!801458) (not e!684158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204762 (= res!801458 (validMask!0 mask!1564))))

(declare-fun b!1204763 () Bool)

(declare-fun e!684169 () Bool)

(declare-fun arrayContainsKey!0 (array!78017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204763 (= e!684169 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58287 () Bool)

(declare-fun call!58294 () Unit!39944)

(assert (=> bm!58287 (= call!58294 call!58293)))

(declare-fun res!801456 () Bool)

(assert (=> start!100714 (=> (not res!801456) (not e!684158))))

(assert (=> start!100714 (= res!801456 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38186 _keys!1208))))))

(assert (=> start!100714 e!684158))

(assert (=> start!100714 tp_is_empty!30619))

(declare-fun array_inv!28684 (array!78017) Bool)

(assert (=> start!100714 (array_inv!28684 _keys!1208)))

(assert (=> start!100714 true))

(assert (=> start!100714 tp!90744))

(declare-fun e!684157 () Bool)

(declare-fun array_inv!28685 (array!78019) Bool)

(assert (=> start!100714 (and (array_inv!28685 _values!996) e!684157)))

(declare-fun b!1204764 () Bool)

(assert (=> b!1204764 (= e!684162 (not e!684170))))

(declare-fun res!801462 () Bool)

(assert (=> b!1204764 (=> res!801462 e!684170)))

(assert (=> b!1204764 (= res!801462 (bvsgt from!1455 i!673))))

(assert (=> b!1204764 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!546374 () Unit!39944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78017 (_ BitVec 64) (_ BitVec 32)) Unit!39944)

(assert (=> b!1204764 (= lt!546374 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1204765 () Bool)

(declare-fun c!118150 () Bool)

(declare-fun lt!546372 () Bool)

(assert (=> b!1204765 (= c!118150 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546372))))

(declare-fun e!684161 () Unit!39944)

(declare-fun e!684171 () Unit!39944)

(assert (=> b!1204765 (= e!684161 e!684171)))

(declare-fun bm!58288 () Bool)

(declare-fun call!58292 () Bool)

(assert (=> bm!58288 (= call!58292 call!58288)))

(declare-fun b!1204766 () Bool)

(declare-fun e!684168 () Bool)

(assert (=> b!1204766 (= e!684168 tp_is_empty!30619)))

(declare-fun b!1204767 () Bool)

(declare-fun e!684163 () Bool)

(assert (=> b!1204767 (= e!684156 e!684163)))

(declare-fun res!801460 () Bool)

(assert (=> b!1204767 (=> res!801460 e!684163)))

(assert (=> b!1204767 (= res!801460 (not (= (select (arr!37650 _keys!1208) from!1455) k!934)))))

(declare-fun e!684165 () Bool)

(assert (=> b!1204767 e!684165))

(declare-fun c!118148 () Bool)

(assert (=> b!1204767 (= c!118148 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546371 () Unit!39944)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 (array!78017 array!78019 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39944)

(assert (=> b!1204767 (= lt!546371 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58289 () Bool)

(assert (=> bm!58289 (= call!58289 (+!3978 lt!546366 (ite (or c!118149 c!118147) (tuple2!19705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204768 () Bool)

(assert (=> b!1204768 (= e!684158 e!684162)))

(declare-fun res!801455 () Bool)

(assert (=> b!1204768 (=> (not res!801455) (not e!684162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78017 (_ BitVec 32)) Bool)

(assert (=> b!1204768 (= res!801455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546373 mask!1564))))

(assert (=> b!1204768 (= lt!546373 (array!78018 (store (arr!37650 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38186 _keys!1208)))))

(declare-fun b!1204769 () Bool)

(declare-fun res!801463 () Bool)

(assert (=> b!1204769 (=> (not res!801463) (not e!684158))))

(assert (=> b!1204769 (= res!801463 (and (= (size!38187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38186 _keys!1208) (size!38187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47781 () Bool)

(declare-fun mapRes!47781 () Bool)

(declare-fun tp!90745 () Bool)

(assert (=> mapNonEmpty!47781 (= mapRes!47781 (and tp!90745 e!684168))))

(declare-fun mapValue!47781 () ValueCell!14600)

(declare-fun mapRest!47781 () (Array (_ BitVec 32) ValueCell!14600))

(declare-fun mapKey!47781 () (_ BitVec 32))

(assert (=> mapNonEmpty!47781 (= (arr!37651 _values!996) (store mapRest!47781 mapKey!47781 mapValue!47781))))

(declare-fun b!1204770 () Bool)

(declare-fun e!684159 () Bool)

(assert (=> b!1204770 (= e!684163 e!684159)))

(declare-fun res!801452 () Bool)

(assert (=> b!1204770 (=> res!801452 e!684159)))

(assert (=> b!1204770 (= res!801452 (not (contains!6911 lt!546366 k!934)))))

(assert (=> b!1204770 (= lt!546366 (getCurrentListMapNoExtraKeys!5288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58290 () Bool)

(declare-fun call!58290 () ListLongMap!17673)

(assert (=> bm!58290 (= call!58288 (contains!6911 (ite c!118149 lt!546378 call!58290) k!934))))

(declare-fun e!684164 () Bool)

(declare-fun b!1204771 () Bool)

(assert (=> b!1204771 (= e!684164 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58295 () ListLongMap!17673)

(declare-fun b!1204772 () Bool)

(declare-fun -!1817 (ListLongMap!17673 (_ BitVec 64)) ListLongMap!17673)

(assert (=> b!1204772 (= e!684165 (= call!58291 (-!1817 call!58295 k!934)))))

(declare-fun bm!58291 () Bool)

(assert (=> bm!58291 (= call!58295 (getCurrentListMapNoExtraKeys!5288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204773 () Bool)

(assert (=> b!1204773 call!58292))

(declare-fun lt!546369 () Unit!39944)

(assert (=> b!1204773 (= lt!546369 call!58294)))

(assert (=> b!1204773 (= e!684161 lt!546369)))

(declare-fun bm!58292 () Bool)

(assert (=> bm!58292 (= call!58290 call!58289)))

(declare-fun b!1204774 () Bool)

(assert (=> b!1204774 (= e!684165 (= call!58291 call!58295))))

(declare-fun b!1204775 () Bool)

(declare-fun res!801459 () Bool)

(assert (=> b!1204775 (=> (not res!801459) (not e!684158))))

(assert (=> b!1204775 (= res!801459 (= (select (arr!37650 _keys!1208) i!673) k!934))))

(declare-fun b!1204776 () Bool)

(assert (=> b!1204776 (= e!684159 (bvslt (size!38186 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1204776 e!684164))

(declare-fun res!801454 () Bool)

(assert (=> b!1204776 (=> (not res!801454) (not e!684164))))

(assert (=> b!1204776 (= res!801454 e!684169)))

(declare-fun c!118151 () Bool)

(assert (=> b!1204776 (= c!118151 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546375 () Unit!39944)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!562 (array!78017 array!78019 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 64) (_ BitVec 32) Int) Unit!39944)

(assert (=> b!1204776 (= lt!546375 (lemmaListMapContainsThenArrayContainsFrom!562 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546365 () Unit!39944)

(assert (=> b!1204776 (= lt!546365 e!684166)))

(assert (=> b!1204776 (= c!118149 (and (not lt!546372) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204776 (= lt!546372 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!47781 () Bool)

(assert (=> mapIsEmpty!47781 mapRes!47781))

(declare-fun b!1204777 () Bool)

(declare-fun lt!546377 () Unit!39944)

(assert (=> b!1204777 (= e!684171 lt!546377)))

(assert (=> b!1204777 (= lt!546377 call!58294)))

(assert (=> b!1204777 call!58292))

(declare-fun b!1204778 () Bool)

(declare-fun res!801464 () Bool)

(assert (=> b!1204778 (=> (not res!801464) (not e!684158))))

(assert (=> b!1204778 (= res!801464 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26509))))

(declare-fun b!1204779 () Bool)

(declare-fun res!801453 () Bool)

(assert (=> b!1204779 (=> (not res!801453) (not e!684158))))

(assert (=> b!1204779 (= res!801453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204780 () Bool)

(assert (=> b!1204780 (= e!684169 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546372) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1204781 () Bool)

(declare-fun Unit!39946 () Unit!39944)

(assert (=> b!1204781 (= e!684171 Unit!39946)))

(declare-fun b!1204782 () Bool)

(assert (=> b!1204782 (= e!684166 e!684161)))

(assert (=> b!1204782 (= c!118147 (and (not lt!546372) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204783 () Bool)

(assert (=> b!1204783 (= e!684157 (and e!684167 mapRes!47781))))

(declare-fun condMapEmpty!47781 () Bool)

(declare-fun mapDefault!47781 () ValueCell!14600)

