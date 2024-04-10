; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96452 () Bool)

(assert start!96452)

(declare-fun b_free!23031 () Bool)

(declare-fun b_next!23031 () Bool)

(assert (=> start!96452 (= b_free!23031 (not b_next!23031))))

(declare-fun tp!81019 () Bool)

(declare-fun b_and!36725 () Bool)

(assert (=> start!96452 (= tp!81019 b_and!36725)))

(declare-fun res!731936 () Bool)

(declare-fun e!625970 () Bool)

(assert (=> start!96452 (=> (not res!731936) (not e!625970))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96452 (= res!731936 (validMask!0 mask!1414))))

(assert (=> start!96452 e!625970))

(assert (=> start!96452 tp!81019))

(assert (=> start!96452 true))

(declare-fun tp_is_empty!27081 () Bool)

(assert (=> start!96452 tp_is_empty!27081))

(declare-datatypes ((array!71075 0))(
  ( (array!71076 (arr!34209 (Array (_ BitVec 32) (_ BitVec 64))) (size!34745 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71075)

(declare-fun array_inv!26356 (array!71075) Bool)

(assert (=> start!96452 (array_inv!26356 _keys!1070)))

(declare-datatypes ((V!41235 0))(
  ( (V!41236 (val!13597 Int)) )
))
(declare-datatypes ((ValueCell!12831 0))(
  ( (ValueCellFull!12831 (v!16218 V!41235)) (EmptyCell!12831) )
))
(declare-datatypes ((array!71077 0))(
  ( (array!71078 (arr!34210 (Array (_ BitVec 32) ValueCell!12831)) (size!34746 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71077)

(declare-fun e!625975 () Bool)

(declare-fun array_inv!26357 (array!71077) Bool)

(assert (=> start!96452 (and (array_inv!26357 _values!874) e!625975)))

(declare-fun b!1096674 () Bool)

(declare-fun res!731940 () Bool)

(assert (=> b!1096674 (=> (not res!731940) (not e!625970))))

(declare-datatypes ((List!23890 0))(
  ( (Nil!23887) (Cons!23886 (h!25095 (_ BitVec 64)) (t!33967 List!23890)) )
))
(declare-fun arrayNoDuplicates!0 (array!71075 (_ BitVec 32) List!23890) Bool)

(assert (=> b!1096674 (= res!731940 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23887))))

(declare-fun b!1096675 () Bool)

(declare-fun res!731938 () Bool)

(assert (=> b!1096675 (=> (not res!731938) (not e!625970))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096675 (= res!731938 (validKeyInArray!0 k0!904))))

(declare-fun b!1096676 () Bool)

(declare-fun e!625972 () Bool)

(declare-fun mapRes!42382 () Bool)

(assert (=> b!1096676 (= e!625975 (and e!625972 mapRes!42382))))

(declare-fun condMapEmpty!42382 () Bool)

(declare-fun mapDefault!42382 () ValueCell!12831)

(assert (=> b!1096676 (= condMapEmpty!42382 (= (arr!34210 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12831)) mapDefault!42382)))))

(declare-fun b!1096677 () Bool)

(declare-fun res!731939 () Bool)

(assert (=> b!1096677 (=> (not res!731939) (not e!625970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71075 (_ BitVec 32)) Bool)

(assert (=> b!1096677 (= res!731939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096678 () Bool)

(assert (=> b!1096678 (= e!625972 tp_is_empty!27081)))

(declare-fun b!1096679 () Bool)

(declare-fun e!625973 () Bool)

(assert (=> b!1096679 (= e!625973 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!490222 () array!71075)

(declare-fun minValue!831 () V!41235)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17268 0))(
  ( (tuple2!17269 (_1!8645 (_ BitVec 64)) (_2!8645 V!41235)) )
))
(declare-datatypes ((List!23891 0))(
  ( (Nil!23888) (Cons!23887 (h!25096 tuple2!17268) (t!33968 List!23891)) )
))
(declare-datatypes ((ListLongMap!15237 0))(
  ( (ListLongMap!15238 (toList!7634 List!23891)) )
))
(declare-fun lt!490223 () ListLongMap!15237)

(declare-fun zeroValue!831 () V!41235)

(declare-fun getCurrentListMapNoExtraKeys!4150 (array!71075 array!71077 (_ BitVec 32) (_ BitVec 32) V!41235 V!41235 (_ BitVec 32) Int) ListLongMap!15237)

(declare-fun dynLambda!2285 (Int (_ BitVec 64)) V!41235)

(assert (=> b!1096679 (= lt!490223 (getCurrentListMapNoExtraKeys!4150 lt!490222 (array!71078 (store (arr!34210 _values!874) i!650 (ValueCellFull!12831 (dynLambda!2285 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34746 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490224 () ListLongMap!15237)

(assert (=> b!1096679 (= lt!490224 (getCurrentListMapNoExtraKeys!4150 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096679 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36080 0))(
  ( (Unit!36081) )
))
(declare-fun lt!490225 () Unit!36080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71075 (_ BitVec 64) (_ BitVec 32)) Unit!36080)

(assert (=> b!1096679 (= lt!490225 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42382 () Bool)

(declare-fun tp!81020 () Bool)

(declare-fun e!625974 () Bool)

(assert (=> mapNonEmpty!42382 (= mapRes!42382 (and tp!81020 e!625974))))

(declare-fun mapKey!42382 () (_ BitVec 32))

(declare-fun mapValue!42382 () ValueCell!12831)

(declare-fun mapRest!42382 () (Array (_ BitVec 32) ValueCell!12831))

(assert (=> mapNonEmpty!42382 (= (arr!34210 _values!874) (store mapRest!42382 mapKey!42382 mapValue!42382))))

(declare-fun b!1096680 () Bool)

(assert (=> b!1096680 (= e!625970 e!625973)))

(declare-fun res!731943 () Bool)

(assert (=> b!1096680 (=> (not res!731943) (not e!625973))))

(assert (=> b!1096680 (= res!731943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490222 mask!1414))))

(assert (=> b!1096680 (= lt!490222 (array!71076 (store (arr!34209 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34745 _keys!1070)))))

(declare-fun b!1096681 () Bool)

(declare-fun res!731941 () Bool)

(assert (=> b!1096681 (=> (not res!731941) (not e!625970))))

(assert (=> b!1096681 (= res!731941 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34745 _keys!1070))))))

(declare-fun b!1096682 () Bool)

(declare-fun res!731942 () Bool)

(assert (=> b!1096682 (=> (not res!731942) (not e!625970))))

(assert (=> b!1096682 (= res!731942 (and (= (size!34746 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34745 _keys!1070) (size!34746 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096683 () Bool)

(declare-fun res!731937 () Bool)

(assert (=> b!1096683 (=> (not res!731937) (not e!625973))))

(assert (=> b!1096683 (= res!731937 (arrayNoDuplicates!0 lt!490222 #b00000000000000000000000000000000 Nil!23887))))

(declare-fun b!1096684 () Bool)

(assert (=> b!1096684 (= e!625974 tp_is_empty!27081)))

(declare-fun b!1096685 () Bool)

(declare-fun res!731944 () Bool)

(assert (=> b!1096685 (=> (not res!731944) (not e!625970))))

(assert (=> b!1096685 (= res!731944 (= (select (arr!34209 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42382 () Bool)

(assert (=> mapIsEmpty!42382 mapRes!42382))

(assert (= (and start!96452 res!731936) b!1096682))

(assert (= (and b!1096682 res!731942) b!1096677))

(assert (= (and b!1096677 res!731939) b!1096674))

(assert (= (and b!1096674 res!731940) b!1096681))

(assert (= (and b!1096681 res!731941) b!1096675))

(assert (= (and b!1096675 res!731938) b!1096685))

(assert (= (and b!1096685 res!731944) b!1096680))

(assert (= (and b!1096680 res!731943) b!1096683))

(assert (= (and b!1096683 res!731937) b!1096679))

(assert (= (and b!1096676 condMapEmpty!42382) mapIsEmpty!42382))

(assert (= (and b!1096676 (not condMapEmpty!42382)) mapNonEmpty!42382))

(get-info :version)

(assert (= (and mapNonEmpty!42382 ((_ is ValueCellFull!12831) mapValue!42382)) b!1096684))

(assert (= (and b!1096676 ((_ is ValueCellFull!12831) mapDefault!42382)) b!1096678))

(assert (= start!96452 b!1096676))

(declare-fun b_lambda!17689 () Bool)

(assert (=> (not b_lambda!17689) (not b!1096679)))

(declare-fun t!33966 () Bool)

(declare-fun tb!7897 () Bool)

(assert (=> (and start!96452 (= defaultEntry!882 defaultEntry!882) t!33966) tb!7897))

(declare-fun result!16317 () Bool)

(assert (=> tb!7897 (= result!16317 tp_is_empty!27081)))

(assert (=> b!1096679 t!33966))

(declare-fun b_and!36727 () Bool)

(assert (= b_and!36725 (and (=> t!33966 result!16317) b_and!36727)))

(declare-fun m!1016181 () Bool)

(assert (=> b!1096675 m!1016181))

(declare-fun m!1016183 () Bool)

(assert (=> b!1096683 m!1016183))

(declare-fun m!1016185 () Bool)

(assert (=> b!1096674 m!1016185))

(declare-fun m!1016187 () Bool)

(assert (=> mapNonEmpty!42382 m!1016187))

(declare-fun m!1016189 () Bool)

(assert (=> start!96452 m!1016189))

(declare-fun m!1016191 () Bool)

(assert (=> start!96452 m!1016191))

(declare-fun m!1016193 () Bool)

(assert (=> start!96452 m!1016193))

(declare-fun m!1016195 () Bool)

(assert (=> b!1096677 m!1016195))

(declare-fun m!1016197 () Bool)

(assert (=> b!1096679 m!1016197))

(declare-fun m!1016199 () Bool)

(assert (=> b!1096679 m!1016199))

(declare-fun m!1016201 () Bool)

(assert (=> b!1096679 m!1016201))

(declare-fun m!1016203 () Bool)

(assert (=> b!1096679 m!1016203))

(declare-fun m!1016205 () Bool)

(assert (=> b!1096679 m!1016205))

(declare-fun m!1016207 () Bool)

(assert (=> b!1096679 m!1016207))

(declare-fun m!1016209 () Bool)

(assert (=> b!1096680 m!1016209))

(declare-fun m!1016211 () Bool)

(assert (=> b!1096680 m!1016211))

(declare-fun m!1016213 () Bool)

(assert (=> b!1096685 m!1016213))

(check-sat (not start!96452) (not b!1096674) (not b!1096680) (not b_lambda!17689) (not b!1096677) tp_is_empty!27081 b_and!36727 (not b!1096679) (not b_next!23031) (not b!1096683) (not mapNonEmpty!42382) (not b!1096675))
(check-sat b_and!36727 (not b_next!23031))
