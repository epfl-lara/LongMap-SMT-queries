; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105700 () Bool)

(assert start!105700)

(declare-fun b_free!27289 () Bool)

(declare-fun b_next!27289 () Bool)

(assert (=> start!105700 (= b_free!27289 (not b_next!27289))))

(declare-fun tp!95392 () Bool)

(declare-fun b_and!45155 () Bool)

(assert (=> start!105700 (= tp!95392 b_and!45155)))

(declare-fun mapIsEmpty!50083 () Bool)

(declare-fun mapRes!50083 () Bool)

(assert (=> mapIsEmpty!50083 mapRes!50083))

(declare-fun b!1259040 () Bool)

(declare-fun res!839134 () Bool)

(declare-fun e!716194 () Bool)

(assert (=> b!1259040 (=> (not res!839134) (not e!716194))))

(declare-datatypes ((array!81927 0))(
  ( (array!81928 (arr!39519 (Array (_ BitVec 32) (_ BitVec 64))) (size!40057 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81927)

(declare-datatypes ((List!28173 0))(
  ( (Nil!28170) (Cons!28169 (h!29378 (_ BitVec 64)) (t!41659 List!28173)) )
))
(declare-fun arrayNoDuplicates!0 (array!81927 (_ BitVec 32) List!28173) Bool)

(assert (=> b!1259040 (= res!839134 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28170))))

(declare-fun mapNonEmpty!50083 () Bool)

(declare-fun tp!95393 () Bool)

(declare-fun e!716196 () Bool)

(assert (=> mapNonEmpty!50083 (= mapRes!50083 (and tp!95393 e!716196))))

(declare-datatypes ((V!48287 0))(
  ( (V!48288 (val!16158 Int)) )
))
(declare-datatypes ((ValueCell!15332 0))(
  ( (ValueCellFull!15332 (v!18859 V!48287)) (EmptyCell!15332) )
))
(declare-fun mapValue!50083 () ValueCell!15332)

(declare-fun mapKey!50083 () (_ BitVec 32))

(declare-datatypes ((array!81929 0))(
  ( (array!81930 (arr!39520 (Array (_ BitVec 32) ValueCell!15332)) (size!40058 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81929)

(declare-fun mapRest!50083 () (Array (_ BitVec 32) ValueCell!15332))

(assert (=> mapNonEmpty!50083 (= (arr!39520 _values!914) (store mapRest!50083 mapKey!50083 mapValue!50083))))

(declare-fun b!1259041 () Bool)

(declare-fun e!716190 () Bool)

(assert (=> b!1259041 (= e!716194 (not e!716190))))

(declare-fun res!839131 () Bool)

(assert (=> b!1259041 (=> res!839131 e!716190)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259041 (= res!839131 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20966 0))(
  ( (tuple2!20967 (_1!10494 (_ BitVec 64)) (_2!10494 V!48287)) )
))
(declare-datatypes ((List!28174 0))(
  ( (Nil!28171) (Cons!28170 (h!29379 tuple2!20966) (t!41660 List!28174)) )
))
(declare-datatypes ((ListLongMap!18839 0))(
  ( (ListLongMap!18840 (toList!9435 List!28174)) )
))
(declare-fun lt!569546 () ListLongMap!18839)

(declare-fun lt!569545 () ListLongMap!18839)

(assert (=> b!1259041 (= lt!569546 lt!569545)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41816 0))(
  ( (Unit!41817) )
))
(declare-fun lt!569544 () Unit!41816)

(declare-fun minValueAfter!43 () V!48287)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48287)

(declare-fun minValueBefore!43 () V!48287)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1131 (array!81927 array!81929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 V!48287 V!48287 (_ BitVec 32) Int) Unit!41816)

(assert (=> b!1259041 (= lt!569544 (lemmaNoChangeToArrayThenSameMapNoExtras!1131 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5809 (array!81927 array!81929 (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 (_ BitVec 32) Int) ListLongMap!18839)

(assert (=> b!1259041 (= lt!569545 (getCurrentListMapNoExtraKeys!5809 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259041 (= lt!569546 (getCurrentListMapNoExtraKeys!5809 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259042 () Bool)

(assert (=> b!1259042 (= e!716190 true)))

(declare-fun lt!569538 () ListLongMap!18839)

(declare-fun lt!569542 () ListLongMap!18839)

(declare-fun -!2058 (ListLongMap!18839 (_ BitVec 64)) ListLongMap!18839)

(assert (=> b!1259042 (= lt!569538 (-!2058 lt!569542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569547 () ListLongMap!18839)

(declare-fun lt!569541 () ListLongMap!18839)

(assert (=> b!1259042 (= (-!2058 lt!569547 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569541)))

(declare-fun lt!569539 () Unit!41816)

(declare-fun addThenRemoveForNewKeyIsSame!315 (ListLongMap!18839 (_ BitVec 64) V!48287) Unit!41816)

(assert (=> b!1259042 (= lt!569539 (addThenRemoveForNewKeyIsSame!315 lt!569541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716193 () Bool)

(assert (=> b!1259042 e!716193))

(declare-fun res!839133 () Bool)

(assert (=> b!1259042 (=> (not res!839133) (not e!716193))))

(assert (=> b!1259042 (= res!839133 (= lt!569542 lt!569547))))

(declare-fun +!4237 (ListLongMap!18839 tuple2!20966) ListLongMap!18839)

(assert (=> b!1259042 (= lt!569547 (+!4237 lt!569541 (tuple2!20967 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569543 () tuple2!20966)

(assert (=> b!1259042 (= lt!569541 (+!4237 lt!569546 lt!569543))))

(assert (=> b!1259042 (= lt!569543 (tuple2!20967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!569540 () ListLongMap!18839)

(declare-fun getCurrentListMap!4524 (array!81927 array!81929 (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 (_ BitVec 32) Int) ListLongMap!18839)

(assert (=> b!1259042 (= lt!569540 (getCurrentListMap!4524 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259042 (= lt!569542 (getCurrentListMap!4524 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259043 () Bool)

(declare-fun e!716195 () Bool)

(declare-fun tp_is_empty!32191 () Bool)

(assert (=> b!1259043 (= e!716195 tp_is_empty!32191)))

(declare-fun b!1259044 () Bool)

(assert (=> b!1259044 (= e!716196 tp_is_empty!32191)))

(declare-fun res!839130 () Bool)

(assert (=> start!105700 (=> (not res!839130) (not e!716194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105700 (= res!839130 (validMask!0 mask!1466))))

(assert (=> start!105700 e!716194))

(assert (=> start!105700 true))

(assert (=> start!105700 tp!95392))

(assert (=> start!105700 tp_is_empty!32191))

(declare-fun array_inv!30237 (array!81927) Bool)

(assert (=> start!105700 (array_inv!30237 _keys!1118)))

(declare-fun e!716192 () Bool)

(declare-fun array_inv!30238 (array!81929) Bool)

(assert (=> start!105700 (and (array_inv!30238 _values!914) e!716192)))

(declare-fun b!1259045 () Bool)

(declare-fun res!839132 () Bool)

(assert (=> b!1259045 (=> (not res!839132) (not e!716194))))

(assert (=> b!1259045 (= res!839132 (and (= (size!40058 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40057 _keys!1118) (size!40058 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259046 () Bool)

(assert (=> b!1259046 (= e!716192 (and e!716195 mapRes!50083))))

(declare-fun condMapEmpty!50083 () Bool)

(declare-fun mapDefault!50083 () ValueCell!15332)

(assert (=> b!1259046 (= condMapEmpty!50083 (= (arr!39520 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15332)) mapDefault!50083)))))

(declare-fun b!1259047 () Bool)

(assert (=> b!1259047 (= e!716193 (= lt!569540 (+!4237 lt!569545 lt!569543)))))

(declare-fun b!1259048 () Bool)

(declare-fun res!839135 () Bool)

(assert (=> b!1259048 (=> (not res!839135) (not e!716194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81927 (_ BitVec 32)) Bool)

(assert (=> b!1259048 (= res!839135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105700 res!839130) b!1259045))

(assert (= (and b!1259045 res!839132) b!1259048))

(assert (= (and b!1259048 res!839135) b!1259040))

(assert (= (and b!1259040 res!839134) b!1259041))

(assert (= (and b!1259041 (not res!839131)) b!1259042))

(assert (= (and b!1259042 res!839133) b!1259047))

(assert (= (and b!1259046 condMapEmpty!50083) mapIsEmpty!50083))

(assert (= (and b!1259046 (not condMapEmpty!50083)) mapNonEmpty!50083))

(get-info :version)

(assert (= (and mapNonEmpty!50083 ((_ is ValueCellFull!15332) mapValue!50083)) b!1259044))

(assert (= (and b!1259046 ((_ is ValueCellFull!15332) mapDefault!50083)) b!1259043))

(assert (= start!105700 b!1259046))

(declare-fun m!1158995 () Bool)

(assert (=> start!105700 m!1158995))

(declare-fun m!1158997 () Bool)

(assert (=> start!105700 m!1158997))

(declare-fun m!1158999 () Bool)

(assert (=> start!105700 m!1158999))

(declare-fun m!1159001 () Bool)

(assert (=> mapNonEmpty!50083 m!1159001))

(declare-fun m!1159003 () Bool)

(assert (=> b!1259048 m!1159003))

(declare-fun m!1159005 () Bool)

(assert (=> b!1259047 m!1159005))

(declare-fun m!1159007 () Bool)

(assert (=> b!1259041 m!1159007))

(declare-fun m!1159009 () Bool)

(assert (=> b!1259041 m!1159009))

(declare-fun m!1159011 () Bool)

(assert (=> b!1259041 m!1159011))

(declare-fun m!1159013 () Bool)

(assert (=> b!1259042 m!1159013))

(declare-fun m!1159015 () Bool)

(assert (=> b!1259042 m!1159015))

(declare-fun m!1159017 () Bool)

(assert (=> b!1259042 m!1159017))

(declare-fun m!1159019 () Bool)

(assert (=> b!1259042 m!1159019))

(declare-fun m!1159021 () Bool)

(assert (=> b!1259042 m!1159021))

(declare-fun m!1159023 () Bool)

(assert (=> b!1259042 m!1159023))

(declare-fun m!1159025 () Bool)

(assert (=> b!1259042 m!1159025))

(declare-fun m!1159027 () Bool)

(assert (=> b!1259040 m!1159027))

(check-sat tp_is_empty!32191 b_and!45155 (not mapNonEmpty!50083) (not b_next!27289) (not start!105700) (not b!1259047) (not b!1259040) (not b!1259041) (not b!1259048) (not b!1259042))
(check-sat b_and!45155 (not b_next!27289))
