; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105800 () Bool)

(assert start!105800)

(declare-fun b_free!27367 () Bool)

(declare-fun b_next!27367 () Bool)

(assert (=> start!105800 (= b_free!27367 (not b_next!27367))))

(declare-fun tp!95629 () Bool)

(declare-fun b_and!45245 () Bool)

(assert (=> start!105800 (= tp!95629 b_and!45245)))

(declare-fun b!1260281 () Bool)

(declare-fun res!839921 () Bool)

(declare-fun e!717133 () Bool)

(assert (=> b!1260281 (=> (not res!839921) (not e!717133))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82079 0))(
  ( (array!82080 (arr!39594 (Array (_ BitVec 32) (_ BitVec 64))) (size!40132 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82079)

(declare-datatypes ((V!48391 0))(
  ( (V!48392 (val!16197 Int)) )
))
(declare-datatypes ((ValueCell!15371 0))(
  ( (ValueCellFull!15371 (v!18899 V!48391)) (EmptyCell!15371) )
))
(declare-datatypes ((array!82081 0))(
  ( (array!82082 (arr!39595 (Array (_ BitVec 32) ValueCell!15371)) (size!40133 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82081)

(assert (=> b!1260281 (= res!839921 (and (= (size!40133 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40132 _keys!1118) (size!40133 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260282 () Bool)

(declare-fun e!717132 () Bool)

(assert (=> b!1260282 (= e!717133 (not e!717132))))

(declare-fun res!839923 () Bool)

(assert (=> b!1260282 (=> res!839923 e!717132)))

(assert (=> b!1260282 (= res!839923 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21028 0))(
  ( (tuple2!21029 (_1!10525 (_ BitVec 64)) (_2!10525 V!48391)) )
))
(declare-datatypes ((List!28228 0))(
  ( (Nil!28225) (Cons!28224 (h!29433 tuple2!21028) (t!41716 List!28228)) )
))
(declare-datatypes ((ListLongMap!18901 0))(
  ( (ListLongMap!18902 (toList!9466 List!28228)) )
))
(declare-fun lt!570856 () ListLongMap!18901)

(declare-fun lt!570862 () ListLongMap!18901)

(assert (=> b!1260282 (= lt!570856 lt!570862)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48391)

(declare-datatypes ((Unit!41876 0))(
  ( (Unit!41877) )
))
(declare-fun lt!570854 () Unit!41876)

(declare-fun zeroValue!871 () V!48391)

(declare-fun minValueBefore!43 () V!48391)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1157 (array!82079 array!82081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 V!48391 V!48391 (_ BitVec 32) Int) Unit!41876)

(assert (=> b!1260282 (= lt!570854 (lemmaNoChangeToArrayThenSameMapNoExtras!1157 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5835 (array!82079 array!82081 (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 (_ BitVec 32) Int) ListLongMap!18901)

(assert (=> b!1260282 (= lt!570862 (getCurrentListMapNoExtraKeys!5835 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260282 (= lt!570856 (getCurrentListMapNoExtraKeys!5835 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50203 () Bool)

(declare-fun mapRes!50203 () Bool)

(assert (=> mapIsEmpty!50203 mapRes!50203))

(declare-fun res!839922 () Bool)

(assert (=> start!105800 (=> (not res!839922) (not e!717133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105800 (= res!839922 (validMask!0 mask!1466))))

(assert (=> start!105800 e!717133))

(assert (=> start!105800 true))

(assert (=> start!105800 tp!95629))

(declare-fun tp_is_empty!32269 () Bool)

(assert (=> start!105800 tp_is_empty!32269))

(declare-fun array_inv!30289 (array!82079) Bool)

(assert (=> start!105800 (array_inv!30289 _keys!1118)))

(declare-fun e!717134 () Bool)

(declare-fun array_inv!30290 (array!82081) Bool)

(assert (=> start!105800 (and (array_inv!30290 _values!914) e!717134)))

(declare-fun b!1260283 () Bool)

(declare-fun e!717135 () Bool)

(assert (=> b!1260283 (= e!717135 tp_is_empty!32269)))

(declare-fun mapNonEmpty!50203 () Bool)

(declare-fun tp!95630 () Bool)

(assert (=> mapNonEmpty!50203 (= mapRes!50203 (and tp!95630 e!717135))))

(declare-fun mapRest!50203 () (Array (_ BitVec 32) ValueCell!15371))

(declare-fun mapValue!50203 () ValueCell!15371)

(declare-fun mapKey!50203 () (_ BitVec 32))

(assert (=> mapNonEmpty!50203 (= (arr!39595 _values!914) (store mapRest!50203 mapKey!50203 mapValue!50203))))

(declare-fun b!1260284 () Bool)

(assert (=> b!1260284 (= e!717132 true)))

(declare-fun lt!570857 () ListLongMap!18901)

(declare-fun lt!570860 () ListLongMap!18901)

(declare-fun -!2084 (ListLongMap!18901 (_ BitVec 64)) ListLongMap!18901)

(assert (=> b!1260284 (= lt!570857 (-!2084 lt!570860 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570858 () ListLongMap!18901)

(declare-fun lt!570859 () ListLongMap!18901)

(assert (=> b!1260284 (= (-!2084 lt!570858 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570859)))

(declare-fun lt!570855 () Unit!41876)

(declare-fun addThenRemoveForNewKeyIsSame!341 (ListLongMap!18901 (_ BitVec 64) V!48391) Unit!41876)

(assert (=> b!1260284 (= lt!570855 (addThenRemoveForNewKeyIsSame!341 lt!570859 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717131 () Bool)

(assert (=> b!1260284 e!717131))

(declare-fun res!839920 () Bool)

(assert (=> b!1260284 (=> (not res!839920) (not e!717131))))

(assert (=> b!1260284 (= res!839920 (= lt!570860 lt!570858))))

(declare-fun +!4267 (ListLongMap!18901 tuple2!21028) ListLongMap!18901)

(assert (=> b!1260284 (= lt!570858 (+!4267 lt!570859 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570861 () tuple2!21028)

(assert (=> b!1260284 (= lt!570859 (+!4267 lt!570856 lt!570861))))

(assert (=> b!1260284 (= lt!570861 (tuple2!21029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570863 () ListLongMap!18901)

(declare-fun getCurrentListMap!4550 (array!82079 array!82081 (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 (_ BitVec 32) Int) ListLongMap!18901)

(assert (=> b!1260284 (= lt!570863 (getCurrentListMap!4550 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260284 (= lt!570860 (getCurrentListMap!4550 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260285 () Bool)

(declare-fun res!839918 () Bool)

(assert (=> b!1260285 (=> (not res!839918) (not e!717133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82079 (_ BitVec 32)) Bool)

(assert (=> b!1260285 (= res!839918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260286 () Bool)

(assert (=> b!1260286 (= e!717131 (= lt!570863 (+!4267 lt!570862 lt!570861)))))

(declare-fun b!1260287 () Bool)

(declare-fun e!717136 () Bool)

(assert (=> b!1260287 (= e!717134 (and e!717136 mapRes!50203))))

(declare-fun condMapEmpty!50203 () Bool)

(declare-fun mapDefault!50203 () ValueCell!15371)

(assert (=> b!1260287 (= condMapEmpty!50203 (= (arr!39595 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15371)) mapDefault!50203)))))

(declare-fun b!1260288 () Bool)

(assert (=> b!1260288 (= e!717136 tp_is_empty!32269)))

(declare-fun b!1260289 () Bool)

(declare-fun res!839919 () Bool)

(assert (=> b!1260289 (=> (not res!839919) (not e!717133))))

(declare-datatypes ((List!28229 0))(
  ( (Nil!28226) (Cons!28225 (h!29434 (_ BitVec 64)) (t!41717 List!28229)) )
))
(declare-fun arrayNoDuplicates!0 (array!82079 (_ BitVec 32) List!28229) Bool)

(assert (=> b!1260289 (= res!839919 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28226))))

(assert (= (and start!105800 res!839922) b!1260281))

(assert (= (and b!1260281 res!839921) b!1260285))

(assert (= (and b!1260285 res!839918) b!1260289))

(assert (= (and b!1260289 res!839919) b!1260282))

(assert (= (and b!1260282 (not res!839923)) b!1260284))

(assert (= (and b!1260284 res!839920) b!1260286))

(assert (= (and b!1260287 condMapEmpty!50203) mapIsEmpty!50203))

(assert (= (and b!1260287 (not condMapEmpty!50203)) mapNonEmpty!50203))

(get-info :version)

(assert (= (and mapNonEmpty!50203 ((_ is ValueCellFull!15371) mapValue!50203)) b!1260283))

(assert (= (and b!1260287 ((_ is ValueCellFull!15371) mapDefault!50203)) b!1260288))

(assert (= start!105800 b!1260287))

(declare-fun m!1160529 () Bool)

(assert (=> b!1260285 m!1160529))

(declare-fun m!1160531 () Bool)

(assert (=> b!1260289 m!1160531))

(declare-fun m!1160533 () Bool)

(assert (=> mapNonEmpty!50203 m!1160533))

(declare-fun m!1160535 () Bool)

(assert (=> b!1260286 m!1160535))

(declare-fun m!1160537 () Bool)

(assert (=> b!1260282 m!1160537))

(declare-fun m!1160539 () Bool)

(assert (=> b!1260282 m!1160539))

(declare-fun m!1160541 () Bool)

(assert (=> b!1260282 m!1160541))

(declare-fun m!1160543 () Bool)

(assert (=> start!105800 m!1160543))

(declare-fun m!1160545 () Bool)

(assert (=> start!105800 m!1160545))

(declare-fun m!1160547 () Bool)

(assert (=> start!105800 m!1160547))

(declare-fun m!1160549 () Bool)

(assert (=> b!1260284 m!1160549))

(declare-fun m!1160551 () Bool)

(assert (=> b!1260284 m!1160551))

(declare-fun m!1160553 () Bool)

(assert (=> b!1260284 m!1160553))

(declare-fun m!1160555 () Bool)

(assert (=> b!1260284 m!1160555))

(declare-fun m!1160557 () Bool)

(assert (=> b!1260284 m!1160557))

(declare-fun m!1160559 () Bool)

(assert (=> b!1260284 m!1160559))

(declare-fun m!1160561 () Bool)

(assert (=> b!1260284 m!1160561))

(check-sat (not start!105800) (not b!1260284) (not b_next!27367) (not b!1260282) (not mapNonEmpty!50203) (not b!1260289) b_and!45245 (not b!1260285) (not b!1260286) tp_is_empty!32269)
(check-sat b_and!45245 (not b_next!27367))
