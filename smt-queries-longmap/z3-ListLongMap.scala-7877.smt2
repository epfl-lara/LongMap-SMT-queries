; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98000 () Bool)

(assert start!98000)

(declare-fun b_free!23707 () Bool)

(declare-fun b_next!23707 () Bool)

(assert (=> start!98000 (= b_free!23707 (not b_next!23707))))

(declare-fun tp!83825 () Bool)

(declare-fun b_and!38175 () Bool)

(assert (=> start!98000 (= tp!83825 b_and!38175)))

(declare-fun b!1124135 () Bool)

(declare-fun res!751105 () Bool)

(declare-fun e!639929 () Bool)

(assert (=> b!1124135 (=> res!751105 e!639929)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1124135 (= res!751105 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124136 () Bool)

(declare-fun e!639932 () Bool)

(declare-datatypes ((V!42777 0))(
  ( (V!42778 (val!14175 Int)) )
))
(declare-datatypes ((tuple2!17890 0))(
  ( (tuple2!17891 (_1!8956 (_ BitVec 64)) (_2!8956 V!42777)) )
))
(declare-datatypes ((List!24652 0))(
  ( (Nil!24649) (Cons!24648 (h!25857 tuple2!17890) (t!35342 List!24652)) )
))
(declare-datatypes ((ListLongMap!15859 0))(
  ( (ListLongMap!15860 (toList!7945 List!24652)) )
))
(declare-fun call!47380 () ListLongMap!15859)

(declare-fun call!47381 () ListLongMap!15859)

(assert (=> b!1124136 (= e!639932 (= call!47380 call!47381))))

(declare-fun b!1124137 () Bool)

(declare-fun res!751099 () Bool)

(declare-fun e!639931 () Bool)

(assert (=> b!1124137 (=> (not res!751099) (not e!639931))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124137 (= res!751099 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!42777)

(declare-fun bm!47377 () Bool)

(declare-datatypes ((array!73264 0))(
  ( (array!73265 (arr!35285 (Array (_ BitVec 32) (_ BitVec 64))) (size!35823 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73264)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13409 0))(
  ( (ValueCellFull!13409 (v!16807 V!42777)) (EmptyCell!13409) )
))
(declare-datatypes ((array!73266 0))(
  ( (array!73267 (arr!35286 (Array (_ BitVec 32) ValueCell!13409)) (size!35824 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73266)

(declare-fun minValue!944 () V!42777)

(declare-fun getCurrentListMapNoExtraKeys!4450 (array!73264 array!73266 (_ BitVec 32) (_ BitVec 32) V!42777 V!42777 (_ BitVec 32) Int) ListLongMap!15859)

(assert (=> bm!47377 (= call!47381 (getCurrentListMapNoExtraKeys!4450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124138 () Bool)

(declare-fun e!639926 () Bool)

(declare-fun e!639936 () Bool)

(assert (=> b!1124138 (= e!639926 e!639936)))

(declare-fun res!751103 () Bool)

(assert (=> b!1124138 (=> res!751103 e!639936)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124138 (= res!751103 (not (= from!1455 i!673)))))

(declare-fun lt!499199 () array!73266)

(declare-fun lt!499196 () ListLongMap!15859)

(declare-fun lt!499198 () array!73264)

(assert (=> b!1124138 (= lt!499196 (getCurrentListMapNoExtraKeys!4450 lt!499198 lt!499199 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2475 (Int (_ BitVec 64)) V!42777)

(assert (=> b!1124138 (= lt!499199 (array!73267 (store (arr!35286 _values!996) i!673 (ValueCellFull!13409 (dynLambda!2475 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35824 _values!996)))))

(declare-fun lt!499197 () ListLongMap!15859)

(assert (=> b!1124138 (= lt!499197 (getCurrentListMapNoExtraKeys!4450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124139 () Bool)

(declare-fun res!751106 () Bool)

(assert (=> b!1124139 (=> (not res!751106) (not e!639931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124139 (= res!751106 (validMask!0 mask!1564))))

(declare-fun b!1124140 () Bool)

(assert (=> b!1124140 (= e!639929 true)))

(declare-fun lt!499193 () ListLongMap!15859)

(declare-fun contains!6417 (ListLongMap!15859 (_ BitVec 64)) Bool)

(declare-fun +!3449 (ListLongMap!15859 tuple2!17890) ListLongMap!15859)

(assert (=> b!1124140 (contains!6417 (+!3449 lt!499193 (tuple2!17891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36703 0))(
  ( (Unit!36704) )
))
(declare-fun lt!499200 () Unit!36703)

(declare-fun addStillContains!667 (ListLongMap!15859 (_ BitVec 64) V!42777 (_ BitVec 64)) Unit!36703)

(assert (=> b!1124140 (= lt!499200 (addStillContains!667 lt!499193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124141 () Bool)

(declare-fun e!639930 () Bool)

(assert (=> b!1124141 (= e!639930 (not e!639926))))

(declare-fun res!751100 () Bool)

(assert (=> b!1124141 (=> res!751100 e!639926)))

(assert (=> b!1124141 (= res!751100 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124141 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499195 () Unit!36703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73264 (_ BitVec 64) (_ BitVec 32)) Unit!36703)

(assert (=> b!1124141 (= lt!499195 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44173 () Bool)

(declare-fun mapRes!44173 () Bool)

(assert (=> mapIsEmpty!44173 mapRes!44173))

(declare-fun b!1124142 () Bool)

(declare-fun res!751109 () Bool)

(assert (=> b!1124142 (=> (not res!751109) (not e!639931))))

(assert (=> b!1124142 (= res!751109 (= (select (arr!35285 _keys!1208) i!673) k0!934))))

(declare-fun b!1124143 () Bool)

(declare-fun res!751110 () Bool)

(assert (=> b!1124143 (=> (not res!751110) (not e!639931))))

(assert (=> b!1124143 (= res!751110 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35823 _keys!1208))))))

(declare-fun b!1124144 () Bool)

(assert (=> b!1124144 (= e!639931 e!639930)))

(declare-fun res!751107 () Bool)

(assert (=> b!1124144 (=> (not res!751107) (not e!639930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73264 (_ BitVec 32)) Bool)

(assert (=> b!1124144 (= res!751107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499198 mask!1564))))

(assert (=> b!1124144 (= lt!499198 (array!73265 (store (arr!35285 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35823 _keys!1208)))))

(declare-fun b!1124145 () Bool)

(declare-fun -!1084 (ListLongMap!15859 (_ BitVec 64)) ListLongMap!15859)

(assert (=> b!1124145 (= e!639932 (= call!47380 (-!1084 call!47381 k0!934)))))

(declare-fun b!1124146 () Bool)

(declare-fun e!639928 () Bool)

(assert (=> b!1124146 (= e!639928 e!639929)))

(declare-fun res!751102 () Bool)

(assert (=> b!1124146 (=> res!751102 e!639929)))

(assert (=> b!1124146 (= res!751102 (not (contains!6417 lt!499193 k0!934)))))

(assert (=> b!1124146 (= lt!499193 (getCurrentListMapNoExtraKeys!4450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124147 () Bool)

(declare-fun res!751101 () Bool)

(assert (=> b!1124147 (=> (not res!751101) (not e!639930))))

(declare-datatypes ((List!24653 0))(
  ( (Nil!24650) (Cons!24649 (h!25858 (_ BitVec 64)) (t!35343 List!24653)) )
))
(declare-fun arrayNoDuplicates!0 (array!73264 (_ BitVec 32) List!24653) Bool)

(assert (=> b!1124147 (= res!751101 (arrayNoDuplicates!0 lt!499198 #b00000000000000000000000000000000 Nil!24650))))

(declare-fun b!1124148 () Bool)

(declare-fun res!751111 () Bool)

(assert (=> b!1124148 (=> (not res!751111) (not e!639931))))

(assert (=> b!1124148 (= res!751111 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24650))))

(declare-fun b!1124149 () Bool)

(declare-fun e!639934 () Bool)

(declare-fun tp_is_empty!28237 () Bool)

(assert (=> b!1124149 (= e!639934 tp_is_empty!28237)))

(declare-fun b!1124150 () Bool)

(declare-fun res!751104 () Bool)

(assert (=> b!1124150 (=> (not res!751104) (not e!639931))))

(assert (=> b!1124150 (= res!751104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124151 () Bool)

(declare-fun res!751098 () Bool)

(assert (=> b!1124151 (=> (not res!751098) (not e!639931))))

(assert (=> b!1124151 (= res!751098 (and (= (size!35824 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35823 _keys!1208) (size!35824 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47378 () Bool)

(assert (=> bm!47378 (= call!47380 (getCurrentListMapNoExtraKeys!4450 lt!499198 lt!499199 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124152 () Bool)

(declare-fun e!639935 () Bool)

(assert (=> b!1124152 (= e!639935 tp_is_empty!28237)))

(declare-fun b!1124153 () Bool)

(declare-fun e!639927 () Bool)

(assert (=> b!1124153 (= e!639927 (and e!639935 mapRes!44173))))

(declare-fun condMapEmpty!44173 () Bool)

(declare-fun mapDefault!44173 () ValueCell!13409)

(assert (=> b!1124153 (= condMapEmpty!44173 (= (arr!35286 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13409)) mapDefault!44173)))))

(declare-fun mapNonEmpty!44173 () Bool)

(declare-fun tp!83824 () Bool)

(assert (=> mapNonEmpty!44173 (= mapRes!44173 (and tp!83824 e!639934))))

(declare-fun mapRest!44173 () (Array (_ BitVec 32) ValueCell!13409))

(declare-fun mapKey!44173 () (_ BitVec 32))

(declare-fun mapValue!44173 () ValueCell!13409)

(assert (=> mapNonEmpty!44173 (= (arr!35286 _values!996) (store mapRest!44173 mapKey!44173 mapValue!44173))))

(declare-fun b!1124154 () Bool)

(assert (=> b!1124154 (= e!639936 e!639928)))

(declare-fun res!751097 () Bool)

(assert (=> b!1124154 (=> res!751097 e!639928)))

(assert (=> b!1124154 (= res!751097 (not (= (select (arr!35285 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124154 e!639932))

(declare-fun c!109524 () Bool)

(assert (=> b!1124154 (= c!109524 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499194 () Unit!36703)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!360 (array!73264 array!73266 (_ BitVec 32) (_ BitVec 32) V!42777 V!42777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36703)

(assert (=> b!1124154 (= lt!499194 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751108 () Bool)

(assert (=> start!98000 (=> (not res!751108) (not e!639931))))

(assert (=> start!98000 (= res!751108 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35823 _keys!1208))))))

(assert (=> start!98000 e!639931))

(assert (=> start!98000 tp_is_empty!28237))

(declare-fun array_inv!27158 (array!73264) Bool)

(assert (=> start!98000 (array_inv!27158 _keys!1208)))

(assert (=> start!98000 true))

(assert (=> start!98000 tp!83825))

(declare-fun array_inv!27159 (array!73266) Bool)

(assert (=> start!98000 (and (array_inv!27159 _values!996) e!639927)))

(assert (= (and start!98000 res!751108) b!1124139))

(assert (= (and b!1124139 res!751106) b!1124151))

(assert (= (and b!1124151 res!751098) b!1124150))

(assert (= (and b!1124150 res!751104) b!1124148))

(assert (= (and b!1124148 res!751111) b!1124143))

(assert (= (and b!1124143 res!751110) b!1124137))

(assert (= (and b!1124137 res!751099) b!1124142))

(assert (= (and b!1124142 res!751109) b!1124144))

(assert (= (and b!1124144 res!751107) b!1124147))

(assert (= (and b!1124147 res!751101) b!1124141))

(assert (= (and b!1124141 (not res!751100)) b!1124138))

(assert (= (and b!1124138 (not res!751103)) b!1124154))

(assert (= (and b!1124154 c!109524) b!1124145))

(assert (= (and b!1124154 (not c!109524)) b!1124136))

(assert (= (or b!1124145 b!1124136) bm!47378))

(assert (= (or b!1124145 b!1124136) bm!47377))

(assert (= (and b!1124154 (not res!751097)) b!1124146))

(assert (= (and b!1124146 (not res!751102)) b!1124135))

(assert (= (and b!1124135 (not res!751105)) b!1124140))

(assert (= (and b!1124153 condMapEmpty!44173) mapIsEmpty!44173))

(assert (= (and b!1124153 (not condMapEmpty!44173)) mapNonEmpty!44173))

(get-info :version)

(assert (= (and mapNonEmpty!44173 ((_ is ValueCellFull!13409) mapValue!44173)) b!1124149))

(assert (= (and b!1124153 ((_ is ValueCellFull!13409) mapDefault!44173)) b!1124152))

(assert (= start!98000 b!1124153))

(declare-fun b_lambda!18659 () Bool)

(assert (=> (not b_lambda!18659) (not b!1124138)))

(declare-fun t!35341 () Bool)

(declare-fun tb!8511 () Bool)

(assert (=> (and start!98000 (= defaultEntry!1004 defaultEntry!1004) t!35341) tb!8511))

(declare-fun result!17591 () Bool)

(assert (=> tb!8511 (= result!17591 tp_is_empty!28237)))

(assert (=> b!1124138 t!35341))

(declare-fun b_and!38177 () Bool)

(assert (= b_and!38175 (and (=> t!35341 result!17591) b_and!38177)))

(declare-fun m!1037961 () Bool)

(assert (=> b!1124150 m!1037961))

(declare-fun m!1037963 () Bool)

(assert (=> b!1124140 m!1037963))

(assert (=> b!1124140 m!1037963))

(declare-fun m!1037965 () Bool)

(assert (=> b!1124140 m!1037965))

(declare-fun m!1037967 () Bool)

(assert (=> b!1124140 m!1037967))

(declare-fun m!1037969 () Bool)

(assert (=> b!1124144 m!1037969))

(declare-fun m!1037971 () Bool)

(assert (=> b!1124144 m!1037971))

(declare-fun m!1037973 () Bool)

(assert (=> b!1124154 m!1037973))

(declare-fun m!1037975 () Bool)

(assert (=> b!1124154 m!1037975))

(declare-fun m!1037977 () Bool)

(assert (=> bm!47377 m!1037977))

(declare-fun m!1037979 () Bool)

(assert (=> b!1124137 m!1037979))

(declare-fun m!1037981 () Bool)

(assert (=> b!1124146 m!1037981))

(assert (=> b!1124146 m!1037977))

(declare-fun m!1037983 () Bool)

(assert (=> start!98000 m!1037983))

(declare-fun m!1037985 () Bool)

(assert (=> start!98000 m!1037985))

(declare-fun m!1037987 () Bool)

(assert (=> b!1124139 m!1037987))

(declare-fun m!1037989 () Bool)

(assert (=> b!1124147 m!1037989))

(declare-fun m!1037991 () Bool)

(assert (=> b!1124142 m!1037991))

(declare-fun m!1037993 () Bool)

(assert (=> b!1124141 m!1037993))

(declare-fun m!1037995 () Bool)

(assert (=> b!1124141 m!1037995))

(declare-fun m!1037997 () Bool)

(assert (=> bm!47378 m!1037997))

(declare-fun m!1037999 () Bool)

(assert (=> mapNonEmpty!44173 m!1037999))

(declare-fun m!1038001 () Bool)

(assert (=> b!1124148 m!1038001))

(declare-fun m!1038003 () Bool)

(assert (=> b!1124138 m!1038003))

(declare-fun m!1038005 () Bool)

(assert (=> b!1124138 m!1038005))

(declare-fun m!1038007 () Bool)

(assert (=> b!1124138 m!1038007))

(declare-fun m!1038009 () Bool)

(assert (=> b!1124138 m!1038009))

(declare-fun m!1038011 () Bool)

(assert (=> b!1124145 m!1038011))

(check-sat (not b!1124146) (not b!1124140) (not b_next!23707) b_and!38177 (not mapNonEmpty!44173) (not bm!47378) (not b!1124137) (not b!1124139) (not b!1124144) (not b!1124145) tp_is_empty!28237 (not b!1124147) (not b!1124148) (not b!1124138) (not b!1124150) (not start!98000) (not b_lambda!18659) (not b!1124154) (not bm!47377) (not b!1124141))
(check-sat b_and!38177 (not b_next!23707))
