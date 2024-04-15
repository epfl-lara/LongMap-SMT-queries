; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101638 () Bool)

(assert start!101638)

(declare-fun b_free!26365 () Bool)

(declare-fun b_next!26365 () Bool)

(assert (=> start!101638 (= b_free!26365 (not b_next!26365))))

(declare-fun tp!92138 () Bool)

(declare-fun b_and!43955 () Bool)

(assert (=> start!101638 (= tp!92138 b_and!43955)))

(declare-fun b!1222433 () Bool)

(declare-fun res!812215 () Bool)

(declare-fun e!694237 () Bool)

(assert (=> b!1222433 (=> (not res!812215) (not e!694237))))

(declare-datatypes ((array!78842 0))(
  ( (array!78843 (arr!38049 (Array (_ BitVec 32) (_ BitVec 64))) (size!38587 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78842)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1222433 (= res!812215 (= (select (arr!38049 _keys!1208) i!673) k0!934))))

(declare-fun b!1222434 () Bool)

(declare-fun res!812223 () Bool)

(assert (=> b!1222434 (=> (not res!812223) (not e!694237))))

(declare-datatypes ((List!26941 0))(
  ( (Nil!26938) (Cons!26937 (h!28146 (_ BitVec 64)) (t!40277 List!26941)) )
))
(declare-fun arrayNoDuplicates!0 (array!78842 (_ BitVec 32) List!26941) Bool)

(assert (=> b!1222434 (= res!812223 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26938))))

(declare-fun b!1222435 () Bool)

(declare-fun e!694233 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222435 (= e!694233 (not (= (select (arr!38049 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!40334 0))(
  ( (Unit!40335) )
))
(declare-fun lt!556066 () Unit!40334)

(declare-fun e!694232 () Unit!40334)

(assert (=> b!1222435 (= lt!556066 e!694232)))

(declare-fun c!120308 () Bool)

(assert (=> b!1222435 (= c!120308 (= (select (arr!38049 _keys!1208) from!1455) k0!934))))

(declare-fun e!694231 () Bool)

(assert (=> b!1222435 e!694231))

(declare-fun res!812221 () Bool)

(assert (=> b!1222435 (=> (not res!812221) (not e!694231))))

(declare-datatypes ((V!46553 0))(
  ( (V!46554 (val!15591 Int)) )
))
(declare-datatypes ((tuple2!20162 0))(
  ( (tuple2!20163 (_1!10092 (_ BitVec 64)) (_2!10092 V!46553)) )
))
(declare-datatypes ((List!26942 0))(
  ( (Nil!26939) (Cons!26938 (h!28147 tuple2!20162) (t!40278 List!26942)) )
))
(declare-datatypes ((ListLongMap!18131 0))(
  ( (ListLongMap!18132 (toList!9081 List!26942)) )
))
(declare-fun lt!556065 () ListLongMap!18131)

(declare-fun lt!556058 () V!46553)

(declare-datatypes ((ValueCell!14825 0))(
  ( (ValueCellFull!14825 (v!18251 V!46553)) (EmptyCell!14825) )
))
(declare-datatypes ((array!78844 0))(
  ( (array!78845 (arr!38050 (Array (_ BitVec 32) ValueCell!14825)) (size!38588 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78844)

(declare-fun lt!556069 () ListLongMap!18131)

(declare-fun +!4143 (ListLongMap!18131 tuple2!20162) ListLongMap!18131)

(declare-fun get!19438 (ValueCell!14825 V!46553) V!46553)

(assert (=> b!1222435 (= res!812221 (= lt!556065 (+!4143 lt!556069 (tuple2!20163 (select (arr!38049 _keys!1208) from!1455) (get!19438 (select (arr!38050 _values!996) from!1455) lt!556058)))))))

(declare-fun b!1222436 () Bool)

(declare-fun e!694234 () Bool)

(declare-fun e!694242 () Bool)

(assert (=> b!1222436 (= e!694234 e!694242)))

(declare-fun res!812214 () Bool)

(assert (=> b!1222436 (=> res!812214 e!694242)))

(assert (=> b!1222436 (= res!812214 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46553)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556068 () array!78842)

(declare-fun lt!556064 () array!78844)

(declare-fun minValue!944 () V!46553)

(declare-fun getCurrentListMapNoExtraKeys!5515 (array!78842 array!78844 (_ BitVec 32) (_ BitVec 32) V!46553 V!46553 (_ BitVec 32) Int) ListLongMap!18131)

(assert (=> b!1222436 (= lt!556065 (getCurrentListMapNoExtraKeys!5515 lt!556068 lt!556064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222436 (= lt!556064 (array!78845 (store (arr!38050 _values!996) i!673 (ValueCellFull!14825 lt!556058)) (size!38588 _values!996)))))

(declare-fun dynLambda!3363 (Int (_ BitVec 64)) V!46553)

(assert (=> b!1222436 (= lt!556058 (dynLambda!3363 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556063 () ListLongMap!18131)

(assert (=> b!1222436 (= lt!556063 (getCurrentListMapNoExtraKeys!5515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222437 () Bool)

(declare-fun e!694235 () Bool)

(assert (=> b!1222437 (= e!694237 e!694235)))

(declare-fun res!812218 () Bool)

(assert (=> b!1222437 (=> (not res!812218) (not e!694235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78842 (_ BitVec 32)) Bool)

(assert (=> b!1222437 (= res!812218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556068 mask!1564))))

(assert (=> b!1222437 (= lt!556068 (array!78843 (store (arr!38049 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38587 _keys!1208)))))

(declare-fun b!1222438 () Bool)

(declare-fun res!812219 () Bool)

(assert (=> b!1222438 (=> (not res!812219) (not e!694235))))

(assert (=> b!1222438 (= res!812219 (arrayNoDuplicates!0 lt!556068 #b00000000000000000000000000000000 Nil!26938))))

(declare-fun b!1222439 () Bool)

(declare-fun e!694241 () Bool)

(assert (=> b!1222439 (= e!694231 e!694241)))

(declare-fun res!812220 () Bool)

(assert (=> b!1222439 (=> res!812220 e!694241)))

(assert (=> b!1222439 (= res!812220 (not (= (select (arr!38049 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222440 () Bool)

(declare-fun res!812226 () Bool)

(assert (=> b!1222440 (=> (not res!812226) (not e!694237))))

(assert (=> b!1222440 (= res!812226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48499 () Bool)

(declare-fun mapRes!48499 () Bool)

(declare-fun tp!92137 () Bool)

(declare-fun e!694236 () Bool)

(assert (=> mapNonEmpty!48499 (= mapRes!48499 (and tp!92137 e!694236))))

(declare-fun mapRest!48499 () (Array (_ BitVec 32) ValueCell!14825))

(declare-fun mapValue!48499 () ValueCell!14825)

(declare-fun mapKey!48499 () (_ BitVec 32))

(assert (=> mapNonEmpty!48499 (= (arr!38050 _values!996) (store mapRest!48499 mapKey!48499 mapValue!48499))))

(declare-fun b!1222441 () Bool)

(declare-fun Unit!40336 () Unit!40334)

(assert (=> b!1222441 (= e!694232 Unit!40336)))

(declare-fun b!1222442 () Bool)

(declare-fun res!812217 () Bool)

(assert (=> b!1222442 (=> (not res!812217) (not e!694237))))

(assert (=> b!1222442 (= res!812217 (and (= (size!38588 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38587 _keys!1208) (size!38588 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222443 () Bool)

(declare-fun res!812216 () Bool)

(assert (=> b!1222443 (=> (not res!812216) (not e!694237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222443 (= res!812216 (validMask!0 mask!1564))))

(declare-fun b!1222444 () Bool)

(declare-fun Unit!40337 () Unit!40334)

(assert (=> b!1222444 (= e!694232 Unit!40337)))

(declare-fun lt!556059 () Unit!40334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78842 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40334)

(assert (=> b!1222444 (= lt!556059 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222444 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556061 () Unit!40334)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78842 (_ BitVec 32) (_ BitVec 32)) Unit!40334)

(assert (=> b!1222444 (= lt!556061 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222444 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26938)))

(declare-fun lt!556070 () Unit!40334)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78842 (_ BitVec 64) (_ BitVec 32) List!26941) Unit!40334)

(assert (=> b!1222444 (= lt!556070 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26938))))

(assert (=> b!1222444 false))

(declare-fun b!1222445 () Bool)

(declare-fun res!812227 () Bool)

(assert (=> b!1222445 (=> (not res!812227) (not e!694237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222445 (= res!812227 (validKeyInArray!0 k0!934))))

(declare-fun b!1222446 () Bool)

(declare-fun e!694239 () Bool)

(declare-fun e!694240 () Bool)

(assert (=> b!1222446 (= e!694239 (and e!694240 mapRes!48499))))

(declare-fun condMapEmpty!48499 () Bool)

(declare-fun mapDefault!48499 () ValueCell!14825)

(assert (=> b!1222446 (= condMapEmpty!48499 (= (arr!38050 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14825)) mapDefault!48499)))))

(declare-fun b!1222447 () Bool)

(assert (=> b!1222447 (= e!694241 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48499 () Bool)

(assert (=> mapIsEmpty!48499 mapRes!48499))

(declare-fun b!1222448 () Bool)

(declare-fun tp_is_empty!31069 () Bool)

(assert (=> b!1222448 (= e!694236 tp_is_empty!31069)))

(declare-fun b!1222449 () Bool)

(declare-fun res!812222 () Bool)

(assert (=> b!1222449 (=> (not res!812222) (not e!694237))))

(assert (=> b!1222449 (= res!812222 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38587 _keys!1208))))))

(declare-fun b!1222450 () Bool)

(assert (=> b!1222450 (= e!694235 (not e!694234))))

(declare-fun res!812224 () Bool)

(assert (=> b!1222450 (=> res!812224 e!694234)))

(assert (=> b!1222450 (= res!812224 (bvsgt from!1455 i!673))))

(assert (=> b!1222450 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556062 () Unit!40334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78842 (_ BitVec 64) (_ BitVec 32)) Unit!40334)

(assert (=> b!1222450 (= lt!556062 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222451 () Bool)

(assert (=> b!1222451 (= e!694240 tp_is_empty!31069)))

(declare-fun res!812213 () Bool)

(assert (=> start!101638 (=> (not res!812213) (not e!694237))))

(assert (=> start!101638 (= res!812213 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38587 _keys!1208))))))

(assert (=> start!101638 e!694237))

(assert (=> start!101638 tp_is_empty!31069))

(declare-fun array_inv!29076 (array!78842) Bool)

(assert (=> start!101638 (array_inv!29076 _keys!1208)))

(assert (=> start!101638 true))

(assert (=> start!101638 tp!92138))

(declare-fun array_inv!29077 (array!78844) Bool)

(assert (=> start!101638 (and (array_inv!29077 _values!996) e!694239)))

(declare-fun b!1222452 () Bool)

(assert (=> b!1222452 (= e!694242 e!694233)))

(declare-fun res!812225 () Bool)

(assert (=> b!1222452 (=> res!812225 e!694233)))

(assert (=> b!1222452 (= res!812225 (not (validKeyInArray!0 (select (arr!38049 _keys!1208) from!1455))))))

(declare-fun lt!556060 () ListLongMap!18131)

(assert (=> b!1222452 (= lt!556060 lt!556069)))

(declare-fun lt!556067 () ListLongMap!18131)

(declare-fun -!1906 (ListLongMap!18131 (_ BitVec 64)) ListLongMap!18131)

(assert (=> b!1222452 (= lt!556069 (-!1906 lt!556067 k0!934))))

(assert (=> b!1222452 (= lt!556060 (getCurrentListMapNoExtraKeys!5515 lt!556068 lt!556064 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222452 (= lt!556067 (getCurrentListMapNoExtraKeys!5515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556071 () Unit!40334)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1141 (array!78842 array!78844 (_ BitVec 32) (_ BitVec 32) V!46553 V!46553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40334)

(assert (=> b!1222452 (= lt!556071 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101638 res!812213) b!1222443))

(assert (= (and b!1222443 res!812216) b!1222442))

(assert (= (and b!1222442 res!812217) b!1222440))

(assert (= (and b!1222440 res!812226) b!1222434))

(assert (= (and b!1222434 res!812223) b!1222449))

(assert (= (and b!1222449 res!812222) b!1222445))

(assert (= (and b!1222445 res!812227) b!1222433))

(assert (= (and b!1222433 res!812215) b!1222437))

(assert (= (and b!1222437 res!812218) b!1222438))

(assert (= (and b!1222438 res!812219) b!1222450))

(assert (= (and b!1222450 (not res!812224)) b!1222436))

(assert (= (and b!1222436 (not res!812214)) b!1222452))

(assert (= (and b!1222452 (not res!812225)) b!1222435))

(assert (= (and b!1222435 res!812221) b!1222439))

(assert (= (and b!1222439 (not res!812220)) b!1222447))

(assert (= (and b!1222435 c!120308) b!1222444))

(assert (= (and b!1222435 (not c!120308)) b!1222441))

(assert (= (and b!1222446 condMapEmpty!48499) mapIsEmpty!48499))

(assert (= (and b!1222446 (not condMapEmpty!48499)) mapNonEmpty!48499))

(get-info :version)

(assert (= (and mapNonEmpty!48499 ((_ is ValueCellFull!14825) mapValue!48499)) b!1222448))

(assert (= (and b!1222446 ((_ is ValueCellFull!14825) mapDefault!48499)) b!1222451))

(assert (= start!101638 b!1222446))

(declare-fun b_lambda!22297 () Bool)

(assert (=> (not b_lambda!22297) (not b!1222436)))

(declare-fun t!40276 () Bool)

(declare-fun tb!11157 () Bool)

(assert (=> (and start!101638 (= defaultEntry!1004 defaultEntry!1004) t!40276) tb!11157))

(declare-fun result!22933 () Bool)

(assert (=> tb!11157 (= result!22933 tp_is_empty!31069)))

(assert (=> b!1222436 t!40276))

(declare-fun b_and!43957 () Bool)

(assert (= b_and!43955 (and (=> t!40276 result!22933) b_and!43957)))

(declare-fun m!1126913 () Bool)

(assert (=> b!1222436 m!1126913))

(declare-fun m!1126915 () Bool)

(assert (=> b!1222436 m!1126915))

(declare-fun m!1126917 () Bool)

(assert (=> b!1222436 m!1126917))

(declare-fun m!1126919 () Bool)

(assert (=> b!1222436 m!1126919))

(declare-fun m!1126921 () Bool)

(assert (=> b!1222438 m!1126921))

(declare-fun m!1126923 () Bool)

(assert (=> b!1222434 m!1126923))

(declare-fun m!1126925 () Bool)

(assert (=> b!1222439 m!1126925))

(declare-fun m!1126927 () Bool)

(assert (=> b!1222433 m!1126927))

(declare-fun m!1126929 () Bool)

(assert (=> mapNonEmpty!48499 m!1126929))

(declare-fun m!1126931 () Bool)

(assert (=> b!1222437 m!1126931))

(declare-fun m!1126933 () Bool)

(assert (=> b!1222437 m!1126933))

(declare-fun m!1126935 () Bool)

(assert (=> b!1222450 m!1126935))

(declare-fun m!1126937 () Bool)

(assert (=> b!1222450 m!1126937))

(assert (=> b!1222435 m!1126925))

(declare-fun m!1126939 () Bool)

(assert (=> b!1222435 m!1126939))

(assert (=> b!1222435 m!1126939))

(declare-fun m!1126941 () Bool)

(assert (=> b!1222435 m!1126941))

(declare-fun m!1126943 () Bool)

(assert (=> b!1222435 m!1126943))

(declare-fun m!1126945 () Bool)

(assert (=> b!1222443 m!1126945))

(declare-fun m!1126947 () Bool)

(assert (=> b!1222444 m!1126947))

(declare-fun m!1126949 () Bool)

(assert (=> b!1222444 m!1126949))

(declare-fun m!1126951 () Bool)

(assert (=> b!1222444 m!1126951))

(declare-fun m!1126953 () Bool)

(assert (=> b!1222444 m!1126953))

(declare-fun m!1126955 () Bool)

(assert (=> b!1222444 m!1126955))

(declare-fun m!1126957 () Bool)

(assert (=> b!1222447 m!1126957))

(declare-fun m!1126959 () Bool)

(assert (=> b!1222452 m!1126959))

(declare-fun m!1126961 () Bool)

(assert (=> b!1222452 m!1126961))

(declare-fun m!1126963 () Bool)

(assert (=> b!1222452 m!1126963))

(assert (=> b!1222452 m!1126925))

(declare-fun m!1126965 () Bool)

(assert (=> b!1222452 m!1126965))

(declare-fun m!1126967 () Bool)

(assert (=> b!1222452 m!1126967))

(assert (=> b!1222452 m!1126925))

(declare-fun m!1126969 () Bool)

(assert (=> start!101638 m!1126969))

(declare-fun m!1126971 () Bool)

(assert (=> start!101638 m!1126971))

(declare-fun m!1126973 () Bool)

(assert (=> b!1222445 m!1126973))

(declare-fun m!1126975 () Bool)

(assert (=> b!1222440 m!1126975))

(check-sat (not b!1222435) (not b_lambda!22297) (not b!1222436) (not start!101638) (not b!1222434) (not b!1222450) (not b!1222437) (not mapNonEmpty!48499) (not b!1222444) (not b!1222447) b_and!43957 tp_is_empty!31069 (not b!1222443) (not b!1222445) (not b!1222452) (not b!1222440) (not b!1222438) (not b_next!26365))
(check-sat b_and!43957 (not b_next!26365))
