; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95874 () Bool)

(assert start!95874)

(declare-fun b_free!22527 () Bool)

(declare-fun b_next!22527 () Bool)

(assert (=> start!95874 (= b_free!22527 (not b_next!22527))))

(declare-fun tp!79429 () Bool)

(declare-fun b_and!35729 () Bool)

(assert (=> start!95874 (= tp!79429 b_and!35729)))

(declare-fun b!1085325 () Bool)

(declare-fun res!723614 () Bool)

(declare-fun e!620014 () Bool)

(assert (=> b!1085325 (=> (not res!723614) (not e!620014))))

(declare-datatypes ((array!69993 0))(
  ( (array!69994 (arr!33670 (Array (_ BitVec 32) (_ BitVec 64))) (size!34206 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69993)

(declare-datatypes ((List!23477 0))(
  ( (Nil!23474) (Cons!23473 (h!24682 (_ BitVec 64)) (t!33062 List!23477)) )
))
(declare-fun arrayNoDuplicates!0 (array!69993 (_ BitVec 32) List!23477) Bool)

(assert (=> b!1085325 (= res!723614 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23474))))

(declare-fun b!1085326 () Bool)

(declare-fun e!620016 () Bool)

(declare-fun tp_is_empty!26529 () Bool)

(assert (=> b!1085326 (= e!620016 tp_is_empty!26529)))

(declare-fun b!1085327 () Bool)

(declare-fun e!620015 () Bool)

(assert (=> b!1085327 (= e!620014 e!620015)))

(declare-fun res!723620 () Bool)

(assert (=> b!1085327 (=> (not res!723620) (not e!620015))))

(declare-fun lt!481556 () array!69993)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69993 (_ BitVec 32)) Bool)

(assert (=> b!1085327 (= res!723620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481556 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085327 (= lt!481556 (array!69994 (store (arr!33670 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34206 _keys!1070)))))

(declare-fun b!1085328 () Bool)

(declare-fun res!723611 () Bool)

(assert (=> b!1085328 (=> (not res!723611) (not e!620014))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1085328 (= res!723611 (= (select (arr!33670 _keys!1070) i!650) k0!904))))

(declare-fun b!1085330 () Bool)

(declare-fun e!620012 () Bool)

(assert (=> b!1085330 (= e!620015 (not e!620012))))

(declare-fun res!723616 () Bool)

(assert (=> b!1085330 (=> res!723616 e!620012)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085330 (= res!723616 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40499 0))(
  ( (V!40500 (val!13321 Int)) )
))
(declare-fun minValue!831 () V!40499)

(declare-datatypes ((tuple2!16888 0))(
  ( (tuple2!16889 (_1!8455 (_ BitVec 64)) (_2!8455 V!40499)) )
))
(declare-datatypes ((List!23478 0))(
  ( (Nil!23475) (Cons!23474 (h!24683 tuple2!16888) (t!33063 List!23478)) )
))
(declare-datatypes ((ListLongMap!14857 0))(
  ( (ListLongMap!14858 (toList!7444 List!23478)) )
))
(declare-fun lt!481564 () ListLongMap!14857)

(declare-fun zeroValue!831 () V!40499)

(declare-datatypes ((ValueCell!12555 0))(
  ( (ValueCellFull!12555 (v!15942 V!40499)) (EmptyCell!12555) )
))
(declare-datatypes ((array!69995 0))(
  ( (array!69996 (arr!33671 (Array (_ BitVec 32) ValueCell!12555)) (size!34207 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69995)

(declare-fun getCurrentListMap!4229 (array!69993 array!69995 (_ BitVec 32) (_ BitVec 32) V!40499 V!40499 (_ BitVec 32) Int) ListLongMap!14857)

(assert (=> b!1085330 (= lt!481564 (getCurrentListMap!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481565 () array!69995)

(declare-fun lt!481557 () ListLongMap!14857)

(assert (=> b!1085330 (= lt!481557 (getCurrentListMap!4229 lt!481556 lt!481565 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481553 () ListLongMap!14857)

(declare-fun lt!481554 () ListLongMap!14857)

(assert (=> b!1085330 (and (= lt!481553 lt!481554) (= lt!481554 lt!481553))))

(declare-fun lt!481559 () ListLongMap!14857)

(declare-fun -!770 (ListLongMap!14857 (_ BitVec 64)) ListLongMap!14857)

(assert (=> b!1085330 (= lt!481554 (-!770 lt!481559 k0!904))))

(declare-datatypes ((Unit!35706 0))(
  ( (Unit!35707) )
))
(declare-fun lt!481562 () Unit!35706)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!48 (array!69993 array!69995 (_ BitVec 32) (_ BitVec 32) V!40499 V!40499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35706)

(assert (=> b!1085330 (= lt!481562 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!48 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3989 (array!69993 array!69995 (_ BitVec 32) (_ BitVec 32) V!40499 V!40499 (_ BitVec 32) Int) ListLongMap!14857)

(assert (=> b!1085330 (= lt!481553 (getCurrentListMapNoExtraKeys!3989 lt!481556 lt!481565 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2126 (Int (_ BitVec 64)) V!40499)

(assert (=> b!1085330 (= lt!481565 (array!69996 (store (arr!33671 _values!874) i!650 (ValueCellFull!12555 (dynLambda!2126 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34207 _values!874)))))

(assert (=> b!1085330 (= lt!481559 (getCurrentListMapNoExtraKeys!3989 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085330 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481555 () Unit!35706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69993 (_ BitVec 64) (_ BitVec 32)) Unit!35706)

(assert (=> b!1085330 (= lt!481555 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085331 () Bool)

(declare-fun e!620017 () Bool)

(declare-fun e!620013 () Bool)

(declare-fun mapRes!41548 () Bool)

(assert (=> b!1085331 (= e!620017 (and e!620013 mapRes!41548))))

(declare-fun condMapEmpty!41548 () Bool)

(declare-fun mapDefault!41548 () ValueCell!12555)

(assert (=> b!1085331 (= condMapEmpty!41548 (= (arr!33671 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12555)) mapDefault!41548)))))

(declare-fun b!1085332 () Bool)

(declare-fun e!620011 () Bool)

(assert (=> b!1085332 (= e!620012 e!620011)))

(declare-fun res!723613 () Bool)

(assert (=> b!1085332 (=> res!723613 e!620011)))

(assert (=> b!1085332 (= res!723613 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481558 () ListLongMap!14857)

(declare-fun lt!481560 () ListLongMap!14857)

(assert (=> b!1085332 (= lt!481558 lt!481560)))

(declare-fun lt!481566 () ListLongMap!14857)

(assert (=> b!1085332 (= lt!481558 (-!770 lt!481566 k0!904))))

(declare-fun lt!481552 () Unit!35706)

(declare-fun addRemoveCommutativeForDiffKeys!9 (ListLongMap!14857 (_ BitVec 64) V!40499 (_ BitVec 64)) Unit!35706)

(assert (=> b!1085332 (= lt!481552 (addRemoveCommutativeForDiffKeys!9 lt!481559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481551 () tuple2!16888)

(declare-fun +!3253 (ListLongMap!14857 tuple2!16888) ListLongMap!14857)

(assert (=> b!1085332 (= lt!481557 (+!3253 lt!481560 lt!481551))))

(declare-fun lt!481567 () tuple2!16888)

(assert (=> b!1085332 (= lt!481560 (+!3253 lt!481554 lt!481567))))

(declare-fun lt!481561 () ListLongMap!14857)

(assert (=> b!1085332 (= lt!481564 lt!481561)))

(assert (=> b!1085332 (= lt!481561 (+!3253 lt!481566 lt!481551))))

(assert (=> b!1085332 (= lt!481566 (+!3253 lt!481559 lt!481567))))

(assert (=> b!1085332 (= lt!481557 (+!3253 (+!3253 lt!481553 lt!481567) lt!481551))))

(assert (=> b!1085332 (= lt!481551 (tuple2!16889 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085332 (= lt!481567 (tuple2!16889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085333 () Bool)

(declare-fun res!723617 () Bool)

(assert (=> b!1085333 (=> (not res!723617) (not e!620014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085333 (= res!723617 (validKeyInArray!0 k0!904))))

(declare-fun b!1085329 () Bool)

(assert (=> b!1085329 (= e!620013 tp_is_empty!26529)))

(declare-fun res!723621 () Bool)

(assert (=> start!95874 (=> (not res!723621) (not e!620014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95874 (= res!723621 (validMask!0 mask!1414))))

(assert (=> start!95874 e!620014))

(assert (=> start!95874 tp!79429))

(assert (=> start!95874 true))

(assert (=> start!95874 tp_is_empty!26529))

(declare-fun array_inv!25982 (array!69993) Bool)

(assert (=> start!95874 (array_inv!25982 _keys!1070)))

(declare-fun array_inv!25983 (array!69995) Bool)

(assert (=> start!95874 (and (array_inv!25983 _values!874) e!620017)))

(declare-fun b!1085334 () Bool)

(declare-fun res!723618 () Bool)

(assert (=> b!1085334 (=> (not res!723618) (not e!620015))))

(assert (=> b!1085334 (= res!723618 (arrayNoDuplicates!0 lt!481556 #b00000000000000000000000000000000 Nil!23474))))

(declare-fun b!1085335 () Bool)

(assert (=> b!1085335 (= e!620011 true)))

(assert (=> b!1085335 (= (-!770 lt!481561 k0!904) (+!3253 lt!481558 lt!481551))))

(declare-fun lt!481563 () Unit!35706)

(assert (=> b!1085335 (= lt!481563 (addRemoveCommutativeForDiffKeys!9 lt!481566 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085336 () Bool)

(declare-fun res!723619 () Bool)

(assert (=> b!1085336 (=> (not res!723619) (not e!620014))))

(assert (=> b!1085336 (= res!723619 (and (= (size!34207 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34206 _keys!1070) (size!34207 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085337 () Bool)

(declare-fun res!723615 () Bool)

(assert (=> b!1085337 (=> (not res!723615) (not e!620014))))

(assert (=> b!1085337 (= res!723615 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34206 _keys!1070))))))

(declare-fun mapIsEmpty!41548 () Bool)

(assert (=> mapIsEmpty!41548 mapRes!41548))

(declare-fun mapNonEmpty!41548 () Bool)

(declare-fun tp!79430 () Bool)

(assert (=> mapNonEmpty!41548 (= mapRes!41548 (and tp!79430 e!620016))))

(declare-fun mapKey!41548 () (_ BitVec 32))

(declare-fun mapRest!41548 () (Array (_ BitVec 32) ValueCell!12555))

(declare-fun mapValue!41548 () ValueCell!12555)

(assert (=> mapNonEmpty!41548 (= (arr!33671 _values!874) (store mapRest!41548 mapKey!41548 mapValue!41548))))

(declare-fun b!1085338 () Bool)

(declare-fun res!723612 () Bool)

(assert (=> b!1085338 (=> (not res!723612) (not e!620014))))

(assert (=> b!1085338 (= res!723612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95874 res!723621) b!1085336))

(assert (= (and b!1085336 res!723619) b!1085338))

(assert (= (and b!1085338 res!723612) b!1085325))

(assert (= (and b!1085325 res!723614) b!1085337))

(assert (= (and b!1085337 res!723615) b!1085333))

(assert (= (and b!1085333 res!723617) b!1085328))

(assert (= (and b!1085328 res!723611) b!1085327))

(assert (= (and b!1085327 res!723620) b!1085334))

(assert (= (and b!1085334 res!723618) b!1085330))

(assert (= (and b!1085330 (not res!723616)) b!1085332))

(assert (= (and b!1085332 (not res!723613)) b!1085335))

(assert (= (and b!1085331 condMapEmpty!41548) mapIsEmpty!41548))

(assert (= (and b!1085331 (not condMapEmpty!41548)) mapNonEmpty!41548))

(get-info :version)

(assert (= (and mapNonEmpty!41548 ((_ is ValueCellFull!12555) mapValue!41548)) b!1085326))

(assert (= (and b!1085331 ((_ is ValueCellFull!12555) mapDefault!41548)) b!1085329))

(assert (= start!95874 b!1085331))

(declare-fun b_lambda!17197 () Bool)

(assert (=> (not b_lambda!17197) (not b!1085330)))

(declare-fun t!33061 () Bool)

(declare-fun tb!7405 () Bool)

(assert (=> (and start!95874 (= defaultEntry!882 defaultEntry!882) t!33061) tb!7405))

(declare-fun result!15329 () Bool)

(assert (=> tb!7405 (= result!15329 tp_is_empty!26529)))

(assert (=> b!1085330 t!33061))

(declare-fun b_and!35731 () Bool)

(assert (= b_and!35729 (and (=> t!33061 result!15329) b_and!35731)))

(declare-fun m!1003319 () Bool)

(assert (=> b!1085335 m!1003319))

(declare-fun m!1003321 () Bool)

(assert (=> b!1085335 m!1003321))

(declare-fun m!1003323 () Bool)

(assert (=> b!1085335 m!1003323))

(declare-fun m!1003325 () Bool)

(assert (=> b!1085325 m!1003325))

(declare-fun m!1003327 () Bool)

(assert (=> b!1085327 m!1003327))

(declare-fun m!1003329 () Bool)

(assert (=> b!1085327 m!1003329))

(declare-fun m!1003331 () Bool)

(assert (=> b!1085332 m!1003331))

(declare-fun m!1003333 () Bool)

(assert (=> b!1085332 m!1003333))

(declare-fun m!1003335 () Bool)

(assert (=> b!1085332 m!1003335))

(declare-fun m!1003337 () Bool)

(assert (=> b!1085332 m!1003337))

(declare-fun m!1003339 () Bool)

(assert (=> b!1085332 m!1003339))

(declare-fun m!1003341 () Bool)

(assert (=> b!1085332 m!1003341))

(assert (=> b!1085332 m!1003337))

(declare-fun m!1003343 () Bool)

(assert (=> b!1085332 m!1003343))

(declare-fun m!1003345 () Bool)

(assert (=> b!1085332 m!1003345))

(declare-fun m!1003347 () Bool)

(assert (=> b!1085333 m!1003347))

(declare-fun m!1003349 () Bool)

(assert (=> b!1085330 m!1003349))

(declare-fun m!1003351 () Bool)

(assert (=> b!1085330 m!1003351))

(declare-fun m!1003353 () Bool)

(assert (=> b!1085330 m!1003353))

(declare-fun m!1003355 () Bool)

(assert (=> b!1085330 m!1003355))

(declare-fun m!1003357 () Bool)

(assert (=> b!1085330 m!1003357))

(declare-fun m!1003359 () Bool)

(assert (=> b!1085330 m!1003359))

(declare-fun m!1003361 () Bool)

(assert (=> b!1085330 m!1003361))

(declare-fun m!1003363 () Bool)

(assert (=> b!1085330 m!1003363))

(declare-fun m!1003365 () Bool)

(assert (=> b!1085330 m!1003365))

(declare-fun m!1003367 () Bool)

(assert (=> b!1085330 m!1003367))

(declare-fun m!1003369 () Bool)

(assert (=> mapNonEmpty!41548 m!1003369))

(declare-fun m!1003371 () Bool)

(assert (=> b!1085328 m!1003371))

(declare-fun m!1003373 () Bool)

(assert (=> b!1085338 m!1003373))

(declare-fun m!1003375 () Bool)

(assert (=> b!1085334 m!1003375))

(declare-fun m!1003377 () Bool)

(assert (=> start!95874 m!1003377))

(declare-fun m!1003379 () Bool)

(assert (=> start!95874 m!1003379))

(declare-fun m!1003381 () Bool)

(assert (=> start!95874 m!1003381))

(check-sat (not b!1085332) (not b!1085327) (not b!1085325) (not b_lambda!17197) (not start!95874) tp_is_empty!26529 (not b!1085330) (not b!1085334) (not mapNonEmpty!41548) (not b!1085333) (not b!1085335) (not b_next!22527) (not b!1085338) b_and!35731)
(check-sat b_and!35731 (not b_next!22527))
