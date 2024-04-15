; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98108 () Bool)

(assert start!98108)

(declare-fun b_free!23815 () Bool)

(declare-fun b_next!23815 () Bool)

(assert (=> start!98108 (= b_free!23815 (not b_next!23815))))

(declare-fun tp!84148 () Bool)

(declare-fun b_and!38391 () Bool)

(assert (=> start!98108 (= tp!84148 b_and!38391)))

(declare-fun b!1127290 () Bool)

(declare-fun e!641616 () Bool)

(assert (=> b!1127290 (= e!641616 true)))

(declare-datatypes ((V!42921 0))(
  ( (V!42922 (val!14229 Int)) )
))
(declare-fun zeroValue!944 () V!42921)

(declare-datatypes ((array!73476 0))(
  ( (array!73477 (arr!35391 (Array (_ BitVec 32) (_ BitVec 64))) (size!35929 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73476)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500381 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13463 0))(
  ( (ValueCellFull!13463 (v!16861 V!42921)) (EmptyCell!13463) )
))
(declare-datatypes ((array!73478 0))(
  ( (array!73479 (arr!35392 (Array (_ BitVec 32) ValueCell!13463)) (size!35930 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73478)

(declare-fun minValue!944 () V!42921)

(declare-datatypes ((tuple2!17992 0))(
  ( (tuple2!17993 (_1!9007 (_ BitVec 64)) (_2!9007 V!42921)) )
))
(declare-datatypes ((List!24748 0))(
  ( (Nil!24745) (Cons!24744 (h!25953 tuple2!17992) (t!35546 List!24748)) )
))
(declare-datatypes ((ListLongMap!15961 0))(
  ( (ListLongMap!15962 (toList!7996 List!24748)) )
))
(declare-fun contains!6454 (ListLongMap!15961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4496 (array!73476 array!73478 (_ BitVec 32) (_ BitVec 32) V!42921 V!42921 (_ BitVec 32) Int) ListLongMap!15961)

(assert (=> b!1127290 (= lt!500381 (contains!6454 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127291 () Bool)

(declare-fun e!641613 () Bool)

(declare-fun e!641612 () Bool)

(assert (=> b!1127291 (= e!641613 e!641612)))

(declare-fun res!753339 () Bool)

(assert (=> b!1127291 (=> res!753339 e!641612)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127291 (= res!753339 (not (= from!1455 i!673)))))

(declare-fun lt!500379 () ListLongMap!15961)

(declare-fun lt!500384 () array!73478)

(declare-fun lt!500385 () array!73476)

(assert (=> b!1127291 (= lt!500379 (getCurrentListMapNoExtraKeys!4496 lt!500385 lt!500384 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2508 (Int (_ BitVec 64)) V!42921)

(assert (=> b!1127291 (= lt!500384 (array!73479 (store (arr!35392 _values!996) i!673 (ValueCellFull!13463 (dynLambda!2508 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35930 _values!996)))))

(declare-fun lt!500380 () ListLongMap!15961)

(assert (=> b!1127291 (= lt!500380 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127292 () Bool)

(declare-fun e!641614 () Bool)

(declare-fun tp_is_empty!28345 () Bool)

(assert (=> b!1127292 (= e!641614 tp_is_empty!28345)))

(declare-fun b!1127293 () Bool)

(declare-fun res!753344 () Bool)

(declare-fun e!641610 () Bool)

(assert (=> b!1127293 (=> (not res!753344) (not e!641610))))

(declare-datatypes ((List!24749 0))(
  ( (Nil!24746) (Cons!24745 (h!25954 (_ BitVec 64)) (t!35547 List!24749)) )
))
(declare-fun arrayNoDuplicates!0 (array!73476 (_ BitVec 32) List!24749) Bool)

(assert (=> b!1127293 (= res!753344 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24746))))

(declare-fun b!1127294 () Bool)

(declare-fun res!753334 () Bool)

(assert (=> b!1127294 (=> (not res!753334) (not e!641610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127294 (= res!753334 (validMask!0 mask!1564))))

(declare-fun b!1127295 () Bool)

(declare-fun e!641609 () Bool)

(assert (=> b!1127295 (= e!641609 (not e!641613))))

(declare-fun res!753346 () Bool)

(assert (=> b!1127295 (=> res!753346 e!641613)))

(assert (=> b!1127295 (= res!753346 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127295 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36789 0))(
  ( (Unit!36790) )
))
(declare-fun lt!500382 () Unit!36789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73476 (_ BitVec 64) (_ BitVec 32)) Unit!36789)

(assert (=> b!1127295 (= lt!500382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127296 () Bool)

(declare-fun res!753342 () Bool)

(assert (=> b!1127296 (=> (not res!753342) (not e!641610))))

(assert (=> b!1127296 (= res!753342 (and (= (size!35930 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35929 _keys!1208) (size!35930 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127297 () Bool)

(assert (=> b!1127297 (= e!641610 e!641609)))

(declare-fun res!753338 () Bool)

(assert (=> b!1127297 (=> (not res!753338) (not e!641609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73476 (_ BitVec 32)) Bool)

(assert (=> b!1127297 (= res!753338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500385 mask!1564))))

(assert (=> b!1127297 (= lt!500385 (array!73477 (store (arr!35391 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35929 _keys!1208)))))

(declare-fun b!1127298 () Bool)

(declare-fun res!753341 () Bool)

(assert (=> b!1127298 (=> (not res!753341) (not e!641610))))

(assert (=> b!1127298 (= res!753341 (= (select (arr!35391 _keys!1208) i!673) k0!934))))

(declare-fun b!1127300 () Bool)

(declare-fun res!753335 () Bool)

(assert (=> b!1127300 (=> (not res!753335) (not e!641610))))

(assert (=> b!1127300 (= res!753335 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35929 _keys!1208))))))

(declare-fun mapNonEmpty!44335 () Bool)

(declare-fun mapRes!44335 () Bool)

(declare-fun tp!84149 () Bool)

(declare-fun e!641608 () Bool)

(assert (=> mapNonEmpty!44335 (= mapRes!44335 (and tp!84149 e!641608))))

(declare-fun mapRest!44335 () (Array (_ BitVec 32) ValueCell!13463))

(declare-fun mapValue!44335 () ValueCell!13463)

(declare-fun mapKey!44335 () (_ BitVec 32))

(assert (=> mapNonEmpty!44335 (= (arr!35392 _values!996) (store mapRest!44335 mapKey!44335 mapValue!44335))))

(declare-fun b!1127301 () Bool)

(declare-fun e!641607 () Bool)

(declare-fun call!47705 () ListLongMap!15961)

(declare-fun call!47704 () ListLongMap!15961)

(declare-fun -!1120 (ListLongMap!15961 (_ BitVec 64)) ListLongMap!15961)

(assert (=> b!1127301 (= e!641607 (= call!47704 (-!1120 call!47705 k0!934)))))

(declare-fun b!1127302 () Bool)

(assert (=> b!1127302 (= e!641607 (= call!47704 call!47705))))

(declare-fun b!1127303 () Bool)

(declare-fun res!753343 () Bool)

(assert (=> b!1127303 (=> (not res!753343) (not e!641610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127303 (= res!753343 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44335 () Bool)

(assert (=> mapIsEmpty!44335 mapRes!44335))

(declare-fun b!1127304 () Bool)

(declare-fun res!753340 () Bool)

(assert (=> b!1127304 (=> (not res!753340) (not e!641610))))

(assert (=> b!1127304 (= res!753340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47701 () Bool)

(assert (=> bm!47701 (= call!47705 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47702 () Bool)

(assert (=> bm!47702 (= call!47704 (getCurrentListMapNoExtraKeys!4496 lt!500385 lt!500384 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127305 () Bool)

(declare-fun res!753345 () Bool)

(assert (=> b!1127305 (=> (not res!753345) (not e!641609))))

(assert (=> b!1127305 (= res!753345 (arrayNoDuplicates!0 lt!500385 #b00000000000000000000000000000000 Nil!24746))))

(declare-fun b!1127306 () Bool)

(declare-fun e!641611 () Bool)

(assert (=> b!1127306 (= e!641611 (and e!641614 mapRes!44335))))

(declare-fun condMapEmpty!44335 () Bool)

(declare-fun mapDefault!44335 () ValueCell!13463)

(assert (=> b!1127306 (= condMapEmpty!44335 (= (arr!35392 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13463)) mapDefault!44335)))))

(declare-fun b!1127307 () Bool)

(assert (=> b!1127307 (= e!641612 e!641616)))

(declare-fun res!753337 () Bool)

(assert (=> b!1127307 (=> res!753337 e!641616)))

(assert (=> b!1127307 (= res!753337 (not (= (select (arr!35391 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127307 e!641607))

(declare-fun c!109686 () Bool)

(assert (=> b!1127307 (= c!109686 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500383 () Unit!36789)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!399 (array!73476 array!73478 (_ BitVec 32) (_ BitVec 32) V!42921 V!42921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36789)

(assert (=> b!1127307 (= lt!500383 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127299 () Bool)

(assert (=> b!1127299 (= e!641608 tp_is_empty!28345)))

(declare-fun res!753336 () Bool)

(assert (=> start!98108 (=> (not res!753336) (not e!641610))))

(assert (=> start!98108 (= res!753336 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35929 _keys!1208))))))

(assert (=> start!98108 e!641610))

(assert (=> start!98108 tp_is_empty!28345))

(declare-fun array_inv!27238 (array!73476) Bool)

(assert (=> start!98108 (array_inv!27238 _keys!1208)))

(assert (=> start!98108 true))

(assert (=> start!98108 tp!84148))

(declare-fun array_inv!27239 (array!73478) Bool)

(assert (=> start!98108 (and (array_inv!27239 _values!996) e!641611)))

(assert (= (and start!98108 res!753336) b!1127294))

(assert (= (and b!1127294 res!753334) b!1127296))

(assert (= (and b!1127296 res!753342) b!1127304))

(assert (= (and b!1127304 res!753340) b!1127293))

(assert (= (and b!1127293 res!753344) b!1127300))

(assert (= (and b!1127300 res!753335) b!1127303))

(assert (= (and b!1127303 res!753343) b!1127298))

(assert (= (and b!1127298 res!753341) b!1127297))

(assert (= (and b!1127297 res!753338) b!1127305))

(assert (= (and b!1127305 res!753345) b!1127295))

(assert (= (and b!1127295 (not res!753346)) b!1127291))

(assert (= (and b!1127291 (not res!753339)) b!1127307))

(assert (= (and b!1127307 c!109686) b!1127301))

(assert (= (and b!1127307 (not c!109686)) b!1127302))

(assert (= (or b!1127301 b!1127302) bm!47702))

(assert (= (or b!1127301 b!1127302) bm!47701))

(assert (= (and b!1127307 (not res!753337)) b!1127290))

(assert (= (and b!1127306 condMapEmpty!44335) mapIsEmpty!44335))

(assert (= (and b!1127306 (not condMapEmpty!44335)) mapNonEmpty!44335))

(get-info :version)

(assert (= (and mapNonEmpty!44335 ((_ is ValueCellFull!13463) mapValue!44335)) b!1127299))

(assert (= (and b!1127306 ((_ is ValueCellFull!13463) mapDefault!44335)) b!1127292))

(assert (= start!98108 b!1127306))

(declare-fun b_lambda!18767 () Bool)

(assert (=> (not b_lambda!18767) (not b!1127291)))

(declare-fun t!35545 () Bool)

(declare-fun tb!8619 () Bool)

(assert (=> (and start!98108 (= defaultEntry!1004 defaultEntry!1004) t!35545) tb!8619))

(declare-fun result!17807 () Bool)

(assert (=> tb!8619 (= result!17807 tp_is_empty!28345)))

(assert (=> b!1127291 t!35545))

(declare-fun b_and!38393 () Bool)

(assert (= b_and!38391 (and (=> t!35545 result!17807) b_and!38393)))

(declare-fun m!1040571 () Bool)

(assert (=> start!98108 m!1040571))

(declare-fun m!1040573 () Bool)

(assert (=> start!98108 m!1040573))

(declare-fun m!1040575 () Bool)

(assert (=> b!1127295 m!1040575))

(declare-fun m!1040577 () Bool)

(assert (=> b!1127295 m!1040577))

(declare-fun m!1040579 () Bool)

(assert (=> b!1127303 m!1040579))

(declare-fun m!1040581 () Bool)

(assert (=> b!1127305 m!1040581))

(declare-fun m!1040583 () Bool)

(assert (=> b!1127291 m!1040583))

(declare-fun m!1040585 () Bool)

(assert (=> b!1127291 m!1040585))

(declare-fun m!1040587 () Bool)

(assert (=> b!1127291 m!1040587))

(declare-fun m!1040589 () Bool)

(assert (=> b!1127291 m!1040589))

(declare-fun m!1040591 () Bool)

(assert (=> b!1127294 m!1040591))

(declare-fun m!1040593 () Bool)

(assert (=> bm!47701 m!1040593))

(declare-fun m!1040595 () Bool)

(assert (=> b!1127301 m!1040595))

(declare-fun m!1040597 () Bool)

(assert (=> b!1127297 m!1040597))

(declare-fun m!1040599 () Bool)

(assert (=> b!1127297 m!1040599))

(declare-fun m!1040601 () Bool)

(assert (=> mapNonEmpty!44335 m!1040601))

(assert (=> b!1127290 m!1040593))

(assert (=> b!1127290 m!1040593))

(declare-fun m!1040603 () Bool)

(assert (=> b!1127290 m!1040603))

(declare-fun m!1040605 () Bool)

(assert (=> b!1127304 m!1040605))

(declare-fun m!1040607 () Bool)

(assert (=> b!1127307 m!1040607))

(declare-fun m!1040609 () Bool)

(assert (=> b!1127307 m!1040609))

(declare-fun m!1040611 () Bool)

(assert (=> b!1127293 m!1040611))

(declare-fun m!1040613 () Bool)

(assert (=> b!1127298 m!1040613))

(declare-fun m!1040615 () Bool)

(assert (=> bm!47702 m!1040615))

(check-sat (not b!1127293) (not b!1127294) (not bm!47702) (not b!1127301) (not b!1127304) (not b!1127290) (not b_next!23815) (not b!1127295) (not bm!47701) tp_is_empty!28345 (not b!1127307) (not b!1127297) (not b!1127305) (not start!98108) (not mapNonEmpty!44335) (not b_lambda!18767) (not b!1127291) (not b!1127303) b_and!38393)
(check-sat b_and!38393 (not b_next!23815))
