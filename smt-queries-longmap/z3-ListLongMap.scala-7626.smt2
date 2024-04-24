; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96312 () Bool)

(assert start!96312)

(declare-fun b_free!22729 () Bool)

(declare-fun b_next!22729 () Bool)

(assert (=> start!96312 (= b_free!22729 (not b_next!22729))))

(declare-fun tp!80035 () Bool)

(declare-fun b_and!36143 () Bool)

(assert (=> start!96312 (= tp!80035 b_and!36143)))

(declare-fun b!1091107 () Bool)

(declare-fun res!727482 () Bool)

(declare-fun e!623297 () Bool)

(assert (=> b!1091107 (=> (not res!727482) (not e!623297))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091107 (= res!727482 (validKeyInArray!0 k0!904))))

(declare-fun b!1091108 () Bool)

(declare-fun res!727481 () Bool)

(assert (=> b!1091108 (=> (not res!727481) (not e!623297))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70421 0))(
  ( (array!70422 (arr!33878 (Array (_ BitVec 32) (_ BitVec 64))) (size!34415 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70421)

(assert (=> b!1091108 (= res!727481 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34415 _keys!1070))))))

(declare-fun res!727488 () Bool)

(assert (=> start!96312 (=> (not res!727488) (not e!623297))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96312 (= res!727488 (validMask!0 mask!1414))))

(assert (=> start!96312 e!623297))

(assert (=> start!96312 tp!80035))

(assert (=> start!96312 true))

(declare-fun tp_is_empty!26731 () Bool)

(assert (=> start!96312 tp_is_empty!26731))

(declare-fun array_inv!26176 (array!70421) Bool)

(assert (=> start!96312 (array_inv!26176 _keys!1070)))

