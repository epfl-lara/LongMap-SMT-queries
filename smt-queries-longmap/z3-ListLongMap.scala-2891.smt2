; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41490 () Bool)

(assert start!41490)

(declare-fun b_free!11157 () Bool)

(declare-fun b_next!11157 () Bool)

(assert (=> start!41490 (= b_free!11157 (not b_next!11157))))

(declare-fun tp!39468 () Bool)

(declare-fun b_and!19497 () Bool)

(assert (=> start!41490 (= tp!39468 b_and!19497)))

(declare-fun mapNonEmpty!20554 () Bool)

(declare-fun mapRes!20554 () Bool)

(declare-fun tp!39469 () Bool)

(declare-fun e!270623 () Bool)

(assert (=> mapNonEmpty!20554 (= mapRes!20554 (and tp!39469 e!270623))))

(declare-datatypes ((V!17885 0))(
  ( (V!17886 (val!6337 Int)) )
))
(declare-datatypes ((ValueCell!5949 0))(
  ( (ValueCellFull!5949 (v!8624 V!17885)) (EmptyCell!5949) )
))
(declare-datatypes ((array!28965 0))(
  ( (array!28966 (arr!13914 (Array (_ BitVec 32) ValueCell!5949)) (size!14266 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28965)

(declare-fun mapValue!20554 () ValueCell!5949)

(declare-fun mapKey!20554 () (_ BitVec 32))

(declare-fun mapRest!20554 () (Array (_ BitVec 32) ValueCell!5949))

(assert (=> mapNonEmpty!20554 (= (arr!13914 _values!833) (store mapRest!20554 mapKey!20554 mapValue!20554))))

(declare-fun b!463495 () Bool)

(declare-fun res!277134 () Bool)

(declare-fun e!270625 () Bool)

(assert (=> b!463495 (=> (not res!277134) (not e!270625))))

(declare-datatypes ((array!28967 0))(
  ( (array!28968 (arr!13915 (Array (_ BitVec 32) (_ BitVec 64))) (size!14267 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28967)

(declare-datatypes ((List!8394 0))(
  ( (Nil!8391) (Cons!8390 (h!9246 (_ BitVec 64)) (t!14340 List!8394)) )
))
(declare-fun arrayNoDuplicates!0 (array!28967 (_ BitVec 32) List!8394) Bool)

(assert (=> b!463495 (= res!277134 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8391))))

(declare-fun b!463496 () Bool)

(declare-fun res!277135 () Bool)

(assert (=> b!463496 (=> (not res!277135) (not e!270625))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463496 (= res!277135 (and (= (size!14266 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14267 _keys!1025) (size!14266 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463497 () Bool)

(declare-fun e!270624 () Bool)

(declare-fun e!270626 () Bool)

(assert (=> b!463497 (= e!270624 (and e!270626 mapRes!20554))))

(declare-fun condMapEmpty!20554 () Bool)

(declare-fun mapDefault!20554 () ValueCell!5949)

(assert (=> b!463497 (= condMapEmpty!20554 (= (arr!13914 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5949)) mapDefault!20554)))))

(declare-fun b!463498 () Bool)

(declare-fun tp_is_empty!12585 () Bool)

(assert (=> b!463498 (= e!270626 tp_is_empty!12585)))

(declare-fun res!277133 () Bool)

(assert (=> start!41490 (=> (not res!277133) (not e!270625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41490 (= res!277133 (validMask!0 mask!1365))))

(assert (=> start!41490 e!270625))

(assert (=> start!41490 tp_is_empty!12585))

(assert (=> start!41490 tp!39468))

(assert (=> start!41490 true))

(declare-fun array_inv!10058 (array!28967) Bool)

(assert (=> start!41490 (array_inv!10058 _keys!1025)))

(declare-fun array_inv!10059 (array!28965) Bool)

(assert (=> start!41490 (and (array_inv!10059 _values!833) e!270624)))

(declare-fun b!463499 () Bool)

(assert (=> b!463499 (= e!270625 false)))

(declare-datatypes ((tuple2!8300 0))(
  ( (tuple2!8301 (_1!4161 (_ BitVec 64)) (_2!4161 V!17885)) )
))
(declare-datatypes ((List!8395 0))(
  ( (Nil!8392) (Cons!8391 (h!9247 tuple2!8300) (t!14341 List!8395)) )
))
(declare-datatypes ((ListLongMap!7213 0))(
  ( (ListLongMap!7214 (toList!3622 List!8395)) )
))
(declare-fun lt!209396 () ListLongMap!7213)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!17885)

(declare-fun minValueAfter!38 () V!17885)

(declare-fun getCurrentListMapNoExtraKeys!1802 (array!28967 array!28965 (_ BitVec 32) (_ BitVec 32) V!17885 V!17885 (_ BitVec 32) Int) ListLongMap!7213)

(assert (=> b!463499 (= lt!209396 (getCurrentListMapNoExtraKeys!1802 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17885)

(declare-fun lt!209395 () ListLongMap!7213)

(assert (=> b!463499 (= lt!209395 (getCurrentListMapNoExtraKeys!1802 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20554 () Bool)

(assert (=> mapIsEmpty!20554 mapRes!20554))

(declare-fun b!463500 () Bool)

(declare-fun res!277136 () Bool)

(assert (=> b!463500 (=> (not res!277136) (not e!270625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28967 (_ BitVec 32)) Bool)

(assert (=> b!463500 (= res!277136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463501 () Bool)

(assert (=> b!463501 (= e!270623 tp_is_empty!12585)))

(assert (= (and start!41490 res!277133) b!463496))

(assert (= (and b!463496 res!277135) b!463500))

(assert (= (and b!463500 res!277136) b!463495))

(assert (= (and b!463495 res!277134) b!463499))

(assert (= (and b!463497 condMapEmpty!20554) mapIsEmpty!20554))

(assert (= (and b!463497 (not condMapEmpty!20554)) mapNonEmpty!20554))

(get-info :version)

(assert (= (and mapNonEmpty!20554 ((_ is ValueCellFull!5949) mapValue!20554)) b!463501))

(assert (= (and b!463497 ((_ is ValueCellFull!5949) mapDefault!20554)) b!463498))

(assert (= start!41490 b!463497))

(declare-fun m!446073 () Bool)

(assert (=> b!463495 m!446073))

(declare-fun m!446075 () Bool)

(assert (=> mapNonEmpty!20554 m!446075))

(declare-fun m!446077 () Bool)

(assert (=> b!463499 m!446077))

(declare-fun m!446079 () Bool)

(assert (=> b!463499 m!446079))

(declare-fun m!446081 () Bool)

(assert (=> b!463500 m!446081))

(declare-fun m!446083 () Bool)

(assert (=> start!41490 m!446083))

(declare-fun m!446085 () Bool)

(assert (=> start!41490 m!446085))

(declare-fun m!446087 () Bool)

(assert (=> start!41490 m!446087))

(check-sat (not b!463499) b_and!19497 (not mapNonEmpty!20554) (not b!463500) (not b!463495) (not b_next!11157) tp_is_empty!12585 (not start!41490))
(check-sat b_and!19497 (not b_next!11157))
