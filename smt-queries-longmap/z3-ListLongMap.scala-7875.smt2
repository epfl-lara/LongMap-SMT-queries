; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98230 () Bool)

(assert start!98230)

(declare-fun b_free!23695 () Bool)

(declare-fun b_next!23695 () Bool)

(assert (=> start!98230 (= b_free!23695 (not b_next!23695))))

(declare-fun tp!83788 () Bool)

(declare-fun b_and!38183 () Bool)

(assert (=> start!98230 (= tp!83788 b_and!38183)))

(declare-fun b!1125219 () Bool)

(declare-fun e!640670 () Bool)

(declare-fun tp_is_empty!28225 () Bool)

(assert (=> b!1125219 (= e!640670 tp_is_empty!28225)))

(declare-fun b!1125220 () Bool)

(declare-fun e!640673 () Bool)

(declare-fun e!640668 () Bool)

(assert (=> b!1125220 (= e!640673 (not e!640668))))

(declare-fun res!751423 () Bool)

(assert (=> b!1125220 (=> res!751423 e!640668)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125220 (= res!751423 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73363 0))(
  ( (array!73364 (arr!35328 (Array (_ BitVec 32) (_ BitVec 64))) (size!35865 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73363)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125220 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36841 0))(
  ( (Unit!36842) )
))
(declare-fun lt!499768 () Unit!36841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73363 (_ BitVec 64) (_ BitVec 32)) Unit!36841)

(assert (=> b!1125220 (= lt!499768 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125221 () Bool)

(declare-fun e!640674 () Bool)

(assert (=> b!1125221 (= e!640674 e!640673)))

(declare-fun res!751425 () Bool)

(assert (=> b!1125221 (=> (not res!751425) (not e!640673))))

(declare-fun lt!499769 () array!73363)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73363 (_ BitVec 32)) Bool)

(assert (=> b!1125221 (= res!751425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499769 mask!1564))))

(assert (=> b!1125221 (= lt!499769 (array!73364 (store (arr!35328 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35865 _keys!1208)))))

(declare-fun b!1125222 () Bool)

(declare-fun res!751426 () Bool)

(assert (=> b!1125222 (=> (not res!751426) (not e!640674))))

(declare-datatypes ((List!24599 0))(
  ( (Nil!24596) (Cons!24595 (h!25813 (_ BitVec 64)) (t!35278 List!24599)) )
))
(declare-fun arrayNoDuplicates!0 (array!73363 (_ BitVec 32) List!24599) Bool)

(assert (=> b!1125222 (= res!751426 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24596))))

(declare-fun b!1125223 () Bool)

(declare-fun res!751430 () Bool)

