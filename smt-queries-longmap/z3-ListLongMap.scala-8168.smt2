; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99876 () Bool)

(assert start!99876)

(declare-fun b_free!25455 () Bool)

(declare-fun b_next!25455 () Bool)

(assert (=> start!99876 (= b_free!25455 (not b_next!25455))))

(declare-fun tp!89079 () Bool)

(declare-fun b_and!41777 () Bool)

(assert (=> start!99876 (= tp!89079 b_and!41777)))

(declare-fun b!1188366 () Bool)

(declare-fun e!675699 () Bool)

(declare-fun e!675703 () Bool)

(assert (=> b!1188366 (= e!675699 e!675703)))

(declare-fun res!790126 () Bool)

(assert (=> b!1188366 (=> (not res!790126) (not e!675703))))

(declare-datatypes ((array!76765 0))(
  ( (array!76766 (arr!37032 (Array (_ BitVec 32) (_ BitVec 64))) (size!37568 (_ BitVec 32))) )
))
(declare-fun lt!540659 () array!76765)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76765 (_ BitVec 32)) Bool)

(assert (=> b!1188366 (= res!790126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540659 mask!1564))))

(declare-fun _keys!1208 () array!76765)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188366 (= lt!540659 (array!76766 (store (arr!37032 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37568 _keys!1208)))))

(declare-fun b!1188367 () Bool)

(declare-fun res!790131 () Bool)

(assert (=> b!1188367 (=> (not res!790131) (not e!675703))))

(declare-datatypes ((List!26067 0))(
  ( (Nil!26064) (Cons!26063 (h!27272 (_ BitVec 64)) (t!38514 List!26067)) )
))
(declare-fun arrayNoDuplicates!0 (array!76765 (_ BitVec 32) List!26067) Bool)

(assert (=> b!1188367 (= res!790131 (arrayNoDuplicates!0 lt!540659 #b00000000000000000000000000000000 Nil!26064))))

(declare-fun b!1188368 () Bool)

(declare-fun e!675706 () Bool)

(declare-fun tp_is_empty!29985 () Bool)

(assert (=> b!1188368 (= e!675706 tp_is_empty!29985)))

(declare-fun b!1188369 () Bool)

(declare-fun e!675700 () Bool)

(declare-fun e!675705 () Bool)

(assert (=> b!1188369 (= e!675700 e!675705)))

(declare-fun res!790130 () Bool)

(assert (=> b!1188369 (=> res!790130 e!675705)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188369 (= res!790130 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45107 0))(
  ( (V!45108 (val!15049 Int)) )
))
(declare-fun zeroValue!944 () V!45107)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19326 0))(
  ( (tuple2!19327 (_1!9674 (_ BitVec 64)) (_2!9674 V!45107)) )
))
(declare-datatypes ((List!26068 0))(
  ( (Nil!26065) (Cons!26064 (h!27273 tuple2!19326) (t!38515 List!26068)) )
))
(declare-datatypes ((ListLongMap!17295 0))(
  ( (ListLongMap!17296 (toList!8663 List!26068)) )
))
(declare-fun lt!540658 () ListLongMap!17295)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14283 0))(
  ( (ValueCellFull!14283 (v!17687 V!45107)) (EmptyCell!14283) )
))
(declare-datatypes ((array!76767 0))(
  ( (array!76768 (arr!37033 (Array (_ BitVec 32) ValueCell!14283)) (size!37569 (_ BitVec 32))) )
))
(declare-fun lt!540657 () array!76767)

(declare-fun minValue!944 () V!45107)

(declare-fun getCurrentListMapNoExtraKeys!5104 (array!76765 array!76767 (_ BitVec 32) (_ BitVec 32) V!45107 V!45107 (_ BitVec 32) Int) ListLongMap!17295)

