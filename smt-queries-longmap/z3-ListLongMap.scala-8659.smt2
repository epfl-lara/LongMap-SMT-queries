; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105296 () Bool)

(assert start!105296)

(declare-fun b_free!26991 () Bool)

(declare-fun b_next!26991 () Bool)

(assert (=> start!105296 (= b_free!26991 (not b_next!26991))))

(declare-fun tp!94480 () Bool)

(declare-fun b_and!44817 () Bool)

(assert (=> start!105296 (= tp!94480 b_and!44817)))

(declare-fun mapIsEmpty!49618 () Bool)

(declare-fun mapRes!49618 () Bool)

(assert (=> mapIsEmpty!49618 mapRes!49618))

(declare-fun b!1254706 () Bool)

(declare-fun e!713009 () Bool)

(declare-fun e!713008 () Bool)

(assert (=> b!1254706 (= e!713009 (not e!713008))))

(declare-fun res!836588 () Bool)

(assert (=> b!1254706 (=> res!836588 e!713008)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254706 (= res!836588 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47889 0))(
  ( (V!47890 (val!16009 Int)) )
))
(declare-datatypes ((tuple2!20676 0))(
  ( (tuple2!20677 (_1!10349 (_ BitVec 64)) (_2!10349 V!47889)) )
))
(declare-datatypes ((List!27901 0))(
  ( (Nil!27898) (Cons!27897 (h!29106 tuple2!20676) (t!41384 List!27901)) )
))
(declare-datatypes ((ListLongMap!18549 0))(
  ( (ListLongMap!18550 (toList!9290 List!27901)) )
))
(declare-fun lt!567186 () ListLongMap!18549)

(declare-fun lt!567183 () ListLongMap!18549)

(assert (=> b!1254706 (= lt!567186 lt!567183)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47889)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47889)

