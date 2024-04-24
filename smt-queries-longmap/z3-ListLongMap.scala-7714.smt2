; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97152 () Bool)

(assert start!97152)

(declare-fun b_free!23209 () Bool)

(declare-fun b_next!23209 () Bool)

(assert (=> start!97152 (= b_free!23209 (not b_next!23209))))

(declare-fun tp!81587 () Bool)

(declare-fun b_and!37245 () Bool)

(assert (=> start!97152 (= tp!81587 b_and!37245)))

(declare-fun b!1103946 () Bool)

(declare-fun res!736214 () Bool)

(declare-fun e!630199 () Bool)

(assert (=> b!1103946 (=> (not res!736214) (not e!630199))))

(declare-datatypes ((array!71475 0))(
  ( (array!71476 (arr!34392 (Array (_ BitVec 32) (_ BitVec 64))) (size!34929 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71475)

(declare-datatypes ((List!24046 0))(
  ( (Nil!24043) (Cons!24042 (h!25260 (_ BitVec 64)) (t!34293 List!24046)) )
))
(declare-fun arrayNoDuplicates!0 (array!71475 (_ BitVec 32) List!24046) Bool)

(assert (=> b!1103946 (= res!736214 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24043))))

(declare-fun mapIsEmpty!42682 () Bool)

(declare-fun mapRes!42682 () Bool)

(assert (=> mapIsEmpty!42682 mapRes!42682))

(declare-fun b!1103947 () Bool)

(declare-fun res!736219 () Bool)

(assert (=> b!1103947 (=> (not res!736219) (not e!630199))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1103947 (= res!736219 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34929 _keys!1070))))))

(declare-fun b!1103948 () Bool)

(declare-fun res!736218 () Bool)

(declare-fun e!630198 () Bool)

(assert (=> b!1103948 (=> (not res!736218) (not e!630198))))

(declare-fun lt!495261 () array!71475)

