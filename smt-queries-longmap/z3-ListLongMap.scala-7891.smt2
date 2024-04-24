; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98326 () Bool)

(assert start!98326)

(declare-fun b_free!23791 () Bool)

(declare-fun b_next!23791 () Bool)

(assert (=> start!98326 (= b_free!23791 (not b_next!23791))))

(declare-fun tp!84076 () Bool)

(declare-fun b_and!38375 () Bool)

(assert (=> start!98326 (= tp!84076 b_and!38375)))

(declare-fun mapNonEmpty!44299 () Bool)

(declare-fun mapRes!44299 () Bool)

(declare-fun tp!84077 () Bool)

(declare-fun e!642187 () Bool)

(assert (=> mapNonEmpty!44299 (= mapRes!44299 (and tp!84077 e!642187))))

(declare-fun mapKey!44299 () (_ BitVec 32))

(declare-datatypes ((V!42889 0))(
  ( (V!42890 (val!14217 Int)) )
))
(declare-datatypes ((ValueCell!13451 0))(
  ( (ValueCellFull!13451 (v!16846 V!42889)) (EmptyCell!13451) )
))
(declare-fun mapRest!44299 () (Array (_ BitVec 32) ValueCell!13451))

(declare-fun mapValue!44299 () ValueCell!13451)

