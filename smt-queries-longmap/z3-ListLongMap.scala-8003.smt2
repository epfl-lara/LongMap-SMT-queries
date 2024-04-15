; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98852 () Bool)

(assert start!98852)

(declare-fun b_free!24463 () Bool)

(declare-fun b_next!24463 () Bool)

(assert (=> start!98852 (= b_free!24463 (not b_next!24463))))

(declare-fun tp!86099 () Bool)

(declare-fun b_and!39753 () Bool)

(assert (=> start!98852 (= tp!86099 b_and!39753)))

(declare-fun b!1156186 () Bool)

(declare-fun e!657513 () Bool)

(declare-fun e!657520 () Bool)

(assert (=> b!1156186 (= e!657513 e!657520)))

(declare-fun res!768026 () Bool)

(assert (=> b!1156186 (=> res!768026 e!657520)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156186 (= res!768026 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43785 0))(
  ( (V!43786 (val!14553 Int)) )
))
(declare-fun zeroValue!944 () V!43785)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13787 0))(
  ( (ValueCellFull!13787 (v!17189 V!43785)) (EmptyCell!13787) )
))
(declare-datatypes ((array!74750 0))(
  ( (array!74751 (arr!36026 (Array (_ BitVec 32) ValueCell!13787)) (size!36564 (_ BitVec 32))) )
))
(declare-fun lt!518827 () array!74750)

(declare-fun minValue!944 () V!43785)

(declare-datatypes ((array!74752 0))(
  ( (array!74753 (arr!36027 (Array (_ BitVec 32) (_ BitVec 64))) (size!36565 (_ BitVec 32))) )
))
(declare-fun lt!518836 () array!74752)

(declare-datatypes ((tuple2!18590 0))(
  ( (tuple2!18591 (_1!9306 (_ BitVec 64)) (_2!9306 V!43785)) )
))
(declare-datatypes ((List!25320 0))(
  ( (Nil!25317) (Cons!25316 (h!26525 tuple2!18590) (t!36766 List!25320)) )
))
(declare-datatypes ((ListLongMap!16559 0))(
  ( (ListLongMap!16560 (toList!8295 List!25320)) )
))
(declare-fun lt!518841 () ListLongMap!16559)

(declare-fun getCurrentListMapNoExtraKeys!4776 (array!74752 array!74750 (_ BitVec 32) (_ BitVec 32) V!43785 V!43785 (_ BitVec 32) Int) ListLongMap!16559)

