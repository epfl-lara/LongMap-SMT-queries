; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101182 () Bool)

(assert start!101182)

(declare-fun b_free!25981 () Bool)

(declare-fun b_next!25981 () Bool)

(assert (=> start!101182 (= b_free!25981 (not b_next!25981))))

(declare-fun tp!90955 () Bool)

(declare-fun b_and!43027 () Bool)

(assert (=> start!101182 (= tp!90955 b_and!43027)))

(declare-fun b!1209943 () Bool)

(declare-fun c!119330 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!549045 () Bool)

(assert (=> b!1209943 (= c!119330 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549045))))

(declare-datatypes ((Unit!40021 0))(
  ( (Unit!40022) )
))
(declare-fun e!687279 () Unit!40021)

(declare-fun e!687272 () Unit!40021)

(assert (=> b!1209943 (= e!687279 e!687272)))

(declare-fun b!1209944 () Bool)

(declare-fun call!59258 () Bool)

(assert (=> b!1209944 call!59258))

(declare-fun lt!549038 () Unit!40021)

(declare-fun call!59263 () Unit!40021)

(assert (=> b!1209944 (= lt!549038 call!59263)))

(assert (=> b!1209944 (= e!687279 lt!549038)))

(declare-fun b!1209945 () Bool)

(declare-fun res!803893 () Bool)

(declare-fun e!687266 () Bool)

(assert (=> b!1209945 (=> res!803893 e!687266)))

(declare-datatypes ((List!26585 0))(
  ( (Nil!26582) (Cons!26581 (h!27799 (_ BitVec 64)) (t!39538 List!26585)) )
))
(declare-fun noDuplicate!1641 (List!26585) Bool)

(assert (=> b!1209945 (= res!803893 (not (noDuplicate!1641 Nil!26582)))))

(declare-fun bm!59255 () Bool)

(declare-datatypes ((V!46041 0))(
  ( (V!46042 (val!15399 Int)) )
))
(declare-datatypes ((tuple2!19778 0))(
  ( (tuple2!19779 (_1!9900 (_ BitVec 64)) (_2!9900 V!46041)) )
))
(declare-datatypes ((List!26586 0))(
  ( (Nil!26583) (Cons!26582 (h!27800 tuple2!19778) (t!39539 List!26586)) )
))
(declare-datatypes ((ListLongMap!17755 0))(
  ( (ListLongMap!17756 (toList!8893 List!26586)) )
))
(declare-fun call!59264 () ListLongMap!17755)

(declare-fun call!59262 () ListLongMap!17755)

(assert (=> bm!59255 (= call!59264 call!59262)))

(declare-fun e!687278 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1209946 () Bool)

