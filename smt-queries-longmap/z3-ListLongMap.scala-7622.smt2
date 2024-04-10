; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96054 () Bool)

(assert start!96054)

(declare-fun b_free!22707 () Bool)

(declare-fun b_next!22707 () Bool)

(assert (=> start!96054 (= b_free!22707 (not b_next!22707))))

(declare-fun tp!79969 () Bool)

(declare-fun b_and!36089 () Bool)

(assert (=> start!96054 (= tp!79969 b_and!36089)))

(declare-fun b!1089294 () Bool)

(declare-fun e!622177 () Bool)

(declare-fun tp_is_empty!26709 () Bool)

(assert (=> b!1089294 (= e!622177 tp_is_empty!26709)))

(declare-fun b!1089295 () Bool)

(declare-fun e!622175 () Bool)

(assert (=> b!1089295 (= e!622175 true)))

(declare-datatypes ((V!40739 0))(
  ( (V!40740 (val!13411 Int)) )
))
(declare-datatypes ((tuple2!17036 0))(
  ( (tuple2!17037 (_1!8529 (_ BitVec 64)) (_2!8529 V!40739)) )
))
(declare-datatypes ((List!23624 0))(
  ( (Nil!23621) (Cons!23620 (h!24829 tuple2!17036) (t!33389 List!23624)) )
))
(declare-datatypes ((ListLongMap!15005 0))(
  ( (ListLongMap!15006 (toList!7518 List!23624)) )
))
(declare-fun lt!485557 () ListLongMap!15005)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!485564 () ListLongMap!15005)

(declare-fun -!843 (ListLongMap!15005 (_ BitVec 64)) ListLongMap!15005)

(assert (=> b!1089295 (= (-!843 lt!485557 k0!904) lt!485564)))

(declare-datatypes ((Unit!35852 0))(
  ( (Unit!35853) )
))
(declare-fun lt!485560 () Unit!35852)

(declare-fun lt!485555 () ListLongMap!15005)

(declare-fun zeroValue!831 () V!40739)

(declare-fun addRemoveCommutativeForDiffKeys!71 (ListLongMap!15005 (_ BitVec 64) V!40739 (_ BitVec 64)) Unit!35852)

