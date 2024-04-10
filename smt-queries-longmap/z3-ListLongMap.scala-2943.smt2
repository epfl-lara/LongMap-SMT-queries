; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41866 () Bool)

(assert start!41866)

(declare-fun b_free!11469 () Bool)

(declare-fun b_next!11469 () Bool)

(assert (=> start!41866 (= b_free!11469 (not b_next!11469))))

(declare-fun tp!40417 () Bool)

(declare-fun b_and!19849 () Bool)

(assert (=> start!41866 (= tp!40417 b_and!19849)))

(declare-fun res!279394 () Bool)

(declare-fun e!273457 () Bool)

(assert (=> start!41866 (=> (not res!279394) (not e!273457))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41866 (= res!279394 (validMask!0 mask!1365))))

(assert (=> start!41866 e!273457))

(declare-fun tp_is_empty!12897 () Bool)

(assert (=> start!41866 tp_is_empty!12897))

(assert (=> start!41866 tp!40417))

(assert (=> start!41866 true))

(declare-datatypes ((array!29569 0))(
  ( (array!29570 (arr!14212 (Array (_ BitVec 32) (_ BitVec 64))) (size!14564 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29569)

(declare-fun array_inv!10258 (array!29569) Bool)

(assert (=> start!41866 (array_inv!10258 _keys!1025)))

(declare-datatypes ((V!18301 0))(
  ( (V!18302 (val!6493 Int)) )
))
(declare-datatypes ((ValueCell!6105 0))(
  ( (ValueCellFull!6105 (v!8782 V!18301)) (EmptyCell!6105) )
))
(declare-datatypes ((array!29571 0))(
  ( (array!29572 (arr!14213 (Array (_ BitVec 32) ValueCell!6105)) (size!14565 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29571)

(declare-fun e!273459 () Bool)

(declare-fun array_inv!10259 (array!29571) Bool)

(assert (=> start!41866 (and (array_inv!10259 _values!833) e!273459)))

(declare-fun b!467471 () Bool)

(assert (=> b!467471 (= e!273457 (not true))))

(declare-datatypes ((tuple2!8520 0))(
  ( (tuple2!8521 (_1!4271 (_ BitVec 64)) (_2!4271 V!18301)) )
))
(declare-datatypes ((List!8607 0))(
  ( (Nil!8604) (Cons!8603 (h!9459 tuple2!8520) (t!14561 List!8607)) )
))
(declare-datatypes ((ListLongMap!7433 0))(
  ( (ListLongMap!7434 (toList!3732 List!8607)) )
))
(declare-fun lt!211362 () ListLongMap!7433)

(declare-fun lt!211363 () ListLongMap!7433)

(assert (=> b!467471 (= lt!211362 lt!211363)))

(declare-fun minValueBefore!38 () V!18301)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18301)

(declare-datatypes ((Unit!13624 0))(
  ( (Unit!13625) )
))
(declare-fun lt!211364 () Unit!13624)

(declare-fun minValueAfter!38 () V!18301)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!86 (array!29569 array!29571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18301 V!18301 V!18301 V!18301 (_ BitVec 32) Int) Unit!13624)

(assert (=> b!467471 (= lt!211364 (lemmaNoChangeToArrayThenSameMapNoExtras!86 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1906 (array!29569 array!29571 (_ BitVec 32) (_ BitVec 32) V!18301 V!18301 (_ BitVec 32) Int) ListLongMap!7433)

(assert (=> b!467471 (= lt!211363 (getCurrentListMapNoExtraKeys!1906 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467471 (= lt!211362 (getCurrentListMapNoExtraKeys!1906 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467472 () Bool)

(declare-fun e!273455 () Bool)

(declare-fun mapRes!21034 () Bool)

(assert (=> b!467472 (= e!273459 (and e!273455 mapRes!21034))))

(declare-fun condMapEmpty!21034 () Bool)

(declare-fun mapDefault!21034 () ValueCell!6105)

(assert (=> b!467472 (= condMapEmpty!21034 (= (arr!14213 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6105)) mapDefault!21034)))))

(declare-fun b!467473 () Bool)

(declare-fun res!279396 () Bool)

(assert (=> b!467473 (=> (not res!279396) (not e!273457))))

(declare-datatypes ((List!8608 0))(
  ( (Nil!8605) (Cons!8604 (h!9460 (_ BitVec 64)) (t!14562 List!8608)) )
))
(declare-fun arrayNoDuplicates!0 (array!29569 (_ BitVec 32) List!8608) Bool)

(assert (=> b!467473 (= res!279396 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8605))))

(declare-fun mapIsEmpty!21034 () Bool)

(assert (=> mapIsEmpty!21034 mapRes!21034))

(declare-fun b!467474 () Bool)

(declare-fun res!279393 () Bool)

(assert (=> b!467474 (=> (not res!279393) (not e!273457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29569 (_ BitVec 32)) Bool)

(assert (=> b!467474 (= res!279393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467475 () Bool)

(assert (=> b!467475 (= e!273455 tp_is_empty!12897)))

(declare-fun mapNonEmpty!21034 () Bool)

(declare-fun tp!40416 () Bool)

(declare-fun e!273456 () Bool)

(assert (=> mapNonEmpty!21034 (= mapRes!21034 (and tp!40416 e!273456))))

(declare-fun mapValue!21034 () ValueCell!6105)

(declare-fun mapRest!21034 () (Array (_ BitVec 32) ValueCell!6105))

(declare-fun mapKey!21034 () (_ BitVec 32))

(assert (=> mapNonEmpty!21034 (= (arr!14213 _values!833) (store mapRest!21034 mapKey!21034 mapValue!21034))))

(declare-fun b!467476 () Bool)

(assert (=> b!467476 (= e!273456 tp_is_empty!12897)))

(declare-fun b!467477 () Bool)

(declare-fun res!279395 () Bool)

(assert (=> b!467477 (=> (not res!279395) (not e!273457))))

(assert (=> b!467477 (= res!279395 (and (= (size!14565 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14564 _keys!1025) (size!14565 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41866 res!279394) b!467477))

(assert (= (and b!467477 res!279395) b!467474))

(assert (= (and b!467474 res!279393) b!467473))

(assert (= (and b!467473 res!279396) b!467471))

(assert (= (and b!467472 condMapEmpty!21034) mapIsEmpty!21034))

(assert (= (and b!467472 (not condMapEmpty!21034)) mapNonEmpty!21034))

(get-info :version)

(assert (= (and mapNonEmpty!21034 ((_ is ValueCellFull!6105) mapValue!21034)) b!467476))

(assert (= (and b!467472 ((_ is ValueCellFull!6105) mapDefault!21034)) b!467475))

(assert (= start!41866 b!467472))

(declare-fun m!449619 () Bool)

(assert (=> mapNonEmpty!21034 m!449619))

(declare-fun m!449621 () Bool)

(assert (=> b!467473 m!449621))

(declare-fun m!449623 () Bool)

(assert (=> b!467471 m!449623))

(declare-fun m!449625 () Bool)

(assert (=> b!467471 m!449625))

(declare-fun m!449627 () Bool)

(assert (=> b!467471 m!449627))

(declare-fun m!449629 () Bool)

(assert (=> b!467474 m!449629))

(declare-fun m!449631 () Bool)

(assert (=> start!41866 m!449631))

(declare-fun m!449633 () Bool)

(assert (=> start!41866 m!449633))

(declare-fun m!449635 () Bool)

(assert (=> start!41866 m!449635))

(check-sat (not mapNonEmpty!21034) (not b!467471) (not b_next!11469) (not start!41866) (not b!467473) tp_is_empty!12897 (not b!467474) b_and!19849)
(check-sat b_and!19849 (not b_next!11469))
