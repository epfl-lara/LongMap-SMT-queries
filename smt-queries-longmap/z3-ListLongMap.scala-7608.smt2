; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95970 () Bool)

(assert start!95970)

(declare-fun b_free!22623 () Bool)

(declare-fun b_next!22623 () Bool)

(assert (=> start!95970 (= b_free!22623 (not b_next!22623))))

(declare-fun tp!79718 () Bool)

(declare-fun b_and!35921 () Bool)

(assert (=> start!95970 (= tp!79718 b_and!35921)))

(declare-fun b!1087446 () Bool)

(declare-fun e!621163 () Bool)

(declare-fun e!621170 () Bool)

(assert (=> b!1087446 (= e!621163 e!621170)))

(declare-fun res!725207 () Bool)

(assert (=> b!1087446 (=> (not res!725207) (not e!621170))))

(declare-datatypes ((array!70177 0))(
  ( (array!70178 (arr!33762 (Array (_ BitVec 32) (_ BitVec 64))) (size!34298 (_ BitVec 32))) )
))
(declare-fun lt!483924 () array!70177)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70177 (_ BitVec 32)) Bool)

(assert (=> b!1087446 (= res!725207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483924 mask!1414))))

(declare-fun _keys!1070 () array!70177)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087446 (= lt!483924 (array!70178 (store (arr!33762 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34298 _keys!1070)))))

(declare-fun b!1087447 () Bool)

(declare-fun e!621167 () Bool)

(declare-fun tp_is_empty!26625 () Bool)

(assert (=> b!1087447 (= e!621167 tp_is_empty!26625)))

(declare-fun b!1087448 () Bool)

(declare-fun res!725208 () Bool)

(assert (=> b!1087448 (=> (not res!725208) (not e!621163))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087448 (= res!725208 (validKeyInArray!0 k0!904))))

(declare-fun b!1087449 () Bool)

(declare-fun res!725213 () Bool)

(assert (=> b!1087449 (=> (not res!725213) (not e!621163))))

(assert (=> b!1087449 (= res!725213 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34298 _keys!1070))))))

(declare-fun b!1087450 () Bool)

(declare-fun res!725204 () Bool)

