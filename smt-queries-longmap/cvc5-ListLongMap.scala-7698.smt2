; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96640 () Bool)

(assert start!96640)

(declare-fun b_free!23113 () Bool)

(declare-fun b_next!23113 () Bool)

(assert (=> start!96640 (= b_free!23113 (not b_next!23113))))

(declare-fun tp!81278 () Bool)

(declare-fun b_and!36945 () Bool)

(assert (=> start!96640 (= tp!81278 b_and!36945)))

(declare-fun res!733549 () Bool)

(declare-fun e!627360 () Bool)

(assert (=> start!96640 (=> (not res!733549) (not e!627360))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96640 (= res!733549 (validMask!0 mask!1414))))

(assert (=> start!96640 e!627360))

(assert (=> start!96640 tp!81278))

(assert (=> start!96640 true))

(declare-fun tp_is_empty!27163 () Bool)

(assert (=> start!96640 tp_is_empty!27163))

(declare-datatypes ((array!71239 0))(
  ( (array!71240 (arr!34287 (Array (_ BitVec 32) (_ BitVec 64))) (size!34823 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71239)

(declare-fun array_inv!26412 (array!71239) Bool)

(assert (=> start!96640 (array_inv!26412 _keys!1070)))

(declare-datatypes ((V!41345 0))(
  ( (V!41346 (val!13638 Int)) )
))
(declare-datatypes ((ValueCell!12872 0))(
  ( (ValueCellFull!12872 (v!16263 V!41345)) (EmptyCell!12872) )
))
(declare-datatypes ((array!71241 0))(
  ( (array!71242 (arr!34288 (Array (_ BitVec 32) ValueCell!12872)) (size!34824 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71241)

(declare-fun e!627358 () Bool)

(declare-fun array_inv!26413 (array!71241) Bool)

(assert (=> start!96640 (and (array_inv!26413 _values!874) e!627358)))

(declare-fun b!1099176 () Bool)

(declare-fun e!627361 () Bool)

(assert (=> b!1099176 (= e!627361 tp_is_empty!27163)))

(declare-fun b!1099177 () Bool)

(declare-fun res!733556 () Bool)

(assert (=> b!1099177 (=> (not res!733556) (not e!627360))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099177 (= res!733556 (and (= (size!34824 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34823 _keys!1070) (size!34824 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099178 () Bool)

(declare-fun res!733553 () Bool)

(assert (=> b!1099178 (=> (not res!733553) (not e!627360))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099178 (= res!733553 (= (select (arr!34287 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!42517 () Bool)

(declare-fun mapRes!42517 () Bool)

(declare-fun tp!81277 () Bool)

(declare-fun e!627359 () Bool)

(assert (=> mapNonEmpty!42517 (= mapRes!42517 (and tp!81277 e!627359))))

(declare-fun mapKey!42517 () (_ BitVec 32))

(declare-fun mapRest!42517 () (Array (_ BitVec 32) ValueCell!12872))

(declare-fun mapValue!42517 () ValueCell!12872)

(assert (=> mapNonEmpty!42517 (= (arr!34288 _values!874) (store mapRest!42517 mapKey!42517 mapValue!42517))))

(declare-fun b!1099179 () Bool)

(declare-fun res!733548 () Bool)

(assert (=> b!1099179 (=> (not res!733548) (not e!627360))))

(declare-datatypes ((List!23946 0))(
  ( (Nil!23943) (Cons!23942 (h!25151 (_ BitVec 64)) (t!34105 List!23946)) )
))
(declare-fun arrayNoDuplicates!0 (array!71239 (_ BitVec 32) List!23946) Bool)

(assert (=> b!1099179 (= res!733548 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23943))))

(declare-fun b!1099180 () Bool)

(declare-fun res!733555 () Bool)

(assert (=> b!1099180 (=> (not res!733555) (not e!627360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099180 (= res!733555 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!42517 () Bool)

(assert (=> mapIsEmpty!42517 mapRes!42517))

(declare-fun b!1099181 () Bool)

(assert (=> b!1099181 (= e!627359 tp_is_empty!27163)))

(declare-fun b!1099182 () Bool)

(declare-fun e!627363 () Bool)

(assert (=> b!1099182 (= e!627360 e!627363)))

(declare-fun res!733547 () Bool)

(assert (=> b!1099182 (=> (not res!733547) (not e!627363))))

(declare-fun lt!492117 () array!71239)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71239 (_ BitVec 32)) Bool)

(assert (=> b!1099182 (= res!733547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492117 mask!1414))))

(assert (=> b!1099182 (= lt!492117 (array!71240 (store (arr!34287 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34823 _keys!1070)))))

(declare-fun b!1099183 () Bool)

(declare-fun e!627362 () Bool)

(assert (=> b!1099183 (= e!627363 (not e!627362))))

(declare-fun res!733552 () Bool)

(assert (=> b!1099183 (=> res!733552 e!627362)))

(assert (=> b!1099183 (= res!733552 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41345)

(declare-datatypes ((tuple2!17328 0))(
  ( (tuple2!17329 (_1!8675 (_ BitVec 64)) (_2!8675 V!41345)) )
))
(declare-datatypes ((List!23947 0))(
  ( (Nil!23944) (Cons!23943 (h!25152 tuple2!17328) (t!34106 List!23947)) )
))
(declare-datatypes ((ListLongMap!15297 0))(
  ( (ListLongMap!15298 (toList!7664 List!23947)) )
))
(declare-fun lt!492109 () ListLongMap!15297)

(declare-fun zeroValue!831 () V!41345)

(declare-fun getCurrentListMap!4378 (array!71239 array!71241 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) Int) ListLongMap!15297)

(assert (=> b!1099183 (= lt!492109 (getCurrentListMap!4378 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492116 () array!71241)

(declare-fun lt!492111 () ListLongMap!15297)

(assert (=> b!1099183 (= lt!492111 (getCurrentListMap!4378 lt!492117 lt!492116 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492114 () ListLongMap!15297)

(declare-fun lt!492110 () ListLongMap!15297)

(assert (=> b!1099183 (and (= lt!492114 lt!492110) (= lt!492110 lt!492114))))

(declare-fun lt!492115 () ListLongMap!15297)

(declare-fun -!953 (ListLongMap!15297 (_ BitVec 64)) ListLongMap!15297)

(assert (=> b!1099183 (= lt!492110 (-!953 lt!492115 k!904))))

(declare-datatypes ((Unit!36146 0))(
  ( (Unit!36147) )
))
(declare-fun lt!492112 () Unit!36146)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!204 (array!71239 array!71241 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36146)

(assert (=> b!1099183 (= lt!492112 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!204 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4174 (array!71239 array!71241 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) Int) ListLongMap!15297)

(assert (=> b!1099183 (= lt!492114 (getCurrentListMapNoExtraKeys!4174 lt!492117 lt!492116 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2309 (Int (_ BitVec 64)) V!41345)

(assert (=> b!1099183 (= lt!492116 (array!71242 (store (arr!34288 _values!874) i!650 (ValueCellFull!12872 (dynLambda!2309 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34824 _values!874)))))

(assert (=> b!1099183 (= lt!492115 (getCurrentListMapNoExtraKeys!4174 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099183 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!492113 () Unit!36146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71239 (_ BitVec 64) (_ BitVec 32)) Unit!36146)

(assert (=> b!1099183 (= lt!492113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1099184 () Bool)

(declare-fun res!733551 () Bool)

(assert (=> b!1099184 (=> (not res!733551) (not e!627363))))

(assert (=> b!1099184 (= res!733551 (arrayNoDuplicates!0 lt!492117 #b00000000000000000000000000000000 Nil!23943))))

(declare-fun b!1099185 () Bool)

(assert (=> b!1099185 (= e!627358 (and e!627361 mapRes!42517))))

(declare-fun condMapEmpty!42517 () Bool)

(declare-fun mapDefault!42517 () ValueCell!12872)

