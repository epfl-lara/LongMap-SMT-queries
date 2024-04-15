; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96408 () Bool)

(assert start!96408)

(declare-fun b_free!22993 () Bool)

(declare-fun b_next!22993 () Bool)

(assert (=> start!96408 (= b_free!22993 (not b_next!22993))))

(declare-fun tp!80905 () Bool)

(declare-fun b_and!36623 () Bool)

(assert (=> start!96408 (= tp!80905 b_and!36623)))

(declare-fun b!1095799 () Bool)

(declare-fun e!625536 () Bool)

(assert (=> b!1095799 (= e!625536 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41185 0))(
  ( (V!41186 (val!13578 Int)) )
))
(declare-fun minValue!831 () V!41185)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17298 0))(
  ( (tuple2!17299 (_1!8660 (_ BitVec 64)) (_2!8660 V!41185)) )
))
(declare-datatypes ((List!23893 0))(
  ( (Nil!23890) (Cons!23889 (h!25098 tuple2!17298) (t!33923 List!23893)) )
))
(declare-datatypes ((ListLongMap!15267 0))(
  ( (ListLongMap!15268 (toList!7649 List!23893)) )
))
(declare-fun lt!489796 () ListLongMap!15267)

(declare-datatypes ((array!70910 0))(
  ( (array!70911 (arr!34127 (Array (_ BitVec 32) (_ BitVec 64))) (size!34665 (_ BitVec 32))) )
))
(declare-fun lt!489795 () array!70910)

(declare-fun zeroValue!831 () V!41185)

