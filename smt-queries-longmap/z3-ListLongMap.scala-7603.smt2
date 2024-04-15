; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95932 () Bool)

(assert start!95932)

(declare-fun b_free!22591 () Bool)

(declare-fun b_next!22591 () Bool)

(assert (=> start!95932 (= b_free!22591 (not b_next!22591))))

(declare-fun tp!79622 () Bool)

(declare-fun b_and!35831 () Bool)

(assert (=> start!95932 (= tp!79622 b_and!35831)))

(declare-fun b!1086580 () Bool)

(declare-fun res!724600 () Bool)

(declare-fun e!620686 () Bool)

(assert (=> b!1086580 (=> (not res!724600) (not e!620686))))

(declare-datatypes ((array!70040 0))(
  ( (array!70041 (arr!33694 (Array (_ BitVec 32) (_ BitVec 64))) (size!34232 (_ BitVec 32))) )
))
(declare-fun lt!482989 () array!70040)

(declare-datatypes ((List!23565 0))(
  ( (Nil!23562) (Cons!23561 (h!24770 (_ BitVec 64)) (t!33205 List!23565)) )
))
(declare-fun arrayNoDuplicates!0 (array!70040 (_ BitVec 32) List!23565) Bool)

(assert (=> b!1086580 (= res!724600 (arrayNoDuplicates!0 lt!482989 #b00000000000000000000000000000000 Nil!23562))))

(declare-fun b!1086581 () Bool)

(declare-fun res!724608 () Bool)

(declare-fun e!620693 () Bool)

(assert (=> b!1086581 (=> (not res!724608) (not e!620693))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086581 (= res!724608 (validKeyInArray!0 k0!904))))

(declare-fun b!1086582 () Bool)

(declare-fun res!724606 () Bool)

(assert (=> b!1086582 (=> (not res!724606) (not e!620693))))

(declare-fun _keys!1070 () array!70040)

(assert (=> b!1086582 (= res!724606 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23562))))

(declare-fun b!1086583 () Bool)

(declare-fun e!620689 () Bool)

(assert (=> b!1086583 (= e!620686 (not e!620689))))

(declare-fun res!724603 () Bool)

(assert (=> b!1086583 (=> res!724603 e!620689)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086583 (= res!724603 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40585 0))(
  ( (V!40586 (val!13353 Int)) )
))
(declare-fun minValue!831 () V!40585)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16996 0))(
  ( (tuple2!16997 (_1!8509 (_ BitVec 64)) (_2!8509 V!40585)) )
))
(declare-datatypes ((List!23566 0))(
  ( (Nil!23563) (Cons!23562 (h!24771 tuple2!16996) (t!33206 List!23566)) )
))
(declare-datatypes ((ListLongMap!14965 0))(
  ( (ListLongMap!14966 (toList!7498 List!23566)) )
))
(declare-fun lt!482990 () ListLongMap!14965)

(declare-fun zeroValue!831 () V!40585)

