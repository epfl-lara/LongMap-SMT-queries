; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106022 () Bool)

(assert start!106022)

(declare-fun b_free!27361 () Bool)

(declare-fun b_next!27361 () Bool)

(assert (=> start!106022 (= b_free!27361 (not b_next!27361))))

(declare-fun tp!95611 () Bool)

(declare-fun b_and!45259 () Bool)

(assert (=> start!106022 (= tp!95611 b_and!45259)))

(declare-fun b!1261587 () Bool)

(declare-fun res!840428 () Bool)

(declare-fun e!717960 () Bool)

(assert (=> b!1261587 (=> (not res!840428) (not e!717960))))

(declare-datatypes ((array!82195 0))(
  ( (array!82196 (arr!39647 (Array (_ BitVec 32) (_ BitVec 64))) (size!40184 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82195)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82195 (_ BitVec 32)) Bool)

(assert (=> b!1261587 (= res!840428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50194 () Bool)

(declare-fun mapRes!50194 () Bool)

(assert (=> mapIsEmpty!50194 mapRes!50194))

(declare-fun res!840429 () Bool)

(assert (=> start!106022 (=> (not res!840429) (not e!717960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106022 (= res!840429 (validMask!0 mask!1466))))

(assert (=> start!106022 e!717960))

(assert (=> start!106022 true))

(assert (=> start!106022 tp!95611))

(declare-fun tp_is_empty!32263 () Bool)

(assert (=> start!106022 tp_is_empty!32263))

(declare-fun array_inv!30329 (array!82195) Bool)

(assert (=> start!106022 (array_inv!30329 _keys!1118)))

(declare-datatypes ((V!48383 0))(
  ( (V!48384 (val!16194 Int)) )
))
(declare-datatypes ((ValueCell!15368 0))(
  ( (ValueCellFull!15368 (v!18893 V!48383)) (EmptyCell!15368) )
))
(declare-datatypes ((array!82197 0))(
  ( (array!82198 (arr!39648 (Array (_ BitVec 32) ValueCell!15368)) (size!40185 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82197)

(declare-fun e!717962 () Bool)

(declare-fun array_inv!30330 (array!82197) Bool)

(assert (=> start!106022 (and (array_inv!30330 _values!914) e!717962)))

(declare-fun b!1261588 () Bool)

(declare-fun res!840425 () Bool)

(assert (=> b!1261588 (=> (not res!840425) (not e!717960))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261588 (= res!840425 (and (= (size!40185 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40184 _keys!1118) (size!40185 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261589 () Bool)

(declare-fun res!840426 () Bool)

(assert (=> b!1261589 (=> (not res!840426) (not e!717960))))

(declare-datatypes ((List!28187 0))(
  ( (Nil!28184) (Cons!28183 (h!29401 (_ BitVec 64)) (t!41676 List!28187)) )
))
(declare-fun arrayNoDuplicates!0 (array!82195 (_ BitVec 32) List!28187) Bool)

(assert (=> b!1261589 (= res!840426 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28184))))

(declare-fun b!1261590 () Bool)

(declare-fun e!717964 () Bool)

(assert (=> b!1261590 (= e!717964 true)))

(declare-datatypes ((tuple2!20964 0))(
  ( (tuple2!20965 (_1!10493 (_ BitVec 64)) (_2!10493 V!48383)) )
))
(declare-datatypes ((List!28188 0))(
  ( (Nil!28185) (Cons!28184 (h!29402 tuple2!20964) (t!41677 List!28188)) )
))
(declare-datatypes ((ListLongMap!18845 0))(
  ( (ListLongMap!18846 (toList!9438 List!28188)) )
))
(declare-fun lt!571430 () ListLongMap!18845)

(declare-fun lt!571432 () ListLongMap!18845)

(declare-fun -!2104 (ListLongMap!18845 (_ BitVec 64)) ListLongMap!18845)

(assert (=> b!1261590 (= lt!571430 (-!2104 lt!571432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571428 () ListLongMap!18845)

(declare-fun lt!571436 () ListLongMap!18845)

(assert (=> b!1261590 (= (-!2104 lt!571428 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571436)))

(declare-datatypes ((Unit!42012 0))(
  ( (Unit!42013) )
))
(declare-fun lt!571431 () Unit!42012)

(declare-fun minValueBefore!43 () V!48383)

(declare-fun addThenRemoveForNewKeyIsSame!358 (ListLongMap!18845 (_ BitVec 64) V!48383) Unit!42012)

(assert (=> b!1261590 (= lt!571431 (addThenRemoveForNewKeyIsSame!358 lt!571436 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717961 () Bool)

(assert (=> b!1261590 e!717961))

(declare-fun res!840424 () Bool)

(assert (=> b!1261590 (=> (not res!840424) (not e!717961))))

(assert (=> b!1261590 (= res!840424 (= lt!571432 lt!571428))))

(declare-fun +!4276 (ListLongMap!18845 tuple2!20964) ListLongMap!18845)

(assert (=> b!1261590 (= lt!571428 (+!4276 lt!571436 (tuple2!20965 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571429 () ListLongMap!18845)

(declare-fun lt!571435 () tuple2!20964)

(assert (=> b!1261590 (= lt!571436 (+!4276 lt!571429 lt!571435))))

(declare-fun zeroValue!871 () V!48383)

(assert (=> b!1261590 (= lt!571435 (tuple2!20965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48383)

(declare-fun lt!571433 () ListLongMap!18845)

(declare-fun getCurrentListMap!4616 (array!82195 array!82197 (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 (_ BitVec 32) Int) ListLongMap!18845)

(assert (=> b!1261590 (= lt!571433 (getCurrentListMap!4616 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261590 (= lt!571432 (getCurrentListMap!4616 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50194 () Bool)

(declare-fun tp!95612 () Bool)

(declare-fun e!717959 () Bool)

(assert (=> mapNonEmpty!50194 (= mapRes!50194 (and tp!95612 e!717959))))

(declare-fun mapValue!50194 () ValueCell!15368)

(declare-fun mapRest!50194 () (Array (_ BitVec 32) ValueCell!15368))

(declare-fun mapKey!50194 () (_ BitVec 32))

(assert (=> mapNonEmpty!50194 (= (arr!39648 _values!914) (store mapRest!50194 mapKey!50194 mapValue!50194))))

(declare-fun b!1261591 () Bool)

(declare-fun e!717963 () Bool)

(assert (=> b!1261591 (= e!717962 (and e!717963 mapRes!50194))))

(declare-fun condMapEmpty!50194 () Bool)

(declare-fun mapDefault!50194 () ValueCell!15368)

(assert (=> b!1261591 (= condMapEmpty!50194 (= (arr!39648 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15368)) mapDefault!50194)))))

(declare-fun b!1261592 () Bool)

(declare-fun lt!571427 () ListLongMap!18845)

(assert (=> b!1261592 (= e!717961 (= lt!571433 (+!4276 lt!571427 lt!571435)))))

(declare-fun b!1261593 () Bool)

(assert (=> b!1261593 (= e!717959 tp_is_empty!32263)))

(declare-fun b!1261594 () Bool)

(assert (=> b!1261594 (= e!717963 tp_is_empty!32263)))

(declare-fun b!1261595 () Bool)

(assert (=> b!1261595 (= e!717960 (not e!717964))))

(declare-fun res!840427 () Bool)

(assert (=> b!1261595 (=> res!840427 e!717964)))

(assert (=> b!1261595 (= res!840427 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1261595 (= lt!571429 lt!571427)))

(declare-fun lt!571434 () Unit!42012)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1160 (array!82195 array!82197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 V!48383 V!48383 (_ BitVec 32) Int) Unit!42012)

(assert (=> b!1261595 (= lt!571434 (lemmaNoChangeToArrayThenSameMapNoExtras!1160 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5846 (array!82195 array!82197 (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 (_ BitVec 32) Int) ListLongMap!18845)

(assert (=> b!1261595 (= lt!571427 (getCurrentListMapNoExtraKeys!5846 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261595 (= lt!571429 (getCurrentListMapNoExtraKeys!5846 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106022 res!840429) b!1261588))

(assert (= (and b!1261588 res!840425) b!1261587))

(assert (= (and b!1261587 res!840428) b!1261589))

(assert (= (and b!1261589 res!840426) b!1261595))

(assert (= (and b!1261595 (not res!840427)) b!1261590))

(assert (= (and b!1261590 res!840424) b!1261592))

(assert (= (and b!1261591 condMapEmpty!50194) mapIsEmpty!50194))

(assert (= (and b!1261591 (not condMapEmpty!50194)) mapNonEmpty!50194))

(get-info :version)

(assert (= (and mapNonEmpty!50194 ((_ is ValueCellFull!15368) mapValue!50194)) b!1261593))

(assert (= (and b!1261591 ((_ is ValueCellFull!15368) mapDefault!50194)) b!1261594))

(assert (= start!106022 b!1261591))

(declare-fun m!1162559 () Bool)

(assert (=> b!1261592 m!1162559))

(declare-fun m!1162561 () Bool)

(assert (=> start!106022 m!1162561))

(declare-fun m!1162563 () Bool)

(assert (=> start!106022 m!1162563))

(declare-fun m!1162565 () Bool)

(assert (=> start!106022 m!1162565))

(declare-fun m!1162567 () Bool)

(assert (=> b!1261590 m!1162567))

(declare-fun m!1162569 () Bool)

(assert (=> b!1261590 m!1162569))

(declare-fun m!1162571 () Bool)

(assert (=> b!1261590 m!1162571))

(declare-fun m!1162573 () Bool)

(assert (=> b!1261590 m!1162573))

(declare-fun m!1162575 () Bool)

(assert (=> b!1261590 m!1162575))

(declare-fun m!1162577 () Bool)

(assert (=> b!1261590 m!1162577))

(declare-fun m!1162579 () Bool)

(assert (=> b!1261590 m!1162579))

(declare-fun m!1162581 () Bool)

(assert (=> b!1261595 m!1162581))

(declare-fun m!1162583 () Bool)

(assert (=> b!1261595 m!1162583))

(declare-fun m!1162585 () Bool)

(assert (=> b!1261595 m!1162585))

(declare-fun m!1162587 () Bool)

(assert (=> b!1261587 m!1162587))

(declare-fun m!1162589 () Bool)

(assert (=> mapNonEmpty!50194 m!1162589))

(declare-fun m!1162591 () Bool)

(assert (=> b!1261589 m!1162591))

(check-sat (not b!1261595) tp_is_empty!32263 (not b!1261587) (not start!106022) (not b_next!27361) (not b!1261592) (not b!1261589) (not b!1261590) (not mapNonEmpty!50194) b_and!45259)
(check-sat b_and!45259 (not b_next!27361))
