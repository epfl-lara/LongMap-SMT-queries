; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95900 () Bool)

(assert start!95900)

(declare-fun b_free!22553 () Bool)

(declare-fun b_next!22553 () Bool)

(assert (=> start!95900 (= b_free!22553 (not b_next!22553))))

(declare-fun tp!79508 () Bool)

(declare-fun b_and!35781 () Bool)

(assert (=> start!95900 (= tp!79508 b_and!35781)))

(declare-fun b!1085897 () Bool)

(declare-fun res!724043 () Bool)

(declare-fun e!620327 () Bool)

(assert (=> b!1085897 (=> (not res!724043) (not e!620327))))

(declare-datatypes ((array!70045 0))(
  ( (array!70046 (arr!33696 (Array (_ BitVec 32) (_ BitVec 64))) (size!34232 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70045)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70045 (_ BitVec 32)) Bool)

(assert (=> b!1085897 (= res!724043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085898 () Bool)

(declare-fun res!724049 () Bool)

(assert (=> b!1085898 (=> (not res!724049) (not e!620327))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085898 (= res!724049 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34232 _keys!1070))))))

(declare-fun b!1085899 () Bool)

(declare-fun res!724041 () Bool)

(assert (=> b!1085899 (=> (not res!724041) (not e!620327))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40533 0))(
  ( (V!40534 (val!13334 Int)) )
))
(declare-datatypes ((ValueCell!12568 0))(
  ( (ValueCellFull!12568 (v!15955 V!40533)) (EmptyCell!12568) )
))
(declare-datatypes ((array!70047 0))(
  ( (array!70048 (arr!33697 (Array (_ BitVec 32) ValueCell!12568)) (size!34233 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70047)

(assert (=> b!1085899 (= res!724041 (and (= (size!34233 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34232 _keys!1070) (size!34233 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41587 () Bool)

(declare-fun mapRes!41587 () Bool)

(declare-fun tp!79507 () Bool)

(declare-fun e!620324 () Bool)

(assert (=> mapNonEmpty!41587 (= mapRes!41587 (and tp!79507 e!620324))))

(declare-fun mapValue!41587 () ValueCell!12568)

(declare-fun mapRest!41587 () (Array (_ BitVec 32) ValueCell!12568))

(declare-fun mapKey!41587 () (_ BitVec 32))

(assert (=> mapNonEmpty!41587 (= (arr!33697 _values!874) (store mapRest!41587 mapKey!41587 mapValue!41587))))

(declare-fun b!1085900 () Bool)

(declare-fun e!620323 () Bool)

(assert (=> b!1085900 (= e!620327 e!620323)))

(declare-fun res!724047 () Bool)

(assert (=> b!1085900 (=> (not res!724047) (not e!620323))))

(declare-fun lt!482219 () array!70045)

(assert (=> b!1085900 (= res!724047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482219 mask!1414))))

(assert (=> b!1085900 (= lt!482219 (array!70046 (store (arr!33696 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34232 _keys!1070)))))

(declare-fun b!1085901 () Bool)

(declare-fun tp_is_empty!26555 () Bool)

(assert (=> b!1085901 (= e!620324 tp_is_empty!26555)))

(declare-fun b!1085902 () Bool)

(declare-fun e!620330 () Bool)

(assert (=> b!1085902 (= e!620330 tp_is_empty!26555)))

(declare-fun b!1085903 () Bool)

(declare-fun e!620329 () Bool)

(assert (=> b!1085903 (= e!620323 (not e!620329))))

(declare-fun res!724045 () Bool)

(assert (=> b!1085903 (=> res!724045 e!620329)))

(assert (=> b!1085903 (= res!724045 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16910 0))(
  ( (tuple2!16911 (_1!8466 (_ BitVec 64)) (_2!8466 V!40533)) )
))
(declare-datatypes ((List!23499 0))(
  ( (Nil!23496) (Cons!23495 (h!24704 tuple2!16910) (t!33110 List!23499)) )
))
(declare-datatypes ((ListLongMap!14879 0))(
  ( (ListLongMap!14880 (toList!7455 List!23499)) )
))
(declare-fun lt!482217 () ListLongMap!14879)

(declare-fun minValue!831 () V!40533)

(declare-fun zeroValue!831 () V!40533)

(declare-fun getCurrentListMap!4238 (array!70045 array!70047 (_ BitVec 32) (_ BitVec 32) V!40533 V!40533 (_ BitVec 32) Int) ListLongMap!14879)

(assert (=> b!1085903 (= lt!482217 (getCurrentListMap!4238 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482220 () array!70047)

(declare-fun lt!482228 () ListLongMap!14879)

(assert (=> b!1085903 (= lt!482228 (getCurrentListMap!4238 lt!482219 lt!482220 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482214 () ListLongMap!14879)

(declare-fun lt!482218 () ListLongMap!14879)

(assert (=> b!1085903 (and (= lt!482214 lt!482218) (= lt!482218 lt!482214))))

(declare-fun lt!482223 () ListLongMap!14879)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!781 (ListLongMap!14879 (_ BitVec 64)) ListLongMap!14879)

(assert (=> b!1085903 (= lt!482218 (-!781 lt!482223 k!904))))

(declare-datatypes ((Unit!35728 0))(
  ( (Unit!35729) )
))
(declare-fun lt!482216 () Unit!35728)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!57 (array!70045 array!70047 (_ BitVec 32) (_ BitVec 32) V!40533 V!40533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35728)

(assert (=> b!1085903 (= lt!482216 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!57 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3998 (array!70045 array!70047 (_ BitVec 32) (_ BitVec 32) V!40533 V!40533 (_ BitVec 32) Int) ListLongMap!14879)

(assert (=> b!1085903 (= lt!482214 (getCurrentListMapNoExtraKeys!3998 lt!482219 lt!482220 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2135 (Int (_ BitVec 64)) V!40533)

(assert (=> b!1085903 (= lt!482220 (array!70048 (store (arr!33697 _values!874) i!650 (ValueCellFull!12568 (dynLambda!2135 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34233 _values!874)))))

(assert (=> b!1085903 (= lt!482223 (getCurrentListMapNoExtraKeys!3998 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085903 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!482224 () Unit!35728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70045 (_ BitVec 64) (_ BitVec 32)) Unit!35728)

(assert (=> b!1085903 (= lt!482224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1085904 () Bool)

(declare-fun res!724042 () Bool)

(assert (=> b!1085904 (=> (not res!724042) (not e!620327))))

(assert (=> b!1085904 (= res!724042 (= (select (arr!33696 _keys!1070) i!650) k!904))))

(declare-fun b!1085905 () Bool)

(declare-fun res!724050 () Bool)

(assert (=> b!1085905 (=> (not res!724050) (not e!620323))))

(declare-datatypes ((List!23500 0))(
  ( (Nil!23497) (Cons!23496 (h!24705 (_ BitVec 64)) (t!33111 List!23500)) )
))
(declare-fun arrayNoDuplicates!0 (array!70045 (_ BitVec 32) List!23500) Bool)

(assert (=> b!1085905 (= res!724050 (arrayNoDuplicates!0 lt!482219 #b00000000000000000000000000000000 Nil!23497))))

(declare-fun b!1085906 () Bool)

(declare-fun res!724044 () Bool)

(assert (=> b!1085906 (=> (not res!724044) (not e!620327))))

(assert (=> b!1085906 (= res!724044 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23497))))

(declare-fun res!724046 () Bool)

(assert (=> start!95900 (=> (not res!724046) (not e!620327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95900 (= res!724046 (validMask!0 mask!1414))))

(assert (=> start!95900 e!620327))

(assert (=> start!95900 tp!79508))

(assert (=> start!95900 true))

(assert (=> start!95900 tp_is_empty!26555))

(declare-fun array_inv!26004 (array!70045) Bool)

(assert (=> start!95900 (array_inv!26004 _keys!1070)))

(declare-fun e!620326 () Bool)

(declare-fun array_inv!26005 (array!70047) Bool)

(assert (=> start!95900 (and (array_inv!26005 _values!874) e!620326)))

(declare-fun b!1085907 () Bool)

(declare-fun e!620328 () Bool)

(assert (=> b!1085907 (= e!620328 true)))

(declare-fun lt!482230 () tuple2!16910)

(declare-fun lt!482227 () ListLongMap!14879)

(declare-fun lt!482226 () ListLongMap!14879)

(declare-fun +!3263 (ListLongMap!14879 tuple2!16910) ListLongMap!14879)

(assert (=> b!1085907 (= (-!781 lt!482227 k!904) (+!3263 lt!482226 lt!482230))))

(declare-fun lt!482221 () Unit!35728)

(declare-fun lt!482222 () ListLongMap!14879)

(declare-fun addRemoveCommutativeForDiffKeys!19 (ListLongMap!14879 (_ BitVec 64) V!40533 (_ BitVec 64)) Unit!35728)

(assert (=> b!1085907 (= lt!482221 (addRemoveCommutativeForDiffKeys!19 lt!482222 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1085908 () Bool)

(assert (=> b!1085908 (= e!620326 (and e!620330 mapRes!41587))))

(declare-fun condMapEmpty!41587 () Bool)

(declare-fun mapDefault!41587 () ValueCell!12568)

