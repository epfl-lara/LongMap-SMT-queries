; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95914 () Bool)

(assert start!95914)

(declare-fun b_free!22567 () Bool)

(declare-fun b_next!22567 () Bool)

(assert (=> start!95914 (= b_free!22567 (not b_next!22567))))

(declare-fun tp!79550 () Bool)

(declare-fun b_and!35809 () Bool)

(assert (=> start!95914 (= tp!79550 b_and!35809)))

(declare-fun b!1086206 () Bool)

(declare-fun res!724276 () Bool)

(declare-fun e!620495 () Bool)

(assert (=> b!1086206 (=> (not res!724276) (not e!620495))))

(declare-datatypes ((array!70073 0))(
  ( (array!70074 (arr!33710 (Array (_ BitVec 32) (_ BitVec 64))) (size!34246 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70073)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70073 (_ BitVec 32)) Bool)

(assert (=> b!1086206 (= res!724276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41608 () Bool)

(declare-fun mapRes!41608 () Bool)

(assert (=> mapIsEmpty!41608 mapRes!41608))

(declare-fun b!1086207 () Bool)

(declare-fun res!724281 () Bool)

(assert (=> b!1086207 (=> (not res!724281) (not e!620495))))

(declare-datatypes ((List!23510 0))(
  ( (Nil!23507) (Cons!23506 (h!24715 (_ BitVec 64)) (t!33135 List!23510)) )
))
(declare-fun arrayNoDuplicates!0 (array!70073 (_ BitVec 32) List!23510) Bool)

(assert (=> b!1086207 (= res!724281 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23507))))

(declare-fun b!1086208 () Bool)

(declare-fun e!620498 () Bool)

(declare-fun e!620494 () Bool)

(assert (=> b!1086208 (= e!620498 (not e!620494))))

(declare-fun res!724278 () Bool)

(assert (=> b!1086208 (=> res!724278 e!620494)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086208 (= res!724278 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40553 0))(
  ( (V!40554 (val!13341 Int)) )
))
(declare-datatypes ((tuple2!16920 0))(
  ( (tuple2!16921 (_1!8471 (_ BitVec 64)) (_2!8471 V!40553)) )
))
(declare-datatypes ((List!23511 0))(
  ( (Nil!23508) (Cons!23507 (h!24716 tuple2!16920) (t!33136 List!23511)) )
))
(declare-datatypes ((ListLongMap!14889 0))(
  ( (ListLongMap!14890 (toList!7460 List!23511)) )
))
(declare-fun lt!482584 () ListLongMap!14889)

(declare-fun zeroValue!831 () V!40553)

(declare-datatypes ((ValueCell!12575 0))(
  ( (ValueCellFull!12575 (v!15962 V!40553)) (EmptyCell!12575) )
))
(declare-datatypes ((array!70075 0))(
  ( (array!70076 (arr!33711 (Array (_ BitVec 32) ValueCell!12575)) (size!34247 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70075)

(declare-fun minValue!831 () V!40553)

(declare-fun getCurrentListMap!4241 (array!70073 array!70075 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) Int) ListLongMap!14889)

(assert (=> b!1086208 (= lt!482584 (getCurrentListMap!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482580 () array!70073)

(declare-fun lt!482573 () array!70075)

(declare-fun lt!482574 () ListLongMap!14889)

(assert (=> b!1086208 (= lt!482574 (getCurrentListMap!4241 lt!482580 lt!482573 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482585 () ListLongMap!14889)

(declare-fun lt!482576 () ListLongMap!14889)

(assert (=> b!1086208 (and (= lt!482585 lt!482576) (= lt!482576 lt!482585))))

(declare-fun lt!482581 () ListLongMap!14889)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!786 (ListLongMap!14889 (_ BitVec 64)) ListLongMap!14889)

(assert (=> b!1086208 (= lt!482576 (-!786 lt!482581 k!904))))

(declare-datatypes ((Unit!35738 0))(
  ( (Unit!35739) )
))
(declare-fun lt!482577 () Unit!35738)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!60 (array!70073 array!70075 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35738)

(assert (=> b!1086208 (= lt!482577 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!60 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4001 (array!70073 array!70075 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) Int) ListLongMap!14889)

(assert (=> b!1086208 (= lt!482585 (getCurrentListMapNoExtraKeys!4001 lt!482580 lt!482573 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2138 (Int (_ BitVec 64)) V!40553)

(assert (=> b!1086208 (= lt!482573 (array!70076 (store (arr!33711 _values!874) i!650 (ValueCellFull!12575 (dynLambda!2138 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34247 _values!874)))))

(assert (=> b!1086208 (= lt!482581 (getCurrentListMapNoExtraKeys!4001 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086208 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!482578 () Unit!35738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70073 (_ BitVec 64) (_ BitVec 32)) Unit!35738)

(assert (=> b!1086208 (= lt!482578 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1086209 () Bool)

(declare-fun res!724275 () Bool)

(assert (=> b!1086209 (=> (not res!724275) (not e!620495))))

(assert (=> b!1086209 (= res!724275 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34246 _keys!1070))))))

(declare-fun b!1086210 () Bool)

(declare-fun e!620497 () Bool)

(declare-fun e!620496 () Bool)

(assert (=> b!1086210 (= e!620497 (and e!620496 mapRes!41608))))

(declare-fun condMapEmpty!41608 () Bool)

(declare-fun mapDefault!41608 () ValueCell!12575)

