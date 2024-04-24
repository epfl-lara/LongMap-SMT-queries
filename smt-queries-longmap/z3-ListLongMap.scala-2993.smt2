; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42248 () Bool)

(assert start!42248)

(declare-fun b_free!11767 () Bool)

(declare-fun b_next!11767 () Bool)

(assert (=> start!42248 (= b_free!11767 (not b_next!11767))))

(declare-fun tp!41328 () Bool)

(declare-fun b_and!20215 () Bool)

(assert (=> start!42248 (= tp!41328 b_and!20215)))

(declare-fun mapIsEmpty!21499 () Bool)

(declare-fun mapRes!21499 () Bool)

(assert (=> mapIsEmpty!21499 mapRes!21499))

(declare-fun b!471543 () Bool)

(declare-fun e!276380 () Bool)

(declare-fun e!276378 () Bool)

(assert (=> b!471543 (= e!276380 (and e!276378 mapRes!21499))))

(declare-fun condMapEmpty!21499 () Bool)

(declare-datatypes ((V!18699 0))(
  ( (V!18700 (val!6642 Int)) )
))
(declare-datatypes ((ValueCell!6254 0))(
  ( (ValueCellFull!6254 (v!8934 V!18699)) (EmptyCell!6254) )
))
(declare-datatypes ((array!30138 0))(
  ( (array!30139 (arr!14490 (Array (_ BitVec 32) ValueCell!6254)) (size!14842 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30138)

(declare-fun mapDefault!21499 () ValueCell!6254)

(assert (=> b!471543 (= condMapEmpty!21499 (= (arr!14490 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6254)) mapDefault!21499)))))

(declare-fun b!471544 () Bool)

(declare-fun e!276377 () Bool)

(declare-fun tp_is_empty!13195 () Bool)

(assert (=> b!471544 (= e!276377 tp_is_empty!13195)))

(declare-fun b!471545 () Bool)

(declare-fun res!281724 () Bool)

(declare-fun e!276379 () Bool)

(assert (=> b!471545 (=> (not res!281724) (not e!276379))))

(declare-datatypes ((array!30140 0))(
  ( (array!30141 (arr!14491 (Array (_ BitVec 32) (_ BitVec 64))) (size!14843 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30140)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30140 (_ BitVec 32)) Bool)

(assert (=> b!471545 (= res!281724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471546 () Bool)

(assert (=> b!471546 (= e!276379 (not true))))

(declare-datatypes ((tuple2!8668 0))(
  ( (tuple2!8669 (_1!4345 (_ BitVec 64)) (_2!4345 V!18699)) )
))
(declare-datatypes ((List!8737 0))(
  ( (Nil!8734) (Cons!8733 (h!9589 tuple2!8668) (t!14695 List!8737)) )
))
(declare-datatypes ((ListLongMap!7583 0))(
  ( (ListLongMap!7584 (toList!3807 List!8737)) )
))
(declare-fun lt!213974 () ListLongMap!7583)

(declare-fun lt!213972 () ListLongMap!7583)

(assert (=> b!471546 (= lt!213974 lt!213972)))

(declare-fun minValueBefore!38 () V!18699)

(declare-fun zeroValue!794 () V!18699)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13827 0))(
  ( (Unit!13828) )
))
(declare-fun lt!213973 () Unit!13827)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18699)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!182 (array!30140 array!30138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18699 V!18699 V!18699 V!18699 (_ BitVec 32) Int) Unit!13827)

(assert (=> b!471546 (= lt!213973 (lemmaNoChangeToArrayThenSameMapNoExtras!182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2022 (array!30140 array!30138 (_ BitVec 32) (_ BitVec 32) V!18699 V!18699 (_ BitVec 32) Int) ListLongMap!7583)

(assert (=> b!471546 (= lt!213972 (getCurrentListMapNoExtraKeys!2022 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471546 (= lt!213974 (getCurrentListMapNoExtraKeys!2022 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471547 () Bool)

(declare-fun res!281722 () Bool)

(assert (=> b!471547 (=> (not res!281722) (not e!276379))))

(declare-datatypes ((List!8738 0))(
  ( (Nil!8735) (Cons!8734 (h!9590 (_ BitVec 64)) (t!14696 List!8738)) )
))
(declare-fun arrayNoDuplicates!0 (array!30140 (_ BitVec 32) List!8738) Bool)

(assert (=> b!471547 (= res!281722 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8735))))

(declare-fun b!471548 () Bool)

(declare-fun res!281725 () Bool)

(assert (=> b!471548 (=> (not res!281725) (not e!276379))))

(assert (=> b!471548 (= res!281725 (and (= (size!14842 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14843 _keys!1025) (size!14842 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281723 () Bool)

(assert (=> start!42248 (=> (not res!281723) (not e!276379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42248 (= res!281723 (validMask!0 mask!1365))))

(assert (=> start!42248 e!276379))

(assert (=> start!42248 tp_is_empty!13195))

(assert (=> start!42248 tp!41328))

(assert (=> start!42248 true))

(declare-fun array_inv!10544 (array!30140) Bool)

(assert (=> start!42248 (array_inv!10544 _keys!1025)))

(declare-fun array_inv!10545 (array!30138) Bool)

(assert (=> start!42248 (and (array_inv!10545 _values!833) e!276380)))

(declare-fun b!471549 () Bool)

(assert (=> b!471549 (= e!276378 tp_is_empty!13195)))

(declare-fun mapNonEmpty!21499 () Bool)

(declare-fun tp!41329 () Bool)

(assert (=> mapNonEmpty!21499 (= mapRes!21499 (and tp!41329 e!276377))))

(declare-fun mapKey!21499 () (_ BitVec 32))

(declare-fun mapValue!21499 () ValueCell!6254)

(declare-fun mapRest!21499 () (Array (_ BitVec 32) ValueCell!6254))

(assert (=> mapNonEmpty!21499 (= (arr!14490 _values!833) (store mapRest!21499 mapKey!21499 mapValue!21499))))

(assert (= (and start!42248 res!281723) b!471548))

(assert (= (and b!471548 res!281725) b!471545))

(assert (= (and b!471545 res!281724) b!471547))

(assert (= (and b!471547 res!281722) b!471546))

(assert (= (and b!471543 condMapEmpty!21499) mapIsEmpty!21499))

(assert (= (and b!471543 (not condMapEmpty!21499)) mapNonEmpty!21499))

(get-info :version)

(assert (= (and mapNonEmpty!21499 ((_ is ValueCellFull!6254) mapValue!21499)) b!471544))

(assert (= (and b!471543 ((_ is ValueCellFull!6254) mapDefault!21499)) b!471549))

(assert (= start!42248 b!471543))

(declare-fun m!453895 () Bool)

(assert (=> start!42248 m!453895))

(declare-fun m!453897 () Bool)

(assert (=> start!42248 m!453897))

(declare-fun m!453899 () Bool)

(assert (=> start!42248 m!453899))

(declare-fun m!453901 () Bool)

(assert (=> b!471546 m!453901))

(declare-fun m!453903 () Bool)

(assert (=> b!471546 m!453903))

(declare-fun m!453905 () Bool)

(assert (=> b!471546 m!453905))

(declare-fun m!453907 () Bool)

(assert (=> b!471547 m!453907))

(declare-fun m!453909 () Bool)

(assert (=> b!471545 m!453909))

(declare-fun m!453911 () Bool)

(assert (=> mapNonEmpty!21499 m!453911))

(check-sat (not b!471547) (not b!471546) (not start!42248) (not b!471545) tp_is_empty!13195 b_and!20215 (not mapNonEmpty!21499) (not b_next!11767))
(check-sat b_and!20215 (not b_next!11767))
