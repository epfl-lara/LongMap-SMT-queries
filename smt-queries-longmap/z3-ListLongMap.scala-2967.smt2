; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42060 () Bool)

(assert start!42060)

(declare-fun b_free!11613 () Bool)

(declare-fun b_next!11613 () Bool)

(assert (=> start!42060 (= b_free!11613 (not b_next!11613))))

(declare-fun tp!40858 () Bool)

(declare-fun b_and!20023 () Bool)

(assert (=> start!42060 (= tp!40858 b_and!20023)))

(declare-fun res!280620 () Bool)

(declare-fun e!274991 () Bool)

(assert (=> start!42060 (=> (not res!280620) (not e!274991))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42060 (= res!280620 (validMask!0 mask!1365))))

(assert (=> start!42060 e!274991))

(declare-fun tp_is_empty!13041 () Bool)

(assert (=> start!42060 tp_is_empty!13041))

(assert (=> start!42060 tp!40858))

(assert (=> start!42060 true))

(declare-datatypes ((array!29853 0))(
  ( (array!29854 (arr!14351 (Array (_ BitVec 32) (_ BitVec 64))) (size!14703 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29853)

(declare-fun array_inv!10358 (array!29853) Bool)

(assert (=> start!42060 (array_inv!10358 _keys!1025)))

(declare-datatypes ((V!18493 0))(
  ( (V!18494 (val!6565 Int)) )
))
(declare-datatypes ((ValueCell!6177 0))(
  ( (ValueCellFull!6177 (v!8855 V!18493)) (EmptyCell!6177) )
))
(declare-datatypes ((array!29855 0))(
  ( (array!29856 (arr!14352 (Array (_ BitVec 32) ValueCell!6177)) (size!14704 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29855)

(declare-fun e!274993 () Bool)

(declare-fun array_inv!10359 (array!29855) Bool)

(assert (=> start!42060 (and (array_inv!10359 _values!833) e!274993)))

(declare-fun b!469589 () Bool)

(declare-fun res!280621 () Bool)

(assert (=> b!469589 (=> (not res!280621) (not e!274991))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!469589 (= res!280621 (and (= (size!14704 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14703 _keys!1025) (size!14704 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469590 () Bool)

(declare-fun e!274990 () Bool)

(assert (=> b!469590 (= e!274990 true)))

(declare-datatypes ((tuple2!8642 0))(
  ( (tuple2!8643 (_1!4332 (_ BitVec 64)) (_2!4332 V!18493)) )
))
(declare-datatypes ((List!8721 0))(
  ( (Nil!8718) (Cons!8717 (h!9573 tuple2!8642) (t!14681 List!8721)) )
))
(declare-datatypes ((ListLongMap!7555 0))(
  ( (ListLongMap!7556 (toList!3793 List!8721)) )
))
(declare-fun lt!212842 () ListLongMap!7555)

(declare-fun lt!212844 () tuple2!8642)

(declare-fun minValueBefore!38 () V!18493)

(declare-fun +!1701 (ListLongMap!7555 tuple2!8642) ListLongMap!7555)

(assert (=> b!469590 (= (+!1701 lt!212842 lt!212844) (+!1701 (+!1701 lt!212842 (tuple2!8643 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212844))))

(declare-fun minValueAfter!38 () V!18493)

(assert (=> b!469590 (= lt!212844 (tuple2!8643 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13743 0))(
  ( (Unit!13744) )
))
(declare-fun lt!212841 () Unit!13743)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!114 (ListLongMap!7555 (_ BitVec 64) V!18493 V!18493) Unit!13743)

(assert (=> b!469590 (= lt!212841 (addSameAsAddTwiceSameKeyDiffValues!114 lt!212842 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212840 () ListLongMap!7555)

(declare-fun zeroValue!794 () V!18493)

(declare-fun getCurrentListMap!2215 (array!29853 array!29855 (_ BitVec 32) (_ BitVec 32) V!18493 V!18493 (_ BitVec 32) Int) ListLongMap!7555)

(assert (=> b!469590 (= lt!212840 (getCurrentListMap!2215 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212843 () ListLongMap!7555)

(assert (=> b!469590 (= lt!212843 (getCurrentListMap!2215 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469591 () Bool)

(declare-fun e!274992 () Bool)

(assert (=> b!469591 (= e!274992 tp_is_empty!13041)))

(declare-fun b!469592 () Bool)

(declare-fun e!274995 () Bool)

(assert (=> b!469592 (= e!274995 tp_is_empty!13041)))

(declare-fun mapNonEmpty!21259 () Bool)

(declare-fun mapRes!21259 () Bool)

(declare-fun tp!40857 () Bool)

(assert (=> mapNonEmpty!21259 (= mapRes!21259 (and tp!40857 e!274995))))

(declare-fun mapKey!21259 () (_ BitVec 32))

(declare-fun mapValue!21259 () ValueCell!6177)

(declare-fun mapRest!21259 () (Array (_ BitVec 32) ValueCell!6177))

(assert (=> mapNonEmpty!21259 (= (arr!14352 _values!833) (store mapRest!21259 mapKey!21259 mapValue!21259))))

(declare-fun mapIsEmpty!21259 () Bool)

(assert (=> mapIsEmpty!21259 mapRes!21259))

(declare-fun b!469593 () Bool)

(declare-fun res!280617 () Bool)

(assert (=> b!469593 (=> (not res!280617) (not e!274991))))

(declare-datatypes ((List!8722 0))(
  ( (Nil!8719) (Cons!8718 (h!9574 (_ BitVec 64)) (t!14682 List!8722)) )
))
(declare-fun arrayNoDuplicates!0 (array!29853 (_ BitVec 32) List!8722) Bool)

(assert (=> b!469593 (= res!280617 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8719))))

(declare-fun b!469594 () Bool)

(declare-fun res!280618 () Bool)

(assert (=> b!469594 (=> (not res!280618) (not e!274991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29853 (_ BitVec 32)) Bool)

(assert (=> b!469594 (= res!280618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469595 () Bool)

(assert (=> b!469595 (= e!274993 (and e!274992 mapRes!21259))))

(declare-fun condMapEmpty!21259 () Bool)

(declare-fun mapDefault!21259 () ValueCell!6177)

(assert (=> b!469595 (= condMapEmpty!21259 (= (arr!14352 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6177)) mapDefault!21259)))))

(declare-fun b!469596 () Bool)

(assert (=> b!469596 (= e!274991 (not e!274990))))

(declare-fun res!280619 () Bool)

(assert (=> b!469596 (=> res!280619 e!274990)))

(assert (=> b!469596 (= res!280619 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212846 () ListLongMap!7555)

(assert (=> b!469596 (= lt!212842 lt!212846)))

(declare-fun lt!212845 () Unit!13743)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!141 (array!29853 array!29855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18493 V!18493 V!18493 V!18493 (_ BitVec 32) Int) Unit!13743)

(assert (=> b!469596 (= lt!212845 (lemmaNoChangeToArrayThenSameMapNoExtras!141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1961 (array!29853 array!29855 (_ BitVec 32) (_ BitVec 32) V!18493 V!18493 (_ BitVec 32) Int) ListLongMap!7555)

(assert (=> b!469596 (= lt!212846 (getCurrentListMapNoExtraKeys!1961 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469596 (= lt!212842 (getCurrentListMapNoExtraKeys!1961 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42060 res!280620) b!469589))

(assert (= (and b!469589 res!280621) b!469594))

(assert (= (and b!469594 res!280618) b!469593))

(assert (= (and b!469593 res!280617) b!469596))

(assert (= (and b!469596 (not res!280619)) b!469590))

(assert (= (and b!469595 condMapEmpty!21259) mapIsEmpty!21259))

(assert (= (and b!469595 (not condMapEmpty!21259)) mapNonEmpty!21259))

(get-info :version)

(assert (= (and mapNonEmpty!21259 ((_ is ValueCellFull!6177) mapValue!21259)) b!469592))

(assert (= (and b!469595 ((_ is ValueCellFull!6177) mapDefault!21259)) b!469591))

(assert (= start!42060 b!469595))

(declare-fun m!451791 () Bool)

(assert (=> b!469596 m!451791))

(declare-fun m!451793 () Bool)

(assert (=> b!469596 m!451793))

(declare-fun m!451795 () Bool)

(assert (=> b!469596 m!451795))

(declare-fun m!451797 () Bool)

(assert (=> mapNonEmpty!21259 m!451797))

(declare-fun m!451799 () Bool)

(assert (=> start!42060 m!451799))

(declare-fun m!451801 () Bool)

(assert (=> start!42060 m!451801))

(declare-fun m!451803 () Bool)

(assert (=> start!42060 m!451803))

(declare-fun m!451805 () Bool)

(assert (=> b!469590 m!451805))

(declare-fun m!451807 () Bool)

(assert (=> b!469590 m!451807))

(declare-fun m!451809 () Bool)

(assert (=> b!469590 m!451809))

(declare-fun m!451811 () Bool)

(assert (=> b!469590 m!451811))

(declare-fun m!451813 () Bool)

(assert (=> b!469590 m!451813))

(declare-fun m!451815 () Bool)

(assert (=> b!469590 m!451815))

(assert (=> b!469590 m!451807))

(declare-fun m!451817 () Bool)

(assert (=> b!469594 m!451817))

(declare-fun m!451819 () Bool)

(assert (=> b!469593 m!451819))

(check-sat (not b!469593) (not mapNonEmpty!21259) tp_is_empty!13041 (not start!42060) (not b!469594) (not b!469590) (not b!469596) b_and!20023 (not b_next!11613))
(check-sat b_and!20023 (not b_next!11613))
