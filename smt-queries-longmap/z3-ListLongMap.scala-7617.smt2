; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96016 () Bool)

(assert start!96016)

(declare-fun b_free!22675 () Bool)

(declare-fun b_next!22675 () Bool)

(assert (=> start!96016 (= b_free!22675 (not b_next!22675))))

(declare-fun tp!79874 () Bool)

(declare-fun b_and!35999 () Bool)

(assert (=> start!96016 (= tp!79874 b_and!35999)))

(declare-fun b!1088437 () Bool)

(declare-fun res!726003 () Bool)

(declare-fun e!621701 () Bool)

(assert (=> b!1088437 (=> (not res!726003) (not e!621701))))

(declare-datatypes ((array!70202 0))(
  ( (array!70203 (arr!33775 (Array (_ BitVec 32) (_ BitVec 64))) (size!34313 (_ BitVec 32))) )
))
(declare-fun lt!484731 () array!70202)

(declare-datatypes ((List!23633 0))(
  ( (Nil!23630) (Cons!23629 (h!24838 (_ BitVec 64)) (t!33357 List!23633)) )
))
(declare-fun arrayNoDuplicates!0 (array!70202 (_ BitVec 32) List!23633) Bool)

(assert (=> b!1088437 (= res!726003 (arrayNoDuplicates!0 lt!484731 #b00000000000000000000000000000000 Nil!23630))))

(declare-fun b!1088438 () Bool)

(declare-fun e!621700 () Bool)

(assert (=> b!1088438 (= e!621700 true)))

(declare-datatypes ((V!40697 0))(
  ( (V!40698 (val!13395 Int)) )
))
(declare-datatypes ((tuple2!17066 0))(
  ( (tuple2!17067 (_1!8544 (_ BitVec 64)) (_2!8544 V!40697)) )
))
(declare-datatypes ((List!23634 0))(
  ( (Nil!23631) (Cons!23630 (h!24839 tuple2!17066) (t!33358 List!23634)) )
))
(declare-datatypes ((ListLongMap!15035 0))(
  ( (ListLongMap!15036 (toList!7533 List!23634)) )
))
(declare-fun lt!484736 () ListLongMap!15035)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!484732 () ListLongMap!15035)

(declare-fun -!811 (ListLongMap!15035 (_ BitVec 64)) ListLongMap!15035)

(assert (=> b!1088438 (= (-!811 lt!484736 k0!904) lt!484732)))

(declare-datatypes ((Unit!35657 0))(
  ( (Unit!35658) )
))
(declare-fun lt!484741 () Unit!35657)

(declare-fun lt!484734 () ListLongMap!15035)

(declare-fun zeroValue!831 () V!40697)

(declare-fun addRemoveCommutativeForDiffKeys!62 (ListLongMap!15035 (_ BitVec 64) V!40697 (_ BitVec 64)) Unit!35657)

(assert (=> b!1088438 (= lt!484741 (addRemoveCommutativeForDiffKeys!62 lt!484734 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun res!725995 () Bool)

(declare-fun e!621696 () Bool)

(assert (=> start!96016 (=> (not res!725995) (not e!621696))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96016 (= res!725995 (validMask!0 mask!1414))))

(assert (=> start!96016 e!621696))

(assert (=> start!96016 tp!79874))

(assert (=> start!96016 true))

(declare-fun tp_is_empty!26677 () Bool)

(assert (=> start!96016 tp_is_empty!26677))

(declare-fun _keys!1070 () array!70202)

(declare-fun array_inv!26096 (array!70202) Bool)

(assert (=> start!96016 (array_inv!26096 _keys!1070)))

(declare-datatypes ((ValueCell!12629 0))(
  ( (ValueCellFull!12629 (v!16015 V!40697)) (EmptyCell!12629) )
))
(declare-datatypes ((array!70204 0))(
  ( (array!70205 (arr!33776 (Array (_ BitVec 32) ValueCell!12629)) (size!34314 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70204)

(declare-fun e!621698 () Bool)

(declare-fun array_inv!26097 (array!70204) Bool)

(assert (=> start!96016 (and (array_inv!26097 _values!874) e!621698)))

(declare-fun b!1088439 () Bool)

(declare-fun res!725998 () Bool)

(assert (=> b!1088439 (=> (not res!725998) (not e!621696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088439 (= res!725998 (validKeyInArray!0 k0!904))))

(declare-fun b!1088440 () Bool)

(declare-fun res!725993 () Bool)

(assert (=> b!1088440 (=> (not res!725993) (not e!621696))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088440 (= res!725993 (= (select (arr!33775 _keys!1070) i!650) k0!904))))

(declare-fun b!1088441 () Bool)

(declare-fun e!621699 () Bool)

(assert (=> b!1088441 (= e!621701 (not e!621699))))

(declare-fun res!725996 () Bool)

(assert (=> b!1088441 (=> res!725996 e!621699)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088441 (= res!725996 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!484735 () ListLongMap!15035)

(declare-fun minValue!831 () V!40697)

(declare-fun getCurrentListMap!4214 (array!70202 array!70204 (_ BitVec 32) (_ BitVec 32) V!40697 V!40697 (_ BitVec 32) Int) ListLongMap!15035)

(assert (=> b!1088441 (= lt!484735 (getCurrentListMap!4214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484740 () array!70204)

(declare-fun lt!484738 () ListLongMap!15035)

(assert (=> b!1088441 (= lt!484738 (getCurrentListMap!4214 lt!484731 lt!484740 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484742 () ListLongMap!15035)

(declare-fun lt!484730 () ListLongMap!15035)

(assert (=> b!1088441 (and (= lt!484742 lt!484730) (= lt!484730 lt!484742))))

(assert (=> b!1088441 (= lt!484730 (-!811 lt!484734 k0!904))))

(declare-fun lt!484737 () Unit!35657)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!98 (array!70202 array!70204 (_ BitVec 32) (_ BitVec 32) V!40697 V!40697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35657)

(assert (=> b!1088441 (= lt!484737 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!98 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4084 (array!70202 array!70204 (_ BitVec 32) (_ BitVec 32) V!40697 V!40697 (_ BitVec 32) Int) ListLongMap!15035)

(assert (=> b!1088441 (= lt!484742 (getCurrentListMapNoExtraKeys!4084 lt!484731 lt!484740 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2155 (Int (_ BitVec 64)) V!40697)

(assert (=> b!1088441 (= lt!484740 (array!70205 (store (arr!33776 _values!874) i!650 (ValueCellFull!12629 (dynLambda!2155 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34314 _values!874)))))

(assert (=> b!1088441 (= lt!484734 (getCurrentListMapNoExtraKeys!4084 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088441 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484739 () Unit!35657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70202 (_ BitVec 64) (_ BitVec 32)) Unit!35657)

(assert (=> b!1088441 (= lt!484739 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088442 () Bool)

(declare-fun res!725999 () Bool)

(assert (=> b!1088442 (=> (not res!725999) (not e!621696))))

(assert (=> b!1088442 (= res!725999 (and (= (size!34314 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34313 _keys!1070) (size!34314 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088443 () Bool)

(declare-fun res!726000 () Bool)

(assert (=> b!1088443 (=> (not res!726000) (not e!621696))))

(assert (=> b!1088443 (= res!726000 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23630))))

(declare-fun b!1088444 () Bool)

(declare-fun res!725997 () Bool)

(assert (=> b!1088444 (=> (not res!725997) (not e!621696))))

(assert (=> b!1088444 (= res!725997 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34313 _keys!1070))))))

(declare-fun b!1088445 () Bool)

(declare-fun e!621694 () Bool)

(assert (=> b!1088445 (= e!621694 tp_is_empty!26677)))

(declare-fun b!1088446 () Bool)

(declare-fun res!726001 () Bool)

(assert (=> b!1088446 (=> (not res!726001) (not e!621696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70202 (_ BitVec 32)) Bool)

(assert (=> b!1088446 (= res!726001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41770 () Bool)

(declare-fun mapRes!41770 () Bool)

(assert (=> mapIsEmpty!41770 mapRes!41770))

(declare-fun b!1088447 () Bool)

(assert (=> b!1088447 (= e!621696 e!621701)))

(declare-fun res!725994 () Bool)

(assert (=> b!1088447 (=> (not res!725994) (not e!621701))))

(assert (=> b!1088447 (= res!725994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484731 mask!1414))))

(assert (=> b!1088447 (= lt!484731 (array!70203 (store (arr!33775 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34313 _keys!1070)))))

(declare-fun b!1088448 () Bool)

(assert (=> b!1088448 (= e!621699 e!621700)))

(declare-fun res!726002 () Bool)

(assert (=> b!1088448 (=> res!726002 e!621700)))

(assert (=> b!1088448 (= res!726002 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1088448 (= lt!484738 lt!484732)))

(declare-fun lt!484733 () tuple2!17066)

(declare-fun +!3334 (ListLongMap!15035 tuple2!17066) ListLongMap!15035)

(assert (=> b!1088448 (= lt!484732 (+!3334 lt!484730 lt!484733))))

(assert (=> b!1088448 (= lt!484735 lt!484736)))

(assert (=> b!1088448 (= lt!484736 (+!3334 lt!484734 lt!484733))))

(assert (=> b!1088448 (= lt!484738 (+!3334 lt!484742 lt!484733))))

(assert (=> b!1088448 (= lt!484733 (tuple2!17067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088449 () Bool)

(declare-fun e!621697 () Bool)

(assert (=> b!1088449 (= e!621698 (and e!621697 mapRes!41770))))

(declare-fun condMapEmpty!41770 () Bool)

(declare-fun mapDefault!41770 () ValueCell!12629)

(assert (=> b!1088449 (= condMapEmpty!41770 (= (arr!33776 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12629)) mapDefault!41770)))))

(declare-fun mapNonEmpty!41770 () Bool)

(declare-fun tp!79873 () Bool)

(assert (=> mapNonEmpty!41770 (= mapRes!41770 (and tp!79873 e!621694))))

(declare-fun mapRest!41770 () (Array (_ BitVec 32) ValueCell!12629))

(declare-fun mapValue!41770 () ValueCell!12629)

(declare-fun mapKey!41770 () (_ BitVec 32))

(assert (=> mapNonEmpty!41770 (= (arr!33776 _values!874) (store mapRest!41770 mapKey!41770 mapValue!41770))))

(declare-fun b!1088450 () Bool)

(assert (=> b!1088450 (= e!621697 tp_is_empty!26677)))

(assert (= (and start!96016 res!725995) b!1088442))

(assert (= (and b!1088442 res!725999) b!1088446))

(assert (= (and b!1088446 res!726001) b!1088443))

(assert (= (and b!1088443 res!726000) b!1088444))

(assert (= (and b!1088444 res!725997) b!1088439))

(assert (= (and b!1088439 res!725998) b!1088440))

(assert (= (and b!1088440 res!725993) b!1088447))

(assert (= (and b!1088447 res!725994) b!1088437))

(assert (= (and b!1088437 res!726003) b!1088441))

(assert (= (and b!1088441 (not res!725996)) b!1088448))

(assert (= (and b!1088448 (not res!726002)) b!1088438))

(assert (= (and b!1088449 condMapEmpty!41770) mapIsEmpty!41770))

(assert (= (and b!1088449 (not condMapEmpty!41770)) mapNonEmpty!41770))

(get-info :version)

(assert (= (and mapNonEmpty!41770 ((_ is ValueCellFull!12629) mapValue!41770)) b!1088445))

(assert (= (and b!1088449 ((_ is ValueCellFull!12629) mapDefault!41770)) b!1088450))

(assert (= start!96016 b!1088449))

(declare-fun b_lambda!17323 () Bool)

(assert (=> (not b_lambda!17323) (not b!1088441)))

(declare-fun t!33356 () Bool)

(declare-fun tb!7545 () Bool)

(assert (=> (and start!96016 (= defaultEntry!882 defaultEntry!882) t!33356) tb!7545))

(declare-fun result!15617 () Bool)

(assert (=> tb!7545 (= result!15617 tp_is_empty!26677)))

(assert (=> b!1088441 t!33356))

(declare-fun b_and!36001 () Bool)

(assert (= b_and!35999 (and (=> t!33356 result!15617) b_and!36001)))

(declare-fun m!1007057 () Bool)

(assert (=> b!1088447 m!1007057))

(declare-fun m!1007059 () Bool)

(assert (=> b!1088447 m!1007059))

(declare-fun m!1007061 () Bool)

(assert (=> b!1088439 m!1007061))

(declare-fun m!1007063 () Bool)

(assert (=> b!1088448 m!1007063))

(declare-fun m!1007065 () Bool)

(assert (=> b!1088448 m!1007065))

(declare-fun m!1007067 () Bool)

(assert (=> b!1088448 m!1007067))

(declare-fun m!1007069 () Bool)

(assert (=> b!1088446 m!1007069))

(declare-fun m!1007071 () Bool)

(assert (=> b!1088438 m!1007071))

(declare-fun m!1007073 () Bool)

(assert (=> b!1088438 m!1007073))

(declare-fun m!1007075 () Bool)

(assert (=> b!1088441 m!1007075))

(declare-fun m!1007077 () Bool)

(assert (=> b!1088441 m!1007077))

(declare-fun m!1007079 () Bool)

(assert (=> b!1088441 m!1007079))

(declare-fun m!1007081 () Bool)

(assert (=> b!1088441 m!1007081))

(declare-fun m!1007083 () Bool)

(assert (=> b!1088441 m!1007083))

(declare-fun m!1007085 () Bool)

(assert (=> b!1088441 m!1007085))

(declare-fun m!1007087 () Bool)

(assert (=> b!1088441 m!1007087))

(declare-fun m!1007089 () Bool)

(assert (=> b!1088441 m!1007089))

(declare-fun m!1007091 () Bool)

(assert (=> b!1088441 m!1007091))

(declare-fun m!1007093 () Bool)

(assert (=> b!1088441 m!1007093))

(declare-fun m!1007095 () Bool)

(assert (=> b!1088437 m!1007095))

(declare-fun m!1007097 () Bool)

(assert (=> b!1088440 m!1007097))

(declare-fun m!1007099 () Bool)

(assert (=> b!1088443 m!1007099))

(declare-fun m!1007101 () Bool)

(assert (=> mapNonEmpty!41770 m!1007101))

(declare-fun m!1007103 () Bool)

(assert (=> start!96016 m!1007103))

(declare-fun m!1007105 () Bool)

(assert (=> start!96016 m!1007105))

(declare-fun m!1007107 () Bool)

(assert (=> start!96016 m!1007107))

(check-sat (not start!96016) (not b!1088439) (not b_lambda!17323) (not b_next!22675) (not b!1088437) tp_is_empty!26677 (not b!1088446) (not b!1088438) (not b!1088441) (not b!1088447) (not b!1088448) (not b!1088443) (not mapNonEmpty!41770) b_and!36001)
(check-sat b_and!36001 (not b_next!22675))
