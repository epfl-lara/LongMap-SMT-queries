; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96282 () Bool)

(assert start!96282)

(declare-fun b_free!22935 () Bool)

(declare-fun b_next!22935 () Bool)

(assert (=> start!96282 (= b_free!22935 (not b_next!22935))))

(declare-fun tp!80654 () Bool)

(declare-fun b_and!36545 () Bool)

(assert (=> start!96282 (= tp!80654 b_and!36545)))

(declare-fun b!1094039 () Bool)

(declare-fun res!730087 () Bool)

(declare-fun e!624630 () Bool)

(assert (=> b!1094039 (=> (not res!730087) (not e!624630))))

(declare-datatypes ((array!70789 0))(
  ( (array!70790 (arr!34068 (Array (_ BitVec 32) (_ BitVec 64))) (size!34604 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70789)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70789 (_ BitVec 32)) Bool)

(assert (=> b!1094039 (= res!730087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42160 () Bool)

(declare-fun mapRes!42160 () Bool)

(assert (=> mapIsEmpty!42160 mapRes!42160))

(declare-fun b!1094040 () Bool)

(declare-fun e!624627 () Bool)

(assert (=> b!1094040 (= e!624627 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41043 0))(
  ( (V!41044 (val!13525 Int)) )
))
(declare-fun minValue!831 () V!41043)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17206 0))(
  ( (tuple2!17207 (_1!8614 (_ BitVec 64)) (_2!8614 V!41043)) )
))
(declare-datatypes ((List!23802 0))(
  ( (Nil!23799) (Cons!23798 (h!25007 tuple2!17206) (t!33795 List!23802)) )
))
(declare-datatypes ((ListLongMap!15175 0))(
  ( (ListLongMap!15176 (toList!7603 List!23802)) )
))
(declare-fun lt!489430 () ListLongMap!15175)

(declare-fun zeroValue!831 () V!41043)

(declare-datatypes ((ValueCell!12759 0))(
  ( (ValueCellFull!12759 (v!16146 V!41043)) (EmptyCell!12759) )
))
(declare-datatypes ((array!70791 0))(
  ( (array!70792 (arr!34069 (Array (_ BitVec 32) ValueCell!12759)) (size!34605 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70791)

(declare-fun getCurrentListMap!4359 (array!70789 array!70791 (_ BitVec 32) (_ BitVec 32) V!41043 V!41043 (_ BitVec 32) Int) ListLongMap!15175)

(assert (=> b!1094040 (= lt!489430 (getCurrentListMap!4359 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489428 () array!70791)

(declare-fun lt!489426 () ListLongMap!15175)

(declare-fun lt!489425 () array!70789)

(assert (=> b!1094040 (= lt!489426 (getCurrentListMap!4359 lt!489425 lt!489428 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489427 () ListLongMap!15175)

(declare-fun lt!489423 () ListLongMap!15175)

(assert (=> b!1094040 (and (= lt!489427 lt!489423) (= lt!489423 lt!489427))))

(declare-fun lt!489429 () ListLongMap!15175)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!922 (ListLongMap!15175 (_ BitVec 64)) ListLongMap!15175)

(assert (=> b!1094040 (= lt!489423 (-!922 lt!489429 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36010 0))(
  ( (Unit!36011) )
))
(declare-fun lt!489422 () Unit!36010)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!178 (array!70789 array!70791 (_ BitVec 32) (_ BitVec 32) V!41043 V!41043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36010)

(assert (=> b!1094040 (= lt!489422 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4119 (array!70789 array!70791 (_ BitVec 32) (_ BitVec 32) V!41043 V!41043 (_ BitVec 32) Int) ListLongMap!15175)

(assert (=> b!1094040 (= lt!489427 (getCurrentListMapNoExtraKeys!4119 lt!489425 lt!489428 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2256 (Int (_ BitVec 64)) V!41043)

(assert (=> b!1094040 (= lt!489428 (array!70792 (store (arr!34069 _values!874) i!650 (ValueCellFull!12759 (dynLambda!2256 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34605 _values!874)))))

(assert (=> b!1094040 (= lt!489429 (getCurrentListMapNoExtraKeys!4119 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094040 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489424 () Unit!36010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70789 (_ BitVec 64) (_ BitVec 32)) Unit!36010)

(assert (=> b!1094040 (= lt!489424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094041 () Bool)

(assert (=> b!1094041 (= e!624630 e!624627)))

(declare-fun res!730081 () Bool)

(assert (=> b!1094041 (=> (not res!730081) (not e!624627))))

(assert (=> b!1094041 (= res!730081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489425 mask!1414))))

(assert (=> b!1094041 (= lt!489425 (array!70790 (store (arr!34068 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34604 _keys!1070)))))

(declare-fun b!1094042 () Bool)

(declare-fun e!624632 () Bool)

(declare-fun tp_is_empty!26937 () Bool)

(assert (=> b!1094042 (= e!624632 tp_is_empty!26937)))

(declare-fun res!730086 () Bool)

(assert (=> start!96282 (=> (not res!730086) (not e!624630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96282 (= res!730086 (validMask!0 mask!1414))))

(assert (=> start!96282 e!624630))

(assert (=> start!96282 tp!80654))

(assert (=> start!96282 true))

(assert (=> start!96282 tp_is_empty!26937))

(declare-fun array_inv!26256 (array!70789) Bool)

(assert (=> start!96282 (array_inv!26256 _keys!1070)))

(declare-fun e!624629 () Bool)

(declare-fun array_inv!26257 (array!70791) Bool)

(assert (=> start!96282 (and (array_inv!26257 _values!874) e!624629)))

(declare-fun b!1094043 () Bool)

(declare-fun res!730088 () Bool)

(assert (=> b!1094043 (=> (not res!730088) (not e!624630))))

(assert (=> b!1094043 (= res!730088 (= (select (arr!34068 _keys!1070) i!650) k0!904))))

(declare-fun b!1094044 () Bool)

(declare-fun res!730084 () Bool)

(assert (=> b!1094044 (=> (not res!730084) (not e!624630))))

(assert (=> b!1094044 (= res!730084 (and (= (size!34605 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34604 _keys!1070) (size!34605 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42160 () Bool)

(declare-fun tp!80653 () Bool)

(declare-fun e!624628 () Bool)

(assert (=> mapNonEmpty!42160 (= mapRes!42160 (and tp!80653 e!624628))))

(declare-fun mapKey!42160 () (_ BitVec 32))

(declare-fun mapRest!42160 () (Array (_ BitVec 32) ValueCell!12759))

(declare-fun mapValue!42160 () ValueCell!12759)

(assert (=> mapNonEmpty!42160 (= (arr!34069 _values!874) (store mapRest!42160 mapKey!42160 mapValue!42160))))

(declare-fun b!1094045 () Bool)

(assert (=> b!1094045 (= e!624629 (and e!624632 mapRes!42160))))

(declare-fun condMapEmpty!42160 () Bool)

(declare-fun mapDefault!42160 () ValueCell!12759)

(assert (=> b!1094045 (= condMapEmpty!42160 (= (arr!34069 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12759)) mapDefault!42160)))))

(declare-fun b!1094046 () Bool)

(assert (=> b!1094046 (= e!624628 tp_is_empty!26937)))

(declare-fun b!1094047 () Bool)

(declare-fun res!730082 () Bool)

(assert (=> b!1094047 (=> (not res!730082) (not e!624630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094047 (= res!730082 (validKeyInArray!0 k0!904))))

(declare-fun b!1094048 () Bool)

(declare-fun res!730089 () Bool)

(assert (=> b!1094048 (=> (not res!730089) (not e!624627))))

(declare-datatypes ((List!23803 0))(
  ( (Nil!23800) (Cons!23799 (h!25008 (_ BitVec 64)) (t!33796 List!23803)) )
))
(declare-fun arrayNoDuplicates!0 (array!70789 (_ BitVec 32) List!23803) Bool)

(assert (=> b!1094048 (= res!730089 (arrayNoDuplicates!0 lt!489425 #b00000000000000000000000000000000 Nil!23800))))

(declare-fun b!1094049 () Bool)

(declare-fun res!730083 () Bool)

(assert (=> b!1094049 (=> (not res!730083) (not e!624630))))

(assert (=> b!1094049 (= res!730083 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23800))))

(declare-fun b!1094050 () Bool)

(declare-fun res!730085 () Bool)

(assert (=> b!1094050 (=> (not res!730085) (not e!624630))))

(assert (=> b!1094050 (= res!730085 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34604 _keys!1070))))))

(assert (= (and start!96282 res!730086) b!1094044))

(assert (= (and b!1094044 res!730084) b!1094039))

(assert (= (and b!1094039 res!730087) b!1094049))

(assert (= (and b!1094049 res!730083) b!1094050))

(assert (= (and b!1094050 res!730085) b!1094047))

(assert (= (and b!1094047 res!730082) b!1094043))

(assert (= (and b!1094043 res!730088) b!1094041))

(assert (= (and b!1094041 res!730081) b!1094048))

(assert (= (and b!1094048 res!730089) b!1094040))

(assert (= (and b!1094045 condMapEmpty!42160) mapIsEmpty!42160))

(assert (= (and b!1094045 (not condMapEmpty!42160)) mapNonEmpty!42160))

(get-info :version)

(assert (= (and mapNonEmpty!42160 ((_ is ValueCellFull!12759) mapValue!42160)) b!1094046))

(assert (= (and b!1094045 ((_ is ValueCellFull!12759) mapDefault!42160)) b!1094042))

(assert (= start!96282 b!1094045))

(declare-fun b_lambda!17605 () Bool)

(assert (=> (not b_lambda!17605) (not b!1094040)))

(declare-fun t!33794 () Bool)

(declare-fun tb!7813 () Bool)

(assert (=> (and start!96282 (= defaultEntry!882 defaultEntry!882) t!33794) tb!7813))

(declare-fun result!16145 () Bool)

(assert (=> tb!7813 (= result!16145 tp_is_empty!26937)))

(assert (=> b!1094040 t!33794))

(declare-fun b_and!36547 () Bool)

(assert (= b_and!36545 (and (=> t!33794 result!16145) b_and!36547)))

(declare-fun m!1013971 () Bool)

(assert (=> b!1094039 m!1013971))

(declare-fun m!1013973 () Bool)

(assert (=> b!1094041 m!1013973))

(declare-fun m!1013975 () Bool)

(assert (=> b!1094041 m!1013975))

(declare-fun m!1013977 () Bool)

(assert (=> start!96282 m!1013977))

(declare-fun m!1013979 () Bool)

(assert (=> start!96282 m!1013979))

(declare-fun m!1013981 () Bool)

(assert (=> start!96282 m!1013981))

(declare-fun m!1013983 () Bool)

(assert (=> b!1094047 m!1013983))

(declare-fun m!1013985 () Bool)

(assert (=> b!1094043 m!1013985))

(declare-fun m!1013987 () Bool)

(assert (=> b!1094040 m!1013987))

(declare-fun m!1013989 () Bool)

(assert (=> b!1094040 m!1013989))

(declare-fun m!1013991 () Bool)

(assert (=> b!1094040 m!1013991))

(declare-fun m!1013993 () Bool)

(assert (=> b!1094040 m!1013993))

(declare-fun m!1013995 () Bool)

(assert (=> b!1094040 m!1013995))

(declare-fun m!1013997 () Bool)

(assert (=> b!1094040 m!1013997))

(declare-fun m!1013999 () Bool)

(assert (=> b!1094040 m!1013999))

(declare-fun m!1014001 () Bool)

(assert (=> b!1094040 m!1014001))

(declare-fun m!1014003 () Bool)

(assert (=> b!1094040 m!1014003))

(declare-fun m!1014005 () Bool)

(assert (=> b!1094040 m!1014005))

(declare-fun m!1014007 () Bool)

(assert (=> mapNonEmpty!42160 m!1014007))

(declare-fun m!1014009 () Bool)

(assert (=> b!1094049 m!1014009))

(declare-fun m!1014011 () Bool)

(assert (=> b!1094048 m!1014011))

(check-sat (not b!1094039) (not b!1094040) (not b_next!22935) (not b!1094041) tp_is_empty!26937 b_and!36547 (not b!1094049) (not b!1094048) (not b_lambda!17605) (not start!96282) (not mapNonEmpty!42160) (not b!1094047))
(check-sat b_and!36547 (not b_next!22935))
