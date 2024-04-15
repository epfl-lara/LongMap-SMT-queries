; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95956 () Bool)

(assert start!95956)

(declare-fun b_free!22615 () Bool)

(declare-fun b_next!22615 () Bool)

(assert (=> start!95956 (= b_free!22615 (not b_next!22615))))

(declare-fun tp!79694 () Bool)

(declare-fun b_and!35879 () Bool)

(assert (=> start!95956 (= tp!79694 b_and!35879)))

(declare-fun b!1087110 () Bool)

(declare-fun res!725003 () Bool)

(declare-fun e!620979 () Bool)

(assert (=> b!1087110 (=> (not res!725003) (not e!620979))))

(declare-datatypes ((array!70086 0))(
  ( (array!70087 (arr!33717 (Array (_ BitVec 32) (_ BitVec 64))) (size!34255 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70086)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087110 (= res!725003 (= (select (arr!33717 _keys!1070) i!650) k0!904))))

(declare-fun b!1087111 () Bool)

(declare-fun e!620980 () Bool)

(assert (=> b!1087111 (= e!620979 e!620980)))

(declare-fun res!724997 () Bool)

(assert (=> b!1087111 (=> (not res!724997) (not e!620980))))

(declare-fun lt!483585 () array!70086)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70086 (_ BitVec 32)) Bool)

(assert (=> b!1087111 (= res!724997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483585 mask!1414))))