(assert (=> b!1188369 (= lt!540658 (getCurrentListMapNoExtraKeys!5104 lt!540659 lt!540657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76767)

(declare-fun dynLambda!3048 (Int (_ BitVec 64)) V!45107)

(assert (=> b!1188369 (= lt!540657 (array!76768 (store (arr!37033 _values!996) i!673 (ValueCellFull!14283 (dynLambda!3048 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37569 _values!996)))))

(declare-fun lt!540660 () ListLongMap!17295)

(assert (=> b!1188369 (= lt!540660 (getCurrentListMapNoExtraKeys!5104 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188370 () Bool)

(declare-fun res!790134 () Bool)

(assert (=> b!1188370 (=> (not res!790134) (not e!675699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188370 (= res!790134 (validMask!0 mask!1564))))

(declare-fun b!1188371 () Bool)

(assert (=> b!1188371 (= e!675703 (not e!675700))))

(declare-fun res!790127 () Bool)

(assert (=> b!1188371 (=> res!790127 e!675700)))

(assert (=> b!1188371 (= res!790127 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188371 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39424 0))(
  ( (Unit!39425) )
))
(declare-fun lt!540655 () Unit!39424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76765 (_ BitVec 64) (_ BitVec 32)) Unit!39424)

(assert (=> b!1188371 (= lt!540655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188372 () Bool)

(declare-fun res!790132 () Bool)

(assert (=> b!1188372 (=> (not res!790132) (not e!675699))))

(assert (=> b!1188372 (= res!790132 (and (= (size!37569 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37568 _keys!1208) (size!37569 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46805 () Bool)

(declare-fun mapRes!46805 () Bool)

(assert (=> mapIsEmpty!46805 mapRes!46805))

(declare-fun b!1188373 () Bool)

(declare-fun res!790125 () Bool)

(assert (=> b!1188373 (=> (not res!790125) (not e!675699))))

(assert (=> b!1188373 (= res!790125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188374 () Bool)

(declare-fun e!675702 () Bool)

(declare-fun e!675701 () Bool)

(assert (=> b!1188374 (= e!675702 (and e!675701 mapRes!46805))))

(declare-fun condMapEmpty!46805 () Bool)

(declare-fun mapDefault!46805 () ValueCell!14283)

(assert (=> b!1188374 (= condMapEmpty!46805 (= (arr!37033 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14283)) mapDefault!46805)))))

(declare-fun b!1188375 () Bool)

(declare-fun res!790135 () Bool)

(assert (=> b!1188375 (=> (not res!790135) (not e!675699))))

(assert (=> b!1188375 (= res!790135 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26064))))

(declare-fun b!1188376 () Bool)

(assert (=> b!1188376 (= e!675701 tp_is_empty!29985)))

(declare-fun b!1188377 () Bool)

(assert (=> b!1188377 (= e!675705 true)))

(declare-fun -!1693 (ListLongMap!17295 (_ BitVec 64)) ListLongMap!17295)

(assert (=> b!1188377 (= (getCurrentListMapNoExtraKeys!5104 lt!540659 lt!540657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1693 (getCurrentListMapNoExtraKeys!5104 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540656 () Unit!39424)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!902 (array!76765 array!76767 (_ BitVec 32) (_ BitVec 32) V!45107 V!45107 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39424)

(assert (=> b!1188377 (= lt!540656 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!902 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188378 () Bool)

(declare-fun res!790133 () Bool)

(assert (=> b!1188378 (=> (not res!790133) (not e!675699))))

(assert (=> b!1188378 (= res!790133 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37568 _keys!1208))))))

(declare-fun res!790124 () Bool)

(assert (=> start!99876 (=> (not res!790124) (not e!675699))))

(assert (=> start!99876 (= res!790124 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37568 _keys!1208))))))

(assert (=> start!99876 e!675699))

(assert (=> start!99876 tp_is_empty!29985))

(declare-fun array_inv!28254 (array!76765) Bool)

(assert (=> start!99876 (array_inv!28254 _keys!1208)))

(assert (=> start!99876 true))

(assert (=> start!99876 tp!89079))

(declare-fun array_inv!28255 (array!76767) Bool)

(assert (=> start!99876 (and (array_inv!28255 _values!996) e!675702)))

(declare-fun mapNonEmpty!46805 () Bool)

(declare-fun tp!89078 () Bool)

(assert (=> mapNonEmpty!46805 (= mapRes!46805 (and tp!89078 e!675706))))

(declare-fun mapValue!46805 () ValueCell!14283)

(declare-fun mapKey!46805 () (_ BitVec 32))

(declare-fun mapRest!46805 () (Array (_ BitVec 32) ValueCell!14283))

(assert (=> mapNonEmpty!46805 (= (arr!37033 _values!996) (store mapRest!46805 mapKey!46805 mapValue!46805))))

(declare-fun b!1188379 () Bool)

(declare-fun res!790129 () Bool)

(assert (=> b!1188379 (=> (not res!790129) (not e!675699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188379 (= res!790129 (validKeyInArray!0 k0!934))))

(declare-fun b!1188380 () Bool)

(declare-fun res!790128 () Bool)

(assert (=> b!1188380 (=> (not res!790128) (not e!675699))))

(assert (=> b!1188380 (= res!790128 (= (select (arr!37032 _keys!1208) i!673) k0!934))))

(assert (= (and start!99876 res!790124) b!1188370))

(assert (= (and b!1188370 res!790134) b!1188372))

(assert (= (and b!1188372 res!790132) b!1188373))

(assert (= (and b!1188373 res!790125) b!1188375))

(assert (= (and b!1188375 res!790135) b!1188378))

(assert (= (and b!1188378 res!790133) b!1188379))

(assert (= (and b!1188379 res!790129) b!1188380))

(assert (= (and b!1188380 res!790128) b!1188366))

(assert (= (and b!1188366 res!790126) b!1188367))

(assert (= (and b!1188367 res!790131) b!1188371))

(assert (= (and b!1188371 (not res!790127)) b!1188369))

(assert (= (and b!1188369 (not res!790130)) b!1188377))

(assert (= (and b!1188374 condMapEmpty!46805) mapIsEmpty!46805))

(assert (= (and b!1188374 (not condMapEmpty!46805)) mapNonEmpty!46805))

(get-info :version)

(assert (= (and mapNonEmpty!46805 ((_ is ValueCellFull!14283) mapValue!46805)) b!1188368))

(assert (= (and b!1188374 ((_ is ValueCellFull!14283) mapDefault!46805)) b!1188376))

(assert (= start!99876 b!1188374))

(declare-fun b_lambda!20599 () Bool)

(assert (=> (not b_lambda!20599) (not b!1188369)))

(declare-fun t!38513 () Bool)

(declare-fun tb!10267 () Bool)

(assert (=> (and start!99876 (= defaultEntry!1004 defaultEntry!1004) t!38513) tb!10267))

(declare-fun result!21101 () Bool)

(assert (=> tb!10267 (= result!21101 tp_is_empty!29985)))

(assert (=> b!1188369 t!38513))

(declare-fun b_and!41779 () Bool)

(assert (= b_and!41777 (and (=> t!38513 result!21101) b_and!41779)))

(declare-fun m!1097157 () Bool)

(assert (=> start!99876 m!1097157))

(declare-fun m!1097159 () Bool)

(assert (=> start!99876 m!1097159))

(declare-fun m!1097161 () Bool)

(assert (=> b!1188375 m!1097161))

(declare-fun m!1097163 () Bool)

(assert (=> b!1188367 m!1097163))

(declare-fun m!1097165 () Bool)

(assert (=> b!1188371 m!1097165))

(declare-fun m!1097167 () Bool)

(assert (=> b!1188371 m!1097167))

(declare-fun m!1097169 () Bool)

(assert (=> mapNonEmpty!46805 m!1097169))

(declare-fun m!1097171 () Bool)

(assert (=> b!1188373 m!1097171))

(declare-fun m!1097173 () Bool)

(assert (=> b!1188369 m!1097173))

(declare-fun m!1097175 () Bool)

(assert (=> b!1188369 m!1097175))

(declare-fun m!1097177 () Bool)

(assert (=> b!1188369 m!1097177))

(declare-fun m!1097179 () Bool)

(assert (=> b!1188369 m!1097179))

(declare-fun m!1097181 () Bool)

(assert (=> b!1188380 m!1097181))

(declare-fun m!1097183 () Bool)

(assert (=> b!1188379 m!1097183))

(declare-fun m!1097185 () Bool)

(assert (=> b!1188366 m!1097185))

(declare-fun m!1097187 () Bool)

(assert (=> b!1188366 m!1097187))

(declare-fun m!1097189 () Bool)

(assert (=> b!1188370 m!1097189))

(declare-fun m!1097191 () Bool)

(assert (=> b!1188377 m!1097191))

(declare-fun m!1097193 () Bool)

(assert (=> b!1188377 m!1097193))

(assert (=> b!1188377 m!1097193))

(declare-fun m!1097195 () Bool)

(assert (=> b!1188377 m!1097195))

(declare-fun m!1097197 () Bool)

(assert (=> b!1188377 m!1097197))

(check-sat (not b_next!25455) (not b!1188379) (not start!99876) (not b!1188370) (not b_lambda!20599) (not b!1188371) (not b!1188377) (not b!1188375) tp_is_empty!29985 (not b!1188367) (not b!1188373) (not mapNonEmpty!46805) (not b!1188369) (not b!1188366) b_and!41779)
(check-sat b_and!41779 (not b_next!25455))
