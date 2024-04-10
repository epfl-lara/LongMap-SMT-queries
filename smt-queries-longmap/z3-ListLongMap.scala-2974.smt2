; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42122 () Bool)

(assert start!42122)

(declare-fun b_free!11655 () Bool)

(declare-fun b_next!11655 () Bool)

(assert (=> start!42122 (= b_free!11655 (not b_next!11655))))

(declare-fun tp!40986 () Bool)

(declare-fun b_and!20077 () Bool)

(assert (=> start!42122 (= tp!40986 b_and!20077)))

(declare-fun mapNonEmpty!21325 () Bool)

(declare-fun mapRes!21325 () Bool)

(declare-fun tp!40987 () Bool)

(declare-fun e!275468 () Bool)

(assert (=> mapNonEmpty!21325 (= mapRes!21325 (and tp!40987 e!275468))))

(declare-fun mapKey!21325 () (_ BitVec 32))

(declare-datatypes ((V!18549 0))(
  ( (V!18550 (val!6586 Int)) )
))
(declare-datatypes ((ValueCell!6198 0))(
  ( (ValueCellFull!6198 (v!8877 V!18549)) (EmptyCell!6198) )
))
(declare-fun mapRest!21325 () (Array (_ BitVec 32) ValueCell!6198))

(declare-fun mapValue!21325 () ValueCell!6198)

