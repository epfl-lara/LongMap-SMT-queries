; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95768 () Bool)

(assert start!95768)

(declare-fun b_free!22421 () Bool)

(declare-fun b_next!22421 () Bool)

(assert (=> start!95768 (= b_free!22421 (not b_next!22421))))

(declare-fun tp!79111 () Bool)

(declare-fun b_and!35517 () Bool)

(assert (=> start!95768 (= tp!79111 b_and!35517)))

(declare-fun b!1083211 () Bool)

(declare-fun e!618970 () Bool)

(assert (=> b!1083211 (= e!618970 (not true))))

(declare-datatypes ((V!40357 0))(
  ( (V!40358 (val!13268 Int)) )
))
(declare-datatypes ((tuple2!16812 0))(
  ( (tuple2!16813 (_1!8417 (_ BitVec 64)) (_2!8417 V!40357)) )
))
(declare-datatypes ((List!23398 0))(
  ( (Nil!23395) (Cons!23394 (h!24603 tuple2!16812) (t!32877 List!23398)) )
))
(declare-datatypes ((ListLongMap!14781 0))(
  ( (ListLongMap!14782 (toList!7406 List!23398)) )
))
(declare-fun lt!479970 () ListLongMap!14781)

(declare-fun lt!479969 () ListLongMap!14781)

(assert (=> b!1083211 (and (= lt!479970 lt!479969) (= lt!479969 lt!479970))))

(declare-fun lt!479971 () ListLongMap!14781)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!733 (ListLongMap!14781 (_ BitVec 64)) ListLongMap!14781)

(assert (=> b!1083211 (= lt!479969 (-!733 lt!479971 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40357)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35632 0))(
  ( (Unit!35633) )
))
(declare-fun lt!479967 () Unit!35632)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40357)

(declare-datatypes ((array!69789 0))(
  ( (array!69790 (arr!33568 (Array (_ BitVec 32) (_ BitVec 64))) (size!34104 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69789)

(declare-datatypes ((ValueCell!12502 0))(
  ( (ValueCellFull!12502 (v!15889 V!40357)) (EmptyCell!12502) )
))
(declare-datatypes ((array!69791 0))(
  ( (array!69792 (arr!33569 (Array (_ BitVec 32) ValueCell!12502)) (size!34105 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69791)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!13 (array!69789 array!69791 (_ BitVec 32) (_ BitVec 32) V!40357 V!40357 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35632)

(assert (=> b!1083211 (= lt!479967 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!13 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479968 () array!69789)

(declare-fun getCurrentListMapNoExtraKeys!3954 (array!69789 array!69791 (_ BitVec 32) (_ BitVec 32) V!40357 V!40357 (_ BitVec 32) Int) ListLongMap!14781)

(declare-fun dynLambda!2091 (Int (_ BitVec 64)) V!40357)

(assert (=> b!1083211 (= lt!479970 (getCurrentListMapNoExtraKeys!3954 lt!479968 (array!69792 (store (arr!33569 _values!874) i!650 (ValueCellFull!12502 (dynLambda!2091 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34105 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083211 (= lt!479971 (getCurrentListMapNoExtraKeys!3954 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083211 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479966 () Unit!35632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69789 (_ BitVec 64) (_ BitVec 32)) Unit!35632)

(assert (=> b!1083211 (= lt!479966 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun res!722081 () Bool)

(declare-fun e!618969 () Bool)

(assert (=> start!95768 (=> (not res!722081) (not e!618969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95768 (= res!722081 (validMask!0 mask!1414))))

(assert (=> start!95768 e!618969))

(assert (=> start!95768 tp!79111))

(assert (=> start!95768 true))

(declare-fun tp_is_empty!26423 () Bool)

(assert (=> start!95768 tp_is_empty!26423))

(declare-fun array_inv!25906 (array!69789) Bool)

(assert (=> start!95768 (array_inv!25906 _keys!1070)))

(declare-fun e!618968 () Bool)

(declare-fun array_inv!25907 (array!69791) Bool)

(assert (=> start!95768 (and (array_inv!25907 _values!874) e!618968)))

(declare-fun mapIsEmpty!41389 () Bool)

(declare-fun mapRes!41389 () Bool)

(assert (=> mapIsEmpty!41389 mapRes!41389))

(declare-fun b!1083212 () Bool)

(declare-fun res!722088 () Bool)

(assert (=> b!1083212 (=> (not res!722088) (not e!618970))))

(declare-datatypes ((List!23399 0))(
  ( (Nil!23396) (Cons!23395 (h!24604 (_ BitVec 64)) (t!32878 List!23399)) )
))
(declare-fun arrayNoDuplicates!0 (array!69789 (_ BitVec 32) List!23399) Bool)

(assert (=> b!1083212 (= res!722088 (arrayNoDuplicates!0 lt!479968 #b00000000000000000000000000000000 Nil!23396))))

(declare-fun b!1083213 () Bool)

(declare-fun res!722083 () Bool)

(assert (=> b!1083213 (=> (not res!722083) (not e!618969))))

(assert (=> b!1083213 (= res!722083 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23396))))

(declare-fun b!1083214 () Bool)

(assert (=> b!1083214 (= e!618969 e!618970)))

(declare-fun res!722082 () Bool)

(assert (=> b!1083214 (=> (not res!722082) (not e!618970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69789 (_ BitVec 32)) Bool)

(assert (=> b!1083214 (= res!722082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479968 mask!1414))))

(assert (=> b!1083214 (= lt!479968 (array!69790 (store (arr!33568 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34104 _keys!1070)))))

(declare-fun b!1083215 () Bool)

(declare-fun res!722087 () Bool)

(assert (=> b!1083215 (=> (not res!722087) (not e!618969))))

(assert (=> b!1083215 (= res!722087 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34104 _keys!1070))))))

(declare-fun b!1083216 () Bool)

(declare-fun res!722080 () Bool)

(assert (=> b!1083216 (=> (not res!722080) (not e!618969))))

(assert (=> b!1083216 (= res!722080 (= (select (arr!33568 _keys!1070) i!650) k!904))))

(declare-fun b!1083217 () Bool)

(declare-fun res!722084 () Bool)

(assert (=> b!1083217 (=> (not res!722084) (not e!618969))))

(assert (=> b!1083217 (= res!722084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083218 () Bool)

(declare-fun e!618966 () Bool)

(assert (=> b!1083218 (= e!618966 tp_is_empty!26423)))

(declare-fun mapNonEmpty!41389 () Bool)

(declare-fun tp!79112 () Bool)

(assert (=> mapNonEmpty!41389 (= mapRes!41389 (and tp!79112 e!618966))))

(declare-fun mapValue!41389 () ValueCell!12502)

(declare-fun mapKey!41389 () (_ BitVec 32))

(declare-fun mapRest!41389 () (Array (_ BitVec 32) ValueCell!12502))

(assert (=> mapNonEmpty!41389 (= (arr!33569 _values!874) (store mapRest!41389 mapKey!41389 mapValue!41389))))

(declare-fun b!1083219 () Bool)

(declare-fun e!618967 () Bool)

(assert (=> b!1083219 (= e!618967 tp_is_empty!26423)))

(declare-fun b!1083220 () Bool)

(declare-fun res!722085 () Bool)

(assert (=> b!1083220 (=> (not res!722085) (not e!618969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083220 (= res!722085 (validKeyInArray!0 k!904))))

(declare-fun b!1083221 () Bool)

(assert (=> b!1083221 (= e!618968 (and e!618967 mapRes!41389))))

(declare-fun condMapEmpty!41389 () Bool)

(declare-fun mapDefault!41389 () ValueCell!12502)

