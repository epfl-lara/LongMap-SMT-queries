; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95836 () Bool)

(assert start!95836)

(declare-fun b_free!22495 () Bool)

(declare-fun b_next!22495 () Bool)

(assert (=> start!95836 (= b_free!22495 (not b_next!22495))))

(declare-fun tp!79333 () Bool)

(declare-fun b_and!35639 () Bool)

(assert (=> start!95836 (= tp!79333 b_and!35639)))

(declare-fun b!1084470 () Bool)

(declare-fun res!723023 () Bool)

(declare-fun e!619550 () Bool)

(assert (=> b!1084470 (=> (not res!723023) (not e!619550))))

(declare-datatypes ((array!69856 0))(
  ( (array!69857 (arr!33602 (Array (_ BitVec 32) (_ BitVec 64))) (size!34140 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69856)

(declare-datatypes ((List!23494 0))(
  ( (Nil!23491) (Cons!23490 (h!24699 (_ BitVec 64)) (t!33038 List!23494)) )
))
(declare-fun arrayNoDuplicates!0 (array!69856 (_ BitVec 32) List!23494) Bool)

(assert (=> b!1084470 (= res!723023 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23491))))

(declare-fun b!1084471 () Bool)

(declare-fun e!619547 () Bool)

(declare-fun e!619548 () Bool)

(assert (=> b!1084471 (= e!619547 (not e!619548))))

(declare-fun res!723025 () Bool)

(assert (=> b!1084471 (=> res!723025 e!619548)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084471 (= res!723025 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40457 0))(
  ( (V!40458 (val!13305 Int)) )
))
(declare-fun minValue!831 () V!40457)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16922 0))(
  ( (tuple2!16923 (_1!8472 (_ BitVec 64)) (_2!8472 V!40457)) )
))
(declare-datatypes ((List!23495 0))(
  ( (Nil!23492) (Cons!23491 (h!24700 tuple2!16922) (t!33039 List!23495)) )
))
(declare-datatypes ((ListLongMap!14891 0))(
  ( (ListLongMap!14892 (toList!7461 List!23495)) )
))
(declare-fun lt!480605 () ListLongMap!14891)

(declare-fun zeroValue!831 () V!40457)

