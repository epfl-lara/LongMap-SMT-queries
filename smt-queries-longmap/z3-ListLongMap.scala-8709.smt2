; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105706 () Bool)

(assert start!105706)

(declare-fun b_free!27291 () Bool)

(declare-fun b_next!27291 () Bool)

(assert (=> start!105706 (= b_free!27291 (not b_next!27291))))

(declare-fun tp!95398 () Bool)

(declare-fun b_and!45175 () Bool)

(assert (=> start!105706 (= tp!95398 b_and!45175)))

(declare-fun b!1259149 () Bool)

(declare-fun e!716259 () Bool)

(declare-fun tp_is_empty!32193 () Bool)

(assert (=> b!1259149 (= e!716259 tp_is_empty!32193)))

(declare-fun b!1259151 () Bool)

(declare-fun e!716258 () Bool)

(assert (=> b!1259151 (= e!716258 tp_is_empty!32193)))

(declare-fun b!1259152 () Bool)

(declare-fun res!839193 () Bool)

(declare-fun e!716261 () Bool)

(assert (=> b!1259152 (=> (not res!839193) (not e!716261))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82004 0))(
  ( (array!82005 (arr!39557 (Array (_ BitVec 32) (_ BitVec 64))) (size!40093 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82004)

(declare-datatypes ((V!48289 0))(
  ( (V!48290 (val!16159 Int)) )
))
(declare-datatypes ((ValueCell!15333 0))(
  ( (ValueCellFull!15333 (v!18861 V!48289)) (EmptyCell!15333) )
))
(declare-datatypes ((array!82006 0))(
  ( (array!82007 (arr!39558 (Array (_ BitVec 32) ValueCell!15333)) (size!40094 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82006)

(assert (=> b!1259152 (= res!839193 (and (= (size!40094 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40093 _keys!1118) (size!40094 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259153 () Bool)

(declare-fun e!716256 () Bool)

(assert (=> b!1259153 (= e!716256 true)))

(declare-datatypes ((tuple2!20882 0))(
  ( (tuple2!20883 (_1!10452 (_ BitVec 64)) (_2!10452 V!48289)) )
))
(declare-datatypes ((List!28092 0))(
  ( (Nil!28089) (Cons!28088 (h!29297 tuple2!20882) (t!41587 List!28092)) )
))
(declare-datatypes ((ListLongMap!18755 0))(
  ( (ListLongMap!18756 (toList!9393 List!28092)) )
))
(declare-fun lt!569748 () ListLongMap!18755)

(declare-fun lt!569755 () ListLongMap!18755)

(declare-fun -!2101 (ListLongMap!18755 (_ BitVec 64)) ListLongMap!18755)

(assert (=> b!1259153 (= lt!569748 (-!2101 lt!569755 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569749 () ListLongMap!18755)

(declare-fun lt!569754 () ListLongMap!18755)

(assert (=> b!1259153 (= (-!2101 lt!569749 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569754)))

(declare-datatypes ((Unit!41969 0))(
  ( (Unit!41970) )
))
(declare-fun lt!569756 () Unit!41969)

(declare-fun minValueBefore!43 () V!48289)

(declare-fun addThenRemoveForNewKeyIsSame!338 (ListLongMap!18755 (_ BitVec 64) V!48289) Unit!41969)

(assert (=> b!1259153 (= lt!569756 (addThenRemoveForNewKeyIsSame!338 lt!569754 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716262 () Bool)

(assert (=> b!1259153 e!716262))

(declare-fun res!839188 () Bool)

(assert (=> b!1259153 (=> (not res!839188) (not e!716262))))

(assert (=> b!1259153 (= res!839188 (= lt!569755 lt!569749))))

(declare-fun +!4199 (ListLongMap!18755 tuple2!20882) ListLongMap!18755)

(assert (=> b!1259153 (= lt!569749 (+!4199 lt!569754 (tuple2!20883 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569752 () ListLongMap!18755)

(declare-fun lt!569751 () tuple2!20882)

(assert (=> b!1259153 (= lt!569754 (+!4199 lt!569752 lt!569751))))

(declare-fun zeroValue!871 () V!48289)

(assert (=> b!1259153 (= lt!569751 (tuple2!20883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48289)

(declare-fun lt!569750 () ListLongMap!18755)

(declare-fun getCurrentListMap!4592 (array!82004 array!82006 (_ BitVec 32) (_ BitVec 32) V!48289 V!48289 (_ BitVec 32) Int) ListLongMap!18755)

(assert (=> b!1259153 (= lt!569750 (getCurrentListMap!4592 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259153 (= lt!569755 (getCurrentListMap!4592 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259154 () Bool)

(declare-fun lt!569753 () ListLongMap!18755)

(assert (=> b!1259154 (= e!716262 (= lt!569750 (+!4199 lt!569753 lt!569751)))))

(declare-fun mapIsEmpty!50086 () Bool)

(declare-fun mapRes!50086 () Bool)

(assert (=> mapIsEmpty!50086 mapRes!50086))

(declare-fun res!839189 () Bool)

(assert (=> start!105706 (=> (not res!839189) (not e!716261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105706 (= res!839189 (validMask!0 mask!1466))))

(assert (=> start!105706 e!716261))

(assert (=> start!105706 true))

(assert (=> start!105706 tp!95398))

(assert (=> start!105706 tp_is_empty!32193))

(declare-fun array_inv!30121 (array!82004) Bool)

(assert (=> start!105706 (array_inv!30121 _keys!1118)))

(declare-fun e!716257 () Bool)

(declare-fun array_inv!30122 (array!82006) Bool)

(assert (=> start!105706 (and (array_inv!30122 _values!914) e!716257)))

(declare-fun b!1259150 () Bool)

(assert (=> b!1259150 (= e!716261 (not e!716256))))

(declare-fun res!839190 () Bool)

(assert (=> b!1259150 (=> res!839190 e!716256)))

(assert (=> b!1259150 (= res!839190 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259150 (= lt!569752 lt!569753)))

(declare-fun lt!569747 () Unit!41969)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1134 (array!82004 array!82006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48289 V!48289 V!48289 V!48289 (_ BitVec 32) Int) Unit!41969)

(assert (=> b!1259150 (= lt!569747 (lemmaNoChangeToArrayThenSameMapNoExtras!1134 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5770 (array!82004 array!82006 (_ BitVec 32) (_ BitVec 32) V!48289 V!48289 (_ BitVec 32) Int) ListLongMap!18755)

(assert (=> b!1259150 (= lt!569753 (getCurrentListMapNoExtraKeys!5770 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259150 (= lt!569752 (getCurrentListMapNoExtraKeys!5770 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50086 () Bool)

(declare-fun tp!95399 () Bool)

(assert (=> mapNonEmpty!50086 (= mapRes!50086 (and tp!95399 e!716259))))

(declare-fun mapRest!50086 () (Array (_ BitVec 32) ValueCell!15333))

(declare-fun mapValue!50086 () ValueCell!15333)

(declare-fun mapKey!50086 () (_ BitVec 32))

(assert (=> mapNonEmpty!50086 (= (arr!39558 _values!914) (store mapRest!50086 mapKey!50086 mapValue!50086))))

(declare-fun b!1259155 () Bool)

(assert (=> b!1259155 (= e!716257 (and e!716258 mapRes!50086))))

(declare-fun condMapEmpty!50086 () Bool)

(declare-fun mapDefault!50086 () ValueCell!15333)

(assert (=> b!1259155 (= condMapEmpty!50086 (= (arr!39558 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15333)) mapDefault!50086)))))

(declare-fun b!1259156 () Bool)

(declare-fun res!839191 () Bool)

(assert (=> b!1259156 (=> (not res!839191) (not e!716261))))

(declare-datatypes ((List!28093 0))(
  ( (Nil!28090) (Cons!28089 (h!29298 (_ BitVec 64)) (t!41588 List!28093)) )
))
(declare-fun arrayNoDuplicates!0 (array!82004 (_ BitVec 32) List!28093) Bool)

(assert (=> b!1259156 (= res!839191 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28090))))

(declare-fun b!1259157 () Bool)

(declare-fun res!839192 () Bool)

(assert (=> b!1259157 (=> (not res!839192) (not e!716261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82004 (_ BitVec 32)) Bool)

(assert (=> b!1259157 (= res!839192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105706 res!839189) b!1259152))

(assert (= (and b!1259152 res!839193) b!1259157))

(assert (= (and b!1259157 res!839192) b!1259156))

(assert (= (and b!1259156 res!839191) b!1259150))

(assert (= (and b!1259150 (not res!839190)) b!1259153))

(assert (= (and b!1259153 res!839188) b!1259154))

(assert (= (and b!1259155 condMapEmpty!50086) mapIsEmpty!50086))

(assert (= (and b!1259155 (not condMapEmpty!50086)) mapNonEmpty!50086))

(get-info :version)

(assert (= (and mapNonEmpty!50086 ((_ is ValueCellFull!15333) mapValue!50086)) b!1259149))

(assert (= (and b!1259155 ((_ is ValueCellFull!15333) mapDefault!50086)) b!1259151))

(assert (= start!105706 b!1259155))

(declare-fun m!1159549 () Bool)

(assert (=> b!1259154 m!1159549))

(declare-fun m!1159551 () Bool)

(assert (=> start!105706 m!1159551))

(declare-fun m!1159553 () Bool)

(assert (=> start!105706 m!1159553))

(declare-fun m!1159555 () Bool)

(assert (=> start!105706 m!1159555))

(declare-fun m!1159557 () Bool)

(assert (=> mapNonEmpty!50086 m!1159557))

(declare-fun m!1159559 () Bool)

(assert (=> b!1259156 m!1159559))

(declare-fun m!1159561 () Bool)

(assert (=> b!1259157 m!1159561))

(declare-fun m!1159563 () Bool)

(assert (=> b!1259150 m!1159563))

(declare-fun m!1159565 () Bool)

(assert (=> b!1259150 m!1159565))

(declare-fun m!1159567 () Bool)

(assert (=> b!1259150 m!1159567))

(declare-fun m!1159569 () Bool)

(assert (=> b!1259153 m!1159569))

(declare-fun m!1159571 () Bool)

(assert (=> b!1259153 m!1159571))

(declare-fun m!1159573 () Bool)

(assert (=> b!1259153 m!1159573))

(declare-fun m!1159575 () Bool)

(assert (=> b!1259153 m!1159575))

(declare-fun m!1159577 () Bool)

(assert (=> b!1259153 m!1159577))

(declare-fun m!1159579 () Bool)

(assert (=> b!1259153 m!1159579))

(declare-fun m!1159581 () Bool)

(assert (=> b!1259153 m!1159581))

(check-sat (not b!1259153) (not b!1259157) (not b_next!27291) (not b!1259150) (not start!105706) b_and!45175 (not b!1259156) tp_is_empty!32193 (not mapNonEmpty!50086) (not b!1259154))
(check-sat b_and!45175 (not b_next!27291))
