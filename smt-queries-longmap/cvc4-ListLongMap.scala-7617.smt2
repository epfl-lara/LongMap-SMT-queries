; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96026 () Bool)

(assert start!96026)

(declare-fun b_free!22679 () Bool)

(declare-fun b_next!22679 () Bool)

(assert (=> start!96026 (= b_free!22679 (not b_next!22679))))

(declare-fun tp!79886 () Bool)

(declare-fun b_and!36033 () Bool)

(assert (=> start!96026 (= tp!79886 b_and!36033)))

(declare-fun b!1088678 () Bool)

(declare-fun res!726130 () Bool)

(declare-fun e!621839 () Bool)

(assert (=> b!1088678 (=> (not res!726130) (not e!621839))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70287 0))(
  ( (array!70288 (arr!33817 (Array (_ BitVec 32) (_ BitVec 64))) (size!34353 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70287)

(declare-datatypes ((V!40701 0))(
  ( (V!40702 (val!13397 Int)) )
))
(declare-datatypes ((ValueCell!12631 0))(
  ( (ValueCellFull!12631 (v!16018 V!40701)) (EmptyCell!12631) )
))
(declare-datatypes ((array!70289 0))(
  ( (array!70290 (arr!33818 (Array (_ BitVec 32) ValueCell!12631)) (size!34354 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70289)

(assert (=> b!1088678 (= res!726130 (and (= (size!34354 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34353 _keys!1070) (size!34354 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088679 () Bool)

(declare-fun e!621840 () Bool)

(assert (=> b!1088679 (= e!621839 e!621840)))

(declare-fun res!726129 () Bool)

(assert (=> b!1088679 (=> (not res!726129) (not e!621840))))

(declare-fun lt!485019 () array!70287)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70287 (_ BitVec 32)) Bool)

(assert (=> b!1088679 (= res!726129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485019 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088679 (= lt!485019 (array!70288 (store (arr!33817 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34353 _keys!1070)))))

(declare-fun b!1088680 () Bool)

(declare-fun e!621837 () Bool)

(assert (=> b!1088680 (= e!621837 true)))

(declare-datatypes ((tuple2!17010 0))(
  ( (tuple2!17011 (_1!8516 (_ BitVec 64)) (_2!8516 V!40701)) )
))
(declare-datatypes ((List!23598 0))(
  ( (Nil!23595) (Cons!23594 (h!24803 tuple2!17010) (t!33335 List!23598)) )
))
(declare-datatypes ((ListLongMap!14979 0))(
  ( (ListLongMap!14980 (toList!7505 List!23598)) )
))
(declare-fun lt!485011 () ListLongMap!14979)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!485008 () ListLongMap!14979)

(declare-fun -!830 (ListLongMap!14979 (_ BitVec 64)) ListLongMap!14979)

(assert (=> b!1088680 (= (-!830 lt!485011 k!904) lt!485008)))

(declare-datatypes ((Unit!35826 0))(
  ( (Unit!35827) )
))
(declare-fun lt!485013 () Unit!35826)

(declare-fun lt!485016 () ListLongMap!14979)

(declare-fun zeroValue!831 () V!40701)

(declare-fun addRemoveCommutativeForDiffKeys!59 (ListLongMap!14979 (_ BitVec 64) V!40701 (_ BitVec 64)) Unit!35826)

(assert (=> b!1088680 (= lt!485013 (addRemoveCommutativeForDiffKeys!59 lt!485016 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088681 () Bool)

(declare-fun res!726133 () Bool)

(assert (=> b!1088681 (=> (not res!726133) (not e!621840))))

(declare-datatypes ((List!23599 0))(
  ( (Nil!23596) (Cons!23595 (h!24804 (_ BitVec 64)) (t!33336 List!23599)) )
))
(declare-fun arrayNoDuplicates!0 (array!70287 (_ BitVec 32) List!23599) Bool)

(assert (=> b!1088681 (= res!726133 (arrayNoDuplicates!0 lt!485019 #b00000000000000000000000000000000 Nil!23596))))

(declare-fun b!1088682 () Bool)

(declare-fun res!726134 () Bool)

(assert (=> b!1088682 (=> (not res!726134) (not e!621839))))

(assert (=> b!1088682 (= res!726134 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23596))))

(declare-fun b!1088683 () Bool)

(declare-fun res!726131 () Bool)

(assert (=> b!1088683 (=> (not res!726131) (not e!621839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088683 (= res!726131 (validKeyInArray!0 k!904))))

(declare-fun b!1088684 () Bool)

(declare-fun e!621841 () Bool)

(declare-fun tp_is_empty!26681 () Bool)

(assert (=> b!1088684 (= e!621841 tp_is_empty!26681)))

(declare-fun b!1088685 () Bool)

(declare-fun e!621842 () Bool)

(assert (=> b!1088685 (= e!621842 tp_is_empty!26681)))

(declare-fun mapIsEmpty!41776 () Bool)

(declare-fun mapRes!41776 () Bool)

(assert (=> mapIsEmpty!41776 mapRes!41776))

(declare-fun b!1088686 () Bool)

(declare-fun e!621835 () Bool)

(assert (=> b!1088686 (= e!621835 e!621837)))

(declare-fun res!726132 () Bool)

(assert (=> b!1088686 (=> res!726132 e!621837)))

(assert (=> b!1088686 (= res!726132 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!485009 () ListLongMap!14979)

(assert (=> b!1088686 (= lt!485009 lt!485008)))

(declare-fun lt!485014 () ListLongMap!14979)

(declare-fun lt!485020 () tuple2!17010)

(declare-fun +!3304 (ListLongMap!14979 tuple2!17010) ListLongMap!14979)

(assert (=> b!1088686 (= lt!485008 (+!3304 lt!485014 lt!485020))))

(declare-fun lt!485015 () ListLongMap!14979)

(assert (=> b!1088686 (= lt!485015 lt!485011)))

(assert (=> b!1088686 (= lt!485011 (+!3304 lt!485016 lt!485020))))

(declare-fun lt!485017 () ListLongMap!14979)

(assert (=> b!1088686 (= lt!485009 (+!3304 lt!485017 lt!485020))))

(assert (=> b!1088686 (= lt!485020 (tuple2!17011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!726138 () Bool)

(assert (=> start!96026 (=> (not res!726138) (not e!621839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96026 (= res!726138 (validMask!0 mask!1414))))

(assert (=> start!96026 e!621839))

(assert (=> start!96026 tp!79886))

(assert (=> start!96026 true))

(assert (=> start!96026 tp_is_empty!26681))

(declare-fun array_inv!26080 (array!70287) Bool)

(assert (=> start!96026 (array_inv!26080 _keys!1070)))

(declare-fun e!621836 () Bool)

(declare-fun array_inv!26081 (array!70289) Bool)

(assert (=> start!96026 (and (array_inv!26081 _values!874) e!621836)))

(declare-fun b!1088687 () Bool)

(declare-fun res!726128 () Bool)

(assert (=> b!1088687 (=> (not res!726128) (not e!621839))))

(assert (=> b!1088687 (= res!726128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088688 () Bool)

(assert (=> b!1088688 (= e!621840 (not e!621835))))

(declare-fun res!726136 () Bool)

(assert (=> b!1088688 (=> res!726136 e!621835)))

(assert (=> b!1088688 (= res!726136 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40701)

(declare-fun getCurrentListMap!4278 (array!70287 array!70289 (_ BitVec 32) (_ BitVec 32) V!40701 V!40701 (_ BitVec 32) Int) ListLongMap!14979)

(assert (=> b!1088688 (= lt!485015 (getCurrentListMap!4278 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485018 () array!70289)

(assert (=> b!1088688 (= lt!485009 (getCurrentListMap!4278 lt!485019 lt!485018 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088688 (and (= lt!485017 lt!485014) (= lt!485014 lt!485017))))

(assert (=> b!1088688 (= lt!485014 (-!830 lt!485016 k!904))))

(declare-fun lt!485012 () Unit!35826)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!97 (array!70287 array!70289 (_ BitVec 32) (_ BitVec 32) V!40701 V!40701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35826)

(assert (=> b!1088688 (= lt!485012 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!97 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4038 (array!70287 array!70289 (_ BitVec 32) (_ BitVec 32) V!40701 V!40701 (_ BitVec 32) Int) ListLongMap!14979)

(assert (=> b!1088688 (= lt!485017 (getCurrentListMapNoExtraKeys!4038 lt!485019 lt!485018 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2175 (Int (_ BitVec 64)) V!40701)

(assert (=> b!1088688 (= lt!485018 (array!70290 (store (arr!33818 _values!874) i!650 (ValueCellFull!12631 (dynLambda!2175 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34354 _values!874)))))

(assert (=> b!1088688 (= lt!485016 (getCurrentListMapNoExtraKeys!4038 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088688 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485010 () Unit!35826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70287 (_ BitVec 64) (_ BitVec 32)) Unit!35826)

(assert (=> b!1088688 (= lt!485010 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!41776 () Bool)

(declare-fun tp!79885 () Bool)

(assert (=> mapNonEmpty!41776 (= mapRes!41776 (and tp!79885 e!621841))))

(declare-fun mapRest!41776 () (Array (_ BitVec 32) ValueCell!12631))

(declare-fun mapKey!41776 () (_ BitVec 32))

(declare-fun mapValue!41776 () ValueCell!12631)

(assert (=> mapNonEmpty!41776 (= (arr!33818 _values!874) (store mapRest!41776 mapKey!41776 mapValue!41776))))

(declare-fun b!1088689 () Bool)

(declare-fun res!726137 () Bool)

(assert (=> b!1088689 (=> (not res!726137) (not e!621839))))

(assert (=> b!1088689 (= res!726137 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34353 _keys!1070))))))

(declare-fun b!1088690 () Bool)

(assert (=> b!1088690 (= e!621836 (and e!621842 mapRes!41776))))

(declare-fun condMapEmpty!41776 () Bool)

(declare-fun mapDefault!41776 () ValueCell!12631)

