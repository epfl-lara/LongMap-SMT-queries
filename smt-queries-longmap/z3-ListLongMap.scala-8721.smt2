; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105794 () Bool)

(assert start!105794)

(declare-fun b_free!27361 () Bool)

(declare-fun b_next!27361 () Bool)

(assert (=> start!105794 (= b_free!27361 (not b_next!27361))))

(declare-fun tp!95612 () Bool)

(declare-fun b_and!45239 () Bool)

(assert (=> start!105794 (= tp!95612 b_and!45239)))

(declare-fun b!1260200 () Bool)

(declare-fun res!839866 () Bool)

(declare-fun e!717067 () Bool)

(assert (=> b!1260200 (=> (not res!839866) (not e!717067))))

(declare-datatypes ((array!82067 0))(
  ( (array!82068 (arr!39588 (Array (_ BitVec 32) (_ BitVec 64))) (size!40126 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82067)

(declare-datatypes ((List!28223 0))(
  ( (Nil!28220) (Cons!28219 (h!29428 (_ BitVec 64)) (t!41711 List!28223)) )
))
(declare-fun arrayNoDuplicates!0 (array!82067 (_ BitVec 32) List!28223) Bool)

(assert (=> b!1260200 (= res!839866 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28220))))

(declare-fun b!1260201 () Bool)

(declare-fun e!717068 () Bool)

(declare-fun e!717072 () Bool)

(declare-fun mapRes!50194 () Bool)

(assert (=> b!1260201 (= e!717068 (and e!717072 mapRes!50194))))

(declare-fun condMapEmpty!50194 () Bool)

(declare-datatypes ((V!48383 0))(
  ( (V!48384 (val!16194 Int)) )
))
(declare-datatypes ((ValueCell!15368 0))(
  ( (ValueCellFull!15368 (v!18896 V!48383)) (EmptyCell!15368) )
))
(declare-datatypes ((array!82069 0))(
  ( (array!82070 (arr!39589 (Array (_ BitVec 32) ValueCell!15368)) (size!40127 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82069)

(declare-fun mapDefault!50194 () ValueCell!15368)

(assert (=> b!1260201 (= condMapEmpty!50194 (= (arr!39589 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15368)) mapDefault!50194)))))

(declare-fun mapIsEmpty!50194 () Bool)

(assert (=> mapIsEmpty!50194 mapRes!50194))

(declare-fun b!1260202 () Bool)

(declare-fun e!717073 () Bool)

(assert (=> b!1260202 (= e!717073 true)))

(declare-datatypes ((tuple2!21022 0))(
  ( (tuple2!21023 (_1!10522 (_ BitVec 64)) (_2!10522 V!48383)) )
))
(declare-datatypes ((List!28224 0))(
  ( (Nil!28221) (Cons!28220 (h!29429 tuple2!21022) (t!41712 List!28224)) )
))
(declare-datatypes ((ListLongMap!18895 0))(
  ( (ListLongMap!18896 (toList!9463 List!28224)) )
))
(declare-fun lt!570766 () ListLongMap!18895)

(declare-fun lt!570767 () ListLongMap!18895)

(declare-fun -!2081 (ListLongMap!18895 (_ BitVec 64)) ListLongMap!18895)

(assert (=> b!1260202 (= lt!570766 (-!2081 lt!570767 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570771 () ListLongMap!18895)

(declare-fun lt!570770 () ListLongMap!18895)

(assert (=> b!1260202 (= (-!2081 lt!570771 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570770)))

(declare-datatypes ((Unit!41870 0))(
  ( (Unit!41871) )
))
(declare-fun lt!570764 () Unit!41870)

(declare-fun minValueBefore!43 () V!48383)

(declare-fun addThenRemoveForNewKeyIsSame!338 (ListLongMap!18895 (_ BitVec 64) V!48383) Unit!41870)

(assert (=> b!1260202 (= lt!570764 (addThenRemoveForNewKeyIsSame!338 lt!570770 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717070 () Bool)

(assert (=> b!1260202 e!717070))

(declare-fun res!839868 () Bool)

(assert (=> b!1260202 (=> (not res!839868) (not e!717070))))

(assert (=> b!1260202 (= res!839868 (= lt!570767 lt!570771))))

(declare-fun +!4264 (ListLongMap!18895 tuple2!21022) ListLongMap!18895)

(assert (=> b!1260202 (= lt!570771 (+!4264 lt!570770 (tuple2!21023 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570773 () ListLongMap!18895)

(declare-fun lt!570769 () tuple2!21022)

(assert (=> b!1260202 (= lt!570770 (+!4264 lt!570773 lt!570769))))

(declare-fun zeroValue!871 () V!48383)

(assert (=> b!1260202 (= lt!570769 (tuple2!21023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48383)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!570765 () ListLongMap!18895)

(declare-fun getCurrentListMap!4547 (array!82067 array!82069 (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 (_ BitVec 32) Int) ListLongMap!18895)

(assert (=> b!1260202 (= lt!570765 (getCurrentListMap!4547 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260202 (= lt!570767 (getCurrentListMap!4547 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839867 () Bool)

(assert (=> start!105794 (=> (not res!839867) (not e!717067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105794 (= res!839867 (validMask!0 mask!1466))))

(assert (=> start!105794 e!717067))

(assert (=> start!105794 true))

(assert (=> start!105794 tp!95612))

(declare-fun tp_is_empty!32263 () Bool)

(assert (=> start!105794 tp_is_empty!32263))

(declare-fun array_inv!30283 (array!82067) Bool)

(assert (=> start!105794 (array_inv!30283 _keys!1118)))

(declare-fun array_inv!30284 (array!82069) Bool)

(assert (=> start!105794 (and (array_inv!30284 _values!914) e!717068)))

(declare-fun b!1260203 () Bool)

(declare-fun res!839864 () Bool)

(assert (=> b!1260203 (=> (not res!839864) (not e!717067))))

(assert (=> b!1260203 (= res!839864 (and (= (size!40127 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40126 _keys!1118) (size!40127 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260204 () Bool)

(declare-fun res!839865 () Bool)

(assert (=> b!1260204 (=> (not res!839865) (not e!717067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82067 (_ BitVec 32)) Bool)

(assert (=> b!1260204 (= res!839865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260205 () Bool)

(assert (=> b!1260205 (= e!717067 (not e!717073))))

(declare-fun res!839869 () Bool)

(assert (=> b!1260205 (=> res!839869 e!717073)))

(assert (=> b!1260205 (= res!839869 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570768 () ListLongMap!18895)

(assert (=> b!1260205 (= lt!570773 lt!570768)))

(declare-fun lt!570772 () Unit!41870)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1154 (array!82067 array!82069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 V!48383 V!48383 (_ BitVec 32) Int) Unit!41870)

(assert (=> b!1260205 (= lt!570772 (lemmaNoChangeToArrayThenSameMapNoExtras!1154 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5832 (array!82067 array!82069 (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 (_ BitVec 32) Int) ListLongMap!18895)

(assert (=> b!1260205 (= lt!570768 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260205 (= lt!570773 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260206 () Bool)

(declare-fun e!717071 () Bool)

(assert (=> b!1260206 (= e!717071 tp_is_empty!32263)))

(declare-fun b!1260207 () Bool)

(assert (=> b!1260207 (= e!717070 (= lt!570765 (+!4264 lt!570768 lt!570769)))))

(declare-fun b!1260208 () Bool)

(assert (=> b!1260208 (= e!717072 tp_is_empty!32263)))

(declare-fun mapNonEmpty!50194 () Bool)

(declare-fun tp!95611 () Bool)

(assert (=> mapNonEmpty!50194 (= mapRes!50194 (and tp!95611 e!717071))))

(declare-fun mapRest!50194 () (Array (_ BitVec 32) ValueCell!15368))

(declare-fun mapKey!50194 () (_ BitVec 32))

(declare-fun mapValue!50194 () ValueCell!15368)

(assert (=> mapNonEmpty!50194 (= (arr!39589 _values!914) (store mapRest!50194 mapKey!50194 mapValue!50194))))

(assert (= (and start!105794 res!839867) b!1260203))

(assert (= (and b!1260203 res!839864) b!1260204))

(assert (= (and b!1260204 res!839865) b!1260200))

(assert (= (and b!1260200 res!839866) b!1260205))

(assert (= (and b!1260205 (not res!839869)) b!1260202))

(assert (= (and b!1260202 res!839868) b!1260207))

(assert (= (and b!1260201 condMapEmpty!50194) mapIsEmpty!50194))

(assert (= (and b!1260201 (not condMapEmpty!50194)) mapNonEmpty!50194))

(get-info :version)

(assert (= (and mapNonEmpty!50194 ((_ is ValueCellFull!15368) mapValue!50194)) b!1260206))

(assert (= (and b!1260201 ((_ is ValueCellFull!15368) mapDefault!50194)) b!1260208))

(assert (= start!105794 b!1260201))

(declare-fun m!1160427 () Bool)

(assert (=> b!1260207 m!1160427))

(declare-fun m!1160429 () Bool)

(assert (=> b!1260205 m!1160429))

(declare-fun m!1160431 () Bool)

(assert (=> b!1260205 m!1160431))

(declare-fun m!1160433 () Bool)

(assert (=> b!1260205 m!1160433))

(declare-fun m!1160435 () Bool)

(assert (=> mapNonEmpty!50194 m!1160435))

(declare-fun m!1160437 () Bool)

(assert (=> b!1260202 m!1160437))

(declare-fun m!1160439 () Bool)

(assert (=> b!1260202 m!1160439))

(declare-fun m!1160441 () Bool)

(assert (=> b!1260202 m!1160441))

(declare-fun m!1160443 () Bool)

(assert (=> b!1260202 m!1160443))

(declare-fun m!1160445 () Bool)

(assert (=> b!1260202 m!1160445))

(declare-fun m!1160447 () Bool)

(assert (=> b!1260202 m!1160447))

(declare-fun m!1160449 () Bool)

(assert (=> b!1260202 m!1160449))

(declare-fun m!1160451 () Bool)

(assert (=> b!1260204 m!1160451))

(declare-fun m!1160453 () Bool)

(assert (=> start!105794 m!1160453))

(declare-fun m!1160455 () Bool)

(assert (=> start!105794 m!1160455))

(declare-fun m!1160457 () Bool)

(assert (=> start!105794 m!1160457))

(declare-fun m!1160459 () Bool)

(assert (=> b!1260200 m!1160459))

(check-sat (not b!1260205) tp_is_empty!32263 (not b!1260207) (not b!1260204) (not start!105794) b_and!45239 (not mapNonEmpty!50194) (not b_next!27361) (not b!1260200) (not b!1260202))
(check-sat b_and!45239 (not b_next!27361))
