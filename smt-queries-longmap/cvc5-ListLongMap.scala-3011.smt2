; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42400 () Bool)

(assert start!42400)

(declare-fun b_free!11875 () Bool)

(declare-fun b_next!11875 () Bool)

(assert (=> start!42400 (= b_free!11875 (not b_next!11875))))

(declare-fun tp!41659 () Bool)

(declare-fun b_and!20331 () Bool)

(assert (=> start!42400 (= tp!41659 b_and!20331)))

(declare-fun b!473072 () Bool)

(declare-fun res!282571 () Bool)

(declare-fun e!277481 () Bool)

(assert (=> b!473072 (=> (not res!282571) (not e!277481))))

(declare-datatypes ((array!30365 0))(
  ( (array!30366 (arr!14602 (Array (_ BitVec 32) (_ BitVec 64))) (size!14954 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30365)

(declare-datatypes ((List!8905 0))(
  ( (Nil!8902) (Cons!8901 (h!9757 (_ BitVec 64)) (t!14875 List!8905)) )
))
(declare-fun arrayNoDuplicates!0 (array!30365 (_ BitVec 32) List!8905) Bool)

(assert (=> b!473072 (= res!282571 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8902))))

(declare-fun mapNonEmpty!21667 () Bool)

(declare-fun mapRes!21667 () Bool)

(declare-fun tp!41658 () Bool)

(declare-fun e!277479 () Bool)

(assert (=> mapNonEmpty!21667 (= mapRes!21667 (and tp!41658 e!277479))))

(declare-datatypes ((V!18843 0))(
  ( (V!18844 (val!6696 Int)) )
))
(declare-datatypes ((ValueCell!6308 0))(
  ( (ValueCellFull!6308 (v!8987 V!18843)) (EmptyCell!6308) )
))
(declare-fun mapRest!21667 () (Array (_ BitVec 32) ValueCell!6308))

(declare-fun mapValue!21667 () ValueCell!6308)

(declare-datatypes ((array!30367 0))(
  ( (array!30368 (arr!14603 (Array (_ BitVec 32) ValueCell!6308)) (size!14955 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30367)

(declare-fun mapKey!21667 () (_ BitVec 32))

(assert (=> mapNonEmpty!21667 (= (arr!14603 _values!833) (store mapRest!21667 mapKey!21667 mapValue!21667))))

(declare-fun res!282570 () Bool)

(assert (=> start!42400 (=> (not res!282570) (not e!277481))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42400 (= res!282570 (validMask!0 mask!1365))))

(assert (=> start!42400 e!277481))

(declare-fun tp_is_empty!13303 () Bool)

(assert (=> start!42400 tp_is_empty!13303))

(assert (=> start!42400 tp!41659))

(assert (=> start!42400 true))

(declare-fun array_inv!10532 (array!30365) Bool)

(assert (=> start!42400 (array_inv!10532 _keys!1025)))

(declare-fun e!277478 () Bool)

(declare-fun array_inv!10533 (array!30367) Bool)

(assert (=> start!42400 (and (array_inv!10533 _values!833) e!277478)))

(declare-fun mapIsEmpty!21667 () Bool)

(assert (=> mapIsEmpty!21667 mapRes!21667))

(declare-fun b!473073 () Bool)

(declare-fun e!277477 () Bool)

(assert (=> b!473073 (= e!277481 (not e!277477))))

(declare-fun res!282569 () Bool)

(assert (=> b!473073 (=> res!282569 e!277477)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473073 (= res!282569 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8822 0))(
  ( (tuple2!8823 (_1!4422 (_ BitVec 64)) (_2!4422 V!18843)) )
))
(declare-datatypes ((List!8906 0))(
  ( (Nil!8903) (Cons!8902 (h!9758 tuple2!8822) (t!14876 List!8906)) )
))
(declare-datatypes ((ListLongMap!7735 0))(
  ( (ListLongMap!7736 (toList!3883 List!8906)) )
))
(declare-fun lt!214780 () ListLongMap!7735)

(declare-fun lt!214773 () ListLongMap!7735)

(assert (=> b!473073 (= lt!214780 lt!214773)))

(declare-datatypes ((Unit!13922 0))(
  ( (Unit!13923) )
))
(declare-fun lt!214778 () Unit!13922)

(declare-fun minValueBefore!38 () V!18843)

(declare-fun zeroValue!794 () V!18843)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18843)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!223 (array!30365 array!30367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 V!18843 V!18843 (_ BitVec 32) Int) Unit!13922)

(assert (=> b!473073 (= lt!214778 (lemmaNoChangeToArrayThenSameMapNoExtras!223 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2043 (array!30365 array!30367 (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 (_ BitVec 32) Int) ListLongMap!7735)

(assert (=> b!473073 (= lt!214773 (getCurrentListMapNoExtraKeys!2043 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473073 (= lt!214780 (getCurrentListMapNoExtraKeys!2043 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473074 () Bool)

(declare-fun res!282567 () Bool)

(assert (=> b!473074 (=> (not res!282567) (not e!277481))))

(assert (=> b!473074 (= res!282567 (and (= (size!14955 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14954 _keys!1025) (size!14955 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473075 () Bool)

(assert (=> b!473075 (= e!277479 tp_is_empty!13303)))

(declare-fun b!473076 () Bool)

(declare-fun e!277476 () Bool)

(assert (=> b!473076 (= e!277478 (and e!277476 mapRes!21667))))

(declare-fun condMapEmpty!21667 () Bool)

(declare-fun mapDefault!21667 () ValueCell!6308)

