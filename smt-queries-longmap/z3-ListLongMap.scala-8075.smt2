; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99318 () Bool)

(assert start!99318)

(declare-fun b_free!24897 () Bool)

(declare-fun b_next!24897 () Bool)

(assert (=> start!99318 (= b_free!24897 (not b_next!24897))))

(declare-fun tp!87404 () Bool)

(declare-fun b_and!40661 () Bool)

(assert (=> start!99318 (= tp!87404 b_and!40661)))

(declare-fun b!1170602 () Bool)

(declare-fun res!776907 () Bool)

(declare-fun e!665345 () Bool)

(assert (=> b!1170602 (=> (not res!776907) (not e!665345))))

(declare-datatypes ((array!75673 0))(
  ( (array!75674 (arr!36486 (Array (_ BitVec 32) (_ BitVec 64))) (size!37022 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75673)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75673 (_ BitVec 32)) Bool)

(assert (=> b!1170602 (= res!776907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170603 () Bool)

(declare-fun e!665343 () Bool)

(declare-fun tp_is_empty!29427 () Bool)

(assert (=> b!1170603 (= e!665343 tp_is_empty!29427)))

(declare-fun mapNonEmpty!45968 () Bool)

(declare-fun mapRes!45968 () Bool)

(declare-fun tp!87405 () Bool)

(declare-fun e!665342 () Bool)

(assert (=> mapNonEmpty!45968 (= mapRes!45968 (and tp!87405 e!665342))))

(declare-fun mapKey!45968 () (_ BitVec 32))

(declare-datatypes ((V!44363 0))(
  ( (V!44364 (val!14770 Int)) )
))
(declare-datatypes ((ValueCell!14004 0))(
  ( (ValueCellFull!14004 (v!17408 V!44363)) (EmptyCell!14004) )
))
(declare-fun mapRest!45968 () (Array (_ BitVec 32) ValueCell!14004))

(declare-fun mapValue!45968 () ValueCell!14004)

(declare-datatypes ((array!75675 0))(
  ( (array!75676 (arr!36487 (Array (_ BitVec 32) ValueCell!14004)) (size!37023 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75675)

(assert (=> mapNonEmpty!45968 (= (arr!36487 _values!996) (store mapRest!45968 mapKey!45968 mapValue!45968))))

(declare-fun b!1170604 () Bool)

(declare-fun e!665352 () Bool)

(declare-fun e!665349 () Bool)

(assert (=> b!1170604 (= e!665352 e!665349)))

(declare-fun res!776909 () Bool)

(assert (=> b!1170604 (=> res!776909 e!665349)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170604 (= res!776909 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44363)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!527231 () array!75675)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527234 () array!75673)

(declare-fun minValue!944 () V!44363)

(declare-datatypes ((tuple2!18864 0))(
  ( (tuple2!18865 (_1!9443 (_ BitVec 64)) (_2!9443 V!44363)) )
))
(declare-datatypes ((List!25600 0))(
  ( (Nil!25597) (Cons!25596 (h!26805 tuple2!18864) (t!37489 List!25600)) )
))
(declare-datatypes ((ListLongMap!16833 0))(
  ( (ListLongMap!16834 (toList!8432 List!25600)) )
))
(declare-fun lt!527235 () ListLongMap!16833)

(declare-fun getCurrentListMapNoExtraKeys!4896 (array!75673 array!75675 (_ BitVec 32) (_ BitVec 32) V!44363 V!44363 (_ BitVec 32) Int) ListLongMap!16833)

(assert (=> b!1170604 (= lt!527235 (getCurrentListMapNoExtraKeys!4896 lt!527234 lt!527231 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527226 () V!44363)

(assert (=> b!1170604 (= lt!527231 (array!75676 (store (arr!36487 _values!996) i!673 (ValueCellFull!14004 lt!527226)) (size!37023 _values!996)))))

(declare-fun dynLambda!2872 (Int (_ BitVec 64)) V!44363)

(assert (=> b!1170604 (= lt!527226 (dynLambda!2872 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527233 () ListLongMap!16833)

(assert (=> b!1170604 (= lt!527233 (getCurrentListMapNoExtraKeys!4896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170605 () Bool)

(declare-fun e!665353 () Bool)

(assert (=> b!1170605 (= e!665353 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170605 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!38618 0))(
  ( (Unit!38619) )
))
(declare-fun lt!527230 () Unit!38618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75673 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38618)

(assert (=> b!1170605 (= lt!527230 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170606 () Bool)

(declare-fun e!665348 () Bool)

(assert (=> b!1170606 (= e!665348 (not e!665352))))

(declare-fun res!776918 () Bool)

(assert (=> b!1170606 (=> res!776918 e!665352)))

(assert (=> b!1170606 (= res!776918 (bvsgt from!1455 i!673))))

(assert (=> b!1170606 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527229 () Unit!38618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75673 (_ BitVec 64) (_ BitVec 32)) Unit!38618)

(assert (=> b!1170606 (= lt!527229 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170607 () Bool)

(declare-fun res!776911 () Bool)

(assert (=> b!1170607 (=> (not res!776911) (not e!665345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170607 (= res!776911 (validMask!0 mask!1564))))

(declare-fun b!1170608 () Bool)

(assert (=> b!1170608 (= e!665345 e!665348)))

(declare-fun res!776912 () Bool)

(assert (=> b!1170608 (=> (not res!776912) (not e!665348))))

(assert (=> b!1170608 (= res!776912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527234 mask!1564))))

(assert (=> b!1170608 (= lt!527234 (array!75674 (store (arr!36486 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37022 _keys!1208)))))

(declare-fun b!1170609 () Bool)

(declare-fun res!776906 () Bool)

(assert (=> b!1170609 (=> (not res!776906) (not e!665345))))

(assert (=> b!1170609 (= res!776906 (and (= (size!37023 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37022 _keys!1208) (size!37023 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170610 () Bool)

(declare-fun res!776905 () Bool)

(assert (=> b!1170610 (=> (not res!776905) (not e!665345))))

(declare-datatypes ((List!25601 0))(
  ( (Nil!25598) (Cons!25597 (h!26806 (_ BitVec 64)) (t!37490 List!25601)) )
))
(declare-fun arrayNoDuplicates!0 (array!75673 (_ BitVec 32) List!25601) Bool)

(assert (=> b!1170610 (= res!776905 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25598))))

(declare-fun b!1170611 () Bool)

(declare-fun e!665344 () Bool)

(assert (=> b!1170611 (= e!665344 e!665353)))

(declare-fun res!776919 () Bool)

(assert (=> b!1170611 (=> res!776919 e!665353)))

(assert (=> b!1170611 (= res!776919 (not (= (select (arr!36486 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665351 () Bool)

(assert (=> b!1170611 e!665351))

(declare-fun res!776910 () Bool)

(assert (=> b!1170611 (=> (not res!776910) (not e!665351))))

(declare-fun lt!527225 () ListLongMap!16833)

(declare-fun +!3760 (ListLongMap!16833 tuple2!18864) ListLongMap!16833)

(declare-fun get!18606 (ValueCell!14004 V!44363) V!44363)

(assert (=> b!1170611 (= res!776910 (= lt!527235 (+!3760 lt!527225 (tuple2!18865 (select (arr!36486 _keys!1208) from!1455) (get!18606 (select (arr!36487 _values!996) from!1455) lt!527226)))))))

(declare-fun b!1170612 () Bool)

(declare-fun res!776916 () Bool)

(assert (=> b!1170612 (=> (not res!776916) (not e!665345))))

(assert (=> b!1170612 (= res!776916 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37022 _keys!1208))))))

(declare-fun b!1170613 () Bool)

(declare-fun e!665347 () Bool)

(assert (=> b!1170613 (= e!665351 e!665347)))

(declare-fun res!776908 () Bool)

(assert (=> b!1170613 (=> res!776908 e!665347)))

(assert (=> b!1170613 (= res!776908 (not (= (select (arr!36486 _keys!1208) from!1455) k0!934)))))

(declare-fun res!776913 () Bool)

(assert (=> start!99318 (=> (not res!776913) (not e!665345))))

(assert (=> start!99318 (= res!776913 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37022 _keys!1208))))))

(assert (=> start!99318 e!665345))

(assert (=> start!99318 tp_is_empty!29427))

(declare-fun array_inv!27886 (array!75673) Bool)

(assert (=> start!99318 (array_inv!27886 _keys!1208)))

(assert (=> start!99318 true))

(assert (=> start!99318 tp!87404))

(declare-fun e!665350 () Bool)

(declare-fun array_inv!27887 (array!75675) Bool)

(assert (=> start!99318 (and (array_inv!27887 _values!996) e!665350)))

(declare-fun b!1170614 () Bool)

(declare-fun res!776920 () Bool)

(assert (=> b!1170614 (=> (not res!776920) (not e!665345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170614 (= res!776920 (validKeyInArray!0 k0!934))))

(declare-fun b!1170615 () Bool)

(assert (=> b!1170615 (= e!665347 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170616 () Bool)

(declare-fun res!776917 () Bool)

(assert (=> b!1170616 (=> (not res!776917) (not e!665345))))

(assert (=> b!1170616 (= res!776917 (= (select (arr!36486 _keys!1208) i!673) k0!934))))

(declare-fun b!1170617 () Bool)

(assert (=> b!1170617 (= e!665342 tp_is_empty!29427)))

(declare-fun b!1170618 () Bool)

(assert (=> b!1170618 (= e!665349 e!665344)))

(declare-fun res!776914 () Bool)

(assert (=> b!1170618 (=> res!776914 e!665344)))

(assert (=> b!1170618 (= res!776914 (not (validKeyInArray!0 (select (arr!36486 _keys!1208) from!1455))))))

(declare-fun lt!527232 () ListLongMap!16833)

(assert (=> b!1170618 (= lt!527232 lt!527225)))

(declare-fun lt!527228 () ListLongMap!16833)

(declare-fun -!1502 (ListLongMap!16833 (_ BitVec 64)) ListLongMap!16833)

(assert (=> b!1170618 (= lt!527225 (-!1502 lt!527228 k0!934))))

(assert (=> b!1170618 (= lt!527232 (getCurrentListMapNoExtraKeys!4896 lt!527234 lt!527231 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170618 (= lt!527228 (getCurrentListMapNoExtraKeys!4896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527227 () Unit!38618)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!729 (array!75673 array!75675 (_ BitVec 32) (_ BitVec 32) V!44363 V!44363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38618)

(assert (=> b!1170618 (= lt!527227 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170619 () Bool)

(declare-fun res!776915 () Bool)

(assert (=> b!1170619 (=> (not res!776915) (not e!665348))))

(assert (=> b!1170619 (= res!776915 (arrayNoDuplicates!0 lt!527234 #b00000000000000000000000000000000 Nil!25598))))

(declare-fun mapIsEmpty!45968 () Bool)

(assert (=> mapIsEmpty!45968 mapRes!45968))

(declare-fun b!1170620 () Bool)

(assert (=> b!1170620 (= e!665350 (and e!665343 mapRes!45968))))

(declare-fun condMapEmpty!45968 () Bool)

(declare-fun mapDefault!45968 () ValueCell!14004)

(assert (=> b!1170620 (= condMapEmpty!45968 (= (arr!36487 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14004)) mapDefault!45968)))))

(assert (= (and start!99318 res!776913) b!1170607))

(assert (= (and b!1170607 res!776911) b!1170609))

(assert (= (and b!1170609 res!776906) b!1170602))

(assert (= (and b!1170602 res!776907) b!1170610))

(assert (= (and b!1170610 res!776905) b!1170612))

(assert (= (and b!1170612 res!776916) b!1170614))

(assert (= (and b!1170614 res!776920) b!1170616))

(assert (= (and b!1170616 res!776917) b!1170608))

(assert (= (and b!1170608 res!776912) b!1170619))

(assert (= (and b!1170619 res!776915) b!1170606))

(assert (= (and b!1170606 (not res!776918)) b!1170604))

(assert (= (and b!1170604 (not res!776909)) b!1170618))

(assert (= (and b!1170618 (not res!776914)) b!1170611))

(assert (= (and b!1170611 res!776910) b!1170613))

(assert (= (and b!1170613 (not res!776908)) b!1170615))

(assert (= (and b!1170611 (not res!776919)) b!1170605))

(assert (= (and b!1170620 condMapEmpty!45968) mapIsEmpty!45968))

(assert (= (and b!1170620 (not condMapEmpty!45968)) mapNonEmpty!45968))

(get-info :version)

(assert (= (and mapNonEmpty!45968 ((_ is ValueCellFull!14004) mapValue!45968)) b!1170617))

(assert (= (and b!1170620 ((_ is ValueCellFull!14004) mapDefault!45968)) b!1170603))

(assert (= start!99318 b!1170620))

(declare-fun b_lambda!20041 () Bool)

(assert (=> (not b_lambda!20041) (not b!1170604)))

(declare-fun t!37488 () Bool)

(declare-fun tb!9709 () Bool)

(assert (=> (and start!99318 (= defaultEntry!1004 defaultEntry!1004) t!37488) tb!9709))

(declare-fun result!19985 () Bool)

(assert (=> tb!9709 (= result!19985 tp_is_empty!29427)))

(assert (=> b!1170604 t!37488))

(declare-fun b_and!40663 () Bool)

(assert (= b_and!40661 (and (=> t!37488 result!19985) b_and!40663)))

(declare-fun m!1078429 () Bool)

(assert (=> b!1170616 m!1078429))

(declare-fun m!1078431 () Bool)

(assert (=> mapNonEmpty!45968 m!1078431))

(declare-fun m!1078433 () Bool)

(assert (=> b!1170613 m!1078433))

(declare-fun m!1078435 () Bool)

(assert (=> b!1170602 m!1078435))

(declare-fun m!1078437 () Bool)

(assert (=> b!1170614 m!1078437))

(declare-fun m!1078439 () Bool)

(assert (=> b!1170618 m!1078439))

(declare-fun m!1078441 () Bool)

(assert (=> b!1170618 m!1078441))

(declare-fun m!1078443 () Bool)

(assert (=> b!1170618 m!1078443))

(declare-fun m!1078445 () Bool)

(assert (=> b!1170618 m!1078445))

(assert (=> b!1170618 m!1078433))

(declare-fun m!1078447 () Bool)

(assert (=> b!1170618 m!1078447))

(assert (=> b!1170618 m!1078433))

(declare-fun m!1078449 () Bool)

(assert (=> start!99318 m!1078449))

(declare-fun m!1078451 () Bool)

(assert (=> start!99318 m!1078451))

(declare-fun m!1078453 () Bool)

(assert (=> b!1170610 m!1078453))

(assert (=> b!1170611 m!1078433))

(declare-fun m!1078455 () Bool)

(assert (=> b!1170611 m!1078455))

(assert (=> b!1170611 m!1078455))

(declare-fun m!1078457 () Bool)

(assert (=> b!1170611 m!1078457))

(declare-fun m!1078459 () Bool)

(assert (=> b!1170611 m!1078459))

(declare-fun m!1078461 () Bool)

(assert (=> b!1170608 m!1078461))

(declare-fun m!1078463 () Bool)

(assert (=> b!1170608 m!1078463))

(declare-fun m!1078465 () Bool)

(assert (=> b!1170615 m!1078465))

(declare-fun m!1078467 () Bool)

(assert (=> b!1170619 m!1078467))

(declare-fun m!1078469 () Bool)

(assert (=> b!1170604 m!1078469))

(declare-fun m!1078471 () Bool)

(assert (=> b!1170604 m!1078471))

(declare-fun m!1078473 () Bool)

(assert (=> b!1170604 m!1078473))

(declare-fun m!1078475 () Bool)

(assert (=> b!1170604 m!1078475))

(declare-fun m!1078477 () Bool)

(assert (=> b!1170605 m!1078477))

(declare-fun m!1078479 () Bool)

(assert (=> b!1170605 m!1078479))

(declare-fun m!1078481 () Bool)

(assert (=> b!1170606 m!1078481))

(declare-fun m!1078483 () Bool)

(assert (=> b!1170606 m!1078483))

(declare-fun m!1078485 () Bool)

(assert (=> b!1170607 m!1078485))

(check-sat (not b!1170604) (not b!1170607) (not b_next!24897) b_and!40663 (not b!1170605) (not b!1170615) (not start!99318) (not b!1170611) tp_is_empty!29427 (not b_lambda!20041) (not b!1170618) (not b!1170619) (not b!1170610) (not b!1170602) (not b!1170606) (not b!1170614) (not mapNonEmpty!45968) (not b!1170608))
(check-sat b_and!40663 (not b_next!24897))
