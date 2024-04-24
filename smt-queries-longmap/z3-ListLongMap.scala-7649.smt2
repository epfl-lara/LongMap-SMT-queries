; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96450 () Bool)

(assert start!96450)

(declare-fun b_free!22867 () Bool)

(declare-fun b_next!22867 () Bool)

(assert (=> start!96450 (= b_free!22867 (not b_next!22867))))

(declare-fun tp!80449 () Bool)

(declare-fun b_and!36419 () Bool)

(assert (=> start!96450 (= tp!80449 b_and!36419)))

(declare-fun b!1094074 () Bool)

(declare-fun res!729692 () Bool)

(declare-fun e!624872 () Bool)

(assert (=> b!1094074 (=> (not res!729692) (not e!624872))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70685 0))(
  ( (array!70686 (arr!34010 (Array (_ BitVec 32) (_ BitVec 64))) (size!34547 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70685)

(assert (=> b!1094074 (= res!729692 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34547 _keys!1070))))))

(declare-fun b!1094075 () Bool)

(declare-fun res!729689 () Bool)

(assert (=> b!1094075 (=> (not res!729689) (not e!624872))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094075 (= res!729689 (validKeyInArray!0 k0!904))))

(declare-fun b!1094076 () Bool)

(declare-fun e!624871 () Bool)

(declare-fun tp_is_empty!26869 () Bool)

(assert (=> b!1094076 (= e!624871 tp_is_empty!26869)))

(declare-fun b!1094077 () Bool)

(declare-fun res!729690 () Bool)

(assert (=> b!1094077 (=> (not res!729690) (not e!624872))))

