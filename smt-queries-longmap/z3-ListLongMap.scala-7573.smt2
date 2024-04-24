; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95994 () Bool)

(assert start!95994)

(declare-fun b_free!22411 () Bool)

(declare-fun b_next!22411 () Bool)

(assert (=> start!95994 (= b_free!22411 (not b_next!22411))))

(declare-fun tp!79081 () Bool)

(declare-fun b_and!35507 () Bool)

(assert (=> start!95994 (= tp!79081 b_and!35507)))

(declare-fun b!1084348 () Bool)

(declare-fun e!619733 () Bool)

(declare-fun tp_is_empty!26413 () Bool)

(assert (=> b!1084348 (= e!619733 tp_is_empty!26413)))

(declare-fun b!1084349 () Bool)

(declare-fun res!722467 () Bool)

(declare-fun e!619735 () Bool)

(assert (=> b!1084349 (=> (not res!722467) (not e!619735))))

(declare-datatypes ((array!69809 0))(
  ( (array!69810 (arr!33572 (Array (_ BitVec 32) (_ BitVec 64))) (size!34109 (_ BitVec 32))) )
))
(declare-fun lt!480392 () array!69809)

(declare-datatypes ((List!23404 0))(
  ( (Nil!23401) (Cons!23400 (h!24618 (_ BitVec 64)) (t!32865 List!23404)) )
))
(declare-fun arrayNoDuplicates!0 (array!69809 (_ BitVec 32) List!23404) Bool)

