; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41534 () Bool)

(assert start!41534)

(declare-fun b_free!11215 () Bool)

(declare-fun b_next!11215 () Bool)

(assert (=> start!41534 (= b_free!11215 (not b_next!11215))))

(declare-fun tp!39642 () Bool)

(declare-fun b_and!19565 () Bool)

(assert (=> start!41534 (= tp!39642 b_and!19565)))

(declare-fun mapNonEmpty!20641 () Bool)

(declare-fun mapRes!20641 () Bool)

(declare-fun tp!39643 () Bool)

(declare-fun e!271021 () Bool)

(assert (=> mapNonEmpty!20641 (= mapRes!20641 (and tp!39643 e!271021))))

(declare-datatypes ((V!17963 0))(
  ( (V!17964 (val!6366 Int)) )
))
(declare-datatypes ((ValueCell!5978 0))(
  ( (ValueCellFull!5978 (v!8654 V!17963)) (EmptyCell!5978) )
))
(declare-fun mapValue!20641 () ValueCell!5978)

(declare-datatypes ((array!29076 0))(
  ( (array!29077 (arr!13969 (Array (_ BitVec 32) ValueCell!5978)) (size!14321 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29076)

(declare-fun mapKey!20641 () (_ BitVec 32))

(declare-fun mapRest!20641 () (Array (_ BitVec 32) ValueCell!5978))

(assert (=> mapNonEmpty!20641 (= (arr!13969 _values!833) (store mapRest!20641 mapKey!20641 mapValue!20641))))

(declare-fun res!277475 () Bool)

(declare-fun e!271019 () Bool)

(assert (=> start!41534 (=> (not res!277475) (not e!271019))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41534 (= res!277475 (validMask!0 mask!1365))))

(assert (=> start!41534 e!271019))

(declare-fun tp_is_empty!12643 () Bool)

(assert (=> start!41534 tp_is_empty!12643))

(assert (=> start!41534 tp!39642))

(assert (=> start!41534 true))

(declare-datatypes ((array!29078 0))(
  ( (array!29079 (arr!13970 (Array (_ BitVec 32) (_ BitVec 64))) (size!14322 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29078)

(declare-fun array_inv!10172 (array!29078) Bool)

(assert (=> start!41534 (array_inv!10172 _keys!1025)))

(declare-fun e!271020 () Bool)

(declare-fun array_inv!10173 (array!29076) Bool)

(assert (=> start!41534 (and (array_inv!10173 _values!833) e!271020)))

(declare-fun b!464043 () Bool)

(declare-fun e!271023 () Bool)

(assert (=> b!464043 (= e!271023 tp_is_empty!12643)))

(declare-fun b!464044 () Bool)

(assert (=> b!464044 (= e!271021 tp_is_empty!12643)))

(declare-fun b!464045 () Bool)

(assert (=> b!464045 (= e!271019 (not true))))

(declare-datatypes ((tuple2!8282 0))(
  ( (tuple2!8283 (_1!4152 (_ BitVec 64)) (_2!4152 V!17963)) )
))
(declare-datatypes ((List!8363 0))(
  ( (Nil!8360) (Cons!8359 (h!9215 tuple2!8282) (t!14301 List!8363)) )
))
(declare-datatypes ((ListLongMap!7197 0))(
  ( (ListLongMap!7198 (toList!3614 List!8363)) )
))
(declare-fun lt!209585 () ListLongMap!7197)

(declare-fun lt!209584 () ListLongMap!7197)

(assert (=> b!464045 (= lt!209585 lt!209584)))

(declare-fun minValueBefore!38 () V!17963)

(declare-fun zeroValue!794 () V!17963)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13446 0))(
  ( (Unit!13447) )
))
(declare-fun lt!209583 () Unit!13446)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1 (array!29078 array!29076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17963 V!17963 V!17963 V!17963 (_ BitVec 32) Int) Unit!13446)

(assert (=> b!464045 (= lt!209583 (lemmaNoChangeToArrayThenSameMapNoExtras!1 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1841 (array!29078 array!29076 (_ BitVec 32) (_ BitVec 32) V!17963 V!17963 (_ BitVec 32) Int) ListLongMap!7197)

(assert (=> b!464045 (= lt!209584 (getCurrentListMapNoExtraKeys!1841 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464045 (= lt!209585 (getCurrentListMapNoExtraKeys!1841 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464046 () Bool)

(declare-fun res!277477 () Bool)

(assert (=> b!464046 (=> (not res!277477) (not e!271019))))

(declare-datatypes ((List!8364 0))(
  ( (Nil!8361) (Cons!8360 (h!9216 (_ BitVec 64)) (t!14302 List!8364)) )
))
(declare-fun arrayNoDuplicates!0 (array!29078 (_ BitVec 32) List!8364) Bool)

(assert (=> b!464046 (= res!277477 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8361))))

(declare-fun b!464047 () Bool)

(declare-fun res!277476 () Bool)

(assert (=> b!464047 (=> (not res!277476) (not e!271019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29078 (_ BitVec 32)) Bool)

(assert (=> b!464047 (= res!277476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464048 () Bool)

(assert (=> b!464048 (= e!271020 (and e!271023 mapRes!20641))))

(declare-fun condMapEmpty!20641 () Bool)

(declare-fun mapDefault!20641 () ValueCell!5978)

(assert (=> b!464048 (= condMapEmpty!20641 (= (arr!13969 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5978)) mapDefault!20641)))))

(declare-fun mapIsEmpty!20641 () Bool)

(assert (=> mapIsEmpty!20641 mapRes!20641))

(declare-fun b!464049 () Bool)

(declare-fun res!277474 () Bool)

(assert (=> b!464049 (=> (not res!277474) (not e!271019))))

(assert (=> b!464049 (= res!277474 (and (= (size!14321 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14322 _keys!1025) (size!14321 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41534 res!277475) b!464049))

(assert (= (and b!464049 res!277474) b!464047))

(assert (= (and b!464047 res!277476) b!464046))

(assert (= (and b!464046 res!277477) b!464045))

(assert (= (and b!464048 condMapEmpty!20641) mapIsEmpty!20641))

(assert (= (and b!464048 (not condMapEmpty!20641)) mapNonEmpty!20641))

(get-info :version)

(assert (= (and mapNonEmpty!20641 ((_ is ValueCellFull!5978) mapValue!20641)) b!464044))

(assert (= (and b!464048 ((_ is ValueCellFull!5978) mapDefault!20641)) b!464043))

(assert (= start!41534 b!464048))

(declare-fun m!446719 () Bool)

(assert (=> mapNonEmpty!20641 m!446719))

(declare-fun m!446721 () Bool)

(assert (=> b!464047 m!446721))

(declare-fun m!446723 () Bool)

(assert (=> start!41534 m!446723))

(declare-fun m!446725 () Bool)

(assert (=> start!41534 m!446725))

(declare-fun m!446727 () Bool)

(assert (=> start!41534 m!446727))

(declare-fun m!446729 () Bool)

(assert (=> b!464046 m!446729))

(declare-fun m!446731 () Bool)

(assert (=> b!464045 m!446731))

(declare-fun m!446733 () Bool)

(assert (=> b!464045 m!446733))

(declare-fun m!446735 () Bool)

(assert (=> b!464045 m!446735))

(check-sat (not mapNonEmpty!20641) tp_is_empty!12643 (not b_next!11215) (not b!464046) (not start!41534) (not b!464045) (not b!464047) b_and!19565)
(check-sat b_and!19565 (not b_next!11215))
