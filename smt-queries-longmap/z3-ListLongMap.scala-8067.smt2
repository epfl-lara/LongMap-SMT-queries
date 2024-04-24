; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99504 () Bool)

(assert start!99504)

(declare-fun b_free!24847 () Bool)

(declare-fun b_next!24847 () Bool)

(assert (=> start!99504 (= b_free!24847 (not b_next!24847))))

(declare-fun tp!87254 () Bool)

(declare-fun b_and!40563 () Bool)

(assert (=> start!99504 (= tp!87254 b_and!40563)))

(declare-fun b!1170459 () Bool)

(declare-fun res!776256 () Bool)

(declare-fun e!665317 () Bool)

(assert (=> b!1170459 (=> (not res!776256) (not e!665317))))

(declare-datatypes ((array!75625 0))(
  ( (array!75626 (arr!36456 (Array (_ BitVec 32) (_ BitVec 64))) (size!36993 (_ BitVec 32))) )
))
(declare-fun lt!526936 () array!75625)

(declare-datatypes ((List!25590 0))(
  ( (Nil!25587) (Cons!25586 (h!26804 (_ BitVec 64)) (t!37421 List!25590)) )
))
(declare-fun arrayNoDuplicates!0 (array!75625 (_ BitVec 32) List!25590) Bool)

