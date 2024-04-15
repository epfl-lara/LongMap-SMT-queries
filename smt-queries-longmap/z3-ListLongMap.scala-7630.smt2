; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96094 () Bool)

(assert start!96094)

(declare-fun b_free!22753 () Bool)

(declare-fun b_next!22753 () Bool)

(assert (=> start!96094 (= b_free!22753 (not b_next!22753))))

(declare-fun tp!80107 () Bool)

(declare-fun b_and!36155 () Bool)

(assert (=> start!96094 (= tp!80107 b_and!36155)))

(declare-fun b!1090162 () Bool)

(declare-fun e!622635 () Bool)

(assert (=> b!1090162 (= e!622635 true)))

(declare-datatypes ((V!40801 0))(
  ( (V!40802 (val!13434 Int)) )
))
(declare-datatypes ((tuple2!17128 0))(
  ( (tuple2!17129 (_1!8575 (_ BitVec 64)) (_2!8575 V!40801)) )
))
(declare-datatypes ((List!23694 0))(
  ( (Nil!23691) (Cons!23690 (h!24899 tuple2!17128) (t!33496 List!23694)) )
))
(declare-datatypes ((ListLongMap!15097 0))(
  ( (ListLongMap!15098 (toList!7564 List!23694)) )
))
(declare-fun lt!486227 () ListLongMap!15097)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!486226 () ListLongMap!15097)

(declare-fun -!839 (ListLongMap!15097 (_ BitVec 64)) ListLongMap!15097)

(assert (=> b!1090162 (= (-!839 lt!486227 k0!904) lt!486226)))

(declare-fun minValue!831 () V!40801)

(declare-datatypes ((Unit!35713 0))(
  ( (Unit!35714) )
))
(declare-fun lt!486235 () Unit!35713)

(declare-fun lt!486228 () ListLongMap!15097)

(declare-fun addRemoveCommutativeForDiffKeys!86 (ListLongMap!15097 (_ BitVec 64) V!40801 (_ BitVec 64)) Unit!35713)

