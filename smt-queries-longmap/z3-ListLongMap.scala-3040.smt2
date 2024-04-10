; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42646 () Bool)

(assert start!42646)

(declare-fun b_free!12051 () Bool)

(declare-fun b_next!12051 () Bool)

(assert (=> start!42646 (= b_free!12051 (not b_next!12051))))

(declare-fun tp!42198 () Bool)

(declare-fun b_and!20551 () Bool)

(assert (=> start!42646 (= tp!42198 b_and!20551)))

(declare-fun b!475698 () Bool)

(declare-fun res!284041 () Bool)

(declare-fun e!279343 () Bool)

(assert (=> b!475698 (=> (not res!284041) (not e!279343))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30697 0))(
  ( (array!30698 (arr!14764 (Array (_ BitVec 32) (_ BitVec 64))) (size!15116 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30697)

(declare-datatypes ((V!19077 0))(
  ( (V!19078 (val!6784 Int)) )
))
(declare-datatypes ((ValueCell!6396 0))(
  ( (ValueCellFull!6396 (v!9078 V!19077)) (EmptyCell!6396) )
))
(declare-datatypes ((array!30699 0))(
  ( (array!30700 (arr!14765 (Array (_ BitVec 32) ValueCell!6396)) (size!15117 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30699)

(assert (=> b!475698 (= res!284041 (and (= (size!15117 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15116 _keys!1025) (size!15117 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21943 () Bool)

(declare-fun mapRes!21943 () Bool)

(assert (=> mapIsEmpty!21943 mapRes!21943))

(declare-fun mapNonEmpty!21943 () Bool)

(declare-fun tp!42199 () Bool)

(declare-fun e!279347 () Bool)

(assert (=> mapNonEmpty!21943 (= mapRes!21943 (and tp!42199 e!279347))))

(declare-fun mapValue!21943 () ValueCell!6396)

(declare-fun mapKey!21943 () (_ BitVec 32))

(declare-fun mapRest!21943 () (Array (_ BitVec 32) ValueCell!6396))

(assert (=> mapNonEmpty!21943 (= (arr!14765 _values!833) (store mapRest!21943 mapKey!21943 mapValue!21943))))

(declare-fun b!475699 () Bool)

(declare-fun res!284044 () Bool)

(assert (=> b!475699 (=> (not res!284044) (not e!279343))))

(declare-datatypes ((List!9023 0))(
  ( (Nil!9020) (Cons!9019 (h!9875 (_ BitVec 64)) (t!15001 List!9023)) )
))
(declare-fun arrayNoDuplicates!0 (array!30697 (_ BitVec 32) List!9023) Bool)

(assert (=> b!475699 (= res!284044 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9020))))

(declare-fun b!475700 () Bool)

(declare-fun e!279345 () Bool)

(declare-fun e!279346 () Bool)

(assert (=> b!475700 (= e!279345 (and e!279346 mapRes!21943))))

(declare-fun condMapEmpty!21943 () Bool)

(declare-fun mapDefault!21943 () ValueCell!6396)

(assert (=> b!475700 (= condMapEmpty!21943 (= (arr!14765 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6396)) mapDefault!21943)))))

(declare-fun b!475701 () Bool)

(declare-fun tp_is_empty!13479 () Bool)

(assert (=> b!475701 (= e!279346 tp_is_empty!13479)))

(declare-fun b!475702 () Bool)

(declare-fun res!284042 () Bool)

(assert (=> b!475702 (=> (not res!284042) (not e!279343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30697 (_ BitVec 32)) Bool)

(assert (=> b!475702 (= res!284042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475703 () Bool)

(declare-fun e!279344 () Bool)

(assert (=> b!475703 (= e!279343 (not e!279344))))

(declare-fun res!284043 () Bool)

(assert (=> b!475703 (=> res!284043 e!279344)))

(assert (=> b!475703 (= res!284043 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8946 0))(
  ( (tuple2!8947 (_1!4484 (_ BitVec 64)) (_2!4484 V!19077)) )
))
(declare-datatypes ((List!9024 0))(
  ( (Nil!9021) (Cons!9020 (h!9876 tuple2!8946) (t!15002 List!9024)) )
))
(declare-datatypes ((ListLongMap!7859 0))(
  ( (ListLongMap!7860 (toList!3945 List!9024)) )
))
(declare-fun lt!216676 () ListLongMap!7859)

(declare-fun lt!216673 () ListLongMap!7859)

(assert (=> b!475703 (= lt!216676 lt!216673)))

(declare-fun minValueBefore!38 () V!19077)

(declare-fun zeroValue!794 () V!19077)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!14012 0))(
  ( (Unit!14013) )
))
(declare-fun lt!216675 () Unit!14012)

(declare-fun minValueAfter!38 () V!19077)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!261 (array!30697 array!30699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19077 V!19077 V!19077 V!19077 (_ BitVec 32) Int) Unit!14012)

(assert (=> b!475703 (= lt!216675 (lemmaNoChangeToArrayThenSameMapNoExtras!261 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2101 (array!30697 array!30699 (_ BitVec 32) (_ BitVec 32) V!19077 V!19077 (_ BitVec 32) Int) ListLongMap!7859)

(assert (=> b!475703 (= lt!216673 (getCurrentListMapNoExtraKeys!2101 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475703 (= lt!216676 (getCurrentListMapNoExtraKeys!2101 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!284045 () Bool)

(assert (=> start!42646 (=> (not res!284045) (not e!279343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42646 (= res!284045 (validMask!0 mask!1365))))

(assert (=> start!42646 e!279343))

(assert (=> start!42646 tp_is_empty!13479))

(assert (=> start!42646 tp!42198))

(assert (=> start!42646 true))

(declare-fun array_inv!10654 (array!30697) Bool)

(assert (=> start!42646 (array_inv!10654 _keys!1025)))

(declare-fun array_inv!10655 (array!30699) Bool)

(assert (=> start!42646 (and (array_inv!10655 _values!833) e!279345)))

(declare-fun b!475704 () Bool)

(assert (=> b!475704 (= e!279344 true)))

(declare-fun lt!216677 () ListLongMap!7859)

(declare-fun getCurrentListMap!2287 (array!30697 array!30699 (_ BitVec 32) (_ BitVec 32) V!19077 V!19077 (_ BitVec 32) Int) ListLongMap!7859)

(assert (=> b!475704 (= lt!216677 (getCurrentListMap!2287 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216674 () ListLongMap!7859)

(declare-fun +!1759 (ListLongMap!7859 tuple2!8946) ListLongMap!7859)

(assert (=> b!475704 (= lt!216674 (+!1759 (getCurrentListMap!2287 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8947 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475705 () Bool)

(assert (=> b!475705 (= e!279347 tp_is_empty!13479)))

(assert (= (and start!42646 res!284045) b!475698))

(assert (= (and b!475698 res!284041) b!475702))

(assert (= (and b!475702 res!284042) b!475699))

(assert (= (and b!475699 res!284044) b!475703))

(assert (= (and b!475703 (not res!284043)) b!475704))

(assert (= (and b!475700 condMapEmpty!21943) mapIsEmpty!21943))

(assert (= (and b!475700 (not condMapEmpty!21943)) mapNonEmpty!21943))

(get-info :version)

(assert (= (and mapNonEmpty!21943 ((_ is ValueCellFull!6396) mapValue!21943)) b!475705))

(assert (= (and b!475700 ((_ is ValueCellFull!6396) mapDefault!21943)) b!475701))

(assert (= start!42646 b!475700))

(declare-fun m!457873 () Bool)

(assert (=> b!475699 m!457873))

(declare-fun m!457875 () Bool)

(assert (=> b!475703 m!457875))

(declare-fun m!457877 () Bool)

(assert (=> b!475703 m!457877))

(declare-fun m!457879 () Bool)

(assert (=> b!475703 m!457879))

(declare-fun m!457881 () Bool)

(assert (=> b!475702 m!457881))

(declare-fun m!457883 () Bool)

(assert (=> mapNonEmpty!21943 m!457883))

(declare-fun m!457885 () Bool)

(assert (=> start!42646 m!457885))

(declare-fun m!457887 () Bool)

(assert (=> start!42646 m!457887))

(declare-fun m!457889 () Bool)

(assert (=> start!42646 m!457889))

(declare-fun m!457891 () Bool)

(assert (=> b!475704 m!457891))

(declare-fun m!457893 () Bool)

(assert (=> b!475704 m!457893))

(assert (=> b!475704 m!457893))

(declare-fun m!457895 () Bool)

(assert (=> b!475704 m!457895))

(check-sat (not b!475699) b_and!20551 (not b!475702) (not b!475704) (not b!475703) (not b_next!12051) tp_is_empty!13479 (not mapNonEmpty!21943) (not start!42646))
(check-sat b_and!20551 (not b_next!12051))