(declare-datatypes ((array!29937 0))(
  ( (array!29938 (arr!14392 (Array (_ BitVec 32) ValueCell!6198)) (size!14744 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29937)

(assert (=> mapNonEmpty!21325 (= (arr!14392 _values!833) (store mapRest!21325 mapKey!21325 mapValue!21325))))

(declare-fun b!470258 () Bool)

(declare-fun res!280998 () Bool)

(declare-fun e!275467 () Bool)

(assert (=> b!470258 (=> (not res!280998) (not e!275467))))

(declare-datatypes ((array!29939 0))(
  ( (array!29940 (arr!14393 (Array (_ BitVec 32) (_ BitVec 64))) (size!14745 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29939)

(declare-datatypes ((List!8751 0))(
  ( (Nil!8748) (Cons!8747 (h!9603 (_ BitVec 64)) (t!14713 List!8751)) )
))
(declare-fun arrayNoDuplicates!0 (array!29939 (_ BitVec 32) List!8751) Bool)

(assert (=> b!470258 (= res!280998 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8748))))

(declare-fun b!470259 () Bool)

(declare-fun res!280997 () Bool)

(assert (=> b!470259 (=> (not res!280997) (not e!275467))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470259 (= res!280997 (and (= (size!14744 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14745 _keys!1025) (size!14744 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470260 () Bool)

(declare-fun tp_is_empty!13083 () Bool)

(assert (=> b!470260 (= e!275468 tp_is_empty!13083)))

(declare-fun b!470261 () Bool)

(declare-fun res!280995 () Bool)

(assert (=> b!470261 (=> (not res!280995) (not e!275467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29939 (_ BitVec 32)) Bool)

(assert (=> b!470261 (= res!280995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470262 () Bool)

(declare-fun e!275469 () Bool)

(assert (=> b!470262 (= e!275469 tp_is_empty!13083)))

(declare-fun res!280996 () Bool)

(assert (=> start!42122 (=> (not res!280996) (not e!275467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42122 (= res!280996 (validMask!0 mask!1365))))

(assert (=> start!42122 e!275467))

(assert (=> start!42122 tp_is_empty!13083))

(assert (=> start!42122 tp!40986))

(assert (=> start!42122 true))

(declare-fun array_inv!10382 (array!29939) Bool)

(assert (=> start!42122 (array_inv!10382 _keys!1025)))

(declare-fun e!275470 () Bool)

(declare-fun array_inv!10383 (array!29937) Bool)

(assert (=> start!42122 (and (array_inv!10383 _values!833) e!275470)))

(declare-fun b!470263 () Bool)

(assert (=> b!470263 (= e!275470 (and e!275469 mapRes!21325))))

(declare-fun condMapEmpty!21325 () Bool)

(declare-fun mapDefault!21325 () ValueCell!6198)

(assert (=> b!470263 (= condMapEmpty!21325 (= (arr!14392 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6198)) mapDefault!21325)))))

(declare-fun b!470264 () Bool)

(assert (=> b!470264 (= e!275467 (not true))))

(declare-datatypes ((tuple2!8672 0))(
  ( (tuple2!8673 (_1!4347 (_ BitVec 64)) (_2!4347 V!18549)) )
))
(declare-datatypes ((List!8752 0))(
  ( (Nil!8749) (Cons!8748 (h!9604 tuple2!8672) (t!14714 List!8752)) )
))
(declare-datatypes ((ListLongMap!7585 0))(
  ( (ListLongMap!7586 (toList!3808 List!8752)) )
))
(declare-fun lt!213376 () ListLongMap!7585)

(declare-fun lt!213377 () ListLongMap!7585)

(assert (=> b!470264 (= lt!213376 lt!213377)))

(declare-fun minValueBefore!38 () V!18549)

(declare-fun zeroValue!794 () V!18549)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13775 0))(
  ( (Unit!13776) )
))
(declare-fun lt!213378 () Unit!13775)

(declare-fun minValueAfter!38 () V!18549)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!151 (array!29939 array!29937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18549 V!18549 V!18549 V!18549 (_ BitVec 32) Int) Unit!13775)

(assert (=> b!470264 (= lt!213378 (lemmaNoChangeToArrayThenSameMapNoExtras!151 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1971 (array!29939 array!29937 (_ BitVec 32) (_ BitVec 32) V!18549 V!18549 (_ BitVec 32) Int) ListLongMap!7585)

(assert (=> b!470264 (= lt!213377 (getCurrentListMapNoExtraKeys!1971 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470264 (= lt!213376 (getCurrentListMapNoExtraKeys!1971 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21325 () Bool)

(assert (=> mapIsEmpty!21325 mapRes!21325))

(assert (= (and start!42122 res!280996) b!470259))

(assert (= (and b!470259 res!280997) b!470261))

(assert (= (and b!470261 res!280995) b!470258))

(assert (= (and b!470258 res!280998) b!470264))

(assert (= (and b!470263 condMapEmpty!21325) mapIsEmpty!21325))

(assert (= (and b!470263 (not condMapEmpty!21325)) mapNonEmpty!21325))

(get-info :version)

(assert (= (and mapNonEmpty!21325 ((_ is ValueCellFull!6198) mapValue!21325)) b!470260))

(assert (= (and b!470263 ((_ is ValueCellFull!6198) mapDefault!21325)) b!470262))

(assert (= start!42122 b!470263))

(declare-fun m!452573 () Bool)

(assert (=> b!470264 m!452573))

(declare-fun m!452575 () Bool)

(assert (=> b!470264 m!452575))

(declare-fun m!452577 () Bool)

(assert (=> b!470264 m!452577))

(declare-fun m!452579 () Bool)

(assert (=> b!470261 m!452579))

(declare-fun m!452581 () Bool)

(assert (=> b!470258 m!452581))

(declare-fun m!452583 () Bool)

(assert (=> mapNonEmpty!21325 m!452583))

(declare-fun m!452585 () Bool)

(assert (=> start!42122 m!452585))

(declare-fun m!452587 () Bool)

(assert (=> start!42122 m!452587))

(declare-fun m!452589 () Bool)

(assert (=> start!42122 m!452589))

(check-sat (not b_next!11655) b_and!20077 (not b!470261) (not b!470264) tp_is_empty!13083 (not b!470258) (not mapNonEmpty!21325) (not start!42122))
(check-sat b_and!20077 (not b_next!11655))
