; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96144 () Bool)

(assert start!96144)

(declare-fun b_free!22797 () Bool)

(declare-fun b_next!22797 () Bool)

(assert (=> start!96144 (= b_free!22797 (not b_next!22797))))

(declare-fun tp!80240 () Bool)

(declare-fun b_and!36269 () Bool)

(assert (=> start!96144 (= tp!80240 b_and!36269)))

(declare-fun mapNonEmpty!41953 () Bool)

(declare-fun mapRes!41953 () Bool)

(declare-fun tp!80239 () Bool)

(declare-fun e!623253 () Bool)

(assert (=> mapNonEmpty!41953 (= mapRes!41953 (and tp!80239 e!623253))))

(declare-datatypes ((V!40859 0))(
  ( (V!40860 (val!13456 Int)) )
))
(declare-datatypes ((ValueCell!12690 0))(
  ( (ValueCellFull!12690 (v!16077 V!40859)) (EmptyCell!12690) )
))
(declare-datatypes ((array!70517 0))(
  ( (array!70518 (arr!33932 (Array (_ BitVec 32) ValueCell!12690)) (size!34468 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70517)

(declare-fun mapValue!41953 () ValueCell!12690)

(declare-fun mapKey!41953 () (_ BitVec 32))

(declare-fun mapRest!41953 () (Array (_ BitVec 32) ValueCell!12690))

(assert (=> mapNonEmpty!41953 (= (arr!33932 _values!874) (store mapRest!41953 mapKey!41953 mapValue!41953))))

(declare-fun b!1091283 () Bool)

(declare-fun res!728091 () Bool)

(declare-fun e!623254 () Bool)

(assert (=> b!1091283 (=> (not res!728091) (not e!623254))))

(declare-datatypes ((array!70519 0))(
  ( (array!70520 (arr!33933 (Array (_ BitVec 32) (_ BitVec 64))) (size!34469 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70519)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091283 (= res!728091 (= (select (arr!33933 _keys!1070) i!650) k0!904))))

(declare-fun b!1091284 () Bool)

(declare-fun res!728090 () Bool)

(assert (=> b!1091284 (=> (not res!728090) (not e!623254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091284 (= res!728090 (validKeyInArray!0 k0!904))))

(declare-fun b!1091285 () Bool)

(declare-fun res!728094 () Bool)

(assert (=> b!1091285 (=> (not res!728094) (not e!623254))))

(declare-datatypes ((List!23698 0))(
  ( (Nil!23695) (Cons!23694 (h!24903 (_ BitVec 64)) (t!33553 List!23698)) )
))
(declare-fun arrayNoDuplicates!0 (array!70519 (_ BitVec 32) List!23698) Bool)

(assert (=> b!1091285 (= res!728094 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23695))))

(declare-fun b!1091286 () Bool)

(declare-fun e!623251 () Bool)

(assert (=> b!1091286 (= e!623251 true)))

(declare-datatypes ((tuple2!17114 0))(
  ( (tuple2!17115 (_1!8568 (_ BitVec 64)) (_2!8568 V!40859)) )
))
(declare-datatypes ((List!23699 0))(
  ( (Nil!23696) (Cons!23695 (h!24904 tuple2!17114) (t!33554 List!23699)) )
))
(declare-datatypes ((ListLongMap!15083 0))(
  ( (ListLongMap!15084 (toList!7557 List!23699)) )
))
(declare-fun lt!487290 () ListLongMap!15083)

(declare-fun lt!487286 () ListLongMap!15083)

(declare-fun -!878 (ListLongMap!15083 (_ BitVec 64)) ListLongMap!15083)

(assert (=> b!1091286 (= (-!878 lt!487290 k0!904) lt!487286)))

(declare-fun minValue!831 () V!40859)

(declare-fun lt!487289 () ListLongMap!15083)

(declare-datatypes ((Unit!35922 0))(
  ( (Unit!35923) )
))
(declare-fun lt!487285 () Unit!35922)

(declare-fun addRemoveCommutativeForDiffKeys!100 (ListLongMap!15083 (_ BitVec 64) V!40859 (_ BitVec 64)) Unit!35922)

(assert (=> b!1091286 (= lt!487285 (addRemoveCommutativeForDiffKeys!100 lt!487289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091287 () Bool)

(declare-fun e!623257 () Bool)

(assert (=> b!1091287 (= e!623254 e!623257)))

(declare-fun res!728086 () Bool)

(assert (=> b!1091287 (=> (not res!728086) (not e!623257))))

(declare-fun lt!487292 () array!70519)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70519 (_ BitVec 32)) Bool)

(assert (=> b!1091287 (= res!728086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487292 mask!1414))))

(assert (=> b!1091287 (= lt!487292 (array!70520 (store (arr!33933 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34469 _keys!1070)))))

(declare-fun b!1091288 () Bool)

(declare-fun res!728093 () Bool)

(assert (=> b!1091288 (=> (not res!728093) (not e!623254))))

(assert (=> b!1091288 (= res!728093 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34469 _keys!1070))))))

(declare-fun res!728087 () Bool)

(assert (=> start!96144 (=> (not res!728087) (not e!623254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96144 (= res!728087 (validMask!0 mask!1414))))

(assert (=> start!96144 e!623254))

(assert (=> start!96144 tp!80240))

(assert (=> start!96144 true))

(declare-fun tp_is_empty!26799 () Bool)

(assert (=> start!96144 tp_is_empty!26799))

(declare-fun array_inv!26164 (array!70519) Bool)

(assert (=> start!96144 (array_inv!26164 _keys!1070)))

(declare-fun e!623258 () Bool)

(declare-fun array_inv!26165 (array!70517) Bool)

(assert (=> start!96144 (and (array_inv!26165 _values!874) e!623258)))

(declare-fun b!1091289 () Bool)

(declare-fun res!728084 () Bool)

(assert (=> b!1091289 (=> (not res!728084) (not e!623257))))

(assert (=> b!1091289 (= res!728084 (arrayNoDuplicates!0 lt!487292 #b00000000000000000000000000000000 Nil!23695))))

(declare-fun b!1091290 () Bool)

(declare-fun e!623255 () Bool)

(assert (=> b!1091290 (= e!623257 (not e!623255))))

(declare-fun res!728089 () Bool)

(assert (=> b!1091290 (=> res!728089 e!623255)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091290 (= res!728089 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!487291 () ListLongMap!15083)

(declare-fun zeroValue!831 () V!40859)

(declare-fun getCurrentListMap!4318 (array!70519 array!70517 (_ BitVec 32) (_ BitVec 32) V!40859 V!40859 (_ BitVec 32) Int) ListLongMap!15083)

(assert (=> b!1091290 (= lt!487291 (getCurrentListMap!4318 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487293 () ListLongMap!15083)

(declare-fun lt!487282 () array!70517)

(assert (=> b!1091290 (= lt!487293 (getCurrentListMap!4318 lt!487292 lt!487282 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487284 () ListLongMap!15083)

(declare-fun lt!487287 () ListLongMap!15083)

(assert (=> b!1091290 (and (= lt!487284 lt!487287) (= lt!487287 lt!487284))))

(assert (=> b!1091290 (= lt!487287 (-!878 lt!487289 k0!904))))

(declare-fun lt!487288 () Unit!35922)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!137 (array!70519 array!70517 (_ BitVec 32) (_ BitVec 32) V!40859 V!40859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35922)

(assert (=> b!1091290 (= lt!487288 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!137 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4078 (array!70519 array!70517 (_ BitVec 32) (_ BitVec 32) V!40859 V!40859 (_ BitVec 32) Int) ListLongMap!15083)

(assert (=> b!1091290 (= lt!487284 (getCurrentListMapNoExtraKeys!4078 lt!487292 lt!487282 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2215 (Int (_ BitVec 64)) V!40859)

(assert (=> b!1091290 (= lt!487282 (array!70518 (store (arr!33932 _values!874) i!650 (ValueCellFull!12690 (dynLambda!2215 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34468 _values!874)))))

(assert (=> b!1091290 (= lt!487289 (getCurrentListMapNoExtraKeys!4078 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091290 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487294 () Unit!35922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70519 (_ BitVec 64) (_ BitVec 32)) Unit!35922)

(assert (=> b!1091290 (= lt!487294 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41953 () Bool)

(assert (=> mapIsEmpty!41953 mapRes!41953))

(declare-fun b!1091291 () Bool)

(declare-fun res!728088 () Bool)

(assert (=> b!1091291 (=> (not res!728088) (not e!623254))))

(assert (=> b!1091291 (= res!728088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091292 () Bool)

(declare-fun e!623252 () Bool)

(assert (=> b!1091292 (= e!623258 (and e!623252 mapRes!41953))))

(declare-fun condMapEmpty!41953 () Bool)

(declare-fun mapDefault!41953 () ValueCell!12690)

(assert (=> b!1091292 (= condMapEmpty!41953 (= (arr!33932 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12690)) mapDefault!41953)))))

(declare-fun b!1091293 () Bool)

(assert (=> b!1091293 (= e!623252 tp_is_empty!26799)))

(declare-fun b!1091294 () Bool)

(assert (=> b!1091294 (= e!623253 tp_is_empty!26799)))

(declare-fun b!1091295 () Bool)

(declare-fun res!728092 () Bool)

(assert (=> b!1091295 (=> (not res!728092) (not e!623254))))

(assert (=> b!1091295 (= res!728092 (and (= (size!34468 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34469 _keys!1070) (size!34468 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091296 () Bool)

(assert (=> b!1091296 (= e!623255 e!623251)))

(declare-fun res!728085 () Bool)

(assert (=> b!1091296 (=> res!728085 e!623251)))

(assert (=> b!1091296 (= res!728085 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091296 (= lt!487291 lt!487290)))

(declare-fun lt!487283 () tuple2!17114)

(declare-fun +!3342 (ListLongMap!15083 tuple2!17114) ListLongMap!15083)

(assert (=> b!1091296 (= lt!487290 (+!3342 lt!487289 lt!487283))))

(assert (=> b!1091296 (= lt!487293 lt!487286)))

(assert (=> b!1091296 (= lt!487286 (+!3342 lt!487287 lt!487283))))

(assert (=> b!1091296 (= lt!487293 (+!3342 lt!487284 lt!487283))))

(assert (=> b!1091296 (= lt!487283 (tuple2!17115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (= (and start!96144 res!728087) b!1091295))

(assert (= (and b!1091295 res!728092) b!1091291))

(assert (= (and b!1091291 res!728088) b!1091285))

(assert (= (and b!1091285 res!728094) b!1091288))

(assert (= (and b!1091288 res!728093) b!1091284))

(assert (= (and b!1091284 res!728090) b!1091283))

(assert (= (and b!1091283 res!728091) b!1091287))

(assert (= (and b!1091287 res!728086) b!1091289))

(assert (= (and b!1091289 res!728084) b!1091290))

(assert (= (and b!1091290 (not res!728089)) b!1091296))

(assert (= (and b!1091296 (not res!728085)) b!1091286))

(assert (= (and b!1091292 condMapEmpty!41953) mapIsEmpty!41953))

(assert (= (and b!1091292 (not condMapEmpty!41953)) mapNonEmpty!41953))

(get-info :version)

(assert (= (and mapNonEmpty!41953 ((_ is ValueCellFull!12690) mapValue!41953)) b!1091294))

(assert (= (and b!1091292 ((_ is ValueCellFull!12690) mapDefault!41953)) b!1091293))

(assert (= start!96144 b!1091292))

(declare-fun b_lambda!17467 () Bool)

(assert (=> (not b_lambda!17467) (not b!1091290)))

(declare-fun t!33552 () Bool)

(declare-fun tb!7675 () Bool)

(assert (=> (and start!96144 (= defaultEntry!882 defaultEntry!882) t!33552) tb!7675))

(declare-fun result!15869 () Bool)

(assert (=> tb!7675 (= result!15869 tp_is_empty!26799)))

(assert (=> b!1091290 t!33552))

(declare-fun b_and!36271 () Bool)

(assert (= b_and!36269 (and (=> t!33552 result!15869) b_and!36271)))

(declare-fun m!1010843 () Bool)

(assert (=> b!1091287 m!1010843))

(declare-fun m!1010845 () Bool)

(assert (=> b!1091287 m!1010845))

(declare-fun m!1010847 () Bool)

(assert (=> b!1091285 m!1010847))

(declare-fun m!1010849 () Bool)

(assert (=> b!1091289 m!1010849))

(declare-fun m!1010851 () Bool)

(assert (=> mapNonEmpty!41953 m!1010851))

(declare-fun m!1010853 () Bool)

(assert (=> b!1091296 m!1010853))

(declare-fun m!1010855 () Bool)

(assert (=> b!1091296 m!1010855))

(declare-fun m!1010857 () Bool)

(assert (=> b!1091296 m!1010857))

(declare-fun m!1010859 () Bool)

(assert (=> b!1091286 m!1010859))

(declare-fun m!1010861 () Bool)

(assert (=> b!1091286 m!1010861))

(declare-fun m!1010863 () Bool)

(assert (=> b!1091290 m!1010863))

(declare-fun m!1010865 () Bool)

(assert (=> b!1091290 m!1010865))

(declare-fun m!1010867 () Bool)

(assert (=> b!1091290 m!1010867))

(declare-fun m!1010869 () Bool)

(assert (=> b!1091290 m!1010869))

(declare-fun m!1010871 () Bool)

(assert (=> b!1091290 m!1010871))

(declare-fun m!1010873 () Bool)

(assert (=> b!1091290 m!1010873))

(declare-fun m!1010875 () Bool)

(assert (=> b!1091290 m!1010875))

(declare-fun m!1010877 () Bool)

(assert (=> b!1091290 m!1010877))

(declare-fun m!1010879 () Bool)

(assert (=> b!1091290 m!1010879))

(declare-fun m!1010881 () Bool)

(assert (=> b!1091290 m!1010881))

(declare-fun m!1010883 () Bool)

(assert (=> start!96144 m!1010883))

(declare-fun m!1010885 () Bool)

(assert (=> start!96144 m!1010885))

(declare-fun m!1010887 () Bool)

(assert (=> start!96144 m!1010887))

(declare-fun m!1010889 () Bool)

(assert (=> b!1091283 m!1010889))

(declare-fun m!1010891 () Bool)

(assert (=> b!1091291 m!1010891))

(declare-fun m!1010893 () Bool)

(assert (=> b!1091284 m!1010893))

(check-sat (not b!1091291) (not b!1091289) (not b_next!22797) (not b!1091296) tp_is_empty!26799 (not b!1091286) b_and!36271 (not b_lambda!17467) (not b!1091284) (not b!1091287) (not mapNonEmpty!41953) (not b!1091285) (not b!1091290) (not start!96144))
(check-sat b_and!36271 (not b_next!22797))
