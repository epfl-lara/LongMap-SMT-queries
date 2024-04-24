; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105256 () Bool)

(assert start!105256)

(declare-fun b_free!26779 () Bool)

(declare-fun b_next!26779 () Bool)

(assert (=> start!105256 (= b_free!26779 (not b_next!26779))))

(declare-fun tp!93835 () Bool)

(declare-fun b_and!44577 () Bool)

(assert (=> start!105256 (= tp!93835 b_and!44577)))

(declare-fun mapNonEmpty!49291 () Bool)

(declare-fun mapRes!49291 () Bool)

(declare-fun tp!93836 () Bool)

(declare-fun e!711735 () Bool)

(assert (=> mapNonEmpty!49291 (= mapRes!49291 (and tp!93836 e!711735))))

(declare-fun mapKey!49291 () (_ BitVec 32))

(declare-datatypes ((V!47607 0))(
  ( (V!47608 (val!15903 Int)) )
))
(declare-datatypes ((ValueCell!15077 0))(
  ( (ValueCellFull!15077 (v!18597 V!47607)) (EmptyCell!15077) )
))
(declare-fun mapValue!49291 () ValueCell!15077)

(declare-datatypes ((array!81075 0))(
  ( (array!81076 (arr!39097 (Array (_ BitVec 32) ValueCell!15077)) (size!39634 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81075)

(declare-fun mapRest!49291 () (Array (_ BitVec 32) ValueCell!15077))

(assert (=> mapNonEmpty!49291 (= (arr!39097 _values!914) (store mapRest!49291 mapKey!49291 mapValue!49291))))

(declare-fun b!1253106 () Bool)

(declare-fun res!835404 () Bool)

(declare-fun e!711736 () Bool)

(assert (=> b!1253106 (=> (not res!835404) (not e!711736))))

(declare-datatypes ((array!81077 0))(
  ( (array!81078 (arr!39098 (Array (_ BitVec 32) (_ BitVec 64))) (size!39635 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81077)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81077 (_ BitVec 32)) Bool)

(assert (=> b!1253106 (= res!835404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253107 () Bool)

(declare-fun res!835402 () Bool)

(assert (=> b!1253107 (=> (not res!835402) (not e!711736))))

(declare-datatypes ((List!27777 0))(
  ( (Nil!27774) (Cons!27773 (h!28991 (_ BitVec 64)) (t!41246 List!27777)) )
))
(declare-fun arrayNoDuplicates!0 (array!81077 (_ BitVec 32) List!27777) Bool)

(assert (=> b!1253107 (= res!835402 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27774))))

(declare-fun mapIsEmpty!49291 () Bool)

(assert (=> mapIsEmpty!49291 mapRes!49291))

(declare-fun b!1253108 () Bool)

(declare-fun e!711737 () Bool)

(declare-fun e!711734 () Bool)

(assert (=> b!1253108 (= e!711737 (and e!711734 mapRes!49291))))

(declare-fun condMapEmpty!49291 () Bool)

(declare-fun mapDefault!49291 () ValueCell!15077)

(assert (=> b!1253108 (= condMapEmpty!49291 (= (arr!39097 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15077)) mapDefault!49291)))))

(declare-fun b!1253110 () Bool)

(declare-fun res!835403 () Bool)

(assert (=> b!1253110 (=> (not res!835403) (not e!711736))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253110 (= res!835403 (and (= (size!39634 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39635 _keys!1118) (size!39634 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253111 () Bool)

(assert (=> b!1253111 (= e!711736 (not true))))

(declare-datatypes ((tuple2!20534 0))(
  ( (tuple2!20535 (_1!10278 (_ BitVec 64)) (_2!10278 V!47607)) )
))
(declare-datatypes ((List!27778 0))(
  ( (Nil!27775) (Cons!27774 (h!28992 tuple2!20534) (t!41247 List!27778)) )
))
(declare-datatypes ((ListLongMap!18415 0))(
  ( (ListLongMap!18416 (toList!9223 List!27778)) )
))
(declare-fun lt!565534 () ListLongMap!18415)

(declare-fun lt!565535 () ListLongMap!18415)

(assert (=> b!1253111 (= lt!565534 lt!565535)))

(declare-fun minValueAfter!43 () V!47607)

(declare-fun zeroValue!871 () V!47607)

(declare-datatypes ((Unit!41584 0))(
  ( (Unit!41585) )
))
(declare-fun lt!565533 () Unit!41584)

(declare-fun minValueBefore!43 () V!47607)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!964 (array!81077 array!81075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47607 V!47607 V!47607 V!47607 (_ BitVec 32) Int) Unit!41584)

(assert (=> b!1253111 (= lt!565533 (lemmaNoChangeToArrayThenSameMapNoExtras!964 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5650 (array!81077 array!81075 (_ BitVec 32) (_ BitVec 32) V!47607 V!47607 (_ BitVec 32) Int) ListLongMap!18415)

(assert (=> b!1253111 (= lt!565535 (getCurrentListMapNoExtraKeys!5650 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253111 (= lt!565534 (getCurrentListMapNoExtraKeys!5650 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253112 () Bool)

(declare-fun tp_is_empty!31681 () Bool)

(assert (=> b!1253112 (= e!711735 tp_is_empty!31681)))

(declare-fun b!1253109 () Bool)

(assert (=> b!1253109 (= e!711734 tp_is_empty!31681)))

(declare-fun res!835405 () Bool)

(assert (=> start!105256 (=> (not res!835405) (not e!711736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105256 (= res!835405 (validMask!0 mask!1466))))

(assert (=> start!105256 e!711736))

(assert (=> start!105256 true))

(assert (=> start!105256 tp!93835))

(assert (=> start!105256 tp_is_empty!31681))

(declare-fun array_inv!29931 (array!81077) Bool)

(assert (=> start!105256 (array_inv!29931 _keys!1118)))

(declare-fun array_inv!29932 (array!81075) Bool)

(assert (=> start!105256 (and (array_inv!29932 _values!914) e!711737)))

(assert (= (and start!105256 res!835405) b!1253110))

(assert (= (and b!1253110 res!835403) b!1253106))

(assert (= (and b!1253106 res!835404) b!1253107))

(assert (= (and b!1253107 res!835402) b!1253111))

(assert (= (and b!1253108 condMapEmpty!49291) mapIsEmpty!49291))

(assert (= (and b!1253108 (not condMapEmpty!49291)) mapNonEmpty!49291))

(get-info :version)

(assert (= (and mapNonEmpty!49291 ((_ is ValueCellFull!15077) mapValue!49291)) b!1253112))

(assert (= (and b!1253108 ((_ is ValueCellFull!15077) mapDefault!49291)) b!1253109))

(assert (= start!105256 b!1253108))

(declare-fun m!1154139 () Bool)

(assert (=> b!1253107 m!1154139))

(declare-fun m!1154141 () Bool)

(assert (=> start!105256 m!1154141))

(declare-fun m!1154143 () Bool)

(assert (=> start!105256 m!1154143))

(declare-fun m!1154145 () Bool)

(assert (=> start!105256 m!1154145))

(declare-fun m!1154147 () Bool)

(assert (=> b!1253111 m!1154147))

(declare-fun m!1154149 () Bool)

(assert (=> b!1253111 m!1154149))

(declare-fun m!1154151 () Bool)

(assert (=> b!1253111 m!1154151))

(declare-fun m!1154153 () Bool)

(assert (=> b!1253106 m!1154153))

(declare-fun m!1154155 () Bool)

(assert (=> mapNonEmpty!49291 m!1154155))

(check-sat (not b_next!26779) (not b!1253106) (not mapNonEmpty!49291) tp_is_empty!31681 (not b!1253111) (not start!105256) (not b!1253107) b_and!44577)
(check-sat b_and!44577 (not b_next!26779))
