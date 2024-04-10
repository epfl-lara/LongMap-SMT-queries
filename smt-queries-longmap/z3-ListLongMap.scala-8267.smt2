; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100552 () Bool)

(assert start!100552)

(declare-fun b_free!25875 () Bool)

(declare-fun b_next!25875 () Bool)

(assert (=> start!100552 (= b_free!25875 (not b_next!25875))))

(declare-fun tp!90614 () Bool)

(declare-fun b_and!42637 () Bool)

(assert (=> start!100552 (= tp!90614 b_and!42637)))

(declare-fun b!1202292 () Bool)

(declare-fun res!800248 () Bool)

(declare-fun e!682733 () Bool)

(assert (=> b!1202292 (=> (not res!800248) (not e!682733))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202292 (= res!800248 (validKeyInArray!0 k0!934))))

(declare-fun b!1202293 () Bool)

(declare-fun call!57701 () Bool)

(assert (=> b!1202293 call!57701))

(declare-datatypes ((Unit!39860 0))(
  ( (Unit!39861) )
))
(declare-fun lt!544918 () Unit!39860)

(declare-fun call!57707 () Unit!39860)

(assert (=> b!1202293 (= lt!544918 call!57707)))

(declare-fun e!682734 () Unit!39860)

(assert (=> b!1202293 (= e!682734 lt!544918)))

(declare-fun b!1202294 () Bool)

(declare-fun e!682735 () Bool)

(declare-fun tp_is_empty!30579 () Bool)

(assert (=> b!1202294 (= e!682735 tp_is_empty!30579)))

(declare-datatypes ((V!45899 0))(
  ( (V!45900 (val!15346 Int)) )
))
(declare-fun zeroValue!944 () V!45899)

(declare-datatypes ((ValueCell!14580 0))(
  ( (ValueCellFull!14580 (v!17984 V!45899)) (EmptyCell!14580) )
))
(declare-datatypes ((array!77931 0))(
  ( (array!77932 (arr!37610 (Array (_ BitVec 32) ValueCell!14580)) (size!38146 (_ BitVec 32))) )
))
(declare-fun lt!544925 () array!77931)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57697 () Bool)

(declare-fun minValue!944 () V!45899)

(declare-datatypes ((tuple2!19664 0))(
  ( (tuple2!19665 (_1!9843 (_ BitVec 64)) (_2!9843 V!45899)) )
))
(declare-datatypes ((List!26477 0))(
  ( (Nil!26474) (Cons!26473 (h!27682 tuple2!19664) (t!39332 List!26477)) )
))
(declare-datatypes ((ListLongMap!17633 0))(
  ( (ListLongMap!17634 (toList!8832 List!26477)) )
))
(declare-fun call!57703 () ListLongMap!17633)

(declare-datatypes ((array!77933 0))(
  ( (array!77934 (arr!37611 (Array (_ BitVec 32) (_ BitVec 64))) (size!38147 (_ BitVec 32))) )
))
(declare-fun lt!544924 () array!77933)

(declare-fun getCurrentListMapNoExtraKeys!5269 (array!77933 array!77931 (_ BitVec 32) (_ BitVec 32) V!45899 V!45899 (_ BitVec 32) Int) ListLongMap!17633)