(assert (=> b!1087450 (=> (not res!725204) (not e!621163))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40627 0))(
  ( (V!40628 (val!13369 Int)) )
))
(declare-datatypes ((ValueCell!12603 0))(
  ( (ValueCellFull!12603 (v!15990 V!40627)) (EmptyCell!12603) )
))
(declare-datatypes ((array!70179 0))(
  ( (array!70180 (arr!33763 (Array (_ BitVec 32) ValueCell!12603)) (size!34299 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70179)

(assert (=> b!1087450 (= res!725204 (and (= (size!34299 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34298 _keys!1070) (size!34299 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087451 () Bool)

(declare-fun e!621168 () Bool)

(declare-fun e!621165 () Bool)

(assert (=> b!1087451 (= e!621168 e!621165)))

(declare-fun res!725209 () Bool)

(assert (=> b!1087451 (=> res!725209 e!621165)))

(assert (=> b!1087451 (= res!725209 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16966 0))(
  ( (tuple2!16967 (_1!8494 (_ BitVec 64)) (_2!8494 V!40627)) )
))
(declare-datatypes ((List!23553 0))(
  ( (Nil!23550) (Cons!23549 (h!24758 tuple2!16966) (t!33234 List!23553)) )
))
(declare-datatypes ((ListLongMap!14935 0))(
  ( (ListLongMap!14936 (toList!7483 List!23553)) )
))
(declare-fun lt!483925 () ListLongMap!14935)

(declare-fun lt!483922 () ListLongMap!14935)

(assert (=> b!1087451 (= lt!483925 lt!483922)))

(declare-fun lt!483928 () ListLongMap!14935)

(declare-fun lt!483921 () tuple2!16966)

(declare-fun +!3288 (ListLongMap!14935 tuple2!16966) ListLongMap!14935)

(assert (=> b!1087451 (= lt!483922 (+!3288 lt!483928 lt!483921))))

(declare-fun lt!483918 () ListLongMap!14935)

(declare-fun lt!483926 () ListLongMap!14935)

(assert (=> b!1087451 (= lt!483918 lt!483926)))

(declare-fun lt!483920 () ListLongMap!14935)

(assert (=> b!1087451 (= lt!483926 (+!3288 lt!483920 lt!483921))))

(declare-fun lt!483923 () ListLongMap!14935)

(assert (=> b!1087451 (= lt!483925 (+!3288 lt!483923 lt!483921))))

(declare-fun zeroValue!831 () V!40627)

(assert (=> b!1087451 (= lt!483921 (tuple2!16967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087452 () Bool)

(assert (=> b!1087452 (= e!621170 (not e!621168))))

(declare-fun res!725214 () Bool)

(assert (=> b!1087452 (=> res!725214 e!621168)))

(assert (=> b!1087452 (= res!725214 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!40627)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4258 (array!70177 array!70179 (_ BitVec 32) (_ BitVec 32) V!40627 V!40627 (_ BitVec 32) Int) ListLongMap!14935)

(assert (=> b!1087452 (= lt!483918 (getCurrentListMap!4258 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483927 () array!70179)

(assert (=> b!1087452 (= lt!483925 (getCurrentListMap!4258 lt!483924 lt!483927 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087452 (and (= lt!483923 lt!483928) (= lt!483928 lt!483923))))

(declare-fun -!808 (ListLongMap!14935 (_ BitVec 64)) ListLongMap!14935)

(assert (=> b!1087452 (= lt!483928 (-!808 lt!483920 k0!904))))

(declare-datatypes ((Unit!35782 0))(
  ( (Unit!35783) )
))
(declare-fun lt!483917 () Unit!35782)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!77 (array!70177 array!70179 (_ BitVec 32) (_ BitVec 32) V!40627 V!40627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35782)

(assert (=> b!1087452 (= lt!483917 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!77 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4018 (array!70177 array!70179 (_ BitVec 32) (_ BitVec 32) V!40627 V!40627 (_ BitVec 32) Int) ListLongMap!14935)

(assert (=> b!1087452 (= lt!483923 (getCurrentListMapNoExtraKeys!4018 lt!483924 lt!483927 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2155 (Int (_ BitVec 64)) V!40627)

(assert (=> b!1087452 (= lt!483927 (array!70180 (store (arr!33763 _values!874) i!650 (ValueCellFull!12603 (dynLambda!2155 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34299 _values!874)))))

(assert (=> b!1087452 (= lt!483920 (getCurrentListMapNoExtraKeys!4018 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087452 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483919 () Unit!35782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70177 (_ BitVec 64) (_ BitVec 32)) Unit!35782)

(assert (=> b!1087452 (= lt!483919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087453 () Bool)

(declare-fun e!621164 () Bool)

(declare-fun e!621166 () Bool)

(declare-fun mapRes!41692 () Bool)

(assert (=> b!1087453 (= e!621164 (and e!621166 mapRes!41692))))

(declare-fun condMapEmpty!41692 () Bool)

(declare-fun mapDefault!41692 () ValueCell!12603)

(assert (=> b!1087453 (= condMapEmpty!41692 (= (arr!33763 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12603)) mapDefault!41692)))))

(declare-fun b!1087454 () Bool)

(declare-fun res!725205 () Bool)

(assert (=> b!1087454 (=> (not res!725205) (not e!621163))))

(assert (=> b!1087454 (= res!725205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!725211 () Bool)

(assert (=> start!95970 (=> (not res!725211) (not e!621163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95970 (= res!725211 (validMask!0 mask!1414))))

(assert (=> start!95970 e!621163))

(assert (=> start!95970 tp!79718))

(assert (=> start!95970 true))

(assert (=> start!95970 tp_is_empty!26625))

(declare-fun array_inv!26044 (array!70177) Bool)

(assert (=> start!95970 (array_inv!26044 _keys!1070)))

(declare-fun array_inv!26045 (array!70179) Bool)

(assert (=> start!95970 (and (array_inv!26045 _values!874) e!621164)))

(declare-fun b!1087455 () Bool)

(assert (=> b!1087455 (= e!621166 tp_is_empty!26625)))

(declare-fun b!1087456 () Bool)

(declare-fun res!725212 () Bool)

(assert (=> b!1087456 (=> (not res!725212) (not e!621170))))

(declare-datatypes ((List!23554 0))(
  ( (Nil!23551) (Cons!23550 (h!24759 (_ BitVec 64)) (t!33235 List!23554)) )
))
(declare-fun arrayNoDuplicates!0 (array!70177 (_ BitVec 32) List!23554) Bool)

(assert (=> b!1087456 (= res!725212 (arrayNoDuplicates!0 lt!483924 #b00000000000000000000000000000000 Nil!23551))))

(declare-fun mapNonEmpty!41692 () Bool)

(declare-fun tp!79717 () Bool)

(assert (=> mapNonEmpty!41692 (= mapRes!41692 (and tp!79717 e!621167))))

(declare-fun mapValue!41692 () ValueCell!12603)

(declare-fun mapRest!41692 () (Array (_ BitVec 32) ValueCell!12603))

(declare-fun mapKey!41692 () (_ BitVec 32))

(assert (=> mapNonEmpty!41692 (= (arr!33763 _values!874) (store mapRest!41692 mapKey!41692 mapValue!41692))))

(declare-fun mapIsEmpty!41692 () Bool)

(assert (=> mapIsEmpty!41692 mapRes!41692))

(declare-fun b!1087457 () Bool)

(assert (=> b!1087457 (= e!621165 true)))

(assert (=> b!1087457 (= (-!808 lt!483926 k0!904) lt!483922)))

(declare-fun lt!483916 () Unit!35782)

(declare-fun addRemoveCommutativeForDiffKeys!40 (ListLongMap!14935 (_ BitVec 64) V!40627 (_ BitVec 64)) Unit!35782)

(assert (=> b!1087457 (= lt!483916 (addRemoveCommutativeForDiffKeys!40 lt!483920 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087458 () Bool)

(declare-fun res!725206 () Bool)

(assert (=> b!1087458 (=> (not res!725206) (not e!621163))))

(assert (=> b!1087458 (= res!725206 (= (select (arr!33762 _keys!1070) i!650) k0!904))))

(declare-fun b!1087459 () Bool)

(declare-fun res!725210 () Bool)

(assert (=> b!1087459 (=> (not res!725210) (not e!621163))))

(assert (=> b!1087459 (= res!725210 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23551))))

(assert (= (and start!95970 res!725211) b!1087450))

(assert (= (and b!1087450 res!725204) b!1087454))

(assert (= (and b!1087454 res!725205) b!1087459))

(assert (= (and b!1087459 res!725210) b!1087449))

(assert (= (and b!1087449 res!725213) b!1087448))

(assert (= (and b!1087448 res!725208) b!1087458))

(assert (= (and b!1087458 res!725206) b!1087446))

(assert (= (and b!1087446 res!725207) b!1087456))

(assert (= (and b!1087456 res!725212) b!1087452))

(assert (= (and b!1087452 (not res!725214)) b!1087451))

(assert (= (and b!1087451 (not res!725209)) b!1087457))

(assert (= (and b!1087453 condMapEmpty!41692) mapIsEmpty!41692))

(assert (= (and b!1087453 (not condMapEmpty!41692)) mapNonEmpty!41692))

(get-info :version)

(assert (= (and mapNonEmpty!41692 ((_ is ValueCellFull!12603) mapValue!41692)) b!1087447))

(assert (= (and b!1087453 ((_ is ValueCellFull!12603) mapDefault!41692)) b!1087455))

(assert (= start!95970 b!1087453))

(declare-fun b_lambda!17293 () Bool)

(assert (=> (not b_lambda!17293) (not b!1087452)))

(declare-fun t!33233 () Bool)

(declare-fun tb!7501 () Bool)

(assert (=> (and start!95970 (= defaultEntry!882 defaultEntry!882) t!33233) tb!7501))

(declare-fun result!15521 () Bool)

(assert (=> tb!7501 (= result!15521 tp_is_empty!26625)))

(assert (=> b!1087452 t!33233))

(declare-fun b_and!35923 () Bool)

(assert (= b_and!35921 (and (=> t!33233 result!15521) b_and!35923)))

(declare-fun m!1006331 () Bool)

(assert (=> b!1087446 m!1006331))

(declare-fun m!1006333 () Bool)

(assert (=> b!1087446 m!1006333))

(declare-fun m!1006335 () Bool)

(assert (=> b!1087448 m!1006335))

(declare-fun m!1006337 () Bool)

(assert (=> b!1087451 m!1006337))

(declare-fun m!1006339 () Bool)

(assert (=> b!1087451 m!1006339))

(declare-fun m!1006341 () Bool)

(assert (=> b!1087451 m!1006341))

(declare-fun m!1006343 () Bool)

(assert (=> mapNonEmpty!41692 m!1006343))

(declare-fun m!1006345 () Bool)

(assert (=> b!1087452 m!1006345))

(declare-fun m!1006347 () Bool)

(assert (=> b!1087452 m!1006347))

(declare-fun m!1006349 () Bool)

(assert (=> b!1087452 m!1006349))

(declare-fun m!1006351 () Bool)

(assert (=> b!1087452 m!1006351))

(declare-fun m!1006353 () Bool)

(assert (=> b!1087452 m!1006353))

(declare-fun m!1006355 () Bool)

(assert (=> b!1087452 m!1006355))

(declare-fun m!1006357 () Bool)

(assert (=> b!1087452 m!1006357))

(declare-fun m!1006359 () Bool)

(assert (=> b!1087452 m!1006359))

(declare-fun m!1006361 () Bool)

(assert (=> b!1087452 m!1006361))

(declare-fun m!1006363 () Bool)

(assert (=> b!1087452 m!1006363))

(declare-fun m!1006365 () Bool)

(assert (=> b!1087454 m!1006365))

(declare-fun m!1006367 () Bool)

(assert (=> start!95970 m!1006367))

(declare-fun m!1006369 () Bool)

(assert (=> start!95970 m!1006369))

(declare-fun m!1006371 () Bool)

(assert (=> start!95970 m!1006371))

(declare-fun m!1006373 () Bool)

(assert (=> b!1087456 m!1006373))

(declare-fun m!1006375 () Bool)

(assert (=> b!1087458 m!1006375))

(declare-fun m!1006377 () Bool)

(assert (=> b!1087457 m!1006377))

(declare-fun m!1006379 () Bool)

(assert (=> b!1087457 m!1006379))

(declare-fun m!1006381 () Bool)

(assert (=> b!1087459 m!1006381))

(check-sat (not b!1087451) (not b_next!22623) (not start!95970) (not b!1087457) (not b!1087454) (not b!1087456) (not mapNonEmpty!41692) tp_is_empty!26625 (not b!1087452) b_and!35923 (not b_lambda!17293) (not b!1087459) (not b!1087446) (not b!1087448))
(check-sat b_and!35923 (not b_next!22623))
