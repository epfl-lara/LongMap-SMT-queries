; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96480 () Bool)

(assert start!96480)

(declare-fun b_free!22897 () Bool)

(declare-fun b_next!22897 () Bool)

(assert (=> start!96480 (= b_free!22897 (not b_next!22897))))

(declare-fun tp!80539 () Bool)

(declare-fun b_and!36479 () Bool)

(assert (=> start!96480 (= tp!80539 b_and!36479)))

(declare-fun b!1094644 () Bool)

(declare-fun res!730092 () Bool)

(declare-fun e!625144 () Bool)

(assert (=> b!1094644 (=> (not res!730092) (not e!625144))))

(declare-datatypes ((array!70743 0))(
  ( (array!70744 (arr!34039 (Array (_ BitVec 32) (_ BitVec 64))) (size!34576 (_ BitVec 32))) )
))
(declare-fun lt!489427 () array!70743)

(declare-datatypes ((List!23780 0))(
  ( (Nil!23777) (Cons!23776 (h!24994 (_ BitVec 64)) (t!33727 List!23780)) )
))
(declare-fun arrayNoDuplicates!0 (array!70743 (_ BitVec 32) List!23780) Bool)

(assert (=> b!1094644 (= res!730092 (arrayNoDuplicates!0 lt!489427 #b00000000000000000000000000000000 Nil!23777))))

(declare-fun b!1094645 () Bool)

(declare-fun res!730093 () Bool)

(declare-fun e!625145 () Bool)

(assert (=> b!1094645 (=> (not res!730093) (not e!625145))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70743)

(declare-datatypes ((V!40993 0))(
  ( (V!40994 (val!13506 Int)) )
))
(declare-datatypes ((ValueCell!12740 0))(
  ( (ValueCellFull!12740 (v!16123 V!40993)) (EmptyCell!12740) )
))
(declare-datatypes ((array!70745 0))(
  ( (array!70746 (arr!34040 (Array (_ BitVec 32) ValueCell!12740)) (size!34577 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70745)

(assert (=> b!1094645 (= res!730093 (and (= (size!34577 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34576 _keys!1070) (size!34577 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094646 () Bool)

(declare-fun res!730098 () Bool)

(assert (=> b!1094646 (=> (not res!730098) (not e!625145))))

(assert (=> b!1094646 (= res!730098 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23777))))

(declare-fun res!730090 () Bool)

(assert (=> start!96480 (=> (not res!730090) (not e!625145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96480 (= res!730090 (validMask!0 mask!1414))))

(assert (=> start!96480 e!625145))

(assert (=> start!96480 tp!80539))

(assert (=> start!96480 true))

(declare-fun tp_is_empty!26899 () Bool)

(assert (=> start!96480 tp_is_empty!26899))

(declare-fun array_inv!26274 (array!70743) Bool)

(assert (=> start!96480 (array_inv!26274 _keys!1070)))

(declare-fun e!625143 () Bool)

(declare-fun array_inv!26275 (array!70745) Bool)

(assert (=> start!96480 (and (array_inv!26275 _values!874) e!625143)))

(declare-fun b!1094647 () Bool)

(declare-fun res!730095 () Bool)

(assert (=> b!1094647 (=> (not res!730095) (not e!625145))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094647 (= res!730095 (= (select (arr!34039 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42103 () Bool)

(declare-fun mapRes!42103 () Bool)

(declare-fun tp!80540 () Bool)

(declare-fun e!625142 () Bool)

(assert (=> mapNonEmpty!42103 (= mapRes!42103 (and tp!80540 e!625142))))

(declare-fun mapRest!42103 () (Array (_ BitVec 32) ValueCell!12740))

(declare-fun mapKey!42103 () (_ BitVec 32))

(declare-fun mapValue!42103 () ValueCell!12740)

(assert (=> mapNonEmpty!42103 (= (arr!34040 _values!874) (store mapRest!42103 mapKey!42103 mapValue!42103))))

(declare-fun b!1094648 () Bool)

(assert (=> b!1094648 (= e!625142 tp_is_empty!26899)))

(declare-fun b!1094649 () Bool)

(assert (=> b!1094649 (= e!625144 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40993)

(declare-datatypes ((tuple2!17184 0))(
  ( (tuple2!17185 (_1!8603 (_ BitVec 64)) (_2!8603 V!40993)) )
))
(declare-datatypes ((List!23781 0))(
  ( (Nil!23778) (Cons!23777 (h!24995 tuple2!17184) (t!33728 List!23781)) )
))
(declare-datatypes ((ListLongMap!15161 0))(
  ( (ListLongMap!15162 (toList!7596 List!23781)) )
))
(declare-fun lt!489430 () ListLongMap!15161)

(declare-fun zeroValue!831 () V!40993)

(declare-fun getCurrentListMap!4344 (array!70743 array!70745 (_ BitVec 32) (_ BitVec 32) V!40993 V!40993 (_ BitVec 32) Int) ListLongMap!15161)

(assert (=> b!1094649 (= lt!489430 (getCurrentListMap!4344 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489429 () array!70745)

(declare-fun lt!489428 () ListLongMap!15161)

(assert (=> b!1094649 (= lt!489428 (getCurrentListMap!4344 lt!489427 lt!489429 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489424 () ListLongMap!15161)

(declare-fun lt!489431 () ListLongMap!15161)

(assert (=> b!1094649 (and (= lt!489424 lt!489431) (= lt!489431 lt!489424))))

(declare-fun lt!489425 () ListLongMap!15161)

(declare-fun -!901 (ListLongMap!15161 (_ BitVec 64)) ListLongMap!15161)

(assert (=> b!1094649 (= lt!489431 (-!901 lt!489425 k0!904))))

(declare-datatypes ((Unit!35969 0))(
  ( (Unit!35970) )
))
(declare-fun lt!489426 () Unit!35969)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!173 (array!70743 array!70745 (_ BitVec 32) (_ BitVec 32) V!40993 V!40993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35969)

(assert (=> b!1094649 (= lt!489426 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!173 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4149 (array!70743 array!70745 (_ BitVec 32) (_ BitVec 32) V!40993 V!40993 (_ BitVec 32) Int) ListLongMap!15161)

(assert (=> b!1094649 (= lt!489424 (getCurrentListMapNoExtraKeys!4149 lt!489427 lt!489429 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2270 (Int (_ BitVec 64)) V!40993)

(assert (=> b!1094649 (= lt!489429 (array!70746 (store (arr!34040 _values!874) i!650 (ValueCellFull!12740 (dynLambda!2270 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34577 _values!874)))))

(assert (=> b!1094649 (= lt!489425 (getCurrentListMapNoExtraKeys!4149 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094649 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489432 () Unit!35969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70743 (_ BitVec 64) (_ BitVec 32)) Unit!35969)

(assert (=> b!1094649 (= lt!489432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094650 () Bool)

(declare-fun res!730097 () Bool)

(assert (=> b!1094650 (=> (not res!730097) (not e!625145))))

(assert (=> b!1094650 (= res!730097 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34576 _keys!1070))))))

(declare-fun b!1094651 () Bool)

(declare-fun e!625141 () Bool)

(assert (=> b!1094651 (= e!625141 tp_is_empty!26899)))

(declare-fun b!1094652 () Bool)

(declare-fun res!730094 () Bool)

(assert (=> b!1094652 (=> (not res!730094) (not e!625145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094652 (= res!730094 (validKeyInArray!0 k0!904))))

(declare-fun b!1094653 () Bool)

(declare-fun res!730096 () Bool)

(assert (=> b!1094653 (=> (not res!730096) (not e!625145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70743 (_ BitVec 32)) Bool)

(assert (=> b!1094653 (= res!730096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42103 () Bool)

(assert (=> mapIsEmpty!42103 mapRes!42103))

(declare-fun b!1094654 () Bool)

(assert (=> b!1094654 (= e!625143 (and e!625141 mapRes!42103))))

(declare-fun condMapEmpty!42103 () Bool)

(declare-fun mapDefault!42103 () ValueCell!12740)

(assert (=> b!1094654 (= condMapEmpty!42103 (= (arr!34040 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12740)) mapDefault!42103)))))

(declare-fun b!1094655 () Bool)

(assert (=> b!1094655 (= e!625145 e!625144)))

(declare-fun res!730091 () Bool)

(assert (=> b!1094655 (=> (not res!730091) (not e!625144))))

(assert (=> b!1094655 (= res!730091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489427 mask!1414))))

(assert (=> b!1094655 (= lt!489427 (array!70744 (store (arr!34039 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34576 _keys!1070)))))

(assert (= (and start!96480 res!730090) b!1094645))

(assert (= (and b!1094645 res!730093) b!1094653))

(assert (= (and b!1094653 res!730096) b!1094646))

(assert (= (and b!1094646 res!730098) b!1094650))

(assert (= (and b!1094650 res!730097) b!1094652))

(assert (= (and b!1094652 res!730094) b!1094647))

(assert (= (and b!1094647 res!730095) b!1094655))

(assert (= (and b!1094655 res!730091) b!1094644))

(assert (= (and b!1094644 res!730092) b!1094649))

(assert (= (and b!1094654 condMapEmpty!42103) mapIsEmpty!42103))

(assert (= (and b!1094654 (not condMapEmpty!42103)) mapNonEmpty!42103))

(get-info :version)

(assert (= (and mapNonEmpty!42103 ((_ is ValueCellFull!12740) mapValue!42103)) b!1094648))

(assert (= (and b!1094654 ((_ is ValueCellFull!12740) mapDefault!42103)) b!1094651))

(assert (= start!96480 b!1094654))

(declare-fun b_lambda!17577 () Bool)

(assert (=> (not b_lambda!17577) (not b!1094649)))

(declare-fun t!33726 () Bool)

(declare-fun tb!7767 () Bool)

(assert (=> (and start!96480 (= defaultEntry!882 defaultEntry!882) t!33726) tb!7767))

(declare-fun result!16061 () Bool)

(assert (=> tb!7767 (= result!16061 tp_is_empty!26899)))

(assert (=> b!1094649 t!33726))

(declare-fun b_and!36481 () Bool)

(assert (= b_and!36479 (and (=> t!33726 result!16061) b_and!36481)))

(declare-fun m!1014845 () Bool)

(assert (=> b!1094646 m!1014845))

(declare-fun m!1014847 () Bool)

(assert (=> b!1094652 m!1014847))

(declare-fun m!1014849 () Bool)

(assert (=> b!1094649 m!1014849))

(declare-fun m!1014851 () Bool)

(assert (=> b!1094649 m!1014851))

(declare-fun m!1014853 () Bool)

(assert (=> b!1094649 m!1014853))

(declare-fun m!1014855 () Bool)

(assert (=> b!1094649 m!1014855))

(declare-fun m!1014857 () Bool)

(assert (=> b!1094649 m!1014857))

(declare-fun m!1014859 () Bool)

(assert (=> b!1094649 m!1014859))

(declare-fun m!1014861 () Bool)

(assert (=> b!1094649 m!1014861))

(declare-fun m!1014863 () Bool)

(assert (=> b!1094649 m!1014863))

(declare-fun m!1014865 () Bool)

(assert (=> b!1094649 m!1014865))

(declare-fun m!1014867 () Bool)

(assert (=> b!1094649 m!1014867))

(declare-fun m!1014869 () Bool)

(assert (=> b!1094655 m!1014869))

(declare-fun m!1014871 () Bool)

(assert (=> b!1094655 m!1014871))

(declare-fun m!1014873 () Bool)

(assert (=> mapNonEmpty!42103 m!1014873))

(declare-fun m!1014875 () Bool)

(assert (=> b!1094647 m!1014875))

(declare-fun m!1014877 () Bool)

(assert (=> b!1094653 m!1014877))

(declare-fun m!1014879 () Bool)

(assert (=> b!1094644 m!1014879))

(declare-fun m!1014881 () Bool)

(assert (=> start!96480 m!1014881))

(declare-fun m!1014883 () Bool)

(assert (=> start!96480 m!1014883))

(declare-fun m!1014885 () Bool)

(assert (=> start!96480 m!1014885))

(check-sat (not b!1094644) (not b!1094646) (not b!1094653) (not b!1094649) (not start!96480) (not b!1094652) (not mapNonEmpty!42103) b_and!36481 (not b_lambda!17577) (not b_next!22897) tp_is_empty!26899 (not b!1094655))
(check-sat b_and!36481 (not b_next!22897))
