; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104952 () Bool)

(assert start!104952)

(declare-fun b_free!26721 () Bool)

(declare-fun b_next!26721 () Bool)

(assert (=> start!104952 (= b_free!26721 (not b_next!26721))))

(declare-fun tp!93658 () Bool)

(declare-fun b_and!44507 () Bool)

(assert (=> start!104952 (= tp!93658 b_and!44507)))

(declare-fun b!1250883 () Bool)

(declare-fun e!710202 () Bool)

(declare-fun tp_is_empty!31623 () Bool)

(assert (=> b!1250883 (= e!710202 tp_is_empty!31623)))

(declare-fun b!1250884 () Bool)

(declare-fun e!710204 () Bool)

(declare-fun mapRes!49201 () Bool)

(assert (=> b!1250884 (= e!710204 (and e!710202 mapRes!49201))))

(declare-fun condMapEmpty!49201 () Bool)

(declare-datatypes ((V!47529 0))(
  ( (V!47530 (val!15874 Int)) )
))
(declare-datatypes ((ValueCell!15048 0))(
  ( (ValueCellFull!15048 (v!18571 V!47529)) (EmptyCell!15048) )
))
(declare-datatypes ((array!80914 0))(
  ( (array!80915 (arr!39022 (Array (_ BitVec 32) ValueCell!15048)) (size!39558 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80914)

(declare-fun mapDefault!49201 () ValueCell!15048)

(assert (=> b!1250884 (= condMapEmpty!49201 (= (arr!39022 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15048)) mapDefault!49201)))))

(declare-fun b!1250885 () Bool)

(declare-fun e!710203 () Bool)

(declare-fun e!710200 () Bool)

(assert (=> b!1250885 (= e!710203 e!710200)))

(declare-fun res!834324 () Bool)

(assert (=> b!1250885 (=> res!834324 e!710200)))

(declare-datatypes ((tuple2!20458 0))(
  ( (tuple2!20459 (_1!10240 (_ BitVec 64)) (_2!10240 V!47529)) )
))
(declare-datatypes ((List!27696 0))(
  ( (Nil!27693) (Cons!27692 (h!28901 tuple2!20458) (t!41171 List!27696)) )
))
(declare-datatypes ((ListLongMap!18331 0))(
  ( (ListLongMap!18332 (toList!9181 List!27696)) )
))
(declare-fun lt!564515 () ListLongMap!18331)

(declare-fun contains!7494 (ListLongMap!18331 (_ BitVec 64)) Bool)

(assert (=> b!1250885 (= res!834324 (contains!7494 lt!564515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47529)

(declare-datatypes ((array!80916 0))(
  ( (array!80917 (arr!39023 (Array (_ BitVec 32) (_ BitVec 64))) (size!39559 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80916)

(declare-fun minValueBefore!43 () V!47529)

(declare-fun getCurrentListMap!4454 (array!80916 array!80914 (_ BitVec 32) (_ BitVec 32) V!47529 V!47529 (_ BitVec 32) Int) ListLongMap!18331)

(assert (=> b!1250885 (= lt!564515 (getCurrentListMap!4454 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250886 () Bool)

(assert (=> b!1250886 (= e!710200 true)))

(declare-fun -!2005 (ListLongMap!18331 (_ BitVec 64)) ListLongMap!18331)

(assert (=> b!1250886 (= (-!2005 lt!564515 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564515)))

(declare-datatypes ((Unit!41553 0))(
  ( (Unit!41554) )
))
(declare-fun lt!564513 () Unit!41553)

(declare-fun removeNotPresentStillSame!100 (ListLongMap!18331 (_ BitVec 64)) Unit!41553)

(assert (=> b!1250886 (= lt!564513 (removeNotPresentStillSame!100 lt!564515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250887 () Bool)

(declare-fun e!710205 () Bool)

(assert (=> b!1250887 (= e!710205 tp_is_empty!31623)))

(declare-fun b!1250888 () Bool)

(declare-fun e!710201 () Bool)

(assert (=> b!1250888 (= e!710201 (not e!710203))))

(declare-fun res!834323 () Bool)

(assert (=> b!1250888 (=> res!834323 e!710203)))

(assert (=> b!1250888 (= res!834323 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564514 () ListLongMap!18331)

(declare-fun lt!564512 () ListLongMap!18331)

(assert (=> b!1250888 (= lt!564514 lt!564512)))

(declare-fun minValueAfter!43 () V!47529)

(declare-fun lt!564516 () Unit!41553)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!945 (array!80916 array!80914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47529 V!47529 V!47529 V!47529 (_ BitVec 32) Int) Unit!41553)

(assert (=> b!1250888 (= lt!564516 (lemmaNoChangeToArrayThenSameMapNoExtras!945 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5581 (array!80916 array!80914 (_ BitVec 32) (_ BitVec 32) V!47529 V!47529 (_ BitVec 32) Int) ListLongMap!18331)

(assert (=> b!1250888 (= lt!564512 (getCurrentListMapNoExtraKeys!5581 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250888 (= lt!564514 (getCurrentListMapNoExtraKeys!5581 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250889 () Bool)

(declare-fun res!834321 () Bool)

(assert (=> b!1250889 (=> (not res!834321) (not e!710201))))

(assert (=> b!1250889 (= res!834321 (and (= (size!39558 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39559 _keys!1118) (size!39558 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!834322 () Bool)

(assert (=> start!104952 (=> (not res!834322) (not e!710201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104952 (= res!834322 (validMask!0 mask!1466))))

(assert (=> start!104952 e!710201))

(assert (=> start!104952 true))

(assert (=> start!104952 tp!93658))

(assert (=> start!104952 tp_is_empty!31623))

(declare-fun array_inv!29767 (array!80916) Bool)

(assert (=> start!104952 (array_inv!29767 _keys!1118)))

(declare-fun array_inv!29768 (array!80914) Bool)

(assert (=> start!104952 (and (array_inv!29768 _values!914) e!710204)))

(declare-fun b!1250890 () Bool)

(declare-fun res!834325 () Bool)

(assert (=> b!1250890 (=> (not res!834325) (not e!710201))))

(declare-datatypes ((List!27697 0))(
  ( (Nil!27694) (Cons!27693 (h!28902 (_ BitVec 64)) (t!41172 List!27697)) )
))
(declare-fun arrayNoDuplicates!0 (array!80916 (_ BitVec 32) List!27697) Bool)

(assert (=> b!1250890 (= res!834325 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27694))))

(declare-fun mapNonEmpty!49201 () Bool)

(declare-fun tp!93659 () Bool)

(assert (=> mapNonEmpty!49201 (= mapRes!49201 (and tp!93659 e!710205))))

(declare-fun mapKey!49201 () (_ BitVec 32))

(declare-fun mapRest!49201 () (Array (_ BitVec 32) ValueCell!15048))

(declare-fun mapValue!49201 () ValueCell!15048)

(assert (=> mapNonEmpty!49201 (= (arr!39022 _values!914) (store mapRest!49201 mapKey!49201 mapValue!49201))))

(declare-fun b!1250891 () Bool)

(declare-fun res!834326 () Bool)

(assert (=> b!1250891 (=> (not res!834326) (not e!710201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80916 (_ BitVec 32)) Bool)

(assert (=> b!1250891 (= res!834326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49201 () Bool)

(assert (=> mapIsEmpty!49201 mapRes!49201))

(assert (= (and start!104952 res!834322) b!1250889))

(assert (= (and b!1250889 res!834321) b!1250891))

(assert (= (and b!1250891 res!834326) b!1250890))

(assert (= (and b!1250890 res!834325) b!1250888))

(assert (= (and b!1250888 (not res!834323)) b!1250885))

(assert (= (and b!1250885 (not res!834324)) b!1250886))

(assert (= (and b!1250884 condMapEmpty!49201) mapIsEmpty!49201))

(assert (= (and b!1250884 (not condMapEmpty!49201)) mapNonEmpty!49201))

(get-info :version)

(assert (= (and mapNonEmpty!49201 ((_ is ValueCellFull!15048) mapValue!49201)) b!1250887))

(assert (= (and b!1250884 ((_ is ValueCellFull!15048) mapDefault!49201)) b!1250883))

(assert (= start!104952 b!1250884))

(declare-fun m!1151671 () Bool)

(assert (=> b!1250888 m!1151671))

(declare-fun m!1151673 () Bool)

(assert (=> b!1250888 m!1151673))

(declare-fun m!1151675 () Bool)

(assert (=> b!1250888 m!1151675))

(declare-fun m!1151677 () Bool)

(assert (=> b!1250885 m!1151677))

(declare-fun m!1151679 () Bool)

(assert (=> b!1250885 m!1151679))

(declare-fun m!1151681 () Bool)

(assert (=> b!1250890 m!1151681))

(declare-fun m!1151683 () Bool)

(assert (=> b!1250891 m!1151683))

(declare-fun m!1151685 () Bool)

(assert (=> start!104952 m!1151685))

(declare-fun m!1151687 () Bool)

(assert (=> start!104952 m!1151687))

(declare-fun m!1151689 () Bool)

(assert (=> start!104952 m!1151689))

(declare-fun m!1151691 () Bool)

(assert (=> mapNonEmpty!49201 m!1151691))

(declare-fun m!1151693 () Bool)

(assert (=> b!1250886 m!1151693))

(declare-fun m!1151695 () Bool)

(assert (=> b!1250886 m!1151695))

(check-sat (not b!1250891) (not mapNonEmpty!49201) (not b!1250888) (not b!1250885) (not start!104952) (not b!1250890) (not b!1250886) (not b_next!26721) tp_is_empty!31623 b_and!44507)
(check-sat b_and!44507 (not b_next!26721))
