; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101768 () Bool)

(assert start!101768)

(declare-fun b_free!26457 () Bool)

(declare-fun b_next!26457 () Bool)

(assert (=> start!101768 (= b_free!26457 (not b_next!26457))))

(declare-fun tp!92417 () Bool)

(declare-fun b_and!44175 () Bool)

(assert (=> start!101768 (= tp!92417 b_and!44175)))

(declare-fun b!1225604 () Bool)

(declare-fun e!696100 () Bool)

(declare-fun e!696099 () Bool)

(declare-fun mapRes!48640 () Bool)

(assert (=> b!1225604 (= e!696100 (and e!696099 mapRes!48640))))

(declare-fun condMapEmpty!48640 () Bool)

(declare-datatypes ((V!46675 0))(
  ( (V!46676 (val!15637 Int)) )
))
(declare-datatypes ((ValueCell!14871 0))(
  ( (ValueCellFull!14871 (v!18299 V!46675)) (EmptyCell!14871) )
))
(declare-datatypes ((array!79101 0))(
  ( (array!79102 (arr!38177 (Array (_ BitVec 32) ValueCell!14871)) (size!38713 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79101)

(declare-fun mapDefault!48640 () ValueCell!14871)

(assert (=> b!1225604 (= condMapEmpty!48640 (= (arr!38177 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14871)) mapDefault!48640)))))

(declare-fun b!1225605 () Bool)

(declare-fun e!696098 () Bool)

(declare-fun e!696093 () Bool)

(assert (=> b!1225605 (= e!696098 (not e!696093))))

(declare-fun res!814478 () Bool)

(assert (=> b!1225605 (=> res!814478 e!696093)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225605 (= res!814478 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79103 0))(
  ( (array!79104 (arr!38178 (Array (_ BitVec 32) (_ BitVec 64))) (size!38714 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79103)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225605 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40622 0))(
  ( (Unit!40623) )
))
(declare-fun lt!558508 () Unit!40622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79103 (_ BitVec 64) (_ BitVec 32)) Unit!40622)

(assert (=> b!1225605 (= lt!558508 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225606 () Bool)

(declare-fun res!814482 () Bool)

(assert (=> b!1225606 (=> (not res!814482) (not e!696098))))

(declare-fun lt!558511 () array!79103)

(declare-datatypes ((List!26957 0))(
  ( (Nil!26954) (Cons!26953 (h!28162 (_ BitVec 64)) (t!40394 List!26957)) )
))
(declare-fun arrayNoDuplicates!0 (array!79103 (_ BitVec 32) List!26957) Bool)

(assert (=> b!1225606 (= res!814482 (arrayNoDuplicates!0 lt!558511 #b00000000000000000000000000000000 Nil!26954))))

(declare-fun b!1225607 () Bool)

(declare-fun e!696094 () Bool)

(declare-fun tp_is_empty!31161 () Bool)

(assert (=> b!1225607 (= e!696094 tp_is_empty!31161)))

(declare-fun b!1225608 () Bool)

(declare-fun res!814484 () Bool)

(declare-fun e!696096 () Bool)

(assert (=> b!1225608 (=> (not res!814484) (not e!696096))))

(assert (=> b!1225608 (= res!814484 (= (select (arr!38178 _keys!1208) i!673) k0!934))))

(declare-fun b!1225610 () Bool)

(declare-fun res!814479 () Bool)

(assert (=> b!1225610 (=> (not res!814479) (not e!696096))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79103 (_ BitVec 32)) Bool)

(assert (=> b!1225610 (= res!814479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48640 () Bool)

(declare-fun tp!92416 () Bool)

(assert (=> mapNonEmpty!48640 (= mapRes!48640 (and tp!92416 e!696094))))

(declare-fun mapRest!48640 () (Array (_ BitVec 32) ValueCell!14871))

(declare-fun mapValue!48640 () ValueCell!14871)

(declare-fun mapKey!48640 () (_ BitVec 32))

(assert (=> mapNonEmpty!48640 (= (arr!38177 _values!996) (store mapRest!48640 mapKey!48640 mapValue!48640))))

(declare-fun b!1225611 () Bool)

(declare-fun e!696095 () Bool)

(assert (=> b!1225611 (= e!696093 e!696095)))

(declare-fun res!814481 () Bool)

(assert (=> b!1225611 (=> res!814481 e!696095)))

(assert (=> b!1225611 (= res!814481 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46675)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!20156 0))(
  ( (tuple2!20157 (_1!10089 (_ BitVec 64)) (_2!10089 V!46675)) )
))
(declare-datatypes ((List!26958 0))(
  ( (Nil!26955) (Cons!26954 (h!28163 tuple2!20156) (t!40395 List!26958)) )
))
(declare-datatypes ((ListLongMap!18125 0))(
  ( (ListLongMap!18126 (toList!9078 List!26958)) )
))
(declare-fun lt!558510 () ListLongMap!18125)

(declare-fun lt!558507 () array!79101)

(declare-fun minValue!944 () V!46675)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5497 (array!79103 array!79101 (_ BitVec 32) (_ BitVec 32) V!46675 V!46675 (_ BitVec 32) Int) ListLongMap!18125)

(assert (=> b!1225611 (= lt!558510 (getCurrentListMapNoExtraKeys!5497 lt!558511 lt!558507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3368 (Int (_ BitVec 64)) V!46675)

(assert (=> b!1225611 (= lt!558507 (array!79102 (store (arr!38177 _values!996) i!673 (ValueCellFull!14871 (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38713 _values!996)))))

(declare-fun lt!558509 () ListLongMap!18125)

(assert (=> b!1225611 (= lt!558509 (getCurrentListMapNoExtraKeys!5497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225612 () Bool)

(declare-fun res!814480 () Bool)

(assert (=> b!1225612 (=> (not res!814480) (not e!696096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225612 (= res!814480 (validKeyInArray!0 k0!934))))

(declare-fun b!1225613 () Bool)

(declare-fun res!814489 () Bool)

(assert (=> b!1225613 (=> (not res!814489) (not e!696096))))

(assert (=> b!1225613 (= res!814489 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38714 _keys!1208))))))

(declare-fun b!1225609 () Bool)

(assert (=> b!1225609 (= e!696099 tp_is_empty!31161)))

(declare-fun res!814483 () Bool)

(assert (=> start!101768 (=> (not res!814483) (not e!696096))))

(assert (=> start!101768 (= res!814483 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38714 _keys!1208))))))

(assert (=> start!101768 e!696096))

(assert (=> start!101768 tp_is_empty!31161))

(declare-fun array_inv!29034 (array!79103) Bool)

(assert (=> start!101768 (array_inv!29034 _keys!1208)))

(assert (=> start!101768 true))

(assert (=> start!101768 tp!92417))

(declare-fun array_inv!29035 (array!79101) Bool)

(assert (=> start!101768 (and (array_inv!29035 _values!996) e!696100)))

(declare-fun b!1225614 () Bool)

(assert (=> b!1225614 (= e!696096 e!696098)))

(declare-fun res!814488 () Bool)

(assert (=> b!1225614 (=> (not res!814488) (not e!696098))))

(assert (=> b!1225614 (= res!814488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558511 mask!1564))))

(assert (=> b!1225614 (= lt!558511 (array!79104 (store (arr!38178 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38714 _keys!1208)))))

(declare-fun mapIsEmpty!48640 () Bool)

(assert (=> mapIsEmpty!48640 mapRes!48640))

(declare-fun b!1225615 () Bool)

(assert (=> b!1225615 (= e!696095 true)))

(declare-fun -!1977 (ListLongMap!18125 (_ BitVec 64)) ListLongMap!18125)

(assert (=> b!1225615 (= (getCurrentListMapNoExtraKeys!5497 lt!558511 lt!558507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1977 (getCurrentListMapNoExtraKeys!5497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558512 () Unit!40622)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1183 (array!79103 array!79101 (_ BitVec 32) (_ BitVec 32) V!46675 V!46675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40622)

(assert (=> b!1225615 (= lt!558512 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1183 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225616 () Bool)

(declare-fun res!814487 () Bool)

(assert (=> b!1225616 (=> (not res!814487) (not e!696096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225616 (= res!814487 (validMask!0 mask!1564))))

(declare-fun b!1225617 () Bool)

(declare-fun res!814486 () Bool)

(assert (=> b!1225617 (=> (not res!814486) (not e!696096))))

(assert (=> b!1225617 (= res!814486 (and (= (size!38713 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38714 _keys!1208) (size!38713 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225618 () Bool)

(declare-fun res!814485 () Bool)

(assert (=> b!1225618 (=> (not res!814485) (not e!696096))))

(assert (=> b!1225618 (= res!814485 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26954))))

(assert (= (and start!101768 res!814483) b!1225616))

(assert (= (and b!1225616 res!814487) b!1225617))

(assert (= (and b!1225617 res!814486) b!1225610))

(assert (= (and b!1225610 res!814479) b!1225618))

(assert (= (and b!1225618 res!814485) b!1225613))

(assert (= (and b!1225613 res!814489) b!1225612))

(assert (= (and b!1225612 res!814480) b!1225608))

(assert (= (and b!1225608 res!814484) b!1225614))

(assert (= (and b!1225614 res!814488) b!1225606))

(assert (= (and b!1225606 res!814482) b!1225605))

(assert (= (and b!1225605 (not res!814478)) b!1225611))

(assert (= (and b!1225611 (not res!814481)) b!1225615))

(assert (= (and b!1225604 condMapEmpty!48640) mapIsEmpty!48640))

(assert (= (and b!1225604 (not condMapEmpty!48640)) mapNonEmpty!48640))

(get-info :version)

(assert (= (and mapNonEmpty!48640 ((_ is ValueCellFull!14871) mapValue!48640)) b!1225607))

(assert (= (and b!1225604 ((_ is ValueCellFull!14871) mapDefault!48640)) b!1225609))

(assert (= start!101768 b!1225604))

(declare-fun b_lambda!22437 () Bool)

(assert (=> (not b_lambda!22437) (not b!1225611)))

(declare-fun t!40393 () Bool)

(declare-fun tb!11257 () Bool)

(assert (=> (and start!101768 (= defaultEntry!1004 defaultEntry!1004) t!40393) tb!11257))

(declare-fun result!23127 () Bool)

(assert (=> tb!11257 (= result!23127 tp_is_empty!31161)))

(assert (=> b!1225611 t!40393))

(declare-fun b_and!44177 () Bool)

(assert (= b_and!44175 (and (=> t!40393 result!23127) b_and!44177)))

(declare-fun m!1130735 () Bool)

(assert (=> mapNonEmpty!48640 m!1130735))

(declare-fun m!1130737 () Bool)

(assert (=> b!1225608 m!1130737))

(declare-fun m!1130739 () Bool)

(assert (=> start!101768 m!1130739))

(declare-fun m!1130741 () Bool)

(assert (=> start!101768 m!1130741))

(declare-fun m!1130743 () Bool)

(assert (=> b!1225615 m!1130743))

(declare-fun m!1130745 () Bool)

(assert (=> b!1225615 m!1130745))

(assert (=> b!1225615 m!1130745))

(declare-fun m!1130747 () Bool)

(assert (=> b!1225615 m!1130747))

(declare-fun m!1130749 () Bool)

(assert (=> b!1225615 m!1130749))

(declare-fun m!1130751 () Bool)

(assert (=> b!1225614 m!1130751))

(declare-fun m!1130753 () Bool)

(assert (=> b!1225614 m!1130753))

(declare-fun m!1130755 () Bool)

(assert (=> b!1225606 m!1130755))

(declare-fun m!1130757 () Bool)

(assert (=> b!1225611 m!1130757))

(declare-fun m!1130759 () Bool)

(assert (=> b!1225611 m!1130759))

(declare-fun m!1130761 () Bool)

(assert (=> b!1225611 m!1130761))

(declare-fun m!1130763 () Bool)

(assert (=> b!1225611 m!1130763))

(declare-fun m!1130765 () Bool)

(assert (=> b!1225610 m!1130765))

(declare-fun m!1130767 () Bool)

(assert (=> b!1225618 m!1130767))

(declare-fun m!1130769 () Bool)

(assert (=> b!1225612 m!1130769))

(declare-fun m!1130771 () Bool)

(assert (=> b!1225616 m!1130771))

(declare-fun m!1130773 () Bool)

(assert (=> b!1225605 m!1130773))

(declare-fun m!1130775 () Bool)

(assert (=> b!1225605 m!1130775))

(check-sat (not b_lambda!22437) (not b_next!26457) (not b!1225615) b_and!44177 (not b!1225612) tp_is_empty!31161 (not start!101768) (not b!1225614) (not mapNonEmpty!48640) (not b!1225611) (not b!1225605) (not b!1225616) (not b!1225610) (not b!1225618) (not b!1225606))
(check-sat b_and!44177 (not b_next!26457))