(assert (=> b!1125223 (=> (not res!751430) (not e!640674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125223 (= res!751430 (validMask!0 mask!1564))))

(declare-fun b!1125224 () Bool)

(declare-fun res!751420 () Bool)

(declare-fun e!640669 () Bool)

(assert (=> b!1125224 (=> res!751420 e!640669)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1125224 (= res!751420 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125225 () Bool)

(assert (=> b!1125225 (= e!640669 true)))

(declare-datatypes ((V!42761 0))(
  ( (V!42762 (val!14169 Int)) )
))
(declare-datatypes ((tuple2!17808 0))(
  ( (tuple2!17809 (_1!8915 (_ BitVec 64)) (_2!8915 V!42761)) )
))
(declare-datatypes ((List!24600 0))(
  ( (Nil!24597) (Cons!24596 (h!25814 tuple2!17808) (t!35279 List!24600)) )
))
(declare-datatypes ((ListLongMap!15785 0))(
  ( (ListLongMap!15786 (toList!7908 List!24600)) )
))
(declare-fun lt!499765 () ListLongMap!15785)

(declare-fun zeroValue!944 () V!42761)

(declare-fun contains!6465 (ListLongMap!15785 (_ BitVec 64)) Bool)

(declare-fun +!3443 (ListLongMap!15785 tuple2!17808) ListLongMap!15785)

(assert (=> b!1125225 (contains!6465 (+!3443 lt!499765 (tuple2!17809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499766 () Unit!36841)

(declare-fun addStillContains!669 (ListLongMap!15785 (_ BitVec 64) V!42761 (_ BitVec 64)) Unit!36841)

(assert (=> b!1125225 (= lt!499766 (addStillContains!669 lt!499765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun mapIsEmpty!44155 () Bool)

(declare-fun mapRes!44155 () Bool)

(assert (=> mapIsEmpty!44155 mapRes!44155))

(declare-fun call!47435 () ListLongMap!15785)

(declare-fun e!640666 () Bool)

(declare-fun call!47434 () ListLongMap!15785)

(declare-fun b!1125226 () Bool)

(declare-fun -!1099 (ListLongMap!15785 (_ BitVec 64)) ListLongMap!15785)

(assert (=> b!1125226 (= e!640666 (= call!47435 (-!1099 call!47434 k0!934)))))

(declare-fun b!1125227 () Bool)

(assert (=> b!1125227 (= e!640666 (= call!47435 call!47434))))

(declare-fun b!1125228 () Bool)

(declare-fun res!751419 () Bool)

(assert (=> b!1125228 (=> (not res!751419) (not e!640674))))

(declare-datatypes ((ValueCell!13403 0))(
  ( (ValueCellFull!13403 (v!16798 V!42761)) (EmptyCell!13403) )
))
(declare-datatypes ((array!73365 0))(
  ( (array!73366 (arr!35329 (Array (_ BitVec 32) ValueCell!13403)) (size!35866 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73365)

(assert (=> b!1125228 (= res!751419 (and (= (size!35866 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35865 _keys!1208) (size!35866 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125229 () Bool)

(declare-fun e!640664 () Bool)

(declare-fun e!640665 () Bool)

(assert (=> b!1125229 (= e!640664 (and e!640665 mapRes!44155))))

(declare-fun condMapEmpty!44155 () Bool)

(declare-fun mapDefault!44155 () ValueCell!13403)

(assert (=> b!1125229 (= condMapEmpty!44155 (= (arr!35329 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13403)) mapDefault!44155)))))

(declare-fun b!1125230 () Bool)

(declare-fun res!751429 () Bool)

(assert (=> b!1125230 (=> (not res!751429) (not e!640674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125230 (= res!751429 (validKeyInArray!0 k0!934))))

(declare-fun b!1125231 () Bool)

(declare-fun e!640671 () Bool)

(assert (=> b!1125231 (= e!640671 e!640669)))

(declare-fun res!751424 () Bool)

(assert (=> b!1125231 (=> res!751424 e!640669)))

(assert (=> b!1125231 (= res!751424 (not (contains!6465 lt!499765 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42761)

(declare-fun getCurrentListMapNoExtraKeys!4434 (array!73363 array!73365 (_ BitVec 32) (_ BitVec 32) V!42761 V!42761 (_ BitVec 32) Int) ListLongMap!15785)

(assert (=> b!1125231 (= lt!499765 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125232 () Bool)

(declare-fun res!751428 () Bool)

(assert (=> b!1125232 (=> (not res!751428) (not e!640674))))

(assert (=> b!1125232 (= res!751428 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35865 _keys!1208))))))

(declare-fun b!1125233 () Bool)

(assert (=> b!1125233 (= e!640665 tp_is_empty!28225)))

(declare-fun res!751422 () Bool)

(assert (=> start!98230 (=> (not res!751422) (not e!640674))))

(assert (=> start!98230 (= res!751422 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35865 _keys!1208))))))

(assert (=> start!98230 e!640674))

(assert (=> start!98230 tp_is_empty!28225))

(declare-fun array_inv!27186 (array!73363) Bool)

(assert (=> start!98230 (array_inv!27186 _keys!1208)))

(assert (=> start!98230 true))

(assert (=> start!98230 tp!83788))

(declare-fun array_inv!27187 (array!73365) Bool)

(assert (=> start!98230 (and (array_inv!27187 _values!996) e!640664)))

(declare-fun b!1125234 () Bool)

(declare-fun e!640672 () Bool)

(assert (=> b!1125234 (= e!640668 e!640672)))

(declare-fun res!751421 () Bool)

(assert (=> b!1125234 (=> res!751421 e!640672)))

(assert (=> b!1125234 (= res!751421 (not (= from!1455 i!673)))))

(declare-fun lt!499770 () ListLongMap!15785)

(declare-fun lt!499767 () array!73365)

(assert (=> b!1125234 (= lt!499770 (getCurrentListMapNoExtraKeys!4434 lt!499769 lt!499767 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2515 (Int (_ BitVec 64)) V!42761)

(assert (=> b!1125234 (= lt!499767 (array!73366 (store (arr!35329 _values!996) i!673 (ValueCellFull!13403 (dynLambda!2515 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35866 _values!996)))))

(declare-fun lt!499764 () ListLongMap!15785)

(assert (=> b!1125234 (= lt!499764 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44155 () Bool)

(declare-fun tp!83789 () Bool)

(assert (=> mapNonEmpty!44155 (= mapRes!44155 (and tp!83789 e!640670))))

(declare-fun mapKey!44155 () (_ BitVec 32))

(declare-fun mapRest!44155 () (Array (_ BitVec 32) ValueCell!13403))

(declare-fun mapValue!44155 () ValueCell!13403)

(assert (=> mapNonEmpty!44155 (= (arr!35329 _values!996) (store mapRest!44155 mapKey!44155 mapValue!44155))))

(declare-fun b!1125235 () Bool)

(assert (=> b!1125235 (= e!640672 e!640671)))

(declare-fun res!751427 () Bool)

(assert (=> b!1125235 (=> res!751427 e!640671)))

(assert (=> b!1125235 (= res!751427 (not (= (select (arr!35328 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125235 e!640666))

(declare-fun c!109943 () Bool)

(assert (=> b!1125235 (= c!109943 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499771 () Unit!36841)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!360 (array!73363 array!73365 (_ BitVec 32) (_ BitVec 32) V!42761 V!42761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36841)

(assert (=> b!1125235 (= lt!499771 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47431 () Bool)

(assert (=> bm!47431 (= call!47435 (getCurrentListMapNoExtraKeys!4434 lt!499769 lt!499767 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47432 () Bool)

(assert (=> bm!47432 (= call!47434 (getCurrentListMapNoExtraKeys!4434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125236 () Bool)

(declare-fun res!751418 () Bool)

(assert (=> b!1125236 (=> (not res!751418) (not e!640674))))

(assert (=> b!1125236 (= res!751418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125237 () Bool)

(declare-fun res!751431 () Bool)

(assert (=> b!1125237 (=> (not res!751431) (not e!640674))))

(assert (=> b!1125237 (= res!751431 (= (select (arr!35328 _keys!1208) i!673) k0!934))))

(declare-fun b!1125238 () Bool)

(declare-fun res!751432 () Bool)

(assert (=> b!1125238 (=> (not res!751432) (not e!640673))))

(assert (=> b!1125238 (= res!751432 (arrayNoDuplicates!0 lt!499769 #b00000000000000000000000000000000 Nil!24596))))

(assert (= (and start!98230 res!751422) b!1125223))

(assert (= (and b!1125223 res!751430) b!1125228))

(assert (= (and b!1125228 res!751419) b!1125236))

(assert (= (and b!1125236 res!751418) b!1125222))

(assert (= (and b!1125222 res!751426) b!1125232))

(assert (= (and b!1125232 res!751428) b!1125230))

(assert (= (and b!1125230 res!751429) b!1125237))

(assert (= (and b!1125237 res!751431) b!1125221))

(assert (= (and b!1125221 res!751425) b!1125238))

(assert (= (and b!1125238 res!751432) b!1125220))

(assert (= (and b!1125220 (not res!751423)) b!1125234))

(assert (= (and b!1125234 (not res!751421)) b!1125235))

(assert (= (and b!1125235 c!109943) b!1125226))

(assert (= (and b!1125235 (not c!109943)) b!1125227))

(assert (= (or b!1125226 b!1125227) bm!47431))

(assert (= (or b!1125226 b!1125227) bm!47432))

(assert (= (and b!1125235 (not res!751427)) b!1125231))

(assert (= (and b!1125231 (not res!751424)) b!1125224))

(assert (= (and b!1125224 (not res!751420)) b!1125225))

(assert (= (and b!1125229 condMapEmpty!44155) mapIsEmpty!44155))

(assert (= (and b!1125229 (not condMapEmpty!44155)) mapNonEmpty!44155))

(get-info :version)

(assert (= (and mapNonEmpty!44155 ((_ is ValueCellFull!13403) mapValue!44155)) b!1125219))

(assert (= (and b!1125229 ((_ is ValueCellFull!13403) mapDefault!44155)) b!1125233))

(assert (= start!98230 b!1125229))

(declare-fun b_lambda!18675 () Bool)

(assert (=> (not b_lambda!18675) (not b!1125234)))

(declare-fun t!35277 () Bool)

(declare-fun tb!8499 () Bool)

(assert (=> (and start!98230 (= defaultEntry!1004 defaultEntry!1004) t!35277) tb!8499))

(declare-fun result!17567 () Bool)

(assert (=> tb!8499 (= result!17567 tp_is_empty!28225)))

(assert (=> b!1125234 t!35277))

(declare-fun b_and!38185 () Bool)

(assert (= b_and!38183 (and (=> t!35277 result!17567) b_and!38185)))

(declare-fun m!1039949 () Bool)

(assert (=> b!1125237 m!1039949))

(declare-fun m!1039951 () Bool)

(assert (=> b!1125231 m!1039951))

(declare-fun m!1039953 () Bool)

(assert (=> b!1125231 m!1039953))

(declare-fun m!1039955 () Bool)

(assert (=> mapNonEmpty!44155 m!1039955))

(declare-fun m!1039957 () Bool)

(assert (=> b!1125225 m!1039957))

(assert (=> b!1125225 m!1039957))

(declare-fun m!1039959 () Bool)

(assert (=> b!1125225 m!1039959))

(declare-fun m!1039961 () Bool)

(assert (=> b!1125225 m!1039961))

(declare-fun m!1039963 () Bool)

(assert (=> bm!47431 m!1039963))

(declare-fun m!1039965 () Bool)

(assert (=> b!1125221 m!1039965))

(declare-fun m!1039967 () Bool)

(assert (=> b!1125221 m!1039967))

(declare-fun m!1039969 () Bool)

(assert (=> b!1125236 m!1039969))

(assert (=> bm!47432 m!1039953))

(declare-fun m!1039971 () Bool)

(assert (=> b!1125238 m!1039971))

(declare-fun m!1039973 () Bool)

(assert (=> b!1125234 m!1039973))

(declare-fun m!1039975 () Bool)

(assert (=> b!1125234 m!1039975))

(declare-fun m!1039977 () Bool)

(assert (=> b!1125234 m!1039977))

(declare-fun m!1039979 () Bool)

(assert (=> b!1125234 m!1039979))

(declare-fun m!1039981 () Bool)

(assert (=> b!1125230 m!1039981))

(declare-fun m!1039983 () Bool)

(assert (=> b!1125220 m!1039983))

(declare-fun m!1039985 () Bool)

(assert (=> b!1125220 m!1039985))

(declare-fun m!1039987 () Bool)

(assert (=> b!1125226 m!1039987))

(declare-fun m!1039989 () Bool)

(assert (=> b!1125223 m!1039989))

(declare-fun m!1039991 () Bool)

(assert (=> b!1125235 m!1039991))

(declare-fun m!1039993 () Bool)

(assert (=> b!1125235 m!1039993))

(declare-fun m!1039995 () Bool)

(assert (=> start!98230 m!1039995))

(declare-fun m!1039997 () Bool)

(assert (=> start!98230 m!1039997))

(declare-fun m!1039999 () Bool)

(assert (=> b!1125222 m!1039999))

(check-sat (not start!98230) (not b!1125230) (not mapNonEmpty!44155) (not b!1125238) tp_is_empty!28225 (not b!1125236) (not b!1125235) (not b!1125234) (not b_next!23695) (not b!1125221) (not b!1125222) (not b!1125231) (not b_lambda!18675) (not b!1125225) (not b!1125226) (not bm!47431) (not b!1125223) (not bm!47432) b_and!38185 (not b!1125220))
(check-sat b_and!38185 (not b_next!23695))
