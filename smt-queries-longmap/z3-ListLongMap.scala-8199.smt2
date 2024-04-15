; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100054 () Bool)

(assert start!100054)

(declare-fun b_free!25639 () Bool)

(declare-fun b_next!25639 () Bool)

(assert (=> start!100054 (= b_free!25639 (not b_next!25639))))

(declare-fun tp!89630 () Bool)

(declare-fun b_and!42123 () Bool)

(assert (=> start!100054 (= tp!89630 b_and!42123)))

(declare-fun mapNonEmpty!47081 () Bool)

(declare-fun mapRes!47081 () Bool)

(declare-fun tp!89631 () Bool)

(declare-fun e!677836 () Bool)

(assert (=> mapNonEmpty!47081 (= mapRes!47081 (and tp!89631 e!677836))))

(declare-fun mapKey!47081 () (_ BitVec 32))

(declare-datatypes ((V!45353 0))(
  ( (V!45354 (val!15141 Int)) )
))
(declare-datatypes ((ValueCell!14375 0))(
  ( (ValueCellFull!14375 (v!17778 V!45353)) (EmptyCell!14375) )
))
(declare-fun mapValue!47081 () ValueCell!14375)

(declare-datatypes ((array!77056 0))(
  ( (array!77057 (arr!37178 (Array (_ BitVec 32) ValueCell!14375)) (size!37716 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77056)

(declare-fun mapRest!47081 () (Array (_ BitVec 32) ValueCell!14375))

(assert (=> mapNonEmpty!47081 (= (arr!37178 _values!996) (store mapRest!47081 mapKey!47081 mapValue!47081))))

(declare-fun b!1192566 () Bool)

(declare-fun res!793373 () Bool)

(declare-fun e!677829 () Bool)

(assert (=> b!1192566 (=> (not res!793373) (not e!677829))))

(declare-datatypes ((array!77058 0))(
  ( (array!77059 (arr!37179 (Array (_ BitVec 32) (_ BitVec 64))) (size!37717 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77058)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192566 (= res!793373 (= (select (arr!37179 _keys!1208) i!673) k0!934))))

(declare-fun b!1192567 () Bool)

(declare-fun res!793377 () Bool)

(assert (=> b!1192567 (=> (not res!793377) (not e!677829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192567 (= res!793377 (validKeyInArray!0 k0!934))))

(declare-fun b!1192568 () Bool)

(declare-fun res!793370 () Bool)

(assert (=> b!1192568 (=> (not res!793370) (not e!677829))))

(declare-datatypes ((List!26290 0))(
  ( (Nil!26287) (Cons!26286 (h!27495 (_ BitVec 64)) (t!38912 List!26290)) )
))
(declare-fun arrayNoDuplicates!0 (array!77058 (_ BitVec 32) List!26290) Bool)

(assert (=> b!1192568 (= res!793370 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26287))))

(declare-fun b!1192569 () Bool)

(declare-fun e!677830 () Bool)

(assert (=> b!1192569 (= e!677829 e!677830)))

(declare-fun res!793376 () Bool)

(assert (=> b!1192569 (=> (not res!793376) (not e!677830))))

(declare-fun lt!542123 () array!77058)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77058 (_ BitVec 32)) Bool)

(assert (=> b!1192569 (= res!793376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542123 mask!1564))))

(assert (=> b!1192569 (= lt!542123 (array!77059 (store (arr!37179 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37717 _keys!1208)))))

(declare-fun b!1192570 () Bool)

(declare-fun res!793379 () Bool)

(assert (=> b!1192570 (=> (not res!793379) (not e!677829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192570 (= res!793379 (validMask!0 mask!1564))))

(declare-fun b!1192571 () Bool)

(declare-fun e!677833 () Bool)

(declare-fun e!677831 () Bool)

(assert (=> b!1192571 (= e!677833 e!677831)))

(declare-fun res!793371 () Bool)

(assert (=> b!1192571 (=> res!793371 e!677831)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192571 (= res!793371 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45353)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19576 0))(
  ( (tuple2!19577 (_1!9799 (_ BitVec 64)) (_2!9799 V!45353)) )
))
(declare-datatypes ((List!26291 0))(
  ( (Nil!26288) (Cons!26287 (h!27496 tuple2!19576) (t!38913 List!26291)) )
))
(declare-datatypes ((ListLongMap!17545 0))(
  ( (ListLongMap!17546 (toList!8788 List!26291)) )
))
(declare-fun lt!542122 () ListLongMap!17545)

(declare-fun minValue!944 () V!45353)

(declare-fun lt!542119 () array!77056)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5238 (array!77058 array!77056 (_ BitVec 32) (_ BitVec 32) V!45353 V!45353 (_ BitVec 32) Int) ListLongMap!17545)

(assert (=> b!1192571 (= lt!542122 (getCurrentListMapNoExtraKeys!5238 lt!542123 lt!542119 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3123 (Int (_ BitVec 64)) V!45353)

(assert (=> b!1192571 (= lt!542119 (array!77057 (store (arr!37178 _values!996) i!673 (ValueCellFull!14375 (dynLambda!3123 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37716 _values!996)))))

(declare-fun lt!542120 () ListLongMap!17545)

(assert (=> b!1192571 (= lt!542120 (getCurrentListMapNoExtraKeys!5238 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47081 () Bool)

(assert (=> mapIsEmpty!47081 mapRes!47081))

(declare-fun b!1192572 () Bool)

(declare-fun res!793372 () Bool)

(assert (=> b!1192572 (=> (not res!793372) (not e!677829))))

(assert (=> b!1192572 (= res!793372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192573 () Bool)

(declare-fun e!677834 () Bool)

(declare-fun e!677835 () Bool)

(assert (=> b!1192573 (= e!677834 (and e!677835 mapRes!47081))))

(declare-fun condMapEmpty!47081 () Bool)

(declare-fun mapDefault!47081 () ValueCell!14375)

(assert (=> b!1192573 (= condMapEmpty!47081 (= (arr!37178 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14375)) mapDefault!47081)))))

(declare-fun b!1192574 () Bool)

(assert (=> b!1192574 (= e!677830 (not e!677833))))

(declare-fun res!793380 () Bool)

(assert (=> b!1192574 (=> res!793380 e!677833)))

(assert (=> b!1192574 (= res!793380 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192574 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39445 0))(
  ( (Unit!39446) )
))
(declare-fun lt!542124 () Unit!39445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77058 (_ BitVec 64) (_ BitVec 32)) Unit!39445)

(assert (=> b!1192574 (= lt!542124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192575 () Bool)

(declare-fun res!793378 () Bool)

(assert (=> b!1192575 (=> (not res!793378) (not e!677829))))

(assert (=> b!1192575 (= res!793378 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37717 _keys!1208))))))

(declare-fun b!1192577 () Bool)

(declare-fun tp_is_empty!30169 () Bool)

(assert (=> b!1192577 (= e!677836 tp_is_empty!30169)))

(declare-fun b!1192578 () Bool)

(declare-fun res!793374 () Bool)

(assert (=> b!1192578 (=> (not res!793374) (not e!677830))))

(assert (=> b!1192578 (= res!793374 (arrayNoDuplicates!0 lt!542123 #b00000000000000000000000000000000 Nil!26287))))

(declare-fun res!793375 () Bool)

(assert (=> start!100054 (=> (not res!793375) (not e!677829))))

(assert (=> start!100054 (= res!793375 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37717 _keys!1208))))))

(assert (=> start!100054 e!677829))

(assert (=> start!100054 tp_is_empty!30169))

(declare-fun array_inv!28472 (array!77058) Bool)

(assert (=> start!100054 (array_inv!28472 _keys!1208)))

(assert (=> start!100054 true))

(assert (=> start!100054 tp!89630))

(declare-fun array_inv!28473 (array!77056) Bool)

(assert (=> start!100054 (and (array_inv!28473 _values!996) e!677834)))

(declare-fun b!1192576 () Bool)

(assert (=> b!1192576 (= e!677835 tp_is_empty!30169)))

(declare-fun b!1192579 () Bool)

(declare-fun res!793381 () Bool)

(assert (=> b!1192579 (=> (not res!793381) (not e!677829))))

(assert (=> b!1192579 (= res!793381 (and (= (size!37716 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37717 _keys!1208) (size!37716 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192580 () Bool)

(assert (=> b!1192580 (= e!677831 true)))

(declare-fun -!1730 (ListLongMap!17545 (_ BitVec 64)) ListLongMap!17545)

(assert (=> b!1192580 (= (getCurrentListMapNoExtraKeys!5238 lt!542123 lt!542119 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1730 (getCurrentListMapNoExtraKeys!5238 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542121 () Unit!39445)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!980 (array!77058 array!77056 (_ BitVec 32) (_ BitVec 32) V!45353 V!45353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39445)

(assert (=> b!1192580 (= lt!542121 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!980 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100054 res!793375) b!1192570))

(assert (= (and b!1192570 res!793379) b!1192579))

(assert (= (and b!1192579 res!793381) b!1192572))

(assert (= (and b!1192572 res!793372) b!1192568))

(assert (= (and b!1192568 res!793370) b!1192575))

(assert (= (and b!1192575 res!793378) b!1192567))

(assert (= (and b!1192567 res!793377) b!1192566))

(assert (= (and b!1192566 res!793373) b!1192569))

(assert (= (and b!1192569 res!793376) b!1192578))

(assert (= (and b!1192578 res!793374) b!1192574))

(assert (= (and b!1192574 (not res!793380)) b!1192571))

(assert (= (and b!1192571 (not res!793371)) b!1192580))

(assert (= (and b!1192573 condMapEmpty!47081) mapIsEmpty!47081))

(assert (= (and b!1192573 (not condMapEmpty!47081)) mapNonEmpty!47081))

(get-info :version)

(assert (= (and mapNonEmpty!47081 ((_ is ValueCellFull!14375) mapValue!47081)) b!1192577))

(assert (= (and b!1192573 ((_ is ValueCellFull!14375) mapDefault!47081)) b!1192576))

(assert (= start!100054 b!1192573))

(declare-fun b_lambda!20765 () Bool)

(assert (=> (not b_lambda!20765) (not b!1192571)))

(declare-fun t!38911 () Bool)

(declare-fun tb!10443 () Bool)

(assert (=> (and start!100054 (= defaultEntry!1004 defaultEntry!1004) t!38911) tb!10443))

(declare-fun result!21461 () Bool)

(assert (=> tb!10443 (= result!21461 tp_is_empty!30169)))

(assert (=> b!1192571 t!38911))

(declare-fun b_and!42125 () Bool)

(assert (= b_and!42123 (and (=> t!38911 result!21461) b_and!42125)))

(declare-fun m!1100411 () Bool)

(assert (=> b!1192580 m!1100411))

(declare-fun m!1100413 () Bool)

(assert (=> b!1192580 m!1100413))

(assert (=> b!1192580 m!1100413))

(declare-fun m!1100415 () Bool)

(assert (=> b!1192580 m!1100415))

(declare-fun m!1100417 () Bool)

(assert (=> b!1192580 m!1100417))

(declare-fun m!1100419 () Bool)

(assert (=> start!100054 m!1100419))

(declare-fun m!1100421 () Bool)

(assert (=> start!100054 m!1100421))

(declare-fun m!1100423 () Bool)

(assert (=> b!1192578 m!1100423))

(declare-fun m!1100425 () Bool)

(assert (=> b!1192574 m!1100425))

(declare-fun m!1100427 () Bool)

(assert (=> b!1192574 m!1100427))

(declare-fun m!1100429 () Bool)

(assert (=> b!1192569 m!1100429))

(declare-fun m!1100431 () Bool)

(assert (=> b!1192569 m!1100431))

(declare-fun m!1100433 () Bool)

(assert (=> b!1192568 m!1100433))

(declare-fun m!1100435 () Bool)

(assert (=> b!1192571 m!1100435))

(declare-fun m!1100437 () Bool)

(assert (=> b!1192571 m!1100437))

(declare-fun m!1100439 () Bool)

(assert (=> b!1192571 m!1100439))

(declare-fun m!1100441 () Bool)

(assert (=> b!1192571 m!1100441))

(declare-fun m!1100443 () Bool)

(assert (=> b!1192566 m!1100443))

(declare-fun m!1100445 () Bool)

(assert (=> b!1192567 m!1100445))

(declare-fun m!1100447 () Bool)

(assert (=> b!1192572 m!1100447))

(declare-fun m!1100449 () Bool)

(assert (=> b!1192570 m!1100449))

(declare-fun m!1100451 () Bool)

(assert (=> mapNonEmpty!47081 m!1100451))

(check-sat tp_is_empty!30169 (not b!1192570) (not b!1192574) (not b!1192568) (not b!1192572) b_and!42125 (not b!1192580) (not b!1192569) (not b!1192578) (not mapNonEmpty!47081) (not b!1192567) (not b_next!25639) (not b_lambda!20765) (not b!1192571) (not start!100054))
(check-sat b_and!42125 (not b_next!25639))