(declare-datatypes ((array!81440 0))(
  ( (array!81441 (arr!39281 (Array (_ BitVec 32) (_ BitVec 64))) (size!39817 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81440)

(declare-datatypes ((ValueCell!15183 0))(
  ( (ValueCellFull!15183 (v!18708 V!47889)) (EmptyCell!15183) )
))
(declare-datatypes ((array!81442 0))(
  ( (array!81443 (arr!39282 (Array (_ BitVec 32) ValueCell!15183)) (size!39818 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81442)

(declare-datatypes ((Unit!41764 0))(
  ( (Unit!41765) )
))
(declare-fun lt!567184 () Unit!41764)

(declare-fun minValueBefore!43 () V!47889)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1040 (array!81440 array!81442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47889 V!47889 V!47889 V!47889 (_ BitVec 32) Int) Unit!41764)

(assert (=> b!1254706 (= lt!567184 (lemmaNoChangeToArrayThenSameMapNoExtras!1040 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5676 (array!81440 array!81442 (_ BitVec 32) (_ BitVec 32) V!47889 V!47889 (_ BitVec 32) Int) ListLongMap!18549)

(assert (=> b!1254706 (= lt!567183 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254706 (= lt!567186 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254707 () Bool)

(declare-fun res!836592 () Bool)

(assert (=> b!1254707 (=> (not res!836592) (not e!713009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81440 (_ BitVec 32)) Bool)

(assert (=> b!1254707 (= res!836592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254708 () Bool)

(declare-fun res!836591 () Bool)

(assert (=> b!1254708 (=> (not res!836591) (not e!713009))))

(assert (=> b!1254708 (= res!836591 (and (= (size!39818 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39817 _keys!1118) (size!39818 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254709 () Bool)

(declare-fun e!713012 () Bool)

(declare-fun tp_is_empty!31893 () Bool)

(assert (=> b!1254709 (= e!713012 tp_is_empty!31893)))

(declare-fun b!1254710 () Bool)

(declare-fun e!713010 () Bool)

(assert (=> b!1254710 (= e!713008 e!713010)))

(declare-fun res!836587 () Bool)

(assert (=> b!1254710 (=> res!836587 e!713010)))

(declare-fun lt!567180 () ListLongMap!18549)

(declare-fun lt!567185 () ListLongMap!18549)

(declare-fun -!2061 (ListLongMap!18549 (_ BitVec 64)) ListLongMap!18549)

(assert (=> b!1254710 (= res!836587 (not (= (-!2061 lt!567180 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567185)))))

(declare-fun lt!567182 () ListLongMap!18549)

(assert (=> b!1254710 (= (-!2061 lt!567182 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567186)))

(declare-fun lt!567181 () Unit!41764)

(declare-fun addThenRemoveForNewKeyIsSame!331 (ListLongMap!18549 (_ BitVec 64) V!47889) Unit!41764)

(assert (=> b!1254710 (= lt!567181 (addThenRemoveForNewKeyIsSame!331 lt!567186 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1254710 (and (= lt!567180 lt!567182) (= lt!567185 lt!567183))))

(declare-fun +!4184 (ListLongMap!18549 tuple2!20676) ListLongMap!18549)

(assert (=> b!1254710 (= lt!567182 (+!4184 lt!567186 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4532 (array!81440 array!81442 (_ BitVec 32) (_ BitVec 32) V!47889 V!47889 (_ BitVec 32) Int) ListLongMap!18549)

(assert (=> b!1254710 (= lt!567185 (getCurrentListMap!4532 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254710 (= lt!567180 (getCurrentListMap!4532 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254711 () Bool)

(declare-fun e!713011 () Bool)

(assert (=> b!1254711 (= e!713011 tp_is_empty!31893)))

(declare-fun b!1254712 () Bool)

(declare-fun res!836589 () Bool)

(assert (=> b!1254712 (=> (not res!836589) (not e!713009))))

(declare-datatypes ((List!27902 0))(
  ( (Nil!27899) (Cons!27898 (h!29107 (_ BitVec 64)) (t!41385 List!27902)) )
))
(declare-fun arrayNoDuplicates!0 (array!81440 (_ BitVec 32) List!27902) Bool)

(assert (=> b!1254712 (= res!836589 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27899))))

(declare-fun mapNonEmpty!49618 () Bool)

(declare-fun tp!94481 () Bool)

(assert (=> mapNonEmpty!49618 (= mapRes!49618 (and tp!94481 e!713011))))

(declare-fun mapRest!49618 () (Array (_ BitVec 32) ValueCell!15183))

(declare-fun mapKey!49618 () (_ BitVec 32))

(declare-fun mapValue!49618 () ValueCell!15183)

(assert (=> mapNonEmpty!49618 (= (arr!39282 _values!914) (store mapRest!49618 mapKey!49618 mapValue!49618))))

(declare-fun res!836590 () Bool)

(assert (=> start!105296 (=> (not res!836590) (not e!713009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105296 (= res!836590 (validMask!0 mask!1466))))

(assert (=> start!105296 e!713009))

(assert (=> start!105296 true))

(assert (=> start!105296 tp!94480))

(assert (=> start!105296 tp_is_empty!31893))

(declare-fun array_inv!29943 (array!81440) Bool)

(assert (=> start!105296 (array_inv!29943 _keys!1118)))

(declare-fun e!713006 () Bool)

(declare-fun array_inv!29944 (array!81442) Bool)

(assert (=> start!105296 (and (array_inv!29944 _values!914) e!713006)))

(declare-fun b!1254713 () Bool)

(assert (=> b!1254713 (= e!713010 (bvsle #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254714 () Bool)

(assert (=> b!1254714 (= e!713006 (and e!713012 mapRes!49618))))

(declare-fun condMapEmpty!49618 () Bool)

(declare-fun mapDefault!49618 () ValueCell!15183)

(assert (=> b!1254714 (= condMapEmpty!49618 (= (arr!39282 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15183)) mapDefault!49618)))))

(assert (= (and start!105296 res!836590) b!1254708))

(assert (= (and b!1254708 res!836591) b!1254707))

(assert (= (and b!1254707 res!836592) b!1254712))

(assert (= (and b!1254712 res!836589) b!1254706))

(assert (= (and b!1254706 (not res!836588)) b!1254710))

(assert (= (and b!1254710 (not res!836587)) b!1254713))

(assert (= (and b!1254714 condMapEmpty!49618) mapIsEmpty!49618))

(assert (= (and b!1254714 (not condMapEmpty!49618)) mapNonEmpty!49618))

(get-info :version)

(assert (= (and mapNonEmpty!49618 ((_ is ValueCellFull!15183) mapValue!49618)) b!1254711))

(assert (= (and b!1254714 ((_ is ValueCellFull!15183) mapDefault!49618)) b!1254709))

(assert (= start!105296 b!1254714))

(declare-fun m!1155499 () Bool)

(assert (=> start!105296 m!1155499))

(declare-fun m!1155501 () Bool)

(assert (=> start!105296 m!1155501))

(declare-fun m!1155503 () Bool)

(assert (=> start!105296 m!1155503))

(declare-fun m!1155505 () Bool)

(assert (=> b!1254706 m!1155505))

(declare-fun m!1155507 () Bool)

(assert (=> b!1254706 m!1155507))

(declare-fun m!1155509 () Bool)

(assert (=> b!1254706 m!1155509))

(declare-fun m!1155511 () Bool)

(assert (=> b!1254710 m!1155511))

(declare-fun m!1155513 () Bool)

(assert (=> b!1254710 m!1155513))

(declare-fun m!1155515 () Bool)

(assert (=> b!1254710 m!1155515))

(declare-fun m!1155517 () Bool)

(assert (=> b!1254710 m!1155517))

(declare-fun m!1155519 () Bool)

(assert (=> b!1254710 m!1155519))

(declare-fun m!1155521 () Bool)

(assert (=> b!1254710 m!1155521))

(declare-fun m!1155523 () Bool)

(assert (=> mapNonEmpty!49618 m!1155523))

(declare-fun m!1155525 () Bool)

(assert (=> b!1254707 m!1155525))

(declare-fun m!1155527 () Bool)

(assert (=> b!1254712 m!1155527))

(check-sat (not b!1254706) b_and!44817 (not b!1254712) (not b_next!26991) (not mapNonEmpty!49618) tp_is_empty!31893 (not b!1254710) (not start!105296) (not b!1254707))
(check-sat b_and!44817 (not b_next!26991))
(get-model)

(declare-fun bm!61729 () Bool)

(declare-fun call!61732 () Bool)

(declare-fun c!122343 () Bool)

(assert (=> bm!61729 (= call!61732 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122343 (Cons!27898 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000) Nil!27899) Nil!27899)))))

(declare-fun b!1254752 () Bool)

(declare-fun e!713043 () Bool)

(declare-fun e!713044 () Bool)

(assert (=> b!1254752 (= e!713043 e!713044)))

(declare-fun res!836618 () Bool)

(assert (=> b!1254752 (=> (not res!836618) (not e!713044))))

(declare-fun e!713042 () Bool)

(assert (=> b!1254752 (= res!836618 (not e!713042))))

(declare-fun res!836619 () Bool)

(assert (=> b!1254752 (=> (not res!836619) (not e!713042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1254752 (= res!836619 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254753 () Bool)

(declare-fun e!713045 () Bool)

(assert (=> b!1254753 (= e!713044 e!713045)))

(assert (=> b!1254753 (= c!122343 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254754 () Bool)

(declare-fun contains!7523 (List!27902 (_ BitVec 64)) Bool)

(assert (=> b!1254754 (= e!713042 (contains!7523 Nil!27899 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138103 () Bool)

(declare-fun res!836617 () Bool)

(assert (=> d!138103 (=> res!836617 e!713043)))

(assert (=> d!138103 (= res!836617 (bvsge #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> d!138103 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27899) e!713043)))

(declare-fun b!1254755 () Bool)

(assert (=> b!1254755 (= e!713045 call!61732)))

(declare-fun b!1254756 () Bool)

(assert (=> b!1254756 (= e!713045 call!61732)))

(assert (= (and d!138103 (not res!836617)) b!1254752))

(assert (= (and b!1254752 res!836619) b!1254754))

(assert (= (and b!1254752 res!836618) b!1254753))

(assert (= (and b!1254753 c!122343) b!1254755))

(assert (= (and b!1254753 (not c!122343)) b!1254756))

(assert (= (or b!1254755 b!1254756) bm!61729))

(declare-fun m!1155559 () Bool)

(assert (=> bm!61729 m!1155559))

(declare-fun m!1155561 () Bool)

(assert (=> bm!61729 m!1155561))

(assert (=> b!1254752 m!1155559))

(assert (=> b!1254752 m!1155559))

(declare-fun m!1155563 () Bool)

(assert (=> b!1254752 m!1155563))

(assert (=> b!1254753 m!1155559))

(assert (=> b!1254753 m!1155559))

(assert (=> b!1254753 m!1155563))

(assert (=> b!1254754 m!1155559))

(assert (=> b!1254754 m!1155559))

(declare-fun m!1155565 () Bool)

(assert (=> b!1254754 m!1155565))

(assert (=> b!1254712 d!138103))

(declare-fun b!1254765 () Bool)

(declare-fun e!713053 () Bool)

(declare-fun call!61735 () Bool)

(assert (=> b!1254765 (= e!713053 call!61735)))

(declare-fun b!1254766 () Bool)

(declare-fun e!713054 () Bool)

(declare-fun e!713052 () Bool)

(assert (=> b!1254766 (= e!713054 e!713052)))

(declare-fun c!122346 () Bool)

(assert (=> b!1254766 (= c!122346 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254767 () Bool)

(assert (=> b!1254767 (= e!713052 e!713053)))

(declare-fun lt!567216 () (_ BitVec 64))

(assert (=> b!1254767 (= lt!567216 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567215 () Unit!41764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81440 (_ BitVec 64) (_ BitVec 32)) Unit!41764)

(assert (=> b!1254767 (= lt!567215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567216 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1254767 (arrayContainsKey!0 _keys!1118 lt!567216 #b00000000000000000000000000000000)))

(declare-fun lt!567214 () Unit!41764)

(assert (=> b!1254767 (= lt!567214 lt!567215)))

(declare-fun res!836624 () Bool)

(declare-datatypes ((SeekEntryResult!9964 0))(
  ( (MissingZero!9964 (index!42227 (_ BitVec 32))) (Found!9964 (index!42228 (_ BitVec 32))) (Intermediate!9964 (undefined!10776 Bool) (index!42229 (_ BitVec 32)) (x!110457 (_ BitVec 32))) (Undefined!9964) (MissingVacant!9964 (index!42230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81440 (_ BitVec 32)) SeekEntryResult!9964)

(assert (=> b!1254767 (= res!836624 (= (seekEntryOrOpen!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9964 #b00000000000000000000000000000000)))))

(assert (=> b!1254767 (=> (not res!836624) (not e!713053))))

(declare-fun bm!61732 () Bool)

(assert (=> bm!61732 (= call!61735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138105 () Bool)

(declare-fun res!836625 () Bool)

(assert (=> d!138105 (=> res!836625 e!713054)))

(assert (=> d!138105 (= res!836625 (bvsge #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> d!138105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!713054)))

(declare-fun b!1254768 () Bool)

(assert (=> b!1254768 (= e!713052 call!61735)))

(assert (= (and d!138105 (not res!836625)) b!1254766))

(assert (= (and b!1254766 c!122346) b!1254767))

(assert (= (and b!1254766 (not c!122346)) b!1254768))

(assert (= (and b!1254767 res!836624) b!1254765))

(assert (= (or b!1254765 b!1254768) bm!61732))

(assert (=> b!1254766 m!1155559))

(assert (=> b!1254766 m!1155559))

(assert (=> b!1254766 m!1155563))

(assert (=> b!1254767 m!1155559))

(declare-fun m!1155567 () Bool)

(assert (=> b!1254767 m!1155567))

(declare-fun m!1155569 () Bool)

(assert (=> b!1254767 m!1155569))

(assert (=> b!1254767 m!1155559))

(declare-fun m!1155571 () Bool)

(assert (=> b!1254767 m!1155571))

(declare-fun m!1155573 () Bool)

(assert (=> bm!61732 m!1155573))

(assert (=> b!1254707 d!138105))

(declare-fun d!138107 () Bool)

(assert (=> d!138107 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105296 d!138107))

(declare-fun d!138109 () Bool)

(assert (=> d!138109 (= (array_inv!29943 _keys!1118) (bvsge (size!39817 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105296 d!138109))

(declare-fun d!138111 () Bool)

(assert (=> d!138111 (= (array_inv!29944 _values!914) (bvsge (size!39818 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105296 d!138111))

(declare-fun d!138113 () Bool)

(declare-fun e!713057 () Bool)

(assert (=> d!138113 e!713057))

(declare-fun res!836630 () Bool)

(assert (=> d!138113 (=> (not res!836630) (not e!713057))))

(declare-fun lt!567227 () ListLongMap!18549)

(declare-fun contains!7524 (ListLongMap!18549 (_ BitVec 64)) Bool)

(assert (=> d!138113 (= res!836630 (contains!7524 lt!567227 (_1!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!567226 () List!27901)

(assert (=> d!138113 (= lt!567227 (ListLongMap!18550 lt!567226))))

(declare-fun lt!567225 () Unit!41764)

(declare-fun lt!567228 () Unit!41764)

(assert (=> d!138113 (= lt!567225 lt!567228)))

(declare-datatypes ((Option!706 0))(
  ( (Some!705 (v!18710 V!47889)) (None!704) )
))
(declare-fun getValueByKey!655 (List!27901 (_ BitVec 64)) Option!706)

(assert (=> d!138113 (= (getValueByKey!655 lt!567226 (_1!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!705 (_2!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!330 (List!27901 (_ BitVec 64) V!47889) Unit!41764)

(assert (=> d!138113 (= lt!567228 (lemmaContainsTupThenGetReturnValue!330 lt!567226 (_1!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!444 (List!27901 (_ BitVec 64) V!47889) List!27901)

(assert (=> d!138113 (= lt!567226 (insertStrictlySorted!444 (toList!9290 lt!567186) (_1!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138113 (= (+!4184 lt!567186 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!567227)))

(declare-fun b!1254773 () Bool)

(declare-fun res!836631 () Bool)

(assert (=> b!1254773 (=> (not res!836631) (not e!713057))))

(assert (=> b!1254773 (= res!836631 (= (getValueByKey!655 (toList!9290 lt!567227) (_1!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!705 (_2!10349 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1254774 () Bool)

(declare-fun contains!7525 (List!27901 tuple2!20676) Bool)

(assert (=> b!1254774 (= e!713057 (contains!7525 (toList!9290 lt!567227) (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138113 res!836630) b!1254773))

(assert (= (and b!1254773 res!836631) b!1254774))

(declare-fun m!1155575 () Bool)

(assert (=> d!138113 m!1155575))

(declare-fun m!1155577 () Bool)

(assert (=> d!138113 m!1155577))

(declare-fun m!1155579 () Bool)

(assert (=> d!138113 m!1155579))

(declare-fun m!1155581 () Bool)

(assert (=> d!138113 m!1155581))

(declare-fun m!1155583 () Bool)

(assert (=> b!1254773 m!1155583))

(declare-fun m!1155585 () Bool)

(assert (=> b!1254774 m!1155585))

(assert (=> b!1254710 d!138113))

(declare-fun b!1254817 () Bool)

(declare-fun e!713091 () Bool)

(declare-fun e!713090 () Bool)

(assert (=> b!1254817 (= e!713091 e!713090)))

(declare-fun res!836651 () Bool)

(declare-fun call!61756 () Bool)

(assert (=> b!1254817 (= res!836651 call!61756)))

(assert (=> b!1254817 (=> (not res!836651) (not e!713090))))

(declare-fun bm!61747 () Bool)

(declare-fun call!61755 () ListLongMap!18549)

(declare-fun call!61752 () ListLongMap!18549)

(declare-fun call!61754 () ListLongMap!18549)

(declare-fun c!122360 () Bool)

(declare-fun call!61751 () ListLongMap!18549)

(declare-fun c!122359 () Bool)

(assert (=> bm!61747 (= call!61751 (+!4184 (ite c!122360 call!61752 (ite c!122359 call!61754 call!61755)) (ite (or c!122360 c!122359) (tuple2!20677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1254818 () Bool)

(declare-fun e!713092 () ListLongMap!18549)

(assert (=> b!1254818 (= e!713092 (+!4184 call!61751 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!61748 () Bool)

(assert (=> bm!61748 (= call!61752 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254820 () Bool)

(declare-fun e!713095 () Bool)

(declare-fun e!713084 () Bool)

(assert (=> b!1254820 (= e!713095 e!713084)))

(declare-fun c!122361 () Bool)

(assert (=> b!1254820 (= c!122361 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254821 () Bool)

(declare-fun res!836657 () Bool)

(assert (=> b!1254821 (=> (not res!836657) (not e!713095))))

(assert (=> b!1254821 (= res!836657 e!713091)))

(declare-fun c!122363 () Bool)

(assert (=> b!1254821 (= c!122363 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61749 () Bool)

(declare-fun lt!567281 () ListLongMap!18549)

(assert (=> bm!61749 (= call!61756 (contains!7524 lt!567281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254822 () Bool)

(declare-fun e!713094 () ListLongMap!18549)

(assert (=> b!1254822 (= e!713094 call!61755)))

(declare-fun bm!61750 () Bool)

(declare-fun call!61750 () ListLongMap!18549)

(assert (=> bm!61750 (= call!61750 call!61751)))

(declare-fun b!1254823 () Bool)

(assert (=> b!1254823 (= e!713094 call!61750)))

(declare-fun b!1254824 () Bool)

(assert (=> b!1254824 (= e!713091 (not call!61756))))

(declare-fun b!1254825 () Bool)

(declare-fun c!122362 () Bool)

(assert (=> b!1254825 (= c!122362 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!713093 () ListLongMap!18549)

(assert (=> b!1254825 (= e!713093 e!713094)))

(declare-fun b!1254826 () Bool)

(declare-fun res!836654 () Bool)

(assert (=> b!1254826 (=> (not res!836654) (not e!713095))))

(declare-fun e!713088 () Bool)

(assert (=> b!1254826 (= res!836654 e!713088)))

(declare-fun res!836656 () Bool)

(assert (=> b!1254826 (=> res!836656 e!713088)))

(declare-fun e!713096 () Bool)

(assert (=> b!1254826 (= res!836656 (not e!713096))))

(declare-fun res!836652 () Bool)

(assert (=> b!1254826 (=> (not res!836652) (not e!713096))))

(assert (=> b!1254826 (= res!836652 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254827 () Bool)

(declare-fun call!61753 () Bool)

(assert (=> b!1254827 (= e!713084 (not call!61753))))

(declare-fun bm!61751 () Bool)

(assert (=> bm!61751 (= call!61753 (contains!7524 lt!567281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254828 () Bool)

(declare-fun e!713085 () Bool)

(assert (=> b!1254828 (= e!713085 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61752 () Bool)

(assert (=> bm!61752 (= call!61754 call!61752)))

(declare-fun bm!61753 () Bool)

(assert (=> bm!61753 (= call!61755 call!61754)))

(declare-fun b!1254819 () Bool)

(declare-fun e!713086 () Unit!41764)

(declare-fun lt!567279 () Unit!41764)

(assert (=> b!1254819 (= e!713086 lt!567279)))

(declare-fun lt!567282 () ListLongMap!18549)

(assert (=> b!1254819 (= lt!567282 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567276 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567276 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567283 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567283 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567294 () Unit!41764)

(declare-fun addStillContains!1079 (ListLongMap!18549 (_ BitVec 64) V!47889 (_ BitVec 64)) Unit!41764)

(assert (=> b!1254819 (= lt!567294 (addStillContains!1079 lt!567282 lt!567276 zeroValue!871 lt!567283))))

(assert (=> b!1254819 (contains!7524 (+!4184 lt!567282 (tuple2!20677 lt!567276 zeroValue!871)) lt!567283)))

(declare-fun lt!567287 () Unit!41764)

(assert (=> b!1254819 (= lt!567287 lt!567294)))

(declare-fun lt!567277 () ListLongMap!18549)

(assert (=> b!1254819 (= lt!567277 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567292 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567292 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567274 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567274 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567293 () Unit!41764)

(declare-fun addApplyDifferent!533 (ListLongMap!18549 (_ BitVec 64) V!47889 (_ BitVec 64)) Unit!41764)

(assert (=> b!1254819 (= lt!567293 (addApplyDifferent!533 lt!567277 lt!567292 minValueAfter!43 lt!567274))))

(declare-fun apply!986 (ListLongMap!18549 (_ BitVec 64)) V!47889)

(assert (=> b!1254819 (= (apply!986 (+!4184 lt!567277 (tuple2!20677 lt!567292 minValueAfter!43)) lt!567274) (apply!986 lt!567277 lt!567274))))

(declare-fun lt!567278 () Unit!41764)

(assert (=> b!1254819 (= lt!567278 lt!567293)))

(declare-fun lt!567288 () ListLongMap!18549)

(assert (=> b!1254819 (= lt!567288 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567286 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567290 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567290 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567291 () Unit!41764)

(assert (=> b!1254819 (= lt!567291 (addApplyDifferent!533 lt!567288 lt!567286 zeroValue!871 lt!567290))))

(assert (=> b!1254819 (= (apply!986 (+!4184 lt!567288 (tuple2!20677 lt!567286 zeroValue!871)) lt!567290) (apply!986 lt!567288 lt!567290))))

(declare-fun lt!567275 () Unit!41764)

(assert (=> b!1254819 (= lt!567275 lt!567291)))

(declare-fun lt!567285 () ListLongMap!18549)

(assert (=> b!1254819 (= lt!567285 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567273 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567289 () (_ BitVec 64))

(assert (=> b!1254819 (= lt!567289 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254819 (= lt!567279 (addApplyDifferent!533 lt!567285 lt!567273 minValueAfter!43 lt!567289))))

(assert (=> b!1254819 (= (apply!986 (+!4184 lt!567285 (tuple2!20677 lt!567273 minValueAfter!43)) lt!567289) (apply!986 lt!567285 lt!567289))))

(declare-fun d!138115 () Bool)

(assert (=> d!138115 e!713095))

(declare-fun res!836650 () Bool)

(assert (=> d!138115 (=> (not res!836650) (not e!713095))))

(assert (=> d!138115 (= res!836650 (or (bvsge #b00000000000000000000000000000000 (size!39817 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))))

(declare-fun lt!567284 () ListLongMap!18549)

(assert (=> d!138115 (= lt!567281 lt!567284)))

(declare-fun lt!567280 () Unit!41764)

(assert (=> d!138115 (= lt!567280 e!713086)))

(declare-fun c!122364 () Bool)

(assert (=> d!138115 (= c!122364 e!713085)))

(declare-fun res!836653 () Bool)

(assert (=> d!138115 (=> (not res!836653) (not e!713085))))

(assert (=> d!138115 (= res!836653 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> d!138115 (= lt!567284 e!713092)))

(assert (=> d!138115 (= c!122360 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138115 (validMask!0 mask!1466)))

(assert (=> d!138115 (= (getCurrentListMap!4532 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567281)))

(declare-fun b!1254829 () Bool)

(declare-fun e!713087 () Bool)

(assert (=> b!1254829 (= e!713087 (= (apply!986 lt!567281 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1254830 () Bool)

(assert (=> b!1254830 (= e!713084 e!713087)))

(declare-fun res!836655 () Bool)

(assert (=> b!1254830 (= res!836655 call!61753)))

(assert (=> b!1254830 (=> (not res!836655) (not e!713087))))

(declare-fun b!1254831 () Bool)

(assert (=> b!1254831 (= e!713093 call!61750)))

(declare-fun b!1254832 () Bool)

(declare-fun e!713089 () Bool)

(assert (=> b!1254832 (= e!713088 e!713089)))

(declare-fun res!836658 () Bool)

(assert (=> b!1254832 (=> (not res!836658) (not e!713089))))

(assert (=> b!1254832 (= res!836658 (contains!7524 lt!567281 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254833 () Bool)

(assert (=> b!1254833 (= e!713096 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254834 () Bool)

(assert (=> b!1254834 (= e!713090 (= (apply!986 lt!567281 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1254835 () Bool)

(declare-fun get!20101 (ValueCell!15183 V!47889) V!47889)

(declare-fun dynLambda!3384 (Int (_ BitVec 64)) V!47889)

(assert (=> b!1254835 (= e!713089 (= (apply!986 lt!567281 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)) (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1254835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39818 _values!914)))))

(assert (=> b!1254835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254836 () Bool)

(declare-fun Unit!41768 () Unit!41764)

(assert (=> b!1254836 (= e!713086 Unit!41768)))

(declare-fun b!1254837 () Bool)

(assert (=> b!1254837 (= e!713092 e!713093)))

(assert (=> b!1254837 (= c!122359 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138115 c!122360) b!1254818))

(assert (= (and d!138115 (not c!122360)) b!1254837))

(assert (= (and b!1254837 c!122359) b!1254831))

(assert (= (and b!1254837 (not c!122359)) b!1254825))

(assert (= (and b!1254825 c!122362) b!1254823))

(assert (= (and b!1254825 (not c!122362)) b!1254822))

(assert (= (or b!1254823 b!1254822) bm!61753))

(assert (= (or b!1254831 bm!61753) bm!61752))

(assert (= (or b!1254831 b!1254823) bm!61750))

(assert (= (or b!1254818 bm!61752) bm!61748))

(assert (= (or b!1254818 bm!61750) bm!61747))

(assert (= (and d!138115 res!836653) b!1254828))

(assert (= (and d!138115 c!122364) b!1254819))

(assert (= (and d!138115 (not c!122364)) b!1254836))

(assert (= (and d!138115 res!836650) b!1254826))

(assert (= (and b!1254826 res!836652) b!1254833))

(assert (= (and b!1254826 (not res!836656)) b!1254832))

(assert (= (and b!1254832 res!836658) b!1254835))

(assert (= (and b!1254826 res!836654) b!1254821))

(assert (= (and b!1254821 c!122363) b!1254817))

(assert (= (and b!1254821 (not c!122363)) b!1254824))

(assert (= (and b!1254817 res!836651) b!1254834))

(assert (= (or b!1254817 b!1254824) bm!61749))

(assert (= (and b!1254821 res!836657) b!1254820))

(assert (= (and b!1254820 c!122361) b!1254830))

(assert (= (and b!1254820 (not c!122361)) b!1254827))

(assert (= (and b!1254830 res!836655) b!1254829))

(assert (= (or b!1254830 b!1254827) bm!61751))

(declare-fun b_lambda!22627 () Bool)

(assert (=> (not b_lambda!22627) (not b!1254835)))

(declare-fun t!41388 () Bool)

(declare-fun tb!11299 () Bool)

(assert (=> (and start!105296 (= defaultEntry!922 defaultEntry!922) t!41388) tb!11299))

(declare-fun result!23305 () Bool)

(assert (=> tb!11299 (= result!23305 tp_is_empty!31893)))

(assert (=> b!1254835 t!41388))

(declare-fun b_and!44821 () Bool)

(assert (= b_and!44817 (and (=> t!41388 result!23305) b_and!44821)))

(declare-fun m!1155587 () Bool)

(assert (=> b!1254818 m!1155587))

(assert (=> bm!61748 m!1155507))

(assert (=> b!1254832 m!1155559))

(assert (=> b!1254832 m!1155559))

(declare-fun m!1155589 () Bool)

(assert (=> b!1254832 m!1155589))

(declare-fun m!1155591 () Bool)

(assert (=> b!1254829 m!1155591))

(assert (=> b!1254833 m!1155559))

(assert (=> b!1254833 m!1155559))

(assert (=> b!1254833 m!1155563))

(assert (=> b!1254828 m!1155559))

(assert (=> b!1254828 m!1155559))

(assert (=> b!1254828 m!1155563))

(declare-fun m!1155593 () Bool)

(assert (=> bm!61747 m!1155593))

(declare-fun m!1155595 () Bool)

(assert (=> bm!61749 m!1155595))

(assert (=> b!1254819 m!1155559))

(declare-fun m!1155597 () Bool)

(assert (=> b!1254819 m!1155597))

(declare-fun m!1155599 () Bool)

(assert (=> b!1254819 m!1155599))

(declare-fun m!1155601 () Bool)

(assert (=> b!1254819 m!1155601))

(declare-fun m!1155603 () Bool)

(assert (=> b!1254819 m!1155603))

(declare-fun m!1155605 () Bool)

(assert (=> b!1254819 m!1155605))

(assert (=> b!1254819 m!1155603))

(assert (=> b!1254819 m!1155597))

(declare-fun m!1155607 () Bool)

(assert (=> b!1254819 m!1155607))

(declare-fun m!1155609 () Bool)

(assert (=> b!1254819 m!1155609))

(declare-fun m!1155611 () Bool)

(assert (=> b!1254819 m!1155611))

(assert (=> b!1254819 m!1155507))

(declare-fun m!1155613 () Bool)

(assert (=> b!1254819 m!1155613))

(declare-fun m!1155615 () Bool)

(assert (=> b!1254819 m!1155615))

(declare-fun m!1155617 () Bool)

(assert (=> b!1254819 m!1155617))

(declare-fun m!1155619 () Bool)

(assert (=> b!1254819 m!1155619))

(declare-fun m!1155621 () Bool)

(assert (=> b!1254819 m!1155621))

(assert (=> b!1254819 m!1155615))

(declare-fun m!1155623 () Bool)

(assert (=> b!1254819 m!1155623))

(declare-fun m!1155625 () Bool)

(assert (=> b!1254819 m!1155625))

(assert (=> b!1254819 m!1155617))

(declare-fun m!1155627 () Bool)

(assert (=> bm!61751 m!1155627))

(declare-fun m!1155629 () Bool)

(assert (=> b!1254834 m!1155629))

(assert (=> d!138115 m!1155499))

(assert (=> b!1254835 m!1155559))

(declare-fun m!1155631 () Bool)

(assert (=> b!1254835 m!1155631))

(assert (=> b!1254835 m!1155559))

(declare-fun m!1155633 () Bool)

(assert (=> b!1254835 m!1155633))

(declare-fun m!1155635 () Bool)

(assert (=> b!1254835 m!1155635))

(assert (=> b!1254835 m!1155631))

(declare-fun m!1155637 () Bool)

(assert (=> b!1254835 m!1155637))

(assert (=> b!1254835 m!1155635))

(assert (=> b!1254710 d!138115))

(declare-fun d!138117 () Bool)

(declare-fun lt!567297 () ListLongMap!18549)

(assert (=> d!138117 (not (contains!7524 lt!567297 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!139 (List!27901 (_ BitVec 64)) List!27901)

(assert (=> d!138117 (= lt!567297 (ListLongMap!18550 (removeStrictlySorted!139 (toList!9290 lt!567182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138117 (= (-!2061 lt!567182 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567297)))

(declare-fun bs!35457 () Bool)

(assert (= bs!35457 d!138117))

(declare-fun m!1155639 () Bool)

(assert (=> bs!35457 m!1155639))

(declare-fun m!1155641 () Bool)

(assert (=> bs!35457 m!1155641))

(assert (=> b!1254710 d!138117))

(declare-fun d!138119 () Bool)

(assert (=> d!138119 (= (-!2061 (+!4184 lt!567186 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!567186)))

(declare-fun lt!567300 () Unit!41764)

(declare-fun choose!1855 (ListLongMap!18549 (_ BitVec 64) V!47889) Unit!41764)

(assert (=> d!138119 (= lt!567300 (choose!1855 lt!567186 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138119 (not (contains!7524 lt!567186 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138119 (= (addThenRemoveForNewKeyIsSame!331 lt!567186 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!567300)))

(declare-fun bs!35458 () Bool)

(assert (= bs!35458 d!138119))

(assert (=> bs!35458 m!1155517))

(assert (=> bs!35458 m!1155517))

(declare-fun m!1155643 () Bool)

(assert (=> bs!35458 m!1155643))

(declare-fun m!1155645 () Bool)

(assert (=> bs!35458 m!1155645))

(declare-fun m!1155647 () Bool)

(assert (=> bs!35458 m!1155647))

(assert (=> b!1254710 d!138119))

(declare-fun d!138121 () Bool)

(declare-fun lt!567301 () ListLongMap!18549)

(assert (=> d!138121 (not (contains!7524 lt!567301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138121 (= lt!567301 (ListLongMap!18550 (removeStrictlySorted!139 (toList!9290 lt!567180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138121 (= (-!2061 lt!567180 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567301)))

(declare-fun bs!35459 () Bool)

(assert (= bs!35459 d!138121))

(declare-fun m!1155649 () Bool)

(assert (=> bs!35459 m!1155649))

(declare-fun m!1155651 () Bool)

(assert (=> bs!35459 m!1155651))

(assert (=> b!1254710 d!138121))

(declare-fun b!1254840 () Bool)

(declare-fun e!713104 () Bool)

(declare-fun e!713103 () Bool)

(assert (=> b!1254840 (= e!713104 e!713103)))

(declare-fun res!836660 () Bool)

(declare-fun call!61763 () Bool)

(assert (=> b!1254840 (= res!836660 call!61763)))

(assert (=> b!1254840 (=> (not res!836660) (not e!713103))))

(declare-fun bm!61754 () Bool)

(declare-fun c!122365 () Bool)

(declare-fun c!122366 () Bool)

(declare-fun call!61759 () ListLongMap!18549)

(declare-fun call!61761 () ListLongMap!18549)

(declare-fun call!61762 () ListLongMap!18549)

(declare-fun call!61758 () ListLongMap!18549)

(assert (=> bm!61754 (= call!61758 (+!4184 (ite c!122366 call!61759 (ite c!122365 call!61761 call!61762)) (ite (or c!122366 c!122365) (tuple2!20677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1254841 () Bool)

(declare-fun e!713105 () ListLongMap!18549)

(assert (=> b!1254841 (= e!713105 (+!4184 call!61758 (tuple2!20677 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!61755 () Bool)

(assert (=> bm!61755 (= call!61759 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254843 () Bool)

(declare-fun e!713108 () Bool)

(declare-fun e!713097 () Bool)

(assert (=> b!1254843 (= e!713108 e!713097)))

(declare-fun c!122367 () Bool)

(assert (=> b!1254843 (= c!122367 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254844 () Bool)

(declare-fun res!836666 () Bool)

(assert (=> b!1254844 (=> (not res!836666) (not e!713108))))

(assert (=> b!1254844 (= res!836666 e!713104)))

(declare-fun c!122369 () Bool)

(assert (=> b!1254844 (= c!122369 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61756 () Bool)

(declare-fun lt!567310 () ListLongMap!18549)

(assert (=> bm!61756 (= call!61763 (contains!7524 lt!567310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254845 () Bool)

(declare-fun e!713107 () ListLongMap!18549)

(assert (=> b!1254845 (= e!713107 call!61762)))

(declare-fun bm!61757 () Bool)

(declare-fun call!61757 () ListLongMap!18549)

(assert (=> bm!61757 (= call!61757 call!61758)))

(declare-fun b!1254846 () Bool)

(assert (=> b!1254846 (= e!713107 call!61757)))

(declare-fun b!1254847 () Bool)

(assert (=> b!1254847 (= e!713104 (not call!61763))))

(declare-fun b!1254848 () Bool)

(declare-fun c!122368 () Bool)

(assert (=> b!1254848 (= c!122368 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!713106 () ListLongMap!18549)

(assert (=> b!1254848 (= e!713106 e!713107)))

(declare-fun b!1254849 () Bool)

(declare-fun res!836663 () Bool)

(assert (=> b!1254849 (=> (not res!836663) (not e!713108))))

(declare-fun e!713101 () Bool)

(assert (=> b!1254849 (= res!836663 e!713101)))

(declare-fun res!836665 () Bool)

(assert (=> b!1254849 (=> res!836665 e!713101)))

(declare-fun e!713109 () Bool)

(assert (=> b!1254849 (= res!836665 (not e!713109))))

(declare-fun res!836661 () Bool)

(assert (=> b!1254849 (=> (not res!836661) (not e!713109))))

(assert (=> b!1254849 (= res!836661 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254850 () Bool)

(declare-fun call!61760 () Bool)

(assert (=> b!1254850 (= e!713097 (not call!61760))))

(declare-fun bm!61758 () Bool)

(assert (=> bm!61758 (= call!61760 (contains!7524 lt!567310 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254851 () Bool)

(declare-fun e!713098 () Bool)

(assert (=> b!1254851 (= e!713098 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61759 () Bool)

(assert (=> bm!61759 (= call!61761 call!61759)))

(declare-fun bm!61760 () Bool)

(assert (=> bm!61760 (= call!61762 call!61761)))

(declare-fun b!1254842 () Bool)

(declare-fun e!713099 () Unit!41764)

(declare-fun lt!567308 () Unit!41764)

(assert (=> b!1254842 (= e!713099 lt!567308)))

(declare-fun lt!567311 () ListLongMap!18549)

(assert (=> b!1254842 (= lt!567311 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567305 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567305 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567312 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567312 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567323 () Unit!41764)

(assert (=> b!1254842 (= lt!567323 (addStillContains!1079 lt!567311 lt!567305 zeroValue!871 lt!567312))))

(assert (=> b!1254842 (contains!7524 (+!4184 lt!567311 (tuple2!20677 lt!567305 zeroValue!871)) lt!567312)))

(declare-fun lt!567316 () Unit!41764)

(assert (=> b!1254842 (= lt!567316 lt!567323)))

(declare-fun lt!567306 () ListLongMap!18549)

(assert (=> b!1254842 (= lt!567306 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567321 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567321 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567303 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567303 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567322 () Unit!41764)

(assert (=> b!1254842 (= lt!567322 (addApplyDifferent!533 lt!567306 lt!567321 minValueBefore!43 lt!567303))))

(assert (=> b!1254842 (= (apply!986 (+!4184 lt!567306 (tuple2!20677 lt!567321 minValueBefore!43)) lt!567303) (apply!986 lt!567306 lt!567303))))

(declare-fun lt!567307 () Unit!41764)

(assert (=> b!1254842 (= lt!567307 lt!567322)))

(declare-fun lt!567317 () ListLongMap!18549)

(assert (=> b!1254842 (= lt!567317 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567315 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567319 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567319 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567320 () Unit!41764)

(assert (=> b!1254842 (= lt!567320 (addApplyDifferent!533 lt!567317 lt!567315 zeroValue!871 lt!567319))))

(assert (=> b!1254842 (= (apply!986 (+!4184 lt!567317 (tuple2!20677 lt!567315 zeroValue!871)) lt!567319) (apply!986 lt!567317 lt!567319))))

(declare-fun lt!567304 () Unit!41764)

(assert (=> b!1254842 (= lt!567304 lt!567320)))

(declare-fun lt!567314 () ListLongMap!18549)

(assert (=> b!1254842 (= lt!567314 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567302 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567302 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567318 () (_ BitVec 64))

(assert (=> b!1254842 (= lt!567318 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254842 (= lt!567308 (addApplyDifferent!533 lt!567314 lt!567302 minValueBefore!43 lt!567318))))

(assert (=> b!1254842 (= (apply!986 (+!4184 lt!567314 (tuple2!20677 lt!567302 minValueBefore!43)) lt!567318) (apply!986 lt!567314 lt!567318))))

(declare-fun d!138123 () Bool)

(assert (=> d!138123 e!713108))

(declare-fun res!836659 () Bool)

(assert (=> d!138123 (=> (not res!836659) (not e!713108))))

(assert (=> d!138123 (= res!836659 (or (bvsge #b00000000000000000000000000000000 (size!39817 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))))

(declare-fun lt!567313 () ListLongMap!18549)

(assert (=> d!138123 (= lt!567310 lt!567313)))

(declare-fun lt!567309 () Unit!41764)

(assert (=> d!138123 (= lt!567309 e!713099)))

(declare-fun c!122370 () Bool)

(assert (=> d!138123 (= c!122370 e!713098)))

(declare-fun res!836662 () Bool)

(assert (=> d!138123 (=> (not res!836662) (not e!713098))))

(assert (=> d!138123 (= res!836662 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> d!138123 (= lt!567313 e!713105)))

(assert (=> d!138123 (= c!122366 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138123 (validMask!0 mask!1466)))

(assert (=> d!138123 (= (getCurrentListMap!4532 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567310)))

(declare-fun b!1254852 () Bool)

(declare-fun e!713100 () Bool)

(assert (=> b!1254852 (= e!713100 (= (apply!986 lt!567310 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1254853 () Bool)

(assert (=> b!1254853 (= e!713097 e!713100)))

(declare-fun res!836664 () Bool)

(assert (=> b!1254853 (= res!836664 call!61760)))

(assert (=> b!1254853 (=> (not res!836664) (not e!713100))))

(declare-fun b!1254854 () Bool)

(assert (=> b!1254854 (= e!713106 call!61757)))

(declare-fun b!1254855 () Bool)

(declare-fun e!713102 () Bool)

(assert (=> b!1254855 (= e!713101 e!713102)))

(declare-fun res!836667 () Bool)

(assert (=> b!1254855 (=> (not res!836667) (not e!713102))))

(assert (=> b!1254855 (= res!836667 (contains!7524 lt!567310 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254855 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254856 () Bool)

(assert (=> b!1254856 (= e!713109 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254857 () Bool)

(assert (=> b!1254857 (= e!713103 (= (apply!986 lt!567310 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1254858 () Bool)

(assert (=> b!1254858 (= e!713102 (= (apply!986 lt!567310 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)) (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1254858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39818 _values!914)))))

(assert (=> b!1254858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254859 () Bool)

(declare-fun Unit!41769 () Unit!41764)

(assert (=> b!1254859 (= e!713099 Unit!41769)))

(declare-fun b!1254860 () Bool)

(assert (=> b!1254860 (= e!713105 e!713106)))

(assert (=> b!1254860 (= c!122365 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138123 c!122366) b!1254841))

(assert (= (and d!138123 (not c!122366)) b!1254860))

(assert (= (and b!1254860 c!122365) b!1254854))

(assert (= (and b!1254860 (not c!122365)) b!1254848))

(assert (= (and b!1254848 c!122368) b!1254846))

(assert (= (and b!1254848 (not c!122368)) b!1254845))

(assert (= (or b!1254846 b!1254845) bm!61760))

(assert (= (or b!1254854 bm!61760) bm!61759))

(assert (= (or b!1254854 b!1254846) bm!61757))

(assert (= (or b!1254841 bm!61759) bm!61755))

(assert (= (or b!1254841 bm!61757) bm!61754))

(assert (= (and d!138123 res!836662) b!1254851))

(assert (= (and d!138123 c!122370) b!1254842))

(assert (= (and d!138123 (not c!122370)) b!1254859))

(assert (= (and d!138123 res!836659) b!1254849))

(assert (= (and b!1254849 res!836661) b!1254856))

(assert (= (and b!1254849 (not res!836665)) b!1254855))

(assert (= (and b!1254855 res!836667) b!1254858))

(assert (= (and b!1254849 res!836663) b!1254844))

(assert (= (and b!1254844 c!122369) b!1254840))

(assert (= (and b!1254844 (not c!122369)) b!1254847))

(assert (= (and b!1254840 res!836660) b!1254857))

(assert (= (or b!1254840 b!1254847) bm!61756))

(assert (= (and b!1254844 res!836666) b!1254843))

(assert (= (and b!1254843 c!122367) b!1254853))

(assert (= (and b!1254843 (not c!122367)) b!1254850))

(assert (= (and b!1254853 res!836664) b!1254852))

(assert (= (or b!1254853 b!1254850) bm!61758))

(declare-fun b_lambda!22629 () Bool)

(assert (=> (not b_lambda!22629) (not b!1254858)))

(assert (=> b!1254858 t!41388))

(declare-fun b_and!44823 () Bool)

(assert (= b_and!44821 (and (=> t!41388 result!23305) b_and!44823)))

(declare-fun m!1155653 () Bool)

(assert (=> b!1254841 m!1155653))

(assert (=> bm!61755 m!1155509))

(assert (=> b!1254855 m!1155559))

(assert (=> b!1254855 m!1155559))

(declare-fun m!1155655 () Bool)

(assert (=> b!1254855 m!1155655))

(declare-fun m!1155657 () Bool)

(assert (=> b!1254852 m!1155657))

(assert (=> b!1254856 m!1155559))

(assert (=> b!1254856 m!1155559))

(assert (=> b!1254856 m!1155563))

(assert (=> b!1254851 m!1155559))

(assert (=> b!1254851 m!1155559))

(assert (=> b!1254851 m!1155563))

(declare-fun m!1155659 () Bool)

(assert (=> bm!61754 m!1155659))

(declare-fun m!1155661 () Bool)

(assert (=> bm!61756 m!1155661))

(assert (=> b!1254842 m!1155559))

(declare-fun m!1155663 () Bool)

(assert (=> b!1254842 m!1155663))

(declare-fun m!1155665 () Bool)

(assert (=> b!1254842 m!1155665))

(declare-fun m!1155667 () Bool)

(assert (=> b!1254842 m!1155667))

(declare-fun m!1155669 () Bool)

(assert (=> b!1254842 m!1155669))

(declare-fun m!1155671 () Bool)

(assert (=> b!1254842 m!1155671))

(assert (=> b!1254842 m!1155669))

(assert (=> b!1254842 m!1155663))

(declare-fun m!1155673 () Bool)

(assert (=> b!1254842 m!1155673))

(declare-fun m!1155675 () Bool)

(assert (=> b!1254842 m!1155675))

(declare-fun m!1155677 () Bool)

(assert (=> b!1254842 m!1155677))

(assert (=> b!1254842 m!1155509))

(declare-fun m!1155679 () Bool)

(assert (=> b!1254842 m!1155679))

(declare-fun m!1155681 () Bool)

(assert (=> b!1254842 m!1155681))

(declare-fun m!1155683 () Bool)

(assert (=> b!1254842 m!1155683))

(declare-fun m!1155685 () Bool)

(assert (=> b!1254842 m!1155685))

(declare-fun m!1155687 () Bool)

(assert (=> b!1254842 m!1155687))

(assert (=> b!1254842 m!1155681))

(declare-fun m!1155689 () Bool)

(assert (=> b!1254842 m!1155689))

(declare-fun m!1155691 () Bool)

(assert (=> b!1254842 m!1155691))

(assert (=> b!1254842 m!1155683))

(declare-fun m!1155693 () Bool)

(assert (=> bm!61758 m!1155693))

(declare-fun m!1155695 () Bool)

(assert (=> b!1254857 m!1155695))

(assert (=> d!138123 m!1155499))

(assert (=> b!1254858 m!1155559))

(assert (=> b!1254858 m!1155631))

(assert (=> b!1254858 m!1155559))

(declare-fun m!1155697 () Bool)

(assert (=> b!1254858 m!1155697))

(assert (=> b!1254858 m!1155635))

(assert (=> b!1254858 m!1155631))

(assert (=> b!1254858 m!1155637))

(assert (=> b!1254858 m!1155635))

(assert (=> b!1254710 d!138123))

(declare-fun d!138125 () Bool)

(assert (=> d!138125 (= (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567326 () Unit!41764)

(declare-fun choose!1856 (array!81440 array!81442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47889 V!47889 V!47889 V!47889 (_ BitVec 32) Int) Unit!41764)

(assert (=> d!138125 (= lt!567326 (choose!1856 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138125 (validMask!0 mask!1466)))

(assert (=> d!138125 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1040 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567326)))

(declare-fun bs!35460 () Bool)

(assert (= bs!35460 d!138125))

(assert (=> bs!35460 m!1155509))

(assert (=> bs!35460 m!1155507))

(declare-fun m!1155699 () Bool)

(assert (=> bs!35460 m!1155699))

(assert (=> bs!35460 m!1155499))

(assert (=> b!1254706 d!138125))

(declare-fun b!1254885 () Bool)

(declare-fun e!713125 () Bool)

(declare-fun lt!567345 () ListLongMap!18549)

(declare-fun isEmpty!1028 (ListLongMap!18549) Bool)

(assert (=> b!1254885 (= e!713125 (isEmpty!1028 lt!567345))))

(declare-fun b!1254886 () Bool)

(declare-fun e!713126 () Bool)

(assert (=> b!1254886 (= e!713126 e!713125)))

(declare-fun c!122382 () Bool)

(assert (=> b!1254886 (= c!122382 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254887 () Bool)

(declare-fun e!713127 () Bool)

(assert (=> b!1254887 (= e!713127 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254887 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1254888 () Bool)

(assert (=> b!1254888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> b!1254888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39818 _values!914)))))

(declare-fun e!713128 () Bool)

(assert (=> b!1254888 (= e!713128 (= (apply!986 lt!567345 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)) (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254889 () Bool)

(declare-fun e!713124 () ListLongMap!18549)

(declare-fun e!713129 () ListLongMap!18549)

(assert (=> b!1254889 (= e!713124 e!713129)))

(declare-fun c!122379 () Bool)

(assert (=> b!1254889 (= c!122379 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254890 () Bool)

(declare-fun res!836676 () Bool)

(declare-fun e!713130 () Bool)

(assert (=> b!1254890 (=> (not res!836676) (not e!713130))))

(assert (=> b!1254890 (= res!836676 (not (contains!7524 lt!567345 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138127 () Bool)

(assert (=> d!138127 e!713130))

(declare-fun res!836679 () Bool)

(assert (=> d!138127 (=> (not res!836679) (not e!713130))))

(assert (=> d!138127 (= res!836679 (not (contains!7524 lt!567345 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138127 (= lt!567345 e!713124)))

(declare-fun c!122380 () Bool)

(assert (=> d!138127 (= c!122380 (bvsge #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> d!138127 (validMask!0 mask!1466)))

(assert (=> d!138127 (= (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567345)))

(declare-fun b!1254891 () Bool)

(declare-fun lt!567343 () Unit!41764)

(declare-fun lt!567346 () Unit!41764)

(assert (=> b!1254891 (= lt!567343 lt!567346)))

(declare-fun lt!567341 () (_ BitVec 64))

(declare-fun lt!567342 () V!47889)

(declare-fun lt!567344 () ListLongMap!18549)

(declare-fun lt!567347 () (_ BitVec 64))

(assert (=> b!1254891 (not (contains!7524 (+!4184 lt!567344 (tuple2!20677 lt!567347 lt!567342)) lt!567341))))

(declare-fun addStillNotContains!314 (ListLongMap!18549 (_ BitVec 64) V!47889 (_ BitVec 64)) Unit!41764)

(assert (=> b!1254891 (= lt!567346 (addStillNotContains!314 lt!567344 lt!567347 lt!567342 lt!567341))))

(assert (=> b!1254891 (= lt!567341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254891 (= lt!567342 (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254891 (= lt!567347 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61766 () ListLongMap!18549)

(assert (=> b!1254891 (= lt!567344 call!61766)))

(assert (=> b!1254891 (= e!713129 (+!4184 call!61766 (tuple2!20677 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000) (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254892 () Bool)

(assert (=> b!1254892 (= e!713126 e!713128)))

(assert (=> b!1254892 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun res!836677 () Bool)

(assert (=> b!1254892 (= res!836677 (contains!7524 lt!567345 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254892 (=> (not res!836677) (not e!713128))))

(declare-fun b!1254893 () Bool)

(assert (=> b!1254893 (= e!713129 call!61766)))

(declare-fun b!1254894 () Bool)

(assert (=> b!1254894 (= e!713124 (ListLongMap!18550 Nil!27898))))

(declare-fun bm!61763 () Bool)

(assert (=> bm!61763 (= call!61766 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254895 () Bool)

(assert (=> b!1254895 (= e!713130 e!713126)))

(declare-fun c!122381 () Bool)

(assert (=> b!1254895 (= c!122381 e!713127)))

(declare-fun res!836678 () Bool)

(assert (=> b!1254895 (=> (not res!836678) (not e!713127))))

(assert (=> b!1254895 (= res!836678 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254896 () Bool)

(assert (=> b!1254896 (= e!713125 (= lt!567345 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138127 c!122380) b!1254894))

(assert (= (and d!138127 (not c!122380)) b!1254889))

(assert (= (and b!1254889 c!122379) b!1254891))

(assert (= (and b!1254889 (not c!122379)) b!1254893))

(assert (= (or b!1254891 b!1254893) bm!61763))

(assert (= (and d!138127 res!836679) b!1254890))

(assert (= (and b!1254890 res!836676) b!1254895))

(assert (= (and b!1254895 res!836678) b!1254887))

(assert (= (and b!1254895 c!122381) b!1254892))

(assert (= (and b!1254895 (not c!122381)) b!1254886))

(assert (= (and b!1254892 res!836677) b!1254888))

(assert (= (and b!1254886 c!122382) b!1254896))

(assert (= (and b!1254886 (not c!122382)) b!1254885))

(declare-fun b_lambda!22631 () Bool)

(assert (=> (not b_lambda!22631) (not b!1254888)))

(assert (=> b!1254888 t!41388))

(declare-fun b_and!44825 () Bool)

(assert (= b_and!44823 (and (=> t!41388 result!23305) b_and!44825)))

(declare-fun b_lambda!22633 () Bool)

(assert (=> (not b_lambda!22633) (not b!1254891)))

(assert (=> b!1254891 t!41388))

(declare-fun b_and!44827 () Bool)

(assert (= b_and!44825 (and (=> t!41388 result!23305) b_and!44827)))

(declare-fun m!1155701 () Bool)

(assert (=> b!1254890 m!1155701))

(declare-fun m!1155703 () Bool)

(assert (=> bm!61763 m!1155703))

(declare-fun m!1155705 () Bool)

(assert (=> b!1254885 m!1155705))

(assert (=> b!1254887 m!1155559))

(assert (=> b!1254887 m!1155559))

(assert (=> b!1254887 m!1155563))

(assert (=> b!1254888 m!1155559))

(declare-fun m!1155707 () Bool)

(assert (=> b!1254888 m!1155707))

(assert (=> b!1254888 m!1155559))

(assert (=> b!1254888 m!1155631))

(assert (=> b!1254888 m!1155635))

(assert (=> b!1254888 m!1155631))

(assert (=> b!1254888 m!1155637))

(assert (=> b!1254888 m!1155635))

(declare-fun m!1155709 () Bool)

(assert (=> b!1254891 m!1155709))

(declare-fun m!1155711 () Bool)

(assert (=> b!1254891 m!1155711))

(declare-fun m!1155713 () Bool)

(assert (=> b!1254891 m!1155713))

(assert (=> b!1254891 m!1155559))

(declare-fun m!1155715 () Bool)

(assert (=> b!1254891 m!1155715))

(assert (=> b!1254891 m!1155635))

(assert (=> b!1254891 m!1155631))

(assert (=> b!1254891 m!1155637))

(assert (=> b!1254891 m!1155635))

(assert (=> b!1254891 m!1155631))

(assert (=> b!1254891 m!1155709))

(assert (=> b!1254896 m!1155703))

(assert (=> b!1254889 m!1155559))

(assert (=> b!1254889 m!1155559))

(assert (=> b!1254889 m!1155563))

(declare-fun m!1155717 () Bool)

(assert (=> d!138127 m!1155717))

(assert (=> d!138127 m!1155499))

(assert (=> b!1254892 m!1155559))

(assert (=> b!1254892 m!1155559))

(declare-fun m!1155719 () Bool)

(assert (=> b!1254892 m!1155719))

(assert (=> b!1254706 d!138127))

(declare-fun b!1254897 () Bool)

(declare-fun e!713132 () Bool)

(declare-fun lt!567352 () ListLongMap!18549)

(assert (=> b!1254897 (= e!713132 (isEmpty!1028 lt!567352))))

(declare-fun b!1254898 () Bool)

(declare-fun e!713133 () Bool)

(assert (=> b!1254898 (= e!713133 e!713132)))

(declare-fun c!122386 () Bool)

(assert (=> b!1254898 (= c!122386 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254899 () Bool)

(declare-fun e!713134 () Bool)

(assert (=> b!1254899 (= e!713134 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254899 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1254900 () Bool)

(assert (=> b!1254900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> b!1254900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39818 _values!914)))))

(declare-fun e!713135 () Bool)

(assert (=> b!1254900 (= e!713135 (= (apply!986 lt!567352 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)) (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254901 () Bool)

(declare-fun e!713131 () ListLongMap!18549)

(declare-fun e!713136 () ListLongMap!18549)

(assert (=> b!1254901 (= e!713131 e!713136)))

(declare-fun c!122383 () Bool)

(assert (=> b!1254901 (= c!122383 (validKeyInArray!0 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254902 () Bool)

(declare-fun res!836680 () Bool)

(declare-fun e!713137 () Bool)

(assert (=> b!1254902 (=> (not res!836680) (not e!713137))))

(assert (=> b!1254902 (= res!836680 (not (contains!7524 lt!567352 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138129 () Bool)

(assert (=> d!138129 e!713137))

(declare-fun res!836683 () Bool)

(assert (=> d!138129 (=> (not res!836683) (not e!713137))))

(assert (=> d!138129 (= res!836683 (not (contains!7524 lt!567352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138129 (= lt!567352 e!713131)))

(declare-fun c!122384 () Bool)

(assert (=> d!138129 (= c!122384 (bvsge #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(assert (=> d!138129 (validMask!0 mask!1466)))

(assert (=> d!138129 (= (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567352)))

(declare-fun b!1254903 () Bool)

(declare-fun lt!567350 () Unit!41764)

(declare-fun lt!567353 () Unit!41764)

(assert (=> b!1254903 (= lt!567350 lt!567353)))

(declare-fun lt!567349 () V!47889)

(declare-fun lt!567354 () (_ BitVec 64))

(declare-fun lt!567348 () (_ BitVec 64))

(declare-fun lt!567351 () ListLongMap!18549)

(assert (=> b!1254903 (not (contains!7524 (+!4184 lt!567351 (tuple2!20677 lt!567354 lt!567349)) lt!567348))))

(assert (=> b!1254903 (= lt!567353 (addStillNotContains!314 lt!567351 lt!567354 lt!567349 lt!567348))))

(assert (=> b!1254903 (= lt!567348 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254903 (= lt!567349 (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254903 (= lt!567354 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61767 () ListLongMap!18549)

(assert (=> b!1254903 (= lt!567351 call!61767)))

(assert (=> b!1254903 (= e!713136 (+!4184 call!61767 (tuple2!20677 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000) (get!20101 (select (arr!39282 _values!914) #b00000000000000000000000000000000) (dynLambda!3384 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254904 () Bool)

(assert (=> b!1254904 (= e!713133 e!713135)))

(assert (=> b!1254904 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun res!836681 () Bool)

(assert (=> b!1254904 (= res!836681 (contains!7524 lt!567352 (select (arr!39281 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254904 (=> (not res!836681) (not e!713135))))

(declare-fun b!1254905 () Bool)

(assert (=> b!1254905 (= e!713136 call!61767)))

(declare-fun b!1254906 () Bool)

(assert (=> b!1254906 (= e!713131 (ListLongMap!18550 Nil!27898))))

(declare-fun bm!61764 () Bool)

(assert (=> bm!61764 (= call!61767 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254907 () Bool)

(assert (=> b!1254907 (= e!713137 e!713133)))

(declare-fun c!122385 () Bool)

(assert (=> b!1254907 (= c!122385 e!713134)))

(declare-fun res!836682 () Bool)

(assert (=> b!1254907 (=> (not res!836682) (not e!713134))))

(assert (=> b!1254907 (= res!836682 (bvslt #b00000000000000000000000000000000 (size!39817 _keys!1118)))))

(declare-fun b!1254908 () Bool)

(assert (=> b!1254908 (= e!713132 (= lt!567352 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138129 c!122384) b!1254906))

(assert (= (and d!138129 (not c!122384)) b!1254901))

(assert (= (and b!1254901 c!122383) b!1254903))

(assert (= (and b!1254901 (not c!122383)) b!1254905))

(assert (= (or b!1254903 b!1254905) bm!61764))

(assert (= (and d!138129 res!836683) b!1254902))

(assert (= (and b!1254902 res!836680) b!1254907))

(assert (= (and b!1254907 res!836682) b!1254899))

(assert (= (and b!1254907 c!122385) b!1254904))

(assert (= (and b!1254907 (not c!122385)) b!1254898))

(assert (= (and b!1254904 res!836681) b!1254900))

(assert (= (and b!1254898 c!122386) b!1254908))

(assert (= (and b!1254898 (not c!122386)) b!1254897))

(declare-fun b_lambda!22635 () Bool)

(assert (=> (not b_lambda!22635) (not b!1254900)))

(assert (=> b!1254900 t!41388))

(declare-fun b_and!44829 () Bool)

(assert (= b_and!44827 (and (=> t!41388 result!23305) b_and!44829)))

(declare-fun b_lambda!22637 () Bool)

(assert (=> (not b_lambda!22637) (not b!1254903)))

(assert (=> b!1254903 t!41388))

(declare-fun b_and!44831 () Bool)

(assert (= b_and!44829 (and (=> t!41388 result!23305) b_and!44831)))

(declare-fun m!1155721 () Bool)

(assert (=> b!1254902 m!1155721))

(declare-fun m!1155723 () Bool)

(assert (=> bm!61764 m!1155723))

(declare-fun m!1155725 () Bool)

(assert (=> b!1254897 m!1155725))

(assert (=> b!1254899 m!1155559))

(assert (=> b!1254899 m!1155559))

(assert (=> b!1254899 m!1155563))

(assert (=> b!1254900 m!1155559))

(declare-fun m!1155727 () Bool)

(assert (=> b!1254900 m!1155727))

(assert (=> b!1254900 m!1155559))

(assert (=> b!1254900 m!1155631))

(assert (=> b!1254900 m!1155635))

(assert (=> b!1254900 m!1155631))

(assert (=> b!1254900 m!1155637))

(assert (=> b!1254900 m!1155635))

(declare-fun m!1155729 () Bool)

(assert (=> b!1254903 m!1155729))

(declare-fun m!1155731 () Bool)

(assert (=> b!1254903 m!1155731))

(declare-fun m!1155733 () Bool)

(assert (=> b!1254903 m!1155733))

(assert (=> b!1254903 m!1155559))

(declare-fun m!1155735 () Bool)

(assert (=> b!1254903 m!1155735))

(assert (=> b!1254903 m!1155635))

(assert (=> b!1254903 m!1155631))

(assert (=> b!1254903 m!1155637))

(assert (=> b!1254903 m!1155635))

(assert (=> b!1254903 m!1155631))

(assert (=> b!1254903 m!1155729))

(assert (=> b!1254908 m!1155723))

(assert (=> b!1254901 m!1155559))

(assert (=> b!1254901 m!1155559))

(assert (=> b!1254901 m!1155563))

(declare-fun m!1155737 () Bool)

(assert (=> d!138129 m!1155737))

(assert (=> d!138129 m!1155499))

(assert (=> b!1254904 m!1155559))

(assert (=> b!1254904 m!1155559))

(declare-fun m!1155739 () Bool)

(assert (=> b!1254904 m!1155739))

(assert (=> b!1254706 d!138129))

(declare-fun b!1254915 () Bool)

(declare-fun e!713142 () Bool)

(assert (=> b!1254915 (= e!713142 tp_is_empty!31893)))

(declare-fun mapNonEmpty!49624 () Bool)

(declare-fun mapRes!49624 () Bool)

(declare-fun tp!94490 () Bool)

(assert (=> mapNonEmpty!49624 (= mapRes!49624 (and tp!94490 e!713142))))

(declare-fun mapKey!49624 () (_ BitVec 32))

(declare-fun mapValue!49624 () ValueCell!15183)

(declare-fun mapRest!49624 () (Array (_ BitVec 32) ValueCell!15183))

(assert (=> mapNonEmpty!49624 (= mapRest!49618 (store mapRest!49624 mapKey!49624 mapValue!49624))))

(declare-fun b!1254916 () Bool)

(declare-fun e!713143 () Bool)

(assert (=> b!1254916 (= e!713143 tp_is_empty!31893)))

(declare-fun mapIsEmpty!49624 () Bool)

(assert (=> mapIsEmpty!49624 mapRes!49624))

(declare-fun condMapEmpty!49624 () Bool)

(declare-fun mapDefault!49624 () ValueCell!15183)

(assert (=> mapNonEmpty!49618 (= condMapEmpty!49624 (= mapRest!49618 ((as const (Array (_ BitVec 32) ValueCell!15183)) mapDefault!49624)))))

(assert (=> mapNonEmpty!49618 (= tp!94481 (and e!713143 mapRes!49624))))

(assert (= (and mapNonEmpty!49618 condMapEmpty!49624) mapIsEmpty!49624))

(assert (= (and mapNonEmpty!49618 (not condMapEmpty!49624)) mapNonEmpty!49624))

(assert (= (and mapNonEmpty!49624 ((_ is ValueCellFull!15183) mapValue!49624)) b!1254915))

(assert (= (and mapNonEmpty!49618 ((_ is ValueCellFull!15183) mapDefault!49624)) b!1254916))

(declare-fun m!1155741 () Bool)

(assert (=> mapNonEmpty!49624 m!1155741))

(declare-fun b_lambda!22639 () Bool)

(assert (= b_lambda!22633 (or (and start!105296 b_free!26991) b_lambda!22639)))

(declare-fun b_lambda!22641 () Bool)

(assert (= b_lambda!22637 (or (and start!105296 b_free!26991) b_lambda!22641)))

(declare-fun b_lambda!22643 () Bool)

(assert (= b_lambda!22635 (or (and start!105296 b_free!26991) b_lambda!22643)))

(declare-fun b_lambda!22645 () Bool)

(assert (= b_lambda!22631 (or (and start!105296 b_free!26991) b_lambda!22645)))

(declare-fun b_lambda!22647 () Bool)

(assert (= b_lambda!22629 (or (and start!105296 b_free!26991) b_lambda!22647)))

(declare-fun b_lambda!22649 () Bool)

(assert (= b_lambda!22627 (or (and start!105296 b_free!26991) b_lambda!22649)))

(check-sat (not b!1254828) (not b!1254852) (not bm!61754) (not b!1254904) (not bm!61758) (not b!1254834) (not d!138119) (not b!1254766) (not b!1254888) (not b!1254892) (not b!1254832) (not b!1254899) (not bm!61763) (not b!1254897) (not d!138121) (not bm!61729) (not b_lambda!22645) (not mapNonEmpty!49624) (not b!1254818) (not d!138127) (not bm!61755) (not d!138129) (not b!1254819) (not d!138125) (not b_lambda!22649) (not bm!61751) (not b!1254753) (not b!1254890) (not b!1254889) (not b!1254842) (not b!1254855) (not b!1254908) (not bm!61764) (not b!1254835) (not b!1254752) (not b!1254885) (not b!1254903) (not b!1254773) (not b!1254887) (not b!1254767) (not b!1254856) (not b!1254900) (not b!1254774) (not b_next!26991) (not b!1254896) (not b_lambda!22643) (not b!1254841) (not b!1254891) (not bm!61756) (not b_lambda!22641) (not b!1254858) (not b!1254829) (not b!1254833) (not bm!61732) (not bm!61747) (not d!138115) (not d!138117) (not b!1254754) tp_is_empty!31893 (not b!1254901) (not d!138123) b_and!44831 (not b_lambda!22647) (not b!1254851) (not b!1254902) (not d!138113) (not bm!61748) (not bm!61749) (not b!1254857) (not b_lambda!22639))
(check-sat b_and!44831 (not b_next!26991))