(assert (=> b!1084349 (= res!722467 (arrayNoDuplicates!0 lt!480392 #b00000000000000000000000000000000 Nil!23401))))

(declare-fun b!1084350 () Bool)

(declare-fun res!722470 () Bool)

(declare-fun e!619736 () Bool)

(assert (=> b!1084350 (=> (not res!722470) (not e!619736))))

(declare-fun _keys!1070 () array!69809)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69809 (_ BitVec 32)) Bool)

(assert (=> b!1084350 (= res!722470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084351 () Bool)

(assert (=> b!1084351 (= e!619735 (not true))))

(declare-datatypes ((V!40345 0))(
  ( (V!40346 (val!13263 Int)) )
))
(declare-datatypes ((tuple2!16810 0))(
  ( (tuple2!16811 (_1!8416 (_ BitVec 64)) (_2!8416 V!40345)) )
))
(declare-datatypes ((List!23405 0))(
  ( (Nil!23402) (Cons!23401 (h!24619 tuple2!16810) (t!32866 List!23405)) )
))
(declare-datatypes ((ListLongMap!14787 0))(
  ( (ListLongMap!14788 (toList!7409 List!23405)) )
))
(declare-fun lt!480393 () ListLongMap!14787)

(declare-fun lt!480396 () ListLongMap!14787)

(assert (=> b!1084351 (and (= lt!480393 lt!480396) (= lt!480396 lt!480393))))

(declare-fun lt!480391 () ListLongMap!14787)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!721 (ListLongMap!14787 (_ BitVec 64)) ListLongMap!14787)

(assert (=> b!1084351 (= lt!480396 (-!721 lt!480391 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40345)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40345)

(declare-datatypes ((ValueCell!12497 0))(
  ( (ValueCellFull!12497 (v!15880 V!40345)) (EmptyCell!12497) )
))
(declare-datatypes ((array!69811 0))(
  ( (array!69812 (arr!33573 (Array (_ BitVec 32) ValueCell!12497)) (size!34110 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69811)

(declare-datatypes ((Unit!35609 0))(
  ( (Unit!35610) )
))
(declare-fun lt!480395 () Unit!35609)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!10 (array!69809 array!69811 (_ BitVec 32) (_ BitVec 32) V!40345 V!40345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35609)

(assert (=> b!1084351 (= lt!480395 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!10 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3986 (array!69809 array!69811 (_ BitVec 32) (_ BitVec 32) V!40345 V!40345 (_ BitVec 32) Int) ListLongMap!14787)

(declare-fun dynLambda!2107 (Int (_ BitVec 64)) V!40345)

(assert (=> b!1084351 (= lt!480393 (getCurrentListMapNoExtraKeys!3986 lt!480392 (array!69812 (store (arr!33573 _values!874) i!650 (ValueCellFull!12497 (dynLambda!2107 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34110 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084351 (= lt!480391 (getCurrentListMapNoExtraKeys!3986 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084351 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480394 () Unit!35609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69809 (_ BitVec 64) (_ BitVec 32)) Unit!35609)

(assert (=> b!1084351 (= lt!480394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41374 () Bool)

(declare-fun mapRes!41374 () Bool)

(assert (=> mapIsEmpty!41374 mapRes!41374))

(declare-fun res!722472 () Bool)

(assert (=> start!95994 (=> (not res!722472) (not e!619736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95994 (= res!722472 (validMask!0 mask!1414))))

(assert (=> start!95994 e!619736))

(assert (=> start!95994 tp!79081))

(assert (=> start!95994 true))

(assert (=> start!95994 tp_is_empty!26413))

(declare-fun array_inv!25960 (array!69809) Bool)

(assert (=> start!95994 (array_inv!25960 _keys!1070)))

(declare-fun e!619731 () Bool)

(declare-fun array_inv!25961 (array!69811) Bool)

(assert (=> start!95994 (and (array_inv!25961 _values!874) e!619731)))

(declare-fun b!1084352 () Bool)

(declare-fun res!722471 () Bool)

(assert (=> b!1084352 (=> (not res!722471) (not e!619736))))

(assert (=> b!1084352 (= res!722471 (= (select (arr!33572 _keys!1070) i!650) k0!904))))

(declare-fun b!1084353 () Bool)

(declare-fun e!619732 () Bool)

(assert (=> b!1084353 (= e!619732 tp_is_empty!26413)))

(declare-fun b!1084354 () Bool)

(assert (=> b!1084354 (= e!619731 (and e!619732 mapRes!41374))))

(declare-fun condMapEmpty!41374 () Bool)

(declare-fun mapDefault!41374 () ValueCell!12497)

(assert (=> b!1084354 (= condMapEmpty!41374 (= (arr!33573 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12497)) mapDefault!41374)))))

(declare-fun b!1084355 () Bool)

(declare-fun res!722475 () Bool)

(assert (=> b!1084355 (=> (not res!722475) (not e!619736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084355 (= res!722475 (validKeyInArray!0 k0!904))))

(declare-fun b!1084356 () Bool)

(declare-fun res!722469 () Bool)

(assert (=> b!1084356 (=> (not res!722469) (not e!619736))))

(assert (=> b!1084356 (= res!722469 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23401))))

(declare-fun mapNonEmpty!41374 () Bool)

(declare-fun tp!79082 () Bool)

(assert (=> mapNonEmpty!41374 (= mapRes!41374 (and tp!79082 e!619733))))

(declare-fun mapValue!41374 () ValueCell!12497)

(declare-fun mapKey!41374 () (_ BitVec 32))

(declare-fun mapRest!41374 () (Array (_ BitVec 32) ValueCell!12497))

(assert (=> mapNonEmpty!41374 (= (arr!33573 _values!874) (store mapRest!41374 mapKey!41374 mapValue!41374))))

(declare-fun b!1084357 () Bool)

(declare-fun res!722468 () Bool)

(assert (=> b!1084357 (=> (not res!722468) (not e!619736))))

(assert (=> b!1084357 (= res!722468 (and (= (size!34110 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34109 _keys!1070) (size!34110 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084358 () Bool)

(declare-fun res!722474 () Bool)

(assert (=> b!1084358 (=> (not res!722474) (not e!619736))))

(assert (=> b!1084358 (= res!722474 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34109 _keys!1070))))))

(declare-fun b!1084359 () Bool)

(assert (=> b!1084359 (= e!619736 e!619735)))

(declare-fun res!722473 () Bool)

(assert (=> b!1084359 (=> (not res!722473) (not e!619735))))

(assert (=> b!1084359 (= res!722473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480392 mask!1414))))

(assert (=> b!1084359 (= lt!480392 (array!69810 (store (arr!33572 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34109 _keys!1070)))))

(assert (= (and start!95994 res!722472) b!1084357))

(assert (= (and b!1084357 res!722468) b!1084350))

(assert (= (and b!1084350 res!722470) b!1084356))

(assert (= (and b!1084356 res!722469) b!1084358))

(assert (= (and b!1084358 res!722474) b!1084355))

(assert (= (and b!1084355 res!722475) b!1084352))

(assert (= (and b!1084352 res!722471) b!1084359))

(assert (= (and b!1084359 res!722473) b!1084349))

(assert (= (and b!1084349 res!722467) b!1084351))

(assert (= (and b!1084354 condMapEmpty!41374) mapIsEmpty!41374))

(assert (= (and b!1084354 (not condMapEmpty!41374)) mapNonEmpty!41374))

(get-info :version)

(assert (= (and mapNonEmpty!41374 ((_ is ValueCellFull!12497) mapValue!41374)) b!1084348))

(assert (= (and b!1084354 ((_ is ValueCellFull!12497) mapDefault!41374)) b!1084353))

(assert (= start!95994 b!1084354))

(declare-fun b_lambda!17091 () Bool)

(assert (=> (not b_lambda!17091) (not b!1084351)))

(declare-fun t!32864 () Bool)

(declare-fun tb!7281 () Bool)

(assert (=> (and start!95994 (= defaultEntry!882 defaultEntry!882) t!32864) tb!7281))

(declare-fun result!15089 () Bool)

(assert (=> tb!7281 (= result!15089 tp_is_empty!26413)))

(assert (=> b!1084351 t!32864))

(declare-fun b_and!35509 () Bool)

(assert (= b_and!35507 (and (=> t!32864 result!15089) b_and!35509)))

(declare-fun m!1002365 () Bool)

(assert (=> b!1084356 m!1002365))

(declare-fun m!1002367 () Bool)

(assert (=> b!1084349 m!1002367))

(declare-fun m!1002369 () Bool)

(assert (=> b!1084350 m!1002369))

(declare-fun m!1002371 () Bool)

(assert (=> b!1084355 m!1002371))

(declare-fun m!1002373 () Bool)

(assert (=> b!1084359 m!1002373))

(declare-fun m!1002375 () Bool)

(assert (=> b!1084359 m!1002375))

(declare-fun m!1002377 () Bool)

(assert (=> b!1084352 m!1002377))

(declare-fun m!1002379 () Bool)

(assert (=> start!95994 m!1002379))

(declare-fun m!1002381 () Bool)

(assert (=> start!95994 m!1002381))

(declare-fun m!1002383 () Bool)

(assert (=> start!95994 m!1002383))

(declare-fun m!1002385 () Bool)

(assert (=> mapNonEmpty!41374 m!1002385))

(declare-fun m!1002387 () Bool)

(assert (=> b!1084351 m!1002387))

(declare-fun m!1002389 () Bool)

(assert (=> b!1084351 m!1002389))

(declare-fun m!1002391 () Bool)

(assert (=> b!1084351 m!1002391))

(declare-fun m!1002393 () Bool)

(assert (=> b!1084351 m!1002393))

(declare-fun m!1002395 () Bool)

(assert (=> b!1084351 m!1002395))

(declare-fun m!1002397 () Bool)

(assert (=> b!1084351 m!1002397))

(declare-fun m!1002399 () Bool)

(assert (=> b!1084351 m!1002399))

(declare-fun m!1002401 () Bool)

(assert (=> b!1084351 m!1002401))

(check-sat (not mapNonEmpty!41374) tp_is_empty!26413 (not b!1084349) (not b_next!22411) (not start!95994) (not b!1084356) (not b!1084359) (not b_lambda!17091) (not b!1084351) b_and!35509 (not b!1084355) (not b!1084350))
(check-sat b_and!35509 (not b_next!22411))
