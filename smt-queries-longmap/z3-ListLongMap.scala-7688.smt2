; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96710 () Bool)

(assert start!96710)

(declare-fun b_free!23053 () Bool)

(declare-fun b_next!23053 () Bool)

(assert (=> start!96710 (= b_free!23053 (not b_next!23053))))

(declare-fun tp!81086 () Bool)

(declare-fun b_and!36779 () Bool)

(assert (=> start!96710 (= tp!81086 b_and!36779)))

(declare-fun b!1098419 () Bool)

(declare-fun res!732761 () Bool)

(declare-fun e!627025 () Bool)

(assert (=> b!1098419 (=> (not res!732761) (not e!627025))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71147 0))(
  ( (array!71148 (arr!34239 (Array (_ BitVec 32) (_ BitVec 64))) (size!34776 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71147)

(assert (=> b!1098419 (= res!732761 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34776 _keys!1070))))))

(declare-fun b!1098420 () Bool)

(declare-fun e!627024 () Bool)

(declare-fun tp_is_empty!27103 () Bool)

(assert (=> b!1098420 (= e!627024 tp_is_empty!27103)))

(declare-fun b!1098422 () Bool)

(declare-fun res!732762 () Bool)

(assert (=> b!1098422 (=> (not res!732762) (not e!627025))))

(declare-datatypes ((List!23916 0))(
  ( (Nil!23913) (Cons!23912 (h!25130 (_ BitVec 64)) (t!34007 List!23916)) )
))
(declare-fun arrayNoDuplicates!0 (array!71147 (_ BitVec 32) List!23916) Bool)

(assert (=> b!1098422 (= res!732762 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23913))))

(declare-fun b!1098423 () Bool)

(declare-fun res!732756 () Bool)

(declare-fun e!627027 () Bool)

(assert (=> b!1098423 (=> (not res!732756) (not e!627027))))

(declare-fun lt!490893 () array!71147)

