; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98144 () Bool)

(assert start!98144)

(declare-fun b_free!23851 () Bool)

(declare-fun b_next!23851 () Bool)

(assert (=> start!98144 (= b_free!23851 (not b_next!23851))))

(declare-fun tp!84257 () Bool)

(declare-fun b_and!38463 () Bool)

(assert (=> start!98144 (= tp!84257 b_and!38463)))

(declare-fun b!1128298 () Bool)

(declare-fun res!754043 () Bool)

(declare-fun e!642153 () Bool)

(assert (=> b!1128298 (=> (not res!754043) (not e!642153))))

(declare-datatypes ((array!73548 0))(
  ( (array!73549 (arr!35427 (Array (_ BitVec 32) (_ BitVec 64))) (size!35965 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73548)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73548 (_ BitVec 32)) Bool)

(assert (=> b!1128298 (= res!754043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128299 () Bool)

(declare-fun e!642156 () Bool)

(assert (=> b!1128299 (= e!642153 e!642156)))

(declare-fun res!754044 () Bool)

(assert (=> b!1128299 (=> (not res!754044) (not e!642156))))

(declare-fun lt!500761 () array!73548)

(assert (=> b!1128299 (= res!754044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500761 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128299 (= lt!500761 (array!73549 (store (arr!35427 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35965 _keys!1208)))))

(declare-fun b!1128300 () Bool)

(declare-fun res!754042 () Bool)

(assert (=> b!1128300 (=> (not res!754042) (not e!642153))))

(declare-datatypes ((List!24779 0))(
  ( (Nil!24776) (Cons!24775 (h!25984 (_ BitVec 64)) (t!35613 List!24779)) )
))
(declare-fun arrayNoDuplicates!0 (array!73548 (_ BitVec 32) List!24779) Bool)

(assert (=> b!1128300 (= res!754042 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24776))))

(declare-datatypes ((V!42969 0))(
  ( (V!42970 (val!14247 Int)) )
))
(declare-fun zeroValue!944 () V!42969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18024 0))(
  ( (tuple2!18025 (_1!9023 (_ BitVec 64)) (_2!9023 V!42969)) )
))
(declare-datatypes ((List!24780 0))(
  ( (Nil!24777) (Cons!24776 (h!25985 tuple2!18024) (t!35614 List!24780)) )
))
(declare-datatypes ((ListLongMap!15993 0))(
  ( (ListLongMap!15994 (toList!8012 List!24780)) )
))
(declare-fun call!47813 () ListLongMap!15993)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13481 0))(
  ( (ValueCellFull!13481 (v!16879 V!42969)) (EmptyCell!13481) )
))
(declare-datatypes ((array!73550 0))(
  ( (array!73551 (arr!35428 (Array (_ BitVec 32) ValueCell!13481)) (size!35966 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73550)

(declare-fun minValue!944 () V!42969)

(declare-fun bm!47809 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4512 (array!73548 array!73550 (_ BitVec 32) (_ BitVec 32) V!42969 V!42969 (_ BitVec 32) Int) ListLongMap!15993)

(assert (=> bm!47809 (= call!47813 (getCurrentListMapNoExtraKeys!4512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128301 () Bool)

(declare-fun e!642154 () Bool)

(declare-fun call!47812 () ListLongMap!15993)

(assert (=> b!1128301 (= e!642154 (= call!47812 call!47813))))

(declare-fun b!1128302 () Bool)

(declare-fun res!754037 () Bool)

(assert (=> b!1128302 (=> (not res!754037) (not e!642153))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1128302 (= res!754037 (= (select (arr!35427 _keys!1208) i!673) k0!934))))

(declare-fun b!1128303 () Bool)

(declare-fun e!642151 () Bool)

(declare-fun tp_is_empty!28381 () Bool)

(assert (=> b!1128303 (= e!642151 tp_is_empty!28381)))

(declare-fun res!754048 () Bool)

(assert (=> start!98144 (=> (not res!754048) (not e!642153))))

(assert (=> start!98144 (= res!754048 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35965 _keys!1208))))))

(assert (=> start!98144 e!642153))

(assert (=> start!98144 tp_is_empty!28381))

(declare-fun array_inv!27262 (array!73548) Bool)

(assert (=> start!98144 (array_inv!27262 _keys!1208)))

(assert (=> start!98144 true))

(assert (=> start!98144 tp!84257))

(declare-fun e!642148 () Bool)

(declare-fun array_inv!27263 (array!73550) Bool)

(assert (=> start!98144 (and (array_inv!27263 _values!996) e!642148)))

(declare-fun b!1128304 () Bool)

(declare-fun e!642149 () Bool)

(declare-fun e!642150 () Bool)

(assert (=> b!1128304 (= e!642149 e!642150)))

(declare-fun res!754046 () Bool)

(assert (=> b!1128304 (=> res!754046 e!642150)))

(assert (=> b!1128304 (= res!754046 (not (= from!1455 i!673)))))

(declare-fun lt!500763 () ListLongMap!15993)

(declare-fun lt!500759 () array!73550)

(assert (=> b!1128304 (= lt!500763 (getCurrentListMapNoExtraKeys!4512 lt!500761 lt!500759 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2522 (Int (_ BitVec 64)) V!42969)

(assert (=> b!1128304 (= lt!500759 (array!73551 (store (arr!35428 _values!996) i!673 (ValueCellFull!13481 (dynLambda!2522 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35966 _values!996)))))

(declare-fun lt!500762 () ListLongMap!15993)

(assert (=> b!1128304 (= lt!500762 (getCurrentListMapNoExtraKeys!4512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128305 () Bool)

(declare-fun res!754036 () Bool)

(assert (=> b!1128305 (=> (not res!754036) (not e!642153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128305 (= res!754036 (validKeyInArray!0 k0!934))))

(declare-fun b!1128306 () Bool)

(declare-fun res!754047 () Bool)

(assert (=> b!1128306 (=> (not res!754047) (not e!642153))))

(assert (=> b!1128306 (= res!754047 (and (= (size!35966 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35965 _keys!1208) (size!35966 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128307 () Bool)

(declare-fun res!754038 () Bool)

(assert (=> b!1128307 (=> (not res!754038) (not e!642153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128307 (= res!754038 (validMask!0 mask!1564))))

(declare-fun b!1128308 () Bool)

(declare-fun res!754041 () Bool)

(assert (=> b!1128308 (=> (not res!754041) (not e!642156))))

(assert (=> b!1128308 (= res!754041 (arrayNoDuplicates!0 lt!500761 #b00000000000000000000000000000000 Nil!24776))))

(declare-fun b!1128309 () Bool)

(declare-fun e!642147 () Bool)

(assert (=> b!1128309 (= e!642147 tp_is_empty!28381)))

(declare-fun b!1128310 () Bool)

(assert (=> b!1128310 (= e!642156 (not e!642149))))

(declare-fun res!754039 () Bool)

(assert (=> b!1128310 (=> res!754039 e!642149)))

(assert (=> b!1128310 (= res!754039 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128310 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36821 0))(
  ( (Unit!36822) )
))
(declare-fun lt!500760 () Unit!36821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73548 (_ BitVec 64) (_ BitVec 32)) Unit!36821)

(assert (=> b!1128310 (= lt!500760 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128311 () Bool)

(declare-fun e!642152 () Bool)

(assert (=> b!1128311 (= e!642150 e!642152)))

(declare-fun res!754040 () Bool)

(assert (=> b!1128311 (=> res!754040 e!642152)))

(assert (=> b!1128311 (= res!754040 (not (= (select (arr!35427 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128311 e!642154))

(declare-fun c!109740 () Bool)

(assert (=> b!1128311 (= c!109740 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500757 () Unit!36821)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!412 (array!73548 array!73550 (_ BitVec 32) (_ BitVec 32) V!42969 V!42969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36821)

(assert (=> b!1128311 (= lt!500757 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44389 () Bool)

(declare-fun mapRes!44389 () Bool)

(declare-fun tp!84256 () Bool)

(assert (=> mapNonEmpty!44389 (= mapRes!44389 (and tp!84256 e!642151))))

(declare-fun mapValue!44389 () ValueCell!13481)

(declare-fun mapKey!44389 () (_ BitVec 32))

(declare-fun mapRest!44389 () (Array (_ BitVec 32) ValueCell!13481))

(assert (=> mapNonEmpty!44389 (= (arr!35428 _values!996) (store mapRest!44389 mapKey!44389 mapValue!44389))))

(declare-fun b!1128312 () Bool)

(assert (=> b!1128312 (= e!642148 (and e!642147 mapRes!44389))))

(declare-fun condMapEmpty!44389 () Bool)

(declare-fun mapDefault!44389 () ValueCell!13481)

(assert (=> b!1128312 (= condMapEmpty!44389 (= (arr!35428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13481)) mapDefault!44389)))))

(declare-fun b!1128313 () Bool)

(assert (=> b!1128313 (= e!642152 true)))

(declare-fun lt!500758 () Bool)

(declare-fun contains!6467 (ListLongMap!15993 (_ BitVec 64)) Bool)

(assert (=> b!1128313 (= lt!500758 (contains!6467 (getCurrentListMapNoExtraKeys!4512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47810 () Bool)

(assert (=> bm!47810 (= call!47812 (getCurrentListMapNoExtraKeys!4512 lt!500761 lt!500759 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128314 () Bool)

(declare-fun res!754045 () Bool)

(assert (=> b!1128314 (=> (not res!754045) (not e!642153))))

(assert (=> b!1128314 (= res!754045 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35965 _keys!1208))))))

(declare-fun b!1128315 () Bool)

(declare-fun -!1130 (ListLongMap!15993 (_ BitVec 64)) ListLongMap!15993)

(assert (=> b!1128315 (= e!642154 (= call!47812 (-!1130 call!47813 k0!934)))))

(declare-fun mapIsEmpty!44389 () Bool)

(assert (=> mapIsEmpty!44389 mapRes!44389))

(assert (= (and start!98144 res!754048) b!1128307))

(assert (= (and b!1128307 res!754038) b!1128306))

(assert (= (and b!1128306 res!754047) b!1128298))

(assert (= (and b!1128298 res!754043) b!1128300))

(assert (= (and b!1128300 res!754042) b!1128314))

(assert (= (and b!1128314 res!754045) b!1128305))

(assert (= (and b!1128305 res!754036) b!1128302))

(assert (= (and b!1128302 res!754037) b!1128299))

(assert (= (and b!1128299 res!754044) b!1128308))

(assert (= (and b!1128308 res!754041) b!1128310))

(assert (= (and b!1128310 (not res!754039)) b!1128304))

(assert (= (and b!1128304 (not res!754046)) b!1128311))

(assert (= (and b!1128311 c!109740) b!1128315))

(assert (= (and b!1128311 (not c!109740)) b!1128301))

(assert (= (or b!1128315 b!1128301) bm!47810))

(assert (= (or b!1128315 b!1128301) bm!47809))

(assert (= (and b!1128311 (not res!754040)) b!1128313))

(assert (= (and b!1128312 condMapEmpty!44389) mapIsEmpty!44389))

(assert (= (and b!1128312 (not condMapEmpty!44389)) mapNonEmpty!44389))

(get-info :version)

(assert (= (and mapNonEmpty!44389 ((_ is ValueCellFull!13481) mapValue!44389)) b!1128303))

(assert (= (and b!1128312 ((_ is ValueCellFull!13481) mapDefault!44389)) b!1128309))

(assert (= start!98144 b!1128312))

(declare-fun b_lambda!18803 () Bool)

(assert (=> (not b_lambda!18803) (not b!1128304)))

(declare-fun t!35612 () Bool)

(declare-fun tb!8655 () Bool)

(assert (=> (and start!98144 (= defaultEntry!1004 defaultEntry!1004) t!35612) tb!8655))

(declare-fun result!17879 () Bool)

(assert (=> tb!8655 (= result!17879 tp_is_empty!28381)))

(assert (=> b!1128304 t!35612))

(declare-fun b_and!38465 () Bool)

(assert (= b_and!38463 (and (=> t!35612 result!17879) b_and!38465)))

(declare-fun m!1041399 () Bool)

(assert (=> bm!47810 m!1041399))

(declare-fun m!1041401 () Bool)

(assert (=> b!1128313 m!1041401))

(assert (=> b!1128313 m!1041401))

(declare-fun m!1041403 () Bool)

(assert (=> b!1128313 m!1041403))

(declare-fun m!1041405 () Bool)

(assert (=> b!1128299 m!1041405))

(declare-fun m!1041407 () Bool)

(assert (=> b!1128299 m!1041407))

(declare-fun m!1041409 () Bool)

(assert (=> b!1128298 m!1041409))

(declare-fun m!1041411 () Bool)

(assert (=> mapNonEmpty!44389 m!1041411))

(declare-fun m!1041413 () Bool)

(assert (=> b!1128308 m!1041413))

(declare-fun m!1041415 () Bool)

(assert (=> b!1128300 m!1041415))

(declare-fun m!1041417 () Bool)

(assert (=> b!1128304 m!1041417))

(declare-fun m!1041419 () Bool)

(assert (=> b!1128304 m!1041419))

(declare-fun m!1041421 () Bool)

(assert (=> b!1128304 m!1041421))

(declare-fun m!1041423 () Bool)

(assert (=> b!1128304 m!1041423))

(declare-fun m!1041425 () Bool)

(assert (=> b!1128307 m!1041425))

(declare-fun m!1041427 () Bool)

(assert (=> b!1128302 m!1041427))

(declare-fun m!1041429 () Bool)

(assert (=> b!1128310 m!1041429))

(declare-fun m!1041431 () Bool)

(assert (=> b!1128310 m!1041431))

(declare-fun m!1041433 () Bool)

(assert (=> b!1128305 m!1041433))

(declare-fun m!1041435 () Bool)

(assert (=> b!1128315 m!1041435))

(assert (=> bm!47809 m!1041401))

(declare-fun m!1041437 () Bool)

(assert (=> start!98144 m!1041437))

(declare-fun m!1041439 () Bool)

(assert (=> start!98144 m!1041439))

(declare-fun m!1041441 () Bool)

(assert (=> b!1128311 m!1041441))

(declare-fun m!1041443 () Bool)

(assert (=> b!1128311 m!1041443))

(check-sat (not bm!47809) (not b!1128315) (not b!1128305) (not b!1128298) (not b!1128313) (not b_lambda!18803) b_and!38465 (not b!1128307) (not b!1128310) (not b!1128311) (not b!1128304) (not bm!47810) tp_is_empty!28381 (not start!98144) (not b!1128300) (not b!1128299) (not b_next!23851) (not b!1128308) (not mapNonEmpty!44389))
(check-sat b_and!38465 (not b_next!23851))
