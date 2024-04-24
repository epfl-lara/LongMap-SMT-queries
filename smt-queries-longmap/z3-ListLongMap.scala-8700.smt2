; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105858 () Bool)

(assert start!105858)

(declare-fun b_free!27235 () Bool)

(declare-fun b_next!27235 () Bool)

(assert (=> start!105858 (= b_free!27235 (not b_next!27235))))

(declare-fun tp!95228 () Bool)

(declare-fun b_and!45111 () Bool)

(assert (=> start!105858 (= tp!95228 b_and!45111)))

(declare-fun b!1259602 () Bool)

(declare-fun e!716474 () Bool)

(assert (=> b!1259602 (= e!716474 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48215 0))(
  ( (V!48216 (val!16131 Int)) )
))
(declare-datatypes ((tuple2!20858 0))(
  ( (tuple2!20859 (_1!10440 (_ BitVec 64)) (_2!10440 V!48215)) )
))
(declare-datatypes ((List!28089 0))(
  ( (Nil!28086) (Cons!28085 (h!29303 tuple2!20858) (t!41574 List!28089)) )
))
(declare-datatypes ((ListLongMap!18739 0))(
  ( (ListLongMap!18740 (toList!9385 List!28089)) )
))
(declare-fun lt!569617 () ListLongMap!18739)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48215)

