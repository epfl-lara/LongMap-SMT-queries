; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100176 () Bool)

(assert start!100176)

(declare-fun b_free!25519 () Bool)

(declare-fun b_next!25519 () Bool)

(assert (=> start!100176 (= b_free!25519 (not b_next!25519))))

(declare-fun tp!89270 () Bool)

(declare-fun b_and!41907 () Bool)

(assert (=> start!100176 (= tp!89270 b_and!41907)))

(declare-fun b!1191159 () Bool)

(declare-fun res!791784 () Bool)

(declare-fun e!677306 () Bool)

(assert (=> b!1191159 (=> (not res!791784) (not e!677306))))

(declare-datatypes ((array!76935 0))(
  ( (array!76936 (arr!37111 (Array (_ BitVec 32) (_ BitVec 64))) (size!37648 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76935)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45193 0))(
  ( (V!45194 (val!15081 Int)) )
))
(declare-datatypes ((ValueCell!14315 0))(
  ( (ValueCellFull!14315 (v!17715 V!45193)) (EmptyCell!14315) )
))
(declare-datatypes ((array!76937 0))(
  ( (array!76938 (arr!37112 (Array (_ BitVec 32) ValueCell!14315)) (size!37649 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76937)

(assert (=> b!1191159 (= res!791784 (and (= (size!37649 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37648 _keys!1208) (size!37649 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191160 () Bool)

(declare-fun res!791787 () Bool)

(assert (=> b!1191160 (=> (not res!791787) (not e!677306))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1191160 (= res!791787 (= (select (arr!37111 _keys!1208) i!673) k0!934))))

(declare-fun b!1191161 () Bool)

(declare-fun res!791788 () Bool)

(declare-fun e!677300 () Bool)

(assert (=> b!1191161 (=> (not res!791788) (not e!677300))))

(declare-fun lt!541720 () array!76935)

(declare-datatypes ((List!26148 0))(
  ( (Nil!26145) (Cons!26144 (h!27362 (_ BitVec 64)) (t!38651 List!26148)) )
))
(declare-fun arrayNoDuplicates!0 (array!76935 (_ BitVec 32) List!26148) Bool)

(assert (=> b!1191161 (= res!791788 (arrayNoDuplicates!0 lt!541720 #b00000000000000000000000000000000 Nil!26145))))

(declare-fun b!1191162 () Bool)

(declare-fun res!791794 () Bool)

(assert (=> b!1191162 (=> (not res!791794) (not e!677306))))

(assert (=> b!1191162 (= res!791794 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37648 _keys!1208))))))

(declare-fun b!1191163 () Bool)

(declare-fun res!791792 () Bool)

(assert (=> b!1191163 (=> (not res!791792) (not e!677306))))

(assert (=> b!1191163 (= res!791792 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26145))))

(declare-fun b!1191164 () Bool)

(declare-fun e!677305 () Bool)

(declare-fun e!677303 () Bool)

(declare-fun mapRes!46901 () Bool)

(assert (=> b!1191164 (= e!677305 (and e!677303 mapRes!46901))))

(declare-fun condMapEmpty!46901 () Bool)

(declare-fun mapDefault!46901 () ValueCell!14315)

(assert (=> b!1191164 (= condMapEmpty!46901 (= (arr!37112 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14315)) mapDefault!46901)))))

(declare-fun b!1191165 () Bool)

(declare-fun e!677301 () Bool)

(declare-fun e!677299 () Bool)

(assert (=> b!1191165 (= e!677301 e!677299)))

(declare-fun res!791791 () Bool)

(assert (=> b!1191165 (=> res!791791 e!677299)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191165 (= res!791791 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45193)

(declare-fun lt!541718 () array!76937)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19404 0))(
  ( (tuple2!19405 (_1!9713 (_ BitVec 64)) (_2!9713 V!45193)) )
))
(declare-datatypes ((List!26149 0))(
  ( (Nil!26146) (Cons!26145 (h!27363 tuple2!19404) (t!38652 List!26149)) )
))
(declare-datatypes ((ListLongMap!17381 0))(
  ( (ListLongMap!17382 (toList!8706 List!26149)) )
))
(declare-fun lt!541716 () ListLongMap!17381)

(declare-fun minValue!944 () V!45193)

(declare-fun getCurrentListMapNoExtraKeys!5174 (array!76935 array!76937 (_ BitVec 32) (_ BitVec 32) V!45193 V!45193 (_ BitVec 32) Int) ListLongMap!17381)

(assert (=> b!1191165 (= lt!541716 (getCurrentListMapNoExtraKeys!5174 lt!541720 lt!541718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3131 (Int (_ BitVec 64)) V!45193)

(assert (=> b!1191165 (= lt!541718 (array!76938 (store (arr!37112 _values!996) i!673 (ValueCellFull!14315 (dynLambda!3131 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37649 _values!996)))))

(declare-fun lt!541715 () ListLongMap!17381)

(assert (=> b!1191165 (= lt!541715 (getCurrentListMapNoExtraKeys!5174 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191166 () Bool)

(declare-fun tp_is_empty!30049 () Bool)

(assert (=> b!1191166 (= e!677303 tp_is_empty!30049)))

(declare-fun mapNonEmpty!46901 () Bool)

(declare-fun tp!89271 () Bool)

(declare-fun e!677304 () Bool)

(assert (=> mapNonEmpty!46901 (= mapRes!46901 (and tp!89271 e!677304))))

(declare-fun mapRest!46901 () (Array (_ BitVec 32) ValueCell!14315))

(declare-fun mapKey!46901 () (_ BitVec 32))

(declare-fun mapValue!46901 () ValueCell!14315)

(assert (=> mapNonEmpty!46901 (= (arr!37112 _values!996) (store mapRest!46901 mapKey!46901 mapValue!46901))))

(declare-fun mapIsEmpty!46901 () Bool)

(assert (=> mapIsEmpty!46901 mapRes!46901))

(declare-fun b!1191167 () Bool)

(assert (=> b!1191167 (= e!677304 tp_is_empty!30049)))

(declare-fun res!791790 () Bool)

(assert (=> start!100176 (=> (not res!791790) (not e!677306))))

(assert (=> start!100176 (= res!791790 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37648 _keys!1208))))))

(assert (=> start!100176 e!677306))

(assert (=> start!100176 tp_is_empty!30049))

(declare-fun array_inv!28372 (array!76935) Bool)

(assert (=> start!100176 (array_inv!28372 _keys!1208)))

(assert (=> start!100176 true))

(assert (=> start!100176 tp!89270))

(declare-fun array_inv!28373 (array!76937) Bool)

(assert (=> start!100176 (and (array_inv!28373 _values!996) e!677305)))

(declare-fun b!1191168 () Bool)

(assert (=> b!1191168 (= e!677299 true)))

(declare-fun -!1720 (ListLongMap!17381 (_ BitVec 64)) ListLongMap!17381)

(assert (=> b!1191168 (= (getCurrentListMapNoExtraKeys!5174 lt!541720 lt!541718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1720 (getCurrentListMapNoExtraKeys!5174 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39455 0))(
  ( (Unit!39456) )
))
(declare-fun lt!541717 () Unit!39455)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!935 (array!76935 array!76937 (_ BitVec 32) (_ BitVec 32) V!45193 V!45193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39455)

(assert (=> b!1191168 (= lt!541717 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!935 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191169 () Bool)

(assert (=> b!1191169 (= e!677306 e!677300)))

(declare-fun res!791785 () Bool)

(assert (=> b!1191169 (=> (not res!791785) (not e!677300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76935 (_ BitVec 32)) Bool)

(assert (=> b!1191169 (= res!791785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541720 mask!1564))))

(assert (=> b!1191169 (= lt!541720 (array!76936 (store (arr!37111 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37648 _keys!1208)))))

(declare-fun b!1191170 () Bool)

(assert (=> b!1191170 (= e!677300 (not e!677301))))

(declare-fun res!791789 () Bool)

(assert (=> b!1191170 (=> res!791789 e!677301)))

(assert (=> b!1191170 (= res!791789 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191170 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541719 () Unit!39455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76935 (_ BitVec 64) (_ BitVec 32)) Unit!39455)

(assert (=> b!1191170 (= lt!541719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191171 () Bool)

(declare-fun res!791786 () Bool)

(assert (=> b!1191171 (=> (not res!791786) (not e!677306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191171 (= res!791786 (validMask!0 mask!1564))))

(declare-fun b!1191172 () Bool)

(declare-fun res!791793 () Bool)

(assert (=> b!1191172 (=> (not res!791793) (not e!677306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191172 (= res!791793 (validKeyInArray!0 k0!934))))

(declare-fun b!1191173 () Bool)

(declare-fun res!791795 () Bool)

(assert (=> b!1191173 (=> (not res!791795) (not e!677306))))

(assert (=> b!1191173 (= res!791795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100176 res!791790) b!1191171))

(assert (= (and b!1191171 res!791786) b!1191159))

(assert (= (and b!1191159 res!791784) b!1191173))

(assert (= (and b!1191173 res!791795) b!1191163))

(assert (= (and b!1191163 res!791792) b!1191162))

(assert (= (and b!1191162 res!791794) b!1191172))

(assert (= (and b!1191172 res!791793) b!1191160))

(assert (= (and b!1191160 res!791787) b!1191169))

(assert (= (and b!1191169 res!791785) b!1191161))

(assert (= (and b!1191161 res!791788) b!1191170))

(assert (= (and b!1191170 (not res!791789)) b!1191165))

(assert (= (and b!1191165 (not res!791791)) b!1191168))

(assert (= (and b!1191164 condMapEmpty!46901) mapIsEmpty!46901))

(assert (= (and b!1191164 (not condMapEmpty!46901)) mapNonEmpty!46901))

(get-info :version)

(assert (= (and mapNonEmpty!46901 ((_ is ValueCellFull!14315) mapValue!46901)) b!1191167))

(assert (= (and b!1191164 ((_ is ValueCellFull!14315) mapDefault!46901)) b!1191166))

(assert (= start!100176 b!1191164))

(declare-fun b_lambda!20657 () Bool)

(assert (=> (not b_lambda!20657) (not b!1191165)))

(declare-fun t!38650 () Bool)

(declare-fun tb!10323 () Bool)

(assert (=> (and start!100176 (= defaultEntry!1004 defaultEntry!1004) t!38650) tb!10323))

(declare-fun result!21221 () Bool)

(assert (=> tb!10323 (= result!21221 tp_is_empty!30049)))

(assert (=> b!1191165 t!38650))

(declare-fun b_and!41909 () Bool)

(assert (= b_and!41907 (and (=> t!38650 result!21221) b_and!41909)))

(declare-fun m!1100073 () Bool)

(assert (=> b!1191168 m!1100073))

(declare-fun m!1100075 () Bool)

(assert (=> b!1191168 m!1100075))

(assert (=> b!1191168 m!1100075))

(declare-fun m!1100077 () Bool)

(assert (=> b!1191168 m!1100077))

(declare-fun m!1100079 () Bool)

(assert (=> b!1191168 m!1100079))

(declare-fun m!1100081 () Bool)

(assert (=> b!1191160 m!1100081))

(declare-fun m!1100083 () Bool)

(assert (=> b!1191171 m!1100083))

(declare-fun m!1100085 () Bool)

(assert (=> b!1191169 m!1100085))

(declare-fun m!1100087 () Bool)

(assert (=> b!1191169 m!1100087))

(declare-fun m!1100089 () Bool)

(assert (=> b!1191161 m!1100089))

(declare-fun m!1100091 () Bool)

(assert (=> b!1191173 m!1100091))

(declare-fun m!1100093 () Bool)

(assert (=> mapNonEmpty!46901 m!1100093))

(declare-fun m!1100095 () Bool)

(assert (=> b!1191163 m!1100095))

(declare-fun m!1100097 () Bool)

(assert (=> b!1191172 m!1100097))

(declare-fun m!1100099 () Bool)

(assert (=> b!1191165 m!1100099))

(declare-fun m!1100101 () Bool)

(assert (=> b!1191165 m!1100101))

(declare-fun m!1100103 () Bool)

(assert (=> b!1191165 m!1100103))

(declare-fun m!1100105 () Bool)

(assert (=> b!1191165 m!1100105))

(declare-fun m!1100107 () Bool)

(assert (=> b!1191170 m!1100107))

(declare-fun m!1100109 () Bool)

(assert (=> b!1191170 m!1100109))

(declare-fun m!1100111 () Bool)

(assert (=> start!100176 m!1100111))

(declare-fun m!1100113 () Bool)

(assert (=> start!100176 m!1100113))

(check-sat (not start!100176) (not b!1191163) (not b_lambda!20657) (not b!1191169) (not b!1191168) (not b_next!25519) (not b!1191170) (not b!1191165) (not b!1191173) (not b!1191172) (not b!1191161) tp_is_empty!30049 (not mapNonEmpty!46901) b_and!41909 (not b!1191171))
(check-sat b_and!41909 (not b_next!25519))
