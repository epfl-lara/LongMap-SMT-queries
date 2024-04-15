; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42490 () Bool)

(assert start!42490)

(declare-fun b_free!11959 () Bool)

(declare-fun b_next!11959 () Bool)

(assert (=> start!42490 (= b_free!11959 (not b_next!11959))))

(declare-fun tp!41914 () Bool)

(declare-fun b_and!20401 () Bool)

(assert (=> start!42490 (= tp!41914 b_and!20401)))

(declare-fun mapIsEmpty!21796 () Bool)

(declare-fun mapRes!21796 () Bool)

(assert (=> mapIsEmpty!21796 mapRes!21796))

(declare-fun b!473990 () Bool)

(declare-fun e!278173 () Bool)

(declare-fun e!278174 () Bool)

(assert (=> b!473990 (= e!278173 (not e!278174))))

(declare-fun res!283147 () Bool)

(assert (=> b!473990 (=> res!283147 e!278174)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473990 (= res!283147 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18955 0))(
  ( (V!18956 (val!6738 Int)) )
))
(declare-datatypes ((tuple2!8938 0))(
  ( (tuple2!8939 (_1!4480 (_ BitVec 64)) (_2!4480 V!18955)) )
))
(declare-datatypes ((List!9001 0))(
  ( (Nil!8998) (Cons!8997 (h!9853 tuple2!8938) (t!14964 List!9001)) )
))
(declare-datatypes ((ListLongMap!7841 0))(
  ( (ListLongMap!7842 (toList!3936 List!9001)) )
))
(declare-fun lt!215706 () ListLongMap!7841)

(declare-fun lt!215704 () ListLongMap!7841)

(assert (=> b!473990 (= lt!215706 lt!215704)))

(declare-fun minValueBefore!38 () V!18955)

(declare-datatypes ((Unit!13968 0))(
  ( (Unit!13969) )
))
(declare-fun lt!215703 () Unit!13968)