(assert (=> b!1098423 (= res!732756 (arrayNoDuplicates!0 lt!490893 #b00000000000000000000000000000000 Nil!23913))))

(declare-fun b!1098424 () Bool)

(declare-fun res!732763 () Bool)

(assert (=> b!1098424 (=> (not res!732763) (not e!627025))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71147 (_ BitVec 32)) Bool)

(assert (=> b!1098424 (= res!732763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098425 () Bool)

(assert (=> b!1098425 (= e!627025 e!627027)))

(declare-fun res!732758 () Bool)

(assert (=> b!1098425 (=> (not res!732758) (not e!627027))))

(assert (=> b!1098425 (= res!732758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490893 mask!1414))))

(assert (=> b!1098425 (= lt!490893 (array!71148 (store (arr!34239 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34776 _keys!1070)))))

(declare-fun mapIsEmpty!42415 () Bool)

(declare-fun mapRes!42415 () Bool)

(assert (=> mapIsEmpty!42415 mapRes!42415))

(declare-fun mapNonEmpty!42415 () Bool)

(declare-fun tp!81085 () Bool)

(assert (=> mapNonEmpty!42415 (= mapRes!42415 (and tp!81085 e!627024))))

(declare-datatypes ((V!41265 0))(
  ( (V!41266 (val!13608 Int)) )
))
(declare-datatypes ((ValueCell!12842 0))(
  ( (ValueCellFull!12842 (v!16225 V!41265)) (EmptyCell!12842) )
))
(declare-datatypes ((array!71149 0))(
  ( (array!71150 (arr!34240 (Array (_ BitVec 32) ValueCell!12842)) (size!34777 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71149)

(declare-fun mapRest!42415 () (Array (_ BitVec 32) ValueCell!12842))

(declare-fun mapValue!42415 () ValueCell!12842)

(declare-fun mapKey!42415 () (_ BitVec 32))

(assert (=> mapNonEmpty!42415 (= (arr!34240 _values!874) (store mapRest!42415 mapKey!42415 mapValue!42415))))

(declare-fun b!1098426 () Bool)

(declare-fun res!732759 () Bool)

(assert (=> b!1098426 (=> (not res!732759) (not e!627025))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098426 (= res!732759 (and (= (size!34777 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34776 _keys!1070) (size!34777 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098427 () Bool)

(declare-fun res!732757 () Bool)

(assert (=> b!1098427 (=> (not res!732757) (not e!627025))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1098427 (= res!732757 (= (select (arr!34239 _keys!1070) i!650) k0!904))))

(declare-fun b!1098428 () Bool)

(declare-fun e!627023 () Bool)

(declare-fun e!627028 () Bool)

(assert (=> b!1098428 (= e!627023 (and e!627028 mapRes!42415))))

(declare-fun condMapEmpty!42415 () Bool)

(declare-fun mapDefault!42415 () ValueCell!12842)

(assert (=> b!1098428 (= condMapEmpty!42415 (= (arr!34240 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12842)) mapDefault!42415)))))

(declare-fun b!1098421 () Bool)

(declare-fun res!732760 () Bool)

(assert (=> b!1098421 (=> (not res!732760) (not e!627025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098421 (= res!732760 (validKeyInArray!0 k0!904))))

(declare-fun res!732755 () Bool)

(assert (=> start!96710 (=> (not res!732755) (not e!627025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96710 (= res!732755 (validMask!0 mask!1414))))

(assert (=> start!96710 e!627025))

(assert (=> start!96710 tp!81086))

(assert (=> start!96710 true))

(assert (=> start!96710 tp_is_empty!27103))

(declare-fun array_inv!26408 (array!71147) Bool)

(assert (=> start!96710 (array_inv!26408 _keys!1070)))

(declare-fun array_inv!26409 (array!71149) Bool)

(assert (=> start!96710 (and (array_inv!26409 _values!874) e!627023)))

(declare-fun b!1098429 () Bool)

(assert (=> b!1098429 (= e!627028 tp_is_empty!27103)))

(declare-fun b!1098430 () Bool)

(assert (=> b!1098430 (= e!627027 (not true))))

(declare-datatypes ((tuple2!17292 0))(
  ( (tuple2!17293 (_1!8657 (_ BitVec 64)) (_2!8657 V!41265)) )
))
(declare-datatypes ((List!23917 0))(
  ( (Nil!23914) (Cons!23913 (h!25131 tuple2!17292) (t!34008 List!23917)) )
))
(declare-datatypes ((ListLongMap!15269 0))(
  ( (ListLongMap!15270 (toList!7650 List!23917)) )
))
(declare-fun lt!490891 () ListLongMap!15269)

(declare-fun lt!490894 () ListLongMap!15269)

(assert (=> b!1098430 (and (= lt!490891 lt!490894) (= lt!490894 lt!490891))))

(declare-fun lt!490896 () ListLongMap!15269)

(declare-fun -!924 (ListLongMap!15269 (_ BitVec 64)) ListLongMap!15269)

(assert (=> b!1098430 (= lt!490894 (-!924 lt!490896 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41265)

(declare-datatypes ((Unit!36087 0))(
  ( (Unit!36088) )
))
(declare-fun lt!490895 () Unit!36087)

(declare-fun zeroValue!831 () V!41265)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 (array!71147 array!71149 (_ BitVec 32) (_ BitVec 32) V!41265 V!41265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36087)

(assert (=> b!1098430 (= lt!490895 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4203 (array!71147 array!71149 (_ BitVec 32) (_ BitVec 32) V!41265 V!41265 (_ BitVec 32) Int) ListLongMap!15269)

(declare-fun dynLambda!2321 (Int (_ BitVec 64)) V!41265)

(assert (=> b!1098430 (= lt!490891 (getCurrentListMapNoExtraKeys!4203 lt!490893 (array!71150 (store (arr!34240 _values!874) i!650 (ValueCellFull!12842 (dynLambda!2321 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34777 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098430 (= lt!490896 (getCurrentListMapNoExtraKeys!4203 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098430 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490892 () Unit!36087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71147 (_ BitVec 64) (_ BitVec 32)) Unit!36087)

(assert (=> b!1098430 (= lt!490892 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96710 res!732755) b!1098426))

(assert (= (and b!1098426 res!732759) b!1098424))

(assert (= (and b!1098424 res!732763) b!1098422))

(assert (= (and b!1098422 res!732762) b!1098419))

(assert (= (and b!1098419 res!732761) b!1098421))

(assert (= (and b!1098421 res!732760) b!1098427))

(assert (= (and b!1098427 res!732757) b!1098425))

(assert (= (and b!1098425 res!732758) b!1098423))

(assert (= (and b!1098423 res!732756) b!1098430))

(assert (= (and b!1098428 condMapEmpty!42415) mapIsEmpty!42415))

(assert (= (and b!1098428 (not condMapEmpty!42415)) mapNonEmpty!42415))

(get-info :version)

(assert (= (and mapNonEmpty!42415 ((_ is ValueCellFull!12842) mapValue!42415)) b!1098420))

(assert (= (and b!1098428 ((_ is ValueCellFull!12842) mapDefault!42415)) b!1098429))

(assert (= start!96710 b!1098428))

(declare-fun b_lambda!17721 () Bool)

(assert (=> (not b_lambda!17721) (not b!1098430)))

(declare-fun t!34006 () Bool)

(declare-fun tb!7911 () Bool)

(assert (=> (and start!96710 (= defaultEntry!882 defaultEntry!882) t!34006) tb!7911))

(declare-fun result!16353 () Bool)

(assert (=> tb!7911 (= result!16353 tp_is_empty!27103)))

(assert (=> b!1098430 t!34006))

(declare-fun b_and!36781 () Bool)

(assert (= b_and!36779 (and (=> t!34006 result!16353) b_and!36781)))

(declare-fun m!1018239 () Bool)

(assert (=> b!1098427 m!1018239))

(declare-fun m!1018241 () Bool)

(assert (=> b!1098423 m!1018241))

(declare-fun m!1018243 () Bool)

(assert (=> b!1098425 m!1018243))

(declare-fun m!1018245 () Bool)

(assert (=> b!1098425 m!1018245))

(declare-fun m!1018247 () Bool)

(assert (=> b!1098422 m!1018247))

(declare-fun m!1018249 () Bool)

(assert (=> b!1098424 m!1018249))

(declare-fun m!1018251 () Bool)

(assert (=> b!1098421 m!1018251))

(declare-fun m!1018253 () Bool)

(assert (=> mapNonEmpty!42415 m!1018253))

(declare-fun m!1018255 () Bool)

(assert (=> b!1098430 m!1018255))

(declare-fun m!1018257 () Bool)

(assert (=> b!1098430 m!1018257))

(declare-fun m!1018259 () Bool)

(assert (=> b!1098430 m!1018259))

(declare-fun m!1018261 () Bool)

(assert (=> b!1098430 m!1018261))

(declare-fun m!1018263 () Bool)

(assert (=> b!1098430 m!1018263))

(declare-fun m!1018265 () Bool)

(assert (=> b!1098430 m!1018265))

(declare-fun m!1018267 () Bool)

(assert (=> b!1098430 m!1018267))

(declare-fun m!1018269 () Bool)

(assert (=> b!1098430 m!1018269))

(declare-fun m!1018271 () Bool)

(assert (=> start!96710 m!1018271))

(declare-fun m!1018273 () Bool)

(assert (=> start!96710 m!1018273))

(declare-fun m!1018275 () Bool)

(assert (=> start!96710 m!1018275))

(check-sat (not b!1098425) (not b!1098422) (not start!96710) (not mapNonEmpty!42415) (not b!1098423) (not b!1098424) (not b!1098421) (not b!1098430) (not b_next!23053) (not b_lambda!17721) tp_is_empty!27103 b_and!36781)
(check-sat b_and!36781 (not b_next!23053))
