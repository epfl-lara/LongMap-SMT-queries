; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42310 () Bool)

(assert start!42310)

(declare-fun b_free!11815 () Bool)

(declare-fun b_next!11815 () Bool)

(assert (=> start!42310 (= b_free!11815 (not b_next!11815))))

(declare-fun tp!41476 () Bool)

(declare-fun b_and!20271 () Bool)

(assert (=> start!42310 (= tp!41476 b_and!20271)))

(declare-fun b!472143 () Bool)

(declare-fun res!282052 () Bool)

(declare-fun e!276803 () Bool)

(assert (=> b!472143 (=> (not res!282052) (not e!276803))))

(declare-datatypes ((array!30232 0))(
  ( (array!30233 (arr!14536 (Array (_ BitVec 32) (_ BitVec 64))) (size!14888 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30232)

(declare-datatypes ((List!8765 0))(
  ( (Nil!8762) (Cons!8761 (h!9617 (_ BitVec 64)) (t!14725 List!8765)) )
))
(declare-fun arrayNoDuplicates!0 (array!30232 (_ BitVec 32) List!8765) Bool)

(assert (=> b!472143 (= res!282052 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8762))))

(declare-fun b!472144 () Bool)

(declare-fun e!276804 () Bool)

(assert (=> b!472144 (= e!276803 (not e!276804))))

(declare-fun res!282054 () Bool)

(assert (=> b!472144 (=> res!282054 e!276804)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472144 (= res!282054 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18763 0))(
  ( (V!18764 (val!6666 Int)) )
))
(declare-datatypes ((tuple2!8698 0))(
  ( (tuple2!8699 (_1!4360 (_ BitVec 64)) (_2!4360 V!18763)) )
))
(declare-datatypes ((List!8766 0))(
  ( (Nil!8763) (Cons!8762 (h!9618 tuple2!8698) (t!14726 List!8766)) )
))
(declare-datatypes ((ListLongMap!7613 0))(
  ( (ListLongMap!7614 (toList!3822 List!8766)) )
))
(declare-fun lt!214240 () ListLongMap!7613)

(declare-fun lt!214241 () ListLongMap!7613)

(assert (=> b!472144 (= lt!214240 lt!214241)))

(declare-fun minValueBefore!38 () V!18763)

(declare-fun zeroValue!794 () V!18763)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13857 0))(
  ( (Unit!13858) )
))
(declare-fun lt!214239 () Unit!13857)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6278 0))(
  ( (ValueCellFull!6278 (v!8958 V!18763)) (EmptyCell!6278) )
))
(declare-datatypes ((array!30234 0))(
  ( (array!30235 (arr!14537 (Array (_ BitVec 32) ValueCell!6278)) (size!14889 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30234)

(declare-fun minValueAfter!38 () V!18763)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!197 (array!30232 array!30234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 V!18763 V!18763 (_ BitVec 32) Int) Unit!13857)

(assert (=> b!472144 (= lt!214239 (lemmaNoChangeToArrayThenSameMapNoExtras!197 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2037 (array!30232 array!30234 (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 (_ BitVec 32) Int) ListLongMap!7613)

(assert (=> b!472144 (= lt!214241 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472144 (= lt!214240 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472145 () Bool)

(declare-fun e!276806 () Bool)

(declare-fun e!276808 () Bool)

(declare-fun mapRes!21574 () Bool)

(assert (=> b!472145 (= e!276806 (and e!276808 mapRes!21574))))

(declare-fun condMapEmpty!21574 () Bool)

(declare-fun mapDefault!21574 () ValueCell!6278)

(assert (=> b!472145 (= condMapEmpty!21574 (= (arr!14537 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6278)) mapDefault!21574)))))

(declare-fun res!282056 () Bool)

(assert (=> start!42310 (=> (not res!282056) (not e!276803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42310 (= res!282056 (validMask!0 mask!1365))))

(assert (=> start!42310 e!276803))

(declare-fun tp_is_empty!13243 () Bool)

(assert (=> start!42310 tp_is_empty!13243))

(assert (=> start!42310 tp!41476))

(assert (=> start!42310 true))

(declare-fun array_inv!10572 (array!30232) Bool)

(assert (=> start!42310 (array_inv!10572 _keys!1025)))

(declare-fun array_inv!10573 (array!30234) Bool)

(assert (=> start!42310 (and (array_inv!10573 _values!833) e!276806)))

(declare-fun b!472146 () Bool)

(assert (=> b!472146 (= e!276808 tp_is_empty!13243)))

(declare-fun b!472147 () Bool)

(declare-fun res!282055 () Bool)

(assert (=> b!472147 (=> (not res!282055) (not e!276803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30232 (_ BitVec 32)) Bool)

(assert (=> b!472147 (= res!282055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21574 () Bool)

(declare-fun tp!41475 () Bool)

(declare-fun e!276805 () Bool)

(assert (=> mapNonEmpty!21574 (= mapRes!21574 (and tp!41475 e!276805))))

(declare-fun mapKey!21574 () (_ BitVec 32))

(declare-fun mapValue!21574 () ValueCell!6278)

(declare-fun mapRest!21574 () (Array (_ BitVec 32) ValueCell!6278))

(assert (=> mapNonEmpty!21574 (= (arr!14537 _values!833) (store mapRest!21574 mapKey!21574 mapValue!21574))))

(declare-fun b!472148 () Bool)

(assert (=> b!472148 (= e!276805 tp_is_empty!13243)))

(declare-fun b!472149 () Bool)

(declare-fun res!282053 () Bool)

(assert (=> b!472149 (=> (not res!282053) (not e!276803))))

(assert (=> b!472149 (= res!282053 (and (= (size!14889 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14888 _keys!1025) (size!14889 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21574 () Bool)

(assert (=> mapIsEmpty!21574 mapRes!21574))

(declare-fun b!472150 () Bool)

(assert (=> b!472150 (= e!276804 true)))

(declare-fun lt!214242 () ListLongMap!7613)

(declare-fun getCurrentListMap!2192 (array!30232 array!30234 (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 (_ BitVec 32) Int) ListLongMap!7613)

(assert (=> b!472150 (= lt!214242 (getCurrentListMap!2192 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42310 res!282056) b!472149))

(assert (= (and b!472149 res!282053) b!472147))

(assert (= (and b!472147 res!282055) b!472143))

(assert (= (and b!472143 res!282052) b!472144))

(assert (= (and b!472144 (not res!282054)) b!472150))

(assert (= (and b!472145 condMapEmpty!21574) mapIsEmpty!21574))

(assert (= (and b!472145 (not condMapEmpty!21574)) mapNonEmpty!21574))

(get-info :version)

(assert (= (and mapNonEmpty!21574 ((_ is ValueCellFull!6278) mapValue!21574)) b!472148))

(assert (= (and b!472145 ((_ is ValueCellFull!6278) mapDefault!21574)) b!472146))

(assert (= start!42310 b!472145))

(declare-fun m!454399 () Bool)

(assert (=> b!472147 m!454399))

(declare-fun m!454401 () Bool)

(assert (=> b!472150 m!454401))

(declare-fun m!454403 () Bool)

(assert (=> start!42310 m!454403))

(declare-fun m!454405 () Bool)

(assert (=> start!42310 m!454405))

(declare-fun m!454407 () Bool)

(assert (=> start!42310 m!454407))

(declare-fun m!454409 () Bool)

(assert (=> b!472143 m!454409))

(declare-fun m!454411 () Bool)

(assert (=> mapNonEmpty!21574 m!454411))

(declare-fun m!454413 () Bool)

(assert (=> b!472144 m!454413))

(declare-fun m!454415 () Bool)

(assert (=> b!472144 m!454415))

(declare-fun m!454417 () Bool)

(assert (=> b!472144 m!454417))

(check-sat (not b_next!11815) (not mapNonEmpty!21574) tp_is_empty!13243 (not b!472150) (not b!472144) (not b!472147) b_and!20271 (not b!472143) (not start!42310))
(check-sat b_and!20271 (not b_next!11815))