(assert (=> b!1156186 (= lt!518841 (getCurrentListMapNoExtraKeys!4776 lt!518836 lt!518827 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518828 () V!43785)

(declare-fun _values!996 () array!74750)

(assert (=> b!1156186 (= lt!518827 (array!74751 (store (arr!36026 _values!996) i!673 (ValueCellFull!13787 lt!518828)) (size!36564 _values!996)))))

(declare-fun dynLambda!2734 (Int (_ BitVec 64)) V!43785)

(assert (=> b!1156186 (= lt!518828 (dynLambda!2734 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74752)

(declare-fun lt!518835 () ListLongMap!16559)

(assert (=> b!1156186 (= lt!518835 (getCurrentListMapNoExtraKeys!4776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156187 () Bool)

(declare-datatypes ((Unit!37930 0))(
  ( (Unit!37931) )
))
(declare-fun e!657516 () Unit!37930)

(declare-fun Unit!37932 () Unit!37930)

(assert (=> b!1156187 (= e!657516 Unit!37932)))

(declare-fun b!1156188 () Bool)

(declare-fun Unit!37933 () Unit!37930)

(assert (=> b!1156188 (= e!657516 Unit!37933)))

(declare-fun lt!518829 () Bool)

(assert (=> b!1156188 (= lt!518829 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115004 () Bool)

(assert (=> b!1156188 (= c!115004 (and (not lt!518829) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518825 () Unit!37930)

(declare-fun e!657515 () Unit!37930)

(assert (=> b!1156188 (= lt!518825 e!657515)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!518832 () Unit!37930)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!500 (array!74752 array!74750 (_ BitVec 32) (_ BitVec 32) V!43785 V!43785 (_ BitVec 64) (_ BitVec 32) Int) Unit!37930)

(assert (=> b!1156188 (= lt!518832 (lemmaListMapContainsThenArrayContainsFrom!500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114999 () Bool)

(assert (=> b!1156188 (= c!114999 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768031 () Bool)

(declare-fun e!657519 () Bool)

(assert (=> b!1156188 (= res!768031 e!657519)))

(declare-fun e!657527 () Bool)

(assert (=> b!1156188 (=> (not res!768031) (not e!657527))))

(assert (=> b!1156188 e!657527))

(declare-fun lt!518837 () Unit!37930)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74752 (_ BitVec 32) (_ BitVec 32)) Unit!37930)

(assert (=> b!1156188 (= lt!518837 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25321 0))(
  ( (Nil!25318) (Cons!25317 (h!26526 (_ BitVec 64)) (t!36767 List!25321)) )
))
(declare-fun arrayNoDuplicates!0 (array!74752 (_ BitVec 32) List!25321) Bool)

(assert (=> b!1156188 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25318)))

(declare-fun lt!518822 () Unit!37930)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74752 (_ BitVec 64) (_ BitVec 32) List!25321) Unit!37930)

(assert (=> b!1156188 (= lt!518822 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25318))))

(assert (=> b!1156188 false))

(declare-fun bm!55072 () Bool)

(declare-fun call!55079 () Unit!37930)

(declare-fun call!55080 () Unit!37930)

(assert (=> bm!55072 (= call!55079 call!55080)))

(declare-fun b!1156189 () Bool)

(declare-fun e!657524 () Bool)

(assert (=> b!1156189 (= e!657524 (not e!657513))))

(declare-fun res!768019 () Bool)

(assert (=> b!1156189 (=> res!768019 e!657513)))

(assert (=> b!1156189 (= res!768019 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156189 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518840 () Unit!37930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74752 (_ BitVec 64) (_ BitVec 32)) Unit!37930)

(assert (=> b!1156189 (= lt!518840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!55075 () ListLongMap!16559)

(declare-fun bm!55073 () Bool)

(assert (=> bm!55073 (= call!55075 (getCurrentListMapNoExtraKeys!4776 lt!518836 lt!518827 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!657526 () Bool)

(declare-fun lt!518820 () ListLongMap!16559)

(declare-fun b!1156190 () Bool)

(assert (=> b!1156190 (= e!657526 (= lt!518820 (getCurrentListMapNoExtraKeys!4776 lt!518836 lt!518827 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!55074 () Bool)

(declare-fun call!55076 () Bool)

(declare-fun call!55082 () Bool)

(assert (=> bm!55074 (= call!55076 call!55082)))

(declare-fun b!1156191 () Bool)

(declare-fun lt!518821 () ListLongMap!16559)

(declare-fun contains!6747 (ListLongMap!16559 (_ BitVec 64)) Bool)

(declare-fun +!3706 (ListLongMap!16559 tuple2!18590) ListLongMap!16559)

(assert (=> b!1156191 (contains!6747 (+!3706 lt!518821 (tuple2!18591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!518824 () Unit!37930)

(declare-fun addStillContains!917 (ListLongMap!16559 (_ BitVec 64) V!43785 (_ BitVec 64)) Unit!37930)

(assert (=> b!1156191 (= lt!518824 (addStillContains!917 lt!518821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1156191 call!55082))

(declare-fun call!55078 () ListLongMap!16559)

(assert (=> b!1156191 (= lt!518821 call!55078)))

(declare-fun lt!518839 () Unit!37930)

(assert (=> b!1156191 (= lt!518839 call!55080)))

(assert (=> b!1156191 (= e!657515 lt!518824)))

(declare-fun b!1156192 () Bool)

(declare-fun e!657523 () Unit!37930)

(declare-fun Unit!37934 () Unit!37930)

(assert (=> b!1156192 (= e!657523 Unit!37934)))

(declare-fun c!115001 () Bool)

(declare-fun lt!518823 () ListLongMap!16559)

(declare-fun bm!55075 () Bool)

(assert (=> bm!55075 (= call!55080 (addStillContains!917 lt!518823 (ite (or c!115004 c!115001) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115004 c!115001) zeroValue!944 minValue!944) k0!934))))

(declare-fun res!768018 () Bool)

(declare-fun e!657517 () Bool)

(assert (=> start!98852 (=> (not res!768018) (not e!657517))))

(assert (=> start!98852 (= res!768018 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36565 _keys!1208))))))

(assert (=> start!98852 e!657517))

(declare-fun tp_is_empty!28993 () Bool)

(assert (=> start!98852 tp_is_empty!28993))

(declare-fun array_inv!27686 (array!74752) Bool)

(assert (=> start!98852 (array_inv!27686 _keys!1208)))

(assert (=> start!98852 true))

(assert (=> start!98852 tp!86099))

(declare-fun e!657525 () Bool)

(declare-fun array_inv!27687 (array!74750) Bool)

(assert (=> start!98852 (and (array_inv!27687 _values!996) e!657525)))

(declare-fun b!1156193 () Bool)

(declare-fun e!657528 () Bool)

(assert (=> b!1156193 (= e!657528 tp_is_empty!28993)))

(declare-fun b!1156194 () Bool)

(assert (=> b!1156194 (= e!657519 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156195 () Bool)

(declare-fun res!768029 () Bool)

(assert (=> b!1156195 (=> (not res!768029) (not e!657517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156195 (= res!768029 (validMask!0 mask!1564))))

(declare-fun b!1156196 () Bool)

(assert (=> b!1156196 (= e!657517 e!657524)))

(declare-fun res!768028 () Bool)

(assert (=> b!1156196 (=> (not res!768028) (not e!657524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74752 (_ BitVec 32)) Bool)

(assert (=> b!1156196 (= res!768028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518836 mask!1564))))

(assert (=> b!1156196 (= lt!518836 (array!74753 (store (arr!36027 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36565 _keys!1208)))))

(declare-fun b!1156197 () Bool)

(declare-fun e!657512 () Bool)

(assert (=> b!1156197 (= e!657512 tp_is_empty!28993)))

(declare-fun b!1156198 () Bool)

(declare-fun res!768020 () Bool)

(assert (=> b!1156198 (=> (not res!768020) (not e!657517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156198 (= res!768020 (validKeyInArray!0 k0!934))))

(declare-fun call!55081 () ListLongMap!16559)

(declare-fun bm!55076 () Bool)

(assert (=> bm!55076 (= call!55081 (getCurrentListMapNoExtraKeys!4776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156199 () Bool)

(declare-fun res!768025 () Bool)

(assert (=> b!1156199 (=> (not res!768025) (not e!657524))))

(assert (=> b!1156199 (= res!768025 (arrayNoDuplicates!0 lt!518836 #b00000000000000000000000000000000 Nil!25318))))

(declare-fun b!1156200 () Bool)

(declare-fun res!768027 () Bool)

(assert (=> b!1156200 (=> (not res!768027) (not e!657517))))

(assert (=> b!1156200 (= res!768027 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36565 _keys!1208))))))

(declare-fun b!1156201 () Bool)

(declare-fun res!768030 () Bool)

(assert (=> b!1156201 (=> (not res!768030) (not e!657517))))

(assert (=> b!1156201 (= res!768030 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25318))))

(declare-fun mapNonEmpty!45314 () Bool)

(declare-fun mapRes!45314 () Bool)

(declare-fun tp!86100 () Bool)

(assert (=> mapNonEmpty!45314 (= mapRes!45314 (and tp!86100 e!657512))))

(declare-fun mapValue!45314 () ValueCell!13787)

(declare-fun mapKey!45314 () (_ BitVec 32))

(declare-fun mapRest!45314 () (Array (_ BitVec 32) ValueCell!13787))

(assert (=> mapNonEmpty!45314 (= (arr!36026 _values!996) (store mapRest!45314 mapKey!45314 mapValue!45314))))

(declare-fun b!1156202 () Bool)

(declare-fun e!657521 () Bool)

(declare-fun -!1354 (ListLongMap!16559 (_ BitVec 64)) ListLongMap!16559)

(assert (=> b!1156202 (= e!657521 (= call!55075 (-!1354 call!55081 k0!934)))))

(declare-fun b!1156203 () Bool)

(assert (=> b!1156203 (= e!657519 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518829) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156204 () Bool)

(assert (=> b!1156204 (= e!657521 (= call!55075 call!55081))))

(declare-fun b!1156205 () Bool)

(declare-fun e!657514 () Bool)

(assert (=> b!1156205 (= e!657514 true)))

(assert (=> b!1156205 e!657526))

(declare-fun res!768021 () Bool)

(assert (=> b!1156205 (=> (not res!768021) (not e!657526))))

(assert (=> b!1156205 (= res!768021 (= lt!518820 lt!518823))))

(assert (=> b!1156205 (= lt!518820 (-!1354 lt!518835 k0!934))))

(declare-fun lt!518826 () V!43785)

(assert (=> b!1156205 (= (-!1354 (+!3706 lt!518823 (tuple2!18591 (select (arr!36027 _keys!1208) from!1455) lt!518826)) (select (arr!36027 _keys!1208) from!1455)) lt!518823)))

(declare-fun lt!518834 () Unit!37930)

(declare-fun addThenRemoveForNewKeyIsSame!207 (ListLongMap!16559 (_ BitVec 64) V!43785) Unit!37930)

(assert (=> b!1156205 (= lt!518834 (addThenRemoveForNewKeyIsSame!207 lt!518823 (select (arr!36027 _keys!1208) from!1455) lt!518826))))

(declare-fun get!18375 (ValueCell!13787 V!43785) V!43785)

(assert (=> b!1156205 (= lt!518826 (get!18375 (select (arr!36026 _values!996) from!1455) lt!518828))))

(declare-fun lt!518833 () Unit!37930)

(assert (=> b!1156205 (= lt!518833 e!657516)))

(declare-fun c!115002 () Bool)

(assert (=> b!1156205 (= c!115002 (contains!6747 lt!518823 k0!934))))

(assert (=> b!1156205 (= lt!518823 (getCurrentListMapNoExtraKeys!4776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156206 () Bool)

(assert (=> b!1156206 (= e!657525 (and e!657528 mapRes!45314))))

(declare-fun condMapEmpty!45314 () Bool)

(declare-fun mapDefault!45314 () ValueCell!13787)

(assert (=> b!1156206 (= condMapEmpty!45314 (= (arr!36026 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13787)) mapDefault!45314)))))

(declare-fun b!1156207 () Bool)

(declare-fun res!768023 () Bool)

(assert (=> b!1156207 (=> (not res!768023) (not e!657517))))

(assert (=> b!1156207 (= res!768023 (= (select (arr!36027 _keys!1208) i!673) k0!934))))

(declare-fun bm!55077 () Bool)

(assert (=> bm!55077 (= call!55078 (+!3706 lt!518823 (ite (or c!115004 c!115001) (tuple2!18591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!45314 () Bool)

(assert (=> mapIsEmpty!45314 mapRes!45314))

(declare-fun b!1156208 () Bool)

(assert (=> b!1156208 (= c!115001 (and (not lt!518829) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657522 () Unit!37930)

(assert (=> b!1156208 (= e!657515 e!657522)))

(declare-fun b!1156209 () Bool)

(assert (=> b!1156209 (= e!657522 e!657523)))

(declare-fun c!115000 () Bool)

(assert (=> b!1156209 (= c!115000 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518829))))

(declare-fun b!1156210 () Bool)

(declare-fun res!768032 () Bool)

(assert (=> b!1156210 (=> (not res!768032) (not e!657517))))

(assert (=> b!1156210 (= res!768032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156211 () Bool)

(assert (=> b!1156211 (= e!657520 e!657514)))

(declare-fun res!768022 () Bool)

(assert (=> b!1156211 (=> res!768022 e!657514)))

(assert (=> b!1156211 (= res!768022 (not (= (select (arr!36027 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156211 e!657521))

(declare-fun c!115003 () Bool)

(assert (=> b!1156211 (= c!115003 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518830 () Unit!37930)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!626 (array!74752 array!74750 (_ BitVec 32) (_ BitVec 32) V!43785 V!43785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37930)

(assert (=> b!1156211 (= lt!518830 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55078 () Bool)

(declare-fun call!55077 () ListLongMap!16559)

(assert (=> bm!55078 (= call!55082 (contains!6747 (ite c!115004 lt!518821 call!55077) k0!934))))

(declare-fun b!1156212 () Bool)

(assert (=> b!1156212 (= e!657527 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156213 () Bool)

(assert (=> b!1156213 call!55076))

(declare-fun lt!518838 () Unit!37930)

(assert (=> b!1156213 (= lt!518838 call!55079)))

(assert (=> b!1156213 (= e!657523 lt!518838)))

(declare-fun b!1156214 () Bool)

(declare-fun lt!518831 () Unit!37930)

(assert (=> b!1156214 (= e!657522 lt!518831)))

(assert (=> b!1156214 (= lt!518831 call!55079)))

(assert (=> b!1156214 call!55076))

(declare-fun bm!55079 () Bool)

(assert (=> bm!55079 (= call!55077 call!55078)))

(declare-fun b!1156215 () Bool)

(declare-fun res!768024 () Bool)

(assert (=> b!1156215 (=> (not res!768024) (not e!657517))))

(assert (=> b!1156215 (= res!768024 (and (= (size!36564 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36565 _keys!1208) (size!36564 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98852 res!768018) b!1156195))

(assert (= (and b!1156195 res!768029) b!1156215))

(assert (= (and b!1156215 res!768024) b!1156210))

(assert (= (and b!1156210 res!768032) b!1156201))

(assert (= (and b!1156201 res!768030) b!1156200))

(assert (= (and b!1156200 res!768027) b!1156198))

(assert (= (and b!1156198 res!768020) b!1156207))

(assert (= (and b!1156207 res!768023) b!1156196))

(assert (= (and b!1156196 res!768028) b!1156199))

(assert (= (and b!1156199 res!768025) b!1156189))

(assert (= (and b!1156189 (not res!768019)) b!1156186))

(assert (= (and b!1156186 (not res!768026)) b!1156211))

(assert (= (and b!1156211 c!115003) b!1156202))

(assert (= (and b!1156211 (not c!115003)) b!1156204))

(assert (= (or b!1156202 b!1156204) bm!55076))

(assert (= (or b!1156202 b!1156204) bm!55073))

(assert (= (and b!1156211 (not res!768022)) b!1156205))

(assert (= (and b!1156205 c!115002) b!1156188))

(assert (= (and b!1156205 (not c!115002)) b!1156187))

(assert (= (and b!1156188 c!115004) b!1156191))

(assert (= (and b!1156188 (not c!115004)) b!1156208))

(assert (= (and b!1156208 c!115001) b!1156214))

(assert (= (and b!1156208 (not c!115001)) b!1156209))

(assert (= (and b!1156209 c!115000) b!1156213))

(assert (= (and b!1156209 (not c!115000)) b!1156192))

(assert (= (or b!1156214 b!1156213) bm!55072))

(assert (= (or b!1156214 b!1156213) bm!55079))

(assert (= (or b!1156214 b!1156213) bm!55074))

(assert (= (or b!1156191 bm!55074) bm!55078))

(assert (= (or b!1156191 bm!55072) bm!55075))

(assert (= (or b!1156191 bm!55079) bm!55077))

(assert (= (and b!1156188 c!114999) b!1156194))

(assert (= (and b!1156188 (not c!114999)) b!1156203))

(assert (= (and b!1156188 res!768031) b!1156212))

(assert (= (and b!1156205 res!768021) b!1156190))

(assert (= (and b!1156206 condMapEmpty!45314) mapIsEmpty!45314))

(assert (= (and b!1156206 (not condMapEmpty!45314)) mapNonEmpty!45314))

(get-info :version)

(assert (= (and mapNonEmpty!45314 ((_ is ValueCellFull!13787) mapValue!45314)) b!1156197))

(assert (= (and b!1156206 ((_ is ValueCellFull!13787) mapDefault!45314)) b!1156193))

(assert (= start!98852 b!1156206))

(declare-fun b_lambda!19551 () Bool)

(assert (=> (not b_lambda!19551) (not b!1156186)))

(declare-fun t!36765 () Bool)

(declare-fun tb!9267 () Bool)

(assert (=> (and start!98852 (= defaultEntry!1004 defaultEntry!1004) t!36765) tb!9267))

(declare-fun result!19107 () Bool)

(assert (=> tb!9267 (= result!19107 tp_is_empty!28993)))

(assert (=> b!1156186 t!36765))

(declare-fun b_and!39755 () Bool)

(assert (= b_and!39753 (and (=> t!36765 result!19107) b_and!39755)))

(declare-fun m!1065191 () Bool)

(assert (=> b!1156186 m!1065191))

(declare-fun m!1065193 () Bool)

(assert (=> b!1156186 m!1065193))

(declare-fun m!1065195 () Bool)

(assert (=> b!1156186 m!1065195))

(declare-fun m!1065197 () Bool)

(assert (=> b!1156186 m!1065197))

(declare-fun m!1065199 () Bool)

(assert (=> b!1156195 m!1065199))

(declare-fun m!1065201 () Bool)

(assert (=> b!1156201 m!1065201))

(declare-fun m!1065203 () Bool)

(assert (=> start!98852 m!1065203))

(declare-fun m!1065205 () Bool)

(assert (=> start!98852 m!1065205))

(declare-fun m!1065207 () Bool)

(assert (=> b!1156205 m!1065207))

(declare-fun m!1065209 () Bool)

(assert (=> b!1156205 m!1065209))

(declare-fun m!1065211 () Bool)

(assert (=> b!1156205 m!1065211))

(declare-fun m!1065213 () Bool)

(assert (=> b!1156205 m!1065213))

(declare-fun m!1065215 () Bool)

(assert (=> b!1156205 m!1065215))

(declare-fun m!1065217 () Bool)

(assert (=> b!1156205 m!1065217))

(declare-fun m!1065219 () Bool)

(assert (=> b!1156205 m!1065219))

(assert (=> b!1156205 m!1065213))

(declare-fun m!1065221 () Bool)

(assert (=> b!1156205 m!1065221))

(assert (=> b!1156205 m!1065207))

(assert (=> b!1156205 m!1065219))

(declare-fun m!1065223 () Bool)

(assert (=> b!1156205 m!1065223))

(assert (=> b!1156205 m!1065213))

(declare-fun m!1065225 () Bool)

(assert (=> b!1156212 m!1065225))

(declare-fun m!1065227 () Bool)

(assert (=> b!1156207 m!1065227))

(declare-fun m!1065229 () Bool)

(assert (=> b!1156196 m!1065229))

(declare-fun m!1065231 () Bool)

(assert (=> b!1156196 m!1065231))

(declare-fun m!1065233 () Bool)

(assert (=> b!1156191 m!1065233))

(assert (=> b!1156191 m!1065233))

(declare-fun m!1065235 () Bool)

(assert (=> b!1156191 m!1065235))

(declare-fun m!1065237 () Bool)

(assert (=> b!1156191 m!1065237))

(declare-fun m!1065239 () Bool)

(assert (=> b!1156202 m!1065239))

(declare-fun m!1065241 () Bool)

(assert (=> b!1156189 m!1065241))

(declare-fun m!1065243 () Bool)

(assert (=> b!1156189 m!1065243))

(declare-fun m!1065245 () Bool)

(assert (=> b!1156210 m!1065245))

(assert (=> b!1156194 m!1065225))

(declare-fun m!1065247 () Bool)

(assert (=> b!1156199 m!1065247))

(declare-fun m!1065249 () Bool)

(assert (=> mapNonEmpty!45314 m!1065249))

(declare-fun m!1065251 () Bool)

(assert (=> bm!55073 m!1065251))

(declare-fun m!1065253 () Bool)

(assert (=> b!1156188 m!1065253))

(declare-fun m!1065255 () Bool)

(assert (=> b!1156188 m!1065255))

(declare-fun m!1065257 () Bool)

(assert (=> b!1156188 m!1065257))

(declare-fun m!1065259 () Bool)

(assert (=> b!1156188 m!1065259))

(declare-fun m!1065261 () Bool)

(assert (=> b!1156198 m!1065261))

(declare-fun m!1065263 () Bool)

(assert (=> bm!55078 m!1065263))

(declare-fun m!1065265 () Bool)

(assert (=> bm!55077 m!1065265))

(assert (=> b!1156190 m!1065251))

(assert (=> b!1156211 m!1065213))

(declare-fun m!1065267 () Bool)

(assert (=> b!1156211 m!1065267))

(assert (=> bm!55076 m!1065211))

(declare-fun m!1065269 () Bool)

(assert (=> bm!55075 m!1065269))

(check-sat (not b!1156195) tp_is_empty!28993 (not b!1156190) (not b_lambda!19551) (not mapNonEmpty!45314) (not bm!55077) (not bm!55078) (not b!1156188) (not b!1156210) (not b!1156186) (not b!1156196) (not bm!55073) (not b!1156202) (not start!98852) (not b!1156194) (not b!1156205) (not b!1156199) (not b!1156211) (not b!1156198) (not bm!55076) (not bm!55075) (not b!1156191) (not b!1156201) (not b_next!24463) (not b!1156212) (not b!1156189) b_and!39755)
(check-sat b_and!39755 (not b_next!24463))
