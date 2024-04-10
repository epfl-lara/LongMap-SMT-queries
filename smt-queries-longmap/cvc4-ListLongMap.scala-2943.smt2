; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41868 () Bool)

(assert start!41868)

(declare-fun b_free!11471 () Bool)

(declare-fun b_next!11471 () Bool)

(assert (=> start!41868 (= b_free!11471 (not b_next!11471))))

(declare-fun tp!40423 () Bool)

(declare-fun b_and!19851 () Bool)

(assert (=> start!41868 (= tp!40423 b_and!19851)))

(declare-fun b!467492 () Bool)

(declare-fun e!273472 () Bool)

(declare-fun tp_is_empty!12899 () Bool)

(assert (=> b!467492 (= e!273472 tp_is_empty!12899)))

(declare-fun mapNonEmpty!21037 () Bool)

(declare-fun mapRes!21037 () Bool)

(declare-fun tp!40422 () Bool)

(assert (=> mapNonEmpty!21037 (= mapRes!21037 (and tp!40422 e!273472))))

(declare-datatypes ((V!18303 0))(
  ( (V!18304 (val!6494 Int)) )
))
(declare-datatypes ((ValueCell!6106 0))(
  ( (ValueCellFull!6106 (v!8783 V!18303)) (EmptyCell!6106) )
))
(declare-fun mapRest!21037 () (Array (_ BitVec 32) ValueCell!6106))

(declare-fun mapKey!21037 () (_ BitVec 32))

(declare-datatypes ((array!29573 0))(
  ( (array!29574 (arr!14214 (Array (_ BitVec 32) ValueCell!6106)) (size!14566 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29573)

(declare-fun mapValue!21037 () ValueCell!6106)

(assert (=> mapNonEmpty!21037 (= (arr!14214 _values!833) (store mapRest!21037 mapKey!21037 mapValue!21037))))

(declare-fun b!467493 () Bool)

(declare-fun e!273470 () Bool)

(assert (=> b!467493 (= e!273470 tp_is_empty!12899)))

(declare-fun b!467494 () Bool)

(declare-fun res!279406 () Bool)

(declare-fun e!273474 () Bool)

(assert (=> b!467494 (=> (not res!279406) (not e!273474))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29575 0))(
  ( (array!29576 (arr!14215 (Array (_ BitVec 32) (_ BitVec 64))) (size!14567 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29575)

(assert (=> b!467494 (= res!279406 (and (= (size!14566 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14567 _keys!1025) (size!14566 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467495 () Bool)

(assert (=> b!467495 (= e!273474 (not true))))

(declare-datatypes ((tuple2!8522 0))(
  ( (tuple2!8523 (_1!4272 (_ BitVec 64)) (_2!4272 V!18303)) )
))
(declare-datatypes ((List!8609 0))(
  ( (Nil!8606) (Cons!8605 (h!9461 tuple2!8522) (t!14563 List!8609)) )
))
(declare-datatypes ((ListLongMap!7435 0))(
  ( (ListLongMap!7436 (toList!3733 List!8609)) )
))
(declare-fun lt!211371 () ListLongMap!7435)

(declare-fun lt!211373 () ListLongMap!7435)

(assert (=> b!467495 (= lt!211371 lt!211373)))

(declare-fun minValueBefore!38 () V!18303)

(declare-fun zeroValue!794 () V!18303)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13626 0))(
  ( (Unit!13627) )
))
(declare-fun lt!211372 () Unit!13626)

(declare-fun minValueAfter!38 () V!18303)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!87 (array!29575 array!29573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18303 V!18303 V!18303 V!18303 (_ BitVec 32) Int) Unit!13626)

(assert (=> b!467495 (= lt!211372 (lemmaNoChangeToArrayThenSameMapNoExtras!87 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1907 (array!29575 array!29573 (_ BitVec 32) (_ BitVec 32) V!18303 V!18303 (_ BitVec 32) Int) ListLongMap!7435)

(assert (=> b!467495 (= lt!211373 (getCurrentListMapNoExtraKeys!1907 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467495 (= lt!211371 (getCurrentListMapNoExtraKeys!1907 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21037 () Bool)

(assert (=> mapIsEmpty!21037 mapRes!21037))

(declare-fun b!467496 () Bool)

(declare-fun res!279405 () Bool)

(assert (=> b!467496 (=> (not res!279405) (not e!273474))))

(declare-datatypes ((List!8610 0))(
  ( (Nil!8607) (Cons!8606 (h!9462 (_ BitVec 64)) (t!14564 List!8610)) )
))
(declare-fun arrayNoDuplicates!0 (array!29575 (_ BitVec 32) List!8610) Bool)

(assert (=> b!467496 (= res!279405 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8607))))

(declare-fun b!467497 () Bool)

(declare-fun e!273473 () Bool)

(assert (=> b!467497 (= e!273473 (and e!273470 mapRes!21037))))

(declare-fun condMapEmpty!21037 () Bool)

(declare-fun mapDefault!21037 () ValueCell!6106)

