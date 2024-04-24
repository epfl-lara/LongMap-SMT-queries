; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96632 () Bool)

(assert start!96632)

(declare-fun b_free!22975 () Bool)

(declare-fun b_next!22975 () Bool)

(assert (=> start!96632 (= b_free!22975 (not b_next!22975))))

(declare-fun tp!80851 () Bool)

(declare-fun b_and!36623 () Bool)

(assert (=> start!96632 (= tp!80851 b_and!36623)))

(declare-fun b!1096937 () Bool)

(declare-fun e!626325 () Bool)

(declare-fun tp_is_empty!27025 () Bool)

(assert (=> b!1096937 (= e!626325 tp_is_empty!27025)))

(declare-fun mapNonEmpty!42298 () Bool)

(declare-fun mapRes!42298 () Bool)

(declare-fun tp!80852 () Bool)

(assert (=> mapNonEmpty!42298 (= mapRes!42298 (and tp!80852 e!626325))))

(declare-datatypes ((V!41161 0))(
  ( (V!41162 (val!13569 Int)) )
))
(declare-datatypes ((ValueCell!12803 0))(
  ( (ValueCellFull!12803 (v!16186 V!41161)) (EmptyCell!12803) )
))
(declare-datatypes ((array!70995 0))(
  ( (array!70996 (arr!34163 (Array (_ BitVec 32) ValueCell!12803)) (size!34700 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70995)

(declare-fun mapValue!42298 () ValueCell!12803)

(declare-fun mapKey!42298 () (_ BitVec 32))

(declare-fun mapRest!42298 () (Array (_ BitVec 32) ValueCell!12803))

(assert (=> mapNonEmpty!42298 (= (arr!34163 _values!874) (store mapRest!42298 mapKey!42298 mapValue!42298))))

(declare-fun b!1096938 () Bool)

(declare-fun res!731702 () Bool)

(declare-fun e!626324 () Bool)

(assert (=> b!1096938 (=> (not res!731702) (not e!626324))))

(declare-datatypes ((array!70997 0))(
  ( (array!70998 (arr!34164 (Array (_ BitVec 32) (_ BitVec 64))) (size!34701 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70997)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096938 (= res!731702 (= (select (arr!34164 _keys!1070) i!650) k0!904))))

(declare-fun b!1096940 () Bool)

(declare-fun e!626323 () Bool)

(assert (=> b!1096940 (= e!626324 e!626323)))

(declare-fun res!731709 () Bool)

(assert (=> b!1096940 (=> (not res!731709) (not e!626323))))

(declare-fun lt!490404 () array!70997)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70997 (_ BitVec 32)) Bool)

(assert (=> b!1096940 (= res!731709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490404 mask!1414))))

(assert (=> b!1096940 (= lt!490404 (array!70998 (store (arr!34164 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34701 _keys!1070)))))

(declare-fun b!1096941 () Bool)

(declare-fun res!731708 () Bool)

(assert (=> b!1096941 (=> (not res!731708) (not e!626324))))

(assert (=> b!1096941 (= res!731708 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34701 _keys!1070))))))

(declare-fun b!1096942 () Bool)

(declare-fun res!731703 () Bool)

(assert (=> b!1096942 (=> (not res!731703) (not e!626323))))

(declare-datatypes ((List!23859 0))(
  ( (Nil!23856) (Cons!23855 (h!25073 (_ BitVec 64)) (t!33872 List!23859)) )
))
(declare-fun arrayNoDuplicates!0 (array!70997 (_ BitVec 32) List!23859) Bool)

(assert (=> b!1096942 (= res!731703 (arrayNoDuplicates!0 lt!490404 #b00000000000000000000000000000000 Nil!23856))))

(declare-fun b!1096943 () Bool)

(declare-fun e!626322 () Bool)

(declare-fun e!626326 () Bool)

(assert (=> b!1096943 (= e!626322 (and e!626326 mapRes!42298))))

(declare-fun condMapEmpty!42298 () Bool)

(declare-fun mapDefault!42298 () ValueCell!12803)

(assert (=> b!1096943 (= condMapEmpty!42298 (= (arr!34163 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12803)) mapDefault!42298)))))

(declare-fun b!1096944 () Bool)

(assert (=> b!1096944 (= e!626326 tp_is_empty!27025)))

(declare-fun b!1096945 () Bool)

(declare-fun res!731705 () Bool)

(assert (=> b!1096945 (=> (not res!731705) (not e!626324))))

(assert (=> b!1096945 (= res!731705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096939 () Bool)

(declare-fun res!731706 () Bool)

(assert (=> b!1096939 (=> (not res!731706) (not e!626324))))

(assert (=> b!1096939 (= res!731706 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23856))))

(declare-fun res!731710 () Bool)

(assert (=> start!96632 (=> (not res!731710) (not e!626324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96632 (= res!731710 (validMask!0 mask!1414))))

(assert (=> start!96632 e!626324))

(assert (=> start!96632 tp!80851))

(assert (=> start!96632 true))

(assert (=> start!96632 tp_is_empty!27025))

(declare-fun array_inv!26358 (array!70997) Bool)

(assert (=> start!96632 (array_inv!26358 _keys!1070)))

(declare-fun array_inv!26359 (array!70995) Bool)

(assert (=> start!96632 (and (array_inv!26359 _values!874) e!626322)))

(declare-fun b!1096946 () Bool)

(assert (=> b!1096946 (= e!626323 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41161)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41161)

(declare-datatypes ((tuple2!17238 0))(
  ( (tuple2!17239 (_1!8630 (_ BitVec 64)) (_2!8630 V!41161)) )
))
(declare-datatypes ((List!23860 0))(
  ( (Nil!23857) (Cons!23856 (h!25074 tuple2!17238) (t!33873 List!23860)) )
))
(declare-datatypes ((ListLongMap!15215 0))(
  ( (ListLongMap!15216 (toList!7623 List!23860)) )
))
(declare-fun lt!490402 () ListLongMap!15215)

(declare-fun getCurrentListMapNoExtraKeys!4176 (array!70997 array!70995 (_ BitVec 32) (_ BitVec 32) V!41161 V!41161 (_ BitVec 32) Int) ListLongMap!15215)

(declare-fun dynLambda!2294 (Int (_ BitVec 64)) V!41161)

(assert (=> b!1096946 (= lt!490402 (getCurrentListMapNoExtraKeys!4176 lt!490404 (array!70996 (store (arr!34163 _values!874) i!650 (ValueCellFull!12803 (dynLambda!2294 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34700 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490401 () ListLongMap!15215)

(assert (=> b!1096946 (= lt!490401 (getCurrentListMapNoExtraKeys!4176 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096946 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36033 0))(
  ( (Unit!36034) )
))
(declare-fun lt!490403 () Unit!36033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70997 (_ BitVec 64) (_ BitVec 32)) Unit!36033)

(assert (=> b!1096946 (= lt!490403 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096947 () Bool)

(declare-fun res!731704 () Bool)

(assert (=> b!1096947 (=> (not res!731704) (not e!626324))))

(assert (=> b!1096947 (= res!731704 (and (= (size!34700 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34701 _keys!1070) (size!34700 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096948 () Bool)

(declare-fun res!731707 () Bool)

(assert (=> b!1096948 (=> (not res!731707) (not e!626324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096948 (= res!731707 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42298 () Bool)

(assert (=> mapIsEmpty!42298 mapRes!42298))

(assert (= (and start!96632 res!731710) b!1096947))

(assert (= (and b!1096947 res!731704) b!1096945))

(assert (= (and b!1096945 res!731705) b!1096939))

(assert (= (and b!1096939 res!731706) b!1096941))

(assert (= (and b!1096941 res!731708) b!1096948))

(assert (= (and b!1096948 res!731707) b!1096938))

(assert (= (and b!1096938 res!731702) b!1096940))

(assert (= (and b!1096940 res!731709) b!1096942))

(assert (= (and b!1096942 res!731703) b!1096946))

(assert (= (and b!1096943 condMapEmpty!42298) mapIsEmpty!42298))

(assert (= (and b!1096943 (not condMapEmpty!42298)) mapNonEmpty!42298))

(get-info :version)

(assert (= (and mapNonEmpty!42298 ((_ is ValueCellFull!12803) mapValue!42298)) b!1096937))

(assert (= (and b!1096943 ((_ is ValueCellFull!12803) mapDefault!42298)) b!1096944))

(assert (= start!96632 b!1096943))

(declare-fun b_lambda!17643 () Bool)

(assert (=> (not b_lambda!17643) (not b!1096946)))

(declare-fun t!33871 () Bool)

(declare-fun tb!7833 () Bool)

(assert (=> (and start!96632 (= defaultEntry!882 defaultEntry!882) t!33871) tb!7833))

(declare-fun result!16197 () Bool)

(assert (=> tb!7833 (= result!16197 tp_is_empty!27025)))

(assert (=> b!1096946 t!33871))

(declare-fun b_and!36625 () Bool)

(assert (= b_and!36623 (and (=> t!33871 result!16197) b_and!36625)))

(declare-fun m!1016901 () Bool)

(assert (=> b!1096948 m!1016901))

(declare-fun m!1016903 () Bool)

(assert (=> b!1096946 m!1016903))

(declare-fun m!1016905 () Bool)

(assert (=> b!1096946 m!1016905))

(declare-fun m!1016907 () Bool)

(assert (=> b!1096946 m!1016907))

(declare-fun m!1016909 () Bool)

(assert (=> b!1096946 m!1016909))

(declare-fun m!1016911 () Bool)

(assert (=> b!1096946 m!1016911))

(declare-fun m!1016913 () Bool)

(assert (=> b!1096946 m!1016913))

(declare-fun m!1016915 () Bool)

(assert (=> b!1096942 m!1016915))

(declare-fun m!1016917 () Bool)

(assert (=> b!1096940 m!1016917))

(declare-fun m!1016919 () Bool)

(assert (=> b!1096940 m!1016919))

(declare-fun m!1016921 () Bool)

(assert (=> b!1096939 m!1016921))

(declare-fun m!1016923 () Bool)

(assert (=> b!1096938 m!1016923))

(declare-fun m!1016925 () Bool)

(assert (=> start!96632 m!1016925))

(declare-fun m!1016927 () Bool)

(assert (=> start!96632 m!1016927))

(declare-fun m!1016929 () Bool)

(assert (=> start!96632 m!1016929))

(declare-fun m!1016931 () Bool)

(assert (=> b!1096945 m!1016931))

(declare-fun m!1016933 () Bool)

(assert (=> mapNonEmpty!42298 m!1016933))

(check-sat (not b!1096940) (not b!1096942) tp_is_empty!27025 (not start!96632) (not b_lambda!17643) b_and!36625 (not b!1096946) (not mapNonEmpty!42298) (not b_next!22975) (not b!1096945) (not b!1096939) (not b!1096948))
(check-sat b_and!36625 (not b_next!22975))
