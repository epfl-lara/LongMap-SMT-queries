; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106194 () Bool)

(assert start!106194)

(declare-fun b_free!27535 () Bool)

(declare-fun b_next!27535 () Bool)

(assert (=> start!106194 (= b_free!27535 (not b_next!27535))))

(declare-fun tp!96170 () Bool)

(declare-fun b_and!45549 () Bool)

(assert (=> start!106194 (= tp!96170 b_and!45549)))

(declare-fun b!1264318 () Bool)

(declare-fun e!719927 () Bool)

(declare-fun e!719922 () Bool)

(declare-fun mapRes!50491 () Bool)

(assert (=> b!1264318 (= e!719927 (and e!719922 mapRes!50491))))

(declare-fun condMapEmpty!50491 () Bool)

(declare-datatypes ((V!48615 0))(
  ( (V!48616 (val!16281 Int)) )
))
(declare-datatypes ((ValueCell!15455 0))(
  ( (ValueCellFull!15455 (v!18994 V!48615)) (EmptyCell!15455) )
))
(declare-datatypes ((array!82427 0))(
  ( (array!82428 (arr!39756 (Array (_ BitVec 32) ValueCell!15455)) (size!40294 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82427)

(declare-fun mapDefault!50491 () ValueCell!15455)

(assert (=> b!1264318 (= condMapEmpty!50491 (= (arr!39756 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15455)) mapDefault!50491)))))

(declare-fun res!842015 () Bool)

(declare-fun e!719926 () Bool)

(assert (=> start!106194 (=> (not res!842015) (not e!719926))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106194 (= res!842015 (validMask!0 mask!1466))))

(assert (=> start!106194 e!719926))

(assert (=> start!106194 true))

(assert (=> start!106194 tp!96170))

(declare-fun tp_is_empty!32437 () Bool)

(assert (=> start!106194 tp_is_empty!32437))

(declare-datatypes ((array!82429 0))(
  ( (array!82430 (arr!39757 (Array (_ BitVec 32) (_ BitVec 64))) (size!40295 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82429)

(declare-fun array_inv!30421 (array!82429) Bool)

(assert (=> start!106194 (array_inv!30421 _keys!1118)))

(declare-fun array_inv!30422 (array!82427) Bool)

(assert (=> start!106194 (and (array_inv!30422 _values!914) e!719927)))

(declare-fun mapIsEmpty!50491 () Bool)

(assert (=> mapIsEmpty!50491 mapRes!50491))

(declare-fun b!1264319 () Bool)

(declare-fun res!842013 () Bool)

(assert (=> b!1264319 (=> (not res!842013) (not e!719926))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1264319 (= res!842013 (and (= (size!40294 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40295 _keys!1118) (size!40294 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50491 () Bool)

(declare-fun tp!96169 () Bool)

(declare-fun e!719924 () Bool)

(assert (=> mapNonEmpty!50491 (= mapRes!50491 (and tp!96169 e!719924))))

(declare-fun mapRest!50491 () (Array (_ BitVec 32) ValueCell!15455))

(declare-fun mapValue!50491 () ValueCell!15455)

(declare-fun mapKey!50491 () (_ BitVec 32))

(assert (=> mapNonEmpty!50491 (= (arr!39756 _values!914) (store mapRest!50491 mapKey!50491 mapValue!50491))))

(declare-fun b!1264320 () Bool)

(declare-fun e!719923 () Bool)

(assert (=> b!1264320 (= e!719926 (not e!719923))))

(declare-fun res!842011 () Bool)

(assert (=> b!1264320 (=> res!842011 e!719923)))

(assert (=> b!1264320 (= res!842011 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21164 0))(
  ( (tuple2!21165 (_1!10593 (_ BitVec 64)) (_2!10593 V!48615)) )
))
(declare-datatypes ((List!28355 0))(
  ( (Nil!28352) (Cons!28351 (h!29560 tuple2!21164) (t!41867 List!28355)) )
))
(declare-datatypes ((ListLongMap!19037 0))(
  ( (ListLongMap!19038 (toList!9534 List!28355)) )
))
(declare-fun lt!573558 () ListLongMap!19037)

(declare-fun lt!573564 () ListLongMap!19037)

(assert (=> b!1264320 (= lt!573558 lt!573564)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48615)

(declare-fun zeroValue!871 () V!48615)

(declare-fun minValueBefore!43 () V!48615)

(declare-datatypes ((Unit!41990 0))(
  ( (Unit!41991) )
))
(declare-fun lt!573563 () Unit!41990)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1197 (array!82429 array!82427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 V!48615 V!48615 (_ BitVec 32) Int) Unit!41990)

(assert (=> b!1264320 (= lt!573563 (lemmaNoChangeToArrayThenSameMapNoExtras!1197 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5897 (array!82429 array!82427 (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 (_ BitVec 32) Int) ListLongMap!19037)

(assert (=> b!1264320 (= lt!573564 (getCurrentListMapNoExtraKeys!5897 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264320 (= lt!573558 (getCurrentListMapNoExtraKeys!5897 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264321 () Bool)

(declare-fun res!842012 () Bool)

(assert (=> b!1264321 (=> (not res!842012) (not e!719926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82429 (_ BitVec 32)) Bool)

(assert (=> b!1264321 (= res!842012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1264322 () Bool)

(assert (=> b!1264322 (= e!719922 tp_is_empty!32437)))

(declare-fun b!1264323 () Bool)

(assert (=> b!1264323 (= e!719923 true)))

(declare-fun lt!573561 () ListLongMap!19037)

(declare-fun lt!573560 () ListLongMap!19037)

(declare-fun -!2104 (ListLongMap!19037 (_ BitVec 64)) ListLongMap!19037)

(assert (=> b!1264323 (= lt!573561 (-!2104 lt!573560 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!573559 () ListLongMap!19037)

(declare-fun lt!573562 () ListLongMap!19037)

(assert (=> b!1264323 (= (-!2104 lt!573559 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573562)))

(declare-fun lt!573556 () Unit!41990)

(declare-fun addThenRemoveForNewKeyIsSame!357 (ListLongMap!19037 (_ BitVec 64) V!48615) Unit!41990)

(assert (=> b!1264323 (= lt!573556 (addThenRemoveForNewKeyIsSame!357 lt!573562 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!719925 () Bool)

(assert (=> b!1264323 e!719925))

(declare-fun res!842016 () Bool)

(assert (=> b!1264323 (=> (not res!842016) (not e!719925))))

(assert (=> b!1264323 (= res!842016 (= lt!573560 lt!573559))))

(declare-fun +!4301 (ListLongMap!19037 tuple2!21164) ListLongMap!19037)

(assert (=> b!1264323 (= lt!573559 (+!4301 lt!573562 (tuple2!21165 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!573565 () tuple2!21164)

(assert (=> b!1264323 (= lt!573562 (+!4301 lt!573558 lt!573565))))

(assert (=> b!1264323 (= lt!573565 (tuple2!21165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!573557 () ListLongMap!19037)

(declare-fun getCurrentListMap!4587 (array!82429 array!82427 (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 (_ BitVec 32) Int) ListLongMap!19037)

(assert (=> b!1264323 (= lt!573557 (getCurrentListMap!4587 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264323 (= lt!573560 (getCurrentListMap!4587 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264324 () Bool)

(assert (=> b!1264324 (= e!719924 tp_is_empty!32437)))

(declare-fun b!1264325 () Bool)

(declare-fun res!842014 () Bool)

(assert (=> b!1264325 (=> (not res!842014) (not e!719926))))

(declare-datatypes ((List!28356 0))(
  ( (Nil!28353) (Cons!28352 (h!29561 (_ BitVec 64)) (t!41868 List!28356)) )
))
(declare-fun arrayNoDuplicates!0 (array!82429 (_ BitVec 32) List!28356) Bool)

(assert (=> b!1264325 (= res!842014 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28353))))

(declare-fun b!1264326 () Bool)

(assert (=> b!1264326 (= e!719925 (= lt!573557 (+!4301 lt!573564 lt!573565)))))

(assert (= (and start!106194 res!842015) b!1264319))

(assert (= (and b!1264319 res!842013) b!1264321))

(assert (= (and b!1264321 res!842012) b!1264325))

(assert (= (and b!1264325 res!842014) b!1264320))

(assert (= (and b!1264320 (not res!842011)) b!1264323))

(assert (= (and b!1264323 res!842016) b!1264326))

(assert (= (and b!1264318 condMapEmpty!50491) mapIsEmpty!50491))

(assert (= (and b!1264318 (not condMapEmpty!50491)) mapNonEmpty!50491))

(get-info :version)

(assert (= (and mapNonEmpty!50491 ((_ is ValueCellFull!15455) mapValue!50491)) b!1264324))

(assert (= (and b!1264318 ((_ is ValueCellFull!15455) mapDefault!50491)) b!1264322))

(assert (= start!106194 b!1264318))

(declare-fun m!1164425 () Bool)

(assert (=> b!1264320 m!1164425))

(declare-fun m!1164427 () Bool)

(assert (=> b!1264320 m!1164427))

(declare-fun m!1164429 () Bool)

(assert (=> b!1264320 m!1164429))

(declare-fun m!1164431 () Bool)

(assert (=> start!106194 m!1164431))

(declare-fun m!1164433 () Bool)

(assert (=> start!106194 m!1164433))

(declare-fun m!1164435 () Bool)

(assert (=> start!106194 m!1164435))

(declare-fun m!1164437 () Bool)

(assert (=> b!1264326 m!1164437))

(declare-fun m!1164439 () Bool)

(assert (=> b!1264325 m!1164439))

(declare-fun m!1164441 () Bool)

(assert (=> b!1264323 m!1164441))

(declare-fun m!1164443 () Bool)

(assert (=> b!1264323 m!1164443))

(declare-fun m!1164445 () Bool)

(assert (=> b!1264323 m!1164445))

(declare-fun m!1164447 () Bool)

(assert (=> b!1264323 m!1164447))

(declare-fun m!1164449 () Bool)

(assert (=> b!1264323 m!1164449))

(declare-fun m!1164451 () Bool)

(assert (=> b!1264323 m!1164451))

(declare-fun m!1164453 () Bool)

(assert (=> b!1264323 m!1164453))

(declare-fun m!1164455 () Bool)

(assert (=> b!1264321 m!1164455))

(declare-fun m!1164457 () Bool)

(assert (=> mapNonEmpty!50491 m!1164457))

(check-sat (not b!1264323) (not mapNonEmpty!50491) (not b_next!27535) (not b!1264326) (not start!106194) (not b!1264321) b_and!45549 tp_is_empty!32437 (not b!1264325) (not b!1264320))
(check-sat b_and!45549 (not b_next!27535))
