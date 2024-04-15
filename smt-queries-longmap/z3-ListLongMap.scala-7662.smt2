; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96286 () Bool)

(assert start!96286)

(declare-fun b_free!22945 () Bool)

(declare-fun b_next!22945 () Bool)

(assert (=> start!96286 (= b_free!22945 (not b_next!22945))))

(declare-fun tp!80684 () Bool)

(declare-fun b_and!36539 () Bool)

(assert (=> start!96286 (= tp!80684 b_and!36539)))

(declare-fun mapIsEmpty!42175 () Bool)

(declare-fun mapRes!42175 () Bool)

(assert (=> mapIsEmpty!42175 mapRes!42175))

(declare-fun res!730155 () Bool)

(declare-fun e!624626 () Bool)

(assert (=> start!96286 (=> (not res!730155) (not e!624626))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96286 (= res!730155 (validMask!0 mask!1414))))

(assert (=> start!96286 e!624626))

(assert (=> start!96286 tp!80684))

(assert (=> start!96286 true))

(declare-fun tp_is_empty!26947 () Bool)

(assert (=> start!96286 tp_is_empty!26947))

(declare-datatypes ((array!70724 0))(
  ( (array!70725 (arr!34036 (Array (_ BitVec 32) (_ BitVec 64))) (size!34574 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70724)

(declare-fun array_inv!26272 (array!70724) Bool)

(assert (=> start!96286 (array_inv!26272 _keys!1070)))

(declare-datatypes ((V!41057 0))(
  ( (V!41058 (val!13530 Int)) )
))
(declare-datatypes ((ValueCell!12764 0))(
  ( (ValueCellFull!12764 (v!16150 V!41057)) (EmptyCell!12764) )
))
(declare-datatypes ((array!70726 0))(
  ( (array!70727 (arr!34037 (Array (_ BitVec 32) ValueCell!12764)) (size!34575 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70726)

(declare-fun e!624628 () Bool)

(declare-fun array_inv!26273 (array!70726) Bool)

(assert (=> start!96286 (and (array_inv!26273 _values!874) e!624628)))

(declare-fun b!1094076 () Bool)

(declare-fun res!730154 () Bool)

(assert (=> b!1094076 (=> (not res!730154) (not e!624626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70724 (_ BitVec 32)) Bool)

(assert (=> b!1094076 (= res!730154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094077 () Bool)

(declare-fun e!624625 () Bool)

(assert (=> b!1094077 (= e!624625 tp_is_empty!26947)))

(declare-fun b!1094078 () Bool)

(declare-fun res!730150 () Bool)

(assert (=> b!1094078 (=> (not res!730150) (not e!624626))))

(declare-datatypes ((List!23845 0))(
  ( (Nil!23842) (Cons!23841 (h!25050 (_ BitVec 64)) (t!33839 List!23845)) )
))
(declare-fun arrayNoDuplicates!0 (array!70724 (_ BitVec 32) List!23845) Bool)

(assert (=> b!1094078 (= res!730150 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23842))))

(declare-fun b!1094079 () Bool)

(declare-fun e!624624 () Bool)

(assert (=> b!1094079 (= e!624624 tp_is_empty!26947)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!489359 () Bool)

(declare-fun b!1094080 () Bool)

(declare-datatypes ((tuple2!17276 0))(
  ( (tuple2!17277 (_1!8649 (_ BitVec 64)) (_2!8649 V!41057)) )
))
(declare-datatypes ((List!23846 0))(
  ( (Nil!23843) (Cons!23842 (h!25051 tuple2!17276) (t!33840 List!23846)) )
))
(declare-datatypes ((ListLongMap!15245 0))(
  ( (ListLongMap!15246 (toList!7638 List!23846)) )
))
(declare-fun lt!489365 () ListLongMap!15245)

(declare-fun e!624627 () Bool)

(declare-fun lt!489363 () ListLongMap!15245)

(assert (=> b!1094080 (= e!624627 (not (or (and (not lt!489359) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!489359) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!489359) (not (= lt!489363 lt!489365)) (bvsle #b00000000000000000000000000000000 (size!34574 _keys!1070)))))))

(assert (=> b!1094080 (= lt!489359 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41057)

(declare-fun lt!489368 () ListLongMap!15245)

(declare-fun zeroValue!831 () V!41057)

(declare-fun getCurrentListMap!4301 (array!70724 array!70726 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) Int) ListLongMap!15245)

(assert (=> b!1094080 (= lt!489368 (getCurrentListMap!4301 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489366 () array!70724)

(declare-fun lt!489360 () array!70726)

(assert (=> b!1094080 (= lt!489363 (getCurrentListMap!4301 lt!489366 lt!489360 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489367 () ListLongMap!15245)

(assert (=> b!1094080 (and (= lt!489365 lt!489367) (= lt!489367 lt!489365))))

(declare-fun lt!489362 () ListLongMap!15245)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!910 (ListLongMap!15245 (_ BitVec 64)) ListLongMap!15245)

(assert (=> b!1094080 (= lt!489367 (-!910 lt!489362 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35855 0))(
  ( (Unit!35856) )
))
(declare-fun lt!489361 () Unit!35855)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!185 (array!70724 array!70726 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35855)

(assert (=> b!1094080 (= lt!489361 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!185 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4171 (array!70724 array!70726 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) Int) ListLongMap!15245)

(assert (=> b!1094080 (= lt!489365 (getCurrentListMapNoExtraKeys!4171 lt!489366 lt!489360 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2242 (Int (_ BitVec 64)) V!41057)

(assert (=> b!1094080 (= lt!489360 (array!70727 (store (arr!34037 _values!874) i!650 (ValueCellFull!12764 (dynLambda!2242 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34575 _values!874)))))

(assert (=> b!1094080 (= lt!489362 (getCurrentListMapNoExtraKeys!4171 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094080 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489364 () Unit!35855)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70724 (_ BitVec 64) (_ BitVec 32)) Unit!35855)

(assert (=> b!1094080 (= lt!489364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094081 () Bool)

(declare-fun res!730151 () Bool)

(assert (=> b!1094081 (=> (not res!730151) (not e!624627))))

(assert (=> b!1094081 (= res!730151 (arrayNoDuplicates!0 lt!489366 #b00000000000000000000000000000000 Nil!23842))))

(declare-fun b!1094082 () Bool)

(declare-fun res!730152 () Bool)

(assert (=> b!1094082 (=> (not res!730152) (not e!624626))))

(assert (=> b!1094082 (= res!730152 (and (= (size!34575 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34574 _keys!1070) (size!34575 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094083 () Bool)

(declare-fun res!730153 () Bool)

(assert (=> b!1094083 (=> (not res!730153) (not e!624626))))

(assert (=> b!1094083 (= res!730153 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34574 _keys!1070))))))

(declare-fun b!1094084 () Bool)

(assert (=> b!1094084 (= e!624628 (and e!624625 mapRes!42175))))

(declare-fun condMapEmpty!42175 () Bool)

(declare-fun mapDefault!42175 () ValueCell!12764)

(assert (=> b!1094084 (= condMapEmpty!42175 (= (arr!34037 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12764)) mapDefault!42175)))))

(declare-fun mapNonEmpty!42175 () Bool)

(declare-fun tp!80683 () Bool)

(assert (=> mapNonEmpty!42175 (= mapRes!42175 (and tp!80683 e!624624))))

(declare-fun mapKey!42175 () (_ BitVec 32))

(declare-fun mapValue!42175 () ValueCell!12764)

(declare-fun mapRest!42175 () (Array (_ BitVec 32) ValueCell!12764))

(assert (=> mapNonEmpty!42175 (= (arr!34037 _values!874) (store mapRest!42175 mapKey!42175 mapValue!42175))))

(declare-fun b!1094085 () Bool)

(assert (=> b!1094085 (= e!624626 e!624627)))

(declare-fun res!730147 () Bool)

(assert (=> b!1094085 (=> (not res!730147) (not e!624627))))

(assert (=> b!1094085 (= res!730147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489366 mask!1414))))

(assert (=> b!1094085 (= lt!489366 (array!70725 (store (arr!34036 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34574 _keys!1070)))))

(declare-fun b!1094086 () Bool)

(declare-fun res!730149 () Bool)

(assert (=> b!1094086 (=> (not res!730149) (not e!624626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094086 (= res!730149 (validKeyInArray!0 k0!904))))

(declare-fun b!1094087 () Bool)

(declare-fun res!730148 () Bool)

(assert (=> b!1094087 (=> (not res!730148) (not e!624626))))

(assert (=> b!1094087 (= res!730148 (= (select (arr!34036 _keys!1070) i!650) k0!904))))

(assert (= (and start!96286 res!730155) b!1094082))

(assert (= (and b!1094082 res!730152) b!1094076))

(assert (= (and b!1094076 res!730154) b!1094078))

(assert (= (and b!1094078 res!730150) b!1094083))

(assert (= (and b!1094083 res!730153) b!1094086))

(assert (= (and b!1094086 res!730149) b!1094087))

(assert (= (and b!1094087 res!730148) b!1094085))

(assert (= (and b!1094085 res!730147) b!1094081))

(assert (= (and b!1094081 res!730151) b!1094080))

(assert (= (and b!1094084 condMapEmpty!42175) mapIsEmpty!42175))

(assert (= (and b!1094084 (not condMapEmpty!42175)) mapNonEmpty!42175))

(get-info :version)

(assert (= (and mapNonEmpty!42175 ((_ is ValueCellFull!12764) mapValue!42175)) b!1094079))

(assert (= (and b!1094084 ((_ is ValueCellFull!12764) mapDefault!42175)) b!1094077))

(assert (= start!96286 b!1094084))

(declare-fun b_lambda!17593 () Bool)

(assert (=> (not b_lambda!17593) (not b!1094080)))

(declare-fun t!33838 () Bool)

(declare-fun tb!7815 () Bool)

(assert (=> (and start!96286 (= defaultEntry!882 defaultEntry!882) t!33838) tb!7815))

(declare-fun result!16157 () Bool)

(assert (=> tb!7815 (= result!16157 tp_is_empty!26947)))

(assert (=> b!1094080 t!33838))

(declare-fun b_and!36541 () Bool)

(assert (= b_and!36539 (and (=> t!33838 result!16157) b_and!36541)))

(declare-fun m!1013555 () Bool)

(assert (=> b!1094078 m!1013555))

(declare-fun m!1013557 () Bool)

(assert (=> b!1094086 m!1013557))

(declare-fun m!1013559 () Bool)

(assert (=> b!1094081 m!1013559))

(declare-fun m!1013561 () Bool)

(assert (=> start!96286 m!1013561))

(declare-fun m!1013563 () Bool)

(assert (=> start!96286 m!1013563))

(declare-fun m!1013565 () Bool)

(assert (=> start!96286 m!1013565))

(declare-fun m!1013567 () Bool)

(assert (=> b!1094085 m!1013567))

(declare-fun m!1013569 () Bool)

(assert (=> b!1094085 m!1013569))

(declare-fun m!1013571 () Bool)

(assert (=> b!1094087 m!1013571))

(declare-fun m!1013573 () Bool)

(assert (=> b!1094076 m!1013573))

(declare-fun m!1013575 () Bool)

(assert (=> mapNonEmpty!42175 m!1013575))

(declare-fun m!1013577 () Bool)

(assert (=> b!1094080 m!1013577))

(declare-fun m!1013579 () Bool)

(assert (=> b!1094080 m!1013579))

(declare-fun m!1013581 () Bool)

(assert (=> b!1094080 m!1013581))

(declare-fun m!1013583 () Bool)

(assert (=> b!1094080 m!1013583))

(declare-fun m!1013585 () Bool)

(assert (=> b!1094080 m!1013585))

(declare-fun m!1013587 () Bool)

(assert (=> b!1094080 m!1013587))

(declare-fun m!1013589 () Bool)

(assert (=> b!1094080 m!1013589))

(declare-fun m!1013591 () Bool)

(assert (=> b!1094080 m!1013591))

(declare-fun m!1013593 () Bool)

(assert (=> b!1094080 m!1013593))

(declare-fun m!1013595 () Bool)

(assert (=> b!1094080 m!1013595))

(check-sat (not b_lambda!17593) (not b!1094086) tp_is_empty!26947 (not mapNonEmpty!42175) (not start!96286) (not b!1094085) (not b!1094078) (not b!1094076) b_and!36541 (not b!1094080) (not b_next!22945) (not b!1094081))
(check-sat b_and!36541 (not b_next!22945))