(assert (=> b!1090162 (= lt!486235 (addRemoveCommutativeForDiffKeys!86 lt!486228 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090163 () Bool)

(declare-fun res!727299 () Bool)

(declare-fun e!622633 () Bool)

(assert (=> b!1090163 (=> (not res!727299) (not e!622633))))

(declare-datatypes ((array!70352 0))(
  ( (array!70353 (arr!33850 (Array (_ BitVec 32) (_ BitVec 64))) (size!34388 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70352)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70352 (_ BitVec 32)) Bool)

(assert (=> b!1090163 (= res!727299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090164 () Bool)

(declare-fun e!622634 () Bool)

(assert (=> b!1090164 (= e!622634 e!622635)))

(declare-fun res!727294 () Bool)

(assert (=> b!1090164 (=> res!727294 e!622635)))

(assert (=> b!1090164 (= res!727294 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486225 () ListLongMap!15097)

(assert (=> b!1090164 (= lt!486225 lt!486227)))

(declare-fun lt!486234 () tuple2!17128)

(declare-fun +!3357 (ListLongMap!15097 tuple2!17128) ListLongMap!15097)

(assert (=> b!1090164 (= lt!486227 (+!3357 lt!486228 lt!486234))))

(declare-fun lt!486230 () ListLongMap!15097)

(assert (=> b!1090164 (= lt!486230 lt!486226)))

(declare-fun lt!486236 () ListLongMap!15097)

(assert (=> b!1090164 (= lt!486226 (+!3357 lt!486236 lt!486234))))

(declare-fun lt!486232 () ListLongMap!15097)

(assert (=> b!1090164 (= lt!486230 (+!3357 lt!486232 lt!486234))))

(assert (=> b!1090164 (= lt!486234 (tuple2!17129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090165 () Bool)

(declare-fun e!622631 () Bool)

(assert (=> b!1090165 (= e!622631 (not e!622634))))

(declare-fun res!727289 () Bool)

(assert (=> b!1090165 (=> res!727289 e!622634)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090165 (= res!727289 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40801)

(declare-datatypes ((ValueCell!12668 0))(
  ( (ValueCellFull!12668 (v!16054 V!40801)) (EmptyCell!12668) )
))
(declare-datatypes ((array!70354 0))(
  ( (array!70355 (arr!33851 (Array (_ BitVec 32) ValueCell!12668)) (size!34389 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70354)

(declare-fun getCurrentListMap!4236 (array!70352 array!70354 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) Int) ListLongMap!15097)

(assert (=> b!1090165 (= lt!486225 (getCurrentListMap!4236 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486229 () array!70352)

(declare-fun lt!486224 () array!70354)

(assert (=> b!1090165 (= lt!486230 (getCurrentListMap!4236 lt!486229 lt!486224 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090165 (and (= lt!486232 lt!486236) (= lt!486236 lt!486232))))

(assert (=> b!1090165 (= lt!486236 (-!839 lt!486228 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!486233 () Unit!35713)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!120 (array!70352 array!70354 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35713)

(assert (=> b!1090165 (= lt!486233 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!120 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4106 (array!70352 array!70354 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) Int) ListLongMap!15097)

(assert (=> b!1090165 (= lt!486232 (getCurrentListMapNoExtraKeys!4106 lt!486229 lt!486224 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2177 (Int (_ BitVec 64)) V!40801)

(assert (=> b!1090165 (= lt!486224 (array!70355 (store (arr!33851 _values!874) i!650 (ValueCellFull!12668 (dynLambda!2177 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34389 _values!874)))))

(assert (=> b!1090165 (= lt!486228 (getCurrentListMapNoExtraKeys!4106 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090165 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486231 () Unit!35713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70352 (_ BitVec 64) (_ BitVec 32)) Unit!35713)

(assert (=> b!1090165 (= lt!486231 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090166 () Bool)

(declare-fun res!727295 () Bool)

(assert (=> b!1090166 (=> (not res!727295) (not e!622633))))

(declare-datatypes ((List!23695 0))(
  ( (Nil!23692) (Cons!23691 (h!24900 (_ BitVec 64)) (t!33497 List!23695)) )
))
(declare-fun arrayNoDuplicates!0 (array!70352 (_ BitVec 32) List!23695) Bool)

(assert (=> b!1090166 (= res!727295 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23692))))

(declare-fun b!1090167 () Bool)

(declare-fun res!727298 () Bool)

(assert (=> b!1090167 (=> (not res!727298) (not e!622633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090167 (= res!727298 (validKeyInArray!0 k0!904))))

(declare-fun b!1090168 () Bool)

(declare-fun res!727293 () Bool)

(assert (=> b!1090168 (=> (not res!727293) (not e!622633))))

(assert (=> b!1090168 (= res!727293 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34388 _keys!1070))))))

(declare-fun mapIsEmpty!41887 () Bool)

(declare-fun mapRes!41887 () Bool)

(assert (=> mapIsEmpty!41887 mapRes!41887))

(declare-fun b!1090170 () Bool)

(declare-fun res!727297 () Bool)

(assert (=> b!1090170 (=> (not res!727297) (not e!622631))))

(assert (=> b!1090170 (= res!727297 (arrayNoDuplicates!0 lt!486229 #b00000000000000000000000000000000 Nil!23692))))

(declare-fun mapNonEmpty!41887 () Bool)

(declare-fun tp!80108 () Bool)

(declare-fun e!622637 () Bool)

(assert (=> mapNonEmpty!41887 (= mapRes!41887 (and tp!80108 e!622637))))

(declare-fun mapRest!41887 () (Array (_ BitVec 32) ValueCell!12668))

(declare-fun mapValue!41887 () ValueCell!12668)

(declare-fun mapKey!41887 () (_ BitVec 32))

(assert (=> mapNonEmpty!41887 (= (arr!33851 _values!874) (store mapRest!41887 mapKey!41887 mapValue!41887))))

(declare-fun b!1090171 () Bool)

(assert (=> b!1090171 (= e!622633 e!622631)))

(declare-fun res!727296 () Bool)

(assert (=> b!1090171 (=> (not res!727296) (not e!622631))))

(assert (=> b!1090171 (= res!727296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486229 mask!1414))))

(assert (=> b!1090171 (= lt!486229 (array!70353 (store (arr!33850 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34388 _keys!1070)))))

(declare-fun b!1090172 () Bool)

(declare-fun e!622636 () Bool)

(declare-fun e!622630 () Bool)

(assert (=> b!1090172 (= e!622636 (and e!622630 mapRes!41887))))

(declare-fun condMapEmpty!41887 () Bool)

(declare-fun mapDefault!41887 () ValueCell!12668)

(assert (=> b!1090172 (= condMapEmpty!41887 (= (arr!33851 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12668)) mapDefault!41887)))))

(declare-fun b!1090173 () Bool)

(declare-fun tp_is_empty!26755 () Bool)

(assert (=> b!1090173 (= e!622630 tp_is_empty!26755)))

(declare-fun b!1090169 () Bool)

(declare-fun res!727292 () Bool)

(assert (=> b!1090169 (=> (not res!727292) (not e!622633))))

(assert (=> b!1090169 (= res!727292 (= (select (arr!33850 _keys!1070) i!650) k0!904))))

(declare-fun res!727291 () Bool)

(assert (=> start!96094 (=> (not res!727291) (not e!622633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96094 (= res!727291 (validMask!0 mask!1414))))

(assert (=> start!96094 e!622633))

(assert (=> start!96094 tp!80107))

(assert (=> start!96094 true))

(assert (=> start!96094 tp_is_empty!26755))

(declare-fun array_inv!26142 (array!70352) Bool)

(assert (=> start!96094 (array_inv!26142 _keys!1070)))

(declare-fun array_inv!26143 (array!70354) Bool)

(assert (=> start!96094 (and (array_inv!26143 _values!874) e!622636)))

(declare-fun b!1090174 () Bool)

(declare-fun res!727290 () Bool)

(assert (=> b!1090174 (=> (not res!727290) (not e!622633))))

(assert (=> b!1090174 (= res!727290 (and (= (size!34389 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34388 _keys!1070) (size!34389 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090175 () Bool)

(assert (=> b!1090175 (= e!622637 tp_is_empty!26755)))

(assert (= (and start!96094 res!727291) b!1090174))

(assert (= (and b!1090174 res!727290) b!1090163))

(assert (= (and b!1090163 res!727299) b!1090166))

(assert (= (and b!1090166 res!727295) b!1090168))

(assert (= (and b!1090168 res!727293) b!1090167))

(assert (= (and b!1090167 res!727298) b!1090169))

(assert (= (and b!1090169 res!727292) b!1090171))

(assert (= (and b!1090171 res!727296) b!1090170))

(assert (= (and b!1090170 res!727297) b!1090165))

(assert (= (and b!1090165 (not res!727289)) b!1090164))

(assert (= (and b!1090164 (not res!727294)) b!1090162))

(assert (= (and b!1090172 condMapEmpty!41887) mapIsEmpty!41887))

(assert (= (and b!1090172 (not condMapEmpty!41887)) mapNonEmpty!41887))

(get-info :version)

(assert (= (and mapNonEmpty!41887 ((_ is ValueCellFull!12668) mapValue!41887)) b!1090175))

(assert (= (and b!1090172 ((_ is ValueCellFull!12668) mapDefault!41887)) b!1090173))

(assert (= start!96094 b!1090172))

(declare-fun b_lambda!17401 () Bool)

(assert (=> (not b_lambda!17401) (not b!1090165)))

(declare-fun t!33495 () Bool)

(declare-fun tb!7623 () Bool)

(assert (=> (and start!96094 (= defaultEntry!882 defaultEntry!882) t!33495) tb!7623))

(declare-fun result!15773 () Bool)

(assert (=> tb!7623 (= result!15773 tp_is_empty!26755)))

(assert (=> b!1090165 t!33495))

(declare-fun b_and!36157 () Bool)

(assert (= b_and!36155 (and (=> t!33495 result!15773) b_and!36157)))

(declare-fun m!1009073 () Bool)

(assert (=> b!1090171 m!1009073))

(declare-fun m!1009075 () Bool)

(assert (=> b!1090171 m!1009075))

(declare-fun m!1009077 () Bool)

(assert (=> b!1090162 m!1009077))

(declare-fun m!1009079 () Bool)

(assert (=> b!1090162 m!1009079))

(declare-fun m!1009081 () Bool)

(assert (=> b!1090164 m!1009081))

(declare-fun m!1009083 () Bool)

(assert (=> b!1090164 m!1009083))

(declare-fun m!1009085 () Bool)

(assert (=> b!1090164 m!1009085))

(declare-fun m!1009087 () Bool)

(assert (=> b!1090167 m!1009087))

(declare-fun m!1009089 () Bool)

(assert (=> mapNonEmpty!41887 m!1009089))

(declare-fun m!1009091 () Bool)

(assert (=> b!1090170 m!1009091))

(declare-fun m!1009093 () Bool)

(assert (=> b!1090165 m!1009093))

(declare-fun m!1009095 () Bool)

(assert (=> b!1090165 m!1009095))

(declare-fun m!1009097 () Bool)

(assert (=> b!1090165 m!1009097))

(declare-fun m!1009099 () Bool)

(assert (=> b!1090165 m!1009099))

(declare-fun m!1009101 () Bool)

(assert (=> b!1090165 m!1009101))

(declare-fun m!1009103 () Bool)

(assert (=> b!1090165 m!1009103))

(declare-fun m!1009105 () Bool)

(assert (=> b!1090165 m!1009105))

(declare-fun m!1009107 () Bool)

(assert (=> b!1090165 m!1009107))

(declare-fun m!1009109 () Bool)

(assert (=> b!1090165 m!1009109))

(declare-fun m!1009111 () Bool)

(assert (=> b!1090165 m!1009111))

(declare-fun m!1009113 () Bool)

(assert (=> b!1090169 m!1009113))

(declare-fun m!1009115 () Bool)

(assert (=> b!1090166 m!1009115))

(declare-fun m!1009117 () Bool)

(assert (=> start!96094 m!1009117))

(declare-fun m!1009119 () Bool)

(assert (=> start!96094 m!1009119))

(declare-fun m!1009121 () Bool)

(assert (=> start!96094 m!1009121))

(declare-fun m!1009123 () Bool)

(assert (=> b!1090163 m!1009123))

(check-sat (not b!1090167) (not start!96094) (not b!1090163) (not b!1090166) tp_is_empty!26755 (not b!1090171) (not b_lambda!17401) (not b_next!22753) (not b!1090162) b_and!36157 (not b!1090170) (not b!1090165) (not b!1090164) (not mapNonEmpty!41887))
(check-sat b_and!36157 (not b_next!22753))
