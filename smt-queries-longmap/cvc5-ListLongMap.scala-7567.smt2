; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95722 () Bool)

(assert start!95722)

(declare-fun b_free!22375 () Bool)

(declare-fun b_next!22375 () Bool)

(assert (=> start!95722 (= b_free!22375 (not b_next!22375))))

(declare-fun tp!78974 () Bool)

(declare-fun b_and!35425 () Bool)

(assert (=> start!95722 (= tp!78974 b_and!35425)))

(declare-fun b!1082337 () Bool)

(declare-fun res!721460 () Bool)

(declare-fun e!618552 () Bool)

(assert (=> b!1082337 (=> (not res!721460) (not e!618552))))

(declare-datatypes ((array!69701 0))(
  ( (array!69702 (arr!33524 (Array (_ BitVec 32) (_ BitVec 64))) (size!34060 (_ BitVec 32))) )
))
(declare-fun lt!479585 () array!69701)

(declare-datatypes ((List!23364 0))(
  ( (Nil!23361) (Cons!23360 (h!24569 (_ BitVec 64)) (t!32797 List!23364)) )
))
(declare-fun arrayNoDuplicates!0 (array!69701 (_ BitVec 32) List!23364) Bool)

(assert (=> b!1082337 (= res!721460 (arrayNoDuplicates!0 lt!479585 #b00000000000000000000000000000000 Nil!23361))))

(declare-fun b!1082338 () Bool)

(declare-fun res!721467 () Bool)

(declare-fun e!618557 () Bool)

(assert (=> b!1082338 (=> (not res!721467) (not e!618557))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69701)

(declare-datatypes ((V!40297 0))(
  ( (V!40298 (val!13245 Int)) )
))
(declare-datatypes ((ValueCell!12479 0))(
  ( (ValueCellFull!12479 (v!15866 V!40297)) (EmptyCell!12479) )
))
(declare-datatypes ((array!69703 0))(
  ( (array!69704 (arr!33525 (Array (_ BitVec 32) ValueCell!12479)) (size!34061 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69703)

(assert (=> b!1082338 (= res!721467 (and (= (size!34061 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34060 _keys!1070) (size!34061 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082339 () Bool)

(assert (=> b!1082339 (= e!618552 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40297)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!16780 0))(
  ( (tuple2!16781 (_1!8401 (_ BitVec 64)) (_2!8401 V!40297)) )
))
(declare-datatypes ((List!23365 0))(
  ( (Nil!23362) (Cons!23361 (h!24570 tuple2!16780) (t!32798 List!23365)) )
))
(declare-datatypes ((ListLongMap!14749 0))(
  ( (ListLongMap!14750 (toList!7390 List!23365)) )
))
(declare-fun lt!479587 () ListLongMap!14749)

(declare-fun zeroValue!831 () V!40297)

(declare-fun getCurrentListMapNoExtraKeys!3938 (array!69701 array!69703 (_ BitVec 32) (_ BitVec 32) V!40297 V!40297 (_ BitVec 32) Int) ListLongMap!14749)

(declare-fun dynLambda!2075 (Int (_ BitVec 64)) V!40297)

(assert (=> b!1082339 (= lt!479587 (getCurrentListMapNoExtraKeys!3938 lt!479585 (array!69704 (store (arr!33525 _values!874) i!650 (ValueCellFull!12479 (dynLambda!2075 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34061 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479584 () ListLongMap!14749)

(assert (=> b!1082339 (= lt!479584 (getCurrentListMapNoExtraKeys!3938 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082339 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35600 0))(
  ( (Unit!35601) )
))
(declare-fun lt!479586 () Unit!35600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69701 (_ BitVec 64) (_ BitVec 32)) Unit!35600)

(assert (=> b!1082339 (= lt!479586 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1082340 () Bool)

(declare-fun e!618553 () Bool)

(declare-fun tp_is_empty!26377 () Bool)

(assert (=> b!1082340 (= e!618553 tp_is_empty!26377)))

(declare-fun b!1082341 () Bool)

(declare-fun res!721466 () Bool)

(assert (=> b!1082341 (=> (not res!721466) (not e!618557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082341 (= res!721466 (validKeyInArray!0 k!904))))

(declare-fun b!1082342 () Bool)

(declare-fun res!721463 () Bool)

(assert (=> b!1082342 (=> (not res!721463) (not e!618557))))

(assert (=> b!1082342 (= res!721463 (= (select (arr!33524 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!41320 () Bool)

(declare-fun mapRes!41320 () Bool)

(declare-fun tp!78973 () Bool)

(declare-fun e!618556 () Bool)

(assert (=> mapNonEmpty!41320 (= mapRes!41320 (and tp!78973 e!618556))))

(declare-fun mapRest!41320 () (Array (_ BitVec 32) ValueCell!12479))

(declare-fun mapValue!41320 () ValueCell!12479)

(declare-fun mapKey!41320 () (_ BitVec 32))

(assert (=> mapNonEmpty!41320 (= (arr!33525 _values!874) (store mapRest!41320 mapKey!41320 mapValue!41320))))

(declare-fun b!1082344 () Bool)

(assert (=> b!1082344 (= e!618556 tp_is_empty!26377)))

(declare-fun mapIsEmpty!41320 () Bool)

(assert (=> mapIsEmpty!41320 mapRes!41320))

(declare-fun b!1082345 () Bool)

(declare-fun res!721461 () Bool)

(assert (=> b!1082345 (=> (not res!721461) (not e!618557))))

(assert (=> b!1082345 (= res!721461 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34060 _keys!1070))))))

(declare-fun b!1082346 () Bool)

(assert (=> b!1082346 (= e!618557 e!618552)))

(declare-fun res!721462 () Bool)

(assert (=> b!1082346 (=> (not res!721462) (not e!618552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69701 (_ BitVec 32)) Bool)

(assert (=> b!1082346 (= res!721462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479585 mask!1414))))

(assert (=> b!1082346 (= lt!479585 (array!69702 (store (arr!33524 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34060 _keys!1070)))))

(declare-fun b!1082347 () Bool)

(declare-fun res!721459 () Bool)

(assert (=> b!1082347 (=> (not res!721459) (not e!618557))))

(assert (=> b!1082347 (= res!721459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082348 () Bool)

(declare-fun e!618554 () Bool)

(assert (=> b!1082348 (= e!618554 (and e!618553 mapRes!41320))))

(declare-fun condMapEmpty!41320 () Bool)

(declare-fun mapDefault!41320 () ValueCell!12479)

