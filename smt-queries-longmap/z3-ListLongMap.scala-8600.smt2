; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105054 () Bool)

(assert start!105054)

(declare-fun b_free!26635 () Bool)

(declare-fun b_next!26635 () Bool)

(assert (=> start!105054 (= b_free!26635 (not b_next!26635))))

(declare-fun tp!93394 () Bool)

(declare-fun b_and!44405 () Bool)

(assert (=> start!105054 (= tp!93394 b_and!44405)))

(declare-fun b!1250862 () Bool)

(declare-fun res!834055 () Bool)

(declare-fun e!710068 () Bool)

(assert (=> b!1250862 (=> (not res!834055) (not e!710068))))

(declare-datatypes ((array!80793 0))(
  ( (array!80794 (arr!38959 (Array (_ BitVec 32) (_ BitVec 64))) (size!39496 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80793)

(declare-datatypes ((List!27674 0))(
  ( (Nil!27671) (Cons!27670 (h!28888 (_ BitVec 64)) (t!41137 List!27674)) )
))
(declare-fun arrayNoDuplicates!0 (array!80793 (_ BitVec 32) List!27674) Bool)

(assert (=> b!1250862 (= res!834055 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27671))))

(declare-fun b!1250863 () Bool)

(declare-fun res!834052 () Bool)

(assert (=> b!1250863 (=> (not res!834052) (not e!710068))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47415 0))(
  ( (V!47416 (val!15831 Int)) )
))
(declare-datatypes ((ValueCell!15005 0))(
  ( (ValueCellFull!15005 (v!18523 V!47415)) (EmptyCell!15005) )
))
(declare-datatypes ((array!80795 0))(
  ( (array!80796 (arr!38960 (Array (_ BitVec 32) ValueCell!15005)) (size!39497 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80795)

(assert (=> b!1250863 (= res!834052 (and (= (size!39497 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39496 _keys!1118) (size!39497 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250864 () Bool)

(declare-fun e!710069 () Bool)

(declare-fun tp_is_empty!31537 () Bool)

(assert (=> b!1250864 (= e!710069 tp_is_empty!31537)))

(declare-fun mapIsEmpty!49066 () Bool)

(declare-fun mapRes!49066 () Bool)

(assert (=> mapIsEmpty!49066 mapRes!49066))

(declare-fun b!1250865 () Bool)

(declare-fun e!710067 () Bool)

(assert (=> b!1250865 (= e!710067 (and e!710069 mapRes!49066))))

(declare-fun condMapEmpty!49066 () Bool)

(declare-fun mapDefault!49066 () ValueCell!15005)

(assert (=> b!1250865 (= condMapEmpty!49066 (= (arr!38960 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15005)) mapDefault!49066)))))

(declare-fun b!1250866 () Bool)

(assert (=> b!1250866 (= e!710068 (not true))))

(declare-datatypes ((tuple2!20420 0))(
  ( (tuple2!20421 (_1!10221 (_ BitVec 64)) (_2!10221 V!47415)) )
))
(declare-datatypes ((List!27675 0))(
  ( (Nil!27672) (Cons!27671 (h!28889 tuple2!20420) (t!41138 List!27675)) )
))
(declare-datatypes ((ListLongMap!18301 0))(
  ( (ListLongMap!18302 (toList!9166 List!27675)) )
))
(declare-fun lt!564266 () ListLongMap!18301)

(declare-fun lt!564264 () ListLongMap!18301)

(assert (=> b!1250866 (= lt!564266 lt!564264)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47415)

(declare-fun zeroValue!871 () V!47415)

(declare-fun minValueBefore!43 () V!47415)

(declare-datatypes ((Unit!41472 0))(
  ( (Unit!41473) )
))
(declare-fun lt!564265 () Unit!41472)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!915 (array!80793 array!80795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47415 V!47415 V!47415 V!47415 (_ BitVec 32) Int) Unit!41472)

(assert (=> b!1250866 (= lt!564265 (lemmaNoChangeToArrayThenSameMapNoExtras!915 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5601 (array!80793 array!80795 (_ BitVec 32) (_ BitVec 32) V!47415 V!47415 (_ BitVec 32) Int) ListLongMap!18301)

(assert (=> b!1250866 (= lt!564264 (getCurrentListMapNoExtraKeys!5601 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250866 (= lt!564266 (getCurrentListMapNoExtraKeys!5601 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250867 () Bool)

(declare-fun e!710066 () Bool)

(assert (=> b!1250867 (= e!710066 tp_is_empty!31537)))

(declare-fun mapNonEmpty!49066 () Bool)

(declare-fun tp!93395 () Bool)

(assert (=> mapNonEmpty!49066 (= mapRes!49066 (and tp!93395 e!710066))))

(declare-fun mapValue!49066 () ValueCell!15005)

(declare-fun mapRest!49066 () (Array (_ BitVec 32) ValueCell!15005))

(declare-fun mapKey!49066 () (_ BitVec 32))

(assert (=> mapNonEmpty!49066 (= (arr!38960 _values!914) (store mapRest!49066 mapKey!49066 mapValue!49066))))

(declare-fun b!1250868 () Bool)

(declare-fun res!834054 () Bool)

(assert (=> b!1250868 (=> (not res!834054) (not e!710068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80793 (_ BitVec 32)) Bool)

(assert (=> b!1250868 (= res!834054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834053 () Bool)

(assert (=> start!105054 (=> (not res!834053) (not e!710068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105054 (= res!834053 (validMask!0 mask!1466))))

(assert (=> start!105054 e!710068))

(assert (=> start!105054 true))

(assert (=> start!105054 tp!93394))

(assert (=> start!105054 tp_is_empty!31537))

(declare-fun array_inv!29839 (array!80793) Bool)

(assert (=> start!105054 (array_inv!29839 _keys!1118)))

(declare-fun array_inv!29840 (array!80795) Bool)

(assert (=> start!105054 (and (array_inv!29840 _values!914) e!710067)))

(assert (= (and start!105054 res!834053) b!1250863))

(assert (= (and b!1250863 res!834052) b!1250868))

(assert (= (and b!1250868 res!834054) b!1250862))

(assert (= (and b!1250862 res!834055) b!1250866))

(assert (= (and b!1250865 condMapEmpty!49066) mapIsEmpty!49066))

(assert (= (and b!1250865 (not condMapEmpty!49066)) mapNonEmpty!49066))

(get-info :version)

(assert (= (and mapNonEmpty!49066 ((_ is ValueCellFull!15005) mapValue!49066)) b!1250867))

(assert (= (and b!1250865 ((_ is ValueCellFull!15005) mapDefault!49066)) b!1250864))

(assert (= start!105054 b!1250865))

(declare-fun m!1152081 () Bool)

(assert (=> b!1250866 m!1152081))

(declare-fun m!1152083 () Bool)

(assert (=> b!1250866 m!1152083))

(declare-fun m!1152085 () Bool)

(assert (=> b!1250866 m!1152085))

(declare-fun m!1152087 () Bool)

(assert (=> b!1250868 m!1152087))

(declare-fun m!1152089 () Bool)

(assert (=> mapNonEmpty!49066 m!1152089))

(declare-fun m!1152091 () Bool)

(assert (=> b!1250862 m!1152091))

(declare-fun m!1152093 () Bool)

(assert (=> start!105054 m!1152093))

(declare-fun m!1152095 () Bool)

(assert (=> start!105054 m!1152095))

(declare-fun m!1152097 () Bool)

(assert (=> start!105054 m!1152097))

(check-sat (not b!1250866) (not mapNonEmpty!49066) tp_is_empty!31537 (not b!1250868) (not b_next!26635) (not start!105054) (not b!1250862) b_and!44405)
(check-sat b_and!44405 (not b_next!26635))
