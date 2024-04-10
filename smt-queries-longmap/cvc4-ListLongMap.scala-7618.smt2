; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96032 () Bool)

(assert start!96032)

(declare-fun b_free!22685 () Bool)

(declare-fun b_next!22685 () Bool)

(assert (=> start!96032 (= b_free!22685 (not b_next!22685))))

(declare-fun tp!79903 () Bool)

(declare-fun b_and!36045 () Bool)

(assert (=> start!96032 (= tp!79903 b_and!36045)))

(declare-fun b!1088810 () Bool)

(declare-fun res!726232 () Bool)

(declare-fun e!621912 () Bool)

(assert (=> b!1088810 (=> (not res!726232) (not e!621912))))

(declare-datatypes ((array!70299 0))(
  ( (array!70300 (arr!33823 (Array (_ BitVec 32) (_ BitVec 64))) (size!34359 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70299)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088810 (= res!726232 (= (select (arr!33823 _keys!1070) i!650) k!904))))

(declare-fun b!1088811 () Bool)

(declare-fun e!621913 () Bool)

(assert (=> b!1088811 (= e!621912 e!621913)))

(declare-fun res!726236 () Bool)

(assert (=> b!1088811 (=> (not res!726236) (not e!621913))))

(declare-fun lt!485132 () array!70299)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70299 (_ BitVec 32)) Bool)

(assert (=> b!1088811 (= res!726236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485132 mask!1414))))

