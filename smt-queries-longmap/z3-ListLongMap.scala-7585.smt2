; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96066 () Bool)

(assert start!96066)

(declare-fun b_free!22483 () Bool)

(declare-fun b_next!22483 () Bool)

(assert (=> start!96066 (= b_free!22483 (not b_next!22483))))

(declare-fun tp!79297 () Bool)

(declare-fun b_and!35651 () Bool)

(assert (=> start!96066 (= tp!79297 b_and!35651)))

(declare-fun b!1085716 () Bool)

(declare-fun e!620382 () Bool)

(declare-fun tp_is_empty!26485 () Bool)

(assert (=> b!1085716 (= e!620382 tp_is_empty!26485)))

(declare-fun b!1085717 () Bool)

(declare-fun res!723446 () Bool)

(declare-fun e!620380 () Bool)

(assert (=> b!1085717 (=> (not res!723446) (not e!620380))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69947 0))(
  ( (array!69948 (arr!33641 (Array (_ BitVec 32) (_ BitVec 64))) (size!34178 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69947)

(assert (=> b!1085717 (= res!723446 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34178 _keys!1070))))))

(declare-fun b!1085718 () Bool)

(declare-fun res!723444 () Bool)

(assert (=> b!1085718 (=> (not res!723444) (not e!620380))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40441 0))(
  ( (V!40442 (val!13299 Int)) )
))
(declare-datatypes ((ValueCell!12533 0))(
  ( (ValueCellFull!12533 (v!15916 V!40441)) (EmptyCell!12533) )
))
(declare-datatypes ((array!69949 0))(
  ( (array!69950 (arr!33642 (Array (_ BitVec 32) ValueCell!12533)) (size!34179 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69949)

(assert (=> b!1085718 (= res!723444 (and (= (size!34179 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34178 _keys!1070) (size!34179 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41482 () Bool)

(declare-fun mapRes!41482 () Bool)

(assert (=> mapIsEmpty!41482 mapRes!41482))

(declare-fun b!1085719 () Bool)

(declare-fun res!723440 () Bool)

(assert (=> b!1085719 (=> (not res!723440) (not e!620380))))

(declare-datatypes ((List!23459 0))(
  ( (Nil!23456) (Cons!23455 (h!24673 (_ BitVec 64)) (t!32992 List!23459)) )
))
(declare-fun arrayNoDuplicates!0 (array!69947 (_ BitVec 32) List!23459) Bool)

(assert (=> b!1085719 (= res!723440 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23456))))

(declare-fun b!1085720 () Bool)

(declare-fun res!723447 () Bool)

(assert (=> b!1085720 (=> (not res!723447) (not e!620380))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085720 (= res!723447 (validKeyInArray!0 k0!904))))

(declare-fun b!1085721 () Bool)

(declare-fun e!620383 () Bool)

(assert (=> b!1085721 (= e!620383 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16862 0))(
  ( (tuple2!16863 (_1!8442 (_ BitVec 64)) (_2!8442 V!40441)) )
))
(declare-datatypes ((List!23460 0))(
  ( (Nil!23457) (Cons!23456 (h!24674 tuple2!16862) (t!32993 List!23460)) )
))
(declare-datatypes ((ListLongMap!14839 0))(
  ( (ListLongMap!14840 (toList!7435 List!23460)) )
))
(declare-fun lt!481173 () ListLongMap!14839)

(declare-fun minValue!831 () V!40441)

(declare-fun lt!481175 () array!69947)

(declare-fun zeroValue!831 () V!40441)

(declare-fun lt!481174 () array!69949)

(declare-fun getCurrentListMap!4207 (array!69947 array!69949 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) Int) ListLongMap!14839)

(assert (=> b!1085721 (= lt!481173 (getCurrentListMap!4207 lt!481175 lt!481174 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481176 () ListLongMap!14839)

(declare-fun lt!481171 () ListLongMap!14839)

(assert (=> b!1085721 (and (= lt!481176 lt!481171) (= lt!481171 lt!481176))))

(declare-fun lt!481169 () ListLongMap!14839)

(declare-fun -!747 (ListLongMap!14839 (_ BitVec 64)) ListLongMap!14839)

(assert (=> b!1085721 (= lt!481171 (-!747 lt!481169 k0!904))))

(declare-datatypes ((Unit!35661 0))(
  ( (Unit!35662) )
))
(declare-fun lt!481170 () Unit!35661)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!36 (array!69947 array!69949 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35661)

(assert (=> b!1085721 (= lt!481170 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!36 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4012 (array!69947 array!69949 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) Int) ListLongMap!14839)

(assert (=> b!1085721 (= lt!481176 (getCurrentListMapNoExtraKeys!4012 lt!481175 lt!481174 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2133 (Int (_ BitVec 64)) V!40441)

(assert (=> b!1085721 (= lt!481174 (array!69950 (store (arr!33642 _values!874) i!650 (ValueCellFull!12533 (dynLambda!2133 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34179 _values!874)))))

(assert (=> b!1085721 (= lt!481169 (getCurrentListMapNoExtraKeys!4012 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085721 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481172 () Unit!35661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69947 (_ BitVec 64) (_ BitVec 32)) Unit!35661)

(assert (=> b!1085721 (= lt!481172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085723 () Bool)

(declare-fun e!620381 () Bool)

(declare-fun e!620379 () Bool)

(assert (=> b!1085723 (= e!620381 (and e!620379 mapRes!41482))))

(declare-fun condMapEmpty!41482 () Bool)

(declare-fun mapDefault!41482 () ValueCell!12533)

(assert (=> b!1085723 (= condMapEmpty!41482 (= (arr!33642 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12533)) mapDefault!41482)))))

(declare-fun b!1085724 () Bool)

(assert (=> b!1085724 (= e!620379 tp_is_empty!26485)))

(declare-fun mapNonEmpty!41482 () Bool)

(declare-fun tp!79298 () Bool)

(assert (=> mapNonEmpty!41482 (= mapRes!41482 (and tp!79298 e!620382))))

(declare-fun mapRest!41482 () (Array (_ BitVec 32) ValueCell!12533))

(declare-fun mapValue!41482 () ValueCell!12533)

(declare-fun mapKey!41482 () (_ BitVec 32))

(assert (=> mapNonEmpty!41482 (= (arr!33642 _values!874) (store mapRest!41482 mapKey!41482 mapValue!41482))))

(declare-fun b!1085725 () Bool)

(declare-fun res!723442 () Bool)

(assert (=> b!1085725 (=> (not res!723442) (not e!620380))))

(assert (=> b!1085725 (= res!723442 (= (select (arr!33641 _keys!1070) i!650) k0!904))))

(declare-fun b!1085726 () Bool)

(assert (=> b!1085726 (= e!620380 e!620383)))

(declare-fun res!723441 () Bool)

(assert (=> b!1085726 (=> (not res!723441) (not e!620383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69947 (_ BitVec 32)) Bool)

(assert (=> b!1085726 (= res!723441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481175 mask!1414))))

(assert (=> b!1085726 (= lt!481175 (array!69948 (store (arr!33641 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34178 _keys!1070)))))

(declare-fun b!1085727 () Bool)

(declare-fun res!723443 () Bool)

(assert (=> b!1085727 (=> (not res!723443) (not e!620380))))

(assert (=> b!1085727 (= res!723443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!723439 () Bool)

(assert (=> start!96066 (=> (not res!723439) (not e!620380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96066 (= res!723439 (validMask!0 mask!1414))))

(assert (=> start!96066 e!620380))

(assert (=> start!96066 tp!79297))

(assert (=> start!96066 true))

(assert (=> start!96066 tp_is_empty!26485))

(declare-fun array_inv!26008 (array!69947) Bool)

(assert (=> start!96066 (array_inv!26008 _keys!1070)))

(declare-fun array_inv!26009 (array!69949) Bool)

(assert (=> start!96066 (and (array_inv!26009 _values!874) e!620381)))

(declare-fun b!1085722 () Bool)

(declare-fun res!723445 () Bool)

(assert (=> b!1085722 (=> (not res!723445) (not e!620383))))

(assert (=> b!1085722 (= res!723445 (arrayNoDuplicates!0 lt!481175 #b00000000000000000000000000000000 Nil!23456))))

(assert (= (and start!96066 res!723439) b!1085718))

(assert (= (and b!1085718 res!723444) b!1085727))

(assert (= (and b!1085727 res!723443) b!1085719))

(assert (= (and b!1085719 res!723440) b!1085717))

(assert (= (and b!1085717 res!723446) b!1085720))

(assert (= (and b!1085720 res!723447) b!1085725))

(assert (= (and b!1085725 res!723442) b!1085726))

(assert (= (and b!1085726 res!723441) b!1085722))

(assert (= (and b!1085722 res!723445) b!1085721))

(assert (= (and b!1085723 condMapEmpty!41482) mapIsEmpty!41482))

(assert (= (and b!1085723 (not condMapEmpty!41482)) mapNonEmpty!41482))

(get-info :version)

(assert (= (and mapNonEmpty!41482 ((_ is ValueCellFull!12533) mapValue!41482)) b!1085716))

(assert (= (and b!1085723 ((_ is ValueCellFull!12533) mapDefault!41482)) b!1085724))

(assert (= start!96066 b!1085723))

(declare-fun b_lambda!17163 () Bool)

(assert (=> (not b_lambda!17163) (not b!1085721)))

(declare-fun t!32991 () Bool)

(declare-fun tb!7353 () Bool)

(assert (=> (and start!96066 (= defaultEntry!882 defaultEntry!882) t!32991) tb!7353))

(declare-fun result!15233 () Bool)

(assert (=> tb!7353 (= result!15233 tp_is_empty!26485)))

(assert (=> b!1085721 t!32991))

(declare-fun b_and!35653 () Bool)

(assert (= b_and!35651 (and (=> t!32991 result!15233) b_and!35653)))

(declare-fun m!1003775 () Bool)

(assert (=> mapNonEmpty!41482 m!1003775))

(declare-fun m!1003777 () Bool)

(assert (=> start!96066 m!1003777))

(declare-fun m!1003779 () Bool)

(assert (=> start!96066 m!1003779))

(declare-fun m!1003781 () Bool)

(assert (=> start!96066 m!1003781))

(declare-fun m!1003783 () Bool)

(assert (=> b!1085722 m!1003783))

(declare-fun m!1003785 () Bool)

(assert (=> b!1085727 m!1003785))

(declare-fun m!1003787 () Bool)

(assert (=> b!1085719 m!1003787))

(declare-fun m!1003789 () Bool)

(assert (=> b!1085720 m!1003789))

(declare-fun m!1003791 () Bool)

(assert (=> b!1085721 m!1003791))

(declare-fun m!1003793 () Bool)

(assert (=> b!1085721 m!1003793))

(declare-fun m!1003795 () Bool)

(assert (=> b!1085721 m!1003795))

(declare-fun m!1003797 () Bool)

(assert (=> b!1085721 m!1003797))

(declare-fun m!1003799 () Bool)

(assert (=> b!1085721 m!1003799))

(declare-fun m!1003801 () Bool)

(assert (=> b!1085721 m!1003801))

(declare-fun m!1003803 () Bool)

(assert (=> b!1085721 m!1003803))

(declare-fun m!1003805 () Bool)

(assert (=> b!1085721 m!1003805))

(declare-fun m!1003807 () Bool)

(assert (=> b!1085721 m!1003807))

(declare-fun m!1003809 () Bool)

(assert (=> b!1085725 m!1003809))

(declare-fun m!1003811 () Bool)

(assert (=> b!1085726 m!1003811))

(declare-fun m!1003813 () Bool)

(assert (=> b!1085726 m!1003813))

(check-sat (not mapNonEmpty!41482) (not b!1085721) (not b!1085727) tp_is_empty!26485 (not b!1085722) (not b!1085726) (not b!1085720) (not b!1085719) b_and!35653 (not b_next!22483) (not b_lambda!17163) (not start!96066))
(check-sat b_and!35653 (not b_next!22483))
