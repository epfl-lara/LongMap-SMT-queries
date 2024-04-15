; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99122 () Bool)

(assert start!99122)

(declare-fun b_free!24733 () Bool)

(declare-fun b_next!24733 () Bool)

(assert (=> start!99122 (= b_free!24733 (not b_next!24733))))

(declare-fun tp!86910 () Bool)

(declare-fun b_and!40293 () Bool)

(assert (=> start!99122 (= tp!86910 b_and!40293)))

(declare-fun b!1166155 () Bool)

(declare-fun e!662876 () Bool)

(declare-fun e!662881 () Bool)

(assert (=> b!1166155 (= e!662876 e!662881)))

(declare-fun res!773512 () Bool)

(assert (=> b!1166155 (=> res!773512 e!662881)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166155 (= res!773512 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44145 0))(
  ( (V!44146 (val!14688 Int)) )
))
(declare-fun zeroValue!944 () V!44145)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13922 0))(
  ( (ValueCellFull!13922 (v!17324 V!44145)) (EmptyCell!13922) )
))
(declare-datatypes ((array!75278 0))(
  ( (array!75279 (arr!36290 (Array (_ BitVec 32) ValueCell!13922)) (size!36828 (_ BitVec 32))) )
))
(declare-fun lt!525000 () array!75278)

(declare-fun minValue!944 () V!44145)

(declare-datatypes ((tuple2!18822 0))(
  ( (tuple2!18823 (_1!9422 (_ BitVec 64)) (_2!9422 V!44145)) )
))
(declare-datatypes ((List!25539 0))(
  ( (Nil!25536) (Cons!25535 (h!26744 tuple2!18822) (t!37255 List!25539)) )
))
(declare-datatypes ((ListLongMap!16791 0))(
  ( (ListLongMap!16792 (toList!8411 List!25539)) )
))
(declare-fun lt!525002 () ListLongMap!16791)

(declare-datatypes ((array!75280 0))(
  ( (array!75281 (arr!36291 (Array (_ BitVec 32) (_ BitVec 64))) (size!36829 (_ BitVec 32))) )
))
(declare-fun lt!524999 () array!75280)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4887 (array!75280 array!75278 (_ BitVec 32) (_ BitVec 32) V!44145 V!44145 (_ BitVec 32) Int) ListLongMap!16791)

