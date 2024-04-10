; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41550 () Bool)

(assert start!41550)

(declare-fun b_free!11217 () Bool)

(declare-fun b_next!11217 () Bool)

(assert (=> start!41550 (= b_free!11217 (not b_next!11217))))

(declare-fun tp!39648 () Bool)

(declare-fun b_and!19557 () Bool)

(assert (=> start!41550 (= tp!39648 b_and!19557)))

(declare-fun mapNonEmpty!20644 () Bool)

(declare-fun mapRes!20644 () Bool)

(declare-fun tp!39649 () Bool)

(declare-fun e!271076 () Bool)

(assert (=> mapNonEmpty!20644 (= mapRes!20644 (and tp!39649 e!271076))))

(declare-datatypes ((V!17965 0))(
  ( (V!17966 (val!6367 Int)) )
))
(declare-datatypes ((ValueCell!5979 0))(
  ( (ValueCellFull!5979 (v!8654 V!17965)) (EmptyCell!5979) )
))
(declare-fun mapRest!20644 () (Array (_ BitVec 32) ValueCell!5979))

(declare-datatypes ((array!29079 0))(
  ( (array!29080 (arr!13971 (Array (_ BitVec 32) ValueCell!5979)) (size!14323 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29079)

(declare-fun mapValue!20644 () ValueCell!5979)

(declare-fun mapKey!20644 () (_ BitVec 32))

(assert (=> mapNonEmpty!20644 (= (arr!13971 _values!833) (store mapRest!20644 mapKey!20644 mapValue!20644))))

(declare-fun res!277495 () Bool)

(declare-fun e!271075 () Bool)

(assert (=> start!41550 (=> (not res!277495) (not e!271075))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41550 (= res!277495 (validMask!0 mask!1365))))

(assert (=> start!41550 e!271075))

(declare-fun tp_is_empty!12645 () Bool)

(assert (=> start!41550 tp_is_empty!12645))

(assert (=> start!41550 tp!39648))

(assert (=> start!41550 true))

(declare-datatypes ((array!29081 0))(
  ( (array!29082 (arr!13972 (Array (_ BitVec 32) (_ BitVec 64))) (size!14324 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29081)

(declare-fun array_inv!10094 (array!29081) Bool)

(assert (=> start!41550 (array_inv!10094 _keys!1025)))

(declare-fun e!271074 () Bool)

(declare-fun array_inv!10095 (array!29079) Bool)

(assert (=> start!41550 (and (array_inv!10095 _values!833) e!271074)))

(declare-fun b!464125 () Bool)

(declare-fun res!277496 () Bool)

(assert (=> b!464125 (=> (not res!277496) (not e!271075))))

(declare-datatypes ((List!8434 0))(
  ( (Nil!8431) (Cons!8430 (h!9286 (_ BitVec 64)) (t!14380 List!8434)) )
))
(declare-fun arrayNoDuplicates!0 (array!29081 (_ BitVec 32) List!8434) Bool)

(assert (=> b!464125 (= res!277496 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8431))))

(declare-fun b!464126 () Bool)

(declare-fun res!277494 () Bool)

(assert (=> b!464126 (=> (not res!277494) (not e!271075))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464126 (= res!277494 (and (= (size!14323 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14324 _keys!1025) (size!14323 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20644 () Bool)

(assert (=> mapIsEmpty!20644 mapRes!20644))

(declare-fun b!464127 () Bool)

(declare-fun e!271073 () Bool)

(assert (=> b!464127 (= e!271074 (and e!271073 mapRes!20644))))

(declare-fun condMapEmpty!20644 () Bool)

(declare-fun mapDefault!20644 () ValueCell!5979)

(assert (=> b!464127 (= condMapEmpty!20644 (= (arr!13971 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5979)) mapDefault!20644)))))

(declare-fun b!464128 () Bool)

(assert (=> b!464128 (= e!271075 (not true))))

(declare-datatypes ((tuple2!8340 0))(
  ( (tuple2!8341 (_1!4181 (_ BitVec 64)) (_2!4181 V!17965)) )
))
(declare-datatypes ((List!8435 0))(
  ( (Nil!8432) (Cons!8431 (h!9287 tuple2!8340) (t!14381 List!8435)) )
))
(declare-datatypes ((ListLongMap!7253 0))(
  ( (ListLongMap!7254 (toList!3642 List!8435)) )
))
(declare-fun lt!209581 () ListLongMap!7253)

(declare-fun lt!209582 () ListLongMap!7253)

(assert (=> b!464128 (= lt!209581 lt!209582)))

(declare-fun minValueBefore!38 () V!17965)

(declare-fun zeroValue!794 () V!17965)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13452 0))(
  ( (Unit!13453) )
))
(declare-fun lt!209580 () Unit!13452)

(declare-fun minValueAfter!38 () V!17965)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!2 (array!29081 array!29079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17965 V!17965 V!17965 V!17965 (_ BitVec 32) Int) Unit!13452)

(assert (=> b!464128 (= lt!209580 (lemmaNoChangeToArrayThenSameMapNoExtras!2 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1822 (array!29081 array!29079 (_ BitVec 32) (_ BitVec 32) V!17965 V!17965 (_ BitVec 32) Int) ListLongMap!7253)

(assert (=> b!464128 (= lt!209582 (getCurrentListMapNoExtraKeys!1822 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464128 (= lt!209581 (getCurrentListMapNoExtraKeys!1822 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464129 () Bool)

(assert (=> b!464129 (= e!271073 tp_is_empty!12645)))

(declare-fun b!464130 () Bool)

(declare-fun res!277493 () Bool)

(assert (=> b!464130 (=> (not res!277493) (not e!271075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29081 (_ BitVec 32)) Bool)

(assert (=> b!464130 (= res!277493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464131 () Bool)

(assert (=> b!464131 (= e!271076 tp_is_empty!12645)))

(assert (= (and start!41550 res!277495) b!464126))

(assert (= (and b!464126 res!277494) b!464130))

(assert (= (and b!464130 res!277493) b!464125))

(assert (= (and b!464125 res!277496) b!464128))

(assert (= (and b!464127 condMapEmpty!20644) mapIsEmpty!20644))

(assert (= (and b!464127 (not condMapEmpty!20644)) mapNonEmpty!20644))

(get-info :version)

(assert (= (and mapNonEmpty!20644 ((_ is ValueCellFull!5979) mapValue!20644)) b!464131))

(assert (= (and b!464127 ((_ is ValueCellFull!5979) mapDefault!20644)) b!464129))

(assert (= start!41550 b!464127))

(declare-fun m!446555 () Bool)

(assert (=> b!464128 m!446555))

(declare-fun m!446557 () Bool)

(assert (=> b!464128 m!446557))

(declare-fun m!446559 () Bool)

(assert (=> b!464128 m!446559))

(declare-fun m!446561 () Bool)

(assert (=> mapNonEmpty!20644 m!446561))

(declare-fun m!446563 () Bool)

(assert (=> b!464125 m!446563))

(declare-fun m!446565 () Bool)

(assert (=> b!464130 m!446565))

(declare-fun m!446567 () Bool)

(assert (=> start!41550 m!446567))

(declare-fun m!446569 () Bool)

(assert (=> start!41550 m!446569))

(declare-fun m!446571 () Bool)

(assert (=> start!41550 m!446571))

(check-sat (not mapNonEmpty!20644) (not b!464128) (not b_next!11217) (not b!464130) (not start!41550) (not b!464125) b_and!19557 tp_is_empty!12645)
(check-sat b_and!19557 (not b_next!11217))
