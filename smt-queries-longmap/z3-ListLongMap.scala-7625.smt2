; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96064 () Bool)

(assert start!96064)

(declare-fun b_free!22723 () Bool)

(declare-fun b_next!22723 () Bool)

(assert (=> start!96064 (= b_free!22723 (not b_next!22723))))

(declare-fun tp!80017 () Bool)

(declare-fun b_and!36095 () Bool)

(assert (=> start!96064 (= tp!80017 b_and!36095)))

(declare-fun b!1089493 () Bool)

(declare-fun res!726788 () Bool)

(declare-fun e!622276 () Bool)

(assert (=> b!1089493 (=> (not res!726788) (not e!622276))))

(declare-datatypes ((array!70294 0))(
  ( (array!70295 (arr!33821 (Array (_ BitVec 32) (_ BitVec 64))) (size!34359 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70294)

(declare-datatypes ((List!23668 0))(
  ( (Nil!23665) (Cons!23664 (h!24873 (_ BitVec 64)) (t!33440 List!23668)) )
))
(declare-fun arrayNoDuplicates!0 (array!70294 (_ BitVec 32) List!23668) Bool)

(assert (=> b!1089493 (= res!726788 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23665))))

(declare-fun b!1089494 () Bool)

(declare-fun e!622275 () Bool)

(declare-fun e!622272 () Bool)

(assert (=> b!1089494 (= e!622275 (not e!622272))))

(declare-fun res!726785 () Bool)

(assert (=> b!1089494 (=> res!726785 e!622272)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089494 (= res!726785 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40761 0))(
  ( (V!40762 (val!13419 Int)) )
))
(declare-datatypes ((tuple2!17100 0))(
  ( (tuple2!17101 (_1!8561 (_ BitVec 64)) (_2!8561 V!40761)) )
))
(declare-datatypes ((List!23669 0))(
  ( (Nil!23666) (Cons!23665 (h!24874 tuple2!17100) (t!33441 List!23669)) )
))
(declare-datatypes ((ListLongMap!15069 0))(
  ( (ListLongMap!15070 (toList!7550 List!23669)) )
))
(declare-fun lt!485666 () ListLongMap!15069)

(declare-fun minValue!831 () V!40761)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40761)

(declare-datatypes ((ValueCell!12653 0))(
  ( (ValueCellFull!12653 (v!16039 V!40761)) (EmptyCell!12653) )
))
(declare-datatypes ((array!70296 0))(
  ( (array!70297 (arr!33822 (Array (_ BitVec 32) ValueCell!12653)) (size!34360 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70296)

(declare-fun getCurrentListMap!4226 (array!70294 array!70296 (_ BitVec 32) (_ BitVec 32) V!40761 V!40761 (_ BitVec 32) Int) ListLongMap!15069)

(assert (=> b!1089494 (= lt!485666 (getCurrentListMap!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485678 () array!70296)

(declare-fun lt!485677 () array!70294)

(declare-fun lt!485676 () ListLongMap!15069)

(assert (=> b!1089494 (= lt!485676 (getCurrentListMap!4226 lt!485677 lt!485678 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485675 () ListLongMap!15069)

(declare-fun lt!485671 () ListLongMap!15069)

(assert (=> b!1089494 (and (= lt!485675 lt!485671) (= lt!485671 lt!485675))))

(declare-fun lt!485667 () ListLongMap!15069)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!826 (ListLongMap!15069 (_ BitVec 64)) ListLongMap!15069)

(assert (=> b!1089494 (= lt!485671 (-!826 lt!485667 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35687 0))(
  ( (Unit!35688) )
))
(declare-fun lt!485669 () Unit!35687)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!110 (array!70294 array!70296 (_ BitVec 32) (_ BitVec 32) V!40761 V!40761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35687)

(assert (=> b!1089494 (= lt!485669 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!110 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4096 (array!70294 array!70296 (_ BitVec 32) (_ BitVec 32) V!40761 V!40761 (_ BitVec 32) Int) ListLongMap!15069)

(assert (=> b!1089494 (= lt!485675 (getCurrentListMapNoExtraKeys!4096 lt!485677 lt!485678 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2167 (Int (_ BitVec 64)) V!40761)

(assert (=> b!1089494 (= lt!485678 (array!70297 (store (arr!33822 _values!874) i!650 (ValueCellFull!12653 (dynLambda!2167 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34360 _values!874)))))

(assert (=> b!1089494 (= lt!485667 (getCurrentListMapNoExtraKeys!4096 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089494 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485672 () Unit!35687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70294 (_ BitVec 64) (_ BitVec 32)) Unit!35687)

(assert (=> b!1089494 (= lt!485672 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089495 () Bool)

(assert (=> b!1089495 (= e!622276 e!622275)))

(declare-fun res!726790 () Bool)

(assert (=> b!1089495 (=> (not res!726790) (not e!622275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70294 (_ BitVec 32)) Bool)

(assert (=> b!1089495 (= res!726790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485677 mask!1414))))

(assert (=> b!1089495 (= lt!485677 (array!70295 (store (arr!33821 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34359 _keys!1070)))))

(declare-fun b!1089496 () Bool)

(declare-fun e!622274 () Bool)

(assert (=> b!1089496 (= e!622274 (bvsle #b00000000000000000000000000000000 (size!34359 _keys!1070)))))

(declare-fun lt!485670 () ListLongMap!15069)

(declare-fun lt!485674 () ListLongMap!15069)

(assert (=> b!1089496 (= (-!826 lt!485670 k0!904) lt!485674)))

(declare-fun lt!485673 () Unit!35687)

(declare-fun addRemoveCommutativeForDiffKeys!76 (ListLongMap!15069 (_ BitVec 64) V!40761 (_ BitVec 64)) Unit!35687)

(assert (=> b!1089496 (= lt!485673 (addRemoveCommutativeForDiffKeys!76 lt!485667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089497 () Bool)

(declare-fun e!622277 () Bool)

(declare-fun tp_is_empty!26725 () Bool)

(assert (=> b!1089497 (= e!622277 tp_is_empty!26725)))

(declare-fun mapIsEmpty!41842 () Bool)

(declare-fun mapRes!41842 () Bool)

(assert (=> mapIsEmpty!41842 mapRes!41842))

(declare-fun res!726791 () Bool)

(assert (=> start!96064 (=> (not res!726791) (not e!622276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96064 (= res!726791 (validMask!0 mask!1414))))

(assert (=> start!96064 e!622276))

(assert (=> start!96064 tp!80017))

(assert (=> start!96064 true))

(assert (=> start!96064 tp_is_empty!26725))

(declare-fun array_inv!26126 (array!70294) Bool)

(assert (=> start!96064 (array_inv!26126 _keys!1070)))

(declare-fun e!622270 () Bool)

(declare-fun array_inv!26127 (array!70296) Bool)

(assert (=> start!96064 (and (array_inv!26127 _values!874) e!622270)))

(declare-fun b!1089498 () Bool)

(assert (=> b!1089498 (= e!622272 e!622274)))

(declare-fun res!726792 () Bool)

(assert (=> b!1089498 (=> res!726792 e!622274)))

(assert (=> b!1089498 (= res!726792 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089498 (= lt!485676 lt!485674)))

(declare-fun lt!485668 () tuple2!17100)

(declare-fun +!3349 (ListLongMap!15069 tuple2!17100) ListLongMap!15069)

(assert (=> b!1089498 (= lt!485674 (+!3349 lt!485671 lt!485668))))

(assert (=> b!1089498 (= lt!485666 lt!485670)))

(assert (=> b!1089498 (= lt!485670 (+!3349 lt!485667 lt!485668))))

(assert (=> b!1089498 (= lt!485676 (+!3349 lt!485675 lt!485668))))

(assert (=> b!1089498 (= lt!485668 (tuple2!17101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41842 () Bool)

(declare-fun tp!80018 () Bool)

(declare-fun e!622271 () Bool)

(assert (=> mapNonEmpty!41842 (= mapRes!41842 (and tp!80018 e!622271))))

(declare-fun mapValue!41842 () ValueCell!12653)

(declare-fun mapKey!41842 () (_ BitVec 32))

(declare-fun mapRest!41842 () (Array (_ BitVec 32) ValueCell!12653))

(assert (=> mapNonEmpty!41842 (= (arr!33822 _values!874) (store mapRest!41842 mapKey!41842 mapValue!41842))))

(declare-fun b!1089499 () Bool)

(declare-fun res!726786 () Bool)

(assert (=> b!1089499 (=> (not res!726786) (not e!622275))))

(assert (=> b!1089499 (= res!726786 (arrayNoDuplicates!0 lt!485677 #b00000000000000000000000000000000 Nil!23665))))

(declare-fun b!1089500 () Bool)

(declare-fun res!726793 () Bool)

(assert (=> b!1089500 (=> (not res!726793) (not e!622276))))

(assert (=> b!1089500 (= res!726793 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34359 _keys!1070))))))

(declare-fun b!1089501 () Bool)

(declare-fun res!726795 () Bool)

(assert (=> b!1089501 (=> (not res!726795) (not e!622276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089501 (= res!726795 (validKeyInArray!0 k0!904))))

(declare-fun b!1089502 () Bool)

(assert (=> b!1089502 (= e!622270 (and e!622277 mapRes!41842))))

(declare-fun condMapEmpty!41842 () Bool)

(declare-fun mapDefault!41842 () ValueCell!12653)

(assert (=> b!1089502 (= condMapEmpty!41842 (= (arr!33822 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12653)) mapDefault!41842)))))

(declare-fun b!1089503 () Bool)

(assert (=> b!1089503 (= e!622271 tp_is_empty!26725)))

(declare-fun b!1089504 () Bool)

(declare-fun res!726789 () Bool)

(assert (=> b!1089504 (=> (not res!726789) (not e!622276))))

(assert (=> b!1089504 (= res!726789 (and (= (size!34360 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34359 _keys!1070) (size!34360 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089505 () Bool)

(declare-fun res!726787 () Bool)

(assert (=> b!1089505 (=> (not res!726787) (not e!622276))))

(assert (=> b!1089505 (= res!726787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089506 () Bool)

(declare-fun res!726794 () Bool)

(assert (=> b!1089506 (=> (not res!726794) (not e!622276))))

(assert (=> b!1089506 (= res!726794 (= (select (arr!33821 _keys!1070) i!650) k0!904))))

(assert (= (and start!96064 res!726791) b!1089504))

(assert (= (and b!1089504 res!726789) b!1089505))

(assert (= (and b!1089505 res!726787) b!1089493))

(assert (= (and b!1089493 res!726788) b!1089500))

(assert (= (and b!1089500 res!726793) b!1089501))

(assert (= (and b!1089501 res!726795) b!1089506))

(assert (= (and b!1089506 res!726794) b!1089495))

(assert (= (and b!1089495 res!726790) b!1089499))

(assert (= (and b!1089499 res!726786) b!1089494))

(assert (= (and b!1089494 (not res!726785)) b!1089498))

(assert (= (and b!1089498 (not res!726792)) b!1089496))

(assert (= (and b!1089502 condMapEmpty!41842) mapIsEmpty!41842))

(assert (= (and b!1089502 (not condMapEmpty!41842)) mapNonEmpty!41842))

(get-info :version)

(assert (= (and mapNonEmpty!41842 ((_ is ValueCellFull!12653) mapValue!41842)) b!1089503))

(assert (= (and b!1089502 ((_ is ValueCellFull!12653) mapDefault!41842)) b!1089497))

(assert (= start!96064 b!1089502))

(declare-fun b_lambda!17371 () Bool)

(assert (=> (not b_lambda!17371) (not b!1089494)))

(declare-fun t!33439 () Bool)

(declare-fun tb!7593 () Bool)

(assert (=> (and start!96064 (= defaultEntry!882 defaultEntry!882) t!33439) tb!7593))

(declare-fun result!15713 () Bool)

(assert (=> tb!7593 (= result!15713 tp_is_empty!26725)))

(assert (=> b!1089494 t!33439))

(declare-fun b_and!36097 () Bool)

(assert (= b_and!36095 (and (=> t!33439 result!15713) b_and!36097)))

(declare-fun m!1008305 () Bool)

(assert (=> b!1089496 m!1008305))

(declare-fun m!1008307 () Bool)

(assert (=> b!1089496 m!1008307))

(declare-fun m!1008309 () Bool)

(assert (=> mapNonEmpty!41842 m!1008309))

(declare-fun m!1008311 () Bool)

(assert (=> b!1089499 m!1008311))

(declare-fun m!1008313 () Bool)

(assert (=> b!1089495 m!1008313))

(declare-fun m!1008315 () Bool)

(assert (=> b!1089495 m!1008315))

(declare-fun m!1008317 () Bool)

(assert (=> b!1089506 m!1008317))

(declare-fun m!1008319 () Bool)

(assert (=> b!1089493 m!1008319))

(declare-fun m!1008321 () Bool)

(assert (=> b!1089498 m!1008321))

(declare-fun m!1008323 () Bool)

(assert (=> b!1089498 m!1008323))

(declare-fun m!1008325 () Bool)

(assert (=> b!1089498 m!1008325))

(declare-fun m!1008327 () Bool)

(assert (=> start!96064 m!1008327))

(declare-fun m!1008329 () Bool)

(assert (=> start!96064 m!1008329))

(declare-fun m!1008331 () Bool)

(assert (=> start!96064 m!1008331))

(declare-fun m!1008333 () Bool)

(assert (=> b!1089505 m!1008333))

(declare-fun m!1008335 () Bool)

(assert (=> b!1089494 m!1008335))

(declare-fun m!1008337 () Bool)

(assert (=> b!1089494 m!1008337))

(declare-fun m!1008339 () Bool)

(assert (=> b!1089494 m!1008339))

(declare-fun m!1008341 () Bool)

(assert (=> b!1089494 m!1008341))

(declare-fun m!1008343 () Bool)

(assert (=> b!1089494 m!1008343))

(declare-fun m!1008345 () Bool)

(assert (=> b!1089494 m!1008345))

(declare-fun m!1008347 () Bool)

(assert (=> b!1089494 m!1008347))

(declare-fun m!1008349 () Bool)

(assert (=> b!1089494 m!1008349))

(declare-fun m!1008351 () Bool)

(assert (=> b!1089494 m!1008351))

(declare-fun m!1008353 () Bool)

(assert (=> b!1089494 m!1008353))

(declare-fun m!1008355 () Bool)

(assert (=> b!1089501 m!1008355))

(check-sat (not b!1089499) (not mapNonEmpty!41842) (not b_next!22723) (not b!1089505) (not start!96064) (not b_lambda!17371) tp_is_empty!26725 (not b!1089494) (not b!1089498) (not b!1089496) (not b!1089493) (not b!1089501) b_and!36097 (not b!1089495))
(check-sat b_and!36097 (not b_next!22723))
