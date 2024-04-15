; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42068 () Bool)

(assert start!42068)

(declare-fun b_free!11635 () Bool)

(declare-fun b_next!11635 () Bool)

(assert (=> start!42068 (= b_free!11635 (not b_next!11635))))

(declare-fun tp!40924 () Bool)

(declare-fun b_and!20019 () Bool)

(assert (=> start!42068 (= tp!40924 b_and!20019)))

(declare-fun b!469582 () Bool)

(declare-fun e!275015 () Bool)

(declare-fun tp_is_empty!13063 () Bool)

(assert (=> b!469582 (= e!275015 tp_is_empty!13063)))

(declare-fun b!469583 () Bool)

(declare-fun e!275017 () Bool)

(assert (=> b!469583 (= e!275017 true)))

(declare-datatypes ((V!18523 0))(
  ( (V!18524 (val!6576 Int)) )
))
(declare-datatypes ((tuple2!8696 0))(
  ( (tuple2!8697 (_1!4359 (_ BitVec 64)) (_2!4359 V!18523)) )
))
(declare-datatypes ((List!8767 0))(
  ( (Nil!8764) (Cons!8763 (h!9619 tuple2!8696) (t!14718 List!8767)) )
))
(declare-datatypes ((ListLongMap!7599 0))(
  ( (ListLongMap!7600 (toList!3815 List!8767)) )
))
(declare-fun lt!212843 () ListLongMap!7599)

(declare-fun lt!212838 () tuple2!8696)

(declare-fun minValueBefore!38 () V!18523)

(declare-fun +!1740 (ListLongMap!7599 tuple2!8696) ListLongMap!7599)

