; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96692 () Bool)

(assert start!96692)

(declare-fun b_free!23035 () Bool)

(declare-fun b_next!23035 () Bool)

(assert (=> start!96692 (= b_free!23035 (not b_next!23035))))

(declare-fun tp!81032 () Bool)

(declare-fun b_and!36743 () Bool)

(assert (=> start!96692 (= tp!81032 b_and!36743)))

(declare-fun b!1098077 () Bool)

(declare-fun res!732515 () Bool)

(declare-fun e!626863 () Bool)

(assert (=> b!1098077 (=> (not res!732515) (not e!626863))))

(declare-datatypes ((array!71111 0))(
  ( (array!71112 (arr!34221 (Array (_ BitVec 32) (_ BitVec 64))) (size!34758 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71111)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71111 (_ BitVec 32)) Bool)

(assert (=> b!1098077 (= res!732515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098078 () Bool)

(declare-fun res!732518 () Bool)

(assert (=> b!1098078 (=> (not res!732518) (not e!626863))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41241 0))(
  ( (V!41242 (val!13599 Int)) )
))
(declare-datatypes ((ValueCell!12833 0))(
  ( (ValueCellFull!12833 (v!16216 V!41241)) (EmptyCell!12833) )
))
(declare-datatypes ((array!71113 0))(
  ( (array!71114 (arr!34222 (Array (_ BitVec 32) ValueCell!12833)) (size!34759 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71113)

(assert (=> b!1098078 (= res!732518 (and (= (size!34759 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34758 _keys!1070) (size!34759 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098079 () Bool)

(declare-fun e!626861 () Bool)

(declare-fun tp_is_empty!27085 () Bool)

(assert (=> b!1098079 (= e!626861 tp_is_empty!27085)))

(declare-fun mapIsEmpty!42388 () Bool)

(declare-fun mapRes!42388 () Bool)

(assert (=> mapIsEmpty!42388 mapRes!42388))

(declare-fun b!1098080 () Bool)

(declare-fun e!626862 () Bool)

(assert (=> b!1098080 (= e!626862 tp_is_empty!27085)))

(declare-fun b!1098081 () Bool)

(declare-fun res!732519 () Bool)

(assert (=> b!1098081 (=> (not res!732519) (not e!626863))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098081 (= res!732519 (validKeyInArray!0 k0!904))))

(declare-fun b!1098082 () Bool)

(declare-fun e!626864 () Bool)

(assert (=> b!1098082 (= e!626863 e!626864)))

(declare-fun res!732513 () Bool)

(assert (=> b!1098082 (=> (not res!732513) (not e!626864))))

(declare-fun lt!490763 () array!71111)

(assert (=> b!1098082 (= res!732513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490763 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098082 (= lt!490763 (array!71112 (store (arr!34221 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34758 _keys!1070)))))

(declare-fun b!1098083 () Bool)

(declare-fun e!626866 () Bool)

(assert (=> b!1098083 (= e!626866 (and e!626861 mapRes!42388))))

(declare-fun condMapEmpty!42388 () Bool)

(declare-fun mapDefault!42388 () ValueCell!12833)

(assert (=> b!1098083 (= condMapEmpty!42388 (= (arr!34222 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12833)) mapDefault!42388)))))

(declare-fun b!1098084 () Bool)

(declare-fun res!732520 () Bool)

(assert (=> b!1098084 (=> (not res!732520) (not e!626864))))

(declare-datatypes ((List!23904 0))(
  ( (Nil!23901) (Cons!23900 (h!25118 (_ BitVec 64)) (t!33977 List!23904)) )
))
(declare-fun arrayNoDuplicates!0 (array!71111 (_ BitVec 32) List!23904) Bool)

(assert (=> b!1098084 (= res!732520 (arrayNoDuplicates!0 lt!490763 #b00000000000000000000000000000000 Nil!23901))))

(declare-fun b!1098085 () Bool)

(assert (=> b!1098085 (= e!626864 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41241)

(declare-fun zeroValue!831 () V!41241)

(declare-datatypes ((tuple2!17282 0))(
  ( (tuple2!17283 (_1!8652 (_ BitVec 64)) (_2!8652 V!41241)) )
))
(declare-datatypes ((List!23905 0))(
  ( (Nil!23902) (Cons!23901 (h!25119 tuple2!17282) (t!33978 List!23905)) )
))
(declare-datatypes ((ListLongMap!15259 0))(
  ( (ListLongMap!15260 (toList!7645 List!23905)) )
))
(declare-fun lt!490762 () ListLongMap!15259)

(declare-fun getCurrentListMapNoExtraKeys!4198 (array!71111 array!71113 (_ BitVec 32) (_ BitVec 32) V!41241 V!41241 (_ BitVec 32) Int) ListLongMap!15259)

(declare-fun dynLambda!2316 (Int (_ BitVec 64)) V!41241)

(assert (=> b!1098085 (= lt!490762 (getCurrentListMapNoExtraKeys!4198 lt!490763 (array!71114 (store (arr!34222 _values!874) i!650 (ValueCellFull!12833 (dynLambda!2316 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34759 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490761 () ListLongMap!15259)

(assert (=> b!1098085 (= lt!490761 (getCurrentListMapNoExtraKeys!4198 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098085 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36077 0))(
  ( (Unit!36078) )
))
(declare-fun lt!490764 () Unit!36077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71111 (_ BitVec 64) (_ BitVec 32)) Unit!36077)

(assert (=> b!1098085 (= lt!490764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098086 () Bool)

(declare-fun res!732514 () Bool)

(assert (=> b!1098086 (=> (not res!732514) (not e!626863))))

(assert (=> b!1098086 (= res!732514 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23901))))

(declare-fun b!1098087 () Bool)

(declare-fun res!732512 () Bool)

(assert (=> b!1098087 (=> (not res!732512) (not e!626863))))

(assert (=> b!1098087 (= res!732512 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34758 _keys!1070))))))

(declare-fun b!1098088 () Bool)

(declare-fun res!732516 () Bool)

(assert (=> b!1098088 (=> (not res!732516) (not e!626863))))

(assert (=> b!1098088 (= res!732516 (= (select (arr!34221 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42388 () Bool)

(declare-fun tp!81031 () Bool)

(assert (=> mapNonEmpty!42388 (= mapRes!42388 (and tp!81031 e!626862))))

(declare-fun mapKey!42388 () (_ BitVec 32))

(declare-fun mapRest!42388 () (Array (_ BitVec 32) ValueCell!12833))

(declare-fun mapValue!42388 () ValueCell!12833)

(assert (=> mapNonEmpty!42388 (= (arr!34222 _values!874) (store mapRest!42388 mapKey!42388 mapValue!42388))))

(declare-fun res!732517 () Bool)

(assert (=> start!96692 (=> (not res!732517) (not e!626863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96692 (= res!732517 (validMask!0 mask!1414))))

(assert (=> start!96692 e!626863))

(assert (=> start!96692 tp!81032))

(assert (=> start!96692 true))

(assert (=> start!96692 tp_is_empty!27085))

(declare-fun array_inv!26396 (array!71111) Bool)

(assert (=> start!96692 (array_inv!26396 _keys!1070)))

(declare-fun array_inv!26397 (array!71113) Bool)

(assert (=> start!96692 (and (array_inv!26397 _values!874) e!626866)))

(assert (= (and start!96692 res!732517) b!1098078))

(assert (= (and b!1098078 res!732518) b!1098077))

(assert (= (and b!1098077 res!732515) b!1098086))

(assert (= (and b!1098086 res!732514) b!1098087))

(assert (= (and b!1098087 res!732512) b!1098081))

(assert (= (and b!1098081 res!732519) b!1098088))

(assert (= (and b!1098088 res!732516) b!1098082))

(assert (= (and b!1098082 res!732513) b!1098084))

(assert (= (and b!1098084 res!732520) b!1098085))

(assert (= (and b!1098083 condMapEmpty!42388) mapIsEmpty!42388))

(assert (= (and b!1098083 (not condMapEmpty!42388)) mapNonEmpty!42388))

(get-info :version)

(assert (= (and mapNonEmpty!42388 ((_ is ValueCellFull!12833) mapValue!42388)) b!1098080))

(assert (= (and b!1098083 ((_ is ValueCellFull!12833) mapDefault!42388)) b!1098079))

(assert (= start!96692 b!1098083))

(declare-fun b_lambda!17703 () Bool)

(assert (=> (not b_lambda!17703) (not b!1098085)))

(declare-fun t!33976 () Bool)

(declare-fun tb!7893 () Bool)

(assert (=> (and start!96692 (= defaultEntry!882 defaultEntry!882) t!33976) tb!7893))

(declare-fun result!16317 () Bool)

(assert (=> tb!7893 (= result!16317 tp_is_empty!27085)))

(assert (=> b!1098085 t!33976))

(declare-fun b_and!36745 () Bool)

(assert (= b_and!36743 (and (=> t!33976 result!16317) b_and!36745)))

(declare-fun m!1017921 () Bool)

(assert (=> mapNonEmpty!42388 m!1017921))

(declare-fun m!1017923 () Bool)

(assert (=> b!1098082 m!1017923))

(declare-fun m!1017925 () Bool)

(assert (=> b!1098082 m!1017925))

(declare-fun m!1017927 () Bool)

(assert (=> b!1098088 m!1017927))

(declare-fun m!1017929 () Bool)

(assert (=> start!96692 m!1017929))

(declare-fun m!1017931 () Bool)

(assert (=> start!96692 m!1017931))

(declare-fun m!1017933 () Bool)

(assert (=> start!96692 m!1017933))

(declare-fun m!1017935 () Bool)

(assert (=> b!1098077 m!1017935))

(declare-fun m!1017937 () Bool)

(assert (=> b!1098085 m!1017937))

(declare-fun m!1017939 () Bool)

(assert (=> b!1098085 m!1017939))

(declare-fun m!1017941 () Bool)

(assert (=> b!1098085 m!1017941))

(declare-fun m!1017943 () Bool)

(assert (=> b!1098085 m!1017943))

(declare-fun m!1017945 () Bool)

(assert (=> b!1098085 m!1017945))

(declare-fun m!1017947 () Bool)

(assert (=> b!1098085 m!1017947))

(declare-fun m!1017949 () Bool)

(assert (=> b!1098084 m!1017949))

(declare-fun m!1017951 () Bool)

(assert (=> b!1098081 m!1017951))

(declare-fun m!1017953 () Bool)

(assert (=> b!1098086 m!1017953))

(check-sat (not b!1098086) b_and!36745 (not b!1098082) (not b!1098077) (not b_next!23035) (not mapNonEmpty!42388) (not start!96692) (not b!1098084) (not b!1098085) (not b!1098081) (not b_lambda!17703) tp_is_empty!27085)
(check-sat b_and!36745 (not b_next!23035))