(assert (=> bm!57697 (= call!57703 (getCurrentListMapNoExtraKeys!5269 lt!544924 lt!544925 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57698 () Bool)

(declare-fun call!57704 () ListLongMap!17633)

(declare-fun call!57700 () ListLongMap!17633)

(assert (=> bm!57698 (= call!57704 call!57700)))

(declare-fun call!57705 () ListLongMap!17633)

(declare-fun b!1202295 () Bool)

(declare-fun e!682723 () Bool)

(declare-fun -!1801 (ListLongMap!17633 (_ BitVec 64)) ListLongMap!17633)

(assert (=> b!1202295 (= e!682723 (= call!57703 (-!1801 call!57705 k0!934)))))

(declare-fun bm!57699 () Bool)

(declare-fun call!57706 () Unit!39860)

(assert (=> bm!57699 (= call!57707 call!57706)))

(declare-fun b!1202296 () Bool)

(declare-fun e!682722 () Unit!39860)

(declare-fun Unit!39862 () Unit!39860)

(assert (=> b!1202296 (= e!682722 Unit!39862)))

(declare-fun bm!57700 () Bool)

(declare-fun call!57702 () Bool)

(assert (=> bm!57700 (= call!57701 call!57702)))

(declare-fun b!1202297 () Bool)

(declare-fun res!800239 () Bool)

(assert (=> b!1202297 (=> (not res!800239) (not e!682733))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77933)

(assert (=> b!1202297 (= res!800239 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38147 _keys!1208))))))

(declare-fun b!1202298 () Bool)

(declare-fun res!800241 () Bool)

(assert (=> b!1202298 (=> (not res!800241) (not e!682733))))

(declare-datatypes ((List!26478 0))(
  ( (Nil!26475) (Cons!26474 (h!27683 (_ BitVec 64)) (t!39333 List!26478)) )
))
(declare-fun arrayNoDuplicates!0 (array!77933 (_ BitVec 32) List!26478) Bool)

(assert (=> b!1202298 (= res!800241 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26475))))

(declare-fun b!1202299 () Bool)

(declare-fun res!800247 () Bool)

