; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95978 () Bool)

(assert start!95978)

(declare-fun b_free!22631 () Bool)

(declare-fun b_next!22631 () Bool)

(assert (=> start!95978 (= b_free!22631 (not b_next!22631))))

(declare-fun tp!79741 () Bool)

(declare-fun b_and!35937 () Bool)

(assert (=> start!95978 (= tp!79741 b_and!35937)))

(declare-fun b!1087622 () Bool)

(declare-fun res!725345 () Bool)

(declare-fun e!621261 () Bool)

(assert (=> b!1087622 (=> (not res!725345) (not e!621261))))

(declare-datatypes ((array!70191 0))(
  ( (array!70192 (arr!33769 (Array (_ BitVec 32) (_ BitVec 64))) (size!34305 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70191)

(declare-datatypes ((List!23559 0))(
  ( (Nil!23556) (Cons!23555 (h!24764 (_ BitVec 64)) (t!33248 List!23559)) )
))
(declare-fun arrayNoDuplicates!0 (array!70191 (_ BitVec 32) List!23559) Bool)

(assert (=> b!1087622 (= res!725345 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23556))))

(declare-fun b!1087623 () Bool)

(declare-fun e!621265 () Bool)

(assert (=> b!1087623 (= e!621261 e!621265)))

(declare-fun res!725342 () Bool)

(assert (=> b!1087623 (=> (not res!725342) (not e!621265))))

(declare-fun lt!484081 () array!70191)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70191 (_ BitVec 32)) Bool)

(assert (=> b!1087623 (= res!725342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484081 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087623 (= lt!484081 (array!70192 (store (arr!33769 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34305 _keys!1070)))))

(declare-fun b!1087624 () Bool)

(declare-fun e!621259 () Bool)

(declare-fun tp_is_empty!26633 () Bool)

(assert (=> b!1087624 (= e!621259 tp_is_empty!26633)))

(declare-fun b!1087625 () Bool)

(declare-fun res!725338 () Bool)

(assert (=> b!1087625 (=> (not res!725338) (not e!621261))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087625 (= res!725338 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!41704 () Bool)

(declare-fun mapRes!41704 () Bool)

(assert (=> mapIsEmpty!41704 mapRes!41704))

(declare-fun b!1087626 () Bool)

(declare-fun res!725336 () Bool)

(assert (=> b!1087626 (=> (not res!725336) (not e!621261))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40637 0))(
  ( (V!40638 (val!13373 Int)) )
))
(declare-datatypes ((ValueCell!12607 0))(
  ( (ValueCellFull!12607 (v!15994 V!40637)) (EmptyCell!12607) )
))
(declare-datatypes ((array!70193 0))(
  ( (array!70194 (arr!33770 (Array (_ BitVec 32) ValueCell!12607)) (size!34306 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70193)

(assert (=> b!1087626 (= res!725336 (and (= (size!34306 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34305 _keys!1070) (size!34306 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087627 () Bool)

(declare-fun res!725343 () Bool)

(assert (=> b!1087627 (=> (not res!725343) (not e!621265))))

(assert (=> b!1087627 (= res!725343 (arrayNoDuplicates!0 lt!484081 #b00000000000000000000000000000000 Nil!23556))))

(declare-fun b!1087628 () Bool)

(declare-fun e!621264 () Bool)

(assert (=> b!1087628 (= e!621265 (not e!621264))))

(declare-fun res!725341 () Bool)

(assert (=> b!1087628 (=> res!725341 e!621264)))

(assert (=> b!1087628 (= res!725341 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40637)

(declare-fun zeroValue!831 () V!40637)

(declare-datatypes ((tuple2!16972 0))(
  ( (tuple2!16973 (_1!8497 (_ BitVec 64)) (_2!8497 V!40637)) )
))
(declare-datatypes ((List!23560 0))(
  ( (Nil!23557) (Cons!23556 (h!24765 tuple2!16972) (t!33249 List!23560)) )
))
(declare-datatypes ((ListLongMap!14941 0))(
  ( (ListLongMap!14942 (toList!7486 List!23560)) )
))
(declare-fun lt!484077 () ListLongMap!14941)

(declare-fun getCurrentListMap!4261 (array!70191 array!70193 (_ BitVec 32) (_ BitVec 32) V!40637 V!40637 (_ BitVec 32) Int) ListLongMap!14941)

(assert (=> b!1087628 (= lt!484077 (getCurrentListMap!4261 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484074 () array!70193)

(declare-fun lt!484075 () ListLongMap!14941)

(assert (=> b!1087628 (= lt!484075 (getCurrentListMap!4261 lt!484081 lt!484074 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484082 () ListLongMap!14941)

(declare-fun lt!484073 () ListLongMap!14941)

(assert (=> b!1087628 (and (= lt!484082 lt!484073) (= lt!484073 lt!484082))))

(declare-fun lt!484079 () ListLongMap!14941)

(declare-fun -!811 (ListLongMap!14941 (_ BitVec 64)) ListLongMap!14941)

(assert (=> b!1087628 (= lt!484073 (-!811 lt!484079 k!904))))

(declare-datatypes ((Unit!35788 0))(
  ( (Unit!35789) )
))
(declare-fun lt!484080 () Unit!35788)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!80 (array!70191 array!70193 (_ BitVec 32) (_ BitVec 32) V!40637 V!40637 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35788)

(assert (=> b!1087628 (= lt!484080 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!80 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4021 (array!70191 array!70193 (_ BitVec 32) (_ BitVec 32) V!40637 V!40637 (_ BitVec 32) Int) ListLongMap!14941)

(assert (=> b!1087628 (= lt!484082 (getCurrentListMapNoExtraKeys!4021 lt!484081 lt!484074 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2158 (Int (_ BitVec 64)) V!40637)

(assert (=> b!1087628 (= lt!484074 (array!70194 (store (arr!33770 _values!874) i!650 (ValueCellFull!12607 (dynLambda!2158 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34306 _values!874)))))

(assert (=> b!1087628 (= lt!484079 (getCurrentListMapNoExtraKeys!4021 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087628 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484078 () Unit!35788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70191 (_ BitVec 64) (_ BitVec 32)) Unit!35788)

(assert (=> b!1087628 (= lt!484078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087629 () Bool)

(declare-fun res!725344 () Bool)

(assert (=> b!1087629 (=> (not res!725344) (not e!621261))))

(assert (=> b!1087629 (= res!725344 (= (select (arr!33769 _keys!1070) i!650) k!904))))

(declare-fun b!1087630 () Bool)

(declare-fun e!621262 () Bool)

(declare-fun e!621266 () Bool)

(assert (=> b!1087630 (= e!621262 (and e!621266 mapRes!41704))))

(declare-fun condMapEmpty!41704 () Bool)

(declare-fun mapDefault!41704 () ValueCell!12607)