(assert (=> b!1094077 (= res!729690 (= (select (arr!34010 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42058 () Bool)

(declare-fun mapRes!42058 () Bool)

(declare-fun tp!80450 () Bool)

(declare-fun e!624874 () Bool)

(assert (=> mapNonEmpty!42058 (= mapRes!42058 (and tp!80450 e!624874))))

(declare-datatypes ((V!40953 0))(
  ( (V!40954 (val!13491 Int)) )
))
(declare-datatypes ((ValueCell!12725 0))(
  ( (ValueCellFull!12725 (v!16108 V!40953)) (EmptyCell!12725) )
))
(declare-fun mapValue!42058 () ValueCell!12725)

(declare-datatypes ((array!70687 0))(
  ( (array!70688 (arr!34011 (Array (_ BitVec 32) ValueCell!12725)) (size!34548 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70687)

(declare-fun mapKey!42058 () (_ BitVec 32))

(declare-fun mapRest!42058 () (Array (_ BitVec 32) ValueCell!12725))

(assert (=> mapNonEmpty!42058 (= (arr!34011 _values!874) (store mapRest!42058 mapKey!42058 mapValue!42058))))

(declare-fun b!1094078 () Bool)

(declare-fun res!729688 () Bool)

(assert (=> b!1094078 (=> (not res!729688) (not e!624872))))

(declare-datatypes ((List!23758 0))(
  ( (Nil!23755) (Cons!23754 (h!24972 (_ BitVec 64)) (t!33675 List!23758)) )
))
(declare-fun arrayNoDuplicates!0 (array!70685 (_ BitVec 32) List!23758) Bool)

(assert (=> b!1094078 (= res!729688 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23755))))

(declare-fun b!1094079 () Bool)

(declare-fun e!624870 () Bool)

(assert (=> b!1094079 (= e!624870 (and e!624871 mapRes!42058))))

(declare-fun condMapEmpty!42058 () Bool)

(declare-fun mapDefault!42058 () ValueCell!12725)

(assert (=> b!1094079 (= condMapEmpty!42058 (= (arr!34011 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12725)) mapDefault!42058)))))

(declare-fun b!1094081 () Bool)

(declare-fun e!624873 () Bool)

(assert (=> b!1094081 (= e!624873 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40953)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17166 0))(
  ( (tuple2!17167 (_1!8594 (_ BitVec 64)) (_2!8594 V!40953)) )
))
(declare-datatypes ((List!23759 0))(
  ( (Nil!23756) (Cons!23755 (h!24973 tuple2!17166) (t!33676 List!23759)) )
))
(declare-datatypes ((ListLongMap!15143 0))(
  ( (ListLongMap!15144 (toList!7587 List!23759)) )
))
(declare-fun lt!489016 () ListLongMap!15143)

(declare-fun zeroValue!831 () V!40953)

(declare-fun getCurrentListMap!4335 (array!70685 array!70687 (_ BitVec 32) (_ BitVec 32) V!40953 V!40953 (_ BitVec 32) Int) ListLongMap!15143)

(assert (=> b!1094081 (= lt!489016 (getCurrentListMap!4335 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489010 () array!70685)

(declare-fun lt!489014 () array!70687)

(declare-fun lt!489017 () ListLongMap!15143)

(assert (=> b!1094081 (= lt!489017 (getCurrentListMap!4335 lt!489010 lt!489014 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489018 () ListLongMap!15143)

(declare-fun lt!489012 () ListLongMap!15143)

(assert (=> b!1094081 (and (= lt!489018 lt!489012) (= lt!489012 lt!489018))))

(declare-fun lt!489011 () ListLongMap!15143)

(declare-fun -!892 (ListLongMap!15143 (_ BitVec 64)) ListLongMap!15143)

(assert (=> b!1094081 (= lt!489012 (-!892 lt!489011 k0!904))))

(declare-datatypes ((Unit!35951 0))(
  ( (Unit!35952) )
))
(declare-fun lt!489013 () Unit!35951)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!164 (array!70685 array!70687 (_ BitVec 32) (_ BitVec 32) V!40953 V!40953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35951)

(assert (=> b!1094081 (= lt!489013 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!164 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4140 (array!70685 array!70687 (_ BitVec 32) (_ BitVec 32) V!40953 V!40953 (_ BitVec 32) Int) ListLongMap!15143)

(assert (=> b!1094081 (= lt!489018 (getCurrentListMapNoExtraKeys!4140 lt!489010 lt!489014 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2261 (Int (_ BitVec 64)) V!40953)

(assert (=> b!1094081 (= lt!489014 (array!70688 (store (arr!34011 _values!874) i!650 (ValueCellFull!12725 (dynLambda!2261 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34548 _values!874)))))

(assert (=> b!1094081 (= lt!489011 (getCurrentListMapNoExtraKeys!4140 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094081 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489015 () Unit!35951)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70685 (_ BitVec 64) (_ BitVec 32)) Unit!35951)

(assert (=> b!1094081 (= lt!489015 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094082 () Bool)

(assert (=> b!1094082 (= e!624874 tp_is_empty!26869)))

(declare-fun b!1094083 () Bool)

(declare-fun res!729686 () Bool)

(assert (=> b!1094083 (=> (not res!729686) (not e!624873))))

(assert (=> b!1094083 (= res!729686 (arrayNoDuplicates!0 lt!489010 #b00000000000000000000000000000000 Nil!23755))))

(declare-fun b!1094084 () Bool)

(declare-fun res!729685 () Bool)

(assert (=> b!1094084 (=> (not res!729685) (not e!624872))))

(assert (=> b!1094084 (= res!729685 (and (= (size!34548 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34547 _keys!1070) (size!34548 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094085 () Bool)

(declare-fun res!729693 () Bool)

(assert (=> b!1094085 (=> (not res!729693) (not e!624872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70685 (_ BitVec 32)) Bool)

(assert (=> b!1094085 (= res!729693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42058 () Bool)

(assert (=> mapIsEmpty!42058 mapRes!42058))

(declare-fun res!729687 () Bool)

(assert (=> start!96450 (=> (not res!729687) (not e!624872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96450 (= res!729687 (validMask!0 mask!1414))))

(assert (=> start!96450 e!624872))

(assert (=> start!96450 tp!80449))

(assert (=> start!96450 true))

(assert (=> start!96450 tp_is_empty!26869))

(declare-fun array_inv!26252 (array!70685) Bool)

(assert (=> start!96450 (array_inv!26252 _keys!1070)))

(declare-fun array_inv!26253 (array!70687) Bool)

(assert (=> start!96450 (and (array_inv!26253 _values!874) e!624870)))

(declare-fun b!1094080 () Bool)

(assert (=> b!1094080 (= e!624872 e!624873)))

(declare-fun res!729691 () Bool)

(assert (=> b!1094080 (=> (not res!729691) (not e!624873))))

(assert (=> b!1094080 (= res!729691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489010 mask!1414))))

(assert (=> b!1094080 (= lt!489010 (array!70686 (store (arr!34010 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34547 _keys!1070)))))

(assert (= (and start!96450 res!729687) b!1094084))

(assert (= (and b!1094084 res!729685) b!1094085))

(assert (= (and b!1094085 res!729693) b!1094078))

(assert (= (and b!1094078 res!729688) b!1094074))

(assert (= (and b!1094074 res!729692) b!1094075))

(assert (= (and b!1094075 res!729689) b!1094077))

(assert (= (and b!1094077 res!729690) b!1094080))

(assert (= (and b!1094080 res!729691) b!1094083))

(assert (= (and b!1094083 res!729686) b!1094081))

(assert (= (and b!1094079 condMapEmpty!42058) mapIsEmpty!42058))

(assert (= (and b!1094079 (not condMapEmpty!42058)) mapNonEmpty!42058))

(get-info :version)

(assert (= (and mapNonEmpty!42058 ((_ is ValueCellFull!12725) mapValue!42058)) b!1094082))

(assert (= (and b!1094079 ((_ is ValueCellFull!12725) mapDefault!42058)) b!1094076))

(assert (= start!96450 b!1094079))

(declare-fun b_lambda!17547 () Bool)

(assert (=> (not b_lambda!17547) (not b!1094081)))

(declare-fun t!33674 () Bool)

(declare-fun tb!7737 () Bool)

(assert (=> (and start!96450 (= defaultEntry!882 defaultEntry!882) t!33674) tb!7737))

(declare-fun result!16001 () Bool)

(assert (=> tb!7737 (= result!16001 tp_is_empty!26869)))

(assert (=> b!1094081 t!33674))

(declare-fun b_and!36421 () Bool)

(assert (= b_and!36419 (and (=> t!33674 result!16001) b_and!36421)))

(declare-fun m!1014215 () Bool)

(assert (=> b!1094078 m!1014215))

(declare-fun m!1014217 () Bool)

(assert (=> start!96450 m!1014217))

(declare-fun m!1014219 () Bool)

(assert (=> start!96450 m!1014219))

(declare-fun m!1014221 () Bool)

(assert (=> start!96450 m!1014221))

(declare-fun m!1014223 () Bool)

(assert (=> b!1094075 m!1014223))

(declare-fun m!1014225 () Bool)

(assert (=> mapNonEmpty!42058 m!1014225))

(declare-fun m!1014227 () Bool)

(assert (=> b!1094080 m!1014227))

(declare-fun m!1014229 () Bool)

(assert (=> b!1094080 m!1014229))

(declare-fun m!1014231 () Bool)

(assert (=> b!1094085 m!1014231))

(declare-fun m!1014233 () Bool)

(assert (=> b!1094081 m!1014233))

(declare-fun m!1014235 () Bool)

(assert (=> b!1094081 m!1014235))

(declare-fun m!1014237 () Bool)

(assert (=> b!1094081 m!1014237))

(declare-fun m!1014239 () Bool)

(assert (=> b!1094081 m!1014239))

(declare-fun m!1014241 () Bool)

(assert (=> b!1094081 m!1014241))

(declare-fun m!1014243 () Bool)

(assert (=> b!1094081 m!1014243))

(declare-fun m!1014245 () Bool)

(assert (=> b!1094081 m!1014245))

(declare-fun m!1014247 () Bool)

(assert (=> b!1094081 m!1014247))

(declare-fun m!1014249 () Bool)

(assert (=> b!1094081 m!1014249))

(declare-fun m!1014251 () Bool)

(assert (=> b!1094081 m!1014251))

(declare-fun m!1014253 () Bool)

(assert (=> b!1094077 m!1014253))

(declare-fun m!1014255 () Bool)

(assert (=> b!1094083 m!1014255))

(check-sat (not mapNonEmpty!42058) (not start!96450) tp_is_empty!26869 (not b_lambda!17547) (not b!1094083) (not b_next!22867) b_and!36421 (not b!1094078) (not b!1094080) (not b!1094081) (not b!1094075) (not b!1094085))
(check-sat b_and!36421 (not b_next!22867))
