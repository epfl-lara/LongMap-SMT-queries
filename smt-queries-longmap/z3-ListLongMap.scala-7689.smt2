; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96716 () Bool)

(assert start!96716)

(declare-fun b_free!23059 () Bool)

(declare-fun b_next!23059 () Bool)

(assert (=> start!96716 (= b_free!23059 (not b_next!23059))))

(declare-fun tp!81103 () Bool)

(declare-fun b_and!36791 () Bool)

(assert (=> start!96716 (= tp!81103 b_and!36791)))

(declare-fun b!1098533 () Bool)

(declare-fun res!732838 () Bool)

(declare-fun e!627077 () Bool)

(assert (=> b!1098533 (=> (not res!732838) (not e!627077))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71159 0))(
  ( (array!71160 (arr!34245 (Array (_ BitVec 32) (_ BitVec 64))) (size!34782 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71159)

(assert (=> b!1098533 (= res!732838 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34782 _keys!1070))))))

(declare-fun b!1098534 () Bool)

(declare-fun res!732843 () Bool)

(assert (=> b!1098534 (=> (not res!732843) (not e!627077))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098534 (= res!732843 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42424 () Bool)

(declare-fun mapRes!42424 () Bool)

(assert (=> mapIsEmpty!42424 mapRes!42424))

(declare-fun res!732837 () Bool)

(assert (=> start!96716 (=> (not res!732837) (not e!627077))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96716 (= res!732837 (validMask!0 mask!1414))))

(assert (=> start!96716 e!627077))

(assert (=> start!96716 tp!81103))

(assert (=> start!96716 true))

(declare-fun tp_is_empty!27109 () Bool)

(assert (=> start!96716 tp_is_empty!27109))

(declare-fun array_inv!26412 (array!71159) Bool)

(assert (=> start!96716 (array_inv!26412 _keys!1070)))

(declare-datatypes ((V!41273 0))(
  ( (V!41274 (val!13611 Int)) )
))
(declare-datatypes ((ValueCell!12845 0))(
  ( (ValueCellFull!12845 (v!16228 V!41273)) (EmptyCell!12845) )
))
(declare-datatypes ((array!71161 0))(
  ( (array!71162 (arr!34246 (Array (_ BitVec 32) ValueCell!12845)) (size!34783 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71161)

(declare-fun e!627081 () Bool)

(declare-fun array_inv!26413 (array!71161) Bool)

(assert (=> start!96716 (and (array_inv!26413 _values!874) e!627081)))

(declare-fun b!1098535 () Bool)

(declare-fun e!627080 () Bool)

(assert (=> b!1098535 (= e!627077 e!627080)))

(declare-fun res!732844 () Bool)

(assert (=> b!1098535 (=> (not res!732844) (not e!627080))))

(declare-fun lt!490949 () array!71159)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71159 (_ BitVec 32)) Bool)

(assert (=> b!1098535 (= res!732844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490949 mask!1414))))

(assert (=> b!1098535 (= lt!490949 (array!71160 (store (arr!34245 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34782 _keys!1070)))))

(declare-fun b!1098536 () Bool)

(declare-fun res!732842 () Bool)

(assert (=> b!1098536 (=> (not res!732842) (not e!627077))))

(assert (=> b!1098536 (= res!732842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098537 () Bool)

(declare-fun e!627078 () Bool)

(assert (=> b!1098537 (= e!627081 (and e!627078 mapRes!42424))))

(declare-fun condMapEmpty!42424 () Bool)

(declare-fun mapDefault!42424 () ValueCell!12845)

(assert (=> b!1098537 (= condMapEmpty!42424 (= (arr!34246 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12845)) mapDefault!42424)))))

(declare-fun b!1098538 () Bool)

(declare-fun res!732840 () Bool)

(assert (=> b!1098538 (=> (not res!732840) (not e!627077))))

(declare-datatypes ((List!23921 0))(
  ( (Nil!23918) (Cons!23917 (h!25135 (_ BitVec 64)) (t!34018 List!23921)) )
))
(declare-fun arrayNoDuplicates!0 (array!71159 (_ BitVec 32) List!23921) Bool)

(assert (=> b!1098538 (= res!732840 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23918))))

(declare-fun b!1098539 () Bool)

(assert (=> b!1098539 (= e!627080 (not (bvslt i!650 (size!34783 _values!874))))))

(declare-datatypes ((tuple2!17298 0))(
  ( (tuple2!17299 (_1!8660 (_ BitVec 64)) (_2!8660 V!41273)) )
))
(declare-datatypes ((List!23922 0))(
  ( (Nil!23919) (Cons!23918 (h!25136 tuple2!17298) (t!34019 List!23922)) )
))
(declare-datatypes ((ListLongMap!15275 0))(
  ( (ListLongMap!15276 (toList!7653 List!23922)) )
))
(declare-fun lt!490947 () ListLongMap!15275)

(declare-fun lt!490945 () ListLongMap!15275)

(assert (=> b!1098539 (and (= lt!490947 lt!490945) (= lt!490945 lt!490947))))

(declare-fun lt!490948 () ListLongMap!15275)

(declare-fun -!927 (ListLongMap!15275 (_ BitVec 64)) ListLongMap!15275)

(assert (=> b!1098539 (= lt!490945 (-!927 lt!490948 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41273)

(declare-datatypes ((Unit!36093 0))(
  ( (Unit!36094) )
))
(declare-fun lt!490946 () Unit!36093)

(declare-fun minValue!831 () V!41273)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!199 (array!71159 array!71161 (_ BitVec 32) (_ BitVec 32) V!41273 V!41273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36093)

(assert (=> b!1098539 (= lt!490946 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!199 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4206 (array!71159 array!71161 (_ BitVec 32) (_ BitVec 32) V!41273 V!41273 (_ BitVec 32) Int) ListLongMap!15275)

(declare-fun dynLambda!2324 (Int (_ BitVec 64)) V!41273)

(assert (=> b!1098539 (= lt!490947 (getCurrentListMapNoExtraKeys!4206 lt!490949 (array!71162 (store (arr!34246 _values!874) i!650 (ValueCellFull!12845 (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34783 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098539 (= lt!490948 (getCurrentListMapNoExtraKeys!4206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098539 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490950 () Unit!36093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71159 (_ BitVec 64) (_ BitVec 32)) Unit!36093)

(assert (=> b!1098539 (= lt!490950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098540 () Bool)

(declare-fun res!732841 () Bool)

(assert (=> b!1098540 (=> (not res!732841) (not e!627077))))

(assert (=> b!1098540 (= res!732841 (and (= (size!34783 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34782 _keys!1070) (size!34783 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42424 () Bool)

(declare-fun tp!81104 () Bool)

(declare-fun e!627082 () Bool)

(assert (=> mapNonEmpty!42424 (= mapRes!42424 (and tp!81104 e!627082))))

(declare-fun mapValue!42424 () ValueCell!12845)

(declare-fun mapRest!42424 () (Array (_ BitVec 32) ValueCell!12845))

(declare-fun mapKey!42424 () (_ BitVec 32))

(assert (=> mapNonEmpty!42424 (= (arr!34246 _values!874) (store mapRest!42424 mapKey!42424 mapValue!42424))))

(declare-fun b!1098541 () Bool)

(declare-fun res!732839 () Bool)

(assert (=> b!1098541 (=> (not res!732839) (not e!627077))))

(assert (=> b!1098541 (= res!732839 (= (select (arr!34245 _keys!1070) i!650) k0!904))))

(declare-fun b!1098542 () Bool)

(assert (=> b!1098542 (= e!627082 tp_is_empty!27109)))

(declare-fun b!1098543 () Bool)

(declare-fun res!732836 () Bool)

(assert (=> b!1098543 (=> (not res!732836) (not e!627080))))

(assert (=> b!1098543 (= res!732836 (arrayNoDuplicates!0 lt!490949 #b00000000000000000000000000000000 Nil!23918))))

(declare-fun b!1098544 () Bool)

(assert (=> b!1098544 (= e!627078 tp_is_empty!27109)))

(assert (= (and start!96716 res!732837) b!1098540))

(assert (= (and b!1098540 res!732841) b!1098536))

(assert (= (and b!1098536 res!732842) b!1098538))

(assert (= (and b!1098538 res!732840) b!1098533))

(assert (= (and b!1098533 res!732838) b!1098534))

(assert (= (and b!1098534 res!732843) b!1098541))

(assert (= (and b!1098541 res!732839) b!1098535))

(assert (= (and b!1098535 res!732844) b!1098543))

(assert (= (and b!1098543 res!732836) b!1098539))

(assert (= (and b!1098537 condMapEmpty!42424) mapIsEmpty!42424))

(assert (= (and b!1098537 (not condMapEmpty!42424)) mapNonEmpty!42424))

(get-info :version)

(assert (= (and mapNonEmpty!42424 ((_ is ValueCellFull!12845) mapValue!42424)) b!1098542))

(assert (= (and b!1098537 ((_ is ValueCellFull!12845) mapDefault!42424)) b!1098544))

(assert (= start!96716 b!1098537))

(declare-fun b_lambda!17727 () Bool)

(assert (=> (not b_lambda!17727) (not b!1098539)))

(declare-fun t!34017 () Bool)

(declare-fun tb!7917 () Bool)

(assert (=> (and start!96716 (= defaultEntry!882 defaultEntry!882) t!34017) tb!7917))

(declare-fun result!16365 () Bool)

(assert (=> tb!7917 (= result!16365 tp_is_empty!27109)))

(assert (=> b!1098539 t!34017))

(declare-fun b_and!36793 () Bool)

(assert (= b_and!36791 (and (=> t!34017 result!16365) b_and!36793)))

(declare-fun m!1018353 () Bool)

(assert (=> b!1098543 m!1018353))

(declare-fun m!1018355 () Bool)

(assert (=> b!1098538 m!1018355))

(declare-fun m!1018357 () Bool)

(assert (=> b!1098541 m!1018357))

(declare-fun m!1018359 () Bool)

(assert (=> b!1098535 m!1018359))

(declare-fun m!1018361 () Bool)

(assert (=> b!1098535 m!1018361))

(declare-fun m!1018363 () Bool)

(assert (=> b!1098539 m!1018363))

(declare-fun m!1018365 () Bool)

(assert (=> b!1098539 m!1018365))

(declare-fun m!1018367 () Bool)

(assert (=> b!1098539 m!1018367))

(declare-fun m!1018369 () Bool)

(assert (=> b!1098539 m!1018369))

(declare-fun m!1018371 () Bool)

(assert (=> b!1098539 m!1018371))

(declare-fun m!1018373 () Bool)

(assert (=> b!1098539 m!1018373))

(declare-fun m!1018375 () Bool)

(assert (=> b!1098539 m!1018375))

(declare-fun m!1018377 () Bool)

(assert (=> b!1098539 m!1018377))

(declare-fun m!1018379 () Bool)

(assert (=> b!1098534 m!1018379))

(declare-fun m!1018381 () Bool)

(assert (=> start!96716 m!1018381))

(declare-fun m!1018383 () Bool)

(assert (=> start!96716 m!1018383))

(declare-fun m!1018385 () Bool)

(assert (=> start!96716 m!1018385))

(declare-fun m!1018387 () Bool)

(assert (=> b!1098536 m!1018387))

(declare-fun m!1018389 () Bool)

(assert (=> mapNonEmpty!42424 m!1018389))

(check-sat (not b!1098538) (not mapNonEmpty!42424) (not b_lambda!17727) tp_is_empty!27109 (not b!1098535) b_and!36793 (not b!1098536) (not start!96716) (not b!1098543) (not b!1098539) (not b_next!23059) (not b!1098534))
(check-sat b_and!36793 (not b_next!23059))