(assert (=> b!469583 (= (+!1740 lt!212843 lt!212838) (+!1740 (+!1740 lt!212843 (tuple2!8697 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212838))))

(declare-fun minValueAfter!38 () V!18523)

(assert (=> b!469583 (= lt!212838 (tuple2!8697 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13729 0))(
  ( (Unit!13730) )
))
(declare-fun lt!212840 () Unit!13729)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!123 (ListLongMap!7599 (_ BitVec 64) V!18523 V!18523) Unit!13729)

(assert (=> b!469583 (= lt!212840 (addSameAsAddTwiceSameKeyDiffValues!123 lt!212843 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18523)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29879 0))(
  ( (array!29880 (arr!14364 (Array (_ BitVec 32) (_ BitVec 64))) (size!14717 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29879)

(declare-datatypes ((ValueCell!6188 0))(
  ( (ValueCellFull!6188 (v!8860 V!18523)) (EmptyCell!6188) )
))
(declare-datatypes ((array!29881 0))(
  ( (array!29882 (arr!14365 (Array (_ BitVec 32) ValueCell!6188)) (size!14718 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29881)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lt!212842 () ListLongMap!7599)

(declare-fun getCurrentListMap!2176 (array!29879 array!29881 (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 (_ BitVec 32) Int) ListLongMap!7599)

(assert (=> b!469583 (= lt!212842 (getCurrentListMap!2176 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212841 () ListLongMap!7599)

(assert (=> b!469583 (= lt!212841 (getCurrentListMap!2176 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469584 () Bool)

(declare-fun res!280654 () Bool)

(declare-fun e!275014 () Bool)

(assert (=> b!469584 (=> (not res!280654) (not e!275014))))

(assert (=> b!469584 (= res!280654 (and (= (size!14718 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14717 _keys!1025) (size!14718 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21292 () Bool)

(declare-fun mapRes!21292 () Bool)

(assert (=> mapIsEmpty!21292 mapRes!21292))

(declare-fun res!280656 () Bool)

(assert (=> start!42068 (=> (not res!280656) (not e!275014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42068 (= res!280656 (validMask!0 mask!1365))))

(assert (=> start!42068 e!275014))

(assert (=> start!42068 tp_is_empty!13063))

(assert (=> start!42068 tp!40924))

(assert (=> start!42068 true))

(declare-fun array_inv!10448 (array!29879) Bool)

(assert (=> start!42068 (array_inv!10448 _keys!1025)))

(declare-fun e!275016 () Bool)

(declare-fun array_inv!10449 (array!29881) Bool)

(assert (=> start!42068 (and (array_inv!10449 _values!833) e!275016)))

(declare-fun b!469585 () Bool)

(declare-fun e!275018 () Bool)

(assert (=> b!469585 (= e!275018 tp_is_empty!13063)))

(declare-fun mapNonEmpty!21292 () Bool)

(declare-fun tp!40923 () Bool)

(assert (=> mapNonEmpty!21292 (= mapRes!21292 (and tp!40923 e!275018))))

(declare-fun mapValue!21292 () ValueCell!6188)

(declare-fun mapKey!21292 () (_ BitVec 32))

(declare-fun mapRest!21292 () (Array (_ BitVec 32) ValueCell!6188))

(assert (=> mapNonEmpty!21292 (= (arr!14365 _values!833) (store mapRest!21292 mapKey!21292 mapValue!21292))))

(declare-fun b!469586 () Bool)

(assert (=> b!469586 (= e!275014 (not e!275017))))

(declare-fun res!280653 () Bool)

(assert (=> b!469586 (=> res!280653 e!275017)))

(assert (=> b!469586 (= res!280653 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212839 () ListLongMap!7599)

(assert (=> b!469586 (= lt!212843 lt!212839)))

(declare-fun lt!212837 () Unit!13729)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!148 (array!29879 array!29881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 V!18523 V!18523 (_ BitVec 32) Int) Unit!13729)

(assert (=> b!469586 (= lt!212837 (lemmaNoChangeToArrayThenSameMapNoExtras!148 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1991 (array!29879 array!29881 (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 (_ BitVec 32) Int) ListLongMap!7599)

(assert (=> b!469586 (= lt!212839 (getCurrentListMapNoExtraKeys!1991 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469586 (= lt!212843 (getCurrentListMapNoExtraKeys!1991 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469587 () Bool)

(declare-fun res!280655 () Bool)

(assert (=> b!469587 (=> (not res!280655) (not e!275014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29879 (_ BitVec 32)) Bool)

(assert (=> b!469587 (= res!280655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469588 () Bool)

(declare-fun res!280657 () Bool)

(assert (=> b!469588 (=> (not res!280657) (not e!275014))))

(declare-datatypes ((List!8768 0))(
  ( (Nil!8765) (Cons!8764 (h!9620 (_ BitVec 64)) (t!14719 List!8768)) )
))
(declare-fun arrayNoDuplicates!0 (array!29879 (_ BitVec 32) List!8768) Bool)

(assert (=> b!469588 (= res!280657 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8765))))

(declare-fun b!469589 () Bool)

(assert (=> b!469589 (= e!275016 (and e!275015 mapRes!21292))))

(declare-fun condMapEmpty!21292 () Bool)

(declare-fun mapDefault!21292 () ValueCell!6188)

(assert (=> b!469589 (= condMapEmpty!21292 (= (arr!14365 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6188)) mapDefault!21292)))))

(assert (= (and start!42068 res!280656) b!469584))

(assert (= (and b!469584 res!280654) b!469587))

(assert (= (and b!469587 res!280655) b!469588))

(assert (= (and b!469588 res!280657) b!469586))

(assert (= (and b!469586 (not res!280653)) b!469583))

(assert (= (and b!469589 condMapEmpty!21292) mapIsEmpty!21292))

(assert (= (and b!469589 (not condMapEmpty!21292)) mapNonEmpty!21292))

(get-info :version)

(assert (= (and mapNonEmpty!21292 ((_ is ValueCellFull!6188) mapValue!21292)) b!469585))

(assert (= (and b!469589 ((_ is ValueCellFull!6188) mapDefault!21292)) b!469582))

(assert (= start!42068 b!469589))

(declare-fun m!451387 () Bool)

(assert (=> mapNonEmpty!21292 m!451387))

(declare-fun m!451389 () Bool)

(assert (=> b!469583 m!451389))

(declare-fun m!451391 () Bool)

(assert (=> b!469583 m!451391))

(declare-fun m!451393 () Bool)

(assert (=> b!469583 m!451393))

(declare-fun m!451395 () Bool)

(assert (=> b!469583 m!451395))

(assert (=> b!469583 m!451389))

(declare-fun m!451397 () Bool)

(assert (=> b!469583 m!451397))

(declare-fun m!451399 () Bool)

(assert (=> b!469583 m!451399))

(declare-fun m!451401 () Bool)

(assert (=> b!469588 m!451401))

(declare-fun m!451403 () Bool)

(assert (=> start!42068 m!451403))

(declare-fun m!451405 () Bool)

(assert (=> start!42068 m!451405))

(declare-fun m!451407 () Bool)

(assert (=> start!42068 m!451407))

(declare-fun m!451409 () Bool)

(assert (=> b!469587 m!451409))

(declare-fun m!451411 () Bool)

(assert (=> b!469586 m!451411))

(declare-fun m!451413 () Bool)

(assert (=> b!469586 m!451413))

(declare-fun m!451415 () Bool)

(assert (=> b!469586 m!451415))

(check-sat (not b!469586) (not start!42068) (not b!469588) (not b!469583) (not b!469587) tp_is_empty!13063 (not mapNonEmpty!21292) (not b_next!11635) b_and!20019)
(check-sat b_and!20019 (not b_next!11635))
