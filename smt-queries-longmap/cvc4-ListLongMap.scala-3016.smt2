; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42434 () Bool)

(assert start!42434)

(declare-fun b_free!11909 () Bool)

(declare-fun b_next!11909 () Bool)

(assert (=> start!42434 (= b_free!11909 (not b_next!11909))))

(declare-fun tp!41760 () Bool)

(declare-fun b_and!20365 () Bool)

(assert (=> start!42434 (= tp!41760 b_and!20365)))

(declare-fun mapNonEmpty!21718 () Bool)

(declare-fun mapRes!21718 () Bool)

(declare-fun tp!41761 () Bool)

(declare-fun e!277783 () Bool)

(assert (=> mapNonEmpty!21718 (= mapRes!21718 (and tp!41761 e!277783))))

(declare-datatypes ((V!18887 0))(
  ( (V!18888 (val!6713 Int)) )
))
(declare-datatypes ((ValueCell!6325 0))(
  ( (ValueCellFull!6325 (v!9004 V!18887)) (EmptyCell!6325) )
))
(declare-fun mapRest!21718 () (Array (_ BitVec 32) ValueCell!6325))

(declare-fun mapValue!21718 () ValueCell!6325)

(declare-fun mapKey!21718 () (_ BitVec 32))

(declare-datatypes ((array!30429 0))(
  ( (array!30430 (arr!14634 (Array (_ BitVec 32) ValueCell!6325)) (size!14986 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30429)

(assert (=> mapNonEmpty!21718 (= (arr!14634 _values!833) (store mapRest!21718 mapKey!21718 mapValue!21718))))

(declare-fun b!473480 () Bool)

(declare-fun res!282823 () Bool)

(declare-fun e!277785 () Bool)

(assert (=> b!473480 (=> (not res!282823) (not e!277785))))

(declare-datatypes ((array!30431 0))(
  ( (array!30432 (arr!14635 (Array (_ BitVec 32) (_ BitVec 64))) (size!14987 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30431)

(declare-datatypes ((List!8928 0))(
  ( (Nil!8925) (Cons!8924 (h!9780 (_ BitVec 64)) (t!14898 List!8928)) )
))
(declare-fun arrayNoDuplicates!0 (array!30431 (_ BitVec 32) List!8928) Bool)

(assert (=> b!473480 (= res!282823 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8925))))

(declare-fun b!473481 () Bool)

(declare-fun res!282825 () Bool)

(assert (=> b!473481 (=> (not res!282825) (not e!277785))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!473481 (= res!282825 (and (= (size!14986 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14987 _keys!1025) (size!14986 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!282826 () Bool)

(assert (=> start!42434 (=> (not res!282826) (not e!277785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42434 (= res!282826 (validMask!0 mask!1365))))

(assert (=> start!42434 e!277785))

(declare-fun tp_is_empty!13337 () Bool)

(assert (=> start!42434 tp_is_empty!13337))

(assert (=> start!42434 tp!41760))

(assert (=> start!42434 true))

(declare-fun array_inv!10556 (array!30431) Bool)

(assert (=> start!42434 (array_inv!10556 _keys!1025)))

(declare-fun e!277786 () Bool)

(declare-fun array_inv!10557 (array!30429) Bool)

(assert (=> start!42434 (and (array_inv!10557 _values!833) e!277786)))

(declare-fun b!473482 () Bool)

(declare-fun res!282824 () Bool)

(assert (=> b!473482 (=> (not res!282824) (not e!277785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30431 (_ BitVec 32)) Bool)

(assert (=> b!473482 (= res!282824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473483 () Bool)

(declare-fun e!277782 () Bool)

(assert (=> b!473483 (= e!277785 (not e!277782))))

(declare-fun res!282822 () Bool)

(assert (=> b!473483 (=> res!282822 e!277782)))

(assert (=> b!473483 (= res!282822 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8846 0))(
  ( (tuple2!8847 (_1!4434 (_ BitVec 64)) (_2!4434 V!18887)) )
))
(declare-datatypes ((List!8929 0))(
  ( (Nil!8926) (Cons!8925 (h!9781 tuple2!8846) (t!14899 List!8929)) )
))
(declare-datatypes ((ListLongMap!7759 0))(
  ( (ListLongMap!7760 (toList!3895 List!8929)) )
))
(declare-fun lt!215181 () ListLongMap!7759)

(declare-fun lt!215186 () ListLongMap!7759)

(assert (=> b!473483 (= lt!215181 lt!215186)))

(declare-fun minValueBefore!38 () V!18887)

(declare-fun zeroValue!794 () V!18887)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13946 0))(
  ( (Unit!13947) )
))
(declare-fun lt!215182 () Unit!13946)

(declare-fun minValueAfter!38 () V!18887)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!235 (array!30431 array!30429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18887 V!18887 V!18887 V!18887 (_ BitVec 32) Int) Unit!13946)

(assert (=> b!473483 (= lt!215182 (lemmaNoChangeToArrayThenSameMapNoExtras!235 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2055 (array!30431 array!30429 (_ BitVec 32) (_ BitVec 32) V!18887 V!18887 (_ BitVec 32) Int) ListLongMap!7759)

(assert (=> b!473483 (= lt!215186 (getCurrentListMapNoExtraKeys!2055 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473483 (= lt!215181 (getCurrentListMapNoExtraKeys!2055 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473484 () Bool)

(assert (=> b!473484 (= e!277783 tp_is_empty!13337)))

(declare-fun b!473485 () Bool)

(declare-fun e!277784 () Bool)

(assert (=> b!473485 (= e!277784 tp_is_empty!13337)))

(declare-fun b!473486 () Bool)

(assert (=> b!473486 (= e!277786 (and e!277784 mapRes!21718))))

(declare-fun condMapEmpty!21718 () Bool)

(declare-fun mapDefault!21718 () ValueCell!6325)

