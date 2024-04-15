; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99952 () Bool)

(assert start!99952)

(declare-fun b_free!25537 () Bool)

(declare-fun b_next!25537 () Bool)

(assert (=> start!99952 (= b_free!25537 (not b_next!25537))))

(declare-fun tp!89324 () Bool)

(declare-fun b_and!41919 () Bool)

(assert (=> start!99952 (= tp!89324 b_and!41919)))

(declare-fun b!1190169 () Bool)

(declare-fun res!791543 () Bool)

(declare-fun e!676605 () Bool)

(assert (=> b!1190169 (=> (not res!791543) (not e!676605))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190169 (= res!791543 (validMask!0 mask!1564))))

(declare-fun b!1190170 () Bool)

(declare-fun e!676608 () Bool)

(declare-fun e!676609 () Bool)

(declare-fun mapRes!46928 () Bool)

(assert (=> b!1190170 (= e!676608 (and e!676609 mapRes!46928))))

(declare-fun condMapEmpty!46928 () Bool)

(declare-datatypes ((V!45217 0))(
  ( (V!45218 (val!15090 Int)) )
))
(declare-datatypes ((ValueCell!14324 0))(
  ( (ValueCellFull!14324 (v!17727 V!45217)) (EmptyCell!14324) )
))
(declare-datatypes ((array!76860 0))(
  ( (array!76861 (arr!37080 (Array (_ BitVec 32) ValueCell!14324)) (size!37618 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76860)

(declare-fun mapDefault!46928 () ValueCell!14324)

(assert (=> b!1190170 (= condMapEmpty!46928 (= (arr!37080 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14324)) mapDefault!46928)))))

(declare-fun res!791539 () Bool)

(assert (=> start!99952 (=> (not res!791539) (not e!676605))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76862 0))(
  ( (array!76863 (arr!37081 (Array (_ BitVec 32) (_ BitVec 64))) (size!37619 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76862)

(assert (=> start!99952 (= res!791539 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37619 _keys!1208))))))

(assert (=> start!99952 e!676605))

(declare-fun tp_is_empty!30067 () Bool)

(assert (=> start!99952 tp_is_empty!30067))

(declare-fun array_inv!28406 (array!76862) Bool)

(assert (=> start!99952 (array_inv!28406 _keys!1208)))

(assert (=> start!99952 true))

(assert (=> start!99952 tp!89324))

(declare-fun array_inv!28407 (array!76860) Bool)

(assert (=> start!99952 (and (array_inv!28407 _values!996) e!676608)))

(declare-fun b!1190171 () Bool)

(declare-fun res!791534 () Bool)

(assert (=> b!1190171 (=> (not res!791534) (not e!676605))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190171 (= res!791534 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37619 _keys!1208))))))

(declare-fun b!1190172 () Bool)

(declare-fun res!791542 () Bool)

(assert (=> b!1190172 (=> (not res!791542) (not e!676605))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1190172 (= res!791542 (= (select (arr!37081 _keys!1208) i!673) k0!934))))

(declare-fun b!1190173 () Bool)

(declare-fun res!791545 () Bool)

(declare-fun e!676606 () Bool)

(assert (=> b!1190173 (=> (not res!791545) (not e!676606))))

(declare-fun lt!541201 () array!76862)

(declare-datatypes ((List!26213 0))(
  ( (Nil!26210) (Cons!26209 (h!27418 (_ BitVec 64)) (t!38733 List!26213)) )
))
(declare-fun arrayNoDuplicates!0 (array!76862 (_ BitVec 32) List!26213) Bool)

