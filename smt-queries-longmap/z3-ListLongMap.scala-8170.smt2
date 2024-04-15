; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99880 () Bool)

(assert start!99880)

(declare-fun b_free!25465 () Bool)

(declare-fun b_next!25465 () Bool)

(assert (=> start!99880 (= b_free!25465 (not b_next!25465))))

(declare-fun tp!89108 () Bool)

(declare-fun b_and!41775 () Bool)

(assert (=> start!99880 (= tp!89108 b_and!41775)))

(declare-fun mapNonEmpty!46820 () Bool)

(declare-fun mapRes!46820 () Bool)

(declare-fun tp!89109 () Bool)

(declare-fun e!675741 () Bool)

(assert (=> mapNonEmpty!46820 (= mapRes!46820 (and tp!89109 e!675741))))

(declare-fun mapKey!46820 () (_ BitVec 32))

(declare-datatypes ((V!45121 0))(
  ( (V!45122 (val!15054 Int)) )
))
(declare-datatypes ((ValueCell!14288 0))(
  ( (ValueCellFull!14288 (v!17691 V!45121)) (EmptyCell!14288) )
))
(declare-fun mapRest!46820 () (Array (_ BitVec 32) ValueCell!14288))

(declare-fun mapValue!46820 () ValueCell!14288)

