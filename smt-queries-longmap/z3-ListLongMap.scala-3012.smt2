; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42408 () Bool)

(assert start!42408)

(declare-fun b_free!11883 () Bool)

(declare-fun b_next!11883 () Bool)

(assert (=> start!42408 (= b_free!11883 (not b_next!11883))))

(declare-fun tp!41682 () Bool)

(declare-fun b_and!20339 () Bool)

(assert (=> start!42408 (= tp!41682 b_and!20339)))

(declare-fun b!473168 () Bool)

(declare-fun res!282628 () Bool)

(declare-fun e!277548 () Bool)

(assert (=> b!473168 (=> (not res!282628) (not e!277548))))

(declare-datatypes ((array!30381 0))(
  ( (array!30382 (arr!14610 (Array (_ BitVec 32) (_ BitVec 64))) (size!14962 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30381)

(declare-datatypes ((List!8909 0))(
  ( (Nil!8906) (Cons!8905 (h!9761 (_ BitVec 64)) (t!14879 List!8909)) )
))
(declare-fun arrayNoDuplicates!0 (array!30381 (_ BitVec 32) List!8909) Bool)

(assert (=> b!473168 (= res!282628 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8906))))

(declare-fun b!473169 () Bool)

(declare-fun e!277553 () Bool)

(declare-fun tp_is_empty!13311 () Bool)

(assert (=> b!473169 (= e!277553 tp_is_empty!13311)))

(declare-fun res!282629 () Bool)

(assert (=> start!42408 (=> (not res!282629) (not e!277548))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42408 (= res!282629 (validMask!0 mask!1365))))

(assert (=> start!42408 e!277548))

(assert (=> start!42408 tp_is_empty!13311))

(assert (=> start!42408 tp!41682))

(assert (=> start!42408 true))

(declare-fun array_inv!10540 (array!30381) Bool)

(assert (=> start!42408 (array_inv!10540 _keys!1025)))

(declare-datatypes ((V!18853 0))(
  ( (V!18854 (val!6700 Int)) )
))
(declare-datatypes ((ValueCell!6312 0))(
  ( (ValueCellFull!6312 (v!8991 V!18853)) (EmptyCell!6312) )
))
(declare-datatypes ((array!30383 0))(
  ( (array!30384 (arr!14611 (Array (_ BitVec 32) ValueCell!6312)) (size!14963 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30383)

(declare-fun e!277549 () Bool)

(declare-fun array_inv!10541 (array!30383) Bool)

(assert (=> start!42408 (and (array_inv!10541 _values!833) e!277549)))

(declare-fun b!473170 () Bool)

(declare-fun e!277550 () Bool)

(assert (=> b!473170 (= e!277550 tp_is_empty!13311)))

(declare-fun b!473171 () Bool)

(declare-fun e!277551 () Bool)

(assert (=> b!473171 (= e!277551 true)))

(declare-datatypes ((tuple2!8826 0))(
  ( (tuple2!8827 (_1!4424 (_ BitVec 64)) (_2!4424 V!18853)) )
))
(declare-datatypes ((List!8910 0))(
  ( (Nil!8907) (Cons!8906 (h!9762 tuple2!8826) (t!14880 List!8910)) )
))
(declare-datatypes ((ListLongMap!7739 0))(
  ( (ListLongMap!7740 (toList!3885 List!8910)) )
))
(declare-fun lt!214876 () ListLongMap!7739)

(declare-fun lt!214870 () tuple2!8826)

(declare-fun minValueBefore!38 () V!18853)

(declare-fun +!1724 (ListLongMap!7739 tuple2!8826) ListLongMap!7739)

(assert (=> b!473171 (= (+!1724 lt!214876 lt!214870) (+!1724 (+!1724 lt!214876 (tuple2!8827 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214870))))

(declare-fun minValueAfter!38 () V!18853)

(assert (=> b!473171 (= lt!214870 (tuple2!8827 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13926 0))(
  ( (Unit!13927) )
))
(declare-fun lt!214875 () Unit!13926)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!133 (ListLongMap!7739 (_ BitVec 64) V!18853 V!18853) Unit!13926)

(assert (=> b!473171 (= lt!214875 (addSameAsAddTwiceSameKeyDiffValues!133 lt!214876 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214869 () ListLongMap!7739)

(declare-fun zeroValue!794 () V!18853)

(assert (=> b!473171 (= lt!214876 (+!1724 lt!214869 (tuple2!8827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!214873 () ListLongMap!7739)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2253 (array!30381 array!30383 (_ BitVec 32) (_ BitVec 32) V!18853 V!18853 (_ BitVec 32) Int) ListLongMap!7739)

(assert (=> b!473171 (= lt!214873 (getCurrentListMap!2253 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!214874 () ListLongMap!7739)

(assert (=> b!473171 (= lt!214874 (getCurrentListMap!2253 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473172 () Bool)

(declare-fun res!282630 () Bool)

(assert (=> b!473172 (=> (not res!282630) (not e!277548))))

(assert (=> b!473172 (= res!282630 (and (= (size!14963 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14962 _keys!1025) (size!14963 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473173 () Bool)

(declare-fun mapRes!21679 () Bool)

(assert (=> b!473173 (= e!277549 (and e!277550 mapRes!21679))))

(declare-fun condMapEmpty!21679 () Bool)

(declare-fun mapDefault!21679 () ValueCell!6312)

(assert (=> b!473173 (= condMapEmpty!21679 (= (arr!14611 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6312)) mapDefault!21679)))))

(declare-fun b!473174 () Bool)

(declare-fun res!282627 () Bool)

(assert (=> b!473174 (=> (not res!282627) (not e!277548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30381 (_ BitVec 32)) Bool)

(assert (=> b!473174 (= res!282627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21679 () Bool)

(declare-fun tp!41683 () Bool)

(assert (=> mapNonEmpty!21679 (= mapRes!21679 (and tp!41683 e!277553))))

(declare-fun mapRest!21679 () (Array (_ BitVec 32) ValueCell!6312))

(declare-fun mapValue!21679 () ValueCell!6312)

(declare-fun mapKey!21679 () (_ BitVec 32))

(assert (=> mapNonEmpty!21679 (= (arr!14611 _values!833) (store mapRest!21679 mapKey!21679 mapValue!21679))))

(declare-fun mapIsEmpty!21679 () Bool)

(assert (=> mapIsEmpty!21679 mapRes!21679))

(declare-fun b!473175 () Bool)

(assert (=> b!473175 (= e!277548 (not e!277551))))

(declare-fun res!282631 () Bool)

(assert (=> b!473175 (=> res!282631 e!277551)))

(assert (=> b!473175 (= res!282631 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214872 () ListLongMap!7739)

(assert (=> b!473175 (= lt!214869 lt!214872)))

(declare-fun lt!214871 () Unit!13926)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!225 (array!30381 array!30383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18853 V!18853 V!18853 V!18853 (_ BitVec 32) Int) Unit!13926)

(assert (=> b!473175 (= lt!214871 (lemmaNoChangeToArrayThenSameMapNoExtras!225 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2045 (array!30381 array!30383 (_ BitVec 32) (_ BitVec 32) V!18853 V!18853 (_ BitVec 32) Int) ListLongMap!7739)

(assert (=> b!473175 (= lt!214872 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473175 (= lt!214869 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42408 res!282629) b!473172))

(assert (= (and b!473172 res!282630) b!473174))

(assert (= (and b!473174 res!282627) b!473168))

(assert (= (and b!473168 res!282628) b!473175))

(assert (= (and b!473175 (not res!282631)) b!473171))

(assert (= (and b!473173 condMapEmpty!21679) mapIsEmpty!21679))

(assert (= (and b!473173 (not condMapEmpty!21679)) mapNonEmpty!21679))

(get-info :version)

(assert (= (and mapNonEmpty!21679 ((_ is ValueCellFull!6312) mapValue!21679)) b!473169))

(assert (= (and b!473173 ((_ is ValueCellFull!6312) mapDefault!21679)) b!473170))

(assert (= start!42408 b!473173))

(declare-fun m!455129 () Bool)

(assert (=> b!473175 m!455129))

(declare-fun m!455131 () Bool)

(assert (=> b!473175 m!455131))

(declare-fun m!455133 () Bool)

(assert (=> b!473175 m!455133))

(declare-fun m!455135 () Bool)

(assert (=> start!42408 m!455135))

(declare-fun m!455137 () Bool)

(assert (=> start!42408 m!455137))

(declare-fun m!455139 () Bool)

(assert (=> start!42408 m!455139))

(declare-fun m!455141 () Bool)

(assert (=> b!473174 m!455141))

(declare-fun m!455143 () Bool)

(assert (=> b!473168 m!455143))

(declare-fun m!455145 () Bool)

(assert (=> b!473171 m!455145))

(declare-fun m!455147 () Bool)

(assert (=> b!473171 m!455147))

(declare-fun m!455149 () Bool)

(assert (=> b!473171 m!455149))

(declare-fun m!455151 () Bool)

(assert (=> b!473171 m!455151))

(declare-fun m!455153 () Bool)

(assert (=> b!473171 m!455153))

(assert (=> b!473171 m!455149))

(declare-fun m!455155 () Bool)

(assert (=> b!473171 m!455155))

(declare-fun m!455157 () Bool)

(assert (=> b!473171 m!455157))

(declare-fun m!455159 () Bool)

(assert (=> mapNonEmpty!21679 m!455159))

(check-sat b_and!20339 (not b!473175) (not b!473174) (not start!42408) (not b!473168) (not b_next!11883) (not b!473171) (not mapNonEmpty!21679) tp_is_empty!13311)
(check-sat b_and!20339 (not b_next!11883))
