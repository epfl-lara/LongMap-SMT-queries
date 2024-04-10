; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100038 () Bool)

(assert start!100038)

(declare-fun b_free!25617 () Bool)

(declare-fun b_next!25617 () Bool)

(assert (=> start!100038 (= b_free!25617 (not b_next!25617))))

(declare-fun tp!89564 () Bool)

(declare-fun b_and!42101 () Bool)

(assert (=> start!100038 (= tp!89564 b_and!42101)))

(declare-fun b!1192173 () Bool)

(declare-fun e!677644 () Bool)

(declare-fun e!677647 () Bool)

(assert (=> b!1192173 (= e!677644 (not e!677647))))

(declare-fun res!793050 () Bool)

(assert (=> b!1192173 (=> res!793050 e!677647)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192173 (= res!793050 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77083 0))(
  ( (array!77084 (arr!37191 (Array (_ BitVec 32) (_ BitVec 64))) (size!37727 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77083)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192173 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39550 0))(
  ( (Unit!39551) )
))
(declare-fun lt!542118 () Unit!39550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77083 (_ BitVec 64) (_ BitVec 32)) Unit!39550)

(assert (=> b!1192173 (= lt!542118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192174 () Bool)

(declare-fun res!793049 () Bool)

(declare-fun e!677645 () Bool)

(assert (=> b!1192174 (=> (not res!793049) (not e!677645))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77083 (_ BitVec 32)) Bool)

(assert (=> b!1192174 (= res!793049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192175 () Bool)

(declare-fun res!793048 () Bool)

(assert (=> b!1192175 (=> (not res!793048) (not e!677644))))

(declare-fun lt!542117 () array!77083)

(declare-datatypes ((List!26191 0))(
  ( (Nil!26188) (Cons!26187 (h!27396 (_ BitVec 64)) (t!38800 List!26191)) )
))
(declare-fun arrayNoDuplicates!0 (array!77083 (_ BitVec 32) List!26191) Bool)

(assert (=> b!1192175 (= res!793048 (arrayNoDuplicates!0 lt!542117 #b00000000000000000000000000000000 Nil!26188))))

(declare-fun b!1192176 () Bool)

(declare-fun e!677650 () Bool)

(declare-fun e!677643 () Bool)

(declare-fun mapRes!47048 () Bool)

(assert (=> b!1192176 (= e!677650 (and e!677643 mapRes!47048))))

(declare-fun condMapEmpty!47048 () Bool)

(declare-datatypes ((V!45323 0))(
  ( (V!45324 (val!15130 Int)) )
))
(declare-datatypes ((ValueCell!14364 0))(
  ( (ValueCellFull!14364 (v!17768 V!45323)) (EmptyCell!14364) )
))
(declare-datatypes ((array!77085 0))(
  ( (array!77086 (arr!37192 (Array (_ BitVec 32) ValueCell!14364)) (size!37728 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77085)

(declare-fun mapDefault!47048 () ValueCell!14364)

(assert (=> b!1192176 (= condMapEmpty!47048 (= (arr!37192 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14364)) mapDefault!47048)))))

(declare-fun b!1192177 () Bool)

(declare-fun res!793043 () Bool)

(assert (=> b!1192177 (=> (not res!793043) (not e!677645))))

(assert (=> b!1192177 (= res!793043 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26188))))

(declare-fun b!1192178 () Bool)

(assert (=> b!1192178 (= e!677645 e!677644)))

(declare-fun res!793040 () Bool)

(assert (=> b!1192178 (=> (not res!793040) (not e!677644))))

(assert (=> b!1192178 (= res!793040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542117 mask!1564))))

(assert (=> b!1192178 (= lt!542117 (array!77084 (store (arr!37191 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37727 _keys!1208)))))

(declare-fun b!1192179 () Bool)

(declare-fun res!793044 () Bool)

(assert (=> b!1192179 (=> (not res!793044) (not e!677645))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1192179 (= res!793044 (and (= (size!37728 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37727 _keys!1208) (size!37728 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!793041 () Bool)

(assert (=> start!100038 (=> (not res!793041) (not e!677645))))

(assert (=> start!100038 (= res!793041 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37727 _keys!1208))))))

(assert (=> start!100038 e!677645))

(declare-fun tp_is_empty!30147 () Bool)

(assert (=> start!100038 tp_is_empty!30147))

(declare-fun array_inv!28360 (array!77083) Bool)

(assert (=> start!100038 (array_inv!28360 _keys!1208)))

(assert (=> start!100038 true))

(assert (=> start!100038 tp!89564))

(declare-fun array_inv!28361 (array!77085) Bool)

(assert (=> start!100038 (and (array_inv!28361 _values!996) e!677650)))

(declare-fun b!1192180 () Bool)

(declare-fun e!677649 () Bool)

(assert (=> b!1192180 (= e!677649 tp_is_empty!30147)))

(declare-fun b!1192181 () Bool)

(declare-fun res!793047 () Bool)

(assert (=> b!1192181 (=> (not res!793047) (not e!677645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192181 (= res!793047 (validMask!0 mask!1564))))

(declare-fun b!1192182 () Bool)

(declare-fun res!793051 () Bool)

(assert (=> b!1192182 (=> (not res!793051) (not e!677645))))

(assert (=> b!1192182 (= res!793051 (= (select (arr!37191 _keys!1208) i!673) k0!934))))

(declare-fun b!1192183 () Bool)

(declare-fun e!677646 () Bool)

(assert (=> b!1192183 (= e!677646 true)))

(declare-fun zeroValue!944 () V!45323)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542114 () array!77085)

(declare-fun minValue!944 () V!45323)

(declare-datatypes ((tuple2!19448 0))(
  ( (tuple2!19449 (_1!9735 (_ BitVec 64)) (_2!9735 V!45323)) )
))
(declare-datatypes ((List!26192 0))(
  ( (Nil!26189) (Cons!26188 (h!27397 tuple2!19448) (t!38801 List!26192)) )
))
(declare-datatypes ((ListLongMap!17417 0))(
  ( (ListLongMap!17418 (toList!8724 List!26192)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5165 (array!77083 array!77085 (_ BitVec 32) (_ BitVec 32) V!45323 V!45323 (_ BitVec 32) Int) ListLongMap!17417)

(declare-fun -!1749 (ListLongMap!17417 (_ BitVec 64)) ListLongMap!17417)

(assert (=> b!1192183 (= (getCurrentListMapNoExtraKeys!5165 lt!542117 lt!542114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1749 (getCurrentListMapNoExtraKeys!5165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542116 () Unit!39550)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!958 (array!77083 array!77085 (_ BitVec 32) (_ BitVec 32) V!45323 V!45323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39550)

(assert (=> b!1192183 (= lt!542116 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47048 () Bool)

(assert (=> mapIsEmpty!47048 mapRes!47048))

(declare-fun b!1192184 () Bool)

(declare-fun res!793042 () Bool)

(assert (=> b!1192184 (=> (not res!793042) (not e!677645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192184 (= res!793042 (validKeyInArray!0 k0!934))))

(declare-fun b!1192185 () Bool)

(assert (=> b!1192185 (= e!677643 tp_is_empty!30147)))

(declare-fun b!1192186 () Bool)

(declare-fun res!793046 () Bool)

(assert (=> b!1192186 (=> (not res!793046) (not e!677645))))

(assert (=> b!1192186 (= res!793046 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37727 _keys!1208))))))

(declare-fun mapNonEmpty!47048 () Bool)

(declare-fun tp!89565 () Bool)

(assert (=> mapNonEmpty!47048 (= mapRes!47048 (and tp!89565 e!677649))))

(declare-fun mapValue!47048 () ValueCell!14364)

(declare-fun mapKey!47048 () (_ BitVec 32))

(declare-fun mapRest!47048 () (Array (_ BitVec 32) ValueCell!14364))

(assert (=> mapNonEmpty!47048 (= (arr!37192 _values!996) (store mapRest!47048 mapKey!47048 mapValue!47048))))

(declare-fun b!1192187 () Bool)

(assert (=> b!1192187 (= e!677647 e!677646)))

(declare-fun res!793045 () Bool)

(assert (=> b!1192187 (=> res!793045 e!677646)))

(assert (=> b!1192187 (= res!793045 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542113 () ListLongMap!17417)

(assert (=> b!1192187 (= lt!542113 (getCurrentListMapNoExtraKeys!5165 lt!542117 lt!542114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3098 (Int (_ BitVec 64)) V!45323)

(assert (=> b!1192187 (= lt!542114 (array!77086 (store (arr!37192 _values!996) i!673 (ValueCellFull!14364 (dynLambda!3098 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37728 _values!996)))))

(declare-fun lt!542115 () ListLongMap!17417)

(assert (=> b!1192187 (= lt!542115 (getCurrentListMapNoExtraKeys!5165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100038 res!793041) b!1192181))

(assert (= (and b!1192181 res!793047) b!1192179))

(assert (= (and b!1192179 res!793044) b!1192174))

(assert (= (and b!1192174 res!793049) b!1192177))

(assert (= (and b!1192177 res!793043) b!1192186))

(assert (= (and b!1192186 res!793046) b!1192184))

(assert (= (and b!1192184 res!793042) b!1192182))

(assert (= (and b!1192182 res!793051) b!1192178))

(assert (= (and b!1192178 res!793040) b!1192175))

(assert (= (and b!1192175 res!793048) b!1192173))

(assert (= (and b!1192173 (not res!793050)) b!1192187))

(assert (= (and b!1192187 (not res!793045)) b!1192183))

(assert (= (and b!1192176 condMapEmpty!47048) mapIsEmpty!47048))

(assert (= (and b!1192176 (not condMapEmpty!47048)) mapNonEmpty!47048))

(get-info :version)

(assert (= (and mapNonEmpty!47048 ((_ is ValueCellFull!14364) mapValue!47048)) b!1192180))

(assert (= (and b!1192176 ((_ is ValueCellFull!14364) mapDefault!47048)) b!1192185))

(assert (= start!100038 b!1192176))

(declare-fun b_lambda!20761 () Bool)

(assert (=> (not b_lambda!20761) (not b!1192187)))

(declare-fun t!38799 () Bool)

(declare-fun tb!10429 () Bool)

(assert (=> (and start!100038 (= defaultEntry!1004 defaultEntry!1004) t!38799) tb!10429))

(declare-fun result!21425 () Bool)

(assert (=> tb!10429 (= result!21425 tp_is_empty!30147)))

(assert (=> b!1192187 t!38799))

(declare-fun b_and!42103 () Bool)

(assert (= b_and!42101 (and (=> t!38799 result!21425) b_and!42103)))

(declare-fun m!1100559 () Bool)

(assert (=> mapNonEmpty!47048 m!1100559))

(declare-fun m!1100561 () Bool)

(assert (=> b!1192183 m!1100561))

(declare-fun m!1100563 () Bool)

(assert (=> b!1192183 m!1100563))

(assert (=> b!1192183 m!1100563))

(declare-fun m!1100565 () Bool)

(assert (=> b!1192183 m!1100565))

(declare-fun m!1100567 () Bool)

(assert (=> b!1192183 m!1100567))

(declare-fun m!1100569 () Bool)

(assert (=> b!1192174 m!1100569))

(declare-fun m!1100571 () Bool)

(assert (=> b!1192173 m!1100571))

(declare-fun m!1100573 () Bool)

(assert (=> b!1192173 m!1100573))

(declare-fun m!1100575 () Bool)

(assert (=> b!1192182 m!1100575))

(declare-fun m!1100577 () Bool)

(assert (=> b!1192184 m!1100577))

(declare-fun m!1100579 () Bool)

(assert (=> start!100038 m!1100579))

(declare-fun m!1100581 () Bool)

(assert (=> start!100038 m!1100581))

(declare-fun m!1100583 () Bool)

(assert (=> b!1192178 m!1100583))

(declare-fun m!1100585 () Bool)

(assert (=> b!1192178 m!1100585))

(declare-fun m!1100587 () Bool)

(assert (=> b!1192181 m!1100587))

(declare-fun m!1100589 () Bool)

(assert (=> b!1192175 m!1100589))

(declare-fun m!1100591 () Bool)

(assert (=> b!1192177 m!1100591))

(declare-fun m!1100593 () Bool)

(assert (=> b!1192187 m!1100593))

(declare-fun m!1100595 () Bool)

(assert (=> b!1192187 m!1100595))

(declare-fun m!1100597 () Bool)

(assert (=> b!1192187 m!1100597))

(declare-fun m!1100599 () Bool)

(assert (=> b!1192187 m!1100599))

(check-sat (not b_lambda!20761) tp_is_empty!30147 (not b!1192177) (not b!1192181) (not mapNonEmpty!47048) (not b!1192173) b_and!42103 (not b_next!25617) (not b!1192183) (not b!1192175) (not b!1192178) (not b!1192187) (not start!100038) (not b!1192174) (not b!1192184))
(check-sat b_and!42103 (not b_next!25617))