(declare-datatypes ((V!40769 0))(
  ( (V!40770 (val!13422 Int)) )
))
(declare-datatypes ((ValueCell!12656 0))(
  ( (ValueCellFull!12656 (v!16039 V!40769)) (EmptyCell!12656) )
))
(declare-datatypes ((array!70423 0))(
  ( (array!70424 (arr!33879 (Array (_ BitVec 32) ValueCell!12656)) (size!34416 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70423)

(declare-fun e!623296 () Bool)

(declare-fun array_inv!26177 (array!70423) Bool)

(assert (=> start!96312 (and (array_inv!26177 _values!874) e!623296)))

(declare-fun b!1091109 () Bool)

(declare-fun e!623293 () Bool)

(assert (=> b!1091109 (= e!623293 tp_is_empty!26731)))

(declare-fun mapIsEmpty!41851 () Bool)

(declare-fun mapRes!41851 () Bool)

(assert (=> mapIsEmpty!41851 mapRes!41851))

(declare-fun mapNonEmpty!41851 () Bool)

(declare-fun tp!80036 () Bool)

(assert (=> mapNonEmpty!41851 (= mapRes!41851 (and tp!80036 e!623293))))

(declare-fun mapRest!41851 () (Array (_ BitVec 32) ValueCell!12656))

(declare-fun mapKey!41851 () (_ BitVec 32))

(declare-fun mapValue!41851 () ValueCell!12656)

(assert (=> mapNonEmpty!41851 (= (arr!33879 _values!874) (store mapRest!41851 mapKey!41851 mapValue!41851))))

(declare-fun b!1091110 () Bool)

(declare-fun res!727477 () Bool)

(assert (=> b!1091110 (=> (not res!727477) (not e!623297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70421 (_ BitVec 32)) Bool)

(assert (=> b!1091110 (= res!727477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091111 () Bool)

(declare-fun e!623292 () Bool)

(declare-fun e!623290 () Bool)

(assert (=> b!1091111 (= e!623292 (not e!623290))))

(declare-fun res!727480 () Bool)

(assert (=> b!1091111 (=> res!727480 e!623290)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091111 (= res!727480 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40769)

(declare-fun zeroValue!831 () V!40769)

(declare-datatypes ((tuple2!17066 0))(
  ( (tuple2!17067 (_1!8544 (_ BitVec 64)) (_2!8544 V!40769)) )
))
(declare-datatypes ((List!23658 0))(
  ( (Nil!23655) (Cons!23654 (h!24872 tuple2!17066) (t!33437 List!23658)) )
))
(declare-datatypes ((ListLongMap!15043 0))(
  ( (ListLongMap!15044 (toList!7537 List!23658)) )
))
(declare-fun lt!486498 () ListLongMap!15043)

(declare-fun getCurrentListMap!4292 (array!70421 array!70423 (_ BitVec 32) (_ BitVec 32) V!40769 V!40769 (_ BitVec 32) Int) ListLongMap!15043)

(assert (=> b!1091111 (= lt!486498 (getCurrentListMap!4292 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486493 () ListLongMap!15043)

(declare-fun lt!486496 () array!70421)

(declare-fun lt!486499 () array!70423)

(assert (=> b!1091111 (= lt!486493 (getCurrentListMap!4292 lt!486496 lt!486499 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486500 () ListLongMap!15043)

(declare-fun lt!486494 () ListLongMap!15043)

(assert (=> b!1091111 (and (= lt!486500 lt!486494) (= lt!486494 lt!486500))))

(declare-fun lt!486495 () ListLongMap!15043)

(declare-fun -!845 (ListLongMap!15043 (_ BitVec 64)) ListLongMap!15043)

(assert (=> b!1091111 (= lt!486494 (-!845 lt!486495 k0!904))))

(declare-datatypes ((Unit!35857 0))(
  ( (Unit!35858) )
))
(declare-fun lt!486497 () Unit!35857)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!121 (array!70421 array!70423 (_ BitVec 32) (_ BitVec 32) V!40769 V!40769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35857)

(assert (=> b!1091111 (= lt!486497 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!121 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4097 (array!70421 array!70423 (_ BitVec 32) (_ BitVec 32) V!40769 V!40769 (_ BitVec 32) Int) ListLongMap!15043)

(assert (=> b!1091111 (= lt!486500 (getCurrentListMapNoExtraKeys!4097 lt!486496 lt!486499 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2218 (Int (_ BitVec 64)) V!40769)

(assert (=> b!1091111 (= lt!486499 (array!70424 (store (arr!33879 _values!874) i!650 (ValueCellFull!12656 (dynLambda!2218 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34416 _values!874)))))

(assert (=> b!1091111 (= lt!486495 (getCurrentListMapNoExtraKeys!4097 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091111 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486501 () Unit!35857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70421 (_ BitVec 64) (_ BitVec 32)) Unit!35857)

(assert (=> b!1091111 (= lt!486501 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091112 () Bool)

(assert (=> b!1091112 (= e!623297 e!623292)))

(declare-fun res!727483 () Bool)

(assert (=> b!1091112 (=> (not res!727483) (not e!623292))))

(assert (=> b!1091112 (= res!727483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486496 mask!1414))))

(assert (=> b!1091112 (= lt!486496 (array!70422 (store (arr!33878 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34415 _keys!1070)))))

(declare-fun b!1091113 () Bool)

(declare-fun res!727485 () Bool)

(assert (=> b!1091113 (=> (not res!727485) (not e!623297))))

(assert (=> b!1091113 (= res!727485 (and (= (size!34416 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34415 _keys!1070) (size!34416 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091114 () Bool)

(declare-fun e!623291 () Bool)

(assert (=> b!1091114 (= e!623291 tp_is_empty!26731)))

(declare-fun b!1091115 () Bool)

(declare-fun res!727487 () Bool)

(assert (=> b!1091115 (=> (not res!727487) (not e!623297))))

(declare-datatypes ((List!23659 0))(
  ( (Nil!23656) (Cons!23655 (h!24873 (_ BitVec 64)) (t!33438 List!23659)) )
))
(declare-fun arrayNoDuplicates!0 (array!70421 (_ BitVec 32) List!23659) Bool)

(assert (=> b!1091115 (= res!727487 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23656))))

(declare-fun e!623295 () Bool)

(declare-fun lt!486492 () tuple2!17066)

(declare-fun b!1091116 () Bool)

(declare-fun +!3355 (ListLongMap!15043 tuple2!17066) ListLongMap!15043)

(assert (=> b!1091116 (= e!623295 (= lt!486498 (+!3355 lt!486495 lt!486492)))))

(declare-fun b!1091117 () Bool)

(declare-fun res!727486 () Bool)

(assert (=> b!1091117 (=> (not res!727486) (not e!623297))))

(assert (=> b!1091117 (= res!727486 (= (select (arr!33878 _keys!1070) i!650) k0!904))))

(declare-fun b!1091118 () Bool)

(declare-fun res!727479 () Bool)

(assert (=> b!1091118 (=> (not res!727479) (not e!623295))))

(assert (=> b!1091118 (= res!727479 (= lt!486493 (+!3355 lt!486494 lt!486492)))))

(declare-fun b!1091119 () Bool)

(assert (=> b!1091119 (= e!623296 (and e!623291 mapRes!41851))))

(declare-fun condMapEmpty!41851 () Bool)

(declare-fun mapDefault!41851 () ValueCell!12656)

(assert (=> b!1091119 (= condMapEmpty!41851 (= (arr!33879 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12656)) mapDefault!41851)))))

(declare-fun b!1091120 () Bool)

(assert (=> b!1091120 (= e!623290 true)))

(assert (=> b!1091120 e!623295))

(declare-fun res!727478 () Bool)

(assert (=> b!1091120 (=> (not res!727478) (not e!623295))))

(assert (=> b!1091120 (= res!727478 (= lt!486493 (+!3355 lt!486500 lt!486492)))))

(assert (=> b!1091120 (= lt!486492 (tuple2!17067 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091121 () Bool)

(declare-fun res!727484 () Bool)

(assert (=> b!1091121 (=> (not res!727484) (not e!623292))))

(assert (=> b!1091121 (= res!727484 (arrayNoDuplicates!0 lt!486496 #b00000000000000000000000000000000 Nil!23656))))

(assert (= (and start!96312 res!727488) b!1091113))

(assert (= (and b!1091113 res!727485) b!1091110))

(assert (= (and b!1091110 res!727477) b!1091115))

(assert (= (and b!1091115 res!727487) b!1091108))

(assert (= (and b!1091108 res!727481) b!1091107))

(assert (= (and b!1091107 res!727482) b!1091117))

(assert (= (and b!1091117 res!727486) b!1091112))

(assert (= (and b!1091112 res!727483) b!1091121))

(assert (= (and b!1091121 res!727484) b!1091111))

(assert (= (and b!1091111 (not res!727480)) b!1091120))

(assert (= (and b!1091120 res!727478) b!1091118))

(assert (= (and b!1091118 res!727479) b!1091116))

(assert (= (and b!1091119 condMapEmpty!41851) mapIsEmpty!41851))

(assert (= (and b!1091119 (not condMapEmpty!41851)) mapNonEmpty!41851))

(get-info :version)

(assert (= (and mapNonEmpty!41851 ((_ is ValueCellFull!12656) mapValue!41851)) b!1091109))

(assert (= (and b!1091119 ((_ is ValueCellFull!12656) mapDefault!41851)) b!1091114))

(assert (= start!96312 b!1091119))

(declare-fun b_lambda!17409 () Bool)

(assert (=> (not b_lambda!17409) (not b!1091111)))

(declare-fun t!33436 () Bool)

(declare-fun tb!7599 () Bool)

(assert (=> (and start!96312 (= defaultEntry!882 defaultEntry!882) t!33436) tb!7599))

(declare-fun result!15725 () Bool)

(assert (=> tb!7599 (= result!15725 tp_is_empty!26731)))

(assert (=> b!1091111 t!33436))

(declare-fun b_and!36145 () Bool)

(assert (= b_and!36143 (and (=> t!33436 result!15725) b_and!36145)))

(declare-fun m!1010759 () Bool)

(assert (=> b!1091117 m!1010759))

(declare-fun m!1010761 () Bool)

(assert (=> mapNonEmpty!41851 m!1010761))

(declare-fun m!1010763 () Bool)

(assert (=> start!96312 m!1010763))

(declare-fun m!1010765 () Bool)

(assert (=> start!96312 m!1010765))

(declare-fun m!1010767 () Bool)

(assert (=> start!96312 m!1010767))

(declare-fun m!1010769 () Bool)

(assert (=> b!1091111 m!1010769))

(declare-fun m!1010771 () Bool)

(assert (=> b!1091111 m!1010771))

(declare-fun m!1010773 () Bool)

(assert (=> b!1091111 m!1010773))

(declare-fun m!1010775 () Bool)

(assert (=> b!1091111 m!1010775))

(declare-fun m!1010777 () Bool)

(assert (=> b!1091111 m!1010777))

(declare-fun m!1010779 () Bool)

(assert (=> b!1091111 m!1010779))

(declare-fun m!1010781 () Bool)

(assert (=> b!1091111 m!1010781))

(declare-fun m!1010783 () Bool)

(assert (=> b!1091111 m!1010783))

(declare-fun m!1010785 () Bool)

(assert (=> b!1091111 m!1010785))

(declare-fun m!1010787 () Bool)

(assert (=> b!1091111 m!1010787))

(declare-fun m!1010789 () Bool)

(assert (=> b!1091112 m!1010789))

(declare-fun m!1010791 () Bool)

(assert (=> b!1091112 m!1010791))

(declare-fun m!1010793 () Bool)

(assert (=> b!1091120 m!1010793))

(declare-fun m!1010795 () Bool)

(assert (=> b!1091107 m!1010795))

(declare-fun m!1010797 () Bool)

(assert (=> b!1091118 m!1010797))

(declare-fun m!1010799 () Bool)

(assert (=> b!1091115 m!1010799))

(declare-fun m!1010801 () Bool)

(assert (=> b!1091121 m!1010801))

(declare-fun m!1010803 () Bool)

(assert (=> b!1091116 m!1010803))

(declare-fun m!1010805 () Bool)

(assert (=> b!1091110 m!1010805))

(check-sat (not b!1091107) (not b!1091116) (not b!1091118) (not b!1091110) (not b!1091115) b_and!36145 tp_is_empty!26731 (not mapNonEmpty!41851) (not b_next!22729) (not b!1091112) (not b!1091121) (not b!1091111) (not b_lambda!17409) (not b!1091120) (not start!96312))
(check-sat b_and!36145 (not b_next!22729))
