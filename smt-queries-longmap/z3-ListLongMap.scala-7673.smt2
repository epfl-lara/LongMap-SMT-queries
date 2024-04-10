; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96386 () Bool)

(assert start!96386)

(declare-fun b_free!22965 () Bool)

(declare-fun b_next!22965 () Bool)

(assert (=> start!96386 (= b_free!22965 (not b_next!22965))))

(declare-fun tp!80821 () Bool)

(declare-fun b_and!36593 () Bool)

(assert (=> start!96386 (= tp!80821 b_and!36593)))

(declare-fun b!1095420 () Bool)

(declare-fun res!731049 () Bool)

(declare-fun e!625381 () Bool)

(assert (=> b!1095420 (=> (not res!731049) (not e!625381))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095420 (= res!731049 (validKeyInArray!0 k0!904))))

(declare-fun b!1095421 () Bool)

(declare-fun res!731046 () Bool)

(declare-fun e!625380 () Bool)

(assert (=> b!1095421 (=> (not res!731046) (not e!625380))))

(declare-datatypes ((array!70943 0))(
  ( (array!70944 (arr!34143 (Array (_ BitVec 32) (_ BitVec 64))) (size!34679 (_ BitVec 32))) )
))
(declare-fun lt!489828 () array!70943)

(declare-datatypes ((List!23841 0))(
  ( (Nil!23838) (Cons!23837 (h!25046 (_ BitVec 64)) (t!33852 List!23841)) )
))
(declare-fun arrayNoDuplicates!0 (array!70943 (_ BitVec 32) List!23841) Bool)

