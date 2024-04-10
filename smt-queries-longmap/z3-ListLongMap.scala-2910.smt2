; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41618 () Bool)

(assert start!41618)

(declare-fun b_free!11271 () Bool)

(declare-fun b_next!11271 () Bool)

(assert (=> start!41618 (= b_free!11271 (not b_next!11271))))

(declare-fun tp!39813 () Bool)

(declare-fun b_and!19619 () Bool)

(assert (=> start!41618 (= tp!39813 b_and!19619)))

(declare-fun mapIsEmpty!20728 () Bool)

(declare-fun mapRes!20728 () Bool)

(assert (=> mapIsEmpty!20728 mapRes!20728))

(declare-fun b!464777 () Bool)

(declare-fun e!271537 () Bool)

(declare-fun tp_is_empty!12699 () Bool)

(assert (=> b!464777 (= e!271537 tp_is_empty!12699)))

(declare-fun res!277851 () Bool)

(declare-fun e!271535 () Bool)

(assert (=> start!41618 (=> (not res!277851) (not e!271535))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41618 (= res!277851 (validMask!0 mask!1365))))

(assert (=> start!41618 e!271535))

(assert (=> start!41618 tp_is_empty!12699))

(assert (=> start!41618 tp!39813))

(assert (=> start!41618 true))

(declare-datatypes ((array!29185 0))(
  ( (array!29186 (arr!14023 (Array (_ BitVec 32) (_ BitVec 64))) (size!14375 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29185)

(declare-fun array_inv!10126 (array!29185) Bool)

(assert (=> start!41618 (array_inv!10126 _keys!1025)))

(declare-datatypes ((V!18037 0))(
  ( (V!18038 (val!6394 Int)) )
))
(declare-datatypes ((ValueCell!6006 0))(
  ( (ValueCellFull!6006 (v!8681 V!18037)) (EmptyCell!6006) )
))
(declare-datatypes ((array!29187 0))(
  ( (array!29188 (arr!14024 (Array (_ BitVec 32) ValueCell!6006)) (size!14376 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29187)

(declare-fun e!271536 () Bool)

(declare-fun array_inv!10127 (array!29187) Bool)

(assert (=> start!41618 (and (array_inv!10127 _values!833) e!271536)))

(declare-fun b!464778 () Bool)

(declare-fun res!277850 () Bool)

(assert (=> b!464778 (=> (not res!277850) (not e!271535))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464778 (= res!277850 (and (= (size!14376 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14375 _keys!1025) (size!14376 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464779 () Bool)

(declare-fun res!277848 () Bool)

(assert (=> b!464779 (=> (not res!277848) (not e!271535))))

(declare-datatypes ((List!8469 0))(
  ( (Nil!8466) (Cons!8465 (h!9321 (_ BitVec 64)) (t!14417 List!8469)) )
))
(declare-fun arrayNoDuplicates!0 (array!29185 (_ BitVec 32) List!8469) Bool)

(assert (=> b!464779 (= res!277848 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8466))))

(declare-fun b!464780 () Bool)

(declare-fun res!277849 () Bool)

(assert (=> b!464780 (=> (not res!277849) (not e!271535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29185 (_ BitVec 32)) Bool)

(assert (=> b!464780 (= res!277849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464781 () Bool)

(declare-fun e!271533 () Bool)

(assert (=> b!464781 (= e!271533 tp_is_empty!12699)))

(declare-fun b!464782 () Bool)

(assert (=> b!464782 (= e!271536 (and e!271533 mapRes!20728))))

(declare-fun condMapEmpty!20728 () Bool)

(declare-fun mapDefault!20728 () ValueCell!6006)

(assert (=> b!464782 (= condMapEmpty!20728 (= (arr!14024 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6006)) mapDefault!20728)))))

(declare-fun mapNonEmpty!20728 () Bool)

(declare-fun tp!39814 () Bool)

(assert (=> mapNonEmpty!20728 (= mapRes!20728 (and tp!39814 e!271537))))

(declare-fun mapKey!20728 () (_ BitVec 32))

(declare-fun mapRest!20728 () (Array (_ BitVec 32) ValueCell!6006))

(declare-fun mapValue!20728 () ValueCell!6006)

(assert (=> mapNonEmpty!20728 (= (arr!14024 _values!833) (store mapRest!20728 mapKey!20728 mapValue!20728))))

(declare-fun b!464783 () Bool)

(assert (=> b!464783 (= e!271535 (not true))))

(declare-datatypes ((tuple2!8376 0))(
  ( (tuple2!8377 (_1!4199 (_ BitVec 64)) (_2!4199 V!18037)) )
))
(declare-datatypes ((List!8470 0))(
  ( (Nil!8467) (Cons!8466 (h!9322 tuple2!8376) (t!14418 List!8470)) )
))
(declare-datatypes ((ListLongMap!7289 0))(
  ( (ListLongMap!7290 (toList!3660 List!8470)) )
))
(declare-fun lt!209864 () ListLongMap!7289)

(declare-fun lt!209865 () ListLongMap!7289)

(assert (=> b!464783 (= lt!209864 lt!209865)))

(declare-datatypes ((Unit!13488 0))(
  ( (Unit!13489) )
))
(declare-fun lt!209863 () Unit!13488)

(declare-fun minValueBefore!38 () V!18037)

(declare-fun zeroValue!794 () V!18037)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18037)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!20 (array!29185 array!29187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18037 V!18037 V!18037 V!18037 (_ BitVec 32) Int) Unit!13488)

(assert (=> b!464783 (= lt!209863 (lemmaNoChangeToArrayThenSameMapNoExtras!20 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1840 (array!29185 array!29187 (_ BitVec 32) (_ BitVec 32) V!18037 V!18037 (_ BitVec 32) Int) ListLongMap!7289)

(assert (=> b!464783 (= lt!209865 (getCurrentListMapNoExtraKeys!1840 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464783 (= lt!209864 (getCurrentListMapNoExtraKeys!1840 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41618 res!277851) b!464778))

(assert (= (and b!464778 res!277850) b!464780))

(assert (= (and b!464780 res!277849) b!464779))

(assert (= (and b!464779 res!277848) b!464783))

(assert (= (and b!464782 condMapEmpty!20728) mapIsEmpty!20728))

(assert (= (and b!464782 (not condMapEmpty!20728)) mapNonEmpty!20728))

(get-info :version)

(assert (= (and mapNonEmpty!20728 ((_ is ValueCellFull!6006) mapValue!20728)) b!464777))

(assert (= (and b!464782 ((_ is ValueCellFull!6006) mapDefault!20728)) b!464781))

(assert (= start!41618 b!464782))

(declare-fun m!447107 () Bool)

(assert (=> b!464783 m!447107))

(declare-fun m!447109 () Bool)

(assert (=> b!464783 m!447109))

(declare-fun m!447111 () Bool)

(assert (=> b!464783 m!447111))

(declare-fun m!447113 () Bool)

(assert (=> start!41618 m!447113))

(declare-fun m!447115 () Bool)

(assert (=> start!41618 m!447115))

(declare-fun m!447117 () Bool)

(assert (=> start!41618 m!447117))

(declare-fun m!447119 () Bool)

(assert (=> b!464779 m!447119))

(declare-fun m!447121 () Bool)

(assert (=> b!464780 m!447121))

(declare-fun m!447123 () Bool)

(assert (=> mapNonEmpty!20728 m!447123))

(check-sat (not b!464779) (not b!464783) (not mapNonEmpty!20728) (not start!41618) (not b!464780) (not b_next!11271) b_and!19619 tp_is_empty!12699)
(check-sat b_and!19619 (not b_next!11271))