(declare-datatypes ((ValueCell!12539 0))(
  ( (ValueCellFull!12539 (v!15925 V!40457)) (EmptyCell!12539) )
))
(declare-datatypes ((array!69858 0))(
  ( (array!69859 (arr!33603 (Array (_ BitVec 32) ValueCell!12539)) (size!34141 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69858)

(declare-fun getCurrentListMap!4154 (array!69856 array!69858 (_ BitVec 32) (_ BitVec 32) V!40457 V!40457 (_ BitVec 32) Int) ListLongMap!14891)

(assert (=> b!1084471 (= lt!480605 (getCurrentListMap!4154 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480610 () array!69858)

(declare-fun lt!480613 () ListLongMap!14891)

(declare-fun lt!480612 () array!69856)

(assert (=> b!1084471 (= lt!480613 (getCurrentListMap!4154 lt!480612 lt!480610 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480611 () ListLongMap!14891)

(declare-fun lt!480606 () ListLongMap!14891)

(assert (=> b!1084471 (and (= lt!480611 lt!480606) (= lt!480606 lt!480611))))

(declare-fun lt!480608 () ListLongMap!14891)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!740 (ListLongMap!14891 (_ BitVec 64)) ListLongMap!14891)

(assert (=> b!1084471 (= lt!480606 (-!740 lt!480608 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35515 0))(
  ( (Unit!35516) )
))
(declare-fun lt!480604 () Unit!35515)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!38 (array!69856 array!69858 (_ BitVec 32) (_ BitVec 32) V!40457 V!40457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35515)

(assert (=> b!1084471 (= lt!480604 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!38 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4024 (array!69856 array!69858 (_ BitVec 32) (_ BitVec 32) V!40457 V!40457 (_ BitVec 32) Int) ListLongMap!14891)

(assert (=> b!1084471 (= lt!480611 (getCurrentListMapNoExtraKeys!4024 lt!480612 lt!480610 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2095 (Int (_ BitVec 64)) V!40457)

(assert (=> b!1084471 (= lt!480610 (array!69859 (store (arr!33603 _values!874) i!650 (ValueCellFull!12539 (dynLambda!2095 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34141 _values!874)))))

(assert (=> b!1084471 (= lt!480608 (getCurrentListMapNoExtraKeys!4024 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084471 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480609 () Unit!35515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69856 (_ BitVec 64) (_ BitVec 32)) Unit!35515)

(assert (=> b!1084471 (= lt!480609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084472 () Bool)

(declare-fun res!723024 () Bool)

(assert (=> b!1084472 (=> (not res!723024) (not e!619550))))

(assert (=> b!1084472 (= res!723024 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34140 _keys!1070))))))

(declare-fun b!1084473 () Bool)

(declare-fun e!619546 () Bool)

(declare-fun e!619545 () Bool)

(declare-fun mapRes!41500 () Bool)

(assert (=> b!1084473 (= e!619546 (and e!619545 mapRes!41500))))

(declare-fun condMapEmpty!41500 () Bool)

(declare-fun mapDefault!41500 () ValueCell!12539)

(assert (=> b!1084473 (= condMapEmpty!41500 (= (arr!33603 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12539)) mapDefault!41500)))))

(declare-fun b!1084475 () Bool)

(declare-fun res!723022 () Bool)

(assert (=> b!1084475 (=> (not res!723022) (not e!619550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084475 (= res!723022 (validKeyInArray!0 k0!904))))

(declare-fun b!1084476 () Bool)

(declare-fun res!723016 () Bool)

(assert (=> b!1084476 (=> (not res!723016) (not e!619550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69856 (_ BitVec 32)) Bool)

(assert (=> b!1084476 (= res!723016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun lt!480607 () tuple2!16922)

(declare-fun lt!480614 () tuple2!16922)

(declare-fun e!619544 () Bool)

(declare-fun b!1084477 () Bool)

(declare-fun +!3270 (ListLongMap!14891 tuple2!16922) ListLongMap!14891)

(assert (=> b!1084477 (= e!619544 (= lt!480613 (+!3270 (+!3270 lt!480606 lt!480614) lt!480607)))))

(declare-fun b!1084478 () Bool)

(declare-fun res!723018 () Bool)

(assert (=> b!1084478 (=> (not res!723018) (not e!619544))))

(assert (=> b!1084478 (= res!723018 (= lt!480605 (+!3270 (+!3270 lt!480608 lt!480614) lt!480607)))))

(declare-fun mapIsEmpty!41500 () Bool)

(assert (=> mapIsEmpty!41500 mapRes!41500))

(declare-fun mapNonEmpty!41500 () Bool)

(declare-fun tp!79334 () Bool)

(declare-fun e!619549 () Bool)

(assert (=> mapNonEmpty!41500 (= mapRes!41500 (and tp!79334 e!619549))))

(declare-fun mapRest!41500 () (Array (_ BitVec 32) ValueCell!12539))

(declare-fun mapValue!41500 () ValueCell!12539)

(declare-fun mapKey!41500 () (_ BitVec 32))

(assert (=> mapNonEmpty!41500 (= (arr!33603 _values!874) (store mapRest!41500 mapKey!41500 mapValue!41500))))

(declare-fun b!1084479 () Bool)

(assert (=> b!1084479 (= e!619550 e!619547)))

(declare-fun res!723019 () Bool)

(assert (=> b!1084479 (=> (not res!723019) (not e!619547))))

(assert (=> b!1084479 (= res!723019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480612 mask!1414))))

(assert (=> b!1084479 (= lt!480612 (array!69857 (store (arr!33602 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34140 _keys!1070)))))

(declare-fun b!1084480 () Bool)

(declare-fun tp_is_empty!26497 () Bool)

(assert (=> b!1084480 (= e!619549 tp_is_empty!26497)))

(declare-fun b!1084481 () Bool)

(assert (=> b!1084481 (= e!619545 tp_is_empty!26497)))

(declare-fun b!1084474 () Bool)

(declare-fun res!723027 () Bool)

(assert (=> b!1084474 (=> (not res!723027) (not e!619550))))

(assert (=> b!1084474 (= res!723027 (and (= (size!34141 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34140 _keys!1070) (size!34141 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!723026 () Bool)

(assert (=> start!95836 (=> (not res!723026) (not e!619550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95836 (= res!723026 (validMask!0 mask!1414))))

(assert (=> start!95836 e!619550))

(assert (=> start!95836 tp!79333))

(assert (=> start!95836 true))

(assert (=> start!95836 tp_is_empty!26497))

(declare-fun array_inv!25972 (array!69856) Bool)

(assert (=> start!95836 (array_inv!25972 _keys!1070)))

(declare-fun array_inv!25973 (array!69858) Bool)

(assert (=> start!95836 (and (array_inv!25973 _values!874) e!619546)))

(declare-fun b!1084482 () Bool)

(assert (=> b!1084482 (= e!619548 true)))

(assert (=> b!1084482 e!619544))

(declare-fun res!723020 () Bool)

(assert (=> b!1084482 (=> (not res!723020) (not e!619544))))

(assert (=> b!1084482 (= res!723020 (= lt!480613 (+!3270 (+!3270 lt!480611 lt!480614) lt!480607)))))

(assert (=> b!1084482 (= lt!480607 (tuple2!16923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084482 (= lt!480614 (tuple2!16923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1084483 () Bool)

(declare-fun res!723021 () Bool)

(assert (=> b!1084483 (=> (not res!723021) (not e!619550))))

(assert (=> b!1084483 (= res!723021 (= (select (arr!33602 _keys!1070) i!650) k0!904))))

(declare-fun b!1084484 () Bool)

(declare-fun res!723017 () Bool)

(assert (=> b!1084484 (=> (not res!723017) (not e!619547))))

(assert (=> b!1084484 (= res!723017 (arrayNoDuplicates!0 lt!480612 #b00000000000000000000000000000000 Nil!23491))))

(assert (= (and start!95836 res!723026) b!1084474))

(assert (= (and b!1084474 res!723027) b!1084476))

(assert (= (and b!1084476 res!723016) b!1084470))

(assert (= (and b!1084470 res!723023) b!1084472))

(assert (= (and b!1084472 res!723024) b!1084475))

(assert (= (and b!1084475 res!723022) b!1084483))

(assert (= (and b!1084483 res!723021) b!1084479))

(assert (= (and b!1084479 res!723019) b!1084484))

(assert (= (and b!1084484 res!723017) b!1084471))

(assert (= (and b!1084471 (not res!723025)) b!1084482))

(assert (= (and b!1084482 res!723020) b!1084478))

(assert (= (and b!1084478 res!723018) b!1084477))

(assert (= (and b!1084473 condMapEmpty!41500) mapIsEmpty!41500))

(assert (= (and b!1084473 (not condMapEmpty!41500)) mapNonEmpty!41500))

(get-info :version)

(assert (= (and mapNonEmpty!41500 ((_ is ValueCellFull!12539) mapValue!41500)) b!1084480))

(assert (= (and b!1084473 ((_ is ValueCellFull!12539) mapDefault!41500)) b!1084481))

(assert (= start!95836 b!1084473))

(declare-fun b_lambda!17143 () Bool)

(assert (=> (not b_lambda!17143) (not b!1084471)))

(declare-fun t!33037 () Bool)

(declare-fun tb!7365 () Bool)

(assert (=> (and start!95836 (= defaultEntry!882 defaultEntry!882) t!33037) tb!7365))

(declare-fun result!15257 () Bool)

(assert (=> tb!7365 (= result!15257 tp_is_empty!26497)))

(assert (=> b!1084471 t!33037))

(declare-fun b_and!35641 () Bool)

(assert (= b_and!35639 (and (=> t!33037 result!15257) b_and!35641)))

(declare-fun m!1001717 () Bool)

(assert (=> start!95836 m!1001717))

(declare-fun m!1001719 () Bool)

(assert (=> start!95836 m!1001719))

(declare-fun m!1001721 () Bool)

(assert (=> start!95836 m!1001721))

(declare-fun m!1001723 () Bool)

(assert (=> b!1084477 m!1001723))

(assert (=> b!1084477 m!1001723))

(declare-fun m!1001725 () Bool)

(assert (=> b!1084477 m!1001725))

(declare-fun m!1001727 () Bool)

(assert (=> b!1084482 m!1001727))

(assert (=> b!1084482 m!1001727))

(declare-fun m!1001729 () Bool)

(assert (=> b!1084482 m!1001729))

(declare-fun m!1001731 () Bool)

(assert (=> b!1084478 m!1001731))

(assert (=> b!1084478 m!1001731))

(declare-fun m!1001733 () Bool)

(assert (=> b!1084478 m!1001733))

(declare-fun m!1001735 () Bool)

(assert (=> b!1084479 m!1001735))

(declare-fun m!1001737 () Bool)

(assert (=> b!1084479 m!1001737))

(declare-fun m!1001739 () Bool)

(assert (=> mapNonEmpty!41500 m!1001739))

(declare-fun m!1001741 () Bool)

(assert (=> b!1084475 m!1001741))

(declare-fun m!1001743 () Bool)

(assert (=> b!1084471 m!1001743))

(declare-fun m!1001745 () Bool)

(assert (=> b!1084471 m!1001745))

(declare-fun m!1001747 () Bool)

(assert (=> b!1084471 m!1001747))

(declare-fun m!1001749 () Bool)

(assert (=> b!1084471 m!1001749))

(declare-fun m!1001751 () Bool)

(assert (=> b!1084471 m!1001751))

(declare-fun m!1001753 () Bool)

(assert (=> b!1084471 m!1001753))

(declare-fun m!1001755 () Bool)

(assert (=> b!1084471 m!1001755))

(declare-fun m!1001757 () Bool)

(assert (=> b!1084471 m!1001757))

(declare-fun m!1001759 () Bool)

(assert (=> b!1084471 m!1001759))

(declare-fun m!1001761 () Bool)

(assert (=> b!1084471 m!1001761))

(declare-fun m!1001763 () Bool)

(assert (=> b!1084483 m!1001763))

(declare-fun m!1001765 () Bool)

(assert (=> b!1084484 m!1001765))

(declare-fun m!1001767 () Bool)

(assert (=> b!1084476 m!1001767))

(declare-fun m!1001769 () Bool)

(assert (=> b!1084470 m!1001769))

(check-sat tp_is_empty!26497 b_and!35641 (not b!1084478) (not b!1084470) (not b_lambda!17143) (not b!1084477) (not b!1084471) (not b!1084479) (not b!1084482) (not b!1084484) (not start!95836) (not mapNonEmpty!41500) (not b_next!22495) (not b!1084476) (not b!1084475))
(check-sat b_and!35641 (not b_next!22495))