(assert (=> b!1103948 (= res!736218 (arrayNoDuplicates!0 lt!495261 #b00000000000000000000000000000000 Nil!24043))))

(declare-fun b!1103949 () Bool)

(declare-fun res!736222 () Bool)

(assert (=> b!1103949 (=> (not res!736222) (not e!630199))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1103949 (= res!736222 (= (select (arr!34392 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42682 () Bool)

(declare-fun tp!81586 () Bool)

(declare-fun e!630200 () Bool)

(assert (=> mapNonEmpty!42682 (= mapRes!42682 (and tp!81586 e!630200))))

(declare-datatypes ((V!41473 0))(
  ( (V!41474 (val!13686 Int)) )
))
(declare-datatypes ((ValueCell!12920 0))(
  ( (ValueCellFull!12920 (v!16313 V!41473)) (EmptyCell!12920) )
))
(declare-fun mapValue!42682 () ValueCell!12920)

(declare-datatypes ((array!71477 0))(
  ( (array!71478 (arr!34393 (Array (_ BitVec 32) ValueCell!12920)) (size!34930 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71477)

(declare-fun mapRest!42682 () (Array (_ BitVec 32) ValueCell!12920))

(declare-fun mapKey!42682 () (_ BitVec 32))

(assert (=> mapNonEmpty!42682 (= (arr!34393 _values!874) (store mapRest!42682 mapKey!42682 mapValue!42682))))

(declare-fun res!736217 () Bool)

(assert (=> start!97152 (=> (not res!736217) (not e!630199))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97152 (= res!736217 (validMask!0 mask!1414))))

(assert (=> start!97152 e!630199))

(assert (=> start!97152 tp!81587))

(assert (=> start!97152 true))

(declare-fun tp_is_empty!27259 () Bool)

(assert (=> start!97152 tp_is_empty!27259))

(declare-fun array_inv!26514 (array!71475) Bool)

(assert (=> start!97152 (array_inv!26514 _keys!1070)))

(declare-fun e!630202 () Bool)

(declare-fun array_inv!26515 (array!71477) Bool)

(assert (=> start!97152 (and (array_inv!26515 _values!874) e!630202)))

(declare-fun b!1103950 () Bool)

(declare-fun res!736220 () Bool)

(assert (=> b!1103950 (=> (not res!736220) (not e!630199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103950 (= res!736220 (validKeyInArray!0 k0!904))))

(declare-fun b!1103951 () Bool)

(assert (=> b!1103951 (= e!630200 tp_is_empty!27259)))

(declare-fun b!1103952 () Bool)

(assert (=> b!1103952 (= e!630199 e!630198)))

(declare-fun res!736215 () Bool)

(assert (=> b!1103952 (=> (not res!736215) (not e!630198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71475 (_ BitVec 32)) Bool)

(assert (=> b!1103952 (= res!736215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495261 mask!1414))))

(assert (=> b!1103952 (= lt!495261 (array!71476 (store (arr!34392 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34929 _keys!1070)))))

(declare-fun b!1103953 () Bool)

(declare-fun e!630201 () Bool)

(assert (=> b!1103953 (= e!630201 tp_is_empty!27259)))

(declare-fun b!1103954 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17426 0))(
  ( (tuple2!17427 (_1!8724 (_ BitVec 64)) (_2!8724 V!41473)) )
))
(declare-datatypes ((List!24047 0))(
  ( (Nil!24044) (Cons!24043 (h!25261 tuple2!17426) (t!34294 List!24047)) )
))
(declare-datatypes ((ListLongMap!15403 0))(
  ( (ListLongMap!15404 (toList!7717 List!24047)) )
))
(declare-fun lt!495262 () ListLongMap!15403)

(declare-fun lt!495266 () Bool)

(declare-fun lt!495267 () ListLongMap!15403)

(assert (=> b!1103954 (= e!630198 (not (or (and (not lt!495266) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!495266) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!495266) (not (= lt!495262 lt!495267)) (bvslt i!650 (size!34930 _values!874)))))))

(assert (=> b!1103954 (= lt!495266 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun minValue!831 () V!41473)

(declare-fun zeroValue!831 () V!41473)

(declare-fun lt!495263 () ListLongMap!15403)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4416 (array!71475 array!71477 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) Int) ListLongMap!15403)

(assert (=> b!1103954 (= lt!495263 (getCurrentListMap!4416 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495269 () array!71477)

(assert (=> b!1103954 (= lt!495262 (getCurrentListMap!4416 lt!495261 lt!495269 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495260 () ListLongMap!15403)

(assert (=> b!1103954 (and (= lt!495267 lt!495260) (= lt!495260 lt!495267))))

(declare-fun lt!495265 () ListLongMap!15403)

(declare-fun -!980 (ListLongMap!15403 (_ BitVec 64)) ListLongMap!15403)

(assert (=> b!1103954 (= lt!495260 (-!980 lt!495265 k0!904))))

(declare-datatypes ((Unit!36221 0))(
  ( (Unit!36222) )
))
(declare-fun lt!495264 () Unit!36221)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!250 (array!71475 array!71477 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36221)

(assert (=> b!1103954 (= lt!495264 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4257 (array!71475 array!71477 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) Int) ListLongMap!15403)

(assert (=> b!1103954 (= lt!495267 (getCurrentListMapNoExtraKeys!4257 lt!495261 lt!495269 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2375 (Int (_ BitVec 64)) V!41473)

(assert (=> b!1103954 (= lt!495269 (array!71478 (store (arr!34393 _values!874) i!650 (ValueCellFull!12920 (dynLambda!2375 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34930 _values!874)))))

(assert (=> b!1103954 (= lt!495265 (getCurrentListMapNoExtraKeys!4257 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103954 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!495268 () Unit!36221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71475 (_ BitVec 64) (_ BitVec 32)) Unit!36221)

(assert (=> b!1103954 (= lt!495268 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1103955 () Bool)

(declare-fun res!736216 () Bool)

(assert (=> b!1103955 (=> (not res!736216) (not e!630199))))

(assert (=> b!1103955 (= res!736216 (and (= (size!34930 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34929 _keys!1070) (size!34930 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1103956 () Bool)

(declare-fun res!736221 () Bool)

(assert (=> b!1103956 (=> (not res!736221) (not e!630199))))

(assert (=> b!1103956 (= res!736221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1103957 () Bool)

(assert (=> b!1103957 (= e!630202 (and e!630201 mapRes!42682))))

(declare-fun condMapEmpty!42682 () Bool)

(declare-fun mapDefault!42682 () ValueCell!12920)

(assert (=> b!1103957 (= condMapEmpty!42682 (= (arr!34393 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12920)) mapDefault!42682)))))

(assert (= (and start!97152 res!736217) b!1103955))

(assert (= (and b!1103955 res!736216) b!1103956))

(assert (= (and b!1103956 res!736221) b!1103946))

(assert (= (and b!1103946 res!736214) b!1103947))

(assert (= (and b!1103947 res!736219) b!1103950))

(assert (= (and b!1103950 res!736220) b!1103949))

(assert (= (and b!1103949 res!736222) b!1103952))

(assert (= (and b!1103952 res!736215) b!1103948))

(assert (= (and b!1103948 res!736218) b!1103954))

(assert (= (and b!1103957 condMapEmpty!42682) mapIsEmpty!42682))

(assert (= (and b!1103957 (not condMapEmpty!42682)) mapNonEmpty!42682))

(get-info :version)

(assert (= (and mapNonEmpty!42682 ((_ is ValueCellFull!12920) mapValue!42682)) b!1103951))

(assert (= (and b!1103957 ((_ is ValueCellFull!12920) mapDefault!42682)) b!1103953))

(assert (= start!97152 b!1103957))

(declare-fun b_lambda!18207 () Bool)

(assert (=> (not b_lambda!18207) (not b!1103954)))

(declare-fun t!34292 () Bool)

(declare-fun tb!8067 () Bool)

(assert (=> (and start!97152 (= defaultEntry!882 defaultEntry!882) t!34292) tb!8067))

(declare-fun result!16687 () Bool)

(assert (=> tb!8067 (= result!16687 tp_is_empty!27259)))

(assert (=> b!1103954 t!34292))

(declare-fun b_and!37247 () Bool)

(assert (= b_and!37245 (and (=> t!34292 result!16687) b_and!37247)))

(declare-fun m!1024603 () Bool)

(assert (=> start!97152 m!1024603))

(declare-fun m!1024605 () Bool)

(assert (=> start!97152 m!1024605))

(declare-fun m!1024607 () Bool)

(assert (=> start!97152 m!1024607))

(declare-fun m!1024609 () Bool)

(assert (=> b!1103946 m!1024609))

(declare-fun m!1024611 () Bool)

(assert (=> b!1103949 m!1024611))

(declare-fun m!1024613 () Bool)

(assert (=> b!1103954 m!1024613))

(declare-fun m!1024615 () Bool)

(assert (=> b!1103954 m!1024615))

(declare-fun m!1024617 () Bool)

(assert (=> b!1103954 m!1024617))

(declare-fun m!1024619 () Bool)

(assert (=> b!1103954 m!1024619))

(declare-fun m!1024621 () Bool)

(assert (=> b!1103954 m!1024621))

(declare-fun m!1024623 () Bool)

(assert (=> b!1103954 m!1024623))

(declare-fun m!1024625 () Bool)

(assert (=> b!1103954 m!1024625))

(declare-fun m!1024627 () Bool)

(assert (=> b!1103954 m!1024627))

(declare-fun m!1024629 () Bool)

(assert (=> b!1103954 m!1024629))

(declare-fun m!1024631 () Bool)

(assert (=> b!1103954 m!1024631))

(declare-fun m!1024633 () Bool)

(assert (=> b!1103948 m!1024633))

(declare-fun m!1024635 () Bool)

(assert (=> mapNonEmpty!42682 m!1024635))

(declare-fun m!1024637 () Bool)

(assert (=> b!1103956 m!1024637))

(declare-fun m!1024639 () Bool)

(assert (=> b!1103950 m!1024639))

(declare-fun m!1024641 () Bool)

(assert (=> b!1103952 m!1024641))

(declare-fun m!1024643 () Bool)

(assert (=> b!1103952 m!1024643))

(check-sat (not b_lambda!18207) (not mapNonEmpty!42682) tp_is_empty!27259 (not start!97152) (not b!1103952) (not b_next!23209) (not b!1103946) (not b!1103954) (not b!1103950) (not b!1103956) (not b!1103948) b_and!37247)
(check-sat b_and!37247 (not b_next!23209))
