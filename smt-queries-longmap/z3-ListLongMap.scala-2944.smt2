; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41872 () Bool)

(assert start!41872)

(declare-fun b_free!11475 () Bool)

(declare-fun b_next!11475 () Bool)

(assert (=> start!41872 (= b_free!11475 (not b_next!11475))))

(declare-fun tp!40435 () Bool)

(declare-fun b_and!19855 () Bool)

(assert (=> start!41872 (= tp!40435 b_and!19855)))

(declare-fun res!279432 () Bool)

(declare-fun e!273501 () Bool)

(assert (=> start!41872 (=> (not res!279432) (not e!273501))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41872 (= res!279432 (validMask!0 mask!1365))))

(assert (=> start!41872 e!273501))

(declare-fun tp_is_empty!12903 () Bool)

(assert (=> start!41872 tp_is_empty!12903))

(assert (=> start!41872 tp!40435))

(assert (=> start!41872 true))

(declare-datatypes ((array!29581 0))(
  ( (array!29582 (arr!14218 (Array (_ BitVec 32) (_ BitVec 64))) (size!14570 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29581)

(declare-fun array_inv!10262 (array!29581) Bool)

(assert (=> start!41872 (array_inv!10262 _keys!1025)))

(declare-datatypes ((V!18309 0))(
  ( (V!18310 (val!6496 Int)) )
))
(declare-datatypes ((ValueCell!6108 0))(
  ( (ValueCellFull!6108 (v!8785 V!18309)) (EmptyCell!6108) )
))
(declare-datatypes ((array!29583 0))(
  ( (array!29584 (arr!14219 (Array (_ BitVec 32) ValueCell!6108)) (size!14571 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29583)

(declare-fun e!273503 () Bool)

(declare-fun array_inv!10263 (array!29583) Bool)

(assert (=> start!41872 (and (array_inv!10263 _values!833) e!273503)))

(declare-fun mapNonEmpty!21043 () Bool)

(declare-fun mapRes!21043 () Bool)

(declare-fun tp!40434 () Bool)

(declare-fun e!273504 () Bool)

(assert (=> mapNonEmpty!21043 (= mapRes!21043 (and tp!40434 e!273504))))

(declare-fun mapRest!21043 () (Array (_ BitVec 32) ValueCell!6108))

(declare-fun mapValue!21043 () ValueCell!6108)

(declare-fun mapKey!21043 () (_ BitVec 32))

(assert (=> mapNonEmpty!21043 (= (arr!14219 _values!833) (store mapRest!21043 mapKey!21043 mapValue!21043))))

(declare-fun b!467534 () Bool)

(declare-fun res!279430 () Bool)

(assert (=> b!467534 (=> (not res!279430) (not e!273501))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467534 (= res!279430 (and (= (size!14571 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14570 _keys!1025) (size!14571 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21043 () Bool)

(assert (=> mapIsEmpty!21043 mapRes!21043))

(declare-fun b!467535 () Bool)

(declare-fun res!279431 () Bool)

(assert (=> b!467535 (=> (not res!279431) (not e!273501))))

(declare-datatypes ((List!8613 0))(
  ( (Nil!8610) (Cons!8609 (h!9465 (_ BitVec 64)) (t!14567 List!8613)) )
))
(declare-fun arrayNoDuplicates!0 (array!29581 (_ BitVec 32) List!8613) Bool)

(assert (=> b!467535 (= res!279431 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8610))))

(declare-fun b!467536 () Bool)

(assert (=> b!467536 (= e!273504 tp_is_empty!12903)))

(declare-fun b!467537 () Bool)

(declare-fun e!273500 () Bool)

(assert (=> b!467537 (= e!273500 tp_is_empty!12903)))

(declare-fun b!467538 () Bool)

(assert (=> b!467538 (= e!273501 (not true))))

(declare-datatypes ((tuple2!8526 0))(
  ( (tuple2!8527 (_1!4274 (_ BitVec 64)) (_2!4274 V!18309)) )
))
(declare-datatypes ((List!8614 0))(
  ( (Nil!8611) (Cons!8610 (h!9466 tuple2!8526) (t!14568 List!8614)) )
))
(declare-datatypes ((ListLongMap!7439 0))(
  ( (ListLongMap!7440 (toList!3735 List!8614)) )
))
(declare-fun lt!211389 () ListLongMap!7439)

(declare-fun lt!211390 () ListLongMap!7439)

(assert (=> b!467538 (= lt!211389 lt!211390)))

(declare-fun minValueBefore!38 () V!18309)

(declare-fun zeroValue!794 () V!18309)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13630 0))(
  ( (Unit!13631) )
))
(declare-fun lt!211391 () Unit!13630)

(declare-fun minValueAfter!38 () V!18309)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!89 (array!29581 array!29583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18309 V!18309 V!18309 V!18309 (_ BitVec 32) Int) Unit!13630)

(assert (=> b!467538 (= lt!211391 (lemmaNoChangeToArrayThenSameMapNoExtras!89 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1909 (array!29581 array!29583 (_ BitVec 32) (_ BitVec 32) V!18309 V!18309 (_ BitVec 32) Int) ListLongMap!7439)

(assert (=> b!467538 (= lt!211390 (getCurrentListMapNoExtraKeys!1909 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467538 (= lt!211389 (getCurrentListMapNoExtraKeys!1909 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467539 () Bool)

(declare-fun res!279429 () Bool)

(assert (=> b!467539 (=> (not res!279429) (not e!273501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29581 (_ BitVec 32)) Bool)

(assert (=> b!467539 (= res!279429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467540 () Bool)

(assert (=> b!467540 (= e!273503 (and e!273500 mapRes!21043))))

(declare-fun condMapEmpty!21043 () Bool)

(declare-fun mapDefault!21043 () ValueCell!6108)

(assert (=> b!467540 (= condMapEmpty!21043 (= (arr!14219 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6108)) mapDefault!21043)))))

(assert (= (and start!41872 res!279432) b!467534))

(assert (= (and b!467534 res!279430) b!467539))

(assert (= (and b!467539 res!279429) b!467535))

(assert (= (and b!467535 res!279431) b!467538))

(assert (= (and b!467540 condMapEmpty!21043) mapIsEmpty!21043))

(assert (= (and b!467540 (not condMapEmpty!21043)) mapNonEmpty!21043))

(get-info :version)

(assert (= (and mapNonEmpty!21043 ((_ is ValueCellFull!6108) mapValue!21043)) b!467536))

(assert (= (and b!467540 ((_ is ValueCellFull!6108) mapDefault!21043)) b!467537))

(assert (= start!41872 b!467540))

(declare-fun m!449673 () Bool)

(assert (=> b!467538 m!449673))

(declare-fun m!449675 () Bool)

(assert (=> b!467538 m!449675))

(declare-fun m!449677 () Bool)

(assert (=> b!467538 m!449677))

(declare-fun m!449679 () Bool)

(assert (=> mapNonEmpty!21043 m!449679))

(declare-fun m!449681 () Bool)

(assert (=> b!467535 m!449681))

(declare-fun m!449683 () Bool)

(assert (=> b!467539 m!449683))

(declare-fun m!449685 () Bool)

(assert (=> start!41872 m!449685))

(declare-fun m!449687 () Bool)

(assert (=> start!41872 m!449687))

(declare-fun m!449689 () Bool)

(assert (=> start!41872 m!449689))

(check-sat (not start!41872) (not b!467538) (not mapNonEmpty!21043) tp_is_empty!12903 (not b!467539) b_and!19855 (not b!467535) (not b_next!11475))
(check-sat b_and!19855 (not b_next!11475))
