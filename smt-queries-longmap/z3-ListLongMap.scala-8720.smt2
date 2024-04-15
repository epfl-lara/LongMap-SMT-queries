; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105788 () Bool)

(assert start!105788)

(declare-fun b_free!27355 () Bool)

(declare-fun b_next!27355 () Bool)

(assert (=> start!105788 (= b_free!27355 (not b_next!27355))))

(declare-fun tp!95594 () Bool)

(declare-fun b_and!45233 () Bool)

(assert (=> start!105788 (= tp!95594 b_and!45233)))

(declare-fun mapIsEmpty!50185 () Bool)

(declare-fun mapRes!50185 () Bool)

(assert (=> mapIsEmpty!50185 mapRes!50185))

(declare-fun b!1260119 () Bool)

(declare-fun res!839810 () Bool)

(declare-fun e!717010 () Bool)

(assert (=> b!1260119 (=> (not res!839810) (not e!717010))))

(declare-datatypes ((array!82057 0))(
  ( (array!82058 (arr!39583 (Array (_ BitVec 32) (_ BitVec 64))) (size!40121 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82057)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82057 (_ BitVec 32)) Bool)

(assert (=> b!1260119 (= res!839810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260120 () Bool)

(declare-fun e!717007 () Bool)

(declare-fun tp_is_empty!32257 () Bool)

(assert (=> b!1260120 (= e!717007 tp_is_empty!32257)))

(declare-fun b!1260121 () Bool)

(declare-fun res!839814 () Bool)

(assert (=> b!1260121 (=> (not res!839814) (not e!717010))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48375 0))(
  ( (V!48376 (val!16191 Int)) )
))
(declare-datatypes ((ValueCell!15365 0))(
  ( (ValueCellFull!15365 (v!18893 V!48375)) (EmptyCell!15365) )
))
(declare-datatypes ((array!82059 0))(
  ( (array!82060 (arr!39584 (Array (_ BitVec 32) ValueCell!15365)) (size!40122 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82059)

(assert (=> b!1260121 (= res!839814 (and (= (size!40122 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40121 _keys!1118) (size!40122 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260122 () Bool)

(declare-fun e!717004 () Bool)

(assert (=> b!1260122 (= e!717004 true)))

(declare-datatypes ((tuple2!21018 0))(
  ( (tuple2!21019 (_1!10520 (_ BitVec 64)) (_2!10520 V!48375)) )
))
(declare-datatypes ((List!28220 0))(
  ( (Nil!28217) (Cons!28216 (h!29425 tuple2!21018) (t!41708 List!28220)) )
))
(declare-datatypes ((ListLongMap!18891 0))(
  ( (ListLongMap!18892 (toList!9461 List!28220)) )
))
(declare-fun lt!570682 () ListLongMap!18891)

(declare-fun lt!570679 () ListLongMap!18891)

(declare-fun -!2080 (ListLongMap!18891 (_ BitVec 64)) ListLongMap!18891)

(assert (=> b!1260122 (= lt!570682 (-!2080 lt!570679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570674 () ListLongMap!18891)

(declare-fun lt!570683 () ListLongMap!18891)

(assert (=> b!1260122 (= (-!2080 lt!570674 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570683)))

(declare-datatypes ((Unit!41868 0))(
  ( (Unit!41869) )
))
(declare-fun lt!570680 () Unit!41868)

(declare-fun minValueBefore!43 () V!48375)

(declare-fun addThenRemoveForNewKeyIsSame!337 (ListLongMap!18891 (_ BitVec 64) V!48375) Unit!41868)

(assert (=> b!1260122 (= lt!570680 (addThenRemoveForNewKeyIsSame!337 lt!570683 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717009 () Bool)

(assert (=> b!1260122 e!717009))

(declare-fun res!839811 () Bool)

(assert (=> b!1260122 (=> (not res!839811) (not e!717009))))

(assert (=> b!1260122 (= res!839811 (= lt!570679 lt!570674))))

(declare-fun +!4262 (ListLongMap!18891 tuple2!21018) ListLongMap!18891)

(assert (=> b!1260122 (= lt!570674 (+!4262 lt!570683 (tuple2!21019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570678 () ListLongMap!18891)

(declare-fun lt!570675 () tuple2!21018)

(assert (=> b!1260122 (= lt!570683 (+!4262 lt!570678 lt!570675))))

(declare-fun zeroValue!871 () V!48375)

(assert (=> b!1260122 (= lt!570675 (tuple2!21019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48375)

(declare-fun lt!570681 () ListLongMap!18891)

(declare-fun getCurrentListMap!4546 (array!82057 array!82059 (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 (_ BitVec 32) Int) ListLongMap!18891)

(assert (=> b!1260122 (= lt!570681 (getCurrentListMap!4546 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260122 (= lt!570679 (getCurrentListMap!4546 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260123 () Bool)

(declare-fun lt!570677 () ListLongMap!18891)

(assert (=> b!1260123 (= e!717009 (= lt!570681 (+!4262 lt!570677 lt!570675)))))

(declare-fun b!1260124 () Bool)

(declare-fun e!717008 () Bool)

(assert (=> b!1260124 (= e!717008 tp_is_empty!32257)))

(declare-fun b!1260125 () Bool)

(declare-fun res!839812 () Bool)

(assert (=> b!1260125 (=> (not res!839812) (not e!717010))))

(declare-datatypes ((List!28221 0))(
  ( (Nil!28218) (Cons!28217 (h!29426 (_ BitVec 64)) (t!41709 List!28221)) )
))
(declare-fun arrayNoDuplicates!0 (array!82057 (_ BitVec 32) List!28221) Bool)

(assert (=> b!1260125 (= res!839812 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28218))))

(declare-fun res!839813 () Bool)

(assert (=> start!105788 (=> (not res!839813) (not e!717010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105788 (= res!839813 (validMask!0 mask!1466))))

(assert (=> start!105788 e!717010))

(assert (=> start!105788 true))

(assert (=> start!105788 tp!95594))

(assert (=> start!105788 tp_is_empty!32257))

(declare-fun array_inv!30281 (array!82057) Bool)

(assert (=> start!105788 (array_inv!30281 _keys!1118)))

(declare-fun e!717006 () Bool)

(declare-fun array_inv!30282 (array!82059) Bool)

(assert (=> start!105788 (and (array_inv!30282 _values!914) e!717006)))

(declare-fun b!1260126 () Bool)

(assert (=> b!1260126 (= e!717010 (not e!717004))))

(declare-fun res!839815 () Bool)

(assert (=> b!1260126 (=> res!839815 e!717004)))

(assert (=> b!1260126 (= res!839815 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260126 (= lt!570678 lt!570677)))

(declare-fun lt!570676 () Unit!41868)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1153 (array!82057 array!82059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 V!48375 V!48375 (_ BitVec 32) Int) Unit!41868)

(assert (=> b!1260126 (= lt!570676 (lemmaNoChangeToArrayThenSameMapNoExtras!1153 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5831 (array!82057 array!82059 (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 (_ BitVec 32) Int) ListLongMap!18891)

(assert (=> b!1260126 (= lt!570677 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260126 (= lt!570678 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260127 () Bool)

(assert (=> b!1260127 (= e!717006 (and e!717007 mapRes!50185))))

(declare-fun condMapEmpty!50185 () Bool)

(declare-fun mapDefault!50185 () ValueCell!15365)

(assert (=> b!1260127 (= condMapEmpty!50185 (= (arr!39584 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15365)) mapDefault!50185)))))

(declare-fun mapNonEmpty!50185 () Bool)

(declare-fun tp!95593 () Bool)

(assert (=> mapNonEmpty!50185 (= mapRes!50185 (and tp!95593 e!717008))))

(declare-fun mapKey!50185 () (_ BitVec 32))

(declare-fun mapRest!50185 () (Array (_ BitVec 32) ValueCell!15365))

(declare-fun mapValue!50185 () ValueCell!15365)

(assert (=> mapNonEmpty!50185 (= (arr!39584 _values!914) (store mapRest!50185 mapKey!50185 mapValue!50185))))

(assert (= (and start!105788 res!839813) b!1260121))

(assert (= (and b!1260121 res!839814) b!1260119))

(assert (= (and b!1260119 res!839810) b!1260125))

(assert (= (and b!1260125 res!839812) b!1260126))

(assert (= (and b!1260126 (not res!839815)) b!1260122))

(assert (= (and b!1260122 res!839811) b!1260123))

(assert (= (and b!1260127 condMapEmpty!50185) mapIsEmpty!50185))

(assert (= (and b!1260127 (not condMapEmpty!50185)) mapNonEmpty!50185))

(get-info :version)

(assert (= (and mapNonEmpty!50185 ((_ is ValueCellFull!15365) mapValue!50185)) b!1260124))

(assert (= (and b!1260127 ((_ is ValueCellFull!15365) mapDefault!50185)) b!1260120))

(assert (= start!105788 b!1260127))

(declare-fun m!1160325 () Bool)

(assert (=> b!1260122 m!1160325))

(declare-fun m!1160327 () Bool)

(assert (=> b!1260122 m!1160327))

(declare-fun m!1160329 () Bool)

(assert (=> b!1260122 m!1160329))

(declare-fun m!1160331 () Bool)

(assert (=> b!1260122 m!1160331))

(declare-fun m!1160333 () Bool)

(assert (=> b!1260122 m!1160333))

(declare-fun m!1160335 () Bool)

(assert (=> b!1260122 m!1160335))

(declare-fun m!1160337 () Bool)

(assert (=> b!1260122 m!1160337))

(declare-fun m!1160339 () Bool)

(assert (=> b!1260126 m!1160339))

(declare-fun m!1160341 () Bool)

(assert (=> b!1260126 m!1160341))

(declare-fun m!1160343 () Bool)

(assert (=> b!1260126 m!1160343))

(declare-fun m!1160345 () Bool)

(assert (=> b!1260119 m!1160345))

(declare-fun m!1160347 () Bool)

(assert (=> b!1260125 m!1160347))

(declare-fun m!1160349 () Bool)

(assert (=> start!105788 m!1160349))

(declare-fun m!1160351 () Bool)

(assert (=> start!105788 m!1160351))

(declare-fun m!1160353 () Bool)

(assert (=> start!105788 m!1160353))

(declare-fun m!1160355 () Bool)

(assert (=> mapNonEmpty!50185 m!1160355))

(declare-fun m!1160357 () Bool)

(assert (=> b!1260123 m!1160357))

(check-sat (not b!1260125) (not b!1260122) (not b_next!27355) (not start!105788) (not b!1260119) (not b!1260126) (not b!1260123) tp_is_empty!32257 b_and!45233 (not mapNonEmpty!50185))
(check-sat b_and!45233 (not b_next!27355))
