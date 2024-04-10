; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96292 () Bool)

(assert start!96292)

(declare-fun b_free!22945 () Bool)

(declare-fun b_next!22945 () Bool)

(assert (=> start!96292 (= b_free!22945 (not b_next!22945))))

(declare-fun tp!80684 () Bool)

(declare-fun b_and!36565 () Bool)

(assert (=> start!96292 (= tp!80684 b_and!36565)))

(declare-fun b!1094229 () Bool)

(declare-fun res!730223 () Bool)

(declare-fun e!624720 () Bool)

(assert (=> b!1094229 (=> (not res!730223) (not e!624720))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70809 0))(
  ( (array!70810 (arr!34078 (Array (_ BitVec 32) (_ BitVec 64))) (size!34614 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70809)

(assert (=> b!1094229 (= res!730223 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34614 _keys!1070))))))

(declare-fun b!1094230 () Bool)

(declare-fun res!730219 () Bool)

(assert (=> b!1094230 (=> (not res!730219) (not e!624720))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1094230 (= res!730219 (= (select (arr!34078 _keys!1070) i!650) k!904))))

(declare-fun e!624719 () Bool)

(declare-fun b!1094231 () Bool)

(declare-datatypes ((V!41057 0))(
  ( (V!41058 (val!13530 Int)) )
))
(declare-datatypes ((tuple2!17212 0))(
  ( (tuple2!17213 (_1!8617 (_ BitVec 64)) (_2!8617 V!41057)) )
))
(declare-datatypes ((List!23809 0))(
  ( (Nil!23806) (Cons!23805 (h!25014 tuple2!17212) (t!33812 List!23809)) )
))
(declare-datatypes ((ListLongMap!15181 0))(
  ( (ListLongMap!15182 (toList!7606 List!23809)) )
))
(declare-fun lt!489563 () ListLongMap!15181)

(declare-fun lt!489566 () ListLongMap!15181)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!489565 () Bool)

(assert (=> b!1094231 (= e!624719 (not (or (and (not lt!489565) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!489565) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!489565) (not (= lt!489566 lt!489563)) (bvsle #b00000000000000000000000000000000 (size!34614 _keys!1070)))))))

(assert (=> b!1094231 (= lt!489565 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41057)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!489564 () ListLongMap!15181)

(declare-fun zeroValue!831 () V!41057)

(declare-datatypes ((ValueCell!12764 0))(
  ( (ValueCellFull!12764 (v!16151 V!41057)) (EmptyCell!12764) )
))
(declare-datatypes ((array!70811 0))(
  ( (array!70812 (arr!34079 (Array (_ BitVec 32) ValueCell!12764)) (size!34615 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70811)

(declare-fun getCurrentListMap!4362 (array!70809 array!70811 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) Int) ListLongMap!15181)

(assert (=> b!1094231 (= lt!489564 (getCurrentListMap!4362 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489559 () array!70809)

(declare-fun lt!489562 () array!70811)

(assert (=> b!1094231 (= lt!489566 (getCurrentListMap!4362 lt!489559 lt!489562 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489561 () ListLongMap!15181)

(assert (=> b!1094231 (and (= lt!489563 lt!489561) (= lt!489561 lt!489563))))

(declare-fun lt!489568 () ListLongMap!15181)

(declare-fun -!925 (ListLongMap!15181 (_ BitVec 64)) ListLongMap!15181)

(assert (=> b!1094231 (= lt!489561 (-!925 lt!489568 k!904))))

(declare-datatypes ((Unit!36016 0))(
  ( (Unit!36017) )
))
(declare-fun lt!489567 () Unit!36016)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!181 (array!70809 array!70811 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36016)

(assert (=> b!1094231 (= lt!489567 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!181 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4122 (array!70809 array!70811 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) Int) ListLongMap!15181)

(assert (=> b!1094231 (= lt!489563 (getCurrentListMapNoExtraKeys!4122 lt!489559 lt!489562 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2259 (Int (_ BitVec 64)) V!41057)

(assert (=> b!1094231 (= lt!489562 (array!70812 (store (arr!34079 _values!874) i!650 (ValueCellFull!12764 (dynLambda!2259 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34615 _values!874)))))

(assert (=> b!1094231 (= lt!489568 (getCurrentListMapNoExtraKeys!4122 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094231 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489560 () Unit!36016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70809 (_ BitVec 64) (_ BitVec 32)) Unit!36016)

(assert (=> b!1094231 (= lt!489560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1094232 () Bool)

(declare-fun res!730220 () Bool)

(assert (=> b!1094232 (=> (not res!730220) (not e!624719))))

(declare-datatypes ((List!23810 0))(
  ( (Nil!23807) (Cons!23806 (h!25015 (_ BitVec 64)) (t!33813 List!23810)) )
))
(declare-fun arrayNoDuplicates!0 (array!70809 (_ BitVec 32) List!23810) Bool)

(assert (=> b!1094232 (= res!730220 (arrayNoDuplicates!0 lt!489559 #b00000000000000000000000000000000 Nil!23807))))

(declare-fun b!1094233 () Bool)

(declare-fun e!624718 () Bool)

(declare-fun e!624717 () Bool)

(declare-fun mapRes!42175 () Bool)

(assert (=> b!1094233 (= e!624718 (and e!624717 mapRes!42175))))

(declare-fun condMapEmpty!42175 () Bool)

(declare-fun mapDefault!42175 () ValueCell!12764)

