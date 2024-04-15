; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96420 () Bool)

(assert start!96420)

(declare-fun b_free!23005 () Bool)

(declare-fun b_next!23005 () Bool)

(assert (=> start!96420 (= b_free!23005 (not b_next!23005))))

(declare-fun tp!80942 () Bool)

(declare-fun b_and!36647 () Bool)

(assert (=> start!96420 (= tp!80942 b_and!36647)))

(declare-fun res!731524 () Bool)

(declare-fun e!625648 () Bool)

(assert (=> start!96420 (=> (not res!731524) (not e!625648))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96420 (= res!731524 (validMask!0 mask!1414))))

(assert (=> start!96420 e!625648))

(assert (=> start!96420 tp!80942))

(assert (=> start!96420 true))

(declare-fun tp_is_empty!27055 () Bool)

(assert (=> start!96420 tp_is_empty!27055))

(declare-datatypes ((array!70934 0))(
  ( (array!70935 (arr!34139 (Array (_ BitVec 32) (_ BitVec 64))) (size!34677 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70934)

(declare-fun array_inv!26338 (array!70934) Bool)

(assert (=> start!96420 (array_inv!26338 _keys!1070)))

(declare-datatypes ((V!41201 0))(
  ( (V!41202 (val!13584 Int)) )
))
(declare-datatypes ((ValueCell!12818 0))(
  ( (ValueCellFull!12818 (v!16204 V!41201)) (EmptyCell!12818) )
))
(declare-datatypes ((array!70936 0))(
  ( (array!70937 (arr!34140 (Array (_ BitVec 32) ValueCell!12818)) (size!34678 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70936)

(declare-fun e!625644 () Bool)

(declare-fun array_inv!26339 (array!70936) Bool)

(assert (=> start!96420 (and (array_inv!26339 _values!874) e!625644)))

(declare-fun mapNonEmpty!42343 () Bool)

(declare-fun mapRes!42343 () Bool)

(declare-fun tp!80941 () Bool)

(declare-fun e!625646 () Bool)

(assert (=> mapNonEmpty!42343 (= mapRes!42343 (and tp!80941 e!625646))))

(declare-fun mapValue!42343 () ValueCell!12818)

(declare-fun mapRest!42343 () (Array (_ BitVec 32) ValueCell!12818))

(declare-fun mapKey!42343 () (_ BitVec 32))

(assert (=> mapNonEmpty!42343 (= (arr!34140 _values!874) (store mapRest!42343 mapKey!42343 mapValue!42343))))

(declare-fun mapIsEmpty!42343 () Bool)

(assert (=> mapIsEmpty!42343 mapRes!42343))

(declare-fun b!1096027 () Bool)

(assert (=> b!1096027 (= e!625646 tp_is_empty!27055)))

(declare-fun b!1096028 () Bool)

(declare-fun e!625645 () Bool)

(assert (=> b!1096028 (= e!625644 (and e!625645 mapRes!42343))))

(declare-fun condMapEmpty!42343 () Bool)

(declare-fun mapDefault!42343 () ValueCell!12818)

(assert (=> b!1096028 (= condMapEmpty!42343 (= (arr!34140 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12818)) mapDefault!42343)))))

(declare-fun b!1096029 () Bool)

(declare-fun e!625643 () Bool)

(assert (=> b!1096029 (= e!625648 e!625643)))

(declare-fun res!731520 () Bool)

(assert (=> b!1096029 (=> (not res!731520) (not e!625643))))

(declare-fun lt!489866 () array!70934)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70934 (_ BitVec 32)) Bool)

(assert (=> b!1096029 (= res!731520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489866 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096029 (= lt!489866 (array!70935 (store (arr!34139 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34677 _keys!1070)))))

(declare-fun b!1096030 () Bool)

(assert (=> b!1096030 (= e!625643 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41201)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41201)

(declare-datatypes ((tuple2!17306 0))(
  ( (tuple2!17307 (_1!8664 (_ BitVec 64)) (_2!8664 V!41201)) )
))
(declare-datatypes ((List!23899 0))(
  ( (Nil!23896) (Cons!23895 (h!25104 tuple2!17306) (t!33941 List!23899)) )
))
(declare-datatypes ((ListLongMap!15275 0))(
  ( (ListLongMap!15276 (toList!7653 List!23899)) )
))
(declare-fun lt!489869 () ListLongMap!15275)

(declare-fun getCurrentListMapNoExtraKeys!4186 (array!70934 array!70936 (_ BitVec 32) (_ BitVec 32) V!41201 V!41201 (_ BitVec 32) Int) ListLongMap!15275)

(declare-fun dynLambda!2255 (Int (_ BitVec 64)) V!41201)

(assert (=> b!1096030 (= lt!489869 (getCurrentListMapNoExtraKeys!4186 lt!489866 (array!70937 (store (arr!34140 _values!874) i!650 (ValueCellFull!12818 (dynLambda!2255 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34678 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489868 () ListLongMap!15275)

(assert (=> b!1096030 (= lt!489868 (getCurrentListMapNoExtraKeys!4186 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096030 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35893 0))(
  ( (Unit!35894) )
))
(declare-fun lt!489867 () Unit!35893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70934 (_ BitVec 64) (_ BitVec 32)) Unit!35893)

(assert (=> b!1096030 (= lt!489867 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096031 () Bool)

(declare-fun res!731523 () Bool)

(assert (=> b!1096031 (=> (not res!731523) (not e!625648))))

(assert (=> b!1096031 (= res!731523 (= (select (arr!34139 _keys!1070) i!650) k0!904))))

(declare-fun b!1096032 () Bool)

(declare-fun res!731519 () Bool)

(assert (=> b!1096032 (=> (not res!731519) (not e!625648))))

(assert (=> b!1096032 (= res!731519 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34677 _keys!1070))))))

(declare-fun b!1096033 () Bool)

(declare-fun res!731521 () Bool)

(assert (=> b!1096033 (=> (not res!731521) (not e!625648))))

(assert (=> b!1096033 (= res!731521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096034 () Bool)

(declare-fun res!731517 () Bool)

(assert (=> b!1096034 (=> (not res!731517) (not e!625643))))

(declare-datatypes ((List!23900 0))(
  ( (Nil!23897) (Cons!23896 (h!25105 (_ BitVec 64)) (t!33942 List!23900)) )
))
(declare-fun arrayNoDuplicates!0 (array!70934 (_ BitVec 32) List!23900) Bool)

(assert (=> b!1096034 (= res!731517 (arrayNoDuplicates!0 lt!489866 #b00000000000000000000000000000000 Nil!23897))))

(declare-fun b!1096035 () Bool)

(declare-fun res!731518 () Bool)

(assert (=> b!1096035 (=> (not res!731518) (not e!625648))))

(assert (=> b!1096035 (= res!731518 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23897))))

(declare-fun b!1096036 () Bool)

(declare-fun res!731516 () Bool)

(assert (=> b!1096036 (=> (not res!731516) (not e!625648))))

(assert (=> b!1096036 (= res!731516 (and (= (size!34678 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34677 _keys!1070) (size!34678 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096037 () Bool)

(declare-fun res!731522 () Bool)

(assert (=> b!1096037 (=> (not res!731522) (not e!625648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096037 (= res!731522 (validKeyInArray!0 k0!904))))

(declare-fun b!1096038 () Bool)

(assert (=> b!1096038 (= e!625645 tp_is_empty!27055)))

(assert (= (and start!96420 res!731524) b!1096036))

(assert (= (and b!1096036 res!731516) b!1096033))

(assert (= (and b!1096033 res!731521) b!1096035))

(assert (= (and b!1096035 res!731518) b!1096032))

(assert (= (and b!1096032 res!731519) b!1096037))

(assert (= (and b!1096037 res!731522) b!1096031))

(assert (= (and b!1096031 res!731523) b!1096029))

(assert (= (and b!1096029 res!731520) b!1096034))

(assert (= (and b!1096034 res!731517) b!1096030))

(assert (= (and b!1096028 condMapEmpty!42343) mapIsEmpty!42343))

(assert (= (and b!1096028 (not condMapEmpty!42343)) mapNonEmpty!42343))

(get-info :version)

(assert (= (and mapNonEmpty!42343 ((_ is ValueCellFull!12818) mapValue!42343)) b!1096027))

(assert (= (and b!1096028 ((_ is ValueCellFull!12818) mapDefault!42343)) b!1096038))

(assert (= start!96420 b!1096028))

(declare-fun b_lambda!17641 () Bool)

(assert (=> (not b_lambda!17641) (not b!1096030)))

(declare-fun t!33940 () Bool)

(declare-fun tb!7863 () Bool)

(assert (=> (and start!96420 (= defaultEntry!882 defaultEntry!882) t!33940) tb!7863))

(declare-fun result!16257 () Bool)

(assert (=> tb!7863 (= result!16257 tp_is_empty!27055)))

(assert (=> b!1096030 t!33940))

(declare-fun b_and!36649 () Bool)

(assert (= b_and!36647 (and (=> t!33940 result!16257) b_and!36649)))

(declare-fun m!1015113 () Bool)

(assert (=> b!1096030 m!1015113))

(declare-fun m!1015115 () Bool)

(assert (=> b!1096030 m!1015115))

(declare-fun m!1015117 () Bool)

(assert (=> b!1096030 m!1015117))

(declare-fun m!1015119 () Bool)

(assert (=> b!1096030 m!1015119))

(declare-fun m!1015121 () Bool)

(assert (=> b!1096030 m!1015121))

(declare-fun m!1015123 () Bool)

(assert (=> b!1096030 m!1015123))

(declare-fun m!1015125 () Bool)

(assert (=> start!96420 m!1015125))

(declare-fun m!1015127 () Bool)

(assert (=> start!96420 m!1015127))

(declare-fun m!1015129 () Bool)

(assert (=> start!96420 m!1015129))

(declare-fun m!1015131 () Bool)

(assert (=> mapNonEmpty!42343 m!1015131))

(declare-fun m!1015133 () Bool)

(assert (=> b!1096033 m!1015133))

(declare-fun m!1015135 () Bool)

(assert (=> b!1096037 m!1015135))

(declare-fun m!1015137 () Bool)

(assert (=> b!1096035 m!1015137))

(declare-fun m!1015139 () Bool)

(assert (=> b!1096029 m!1015139))

(declare-fun m!1015141 () Bool)

(assert (=> b!1096029 m!1015141))

(declare-fun m!1015143 () Bool)

(assert (=> b!1096034 m!1015143))

(declare-fun m!1015145 () Bool)

(assert (=> b!1096031 m!1015145))

(check-sat (not b!1096029) (not start!96420) (not b!1096034) (not mapNonEmpty!42343) (not b!1096030) (not b!1096035) tp_is_empty!27055 b_and!36649 (not b_lambda!17641) (not b!1096033) (not b_next!23005) (not b!1096037))
(check-sat b_and!36649 (not b_next!23005))
