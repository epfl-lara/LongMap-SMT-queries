; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96918 () Bool)

(assert start!96918)

(declare-fun b_free!23211 () Bool)

(declare-fun b_next!23211 () Bool)

(assert (=> start!96918 (= b_free!23211 (not b_next!23211))))

(declare-fun tp!81593 () Bool)

(declare-fun b_and!37239 () Bool)

(assert (=> start!96918 (= tp!81593 b_and!37239)))

(declare-fun b!1102657 () Bool)

(declare-fun e!629363 () Bool)

(declare-fun e!629360 () Bool)

(assert (=> b!1102657 (= e!629363 e!629360)))

(declare-fun res!735724 () Bool)

(assert (=> b!1102657 (=> (not res!735724) (not e!629360))))

(declare-datatypes ((array!71443 0))(
  ( (array!71444 (arr!34382 (Array (_ BitVec 32) (_ BitVec 64))) (size!34918 (_ BitVec 32))) )
))
(declare-fun lt!494779 () array!71443)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71443 (_ BitVec 32)) Bool)

(assert (=> b!1102657 (= res!735724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494779 mask!1414))))

(declare-fun _keys!1070 () array!71443)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102657 (= lt!494779 (array!71444 (store (arr!34382 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34918 _keys!1070)))))

(declare-fun b!1102658 () Bool)

(declare-fun res!735721 () Bool)

(assert (=> b!1102658 (=> (not res!735721) (not e!629363))))

(assert (=> b!1102658 (= res!735721 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34918 _keys!1070))))))

(declare-fun b!1102659 () Bool)

(declare-fun e!629362 () Bool)

(declare-fun tp_is_empty!27261 () Bool)

(assert (=> b!1102659 (= e!629362 tp_is_empty!27261)))

(declare-fun b!1102660 () Bool)

(declare-fun e!629365 () Bool)

(assert (=> b!1102660 (= e!629365 tp_is_empty!27261)))

(declare-fun b!1102661 () Bool)

(declare-fun res!735720 () Bool)

(assert (=> b!1102661 (=> (not res!735720) (not e!629363))))