(assert (=> b!1089295 (= lt!485560 (addRemoveCommutativeForDiffKeys!71 lt!485555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089296 () Bool)

(declare-fun res!726595 () Bool)

(declare-fun e!622173 () Bool)

(assert (=> b!1089296 (=> (not res!726595) (not e!622173))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70341 0))(
  ( (array!70342 (arr!33844 (Array (_ BitVec 32) (_ BitVec 64))) (size!34380 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70341)

(declare-datatypes ((ValueCell!12645 0))(
  ( (ValueCellFull!12645 (v!16032 V!40739)) (EmptyCell!12645) )
))
(declare-datatypes ((array!70343 0))(
  ( (array!70344 (arr!33845 (Array (_ BitVec 32) ValueCell!12645)) (size!34381 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70343)

(assert (=> b!1089296 (= res!726595 (and (= (size!34381 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34380 _keys!1070) (size!34381 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089297 () Bool)

(declare-fun e!622171 () Bool)

(assert (=> b!1089297 (= e!622171 tp_is_empty!26709)))

(declare-fun b!1089299 () Bool)

(declare-fun res!726600 () Bool)

(assert (=> b!1089299 (=> (not res!726600) (not e!622173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70341 (_ BitVec 32)) Bool)

(assert (=> b!1089299 (= res!726600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089300 () Bool)

(declare-fun res!726590 () Bool)

(assert (=> b!1089300 (=> (not res!726590) (not e!622173))))

(declare-datatypes ((List!23625 0))(
  ( (Nil!23622) (Cons!23621 (h!24830 (_ BitVec 64)) (t!33390 List!23625)) )
))
(declare-fun arrayNoDuplicates!0 (array!70341 (_ BitVec 32) List!23625) Bool)

(assert (=> b!1089300 (= res!726590 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23622))))

(declare-fun b!1089301 () Bool)

(declare-fun res!726591 () Bool)

(assert (=> b!1089301 (=> (not res!726591) (not e!622173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089301 (= res!726591 (validKeyInArray!0 k0!904))))

(declare-fun b!1089302 () Bool)

(declare-fun e!622176 () Bool)

(declare-fun e!622178 () Bool)

(assert (=> b!1089302 (= e!622176 (not e!622178))))

(declare-fun res!726592 () Bool)

(assert (=> b!1089302 (=> res!726592 e!622178)))

(assert (=> b!1089302 (= res!726592 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40739)

(declare-fun lt!485559 () ListLongMap!15005)

(declare-fun getCurrentListMap!4290 (array!70341 array!70343 (_ BitVec 32) (_ BitVec 32) V!40739 V!40739 (_ BitVec 32) Int) ListLongMap!15005)

(assert (=> b!1089302 (= lt!485559 (getCurrentListMap!4290 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485566 () array!70343)

(declare-fun lt!485554 () array!70341)

(declare-fun lt!485558 () ListLongMap!15005)

(assert (=> b!1089302 (= lt!485558 (getCurrentListMap!4290 lt!485554 lt!485566 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485561 () ListLongMap!15005)

(declare-fun lt!485565 () ListLongMap!15005)

(assert (=> b!1089302 (and (= lt!485561 lt!485565) (= lt!485565 lt!485561))))

(assert (=> b!1089302 (= lt!485565 (-!843 lt!485555 k0!904))))

(declare-fun lt!485563 () Unit!35852)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!109 (array!70341 array!70343 (_ BitVec 32) (_ BitVec 32) V!40739 V!40739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35852)

(assert (=> b!1089302 (= lt!485563 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!109 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4050 (array!70341 array!70343 (_ BitVec 32) (_ BitVec 32) V!40739 V!40739 (_ BitVec 32) Int) ListLongMap!15005)

(assert (=> b!1089302 (= lt!485561 (getCurrentListMapNoExtraKeys!4050 lt!485554 lt!485566 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2187 (Int (_ BitVec 64)) V!40739)

(assert (=> b!1089302 (= lt!485566 (array!70344 (store (arr!33845 _values!874) i!650 (ValueCellFull!12645 (dynLambda!2187 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34381 _values!874)))))

(assert (=> b!1089302 (= lt!485555 (getCurrentListMapNoExtraKeys!4050 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089302 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485556 () Unit!35852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70341 (_ BitVec 64) (_ BitVec 32)) Unit!35852)

(assert (=> b!1089302 (= lt!485556 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089303 () Bool)

(assert (=> b!1089303 (= e!622173 e!622176)))

(declare-fun res!726594 () Bool)

(assert (=> b!1089303 (=> (not res!726594) (not e!622176))))

(assert (=> b!1089303 (= res!726594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485554 mask!1414))))

(assert (=> b!1089303 (= lt!485554 (array!70342 (store (arr!33844 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34380 _keys!1070)))))

(declare-fun b!1089304 () Bool)

(declare-fun e!622174 () Bool)

(declare-fun mapRes!41818 () Bool)

(assert (=> b!1089304 (= e!622174 (and e!622177 mapRes!41818))))

(declare-fun condMapEmpty!41818 () Bool)

(declare-fun mapDefault!41818 () ValueCell!12645)

(assert (=> b!1089304 (= condMapEmpty!41818 (= (arr!33845 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12645)) mapDefault!41818)))))

(declare-fun mapNonEmpty!41818 () Bool)

(declare-fun tp!79970 () Bool)

(assert (=> mapNonEmpty!41818 (= mapRes!41818 (and tp!79970 e!622171))))

(declare-fun mapValue!41818 () ValueCell!12645)

(declare-fun mapKey!41818 () (_ BitVec 32))

(declare-fun mapRest!41818 () (Array (_ BitVec 32) ValueCell!12645))

(assert (=> mapNonEmpty!41818 (= (arr!33845 _values!874) (store mapRest!41818 mapKey!41818 mapValue!41818))))

(declare-fun b!1089305 () Bool)

(assert (=> b!1089305 (= e!622178 e!622175)))

(declare-fun res!726598 () Bool)

(assert (=> b!1089305 (=> res!726598 e!622175)))

(assert (=> b!1089305 (= res!726598 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089305 (= lt!485558 lt!485564)))

(declare-fun lt!485562 () tuple2!17036)

(declare-fun +!3314 (ListLongMap!15005 tuple2!17036) ListLongMap!15005)

(assert (=> b!1089305 (= lt!485564 (+!3314 lt!485565 lt!485562))))

(assert (=> b!1089305 (= lt!485559 lt!485557)))

(assert (=> b!1089305 (= lt!485557 (+!3314 lt!485555 lt!485562))))

(assert (=> b!1089305 (= lt!485558 (+!3314 lt!485561 lt!485562))))

(assert (=> b!1089305 (= lt!485562 (tuple2!17037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089306 () Bool)

(declare-fun res!726597 () Bool)

(assert (=> b!1089306 (=> (not res!726597) (not e!622176))))

(assert (=> b!1089306 (= res!726597 (arrayNoDuplicates!0 lt!485554 #b00000000000000000000000000000000 Nil!23622))))

(declare-fun res!726593 () Bool)

(assert (=> start!96054 (=> (not res!726593) (not e!622173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96054 (= res!726593 (validMask!0 mask!1414))))

(assert (=> start!96054 e!622173))

(assert (=> start!96054 tp!79969))

(assert (=> start!96054 true))

(assert (=> start!96054 tp_is_empty!26709))

(declare-fun array_inv!26104 (array!70341) Bool)

(assert (=> start!96054 (array_inv!26104 _keys!1070)))

(declare-fun array_inv!26105 (array!70343) Bool)

(assert (=> start!96054 (and (array_inv!26105 _values!874) e!622174)))

(declare-fun b!1089298 () Bool)

(declare-fun res!726599 () Bool)

(assert (=> b!1089298 (=> (not res!726599) (not e!622173))))

(assert (=> b!1089298 (= res!726599 (= (select (arr!33844 _keys!1070) i!650) k0!904))))

(declare-fun b!1089307 () Bool)

(declare-fun res!726596 () Bool)

(assert (=> b!1089307 (=> (not res!726596) (not e!622173))))

(assert (=> b!1089307 (= res!726596 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34380 _keys!1070))))))

(declare-fun mapIsEmpty!41818 () Bool)

(assert (=> mapIsEmpty!41818 mapRes!41818))

(assert (= (and start!96054 res!726593) b!1089296))

(assert (= (and b!1089296 res!726595) b!1089299))

(assert (= (and b!1089299 res!726600) b!1089300))

(assert (= (and b!1089300 res!726590) b!1089307))

(assert (= (and b!1089307 res!726596) b!1089301))

(assert (= (and b!1089301 res!726591) b!1089298))

(assert (= (and b!1089298 res!726599) b!1089303))

(assert (= (and b!1089303 res!726594) b!1089306))

(assert (= (and b!1089306 res!726597) b!1089302))

(assert (= (and b!1089302 (not res!726592)) b!1089305))

(assert (= (and b!1089305 (not res!726598)) b!1089295))

(assert (= (and b!1089304 condMapEmpty!41818) mapIsEmpty!41818))

(assert (= (and b!1089304 (not condMapEmpty!41818)) mapNonEmpty!41818))

(get-info :version)

(assert (= (and mapNonEmpty!41818 ((_ is ValueCellFull!12645) mapValue!41818)) b!1089297))

(assert (= (and b!1089304 ((_ is ValueCellFull!12645) mapDefault!41818)) b!1089294))

(assert (= start!96054 b!1089304))

(declare-fun b_lambda!17377 () Bool)

(assert (=> (not b_lambda!17377) (not b!1089302)))

(declare-fun t!33388 () Bool)

(declare-fun tb!7585 () Bool)

(assert (=> (and start!96054 (= defaultEntry!882 defaultEntry!882) t!33388) tb!7585))

(declare-fun result!15689 () Bool)

(assert (=> tb!7585 (= result!15689 tp_is_empty!26709)))

(assert (=> b!1089302 t!33388))

(declare-fun b_and!36091 () Bool)

(assert (= b_and!36089 (and (=> t!33388 result!15689) b_and!36091)))

(declare-fun m!1008515 () Bool)

(assert (=> b!1089300 m!1008515))

(declare-fun m!1008517 () Bool)

(assert (=> mapNonEmpty!41818 m!1008517))

(declare-fun m!1008519 () Bool)

(assert (=> b!1089305 m!1008519))

(declare-fun m!1008521 () Bool)

(assert (=> b!1089305 m!1008521))

(declare-fun m!1008523 () Bool)

(assert (=> b!1089305 m!1008523))

(declare-fun m!1008525 () Bool)

(assert (=> b!1089306 m!1008525))

(declare-fun m!1008527 () Bool)

(assert (=> b!1089295 m!1008527))

(declare-fun m!1008529 () Bool)

(assert (=> b!1089295 m!1008529))

(declare-fun m!1008531 () Bool)

(assert (=> b!1089298 m!1008531))

(declare-fun m!1008533 () Bool)

(assert (=> b!1089299 m!1008533))

(declare-fun m!1008535 () Bool)

(assert (=> start!96054 m!1008535))

(declare-fun m!1008537 () Bool)

(assert (=> start!96054 m!1008537))

(declare-fun m!1008539 () Bool)

(assert (=> start!96054 m!1008539))

(declare-fun m!1008541 () Bool)

(assert (=> b!1089301 m!1008541))

(declare-fun m!1008543 () Bool)

(assert (=> b!1089302 m!1008543))

(declare-fun m!1008545 () Bool)

(assert (=> b!1089302 m!1008545))

(declare-fun m!1008547 () Bool)

(assert (=> b!1089302 m!1008547))

(declare-fun m!1008549 () Bool)

(assert (=> b!1089302 m!1008549))

(declare-fun m!1008551 () Bool)

(assert (=> b!1089302 m!1008551))

(declare-fun m!1008553 () Bool)

(assert (=> b!1089302 m!1008553))

(declare-fun m!1008555 () Bool)

(assert (=> b!1089302 m!1008555))

(declare-fun m!1008557 () Bool)

(assert (=> b!1089302 m!1008557))

(declare-fun m!1008559 () Bool)

(assert (=> b!1089302 m!1008559))

(declare-fun m!1008561 () Bool)

(assert (=> b!1089302 m!1008561))

(declare-fun m!1008563 () Bool)

(assert (=> b!1089303 m!1008563))

(declare-fun m!1008565 () Bool)

(assert (=> b!1089303 m!1008565))

(check-sat (not mapNonEmpty!41818) (not b_lambda!17377) (not b!1089301) (not b!1089306) (not b_next!22707) (not b!1089295) tp_is_empty!26709 b_and!36091 (not b!1089305) (not start!96054) (not b!1089303) (not b!1089300) (not b!1089299) (not b!1089302))
(check-sat b_and!36091 (not b_next!22707))