(assert (=> b!1166155 (= lt!525002 (getCurrentListMapNoExtraKeys!4887 lt!524999 lt!525000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75278)

(declare-fun dynLambda!2820 (Int (_ BitVec 64)) V!44145)

(assert (=> b!1166155 (= lt!525000 (array!75279 (store (arr!36290 _values!996) i!673 (ValueCellFull!13922 (dynLambda!2820 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36828 _values!996)))))

(declare-fun _keys!1208 () array!75280)

(declare-fun lt!524998 () ListLongMap!16791)

(assert (=> b!1166155 (= lt!524998 (getCurrentListMapNoExtraKeys!4887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166156 () Bool)

(declare-fun res!773505 () Bool)

(declare-fun e!662880 () Bool)

(assert (=> b!1166156 (=> (not res!773505) (not e!662880))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166156 (= res!773505 (= (select (arr!36291 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45719 () Bool)

(declare-fun mapRes!45719 () Bool)

(declare-fun tp!86909 () Bool)

(declare-fun e!662882 () Bool)

(assert (=> mapNonEmpty!45719 (= mapRes!45719 (and tp!86909 e!662882))))

(declare-fun mapValue!45719 () ValueCell!13922)

(declare-fun mapRest!45719 () (Array (_ BitVec 32) ValueCell!13922))

(declare-fun mapKey!45719 () (_ BitVec 32))

(assert (=> mapNonEmpty!45719 (= (arr!36290 _values!996) (store mapRest!45719 mapKey!45719 mapValue!45719))))

(declare-fun b!1166157 () Bool)

(declare-fun res!773503 () Bool)

(assert (=> b!1166157 (=> (not res!773503) (not e!662880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166157 (= res!773503 (validMask!0 mask!1564))))

(declare-fun res!773511 () Bool)

(assert (=> start!99122 (=> (not res!773511) (not e!662880))))

(assert (=> start!99122 (= res!773511 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36829 _keys!1208))))))

(assert (=> start!99122 e!662880))

(declare-fun tp_is_empty!29263 () Bool)

(assert (=> start!99122 tp_is_empty!29263))

(declare-fun array_inv!27850 (array!75280) Bool)

(assert (=> start!99122 (array_inv!27850 _keys!1208)))

(assert (=> start!99122 true))

(assert (=> start!99122 tp!86910))

(declare-fun e!662878 () Bool)

(declare-fun array_inv!27851 (array!75278) Bool)

(assert (=> start!99122 (and (array_inv!27851 _values!996) e!662878)))

(declare-fun b!1166158 () Bool)

(assert (=> b!1166158 (= e!662881 true)))

(declare-fun -!1425 (ListLongMap!16791 (_ BitVec 64)) ListLongMap!16791)

(assert (=> b!1166158 (= (getCurrentListMapNoExtraKeys!4887 lt!524999 lt!525000 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1425 (getCurrentListMapNoExtraKeys!4887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38313 0))(
  ( (Unit!38314) )
))
(declare-fun lt!525003 () Unit!38313)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!689 (array!75280 array!75278 (_ BitVec 32) (_ BitVec 32) V!44145 V!44145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38313)

(assert (=> b!1166158 (= lt!525003 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!689 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166159 () Bool)

(declare-fun res!773502 () Bool)

(assert (=> b!1166159 (=> (not res!773502) (not e!662880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75280 (_ BitVec 32)) Bool)

(assert (=> b!1166159 (= res!773502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166160 () Bool)

(declare-fun res!773513 () Bool)

(assert (=> b!1166160 (=> (not res!773513) (not e!662880))))

(declare-datatypes ((List!25540 0))(
  ( (Nil!25537) (Cons!25536 (h!26745 (_ BitVec 64)) (t!37256 List!25540)) )
))
(declare-fun arrayNoDuplicates!0 (array!75280 (_ BitVec 32) List!25540) Bool)

(assert (=> b!1166160 (= res!773513 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25537))))

(declare-fun b!1166161 () Bool)

(declare-fun e!662879 () Bool)

(assert (=> b!1166161 (= e!662879 (not e!662876))))

(declare-fun res!773509 () Bool)

(assert (=> b!1166161 (=> res!773509 e!662876)))

(assert (=> b!1166161 (= res!773509 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166161 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525001 () Unit!38313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75280 (_ BitVec 64) (_ BitVec 32)) Unit!38313)

(assert (=> b!1166161 (= lt!525001 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166162 () Bool)

(declare-fun res!773510 () Bool)

(assert (=> b!1166162 (=> (not res!773510) (not e!662880))))

(assert (=> b!1166162 (= res!773510 (and (= (size!36828 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36829 _keys!1208) (size!36828 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166163 () Bool)

(declare-fun res!773506 () Bool)

(assert (=> b!1166163 (=> (not res!773506) (not e!662879))))

(assert (=> b!1166163 (= res!773506 (arrayNoDuplicates!0 lt!524999 #b00000000000000000000000000000000 Nil!25537))))

(declare-fun mapIsEmpty!45719 () Bool)

(assert (=> mapIsEmpty!45719 mapRes!45719))

(declare-fun b!1166164 () Bool)

(declare-fun e!662877 () Bool)

(assert (=> b!1166164 (= e!662877 tp_is_empty!29263)))

(declare-fun b!1166165 () Bool)

(assert (=> b!1166165 (= e!662878 (and e!662877 mapRes!45719))))

(declare-fun condMapEmpty!45719 () Bool)

(declare-fun mapDefault!45719 () ValueCell!13922)

(assert (=> b!1166165 (= condMapEmpty!45719 (= (arr!36290 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13922)) mapDefault!45719)))))

(declare-fun b!1166166 () Bool)

(assert (=> b!1166166 (= e!662882 tp_is_empty!29263)))

(declare-fun b!1166167 () Bool)

(assert (=> b!1166167 (= e!662880 e!662879)))

(declare-fun res!773507 () Bool)

(assert (=> b!1166167 (=> (not res!773507) (not e!662879))))

(assert (=> b!1166167 (= res!773507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524999 mask!1564))))

(assert (=> b!1166167 (= lt!524999 (array!75281 (store (arr!36291 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36829 _keys!1208)))))

(declare-fun b!1166168 () Bool)

(declare-fun res!773504 () Bool)

(assert (=> b!1166168 (=> (not res!773504) (not e!662880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166168 (= res!773504 (validKeyInArray!0 k0!934))))

(declare-fun b!1166169 () Bool)

(declare-fun res!773508 () Bool)

(assert (=> b!1166169 (=> (not res!773508) (not e!662880))))

(assert (=> b!1166169 (= res!773508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36829 _keys!1208))))))

(assert (= (and start!99122 res!773511) b!1166157))

(assert (= (and b!1166157 res!773503) b!1166162))

(assert (= (and b!1166162 res!773510) b!1166159))

(assert (= (and b!1166159 res!773502) b!1166160))

(assert (= (and b!1166160 res!773513) b!1166169))

(assert (= (and b!1166169 res!773508) b!1166168))

(assert (= (and b!1166168 res!773504) b!1166156))

(assert (= (and b!1166156 res!773505) b!1166167))

(assert (= (and b!1166167 res!773507) b!1166163))

(assert (= (and b!1166163 res!773506) b!1166161))

(assert (= (and b!1166161 (not res!773509)) b!1166155))

(assert (= (and b!1166155 (not res!773512)) b!1166158))

(assert (= (and b!1166165 condMapEmpty!45719) mapIsEmpty!45719))

(assert (= (and b!1166165 (not condMapEmpty!45719)) mapNonEmpty!45719))

(get-info :version)

(assert (= (and mapNonEmpty!45719 ((_ is ValueCellFull!13922) mapValue!45719)) b!1166166))

(assert (= (and b!1166165 ((_ is ValueCellFull!13922) mapDefault!45719)) b!1166164))

(assert (= start!99122 b!1166165))

(declare-fun b_lambda!19821 () Bool)

(assert (=> (not b_lambda!19821) (not b!1166155)))

(declare-fun t!37254 () Bool)

(declare-fun tb!9537 () Bool)

(assert (=> (and start!99122 (= defaultEntry!1004 defaultEntry!1004) t!37254) tb!9537))

(declare-fun result!19647 () Bool)

(assert (=> tb!9537 (= result!19647 tp_is_empty!29263)))

(assert (=> b!1166155 t!37254))

(declare-fun b_and!40295 () Bool)

(assert (= b_and!40293 (and (=> t!37254 result!19647) b_and!40295)))

(declare-fun m!1073725 () Bool)

(assert (=> b!1166161 m!1073725))

(declare-fun m!1073727 () Bool)

(assert (=> b!1166161 m!1073727))

(declare-fun m!1073729 () Bool)

(assert (=> b!1166156 m!1073729))

(declare-fun m!1073731 () Bool)

(assert (=> b!1166168 m!1073731))

(declare-fun m!1073733 () Bool)

(assert (=> start!99122 m!1073733))

(declare-fun m!1073735 () Bool)

(assert (=> start!99122 m!1073735))

(declare-fun m!1073737 () Bool)

(assert (=> b!1166158 m!1073737))

(declare-fun m!1073739 () Bool)

(assert (=> b!1166158 m!1073739))

(assert (=> b!1166158 m!1073739))

(declare-fun m!1073741 () Bool)

(assert (=> b!1166158 m!1073741))

(declare-fun m!1073743 () Bool)

(assert (=> b!1166158 m!1073743))

(declare-fun m!1073745 () Bool)

(assert (=> b!1166155 m!1073745))

(declare-fun m!1073747 () Bool)

(assert (=> b!1166155 m!1073747))

(declare-fun m!1073749 () Bool)

(assert (=> b!1166155 m!1073749))

(declare-fun m!1073751 () Bool)

(assert (=> b!1166155 m!1073751))

(declare-fun m!1073753 () Bool)

(assert (=> b!1166167 m!1073753))

(declare-fun m!1073755 () Bool)

(assert (=> b!1166167 m!1073755))

(declare-fun m!1073757 () Bool)

(assert (=> b!1166163 m!1073757))

(declare-fun m!1073759 () Bool)

(assert (=> b!1166160 m!1073759))

(declare-fun m!1073761 () Bool)

(assert (=> mapNonEmpty!45719 m!1073761))

(declare-fun m!1073763 () Bool)

(assert (=> b!1166159 m!1073763))

(declare-fun m!1073765 () Bool)

(assert (=> b!1166157 m!1073765))

(check-sat (not b!1166167) tp_is_empty!29263 (not b!1166160) (not b!1166159) (not b_lambda!19821) (not b!1166161) (not b!1166157) (not start!99122) (not b_next!24733) (not b!1166168) (not b!1166163) (not b!1166155) (not mapNonEmpty!45719) b_and!40295 (not b!1166158))
(check-sat b_and!40295 (not b_next!24733))
