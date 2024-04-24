; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98452 () Bool)

(assert start!98452)

(declare-fun b_free!23917 () Bool)

(declare-fun b_next!23917 () Bool)

(assert (=> start!98452 (= b_free!23917 (not b_next!23917))))

(declare-fun tp!84455 () Bool)

(declare-fun b_and!38627 () Bool)

(assert (=> start!98452 (= tp!84455 b_and!38627)))

(declare-datatypes ((V!43057 0))(
  ( (V!43058 (val!14280 Int)) )
))
(declare-fun zeroValue!944 () V!43057)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!73797 0))(
  ( (array!73798 (arr!35545 (Array (_ BitVec 32) (_ BitVec 64))) (size!36082 (_ BitVec 32))) )
))
(declare-fun lt!502748 () array!73797)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13514 0))(
  ( (ValueCellFull!13514 (v!16909 V!43057)) (EmptyCell!13514) )
))
(declare-datatypes ((array!73799 0))(
  ( (array!73800 (arr!35546 (Array (_ BitVec 32) ValueCell!13514)) (size!36083 (_ BitVec 32))) )
))
(declare-fun lt!502749 () array!73799)

(declare-fun bm!48541 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18006 0))(
  ( (tuple2!18007 (_1!9014 (_ BitVec 64)) (_2!9014 V!43057)) )
))
(declare-datatypes ((List!24783 0))(
  ( (Nil!24780) (Cons!24779 (h!25997 tuple2!18006) (t!35684 List!24783)) )
))
(declare-datatypes ((ListLongMap!15983 0))(
  ( (ListLongMap!15984 (toList!8007 List!24783)) )
))
(declare-fun call!48544 () ListLongMap!15983)

(declare-fun minValue!944 () V!43057)

(declare-fun getCurrentListMapNoExtraKeys!4525 (array!73797 array!73799 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) Int) ListLongMap!15983)