(assert (=> b!1209946 (= e!687278 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549045) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!59257 () ListLongMap!17755)

(declare-fun call!59260 () ListLongMap!17755)

(declare-fun b!1209947 () Bool)

(declare-fun e!687280 () Bool)

(declare-fun -!1826 (ListLongMap!17755 (_ BitVec 64)) ListLongMap!17755)

(assert (=> b!1209947 (= e!687280 (= call!59257 (-!1826 call!59260 k0!934)))))

(declare-fun b!1209948 () Bool)

(declare-fun res!803898 () Bool)

(declare-fun e!687276 () Bool)

(assert (=> b!1209948 (=> (not res!803898) (not e!687276))))

(declare-datatypes ((array!78187 0))(
  ( (array!78188 (arr!37725 (Array (_ BitVec 32) (_ BitVec 64))) (size!38262 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78187)

(declare-fun arrayNoDuplicates!0 (array!78187 (_ BitVec 32) List!26585) Bool)

(assert (=> b!1209948 (= res!803898 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26582))))

(declare-fun b!1209949 () Bool)

(declare-fun res!803900 () Bool)

(declare-fun e!687274 () Bool)

(assert (=> b!1209949 (=> (not res!803900) (not e!687274))))

(declare-fun lt!549046 () array!78187)

(assert (=> b!1209949 (= res!803900 (arrayNoDuplicates!0 lt!549046 #b00000000000000000000000000000000 Nil!26582))))

(declare-fun b!1209950 () Bool)

(declare-fun e!687273 () Bool)

(declare-fun tp_is_empty!30685 () Bool)

(assert (=> b!1209950 (= e!687273 tp_is_empty!30685)))

(declare-fun b!1209951 () Bool)

(declare-fun e!687268 () Unit!40021)

(assert (=> b!1209951 (= e!687268 e!687279)))

(declare-fun c!119331 () Bool)

(assert (=> b!1209951 (= c!119331 (and (not lt!549045) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!59256 () Bool)

(declare-fun call!59261 () Unit!40021)

(assert (=> bm!59256 (= call!59263 call!59261)))

(declare-fun zeroValue!944 () V!46041)

(declare-fun bm!59257 () Bool)

(declare-fun lt!549035 () ListLongMap!17755)

(declare-fun c!119333 () Bool)

(declare-fun lt!549040 () ListLongMap!17755)

(declare-fun minValue!944 () V!46041)

(declare-fun addStillContains!1038 (ListLongMap!17755 (_ BitVec 64) V!46041 (_ BitVec 64)) Unit!40021)

(assert (=> bm!59257 (= call!59261 (addStillContains!1038 (ite c!119333 lt!549040 lt!549035) (ite c!119333 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119331 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119333 minValue!944 (ite c!119331 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209952 () Bool)

(declare-fun e!687270 () Bool)

(declare-fun e!687269 () Bool)

(assert (=> b!1209952 (= e!687270 e!687269)))

(declare-fun res!803890 () Bool)

(assert (=> b!1209952 (=> res!803890 e!687269)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1209952 (= res!803890 (not (= (select (arr!37725 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1209952 e!687280))

(declare-fun c!119332 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209952 (= c!119332 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549036 () Unit!40021)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14633 0))(
  ( (ValueCellFull!14633 (v!18044 V!46041)) (EmptyCell!14633) )
))
(declare-datatypes ((array!78189 0))(
  ( (array!78190 (arr!37726 (Array (_ BitVec 32) ValueCell!14633)) (size!38263 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78189)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1045 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40021)

(assert (=> b!1209952 (= lt!549036 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59258 () Bool)

(declare-fun call!59259 () Bool)

(assert (=> bm!59258 (= call!59258 call!59259)))

(declare-fun b!1209953 () Bool)

(declare-fun e!687281 () Bool)

(declare-fun e!687265 () Bool)

(declare-fun mapRes!47893 () Bool)

(assert (=> b!1209953 (= e!687281 (and e!687265 mapRes!47893))))

(declare-fun condMapEmpty!47893 () Bool)

(declare-fun mapDefault!47893 () ValueCell!14633)

(assert (=> b!1209953 (= condMapEmpty!47893 (= (arr!37726 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14633)) mapDefault!47893)))))

(declare-fun b!1209954 () Bool)

(declare-fun e!687275 () Bool)

(assert (=> b!1209954 (= e!687275 e!687270)))

(declare-fun res!803892 () Bool)

(assert (=> b!1209954 (=> res!803892 e!687270)))

(assert (=> b!1209954 (= res!803892 (not (= from!1455 i!673)))))

(declare-fun lt!549041 () array!78189)

(declare-fun lt!549037 () ListLongMap!17755)

(declare-fun getCurrentListMapNoExtraKeys!5355 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 32) Int) ListLongMap!17755)

(assert (=> b!1209954 (= lt!549037 (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3274 (Int (_ BitVec 64)) V!46041)

(assert (=> b!1209954 (= lt!549041 (array!78190 (store (arr!37726 _values!996) i!673 (ValueCellFull!14633 (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38263 _values!996)))))

(declare-fun lt!549034 () ListLongMap!17755)

(assert (=> b!1209954 (= lt!549034 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1209955 () Bool)

(declare-fun e!687277 () Bool)

(assert (=> b!1209955 (= e!687266 e!687277)))

(declare-fun res!803894 () Bool)

(assert (=> b!1209955 (=> (not res!803894) (not e!687277))))

(declare-fun contains!6978 (List!26585 (_ BitVec 64)) Bool)

(assert (=> b!1209955 (= res!803894 (not (contains!6978 Nil!26582 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1209956 () Bool)

(declare-fun e!687267 () Bool)

(assert (=> b!1209956 (= e!687269 e!687267)))

(declare-fun res!803902 () Bool)

(assert (=> b!1209956 (=> res!803902 e!687267)))

(declare-fun contains!6979 (ListLongMap!17755 (_ BitVec 64)) Bool)

(assert (=> b!1209956 (= res!803902 (not (contains!6979 lt!549035 k0!934)))))

(assert (=> b!1209956 (= lt!549035 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209957 () Bool)

(assert (=> b!1209957 (= e!687280 (= call!59257 call!59260))))

(declare-fun b!1209958 () Bool)

(declare-fun arrayContainsKey!0 (array!78187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209958 (= e!687278 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209959 () Bool)

(declare-fun res!803885 () Bool)

(assert (=> b!1209959 (=> (not res!803885) (not e!687276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209959 (= res!803885 (validKeyInArray!0 k0!934))))

(declare-fun res!803896 () Bool)

(assert (=> start!101182 (=> (not res!803896) (not e!687276))))

(assert (=> start!101182 (= res!803896 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38262 _keys!1208))))))

(assert (=> start!101182 e!687276))

(assert (=> start!101182 tp_is_empty!30685))

(declare-fun array_inv!28798 (array!78187) Bool)

(assert (=> start!101182 (array_inv!28798 _keys!1208)))

(assert (=> start!101182 true))

(assert (=> start!101182 tp!90955))

(declare-fun array_inv!28799 (array!78189) Bool)

(assert (=> start!101182 (and (array_inv!28799 _values!996) e!687281)))

(declare-fun bm!59254 () Bool)

(declare-fun +!4055 (ListLongMap!17755 tuple2!19778) ListLongMap!17755)

(assert (=> bm!59254 (= call!59262 (+!4055 lt!549035 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!59259 () Bool)

(assert (=> bm!59259 (= call!59259 (contains!6979 (ite c!119333 lt!549040 call!59264) k0!934))))

(declare-fun mapNonEmpty!47893 () Bool)

(declare-fun tp!90956 () Bool)

(assert (=> mapNonEmpty!47893 (= mapRes!47893 (and tp!90956 e!687273))))

(declare-fun mapRest!47893 () (Array (_ BitVec 32) ValueCell!14633))

(declare-fun mapValue!47893 () ValueCell!14633)

(declare-fun mapKey!47893 () (_ BitVec 32))

(assert (=> mapNonEmpty!47893 (= (arr!37726 _values!996) (store mapRest!47893 mapKey!47893 mapValue!47893))))

(declare-fun mapIsEmpty!47893 () Bool)

(assert (=> mapIsEmpty!47893 mapRes!47893))

(declare-fun b!1209960 () Bool)

(declare-fun lt!549033 () Unit!40021)

(assert (=> b!1209960 (= e!687268 lt!549033)))

(declare-fun lt!549044 () Unit!40021)

(assert (=> b!1209960 (= lt!549044 (addStillContains!1038 lt!549035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1209960 (= lt!549040 call!59262)))

(assert (=> b!1209960 call!59259))

(assert (=> b!1209960 (= lt!549033 call!59261)))

(assert (=> b!1209960 (contains!6979 (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1209961 () Bool)

(declare-fun res!803891 () Bool)

(assert (=> b!1209961 (=> (not res!803891) (not e!687276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78187 (_ BitVec 32)) Bool)

(assert (=> b!1209961 (= res!803891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209962 () Bool)

(declare-fun Unit!40023 () Unit!40021)

(assert (=> b!1209962 (= e!687272 Unit!40023)))

(declare-fun b!1209963 () Bool)

(assert (=> b!1209963 (= e!687265 tp_is_empty!30685)))

(declare-fun b!1209964 () Bool)

(assert (=> b!1209964 (= e!687274 (not e!687275))))

(declare-fun res!803895 () Bool)

(assert (=> b!1209964 (=> res!803895 e!687275)))

(assert (=> b!1209964 (= res!803895 (bvsgt from!1455 i!673))))

(assert (=> b!1209964 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549043 () Unit!40021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78187 (_ BitVec 64) (_ BitVec 32)) Unit!40021)

(assert (=> b!1209964 (= lt!549043 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209965 () Bool)

(declare-fun res!803899 () Bool)

(assert (=> b!1209965 (=> (not res!803899) (not e!687276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209965 (= res!803899 (validMask!0 mask!1564))))

(declare-fun bm!59260 () Bool)

(assert (=> bm!59260 (= call!59260 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209966 () Bool)

(declare-fun e!687282 () Bool)

(assert (=> b!1209966 (= e!687282 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209967 () Bool)

(declare-fun res!803889 () Bool)

(assert (=> b!1209967 (=> (not res!803889) (not e!687276))))

(assert (=> b!1209967 (= res!803889 (= (select (arr!37725 _keys!1208) i!673) k0!934))))

(declare-fun b!1209968 () Bool)

(assert (=> b!1209968 (= e!687267 e!687266)))

(declare-fun res!803887 () Bool)

(assert (=> b!1209968 (=> res!803887 e!687266)))

(assert (=> b!1209968 (= res!803887 (or (bvsge (size!38262 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)) (bvsge from!1455 (size!38262 _keys!1208))))))

(assert (=> b!1209968 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26582)))

(declare-fun lt!549039 () Unit!40021)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78187 (_ BitVec 32) (_ BitVec 32)) Unit!40021)

(assert (=> b!1209968 (= lt!549039 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209968 e!687282))

(declare-fun res!803886 () Bool)

(assert (=> b!1209968 (=> (not res!803886) (not e!687282))))

(assert (=> b!1209968 (= res!803886 e!687278)))

(declare-fun c!119329 () Bool)

(assert (=> b!1209968 (= c!119329 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549032 () Unit!40021)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!590 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 64) (_ BitVec 32) Int) Unit!40021)

(assert (=> b!1209968 (= lt!549032 (lemmaListMapContainsThenArrayContainsFrom!590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549042 () Unit!40021)

(assert (=> b!1209968 (= lt!549042 e!687268)))

(assert (=> b!1209968 (= c!119333 (and (not lt!549045) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209968 (= lt!549045 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209969 () Bool)

(assert (=> b!1209969 (= e!687276 e!687274)))

(declare-fun res!803888 () Bool)

(assert (=> b!1209969 (=> (not res!803888) (not e!687274))))

(assert (=> b!1209969 (= res!803888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549046 mask!1564))))

(assert (=> b!1209969 (= lt!549046 (array!78188 (store (arr!37725 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38262 _keys!1208)))))

(declare-fun bm!59261 () Bool)

(assert (=> bm!59261 (= call!59257 (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209970 () Bool)

(declare-fun lt!549047 () Unit!40021)

(assert (=> b!1209970 (= e!687272 lt!549047)))

(assert (=> b!1209970 (= lt!549047 call!59263)))

(assert (=> b!1209970 call!59258))

(declare-fun b!1209971 () Bool)

(declare-fun res!803897 () Bool)

(assert (=> b!1209971 (=> (not res!803897) (not e!687276))))

(assert (=> b!1209971 (= res!803897 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38262 _keys!1208))))))

(declare-fun b!1209972 () Bool)

(declare-fun res!803901 () Bool)

(assert (=> b!1209972 (=> (not res!803901) (not e!687276))))

(assert (=> b!1209972 (= res!803901 (and (= (size!38263 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38262 _keys!1208) (size!38263 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209973 () Bool)

(assert (=> b!1209973 (= e!687277 (not (contains!6978 Nil!26582 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101182 res!803896) b!1209965))

(assert (= (and b!1209965 res!803899) b!1209972))

(assert (= (and b!1209972 res!803901) b!1209961))

(assert (= (and b!1209961 res!803891) b!1209948))

(assert (= (and b!1209948 res!803898) b!1209971))

(assert (= (and b!1209971 res!803897) b!1209959))

(assert (= (and b!1209959 res!803885) b!1209967))

(assert (= (and b!1209967 res!803889) b!1209969))

(assert (= (and b!1209969 res!803888) b!1209949))

(assert (= (and b!1209949 res!803900) b!1209964))

(assert (= (and b!1209964 (not res!803895)) b!1209954))

(assert (= (and b!1209954 (not res!803892)) b!1209952))

(assert (= (and b!1209952 c!119332) b!1209947))

(assert (= (and b!1209952 (not c!119332)) b!1209957))

(assert (= (or b!1209947 b!1209957) bm!59261))

(assert (= (or b!1209947 b!1209957) bm!59260))

(assert (= (and b!1209952 (not res!803890)) b!1209956))

(assert (= (and b!1209956 (not res!803902)) b!1209968))

(assert (= (and b!1209968 c!119333) b!1209960))

(assert (= (and b!1209968 (not c!119333)) b!1209951))

(assert (= (and b!1209951 c!119331) b!1209944))

(assert (= (and b!1209951 (not c!119331)) b!1209943))

(assert (= (and b!1209943 c!119330) b!1209970))

(assert (= (and b!1209943 (not c!119330)) b!1209962))

(assert (= (or b!1209944 b!1209970) bm!59256))

(assert (= (or b!1209944 b!1209970) bm!59255))

(assert (= (or b!1209944 b!1209970) bm!59258))

(assert (= (or b!1209960 bm!59258) bm!59259))

(assert (= (or b!1209960 bm!59256) bm!59257))

(assert (= (or b!1209960 bm!59255) bm!59254))

(assert (= (and b!1209968 c!119329) b!1209958))

(assert (= (and b!1209968 (not c!119329)) b!1209946))

(assert (= (and b!1209968 res!803886) b!1209966))

(assert (= (and b!1209968 (not res!803887)) b!1209945))

(assert (= (and b!1209945 (not res!803893)) b!1209955))

(assert (= (and b!1209955 res!803894) b!1209973))

(assert (= (and b!1209953 condMapEmpty!47893) mapIsEmpty!47893))

(assert (= (and b!1209953 (not condMapEmpty!47893)) mapNonEmpty!47893))

(get-info :version)

(assert (= (and mapNonEmpty!47893 ((_ is ValueCellFull!14633) mapValue!47893)) b!1209950))

(assert (= (and b!1209953 ((_ is ValueCellFull!14633) mapDefault!47893)) b!1209963))

(assert (= start!101182 b!1209953))

(declare-fun b_lambda!21537 () Bool)

(assert (=> (not b_lambda!21537) (not b!1209954)))

(declare-fun t!39537 () Bool)

(declare-fun tb!10773 () Bool)

(assert (=> (and start!101182 (= defaultEntry!1004 defaultEntry!1004) t!39537) tb!10773))

(declare-fun result!22145 () Bool)

(assert (=> tb!10773 (= result!22145 tp_is_empty!30685)))

(assert (=> b!1209954 t!39537))

(declare-fun b_and!43029 () Bool)

(assert (= b_and!43027 (and (=> t!39537 result!22145) b_and!43029)))

(declare-fun m!1116041 () Bool)

(assert (=> bm!59260 m!1116041))

(declare-fun m!1116043 () Bool)

(assert (=> b!1209952 m!1116043))

(declare-fun m!1116045 () Bool)

(assert (=> b!1209952 m!1116045))

(declare-fun m!1116047 () Bool)

(assert (=> b!1209973 m!1116047))

(declare-fun m!1116049 () Bool)

(assert (=> b!1209948 m!1116049))

(declare-fun m!1116051 () Bool)

(assert (=> b!1209949 m!1116051))

(declare-fun m!1116053 () Bool)

(assert (=> b!1209968 m!1116053))

(declare-fun m!1116055 () Bool)

(assert (=> b!1209968 m!1116055))

(declare-fun m!1116057 () Bool)

(assert (=> b!1209968 m!1116057))

(declare-fun m!1116059 () Bool)

(assert (=> b!1209956 m!1116059))

(assert (=> b!1209956 m!1116041))

(declare-fun m!1116061 () Bool)

(assert (=> b!1209966 m!1116061))

(declare-fun m!1116063 () Bool)

(assert (=> bm!59259 m!1116063))

(declare-fun m!1116065 () Bool)

(assert (=> b!1209945 m!1116065))

(declare-fun m!1116067 () Bool)

(assert (=> b!1209969 m!1116067))

(declare-fun m!1116069 () Bool)

(assert (=> b!1209969 m!1116069))

(declare-fun m!1116071 () Bool)

(assert (=> mapNonEmpty!47893 m!1116071))

(declare-fun m!1116073 () Bool)

(assert (=> b!1209947 m!1116073))

(declare-fun m!1116075 () Bool)

(assert (=> b!1209959 m!1116075))

(declare-fun m!1116077 () Bool)

(assert (=> b!1209960 m!1116077))

(declare-fun m!1116079 () Bool)

(assert (=> b!1209960 m!1116079))

(assert (=> b!1209960 m!1116079))

(declare-fun m!1116081 () Bool)

(assert (=> b!1209960 m!1116081))

(declare-fun m!1116083 () Bool)

(assert (=> b!1209961 m!1116083))

(assert (=> b!1209958 m!1116061))

(declare-fun m!1116085 () Bool)

(assert (=> bm!59257 m!1116085))

(declare-fun m!1116087 () Bool)

(assert (=> bm!59254 m!1116087))

(declare-fun m!1116089 () Bool)

(assert (=> start!101182 m!1116089))

(declare-fun m!1116091 () Bool)

(assert (=> start!101182 m!1116091))

(declare-fun m!1116093 () Bool)

(assert (=> b!1209954 m!1116093))

(declare-fun m!1116095 () Bool)

(assert (=> b!1209954 m!1116095))

(declare-fun m!1116097 () Bool)

(assert (=> b!1209954 m!1116097))

(declare-fun m!1116099 () Bool)

(assert (=> b!1209954 m!1116099))

(declare-fun m!1116101 () Bool)

(assert (=> b!1209955 m!1116101))

(declare-fun m!1116103 () Bool)

(assert (=> bm!59261 m!1116103))

(declare-fun m!1116105 () Bool)

(assert (=> b!1209964 m!1116105))

(declare-fun m!1116107 () Bool)

(assert (=> b!1209964 m!1116107))

(declare-fun m!1116109 () Bool)

(assert (=> b!1209965 m!1116109))

(declare-fun m!1116111 () Bool)

(assert (=> b!1209967 m!1116111))

(check-sat (not b!1209948) tp_is_empty!30685 (not b!1209960) (not b!1209945) (not bm!59260) (not b!1209958) b_and!43029 (not b!1209956) (not b!1209968) (not b!1209952) (not bm!59261) (not b_lambda!21537) (not b!1209965) (not mapNonEmpty!47893) (not b!1209954) (not b!1209949) (not b!1209955) (not bm!59259) (not b!1209969) (not start!101182) (not b!1209973) (not b!1209966) (not b!1209959) (not bm!59254) (not bm!59257) (not b!1209947) (not b!1209961) (not b_next!25981) (not b!1209964))
(check-sat b_and!43029 (not b_next!25981))
(get-model)

(declare-fun b_lambda!21543 () Bool)

(assert (= b_lambda!21537 (or (and start!101182 b_free!25981) b_lambda!21543)))

(check-sat (not b!1209965) (not b_lambda!21543) (not b!1209948) tp_is_empty!30685 (not b!1209960) (not b!1209945) (not bm!59260) (not b!1209958) b_and!43029 (not b!1209956) (not b!1209968) (not b!1209952) (not bm!59261) (not mapNonEmpty!47893) (not b!1209954) (not b!1209949) (not b!1209955) (not bm!59259) (not b!1209969) (not start!101182) (not b!1209973) (not b!1209966) (not b!1209959) (not bm!59254) (not bm!59257) (not b!1209947) (not b!1209961) (not b_next!25981) (not b!1209964))
(check-sat b_and!43029 (not b_next!25981))
(get-model)

(declare-fun b!1210176 () Bool)

(declare-fun e!687399 () Bool)

(declare-fun call!59315 () Bool)

(assert (=> b!1210176 (= e!687399 call!59315)))

(declare-fun d!133719 () Bool)

(declare-fun res!804017 () Bool)

(declare-fun e!687402 () Bool)

(assert (=> d!133719 (=> res!804017 e!687402)))

(assert (=> d!133719 (= res!804017 (bvsge #b00000000000000000000000000000000 (size!38262 lt!549046)))))

(assert (=> d!133719 (= (arrayNoDuplicates!0 lt!549046 #b00000000000000000000000000000000 Nil!26582) e!687402)))

(declare-fun b!1210177 () Bool)

(declare-fun e!687400 () Bool)

(assert (=> b!1210177 (= e!687400 e!687399)))

(declare-fun c!119366 () Bool)

(assert (=> b!1210177 (= c!119366 (validKeyInArray!0 (select (arr!37725 lt!549046) #b00000000000000000000000000000000)))))

(declare-fun b!1210178 () Bool)

(assert (=> b!1210178 (= e!687399 call!59315)))

(declare-fun b!1210179 () Bool)

(assert (=> b!1210179 (= e!687402 e!687400)))

(declare-fun res!804018 () Bool)

(assert (=> b!1210179 (=> (not res!804018) (not e!687400))))

(declare-fun e!687401 () Bool)

(assert (=> b!1210179 (= res!804018 (not e!687401))))

(declare-fun res!804019 () Bool)

(assert (=> b!1210179 (=> (not res!804019) (not e!687401))))

(assert (=> b!1210179 (= res!804019 (validKeyInArray!0 (select (arr!37725 lt!549046) #b00000000000000000000000000000000)))))

(declare-fun bm!59312 () Bool)

(assert (=> bm!59312 (= call!59315 (arrayNoDuplicates!0 lt!549046 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119366 (Cons!26581 (select (arr!37725 lt!549046) #b00000000000000000000000000000000) Nil!26582) Nil!26582)))))

(declare-fun b!1210180 () Bool)

(assert (=> b!1210180 (= e!687401 (contains!6978 Nil!26582 (select (arr!37725 lt!549046) #b00000000000000000000000000000000)))))

(assert (= (and d!133719 (not res!804017)) b!1210179))

(assert (= (and b!1210179 res!804019) b!1210180))

(assert (= (and b!1210179 res!804018) b!1210177))

(assert (= (and b!1210177 c!119366) b!1210178))

(assert (= (and b!1210177 (not c!119366)) b!1210176))

(assert (= (or b!1210178 b!1210176) bm!59312))

(declare-fun m!1116257 () Bool)

(assert (=> b!1210177 m!1116257))

(assert (=> b!1210177 m!1116257))

(declare-fun m!1116259 () Bool)

(assert (=> b!1210177 m!1116259))

(assert (=> b!1210179 m!1116257))

(assert (=> b!1210179 m!1116257))

(assert (=> b!1210179 m!1116259))

(assert (=> bm!59312 m!1116257))

(declare-fun m!1116261 () Bool)

(assert (=> bm!59312 m!1116261))

(assert (=> b!1210180 m!1116257))

(assert (=> b!1210180 m!1116257))

(declare-fun m!1116263 () Bool)

(assert (=> b!1210180 m!1116263))

(assert (=> b!1209949 d!133719))

(declare-fun d!133721 () Bool)

(declare-fun res!804024 () Bool)

(declare-fun e!687407 () Bool)

(assert (=> d!133721 (=> res!804024 e!687407)))

(assert (=> d!133721 (= res!804024 (= (select (arr!37725 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133721 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!687407)))

(declare-fun b!1210185 () Bool)

(declare-fun e!687408 () Bool)

(assert (=> b!1210185 (= e!687407 e!687408)))

(declare-fun res!804025 () Bool)

(assert (=> b!1210185 (=> (not res!804025) (not e!687408))))

(assert (=> b!1210185 (= res!804025 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38262 _keys!1208)))))

(declare-fun b!1210186 () Bool)

(assert (=> b!1210186 (= e!687408 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133721 (not res!804024)) b!1210185))

(assert (= (and b!1210185 res!804025) b!1210186))

(declare-fun m!1116265 () Bool)

(assert (=> d!133721 m!1116265))

(declare-fun m!1116267 () Bool)

(assert (=> b!1210186 m!1116267))

(assert (=> b!1209964 d!133721))

(declare-fun d!133723 () Bool)

(assert (=> d!133723 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549146 () Unit!40021)

(declare-fun choose!13 (array!78187 (_ BitVec 64) (_ BitVec 32)) Unit!40021)

(assert (=> d!133723 (= lt!549146 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133723 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133723 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!549146)))

(declare-fun bs!34184 () Bool)

(assert (= bs!34184 d!133723))

(assert (=> bs!34184 m!1116105))

(declare-fun m!1116269 () Bool)

(assert (=> bs!34184 m!1116269))

(assert (=> b!1209964 d!133723))

(declare-fun b!1210211 () Bool)

(declare-fun res!804036 () Bool)

(declare-fun e!687429 () Bool)

(assert (=> b!1210211 (=> (not res!804036) (not e!687429))))

(declare-fun lt!549164 () ListLongMap!17755)

(assert (=> b!1210211 (= res!804036 (not (contains!6979 lt!549164 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210212 () Bool)

(assert (=> b!1210212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)))))

(assert (=> b!1210212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38263 _values!996)))))

(declare-fun e!687425 () Bool)

(declare-fun apply!976 (ListLongMap!17755 (_ BitVec 64)) V!46041)

(declare-fun get!19274 (ValueCell!14633 V!46041) V!46041)

(assert (=> b!1210212 (= e!687425 (= (apply!976 lt!549164 (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19274 (select (arr!37726 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210213 () Bool)

(declare-fun e!687428 () Bool)

(declare-fun e!687423 () Bool)

(assert (=> b!1210213 (= e!687428 e!687423)))

(declare-fun c!119377 () Bool)

(assert (=> b!1210213 (= c!119377 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)))))

(declare-fun bm!59315 () Bool)

(declare-fun call!59318 () ListLongMap!17755)

(assert (=> bm!59315 (= call!59318 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210215 () Bool)

(declare-fun lt!549165 () Unit!40021)

(declare-fun lt!549163 () Unit!40021)

(assert (=> b!1210215 (= lt!549165 lt!549163)))

(declare-fun lt!549162 () (_ BitVec 64))

(declare-fun lt!549167 () ListLongMap!17755)

(declare-fun lt!549166 () (_ BitVec 64))

(declare-fun lt!549161 () V!46041)

(assert (=> b!1210215 (not (contains!6979 (+!4055 lt!549167 (tuple2!19779 lt!549166 lt!549161)) lt!549162))))

(declare-fun addStillNotContains!297 (ListLongMap!17755 (_ BitVec 64) V!46041 (_ BitVec 64)) Unit!40021)

(assert (=> b!1210215 (= lt!549163 (addStillNotContains!297 lt!549167 lt!549166 lt!549161 lt!549162))))

(assert (=> b!1210215 (= lt!549162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210215 (= lt!549161 (get!19274 (select (arr!37726 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210215 (= lt!549166 (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1210215 (= lt!549167 call!59318)))

(declare-fun e!687426 () ListLongMap!17755)

(assert (=> b!1210215 (= e!687426 (+!4055 call!59318 (tuple2!19779 (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19274 (select (arr!37726 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210216 () Bool)

(declare-fun isEmpty!995 (ListLongMap!17755) Bool)

(assert (=> b!1210216 (= e!687423 (isEmpty!995 lt!549164))))

(declare-fun b!1210217 () Bool)

(declare-fun e!687424 () Bool)

(assert (=> b!1210217 (= e!687424 (validKeyInArray!0 (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210217 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1210218 () Bool)

(declare-fun e!687427 () ListLongMap!17755)

(assert (=> b!1210218 (= e!687427 (ListLongMap!17756 Nil!26583))))

(declare-fun b!1210219 () Bool)

(assert (=> b!1210219 (= e!687429 e!687428)))

(declare-fun c!119376 () Bool)

(assert (=> b!1210219 (= c!119376 e!687424)))

(declare-fun res!804034 () Bool)

(assert (=> b!1210219 (=> (not res!804034) (not e!687424))))

(assert (=> b!1210219 (= res!804034 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)))))

(declare-fun b!1210220 () Bool)

(assert (=> b!1210220 (= e!687427 e!687426)))

(declare-fun c!119375 () Bool)

(assert (=> b!1210220 (= c!119375 (validKeyInArray!0 (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133725 () Bool)

(assert (=> d!133725 e!687429))

(declare-fun res!804035 () Bool)

(assert (=> d!133725 (=> (not res!804035) (not e!687429))))

(assert (=> d!133725 (= res!804035 (not (contains!6979 lt!549164 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133725 (= lt!549164 e!687427)))

(declare-fun c!119378 () Bool)

(assert (=> d!133725 (= c!119378 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)))))

(assert (=> d!133725 (validMask!0 mask!1564)))

(assert (=> d!133725 (= (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549164)))

(declare-fun b!1210214 () Bool)

(assert (=> b!1210214 (= e!687428 e!687425)))

(assert (=> b!1210214 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)))))

(declare-fun res!804037 () Bool)

(assert (=> b!1210214 (= res!804037 (contains!6979 lt!549164 (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210214 (=> (not res!804037) (not e!687425))))

(declare-fun b!1210221 () Bool)

(assert (=> b!1210221 (= e!687426 call!59318)))

(declare-fun b!1210222 () Bool)

(assert (=> b!1210222 (= e!687423 (= lt!549164 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133725 c!119378) b!1210218))

(assert (= (and d!133725 (not c!119378)) b!1210220))

(assert (= (and b!1210220 c!119375) b!1210215))

(assert (= (and b!1210220 (not c!119375)) b!1210221))

(assert (= (or b!1210215 b!1210221) bm!59315))

(assert (= (and d!133725 res!804035) b!1210211))

(assert (= (and b!1210211 res!804036) b!1210219))

(assert (= (and b!1210219 res!804034) b!1210217))

(assert (= (and b!1210219 c!119376) b!1210214))

(assert (= (and b!1210219 (not c!119376)) b!1210213))

(assert (= (and b!1210214 res!804037) b!1210212))

(assert (= (and b!1210213 c!119377) b!1210222))

(assert (= (and b!1210213 (not c!119377)) b!1210216))

(declare-fun b_lambda!21545 () Bool)

(assert (=> (not b_lambda!21545) (not b!1210212)))

(assert (=> b!1210212 t!39537))

(declare-fun b_and!43039 () Bool)

(assert (= b_and!43029 (and (=> t!39537 result!22145) b_and!43039)))

(declare-fun b_lambda!21547 () Bool)

(assert (=> (not b_lambda!21547) (not b!1210215)))

(assert (=> b!1210215 t!39537))

(declare-fun b_and!43041 () Bool)

(assert (= b_and!43039 (and (=> t!39537 result!22145) b_and!43041)))

(assert (=> b!1210212 m!1116095))

(declare-fun m!1116271 () Bool)

(assert (=> b!1210212 m!1116271))

(declare-fun m!1116273 () Bool)

(assert (=> b!1210212 m!1116273))

(declare-fun m!1116275 () Bool)

(assert (=> b!1210212 m!1116275))

(assert (=> b!1210212 m!1116095))

(declare-fun m!1116277 () Bool)

(assert (=> b!1210212 m!1116277))

(assert (=> b!1210212 m!1116275))

(assert (=> b!1210212 m!1116271))

(assert (=> b!1210215 m!1116095))

(declare-fun m!1116279 () Bool)

(assert (=> b!1210215 m!1116279))

(declare-fun m!1116281 () Bool)

(assert (=> b!1210215 m!1116281))

(declare-fun m!1116283 () Bool)

(assert (=> b!1210215 m!1116283))

(assert (=> b!1210215 m!1116279))

(assert (=> b!1210215 m!1116275))

(assert (=> b!1210215 m!1116271))

(declare-fun m!1116285 () Bool)

(assert (=> b!1210215 m!1116285))

(assert (=> b!1210215 m!1116275))

(assert (=> b!1210215 m!1116095))

(assert (=> b!1210215 m!1116277))

(declare-fun m!1116287 () Bool)

(assert (=> b!1210222 m!1116287))

(declare-fun m!1116289 () Bool)

(assert (=> b!1210216 m!1116289))

(assert (=> b!1210214 m!1116271))

(assert (=> b!1210214 m!1116271))

(declare-fun m!1116291 () Bool)

(assert (=> b!1210214 m!1116291))

(assert (=> b!1210217 m!1116271))

(assert (=> b!1210217 m!1116271))

(declare-fun m!1116293 () Bool)

(assert (=> b!1210217 m!1116293))

(assert (=> bm!59315 m!1116287))

(declare-fun m!1116295 () Bool)

(assert (=> d!133725 m!1116295))

(assert (=> d!133725 m!1116109))

(declare-fun m!1116297 () Bool)

(assert (=> b!1210211 m!1116297))

(assert (=> b!1210220 m!1116271))

(assert (=> b!1210220 m!1116271))

(assert (=> b!1210220 m!1116293))

(assert (=> bm!59260 d!133725))

(declare-fun d!133727 () Bool)

(assert (=> d!133727 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1209965 d!133727))

(declare-fun d!133729 () Bool)

(declare-fun res!804038 () Bool)

(declare-fun e!687430 () Bool)

(assert (=> d!133729 (=> res!804038 e!687430)))

(assert (=> d!133729 (= res!804038 (= (select (arr!37725 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133729 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!687430)))

(declare-fun b!1210223 () Bool)

(declare-fun e!687431 () Bool)

(assert (=> b!1210223 (= e!687430 e!687431)))

(declare-fun res!804039 () Bool)

(assert (=> b!1210223 (=> (not res!804039) (not e!687431))))

(assert (=> b!1210223 (= res!804039 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38262 _keys!1208)))))

(declare-fun b!1210224 () Bool)

(assert (=> b!1210224 (= e!687431 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133729 (not res!804038)) b!1210223))

(assert (= (and b!1210223 res!804039) b!1210224))

(assert (=> d!133729 m!1116271))

(declare-fun m!1116299 () Bool)

(assert (=> b!1210224 m!1116299))

(assert (=> b!1209966 d!133729))

(declare-fun d!133731 () Bool)

(assert (=> d!133731 (contains!6979 (+!4055 (ite c!119333 lt!549040 lt!549035) (tuple2!19779 (ite c!119333 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119331 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119333 minValue!944 (ite c!119331 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!549170 () Unit!40021)

(declare-fun choose!1815 (ListLongMap!17755 (_ BitVec 64) V!46041 (_ BitVec 64)) Unit!40021)

(assert (=> d!133731 (= lt!549170 (choose!1815 (ite c!119333 lt!549040 lt!549035) (ite c!119333 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119331 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119333 minValue!944 (ite c!119331 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133731 (contains!6979 (ite c!119333 lt!549040 lt!549035) k0!934)))

(assert (=> d!133731 (= (addStillContains!1038 (ite c!119333 lt!549040 lt!549035) (ite c!119333 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119331 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119333 minValue!944 (ite c!119331 zeroValue!944 minValue!944)) k0!934) lt!549170)))

(declare-fun bs!34185 () Bool)

(assert (= bs!34185 d!133731))

(declare-fun m!1116301 () Bool)

(assert (=> bs!34185 m!1116301))

(assert (=> bs!34185 m!1116301))

(declare-fun m!1116303 () Bool)

(assert (=> bs!34185 m!1116303))

(declare-fun m!1116305 () Bool)

(assert (=> bs!34185 m!1116305))

(declare-fun m!1116307 () Bool)

(assert (=> bs!34185 m!1116307))

(assert (=> bm!59257 d!133731))

(declare-fun d!133733 () Bool)

(declare-fun res!804044 () Bool)

(declare-fun e!687436 () Bool)

(assert (=> d!133733 (=> res!804044 e!687436)))

(assert (=> d!133733 (= res!804044 ((_ is Nil!26582) Nil!26582))))

(assert (=> d!133733 (= (noDuplicate!1641 Nil!26582) e!687436)))

(declare-fun b!1210230 () Bool)

(declare-fun e!687437 () Bool)

(assert (=> b!1210230 (= e!687436 e!687437)))

(declare-fun res!804045 () Bool)

(assert (=> b!1210230 (=> (not res!804045) (not e!687437))))

(assert (=> b!1210230 (= res!804045 (not (contains!6978 (t!39538 Nil!26582) (h!27799 Nil!26582))))))

(declare-fun b!1210231 () Bool)

(assert (=> b!1210231 (= e!687437 (noDuplicate!1641 (t!39538 Nil!26582)))))

(assert (= (and d!133733 (not res!804044)) b!1210230))

(assert (= (and b!1210230 res!804045) b!1210231))

(declare-fun m!1116309 () Bool)

(assert (=> b!1210230 m!1116309))

(declare-fun m!1116311 () Bool)

(assert (=> b!1210231 m!1116311))

(assert (=> b!1209945 d!133733))

(declare-fun d!133735 () Bool)

(assert (=> d!133735 (contains!6979 (+!4055 lt!549035 (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!549171 () Unit!40021)

(assert (=> d!133735 (= lt!549171 (choose!1815 lt!549035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133735 (contains!6979 lt!549035 k0!934)))

(assert (=> d!133735 (= (addStillContains!1038 lt!549035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!549171)))

(declare-fun bs!34186 () Bool)

(assert (= bs!34186 d!133735))

(declare-fun m!1116313 () Bool)

(assert (=> bs!34186 m!1116313))

(assert (=> bs!34186 m!1116313))

(declare-fun m!1116315 () Bool)

(assert (=> bs!34186 m!1116315))

(declare-fun m!1116317 () Bool)

(assert (=> bs!34186 m!1116317))

(assert (=> bs!34186 m!1116059))

(assert (=> b!1209960 d!133735))

(declare-fun d!133737 () Bool)

(declare-fun e!687443 () Bool)

(assert (=> d!133737 e!687443))

(declare-fun res!804048 () Bool)

(assert (=> d!133737 (=> res!804048 e!687443)))

(declare-fun lt!549182 () Bool)

(assert (=> d!133737 (= res!804048 (not lt!549182))))

(declare-fun lt!549183 () Bool)

(assert (=> d!133737 (= lt!549182 lt!549183)))

(declare-fun lt!549180 () Unit!40021)

(declare-fun e!687442 () Unit!40021)

(assert (=> d!133737 (= lt!549180 e!687442)))

(declare-fun c!119381 () Bool)

(assert (=> d!133737 (= c!119381 lt!549183)))

(declare-fun containsKey!596 (List!26586 (_ BitVec 64)) Bool)

(assert (=> d!133737 (= lt!549183 (containsKey!596 (toList!8893 (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133737 (= (contains!6979 (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!549182)))

(declare-fun b!1210238 () Bool)

(declare-fun lt!549181 () Unit!40021)

(assert (=> b!1210238 (= e!687442 lt!549181)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!424 (List!26586 (_ BitVec 64)) Unit!40021)

(assert (=> b!1210238 (= lt!549181 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8893 (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!685 0))(
  ( (Some!684 (v!18048 V!46041)) (None!683) )
))
(declare-fun isDefined!462 (Option!685) Bool)

(declare-fun getValueByKey!634 (List!26586 (_ BitVec 64)) Option!685)

(assert (=> b!1210238 (isDefined!462 (getValueByKey!634 (toList!8893 (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1210239 () Bool)

(declare-fun Unit!40029 () Unit!40021)

(assert (=> b!1210239 (= e!687442 Unit!40029)))

(declare-fun b!1210240 () Bool)

(assert (=> b!1210240 (= e!687443 (isDefined!462 (getValueByKey!634 (toList!8893 (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133737 c!119381) b!1210238))

(assert (= (and d!133737 (not c!119381)) b!1210239))

(assert (= (and d!133737 (not res!804048)) b!1210240))

(declare-fun m!1116319 () Bool)

(assert (=> d!133737 m!1116319))

(declare-fun m!1116321 () Bool)

(assert (=> b!1210238 m!1116321))

(declare-fun m!1116323 () Bool)

(assert (=> b!1210238 m!1116323))

(assert (=> b!1210238 m!1116323))

(declare-fun m!1116325 () Bool)

(assert (=> b!1210238 m!1116325))

(assert (=> b!1210240 m!1116323))

(assert (=> b!1210240 m!1116323))

(assert (=> b!1210240 m!1116325))

(assert (=> b!1209960 d!133737))

(declare-fun d!133739 () Bool)

(declare-fun e!687446 () Bool)

(assert (=> d!133739 e!687446))

(declare-fun res!804054 () Bool)

(assert (=> d!133739 (=> (not res!804054) (not e!687446))))

(declare-fun lt!549195 () ListLongMap!17755)

(assert (=> d!133739 (= res!804054 (contains!6979 lt!549195 (_1!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!549193 () List!26586)

(assert (=> d!133739 (= lt!549195 (ListLongMap!17756 lt!549193))))

(declare-fun lt!549194 () Unit!40021)

(declare-fun lt!549192 () Unit!40021)

(assert (=> d!133739 (= lt!549194 lt!549192)))

(assert (=> d!133739 (= (getValueByKey!634 lt!549193 (_1!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!684 (_2!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!316 (List!26586 (_ BitVec 64) V!46041) Unit!40021)

(assert (=> d!133739 (= lt!549192 (lemmaContainsTupThenGetReturnValue!316 lt!549193 (_1!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!409 (List!26586 (_ BitVec 64) V!46041) List!26586)

(assert (=> d!133739 (= lt!549193 (insertStrictlySorted!409 (toList!8893 lt!549040) (_1!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133739 (= (+!4055 lt!549040 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!549195)))

(declare-fun b!1210245 () Bool)

(declare-fun res!804053 () Bool)

(assert (=> b!1210245 (=> (not res!804053) (not e!687446))))

(assert (=> b!1210245 (= res!804053 (= (getValueByKey!634 (toList!8893 lt!549195) (_1!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!684 (_2!9900 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210246 () Bool)

(declare-fun contains!6984 (List!26586 tuple2!19778) Bool)

(assert (=> b!1210246 (= e!687446 (contains!6984 (toList!8893 lt!549195) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133739 res!804054) b!1210245))

(assert (= (and b!1210245 res!804053) b!1210246))

(declare-fun m!1116327 () Bool)

(assert (=> d!133739 m!1116327))

(declare-fun m!1116329 () Bool)

(assert (=> d!133739 m!1116329))

(declare-fun m!1116331 () Bool)

(assert (=> d!133739 m!1116331))

(declare-fun m!1116333 () Bool)

(assert (=> d!133739 m!1116333))

(declare-fun m!1116335 () Bool)

(assert (=> b!1210245 m!1116335))

(declare-fun m!1116337 () Bool)

(assert (=> b!1210246 m!1116337))

(assert (=> b!1209960 d!133739))

(declare-fun bm!59318 () Bool)

(declare-fun call!59321 () Bool)

(assert (=> bm!59318 (= call!59321 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!133741 () Bool)

(declare-fun res!804060 () Bool)

(declare-fun e!687453 () Bool)

(assert (=> d!133741 (=> res!804060 e!687453)))

(assert (=> d!133741 (= res!804060 (bvsge #b00000000000000000000000000000000 (size!38262 _keys!1208)))))

(assert (=> d!133741 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!687453)))

(declare-fun b!1210255 () Bool)

(declare-fun e!687454 () Bool)

(assert (=> b!1210255 (= e!687454 call!59321)))

(declare-fun b!1210256 () Bool)

(declare-fun e!687455 () Bool)

(assert (=> b!1210256 (= e!687455 call!59321)))

(declare-fun b!1210257 () Bool)

(assert (=> b!1210257 (= e!687453 e!687455)))

(declare-fun c!119384 () Bool)

(assert (=> b!1210257 (= c!119384 (validKeyInArray!0 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1210258 () Bool)

(assert (=> b!1210258 (= e!687455 e!687454)))

(declare-fun lt!549204 () (_ BitVec 64))

(assert (=> b!1210258 (= lt!549204 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!549203 () Unit!40021)

(assert (=> b!1210258 (= lt!549203 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!549204 #b00000000000000000000000000000000))))

(assert (=> b!1210258 (arrayContainsKey!0 _keys!1208 lt!549204 #b00000000000000000000000000000000)))

(declare-fun lt!549202 () Unit!40021)

(assert (=> b!1210258 (= lt!549202 lt!549203)))

(declare-fun res!804059 () Bool)

(declare-datatypes ((SeekEntryResult!9896 0))(
  ( (MissingZero!9896 (index!41955 (_ BitVec 32))) (Found!9896 (index!41956 (_ BitVec 32))) (Intermediate!9896 (undefined!10708 Bool) (index!41957 (_ BitVec 32)) (x!106628 (_ BitVec 32))) (Undefined!9896) (MissingVacant!9896 (index!41958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78187 (_ BitVec 32)) SeekEntryResult!9896)

(assert (=> b!1210258 (= res!804059 (= (seekEntryOrOpen!0 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9896 #b00000000000000000000000000000000)))))

(assert (=> b!1210258 (=> (not res!804059) (not e!687454))))

(assert (= (and d!133741 (not res!804060)) b!1210257))

(assert (= (and b!1210257 c!119384) b!1210258))

(assert (= (and b!1210257 (not c!119384)) b!1210256))

(assert (= (and b!1210258 res!804059) b!1210255))

(assert (= (or b!1210255 b!1210256) bm!59318))

(declare-fun m!1116339 () Bool)

(assert (=> bm!59318 m!1116339))

(assert (=> b!1210257 m!1116265))

(assert (=> b!1210257 m!1116265))

(declare-fun m!1116341 () Bool)

(assert (=> b!1210257 m!1116341))

(assert (=> b!1210258 m!1116265))

(declare-fun m!1116343 () Bool)

(assert (=> b!1210258 m!1116343))

(declare-fun m!1116345 () Bool)

(assert (=> b!1210258 m!1116345))

(assert (=> b!1210258 m!1116265))

(declare-fun m!1116347 () Bool)

(assert (=> b!1210258 m!1116347))

(assert (=> b!1209961 d!133741))

(declare-fun b!1210259 () Bool)

(declare-fun e!687456 () Bool)

(declare-fun call!59322 () Bool)

(assert (=> b!1210259 (= e!687456 call!59322)))

(declare-fun d!133743 () Bool)

(declare-fun res!804061 () Bool)

(declare-fun e!687459 () Bool)

(assert (=> d!133743 (=> res!804061 e!687459)))

(assert (=> d!133743 (= res!804061 (bvsge #b00000000000000000000000000000000 (size!38262 _keys!1208)))))

(assert (=> d!133743 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26582) e!687459)))

(declare-fun b!1210260 () Bool)

(declare-fun e!687457 () Bool)

(assert (=> b!1210260 (= e!687457 e!687456)))

(declare-fun c!119385 () Bool)

(assert (=> b!1210260 (= c!119385 (validKeyInArray!0 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1210261 () Bool)

(assert (=> b!1210261 (= e!687456 call!59322)))

(declare-fun b!1210262 () Bool)

(assert (=> b!1210262 (= e!687459 e!687457)))

(declare-fun res!804062 () Bool)

(assert (=> b!1210262 (=> (not res!804062) (not e!687457))))

(declare-fun e!687458 () Bool)

(assert (=> b!1210262 (= res!804062 (not e!687458))))

(declare-fun res!804063 () Bool)

(assert (=> b!1210262 (=> (not res!804063) (not e!687458))))

(assert (=> b!1210262 (= res!804063 (validKeyInArray!0 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!59319 () Bool)

(assert (=> bm!59319 (= call!59322 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119385 (Cons!26581 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000) Nil!26582) Nil!26582)))))

(declare-fun b!1210263 () Bool)

(assert (=> b!1210263 (= e!687458 (contains!6978 Nil!26582 (select (arr!37725 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133743 (not res!804061)) b!1210262))

(assert (= (and b!1210262 res!804063) b!1210263))

(assert (= (and b!1210262 res!804062) b!1210260))

(assert (= (and b!1210260 c!119385) b!1210261))

(assert (= (and b!1210260 (not c!119385)) b!1210259))

(assert (= (or b!1210261 b!1210259) bm!59319))

(assert (=> b!1210260 m!1116265))

(assert (=> b!1210260 m!1116265))

(assert (=> b!1210260 m!1116341))

(assert (=> b!1210262 m!1116265))

(assert (=> b!1210262 m!1116265))

(assert (=> b!1210262 m!1116341))

(assert (=> bm!59319 m!1116265))

(declare-fun m!1116349 () Bool)

(assert (=> bm!59319 m!1116349))

(assert (=> b!1210263 m!1116265))

(assert (=> b!1210263 m!1116265))

(declare-fun m!1116351 () Bool)

(assert (=> b!1210263 m!1116351))

(assert (=> b!1209948 d!133743))

(declare-fun d!133745 () Bool)

(declare-fun lt!549207 () ListLongMap!17755)

(assert (=> d!133745 (not (contains!6979 lt!549207 k0!934))))

(declare-fun removeStrictlySorted!99 (List!26586 (_ BitVec 64)) List!26586)

(assert (=> d!133745 (= lt!549207 (ListLongMap!17756 (removeStrictlySorted!99 (toList!8893 call!59260) k0!934)))))

(assert (=> d!133745 (= (-!1826 call!59260 k0!934) lt!549207)))

(declare-fun bs!34187 () Bool)

(assert (= bs!34187 d!133745))

(declare-fun m!1116353 () Bool)

(assert (=> bs!34187 m!1116353))

(declare-fun m!1116355 () Bool)

(assert (=> bs!34187 m!1116355))

(assert (=> b!1209947 d!133745))

(declare-fun d!133747 () Bool)

(declare-fun lt!549210 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!548 (List!26585) (InoxSet (_ BitVec 64)))

(assert (=> d!133747 (= lt!549210 (select (content!548 Nil!26582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!687464 () Bool)

(assert (=> d!133747 (= lt!549210 e!687464)))

(declare-fun res!804069 () Bool)

(assert (=> d!133747 (=> (not res!804069) (not e!687464))))

(assert (=> d!133747 (= res!804069 ((_ is Cons!26581) Nil!26582))))

(assert (=> d!133747 (= (contains!6978 Nil!26582 #b1000000000000000000000000000000000000000000000000000000000000000) lt!549210)))

(declare-fun b!1210268 () Bool)

(declare-fun e!687465 () Bool)

(assert (=> b!1210268 (= e!687464 e!687465)))

(declare-fun res!804068 () Bool)

(assert (=> b!1210268 (=> res!804068 e!687465)))

(assert (=> b!1210268 (= res!804068 (= (h!27799 Nil!26582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1210269 () Bool)

(assert (=> b!1210269 (= e!687465 (contains!6978 (t!39538 Nil!26582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133747 res!804069) b!1210268))

(assert (= (and b!1210268 (not res!804068)) b!1210269))

(declare-fun m!1116357 () Bool)

(assert (=> d!133747 m!1116357))

(declare-fun m!1116359 () Bool)

(assert (=> d!133747 m!1116359))

(declare-fun m!1116361 () Bool)

(assert (=> b!1210269 m!1116361))

(assert (=> b!1209973 d!133747))

(declare-fun d!133749 () Bool)

(declare-fun e!687467 () Bool)

(assert (=> d!133749 e!687467))

(declare-fun res!804070 () Bool)

(assert (=> d!133749 (=> res!804070 e!687467)))

(declare-fun lt!549213 () Bool)

(assert (=> d!133749 (= res!804070 (not lt!549213))))

(declare-fun lt!549214 () Bool)

(assert (=> d!133749 (= lt!549213 lt!549214)))

(declare-fun lt!549211 () Unit!40021)

(declare-fun e!687466 () Unit!40021)

(assert (=> d!133749 (= lt!549211 e!687466)))

(declare-fun c!119386 () Bool)

(assert (=> d!133749 (= c!119386 lt!549214)))

(assert (=> d!133749 (= lt!549214 (containsKey!596 (toList!8893 lt!549035) k0!934))))

(assert (=> d!133749 (= (contains!6979 lt!549035 k0!934) lt!549213)))

(declare-fun b!1210270 () Bool)

(declare-fun lt!549212 () Unit!40021)

(assert (=> b!1210270 (= e!687466 lt!549212)))

(assert (=> b!1210270 (= lt!549212 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8893 lt!549035) k0!934))))

(assert (=> b!1210270 (isDefined!462 (getValueByKey!634 (toList!8893 lt!549035) k0!934))))

(declare-fun b!1210271 () Bool)

(declare-fun Unit!40030 () Unit!40021)

(assert (=> b!1210271 (= e!687466 Unit!40030)))

(declare-fun b!1210272 () Bool)

(assert (=> b!1210272 (= e!687467 (isDefined!462 (getValueByKey!634 (toList!8893 lt!549035) k0!934)))))

(assert (= (and d!133749 c!119386) b!1210270))

(assert (= (and d!133749 (not c!119386)) b!1210271))

(assert (= (and d!133749 (not res!804070)) b!1210272))

(declare-fun m!1116363 () Bool)

(assert (=> d!133749 m!1116363))

(declare-fun m!1116365 () Bool)

(assert (=> b!1210270 m!1116365))

(declare-fun m!1116367 () Bool)

(assert (=> b!1210270 m!1116367))

(assert (=> b!1210270 m!1116367))

(declare-fun m!1116369 () Bool)

(assert (=> b!1210270 m!1116369))

(assert (=> b!1210272 m!1116367))

(assert (=> b!1210272 m!1116367))

(assert (=> b!1210272 m!1116369))

(assert (=> b!1209956 d!133749))

(assert (=> b!1209956 d!133725))

(assert (=> b!1209958 d!133729))

(declare-fun d!133751 () Bool)

(declare-fun e!687468 () Bool)

(assert (=> d!133751 e!687468))

(declare-fun res!804072 () Bool)

(assert (=> d!133751 (=> (not res!804072) (not e!687468))))

(declare-fun lt!549218 () ListLongMap!17755)

(assert (=> d!133751 (= res!804072 (contains!6979 lt!549218 (_1!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!549216 () List!26586)

(assert (=> d!133751 (= lt!549218 (ListLongMap!17756 lt!549216))))

(declare-fun lt!549217 () Unit!40021)

(declare-fun lt!549215 () Unit!40021)

(assert (=> d!133751 (= lt!549217 lt!549215)))

(assert (=> d!133751 (= (getValueByKey!634 lt!549216 (_1!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!684 (_2!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133751 (= lt!549215 (lemmaContainsTupThenGetReturnValue!316 lt!549216 (_1!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133751 (= lt!549216 (insertStrictlySorted!409 (toList!8893 lt!549035) (_1!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133751 (= (+!4055 lt!549035 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!549218)))

(declare-fun b!1210273 () Bool)

(declare-fun res!804071 () Bool)

(assert (=> b!1210273 (=> (not res!804071) (not e!687468))))

(assert (=> b!1210273 (= res!804071 (= (getValueByKey!634 (toList!8893 lt!549218) (_1!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!684 (_2!9900 (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1210274 () Bool)

(assert (=> b!1210274 (= e!687468 (contains!6984 (toList!8893 lt!549218) (ite (or c!119333 c!119331) (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133751 res!804072) b!1210273))

(assert (= (and b!1210273 res!804071) b!1210274))

(declare-fun m!1116371 () Bool)

(assert (=> d!133751 m!1116371))

(declare-fun m!1116373 () Bool)

(assert (=> d!133751 m!1116373))

(declare-fun m!1116375 () Bool)

(assert (=> d!133751 m!1116375))

(declare-fun m!1116377 () Bool)

(assert (=> d!133751 m!1116377))

(declare-fun m!1116379 () Bool)

(assert (=> b!1210273 m!1116379))

(declare-fun m!1116381 () Bool)

(assert (=> b!1210274 m!1116381))

(assert (=> bm!59254 d!133751))

(declare-fun d!133753 () Bool)

(assert (=> d!133753 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1209959 d!133753))

(declare-fun d!133755 () Bool)

(declare-fun e!687470 () Bool)

(assert (=> d!133755 e!687470))

(declare-fun res!804073 () Bool)

(assert (=> d!133755 (=> res!804073 e!687470)))

(declare-fun lt!549221 () Bool)

(assert (=> d!133755 (= res!804073 (not lt!549221))))

(declare-fun lt!549222 () Bool)

(assert (=> d!133755 (= lt!549221 lt!549222)))

(declare-fun lt!549219 () Unit!40021)

(declare-fun e!687469 () Unit!40021)

(assert (=> d!133755 (= lt!549219 e!687469)))

(declare-fun c!119387 () Bool)

(assert (=> d!133755 (= c!119387 lt!549222)))

(assert (=> d!133755 (= lt!549222 (containsKey!596 (toList!8893 (ite c!119333 lt!549040 call!59264)) k0!934))))

(assert (=> d!133755 (= (contains!6979 (ite c!119333 lt!549040 call!59264) k0!934) lt!549221)))

(declare-fun b!1210275 () Bool)

(declare-fun lt!549220 () Unit!40021)

(assert (=> b!1210275 (= e!687469 lt!549220)))

(assert (=> b!1210275 (= lt!549220 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8893 (ite c!119333 lt!549040 call!59264)) k0!934))))

(assert (=> b!1210275 (isDefined!462 (getValueByKey!634 (toList!8893 (ite c!119333 lt!549040 call!59264)) k0!934))))

(declare-fun b!1210276 () Bool)

(declare-fun Unit!40031 () Unit!40021)

(assert (=> b!1210276 (= e!687469 Unit!40031)))

(declare-fun b!1210277 () Bool)

(assert (=> b!1210277 (= e!687470 (isDefined!462 (getValueByKey!634 (toList!8893 (ite c!119333 lt!549040 call!59264)) k0!934)))))

(assert (= (and d!133755 c!119387) b!1210275))

(assert (= (and d!133755 (not c!119387)) b!1210276))

(assert (= (and d!133755 (not res!804073)) b!1210277))

(declare-fun m!1116383 () Bool)

(assert (=> d!133755 m!1116383))

(declare-fun m!1116385 () Bool)

(assert (=> b!1210275 m!1116385))

(declare-fun m!1116387 () Bool)

(assert (=> b!1210275 m!1116387))

(assert (=> b!1210275 m!1116387))

(declare-fun m!1116389 () Bool)

(assert (=> b!1210275 m!1116389))

(assert (=> b!1210277 m!1116387))

(assert (=> b!1210277 m!1116387))

(assert (=> b!1210277 m!1116389))

(assert (=> bm!59259 d!133755))

(declare-fun bm!59320 () Bool)

(declare-fun call!59323 () Bool)

(assert (=> bm!59320 (= call!59323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!549046 mask!1564))))

(declare-fun d!133757 () Bool)

(declare-fun res!804075 () Bool)

(declare-fun e!687471 () Bool)

(assert (=> d!133757 (=> res!804075 e!687471)))

(assert (=> d!133757 (= res!804075 (bvsge #b00000000000000000000000000000000 (size!38262 lt!549046)))))

(assert (=> d!133757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549046 mask!1564) e!687471)))

(declare-fun b!1210278 () Bool)

(declare-fun e!687472 () Bool)

(assert (=> b!1210278 (= e!687472 call!59323)))

(declare-fun b!1210279 () Bool)

(declare-fun e!687473 () Bool)

(assert (=> b!1210279 (= e!687473 call!59323)))

(declare-fun b!1210280 () Bool)

(assert (=> b!1210280 (= e!687471 e!687473)))

(declare-fun c!119388 () Bool)

(assert (=> b!1210280 (= c!119388 (validKeyInArray!0 (select (arr!37725 lt!549046) #b00000000000000000000000000000000)))))

(declare-fun b!1210281 () Bool)

(assert (=> b!1210281 (= e!687473 e!687472)))

(declare-fun lt!549225 () (_ BitVec 64))

(assert (=> b!1210281 (= lt!549225 (select (arr!37725 lt!549046) #b00000000000000000000000000000000))))

(declare-fun lt!549224 () Unit!40021)

(assert (=> b!1210281 (= lt!549224 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!549046 lt!549225 #b00000000000000000000000000000000))))

(assert (=> b!1210281 (arrayContainsKey!0 lt!549046 lt!549225 #b00000000000000000000000000000000)))

(declare-fun lt!549223 () Unit!40021)

(assert (=> b!1210281 (= lt!549223 lt!549224)))

(declare-fun res!804074 () Bool)

(assert (=> b!1210281 (= res!804074 (= (seekEntryOrOpen!0 (select (arr!37725 lt!549046) #b00000000000000000000000000000000) lt!549046 mask!1564) (Found!9896 #b00000000000000000000000000000000)))))

(assert (=> b!1210281 (=> (not res!804074) (not e!687472))))

(assert (= (and d!133757 (not res!804075)) b!1210280))

(assert (= (and b!1210280 c!119388) b!1210281))

(assert (= (and b!1210280 (not c!119388)) b!1210279))

(assert (= (and b!1210281 res!804074) b!1210278))

(assert (= (or b!1210278 b!1210279) bm!59320))

(declare-fun m!1116391 () Bool)

(assert (=> bm!59320 m!1116391))

(assert (=> b!1210280 m!1116257))

(assert (=> b!1210280 m!1116257))

(assert (=> b!1210280 m!1116259))

(assert (=> b!1210281 m!1116257))

(declare-fun m!1116393 () Bool)

(assert (=> b!1210281 m!1116393))

(declare-fun m!1116395 () Bool)

(assert (=> b!1210281 m!1116395))

(assert (=> b!1210281 m!1116257))

(declare-fun m!1116397 () Bool)

(assert (=> b!1210281 m!1116397))

(assert (=> b!1209969 d!133757))

(declare-fun b!1210282 () Bool)

(declare-fun e!687474 () Bool)

(declare-fun call!59324 () Bool)

(assert (=> b!1210282 (= e!687474 call!59324)))

(declare-fun d!133759 () Bool)

(declare-fun res!804076 () Bool)

(declare-fun e!687477 () Bool)

(assert (=> d!133759 (=> res!804076 e!687477)))

(assert (=> d!133759 (= res!804076 (bvsge from!1455 (size!38262 _keys!1208)))))

(assert (=> d!133759 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26582) e!687477)))

(declare-fun b!1210283 () Bool)

(declare-fun e!687475 () Bool)

(assert (=> b!1210283 (= e!687475 e!687474)))

(declare-fun c!119389 () Bool)

(assert (=> b!1210283 (= c!119389 (validKeyInArray!0 (select (arr!37725 _keys!1208) from!1455)))))

(declare-fun b!1210284 () Bool)

(assert (=> b!1210284 (= e!687474 call!59324)))

(declare-fun b!1210285 () Bool)

(assert (=> b!1210285 (= e!687477 e!687475)))

(declare-fun res!804077 () Bool)

(assert (=> b!1210285 (=> (not res!804077) (not e!687475))))

(declare-fun e!687476 () Bool)

(assert (=> b!1210285 (= res!804077 (not e!687476))))

(declare-fun res!804078 () Bool)

(assert (=> b!1210285 (=> (not res!804078) (not e!687476))))

(assert (=> b!1210285 (= res!804078 (validKeyInArray!0 (select (arr!37725 _keys!1208) from!1455)))))

(declare-fun bm!59321 () Bool)

(assert (=> bm!59321 (= call!59324 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119389 (Cons!26581 (select (arr!37725 _keys!1208) from!1455) Nil!26582) Nil!26582)))))

(declare-fun b!1210286 () Bool)

(assert (=> b!1210286 (= e!687476 (contains!6978 Nil!26582 (select (arr!37725 _keys!1208) from!1455)))))

(assert (= (and d!133759 (not res!804076)) b!1210285))

(assert (= (and b!1210285 res!804078) b!1210286))

(assert (= (and b!1210285 res!804077) b!1210283))

(assert (= (and b!1210283 c!119389) b!1210284))

(assert (= (and b!1210283 (not c!119389)) b!1210282))

(assert (= (or b!1210284 b!1210282) bm!59321))

(assert (=> b!1210283 m!1116043))

(assert (=> b!1210283 m!1116043))

(declare-fun m!1116399 () Bool)

(assert (=> b!1210283 m!1116399))

(assert (=> b!1210285 m!1116043))

(assert (=> b!1210285 m!1116043))

(assert (=> b!1210285 m!1116399))

(assert (=> bm!59321 m!1116043))

(declare-fun m!1116401 () Bool)

(assert (=> bm!59321 m!1116401))

(assert (=> b!1210286 m!1116043))

(assert (=> b!1210286 m!1116043))

(declare-fun m!1116403 () Bool)

(assert (=> b!1210286 m!1116403))

(assert (=> b!1209968 d!133759))

(declare-fun d!133761 () Bool)

(assert (=> d!133761 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26582)))

(declare-fun lt!549228 () Unit!40021)

(declare-fun choose!39 (array!78187 (_ BitVec 32) (_ BitVec 32)) Unit!40021)

(assert (=> d!133761 (= lt!549228 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133761 (bvslt (size!38262 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133761 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!549228)))

(declare-fun bs!34188 () Bool)

(assert (= bs!34188 d!133761))

(assert (=> bs!34188 m!1116053))

(declare-fun m!1116405 () Bool)

(assert (=> bs!34188 m!1116405))

(assert (=> b!1209968 d!133761))

(declare-fun d!133763 () Bool)

(declare-fun e!687480 () Bool)

(assert (=> d!133763 e!687480))

(declare-fun c!119392 () Bool)

(assert (=> d!133763 (= c!119392 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549231 () Unit!40021)

(declare-fun choose!1816 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 64) (_ BitVec 32) Int) Unit!40021)

(assert (=> d!133763 (= lt!549231 (choose!1816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133763 (validMask!0 mask!1564)))

(assert (=> d!133763 (= (lemmaListMapContainsThenArrayContainsFrom!590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549231)))

(declare-fun b!1210291 () Bool)

(assert (=> b!1210291 (= e!687480 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210292 () Bool)

(assert (=> b!1210292 (= e!687480 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133763 c!119392) b!1210291))

(assert (= (and d!133763 (not c!119392)) b!1210292))

(declare-fun m!1116407 () Bool)

(assert (=> d!133763 m!1116407))

(assert (=> d!133763 m!1116109))

(assert (=> b!1210291 m!1116061))

(assert (=> b!1209968 d!133763))

(declare-fun call!59329 () ListLongMap!17755)

(declare-fun bm!59326 () Bool)

(assert (=> bm!59326 (= call!59329 (getCurrentListMapNoExtraKeys!5355 (array!78188 (store (arr!37725 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38262 _keys!1208)) (array!78190 (store (arr!37726 _values!996) i!673 (ValueCellFull!14633 (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38263 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210299 () Bool)

(declare-fun e!687485 () Bool)

(declare-fun call!59330 () ListLongMap!17755)

(assert (=> b!1210299 (= e!687485 (= call!59329 call!59330))))

(assert (=> b!1210299 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38263 _values!996)))))

(declare-fun bm!59327 () Bool)

(assert (=> bm!59327 (= call!59330 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210301 () Bool)

(declare-fun e!687486 () Bool)

(assert (=> b!1210301 (= e!687486 e!687485)))

(declare-fun c!119395 () Bool)

(assert (=> b!1210301 (= c!119395 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133765 () Bool)

(assert (=> d!133765 e!687486))

(declare-fun res!804081 () Bool)

(assert (=> d!133765 (=> (not res!804081) (not e!687486))))

(assert (=> d!133765 (= res!804081 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38262 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38262 _keys!1208))))))))

(declare-fun lt!549234 () Unit!40021)

(declare-fun choose!1817 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46041 V!46041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40021)

(assert (=> d!133765 (= lt!549234 (choose!1817 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133765 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)))))

(assert (=> d!133765 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549234)))

(declare-fun b!1210300 () Bool)

(assert (=> b!1210300 (= e!687485 (= call!59329 (-!1826 call!59330 k0!934)))))

(assert (=> b!1210300 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38263 _values!996)))))

(assert (= (and d!133765 res!804081) b!1210301))

(assert (= (and b!1210301 c!119395) b!1210300))

(assert (= (and b!1210301 (not c!119395)) b!1210299))

(assert (= (or b!1210300 b!1210299) bm!59327))

(assert (= (or b!1210300 b!1210299) bm!59326))

(declare-fun b_lambda!21549 () Bool)

(assert (=> (not b_lambda!21549) (not bm!59326)))

(assert (=> bm!59326 t!39537))

(declare-fun b_and!43043 () Bool)

(assert (= b_and!43041 (and (=> t!39537 result!22145) b_and!43043)))

(assert (=> bm!59326 m!1116069))

(assert (=> bm!59326 m!1116095))

(assert (=> bm!59326 m!1116097))

(declare-fun m!1116409 () Bool)

(assert (=> bm!59326 m!1116409))

(assert (=> bm!59327 m!1116041))

(declare-fun m!1116411 () Bool)

(assert (=> d!133765 m!1116411))

(declare-fun m!1116413 () Bool)

(assert (=> b!1210300 m!1116413))

(assert (=> b!1209952 d!133765))

(declare-fun b!1210302 () Bool)

(declare-fun res!804084 () Bool)

(declare-fun e!687493 () Bool)

(assert (=> b!1210302 (=> (not res!804084) (not e!687493))))

(declare-fun lt!549238 () ListLongMap!17755)

(assert (=> b!1210302 (= res!804084 (not (contains!6979 lt!549238 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210303 () Bool)

(assert (=> b!1210303 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 lt!549046)))))

(assert (=> b!1210303 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38263 lt!549041)))))

(declare-fun e!687489 () Bool)

(assert (=> b!1210303 (= e!687489 (= (apply!976 lt!549238 (select (arr!37725 lt!549046) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19274 (select (arr!37726 lt!549041) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210304 () Bool)

(declare-fun e!687492 () Bool)

(declare-fun e!687487 () Bool)

(assert (=> b!1210304 (= e!687492 e!687487)))

(declare-fun c!119398 () Bool)

(assert (=> b!1210304 (= c!119398 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 lt!549046)))))

(declare-fun bm!59328 () Bool)

(declare-fun call!59331 () ListLongMap!17755)

(assert (=> bm!59328 (= call!59331 (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210306 () Bool)

(declare-fun lt!549239 () Unit!40021)

(declare-fun lt!549237 () Unit!40021)

(assert (=> b!1210306 (= lt!549239 lt!549237)))

(declare-fun lt!549236 () (_ BitVec 64))

(declare-fun lt!549235 () V!46041)

(declare-fun lt!549240 () (_ BitVec 64))

(declare-fun lt!549241 () ListLongMap!17755)

(assert (=> b!1210306 (not (contains!6979 (+!4055 lt!549241 (tuple2!19779 lt!549240 lt!549235)) lt!549236))))

(assert (=> b!1210306 (= lt!549237 (addStillNotContains!297 lt!549241 lt!549240 lt!549235 lt!549236))))

(assert (=> b!1210306 (= lt!549236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210306 (= lt!549235 (get!19274 (select (arr!37726 lt!549041) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210306 (= lt!549240 (select (arr!37725 lt!549046) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1210306 (= lt!549241 call!59331)))

(declare-fun e!687490 () ListLongMap!17755)

(assert (=> b!1210306 (= e!687490 (+!4055 call!59331 (tuple2!19779 (select (arr!37725 lt!549046) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19274 (select (arr!37726 lt!549041) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210307 () Bool)

(assert (=> b!1210307 (= e!687487 (isEmpty!995 lt!549238))))

(declare-fun b!1210308 () Bool)

(declare-fun e!687488 () Bool)

(assert (=> b!1210308 (= e!687488 (validKeyInArray!0 (select (arr!37725 lt!549046) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210308 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1210309 () Bool)

(declare-fun e!687491 () ListLongMap!17755)

(assert (=> b!1210309 (= e!687491 (ListLongMap!17756 Nil!26583))))

(declare-fun b!1210310 () Bool)

(assert (=> b!1210310 (= e!687493 e!687492)))

(declare-fun c!119397 () Bool)

(assert (=> b!1210310 (= c!119397 e!687488)))

(declare-fun res!804082 () Bool)

(assert (=> b!1210310 (=> (not res!804082) (not e!687488))))

(assert (=> b!1210310 (= res!804082 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 lt!549046)))))

(declare-fun b!1210311 () Bool)

(assert (=> b!1210311 (= e!687491 e!687490)))

(declare-fun c!119396 () Bool)

(assert (=> b!1210311 (= c!119396 (validKeyInArray!0 (select (arr!37725 lt!549046) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133767 () Bool)

(assert (=> d!133767 e!687493))

(declare-fun res!804083 () Bool)

(assert (=> d!133767 (=> (not res!804083) (not e!687493))))

(assert (=> d!133767 (= res!804083 (not (contains!6979 lt!549238 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133767 (= lt!549238 e!687491)))

(declare-fun c!119399 () Bool)

(assert (=> d!133767 (= c!119399 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 lt!549046)))))

(assert (=> d!133767 (validMask!0 mask!1564)))

(assert (=> d!133767 (= (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549238)))

(declare-fun b!1210305 () Bool)

(assert (=> b!1210305 (= e!687492 e!687489)))

(assert (=> b!1210305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 lt!549046)))))

(declare-fun res!804085 () Bool)

(assert (=> b!1210305 (= res!804085 (contains!6979 lt!549238 (select (arr!37725 lt!549046) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210305 (=> (not res!804085) (not e!687489))))

(declare-fun b!1210312 () Bool)

(assert (=> b!1210312 (= e!687490 call!59331)))

(declare-fun b!1210313 () Bool)

(assert (=> b!1210313 (= e!687487 (= lt!549238 (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133767 c!119399) b!1210309))

(assert (= (and d!133767 (not c!119399)) b!1210311))

(assert (= (and b!1210311 c!119396) b!1210306))

(assert (= (and b!1210311 (not c!119396)) b!1210312))

(assert (= (or b!1210306 b!1210312) bm!59328))

(assert (= (and d!133767 res!804083) b!1210302))

(assert (= (and b!1210302 res!804084) b!1210310))

(assert (= (and b!1210310 res!804082) b!1210308))

(assert (= (and b!1210310 c!119397) b!1210305))

(assert (= (and b!1210310 (not c!119397)) b!1210304))

(assert (= (and b!1210305 res!804085) b!1210303))

(assert (= (and b!1210304 c!119398) b!1210313))

(assert (= (and b!1210304 (not c!119398)) b!1210307))

(declare-fun b_lambda!21551 () Bool)

(assert (=> (not b_lambda!21551) (not b!1210303)))

(assert (=> b!1210303 t!39537))

(declare-fun b_and!43045 () Bool)

(assert (= b_and!43043 (and (=> t!39537 result!22145) b_and!43045)))

(declare-fun b_lambda!21553 () Bool)

(assert (=> (not b_lambda!21553) (not b!1210306)))

(assert (=> b!1210306 t!39537))

(declare-fun b_and!43047 () Bool)

(assert (= b_and!43045 (and (=> t!39537 result!22145) b_and!43047)))

(assert (=> b!1210303 m!1116095))

(declare-fun m!1116415 () Bool)

(assert (=> b!1210303 m!1116415))

(declare-fun m!1116417 () Bool)

(assert (=> b!1210303 m!1116417))

(declare-fun m!1116419 () Bool)

(assert (=> b!1210303 m!1116419))

(assert (=> b!1210303 m!1116095))

(declare-fun m!1116421 () Bool)

(assert (=> b!1210303 m!1116421))

(assert (=> b!1210303 m!1116419))

(assert (=> b!1210303 m!1116415))

(assert (=> b!1210306 m!1116095))

(declare-fun m!1116423 () Bool)

(assert (=> b!1210306 m!1116423))

(declare-fun m!1116425 () Bool)

(assert (=> b!1210306 m!1116425))

(declare-fun m!1116427 () Bool)

(assert (=> b!1210306 m!1116427))

(assert (=> b!1210306 m!1116423))

(assert (=> b!1210306 m!1116419))

(assert (=> b!1210306 m!1116415))

(declare-fun m!1116429 () Bool)

(assert (=> b!1210306 m!1116429))

(assert (=> b!1210306 m!1116419))

(assert (=> b!1210306 m!1116095))

(assert (=> b!1210306 m!1116421))

(declare-fun m!1116431 () Bool)

(assert (=> b!1210313 m!1116431))

(declare-fun m!1116433 () Bool)

(assert (=> b!1210307 m!1116433))

(assert (=> b!1210305 m!1116415))

(assert (=> b!1210305 m!1116415))

(declare-fun m!1116435 () Bool)

(assert (=> b!1210305 m!1116435))

(assert (=> b!1210308 m!1116415))

(assert (=> b!1210308 m!1116415))

(declare-fun m!1116437 () Bool)

(assert (=> b!1210308 m!1116437))

(assert (=> bm!59328 m!1116431))

(declare-fun m!1116439 () Bool)

(assert (=> d!133767 m!1116439))

(assert (=> d!133767 m!1116109))

(declare-fun m!1116441 () Bool)

(assert (=> b!1210302 m!1116441))

(assert (=> b!1210311 m!1116415))

(assert (=> b!1210311 m!1116415))

(assert (=> b!1210311 m!1116437))

(assert (=> bm!59261 d!133767))

(declare-fun d!133769 () Bool)

(assert (=> d!133769 (= (array_inv!28798 _keys!1208) (bvsge (size!38262 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101182 d!133769))

(declare-fun d!133771 () Bool)

(assert (=> d!133771 (= (array_inv!28799 _values!996) (bvsge (size!38263 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101182 d!133771))

(declare-fun b!1210314 () Bool)

(declare-fun res!804088 () Bool)

(declare-fun e!687500 () Bool)

(assert (=> b!1210314 (=> (not res!804088) (not e!687500))))

(declare-fun lt!549245 () ListLongMap!17755)

(assert (=> b!1210314 (= res!804088 (not (contains!6979 lt!549245 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210315 () Bool)

(assert (=> b!1210315 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38262 lt!549046)))))

(assert (=> b!1210315 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38263 lt!549041)))))

(declare-fun e!687496 () Bool)

(assert (=> b!1210315 (= e!687496 (= (apply!976 lt!549245 (select (arr!37725 lt!549046) from!1455)) (get!19274 (select (arr!37726 lt!549041) from!1455) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210316 () Bool)

(declare-fun e!687499 () Bool)

(declare-fun e!687494 () Bool)

(assert (=> b!1210316 (= e!687499 e!687494)))

(declare-fun c!119402 () Bool)

(assert (=> b!1210316 (= c!119402 (bvslt from!1455 (size!38262 lt!549046)))))

(declare-fun bm!59329 () Bool)

(declare-fun call!59332 () ListLongMap!17755)

(assert (=> bm!59329 (= call!59332 (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210318 () Bool)

(declare-fun lt!549246 () Unit!40021)

(declare-fun lt!549244 () Unit!40021)

(assert (=> b!1210318 (= lt!549246 lt!549244)))

(declare-fun lt!549248 () ListLongMap!17755)

(declare-fun lt!549243 () (_ BitVec 64))

(declare-fun lt!549247 () (_ BitVec 64))

(declare-fun lt!549242 () V!46041)

(assert (=> b!1210318 (not (contains!6979 (+!4055 lt!549248 (tuple2!19779 lt!549247 lt!549242)) lt!549243))))

(assert (=> b!1210318 (= lt!549244 (addStillNotContains!297 lt!549248 lt!549247 lt!549242 lt!549243))))

(assert (=> b!1210318 (= lt!549243 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210318 (= lt!549242 (get!19274 (select (arr!37726 lt!549041) from!1455) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210318 (= lt!549247 (select (arr!37725 lt!549046) from!1455))))

(assert (=> b!1210318 (= lt!549248 call!59332)))

(declare-fun e!687497 () ListLongMap!17755)

(assert (=> b!1210318 (= e!687497 (+!4055 call!59332 (tuple2!19779 (select (arr!37725 lt!549046) from!1455) (get!19274 (select (arr!37726 lt!549041) from!1455) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210319 () Bool)

(assert (=> b!1210319 (= e!687494 (isEmpty!995 lt!549245))))

(declare-fun b!1210320 () Bool)

(declare-fun e!687495 () Bool)

(assert (=> b!1210320 (= e!687495 (validKeyInArray!0 (select (arr!37725 lt!549046) from!1455)))))

(assert (=> b!1210320 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1210321 () Bool)

(declare-fun e!687498 () ListLongMap!17755)

(assert (=> b!1210321 (= e!687498 (ListLongMap!17756 Nil!26583))))

(declare-fun b!1210322 () Bool)

(assert (=> b!1210322 (= e!687500 e!687499)))

(declare-fun c!119401 () Bool)

(assert (=> b!1210322 (= c!119401 e!687495)))

(declare-fun res!804086 () Bool)

(assert (=> b!1210322 (=> (not res!804086) (not e!687495))))

(assert (=> b!1210322 (= res!804086 (bvslt from!1455 (size!38262 lt!549046)))))

(declare-fun b!1210323 () Bool)

(assert (=> b!1210323 (= e!687498 e!687497)))

(declare-fun c!119400 () Bool)

(assert (=> b!1210323 (= c!119400 (validKeyInArray!0 (select (arr!37725 lt!549046) from!1455)))))

(declare-fun d!133773 () Bool)

(assert (=> d!133773 e!687500))

(declare-fun res!804087 () Bool)

(assert (=> d!133773 (=> (not res!804087) (not e!687500))))

(assert (=> d!133773 (= res!804087 (not (contains!6979 lt!549245 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133773 (= lt!549245 e!687498)))

(declare-fun c!119403 () Bool)

(assert (=> d!133773 (= c!119403 (bvsge from!1455 (size!38262 lt!549046)))))

(assert (=> d!133773 (validMask!0 mask!1564)))

(assert (=> d!133773 (= (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!549245)))

(declare-fun b!1210317 () Bool)

(assert (=> b!1210317 (= e!687499 e!687496)))

(assert (=> b!1210317 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38262 lt!549046)))))

(declare-fun res!804089 () Bool)

(assert (=> b!1210317 (= res!804089 (contains!6979 lt!549245 (select (arr!37725 lt!549046) from!1455)))))

(assert (=> b!1210317 (=> (not res!804089) (not e!687496))))

(declare-fun b!1210324 () Bool)

(assert (=> b!1210324 (= e!687497 call!59332)))

(declare-fun b!1210325 () Bool)

(assert (=> b!1210325 (= e!687494 (= lt!549245 (getCurrentListMapNoExtraKeys!5355 lt!549046 lt!549041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133773 c!119403) b!1210321))

(assert (= (and d!133773 (not c!119403)) b!1210323))

(assert (= (and b!1210323 c!119400) b!1210318))

(assert (= (and b!1210323 (not c!119400)) b!1210324))

(assert (= (or b!1210318 b!1210324) bm!59329))

(assert (= (and d!133773 res!804087) b!1210314))

(assert (= (and b!1210314 res!804088) b!1210322))

(assert (= (and b!1210322 res!804086) b!1210320))

(assert (= (and b!1210322 c!119401) b!1210317))

(assert (= (and b!1210322 (not c!119401)) b!1210316))

(assert (= (and b!1210317 res!804089) b!1210315))

(assert (= (and b!1210316 c!119402) b!1210325))

(assert (= (and b!1210316 (not c!119402)) b!1210319))

(declare-fun b_lambda!21555 () Bool)

(assert (=> (not b_lambda!21555) (not b!1210315)))

(assert (=> b!1210315 t!39537))

(declare-fun b_and!43049 () Bool)

(assert (= b_and!43047 (and (=> t!39537 result!22145) b_and!43049)))

(declare-fun b_lambda!21557 () Bool)

(assert (=> (not b_lambda!21557) (not b!1210318)))

(assert (=> b!1210318 t!39537))

(declare-fun b_and!43051 () Bool)

(assert (= b_and!43049 (and (=> t!39537 result!22145) b_and!43051)))

(assert (=> b!1210315 m!1116095))

(declare-fun m!1116443 () Bool)

(assert (=> b!1210315 m!1116443))

(declare-fun m!1116445 () Bool)

(assert (=> b!1210315 m!1116445))

(declare-fun m!1116447 () Bool)

(assert (=> b!1210315 m!1116447))

(assert (=> b!1210315 m!1116095))

(declare-fun m!1116449 () Bool)

(assert (=> b!1210315 m!1116449))

(assert (=> b!1210315 m!1116447))

(assert (=> b!1210315 m!1116443))

(assert (=> b!1210318 m!1116095))

(declare-fun m!1116451 () Bool)

(assert (=> b!1210318 m!1116451))

(declare-fun m!1116453 () Bool)

(assert (=> b!1210318 m!1116453))

(declare-fun m!1116455 () Bool)

(assert (=> b!1210318 m!1116455))

(assert (=> b!1210318 m!1116451))

(assert (=> b!1210318 m!1116447))

(assert (=> b!1210318 m!1116443))

(declare-fun m!1116457 () Bool)

(assert (=> b!1210318 m!1116457))

(assert (=> b!1210318 m!1116447))

(assert (=> b!1210318 m!1116095))

(assert (=> b!1210318 m!1116449))

(declare-fun m!1116459 () Bool)

(assert (=> b!1210325 m!1116459))

(declare-fun m!1116461 () Bool)

(assert (=> b!1210319 m!1116461))

(assert (=> b!1210317 m!1116443))

(assert (=> b!1210317 m!1116443))

(declare-fun m!1116463 () Bool)

(assert (=> b!1210317 m!1116463))

(assert (=> b!1210320 m!1116443))

(assert (=> b!1210320 m!1116443))

(declare-fun m!1116465 () Bool)

(assert (=> b!1210320 m!1116465))

(assert (=> bm!59329 m!1116459))

(declare-fun m!1116467 () Bool)

(assert (=> d!133773 m!1116467))

(assert (=> d!133773 m!1116109))

(declare-fun m!1116469 () Bool)

(assert (=> b!1210314 m!1116469))

(assert (=> b!1210323 m!1116443))

(assert (=> b!1210323 m!1116443))

(assert (=> b!1210323 m!1116465))

(assert (=> b!1209954 d!133773))

(declare-fun b!1210326 () Bool)

(declare-fun res!804092 () Bool)

(declare-fun e!687507 () Bool)

(assert (=> b!1210326 (=> (not res!804092) (not e!687507))))

(declare-fun lt!549252 () ListLongMap!17755)

(assert (=> b!1210326 (= res!804092 (not (contains!6979 lt!549252 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210327 () Bool)

(assert (=> b!1210327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38262 _keys!1208)))))

(assert (=> b!1210327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38263 _values!996)))))

(declare-fun e!687503 () Bool)

(assert (=> b!1210327 (= e!687503 (= (apply!976 lt!549252 (select (arr!37725 _keys!1208) from!1455)) (get!19274 (select (arr!37726 _values!996) from!1455) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210328 () Bool)

(declare-fun e!687506 () Bool)

(declare-fun e!687501 () Bool)

(assert (=> b!1210328 (= e!687506 e!687501)))

(declare-fun c!119406 () Bool)

(assert (=> b!1210328 (= c!119406 (bvslt from!1455 (size!38262 _keys!1208)))))

(declare-fun call!59333 () ListLongMap!17755)

(declare-fun bm!59330 () Bool)

(assert (=> bm!59330 (= call!59333 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210330 () Bool)

(declare-fun lt!549253 () Unit!40021)

(declare-fun lt!549251 () Unit!40021)

(assert (=> b!1210330 (= lt!549253 lt!549251)))

(declare-fun lt!549255 () ListLongMap!17755)

(declare-fun lt!549250 () (_ BitVec 64))

(declare-fun lt!549249 () V!46041)

(declare-fun lt!549254 () (_ BitVec 64))

(assert (=> b!1210330 (not (contains!6979 (+!4055 lt!549255 (tuple2!19779 lt!549254 lt!549249)) lt!549250))))

(assert (=> b!1210330 (= lt!549251 (addStillNotContains!297 lt!549255 lt!549254 lt!549249 lt!549250))))

(assert (=> b!1210330 (= lt!549250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210330 (= lt!549249 (get!19274 (select (arr!37726 _values!996) from!1455) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210330 (= lt!549254 (select (arr!37725 _keys!1208) from!1455))))

(assert (=> b!1210330 (= lt!549255 call!59333)))

(declare-fun e!687504 () ListLongMap!17755)

(assert (=> b!1210330 (= e!687504 (+!4055 call!59333 (tuple2!19779 (select (arr!37725 _keys!1208) from!1455) (get!19274 (select (arr!37726 _values!996) from!1455) (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210331 () Bool)

(assert (=> b!1210331 (= e!687501 (isEmpty!995 lt!549252))))

(declare-fun b!1210332 () Bool)

(declare-fun e!687502 () Bool)

(assert (=> b!1210332 (= e!687502 (validKeyInArray!0 (select (arr!37725 _keys!1208) from!1455)))))

(assert (=> b!1210332 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1210333 () Bool)

(declare-fun e!687505 () ListLongMap!17755)

(assert (=> b!1210333 (= e!687505 (ListLongMap!17756 Nil!26583))))

(declare-fun b!1210334 () Bool)

(assert (=> b!1210334 (= e!687507 e!687506)))

(declare-fun c!119405 () Bool)

(assert (=> b!1210334 (= c!119405 e!687502)))

(declare-fun res!804090 () Bool)

(assert (=> b!1210334 (=> (not res!804090) (not e!687502))))

(assert (=> b!1210334 (= res!804090 (bvslt from!1455 (size!38262 _keys!1208)))))

(declare-fun b!1210335 () Bool)

(assert (=> b!1210335 (= e!687505 e!687504)))

(declare-fun c!119404 () Bool)

(assert (=> b!1210335 (= c!119404 (validKeyInArray!0 (select (arr!37725 _keys!1208) from!1455)))))

(declare-fun d!133775 () Bool)

(assert (=> d!133775 e!687507))

(declare-fun res!804091 () Bool)

(assert (=> d!133775 (=> (not res!804091) (not e!687507))))

(assert (=> d!133775 (= res!804091 (not (contains!6979 lt!549252 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133775 (= lt!549252 e!687505)))

(declare-fun c!119407 () Bool)

(assert (=> d!133775 (= c!119407 (bvsge from!1455 (size!38262 _keys!1208)))))

(assert (=> d!133775 (validMask!0 mask!1564)))

(assert (=> d!133775 (= (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!549252)))

(declare-fun b!1210329 () Bool)

(assert (=> b!1210329 (= e!687506 e!687503)))

(assert (=> b!1210329 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38262 _keys!1208)))))

(declare-fun res!804093 () Bool)

(assert (=> b!1210329 (= res!804093 (contains!6979 lt!549252 (select (arr!37725 _keys!1208) from!1455)))))

(assert (=> b!1210329 (=> (not res!804093) (not e!687503))))

(declare-fun b!1210336 () Bool)

(assert (=> b!1210336 (= e!687504 call!59333)))

(declare-fun b!1210337 () Bool)

(assert (=> b!1210337 (= e!687501 (= lt!549252 (getCurrentListMapNoExtraKeys!5355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133775 c!119407) b!1210333))

(assert (= (and d!133775 (not c!119407)) b!1210335))

(assert (= (and b!1210335 c!119404) b!1210330))

(assert (= (and b!1210335 (not c!119404)) b!1210336))

(assert (= (or b!1210330 b!1210336) bm!59330))

(assert (= (and d!133775 res!804091) b!1210326))

(assert (= (and b!1210326 res!804092) b!1210334))

(assert (= (and b!1210334 res!804090) b!1210332))

(assert (= (and b!1210334 c!119405) b!1210329))

(assert (= (and b!1210334 (not c!119405)) b!1210328))

(assert (= (and b!1210329 res!804093) b!1210327))

(assert (= (and b!1210328 c!119406) b!1210337))

(assert (= (and b!1210328 (not c!119406)) b!1210331))

(declare-fun b_lambda!21559 () Bool)

(assert (=> (not b_lambda!21559) (not b!1210327)))

(assert (=> b!1210327 t!39537))

(declare-fun b_and!43053 () Bool)

(assert (= b_and!43051 (and (=> t!39537 result!22145) b_and!43053)))

(declare-fun b_lambda!21561 () Bool)

(assert (=> (not b_lambda!21561) (not b!1210330)))

(assert (=> b!1210330 t!39537))

(declare-fun b_and!43055 () Bool)

(assert (= b_and!43053 (and (=> t!39537 result!22145) b_and!43055)))

(assert (=> b!1210327 m!1116095))

(assert (=> b!1210327 m!1116043))

(declare-fun m!1116471 () Bool)

(assert (=> b!1210327 m!1116471))

(declare-fun m!1116473 () Bool)

(assert (=> b!1210327 m!1116473))

(assert (=> b!1210327 m!1116095))

(declare-fun m!1116475 () Bool)

(assert (=> b!1210327 m!1116475))

(assert (=> b!1210327 m!1116473))

(assert (=> b!1210327 m!1116043))

(assert (=> b!1210330 m!1116095))

(declare-fun m!1116477 () Bool)

(assert (=> b!1210330 m!1116477))

(declare-fun m!1116479 () Bool)

(assert (=> b!1210330 m!1116479))

(declare-fun m!1116481 () Bool)

(assert (=> b!1210330 m!1116481))

(assert (=> b!1210330 m!1116477))

(assert (=> b!1210330 m!1116473))

(assert (=> b!1210330 m!1116043))

(declare-fun m!1116483 () Bool)

(assert (=> b!1210330 m!1116483))

(assert (=> b!1210330 m!1116473))

(assert (=> b!1210330 m!1116095))

(assert (=> b!1210330 m!1116475))

(declare-fun m!1116485 () Bool)

(assert (=> b!1210337 m!1116485))

(declare-fun m!1116487 () Bool)

(assert (=> b!1210331 m!1116487))

(assert (=> b!1210329 m!1116043))

(assert (=> b!1210329 m!1116043))

(declare-fun m!1116489 () Bool)

(assert (=> b!1210329 m!1116489))

(assert (=> b!1210332 m!1116043))

(assert (=> b!1210332 m!1116043))

(assert (=> b!1210332 m!1116399))

(assert (=> bm!59330 m!1116485))

(declare-fun m!1116491 () Bool)

(assert (=> d!133775 m!1116491))

(assert (=> d!133775 m!1116109))

(declare-fun m!1116493 () Bool)

(assert (=> b!1210326 m!1116493))

(assert (=> b!1210335 m!1116043))

(assert (=> b!1210335 m!1116043))

(assert (=> b!1210335 m!1116399))

(assert (=> b!1209954 d!133775))

(declare-fun d!133777 () Bool)

(declare-fun lt!549256 () Bool)

(assert (=> d!133777 (= lt!549256 (select (content!548 Nil!26582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!687508 () Bool)

(assert (=> d!133777 (= lt!549256 e!687508)))

(declare-fun res!804095 () Bool)

(assert (=> d!133777 (=> (not res!804095) (not e!687508))))

(assert (=> d!133777 (= res!804095 ((_ is Cons!26581) Nil!26582))))

(assert (=> d!133777 (= (contains!6978 Nil!26582 #b0000000000000000000000000000000000000000000000000000000000000000) lt!549256)))

(declare-fun b!1210338 () Bool)

(declare-fun e!687509 () Bool)

(assert (=> b!1210338 (= e!687508 e!687509)))

(declare-fun res!804094 () Bool)

(assert (=> b!1210338 (=> res!804094 e!687509)))

(assert (=> b!1210338 (= res!804094 (= (h!27799 Nil!26582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1210339 () Bool)

(assert (=> b!1210339 (= e!687509 (contains!6978 (t!39538 Nil!26582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133777 res!804095) b!1210338))

(assert (= (and b!1210338 (not res!804094)) b!1210339))

(assert (=> d!133777 m!1116357))

(declare-fun m!1116495 () Bool)

(assert (=> d!133777 m!1116495))

(declare-fun m!1116497 () Bool)

(assert (=> b!1210339 m!1116497))

(assert (=> b!1209955 d!133777))

(declare-fun condMapEmpty!47902 () Bool)

(declare-fun mapDefault!47902 () ValueCell!14633)

(assert (=> mapNonEmpty!47893 (= condMapEmpty!47902 (= mapRest!47893 ((as const (Array (_ BitVec 32) ValueCell!14633)) mapDefault!47902)))))

(declare-fun e!687514 () Bool)

(declare-fun mapRes!47902 () Bool)

(assert (=> mapNonEmpty!47893 (= tp!90956 (and e!687514 mapRes!47902))))

(declare-fun mapIsEmpty!47902 () Bool)

(assert (=> mapIsEmpty!47902 mapRes!47902))

(declare-fun mapNonEmpty!47902 () Bool)

(declare-fun tp!90971 () Bool)

(declare-fun e!687515 () Bool)

(assert (=> mapNonEmpty!47902 (= mapRes!47902 (and tp!90971 e!687515))))

(declare-fun mapKey!47902 () (_ BitVec 32))

(declare-fun mapRest!47902 () (Array (_ BitVec 32) ValueCell!14633))

(declare-fun mapValue!47902 () ValueCell!14633)

(assert (=> mapNonEmpty!47902 (= mapRest!47893 (store mapRest!47902 mapKey!47902 mapValue!47902))))

(declare-fun b!1210347 () Bool)

(assert (=> b!1210347 (= e!687514 tp_is_empty!30685)))

(declare-fun b!1210346 () Bool)

(assert (=> b!1210346 (= e!687515 tp_is_empty!30685)))

(assert (= (and mapNonEmpty!47893 condMapEmpty!47902) mapIsEmpty!47902))

(assert (= (and mapNonEmpty!47893 (not condMapEmpty!47902)) mapNonEmpty!47902))

(assert (= (and mapNonEmpty!47902 ((_ is ValueCellFull!14633) mapValue!47902)) b!1210346))

(assert (= (and mapNonEmpty!47893 ((_ is ValueCellFull!14633) mapDefault!47902)) b!1210347))

(declare-fun m!1116499 () Bool)

(assert (=> mapNonEmpty!47902 m!1116499))

(declare-fun b_lambda!21563 () Bool)

(assert (= b_lambda!21553 (or (and start!101182 b_free!25981) b_lambda!21563)))

(declare-fun b_lambda!21565 () Bool)

(assert (= b_lambda!21545 (or (and start!101182 b_free!25981) b_lambda!21565)))

(declare-fun b_lambda!21567 () Bool)

(assert (= b_lambda!21559 (or (and start!101182 b_free!25981) b_lambda!21567)))

(declare-fun b_lambda!21569 () Bool)

(assert (= b_lambda!21561 (or (and start!101182 b_free!25981) b_lambda!21569)))

(declare-fun b_lambda!21571 () Bool)

(assert (= b_lambda!21557 (or (and start!101182 b_free!25981) b_lambda!21571)))

(declare-fun b_lambda!21573 () Bool)

(assert (= b_lambda!21555 (or (and start!101182 b_free!25981) b_lambda!21573)))

(declare-fun b_lambda!21575 () Bool)

(assert (= b_lambda!21549 (or (and start!101182 b_free!25981) b_lambda!21575)))

(declare-fun b_lambda!21577 () Bool)

(assert (= b_lambda!21551 (or (and start!101182 b_free!25981) b_lambda!21577)))

(declare-fun b_lambda!21579 () Bool)

(assert (= b_lambda!21547 (or (and start!101182 b_free!25981) b_lambda!21579)))

(check-sat (not b!1210326) (not b!1210291) (not d!133765) (not b!1210280) (not b!1210275) (not d!133737) (not d!133739) (not b_lambda!21571) (not mapNonEmpty!47902) (not b!1210325) (not b!1210230) (not b!1210329) (not b!1210224) (not bm!59329) (not d!133775) (not b!1210177) (not d!133761) (not b!1210337) b_and!43055 (not bm!59312) (not b!1210331) (not b_lambda!21543) (not b_lambda!21577) (not b!1210258) (not b!1210262) (not b!1210302) (not b!1210311) (not b!1210300) (not b!1210222) (not b!1210217) (not d!133755) (not b!1210313) (not b!1210269) (not b!1210339) tp_is_empty!30685 (not bm!59315) (not b!1210263) (not bm!59326) (not d!133723) (not b!1210308) (not b!1210332) (not b!1210273) (not b!1210212) (not b!1210314) (not b!1210231) (not bm!59319) (not b!1210179) (not b_lambda!21569) (not b!1210245) (not b!1210260) (not b!1210180) (not d!133751) (not b_lambda!21579) (not b!1210305) (not b!1210272) (not b!1210220) (not d!133735) (not b!1210286) (not b!1210307) (not b!1210246) (not b_lambda!21567) (not b!1210270) (not bm!59328) (not d!133777) (not b_lambda!21573) (not b!1210306) (not b!1210214) (not b!1210238) (not b!1210315) (not bm!59330) (not b!1210216) (not b!1210303) (not bm!59320) (not d!133763) (not b!1210320) (not b!1210281) (not b!1210319) (not b!1210283) (not d!133747) (not b!1210327) (not bm!59321) (not b!1210285) (not b!1210335) (not d!133731) (not b!1210330) (not b!1210323) (not b!1210211) (not b!1210257) (not b!1210277) (not b!1210240) (not b!1210274) (not d!133773) (not d!133767) (not b!1210186) (not b!1210215) (not d!133749) (not bm!59327) (not b_lambda!21563) (not b!1210317) (not d!133745) (not b!1210318) (not b_lambda!21575) (not b_next!25981) (not d!133725) (not b_lambda!21565) (not bm!59318))
(check-sat b_and!43055 (not b_next!25981))
