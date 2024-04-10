; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96276 () Bool)

(assert start!96276)

(declare-fun b_free!22929 () Bool)

(declare-fun b_next!22929 () Bool)

(assert (=> start!96276 (= b_free!22929 (not b_next!22929))))

(declare-fun tp!80636 () Bool)

(declare-fun b_and!36533 () Bool)

(assert (=> start!96276 (= tp!80636 b_and!36533)))

(declare-fun b!1093925 () Bool)

(declare-fun res!730008 () Bool)

(declare-fun e!624578 () Bool)

(assert (=> b!1093925 (=> (not res!730008) (not e!624578))))

(declare-datatypes ((array!70777 0))(
  ( (array!70778 (arr!34062 (Array (_ BitVec 32) (_ BitVec 64))) (size!34598 (_ BitVec 32))) )
))
(declare-fun lt!489344 () array!70777)

(declare-datatypes ((List!23797 0))(
  ( (Nil!23794) (Cons!23793 (h!25002 (_ BitVec 64)) (t!33784 List!23797)) )
))
(declare-fun arrayNoDuplicates!0 (array!70777 (_ BitVec 32) List!23797) Bool)

(assert (=> b!1093925 (= res!730008 (arrayNoDuplicates!0 lt!489344 #b00000000000000000000000000000000 Nil!23794))))

(declare-fun b!1093926 () Bool)

(declare-fun e!624575 () Bool)

(assert (=> b!1093926 (= e!624575 e!624578)))

(declare-fun res!730002 () Bool)

(assert (=> b!1093926 (=> (not res!730002) (not e!624578))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70777 (_ BitVec 32)) Bool)

(assert (=> b!1093926 (= res!730002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489344 mask!1414))))

(declare-fun _keys!1070 () array!70777)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093926 (= lt!489344 (array!70778 (store (arr!34062 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34598 _keys!1070)))))

(declare-fun b!1093927 () Bool)

(declare-fun res!730001 () Bool)

(assert (=> b!1093927 (=> (not res!730001) (not e!624575))))

(assert (=> b!1093927 (= res!730001 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23794))))

(declare-fun b!1093928 () Bool)

(declare-fun e!624577 () Bool)

(declare-fun e!624576 () Bool)

(declare-fun mapRes!42151 () Bool)

(assert (=> b!1093928 (= e!624577 (and e!624576 mapRes!42151))))

(declare-fun condMapEmpty!42151 () Bool)

(declare-datatypes ((V!41035 0))(
  ( (V!41036 (val!13522 Int)) )
))
(declare-datatypes ((ValueCell!12756 0))(
  ( (ValueCellFull!12756 (v!16143 V!41035)) (EmptyCell!12756) )
))
(declare-datatypes ((array!70779 0))(
  ( (array!70780 (arr!34063 (Array (_ BitVec 32) ValueCell!12756)) (size!34599 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70779)

(declare-fun mapDefault!42151 () ValueCell!12756)

(assert (=> b!1093928 (= condMapEmpty!42151 (= (arr!34063 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12756)) mapDefault!42151)))))

(declare-fun b!1093929 () Bool)

(declare-fun res!730004 () Bool)

(assert (=> b!1093929 (=> (not res!730004) (not e!624575))))

(assert (=> b!1093929 (= res!730004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!730006 () Bool)

(assert (=> start!96276 (=> (not res!730006) (not e!624575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96276 (= res!730006 (validMask!0 mask!1414))))

(assert (=> start!96276 e!624575))

(assert (=> start!96276 tp!80636))

(assert (=> start!96276 true))

(declare-fun tp_is_empty!26931 () Bool)

(assert (=> start!96276 tp_is_empty!26931))

(declare-fun array_inv!26250 (array!70777) Bool)

(assert (=> start!96276 (array_inv!26250 _keys!1070)))

(declare-fun array_inv!26251 (array!70779) Bool)

(assert (=> start!96276 (and (array_inv!26251 _values!874) e!624577)))

(declare-fun mapNonEmpty!42151 () Bool)

(declare-fun tp!80635 () Bool)

(declare-fun e!624573 () Bool)

(assert (=> mapNonEmpty!42151 (= mapRes!42151 (and tp!80635 e!624573))))

(declare-fun mapKey!42151 () (_ BitVec 32))

(declare-fun mapRest!42151 () (Array (_ BitVec 32) ValueCell!12756))

(declare-fun mapValue!42151 () ValueCell!12756)

(assert (=> mapNonEmpty!42151 (= (arr!34063 _values!874) (store mapRest!42151 mapKey!42151 mapValue!42151))))

(declare-fun b!1093930 () Bool)

(assert (=> b!1093930 (= e!624576 tp_is_empty!26931)))

(declare-fun mapIsEmpty!42151 () Bool)

(assert (=> mapIsEmpty!42151 mapRes!42151))

(declare-fun b!1093931 () Bool)

(declare-fun res!730003 () Bool)

(assert (=> b!1093931 (=> (not res!730003) (not e!624575))))

(assert (=> b!1093931 (= res!730003 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34598 _keys!1070))))))

(declare-fun b!1093932 () Bool)

(assert (=> b!1093932 (= e!624578 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41035)

(declare-fun zeroValue!831 () V!41035)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17200 0))(
  ( (tuple2!17201 (_1!8611 (_ BitVec 64)) (_2!8611 V!41035)) )
))
(declare-datatypes ((List!23798 0))(
  ( (Nil!23795) (Cons!23794 (h!25003 tuple2!17200) (t!33785 List!23798)) )
))
(declare-datatypes ((ListLongMap!15169 0))(
  ( (ListLongMap!15170 (toList!7600 List!23798)) )
))
(declare-fun lt!489346 () ListLongMap!15169)

(declare-fun getCurrentListMap!4356 (array!70777 array!70779 (_ BitVec 32) (_ BitVec 32) V!41035 V!41035 (_ BitVec 32) Int) ListLongMap!15169)

(assert (=> b!1093932 (= lt!489346 (getCurrentListMap!4356 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489342 () array!70779)

(declare-fun lt!489345 () ListLongMap!15169)

(assert (=> b!1093932 (= lt!489345 (getCurrentListMap!4356 lt!489344 lt!489342 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489343 () ListLongMap!15169)

(declare-fun lt!489341 () ListLongMap!15169)

(assert (=> b!1093932 (and (= lt!489343 lt!489341) (= lt!489341 lt!489343))))

(declare-fun lt!489348 () ListLongMap!15169)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!919 (ListLongMap!15169 (_ BitVec 64)) ListLongMap!15169)

(assert (=> b!1093932 (= lt!489341 (-!919 lt!489348 k0!904))))

(declare-datatypes ((Unit!36004 0))(
  ( (Unit!36005) )
))
(declare-fun lt!489349 () Unit!36004)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!175 (array!70777 array!70779 (_ BitVec 32) (_ BitVec 32) V!41035 V!41035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36004)

(assert (=> b!1093932 (= lt!489349 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!175 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4116 (array!70777 array!70779 (_ BitVec 32) (_ BitVec 32) V!41035 V!41035 (_ BitVec 32) Int) ListLongMap!15169)

(assert (=> b!1093932 (= lt!489343 (getCurrentListMapNoExtraKeys!4116 lt!489344 lt!489342 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2253 (Int (_ BitVec 64)) V!41035)

(assert (=> b!1093932 (= lt!489342 (array!70780 (store (arr!34063 _values!874) i!650 (ValueCellFull!12756 (dynLambda!2253 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34599 _values!874)))))

(assert (=> b!1093932 (= lt!489348 (getCurrentListMapNoExtraKeys!4116 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093932 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489347 () Unit!36004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70777 (_ BitVec 64) (_ BitVec 32)) Unit!36004)

(assert (=> b!1093932 (= lt!489347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093933 () Bool)

(declare-fun res!730005 () Bool)

(assert (=> b!1093933 (=> (not res!730005) (not e!624575))))

(assert (=> b!1093933 (= res!730005 (and (= (size!34599 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34598 _keys!1070) (size!34599 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093934 () Bool)

(declare-fun res!730007 () Bool)

(assert (=> b!1093934 (=> (not res!730007) (not e!624575))))

(assert (=> b!1093934 (= res!730007 (= (select (arr!34062 _keys!1070) i!650) k0!904))))

(declare-fun b!1093935 () Bool)

(assert (=> b!1093935 (= e!624573 tp_is_empty!26931)))

(declare-fun b!1093936 () Bool)

(declare-fun res!730000 () Bool)

(assert (=> b!1093936 (=> (not res!730000) (not e!624575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093936 (= res!730000 (validKeyInArray!0 k0!904))))

(assert (= (and start!96276 res!730006) b!1093933))

(assert (= (and b!1093933 res!730005) b!1093929))

(assert (= (and b!1093929 res!730004) b!1093927))

(assert (= (and b!1093927 res!730001) b!1093931))

(assert (= (and b!1093931 res!730003) b!1093936))

(assert (= (and b!1093936 res!730000) b!1093934))

(assert (= (and b!1093934 res!730007) b!1093926))

(assert (= (and b!1093926 res!730002) b!1093925))

(assert (= (and b!1093925 res!730008) b!1093932))

(assert (= (and b!1093928 condMapEmpty!42151) mapIsEmpty!42151))

(assert (= (and b!1093928 (not condMapEmpty!42151)) mapNonEmpty!42151))

(get-info :version)

(assert (= (and mapNonEmpty!42151 ((_ is ValueCellFull!12756) mapValue!42151)) b!1093935))

(assert (= (and b!1093928 ((_ is ValueCellFull!12756) mapDefault!42151)) b!1093930))

(assert (= start!96276 b!1093928))

(declare-fun b_lambda!17599 () Bool)

(assert (=> (not b_lambda!17599) (not b!1093932)))

(declare-fun t!33783 () Bool)

(declare-fun tb!7807 () Bool)

(assert (=> (and start!96276 (= defaultEntry!882 defaultEntry!882) t!33783) tb!7807))

(declare-fun result!16133 () Bool)

(assert (=> tb!7807 (= result!16133 tp_is_empty!26931)))

(assert (=> b!1093932 t!33783))

(declare-fun b_and!36535 () Bool)

(assert (= b_and!36533 (and (=> t!33783 result!16133) b_and!36535)))

(declare-fun m!1013845 () Bool)

(assert (=> b!1093925 m!1013845))

(declare-fun m!1013847 () Bool)

(assert (=> b!1093932 m!1013847))

(declare-fun m!1013849 () Bool)

(assert (=> b!1093932 m!1013849))

(declare-fun m!1013851 () Bool)

(assert (=> b!1093932 m!1013851))

(declare-fun m!1013853 () Bool)

(assert (=> b!1093932 m!1013853))

(declare-fun m!1013855 () Bool)

(assert (=> b!1093932 m!1013855))

(declare-fun m!1013857 () Bool)

(assert (=> b!1093932 m!1013857))

(declare-fun m!1013859 () Bool)

(assert (=> b!1093932 m!1013859))

(declare-fun m!1013861 () Bool)

(assert (=> b!1093932 m!1013861))

(declare-fun m!1013863 () Bool)

(assert (=> b!1093932 m!1013863))

(declare-fun m!1013865 () Bool)

(assert (=> b!1093932 m!1013865))

(declare-fun m!1013867 () Bool)

(assert (=> b!1093934 m!1013867))

(declare-fun m!1013869 () Bool)

(assert (=> b!1093929 m!1013869))

(declare-fun m!1013871 () Bool)

(assert (=> start!96276 m!1013871))

(declare-fun m!1013873 () Bool)

(assert (=> start!96276 m!1013873))

(declare-fun m!1013875 () Bool)

(assert (=> start!96276 m!1013875))

(declare-fun m!1013877 () Bool)

(assert (=> b!1093927 m!1013877))

(declare-fun m!1013879 () Bool)

(assert (=> mapNonEmpty!42151 m!1013879))

(declare-fun m!1013881 () Bool)

(assert (=> b!1093926 m!1013881))

(declare-fun m!1013883 () Bool)

(assert (=> b!1093926 m!1013883))

(declare-fun m!1013885 () Bool)

(assert (=> b!1093936 m!1013885))

(check-sat (not b!1093932) b_and!36535 (not start!96276) (not mapNonEmpty!42151) (not b!1093927) (not b!1093926) tp_is_empty!26931 (not b_next!22929) (not b!1093929) (not b_lambda!17599) (not b!1093936) (not b!1093925))
(check-sat b_and!36535 (not b_next!22929))
