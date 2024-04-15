; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96268 () Bool)

(assert start!96268)

(declare-fun b_free!22927 () Bool)

(declare-fun b_next!22927 () Bool)

(assert (=> start!96268 (= b_free!22927 (not b_next!22927))))

(declare-fun tp!80629 () Bool)

(declare-fun b_and!36503 () Bool)

(assert (=> start!96268 (= tp!80629 b_and!36503)))

(declare-fun b!1093734 () Bool)

(declare-fun res!729907 () Bool)

(declare-fun e!624467 () Bool)

(assert (=> b!1093734 (=> (not res!729907) (not e!624467))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70688 0))(
  ( (array!70689 (arr!34018 (Array (_ BitVec 32) (_ BitVec 64))) (size!34556 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70688)

(assert (=> b!1093734 (= res!729907 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34556 _keys!1070))))))

(declare-fun b!1093735 () Bool)

(declare-fun res!729910 () Bool)

(assert (=> b!1093735 (=> (not res!729910) (not e!624467))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093735 (= res!729910 (= (select (arr!34018 _keys!1070) i!650) k0!904))))

(declare-fun b!1093736 () Bool)

(declare-fun e!624464 () Bool)

(declare-fun tp_is_empty!26929 () Bool)

(assert (=> b!1093736 (= e!624464 tp_is_empty!26929)))

(declare-fun b!1093737 () Bool)

(declare-fun e!624462 () Bool)

(assert (=> b!1093737 (= e!624462 tp_is_empty!26929)))

(declare-fun mapNonEmpty!42148 () Bool)

(declare-fun mapRes!42148 () Bool)

(declare-fun tp!80630 () Bool)

(assert (=> mapNonEmpty!42148 (= mapRes!42148 (and tp!80630 e!624462))))

