; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106056 () Bool)

(assert start!106056)

(declare-fun b_free!27489 () Bool)

(declare-fun b_next!27489 () Bool)

(assert (=> start!106056 (= b_free!27489 (not b_next!27489))))

(declare-fun tp!96016 () Bool)

(declare-fun b_and!45463 () Bool)

(assert (=> start!106056 (= tp!96016 b_and!45463)))

(declare-fun b!1262922 () Bool)

(declare-fun res!841298 () Bool)

(declare-fun e!718955 () Bool)

(assert (=> b!1262922 (=> (not res!841298) (not e!718955))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82402 0))(
  ( (array!82403 (arr!39748 (Array (_ BitVec 32) (_ BitVec 64))) (size!40284 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82402)

(declare-datatypes ((V!48553 0))(
  ( (V!48554 (val!16258 Int)) )
))
(declare-datatypes ((ValueCell!15432 0))(
  ( (ValueCellFull!15432 (v!18967 V!48553)) (EmptyCell!15432) )
))
(declare-datatypes ((array!82404 0))(
  ( (array!82405 (arr!39749 (Array (_ BitVec 32) ValueCell!15432)) (size!40285 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82404)

(assert (=> b!1262922 (= res!841298 (and (= (size!40285 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40284 _keys!1118) (size!40285 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262924 () Bool)

(declare-fun res!841297 () Bool)

(assert (=> b!1262924 (=> (not res!841297) (not e!718955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82402 (_ BitVec 32)) Bool)

(assert (=> b!1262924 (= res!841297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50407 () Bool)

(declare-fun mapRes!50407 () Bool)

(declare-fun tp!96017 () Bool)

(declare-fun e!718954 () Bool)

(assert (=> mapNonEmpty!50407 (= mapRes!50407 (and tp!96017 e!718954))))

(declare-fun mapRest!50407 () (Array (_ BitVec 32) ValueCell!15432))

(declare-fun mapValue!50407 () ValueCell!15432)

(declare-fun mapKey!50407 () (_ BitVec 32))

(assert (=> mapNonEmpty!50407 (= (arr!39749 _values!914) (store mapRest!50407 mapKey!50407 mapValue!50407))))

(declare-fun b!1262925 () Bool)

(declare-fun e!718952 () Bool)

(assert (=> b!1262925 (= e!718955 (not e!718952))))

(declare-fun res!841299 () Bool)

(assert (=> b!1262925 (=> res!841299 e!718952)))

(assert (=> b!1262925 (= res!841299 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21044 0))(
  ( (tuple2!21045 (_1!10533 (_ BitVec 64)) (_2!10533 V!48553)) )
))
(declare-datatypes ((List!28237 0))(
  ( (Nil!28234) (Cons!28233 (h!29442 tuple2!21044) (t!41748 List!28237)) )
))
(declare-datatypes ((ListLongMap!18917 0))(
  ( (ListLongMap!18918 (toList!9474 List!28237)) )
))
(declare-fun lt!572612 () ListLongMap!18917)

(declare-fun lt!572614 () ListLongMap!18917)

(assert (=> b!1262925 (= lt!572612 lt!572614)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48553)

(declare-fun zeroValue!871 () V!48553)

(declare-fun minValueBefore!43 () V!48553)

(declare-datatypes ((Unit!42097 0))(
  ( (Unit!42098) )
))
(declare-fun lt!572615 () Unit!42097)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1182 (array!82402 array!82404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48553 V!48553 V!48553 V!48553 (_ BitVec 32) Int) Unit!42097)

(assert (=> b!1262925 (= lt!572615 (lemmaNoChangeToArrayThenSameMapNoExtras!1182 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5840 (array!82402 array!82404 (_ BitVec 32) (_ BitVec 32) V!48553 V!48553 (_ BitVec 32) Int) ListLongMap!18917)

(assert (=> b!1262925 (= lt!572614 (getCurrentListMapNoExtraKeys!5840 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262925 (= lt!572612 (getCurrentListMapNoExtraKeys!5840 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262926 () Bool)

(declare-fun tp_is_empty!32391 () Bool)

(assert (=> b!1262926 (= e!718954 tp_is_empty!32391)))

(declare-fun b!1262927 () Bool)

(declare-fun lt!572613 () ListLongMap!18917)

(declare-fun lt!572616 () ListLongMap!18917)

(declare-fun -!2142 (ListLongMap!18917 (_ BitVec 64)) ListLongMap!18917)

(assert (=> b!1262927 (= e!718952 (= (-!2142 lt!572613 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572616))))

(declare-fun lt!572617 () ListLongMap!18917)

(assert (=> b!1262927 (= (-!2142 lt!572617 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572612)))

(declare-fun lt!572611 () Unit!42097)

(declare-fun addThenRemoveForNewKeyIsSame!377 (ListLongMap!18917 (_ BitVec 64) V!48553) Unit!42097)

(assert (=> b!1262927 (= lt!572611 (addThenRemoveForNewKeyIsSame!377 lt!572612 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1262927 (and (= lt!572613 lt!572617) (= lt!572616 lt!572614))))

(declare-fun +!4248 (ListLongMap!18917 tuple2!21044) ListLongMap!18917)

(assert (=> b!1262927 (= lt!572617 (+!4248 lt!572612 (tuple2!21045 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4641 (array!82402 array!82404 (_ BitVec 32) (_ BitVec 32) V!48553 V!48553 (_ BitVec 32) Int) ListLongMap!18917)

(assert (=> b!1262927 (= lt!572616 (getCurrentListMap!4641 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262927 (= lt!572613 (getCurrentListMap!4641 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262928 () Bool)

(declare-fun e!718951 () Bool)

(assert (=> b!1262928 (= e!718951 tp_is_empty!32391)))

(declare-fun res!841300 () Bool)

(assert (=> start!106056 (=> (not res!841300) (not e!718955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106056 (= res!841300 (validMask!0 mask!1466))))

(assert (=> start!106056 e!718955))

(assert (=> start!106056 true))

(assert (=> start!106056 tp!96016))

(assert (=> start!106056 tp_is_empty!32391))

(declare-fun array_inv!30251 (array!82402) Bool)

(assert (=> start!106056 (array_inv!30251 _keys!1118)))

(declare-fun e!718953 () Bool)

(declare-fun array_inv!30252 (array!82404) Bool)

(assert (=> start!106056 (and (array_inv!30252 _values!914) e!718953)))

(declare-fun b!1262923 () Bool)

(declare-fun res!841296 () Bool)

(assert (=> b!1262923 (=> (not res!841296) (not e!718955))))

(declare-datatypes ((List!28238 0))(
  ( (Nil!28235) (Cons!28234 (h!29443 (_ BitVec 64)) (t!41749 List!28238)) )
))
(declare-fun arrayNoDuplicates!0 (array!82402 (_ BitVec 32) List!28238) Bool)

(assert (=> b!1262923 (= res!841296 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28235))))

(declare-fun mapIsEmpty!50407 () Bool)

(assert (=> mapIsEmpty!50407 mapRes!50407))

(declare-fun b!1262929 () Bool)

(assert (=> b!1262929 (= e!718953 (and e!718951 mapRes!50407))))

(declare-fun condMapEmpty!50407 () Bool)

(declare-fun mapDefault!50407 () ValueCell!15432)

(assert (=> b!1262929 (= condMapEmpty!50407 (= (arr!39749 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15432)) mapDefault!50407)))))

(assert (= (and start!106056 res!841300) b!1262922))

(assert (= (and b!1262922 res!841298) b!1262924))

(assert (= (and b!1262924 res!841297) b!1262923))

(assert (= (and b!1262923 res!841296) b!1262925))

(assert (= (and b!1262925 (not res!841299)) b!1262927))

(assert (= (and b!1262929 condMapEmpty!50407) mapIsEmpty!50407))

(assert (= (and b!1262929 (not condMapEmpty!50407)) mapNonEmpty!50407))

(get-info :version)

(assert (= (and mapNonEmpty!50407 ((_ is ValueCellFull!15432) mapValue!50407)) b!1262926))

(assert (= (and b!1262929 ((_ is ValueCellFull!15432) mapDefault!50407)) b!1262928))

(assert (= start!106056 b!1262929))

(declare-fun m!1163421 () Bool)

(assert (=> b!1262927 m!1163421))

(declare-fun m!1163423 () Bool)

(assert (=> b!1262927 m!1163423))

(declare-fun m!1163425 () Bool)

(assert (=> b!1262927 m!1163425))

(declare-fun m!1163427 () Bool)

(assert (=> b!1262927 m!1163427))

(declare-fun m!1163429 () Bool)

(assert (=> b!1262927 m!1163429))

(declare-fun m!1163431 () Bool)

(assert (=> b!1262927 m!1163431))

(declare-fun m!1163433 () Bool)

(assert (=> b!1262925 m!1163433))

(declare-fun m!1163435 () Bool)

(assert (=> b!1262925 m!1163435))

(declare-fun m!1163437 () Bool)

(assert (=> b!1262925 m!1163437))

(declare-fun m!1163439 () Bool)

(assert (=> mapNonEmpty!50407 m!1163439))

(declare-fun m!1163441 () Bool)

(assert (=> start!106056 m!1163441))

(declare-fun m!1163443 () Bool)

(assert (=> start!106056 m!1163443))

(declare-fun m!1163445 () Bool)

(assert (=> start!106056 m!1163445))

(declare-fun m!1163447 () Bool)

(assert (=> b!1262923 m!1163447))

(declare-fun m!1163449 () Bool)

(assert (=> b!1262924 m!1163449))

(check-sat (not b!1262923) (not mapNonEmpty!50407) (not b_next!27489) (not b!1262925) (not start!106056) (not b!1262927) tp_is_empty!32391 b_and!45463 (not b!1262924))
(check-sat b_and!45463 (not b_next!27489))
