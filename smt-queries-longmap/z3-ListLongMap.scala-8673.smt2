; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105410 () Bool)

(assert start!105410)

(declare-fun b_free!27073 () Bool)

(declare-fun b_next!27073 () Bool)

(assert (=> start!105410 (= b_free!27073 (not b_next!27073))))

(declare-fun tp!94733 () Bool)

(declare-fun b_and!44901 () Bool)

(assert (=> start!105410 (= tp!94733 b_and!44901)))

(declare-fun b!1255820 () Bool)

(declare-fun e!713819 () Bool)

(assert (=> b!1255820 (= e!713819 true)))

(declare-datatypes ((V!47999 0))(
  ( (V!48000 (val!16050 Int)) )
))
(declare-datatypes ((tuple2!20810 0))(
  ( (tuple2!20811 (_1!10416 (_ BitVec 64)) (_2!10416 V!47999)) )
))
(declare-datatypes ((List!28021 0))(
  ( (Nil!28018) (Cons!28017 (h!29226 tuple2!20810) (t!41499 List!28021)) )
))
(declare-datatypes ((ListLongMap!18683 0))(
  ( (ListLongMap!18684 (toList!9357 List!28021)) )
))
(declare-fun lt!567640 () ListLongMap!18683)

(declare-fun -!2028 (ListLongMap!18683 (_ BitVec 64)) ListLongMap!18683)

