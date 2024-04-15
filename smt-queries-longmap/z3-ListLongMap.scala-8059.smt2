; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99188 () Bool)

(assert start!99188)

(declare-fun b_free!24799 () Bool)

(declare-fun b_next!24799 () Bool)

(assert (=> start!99188 (= b_free!24799 (not b_next!24799))))

(declare-fun tp!87107 () Bool)

(declare-fun b_and!40425 () Bool)

(assert (=> start!99188 (= tp!87107 b_and!40425)))

(declare-fun b!1167706 () Bool)

(declare-fun res!774697 () Bool)

(declare-fun e!663674 () Bool)

(assert (=> b!1167706 (=> (not res!774697) (not e!663674))))

(declare-datatypes ((array!75406 0))(
  ( (array!75407 (arr!36354 (Array (_ BitVec 32) (_ BitVec 64))) (size!36892 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75406)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75406 (_ BitVec 32)) Bool)

(assert (=> b!1167706 (= res!774697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167707 () Bool)

(declare-fun res!774700 () Bool)

(assert (=> b!1167707 (=> (not res!774700) (not e!663674))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167707 (= res!774700 (validKeyInArray!0 k0!934))))

(declare-fun b!1167708 () Bool)

(declare-fun e!663670 () Bool)

(assert (=> b!1167708 (= e!663670 true)))

(declare-datatypes ((V!44233 0))(
  ( (V!44234 (val!14721 Int)) )
))
(declare-fun zeroValue!944 () V!44233)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13955 0))(
  ( (ValueCellFull!13955 (v!17357 V!44233)) (EmptyCell!13955) )
))
(declare-datatypes ((array!75408 0))(
  ( (array!75409 (arr!36355 (Array (_ BitVec 32) ValueCell!13955)) (size!36893 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75408)

(declare-fun minValue!944 () V!44233)

(declare-fun lt!525594 () array!75408)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525595 () array!75406)

(declare-datatypes ((tuple2!18872 0))(
  ( (tuple2!18873 (_1!9447 (_ BitVec 64)) (_2!9447 V!44233)) )
))
(declare-datatypes ((List!25587 0))(
  ( (Nil!25584) (Cons!25583 (h!26792 tuple2!18872) (t!37369 List!25587)) )
))
(declare-datatypes ((ListLongMap!16841 0))(
  ( (ListLongMap!16842 (toList!8436 List!25587)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4912 (array!75406 array!75408 (_ BitVec 32) (_ BitVec 32) V!44233 V!44233 (_ BitVec 32) Int) ListLongMap!16841)

(declare-fun -!1445 (ListLongMap!16841 (_ BitVec 64)) ListLongMap!16841)

(assert (=> b!1167708 (= (getCurrentListMapNoExtraKeys!4912 lt!525595 lt!525594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1445 (getCurrentListMapNoExtraKeys!4912 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38361 0))(
  ( (Unit!38362) )
))
(declare-fun lt!525592 () Unit!38361)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!709 (array!75406 array!75408 (_ BitVec 32) (_ BitVec 32) V!44233 V!44233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38361)

(assert (=> b!1167708 (= lt!525592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!709 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167709 () Bool)

(declare-fun e!663672 () Bool)

(assert (=> b!1167709 (= e!663672 e!663670)))

(declare-fun res!774701 () Bool)

(assert (=> b!1167709 (=> res!774701 e!663670)))

(assert (=> b!1167709 (= res!774701 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525593 () ListLongMap!16841)

(assert (=> b!1167709 (= lt!525593 (getCurrentListMapNoExtraKeys!4912 lt!525595 lt!525594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2843 (Int (_ BitVec 64)) V!44233)

(assert (=> b!1167709 (= lt!525594 (array!75409 (store (arr!36355 _values!996) i!673 (ValueCellFull!13955 (dynLambda!2843 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36893 _values!996)))))

(declare-fun lt!525597 () ListLongMap!16841)

(assert (=> b!1167709 (= lt!525597 (getCurrentListMapNoExtraKeys!4912 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167710 () Bool)

(declare-fun res!774690 () Bool)

(assert (=> b!1167710 (=> (not res!774690) (not e!663674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167710 (= res!774690 (validMask!0 mask!1564))))

(declare-fun b!1167711 () Bool)

(declare-fun res!774692 () Bool)

(assert (=> b!1167711 (=> (not res!774692) (not e!663674))))

(assert (=> b!1167711 (= res!774692 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36892 _keys!1208))))))

(declare-fun b!1167712 () Bool)

(declare-fun e!663671 () Bool)

(declare-fun e!663673 () Bool)

(declare-fun mapRes!45818 () Bool)

(assert (=> b!1167712 (= e!663671 (and e!663673 mapRes!45818))))

(declare-fun condMapEmpty!45818 () Bool)

(declare-fun mapDefault!45818 () ValueCell!13955)

(assert (=> b!1167712 (= condMapEmpty!45818 (= (arr!36355 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13955)) mapDefault!45818)))))

(declare-fun b!1167713 () Bool)

(declare-fun res!774693 () Bool)

(assert (=> b!1167713 (=> (not res!774693) (not e!663674))))

(assert (=> b!1167713 (= res!774693 (= (select (arr!36354 _keys!1208) i!673) k0!934))))

(declare-fun b!1167714 () Bool)

(declare-fun tp_is_empty!29329 () Bool)

(assert (=> b!1167714 (= e!663673 tp_is_empty!29329)))

(declare-fun b!1167715 () Bool)

(declare-fun res!774696 () Bool)

(assert (=> b!1167715 (=> (not res!774696) (not e!663674))))

(declare-datatypes ((List!25588 0))(
  ( (Nil!25585) (Cons!25584 (h!26793 (_ BitVec 64)) (t!37370 List!25588)) )
))
(declare-fun arrayNoDuplicates!0 (array!75406 (_ BitVec 32) List!25588) Bool)

(assert (=> b!1167715 (= res!774696 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25585))))

(declare-fun b!1167716 () Bool)

(declare-fun e!663669 () Bool)

(assert (=> b!1167716 (= e!663669 tp_is_empty!29329)))

(declare-fun b!1167717 () Bool)

(declare-fun e!663668 () Bool)

(assert (=> b!1167717 (= e!663674 e!663668)))

(declare-fun res!774698 () Bool)

(assert (=> b!1167717 (=> (not res!774698) (not e!663668))))

(assert (=> b!1167717 (= res!774698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525595 mask!1564))))

(assert (=> b!1167717 (= lt!525595 (array!75407 (store (arr!36354 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36892 _keys!1208)))))

(declare-fun mapNonEmpty!45818 () Bool)

(declare-fun tp!87108 () Bool)

(assert (=> mapNonEmpty!45818 (= mapRes!45818 (and tp!87108 e!663669))))

(declare-fun mapKey!45818 () (_ BitVec 32))

(declare-fun mapValue!45818 () ValueCell!13955)

(declare-fun mapRest!45818 () (Array (_ BitVec 32) ValueCell!13955))

(assert (=> mapNonEmpty!45818 (= (arr!36355 _values!996) (store mapRest!45818 mapKey!45818 mapValue!45818))))

(declare-fun b!1167718 () Bool)

(declare-fun res!774691 () Bool)

(assert (=> b!1167718 (=> (not res!774691) (not e!663674))))

(assert (=> b!1167718 (= res!774691 (and (= (size!36893 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36892 _keys!1208) (size!36893 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167719 () Bool)

(assert (=> b!1167719 (= e!663668 (not e!663672))))

(declare-fun res!774695 () Bool)

(assert (=> b!1167719 (=> res!774695 e!663672)))

(assert (=> b!1167719 (= res!774695 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167719 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525596 () Unit!38361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75406 (_ BitVec 64) (_ BitVec 32)) Unit!38361)

(assert (=> b!1167719 (= lt!525596 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167720 () Bool)

(declare-fun res!774699 () Bool)

(assert (=> b!1167720 (=> (not res!774699) (not e!663668))))

(assert (=> b!1167720 (= res!774699 (arrayNoDuplicates!0 lt!525595 #b00000000000000000000000000000000 Nil!25585))))

(declare-fun mapIsEmpty!45818 () Bool)

(assert (=> mapIsEmpty!45818 mapRes!45818))

(declare-fun res!774694 () Bool)

(assert (=> start!99188 (=> (not res!774694) (not e!663674))))

(assert (=> start!99188 (= res!774694 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36892 _keys!1208))))))

(assert (=> start!99188 e!663674))

(assert (=> start!99188 tp_is_empty!29329))

(declare-fun array_inv!27896 (array!75406) Bool)

(assert (=> start!99188 (array_inv!27896 _keys!1208)))

(assert (=> start!99188 true))

(assert (=> start!99188 tp!87107))

(declare-fun array_inv!27897 (array!75408) Bool)

(assert (=> start!99188 (and (array_inv!27897 _values!996) e!663671)))

(assert (= (and start!99188 res!774694) b!1167710))

(assert (= (and b!1167710 res!774690) b!1167718))

(assert (= (and b!1167718 res!774691) b!1167706))

(assert (= (and b!1167706 res!774697) b!1167715))

(assert (= (and b!1167715 res!774696) b!1167711))

(assert (= (and b!1167711 res!774692) b!1167707))

(assert (= (and b!1167707 res!774700) b!1167713))

(assert (= (and b!1167713 res!774693) b!1167717))

(assert (= (and b!1167717 res!774698) b!1167720))

(assert (= (and b!1167720 res!774699) b!1167719))

(assert (= (and b!1167719 (not res!774695)) b!1167709))

(assert (= (and b!1167709 (not res!774701)) b!1167708))

(assert (= (and b!1167712 condMapEmpty!45818) mapIsEmpty!45818))

(assert (= (and b!1167712 (not condMapEmpty!45818)) mapNonEmpty!45818))

(get-info :version)

(assert (= (and mapNonEmpty!45818 ((_ is ValueCellFull!13955) mapValue!45818)) b!1167716))

(assert (= (and b!1167712 ((_ is ValueCellFull!13955) mapDefault!45818)) b!1167714))

(assert (= start!99188 b!1167712))

(declare-fun b_lambda!19887 () Bool)

(assert (=> (not b_lambda!19887) (not b!1167709)))

(declare-fun t!37368 () Bool)

(declare-fun tb!9603 () Bool)

(assert (=> (and start!99188 (= defaultEntry!1004 defaultEntry!1004) t!37368) tb!9603))

(declare-fun result!19779 () Bool)

(assert (=> tb!9603 (= result!19779 tp_is_empty!29329)))

(assert (=> b!1167709 t!37368))

(declare-fun b_and!40427 () Bool)

(assert (= b_and!40425 (and (=> t!37368 result!19779) b_and!40427)))

(declare-fun m!1075111 () Bool)

(assert (=> b!1167710 m!1075111))

(declare-fun m!1075113 () Bool)

(assert (=> b!1167719 m!1075113))

(declare-fun m!1075115 () Bool)

(assert (=> b!1167719 m!1075115))

(declare-fun m!1075117 () Bool)

(assert (=> b!1167720 m!1075117))

(declare-fun m!1075119 () Bool)

(assert (=> b!1167713 m!1075119))

(declare-fun m!1075121 () Bool)

(assert (=> b!1167708 m!1075121))

(declare-fun m!1075123 () Bool)

(assert (=> b!1167708 m!1075123))

(assert (=> b!1167708 m!1075123))

(declare-fun m!1075125 () Bool)

(assert (=> b!1167708 m!1075125))

(declare-fun m!1075127 () Bool)

(assert (=> b!1167708 m!1075127))

(declare-fun m!1075129 () Bool)

(assert (=> b!1167707 m!1075129))

(declare-fun m!1075131 () Bool)

(assert (=> b!1167706 m!1075131))

(declare-fun m!1075133 () Bool)

(assert (=> start!99188 m!1075133))

(declare-fun m!1075135 () Bool)

(assert (=> start!99188 m!1075135))

(declare-fun m!1075137 () Bool)

(assert (=> mapNonEmpty!45818 m!1075137))

(declare-fun m!1075139 () Bool)

(assert (=> b!1167715 m!1075139))

(declare-fun m!1075141 () Bool)

(assert (=> b!1167717 m!1075141))

(declare-fun m!1075143 () Bool)

(assert (=> b!1167717 m!1075143))

(declare-fun m!1075145 () Bool)

(assert (=> b!1167709 m!1075145))

(declare-fun m!1075147 () Bool)

(assert (=> b!1167709 m!1075147))

(declare-fun m!1075149 () Bool)

(assert (=> b!1167709 m!1075149))

(declare-fun m!1075151 () Bool)

(assert (=> b!1167709 m!1075151))

(check-sat (not b!1167706) (not b!1167709) (not b_next!24799) (not b!1167715) (not start!99188) (not b!1167717) (not b!1167720) (not b_lambda!19887) b_and!40427 (not b!1167710) (not mapNonEmpty!45818) (not b!1167707) (not b!1167708) (not b!1167719) tp_is_empty!29329)
(check-sat b_and!40427 (not b_next!24799))
