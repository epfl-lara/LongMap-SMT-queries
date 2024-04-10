; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95806 () Bool)

(assert start!95806)

(declare-fun b_free!22459 () Bool)

(declare-fun b_next!22459 () Bool)

(assert (=> start!95806 (= b_free!22459 (not b_next!22459))))

(declare-fun tp!79226 () Bool)

(declare-fun b_and!35593 () Bool)

(assert (=> start!95806 (= tp!79226 b_and!35593)))

(declare-fun b!1083933 () Bool)

(declare-fun res!722601 () Bool)

(declare-fun e!619310 () Bool)

(assert (=> b!1083933 (=> (not res!722601) (not e!619310))))

(declare-datatypes ((array!69865 0))(
  ( (array!69866 (arr!33606 (Array (_ BitVec 32) (_ BitVec 64))) (size!34142 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69865)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69865 (_ BitVec 32)) Bool)

(assert (=> b!1083933 (= res!722601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41446 () Bool)

(declare-fun mapRes!41446 () Bool)

(declare-fun tp!79225 () Bool)

(declare-fun e!619309 () Bool)

(assert (=> mapNonEmpty!41446 (= mapRes!41446 (and tp!79225 e!619309))))

(declare-datatypes ((V!40409 0))(
  ( (V!40410 (val!13287 Int)) )
))
(declare-datatypes ((ValueCell!12521 0))(
  ( (ValueCellFull!12521 (v!15908 V!40409)) (EmptyCell!12521) )
))
(declare-fun mapValue!41446 () ValueCell!12521)

(declare-datatypes ((array!69867 0))(
  ( (array!69868 (arr!33607 (Array (_ BitVec 32) ValueCell!12521)) (size!34143 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69867)

(declare-fun mapKey!41446 () (_ BitVec 32))

(declare-fun mapRest!41446 () (Array (_ BitVec 32) ValueCell!12521))

(assert (=> mapNonEmpty!41446 (= (arr!33607 _values!874) (store mapRest!41446 mapKey!41446 mapValue!41446))))

(declare-fun mapIsEmpty!41446 () Bool)

(assert (=> mapIsEmpty!41446 mapRes!41446))

(declare-fun b!1083934 () Bool)

(declare-fun e!619311 () Bool)

(assert (=> b!1083934 (= e!619311 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40409)

(declare-fun lt!480369 () array!69865)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480368 () array!69867)

(declare-datatypes ((tuple2!16842 0))(
  ( (tuple2!16843 (_1!8432 (_ BitVec 64)) (_2!8432 V!40409)) )
))
(declare-datatypes ((List!23430 0))(
  ( (Nil!23427) (Cons!23426 (h!24635 tuple2!16842) (t!32947 List!23430)) )
))
(declare-datatypes ((ListLongMap!14811 0))(
  ( (ListLongMap!14812 (toList!7421 List!23430)) )
))
(declare-fun lt!480366 () ListLongMap!14811)

(declare-fun zeroValue!831 () V!40409)

(declare-fun getCurrentListMap!4209 (array!69865 array!69867 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) Int) ListLongMap!14811)

(assert (=> b!1083934 (= lt!480366 (getCurrentListMap!4209 lt!480369 lt!480368 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480371 () ListLongMap!14811)

(declare-fun lt!480372 () ListLongMap!14811)

(assert (=> b!1083934 (and (= lt!480371 lt!480372) (= lt!480372 lt!480371))))

(declare-fun lt!480373 () ListLongMap!14811)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!748 (ListLongMap!14811 (_ BitVec 64)) ListLongMap!14811)

(assert (=> b!1083934 (= lt!480372 (-!748 lt!480373 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35662 0))(
  ( (Unit!35663) )
))
(declare-fun lt!480370 () Unit!35662)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!28 (array!69865 array!69867 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35662)

(assert (=> b!1083934 (= lt!480370 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!28 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3969 (array!69865 array!69867 (_ BitVec 32) (_ BitVec 32) V!40409 V!40409 (_ BitVec 32) Int) ListLongMap!14811)

(assert (=> b!1083934 (= lt!480371 (getCurrentListMapNoExtraKeys!3969 lt!480369 lt!480368 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2106 (Int (_ BitVec 64)) V!40409)

(assert (=> b!1083934 (= lt!480368 (array!69868 (store (arr!33607 _values!874) i!650 (ValueCellFull!12521 (dynLambda!2106 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34143 _values!874)))))

(assert (=> b!1083934 (= lt!480373 (getCurrentListMapNoExtraKeys!3969 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083934 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480367 () Unit!35662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69865 (_ BitVec 64) (_ BitVec 32)) Unit!35662)

(assert (=> b!1083934 (= lt!480367 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083935 () Bool)

(declare-fun res!722600 () Bool)

(assert (=> b!1083935 (=> (not res!722600) (not e!619310))))

(assert (=> b!1083935 (= res!722600 (and (= (size!34143 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34142 _keys!1070) (size!34143 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083936 () Bool)

(declare-fun res!722595 () Bool)

(assert (=> b!1083936 (=> (not res!722595) (not e!619310))))

(assert (=> b!1083936 (= res!722595 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34142 _keys!1070))))))

(declare-fun b!1083937 () Bool)

(declare-fun res!722593 () Bool)

(assert (=> b!1083937 (=> (not res!722593) (not e!619310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083937 (= res!722593 (validKeyInArray!0 k!904))))

(declare-fun b!1083938 () Bool)

(assert (=> b!1083938 (= e!619310 e!619311)))

(declare-fun res!722598 () Bool)

(assert (=> b!1083938 (=> (not res!722598) (not e!619311))))

(assert (=> b!1083938 (= res!722598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480369 mask!1414))))

(assert (=> b!1083938 (= lt!480369 (array!69866 (store (arr!33606 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34142 _keys!1070)))))

(declare-fun res!722596 () Bool)

(assert (=> start!95806 (=> (not res!722596) (not e!619310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95806 (= res!722596 (validMask!0 mask!1414))))

(assert (=> start!95806 e!619310))

(assert (=> start!95806 tp!79226))

(assert (=> start!95806 true))

(declare-fun tp_is_empty!26461 () Bool)

(assert (=> start!95806 tp_is_empty!26461))

(declare-fun array_inv!25938 (array!69865) Bool)

(assert (=> start!95806 (array_inv!25938 _keys!1070)))

(declare-fun e!619312 () Bool)

(declare-fun array_inv!25939 (array!69867) Bool)

(assert (=> start!95806 (and (array_inv!25939 _values!874) e!619312)))

(declare-fun b!1083939 () Bool)

(declare-fun res!722599 () Bool)

(assert (=> b!1083939 (=> (not res!722599) (not e!619310))))

(assert (=> b!1083939 (= res!722599 (= (select (arr!33606 _keys!1070) i!650) k!904))))

(declare-fun b!1083940 () Bool)

(declare-fun e!619308 () Bool)

(assert (=> b!1083940 (= e!619312 (and e!619308 mapRes!41446))))

(declare-fun condMapEmpty!41446 () Bool)

(declare-fun mapDefault!41446 () ValueCell!12521)

