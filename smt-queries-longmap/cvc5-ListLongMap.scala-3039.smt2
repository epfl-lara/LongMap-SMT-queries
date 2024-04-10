; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42620 () Bool)

(assert start!42620)

(declare-fun b_free!12043 () Bool)

(declare-fun b_next!12043 () Bool)

(assert (=> start!42620 (= b_free!12043 (not b_next!12043))))

(declare-fun tp!42172 () Bool)

(declare-fun b_and!20531 () Bool)

(assert (=> start!42620 (= tp!42172 b_and!20531)))

(declare-datatypes ((V!19067 0))(
  ( (V!19068 (val!6780 Int)) )
))
(declare-fun minValueBefore!38 () V!19067)

(declare-fun defaultEntry!841 () Int)

(declare-fun e!279164 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30679 0))(
  ( (array!30680 (arr!14756 (Array (_ BitVec 32) (_ BitVec 64))) (size!15108 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30679)

(declare-datatypes ((ValueCell!6392 0))(
  ( (ValueCellFull!6392 (v!9073 V!19067)) (EmptyCell!6392) )
))
(declare-datatypes ((array!30681 0))(
  ( (array!30682 (arr!14757 (Array (_ BitVec 32) ValueCell!6392)) (size!15109 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30681)

(declare-fun zeroValue!794 () V!19067)

(declare-fun b!475427 () Bool)

(declare-fun minValueAfter!38 () V!19067)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8938 0))(
  ( (tuple2!8939 (_1!4480 (_ BitVec 64)) (_2!4480 V!19067)) )
))
(declare-datatypes ((List!9018 0))(
  ( (Nil!9015) (Cons!9014 (h!9870 tuple2!8938) (t!14994 List!9018)) )
))
(declare-datatypes ((ListLongMap!7851 0))(
  ( (ListLongMap!7852 (toList!3941 List!9018)) )
))
(declare-fun +!1755 (ListLongMap!7851 tuple2!8938) ListLongMap!7851)

(declare-fun getCurrentListMap!2283 (array!30679 array!30681 (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 (_ BitVec 32) Int) ListLongMap!7851)

(assert (=> b!475427 (= e!279164 (= (+!1755 (getCurrentListMap!2283 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8939 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2283 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!475429 () Bool)

(declare-fun res!283911 () Bool)

(declare-fun e!279161 () Bool)

(assert (=> b!475429 (=> (not res!283911) (not e!279161))))

(assert (=> b!475429 (= res!283911 (and (= (size!15109 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15108 _keys!1025) (size!15109 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21928 () Bool)

(declare-fun mapRes!21928 () Bool)

(assert (=> mapIsEmpty!21928 mapRes!21928))

(declare-fun b!475430 () Bool)

(declare-fun e!279163 () Bool)

(declare-fun tp_is_empty!13471 () Bool)

(assert (=> b!475430 (= e!279163 tp_is_empty!13471)))

(declare-fun b!475431 () Bool)

(declare-fun e!279165 () Bool)

(assert (=> b!475431 (= e!279165 (and e!279163 mapRes!21928))))

(declare-fun condMapEmpty!21928 () Bool)

(declare-fun mapDefault!21928 () ValueCell!6392)

