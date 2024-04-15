; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105046 () Bool)

(assert start!105046)

(declare-fun b_free!26797 () Bool)

(declare-fun b_next!26797 () Bool)

(assert (=> start!105046 (= b_free!26797 (not b_next!26797))))

(declare-fun tp!93889 () Bool)

(declare-fun b_and!44575 () Bool)

(assert (=> start!105046 (= tp!93889 b_and!44575)))

(declare-fun b!1251908 () Bool)

(declare-fun e!710976 () Bool)

(assert (=> b!1251908 (= e!710976 (not true))))

(declare-datatypes ((V!47631 0))(
  ( (V!47632 (val!15912 Int)) )
))
(declare-datatypes ((tuple2!20608 0))(
  ( (tuple2!20609 (_1!10315 (_ BitVec 64)) (_2!10315 V!47631)) )
))
(declare-datatypes ((List!27822 0))(
  ( (Nil!27819) (Cons!27818 (h!29027 tuple2!20608) (t!41290 List!27822)) )
))
(declare-datatypes ((ListLongMap!18481 0))(
  ( (ListLongMap!18482 (toList!9256 List!27822)) )
))
(declare-fun lt!564952 () ListLongMap!18481)

(declare-fun lt!564951 () ListLongMap!18481)

(assert (=> b!1251908 (= lt!564952 lt!564951)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47631)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41478 0))(
  ( (Unit!41479) )
))
(declare-fun lt!564953 () Unit!41478)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47631)

(declare-datatypes ((ValueCell!15086 0))(
  ( (ValueCellFull!15086 (v!18609 V!47631)) (EmptyCell!15086) )
))
(declare-datatypes ((array!80985 0))(
  ( (array!80986 (arr!39057 (Array (_ BitVec 32) ValueCell!15086)) (size!39595 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80985)

(declare-fun minValueBefore!43 () V!47631)

(declare-datatypes ((array!80987 0))(
  ( (array!80988 (arr!39058 (Array (_ BitVec 32) (_ BitVec 64))) (size!39596 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80987)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!982 (array!80987 array!80985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47631 V!47631 V!47631 V!47631 (_ BitVec 32) Int) Unit!41478)

(assert (=> b!1251908 (= lt!564953 (lemmaNoChangeToArrayThenSameMapNoExtras!982 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5660 (array!80987 array!80985 (_ BitVec 32) (_ BitVec 32) V!47631 V!47631 (_ BitVec 32) Int) ListLongMap!18481)

(assert (=> b!1251908 (= lt!564951 (getCurrentListMapNoExtraKeys!5660 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251908 (= lt!564952 (getCurrentListMapNoExtraKeys!5660 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49318 () Bool)

(declare-fun mapRes!49318 () Bool)

(declare-fun tp!93890 () Bool)

(declare-fun e!710977 () Bool)

(assert (=> mapNonEmpty!49318 (= mapRes!49318 (and tp!93890 e!710977))))

(declare-fun mapValue!49318 () ValueCell!15086)

(declare-fun mapKey!49318 () (_ BitVec 32))

(declare-fun mapRest!49318 () (Array (_ BitVec 32) ValueCell!15086))

(assert (=> mapNonEmpty!49318 (= (arr!39057 _values!914) (store mapRest!49318 mapKey!49318 mapValue!49318))))

(declare-fun b!1251909 () Bool)

(declare-fun res!834950 () Bool)

(assert (=> b!1251909 (=> (not res!834950) (not e!710976))))

(assert (=> b!1251909 (= res!834950 (and (= (size!39595 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39596 _keys!1118) (size!39595 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251910 () Bool)

(declare-fun tp_is_empty!31699 () Bool)

(assert (=> b!1251910 (= e!710977 tp_is_empty!31699)))

(declare-fun b!1251911 () Bool)

(declare-fun res!834953 () Bool)

(assert (=> b!1251911 (=> (not res!834953) (not e!710976))))

(declare-datatypes ((List!27823 0))(
  ( (Nil!27820) (Cons!27819 (h!29028 (_ BitVec 64)) (t!41291 List!27823)) )
))
(declare-fun arrayNoDuplicates!0 (array!80987 (_ BitVec 32) List!27823) Bool)

(assert (=> b!1251911 (= res!834953 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27820))))

(declare-fun b!1251912 () Bool)

(declare-fun e!710978 () Bool)

(declare-fun e!710980 () Bool)

(assert (=> b!1251912 (= e!710978 (and e!710980 mapRes!49318))))

(declare-fun condMapEmpty!49318 () Bool)

(declare-fun mapDefault!49318 () ValueCell!15086)

(assert (=> b!1251912 (= condMapEmpty!49318 (= (arr!39057 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15086)) mapDefault!49318)))))

(declare-fun b!1251913 () Bool)

(declare-fun res!834951 () Bool)

(assert (=> b!1251913 (=> (not res!834951) (not e!710976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80987 (_ BitVec 32)) Bool)

(assert (=> b!1251913 (= res!834951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834952 () Bool)

(assert (=> start!105046 (=> (not res!834952) (not e!710976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105046 (= res!834952 (validMask!0 mask!1466))))

(assert (=> start!105046 e!710976))

(assert (=> start!105046 true))

(assert (=> start!105046 tp!93889))

(assert (=> start!105046 tp_is_empty!31699))

(declare-fun array_inv!29917 (array!80987) Bool)

(assert (=> start!105046 (array_inv!29917 _keys!1118)))

(declare-fun array_inv!29918 (array!80985) Bool)

(assert (=> start!105046 (and (array_inv!29918 _values!914) e!710978)))

(declare-fun b!1251914 () Bool)

(assert (=> b!1251914 (= e!710980 tp_is_empty!31699)))

(declare-fun mapIsEmpty!49318 () Bool)

(assert (=> mapIsEmpty!49318 mapRes!49318))

(assert (= (and start!105046 res!834952) b!1251909))

(assert (= (and b!1251909 res!834950) b!1251913))

(assert (= (and b!1251913 res!834951) b!1251911))

(assert (= (and b!1251911 res!834953) b!1251908))

(assert (= (and b!1251912 condMapEmpty!49318) mapIsEmpty!49318))

(assert (= (and b!1251912 (not condMapEmpty!49318)) mapNonEmpty!49318))

(get-info :version)

(assert (= (and mapNonEmpty!49318 ((_ is ValueCellFull!15086) mapValue!49318)) b!1251910))

(assert (= (and b!1251912 ((_ is ValueCellFull!15086) mapDefault!49318)) b!1251914))

(assert (= start!105046 b!1251912))

(declare-fun m!1152169 () Bool)

(assert (=> b!1251911 m!1152169))

(declare-fun m!1152171 () Bool)

(assert (=> b!1251913 m!1152171))

(declare-fun m!1152173 () Bool)

(assert (=> start!105046 m!1152173))

(declare-fun m!1152175 () Bool)

(assert (=> start!105046 m!1152175))

(declare-fun m!1152177 () Bool)

(assert (=> start!105046 m!1152177))

(declare-fun m!1152179 () Bool)

(assert (=> mapNonEmpty!49318 m!1152179))

(declare-fun m!1152181 () Bool)

(assert (=> b!1251908 m!1152181))

(declare-fun m!1152183 () Bool)

(assert (=> b!1251908 m!1152183))

(declare-fun m!1152185 () Bool)

(assert (=> b!1251908 m!1152185))

(check-sat (not b_next!26797) (not start!105046) b_and!44575 tp_is_empty!31699 (not b!1251913) (not b!1251908) (not b!1251911) (not mapNonEmpty!49318))
(check-sat b_and!44575 (not b_next!26797))