(assert (=> b!1202299 (=> (not res!800247) (not e!682733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77933 (_ BitVec 32)) Bool)

(assert (=> b!1202299 (= res!800247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47711 () Bool)

(declare-fun mapRes!47711 () Bool)

(declare-fun tp!90615 () Bool)

(declare-fun e!682732 () Bool)

(assert (=> mapNonEmpty!47711 (= mapRes!47711 (and tp!90615 e!682732))))

(declare-fun mapValue!47711 () ValueCell!14580)

(declare-fun mapRest!47711 () (Array (_ BitVec 32) ValueCell!14580))

(declare-fun mapKey!47711 () (_ BitVec 32))

(declare-fun _values!996 () array!77931)

(assert (=> mapNonEmpty!47711 (= (arr!37610 _values!996) (store mapRest!47711 mapKey!47711 mapValue!47711))))

(declare-fun b!1202300 () Bool)

(declare-fun e!682727 () Bool)

(declare-fun e!682728 () Bool)

(assert (=> b!1202300 (= e!682727 e!682728)))

(declare-fun res!800238 () Bool)

(assert (=> b!1202300 (=> res!800238 e!682728)))

(declare-fun lt!544930 () ListLongMap!17633)

(declare-fun contains!6888 (ListLongMap!17633 (_ BitVec 64)) Bool)

(assert (=> b!1202300 (= res!800238 (not (contains!6888 lt!544930 k0!934)))))

(assert (=> b!1202300 (= lt!544930 (getCurrentListMapNoExtraKeys!5269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202301 () Bool)

(declare-fun e!682724 () Bool)

(declare-fun e!682725 () Bool)

(assert (=> b!1202301 (= e!682724 e!682725)))

(declare-fun res!800246 () Bool)

(assert (=> b!1202301 (=> res!800246 e!682725)))

(assert (=> b!1202301 (= res!800246 (not (= from!1455 i!673)))))

(declare-fun lt!544926 () ListLongMap!17633)

(assert (=> b!1202301 (= lt!544926 (getCurrentListMapNoExtraKeys!5269 lt!544924 lt!544925 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3184 (Int (_ BitVec 64)) V!45899)

(assert (=> b!1202301 (= lt!544925 (array!77932 (store (arr!37610 _values!996) i!673 (ValueCellFull!14580 (dynLambda!3184 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38146 _values!996)))))

(declare-fun lt!544921 () ListLongMap!17633)

(assert (=> b!1202301 (= lt!544921 (getCurrentListMapNoExtraKeys!5269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202302 () Bool)

(assert (=> b!1202302 (= e!682728 true)))

(declare-fun lt!544922 () Unit!39860)

(declare-fun e!682730 () Unit!39860)

(assert (=> b!1202302 (= lt!544922 e!682730)))

(declare-fun c!117647 () Bool)

(declare-fun lt!544920 () Bool)

(assert (=> b!1202302 (= c!117647 (and (not lt!544920) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202302 (= lt!544920 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202303 () Bool)

(assert (=> b!1202303 (= e!682725 e!682727)))

(declare-fun res!800244 () Bool)

(assert (=> b!1202303 (=> res!800244 e!682727)))

(assert (=> b!1202303 (= res!800244 (not (= (select (arr!37611 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202303 e!682723))

(declare-fun c!117650 () Bool)

(assert (=> b!1202303 (= c!117650 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544919 () Unit!39860)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1007 (array!77933 array!77931 (_ BitVec 32) (_ BitVec 32) V!45899 V!45899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39860)

(assert (=> b!1202303 (= lt!544919 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1007 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202304 () Bool)

(declare-fun lt!544929 () Unit!39860)

(assert (=> b!1202304 (= e!682722 lt!544929)))

(assert (=> b!1202304 (= lt!544929 call!57707)))

(assert (=> b!1202304 call!57701))

(declare-fun mapIsEmpty!47711 () Bool)

(assert (=> mapIsEmpty!47711 mapRes!47711))

(declare-fun b!1202305 () Bool)

(declare-fun res!800237 () Bool)

(assert (=> b!1202305 (=> (not res!800237) (not e!682733))))

(assert (=> b!1202305 (= res!800237 (= (select (arr!37611 _keys!1208) i!673) k0!934))))

(declare-fun bm!57701 () Bool)

(assert (=> bm!57701 (= call!57705 (getCurrentListMapNoExtraKeys!5269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202306 () Bool)

(assert (=> b!1202306 (= e!682723 (= call!57703 call!57705))))

(declare-fun res!800249 () Bool)

(assert (=> start!100552 (=> (not res!800249) (not e!682733))))

(assert (=> start!100552 (= res!800249 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38147 _keys!1208))))))

(assert (=> start!100552 e!682733))

(assert (=> start!100552 tp_is_empty!30579))

(declare-fun array_inv!28658 (array!77933) Bool)

(assert (=> start!100552 (array_inv!28658 _keys!1208)))

(assert (=> start!100552 true))

(assert (=> start!100552 tp!90614))

(declare-fun e!682726 () Bool)

(declare-fun array_inv!28659 (array!77931) Bool)

(assert (=> start!100552 (and (array_inv!28659 _values!996) e!682726)))

(declare-fun bm!57702 () Bool)

(declare-fun lt!544928 () ListLongMap!17633)

(assert (=> bm!57702 (= call!57702 (contains!6888 (ite c!117647 lt!544928 call!57704) k0!934))))

(declare-fun b!1202307 () Bool)

(assert (=> b!1202307 (= e!682730 e!682734)))

(declare-fun c!117648 () Bool)

(assert (=> b!1202307 (= c!117648 (and (not lt!544920) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!57703 () Bool)

(declare-fun addStillContains!989 (ListLongMap!17633 (_ BitVec 64) V!45899 (_ BitVec 64)) Unit!39860)

(assert (=> bm!57703 (= call!57706 (addStillContains!989 (ite c!117647 lt!544928 lt!544930) (ite c!117647 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117648 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117647 minValue!944 (ite c!117648 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1202308 () Bool)

(declare-fun res!800240 () Bool)

(assert (=> b!1202308 (=> (not res!800240) (not e!682733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202308 (= res!800240 (validMask!0 mask!1564))))

(declare-fun b!1202309 () Bool)

(declare-fun res!800250 () Bool)

(declare-fun e!682731 () Bool)

(assert (=> b!1202309 (=> (not res!800250) (not e!682731))))

(assert (=> b!1202309 (= res!800250 (arrayNoDuplicates!0 lt!544924 #b00000000000000000000000000000000 Nil!26475))))

(declare-fun bm!57704 () Bool)

(declare-fun +!3961 (ListLongMap!17633 tuple2!19664) ListLongMap!17633)

(assert (=> bm!57704 (= call!57700 (+!3961 lt!544930 (ite (or c!117647 c!117648) (tuple2!19665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1202310 () Bool)

(assert (=> b!1202310 (= e!682726 (and e!682735 mapRes!47711))))

(declare-fun condMapEmpty!47711 () Bool)

(declare-fun mapDefault!47711 () ValueCell!14580)

(assert (=> b!1202310 (= condMapEmpty!47711 (= (arr!37610 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14580)) mapDefault!47711)))))

(declare-fun b!1202311 () Bool)

(declare-fun c!117649 () Bool)

(assert (=> b!1202311 (= c!117649 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544920))))

(assert (=> b!1202311 (= e!682734 e!682722)))

(declare-fun b!1202312 () Bool)

(assert (=> b!1202312 (= e!682731 (not e!682724))))

(declare-fun res!800242 () Bool)

(assert (=> b!1202312 (=> res!800242 e!682724)))

(assert (=> b!1202312 (= res!800242 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202312 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544917 () Unit!39860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77933 (_ BitVec 64) (_ BitVec 32)) Unit!39860)

(assert (=> b!1202312 (= lt!544917 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202313 () Bool)

(declare-fun res!800245 () Bool)

(assert (=> b!1202313 (=> (not res!800245) (not e!682733))))

(assert (=> b!1202313 (= res!800245 (and (= (size!38146 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38147 _keys!1208) (size!38146 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202314 () Bool)

(assert (=> b!1202314 (= e!682733 e!682731)))

(declare-fun res!800243 () Bool)

(assert (=> b!1202314 (=> (not res!800243) (not e!682731))))

(assert (=> b!1202314 (= res!800243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544924 mask!1564))))

(assert (=> b!1202314 (= lt!544924 (array!77934 (store (arr!37611 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38147 _keys!1208)))))

(declare-fun b!1202315 () Bool)

(declare-fun lt!544927 () Unit!39860)

(assert (=> b!1202315 (= e!682730 lt!544927)))

(declare-fun lt!544923 () Unit!39860)

(assert (=> b!1202315 (= lt!544923 (addStillContains!989 lt!544930 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1202315 (= lt!544928 call!57700)))

(assert (=> b!1202315 call!57702))

(assert (=> b!1202315 (= lt!544927 call!57706)))

(assert (=> b!1202315 (contains!6888 (+!3961 lt!544928 (tuple2!19665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1202316 () Bool)

(assert (=> b!1202316 (= e!682732 tp_is_empty!30579)))

(assert (= (and start!100552 res!800249) b!1202308))

(assert (= (and b!1202308 res!800240) b!1202313))

(assert (= (and b!1202313 res!800245) b!1202299))

(assert (= (and b!1202299 res!800247) b!1202298))

(assert (= (and b!1202298 res!800241) b!1202297))

(assert (= (and b!1202297 res!800239) b!1202292))

(assert (= (and b!1202292 res!800248) b!1202305))

(assert (= (and b!1202305 res!800237) b!1202314))

(assert (= (and b!1202314 res!800243) b!1202309))

(assert (= (and b!1202309 res!800250) b!1202312))

(assert (= (and b!1202312 (not res!800242)) b!1202301))

(assert (= (and b!1202301 (not res!800246)) b!1202303))

(assert (= (and b!1202303 c!117650) b!1202295))

(assert (= (and b!1202303 (not c!117650)) b!1202306))

(assert (= (or b!1202295 b!1202306) bm!57697))

(assert (= (or b!1202295 b!1202306) bm!57701))

(assert (= (and b!1202303 (not res!800244)) b!1202300))

(assert (= (and b!1202300 (not res!800238)) b!1202302))

(assert (= (and b!1202302 c!117647) b!1202315))

(assert (= (and b!1202302 (not c!117647)) b!1202307))

(assert (= (and b!1202307 c!117648) b!1202293))

(assert (= (and b!1202307 (not c!117648)) b!1202311))

(assert (= (and b!1202311 c!117649) b!1202304))

(assert (= (and b!1202311 (not c!117649)) b!1202296))

(assert (= (or b!1202293 b!1202304) bm!57699))

(assert (= (or b!1202293 b!1202304) bm!57698))

(assert (= (or b!1202293 b!1202304) bm!57700))

(assert (= (or b!1202315 bm!57700) bm!57702))

(assert (= (or b!1202315 bm!57699) bm!57703))

(assert (= (or b!1202315 bm!57698) bm!57704))

(assert (= (and b!1202310 condMapEmpty!47711) mapIsEmpty!47711))

(assert (= (and b!1202310 (not condMapEmpty!47711)) mapNonEmpty!47711))

(get-info :version)

(assert (= (and mapNonEmpty!47711 ((_ is ValueCellFull!14580) mapValue!47711)) b!1202316))

(assert (= (and b!1202310 ((_ is ValueCellFull!14580) mapDefault!47711)) b!1202294))

(assert (= start!100552 b!1202310))

(declare-fun b_lambda!21071 () Bool)

(assert (=> (not b_lambda!21071) (not b!1202301)))

(declare-fun t!39331 () Bool)

(declare-fun tb!10675 () Bool)

(assert (=> (and start!100552 (= defaultEntry!1004 defaultEntry!1004) t!39331) tb!10675))

(declare-fun result!21927 () Bool)

(assert (=> tb!10675 (= result!21927 tp_is_empty!30579)))

(assert (=> b!1202301 t!39331))

(declare-fun b_and!42639 () Bool)

(assert (= b_and!42637 (and (=> t!39331 result!21927) b_and!42639)))

(declare-fun m!1108187 () Bool)

(assert (=> b!1202292 m!1108187))

(declare-fun m!1108189 () Bool)

(assert (=> bm!57703 m!1108189))

(declare-fun m!1108191 () Bool)

(assert (=> b!1202314 m!1108191))

(declare-fun m!1108193 () Bool)

(assert (=> b!1202314 m!1108193))

(declare-fun m!1108195 () Bool)

(assert (=> b!1202299 m!1108195))

(declare-fun m!1108197 () Bool)

(assert (=> b!1202315 m!1108197))

(declare-fun m!1108199 () Bool)

(assert (=> b!1202315 m!1108199))

(assert (=> b!1202315 m!1108199))

(declare-fun m!1108201 () Bool)

(assert (=> b!1202315 m!1108201))

(declare-fun m!1108203 () Bool)

(assert (=> b!1202309 m!1108203))

(declare-fun m!1108205 () Bool)

(assert (=> bm!57702 m!1108205))

(declare-fun m!1108207 () Bool)

(assert (=> b!1202298 m!1108207))

(declare-fun m!1108209 () Bool)

(assert (=> b!1202308 m!1108209))

(declare-fun m!1108211 () Bool)

(assert (=> bm!57701 m!1108211))

(declare-fun m!1108213 () Bool)

(assert (=> b!1202312 m!1108213))

(declare-fun m!1108215 () Bool)

(assert (=> b!1202312 m!1108215))

(declare-fun m!1108217 () Bool)

(assert (=> b!1202305 m!1108217))

(declare-fun m!1108219 () Bool)

(assert (=> b!1202300 m!1108219))

(assert (=> b!1202300 m!1108211))

(declare-fun m!1108221 () Bool)

(assert (=> b!1202301 m!1108221))

(declare-fun m!1108223 () Bool)

(assert (=> b!1202301 m!1108223))

(declare-fun m!1108225 () Bool)

(assert (=> b!1202301 m!1108225))

(declare-fun m!1108227 () Bool)

(assert (=> b!1202301 m!1108227))

(declare-fun m!1108229 () Bool)

(assert (=> bm!57704 m!1108229))

(declare-fun m!1108231 () Bool)

(assert (=> start!100552 m!1108231))

(declare-fun m!1108233 () Bool)

(assert (=> start!100552 m!1108233))

(declare-fun m!1108235 () Bool)

(assert (=> mapNonEmpty!47711 m!1108235))

(declare-fun m!1108237 () Bool)

(assert (=> b!1202295 m!1108237))

(declare-fun m!1108239 () Bool)

(assert (=> bm!57697 m!1108239))

(declare-fun m!1108241 () Bool)

(assert (=> b!1202303 m!1108241))

(declare-fun m!1108243 () Bool)

(assert (=> b!1202303 m!1108243))

(check-sat (not b!1202299) (not bm!57703) (not bm!57704) (not b!1202292) tp_is_empty!30579 (not b!1202312) (not start!100552) (not bm!57702) (not b!1202309) (not mapNonEmpty!47711) (not b!1202315) (not b_next!25875) b_and!42639 (not b!1202301) (not b!1202300) (not b!1202298) (not bm!57701) (not b!1202314) (not b!1202308) (not b!1202303) (not b!1202295) (not b_lambda!21071) (not bm!57697))
(check-sat b_and!42639 (not b_next!25875))
