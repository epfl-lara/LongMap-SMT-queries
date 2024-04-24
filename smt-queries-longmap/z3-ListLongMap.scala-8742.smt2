; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106278 () Bool)

(assert start!106278)

(declare-fun b_free!27487 () Bool)

(declare-fun b_next!27487 () Bool)

(assert (=> start!106278 (= b_free!27487 (not b_next!27487))))

(declare-fun tp!96011 () Bool)

(declare-fun b_and!45463 () Bool)

(assert (=> start!106278 (= tp!96011 b_and!45463)))

(declare-fun b!1264203 () Bool)

(declare-fun e!719781 () Bool)

(declare-fun e!719783 () Bool)

(declare-fun mapRes!50404 () Bool)

(assert (=> b!1264203 (= e!719781 (and e!719783 mapRes!50404))))

(declare-fun condMapEmpty!50404 () Bool)

(declare-datatypes ((V!48551 0))(
  ( (V!48552 (val!16257 Int)) )
))
(declare-datatypes ((ValueCell!15431 0))(
  ( (ValueCellFull!15431 (v!18962 V!48551)) (EmptyCell!15431) )
))
(declare-datatypes ((array!82445 0))(
  ( (array!82446 (arr!39765 (Array (_ BitVec 32) ValueCell!15431)) (size!40302 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82445)

(declare-fun mapDefault!50404 () ValueCell!15431)

(assert (=> b!1264203 (= condMapEmpty!50404 (= (arr!39765 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15431)) mapDefault!50404)))))

(declare-fun b!1264204 () Bool)

(declare-fun res!841804 () Bool)

(declare-fun e!719780 () Bool)

(assert (=> b!1264204 (=> (not res!841804) (not e!719780))))

(declare-datatypes ((array!82447 0))(
  ( (array!82448 (arr!39766 (Array (_ BitVec 32) (_ BitVec 64))) (size!40303 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82447)

(declare-datatypes ((List!28278 0))(
  ( (Nil!28275) (Cons!28274 (h!29492 (_ BitVec 64)) (t!41781 List!28278)) )
))
(declare-fun arrayNoDuplicates!0 (array!82447 (_ BitVec 32) List!28278) Bool)

(assert (=> b!1264204 (= res!841804 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28275))))

(declare-fun b!1264205 () Bool)

(declare-fun res!841805 () Bool)

(assert (=> b!1264205 (=> (not res!841805) (not e!719780))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1264205 (= res!841805 (and (= (size!40302 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40303 _keys!1118) (size!40302 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264206 () Bool)

(declare-fun e!719785 () Bool)

(assert (=> b!1264206 (= e!719780 (not e!719785))))

(declare-fun res!841801 () Bool)

(assert (=> b!1264206 (=> res!841801 e!719785)))

(assert (=> b!1264206 (= res!841801 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21054 0))(
  ( (tuple2!21055 (_1!10538 (_ BitVec 64)) (_2!10538 V!48551)) )
))
(declare-datatypes ((List!28279 0))(
  ( (Nil!28276) (Cons!28275 (h!29493 tuple2!21054) (t!41782 List!28279)) )
))
(declare-datatypes ((ListLongMap!18935 0))(
  ( (ListLongMap!18936 (toList!9483 List!28279)) )
))
(declare-fun lt!573076 () ListLongMap!18935)

(declare-fun lt!573079 () ListLongMap!18935)

(assert (=> b!1264206 (= lt!573076 lt!573079)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48551)

(declare-fun zeroValue!871 () V!48551)

(declare-fun minValueBefore!43 () V!48551)

(declare-datatypes ((Unit!42068 0))(
  ( (Unit!42069) )
))
(declare-fun lt!573080 () Unit!42068)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1177 (array!82447 array!82445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 V!48551 V!48551 (_ BitVec 32) Int) Unit!42068)

(assert (=> b!1264206 (= lt!573080 (lemmaNoChangeToArrayThenSameMapNoExtras!1177 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5887 (array!82447 array!82445 (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 (_ BitVec 32) Int) ListLongMap!18935)

(assert (=> b!1264206 (= lt!573079 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264206 (= lt!573076 (getCurrentListMapNoExtraKeys!5887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50404 () Bool)

(declare-fun tp!96010 () Bool)

(declare-fun e!719782 () Bool)

(assert (=> mapNonEmpty!50404 (= mapRes!50404 (and tp!96010 e!719782))))

(declare-fun mapValue!50404 () ValueCell!15431)

(declare-fun mapRest!50404 () (Array (_ BitVec 32) ValueCell!15431))

(declare-fun mapKey!50404 () (_ BitVec 32))

(assert (=> mapNonEmpty!50404 (= (arr!39765 _values!914) (store mapRest!50404 mapKey!50404 mapValue!50404))))

(declare-fun b!1264207 () Bool)

(declare-fun lt!573077 () ListLongMap!18935)

(declare-fun lt!573075 () ListLongMap!18935)

(declare-fun -!2117 (ListLongMap!18935 (_ BitVec 64)) ListLongMap!18935)

(assert (=> b!1264207 (= e!719785 (= (-!2117 lt!573077 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573075))))

(declare-fun lt!573074 () ListLongMap!18935)

(assert (=> b!1264207 (= (-!2117 lt!573074 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573076)))

(declare-fun lt!573078 () Unit!42068)

(declare-fun addThenRemoveForNewKeyIsSame!368 (ListLongMap!18935 (_ BitVec 64) V!48551) Unit!42068)

(assert (=> b!1264207 (= lt!573078 (addThenRemoveForNewKeyIsSame!368 lt!573076 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1264207 (and (= lt!573077 lt!573074) (= lt!573075 lt!573079))))

(declare-fun +!4295 (ListLongMap!18935 tuple2!21054) ListLongMap!18935)

(assert (=> b!1264207 (= lt!573074 (+!4295 lt!573076 (tuple2!21055 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4636 (array!82447 array!82445 (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 (_ BitVec 32) Int) ListLongMap!18935)

(assert (=> b!1264207 (= lt!573075 (getCurrentListMap!4636 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264207 (= lt!573077 (getCurrentListMap!4636 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264208 () Bool)

(declare-fun tp_is_empty!32389 () Bool)

(assert (=> b!1264208 (= e!719782 tp_is_empty!32389)))

(declare-fun b!1264209 () Bool)

(assert (=> b!1264209 (= e!719783 tp_is_empty!32389)))

(declare-fun mapIsEmpty!50404 () Bool)

(assert (=> mapIsEmpty!50404 mapRes!50404))

(declare-fun b!1264210 () Bool)

(declare-fun res!841802 () Bool)

(assert (=> b!1264210 (=> (not res!841802) (not e!719780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82447 (_ BitVec 32)) Bool)

(assert (=> b!1264210 (= res!841802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!841803 () Bool)

(assert (=> start!106278 (=> (not res!841803) (not e!719780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106278 (= res!841803 (validMask!0 mask!1466))))

(assert (=> start!106278 e!719780))

(assert (=> start!106278 true))

(assert (=> start!106278 tp!96011))

(assert (=> start!106278 tp_is_empty!32389))

(declare-fun array_inv!30425 (array!82447) Bool)

(assert (=> start!106278 (array_inv!30425 _keys!1118)))

(declare-fun array_inv!30426 (array!82445) Bool)

(assert (=> start!106278 (and (array_inv!30426 _values!914) e!719781)))

(assert (= (and start!106278 res!841803) b!1264205))

(assert (= (and b!1264205 res!841805) b!1264210))

(assert (= (and b!1264210 res!841802) b!1264204))

(assert (= (and b!1264204 res!841804) b!1264206))

(assert (= (and b!1264206 (not res!841801)) b!1264207))

(assert (= (and b!1264203 condMapEmpty!50404) mapIsEmpty!50404))

(assert (= (and b!1264203 (not condMapEmpty!50404)) mapNonEmpty!50404))

(get-info :version)

(assert (= (and mapNonEmpty!50404 ((_ is ValueCellFull!15431) mapValue!50404)) b!1264208))

(assert (= (and b!1264203 ((_ is ValueCellFull!15431) mapDefault!50404)) b!1264209))

(assert (= start!106278 b!1264203))

(declare-fun m!1165003 () Bool)

(assert (=> start!106278 m!1165003))

(declare-fun m!1165005 () Bool)

(assert (=> start!106278 m!1165005))

(declare-fun m!1165007 () Bool)

(assert (=> start!106278 m!1165007))

(declare-fun m!1165009 () Bool)

(assert (=> mapNonEmpty!50404 m!1165009))

(declare-fun m!1165011 () Bool)

(assert (=> b!1264207 m!1165011))

(declare-fun m!1165013 () Bool)

(assert (=> b!1264207 m!1165013))

(declare-fun m!1165015 () Bool)

(assert (=> b!1264207 m!1165015))

(declare-fun m!1165017 () Bool)

(assert (=> b!1264207 m!1165017))

(declare-fun m!1165019 () Bool)

(assert (=> b!1264207 m!1165019))

(declare-fun m!1165021 () Bool)

(assert (=> b!1264207 m!1165021))

(declare-fun m!1165023 () Bool)

(assert (=> b!1264204 m!1165023))

(declare-fun m!1165025 () Bool)

(assert (=> b!1264210 m!1165025))

(declare-fun m!1165027 () Bool)

(assert (=> b!1264206 m!1165027))

(declare-fun m!1165029 () Bool)

(assert (=> b!1264206 m!1165029))

(declare-fun m!1165031 () Bool)

(assert (=> b!1264206 m!1165031))

(check-sat (not b!1264207) (not b!1264206) tp_is_empty!32389 (not start!106278) (not b_next!27487) (not mapNonEmpty!50404) b_and!45463 (not b!1264210) (not b!1264204))
(check-sat b_and!45463 (not b_next!27487))
