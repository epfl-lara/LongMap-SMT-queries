; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98578 () Bool)

(assert start!98578)

(declare-fun b_free!23947 () Bool)

(declare-fun b_next!23947 () Bool)

(assert (=> start!98578 (= b_free!23947 (not b_next!23947))))

(declare-fun tp!84552 () Bool)

(declare-fun b_and!38745 () Bool)

(assert (=> start!98578 (= tp!84552 b_and!38745)))

(declare-fun b!1134120 () Bool)

(declare-datatypes ((Unit!37090 0))(
  ( (Unit!37091) )
))
(declare-fun e!645569 () Unit!37090)

(declare-fun Unit!37092 () Unit!37090)

(assert (=> b!1134120 (= e!645569 Unit!37092)))

(declare-fun b!1134121 () Bool)

(declare-fun c!110905 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!503860 () Bool)

(assert (=> b!1134121 (= c!110905 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503860))))

(declare-fun e!645573 () Unit!37090)

(assert (=> b!1134121 (= e!645573 e!645569)))

(declare-fun b!1134122 () Bool)

(declare-fun e!645563 () Bool)

(declare-fun e!645570 () Bool)

(declare-fun mapRes!44540 () Bool)

(assert (=> b!1134122 (= e!645563 (and e!645570 mapRes!44540))))

(declare-fun condMapEmpty!44540 () Bool)

(declare-datatypes ((V!43097 0))(
  ( (V!43098 (val!14295 Int)) )
))
(declare-datatypes ((ValueCell!13529 0))(
  ( (ValueCellFull!13529 (v!16928 V!43097)) (EmptyCell!13529) )
))
(declare-datatypes ((array!73859 0))(
  ( (array!73860 (arr!35574 (Array (_ BitVec 32) ValueCell!13529)) (size!36111 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73859)

(declare-fun mapDefault!44540 () ValueCell!13529)

(assert (=> b!1134122 (= condMapEmpty!44540 (= (arr!35574 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13529)) mapDefault!44540)))))

(declare-fun b!1134123 () Bool)

(declare-fun e!645564 () Unit!37090)

(declare-fun lt!503853 () Unit!37090)

(assert (=> b!1134123 (= e!645564 lt!503853)))

(declare-fun zeroValue!944 () V!43097)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!18034 0))(
  ( (tuple2!18035 (_1!9028 (_ BitVec 64)) (_2!9028 V!43097)) )
))
(declare-datatypes ((List!24807 0))(
  ( (Nil!24804) (Cons!24803 (h!26021 tuple2!18034) (t!35738 List!24807)) )
))
(declare-datatypes ((ListLongMap!16011 0))(
  ( (ListLongMap!16012 (toList!8021 List!24807)) )
))
(declare-fun lt!503861 () ListLongMap!16011)

(declare-fun lt!503859 () Unit!37090)

(declare-fun addStillContains!710 (ListLongMap!16011 (_ BitVec 64) V!43097 (_ BitVec 64)) Unit!37090)