(declare-fun zeroValue!794 () V!18955)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30509 0))(
  ( (array!30510 (arr!14673 (Array (_ BitVec 32) (_ BitVec 64))) (size!15026 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30509)

(declare-datatypes ((ValueCell!6350 0))(
  ( (ValueCellFull!6350 (v!9024 V!18955)) (EmptyCell!6350) )
))
(declare-datatypes ((array!30511 0))(
  ( (array!30512 (arr!14674 (Array (_ BitVec 32) ValueCell!6350)) (size!15027 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30511)

(declare-fun minValueAfter!38 () V!18955)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!260 (array!30509 array!30511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 V!18955 V!18955 (_ BitVec 32) Int) Unit!13968)

(assert (=> b!473990 (= lt!215703 (lemmaNoChangeToArrayThenSameMapNoExtras!260 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2103 (array!30509 array!30511 (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 (_ BitVec 32) Int) ListLongMap!7841)

(assert (=> b!473990 (= lt!215704 (getCurrentListMapNoExtraKeys!2103 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473990 (= lt!215706 (getCurrentListMapNoExtraKeys!2103 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473991 () Bool)

(declare-fun e!278171 () Bool)

(declare-fun e!278175 () Bool)

(assert (=> b!473991 (= e!278171 (and e!278175 mapRes!21796))))

(declare-fun condMapEmpty!21796 () Bool)

(declare-fun mapDefault!21796 () ValueCell!6350)

(assert (=> b!473991 (= condMapEmpty!21796 (= (arr!14674 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6350)) mapDefault!21796)))))

(declare-fun res!283149 () Bool)

(assert (=> start!42490 (=> (not res!283149) (not e!278173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42490 (= res!283149 (validMask!0 mask!1365))))

(assert (=> start!42490 e!278173))

(declare-fun tp_is_empty!13387 () Bool)

(assert (=> start!42490 tp_is_empty!13387))

(assert (=> start!42490 tp!41914))

(assert (=> start!42490 true))

(declare-fun array_inv!10670 (array!30509) Bool)

(assert (=> start!42490 (array_inv!10670 _keys!1025)))

(declare-fun array_inv!10671 (array!30511) Bool)

(assert (=> start!42490 (and (array_inv!10671 _values!833) e!278171)))

(declare-fun b!473992 () Bool)

(declare-fun e!278172 () Bool)

(assert (=> b!473992 (= e!278172 tp_is_empty!13387)))

(declare-fun b!473993 () Bool)

(assert (=> b!473993 (= e!278175 tp_is_empty!13387)))

(declare-fun b!473994 () Bool)

(declare-fun res!283151 () Bool)

(assert (=> b!473994 (=> (not res!283151) (not e!278173))))

(assert (=> b!473994 (= res!283151 (and (= (size!15027 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15026 _keys!1025) (size!15027 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473995 () Bool)

(assert (=> b!473995 (= e!278174 true)))

(declare-fun lt!215709 () ListLongMap!7841)

(declare-fun lt!215702 () tuple2!8938)

(declare-fun +!1783 (ListLongMap!7841 tuple2!8938) ListLongMap!7841)

(assert (=> b!473995 (= (+!1783 lt!215709 lt!215702) (+!1783 (+!1783 lt!215709 (tuple2!8939 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215702))))

(assert (=> b!473995 (= lt!215702 (tuple2!8939 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215705 () Unit!13968)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!162 (ListLongMap!7841 (_ BitVec 64) V!18955 V!18955) Unit!13968)

(assert (=> b!473995 (= lt!215705 (addSameAsAddTwiceSameKeyDiffValues!162 lt!215709 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473995 (= lt!215709 (+!1783 lt!215706 (tuple2!8939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215708 () ListLongMap!7841)

(declare-fun getCurrentListMap!2235 (array!30509 array!30511 (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 (_ BitVec 32) Int) ListLongMap!7841)

(assert (=> b!473995 (= lt!215708 (getCurrentListMap!2235 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215707 () ListLongMap!7841)

(assert (=> b!473995 (= lt!215707 (getCurrentListMap!2235 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21796 () Bool)

(declare-fun tp!41913 () Bool)

(assert (=> mapNonEmpty!21796 (= mapRes!21796 (and tp!41913 e!278172))))

(declare-fun mapValue!21796 () ValueCell!6350)

(declare-fun mapKey!21796 () (_ BitVec 32))

(declare-fun mapRest!21796 () (Array (_ BitVec 32) ValueCell!6350))

(assert (=> mapNonEmpty!21796 (= (arr!14674 _values!833) (store mapRest!21796 mapKey!21796 mapValue!21796))))

(declare-fun b!473996 () Bool)

(declare-fun res!283148 () Bool)

(assert (=> b!473996 (=> (not res!283148) (not e!278173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30509 (_ BitVec 32)) Bool)

(assert (=> b!473996 (= res!283148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473997 () Bool)

(declare-fun res!283150 () Bool)

(assert (=> b!473997 (=> (not res!283150) (not e!278173))))

(declare-datatypes ((List!9002 0))(
  ( (Nil!8999) (Cons!8998 (h!9854 (_ BitVec 64)) (t!14965 List!9002)) )
))
(declare-fun arrayNoDuplicates!0 (array!30509 (_ BitVec 32) List!9002) Bool)

(assert (=> b!473997 (= res!283150 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8999))))

(assert (= (and start!42490 res!283149) b!473994))

(assert (= (and b!473994 res!283151) b!473996))

(assert (= (and b!473996 res!283148) b!473997))

(assert (= (and b!473997 res!283150) b!473990))

(assert (= (and b!473990 (not res!283147)) b!473995))

(assert (= (and b!473991 condMapEmpty!21796) mapIsEmpty!21796))

(assert (= (and b!473991 (not condMapEmpty!21796)) mapNonEmpty!21796))

(get-info :version)

(assert (= (and mapNonEmpty!21796 ((_ is ValueCellFull!6350) mapValue!21796)) b!473992))

(assert (= (and b!473991 ((_ is ValueCellFull!6350) mapDefault!21796)) b!473993))

(assert (= start!42490 b!473991))

(declare-fun m!455823 () Bool)

(assert (=> b!473997 m!455823))

(declare-fun m!455825 () Bool)

(assert (=> start!42490 m!455825))

(declare-fun m!455827 () Bool)

(assert (=> start!42490 m!455827))

(declare-fun m!455829 () Bool)

(assert (=> start!42490 m!455829))

(declare-fun m!455831 () Bool)

(assert (=> b!473996 m!455831))

(declare-fun m!455833 () Bool)

(assert (=> b!473990 m!455833))

(declare-fun m!455835 () Bool)

(assert (=> b!473990 m!455835))

(declare-fun m!455837 () Bool)

(assert (=> b!473990 m!455837))

(declare-fun m!455839 () Bool)

(assert (=> b!473995 m!455839))

(declare-fun m!455841 () Bool)

(assert (=> b!473995 m!455841))

(declare-fun m!455843 () Bool)

(assert (=> b!473995 m!455843))

(declare-fun m!455845 () Bool)

(assert (=> b!473995 m!455845))

(assert (=> b!473995 m!455843))

(declare-fun m!455847 () Bool)

(assert (=> b!473995 m!455847))

(declare-fun m!455849 () Bool)

(assert (=> b!473995 m!455849))

(declare-fun m!455851 () Bool)

(assert (=> b!473995 m!455851))

(declare-fun m!455853 () Bool)

(assert (=> mapNonEmpty!21796 m!455853))

(check-sat b_and!20401 (not b!473996) (not start!42490) tp_is_empty!13387 (not b!473990) (not b_next!11959) (not b!473995) (not mapNonEmpty!21796) (not b!473997))
(check-sat b_and!20401 (not b_next!11959))
