; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96106 () Bool)

(assert start!96106)

(declare-fun b_free!22765 () Bool)

(declare-fun b_next!22765 () Bool)

(assert (=> start!96106 (= b_free!22765 (not b_next!22765))))

(declare-fun tp!80143 () Bool)

(declare-fun b_and!36179 () Bool)

(assert (=> start!96106 (= tp!80143 b_and!36179)))

(declare-fun mapIsEmpty!41905 () Bool)

(declare-fun mapRes!41905 () Bool)

(assert (=> mapIsEmpty!41905 mapRes!41905))

(declare-fun b!1090426 () Bool)

(declare-fun e!622776 () Bool)

(assert (=> b!1090426 (= e!622776 true)))

(declare-datatypes ((V!40817 0))(
  ( (V!40818 (val!13440 Int)) )
))
(declare-datatypes ((tuple2!17138 0))(
  ( (tuple2!17139 (_1!8580 (_ BitVec 64)) (_2!8580 V!40817)) )
))
(declare-datatypes ((List!23704 0))(
  ( (Nil!23701) (Cons!23700 (h!24909 tuple2!17138) (t!33518 List!23704)) )
))
(declare-datatypes ((ListLongMap!15107 0))(
  ( (ListLongMap!15108 (toList!7569 List!23704)) )
))
(declare-fun lt!486459 () ListLongMap!15107)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!486460 () ListLongMap!15107)

(declare-fun -!843 (ListLongMap!15107 (_ BitVec 64)) ListLongMap!15107)

(assert (=> b!1090426 (= (-!843 lt!486459 k0!904) lt!486460)))

(declare-datatypes ((Unit!35721 0))(
  ( (Unit!35722) )
))
(declare-fun lt!486462 () Unit!35721)

(declare-fun minValue!831 () V!40817)

(declare-fun lt!486466 () ListLongMap!15107)

(declare-fun addRemoveCommutativeForDiffKeys!90 (ListLongMap!15107 (_ BitVec 64) V!40817 (_ BitVec 64)) Unit!35721)