(declare-datatypes ((array!81949 0))(
  ( (array!81950 (arr!39526 (Array (_ BitVec 32) (_ BitVec 64))) (size!40063 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81949)

(declare-datatypes ((ValueCell!15305 0))(
  ( (ValueCellFull!15305 (v!18829 V!48215)) (EmptyCell!15305) )
))
(declare-datatypes ((array!81951 0))(
  ( (array!81952 (arr!39527 (Array (_ BitVec 32) ValueCell!15305)) (size!40064 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81951)

(declare-fun minValueBefore!43 () V!48215)

(declare-fun getCurrentListMap!4573 (array!81949 array!81951 (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 (_ BitVec 32) Int) ListLongMap!18739)

(assert (=> b!1259602 (= lt!569617 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49999 () Bool)

(declare-fun mapRes!49999 () Bool)

(declare-fun tp!95227 () Bool)

(declare-fun e!716476 () Bool)

(assert (=> mapNonEmpty!49999 (= mapRes!49999 (and tp!95227 e!716476))))

(declare-fun mapValue!49999 () ValueCell!15305)

(declare-fun mapRest!49999 () (Array (_ BitVec 32) ValueCell!15305))

(declare-fun mapKey!49999 () (_ BitVec 32))

(assert (=> mapNonEmpty!49999 (= (arr!39527 _values!914) (store mapRest!49999 mapKey!49999 mapValue!49999))))

(declare-fun b!1259603 () Bool)

(declare-fun res!839198 () Bool)

(declare-fun e!716473 () Bool)

(assert (=> b!1259603 (=> (not res!839198) (not e!716473))))

(declare-datatypes ((List!28090 0))(
  ( (Nil!28087) (Cons!28086 (h!29304 (_ BitVec 64)) (t!41575 List!28090)) )
))
(declare-fun arrayNoDuplicates!0 (array!81949 (_ BitVec 32) List!28090) Bool)

(assert (=> b!1259603 (= res!839198 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28087))))

(declare-fun b!1259604 () Bool)

(declare-fun e!716477 () Bool)

(declare-fun e!716478 () Bool)

(assert (=> b!1259604 (= e!716477 (and e!716478 mapRes!49999))))

(declare-fun condMapEmpty!49999 () Bool)

(declare-fun mapDefault!49999 () ValueCell!15305)

(assert (=> b!1259604 (= condMapEmpty!49999 (= (arr!39527 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15305)) mapDefault!49999)))))

(declare-fun res!839200 () Bool)

(assert (=> start!105858 (=> (not res!839200) (not e!716473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105858 (= res!839200 (validMask!0 mask!1466))))

(assert (=> start!105858 e!716473))

(assert (=> start!105858 true))

(assert (=> start!105858 tp!95228))

(declare-fun tp_is_empty!32137 () Bool)

(assert (=> start!105858 tp_is_empty!32137))

(declare-fun array_inv!30243 (array!81949) Bool)

(assert (=> start!105858 (array_inv!30243 _keys!1118)))

(declare-fun array_inv!30244 (array!81951) Bool)

(assert (=> start!105858 (and (array_inv!30244 _values!914) e!716477)))

(declare-fun mapIsEmpty!49999 () Bool)

(assert (=> mapIsEmpty!49999 mapRes!49999))

(declare-fun b!1259605 () Bool)

(declare-fun res!839199 () Bool)

(assert (=> b!1259605 (=> (not res!839199) (not e!716473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81949 (_ BitVec 32)) Bool)

(assert (=> b!1259605 (= res!839199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259606 () Bool)

(assert (=> b!1259606 (= e!716473 (not e!716474))))

(declare-fun res!839202 () Bool)

(assert (=> b!1259606 (=> res!839202 e!716474)))

(assert (=> b!1259606 (= res!839202 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569615 () ListLongMap!18739)

(declare-fun lt!569618 () ListLongMap!18739)

(assert (=> b!1259606 (= lt!569615 lt!569618)))

(declare-fun minValueAfter!43 () V!48215)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41913 0))(
  ( (Unit!41914) )
))
(declare-fun lt!569616 () Unit!41913)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1115 (array!81949 array!81951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 V!48215 V!48215 (_ BitVec 32) Int) Unit!41913)

(assert (=> b!1259606 (= lt!569616 (lemmaNoChangeToArrayThenSameMapNoExtras!1115 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5801 (array!81949 array!81951 (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 (_ BitVec 32) Int) ListLongMap!18739)

(assert (=> b!1259606 (= lt!569618 (getCurrentListMapNoExtraKeys!5801 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259606 (= lt!569615 (getCurrentListMapNoExtraKeys!5801 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259607 () Bool)

(declare-fun res!839201 () Bool)

(assert (=> b!1259607 (=> (not res!839201) (not e!716473))))

(assert (=> b!1259607 (= res!839201 (and (= (size!40064 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40063 _keys!1118) (size!40064 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259608 () Bool)

(assert (=> b!1259608 (= e!716476 tp_is_empty!32137)))

(declare-fun b!1259609 () Bool)

(assert (=> b!1259609 (= e!716478 tp_is_empty!32137)))

(assert (= (and start!105858 res!839200) b!1259607))

(assert (= (and b!1259607 res!839201) b!1259605))

(assert (= (and b!1259605 res!839199) b!1259603))

(assert (= (and b!1259603 res!839198) b!1259606))

(assert (= (and b!1259606 (not res!839202)) b!1259602))

(assert (= (and b!1259604 condMapEmpty!49999) mapIsEmpty!49999))

(assert (= (and b!1259604 (not condMapEmpty!49999)) mapNonEmpty!49999))

(get-info :version)

(assert (= (and mapNonEmpty!49999 ((_ is ValueCellFull!15305) mapValue!49999)) b!1259608))

(assert (= (and b!1259604 ((_ is ValueCellFull!15305) mapDefault!49999)) b!1259609))

(assert (= start!105858 b!1259604))

(declare-fun m!1160361 () Bool)

(assert (=> b!1259602 m!1160361))

(declare-fun m!1160363 () Bool)

(assert (=> b!1259605 m!1160363))

(declare-fun m!1160365 () Bool)

(assert (=> start!105858 m!1160365))

(declare-fun m!1160367 () Bool)

(assert (=> start!105858 m!1160367))

(declare-fun m!1160369 () Bool)

(assert (=> start!105858 m!1160369))

(declare-fun m!1160371 () Bool)

(assert (=> mapNonEmpty!49999 m!1160371))

(declare-fun m!1160373 () Bool)

(assert (=> b!1259606 m!1160373))

(declare-fun m!1160375 () Bool)

(assert (=> b!1259606 m!1160375))

(declare-fun m!1160377 () Bool)

(assert (=> b!1259606 m!1160377))

(declare-fun m!1160379 () Bool)

(assert (=> b!1259603 m!1160379))

(check-sat tp_is_empty!32137 (not b_next!27235) (not b!1259606) (not b!1259603) b_and!45111 (not mapNonEmpty!49999) (not start!105858) (not b!1259602) (not b!1259605))
(check-sat b_and!45111 (not b_next!27235))
