; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41828 () Bool)

(assert start!41828)

(declare-fun b_free!11431 () Bool)

(declare-fun b_next!11431 () Bool)

(assert (=> start!41828 (= b_free!11431 (not b_next!11431))))

(declare-fun tp!40302 () Bool)

(declare-fun b_and!19811 () Bool)

(assert (=> start!41828 (= tp!40302 b_and!19811)))

(declare-fun mapIsEmpty!20977 () Bool)

(declare-fun mapRes!20977 () Bool)

(assert (=> mapIsEmpty!20977 mapRes!20977))

(declare-fun b!467072 () Bool)

(declare-fun res!279165 () Bool)

(declare-fun e!273170 () Bool)

(assert (=> b!467072 (=> (not res!279165) (not e!273170))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29501 0))(
  ( (array!29502 (arr!14178 (Array (_ BitVec 32) (_ BitVec 64))) (size!14530 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29501)

(declare-datatypes ((V!18251 0))(
  ( (V!18252 (val!6474 Int)) )
))
(declare-datatypes ((ValueCell!6086 0))(
  ( (ValueCellFull!6086 (v!8763 V!18251)) (EmptyCell!6086) )
))
(declare-datatypes ((array!29503 0))(
  ( (array!29504 (arr!14179 (Array (_ BitVec 32) ValueCell!6086)) (size!14531 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29503)

(assert (=> b!467072 (= res!279165 (and (= (size!14531 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14530 _keys!1025) (size!14531 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467073 () Bool)

(assert (=> b!467073 (= e!273170 (not true))))

(declare-datatypes ((tuple2!8494 0))(
  ( (tuple2!8495 (_1!4258 (_ BitVec 64)) (_2!4258 V!18251)) )
))
(declare-datatypes ((List!8583 0))(
  ( (Nil!8580) (Cons!8579 (h!9435 tuple2!8494) (t!14537 List!8583)) )
))
(declare-datatypes ((ListLongMap!7407 0))(
  ( (ListLongMap!7408 (toList!3719 List!8583)) )
))
(declare-fun lt!211192 () ListLongMap!7407)

(declare-fun lt!211193 () ListLongMap!7407)

(assert (=> b!467073 (= lt!211192 lt!211193)))

(declare-fun minValueBefore!38 () V!18251)

(declare-datatypes ((Unit!13598 0))(
  ( (Unit!13599) )
))
(declare-fun lt!211191 () Unit!13598)

(declare-fun zeroValue!794 () V!18251)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18251)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!73 (array!29501 array!29503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18251 V!18251 V!18251 V!18251 (_ BitVec 32) Int) Unit!13598)

(assert (=> b!467073 (= lt!211191 (lemmaNoChangeToArrayThenSameMapNoExtras!73 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1893 (array!29501 array!29503 (_ BitVec 32) (_ BitVec 32) V!18251 V!18251 (_ BitVec 32) Int) ListLongMap!7407)

(assert (=> b!467073 (= lt!211193 (getCurrentListMapNoExtraKeys!1893 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467073 (= lt!211192 (getCurrentListMapNoExtraKeys!1893 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20977 () Bool)

(declare-fun tp!40303 () Bool)

(declare-fun e!273173 () Bool)

(assert (=> mapNonEmpty!20977 (= mapRes!20977 (and tp!40303 e!273173))))

(declare-fun mapKey!20977 () (_ BitVec 32))

(declare-fun mapRest!20977 () (Array (_ BitVec 32) ValueCell!6086))

(declare-fun mapValue!20977 () ValueCell!6086)

(assert (=> mapNonEmpty!20977 (= (arr!14179 _values!833) (store mapRest!20977 mapKey!20977 mapValue!20977))))

(declare-fun b!467074 () Bool)

(declare-fun e!273172 () Bool)

(declare-fun tp_is_empty!12859 () Bool)

(assert (=> b!467074 (= e!273172 tp_is_empty!12859)))

(declare-fun b!467076 () Bool)

(assert (=> b!467076 (= e!273173 tp_is_empty!12859)))

(declare-fun b!467077 () Bool)

(declare-fun e!273174 () Bool)

(assert (=> b!467077 (= e!273174 (and e!273172 mapRes!20977))))

(declare-fun condMapEmpty!20977 () Bool)

(declare-fun mapDefault!20977 () ValueCell!6086)

