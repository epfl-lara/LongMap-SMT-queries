; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99056 () Bool)

(assert start!99056)

(declare-fun b_free!24667 () Bool)

(declare-fun b_next!24667 () Bool)

(assert (=> start!99056 (= b_free!24667 (not b_next!24667))))

(declare-fun tp!86712 () Bool)

(declare-fun b_and!40161 () Bool)

(assert (=> start!99056 (= tp!86712 b_and!40161)))

(declare-fun b!1164674 () Bool)

(declare-fun res!772391 () Bool)

(declare-fun e!662154 () Bool)

(assert (=> b!1164674 (=> (not res!772391) (not e!662154))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75150 0))(
  ( (array!75151 (arr!36226 (Array (_ BitVec 32) (_ BitVec 64))) (size!36764 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75150)

(assert (=> b!1164674 (= res!772391 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36764 _keys!1208))))))

(declare-fun b!1164675 () Bool)

(declare-fun e!662157 () Bool)

(declare-fun tp_is_empty!29197 () Bool)

(assert (=> b!1164675 (= e!662157 tp_is_empty!29197)))

(declare-fun res!772384 () Bool)

(assert (=> start!99056 (=> (not res!772384) (not e!662154))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99056 (= res!772384 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36764 _keys!1208))))))

(assert (=> start!99056 e!662154))

(assert (=> start!99056 tp_is_empty!29197))

(declare-fun array_inv!27814 (array!75150) Bool)

(assert (=> start!99056 (array_inv!27814 _keys!1208)))

(assert (=> start!99056 true))

(assert (=> start!99056 tp!86712))

