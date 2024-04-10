; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96446 () Bool)

(assert start!96446)

(declare-fun b_free!23025 () Bool)

(declare-fun b_next!23025 () Bool)

(assert (=> start!96446 (= b_free!23025 (not b_next!23025))))

(declare-fun tp!81001 () Bool)

(declare-fun b_and!36713 () Bool)

(assert (=> start!96446 (= tp!81001 b_and!36713)))

(declare-fun b!1096560 () Bool)

(declare-fun e!625917 () Bool)

(declare-fun tp_is_empty!27075 () Bool)

(assert (=> b!1096560 (= e!625917 tp_is_empty!27075)))

(declare-fun b!1096561 () Bool)

(declare-fun res!731862 () Bool)

(declare-fun e!625921 () Bool)

(assert (=> b!1096561 (=> (not res!731862) (not e!625921))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096561 (= res!731862 (validKeyInArray!0 k0!904))))

(declare-fun b!1096562 () Bool)

(declare-fun e!625919 () Bool)

(assert (=> b!1096562 (= e!625921 e!625919)))

(declare-fun res!731859 () Bool)

(assert (=> b!1096562 (=> (not res!731859) (not e!625919))))

(declare-datatypes ((array!71063 0))(
  ( (array!71064 (arr!34203 (Array (_ BitVec 32) (_ BitVec 64))) (size!34739 (_ BitVec 32))) )
))
(declare-fun lt!490188 () array!71063)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71063 (_ BitVec 32)) Bool)

(assert (=> b!1096562 (= res!731859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490188 mask!1414))))

(declare-fun _keys!1070 () array!71063)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096562 (= lt!490188 (array!71064 (store (arr!34203 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34739 _keys!1070)))))

(declare-fun b!1096563 () Bool)

