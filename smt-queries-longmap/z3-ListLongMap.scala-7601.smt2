; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95928 () Bool)

(assert start!95928)

(declare-fun b_free!22581 () Bool)

(declare-fun b_next!22581 () Bool)

(assert (=> start!95928 (= b_free!22581 (not b_next!22581))))

(declare-fun tp!79592 () Bool)

(declare-fun b_and!35837 () Bool)

(assert (=> start!95928 (= tp!79592 b_and!35837)))

(declare-fun b!1086513 () Bool)

(declare-fun e!620662 () Bool)

(declare-fun tp_is_empty!26583 () Bool)

(assert (=> b!1086513 (= e!620662 tp_is_empty!26583)))

(declare-fun b!1086514 () Bool)

(declare-fun res!724512 () Bool)

(declare-fun e!620664 () Bool)

(assert (=> b!1086514 (=> (not res!724512) (not e!620664))))

(declare-datatypes ((array!70099 0))(
  ( (array!70100 (arr!33723 (Array (_ BitVec 32) (_ BitVec 64))) (size!34259 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70099)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086514 (= res!724512 (= (select (arr!33723 _keys!1070) i!650) k0!904))))

(declare-fun b!1086515 () Bool)

(declare-fun res!724507 () Bool)

(assert (=> b!1086515 (=> (not res!724507) (not e!620664))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70099 (_ BitVec 32)) Bool)

(assert (=> b!1086515 (= res!724507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086517 () Bool)

(declare-fun res!724502 () Bool)

(assert (=> b!1086517 (=> (not res!724502) (not e!620664))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40571 0))(
  ( (V!40572 (val!13348 Int)) )
))
(declare-datatypes ((ValueCell!12582 0))(
  ( (ValueCellFull!12582 (v!15969 V!40571)) (EmptyCell!12582) )
))
(declare-datatypes ((array!70101 0))(
  ( (array!70102 (arr!33724 (Array (_ BitVec 32) ValueCell!12582)) (size!34260 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70101)

(assert (=> b!1086517 (= res!724502 (and (= (size!34260 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34259 _keys!1070) (size!34260 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41629 () Bool)

(declare-fun mapRes!41629 () Bool)

(assert (=> mapIsEmpty!41629 mapRes!41629))

(declare-fun b!1086518 () Bool)

(declare-fun e!620660 () Bool)

(declare-fun e!620659 () Bool)

(assert (=> b!1086518 (= e!620660 (not e!620659))))

(declare-fun res!724508 () Bool)

(assert (=> b!1086518 (=> res!724508 e!620659)))

(assert (=> b!1086518 (= res!724508 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40571)

(declare-datatypes ((tuple2!16932 0))(
  ( (tuple2!16933 (_1!8477 (_ BitVec 64)) (_2!8477 V!40571)) )
))
(declare-datatypes ((List!23522 0))(
  ( (Nil!23519) (Cons!23518 (h!24727 tuple2!16932) (t!33161 List!23522)) )
))
(declare-datatypes ((ListLongMap!14901 0))(
  ( (ListLongMap!14902 (toList!7466 List!23522)) )
))
(declare-fun lt!482940 () ListLongMap!14901)

(declare-fun zeroValue!831 () V!40571)

(declare-fun getCurrentListMap!4246 (array!70099 array!70101 (_ BitVec 32) (_ BitVec 32) V!40571 V!40571 (_ BitVec 32) Int) ListLongMap!14901)

(assert (=> b!1086518 (= lt!482940 (getCurrentListMap!4246 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482933 () array!70101)

(declare-fun lt!482936 () array!70099)

(declare-fun lt!482929 () ListLongMap!14901)

(assert (=> b!1086518 (= lt!482929 (getCurrentListMap!4246 lt!482936 lt!482933 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482942 () ListLongMap!14901)

(declare-fun lt!482937 () ListLongMap!14901)

(assert (=> b!1086518 (and (= lt!482942 lt!482937) (= lt!482937 lt!482942))))

(declare-fun lt!482931 () ListLongMap!14901)

(declare-fun -!792 (ListLongMap!14901 (_ BitVec 64)) ListLongMap!14901)

(assert (=> b!1086518 (= lt!482937 (-!792 lt!482931 k0!904))))

(declare-datatypes ((Unit!35750 0))(
  ( (Unit!35751) )
))
(declare-fun lt!482932 () Unit!35750)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!65 (array!70099 array!70101 (_ BitVec 32) (_ BitVec 32) V!40571 V!40571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35750)

(assert (=> b!1086518 (= lt!482932 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!65 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4006 (array!70099 array!70101 (_ BitVec 32) (_ BitVec 32) V!40571 V!40571 (_ BitVec 32) Int) ListLongMap!14901)

(assert (=> b!1086518 (= lt!482942 (getCurrentListMapNoExtraKeys!4006 lt!482936 lt!482933 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2143 (Int (_ BitVec 64)) V!40571)

(assert (=> b!1086518 (= lt!482933 (array!70102 (store (arr!33724 _values!874) i!650 (ValueCellFull!12582 (dynLambda!2143 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34260 _values!874)))))

(assert (=> b!1086518 (= lt!482931 (getCurrentListMapNoExtraKeys!4006 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086518 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482930 () Unit!35750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70099 (_ BitVec 64) (_ BitVec 32)) Unit!35750)

(assert (=> b!1086518 (= lt!482930 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086519 () Bool)

(declare-fun res!724506 () Bool)

(assert (=> b!1086519 (=> (not res!724506) (not e!620664))))

(declare-datatypes ((List!23523 0))(
  ( (Nil!23520) (Cons!23519 (h!24728 (_ BitVec 64)) (t!33162 List!23523)) )
))
(declare-fun arrayNoDuplicates!0 (array!70099 (_ BitVec 32) List!23523) Bool)

(assert (=> b!1086519 (= res!724506 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23520))))

(declare-fun b!1086520 () Bool)

(declare-fun e!620661 () Bool)

(assert (=> b!1086520 (= e!620659 e!620661)))

(declare-fun res!724511 () Bool)

(assert (=> b!1086520 (=> res!724511 e!620661)))

(assert (=> b!1086520 (= res!724511 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482943 () ListLongMap!14901)

(declare-fun lt!482941 () ListLongMap!14901)

(assert (=> b!1086520 (= lt!482943 lt!482941)))

(declare-fun lt!482928 () ListLongMap!14901)

(assert (=> b!1086520 (= lt!482943 (-!792 lt!482928 k0!904))))

(declare-fun lt!482934 () Unit!35750)

(declare-fun addRemoveCommutativeForDiffKeys!29 (ListLongMap!14901 (_ BitVec 64) V!40571 (_ BitVec 64)) Unit!35750)

(assert (=> b!1086520 (= lt!482934 (addRemoveCommutativeForDiffKeys!29 lt!482931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482935 () tuple2!16932)

(declare-fun +!3273 (ListLongMap!14901 tuple2!16932) ListLongMap!14901)

(assert (=> b!1086520 (= lt!482929 (+!3273 lt!482941 lt!482935))))

(declare-fun lt!482939 () tuple2!16932)

(assert (=> b!1086520 (= lt!482941 (+!3273 lt!482937 lt!482939))))

(declare-fun lt!482938 () ListLongMap!14901)

(assert (=> b!1086520 (= lt!482940 lt!482938)))

(assert (=> b!1086520 (= lt!482938 (+!3273 lt!482928 lt!482935))))

(assert (=> b!1086520 (= lt!482928 (+!3273 lt!482931 lt!482939))))

(assert (=> b!1086520 (= lt!482929 (+!3273 (+!3273 lt!482942 lt!482939) lt!482935))))

(assert (=> b!1086520 (= lt!482935 (tuple2!16933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086520 (= lt!482939 (tuple2!16933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086521 () Bool)

(declare-fun res!724505 () Bool)

(assert (=> b!1086521 (=> (not res!724505) (not e!620664))))

(assert (=> b!1086521 (= res!724505 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34259 _keys!1070))))))

(declare-fun b!1086522 () Bool)

(declare-fun e!620663 () Bool)

(assert (=> b!1086522 (= e!620663 tp_is_empty!26583)))

(declare-fun b!1086523 () Bool)

(assert (=> b!1086523 (= e!620664 e!620660)))

(declare-fun res!724509 () Bool)

(assert (=> b!1086523 (=> (not res!724509) (not e!620660))))

(assert (=> b!1086523 (= res!724509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482936 mask!1414))))

(assert (=> b!1086523 (= lt!482936 (array!70100 (store (arr!33723 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34259 _keys!1070)))))

(declare-fun b!1086524 () Bool)

(declare-fun res!724504 () Bool)

(assert (=> b!1086524 (=> (not res!724504) (not e!620664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086524 (= res!724504 (validKeyInArray!0 k0!904))))

(declare-fun b!1086525 () Bool)

(declare-fun e!620666 () Bool)

(assert (=> b!1086525 (= e!620666 (and e!620662 mapRes!41629))))

(declare-fun condMapEmpty!41629 () Bool)

(declare-fun mapDefault!41629 () ValueCell!12582)

(assert (=> b!1086525 (= condMapEmpty!41629 (= (arr!33724 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12582)) mapDefault!41629)))))

(declare-fun res!724503 () Bool)

(assert (=> start!95928 (=> (not res!724503) (not e!620664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95928 (= res!724503 (validMask!0 mask!1414))))

(assert (=> start!95928 e!620664))

(assert (=> start!95928 tp!79592))

(assert (=> start!95928 true))

(assert (=> start!95928 tp_is_empty!26583))

(declare-fun array_inv!26022 (array!70099) Bool)

(assert (=> start!95928 (array_inv!26022 _keys!1070)))

(declare-fun array_inv!26023 (array!70101) Bool)

(assert (=> start!95928 (and (array_inv!26023 _values!874) e!620666)))

(declare-fun b!1086516 () Bool)

(declare-fun res!724510 () Bool)

(assert (=> b!1086516 (=> (not res!724510) (not e!620660))))

(assert (=> b!1086516 (= res!724510 (arrayNoDuplicates!0 lt!482936 #b00000000000000000000000000000000 Nil!23520))))

(declare-fun mapNonEmpty!41629 () Bool)

(declare-fun tp!79591 () Bool)

(assert (=> mapNonEmpty!41629 (= mapRes!41629 (and tp!79591 e!620663))))

(declare-fun mapRest!41629 () (Array (_ BitVec 32) ValueCell!12582))

(declare-fun mapValue!41629 () ValueCell!12582)

(declare-fun mapKey!41629 () (_ BitVec 32))

(assert (=> mapNonEmpty!41629 (= (arr!33724 _values!874) (store mapRest!41629 mapKey!41629 mapValue!41629))))

(declare-fun b!1086526 () Bool)

(assert (=> b!1086526 (= e!620661 true)))

(assert (=> b!1086526 (= (-!792 lt!482938 k0!904) (+!3273 lt!482943 lt!482935))))

(declare-fun lt!482944 () Unit!35750)

(assert (=> b!1086526 (= lt!482944 (addRemoveCommutativeForDiffKeys!29 lt!482928 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!95928 res!724503) b!1086517))

(assert (= (and b!1086517 res!724502) b!1086515))

(assert (= (and b!1086515 res!724507) b!1086519))

(assert (= (and b!1086519 res!724506) b!1086521))

(assert (= (and b!1086521 res!724505) b!1086524))

(assert (= (and b!1086524 res!724504) b!1086514))

(assert (= (and b!1086514 res!724512) b!1086523))

(assert (= (and b!1086523 res!724509) b!1086516))

(assert (= (and b!1086516 res!724510) b!1086518))

(assert (= (and b!1086518 (not res!724508)) b!1086520))

(assert (= (and b!1086520 (not res!724511)) b!1086526))

(assert (= (and b!1086525 condMapEmpty!41629) mapIsEmpty!41629))

(assert (= (and b!1086525 (not condMapEmpty!41629)) mapNonEmpty!41629))

(get-info :version)

(assert (= (and mapNonEmpty!41629 ((_ is ValueCellFull!12582) mapValue!41629)) b!1086522))

(assert (= (and b!1086525 ((_ is ValueCellFull!12582) mapDefault!41629)) b!1086513))

(assert (= start!95928 b!1086525))

(declare-fun b_lambda!17251 () Bool)

(assert (=> (not b_lambda!17251) (not b!1086518)))

(declare-fun t!33160 () Bool)

(declare-fun tb!7459 () Bool)

(assert (=> (and start!95928 (= defaultEntry!882 defaultEntry!882) t!33160) tb!7459))

(declare-fun result!15437 () Bool)

(assert (=> tb!7459 (= result!15437 tp_is_empty!26583)))

(assert (=> b!1086518 t!33160))

(declare-fun b_and!35839 () Bool)

(assert (= b_and!35837 (and (=> t!33160 result!15437) b_and!35839)))

(declare-fun m!1005047 () Bool)

(assert (=> start!95928 m!1005047))

(declare-fun m!1005049 () Bool)

(assert (=> start!95928 m!1005049))

(declare-fun m!1005051 () Bool)

(assert (=> start!95928 m!1005051))

(declare-fun m!1005053 () Bool)

(assert (=> b!1086526 m!1005053))

(declare-fun m!1005055 () Bool)

(assert (=> b!1086526 m!1005055))

(declare-fun m!1005057 () Bool)

(assert (=> b!1086526 m!1005057))

(declare-fun m!1005059 () Bool)

(assert (=> b!1086519 m!1005059))

(declare-fun m!1005061 () Bool)

(assert (=> mapNonEmpty!41629 m!1005061))

(declare-fun m!1005063 () Bool)

(assert (=> b!1086520 m!1005063))

(declare-fun m!1005065 () Bool)

(assert (=> b!1086520 m!1005065))

(declare-fun m!1005067 () Bool)

(assert (=> b!1086520 m!1005067))

(declare-fun m!1005069 () Bool)

(assert (=> b!1086520 m!1005069))

(declare-fun m!1005071 () Bool)

(assert (=> b!1086520 m!1005071))

(declare-fun m!1005073 () Bool)

(assert (=> b!1086520 m!1005073))

(declare-fun m!1005075 () Bool)

(assert (=> b!1086520 m!1005075))

(assert (=> b!1086520 m!1005071))

(declare-fun m!1005077 () Bool)

(assert (=> b!1086520 m!1005077))

(declare-fun m!1005079 () Bool)

(assert (=> b!1086518 m!1005079))

(declare-fun m!1005081 () Bool)

(assert (=> b!1086518 m!1005081))

(declare-fun m!1005083 () Bool)

(assert (=> b!1086518 m!1005083))

(declare-fun m!1005085 () Bool)

(assert (=> b!1086518 m!1005085))

(declare-fun m!1005087 () Bool)

(assert (=> b!1086518 m!1005087))

(declare-fun m!1005089 () Bool)

(assert (=> b!1086518 m!1005089))

(declare-fun m!1005091 () Bool)

(assert (=> b!1086518 m!1005091))

(declare-fun m!1005093 () Bool)

(assert (=> b!1086518 m!1005093))

(declare-fun m!1005095 () Bool)

(assert (=> b!1086518 m!1005095))

(declare-fun m!1005097 () Bool)

(assert (=> b!1086518 m!1005097))

(declare-fun m!1005099 () Bool)

(assert (=> b!1086523 m!1005099))

(declare-fun m!1005101 () Bool)

(assert (=> b!1086523 m!1005101))

(declare-fun m!1005103 () Bool)

(assert (=> b!1086516 m!1005103))

(declare-fun m!1005105 () Bool)

(assert (=> b!1086515 m!1005105))

(declare-fun m!1005107 () Bool)

(assert (=> b!1086524 m!1005107))

(declare-fun m!1005109 () Bool)

(assert (=> b!1086514 m!1005109))

(check-sat b_and!35839 (not b!1086520) (not start!95928) (not b!1086523) (not b_next!22581) (not mapNonEmpty!41629) (not b!1086518) (not b!1086519) (not b!1086526) (not b!1086524) tp_is_empty!26583 (not b!1086515) (not b!1086516) (not b_lambda!17251))
(check-sat b_and!35839 (not b_next!22581))
