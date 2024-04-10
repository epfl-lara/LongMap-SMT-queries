; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41916 () Bool)

(assert start!41916)

(declare-fun b_free!11505 () Bool)

(declare-fun b_next!11505 () Bool)

(assert (=> start!41916 (= b_free!11505 (not b_next!11505))))

(declare-fun tp!40527 () Bool)

(declare-fun b_and!19893 () Bool)

(assert (=> start!41916 (= tp!40527 b_and!19893)))

(declare-fun b!467966 () Bool)

(declare-fun res!279674 () Bool)

(declare-fun e!273816 () Bool)

(assert (=> b!467966 (=> (not res!279674) (not e!273816))))

(declare-datatypes ((array!29643 0))(
  ( (array!29644 (arr!14248 (Array (_ BitVec 32) (_ BitVec 64))) (size!14600 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29643)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29643 (_ BitVec 32)) Bool)

(assert (=> b!467966 (= res!279674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467967 () Bool)

(declare-fun e!273815 () Bool)

(declare-fun tp_is_empty!12933 () Bool)

(assert (=> b!467967 (= e!273815 tp_is_empty!12933)))

(declare-fun b!467968 () Bool)

(declare-fun e!273814 () Bool)

(declare-fun mapRes!21091 () Bool)

(assert (=> b!467968 (= e!273814 (and e!273815 mapRes!21091))))

(declare-fun condMapEmpty!21091 () Bool)

(declare-datatypes ((V!18349 0))(
  ( (V!18350 (val!6511 Int)) )
))
(declare-datatypes ((ValueCell!6123 0))(
  ( (ValueCellFull!6123 (v!8800 V!18349)) (EmptyCell!6123) )
))
(declare-datatypes ((array!29645 0))(
  ( (array!29646 (arr!14249 (Array (_ BitVec 32) ValueCell!6123)) (size!14601 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29645)

(declare-fun mapDefault!21091 () ValueCell!6123)

(assert (=> b!467968 (= condMapEmpty!21091 (= (arr!14249 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6123)) mapDefault!21091)))))

(declare-fun b!467969 () Bool)

(declare-fun e!273817 () Bool)

(assert (=> b!467969 (= e!273816 (not e!273817))))

(declare-fun res!279675 () Bool)

(assert (=> b!467969 (=> res!279675 e!273817)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467969 (= res!279675 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8550 0))(
  ( (tuple2!8551 (_1!4286 (_ BitVec 64)) (_2!4286 V!18349)) )
))
(declare-datatypes ((List!8638 0))(
  ( (Nil!8635) (Cons!8634 (h!9490 tuple2!8550) (t!14594 List!8638)) )
))
(declare-datatypes ((ListLongMap!7463 0))(
  ( (ListLongMap!7464 (toList!3747 List!8638)) )
))
(declare-fun lt!211598 () ListLongMap!7463)

(declare-fun lt!211599 () ListLongMap!7463)

(assert (=> b!467969 (= lt!211598 lt!211599)))

(declare-fun zeroValue!794 () V!18349)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18349)

(declare-datatypes ((Unit!13654 0))(
  ( (Unit!13655) )
))
(declare-fun lt!211596 () Unit!13654)

(declare-fun minValueAfter!38 () V!18349)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!101 (array!29643 array!29645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18349 V!18349 V!18349 V!18349 (_ BitVec 32) Int) Unit!13654)

(assert (=> b!467969 (= lt!211596 (lemmaNoChangeToArrayThenSameMapNoExtras!101 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1921 (array!29643 array!29645 (_ BitVec 32) (_ BitVec 32) V!18349 V!18349 (_ BitVec 32) Int) ListLongMap!7463)

(assert (=> b!467969 (= lt!211599 (getCurrentListMapNoExtraKeys!1921 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467969 (= lt!211598 (getCurrentListMapNoExtraKeys!1921 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21091 () Bool)

(declare-fun tp!40528 () Bool)

(declare-fun e!273813 () Bool)

(assert (=> mapNonEmpty!21091 (= mapRes!21091 (and tp!40528 e!273813))))

(declare-fun mapRest!21091 () (Array (_ BitVec 32) ValueCell!6123))

(declare-fun mapKey!21091 () (_ BitVec 32))

(declare-fun mapValue!21091 () ValueCell!6123)

(assert (=> mapNonEmpty!21091 (= (arr!14249 _values!833) (store mapRest!21091 mapKey!21091 mapValue!21091))))

(declare-fun b!467970 () Bool)

(assert (=> b!467970 (= e!273817 true)))

(declare-fun lt!211597 () ListLongMap!7463)

(declare-fun getCurrentListMap!2176 (array!29643 array!29645 (_ BitVec 32) (_ BitVec 32) V!18349 V!18349 (_ BitVec 32) Int) ListLongMap!7463)

(assert (=> b!467970 (= lt!211597 (getCurrentListMap!2176 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467971 () Bool)

(declare-fun res!279672 () Bool)

(assert (=> b!467971 (=> (not res!279672) (not e!273816))))

(assert (=> b!467971 (= res!279672 (and (= (size!14601 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14600 _keys!1025) (size!14601 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21091 () Bool)

(assert (=> mapIsEmpty!21091 mapRes!21091))

(declare-fun res!279676 () Bool)

(assert (=> start!41916 (=> (not res!279676) (not e!273816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41916 (= res!279676 (validMask!0 mask!1365))))

(assert (=> start!41916 e!273816))

(assert (=> start!41916 tp_is_empty!12933))

(assert (=> start!41916 tp!40527))

(assert (=> start!41916 true))

(declare-fun array_inv!10286 (array!29643) Bool)

(assert (=> start!41916 (array_inv!10286 _keys!1025)))

(declare-fun array_inv!10287 (array!29645) Bool)

(assert (=> start!41916 (and (array_inv!10287 _values!833) e!273814)))

(declare-fun b!467972 () Bool)

(declare-fun res!279673 () Bool)

(assert (=> b!467972 (=> (not res!279673) (not e!273816))))

(declare-datatypes ((List!8639 0))(
  ( (Nil!8636) (Cons!8635 (h!9491 (_ BitVec 64)) (t!14595 List!8639)) )
))
(declare-fun arrayNoDuplicates!0 (array!29643 (_ BitVec 32) List!8639) Bool)

(assert (=> b!467972 (= res!279673 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8636))))

(declare-fun b!467973 () Bool)

(assert (=> b!467973 (= e!273813 tp_is_empty!12933)))

(assert (= (and start!41916 res!279676) b!467971))

(assert (= (and b!467971 res!279672) b!467966))

(assert (= (and b!467966 res!279674) b!467972))

(assert (= (and b!467972 res!279673) b!467969))

(assert (= (and b!467969 (not res!279675)) b!467970))

(assert (= (and b!467968 condMapEmpty!21091) mapIsEmpty!21091))

(assert (= (and b!467968 (not condMapEmpty!21091)) mapNonEmpty!21091))

(get-info :version)

(assert (= (and mapNonEmpty!21091 ((_ is ValueCellFull!6123) mapValue!21091)) b!467973))

(assert (= (and b!467968 ((_ is ValueCellFull!6123) mapDefault!21091)) b!467967))

(assert (= start!41916 b!467968))

(declare-fun m!450029 () Bool)

(assert (=> mapNonEmpty!21091 m!450029))

(declare-fun m!450031 () Bool)

(assert (=> b!467970 m!450031))

(declare-fun m!450033 () Bool)

(assert (=> start!41916 m!450033))

(declare-fun m!450035 () Bool)

(assert (=> start!41916 m!450035))

(declare-fun m!450037 () Bool)

(assert (=> start!41916 m!450037))

(declare-fun m!450039 () Bool)

(assert (=> b!467969 m!450039))

(declare-fun m!450041 () Bool)

(assert (=> b!467969 m!450041))

(declare-fun m!450043 () Bool)

(assert (=> b!467969 m!450043))

(declare-fun m!450045 () Bool)

(assert (=> b!467972 m!450045))

(declare-fun m!450047 () Bool)

(assert (=> b!467966 m!450047))

(check-sat (not b_next!11505) (not start!41916) (not b!467966) tp_is_empty!12933 b_and!19893 (not b!467969) (not b!467970) (not b!467972) (not mapNonEmpty!21091))
(check-sat b_and!19893 (not b_next!11505))
