; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96078 () Bool)

(assert start!96078)

(declare-fun b_free!22495 () Bool)

(declare-fun b_next!22495 () Bool)

(assert (=> start!96078 (= b_free!22495 (not b_next!22495))))

(declare-fun tp!79334 () Bool)

(declare-fun b_and!35675 () Bool)

(assert (=> start!96078 (= tp!79334 b_and!35675)))

(declare-fun b!1085950 () Bool)

(declare-fun res!723614 () Bool)

(declare-fun e!620495 () Bool)

(assert (=> b!1085950 (=> (not res!723614) (not e!620495))))

(declare-datatypes ((array!69969 0))(
  ( (array!69970 (arr!33652 (Array (_ BitVec 32) (_ BitVec 64))) (size!34189 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69969)

(declare-datatypes ((List!23468 0))(
  ( (Nil!23465) (Cons!23464 (h!24682 (_ BitVec 64)) (t!33013 List!23468)) )
))
(declare-fun arrayNoDuplicates!0 (array!69969 (_ BitVec 32) List!23468) Bool)

(assert (=> b!1085950 (= res!723614 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23465))))

(declare-fun b!1085951 () Bool)

(declare-fun e!620498 () Bool)

(declare-fun tp_is_empty!26497 () Bool)

(assert (=> b!1085951 (= e!620498 tp_is_empty!26497)))

(declare-fun b!1085952 () Bool)

(declare-fun e!620491 () Bool)

(declare-fun mapRes!41500 () Bool)

(assert (=> b!1085952 (= e!620491 (and e!620498 mapRes!41500))))

(declare-fun condMapEmpty!41500 () Bool)

(declare-datatypes ((V!40457 0))(
  ( (V!40458 (val!13305 Int)) )
))
(declare-datatypes ((ValueCell!12539 0))(
  ( (ValueCellFull!12539 (v!15922 V!40457)) (EmptyCell!12539) )
))
(declare-datatypes ((array!69971 0))(
  ( (array!69972 (arr!33653 (Array (_ BitVec 32) ValueCell!12539)) (size!34190 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69971)

(declare-fun mapDefault!41500 () ValueCell!12539)

(assert (=> b!1085952 (= condMapEmpty!41500 (= (arr!33653 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12539)) mapDefault!41500)))))

(declare-fun mapNonEmpty!41500 () Bool)

(declare-fun tp!79333 () Bool)

(declare-fun e!620494 () Bool)

(assert (=> mapNonEmpty!41500 (= mapRes!41500 (and tp!79333 e!620494))))

(declare-fun mapValue!41500 () ValueCell!12539)

(declare-fun mapKey!41500 () (_ BitVec 32))

(declare-fun mapRest!41500 () (Array (_ BitVec 32) ValueCell!12539))

(assert (=> mapNonEmpty!41500 (= (arr!33653 _values!874) (store mapRest!41500 mapKey!41500 mapValue!41500))))

(declare-fun res!723610 () Bool)

(assert (=> start!96078 (=> (not res!723610) (not e!620495))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96078 (= res!723610 (validMask!0 mask!1414))))

(assert (=> start!96078 e!620495))

(assert (=> start!96078 tp!79334))

(assert (=> start!96078 true))

(assert (=> start!96078 tp_is_empty!26497))

(declare-fun array_inv!26018 (array!69969) Bool)

(assert (=> start!96078 (array_inv!26018 _keys!1070)))

(declare-fun array_inv!26019 (array!69971) Bool)

(assert (=> start!96078 (and (array_inv!26019 _values!874) e!620491)))

(declare-fun b!1085953 () Bool)

(declare-fun res!723609 () Bool)

(assert (=> b!1085953 (=> (not res!723609) (not e!620495))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085953 (= res!723609 (= (select (arr!33652 _keys!1070) i!650) k0!904))))

(declare-fun b!1085954 () Bool)

(declare-fun res!723613 () Bool)

(declare-fun e!620493 () Bool)

(assert (=> b!1085954 (=> (not res!723613) (not e!620493))))

(declare-fun lt!481325 () array!69969)

(assert (=> b!1085954 (= res!723613 (arrayNoDuplicates!0 lt!481325 #b00000000000000000000000000000000 Nil!23465))))

(declare-fun b!1085955 () Bool)

(declare-fun e!620492 () Bool)

(assert (=> b!1085955 (= e!620492 true)))

(declare-fun e!620497 () Bool)

(assert (=> b!1085955 e!620497))

(declare-fun res!723612 () Bool)

(assert (=> b!1085955 (=> (not res!723612) (not e!620497))))

(declare-datatypes ((tuple2!16870 0))(
  ( (tuple2!16871 (_1!8446 (_ BitVec 64)) (_2!8446 V!40457)) )
))
(declare-datatypes ((List!23469 0))(
  ( (Nil!23466) (Cons!23465 (h!24683 tuple2!16870) (t!33014 List!23469)) )
))
(declare-datatypes ((ListLongMap!14847 0))(
  ( (ListLongMap!14848 (toList!7439 List!23469)) )
))
(declare-fun lt!481326 () ListLongMap!14847)

(declare-fun lt!481327 () ListLongMap!14847)

(declare-fun lt!481322 () tuple2!16870)

(declare-fun lt!481320 () tuple2!16870)

(declare-fun +!3265 (ListLongMap!14847 tuple2!16870) ListLongMap!14847)

(assert (=> b!1085955 (= res!723612 (= lt!481327 (+!3265 (+!3265 lt!481326 lt!481322) lt!481320)))))

(declare-fun minValue!831 () V!40457)

(assert (=> b!1085955 (= lt!481320 (tuple2!16871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!40457)

(assert (=> b!1085955 (= lt!481322 (tuple2!16871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085956 () Bool)

(assert (=> b!1085956 (= e!620494 tp_is_empty!26497)))

(declare-fun b!1085957 () Bool)

(assert (=> b!1085957 (= e!620493 (not e!620492))))

(declare-fun res!723615 () Bool)

(assert (=> b!1085957 (=> res!723615 e!620492)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085957 (= res!723615 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!481329 () ListLongMap!14847)

(declare-fun getCurrentListMap!4211 (array!69969 array!69971 (_ BitVec 32) (_ BitVec 32) V!40457 V!40457 (_ BitVec 32) Int) ListLongMap!14847)

(assert (=> b!1085957 (= lt!481329 (getCurrentListMap!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481321 () array!69971)

(assert (=> b!1085957 (= lt!481327 (getCurrentListMap!4211 lt!481325 lt!481321 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481323 () ListLongMap!14847)

(assert (=> b!1085957 (and (= lt!481326 lt!481323) (= lt!481323 lt!481326))))

(declare-fun lt!481319 () ListLongMap!14847)

(declare-fun -!751 (ListLongMap!14847 (_ BitVec 64)) ListLongMap!14847)

(assert (=> b!1085957 (= lt!481323 (-!751 lt!481319 k0!904))))

(declare-datatypes ((Unit!35669 0))(
  ( (Unit!35670) )
))
(declare-fun lt!481324 () Unit!35669)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!40 (array!69969 array!69971 (_ BitVec 32) (_ BitVec 32) V!40457 V!40457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35669)

(assert (=> b!1085957 (= lt!481324 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!40 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4016 (array!69969 array!69971 (_ BitVec 32) (_ BitVec 32) V!40457 V!40457 (_ BitVec 32) Int) ListLongMap!14847)

(assert (=> b!1085957 (= lt!481326 (getCurrentListMapNoExtraKeys!4016 lt!481325 lt!481321 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2137 (Int (_ BitVec 64)) V!40457)

(assert (=> b!1085957 (= lt!481321 (array!69972 (store (arr!33653 _values!874) i!650 (ValueCellFull!12539 (dynLambda!2137 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34190 _values!874)))))

(assert (=> b!1085957 (= lt!481319 (getCurrentListMapNoExtraKeys!4016 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085957 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481328 () Unit!35669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69969 (_ BitVec 64) (_ BitVec 32)) Unit!35669)

(assert (=> b!1085957 (= lt!481328 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085958 () Bool)

(assert (=> b!1085958 (= e!620497 (= lt!481327 (+!3265 (+!3265 lt!481323 lt!481322) lt!481320)))))

(declare-fun b!1085959 () Bool)

(assert (=> b!1085959 (= e!620495 e!620493)))

(declare-fun res!723607 () Bool)

(assert (=> b!1085959 (=> (not res!723607) (not e!620493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69969 (_ BitVec 32)) Bool)

(assert (=> b!1085959 (= res!723607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481325 mask!1414))))

(assert (=> b!1085959 (= lt!481325 (array!69970 (store (arr!33652 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34189 _keys!1070)))))

(declare-fun b!1085960 () Bool)

(declare-fun res!723608 () Bool)

(assert (=> b!1085960 (=> (not res!723608) (not e!620497))))

(assert (=> b!1085960 (= res!723608 (= lt!481329 (+!3265 (+!3265 lt!481319 lt!481322) lt!481320)))))

(declare-fun mapIsEmpty!41500 () Bool)

(assert (=> mapIsEmpty!41500 mapRes!41500))

(declare-fun b!1085961 () Bool)

(declare-fun res!723618 () Bool)

(assert (=> b!1085961 (=> (not res!723618) (not e!620495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085961 (= res!723618 (validKeyInArray!0 k0!904))))

(declare-fun b!1085962 () Bool)

(declare-fun res!723617 () Bool)

(assert (=> b!1085962 (=> (not res!723617) (not e!620495))))

(assert (=> b!1085962 (= res!723617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085963 () Bool)

(declare-fun res!723616 () Bool)

(assert (=> b!1085963 (=> (not res!723616) (not e!620495))))

(assert (=> b!1085963 (= res!723616 (and (= (size!34190 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34189 _keys!1070) (size!34190 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085964 () Bool)

(declare-fun res!723611 () Bool)

(assert (=> b!1085964 (=> (not res!723611) (not e!620495))))

(assert (=> b!1085964 (= res!723611 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34189 _keys!1070))))))

(assert (= (and start!96078 res!723610) b!1085963))

(assert (= (and b!1085963 res!723616) b!1085962))

(assert (= (and b!1085962 res!723617) b!1085950))

(assert (= (and b!1085950 res!723614) b!1085964))

(assert (= (and b!1085964 res!723611) b!1085961))

(assert (= (and b!1085961 res!723618) b!1085953))

(assert (= (and b!1085953 res!723609) b!1085959))

(assert (= (and b!1085959 res!723607) b!1085954))

(assert (= (and b!1085954 res!723613) b!1085957))

(assert (= (and b!1085957 (not res!723615)) b!1085955))

(assert (= (and b!1085955 res!723612) b!1085960))

(assert (= (and b!1085960 res!723608) b!1085958))

(assert (= (and b!1085952 condMapEmpty!41500) mapIsEmpty!41500))

(assert (= (and b!1085952 (not condMapEmpty!41500)) mapNonEmpty!41500))

(get-info :version)

(assert (= (and mapNonEmpty!41500 ((_ is ValueCellFull!12539) mapValue!41500)) b!1085956))

(assert (= (and b!1085952 ((_ is ValueCellFull!12539) mapDefault!41500)) b!1085951))

(assert (= start!96078 b!1085952))

(declare-fun b_lambda!17175 () Bool)

(assert (=> (not b_lambda!17175) (not b!1085957)))

(declare-fun t!33012 () Bool)

(declare-fun tb!7365 () Bool)

(assert (=> (and start!96078 (= defaultEntry!882 defaultEntry!882) t!33012) tb!7365))

(declare-fun result!15257 () Bool)

(assert (=> tb!7365 (= result!15257 tp_is_empty!26497)))

(assert (=> b!1085957 t!33012))

(declare-fun b_and!35677 () Bool)

(assert (= b_and!35675 (and (=> t!33012 result!15257) b_and!35677)))

(declare-fun m!1004015 () Bool)

(assert (=> b!1085960 m!1004015))

(assert (=> b!1085960 m!1004015))

(declare-fun m!1004017 () Bool)

(assert (=> b!1085960 m!1004017))

(declare-fun m!1004019 () Bool)

(assert (=> b!1085954 m!1004019))

(declare-fun m!1004021 () Bool)

(assert (=> b!1085958 m!1004021))

(assert (=> b!1085958 m!1004021))

(declare-fun m!1004023 () Bool)

(assert (=> b!1085958 m!1004023))

(declare-fun m!1004025 () Bool)

(assert (=> b!1085953 m!1004025))

(declare-fun m!1004027 () Bool)

(assert (=> b!1085955 m!1004027))

(assert (=> b!1085955 m!1004027))

(declare-fun m!1004029 () Bool)

(assert (=> b!1085955 m!1004029))

(declare-fun m!1004031 () Bool)

(assert (=> b!1085959 m!1004031))

(declare-fun m!1004033 () Bool)

(assert (=> b!1085959 m!1004033))

(declare-fun m!1004035 () Bool)

(assert (=> b!1085962 m!1004035))

(declare-fun m!1004037 () Bool)

(assert (=> b!1085950 m!1004037))

(declare-fun m!1004039 () Bool)

(assert (=> b!1085961 m!1004039))

(declare-fun m!1004041 () Bool)

(assert (=> start!96078 m!1004041))

(declare-fun m!1004043 () Bool)

(assert (=> start!96078 m!1004043))

(declare-fun m!1004045 () Bool)

(assert (=> start!96078 m!1004045))

(declare-fun m!1004047 () Bool)

(assert (=> mapNonEmpty!41500 m!1004047))

(declare-fun m!1004049 () Bool)

(assert (=> b!1085957 m!1004049))

(declare-fun m!1004051 () Bool)

(assert (=> b!1085957 m!1004051))

(declare-fun m!1004053 () Bool)

(assert (=> b!1085957 m!1004053))

(declare-fun m!1004055 () Bool)

(assert (=> b!1085957 m!1004055))

(declare-fun m!1004057 () Bool)

(assert (=> b!1085957 m!1004057))

(declare-fun m!1004059 () Bool)

(assert (=> b!1085957 m!1004059))

(declare-fun m!1004061 () Bool)

(assert (=> b!1085957 m!1004061))

(declare-fun m!1004063 () Bool)

(assert (=> b!1085957 m!1004063))

(declare-fun m!1004065 () Bool)

(assert (=> b!1085957 m!1004065))

(declare-fun m!1004067 () Bool)

(assert (=> b!1085957 m!1004067))

(check-sat (not b!1085958) (not b!1085960) (not b_next!22495) (not b!1085959) b_and!35677 (not b!1085957) (not b!1085962) (not b!1085954) (not b!1085955) (not start!96078) (not mapNonEmpty!41500) (not b_lambda!17175) tp_is_empty!26497 (not b!1085961) (not b!1085950))
(check-sat b_and!35677 (not b_next!22495))