(assert (=> b!1095421 (= res!731046 (arrayNoDuplicates!0 lt!489828 #b00000000000000000000000000000000 Nil!23838))))

(declare-fun res!731052 () Bool)

(assert (=> start!96386 (=> (not res!731052) (not e!625381))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96386 (= res!731052 (validMask!0 mask!1414))))

(assert (=> start!96386 e!625381))

(assert (=> start!96386 tp!80821))

(assert (=> start!96386 true))

(declare-fun tp_is_empty!27015 () Bool)

(assert (=> start!96386 tp_is_empty!27015))

(declare-fun _keys!1070 () array!70943)

(declare-fun array_inv!26310 (array!70943) Bool)

(assert (=> start!96386 (array_inv!26310 _keys!1070)))

(declare-datatypes ((V!41147 0))(
  ( (V!41148 (val!13564 Int)) )
))
(declare-datatypes ((ValueCell!12798 0))(
  ( (ValueCellFull!12798 (v!16185 V!41147)) (EmptyCell!12798) )
))
(declare-datatypes ((array!70945 0))(
  ( (array!70946 (arr!34144 (Array (_ BitVec 32) ValueCell!12798)) (size!34680 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70945)

(declare-fun e!625376 () Bool)

(declare-fun array_inv!26311 (array!70945) Bool)

(assert (=> start!96386 (and (array_inv!26311 _values!874) e!625376)))

(declare-fun mapNonEmpty!42283 () Bool)

(declare-fun mapRes!42283 () Bool)

(declare-fun tp!80822 () Bool)

(declare-fun e!625379 () Bool)

(assert (=> mapNonEmpty!42283 (= mapRes!42283 (and tp!80822 e!625379))))

(declare-fun mapRest!42283 () (Array (_ BitVec 32) ValueCell!12798))

(declare-fun mapKey!42283 () (_ BitVec 32))

(declare-fun mapValue!42283 () ValueCell!12798)

(assert (=> mapNonEmpty!42283 (= (arr!34144 _values!874) (store mapRest!42283 mapKey!42283 mapValue!42283))))

(declare-fun b!1095422 () Bool)

(declare-fun res!731050 () Bool)

(assert (=> b!1095422 (=> (not res!731050) (not e!625381))))

(assert (=> b!1095422 (= res!731050 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23838))))

(declare-fun b!1095423 () Bool)

(assert (=> b!1095423 (= e!625381 e!625380)))

(declare-fun res!731053 () Bool)

(assert (=> b!1095423 (=> (not res!731053) (not e!625380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70943 (_ BitVec 32)) Bool)

(assert (=> b!1095423 (= res!731053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489828 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095423 (= lt!489828 (array!70944 (store (arr!34143 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34679 _keys!1070)))))

(declare-fun b!1095424 () Bool)

(declare-fun e!625377 () Bool)

(assert (=> b!1095424 (= e!625376 (and e!625377 mapRes!42283))))

(declare-fun condMapEmpty!42283 () Bool)

(declare-fun mapDefault!42283 () ValueCell!12798)

(assert (=> b!1095424 (= condMapEmpty!42283 (= (arr!34144 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12798)) mapDefault!42283)))))

(declare-fun b!1095425 () Bool)

(assert (=> b!1095425 (= e!625377 tp_is_empty!27015)))

(declare-fun b!1095426 () Bool)

(assert (=> b!1095426 (= e!625379 tp_is_empty!27015)))

(declare-fun b!1095427 () Bool)

(declare-fun res!731045 () Bool)

(assert (=> b!1095427 (=> (not res!731045) (not e!625381))))

(assert (=> b!1095427 (= res!731045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095428 () Bool)

(assert (=> b!1095428 (= e!625380 (not (bvsle #b00000000000000000000000000000000 (size!34679 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41147)

(declare-datatypes ((tuple2!17222 0))(
  ( (tuple2!17223 (_1!8622 (_ BitVec 64)) (_2!8622 V!41147)) )
))
(declare-datatypes ((List!23842 0))(
  ( (Nil!23839) (Cons!23838 (h!25047 tuple2!17222) (t!33853 List!23842)) )
))
(declare-datatypes ((ListLongMap!15191 0))(
  ( (ListLongMap!15192 (toList!7611 List!23842)) )
))
(declare-fun lt!489829 () ListLongMap!15191)

(declare-fun minValue!831 () V!41147)

(declare-fun getCurrentListMapNoExtraKeys!4127 (array!70943 array!70945 (_ BitVec 32) (_ BitVec 32) V!41147 V!41147 (_ BitVec 32) Int) ListLongMap!15191)

(declare-fun dynLambda!2262 (Int (_ BitVec 64)) V!41147)

(assert (=> b!1095428 (= lt!489829 (getCurrentListMapNoExtraKeys!4127 lt!489828 (array!70946 (store (arr!34144 _values!874) i!650 (ValueCellFull!12798 (dynLambda!2262 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34680 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489827 () ListLongMap!15191)

(assert (=> b!1095428 (= lt!489827 (getCurrentListMapNoExtraKeys!4127 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095428 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36034 0))(
  ( (Unit!36035) )
))
(declare-fun lt!489826 () Unit!36034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70943 (_ BitVec 64) (_ BitVec 32)) Unit!36034)

(assert (=> b!1095428 (= lt!489826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095429 () Bool)

(declare-fun res!731047 () Bool)

(assert (=> b!1095429 (=> (not res!731047) (not e!625381))))

(assert (=> b!1095429 (= res!731047 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34679 _keys!1070))))))

(declare-fun b!1095430 () Bool)

(declare-fun res!731051 () Bool)

(assert (=> b!1095430 (=> (not res!731051) (not e!625381))))

(assert (=> b!1095430 (= res!731051 (and (= (size!34680 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34679 _keys!1070) (size!34680 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42283 () Bool)

(assert (=> mapIsEmpty!42283 mapRes!42283))

(declare-fun b!1095431 () Bool)

(declare-fun res!731048 () Bool)

(assert (=> b!1095431 (=> (not res!731048) (not e!625381))))

(assert (=> b!1095431 (= res!731048 (= (select (arr!34143 _keys!1070) i!650) k0!904))))

(assert (= (and start!96386 res!731052) b!1095430))

(assert (= (and b!1095430 res!731051) b!1095427))

(assert (= (and b!1095427 res!731045) b!1095422))

(assert (= (and b!1095422 res!731050) b!1095429))

(assert (= (and b!1095429 res!731047) b!1095420))

(assert (= (and b!1095420 res!731049) b!1095431))

(assert (= (and b!1095431 res!731048) b!1095423))

(assert (= (and b!1095423 res!731053) b!1095421))

(assert (= (and b!1095421 res!731046) b!1095428))

(assert (= (and b!1095424 condMapEmpty!42283) mapIsEmpty!42283))

(assert (= (and b!1095424 (not condMapEmpty!42283)) mapNonEmpty!42283))

(get-info :version)

(assert (= (and mapNonEmpty!42283 ((_ is ValueCellFull!12798) mapValue!42283)) b!1095426))

(assert (= (and b!1095424 ((_ is ValueCellFull!12798) mapDefault!42283)) b!1095425))

(assert (= start!96386 b!1095424))

(declare-fun b_lambda!17623 () Bool)

(assert (=> (not b_lambda!17623) (not b!1095428)))

(declare-fun t!33851 () Bool)

(declare-fun tb!7831 () Bool)

(assert (=> (and start!96386 (= defaultEntry!882 defaultEntry!882) t!33851) tb!7831))

(declare-fun result!16185 () Bool)

(assert (=> tb!7831 (= result!16185 tp_is_empty!27015)))

(assert (=> b!1095428 t!33851))

(declare-fun b_and!36595 () Bool)

(assert (= b_and!36593 (and (=> t!33851 result!16185) b_and!36595)))

(declare-fun m!1015059 () Bool)

(assert (=> b!1095421 m!1015059))

(declare-fun m!1015061 () Bool)

(assert (=> b!1095423 m!1015061))

(declare-fun m!1015063 () Bool)

(assert (=> b!1095423 m!1015063))

(declare-fun m!1015065 () Bool)

(assert (=> b!1095420 m!1015065))

(declare-fun m!1015067 () Bool)

(assert (=> start!96386 m!1015067))

(declare-fun m!1015069 () Bool)

(assert (=> start!96386 m!1015069))

(declare-fun m!1015071 () Bool)

(assert (=> start!96386 m!1015071))

(declare-fun m!1015073 () Bool)

(assert (=> b!1095428 m!1015073))

(declare-fun m!1015075 () Bool)

(assert (=> b!1095428 m!1015075))

(declare-fun m!1015077 () Bool)

(assert (=> b!1095428 m!1015077))

(declare-fun m!1015079 () Bool)

(assert (=> b!1095428 m!1015079))

(declare-fun m!1015081 () Bool)

(assert (=> b!1095428 m!1015081))

(declare-fun m!1015083 () Bool)

(assert (=> b!1095428 m!1015083))

(declare-fun m!1015085 () Bool)

(assert (=> b!1095422 m!1015085))

(declare-fun m!1015087 () Bool)

(assert (=> b!1095427 m!1015087))

(declare-fun m!1015089 () Bool)

(assert (=> mapNonEmpty!42283 m!1015089))

(declare-fun m!1015091 () Bool)

(assert (=> b!1095431 m!1015091))

(check-sat (not b!1095420) (not b!1095427) (not start!96386) (not b!1095423) (not b!1095422) (not b!1095421) tp_is_empty!27015 (not b_next!22965) (not mapNonEmpty!42283) (not b!1095428) (not b_lambda!17623) b_and!36595)
(check-sat b_and!36595 (not b_next!22965))