(declare-datatypes ((ValueCell!12812 0))(
  ( (ValueCellFull!12812 (v!16198 V!41185)) (EmptyCell!12812) )
))
(declare-datatypes ((array!70912 0))(
  ( (array!70913 (arr!34128 (Array (_ BitVec 32) ValueCell!12812)) (size!34666 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70912)

(declare-fun getCurrentListMapNoExtraKeys!4182 (array!70910 array!70912 (_ BitVec 32) (_ BitVec 32) V!41185 V!41185 (_ BitVec 32) Int) ListLongMap!15267)

(declare-fun dynLambda!2251 (Int (_ BitVec 64)) V!41185)

(assert (=> b!1095799 (= lt!489796 (getCurrentListMapNoExtraKeys!4182 lt!489795 (array!70913 (store (arr!34128 _values!874) i!650 (ValueCellFull!12812 (dynLambda!2251 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34666 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489794 () ListLongMap!15267)

(declare-fun _keys!1070 () array!70910)

(assert (=> b!1095799 (= lt!489794 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095799 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35885 0))(
  ( (Unit!35886) )
))
(declare-fun lt!489797 () Unit!35885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70910 (_ BitVec 64) (_ BitVec 32)) Unit!35885)

(assert (=> b!1095799 (= lt!489797 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095800 () Bool)

(declare-fun e!625540 () Bool)

(declare-fun tp_is_empty!27043 () Bool)

(assert (=> b!1095800 (= e!625540 tp_is_empty!27043)))

(declare-fun b!1095801 () Bool)

(declare-fun e!625538 () Bool)

(assert (=> b!1095801 (= e!625538 tp_is_empty!27043)))

(declare-fun b!1095802 () Bool)

(declare-fun res!731359 () Bool)

(assert (=> b!1095802 (=> (not res!731359) (not e!625536))))

(declare-datatypes ((List!23894 0))(
  ( (Nil!23891) (Cons!23890 (h!25099 (_ BitVec 64)) (t!33924 List!23894)) )
))
(declare-fun arrayNoDuplicates!0 (array!70910 (_ BitVec 32) List!23894) Bool)

(assert (=> b!1095802 (= res!731359 (arrayNoDuplicates!0 lt!489795 #b00000000000000000000000000000000 Nil!23891))))

(declare-fun b!1095803 () Bool)

(declare-fun res!731361 () Bool)

(declare-fun e!625539 () Bool)

(assert (=> b!1095803 (=> (not res!731361) (not e!625539))))

(assert (=> b!1095803 (= res!731361 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23891))))

(declare-fun b!1095804 () Bool)

(assert (=> b!1095804 (= e!625539 e!625536)))

(declare-fun res!731360 () Bool)

(assert (=> b!1095804 (=> (not res!731360) (not e!625536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70910 (_ BitVec 32)) Bool)

(assert (=> b!1095804 (= res!731360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489795 mask!1414))))

(assert (=> b!1095804 (= lt!489795 (array!70911 (store (arr!34127 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34665 _keys!1070)))))

(declare-fun res!731354 () Bool)

(assert (=> start!96408 (=> (not res!731354) (not e!625539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96408 (= res!731354 (validMask!0 mask!1414))))

(assert (=> start!96408 e!625539))

(assert (=> start!96408 tp!80905))

(assert (=> start!96408 true))

(assert (=> start!96408 tp_is_empty!27043))

(declare-fun array_inv!26334 (array!70910) Bool)

(assert (=> start!96408 (array_inv!26334 _keys!1070)))

(declare-fun e!625535 () Bool)

(declare-fun array_inv!26335 (array!70912) Bool)

(assert (=> start!96408 (and (array_inv!26335 _values!874) e!625535)))

(declare-fun b!1095805 () Bool)

(declare-fun mapRes!42325 () Bool)

(assert (=> b!1095805 (= e!625535 (and e!625540 mapRes!42325))))

(declare-fun condMapEmpty!42325 () Bool)

(declare-fun mapDefault!42325 () ValueCell!12812)

(assert (=> b!1095805 (= condMapEmpty!42325 (= (arr!34128 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12812)) mapDefault!42325)))))

(declare-fun b!1095806 () Bool)

(declare-fun res!731357 () Bool)

(assert (=> b!1095806 (=> (not res!731357) (not e!625539))))

(assert (=> b!1095806 (= res!731357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095807 () Bool)

(declare-fun res!731358 () Bool)

(assert (=> b!1095807 (=> (not res!731358) (not e!625539))))

(assert (=> b!1095807 (= res!731358 (and (= (size!34666 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34665 _keys!1070) (size!34666 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42325 () Bool)

(declare-fun tp!80906 () Bool)

(assert (=> mapNonEmpty!42325 (= mapRes!42325 (and tp!80906 e!625538))))

(declare-fun mapRest!42325 () (Array (_ BitVec 32) ValueCell!12812))

(declare-fun mapKey!42325 () (_ BitVec 32))

(declare-fun mapValue!42325 () ValueCell!12812)

(assert (=> mapNonEmpty!42325 (= (arr!34128 _values!874) (store mapRest!42325 mapKey!42325 mapValue!42325))))

(declare-fun b!1095808 () Bool)

(declare-fun res!731362 () Bool)

(assert (=> b!1095808 (=> (not res!731362) (not e!625539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095808 (= res!731362 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42325 () Bool)

(assert (=> mapIsEmpty!42325 mapRes!42325))

(declare-fun b!1095809 () Bool)

(declare-fun res!731356 () Bool)

(assert (=> b!1095809 (=> (not res!731356) (not e!625539))))

(assert (=> b!1095809 (= res!731356 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34665 _keys!1070))))))

(declare-fun b!1095810 () Bool)

(declare-fun res!731355 () Bool)

(assert (=> b!1095810 (=> (not res!731355) (not e!625539))))

(assert (=> b!1095810 (= res!731355 (= (select (arr!34127 _keys!1070) i!650) k0!904))))

(assert (= (and start!96408 res!731354) b!1095807))

(assert (= (and b!1095807 res!731358) b!1095806))

(assert (= (and b!1095806 res!731357) b!1095803))

(assert (= (and b!1095803 res!731361) b!1095809))

(assert (= (and b!1095809 res!731356) b!1095808))

(assert (= (and b!1095808 res!731362) b!1095810))

(assert (= (and b!1095810 res!731355) b!1095804))

(assert (= (and b!1095804 res!731360) b!1095802))

(assert (= (and b!1095802 res!731359) b!1095799))

(assert (= (and b!1095805 condMapEmpty!42325) mapIsEmpty!42325))

(assert (= (and b!1095805 (not condMapEmpty!42325)) mapNonEmpty!42325))

(get-info :version)

(assert (= (and mapNonEmpty!42325 ((_ is ValueCellFull!12812) mapValue!42325)) b!1095801))

(assert (= (and b!1095805 ((_ is ValueCellFull!12812) mapDefault!42325)) b!1095800))

(assert (= start!96408 b!1095805))

(declare-fun b_lambda!17629 () Bool)

(assert (=> (not b_lambda!17629) (not b!1095799)))

(declare-fun t!33922 () Bool)

(declare-fun tb!7851 () Bool)

(assert (=> (and start!96408 (= defaultEntry!882 defaultEntry!882) t!33922) tb!7851))

(declare-fun result!16233 () Bool)

(assert (=> tb!7851 (= result!16233 tp_is_empty!27043)))

(assert (=> b!1095799 t!33922))

(declare-fun b_and!36625 () Bool)

(assert (= b_and!36623 (and (=> t!33922 result!16233) b_and!36625)))

(declare-fun m!1014909 () Bool)

(assert (=> b!1095799 m!1014909))

(declare-fun m!1014911 () Bool)

(assert (=> b!1095799 m!1014911))

(declare-fun m!1014913 () Bool)

(assert (=> b!1095799 m!1014913))

(declare-fun m!1014915 () Bool)

(assert (=> b!1095799 m!1014915))

(declare-fun m!1014917 () Bool)

(assert (=> b!1095799 m!1014917))

(declare-fun m!1014919 () Bool)

(assert (=> b!1095799 m!1014919))

(declare-fun m!1014921 () Bool)

(assert (=> b!1095810 m!1014921))

(declare-fun m!1014923 () Bool)

(assert (=> start!96408 m!1014923))

(declare-fun m!1014925 () Bool)

(assert (=> start!96408 m!1014925))

(declare-fun m!1014927 () Bool)

(assert (=> start!96408 m!1014927))

(declare-fun m!1014929 () Bool)

(assert (=> b!1095808 m!1014929))

(declare-fun m!1014931 () Bool)

(assert (=> b!1095802 m!1014931))

(declare-fun m!1014933 () Bool)

(assert (=> b!1095803 m!1014933))

(declare-fun m!1014935 () Bool)

(assert (=> mapNonEmpty!42325 m!1014935))

(declare-fun m!1014937 () Bool)

(assert (=> b!1095806 m!1014937))

(declare-fun m!1014939 () Bool)

(assert (=> b!1095804 m!1014939))

(declare-fun m!1014941 () Bool)

(assert (=> b!1095804 m!1014941))

(check-sat (not b!1095808) (not b!1095803) (not b!1095806) (not b!1095802) (not b!1095804) (not start!96408) b_and!36625 (not b_lambda!17629) tp_is_empty!27043 (not b!1095799) (not b_next!22993) (not mapNonEmpty!42325))
(check-sat b_and!36625 (not b_next!22993))
