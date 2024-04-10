; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41898 () Bool)

(assert start!41898)

(declare-fun b_free!11487 () Bool)

(declare-fun b_next!11487 () Bool)

(assert (=> start!41898 (= b_free!11487 (not b_next!11487))))

(declare-fun tp!40474 () Bool)

(declare-fun b_and!19875 () Bool)

(assert (=> start!41898 (= tp!40474 b_and!19875)))

(declare-fun b!467750 () Bool)

(declare-fun res!279541 () Bool)

(declare-fun e!273654 () Bool)

(assert (=> b!467750 (=> (not res!279541) (not e!273654))))

(declare-datatypes ((array!29607 0))(
  ( (array!29608 (arr!14230 (Array (_ BitVec 32) (_ BitVec 64))) (size!14582 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29607)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29607 (_ BitVec 32)) Bool)

(assert (=> b!467750 (= res!279541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467751 () Bool)

(declare-fun e!273655 () Bool)

(declare-fun tp_is_empty!12915 () Bool)

(assert (=> b!467751 (= e!273655 tp_is_empty!12915)))

(declare-fun b!467752 () Bool)

(declare-fun e!273650 () Bool)

(assert (=> b!467752 (= e!273650 tp_is_empty!12915)))

(declare-fun b!467753 () Bool)

(declare-fun e!273652 () Bool)

(assert (=> b!467753 (= e!273652 true)))

(declare-datatypes ((V!18325 0))(
  ( (V!18326 (val!6502 Int)) )
))
(declare-fun minValueBefore!38 () V!18325)

(declare-fun zeroValue!794 () V!18325)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8534 0))(
  ( (tuple2!8535 (_1!4278 (_ BitVec 64)) (_2!4278 V!18325)) )
))
(declare-datatypes ((List!8621 0))(
  ( (Nil!8618) (Cons!8617 (h!9473 tuple2!8534) (t!14577 List!8621)) )
))
(declare-datatypes ((ListLongMap!7447 0))(
  ( (ListLongMap!7448 (toList!3739 List!8621)) )
))
(declare-fun lt!211488 () ListLongMap!7447)

(declare-datatypes ((ValueCell!6114 0))(
  ( (ValueCellFull!6114 (v!8791 V!18325)) (EmptyCell!6114) )
))
(declare-datatypes ((array!29609 0))(
  ( (array!29610 (arr!14231 (Array (_ BitVec 32) ValueCell!6114)) (size!14583 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29609)

(declare-fun getCurrentListMap!2168 (array!29607 array!29609 (_ BitVec 32) (_ BitVec 32) V!18325 V!18325 (_ BitVec 32) Int) ListLongMap!7447)

(assert (=> b!467753 (= lt!211488 (getCurrentListMap!2168 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21064 () Bool)

(declare-fun mapRes!21064 () Bool)

(declare-fun tp!40473 () Bool)

(assert (=> mapNonEmpty!21064 (= mapRes!21064 (and tp!40473 e!273650))))

(declare-fun mapKey!21064 () (_ BitVec 32))

(declare-fun mapValue!21064 () ValueCell!6114)

(declare-fun mapRest!21064 () (Array (_ BitVec 32) ValueCell!6114))

(assert (=> mapNonEmpty!21064 (= (arr!14231 _values!833) (store mapRest!21064 mapKey!21064 mapValue!21064))))

(declare-fun b!467754 () Bool)

(declare-fun e!273651 () Bool)

(assert (=> b!467754 (= e!273651 (and e!273655 mapRes!21064))))

(declare-fun condMapEmpty!21064 () Bool)

(declare-fun mapDefault!21064 () ValueCell!6114)

(assert (=> b!467754 (= condMapEmpty!21064 (= (arr!14231 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6114)) mapDefault!21064)))))

(declare-fun b!467755 () Bool)

(declare-fun res!279540 () Bool)

(assert (=> b!467755 (=> (not res!279540) (not e!273654))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467755 (= res!279540 (and (= (size!14583 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14582 _keys!1025) (size!14583 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279539 () Bool)

(assert (=> start!41898 (=> (not res!279539) (not e!273654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41898 (= res!279539 (validMask!0 mask!1365))))

(assert (=> start!41898 e!273654))

(assert (=> start!41898 tp_is_empty!12915))

(assert (=> start!41898 tp!40474))

(assert (=> start!41898 true))

(declare-fun array_inv!10270 (array!29607) Bool)

(assert (=> start!41898 (array_inv!10270 _keys!1025)))

(declare-fun array_inv!10271 (array!29609) Bool)

(assert (=> start!41898 (and (array_inv!10271 _values!833) e!273651)))

(declare-fun mapIsEmpty!21064 () Bool)

(assert (=> mapIsEmpty!21064 mapRes!21064))

(declare-fun b!467756 () Bool)

(declare-fun res!279538 () Bool)

(assert (=> b!467756 (=> (not res!279538) (not e!273654))))

(declare-datatypes ((List!8622 0))(
  ( (Nil!8619) (Cons!8618 (h!9474 (_ BitVec 64)) (t!14578 List!8622)) )
))
(declare-fun arrayNoDuplicates!0 (array!29607 (_ BitVec 32) List!8622) Bool)

(assert (=> b!467756 (= res!279538 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8619))))

(declare-fun b!467757 () Bool)

(assert (=> b!467757 (= e!273654 (not e!273652))))

(declare-fun res!279537 () Bool)

(assert (=> b!467757 (=> res!279537 e!273652)))

(assert (=> b!467757 (= res!279537 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211489 () ListLongMap!7447)

(declare-fun lt!211491 () ListLongMap!7447)

(assert (=> b!467757 (= lt!211489 lt!211491)))

(declare-datatypes ((Unit!13638 0))(
  ( (Unit!13639) )
))
(declare-fun lt!211490 () Unit!13638)

(declare-fun minValueAfter!38 () V!18325)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!93 (array!29607 array!29609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18325 V!18325 V!18325 V!18325 (_ BitVec 32) Int) Unit!13638)

(assert (=> b!467757 (= lt!211490 (lemmaNoChangeToArrayThenSameMapNoExtras!93 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1913 (array!29607 array!29609 (_ BitVec 32) (_ BitVec 32) V!18325 V!18325 (_ BitVec 32) Int) ListLongMap!7447)

(assert (=> b!467757 (= lt!211491 (getCurrentListMapNoExtraKeys!1913 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467757 (= lt!211489 (getCurrentListMapNoExtraKeys!1913 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41898 res!279539) b!467755))

(assert (= (and b!467755 res!279540) b!467750))

(assert (= (and b!467750 res!279541) b!467756))

(assert (= (and b!467756 res!279538) b!467757))

(assert (= (and b!467757 (not res!279537)) b!467753))

(assert (= (and b!467754 condMapEmpty!21064) mapIsEmpty!21064))

(assert (= (and b!467754 (not condMapEmpty!21064)) mapNonEmpty!21064))

(get-info :version)

(assert (= (and mapNonEmpty!21064 ((_ is ValueCellFull!6114) mapValue!21064)) b!467752))

(assert (= (and b!467754 ((_ is ValueCellFull!6114) mapDefault!21064)) b!467751))

(assert (= start!41898 b!467754))

(declare-fun m!449849 () Bool)

(assert (=> mapNonEmpty!21064 m!449849))

(declare-fun m!449851 () Bool)

(assert (=> b!467756 m!449851))

(declare-fun m!449853 () Bool)

(assert (=> start!41898 m!449853))

(declare-fun m!449855 () Bool)

(assert (=> start!41898 m!449855))

(declare-fun m!449857 () Bool)

(assert (=> start!41898 m!449857))

(declare-fun m!449859 () Bool)

(assert (=> b!467757 m!449859))

(declare-fun m!449861 () Bool)

(assert (=> b!467757 m!449861))

(declare-fun m!449863 () Bool)

(assert (=> b!467757 m!449863))

(declare-fun m!449865 () Bool)

(assert (=> b!467753 m!449865))

(declare-fun m!449867 () Bool)

(assert (=> b!467750 m!449867))

(check-sat (not mapNonEmpty!21064) (not b!467757) b_and!19875 (not b!467756) (not b!467750) (not start!41898) (not b_next!11487) tp_is_empty!12915 (not b!467753))
(check-sat b_and!19875 (not b_next!11487))
