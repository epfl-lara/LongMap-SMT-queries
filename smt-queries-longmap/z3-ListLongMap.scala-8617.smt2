; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105192 () Bool)

(assert start!105192)

(declare-fun b_free!26737 () Bool)

(declare-fun b_next!26737 () Bool)

(assert (=> start!105192 (= b_free!26737 (not b_next!26737))))

(declare-fun tp!93707 () Bool)

(declare-fun b_and!44525 () Bool)

(assert (=> start!105192 (= tp!93707 b_and!44525)))

(declare-fun mapIsEmpty!49225 () Bool)

(declare-fun mapRes!49225 () Bool)

(assert (=> mapIsEmpty!49225 mapRes!49225))

(declare-fun b!1252404 () Bool)

(declare-fun e!711220 () Bool)

(assert (=> b!1252404 (= e!711220 true)))

(declare-datatypes ((V!47551 0))(
  ( (V!47552 (val!15882 Int)) )
))
(declare-datatypes ((tuple2!20504 0))(
  ( (tuple2!20505 (_1!10263 (_ BitVec 64)) (_2!10263 V!47551)) )
))
(declare-datatypes ((List!27751 0))(
  ( (Nil!27748) (Cons!27747 (h!28965 tuple2!20504) (t!41218 List!27751)) )
))
(declare-datatypes ((ListLongMap!18385 0))(
  ( (ListLongMap!18386 (toList!9208 List!27751)) )
))
(declare-fun lt!565116 () ListLongMap!18385)

(declare-fun -!1994 (ListLongMap!18385 (_ BitVec 64)) ListLongMap!18385)

