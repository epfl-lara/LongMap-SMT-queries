; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42290 () Bool)

(assert start!42290)

(declare-fun b_free!11795 () Bool)

(declare-fun b_next!11795 () Bool)

(assert (=> start!42290 (= b_free!11795 (not b_next!11795))))

(declare-fun tp!41413 () Bool)

(declare-fun b_and!20233 () Bool)

(assert (=> start!42290 (= tp!41413 b_and!20233)))

(declare-fun b!471898 () Bool)

(declare-fun res!281899 () Bool)

(declare-fun e!276628 () Bool)

(assert (=> b!471898 (=> (not res!281899) (not e!276628))))

(declare-datatypes ((array!30203 0))(
  ( (array!30204 (arr!14523 (Array (_ BitVec 32) (_ BitVec 64))) (size!14875 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30203)

(declare-datatypes ((List!8843 0))(
  ( (Nil!8840) (Cons!8839 (h!9695 (_ BitVec 64)) (t!14809 List!8843)) )
))
(declare-fun arrayNoDuplicates!0 (array!30203 (_ BitVec 32) List!8843) Bool)

(assert (=> b!471898 (= res!281899 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8840))))

(declare-fun b!471899 () Bool)

(assert (=> b!471899 (= e!276628 (not true))))

(declare-datatypes ((V!18735 0))(
  ( (V!18736 (val!6656 Int)) )
))
(declare-datatypes ((tuple2!8760 0))(
  ( (tuple2!8761 (_1!4391 (_ BitVec 64)) (_2!4391 V!18735)) )
))
(declare-datatypes ((List!8844 0))(
  ( (Nil!8841) (Cons!8840 (h!9696 tuple2!8760) (t!14810 List!8844)) )
))
(declare-datatypes ((ListLongMap!7673 0))(
  ( (ListLongMap!7674 (toList!3852 List!8844)) )
))
(declare-fun lt!214086 () ListLongMap!7673)

(declare-fun lt!214087 () ListLongMap!7673)

(assert (=> b!471899 (= lt!214086 lt!214087)))

(declare-fun minValueBefore!38 () V!18735)

(declare-datatypes ((Unit!13863 0))(
  ( (Unit!13864) )
))
(declare-fun lt!214088 () Unit!13863)

(declare-fun zeroValue!794 () V!18735)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6268 0))(
  ( (ValueCellFull!6268 (v!8947 V!18735)) (EmptyCell!6268) )
))
(declare-datatypes ((array!30205 0))(
  ( (array!30206 (arr!14524 (Array (_ BitVec 32) ValueCell!6268)) (size!14876 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30205)

(declare-fun minValueAfter!38 () V!18735)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!195 (array!30203 array!30205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18735 V!18735 V!18735 V!18735 (_ BitVec 32) Int) Unit!13863)

(assert (=> b!471899 (= lt!214088 (lemmaNoChangeToArrayThenSameMapNoExtras!195 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2015 (array!30203 array!30205 (_ BitVec 32) (_ BitVec 32) V!18735 V!18735 (_ BitVec 32) Int) ListLongMap!7673)

(assert (=> b!471899 (= lt!214087 (getCurrentListMapNoExtraKeys!2015 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471899 (= lt!214086 (getCurrentListMapNoExtraKeys!2015 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471900 () Bool)

(declare-fun res!281898 () Bool)

(assert (=> b!471900 (=> (not res!281898) (not e!276628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30203 (_ BitVec 32)) Bool)

(assert (=> b!471900 (= res!281898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21541 () Bool)

(declare-fun mapRes!21541 () Bool)

(declare-fun tp!41412 () Bool)

(declare-fun e!276630 () Bool)

(assert (=> mapNonEmpty!21541 (= mapRes!21541 (and tp!41412 e!276630))))

(declare-fun mapRest!21541 () (Array (_ BitVec 32) ValueCell!6268))

(declare-fun mapKey!21541 () (_ BitVec 32))

(declare-fun mapValue!21541 () ValueCell!6268)

(assert (=> mapNonEmpty!21541 (= (arr!14524 _values!833) (store mapRest!21541 mapKey!21541 mapValue!21541))))

(declare-fun mapIsEmpty!21541 () Bool)

(assert (=> mapIsEmpty!21541 mapRes!21541))

(declare-fun res!281897 () Bool)

(assert (=> start!42290 (=> (not res!281897) (not e!276628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42290 (= res!281897 (validMask!0 mask!1365))))

(assert (=> start!42290 e!276628))

(declare-fun tp_is_empty!13223 () Bool)

(assert (=> start!42290 tp_is_empty!13223))

(assert (=> start!42290 tp!41413))

(assert (=> start!42290 true))

(declare-fun array_inv!10468 (array!30203) Bool)

(assert (=> start!42290 (array_inv!10468 _keys!1025)))

(declare-fun e!276627 () Bool)

(declare-fun array_inv!10469 (array!30205) Bool)

(assert (=> start!42290 (and (array_inv!10469 _values!833) e!276627)))

(declare-fun b!471901 () Bool)

(assert (=> b!471901 (= e!276630 tp_is_empty!13223)))

(declare-fun b!471902 () Bool)

(declare-fun e!276626 () Bool)

(assert (=> b!471902 (= e!276627 (and e!276626 mapRes!21541))))

(declare-fun condMapEmpty!21541 () Bool)

(declare-fun mapDefault!21541 () ValueCell!6268)