(assert (=> b!1088811 (= lt!485132 (array!70300 (store (arr!33823 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34359 _keys!1070)))))

(declare-fun mapIsEmpty!41785 () Bool)

(declare-fun mapRes!41785 () Bool)

(assert (=> mapIsEmpty!41785 mapRes!41785))

(declare-fun b!1088812 () Bool)

(declare-fun e!621907 () Bool)

(assert (=> b!1088812 (= e!621913 (not e!621907))))

(declare-fun res!726228 () Bool)

(assert (=> b!1088812 (=> res!726228 e!621907)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088812 (= res!726228 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40709 0))(
  ( (V!40710 (val!13400 Int)) )
))
(declare-fun minValue!831 () V!40709)

(declare-datatypes ((tuple2!17016 0))(
  ( (tuple2!17017 (_1!8519 (_ BitVec 64)) (_2!8519 V!40709)) )
))
(declare-datatypes ((List!23604 0))(
  ( (Nil!23601) (Cons!23600 (h!24809 tuple2!17016) (t!33347 List!23604)) )
))
(declare-datatypes ((ListLongMap!14985 0))(
  ( (ListLongMap!14986 (toList!7508 List!23604)) )
))
(declare-fun lt!485126 () ListLongMap!14985)

(declare-datatypes ((ValueCell!12634 0))(
  ( (ValueCellFull!12634 (v!16021 V!40709)) (EmptyCell!12634) )
))
(declare-datatypes ((array!70301 0))(
  ( (array!70302 (arr!33824 (Array (_ BitVec 32) ValueCell!12634)) (size!34360 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70301)

(declare-fun zeroValue!831 () V!40709)

(declare-fun getCurrentListMap!4281 (array!70299 array!70301 (_ BitVec 32) (_ BitVec 32) V!40709 V!40709 (_ BitVec 32) Int) ListLongMap!14985)

(assert (=> b!1088812 (= lt!485126 (getCurrentListMap!4281 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485129 () ListLongMap!14985)

(declare-fun lt!485125 () array!70301)

(assert (=> b!1088812 (= lt!485129 (getCurrentListMap!4281 lt!485132 lt!485125 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485136 () ListLongMap!14985)

(declare-fun lt!485137 () ListLongMap!14985)

(assert (=> b!1088812 (and (= lt!485136 lt!485137) (= lt!485137 lt!485136))))

(declare-fun lt!485133 () ListLongMap!14985)

(declare-fun -!833 (ListLongMap!14985 (_ BitVec 64)) ListLongMap!14985)

(assert (=> b!1088812 (= lt!485137 (-!833 lt!485133 k!904))))

(declare-datatypes ((Unit!35832 0))(
  ( (Unit!35833) )
))
(declare-fun lt!485130 () Unit!35832)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!100 (array!70299 array!70301 (_ BitVec 32) (_ BitVec 32) V!40709 V!40709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35832)

(assert (=> b!1088812 (= lt!485130 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!100 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4041 (array!70299 array!70301 (_ BitVec 32) (_ BitVec 32) V!40709 V!40709 (_ BitVec 32) Int) ListLongMap!14985)

(assert (=> b!1088812 (= lt!485136 (getCurrentListMapNoExtraKeys!4041 lt!485132 lt!485125 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2178 (Int (_ BitVec 64)) V!40709)

(assert (=> b!1088812 (= lt!485125 (array!70302 (store (arr!33824 _values!874) i!650 (ValueCellFull!12634 (dynLambda!2178 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34360 _values!874)))))

(assert (=> b!1088812 (= lt!485133 (getCurrentListMapNoExtraKeys!4041 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088812 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485134 () Unit!35832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70299 (_ BitVec 64) (_ BitVec 32)) Unit!35832)

(assert (=> b!1088812 (= lt!485134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun res!726229 () Bool)

(assert (=> start!96032 (=> (not res!726229) (not e!621912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96032 (= res!726229 (validMask!0 mask!1414))))

(assert (=> start!96032 e!621912))

(assert (=> start!96032 tp!79903))

(assert (=> start!96032 true))

(declare-fun tp_is_empty!26687 () Bool)

(assert (=> start!96032 tp_is_empty!26687))

(declare-fun array_inv!26086 (array!70299) Bool)

(assert (=> start!96032 (array_inv!26086 _keys!1070)))

(declare-fun e!621909 () Bool)

(declare-fun array_inv!26087 (array!70301) Bool)

(assert (=> start!96032 (and (array_inv!26087 _values!874) e!621909)))

(declare-fun b!1088813 () Bool)

(declare-fun res!726234 () Bool)

(assert (=> b!1088813 (=> (not res!726234) (not e!621912))))

(assert (=> b!1088813 (= res!726234 (and (= (size!34360 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34359 _keys!1070) (size!34360 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088814 () Bool)

(declare-fun res!726237 () Bool)

(assert (=> b!1088814 (=> (not res!726237) (not e!621912))))

(assert (=> b!1088814 (= res!726237 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34359 _keys!1070))))))

(declare-fun b!1088815 () Bool)

(declare-fun e!621911 () Bool)

(assert (=> b!1088815 (= e!621911 true)))

(declare-fun lt!485135 () ListLongMap!14985)

(declare-fun lt!485128 () ListLongMap!14985)

(assert (=> b!1088815 (= (-!833 lt!485135 k!904) lt!485128)))

(declare-fun lt!485131 () Unit!35832)

(declare-fun addRemoveCommutativeForDiffKeys!61 (ListLongMap!14985 (_ BitVec 64) V!40709 (_ BitVec 64)) Unit!35832)

(assert (=> b!1088815 (= lt!485131 (addRemoveCommutativeForDiffKeys!61 lt!485133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088816 () Bool)

(declare-fun res!726235 () Bool)

(assert (=> b!1088816 (=> (not res!726235) (not e!621913))))

(declare-datatypes ((List!23605 0))(
  ( (Nil!23602) (Cons!23601 (h!24810 (_ BitVec 64)) (t!33348 List!23605)) )
))
(declare-fun arrayNoDuplicates!0 (array!70299 (_ BitVec 32) List!23605) Bool)

(assert (=> b!1088816 (= res!726235 (arrayNoDuplicates!0 lt!485132 #b00000000000000000000000000000000 Nil!23602))))

(declare-fun mapNonEmpty!41785 () Bool)

(declare-fun tp!79904 () Bool)

(declare-fun e!621914 () Bool)

(assert (=> mapNonEmpty!41785 (= mapRes!41785 (and tp!79904 e!621914))))

(declare-fun mapValue!41785 () ValueCell!12634)

(declare-fun mapRest!41785 () (Array (_ BitVec 32) ValueCell!12634))

(declare-fun mapKey!41785 () (_ BitVec 32))

(assert (=> mapNonEmpty!41785 (= (arr!33824 _values!874) (store mapRest!41785 mapKey!41785 mapValue!41785))))

(declare-fun b!1088817 () Bool)

(assert (=> b!1088817 (= e!621914 tp_is_empty!26687)))

(declare-fun b!1088818 () Bool)

(declare-fun res!726230 () Bool)

(assert (=> b!1088818 (=> (not res!726230) (not e!621912))))

(assert (=> b!1088818 (= res!726230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088819 () Bool)

(declare-fun res!726227 () Bool)

(assert (=> b!1088819 (=> (not res!726227) (not e!621912))))

(assert (=> b!1088819 (= res!726227 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23602))))

(declare-fun b!1088820 () Bool)

(assert (=> b!1088820 (= e!621907 e!621911)))

(declare-fun res!726231 () Bool)

(assert (=> b!1088820 (=> res!726231 e!621911)))

(assert (=> b!1088820 (= res!726231 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1088820 (= lt!485129 lt!485128)))

(declare-fun lt!485127 () tuple2!17016)

(declare-fun +!3307 (ListLongMap!14985 tuple2!17016) ListLongMap!14985)

(assert (=> b!1088820 (= lt!485128 (+!3307 lt!485137 lt!485127))))

(assert (=> b!1088820 (= lt!485126 lt!485135)))

(assert (=> b!1088820 (= lt!485135 (+!3307 lt!485133 lt!485127))))

(assert (=> b!1088820 (= lt!485129 (+!3307 lt!485136 lt!485127))))

(assert (=> b!1088820 (= lt!485127 (tuple2!17017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088821 () Bool)

(declare-fun res!726233 () Bool)

(assert (=> b!1088821 (=> (not res!726233) (not e!621912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088821 (= res!726233 (validKeyInArray!0 k!904))))

(declare-fun b!1088822 () Bool)

(declare-fun e!621910 () Bool)

(assert (=> b!1088822 (= e!621909 (and e!621910 mapRes!41785))))

(declare-fun condMapEmpty!41785 () Bool)

(declare-fun mapDefault!41785 () ValueCell!12634)