(assert (=> b!1090426 (= lt!486462 (addRemoveCommutativeForDiffKeys!90 lt!486466 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090427 () Bool)

(declare-fun res!727488 () Bool)

(declare-fun e!622777 () Bool)

(assert (=> b!1090427 (=> (not res!727488) (not e!622777))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70376 0))(
  ( (array!70377 (arr!33862 (Array (_ BitVec 32) (_ BitVec 64))) (size!34400 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70376)

(declare-datatypes ((ValueCell!12674 0))(
  ( (ValueCellFull!12674 (v!16060 V!40817)) (EmptyCell!12674) )
))
(declare-datatypes ((array!70378 0))(
  ( (array!70379 (arr!33863 (Array (_ BitVec 32) ValueCell!12674)) (size!34401 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70378)

(assert (=> b!1090427 (= res!727488 (and (= (size!34401 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34400 _keys!1070) (size!34401 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090428 () Bool)

(declare-fun res!727497 () Bool)

(assert (=> b!1090428 (=> (not res!727497) (not e!622777))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090428 (= res!727497 (= (select (arr!33862 _keys!1070) i!650) k0!904))))

(declare-fun b!1090429 () Bool)

(declare-fun res!727487 () Bool)

(assert (=> b!1090429 (=> (not res!727487) (not e!622777))))

(assert (=> b!1090429 (= res!727487 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34400 _keys!1070))))))

(declare-fun res!727494 () Bool)

(assert (=> start!96106 (=> (not res!727494) (not e!622777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96106 (= res!727494 (validMask!0 mask!1414))))

(assert (=> start!96106 e!622777))

(assert (=> start!96106 tp!80143))

(assert (=> start!96106 true))

(declare-fun tp_is_empty!26767 () Bool)

(assert (=> start!96106 tp_is_empty!26767))

(declare-fun array_inv!26148 (array!70376) Bool)

(assert (=> start!96106 (array_inv!26148 _keys!1070)))

(declare-fun e!622778 () Bool)

(declare-fun array_inv!26149 (array!70378) Bool)

(assert (=> start!96106 (and (array_inv!26149 _values!874) e!622778)))

(declare-fun b!1090430 () Bool)

(declare-fun e!622779 () Bool)

(assert (=> b!1090430 (= e!622779 tp_is_empty!26767)))

(declare-fun b!1090431 () Bool)

(declare-fun e!622781 () Bool)

(assert (=> b!1090431 (= e!622781 e!622776)))

(declare-fun res!727496 () Bool)

(assert (=> b!1090431 (=> res!727496 e!622776)))

(assert (=> b!1090431 (= res!727496 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486463 () ListLongMap!15107)

(assert (=> b!1090431 (= lt!486463 lt!486459)))

(declare-fun lt!486461 () tuple2!17138)

(declare-fun +!3361 (ListLongMap!15107 tuple2!17138) ListLongMap!15107)

(assert (=> b!1090431 (= lt!486459 (+!3361 lt!486466 lt!486461))))

(declare-fun lt!486464 () ListLongMap!15107)

(assert (=> b!1090431 (= lt!486464 lt!486460)))

(declare-fun lt!486458 () ListLongMap!15107)

(assert (=> b!1090431 (= lt!486460 (+!3361 lt!486458 lt!486461))))

(declare-fun lt!486467 () ListLongMap!15107)

(assert (=> b!1090431 (= lt!486464 (+!3361 lt!486467 lt!486461))))

(assert (=> b!1090431 (= lt!486461 (tuple2!17139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!41905 () Bool)

(declare-fun tp!80144 () Bool)

(assert (=> mapNonEmpty!41905 (= mapRes!41905 (and tp!80144 e!622779))))

(declare-fun mapKey!41905 () (_ BitVec 32))

(declare-fun mapRest!41905 () (Array (_ BitVec 32) ValueCell!12674))

(declare-fun mapValue!41905 () ValueCell!12674)

(assert (=> mapNonEmpty!41905 (= (arr!33863 _values!874) (store mapRest!41905 mapKey!41905 mapValue!41905))))

(declare-fun b!1090432 () Bool)

(declare-fun e!622774 () Bool)

(assert (=> b!1090432 (= e!622777 e!622774)))

(declare-fun res!727493 () Bool)

(assert (=> b!1090432 (=> (not res!727493) (not e!622774))))

(declare-fun lt!486470 () array!70376)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70376 (_ BitVec 32)) Bool)

(assert (=> b!1090432 (= res!727493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486470 mask!1414))))

(assert (=> b!1090432 (= lt!486470 (array!70377 (store (arr!33862 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34400 _keys!1070)))))

(declare-fun b!1090433 () Bool)

(declare-fun res!727489 () Bool)

(assert (=> b!1090433 (=> (not res!727489) (not e!622777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090433 (= res!727489 (validKeyInArray!0 k0!904))))

(declare-fun b!1090434 () Bool)

(declare-fun res!727492 () Bool)

(assert (=> b!1090434 (=> (not res!727492) (not e!622777))))

(assert (=> b!1090434 (= res!727492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090435 () Bool)

(declare-fun e!622780 () Bool)

(assert (=> b!1090435 (= e!622778 (and e!622780 mapRes!41905))))

(declare-fun condMapEmpty!41905 () Bool)

(declare-fun mapDefault!41905 () ValueCell!12674)

(assert (=> b!1090435 (= condMapEmpty!41905 (= (arr!33863 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12674)) mapDefault!41905)))))

(declare-fun b!1090436 () Bool)

(declare-fun res!727491 () Bool)

(assert (=> b!1090436 (=> (not res!727491) (not e!622774))))

(declare-datatypes ((List!23705 0))(
  ( (Nil!23702) (Cons!23701 (h!24910 (_ BitVec 64)) (t!33519 List!23705)) )
))
(declare-fun arrayNoDuplicates!0 (array!70376 (_ BitVec 32) List!23705) Bool)

(assert (=> b!1090436 (= res!727491 (arrayNoDuplicates!0 lt!486470 #b00000000000000000000000000000000 Nil!23702))))

(declare-fun b!1090437 () Bool)

(declare-fun res!727495 () Bool)

(assert (=> b!1090437 (=> (not res!727495) (not e!622777))))

(assert (=> b!1090437 (= res!727495 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23702))))

(declare-fun b!1090438 () Bool)

(assert (=> b!1090438 (= e!622774 (not e!622781))))

(declare-fun res!727490 () Bool)

(assert (=> b!1090438 (=> res!727490 e!622781)))

(assert (=> b!1090438 (= res!727490 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40817)

(declare-fun getCurrentListMap!4239 (array!70376 array!70378 (_ BitVec 32) (_ BitVec 32) V!40817 V!40817 (_ BitVec 32) Int) ListLongMap!15107)

(assert (=> b!1090438 (= lt!486463 (getCurrentListMap!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486469 () array!70378)

(assert (=> b!1090438 (= lt!486464 (getCurrentListMap!4239 lt!486470 lt!486469 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090438 (and (= lt!486467 lt!486458) (= lt!486458 lt!486467))))

(assert (=> b!1090438 (= lt!486458 (-!843 lt!486466 k0!904))))

(declare-fun lt!486468 () Unit!35721)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!123 (array!70376 array!70378 (_ BitVec 32) (_ BitVec 32) V!40817 V!40817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35721)

(assert (=> b!1090438 (= lt!486468 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!123 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4109 (array!70376 array!70378 (_ BitVec 32) (_ BitVec 32) V!40817 V!40817 (_ BitVec 32) Int) ListLongMap!15107)

(assert (=> b!1090438 (= lt!486467 (getCurrentListMapNoExtraKeys!4109 lt!486470 lt!486469 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2180 (Int (_ BitVec 64)) V!40817)

(assert (=> b!1090438 (= lt!486469 (array!70379 (store (arr!33863 _values!874) i!650 (ValueCellFull!12674 (dynLambda!2180 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34401 _values!874)))))

(assert (=> b!1090438 (= lt!486466 (getCurrentListMapNoExtraKeys!4109 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090438 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486465 () Unit!35721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70376 (_ BitVec 64) (_ BitVec 32)) Unit!35721)

(assert (=> b!1090438 (= lt!486465 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090439 () Bool)

(assert (=> b!1090439 (= e!622780 tp_is_empty!26767)))

(assert (= (and start!96106 res!727494) b!1090427))

(assert (= (and b!1090427 res!727488) b!1090434))

(assert (= (and b!1090434 res!727492) b!1090437))

(assert (= (and b!1090437 res!727495) b!1090429))

(assert (= (and b!1090429 res!727487) b!1090433))

(assert (= (and b!1090433 res!727489) b!1090428))

(assert (= (and b!1090428 res!727497) b!1090432))

(assert (= (and b!1090432 res!727493) b!1090436))

(assert (= (and b!1090436 res!727491) b!1090438))

(assert (= (and b!1090438 (not res!727490)) b!1090431))

(assert (= (and b!1090431 (not res!727496)) b!1090426))

(assert (= (and b!1090435 condMapEmpty!41905) mapIsEmpty!41905))

(assert (= (and b!1090435 (not condMapEmpty!41905)) mapNonEmpty!41905))

(get-info :version)

(assert (= (and mapNonEmpty!41905 ((_ is ValueCellFull!12674) mapValue!41905)) b!1090430))

(assert (= (and b!1090435 ((_ is ValueCellFull!12674) mapDefault!41905)) b!1090439))

(assert (= start!96106 b!1090435))

(declare-fun b_lambda!17413 () Bool)

(assert (=> (not b_lambda!17413) (not b!1090438)))

(declare-fun t!33517 () Bool)

(declare-fun tb!7635 () Bool)

(assert (=> (and start!96106 (= defaultEntry!882 defaultEntry!882) t!33517) tb!7635))

(declare-fun result!15797 () Bool)

(assert (=> tb!7635 (= result!15797 tp_is_empty!26767)))

(assert (=> b!1090438 t!33517))

(declare-fun b_and!36181 () Bool)

(assert (= b_and!36179 (and (=> t!33517 result!15797) b_and!36181)))

(declare-fun m!1009385 () Bool)

(assert (=> mapNonEmpty!41905 m!1009385))

(declare-fun m!1009387 () Bool)

(assert (=> b!1090438 m!1009387))

(declare-fun m!1009389 () Bool)

(assert (=> b!1090438 m!1009389))

(declare-fun m!1009391 () Bool)

(assert (=> b!1090438 m!1009391))

(declare-fun m!1009393 () Bool)

(assert (=> b!1090438 m!1009393))

(declare-fun m!1009395 () Bool)

(assert (=> b!1090438 m!1009395))

(declare-fun m!1009397 () Bool)

(assert (=> b!1090438 m!1009397))

(declare-fun m!1009399 () Bool)

(assert (=> b!1090438 m!1009399))

(declare-fun m!1009401 () Bool)

(assert (=> b!1090438 m!1009401))

(declare-fun m!1009403 () Bool)

(assert (=> b!1090438 m!1009403))

(declare-fun m!1009405 () Bool)

(assert (=> b!1090438 m!1009405))

(declare-fun m!1009407 () Bool)

(assert (=> b!1090433 m!1009407))

(declare-fun m!1009409 () Bool)

(assert (=> b!1090434 m!1009409))

(declare-fun m!1009411 () Bool)

(assert (=> b!1090437 m!1009411))

(declare-fun m!1009413 () Bool)

(assert (=> b!1090426 m!1009413))

(declare-fun m!1009415 () Bool)

(assert (=> b!1090426 m!1009415))

(declare-fun m!1009417 () Bool)

(assert (=> start!96106 m!1009417))

(declare-fun m!1009419 () Bool)

(assert (=> start!96106 m!1009419))

(declare-fun m!1009421 () Bool)

(assert (=> start!96106 m!1009421))

(declare-fun m!1009423 () Bool)

(assert (=> b!1090436 m!1009423))

(declare-fun m!1009425 () Bool)

(assert (=> b!1090428 m!1009425))

(declare-fun m!1009427 () Bool)

(assert (=> b!1090431 m!1009427))

(declare-fun m!1009429 () Bool)

(assert (=> b!1090431 m!1009429))

(declare-fun m!1009431 () Bool)

(assert (=> b!1090431 m!1009431))

(declare-fun m!1009433 () Bool)

(assert (=> b!1090432 m!1009433))

(declare-fun m!1009435 () Bool)

(assert (=> b!1090432 m!1009435))

(check-sat (not b!1090433) (not b!1090436) (not b_next!22765) (not b!1090432) b_and!36181 (not mapNonEmpty!41905) (not b_lambda!17413) (not b!1090437) (not b!1090434) (not b!1090438) tp_is_empty!26767 (not b!1090426) (not b!1090431) (not start!96106))
(check-sat b_and!36181 (not b_next!22765))