(declare-datatypes ((ValueCell!12587 0))(
  ( (ValueCellFull!12587 (v!15973 V!40585)) (EmptyCell!12587) )
))
(declare-datatypes ((array!70042 0))(
  ( (array!70043 (arr!33695 (Array (_ BitVec 32) ValueCell!12587)) (size!34233 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70042)

(declare-fun getCurrentListMap!4182 (array!70040 array!70042 (_ BitVec 32) (_ BitVec 32) V!40585 V!40585 (_ BitVec 32) Int) ListLongMap!14965)

(assert (=> b!1086583 (= lt!482990 (getCurrentListMap!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482995 () ListLongMap!14965)

(declare-fun lt!482996 () array!70042)

(assert (=> b!1086583 (= lt!482995 (getCurrentListMap!4182 lt!482989 lt!482996 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482993 () ListLongMap!14965)

(declare-fun lt!482987 () ListLongMap!14965)

(assert (=> b!1086583 (and (= lt!482993 lt!482987) (= lt!482987 lt!482993))))

(declare-fun lt!482998 () ListLongMap!14965)

(declare-fun -!777 (ListLongMap!14965 (_ BitVec 64)) ListLongMap!14965)

(assert (=> b!1086583 (= lt!482987 (-!777 lt!482998 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35589 0))(
  ( (Unit!35590) )
))
(declare-fun lt!482992 () Unit!35589)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!66 (array!70040 array!70042 (_ BitVec 32) (_ BitVec 32) V!40585 V!40585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35589)

(assert (=> b!1086583 (= lt!482992 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!66 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4052 (array!70040 array!70042 (_ BitVec 32) (_ BitVec 32) V!40585 V!40585 (_ BitVec 32) Int) ListLongMap!14965)

(assert (=> b!1086583 (= lt!482993 (getCurrentListMapNoExtraKeys!4052 lt!482989 lt!482996 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2123 (Int (_ BitVec 64)) V!40585)

(assert (=> b!1086583 (= lt!482996 (array!70043 (store (arr!33695 _values!874) i!650 (ValueCellFull!12587 (dynLambda!2123 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34233 _values!874)))))

(assert (=> b!1086583 (= lt!482998 (getCurrentListMapNoExtraKeys!4052 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086583 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482994 () Unit!35589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70040 (_ BitVec 64) (_ BitVec 32)) Unit!35589)

(assert (=> b!1086583 (= lt!482994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086584 () Bool)

(declare-fun res!724601 () Bool)

(assert (=> b!1086584 (=> (not res!724601) (not e!620693))))

(assert (=> b!1086584 (= res!724601 (= (select (arr!33694 _keys!1070) i!650) k0!904))))

(declare-fun b!1086585 () Bool)

(declare-fun e!620687 () Bool)

(assert (=> b!1086585 (= e!620687 true)))

(declare-fun lt!482997 () ListLongMap!14965)

(declare-fun lt!482991 () tuple2!16996)

(declare-fun lt!482986 () ListLongMap!14965)

(declare-fun +!3305 (ListLongMap!14965 tuple2!16996) ListLongMap!14965)

(assert (=> b!1086585 (= (-!777 lt!482986 k0!904) (+!3305 lt!482997 lt!482991))))

(declare-fun lt!482988 () Unit!35589)

(declare-fun lt!482984 () ListLongMap!14965)

(declare-fun addRemoveCommutativeForDiffKeys!34 (ListLongMap!14965 (_ BitVec 64) V!40585 (_ BitVec 64)) Unit!35589)

(assert (=> b!1086585 (= lt!482988 (addRemoveCommutativeForDiffKeys!34 lt!482984 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun res!724598 () Bool)

(assert (=> start!95932 (=> (not res!724598) (not e!620693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95932 (= res!724598 (validMask!0 mask!1414))))

(assert (=> start!95932 e!620693))

(assert (=> start!95932 tp!79622))

(assert (=> start!95932 true))

(declare-fun tp_is_empty!26593 () Bool)

(assert (=> start!95932 tp_is_empty!26593))

(declare-fun array_inv!26040 (array!70040) Bool)

(assert (=> start!95932 (array_inv!26040 _keys!1070)))

(declare-fun e!620690 () Bool)

(declare-fun array_inv!26041 (array!70042) Bool)

(assert (=> start!95932 (and (array_inv!26041 _values!874) e!620690)))

(declare-fun b!1086586 () Bool)

(declare-fun e!620692 () Bool)

(assert (=> b!1086586 (= e!620692 tp_is_empty!26593)))

(declare-fun b!1086587 () Bool)

(declare-fun res!724604 () Bool)

(assert (=> b!1086587 (=> (not res!724604) (not e!620693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70040 (_ BitVec 32)) Bool)

(assert (=> b!1086587 (= res!724604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086588 () Bool)

(declare-fun mapRes!41644 () Bool)

(assert (=> b!1086588 (= e!620690 (and e!620692 mapRes!41644))))

(declare-fun condMapEmpty!41644 () Bool)

(declare-fun mapDefault!41644 () ValueCell!12587)

(assert (=> b!1086588 (= condMapEmpty!41644 (= (arr!33695 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12587)) mapDefault!41644)))))

(declare-fun b!1086589 () Bool)

(declare-fun res!724599 () Bool)

(assert (=> b!1086589 (=> (not res!724599) (not e!620693))))

(assert (=> b!1086589 (= res!724599 (and (= (size!34233 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34232 _keys!1070) (size!34233 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086590 () Bool)

(declare-fun e!620688 () Bool)

(assert (=> b!1086590 (= e!620688 tp_is_empty!26593)))

(declare-fun b!1086591 () Bool)

(declare-fun res!724607 () Bool)

(assert (=> b!1086591 (=> (not res!724607) (not e!620693))))

(assert (=> b!1086591 (= res!724607 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34232 _keys!1070))))))

(declare-fun mapIsEmpty!41644 () Bool)

(assert (=> mapIsEmpty!41644 mapRes!41644))

(declare-fun mapNonEmpty!41644 () Bool)

(declare-fun tp!79621 () Bool)

(assert (=> mapNonEmpty!41644 (= mapRes!41644 (and tp!79621 e!620688))))

(declare-fun mapValue!41644 () ValueCell!12587)

(declare-fun mapKey!41644 () (_ BitVec 32))

(declare-fun mapRest!41644 () (Array (_ BitVec 32) ValueCell!12587))

(assert (=> mapNonEmpty!41644 (= (arr!33695 _values!874) (store mapRest!41644 mapKey!41644 mapValue!41644))))

(declare-fun b!1086592 () Bool)

(assert (=> b!1086592 (= e!620689 e!620687)))

(declare-fun res!724602 () Bool)

(assert (=> b!1086592 (=> res!724602 e!620687)))

(assert (=> b!1086592 (= res!724602 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482999 () ListLongMap!14965)

(assert (=> b!1086592 (= lt!482997 lt!482999)))

(assert (=> b!1086592 (= lt!482997 (-!777 lt!482984 k0!904))))

(declare-fun lt!482983 () Unit!35589)

(assert (=> b!1086592 (= lt!482983 (addRemoveCommutativeForDiffKeys!34 lt!482998 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086592 (= lt!482995 (+!3305 lt!482999 lt!482991))))

(declare-fun lt!482985 () tuple2!16996)

(assert (=> b!1086592 (= lt!482999 (+!3305 lt!482987 lt!482985))))

(assert (=> b!1086592 (= lt!482990 lt!482986)))

(assert (=> b!1086592 (= lt!482986 (+!3305 lt!482984 lt!482991))))

(assert (=> b!1086592 (= lt!482984 (+!3305 lt!482998 lt!482985))))

(assert (=> b!1086592 (= lt!482995 (+!3305 (+!3305 lt!482993 lt!482985) lt!482991))))

(assert (=> b!1086592 (= lt!482991 (tuple2!16997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086592 (= lt!482985 (tuple2!16997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086593 () Bool)

(assert (=> b!1086593 (= e!620693 e!620686)))

(declare-fun res!724605 () Bool)

(assert (=> b!1086593 (=> (not res!724605) (not e!620686))))

(assert (=> b!1086593 (= res!724605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482989 mask!1414))))

(assert (=> b!1086593 (= lt!482989 (array!70041 (store (arr!33694 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34232 _keys!1070)))))

(assert (= (and start!95932 res!724598) b!1086589))

(assert (= (and b!1086589 res!724599) b!1086587))

(assert (= (and b!1086587 res!724604) b!1086582))

(assert (= (and b!1086582 res!724606) b!1086591))

(assert (= (and b!1086591 res!724607) b!1086581))

(assert (= (and b!1086581 res!724608) b!1086584))

(assert (= (and b!1086584 res!724601) b!1086593))

(assert (= (and b!1086593 res!724605) b!1086580))

(assert (= (and b!1086580 res!724600) b!1086583))

(assert (= (and b!1086583 (not res!724603)) b!1086592))

(assert (= (and b!1086592 (not res!724602)) b!1086585))

(assert (= (and b!1086588 condMapEmpty!41644) mapIsEmpty!41644))

(assert (= (and b!1086588 (not condMapEmpty!41644)) mapNonEmpty!41644))

(get-info :version)

(assert (= (and mapNonEmpty!41644 ((_ is ValueCellFull!12587) mapValue!41644)) b!1086590))

(assert (= (and b!1086588 ((_ is ValueCellFull!12587) mapDefault!41644)) b!1086586))

(assert (= start!95932 b!1086588))

(declare-fun b_lambda!17239 () Bool)

(assert (=> (not b_lambda!17239) (not b!1086583)))

(declare-fun t!33204 () Bool)

(declare-fun tb!7461 () Bool)

(assert (=> (and start!95932 (= defaultEntry!882 defaultEntry!882) t!33204) tb!7461))

(declare-fun result!15449 () Bool)

(assert (=> tb!7461 (= result!15449 tp_is_empty!26593)))

(assert (=> b!1086583 t!33204))

(declare-fun b_and!35833 () Bool)

(assert (= b_and!35831 (and (=> t!33204 result!15449) b_and!35833)))

(declare-fun m!1004741 () Bool)

(assert (=> b!1086581 m!1004741))

(declare-fun m!1004743 () Bool)

(assert (=> b!1086582 m!1004743))

(declare-fun m!1004745 () Bool)

(assert (=> b!1086583 m!1004745))

(declare-fun m!1004747 () Bool)

(assert (=> b!1086583 m!1004747))

(declare-fun m!1004749 () Bool)

(assert (=> b!1086583 m!1004749))

(declare-fun m!1004751 () Bool)

(assert (=> b!1086583 m!1004751))

(declare-fun m!1004753 () Bool)

(assert (=> b!1086583 m!1004753))

(declare-fun m!1004755 () Bool)

(assert (=> b!1086583 m!1004755))

(declare-fun m!1004757 () Bool)

(assert (=> b!1086583 m!1004757))

(declare-fun m!1004759 () Bool)

(assert (=> b!1086583 m!1004759))

(declare-fun m!1004761 () Bool)

(assert (=> b!1086583 m!1004761))

(declare-fun m!1004763 () Bool)

(assert (=> b!1086583 m!1004763))

(declare-fun m!1004765 () Bool)

(assert (=> b!1086587 m!1004765))

(declare-fun m!1004767 () Bool)

(assert (=> b!1086584 m!1004767))

(declare-fun m!1004769 () Bool)

(assert (=> mapNonEmpty!41644 m!1004769))

(declare-fun m!1004771 () Bool)

(assert (=> b!1086592 m!1004771))

(declare-fun m!1004773 () Bool)

(assert (=> b!1086592 m!1004773))

(declare-fun m!1004775 () Bool)

(assert (=> b!1086592 m!1004775))

(declare-fun m!1004777 () Bool)

(assert (=> b!1086592 m!1004777))

(declare-fun m!1004779 () Bool)

(assert (=> b!1086592 m!1004779))

(assert (=> b!1086592 m!1004777))

(declare-fun m!1004781 () Bool)

(assert (=> b!1086592 m!1004781))

(declare-fun m!1004783 () Bool)

(assert (=> b!1086592 m!1004783))

(declare-fun m!1004785 () Bool)

(assert (=> b!1086592 m!1004785))

(declare-fun m!1004787 () Bool)

(assert (=> start!95932 m!1004787))

(declare-fun m!1004789 () Bool)

(assert (=> start!95932 m!1004789))

(declare-fun m!1004791 () Bool)

(assert (=> start!95932 m!1004791))

(declare-fun m!1004793 () Bool)

(assert (=> b!1086593 m!1004793))

(declare-fun m!1004795 () Bool)

(assert (=> b!1086593 m!1004795))

(declare-fun m!1004797 () Bool)

(assert (=> b!1086580 m!1004797))

(declare-fun m!1004799 () Bool)

(assert (=> b!1086585 m!1004799))

(declare-fun m!1004801 () Bool)

(assert (=> b!1086585 m!1004801))

(declare-fun m!1004803 () Bool)

(assert (=> b!1086585 m!1004803))

(check-sat (not b!1086592) (not b!1086581) (not b!1086583) (not mapNonEmpty!41644) b_and!35833 (not b_lambda!17239) (not b!1086587) tp_is_empty!26593 (not b!1086580) (not b_next!22591) (not start!95932) (not b!1086593) (not b!1086585) (not b!1086582))
(check-sat b_and!35833 (not b_next!22591))
