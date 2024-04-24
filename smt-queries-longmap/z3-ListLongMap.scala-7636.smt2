; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96372 () Bool)

(assert start!96372)

(declare-fun b_free!22789 () Bool)

(declare-fun b_next!22789 () Bool)

(assert (=> start!96372 (= b_free!22789 (not b_next!22789))))

(declare-fun tp!80216 () Bool)

(declare-fun b_and!36263 () Bool)

(assert (=> start!96372 (= tp!80216 b_and!36263)))

(declare-fun b!1092434 () Bool)

(declare-fun res!728479 () Bool)

(declare-fun e!624015 () Bool)

(assert (=> b!1092434 (=> (not res!728479) (not e!624015))))

(declare-datatypes ((array!70539 0))(
  ( (array!70540 (arr!33937 (Array (_ BitVec 32) (_ BitVec 64))) (size!34474 (_ BitVec 32))) )
))
(declare-fun lt!487641 () array!70539)

(declare-datatypes ((List!23703 0))(
  ( (Nil!23700) (Cons!23699 (h!24917 (_ BitVec 64)) (t!33542 List!23703)) )
))
(declare-fun arrayNoDuplicates!0 (array!70539 (_ BitVec 32) List!23703) Bool)

(assert (=> b!1092434 (= res!728479 (arrayNoDuplicates!0 lt!487641 #b00000000000000000000000000000000 Nil!23700))))

(declare-fun mapNonEmpty!41941 () Bool)

(declare-fun mapRes!41941 () Bool)

(declare-fun tp!80215 () Bool)

(declare-fun e!624013 () Bool)

(assert (=> mapNonEmpty!41941 (= mapRes!41941 (and tp!80215 e!624013))))

(declare-datatypes ((V!40849 0))(
  ( (V!40850 (val!13452 Int)) )
))
(declare-datatypes ((ValueCell!12686 0))(
  ( (ValueCellFull!12686 (v!16069 V!40849)) (EmptyCell!12686) )
))
(declare-datatypes ((array!70541 0))(
  ( (array!70542 (arr!33938 (Array (_ BitVec 32) ValueCell!12686)) (size!34475 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70541)

(declare-fun mapValue!41941 () ValueCell!12686)

(declare-fun mapKey!41941 () (_ BitVec 32))

(declare-fun mapRest!41941 () (Array (_ BitVec 32) ValueCell!12686))

(assert (=> mapNonEmpty!41941 (= (arr!33938 _values!874) (store mapRest!41941 mapKey!41941 mapValue!41941))))

(declare-fun b!1092435 () Bool)

(declare-fun res!728483 () Bool)

(declare-fun e!624017 () Bool)

(assert (=> b!1092435 (=> (not res!728483) (not e!624017))))

(declare-fun _keys!1070 () array!70539)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092435 (= res!728483 (= (select (arr!33937 _keys!1070) i!650) k0!904))))

(declare-fun b!1092436 () Bool)

(declare-fun e!624010 () Bool)

(declare-fun e!624014 () Bool)

(assert (=> b!1092436 (= e!624010 (and e!624014 mapRes!41941))))

(declare-fun condMapEmpty!41941 () Bool)

(declare-fun mapDefault!41941 () ValueCell!12686)

(assert (=> b!1092436 (= condMapEmpty!41941 (= (arr!33938 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12686)) mapDefault!41941)))))

(declare-fun mapIsEmpty!41941 () Bool)

(assert (=> mapIsEmpty!41941 mapRes!41941))

(declare-fun b!1092437 () Bool)

(declare-fun tp_is_empty!26791 () Bool)

(assert (=> b!1092437 (= e!624014 tp_is_empty!26791)))

(declare-fun b!1092438 () Bool)

(declare-fun res!728474 () Bool)

(assert (=> b!1092438 (=> (not res!728474) (not e!624017))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70539 (_ BitVec 32)) Bool)

(assert (=> b!1092438 (= res!728474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092439 () Bool)

(declare-fun e!624011 () Bool)

(declare-fun e!624016 () Bool)

(assert (=> b!1092439 (= e!624011 e!624016)))

(declare-fun res!728476 () Bool)

(assert (=> b!1092439 (=> res!728476 e!624016)))

(assert (=> b!1092439 (= res!728476 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17110 0))(
  ( (tuple2!17111 (_1!8566 (_ BitVec 64)) (_2!8566 V!40849)) )
))
(declare-datatypes ((List!23704 0))(
  ( (Nil!23701) (Cons!23700 (h!24918 tuple2!17110) (t!33543 List!23704)) )
))
(declare-datatypes ((ListLongMap!15087 0))(
  ( (ListLongMap!15088 (toList!7559 List!23704)) )
))
(declare-fun lt!487647 () ListLongMap!15087)

(declare-fun lt!487646 () ListLongMap!15087)

(assert (=> b!1092439 (= lt!487647 lt!487646)))

(declare-fun lt!487650 () ListLongMap!15087)

(declare-fun lt!487651 () tuple2!17110)

(declare-fun +!3374 (ListLongMap!15087 tuple2!17110) ListLongMap!15087)

(assert (=> b!1092439 (= lt!487646 (+!3374 lt!487650 lt!487651))))

(declare-fun lt!487652 () ListLongMap!15087)

(declare-fun lt!487648 () ListLongMap!15087)

(assert (=> b!1092439 (= lt!487652 lt!487648)))

(declare-fun lt!487643 () ListLongMap!15087)

(assert (=> b!1092439 (= lt!487648 (+!3374 lt!487643 lt!487651))))

(declare-fun lt!487642 () ListLongMap!15087)

(assert (=> b!1092439 (= lt!487652 (+!3374 lt!487642 lt!487651))))

(declare-fun minValue!831 () V!40849)

(assert (=> b!1092439 (= lt!487651 (tuple2!17111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092440 () Bool)

(declare-fun res!728484 () Bool)

(assert (=> b!1092440 (=> (not res!728484) (not e!624017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092440 (= res!728484 (validKeyInArray!0 k0!904))))

(declare-fun b!1092441 () Bool)

(declare-fun res!728482 () Bool)

(assert (=> b!1092441 (=> (not res!728482) (not e!624017))))

(assert (=> b!1092441 (= res!728482 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34474 _keys!1070))))))

(declare-fun b!1092442 () Bool)

(assert (=> b!1092442 (= e!624017 e!624015)))

(declare-fun res!728477 () Bool)

(assert (=> b!1092442 (=> (not res!728477) (not e!624015))))

(assert (=> b!1092442 (= res!728477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487641 mask!1414))))

(assert (=> b!1092442 (= lt!487641 (array!70540 (store (arr!33937 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34474 _keys!1070)))))

(declare-fun b!1092443 () Bool)

(declare-fun res!728481 () Bool)

(assert (=> b!1092443 (=> (not res!728481) (not e!624017))))

(assert (=> b!1092443 (= res!728481 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23700))))

(declare-fun res!728475 () Bool)

(assert (=> start!96372 (=> (not res!728475) (not e!624017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96372 (= res!728475 (validMask!0 mask!1414))))

(assert (=> start!96372 e!624017))

(assert (=> start!96372 tp!80216))

(assert (=> start!96372 true))

(assert (=> start!96372 tp_is_empty!26791))

(declare-fun array_inv!26210 (array!70539) Bool)

(assert (=> start!96372 (array_inv!26210 _keys!1070)))

(declare-fun array_inv!26211 (array!70541) Bool)

(assert (=> start!96372 (and (array_inv!26211 _values!874) e!624010)))

(declare-fun b!1092444 () Bool)

(assert (=> b!1092444 (= e!624015 (not e!624011))))

(declare-fun res!728478 () Bool)

(assert (=> b!1092444 (=> res!728478 e!624011)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092444 (= res!728478 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40849)

(declare-fun getCurrentListMap!4311 (array!70539 array!70541 (_ BitVec 32) (_ BitVec 32) V!40849 V!40849 (_ BitVec 32) Int) ListLongMap!15087)

(assert (=> b!1092444 (= lt!487647 (getCurrentListMap!4311 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487649 () array!70541)

(assert (=> b!1092444 (= lt!487652 (getCurrentListMap!4311 lt!487641 lt!487649 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1092444 (and (= lt!487642 lt!487643) (= lt!487643 lt!487642))))

(declare-fun -!865 (ListLongMap!15087 (_ BitVec 64)) ListLongMap!15087)

(assert (=> b!1092444 (= lt!487643 (-!865 lt!487650 k0!904))))

(declare-datatypes ((Unit!35897 0))(
  ( (Unit!35898) )
))
(declare-fun lt!487653 () Unit!35897)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!140 (array!70539 array!70541 (_ BitVec 32) (_ BitVec 32) V!40849 V!40849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35897)

(assert (=> b!1092444 (= lt!487653 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!140 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4116 (array!70539 array!70541 (_ BitVec 32) (_ BitVec 32) V!40849 V!40849 (_ BitVec 32) Int) ListLongMap!15087)

(assert (=> b!1092444 (= lt!487642 (getCurrentListMapNoExtraKeys!4116 lt!487641 lt!487649 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2237 (Int (_ BitVec 64)) V!40849)

(assert (=> b!1092444 (= lt!487649 (array!70542 (store (arr!33938 _values!874) i!650 (ValueCellFull!12686 (dynLambda!2237 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34475 _values!874)))))

(assert (=> b!1092444 (= lt!487650 (getCurrentListMapNoExtraKeys!4116 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092444 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487644 () Unit!35897)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70539 (_ BitVec 64) (_ BitVec 32)) Unit!35897)

(assert (=> b!1092444 (= lt!487644 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092445 () Bool)

(assert (=> b!1092445 (= e!624013 tp_is_empty!26791)))

(declare-fun b!1092446 () Bool)

(declare-fun res!728480 () Bool)

(assert (=> b!1092446 (=> (not res!728480) (not e!624017))))

(assert (=> b!1092446 (= res!728480 (and (= (size!34475 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34474 _keys!1070) (size!34475 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092447 () Bool)

(assert (=> b!1092447 (= e!624016 true)))

(assert (=> b!1092447 (= (-!865 lt!487646 k0!904) lt!487648)))

(declare-fun lt!487645 () Unit!35897)

(declare-fun addRemoveCommutativeForDiffKeys!98 (ListLongMap!15087 (_ BitVec 64) V!40849 (_ BitVec 64)) Unit!35897)

(assert (=> b!1092447 (= lt!487645 (addRemoveCommutativeForDiffKeys!98 lt!487650 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!96372 res!728475) b!1092446))

(assert (= (and b!1092446 res!728480) b!1092438))

(assert (= (and b!1092438 res!728474) b!1092443))

(assert (= (and b!1092443 res!728481) b!1092441))

(assert (= (and b!1092441 res!728482) b!1092440))

(assert (= (and b!1092440 res!728484) b!1092435))

(assert (= (and b!1092435 res!728483) b!1092442))

(assert (= (and b!1092442 res!728477) b!1092434))

(assert (= (and b!1092434 res!728479) b!1092444))

(assert (= (and b!1092444 (not res!728478)) b!1092439))

(assert (= (and b!1092439 (not res!728476)) b!1092447))

(assert (= (and b!1092436 condMapEmpty!41941) mapIsEmpty!41941))

(assert (= (and b!1092436 (not condMapEmpty!41941)) mapNonEmpty!41941))

(get-info :version)

(assert (= (and mapNonEmpty!41941 ((_ is ValueCellFull!12686) mapValue!41941)) b!1092445))

(assert (= (and b!1092436 ((_ is ValueCellFull!12686) mapDefault!41941)) b!1092437))

(assert (= start!96372 b!1092436))

(declare-fun b_lambda!17469 () Bool)

(assert (=> (not b_lambda!17469) (not b!1092444)))

(declare-fun t!33541 () Bool)

(declare-fun tb!7659 () Bool)

(assert (=> (and start!96372 (= defaultEntry!882 defaultEntry!882) t!33541) tb!7659))

(declare-fun result!15845 () Bool)

(assert (=> tb!7659 (= result!15845 tp_is_empty!26791)))

(assert (=> b!1092444 t!33541))

(declare-fun b_and!36265 () Bool)

(assert (= b_and!36263 (and (=> t!33541 result!15845) b_and!36265)))

(declare-fun m!1012307 () Bool)

(assert (=> b!1092443 m!1012307))

(declare-fun m!1012309 () Bool)

(assert (=> b!1092434 m!1012309))

(declare-fun m!1012311 () Bool)

(assert (=> b!1092439 m!1012311))

(declare-fun m!1012313 () Bool)

(assert (=> b!1092439 m!1012313))

(declare-fun m!1012315 () Bool)

(assert (=> b!1092439 m!1012315))

(declare-fun m!1012317 () Bool)

(assert (=> b!1092447 m!1012317))

(declare-fun m!1012319 () Bool)

(assert (=> b!1092447 m!1012319))

(declare-fun m!1012321 () Bool)

(assert (=> start!96372 m!1012321))

(declare-fun m!1012323 () Bool)

(assert (=> start!96372 m!1012323))

(declare-fun m!1012325 () Bool)

(assert (=> start!96372 m!1012325))

(declare-fun m!1012327 () Bool)

(assert (=> b!1092438 m!1012327))

(declare-fun m!1012329 () Bool)

(assert (=> mapNonEmpty!41941 m!1012329))

(declare-fun m!1012331 () Bool)

(assert (=> b!1092444 m!1012331))

(declare-fun m!1012333 () Bool)

(assert (=> b!1092444 m!1012333))

(declare-fun m!1012335 () Bool)

(assert (=> b!1092444 m!1012335))

(declare-fun m!1012337 () Bool)

(assert (=> b!1092444 m!1012337))

(declare-fun m!1012339 () Bool)

(assert (=> b!1092444 m!1012339))

(declare-fun m!1012341 () Bool)

(assert (=> b!1092444 m!1012341))

(declare-fun m!1012343 () Bool)

(assert (=> b!1092444 m!1012343))

(declare-fun m!1012345 () Bool)

(assert (=> b!1092444 m!1012345))

(declare-fun m!1012347 () Bool)

(assert (=> b!1092444 m!1012347))

(declare-fun m!1012349 () Bool)

(assert (=> b!1092444 m!1012349))

(declare-fun m!1012351 () Bool)

(assert (=> b!1092435 m!1012351))

(declare-fun m!1012353 () Bool)

(assert (=> b!1092440 m!1012353))

(declare-fun m!1012355 () Bool)

(assert (=> b!1092442 m!1012355))

(declare-fun m!1012357 () Bool)

(assert (=> b!1092442 m!1012357))

(check-sat (not b!1092443) (not b!1092438) b_and!36265 (not b_next!22789) (not b!1092447) (not b!1092439) (not mapNonEmpty!41941) (not b!1092444) (not start!96372) (not b!1092434) (not b!1092440) (not b!1092442) (not b_lambda!17469) tp_is_empty!26791)
(check-sat b_and!36265 (not b_next!22789))
