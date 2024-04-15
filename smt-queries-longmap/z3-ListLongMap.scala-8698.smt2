; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105618 () Bool)

(assert start!105618)

(declare-fun b_free!27223 () Bool)

(declare-fun b_next!27223 () Bool)

(assert (=> start!105618 (= b_free!27223 (not b_next!27223))))

(declare-fun tp!95192 () Bool)

(declare-fun b_and!45079 () Bool)

(assert (=> start!105618 (= tp!95192 b_and!45079)))

(declare-fun b!1258071 () Bool)

(declare-fun res!838550 () Bool)

(declare-fun e!715476 () Bool)

(assert (=> b!1258071 (=> (not res!838550) (not e!715476))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81803 0))(
  ( (array!81804 (arr!39458 (Array (_ BitVec 32) (_ BitVec 64))) (size!39996 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81803)

(declare-datatypes ((V!48199 0))(
  ( (V!48200 (val!16125 Int)) )
))
(declare-datatypes ((ValueCell!15299 0))(
  ( (ValueCellFull!15299 (v!18826 V!48199)) (EmptyCell!15299) )
))
(declare-datatypes ((array!81805 0))(
  ( (array!81806 (arr!39459 (Array (_ BitVec 32) ValueCell!15299)) (size!39997 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81805)

(assert (=> b!1258071 (= res!838550 (and (= (size!39997 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39996 _keys!1118) (size!39997 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258072 () Bool)

(declare-fun e!715478 () Bool)

(declare-fun e!715473 () Bool)

(declare-fun mapRes!49981 () Bool)

(assert (=> b!1258072 (= e!715478 (and e!715473 mapRes!49981))))

(declare-fun condMapEmpty!49981 () Bool)

(declare-fun mapDefault!49981 () ValueCell!15299)

(assert (=> b!1258072 (= condMapEmpty!49981 (= (arr!39459 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15299)) mapDefault!49981)))))

(declare-fun b!1258073 () Bool)

(declare-fun e!715477 () Bool)

(declare-fun tp_is_empty!32125 () Bool)

(assert (=> b!1258073 (= e!715477 tp_is_empty!32125)))

(declare-fun b!1258074 () Bool)

(assert (=> b!1258074 (= e!715473 tp_is_empty!32125)))

(declare-fun b!1258075 () Bool)

(declare-fun res!838549 () Bool)

(assert (=> b!1258075 (=> (not res!838549) (not e!715476))))

(declare-datatypes ((List!28123 0))(
  ( (Nil!28120) (Cons!28119 (h!29328 (_ BitVec 64)) (t!41607 List!28123)) )
))
(declare-fun arrayNoDuplicates!0 (array!81803 (_ BitVec 32) List!28123) Bool)

(assert (=> b!1258075 (= res!838549 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28120))))

(declare-fun mapNonEmpty!49981 () Bool)

(declare-fun tp!95191 () Bool)

(assert (=> mapNonEmpty!49981 (= mapRes!49981 (and tp!95191 e!715477))))

(declare-fun mapKey!49981 () (_ BitVec 32))

(declare-fun mapValue!49981 () ValueCell!15299)

(declare-fun mapRest!49981 () (Array (_ BitVec 32) ValueCell!15299))

(assert (=> mapNonEmpty!49981 (= (arr!39459 _values!914) (store mapRest!49981 mapKey!49981 mapValue!49981))))

(declare-fun b!1258076 () Bool)

(declare-fun e!715475 () Bool)

(assert (=> b!1258076 (= e!715476 (not e!715475))))

(declare-fun res!838552 () Bool)

(assert (=> b!1258076 (=> res!838552 e!715475)))

(assert (=> b!1258076 (= res!838552 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20916 0))(
  ( (tuple2!20917 (_1!10469 (_ BitVec 64)) (_2!10469 V!48199)) )
))
(declare-datatypes ((List!28124 0))(
  ( (Nil!28121) (Cons!28120 (h!29329 tuple2!20916) (t!41608 List!28124)) )
))
(declare-datatypes ((ListLongMap!18789 0))(
  ( (ListLongMap!18790 (toList!9410 List!28124)) )
))
(declare-fun lt!568881 () ListLongMap!18789)

(declare-fun lt!568880 () ListLongMap!18789)

(assert (=> b!1258076 (= lt!568881 lt!568880)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48199)

(declare-fun zeroValue!871 () V!48199)

(declare-fun minValueBefore!43 () V!48199)

(declare-datatypes ((Unit!41777 0))(
  ( (Unit!41778) )
))
(declare-fun lt!568883 () Unit!41777)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1113 (array!81803 array!81805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48199 V!48199 V!48199 V!48199 (_ BitVec 32) Int) Unit!41777)

(assert (=> b!1258076 (= lt!568883 (lemmaNoChangeToArrayThenSameMapNoExtras!1113 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5791 (array!81803 array!81805 (_ BitVec 32) (_ BitVec 32) V!48199 V!48199 (_ BitVec 32) Int) ListLongMap!18789)

(assert (=> b!1258076 (= lt!568880 (getCurrentListMapNoExtraKeys!5791 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258076 (= lt!568881 (getCurrentListMapNoExtraKeys!5791 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258077 () Bool)

(assert (=> b!1258077 (= e!715475 true)))

(declare-fun lt!568882 () ListLongMap!18789)

(declare-fun getCurrentListMap!4501 (array!81803 array!81805 (_ BitVec 32) (_ BitVec 32) V!48199 V!48199 (_ BitVec 32) Int) ListLongMap!18789)

(assert (=> b!1258077 (= lt!568882 (getCurrentListMap!4501 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258078 () Bool)

(declare-fun res!838551 () Bool)

(assert (=> b!1258078 (=> (not res!838551) (not e!715476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81803 (_ BitVec 32)) Bool)

(assert (=> b!1258078 (= res!838551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!838548 () Bool)

(assert (=> start!105618 (=> (not res!838548) (not e!715476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105618 (= res!838548 (validMask!0 mask!1466))))

(assert (=> start!105618 e!715476))

(assert (=> start!105618 true))

(assert (=> start!105618 tp!95192))

(assert (=> start!105618 tp_is_empty!32125))

(declare-fun array_inv!30187 (array!81803) Bool)

(assert (=> start!105618 (array_inv!30187 _keys!1118)))

(declare-fun array_inv!30188 (array!81805) Bool)

(assert (=> start!105618 (and (array_inv!30188 _values!914) e!715478)))

(declare-fun mapIsEmpty!49981 () Bool)

(assert (=> mapIsEmpty!49981 mapRes!49981))

(assert (= (and start!105618 res!838548) b!1258071))

(assert (= (and b!1258071 res!838550) b!1258078))

(assert (= (and b!1258078 res!838551) b!1258075))

(assert (= (and b!1258075 res!838549) b!1258076))

(assert (= (and b!1258076 (not res!838552)) b!1258077))

(assert (= (and b!1258072 condMapEmpty!49981) mapIsEmpty!49981))

(assert (= (and b!1258072 (not condMapEmpty!49981)) mapNonEmpty!49981))

(get-info :version)

(assert (= (and mapNonEmpty!49981 ((_ is ValueCellFull!15299) mapValue!49981)) b!1258073))

(assert (= (and b!1258072 ((_ is ValueCellFull!15299) mapDefault!49981)) b!1258074))

(assert (= start!105618 b!1258072))

(declare-fun m!1158109 () Bool)

(assert (=> b!1258078 m!1158109))

(declare-fun m!1158111 () Bool)

(assert (=> b!1258076 m!1158111))

(declare-fun m!1158113 () Bool)

(assert (=> b!1258076 m!1158113))

(declare-fun m!1158115 () Bool)

(assert (=> b!1258076 m!1158115))

(declare-fun m!1158117 () Bool)

(assert (=> b!1258075 m!1158117))

(declare-fun m!1158119 () Bool)

(assert (=> b!1258077 m!1158119))

(declare-fun m!1158121 () Bool)

(assert (=> mapNonEmpty!49981 m!1158121))

(declare-fun m!1158123 () Bool)

(assert (=> start!105618 m!1158123))

(declare-fun m!1158125 () Bool)

(assert (=> start!105618 m!1158125))

(declare-fun m!1158127 () Bool)

(assert (=> start!105618 m!1158127))

(check-sat (not start!105618) b_and!45079 (not b!1258077) (not b!1258075) (not b!1258076) (not b!1258078) (not b_next!27223) tp_is_empty!32125 (not mapNonEmpty!49981))
(check-sat b_and!45079 (not b_next!27223))
