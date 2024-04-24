; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96644 () Bool)

(assert start!96644)

(declare-fun b_free!22987 () Bool)

(declare-fun b_next!22987 () Bool)

(assert (=> start!96644 (= b_free!22987 (not b_next!22987))))

(declare-fun tp!80887 () Bool)

(declare-fun b_and!36647 () Bool)

(assert (=> start!96644 (= tp!80887 b_and!36647)))

(declare-fun b!1097165 () Bool)

(declare-fun res!731864 () Bool)

(declare-fun e!626429 () Bool)

(assert (=> b!1097165 (=> (not res!731864) (not e!626429))))

(declare-datatypes ((array!71017 0))(
  ( (array!71018 (arr!34174 (Array (_ BitVec 32) (_ BitVec 64))) (size!34711 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71017)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097165 (= res!731864 (= (select (arr!34174 _keys!1070) i!650) k0!904))))

(declare-fun b!1097166 () Bool)

(declare-fun res!731869 () Bool)

(assert (=> b!1097166 (=> (not res!731869) (not e!626429))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71017 (_ BitVec 32)) Bool)

(assert (=> b!1097166 (= res!731869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42316 () Bool)

(declare-fun mapRes!42316 () Bool)

(declare-fun tp!80888 () Bool)

(declare-fun e!626431 () Bool)

(assert (=> mapNonEmpty!42316 (= mapRes!42316 (and tp!80888 e!626431))))

(declare-datatypes ((V!41177 0))(
  ( (V!41178 (val!13575 Int)) )
))
(declare-datatypes ((ValueCell!12809 0))(
  ( (ValueCellFull!12809 (v!16192 V!41177)) (EmptyCell!12809) )
))
(declare-fun mapValue!42316 () ValueCell!12809)

(declare-fun mapRest!42316 () (Array (_ BitVec 32) ValueCell!12809))

(declare-datatypes ((array!71019 0))(
  ( (array!71020 (arr!34175 (Array (_ BitVec 32) ValueCell!12809)) (size!34712 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71019)

(declare-fun mapKey!42316 () (_ BitVec 32))

(assert (=> mapNonEmpty!42316 (= (arr!34175 _values!874) (store mapRest!42316 mapKey!42316 mapValue!42316))))

(declare-fun b!1097167 () Bool)

(declare-fun res!731871 () Bool)

(assert (=> b!1097167 (=> (not res!731871) (not e!626429))))

(declare-datatypes ((List!23867 0))(
  ( (Nil!23864) (Cons!23863 (h!25081 (_ BitVec 64)) (t!33892 List!23867)) )
))
(declare-fun arrayNoDuplicates!0 (array!71017 (_ BitVec 32) List!23867) Bool)

(assert (=> b!1097167 (= res!731871 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23864))))

(declare-fun b!1097168 () Bool)

(declare-fun e!626433 () Bool)

(assert (=> b!1097168 (= e!626433 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!490473 () array!71017)

(declare-fun minValue!831 () V!41177)

(declare-fun zeroValue!831 () V!41177)

(declare-datatypes ((tuple2!17246 0))(
  ( (tuple2!17247 (_1!8634 (_ BitVec 64)) (_2!8634 V!41177)) )
))
(declare-datatypes ((List!23868 0))(
  ( (Nil!23865) (Cons!23864 (h!25082 tuple2!17246) (t!33893 List!23868)) )
))
(declare-datatypes ((ListLongMap!15223 0))(
  ( (ListLongMap!15224 (toList!7627 List!23868)) )
))
(declare-fun lt!490474 () ListLongMap!15223)

(declare-fun getCurrentListMapNoExtraKeys!4180 (array!71017 array!71019 (_ BitVec 32) (_ BitVec 32) V!41177 V!41177 (_ BitVec 32) Int) ListLongMap!15223)

(declare-fun dynLambda!2298 (Int (_ BitVec 64)) V!41177)

(assert (=> b!1097168 (= lt!490474 (getCurrentListMapNoExtraKeys!4180 lt!490473 (array!71020 (store (arr!34175 _values!874) i!650 (ValueCellFull!12809 (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34712 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490475 () ListLongMap!15223)

(assert (=> b!1097168 (= lt!490475 (getCurrentListMapNoExtraKeys!4180 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097168 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36041 0))(
  ( (Unit!36042) )
))
(declare-fun lt!490476 () Unit!36041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71017 (_ BitVec 64) (_ BitVec 32)) Unit!36041)

(assert (=> b!1097168 (= lt!490476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097169 () Bool)

(declare-fun res!731866 () Bool)

(assert (=> b!1097169 (=> (not res!731866) (not e!626429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097169 (= res!731866 (validKeyInArray!0 k0!904))))

(declare-fun b!1097170 () Bool)

(declare-fun res!731868 () Bool)

(assert (=> b!1097170 (=> (not res!731868) (not e!626429))))

(assert (=> b!1097170 (= res!731868 (and (= (size!34712 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34711 _keys!1070) (size!34712 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097171 () Bool)

(declare-fun e!626430 () Bool)

(declare-fun e!626432 () Bool)

(assert (=> b!1097171 (= e!626430 (and e!626432 mapRes!42316))))

(declare-fun condMapEmpty!42316 () Bool)

(declare-fun mapDefault!42316 () ValueCell!12809)

(assert (=> b!1097171 (= condMapEmpty!42316 (= (arr!34175 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12809)) mapDefault!42316)))))

(declare-fun b!1097172 () Bool)

(declare-fun tp_is_empty!27037 () Bool)

(assert (=> b!1097172 (= e!626432 tp_is_empty!27037)))

(declare-fun b!1097173 () Bool)

(assert (=> b!1097173 (= e!626431 tp_is_empty!27037)))

(declare-fun b!1097174 () Bool)

(assert (=> b!1097174 (= e!626429 e!626433)))

(declare-fun res!731870 () Bool)

(assert (=> b!1097174 (=> (not res!731870) (not e!626433))))

(assert (=> b!1097174 (= res!731870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490473 mask!1414))))

(assert (=> b!1097174 (= lt!490473 (array!71018 (store (arr!34174 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34711 _keys!1070)))))

(declare-fun res!731865 () Bool)

(assert (=> start!96644 (=> (not res!731865) (not e!626429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96644 (= res!731865 (validMask!0 mask!1414))))

(assert (=> start!96644 e!626429))

(assert (=> start!96644 tp!80887))

(assert (=> start!96644 true))

(assert (=> start!96644 tp_is_empty!27037))

(declare-fun array_inv!26364 (array!71017) Bool)

(assert (=> start!96644 (array_inv!26364 _keys!1070)))

(declare-fun array_inv!26365 (array!71019) Bool)

(assert (=> start!96644 (and (array_inv!26365 _values!874) e!626430)))

(declare-fun mapIsEmpty!42316 () Bool)

(assert (=> mapIsEmpty!42316 mapRes!42316))

(declare-fun b!1097175 () Bool)

(declare-fun res!731872 () Bool)

(assert (=> b!1097175 (=> (not res!731872) (not e!626429))))

(assert (=> b!1097175 (= res!731872 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34711 _keys!1070))))))

(declare-fun b!1097176 () Bool)

(declare-fun res!731867 () Bool)

(assert (=> b!1097176 (=> (not res!731867) (not e!626433))))

(assert (=> b!1097176 (= res!731867 (arrayNoDuplicates!0 lt!490473 #b00000000000000000000000000000000 Nil!23864))))

(assert (= (and start!96644 res!731865) b!1097170))

(assert (= (and b!1097170 res!731868) b!1097166))

(assert (= (and b!1097166 res!731869) b!1097167))

(assert (= (and b!1097167 res!731871) b!1097175))

(assert (= (and b!1097175 res!731872) b!1097169))

(assert (= (and b!1097169 res!731866) b!1097165))

(assert (= (and b!1097165 res!731864) b!1097174))

(assert (= (and b!1097174 res!731870) b!1097176))

(assert (= (and b!1097176 res!731867) b!1097168))

(assert (= (and b!1097171 condMapEmpty!42316) mapIsEmpty!42316))

(assert (= (and b!1097171 (not condMapEmpty!42316)) mapNonEmpty!42316))

(get-info :version)

(assert (= (and mapNonEmpty!42316 ((_ is ValueCellFull!12809) mapValue!42316)) b!1097173))

(assert (= (and b!1097171 ((_ is ValueCellFull!12809) mapDefault!42316)) b!1097172))

(assert (= start!96644 b!1097171))

(declare-fun b_lambda!17655 () Bool)

(assert (=> (not b_lambda!17655) (not b!1097168)))

(declare-fun t!33891 () Bool)

(declare-fun tb!7845 () Bool)

(assert (=> (and start!96644 (= defaultEntry!882 defaultEntry!882) t!33891) tb!7845))

(declare-fun result!16221 () Bool)

(assert (=> tb!7845 (= result!16221 tp_is_empty!27037)))

(assert (=> b!1097168 t!33891))

(declare-fun b_and!36649 () Bool)

(assert (= b_and!36647 (and (=> t!33891 result!16221) b_and!36649)))

(declare-fun m!1017105 () Bool)

(assert (=> b!1097168 m!1017105))

(declare-fun m!1017107 () Bool)

(assert (=> b!1097168 m!1017107))

(declare-fun m!1017109 () Bool)

(assert (=> b!1097168 m!1017109))

(declare-fun m!1017111 () Bool)

(assert (=> b!1097168 m!1017111))

(declare-fun m!1017113 () Bool)

(assert (=> b!1097168 m!1017113))

(declare-fun m!1017115 () Bool)

(assert (=> b!1097168 m!1017115))

(declare-fun m!1017117 () Bool)

(assert (=> b!1097176 m!1017117))

(declare-fun m!1017119 () Bool)

(assert (=> b!1097169 m!1017119))

(declare-fun m!1017121 () Bool)

(assert (=> b!1097174 m!1017121))

(declare-fun m!1017123 () Bool)

(assert (=> b!1097174 m!1017123))

(declare-fun m!1017125 () Bool)

(assert (=> start!96644 m!1017125))

(declare-fun m!1017127 () Bool)

(assert (=> start!96644 m!1017127))

(declare-fun m!1017129 () Bool)

(assert (=> start!96644 m!1017129))

(declare-fun m!1017131 () Bool)

(assert (=> mapNonEmpty!42316 m!1017131))

(declare-fun m!1017133 () Bool)

(assert (=> b!1097165 m!1017133))

(declare-fun m!1017135 () Bool)

(assert (=> b!1097166 m!1017135))

(declare-fun m!1017137 () Bool)

(assert (=> b!1097167 m!1017137))

(check-sat (not b!1097168) (not b_next!22987) tp_is_empty!27037 (not b!1097169) (not mapNonEmpty!42316) (not b!1097176) (not start!96644) (not b!1097167) b_and!36649 (not b_lambda!17655) (not b!1097174) (not b!1097166))
(check-sat b_and!36649 (not b_next!22987))
