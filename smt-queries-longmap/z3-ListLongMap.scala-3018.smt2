; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42448 () Bool)

(assert start!42448)

(declare-fun b_free!11917 () Bool)

(declare-fun b_next!11917 () Bool)

(assert (=> start!42448 (= b_free!11917 (not b_next!11917))))

(declare-fun tp!41788 () Bool)

(declare-fun b_and!20359 () Bool)

(assert (=> start!42448 (= tp!41788 b_and!20359)))

(declare-fun b!473486 () Bool)

(declare-fun e!277796 () Bool)

(assert (=> b!473486 (= e!277796 true)))

(declare-datatypes ((V!18899 0))(
  ( (V!18900 (val!6717 Int)) )
))
(declare-datatypes ((tuple2!8902 0))(
  ( (tuple2!8903 (_1!4462 (_ BitVec 64)) (_2!4462 V!18899)) )
))
(declare-datatypes ((List!8969 0))(
  ( (Nil!8966) (Cons!8965 (h!9821 tuple2!8902) (t!14932 List!8969)) )
))
(declare-datatypes ((ListLongMap!7805 0))(
  ( (ListLongMap!7806 (toList!3918 List!8969)) )
))
(declare-fun lt!215202 () ListLongMap!7805)

(declare-fun lt!215200 () tuple2!8902)

(declare-fun minValueBefore!38 () V!18899)

(declare-fun +!1768 (ListLongMap!7805 tuple2!8902) ListLongMap!7805)

