; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96468 () Bool)

(assert start!96468)

(declare-fun b_free!23053 () Bool)

(declare-fun b_next!23053 () Bool)

(assert (=> start!96468 (= b_free!23053 (not b_next!23053))))

(declare-fun tp!81086 () Bool)

(declare-fun b_and!36743 () Bool)

(assert (=> start!96468 (= tp!81086 b_and!36743)))

(declare-fun res!732167 () Bool)

(declare-fun e!626076 () Bool)

(assert (=> start!96468 (=> (not res!732167) (not e!626076))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96468 (= res!732167 (validMask!0 mask!1414))))

(assert (=> start!96468 e!626076))

(assert (=> start!96468 tp!81086))

(assert (=> start!96468 true))

(declare-fun tp_is_empty!27103 () Bool)

(assert (=> start!96468 tp_is_empty!27103))

(declare-datatypes ((array!71026 0))(
  ( (array!71027 (arr!34185 (Array (_ BitVec 32) (_ BitVec 64))) (size!34723 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71026)

(declare-fun array_inv!26374 (array!71026) Bool)

(assert (=> start!96468 (array_inv!26374 _keys!1070)))

(declare-datatypes ((V!41265 0))(
  ( (V!41266 (val!13608 Int)) )
))
(declare-datatypes ((ValueCell!12842 0))(
  ( (ValueCellFull!12842 (v!16228 V!41265)) (EmptyCell!12842) )
))
(declare-datatypes ((array!71028 0))(
  ( (array!71029 (arr!34186 (Array (_ BitVec 32) ValueCell!12842)) (size!34724 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71028)

(declare-fun e!626077 () Bool)

(declare-fun array_inv!26375 (array!71028) Bool)

(assert (=> start!96468 (and (array_inv!26375 _values!874) e!626077)))

(declare-fun b!1096939 () Bool)

(declare-fun e!626080 () Bool)

(assert (=> b!1096939 (= e!626080 tp_is_empty!27103)))

(declare-fun b!1096940 () Bool)

(declare-fun res!732165 () Bool)

(assert (=> b!1096940 (=> (not res!732165) (not e!626076))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096940 (= res!732165 (= (select (arr!34185 _keys!1070) i!650) k0!904))))

(declare-fun b!1096941 () Bool)

(declare-fun e!626075 () Bool)

(assert (=> b!1096941 (= e!626075 (not true))))

(declare-datatypes ((tuple2!17346 0))(
  ( (tuple2!17347 (_1!8684 (_ BitVec 64)) (_2!8684 V!41265)) )
))
(declare-datatypes ((List!23939 0))(
  ( (Nil!23936) (Cons!23935 (h!25144 tuple2!17346) (t!34029 List!23939)) )
))
(declare-datatypes ((ListLongMap!15315 0))(
  ( (ListLongMap!15316 (toList!7673 List!23939)) )
))
(declare-fun lt!490177 () ListLongMap!15315)

(declare-fun lt!490180 () ListLongMap!15315)

(assert (=> b!1096941 (and (= lt!490177 lt!490180) (= lt!490180 lt!490177))))

(declare-fun lt!490179 () ListLongMap!15315)

(declare-fun -!913 (ListLongMap!15315 (_ BitVec 64)) ListLongMap!15315)

(assert (=> b!1096941 (= lt!490180 (-!913 lt!490179 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41265)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35933 0))(
  ( (Unit!35934) )
))
(declare-fun lt!490176 () Unit!35933)

(declare-fun zeroValue!831 () V!41265)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!188 (array!71026 array!71028 (_ BitVec 32) (_ BitVec 32) V!41265 V!41265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35933)

(assert (=> b!1096941 (= lt!490176 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490181 () array!71026)

(declare-fun getCurrentListMapNoExtraKeys!4206 (array!71026 array!71028 (_ BitVec 32) (_ BitVec 32) V!41265 V!41265 (_ BitVec 32) Int) ListLongMap!15315)

(declare-fun dynLambda!2275 (Int (_ BitVec 64)) V!41265)

(assert (=> b!1096941 (= lt!490177 (getCurrentListMapNoExtraKeys!4206 lt!490181 (array!71029 (store (arr!34186 _values!874) i!650 (ValueCellFull!12842 (dynLambda!2275 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34724 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1096941 (= lt!490179 (getCurrentListMapNoExtraKeys!4206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096941 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490178 () Unit!35933)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71026 (_ BitVec 64) (_ BitVec 32)) Unit!35933)

(assert (=> b!1096941 (= lt!490178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096942 () Bool)

(declare-fun mapRes!42415 () Bool)

(assert (=> b!1096942 (= e!626077 (and e!626080 mapRes!42415))))

(declare-fun condMapEmpty!42415 () Bool)

(declare-fun mapDefault!42415 () ValueCell!12842)

(assert (=> b!1096942 (= condMapEmpty!42415 (= (arr!34186 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12842)) mapDefault!42415)))))

(declare-fun mapIsEmpty!42415 () Bool)

(assert (=> mapIsEmpty!42415 mapRes!42415))

(declare-fun mapNonEmpty!42415 () Bool)

(declare-fun tp!81085 () Bool)

(declare-fun e!626079 () Bool)

(assert (=> mapNonEmpty!42415 (= mapRes!42415 (and tp!81085 e!626079))))

(declare-fun mapKey!42415 () (_ BitVec 32))

(declare-fun mapRest!42415 () (Array (_ BitVec 32) ValueCell!12842))

(declare-fun mapValue!42415 () ValueCell!12842)

(assert (=> mapNonEmpty!42415 (= (arr!34186 _values!874) (store mapRest!42415 mapKey!42415 mapValue!42415))))

(declare-fun b!1096943 () Bool)

(declare-fun res!732168 () Bool)

(assert (=> b!1096943 (=> (not res!732168) (not e!626076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71026 (_ BitVec 32)) Bool)

(assert (=> b!1096943 (= res!732168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096944 () Bool)

(declare-fun res!732171 () Bool)

(assert (=> b!1096944 (=> (not res!732171) (not e!626075))))

(declare-datatypes ((List!23940 0))(
  ( (Nil!23937) (Cons!23936 (h!25145 (_ BitVec 64)) (t!34030 List!23940)) )
))
(declare-fun arrayNoDuplicates!0 (array!71026 (_ BitVec 32) List!23940) Bool)

(assert (=> b!1096944 (= res!732171 (arrayNoDuplicates!0 lt!490181 #b00000000000000000000000000000000 Nil!23937))))

(declare-fun b!1096945 () Bool)

(declare-fun res!732170 () Bool)

(assert (=> b!1096945 (=> (not res!732170) (not e!626076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096945 (= res!732170 (validKeyInArray!0 k0!904))))

(declare-fun b!1096946 () Bool)

(declare-fun res!732166 () Bool)

(assert (=> b!1096946 (=> (not res!732166) (not e!626076))))

(assert (=> b!1096946 (= res!732166 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23937))))

(declare-fun b!1096947 () Bool)

(assert (=> b!1096947 (= e!626079 tp_is_empty!27103)))

(declare-fun b!1096948 () Bool)

(declare-fun res!732172 () Bool)

(assert (=> b!1096948 (=> (not res!732172) (not e!626076))))

(assert (=> b!1096948 (= res!732172 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34723 _keys!1070))))))

(declare-fun b!1096949 () Bool)

(declare-fun res!732164 () Bool)

(assert (=> b!1096949 (=> (not res!732164) (not e!626076))))

(assert (=> b!1096949 (= res!732164 (and (= (size!34724 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34723 _keys!1070) (size!34724 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096950 () Bool)

(assert (=> b!1096950 (= e!626076 e!626075)))

(declare-fun res!732169 () Bool)

(assert (=> b!1096950 (=> (not res!732169) (not e!626075))))

(assert (=> b!1096950 (= res!732169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490181 mask!1414))))

(assert (=> b!1096950 (= lt!490181 (array!71027 (store (arr!34185 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34723 _keys!1070)))))

(assert (= (and start!96468 res!732167) b!1096949))

(assert (= (and b!1096949 res!732164) b!1096943))

(assert (= (and b!1096943 res!732168) b!1096946))

(assert (= (and b!1096946 res!732166) b!1096948))

(assert (= (and b!1096948 res!732172) b!1096945))

(assert (= (and b!1096945 res!732170) b!1096940))

(assert (= (and b!1096940 res!732165) b!1096950))

(assert (= (and b!1096950 res!732169) b!1096944))

(assert (= (and b!1096944 res!732171) b!1096941))

(assert (= (and b!1096942 condMapEmpty!42415) mapIsEmpty!42415))

(assert (= (and b!1096942 (not condMapEmpty!42415)) mapNonEmpty!42415))

(get-info :version)

(assert (= (and mapNonEmpty!42415 ((_ is ValueCellFull!12842) mapValue!42415)) b!1096947))

(assert (= (and b!1096942 ((_ is ValueCellFull!12842) mapDefault!42415)) b!1096939))

(assert (= start!96468 b!1096942))

(declare-fun b_lambda!17689 () Bool)

(assert (=> (not b_lambda!17689) (not b!1096941)))

(declare-fun t!34028 () Bool)

(declare-fun tb!7911 () Bool)

(assert (=> (and start!96468 (= defaultEntry!882 defaultEntry!882) t!34028) tb!7911))

(declare-fun result!16353 () Bool)

(assert (=> tb!7911 (= result!16353 tp_is_empty!27103)))

(assert (=> b!1096941 t!34028))

(declare-fun b_and!36745 () Bool)

(assert (= b_and!36743 (and (=> t!34028 result!16353) b_and!36745)))

(declare-fun m!1015941 () Bool)

(assert (=> b!1096944 m!1015941))

(declare-fun m!1015943 () Bool)

(assert (=> b!1096940 m!1015943))

(declare-fun m!1015945 () Bool)

(assert (=> mapNonEmpty!42415 m!1015945))

(declare-fun m!1015947 () Bool)

(assert (=> start!96468 m!1015947))

(declare-fun m!1015949 () Bool)

(assert (=> start!96468 m!1015949))

(declare-fun m!1015951 () Bool)

(assert (=> start!96468 m!1015951))

(declare-fun m!1015953 () Bool)

(assert (=> b!1096945 m!1015953))

(declare-fun m!1015955 () Bool)

(assert (=> b!1096946 m!1015955))

(declare-fun m!1015957 () Bool)

(assert (=> b!1096941 m!1015957))

(declare-fun m!1015959 () Bool)

(assert (=> b!1096941 m!1015959))

(declare-fun m!1015961 () Bool)

(assert (=> b!1096941 m!1015961))

(declare-fun m!1015963 () Bool)

(assert (=> b!1096941 m!1015963))

(declare-fun m!1015965 () Bool)

(assert (=> b!1096941 m!1015965))

(declare-fun m!1015967 () Bool)

(assert (=> b!1096941 m!1015967))

(declare-fun m!1015969 () Bool)

(assert (=> b!1096941 m!1015969))

(declare-fun m!1015971 () Bool)

(assert (=> b!1096941 m!1015971))

(declare-fun m!1015973 () Bool)

(assert (=> b!1096943 m!1015973))

(declare-fun m!1015975 () Bool)

(assert (=> b!1096950 m!1015975))

(declare-fun m!1015977 () Bool)

(assert (=> b!1096950 m!1015977))

(check-sat (not b!1096944) (not start!96468) (not b!1096950) b_and!36745 (not b_lambda!17689) (not b!1096943) (not b_next!23053) (not b!1096941) (not b!1096945) (not mapNonEmpty!42415) tp_is_empty!27103 (not b!1096946))
(check-sat b_and!36745 (not b_next!23053))
