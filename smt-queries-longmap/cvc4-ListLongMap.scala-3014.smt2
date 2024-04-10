; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42422 () Bool)

(assert start!42422)

(declare-fun b_free!11897 () Bool)

(declare-fun b_next!11897 () Bool)

(assert (=> start!42422 (= b_free!11897 (not b_next!11897))))

(declare-fun tp!41725 () Bool)

(declare-fun b_and!20353 () Bool)

(assert (=> start!42422 (= tp!41725 b_and!20353)))

(declare-fun b!473336 () Bool)

(declare-fun res!282733 () Bool)

(declare-fun e!277677 () Bool)

(assert (=> b!473336 (=> (not res!282733) (not e!277677))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30407 0))(
  ( (array!30408 (arr!14623 (Array (_ BitVec 32) (_ BitVec 64))) (size!14975 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30407)

(declare-datatypes ((V!18871 0))(
  ( (V!18872 (val!6707 Int)) )
))
(declare-datatypes ((ValueCell!6319 0))(
  ( (ValueCellFull!6319 (v!8998 V!18871)) (EmptyCell!6319) )
))
(declare-datatypes ((array!30409 0))(
  ( (array!30410 (arr!14624 (Array (_ BitVec 32) ValueCell!6319)) (size!14976 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30409)

(assert (=> b!473336 (= res!282733 (and (= (size!14976 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14975 _keys!1025) (size!14976 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473337 () Bool)

(declare-fun res!282736 () Bool)

(assert (=> b!473337 (=> (not res!282736) (not e!277677))))

(declare-datatypes ((List!8918 0))(
  ( (Nil!8915) (Cons!8914 (h!9770 (_ BitVec 64)) (t!14888 List!8918)) )
))
(declare-fun arrayNoDuplicates!0 (array!30407 (_ BitVec 32) List!8918) Bool)

(assert (=> b!473337 (= res!282736 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8915))))

(declare-fun b!473338 () Bool)

(declare-fun e!277676 () Bool)

(assert (=> b!473338 (= e!277677 (not e!277676))))

(declare-fun res!282732 () Bool)

(assert (=> b!473338 (=> res!282732 e!277676)))

(assert (=> b!473338 (= res!282732 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8836 0))(
  ( (tuple2!8837 (_1!4429 (_ BitVec 64)) (_2!4429 V!18871)) )
))
(declare-datatypes ((List!8919 0))(
  ( (Nil!8916) (Cons!8915 (h!9771 tuple2!8836) (t!14889 List!8919)) )
))
(declare-datatypes ((ListLongMap!7749 0))(
  ( (ListLongMap!7750 (toList!3890 List!8919)) )
))
(declare-fun lt!215039 () ListLongMap!7749)

(declare-fun lt!215037 () ListLongMap!7749)

(assert (=> b!473338 (= lt!215039 lt!215037)))

(declare-fun zeroValue!794 () V!18871)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!18871)

(declare-datatypes ((Unit!13936 0))(
  ( (Unit!13937) )
))
(declare-fun lt!215038 () Unit!13936)

(declare-fun minValueAfter!38 () V!18871)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!230 (array!30407 array!30409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18871 V!18871 V!18871 V!18871 (_ BitVec 32) Int) Unit!13936)

(assert (=> b!473338 (= lt!215038 (lemmaNoChangeToArrayThenSameMapNoExtras!230 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2050 (array!30407 array!30409 (_ BitVec 32) (_ BitVec 32) V!18871 V!18871 (_ BitVec 32) Int) ListLongMap!7749)

(assert (=> b!473338 (= lt!215037 (getCurrentListMapNoExtraKeys!2050 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473338 (= lt!215039 (getCurrentListMapNoExtraKeys!2050 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21700 () Bool)

(declare-fun mapRes!21700 () Bool)

(assert (=> mapIsEmpty!21700 mapRes!21700))

(declare-fun mapNonEmpty!21700 () Bool)

(declare-fun tp!41724 () Bool)

(declare-fun e!277675 () Bool)

(assert (=> mapNonEmpty!21700 (= mapRes!21700 (and tp!41724 e!277675))))

(declare-fun mapValue!21700 () ValueCell!6319)

(declare-fun mapRest!21700 () (Array (_ BitVec 32) ValueCell!6319))

(declare-fun mapKey!21700 () (_ BitVec 32))

(assert (=> mapNonEmpty!21700 (= (arr!14624 _values!833) (store mapRest!21700 mapKey!21700 mapValue!21700))))

(declare-fun b!473339 () Bool)

(declare-fun res!282735 () Bool)

(assert (=> b!473339 (=> (not res!282735) (not e!277677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30407 (_ BitVec 32)) Bool)

(assert (=> b!473339 (= res!282735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473340 () Bool)

(declare-fun e!277674 () Bool)

(declare-fun e!277678 () Bool)

(assert (=> b!473340 (= e!277674 (and e!277678 mapRes!21700))))

(declare-fun condMapEmpty!21700 () Bool)

(declare-fun mapDefault!21700 () ValueCell!6319)