(assert (=> bm!48541 (= call!48544 (getCurrentListMapNoExtraKeys!4525 lt!502748 lt!502749 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132203 () Bool)

(declare-fun res!756085 () Bool)

(declare-fun e!644451 () Bool)

(assert (=> b!1132203 (=> (not res!756085) (not e!644451))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73797)

(assert (=> b!1132203 (= res!756085 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36082 _keys!1208))))))

(declare-fun mapIsEmpty!44488 () Bool)

(declare-fun mapRes!44488 () Bool)

(assert (=> mapIsEmpty!44488 mapRes!44488))

(declare-fun b!1132204 () Bool)

(declare-datatypes ((Unit!37023 0))(
  ( (Unit!37024) )
))
(declare-fun e!644443 () Unit!37023)

(declare-fun e!644444 () Unit!37023)

(assert (=> b!1132204 (= e!644443 e!644444)))

(declare-fun c!110498 () Bool)

(declare-fun lt!502755 () Bool)

(assert (=> b!1132204 (= c!110498 (and (not lt!502755) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1132205 () Bool)

(declare-fun res!756072 () Bool)

(assert (=> b!1132205 (=> (not res!756072) (not e!644451))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1132205 (= res!756072 (= (select (arr!35545 _keys!1208) i!673) k0!934))))

(declare-fun b!1132206 () Bool)

(declare-fun e!644452 () Bool)

(declare-fun tp_is_empty!28447 () Bool)

(assert (=> b!1132206 (= e!644452 tp_is_empty!28447)))

(declare-fun b!1132207 () Bool)

(declare-fun e!644457 () Bool)

(declare-fun e!644453 () Bool)

(assert (=> b!1132207 (= e!644457 (not e!644453))))

(declare-fun res!756076 () Bool)

(assert (=> b!1132207 (=> res!756076 e!644453)))

(assert (=> b!1132207 (= res!756076 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132207 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502762 () Unit!37023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73797 (_ BitVec 64) (_ BitVec 32)) Unit!37023)

(assert (=> b!1132207 (= lt!502762 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48542 () Bool)

(declare-fun call!48546 () ListLongMap!15983)

(declare-fun call!48549 () ListLongMap!15983)

(assert (=> bm!48542 (= call!48546 call!48549)))

(declare-fun bm!48543 () Bool)

(declare-fun call!48551 () Unit!37023)

(declare-fun call!48545 () Unit!37023)

(assert (=> bm!48543 (= call!48551 call!48545)))

(declare-fun b!1132208 () Bool)

(declare-fun e!644450 () Unit!37023)

(declare-fun lt!502758 () Unit!37023)

(assert (=> b!1132208 (= e!644450 lt!502758)))

(assert (=> b!1132208 (= lt!502758 call!48551)))

(declare-fun call!48550 () Bool)

(assert (=> b!1132208 call!48550))

(declare-fun b!1132209 () Bool)

(declare-fun e!644447 () Bool)

(declare-fun call!48547 () ListLongMap!15983)

(assert (=> b!1132209 (= e!644447 (= call!48544 call!48547))))

(declare-fun _values!996 () array!73799)

(declare-fun bm!48544 () Bool)

(assert (=> bm!48544 (= call!48547 (getCurrentListMapNoExtraKeys!4525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132210 () Bool)

(declare-fun e!644446 () Bool)

(assert (=> b!1132210 (= e!644446 true)))

(declare-fun lt!502754 () Bool)

(declare-fun contains!6541 (ListLongMap!15983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4435 (array!73797 array!73799 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) Int) ListLongMap!15983)

(assert (=> b!1132210 (= lt!502754 (contains!6541 (getCurrentListMap!4435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun call!48548 () Bool)

(declare-fun lt!502760 () ListLongMap!15983)

(declare-fun bm!48545 () Bool)

(declare-fun c!110499 () Bool)

(assert (=> bm!48545 (= call!48548 (contains!6541 (ite c!110499 lt!502760 call!48546) k0!934))))

(declare-fun b!1132211 () Bool)

(declare-fun e!644456 () Bool)

(assert (=> b!1132211 (= e!644453 e!644456)))

(declare-fun res!756081 () Bool)

(assert (=> b!1132211 (=> res!756081 e!644456)))

(assert (=> b!1132211 (= res!756081 (not (= from!1455 i!673)))))

(declare-fun lt!502751 () ListLongMap!15983)

(assert (=> b!1132211 (= lt!502751 (getCurrentListMapNoExtraKeys!4525 lt!502748 lt!502749 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2586 (Int (_ BitVec 64)) V!43057)

(assert (=> b!1132211 (= lt!502749 (array!73800 (store (arr!35546 _values!996) i!673 (ValueCellFull!13514 (dynLambda!2586 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36083 _values!996)))))

(declare-fun lt!502759 () ListLongMap!15983)

(assert (=> b!1132211 (= lt!502759 (getCurrentListMapNoExtraKeys!4525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1132212 () Bool)

(declare-fun e!644454 () Bool)

(assert (=> b!1132212 (= e!644454 tp_is_empty!28447)))

(declare-fun b!1132213 () Bool)

(declare-fun res!756083 () Bool)

(assert (=> b!1132213 (=> (not res!756083) (not e!644451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73797 (_ BitVec 32)) Bool)

(assert (=> b!1132213 (= res!756083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1132214 () Bool)

(declare-fun c!110500 () Bool)

(assert (=> b!1132214 (= c!110500 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502755))))

(assert (=> b!1132214 (= e!644444 e!644450)))

(declare-fun bm!48546 () Bool)

(declare-fun lt!502757 () ListLongMap!15983)

(declare-fun +!3473 (ListLongMap!15983 tuple2!18006) ListLongMap!15983)

(assert (=> bm!48546 (= call!48549 (+!3473 lt!502757 (ite (or c!110499 c!110498) (tuple2!18007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132215 () Bool)

(declare-fun Unit!37025 () Unit!37023)

(assert (=> b!1132215 (= e!644450 Unit!37025)))

(declare-fun b!1132216 () Bool)

(declare-fun res!756079 () Bool)

(assert (=> b!1132216 (=> (not res!756079) (not e!644451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132216 (= res!756079 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44488 () Bool)

(declare-fun tp!84454 () Bool)

(assert (=> mapNonEmpty!44488 (= mapRes!44488 (and tp!84454 e!644452))))

(declare-fun mapKey!44488 () (_ BitVec 32))

(declare-fun mapValue!44488 () ValueCell!13514)

(declare-fun mapRest!44488 () (Array (_ BitVec 32) ValueCell!13514))

(assert (=> mapNonEmpty!44488 (= (arr!35546 _values!996) (store mapRest!44488 mapKey!44488 mapValue!44488))))

(declare-fun b!1132217 () Bool)

(declare-fun res!756075 () Bool)

(assert (=> b!1132217 (=> (not res!756075) (not e!644451))))

(assert (=> b!1132217 (= res!756075 (and (= (size!36083 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36082 _keys!1208) (size!36083 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48547 () Bool)

(declare-fun addStillContains!698 (ListLongMap!15983 (_ BitVec 64) V!43057 (_ BitVec 64)) Unit!37023)

(assert (=> bm!48547 (= call!48545 (addStillContains!698 lt!502757 (ite (or c!110499 c!110498) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110499 c!110498) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1132218 () Bool)

(declare-fun lt!502753 () Unit!37023)

(assert (=> b!1132218 (= e!644443 lt!502753)))

(declare-fun lt!502750 () Unit!37023)

(assert (=> b!1132218 (= lt!502750 call!48545)))

(assert (=> b!1132218 (= lt!502760 call!48549)))

(assert (=> b!1132218 call!48548))

(assert (=> b!1132218 (= lt!502753 (addStillContains!698 lt!502760 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1132218 (contains!6541 (+!3473 lt!502760 (tuple2!18007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!48548 () Bool)

(assert (=> bm!48548 (= call!48550 call!48548)))

(declare-fun b!1132219 () Bool)

(declare-fun res!756073 () Bool)

(assert (=> b!1132219 (=> (not res!756073) (not e!644457))))

(declare-datatypes ((List!24784 0))(
  ( (Nil!24781) (Cons!24780 (h!25998 (_ BitVec 64)) (t!35685 List!24784)) )
))
(declare-fun arrayNoDuplicates!0 (array!73797 (_ BitVec 32) List!24784) Bool)

(assert (=> b!1132219 (= res!756073 (arrayNoDuplicates!0 lt!502748 #b00000000000000000000000000000000 Nil!24781))))

(declare-fun b!1132220 () Bool)

(declare-fun res!756082 () Bool)

(assert (=> b!1132220 (=> (not res!756082) (not e!644451))))

(assert (=> b!1132220 (= res!756082 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24781))))

(declare-fun b!1132221 () Bool)

(assert (=> b!1132221 call!48550))

(declare-fun lt!502752 () Unit!37023)

(assert (=> b!1132221 (= lt!502752 call!48551)))

(assert (=> b!1132221 (= e!644444 lt!502752)))

(declare-fun b!1132222 () Bool)

(assert (=> b!1132222 (= e!644451 e!644457)))

(declare-fun res!756078 () Bool)

(assert (=> b!1132222 (=> (not res!756078) (not e!644457))))

(assert (=> b!1132222 (= res!756078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502748 mask!1564))))

(assert (=> b!1132222 (= lt!502748 (array!73798 (store (arr!35545 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36082 _keys!1208)))))

(declare-fun b!1132223 () Bool)

(declare-fun e!644455 () Bool)

(assert (=> b!1132223 (= e!644455 e!644446)))

(declare-fun res!756074 () Bool)

(assert (=> b!1132223 (=> res!756074 e!644446)))

(assert (=> b!1132223 (= res!756074 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36082 _keys!1208))))))

(declare-fun lt!502761 () Unit!37023)

(assert (=> b!1132223 (= lt!502761 e!644443)))

(assert (=> b!1132223 (= c!110499 (and (not lt!502755) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132223 (= lt!502755 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132224 () Bool)

(declare-fun res!756080 () Bool)

(assert (=> b!1132224 (=> (not res!756080) (not e!644451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132224 (= res!756080 (validMask!0 mask!1564))))

(declare-fun b!1132225 () Bool)

(declare-fun e!644448 () Bool)

(assert (=> b!1132225 (= e!644456 e!644448)))

(declare-fun res!756077 () Bool)

(assert (=> b!1132225 (=> res!756077 e!644448)))

(assert (=> b!1132225 (= res!756077 (not (= (select (arr!35545 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1132225 e!644447))

(declare-fun c!110501 () Bool)

(assert (=> b!1132225 (= c!110501 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502756 () Unit!37023)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!426 (array!73797 array!73799 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37023)

(assert (=> b!1132225 (= lt!502756 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132226 () Bool)

(declare-fun -!1167 (ListLongMap!15983 (_ BitVec 64)) ListLongMap!15983)

(assert (=> b!1132226 (= e!644447 (= call!48544 (-!1167 call!48547 k0!934)))))

(declare-fun b!1132227 () Bool)

(declare-fun e!644449 () Bool)

(assert (=> b!1132227 (= e!644449 (and e!644454 mapRes!44488))))

(declare-fun condMapEmpty!44488 () Bool)

(declare-fun mapDefault!44488 () ValueCell!13514)

(assert (=> b!1132227 (= condMapEmpty!44488 (= (arr!35546 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13514)) mapDefault!44488)))))

(declare-fun res!756084 () Bool)

(assert (=> start!98452 (=> (not res!756084) (not e!644451))))

(assert (=> start!98452 (= res!756084 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36082 _keys!1208))))))

(assert (=> start!98452 e!644451))

(assert (=> start!98452 tp_is_empty!28447))

(declare-fun array_inv!27322 (array!73797) Bool)

(assert (=> start!98452 (array_inv!27322 _keys!1208)))

(assert (=> start!98452 true))

(assert (=> start!98452 tp!84455))

(declare-fun array_inv!27323 (array!73799) Bool)

(assert (=> start!98452 (and (array_inv!27323 _values!996) e!644449)))

(declare-fun b!1132228 () Bool)

(assert (=> b!1132228 (= e!644448 e!644455)))

(declare-fun res!756071 () Bool)

(assert (=> b!1132228 (=> res!756071 e!644455)))

(assert (=> b!1132228 (= res!756071 (not (contains!6541 lt!502757 k0!934)))))

(assert (=> b!1132228 (= lt!502757 (getCurrentListMapNoExtraKeys!4525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98452 res!756084) b!1132224))

(assert (= (and b!1132224 res!756080) b!1132217))

(assert (= (and b!1132217 res!756075) b!1132213))

(assert (= (and b!1132213 res!756083) b!1132220))

(assert (= (and b!1132220 res!756082) b!1132203))

(assert (= (and b!1132203 res!756085) b!1132216))

(assert (= (and b!1132216 res!756079) b!1132205))

(assert (= (and b!1132205 res!756072) b!1132222))

(assert (= (and b!1132222 res!756078) b!1132219))

(assert (= (and b!1132219 res!756073) b!1132207))

(assert (= (and b!1132207 (not res!756076)) b!1132211))

(assert (= (and b!1132211 (not res!756081)) b!1132225))

(assert (= (and b!1132225 c!110501) b!1132226))

(assert (= (and b!1132225 (not c!110501)) b!1132209))

(assert (= (or b!1132226 b!1132209) bm!48541))

(assert (= (or b!1132226 b!1132209) bm!48544))

(assert (= (and b!1132225 (not res!756077)) b!1132228))

(assert (= (and b!1132228 (not res!756071)) b!1132223))

(assert (= (and b!1132223 c!110499) b!1132218))

(assert (= (and b!1132223 (not c!110499)) b!1132204))

(assert (= (and b!1132204 c!110498) b!1132221))

(assert (= (and b!1132204 (not c!110498)) b!1132214))

(assert (= (and b!1132214 c!110500) b!1132208))

(assert (= (and b!1132214 (not c!110500)) b!1132215))

(assert (= (or b!1132221 b!1132208) bm!48543))

(assert (= (or b!1132221 b!1132208) bm!48542))

(assert (= (or b!1132221 b!1132208) bm!48548))

(assert (= (or b!1132218 bm!48548) bm!48545))

(assert (= (or b!1132218 bm!48543) bm!48547))

(assert (= (or b!1132218 bm!48542) bm!48546))

(assert (= (and b!1132223 (not res!756074)) b!1132210))

(assert (= (and b!1132227 condMapEmpty!44488) mapIsEmpty!44488))

(assert (= (and b!1132227 (not condMapEmpty!44488)) mapNonEmpty!44488))

(get-info :version)

(assert (= (and mapNonEmpty!44488 ((_ is ValueCellFull!13514) mapValue!44488)) b!1132206))

(assert (= (and b!1132227 ((_ is ValueCellFull!13514) mapDefault!44488)) b!1132212))

(assert (= start!98452 b!1132227))

(declare-fun b_lambda!18897 () Bool)

(assert (=> (not b_lambda!18897) (not b!1132211)))

(declare-fun t!35683 () Bool)

(declare-fun tb!8721 () Bool)

(assert (=> (and start!98452 (= defaultEntry!1004 defaultEntry!1004) t!35683) tb!8721))

(declare-fun result!18011 () Bool)

(assert (=> tb!8721 (= result!18011 tp_is_empty!28447)))

(assert (=> b!1132211 t!35683))

(declare-fun b_and!38629 () Bool)

(assert (= b_and!38627 (and (=> t!35683 result!18011) b_and!38629)))

(declare-fun m!1045611 () Bool)

(assert (=> mapNonEmpty!44488 m!1045611))

(declare-fun m!1045613 () Bool)

(assert (=> b!1132219 m!1045613))

(declare-fun m!1045615 () Bool)

(assert (=> b!1132226 m!1045615))

(declare-fun m!1045617 () Bool)

(assert (=> b!1132210 m!1045617))

(assert (=> b!1132210 m!1045617))

(declare-fun m!1045619 () Bool)

(assert (=> b!1132210 m!1045619))

(declare-fun m!1045621 () Bool)

(assert (=> b!1132228 m!1045621))

(declare-fun m!1045623 () Bool)

(assert (=> b!1132228 m!1045623))

(declare-fun m!1045625 () Bool)

(assert (=> b!1132224 m!1045625))

(declare-fun m!1045627 () Bool)

(assert (=> b!1132207 m!1045627))

(declare-fun m!1045629 () Bool)

(assert (=> b!1132207 m!1045629))

(declare-fun m!1045631 () Bool)

(assert (=> b!1132213 m!1045631))

(declare-fun m!1045633 () Bool)

(assert (=> bm!48546 m!1045633))

(declare-fun m!1045635 () Bool)

(assert (=> bm!48541 m!1045635))

(declare-fun m!1045637 () Bool)

(assert (=> b!1132220 m!1045637))

(declare-fun m!1045639 () Bool)

(assert (=> b!1132218 m!1045639))

(declare-fun m!1045641 () Bool)

(assert (=> b!1132218 m!1045641))

(assert (=> b!1132218 m!1045641))

(declare-fun m!1045643 () Bool)

(assert (=> b!1132218 m!1045643))

(declare-fun m!1045645 () Bool)

(assert (=> b!1132216 m!1045645))

(declare-fun m!1045647 () Bool)

(assert (=> start!98452 m!1045647))

(declare-fun m!1045649 () Bool)

(assert (=> start!98452 m!1045649))

(declare-fun m!1045651 () Bool)

(assert (=> b!1132222 m!1045651))

(declare-fun m!1045653 () Bool)

(assert (=> b!1132222 m!1045653))

(assert (=> bm!48544 m!1045623))

(declare-fun m!1045655 () Bool)

(assert (=> b!1132225 m!1045655))

(declare-fun m!1045657 () Bool)

(assert (=> b!1132225 m!1045657))

(declare-fun m!1045659 () Bool)

(assert (=> bm!48547 m!1045659))

(declare-fun m!1045661 () Bool)

(assert (=> bm!48545 m!1045661))

(declare-fun m!1045663 () Bool)

(assert (=> b!1132211 m!1045663))

(declare-fun m!1045665 () Bool)

(assert (=> b!1132211 m!1045665))

(declare-fun m!1045667 () Bool)

(assert (=> b!1132211 m!1045667))

(declare-fun m!1045669 () Bool)

(assert (=> b!1132211 m!1045669))

(declare-fun m!1045671 () Bool)

(assert (=> b!1132205 m!1045671))

(check-sat (not b!1132225) (not bm!48544) (not bm!48547) (not b!1132211) (not b!1132219) (not bm!48541) (not b_next!23917) (not b!1132224) (not start!98452) (not bm!48545) (not b_lambda!18897) (not bm!48546) (not b!1132218) (not mapNonEmpty!44488) (not b!1132228) tp_is_empty!28447 (not b!1132226) b_and!38629 (not b!1132210) (not b!1132216) (not b!1132207) (not b!1132213) (not b!1132220) (not b!1132222))
(check-sat b_and!38629 (not b_next!23917))
