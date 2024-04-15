; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99910 () Bool)

(assert start!99910)

(declare-fun b_free!25495 () Bool)

(declare-fun b_next!25495 () Bool)

(assert (=> start!99910 (= b_free!25495 (not b_next!25495))))

(declare-fun tp!89199 () Bool)

(declare-fun b_and!41835 () Bool)

(assert (=> start!99910 (= tp!89199 b_and!41835)))

(declare-fun b!1189182 () Bool)

(declare-fun res!790788 () Bool)

(declare-fun e!676102 () Bool)

(assert (=> b!1189182 (=> (not res!790788) (not e!676102))))

(declare-datatypes ((array!76778 0))(
  ( (array!76779 (arr!37039 (Array (_ BitVec 32) (_ BitVec 64))) (size!37577 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76778)

(declare-datatypes ((List!26183 0))(
  ( (Nil!26180) (Cons!26179 (h!27388 (_ BitVec 64)) (t!38661 List!26183)) )
))
(declare-fun arrayNoDuplicates!0 (array!76778 (_ BitVec 32) List!26183) Bool)

(assert (=> b!1189182 (= res!790788 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26180))))

(declare-fun b!1189183 () Bool)

(declare-fun e!676105 () Bool)

(assert (=> b!1189183 (= e!676105 true)))

(declare-datatypes ((V!45161 0))(
  ( (V!45162 (val!15069 Int)) )
))
(declare-fun zeroValue!944 () V!45161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14303 0))(
  ( (ValueCellFull!14303 (v!17706 V!45161)) (EmptyCell!14303) )
))
(declare-datatypes ((array!76780 0))(
  ( (array!76781 (arr!37040 (Array (_ BitVec 32) ValueCell!14303)) (size!37578 (_ BitVec 32))) )
))
(declare-fun lt!540825 () array!76780)

(declare-fun _values!996 () array!76780)

(declare-fun minValue!944 () V!45161)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!540824 () array!76778)