(declare-datatypes ((V!44057 0))(
  ( (V!44058 (val!14655 Int)) )
))
(declare-datatypes ((ValueCell!13889 0))(
  ( (ValueCellFull!13889 (v!17291 V!44057)) (EmptyCell!13889) )
))
(declare-datatypes ((array!75152 0))(
  ( (array!75153 (arr!36227 (Array (_ BitVec 32) ValueCell!13889)) (size!36765 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75152)

(declare-fun e!662155 () Bool)

(declare-fun array_inv!27815 (array!75152) Bool)

(assert (=> start!99056 (and (array_inv!27815 _values!996) e!662155)))

(declare-fun b!1164676 () Bool)

(declare-fun res!772390 () Bool)

(assert (=> b!1164676 (=> (not res!772390) (not e!662154))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75150 (_ BitVec 32)) Bool)

(assert (=> b!1164676 (= res!772390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164677 () Bool)

(declare-fun e!662160 () Bool)

(declare-fun e!662156 () Bool)

(assert (=> b!1164677 (= e!662160 (not e!662156))))

(declare-fun res!772393 () Bool)

(assert (=> b!1164677 (=> res!772393 e!662156)))

(assert (=> b!1164677 (= res!772393 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164677 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38269 0))(
  ( (Unit!38270) )
))
(declare-fun lt!524545 () Unit!38269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75150 (_ BitVec 64) (_ BitVec 32)) Unit!38269)

(assert (=> b!1164677 (= lt!524545 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164678 () Bool)

(declare-fun res!772392 () Bool)

(assert (=> b!1164678 (=> (not res!772392) (not e!662154))))

(declare-datatypes ((List!25490 0))(
  ( (Nil!25487) (Cons!25486 (h!26695 (_ BitVec 64)) (t!37140 List!25490)) )
))
(declare-fun arrayNoDuplicates!0 (array!75150 (_ BitVec 32) List!25490) Bool)

(assert (=> b!1164678 (= res!772392 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25487))))

(declare-fun b!1164679 () Bool)

(assert (=> b!1164679 (= e!662154 e!662160)))

(declare-fun res!772389 () Bool)

(assert (=> b!1164679 (=> (not res!772389) (not e!662160))))

(declare-fun lt!524547 () array!75150)

(assert (=> b!1164679 (= res!772389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524547 mask!1564))))

(assert (=> b!1164679 (= lt!524547 (array!75151 (store (arr!36226 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36764 _keys!1208)))))

(declare-fun b!1164680 () Bool)

(declare-fun res!772388 () Bool)

(assert (=> b!1164680 (=> (not res!772388) (not e!662154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164680 (= res!772388 (validKeyInArray!0 k0!934))))

(declare-fun b!1164681 () Bool)

(declare-fun res!772394 () Bool)

(assert (=> b!1164681 (=> (not res!772394) (not e!662160))))

(assert (=> b!1164681 (= res!772394 (arrayNoDuplicates!0 lt!524547 #b00000000000000000000000000000000 Nil!25487))))

(declare-fun b!1164682 () Bool)

(declare-fun mapRes!45620 () Bool)

(assert (=> b!1164682 (= e!662155 (and e!662157 mapRes!45620))))

(declare-fun condMapEmpty!45620 () Bool)

(declare-fun mapDefault!45620 () ValueCell!13889)

(assert (=> b!1164682 (= condMapEmpty!45620 (= (arr!36227 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13889)) mapDefault!45620)))))

(declare-fun b!1164683 () Bool)

(declare-fun e!662158 () Bool)

(assert (=> b!1164683 (= e!662158 tp_is_empty!29197)))

(declare-fun mapIsEmpty!45620 () Bool)

(assert (=> mapIsEmpty!45620 mapRes!45620))

(declare-fun b!1164684 () Bool)

(assert (=> b!1164684 (= e!662156 true)))

(declare-fun zeroValue!944 () V!44057)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18772 0))(
  ( (tuple2!18773 (_1!9397 (_ BitVec 64)) (_2!9397 V!44057)) )
))
(declare-datatypes ((List!25491 0))(
  ( (Nil!25488) (Cons!25487 (h!26696 tuple2!18772) (t!37141 List!25491)) )
))
(declare-datatypes ((ListLongMap!16741 0))(
  ( (ListLongMap!16742 (toList!8386 List!25491)) )
))
(declare-fun lt!524546 () ListLongMap!16741)

(declare-fun minValue!944 () V!44057)

(declare-fun getCurrentListMapNoExtraKeys!4862 (array!75150 array!75152 (_ BitVec 32) (_ BitVec 32) V!44057 V!44057 (_ BitVec 32) Int) ListLongMap!16741)

(declare-fun dynLambda!2795 (Int (_ BitVec 64)) V!44057)

(assert (=> b!1164684 (= lt!524546 (getCurrentListMapNoExtraKeys!4862 lt!524547 (array!75153 (store (arr!36227 _values!996) i!673 (ValueCellFull!13889 (dynLambda!2795 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36765 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524544 () ListLongMap!16741)

(assert (=> b!1164684 (= lt!524544 (getCurrentListMapNoExtraKeys!4862 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164685 () Bool)

(declare-fun res!772386 () Bool)

(assert (=> b!1164685 (=> (not res!772386) (not e!662154))))

(assert (=> b!1164685 (= res!772386 (= (select (arr!36226 _keys!1208) i!673) k0!934))))

(declare-fun b!1164686 () Bool)

(declare-fun res!772385 () Bool)

(assert (=> b!1164686 (=> (not res!772385) (not e!662154))))

(assert (=> b!1164686 (= res!772385 (and (= (size!36765 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36764 _keys!1208) (size!36765 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45620 () Bool)

(declare-fun tp!86711 () Bool)

(assert (=> mapNonEmpty!45620 (= mapRes!45620 (and tp!86711 e!662158))))

(declare-fun mapValue!45620 () ValueCell!13889)

(declare-fun mapKey!45620 () (_ BitVec 32))

(declare-fun mapRest!45620 () (Array (_ BitVec 32) ValueCell!13889))

(assert (=> mapNonEmpty!45620 (= (arr!36227 _values!996) (store mapRest!45620 mapKey!45620 mapValue!45620))))

(declare-fun b!1164687 () Bool)

(declare-fun res!772387 () Bool)

(assert (=> b!1164687 (=> (not res!772387) (not e!662154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164687 (= res!772387 (validMask!0 mask!1564))))

(assert (= (and start!99056 res!772384) b!1164687))

(assert (= (and b!1164687 res!772387) b!1164686))

(assert (= (and b!1164686 res!772385) b!1164676))

(assert (= (and b!1164676 res!772390) b!1164678))

(assert (= (and b!1164678 res!772392) b!1164674))

(assert (= (and b!1164674 res!772391) b!1164680))

(assert (= (and b!1164680 res!772388) b!1164685))

(assert (= (and b!1164685 res!772386) b!1164679))

(assert (= (and b!1164679 res!772389) b!1164681))

(assert (= (and b!1164681 res!772394) b!1164677))

(assert (= (and b!1164677 (not res!772393)) b!1164684))

(assert (= (and b!1164682 condMapEmpty!45620) mapIsEmpty!45620))

(assert (= (and b!1164682 (not condMapEmpty!45620)) mapNonEmpty!45620))

(get-info :version)

(assert (= (and mapNonEmpty!45620 ((_ is ValueCellFull!13889) mapValue!45620)) b!1164683))

(assert (= (and b!1164682 ((_ is ValueCellFull!13889) mapDefault!45620)) b!1164675))

(assert (= start!99056 b!1164682))

(declare-fun b_lambda!19755 () Bool)

(assert (=> (not b_lambda!19755) (not b!1164684)))

(declare-fun t!37139 () Bool)

(declare-fun tb!9471 () Bool)

(assert (=> (and start!99056 (= defaultEntry!1004 defaultEntry!1004) t!37139) tb!9471))

(declare-fun result!19515 () Bool)

(assert (=> tb!9471 (= result!19515 tp_is_empty!29197)))

(assert (=> b!1164684 t!37139))

(declare-fun b_and!40163 () Bool)

(assert (= b_and!40161 (and (=> t!37139 result!19515) b_and!40163)))

(declare-fun m!1072531 () Bool)

(assert (=> b!1164681 m!1072531))

(declare-fun m!1072533 () Bool)

(assert (=> b!1164678 m!1072533))

(declare-fun m!1072535 () Bool)

(assert (=> start!99056 m!1072535))

(declare-fun m!1072537 () Bool)

(assert (=> start!99056 m!1072537))

(declare-fun m!1072539 () Bool)

(assert (=> b!1164676 m!1072539))

(declare-fun m!1072541 () Bool)

(assert (=> mapNonEmpty!45620 m!1072541))

(declare-fun m!1072543 () Bool)

(assert (=> b!1164685 m!1072543))

(declare-fun m!1072545 () Bool)

(assert (=> b!1164680 m!1072545))

(declare-fun m!1072547 () Bool)

(assert (=> b!1164679 m!1072547))

(declare-fun m!1072549 () Bool)

(assert (=> b!1164679 m!1072549))

(declare-fun m!1072551 () Bool)

(assert (=> b!1164684 m!1072551))

(declare-fun m!1072553 () Bool)

(assert (=> b!1164684 m!1072553))

(declare-fun m!1072555 () Bool)

(assert (=> b!1164684 m!1072555))

(declare-fun m!1072557 () Bool)

(assert (=> b!1164684 m!1072557))

(declare-fun m!1072559 () Bool)

(assert (=> b!1164677 m!1072559))

(declare-fun m!1072561 () Bool)

(assert (=> b!1164677 m!1072561))

(declare-fun m!1072563 () Bool)

(assert (=> b!1164687 m!1072563))

(check-sat (not b!1164680) (not b_lambda!19755) (not b_next!24667) (not b!1164687) (not b!1164679) (not start!99056) (not b!1164684) (not b!1164681) (not b!1164678) (not b!1164676) (not b!1164677) (not mapNonEmpty!45620) tp_is_empty!29197 b_and!40163)
(check-sat b_and!40163 (not b_next!24667))
