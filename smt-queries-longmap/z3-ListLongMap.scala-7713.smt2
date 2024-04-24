; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97146 () Bool)

(assert start!97146)

(declare-fun b_free!23203 () Bool)

(declare-fun b_next!23203 () Bool)

(assert (=> start!97146 (= b_free!23203 (not b_next!23203))))

(declare-fun tp!81568 () Bool)

(declare-fun b_and!37233 () Bool)

(assert (=> start!97146 (= tp!81568 b_and!37233)))

(declare-fun b!1103832 () Bool)

(declare-fun e!630147 () Bool)

(declare-fun e!630148 () Bool)

(declare-fun mapRes!42673 () Bool)

(assert (=> b!1103832 (= e!630147 (and e!630148 mapRes!42673))))

(declare-fun condMapEmpty!42673 () Bool)

(declare-datatypes ((V!41465 0))(
  ( (V!41466 (val!13683 Int)) )
))
(declare-datatypes ((ValueCell!12917 0))(
  ( (ValueCellFull!12917 (v!16310 V!41465)) (EmptyCell!12917) )
))
(declare-datatypes ((array!71465 0))(
  ( (array!71466 (arr!34387 (Array (_ BitVec 32) ValueCell!12917)) (size!34924 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71465)

(declare-fun mapDefault!42673 () ValueCell!12917)

(assert (=> b!1103832 (= condMapEmpty!42673 (= (arr!34387 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12917)) mapDefault!42673)))))

(declare-fun b!1103833 () Bool)

(declare-fun res!736139 () Bool)

(declare-fun e!630145 () Bool)

(assert (=> b!1103833 (=> (not res!736139) (not e!630145))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71467 0))(
  ( (array!71468 (arr!34388 (Array (_ BitVec 32) (_ BitVec 64))) (size!34925 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71467)

(assert (=> b!1103833 (= res!736139 (and (= (size!34924 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34925 _keys!1070) (size!34924 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1103834 () Bool)

(declare-fun res!736137 () Bool)

(assert (=> b!1103834 (=> (not res!736137) (not e!630145))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103834 (= res!736137 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42673 () Bool)

(assert (=> mapIsEmpty!42673 mapRes!42673))

(declare-fun b!1103835 () Bool)

(declare-fun e!630144 () Bool)

(assert (=> b!1103835 (= e!630144 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41465)

(declare-datatypes ((tuple2!17422 0))(
  ( (tuple2!17423 (_1!8722 (_ BitVec 64)) (_2!8722 V!41465)) )
))
(declare-datatypes ((List!24042 0))(
  ( (Nil!24039) (Cons!24038 (h!25256 tuple2!17422) (t!34283 List!24042)) )
))
(declare-datatypes ((ListLongMap!15399 0))(
  ( (ListLongMap!15400 (toList!7715 List!24042)) )
))
(declare-fun lt!495181 () ListLongMap!15399)

(declare-fun zeroValue!831 () V!41465)

(declare-fun getCurrentListMap!4414 (array!71467 array!71465 (_ BitVec 32) (_ BitVec 32) V!41465 V!41465 (_ BitVec 32) Int) ListLongMap!15399)

(assert (=> b!1103835 (= lt!495181 (getCurrentListMap!4414 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495177 () array!71467)

(declare-fun lt!495183 () array!71465)

(declare-fun lt!495179 () ListLongMap!15399)

(assert (=> b!1103835 (= lt!495179 (getCurrentListMap!4414 lt!495177 lt!495183 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495180 () ListLongMap!15399)

(declare-fun lt!495178 () ListLongMap!15399)

(assert (=> b!1103835 (and (= lt!495180 lt!495178) (= lt!495178 lt!495180))))

(declare-fun lt!495182 () ListLongMap!15399)

(declare-fun -!978 (ListLongMap!15399 (_ BitVec 64)) ListLongMap!15399)

(assert (=> b!1103835 (= lt!495178 (-!978 lt!495182 k0!904))))

(declare-datatypes ((Unit!36217 0))(
  ( (Unit!36218) )
))
(declare-fun lt!495184 () Unit!36217)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!248 (array!71467 array!71465 (_ BitVec 32) (_ BitVec 32) V!41465 V!41465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36217)

(assert (=> b!1103835 (= lt!495184 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!248 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4255 (array!71467 array!71465 (_ BitVec 32) (_ BitVec 32) V!41465 V!41465 (_ BitVec 32) Int) ListLongMap!15399)

(assert (=> b!1103835 (= lt!495180 (getCurrentListMapNoExtraKeys!4255 lt!495177 lt!495183 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2373 (Int (_ BitVec 64)) V!41465)

(assert (=> b!1103835 (= lt!495183 (array!71466 (store (arr!34387 _values!874) i!650 (ValueCellFull!12917 (dynLambda!2373 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34924 _values!874)))))

(assert (=> b!1103835 (= lt!495182 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103835 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!495185 () Unit!36217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71467 (_ BitVec 64) (_ BitVec 32)) Unit!36217)

(assert (=> b!1103835 (= lt!495185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1103836 () Bool)

(assert (=> b!1103836 (= e!630145 e!630144)))

(declare-fun res!736136 () Bool)

(assert (=> b!1103836 (=> (not res!736136) (not e!630144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71467 (_ BitVec 32)) Bool)

(assert (=> b!1103836 (= res!736136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495177 mask!1414))))

(assert (=> b!1103836 (= lt!495177 (array!71468 (store (arr!34388 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34925 _keys!1070)))))

(declare-fun b!1103837 () Bool)

(declare-fun res!736138 () Bool)

(assert (=> b!1103837 (=> (not res!736138) (not e!630144))))

(declare-datatypes ((List!24043 0))(
  ( (Nil!24040) (Cons!24039 (h!25257 (_ BitVec 64)) (t!34284 List!24043)) )
))
(declare-fun arrayNoDuplicates!0 (array!71467 (_ BitVec 32) List!24043) Bool)

(assert (=> b!1103837 (= res!736138 (arrayNoDuplicates!0 lt!495177 #b00000000000000000000000000000000 Nil!24040))))

(declare-fun b!1103839 () Bool)

(declare-fun res!736135 () Bool)

(assert (=> b!1103839 (=> (not res!736135) (not e!630145))))

(assert (=> b!1103839 (= res!736135 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34925 _keys!1070))))))

(declare-fun b!1103840 () Bool)

(declare-fun res!736133 () Bool)

(assert (=> b!1103840 (=> (not res!736133) (not e!630145))))

(assert (=> b!1103840 (= res!736133 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24040))))

(declare-fun b!1103841 () Bool)

(declare-fun tp_is_empty!27253 () Bool)

(assert (=> b!1103841 (= e!630148 tp_is_empty!27253)))

(declare-fun b!1103842 () Bool)

(declare-fun e!630143 () Bool)

(assert (=> b!1103842 (= e!630143 tp_is_empty!27253)))

(declare-fun b!1103838 () Bool)

(declare-fun res!736134 () Bool)

(assert (=> b!1103838 (=> (not res!736134) (not e!630145))))

(assert (=> b!1103838 (= res!736134 (= (select (arr!34388 _keys!1070) i!650) k0!904))))

(declare-fun res!736141 () Bool)

(assert (=> start!97146 (=> (not res!736141) (not e!630145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97146 (= res!736141 (validMask!0 mask!1414))))

(assert (=> start!97146 e!630145))

(assert (=> start!97146 tp!81568))

(assert (=> start!97146 true))

(assert (=> start!97146 tp_is_empty!27253))

(declare-fun array_inv!26510 (array!71467) Bool)

(assert (=> start!97146 (array_inv!26510 _keys!1070)))

(declare-fun array_inv!26511 (array!71465) Bool)

(assert (=> start!97146 (and (array_inv!26511 _values!874) e!630147)))

(declare-fun mapNonEmpty!42673 () Bool)

(declare-fun tp!81569 () Bool)

(assert (=> mapNonEmpty!42673 (= mapRes!42673 (and tp!81569 e!630143))))

(declare-fun mapValue!42673 () ValueCell!12917)

(declare-fun mapRest!42673 () (Array (_ BitVec 32) ValueCell!12917))

(declare-fun mapKey!42673 () (_ BitVec 32))

(assert (=> mapNonEmpty!42673 (= (arr!34387 _values!874) (store mapRest!42673 mapKey!42673 mapValue!42673))))

(declare-fun b!1103843 () Bool)

(declare-fun res!736140 () Bool)

(assert (=> b!1103843 (=> (not res!736140) (not e!630145))))

(assert (=> b!1103843 (= res!736140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!97146 res!736141) b!1103833))

(assert (= (and b!1103833 res!736139) b!1103843))

(assert (= (and b!1103843 res!736140) b!1103840))

(assert (= (and b!1103840 res!736133) b!1103839))

(assert (= (and b!1103839 res!736135) b!1103834))

(assert (= (and b!1103834 res!736137) b!1103838))

(assert (= (and b!1103838 res!736134) b!1103836))

(assert (= (and b!1103836 res!736136) b!1103837))

(assert (= (and b!1103837 res!736138) b!1103835))

(assert (= (and b!1103832 condMapEmpty!42673) mapIsEmpty!42673))

(assert (= (and b!1103832 (not condMapEmpty!42673)) mapNonEmpty!42673))

(get-info :version)

(assert (= (and mapNonEmpty!42673 ((_ is ValueCellFull!12917) mapValue!42673)) b!1103842))

(assert (= (and b!1103832 ((_ is ValueCellFull!12917) mapDefault!42673)) b!1103841))

(assert (= start!97146 b!1103832))

(declare-fun b_lambda!18201 () Bool)

(assert (=> (not b_lambda!18201) (not b!1103835)))

(declare-fun t!34282 () Bool)

(declare-fun tb!8061 () Bool)

(assert (=> (and start!97146 (= defaultEntry!882 defaultEntry!882) t!34282) tb!8061))

(declare-fun result!16675 () Bool)

(assert (=> tb!8061 (= result!16675 tp_is_empty!27253)))

(assert (=> b!1103835 t!34282))

(declare-fun b_and!37235 () Bool)

(assert (= b_and!37233 (and (=> t!34282 result!16675) b_and!37235)))

(declare-fun m!1024477 () Bool)

(assert (=> b!1103836 m!1024477))

(declare-fun m!1024479 () Bool)

(assert (=> b!1103836 m!1024479))

(declare-fun m!1024481 () Bool)

(assert (=> start!97146 m!1024481))

(declare-fun m!1024483 () Bool)

(assert (=> start!97146 m!1024483))

(declare-fun m!1024485 () Bool)

(assert (=> start!97146 m!1024485))

(declare-fun m!1024487 () Bool)

(assert (=> b!1103834 m!1024487))

(declare-fun m!1024489 () Bool)

(assert (=> b!1103843 m!1024489))

(declare-fun m!1024491 () Bool)

(assert (=> b!1103840 m!1024491))

(declare-fun m!1024493 () Bool)

(assert (=> mapNonEmpty!42673 m!1024493))

(declare-fun m!1024495 () Bool)

(assert (=> b!1103837 m!1024495))

(declare-fun m!1024497 () Bool)

(assert (=> b!1103835 m!1024497))

(declare-fun m!1024499 () Bool)

(assert (=> b!1103835 m!1024499))

(declare-fun m!1024501 () Bool)

(assert (=> b!1103835 m!1024501))

(declare-fun m!1024503 () Bool)

(assert (=> b!1103835 m!1024503))

(declare-fun m!1024505 () Bool)

(assert (=> b!1103835 m!1024505))

(declare-fun m!1024507 () Bool)

(assert (=> b!1103835 m!1024507))

(declare-fun m!1024509 () Bool)

(assert (=> b!1103835 m!1024509))

(declare-fun m!1024511 () Bool)

(assert (=> b!1103835 m!1024511))

(declare-fun m!1024513 () Bool)

(assert (=> b!1103835 m!1024513))

(declare-fun m!1024515 () Bool)

(assert (=> b!1103835 m!1024515))

(declare-fun m!1024517 () Bool)

(assert (=> b!1103838 m!1024517))

(check-sat tp_is_empty!27253 b_and!37235 (not b_lambda!18201) (not b_next!23203) (not b!1103835) (not b!1103840) (not b!1103836) (not mapNonEmpty!42673) (not b!1103837) (not start!97146) (not b!1103843) (not b!1103834))
(check-sat b_and!37235 (not b_next!23203))
