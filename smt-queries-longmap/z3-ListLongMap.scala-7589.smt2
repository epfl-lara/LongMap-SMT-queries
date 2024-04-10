; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95856 () Bool)

(assert start!95856)

(declare-fun b_free!22509 () Bool)

(declare-fun b_next!22509 () Bool)

(assert (=> start!95856 (= b_free!22509 (not b_next!22509))))

(declare-fun tp!79375 () Bool)

(declare-fun b_and!35693 () Bool)

(assert (=> start!95856 (= tp!79375 b_and!35693)))

(declare-fun b!1084929 () Bool)

(declare-fun res!723320 () Bool)

(declare-fun e!619799 () Bool)

(assert (=> b!1084929 (=> (not res!723320) (not e!619799))))

(declare-datatypes ((array!69959 0))(
  ( (array!69960 (arr!33653 (Array (_ BitVec 32) (_ BitVec 64))) (size!34189 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69959)

(declare-datatypes ((List!23465 0))(
  ( (Nil!23462) (Cons!23461 (h!24670 (_ BitVec 64)) (t!33032 List!23465)) )
))
(declare-fun arrayNoDuplicates!0 (array!69959 (_ BitVec 32) List!23465) Bool)

(assert (=> b!1084929 (= res!723320 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23462))))

(declare-fun b!1084930 () Bool)

(declare-fun res!723315 () Bool)

(assert (=> b!1084930 (=> (not res!723315) (not e!619799))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40475 0))(
  ( (V!40476 (val!13312 Int)) )
))
(declare-datatypes ((ValueCell!12546 0))(
  ( (ValueCellFull!12546 (v!15933 V!40475)) (EmptyCell!12546) )
))
(declare-datatypes ((array!69961 0))(
  ( (array!69962 (arr!33654 (Array (_ BitVec 32) ValueCell!12546)) (size!34190 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69961)

(assert (=> b!1084930 (= res!723315 (and (= (size!34190 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34189 _keys!1070) (size!34190 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084931 () Bool)

(declare-fun e!619798 () Bool)

(assert (=> b!1084931 (= e!619798 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((tuple2!16876 0))(
  ( (tuple2!16877 (_1!8449 (_ BitVec 64)) (_2!8449 V!40475)) )
))
(declare-datatypes ((List!23466 0))(
  ( (Nil!23463) (Cons!23462 (h!24671 tuple2!16876) (t!33033 List!23466)) )
))
(declare-datatypes ((ListLongMap!14845 0))(
  ( (ListLongMap!14846 (toList!7438 List!23466)) )
))
(declare-fun lt!481094 () ListLongMap!14845)

(declare-fun lt!481097 () tuple2!16876)

(declare-fun lt!481101 () ListLongMap!14845)

(declare-fun -!764 (ListLongMap!14845 (_ BitVec 64)) ListLongMap!14845)

(declare-fun +!3247 (ListLongMap!14845 tuple2!16876) ListLongMap!14845)

(assert (=> b!1084931 (= (-!764 lt!481101 k0!904) (+!3247 lt!481094 lt!481097))))

(declare-fun minValue!831 () V!40475)

(declare-fun lt!481093 () ListLongMap!14845)

(declare-datatypes ((Unit!35694 0))(
  ( (Unit!35695) )
))
(declare-fun lt!481107 () Unit!35694)

(declare-fun addRemoveCommutativeForDiffKeys!3 (ListLongMap!14845 (_ BitVec 64) V!40475 (_ BitVec 64)) Unit!35694)

(assert (=> b!1084931 (= lt!481107 (addRemoveCommutativeForDiffKeys!3 lt!481093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1084932 () Bool)

(declare-fun res!723323 () Bool)

(declare-fun e!619796 () Bool)

(assert (=> b!1084932 (=> (not res!723323) (not e!619796))))

(declare-fun lt!481102 () array!69959)

(assert (=> b!1084932 (= res!723323 (arrayNoDuplicates!0 lt!481102 #b00000000000000000000000000000000 Nil!23462))))

(declare-fun mapIsEmpty!41521 () Bool)

(declare-fun mapRes!41521 () Bool)

(assert (=> mapIsEmpty!41521 mapRes!41521))

(declare-fun b!1084933 () Bool)

(declare-fun e!619801 () Bool)

(assert (=> b!1084933 (= e!619796 (not e!619801))))

(declare-fun res!723318 () Bool)

(assert (=> b!1084933 (=> res!723318 e!619801)))

(assert (=> b!1084933 (= res!723318 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!831 () V!40475)

(declare-fun lt!481096 () ListLongMap!14845)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4225 (array!69959 array!69961 (_ BitVec 32) (_ BitVec 32) V!40475 V!40475 (_ BitVec 32) Int) ListLongMap!14845)

(assert (=> b!1084933 (= lt!481096 (getCurrentListMap!4225 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481099 () array!69961)

(declare-fun lt!481108 () ListLongMap!14845)

(assert (=> b!1084933 (= lt!481108 (getCurrentListMap!4225 lt!481102 lt!481099 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481103 () ListLongMap!14845)

(declare-fun lt!481104 () ListLongMap!14845)

(assert (=> b!1084933 (and (= lt!481103 lt!481104) (= lt!481104 lt!481103))))

(declare-fun lt!481105 () ListLongMap!14845)

(assert (=> b!1084933 (= lt!481104 (-!764 lt!481105 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!481098 () Unit!35694)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!44 (array!69959 array!69961 (_ BitVec 32) (_ BitVec 32) V!40475 V!40475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35694)

(assert (=> b!1084933 (= lt!481098 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!44 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3985 (array!69959 array!69961 (_ BitVec 32) (_ BitVec 32) V!40475 V!40475 (_ BitVec 32) Int) ListLongMap!14845)

(assert (=> b!1084933 (= lt!481103 (getCurrentListMapNoExtraKeys!3985 lt!481102 lt!481099 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2122 (Int (_ BitVec 64)) V!40475)

(assert (=> b!1084933 (= lt!481099 (array!69962 (store (arr!33654 _values!874) i!650 (ValueCellFull!12546 (dynLambda!2122 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34190 _values!874)))))

(assert (=> b!1084933 (= lt!481105 (getCurrentListMapNoExtraKeys!3985 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084933 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481106 () Unit!35694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69959 (_ BitVec 64) (_ BitVec 32)) Unit!35694)

(assert (=> b!1084933 (= lt!481106 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!723322 () Bool)

(assert (=> start!95856 (=> (not res!723322) (not e!619799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95856 (= res!723322 (validMask!0 mask!1414))))

(assert (=> start!95856 e!619799))

(assert (=> start!95856 tp!79375))

(assert (=> start!95856 true))

(declare-fun tp_is_empty!26511 () Bool)

(assert (=> start!95856 tp_is_empty!26511))

(declare-fun array_inv!25970 (array!69959) Bool)

(assert (=> start!95856 (array_inv!25970 _keys!1070)))

(declare-fun e!619795 () Bool)

(declare-fun array_inv!25971 (array!69961) Bool)

(assert (=> start!95856 (and (array_inv!25971 _values!874) e!619795)))

(declare-fun b!1084934 () Bool)

(declare-fun res!723321 () Bool)

(assert (=> b!1084934 (=> (not res!723321) (not e!619799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084934 (= res!723321 (validKeyInArray!0 k0!904))))

(declare-fun b!1084935 () Bool)

(declare-fun e!619797 () Bool)

(assert (=> b!1084935 (= e!619797 tp_is_empty!26511)))

(declare-fun mapNonEmpty!41521 () Bool)

(declare-fun tp!79376 () Bool)

(declare-fun e!619802 () Bool)

(assert (=> mapNonEmpty!41521 (= mapRes!41521 (and tp!79376 e!619802))))

(declare-fun mapValue!41521 () ValueCell!12546)

(declare-fun mapKey!41521 () (_ BitVec 32))

(declare-fun mapRest!41521 () (Array (_ BitVec 32) ValueCell!12546))

(assert (=> mapNonEmpty!41521 (= (arr!33654 _values!874) (store mapRest!41521 mapKey!41521 mapValue!41521))))

(declare-fun b!1084936 () Bool)

(declare-fun res!723324 () Bool)

(assert (=> b!1084936 (=> (not res!723324) (not e!619799))))

(assert (=> b!1084936 (= res!723324 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34189 _keys!1070))))))

(declare-fun b!1084937 () Bool)

(declare-fun res!723314 () Bool)

(assert (=> b!1084937 (=> (not res!723314) (not e!619799))))

(assert (=> b!1084937 (= res!723314 (= (select (arr!33653 _keys!1070) i!650) k0!904))))

(declare-fun b!1084938 () Bool)

(assert (=> b!1084938 (= e!619802 tp_is_empty!26511)))

(declare-fun b!1084939 () Bool)

(declare-fun res!723319 () Bool)

(assert (=> b!1084939 (=> (not res!723319) (not e!619799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69959 (_ BitVec 32)) Bool)

(assert (=> b!1084939 (= res!723319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084940 () Bool)

(assert (=> b!1084940 (= e!619799 e!619796)))

(declare-fun res!723316 () Bool)

(assert (=> b!1084940 (=> (not res!723316) (not e!619796))))

(assert (=> b!1084940 (= res!723316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481102 mask!1414))))

(assert (=> b!1084940 (= lt!481102 (array!69960 (store (arr!33653 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34189 _keys!1070)))))

(declare-fun b!1084941 () Bool)

(assert (=> b!1084941 (= e!619801 e!619798)))

(declare-fun res!723317 () Bool)

(assert (=> b!1084941 (=> res!723317 e!619798)))

(assert (=> b!1084941 (= res!723317 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481095 () ListLongMap!14845)

(assert (=> b!1084941 (= lt!481094 lt!481095)))

(assert (=> b!1084941 (= lt!481094 (-!764 lt!481093 k0!904))))

(declare-fun lt!481100 () Unit!35694)

(assert (=> b!1084941 (= lt!481100 (addRemoveCommutativeForDiffKeys!3 lt!481105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1084941 (= lt!481108 (+!3247 lt!481095 lt!481097))))

(declare-fun lt!481092 () tuple2!16876)

(assert (=> b!1084941 (= lt!481095 (+!3247 lt!481104 lt!481092))))

(assert (=> b!1084941 (= lt!481096 lt!481101)))

(assert (=> b!1084941 (= lt!481101 (+!3247 lt!481093 lt!481097))))

(assert (=> b!1084941 (= lt!481093 (+!3247 lt!481105 lt!481092))))

(assert (=> b!1084941 (= lt!481108 (+!3247 (+!3247 lt!481103 lt!481092) lt!481097))))

(assert (=> b!1084941 (= lt!481097 (tuple2!16877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084941 (= lt!481092 (tuple2!16877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1084942 () Bool)

(assert (=> b!1084942 (= e!619795 (and e!619797 mapRes!41521))))

(declare-fun condMapEmpty!41521 () Bool)

(declare-fun mapDefault!41521 () ValueCell!12546)

(assert (=> b!1084942 (= condMapEmpty!41521 (= (arr!33654 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12546)) mapDefault!41521)))))

(assert (= (and start!95856 res!723322) b!1084930))

(assert (= (and b!1084930 res!723315) b!1084939))

(assert (= (and b!1084939 res!723319) b!1084929))

(assert (= (and b!1084929 res!723320) b!1084936))

(assert (= (and b!1084936 res!723324) b!1084934))

(assert (= (and b!1084934 res!723321) b!1084937))

(assert (= (and b!1084937 res!723314) b!1084940))

(assert (= (and b!1084940 res!723316) b!1084932))

(assert (= (and b!1084932 res!723323) b!1084933))

(assert (= (and b!1084933 (not res!723318)) b!1084941))

(assert (= (and b!1084941 (not res!723317)) b!1084931))

(assert (= (and b!1084942 condMapEmpty!41521) mapIsEmpty!41521))

(assert (= (and b!1084942 (not condMapEmpty!41521)) mapNonEmpty!41521))

(get-info :version)

(assert (= (and mapNonEmpty!41521 ((_ is ValueCellFull!12546) mapValue!41521)) b!1084938))

(assert (= (and b!1084942 ((_ is ValueCellFull!12546) mapDefault!41521)) b!1084935))

(assert (= start!95856 b!1084942))

(declare-fun b_lambda!17179 () Bool)

(assert (=> (not b_lambda!17179) (not b!1084933)))

(declare-fun t!33031 () Bool)

(declare-fun tb!7387 () Bool)

(assert (=> (and start!95856 (= defaultEntry!882 defaultEntry!882) t!33031) tb!7387))

(declare-fun result!15293 () Bool)

(assert (=> tb!7387 (= result!15293 tp_is_empty!26511)))

(assert (=> b!1084933 t!33031))

(declare-fun b_and!35695 () Bool)

(assert (= b_and!35693 (and (=> t!33031 result!15293) b_and!35695)))

(declare-fun m!1002743 () Bool)

(assert (=> b!1084940 m!1002743))

(declare-fun m!1002745 () Bool)

(assert (=> b!1084940 m!1002745))

(declare-fun m!1002747 () Bool)

(assert (=> b!1084937 m!1002747))

(declare-fun m!1002749 () Bool)

(assert (=> b!1084929 m!1002749))

(declare-fun m!1002751 () Bool)

(assert (=> b!1084941 m!1002751))

(declare-fun m!1002753 () Bool)

(assert (=> b!1084941 m!1002753))

(declare-fun m!1002755 () Bool)

(assert (=> b!1084941 m!1002755))

(declare-fun m!1002757 () Bool)

(assert (=> b!1084941 m!1002757))

(declare-fun m!1002759 () Bool)

(assert (=> b!1084941 m!1002759))

(declare-fun m!1002761 () Bool)

(assert (=> b!1084941 m!1002761))

(assert (=> b!1084941 m!1002755))

(declare-fun m!1002763 () Bool)

(assert (=> b!1084941 m!1002763))

(declare-fun m!1002765 () Bool)

(assert (=> b!1084941 m!1002765))

(declare-fun m!1002767 () Bool)

(assert (=> b!1084939 m!1002767))

(declare-fun m!1002769 () Bool)

(assert (=> b!1084931 m!1002769))

(declare-fun m!1002771 () Bool)

(assert (=> b!1084931 m!1002771))

(declare-fun m!1002773 () Bool)

(assert (=> b!1084931 m!1002773))

(declare-fun m!1002775 () Bool)

(assert (=> b!1084932 m!1002775))

(declare-fun m!1002777 () Bool)

(assert (=> start!95856 m!1002777))

(declare-fun m!1002779 () Bool)

(assert (=> start!95856 m!1002779))

(declare-fun m!1002781 () Bool)

(assert (=> start!95856 m!1002781))

(declare-fun m!1002783 () Bool)

(assert (=> b!1084934 m!1002783))

(declare-fun m!1002785 () Bool)

(assert (=> mapNonEmpty!41521 m!1002785))

(declare-fun m!1002787 () Bool)

(assert (=> b!1084933 m!1002787))

(declare-fun m!1002789 () Bool)

(assert (=> b!1084933 m!1002789))

(declare-fun m!1002791 () Bool)

(assert (=> b!1084933 m!1002791))

(declare-fun m!1002793 () Bool)

(assert (=> b!1084933 m!1002793))

(declare-fun m!1002795 () Bool)

(assert (=> b!1084933 m!1002795))

(declare-fun m!1002797 () Bool)

(assert (=> b!1084933 m!1002797))

(declare-fun m!1002799 () Bool)

(assert (=> b!1084933 m!1002799))

(declare-fun m!1002801 () Bool)

(assert (=> b!1084933 m!1002801))

(declare-fun m!1002803 () Bool)

(assert (=> b!1084933 m!1002803))

(declare-fun m!1002805 () Bool)

(assert (=> b!1084933 m!1002805))

(check-sat (not b_lambda!17179) (not mapNonEmpty!41521) (not b!1084933) (not b!1084934) (not b!1084932) (not b!1084940) (not b!1084931) (not b_next!22509) b_and!35695 (not start!95856) tp_is_empty!26511 (not b!1084939) (not b!1084941) (not b!1084929))
(check-sat b_and!35695 (not b_next!22509))
