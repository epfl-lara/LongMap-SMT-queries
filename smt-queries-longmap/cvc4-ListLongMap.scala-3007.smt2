; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42364 () Bool)

(assert start!42364)

(declare-fun b_free!11855 () Bool)

(declare-fun b_next!11855 () Bool)

(assert (=> start!42364 (= b_free!11855 (not b_next!11855))))

(declare-fun tp!41596 () Bool)

(declare-fun b_and!20301 () Bool)

(assert (=> start!42364 (= tp!41596 b_and!20301)))

(declare-fun b!472684 () Bool)

(declare-fun e!277202 () Bool)

(declare-fun e!277203 () Bool)

(assert (=> b!472684 (= e!277202 (not e!277203))))

(declare-fun res!282360 () Bool)

(assert (=> b!472684 (=> res!282360 e!277203)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472684 (= res!282360 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18815 0))(
  ( (V!18816 (val!6686 Int)) )
))
(declare-datatypes ((tuple2!8804 0))(
  ( (tuple2!8805 (_1!4413 (_ BitVec 64)) (_2!4413 V!18815)) )
))
(declare-datatypes ((List!8888 0))(
  ( (Nil!8885) (Cons!8884 (h!9740 tuple2!8804) (t!14856 List!8888)) )
))
(declare-datatypes ((ListLongMap!7717 0))(
  ( (ListLongMap!7718 (toList!3874 List!8888)) )
))
(declare-fun lt!214469 () ListLongMap!7717)

(declare-fun lt!214470 () ListLongMap!7717)

(assert (=> b!472684 (= lt!214469 lt!214470)))

(declare-fun minValueBefore!38 () V!18815)

(declare-datatypes ((Unit!13903 0))(
  ( (Unit!13904) )
))
(declare-fun lt!214467 () Unit!13903)

(declare-fun zeroValue!794 () V!18815)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30323 0))(
  ( (array!30324 (arr!14582 (Array (_ BitVec 32) (_ BitVec 64))) (size!14934 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30323)

(declare-datatypes ((ValueCell!6298 0))(
  ( (ValueCellFull!6298 (v!8977 V!18815)) (EmptyCell!6298) )
))
(declare-datatypes ((array!30325 0))(
  ( (array!30326 (arr!14583 (Array (_ BitVec 32) ValueCell!6298)) (size!14935 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30325)

(declare-fun minValueAfter!38 () V!18815)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!215 (array!30323 array!30325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18815 V!18815 V!18815 V!18815 (_ BitVec 32) Int) Unit!13903)

(assert (=> b!472684 (= lt!214467 (lemmaNoChangeToArrayThenSameMapNoExtras!215 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2035 (array!30323 array!30325 (_ BitVec 32) (_ BitVec 32) V!18815 V!18815 (_ BitVec 32) Int) ListLongMap!7717)

(assert (=> b!472684 (= lt!214470 (getCurrentListMapNoExtraKeys!2035 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472684 (= lt!214469 (getCurrentListMapNoExtraKeys!2035 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472685 () Bool)

(declare-fun e!277206 () Bool)

(declare-fun e!277204 () Bool)

(declare-fun mapRes!21634 () Bool)

(assert (=> b!472685 (= e!277206 (and e!277204 mapRes!21634))))

(declare-fun condMapEmpty!21634 () Bool)

(declare-fun mapDefault!21634 () ValueCell!6298)

