; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105688 () Bool)

(assert start!105688)

(declare-fun b_free!27277 () Bool)

(declare-fun b_next!27277 () Bool)

(assert (=> start!105688 (= b_free!27277 (not b_next!27277))))

(declare-fun tp!95357 () Bool)

(declare-fun b_and!45143 () Bool)

(assert (=> start!105688 (= tp!95357 b_and!45143)))

(declare-fun b!1258878 () Bool)

(declare-fun e!716070 () Bool)

(declare-fun e!716067 () Bool)

(assert (=> b!1258878 (= e!716070 (not e!716067))))

(declare-fun res!839027 () Bool)

(assert (=> b!1258878 (=> res!839027 e!716067)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258878 (= res!839027 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48271 0))(
  ( (V!48272 (val!16152 Int)) )
))
(declare-datatypes ((tuple2!20956 0))(
  ( (tuple2!20957 (_1!10489 (_ BitVec 64)) (_2!10489 V!48271)) )
))
(declare-datatypes ((List!28163 0))(
  ( (Nil!28160) (Cons!28159 (h!29368 tuple2!20956) (t!41649 List!28163)) )
))
(declare-datatypes ((ListLongMap!18829 0))(
  ( (ListLongMap!18830 (toList!9430 List!28163)) )
))
(declare-fun lt!569359 () ListLongMap!18829)

(declare-fun lt!569358 () ListLongMap!18829)

