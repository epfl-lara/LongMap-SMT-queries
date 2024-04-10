; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99372 () Bool)

(assert start!99372)

(declare-fun b_free!24951 () Bool)

(declare-fun b_next!24951 () Bool)

(assert (=> start!99372 (= b_free!24951 (not b_next!24951))))

(declare-fun tp!87567 () Bool)

(declare-fun b_and!40769 () Bool)

(assert (=> start!99372 (= tp!87567 b_and!40769)))

(declare-fun b!1172399 () Bool)

(declare-fun e!666390 () Bool)

(declare-fun tp_is_empty!29481 () Bool)

(assert (=> b!1172399 (= e!666390 tp_is_empty!29481)))

(declare-fun b!1172400 () Bool)

(declare-fun res!778409 () Bool)

(declare-fun e!666394 () Bool)

(assert (=> b!1172400 (=> (not res!778409) (not e!666394))))

(declare-datatypes ((array!75775 0))(
  ( (array!75776 (arr!36537 (Array (_ BitVec 32) (_ BitVec 64))) (size!37073 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75775)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75775 (_ BitVec 32)) Bool)

(assert (=> b!1172400 (= res!778409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172401 () Bool)

(declare-fun e!666386 () Bool)

(declare-fun e!666391 () Bool)

(assert (=> b!1172401 (= e!666386 e!666391)))

(declare-fun res!778423 () Bool)

(assert (=> b!1172401 (=> res!778423 e!666391)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172401 (= res!778423 (not (= (select (arr!36537 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666383 () Bool)

(assert (=> b!1172401 e!666383))

(declare-fun res!778419 () Bool)

(assert (=> b!1172401 (=> (not res!778419) (not e!666383))))

(declare-datatypes ((V!44435 0))(
  ( (V!44436 (val!14797 Int)) )
))
(declare-fun lt!528256 () V!44435)

(declare-datatypes ((ValueCell!14031 0))(
  ( (ValueCellFull!14031 (v!17435 V!44435)) (EmptyCell!14031) )
))
(declare-datatypes ((array!75777 0))(
  ( (array!75778 (arr!36538 (Array (_ BitVec 32) ValueCell!14031)) (size!37074 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75777)

(declare-datatypes ((tuple2!18906 0))(
  ( (tuple2!18907 (_1!9464 (_ BitVec 64)) (_2!9464 V!44435)) )
))
(declare-datatypes ((List!25642 0))(
  ( (Nil!25639) (Cons!25638 (h!26847 tuple2!18906) (t!37585 List!25642)) )
))
(declare-datatypes ((ListLongMap!16875 0))(
  ( (ListLongMap!16876 (toList!8453 List!25642)) )
))
(declare-fun lt!528263 () ListLongMap!16875)

(declare-fun lt!528260 () ListLongMap!16875)

(declare-fun +!3774 (ListLongMap!16875 tuple2!18906) ListLongMap!16875)

(declare-fun get!18638 (ValueCell!14031 V!44435) V!44435)

(assert (=> b!1172401 (= res!778419 (= lt!528260 (+!3774 lt!528263 (tuple2!18907 (select (arr!36537 _keys!1208) from!1455) (get!18638 (select (arr!36538 _values!996) from!1455) lt!528256)))))))

(declare-fun b!1172402 () Bool)

(declare-fun res!778421 () Bool)

(assert (=> b!1172402 (=> (not res!778421) (not e!666394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172402 (= res!778421 (validMask!0 mask!1564))))

(declare-fun b!1172403 () Bool)

(declare-fun e!666393 () Bool)

(declare-fun mapRes!46049 () Bool)

(assert (=> b!1172403 (= e!666393 (and e!666390 mapRes!46049))))

(declare-fun condMapEmpty!46049 () Bool)

(declare-fun mapDefault!46049 () ValueCell!14031)

(assert (=> b!1172403 (= condMapEmpty!46049 (= (arr!36538 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14031)) mapDefault!46049)))))

(declare-fun b!1172404 () Bool)

(declare-fun res!778422 () Bool)

(assert (=> b!1172404 (=> (not res!778422) (not e!666394))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172404 (= res!778422 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37073 _keys!1208))))))

(declare-fun b!1172405 () Bool)

(declare-fun res!778406 () Bool)

(assert (=> b!1172405 (=> (not res!778406) (not e!666394))))

(declare-datatypes ((List!25643 0))(
  ( (Nil!25640) (Cons!25639 (h!26848 (_ BitVec 64)) (t!37586 List!25643)) )
))
(declare-fun arrayNoDuplicates!0 (array!75775 (_ BitVec 32) List!25643) Bool)

(assert (=> b!1172405 (= res!778406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25640))))

(declare-fun b!1172406 () Bool)

(declare-fun e!666389 () Bool)

(assert (=> b!1172406 (= e!666389 true)))

(declare-fun lt!528261 () Bool)

(declare-fun contains!6856 (List!25643 (_ BitVec 64)) Bool)

(assert (=> b!1172406 (= lt!528261 (contains!6856 Nil!25640 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!46049 () Bool)

(assert (=> mapIsEmpty!46049 mapRes!46049))

(declare-fun b!1172407 () Bool)

(declare-fun res!778420 () Bool)

(assert (=> b!1172407 (=> res!778420 e!666389)))

(assert (=> b!1172407 (= res!778420 (contains!6856 Nil!25640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172408 () Bool)

(declare-fun e!666384 () Bool)

(declare-fun e!666382 () Bool)

(assert (=> b!1172408 (= e!666384 e!666382)))

(declare-fun res!778407 () Bool)

(assert (=> b!1172408 (=> res!778407 e!666382)))

(assert (=> b!1172408 (= res!778407 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44435)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528264 () array!75775)

(declare-fun lt!528253 () array!75777)

(declare-fun minValue!944 () V!44435)

(declare-fun getCurrentListMapNoExtraKeys!4917 (array!75775 array!75777 (_ BitVec 32) (_ BitVec 32) V!44435 V!44435 (_ BitVec 32) Int) ListLongMap!16875)

(assert (=> b!1172408 (= lt!528260 (getCurrentListMapNoExtraKeys!4917 lt!528264 lt!528253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172408 (= lt!528253 (array!75778 (store (arr!36538 _values!996) i!673 (ValueCellFull!14031 lt!528256)) (size!37074 _values!996)))))

(declare-fun dynLambda!2889 (Int (_ BitVec 64)) V!44435)

(assert (=> b!1172408 (= lt!528256 (dynLambda!2889 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528252 () ListLongMap!16875)

(assert (=> b!1172408 (= lt!528252 (getCurrentListMapNoExtraKeys!4917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172409 () Bool)

(declare-fun res!778410 () Bool)

(assert (=> b!1172409 (=> (not res!778410) (not e!666394))))

(assert (=> b!1172409 (= res!778410 (and (= (size!37074 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37073 _keys!1208) (size!37074 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172410 () Bool)

(declare-fun res!778416 () Bool)

(declare-fun e!666392 () Bool)

(assert (=> b!1172410 (=> (not res!778416) (not e!666392))))

(assert (=> b!1172410 (= res!778416 (arrayNoDuplicates!0 lt!528264 #b00000000000000000000000000000000 Nil!25640))))

(declare-fun b!1172411 () Bool)

(assert (=> b!1172411 (= e!666392 (not e!666384))))

(declare-fun res!778417 () Bool)

(assert (=> b!1172411 (=> res!778417 e!666384)))

(assert (=> b!1172411 (= res!778417 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172411 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38658 0))(
  ( (Unit!38659) )
))
(declare-fun lt!528255 () Unit!38658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75775 (_ BitVec 64) (_ BitVec 32)) Unit!38658)

(assert (=> b!1172411 (= lt!528255 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46049 () Bool)

(declare-fun tp!87566 () Bool)

(declare-fun e!666387 () Bool)

(assert (=> mapNonEmpty!46049 (= mapRes!46049 (and tp!87566 e!666387))))

(declare-fun mapRest!46049 () (Array (_ BitVec 32) ValueCell!14031))

(declare-fun mapKey!46049 () (_ BitVec 32))

(declare-fun mapValue!46049 () ValueCell!14031)

(assert (=> mapNonEmpty!46049 (= (arr!36538 _values!996) (store mapRest!46049 mapKey!46049 mapValue!46049))))

(declare-fun b!1172412 () Bool)

(assert (=> b!1172412 (= e!666391 e!666389)))

(declare-fun res!778418 () Bool)

(assert (=> b!1172412 (=> res!778418 e!666389)))

(assert (=> b!1172412 (= res!778418 (or (bvsge (size!37073 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37073 _keys!1208)) (bvsge from!1455 (size!37073 _keys!1208))))))

(assert (=> b!1172412 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25640)))

(declare-fun lt!528257 () Unit!38658)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75775 (_ BitVec 32) (_ BitVec 32)) Unit!38658)

(assert (=> b!1172412 (= lt!528257 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172412 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528254 () Unit!38658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75775 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38658)

(assert (=> b!1172412 (= lt!528254 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172413 () Bool)

(declare-fun res!778411 () Bool)

(assert (=> b!1172413 (=> res!778411 e!666389)))

(declare-fun noDuplicate!1618 (List!25643) Bool)

(assert (=> b!1172413 (= res!778411 (not (noDuplicate!1618 Nil!25640)))))

(declare-fun b!1172414 () Bool)

(assert (=> b!1172414 (= e!666382 e!666386)))

(declare-fun res!778405 () Bool)

(assert (=> b!1172414 (=> res!778405 e!666386)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172414 (= res!778405 (not (validKeyInArray!0 (select (arr!36537 _keys!1208) from!1455))))))

(declare-fun lt!528259 () ListLongMap!16875)

(assert (=> b!1172414 (= lt!528259 lt!528263)))

(declare-fun lt!528258 () ListLongMap!16875)

(declare-fun -!1520 (ListLongMap!16875 (_ BitVec 64)) ListLongMap!16875)

(assert (=> b!1172414 (= lt!528263 (-!1520 lt!528258 k0!934))))

(assert (=> b!1172414 (= lt!528259 (getCurrentListMapNoExtraKeys!4917 lt!528264 lt!528253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172414 (= lt!528258 (getCurrentListMapNoExtraKeys!4917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528262 () Unit!38658)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!747 (array!75775 array!75777 (_ BitVec 32) (_ BitVec 32) V!44435 V!44435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38658)

(assert (=> b!1172414 (= lt!528262 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172415 () Bool)

(assert (=> b!1172415 (= e!666394 e!666392)))

(declare-fun res!778412 () Bool)

(assert (=> b!1172415 (=> (not res!778412) (not e!666392))))

(assert (=> b!1172415 (= res!778412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528264 mask!1564))))

(assert (=> b!1172415 (= lt!528264 (array!75776 (store (arr!36537 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37073 _keys!1208)))))

(declare-fun b!1172416 () Bool)

(assert (=> b!1172416 (= e!666387 tp_is_empty!29481)))

(declare-fun res!778414 () Bool)

(assert (=> start!99372 (=> (not res!778414) (not e!666394))))

(assert (=> start!99372 (= res!778414 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37073 _keys!1208))))))

(assert (=> start!99372 e!666394))

(assert (=> start!99372 tp_is_empty!29481))

(declare-fun array_inv!27920 (array!75775) Bool)

(assert (=> start!99372 (array_inv!27920 _keys!1208)))

(assert (=> start!99372 true))

(assert (=> start!99372 tp!87567))

(declare-fun array_inv!27921 (array!75777) Bool)

(assert (=> start!99372 (and (array_inv!27921 _values!996) e!666393)))

(declare-fun b!1172417 () Bool)

(declare-fun e!666388 () Bool)

(assert (=> b!1172417 (= e!666388 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172418 () Bool)

(declare-fun res!778415 () Bool)

(assert (=> b!1172418 (=> (not res!778415) (not e!666394))))

(assert (=> b!1172418 (= res!778415 (= (select (arr!36537 _keys!1208) i!673) k0!934))))

(declare-fun b!1172419 () Bool)

(assert (=> b!1172419 (= e!666383 e!666388)))

(declare-fun res!778408 () Bool)

(assert (=> b!1172419 (=> res!778408 e!666388)))

(assert (=> b!1172419 (= res!778408 (not (= (select (arr!36537 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172420 () Bool)

(declare-fun res!778413 () Bool)

(assert (=> b!1172420 (=> (not res!778413) (not e!666394))))

(assert (=> b!1172420 (= res!778413 (validKeyInArray!0 k0!934))))

(assert (= (and start!99372 res!778414) b!1172402))

(assert (= (and b!1172402 res!778421) b!1172409))

(assert (= (and b!1172409 res!778410) b!1172400))

(assert (= (and b!1172400 res!778409) b!1172405))

(assert (= (and b!1172405 res!778406) b!1172404))

(assert (= (and b!1172404 res!778422) b!1172420))

(assert (= (and b!1172420 res!778413) b!1172418))

(assert (= (and b!1172418 res!778415) b!1172415))

(assert (= (and b!1172415 res!778412) b!1172410))

(assert (= (and b!1172410 res!778416) b!1172411))

(assert (= (and b!1172411 (not res!778417)) b!1172408))

(assert (= (and b!1172408 (not res!778407)) b!1172414))

(assert (= (and b!1172414 (not res!778405)) b!1172401))

(assert (= (and b!1172401 res!778419) b!1172419))

(assert (= (and b!1172419 (not res!778408)) b!1172417))

(assert (= (and b!1172401 (not res!778423)) b!1172412))

(assert (= (and b!1172412 (not res!778418)) b!1172413))

(assert (= (and b!1172413 (not res!778411)) b!1172407))

(assert (= (and b!1172407 (not res!778420)) b!1172406))

(assert (= (and b!1172403 condMapEmpty!46049) mapIsEmpty!46049))

(assert (= (and b!1172403 (not condMapEmpty!46049)) mapNonEmpty!46049))

(get-info :version)

(assert (= (and mapNonEmpty!46049 ((_ is ValueCellFull!14031) mapValue!46049)) b!1172416))

(assert (= (and b!1172403 ((_ is ValueCellFull!14031) mapDefault!46049)) b!1172399))

(assert (= start!99372 b!1172403))

(declare-fun b_lambda!20095 () Bool)

(assert (=> (not b_lambda!20095) (not b!1172408)))

(declare-fun t!37584 () Bool)

(declare-fun tb!9763 () Bool)

(assert (=> (and start!99372 (= defaultEntry!1004 defaultEntry!1004) t!37584) tb!9763))

(declare-fun result!20093 () Bool)

(assert (=> tb!9763 (= result!20093 tp_is_empty!29481)))

(assert (=> b!1172408 t!37584))

(declare-fun b_and!40771 () Bool)

(assert (= b_and!40769 (and (=> t!37584 result!20093) b_and!40771)))

(declare-fun m!1080215 () Bool)

(assert (=> b!1172402 m!1080215))

(declare-fun m!1080217 () Bool)

(assert (=> b!1172401 m!1080217))

(declare-fun m!1080219 () Bool)

(assert (=> b!1172401 m!1080219))

(assert (=> b!1172401 m!1080219))

(declare-fun m!1080221 () Bool)

(assert (=> b!1172401 m!1080221))

(declare-fun m!1080223 () Bool)

(assert (=> b!1172401 m!1080223))

(declare-fun m!1080225 () Bool)

(assert (=> b!1172411 m!1080225))

(declare-fun m!1080227 () Bool)

(assert (=> b!1172411 m!1080227))

(declare-fun m!1080229 () Bool)

(assert (=> b!1172408 m!1080229))

(declare-fun m!1080231 () Bool)

(assert (=> b!1172408 m!1080231))

(declare-fun m!1080233 () Bool)

(assert (=> b!1172408 m!1080233))

(declare-fun m!1080235 () Bool)

(assert (=> b!1172408 m!1080235))

(declare-fun m!1080237 () Bool)

(assert (=> b!1172406 m!1080237))

(declare-fun m!1080239 () Bool)

(assert (=> b!1172413 m!1080239))

(declare-fun m!1080241 () Bool)

(assert (=> b!1172412 m!1080241))

(declare-fun m!1080243 () Bool)

(assert (=> b!1172412 m!1080243))

(declare-fun m!1080245 () Bool)

(assert (=> b!1172412 m!1080245))

(declare-fun m!1080247 () Bool)

(assert (=> b!1172412 m!1080247))

(declare-fun m!1080249 () Bool)

(assert (=> b!1172414 m!1080249))

(declare-fun m!1080251 () Bool)

(assert (=> b!1172414 m!1080251))

(declare-fun m!1080253 () Bool)

(assert (=> b!1172414 m!1080253))

(assert (=> b!1172414 m!1080217))

(declare-fun m!1080255 () Bool)

(assert (=> b!1172414 m!1080255))

(declare-fun m!1080257 () Bool)

(assert (=> b!1172414 m!1080257))

(assert (=> b!1172414 m!1080217))

(declare-fun m!1080259 () Bool)

(assert (=> b!1172410 m!1080259))

(assert (=> b!1172419 m!1080217))

(declare-fun m!1080261 () Bool)

(assert (=> b!1172400 m!1080261))

(declare-fun m!1080263 () Bool)

(assert (=> b!1172415 m!1080263))

(declare-fun m!1080265 () Bool)

(assert (=> b!1172415 m!1080265))

(declare-fun m!1080267 () Bool)

(assert (=> b!1172405 m!1080267))

(declare-fun m!1080269 () Bool)

(assert (=> b!1172417 m!1080269))

(declare-fun m!1080271 () Bool)

(assert (=> b!1172420 m!1080271))

(declare-fun m!1080273 () Bool)

(assert (=> b!1172418 m!1080273))

(declare-fun m!1080275 () Bool)

(assert (=> b!1172407 m!1080275))

(declare-fun m!1080277 () Bool)

(assert (=> mapNonEmpty!46049 m!1080277))

(declare-fun m!1080279 () Bool)

(assert (=> start!99372 m!1080279))

(declare-fun m!1080281 () Bool)

(assert (=> start!99372 m!1080281))

(check-sat (not b!1172406) (not b!1172410) (not b!1172413) (not b!1172405) (not b!1172401) (not b!1172415) (not b!1172417) (not mapNonEmpty!46049) (not start!99372) (not b!1172411) b_and!40771 (not b!1172400) (not b_lambda!20095) (not b!1172408) (not b!1172402) (not b!1172420) (not b!1172412) (not b_next!24951) (not b!1172414) tp_is_empty!29481 (not b!1172407))
(check-sat b_and!40771 (not b_next!24951))
