; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41558 () Bool)

(assert start!41558)

(declare-fun b_free!11239 () Bool)

(declare-fun b_next!11239 () Bool)

(assert (=> start!41558 (= b_free!11239 (not b_next!11239))))

(declare-fun tp!39715 () Bool)

(declare-fun b_and!19553 () Bool)

(assert (=> start!41558 (= tp!39715 b_and!19553)))

(declare-fun b!464085 () Bool)

(declare-fun res!277497 () Bool)

(declare-fun e!271067 () Bool)

(assert (=> b!464085 (=> (not res!277497) (not e!271067))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29121 0))(
  ( (array!29122 (arr!13992 (Array (_ BitVec 32) (_ BitVec 64))) (size!14345 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29121)

(declare-datatypes ((V!17995 0))(
  ( (V!17996 (val!6378 Int)) )
))
(declare-datatypes ((ValueCell!5990 0))(
  ( (ValueCellFull!5990 (v!8659 V!17995)) (EmptyCell!5990) )
))
(declare-datatypes ((array!29123 0))(
  ( (array!29124 (arr!13993 (Array (_ BitVec 32) ValueCell!5990)) (size!14346 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29123)

(assert (=> b!464085 (= res!277497 (and (= (size!14346 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14345 _keys!1025) (size!14346 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464086 () Bool)

(declare-fun e!271066 () Bool)

(declare-fun tp_is_empty!12667 () Bool)

(assert (=> b!464086 (= e!271066 tp_is_empty!12667)))

(declare-fun res!277496 () Bool)

(assert (=> start!41558 (=> (not res!277496) (not e!271067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41558 (= res!277496 (validMask!0 mask!1365))))

(assert (=> start!41558 e!271067))

(assert (=> start!41558 tp_is_empty!12667))

(assert (=> start!41558 tp!39715))

(assert (=> start!41558 true))

(declare-fun array_inv!10184 (array!29121) Bool)

(assert (=> start!41558 (array_inv!10184 _keys!1025)))

(declare-fun e!271065 () Bool)

(declare-fun array_inv!10185 (array!29123) Bool)

(assert (=> start!41558 (and (array_inv!10185 _values!833) e!271065)))

(declare-fun mapNonEmpty!20677 () Bool)

(declare-fun mapRes!20677 () Bool)

(declare-fun tp!39714 () Bool)

(assert (=> mapNonEmpty!20677 (= mapRes!20677 (and tp!39714 e!271066))))

(declare-fun mapKey!20677 () (_ BitVec 32))

(declare-fun mapRest!20677 () (Array (_ BitVec 32) ValueCell!5990))

(declare-fun mapValue!20677 () ValueCell!5990)

(assert (=> mapNonEmpty!20677 (= (arr!13993 _values!833) (store mapRest!20677 mapKey!20677 mapValue!20677))))

(declare-fun b!464087 () Bool)

(assert (=> b!464087 (= e!271067 (not true))))

(declare-datatypes ((tuple2!8386 0))(
  ( (tuple2!8387 (_1!4204 (_ BitVec 64)) (_2!4204 V!17995)) )
))
(declare-datatypes ((List!8474 0))(
  ( (Nil!8471) (Cons!8470 (h!9326 tuple2!8386) (t!14411 List!8474)) )
))
(declare-datatypes ((ListLongMap!7289 0))(
  ( (ListLongMap!7290 (toList!3660 List!8474)) )
))
(declare-fun lt!209446 () ListLongMap!7289)

(declare-fun lt!209445 () ListLongMap!7289)

(assert (=> b!464087 (= lt!209446 lt!209445)))

(declare-fun minValueBefore!38 () V!17995)

(declare-fun zeroValue!794 () V!17995)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13436 0))(
  ( (Unit!13437) )
))
(declare-fun lt!209447 () Unit!13436)

(declare-fun minValueAfter!38 () V!17995)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!9 (array!29121 array!29123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17995 V!17995 V!17995 V!17995 (_ BitVec 32) Int) Unit!13436)

(assert (=> b!464087 (= lt!209447 (lemmaNoChangeToArrayThenSameMapNoExtras!9 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1852 (array!29121 array!29123 (_ BitVec 32) (_ BitVec 32) V!17995 V!17995 (_ BitVec 32) Int) ListLongMap!7289)

(assert (=> b!464087 (= lt!209445 (getCurrentListMapNoExtraKeys!1852 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464087 (= lt!209446 (getCurrentListMapNoExtraKeys!1852 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464088 () Bool)

(declare-fun res!277498 () Bool)

(assert (=> b!464088 (=> (not res!277498) (not e!271067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29121 (_ BitVec 32)) Bool)

(assert (=> b!464088 (= res!277498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20677 () Bool)

(assert (=> mapIsEmpty!20677 mapRes!20677))

(declare-fun b!464089 () Bool)

(declare-fun e!271068 () Bool)

(assert (=> b!464089 (= e!271065 (and e!271068 mapRes!20677))))

(declare-fun condMapEmpty!20677 () Bool)

(declare-fun mapDefault!20677 () ValueCell!5990)

(assert (=> b!464089 (= condMapEmpty!20677 (= (arr!13993 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5990)) mapDefault!20677)))))

(declare-fun b!464090 () Bool)

(assert (=> b!464090 (= e!271068 tp_is_empty!12667)))

(declare-fun b!464091 () Bool)

(declare-fun res!277499 () Bool)

(assert (=> b!464091 (=> (not res!277499) (not e!271067))))

(declare-datatypes ((List!8475 0))(
  ( (Nil!8472) (Cons!8471 (h!9327 (_ BitVec 64)) (t!14412 List!8475)) )
))
(declare-fun arrayNoDuplicates!0 (array!29121 (_ BitVec 32) List!8475) Bool)

(assert (=> b!464091 (= res!277499 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8472))))

(assert (= (and start!41558 res!277496) b!464085))

(assert (= (and b!464085 res!277497) b!464088))

(assert (= (and b!464088 res!277498) b!464091))

(assert (= (and b!464091 res!277499) b!464087))

(assert (= (and b!464089 condMapEmpty!20677) mapIsEmpty!20677))

(assert (= (and b!464089 (not condMapEmpty!20677)) mapNonEmpty!20677))

(get-info :version)

(assert (= (and mapNonEmpty!20677 ((_ is ValueCellFull!5990) mapValue!20677)) b!464086))

(assert (= (and b!464089 ((_ is ValueCellFull!5990) mapDefault!20677)) b!464090))

(assert (= start!41558 b!464089))

(declare-fun m!446019 () Bool)

(assert (=> b!464088 m!446019))

(declare-fun m!446021 () Bool)

(assert (=> start!41558 m!446021))

(declare-fun m!446023 () Bool)

(assert (=> start!41558 m!446023))

(declare-fun m!446025 () Bool)

(assert (=> start!41558 m!446025))

(declare-fun m!446027 () Bool)

(assert (=> b!464087 m!446027))

(declare-fun m!446029 () Bool)

(assert (=> b!464087 m!446029))

(declare-fun m!446031 () Bool)

(assert (=> b!464087 m!446031))

(declare-fun m!446033 () Bool)

(assert (=> mapNonEmpty!20677 m!446033))

(declare-fun m!446035 () Bool)

(assert (=> b!464091 m!446035))

(check-sat tp_is_empty!12667 b_and!19553 (not b!464091) (not start!41558) (not b!464087) (not b_next!11239) (not b!464088) (not mapNonEmpty!20677))
(check-sat b_and!19553 (not b_next!11239))
