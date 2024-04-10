; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95788 () Bool)

(assert start!95788)

(declare-fun b_free!22441 () Bool)

(declare-fun b_next!22441 () Bool)

(assert (=> start!95788 (= b_free!22441 (not b_next!22441))))

(declare-fun tp!79171 () Bool)

(declare-fun b_and!35557 () Bool)

(assert (=> start!95788 (= tp!79171 b_and!35557)))

(declare-fun res!722354 () Bool)

(declare-fun e!619146 () Bool)

(assert (=> start!95788 (=> (not res!722354) (not e!619146))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95788 (= res!722354 (validMask!0 mask!1414))))

(assert (=> start!95788 e!619146))

(assert (=> start!95788 tp!79171))

(assert (=> start!95788 true))

(declare-fun tp_is_empty!26443 () Bool)

(assert (=> start!95788 tp_is_empty!26443))

(declare-datatypes ((array!69829 0))(
  ( (array!69830 (arr!33588 (Array (_ BitVec 32) (_ BitVec 64))) (size!34124 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69829)

(declare-fun array_inv!25924 (array!69829) Bool)

(assert (=> start!95788 (array_inv!25924 _keys!1070)))

(declare-datatypes ((V!40385 0))(
  ( (V!40386 (val!13278 Int)) )
))
(declare-datatypes ((ValueCell!12512 0))(
  ( (ValueCellFull!12512 (v!15899 V!40385)) (EmptyCell!12512) )
))
(declare-datatypes ((array!69831 0))(
  ( (array!69832 (arr!33589 (Array (_ BitVec 32) ValueCell!12512)) (size!34125 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69831)

(declare-fun e!619150 () Bool)

(declare-fun array_inv!25925 (array!69831) Bool)

(assert (=> start!95788 (and (array_inv!25925 _values!874) e!619150)))

(declare-fun b!1083591 () Bool)

(declare-fun e!619148 () Bool)

(assert (=> b!1083591 (= e!619148 (not true))))

(declare-fun lt!480152 () array!69831)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40385)

(declare-datatypes ((tuple2!16826 0))(
  ( (tuple2!16827 (_1!8424 (_ BitVec 64)) (_2!8424 V!40385)) )
))
(declare-datatypes ((List!23414 0))(
  ( (Nil!23411) (Cons!23410 (h!24619 tuple2!16826) (t!32913 List!23414)) )
))
(declare-datatypes ((ListLongMap!14795 0))(
  ( (ListLongMap!14796 (toList!7413 List!23414)) )
))
(declare-fun lt!480153 () ListLongMap!14795)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480150 () array!69829)

(declare-fun zeroValue!831 () V!40385)

(declare-fun getCurrentListMap!4201 (array!69829 array!69831 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) Int) ListLongMap!14795)

(assert (=> b!1083591 (= lt!480153 (getCurrentListMap!4201 lt!480150 lt!480152 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480157 () ListLongMap!14795)

(declare-fun lt!480154 () ListLongMap!14795)

(assert (=> b!1083591 (and (= lt!480157 lt!480154) (= lt!480154 lt!480157))))

(declare-fun lt!480155 () ListLongMap!14795)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!740 (ListLongMap!14795 (_ BitVec 64)) ListLongMap!14795)

(assert (=> b!1083591 (= lt!480154 (-!740 lt!480155 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35646 0))(
  ( (Unit!35647) )
))
(declare-fun lt!480156 () Unit!35646)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!20 (array!69829 array!69831 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35646)

(assert (=> b!1083591 (= lt!480156 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!20 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3961 (array!69829 array!69831 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) Int) ListLongMap!14795)

(assert (=> b!1083591 (= lt!480157 (getCurrentListMapNoExtraKeys!3961 lt!480150 lt!480152 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2098 (Int (_ BitVec 64)) V!40385)

(assert (=> b!1083591 (= lt!480152 (array!69832 (store (arr!33589 _values!874) i!650 (ValueCellFull!12512 (dynLambda!2098 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34125 _values!874)))))

(assert (=> b!1083591 (= lt!480155 (getCurrentListMapNoExtraKeys!3961 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083591 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480151 () Unit!35646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69829 (_ BitVec 64) (_ BitVec 32)) Unit!35646)

(assert (=> b!1083591 (= lt!480151 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083592 () Bool)

(declare-fun e!619149 () Bool)

(assert (=> b!1083592 (= e!619149 tp_is_empty!26443)))

(declare-fun b!1083593 () Bool)

(declare-fun res!722356 () Bool)

(assert (=> b!1083593 (=> (not res!722356) (not e!619146))))

(assert (=> b!1083593 (= res!722356 (and (= (size!34125 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34124 _keys!1070) (size!34125 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083594 () Bool)

(declare-fun mapRes!41419 () Bool)

(assert (=> b!1083594 (= e!619150 (and e!619149 mapRes!41419))))

(declare-fun condMapEmpty!41419 () Bool)

(declare-fun mapDefault!41419 () ValueCell!12512)

