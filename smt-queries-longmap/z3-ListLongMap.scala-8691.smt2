; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105568 () Bool)

(assert start!105568)

(declare-fun b_free!27183 () Bool)

(declare-fun b_next!27183 () Bool)

(assert (=> start!105568 (= b_free!27183 (not b_next!27183))))

(declare-fun tp!95068 () Bool)

(declare-fun b_and!45049 () Bool)

(assert (=> start!105568 (= tp!95068 b_and!45049)))

(declare-fun b!1257637 () Bool)

(declare-fun e!715154 () Bool)

(declare-fun tp_is_empty!32085 () Bool)

(assert (=> b!1257637 (= e!715154 tp_is_empty!32085)))

(declare-fun b!1257638 () Bool)

(declare-fun res!838306 () Bool)

(declare-fun e!715155 () Bool)

(assert (=> b!1257638 (=> (not res!838306) (not e!715155))))

(declare-datatypes ((array!81802 0))(
  ( (array!81803 (arr!39458 (Array (_ BitVec 32) (_ BitVec 64))) (size!39994 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81802)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81802 (_ BitVec 32)) Bool)

(assert (=> b!1257638 (= res!838306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257639 () Bool)

(declare-fun e!715156 () Bool)

(declare-fun e!715152 () Bool)

(declare-fun mapRes!49918 () Bool)

(assert (=> b!1257639 (= e!715156 (and e!715152 mapRes!49918))))

(declare-fun condMapEmpty!49918 () Bool)

(declare-datatypes ((V!48145 0))(
  ( (V!48146 (val!16105 Int)) )
))
(declare-datatypes ((ValueCell!15279 0))(
  ( (ValueCellFull!15279 (v!18807 V!48145)) (EmptyCell!15279) )
))
(declare-datatypes ((array!81804 0))(
  ( (array!81805 (arr!39459 (Array (_ BitVec 32) ValueCell!15279)) (size!39995 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81804)

(declare-fun mapDefault!49918 () ValueCell!15279)

(assert (=> b!1257639 (= condMapEmpty!49918 (= (arr!39459 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15279)) mapDefault!49918)))))

(declare-fun b!1257640 () Bool)

(declare-fun res!838307 () Bool)

(assert (=> b!1257640 (=> (not res!838307) (not e!715155))))

(declare-datatypes ((List!28023 0))(
  ( (Nil!28020) (Cons!28019 (h!29228 (_ BitVec 64)) (t!41514 List!28023)) )
))
(declare-fun arrayNoDuplicates!0 (array!81802 (_ BitVec 32) List!28023) Bool)

(assert (=> b!1257640 (= res!838307 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28020))))

(declare-fun mapIsEmpty!49918 () Bool)

(assert (=> mapIsEmpty!49918 mapRes!49918))

(declare-fun mapNonEmpty!49918 () Bool)

(declare-fun tp!95069 () Bool)

(assert (=> mapNonEmpty!49918 (= mapRes!49918 (and tp!95069 e!715154))))

(declare-fun mapRest!49918 () (Array (_ BitVec 32) ValueCell!15279))

(declare-fun mapValue!49918 () ValueCell!15279)

(declare-fun mapKey!49918 () (_ BitVec 32))

(assert (=> mapNonEmpty!49918 (= (arr!39459 _values!914) (store mapRest!49918 mapKey!49918 mapValue!49918))))

(declare-fun res!838309 () Bool)

(assert (=> start!105568 (=> (not res!838309) (not e!715155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105568 (= res!838309 (validMask!0 mask!1466))))

(assert (=> start!105568 e!715155))

(assert (=> start!105568 true))

(assert (=> start!105568 tp!95068))

(assert (=> start!105568 tp_is_empty!32085))

(declare-fun array_inv!30055 (array!81802) Bool)

(assert (=> start!105568 (array_inv!30055 _keys!1118)))

(declare-fun array_inv!30056 (array!81804) Bool)

(assert (=> start!105568 (and (array_inv!30056 _values!914) e!715156)))

(declare-fun b!1257641 () Bool)

(assert (=> b!1257641 (= e!715152 tp_is_empty!32085)))

(declare-fun b!1257642 () Bool)

(declare-fun res!838308 () Bool)

(assert (=> b!1257642 (=> (not res!838308) (not e!715155))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257642 (= res!838308 (and (= (size!39995 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39994 _keys!1118) (size!39995 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257643 () Bool)

(assert (=> b!1257643 (= e!715155 (not true))))

(declare-datatypes ((tuple2!20808 0))(
  ( (tuple2!20809 (_1!10415 (_ BitVec 64)) (_2!10415 V!48145)) )
))
(declare-datatypes ((List!28024 0))(
  ( (Nil!28021) (Cons!28020 (h!29229 tuple2!20808) (t!41515 List!28024)) )
))
(declare-datatypes ((ListLongMap!18681 0))(
  ( (ListLongMap!18682 (toList!9356 List!28024)) )
))
(declare-fun lt!568828 () ListLongMap!18681)

(declare-fun lt!568829 () ListLongMap!18681)

(assert (=> b!1257643 (= lt!568828 lt!568829)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48145)

(declare-fun zeroValue!871 () V!48145)

(declare-fun minValueBefore!43 () V!48145)

(declare-datatypes ((Unit!41896 0))(
  ( (Unit!41897) )
))
(declare-fun lt!568830 () Unit!41896)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1098 (array!81802 array!81804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48145 V!48145 V!48145 V!48145 (_ BitVec 32) Int) Unit!41896)

(assert (=> b!1257643 (= lt!568830 (lemmaNoChangeToArrayThenSameMapNoExtras!1098 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5734 (array!81802 array!81804 (_ BitVec 32) (_ BitVec 32) V!48145 V!48145 (_ BitVec 32) Int) ListLongMap!18681)

(assert (=> b!1257643 (= lt!568829 (getCurrentListMapNoExtraKeys!5734 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257643 (= lt!568828 (getCurrentListMapNoExtraKeys!5734 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105568 res!838309) b!1257642))

(assert (= (and b!1257642 res!838308) b!1257638))

(assert (= (and b!1257638 res!838306) b!1257640))

(assert (= (and b!1257640 res!838307) b!1257643))

(assert (= (and b!1257639 condMapEmpty!49918) mapIsEmpty!49918))

(assert (= (and b!1257639 (not condMapEmpty!49918)) mapNonEmpty!49918))

(get-info :version)

(assert (= (and mapNonEmpty!49918 ((_ is ValueCellFull!15279) mapValue!49918)) b!1257637))

(assert (= (and b!1257639 ((_ is ValueCellFull!15279) mapDefault!49918)) b!1257641))

(assert (= start!105568 b!1257639))

(declare-fun m!1158197 () Bool)

(assert (=> mapNonEmpty!49918 m!1158197))

(declare-fun m!1158199 () Bool)

(assert (=> b!1257638 m!1158199))

(declare-fun m!1158201 () Bool)

(assert (=> start!105568 m!1158201))

(declare-fun m!1158203 () Bool)

(assert (=> start!105568 m!1158203))

(declare-fun m!1158205 () Bool)

(assert (=> start!105568 m!1158205))

(declare-fun m!1158207 () Bool)

(assert (=> b!1257640 m!1158207))

(declare-fun m!1158209 () Bool)

(assert (=> b!1257643 m!1158209))

(declare-fun m!1158211 () Bool)

(assert (=> b!1257643 m!1158211))

(declare-fun m!1158213 () Bool)

(assert (=> b!1257643 m!1158213))

(check-sat tp_is_empty!32085 (not b!1257638) (not b!1257640) (not b!1257643) (not b_next!27183) (not mapNonEmpty!49918) (not start!105568) b_and!45049)
(check-sat b_and!45049 (not b_next!27183))
