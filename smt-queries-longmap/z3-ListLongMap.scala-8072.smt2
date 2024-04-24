; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99534 () Bool)

(assert start!99534)

(declare-fun b_free!24877 () Bool)

(declare-fun b_next!24877 () Bool)

(assert (=> start!99534 (= b_free!24877 (not b_next!24877))))

(declare-fun tp!87345 () Bool)

(declare-fun b_and!40623 () Bool)

(assert (=> start!99534 (= tp!87345 b_and!40623)))

(declare-fun b!1171301 () Bool)

(declare-fun e!665822 () Bool)

(declare-fun e!665821 () Bool)

(assert (=> b!1171301 (= e!665822 (not e!665821))))

(declare-fun res!776946 () Bool)

(assert (=> b!1171301 (=> res!776946 e!665821)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171301 (= res!776946 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75683 0))(
  ( (array!75684 (arr!36485 (Array (_ BitVec 32) (_ BitVec 64))) (size!37022 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75683)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171301 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38573 0))(
  ( (Unit!38574) )
))
(declare-fun lt!527386 () Unit!38573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75683 (_ BitVec 64) (_ BitVec 32)) Unit!38573)

(assert (=> b!1171301 (= lt!527386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!776940 () Bool)

(declare-fun e!665815 () Bool)

(assert (=> start!99534 (=> (not res!776940) (not e!665815))))

(assert (=> start!99534 (= res!776940 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37022 _keys!1208))))))

(assert (=> start!99534 e!665815))

(declare-fun tp_is_empty!29407 () Bool)

(assert (=> start!99534 tp_is_empty!29407))

(declare-fun array_inv!27958 (array!75683) Bool)

(assert (=> start!99534 (array_inv!27958 _keys!1208)))

(assert (=> start!99534 true))

(assert (=> start!99534 tp!87345))

