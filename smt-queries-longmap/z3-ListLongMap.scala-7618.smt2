; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96264 () Bool)

(assert start!96264)

(declare-fun b_free!22681 () Bool)

(declare-fun b_next!22681 () Bool)

(assert (=> start!96264 (= b_free!22681 (not b_next!22681))))

(declare-fun tp!79892 () Bool)

(declare-fun b_and!36047 () Bool)

(assert (=> start!96264 (= tp!79892 b_and!36047)))

(declare-fun b!1090049 () Bool)

(declare-fun e!622717 () Bool)

(declare-fun e!622721 () Bool)

(assert (=> b!1090049 (= e!622717 e!622721)))

(declare-fun res!726692 () Bool)

(assert (=> b!1090049 (=> (not res!726692) (not e!622721))))

(declare-datatypes ((array!70331 0))(
  ( (array!70332 (arr!33833 (Array (_ BitVec 32) (_ BitVec 64))) (size!34370 (_ BitVec 32))) )
))
(declare-fun lt!485572 () array!70331)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70331 (_ BitVec 32)) Bool)

(assert (=> b!1090049 (= res!726692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485572 mask!1414))))

(declare-fun _keys!1070 () array!70331)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090049 (= lt!485572 (array!70332 (store (arr!33833 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34370 _keys!1070)))))

(declare-fun b!1090050 () Bool)

(declare-fun res!726684 () Bool)

(assert (=> b!1090050 (=> (not res!726684) (not e!622721))))

(declare-datatypes ((List!23620 0))(
  ( (Nil!23617) (Cons!23616 (h!24834 (_ BitVec 64)) (t!33351 List!23620)) )
))
(declare-fun arrayNoDuplicates!0 (array!70331 (_ BitVec 32) List!23620) Bool)

