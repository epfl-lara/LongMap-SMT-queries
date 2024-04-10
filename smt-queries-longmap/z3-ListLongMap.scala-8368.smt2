; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101792 () Bool)

(assert start!101792)

(declare-fun b_free!26481 () Bool)

(declare-fun b_next!26481 () Bool)

(assert (=> start!101792 (= b_free!26481 (not b_next!26481))))

(declare-fun tp!92488 () Bool)

(declare-fun b_and!44223 () Bool)

(assert (=> start!101792 (= tp!92488 b_and!44223)))

(declare-fun b!1226182 () Bool)

(declare-fun res!814929 () Bool)

(declare-fun e!696402 () Bool)

(assert (=> b!1226182 (=> (not res!814929) (not e!696402))))

(declare-datatypes ((array!79147 0))(
  ( (array!79148 (arr!38200 (Array (_ BitVec 32) (_ BitVec 64))) (size!38736 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79147)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46707 0))(
  ( (V!46708 (val!15649 Int)) )
))
(declare-datatypes ((ValueCell!14883 0))(
  ( (ValueCellFull!14883 (v!18311 V!46707)) (EmptyCell!14883) )
))
(declare-datatypes ((array!79149 0))(
  ( (array!79150 (arr!38201 (Array (_ BitVec 32) ValueCell!14883)) (size!38737 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79149)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1226182 (= res!814929 (and (= (size!38737 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38736 _keys!1208) (size!38737 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226183 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!20170 0))(
  ( (tuple2!20171 (_1!10096 (_ BitVec 64)) (_2!10096 V!46707)) )
))
(declare-datatypes ((List!26973 0))(
  ( (Nil!26970) (Cons!26969 (h!28178 tuple2!20170) (t!40434 List!26973)) )
))
(declare-datatypes ((ListLongMap!18139 0))(
  ( (ListLongMap!18140 (toList!9085 List!26973)) )
))
(declare-fun lt!558723 () ListLongMap!18139)

(declare-fun e!696401 () Bool)

(declare-fun lt!558726 () ListLongMap!18139)

(declare-fun -!1984 (ListLongMap!18139 (_ BitVec 64)) ListLongMap!18139)

(assert (=> b!1226183 (= e!696401 (= lt!558723 (-!1984 lt!558726 k0!934)))))

(declare-fun b!1226184 () Bool)

(declare-fun res!814936 () Bool)

(assert (=> b!1226184 (=> (not res!814936) (not e!696402))))

(declare-datatypes ((List!26974 0))(
  ( (Nil!26971) (Cons!26970 (h!28179 (_ BitVec 64)) (t!40435 List!26974)) )
))
(declare-fun arrayNoDuplicates!0 (array!79147 (_ BitVec 32) List!26974) Bool)

(assert (=> b!1226184 (= res!814936 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26971))))

(declare-fun b!1226185 () Bool)

(declare-fun res!814932 () Bool)

(assert (=> b!1226185 (=> (not res!814932) (not e!696402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226185 (= res!814932 (validMask!0 mask!1564))))

(declare-fun b!1226187 () Bool)

(declare-fun res!814933 () Bool)

(assert (=> b!1226187 (=> (not res!814933) (not e!696402))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226187 (= res!814933 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38736 _keys!1208))))))

(declare-fun b!1226188 () Bool)

(declare-fun res!814934 () Bool)

(declare-fun e!696396 () Bool)

(assert (=> b!1226188 (=> (not res!814934) (not e!696396))))

(declare-fun lt!558728 () array!79147)

(assert (=> b!1226188 (= res!814934 (arrayNoDuplicates!0 lt!558728 #b00000000000000000000000000000000 Nil!26971))))

(declare-fun b!1226189 () Bool)

(declare-fun e!696400 () Bool)

(assert (=> b!1226189 (= e!696396 (not e!696400))))

(declare-fun res!814928 () Bool)

(assert (=> b!1226189 (=> res!814928 e!696400)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1226189 (= res!814928 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226189 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40638 0))(
  ( (Unit!40639) )
))
(declare-fun lt!558725 () Unit!40638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79147 (_ BitVec 64) (_ BitVec 32)) Unit!40638)

(assert (=> b!1226189 (= lt!558725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48676 () Bool)

(declare-fun mapRes!48676 () Bool)

(declare-fun tp!92489 () Bool)

(declare-fun e!696395 () Bool)

(assert (=> mapNonEmpty!48676 (= mapRes!48676 (and tp!92489 e!696395))))

(declare-fun mapRest!48676 () (Array (_ BitVec 32) ValueCell!14883))

(declare-fun mapValue!48676 () ValueCell!14883)

(declare-fun mapKey!48676 () (_ BitVec 32))

(assert (=> mapNonEmpty!48676 (= (arr!38201 _values!996) (store mapRest!48676 mapKey!48676 mapValue!48676))))

(declare-fun b!1226190 () Bool)

(declare-fun e!696403 () Bool)

(assert (=> b!1226190 (= e!696403 e!696401)))

(declare-fun res!814930 () Bool)

(assert (=> b!1226190 (=> res!814930 e!696401)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226190 (= res!814930 (validKeyInArray!0 (select (arr!38200 _keys!1208) from!1455)))))

(declare-fun zeroValue!944 () V!46707)

(declare-fun minValue!944 () V!46707)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558727 () array!79149)

(declare-fun getCurrentListMapNoExtraKeys!5504 (array!79147 array!79149 (_ BitVec 32) (_ BitVec 32) V!46707 V!46707 (_ BitVec 32) Int) ListLongMap!18139)

(assert (=> b!1226190 (= (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1984 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558724 () Unit!40638)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1189 (array!79147 array!79149 (_ BitVec 32) (_ BitVec 32) V!46707 V!46707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40638)

(assert (=> b!1226190 (= lt!558724 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1189 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226191 () Bool)

(declare-fun res!814931 () Bool)

(assert (=> b!1226191 (=> (not res!814931) (not e!696402))))

(assert (=> b!1226191 (= res!814931 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48676 () Bool)

(assert (=> mapIsEmpty!48676 mapRes!48676))

(declare-fun res!814926 () Bool)

(assert (=> start!101792 (=> (not res!814926) (not e!696402))))

(assert (=> start!101792 (= res!814926 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38736 _keys!1208))))))

(assert (=> start!101792 e!696402))

(declare-fun tp_is_empty!31185 () Bool)

(assert (=> start!101792 tp_is_empty!31185))

(declare-fun array_inv!29048 (array!79147) Bool)

(assert (=> start!101792 (array_inv!29048 _keys!1208)))

(assert (=> start!101792 true))

(assert (=> start!101792 tp!92488))

(declare-fun e!696398 () Bool)

(declare-fun array_inv!29049 (array!79149) Bool)

(assert (=> start!101792 (and (array_inv!29049 _values!996) e!696398)))

(declare-fun b!1226186 () Bool)

(assert (=> b!1226186 (= e!696402 e!696396)))

(declare-fun res!814924 () Bool)

(assert (=> b!1226186 (=> (not res!814924) (not e!696396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79147 (_ BitVec 32)) Bool)

(assert (=> b!1226186 (= res!814924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558728 mask!1564))))

(assert (=> b!1226186 (= lt!558728 (array!79148 (store (arr!38200 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38736 _keys!1208)))))

(declare-fun b!1226192 () Bool)

(assert (=> b!1226192 (= e!696400 e!696403)))

(declare-fun res!814935 () Bool)

(assert (=> b!1226192 (=> res!814935 e!696403)))

(assert (=> b!1226192 (= res!814935 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1226192 (= lt!558723 (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3375 (Int (_ BitVec 64)) V!46707)

(assert (=> b!1226192 (= lt!558727 (array!79150 (store (arr!38201 _values!996) i!673 (ValueCellFull!14883 (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38737 _values!996)))))

(assert (=> b!1226192 (= lt!558726 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226193 () Bool)

(declare-fun res!814925 () Bool)

(assert (=> b!1226193 (=> (not res!814925) (not e!696402))))

(assert (=> b!1226193 (= res!814925 (= (select (arr!38200 _keys!1208) i!673) k0!934))))

(declare-fun b!1226194 () Bool)

(declare-fun e!696399 () Bool)

(assert (=> b!1226194 (= e!696398 (and e!696399 mapRes!48676))))

(declare-fun condMapEmpty!48676 () Bool)

(declare-fun mapDefault!48676 () ValueCell!14883)

(assert (=> b!1226194 (= condMapEmpty!48676 (= (arr!38201 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14883)) mapDefault!48676)))))

(declare-fun b!1226195 () Bool)

(assert (=> b!1226195 (= e!696399 tp_is_empty!31185)))

(declare-fun b!1226196 () Bool)

(declare-fun res!814927 () Bool)

(assert (=> b!1226196 (=> (not res!814927) (not e!696402))))

(assert (=> b!1226196 (= res!814927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226197 () Bool)

(assert (=> b!1226197 (= e!696395 tp_is_empty!31185)))

(assert (= (and start!101792 res!814926) b!1226185))

(assert (= (and b!1226185 res!814932) b!1226182))

(assert (= (and b!1226182 res!814929) b!1226196))

(assert (= (and b!1226196 res!814927) b!1226184))

(assert (= (and b!1226184 res!814936) b!1226187))

(assert (= (and b!1226187 res!814933) b!1226191))

(assert (= (and b!1226191 res!814931) b!1226193))

(assert (= (and b!1226193 res!814925) b!1226186))

(assert (= (and b!1226186 res!814924) b!1226188))

(assert (= (and b!1226188 res!814934) b!1226189))

(assert (= (and b!1226189 (not res!814928)) b!1226192))

(assert (= (and b!1226192 (not res!814935)) b!1226190))

(assert (= (and b!1226190 (not res!814930)) b!1226183))

(assert (= (and b!1226194 condMapEmpty!48676) mapIsEmpty!48676))

(assert (= (and b!1226194 (not condMapEmpty!48676)) mapNonEmpty!48676))

(get-info :version)

(assert (= (and mapNonEmpty!48676 ((_ is ValueCellFull!14883) mapValue!48676)) b!1226197))

(assert (= (and b!1226194 ((_ is ValueCellFull!14883) mapDefault!48676)) b!1226195))

(assert (= start!101792 b!1226194))

(declare-fun b_lambda!22461 () Bool)

(assert (=> (not b_lambda!22461) (not b!1226192)))

(declare-fun t!40433 () Bool)

(declare-fun tb!11281 () Bool)

(assert (=> (and start!101792 (= defaultEntry!1004 defaultEntry!1004) t!40433) tb!11281))

(declare-fun result!23175 () Bool)

(assert (=> tb!11281 (= result!23175 tp_is_empty!31185)))

(assert (=> b!1226192 t!40433))

(declare-fun b_and!44225 () Bool)

(assert (= b_and!44223 (and (=> t!40433 result!23175) b_and!44225)))

(declare-fun m!1131257 () Bool)

(assert (=> b!1226192 m!1131257))

(declare-fun m!1131259 () Bool)

(assert (=> b!1226192 m!1131259))

(declare-fun m!1131261 () Bool)

(assert (=> b!1226192 m!1131261))

(declare-fun m!1131263 () Bool)

(assert (=> b!1226192 m!1131263))

(declare-fun m!1131265 () Bool)

(assert (=> mapNonEmpty!48676 m!1131265))

(declare-fun m!1131267 () Bool)

(assert (=> b!1226193 m!1131267))

(declare-fun m!1131269 () Bool)

(assert (=> b!1226190 m!1131269))

(declare-fun m!1131271 () Bool)

(assert (=> b!1226190 m!1131271))

(declare-fun m!1131273 () Bool)

(assert (=> b!1226190 m!1131273))

(assert (=> b!1226190 m!1131269))

(declare-fun m!1131275 () Bool)

(assert (=> b!1226190 m!1131275))

(declare-fun m!1131277 () Bool)

(assert (=> b!1226190 m!1131277))

(declare-fun m!1131279 () Bool)

(assert (=> b!1226190 m!1131279))

(assert (=> b!1226190 m!1131277))

(declare-fun m!1131281 () Bool)

(assert (=> b!1226196 m!1131281))

(declare-fun m!1131283 () Bool)

(assert (=> b!1226191 m!1131283))

(declare-fun m!1131285 () Bool)

(assert (=> b!1226185 m!1131285))

(declare-fun m!1131287 () Bool)

(assert (=> b!1226188 m!1131287))

(declare-fun m!1131289 () Bool)

(assert (=> b!1226186 m!1131289))

(declare-fun m!1131291 () Bool)

(assert (=> b!1226186 m!1131291))

(declare-fun m!1131293 () Bool)

(assert (=> start!101792 m!1131293))

(declare-fun m!1131295 () Bool)

(assert (=> start!101792 m!1131295))

(declare-fun m!1131297 () Bool)

(assert (=> b!1226183 m!1131297))

(declare-fun m!1131299 () Bool)

(assert (=> b!1226189 m!1131299))

(declare-fun m!1131301 () Bool)

(assert (=> b!1226189 m!1131301))

(declare-fun m!1131303 () Bool)

(assert (=> b!1226184 m!1131303))

(check-sat (not b_lambda!22461) (not b!1226196) (not b!1226192) (not b!1226186) tp_is_empty!31185 (not start!101792) (not b!1226189) (not b!1226190) (not mapNonEmpty!48676) (not b!1226191) (not b!1226185) (not b!1226184) b_and!44225 (not b_next!26481) (not b!1226188) (not b!1226183))
(check-sat b_and!44225 (not b_next!26481))
(get-model)

(declare-fun b_lambda!22465 () Bool)

(assert (= b_lambda!22461 (or (and start!101792 b_free!26481) b_lambda!22465)))

(check-sat (not b_lambda!22465) (not b!1226196) (not b!1226192) (not b!1226186) tp_is_empty!31185 (not start!101792) (not b!1226189) (not b!1226190) (not mapNonEmpty!48676) (not b!1226191) (not b!1226185) (not b!1226184) b_and!44225 (not b_next!26481) (not b!1226188) (not b!1226183))
(check-sat b_and!44225 (not b_next!26481))
(get-model)

(declare-fun d!134003 () Bool)

(assert (=> d!134003 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1226185 d!134003))

(declare-fun b!1226258 () Bool)

(declare-fun e!696439 () Bool)

(declare-fun e!696437 () Bool)

(assert (=> b!1226258 (= e!696439 e!696437)))

(declare-fun lt!558754 () (_ BitVec 64))

(assert (=> b!1226258 (= lt!558754 (select (arr!38200 lt!558728) #b00000000000000000000000000000000))))

(declare-fun lt!558755 () Unit!40638)

(assert (=> b!1226258 (= lt!558755 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!558728 lt!558754 #b00000000000000000000000000000000))))

(assert (=> b!1226258 (arrayContainsKey!0 lt!558728 lt!558754 #b00000000000000000000000000000000)))

(declare-fun lt!558753 () Unit!40638)

(assert (=> b!1226258 (= lt!558753 lt!558755)))

(declare-fun res!814981 () Bool)

(declare-datatypes ((SeekEntryResult!9951 0))(
  ( (MissingZero!9951 (index!42175 (_ BitVec 32))) (Found!9951 (index!42176 (_ BitVec 32))) (Intermediate!9951 (undefined!10763 Bool) (index!42177 (_ BitVec 32)) (x!107944 (_ BitVec 32))) (Undefined!9951) (MissingVacant!9951 (index!42178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!79147 (_ BitVec 32)) SeekEntryResult!9951)

(assert (=> b!1226258 (= res!814981 (= (seekEntryOrOpen!0 (select (arr!38200 lt!558728) #b00000000000000000000000000000000) lt!558728 mask!1564) (Found!9951 #b00000000000000000000000000000000)))))

(assert (=> b!1226258 (=> (not res!814981) (not e!696437))))

(declare-fun b!1226259 () Bool)

(declare-fun call!60773 () Bool)

(assert (=> b!1226259 (= e!696439 call!60773)))

(declare-fun d!134005 () Bool)

(declare-fun res!814980 () Bool)

(declare-fun e!696438 () Bool)

(assert (=> d!134005 (=> res!814980 e!696438)))

(assert (=> d!134005 (= res!814980 (bvsge #b00000000000000000000000000000000 (size!38736 lt!558728)))))

(assert (=> d!134005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558728 mask!1564) e!696438)))

(declare-fun b!1226260 () Bool)

(assert (=> b!1226260 (= e!696437 call!60773)))

(declare-fun bm!60770 () Bool)

(assert (=> bm!60770 (= call!60773 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!558728 mask!1564))))

(declare-fun b!1226261 () Bool)

(assert (=> b!1226261 (= e!696438 e!696439)))

(declare-fun c!120503 () Bool)

(assert (=> b!1226261 (= c!120503 (validKeyInArray!0 (select (arr!38200 lt!558728) #b00000000000000000000000000000000)))))

(assert (= (and d!134005 (not res!814980)) b!1226261))

(assert (= (and b!1226261 c!120503) b!1226258))

(assert (= (and b!1226261 (not c!120503)) b!1226259))

(assert (= (and b!1226258 res!814981) b!1226260))

(assert (= (or b!1226260 b!1226259) bm!60770))

(declare-fun m!1131353 () Bool)

(assert (=> b!1226258 m!1131353))

(declare-fun m!1131355 () Bool)

(assert (=> b!1226258 m!1131355))

(declare-fun m!1131357 () Bool)

(assert (=> b!1226258 m!1131357))

(assert (=> b!1226258 m!1131353))

(declare-fun m!1131359 () Bool)

(assert (=> b!1226258 m!1131359))

(declare-fun m!1131361 () Bool)

(assert (=> bm!60770 m!1131361))

(assert (=> b!1226261 m!1131353))

(assert (=> b!1226261 m!1131353))

(declare-fun m!1131363 () Bool)

(assert (=> b!1226261 m!1131363))

(assert (=> b!1226186 d!134005))

(declare-fun b!1226273 () Bool)

(declare-fun e!696448 () Bool)

(declare-fun e!696450 () Bool)

(assert (=> b!1226273 (= e!696448 e!696450)))

(declare-fun res!814988 () Bool)

(assert (=> b!1226273 (=> (not res!814988) (not e!696450))))

(declare-fun e!696451 () Bool)

(assert (=> b!1226273 (= res!814988 (not e!696451))))

(declare-fun res!814990 () Bool)

(assert (=> b!1226273 (=> (not res!814990) (not e!696451))))

(assert (=> b!1226273 (= res!814990 (validKeyInArray!0 (select (arr!38200 lt!558728) #b00000000000000000000000000000000)))))

(declare-fun b!1226274 () Bool)

(declare-fun e!696449 () Bool)

(declare-fun call!60776 () Bool)

(assert (=> b!1226274 (= e!696449 call!60776)))

(declare-fun b!1226275 () Bool)

(assert (=> b!1226275 (= e!696449 call!60776)))

(declare-fun b!1226276 () Bool)

(declare-fun contains!7037 (List!26974 (_ BitVec 64)) Bool)

(assert (=> b!1226276 (= e!696451 (contains!7037 Nil!26971 (select (arr!38200 lt!558728) #b00000000000000000000000000000000)))))

(declare-fun bm!60773 () Bool)

(declare-fun c!120506 () Bool)

(assert (=> bm!60773 (= call!60776 (arrayNoDuplicates!0 lt!558728 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120506 (Cons!26970 (select (arr!38200 lt!558728) #b00000000000000000000000000000000) Nil!26971) Nil!26971)))))

(declare-fun d!134007 () Bool)

(declare-fun res!814989 () Bool)

(assert (=> d!134007 (=> res!814989 e!696448)))

(assert (=> d!134007 (= res!814989 (bvsge #b00000000000000000000000000000000 (size!38736 lt!558728)))))

(assert (=> d!134007 (= (arrayNoDuplicates!0 lt!558728 #b00000000000000000000000000000000 Nil!26971) e!696448)))

(declare-fun b!1226272 () Bool)

(assert (=> b!1226272 (= e!696450 e!696449)))

(assert (=> b!1226272 (= c!120506 (validKeyInArray!0 (select (arr!38200 lt!558728) #b00000000000000000000000000000000)))))

(assert (= (and d!134007 (not res!814989)) b!1226273))

(assert (= (and b!1226273 res!814990) b!1226276))

(assert (= (and b!1226273 res!814988) b!1226272))

(assert (= (and b!1226272 c!120506) b!1226275))

(assert (= (and b!1226272 (not c!120506)) b!1226274))

(assert (= (or b!1226275 b!1226274) bm!60773))

(assert (=> b!1226273 m!1131353))

(assert (=> b!1226273 m!1131353))

(assert (=> b!1226273 m!1131363))

(assert (=> b!1226276 m!1131353))

(assert (=> b!1226276 m!1131353))

(declare-fun m!1131365 () Bool)

(assert (=> b!1226276 m!1131365))

(assert (=> bm!60773 m!1131353))

(declare-fun m!1131367 () Bool)

(assert (=> bm!60773 m!1131367))

(assert (=> b!1226272 m!1131353))

(assert (=> b!1226272 m!1131353))

(assert (=> b!1226272 m!1131363))

(assert (=> b!1226188 d!134007))

(declare-fun b!1226277 () Bool)

(declare-fun e!696454 () Bool)

(declare-fun e!696452 () Bool)

(assert (=> b!1226277 (= e!696454 e!696452)))

(declare-fun lt!558757 () (_ BitVec 64))

(assert (=> b!1226277 (= lt!558757 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!558758 () Unit!40638)

(assert (=> b!1226277 (= lt!558758 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!558757 #b00000000000000000000000000000000))))

(assert (=> b!1226277 (arrayContainsKey!0 _keys!1208 lt!558757 #b00000000000000000000000000000000)))

(declare-fun lt!558756 () Unit!40638)

(assert (=> b!1226277 (= lt!558756 lt!558758)))

(declare-fun res!814992 () Bool)

(assert (=> b!1226277 (= res!814992 (= (seekEntryOrOpen!0 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9951 #b00000000000000000000000000000000)))))

(assert (=> b!1226277 (=> (not res!814992) (not e!696452))))

(declare-fun b!1226278 () Bool)

(declare-fun call!60777 () Bool)

(assert (=> b!1226278 (= e!696454 call!60777)))

(declare-fun d!134009 () Bool)

(declare-fun res!814991 () Bool)

(declare-fun e!696453 () Bool)

(assert (=> d!134009 (=> res!814991 e!696453)))

(assert (=> d!134009 (= res!814991 (bvsge #b00000000000000000000000000000000 (size!38736 _keys!1208)))))

(assert (=> d!134009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!696453)))

(declare-fun b!1226279 () Bool)

(assert (=> b!1226279 (= e!696452 call!60777)))

(declare-fun bm!60774 () Bool)

(assert (=> bm!60774 (= call!60777 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1226280 () Bool)

(assert (=> b!1226280 (= e!696453 e!696454)))

(declare-fun c!120507 () Bool)

(assert (=> b!1226280 (= c!120507 (validKeyInArray!0 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!134009 (not res!814991)) b!1226280))

(assert (= (and b!1226280 c!120507) b!1226277))

(assert (= (and b!1226280 (not c!120507)) b!1226278))

(assert (= (and b!1226277 res!814992) b!1226279))

(assert (= (or b!1226279 b!1226278) bm!60774))

(declare-fun m!1131369 () Bool)

(assert (=> b!1226277 m!1131369))

(declare-fun m!1131371 () Bool)

(assert (=> b!1226277 m!1131371))

(declare-fun m!1131373 () Bool)

(assert (=> b!1226277 m!1131373))

(assert (=> b!1226277 m!1131369))

(declare-fun m!1131375 () Bool)

(assert (=> b!1226277 m!1131375))

(declare-fun m!1131377 () Bool)

(assert (=> bm!60774 m!1131377))

(assert (=> b!1226280 m!1131369))

(assert (=> b!1226280 m!1131369))

(declare-fun m!1131379 () Bool)

(assert (=> b!1226280 m!1131379))

(assert (=> b!1226196 d!134009))

(declare-fun d!134011 () Bool)

(declare-fun res!814997 () Bool)

(declare-fun e!696459 () Bool)

(assert (=> d!134011 (=> res!814997 e!696459)))

(assert (=> d!134011 (= res!814997 (= (select (arr!38200 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134011 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!696459)))

(declare-fun b!1226285 () Bool)

(declare-fun e!696460 () Bool)

(assert (=> b!1226285 (= e!696459 e!696460)))

(declare-fun res!814998 () Bool)

(assert (=> b!1226285 (=> (not res!814998) (not e!696460))))

(assert (=> b!1226285 (= res!814998 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38736 _keys!1208)))))

(declare-fun b!1226286 () Bool)

(assert (=> b!1226286 (= e!696460 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134011 (not res!814997)) b!1226285))

(assert (= (and b!1226285 res!814998) b!1226286))

(assert (=> d!134011 m!1131369))

(declare-fun m!1131381 () Bool)

(assert (=> b!1226286 m!1131381))

(assert (=> b!1226189 d!134011))

(declare-fun d!134013 () Bool)

(assert (=> d!134013 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558761 () Unit!40638)

(declare-fun choose!13 (array!79147 (_ BitVec 64) (_ BitVec 32)) Unit!40638)

(assert (=> d!134013 (= lt!558761 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134013 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134013 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!558761)))

(declare-fun bs!34464 () Bool)

(assert (= bs!34464 d!134013))

(assert (=> bs!34464 m!1131299))

(declare-fun m!1131383 () Bool)

(assert (=> bs!34464 m!1131383))

(assert (=> b!1226189 d!134013))

(declare-fun d!134015 () Bool)

(assert (=> d!134015 (= (validKeyInArray!0 (select (arr!38200 _keys!1208) from!1455)) (and (not (= (select (arr!38200 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38200 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226190 d!134015))

(declare-fun b!1226293 () Bool)

(declare-fun e!696466 () Bool)

(declare-fun call!60783 () ListLongMap!18139)

(declare-fun call!60782 () ListLongMap!18139)

(assert (=> b!1226293 (= e!696466 (= call!60783 call!60782))))

(assert (=> b!1226293 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38737 _values!996)))))

(declare-fun bm!60779 () Bool)

(assert (=> bm!60779 (= call!60782 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226294 () Bool)

(assert (=> b!1226294 (= e!696466 (= call!60783 (-!1984 call!60782 k0!934)))))

(assert (=> b!1226294 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38737 _values!996)))))

(declare-fun bm!60780 () Bool)

(assert (=> bm!60780 (= call!60783 (getCurrentListMapNoExtraKeys!5504 (array!79148 (store (arr!38200 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38736 _keys!1208)) (array!79150 (store (arr!38201 _values!996) i!673 (ValueCellFull!14883 (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38737 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!134017 () Bool)

(declare-fun e!696465 () Bool)

(assert (=> d!134017 e!696465))

(declare-fun res!815001 () Bool)

(assert (=> d!134017 (=> (not res!815001) (not e!696465))))

(assert (=> d!134017 (= res!815001 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38736 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38736 _keys!1208))))))))

(declare-fun lt!558764 () Unit!40638)

(declare-fun choose!1829 (array!79147 array!79149 (_ BitVec 32) (_ BitVec 32) V!46707 V!46707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40638)

(assert (=> d!134017 (= lt!558764 (choose!1829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134017 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 _keys!1208)))))

(assert (=> d!134017 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1189 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!558764)))

(declare-fun b!1226295 () Bool)

(assert (=> b!1226295 (= e!696465 e!696466)))

(declare-fun c!120510 () Bool)

(assert (=> b!1226295 (= c!120510 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!134017 res!815001) b!1226295))

(assert (= (and b!1226295 c!120510) b!1226294))

(assert (= (and b!1226295 (not c!120510)) b!1226293))

(assert (= (or b!1226294 b!1226293) bm!60779))

(assert (= (or b!1226294 b!1226293) bm!60780))

(declare-fun b_lambda!22467 () Bool)

(assert (=> (not b_lambda!22467) (not bm!60780)))

(assert (=> bm!60780 t!40433))

(declare-fun b_and!44231 () Bool)

(assert (= b_and!44225 (and (=> t!40433 result!23175) b_and!44231)))

(assert (=> bm!60779 m!1131269))

(declare-fun m!1131385 () Bool)

(assert (=> b!1226294 m!1131385))

(assert (=> bm!60780 m!1131291))

(assert (=> bm!60780 m!1131259))

(assert (=> bm!60780 m!1131261))

(declare-fun m!1131387 () Bool)

(assert (=> bm!60780 m!1131387))

(declare-fun m!1131389 () Bool)

(assert (=> d!134017 m!1131389))

(assert (=> b!1226190 d!134017))

(declare-fun b!1226320 () Bool)

(declare-fun e!696484 () Bool)

(declare-fun e!696485 () Bool)

(assert (=> b!1226320 (= e!696484 e!696485)))

(declare-fun c!120521 () Bool)

(declare-fun e!696481 () Bool)

(assert (=> b!1226320 (= c!120521 e!696481)))

(declare-fun res!815010 () Bool)

(assert (=> b!1226320 (=> (not res!815010) (not e!696481))))

(assert (=> b!1226320 (= res!815010 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 lt!558728)))))

(declare-fun b!1226321 () Bool)

(declare-fun e!696486 () ListLongMap!18139)

(assert (=> b!1226321 (= e!696486 (ListLongMap!18140 Nil!26970))))

(declare-fun b!1226322 () Bool)

(assert (=> b!1226322 (= e!696481 (validKeyInArray!0 (select (arr!38200 lt!558728) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226322 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1226323 () Bool)

(declare-fun e!696483 () Bool)

(assert (=> b!1226323 (= e!696485 e!696483)))

(assert (=> b!1226323 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 lt!558728)))))

(declare-fun lt!558779 () ListLongMap!18139)

(declare-fun res!815011 () Bool)

(declare-fun contains!7038 (ListLongMap!18139 (_ BitVec 64)) Bool)

(assert (=> b!1226323 (= res!815011 (contains!7038 lt!558779 (select (arr!38200 lt!558728) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226323 (=> (not res!815011) (not e!696483))))

(declare-fun b!1226324 () Bool)

(declare-fun e!696482 () Bool)

(assert (=> b!1226324 (= e!696482 (= lt!558779 (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226325 () Bool)

(declare-fun lt!558782 () Unit!40638)

(declare-fun lt!558785 () Unit!40638)

(assert (=> b!1226325 (= lt!558782 lt!558785)))

(declare-fun lt!558783 () (_ BitVec 64))

(declare-fun lt!558780 () (_ BitVec 64))

(declare-fun lt!558784 () V!46707)

(declare-fun lt!558781 () ListLongMap!18139)

(declare-fun +!4131 (ListLongMap!18139 tuple2!20170) ListLongMap!18139)

(assert (=> b!1226325 (not (contains!7038 (+!4131 lt!558781 (tuple2!20171 lt!558783 lt!558784)) lt!558780))))

(declare-fun addStillNotContains!306 (ListLongMap!18139 (_ BitVec 64) V!46707 (_ BitVec 64)) Unit!40638)

(assert (=> b!1226325 (= lt!558785 (addStillNotContains!306 lt!558781 lt!558783 lt!558784 lt!558780))))

(assert (=> b!1226325 (= lt!558780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19511 (ValueCell!14883 V!46707) V!46707)

(assert (=> b!1226325 (= lt!558784 (get!19511 (select (arr!38201 lt!558727) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226325 (= lt!558783 (select (arr!38200 lt!558728) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60786 () ListLongMap!18139)

(assert (=> b!1226325 (= lt!558781 call!60786)))

(declare-fun e!696487 () ListLongMap!18139)

(assert (=> b!1226325 (= e!696487 (+!4131 call!60786 (tuple2!20171 (select (arr!38200 lt!558728) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19511 (select (arr!38201 lt!558727) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226326 () Bool)

(assert (=> b!1226326 (= e!696487 call!60786)))

(declare-fun bm!60783 () Bool)

(assert (=> bm!60783 (= call!60786 (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226328 () Bool)

(declare-fun isEmpty!1002 (ListLongMap!18139) Bool)

(assert (=> b!1226328 (= e!696482 (isEmpty!1002 lt!558779))))

(declare-fun b!1226329 () Bool)

(assert (=> b!1226329 (= e!696486 e!696487)))

(declare-fun c!120519 () Bool)

(assert (=> b!1226329 (= c!120519 (validKeyInArray!0 (select (arr!38200 lt!558728) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1226330 () Bool)

(assert (=> b!1226330 (= e!696485 e!696482)))

(declare-fun c!120522 () Bool)

(assert (=> b!1226330 (= c!120522 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 lt!558728)))))

(declare-fun b!1226331 () Bool)

(declare-fun res!815013 () Bool)

(assert (=> b!1226331 (=> (not res!815013) (not e!696484))))

(assert (=> b!1226331 (= res!815013 (not (contains!7038 lt!558779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226327 () Bool)

(assert (=> b!1226327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 lt!558728)))))

(assert (=> b!1226327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38737 lt!558727)))))

(declare-fun apply!978 (ListLongMap!18139 (_ BitVec 64)) V!46707)

(assert (=> b!1226327 (= e!696483 (= (apply!978 lt!558779 (select (arr!38200 lt!558728) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19511 (select (arr!38201 lt!558727) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134019 () Bool)

(assert (=> d!134019 e!696484))

(declare-fun res!815012 () Bool)

(assert (=> d!134019 (=> (not res!815012) (not e!696484))))

(assert (=> d!134019 (= res!815012 (not (contains!7038 lt!558779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134019 (= lt!558779 e!696486)))

(declare-fun c!120520 () Bool)

(assert (=> d!134019 (= c!120520 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 lt!558728)))))

(assert (=> d!134019 (validMask!0 mask!1564)))

(assert (=> d!134019 (= (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!558779)))

(assert (= (and d!134019 c!120520) b!1226321))

(assert (= (and d!134019 (not c!120520)) b!1226329))

(assert (= (and b!1226329 c!120519) b!1226325))

(assert (= (and b!1226329 (not c!120519)) b!1226326))

(assert (= (or b!1226325 b!1226326) bm!60783))

(assert (= (and d!134019 res!815012) b!1226331))

(assert (= (and b!1226331 res!815013) b!1226320))

(assert (= (and b!1226320 res!815010) b!1226322))

(assert (= (and b!1226320 c!120521) b!1226323))

(assert (= (and b!1226320 (not c!120521)) b!1226330))

(assert (= (and b!1226323 res!815011) b!1226327))

(assert (= (and b!1226330 c!120522) b!1226324))

(assert (= (and b!1226330 (not c!120522)) b!1226328))

(declare-fun b_lambda!22469 () Bool)

(assert (=> (not b_lambda!22469) (not b!1226325)))

(assert (=> b!1226325 t!40433))

(declare-fun b_and!44233 () Bool)

(assert (= b_and!44231 (and (=> t!40433 result!23175) b_and!44233)))

(declare-fun b_lambda!22471 () Bool)

(assert (=> (not b_lambda!22471) (not b!1226327)))

(assert (=> b!1226327 t!40433))

(declare-fun b_and!44235 () Bool)

(assert (= b_and!44233 (and (=> t!40433 result!23175) b_and!44235)))

(declare-fun m!1131391 () Bool)

(assert (=> b!1226324 m!1131391))

(declare-fun m!1131393 () Bool)

(assert (=> b!1226327 m!1131393))

(declare-fun m!1131395 () Bool)

(assert (=> b!1226327 m!1131395))

(assert (=> b!1226327 m!1131259))

(declare-fun m!1131397 () Bool)

(assert (=> b!1226327 m!1131397))

(assert (=> b!1226327 m!1131395))

(assert (=> b!1226327 m!1131259))

(assert (=> b!1226327 m!1131393))

(declare-fun m!1131399 () Bool)

(assert (=> b!1226327 m!1131399))

(assert (=> bm!60783 m!1131391))

(assert (=> b!1226329 m!1131393))

(assert (=> b!1226329 m!1131393))

(declare-fun m!1131401 () Bool)

(assert (=> b!1226329 m!1131401))

(assert (=> b!1226322 m!1131393))

(assert (=> b!1226322 m!1131393))

(assert (=> b!1226322 m!1131401))

(declare-fun m!1131403 () Bool)

(assert (=> b!1226331 m!1131403))

(declare-fun m!1131405 () Bool)

(assert (=> d!134019 m!1131405))

(assert (=> d!134019 m!1131285))

(assert (=> b!1226323 m!1131393))

(assert (=> b!1226323 m!1131393))

(declare-fun m!1131407 () Bool)

(assert (=> b!1226323 m!1131407))

(declare-fun m!1131409 () Bool)

(assert (=> b!1226325 m!1131409))

(assert (=> b!1226325 m!1131393))

(declare-fun m!1131411 () Bool)

(assert (=> b!1226325 m!1131411))

(declare-fun m!1131413 () Bool)

(assert (=> b!1226325 m!1131413))

(declare-fun m!1131415 () Bool)

(assert (=> b!1226325 m!1131415))

(assert (=> b!1226325 m!1131413))

(assert (=> b!1226325 m!1131395))

(assert (=> b!1226325 m!1131259))

(assert (=> b!1226325 m!1131397))

(assert (=> b!1226325 m!1131395))

(assert (=> b!1226325 m!1131259))

(declare-fun m!1131417 () Bool)

(assert (=> b!1226328 m!1131417))

(assert (=> b!1226190 d!134019))

(declare-fun b!1226332 () Bool)

(declare-fun e!696491 () Bool)

(declare-fun e!696492 () Bool)

(assert (=> b!1226332 (= e!696491 e!696492)))

(declare-fun c!120525 () Bool)

(declare-fun e!696488 () Bool)

(assert (=> b!1226332 (= c!120525 e!696488)))

(declare-fun res!815014 () Bool)

(assert (=> b!1226332 (=> (not res!815014) (not e!696488))))

(assert (=> b!1226332 (= res!815014 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 _keys!1208)))))

(declare-fun b!1226333 () Bool)

(declare-fun e!696493 () ListLongMap!18139)

(assert (=> b!1226333 (= e!696493 (ListLongMap!18140 Nil!26970))))

(declare-fun b!1226334 () Bool)

(assert (=> b!1226334 (= e!696488 (validKeyInArray!0 (select (arr!38200 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226334 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1226335 () Bool)

(declare-fun e!696490 () Bool)

(assert (=> b!1226335 (= e!696492 e!696490)))

(assert (=> b!1226335 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 _keys!1208)))))

(declare-fun lt!558786 () ListLongMap!18139)

(declare-fun res!815015 () Bool)

(assert (=> b!1226335 (= res!815015 (contains!7038 lt!558786 (select (arr!38200 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1226335 (=> (not res!815015) (not e!696490))))

(declare-fun e!696489 () Bool)

(declare-fun b!1226336 () Bool)

(assert (=> b!1226336 (= e!696489 (= lt!558786 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226337 () Bool)

(declare-fun lt!558789 () Unit!40638)

(declare-fun lt!558792 () Unit!40638)

(assert (=> b!1226337 (= lt!558789 lt!558792)))

(declare-fun lt!558791 () V!46707)

(declare-fun lt!558788 () ListLongMap!18139)

(declare-fun lt!558787 () (_ BitVec 64))

(declare-fun lt!558790 () (_ BitVec 64))

(assert (=> b!1226337 (not (contains!7038 (+!4131 lt!558788 (tuple2!20171 lt!558790 lt!558791)) lt!558787))))

(assert (=> b!1226337 (= lt!558792 (addStillNotContains!306 lt!558788 lt!558790 lt!558791 lt!558787))))

(assert (=> b!1226337 (= lt!558787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1226337 (= lt!558791 (get!19511 (select (arr!38201 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226337 (= lt!558790 (select (arr!38200 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60787 () ListLongMap!18139)

(assert (=> b!1226337 (= lt!558788 call!60787)))

(declare-fun e!696494 () ListLongMap!18139)

(assert (=> b!1226337 (= e!696494 (+!4131 call!60787 (tuple2!20171 (select (arr!38200 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19511 (select (arr!38201 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226338 () Bool)

(assert (=> b!1226338 (= e!696494 call!60787)))

(declare-fun bm!60784 () Bool)

(assert (=> bm!60784 (= call!60787 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226340 () Bool)

(assert (=> b!1226340 (= e!696489 (isEmpty!1002 lt!558786))))

(declare-fun b!1226341 () Bool)

(assert (=> b!1226341 (= e!696493 e!696494)))

(declare-fun c!120523 () Bool)

(assert (=> b!1226341 (= c!120523 (validKeyInArray!0 (select (arr!38200 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1226342 () Bool)

(assert (=> b!1226342 (= e!696492 e!696489)))

(declare-fun c!120526 () Bool)

(assert (=> b!1226342 (= c!120526 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 _keys!1208)))))

(declare-fun b!1226343 () Bool)

(declare-fun res!815017 () Bool)

(assert (=> b!1226343 (=> (not res!815017) (not e!696491))))

(assert (=> b!1226343 (= res!815017 (not (contains!7038 lt!558786 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226339 () Bool)

(assert (=> b!1226339 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 _keys!1208)))))

(assert (=> b!1226339 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38737 _values!996)))))

(assert (=> b!1226339 (= e!696490 (= (apply!978 lt!558786 (select (arr!38200 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19511 (select (arr!38201 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134021 () Bool)

(assert (=> d!134021 e!696491))

(declare-fun res!815016 () Bool)

(assert (=> d!134021 (=> (not res!815016) (not e!696491))))

(assert (=> d!134021 (= res!815016 (not (contains!7038 lt!558786 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134021 (= lt!558786 e!696493)))

(declare-fun c!120524 () Bool)

(assert (=> d!134021 (= c!120524 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38736 _keys!1208)))))

(assert (=> d!134021 (validMask!0 mask!1564)))

(assert (=> d!134021 (= (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!558786)))

(assert (= (and d!134021 c!120524) b!1226333))

(assert (= (and d!134021 (not c!120524)) b!1226341))

(assert (= (and b!1226341 c!120523) b!1226337))

(assert (= (and b!1226341 (not c!120523)) b!1226338))

(assert (= (or b!1226337 b!1226338) bm!60784))

(assert (= (and d!134021 res!815016) b!1226343))

(assert (= (and b!1226343 res!815017) b!1226332))

(assert (= (and b!1226332 res!815014) b!1226334))

(assert (= (and b!1226332 c!120525) b!1226335))

(assert (= (and b!1226332 (not c!120525)) b!1226342))

(assert (= (and b!1226335 res!815015) b!1226339))

(assert (= (and b!1226342 c!120526) b!1226336))

(assert (= (and b!1226342 (not c!120526)) b!1226340))

(declare-fun b_lambda!22473 () Bool)

(assert (=> (not b_lambda!22473) (not b!1226337)))

(assert (=> b!1226337 t!40433))

(declare-fun b_and!44237 () Bool)

(assert (= b_and!44235 (and (=> t!40433 result!23175) b_and!44237)))

(declare-fun b_lambda!22475 () Bool)

(assert (=> (not b_lambda!22475) (not b!1226339)))

(assert (=> b!1226339 t!40433))

(declare-fun b_and!44239 () Bool)

(assert (= b_and!44237 (and (=> t!40433 result!23175) b_and!44239)))

(declare-fun m!1131419 () Bool)

(assert (=> b!1226336 m!1131419))

(declare-fun m!1131421 () Bool)

(assert (=> b!1226339 m!1131421))

(declare-fun m!1131423 () Bool)

(assert (=> b!1226339 m!1131423))

(assert (=> b!1226339 m!1131259))

(declare-fun m!1131425 () Bool)

(assert (=> b!1226339 m!1131425))

(assert (=> b!1226339 m!1131423))

(assert (=> b!1226339 m!1131259))

(assert (=> b!1226339 m!1131421))

(declare-fun m!1131427 () Bool)

(assert (=> b!1226339 m!1131427))

(assert (=> bm!60784 m!1131419))

(assert (=> b!1226341 m!1131421))

(assert (=> b!1226341 m!1131421))

(declare-fun m!1131429 () Bool)

(assert (=> b!1226341 m!1131429))

(assert (=> b!1226334 m!1131421))

(assert (=> b!1226334 m!1131421))

(assert (=> b!1226334 m!1131429))

(declare-fun m!1131431 () Bool)

(assert (=> b!1226343 m!1131431))

(declare-fun m!1131433 () Bool)

(assert (=> d!134021 m!1131433))

(assert (=> d!134021 m!1131285))

(assert (=> b!1226335 m!1131421))

(assert (=> b!1226335 m!1131421))

(declare-fun m!1131435 () Bool)

(assert (=> b!1226335 m!1131435))

(declare-fun m!1131437 () Bool)

(assert (=> b!1226337 m!1131437))

(assert (=> b!1226337 m!1131421))

(declare-fun m!1131439 () Bool)

(assert (=> b!1226337 m!1131439))

(declare-fun m!1131441 () Bool)

(assert (=> b!1226337 m!1131441))

(declare-fun m!1131443 () Bool)

(assert (=> b!1226337 m!1131443))

(assert (=> b!1226337 m!1131441))

(assert (=> b!1226337 m!1131423))

(assert (=> b!1226337 m!1131259))

(assert (=> b!1226337 m!1131425))

(assert (=> b!1226337 m!1131423))

(assert (=> b!1226337 m!1131259))

(declare-fun m!1131445 () Bool)

(assert (=> b!1226340 m!1131445))

(assert (=> b!1226190 d!134021))

(declare-fun d!134023 () Bool)

(declare-fun lt!558795 () ListLongMap!18139)

(assert (=> d!134023 (not (contains!7038 lt!558795 k0!934))))

(declare-fun removeStrictlySorted!111 (List!26973 (_ BitVec 64)) List!26973)

(assert (=> d!134023 (= lt!558795 (ListLongMap!18140 (removeStrictlySorted!111 (toList!9085 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934)))))

(assert (=> d!134023 (= (-!1984 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934) lt!558795)))

(declare-fun bs!34465 () Bool)

(assert (= bs!34465 d!134023))

(declare-fun m!1131447 () Bool)

(assert (=> bs!34465 m!1131447))

(declare-fun m!1131449 () Bool)

(assert (=> bs!34465 m!1131449))

(assert (=> b!1226190 d!134023))

(declare-fun d!134025 () Bool)

(assert (=> d!134025 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226191 d!134025))

(declare-fun d!134027 () Bool)

(declare-fun lt!558796 () ListLongMap!18139)

(assert (=> d!134027 (not (contains!7038 lt!558796 k0!934))))

(assert (=> d!134027 (= lt!558796 (ListLongMap!18140 (removeStrictlySorted!111 (toList!9085 lt!558726) k0!934)))))

(assert (=> d!134027 (= (-!1984 lt!558726 k0!934) lt!558796)))

(declare-fun bs!34466 () Bool)

(assert (= bs!34466 d!134027))

(declare-fun m!1131451 () Bool)

(assert (=> bs!34466 m!1131451))

(declare-fun m!1131453 () Bool)

(assert (=> bs!34466 m!1131453))

(assert (=> b!1226183 d!134027))

(declare-fun d!134029 () Bool)

(assert (=> d!134029 (= (array_inv!29048 _keys!1208) (bvsge (size!38736 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101792 d!134029))

(declare-fun d!134031 () Bool)

(assert (=> d!134031 (= (array_inv!29049 _values!996) (bvsge (size!38737 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101792 d!134031))

(declare-fun b!1226345 () Bool)

(declare-fun e!696495 () Bool)

(declare-fun e!696497 () Bool)

(assert (=> b!1226345 (= e!696495 e!696497)))

(declare-fun res!815018 () Bool)

(assert (=> b!1226345 (=> (not res!815018) (not e!696497))))

(declare-fun e!696498 () Bool)

(assert (=> b!1226345 (= res!815018 (not e!696498))))

(declare-fun res!815020 () Bool)

(assert (=> b!1226345 (=> (not res!815020) (not e!696498))))

(assert (=> b!1226345 (= res!815020 (validKeyInArray!0 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1226346 () Bool)

(declare-fun e!696496 () Bool)

(declare-fun call!60788 () Bool)

(assert (=> b!1226346 (= e!696496 call!60788)))

(declare-fun b!1226347 () Bool)

(assert (=> b!1226347 (= e!696496 call!60788)))

(declare-fun b!1226348 () Bool)

(assert (=> b!1226348 (= e!696498 (contains!7037 Nil!26971 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60785 () Bool)

(declare-fun c!120527 () Bool)

(assert (=> bm!60785 (= call!60788 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120527 (Cons!26970 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000) Nil!26971) Nil!26971)))))

(declare-fun d!134033 () Bool)

(declare-fun res!815019 () Bool)

(assert (=> d!134033 (=> res!815019 e!696495)))

(assert (=> d!134033 (= res!815019 (bvsge #b00000000000000000000000000000000 (size!38736 _keys!1208)))))

(assert (=> d!134033 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26971) e!696495)))

(declare-fun b!1226344 () Bool)

(assert (=> b!1226344 (= e!696497 e!696496)))

(assert (=> b!1226344 (= c!120527 (validKeyInArray!0 (select (arr!38200 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!134033 (not res!815019)) b!1226345))

(assert (= (and b!1226345 res!815020) b!1226348))

(assert (= (and b!1226345 res!815018) b!1226344))

(assert (= (and b!1226344 c!120527) b!1226347))

(assert (= (and b!1226344 (not c!120527)) b!1226346))

(assert (= (or b!1226347 b!1226346) bm!60785))

(assert (=> b!1226345 m!1131369))

(assert (=> b!1226345 m!1131369))

(assert (=> b!1226345 m!1131379))

(assert (=> b!1226348 m!1131369))

(assert (=> b!1226348 m!1131369))

(declare-fun m!1131455 () Bool)

(assert (=> b!1226348 m!1131455))

(assert (=> bm!60785 m!1131369))

(declare-fun m!1131457 () Bool)

(assert (=> bm!60785 m!1131457))

(assert (=> b!1226344 m!1131369))

(assert (=> b!1226344 m!1131369))

(assert (=> b!1226344 m!1131379))

(assert (=> b!1226184 d!134033))

(declare-fun b!1226349 () Bool)

(declare-fun e!696502 () Bool)

(declare-fun e!696503 () Bool)

(assert (=> b!1226349 (= e!696502 e!696503)))

(declare-fun c!120530 () Bool)

(declare-fun e!696499 () Bool)

(assert (=> b!1226349 (= c!120530 e!696499)))

(declare-fun res!815021 () Bool)

(assert (=> b!1226349 (=> (not res!815021) (not e!696499))))

(assert (=> b!1226349 (= res!815021 (bvslt from!1455 (size!38736 lt!558728)))))

(declare-fun b!1226350 () Bool)

(declare-fun e!696504 () ListLongMap!18139)

(assert (=> b!1226350 (= e!696504 (ListLongMap!18140 Nil!26970))))

(declare-fun b!1226351 () Bool)

(assert (=> b!1226351 (= e!696499 (validKeyInArray!0 (select (arr!38200 lt!558728) from!1455)))))

(assert (=> b!1226351 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1226352 () Bool)

(declare-fun e!696501 () Bool)

(assert (=> b!1226352 (= e!696503 e!696501)))

(assert (=> b!1226352 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38736 lt!558728)))))

(declare-fun lt!558797 () ListLongMap!18139)

(declare-fun res!815022 () Bool)

(assert (=> b!1226352 (= res!815022 (contains!7038 lt!558797 (select (arr!38200 lt!558728) from!1455)))))

(assert (=> b!1226352 (=> (not res!815022) (not e!696501))))

(declare-fun e!696500 () Bool)

(declare-fun b!1226353 () Bool)

(assert (=> b!1226353 (= e!696500 (= lt!558797 (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226354 () Bool)

(declare-fun lt!558800 () Unit!40638)

(declare-fun lt!558803 () Unit!40638)

(assert (=> b!1226354 (= lt!558800 lt!558803)))

(declare-fun lt!558799 () ListLongMap!18139)

(declare-fun lt!558798 () (_ BitVec 64))

(declare-fun lt!558802 () V!46707)

(declare-fun lt!558801 () (_ BitVec 64))

(assert (=> b!1226354 (not (contains!7038 (+!4131 lt!558799 (tuple2!20171 lt!558801 lt!558802)) lt!558798))))

(assert (=> b!1226354 (= lt!558803 (addStillNotContains!306 lt!558799 lt!558801 lt!558802 lt!558798))))

(assert (=> b!1226354 (= lt!558798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1226354 (= lt!558802 (get!19511 (select (arr!38201 lt!558727) from!1455) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226354 (= lt!558801 (select (arr!38200 lt!558728) from!1455))))

(declare-fun call!60789 () ListLongMap!18139)

(assert (=> b!1226354 (= lt!558799 call!60789)))

(declare-fun e!696505 () ListLongMap!18139)

(assert (=> b!1226354 (= e!696505 (+!4131 call!60789 (tuple2!20171 (select (arr!38200 lt!558728) from!1455) (get!19511 (select (arr!38201 lt!558727) from!1455) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226355 () Bool)

(assert (=> b!1226355 (= e!696505 call!60789)))

(declare-fun bm!60786 () Bool)

(assert (=> bm!60786 (= call!60789 (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226357 () Bool)

(assert (=> b!1226357 (= e!696500 (isEmpty!1002 lt!558797))))

(declare-fun b!1226358 () Bool)

(assert (=> b!1226358 (= e!696504 e!696505)))

(declare-fun c!120528 () Bool)

(assert (=> b!1226358 (= c!120528 (validKeyInArray!0 (select (arr!38200 lt!558728) from!1455)))))

(declare-fun b!1226359 () Bool)

(assert (=> b!1226359 (= e!696503 e!696500)))

(declare-fun c!120531 () Bool)

(assert (=> b!1226359 (= c!120531 (bvslt from!1455 (size!38736 lt!558728)))))

(declare-fun b!1226360 () Bool)

(declare-fun res!815024 () Bool)

(assert (=> b!1226360 (=> (not res!815024) (not e!696502))))

(assert (=> b!1226360 (= res!815024 (not (contains!7038 lt!558797 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226356 () Bool)

(assert (=> b!1226356 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38736 lt!558728)))))

(assert (=> b!1226356 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38737 lt!558727)))))

(assert (=> b!1226356 (= e!696501 (= (apply!978 lt!558797 (select (arr!38200 lt!558728) from!1455)) (get!19511 (select (arr!38201 lt!558727) from!1455) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134035 () Bool)

(assert (=> d!134035 e!696502))

(declare-fun res!815023 () Bool)

(assert (=> d!134035 (=> (not res!815023) (not e!696502))))

(assert (=> d!134035 (= res!815023 (not (contains!7038 lt!558797 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134035 (= lt!558797 e!696504)))

(declare-fun c!120529 () Bool)

(assert (=> d!134035 (= c!120529 (bvsge from!1455 (size!38736 lt!558728)))))

(assert (=> d!134035 (validMask!0 mask!1564)))

(assert (=> d!134035 (= (getCurrentListMapNoExtraKeys!5504 lt!558728 lt!558727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!558797)))

(assert (= (and d!134035 c!120529) b!1226350))

(assert (= (and d!134035 (not c!120529)) b!1226358))

(assert (= (and b!1226358 c!120528) b!1226354))

(assert (= (and b!1226358 (not c!120528)) b!1226355))

(assert (= (or b!1226354 b!1226355) bm!60786))

(assert (= (and d!134035 res!815023) b!1226360))

(assert (= (and b!1226360 res!815024) b!1226349))

(assert (= (and b!1226349 res!815021) b!1226351))

(assert (= (and b!1226349 c!120530) b!1226352))

(assert (= (and b!1226349 (not c!120530)) b!1226359))

(assert (= (and b!1226352 res!815022) b!1226356))

(assert (= (and b!1226359 c!120531) b!1226353))

(assert (= (and b!1226359 (not c!120531)) b!1226357))

(declare-fun b_lambda!22477 () Bool)

(assert (=> (not b_lambda!22477) (not b!1226354)))

(assert (=> b!1226354 t!40433))

(declare-fun b_and!44241 () Bool)

(assert (= b_and!44239 (and (=> t!40433 result!23175) b_and!44241)))

(declare-fun b_lambda!22479 () Bool)

(assert (=> (not b_lambda!22479) (not b!1226356)))

(assert (=> b!1226356 t!40433))

(declare-fun b_and!44243 () Bool)

(assert (= b_and!44241 (and (=> t!40433 result!23175) b_and!44243)))

(declare-fun m!1131459 () Bool)

(assert (=> b!1226353 m!1131459))

(declare-fun m!1131461 () Bool)

(assert (=> b!1226356 m!1131461))

(declare-fun m!1131463 () Bool)

(assert (=> b!1226356 m!1131463))

(assert (=> b!1226356 m!1131259))

(declare-fun m!1131465 () Bool)

(assert (=> b!1226356 m!1131465))

(assert (=> b!1226356 m!1131463))

(assert (=> b!1226356 m!1131259))

(assert (=> b!1226356 m!1131461))

(declare-fun m!1131467 () Bool)

(assert (=> b!1226356 m!1131467))

(assert (=> bm!60786 m!1131459))

(assert (=> b!1226358 m!1131461))

(assert (=> b!1226358 m!1131461))

(declare-fun m!1131469 () Bool)

(assert (=> b!1226358 m!1131469))

(assert (=> b!1226351 m!1131461))

(assert (=> b!1226351 m!1131461))

(assert (=> b!1226351 m!1131469))

(declare-fun m!1131471 () Bool)

(assert (=> b!1226360 m!1131471))

(declare-fun m!1131473 () Bool)

(assert (=> d!134035 m!1131473))

(assert (=> d!134035 m!1131285))

(assert (=> b!1226352 m!1131461))

(assert (=> b!1226352 m!1131461))

(declare-fun m!1131475 () Bool)

(assert (=> b!1226352 m!1131475))

(declare-fun m!1131477 () Bool)

(assert (=> b!1226354 m!1131477))

(assert (=> b!1226354 m!1131461))

(declare-fun m!1131479 () Bool)

(assert (=> b!1226354 m!1131479))

(declare-fun m!1131481 () Bool)

(assert (=> b!1226354 m!1131481))

(declare-fun m!1131483 () Bool)

(assert (=> b!1226354 m!1131483))

(assert (=> b!1226354 m!1131481))

(assert (=> b!1226354 m!1131463))

(assert (=> b!1226354 m!1131259))

(assert (=> b!1226354 m!1131465))

(assert (=> b!1226354 m!1131463))

(assert (=> b!1226354 m!1131259))

(declare-fun m!1131485 () Bool)

(assert (=> b!1226357 m!1131485))

(assert (=> b!1226192 d!134035))

(declare-fun b!1226361 () Bool)

(declare-fun e!696509 () Bool)

(declare-fun e!696510 () Bool)

(assert (=> b!1226361 (= e!696509 e!696510)))

(declare-fun c!120534 () Bool)

(declare-fun e!696506 () Bool)

(assert (=> b!1226361 (= c!120534 e!696506)))

(declare-fun res!815025 () Bool)

(assert (=> b!1226361 (=> (not res!815025) (not e!696506))))

(assert (=> b!1226361 (= res!815025 (bvslt from!1455 (size!38736 _keys!1208)))))

(declare-fun b!1226362 () Bool)

(declare-fun e!696511 () ListLongMap!18139)

(assert (=> b!1226362 (= e!696511 (ListLongMap!18140 Nil!26970))))

(declare-fun b!1226363 () Bool)

(assert (=> b!1226363 (= e!696506 (validKeyInArray!0 (select (arr!38200 _keys!1208) from!1455)))))

(assert (=> b!1226363 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1226364 () Bool)

(declare-fun e!696508 () Bool)

(assert (=> b!1226364 (= e!696510 e!696508)))

(assert (=> b!1226364 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38736 _keys!1208)))))

(declare-fun res!815026 () Bool)

(declare-fun lt!558804 () ListLongMap!18139)

(assert (=> b!1226364 (= res!815026 (contains!7038 lt!558804 (select (arr!38200 _keys!1208) from!1455)))))

(assert (=> b!1226364 (=> (not res!815026) (not e!696508))))

(declare-fun e!696507 () Bool)

(declare-fun b!1226365 () Bool)

(assert (=> b!1226365 (= e!696507 (= lt!558804 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1226366 () Bool)

(declare-fun lt!558807 () Unit!40638)

(declare-fun lt!558810 () Unit!40638)

(assert (=> b!1226366 (= lt!558807 lt!558810)))

(declare-fun lt!558809 () V!46707)

(declare-fun lt!558808 () (_ BitVec 64))

(declare-fun lt!558805 () (_ BitVec 64))

(declare-fun lt!558806 () ListLongMap!18139)

(assert (=> b!1226366 (not (contains!7038 (+!4131 lt!558806 (tuple2!20171 lt!558808 lt!558809)) lt!558805))))

(assert (=> b!1226366 (= lt!558810 (addStillNotContains!306 lt!558806 lt!558808 lt!558809 lt!558805))))

(assert (=> b!1226366 (= lt!558805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1226366 (= lt!558809 (get!19511 (select (arr!38201 _values!996) from!1455) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1226366 (= lt!558808 (select (arr!38200 _keys!1208) from!1455))))

(declare-fun call!60790 () ListLongMap!18139)

(assert (=> b!1226366 (= lt!558806 call!60790)))

(declare-fun e!696512 () ListLongMap!18139)

(assert (=> b!1226366 (= e!696512 (+!4131 call!60790 (tuple2!20171 (select (arr!38200 _keys!1208) from!1455) (get!19511 (select (arr!38201 _values!996) from!1455) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1226367 () Bool)

(assert (=> b!1226367 (= e!696512 call!60790)))

(declare-fun bm!60787 () Bool)

(assert (=> bm!60787 (= call!60790 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1226369 () Bool)

(assert (=> b!1226369 (= e!696507 (isEmpty!1002 lt!558804))))

(declare-fun b!1226370 () Bool)

(assert (=> b!1226370 (= e!696511 e!696512)))

(declare-fun c!120532 () Bool)

(assert (=> b!1226370 (= c!120532 (validKeyInArray!0 (select (arr!38200 _keys!1208) from!1455)))))

(declare-fun b!1226371 () Bool)

(assert (=> b!1226371 (= e!696510 e!696507)))

(declare-fun c!120535 () Bool)

(assert (=> b!1226371 (= c!120535 (bvslt from!1455 (size!38736 _keys!1208)))))

(declare-fun b!1226372 () Bool)

(declare-fun res!815028 () Bool)

(assert (=> b!1226372 (=> (not res!815028) (not e!696509))))

(assert (=> b!1226372 (= res!815028 (not (contains!7038 lt!558804 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226368 () Bool)

(assert (=> b!1226368 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38736 _keys!1208)))))

(assert (=> b!1226368 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38737 _values!996)))))

(assert (=> b!1226368 (= e!696508 (= (apply!978 lt!558804 (select (arr!38200 _keys!1208) from!1455)) (get!19511 (select (arr!38201 _values!996) from!1455) (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134037 () Bool)

(assert (=> d!134037 e!696509))

(declare-fun res!815027 () Bool)

(assert (=> d!134037 (=> (not res!815027) (not e!696509))))

(assert (=> d!134037 (= res!815027 (not (contains!7038 lt!558804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134037 (= lt!558804 e!696511)))

(declare-fun c!120533 () Bool)

(assert (=> d!134037 (= c!120533 (bvsge from!1455 (size!38736 _keys!1208)))))

(assert (=> d!134037 (validMask!0 mask!1564)))

(assert (=> d!134037 (= (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!558804)))

(assert (= (and d!134037 c!120533) b!1226362))

(assert (= (and d!134037 (not c!120533)) b!1226370))

(assert (= (and b!1226370 c!120532) b!1226366))

(assert (= (and b!1226370 (not c!120532)) b!1226367))

(assert (= (or b!1226366 b!1226367) bm!60787))

(assert (= (and d!134037 res!815027) b!1226372))

(assert (= (and b!1226372 res!815028) b!1226361))

(assert (= (and b!1226361 res!815025) b!1226363))

(assert (= (and b!1226361 c!120534) b!1226364))

(assert (= (and b!1226361 (not c!120534)) b!1226371))

(assert (= (and b!1226364 res!815026) b!1226368))

(assert (= (and b!1226371 c!120535) b!1226365))

(assert (= (and b!1226371 (not c!120535)) b!1226369))

(declare-fun b_lambda!22481 () Bool)

(assert (=> (not b_lambda!22481) (not b!1226366)))

(assert (=> b!1226366 t!40433))

(declare-fun b_and!44245 () Bool)

(assert (= b_and!44243 (and (=> t!40433 result!23175) b_and!44245)))

(declare-fun b_lambda!22483 () Bool)

(assert (=> (not b_lambda!22483) (not b!1226368)))

(assert (=> b!1226368 t!40433))

(declare-fun b_and!44247 () Bool)

(assert (= b_and!44245 (and (=> t!40433 result!23175) b_and!44247)))

(declare-fun m!1131487 () Bool)

(assert (=> b!1226365 m!1131487))

(assert (=> b!1226368 m!1131277))

(declare-fun m!1131489 () Bool)

(assert (=> b!1226368 m!1131489))

(assert (=> b!1226368 m!1131259))

(declare-fun m!1131491 () Bool)

(assert (=> b!1226368 m!1131491))

(assert (=> b!1226368 m!1131489))

(assert (=> b!1226368 m!1131259))

(assert (=> b!1226368 m!1131277))

(declare-fun m!1131493 () Bool)

(assert (=> b!1226368 m!1131493))

(assert (=> bm!60787 m!1131487))

(assert (=> b!1226370 m!1131277))

(assert (=> b!1226370 m!1131277))

(assert (=> b!1226370 m!1131279))

(assert (=> b!1226363 m!1131277))

(assert (=> b!1226363 m!1131277))

(assert (=> b!1226363 m!1131279))

(declare-fun m!1131495 () Bool)

(assert (=> b!1226372 m!1131495))

(declare-fun m!1131497 () Bool)

(assert (=> d!134037 m!1131497))

(assert (=> d!134037 m!1131285))

(assert (=> b!1226364 m!1131277))

(assert (=> b!1226364 m!1131277))

(declare-fun m!1131499 () Bool)

(assert (=> b!1226364 m!1131499))

(declare-fun m!1131501 () Bool)

(assert (=> b!1226366 m!1131501))

(assert (=> b!1226366 m!1131277))

(declare-fun m!1131503 () Bool)

(assert (=> b!1226366 m!1131503))

(declare-fun m!1131505 () Bool)

(assert (=> b!1226366 m!1131505))

(declare-fun m!1131507 () Bool)

(assert (=> b!1226366 m!1131507))

(assert (=> b!1226366 m!1131505))

(assert (=> b!1226366 m!1131489))

(assert (=> b!1226366 m!1131259))

(assert (=> b!1226366 m!1131491))

(assert (=> b!1226366 m!1131489))

(assert (=> b!1226366 m!1131259))

(declare-fun m!1131509 () Bool)

(assert (=> b!1226369 m!1131509))

(assert (=> b!1226192 d!134037))

(declare-fun mapNonEmpty!48682 () Bool)

(declare-fun mapRes!48682 () Bool)

(declare-fun tp!92498 () Bool)

(declare-fun e!696518 () Bool)

(assert (=> mapNonEmpty!48682 (= mapRes!48682 (and tp!92498 e!696518))))

(declare-fun mapRest!48682 () (Array (_ BitVec 32) ValueCell!14883))

(declare-fun mapKey!48682 () (_ BitVec 32))

(declare-fun mapValue!48682 () ValueCell!14883)

(assert (=> mapNonEmpty!48682 (= mapRest!48676 (store mapRest!48682 mapKey!48682 mapValue!48682))))

(declare-fun b!1226380 () Bool)

(declare-fun e!696517 () Bool)

(assert (=> b!1226380 (= e!696517 tp_is_empty!31185)))

(declare-fun condMapEmpty!48682 () Bool)

(declare-fun mapDefault!48682 () ValueCell!14883)

(assert (=> mapNonEmpty!48676 (= condMapEmpty!48682 (= mapRest!48676 ((as const (Array (_ BitVec 32) ValueCell!14883)) mapDefault!48682)))))

(assert (=> mapNonEmpty!48676 (= tp!92489 (and e!696517 mapRes!48682))))

(declare-fun mapIsEmpty!48682 () Bool)

(assert (=> mapIsEmpty!48682 mapRes!48682))

(declare-fun b!1226379 () Bool)

(assert (=> b!1226379 (= e!696518 tp_is_empty!31185)))

(assert (= (and mapNonEmpty!48676 condMapEmpty!48682) mapIsEmpty!48682))

(assert (= (and mapNonEmpty!48676 (not condMapEmpty!48682)) mapNonEmpty!48682))

(assert (= (and mapNonEmpty!48682 ((_ is ValueCellFull!14883) mapValue!48682)) b!1226379))

(assert (= (and mapNonEmpty!48676 ((_ is ValueCellFull!14883) mapDefault!48682)) b!1226380))

(declare-fun m!1131511 () Bool)

(assert (=> mapNonEmpty!48682 m!1131511))

(declare-fun b_lambda!22485 () Bool)

(assert (= b_lambda!22477 (or (and start!101792 b_free!26481) b_lambda!22485)))

(declare-fun b_lambda!22487 () Bool)

(assert (= b_lambda!22467 (or (and start!101792 b_free!26481) b_lambda!22487)))

(declare-fun b_lambda!22489 () Bool)

(assert (= b_lambda!22475 (or (and start!101792 b_free!26481) b_lambda!22489)))

(declare-fun b_lambda!22491 () Bool)

(assert (= b_lambda!22481 (or (and start!101792 b_free!26481) b_lambda!22491)))

(declare-fun b_lambda!22493 () Bool)

(assert (= b_lambda!22479 (or (and start!101792 b_free!26481) b_lambda!22493)))

(declare-fun b_lambda!22495 () Bool)

(assert (= b_lambda!22469 (or (and start!101792 b_free!26481) b_lambda!22495)))

(declare-fun b_lambda!22497 () Bool)

(assert (= b_lambda!22471 (or (and start!101792 b_free!26481) b_lambda!22497)))

(declare-fun b_lambda!22499 () Bool)

(assert (= b_lambda!22483 (or (and start!101792 b_free!26481) b_lambda!22499)))

(declare-fun b_lambda!22501 () Bool)

(assert (= b_lambda!22473 (or (and start!101792 b_free!26481) b_lambda!22501)))

(check-sat (not b!1226370) (not b!1226337) (not b!1226344) (not b!1226272) (not b!1226286) (not b!1226369) (not b!1226294) (not bm!60786) (not b!1226336) (not b!1226348) (not b!1226327) (not b_lambda!22493) (not b!1226366) (not b!1226368) (not d!134035) (not b_lambda!22501) (not b!1226331) (not b_lambda!22465) (not bm!60783) (not d!134013) (not b!1226372) (not bm!60773) (not b_lambda!22499) (not b!1226334) (not b!1226343) (not d!134027) (not mapNonEmpty!48682) (not bm!60770) (not b!1226273) (not b!1226365) (not b!1226323) (not bm!60779) (not d!134037) (not b!1226335) (not b!1226352) (not b_lambda!22495) (not bm!60784) tp_is_empty!31185 (not b_lambda!22487) (not b!1226356) (not b!1226277) (not b!1226341) (not b!1226280) (not b!1226329) (not b!1226354) (not b!1226357) (not b!1226324) (not b!1226363) (not bm!60774) (not b!1226322) (not bm!60780) (not b!1226351) (not b_lambda!22485) (not bm!60787) b_and!44247 (not d!134017) (not b_next!26481) (not b_lambda!22489) (not b!1226261) (not b!1226340) (not b!1226360) (not b!1226276) (not d!134021) (not b_lambda!22491) (not bm!60785) (not d!134023) (not b!1226345) (not b!1226325) (not b!1226358) (not b!1226258) (not b!1226353) (not b!1226339) (not b!1226364) (not b!1226328) (not b_lambda!22497) (not d!134019))
(check-sat b_and!44247 (not b_next!26481))