(assert (=> b!1096563 (= e!625919 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41227 0))(
  ( (V!41228 (val!13594 Int)) )
))
(declare-datatypes ((ValueCell!12828 0))(
  ( (ValueCellFull!12828 (v!16215 V!41227)) (EmptyCell!12828) )
))
(declare-datatypes ((array!71065 0))(
  ( (array!71066 (arr!34204 (Array (_ BitVec 32) ValueCell!12828)) (size!34740 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71065)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17266 0))(
  ( (tuple2!17267 (_1!8644 (_ BitVec 64)) (_2!8644 V!41227)) )
))
(declare-datatypes ((List!23886 0))(
  ( (Nil!23883) (Cons!23882 (h!25091 tuple2!17266) (t!33957 List!23886)) )
))
(declare-datatypes ((ListLongMap!15235 0))(
  ( (ListLongMap!15236 (toList!7633 List!23886)) )
))
(declare-fun lt!490187 () ListLongMap!15235)

(declare-fun zeroValue!831 () V!41227)

(declare-fun minValue!831 () V!41227)

(declare-fun getCurrentListMapNoExtraKeys!4149 (array!71063 array!71065 (_ BitVec 32) (_ BitVec 32) V!41227 V!41227 (_ BitVec 32) Int) ListLongMap!15235)

(declare-fun dynLambda!2284 (Int (_ BitVec 64)) V!41227)

(assert (=> b!1096563 (= lt!490187 (getCurrentListMapNoExtraKeys!4149 lt!490188 (array!71066 (store (arr!34204 _values!874) i!650 (ValueCellFull!12828 (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34740 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490186 () ListLongMap!15235)

(assert (=> b!1096563 (= lt!490186 (getCurrentListMapNoExtraKeys!4149 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096563 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36078 0))(
  ( (Unit!36079) )
))
(declare-fun lt!490189 () Unit!36078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71063 (_ BitVec 64) (_ BitVec 32)) Unit!36078)

(assert (=> b!1096563 (= lt!490189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096564 () Bool)

(declare-fun res!731857 () Bool)

(assert (=> b!1096564 (=> (not res!731857) (not e!625921))))

(declare-datatypes ((List!23887 0))(
  ( (Nil!23884) (Cons!23883 (h!25092 (_ BitVec 64)) (t!33958 List!23887)) )
))
(declare-fun arrayNoDuplicates!0 (array!71063 (_ BitVec 32) List!23887) Bool)

(assert (=> b!1096564 (= res!731857 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23884))))

(declare-fun res!731855 () Bool)

(assert (=> start!96446 (=> (not res!731855) (not e!625921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96446 (= res!731855 (validMask!0 mask!1414))))

(assert (=> start!96446 e!625921))

(assert (=> start!96446 tp!81001))

(assert (=> start!96446 true))

(assert (=> start!96446 tp_is_empty!27075))

(declare-fun array_inv!26352 (array!71063) Bool)

(assert (=> start!96446 (array_inv!26352 _keys!1070)))

(declare-fun e!625918 () Bool)

(declare-fun array_inv!26353 (array!71065) Bool)

(assert (=> start!96446 (and (array_inv!26353 _values!874) e!625918)))

(declare-fun b!1096565 () Bool)

(declare-fun res!731863 () Bool)

(assert (=> b!1096565 (=> (not res!731863) (not e!625921))))

(assert (=> b!1096565 (= res!731863 (= (select (arr!34203 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42373 () Bool)

(declare-fun mapRes!42373 () Bool)

(declare-fun tp!81002 () Bool)

(assert (=> mapNonEmpty!42373 (= mapRes!42373 (and tp!81002 e!625917))))

(declare-fun mapRest!42373 () (Array (_ BitVec 32) ValueCell!12828))

(declare-fun mapKey!42373 () (_ BitVec 32))

(declare-fun mapValue!42373 () ValueCell!12828)

(assert (=> mapNonEmpty!42373 (= (arr!34204 _values!874) (store mapRest!42373 mapKey!42373 mapValue!42373))))

(declare-fun b!1096566 () Bool)

(declare-fun res!731858 () Bool)

(assert (=> b!1096566 (=> (not res!731858) (not e!625921))))

(assert (=> b!1096566 (= res!731858 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34739 _keys!1070))))))

(declare-fun b!1096567 () Bool)

(declare-fun e!625916 () Bool)

(assert (=> b!1096567 (= e!625918 (and e!625916 mapRes!42373))))

(declare-fun condMapEmpty!42373 () Bool)

(declare-fun mapDefault!42373 () ValueCell!12828)

(assert (=> b!1096567 (= condMapEmpty!42373 (= (arr!34204 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12828)) mapDefault!42373)))))

(declare-fun b!1096568 () Bool)

(assert (=> b!1096568 (= e!625916 tp_is_empty!27075)))

(declare-fun b!1096569 () Bool)

(declare-fun res!731856 () Bool)

(assert (=> b!1096569 (=> (not res!731856) (not e!625921))))

(assert (=> b!1096569 (= res!731856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096570 () Bool)

(declare-fun res!731860 () Bool)

(assert (=> b!1096570 (=> (not res!731860) (not e!625921))))

(assert (=> b!1096570 (= res!731860 (and (= (size!34740 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34739 _keys!1070) (size!34740 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096571 () Bool)

(declare-fun res!731861 () Bool)

(assert (=> b!1096571 (=> (not res!731861) (not e!625919))))

(assert (=> b!1096571 (= res!731861 (arrayNoDuplicates!0 lt!490188 #b00000000000000000000000000000000 Nil!23884))))

(declare-fun mapIsEmpty!42373 () Bool)

(assert (=> mapIsEmpty!42373 mapRes!42373))

(assert (= (and start!96446 res!731855) b!1096570))

(assert (= (and b!1096570 res!731860) b!1096569))

(assert (= (and b!1096569 res!731856) b!1096564))

(assert (= (and b!1096564 res!731857) b!1096566))

(assert (= (and b!1096566 res!731858) b!1096561))

(assert (= (and b!1096561 res!731862) b!1096565))

(assert (= (and b!1096565 res!731863) b!1096562))

(assert (= (and b!1096562 res!731859) b!1096571))

(assert (= (and b!1096571 res!731861) b!1096563))

(assert (= (and b!1096567 condMapEmpty!42373) mapIsEmpty!42373))

(assert (= (and b!1096567 (not condMapEmpty!42373)) mapNonEmpty!42373))

(get-info :version)

(assert (= (and mapNonEmpty!42373 ((_ is ValueCellFull!12828) mapValue!42373)) b!1096560))

(assert (= (and b!1096567 ((_ is ValueCellFull!12828) mapDefault!42373)) b!1096568))

(assert (= start!96446 b!1096567))

(declare-fun b_lambda!17683 () Bool)

(assert (=> (not b_lambda!17683) (not b!1096563)))

(declare-fun t!33956 () Bool)

(declare-fun tb!7891 () Bool)

(assert (=> (and start!96446 (= defaultEntry!882 defaultEntry!882) t!33956) tb!7891))

(declare-fun result!16305 () Bool)

(assert (=> tb!7891 (= result!16305 tp_is_empty!27075)))

(assert (=> b!1096563 t!33956))

(declare-fun b_and!36715 () Bool)

(assert (= b_and!36713 (and (=> t!33956 result!16305) b_and!36715)))

(declare-fun m!1016079 () Bool)

(assert (=> b!1096561 m!1016079))

(declare-fun m!1016081 () Bool)

(assert (=> b!1096562 m!1016081))

(declare-fun m!1016083 () Bool)

(assert (=> b!1096562 m!1016083))

(declare-fun m!1016085 () Bool)

(assert (=> start!96446 m!1016085))

(declare-fun m!1016087 () Bool)

(assert (=> start!96446 m!1016087))

(declare-fun m!1016089 () Bool)

(assert (=> start!96446 m!1016089))

(declare-fun m!1016091 () Bool)

(assert (=> b!1096571 m!1016091))

(declare-fun m!1016093 () Bool)

(assert (=> mapNonEmpty!42373 m!1016093))

(declare-fun m!1016095 () Bool)

(assert (=> b!1096563 m!1016095))

(declare-fun m!1016097 () Bool)

(assert (=> b!1096563 m!1016097))

(declare-fun m!1016099 () Bool)

(assert (=> b!1096563 m!1016099))

(declare-fun m!1016101 () Bool)

(assert (=> b!1096563 m!1016101))

(declare-fun m!1016103 () Bool)

(assert (=> b!1096563 m!1016103))

(declare-fun m!1016105 () Bool)

(assert (=> b!1096563 m!1016105))

(declare-fun m!1016107 () Bool)

(assert (=> b!1096564 m!1016107))

(declare-fun m!1016109 () Bool)

(assert (=> b!1096569 m!1016109))

(declare-fun m!1016111 () Bool)

(assert (=> b!1096565 m!1016111))

(check-sat (not b_next!23025) (not b!1096561) (not b!1096569) (not b!1096562) (not b!1096571) (not b_lambda!17683) (not b!1096563) tp_is_empty!27075 (not start!96446) (not b!1096564) (not mapNonEmpty!42373) b_and!36715)
(check-sat b_and!36715 (not b_next!23025))