(assert (=> b!1087111 (= lt!483585 (array!70087 (store (arr!33717 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34255 _keys!1070)))))

(declare-fun b!1087112 () Bool)

(declare-fun e!620981 () Bool)

(assert (=> b!1087112 (= e!620981 true)))

(declare-fun e!620976 () Bool)

(assert (=> b!1087112 e!620976))

(declare-fun res!725005 () Bool)

(assert (=> b!1087112 (=> (not res!725005) (not e!620976))))

(declare-datatypes ((V!40617 0))(
  ( (V!40618 (val!13365 Int)) )
))
(declare-datatypes ((tuple2!17018 0))(
  ( (tuple2!17019 (_1!8520 (_ BitVec 64)) (_2!8520 V!40617)) )
))
(declare-datatypes ((List!23585 0))(
  ( (Nil!23582) (Cons!23581 (h!24790 tuple2!17018) (t!33249 List!23585)) )
))
(declare-datatypes ((ListLongMap!14987 0))(
  ( (ListLongMap!14988 (toList!7509 List!23585)) )
))
(declare-fun lt!483581 () ListLongMap!14987)

(declare-fun lt!483590 () ListLongMap!14987)

(declare-fun lt!483589 () tuple2!17018)

(declare-fun +!3315 (ListLongMap!14987 tuple2!17018) ListLongMap!14987)

(assert (=> b!1087112 (= res!725005 (= lt!483590 (+!3315 lt!483581 lt!483589)))))

(declare-fun zeroValue!831 () V!40617)

(assert (=> b!1087112 (= lt!483589 (tuple2!17019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!725004 () Bool)

(assert (=> start!95956 (=> (not res!725004) (not e!620979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95956 (= res!725004 (validMask!0 mask!1414))))

(assert (=> start!95956 e!620979))

(assert (=> start!95956 tp!79694))

(assert (=> start!95956 true))

(declare-fun tp_is_empty!26617 () Bool)

(assert (=> start!95956 tp_is_empty!26617))

(declare-fun array_inv!26056 (array!70086) Bool)

(assert (=> start!95956 (array_inv!26056 _keys!1070)))

(declare-datatypes ((ValueCell!12599 0))(
  ( (ValueCellFull!12599 (v!15985 V!40617)) (EmptyCell!12599) )
))
(declare-datatypes ((array!70088 0))(
  ( (array!70089 (arr!33718 (Array (_ BitVec 32) ValueCell!12599)) (size!34256 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70088)

(declare-fun e!620978 () Bool)

(declare-fun array_inv!26057 (array!70088) Bool)

(assert (=> start!95956 (and (array_inv!26057 _values!874) e!620978)))

(declare-fun mapIsEmpty!41680 () Bool)

(declare-fun mapRes!41680 () Bool)

(assert (=> mapIsEmpty!41680 mapRes!41680))

(declare-fun lt!483583 () ListLongMap!14987)

(declare-fun b!1087113 () Bool)

(assert (=> b!1087113 (= e!620976 (= lt!483590 (+!3315 lt!483583 lt!483589)))))

(declare-fun b!1087114 () Bool)

(declare-fun res!724999 () Bool)

(assert (=> b!1087114 (=> (not res!724999) (not e!620979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087114 (= res!724999 (validKeyInArray!0 k0!904))))

(declare-fun b!1087115 () Bool)

(declare-fun e!620977 () Bool)

(assert (=> b!1087115 (= e!620978 (and e!620977 mapRes!41680))))

(declare-fun condMapEmpty!41680 () Bool)

(declare-fun mapDefault!41680 () ValueCell!12599)

(assert (=> b!1087115 (= condMapEmpty!41680 (= (arr!33718 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12599)) mapDefault!41680)))))

(declare-fun b!1087116 () Bool)

(assert (=> b!1087116 (= e!620977 tp_is_empty!26617)))

(declare-fun b!1087117 () Bool)

(declare-fun res!725006 () Bool)

(assert (=> b!1087117 (=> (not res!725006) (not e!620980))))

(declare-datatypes ((List!23586 0))(
  ( (Nil!23583) (Cons!23582 (h!24791 (_ BitVec 64)) (t!33250 List!23586)) )
))
(declare-fun arrayNoDuplicates!0 (array!70086 (_ BitVec 32) List!23586) Bool)

(assert (=> b!1087117 (= res!725006 (arrayNoDuplicates!0 lt!483585 #b00000000000000000000000000000000 Nil!23583))))

(declare-fun b!1087118 () Bool)

(declare-fun res!725002 () Bool)

(assert (=> b!1087118 (=> (not res!725002) (not e!620979))))

(assert (=> b!1087118 (= res!725002 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34255 _keys!1070))))))

(declare-fun b!1087119 () Bool)

(assert (=> b!1087119 (= e!620980 (not e!620981))))

(declare-fun res!725007 () Bool)

(assert (=> b!1087119 (=> res!725007 e!620981)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087119 (= res!725007 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40617)

(declare-fun lt!483586 () ListLongMap!14987)

(declare-fun getCurrentListMap!4192 (array!70086 array!70088 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) Int) ListLongMap!14987)

(assert (=> b!1087119 (= lt!483586 (getCurrentListMap!4192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483582 () array!70088)

(assert (=> b!1087119 (= lt!483590 (getCurrentListMap!4192 lt!483585 lt!483582 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087119 (and (= lt!483581 lt!483583) (= lt!483583 lt!483581))))

(declare-fun lt!483584 () ListLongMap!14987)

(declare-fun -!788 (ListLongMap!14987 (_ BitVec 64)) ListLongMap!14987)

(assert (=> b!1087119 (= lt!483583 (-!788 lt!483584 k0!904))))

(declare-datatypes ((Unit!35611 0))(
  ( (Unit!35612) )
))
(declare-fun lt!483587 () Unit!35611)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!76 (array!70086 array!70088 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35611)

(assert (=> b!1087119 (= lt!483587 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!76 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4062 (array!70086 array!70088 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) Int) ListLongMap!14987)

(assert (=> b!1087119 (= lt!483581 (getCurrentListMapNoExtraKeys!4062 lt!483585 lt!483582 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2133 (Int (_ BitVec 64)) V!40617)

(assert (=> b!1087119 (= lt!483582 (array!70089 (store (arr!33718 _values!874) i!650 (ValueCellFull!12599 (dynLambda!2133 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34256 _values!874)))))

(assert (=> b!1087119 (= lt!483584 (getCurrentListMapNoExtraKeys!4062 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087119 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483588 () Unit!35611)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70086 (_ BitVec 64) (_ BitVec 32)) Unit!35611)

(assert (=> b!1087119 (= lt!483588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087120 () Bool)

(declare-fun res!725000 () Bool)

(assert (=> b!1087120 (=> (not res!725000) (not e!620976))))

(assert (=> b!1087120 (= res!725000 (= lt!483586 (+!3315 lt!483584 lt!483589)))))

(declare-fun b!1087121 () Bool)

(declare-fun res!724998 () Bool)

(assert (=> b!1087121 (=> (not res!724998) (not e!620979))))

(assert (=> b!1087121 (= res!724998 (and (= (size!34256 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34255 _keys!1070) (size!34256 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41680 () Bool)

(declare-fun tp!79693 () Bool)

(declare-fun e!620974 () Bool)

(assert (=> mapNonEmpty!41680 (= mapRes!41680 (and tp!79693 e!620974))))

(declare-fun mapValue!41680 () ValueCell!12599)

(declare-fun mapRest!41680 () (Array (_ BitVec 32) ValueCell!12599))

(declare-fun mapKey!41680 () (_ BitVec 32))

(assert (=> mapNonEmpty!41680 (= (arr!33718 _values!874) (store mapRest!41680 mapKey!41680 mapValue!41680))))

(declare-fun b!1087122 () Bool)

(assert (=> b!1087122 (= e!620974 tp_is_empty!26617)))

(declare-fun b!1087123 () Bool)

(declare-fun res!725001 () Bool)

(assert (=> b!1087123 (=> (not res!725001) (not e!620979))))

(assert (=> b!1087123 (= res!725001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087124 () Bool)

(declare-fun res!724996 () Bool)

(assert (=> b!1087124 (=> (not res!724996) (not e!620979))))

(assert (=> b!1087124 (= res!724996 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23583))))

(assert (= (and start!95956 res!725004) b!1087121))

(assert (= (and b!1087121 res!724998) b!1087123))

(assert (= (and b!1087123 res!725001) b!1087124))

(assert (= (and b!1087124 res!724996) b!1087118))

(assert (= (and b!1087118 res!725002) b!1087114))

(assert (= (and b!1087114 res!724999) b!1087110))

(assert (= (and b!1087110 res!725003) b!1087111))

(assert (= (and b!1087111 res!724997) b!1087117))

(assert (= (and b!1087117 res!725006) b!1087119))

(assert (= (and b!1087119 (not res!725007)) b!1087112))

(assert (= (and b!1087112 res!725005) b!1087120))

(assert (= (and b!1087120 res!725000) b!1087113))

(assert (= (and b!1087115 condMapEmpty!41680) mapIsEmpty!41680))

(assert (= (and b!1087115 (not condMapEmpty!41680)) mapNonEmpty!41680))

(get-info :version)

(assert (= (and mapNonEmpty!41680 ((_ is ValueCellFull!12599) mapValue!41680)) b!1087122))

(assert (= (and b!1087115 ((_ is ValueCellFull!12599) mapDefault!41680)) b!1087116))

(assert (= start!95956 b!1087115))

(declare-fun b_lambda!17263 () Bool)

(assert (=> (not b_lambda!17263) (not b!1087119)))

(declare-fun t!33248 () Bool)

(declare-fun tb!7485 () Bool)

(assert (=> (and start!95956 (= defaultEntry!882 defaultEntry!882) t!33248) tb!7485))

(declare-fun result!15497 () Bool)

(assert (=> tb!7485 (= result!15497 tp_is_empty!26617)))

(assert (=> b!1087119 t!33248))

(declare-fun b_and!35881 () Bool)

(assert (= b_and!35879 (and (=> t!33248 result!15497) b_and!35881)))

(declare-fun m!1005509 () Bool)

(assert (=> b!1087110 m!1005509))

(declare-fun m!1005511 () Bool)

(assert (=> b!1087112 m!1005511))

(declare-fun m!1005513 () Bool)

(assert (=> b!1087114 m!1005513))

(declare-fun m!1005515 () Bool)

(assert (=> start!95956 m!1005515))

(declare-fun m!1005517 () Bool)

(assert (=> start!95956 m!1005517))

(declare-fun m!1005519 () Bool)

(assert (=> start!95956 m!1005519))

(declare-fun m!1005521 () Bool)

(assert (=> b!1087124 m!1005521))

(declare-fun m!1005523 () Bool)

(assert (=> b!1087120 m!1005523))

(declare-fun m!1005525 () Bool)

(assert (=> mapNonEmpty!41680 m!1005525))

(declare-fun m!1005527 () Bool)

(assert (=> b!1087113 m!1005527))

(declare-fun m!1005529 () Bool)

(assert (=> b!1087123 m!1005529))

(declare-fun m!1005531 () Bool)

(assert (=> b!1087111 m!1005531))

(declare-fun m!1005533 () Bool)

(assert (=> b!1087111 m!1005533))

(declare-fun m!1005535 () Bool)

(assert (=> b!1087119 m!1005535))

(declare-fun m!1005537 () Bool)

(assert (=> b!1087119 m!1005537))

(declare-fun m!1005539 () Bool)

(assert (=> b!1087119 m!1005539))

(declare-fun m!1005541 () Bool)

(assert (=> b!1087119 m!1005541))

(declare-fun m!1005543 () Bool)

(assert (=> b!1087119 m!1005543))

(declare-fun m!1005545 () Bool)

(assert (=> b!1087119 m!1005545))

(declare-fun m!1005547 () Bool)

(assert (=> b!1087119 m!1005547))

(declare-fun m!1005549 () Bool)

(assert (=> b!1087119 m!1005549))

(declare-fun m!1005551 () Bool)

(assert (=> b!1087119 m!1005551))

(declare-fun m!1005553 () Bool)

(assert (=> b!1087119 m!1005553))

(declare-fun m!1005555 () Bool)

(assert (=> b!1087117 m!1005555))

(check-sat (not b!1087114) b_and!35881 (not b!1087124) (not b!1087119) (not start!95956) (not b!1087123) tp_is_empty!26617 (not mapNonEmpty!41680) (not b!1087120) (not b!1087117) (not b!1087112) (not b!1087111) (not b_next!22615) (not b_lambda!17263) (not b!1087113))
(check-sat b_and!35881 (not b_next!22615))
