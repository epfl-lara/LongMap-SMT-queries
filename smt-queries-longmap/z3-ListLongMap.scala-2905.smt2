; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41558 () Bool)

(assert start!41558)

(declare-fun b_free!11239 () Bool)

(declare-fun b_next!11239 () Bool)

(assert (=> start!41558 (= b_free!11239 (not b_next!11239))))

(declare-fun tp!39715 () Bool)

(declare-fun b_and!19589 () Bool)

(assert (=> start!41558 (= tp!39715 b_and!19589)))

(declare-fun res!277618 () Bool)

(declare-fun e!271200 () Bool)

(assert (=> start!41558 (=> (not res!277618) (not e!271200))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41558 (= res!277618 (validMask!0 mask!1365))))

(assert (=> start!41558 e!271200))

(declare-fun tp_is_empty!12667 () Bool)

(assert (=> start!41558 tp_is_empty!12667))

(assert (=> start!41558 tp!39715))

(assert (=> start!41558 true))

(declare-datatypes ((array!29118 0))(
  ( (array!29119 (arr!13990 (Array (_ BitVec 32) (_ BitVec 64))) (size!14342 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29118)

(declare-fun array_inv!10188 (array!29118) Bool)

(assert (=> start!41558 (array_inv!10188 _keys!1025)))

(declare-datatypes ((V!17995 0))(
  ( (V!17996 (val!6378 Int)) )
))
(declare-datatypes ((ValueCell!5990 0))(
  ( (ValueCellFull!5990 (v!8666 V!17995)) (EmptyCell!5990) )
))
(declare-datatypes ((array!29120 0))(
  ( (array!29121 (arr!13991 (Array (_ BitVec 32) ValueCell!5990)) (size!14343 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29120)

(declare-fun e!271203 () Bool)

(declare-fun array_inv!10189 (array!29120) Bool)

(assert (=> start!41558 (and (array_inv!10189 _values!833) e!271203)))

(declare-fun b!464295 () Bool)

(declare-fun res!277620 () Bool)

(assert (=> b!464295 (=> (not res!277620) (not e!271200))))

(declare-datatypes ((List!8378 0))(
  ( (Nil!8375) (Cons!8374 (h!9230 (_ BitVec 64)) (t!14316 List!8378)) )
))
(declare-fun arrayNoDuplicates!0 (array!29118 (_ BitVec 32) List!8378) Bool)

(assert (=> b!464295 (= res!277620 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8375))))

(declare-fun b!464296 () Bool)

(declare-fun e!271199 () Bool)

(assert (=> b!464296 (= e!271199 tp_is_empty!12667)))

(declare-fun mapNonEmpty!20677 () Bool)

(declare-fun mapRes!20677 () Bool)

(declare-fun tp!39714 () Bool)

(declare-fun e!271202 () Bool)

(assert (=> mapNonEmpty!20677 (= mapRes!20677 (and tp!39714 e!271202))))

(declare-fun mapValue!20677 () ValueCell!5990)

(declare-fun mapRest!20677 () (Array (_ BitVec 32) ValueCell!5990))

(declare-fun mapKey!20677 () (_ BitVec 32))

(assert (=> mapNonEmpty!20677 (= (arr!13991 _values!833) (store mapRest!20677 mapKey!20677 mapValue!20677))))

(declare-fun b!464297 () Bool)

(declare-fun res!277621 () Bool)

(assert (=> b!464297 (=> (not res!277621) (not e!271200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29118 (_ BitVec 32)) Bool)

(assert (=> b!464297 (= res!277621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464298 () Bool)

(declare-fun res!277619 () Bool)

(assert (=> b!464298 (=> (not res!277619) (not e!271200))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464298 (= res!277619 (and (= (size!14343 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14342 _keys!1025) (size!14343 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464299 () Bool)

(assert (=> b!464299 (= e!271203 (and e!271199 mapRes!20677))))

(declare-fun condMapEmpty!20677 () Bool)

(declare-fun mapDefault!20677 () ValueCell!5990)

(assert (=> b!464299 (= condMapEmpty!20677 (= (arr!13991 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5990)) mapDefault!20677)))))

(declare-fun b!464300 () Bool)

(assert (=> b!464300 (= e!271202 tp_is_empty!12667)))

(declare-fun mapIsEmpty!20677 () Bool)

(assert (=> mapIsEmpty!20677 mapRes!20677))

(declare-fun b!464301 () Bool)

(assert (=> b!464301 (= e!271200 (not true))))

(declare-datatypes ((tuple2!8296 0))(
  ( (tuple2!8297 (_1!4159 (_ BitVec 64)) (_2!4159 V!17995)) )
))
(declare-datatypes ((List!8379 0))(
  ( (Nil!8376) (Cons!8375 (h!9231 tuple2!8296) (t!14317 List!8379)) )
))
(declare-datatypes ((ListLongMap!7211 0))(
  ( (ListLongMap!7212 (toList!3621 List!8379)) )
))
(declare-fun lt!209692 () ListLongMap!7211)

(declare-fun lt!209693 () ListLongMap!7211)

(assert (=> b!464301 (= lt!209692 lt!209693)))

(declare-fun minValueBefore!38 () V!17995)

(declare-fun zeroValue!794 () V!17995)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13460 0))(
  ( (Unit!13461) )
))
(declare-fun lt!209691 () Unit!13460)

(declare-fun minValueAfter!38 () V!17995)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!8 (array!29118 array!29120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17995 V!17995 V!17995 V!17995 (_ BitVec 32) Int) Unit!13460)

(assert (=> b!464301 (= lt!209691 (lemmaNoChangeToArrayThenSameMapNoExtras!8 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1848 (array!29118 array!29120 (_ BitVec 32) (_ BitVec 32) V!17995 V!17995 (_ BitVec 32) Int) ListLongMap!7211)

(assert (=> b!464301 (= lt!209693 (getCurrentListMapNoExtraKeys!1848 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464301 (= lt!209692 (getCurrentListMapNoExtraKeys!1848 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41558 res!277618) b!464298))

(assert (= (and b!464298 res!277619) b!464297))

(assert (= (and b!464297 res!277621) b!464295))

(assert (= (and b!464295 res!277620) b!464301))

(assert (= (and b!464299 condMapEmpty!20677) mapIsEmpty!20677))

(assert (= (and b!464299 (not condMapEmpty!20677)) mapNonEmpty!20677))

(get-info :version)

(assert (= (and mapNonEmpty!20677 ((_ is ValueCellFull!5990) mapValue!20677)) b!464300))

(assert (= (and b!464299 ((_ is ValueCellFull!5990) mapDefault!20677)) b!464296))

(assert (= start!41558 b!464299))

(declare-fun m!446935 () Bool)

(assert (=> start!41558 m!446935))

(declare-fun m!446937 () Bool)

(assert (=> start!41558 m!446937))

(declare-fun m!446939 () Bool)

(assert (=> start!41558 m!446939))

(declare-fun m!446941 () Bool)

(assert (=> b!464297 m!446941))

(declare-fun m!446943 () Bool)

(assert (=> mapNonEmpty!20677 m!446943))

(declare-fun m!446945 () Bool)

(assert (=> b!464301 m!446945))

(declare-fun m!446947 () Bool)

(assert (=> b!464301 m!446947))

(declare-fun m!446949 () Bool)

(assert (=> b!464301 m!446949))

(declare-fun m!446951 () Bool)

(assert (=> b!464295 m!446951))

(check-sat (not b!464301) (not b_next!11239) tp_is_empty!12667 (not b!464297) (not mapNonEmpty!20677) (not start!41558) (not b!464295) b_and!19589)
(check-sat b_and!19589 (not b_next!11239))
