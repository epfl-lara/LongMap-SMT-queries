; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97110 () Bool)

(assert start!97110)

(declare-fun b_free!23191 () Bool)

(declare-fun b_next!23191 () Bool)

(assert (=> start!97110 (= b_free!23191 (not b_next!23191))))

(declare-fun tp!81529 () Bool)

(declare-fun b_and!37195 () Bool)

(assert (=> start!97110 (= tp!81529 b_and!37195)))

(declare-fun b!1103399 () Bool)

(declare-fun res!735876 () Bool)

(declare-fun e!629902 () Bool)

(assert (=> b!1103399 (=> (not res!735876) (not e!629902))))

(declare-datatypes ((array!71441 0))(
  ( (array!71442 (arr!34376 (Array (_ BitVec 32) (_ BitVec 64))) (size!34913 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71441)

(declare-datatypes ((List!24033 0))(
  ( (Nil!24030) (Cons!24029 (h!25247 (_ BitVec 64)) (t!34262 List!24033)) )
))
(declare-fun arrayNoDuplicates!0 (array!71441 (_ BitVec 32) List!24033) Bool)

(assert (=> b!1103399 (= res!735876 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24030))))

(declare-fun b!1103400 () Bool)

(declare-fun e!629900 () Bool)

(declare-fun tp_is_empty!27241 () Bool)

(assert (=> b!1103400 (= e!629900 tp_is_empty!27241)))

(declare-fun b!1103401 () Bool)

(declare-fun e!629897 () Bool)

(assert (=> b!1103401 (= e!629897 tp_is_empty!27241)))

(declare-fun res!735877 () Bool)

(assert (=> start!97110 (=> (not res!735877) (not e!629902))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97110 (= res!735877 (validMask!0 mask!1414))))

(assert (=> start!97110 e!629902))

(assert (=> start!97110 tp!81529))

(assert (=> start!97110 true))

(assert (=> start!97110 tp_is_empty!27241))

(declare-fun array_inv!26502 (array!71441) Bool)

(assert (=> start!97110 (array_inv!26502 _keys!1070)))

(declare-datatypes ((V!41449 0))(
  ( (V!41450 (val!13677 Int)) )
))
(declare-datatypes ((ValueCell!12911 0))(
  ( (ValueCellFull!12911 (v!16304 V!41449)) (EmptyCell!12911) )
))
(declare-datatypes ((array!71443 0))(
  ( (array!71444 (arr!34377 (Array (_ BitVec 32) ValueCell!12911)) (size!34914 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71443)

(declare-fun e!629896 () Bool)

(declare-fun array_inv!26503 (array!71443) Bool)

(assert (=> start!97110 (and (array_inv!26503 _values!874) e!629896)))

(declare-fun mapNonEmpty!42652 () Bool)

(declare-fun mapRes!42652 () Bool)

(declare-fun tp!81530 () Bool)

(assert (=> mapNonEmpty!42652 (= mapRes!42652 (and tp!81530 e!629900))))

(declare-fun mapRest!42652 () (Array (_ BitVec 32) ValueCell!12911))

(declare-fun mapValue!42652 () ValueCell!12911)

(declare-fun mapKey!42652 () (_ BitVec 32))

(assert (=> mapNonEmpty!42652 (= (arr!34377 _values!874) (store mapRest!42652 mapKey!42652 mapValue!42652))))

(declare-fun b!1103402 () Bool)

(assert (=> b!1103402 (= e!629896 (and e!629897 mapRes!42652))))

(declare-fun condMapEmpty!42652 () Bool)

(declare-fun mapDefault!42652 () ValueCell!12911)

(assert (=> b!1103402 (= condMapEmpty!42652 (= (arr!34377 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12911)) mapDefault!42652)))))

(declare-fun b!1103403 () Bool)

(declare-fun res!735878 () Bool)

(declare-fun e!629898 () Bool)

(assert (=> b!1103403 (=> (not res!735878) (not e!629898))))

(declare-fun lt!494850 () array!71441)

(assert (=> b!1103403 (= res!735878 (arrayNoDuplicates!0 lt!494850 #b00000000000000000000000000000000 Nil!24030))))

(declare-fun b!1103404 () Bool)

(declare-fun e!629899 () Bool)

(declare-fun e!629901 () Bool)

(assert (=> b!1103404 (= e!629899 e!629901)))

(declare-fun res!735884 () Bool)

(assert (=> b!1103404 (=> res!735884 e!629901)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1103404 (= res!735884 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17414 0))(
  ( (tuple2!17415 (_1!8718 (_ BitVec 64)) (_2!8718 V!41449)) )
))
(declare-datatypes ((List!24034 0))(
  ( (Nil!24031) (Cons!24030 (h!25248 tuple2!17414) (t!34263 List!24034)) )
))
(declare-datatypes ((ListLongMap!15391 0))(
  ( (ListLongMap!15392 (toList!7711 List!24034)) )
))
(declare-fun lt!494847 () ListLongMap!15391)

(declare-fun lt!494852 () ListLongMap!15391)

(assert (=> b!1103404 (= lt!494847 lt!494852)))

(declare-fun lt!494842 () ListLongMap!15391)

(declare-fun lt!494853 () tuple2!17414)

(declare-fun +!3438 (ListLongMap!15391 tuple2!17414) ListLongMap!15391)

(assert (=> b!1103404 (= lt!494852 (+!3438 lt!494842 lt!494853))))

(declare-fun lt!494846 () ListLongMap!15391)

(declare-fun lt!494845 () ListLongMap!15391)

(assert (=> b!1103404 (= lt!494846 lt!494845)))

(declare-fun lt!494848 () ListLongMap!15391)

(assert (=> b!1103404 (= lt!494845 (+!3438 lt!494848 lt!494853))))

(declare-fun lt!494841 () ListLongMap!15391)

(assert (=> b!1103404 (= lt!494846 (+!3438 lt!494841 lt!494853))))

(declare-fun minValue!831 () V!41449)

(assert (=> b!1103404 (= lt!494853 (tuple2!17415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1103405 () Bool)

(declare-fun res!735881 () Bool)

(assert (=> b!1103405 (=> (not res!735881) (not e!629902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103405 (= res!735881 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42652 () Bool)

(assert (=> mapIsEmpty!42652 mapRes!42652))

(declare-fun b!1103406 () Bool)

(declare-fun -!974 (ListLongMap!15391 (_ BitVec 64)) ListLongMap!15391)

(assert (=> b!1103406 (= e!629901 (= (-!974 lt!494847 k0!904) lt!494846))))

(assert (=> b!1103406 (= (-!974 lt!494852 k0!904) lt!494845)))

(declare-datatypes ((Unit!36207 0))(
  ( (Unit!36208) )
))
(declare-fun lt!494843 () Unit!36207)

(declare-fun addRemoveCommutativeForDiffKeys!134 (ListLongMap!15391 (_ BitVec 64) V!41449 (_ BitVec 64)) Unit!36207)

(assert (=> b!1103406 (= lt!494843 (addRemoveCommutativeForDiffKeys!134 lt!494842 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1103407 () Bool)

(declare-fun res!735885 () Bool)

(assert (=> b!1103407 (=> (not res!735885) (not e!629902))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1103407 (= res!735885 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34913 _keys!1070))))))

(declare-fun b!1103408 () Bool)

(declare-fun res!735886 () Bool)

(assert (=> b!1103408 (=> (not res!735886) (not e!629902))))

(assert (=> b!1103408 (= res!735886 (= (select (arr!34376 _keys!1070) i!650) k0!904))))

(declare-fun b!1103409 () Bool)

(assert (=> b!1103409 (= e!629902 e!629898)))

(declare-fun res!735883 () Bool)

(assert (=> b!1103409 (=> (not res!735883) (not e!629898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71441 (_ BitVec 32)) Bool)

(assert (=> b!1103409 (= res!735883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494850 mask!1414))))

(assert (=> b!1103409 (= lt!494850 (array!71442 (store (arr!34376 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34913 _keys!1070)))))

(declare-fun b!1103410 () Bool)

(assert (=> b!1103410 (= e!629898 (not e!629899))))

(declare-fun res!735882 () Bool)

(assert (=> b!1103410 (=> res!735882 e!629899)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1103410 (= res!735882 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41449)

(declare-fun getCurrentListMap!4410 (array!71441 array!71443 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) Int) ListLongMap!15391)

(assert (=> b!1103410 (= lt!494847 (getCurrentListMap!4410 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494849 () array!71443)

(assert (=> b!1103410 (= lt!494846 (getCurrentListMap!4410 lt!494850 lt!494849 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1103410 (and (= lt!494841 lt!494848) (= lt!494848 lt!494841))))

(assert (=> b!1103410 (= lt!494848 (-!974 lt!494842 k0!904))))

(declare-fun lt!494851 () Unit!36207)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!244 (array!71441 array!71443 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36207)

(assert (=> b!1103410 (= lt!494851 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4251 (array!71441 array!71443 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) Int) ListLongMap!15391)

(assert (=> b!1103410 (= lt!494841 (getCurrentListMapNoExtraKeys!4251 lt!494850 lt!494849 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2369 (Int (_ BitVec 64)) V!41449)

(assert (=> b!1103410 (= lt!494849 (array!71444 (store (arr!34377 _values!874) i!650 (ValueCellFull!12911 (dynLambda!2369 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34914 _values!874)))))

(assert (=> b!1103410 (= lt!494842 (getCurrentListMapNoExtraKeys!4251 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103410 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494844 () Unit!36207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71441 (_ BitVec 64) (_ BitVec 32)) Unit!36207)

(assert (=> b!1103410 (= lt!494844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1103411 () Bool)

(declare-fun res!735879 () Bool)

(assert (=> b!1103411 (=> (not res!735879) (not e!629902))))

(assert (=> b!1103411 (= res!735879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1103412 () Bool)

(declare-fun res!735880 () Bool)

(assert (=> b!1103412 (=> (not res!735880) (not e!629902))))

(assert (=> b!1103412 (= res!735880 (and (= (size!34914 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34913 _keys!1070) (size!34914 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!97110 res!735877) b!1103412))

(assert (= (and b!1103412 res!735880) b!1103411))

(assert (= (and b!1103411 res!735879) b!1103399))

(assert (= (and b!1103399 res!735876) b!1103407))

(assert (= (and b!1103407 res!735885) b!1103405))

(assert (= (and b!1103405 res!735881) b!1103408))

(assert (= (and b!1103408 res!735886) b!1103409))

(assert (= (and b!1103409 res!735883) b!1103403))

(assert (= (and b!1103403 res!735878) b!1103410))

(assert (= (and b!1103410 (not res!735882)) b!1103404))

(assert (= (and b!1103404 (not res!735884)) b!1103406))

(assert (= (and b!1103402 condMapEmpty!42652) mapIsEmpty!42652))

(assert (= (and b!1103402 (not condMapEmpty!42652)) mapNonEmpty!42652))

(get-info :version)

(assert (= (and mapNonEmpty!42652 ((_ is ValueCellFull!12911) mapValue!42652)) b!1103400))

(assert (= (and b!1103402 ((_ is ValueCellFull!12911) mapDefault!42652)) b!1103401))

(assert (= start!97110 b!1103402))

(declare-fun b_lambda!18159 () Bool)

(assert (=> (not b_lambda!18159) (not b!1103410)))

(declare-fun t!34261 () Bool)

(declare-fun tb!8049 () Bool)

(assert (=> (and start!97110 (= defaultEntry!882 defaultEntry!882) t!34261) tb!8049))

(declare-fun result!16649 () Bool)

(assert (=> tb!8049 (= result!16649 tp_is_empty!27241)))

(assert (=> b!1103410 t!34261))

(declare-fun b_and!37197 () Bool)

(assert (= b_and!37195 (and (=> t!34261 result!16649) b_and!37197)))

(declare-fun m!1024001 () Bool)

(assert (=> b!1103410 m!1024001))

(declare-fun m!1024003 () Bool)

(assert (=> b!1103410 m!1024003))

(declare-fun m!1024005 () Bool)

(assert (=> b!1103410 m!1024005))

(declare-fun m!1024007 () Bool)

(assert (=> b!1103410 m!1024007))

(declare-fun m!1024009 () Bool)

(assert (=> b!1103410 m!1024009))

(declare-fun m!1024011 () Bool)

(assert (=> b!1103410 m!1024011))

(declare-fun m!1024013 () Bool)

(assert (=> b!1103410 m!1024013))

(declare-fun m!1024015 () Bool)

(assert (=> b!1103410 m!1024015))

(declare-fun m!1024017 () Bool)

(assert (=> b!1103410 m!1024017))

(declare-fun m!1024019 () Bool)

(assert (=> b!1103410 m!1024019))

(declare-fun m!1024021 () Bool)

(assert (=> b!1103403 m!1024021))

(declare-fun m!1024023 () Bool)

(assert (=> b!1103411 m!1024023))

(declare-fun m!1024025 () Bool)

(assert (=> b!1103405 m!1024025))

(declare-fun m!1024027 () Bool)

(assert (=> b!1103399 m!1024027))

(declare-fun m!1024029 () Bool)

(assert (=> b!1103409 m!1024029))

(declare-fun m!1024031 () Bool)

(assert (=> b!1103409 m!1024031))

(declare-fun m!1024033 () Bool)

(assert (=> b!1103408 m!1024033))

(declare-fun m!1024035 () Bool)

(assert (=> mapNonEmpty!42652 m!1024035))

(declare-fun m!1024037 () Bool)

(assert (=> start!97110 m!1024037))

(declare-fun m!1024039 () Bool)

(assert (=> start!97110 m!1024039))

(declare-fun m!1024041 () Bool)

(assert (=> start!97110 m!1024041))

(declare-fun m!1024043 () Bool)

(assert (=> b!1103406 m!1024043))

(declare-fun m!1024045 () Bool)

(assert (=> b!1103406 m!1024045))

(declare-fun m!1024047 () Bool)

(assert (=> b!1103406 m!1024047))

(declare-fun m!1024049 () Bool)

(assert (=> b!1103404 m!1024049))

(declare-fun m!1024051 () Bool)

(assert (=> b!1103404 m!1024051))

(declare-fun m!1024053 () Bool)

(assert (=> b!1103404 m!1024053))

(check-sat (not b!1103411) (not b!1103403) tp_is_empty!27241 (not b!1103399) (not b!1103410) (not b!1103406) b_and!37197 (not b_next!23191) (not b_lambda!18159) (not start!97110) (not b!1103404) (not mapNonEmpty!42652) (not b!1103405) (not b!1103409))
(check-sat b_and!37197 (not b_next!23191))
