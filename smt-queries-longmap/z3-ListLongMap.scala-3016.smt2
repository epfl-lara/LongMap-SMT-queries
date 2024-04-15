; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42416 () Bool)

(assert start!42416)

(declare-fun b_free!11905 () Bool)

(declare-fun b_next!11905 () Bool)

(assert (=> start!42416 (= b_free!11905 (not b_next!11905))))

(declare-fun tp!41749 () Bool)

(declare-fun b_and!20335 () Bool)

(assert (=> start!42416 (= tp!41749 b_and!20335)))

(declare-fun b!473161 () Bool)

(declare-fun res!282666 () Bool)

(declare-fun e!277573 () Bool)

(assert (=> b!473161 (=> (not res!282666) (not e!277573))))

(declare-datatypes ((array!30403 0))(
  ( (array!30404 (arr!14621 (Array (_ BitVec 32) (_ BitVec 64))) (size!14974 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30403)

(declare-datatypes ((List!8959 0))(
  ( (Nil!8956) (Cons!8955 (h!9811 (_ BitVec 64)) (t!14920 List!8959)) )
))
(declare-fun arrayNoDuplicates!0 (array!30403 (_ BitVec 32) List!8959) Bool)

(assert (=> b!473161 (= res!282666 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8956))))

(declare-fun res!282665 () Bool)

(assert (=> start!42416 (=> (not res!282665) (not e!277573))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42416 (= res!282665 (validMask!0 mask!1365))))

(assert (=> start!42416 e!277573))

(declare-fun tp_is_empty!13333 () Bool)

(assert (=> start!42416 tp_is_empty!13333))

(assert (=> start!42416 tp!41749))

(assert (=> start!42416 true))

(declare-fun array_inv!10636 (array!30403) Bool)

(assert (=> start!42416 (array_inv!10636 _keys!1025)))

(declare-datatypes ((V!18883 0))(
  ( (V!18884 (val!6711 Int)) )
))
(declare-datatypes ((ValueCell!6323 0))(
  ( (ValueCellFull!6323 (v!8996 V!18883)) (EmptyCell!6323) )
))
(declare-datatypes ((array!30405 0))(
  ( (array!30406 (arr!14622 (Array (_ BitVec 32) ValueCell!6323)) (size!14975 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30405)

(declare-fun e!277574 () Bool)

(declare-fun array_inv!10637 (array!30405) Bool)

(assert (=> start!42416 (and (array_inv!10637 _values!833) e!277574)))

(declare-fun b!473162 () Bool)

(declare-fun res!282667 () Bool)

(assert (=> b!473162 (=> (not res!282667) (not e!277573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30403 (_ BitVec 32)) Bool)

(assert (=> b!473162 (= res!282667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473163 () Bool)

(declare-fun e!277577 () Bool)

(assert (=> b!473163 (= e!277577 tp_is_empty!13333)))

(declare-fun b!473164 () Bool)

(declare-fun e!277572 () Bool)

(assert (=> b!473164 (= e!277573 (not e!277572))))

(declare-fun res!282663 () Bool)

(assert (=> b!473164 (=> res!282663 e!277572)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473164 (= res!282663 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8892 0))(
  ( (tuple2!8893 (_1!4457 (_ BitVec 64)) (_2!4457 V!18883)) )
))
(declare-datatypes ((List!8960 0))(
  ( (Nil!8957) (Cons!8956 (h!9812 tuple2!8892) (t!14921 List!8960)) )
))
(declare-datatypes ((ListLongMap!7795 0))(
  ( (ListLongMap!7796 (toList!3913 List!8960)) )
))
(declare-fun lt!214899 () ListLongMap!7795)

(declare-fun lt!214904 () ListLongMap!7795)

(assert (=> b!473164 (= lt!214899 lt!214904)))

(declare-fun minValueBefore!38 () V!18883)

(declare-fun zeroValue!794 () V!18883)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13920 0))(
  ( (Unit!13921) )
))
(declare-fun lt!214906 () Unit!13920)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18883)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!239 (array!30403 array!30405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18883 V!18883 V!18883 V!18883 (_ BitVec 32) Int) Unit!13920)

(assert (=> b!473164 (= lt!214906 (lemmaNoChangeToArrayThenSameMapNoExtras!239 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2082 (array!30403 array!30405 (_ BitVec 32) (_ BitVec 32) V!18883 V!18883 (_ BitVec 32) Int) ListLongMap!7795)

(assert (=> b!473164 (= lt!214904 (getCurrentListMapNoExtraKeys!2082 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473164 (= lt!214899 (getCurrentListMapNoExtraKeys!2082 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473165 () Bool)

(assert (=> b!473165 (= e!277572 true)))

(declare-fun lt!214901 () ListLongMap!7795)

(declare-fun lt!214900 () tuple2!8892)

(declare-fun +!1765 (ListLongMap!7795 tuple2!8892) ListLongMap!7795)

(assert (=> b!473165 (= (+!1765 lt!214901 lt!214900) (+!1765 (+!1765 lt!214901 (tuple2!8893 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214900))))

(assert (=> b!473165 (= lt!214900 (tuple2!8893 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214903 () Unit!13920)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!144 (ListLongMap!7795 (_ BitVec 64) V!18883 V!18883) Unit!13920)

(assert (=> b!473165 (= lt!214903 (addSameAsAddTwiceSameKeyDiffValues!144 lt!214901 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473165 (= lt!214901 (+!1765 lt!214899 (tuple2!8893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214905 () ListLongMap!7795)

(declare-fun getCurrentListMap!2217 (array!30403 array!30405 (_ BitVec 32) (_ BitVec 32) V!18883 V!18883 (_ BitVec 32) Int) ListLongMap!7795)

(assert (=> b!473165 (= lt!214905 (getCurrentListMap!2217 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214902 () ListLongMap!7795)

(assert (=> b!473165 (= lt!214902 (getCurrentListMap!2217 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473166 () Bool)

(declare-fun e!277576 () Bool)

(declare-fun mapRes!21712 () Bool)

(assert (=> b!473166 (= e!277574 (and e!277576 mapRes!21712))))

(declare-fun condMapEmpty!21712 () Bool)

(declare-fun mapDefault!21712 () ValueCell!6323)

(assert (=> b!473166 (= condMapEmpty!21712 (= (arr!14622 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6323)) mapDefault!21712)))))

(declare-fun mapNonEmpty!21712 () Bool)

(declare-fun tp!41748 () Bool)

(assert (=> mapNonEmpty!21712 (= mapRes!21712 (and tp!41748 e!277577))))

(declare-fun mapValue!21712 () ValueCell!6323)

(declare-fun mapRest!21712 () (Array (_ BitVec 32) ValueCell!6323))

(declare-fun mapKey!21712 () (_ BitVec 32))

(assert (=> mapNonEmpty!21712 (= (arr!14622 _values!833) (store mapRest!21712 mapKey!21712 mapValue!21712))))

(declare-fun b!473167 () Bool)

(declare-fun res!282664 () Bool)

(assert (=> b!473167 (=> (not res!282664) (not e!277573))))

(assert (=> b!473167 (= res!282664 (and (= (size!14975 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14974 _keys!1025) (size!14975 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21712 () Bool)

(assert (=> mapIsEmpty!21712 mapRes!21712))

(declare-fun b!473168 () Bool)

(assert (=> b!473168 (= e!277576 tp_is_empty!13333)))

(assert (= (and start!42416 res!282665) b!473167))

(assert (= (and b!473167 res!282664) b!473162))

(assert (= (and b!473162 res!282667) b!473161))

(assert (= (and b!473161 res!282666) b!473164))

(assert (= (and b!473164 (not res!282663)) b!473165))

(assert (= (and b!473166 condMapEmpty!21712) mapIsEmpty!21712))

(assert (= (and b!473166 (not condMapEmpty!21712)) mapNonEmpty!21712))

(get-info :version)

(assert (= (and mapNonEmpty!21712 ((_ is ValueCellFull!6323) mapValue!21712)) b!473163))

(assert (= (and b!473166 ((_ is ValueCellFull!6323) mapDefault!21712)) b!473168))

(assert (= start!42416 b!473166))

(declare-fun m!454747 () Bool)

(assert (=> b!473161 m!454747))

(declare-fun m!454749 () Bool)

(assert (=> b!473165 m!454749))

(declare-fun m!454751 () Bool)

(assert (=> b!473165 m!454751))

(assert (=> b!473165 m!454749))

(declare-fun m!454753 () Bool)

(assert (=> b!473165 m!454753))

(declare-fun m!454755 () Bool)

(assert (=> b!473165 m!454755))

(declare-fun m!454757 () Bool)

(assert (=> b!473165 m!454757))

(declare-fun m!454759 () Bool)

(assert (=> b!473165 m!454759))

(declare-fun m!454761 () Bool)

(assert (=> b!473165 m!454761))

(declare-fun m!454763 () Bool)

(assert (=> b!473164 m!454763))

(declare-fun m!454765 () Bool)

(assert (=> b!473164 m!454765))

(declare-fun m!454767 () Bool)

(assert (=> b!473164 m!454767))

(declare-fun m!454769 () Bool)

(assert (=> mapNonEmpty!21712 m!454769))

(declare-fun m!454771 () Bool)

(assert (=> b!473162 m!454771))

(declare-fun m!454773 () Bool)

(assert (=> start!42416 m!454773))

(declare-fun m!454775 () Bool)

(assert (=> start!42416 m!454775))

(declare-fun m!454777 () Bool)

(assert (=> start!42416 m!454777))

(check-sat (not b!473161) (not b!473162) b_and!20335 tp_is_empty!13333 (not b!473164) (not b!473165) (not b_next!11905) (not mapNonEmpty!21712) (not start!42416))
(check-sat b_and!20335 (not b_next!11905))
