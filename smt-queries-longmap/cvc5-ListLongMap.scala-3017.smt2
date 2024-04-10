; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42436 () Bool)

(assert start!42436)

(declare-fun b_free!11911 () Bool)

(declare-fun b_next!11911 () Bool)

(assert (=> start!42436 (= b_free!11911 (not b_next!11911))))

(declare-fun tp!41767 () Bool)

(declare-fun b_and!20367 () Bool)

(assert (=> start!42436 (= tp!41767 b_and!20367)))

(declare-fun b!473504 () Bool)

(declare-fun e!277805 () Bool)

(declare-fun tp_is_empty!13339 () Bool)

(assert (=> b!473504 (= e!277805 tp_is_empty!13339)))

(declare-fun res!282841 () Bool)

(declare-fun e!277801 () Bool)

(assert (=> start!42436 (=> (not res!282841) (not e!277801))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42436 (= res!282841 (validMask!0 mask!1365))))

(assert (=> start!42436 e!277801))

(assert (=> start!42436 tp_is_empty!13339))

(assert (=> start!42436 tp!41767))

(assert (=> start!42436 true))

(declare-datatypes ((array!30433 0))(
  ( (array!30434 (arr!14636 (Array (_ BitVec 32) (_ BitVec 64))) (size!14988 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30433)

(declare-fun array_inv!10558 (array!30433) Bool)

(assert (=> start!42436 (array_inv!10558 _keys!1025)))

(declare-datatypes ((V!18891 0))(
  ( (V!18892 (val!6714 Int)) )
))
(declare-datatypes ((ValueCell!6326 0))(
  ( (ValueCellFull!6326 (v!9005 V!18891)) (EmptyCell!6326) )
))
(declare-datatypes ((array!30435 0))(
  ( (array!30436 (arr!14637 (Array (_ BitVec 32) ValueCell!6326)) (size!14989 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30435)

(declare-fun e!277803 () Bool)

(declare-fun array_inv!10559 (array!30435) Bool)

(assert (=> start!42436 (and (array_inv!10559 _values!833) e!277803)))

(declare-fun b!473505 () Bool)

(declare-fun res!282838 () Bool)

(assert (=> b!473505 (=> (not res!282838) (not e!277801))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!473505 (= res!282838 (and (= (size!14989 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14988 _keys!1025) (size!14989 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473506 () Bool)

(declare-fun e!277804 () Bool)

(assert (=> b!473506 (= e!277804 (bvsle #b00000000000000000000000000000000 (size!14988 _keys!1025)))))

(declare-datatypes ((tuple2!8848 0))(
  ( (tuple2!8849 (_1!4435 (_ BitVec 64)) (_2!4435 V!18891)) )
))
(declare-datatypes ((List!8930 0))(
  ( (Nil!8927) (Cons!8926 (h!9782 tuple2!8848) (t!14900 List!8930)) )
))
(declare-datatypes ((ListLongMap!7761 0))(
  ( (ListLongMap!7762 (toList!3896 List!8930)) )
))
(declare-fun lt!215212 () ListLongMap!7761)

(declare-fun lt!215208 () tuple2!8848)

(declare-fun minValueBefore!38 () V!18891)

(declare-fun +!1732 (ListLongMap!7761 tuple2!8848) ListLongMap!7761)

(assert (=> b!473506 (= (+!1732 lt!215212 lt!215208) (+!1732 (+!1732 lt!215212 (tuple2!8849 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215208))))

(declare-fun minValueAfter!38 () V!18891)

(assert (=> b!473506 (= lt!215208 (tuple2!8849 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13948 0))(
  ( (Unit!13949) )
))
(declare-fun lt!215207 () Unit!13948)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!141 (ListLongMap!7761 (_ BitVec 64) V!18891 V!18891) Unit!13948)

(assert (=> b!473506 (= lt!215207 (addSameAsAddTwiceSameKeyDiffValues!141 lt!215212 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215209 () ListLongMap!7761)

(declare-fun zeroValue!794 () V!18891)

(assert (=> b!473506 (= lt!215212 (+!1732 lt!215209 (tuple2!8849 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215210 () ListLongMap!7761)

(declare-fun getCurrentListMap!2261 (array!30433 array!30435 (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 (_ BitVec 32) Int) ListLongMap!7761)

(assert (=> b!473506 (= lt!215210 (getCurrentListMap!2261 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215205 () ListLongMap!7761)

(assert (=> b!473506 (= lt!215205 (getCurrentListMap!2261 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21721 () Bool)

(declare-fun mapRes!21721 () Bool)

(declare-fun tp!41766 () Bool)

(declare-fun e!277800 () Bool)

(assert (=> mapNonEmpty!21721 (= mapRes!21721 (and tp!41766 e!277800))))

(declare-fun mapRest!21721 () (Array (_ BitVec 32) ValueCell!6326))

(declare-fun mapKey!21721 () (_ BitVec 32))

(declare-fun mapValue!21721 () ValueCell!6326)

(assert (=> mapNonEmpty!21721 (= (arr!14637 _values!833) (store mapRest!21721 mapKey!21721 mapValue!21721))))

(declare-fun b!473507 () Bool)

(declare-fun res!282840 () Bool)

(assert (=> b!473507 (=> (not res!282840) (not e!277801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30433 (_ BitVec 32)) Bool)

(assert (=> b!473507 (= res!282840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473508 () Bool)

(assert (=> b!473508 (= e!277800 tp_is_empty!13339)))

(declare-fun b!473509 () Bool)

(assert (=> b!473509 (= e!277801 (not e!277804))))

(declare-fun res!282839 () Bool)

(assert (=> b!473509 (=> res!282839 e!277804)))

(assert (=> b!473509 (= res!282839 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215206 () ListLongMap!7761)

(assert (=> b!473509 (= lt!215209 lt!215206)))

(declare-fun lt!215211 () Unit!13948)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!236 (array!30433 array!30435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 V!18891 V!18891 (_ BitVec 32) Int) Unit!13948)

(assert (=> b!473509 (= lt!215211 (lemmaNoChangeToArrayThenSameMapNoExtras!236 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2056 (array!30433 array!30435 (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 (_ BitVec 32) Int) ListLongMap!7761)

(assert (=> b!473509 (= lt!215206 (getCurrentListMapNoExtraKeys!2056 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473509 (= lt!215209 (getCurrentListMapNoExtraKeys!2056 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21721 () Bool)

(assert (=> mapIsEmpty!21721 mapRes!21721))

(declare-fun b!473510 () Bool)

(assert (=> b!473510 (= e!277803 (and e!277805 mapRes!21721))))

(declare-fun condMapEmpty!21721 () Bool)

(declare-fun mapDefault!21721 () ValueCell!6326)