(declare-datatypes ((array!76722 0))(
  ( (array!76723 (arr!37011 (Array (_ BitVec 32) ValueCell!14288)) (size!37549 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76722)

(assert (=> mapNonEmpty!46820 (= (arr!37011 _values!996) (store mapRest!46820 mapKey!46820 mapValue!46820))))

(declare-fun b!1188477 () Bool)

(declare-fun e!675748 () Bool)

(declare-fun e!675746 () Bool)

(assert (=> b!1188477 (= e!675748 e!675746)))

(declare-fun res!790249 () Bool)

(assert (=> b!1188477 (=> res!790249 e!675746)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188477 (= res!790249 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19446 0))(
  ( (tuple2!19447 (_1!9734 (_ BitVec 64)) (_2!9734 V!45121)) )
))
(declare-datatypes ((List!26158 0))(
  ( (Nil!26155) (Cons!26154 (h!27363 tuple2!19446) (t!38606 List!26158)) )
))
(declare-datatypes ((ListLongMap!17415 0))(
  ( (ListLongMap!17416 (toList!8723 List!26158)) )
))
(declare-fun lt!540558 () ListLongMap!17415)

(declare-fun zeroValue!944 () V!45121)

(declare-datatypes ((array!76724 0))(
  ( (array!76725 (arr!37012 (Array (_ BitVec 32) (_ BitVec 64))) (size!37550 (_ BitVec 32))) )
))
(declare-fun lt!540555 () array!76724)

(declare-fun lt!540556 () array!76722)

(declare-fun minValue!944 () V!45121)

(declare-fun getCurrentListMapNoExtraKeys!5173 (array!76724 array!76722 (_ BitVec 32) (_ BitVec 32) V!45121 V!45121 (_ BitVec 32) Int) ListLongMap!17415)

(assert (=> b!1188477 (= lt!540558 (getCurrentListMapNoExtraKeys!5173 lt!540555 lt!540556 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3069 (Int (_ BitVec 64)) V!45121)

(assert (=> b!1188477 (= lt!540556 (array!76723 (store (arr!37011 _values!996) i!673 (ValueCellFull!14288 (dynLambda!3069 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37549 _values!996)))))

(declare-fun _keys!1208 () array!76724)

(declare-fun lt!540557 () ListLongMap!17415)

(assert (=> b!1188477 (= lt!540557 (getCurrentListMapNoExtraKeys!5173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188478 () Bool)

(declare-fun res!790242 () Bool)

(declare-fun e!675742 () Bool)

(assert (=> b!1188478 (=> (not res!790242) (not e!675742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76724 (_ BitVec 32)) Bool)

(assert (=> b!1188478 (= res!790242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188479 () Bool)

(declare-fun res!790245 () Bool)

(assert (=> b!1188479 (=> (not res!790245) (not e!675742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188479 (= res!790245 (validMask!0 mask!1564))))

(declare-fun b!1188480 () Bool)

(declare-fun res!790243 () Bool)

(declare-fun e!675743 () Bool)

(assert (=> b!1188480 (=> (not res!790243) (not e!675743))))

(declare-datatypes ((List!26159 0))(
  ( (Nil!26156) (Cons!26155 (h!27364 (_ BitVec 64)) (t!38607 List!26159)) )
))
(declare-fun arrayNoDuplicates!0 (array!76724 (_ BitVec 32) List!26159) Bool)

(assert (=> b!1188480 (= res!790243 (arrayNoDuplicates!0 lt!540555 #b00000000000000000000000000000000 Nil!26156))))

(declare-fun b!1188481 () Bool)

(declare-fun res!790244 () Bool)

(assert (=> b!1188481 (=> (not res!790244) (not e!675742))))

(assert (=> b!1188481 (= res!790244 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26156))))

(declare-fun res!790248 () Bool)

(assert (=> start!99880 (=> (not res!790248) (not e!675742))))

(assert (=> start!99880 (= res!790248 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37550 _keys!1208))))))

(assert (=> start!99880 e!675742))

(declare-fun tp_is_empty!29995 () Bool)

(assert (=> start!99880 tp_is_empty!29995))

(declare-fun array_inv!28346 (array!76724) Bool)

(assert (=> start!99880 (array_inv!28346 _keys!1208)))

(assert (=> start!99880 true))

(assert (=> start!99880 tp!89108))

(declare-fun e!675745 () Bool)

(declare-fun array_inv!28347 (array!76722) Bool)

(assert (=> start!99880 (and (array_inv!28347 _values!996) e!675745)))

(declare-fun b!1188482 () Bool)

(declare-fun res!790240 () Bool)

(assert (=> b!1188482 (=> (not res!790240) (not e!675742))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188482 (= res!790240 (validKeyInArray!0 k0!934))))

(declare-fun b!1188483 () Bool)

(declare-fun res!790238 () Bool)

(assert (=> b!1188483 (=> (not res!790238) (not e!675742))))

(assert (=> b!1188483 (= res!790238 (and (= (size!37549 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37550 _keys!1208) (size!37549 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188484 () Bool)

(assert (=> b!1188484 (= e!675741 tp_is_empty!29995)))

(declare-fun b!1188485 () Bool)

(declare-fun e!675744 () Bool)

(assert (=> b!1188485 (= e!675744 tp_is_empty!29995)))

(declare-fun b!1188486 () Bool)

(assert (=> b!1188486 (= e!675742 e!675743)))

(declare-fun res!790239 () Bool)

(assert (=> b!1188486 (=> (not res!790239) (not e!675743))))

(assert (=> b!1188486 (= res!790239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540555 mask!1564))))

(assert (=> b!1188486 (= lt!540555 (array!76725 (store (arr!37012 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37550 _keys!1208)))))

(declare-fun b!1188487 () Bool)

(declare-fun res!790247 () Bool)

(assert (=> b!1188487 (=> (not res!790247) (not e!675742))))

(assert (=> b!1188487 (= res!790247 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37550 _keys!1208))))))

(declare-fun mapIsEmpty!46820 () Bool)

(assert (=> mapIsEmpty!46820 mapRes!46820))

(declare-fun b!1188488 () Bool)

(assert (=> b!1188488 (= e!675745 (and e!675744 mapRes!46820))))

(declare-fun condMapEmpty!46820 () Bool)

(declare-fun mapDefault!46820 () ValueCell!14288)

(assert (=> b!1188488 (= condMapEmpty!46820 (= (arr!37011 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14288)) mapDefault!46820)))))

(declare-fun b!1188489 () Bool)

(assert (=> b!1188489 (= e!675743 (not e!675748))))

(declare-fun res!790241 () Bool)

(assert (=> b!1188489 (=> res!790241 e!675748)))

(assert (=> b!1188489 (= res!790241 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188489 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39303 0))(
  ( (Unit!39304) )
))
(declare-fun lt!540553 () Unit!39303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76724 (_ BitVec 64) (_ BitVec 32)) Unit!39303)

(assert (=> b!1188489 (= lt!540553 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188490 () Bool)

(declare-fun res!790246 () Bool)

(assert (=> b!1188490 (=> (not res!790246) (not e!675742))))

(assert (=> b!1188490 (= res!790246 (= (select (arr!37012 _keys!1208) i!673) k0!934))))

(declare-fun b!1188491 () Bool)

(assert (=> b!1188491 (= e!675746 true)))

(declare-fun -!1671 (ListLongMap!17415 (_ BitVec 64)) ListLongMap!17415)

(assert (=> b!1188491 (= (getCurrentListMapNoExtraKeys!5173 lt!540555 lt!540556 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1671 (getCurrentListMapNoExtraKeys!5173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540554 () Unit!39303)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!921 (array!76724 array!76722 (_ BitVec 32) (_ BitVec 32) V!45121 V!45121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39303)

(assert (=> b!1188491 (= lt!540554 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!921 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99880 res!790248) b!1188479))

(assert (= (and b!1188479 res!790245) b!1188483))

(assert (= (and b!1188483 res!790238) b!1188478))

(assert (= (and b!1188478 res!790242) b!1188481))

(assert (= (and b!1188481 res!790244) b!1188487))

(assert (= (and b!1188487 res!790247) b!1188482))

(assert (= (and b!1188482 res!790240) b!1188490))

(assert (= (and b!1188490 res!790246) b!1188486))

(assert (= (and b!1188486 res!790239) b!1188480))

(assert (= (and b!1188480 res!790243) b!1188489))

(assert (= (and b!1188489 (not res!790241)) b!1188477))

(assert (= (and b!1188477 (not res!790249)) b!1188491))

(assert (= (and b!1188488 condMapEmpty!46820) mapIsEmpty!46820))

(assert (= (and b!1188488 (not condMapEmpty!46820)) mapNonEmpty!46820))

(get-info :version)

(assert (= (and mapNonEmpty!46820 ((_ is ValueCellFull!14288) mapValue!46820)) b!1188484))

(assert (= (and b!1188488 ((_ is ValueCellFull!14288) mapDefault!46820)) b!1188485))

(assert (= start!99880 b!1188488))

(declare-fun b_lambda!20591 () Bool)

(assert (=> (not b_lambda!20591) (not b!1188477)))

(declare-fun t!38605 () Bool)

(declare-fun tb!10269 () Bool)

(assert (=> (and start!99880 (= defaultEntry!1004 defaultEntry!1004) t!38605) tb!10269))

(declare-fun result!21113 () Bool)

(assert (=> tb!10269 (= result!21113 tp_is_empty!29995)))

(assert (=> b!1188477 t!38605))

(declare-fun b_and!41777 () Bool)

(assert (= b_and!41775 (and (=> t!38605 result!21113) b_and!41777)))

(declare-fun m!1096757 () Bool)

(assert (=> b!1188491 m!1096757))

(declare-fun m!1096759 () Bool)

(assert (=> b!1188491 m!1096759))

(assert (=> b!1188491 m!1096759))

(declare-fun m!1096761 () Bool)

(assert (=> b!1188491 m!1096761))

(declare-fun m!1096763 () Bool)

(assert (=> b!1188491 m!1096763))

(declare-fun m!1096765 () Bool)

(assert (=> b!1188490 m!1096765))

(declare-fun m!1096767 () Bool)

(assert (=> b!1188489 m!1096767))

(declare-fun m!1096769 () Bool)

(assert (=> b!1188489 m!1096769))

(declare-fun m!1096771 () Bool)

(assert (=> b!1188479 m!1096771))

(declare-fun m!1096773 () Bool)

(assert (=> b!1188481 m!1096773))

(declare-fun m!1096775 () Bool)

(assert (=> b!1188480 m!1096775))

(declare-fun m!1096777 () Bool)

(assert (=> b!1188482 m!1096777))

(declare-fun m!1096779 () Bool)

(assert (=> b!1188477 m!1096779))

(declare-fun m!1096781 () Bool)

(assert (=> b!1188477 m!1096781))

(declare-fun m!1096783 () Bool)

(assert (=> b!1188477 m!1096783))

(declare-fun m!1096785 () Bool)

(assert (=> b!1188477 m!1096785))

(declare-fun m!1096787 () Bool)

(assert (=> b!1188478 m!1096787))

(declare-fun m!1096789 () Bool)

(assert (=> mapNonEmpty!46820 m!1096789))

(declare-fun m!1096791 () Bool)

(assert (=> b!1188486 m!1096791))

(declare-fun m!1096793 () Bool)

(assert (=> b!1188486 m!1096793))

(declare-fun m!1096795 () Bool)

(assert (=> start!99880 m!1096795))

(declare-fun m!1096797 () Bool)

(assert (=> start!99880 m!1096797))

(check-sat tp_is_empty!29995 (not b!1188489) (not b_next!25465) (not b!1188478) (not b!1188491) (not b!1188486) b_and!41777 (not b!1188477) (not b!1188482) (not b_lambda!20591) (not b!1188479) (not b!1188481) (not mapNonEmpty!46820) (not start!99880) (not b!1188480))
(check-sat b_and!41777 (not b_next!25465))