(assert (=> b!1090050 (= res!726684 (arrayNoDuplicates!0 lt!485572 #b00000000000000000000000000000000 Nil!23617))))

(declare-fun b!1090051 () Bool)

(declare-fun res!726690 () Bool)

(assert (=> b!1090051 (=> (not res!726690) (not e!622717))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090051 (= res!726690 (validKeyInArray!0 k0!904))))

(declare-fun b!1090052 () Bool)

(declare-fun e!622719 () Bool)

(declare-fun e!622715 () Bool)

(assert (=> b!1090052 (= e!622719 e!622715)))

(declare-fun res!726693 () Bool)

(assert (=> b!1090052 (=> res!726693 e!622715)))

(assert (=> b!1090052 (= res!726693 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40705 0))(
  ( (V!40706 (val!13398 Int)) )
))
(declare-datatypes ((tuple2!17026 0))(
  ( (tuple2!17027 (_1!8524 (_ BitVec 64)) (_2!8524 V!40705)) )
))
(declare-datatypes ((List!23621 0))(
  ( (Nil!23618) (Cons!23617 (h!24835 tuple2!17026) (t!33352 List!23621)) )
))
(declare-datatypes ((ListLongMap!15003 0))(
  ( (ListLongMap!15004 (toList!7517 List!23621)) )
))
(declare-fun lt!485565 () ListLongMap!15003)

(declare-fun lt!485564 () ListLongMap!15003)

(assert (=> b!1090052 (= lt!485565 lt!485564)))

(declare-fun lt!485568 () ListLongMap!15003)

(declare-fun lt!485563 () tuple2!17026)

(declare-fun +!3336 (ListLongMap!15003 tuple2!17026) ListLongMap!15003)

(assert (=> b!1090052 (= lt!485564 (+!3336 lt!485568 lt!485563))))

(declare-fun lt!485562 () ListLongMap!15003)

(declare-fun lt!485570 () ListLongMap!15003)

(assert (=> b!1090052 (= lt!485562 lt!485570)))

(declare-fun lt!485569 () ListLongMap!15003)

(assert (=> b!1090052 (= lt!485570 (+!3336 lt!485569 lt!485563))))

(declare-fun lt!485567 () ListLongMap!15003)

(assert (=> b!1090052 (= lt!485565 (+!3336 lt!485567 lt!485563))))

(declare-fun zeroValue!831 () V!40705)

(assert (=> b!1090052 (= lt!485563 (tuple2!17027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090053 () Bool)

(declare-fun res!726685 () Bool)

(assert (=> b!1090053 (=> (not res!726685) (not e!622717))))

(assert (=> b!1090053 (= res!726685 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34370 _keys!1070))))))

(declare-fun b!1090054 () Bool)

(declare-fun e!622720 () Bool)

(declare-fun e!622716 () Bool)

(declare-fun mapRes!41779 () Bool)

(assert (=> b!1090054 (= e!622720 (and e!622716 mapRes!41779))))

(declare-fun condMapEmpty!41779 () Bool)

(declare-datatypes ((ValueCell!12632 0))(
  ( (ValueCellFull!12632 (v!16015 V!40705)) (EmptyCell!12632) )
))
(declare-datatypes ((array!70333 0))(
  ( (array!70334 (arr!33834 (Array (_ BitVec 32) ValueCell!12632)) (size!34371 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70333)

(declare-fun mapDefault!41779 () ValueCell!12632)

(assert (=> b!1090054 (= condMapEmpty!41779 (= (arr!33834 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12632)) mapDefault!41779)))))

(declare-fun b!1090055 () Bool)

(declare-fun res!726691 () Bool)

(assert (=> b!1090055 (=> (not res!726691) (not e!622717))))

(assert (=> b!1090055 (= res!726691 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23617))))

(declare-fun res!726683 () Bool)

(assert (=> start!96264 (=> (not res!726683) (not e!622717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96264 (= res!726683 (validMask!0 mask!1414))))

(assert (=> start!96264 e!622717))

(assert (=> start!96264 tp!79892))

(assert (=> start!96264 true))

(declare-fun tp_is_empty!26683 () Bool)

(assert (=> start!96264 tp_is_empty!26683))

(declare-fun array_inv!26142 (array!70331) Bool)

(assert (=> start!96264 (array_inv!26142 _keys!1070)))

(declare-fun array_inv!26143 (array!70333) Bool)

(assert (=> start!96264 (and (array_inv!26143 _values!874) e!622720)))

(declare-fun b!1090056 () Bool)

(assert (=> b!1090056 (= e!622715 true)))

(declare-fun -!828 (ListLongMap!15003 (_ BitVec 64)) ListLongMap!15003)

(assert (=> b!1090056 (= (-!828 lt!485570 k0!904) lt!485564)))

(declare-datatypes ((Unit!35823 0))(
  ( (Unit!35824) )
))
(declare-fun lt!485573 () Unit!35823)

(declare-fun addRemoveCommutativeForDiffKeys!66 (ListLongMap!15003 (_ BitVec 64) V!40705 (_ BitVec 64)) Unit!35823)

(assert (=> b!1090056 (= lt!485573 (addRemoveCommutativeForDiffKeys!66 lt!485569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1090057 () Bool)

(assert (=> b!1090057 (= e!622716 tp_is_empty!26683)))

(declare-fun mapIsEmpty!41779 () Bool)

(assert (=> mapIsEmpty!41779 mapRes!41779))

(declare-fun b!1090058 () Bool)

(declare-fun res!726687 () Bool)

(assert (=> b!1090058 (=> (not res!726687) (not e!622717))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090058 (= res!726687 (and (= (size!34371 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34370 _keys!1070) (size!34371 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090059 () Bool)

(declare-fun res!726689 () Bool)

(assert (=> b!1090059 (=> (not res!726689) (not e!622717))))

(assert (=> b!1090059 (= res!726689 (= (select (arr!33833 _keys!1070) i!650) k0!904))))

(declare-fun b!1090060 () Bool)

(declare-fun res!726688 () Bool)

(assert (=> b!1090060 (=> (not res!726688) (not e!622717))))

(assert (=> b!1090060 (= res!726688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41779 () Bool)

(declare-fun tp!79891 () Bool)

(declare-fun e!622714 () Bool)

(assert (=> mapNonEmpty!41779 (= mapRes!41779 (and tp!79891 e!622714))))

(declare-fun mapValue!41779 () ValueCell!12632)

(declare-fun mapKey!41779 () (_ BitVec 32))

(declare-fun mapRest!41779 () (Array (_ BitVec 32) ValueCell!12632))

(assert (=> mapNonEmpty!41779 (= (arr!33834 _values!874) (store mapRest!41779 mapKey!41779 mapValue!41779))))

(declare-fun b!1090061 () Bool)

(assert (=> b!1090061 (= e!622721 (not e!622719))))

(declare-fun res!726686 () Bool)

(assert (=> b!1090061 (=> res!726686 e!622719)))

(assert (=> b!1090061 (= res!726686 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40705)

(declare-fun getCurrentListMap!4276 (array!70331 array!70333 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) Int) ListLongMap!15003)

(assert (=> b!1090061 (= lt!485562 (getCurrentListMap!4276 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485574 () array!70333)

(assert (=> b!1090061 (= lt!485565 (getCurrentListMap!4276 lt!485572 lt!485574 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090061 (and (= lt!485567 lt!485568) (= lt!485568 lt!485567))))

(assert (=> b!1090061 (= lt!485568 (-!828 lt!485569 k0!904))))

(declare-fun lt!485571 () Unit!35823)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!105 (array!70331 array!70333 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35823)

(assert (=> b!1090061 (= lt!485571 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!105 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4081 (array!70331 array!70333 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) Int) ListLongMap!15003)

(assert (=> b!1090061 (= lt!485567 (getCurrentListMapNoExtraKeys!4081 lt!485572 lt!485574 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2202 (Int (_ BitVec 64)) V!40705)

(assert (=> b!1090061 (= lt!485574 (array!70334 (store (arr!33834 _values!874) i!650 (ValueCellFull!12632 (dynLambda!2202 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34371 _values!874)))))

(assert (=> b!1090061 (= lt!485569 (getCurrentListMapNoExtraKeys!4081 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090061 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485566 () Unit!35823)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70331 (_ BitVec 64) (_ BitVec 32)) Unit!35823)

(assert (=> b!1090061 (= lt!485566 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090062 () Bool)

(assert (=> b!1090062 (= e!622714 tp_is_empty!26683)))

(assert (= (and start!96264 res!726683) b!1090058))

(assert (= (and b!1090058 res!726687) b!1090060))

(assert (= (and b!1090060 res!726688) b!1090055))

(assert (= (and b!1090055 res!726691) b!1090053))

(assert (= (and b!1090053 res!726685) b!1090051))

(assert (= (and b!1090051 res!726690) b!1090059))

(assert (= (and b!1090059 res!726689) b!1090049))

(assert (= (and b!1090049 res!726692) b!1090050))

(assert (= (and b!1090050 res!726684) b!1090061))

(assert (= (and b!1090061 (not res!726686)) b!1090052))

(assert (= (and b!1090052 (not res!726693)) b!1090056))

(assert (= (and b!1090054 condMapEmpty!41779) mapIsEmpty!41779))

(assert (= (and b!1090054 (not condMapEmpty!41779)) mapNonEmpty!41779))

(get-info :version)

(assert (= (and mapNonEmpty!41779 ((_ is ValueCellFull!12632) mapValue!41779)) b!1090062))

(assert (= (and b!1090054 ((_ is ValueCellFull!12632) mapDefault!41779)) b!1090057))

(assert (= start!96264 b!1090054))

(declare-fun b_lambda!17361 () Bool)

(assert (=> (not b_lambda!17361) (not b!1090061)))

(declare-fun t!33350 () Bool)

(declare-fun tb!7551 () Bool)

(assert (=> (and start!96264 (= defaultEntry!882 defaultEntry!882) t!33350) tb!7551))

(declare-fun result!15629 () Bool)

(assert (=> tb!7551 (= result!15629 tp_is_empty!26683)))

(assert (=> b!1090061 t!33350))

(declare-fun b_and!36049 () Bool)

(assert (= b_and!36047 (and (=> t!33350 result!15629) b_and!36049)))

(declare-fun m!1009511 () Bool)

(assert (=> b!1090059 m!1009511))

(declare-fun m!1009513 () Bool)

(assert (=> b!1090049 m!1009513))

(declare-fun m!1009515 () Bool)

(assert (=> b!1090049 m!1009515))

(declare-fun m!1009517 () Bool)

(assert (=> b!1090050 m!1009517))

(declare-fun m!1009519 () Bool)

(assert (=> b!1090060 m!1009519))

(declare-fun m!1009521 () Bool)

(assert (=> b!1090056 m!1009521))

(declare-fun m!1009523 () Bool)

(assert (=> b!1090056 m!1009523))

(declare-fun m!1009525 () Bool)

(assert (=> b!1090052 m!1009525))

(declare-fun m!1009527 () Bool)

(assert (=> b!1090052 m!1009527))

(declare-fun m!1009529 () Bool)

(assert (=> b!1090052 m!1009529))

(declare-fun m!1009531 () Bool)

(assert (=> mapNonEmpty!41779 m!1009531))

(declare-fun m!1009533 () Bool)

(assert (=> b!1090051 m!1009533))

(declare-fun m!1009535 () Bool)

(assert (=> start!96264 m!1009535))

(declare-fun m!1009537 () Bool)

(assert (=> start!96264 m!1009537))

(declare-fun m!1009539 () Bool)

(assert (=> start!96264 m!1009539))

(declare-fun m!1009541 () Bool)

(assert (=> b!1090061 m!1009541))

(declare-fun m!1009543 () Bool)

(assert (=> b!1090061 m!1009543))

(declare-fun m!1009545 () Bool)

(assert (=> b!1090061 m!1009545))

(declare-fun m!1009547 () Bool)

(assert (=> b!1090061 m!1009547))

(declare-fun m!1009549 () Bool)

(assert (=> b!1090061 m!1009549))

(declare-fun m!1009551 () Bool)

(assert (=> b!1090061 m!1009551))

(declare-fun m!1009553 () Bool)

(assert (=> b!1090061 m!1009553))

(declare-fun m!1009555 () Bool)

(assert (=> b!1090061 m!1009555))

(declare-fun m!1009557 () Bool)

(assert (=> b!1090061 m!1009557))

(declare-fun m!1009559 () Bool)

(assert (=> b!1090061 m!1009559))

(declare-fun m!1009561 () Bool)

(assert (=> b!1090055 m!1009561))

(check-sat (not b_next!22681) (not b!1090050) (not start!96264) (not b!1090055) (not b!1090061) (not mapNonEmpty!41779) (not b!1090049) tp_is_empty!26683 (not b_lambda!17361) (not b!1090052) (not b!1090060) (not b!1090056) (not b!1090051) b_and!36049)
(check-sat b_and!36049 (not b_next!22681))