(assert (=> b!1255820 (= (-!2028 lt!567640 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567640)))

(declare-datatypes ((Unit!41679 0))(
  ( (Unit!41680) )
))
(declare-fun lt!567642 () Unit!41679)

(declare-fun removeNotPresentStillSame!123 (ListLongMap!18683 (_ BitVec 64)) Unit!41679)

(assert (=> b!1255820 (= lt!567642 (removeNotPresentStillSame!123 lt!567640 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255821 () Bool)

(declare-fun e!713821 () Bool)

(declare-fun tp_is_empty!31975 () Bool)

(assert (=> b!1255821 (= e!713821 tp_is_empty!31975)))

(declare-fun b!1255823 () Bool)

(declare-fun res!837219 () Bool)

(declare-fun e!713818 () Bool)

(assert (=> b!1255823 (=> (not res!837219) (not e!713818))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81521 0))(
  ( (array!81522 (arr!39320 (Array (_ BitVec 32) (_ BitVec 64))) (size!39858 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81521)

(declare-datatypes ((ValueCell!15224 0))(
  ( (ValueCellFull!15224 (v!18749 V!47999)) (EmptyCell!15224) )
))
(declare-datatypes ((array!81523 0))(
  ( (array!81524 (arr!39321 (Array (_ BitVec 32) ValueCell!15224)) (size!39859 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81523)

(assert (=> b!1255823 (= res!837219 (and (= (size!39859 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39858 _keys!1118) (size!39859 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255824 () Bool)

(declare-fun e!713820 () Bool)

(assert (=> b!1255824 (= e!713820 e!713819)))

(declare-fun res!837222 () Bool)

(assert (=> b!1255824 (=> res!837222 e!713819)))

(declare-fun contains!7508 (ListLongMap!18683 (_ BitVec 64)) Bool)

(assert (=> b!1255824 (= res!837222 (contains!7508 lt!567640 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47999)

(declare-fun minValueBefore!43 () V!47999)

(declare-fun getCurrentListMap!4468 (array!81521 array!81523 (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 (_ BitVec 32) Int) ListLongMap!18683)

(assert (=> b!1255824 (= lt!567640 (getCurrentListMap!4468 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255825 () Bool)

(declare-fun res!837220 () Bool)

(assert (=> b!1255825 (=> (not res!837220) (not e!713818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81521 (_ BitVec 32)) Bool)

(assert (=> b!1255825 (= res!837220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255826 () Bool)

(assert (=> b!1255826 (= e!713818 (not e!713820))))

(declare-fun res!837218 () Bool)

(assert (=> b!1255826 (=> res!837218 e!713820)))

(assert (=> b!1255826 (= res!837218 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567641 () ListLongMap!18683)

(declare-fun lt!567644 () ListLongMap!18683)

(assert (=> b!1255826 (= lt!567641 lt!567644)))

(declare-fun minValueAfter!43 () V!47999)

(declare-fun lt!567643 () Unit!41679)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1071 (array!81521 array!81523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 V!47999 V!47999 (_ BitVec 32) Int) Unit!41679)

(assert (=> b!1255826 (= lt!567643 (lemmaNoChangeToArrayThenSameMapNoExtras!1071 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5749 (array!81521 array!81523 (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 (_ BitVec 32) Int) ListLongMap!18683)

(assert (=> b!1255826 (= lt!567644 (getCurrentListMapNoExtraKeys!5749 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255826 (= lt!567641 (getCurrentListMapNoExtraKeys!5749 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49747 () Bool)

(declare-fun mapRes!49747 () Bool)

(declare-fun tp!94732 () Bool)

(assert (=> mapNonEmpty!49747 (= mapRes!49747 (and tp!94732 e!713821))))

(declare-fun mapValue!49747 () ValueCell!15224)

(declare-fun mapKey!49747 () (_ BitVec 32))

(declare-fun mapRest!49747 () (Array (_ BitVec 32) ValueCell!15224))

(assert (=> mapNonEmpty!49747 (= (arr!39321 _values!914) (store mapRest!49747 mapKey!49747 mapValue!49747))))

(declare-fun b!1255827 () Bool)

(declare-fun res!837221 () Bool)

(assert (=> b!1255827 (=> (not res!837221) (not e!713818))))

(declare-datatypes ((List!28022 0))(
  ( (Nil!28019) (Cons!28018 (h!29227 (_ BitVec 64)) (t!41500 List!28022)) )
))
(declare-fun arrayNoDuplicates!0 (array!81521 (_ BitVec 32) List!28022) Bool)

(assert (=> b!1255827 (= res!837221 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28019))))

(declare-fun b!1255822 () Bool)

(declare-fun e!713817 () Bool)

(assert (=> b!1255822 (= e!713817 tp_is_empty!31975)))

(declare-fun res!837223 () Bool)

(assert (=> start!105410 (=> (not res!837223) (not e!713818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105410 (= res!837223 (validMask!0 mask!1466))))

(assert (=> start!105410 e!713818))

(assert (=> start!105410 true))

(assert (=> start!105410 tp!94733))

(assert (=> start!105410 tp_is_empty!31975))

(declare-fun array_inv!30093 (array!81521) Bool)

(assert (=> start!105410 (array_inv!30093 _keys!1118)))

(declare-fun e!713816 () Bool)

(declare-fun array_inv!30094 (array!81523) Bool)

(assert (=> start!105410 (and (array_inv!30094 _values!914) e!713816)))

(declare-fun b!1255828 () Bool)

(assert (=> b!1255828 (= e!713816 (and e!713817 mapRes!49747))))

(declare-fun condMapEmpty!49747 () Bool)

(declare-fun mapDefault!49747 () ValueCell!15224)

(assert (=> b!1255828 (= condMapEmpty!49747 (= (arr!39321 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15224)) mapDefault!49747)))))

(declare-fun mapIsEmpty!49747 () Bool)

(assert (=> mapIsEmpty!49747 mapRes!49747))

(assert (= (and start!105410 res!837223) b!1255823))

(assert (= (and b!1255823 res!837219) b!1255825))

(assert (= (and b!1255825 res!837220) b!1255827))

(assert (= (and b!1255827 res!837221) b!1255826))

(assert (= (and b!1255826 (not res!837218)) b!1255824))

(assert (= (and b!1255824 (not res!837222)) b!1255820))

(assert (= (and b!1255828 condMapEmpty!49747) mapIsEmpty!49747))

(assert (= (and b!1255828 (not condMapEmpty!49747)) mapNonEmpty!49747))

(get-info :version)

(assert (= (and mapNonEmpty!49747 ((_ is ValueCellFull!15224) mapValue!49747)) b!1255821))

(assert (= (and b!1255828 ((_ is ValueCellFull!15224) mapDefault!49747)) b!1255822))

(assert (= start!105410 b!1255828))

(declare-fun m!1156075 () Bool)

(assert (=> mapNonEmpty!49747 m!1156075))

(declare-fun m!1156077 () Bool)

(assert (=> b!1255820 m!1156077))

(declare-fun m!1156079 () Bool)

(assert (=> b!1255820 m!1156079))

(declare-fun m!1156081 () Bool)

(assert (=> b!1255826 m!1156081))

(declare-fun m!1156083 () Bool)

(assert (=> b!1255826 m!1156083))

(declare-fun m!1156085 () Bool)

(assert (=> b!1255826 m!1156085))

(declare-fun m!1156087 () Bool)

(assert (=> start!105410 m!1156087))

(declare-fun m!1156089 () Bool)

(assert (=> start!105410 m!1156089))

(declare-fun m!1156091 () Bool)

(assert (=> start!105410 m!1156091))

(declare-fun m!1156093 () Bool)

(assert (=> b!1255824 m!1156093))

(declare-fun m!1156095 () Bool)

(assert (=> b!1255824 m!1156095))

(declare-fun m!1156097 () Bool)

(assert (=> b!1255827 m!1156097))

(declare-fun m!1156099 () Bool)

(assert (=> b!1255825 m!1156099))

(check-sat (not b!1255820) b_and!44901 tp_is_empty!31975 (not b_next!27073) (not b!1255826) (not start!105410) (not b!1255825) (not b!1255824) (not mapNonEmpty!49747) (not b!1255827))
(check-sat b_and!44901 (not b_next!27073))
