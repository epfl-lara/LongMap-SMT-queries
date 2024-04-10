; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42294 () Bool)

(assert start!42294)

(declare-fun b_free!11799 () Bool)

(declare-fun b_next!11799 () Bool)

(assert (=> start!42294 (= b_free!11799 (not b_next!11799))))

(declare-fun tp!41424 () Bool)

(declare-fun b_and!20237 () Bool)

(assert (=> start!42294 (= tp!41424 b_and!20237)))

(declare-fun res!281924 () Bool)

(declare-fun e!276657 () Bool)

(assert (=> start!42294 (=> (not res!281924) (not e!276657))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42294 (= res!281924 (validMask!0 mask!1365))))

(assert (=> start!42294 e!276657))

(declare-fun tp_is_empty!13227 () Bool)

(assert (=> start!42294 tp_is_empty!13227))

(assert (=> start!42294 tp!41424))

(assert (=> start!42294 true))

(declare-datatypes ((array!30211 0))(
  ( (array!30212 (arr!14527 (Array (_ BitVec 32) (_ BitVec 64))) (size!14879 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30211)

(declare-fun array_inv!10472 (array!30211) Bool)

(assert (=> start!42294 (array_inv!10472 _keys!1025)))

(declare-datatypes ((V!18741 0))(
  ( (V!18742 (val!6658 Int)) )
))
(declare-datatypes ((ValueCell!6270 0))(
  ( (ValueCellFull!6270 (v!8949 V!18741)) (EmptyCell!6270) )
))
(declare-datatypes ((array!30213 0))(
  ( (array!30214 (arr!14528 (Array (_ BitVec 32) ValueCell!6270)) (size!14880 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30213)

(declare-fun e!276656 () Bool)

(declare-fun array_inv!10473 (array!30213) Bool)

(assert (=> start!42294 (and (array_inv!10473 _values!833) e!276656)))

(declare-fun b!471940 () Bool)

(declare-fun res!281921 () Bool)

(assert (=> b!471940 (=> (not res!281921) (not e!276657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30211 (_ BitVec 32)) Bool)

(assert (=> b!471940 (= res!281921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21547 () Bool)

(declare-fun mapRes!21547 () Bool)

(declare-fun tp!41425 () Bool)

(declare-fun e!276659 () Bool)

(assert (=> mapNonEmpty!21547 (= mapRes!21547 (and tp!41425 e!276659))))

(declare-fun mapRest!21547 () (Array (_ BitVec 32) ValueCell!6270))

(declare-fun mapKey!21547 () (_ BitVec 32))

(declare-fun mapValue!21547 () ValueCell!6270)

(assert (=> mapNonEmpty!21547 (= (arr!14528 _values!833) (store mapRest!21547 mapKey!21547 mapValue!21547))))

(declare-fun b!471941 () Bool)

(declare-fun res!281923 () Bool)

(assert (=> b!471941 (=> (not res!281923) (not e!276657))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471941 (= res!281923 (and (= (size!14880 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14879 _keys!1025) (size!14880 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471942 () Bool)

(declare-fun res!281922 () Bool)

(assert (=> b!471942 (=> (not res!281922) (not e!276657))))

(declare-datatypes ((List!8846 0))(
  ( (Nil!8843) (Cons!8842 (h!9698 (_ BitVec 64)) (t!14812 List!8846)) )
))
(declare-fun arrayNoDuplicates!0 (array!30211 (_ BitVec 32) List!8846) Bool)

(assert (=> b!471942 (= res!281922 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8843))))

(declare-fun mapIsEmpty!21547 () Bool)

(assert (=> mapIsEmpty!21547 mapRes!21547))

(declare-fun b!471943 () Bool)

(assert (=> b!471943 (= e!276657 (not true))))

(declare-datatypes ((tuple2!8764 0))(
  ( (tuple2!8765 (_1!4393 (_ BitVec 64)) (_2!4393 V!18741)) )
))
(declare-datatypes ((List!8847 0))(
  ( (Nil!8844) (Cons!8843 (h!9699 tuple2!8764) (t!14813 List!8847)) )
))
(declare-datatypes ((ListLongMap!7677 0))(
  ( (ListLongMap!7678 (toList!3854 List!8847)) )
))
(declare-fun lt!214106 () ListLongMap!7677)

(declare-fun lt!214105 () ListLongMap!7677)

(assert (=> b!471943 (= lt!214106 lt!214105)))

(declare-datatypes ((Unit!13867 0))(
  ( (Unit!13868) )
))
(declare-fun lt!214104 () Unit!13867)

(declare-fun minValueBefore!38 () V!18741)

(declare-fun zeroValue!794 () V!18741)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18741)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!197 (array!30211 array!30213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18741 V!18741 V!18741 V!18741 (_ BitVec 32) Int) Unit!13867)

(assert (=> b!471943 (= lt!214104 (lemmaNoChangeToArrayThenSameMapNoExtras!197 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2017 (array!30211 array!30213 (_ BitVec 32) (_ BitVec 32) V!18741 V!18741 (_ BitVec 32) Int) ListLongMap!7677)

(assert (=> b!471943 (= lt!214105 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471943 (= lt!214106 (getCurrentListMapNoExtraKeys!2017 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471944 () Bool)

(declare-fun e!276660 () Bool)

(assert (=> b!471944 (= e!276660 tp_is_empty!13227)))

(declare-fun b!471945 () Bool)

(assert (=> b!471945 (= e!276656 (and e!276660 mapRes!21547))))

(declare-fun condMapEmpty!21547 () Bool)

(declare-fun mapDefault!21547 () ValueCell!6270)

(assert (=> b!471945 (= condMapEmpty!21547 (= (arr!14528 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6270)) mapDefault!21547)))))

(declare-fun b!471946 () Bool)

(assert (=> b!471946 (= e!276659 tp_is_empty!13227)))

(assert (= (and start!42294 res!281924) b!471941))

(assert (= (and b!471941 res!281923) b!471940))

(assert (= (and b!471940 res!281921) b!471942))

(assert (= (and b!471942 res!281922) b!471943))

(assert (= (and b!471945 condMapEmpty!21547) mapIsEmpty!21547))

(assert (= (and b!471945 (not condMapEmpty!21547)) mapNonEmpty!21547))

(get-info :version)

(assert (= (and mapNonEmpty!21547 ((_ is ValueCellFull!6270) mapValue!21547)) b!471946))

(assert (= (and b!471945 ((_ is ValueCellFull!6270) mapDefault!21547)) b!471944))

(assert (= start!42294 b!471945))

(declare-fun m!454001 () Bool)

(assert (=> b!471940 m!454001))

(declare-fun m!454003 () Bool)

(assert (=> b!471942 m!454003))

(declare-fun m!454005 () Bool)

(assert (=> mapNonEmpty!21547 m!454005))

(declare-fun m!454007 () Bool)

(assert (=> start!42294 m!454007))

(declare-fun m!454009 () Bool)

(assert (=> start!42294 m!454009))

(declare-fun m!454011 () Bool)

(assert (=> start!42294 m!454011))

(declare-fun m!454013 () Bool)

(assert (=> b!471943 m!454013))

(declare-fun m!454015 () Bool)

(assert (=> b!471943 m!454015))

(declare-fun m!454017 () Bool)

(assert (=> b!471943 m!454017))

(check-sat (not b!471940) (not b!471942) (not start!42294) (not mapNonEmpty!21547) (not b!471943) tp_is_empty!13227 (not b_next!11799) b_and!20237)
(check-sat b_and!20237 (not b_next!11799))
