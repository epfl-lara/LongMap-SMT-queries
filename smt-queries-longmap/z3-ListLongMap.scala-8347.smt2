; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101634 () Bool)

(assert start!101634)

(declare-fun b_free!26355 () Bool)

(declare-fun b_next!26355 () Bool)

(assert (=> start!101634 (= b_free!26355 (not b_next!26355))))

(declare-fun tp!92107 () Bool)

(declare-fun b_and!43953 () Bool)

(assert (=> start!101634 (= tp!92107 b_and!43953)))

(declare-fun b!1222236 () Bool)

(declare-fun e!694129 () Bool)

(declare-fun tp_is_empty!31059 () Bool)

(assert (=> b!1222236 (= e!694129 tp_is_empty!31059)))

(declare-fun b!1222237 () Bool)

(declare-fun e!694123 () Bool)

(declare-fun e!694121 () Bool)

(assert (=> b!1222237 (= e!694123 e!694121)))

(declare-fun res!812049 () Bool)

(assert (=> b!1222237 (=> (not res!812049) (not e!694121))))

(declare-datatypes ((array!78901 0))(
  ( (array!78902 (arr!38078 (Array (_ BitVec 32) (_ BitVec 64))) (size!38614 (_ BitVec 32))) )
))
(declare-fun lt!556040 () array!78901)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78901 (_ BitVec 32)) Bool)

(assert (=> b!1222237 (= res!812049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556040 mask!1564))))

(declare-fun _keys!1208 () array!78901)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222237 (= lt!556040 (array!78902 (store (arr!38078 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38614 _keys!1208)))))

(declare-fun b!1222238 () Bool)

(declare-fun e!694122 () Bool)

(declare-fun e!694125 () Bool)

(declare-fun mapRes!48484 () Bool)

(assert (=> b!1222238 (= e!694122 (and e!694125 mapRes!48484))))

(declare-fun condMapEmpty!48484 () Bool)