(assert (=> b!473486 (= (+!1768 lt!215202 lt!215200) (+!1768 (+!1768 lt!215202 (tuple2!8903 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215200))))

(declare-fun minValueAfter!38 () V!18899)

(assert (=> b!473486 (= lt!215200 (tuple2!8903 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13932 0))(
  ( (Unit!13933) )
))
(declare-fun lt!215201 () Unit!13932)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!147 (ListLongMap!7805 (_ BitVec 64) V!18899 V!18899) Unit!13932)

(assert (=> b!473486 (= lt!215201 (addSameAsAddTwiceSameKeyDiffValues!147 lt!215202 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215205 () ListLongMap!7805)

(declare-fun zeroValue!794 () V!18899)

(assert (=> b!473486 (= lt!215202 (+!1768 lt!215205 (tuple2!8903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!30429 0))(
  ( (array!30430 (arr!14633 (Array (_ BitVec 32) (_ BitVec 64))) (size!14986 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30429)

(declare-datatypes ((ValueCell!6329 0))(
  ( (ValueCellFull!6329 (v!9003 V!18899)) (EmptyCell!6329) )
))
(declare-datatypes ((array!30431 0))(
  ( (array!30432 (arr!14634 (Array (_ BitVec 32) ValueCell!6329)) (size!14987 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30431)

(declare-fun lt!215199 () ListLongMap!7805)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2220 (array!30429 array!30431 (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 (_ BitVec 32) Int) ListLongMap!7805)

(assert (=> b!473486 (= lt!215199 (getCurrentListMap!2220 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215203 () ListLongMap!7805)

(assert (=> b!473486 (= lt!215203 (getCurrentListMap!2220 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21733 () Bool)

(declare-fun mapRes!21733 () Bool)

(declare-fun tp!41787 () Bool)

(declare-fun e!277794 () Bool)

(assert (=> mapNonEmpty!21733 (= mapRes!21733 (and tp!41787 e!277794))))

(declare-fun mapKey!21733 () (_ BitVec 32))

(declare-fun mapRest!21733 () (Array (_ BitVec 32) ValueCell!6329))

(declare-fun mapValue!21733 () ValueCell!6329)

(assert (=> mapNonEmpty!21733 (= (arr!14634 _values!833) (store mapRest!21733 mapKey!21733 mapValue!21733))))

(declare-fun b!473488 () Bool)

(declare-fun res!282836 () Bool)

(declare-fun e!277798 () Bool)

(assert (=> b!473488 (=> (not res!282836) (not e!277798))))

(declare-datatypes ((List!8970 0))(
  ( (Nil!8967) (Cons!8966 (h!9822 (_ BitVec 64)) (t!14933 List!8970)) )
))
(declare-fun arrayNoDuplicates!0 (array!30429 (_ BitVec 32) List!8970) Bool)

(assert (=> b!473488 (= res!282836 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8967))))

(declare-fun b!473489 () Bool)

(declare-fun e!277795 () Bool)

(declare-fun e!277793 () Bool)

(assert (=> b!473489 (= e!277795 (and e!277793 mapRes!21733))))

(declare-fun condMapEmpty!21733 () Bool)

(declare-fun mapDefault!21733 () ValueCell!6329)

(assert (=> b!473489 (= condMapEmpty!21733 (= (arr!14634 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6329)) mapDefault!21733)))))

(declare-fun b!473490 () Bool)

(declare-fun res!282834 () Bool)

(assert (=> b!473490 (=> (not res!282834) (not e!277798))))

(assert (=> b!473490 (= res!282834 (and (= (size!14987 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14986 _keys!1025) (size!14987 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473491 () Bool)

(declare-fun tp_is_empty!13345 () Bool)

(assert (=> b!473491 (= e!277794 tp_is_empty!13345)))

(declare-fun mapIsEmpty!21733 () Bool)

(assert (=> mapIsEmpty!21733 mapRes!21733))

(declare-fun b!473487 () Bool)

(assert (=> b!473487 (= e!277798 (not e!277796))))

(declare-fun res!282832 () Bool)

(assert (=> b!473487 (=> res!282832 e!277796)))

(assert (=> b!473487 (= res!282832 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215204 () ListLongMap!7805)

(assert (=> b!473487 (= lt!215205 lt!215204)))

(declare-fun lt!215198 () Unit!13932)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!244 (array!30429 array!30431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 V!18899 V!18899 (_ BitVec 32) Int) Unit!13932)

(assert (=> b!473487 (= lt!215198 (lemmaNoChangeToArrayThenSameMapNoExtras!244 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2087 (array!30429 array!30431 (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 (_ BitVec 32) Int) ListLongMap!7805)

(assert (=> b!473487 (= lt!215204 (getCurrentListMapNoExtraKeys!2087 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473487 (= lt!215205 (getCurrentListMapNoExtraKeys!2087 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282833 () Bool)

(assert (=> start!42448 (=> (not res!282833) (not e!277798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42448 (= res!282833 (validMask!0 mask!1365))))

(assert (=> start!42448 e!277798))

(assert (=> start!42448 tp_is_empty!13345))

(assert (=> start!42448 tp!41788))

(assert (=> start!42448 true))

(declare-fun array_inv!10644 (array!30429) Bool)

(assert (=> start!42448 (array_inv!10644 _keys!1025)))

(declare-fun array_inv!10645 (array!30431) Bool)

(assert (=> start!42448 (and (array_inv!10645 _values!833) e!277795)))

(declare-fun b!473492 () Bool)

(assert (=> b!473492 (= e!277793 tp_is_empty!13345)))

(declare-fun b!473493 () Bool)

(declare-fun res!282835 () Bool)

(assert (=> b!473493 (=> (not res!282835) (not e!277798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30429 (_ BitVec 32)) Bool)

(assert (=> b!473493 (= res!282835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42448 res!282833) b!473490))

(assert (= (and b!473490 res!282834) b!473493))

(assert (= (and b!473493 res!282835) b!473488))

(assert (= (and b!473488 res!282836) b!473487))

(assert (= (and b!473487 (not res!282832)) b!473486))

(assert (= (and b!473489 condMapEmpty!21733) mapIsEmpty!21733))

(assert (= (and b!473489 (not condMapEmpty!21733)) mapNonEmpty!21733))

(get-info :version)

(assert (= (and mapNonEmpty!21733 ((_ is ValueCellFull!6329) mapValue!21733)) b!473491))

(assert (= (and b!473489 ((_ is ValueCellFull!6329) mapDefault!21733)) b!473492))

(assert (= start!42448 b!473489))

(declare-fun m!455151 () Bool)

(assert (=> mapNonEmpty!21733 m!455151))

(declare-fun m!455153 () Bool)

(assert (=> b!473486 m!455153))

(declare-fun m!455155 () Bool)

(assert (=> b!473486 m!455155))

(declare-fun m!455157 () Bool)

(assert (=> b!473486 m!455157))

(declare-fun m!455159 () Bool)

(assert (=> b!473486 m!455159))

(declare-fun m!455161 () Bool)

(assert (=> b!473486 m!455161))

(assert (=> b!473486 m!455153))

(declare-fun m!455163 () Bool)

(assert (=> b!473486 m!455163))

(declare-fun m!455165 () Bool)

(assert (=> b!473486 m!455165))

(declare-fun m!455167 () Bool)

(assert (=> start!42448 m!455167))

(declare-fun m!455169 () Bool)

(assert (=> start!42448 m!455169))

(declare-fun m!455171 () Bool)

(assert (=> start!42448 m!455171))

(declare-fun m!455173 () Bool)

(assert (=> b!473488 m!455173))

(declare-fun m!455175 () Bool)

(assert (=> b!473487 m!455175))

(declare-fun m!455177 () Bool)

(assert (=> b!473487 m!455177))

(declare-fun m!455179 () Bool)

(assert (=> b!473487 m!455179))

(declare-fun m!455181 () Bool)

(assert (=> b!473493 m!455181))

(check-sat (not start!42448) (not b!473487) (not b!473488) (not b!473486) (not mapNonEmpty!21733) tp_is_empty!13345 (not b_next!11917) b_and!20359 (not b!473493))
(check-sat b_and!20359 (not b_next!11917))
