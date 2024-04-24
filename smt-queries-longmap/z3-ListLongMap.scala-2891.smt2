; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41474 () Bool)

(assert start!41474)

(declare-fun b_free!11155 () Bool)

(declare-fun b_next!11155 () Bool)

(assert (=> start!41474 (= b_free!11155 (not b_next!11155))))

(declare-fun tp!39463 () Bool)

(declare-fun b_and!19505 () Bool)

(assert (=> start!41474 (= tp!39463 b_and!19505)))

(declare-fun mapIsEmpty!20551 () Bool)

(declare-fun mapRes!20551 () Bool)

(assert (=> mapIsEmpty!20551 mapRes!20551))

(declare-fun b!463413 () Bool)

(declare-fun res!277114 () Bool)

(declare-fun e!270571 () Bool)

(assert (=> b!463413 (=> (not res!277114) (not e!270571))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28962 0))(
  ( (array!28963 (arr!13912 (Array (_ BitVec 32) (_ BitVec 64))) (size!14264 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28962)

(declare-datatypes ((V!17883 0))(
  ( (V!17884 (val!6336 Int)) )
))
(declare-datatypes ((ValueCell!5948 0))(
  ( (ValueCellFull!5948 (v!8624 V!17883)) (EmptyCell!5948) )
))
(declare-datatypes ((array!28964 0))(
  ( (array!28965 (arr!13913 (Array (_ BitVec 32) ValueCell!5948)) (size!14265 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28964)

(assert (=> b!463413 (= res!277114 (and (= (size!14265 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14264 _keys!1025) (size!14265 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20551 () Bool)

(declare-fun tp!39462 () Bool)

(declare-fun e!270569 () Bool)

(assert (=> mapNonEmpty!20551 (= mapRes!20551 (and tp!39462 e!270569))))

(declare-fun mapRest!20551 () (Array (_ BitVec 32) ValueCell!5948))

(declare-fun mapValue!20551 () ValueCell!5948)

(declare-fun mapKey!20551 () (_ BitVec 32))

(assert (=> mapNonEmpty!20551 (= (arr!13913 _values!833) (store mapRest!20551 mapKey!20551 mapValue!20551))))

(declare-fun b!463414 () Bool)

(declare-fun res!277117 () Bool)

(assert (=> b!463414 (=> (not res!277117) (not e!270571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28962 (_ BitVec 32)) Bool)

(assert (=> b!463414 (= res!277117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277116 () Bool)

(assert (=> start!41474 (=> (not res!277116) (not e!270571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41474 (= res!277116 (validMask!0 mask!1365))))

(assert (=> start!41474 e!270571))

(declare-fun tp_is_empty!12583 () Bool)

(assert (=> start!41474 tp_is_empty!12583))

(assert (=> start!41474 tp!39463))

(assert (=> start!41474 true))

(declare-fun array_inv!10140 (array!28962) Bool)

(assert (=> start!41474 (array_inv!10140 _keys!1025)))

(declare-fun e!270573 () Bool)

(declare-fun array_inv!10141 (array!28964) Bool)

(assert (=> start!41474 (and (array_inv!10141 _values!833) e!270573)))

(declare-fun b!463415 () Bool)

(declare-fun e!270572 () Bool)

(assert (=> b!463415 (= e!270573 (and e!270572 mapRes!20551))))

(declare-fun condMapEmpty!20551 () Bool)

(declare-fun mapDefault!20551 () ValueCell!5948)

(assert (=> b!463415 (= condMapEmpty!20551 (= (arr!13913 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5948)) mapDefault!20551)))))

(declare-fun b!463416 () Bool)

(declare-fun res!277115 () Bool)

(assert (=> b!463416 (=> (not res!277115) (not e!270571))))

(declare-datatypes ((List!8321 0))(
  ( (Nil!8318) (Cons!8317 (h!9173 (_ BitVec 64)) (t!14259 List!8321)) )
))
(declare-fun arrayNoDuplicates!0 (array!28962 (_ BitVec 32) List!8321) Bool)

(assert (=> b!463416 (= res!277115 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8318))))

(declare-fun b!463417 () Bool)

(assert (=> b!463417 (= e!270569 tp_is_empty!12583)))

(declare-fun b!463418 () Bool)

(assert (=> b!463418 (= e!270572 tp_is_empty!12583)))

(declare-fun b!463419 () Bool)

(assert (=> b!463419 (= e!270571 false)))

(declare-datatypes ((tuple2!8240 0))(
  ( (tuple2!8241 (_1!4131 (_ BitVec 64)) (_2!4131 V!17883)) )
))
(declare-datatypes ((List!8322 0))(
  ( (Nil!8319) (Cons!8318 (h!9174 tuple2!8240) (t!14260 List!8322)) )
))
(declare-datatypes ((ListLongMap!7155 0))(
  ( (ListLongMap!7156 (toList!3593 List!8322)) )
))
(declare-fun lt!209402 () ListLongMap!7155)

(declare-fun zeroValue!794 () V!17883)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17883)

(declare-fun getCurrentListMapNoExtraKeys!1820 (array!28962 array!28964 (_ BitVec 32) (_ BitVec 32) V!17883 V!17883 (_ BitVec 32) Int) ListLongMap!7155)

(assert (=> b!463419 (= lt!209402 (getCurrentListMapNoExtraKeys!1820 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17883)

(declare-fun lt!209401 () ListLongMap!7155)

(assert (=> b!463419 (= lt!209401 (getCurrentListMapNoExtraKeys!1820 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41474 res!277116) b!463413))

(assert (= (and b!463413 res!277114) b!463414))

(assert (= (and b!463414 res!277117) b!463416))

(assert (= (and b!463416 res!277115) b!463419))

(assert (= (and b!463415 condMapEmpty!20551) mapIsEmpty!20551))

(assert (= (and b!463415 (not condMapEmpty!20551)) mapNonEmpty!20551))

(get-info :version)

(assert (= (and mapNonEmpty!20551 ((_ is ValueCellFull!5948) mapValue!20551)) b!463417))

(assert (= (and b!463415 ((_ is ValueCellFull!5948) mapDefault!20551)) b!463418))

(assert (= start!41474 b!463415))

(declare-fun m!446239 () Bool)

(assert (=> b!463414 m!446239))

(declare-fun m!446241 () Bool)

(assert (=> mapNonEmpty!20551 m!446241))

(declare-fun m!446243 () Bool)

(assert (=> start!41474 m!446243))

(declare-fun m!446245 () Bool)

(assert (=> start!41474 m!446245))

(declare-fun m!446247 () Bool)

(assert (=> start!41474 m!446247))

(declare-fun m!446249 () Bool)

(assert (=> b!463419 m!446249))

(declare-fun m!446251 () Bool)

(assert (=> b!463419 m!446251))

(declare-fun m!446253 () Bool)

(assert (=> b!463416 m!446253))

(check-sat (not b!463416) tp_is_empty!12583 (not mapNonEmpty!20551) (not b!463419) (not start!41474) (not b_next!11155) b_and!19505 (not b!463414))
(check-sat b_and!19505 (not b_next!11155))
