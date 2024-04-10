; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105700 () Bool)

(assert start!105700)

(declare-fun b_free!27285 () Bool)

(declare-fun b_next!27285 () Bool)

(assert (=> start!105700 (= b_free!27285 (not b_next!27285))))

(declare-fun tp!95380 () Bool)

(declare-fun b_and!45169 () Bool)

(assert (=> start!105700 (= tp!95380 b_and!45169)))

(declare-fun b!1259068 () Bool)

(declare-fun res!839139 () Bool)

(declare-fun e!716193 () Bool)

(assert (=> b!1259068 (=> (not res!839139) (not e!716193))))

(declare-datatypes ((array!81992 0))(
  ( (array!81993 (arr!39551 (Array (_ BitVec 32) (_ BitVec 64))) (size!40087 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81992)

(declare-datatypes ((List!28086 0))(
  ( (Nil!28083) (Cons!28082 (h!29291 (_ BitVec 64)) (t!41581 List!28086)) )
))
(declare-fun arrayNoDuplicates!0 (array!81992 (_ BitVec 32) List!28086) Bool)

(assert (=> b!1259068 (= res!839139 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28083))))

(declare-fun mapNonEmpty!50077 () Bool)

(declare-fun mapRes!50077 () Bool)

(declare-fun tp!95381 () Bool)

(declare-fun e!716194 () Bool)

(assert (=> mapNonEmpty!50077 (= mapRes!50077 (and tp!95381 e!716194))))

(declare-datatypes ((V!48281 0))(
  ( (V!48282 (val!16156 Int)) )
))
(declare-datatypes ((ValueCell!15330 0))(
  ( (ValueCellFull!15330 (v!18858 V!48281)) (EmptyCell!15330) )
))
(declare-fun mapValue!50077 () ValueCell!15330)

(declare-datatypes ((array!81994 0))(
  ( (array!81995 (arr!39552 (Array (_ BitVec 32) ValueCell!15330)) (size!40088 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81994)

(declare-fun mapRest!50077 () (Array (_ BitVec 32) ValueCell!15330))

(declare-fun mapKey!50077 () (_ BitVec 32))

(assert (=> mapNonEmpty!50077 (= (arr!39552 _values!914) (store mapRest!50077 mapKey!50077 mapValue!50077))))

(declare-fun res!839135 () Bool)

(assert (=> start!105700 (=> (not res!839135) (not e!716193))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105700 (= res!839135 (validMask!0 mask!1466))))

(assert (=> start!105700 e!716193))

(assert (=> start!105700 true))

(assert (=> start!105700 tp!95380))

(declare-fun tp_is_empty!32187 () Bool)

(assert (=> start!105700 tp_is_empty!32187))

(declare-fun array_inv!30115 (array!81992) Bool)

(assert (=> start!105700 (array_inv!30115 _keys!1118)))

(declare-fun e!716198 () Bool)

(declare-fun array_inv!30116 (array!81994) Bool)

(assert (=> start!105700 (and (array_inv!30116 _values!914) e!716198)))

(declare-fun b!1259069 () Bool)

(declare-fun e!716197 () Bool)

(assert (=> b!1259069 (= e!716198 (and e!716197 mapRes!50077))))

(declare-fun condMapEmpty!50077 () Bool)

(declare-fun mapDefault!50077 () ValueCell!15330)

(assert (=> b!1259069 (= condMapEmpty!50077 (= (arr!39552 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15330)) mapDefault!50077)))))

(declare-fun b!1259070 () Bool)

(declare-fun res!839136 () Bool)

(assert (=> b!1259070 (=> (not res!839136) (not e!716193))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1259070 (= res!839136 (and (= (size!40088 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40087 _keys!1118) (size!40088 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259071 () Bool)

(declare-fun e!716196 () Bool)

(assert (=> b!1259071 (= e!716196 true)))

(declare-datatypes ((tuple2!20876 0))(
  ( (tuple2!20877 (_1!10449 (_ BitVec 64)) (_2!10449 V!48281)) )
))
(declare-datatypes ((List!28087 0))(
  ( (Nil!28084) (Cons!28083 (h!29292 tuple2!20876) (t!41582 List!28087)) )
))
(declare-datatypes ((ListLongMap!18749 0))(
  ( (ListLongMap!18750 (toList!9390 List!28087)) )
))
(declare-fun lt!569657 () ListLongMap!18749)

(declare-fun lt!569658 () ListLongMap!18749)

(declare-fun -!2099 (ListLongMap!18749 (_ BitVec 64)) ListLongMap!18749)

(assert (=> b!1259071 (= lt!569657 (-!2099 lt!569658 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569665 () ListLongMap!18749)

(declare-fun lt!569666 () ListLongMap!18749)

(assert (=> b!1259071 (= (-!2099 lt!569665 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569666)))

(declare-datatypes ((Unit!41963 0))(
  ( (Unit!41964) )
))
(declare-fun lt!569664 () Unit!41963)

(declare-fun minValueBefore!43 () V!48281)

(declare-fun addThenRemoveForNewKeyIsSame!336 (ListLongMap!18749 (_ BitVec 64) V!48281) Unit!41963)

(assert (=> b!1259071 (= lt!569664 (addThenRemoveForNewKeyIsSame!336 lt!569666 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716199 () Bool)

(assert (=> b!1259071 e!716199))

(declare-fun res!839137 () Bool)

(assert (=> b!1259071 (=> (not res!839137) (not e!716199))))

(assert (=> b!1259071 (= res!839137 (= lt!569658 lt!569665))))

(declare-fun +!4196 (ListLongMap!18749 tuple2!20876) ListLongMap!18749)

(assert (=> b!1259071 (= lt!569665 (+!4196 lt!569666 (tuple2!20877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569661 () ListLongMap!18749)

(declare-fun lt!569663 () tuple2!20876)

(assert (=> b!1259071 (= lt!569666 (+!4196 lt!569661 lt!569663))))

(declare-fun zeroValue!871 () V!48281)

(assert (=> b!1259071 (= lt!569663 (tuple2!20877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48281)

(declare-fun lt!569659 () ListLongMap!18749)

(declare-fun getCurrentListMap!4590 (array!81992 array!81994 (_ BitVec 32) (_ BitVec 32) V!48281 V!48281 (_ BitVec 32) Int) ListLongMap!18749)

(assert (=> b!1259071 (= lt!569659 (getCurrentListMap!4590 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259071 (= lt!569658 (getCurrentListMap!4590 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259072 () Bool)

(assert (=> b!1259072 (= e!716194 tp_is_empty!32187)))

(declare-fun b!1259073 () Bool)

(declare-fun res!839134 () Bool)

(assert (=> b!1259073 (=> (not res!839134) (not e!716193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81992 (_ BitVec 32)) Bool)

(assert (=> b!1259073 (= res!839134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259074 () Bool)

(assert (=> b!1259074 (= e!716193 (not e!716196))))

(declare-fun res!839138 () Bool)

(assert (=> b!1259074 (=> res!839138 e!716196)))

(assert (=> b!1259074 (= res!839138 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569660 () ListLongMap!18749)

(assert (=> b!1259074 (= lt!569661 lt!569660)))

(declare-fun lt!569662 () Unit!41963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1131 (array!81992 array!81994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48281 V!48281 V!48281 V!48281 (_ BitVec 32) Int) Unit!41963)

(assert (=> b!1259074 (= lt!569662 (lemmaNoChangeToArrayThenSameMapNoExtras!1131 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5767 (array!81992 array!81994 (_ BitVec 32) (_ BitVec 32) V!48281 V!48281 (_ BitVec 32) Int) ListLongMap!18749)

(assert (=> b!1259074 (= lt!569660 (getCurrentListMapNoExtraKeys!5767 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259074 (= lt!569661 (getCurrentListMapNoExtraKeys!5767 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259075 () Bool)

(assert (=> b!1259075 (= e!716199 (= lt!569659 (+!4196 lt!569660 lt!569663)))))

(declare-fun mapIsEmpty!50077 () Bool)

(assert (=> mapIsEmpty!50077 mapRes!50077))

(declare-fun b!1259076 () Bool)

(assert (=> b!1259076 (= e!716197 tp_is_empty!32187)))

(assert (= (and start!105700 res!839135) b!1259070))

(assert (= (and b!1259070 res!839136) b!1259073))

(assert (= (and b!1259073 res!839134) b!1259068))

(assert (= (and b!1259068 res!839139) b!1259074))

(assert (= (and b!1259074 (not res!839138)) b!1259071))

(assert (= (and b!1259071 res!839137) b!1259075))

(assert (= (and b!1259069 condMapEmpty!50077) mapIsEmpty!50077))

(assert (= (and b!1259069 (not condMapEmpty!50077)) mapNonEmpty!50077))

(get-info :version)

(assert (= (and mapNonEmpty!50077 ((_ is ValueCellFull!15330) mapValue!50077)) b!1259072))

(assert (= (and b!1259069 ((_ is ValueCellFull!15330) mapDefault!50077)) b!1259076))

(assert (= start!105700 b!1259069))

(declare-fun m!1159447 () Bool)

(assert (=> b!1259074 m!1159447))

(declare-fun m!1159449 () Bool)

(assert (=> b!1259074 m!1159449))

(declare-fun m!1159451 () Bool)

(assert (=> b!1259074 m!1159451))

(declare-fun m!1159453 () Bool)

(assert (=> start!105700 m!1159453))

(declare-fun m!1159455 () Bool)

(assert (=> start!105700 m!1159455))

(declare-fun m!1159457 () Bool)

(assert (=> start!105700 m!1159457))

(declare-fun m!1159459 () Bool)

(assert (=> mapNonEmpty!50077 m!1159459))

(declare-fun m!1159461 () Bool)

(assert (=> b!1259071 m!1159461))

(declare-fun m!1159463 () Bool)

(assert (=> b!1259071 m!1159463))

(declare-fun m!1159465 () Bool)

(assert (=> b!1259071 m!1159465))

(declare-fun m!1159467 () Bool)

(assert (=> b!1259071 m!1159467))

(declare-fun m!1159469 () Bool)

(assert (=> b!1259071 m!1159469))

(declare-fun m!1159471 () Bool)

(assert (=> b!1259071 m!1159471))

(declare-fun m!1159473 () Bool)

(assert (=> b!1259071 m!1159473))

(declare-fun m!1159475 () Bool)

(assert (=> b!1259068 m!1159475))

(declare-fun m!1159477 () Bool)

(assert (=> b!1259075 m!1159477))

(declare-fun m!1159479 () Bool)

(assert (=> b!1259073 m!1159479))

(check-sat (not b!1259071) (not b_next!27285) (not b!1259075) tp_is_empty!32187 (not start!105700) (not mapNonEmpty!50077) (not b!1259068) b_and!45169 (not b!1259073) (not b!1259074))
(check-sat b_and!45169 (not b_next!27285))
