; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42404 () Bool)

(assert start!42404)

(declare-fun b_free!11893 () Bool)

(declare-fun b_next!11893 () Bool)

(assert (=> start!42404 (= b_free!11893 (not b_next!11893))))

(declare-fun tp!41713 () Bool)

(declare-fun b_and!20323 () Bool)

(assert (=> start!42404 (= tp!41713 b_and!20323)))

(declare-fun b!473017 () Bool)

(declare-fun e!277468 () Bool)

(declare-fun tp_is_empty!13321 () Bool)

(assert (=> b!473017 (= e!277468 tp_is_empty!13321)))

(declare-fun b!473018 () Bool)

(declare-fun res!282575 () Bool)

(declare-fun e!277467 () Bool)

(assert (=> b!473018 (=> (not res!282575) (not e!277467))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30379 0))(
  ( (array!30380 (arr!14609 (Array (_ BitVec 32) (_ BitVec 64))) (size!14962 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30379)

(declare-datatypes ((V!18867 0))(
  ( (V!18868 (val!6705 Int)) )
))
(declare-datatypes ((ValueCell!6317 0))(
  ( (ValueCellFull!6317 (v!8990 V!18867)) (EmptyCell!6317) )
))
(declare-datatypes ((array!30381 0))(
  ( (array!30382 (arr!14610 (Array (_ BitVec 32) ValueCell!6317)) (size!14963 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30381)

(assert (=> b!473018 (= res!282575 (and (= (size!14963 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14962 _keys!1025) (size!14963 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473019 () Bool)

(declare-fun e!277465 () Bool)

(assert (=> b!473019 (= e!277465 tp_is_empty!13321)))

(declare-fun b!473020 () Bool)

(declare-fun e!277466 () Bool)

(assert (=> b!473020 (= e!277466 true)))

(declare-datatypes ((tuple2!8882 0))(
  ( (tuple2!8883 (_1!4452 (_ BitVec 64)) (_2!4452 V!18867)) )
))
(declare-datatypes ((List!8950 0))(
  ( (Nil!8947) (Cons!8946 (h!9802 tuple2!8882) (t!14911 List!8950)) )
))
(declare-datatypes ((ListLongMap!7785 0))(
  ( (ListLongMap!7786 (toList!3908 List!8950)) )
))
(declare-fun lt!214762 () ListLongMap!7785)

(declare-fun lt!214761 () tuple2!8882)

(declare-fun minValueBefore!38 () V!18867)

(declare-fun +!1760 (ListLongMap!7785 tuple2!8882) ListLongMap!7785)

(assert (=> b!473020 (= (+!1760 lt!214762 lt!214761) (+!1760 (+!1760 lt!214762 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214761))))

(declare-fun minValueAfter!38 () V!18867)

(assert (=> b!473020 (= lt!214761 (tuple2!8883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13910 0))(
  ( (Unit!13911) )
))
(declare-fun lt!214760 () Unit!13910)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!139 (ListLongMap!7785 (_ BitVec 64) V!18867 V!18867) Unit!13910)

(assert (=> b!473020 (= lt!214760 (addSameAsAddTwiceSameKeyDiffValues!139 lt!214762 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214759 () ListLongMap!7785)

(declare-fun zeroValue!794 () V!18867)

(assert (=> b!473020 (= lt!214762 (+!1760 lt!214759 (tuple2!8883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214757 () ListLongMap!7785)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2212 (array!30379 array!30381 (_ BitVec 32) (_ BitVec 32) V!18867 V!18867 (_ BitVec 32) Int) ListLongMap!7785)

(assert (=> b!473020 (= lt!214757 (getCurrentListMap!2212 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214755 () ListLongMap!7785)

(assert (=> b!473020 (= lt!214755 (getCurrentListMap!2212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21694 () Bool)

(declare-fun mapRes!21694 () Bool)

(declare-fun tp!41712 () Bool)

(assert (=> mapNonEmpty!21694 (= mapRes!21694 (and tp!41712 e!277465))))

(declare-fun mapKey!21694 () (_ BitVec 32))

(declare-fun mapRest!21694 () (Array (_ BitVec 32) ValueCell!6317))

(declare-fun mapValue!21694 () ValueCell!6317)

(assert (=> mapNonEmpty!21694 (= (arr!14610 _values!833) (store mapRest!21694 mapKey!21694 mapValue!21694))))

(declare-fun b!473022 () Bool)

(assert (=> b!473022 (= e!277467 (not e!277466))))

(declare-fun res!282573 () Bool)

(assert (=> b!473022 (=> res!282573 e!277466)))

(assert (=> b!473022 (= res!282573 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214758 () ListLongMap!7785)

(assert (=> b!473022 (= lt!214759 lt!214758)))

(declare-fun lt!214756 () Unit!13910)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!234 (array!30379 array!30381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18867 V!18867 V!18867 V!18867 (_ BitVec 32) Int) Unit!13910)

(assert (=> b!473022 (= lt!214756 (lemmaNoChangeToArrayThenSameMapNoExtras!234 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2077 (array!30379 array!30381 (_ BitVec 32) (_ BitVec 32) V!18867 V!18867 (_ BitVec 32) Int) ListLongMap!7785)

(assert (=> b!473022 (= lt!214758 (getCurrentListMapNoExtraKeys!2077 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473022 (= lt!214759 (getCurrentListMapNoExtraKeys!2077 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473023 () Bool)

(declare-fun res!282576 () Bool)

(assert (=> b!473023 (=> (not res!282576) (not e!277467))))

(declare-datatypes ((List!8951 0))(
  ( (Nil!8948) (Cons!8947 (h!9803 (_ BitVec 64)) (t!14912 List!8951)) )
))
(declare-fun arrayNoDuplicates!0 (array!30379 (_ BitVec 32) List!8951) Bool)

(assert (=> b!473023 (= res!282576 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8948))))

(declare-fun mapIsEmpty!21694 () Bool)

(assert (=> mapIsEmpty!21694 mapRes!21694))

(declare-fun b!473024 () Bool)

(declare-fun e!277469 () Bool)

(assert (=> b!473024 (= e!277469 (and e!277468 mapRes!21694))))

(declare-fun condMapEmpty!21694 () Bool)

(declare-fun mapDefault!21694 () ValueCell!6317)

(assert (=> b!473024 (= condMapEmpty!21694 (= (arr!14610 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6317)) mapDefault!21694)))))

(declare-fun res!282577 () Bool)

(assert (=> start!42404 (=> (not res!282577) (not e!277467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42404 (= res!282577 (validMask!0 mask!1365))))

(assert (=> start!42404 e!277467))

(assert (=> start!42404 tp_is_empty!13321))

(assert (=> start!42404 tp!41713))

(assert (=> start!42404 true))

(declare-fun array_inv!10628 (array!30379) Bool)

(assert (=> start!42404 (array_inv!10628 _keys!1025)))

(declare-fun array_inv!10629 (array!30381) Bool)

(assert (=> start!42404 (and (array_inv!10629 _values!833) e!277469)))

(declare-fun b!473021 () Bool)

(declare-fun res!282574 () Bool)

(assert (=> b!473021 (=> (not res!282574) (not e!277467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30379 (_ BitVec 32)) Bool)

(assert (=> b!473021 (= res!282574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42404 res!282577) b!473018))

(assert (= (and b!473018 res!282575) b!473021))

(assert (= (and b!473021 res!282574) b!473023))

(assert (= (and b!473023 res!282576) b!473022))

(assert (= (and b!473022 (not res!282573)) b!473020))

(assert (= (and b!473024 condMapEmpty!21694) mapIsEmpty!21694))

(assert (= (and b!473024 (not condMapEmpty!21694)) mapNonEmpty!21694))

(get-info :version)

(assert (= (and mapNonEmpty!21694 ((_ is ValueCellFull!6317) mapValue!21694)) b!473019))

(assert (= (and b!473024 ((_ is ValueCellFull!6317) mapDefault!21694)) b!473017))

(assert (= start!42404 b!473024))

(declare-fun m!454555 () Bool)

(assert (=> b!473021 m!454555))

(declare-fun m!454557 () Bool)

(assert (=> mapNonEmpty!21694 m!454557))

(declare-fun m!454559 () Bool)

(assert (=> b!473022 m!454559))

(declare-fun m!454561 () Bool)

(assert (=> b!473022 m!454561))

(declare-fun m!454563 () Bool)

(assert (=> b!473022 m!454563))

(declare-fun m!454565 () Bool)

(assert (=> b!473020 m!454565))

(declare-fun m!454567 () Bool)

(assert (=> b!473020 m!454567))

(declare-fun m!454569 () Bool)

(assert (=> b!473020 m!454569))

(assert (=> b!473020 m!454567))

(declare-fun m!454571 () Bool)

(assert (=> b!473020 m!454571))

(declare-fun m!454573 () Bool)

(assert (=> b!473020 m!454573))

(declare-fun m!454575 () Bool)

(assert (=> b!473020 m!454575))

(declare-fun m!454577 () Bool)

(assert (=> b!473020 m!454577))

(declare-fun m!454579 () Bool)

(assert (=> b!473023 m!454579))

(declare-fun m!454581 () Bool)

(assert (=> start!42404 m!454581))

(declare-fun m!454583 () Bool)

(assert (=> start!42404 m!454583))

(declare-fun m!454585 () Bool)

(assert (=> start!42404 m!454585))

(check-sat (not b!473021) (not b!473022) (not b!473023) b_and!20323 (not start!42404) tp_is_empty!13321 (not b_next!11893) (not b!473020) (not mapNonEmpty!21694))
(check-sat b_and!20323 (not b_next!11893))
