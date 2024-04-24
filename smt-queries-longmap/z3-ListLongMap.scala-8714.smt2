; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105958 () Bool)

(assert start!105958)

(declare-fun b_free!27319 () Bool)

(declare-fun b_next!27319 () Bool)

(assert (=> start!105958 (= b_free!27319 (not b_next!27319))))

(declare-fun tp!95482 () Bool)

(declare-fun b_and!45205 () Bool)

(assert (=> start!105958 (= tp!95482 b_and!45205)))

(declare-fun res!839965 () Bool)

(declare-fun e!717403 () Bool)

(assert (=> start!105958 (=> (not res!839965) (not e!717403))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105958 (= res!839965 (validMask!0 mask!1466))))

(assert (=> start!105958 e!717403))

(assert (=> start!105958 true))

(assert (=> start!105958 tp!95482))

(declare-fun tp_is_empty!32221 () Bool)

(assert (=> start!105958 tp_is_empty!32221))

(declare-datatypes ((array!82113 0))(
  ( (array!82114 (arr!39607 (Array (_ BitVec 32) (_ BitVec 64))) (size!40144 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82113)

(declare-fun array_inv!30301 (array!82113) Bool)

(assert (=> start!105958 (array_inv!30301 _keys!1118)))

(declare-datatypes ((V!48327 0))(
  ( (V!48328 (val!16173 Int)) )
))
(declare-datatypes ((ValueCell!15347 0))(
  ( (ValueCellFull!15347 (v!18871 V!48327)) (EmptyCell!15347) )
))
(declare-datatypes ((array!82115 0))(
  ( (array!82116 (arr!39608 (Array (_ BitVec 32) ValueCell!15347)) (size!40145 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82115)

(declare-fun e!717402 () Bool)

(declare-fun array_inv!30302 (array!82115) Bool)

(assert (=> start!105958 (and (array_inv!30302 _values!914) e!717402)))

(declare-fun mapIsEmpty!50128 () Bool)

(declare-fun mapRes!50128 () Bool)

(assert (=> mapIsEmpty!50128 mapRes!50128))

(declare-fun b!1260832 () Bool)

(declare-fun res!839963 () Bool)

(assert (=> b!1260832 (=> (not res!839963) (not e!717403))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260832 (= res!839963 (and (= (size!40145 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40144 _keys!1118) (size!40145 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20930 0))(
  ( (tuple2!20931 (_1!10476 (_ BitVec 64)) (_2!10476 V!48327)) )
))
(declare-fun lt!570657 () tuple2!20930)

(declare-datatypes ((List!28157 0))(
  ( (Nil!28154) (Cons!28153 (h!29371 tuple2!20930) (t!41644 List!28157)) )
))
(declare-datatypes ((ListLongMap!18811 0))(
  ( (ListLongMap!18812 (toList!9421 List!28157)) )
))
(declare-fun lt!570660 () ListLongMap!18811)

(declare-fun b!1260833 () Bool)

(declare-fun lt!570652 () ListLongMap!18811)

(declare-fun e!717398 () Bool)

(declare-fun +!4261 (ListLongMap!18811 tuple2!20930) ListLongMap!18811)

(assert (=> b!1260833 (= e!717398 (= lt!570652 (+!4261 lt!570660 lt!570657)))))

(declare-fun b!1260834 () Bool)

(declare-fun e!717399 () Bool)

(assert (=> b!1260834 (= e!717399 tp_is_empty!32221)))

(declare-fun b!1260835 () Bool)

(declare-fun res!839961 () Bool)

(assert (=> b!1260835 (=> (not res!839961) (not e!717403))))

(declare-datatypes ((List!28158 0))(
  ( (Nil!28155) (Cons!28154 (h!29372 (_ BitVec 64)) (t!41645 List!28158)) )
))
(declare-fun arrayNoDuplicates!0 (array!82113 (_ BitVec 32) List!28158) Bool)

(assert (=> b!1260835 (= res!839961 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28155))))

(declare-fun b!1260836 () Bool)

(assert (=> b!1260836 (= e!717402 (and e!717399 mapRes!50128))))

(declare-fun condMapEmpty!50128 () Bool)

(declare-fun mapDefault!50128 () ValueCell!15347)

(assert (=> b!1260836 (= condMapEmpty!50128 (= (arr!39608 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15347)) mapDefault!50128)))))

(declare-fun mapNonEmpty!50128 () Bool)

(declare-fun tp!95483 () Bool)

(declare-fun e!717400 () Bool)

(assert (=> mapNonEmpty!50128 (= mapRes!50128 (and tp!95483 e!717400))))

(declare-fun mapRest!50128 () (Array (_ BitVec 32) ValueCell!15347))

(declare-fun mapKey!50128 () (_ BitVec 32))

(declare-fun mapValue!50128 () ValueCell!15347)

(assert (=> mapNonEmpty!50128 (= (arr!39608 _values!914) (store mapRest!50128 mapKey!50128 mapValue!50128))))

(declare-fun b!1260837 () Bool)

(declare-fun res!839960 () Bool)

(assert (=> b!1260837 (=> (not res!839960) (not e!717403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82113 (_ BitVec 32)) Bool)

(assert (=> b!1260837 (= res!839960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260838 () Bool)

(declare-fun e!717397 () Bool)

(assert (=> b!1260838 (= e!717397 true)))

(declare-fun lt!570658 () ListLongMap!18811)

(declare-fun lt!570653 () ListLongMap!18811)

(declare-fun -!2091 (ListLongMap!18811 (_ BitVec 64)) ListLongMap!18811)

(assert (=> b!1260838 (= lt!570658 (-!2091 lt!570653 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570655 () ListLongMap!18811)

(declare-fun lt!570654 () ListLongMap!18811)

(assert (=> b!1260838 (= (-!2091 lt!570655 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570654)))

(declare-datatypes ((Unit!41978 0))(
  ( (Unit!41979) )
))
(declare-fun lt!570651 () Unit!41978)

(declare-fun minValueBefore!43 () V!48327)

(declare-fun addThenRemoveForNewKeyIsSame!345 (ListLongMap!18811 (_ BitVec 64) V!48327) Unit!41978)

(assert (=> b!1260838 (= lt!570651 (addThenRemoveForNewKeyIsSame!345 lt!570654 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260838 e!717398))

(declare-fun res!839964 () Bool)

(assert (=> b!1260838 (=> (not res!839964) (not e!717398))))

(assert (=> b!1260838 (= res!839964 (= lt!570653 lt!570655))))

(assert (=> b!1260838 (= lt!570655 (+!4261 lt!570654 (tuple2!20931 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570656 () ListLongMap!18811)

(assert (=> b!1260838 (= lt!570654 (+!4261 lt!570656 lt!570657))))

(declare-fun zeroValue!871 () V!48327)

(assert (=> b!1260838 (= lt!570657 (tuple2!20931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48327)

(declare-fun getCurrentListMap!4603 (array!82113 array!82115 (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 (_ BitVec 32) Int) ListLongMap!18811)

(assert (=> b!1260838 (= lt!570652 (getCurrentListMap!4603 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260838 (= lt!570653 (getCurrentListMap!4603 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260839 () Bool)

(assert (=> b!1260839 (= e!717403 (not e!717397))))

(declare-fun res!839962 () Bool)

(assert (=> b!1260839 (=> res!839962 e!717397)))

(assert (=> b!1260839 (= res!839962 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260839 (= lt!570656 lt!570660)))

(declare-fun lt!570659 () Unit!41978)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1145 (array!82113 array!82115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 V!48327 V!48327 (_ BitVec 32) Int) Unit!41978)

(assert (=> b!1260839 (= lt!570659 (lemmaNoChangeToArrayThenSameMapNoExtras!1145 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5831 (array!82113 array!82115 (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 (_ BitVec 32) Int) ListLongMap!18811)

(assert (=> b!1260839 (= lt!570660 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260839 (= lt!570656 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260840 () Bool)

(assert (=> b!1260840 (= e!717400 tp_is_empty!32221)))

(assert (= (and start!105958 res!839965) b!1260832))

(assert (= (and b!1260832 res!839963) b!1260837))

(assert (= (and b!1260837 res!839960) b!1260835))

(assert (= (and b!1260835 res!839961) b!1260839))

(assert (= (and b!1260839 (not res!839962)) b!1260838))

(assert (= (and b!1260838 res!839964) b!1260833))

(assert (= (and b!1260836 condMapEmpty!50128) mapIsEmpty!50128))

(assert (= (and b!1260836 (not condMapEmpty!50128)) mapNonEmpty!50128))

(get-info :version)

(assert (= (and mapNonEmpty!50128 ((_ is ValueCellFull!15347) mapValue!50128)) b!1260840))

(assert (= (and b!1260836 ((_ is ValueCellFull!15347) mapDefault!50128)) b!1260834))

(assert (= start!105958 b!1260836))

(declare-fun m!1161637 () Bool)

(assert (=> b!1260838 m!1161637))

(declare-fun m!1161639 () Bool)

(assert (=> b!1260838 m!1161639))

(declare-fun m!1161641 () Bool)

(assert (=> b!1260838 m!1161641))

(declare-fun m!1161643 () Bool)

(assert (=> b!1260838 m!1161643))

(declare-fun m!1161645 () Bool)

(assert (=> b!1260838 m!1161645))

(declare-fun m!1161647 () Bool)

(assert (=> b!1260838 m!1161647))

(declare-fun m!1161649 () Bool)

(assert (=> b!1260838 m!1161649))

(declare-fun m!1161651 () Bool)

(assert (=> b!1260835 m!1161651))

(declare-fun m!1161653 () Bool)

(assert (=> b!1260837 m!1161653))

(declare-fun m!1161655 () Bool)

(assert (=> start!105958 m!1161655))

(declare-fun m!1161657 () Bool)

(assert (=> start!105958 m!1161657))

(declare-fun m!1161659 () Bool)

(assert (=> start!105958 m!1161659))

(declare-fun m!1161661 () Bool)

(assert (=> b!1260833 m!1161661))

(declare-fun m!1161663 () Bool)

(assert (=> mapNonEmpty!50128 m!1161663))

(declare-fun m!1161665 () Bool)

(assert (=> b!1260839 m!1161665))

(declare-fun m!1161667 () Bool)

(assert (=> b!1260839 m!1161667))

(declare-fun m!1161669 () Bool)

(assert (=> b!1260839 m!1161669))

(check-sat (not b!1260835) b_and!45205 (not b!1260838) tp_is_empty!32221 (not b!1260839) (not b!1260833) (not b_next!27319) (not mapNonEmpty!50128) (not start!105958) (not b!1260837))
(check-sat b_and!45205 (not b_next!27319))
