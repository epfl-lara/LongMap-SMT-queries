; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98110 () Bool)

(assert start!98110)

(declare-fun b_free!23811 () Bool)

(declare-fun b_next!23811 () Bool)

(assert (=> start!98110 (= b_free!23811 (not b_next!23811))))

(declare-fun tp!84137 () Bool)

(declare-fun b_and!38405 () Bool)

(assert (=> start!98110 (= tp!84137 b_and!38405)))

(declare-fun b!1127307 () Bool)

(declare-fun e!641632 () Bool)

(declare-fun e!641637 () Bool)

(assert (=> b!1127307 (= e!641632 (not e!641637))))

(declare-fun res!753330 () Bool)

(assert (=> b!1127307 (=> res!753330 e!641637)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127307 (= res!753330 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73543 0))(
  ( (array!73544 (arr!35424 (Array (_ BitVec 32) (_ BitVec 64))) (size!35960 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73543)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127307 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36938 0))(
  ( (Unit!36939) )
))
(declare-fun lt!500541 () Unit!36938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73543 (_ BitVec 64) (_ BitVec 32)) Unit!36938)

(assert (=> b!1127307 (= lt!500541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44329 () Bool)

(declare-fun mapRes!44329 () Bool)

(declare-fun tp!84136 () Bool)

(declare-fun e!641636 () Bool)

(assert (=> mapNonEmpty!44329 (= mapRes!44329 (and tp!84136 e!641636))))

(declare-datatypes ((V!42915 0))(
  ( (V!42916 (val!14227 Int)) )
))
(declare-datatypes ((ValueCell!13461 0))(
  ( (ValueCellFull!13461 (v!16860 V!42915)) (EmptyCell!13461) )
))
(declare-fun mapValue!44329 () ValueCell!13461)

(declare-fun mapKey!44329 () (_ BitVec 32))

(declare-datatypes ((array!73545 0))(
  ( (array!73546 (arr!35425 (Array (_ BitVec 32) ValueCell!13461)) (size!35961 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73545)

(declare-fun mapRest!44329 () (Array (_ BitVec 32) ValueCell!13461))

(assert (=> mapNonEmpty!44329 (= (arr!35425 _values!996) (store mapRest!44329 mapKey!44329 mapValue!44329))))

(declare-fun b!1127308 () Bool)

(declare-fun res!753337 () Bool)

(declare-fun e!641633 () Bool)

(assert (=> b!1127308 (=> (not res!753337) (not e!641633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127308 (= res!753337 (validKeyInArray!0 k0!934))))

(declare-fun b!1127309 () Bool)

(declare-fun res!753336 () Bool)

(assert (=> b!1127309 (=> (not res!753336) (not e!641633))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73543 (_ BitVec 32)) Bool)

(assert (=> b!1127309 (= res!753336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44329 () Bool)

(assert (=> mapIsEmpty!44329 mapRes!44329))

(declare-fun b!1127310 () Bool)

(declare-fun res!753329 () Bool)

(assert (=> b!1127310 (=> (not res!753329) (not e!641633))))

(declare-datatypes ((List!24666 0))(
  ( (Nil!24663) (Cons!24662 (h!25871 (_ BitVec 64)) (t!35469 List!24666)) )
))
(declare-fun arrayNoDuplicates!0 (array!73543 (_ BitVec 32) List!24666) Bool)

(assert (=> b!1127310 (= res!753329 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24663))))

(declare-fun b!1127311 () Bool)

(declare-datatypes ((tuple2!17894 0))(
  ( (tuple2!17895 (_1!8958 (_ BitVec 64)) (_2!8958 V!42915)) )
))
(declare-datatypes ((List!24667 0))(
  ( (Nil!24664) (Cons!24663 (h!25872 tuple2!17894) (t!35470 List!24667)) )
))
(declare-datatypes ((ListLongMap!15863 0))(
  ( (ListLongMap!15864 (toList!7947 List!24667)) )
))
(declare-fun call!47715 () ListLongMap!15863)

(declare-fun call!47716 () ListLongMap!15863)

(declare-fun e!641629 () Bool)

(declare-fun -!1137 (ListLongMap!15863 (_ BitVec 64)) ListLongMap!15863)

(assert (=> b!1127311 (= e!641629 (= call!47716 (-!1137 call!47715 k0!934)))))

(declare-fun b!1127312 () Bool)

(declare-fun e!641635 () Bool)

(declare-fun e!641631 () Bool)

(assert (=> b!1127312 (= e!641635 (and e!641631 mapRes!44329))))

(declare-fun condMapEmpty!44329 () Bool)

(declare-fun mapDefault!44329 () ValueCell!13461)

(assert (=> b!1127312 (= condMapEmpty!44329 (= (arr!35425 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13461)) mapDefault!44329)))))

(declare-fun b!1127313 () Bool)

(declare-fun e!641628 () Bool)

(assert (=> b!1127313 (= e!641637 e!641628)))

(declare-fun res!753331 () Bool)

(assert (=> b!1127313 (=> res!753331 e!641628)))

(assert (=> b!1127313 (= res!753331 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42915)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!500543 () array!73545)

(declare-fun lt!500540 () ListLongMap!15863)

(declare-fun lt!500537 () array!73543)

(declare-fun minValue!944 () V!42915)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4435 (array!73543 array!73545 (_ BitVec 32) (_ BitVec 32) V!42915 V!42915 (_ BitVec 32) Int) ListLongMap!15863)

(assert (=> b!1127313 (= lt!500540 (getCurrentListMapNoExtraKeys!4435 lt!500537 lt!500543 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2522 (Int (_ BitVec 64)) V!42915)

(assert (=> b!1127313 (= lt!500543 (array!73546 (store (arr!35425 _values!996) i!673 (ValueCellFull!13461 (dynLambda!2522 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35961 _values!996)))))

(declare-fun lt!500538 () ListLongMap!15863)

(assert (=> b!1127313 (= lt!500538 (getCurrentListMapNoExtraKeys!4435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!753325 () Bool)

(assert (=> start!98110 (=> (not res!753325) (not e!641633))))

(assert (=> start!98110 (= res!753325 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35960 _keys!1208))))))

(assert (=> start!98110 e!641633))

(declare-fun tp_is_empty!28341 () Bool)

(assert (=> start!98110 tp_is_empty!28341))

(declare-fun array_inv!27184 (array!73543) Bool)

(assert (=> start!98110 (array_inv!27184 _keys!1208)))

(assert (=> start!98110 true))

(assert (=> start!98110 tp!84137))

(declare-fun array_inv!27185 (array!73545) Bool)

(assert (=> start!98110 (and (array_inv!27185 _values!996) e!641635)))

(declare-fun b!1127314 () Bool)

(assert (=> b!1127314 (= e!641633 e!641632)))

(declare-fun res!753334 () Bool)

(assert (=> b!1127314 (=> (not res!753334) (not e!641632))))

(assert (=> b!1127314 (= res!753334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500537 mask!1564))))

(assert (=> b!1127314 (= lt!500537 (array!73544 (store (arr!35424 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35960 _keys!1208)))))

(declare-fun b!1127315 () Bool)

(assert (=> b!1127315 (= e!641631 tp_is_empty!28341)))

(declare-fun bm!47712 () Bool)

(assert (=> bm!47712 (= call!47716 (getCurrentListMapNoExtraKeys!4435 lt!500537 lt!500543 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127316 () Bool)

(assert (=> b!1127316 (= e!641629 (= call!47716 call!47715))))

(declare-fun b!1127317 () Bool)

(declare-fun res!753326 () Bool)

(assert (=> b!1127317 (=> (not res!753326) (not e!641633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127317 (= res!753326 (validMask!0 mask!1564))))

(declare-fun b!1127318 () Bool)

(declare-fun res!753333 () Bool)

(assert (=> b!1127318 (=> (not res!753333) (not e!641633))))

(assert (=> b!1127318 (= res!753333 (= (select (arr!35424 _keys!1208) i!673) k0!934))))

(declare-fun b!1127319 () Bool)

(declare-fun e!641630 () Bool)

(assert (=> b!1127319 (= e!641630 true)))

(declare-fun lt!500539 () Bool)

(declare-fun contains!6477 (ListLongMap!15863 (_ BitVec 64)) Bool)

(assert (=> b!1127319 (= lt!500539 (contains!6477 (getCurrentListMapNoExtraKeys!4435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127320 () Bool)

(declare-fun res!753332 () Bool)

(assert (=> b!1127320 (=> (not res!753332) (not e!641632))))

(assert (=> b!1127320 (= res!753332 (arrayNoDuplicates!0 lt!500537 #b00000000000000000000000000000000 Nil!24663))))

(declare-fun b!1127321 () Bool)

(declare-fun res!753335 () Bool)

(assert (=> b!1127321 (=> (not res!753335) (not e!641633))))

(assert (=> b!1127321 (= res!753335 (and (= (size!35961 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35960 _keys!1208) (size!35961 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127322 () Bool)

(assert (=> b!1127322 (= e!641636 tp_is_empty!28341)))

(declare-fun b!1127323 () Bool)

(assert (=> b!1127323 (= e!641628 e!641630)))

(declare-fun res!753327 () Bool)

(assert (=> b!1127323 (=> res!753327 e!641630)))

(assert (=> b!1127323 (= res!753327 (not (= (select (arr!35424 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127323 e!641629))

(declare-fun c!109707 () Bool)

(assert (=> b!1127323 (= c!109707 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500542 () Unit!36938)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!389 (array!73543 array!73545 (_ BitVec 32) (_ BitVec 32) V!42915 V!42915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36938)

(assert (=> b!1127323 (= lt!500542 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127324 () Bool)

(declare-fun res!753328 () Bool)

(assert (=> b!1127324 (=> (not res!753328) (not e!641633))))

(assert (=> b!1127324 (= res!753328 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35960 _keys!1208))))))

(declare-fun bm!47713 () Bool)

(assert (=> bm!47713 (= call!47715 (getCurrentListMapNoExtraKeys!4435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98110 res!753325) b!1127317))

(assert (= (and b!1127317 res!753326) b!1127321))

(assert (= (and b!1127321 res!753335) b!1127309))

(assert (= (and b!1127309 res!753336) b!1127310))

(assert (= (and b!1127310 res!753329) b!1127324))

(assert (= (and b!1127324 res!753328) b!1127308))

(assert (= (and b!1127308 res!753337) b!1127318))

(assert (= (and b!1127318 res!753333) b!1127314))

(assert (= (and b!1127314 res!753334) b!1127320))

(assert (= (and b!1127320 res!753332) b!1127307))

(assert (= (and b!1127307 (not res!753330)) b!1127313))

(assert (= (and b!1127313 (not res!753331)) b!1127323))

(assert (= (and b!1127323 c!109707) b!1127311))

(assert (= (and b!1127323 (not c!109707)) b!1127316))

(assert (= (or b!1127311 b!1127316) bm!47712))

(assert (= (or b!1127311 b!1127316) bm!47713))

(assert (= (and b!1127323 (not res!753327)) b!1127319))

(assert (= (and b!1127312 condMapEmpty!44329) mapIsEmpty!44329))

(assert (= (and b!1127312 (not condMapEmpty!44329)) mapNonEmpty!44329))

(get-info :version)

(assert (= (and mapNonEmpty!44329 ((_ is ValueCellFull!13461) mapValue!44329)) b!1127322))

(assert (= (and b!1127312 ((_ is ValueCellFull!13461) mapDefault!44329)) b!1127315))

(assert (= start!98110 b!1127312))

(declare-fun b_lambda!18781 () Bool)

(assert (=> (not b_lambda!18781) (not b!1127313)))

(declare-fun t!35468 () Bool)

(declare-fun tb!8623 () Bool)

(assert (=> (and start!98110 (= defaultEntry!1004 defaultEntry!1004) t!35468) tb!8623))

(declare-fun result!17807 () Bool)

(assert (=> tb!8623 (= result!17807 tp_is_empty!28341)))

(assert (=> b!1127313 t!35468))

(declare-fun b_and!38407 () Bool)

(assert (= b_and!38405 (and (=> t!35468 result!17807) b_and!38407)))

(declare-fun m!1041109 () Bool)

(assert (=> mapNonEmpty!44329 m!1041109))

(declare-fun m!1041111 () Bool)

(assert (=> b!1127317 m!1041111))

(declare-fun m!1041113 () Bool)

(assert (=> b!1127320 m!1041113))

(declare-fun m!1041115 () Bool)

(assert (=> b!1127311 m!1041115))

(declare-fun m!1041117 () Bool)

(assert (=> b!1127308 m!1041117))

(declare-fun m!1041119 () Bool)

(assert (=> b!1127319 m!1041119))

(assert (=> b!1127319 m!1041119))

(declare-fun m!1041121 () Bool)

(assert (=> b!1127319 m!1041121))

(assert (=> bm!47713 m!1041119))

(declare-fun m!1041123 () Bool)

(assert (=> b!1127310 m!1041123))

(declare-fun m!1041125 () Bool)

(assert (=> b!1127313 m!1041125))

(declare-fun m!1041127 () Bool)

(assert (=> b!1127313 m!1041127))

(declare-fun m!1041129 () Bool)

(assert (=> b!1127313 m!1041129))

(declare-fun m!1041131 () Bool)

(assert (=> b!1127313 m!1041131))

(declare-fun m!1041133 () Bool)

(assert (=> b!1127314 m!1041133))

(declare-fun m!1041135 () Bool)

(assert (=> b!1127314 m!1041135))

(declare-fun m!1041137 () Bool)

(assert (=> b!1127318 m!1041137))

(declare-fun m!1041139 () Bool)

(assert (=> b!1127309 m!1041139))

(declare-fun m!1041141 () Bool)

(assert (=> bm!47712 m!1041141))

(declare-fun m!1041143 () Bool)

(assert (=> b!1127307 m!1041143))

(declare-fun m!1041145 () Bool)

(assert (=> b!1127307 m!1041145))

(declare-fun m!1041147 () Bool)

(assert (=> start!98110 m!1041147))

(declare-fun m!1041149 () Bool)

(assert (=> start!98110 m!1041149))

(declare-fun m!1041151 () Bool)

(assert (=> b!1127323 m!1041151))

(declare-fun m!1041153 () Bool)

(assert (=> b!1127323 m!1041153))

(check-sat (not b_lambda!18781) (not b!1127317) (not b!1127323) (not b!1127319) (not b!1127313) b_and!38407 (not mapNonEmpty!44329) (not b!1127311) (not b!1127308) (not start!98110) (not b!1127320) (not b!1127314) (not bm!47713) (not b_next!23811) (not b!1127309) (not b!1127307) (not b!1127310) tp_is_empty!28341 (not bm!47712))
(check-sat b_and!38407 (not b_next!23811))
