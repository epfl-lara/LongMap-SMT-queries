; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95860 () Bool)

(assert start!95860)

(declare-fun b_free!22519 () Bool)

(declare-fun b_next!22519 () Bool)

(assert (=> start!95860 (= b_free!22519 (not b_next!22519))))

(declare-fun tp!79405 () Bool)

(declare-fun b_and!35687 () Bool)

(assert (=> start!95860 (= tp!79405 b_and!35687)))

(declare-fun b!1084996 () Bool)

(declare-fun e!619824 () Bool)

(declare-fun tp_is_empty!26521 () Bool)

(assert (=> b!1084996 (= e!619824 tp_is_empty!26521)))

(declare-fun b!1084997 () Bool)

(declare-fun e!619822 () Bool)

(declare-fun e!619828 () Bool)

(assert (=> b!1084997 (= e!619822 (not e!619828))))

(declare-fun res!723416 () Bool)

(assert (=> b!1084997 (=> res!723416 e!619828)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084997 (= res!723416 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40489 0))(
  ( (V!40490 (val!13317 Int)) )
))
(declare-fun minValue!831 () V!40489)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16936 0))(
  ( (tuple2!16937 (_1!8479 (_ BitVec 64)) (_2!8479 V!40489)) )
))
(declare-datatypes ((List!23507 0))(
  ( (Nil!23504) (Cons!23503 (h!24712 tuple2!16936) (t!33075 List!23507)) )
))
(declare-datatypes ((ListLongMap!14905 0))(
  ( (ListLongMap!14906 (toList!7468 List!23507)) )
))
(declare-fun lt!481156 () ListLongMap!14905)

(declare-fun zeroValue!831 () V!40489)

