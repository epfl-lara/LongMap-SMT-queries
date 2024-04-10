; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100902 () Bool)

(assert start!100902)

(declare-fun b_free!25971 () Bool)

(declare-fun b_next!25971 () Bool)

(assert (=> start!100902 (= b_free!25971 (not b_next!25971))))

(declare-fun tp!90922 () Bool)

(declare-fun b_and!42983 () Bool)

(assert (=> start!100902 (= tp!90922 b_and!42983)))

(declare-fun mapNonEmpty!47875 () Bool)

(declare-fun mapRes!47875 () Bool)

(declare-fun tp!90923 () Bool)

(declare-fun e!686070 () Bool)

(assert (=> mapNonEmpty!47875 (= mapRes!47875 (and tp!90923 e!686070))))

(declare-fun mapKey!47875 () (_ BitVec 32))

(declare-datatypes ((V!46027 0))(
  ( (V!46028 (val!15394 Int)) )
))
(declare-datatypes ((ValueCell!14628 0))(
  ( (ValueCellFull!14628 (v!18042 V!46027)) (EmptyCell!14628) )
))
(declare-fun mapValue!47875 () ValueCell!14628)

(declare-datatypes ((array!78133 0))(
  ( (array!78134 (arr!37705 (Array (_ BitVec 32) ValueCell!14628)) (size!38241 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78133)

(declare-fun mapRest!47875 () (Array (_ BitVec 32) ValueCell!14628))

(assert (=> mapNonEmpty!47875 (= (arr!37705 _values!996) (store mapRest!47875 mapKey!47875 mapValue!47875))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!40048 0))(
  ( (Unit!40049) )
))
(declare-fun call!59052 () Unit!40048)

(declare-datatypes ((tuple2!19758 0))(
  ( (tuple2!19759 (_1!9890 (_ BitVec 64)) (_2!9890 V!46027)) )
))
(declare-datatypes ((List!26559 0))(
  ( (Nil!26556) (Cons!26555 (h!27764 tuple2!19758) (t!39510 List!26559)) )
))
(declare-datatypes ((ListLongMap!17727 0))(
  ( (ListLongMap!17728 (toList!8879 List!26559)) )
))
(declare-fun lt!548197 () ListLongMap!17727)

(declare-fun c!118809 () Bool)

(declare-fun bm!59047 () Bool)

(declare-fun minValue!944 () V!46027)

(declare-fun c!118812 () Bool)

(declare-fun zeroValue!944 () V!46027)

(declare-fun lt!548201 () ListLongMap!17727)

(declare-fun addStillContains!1027 (ListLongMap!17727 (_ BitVec 64) V!46027 (_ BitVec 64)) Unit!40048)

(assert (=> bm!59047 (= call!59052 (addStillContains!1027 (ite c!118809 lt!548197 lt!548201) (ite c!118809 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118812 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118809 minValue!944 (ite c!118812 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1208025 () Bool)

(declare-fun res!803066 () Bool)

(declare-fun e!686072 () Bool)

(assert (=> b!1208025 (=> (not res!803066) (not e!686072))))

(declare-datatypes ((array!78135 0))(
  ( (array!78136 (arr!37706 (Array (_ BitVec 32) (_ BitVec 64))) (size!38242 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78135)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208025 (= res!803066 (= (select (arr!37706 _keys!1208) i!673) k0!934))))

(declare-fun b!1208026 () Bool)

(declare-fun e!686071 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1208026 (= e!686071 (or (bvsge (size!38242 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38242 _keys!1208)) (bvslt from!1455 (size!38242 _keys!1208))))))

(declare-datatypes ((List!26560 0))(
  ( (Nil!26557) (Cons!26556 (h!27765 (_ BitVec 64)) (t!39511 List!26560)) )
))
(declare-fun arrayNoDuplicates!0 (array!78135 (_ BitVec 32) List!26560) Bool)

(assert (=> b!1208026 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26557)))

(declare-fun lt!548202 () Unit!40048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78135 (_ BitVec 32) (_ BitVec 32)) Unit!40048)

(assert (=> b!1208026 (= lt!548202 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686061 () Bool)

(assert (=> b!1208026 e!686061))

(declare-fun res!803061 () Bool)

(assert (=> b!1208026 (=> (not res!803061) (not e!686061))))

(declare-fun e!686064 () Bool)

(assert (=> b!1208026 (= res!803061 e!686064)))

(declare-fun c!118810 () Bool)

(assert (=> b!1208026 (= c!118810 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548206 () Unit!40048)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!581 (array!78135 array!78133 (_ BitVec 32) (_ BitVec 32) V!46027 V!46027 (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> b!1208026 (= lt!548206 (lemmaListMapContainsThenArrayContainsFrom!581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548200 () Unit!40048)

(declare-fun e!686059 () Unit!40048)

(assert (=> b!1208026 (= lt!548200 e!686059)))

(declare-fun lt!548203 () Bool)

(assert (=> b!1208026 (= c!118809 (and (not lt!548203) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208026 (= lt!548203 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1208027 () Bool)

(declare-fun e!686066 () Bool)

(declare-fun tp_is_empty!30675 () Bool)

(assert (=> b!1208027 (= e!686066 tp_is_empty!30675)))

(declare-fun bm!59048 () Bool)

(declare-fun call!59055 () Bool)

(declare-fun call!59056 () Bool)

(assert (=> bm!59048 (= call!59055 call!59056)))

(declare-fun b!1208028 () Bool)

(declare-fun e!686069 () Bool)

(declare-fun e!686058 () Bool)

(assert (=> b!1208028 (= e!686069 (not e!686058))))

(declare-fun res!803058 () Bool)

(assert (=> b!1208028 (=> res!803058 e!686058)))

(assert (=> b!1208028 (= res!803058 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208028 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548211 () Unit!40048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78135 (_ BitVec 64) (_ BitVec 32)) Unit!40048)

(assert (=> b!1208028 (= lt!548211 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1208029 () Bool)

(assert (=> b!1208029 (= e!686070 tp_is_empty!30675)))

(declare-fun b!1208030 () Bool)

(declare-fun e!686067 () Bool)

(assert (=> b!1208030 (= e!686067 e!686071)))

(declare-fun res!803069 () Bool)

(assert (=> b!1208030 (=> res!803069 e!686071)))

(declare-fun contains!6939 (ListLongMap!17727 (_ BitVec 64)) Bool)

(assert (=> b!1208030 (= res!803069 (not (contains!6939 lt!548201 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5313 (array!78135 array!78133 (_ BitVec 32) (_ BitVec 32) V!46027 V!46027 (_ BitVec 32) Int) ListLongMap!17727)

(assert (=> b!1208030 (= lt!548201 (getCurrentListMapNoExtraKeys!5313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208031 () Bool)

(declare-fun e!686057 () Unit!40048)

(assert (=> b!1208031 (= e!686059 e!686057)))

(assert (=> b!1208031 (= c!118812 (and (not lt!548203) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208032 () Bool)

(declare-fun e!686060 () Bool)

(assert (=> b!1208032 (= e!686058 e!686060)))

(declare-fun res!803063 () Bool)

(assert (=> b!1208032 (=> res!803063 e!686060)))

(assert (=> b!1208032 (= res!803063 (not (= from!1455 i!673)))))

(declare-fun lt!548198 () array!78135)

(declare-fun lt!548209 () array!78133)

(declare-fun lt!548210 () ListLongMap!17727)

(assert (=> b!1208032 (= lt!548210 (getCurrentListMapNoExtraKeys!5313 lt!548198 lt!548209 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3215 (Int (_ BitVec 64)) V!46027)

(assert (=> b!1208032 (= lt!548209 (array!78134 (store (arr!37705 _values!996) i!673 (ValueCellFull!14628 (dynLambda!3215 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38241 _values!996)))))

(declare-fun lt!548196 () ListLongMap!17727)

(assert (=> b!1208032 (= lt!548196 (getCurrentListMapNoExtraKeys!5313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1208033 () Bool)

(declare-fun e!686068 () Bool)

(assert (=> b!1208033 (= e!686068 (and e!686066 mapRes!47875))))

(declare-fun condMapEmpty!47875 () Bool)

(declare-fun mapDefault!47875 () ValueCell!14628)

(assert (=> b!1208033 (= condMapEmpty!47875 (= (arr!37705 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14628)) mapDefault!47875)))))

(declare-fun bm!59049 () Bool)

(declare-fun call!59051 () Unit!40048)

(assert (=> bm!59049 (= call!59051 call!59052)))

(declare-fun bm!59050 () Bool)

(declare-fun call!59057 () ListLongMap!17727)

(assert (=> bm!59050 (= call!59057 (getCurrentListMapNoExtraKeys!5313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!803065 () Bool)

(assert (=> start!100902 (=> (not res!803065) (not e!686072))))

(assert (=> start!100902 (= res!803065 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38242 _keys!1208))))))

(assert (=> start!100902 e!686072))

(assert (=> start!100902 tp_is_empty!30675))

(declare-fun array_inv!28720 (array!78135) Bool)

(assert (=> start!100902 (array_inv!28720 _keys!1208)))

(assert (=> start!100902 true))

(assert (=> start!100902 tp!90922))

(declare-fun array_inv!28721 (array!78133) Bool)

(assert (=> start!100902 (and (array_inv!28721 _values!996) e!686068)))

(declare-fun bm!59051 () Bool)

(declare-fun call!59053 () ListLongMap!17727)

(declare-fun call!59054 () ListLongMap!17727)

(assert (=> bm!59051 (= call!59053 call!59054)))

(declare-fun b!1208034 () Bool)

(declare-fun call!59050 () ListLongMap!17727)

(declare-fun e!686062 () Bool)

(declare-fun -!1834 (ListLongMap!17727 (_ BitVec 64)) ListLongMap!17727)

(assert (=> b!1208034 (= e!686062 (= call!59050 (-!1834 call!59057 k0!934)))))

(declare-fun bm!59052 () Bool)

(assert (=> bm!59052 (= call!59056 (contains!6939 (ite c!118809 lt!548197 call!59053) k0!934))))

(declare-fun b!1208035 () Bool)

(assert (=> b!1208035 (= e!686062 (= call!59050 call!59057))))

(declare-fun b!1208036 () Bool)

(assert (=> b!1208036 (= e!686060 e!686067)))

(declare-fun res!803060 () Bool)

(assert (=> b!1208036 (=> res!803060 e!686067)))

(assert (=> b!1208036 (= res!803060 (not (= (select (arr!37706 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1208036 e!686062))

(declare-fun c!118811 () Bool)

(assert (=> b!1208036 (= c!118811 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548199 () Unit!40048)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 (array!78135 array!78133 (_ BitVec 32) (_ BitVec 32) V!46027 V!46027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> b!1208036 (= lt!548199 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208037 () Bool)

(declare-fun res!803062 () Bool)

(assert (=> b!1208037 (=> (not res!803062) (not e!686072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208037 (= res!803062 (validMask!0 mask!1564))))

(declare-fun b!1208038 () Bool)

(declare-fun res!803064 () Bool)

(assert (=> b!1208038 (=> (not res!803064) (not e!686072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78135 (_ BitVec 32)) Bool)

(assert (=> b!1208038 (= res!803064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208039 () Bool)

(assert (=> b!1208039 call!59055))

(declare-fun lt!548207 () Unit!40048)

(assert (=> b!1208039 (= lt!548207 call!59051)))

(assert (=> b!1208039 (= e!686057 lt!548207)))

(declare-fun b!1208040 () Bool)

(declare-fun res!803070 () Bool)

(assert (=> b!1208040 (=> (not res!803070) (not e!686072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208040 (= res!803070 (validKeyInArray!0 k0!934))))

(declare-fun bm!59053 () Bool)

(assert (=> bm!59053 (= call!59050 (getCurrentListMapNoExtraKeys!5313 lt!548198 lt!548209 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208041 () Bool)

(declare-fun e!686065 () Unit!40048)

(declare-fun lt!548208 () Unit!40048)

(assert (=> b!1208041 (= e!686065 lt!548208)))

(assert (=> b!1208041 (= lt!548208 call!59051)))

(assert (=> b!1208041 call!59055))

(declare-fun bm!59054 () Bool)

(declare-fun +!3998 (ListLongMap!17727 tuple2!19758) ListLongMap!17727)

(assert (=> bm!59054 (= call!59054 (+!3998 (ite c!118809 lt!548197 lt!548201) (ite c!118809 (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118812 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208042 () Bool)

(assert (=> b!1208042 (= e!686064 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548203) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1208043 () Bool)

(declare-fun res!803071 () Bool)

(assert (=> b!1208043 (=> (not res!803071) (not e!686072))))

(assert (=> b!1208043 (= res!803071 (and (= (size!38241 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38242 _keys!1208) (size!38241 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208044 () Bool)

(assert (=> b!1208044 (= e!686061 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208045 () Bool)

(declare-fun res!803068 () Bool)

(assert (=> b!1208045 (=> (not res!803068) (not e!686072))))

(assert (=> b!1208045 (= res!803068 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26557))))

(declare-fun b!1208046 () Bool)

(declare-fun res!803072 () Bool)

(assert (=> b!1208046 (=> (not res!803072) (not e!686069))))

(assert (=> b!1208046 (= res!803072 (arrayNoDuplicates!0 lt!548198 #b00000000000000000000000000000000 Nil!26557))))

(declare-fun b!1208047 () Bool)

(declare-fun res!803059 () Bool)

(assert (=> b!1208047 (=> (not res!803059) (not e!686072))))

(assert (=> b!1208047 (= res!803059 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38242 _keys!1208))))))

(declare-fun b!1208048 () Bool)

(declare-fun Unit!40050 () Unit!40048)

(assert (=> b!1208048 (= e!686065 Unit!40050)))

(declare-fun b!1208049 () Bool)

(declare-fun c!118808 () Bool)

(assert (=> b!1208049 (= c!118808 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548203))))

(assert (=> b!1208049 (= e!686057 e!686065)))

(declare-fun b!1208050 () Bool)

(declare-fun lt!548204 () Unit!40048)

(assert (=> b!1208050 (= e!686059 lt!548204)))

(declare-fun lt!548205 () Unit!40048)

(assert (=> b!1208050 (= lt!548205 (addStillContains!1027 lt!548201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1208050 (= lt!548197 (+!3998 lt!548201 (tuple2!19759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1208050 call!59056))

(assert (=> b!1208050 (= lt!548204 call!59052)))

(assert (=> b!1208050 (contains!6939 call!59054 k0!934)))

(declare-fun b!1208051 () Bool)

(assert (=> b!1208051 (= e!686064 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!47875 () Bool)

(assert (=> mapIsEmpty!47875 mapRes!47875))

(declare-fun b!1208052 () Bool)

(assert (=> b!1208052 (= e!686072 e!686069)))

(declare-fun res!803067 () Bool)

(assert (=> b!1208052 (=> (not res!803067) (not e!686069))))

(assert (=> b!1208052 (= res!803067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548198 mask!1564))))

(assert (=> b!1208052 (= lt!548198 (array!78136 (store (arr!37706 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38242 _keys!1208)))))

(assert (= (and start!100902 res!803065) b!1208037))

(assert (= (and b!1208037 res!803062) b!1208043))

(assert (= (and b!1208043 res!803071) b!1208038))

(assert (= (and b!1208038 res!803064) b!1208045))

(assert (= (and b!1208045 res!803068) b!1208047))

(assert (= (and b!1208047 res!803059) b!1208040))

(assert (= (and b!1208040 res!803070) b!1208025))

(assert (= (and b!1208025 res!803066) b!1208052))

(assert (= (and b!1208052 res!803067) b!1208046))

(assert (= (and b!1208046 res!803072) b!1208028))

(assert (= (and b!1208028 (not res!803058)) b!1208032))

(assert (= (and b!1208032 (not res!803063)) b!1208036))

(assert (= (and b!1208036 c!118811) b!1208034))

(assert (= (and b!1208036 (not c!118811)) b!1208035))

(assert (= (or b!1208034 b!1208035) bm!59053))

(assert (= (or b!1208034 b!1208035) bm!59050))

(assert (= (and b!1208036 (not res!803060)) b!1208030))

(assert (= (and b!1208030 (not res!803069)) b!1208026))

(assert (= (and b!1208026 c!118809) b!1208050))

(assert (= (and b!1208026 (not c!118809)) b!1208031))

(assert (= (and b!1208031 c!118812) b!1208039))

(assert (= (and b!1208031 (not c!118812)) b!1208049))

(assert (= (and b!1208049 c!118808) b!1208041))

(assert (= (and b!1208049 (not c!118808)) b!1208048))

(assert (= (or b!1208039 b!1208041) bm!59049))

(assert (= (or b!1208039 b!1208041) bm!59051))

(assert (= (or b!1208039 b!1208041) bm!59048))

(assert (= (or b!1208050 bm!59048) bm!59052))

(assert (= (or b!1208050 bm!59049) bm!59047))

(assert (= (or b!1208050 bm!59051) bm!59054))

(assert (= (and b!1208026 c!118810) b!1208051))

(assert (= (and b!1208026 (not c!118810)) b!1208042))

(assert (= (and b!1208026 res!803061) b!1208044))

(assert (= (and b!1208033 condMapEmpty!47875) mapIsEmpty!47875))

(assert (= (and b!1208033 (not condMapEmpty!47875)) mapNonEmpty!47875))

(get-info :version)

(assert (= (and mapNonEmpty!47875 ((_ is ValueCellFull!14628) mapValue!47875)) b!1208029))

(assert (= (and b!1208033 ((_ is ValueCellFull!14628) mapDefault!47875)) b!1208027))

(assert (= start!100902 b!1208033))

(declare-fun b_lambda!21487 () Bool)

(assert (=> (not b_lambda!21487) (not b!1208032)))

(declare-fun t!39509 () Bool)

(declare-fun tb!10771 () Bool)

(assert (=> (and start!100902 (= defaultEntry!1004 defaultEntry!1004) t!39509) tb!10771))

(declare-fun result!22131 () Bool)

(assert (=> tb!10771 (= result!22131 tp_is_empty!30675)))

(assert (=> b!1208032 t!39509))

(declare-fun b_and!42985 () Bool)

(assert (= b_and!42983 (and (=> t!39509 result!22131) b_and!42985)))

(declare-fun m!1113871 () Bool)

(assert (=> mapNonEmpty!47875 m!1113871))

(declare-fun m!1113873 () Bool)

(assert (=> bm!59054 m!1113873))

(declare-fun m!1113875 () Bool)

(assert (=> b!1208030 m!1113875))

(declare-fun m!1113877 () Bool)

(assert (=> b!1208030 m!1113877))

(declare-fun m!1113879 () Bool)

(assert (=> b!1208046 m!1113879))

(declare-fun m!1113881 () Bool)

(assert (=> b!1208045 m!1113881))

(declare-fun m!1113883 () Bool)

(assert (=> start!100902 m!1113883))

(declare-fun m!1113885 () Bool)

(assert (=> start!100902 m!1113885))

(declare-fun m!1113887 () Bool)

(assert (=> b!1208036 m!1113887))

(declare-fun m!1113889 () Bool)

(assert (=> b!1208036 m!1113889))

(declare-fun m!1113891 () Bool)

(assert (=> b!1208040 m!1113891))

(declare-fun m!1113893 () Bool)

(assert (=> b!1208052 m!1113893))

(declare-fun m!1113895 () Bool)

(assert (=> b!1208052 m!1113895))

(declare-fun m!1113897 () Bool)

(assert (=> b!1208044 m!1113897))

(declare-fun m!1113899 () Bool)

(assert (=> b!1208025 m!1113899))

(declare-fun m!1113901 () Bool)

(assert (=> b!1208037 m!1113901))

(declare-fun m!1113903 () Bool)

(assert (=> bm!59047 m!1113903))

(declare-fun m!1113905 () Bool)

(assert (=> b!1208032 m!1113905))

(declare-fun m!1113907 () Bool)

(assert (=> b!1208032 m!1113907))

(declare-fun m!1113909 () Bool)

(assert (=> b!1208032 m!1113909))

(declare-fun m!1113911 () Bool)

(assert (=> b!1208032 m!1113911))

(assert (=> bm!59050 m!1113877))

(declare-fun m!1113913 () Bool)

(assert (=> b!1208026 m!1113913))

(declare-fun m!1113915 () Bool)

(assert (=> b!1208026 m!1113915))

(declare-fun m!1113917 () Bool)

(assert (=> b!1208026 m!1113917))

(declare-fun m!1113919 () Bool)

(assert (=> bm!59053 m!1113919))

(declare-fun m!1113921 () Bool)

(assert (=> b!1208034 m!1113921))

(declare-fun m!1113923 () Bool)

(assert (=> b!1208028 m!1113923))

(declare-fun m!1113925 () Bool)

(assert (=> b!1208028 m!1113925))

(declare-fun m!1113927 () Bool)

(assert (=> b!1208050 m!1113927))

(declare-fun m!1113929 () Bool)

(assert (=> b!1208050 m!1113929))

(declare-fun m!1113931 () Bool)

(assert (=> b!1208050 m!1113931))

(declare-fun m!1113933 () Bool)

(assert (=> b!1208038 m!1113933))

(assert (=> b!1208051 m!1113897))

(declare-fun m!1113935 () Bool)

(assert (=> bm!59052 m!1113935))

(check-sat (not b!1208040) (not mapNonEmpty!47875) (not b!1208034) (not b!1208051) (not b!1208030) (not b!1208026) (not b!1208032) (not b_lambda!21487) (not bm!59053) (not b!1208044) (not b!1208028) (not bm!59052) (not b!1208052) (not b!1208038) (not b!1208046) (not b!1208036) (not b!1208050) (not bm!59047) tp_is_empty!30675 (not bm!59050) (not b_next!25971) (not start!100902) b_and!42985 (not bm!59054) (not b!1208037) (not b!1208045))
(check-sat b_and!42985 (not b_next!25971))
