; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96414 () Bool)

(assert start!96414)

(declare-fun b_free!22999 () Bool)

(declare-fun b_next!22999 () Bool)

(assert (=> start!96414 (= b_free!22999 (not b_next!22999))))

(declare-fun tp!80924 () Bool)

(declare-fun b_and!36635 () Bool)

(assert (=> start!96414 (= tp!80924 b_and!36635)))

(declare-fun mapIsEmpty!42334 () Bool)

(declare-fun mapRes!42334 () Bool)

(assert (=> mapIsEmpty!42334 mapRes!42334))

(declare-fun b!1095913 () Bool)

(declare-fun res!731443 () Bool)

(declare-fun e!625594 () Bool)

(assert (=> b!1095913 (=> (not res!731443) (not e!625594))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095913 (= res!731443 (validKeyInArray!0 k0!904))))

(declare-fun b!1095914 () Bool)

(declare-fun res!731435 () Bool)

(assert (=> b!1095914 (=> (not res!731435) (not e!625594))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70922 0))(
  ( (array!70923 (arr!34133 (Array (_ BitVec 32) (_ BitVec 64))) (size!34671 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70922)

(assert (=> b!1095914 (= res!731435 (= (select (arr!34133 _keys!1070) i!650) k0!904))))

(declare-fun b!1095915 () Bool)

(declare-fun res!731437 () Bool)

(declare-fun e!625593 () Bool)

(assert (=> b!1095915 (=> (not res!731437) (not e!625593))))

(declare-fun lt!489831 () array!70922)

(declare-datatypes ((List!23896 0))(
  ( (Nil!23893) (Cons!23892 (h!25101 (_ BitVec 64)) (t!33932 List!23896)) )
))
(declare-fun arrayNoDuplicates!0 (array!70922 (_ BitVec 32) List!23896) Bool)

(assert (=> b!1095915 (= res!731437 (arrayNoDuplicates!0 lt!489831 #b00000000000000000000000000000000 Nil!23893))))

(declare-fun res!731441 () Bool)

(assert (=> start!96414 (=> (not res!731441) (not e!625594))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96414 (= res!731441 (validMask!0 mask!1414))))

(assert (=> start!96414 e!625594))

(assert (=> start!96414 tp!80924))

(assert (=> start!96414 true))

(declare-fun tp_is_empty!27049 () Bool)

(assert (=> start!96414 tp_is_empty!27049))

(declare-fun array_inv!26336 (array!70922) Bool)

(assert (=> start!96414 (array_inv!26336 _keys!1070)))

(declare-datatypes ((V!41193 0))(
  ( (V!41194 (val!13581 Int)) )
))
(declare-datatypes ((ValueCell!12815 0))(
  ( (ValueCellFull!12815 (v!16201 V!41193)) (EmptyCell!12815) )
))
(declare-datatypes ((array!70924 0))(
  ( (array!70925 (arr!34134 (Array (_ BitVec 32) ValueCell!12815)) (size!34672 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70924)

(declare-fun e!625589 () Bool)

(declare-fun array_inv!26337 (array!70924) Bool)

(assert (=> start!96414 (and (array_inv!26337 _values!874) e!625589)))

(declare-fun b!1095916 () Bool)

(assert (=> b!1095916 (= e!625594 e!625593)))

(declare-fun res!731440 () Bool)

(assert (=> b!1095916 (=> (not res!731440) (not e!625593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70922 (_ BitVec 32)) Bool)

(assert (=> b!1095916 (= res!731440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489831 mask!1414))))

(assert (=> b!1095916 (= lt!489831 (array!70923 (store (arr!34133 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34671 _keys!1070)))))

(declare-fun b!1095917 () Bool)

(assert (=> b!1095917 (= e!625593 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41193)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17302 0))(
  ( (tuple2!17303 (_1!8662 (_ BitVec 64)) (_2!8662 V!41193)) )
))
(declare-datatypes ((List!23897 0))(
  ( (Nil!23894) (Cons!23893 (h!25102 tuple2!17302) (t!33933 List!23897)) )
))
(declare-datatypes ((ListLongMap!15271 0))(
  ( (ListLongMap!15272 (toList!7651 List!23897)) )
))
(declare-fun lt!489833 () ListLongMap!15271)

(declare-fun zeroValue!831 () V!41193)

(declare-fun getCurrentListMapNoExtraKeys!4184 (array!70922 array!70924 (_ BitVec 32) (_ BitVec 32) V!41193 V!41193 (_ BitVec 32) Int) ListLongMap!15271)

(declare-fun dynLambda!2253 (Int (_ BitVec 64)) V!41193)

(assert (=> b!1095917 (= lt!489833 (getCurrentListMapNoExtraKeys!4184 lt!489831 (array!70925 (store (arr!34134 _values!874) i!650 (ValueCellFull!12815 (dynLambda!2253 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34672 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489832 () ListLongMap!15271)

(assert (=> b!1095917 (= lt!489832 (getCurrentListMapNoExtraKeys!4184 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095917 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35889 0))(
  ( (Unit!35890) )
))
(declare-fun lt!489830 () Unit!35889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70922 (_ BitVec 64) (_ BitVec 32)) Unit!35889)

(assert (=> b!1095917 (= lt!489830 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42334 () Bool)

(declare-fun tp!80923 () Bool)

(declare-fun e!625590 () Bool)

(assert (=> mapNonEmpty!42334 (= mapRes!42334 (and tp!80923 e!625590))))

(declare-fun mapKey!42334 () (_ BitVec 32))

(declare-fun mapValue!42334 () ValueCell!12815)

(declare-fun mapRest!42334 () (Array (_ BitVec 32) ValueCell!12815))

(assert (=> mapNonEmpty!42334 (= (arr!34134 _values!874) (store mapRest!42334 mapKey!42334 mapValue!42334))))

(declare-fun b!1095918 () Bool)

(declare-fun res!731438 () Bool)

(assert (=> b!1095918 (=> (not res!731438) (not e!625594))))

(assert (=> b!1095918 (= res!731438 (and (= (size!34672 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34671 _keys!1070) (size!34672 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095919 () Bool)

(declare-fun res!731436 () Bool)

(assert (=> b!1095919 (=> (not res!731436) (not e!625594))))

(assert (=> b!1095919 (= res!731436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095920 () Bool)

(declare-fun res!731442 () Bool)

(assert (=> b!1095920 (=> (not res!731442) (not e!625594))))

(assert (=> b!1095920 (= res!731442 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34671 _keys!1070))))))

(declare-fun b!1095921 () Bool)

(declare-fun e!625592 () Bool)

(assert (=> b!1095921 (= e!625592 tp_is_empty!27049)))

(declare-fun b!1095922 () Bool)

(assert (=> b!1095922 (= e!625589 (and e!625592 mapRes!42334))))

(declare-fun condMapEmpty!42334 () Bool)

(declare-fun mapDefault!42334 () ValueCell!12815)

(assert (=> b!1095922 (= condMapEmpty!42334 (= (arr!34134 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12815)) mapDefault!42334)))))

(declare-fun b!1095923 () Bool)

(assert (=> b!1095923 (= e!625590 tp_is_empty!27049)))

(declare-fun b!1095924 () Bool)

(declare-fun res!731439 () Bool)

(assert (=> b!1095924 (=> (not res!731439) (not e!625594))))

(assert (=> b!1095924 (= res!731439 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23893))))

(assert (= (and start!96414 res!731441) b!1095918))

(assert (= (and b!1095918 res!731438) b!1095919))

(assert (= (and b!1095919 res!731436) b!1095924))

(assert (= (and b!1095924 res!731439) b!1095920))

(assert (= (and b!1095920 res!731442) b!1095913))

(assert (= (and b!1095913 res!731443) b!1095914))

(assert (= (and b!1095914 res!731435) b!1095916))

(assert (= (and b!1095916 res!731440) b!1095915))

(assert (= (and b!1095915 res!731437) b!1095917))

(assert (= (and b!1095922 condMapEmpty!42334) mapIsEmpty!42334))

(assert (= (and b!1095922 (not condMapEmpty!42334)) mapNonEmpty!42334))

(get-info :version)

(assert (= (and mapNonEmpty!42334 ((_ is ValueCellFull!12815) mapValue!42334)) b!1095923))

(assert (= (and b!1095922 ((_ is ValueCellFull!12815) mapDefault!42334)) b!1095921))

(assert (= start!96414 b!1095922))

(declare-fun b_lambda!17635 () Bool)

(assert (=> (not b_lambda!17635) (not b!1095917)))

(declare-fun t!33931 () Bool)

(declare-fun tb!7857 () Bool)

(assert (=> (and start!96414 (= defaultEntry!882 defaultEntry!882) t!33931) tb!7857))

(declare-fun result!16245 () Bool)

(assert (=> tb!7857 (= result!16245 tp_is_empty!27049)))

(assert (=> b!1095917 t!33931))

(declare-fun b_and!36637 () Bool)

(assert (= b_and!36635 (and (=> t!33931 result!16245) b_and!36637)))

(declare-fun m!1015011 () Bool)

(assert (=> b!1095919 m!1015011))

(declare-fun m!1015013 () Bool)

(assert (=> b!1095924 m!1015013))

(declare-fun m!1015015 () Bool)

(assert (=> b!1095916 m!1015015))

(declare-fun m!1015017 () Bool)

(assert (=> b!1095916 m!1015017))

(declare-fun m!1015019 () Bool)

(assert (=> b!1095915 m!1015019))

(declare-fun m!1015021 () Bool)

(assert (=> b!1095913 m!1015021))

(declare-fun m!1015023 () Bool)

(assert (=> start!96414 m!1015023))

(declare-fun m!1015025 () Bool)

(assert (=> start!96414 m!1015025))

(declare-fun m!1015027 () Bool)

(assert (=> start!96414 m!1015027))

(declare-fun m!1015029 () Bool)

(assert (=> mapNonEmpty!42334 m!1015029))

(declare-fun m!1015031 () Bool)

(assert (=> b!1095914 m!1015031))

(declare-fun m!1015033 () Bool)

(assert (=> b!1095917 m!1015033))

(declare-fun m!1015035 () Bool)

(assert (=> b!1095917 m!1015035))

(declare-fun m!1015037 () Bool)

(assert (=> b!1095917 m!1015037))

(declare-fun m!1015039 () Bool)

(assert (=> b!1095917 m!1015039))

(declare-fun m!1015041 () Bool)

(assert (=> b!1095917 m!1015041))

(declare-fun m!1015043 () Bool)

(assert (=> b!1095917 m!1015043))

(check-sat tp_is_empty!27049 (not mapNonEmpty!42334) (not b!1095919) (not b_lambda!17635) (not b_next!22999) (not b!1095915) (not b!1095913) (not start!96414) b_and!36637 (not b!1095916) (not b!1095917) (not b!1095924))
(check-sat b_and!36637 (not b_next!22999))
