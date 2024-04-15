; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41912 () Bool)

(assert start!41912)

(declare-fun b_free!11515 () Bool)

(declare-fun b_next!11515 () Bool)

(assert (=> start!41912 (= b_free!11515 (not b_next!11515))))

(declare-fun tp!40557 () Bool)

(declare-fun b_and!19877 () Bool)

(assert (=> start!41912 (= tp!40557 b_and!19877)))

(declare-fun mapNonEmpty!21106 () Bool)

(declare-fun mapRes!21106 () Bool)

(declare-fun tp!40558 () Bool)

(declare-fun e!273729 () Bool)

(assert (=> mapNonEmpty!21106 (= mapRes!21106 (and tp!40558 e!273729))))

(declare-datatypes ((V!18363 0))(
  ( (V!18364 (val!6516 Int)) )
))
(declare-datatypes ((ValueCell!6128 0))(
  ( (ValueCellFull!6128 (v!8799 V!18363)) (EmptyCell!6128) )
))
(declare-fun mapValue!21106 () ValueCell!6128)

(declare-fun mapKey!21106 () (_ BitVec 32))

(declare-fun mapRest!21106 () (Array (_ BitVec 32) ValueCell!6128))

(declare-datatypes ((array!29647 0))(
  ( (array!29648 (arr!14250 (Array (_ BitVec 32) ValueCell!6128)) (size!14603 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29647)

(assert (=> mapNonEmpty!21106 (= (arr!14250 _values!833) (store mapRest!21106 mapKey!21106 mapValue!21106))))

(declare-fun b!467815 () Bool)

(declare-fun res!279619 () Bool)

(declare-fun e!273733 () Bool)

(assert (=> b!467815 (=> (not res!279619) (not e!273733))))

(declare-datatypes ((array!29649 0))(
  ( (array!29650 (arr!14251 (Array (_ BitVec 32) (_ BitVec 64))) (size!14604 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29649)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29649 (_ BitVec 32)) Bool)

(assert (=> b!467815 (= res!279619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467816 () Bool)

(declare-fun res!279621 () Bool)

(assert (=> b!467816 (=> (not res!279621) (not e!273733))))

(declare-datatypes ((List!8671 0))(
  ( (Nil!8668) (Cons!8667 (h!9523 (_ BitVec 64)) (t!14618 List!8671)) )
))
(declare-fun arrayNoDuplicates!0 (array!29649 (_ BitVec 32) List!8671) Bool)

(assert (=> b!467816 (= res!279621 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8668))))

(declare-fun b!467817 () Bool)

(declare-fun res!279620 () Bool)

(assert (=> b!467817 (=> (not res!279620) (not e!273733))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467817 (= res!279620 (and (= (size!14603 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14604 _keys!1025) (size!14603 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467818 () Bool)

(declare-fun e!273730 () Bool)

(declare-fun e!273731 () Bool)

(assert (=> b!467818 (= e!273730 (and e!273731 mapRes!21106))))

(declare-fun condMapEmpty!21106 () Bool)

(declare-fun mapDefault!21106 () ValueCell!6128)

(assert (=> b!467818 (= condMapEmpty!21106 (= (arr!14250 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6128)) mapDefault!21106)))))

(declare-fun b!467819 () Bool)

(declare-fun tp_is_empty!12943 () Bool)

(assert (=> b!467819 (= e!273729 tp_is_empty!12943)))

(declare-fun b!467820 () Bool)

(declare-fun e!273732 () Bool)

(assert (=> b!467820 (= e!273733 (not e!273732))))

(declare-fun res!279618 () Bool)

(assert (=> b!467820 (=> res!279618 e!273732)))

(assert (=> b!467820 (= res!279618 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8596 0))(
  ( (tuple2!8597 (_1!4309 (_ BitVec 64)) (_2!4309 V!18363)) )
))
(declare-datatypes ((List!8672 0))(
  ( (Nil!8669) (Cons!8668 (h!9524 tuple2!8596) (t!14619 List!8672)) )
))
(declare-datatypes ((ListLongMap!7499 0))(
  ( (ListLongMap!7500 (toList!3765 List!8672)) )
))
(declare-fun lt!211425 () ListLongMap!7499)

(declare-fun lt!211423 () ListLongMap!7499)

(assert (=> b!467820 (= lt!211425 lt!211423)))

(declare-datatypes ((Unit!13632 0))(
  ( (Unit!13633) )
))
(declare-fun lt!211424 () Unit!13632)

(declare-fun minValueBefore!38 () V!18363)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18363)

(declare-fun minValueAfter!38 () V!18363)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!105 (array!29649 array!29647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 V!18363 V!18363 (_ BitVec 32) Int) Unit!13632)

(assert (=> b!467820 (= lt!211424 (lemmaNoChangeToArrayThenSameMapNoExtras!105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1948 (array!29649 array!29647 (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 (_ BitVec 32) Int) ListLongMap!7499)

(assert (=> b!467820 (= lt!211423 (getCurrentListMapNoExtraKeys!1948 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467820 (= lt!211425 (getCurrentListMapNoExtraKeys!1948 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279622 () Bool)

(assert (=> start!41912 (=> (not res!279622) (not e!273733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41912 (= res!279622 (validMask!0 mask!1365))))

(assert (=> start!41912 e!273733))

(assert (=> start!41912 tp_is_empty!12943))

(assert (=> start!41912 tp!40557))

(assert (=> start!41912 true))

(declare-fun array_inv!10366 (array!29649) Bool)

(assert (=> start!41912 (array_inv!10366 _keys!1025)))

(declare-fun array_inv!10367 (array!29647) Bool)

(assert (=> start!41912 (and (array_inv!10367 _values!833) e!273730)))

(declare-fun mapIsEmpty!21106 () Bool)

(assert (=> mapIsEmpty!21106 mapRes!21106))

(declare-fun b!467821 () Bool)

(assert (=> b!467821 (= e!273731 tp_is_empty!12943)))

(declare-fun b!467822 () Bool)

(assert (=> b!467822 (= e!273732 true)))

(declare-fun lt!211422 () ListLongMap!7499)

(declare-fun getCurrentListMap!2135 (array!29649 array!29647 (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 (_ BitVec 32) Int) ListLongMap!7499)

(assert (=> b!467822 (= lt!211422 (getCurrentListMap!2135 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41912 res!279622) b!467817))

(assert (= (and b!467817 res!279620) b!467815))

(assert (= (and b!467815 res!279619) b!467816))

(assert (= (and b!467816 res!279621) b!467820))

(assert (= (and b!467820 (not res!279618)) b!467822))

(assert (= (and b!467818 condMapEmpty!21106) mapIsEmpty!21106))

(assert (= (and b!467818 (not condMapEmpty!21106)) mapNonEmpty!21106))

(get-info :version)

(assert (= (and mapNonEmpty!21106 ((_ is ValueCellFull!6128) mapValue!21106)) b!467819))

(assert (= (and b!467818 ((_ is ValueCellFull!6128) mapDefault!21106)) b!467821))

(assert (= start!41912 b!467818))

(declare-fun m!449395 () Bool)

(assert (=> mapNonEmpty!21106 m!449395))

(declare-fun m!449397 () Bool)

(assert (=> b!467816 m!449397))

(declare-fun m!449399 () Bool)

(assert (=> b!467822 m!449399))

(declare-fun m!449401 () Bool)

(assert (=> b!467820 m!449401))

(declare-fun m!449403 () Bool)

(assert (=> b!467820 m!449403))

(declare-fun m!449405 () Bool)

(assert (=> b!467820 m!449405))

(declare-fun m!449407 () Bool)

(assert (=> b!467815 m!449407))

(declare-fun m!449409 () Bool)

(assert (=> start!41912 m!449409))

(declare-fun m!449411 () Bool)

(assert (=> start!41912 m!449411))

(declare-fun m!449413 () Bool)

(assert (=> start!41912 m!449413))

(check-sat (not b!467820) (not start!41912) (not b!467822) tp_is_empty!12943 (not b!467815) (not b_next!11515) (not b!467816) b_and!19877 (not mapNonEmpty!21106))
(check-sat b_and!19877 (not b_next!11515))
