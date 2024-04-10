; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98836 () Bool)

(assert start!98836)

(declare-fun b_free!24441 () Bool)

(declare-fun b_next!24441 () Bool)

(assert (=> start!98836 (= b_free!24441 (not b_next!24441))))

(declare-fun tp!86033 () Bool)

(declare-fun b_and!39731 () Bool)

(assert (=> start!98836 (= tp!86033 b_and!39731)))

(declare-datatypes ((V!43755 0))(
  ( (V!43756 (val!14542 Int)) )
))
(declare-fun zeroValue!944 () V!43755)

(declare-fun c!114828 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!38040 0))(
  ( (Unit!38041) )
))
(declare-fun call!54835 () Unit!38040)

(declare-datatypes ((tuple2!18492 0))(
  ( (tuple2!18493 (_1!9257 (_ BitVec 64)) (_2!9257 V!43755)) )
))
(declare-datatypes ((List!25235 0))(
  ( (Nil!25232) (Cons!25231 (h!26440 tuple2!18492) (t!36668 List!25235)) )
))
(declare-datatypes ((ListLongMap!16461 0))(
  ( (ListLongMap!16462 (toList!8246 List!25235)) )
))
(declare-fun lt!518306 () ListLongMap!16461)

(declare-fun bm!54832 () Bool)

(declare-fun c!114827 () Bool)

(declare-fun minValue!944 () V!43755)

(declare-fun addStillContains!903 (ListLongMap!16461 (_ BitVec 64) V!43755 (_ BitVec 64)) Unit!38040)