(declare-datatypes ((V!46539 0))(
  ( (V!46540 (val!15586 Int)) )
))
(declare-datatypes ((ValueCell!14820 0))(
  ( (ValueCellFull!14820 (v!18247 V!46539)) (EmptyCell!14820) )
))
(declare-datatypes ((array!78903 0))(
  ( (array!78904 (arr!38079 (Array (_ BitVec 32) ValueCell!14820)) (size!38615 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78903)

(declare-fun mapDefault!48484 () ValueCell!14820)

(assert (=> b!1222238 (= condMapEmpty!48484 (= (arr!38079 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14820)) mapDefault!48484)))))

(declare-fun b!1222239 () Bool)

(declare-fun e!694130 () Bool)

(declare-fun e!694127 () Bool)

(assert (=> b!1222239 (= e!694130 e!694127)))

(declare-fun res!812047 () Bool)

(assert (=> b!1222239 (=> res!812047 e!694127)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222239 (= res!812047 (not (validKeyInArray!0 (select (arr!38078 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20074 0))(
  ( (tuple2!20075 (_1!10048 (_ BitVec 64)) (_2!10048 V!46539)) )
))
(declare-datatypes ((List!26874 0))(
  ( (Nil!26871) (Cons!26870 (h!28079 tuple2!20074) (t!40209 List!26874)) )
))
(declare-datatypes ((ListLongMap!18043 0))(
  ( (ListLongMap!18044 (toList!9037 List!26874)) )
))
(declare-fun lt!556042 () ListLongMap!18043)

(declare-fun lt!556041 () ListLongMap!18043)

(assert (=> b!1222239 (= lt!556042 lt!556041)))

(declare-fun lt!556033 () ListLongMap!18043)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1941 (ListLongMap!18043 (_ BitVec 64)) ListLongMap!18043)

(assert (=> b!1222239 (= lt!556041 (-!1941 lt!556033 k0!934))))

(declare-fun zeroValue!944 () V!46539)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556034 () array!78903)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46539)

(declare-fun getCurrentListMapNoExtraKeys!5459 (array!78901 array!78903 (_ BitVec 32) (_ BitVec 32) V!46539 V!46539 (_ BitVec 32) Int) ListLongMap!18043)

(assert (=> b!1222239 (= lt!556042 (getCurrentListMapNoExtraKeys!5459 lt!556040 lt!556034 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222239 (= lt!556033 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40478 0))(
  ( (Unit!40479) )
))
(declare-fun lt!556039 () Unit!40478)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1148 (array!78901 array!78903 (_ BitVec 32) (_ BitVec 32) V!46539 V!46539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40478)

(assert (=> b!1222239 (= lt!556039 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1148 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222240 () Bool)

(declare-fun res!812055 () Bool)

(assert (=> b!1222240 (=> (not res!812055) (not e!694123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222240 (= res!812055 (validMask!0 mask!1564))))

(declare-fun b!1222241 () Bool)

(declare-fun res!812059 () Bool)

(assert (=> b!1222241 (=> (not res!812059) (not e!694123))))

(assert (=> b!1222241 (= res!812059 (= (select (arr!38078 _keys!1208) i!673) k0!934))))

(declare-fun b!1222242 () Bool)

(declare-fun res!812046 () Bool)

(assert (=> b!1222242 (=> (not res!812046) (not e!694123))))

(declare-datatypes ((List!26875 0))(
  ( (Nil!26872) (Cons!26871 (h!28080 (_ BitVec 64)) (t!40210 List!26875)) )
))
(declare-fun arrayNoDuplicates!0 (array!78901 (_ BitVec 32) List!26875) Bool)

(assert (=> b!1222242 (= res!812046 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26872))))

(declare-fun mapNonEmpty!48484 () Bool)

(declare-fun tp!92108 () Bool)

(assert (=> mapNonEmpty!48484 (= mapRes!48484 (and tp!92108 e!694129))))

(declare-fun mapValue!48484 () ValueCell!14820)

(declare-fun mapKey!48484 () (_ BitVec 32))

(declare-fun mapRest!48484 () (Array (_ BitVec 32) ValueCell!14820))

(assert (=> mapNonEmpty!48484 (= (arr!38079 _values!996) (store mapRest!48484 mapKey!48484 mapValue!48484))))

(declare-fun b!1222243 () Bool)

(assert (=> b!1222243 (= e!694125 tp_is_empty!31059)))

(declare-fun b!1222245 () Bool)

(declare-fun e!694120 () Bool)

(assert (=> b!1222245 (= e!694121 (not e!694120))))

(declare-fun res!812053 () Bool)

(assert (=> b!1222245 (=> res!812053 e!694120)))

(assert (=> b!1222245 (= res!812053 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222245 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556043 () Unit!40478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78901 (_ BitVec 64) (_ BitVec 32)) Unit!40478)

(assert (=> b!1222245 (= lt!556043 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!694131 () Bool)

(declare-fun b!1222246 () Bool)

(assert (=> b!1222246 (= e!694131 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222247 () Bool)

(declare-fun res!812048 () Bool)

(assert (=> b!1222247 (=> (not res!812048) (not e!694123))))

(assert (=> b!1222247 (= res!812048 (and (= (size!38615 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38614 _keys!1208) (size!38615 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222248 () Bool)

(assert (=> b!1222248 (= e!694120 e!694130)))

(declare-fun res!812045 () Bool)

(assert (=> b!1222248 (=> res!812045 e!694130)))

(assert (=> b!1222248 (= res!812045 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556037 () ListLongMap!18043)

(assert (=> b!1222248 (= lt!556037 (getCurrentListMapNoExtraKeys!5459 lt!556040 lt!556034 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556044 () V!46539)

(assert (=> b!1222248 (= lt!556034 (array!78904 (store (arr!38079 _values!996) i!673 (ValueCellFull!14820 lt!556044)) (size!38615 _values!996)))))

(declare-fun dynLambda!3337 (Int (_ BitVec 64)) V!46539)

(assert (=> b!1222248 (= lt!556044 (dynLambda!3337 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556038 () ListLongMap!18043)

(assert (=> b!1222248 (= lt!556038 (getCurrentListMapNoExtraKeys!5459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222249 () Bool)

(declare-fun res!812057 () Bool)

(assert (=> b!1222249 (=> (not res!812057) (not e!694123))))

(assert (=> b!1222249 (= res!812057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222250 () Bool)

(declare-fun res!812058 () Bool)

(assert (=> b!1222250 (=> (not res!812058) (not e!694121))))

(assert (=> b!1222250 (= res!812058 (arrayNoDuplicates!0 lt!556040 #b00000000000000000000000000000000 Nil!26872))))

(declare-fun b!1222244 () Bool)

(declare-fun res!812056 () Bool)

(assert (=> b!1222244 (=> (not res!812056) (not e!694123))))

(assert (=> b!1222244 (= res!812056 (validKeyInArray!0 k0!934))))

(declare-fun res!812060 () Bool)

(assert (=> start!101634 (=> (not res!812060) (not e!694123))))

(assert (=> start!101634 (= res!812060 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38614 _keys!1208))))))

(assert (=> start!101634 e!694123))

(assert (=> start!101634 tp_is_empty!31059))

(declare-fun array_inv!28972 (array!78901) Bool)

(assert (=> start!101634 (array_inv!28972 _keys!1208)))

(assert (=> start!101634 true))

(assert (=> start!101634 tp!92107))

(declare-fun array_inv!28973 (array!78903) Bool)

(assert (=> start!101634 (and (array_inv!28973 _values!996) e!694122)))

(declare-fun b!1222251 () Bool)

(declare-fun res!812052 () Bool)

(assert (=> b!1222251 (=> (not res!812052) (not e!694123))))

(assert (=> b!1222251 (= res!812052 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38614 _keys!1208))))))

(declare-fun b!1222252 () Bool)

(declare-fun e!694128 () Bool)

(assert (=> b!1222252 (= e!694128 true)))

(assert (=> b!1222252 false))

(declare-fun lt!556036 () Unit!40478)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78901 (_ BitVec 64) (_ BitVec 32) List!26875) Unit!40478)

(assert (=> b!1222252 (= lt!556036 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26872))))

(assert (=> b!1222252 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26872)))

(declare-fun lt!556045 () Unit!40478)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78901 (_ BitVec 32) (_ BitVec 32)) Unit!40478)

(assert (=> b!1222252 (= lt!556045 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222252 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556035 () Unit!40478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78901 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40478)

(assert (=> b!1222252 (= lt!556035 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222253 () Bool)

(assert (=> b!1222253 (= e!694127 e!694128)))

(declare-fun res!812051 () Bool)

(assert (=> b!1222253 (=> res!812051 e!694128)))

(assert (=> b!1222253 (= res!812051 (not (= (select (arr!38078 _keys!1208) from!1455) k0!934)))))

(declare-fun e!694124 () Bool)

(assert (=> b!1222253 e!694124))

(declare-fun res!812050 () Bool)

(assert (=> b!1222253 (=> (not res!812050) (not e!694124))))

(declare-fun +!4098 (ListLongMap!18043 tuple2!20074) ListLongMap!18043)

(declare-fun get!19437 (ValueCell!14820 V!46539) V!46539)

(assert (=> b!1222253 (= res!812050 (= lt!556037 (+!4098 lt!556041 (tuple2!20075 (select (arr!38078 _keys!1208) from!1455) (get!19437 (select (arr!38079 _values!996) from!1455) lt!556044)))))))

(declare-fun mapIsEmpty!48484 () Bool)

(assert (=> mapIsEmpty!48484 mapRes!48484))

(declare-fun b!1222254 () Bool)

(assert (=> b!1222254 (= e!694124 e!694131)))

(declare-fun res!812054 () Bool)

(assert (=> b!1222254 (=> res!812054 e!694131)))

(assert (=> b!1222254 (= res!812054 (not (= (select (arr!38078 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!101634 res!812060) b!1222240))

(assert (= (and b!1222240 res!812055) b!1222247))

(assert (= (and b!1222247 res!812048) b!1222249))

(assert (= (and b!1222249 res!812057) b!1222242))

(assert (= (and b!1222242 res!812046) b!1222251))

(assert (= (and b!1222251 res!812052) b!1222244))

(assert (= (and b!1222244 res!812056) b!1222241))

(assert (= (and b!1222241 res!812059) b!1222237))

(assert (= (and b!1222237 res!812049) b!1222250))

(assert (= (and b!1222250 res!812058) b!1222245))

(assert (= (and b!1222245 (not res!812053)) b!1222248))

(assert (= (and b!1222248 (not res!812045)) b!1222239))

(assert (= (and b!1222239 (not res!812047)) b!1222253))

(assert (= (and b!1222253 res!812050) b!1222254))

(assert (= (and b!1222254 (not res!812054)) b!1222246))

(assert (= (and b!1222253 (not res!812051)) b!1222252))

(assert (= (and b!1222238 condMapEmpty!48484) mapIsEmpty!48484))

(assert (= (and b!1222238 (not condMapEmpty!48484)) mapNonEmpty!48484))

(get-info :version)

(assert (= (and mapNonEmpty!48484 ((_ is ValueCellFull!14820) mapValue!48484)) b!1222236))

(assert (= (and b!1222238 ((_ is ValueCellFull!14820) mapDefault!48484)) b!1222243))

(assert (= start!101634 b!1222238))

(declare-fun b_lambda!22297 () Bool)

(assert (=> (not b_lambda!22297) (not b!1222248)))

(declare-fun t!40208 () Bool)

(declare-fun tb!11155 () Bool)

(assert (=> (and start!101634 (= defaultEntry!1004 defaultEntry!1004) t!40208) tb!11155))

(declare-fun result!22921 () Bool)

(assert (=> tb!11155 (= result!22921 tp_is_empty!31059)))

(assert (=> b!1222248 t!40208))

(declare-fun b_and!43955 () Bool)

(assert (= b_and!43953 (and (=> t!40208 result!22921) b_and!43955)))

(declare-fun m!1127157 () Bool)

(assert (=> b!1222237 m!1127157))

(declare-fun m!1127159 () Bool)

(assert (=> b!1222237 m!1127159))

(declare-fun m!1127161 () Bool)

(assert (=> b!1222252 m!1127161))

(declare-fun m!1127163 () Bool)

(assert (=> b!1222252 m!1127163))

(declare-fun m!1127165 () Bool)

(assert (=> b!1222252 m!1127165))

(declare-fun m!1127167 () Bool)

(assert (=> b!1222252 m!1127167))

(declare-fun m!1127169 () Bool)

(assert (=> b!1222252 m!1127169))

(declare-fun m!1127171 () Bool)

(assert (=> b!1222248 m!1127171))

(declare-fun m!1127173 () Bool)

(assert (=> b!1222248 m!1127173))

(declare-fun m!1127175 () Bool)

(assert (=> b!1222248 m!1127175))

(declare-fun m!1127177 () Bool)

(assert (=> b!1222248 m!1127177))

(declare-fun m!1127179 () Bool)

(assert (=> start!101634 m!1127179))

(declare-fun m!1127181 () Bool)

(assert (=> start!101634 m!1127181))

(declare-fun m!1127183 () Bool)

(assert (=> b!1222254 m!1127183))

(declare-fun m!1127185 () Bool)

(assert (=> b!1222249 m!1127185))

(declare-fun m!1127187 () Bool)

(assert (=> b!1222239 m!1127187))

(declare-fun m!1127189 () Bool)

(assert (=> b!1222239 m!1127189))

(declare-fun m!1127191 () Bool)

(assert (=> b!1222239 m!1127191))

(declare-fun m!1127193 () Bool)

(assert (=> b!1222239 m!1127193))

(assert (=> b!1222239 m!1127183))

(declare-fun m!1127195 () Bool)

(assert (=> b!1222239 m!1127195))

(assert (=> b!1222239 m!1127183))

(assert (=> b!1222253 m!1127183))

(declare-fun m!1127197 () Bool)

(assert (=> b!1222253 m!1127197))

(assert (=> b!1222253 m!1127197))

(declare-fun m!1127199 () Bool)

(assert (=> b!1222253 m!1127199))

(declare-fun m!1127201 () Bool)

(assert (=> b!1222253 m!1127201))

(declare-fun m!1127203 () Bool)

(assert (=> b!1222242 m!1127203))

(declare-fun m!1127205 () Bool)

(assert (=> b!1222245 m!1127205))

(declare-fun m!1127207 () Bool)

(assert (=> b!1222245 m!1127207))

(declare-fun m!1127209 () Bool)

(assert (=> mapNonEmpty!48484 m!1127209))

(declare-fun m!1127211 () Bool)

(assert (=> b!1222250 m!1127211))

(declare-fun m!1127213 () Bool)

(assert (=> b!1222244 m!1127213))

(declare-fun m!1127215 () Bool)

(assert (=> b!1222241 m!1127215))

(declare-fun m!1127217 () Bool)

(assert (=> b!1222246 m!1127217))

(declare-fun m!1127219 () Bool)

(assert (=> b!1222240 m!1127219))

(check-sat b_and!43955 (not b_lambda!22297) (not b!1222244) tp_is_empty!31059 (not b!1222249) (not mapNonEmpty!48484) (not b_next!26355) (not b!1222253) (not b!1222239) (not start!101634) (not b!1222252) (not b!1222240) (not b!1222250) (not b!1222246) (not b!1222248) (not b!1222242) (not b!1222237) (not b!1222245))
(check-sat b_and!43955 (not b_next!26355))
