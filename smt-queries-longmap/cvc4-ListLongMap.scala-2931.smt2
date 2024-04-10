; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41778 () Bool)

(assert start!41778)

(declare-fun b_free!11399 () Bool)

(declare-fun b_next!11399 () Bool)

(assert (=> start!41778 (= b_free!11399 (not b_next!11399))))

(declare-fun tp!40203 () Bool)

(declare-fun b_and!19767 () Bool)

(assert (=> start!41778 (= tp!40203 b_and!19767)))

(declare-fun b!466506 () Bool)

(declare-fun res!278847 () Bool)

(declare-fun e!272779 () Bool)

(assert (=> b!466506 (=> (not res!278847) (not e!272779))))

(declare-datatypes ((array!29437 0))(
  ( (array!29438 (arr!14147 (Array (_ BitVec 32) (_ BitVec 64))) (size!14499 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29437)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29437 (_ BitVec 32)) Bool)

(assert (=> b!466506 (= res!278847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466507 () Bool)

(declare-fun e!272778 () Bool)

(declare-fun tp_is_empty!12827 () Bool)

(assert (=> b!466507 (= e!272778 tp_is_empty!12827)))

(declare-fun b!466508 () Bool)

(declare-fun res!278849 () Bool)

(assert (=> b!466508 (=> (not res!278849) (not e!272779))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18207 0))(
  ( (V!18208 (val!6458 Int)) )
))
(declare-datatypes ((ValueCell!6070 0))(
  ( (ValueCellFull!6070 (v!8746 V!18207)) (EmptyCell!6070) )
))
(declare-datatypes ((array!29439 0))(
  ( (array!29440 (arr!14148 (Array (_ BitVec 32) ValueCell!6070)) (size!14500 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29439)

(assert (=> b!466508 (= res!278849 (and (= (size!14500 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14499 _keys!1025) (size!14500 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466509 () Bool)

(declare-fun res!278845 () Bool)

(assert (=> b!466509 (=> (not res!278845) (not e!272779))))

(declare-datatypes ((List!8560 0))(
  ( (Nil!8557) (Cons!8556 (h!9412 (_ BitVec 64)) (t!14512 List!8560)) )
))
(declare-fun arrayNoDuplicates!0 (array!29437 (_ BitVec 32) List!8560) Bool)

(assert (=> b!466509 (= res!278845 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8557))))

(declare-fun mapIsEmpty!20926 () Bool)

(declare-fun mapRes!20926 () Bool)

(assert (=> mapIsEmpty!20926 mapRes!20926))

(declare-fun b!466510 () Bool)

(declare-fun e!272774 () Bool)

(assert (=> b!466510 (= e!272774 true)))

(declare-fun zeroValue!794 () V!18207)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8470 0))(
  ( (tuple2!8471 (_1!4246 (_ BitVec 64)) (_2!4246 V!18207)) )
))
(declare-datatypes ((List!8561 0))(
  ( (Nil!8558) (Cons!8557 (h!9413 tuple2!8470) (t!14513 List!8561)) )
))
(declare-datatypes ((ListLongMap!7383 0))(
  ( (ListLongMap!7384 (toList!3707 List!8561)) )
))
(declare-fun lt!210837 () ListLongMap!7383)

(declare-fun minValueAfter!38 () V!18207)

(declare-fun getCurrentListMap!2157 (array!29437 array!29439 (_ BitVec 32) (_ BitVec 32) V!18207 V!18207 (_ BitVec 32) Int) ListLongMap!7383)

(assert (=> b!466510 (= lt!210837 (getCurrentListMap!2157 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18207)

(declare-fun lt!210834 () ListLongMap!7383)

(declare-fun +!1663 (ListLongMap!7383 tuple2!8470) ListLongMap!7383)

(assert (=> b!466510 (= lt!210834 (+!1663 (getCurrentListMap!2157 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8471 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapNonEmpty!20926 () Bool)

(declare-fun tp!40204 () Bool)

(declare-fun e!272775 () Bool)

(assert (=> mapNonEmpty!20926 (= mapRes!20926 (and tp!40204 e!272775))))

(declare-fun mapValue!20926 () ValueCell!6070)

(declare-fun mapRest!20926 () (Array (_ BitVec 32) ValueCell!6070))

(declare-fun mapKey!20926 () (_ BitVec 32))

(assert (=> mapNonEmpty!20926 (= (arr!14148 _values!833) (store mapRest!20926 mapKey!20926 mapValue!20926))))

(declare-fun res!278846 () Bool)

(assert (=> start!41778 (=> (not res!278846) (not e!272779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41778 (= res!278846 (validMask!0 mask!1365))))

(assert (=> start!41778 e!272779))

(assert (=> start!41778 tp_is_empty!12827))

(assert (=> start!41778 tp!40203))

(assert (=> start!41778 true))

(declare-fun array_inv!10216 (array!29437) Bool)

(assert (=> start!41778 (array_inv!10216 _keys!1025)))

(declare-fun e!272777 () Bool)

(declare-fun array_inv!10217 (array!29439) Bool)

(assert (=> start!41778 (and (array_inv!10217 _values!833) e!272777)))

(declare-fun b!466511 () Bool)

(assert (=> b!466511 (= e!272775 tp_is_empty!12827)))

(declare-fun b!466512 () Bool)

(assert (=> b!466512 (= e!272777 (and e!272778 mapRes!20926))))

(declare-fun condMapEmpty!20926 () Bool)

(declare-fun mapDefault!20926 () ValueCell!6070)

