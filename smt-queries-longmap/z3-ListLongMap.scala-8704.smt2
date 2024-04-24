; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105882 () Bool)

(assert start!105882)

(declare-fun b_free!27259 () Bool)

(declare-fun b_next!27259 () Bool)

(assert (=> start!105882 (= b_free!27259 (not b_next!27259))))

(declare-fun tp!95299 () Bool)

(declare-fun b_and!45135 () Bool)

(assert (=> start!105882 (= tp!95299 b_and!45135)))

(declare-fun b!1259890 () Bool)

(declare-fun res!839381 () Bool)

(declare-fun e!716693 () Bool)

(assert (=> b!1259890 (=> (not res!839381) (not e!716693))))

(declare-datatypes ((array!81995 0))(
  ( (array!81996 (arr!39549 (Array (_ BitVec 32) (_ BitVec 64))) (size!40086 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81995)

(declare-datatypes ((List!28107 0))(
  ( (Nil!28104) (Cons!28103 (h!29321 (_ BitVec 64)) (t!41592 List!28107)) )
))
(declare-fun arrayNoDuplicates!0 (array!81995 (_ BitVec 32) List!28107) Bool)

(assert (=> b!1259890 (= res!839381 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28104))))

(declare-fun b!1259891 () Bool)

(declare-fun e!716694 () Bool)

(assert (=> b!1259891 (= e!716694 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48247 0))(
  ( (V!48248 (val!16143 Int)) )
))
(declare-datatypes ((tuple2!20878 0))(
  ( (tuple2!20879 (_1!10450 (_ BitVec 64)) (_2!10450 V!48247)) )
))
(declare-datatypes ((List!28108 0))(
  ( (Nil!28105) (Cons!28104 (h!29322 tuple2!20878) (t!41593 List!28108)) )
))
(declare-datatypes ((ListLongMap!18759 0))(
  ( (ListLongMap!18760 (toList!9395 List!28108)) )
))
(declare-fun lt!569762 () ListLongMap!18759)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48247)

(declare-datatypes ((ValueCell!15317 0))(
  ( (ValueCellFull!15317 (v!18841 V!48247)) (EmptyCell!15317) )
))
(declare-datatypes ((array!81997 0))(
  ( (array!81998 (arr!39550 (Array (_ BitVec 32) ValueCell!15317)) (size!40087 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81997)

(declare-fun minValueBefore!43 () V!48247)

(declare-fun getCurrentListMap!4582 (array!81995 array!81997 (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 (_ BitVec 32) Int) ListLongMap!18759)

(assert (=> b!1259891 (= lt!569762 (getCurrentListMap!4582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259892 () Bool)

(declare-fun e!716690 () Bool)

(declare-fun tp_is_empty!32161 () Bool)

(assert (=> b!1259892 (= e!716690 tp_is_empty!32161)))

(declare-fun b!1259893 () Bool)

(assert (=> b!1259893 (= e!716693 (not e!716694))))

(declare-fun res!839379 () Bool)

(assert (=> b!1259893 (=> res!839379 e!716694)))

(assert (=> b!1259893 (= res!839379 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569760 () ListLongMap!18759)

(declare-fun lt!569761 () ListLongMap!18759)

(assert (=> b!1259893 (= lt!569760 lt!569761)))

(declare-datatypes ((Unit!41931 0))(
  ( (Unit!41932) )
))
(declare-fun lt!569759 () Unit!41931)

(declare-fun minValueAfter!43 () V!48247)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1124 (array!81995 array!81997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 V!48247 V!48247 (_ BitVec 32) Int) Unit!41931)

(assert (=> b!1259893 (= lt!569759 (lemmaNoChangeToArrayThenSameMapNoExtras!1124 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5810 (array!81995 array!81997 (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 (_ BitVec 32) Int) ListLongMap!18759)

(assert (=> b!1259893 (= lt!569761 (getCurrentListMapNoExtraKeys!5810 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259893 (= lt!569760 (getCurrentListMapNoExtraKeys!5810 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259894 () Bool)

(declare-fun res!839382 () Bool)

(assert (=> b!1259894 (=> (not res!839382) (not e!716693))))

(assert (=> b!1259894 (= res!839382 (and (= (size!40087 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40086 _keys!1118) (size!40087 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259895 () Bool)

(declare-fun e!716689 () Bool)

(assert (=> b!1259895 (= e!716689 tp_is_empty!32161)))

(declare-fun b!1259896 () Bool)

(declare-fun e!716692 () Bool)

(declare-fun mapRes!50035 () Bool)

(assert (=> b!1259896 (= e!716692 (and e!716690 mapRes!50035))))

(declare-fun condMapEmpty!50035 () Bool)

(declare-fun mapDefault!50035 () ValueCell!15317)

(assert (=> b!1259896 (= condMapEmpty!50035 (= (arr!39550 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15317)) mapDefault!50035)))))

(declare-fun mapNonEmpty!50035 () Bool)

(declare-fun tp!95300 () Bool)

(assert (=> mapNonEmpty!50035 (= mapRes!50035 (and tp!95300 e!716689))))

(declare-fun mapValue!50035 () ValueCell!15317)

(declare-fun mapKey!50035 () (_ BitVec 32))

(declare-fun mapRest!50035 () (Array (_ BitVec 32) ValueCell!15317))

(assert (=> mapNonEmpty!50035 (= (arr!39550 _values!914) (store mapRest!50035 mapKey!50035 mapValue!50035))))

(declare-fun b!1259897 () Bool)

(declare-fun res!839380 () Bool)

(assert (=> b!1259897 (=> (not res!839380) (not e!716693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81995 (_ BitVec 32)) Bool)

(assert (=> b!1259897 (= res!839380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!839378 () Bool)

(assert (=> start!105882 (=> (not res!839378) (not e!716693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105882 (= res!839378 (validMask!0 mask!1466))))

(assert (=> start!105882 e!716693))

(assert (=> start!105882 true))

(assert (=> start!105882 tp!95299))

(assert (=> start!105882 tp_is_empty!32161))

(declare-fun array_inv!30261 (array!81995) Bool)

(assert (=> start!105882 (array_inv!30261 _keys!1118)))

(declare-fun array_inv!30262 (array!81997) Bool)

(assert (=> start!105882 (and (array_inv!30262 _values!914) e!716692)))

(declare-fun mapIsEmpty!50035 () Bool)

(assert (=> mapIsEmpty!50035 mapRes!50035))

(assert (= (and start!105882 res!839378) b!1259894))

(assert (= (and b!1259894 res!839382) b!1259897))

(assert (= (and b!1259897 res!839380) b!1259890))

(assert (= (and b!1259890 res!839381) b!1259893))

(assert (= (and b!1259893 (not res!839379)) b!1259891))

(assert (= (and b!1259896 condMapEmpty!50035) mapIsEmpty!50035))

(assert (= (and b!1259896 (not condMapEmpty!50035)) mapNonEmpty!50035))

(get-info :version)

(assert (= (and mapNonEmpty!50035 ((_ is ValueCellFull!15317) mapValue!50035)) b!1259895))

(assert (= (and b!1259896 ((_ is ValueCellFull!15317) mapDefault!50035)) b!1259892))

(assert (= start!105882 b!1259896))

(declare-fun m!1160601 () Bool)

(assert (=> b!1259890 m!1160601))

(declare-fun m!1160603 () Bool)

(assert (=> b!1259893 m!1160603))

(declare-fun m!1160605 () Bool)

(assert (=> b!1259893 m!1160605))

(declare-fun m!1160607 () Bool)

(assert (=> b!1259893 m!1160607))

(declare-fun m!1160609 () Bool)

(assert (=> start!105882 m!1160609))

(declare-fun m!1160611 () Bool)

(assert (=> start!105882 m!1160611))

(declare-fun m!1160613 () Bool)

(assert (=> start!105882 m!1160613))

(declare-fun m!1160615 () Bool)

(assert (=> b!1259891 m!1160615))

(declare-fun m!1160617 () Bool)

(assert (=> b!1259897 m!1160617))

(declare-fun m!1160619 () Bool)

(assert (=> mapNonEmpty!50035 m!1160619))

(check-sat b_and!45135 (not b!1259891) (not b!1259897) tp_is_empty!32161 (not b!1259890) (not mapNonEmpty!50035) (not b!1259893) (not start!105882) (not b_next!27259))
(check-sat b_and!45135 (not b_next!27259))