(assert (=> b!1134123 (= lt!503859 (addStillContains!710 lt!503861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!503850 () ListLongMap!16011)

(declare-fun +!3484 (ListLongMap!16011 tuple2!18034) ListLongMap!16011)

(assert (=> b!1134123 (= lt!503850 (+!3484 lt!503861 (tuple2!18035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!48973 () Bool)

(assert (=> b!1134123 call!48973))

(declare-fun call!48978 () Unit!37090)

(assert (=> b!1134123 (= lt!503853 call!48978)))

(declare-fun call!48972 () ListLongMap!16011)

(declare-fun contains!6557 (ListLongMap!16011 (_ BitVec 64)) Bool)

(assert (=> b!1134123 (contains!6557 call!48972 k0!934)))

(declare-fun b!1134124 () Bool)

(declare-fun e!645565 () Bool)

(assert (=> b!1134124 (= e!645565 true)))

(declare-fun e!645568 () Bool)

(assert (=> b!1134124 e!645568))

(declare-fun res!756995 () Bool)

(assert (=> b!1134124 (=> (not res!756995) (not e!645568))))

(declare-fun e!645566 () Bool)

(assert (=> b!1134124 (= res!756995 e!645566)))

(declare-fun c!110907 () Bool)

(assert (=> b!1134124 (= c!110907 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!73861 0))(
  ( (array!73862 (arr!35575 (Array (_ BitVec 32) (_ BitVec 64))) (size!36112 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73861)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43097)

(declare-fun lt!503852 () Unit!37090)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!320 (array!73861 array!73859 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 64) (_ BitVec 32) Int) Unit!37090)

(assert (=> b!1134124 (= lt!503852 (lemmaListMapContainsThenArrayContainsFrom!320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503858 () Unit!37090)

(assert (=> b!1134124 (= lt!503858 e!645564)))

(declare-fun c!110906 () Bool)

(assert (=> b!1134124 (= c!110906 (and (not lt!503860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134124 (= lt!503860 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48968 () Bool)

(declare-fun call!48971 () ListLongMap!16011)

(assert (=> bm!48968 (= call!48971 call!48972)))

(declare-fun e!645571 () Bool)

(declare-fun b!1134125 () Bool)

(declare-fun call!48974 () ListLongMap!16011)

(declare-fun call!48977 () ListLongMap!16011)

(declare-fun -!1177 (ListLongMap!16011 (_ BitVec 64)) ListLongMap!16011)

(assert (=> b!1134125 (= e!645571 (= call!48977 (-!1177 call!48974 k0!934)))))

(declare-fun b!1134126 () Bool)

(declare-fun res!756997 () Bool)

(declare-fun e!645562 () Bool)

(assert (=> b!1134126 (=> (not res!756997) (not e!645562))))

(assert (=> b!1134126 (= res!756997 (and (= (size!36111 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36112 _keys!1208) (size!36111 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48969 () Bool)

(declare-fun call!48976 () Bool)

(assert (=> bm!48969 (= call!48976 call!48973)))

(declare-fun bm!48970 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4537 (array!73861 array!73859 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 32) Int) ListLongMap!16011)

(assert (=> bm!48970 (= call!48974 (getCurrentListMapNoExtraKeys!4537 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134127 () Bool)

(declare-fun e!645572 () Bool)

(declare-fun tp_is_empty!28477 () Bool)

(assert (=> b!1134127 (= e!645572 tp_is_empty!28477)))

(declare-fun bm!48971 () Bool)

(assert (=> bm!48971 (= call!48973 (contains!6557 (ite c!110906 lt!503850 call!48971) k0!934))))

(declare-fun res!757002 () Bool)

(assert (=> start!98578 (=> (not res!757002) (not e!645562))))

(assert (=> start!98578 (= res!757002 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36112 _keys!1208))))))

(assert (=> start!98578 e!645562))

(assert (=> start!98578 tp_is_empty!28477))

(declare-fun array_inv!27342 (array!73861) Bool)

(assert (=> start!98578 (array_inv!27342 _keys!1208)))

(assert (=> start!98578 true))

(assert (=> start!98578 tp!84552))

(declare-fun array_inv!27343 (array!73859) Bool)

(assert (=> start!98578 (and (array_inv!27343 _values!996) e!645563)))

(declare-fun lt!503862 () array!73859)

(declare-fun bm!48972 () Bool)

(declare-fun lt!503855 () array!73861)

(assert (=> bm!48972 (= call!48977 (getCurrentListMapNoExtraKeys!4537 lt!503855 lt!503862 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44540 () Bool)

(declare-fun tp!84551 () Bool)

(assert (=> mapNonEmpty!44540 (= mapRes!44540 (and tp!84551 e!645572))))

(declare-fun mapValue!44540 () ValueCell!13529)

(declare-fun mapKey!44540 () (_ BitVec 32))

(declare-fun mapRest!44540 () (Array (_ BitVec 32) ValueCell!13529))

(assert (=> mapNonEmpty!44540 (= (arr!35574 _values!996) (store mapRest!44540 mapKey!44540 mapValue!44540))))

(declare-fun b!1134128 () Bool)

(assert (=> b!1134128 (= e!645564 e!645573)))

(declare-fun c!110904 () Bool)

(assert (=> b!1134128 (= c!110904 (and (not lt!503860) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48973 () Bool)

(declare-fun call!48975 () Unit!37090)

(assert (=> bm!48973 (= call!48975 call!48978)))

(declare-fun b!1134129 () Bool)

(assert (=> b!1134129 (= e!645571 (= call!48977 call!48974))))

(declare-fun b!1134130 () Bool)

(declare-fun res!756993 () Bool)

(declare-fun e!645560 () Bool)

(assert (=> b!1134130 (=> (not res!756993) (not e!645560))))

(declare-datatypes ((List!24808 0))(
  ( (Nil!24805) (Cons!24804 (h!26022 (_ BitVec 64)) (t!35739 List!24808)) )
))
(declare-fun arrayNoDuplicates!0 (array!73861 (_ BitVec 32) List!24808) Bool)

(assert (=> b!1134130 (= res!756993 (arrayNoDuplicates!0 lt!503855 #b00000000000000000000000000000000 Nil!24805))))

(declare-fun b!1134131 () Bool)

(declare-fun arrayContainsKey!0 (array!73861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134131 (= e!645566 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134132 () Bool)

(assert (=> b!1134132 (= e!645568 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134133 () Bool)

(declare-fun lt!503851 () Unit!37090)

(assert (=> b!1134133 (= e!645569 lt!503851)))

(assert (=> b!1134133 (= lt!503851 call!48975)))

(assert (=> b!1134133 call!48976))

(declare-fun b!1134134 () Bool)

(assert (=> b!1134134 call!48976))

(declare-fun lt!503854 () Unit!37090)

(assert (=> b!1134134 (= lt!503854 call!48975)))

(assert (=> b!1134134 (= e!645573 lt!503854)))

(declare-fun b!1134135 () Bool)

(declare-fun e!645559 () Bool)

(declare-fun e!645567 () Bool)

(assert (=> b!1134135 (= e!645559 e!645567)))

(declare-fun res!756994 () Bool)

(assert (=> b!1134135 (=> res!756994 e!645567)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134135 (= res!756994 (not (= from!1455 i!673)))))

(declare-fun lt!503857 () ListLongMap!16011)

(assert (=> b!1134135 (= lt!503857 (getCurrentListMapNoExtraKeys!4537 lt!503855 lt!503862 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2597 (Int (_ BitVec 64)) V!43097)

(assert (=> b!1134135 (= lt!503862 (array!73860 (store (arr!35574 _values!996) i!673 (ValueCellFull!13529 (dynLambda!2597 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36111 _values!996)))))

(declare-fun lt!503863 () ListLongMap!16011)

(assert (=> b!1134135 (= lt!503863 (getCurrentListMapNoExtraKeys!4537 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48974 () Bool)

(assert (=> bm!48974 (= call!48972 (+!3484 (ite c!110906 lt!503850 lt!503861) (ite c!110906 (tuple2!18035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110904 (tuple2!18035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48975 () Bool)

(assert (=> bm!48975 (= call!48978 (addStillContains!710 (ite c!110906 lt!503850 lt!503861) (ite c!110906 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110904 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110906 minValue!944 (ite c!110904 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1134136 () Bool)

(declare-fun res!756992 () Bool)

(assert (=> b!1134136 (=> (not res!756992) (not e!645562))))

(assert (=> b!1134136 (= res!756992 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36112 _keys!1208))))))

(declare-fun b!1134137 () Bool)

(declare-fun e!645574 () Bool)

(assert (=> b!1134137 (= e!645567 e!645574)))

(declare-fun res!756996 () Bool)

(assert (=> b!1134137 (=> res!756996 e!645574)))

(assert (=> b!1134137 (= res!756996 (not (= (select (arr!35575 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134137 e!645571))

(declare-fun c!110903 () Bool)

(assert (=> b!1134137 (= c!110903 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503849 () Unit!37090)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!436 (array!73861 array!73859 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37090)

(assert (=> b!1134137 (= lt!503849 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134138 () Bool)

(assert (=> b!1134138 (= e!645562 e!645560)))

(declare-fun res!757001 () Bool)

(assert (=> b!1134138 (=> (not res!757001) (not e!645560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73861 (_ BitVec 32)) Bool)

(assert (=> b!1134138 (= res!757001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503855 mask!1564))))

(assert (=> b!1134138 (= lt!503855 (array!73862 (store (arr!35575 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36112 _keys!1208)))))

(declare-fun b!1134139 () Bool)

(declare-fun res!756991 () Bool)

(assert (=> b!1134139 (=> (not res!756991) (not e!645562))))

(assert (=> b!1134139 (= res!756991 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24805))))

(declare-fun b!1134140 () Bool)

(declare-fun res!757003 () Bool)

(assert (=> b!1134140 (=> (not res!757003) (not e!645562))))

(assert (=> b!1134140 (= res!757003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134141 () Bool)

(declare-fun res!757005 () Bool)

(assert (=> b!1134141 (=> (not res!757005) (not e!645562))))

(assert (=> b!1134141 (= res!757005 (= (select (arr!35575 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44540 () Bool)

(assert (=> mapIsEmpty!44540 mapRes!44540))

(declare-fun b!1134142 () Bool)

(assert (=> b!1134142 (= e!645570 tp_is_empty!28477)))

(declare-fun b!1134143 () Bool)

(declare-fun res!756998 () Bool)

(assert (=> b!1134143 (=> (not res!756998) (not e!645562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134143 (= res!756998 (validMask!0 mask!1564))))

(declare-fun b!1134144 () Bool)

(assert (=> b!1134144 (= e!645574 e!645565)))

(declare-fun res!757000 () Bool)

(assert (=> b!1134144 (=> res!757000 e!645565)))

(assert (=> b!1134144 (= res!757000 (not (contains!6557 lt!503861 k0!934)))))

(assert (=> b!1134144 (= lt!503861 (getCurrentListMapNoExtraKeys!4537 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134145 () Bool)

(assert (=> b!1134145 (= e!645566 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134146 () Bool)

(declare-fun res!757004 () Bool)

(assert (=> b!1134146 (=> (not res!757004) (not e!645562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134146 (= res!757004 (validKeyInArray!0 k0!934))))

(declare-fun b!1134147 () Bool)

(assert (=> b!1134147 (= e!645560 (not e!645559))))

(declare-fun res!756999 () Bool)

(assert (=> b!1134147 (=> res!756999 e!645559)))

(assert (=> b!1134147 (= res!756999 (bvsgt from!1455 i!673))))

(assert (=> b!1134147 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503856 () Unit!37090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73861 (_ BitVec 64) (_ BitVec 32)) Unit!37090)

(assert (=> b!1134147 (= lt!503856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98578 res!757002) b!1134143))

(assert (= (and b!1134143 res!756998) b!1134126))

(assert (= (and b!1134126 res!756997) b!1134140))

(assert (= (and b!1134140 res!757003) b!1134139))

(assert (= (and b!1134139 res!756991) b!1134136))

(assert (= (and b!1134136 res!756992) b!1134146))

(assert (= (and b!1134146 res!757004) b!1134141))

(assert (= (and b!1134141 res!757005) b!1134138))

(assert (= (and b!1134138 res!757001) b!1134130))

(assert (= (and b!1134130 res!756993) b!1134147))

(assert (= (and b!1134147 (not res!756999)) b!1134135))

(assert (= (and b!1134135 (not res!756994)) b!1134137))

(assert (= (and b!1134137 c!110903) b!1134125))

(assert (= (and b!1134137 (not c!110903)) b!1134129))

(assert (= (or b!1134125 b!1134129) bm!48972))

(assert (= (or b!1134125 b!1134129) bm!48970))

(assert (= (and b!1134137 (not res!756996)) b!1134144))

(assert (= (and b!1134144 (not res!757000)) b!1134124))

(assert (= (and b!1134124 c!110906) b!1134123))

(assert (= (and b!1134124 (not c!110906)) b!1134128))

(assert (= (and b!1134128 c!110904) b!1134134))

(assert (= (and b!1134128 (not c!110904)) b!1134121))

(assert (= (and b!1134121 c!110905) b!1134133))

(assert (= (and b!1134121 (not c!110905)) b!1134120))

(assert (= (or b!1134134 b!1134133) bm!48973))

(assert (= (or b!1134134 b!1134133) bm!48968))

(assert (= (or b!1134134 b!1134133) bm!48969))

(assert (= (or b!1134123 bm!48969) bm!48971))

(assert (= (or b!1134123 bm!48973) bm!48975))

(assert (= (or b!1134123 bm!48968) bm!48974))

(assert (= (and b!1134124 c!110907) b!1134131))

(assert (= (and b!1134124 (not c!110907)) b!1134145))

(assert (= (and b!1134124 res!756995) b!1134132))

(assert (= (and b!1134122 condMapEmpty!44540) mapIsEmpty!44540))

(assert (= (and b!1134122 (not condMapEmpty!44540)) mapNonEmpty!44540))

(get-info :version)

(assert (= (and mapNonEmpty!44540 ((_ is ValueCellFull!13529) mapValue!44540)) b!1134127))

(assert (= (and b!1134122 ((_ is ValueCellFull!13529) mapDefault!44540)) b!1134142))

(assert (= start!98578 b!1134122))

(declare-fun b_lambda!19047 () Bool)

(assert (=> (not b_lambda!19047) (not b!1134135)))

(declare-fun t!35737 () Bool)

(declare-fun tb!8751 () Bool)

(assert (=> (and start!98578 (= defaultEntry!1004 defaultEntry!1004) t!35737) tb!8751))

(declare-fun result!18075 () Bool)

(assert (=> tb!8751 (= result!18075 tp_is_empty!28477)))

(assert (=> b!1134135 t!35737))

(declare-fun b_and!38747 () Bool)

(assert (= b_and!38745 (and (=> t!35737 result!18075) b_and!38747)))

(declare-fun m!1047655 () Bool)

(assert (=> b!1134132 m!1047655))

(declare-fun m!1047657 () Bool)

(assert (=> b!1134124 m!1047657))

(assert (=> b!1134131 m!1047655))

(declare-fun m!1047659 () Bool)

(assert (=> b!1134141 m!1047659))

(declare-fun m!1047661 () Bool)

(assert (=> mapNonEmpty!44540 m!1047661))

(declare-fun m!1047663 () Bool)

(assert (=> start!98578 m!1047663))

(declare-fun m!1047665 () Bool)

(assert (=> start!98578 m!1047665))

(declare-fun m!1047667 () Bool)

(assert (=> b!1134147 m!1047667))

(declare-fun m!1047669 () Bool)

(assert (=> b!1134147 m!1047669))

(declare-fun m!1047671 () Bool)

(assert (=> bm!48974 m!1047671))

(declare-fun m!1047673 () Bool)

(assert (=> b!1134139 m!1047673))

(declare-fun m!1047675 () Bool)

(assert (=> b!1134123 m!1047675))

(declare-fun m!1047677 () Bool)

(assert (=> b!1134123 m!1047677))

(declare-fun m!1047679 () Bool)

(assert (=> b!1134123 m!1047679))

(declare-fun m!1047681 () Bool)

(assert (=> bm!48970 m!1047681))

(declare-fun m!1047683 () Bool)

(assert (=> b!1134138 m!1047683))

(declare-fun m!1047685 () Bool)

(assert (=> b!1134138 m!1047685))

(declare-fun m!1047687 () Bool)

(assert (=> b!1134137 m!1047687))

(declare-fun m!1047689 () Bool)

(assert (=> b!1134137 m!1047689))

(declare-fun m!1047691 () Bool)

(assert (=> b!1134143 m!1047691))

(declare-fun m!1047693 () Bool)

(assert (=> b!1134140 m!1047693))

(declare-fun m!1047695 () Bool)

(assert (=> b!1134135 m!1047695))

(declare-fun m!1047697 () Bool)

(assert (=> b!1134135 m!1047697))

(declare-fun m!1047699 () Bool)

(assert (=> b!1134135 m!1047699))

(declare-fun m!1047701 () Bool)

(assert (=> b!1134135 m!1047701))

(declare-fun m!1047703 () Bool)

(assert (=> bm!48975 m!1047703))

(declare-fun m!1047705 () Bool)

(assert (=> bm!48971 m!1047705))

(declare-fun m!1047707 () Bool)

(assert (=> b!1134146 m!1047707))

(declare-fun m!1047709 () Bool)

(assert (=> bm!48972 m!1047709))

(declare-fun m!1047711 () Bool)

(assert (=> b!1134144 m!1047711))

(assert (=> b!1134144 m!1047681))

(declare-fun m!1047713 () Bool)

(assert (=> b!1134130 m!1047713))

(declare-fun m!1047715 () Bool)

(assert (=> b!1134125 m!1047715))

(check-sat (not b!1134147) (not b!1134135) (not bm!48971) (not b!1134125) tp_is_empty!28477 (not b!1134137) (not b!1134123) (not mapNonEmpty!44540) (not bm!48972) (not bm!48975) b_and!38747 (not b!1134124) (not b!1134140) (not b!1134132) (not b!1134143) (not bm!48974) (not b!1134138) (not b!1134130) (not b!1134139) (not b_lambda!19047) (not bm!48970) (not b!1134131) (not b!1134144) (not start!98578) (not b_next!23947) (not b!1134146))
(check-sat b_and!38747 (not b_next!23947))