(declare-datatypes ((V!41033 0))(
  ( (V!41034 (val!13521 Int)) )
))
(declare-datatypes ((ValueCell!12755 0))(
  ( (ValueCellFull!12755 (v!16141 V!41033)) (EmptyCell!12755) )
))
(declare-datatypes ((array!70690 0))(
  ( (array!70691 (arr!34019 (Array (_ BitVec 32) ValueCell!12755)) (size!34557 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70690)

(declare-fun mapValue!42148 () ValueCell!12755)

(declare-fun mapKey!42148 () (_ BitVec 32))

(declare-fun mapRest!42148 () (Array (_ BitVec 32) ValueCell!12755))

(assert (=> mapNonEmpty!42148 (= (arr!34019 _values!874) (store mapRest!42148 mapKey!42148 mapValue!42148))))

(declare-fun b!1093738 () Bool)

(declare-fun res!729912 () Bool)

(assert (=> b!1093738 (=> (not res!729912) (not e!624467))))

(declare-datatypes ((List!23830 0))(
  ( (Nil!23827) (Cons!23826 (h!25035 (_ BitVec 64)) (t!33806 List!23830)) )
))
(declare-fun arrayNoDuplicates!0 (array!70688 (_ BitVec 32) List!23830) Bool)

(assert (=> b!1093738 (= res!729912 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23827))))

(declare-fun mapIsEmpty!42148 () Bool)

(assert (=> mapIsEmpty!42148 mapRes!42148))

(declare-fun b!1093739 () Bool)

(declare-fun res!729909 () Bool)

(assert (=> b!1093739 (=> (not res!729909) (not e!624467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093739 (= res!729909 (validKeyInArray!0 k0!904))))

(declare-fun res!729911 () Bool)

(assert (=> start!96268 (=> (not res!729911) (not e!624467))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96268 (= res!729911 (validMask!0 mask!1414))))

(assert (=> start!96268 e!624467))

(assert (=> start!96268 tp!80629))

(assert (=> start!96268 true))

(assert (=> start!96268 tp_is_empty!26929))

(declare-fun array_inv!26258 (array!70688) Bool)

(assert (=> start!96268 (array_inv!26258 _keys!1070)))

(declare-fun e!624465 () Bool)

(declare-fun array_inv!26259 (array!70690) Bool)

(assert (=> start!96268 (and (array_inv!26259 _values!874) e!624465)))

(declare-fun b!1093740 () Bool)

(declare-fun res!729905 () Bool)

(declare-fun e!624463 () Bool)

(assert (=> b!1093740 (=> (not res!729905) (not e!624463))))

(declare-fun lt!489115 () array!70688)

(assert (=> b!1093740 (= res!729905 (arrayNoDuplicates!0 lt!489115 #b00000000000000000000000000000000 Nil!23827))))

(declare-fun b!1093741 () Bool)

(declare-fun res!729904 () Bool)

(assert (=> b!1093741 (=> (not res!729904) (not e!624467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70688 (_ BitVec 32)) Bool)

(assert (=> b!1093741 (= res!729904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093742 () Bool)

(assert (=> b!1093742 (= e!624463 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41033)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17262 0))(
  ( (tuple2!17263 (_1!8642 (_ BitVec 64)) (_2!8642 V!41033)) )
))
(declare-datatypes ((List!23831 0))(
  ( (Nil!23828) (Cons!23827 (h!25036 tuple2!17262) (t!33807 List!23831)) )
))
(declare-datatypes ((ListLongMap!15231 0))(
  ( (ListLongMap!15232 (toList!7631 List!23831)) )
))
(declare-fun lt!489114 () ListLongMap!15231)

(declare-fun zeroValue!831 () V!41033)

(declare-fun getCurrentListMap!4294 (array!70688 array!70690 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) Int) ListLongMap!15231)

(assert (=> b!1093742 (= lt!489114 (getCurrentListMap!4294 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489116 () ListLongMap!15231)

(declare-fun lt!489122 () array!70690)

(assert (=> b!1093742 (= lt!489116 (getCurrentListMap!4294 lt!489115 lt!489122 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489120 () ListLongMap!15231)

(declare-fun lt!489117 () ListLongMap!15231)

(assert (=> b!1093742 (and (= lt!489120 lt!489117) (= lt!489117 lt!489120))))

(declare-fun lt!489119 () ListLongMap!15231)

(declare-fun -!903 (ListLongMap!15231 (_ BitVec 64)) ListLongMap!15231)

(assert (=> b!1093742 (= lt!489117 (-!903 lt!489119 k0!904))))

(declare-datatypes ((Unit!35841 0))(
  ( (Unit!35842) )
))
(declare-fun lt!489118 () Unit!35841)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!178 (array!70688 array!70690 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35841)

(assert (=> b!1093742 (= lt!489118 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4164 (array!70688 array!70690 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) Int) ListLongMap!15231)

(assert (=> b!1093742 (= lt!489120 (getCurrentListMapNoExtraKeys!4164 lt!489115 lt!489122 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2235 (Int (_ BitVec 64)) V!41033)

(assert (=> b!1093742 (= lt!489122 (array!70691 (store (arr!34019 _values!874) i!650 (ValueCellFull!12755 (dynLambda!2235 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34557 _values!874)))))

(assert (=> b!1093742 (= lt!489119 (getCurrentListMapNoExtraKeys!4164 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093742 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489121 () Unit!35841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70688 (_ BitVec 64) (_ BitVec 32)) Unit!35841)

(assert (=> b!1093742 (= lt!489121 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093743 () Bool)

(declare-fun res!729908 () Bool)

(assert (=> b!1093743 (=> (not res!729908) (not e!624467))))

(assert (=> b!1093743 (= res!729908 (and (= (size!34557 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34556 _keys!1070) (size!34557 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093744 () Bool)

(assert (=> b!1093744 (= e!624467 e!624463)))

(declare-fun res!729906 () Bool)

(assert (=> b!1093744 (=> (not res!729906) (not e!624463))))

(assert (=> b!1093744 (= res!729906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489115 mask!1414))))

(assert (=> b!1093744 (= lt!489115 (array!70689 (store (arr!34018 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34556 _keys!1070)))))

(declare-fun b!1093745 () Bool)

(assert (=> b!1093745 (= e!624465 (and e!624464 mapRes!42148))))

(declare-fun condMapEmpty!42148 () Bool)

(declare-fun mapDefault!42148 () ValueCell!12755)

(assert (=> b!1093745 (= condMapEmpty!42148 (= (arr!34019 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12755)) mapDefault!42148)))))

(assert (= (and start!96268 res!729911) b!1093743))

(assert (= (and b!1093743 res!729908) b!1093741))

(assert (= (and b!1093741 res!729904) b!1093738))

(assert (= (and b!1093738 res!729912) b!1093734))

(assert (= (and b!1093734 res!729907) b!1093739))

(assert (= (and b!1093739 res!729909) b!1093735))

(assert (= (and b!1093735 res!729910) b!1093744))

(assert (= (and b!1093744 res!729906) b!1093740))

(assert (= (and b!1093740 res!729905) b!1093742))

(assert (= (and b!1093745 condMapEmpty!42148) mapIsEmpty!42148))

(assert (= (and b!1093745 (not condMapEmpty!42148)) mapNonEmpty!42148))

(get-info :version)

(assert (= (and mapNonEmpty!42148 ((_ is ValueCellFull!12755) mapValue!42148)) b!1093737))

(assert (= (and b!1093745 ((_ is ValueCellFull!12755) mapDefault!42148)) b!1093736))

(assert (= start!96268 b!1093745))

(declare-fun b_lambda!17575 () Bool)

(assert (=> (not b_lambda!17575) (not b!1093742)))

(declare-fun t!33805 () Bool)

(declare-fun tb!7797 () Bool)

(assert (=> (and start!96268 (= defaultEntry!882 defaultEntry!882) t!33805) tb!7797))

(declare-fun result!16121 () Bool)

(assert (=> tb!7797 (= result!16121 tp_is_empty!26929)))

(assert (=> b!1093742 t!33805))

(declare-fun b_and!36505 () Bool)

(assert (= b_and!36503 (and (=> t!33805 result!16121) b_and!36505)))

(declare-fun m!1013177 () Bool)

(assert (=> b!1093739 m!1013177))

(declare-fun m!1013179 () Bool)

(assert (=> b!1093741 m!1013179))

(declare-fun m!1013181 () Bool)

(assert (=> b!1093735 m!1013181))

(declare-fun m!1013183 () Bool)

(assert (=> b!1093740 m!1013183))

(declare-fun m!1013185 () Bool)

(assert (=> b!1093742 m!1013185))

(declare-fun m!1013187 () Bool)

(assert (=> b!1093742 m!1013187))

(declare-fun m!1013189 () Bool)

(assert (=> b!1093742 m!1013189))

(declare-fun m!1013191 () Bool)

(assert (=> b!1093742 m!1013191))

(declare-fun m!1013193 () Bool)

(assert (=> b!1093742 m!1013193))

(declare-fun m!1013195 () Bool)

(assert (=> b!1093742 m!1013195))

(declare-fun m!1013197 () Bool)

(assert (=> b!1093742 m!1013197))

(declare-fun m!1013199 () Bool)

(assert (=> b!1093742 m!1013199))

(declare-fun m!1013201 () Bool)

(assert (=> b!1093742 m!1013201))

(declare-fun m!1013203 () Bool)

(assert (=> b!1093742 m!1013203))

(declare-fun m!1013205 () Bool)

(assert (=> mapNonEmpty!42148 m!1013205))

(declare-fun m!1013207 () Bool)

(assert (=> start!96268 m!1013207))

(declare-fun m!1013209 () Bool)

(assert (=> start!96268 m!1013209))

(declare-fun m!1013211 () Bool)

(assert (=> start!96268 m!1013211))

(declare-fun m!1013213 () Bool)

(assert (=> b!1093744 m!1013213))

(declare-fun m!1013215 () Bool)

(assert (=> b!1093744 m!1013215))

(declare-fun m!1013217 () Bool)

(assert (=> b!1093738 m!1013217))

(check-sat (not b!1093741) (not b_lambda!17575) b_and!36505 (not b!1093744) (not b!1093738) (not b!1093739) (not start!96268) tp_is_empty!26929 (not b_next!22927) (not mapNonEmpty!42148) (not b!1093740) (not b!1093742))
(check-sat b_and!36505 (not b_next!22927))