(declare-datatypes ((V!44337 0))(
  ( (V!44338 (val!14760 Int)) )
))
(declare-datatypes ((ValueCell!13994 0))(
  ( (ValueCellFull!13994 (v!17394 V!44337)) (EmptyCell!13994) )
))
(declare-datatypes ((array!75685 0))(
  ( (array!75686 (arr!36486 (Array (_ BitVec 32) ValueCell!13994)) (size!37023 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75685)

(declare-fun e!665819 () Bool)

(declare-fun array_inv!27959 (array!75685) Bool)

(assert (=> start!99534 (and (array_inv!27959 _values!996) e!665819)))

(declare-fun mapNonEmpty!45938 () Bool)

(declare-fun mapRes!45938 () Bool)

(declare-fun tp!87344 () Bool)

(declare-fun e!665824 () Bool)

(assert (=> mapNonEmpty!45938 (= mapRes!45938 (and tp!87344 e!665824))))

(declare-fun mapKey!45938 () (_ BitVec 32))

(declare-fun mapRest!45938 () (Array (_ BitVec 32) ValueCell!13994))

(declare-fun mapValue!45938 () ValueCell!13994)

(assert (=> mapNonEmpty!45938 (= (arr!36486 _values!996) (store mapRest!45938 mapKey!45938 mapValue!45938))))

(declare-fun b!1171302 () Bool)

(declare-fun res!776941 () Bool)

(assert (=> b!1171302 (=> (not res!776941) (not e!665815))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171302 (= res!776941 (validMask!0 mask!1564))))

(declare-fun b!1171303 () Bool)

(declare-fun e!665816 () Bool)

(declare-fun e!665820 () Bool)

(assert (=> b!1171303 (= e!665816 e!665820)))

(declare-fun res!776943 () Bool)

(assert (=> b!1171303 (=> res!776943 e!665820)))

(assert (=> b!1171303 (= res!776943 (not (= (select (arr!36485 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665823 () Bool)

(assert (=> b!1171303 e!665823))

(declare-fun res!776945 () Bool)

(assert (=> b!1171303 (=> (not res!776945) (not e!665823))))

(declare-datatypes ((tuple2!18876 0))(
  ( (tuple2!18877 (_1!9449 (_ BitVec 64)) (_2!9449 V!44337)) )
))
(declare-datatypes ((List!25612 0))(
  ( (Nil!25609) (Cons!25608 (h!26826 tuple2!18876) (t!37473 List!25612)) )
))
(declare-datatypes ((ListLongMap!16853 0))(
  ( (ListLongMap!16854 (toList!8442 List!25612)) )
))
(declare-fun lt!527381 () ListLongMap!16853)

(declare-fun lt!527385 () ListLongMap!16853)

(declare-fun lt!527382 () V!44337)

(declare-fun +!3782 (ListLongMap!16853 tuple2!18876) ListLongMap!16853)

(declare-fun get!18626 (ValueCell!13994 V!44337) V!44337)

(assert (=> b!1171303 (= res!776945 (= lt!527381 (+!3782 lt!527385 (tuple2!18877 (select (arr!36485 _keys!1208) from!1455) (get!18626 (select (arr!36486 _values!996) from!1455) lt!527382)))))))

(declare-fun b!1171304 () Bool)

(declare-fun res!776947 () Bool)

(assert (=> b!1171304 (=> (not res!776947) (not e!665815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75683 (_ BitVec 32)) Bool)

(assert (=> b!1171304 (= res!776947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171305 () Bool)

(assert (=> b!1171305 (= e!665820 true)))

(assert (=> b!1171305 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527379 () Unit!38573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38573)

(assert (=> b!1171305 (= lt!527379 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171306 () Bool)

(declare-fun res!776936 () Bool)

(assert (=> b!1171306 (=> (not res!776936) (not e!665815))))

(assert (=> b!1171306 (= res!776936 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37022 _keys!1208))))))

(declare-fun b!1171307 () Bool)

(declare-fun res!776935 () Bool)

(assert (=> b!1171307 (=> (not res!776935) (not e!665815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171307 (= res!776935 (validKeyInArray!0 k0!934))))

(declare-fun b!1171308 () Bool)

(declare-fun res!776939 () Bool)

(assert (=> b!1171308 (=> (not res!776939) (not e!665815))))

(declare-datatypes ((List!25613 0))(
  ( (Nil!25610) (Cons!25609 (h!26827 (_ BitVec 64)) (t!37474 List!25613)) )
))
(declare-fun arrayNoDuplicates!0 (array!75683 (_ BitVec 32) List!25613) Bool)

(assert (=> b!1171308 (= res!776939 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25610))))

(declare-fun b!1171309 () Bool)

(declare-fun res!776934 () Bool)

(assert (=> b!1171309 (=> (not res!776934) (not e!665815))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1171309 (= res!776934 (and (= (size!37023 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37022 _keys!1208) (size!37023 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171310 () Bool)

(assert (=> b!1171310 (= e!665815 e!665822)))

(declare-fun res!776933 () Bool)

(assert (=> b!1171310 (=> (not res!776933) (not e!665822))))

(declare-fun lt!527383 () array!75683)

(assert (=> b!1171310 (= res!776933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527383 mask!1564))))

(assert (=> b!1171310 (= lt!527383 (array!75684 (store (arr!36485 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37022 _keys!1208)))))

(declare-fun b!1171311 () Bool)

(assert (=> b!1171311 (= e!665824 tp_is_empty!29407)))

(declare-fun b!1171312 () Bool)

(declare-fun e!665814 () Bool)

(assert (=> b!1171312 (= e!665821 e!665814)))

(declare-fun res!776942 () Bool)

(assert (=> b!1171312 (=> res!776942 e!665814)))

(assert (=> b!1171312 (= res!776942 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44337)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527388 () array!75685)

(declare-fun minValue!944 () V!44337)

(declare-fun getCurrentListMapNoExtraKeys!4930 (array!75683 array!75685 (_ BitVec 32) (_ BitVec 32) V!44337 V!44337 (_ BitVec 32) Int) ListLongMap!16853)

(assert (=> b!1171312 (= lt!527381 (getCurrentListMapNoExtraKeys!4930 lt!527383 lt!527388 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171312 (= lt!527388 (array!75686 (store (arr!36486 _values!996) i!673 (ValueCellFull!13994 lt!527382)) (size!37023 _values!996)))))

(declare-fun dynLambda!2912 (Int (_ BitVec 64)) V!44337)

(assert (=> b!1171312 (= lt!527382 (dynLambda!2912 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527380 () ListLongMap!16853)

(assert (=> b!1171312 (= lt!527380 (getCurrentListMapNoExtraKeys!4930 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171313 () Bool)

(declare-fun e!665825 () Bool)

(assert (=> b!1171313 (= e!665825 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171314 () Bool)

(assert (=> b!1171314 (= e!665814 e!665816)))

(declare-fun res!776937 () Bool)

(assert (=> b!1171314 (=> res!776937 e!665816)))

(assert (=> b!1171314 (= res!776937 (not (validKeyInArray!0 (select (arr!36485 _keys!1208) from!1455))))))

(declare-fun lt!527389 () ListLongMap!16853)

(assert (=> b!1171314 (= lt!527389 lt!527385)))

(declare-fun lt!527387 () ListLongMap!16853)

(declare-fun -!1499 (ListLongMap!16853 (_ BitVec 64)) ListLongMap!16853)

(assert (=> b!1171314 (= lt!527385 (-!1499 lt!527387 k0!934))))

(assert (=> b!1171314 (= lt!527389 (getCurrentListMapNoExtraKeys!4930 lt!527383 lt!527388 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171314 (= lt!527387 (getCurrentListMapNoExtraKeys!4930 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527384 () Unit!38573)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!724 (array!75683 array!75685 (_ BitVec 32) (_ BitVec 32) V!44337 V!44337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38573)

(assert (=> b!1171314 (= lt!527384 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171315 () Bool)

(declare-fun res!776944 () Bool)

(assert (=> b!1171315 (=> (not res!776944) (not e!665815))))

(assert (=> b!1171315 (= res!776944 (= (select (arr!36485 _keys!1208) i!673) k0!934))))

(declare-fun b!1171316 () Bool)

(declare-fun e!665818 () Bool)

(assert (=> b!1171316 (= e!665818 tp_is_empty!29407)))

(declare-fun b!1171317 () Bool)

(assert (=> b!1171317 (= e!665823 e!665825)))

(declare-fun res!776948 () Bool)

(assert (=> b!1171317 (=> res!776948 e!665825)))

(assert (=> b!1171317 (= res!776948 (not (= (select (arr!36485 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171318 () Bool)

(assert (=> b!1171318 (= e!665819 (and e!665818 mapRes!45938))))

(declare-fun condMapEmpty!45938 () Bool)

(declare-fun mapDefault!45938 () ValueCell!13994)

(assert (=> b!1171318 (= condMapEmpty!45938 (= (arr!36486 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13994)) mapDefault!45938)))))

(declare-fun mapIsEmpty!45938 () Bool)

(assert (=> mapIsEmpty!45938 mapRes!45938))

(declare-fun b!1171319 () Bool)

(declare-fun res!776938 () Bool)

(assert (=> b!1171319 (=> (not res!776938) (not e!665822))))

(assert (=> b!1171319 (= res!776938 (arrayNoDuplicates!0 lt!527383 #b00000000000000000000000000000000 Nil!25610))))

(assert (= (and start!99534 res!776940) b!1171302))

(assert (= (and b!1171302 res!776941) b!1171309))

(assert (= (and b!1171309 res!776934) b!1171304))

(assert (= (and b!1171304 res!776947) b!1171308))

(assert (= (and b!1171308 res!776939) b!1171306))

(assert (= (and b!1171306 res!776936) b!1171307))

(assert (= (and b!1171307 res!776935) b!1171315))

(assert (= (and b!1171315 res!776944) b!1171310))

(assert (= (and b!1171310 res!776933) b!1171319))

(assert (= (and b!1171319 res!776938) b!1171301))

(assert (= (and b!1171301 (not res!776946)) b!1171312))

(assert (= (and b!1171312 (not res!776942)) b!1171314))

(assert (= (and b!1171314 (not res!776937)) b!1171303))

(assert (= (and b!1171303 res!776945) b!1171317))

(assert (= (and b!1171317 (not res!776948)) b!1171313))

(assert (= (and b!1171303 (not res!776943)) b!1171305))

(assert (= (and b!1171318 condMapEmpty!45938) mapIsEmpty!45938))

(assert (= (and b!1171318 (not condMapEmpty!45938)) mapNonEmpty!45938))

(get-info :version)

(assert (= (and mapNonEmpty!45938 ((_ is ValueCellFull!13994) mapValue!45938)) b!1171311))

(assert (= (and b!1171318 ((_ is ValueCellFull!13994) mapDefault!45938)) b!1171316))

(assert (= start!99534 b!1171318))

(declare-fun b_lambda!20015 () Bool)

(assert (=> (not b_lambda!20015) (not b!1171312)))

(declare-fun t!37472 () Bool)

(declare-fun tb!9681 () Bool)

(assert (=> (and start!99534 (= defaultEntry!1004 defaultEntry!1004) t!37472) tb!9681))

(declare-fun result!19937 () Bool)

(assert (=> tb!9681 (= result!19937 tp_is_empty!29407)))

(assert (=> b!1171312 t!37472))

(declare-fun b_and!40625 () Bool)

(assert (= b_and!40623 (and (=> t!37472 result!19937) b_and!40625)))

(declare-fun m!1079421 () Bool)

(assert (=> b!1171317 m!1079421))

(declare-fun m!1079423 () Bool)

(assert (=> b!1171305 m!1079423))

(declare-fun m!1079425 () Bool)

(assert (=> b!1171305 m!1079425))

(assert (=> b!1171303 m!1079421))

(declare-fun m!1079427 () Bool)

(assert (=> b!1171303 m!1079427))

(assert (=> b!1171303 m!1079427))

(declare-fun m!1079429 () Bool)

(assert (=> b!1171303 m!1079429))

(declare-fun m!1079431 () Bool)

(assert (=> b!1171303 m!1079431))

(declare-fun m!1079433 () Bool)

(assert (=> b!1171319 m!1079433))

(declare-fun m!1079435 () Bool)

(assert (=> b!1171304 m!1079435))

(declare-fun m!1079437 () Bool)

(assert (=> b!1171315 m!1079437))

(declare-fun m!1079439 () Bool)

(assert (=> b!1171302 m!1079439))

(declare-fun m!1079441 () Bool)

(assert (=> start!99534 m!1079441))

(declare-fun m!1079443 () Bool)

(assert (=> start!99534 m!1079443))

(declare-fun m!1079445 () Bool)

(assert (=> b!1171313 m!1079445))

(declare-fun m!1079447 () Bool)

(assert (=> b!1171310 m!1079447))

(declare-fun m!1079449 () Bool)

(assert (=> b!1171310 m!1079449))

(declare-fun m!1079451 () Bool)

(assert (=> b!1171301 m!1079451))

(declare-fun m!1079453 () Bool)

(assert (=> b!1171301 m!1079453))

(declare-fun m!1079455 () Bool)

(assert (=> b!1171314 m!1079455))

(declare-fun m!1079457 () Bool)

(assert (=> b!1171314 m!1079457))

(declare-fun m!1079459 () Bool)

(assert (=> b!1171314 m!1079459))

(declare-fun m!1079461 () Bool)

(assert (=> b!1171314 m!1079461))

(assert (=> b!1171314 m!1079421))

(declare-fun m!1079463 () Bool)

(assert (=> b!1171314 m!1079463))

(assert (=> b!1171314 m!1079421))

(declare-fun m!1079465 () Bool)

(assert (=> b!1171307 m!1079465))

(declare-fun m!1079467 () Bool)

(assert (=> mapNonEmpty!45938 m!1079467))

(declare-fun m!1079469 () Bool)

(assert (=> b!1171308 m!1079469))

(declare-fun m!1079471 () Bool)

(assert (=> b!1171312 m!1079471))

(declare-fun m!1079473 () Bool)

(assert (=> b!1171312 m!1079473))

(declare-fun m!1079475 () Bool)

(assert (=> b!1171312 m!1079475))

(declare-fun m!1079477 () Bool)

(assert (=> b!1171312 m!1079477))

(check-sat (not b_lambda!20015) (not b!1171302) (not b!1171304) (not b!1171314) (not b!1171308) (not b!1171303) (not b!1171301) (not b!1171310) (not start!99534) (not b!1171319) (not b!1171313) (not b!1171312) (not b_next!24877) (not b!1171305) (not mapNonEmpty!45938) tp_is_empty!29407 (not b!1171307) b_and!40625)
(check-sat b_and!40625 (not b_next!24877))