(assert (=> b!1258878 (= lt!569359 lt!569358)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48271)

(declare-datatypes ((Unit!41806 0))(
  ( (Unit!41807) )
))
(declare-fun lt!569365 () Unit!41806)

(declare-fun zeroValue!871 () V!48271)

(declare-datatypes ((array!81905 0))(
  ( (array!81906 (arr!39508 (Array (_ BitVec 32) (_ BitVec 64))) (size!40046 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81905)

(declare-datatypes ((ValueCell!15326 0))(
  ( (ValueCellFull!15326 (v!18853 V!48271)) (EmptyCell!15326) )
))
(declare-datatypes ((array!81907 0))(
  ( (array!81908 (arr!39509 (Array (_ BitVec 32) ValueCell!15326)) (size!40047 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81907)

(declare-fun minValueBefore!43 () V!48271)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1127 (array!81905 array!81907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 V!48271 V!48271 (_ BitVec 32) Int) Unit!41806)

(assert (=> b!1258878 (= lt!569365 (lemmaNoChangeToArrayThenSameMapNoExtras!1127 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5805 (array!81905 array!81907 (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 (_ BitVec 32) Int) ListLongMap!18829)

(assert (=> b!1258878 (= lt!569358 (getCurrentListMapNoExtraKeys!5805 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258878 (= lt!569359 (getCurrentListMapNoExtraKeys!5805 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258879 () Bool)

(declare-fun e!716068 () Bool)

(declare-fun tp_is_empty!32179 () Bool)

(assert (=> b!1258879 (= e!716068 tp_is_empty!32179)))

(declare-fun res!839024 () Bool)

(assert (=> start!105688 (=> (not res!839024) (not e!716070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105688 (= res!839024 (validMask!0 mask!1466))))

(assert (=> start!105688 e!716070))

(assert (=> start!105688 true))

(assert (=> start!105688 tp!95357))

(assert (=> start!105688 tp_is_empty!32179))

(declare-fun array_inv!30227 (array!81905) Bool)

(assert (=> start!105688 (array_inv!30227 _keys!1118)))

(declare-fun e!716069 () Bool)

(declare-fun array_inv!30228 (array!81907) Bool)

(assert (=> start!105688 (and (array_inv!30228 _values!914) e!716069)))

(declare-fun b!1258880 () Bool)

(assert (=> b!1258880 (= e!716067 true)))

(declare-fun lt!569361 () ListLongMap!18829)

(declare-fun lt!569364 () ListLongMap!18829)

(declare-fun -!2054 (ListLongMap!18829 (_ BitVec 64)) ListLongMap!18829)

(assert (=> b!1258880 (= lt!569361 (-!2054 lt!569364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569363 () ListLongMap!18829)

(declare-fun lt!569362 () ListLongMap!18829)

(assert (=> b!1258880 (= (-!2054 lt!569363 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569362)))

(declare-fun lt!569366 () Unit!41806)

(declare-fun addThenRemoveForNewKeyIsSame!311 (ListLongMap!18829 (_ BitVec 64) V!48271) Unit!41806)

(assert (=> b!1258880 (= lt!569366 (addThenRemoveForNewKeyIsSame!311 lt!569362 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716064 () Bool)

(assert (=> b!1258880 e!716064))

(declare-fun res!839025 () Bool)

(assert (=> b!1258880 (=> (not res!839025) (not e!716064))))

(assert (=> b!1258880 (= res!839025 (= lt!569364 lt!569363))))

(declare-fun +!4232 (ListLongMap!18829 tuple2!20956) ListLongMap!18829)

(assert (=> b!1258880 (= lt!569363 (+!4232 lt!569362 (tuple2!20957 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569360 () tuple2!20956)

(assert (=> b!1258880 (= lt!569362 (+!4232 lt!569359 lt!569360))))

(assert (=> b!1258880 (= lt!569360 (tuple2!20957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!569367 () ListLongMap!18829)

(declare-fun getCurrentListMap!4520 (array!81905 array!81907 (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 (_ BitVec 32) Int) ListLongMap!18829)

(assert (=> b!1258880 (= lt!569367 (getCurrentListMap!4520 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258880 (= lt!569364 (getCurrentListMap!4520 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258881 () Bool)

(declare-fun res!839022 () Bool)

(assert (=> b!1258881 (=> (not res!839022) (not e!716070))))

(declare-datatypes ((List!28164 0))(
  ( (Nil!28161) (Cons!28160 (h!29369 (_ BitVec 64)) (t!41650 List!28164)) )
))
(declare-fun arrayNoDuplicates!0 (array!81905 (_ BitVec 32) List!28164) Bool)

(assert (=> b!1258881 (= res!839022 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28161))))

(declare-fun b!1258882 () Bool)

(declare-fun e!716066 () Bool)

(declare-fun mapRes!50065 () Bool)

(assert (=> b!1258882 (= e!716069 (and e!716066 mapRes!50065))))

(declare-fun condMapEmpty!50065 () Bool)

(declare-fun mapDefault!50065 () ValueCell!15326)

(assert (=> b!1258882 (= condMapEmpty!50065 (= (arr!39509 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15326)) mapDefault!50065)))))

(declare-fun mapNonEmpty!50065 () Bool)

(declare-fun tp!95356 () Bool)

(assert (=> mapNonEmpty!50065 (= mapRes!50065 (and tp!95356 e!716068))))

(declare-fun mapKey!50065 () (_ BitVec 32))

(declare-fun mapValue!50065 () ValueCell!15326)

(declare-fun mapRest!50065 () (Array (_ BitVec 32) ValueCell!15326))

(assert (=> mapNonEmpty!50065 (= (arr!39509 _values!914) (store mapRest!50065 mapKey!50065 mapValue!50065))))

(declare-fun b!1258883 () Bool)

(declare-fun res!839026 () Bool)

(assert (=> b!1258883 (=> (not res!839026) (not e!716070))))

(assert (=> b!1258883 (= res!839026 (and (= (size!40047 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40046 _keys!1118) (size!40047 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50065 () Bool)

(assert (=> mapIsEmpty!50065 mapRes!50065))

(declare-fun b!1258884 () Bool)

(declare-fun res!839023 () Bool)

(assert (=> b!1258884 (=> (not res!839023) (not e!716070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81905 (_ BitVec 32)) Bool)

(assert (=> b!1258884 (= res!839023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258885 () Bool)

(assert (=> b!1258885 (= e!716066 tp_is_empty!32179)))

(declare-fun b!1258886 () Bool)

(assert (=> b!1258886 (= e!716064 (= lt!569367 (+!4232 lt!569358 lt!569360)))))

(assert (= (and start!105688 res!839024) b!1258883))

(assert (= (and b!1258883 res!839026) b!1258884))

(assert (= (and b!1258884 res!839023) b!1258881))

(assert (= (and b!1258881 res!839022) b!1258878))

(assert (= (and b!1258878 (not res!839027)) b!1258880))

(assert (= (and b!1258880 res!839025) b!1258886))

(assert (= (and b!1258882 condMapEmpty!50065) mapIsEmpty!50065))

(assert (= (and b!1258882 (not condMapEmpty!50065)) mapNonEmpty!50065))

(get-info :version)

(assert (= (and mapNonEmpty!50065 ((_ is ValueCellFull!15326) mapValue!50065)) b!1258879))

(assert (= (and b!1258882 ((_ is ValueCellFull!15326) mapDefault!50065)) b!1258885))

(assert (= start!105688 b!1258882))

(declare-fun m!1158791 () Bool)

(assert (=> b!1258884 m!1158791))

(declare-fun m!1158793 () Bool)

(assert (=> mapNonEmpty!50065 m!1158793))

(declare-fun m!1158795 () Bool)

(assert (=> start!105688 m!1158795))

(declare-fun m!1158797 () Bool)

(assert (=> start!105688 m!1158797))

(declare-fun m!1158799 () Bool)

(assert (=> start!105688 m!1158799))

(declare-fun m!1158801 () Bool)

(assert (=> b!1258886 m!1158801))

(declare-fun m!1158803 () Bool)

(assert (=> b!1258880 m!1158803))

(declare-fun m!1158805 () Bool)

(assert (=> b!1258880 m!1158805))

(declare-fun m!1158807 () Bool)

(assert (=> b!1258880 m!1158807))

(declare-fun m!1158809 () Bool)

(assert (=> b!1258880 m!1158809))

(declare-fun m!1158811 () Bool)

(assert (=> b!1258880 m!1158811))

(declare-fun m!1158813 () Bool)

(assert (=> b!1258880 m!1158813))

(declare-fun m!1158815 () Bool)

(assert (=> b!1258880 m!1158815))

(declare-fun m!1158817 () Bool)

(assert (=> b!1258878 m!1158817))

(declare-fun m!1158819 () Bool)

(assert (=> b!1258878 m!1158819))

(declare-fun m!1158821 () Bool)

(assert (=> b!1258878 m!1158821))

(declare-fun m!1158823 () Bool)

(assert (=> b!1258881 m!1158823))

(check-sat (not b!1258884) (not b!1258880) (not b!1258881) tp_is_empty!32179 (not b!1258886) (not mapNonEmpty!50065) (not b!1258878) (not start!105688) b_and!45143 (not b_next!27277))
(check-sat b_and!45143 (not b_next!27277))