(assert (=> b!1170459 (= res!776256 (arrayNoDuplicates!0 lt!526936 #b00000000000000000000000000000000 Nil!25587))))

(declare-fun b!1170460 () Bool)

(declare-fun e!665326 () Bool)

(declare-fun e!665319 () Bool)

(declare-fun mapRes!45893 () Bool)

(assert (=> b!1170460 (= e!665326 (and e!665319 mapRes!45893))))

(declare-fun condMapEmpty!45893 () Bool)

(declare-datatypes ((V!44297 0))(
  ( (V!44298 (val!14745 Int)) )
))
(declare-datatypes ((ValueCell!13979 0))(
  ( (ValueCellFull!13979 (v!17379 V!44297)) (EmptyCell!13979) )
))
(declare-datatypes ((array!75627 0))(
  ( (array!75628 (arr!36457 (Array (_ BitVec 32) ValueCell!13979)) (size!36994 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75627)

(declare-fun mapDefault!45893 () ValueCell!13979)

(assert (=> b!1170460 (= condMapEmpty!45893 (= (arr!36457 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13979)) mapDefault!45893)))))

(declare-fun b!1170461 () Bool)

(declare-fun e!665320 () Bool)

(assert (=> b!1170461 (= e!665317 (not e!665320))))

(declare-fun res!776261 () Bool)

(assert (=> b!1170461 (=> res!776261 e!665320)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170461 (= res!776261 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!75625)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170461 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38551 0))(
  ( (Unit!38552) )
))
(declare-fun lt!526935 () Unit!38551)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75625 (_ BitVec 64) (_ BitVec 32)) Unit!38551)

(assert (=> b!1170461 (= lt!526935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170462 () Bool)

(declare-fun res!776266 () Bool)

(declare-fun e!665322 () Bool)

(assert (=> b!1170462 (=> (not res!776266) (not e!665322))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1170462 (= res!776266 (and (= (size!36994 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36993 _keys!1208) (size!36994 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170463 () Bool)

(assert (=> b!1170463 (= e!665322 e!665317)))

(declare-fun res!776257 () Bool)

(assert (=> b!1170463 (=> (not res!776257) (not e!665317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75625 (_ BitVec 32)) Bool)

(assert (=> b!1170463 (= res!776257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526936 mask!1564))))

(assert (=> b!1170463 (= lt!526936 (array!75626 (store (arr!36456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36993 _keys!1208)))))

(declare-fun mapIsEmpty!45893 () Bool)

(assert (=> mapIsEmpty!45893 mapRes!45893))

(declare-fun b!1170464 () Bool)

(declare-fun res!776265 () Bool)

(assert (=> b!1170464 (=> (not res!776265) (not e!665322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170464 (= res!776265 (validKeyInArray!0 k0!934))))

(declare-fun b!1170465 () Bool)

(declare-fun res!776270 () Bool)

(assert (=> b!1170465 (=> (not res!776270) (not e!665322))))

(assert (=> b!1170465 (= res!776270 (= (select (arr!36456 _keys!1208) i!673) k0!934))))

(declare-fun b!1170466 () Bool)

(declare-fun tp_is_empty!29377 () Bool)

(assert (=> b!1170466 (= e!665319 tp_is_empty!29377)))

(declare-fun b!1170467 () Bool)

(declare-fun e!665324 () Bool)

(assert (=> b!1170467 (= e!665320 e!665324)))

(declare-fun res!776263 () Bool)

(assert (=> b!1170467 (=> res!776263 e!665324)))

(assert (=> b!1170467 (= res!776263 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44297)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526934 () array!75627)

(declare-datatypes ((tuple2!18852 0))(
  ( (tuple2!18853 (_1!9437 (_ BitVec 64)) (_2!9437 V!44297)) )
))
(declare-datatypes ((List!25591 0))(
  ( (Nil!25588) (Cons!25587 (h!26805 tuple2!18852) (t!37422 List!25591)) )
))
(declare-datatypes ((ListLongMap!16829 0))(
  ( (ListLongMap!16830 (toList!8430 List!25591)) )
))
(declare-fun lt!526929 () ListLongMap!16829)

(declare-fun minValue!944 () V!44297)

(declare-fun getCurrentListMapNoExtraKeys!4920 (array!75625 array!75627 (_ BitVec 32) (_ BitVec 32) V!44297 V!44297 (_ BitVec 32) Int) ListLongMap!16829)

(assert (=> b!1170467 (= lt!526929 (getCurrentListMapNoExtraKeys!4920 lt!526936 lt!526934 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526927 () V!44297)

(assert (=> b!1170467 (= lt!526934 (array!75628 (store (arr!36457 _values!996) i!673 (ValueCellFull!13979 lt!526927)) (size!36994 _values!996)))))

(declare-fun dynLambda!2905 (Int (_ BitVec 64)) V!44297)

(assert (=> b!1170467 (= lt!526927 (dynLambda!2905 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526928 () ListLongMap!16829)

(assert (=> b!1170467 (= lt!526928 (getCurrentListMapNoExtraKeys!4920 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!776268 () Bool)

(assert (=> start!99504 (=> (not res!776268) (not e!665322))))

(assert (=> start!99504 (= res!776268 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36993 _keys!1208))))))

(assert (=> start!99504 e!665322))

(assert (=> start!99504 tp_is_empty!29377))

(declare-fun array_inv!27938 (array!75625) Bool)

(assert (=> start!99504 (array_inv!27938 _keys!1208)))

(assert (=> start!99504 true))

(assert (=> start!99504 tp!87254))

(declare-fun array_inv!27939 (array!75627) Bool)

(assert (=> start!99504 (and (array_inv!27939 _values!996) e!665326)))

(declare-fun b!1170468 () Bool)

(declare-fun res!776258 () Bool)

(assert (=> b!1170468 (=> (not res!776258) (not e!665322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170468 (= res!776258 (validMask!0 mask!1564))))

(declare-fun b!1170469 () Bool)

(declare-fun res!776264 () Bool)

(assert (=> b!1170469 (=> (not res!776264) (not e!665322))))

(assert (=> b!1170469 (= res!776264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170470 () Bool)

(declare-fun e!665321 () Bool)

(assert (=> b!1170470 (= e!665321 true)))

(declare-fun e!665327 () Bool)

(assert (=> b!1170470 e!665327))

(declare-fun res!776259 () Bool)

(assert (=> b!1170470 (=> (not res!776259) (not e!665327))))

(declare-fun lt!526933 () ListLongMap!16829)

(declare-fun +!3774 (ListLongMap!16829 tuple2!18852) ListLongMap!16829)

(declare-fun get!18608 (ValueCell!13979 V!44297) V!44297)

(assert (=> b!1170470 (= res!776259 (= lt!526929 (+!3774 lt!526933 (tuple2!18853 (select (arr!36456 _keys!1208) from!1455) (get!18608 (select (arr!36457 _values!996) from!1455) lt!526927)))))))

(declare-fun b!1170471 () Bool)

(assert (=> b!1170471 (= e!665324 e!665321)))

(declare-fun res!776269 () Bool)

(assert (=> b!1170471 (=> res!776269 e!665321)))

(assert (=> b!1170471 (= res!776269 (not (validKeyInArray!0 (select (arr!36456 _keys!1208) from!1455))))))

(declare-fun lt!526930 () ListLongMap!16829)

(assert (=> b!1170471 (= lt!526930 lt!526933)))

(declare-fun lt!526931 () ListLongMap!16829)

(declare-fun -!1489 (ListLongMap!16829 (_ BitVec 64)) ListLongMap!16829)

(assert (=> b!1170471 (= lt!526933 (-!1489 lt!526931 k0!934))))

(assert (=> b!1170471 (= lt!526930 (getCurrentListMapNoExtraKeys!4920 lt!526936 lt!526934 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170471 (= lt!526931 (getCurrentListMapNoExtraKeys!4920 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526932 () Unit!38551)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!714 (array!75625 array!75627 (_ BitVec 32) (_ BitVec 32) V!44297 V!44297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38551)

(assert (=> b!1170471 (= lt!526932 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45893 () Bool)

(declare-fun tp!87255 () Bool)

(declare-fun e!665318 () Bool)

(assert (=> mapNonEmpty!45893 (= mapRes!45893 (and tp!87255 e!665318))))

(declare-fun mapKey!45893 () (_ BitVec 32))

(declare-fun mapRest!45893 () (Array (_ BitVec 32) ValueCell!13979))

(declare-fun mapValue!45893 () ValueCell!13979)

(assert (=> mapNonEmpty!45893 (= (arr!36457 _values!996) (store mapRest!45893 mapKey!45893 mapValue!45893))))

(declare-fun b!1170472 () Bool)

(assert (=> b!1170472 (= e!665318 tp_is_empty!29377)))

(declare-fun e!665325 () Bool)

(declare-fun b!1170473 () Bool)

(assert (=> b!1170473 (= e!665325 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170474 () Bool)

(assert (=> b!1170474 (= e!665327 e!665325)))

(declare-fun res!776260 () Bool)

(assert (=> b!1170474 (=> res!776260 e!665325)))

(assert (=> b!1170474 (= res!776260 (not (= (select (arr!36456 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170475 () Bool)

(declare-fun res!776267 () Bool)

(assert (=> b!1170475 (=> (not res!776267) (not e!665322))))

(assert (=> b!1170475 (= res!776267 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36993 _keys!1208))))))

(declare-fun b!1170476 () Bool)

(declare-fun res!776262 () Bool)

(assert (=> b!1170476 (=> (not res!776262) (not e!665322))))

(assert (=> b!1170476 (= res!776262 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25587))))

(assert (= (and start!99504 res!776268) b!1170468))

(assert (= (and b!1170468 res!776258) b!1170462))

(assert (= (and b!1170462 res!776266) b!1170469))

(assert (= (and b!1170469 res!776264) b!1170476))

(assert (= (and b!1170476 res!776262) b!1170475))

(assert (= (and b!1170475 res!776267) b!1170464))

(assert (= (and b!1170464 res!776265) b!1170465))

(assert (= (and b!1170465 res!776270) b!1170463))

(assert (= (and b!1170463 res!776257) b!1170459))

(assert (= (and b!1170459 res!776256) b!1170461))

(assert (= (and b!1170461 (not res!776261)) b!1170467))

(assert (= (and b!1170467 (not res!776263)) b!1170471))

(assert (= (and b!1170471 (not res!776269)) b!1170470))

(assert (= (and b!1170470 res!776259) b!1170474))

(assert (= (and b!1170474 (not res!776260)) b!1170473))

(assert (= (and b!1170460 condMapEmpty!45893) mapIsEmpty!45893))

(assert (= (and b!1170460 (not condMapEmpty!45893)) mapNonEmpty!45893))

(get-info :version)

(assert (= (and mapNonEmpty!45893 ((_ is ValueCellFull!13979) mapValue!45893)) b!1170472))

(assert (= (and b!1170460 ((_ is ValueCellFull!13979) mapDefault!45893)) b!1170466))

(assert (= start!99504 b!1170460))

(declare-fun b_lambda!19985 () Bool)

(assert (=> (not b_lambda!19985) (not b!1170467)))

(declare-fun t!37420 () Bool)

(declare-fun tb!9651 () Bool)

(assert (=> (and start!99504 (= defaultEntry!1004 defaultEntry!1004) t!37420) tb!9651))

(declare-fun result!19877 () Bool)

(assert (=> tb!9651 (= result!19877 tp_is_empty!29377)))

(assert (=> b!1170467 t!37420))

(declare-fun b_and!40565 () Bool)

(assert (= b_and!40563 (and (=> t!37420 result!19877) b_and!40565)))

(declare-fun m!1078611 () Bool)

(assert (=> b!1170469 m!1078611))

(declare-fun m!1078613 () Bool)

(assert (=> b!1170470 m!1078613))

(declare-fun m!1078615 () Bool)

(assert (=> b!1170470 m!1078615))

(assert (=> b!1170470 m!1078615))

(declare-fun m!1078617 () Bool)

(assert (=> b!1170470 m!1078617))

(declare-fun m!1078619 () Bool)

(assert (=> b!1170470 m!1078619))

(declare-fun m!1078621 () Bool)

(assert (=> b!1170463 m!1078621))

(declare-fun m!1078623 () Bool)

(assert (=> b!1170463 m!1078623))

(declare-fun m!1078625 () Bool)

(assert (=> b!1170467 m!1078625))

(declare-fun m!1078627 () Bool)

(assert (=> b!1170467 m!1078627))

(declare-fun m!1078629 () Bool)

(assert (=> b!1170467 m!1078629))

(declare-fun m!1078631 () Bool)

(assert (=> b!1170467 m!1078631))

(declare-fun m!1078633 () Bool)

(assert (=> b!1170476 m!1078633))

(declare-fun m!1078635 () Bool)

(assert (=> b!1170465 m!1078635))

(declare-fun m!1078637 () Bool)

(assert (=> start!99504 m!1078637))

(declare-fun m!1078639 () Bool)

(assert (=> start!99504 m!1078639))

(declare-fun m!1078641 () Bool)

(assert (=> b!1170468 m!1078641))

(declare-fun m!1078643 () Bool)

(assert (=> b!1170473 m!1078643))

(declare-fun m!1078645 () Bool)

(assert (=> b!1170464 m!1078645))

(declare-fun m!1078647 () Bool)

(assert (=> b!1170459 m!1078647))

(declare-fun m!1078649 () Bool)

(assert (=> b!1170461 m!1078649))

(declare-fun m!1078651 () Bool)

(assert (=> b!1170461 m!1078651))

(assert (=> b!1170474 m!1078613))

(declare-fun m!1078653 () Bool)

(assert (=> mapNonEmpty!45893 m!1078653))

(declare-fun m!1078655 () Bool)

(assert (=> b!1170471 m!1078655))

(declare-fun m!1078657 () Bool)

(assert (=> b!1170471 m!1078657))

(declare-fun m!1078659 () Bool)

(assert (=> b!1170471 m!1078659))

(assert (=> b!1170471 m!1078613))

(declare-fun m!1078661 () Bool)

(assert (=> b!1170471 m!1078661))

(assert (=> b!1170471 m!1078613))

(declare-fun m!1078663 () Bool)

(assert (=> b!1170471 m!1078663))

(check-sat (not mapNonEmpty!45893) (not b!1170459) (not b!1170471) tp_is_empty!29377 (not b!1170470) b_and!40565 (not b!1170463) (not b_lambda!19985) (not b!1170469) (not start!99504) (not b!1170464) (not b!1170468) (not b!1170467) (not b!1170461) (not b_next!24847) (not b!1170476) (not b!1170473))
(check-sat b_and!40565 (not b_next!24847))
