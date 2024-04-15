; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95884 () Bool)

(assert start!95884)

(declare-fun b_free!22543 () Bool)

(declare-fun b_next!22543 () Bool)

(assert (=> start!95884 (= b_free!22543 (not b_next!22543))))

(declare-fun tp!79477 () Bool)

(declare-fun b_and!35735 () Bool)

(assert (=> start!95884 (= tp!79477 b_and!35735)))

(declare-fun b!1085524 () Bool)

(declare-fun e!620112 () Bool)

(assert (=> b!1085524 (= e!620112 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((V!40521 0))(
  ( (V!40522 (val!13329 Int)) )
))
(declare-datatypes ((tuple2!16958 0))(
  ( (tuple2!16959 (_1!8490 (_ BitVec 64)) (_2!8490 V!40521)) )
))
(declare-fun lt!481765 () tuple2!16958)

(declare-datatypes ((List!23529 0))(
  ( (Nil!23526) (Cons!23525 (h!24734 tuple2!16958) (t!33121 List!23529)) )
))
(declare-datatypes ((ListLongMap!14927 0))(
  ( (ListLongMap!14928 (toList!7479 List!23529)) )
))
(declare-fun lt!481774 () ListLongMap!14927)

(declare-fun lt!481764 () ListLongMap!14927)

(declare-fun -!758 (ListLongMap!14927 (_ BitVec 64)) ListLongMap!14927)

(declare-fun +!3287 (ListLongMap!14927 tuple2!16958) ListLongMap!14927)

(assert (=> b!1085524 (= (-!758 lt!481774 k0!904) (+!3287 lt!481764 lt!481765))))

(declare-datatypes ((Unit!35551 0))(
  ( (Unit!35552) )
))
(declare-fun lt!481773 () Unit!35551)

(declare-fun lt!481759 () ListLongMap!14927)

(declare-fun minValue!831 () V!40521)

(declare-fun addRemoveCommutativeForDiffKeys!16 (ListLongMap!14927 (_ BitVec 64) V!40521 (_ BitVec 64)) Unit!35551)

(assert (=> b!1085524 (= lt!481773 (addRemoveCommutativeForDiffKeys!16 lt!481759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085525 () Bool)

(declare-fun res!723807 () Bool)

(declare-fun e!620115 () Bool)

(assert (=> b!1085525 (=> (not res!723807) (not e!620115))))

(declare-datatypes ((array!69948 0))(
  ( (array!69949 (arr!33648 (Array (_ BitVec 32) (_ BitVec 64))) (size!34186 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69948)

(declare-datatypes ((List!23530 0))(
  ( (Nil!23527) (Cons!23526 (h!24735 (_ BitVec 64)) (t!33122 List!23530)) )
))
(declare-fun arrayNoDuplicates!0 (array!69948 (_ BitVec 32) List!23530) Bool)

(assert (=> b!1085525 (= res!723807 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23527))))

(declare-fun b!1085526 () Bool)

(declare-fun e!620114 () Bool)

(declare-fun tp_is_empty!26545 () Bool)

(assert (=> b!1085526 (= e!620114 tp_is_empty!26545)))

(declare-fun b!1085527 () Bool)

(declare-fun res!723806 () Bool)

(declare-fun e!620117 () Bool)

(assert (=> b!1085527 (=> (not res!723806) (not e!620117))))

(declare-fun lt!481763 () array!69948)

(assert (=> b!1085527 (= res!723806 (arrayNoDuplicates!0 lt!481763 #b00000000000000000000000000000000 Nil!23527))))

(declare-fun b!1085528 () Bool)

(assert (=> b!1085528 (= e!620115 e!620117)))

(declare-fun res!723811 () Bool)

(assert (=> b!1085528 (=> (not res!723811) (not e!620117))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69948 (_ BitVec 32)) Bool)

(assert (=> b!1085528 (= res!723811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481763 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085528 (= lt!481763 (array!69949 (store (arr!33648 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34186 _keys!1070)))))

(declare-fun b!1085529 () Bool)

(declare-fun e!620110 () Bool)

(assert (=> b!1085529 (= e!620117 (not e!620110))))

(declare-fun res!723810 () Bool)

(assert (=> b!1085529 (=> res!723810 e!620110)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085529 (= res!723810 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!481772 () ListLongMap!14927)

(declare-fun zeroValue!831 () V!40521)

(declare-datatypes ((ValueCell!12563 0))(
  ( (ValueCellFull!12563 (v!15949 V!40521)) (EmptyCell!12563) )
))
(declare-datatypes ((array!69950 0))(
  ( (array!69951 (arr!33649 (Array (_ BitVec 32) ValueCell!12563)) (size!34187 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69950)

(declare-fun getCurrentListMap!4169 (array!69948 array!69950 (_ BitVec 32) (_ BitVec 32) V!40521 V!40521 (_ BitVec 32) Int) ListLongMap!14927)

(assert (=> b!1085529 (= lt!481772 (getCurrentListMap!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481762 () array!69950)

(declare-fun lt!481761 () ListLongMap!14927)

(assert (=> b!1085529 (= lt!481761 (getCurrentListMap!4169 lt!481763 lt!481762 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481775 () ListLongMap!14927)

(declare-fun lt!481768 () ListLongMap!14927)

(assert (=> b!1085529 (and (= lt!481775 lt!481768) (= lt!481768 lt!481775))))

(declare-fun lt!481767 () ListLongMap!14927)

(assert (=> b!1085529 (= lt!481768 (-!758 lt!481767 k0!904))))

(declare-fun lt!481770 () Unit!35551)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!53 (array!69948 array!69950 (_ BitVec 32) (_ BitVec 32) V!40521 V!40521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35551)

(assert (=> b!1085529 (= lt!481770 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!53 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4039 (array!69948 array!69950 (_ BitVec 32) (_ BitVec 32) V!40521 V!40521 (_ BitVec 32) Int) ListLongMap!14927)

(assert (=> b!1085529 (= lt!481775 (getCurrentListMapNoExtraKeys!4039 lt!481763 lt!481762 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2110 (Int (_ BitVec 64)) V!40521)

(assert (=> b!1085529 (= lt!481762 (array!69951 (store (arr!33649 _values!874) i!650 (ValueCellFull!12563 (dynLambda!2110 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34187 _values!874)))))

(assert (=> b!1085529 (= lt!481767 (getCurrentListMapNoExtraKeys!4039 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085529 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481769 () Unit!35551)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69948 (_ BitVec 64) (_ BitVec 32)) Unit!35551)

(assert (=> b!1085529 (= lt!481769 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085530 () Bool)

(declare-fun res!723812 () Bool)

(assert (=> b!1085530 (=> (not res!723812) (not e!620115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085530 (= res!723812 (validKeyInArray!0 k0!904))))

(declare-fun b!1085531 () Bool)

(declare-fun res!723809 () Bool)

(assert (=> b!1085531 (=> (not res!723809) (not e!620115))))

(assert (=> b!1085531 (= res!723809 (and (= (size!34187 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34186 _keys!1070) (size!34187 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085532 () Bool)

(declare-fun res!723815 () Bool)

(assert (=> b!1085532 (=> (not res!723815) (not e!620115))))

(assert (=> b!1085532 (= res!723815 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34186 _keys!1070))))))

(declare-fun mapIsEmpty!41572 () Bool)

(declare-fun mapRes!41572 () Bool)

(assert (=> mapIsEmpty!41572 mapRes!41572))

(declare-fun b!1085533 () Bool)

(assert (=> b!1085533 (= e!620110 e!620112)))

(declare-fun res!723813 () Bool)

(assert (=> b!1085533 (=> res!723813 e!620112)))

(assert (=> b!1085533 (= res!723813 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481766 () ListLongMap!14927)

(assert (=> b!1085533 (= lt!481764 lt!481766)))

(assert (=> b!1085533 (= lt!481764 (-!758 lt!481759 k0!904))))

(declare-fun lt!481771 () Unit!35551)

(assert (=> b!1085533 (= lt!481771 (addRemoveCommutativeForDiffKeys!16 lt!481767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1085533 (= lt!481761 (+!3287 lt!481766 lt!481765))))

(declare-fun lt!481760 () tuple2!16958)

(assert (=> b!1085533 (= lt!481766 (+!3287 lt!481768 lt!481760))))

(assert (=> b!1085533 (= lt!481772 lt!481774)))

(assert (=> b!1085533 (= lt!481774 (+!3287 lt!481759 lt!481765))))

(assert (=> b!1085533 (= lt!481759 (+!3287 lt!481767 lt!481760))))

(assert (=> b!1085533 (= lt!481761 (+!3287 (+!3287 lt!481775 lt!481760) lt!481765))))

(assert (=> b!1085533 (= lt!481765 (tuple2!16959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085533 (= lt!481760 (tuple2!16959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085534 () Bool)

(declare-fun res!723814 () Bool)

(assert (=> b!1085534 (=> (not res!723814) (not e!620115))))

(assert (=> b!1085534 (= res!723814 (= (select (arr!33648 _keys!1070) i!650) k0!904))))

(declare-fun b!1085535 () Bool)

(declare-fun e!620113 () Bool)

(assert (=> b!1085535 (= e!620113 tp_is_empty!26545)))

(declare-fun b!1085536 () Bool)

(declare-fun e!620116 () Bool)

(assert (=> b!1085536 (= e!620116 (and e!620113 mapRes!41572))))

(declare-fun condMapEmpty!41572 () Bool)

(declare-fun mapDefault!41572 () ValueCell!12563)

(assert (=> b!1085536 (= condMapEmpty!41572 (= (arr!33649 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12563)) mapDefault!41572)))))

(declare-fun mapNonEmpty!41572 () Bool)

(declare-fun tp!79478 () Bool)

(assert (=> mapNonEmpty!41572 (= mapRes!41572 (and tp!79478 e!620114))))

(declare-fun mapRest!41572 () (Array (_ BitVec 32) ValueCell!12563))

(declare-fun mapValue!41572 () ValueCell!12563)

(declare-fun mapKey!41572 () (_ BitVec 32))

(assert (=> mapNonEmpty!41572 (= (arr!33649 _values!874) (store mapRest!41572 mapKey!41572 mapValue!41572))))

(declare-fun res!723808 () Bool)

(assert (=> start!95884 (=> (not res!723808) (not e!620115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95884 (= res!723808 (validMask!0 mask!1414))))

(assert (=> start!95884 e!620115))

(assert (=> start!95884 tp!79477))

(assert (=> start!95884 true))

(assert (=> start!95884 tp_is_empty!26545))

(declare-fun array_inv!26004 (array!69948) Bool)

(assert (=> start!95884 (array_inv!26004 _keys!1070)))

(declare-fun array_inv!26005 (array!69950) Bool)

(assert (=> start!95884 (and (array_inv!26005 _values!874) e!620116)))

(declare-fun b!1085537 () Bool)

(declare-fun res!723816 () Bool)

(assert (=> b!1085537 (=> (not res!723816) (not e!620115))))

(assert (=> b!1085537 (= res!723816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95884 res!723808) b!1085531))

(assert (= (and b!1085531 res!723809) b!1085537))

(assert (= (and b!1085537 res!723816) b!1085525))

(assert (= (and b!1085525 res!723807) b!1085532))

(assert (= (and b!1085532 res!723815) b!1085530))

(assert (= (and b!1085530 res!723812) b!1085534))

(assert (= (and b!1085534 res!723814) b!1085528))

(assert (= (and b!1085528 res!723811) b!1085527))

(assert (= (and b!1085527 res!723806) b!1085529))

(assert (= (and b!1085529 (not res!723810)) b!1085533))

(assert (= (and b!1085533 (not res!723813)) b!1085524))

(assert (= (and b!1085536 condMapEmpty!41572) mapIsEmpty!41572))

(assert (= (and b!1085536 (not condMapEmpty!41572)) mapNonEmpty!41572))

(get-info :version)

(assert (= (and mapNonEmpty!41572 ((_ is ValueCellFull!12563) mapValue!41572)) b!1085526))

(assert (= (and b!1085536 ((_ is ValueCellFull!12563) mapDefault!41572)) b!1085535))

(assert (= start!95884 b!1085536))

(declare-fun b_lambda!17191 () Bool)

(assert (=> (not b_lambda!17191) (not b!1085529)))

(declare-fun t!33120 () Bool)

(declare-fun tb!7413 () Bool)

(assert (=> (and start!95884 (= defaultEntry!882 defaultEntry!882) t!33120) tb!7413))

(declare-fun result!15353 () Bool)

(assert (=> tb!7413 (= result!15353 tp_is_empty!26545)))

(assert (=> b!1085529 t!33120))

(declare-fun b_and!35737 () Bool)

(assert (= b_and!35735 (and (=> t!33120 result!15353) b_and!35737)))

(declare-fun m!1003205 () Bool)

(assert (=> b!1085525 m!1003205))

(declare-fun m!1003207 () Bool)

(assert (=> b!1085529 m!1003207))

(declare-fun m!1003209 () Bool)

(assert (=> b!1085529 m!1003209))

(declare-fun m!1003211 () Bool)

(assert (=> b!1085529 m!1003211))

(declare-fun m!1003213 () Bool)

(assert (=> b!1085529 m!1003213))

(declare-fun m!1003215 () Bool)

(assert (=> b!1085529 m!1003215))

(declare-fun m!1003217 () Bool)

(assert (=> b!1085529 m!1003217))

(declare-fun m!1003219 () Bool)

(assert (=> b!1085529 m!1003219))

(declare-fun m!1003221 () Bool)

(assert (=> b!1085529 m!1003221))

(declare-fun m!1003223 () Bool)

(assert (=> b!1085529 m!1003223))

(declare-fun m!1003225 () Bool)

(assert (=> b!1085529 m!1003225))

(declare-fun m!1003227 () Bool)

(assert (=> b!1085528 m!1003227))

(declare-fun m!1003229 () Bool)

(assert (=> b!1085528 m!1003229))

(declare-fun m!1003231 () Bool)

(assert (=> start!95884 m!1003231))

(declare-fun m!1003233 () Bool)

(assert (=> start!95884 m!1003233))

(declare-fun m!1003235 () Bool)

(assert (=> start!95884 m!1003235))

(declare-fun m!1003237 () Bool)

(assert (=> b!1085527 m!1003237))

(declare-fun m!1003239 () Bool)

(assert (=> b!1085534 m!1003239))

(declare-fun m!1003241 () Bool)

(assert (=> b!1085524 m!1003241))

(declare-fun m!1003243 () Bool)

(assert (=> b!1085524 m!1003243))

(declare-fun m!1003245 () Bool)

(assert (=> b!1085524 m!1003245))

(declare-fun m!1003247 () Bool)

(assert (=> b!1085533 m!1003247))

(declare-fun m!1003249 () Bool)

(assert (=> b!1085533 m!1003249))

(declare-fun m!1003251 () Bool)

(assert (=> b!1085533 m!1003251))

(declare-fun m!1003253 () Bool)

(assert (=> b!1085533 m!1003253))

(declare-fun m!1003255 () Bool)

(assert (=> b!1085533 m!1003255))

(declare-fun m!1003257 () Bool)

(assert (=> b!1085533 m!1003257))

(declare-fun m!1003259 () Bool)

(assert (=> b!1085533 m!1003259))

(assert (=> b!1085533 m!1003253))

(declare-fun m!1003261 () Bool)

(assert (=> b!1085533 m!1003261))

(declare-fun m!1003263 () Bool)

(assert (=> b!1085537 m!1003263))

(declare-fun m!1003265 () Bool)

(assert (=> b!1085530 m!1003265))

(declare-fun m!1003267 () Bool)

(assert (=> mapNonEmpty!41572 m!1003267))

(check-sat (not b!1085537) (not b!1085529) (not b!1085527) (not b_next!22543) (not b_lambda!17191) (not mapNonEmpty!41572) (not b!1085530) (not b!1085528) (not b!1085524) tp_is_empty!26545 (not b!1085525) b_and!35737 (not start!95884) (not b!1085533))
(check-sat b_and!35737 (not b_next!22543))
