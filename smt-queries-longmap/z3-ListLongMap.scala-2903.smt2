; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41546 () Bool)

(assert start!41546)

(declare-fun b_free!11227 () Bool)

(declare-fun b_next!11227 () Bool)

(assert (=> start!41546 (= b_free!11227 (not b_next!11227))))

(declare-fun tp!39678 () Bool)

(declare-fun b_and!19577 () Bool)

(assert (=> start!41546 (= tp!39678 b_and!19577)))

(declare-fun b!464169 () Bool)

(declare-fun e!271110 () Bool)

(declare-fun e!271111 () Bool)

(declare-fun mapRes!20659 () Bool)

(assert (=> b!464169 (= e!271110 (and e!271111 mapRes!20659))))

(declare-fun condMapEmpty!20659 () Bool)

(declare-datatypes ((V!17979 0))(
  ( (V!17980 (val!6372 Int)) )
))
(declare-datatypes ((ValueCell!5984 0))(
  ( (ValueCellFull!5984 (v!8660 V!17979)) (EmptyCell!5984) )
))
(declare-datatypes ((array!29098 0))(
  ( (array!29099 (arr!13980 (Array (_ BitVec 32) ValueCell!5984)) (size!14332 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29098)

(declare-fun mapDefault!20659 () ValueCell!5984)

(assert (=> b!464169 (= condMapEmpty!20659 (= (arr!13980 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5984)) mapDefault!20659)))))

(declare-fun b!464170 () Bool)

(declare-fun res!277546 () Bool)

(declare-fun e!271109 () Bool)

(assert (=> b!464170 (=> (not res!277546) (not e!271109))))

(declare-datatypes ((array!29100 0))(
  ( (array!29101 (arr!13981 (Array (_ BitVec 32) (_ BitVec 64))) (size!14333 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29100)

(declare-datatypes ((List!8372 0))(
  ( (Nil!8369) (Cons!8368 (h!9224 (_ BitVec 64)) (t!14310 List!8372)) )
))
(declare-fun arrayNoDuplicates!0 (array!29100 (_ BitVec 32) List!8372) Bool)

(assert (=> b!464170 (= res!277546 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8369))))

(declare-fun b!464171 () Bool)

(declare-fun res!277549 () Bool)

(assert (=> b!464171 (=> (not res!277549) (not e!271109))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29100 (_ BitVec 32)) Bool)

(assert (=> b!464171 (= res!277549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464172 () Bool)

(assert (=> b!464172 (= e!271109 (not true))))

(declare-datatypes ((tuple2!8290 0))(
  ( (tuple2!8291 (_1!4156 (_ BitVec 64)) (_2!4156 V!17979)) )
))
(declare-datatypes ((List!8373 0))(
  ( (Nil!8370) (Cons!8369 (h!9225 tuple2!8290) (t!14311 List!8373)) )
))
(declare-datatypes ((ListLongMap!7205 0))(
  ( (ListLongMap!7206 (toList!3618 List!8373)) )
))
(declare-fun lt!209639 () ListLongMap!7205)

(declare-fun lt!209638 () ListLongMap!7205)

(assert (=> b!464172 (= lt!209639 lt!209638)))

(declare-fun minValueBefore!38 () V!17979)

(declare-fun zeroValue!794 () V!17979)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13454 0))(
  ( (Unit!13455) )
))
(declare-fun lt!209637 () Unit!13454)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17979)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!5 (array!29100 array!29098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17979 V!17979 V!17979 V!17979 (_ BitVec 32) Int) Unit!13454)

(assert (=> b!464172 (= lt!209637 (lemmaNoChangeToArrayThenSameMapNoExtras!5 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1845 (array!29100 array!29098 (_ BitVec 32) (_ BitVec 32) V!17979 V!17979 (_ BitVec 32) Int) ListLongMap!7205)

(assert (=> b!464172 (= lt!209638 (getCurrentListMapNoExtraKeys!1845 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464172 (= lt!209639 (getCurrentListMapNoExtraKeys!1845 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277548 () Bool)

(assert (=> start!41546 (=> (not res!277548) (not e!271109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41546 (= res!277548 (validMask!0 mask!1365))))

(assert (=> start!41546 e!271109))

(declare-fun tp_is_empty!12655 () Bool)

(assert (=> start!41546 tp_is_empty!12655))

(assert (=> start!41546 tp!39678))

(assert (=> start!41546 true))

(declare-fun array_inv!10180 (array!29100) Bool)

(assert (=> start!41546 (array_inv!10180 _keys!1025)))

(declare-fun array_inv!10181 (array!29098) Bool)

(assert (=> start!41546 (and (array_inv!10181 _values!833) e!271110)))

(declare-fun b!464173 () Bool)

(assert (=> b!464173 (= e!271111 tp_is_empty!12655)))

(declare-fun b!464174 () Bool)

(declare-fun res!277547 () Bool)

(assert (=> b!464174 (=> (not res!277547) (not e!271109))))

(assert (=> b!464174 (= res!277547 (and (= (size!14332 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14333 _keys!1025) (size!14332 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20659 () Bool)

(declare-fun tp!39679 () Bool)

(declare-fun e!271112 () Bool)

(assert (=> mapNonEmpty!20659 (= mapRes!20659 (and tp!39679 e!271112))))

(declare-fun mapValue!20659 () ValueCell!5984)

(declare-fun mapRest!20659 () (Array (_ BitVec 32) ValueCell!5984))

(declare-fun mapKey!20659 () (_ BitVec 32))

(assert (=> mapNonEmpty!20659 (= (arr!13980 _values!833) (store mapRest!20659 mapKey!20659 mapValue!20659))))

(declare-fun b!464175 () Bool)

(assert (=> b!464175 (= e!271112 tp_is_empty!12655)))

(declare-fun mapIsEmpty!20659 () Bool)

(assert (=> mapIsEmpty!20659 mapRes!20659))

(assert (= (and start!41546 res!277548) b!464174))

(assert (= (and b!464174 res!277547) b!464171))

(assert (= (and b!464171 res!277549) b!464170))

(assert (= (and b!464170 res!277546) b!464172))

(assert (= (and b!464169 condMapEmpty!20659) mapIsEmpty!20659))

(assert (= (and b!464169 (not condMapEmpty!20659)) mapNonEmpty!20659))

(get-info :version)

(assert (= (and mapNonEmpty!20659 ((_ is ValueCellFull!5984) mapValue!20659)) b!464175))

(assert (= (and b!464169 ((_ is ValueCellFull!5984) mapDefault!20659)) b!464173))

(assert (= start!41546 b!464169))

(declare-fun m!446827 () Bool)

(assert (=> b!464172 m!446827))

(declare-fun m!446829 () Bool)

(assert (=> b!464172 m!446829))

(declare-fun m!446831 () Bool)

(assert (=> b!464172 m!446831))

(declare-fun m!446833 () Bool)

(assert (=> mapNonEmpty!20659 m!446833))

(declare-fun m!446835 () Bool)

(assert (=> b!464171 m!446835))

(declare-fun m!446837 () Bool)

(assert (=> b!464170 m!446837))

(declare-fun m!446839 () Bool)

(assert (=> start!41546 m!446839))

(declare-fun m!446841 () Bool)

(assert (=> start!41546 m!446841))

(declare-fun m!446843 () Bool)

(assert (=> start!41546 m!446843))

(check-sat tp_is_empty!12655 (not mapNonEmpty!20659) (not b!464171) (not b!464170) (not b!464172) b_and!19577 (not b_next!11227) (not start!41546))
(check-sat b_and!19577 (not b_next!11227))
