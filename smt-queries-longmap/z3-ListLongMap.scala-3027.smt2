; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42538 () Bool)

(assert start!42538)

(declare-fun b_free!11973 () Bool)

(declare-fun b_next!11973 () Bool)

(assert (=> start!42538 (= b_free!11973 (not b_next!11973))))

(declare-fun tp!41959 () Bool)

(declare-fun b_and!20453 () Bool)

(assert (=> start!42538 (= tp!41959 b_and!20453)))

(declare-fun b!474605 () Bool)

(declare-fun res!283455 () Bool)

(declare-fun e!278579 () Bool)

(assert (=> b!474605 (=> (not res!283455) (not e!278579))))

(declare-datatypes ((array!30549 0))(
  ( (array!30550 (arr!14692 (Array (_ BitVec 32) (_ BitVec 64))) (size!15044 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30549)

(declare-datatypes ((List!8970 0))(
  ( (Nil!8967) (Cons!8966 (h!9822 (_ BitVec 64)) (t!14944 List!8970)) )
))
(declare-fun arrayNoDuplicates!0 (array!30549 (_ BitVec 32) List!8970) Bool)

(assert (=> b!474605 (= res!283455 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8967))))

(declare-fun res!283458 () Bool)

(assert (=> start!42538 (=> (not res!283458) (not e!278579))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42538 (= res!283458 (validMask!0 mask!1365))))

(assert (=> start!42538 e!278579))

(declare-fun tp_is_empty!13401 () Bool)

(assert (=> start!42538 tp_is_empty!13401))

(assert (=> start!42538 tp!41959))

(assert (=> start!42538 true))

(declare-fun array_inv!10600 (array!30549) Bool)

(assert (=> start!42538 (array_inv!10600 _keys!1025)))

(declare-datatypes ((V!18973 0))(
  ( (V!18974 (val!6745 Int)) )
))
(declare-datatypes ((ValueCell!6357 0))(
  ( (ValueCellFull!6357 (v!9038 V!18973)) (EmptyCell!6357) )
))
(declare-datatypes ((array!30551 0))(
  ( (array!30552 (arr!14693 (Array (_ BitVec 32) ValueCell!6357)) (size!15045 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30551)

(declare-fun e!278580 () Bool)

(declare-fun array_inv!10601 (array!30551) Bool)

(assert (=> start!42538 (and (array_inv!10601 _values!833) e!278580)))

(declare-fun mapNonEmpty!21820 () Bool)

(declare-fun mapRes!21820 () Bool)

(declare-fun tp!41958 () Bool)

(declare-fun e!278581 () Bool)

(assert (=> mapNonEmpty!21820 (= mapRes!21820 (and tp!41958 e!278581))))

(declare-fun mapRest!21820 () (Array (_ BitVec 32) ValueCell!6357))

(declare-fun mapValue!21820 () ValueCell!6357)

(declare-fun mapKey!21820 () (_ BitVec 32))

(assert (=> mapNonEmpty!21820 (= (arr!14693 _values!833) (store mapRest!21820 mapKey!21820 mapValue!21820))))

(declare-fun b!474606 () Bool)

(declare-fun e!278583 () Bool)

(assert (=> b!474606 (= e!278583 tp_is_empty!13401)))

(declare-fun b!474607 () Bool)

(declare-fun res!283456 () Bool)

(assert (=> b!474607 (=> (not res!283456) (not e!278579))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474607 (= res!283456 (and (= (size!15045 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15044 _keys!1025) (size!15045 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474608 () Bool)

(assert (=> b!474608 (= e!278579 (not true))))

(declare-datatypes ((tuple2!8894 0))(
  ( (tuple2!8895 (_1!4458 (_ BitVec 64)) (_2!4458 V!18973)) )
))
(declare-datatypes ((List!8971 0))(
  ( (Nil!8968) (Cons!8967 (h!9823 tuple2!8894) (t!14945 List!8971)) )
))
(declare-datatypes ((ListLongMap!7807 0))(
  ( (ListLongMap!7808 (toList!3919 List!8971)) )
))
(declare-fun lt!216236 () ListLongMap!7807)

(declare-fun lt!216234 () ListLongMap!7807)

(assert (=> b!474608 (= lt!216236 lt!216234)))

(declare-datatypes ((Unit!13998 0))(
  ( (Unit!13999) )
))
(declare-fun lt!216235 () Unit!13998)

(declare-fun minValueBefore!38 () V!18973)

(declare-fun zeroValue!794 () V!18973)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18973)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!256 (array!30549 array!30551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18973 V!18973 V!18973 V!18973 (_ BitVec 32) Int) Unit!13998)

(assert (=> b!474608 (= lt!216235 (lemmaNoChangeToArrayThenSameMapNoExtras!256 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2076 (array!30549 array!30551 (_ BitVec 32) (_ BitVec 32) V!18973 V!18973 (_ BitVec 32) Int) ListLongMap!7807)

(assert (=> b!474608 (= lt!216234 (getCurrentListMapNoExtraKeys!2076 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474608 (= lt!216236 (getCurrentListMapNoExtraKeys!2076 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21820 () Bool)

(assert (=> mapIsEmpty!21820 mapRes!21820))

(declare-fun b!474609 () Bool)

(assert (=> b!474609 (= e!278580 (and e!278583 mapRes!21820))))

(declare-fun condMapEmpty!21820 () Bool)

(declare-fun mapDefault!21820 () ValueCell!6357)

(assert (=> b!474609 (= condMapEmpty!21820 (= (arr!14693 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6357)) mapDefault!21820)))))

(declare-fun b!474610 () Bool)

(declare-fun res!283457 () Bool)

(assert (=> b!474610 (=> (not res!283457) (not e!278579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30549 (_ BitVec 32)) Bool)

(assert (=> b!474610 (= res!283457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474611 () Bool)

(assert (=> b!474611 (= e!278581 tp_is_empty!13401)))

(assert (= (and start!42538 res!283458) b!474607))

(assert (= (and b!474607 res!283456) b!474610))

(assert (= (and b!474610 res!283457) b!474605))

(assert (= (and b!474605 res!283455) b!474608))

(assert (= (and b!474609 condMapEmpty!21820) mapIsEmpty!21820))

(assert (= (and b!474609 (not condMapEmpty!21820)) mapNonEmpty!21820))

(get-info :version)

(assert (= (and mapNonEmpty!21820 ((_ is ValueCellFull!6357) mapValue!21820)) b!474611))

(assert (= (and b!474609 ((_ is ValueCellFull!6357) mapDefault!21820)) b!474606))

(assert (= start!42538 b!474609))

(declare-fun m!456979 () Bool)

(assert (=> b!474608 m!456979))

(declare-fun m!456981 () Bool)

(assert (=> b!474608 m!456981))

(declare-fun m!456983 () Bool)

(assert (=> b!474608 m!456983))

(declare-fun m!456985 () Bool)

(assert (=> b!474610 m!456985))

(declare-fun m!456987 () Bool)

(assert (=> mapNonEmpty!21820 m!456987))

(declare-fun m!456989 () Bool)

(assert (=> b!474605 m!456989))

(declare-fun m!456991 () Bool)

(assert (=> start!42538 m!456991))

(declare-fun m!456993 () Bool)

(assert (=> start!42538 m!456993))

(declare-fun m!456995 () Bool)

(assert (=> start!42538 m!456995))

(check-sat tp_is_empty!13401 b_and!20453 (not start!42538) (not b!474605) (not b!474610) (not b!474608) (not b_next!11973) (not mapNonEmpty!21820))
(check-sat b_and!20453 (not b_next!11973))