(declare-datatypes ((tuple2!19472 0))(
  ( (tuple2!19473 (_1!9747 (_ BitVec 64)) (_2!9747 V!45161)) )
))
(declare-datatypes ((List!26184 0))(
  ( (Nil!26181) (Cons!26180 (h!27389 tuple2!19472) (t!38662 List!26184)) )
))
(declare-datatypes ((ListLongMap!17441 0))(
  ( (ListLongMap!17442 (toList!8736 List!26184)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5186 (array!76778 array!76780 (_ BitVec 32) (_ BitVec 32) V!45161 V!45161 (_ BitVec 32) Int) ListLongMap!17441)

(declare-fun -!1683 (ListLongMap!17441 (_ BitVec 64)) ListLongMap!17441)

(assert (=> b!1189183 (= (getCurrentListMapNoExtraKeys!5186 lt!540824 lt!540825 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1683 (getCurrentListMapNoExtraKeys!5186 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39329 0))(
  ( (Unit!39330) )
))
(declare-fun lt!540823 () Unit!39329)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!933 (array!76778 array!76780 (_ BitVec 32) (_ BitVec 32) V!45161 V!45161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39329)

(assert (=> b!1189183 (= lt!540823 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!933 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189184 () Bool)

(declare-fun res!790786 () Bool)

(assert (=> b!1189184 (=> (not res!790786) (not e!676102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76778 (_ BitVec 32)) Bool)

(assert (=> b!1189184 (= res!790786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189185 () Bool)

(declare-fun res!790785 () Bool)

(assert (=> b!1189185 (=> (not res!790785) (not e!676102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189185 (= res!790785 (validMask!0 mask!1564))))

(declare-fun b!1189186 () Bool)

(declare-fun e!676103 () Bool)

(declare-fun tp_is_empty!30025 () Bool)

(assert (=> b!1189186 (= e!676103 tp_is_empty!30025)))

(declare-fun b!1189187 () Bool)

(declare-fun res!790780 () Bool)

(assert (=> b!1189187 (=> (not res!790780) (not e!676102))))

(assert (=> b!1189187 (= res!790780 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37577 _keys!1208))))))

(declare-fun b!1189188 () Bool)

(declare-fun e!676107 () Bool)

(declare-fun e!676106 () Bool)

(declare-fun mapRes!46865 () Bool)

(assert (=> b!1189188 (= e!676107 (and e!676106 mapRes!46865))))

(declare-fun condMapEmpty!46865 () Bool)

(declare-fun mapDefault!46865 () ValueCell!14303)

(assert (=> b!1189188 (= condMapEmpty!46865 (= (arr!37040 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14303)) mapDefault!46865)))))

(declare-fun b!1189189 () Bool)

(declare-fun e!676101 () Bool)

(declare-fun e!676104 () Bool)

(assert (=> b!1189189 (= e!676101 (not e!676104))))

(declare-fun res!790784 () Bool)

(assert (=> b!1189189 (=> res!790784 e!676104)))

(assert (=> b!1189189 (= res!790784 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189189 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540826 () Unit!39329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76778 (_ BitVec 64) (_ BitVec 32)) Unit!39329)

(assert (=> b!1189189 (= lt!540826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189191 () Bool)

(declare-fun res!790787 () Bool)

(assert (=> b!1189191 (=> (not res!790787) (not e!676101))))

(assert (=> b!1189191 (= res!790787 (arrayNoDuplicates!0 lt!540824 #b00000000000000000000000000000000 Nil!26180))))

(declare-fun b!1189192 () Bool)

(assert (=> b!1189192 (= e!676106 tp_is_empty!30025)))

(declare-fun b!1189193 () Bool)

(declare-fun res!790789 () Bool)

(assert (=> b!1189193 (=> (not res!790789) (not e!676102))))

(assert (=> b!1189193 (= res!790789 (= (select (arr!37039 _keys!1208) i!673) k0!934))))

(declare-fun b!1189194 () Bool)

(declare-fun res!790781 () Bool)

(assert (=> b!1189194 (=> (not res!790781) (not e!676102))))

(assert (=> b!1189194 (= res!790781 (and (= (size!37578 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37577 _keys!1208) (size!37578 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46865 () Bool)

(declare-fun tp!89198 () Bool)

(assert (=> mapNonEmpty!46865 (= mapRes!46865 (and tp!89198 e!676103))))

(declare-fun mapRest!46865 () (Array (_ BitVec 32) ValueCell!14303))

(declare-fun mapKey!46865 () (_ BitVec 32))

(declare-fun mapValue!46865 () ValueCell!14303)

(assert (=> mapNonEmpty!46865 (= (arr!37040 _values!996) (store mapRest!46865 mapKey!46865 mapValue!46865))))

(declare-fun b!1189195 () Bool)

(assert (=> b!1189195 (= e!676104 e!676105)))

(declare-fun res!790778 () Bool)

(assert (=> b!1189195 (=> res!790778 e!676105)))

(assert (=> b!1189195 (= res!790778 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540828 () ListLongMap!17441)

(assert (=> b!1189195 (= lt!540828 (getCurrentListMapNoExtraKeys!5186 lt!540824 lt!540825 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3081 (Int (_ BitVec 64)) V!45161)

(assert (=> b!1189195 (= lt!540825 (array!76781 (store (arr!37040 _values!996) i!673 (ValueCellFull!14303 (dynLambda!3081 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37578 _values!996)))))

(declare-fun lt!540827 () ListLongMap!17441)

(assert (=> b!1189195 (= lt!540827 (getCurrentListMapNoExtraKeys!5186 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!790782 () Bool)

(assert (=> start!99910 (=> (not res!790782) (not e!676102))))

(assert (=> start!99910 (= res!790782 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37577 _keys!1208))))))

(assert (=> start!99910 e!676102))

(assert (=> start!99910 tp_is_empty!30025))

(declare-fun array_inv!28372 (array!76778) Bool)

(assert (=> start!99910 (array_inv!28372 _keys!1208)))

(assert (=> start!99910 true))

(assert (=> start!99910 tp!89199))

(declare-fun array_inv!28373 (array!76780) Bool)

(assert (=> start!99910 (and (array_inv!28373 _values!996) e!676107)))

(declare-fun b!1189190 () Bool)

(declare-fun res!790783 () Bool)

(assert (=> b!1189190 (=> (not res!790783) (not e!676102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189190 (= res!790783 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46865 () Bool)

(assert (=> mapIsEmpty!46865 mapRes!46865))

(declare-fun b!1189196 () Bool)

(assert (=> b!1189196 (= e!676102 e!676101)))

(declare-fun res!790779 () Bool)

(assert (=> b!1189196 (=> (not res!790779) (not e!676101))))

(assert (=> b!1189196 (= res!790779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540824 mask!1564))))

(assert (=> b!1189196 (= lt!540824 (array!76779 (store (arr!37039 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37577 _keys!1208)))))

(assert (= (and start!99910 res!790782) b!1189185))

(assert (= (and b!1189185 res!790785) b!1189194))

(assert (= (and b!1189194 res!790781) b!1189184))

(assert (= (and b!1189184 res!790786) b!1189182))

(assert (= (and b!1189182 res!790788) b!1189187))

(assert (= (and b!1189187 res!790780) b!1189190))

(assert (= (and b!1189190 res!790783) b!1189193))

(assert (= (and b!1189193 res!790789) b!1189196))

(assert (= (and b!1189196 res!790779) b!1189191))

(assert (= (and b!1189191 res!790787) b!1189189))

(assert (= (and b!1189189 (not res!790784)) b!1189195))

(assert (= (and b!1189195 (not res!790778)) b!1189183))

(assert (= (and b!1189188 condMapEmpty!46865) mapIsEmpty!46865))

(assert (= (and b!1189188 (not condMapEmpty!46865)) mapNonEmpty!46865))

(get-info :version)

(assert (= (and mapNonEmpty!46865 ((_ is ValueCellFull!14303) mapValue!46865)) b!1189186))

(assert (= (and b!1189188 ((_ is ValueCellFull!14303) mapDefault!46865)) b!1189192))

(assert (= start!99910 b!1189188))

(declare-fun b_lambda!20621 () Bool)

(assert (=> (not b_lambda!20621) (not b!1189195)))

(declare-fun t!38660 () Bool)

(declare-fun tb!10299 () Bool)

(assert (=> (and start!99910 (= defaultEntry!1004 defaultEntry!1004) t!38660) tb!10299))

(declare-fun result!21173 () Bool)

(assert (=> tb!10299 (= result!21173 tp_is_empty!30025)))

(assert (=> b!1189195 t!38660))

(declare-fun b_and!41837 () Bool)

(assert (= b_and!41835 (and (=> t!38660 result!21173) b_and!41837)))

(declare-fun m!1097387 () Bool)

(assert (=> b!1189189 m!1097387))

(declare-fun m!1097389 () Bool)

(assert (=> b!1189189 m!1097389))

(declare-fun m!1097391 () Bool)

(assert (=> b!1189185 m!1097391))

(declare-fun m!1097393 () Bool)

(assert (=> b!1189191 m!1097393))

(declare-fun m!1097395 () Bool)

(assert (=> b!1189184 m!1097395))

(declare-fun m!1097397 () Bool)

(assert (=> b!1189193 m!1097397))

(declare-fun m!1097399 () Bool)

(assert (=> b!1189183 m!1097399))

(declare-fun m!1097401 () Bool)

(assert (=> b!1189183 m!1097401))

(assert (=> b!1189183 m!1097401))

(declare-fun m!1097403 () Bool)

(assert (=> b!1189183 m!1097403))

(declare-fun m!1097405 () Bool)

(assert (=> b!1189183 m!1097405))

(declare-fun m!1097407 () Bool)

(assert (=> b!1189182 m!1097407))

(declare-fun m!1097409 () Bool)

(assert (=> b!1189190 m!1097409))

(declare-fun m!1097411 () Bool)

(assert (=> start!99910 m!1097411))

(declare-fun m!1097413 () Bool)

(assert (=> start!99910 m!1097413))

(declare-fun m!1097415 () Bool)

(assert (=> mapNonEmpty!46865 m!1097415))

(declare-fun m!1097417 () Bool)

(assert (=> b!1189195 m!1097417))

(declare-fun m!1097419 () Bool)

(assert (=> b!1189195 m!1097419))

(declare-fun m!1097421 () Bool)

(assert (=> b!1189195 m!1097421))

(declare-fun m!1097423 () Bool)

(assert (=> b!1189195 m!1097423))

(declare-fun m!1097425 () Bool)

(assert (=> b!1189196 m!1097425))

(declare-fun m!1097427 () Bool)

(assert (=> b!1189196 m!1097427))

(check-sat (not b!1189184) (not b!1189189) (not b!1189185) (not b!1189195) b_and!41837 (not b!1189190) (not b_lambda!20621) (not start!99910) tp_is_empty!30025 (not b!1189191) (not mapNonEmpty!46865) (not b_next!25495) (not b!1189196) (not b!1189183) (not b!1189182))
(check-sat b_and!41837 (not b_next!25495))