(assert (=> bm!54832 (= call!54835 (addStillContains!903 lt!518306 (ite (or c!114827 c!114828) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114827 c!114828) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1155298 () Bool)

(declare-fun e!657035 () Unit!38040)

(declare-fun Unit!38042 () Unit!38040)

(assert (=> b!1155298 (= e!657035 Unit!38042)))

(declare-fun b!1155299 () Bool)

(declare-fun res!767598 () Bool)

(declare-fun e!657040 () Bool)

(assert (=> b!1155299 (=> (not res!767598) (not e!657040))))

(declare-datatypes ((array!74789 0))(
  ( (array!74790 (arr!36045 (Array (_ BitVec 32) (_ BitVec 64))) (size!36581 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74789)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74789 (_ BitVec 32)) Bool)

(assert (=> b!1155299 (= res!767598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155300 () Bool)

(declare-fun e!657034 () Unit!38040)

(declare-fun lt!518298 () Unit!38040)

(assert (=> b!1155300 (= e!657034 lt!518298)))

(declare-fun call!54838 () Unit!38040)

(assert (=> b!1155300 (= lt!518298 call!54838)))

(declare-fun call!54841 () Bool)

(assert (=> b!1155300 call!54841))

(declare-fun mapNonEmpty!45281 () Bool)

(declare-fun mapRes!45281 () Bool)

(declare-fun tp!86034 () Bool)

(declare-fun e!657044 () Bool)

(assert (=> mapNonEmpty!45281 (= mapRes!45281 (and tp!86034 e!657044))))

(declare-datatypes ((ValueCell!13776 0))(
  ( (ValueCellFull!13776 (v!17179 V!43755)) (EmptyCell!13776) )
))
(declare-fun mapRest!45281 () (Array (_ BitVec 32) ValueCell!13776))

(declare-fun mapValue!45281 () ValueCell!13776)

(declare-datatypes ((array!74791 0))(
  ( (array!74792 (arr!36046 (Array (_ BitVec 32) ValueCell!13776)) (size!36582 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74791)

(declare-fun mapKey!45281 () (_ BitVec 32))

(assert (=> mapNonEmpty!45281 (= (arr!36046 _values!996) (store mapRest!45281 mapKey!45281 mapValue!45281))))

(declare-fun b!1155301 () Bool)

(declare-fun res!767595 () Bool)

(assert (=> b!1155301 (=> (not res!767595) (not e!657040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155301 (= res!767595 (validMask!0 mask!1564))))

(declare-fun b!1155302 () Bool)

(declare-fun lt!518299 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155302 (= c!114828 (and (not lt!518299) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657043 () Unit!38040)

(assert (=> b!1155302 (= e!657043 e!657034)))

(declare-fun b!1155303 () Bool)

(declare-fun e!657033 () Unit!38040)

(assert (=> b!1155303 (= e!657034 e!657033)))

(declare-fun c!114829 () Bool)

(assert (=> b!1155303 (= c!114829 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518299))))

(declare-fun lt!518296 () ListLongMap!16461)

(declare-fun lt!518303 () array!74789)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1155304 () Bool)

(declare-fun e!657030 () Bool)

(declare-fun lt!518295 () array!74791)

(declare-fun getCurrentListMapNoExtraKeys!4715 (array!74789 array!74791 (_ BitVec 32) (_ BitVec 32) V!43755 V!43755 (_ BitVec 32) Int) ListLongMap!16461)

(assert (=> b!1155304 (= e!657030 (= lt!518296 (getCurrentListMapNoExtraKeys!4715 lt!518303 lt!518295 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1155305 () Bool)

(declare-fun e!657039 () Bool)

(assert (=> b!1155305 (= e!657039 true)))

(assert (=> b!1155305 e!657030))

(declare-fun res!767602 () Bool)

(assert (=> b!1155305 (=> (not res!767602) (not e!657030))))

(assert (=> b!1155305 (= res!767602 (= lt!518296 lt!518306))))

(declare-fun lt!518297 () ListLongMap!16461)

(declare-fun -!1366 (ListLongMap!16461 (_ BitVec 64)) ListLongMap!16461)

(assert (=> b!1155305 (= lt!518296 (-!1366 lt!518297 k0!934))))

(declare-fun lt!518301 () V!43755)

(declare-fun +!3659 (ListLongMap!16461 tuple2!18492) ListLongMap!16461)

(assert (=> b!1155305 (= (-!1366 (+!3659 lt!518306 (tuple2!18493 (select (arr!36045 _keys!1208) from!1455) lt!518301)) (select (arr!36045 _keys!1208) from!1455)) lt!518306)))

(declare-fun lt!518304 () Unit!38040)

(declare-fun addThenRemoveForNewKeyIsSame!206 (ListLongMap!16461 (_ BitVec 64) V!43755) Unit!38040)

(assert (=> b!1155305 (= lt!518304 (addThenRemoveForNewKeyIsSame!206 lt!518306 (select (arr!36045 _keys!1208) from!1455) lt!518301))))

(declare-fun lt!518291 () V!43755)

(declare-fun get!18366 (ValueCell!13776 V!43755) V!43755)

(assert (=> b!1155305 (= lt!518301 (get!18366 (select (arr!36046 _values!996) from!1455) lt!518291))))

(declare-fun lt!518302 () Unit!38040)

(assert (=> b!1155305 (= lt!518302 e!657035)))

(declare-fun c!114832 () Bool)

(declare-fun contains!6759 (ListLongMap!16461 (_ BitVec 64)) Bool)

(assert (=> b!1155305 (= c!114832 (contains!6759 lt!518306 k0!934))))

(assert (=> b!1155305 (= lt!518306 (getCurrentListMapNoExtraKeys!4715 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155306 () Bool)

(declare-fun e!657029 () Bool)

(declare-fun call!54839 () ListLongMap!16461)

(declare-fun call!54836 () ListLongMap!16461)

(assert (=> b!1155306 (= e!657029 (= call!54839 call!54836))))

(declare-fun bm!54833 () Bool)

(declare-fun call!54834 () ListLongMap!16461)

(assert (=> bm!54833 (= call!54834 (+!3659 lt!518306 (ite (or c!114827 c!114828) (tuple2!18493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155307 () Bool)

(declare-fun res!767593 () Bool)

(assert (=> b!1155307 (=> (not res!767593) (not e!657040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155307 (= res!767593 (validKeyInArray!0 k0!934))))

(declare-fun bm!54834 () Bool)

(declare-fun call!54837 () ListLongMap!16461)

(assert (=> bm!54834 (= call!54837 call!54834)))

(declare-fun b!1155308 () Bool)

(declare-fun e!657041 () Bool)

(assert (=> b!1155308 (= e!657041 e!657039)))

(declare-fun res!767591 () Bool)

(assert (=> b!1155308 (=> res!767591 e!657039)))

(assert (=> b!1155308 (= res!767591 (not (= (select (arr!36045 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155308 e!657029))

(declare-fun c!114830 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155308 (= c!114830 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518287 () Unit!38040)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!597 (array!74789 array!74791 (_ BitVec 32) (_ BitVec 32) V!43755 V!43755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38040)

(assert (=> b!1155308 (= lt!518287 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155309 () Bool)

(declare-fun e!657037 () Bool)

(declare-fun e!657036 () Bool)

(assert (=> b!1155309 (= e!657037 (not e!657036))))

(declare-fun res!767599 () Bool)

(assert (=> b!1155309 (=> res!767599 e!657036)))

(assert (=> b!1155309 (= res!767599 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155309 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518288 () Unit!38040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74789 (_ BitVec 64) (_ BitVec 32)) Unit!38040)

(assert (=> b!1155309 (= lt!518288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!54831 () Bool)

(assert (=> bm!54831 (= call!54836 (getCurrentListMapNoExtraKeys!4715 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!767592 () Bool)

(assert (=> start!98836 (=> (not res!767592) (not e!657040))))

(assert (=> start!98836 (= res!767592 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36581 _keys!1208))))))

(assert (=> start!98836 e!657040))

(declare-fun tp_is_empty!28971 () Bool)

(assert (=> start!98836 tp_is_empty!28971))

(declare-fun array_inv!27586 (array!74789) Bool)

(assert (=> start!98836 (array_inv!27586 _keys!1208)))

(assert (=> start!98836 true))

(assert (=> start!98836 tp!86033))

(declare-fun e!657045 () Bool)

(declare-fun array_inv!27587 (array!74791) Bool)

(assert (=> start!98836 (and (array_inv!27587 _values!996) e!657045)))

(declare-fun b!1155310 () Bool)

(declare-fun Unit!38043 () Unit!38040)

(assert (=> b!1155310 (= e!657033 Unit!38043)))

(declare-fun bm!54835 () Bool)

(assert (=> bm!54835 (= call!54839 (getCurrentListMapNoExtraKeys!4715 lt!518303 lt!518295 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155311 () Bool)

(assert (=> b!1155311 (= e!657040 e!657037)))

(declare-fun res!767601 () Bool)

(assert (=> b!1155311 (=> (not res!767601) (not e!657037))))

(assert (=> b!1155311 (= res!767601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518303 mask!1564))))

(assert (=> b!1155311 (= lt!518303 (array!74790 (store (arr!36045 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36581 _keys!1208)))))

(declare-fun mapIsEmpty!45281 () Bool)

(assert (=> mapIsEmpty!45281 mapRes!45281))

(declare-fun b!1155312 () Bool)

(declare-fun res!767590 () Bool)

(assert (=> b!1155312 (=> (not res!767590) (not e!657037))))

(declare-datatypes ((List!25236 0))(
  ( (Nil!25233) (Cons!25232 (h!26441 (_ BitVec 64)) (t!36669 List!25236)) )
))
(declare-fun arrayNoDuplicates!0 (array!74789 (_ BitVec 32) List!25236) Bool)

(assert (=> b!1155312 (= res!767590 (arrayNoDuplicates!0 lt!518303 #b00000000000000000000000000000000 Nil!25233))))

(declare-fun b!1155313 () Bool)

(declare-fun e!657038 () Bool)

(assert (=> b!1155313 (= e!657045 (and e!657038 mapRes!45281))))

(declare-fun condMapEmpty!45281 () Bool)

(declare-fun mapDefault!45281 () ValueCell!13776)

(assert (=> b!1155313 (= condMapEmpty!45281 (= (arr!36046 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13776)) mapDefault!45281)))))

(declare-fun b!1155314 () Bool)

(declare-fun res!767594 () Bool)

(assert (=> b!1155314 (=> (not res!767594) (not e!657040))))

(assert (=> b!1155314 (= res!767594 (and (= (size!36582 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36581 _keys!1208) (size!36582 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!54840 () Bool)

(declare-fun bm!54836 () Bool)

(declare-fun lt!518290 () ListLongMap!16461)

(assert (=> bm!54836 (= call!54840 (contains!6759 (ite c!114827 lt!518290 call!54837) k0!934))))

(declare-fun b!1155315 () Bool)

(declare-fun res!767597 () Bool)

(assert (=> b!1155315 (=> (not res!767597) (not e!657040))))

(assert (=> b!1155315 (= res!767597 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25233))))

(declare-fun e!657031 () Bool)

(declare-fun b!1155316 () Bool)

(assert (=> b!1155316 (= e!657031 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518299) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54837 () Bool)

(assert (=> bm!54837 (= call!54838 call!54835)))

(declare-fun b!1155317 () Bool)

(assert (=> b!1155317 (= e!657038 tp_is_empty!28971)))

(declare-fun b!1155318 () Bool)

(declare-fun Unit!38044 () Unit!38040)

(assert (=> b!1155318 (= e!657035 Unit!38044)))

(assert (=> b!1155318 (= lt!518299 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155318 (= c!114827 (and (not lt!518299) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518286 () Unit!38040)

(assert (=> b!1155318 (= lt!518286 e!657043)))

(declare-fun lt!518293 () Unit!38040)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!492 (array!74789 array!74791 (_ BitVec 32) (_ BitVec 32) V!43755 V!43755 (_ BitVec 64) (_ BitVec 32) Int) Unit!38040)

(assert (=> b!1155318 (= lt!518293 (lemmaListMapContainsThenArrayContainsFrom!492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114831 () Bool)

(assert (=> b!1155318 (= c!114831 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767589 () Bool)

(assert (=> b!1155318 (= res!767589 e!657031)))

(declare-fun e!657042 () Bool)

(assert (=> b!1155318 (=> (not res!767589) (not e!657042))))

(assert (=> b!1155318 e!657042))

(declare-fun lt!518294 () Unit!38040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74789 (_ BitVec 32) (_ BitVec 32)) Unit!38040)

(assert (=> b!1155318 (= lt!518294 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155318 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25233)))

(declare-fun lt!518300 () Unit!38040)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74789 (_ BitVec 64) (_ BitVec 32) List!25236) Unit!38040)

(assert (=> b!1155318 (= lt!518300 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25233))))

(assert (=> b!1155318 false))

(declare-fun b!1155319 () Bool)

(assert (=> b!1155319 call!54841))

(declare-fun lt!518307 () Unit!38040)

(assert (=> b!1155319 (= lt!518307 call!54838)))

(assert (=> b!1155319 (= e!657033 lt!518307)))

(declare-fun b!1155320 () Bool)

(assert (=> b!1155320 (contains!6759 (+!3659 lt!518290 (tuple2!18493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!518292 () Unit!38040)

(assert (=> b!1155320 (= lt!518292 (addStillContains!903 lt!518290 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1155320 call!54840))

(assert (=> b!1155320 (= lt!518290 call!54834)))

(declare-fun lt!518305 () Unit!38040)

(assert (=> b!1155320 (= lt!518305 call!54835)))

(assert (=> b!1155320 (= e!657043 lt!518292)))

(declare-fun b!1155321 () Bool)

(assert (=> b!1155321 (= e!657029 (= call!54839 (-!1366 call!54836 k0!934)))))

(declare-fun b!1155322 () Bool)

(declare-fun res!767596 () Bool)

(assert (=> b!1155322 (=> (not res!767596) (not e!657040))))

(assert (=> b!1155322 (= res!767596 (= (select (arr!36045 _keys!1208) i!673) k0!934))))

(declare-fun b!1155323 () Bool)

(assert (=> b!1155323 (= e!657042 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155324 () Bool)

(declare-fun res!767600 () Bool)

(assert (=> b!1155324 (=> (not res!767600) (not e!657040))))

(assert (=> b!1155324 (= res!767600 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36581 _keys!1208))))))

(declare-fun b!1155325 () Bool)

(assert (=> b!1155325 (= e!657031 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155326 () Bool)

(assert (=> b!1155326 (= e!657044 tp_is_empty!28971)))

(declare-fun bm!54838 () Bool)

(assert (=> bm!54838 (= call!54841 call!54840)))

(declare-fun b!1155327 () Bool)

(assert (=> b!1155327 (= e!657036 e!657041)))

(declare-fun res!767603 () Bool)

(assert (=> b!1155327 (=> res!767603 e!657041)))

(assert (=> b!1155327 (= res!767603 (not (= from!1455 i!673)))))

(declare-fun lt!518289 () ListLongMap!16461)

(assert (=> b!1155327 (= lt!518289 (getCurrentListMapNoExtraKeys!4715 lt!518303 lt!518295 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155327 (= lt!518295 (array!74792 (store (arr!36046 _values!996) i!673 (ValueCellFull!13776 lt!518291)) (size!36582 _values!996)))))

(declare-fun dynLambda!2724 (Int (_ BitVec 64)) V!43755)

(assert (=> b!1155327 (= lt!518291 (dynLambda!2724 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155327 (= lt!518297 (getCurrentListMapNoExtraKeys!4715 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98836 res!767592) b!1155301))

(assert (= (and b!1155301 res!767595) b!1155314))

(assert (= (and b!1155314 res!767594) b!1155299))

(assert (= (and b!1155299 res!767598) b!1155315))

(assert (= (and b!1155315 res!767597) b!1155324))

(assert (= (and b!1155324 res!767600) b!1155307))

(assert (= (and b!1155307 res!767593) b!1155322))

(assert (= (and b!1155322 res!767596) b!1155311))

(assert (= (and b!1155311 res!767601) b!1155312))

(assert (= (and b!1155312 res!767590) b!1155309))

(assert (= (and b!1155309 (not res!767599)) b!1155327))

(assert (= (and b!1155327 (not res!767603)) b!1155308))

(assert (= (and b!1155308 c!114830) b!1155321))

(assert (= (and b!1155308 (not c!114830)) b!1155306))

(assert (= (or b!1155321 b!1155306) bm!54835))

(assert (= (or b!1155321 b!1155306) bm!54831))

(assert (= (and b!1155308 (not res!767591)) b!1155305))

(assert (= (and b!1155305 c!114832) b!1155318))

(assert (= (and b!1155305 (not c!114832)) b!1155298))

(assert (= (and b!1155318 c!114827) b!1155320))

(assert (= (and b!1155318 (not c!114827)) b!1155302))

(assert (= (and b!1155302 c!114828) b!1155300))

(assert (= (and b!1155302 (not c!114828)) b!1155303))

(assert (= (and b!1155303 c!114829) b!1155319))

(assert (= (and b!1155303 (not c!114829)) b!1155310))

(assert (= (or b!1155300 b!1155319) bm!54837))

(assert (= (or b!1155300 b!1155319) bm!54834))

(assert (= (or b!1155300 b!1155319) bm!54838))

(assert (= (or b!1155320 bm!54838) bm!54836))

(assert (= (or b!1155320 bm!54837) bm!54832))

(assert (= (or b!1155320 bm!54834) bm!54833))

(assert (= (and b!1155318 c!114831) b!1155325))

(assert (= (and b!1155318 (not c!114831)) b!1155316))

(assert (= (and b!1155318 res!767589) b!1155323))

(assert (= (and b!1155305 res!767602) b!1155304))

(assert (= (and b!1155313 condMapEmpty!45281) mapIsEmpty!45281))

(assert (= (and b!1155313 (not condMapEmpty!45281)) mapNonEmpty!45281))

(get-info :version)

(assert (= (and mapNonEmpty!45281 ((_ is ValueCellFull!13776) mapValue!45281)) b!1155326))

(assert (= (and b!1155313 ((_ is ValueCellFull!13776) mapDefault!45281)) b!1155317))

(assert (= start!98836 b!1155313))

(declare-fun b_lambda!19547 () Bool)

(assert (=> (not b_lambda!19547) (not b!1155327)))

(declare-fun t!36667 () Bool)

(declare-fun tb!9253 () Bool)

(assert (=> (and start!98836 (= defaultEntry!1004 defaultEntry!1004) t!36667) tb!9253))

(declare-fun result!19071 () Bool)

(assert (=> tb!9253 (= result!19071 tp_is_empty!28971)))

(assert (=> b!1155327 t!36667))

(declare-fun b_and!39733 () Bool)

(assert (= b_and!39731 (and (=> t!36667 result!19071) b_and!39733)))

(declare-fun m!1064905 () Bool)

(assert (=> bm!54835 m!1064905))

(declare-fun m!1064907 () Bool)

(assert (=> b!1155305 m!1064907))

(declare-fun m!1064909 () Bool)

(assert (=> b!1155305 m!1064909))

(declare-fun m!1064911 () Bool)

(assert (=> b!1155305 m!1064911))

(declare-fun m!1064913 () Bool)

(assert (=> b!1155305 m!1064913))

(declare-fun m!1064915 () Bool)

(assert (=> b!1155305 m!1064915))

(declare-fun m!1064917 () Bool)

(assert (=> b!1155305 m!1064917))

(assert (=> b!1155305 m!1064911))

(declare-fun m!1064919 () Bool)

(assert (=> b!1155305 m!1064919))

(assert (=> b!1155305 m!1064913))

(declare-fun m!1064921 () Bool)

(assert (=> b!1155305 m!1064921))

(assert (=> b!1155305 m!1064917))

(assert (=> b!1155305 m!1064913))

(declare-fun m!1064923 () Bool)

(assert (=> b!1155305 m!1064923))

(declare-fun m!1064925 () Bool)

(assert (=> b!1155299 m!1064925))

(declare-fun m!1064927 () Bool)

(assert (=> start!98836 m!1064927))

(declare-fun m!1064929 () Bool)

(assert (=> start!98836 m!1064929))

(declare-fun m!1064931 () Bool)

(assert (=> b!1155325 m!1064931))

(declare-fun m!1064933 () Bool)

(assert (=> bm!54836 m!1064933))

(declare-fun m!1064935 () Bool)

(assert (=> b!1155311 m!1064935))

(declare-fun m!1064937 () Bool)

(assert (=> b!1155311 m!1064937))

(assert (=> b!1155323 m!1064931))

(assert (=> bm!54831 m!1064907))

(declare-fun m!1064939 () Bool)

(assert (=> b!1155309 m!1064939))

(declare-fun m!1064941 () Bool)

(assert (=> b!1155309 m!1064941))

(declare-fun m!1064943 () Bool)

(assert (=> b!1155312 m!1064943))

(declare-fun m!1064945 () Bool)

(assert (=> bm!54832 m!1064945))

(declare-fun m!1064947 () Bool)

(assert (=> b!1155320 m!1064947))

(assert (=> b!1155320 m!1064947))

(declare-fun m!1064949 () Bool)

(assert (=> b!1155320 m!1064949))

(declare-fun m!1064951 () Bool)

(assert (=> b!1155320 m!1064951))

(declare-fun m!1064953 () Bool)

(assert (=> b!1155321 m!1064953))

(declare-fun m!1064955 () Bool)

(assert (=> b!1155315 m!1064955))

(assert (=> b!1155304 m!1064905))

(declare-fun m!1064957 () Bool)

(assert (=> b!1155307 m!1064957))

(declare-fun m!1064959 () Bool)

(assert (=> b!1155318 m!1064959))

(declare-fun m!1064961 () Bool)

(assert (=> b!1155318 m!1064961))

(declare-fun m!1064963 () Bool)

(assert (=> b!1155318 m!1064963))

(declare-fun m!1064965 () Bool)

(assert (=> b!1155318 m!1064965))

(declare-fun m!1064967 () Bool)

(assert (=> bm!54833 m!1064967))

(declare-fun m!1064969 () Bool)

(assert (=> b!1155301 m!1064969))

(declare-fun m!1064971 () Bool)

(assert (=> mapNonEmpty!45281 m!1064971))

(declare-fun m!1064973 () Bool)

(assert (=> b!1155327 m!1064973))

(declare-fun m!1064975 () Bool)

(assert (=> b!1155327 m!1064975))

(declare-fun m!1064977 () Bool)

(assert (=> b!1155327 m!1064977))

(declare-fun m!1064979 () Bool)

(assert (=> b!1155327 m!1064979))

(declare-fun m!1064981 () Bool)

(assert (=> b!1155322 m!1064981))

(assert (=> b!1155308 m!1064913))

(declare-fun m!1064983 () Bool)

(assert (=> b!1155308 m!1064983))

(check-sat (not b!1155320) (not b!1155325) (not mapNonEmpty!45281) (not bm!54836) (not b!1155309) (not b_lambda!19547) (not b!1155321) (not b!1155307) (not b!1155304) (not b_next!24441) (not b!1155308) (not b!1155327) (not b!1155301) (not bm!54832) (not b!1155299) (not start!98836) (not b!1155305) (not bm!54833) (not b!1155312) tp_is_empty!28971 (not b!1155323) (not b!1155311) (not b!1155318) b_and!39733 (not b!1155315) (not bm!54831) (not bm!54835))
(check-sat b_and!39733 (not b_next!24441))
