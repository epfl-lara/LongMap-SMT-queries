; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105624 () Bool)

(assert start!105624)

(declare-fun b_free!27225 () Bool)

(declare-fun b_next!27225 () Bool)

(assert (=> start!105624 (= b_free!27225 (not b_next!27225))))

(declare-fun tp!95198 () Bool)

(declare-fun b_and!45099 () Bool)

(assert (=> start!105624 (= tp!95198 b_and!45099)))

(declare-fun res!838604 () Bool)

(declare-fun e!715538 () Bool)

(assert (=> start!105624 (=> (not res!838604) (not e!715538))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105624 (= res!838604 (validMask!0 mask!1466))))

(assert (=> start!105624 e!715538))

(assert (=> start!105624 true))

(assert (=> start!105624 tp!95198))

(declare-fun tp_is_empty!32127 () Bool)

(assert (=> start!105624 tp_is_empty!32127))

(declare-datatypes ((array!81880 0))(
  ( (array!81881 (arr!39496 (Array (_ BitVec 32) (_ BitVec 64))) (size!40032 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81880)

(declare-fun array_inv!30083 (array!81880) Bool)

(assert (=> start!105624 (array_inv!30083 _keys!1118)))

(declare-datatypes ((V!48201 0))(
  ( (V!48202 (val!16126 Int)) )
))
(declare-datatypes ((ValueCell!15300 0))(
  ( (ValueCellFull!15300 (v!18828 V!48201)) (EmptyCell!15300) )
))
(declare-datatypes ((array!81882 0))(
  ( (array!81883 (arr!39497 (Array (_ BitVec 32) ValueCell!15300)) (size!40033 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81882)

(declare-fun e!715540 () Bool)

(declare-fun array_inv!30084 (array!81882) Bool)

(assert (=> start!105624 (and (array_inv!30084 _values!914) e!715540)))

(declare-fun b!1258177 () Bool)

(declare-fun res!838606 () Bool)

(assert (=> b!1258177 (=> (not res!838606) (not e!715538))))

(declare-datatypes ((List!28046 0))(
  ( (Nil!28043) (Cons!28042 (h!29251 (_ BitVec 64)) (t!41539 List!28046)) )
))
(declare-fun arrayNoDuplicates!0 (array!81880 (_ BitVec 32) List!28046) Bool)

(assert (=> b!1258177 (= res!838606 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28043))))

(declare-fun mapIsEmpty!49984 () Bool)

(declare-fun mapRes!49984 () Bool)

(assert (=> mapIsEmpty!49984 mapRes!49984))

(declare-fun b!1258178 () Bool)

(declare-fun e!715539 () Bool)

(assert (=> b!1258178 (= e!715539 tp_is_empty!32127)))

(declare-fun b!1258179 () Bool)

(declare-fun e!715536 () Bool)

(assert (=> b!1258179 (= e!715536 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20830 0))(
  ( (tuple2!20831 (_1!10426 (_ BitVec 64)) (_2!10426 V!48201)) )
))
(declare-datatypes ((List!28047 0))(
  ( (Nil!28044) (Cons!28043 (h!29252 tuple2!20830) (t!41540 List!28047)) )
))
(declare-datatypes ((ListLongMap!18703 0))(
  ( (ListLongMap!18704 (toList!9367 List!28047)) )
))
(declare-fun lt!569073 () ListLongMap!18703)

(declare-fun zeroValue!871 () V!48201)

(declare-fun minValueBefore!43 () V!48201)

(declare-fun getCurrentListMap!4572 (array!81880 array!81882 (_ BitVec 32) (_ BitVec 32) V!48201 V!48201 (_ BitVec 32) Int) ListLongMap!18703)

(assert (=> b!1258179 (= lt!569073 (getCurrentListMap!4572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258180 () Bool)

(declare-fun e!715541 () Bool)

(assert (=> b!1258180 (= e!715541 tp_is_empty!32127)))

(declare-fun b!1258181 () Bool)

(declare-fun res!838603 () Bool)

(assert (=> b!1258181 (=> (not res!838603) (not e!715538))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258181 (= res!838603 (and (= (size!40033 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40032 _keys!1118) (size!40033 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49984 () Bool)

(declare-fun tp!95197 () Bool)

(assert (=> mapNonEmpty!49984 (= mapRes!49984 (and tp!95197 e!715541))))

(declare-fun mapKey!49984 () (_ BitVec 32))

(declare-fun mapValue!49984 () ValueCell!15300)

(declare-fun mapRest!49984 () (Array (_ BitVec 32) ValueCell!15300))

(assert (=> mapNonEmpty!49984 (= (arr!39497 _values!914) (store mapRest!49984 mapKey!49984 mapValue!49984))))

(declare-fun b!1258182 () Bool)

(declare-fun res!838605 () Bool)

(assert (=> b!1258182 (=> (not res!838605) (not e!715538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81880 (_ BitVec 32)) Bool)

(assert (=> b!1258182 (= res!838605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258183 () Bool)

(assert (=> b!1258183 (= e!715538 (not e!715536))))

(declare-fun res!838607 () Bool)

(assert (=> b!1258183 (=> res!838607 e!715536)))

(assert (=> b!1258183 (= res!838607 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569071 () ListLongMap!18703)

(declare-fun lt!569074 () ListLongMap!18703)

(assert (=> b!1258183 (= lt!569071 lt!569074)))

(declare-fun minValueAfter!43 () V!48201)

(declare-datatypes ((Unit!41918 0))(
  ( (Unit!41919) )
))
(declare-fun lt!569072 () Unit!41918)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1109 (array!81880 array!81882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48201 V!48201 V!48201 V!48201 (_ BitVec 32) Int) Unit!41918)

(assert (=> b!1258183 (= lt!569072 (lemmaNoChangeToArrayThenSameMapNoExtras!1109 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5745 (array!81880 array!81882 (_ BitVec 32) (_ BitVec 32) V!48201 V!48201 (_ BitVec 32) Int) ListLongMap!18703)

(assert (=> b!1258183 (= lt!569074 (getCurrentListMapNoExtraKeys!5745 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258183 (= lt!569071 (getCurrentListMapNoExtraKeys!5745 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258184 () Bool)

(assert (=> b!1258184 (= e!715540 (and e!715539 mapRes!49984))))

(declare-fun condMapEmpty!49984 () Bool)

(declare-fun mapDefault!49984 () ValueCell!15300)

(assert (=> b!1258184 (= condMapEmpty!49984 (= (arr!39497 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15300)) mapDefault!49984)))))

(assert (= (and start!105624 res!838604) b!1258181))

(assert (= (and b!1258181 res!838603) b!1258182))

(assert (= (and b!1258182 res!838605) b!1258177))

(assert (= (and b!1258177 res!838606) b!1258183))

(assert (= (and b!1258183 (not res!838607)) b!1258179))

(assert (= (and b!1258184 condMapEmpty!49984) mapIsEmpty!49984))

(assert (= (and b!1258184 (not condMapEmpty!49984)) mapNonEmpty!49984))

(get-info :version)

(assert (= (and mapNonEmpty!49984 ((_ is ValueCellFull!15300) mapValue!49984)) b!1258180))

(assert (= (and b!1258184 ((_ is ValueCellFull!15300) mapDefault!49984)) b!1258178))

(assert (= start!105624 b!1258184))

(declare-fun m!1158649 () Bool)

(assert (=> b!1258183 m!1158649))

(declare-fun m!1158651 () Bool)

(assert (=> b!1258183 m!1158651))

(declare-fun m!1158653 () Bool)

(assert (=> b!1258183 m!1158653))

(declare-fun m!1158655 () Bool)

(assert (=> start!105624 m!1158655))

(declare-fun m!1158657 () Bool)

(assert (=> start!105624 m!1158657))

(declare-fun m!1158659 () Bool)

(assert (=> start!105624 m!1158659))

(declare-fun m!1158661 () Bool)

(assert (=> b!1258179 m!1158661))

(declare-fun m!1158663 () Bool)

(assert (=> b!1258177 m!1158663))

(declare-fun m!1158665 () Bool)

(assert (=> b!1258182 m!1158665))

(declare-fun m!1158667 () Bool)

(assert (=> mapNonEmpty!49984 m!1158667))

(check-sat (not b_next!27225) b_and!45099 tp_is_empty!32127 (not b!1258182) (not start!105624) (not b!1258179) (not b!1258177) (not b!1258183) (not mapNonEmpty!49984))
(check-sat b_and!45099 (not b_next!27225))
