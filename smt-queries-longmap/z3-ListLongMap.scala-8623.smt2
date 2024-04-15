; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105022 () Bool)

(assert start!105022)

(declare-fun b_free!26773 () Bool)

(declare-fun b_next!26773 () Bool)

(assert (=> start!105022 (= b_free!26773 (not b_next!26773))))

(declare-fun tp!93818 () Bool)

(declare-fun b_and!44551 () Bool)

(assert (=> start!105022 (= tp!93818 b_and!44551)))

(declare-fun b!1251656 () Bool)

(declare-fun e!710796 () Bool)

(declare-fun tp_is_empty!31675 () Bool)

(assert (=> b!1251656 (= e!710796 tp_is_empty!31675)))

(declare-fun mapNonEmpty!49282 () Bool)

(declare-fun mapRes!49282 () Bool)

(declare-fun tp!93817 () Bool)

(assert (=> mapNonEmpty!49282 (= mapRes!49282 (and tp!93817 e!710796))))

(declare-datatypes ((V!47599 0))(
  ( (V!47600 (val!15900 Int)) )
))
(declare-datatypes ((ValueCell!15074 0))(
  ( (ValueCellFull!15074 (v!18597 V!47599)) (EmptyCell!15074) )
))
(declare-datatypes ((array!80937 0))(
  ( (array!80938 (arr!39033 (Array (_ BitVec 32) ValueCell!15074)) (size!39571 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80937)

(declare-fun mapValue!49282 () ValueCell!15074)

(declare-fun mapKey!49282 () (_ BitVec 32))

(declare-fun mapRest!49282 () (Array (_ BitVec 32) ValueCell!15074))

(assert (=> mapNonEmpty!49282 (= (arr!39033 _values!914) (store mapRest!49282 mapKey!49282 mapValue!49282))))

(declare-fun b!1251657 () Bool)

(declare-fun e!710798 () Bool)

(assert (=> b!1251657 (= e!710798 (not true))))

(declare-datatypes ((tuple2!20590 0))(
  ( (tuple2!20591 (_1!10306 (_ BitVec 64)) (_2!10306 V!47599)) )
))
(declare-datatypes ((List!27805 0))(
  ( (Nil!27802) (Cons!27801 (h!29010 tuple2!20590) (t!41273 List!27805)) )
))
(declare-datatypes ((ListLongMap!18463 0))(
  ( (ListLongMap!18464 (toList!9247 List!27805)) )
))
(declare-fun lt!564845 () ListLongMap!18463)

(declare-fun lt!564844 () ListLongMap!18463)

(assert (=> b!1251657 (= lt!564845 lt!564844)))

(declare-fun minValueAfter!43 () V!47599)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47599)

(declare-datatypes ((array!80939 0))(
  ( (array!80940 (arr!39034 (Array (_ BitVec 32) (_ BitVec 64))) (size!39572 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80939)

(declare-fun minValueBefore!43 () V!47599)

(declare-datatypes ((Unit!41460 0))(
  ( (Unit!41461) )
))
(declare-fun lt!564843 () Unit!41460)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!973 (array!80939 array!80937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47599 V!47599 V!47599 V!47599 (_ BitVec 32) Int) Unit!41460)

(assert (=> b!1251657 (= lt!564843 (lemmaNoChangeToArrayThenSameMapNoExtras!973 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5651 (array!80939 array!80937 (_ BitVec 32) (_ BitVec 32) V!47599 V!47599 (_ BitVec 32) Int) ListLongMap!18463)

(assert (=> b!1251657 (= lt!564844 (getCurrentListMapNoExtraKeys!5651 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251657 (= lt!564845 (getCurrentListMapNoExtraKeys!5651 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834807 () Bool)

(assert (=> start!105022 (=> (not res!834807) (not e!710798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105022 (= res!834807 (validMask!0 mask!1466))))

(assert (=> start!105022 e!710798))

(assert (=> start!105022 true))

(assert (=> start!105022 tp!93818))

(assert (=> start!105022 tp_is_empty!31675))

(declare-fun array_inv!29901 (array!80939) Bool)

(assert (=> start!105022 (array_inv!29901 _keys!1118)))

(declare-fun e!710800 () Bool)

(declare-fun array_inv!29902 (array!80937) Bool)

(assert (=> start!105022 (and (array_inv!29902 _values!914) e!710800)))

(declare-fun b!1251658 () Bool)

(declare-fun res!834809 () Bool)

(assert (=> b!1251658 (=> (not res!834809) (not e!710798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80939 (_ BitVec 32)) Bool)

(assert (=> b!1251658 (= res!834809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251659 () Bool)

(declare-fun res!834806 () Bool)

(assert (=> b!1251659 (=> (not res!834806) (not e!710798))))

(assert (=> b!1251659 (= res!834806 (and (= (size!39571 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39572 _keys!1118) (size!39571 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251660 () Bool)

(declare-fun e!710797 () Bool)

(assert (=> b!1251660 (= e!710797 tp_is_empty!31675)))

(declare-fun b!1251661 () Bool)

(assert (=> b!1251661 (= e!710800 (and e!710797 mapRes!49282))))

(declare-fun condMapEmpty!49282 () Bool)

(declare-fun mapDefault!49282 () ValueCell!15074)

(assert (=> b!1251661 (= condMapEmpty!49282 (= (arr!39033 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15074)) mapDefault!49282)))))

(declare-fun b!1251662 () Bool)

(declare-fun res!834808 () Bool)

(assert (=> b!1251662 (=> (not res!834808) (not e!710798))))

(declare-datatypes ((List!27806 0))(
  ( (Nil!27803) (Cons!27802 (h!29011 (_ BitVec 64)) (t!41274 List!27806)) )
))
(declare-fun arrayNoDuplicates!0 (array!80939 (_ BitVec 32) List!27806) Bool)

(assert (=> b!1251662 (= res!834808 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27803))))

(declare-fun mapIsEmpty!49282 () Bool)

(assert (=> mapIsEmpty!49282 mapRes!49282))

(assert (= (and start!105022 res!834807) b!1251659))

(assert (= (and b!1251659 res!834806) b!1251658))

(assert (= (and b!1251658 res!834809) b!1251662))

(assert (= (and b!1251662 res!834808) b!1251657))

(assert (= (and b!1251661 condMapEmpty!49282) mapIsEmpty!49282))

(assert (= (and b!1251661 (not condMapEmpty!49282)) mapNonEmpty!49282))

(get-info :version)

(assert (= (and mapNonEmpty!49282 ((_ is ValueCellFull!15074) mapValue!49282)) b!1251656))

(assert (= (and b!1251661 ((_ is ValueCellFull!15074) mapDefault!49282)) b!1251660))

(assert (= start!105022 b!1251661))

(declare-fun m!1151953 () Bool)

(assert (=> b!1251658 m!1151953))

(declare-fun m!1151955 () Bool)

(assert (=> b!1251662 m!1151955))

(declare-fun m!1151957 () Bool)

(assert (=> b!1251657 m!1151957))

(declare-fun m!1151959 () Bool)

(assert (=> b!1251657 m!1151959))

(declare-fun m!1151961 () Bool)

(assert (=> b!1251657 m!1151961))

(declare-fun m!1151963 () Bool)

(assert (=> mapNonEmpty!49282 m!1151963))

(declare-fun m!1151965 () Bool)

(assert (=> start!105022 m!1151965))

(declare-fun m!1151967 () Bool)

(assert (=> start!105022 m!1151967))

(declare-fun m!1151969 () Bool)

(assert (=> start!105022 m!1151969))

(check-sat (not b!1251657) (not mapNonEmpty!49282) (not b!1251658) (not b_next!26773) b_and!44551 tp_is_empty!31675 (not b!1251662) (not start!105022))
(check-sat b_and!44551 (not b_next!26773))