(assert (=> b!1190173 (= res!791545 (arrayNoDuplicates!0 lt!541201 #b00000000000000000000000000000000 Nil!26210))))

(declare-fun b!1190174 () Bool)

(declare-fun e!676610 () Bool)

(assert (=> b!1190174 (= e!676610 tp_is_empty!30067)))

(declare-fun mapNonEmpty!46928 () Bool)

(declare-fun tp!89325 () Bool)

(assert (=> mapNonEmpty!46928 (= mapRes!46928 (and tp!89325 e!676610))))

(declare-fun mapRest!46928 () (Array (_ BitVec 32) ValueCell!14324))

(declare-fun mapValue!46928 () ValueCell!14324)

(declare-fun mapKey!46928 () (_ BitVec 32))

(assert (=> mapNonEmpty!46928 (= (arr!37080 _values!996) (store mapRest!46928 mapKey!46928 mapValue!46928))))

(declare-fun b!1190175 () Bool)

(declare-fun e!676612 () Bool)

(assert (=> b!1190175 (= e!676606 (not e!676612))))

(declare-fun res!791538 () Bool)

(assert (=> b!1190175 (=> res!791538 e!676612)))

(assert (=> b!1190175 (= res!791538 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190175 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39361 0))(
  ( (Unit!39362) )
))
(declare-fun lt!541205 () Unit!39361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76862 (_ BitVec 64) (_ BitVec 32)) Unit!39361)

(assert (=> b!1190175 (= lt!541205 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190176 () Bool)

(declare-fun res!791537 () Bool)

(assert (=> b!1190176 (=> (not res!791537) (not e!676605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76862 (_ BitVec 32)) Bool)

(assert (=> b!1190176 (= res!791537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190177 () Bool)

(assert (=> b!1190177 (= e!676609 tp_is_empty!30067)))

(declare-fun b!1190178 () Bool)

(declare-fun res!791536 () Bool)

(assert (=> b!1190178 (=> (not res!791536) (not e!676605))))

(assert (=> b!1190178 (= res!791536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26210))))

(declare-fun b!1190179 () Bool)

(assert (=> b!1190179 (= e!676605 e!676606)))

(declare-fun res!791535 () Bool)

(assert (=> b!1190179 (=> (not res!791535) (not e!676606))))

(assert (=> b!1190179 (= res!791535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541201 mask!1564))))

(assert (=> b!1190179 (= lt!541201 (array!76863 (store (arr!37081 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37619 _keys!1208)))))

(declare-fun b!1190180 () Bool)

(declare-fun e!676611 () Bool)

(assert (=> b!1190180 (= e!676612 e!676611)))

(declare-fun res!791544 () Bool)

(assert (=> b!1190180 (=> res!791544 e!676611)))

(assert (=> b!1190180 (= res!791544 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45217)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45217)

(declare-datatypes ((tuple2!19498 0))(
  ( (tuple2!19499 (_1!9760 (_ BitVec 64)) (_2!9760 V!45217)) )
))
(declare-datatypes ((List!26214 0))(
  ( (Nil!26211) (Cons!26210 (h!27419 tuple2!19498) (t!38734 List!26214)) )
))
(declare-datatypes ((ListLongMap!17467 0))(
  ( (ListLongMap!17468 (toList!8749 List!26214)) )
))
(declare-fun lt!541202 () ListLongMap!17467)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541204 () array!76860)

(declare-fun getCurrentListMapNoExtraKeys!5199 (array!76862 array!76860 (_ BitVec 32) (_ BitVec 32) V!45217 V!45217 (_ BitVec 32) Int) ListLongMap!17467)

(assert (=> b!1190180 (= lt!541202 (getCurrentListMapNoExtraKeys!5199 lt!541201 lt!541204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3092 (Int (_ BitVec 64)) V!45217)

(assert (=> b!1190180 (= lt!541204 (array!76861 (store (arr!37080 _values!996) i!673 (ValueCellFull!14324 (dynLambda!3092 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37618 _values!996)))))

(declare-fun lt!541203 () ListLongMap!17467)

(assert (=> b!1190180 (= lt!541203 (getCurrentListMapNoExtraKeys!5199 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190181 () Bool)

(declare-fun res!791541 () Bool)

(assert (=> b!1190181 (=> (not res!791541) (not e!676605))))

(assert (=> b!1190181 (= res!791541 (and (= (size!37618 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37619 _keys!1208) (size!37618 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46928 () Bool)

(assert (=> mapIsEmpty!46928 mapRes!46928))

(declare-fun b!1190182 () Bool)

(assert (=> b!1190182 (= e!676611 true)))

(declare-fun -!1695 (ListLongMap!17467 (_ BitVec 64)) ListLongMap!17467)

(assert (=> b!1190182 (= (getCurrentListMapNoExtraKeys!5199 lt!541201 lt!541204 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1695 (getCurrentListMapNoExtraKeys!5199 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541206 () Unit!39361)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!945 (array!76862 array!76860 (_ BitVec 32) (_ BitVec 32) V!45217 V!45217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39361)

(assert (=> b!1190182 (= lt!541206 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!945 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190183 () Bool)

(declare-fun res!791540 () Bool)

(assert (=> b!1190183 (=> (not res!791540) (not e!676605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190183 (= res!791540 (validKeyInArray!0 k0!934))))

(assert (= (and start!99952 res!791539) b!1190169))

(assert (= (and b!1190169 res!791543) b!1190181))

(assert (= (and b!1190181 res!791541) b!1190176))

(assert (= (and b!1190176 res!791537) b!1190178))

(assert (= (and b!1190178 res!791536) b!1190171))

(assert (= (and b!1190171 res!791534) b!1190183))

(assert (= (and b!1190183 res!791540) b!1190172))

(assert (= (and b!1190172 res!791542) b!1190179))

(assert (= (and b!1190179 res!791535) b!1190173))

(assert (= (and b!1190173 res!791545) b!1190175))

(assert (= (and b!1190175 (not res!791538)) b!1190180))

(assert (= (and b!1190180 (not res!791544)) b!1190182))

(assert (= (and b!1190170 condMapEmpty!46928) mapIsEmpty!46928))

(assert (= (and b!1190170 (not condMapEmpty!46928)) mapNonEmpty!46928))

(get-info :version)

(assert (= (and mapNonEmpty!46928 ((_ is ValueCellFull!14324) mapValue!46928)) b!1190174))

(assert (= (and b!1190170 ((_ is ValueCellFull!14324) mapDefault!46928)) b!1190177))

(assert (= start!99952 b!1190170))

(declare-fun b_lambda!20663 () Bool)

(assert (=> (not b_lambda!20663) (not b!1190180)))

(declare-fun t!38732 () Bool)

(declare-fun tb!10341 () Bool)

(assert (=> (and start!99952 (= defaultEntry!1004 defaultEntry!1004) t!38732) tb!10341))

(declare-fun result!21257 () Bool)

(assert (=> tb!10341 (= result!21257 tp_is_empty!30067)))

(assert (=> b!1190180 t!38732))

(declare-fun b_and!41921 () Bool)

(assert (= b_and!41919 (and (=> t!38732 result!21257) b_and!41921)))

(declare-fun m!1098269 () Bool)

(assert (=> b!1190183 m!1098269))

(declare-fun m!1098271 () Bool)

(assert (=> mapNonEmpty!46928 m!1098271))

(declare-fun m!1098273 () Bool)

(assert (=> b!1190178 m!1098273))

(declare-fun m!1098275 () Bool)

(assert (=> b!1190173 m!1098275))

(declare-fun m!1098277 () Bool)

(assert (=> b!1190175 m!1098277))

(declare-fun m!1098279 () Bool)

(assert (=> b!1190175 m!1098279))

(declare-fun m!1098281 () Bool)

(assert (=> b!1190179 m!1098281))

(declare-fun m!1098283 () Bool)

(assert (=> b!1190179 m!1098283))

(declare-fun m!1098285 () Bool)

(assert (=> b!1190182 m!1098285))

(declare-fun m!1098287 () Bool)

(assert (=> b!1190182 m!1098287))

(assert (=> b!1190182 m!1098287))

(declare-fun m!1098289 () Bool)

(assert (=> b!1190182 m!1098289))

(declare-fun m!1098291 () Bool)

(assert (=> b!1190182 m!1098291))

(declare-fun m!1098293 () Bool)

(assert (=> b!1190176 m!1098293))

(declare-fun m!1098295 () Bool)

(assert (=> b!1190180 m!1098295))

(declare-fun m!1098297 () Bool)

(assert (=> b!1190180 m!1098297))

(declare-fun m!1098299 () Bool)

(assert (=> b!1190180 m!1098299))

(declare-fun m!1098301 () Bool)

(assert (=> b!1190180 m!1098301))

(declare-fun m!1098303 () Bool)

(assert (=> b!1190169 m!1098303))

(declare-fun m!1098305 () Bool)

(assert (=> start!99952 m!1098305))

(declare-fun m!1098307 () Bool)

(assert (=> start!99952 m!1098307))

(declare-fun m!1098309 () Bool)

(assert (=> b!1190172 m!1098309))

(check-sat (not b!1190180) (not b!1190169) b_and!41921 (not b_next!25537) (not b!1190178) (not b!1190176) (not mapNonEmpty!46928) (not start!99952) (not b!1190182) (not b!1190183) (not b!1190179) tp_is_empty!30067 (not b_lambda!20663) (not b!1190175) (not b!1190173))
(check-sat b_and!41921 (not b_next!25537))
