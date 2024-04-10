; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99058 () Bool)

(assert start!99058)

(declare-fun b_free!24663 () Bool)

(declare-fun b_next!24663 () Bool)

(assert (=> start!99058 (= b_free!24663 (not b_next!24663))))

(declare-fun tp!86699 () Bool)

(declare-fun b_and!40175 () Bool)

(assert (=> start!99058 (= tp!86699 b_and!40175)))

(declare-fun res!772391 () Bool)

(declare-fun e!662193 () Bool)

(assert (=> start!99058 (=> (not res!772391) (not e!662193))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75217 0))(
  ( (array!75218 (arr!36259 (Array (_ BitVec 32) (_ BitVec 64))) (size!36795 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75217)

(assert (=> start!99058 (= res!772391 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36795 _keys!1208))))))

(assert (=> start!99058 e!662193))

(declare-fun tp_is_empty!29193 () Bool)

(assert (=> start!99058 tp_is_empty!29193))

(declare-fun array_inv!27738 (array!75217) Bool)

(assert (=> start!99058 (array_inv!27738 _keys!1208)))

(assert (=> start!99058 true))

(assert (=> start!99058 tp!86699))

(declare-datatypes ((V!44051 0))(
  ( (V!44052 (val!14653 Int)) )
))
(declare-datatypes ((ValueCell!13887 0))(
  ( (ValueCellFull!13887 (v!17290 V!44051)) (EmptyCell!13887) )
))
(declare-datatypes ((array!75219 0))(
  ( (array!75220 (arr!36260 (Array (_ BitVec 32) ValueCell!13887)) (size!36796 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75219)

(declare-fun e!662192 () Bool)

(declare-fun array_inv!27739 (array!75219) Bool)

(assert (=> start!99058 (and (array_inv!27739 _values!996) e!662192)))

(declare-fun mapNonEmpty!45614 () Bool)

(declare-fun mapRes!45614 () Bool)

(declare-fun tp!86700 () Bool)

(declare-fun e!662190 () Bool)

(assert (=> mapNonEmpty!45614 (= mapRes!45614 (and tp!86700 e!662190))))

(declare-fun mapRest!45614 () (Array (_ BitVec 32) ValueCell!13887))

(declare-fun mapKey!45614 () (_ BitVec 32))

(declare-fun mapValue!45614 () ValueCell!13887)

(assert (=> mapNonEmpty!45614 (= (arr!36260 _values!996) (store mapRest!45614 mapKey!45614 mapValue!45614))))

(declare-fun b!1164710 () Bool)

(declare-fun res!772386 () Bool)

(assert (=> b!1164710 (=> (not res!772386) (not e!662193))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164710 (= res!772386 (validKeyInArray!0 k0!934))))

(declare-fun b!1164711 () Bool)

(declare-fun res!772387 () Bool)

(assert (=> b!1164711 (=> (not res!772387) (not e!662193))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164711 (= res!772387 (= (select (arr!36259 _keys!1208) i!673) k0!934))))

(declare-fun b!1164712 () Bool)

(declare-fun res!772390 () Bool)

(declare-fun e!662191 () Bool)

(assert (=> b!1164712 (=> (not res!772390) (not e!662191))))

(declare-fun lt!524715 () array!75217)

(declare-datatypes ((List!25421 0))(
  ( (Nil!25418) (Cons!25417 (h!26626 (_ BitVec 64)) (t!37076 List!25421)) )
))
(declare-fun arrayNoDuplicates!0 (array!75217 (_ BitVec 32) List!25421) Bool)

(assert (=> b!1164712 (= res!772390 (arrayNoDuplicates!0 lt!524715 #b00000000000000000000000000000000 Nil!25418))))

(declare-fun b!1164713 () Bool)

(declare-fun res!772389 () Bool)

(assert (=> b!1164713 (=> (not res!772389) (not e!662193))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75217 (_ BitVec 32)) Bool)

(assert (=> b!1164713 (= res!772389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164714 () Bool)

(declare-fun e!662194 () Bool)

(assert (=> b!1164714 (= e!662194 true)))

(declare-fun zeroValue!944 () V!44051)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44051)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18688 0))(
  ( (tuple2!18689 (_1!9355 (_ BitVec 64)) (_2!9355 V!44051)) )
))
(declare-datatypes ((List!25422 0))(
  ( (Nil!25419) (Cons!25418 (h!26627 tuple2!18688) (t!37077 List!25422)) )
))
(declare-datatypes ((ListLongMap!16657 0))(
  ( (ListLongMap!16658 (toList!8344 List!25422)) )
))
(declare-fun lt!524713 () ListLongMap!16657)

(declare-fun getCurrentListMapNoExtraKeys!4808 (array!75217 array!75219 (_ BitVec 32) (_ BitVec 32) V!44051 V!44051 (_ BitVec 32) Int) ListLongMap!16657)

(declare-fun dynLambda!2798 (Int (_ BitVec 64)) V!44051)

(assert (=> b!1164714 (= lt!524713 (getCurrentListMapNoExtraKeys!4808 lt!524715 (array!75220 (store (arr!36260 _values!996) i!673 (ValueCellFull!13887 (dynLambda!2798 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36796 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524714 () ListLongMap!16657)

(assert (=> b!1164714 (= lt!524714 (getCurrentListMapNoExtraKeys!4808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164715 () Bool)

(declare-fun res!772388 () Bool)

(assert (=> b!1164715 (=> (not res!772388) (not e!662193))))

(assert (=> b!1164715 (= res!772388 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36795 _keys!1208))))))

(declare-fun b!1164716 () Bool)

(declare-fun e!662196 () Bool)

(assert (=> b!1164716 (= e!662192 (and e!662196 mapRes!45614))))

(declare-fun condMapEmpty!45614 () Bool)

(declare-fun mapDefault!45614 () ValueCell!13887)

(assert (=> b!1164716 (= condMapEmpty!45614 (= (arr!36260 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13887)) mapDefault!45614)))))

(declare-fun b!1164717 () Bool)

(declare-fun res!772385 () Bool)

(assert (=> b!1164717 (=> (not res!772385) (not e!662193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164717 (= res!772385 (validMask!0 mask!1564))))

(declare-fun b!1164718 () Bool)

(assert (=> b!1164718 (= e!662196 tp_is_empty!29193)))

(declare-fun b!1164719 () Bool)

(declare-fun res!772393 () Bool)

(assert (=> b!1164719 (=> (not res!772393) (not e!662193))))

(assert (=> b!1164719 (= res!772393 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25418))))

(declare-fun b!1164720 () Bool)

(declare-fun res!772392 () Bool)

(assert (=> b!1164720 (=> (not res!772392) (not e!662193))))

(assert (=> b!1164720 (= res!772392 (and (= (size!36796 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36795 _keys!1208) (size!36796 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164721 () Bool)

(assert (=> b!1164721 (= e!662191 (not e!662194))))

(declare-fun res!772384 () Bool)

(assert (=> b!1164721 (=> res!772384 e!662194)))

(assert (=> b!1164721 (= res!772384 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164721 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38438 0))(
  ( (Unit!38439) )
))
(declare-fun lt!524712 () Unit!38438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75217 (_ BitVec 64) (_ BitVec 32)) Unit!38438)

(assert (=> b!1164721 (= lt!524712 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164722 () Bool)

(assert (=> b!1164722 (= e!662193 e!662191)))

(declare-fun res!772394 () Bool)

(assert (=> b!1164722 (=> (not res!772394) (not e!662191))))

(assert (=> b!1164722 (= res!772394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524715 mask!1564))))

(assert (=> b!1164722 (= lt!524715 (array!75218 (store (arr!36259 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36795 _keys!1208)))))

(declare-fun mapIsEmpty!45614 () Bool)

(assert (=> mapIsEmpty!45614 mapRes!45614))

(declare-fun b!1164723 () Bool)

(assert (=> b!1164723 (= e!662190 tp_is_empty!29193)))

(assert (= (and start!99058 res!772391) b!1164717))

(assert (= (and b!1164717 res!772385) b!1164720))

(assert (= (and b!1164720 res!772392) b!1164713))

(assert (= (and b!1164713 res!772389) b!1164719))

(assert (= (and b!1164719 res!772393) b!1164715))

(assert (= (and b!1164715 res!772388) b!1164710))

(assert (= (and b!1164710 res!772386) b!1164711))

(assert (= (and b!1164711 res!772387) b!1164722))

(assert (= (and b!1164722 res!772394) b!1164712))

(assert (= (and b!1164712 res!772390) b!1164721))

(assert (= (and b!1164721 (not res!772384)) b!1164714))

(assert (= (and b!1164716 condMapEmpty!45614) mapIsEmpty!45614))

(assert (= (and b!1164716 (not condMapEmpty!45614)) mapNonEmpty!45614))

(get-info :version)

(assert (= (and mapNonEmpty!45614 ((_ is ValueCellFull!13887) mapValue!45614)) b!1164723))

(assert (= (and b!1164716 ((_ is ValueCellFull!13887) mapDefault!45614)) b!1164718))

(assert (= start!99058 b!1164716))

(declare-fun b_lambda!19769 () Bool)

(assert (=> (not b_lambda!19769) (not b!1164714)))

(declare-fun t!37075 () Bool)

(declare-fun tb!9475 () Bool)

(assert (=> (and start!99058 (= defaultEntry!1004 defaultEntry!1004) t!37075) tb!9475))

(declare-fun result!19515 () Bool)

(assert (=> tb!9475 (= result!19515 tp_is_empty!29193)))

(assert (=> b!1164714 t!37075))

(declare-fun b_and!40177 () Bool)

(assert (= b_and!40175 (and (=> t!37075 result!19515) b_and!40177)))

(declare-fun m!1073073 () Bool)

(assert (=> start!99058 m!1073073))

(declare-fun m!1073075 () Bool)

(assert (=> start!99058 m!1073075))

(declare-fun m!1073077 () Bool)

(assert (=> b!1164722 m!1073077))

(declare-fun m!1073079 () Bool)

(assert (=> b!1164722 m!1073079))

(declare-fun m!1073081 () Bool)

(assert (=> mapNonEmpty!45614 m!1073081))

(declare-fun m!1073083 () Bool)

(assert (=> b!1164711 m!1073083))

(declare-fun m!1073085 () Bool)

(assert (=> b!1164717 m!1073085))

(declare-fun m!1073087 () Bool)

(assert (=> b!1164721 m!1073087))

(declare-fun m!1073089 () Bool)

(assert (=> b!1164721 m!1073089))

(declare-fun m!1073091 () Bool)

(assert (=> b!1164713 m!1073091))

(declare-fun m!1073093 () Bool)

(assert (=> b!1164714 m!1073093))

(declare-fun m!1073095 () Bool)

(assert (=> b!1164714 m!1073095))

(declare-fun m!1073097 () Bool)

(assert (=> b!1164714 m!1073097))

(declare-fun m!1073099 () Bool)

(assert (=> b!1164714 m!1073099))

(declare-fun m!1073101 () Bool)

(assert (=> b!1164710 m!1073101))

(declare-fun m!1073103 () Bool)

(assert (=> b!1164712 m!1073103))

(declare-fun m!1073105 () Bool)

(assert (=> b!1164719 m!1073105))

(check-sat (not b!1164710) (not b!1164713) (not b!1164722) (not b!1164714) tp_is_empty!29193 b_and!40177 (not b!1164719) (not b!1164712) (not start!99058) (not b!1164721) (not mapNonEmpty!45614) (not b!1164717) (not b_lambda!19769) (not b_next!24663))
(check-sat b_and!40177 (not b_next!24663))