(declare-datatypes ((array!69900 0))(
  ( (array!69901 (arr!33624 (Array (_ BitVec 32) (_ BitVec 64))) (size!34162 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69900)

(declare-datatypes ((ValueCell!12551 0))(
  ( (ValueCellFull!12551 (v!15937 V!40489)) (EmptyCell!12551) )
))
(declare-datatypes ((array!69902 0))(
  ( (array!69903 (arr!33625 (Array (_ BitVec 32) ValueCell!12551)) (size!34163 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69902)

(declare-fun getCurrentListMap!4159 (array!69900 array!69902 (_ BitVec 32) (_ BitVec 32) V!40489 V!40489 (_ BitVec 32) Int) ListLongMap!14905)

(assert (=> b!1084997 (= lt!481156 (getCurrentListMap!4159 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481148 () array!69900)

(declare-fun lt!481158 () ListLongMap!14905)

(declare-fun lt!481161 () array!69902)

(assert (=> b!1084997 (= lt!481158 (getCurrentListMap!4159 lt!481148 lt!481161 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481151 () ListLongMap!14905)

(declare-fun lt!481153 () ListLongMap!14905)

(assert (=> b!1084997 (and (= lt!481151 lt!481153) (= lt!481153 lt!481151))))

(declare-fun lt!481154 () ListLongMap!14905)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!747 (ListLongMap!14905 (_ BitVec 64)) ListLongMap!14905)

(assert (=> b!1084997 (= lt!481153 (-!747 lt!481154 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35529 0))(
  ( (Unit!35530) )
))
(declare-fun lt!481157 () Unit!35529)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!43 (array!69900 array!69902 (_ BitVec 32) (_ BitVec 32) V!40489 V!40489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35529)

(assert (=> b!1084997 (= lt!481157 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!43 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4029 (array!69900 array!69902 (_ BitVec 32) (_ BitVec 32) V!40489 V!40489 (_ BitVec 32) Int) ListLongMap!14905)

(assert (=> b!1084997 (= lt!481151 (getCurrentListMapNoExtraKeys!4029 lt!481148 lt!481161 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2100 (Int (_ BitVec 64)) V!40489)

(assert (=> b!1084997 (= lt!481161 (array!69903 (store (arr!33625 _values!874) i!650 (ValueCellFull!12551 (dynLambda!2100 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34163 _values!874)))))

(assert (=> b!1084997 (= lt!481154 (getCurrentListMapNoExtraKeys!4029 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084997 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481160 () Unit!35529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69900 (_ BitVec 64) (_ BitVec 32)) Unit!35529)

(assert (=> b!1084997 (= lt!481160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084998 () Bool)

(declare-fun e!619826 () Bool)

(assert (=> b!1084998 (= e!619826 e!619822)))

(declare-fun res!723414 () Bool)

(assert (=> b!1084998 (=> (not res!723414) (not e!619822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69900 (_ BitVec 32)) Bool)

(assert (=> b!1084998 (= res!723414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481148 mask!1414))))

(assert (=> b!1084998 (= lt!481148 (array!69901 (store (arr!33624 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34162 _keys!1070)))))

(declare-fun b!1084999 () Bool)

(declare-fun e!619825 () Bool)

(assert (=> b!1084999 (= e!619828 e!619825)))

(declare-fun res!723415 () Bool)

(assert (=> b!1084999 (=> res!723415 e!619825)))

(assert (=> b!1084999 (= res!723415 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481155 () ListLongMap!14905)

(declare-fun lt!481162 () ListLongMap!14905)

(assert (=> b!1084999 (= lt!481155 lt!481162)))

(declare-fun lt!481149 () ListLongMap!14905)

(assert (=> b!1084999 (= lt!481155 (-!747 lt!481149 k0!904))))

(declare-fun lt!481159 () Unit!35529)

(declare-fun addRemoveCommutativeForDiffKeys!6 (ListLongMap!14905 (_ BitVec 64) V!40489 (_ BitVec 64)) Unit!35529)

(assert (=> b!1084999 (= lt!481159 (addRemoveCommutativeForDiffKeys!6 lt!481154 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481150 () tuple2!16936)

(declare-fun +!3277 (ListLongMap!14905 tuple2!16936) ListLongMap!14905)

(assert (=> b!1084999 (= lt!481158 (+!3277 lt!481162 lt!481150))))

(declare-fun lt!481152 () tuple2!16936)

(assert (=> b!1084999 (= lt!481162 (+!3277 lt!481153 lt!481152))))

(declare-fun lt!481147 () ListLongMap!14905)

(assert (=> b!1084999 (= lt!481156 lt!481147)))

(assert (=> b!1084999 (= lt!481147 (+!3277 lt!481149 lt!481150))))

(assert (=> b!1084999 (= lt!481149 (+!3277 lt!481154 lt!481152))))

(assert (=> b!1084999 (= lt!481158 (+!3277 (+!3277 lt!481151 lt!481152) lt!481150))))

(assert (=> b!1084999 (= lt!481150 (tuple2!16937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084999 (= lt!481152 (tuple2!16937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085000 () Bool)

(declare-fun res!723412 () Bool)

(assert (=> b!1085000 (=> (not res!723412) (not e!619826))))

(assert (=> b!1085000 (= res!723412 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34162 _keys!1070))))))

(declare-fun b!1085001 () Bool)

(declare-fun res!723418 () Bool)

(assert (=> b!1085001 (=> (not res!723418) (not e!619822))))

(declare-datatypes ((List!23508 0))(
  ( (Nil!23505) (Cons!23504 (h!24713 (_ BitVec 64)) (t!33076 List!23508)) )
))
(declare-fun arrayNoDuplicates!0 (array!69900 (_ BitVec 32) List!23508) Bool)

(assert (=> b!1085001 (= res!723418 (arrayNoDuplicates!0 lt!481148 #b00000000000000000000000000000000 Nil!23505))))

(declare-fun mapIsEmpty!41536 () Bool)

(declare-fun mapRes!41536 () Bool)

(assert (=> mapIsEmpty!41536 mapRes!41536))

(declare-fun b!1085002 () Bool)

(declare-fun res!723413 () Bool)

(assert (=> b!1085002 (=> (not res!723413) (not e!619826))))

(assert (=> b!1085002 (= res!723413 (and (= (size!34163 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34162 _keys!1070) (size!34163 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!723420 () Bool)

(assert (=> start!95860 (=> (not res!723420) (not e!619826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95860 (= res!723420 (validMask!0 mask!1414))))

(assert (=> start!95860 e!619826))

(assert (=> start!95860 tp!79405))

(assert (=> start!95860 true))

(assert (=> start!95860 tp_is_empty!26521))

(declare-fun array_inv!25986 (array!69900) Bool)

(assert (=> start!95860 (array_inv!25986 _keys!1070)))

(declare-fun e!619827 () Bool)

(declare-fun array_inv!25987 (array!69902) Bool)

(assert (=> start!95860 (and (array_inv!25987 _values!874) e!619827)))

(declare-fun mapNonEmpty!41536 () Bool)

(declare-fun tp!79406 () Bool)

(declare-fun e!619823 () Bool)

(assert (=> mapNonEmpty!41536 (= mapRes!41536 (and tp!79406 e!619823))))

(declare-fun mapValue!41536 () ValueCell!12551)

(declare-fun mapKey!41536 () (_ BitVec 32))

(declare-fun mapRest!41536 () (Array (_ BitVec 32) ValueCell!12551))

(assert (=> mapNonEmpty!41536 (= (arr!33625 _values!874) (store mapRest!41536 mapKey!41536 mapValue!41536))))

(declare-fun b!1085003 () Bool)

(assert (=> b!1085003 (= e!619825 true)))

(assert (=> b!1085003 (= (-!747 lt!481147 k0!904) (+!3277 lt!481155 lt!481150))))

(declare-fun lt!481163 () Unit!35529)

(assert (=> b!1085003 (= lt!481163 (addRemoveCommutativeForDiffKeys!6 lt!481149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085004 () Bool)

(declare-fun res!723417 () Bool)

(assert (=> b!1085004 (=> (not res!723417) (not e!619826))))

(assert (=> b!1085004 (= res!723417 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23505))))

(declare-fun b!1085005 () Bool)

(declare-fun res!723411 () Bool)

(assert (=> b!1085005 (=> (not res!723411) (not e!619826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085005 (= res!723411 (validKeyInArray!0 k0!904))))

(declare-fun b!1085006 () Bool)

(declare-fun res!723410 () Bool)

(assert (=> b!1085006 (=> (not res!723410) (not e!619826))))

(assert (=> b!1085006 (= res!723410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085007 () Bool)

(assert (=> b!1085007 (= e!619827 (and e!619824 mapRes!41536))))

(declare-fun condMapEmpty!41536 () Bool)

(declare-fun mapDefault!41536 () ValueCell!12551)

(assert (=> b!1085007 (= condMapEmpty!41536 (= (arr!33625 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12551)) mapDefault!41536)))))

(declare-fun b!1085008 () Bool)

(assert (=> b!1085008 (= e!619823 tp_is_empty!26521)))

(declare-fun b!1085009 () Bool)

(declare-fun res!723419 () Bool)

(assert (=> b!1085009 (=> (not res!723419) (not e!619826))))

(assert (=> b!1085009 (= res!723419 (= (select (arr!33624 _keys!1070) i!650) k0!904))))

(assert (= (and start!95860 res!723420) b!1085002))

(assert (= (and b!1085002 res!723413) b!1085006))

(assert (= (and b!1085006 res!723410) b!1085004))

(assert (= (and b!1085004 res!723417) b!1085000))

(assert (= (and b!1085000 res!723412) b!1085005))

(assert (= (and b!1085005 res!723411) b!1085009))

(assert (= (and b!1085009 res!723419) b!1084998))

(assert (= (and b!1084998 res!723414) b!1085001))

(assert (= (and b!1085001 res!723418) b!1084997))

(assert (= (and b!1084997 (not res!723416)) b!1084999))

(assert (= (and b!1084999 (not res!723415)) b!1085003))

(assert (= (and b!1085007 condMapEmpty!41536) mapIsEmpty!41536))

(assert (= (and b!1085007 (not condMapEmpty!41536)) mapNonEmpty!41536))

(get-info :version)

(assert (= (and mapNonEmpty!41536 ((_ is ValueCellFull!12551) mapValue!41536)) b!1085008))

(assert (= (and b!1085007 ((_ is ValueCellFull!12551) mapDefault!41536)) b!1084996))

(assert (= start!95860 b!1085007))

(declare-fun b_lambda!17167 () Bool)

(assert (=> (not b_lambda!17167) (not b!1084997)))

(declare-fun t!33074 () Bool)

(declare-fun tb!7389 () Bool)

(assert (=> (and start!95860 (= defaultEntry!882 defaultEntry!882) t!33074) tb!7389))

(declare-fun result!15305 () Bool)

(assert (=> tb!7389 (= result!15305 tp_is_empty!26521)))

(assert (=> b!1084997 t!33074))

(declare-fun b_and!35689 () Bool)

(assert (= b_and!35687 (and (=> t!33074 result!15305) b_and!35689)))

(declare-fun m!1002437 () Bool)

(assert (=> b!1085005 m!1002437))

(declare-fun m!1002439 () Bool)

(assert (=> b!1085003 m!1002439))

(declare-fun m!1002441 () Bool)

(assert (=> b!1085003 m!1002441))

(declare-fun m!1002443 () Bool)

(assert (=> b!1085003 m!1002443))

(declare-fun m!1002445 () Bool)

(assert (=> b!1084998 m!1002445))

(declare-fun m!1002447 () Bool)

(assert (=> b!1084998 m!1002447))

(declare-fun m!1002449 () Bool)

(assert (=> start!95860 m!1002449))

(declare-fun m!1002451 () Bool)

(assert (=> start!95860 m!1002451))

(declare-fun m!1002453 () Bool)

(assert (=> start!95860 m!1002453))

(declare-fun m!1002455 () Bool)

(assert (=> b!1085001 m!1002455))

(declare-fun m!1002457 () Bool)

(assert (=> b!1085009 m!1002457))

(declare-fun m!1002459 () Bool)

(assert (=> b!1085004 m!1002459))

(declare-fun m!1002461 () Bool)

(assert (=> b!1084997 m!1002461))

(declare-fun m!1002463 () Bool)

(assert (=> b!1084997 m!1002463))

(declare-fun m!1002465 () Bool)

(assert (=> b!1084997 m!1002465))

(declare-fun m!1002467 () Bool)

(assert (=> b!1084997 m!1002467))

(declare-fun m!1002469 () Bool)

(assert (=> b!1084997 m!1002469))

(declare-fun m!1002471 () Bool)

(assert (=> b!1084997 m!1002471))

(declare-fun m!1002473 () Bool)

(assert (=> b!1084997 m!1002473))

(declare-fun m!1002475 () Bool)

(assert (=> b!1084997 m!1002475))

(declare-fun m!1002477 () Bool)

(assert (=> b!1084997 m!1002477))

(declare-fun m!1002479 () Bool)

(assert (=> b!1084997 m!1002479))

(declare-fun m!1002481 () Bool)

(assert (=> b!1084999 m!1002481))

(declare-fun m!1002483 () Bool)

(assert (=> b!1084999 m!1002483))

(declare-fun m!1002485 () Bool)

(assert (=> b!1084999 m!1002485))

(assert (=> b!1084999 m!1002481))

(declare-fun m!1002487 () Bool)

(assert (=> b!1084999 m!1002487))

(declare-fun m!1002489 () Bool)

(assert (=> b!1084999 m!1002489))

(declare-fun m!1002491 () Bool)

(assert (=> b!1084999 m!1002491))

(declare-fun m!1002493 () Bool)

(assert (=> b!1084999 m!1002493))

(declare-fun m!1002495 () Bool)

(assert (=> b!1084999 m!1002495))

(declare-fun m!1002497 () Bool)

(assert (=> b!1085006 m!1002497))

(declare-fun m!1002499 () Bool)

(assert (=> mapNonEmpty!41536 m!1002499))

(check-sat (not b!1084997) (not b!1084998) (not b!1085005) (not b_lambda!17167) (not b!1085004) (not b_next!22519) (not mapNonEmpty!41536) tp_is_empty!26521 (not b!1085001) (not b!1084999) (not start!95860) b_and!35689 (not b!1085003) (not b!1085006))
(check-sat b_and!35689 (not b_next!22519))