(assert (=> b!1252404 (= (-!1994 lt!565116 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565116)))

(declare-datatypes ((Unit!41554 0))(
  ( (Unit!41555) )
))
(declare-fun lt!565118 () Unit!41554)

(declare-fun removeNotPresentStillSame!104 (ListLongMap!18385 (_ BitVec 64)) Unit!41554)

(assert (=> b!1252404 (= lt!565118 (removeNotPresentStillSame!104 lt!565116 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252405 () Bool)

(declare-fun res!834987 () Bool)

(declare-fun e!711218 () Bool)

(assert (=> b!1252405 (=> (not res!834987) (not e!711218))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15056 0))(
  ( (ValueCellFull!15056 (v!18575 V!47551)) (EmptyCell!15056) )
))
(declare-datatypes ((array!80993 0))(
  ( (array!80994 (arr!39057 (Array (_ BitVec 32) ValueCell!15056)) (size!39594 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80993)

(declare-datatypes ((array!80995 0))(
  ( (array!80996 (arr!39058 (Array (_ BitVec 32) (_ BitVec 64))) (size!39595 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80995)

(assert (=> b!1252405 (= res!834987 (and (= (size!39594 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39595 _keys!1118) (size!39594 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252407 () Bool)

(declare-fun e!711215 () Bool)

(assert (=> b!1252407 (= e!711218 (not e!711215))))

(declare-fun res!834990 () Bool)

(assert (=> b!1252407 (=> res!834990 e!711215)))

(assert (=> b!1252407 (= res!834990 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!565120 () ListLongMap!18385)

(declare-fun lt!565119 () ListLongMap!18385)

(assert (=> b!1252407 (= lt!565120 lt!565119)))

(declare-fun minValueAfter!43 () V!47551)

(declare-fun zeroValue!871 () V!47551)

(declare-fun minValueBefore!43 () V!47551)

(declare-fun lt!565117 () Unit!41554)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!951 (array!80995 array!80993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 V!47551 V!47551 (_ BitVec 32) Int) Unit!41554)

(assert (=> b!1252407 (= lt!565117 (lemmaNoChangeToArrayThenSameMapNoExtras!951 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5637 (array!80995 array!80993 (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 (_ BitVec 32) Int) ListLongMap!18385)

(assert (=> b!1252407 (= lt!565119 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252407 (= lt!565120 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49225 () Bool)

(declare-fun tp!93706 () Bool)

(declare-fun e!711219 () Bool)

(assert (=> mapNonEmpty!49225 (= mapRes!49225 (and tp!93706 e!711219))))

(declare-fun mapValue!49225 () ValueCell!15056)

(declare-fun mapKey!49225 () (_ BitVec 32))

(declare-fun mapRest!49225 () (Array (_ BitVec 32) ValueCell!15056))

(assert (=> mapNonEmpty!49225 (= (arr!39057 _values!914) (store mapRest!49225 mapKey!49225 mapValue!49225))))

(declare-fun b!1252408 () Bool)

(declare-fun tp_is_empty!31639 () Bool)

(assert (=> b!1252408 (= e!711219 tp_is_empty!31639)))

(declare-fun b!1252409 () Bool)

(declare-fun res!834989 () Bool)

(assert (=> b!1252409 (=> (not res!834989) (not e!711218))))

(declare-datatypes ((List!27752 0))(
  ( (Nil!27749) (Cons!27748 (h!28966 (_ BitVec 64)) (t!41219 List!27752)) )
))
(declare-fun arrayNoDuplicates!0 (array!80995 (_ BitVec 32) List!27752) Bool)

(assert (=> b!1252409 (= res!834989 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27749))))

(declare-fun res!834985 () Bool)

(assert (=> start!105192 (=> (not res!834985) (not e!711218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105192 (= res!834985 (validMask!0 mask!1466))))

(assert (=> start!105192 e!711218))

(assert (=> start!105192 true))

(assert (=> start!105192 tp!93707))

(assert (=> start!105192 tp_is_empty!31639))

(declare-fun array_inv!29909 (array!80995) Bool)

(assert (=> start!105192 (array_inv!29909 _keys!1118)))

(declare-fun e!711216 () Bool)

(declare-fun array_inv!29910 (array!80993) Bool)

(assert (=> start!105192 (and (array_inv!29910 _values!914) e!711216)))

(declare-fun b!1252406 () Bool)

(declare-fun res!834988 () Bool)

(assert (=> b!1252406 (=> (not res!834988) (not e!711218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80995 (_ BitVec 32)) Bool)

(assert (=> b!1252406 (= res!834988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252410 () Bool)

(declare-fun e!711217 () Bool)

(assert (=> b!1252410 (= e!711217 tp_is_empty!31639)))

(declare-fun b!1252411 () Bool)

(assert (=> b!1252411 (= e!711216 (and e!711217 mapRes!49225))))

(declare-fun condMapEmpty!49225 () Bool)

(declare-fun mapDefault!49225 () ValueCell!15056)

(assert (=> b!1252411 (= condMapEmpty!49225 (= (arr!39057 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15056)) mapDefault!49225)))))

(declare-fun b!1252412 () Bool)

(assert (=> b!1252412 (= e!711215 e!711220)))

(declare-fun res!834986 () Bool)

(assert (=> b!1252412 (=> res!834986 e!711220)))

(declare-fun contains!7532 (ListLongMap!18385 (_ BitVec 64)) Bool)

(assert (=> b!1252412 (= res!834986 (contains!7532 lt!565116 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4468 (array!80995 array!80993 (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 (_ BitVec 32) Int) ListLongMap!18385)

(assert (=> b!1252412 (= lt!565116 (getCurrentListMap!4468 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105192 res!834985) b!1252405))

(assert (= (and b!1252405 res!834987) b!1252406))

(assert (= (and b!1252406 res!834988) b!1252409))

(assert (= (and b!1252409 res!834989) b!1252407))

(assert (= (and b!1252407 (not res!834990)) b!1252412))

(assert (= (and b!1252412 (not res!834986)) b!1252404))

(assert (= (and b!1252411 condMapEmpty!49225) mapIsEmpty!49225))

(assert (= (and b!1252411 (not condMapEmpty!49225)) mapNonEmpty!49225))

(get-info :version)

(assert (= (and mapNonEmpty!49225 ((_ is ValueCellFull!15056) mapValue!49225)) b!1252408))

(assert (= (and b!1252411 ((_ is ValueCellFull!15056) mapDefault!49225)) b!1252410))

(assert (= start!105192 b!1252411))

(declare-fun m!1153491 () Bool)

(assert (=> b!1252407 m!1153491))

(declare-fun m!1153493 () Bool)

(assert (=> b!1252407 m!1153493))

(declare-fun m!1153495 () Bool)

(assert (=> b!1252407 m!1153495))

(declare-fun m!1153497 () Bool)

(assert (=> mapNonEmpty!49225 m!1153497))

(declare-fun m!1153499 () Bool)

(assert (=> b!1252404 m!1153499))

(declare-fun m!1153501 () Bool)

(assert (=> b!1252404 m!1153501))

(declare-fun m!1153503 () Bool)

(assert (=> b!1252406 m!1153503))

(declare-fun m!1153505 () Bool)

(assert (=> start!105192 m!1153505))

(declare-fun m!1153507 () Bool)

(assert (=> start!105192 m!1153507))

(declare-fun m!1153509 () Bool)

(assert (=> start!105192 m!1153509))

(declare-fun m!1153511 () Bool)

(assert (=> b!1252409 m!1153511))

(declare-fun m!1153513 () Bool)

(assert (=> b!1252412 m!1153513))

(declare-fun m!1153515 () Bool)

(assert (=> b!1252412 m!1153515))

(check-sat (not mapNonEmpty!49225) (not start!105192) (not b!1252404) b_and!44525 (not b!1252406) (not b!1252407) (not b!1252409) tp_is_empty!31639 (not b!1252412) (not b_next!26737))
(check-sat b_and!44525 (not b_next!26737))
