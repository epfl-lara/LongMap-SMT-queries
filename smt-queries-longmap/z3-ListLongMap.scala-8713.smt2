; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105724 () Bool)

(assert start!105724)

(declare-fun b_free!27313 () Bool)

(declare-fun b_next!27313 () Bool)

(assert (=> start!105724 (= b_free!27313 (not b_next!27313))))

(declare-fun tp!95464 () Bool)

(declare-fun b_and!45179 () Bool)

(assert (=> start!105724 (= tp!95464 b_and!45179)))

(declare-fun mapIsEmpty!50119 () Bool)

(declare-fun mapRes!50119 () Bool)

(assert (=> mapIsEmpty!50119 mapRes!50119))

(declare-fun b!1259364 () Bool)

(declare-fun e!716448 () Bool)

(declare-fun e!716446 () Bool)

(assert (=> b!1259364 (= e!716448 (and e!716446 mapRes!50119))))

(declare-fun condMapEmpty!50119 () Bool)

(declare-datatypes ((V!48319 0))(
  ( (V!48320 (val!16170 Int)) )
))
(declare-datatypes ((ValueCell!15344 0))(
  ( (ValueCellFull!15344 (v!18871 V!48319)) (EmptyCell!15344) )
))
(declare-datatypes ((array!81973 0))(
  ( (array!81974 (arr!39542 (Array (_ BitVec 32) ValueCell!15344)) (size!40080 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81973)

(declare-fun mapDefault!50119 () ValueCell!15344)

(assert (=> b!1259364 (= condMapEmpty!50119 (= (arr!39542 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15344)) mapDefault!50119)))))

(declare-fun b!1259365 () Bool)

(declare-fun res!839346 () Bool)

(declare-fun e!716443 () Bool)

(assert (=> b!1259365 (=> (not res!839346) (not e!716443))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81975 0))(
  ( (array!81976 (arr!39543 (Array (_ BitVec 32) (_ BitVec 64))) (size!40081 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81975)

(assert (=> b!1259365 (= res!839346 (and (= (size!40080 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40081 _keys!1118) (size!40080 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259366 () Bool)

(declare-fun res!839347 () Bool)

(assert (=> b!1259366 (=> (not res!839347) (not e!716443))))

(declare-datatypes ((List!28187 0))(
  ( (Nil!28184) (Cons!28183 (h!29392 (_ BitVec 64)) (t!41673 List!28187)) )
))
(declare-fun arrayNoDuplicates!0 (array!81975 (_ BitVec 32) List!28187) Bool)

(assert (=> b!1259366 (= res!839347 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28184))))

(declare-fun mapNonEmpty!50119 () Bool)

(declare-fun tp!95465 () Bool)

(declare-fun e!716445 () Bool)

(assert (=> mapNonEmpty!50119 (= mapRes!50119 (and tp!95465 e!716445))))

(declare-fun mapRest!50119 () (Array (_ BitVec 32) ValueCell!15344))

(declare-fun mapValue!50119 () ValueCell!15344)

(declare-fun mapKey!50119 () (_ BitVec 32))

(assert (=> mapNonEmpty!50119 (= (arr!39542 _values!914) (store mapRest!50119 mapKey!50119 mapValue!50119))))

(declare-fun b!1259367 () Bool)

(declare-fun res!839349 () Bool)

(assert (=> b!1259367 (=> (not res!839349) (not e!716443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81975 (_ BitVec 32)) Bool)

(assert (=> b!1259367 (= res!839349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259368 () Bool)

(declare-fun e!716447 () Bool)

(assert (=> b!1259368 (= e!716447 true)))

(declare-datatypes ((tuple2!20984 0))(
  ( (tuple2!20985 (_1!10503 (_ BitVec 64)) (_2!10503 V!48319)) )
))
(declare-datatypes ((List!28188 0))(
  ( (Nil!28185) (Cons!28184 (h!29393 tuple2!20984) (t!41674 List!28188)) )
))
(declare-datatypes ((ListLongMap!18857 0))(
  ( (ListLongMap!18858 (toList!9444 List!28188)) )
))
(declare-fun lt!569907 () ListLongMap!18857)

(declare-fun lt!569905 () ListLongMap!18857)

(declare-fun -!2065 (ListLongMap!18857 (_ BitVec 64)) ListLongMap!18857)

(assert (=> b!1259368 (= lt!569907 (-!2065 lt!569905 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569906 () ListLongMap!18857)

(declare-fun lt!569903 () ListLongMap!18857)

(assert (=> b!1259368 (= (-!2065 lt!569906 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569903)))

(declare-datatypes ((Unit!41832 0))(
  ( (Unit!41833) )
))
(declare-fun lt!569898 () Unit!41832)

(declare-fun minValueBefore!43 () V!48319)

(declare-fun addThenRemoveForNewKeyIsSame!322 (ListLongMap!18857 (_ BitVec 64) V!48319) Unit!41832)

(assert (=> b!1259368 (= lt!569898 (addThenRemoveForNewKeyIsSame!322 lt!569903 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716444 () Bool)

(assert (=> b!1259368 e!716444))

(declare-fun res!839350 () Bool)

(assert (=> b!1259368 (=> (not res!839350) (not e!716444))))

(assert (=> b!1259368 (= res!839350 (= lt!569905 lt!569906))))

(declare-fun +!4245 (ListLongMap!18857 tuple2!20984) ListLongMap!18857)

(assert (=> b!1259368 (= lt!569906 (+!4245 lt!569903 (tuple2!20985 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569901 () ListLongMap!18857)

(declare-fun lt!569904 () tuple2!20984)

(assert (=> b!1259368 (= lt!569903 (+!4245 lt!569901 lt!569904))))

(declare-fun zeroValue!871 () V!48319)

(assert (=> b!1259368 (= lt!569904 (tuple2!20985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48319)

(declare-fun lt!569900 () ListLongMap!18857)

(declare-fun getCurrentListMap!4531 (array!81975 array!81973 (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 (_ BitVec 32) Int) ListLongMap!18857)

(assert (=> b!1259368 (= lt!569900 (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259368 (= lt!569905 (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259369 () Bool)

(declare-fun tp_is_empty!32215 () Bool)

(assert (=> b!1259369 (= e!716446 tp_is_empty!32215)))

(declare-fun res!839351 () Bool)

(assert (=> start!105724 (=> (not res!839351) (not e!716443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105724 (= res!839351 (validMask!0 mask!1466))))

(assert (=> start!105724 e!716443))

(assert (=> start!105724 true))

(assert (=> start!105724 tp!95464))

(assert (=> start!105724 tp_is_empty!32215))

(declare-fun array_inv!30251 (array!81975) Bool)

(assert (=> start!105724 (array_inv!30251 _keys!1118)))

(declare-fun array_inv!30252 (array!81973) Bool)

(assert (=> start!105724 (and (array_inv!30252 _values!914) e!716448)))

(declare-fun b!1259370 () Bool)

(declare-fun lt!569902 () ListLongMap!18857)

(assert (=> b!1259370 (= e!716444 (= lt!569900 (+!4245 lt!569902 lt!569904)))))

(declare-fun b!1259371 () Bool)

(assert (=> b!1259371 (= e!716445 tp_is_empty!32215)))

(declare-fun b!1259372 () Bool)

(assert (=> b!1259372 (= e!716443 (not e!716447))))

(declare-fun res!839348 () Bool)

(assert (=> b!1259372 (=> res!839348 e!716447)))

(assert (=> b!1259372 (= res!839348 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259372 (= lt!569901 lt!569902)))

(declare-fun lt!569899 () Unit!41832)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1139 (array!81975 array!81973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 V!48319 V!48319 (_ BitVec 32) Int) Unit!41832)

(assert (=> b!1259372 (= lt!569899 (lemmaNoChangeToArrayThenSameMapNoExtras!1139 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5817 (array!81975 array!81973 (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 (_ BitVec 32) Int) ListLongMap!18857)

(assert (=> b!1259372 (= lt!569902 (getCurrentListMapNoExtraKeys!5817 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259372 (= lt!569901 (getCurrentListMapNoExtraKeys!5817 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105724 res!839351) b!1259365))

(assert (= (and b!1259365 res!839346) b!1259367))

(assert (= (and b!1259367 res!839349) b!1259366))

(assert (= (and b!1259366 res!839347) b!1259372))

(assert (= (and b!1259372 (not res!839348)) b!1259368))

(assert (= (and b!1259368 res!839350) b!1259370))

(assert (= (and b!1259364 condMapEmpty!50119) mapIsEmpty!50119))

(assert (= (and b!1259364 (not condMapEmpty!50119)) mapNonEmpty!50119))

(get-info :version)

(assert (= (and mapNonEmpty!50119 ((_ is ValueCellFull!15344) mapValue!50119)) b!1259371))

(assert (= (and b!1259364 ((_ is ValueCellFull!15344) mapDefault!50119)) b!1259369))

(assert (= start!105724 b!1259364))

(declare-fun m!1159403 () Bool)

(assert (=> b!1259370 m!1159403))

(declare-fun m!1159405 () Bool)

(assert (=> b!1259367 m!1159405))

(declare-fun m!1159407 () Bool)

(assert (=> mapNonEmpty!50119 m!1159407))

(declare-fun m!1159409 () Bool)

(assert (=> start!105724 m!1159409))

(declare-fun m!1159411 () Bool)

(assert (=> start!105724 m!1159411))

(declare-fun m!1159413 () Bool)

(assert (=> start!105724 m!1159413))

(declare-fun m!1159415 () Bool)

(assert (=> b!1259368 m!1159415))

(declare-fun m!1159417 () Bool)

(assert (=> b!1259368 m!1159417))

(declare-fun m!1159419 () Bool)

(assert (=> b!1259368 m!1159419))

(declare-fun m!1159421 () Bool)

(assert (=> b!1259368 m!1159421))

(declare-fun m!1159423 () Bool)

(assert (=> b!1259368 m!1159423))

(declare-fun m!1159425 () Bool)

(assert (=> b!1259368 m!1159425))

(declare-fun m!1159427 () Bool)

(assert (=> b!1259368 m!1159427))

(declare-fun m!1159429 () Bool)

(assert (=> b!1259366 m!1159429))

(declare-fun m!1159431 () Bool)

(assert (=> b!1259372 m!1159431))

(declare-fun m!1159433 () Bool)

(assert (=> b!1259372 m!1159433))

(declare-fun m!1159435 () Bool)

(assert (=> b!1259372 m!1159435))

(check-sat (not b_next!27313) (not b!1259370) (not b!1259372) (not mapNonEmpty!50119) (not b!1259366) (not start!105724) tp_is_empty!32215 (not b!1259367) b_and!45179 (not b!1259368))
(check-sat b_and!45179 (not b_next!27313))
