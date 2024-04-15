; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98006 () Bool)

(assert start!98006)

(declare-fun b_free!23713 () Bool)

(declare-fun b_next!23713 () Bool)

(assert (=> start!98006 (= b_free!23713 (not b_next!23713))))

(declare-fun tp!83842 () Bool)

(declare-fun b_and!38187 () Bool)

(assert (=> start!98006 (= tp!83842 b_and!38187)))

(declare-fun b!1124321 () Bool)

(declare-fun e!640027 () Bool)

(declare-fun e!640035 () Bool)

(declare-fun mapRes!44182 () Bool)

(assert (=> b!1124321 (= e!640027 (and e!640035 mapRes!44182))))

(declare-fun condMapEmpty!44182 () Bool)

(declare-datatypes ((V!42785 0))(
  ( (V!42786 (val!14178 Int)) )
))
(declare-datatypes ((ValueCell!13412 0))(
  ( (ValueCellFull!13412 (v!16810 V!42785)) (EmptyCell!13412) )
))
(declare-datatypes ((array!73276 0))(
  ( (array!73277 (arr!35291 (Array (_ BitVec 32) ValueCell!13412)) (size!35829 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73276)

(declare-fun mapDefault!44182 () ValueCell!13412)

(assert (=> b!1124321 (= condMapEmpty!44182 (= (arr!35291 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13412)) mapDefault!44182)))))

(declare-fun b!1124322 () Bool)

(declare-fun tp_is_empty!28243 () Bool)

(assert (=> b!1124322 (= e!640035 tp_is_empty!28243)))

(declare-fun b!1124324 () Bool)

(declare-fun res!751237 () Bool)

(declare-fun e!640033 () Bool)

(assert (=> b!1124324 (=> (not res!751237) (not e!640033))))

(declare-datatypes ((array!73278 0))(
  ( (array!73279 (arr!35292 (Array (_ BitVec 32) (_ BitVec 64))) (size!35830 (_ BitVec 32))) )
))
(declare-fun lt!499268 () array!73278)

(declare-datatypes ((List!24658 0))(
  ( (Nil!24655) (Cons!24654 (h!25863 (_ BitVec 64)) (t!35354 List!24658)) )
))
(declare-fun arrayNoDuplicates!0 (array!73278 (_ BitVec 32) List!24658) Bool)

(assert (=> b!1124324 (= res!751237 (arrayNoDuplicates!0 lt!499268 #b00000000000000000000000000000000 Nil!24655))))

(declare-fun b!1124325 () Bool)

(declare-fun res!751236 () Bool)

(declare-fun e!640032 () Bool)

(assert (=> b!1124325 (=> (not res!751236) (not e!640032))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124325 (= res!751236 (validKeyInArray!0 k0!934))))

(declare-fun b!1124326 () Bool)

(declare-fun res!751240 () Bool)

(assert (=> b!1124326 (=> (not res!751240) (not e!640032))))

(declare-fun _keys!1208 () array!73278)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124326 (= res!751240 (= (select (arr!35292 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44182 () Bool)

(assert (=> mapIsEmpty!44182 mapRes!44182))

(declare-fun b!1124327 () Bool)

(declare-fun e!640034 () Bool)

(declare-datatypes ((tuple2!17896 0))(
  ( (tuple2!17897 (_1!8959 (_ BitVec 64)) (_2!8959 V!42785)) )
))
(declare-datatypes ((List!24659 0))(
  ( (Nil!24656) (Cons!24655 (h!25864 tuple2!17896) (t!35355 List!24659)) )
))
(declare-datatypes ((ListLongMap!15865 0))(
  ( (ListLongMap!15866 (toList!7948 List!24659)) )
))
(declare-fun call!47399 () ListLongMap!15865)

(declare-fun call!47398 () ListLongMap!15865)

(assert (=> b!1124327 (= e!640034 (= call!47399 call!47398))))

(declare-fun b!1124328 () Bool)

(declare-fun res!751244 () Bool)

(assert (=> b!1124328 (=> (not res!751244) (not e!640032))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1124328 (= res!751244 (and (= (size!35829 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35830 _keys!1208) (size!35829 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!42785)

(declare-fun lt!499267 () array!73276)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42785)

(declare-fun bm!47395 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4453 (array!73278 array!73276 (_ BitVec 32) (_ BitVec 32) V!42785 V!42785 (_ BitVec 32) Int) ListLongMap!15865)

(assert (=> bm!47395 (= call!47399 (getCurrentListMapNoExtraKeys!4453 lt!499268 lt!499267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124329 () Bool)

(assert (=> b!1124329 (= e!640032 e!640033)))

(declare-fun res!751246 () Bool)

(assert (=> b!1124329 (=> (not res!751246) (not e!640033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73278 (_ BitVec 32)) Bool)

(assert (=> b!1124329 (= res!751246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499268 mask!1564))))

(assert (=> b!1124329 (= lt!499268 (array!73279 (store (arr!35292 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35830 _keys!1208)))))

(declare-fun b!1124330 () Bool)

(declare-fun e!640029 () Bool)

(declare-fun e!640030 () Bool)

(assert (=> b!1124330 (= e!640029 e!640030)))

(declare-fun res!751242 () Bool)

(assert (=> b!1124330 (=> res!751242 e!640030)))

(assert (=> b!1124330 (= res!751242 (not (= (select (arr!35292 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124330 e!640034))

(declare-fun c!109533 () Bool)

(assert (=> b!1124330 (= c!109533 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36709 0))(
  ( (Unit!36710) )
))
(declare-fun lt!499271 () Unit!36709)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!363 (array!73278 array!73276 (_ BitVec 32) (_ BitVec 32) V!42785 V!42785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36709)

(assert (=> b!1124330 (= lt!499271 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751243 () Bool)

(assert (=> start!98006 (=> (not res!751243) (not e!640032))))

(assert (=> start!98006 (= res!751243 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35830 _keys!1208))))))

(assert (=> start!98006 e!640032))

(assert (=> start!98006 tp_is_empty!28243))

(declare-fun array_inv!27164 (array!73278) Bool)

(assert (=> start!98006 (array_inv!27164 _keys!1208)))

(assert (=> start!98006 true))

(assert (=> start!98006 tp!83842))

(declare-fun array_inv!27165 (array!73276) Bool)

(assert (=> start!98006 (and (array_inv!27165 _values!996) e!640027)))

(declare-fun b!1124323 () Bool)

(declare-fun e!640031 () Bool)

(assert (=> b!1124323 (= e!640031 true)))

(declare-fun lt!499266 () ListLongMap!15865)

(declare-fun contains!6419 (ListLongMap!15865 (_ BitVec 64)) Bool)

(declare-fun +!3451 (ListLongMap!15865 tuple2!17896) ListLongMap!15865)

(assert (=> b!1124323 (contains!6419 (+!3451 lt!499266 (tuple2!17897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499270 () Unit!36709)

(declare-fun addStillContains!669 (ListLongMap!15865 (_ BitVec 64) V!42785 (_ BitVec 64)) Unit!36709)

(assert (=> b!1124323 (= lt!499270 (addStillContains!669 lt!499266 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124331 () Bool)

(declare-fun res!751233 () Bool)

(assert (=> b!1124331 (=> (not res!751233) (not e!640032))))

(assert (=> b!1124331 (= res!751233 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35830 _keys!1208))))))

(declare-fun b!1124332 () Bool)

(declare-fun e!640028 () Bool)

(assert (=> b!1124332 (= e!640028 tp_is_empty!28243)))

(declare-fun b!1124333 () Bool)

(declare-fun -!1086 (ListLongMap!15865 (_ BitVec 64)) ListLongMap!15865)

(assert (=> b!1124333 (= e!640034 (= call!47399 (-!1086 call!47398 k0!934)))))

(declare-fun mapNonEmpty!44182 () Bool)

(declare-fun tp!83843 () Bool)

(assert (=> mapNonEmpty!44182 (= mapRes!44182 (and tp!83843 e!640028))))

(declare-fun mapValue!44182 () ValueCell!13412)

(declare-fun mapRest!44182 () (Array (_ BitVec 32) ValueCell!13412))

(declare-fun mapKey!44182 () (_ BitVec 32))

(assert (=> mapNonEmpty!44182 (= (arr!35291 _values!996) (store mapRest!44182 mapKey!44182 mapValue!44182))))

(declare-fun b!1124334 () Bool)

(declare-fun res!751241 () Bool)

(assert (=> b!1124334 (=> res!751241 e!640031)))

(assert (=> b!1124334 (= res!751241 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124335 () Bool)

(declare-fun e!640025 () Bool)

(assert (=> b!1124335 (= e!640025 e!640029)))

(declare-fun res!751245 () Bool)

(assert (=> b!1124335 (=> res!751245 e!640029)))

(assert (=> b!1124335 (= res!751245 (not (= from!1455 i!673)))))

(declare-fun lt!499265 () ListLongMap!15865)

(assert (=> b!1124335 (= lt!499265 (getCurrentListMapNoExtraKeys!4453 lt!499268 lt!499267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2477 (Int (_ BitVec 64)) V!42785)

(assert (=> b!1124335 (= lt!499267 (array!73277 (store (arr!35291 _values!996) i!673 (ValueCellFull!13412 (dynLambda!2477 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35829 _values!996)))))

(declare-fun lt!499269 () ListLongMap!15865)

(assert (=> b!1124335 (= lt!499269 (getCurrentListMapNoExtraKeys!4453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124336 () Bool)

(assert (=> b!1124336 (= e!640030 e!640031)))

(declare-fun res!751239 () Bool)

(assert (=> b!1124336 (=> res!751239 e!640031)))

(assert (=> b!1124336 (= res!751239 (not (contains!6419 lt!499266 k0!934)))))

(assert (=> b!1124336 (= lt!499266 (getCurrentListMapNoExtraKeys!4453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124337 () Bool)

(assert (=> b!1124337 (= e!640033 (not e!640025))))

(declare-fun res!751238 () Bool)

(assert (=> b!1124337 (=> res!751238 e!640025)))

(assert (=> b!1124337 (= res!751238 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124337 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499272 () Unit!36709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73278 (_ BitVec 64) (_ BitVec 32)) Unit!36709)

(assert (=> b!1124337 (= lt!499272 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124338 () Bool)

(declare-fun res!751232 () Bool)

(assert (=> b!1124338 (=> (not res!751232) (not e!640032))))

(assert (=> b!1124338 (= res!751232 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24655))))

(declare-fun b!1124339 () Bool)

(declare-fun res!751235 () Bool)

(assert (=> b!1124339 (=> (not res!751235) (not e!640032))))

(assert (=> b!1124339 (= res!751235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124340 () Bool)

(declare-fun res!751234 () Bool)

(assert (=> b!1124340 (=> (not res!751234) (not e!640032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124340 (= res!751234 (validMask!0 mask!1564))))

(declare-fun bm!47396 () Bool)

(assert (=> bm!47396 (= call!47398 (getCurrentListMapNoExtraKeys!4453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98006 res!751243) b!1124340))

(assert (= (and b!1124340 res!751234) b!1124328))

(assert (= (and b!1124328 res!751244) b!1124339))

(assert (= (and b!1124339 res!751235) b!1124338))

(assert (= (and b!1124338 res!751232) b!1124331))

(assert (= (and b!1124331 res!751233) b!1124325))

(assert (= (and b!1124325 res!751236) b!1124326))

(assert (= (and b!1124326 res!751240) b!1124329))

(assert (= (and b!1124329 res!751246) b!1124324))

(assert (= (and b!1124324 res!751237) b!1124337))

(assert (= (and b!1124337 (not res!751238)) b!1124335))

(assert (= (and b!1124335 (not res!751245)) b!1124330))

(assert (= (and b!1124330 c!109533) b!1124333))

(assert (= (and b!1124330 (not c!109533)) b!1124327))

(assert (= (or b!1124333 b!1124327) bm!47396))

(assert (= (or b!1124333 b!1124327) bm!47395))

(assert (= (and b!1124330 (not res!751242)) b!1124336))

(assert (= (and b!1124336 (not res!751239)) b!1124334))

(assert (= (and b!1124334 (not res!751241)) b!1124323))

(assert (= (and b!1124321 condMapEmpty!44182) mapIsEmpty!44182))

(assert (= (and b!1124321 (not condMapEmpty!44182)) mapNonEmpty!44182))

(get-info :version)

(assert (= (and mapNonEmpty!44182 ((_ is ValueCellFull!13412) mapValue!44182)) b!1124332))

(assert (= (and b!1124321 ((_ is ValueCellFull!13412) mapDefault!44182)) b!1124322))

(assert (= start!98006 b!1124321))

(declare-fun b_lambda!18665 () Bool)

(assert (=> (not b_lambda!18665) (not b!1124335)))

(declare-fun t!35353 () Bool)

(declare-fun tb!8517 () Bool)

(assert (=> (and start!98006 (= defaultEntry!1004 defaultEntry!1004) t!35353) tb!8517))

(declare-fun result!17603 () Bool)

(assert (=> tb!8517 (= result!17603 tp_is_empty!28243)))

(assert (=> b!1124335 t!35353))

(declare-fun b_and!38189 () Bool)

(assert (= b_and!38187 (and (=> t!35353 result!17603) b_and!38189)))

(declare-fun m!1038117 () Bool)

(assert (=> b!1124336 m!1038117))

(declare-fun m!1038119 () Bool)

(assert (=> b!1124336 m!1038119))

(declare-fun m!1038121 () Bool)

(assert (=> mapNonEmpty!44182 m!1038121))

(declare-fun m!1038123 () Bool)

(assert (=> b!1124335 m!1038123))

(declare-fun m!1038125 () Bool)

(assert (=> b!1124335 m!1038125))

(declare-fun m!1038127 () Bool)

(assert (=> b!1124335 m!1038127))

(declare-fun m!1038129 () Bool)

(assert (=> b!1124335 m!1038129))

(declare-fun m!1038131 () Bool)

(assert (=> b!1124326 m!1038131))

(declare-fun m!1038133 () Bool)

(assert (=> b!1124339 m!1038133))

(declare-fun m!1038135 () Bool)

(assert (=> b!1124340 m!1038135))

(declare-fun m!1038137 () Bool)

(assert (=> bm!47395 m!1038137))

(declare-fun m!1038139 () Bool)

(assert (=> b!1124329 m!1038139))

(declare-fun m!1038141 () Bool)

(assert (=> b!1124329 m!1038141))

(declare-fun m!1038143 () Bool)

(assert (=> b!1124338 m!1038143))

(declare-fun m!1038145 () Bool)

(assert (=> b!1124325 m!1038145))

(assert (=> bm!47396 m!1038119))

(declare-fun m!1038147 () Bool)

(assert (=> b!1124337 m!1038147))

(declare-fun m!1038149 () Bool)

(assert (=> b!1124337 m!1038149))

(declare-fun m!1038151 () Bool)

(assert (=> b!1124323 m!1038151))

(assert (=> b!1124323 m!1038151))

(declare-fun m!1038153 () Bool)

(assert (=> b!1124323 m!1038153))

(declare-fun m!1038155 () Bool)

(assert (=> b!1124323 m!1038155))

(declare-fun m!1038157 () Bool)

(assert (=> start!98006 m!1038157))

(declare-fun m!1038159 () Bool)

(assert (=> start!98006 m!1038159))

(declare-fun m!1038161 () Bool)

(assert (=> b!1124330 m!1038161))

(declare-fun m!1038163 () Bool)

(assert (=> b!1124330 m!1038163))

(declare-fun m!1038165 () Bool)

(assert (=> b!1124333 m!1038165))

(declare-fun m!1038167 () Bool)

(assert (=> b!1124324 m!1038167))

(check-sat (not b_lambda!18665) (not bm!47396) (not b!1124324) (not b!1124333) (not b_next!23713) (not b!1124338) tp_is_empty!28243 (not b!1124323) b_and!38189 (not start!98006) (not b!1124335) (not mapNonEmpty!44182) (not b!1124339) (not b!1124329) (not b!1124336) (not b!1124340) (not b!1124330) (not bm!47395) (not b!1124325) (not b!1124337))
(check-sat b_and!38189 (not b_next!23713))