(declare-datatypes ((array!73549 0))(
  ( (array!73550 (arr!35421 (Array (_ BitVec 32) ValueCell!13451)) (size!35958 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73549)

(assert (=> mapNonEmpty!44299 (= (arr!35421 _values!996) (store mapRest!44299 mapKey!44299 mapValue!44299))))

(declare-fun b!1128065 () Bool)

(declare-fun e!642190 () Bool)

(declare-fun e!642184 () Bool)

(assert (=> b!1128065 (= e!642190 e!642184)))

(declare-fun res!753451 () Bool)

(assert (=> b!1128065 (=> res!753451 e!642184)))

(declare-datatypes ((array!73551 0))(
  ( (array!73552 (arr!35422 (Array (_ BitVec 32) (_ BitVec 64))) (size!35959 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73551)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128065 (= res!753451 (not (= (select (arr!35422 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642183 () Bool)

(assert (=> b!1128065 e!642183))

(declare-fun c!110087 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128065 (= c!110087 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42889)

(declare-datatypes ((Unit!36909 0))(
  ( (Unit!36910) )
))
(declare-fun lt!500851 () Unit!36909)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!386 (array!73551 array!73549 (_ BitVec 32) (_ BitVec 32) V!42889 V!42889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36909)

(assert (=> b!1128065 (= lt!500851 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128066 () Bool)

(assert (=> b!1128066 (= e!642184 true)))

(declare-fun lt!500852 () Bool)

(declare-datatypes ((tuple2!17892 0))(
  ( (tuple2!17893 (_1!8957 (_ BitVec 64)) (_2!8957 V!42889)) )
))
(declare-datatypes ((List!24677 0))(
  ( (Nil!24674) (Cons!24673 (h!25891 tuple2!17892) (t!35452 List!24677)) )
))
(declare-datatypes ((ListLongMap!15869 0))(
  ( (ListLongMap!15870 (toList!7950 List!24677)) )
))
(declare-fun contains!6494 (ListLongMap!15869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4471 (array!73551 array!73549 (_ BitVec 32) (_ BitVec 32) V!42889 V!42889 (_ BitVec 32) Int) ListLongMap!15869)

(assert (=> b!1128066 (= lt!500852 (contains!6494 (getCurrentListMapNoExtraKeys!4471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128067 () Bool)

(declare-fun e!642186 () Bool)

(declare-fun e!642192 () Bool)

(assert (=> b!1128067 (= e!642186 (and e!642192 mapRes!44299))))

(declare-fun condMapEmpty!44299 () Bool)

(declare-fun mapDefault!44299 () ValueCell!13451)

(assert (=> b!1128067 (= condMapEmpty!44299 (= (arr!35421 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13451)) mapDefault!44299)))))

(declare-fun mapIsEmpty!44299 () Bool)

(assert (=> mapIsEmpty!44299 mapRes!44299))

(declare-fun b!1128069 () Bool)

(declare-fun tp_is_empty!28321 () Bool)

(assert (=> b!1128069 (= e!642192 tp_is_empty!28321)))

(declare-fun b!1128070 () Bool)

(declare-fun res!753448 () Bool)

(declare-fun e!642189 () Bool)

(assert (=> b!1128070 (=> (not res!753448) (not e!642189))))

(assert (=> b!1128070 (= res!753448 (and (= (size!35958 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35959 _keys!1208) (size!35958 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128071 () Bool)

(declare-fun res!753453 () Bool)

(declare-fun e!642185 () Bool)

(assert (=> b!1128071 (=> (not res!753453) (not e!642185))))

(declare-fun lt!500854 () array!73551)

(declare-datatypes ((List!24678 0))(
  ( (Nil!24675) (Cons!24674 (h!25892 (_ BitVec 64)) (t!35453 List!24678)) )
))
(declare-fun arrayNoDuplicates!0 (array!73551 (_ BitVec 32) List!24678) Bool)

(assert (=> b!1128071 (= res!753453 (arrayNoDuplicates!0 lt!500854 #b00000000000000000000000000000000 Nil!24675))))

(declare-fun b!1128072 () Bool)

(declare-fun res!753457 () Bool)

(assert (=> b!1128072 (=> (not res!753457) (not e!642189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73551 (_ BitVec 32)) Bool)

(assert (=> b!1128072 (= res!753457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128073 () Bool)

(declare-fun e!642188 () Bool)

(assert (=> b!1128073 (= e!642185 (not e!642188))))

(declare-fun res!753460 () Bool)

(assert (=> b!1128073 (=> res!753460 e!642188)))

(assert (=> b!1128073 (= res!753460 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128073 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500856 () Unit!36909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73551 (_ BitVec 64) (_ BitVec 32)) Unit!36909)

(assert (=> b!1128073 (= lt!500856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!47723 () ListLongMap!15869)

(declare-fun b!1128074 () Bool)

(declare-fun call!47722 () ListLongMap!15869)

(declare-fun -!1126 (ListLongMap!15869 (_ BitVec 64)) ListLongMap!15869)

(assert (=> b!1128074 (= e!642183 (= call!47722 (-!1126 call!47723 k0!934)))))

(declare-fun b!1128075 () Bool)

(declare-fun res!753450 () Bool)

(assert (=> b!1128075 (=> (not res!753450) (not e!642189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128075 (= res!753450 (validMask!0 mask!1564))))

(declare-fun bm!47719 () Bool)

(declare-fun lt!500857 () array!73549)

(assert (=> bm!47719 (= call!47722 (getCurrentListMapNoExtraKeys!4471 lt!500854 lt!500857 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128076 () Bool)

(declare-fun res!753456 () Bool)

(assert (=> b!1128076 (=> (not res!753456) (not e!642189))))

(assert (=> b!1128076 (= res!753456 (= (select (arr!35422 _keys!1208) i!673) k0!934))))

(declare-fun b!1128077 () Bool)

(assert (=> b!1128077 (= e!642183 (= call!47722 call!47723))))

(declare-fun b!1128078 () Bool)

(declare-fun res!753449 () Bool)

(assert (=> b!1128078 (=> (not res!753449) (not e!642189))))

(assert (=> b!1128078 (= res!753449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35959 _keys!1208))))))

(declare-fun b!1128079 () Bool)

(assert (=> b!1128079 (= e!642188 e!642190)))

(declare-fun res!753459 () Bool)

(assert (=> b!1128079 (=> res!753459 e!642190)))

(assert (=> b!1128079 (= res!753459 (not (= from!1455 i!673)))))

(declare-fun lt!500855 () ListLongMap!15869)

(assert (=> b!1128079 (= lt!500855 (getCurrentListMapNoExtraKeys!4471 lt!500854 lt!500857 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2541 (Int (_ BitVec 64)) V!42889)

(assert (=> b!1128079 (= lt!500857 (array!73550 (store (arr!35421 _values!996) i!673 (ValueCellFull!13451 (dynLambda!2541 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35958 _values!996)))))

(declare-fun lt!500853 () ListLongMap!15869)

(assert (=> b!1128079 (= lt!500853 (getCurrentListMapNoExtraKeys!4471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!753455 () Bool)

(assert (=> start!98326 (=> (not res!753455) (not e!642189))))

(assert (=> start!98326 (= res!753455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35959 _keys!1208))))))

(assert (=> start!98326 e!642189))

(assert (=> start!98326 tp_is_empty!28321))

(declare-fun array_inv!27236 (array!73551) Bool)

(assert (=> start!98326 (array_inv!27236 _keys!1208)))

(assert (=> start!98326 true))

(assert (=> start!98326 tp!84076))

(declare-fun array_inv!27237 (array!73549) Bool)

(assert (=> start!98326 (and (array_inv!27237 _values!996) e!642186)))

(declare-fun b!1128068 () Bool)

(declare-fun res!753454 () Bool)

(assert (=> b!1128068 (=> (not res!753454) (not e!642189))))

(assert (=> b!1128068 (= res!753454 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24675))))

(declare-fun bm!47720 () Bool)

(assert (=> bm!47720 (= call!47723 (getCurrentListMapNoExtraKeys!4471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128080 () Bool)

(declare-fun res!753452 () Bool)

(assert (=> b!1128080 (=> (not res!753452) (not e!642189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128080 (= res!753452 (validKeyInArray!0 k0!934))))

(declare-fun b!1128081 () Bool)

(assert (=> b!1128081 (= e!642189 e!642185)))

(declare-fun res!753458 () Bool)

(assert (=> b!1128081 (=> (not res!753458) (not e!642185))))

(assert (=> b!1128081 (= res!753458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500854 mask!1564))))

(assert (=> b!1128081 (= lt!500854 (array!73552 (store (arr!35422 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35959 _keys!1208)))))

(declare-fun b!1128082 () Bool)

(assert (=> b!1128082 (= e!642187 tp_is_empty!28321)))

(assert (= (and start!98326 res!753455) b!1128075))

(assert (= (and b!1128075 res!753450) b!1128070))

(assert (= (and b!1128070 res!753448) b!1128072))

(assert (= (and b!1128072 res!753457) b!1128068))

(assert (= (and b!1128068 res!753454) b!1128078))

(assert (= (and b!1128078 res!753449) b!1128080))

(assert (= (and b!1128080 res!753452) b!1128076))

(assert (= (and b!1128076 res!753456) b!1128081))

(assert (= (and b!1128081 res!753458) b!1128071))

(assert (= (and b!1128071 res!753453) b!1128073))

(assert (= (and b!1128073 (not res!753460)) b!1128079))

(assert (= (and b!1128079 (not res!753459)) b!1128065))

(assert (= (and b!1128065 c!110087) b!1128074))

(assert (= (and b!1128065 (not c!110087)) b!1128077))

(assert (= (or b!1128074 b!1128077) bm!47720))

(assert (= (or b!1128074 b!1128077) bm!47719))

(assert (= (and b!1128065 (not res!753451)) b!1128066))

(assert (= (and b!1128067 condMapEmpty!44299) mapIsEmpty!44299))

(assert (= (and b!1128067 (not condMapEmpty!44299)) mapNonEmpty!44299))

(get-info :version)

(assert (= (and mapNonEmpty!44299 ((_ is ValueCellFull!13451) mapValue!44299)) b!1128082))

(assert (= (and b!1128067 ((_ is ValueCellFull!13451) mapDefault!44299)) b!1128069))

(assert (= start!98326 b!1128067))

(declare-fun b_lambda!18771 () Bool)

(assert (=> (not b_lambda!18771) (not b!1128079)))

(declare-fun t!35451 () Bool)

(declare-fun tb!8595 () Bool)

(assert (=> (and start!98326 (= defaultEntry!1004 defaultEntry!1004) t!35451) tb!8595))

(declare-fun result!17759 () Bool)

(assert (=> tb!8595 (= result!17759 tp_is_empty!28321)))

(assert (=> b!1128079 t!35451))

(declare-fun b_and!38377 () Bool)

(assert (= b_and!38375 (and (=> t!35451 result!17759) b_and!38377)))

(declare-fun m!1042323 () Bool)

(assert (=> b!1128065 m!1042323))

(declare-fun m!1042325 () Bool)

(assert (=> b!1128065 m!1042325))

(declare-fun m!1042327 () Bool)

(assert (=> b!1128076 m!1042327))

(declare-fun m!1042329 () Bool)

(assert (=> b!1128075 m!1042329))

(declare-fun m!1042331 () Bool)

(assert (=> bm!47720 m!1042331))

(assert (=> b!1128066 m!1042331))

(assert (=> b!1128066 m!1042331))

(declare-fun m!1042333 () Bool)

(assert (=> b!1128066 m!1042333))

(declare-fun m!1042335 () Bool)

(assert (=> b!1128074 m!1042335))

(declare-fun m!1042337 () Bool)

(assert (=> b!1128080 m!1042337))

(declare-fun m!1042339 () Bool)

(assert (=> b!1128081 m!1042339))

(declare-fun m!1042341 () Bool)

(assert (=> b!1128081 m!1042341))

(declare-fun m!1042343 () Bool)

(assert (=> bm!47719 m!1042343))

(declare-fun m!1042345 () Bool)

(assert (=> b!1128071 m!1042345))

(declare-fun m!1042347 () Bool)

(assert (=> b!1128072 m!1042347))

(declare-fun m!1042349 () Bool)

(assert (=> b!1128079 m!1042349))

(declare-fun m!1042351 () Bool)

(assert (=> b!1128079 m!1042351))

(declare-fun m!1042353 () Bool)

(assert (=> b!1128079 m!1042353))

(declare-fun m!1042355 () Bool)

(assert (=> b!1128079 m!1042355))

(declare-fun m!1042357 () Bool)

(assert (=> start!98326 m!1042357))

(declare-fun m!1042359 () Bool)

(assert (=> start!98326 m!1042359))

(declare-fun m!1042361 () Bool)

(assert (=> b!1128068 m!1042361))

(declare-fun m!1042363 () Bool)

(assert (=> b!1128073 m!1042363))

(declare-fun m!1042365 () Bool)

(assert (=> b!1128073 m!1042365))

(declare-fun m!1042367 () Bool)

(assert (=> mapNonEmpty!44299 m!1042367))

(check-sat (not mapNonEmpty!44299) (not b!1128074) (not b!1128073) tp_is_empty!28321 (not b!1128065) (not b!1128066) (not b_next!23791) (not b!1128080) b_and!38377 (not start!98326) (not bm!47719) (not b!1128071) (not b_lambda!18771) (not b!1128081) (not b!1128075) (not b!1128079) (not bm!47720) (not b!1128072) (not b!1128068))
(check-sat b_and!38377 (not b_next!23791))
