; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41856 () Bool)

(assert start!41856)

(declare-fun b_free!11473 () Bool)

(declare-fun b_next!11473 () Bool)

(assert (=> start!41856 (= b_free!11473 (not b_next!11473))))

(declare-fun tp!40429 () Bool)

(declare-fun b_and!19863 () Bool)

(assert (=> start!41856 (= tp!40429 b_and!19863)))

(declare-fun b!467452 () Bool)

(declare-fun e!273450 () Bool)

(declare-fun tp_is_empty!12901 () Bool)

(assert (=> b!467452 (= e!273450 tp_is_empty!12901)))

(declare-fun b!467453 () Bool)

(declare-fun res!279413 () Bool)

(declare-fun e!273449 () Bool)

(assert (=> b!467453 (=> (not res!279413) (not e!273449))))

(declare-datatypes ((array!29570 0))(
  ( (array!29571 (arr!14212 (Array (_ BitVec 32) (_ BitVec 64))) (size!14564 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29570)

(declare-datatypes ((List!8537 0))(
  ( (Nil!8534) (Cons!8533 (h!9389 (_ BitVec 64)) (t!14483 List!8537)) )
))
(declare-fun arrayNoDuplicates!0 (array!29570 (_ BitVec 32) List!8537) Bool)

(assert (=> b!467453 (= res!279413 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8534))))

(declare-fun b!467454 () Bool)

(declare-fun res!279410 () Bool)

(assert (=> b!467454 (=> (not res!279410) (not e!273449))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18307 0))(
  ( (V!18308 (val!6495 Int)) )
))
(declare-datatypes ((ValueCell!6107 0))(
  ( (ValueCellFull!6107 (v!8785 V!18307)) (EmptyCell!6107) )
))
(declare-datatypes ((array!29572 0))(
  ( (array!29573 (arr!14213 (Array (_ BitVec 32) ValueCell!6107)) (size!14565 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29572)

(assert (=> b!467454 (= res!279410 (and (= (size!14565 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14564 _keys!1025) (size!14565 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467455 () Bool)

(declare-fun res!279412 () Bool)

(assert (=> b!467455 (=> (not res!279412) (not e!273449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29570 (_ BitVec 32)) Bool)

(assert (=> b!467455 (= res!279412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467456 () Bool)

(declare-fun e!273447 () Bool)

(declare-fun e!273448 () Bool)

(declare-fun mapRes!21040 () Bool)

(assert (=> b!467456 (= e!273447 (and e!273448 mapRes!21040))))

(declare-fun condMapEmpty!21040 () Bool)

(declare-fun mapDefault!21040 () ValueCell!6107)

(assert (=> b!467456 (= condMapEmpty!21040 (= (arr!14213 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6107)) mapDefault!21040)))))

(declare-fun mapIsEmpty!21040 () Bool)

(assert (=> mapIsEmpty!21040 mapRes!21040))

(declare-fun b!467458 () Bool)

(assert (=> b!467458 (= e!273449 (not true))))

(declare-datatypes ((tuple2!8456 0))(
  ( (tuple2!8457 (_1!4239 (_ BitVec 64)) (_2!4239 V!18307)) )
))
(declare-datatypes ((List!8538 0))(
  ( (Nil!8535) (Cons!8534 (h!9390 tuple2!8456) (t!14484 List!8538)) )
))
(declare-datatypes ((ListLongMap!7371 0))(
  ( (ListLongMap!7372 (toList!3701 List!8538)) )
))
(declare-fun lt!211394 () ListLongMap!7371)

(declare-fun lt!211393 () ListLongMap!7371)

(assert (=> b!467458 (= lt!211394 lt!211393)))

(declare-fun minValueBefore!38 () V!18307)

(declare-fun zeroValue!794 () V!18307)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13614 0))(
  ( (Unit!13615) )
))
(declare-fun lt!211392 () Unit!13614)

(declare-fun minValueAfter!38 () V!18307)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!83 (array!29570 array!29572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18307 V!18307 V!18307 V!18307 (_ BitVec 32) Int) Unit!13614)

(assert (=> b!467458 (= lt!211392 (lemmaNoChangeToArrayThenSameMapNoExtras!83 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1923 (array!29570 array!29572 (_ BitVec 32) (_ BitVec 32) V!18307 V!18307 (_ BitVec 32) Int) ListLongMap!7371)

(assert (=> b!467458 (= lt!211393 (getCurrentListMapNoExtraKeys!1923 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467458 (= lt!211394 (getCurrentListMapNoExtraKeys!1923 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21040 () Bool)

(declare-fun tp!40428 () Bool)

(assert (=> mapNonEmpty!21040 (= mapRes!21040 (and tp!40428 e!273450))))

(declare-fun mapKey!21040 () (_ BitVec 32))

(declare-fun mapRest!21040 () (Array (_ BitVec 32) ValueCell!6107))

(declare-fun mapValue!21040 () ValueCell!6107)

(assert (=> mapNonEmpty!21040 (= (arr!14213 _values!833) (store mapRest!21040 mapKey!21040 mapValue!21040))))

(declare-fun b!467457 () Bool)

(assert (=> b!467457 (= e!273448 tp_is_empty!12901)))

(declare-fun res!279411 () Bool)

(assert (=> start!41856 (=> (not res!279411) (not e!273449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41856 (= res!279411 (validMask!0 mask!1365))))

(assert (=> start!41856 e!273449))

(assert (=> start!41856 tp_is_empty!12901))

(assert (=> start!41856 tp!40429))

(assert (=> start!41856 true))

(declare-fun array_inv!10350 (array!29570) Bool)

(assert (=> start!41856 (array_inv!10350 _keys!1025)))

(declare-fun array_inv!10351 (array!29572) Bool)

(assert (=> start!41856 (and (array_inv!10351 _values!833) e!273447)))

(assert (= (and start!41856 res!279411) b!467454))

(assert (= (and b!467454 res!279410) b!467455))

(assert (= (and b!467455 res!279412) b!467453))

(assert (= (and b!467453 res!279413) b!467458))

(assert (= (and b!467456 condMapEmpty!21040) mapIsEmpty!21040))

(assert (= (and b!467456 (not condMapEmpty!21040)) mapNonEmpty!21040))

(get-info :version)

(assert (= (and mapNonEmpty!21040 ((_ is ValueCellFull!6107) mapValue!21040)) b!467452))

(assert (= (and b!467456 ((_ is ValueCellFull!6107) mapDefault!21040)) b!467457))

(assert (= start!41856 b!467456))

(declare-fun m!449837 () Bool)

(assert (=> b!467455 m!449837))

(declare-fun m!449839 () Bool)

(assert (=> mapNonEmpty!21040 m!449839))

(declare-fun m!449841 () Bool)

(assert (=> b!467458 m!449841))

(declare-fun m!449843 () Bool)

(assert (=> b!467458 m!449843))

(declare-fun m!449845 () Bool)

(assert (=> b!467458 m!449845))

(declare-fun m!449847 () Bool)

(assert (=> start!41856 m!449847))

(declare-fun m!449849 () Bool)

(assert (=> start!41856 m!449849))

(declare-fun m!449851 () Bool)

(assert (=> start!41856 m!449851))

(declare-fun m!449853 () Bool)

(assert (=> b!467453 m!449853))

(check-sat (not b!467453) (not b!467455) (not b_next!11473) (not mapNonEmpty!21040) (not b!467458) (not start!41856) b_and!19863 tp_is_empty!12901)
(check-sat b_and!19863 (not b_next!11473))
