; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100990 () Bool)

(assert start!100990)

(declare-fun b_free!25989 () Bool)

(declare-fun b_next!25989 () Bool)

(assert (=> start!100990 (= b_free!25989 (not b_next!25989))))

(declare-fun tp!90983 () Bool)

(declare-fun b_and!43059 () Bool)

(assert (=> start!100990 (= tp!90983 b_and!43059)))

(declare-datatypes ((array!78171 0))(
  ( (array!78172 (arr!37722 (Array (_ BitVec 32) (_ BitVec 64))) (size!38258 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78171)

(declare-fun e!686784 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1209218 () Bool)

(declare-fun arrayContainsKey!0 (array!78171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209218 (= e!686784 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209219 () Bool)

(declare-fun res!803686 () Bool)

(declare-fun e!686785 () Bool)

(assert (=> b!1209219 (=> (not res!803686) (not e!686785))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209219 (= res!803686 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38258 _keys!1208))))))

(declare-fun b!1209220 () Bool)

(declare-fun res!803690 () Bool)

(assert (=> b!1209220 (=> (not res!803690) (not e!686785))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78171 (_ BitVec 32)) Bool)

(assert (=> b!1209220 (= res!803690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209221 () Bool)

(declare-datatypes ((Unit!40077 0))(
  ( (Unit!40078) )
))
(declare-fun e!686779 () Unit!40077)

(declare-fun e!686782 () Unit!40077)

(assert (=> b!1209221 (= e!686779 e!686782)))

(declare-fun c!119035 () Bool)

(declare-fun lt!548877 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1209221 (= c!119035 (and (not lt!548877) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!47908 () Bool)

(declare-fun mapRes!47908 () Bool)

(assert (=> mapIsEmpty!47908 mapRes!47908))

(declare-fun b!1209222 () Bool)

(declare-fun c!119037 () Bool)

(assert (=> b!1209222 (= c!119037 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548877))))

(declare-fun e!686770 () Unit!40077)

(assert (=> b!1209222 (= e!686782 e!686770)))

(declare-fun b!1209223 () Bool)

(declare-fun lt!548863 () Unit!40077)

(assert (=> b!1209223 (= e!686770 lt!548863)))

(declare-fun call!59310 () Unit!40077)

(assert (=> b!1209223 (= lt!548863 call!59310)))

(declare-fun call!59316 () Bool)

(assert (=> b!1209223 call!59316))

(declare-fun b!1209224 () Bool)

(declare-fun e!686772 () Bool)

(declare-fun e!686776 () Bool)

(assert (=> b!1209224 (= e!686772 e!686776)))

(declare-fun res!803684 () Bool)

(assert (=> b!1209224 (=> res!803684 e!686776)))

(declare-datatypes ((V!46051 0))(
  ( (V!46052 (val!15403 Int)) )
))
(declare-datatypes ((tuple2!19772 0))(
  ( (tuple2!19773 (_1!9897 (_ BitVec 64)) (_2!9897 V!46051)) )
))
(declare-datatypes ((List!26573 0))(
  ( (Nil!26570) (Cons!26569 (h!27778 tuple2!19772) (t!39542 List!26573)) )
))
(declare-datatypes ((ListLongMap!17741 0))(
  ( (ListLongMap!17742 (toList!8886 List!26573)) )
))
(declare-fun lt!548869 () ListLongMap!17741)

(declare-fun contains!6952 (ListLongMap!17741 (_ BitVec 64)) Bool)

(assert (=> b!1209224 (= res!803684 (not (contains!6952 lt!548869 k0!934)))))

(declare-fun zeroValue!944 () V!46051)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14637 0))(
  ( (ValueCellFull!14637 (v!18054 V!46051)) (EmptyCell!14637) )
))
(declare-datatypes ((array!78173 0))(
  ( (array!78174 (arr!37723 (Array (_ BitVec 32) ValueCell!14637)) (size!38259 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78173)

(declare-fun minValue!944 () V!46051)

(declare-fun getCurrentListMapNoExtraKeys!5320 (array!78171 array!78173 (_ BitVec 32) (_ BitVec 32) V!46051 V!46051 (_ BitVec 32) Int) ListLongMap!17741)

(assert (=> b!1209224 (= lt!548869 (getCurrentListMapNoExtraKeys!5320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209225 () Bool)

(declare-fun res!803696 () Bool)

(declare-fun e!686786 () Bool)

(assert (=> b!1209225 (=> res!803696 e!686786)))

(declare-datatypes ((List!26574 0))(
  ( (Nil!26571) (Cons!26570 (h!27779 (_ BitVec 64)) (t!39543 List!26574)) )
))
(declare-fun noDuplicate!1627 (List!26574) Bool)

(assert (=> b!1209225 (= res!803696 (not (noDuplicate!1627 Nil!26571)))))

(declare-fun b!1209226 () Bool)

(declare-fun e!686773 () Bool)

(declare-fun tp_is_empty!30693 () Bool)

(assert (=> b!1209226 (= e!686773 tp_is_empty!30693)))

(declare-fun bm!59306 () Bool)

(declare-fun call!59311 () ListLongMap!17741)

(declare-fun call!59313 () ListLongMap!17741)

(assert (=> bm!59306 (= call!59311 call!59313)))

(declare-fun b!1209227 () Bool)

(assert (=> b!1209227 (= e!686776 e!686786)))

(declare-fun res!803681 () Bool)

(assert (=> b!1209227 (=> res!803681 e!686786)))

(assert (=> b!1209227 (= res!803681 (or (bvsge (size!38258 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38258 _keys!1208)) (bvsge from!1455 (size!38258 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78171 (_ BitVec 32) List!26574) Bool)

(assert (=> b!1209227 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26571)))

(declare-fun lt!548875 () Unit!40077)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78171 (_ BitVec 32) (_ BitVec 32)) Unit!40077)

(assert (=> b!1209227 (= lt!548875 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209227 e!686784))

(declare-fun res!803682 () Bool)

(assert (=> b!1209227 (=> (not res!803682) (not e!686784))))

(declare-fun e!686778 () Bool)

(assert (=> b!1209227 (= res!803682 e!686778)))

(declare-fun c!119039 () Bool)

(assert (=> b!1209227 (= c!119039 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548872 () Unit!40077)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!587 (array!78171 array!78173 (_ BitVec 32) (_ BitVec 32) V!46051 V!46051 (_ BitVec 64) (_ BitVec 32) Int) Unit!40077)

(assert (=> b!1209227 (= lt!548872 (lemmaListMapContainsThenArrayContainsFrom!587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548878 () Unit!40077)

(assert (=> b!1209227 (= lt!548878 e!686779)))

(declare-fun c!119038 () Bool)

(assert (=> b!1209227 (= c!119038 (and (not lt!548877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209227 (= lt!548877 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!59307 () Bool)

(declare-fun +!4005 (ListLongMap!17741 tuple2!19772) ListLongMap!17741)

(assert (=> bm!59307 (= call!59313 (+!4005 lt!548869 (ite (or c!119038 c!119035) (tuple2!19773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1209228 () Bool)

(assert (=> b!1209228 (= e!686778 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1209229 () Bool)

(declare-fun res!803692 () Bool)

(assert (=> b!1209229 (=> res!803692 e!686786)))

(declare-fun contains!6953 (List!26574 (_ BitVec 64)) Bool)

(assert (=> b!1209229 (= res!803692 (contains!6953 Nil!26571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209230 () Bool)

(declare-fun e!686775 () Bool)

(declare-fun call!59315 () ListLongMap!17741)

(declare-fun call!59314 () ListLongMap!17741)

(assert (=> b!1209230 (= e!686775 (= call!59315 call!59314))))

(declare-fun bm!59308 () Bool)

(assert (=> bm!59308 (= call!59314 (getCurrentListMapNoExtraKeys!5320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!59312 () Unit!40077)

(declare-fun lt!548870 () ListLongMap!17741)

(declare-fun bm!59309 () Bool)

(declare-fun addStillContains!1034 (ListLongMap!17741 (_ BitVec 64) V!46051 (_ BitVec 64)) Unit!40077)

(assert (=> bm!59309 (= call!59312 (addStillContains!1034 (ite c!119038 lt!548870 lt!548869) (ite c!119038 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119035 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119038 minValue!944 (ite c!119035 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209231 () Bool)

(assert (=> b!1209231 (= e!686778 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209232 () Bool)

(declare-fun e!686781 () Bool)

(assert (=> b!1209232 (= e!686781 tp_is_empty!30693)))

(declare-fun bm!59310 () Bool)

(declare-fun call!59309 () Bool)

(assert (=> bm!59310 (= call!59309 (contains!6952 (ite c!119038 lt!548870 call!59311) k0!934))))

(declare-fun mapNonEmpty!47908 () Bool)

(declare-fun tp!90982 () Bool)

(assert (=> mapNonEmpty!47908 (= mapRes!47908 (and tp!90982 e!686773))))

(declare-fun mapValue!47908 () ValueCell!14637)

(declare-fun mapRest!47908 () (Array (_ BitVec 32) ValueCell!14637))

(declare-fun mapKey!47908 () (_ BitVec 32))

(assert (=> mapNonEmpty!47908 (= (arr!37723 _values!996) (store mapRest!47908 mapKey!47908 mapValue!47908))))

(declare-fun b!1209233 () Bool)

(declare-fun e!686780 () Bool)

(declare-fun e!686783 () Bool)

(assert (=> b!1209233 (= e!686780 (not e!686783))))

(declare-fun res!803693 () Bool)

(assert (=> b!1209233 (=> res!803693 e!686783)))

(assert (=> b!1209233 (= res!803693 (bvsgt from!1455 i!673))))

(assert (=> b!1209233 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548871 () Unit!40077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78171 (_ BitVec 64) (_ BitVec 32)) Unit!40077)

(assert (=> b!1209233 (= lt!548871 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209234 () Bool)

(declare-fun Unit!40079 () Unit!40077)

(assert (=> b!1209234 (= e!686770 Unit!40079)))

(declare-fun b!1209235 () Bool)

(declare-fun e!686771 () Bool)

(assert (=> b!1209235 (= e!686771 e!686772)))

(declare-fun res!803688 () Bool)

(assert (=> b!1209235 (=> res!803688 e!686772)))

(assert (=> b!1209235 (= res!803688 (not (= (select (arr!37722 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1209235 e!686775))

(declare-fun c!119036 () Bool)

(assert (=> b!1209235 (= c!119036 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548874 () Unit!40077)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1048 (array!78171 array!78173 (_ BitVec 32) (_ BitVec 32) V!46051 V!46051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40077)

(assert (=> b!1209235 (= lt!548874 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1048 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209236 () Bool)

(assert (=> b!1209236 (= e!686785 e!686780)))

(declare-fun res!803687 () Bool)

(assert (=> b!1209236 (=> (not res!803687) (not e!686780))))

(declare-fun lt!548867 () array!78171)

(assert (=> b!1209236 (= res!803687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548867 mask!1564))))

(assert (=> b!1209236 (= lt!548867 (array!78172 (store (arr!37722 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38258 _keys!1208)))))

(declare-fun b!1209237 () Bool)

(declare-fun res!803689 () Bool)

(assert (=> b!1209237 (=> (not res!803689) (not e!686785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209237 (= res!803689 (validKeyInArray!0 k0!934))))

(declare-fun b!1209238 () Bool)

(assert (=> b!1209238 (= e!686783 e!686771)))

(declare-fun res!803685 () Bool)

(assert (=> b!1209238 (=> res!803685 e!686771)))

(assert (=> b!1209238 (= res!803685 (not (= from!1455 i!673)))))

(declare-fun lt!548864 () array!78173)

(declare-fun lt!548862 () ListLongMap!17741)

(assert (=> b!1209238 (= lt!548862 (getCurrentListMapNoExtraKeys!5320 lt!548867 lt!548864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3220 (Int (_ BitVec 64)) V!46051)

(assert (=> b!1209238 (= lt!548864 (array!78174 (store (arr!37723 _values!996) i!673 (ValueCellFull!14637 (dynLambda!3220 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38259 _values!996)))))

(declare-fun lt!548865 () ListLongMap!17741)

(assert (=> b!1209238 (= lt!548865 (getCurrentListMapNoExtraKeys!5320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59311 () Bool)

(assert (=> bm!59311 (= call!59315 (getCurrentListMapNoExtraKeys!5320 lt!548867 lt!548864 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209239 () Bool)

(declare-fun res!803680 () Bool)

(assert (=> b!1209239 (=> (not res!803680) (not e!686785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209239 (= res!803680 (validMask!0 mask!1564))))

(declare-fun res!803697 () Bool)

(assert (=> start!100990 (=> (not res!803697) (not e!686785))))

(assert (=> start!100990 (= res!803697 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38258 _keys!1208))))))

(assert (=> start!100990 e!686785))

(assert (=> start!100990 tp_is_empty!30693))

(declare-fun array_inv!28734 (array!78171) Bool)

(assert (=> start!100990 (array_inv!28734 _keys!1208)))

(assert (=> start!100990 true))

(assert (=> start!100990 tp!90983))

(declare-fun e!686774 () Bool)

(declare-fun array_inv!28735 (array!78173) Bool)

(assert (=> start!100990 (and (array_inv!28735 _values!996) e!686774)))

(declare-fun b!1209240 () Bool)

(declare-fun res!803683 () Bool)

(assert (=> b!1209240 (=> (not res!803683) (not e!686785))))

(assert (=> b!1209240 (= res!803683 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26571))))

(declare-fun b!1209241 () Bool)

(assert (=> b!1209241 call!59316))

(declare-fun lt!548876 () Unit!40077)

(assert (=> b!1209241 (= lt!548876 call!59310)))

(assert (=> b!1209241 (= e!686782 lt!548876)))

(declare-fun b!1209242 () Bool)

(declare-fun res!803695 () Bool)

(assert (=> b!1209242 (=> (not res!803695) (not e!686780))))

(assert (=> b!1209242 (= res!803695 (arrayNoDuplicates!0 lt!548867 #b00000000000000000000000000000000 Nil!26571))))

(declare-fun bm!59312 () Bool)

(assert (=> bm!59312 (= call!59310 call!59312)))

(declare-fun b!1209243 () Bool)

(declare-fun -!1840 (ListLongMap!17741 (_ BitVec 64)) ListLongMap!17741)

(assert (=> b!1209243 (= e!686775 (= call!59315 (-!1840 call!59314 k0!934)))))

(declare-fun b!1209244 () Bool)

(declare-fun res!803694 () Bool)

(assert (=> b!1209244 (=> (not res!803694) (not e!686785))))

(assert (=> b!1209244 (= res!803694 (and (= (size!38259 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38258 _keys!1208) (size!38259 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209245 () Bool)

(declare-fun res!803691 () Bool)

(assert (=> b!1209245 (=> (not res!803691) (not e!686785))))

(assert (=> b!1209245 (= res!803691 (= (select (arr!37722 _keys!1208) i!673) k0!934))))

(declare-fun b!1209246 () Bool)

(declare-fun lt!548873 () Unit!40077)

(assert (=> b!1209246 (= e!686779 lt!548873)))

(declare-fun lt!548868 () Unit!40077)

(assert (=> b!1209246 (= lt!548868 (addStillContains!1034 lt!548869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1209246 (= lt!548870 call!59313)))

(assert (=> b!1209246 call!59309))

(assert (=> b!1209246 (= lt!548873 call!59312)))

(assert (=> b!1209246 (contains!6952 (+!4005 lt!548870 (tuple2!19773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!59313 () Bool)

(assert (=> bm!59313 (= call!59316 call!59309)))

(declare-fun b!1209247 () Bool)

(assert (=> b!1209247 (= e!686774 (and e!686781 mapRes!47908))))

(declare-fun condMapEmpty!47908 () Bool)

(declare-fun mapDefault!47908 () ValueCell!14637)

(assert (=> b!1209247 (= condMapEmpty!47908 (= (arr!37723 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14637)) mapDefault!47908)))))

(declare-fun b!1209248 () Bool)

(assert (=> b!1209248 (= e!686786 true)))

(declare-fun lt!548866 () Bool)

(assert (=> b!1209248 (= lt!548866 (contains!6953 Nil!26571 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!100990 res!803697) b!1209239))

(assert (= (and b!1209239 res!803680) b!1209244))

(assert (= (and b!1209244 res!803694) b!1209220))

(assert (= (and b!1209220 res!803690) b!1209240))

(assert (= (and b!1209240 res!803683) b!1209219))

(assert (= (and b!1209219 res!803686) b!1209237))

(assert (= (and b!1209237 res!803689) b!1209245))

(assert (= (and b!1209245 res!803691) b!1209236))

(assert (= (and b!1209236 res!803687) b!1209242))

(assert (= (and b!1209242 res!803695) b!1209233))

(assert (= (and b!1209233 (not res!803693)) b!1209238))

(assert (= (and b!1209238 (not res!803685)) b!1209235))

(assert (= (and b!1209235 c!119036) b!1209243))

(assert (= (and b!1209235 (not c!119036)) b!1209230))

(assert (= (or b!1209243 b!1209230) bm!59311))

(assert (= (or b!1209243 b!1209230) bm!59308))

(assert (= (and b!1209235 (not res!803688)) b!1209224))

(assert (= (and b!1209224 (not res!803684)) b!1209227))

(assert (= (and b!1209227 c!119038) b!1209246))

(assert (= (and b!1209227 (not c!119038)) b!1209221))

(assert (= (and b!1209221 c!119035) b!1209241))

(assert (= (and b!1209221 (not c!119035)) b!1209222))

(assert (= (and b!1209222 c!119037) b!1209223))

(assert (= (and b!1209222 (not c!119037)) b!1209234))

(assert (= (or b!1209241 b!1209223) bm!59312))

(assert (= (or b!1209241 b!1209223) bm!59306))

(assert (= (or b!1209241 b!1209223) bm!59313))

(assert (= (or b!1209246 bm!59313) bm!59310))

(assert (= (or b!1209246 bm!59312) bm!59309))

(assert (= (or b!1209246 bm!59306) bm!59307))

(assert (= (and b!1209227 c!119039) b!1209231))

(assert (= (and b!1209227 (not c!119039)) b!1209228))

(assert (= (and b!1209227 res!803682) b!1209218))

(assert (= (and b!1209227 (not res!803681)) b!1209225))

(assert (= (and b!1209225 (not res!803696)) b!1209229))

(assert (= (and b!1209229 (not res!803692)) b!1209248))

(assert (= (and b!1209247 condMapEmpty!47908) mapIsEmpty!47908))

(assert (= (and b!1209247 (not condMapEmpty!47908)) mapNonEmpty!47908))

(get-info :version)

(assert (= (and mapNonEmpty!47908 ((_ is ValueCellFull!14637) mapValue!47908)) b!1209226))

(assert (= (and b!1209247 ((_ is ValueCellFull!14637) mapDefault!47908)) b!1209232))

(assert (= start!100990 b!1209247))

(declare-fun b_lambda!21589 () Bool)

(assert (=> (not b_lambda!21589) (not b!1209238)))

(declare-fun t!39541 () Bool)

(declare-fun tb!10789 () Bool)

(assert (=> (and start!100990 (= defaultEntry!1004 defaultEntry!1004) t!39541) tb!10789))

(declare-fun result!22171 () Bool)

(assert (=> tb!10789 (= result!22171 tp_is_empty!30693)))

(assert (=> b!1209238 t!39541))

(declare-fun b_and!43061 () Bool)

(assert (= b_and!43059 (and (=> t!39541 result!22171) b_and!43061)))

(declare-fun m!1114999 () Bool)

(assert (=> b!1209224 m!1114999))

(declare-fun m!1115001 () Bool)

(assert (=> b!1209224 m!1115001))

(declare-fun m!1115003 () Bool)

(assert (=> b!1209243 m!1115003))

(declare-fun m!1115005 () Bool)

(assert (=> b!1209238 m!1115005))

(declare-fun m!1115007 () Bool)

(assert (=> b!1209238 m!1115007))

(declare-fun m!1115009 () Bool)

(assert (=> b!1209238 m!1115009))

(declare-fun m!1115011 () Bool)

(assert (=> b!1209238 m!1115011))

(declare-fun m!1115013 () Bool)

(assert (=> start!100990 m!1115013))

(declare-fun m!1115015 () Bool)

(assert (=> start!100990 m!1115015))

(declare-fun m!1115017 () Bool)

(assert (=> b!1209235 m!1115017))

(declare-fun m!1115019 () Bool)

(assert (=> b!1209235 m!1115019))

(declare-fun m!1115021 () Bool)

(assert (=> b!1209233 m!1115021))

(declare-fun m!1115023 () Bool)

(assert (=> b!1209233 m!1115023))

(declare-fun m!1115025 () Bool)

(assert (=> b!1209246 m!1115025))

(declare-fun m!1115027 () Bool)

(assert (=> b!1209246 m!1115027))

(assert (=> b!1209246 m!1115027))

(declare-fun m!1115029 () Bool)

(assert (=> b!1209246 m!1115029))

(declare-fun m!1115031 () Bool)

(assert (=> b!1209248 m!1115031))

(declare-fun m!1115033 () Bool)

(assert (=> b!1209218 m!1115033))

(declare-fun m!1115035 () Bool)

(assert (=> b!1209237 m!1115035))

(assert (=> b!1209231 m!1115033))

(declare-fun m!1115037 () Bool)

(assert (=> b!1209240 m!1115037))

(declare-fun m!1115039 () Bool)

(assert (=> b!1209229 m!1115039))

(declare-fun m!1115041 () Bool)

(assert (=> bm!59310 m!1115041))

(declare-fun m!1115043 () Bool)

(assert (=> bm!59311 m!1115043))

(declare-fun m!1115045 () Bool)

(assert (=> b!1209239 m!1115045))

(declare-fun m!1115047 () Bool)

(assert (=> b!1209245 m!1115047))

(declare-fun m!1115049 () Bool)

(assert (=> b!1209220 m!1115049))

(declare-fun m!1115051 () Bool)

(assert (=> bm!59309 m!1115051))

(declare-fun m!1115053 () Bool)

(assert (=> b!1209236 m!1115053))

(declare-fun m!1115055 () Bool)

(assert (=> b!1209236 m!1115055))

(declare-fun m!1115057 () Bool)

(assert (=> b!1209227 m!1115057))

(declare-fun m!1115059 () Bool)

(assert (=> b!1209227 m!1115059))

(declare-fun m!1115061 () Bool)

(assert (=> b!1209227 m!1115061))

(assert (=> bm!59308 m!1115001))

(declare-fun m!1115063 () Bool)

(assert (=> b!1209242 m!1115063))

(declare-fun m!1115065 () Bool)

(assert (=> b!1209225 m!1115065))

(declare-fun m!1115067 () Bool)

(assert (=> bm!59307 m!1115067))

(declare-fun m!1115069 () Bool)

(assert (=> mapNonEmpty!47908 m!1115069))

(check-sat (not b!1209235) (not b!1209238) (not b!1209218) (not b!1209233) (not b!1209242) (not bm!59309) (not b!1209237) (not b!1209248) (not b!1209246) (not bm!59308) (not bm!59310) b_and!43061 tp_is_empty!30693 (not mapNonEmpty!47908) (not b!1209240) (not b!1209229) (not b!1209225) (not b!1209224) (not b!1209239) (not b!1209236) (not b!1209220) (not bm!59311) (not start!100990) (not b_lambda!21589) (not b!1209243) (not b_next!25989) (not b!1209231) (not b!1209227) (not bm!59307))
(check-sat b_and!43061 (not b_next!25989))