(assert (=> b!1102661 (= res!735720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102662 () Bool)

(declare-fun res!735719 () Bool)

(assert (=> b!1102662 (=> (not res!735719) (not e!629363))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102662 (= res!735719 (validKeyInArray!0 k0!904))))

(declare-fun b!1102663 () Bool)

(declare-fun e!629361 () Bool)

(declare-fun mapRes!42685 () Bool)

(assert (=> b!1102663 (= e!629361 (and e!629365 mapRes!42685))))

(declare-fun condMapEmpty!42685 () Bool)

(declare-datatypes ((V!41475 0))(
  ( (V!41476 (val!13687 Int)) )
))
(declare-datatypes ((ValueCell!12921 0))(
  ( (ValueCellFull!12921 (v!16318 V!41475)) (EmptyCell!12921) )
))
(declare-datatypes ((array!71445 0))(
  ( (array!71446 (arr!34383 (Array (_ BitVec 32) ValueCell!12921)) (size!34919 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71445)

(declare-fun mapDefault!42685 () ValueCell!12921)

(assert (=> b!1102663 (= condMapEmpty!42685 (= (arr!34383 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12921)) mapDefault!42685)))))

(declare-fun mapNonEmpty!42685 () Bool)

(declare-fun tp!81592 () Bool)

(assert (=> mapNonEmpty!42685 (= mapRes!42685 (and tp!81592 e!629362))))

(declare-fun mapRest!42685 () (Array (_ BitVec 32) ValueCell!12921))

(declare-fun mapKey!42685 () (_ BitVec 32))

(declare-fun mapValue!42685 () ValueCell!12921)

(assert (=> mapNonEmpty!42685 (= (arr!34383 _values!874) (store mapRest!42685 mapKey!42685 mapValue!42685))))

(declare-fun res!735725 () Bool)

(assert (=> start!96918 (=> (not res!735725) (not e!629363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96918 (= res!735725 (validMask!0 mask!1414))))

(assert (=> start!96918 e!629363))

(assert (=> start!96918 tp!81593))

(assert (=> start!96918 true))

(assert (=> start!96918 tp_is_empty!27261))

(declare-fun array_inv!26480 (array!71443) Bool)

(assert (=> start!96918 (array_inv!26480 _keys!1070)))

(declare-fun array_inv!26481 (array!71445) Bool)

(assert (=> start!96918 (and (array_inv!26481 _values!874) e!629361)))

(declare-fun b!1102664 () Bool)

(declare-fun res!735727 () Bool)

(assert (=> b!1102664 (=> (not res!735727) (not e!629363))))

(declare-datatypes ((List!24026 0))(
  ( (Nil!24023) (Cons!24022 (h!25231 (_ BitVec 64)) (t!34283 List!24026)) )
))
(declare-fun arrayNoDuplicates!0 (array!71443 (_ BitVec 32) List!24026) Bool)

(assert (=> b!1102664 (= res!735727 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24023))))

(declare-fun b!1102665 () Bool)

(declare-fun res!735723 () Bool)

(assert (=> b!1102665 (=> (not res!735723) (not e!629363))))

(assert (=> b!1102665 (= res!735723 (= (select (arr!34382 _keys!1070) i!650) k0!904))))

(declare-fun b!1102666 () Bool)

(declare-fun res!735722 () Bool)

(assert (=> b!1102666 (=> (not res!735722) (not e!629363))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102666 (= res!735722 (and (= (size!34919 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34918 _keys!1070) (size!34919 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun lt!494783 () Bool)

(declare-datatypes ((tuple2!17410 0))(
  ( (tuple2!17411 (_1!8716 (_ BitVec 64)) (_2!8716 V!41475)) )
))
(declare-datatypes ((List!24027 0))(
  ( (Nil!24024) (Cons!24023 (h!25232 tuple2!17410) (t!34284 List!24027)) )
))
(declare-datatypes ((ListLongMap!15379 0))(
  ( (ListLongMap!15380 (toList!7705 List!24027)) )
))
(declare-fun lt!494782 () ListLongMap!15379)

(declare-fun b!1102667 () Bool)

(declare-fun lt!494775 () ListLongMap!15379)

(assert (=> b!1102667 (= e!629360 (not (or (and (not lt!494783) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494783) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494783) (not (= lt!494782 lt!494775)) (bvslt i!650 (size!34919 _values!874)))))))

(assert (=> b!1102667 (= lt!494783 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41475)

(declare-fun minValue!831 () V!41475)

(declare-fun lt!494780 () ListLongMap!15379)

(declare-fun getCurrentListMap!4409 (array!71443 array!71445 (_ BitVec 32) (_ BitVec 32) V!41475 V!41475 (_ BitVec 32) Int) ListLongMap!15379)

(assert (=> b!1102667 (= lt!494780 (getCurrentListMap!4409 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494784 () array!71445)

(assert (=> b!1102667 (= lt!494782 (getCurrentListMap!4409 lt!494779 lt!494784 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494781 () ListLongMap!15379)

(assert (=> b!1102667 (and (= lt!494775 lt!494781) (= lt!494781 lt!494775))))

(declare-fun lt!494778 () ListLongMap!15379)

(declare-fun -!988 (ListLongMap!15379 (_ BitVec 64)) ListLongMap!15379)

(assert (=> b!1102667 (= lt!494781 (-!988 lt!494778 k0!904))))

(declare-datatypes ((Unit!36230 0))(
  ( (Unit!36231) )
))
(declare-fun lt!494776 () Unit!36230)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!235 (array!71443 array!71445 (_ BitVec 32) (_ BitVec 32) V!41475 V!41475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36230)

(assert (=> b!1102667 (= lt!494776 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!235 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4205 (array!71443 array!71445 (_ BitVec 32) (_ BitVec 32) V!41475 V!41475 (_ BitVec 32) Int) ListLongMap!15379)

(assert (=> b!1102667 (= lt!494775 (getCurrentListMapNoExtraKeys!4205 lt!494779 lt!494784 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2340 (Int (_ BitVec 64)) V!41475)

(assert (=> b!1102667 (= lt!494784 (array!71446 (store (arr!34383 _values!874) i!650 (ValueCellFull!12921 (dynLambda!2340 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34919 _values!874)))))

(assert (=> b!1102667 (= lt!494778 (getCurrentListMapNoExtraKeys!4205 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102667 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494777 () Unit!36230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71443 (_ BitVec 64) (_ BitVec 32)) Unit!36230)

(assert (=> b!1102667 (= lt!494777 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42685 () Bool)

(assert (=> mapIsEmpty!42685 mapRes!42685))

(declare-fun b!1102668 () Bool)

(declare-fun res!735726 () Bool)

(assert (=> b!1102668 (=> (not res!735726) (not e!629360))))

(assert (=> b!1102668 (= res!735726 (arrayNoDuplicates!0 lt!494779 #b00000000000000000000000000000000 Nil!24023))))

(assert (= (and start!96918 res!735725) b!1102666))

(assert (= (and b!1102666 res!735722) b!1102661))

(assert (= (and b!1102661 res!735720) b!1102664))

(assert (= (and b!1102664 res!735727) b!1102658))

(assert (= (and b!1102658 res!735721) b!1102662))

(assert (= (and b!1102662 res!735719) b!1102665))

(assert (= (and b!1102665 res!735723) b!1102657))

(assert (= (and b!1102657 res!735724) b!1102668))

(assert (= (and b!1102668 res!735726) b!1102667))

(assert (= (and b!1102663 condMapEmpty!42685) mapIsEmpty!42685))

(assert (= (and b!1102663 (not condMapEmpty!42685)) mapNonEmpty!42685))

(get-info :version)

(assert (= (and mapNonEmpty!42685 ((_ is ValueCellFull!12921) mapValue!42685)) b!1102659))

(assert (= (and b!1102663 ((_ is ValueCellFull!12921) mapDefault!42685)) b!1102660))

(assert (= start!96918 b!1102663))

(declare-fun b_lambda!18199 () Bool)

(assert (=> (not b_lambda!18199) (not b!1102667)))

(declare-fun t!34282 () Bool)

(declare-fun tb!8077 () Bool)

(assert (=> (and start!96918 (= defaultEntry!882 defaultEntry!882) t!34282) tb!8077))

(declare-fun result!16699 () Bool)

(assert (=> tb!8077 (= result!16699 tp_is_empty!27261)))

(assert (=> b!1102667 t!34282))

(declare-fun b_and!37241 () Bool)

(assert (= b_and!37239 (and (=> t!34282 result!16699) b_and!37241)))

(declare-fun m!1022973 () Bool)

(assert (=> b!1102662 m!1022973))

(declare-fun m!1022975 () Bool)

(assert (=> mapNonEmpty!42685 m!1022975))

(declare-fun m!1022977 () Bool)

(assert (=> b!1102665 m!1022977))

(declare-fun m!1022979 () Bool)

(assert (=> b!1102657 m!1022979))

(declare-fun m!1022981 () Bool)

(assert (=> b!1102657 m!1022981))

(declare-fun m!1022983 () Bool)

(assert (=> start!96918 m!1022983))

(declare-fun m!1022985 () Bool)

(assert (=> start!96918 m!1022985))

(declare-fun m!1022987 () Bool)

(assert (=> start!96918 m!1022987))

(declare-fun m!1022989 () Bool)

(assert (=> b!1102667 m!1022989))

(declare-fun m!1022991 () Bool)

(assert (=> b!1102667 m!1022991))

(declare-fun m!1022993 () Bool)

(assert (=> b!1102667 m!1022993))

(declare-fun m!1022995 () Bool)

(assert (=> b!1102667 m!1022995))

(declare-fun m!1022997 () Bool)

(assert (=> b!1102667 m!1022997))

(declare-fun m!1022999 () Bool)

(assert (=> b!1102667 m!1022999))

(declare-fun m!1023001 () Bool)

(assert (=> b!1102667 m!1023001))

(declare-fun m!1023003 () Bool)

(assert (=> b!1102667 m!1023003))

(declare-fun m!1023005 () Bool)

(assert (=> b!1102667 m!1023005))

(declare-fun m!1023007 () Bool)

(assert (=> b!1102667 m!1023007))

(declare-fun m!1023009 () Bool)

(assert (=> b!1102661 m!1023009))

(declare-fun m!1023011 () Bool)

(assert (=> b!1102668 m!1023011))

(declare-fun m!1023013 () Bool)

(assert (=> b!1102664 m!1023013))

(check-sat (not b!1102667) (not start!96918) (not b!1102657) (not b!1102661) (not b_lambda!18199) tp_is_empty!27261 b_and!37241 (not mapNonEmpty!42685) (not b_next!23211) (not b!1102668) (not b!1102662) (not b!1102664))
(check-sat b_and!37241 (not b_next!23211))
