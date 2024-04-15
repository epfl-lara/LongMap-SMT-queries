; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105492 () Bool)

(assert start!105492)

(declare-fun b_free!27133 () Bool)

(declare-fun b_next!27133 () Bool)

(assert (=> start!105492 (= b_free!27133 (not b_next!27133))))

(declare-fun tp!94915 () Bool)

(declare-fun b_and!44971 () Bool)

(assert (=> start!105492 (= tp!94915 b_and!44971)))

(declare-fun b!1256787 () Bool)

(declare-fun res!837823 () Bool)

(declare-fun e!714547 () Bool)

(assert (=> b!1256787 (=> (not res!837823) (not e!714547))))

(declare-datatypes ((array!81637 0))(
  ( (array!81638 (arr!39377 (Array (_ BitVec 32) (_ BitVec 64))) (size!39915 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81637)

(declare-datatypes ((List!28066 0))(
  ( (Nil!28063) (Cons!28062 (h!29271 (_ BitVec 64)) (t!41546 List!28066)) )
))
(declare-fun arrayNoDuplicates!0 (array!81637 (_ BitVec 32) List!28066) Bool)

(assert (=> b!1256787 (= res!837823 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28063))))

(declare-fun b!1256789 () Bool)

(declare-fun e!714550 () Bool)

(declare-fun e!714546 () Bool)

(declare-fun mapRes!49840 () Bool)

(assert (=> b!1256789 (= e!714550 (and e!714546 mapRes!49840))))

(declare-fun condMapEmpty!49840 () Bool)

(declare-datatypes ((V!48079 0))(
  ( (V!48080 (val!16080 Int)) )
))
(declare-datatypes ((ValueCell!15254 0))(
  ( (ValueCellFull!15254 (v!18780 V!48079)) (EmptyCell!15254) )
))
(declare-datatypes ((array!81639 0))(
  ( (array!81640 (arr!39378 (Array (_ BitVec 32) ValueCell!15254)) (size!39916 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81639)

(declare-fun mapDefault!49840 () ValueCell!15254)

(assert (=> b!1256789 (= condMapEmpty!49840 (= (arr!39378 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15254)) mapDefault!49840)))))

(declare-fun mapNonEmpty!49840 () Bool)

(declare-fun tp!94916 () Bool)

(declare-fun e!714552 () Bool)

(assert (=> mapNonEmpty!49840 (= mapRes!49840 (and tp!94916 e!714552))))

(declare-fun mapKey!49840 () (_ BitVec 32))

(declare-fun mapValue!49840 () ValueCell!15254)

(declare-fun mapRest!49840 () (Array (_ BitVec 32) ValueCell!15254))

(assert (=> mapNonEmpty!49840 (= (arr!39378 _values!914) (store mapRest!49840 mapKey!49840 mapValue!49840))))

(declare-fun mapIsEmpty!49840 () Bool)

(assert (=> mapIsEmpty!49840 mapRes!49840))

(declare-fun b!1256790 () Bool)

(declare-fun res!837824 () Bool)

(assert (=> b!1256790 (=> (not res!837824) (not e!714547))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81637 (_ BitVec 32)) Bool)

(assert (=> b!1256790 (= res!837824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256791 () Bool)

(declare-fun res!837820 () Bool)

(assert (=> b!1256791 (=> (not res!837820) (not e!714547))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256791 (= res!837820 (and (= (size!39916 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39915 _keys!1118) (size!39916 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256792 () Bool)

(declare-fun tp_is_empty!32035 () Bool)

(assert (=> b!1256792 (= e!714546 tp_is_empty!32035)))

(declare-fun b!1256793 () Bool)

(declare-fun e!714551 () Bool)

(declare-fun e!714549 () Bool)

(assert (=> b!1256793 (= e!714551 e!714549)))

(declare-fun res!837821 () Bool)

(assert (=> b!1256793 (=> res!837821 e!714549)))

(declare-datatypes ((tuple2!20858 0))(
  ( (tuple2!20859 (_1!10440 (_ BitVec 64)) (_2!10440 V!48079)) )
))
(declare-datatypes ((List!28067 0))(
  ( (Nil!28064) (Cons!28063 (h!29272 tuple2!20858) (t!41547 List!28067)) )
))
(declare-datatypes ((ListLongMap!18731 0))(
  ( (ListLongMap!18732 (toList!9381 List!28067)) )
))
(declare-fun lt!568216 () ListLongMap!18731)

(declare-fun contains!7532 (ListLongMap!18731 (_ BitVec 64)) Bool)

(assert (=> b!1256793 (= res!837821 (contains!7532 lt!568216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48079)

(declare-fun minValueBefore!43 () V!48079)

(declare-fun getCurrentListMap!4491 (array!81637 array!81639 (_ BitVec 32) (_ BitVec 32) V!48079 V!48079 (_ BitVec 32) Int) ListLongMap!18731)

(assert (=> b!1256793 (= lt!568216 (getCurrentListMap!4491 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256788 () Bool)

(assert (=> b!1256788 (= e!714547 (not e!714551))))

(declare-fun res!837819 () Bool)

(assert (=> b!1256788 (=> res!837819 e!714551)))

(assert (=> b!1256788 (= res!837819 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568218 () ListLongMap!18731)

(declare-fun lt!568215 () ListLongMap!18731)

(assert (=> b!1256788 (= lt!568218 lt!568215)))

(declare-datatypes ((Unit!41719 0))(
  ( (Unit!41720) )
))
(declare-fun lt!568217 () Unit!41719)

(declare-fun minValueAfter!43 () V!48079)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1088 (array!81637 array!81639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48079 V!48079 V!48079 V!48079 (_ BitVec 32) Int) Unit!41719)

(assert (=> b!1256788 (= lt!568217 (lemmaNoChangeToArrayThenSameMapNoExtras!1088 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5766 (array!81637 array!81639 (_ BitVec 32) (_ BitVec 32) V!48079 V!48079 (_ BitVec 32) Int) ListLongMap!18731)

(assert (=> b!1256788 (= lt!568215 (getCurrentListMapNoExtraKeys!5766 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256788 (= lt!568218 (getCurrentListMapNoExtraKeys!5766 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837822 () Bool)

(assert (=> start!105492 (=> (not res!837822) (not e!714547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105492 (= res!837822 (validMask!0 mask!1466))))

(assert (=> start!105492 e!714547))

(assert (=> start!105492 true))

(assert (=> start!105492 tp!94915))

(assert (=> start!105492 tp_is_empty!32035))

(declare-fun array_inv!30133 (array!81637) Bool)

(assert (=> start!105492 (array_inv!30133 _keys!1118)))

(declare-fun array_inv!30134 (array!81639) Bool)

(assert (=> start!105492 (and (array_inv!30134 _values!914) e!714550)))

(declare-fun b!1256794 () Bool)

(assert (=> b!1256794 (= e!714549 true)))

(declare-fun -!2045 (ListLongMap!18731 (_ BitVec 64)) ListLongMap!18731)

(assert (=> b!1256794 (= (-!2045 lt!568216 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568216)))

(declare-fun lt!568214 () Unit!41719)

(declare-fun removeNotPresentStillSame!140 (ListLongMap!18731 (_ BitVec 64)) Unit!41719)

(assert (=> b!1256794 (= lt!568214 (removeNotPresentStillSame!140 lt!568216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256795 () Bool)

(assert (=> b!1256795 (= e!714552 tp_is_empty!32035)))

(assert (= (and start!105492 res!837822) b!1256791))

(assert (= (and b!1256791 res!837820) b!1256790))

(assert (= (and b!1256790 res!837824) b!1256787))

(assert (= (and b!1256787 res!837823) b!1256788))

(assert (= (and b!1256788 (not res!837819)) b!1256793))

(assert (= (and b!1256793 (not res!837821)) b!1256794))

(assert (= (and b!1256789 condMapEmpty!49840) mapIsEmpty!49840))

(assert (= (and b!1256789 (not condMapEmpty!49840)) mapNonEmpty!49840))

(get-info :version)

(assert (= (and mapNonEmpty!49840 ((_ is ValueCellFull!15254) mapValue!49840)) b!1256795))

(assert (= (and b!1256789 ((_ is ValueCellFull!15254) mapDefault!49840)) b!1256792))

(assert (= start!105492 b!1256789))

(declare-fun m!1156981 () Bool)

(assert (=> b!1256787 m!1156981))

(declare-fun m!1156983 () Bool)

(assert (=> b!1256794 m!1156983))

(declare-fun m!1156985 () Bool)

(assert (=> b!1256794 m!1156985))

(declare-fun m!1156987 () Bool)

(assert (=> start!105492 m!1156987))

(declare-fun m!1156989 () Bool)

(assert (=> start!105492 m!1156989))

(declare-fun m!1156991 () Bool)

(assert (=> start!105492 m!1156991))

(declare-fun m!1156993 () Bool)

(assert (=> mapNonEmpty!49840 m!1156993))

(declare-fun m!1156995 () Bool)

(assert (=> b!1256788 m!1156995))

(declare-fun m!1156997 () Bool)

(assert (=> b!1256788 m!1156997))

(declare-fun m!1156999 () Bool)

(assert (=> b!1256788 m!1156999))

(declare-fun m!1157001 () Bool)

(assert (=> b!1256793 m!1157001))

(declare-fun m!1157003 () Bool)

(assert (=> b!1256793 m!1157003))

(declare-fun m!1157005 () Bool)

(assert (=> b!1256790 m!1157005))

(check-sat (not b!1256790) (not b!1256793) (not mapNonEmpty!49840) (not b!1256794) (not b!1256788) b_and!44971 (not b_next!27133) tp_is_empty!32035 (not b!1256787) (not start!105492))
(check-sat b_and!44971 (not b_next!27133))
