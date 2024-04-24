; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106228 () Bool)

(assert start!106228)

(declare-fun b_free!27475 () Bool)

(declare-fun b_next!27475 () Bool)

(assert (=> start!106228 (= b_free!27475 (not b_next!27475))))

(declare-fun tp!95969 () Bool)

(declare-fun b_and!45427 () Bool)

(assert (=> start!106228 (= tp!95969 b_and!45427)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48535 0))(
  ( (V!48536 (val!16251 Int)) )
))
(declare-datatypes ((tuple2!21046 0))(
  ( (tuple2!21047 (_1!10534 (_ BitVec 64)) (_2!10534 V!48535)) )
))
(declare-datatypes ((List!28269 0))(
  ( (Nil!28266) (Cons!28265 (h!29483 tuple2!21046) (t!41768 List!28269)) )
))
(declare-datatypes ((ListLongMap!18927 0))(
  ( (ListLongMap!18928 (toList!9479 List!28269)) )
))
(declare-fun lt!572703 () ListLongMap!18927)

(declare-fun zeroValue!871 () V!48535)

(declare-datatypes ((array!82417 0))(
  ( (array!82418 (arr!39753 (Array (_ BitVec 32) (_ BitVec 64))) (size!40290 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82417)

(declare-fun b!1263677 () Bool)

(declare-fun minValueBefore!43 () V!48535)

(declare-datatypes ((ValueCell!15425 0))(
  ( (ValueCellFull!15425 (v!18954 V!48535)) (EmptyCell!15425) )
))
(declare-datatypes ((array!82419 0))(
  ( (array!82420 (arr!39754 (Array (_ BitVec 32) ValueCell!15425)) (size!40291 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82419)

(declare-fun e!719423 () Bool)

(declare-fun getCurrentListMap!4632 (array!82417 array!82419 (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 (_ BitVec 32) Int) ListLongMap!18927)

(declare-fun +!4291 (ListLongMap!18927 tuple2!21046) ListLongMap!18927)

(assert (=> b!1263677 (= e!719423 (= (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4291 lt!572703 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263678 () Bool)

(declare-fun res!841545 () Bool)

(declare-fun e!719426 () Bool)

(assert (=> b!1263678 (=> (not res!841545) (not e!719426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82417 (_ BitVec 32)) Bool)

(assert (=> b!1263678 (= res!841545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263680 () Bool)

(declare-fun e!719427 () Bool)

(declare-fun tp_is_empty!32377 () Bool)

(assert (=> b!1263680 (= e!719427 tp_is_empty!32377)))

(declare-fun mapIsEmpty!50380 () Bool)

(declare-fun mapRes!50380 () Bool)

(assert (=> mapIsEmpty!50380 mapRes!50380))

(declare-fun lt!572704 () ListLongMap!18927)

(declare-fun minValueAfter!43 () V!48535)

(declare-fun e!719428 () Bool)

(declare-fun b!1263681 () Bool)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1263681 (= e!719428 (= (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572704))))

(declare-fun mapNonEmpty!50380 () Bool)

(declare-fun tp!95968 () Bool)

(assert (=> mapNonEmpty!50380 (= mapRes!50380 (and tp!95968 e!719427))))

(declare-fun mapRest!50380 () (Array (_ BitVec 32) ValueCell!15425))

(declare-fun mapKey!50380 () (_ BitVec 32))

(declare-fun mapValue!50380 () ValueCell!15425)

(assert (=> mapNonEmpty!50380 (= (arr!39754 _values!914) (store mapRest!50380 mapKey!50380 mapValue!50380))))

(declare-fun b!1263682 () Bool)

(declare-fun e!719424 () Bool)

(assert (=> b!1263682 (= e!719424 tp_is_empty!32377)))

(declare-fun b!1263683 () Bool)

(declare-fun res!841539 () Bool)

(assert (=> b!1263683 (=> (not res!841539) (not e!719426))))

(assert (=> b!1263683 (= res!841539 (and (= (size!40291 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40290 _keys!1118) (size!40291 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263684 () Bool)

(declare-fun e!719430 () Bool)

(assert (=> b!1263684 (= e!719430 (and e!719424 mapRes!50380))))

(declare-fun condMapEmpty!50380 () Bool)

(declare-fun mapDefault!50380 () ValueCell!15425)

(assert (=> b!1263684 (= condMapEmpty!50380 (= (arr!39754 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15425)) mapDefault!50380)))))

(declare-fun res!841543 () Bool)

(assert (=> start!106228 (=> (not res!841543) (not e!719426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106228 (= res!841543 (validMask!0 mask!1466))))

(assert (=> start!106228 e!719426))

(assert (=> start!106228 true))

(assert (=> start!106228 tp!95969))

(assert (=> start!106228 tp_is_empty!32377))

(declare-fun array_inv!30415 (array!82417) Bool)

(assert (=> start!106228 (array_inv!30415 _keys!1118)))

(declare-fun array_inv!30416 (array!82419) Bool)

(assert (=> start!106228 (and (array_inv!30416 _values!914) e!719430)))

(declare-fun b!1263679 () Bool)

(assert (=> b!1263679 (= e!719426 (not e!719428))))

(declare-fun res!841544 () Bool)

(assert (=> b!1263679 (=> res!841544 e!719428)))

(assert (=> b!1263679 (= res!841544 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!719429 () Bool)

(assert (=> b!1263679 e!719429))

(declare-fun res!841542 () Bool)

(assert (=> b!1263679 (=> (not res!841542) (not e!719429))))

(assert (=> b!1263679 (= res!841542 (= lt!572703 lt!572704))))

(declare-datatypes ((Unit!42055 0))(
  ( (Unit!42056) )
))
(declare-fun lt!572702 () Unit!42055)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1173 (array!82417 array!82419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 V!48535 V!48535 (_ BitVec 32) Int) Unit!42055)

(assert (=> b!1263679 (= lt!572702 (lemmaNoChangeToArrayThenSameMapNoExtras!1173 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5883 (array!82417 array!82419 (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 (_ BitVec 32) Int) ListLongMap!18927)

(assert (=> b!1263679 (= lt!572704 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263679 (= lt!572703 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263685 () Bool)

(declare-fun res!841541 () Bool)

(assert (=> b!1263685 (=> (not res!841541) (not e!719426))))

(declare-datatypes ((List!28270 0))(
  ( (Nil!28267) (Cons!28266 (h!29484 (_ BitVec 64)) (t!41769 List!28270)) )
))
(declare-fun arrayNoDuplicates!0 (array!82417 (_ BitVec 32) List!28270) Bool)

(assert (=> b!1263685 (= res!841541 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28267))))

(declare-fun b!1263686 () Bool)

(assert (=> b!1263686 (= e!719429 e!719423)))

(declare-fun res!841540 () Bool)

(assert (=> b!1263686 (=> res!841540 e!719423)))

(assert (=> b!1263686 (= res!841540 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!106228 res!841543) b!1263683))

(assert (= (and b!1263683 res!841539) b!1263678))

(assert (= (and b!1263678 res!841545) b!1263685))

(assert (= (and b!1263685 res!841541) b!1263679))

(assert (= (and b!1263679 res!841542) b!1263686))

(assert (= (and b!1263686 (not res!841540)) b!1263677))

(assert (= (and b!1263679 (not res!841544)) b!1263681))

(assert (= (and b!1263684 condMapEmpty!50380) mapIsEmpty!50380))

(assert (= (and b!1263684 (not condMapEmpty!50380)) mapNonEmpty!50380))

(get-info :version)

(assert (= (and mapNonEmpty!50380 ((_ is ValueCellFull!15425) mapValue!50380)) b!1263680))

(assert (= (and b!1263684 ((_ is ValueCellFull!15425) mapDefault!50380)) b!1263682))

(assert (= start!106228 b!1263684))

(declare-fun m!1164505 () Bool)

(assert (=> b!1263679 m!1164505))

(declare-fun m!1164507 () Bool)

(assert (=> b!1263679 m!1164507))

(declare-fun m!1164509 () Bool)

(assert (=> b!1263679 m!1164509))

(declare-fun m!1164511 () Bool)

(assert (=> b!1263681 m!1164511))

(declare-fun m!1164513 () Bool)

(assert (=> mapNonEmpty!50380 m!1164513))

(declare-fun m!1164515 () Bool)

(assert (=> start!106228 m!1164515))

(declare-fun m!1164517 () Bool)

(assert (=> start!106228 m!1164517))

(declare-fun m!1164519 () Bool)

(assert (=> start!106228 m!1164519))

(declare-fun m!1164521 () Bool)

(assert (=> b!1263678 m!1164521))

(declare-fun m!1164523 () Bool)

(assert (=> b!1263677 m!1164523))

(declare-fun m!1164525 () Bool)

(assert (=> b!1263677 m!1164525))

(declare-fun m!1164527 () Bool)

(assert (=> b!1263685 m!1164527))

(check-sat (not b_next!27475) (not mapNonEmpty!50380) tp_is_empty!32377 (not b!1263681) (not start!106228) (not b!1263677) b_and!45427 (not b!1263679) (not b!1263685) (not b!1263678))
(check-sat b_and!45427 (not b_next!27475))
(get-model)

(declare-fun d!138985 () Bool)

(declare-fun res!841592 () Bool)

(declare-fun e!719486 () Bool)

(assert (=> d!138985 (=> res!841592 e!719486)))

(assert (=> d!138985 (= res!841592 (bvsge #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(assert (=> d!138985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719486)))

(declare-fun b!1263755 () Bool)

(declare-fun e!719487 () Bool)

(declare-fun call!62141 () Bool)

(assert (=> b!1263755 (= e!719487 call!62141)))

(declare-fun bm!62138 () Bool)

(assert (=> bm!62138 (= call!62141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263756 () Bool)

(declare-fun e!719485 () Bool)

(assert (=> b!1263756 (= e!719485 e!719487)))

(declare-fun lt!572730 () (_ BitVec 64))

(assert (=> b!1263756 (= lt!572730 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572731 () Unit!42055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82417 (_ BitVec 64) (_ BitVec 32)) Unit!42055)

(assert (=> b!1263756 (= lt!572731 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572730 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263756 (arrayContainsKey!0 _keys!1118 lt!572730 #b00000000000000000000000000000000)))

(declare-fun lt!572729 () Unit!42055)

(assert (=> b!1263756 (= lt!572729 lt!572731)))

(declare-fun res!841593 () Bool)

(declare-datatypes ((SeekEntryResult!9932 0))(
  ( (MissingZero!9932 (index!42099 (_ BitVec 32))) (Found!9932 (index!42100 (_ BitVec 32))) (Intermediate!9932 (undefined!10744 Bool) (index!42101 (_ BitVec 32)) (x!111227 (_ BitVec 32))) (Undefined!9932) (MissingVacant!9932 (index!42102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82417 (_ BitVec 32)) SeekEntryResult!9932)

(assert (=> b!1263756 (= res!841593 (= (seekEntryOrOpen!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9932 #b00000000000000000000000000000000)))))

(assert (=> b!1263756 (=> (not res!841593) (not e!719487))))

(declare-fun b!1263757 () Bool)

(assert (=> b!1263757 (= e!719485 call!62141)))

(declare-fun b!1263758 () Bool)

(assert (=> b!1263758 (= e!719486 e!719485)))

(declare-fun c!123211 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263758 (= c!123211 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138985 (not res!841592)) b!1263758))

(assert (= (and b!1263758 c!123211) b!1263756))

(assert (= (and b!1263758 (not c!123211)) b!1263757))

(assert (= (and b!1263756 res!841593) b!1263755))

(assert (= (or b!1263755 b!1263757) bm!62138))

(declare-fun m!1164577 () Bool)

(assert (=> bm!62138 m!1164577))

(declare-fun m!1164579 () Bool)

(assert (=> b!1263756 m!1164579))

(declare-fun m!1164581 () Bool)

(assert (=> b!1263756 m!1164581))

(declare-fun m!1164583 () Bool)

(assert (=> b!1263756 m!1164583))

(assert (=> b!1263756 m!1164579))

(declare-fun m!1164585 () Bool)

(assert (=> b!1263756 m!1164585))

(assert (=> b!1263758 m!1164579))

(assert (=> b!1263758 m!1164579))

(declare-fun m!1164587 () Bool)

(assert (=> b!1263758 m!1164587))

(assert (=> b!1263678 d!138985))

(declare-fun d!138987 () Bool)

(assert (=> d!138987 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106228 d!138987))

(declare-fun d!138989 () Bool)

(assert (=> d!138989 (= (array_inv!30415 _keys!1118) (bvsge (size!40290 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106228 d!138989))

(declare-fun d!138991 () Bool)

(assert (=> d!138991 (= (array_inv!30416 _values!914) (bvsge (size!40291 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106228 d!138991))

(declare-fun d!138993 () Bool)

(assert (=> d!138993 (= (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572734 () Unit!42055)

(declare-fun choose!1876 (array!82417 array!82419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48535 V!48535 V!48535 V!48535 (_ BitVec 32) Int) Unit!42055)

(assert (=> d!138993 (= lt!572734 (choose!1876 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138993 (validMask!0 mask!1466)))

(assert (=> d!138993 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1173 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572734)))

(declare-fun bs!35742 () Bool)

(assert (= bs!35742 d!138993))

(assert (=> bs!35742 m!1164509))

(assert (=> bs!35742 m!1164507))

(declare-fun m!1164589 () Bool)

(assert (=> bs!35742 m!1164589))

(assert (=> bs!35742 m!1164515))

(assert (=> b!1263679 d!138993))

(declare-fun b!1263783 () Bool)

(declare-fun e!719508 () Bool)

(declare-fun e!719502 () Bool)

(assert (=> b!1263783 (= e!719508 e!719502)))

(declare-fun c!123222 () Bool)

(declare-fun e!719504 () Bool)

(assert (=> b!1263783 (= c!123222 e!719504)))

(declare-fun res!841605 () Bool)

(assert (=> b!1263783 (=> (not res!841605) (not e!719504))))

(assert (=> b!1263783 (= res!841605 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263785 () Bool)

(assert (=> b!1263785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(assert (=> b!1263785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40291 _values!914)))))

(declare-fun e!719506 () Bool)

(declare-fun lt!572750 () ListLongMap!18927)

(declare-fun apply!1007 (ListLongMap!18927 (_ BitVec 64)) V!48535)

(declare-fun get!20326 (ValueCell!15425 V!48535) V!48535)

(declare-fun dynLambda!3459 (Int (_ BitVec 64)) V!48535)

(assert (=> b!1263785 (= e!719506 (= (apply!1007 lt!572750 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)) (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!719505 () Bool)

(declare-fun b!1263786 () Bool)

(assert (=> b!1263786 (= e!719505 (= lt!572750 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263787 () Bool)

(assert (=> b!1263787 (= e!719504 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263787 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263788 () Bool)

(declare-fun lt!572752 () Unit!42055)

(declare-fun lt!572749 () Unit!42055)

(assert (=> b!1263788 (= lt!572752 lt!572749)))

(declare-fun lt!572755 () (_ BitVec 64))

(declare-fun lt!572751 () ListLongMap!18927)

(declare-fun lt!572753 () (_ BitVec 64))

(declare-fun lt!572754 () V!48535)

(declare-fun contains!7618 (ListLongMap!18927 (_ BitVec 64)) Bool)

(assert (=> b!1263788 (not (contains!7618 (+!4291 lt!572751 (tuple2!21047 lt!572753 lt!572754)) lt!572755))))

(declare-fun addStillNotContains!328 (ListLongMap!18927 (_ BitVec 64) V!48535 (_ BitVec 64)) Unit!42055)

(assert (=> b!1263788 (= lt!572749 (addStillNotContains!328 lt!572751 lt!572753 lt!572754 lt!572755))))

(assert (=> b!1263788 (= lt!572755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263788 (= lt!572754 (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263788 (= lt!572753 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62144 () ListLongMap!18927)

(assert (=> b!1263788 (= lt!572751 call!62144)))

(declare-fun e!719503 () ListLongMap!18927)

(assert (=> b!1263788 (= e!719503 (+!4291 call!62144 (tuple2!21047 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000) (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263789 () Bool)

(declare-fun isEmpty!1044 (ListLongMap!18927) Bool)

(assert (=> b!1263789 (= e!719505 (isEmpty!1044 lt!572750))))

(declare-fun b!1263790 () Bool)

(declare-fun e!719507 () ListLongMap!18927)

(assert (=> b!1263790 (= e!719507 e!719503)))

(declare-fun c!123221 () Bool)

(assert (=> b!1263790 (= c!123221 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263791 () Bool)

(assert (=> b!1263791 (= e!719502 e!719506)))

(assert (=> b!1263791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun res!841602 () Bool)

(assert (=> b!1263791 (= res!841602 (contains!7618 lt!572750 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263791 (=> (not res!841602) (not e!719506))))

(declare-fun b!1263792 () Bool)

(declare-fun res!841604 () Bool)

(assert (=> b!1263792 (=> (not res!841604) (not e!719508))))

(assert (=> b!1263792 (= res!841604 (not (contains!7618 lt!572750 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!62141 () Bool)

(assert (=> bm!62141 (= call!62144 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138995 () Bool)

(assert (=> d!138995 e!719508))

(declare-fun res!841603 () Bool)

(assert (=> d!138995 (=> (not res!841603) (not e!719508))))

(assert (=> d!138995 (= res!841603 (not (contains!7618 lt!572750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138995 (= lt!572750 e!719507)))

(declare-fun c!123220 () Bool)

(assert (=> d!138995 (= c!123220 (bvsge #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(assert (=> d!138995 (validMask!0 mask!1466)))

(assert (=> d!138995 (= (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572750)))

(declare-fun b!1263784 () Bool)

(assert (=> b!1263784 (= e!719507 (ListLongMap!18928 Nil!28266))))

(declare-fun b!1263793 () Bool)

(assert (=> b!1263793 (= e!719502 e!719505)))

(declare-fun c!123223 () Bool)

(assert (=> b!1263793 (= c!123223 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263794 () Bool)

(assert (=> b!1263794 (= e!719503 call!62144)))

(assert (= (and d!138995 c!123220) b!1263784))

(assert (= (and d!138995 (not c!123220)) b!1263790))

(assert (= (and b!1263790 c!123221) b!1263788))

(assert (= (and b!1263790 (not c!123221)) b!1263794))

(assert (= (or b!1263788 b!1263794) bm!62141))

(assert (= (and d!138995 res!841603) b!1263792))

(assert (= (and b!1263792 res!841604) b!1263783))

(assert (= (and b!1263783 res!841605) b!1263787))

(assert (= (and b!1263783 c!123222) b!1263791))

(assert (= (and b!1263783 (not c!123222)) b!1263793))

(assert (= (and b!1263791 res!841602) b!1263785))

(assert (= (and b!1263793 c!123223) b!1263786))

(assert (= (and b!1263793 (not c!123223)) b!1263789))

(declare-fun b_lambda!22869 () Bool)

(assert (=> (not b_lambda!22869) (not b!1263785)))

(declare-fun t!41773 () Bool)

(declare-fun tb!11315 () Bool)

(assert (=> (and start!106228 (= defaultEntry!922 defaultEntry!922) t!41773) tb!11315))

(declare-fun result!23369 () Bool)

(assert (=> tb!11315 (= result!23369 tp_is_empty!32377)))

(assert (=> b!1263785 t!41773))

(declare-fun b_and!45433 () Bool)

(assert (= b_and!45427 (and (=> t!41773 result!23369) b_and!45433)))

(declare-fun b_lambda!22871 () Bool)

(assert (=> (not b_lambda!22871) (not b!1263788)))

(assert (=> b!1263788 t!41773))

(declare-fun b_and!45435 () Bool)

(assert (= b_and!45433 (and (=> t!41773 result!23369) b_and!45435)))

(declare-fun m!1164591 () Bool)

(assert (=> b!1263789 m!1164591))

(assert (=> b!1263787 m!1164579))

(assert (=> b!1263787 m!1164579))

(assert (=> b!1263787 m!1164587))

(declare-fun m!1164593 () Bool)

(assert (=> b!1263792 m!1164593))

(declare-fun m!1164595 () Bool)

(assert (=> b!1263786 m!1164595))

(assert (=> bm!62141 m!1164595))

(assert (=> b!1263791 m!1164579))

(assert (=> b!1263791 m!1164579))

(declare-fun m!1164597 () Bool)

(assert (=> b!1263791 m!1164597))

(assert (=> b!1263790 m!1164579))

(assert (=> b!1263790 m!1164579))

(assert (=> b!1263790 m!1164587))

(declare-fun m!1164599 () Bool)

(assert (=> b!1263785 m!1164599))

(declare-fun m!1164601 () Bool)

(assert (=> b!1263785 m!1164601))

(assert (=> b!1263785 m!1164579))

(declare-fun m!1164603 () Bool)

(assert (=> b!1263785 m!1164603))

(assert (=> b!1263785 m!1164601))

(assert (=> b!1263785 m!1164599))

(declare-fun m!1164605 () Bool)

(assert (=> b!1263785 m!1164605))

(assert (=> b!1263785 m!1164579))

(declare-fun m!1164607 () Bool)

(assert (=> d!138995 m!1164607))

(assert (=> d!138995 m!1164515))

(assert (=> b!1263788 m!1164599))

(assert (=> b!1263788 m!1164601))

(declare-fun m!1164609 () Bool)

(assert (=> b!1263788 m!1164609))

(declare-fun m!1164611 () Bool)

(assert (=> b!1263788 m!1164611))

(assert (=> b!1263788 m!1164609))

(declare-fun m!1164613 () Bool)

(assert (=> b!1263788 m!1164613))

(declare-fun m!1164615 () Bool)

(assert (=> b!1263788 m!1164615))

(assert (=> b!1263788 m!1164601))

(assert (=> b!1263788 m!1164599))

(assert (=> b!1263788 m!1164605))

(assert (=> b!1263788 m!1164579))

(assert (=> b!1263679 d!138995))

(declare-fun b!1263797 () Bool)

(declare-fun e!719515 () Bool)

(declare-fun e!719509 () Bool)

(assert (=> b!1263797 (= e!719515 e!719509)))

(declare-fun c!123226 () Bool)

(declare-fun e!719511 () Bool)

(assert (=> b!1263797 (= c!123226 e!719511)))

(declare-fun res!841609 () Bool)

(assert (=> b!1263797 (=> (not res!841609) (not e!719511))))

(assert (=> b!1263797 (= res!841609 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263799 () Bool)

(assert (=> b!1263799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(assert (=> b!1263799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40291 _values!914)))))

(declare-fun lt!572757 () ListLongMap!18927)

(declare-fun e!719513 () Bool)

(assert (=> b!1263799 (= e!719513 (= (apply!1007 lt!572757 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)) (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!719512 () Bool)

(declare-fun b!1263800 () Bool)

(assert (=> b!1263800 (= e!719512 (= lt!572757 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263801 () Bool)

(assert (=> b!1263801 (= e!719511 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263801 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263802 () Bool)

(declare-fun lt!572759 () Unit!42055)

(declare-fun lt!572756 () Unit!42055)

(assert (=> b!1263802 (= lt!572759 lt!572756)))

(declare-fun lt!572760 () (_ BitVec 64))

(declare-fun lt!572762 () (_ BitVec 64))

(declare-fun lt!572761 () V!48535)

(declare-fun lt!572758 () ListLongMap!18927)

(assert (=> b!1263802 (not (contains!7618 (+!4291 lt!572758 (tuple2!21047 lt!572760 lt!572761)) lt!572762))))

(assert (=> b!1263802 (= lt!572756 (addStillNotContains!328 lt!572758 lt!572760 lt!572761 lt!572762))))

(assert (=> b!1263802 (= lt!572762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263802 (= lt!572761 (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263802 (= lt!572760 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62145 () ListLongMap!18927)

(assert (=> b!1263802 (= lt!572758 call!62145)))

(declare-fun e!719510 () ListLongMap!18927)

(assert (=> b!1263802 (= e!719510 (+!4291 call!62145 (tuple2!21047 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000) (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263803 () Bool)

(assert (=> b!1263803 (= e!719512 (isEmpty!1044 lt!572757))))

(declare-fun b!1263804 () Bool)

(declare-fun e!719514 () ListLongMap!18927)

(assert (=> b!1263804 (= e!719514 e!719510)))

(declare-fun c!123225 () Bool)

(assert (=> b!1263804 (= c!123225 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263805 () Bool)

(assert (=> b!1263805 (= e!719509 e!719513)))

(assert (=> b!1263805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun res!841606 () Bool)

(assert (=> b!1263805 (= res!841606 (contains!7618 lt!572757 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263805 (=> (not res!841606) (not e!719513))))

(declare-fun b!1263806 () Bool)

(declare-fun res!841608 () Bool)

(assert (=> b!1263806 (=> (not res!841608) (not e!719515))))

(assert (=> b!1263806 (= res!841608 (not (contains!7618 lt!572757 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!62142 () Bool)

(assert (=> bm!62142 (= call!62145 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138997 () Bool)

(assert (=> d!138997 e!719515))

(declare-fun res!841607 () Bool)

(assert (=> d!138997 (=> (not res!841607) (not e!719515))))

(assert (=> d!138997 (= res!841607 (not (contains!7618 lt!572757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138997 (= lt!572757 e!719514)))

(declare-fun c!123224 () Bool)

(assert (=> d!138997 (= c!123224 (bvsge #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(assert (=> d!138997 (validMask!0 mask!1466)))

(assert (=> d!138997 (= (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572757)))

(declare-fun b!1263798 () Bool)

(assert (=> b!1263798 (= e!719514 (ListLongMap!18928 Nil!28266))))

(declare-fun b!1263807 () Bool)

(assert (=> b!1263807 (= e!719509 e!719512)))

(declare-fun c!123227 () Bool)

(assert (=> b!1263807 (= c!123227 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263808 () Bool)

(assert (=> b!1263808 (= e!719510 call!62145)))

(assert (= (and d!138997 c!123224) b!1263798))

(assert (= (and d!138997 (not c!123224)) b!1263804))

(assert (= (and b!1263804 c!123225) b!1263802))

(assert (= (and b!1263804 (not c!123225)) b!1263808))

(assert (= (or b!1263802 b!1263808) bm!62142))

(assert (= (and d!138997 res!841607) b!1263806))

(assert (= (and b!1263806 res!841608) b!1263797))

(assert (= (and b!1263797 res!841609) b!1263801))

(assert (= (and b!1263797 c!123226) b!1263805))

(assert (= (and b!1263797 (not c!123226)) b!1263807))

(assert (= (and b!1263805 res!841606) b!1263799))

(assert (= (and b!1263807 c!123227) b!1263800))

(assert (= (and b!1263807 (not c!123227)) b!1263803))

(declare-fun b_lambda!22873 () Bool)

(assert (=> (not b_lambda!22873) (not b!1263799)))

(assert (=> b!1263799 t!41773))

(declare-fun b_and!45437 () Bool)

(assert (= b_and!45435 (and (=> t!41773 result!23369) b_and!45437)))

(declare-fun b_lambda!22875 () Bool)

(assert (=> (not b_lambda!22875) (not b!1263802)))

(assert (=> b!1263802 t!41773))

(declare-fun b_and!45439 () Bool)

(assert (= b_and!45437 (and (=> t!41773 result!23369) b_and!45439)))

(declare-fun m!1164617 () Bool)

(assert (=> b!1263803 m!1164617))

(assert (=> b!1263801 m!1164579))

(assert (=> b!1263801 m!1164579))

(assert (=> b!1263801 m!1164587))

(declare-fun m!1164619 () Bool)

(assert (=> b!1263806 m!1164619))

(declare-fun m!1164621 () Bool)

(assert (=> b!1263800 m!1164621))

(assert (=> bm!62142 m!1164621))

(assert (=> b!1263805 m!1164579))

(assert (=> b!1263805 m!1164579))

(declare-fun m!1164623 () Bool)

(assert (=> b!1263805 m!1164623))

(assert (=> b!1263804 m!1164579))

(assert (=> b!1263804 m!1164579))

(assert (=> b!1263804 m!1164587))

(assert (=> b!1263799 m!1164599))

(assert (=> b!1263799 m!1164601))

(assert (=> b!1263799 m!1164579))

(declare-fun m!1164625 () Bool)

(assert (=> b!1263799 m!1164625))

(assert (=> b!1263799 m!1164601))

(assert (=> b!1263799 m!1164599))

(assert (=> b!1263799 m!1164605))

(assert (=> b!1263799 m!1164579))

(declare-fun m!1164627 () Bool)

(assert (=> d!138997 m!1164627))

(assert (=> d!138997 m!1164515))

(assert (=> b!1263802 m!1164599))

(assert (=> b!1263802 m!1164601))

(declare-fun m!1164629 () Bool)

(assert (=> b!1263802 m!1164629))

(declare-fun m!1164631 () Bool)

(assert (=> b!1263802 m!1164631))

(assert (=> b!1263802 m!1164629))

(declare-fun m!1164633 () Bool)

(assert (=> b!1263802 m!1164633))

(declare-fun m!1164635 () Bool)

(assert (=> b!1263802 m!1164635))

(assert (=> b!1263802 m!1164601))

(assert (=> b!1263802 m!1164599))

(assert (=> b!1263802 m!1164605))

(assert (=> b!1263802 m!1164579))

(assert (=> b!1263679 d!138997))

(declare-fun b!1263819 () Bool)

(declare-fun e!719525 () Bool)

(declare-fun call!62148 () Bool)

(assert (=> b!1263819 (= e!719525 call!62148)))

(declare-fun b!1263820 () Bool)

(declare-fun e!719527 () Bool)

(declare-fun contains!7619 (List!28270 (_ BitVec 64)) Bool)

(assert (=> b!1263820 (= e!719527 (contains!7619 Nil!28267 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263821 () Bool)

(declare-fun e!719524 () Bool)

(declare-fun e!719526 () Bool)

(assert (=> b!1263821 (= e!719524 e!719526)))

(declare-fun res!841616 () Bool)

(assert (=> b!1263821 (=> (not res!841616) (not e!719526))))

(assert (=> b!1263821 (= res!841616 (not e!719527))))

(declare-fun res!841617 () Bool)

(assert (=> b!1263821 (=> (not res!841617) (not e!719527))))

(assert (=> b!1263821 (= res!841617 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263822 () Bool)

(assert (=> b!1263822 (= e!719526 e!719525)))

(declare-fun c!123230 () Bool)

(assert (=> b!1263822 (= c!123230 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138999 () Bool)

(declare-fun res!841618 () Bool)

(assert (=> d!138999 (=> res!841618 e!719524)))

(assert (=> d!138999 (= res!841618 (bvsge #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(assert (=> d!138999 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28267) e!719524)))

(declare-fun b!1263823 () Bool)

(assert (=> b!1263823 (= e!719525 call!62148)))

(declare-fun bm!62145 () Bool)

(assert (=> bm!62145 (= call!62148 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123230 (Cons!28266 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000) Nil!28267) Nil!28267)))))

(assert (= (and d!138999 (not res!841618)) b!1263821))

(assert (= (and b!1263821 res!841617) b!1263820))

(assert (= (and b!1263821 res!841616) b!1263822))

(assert (= (and b!1263822 c!123230) b!1263819))

(assert (= (and b!1263822 (not c!123230)) b!1263823))

(assert (= (or b!1263819 b!1263823) bm!62145))

(assert (=> b!1263820 m!1164579))

(assert (=> b!1263820 m!1164579))

(declare-fun m!1164637 () Bool)

(assert (=> b!1263820 m!1164637))

(assert (=> b!1263821 m!1164579))

(assert (=> b!1263821 m!1164579))

(assert (=> b!1263821 m!1164587))

(assert (=> b!1263822 m!1164579))

(assert (=> b!1263822 m!1164579))

(assert (=> b!1263822 m!1164587))

(assert (=> bm!62145 m!1164579))

(declare-fun m!1164639 () Bool)

(assert (=> bm!62145 m!1164639))

(assert (=> b!1263685 d!138999))

(declare-fun e!719563 () Bool)

(declare-fun b!1263866 () Bool)

(declare-fun lt!572826 () ListLongMap!18927)

(assert (=> b!1263866 (= e!719563 (= (apply!1007 lt!572826 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)) (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40291 _values!914)))))

(assert (=> b!1263866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263867 () Bool)

(declare-fun e!719555 () ListLongMap!18927)

(declare-fun call!62166 () ListLongMap!18927)

(assert (=> b!1263867 (= e!719555 call!62166)))

(declare-fun d!139001 () Bool)

(declare-fun e!719565 () Bool)

(assert (=> d!139001 e!719565))

(declare-fun res!841639 () Bool)

(assert (=> d!139001 (=> (not res!841639) (not e!719565))))

(assert (=> d!139001 (= res!841639 (or (bvsge #b00000000000000000000000000000000 (size!40290 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))))

(declare-fun lt!572821 () ListLongMap!18927)

(assert (=> d!139001 (= lt!572826 lt!572821)))

(declare-fun lt!572808 () Unit!42055)

(declare-fun e!719554 () Unit!42055)

(assert (=> d!139001 (= lt!572808 e!719554)))

(declare-fun c!123245 () Bool)

(declare-fun e!719564 () Bool)

(assert (=> d!139001 (= c!123245 e!719564)))

(declare-fun res!841638 () Bool)

(assert (=> d!139001 (=> (not res!841638) (not e!719564))))

(assert (=> d!139001 (= res!841638 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun e!719556 () ListLongMap!18927)

(assert (=> d!139001 (= lt!572821 e!719556)))

(declare-fun c!123244 () Bool)

(assert (=> d!139001 (= c!123244 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139001 (validMask!0 mask!1466)))

(assert (=> d!139001 (= (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572826)))

(declare-fun b!1263868 () Bool)

(declare-fun e!719558 () Bool)

(assert (=> b!1263868 (= e!719558 (= (apply!1007 lt!572826 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263869 () Bool)

(declare-fun res!841637 () Bool)

(assert (=> b!1263869 (=> (not res!841637) (not e!719565))))

(declare-fun e!719559 () Bool)

(assert (=> b!1263869 (= res!841637 e!719559)))

(declare-fun c!123243 () Bool)

(assert (=> b!1263869 (= c!123243 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263870 () Bool)

(assert (=> b!1263870 (= e!719556 e!719555)))

(declare-fun c!123248 () Bool)

(assert (=> b!1263870 (= c!123248 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263871 () Bool)

(declare-fun res!841641 () Bool)

(assert (=> b!1263871 (=> (not res!841641) (not e!719565))))

(declare-fun e!719560 () Bool)

(assert (=> b!1263871 (= res!841641 e!719560)))

(declare-fun res!841645 () Bool)

(assert (=> b!1263871 (=> res!841645 e!719560)))

(declare-fun e!719561 () Bool)

(assert (=> b!1263871 (= res!841645 (not e!719561))))

(declare-fun res!841643 () Bool)

(assert (=> b!1263871 (=> (not res!841643) (not e!719561))))

(assert (=> b!1263871 (= res!841643 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun call!62163 () ListLongMap!18927)

(declare-fun call!62169 () ListLongMap!18927)

(declare-fun call!62164 () ListLongMap!18927)

(declare-fun bm!62160 () Bool)

(declare-fun call!62167 () ListLongMap!18927)

(assert (=> bm!62160 (= call!62167 (+!4291 (ite c!123244 call!62164 (ite c!123248 call!62163 call!62169)) (ite (or c!123244 c!123248) (tuple2!21047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun bm!62161 () Bool)

(declare-fun call!62168 () Bool)

(assert (=> bm!62161 (= call!62168 (contains!7618 lt!572826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263872 () Bool)

(declare-fun e!719566 () Bool)

(assert (=> b!1263872 (= e!719566 (= (apply!1007 lt!572826 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62162 () Bool)

(assert (=> bm!62162 (= call!62164 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263873 () Bool)

(assert (=> b!1263873 (= e!719560 e!719563)))

(declare-fun res!841640 () Bool)

(assert (=> b!1263873 (=> (not res!841640) (not e!719563))))

(assert (=> b!1263873 (= res!841640 (contains!7618 lt!572826 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263874 () Bool)

(declare-fun e!719557 () Bool)

(assert (=> b!1263874 (= e!719557 e!719558)))

(declare-fun res!841644 () Bool)

(declare-fun call!62165 () Bool)

(assert (=> b!1263874 (= res!841644 call!62165)))

(assert (=> b!1263874 (=> (not res!841644) (not e!719558))))

(declare-fun b!1263875 () Bool)

(assert (=> b!1263875 (= e!719565 e!719557)))

(declare-fun c!123247 () Bool)

(assert (=> b!1263875 (= c!123247 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62163 () Bool)

(assert (=> bm!62163 (= call!62163 call!62164)))

(declare-fun b!1263876 () Bool)

(assert (=> b!1263876 (= e!719559 (not call!62168))))

(declare-fun b!1263877 () Bool)

(assert (=> b!1263877 (= e!719559 e!719566)))

(declare-fun res!841642 () Bool)

(assert (=> b!1263877 (= res!841642 call!62168)))

(assert (=> b!1263877 (=> (not res!841642) (not e!719566))))

(declare-fun bm!62164 () Bool)

(assert (=> bm!62164 (= call!62169 call!62163)))

(declare-fun b!1263878 () Bool)

(declare-fun c!123246 () Bool)

(assert (=> b!1263878 (= c!123246 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719562 () ListLongMap!18927)

(assert (=> b!1263878 (= e!719555 e!719562)))

(declare-fun b!1263879 () Bool)

(assert (=> b!1263879 (= e!719556 (+!4291 call!62167 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263880 () Bool)

(assert (=> b!1263880 (= e!719564 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263881 () Bool)

(assert (=> b!1263881 (= e!719562 call!62169)))

(declare-fun b!1263882 () Bool)

(declare-fun lt!572815 () Unit!42055)

(assert (=> b!1263882 (= e!719554 lt!572815)))

(declare-fun lt!572811 () ListLongMap!18927)

(assert (=> b!1263882 (= lt!572811 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572828 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572820 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572820 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572807 () Unit!42055)

(declare-fun addStillContains!1096 (ListLongMap!18927 (_ BitVec 64) V!48535 (_ BitVec 64)) Unit!42055)

(assert (=> b!1263882 (= lt!572807 (addStillContains!1096 lt!572811 lt!572828 zeroValue!871 lt!572820))))

(assert (=> b!1263882 (contains!7618 (+!4291 lt!572811 (tuple2!21047 lt!572828 zeroValue!871)) lt!572820)))

(declare-fun lt!572819 () Unit!42055)

(assert (=> b!1263882 (= lt!572819 lt!572807)))

(declare-fun lt!572822 () ListLongMap!18927)

(assert (=> b!1263882 (= lt!572822 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572809 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572816 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572816 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572824 () Unit!42055)

(declare-fun addApplyDifferent!538 (ListLongMap!18927 (_ BitVec 64) V!48535 (_ BitVec 64)) Unit!42055)

(assert (=> b!1263882 (= lt!572824 (addApplyDifferent!538 lt!572822 lt!572809 minValueAfter!43 lt!572816))))

(assert (=> b!1263882 (= (apply!1007 (+!4291 lt!572822 (tuple2!21047 lt!572809 minValueAfter!43)) lt!572816) (apply!1007 lt!572822 lt!572816))))

(declare-fun lt!572818 () Unit!42055)

(assert (=> b!1263882 (= lt!572818 lt!572824)))

(declare-fun lt!572827 () ListLongMap!18927)

(assert (=> b!1263882 (= lt!572827 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572813 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572812 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572812 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572825 () Unit!42055)

(assert (=> b!1263882 (= lt!572825 (addApplyDifferent!538 lt!572827 lt!572813 zeroValue!871 lt!572812))))

(assert (=> b!1263882 (= (apply!1007 (+!4291 lt!572827 (tuple2!21047 lt!572813 zeroValue!871)) lt!572812) (apply!1007 lt!572827 lt!572812))))

(declare-fun lt!572810 () Unit!42055)

(assert (=> b!1263882 (= lt!572810 lt!572825)))

(declare-fun lt!572814 () ListLongMap!18927)

(assert (=> b!1263882 (= lt!572814 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572817 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572817 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572823 () (_ BitVec 64))

(assert (=> b!1263882 (= lt!572823 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263882 (= lt!572815 (addApplyDifferent!538 lt!572814 lt!572817 minValueAfter!43 lt!572823))))

(assert (=> b!1263882 (= (apply!1007 (+!4291 lt!572814 (tuple2!21047 lt!572817 minValueAfter!43)) lt!572823) (apply!1007 lt!572814 lt!572823))))

(declare-fun bm!62165 () Bool)

(assert (=> bm!62165 (= call!62165 (contains!7618 lt!572826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263883 () Bool)

(assert (=> b!1263883 (= e!719557 (not call!62165))))

(declare-fun b!1263884 () Bool)

(declare-fun Unit!42059 () Unit!42055)

(assert (=> b!1263884 (= e!719554 Unit!42059)))

(declare-fun b!1263885 () Bool)

(assert (=> b!1263885 (= e!719562 call!62166)))

(declare-fun bm!62166 () Bool)

(assert (=> bm!62166 (= call!62166 call!62167)))

(declare-fun b!1263886 () Bool)

(assert (=> b!1263886 (= e!719561 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!139001 c!123244) b!1263879))

(assert (= (and d!139001 (not c!123244)) b!1263870))

(assert (= (and b!1263870 c!123248) b!1263867))

(assert (= (and b!1263870 (not c!123248)) b!1263878))

(assert (= (and b!1263878 c!123246) b!1263885))

(assert (= (and b!1263878 (not c!123246)) b!1263881))

(assert (= (or b!1263885 b!1263881) bm!62164))

(assert (= (or b!1263867 bm!62164) bm!62163))

(assert (= (or b!1263867 b!1263885) bm!62166))

(assert (= (or b!1263879 bm!62163) bm!62162))

(assert (= (or b!1263879 bm!62166) bm!62160))

(assert (= (and d!139001 res!841638) b!1263880))

(assert (= (and d!139001 c!123245) b!1263882))

(assert (= (and d!139001 (not c!123245)) b!1263884))

(assert (= (and d!139001 res!841639) b!1263871))

(assert (= (and b!1263871 res!841643) b!1263886))

(assert (= (and b!1263871 (not res!841645)) b!1263873))

(assert (= (and b!1263873 res!841640) b!1263866))

(assert (= (and b!1263871 res!841641) b!1263869))

(assert (= (and b!1263869 c!123243) b!1263877))

(assert (= (and b!1263869 (not c!123243)) b!1263876))

(assert (= (and b!1263877 res!841642) b!1263872))

(assert (= (or b!1263877 b!1263876) bm!62161))

(assert (= (and b!1263869 res!841637) b!1263875))

(assert (= (and b!1263875 c!123247) b!1263874))

(assert (= (and b!1263875 (not c!123247)) b!1263883))

(assert (= (and b!1263874 res!841644) b!1263868))

(assert (= (or b!1263874 b!1263883) bm!62165))

(declare-fun b_lambda!22877 () Bool)

(assert (=> (not b_lambda!22877) (not b!1263866)))

(assert (=> b!1263866 t!41773))

(declare-fun b_and!45441 () Bool)

(assert (= b_and!45439 (and (=> t!41773 result!23369) b_and!45441)))

(declare-fun m!1164641 () Bool)

(assert (=> b!1263882 m!1164641))

(declare-fun m!1164643 () Bool)

(assert (=> b!1263882 m!1164643))

(declare-fun m!1164645 () Bool)

(assert (=> b!1263882 m!1164645))

(declare-fun m!1164647 () Bool)

(assert (=> b!1263882 m!1164647))

(declare-fun m!1164649 () Bool)

(assert (=> b!1263882 m!1164649))

(declare-fun m!1164651 () Bool)

(assert (=> b!1263882 m!1164651))

(declare-fun m!1164653 () Bool)

(assert (=> b!1263882 m!1164653))

(declare-fun m!1164655 () Bool)

(assert (=> b!1263882 m!1164655))

(declare-fun m!1164657 () Bool)

(assert (=> b!1263882 m!1164657))

(declare-fun m!1164659 () Bool)

(assert (=> b!1263882 m!1164659))

(declare-fun m!1164661 () Bool)

(assert (=> b!1263882 m!1164661))

(declare-fun m!1164663 () Bool)

(assert (=> b!1263882 m!1164663))

(assert (=> b!1263882 m!1164579))

(declare-fun m!1164665 () Bool)

(assert (=> b!1263882 m!1164665))

(assert (=> b!1263882 m!1164507))

(assert (=> b!1263882 m!1164653))

(assert (=> b!1263882 m!1164643))

(declare-fun m!1164667 () Bool)

(assert (=> b!1263882 m!1164667))

(assert (=> b!1263882 m!1164661))

(assert (=> b!1263882 m!1164647))

(declare-fun m!1164669 () Bool)

(assert (=> b!1263882 m!1164669))

(assert (=> b!1263866 m!1164599))

(assert (=> b!1263866 m!1164601))

(assert (=> b!1263866 m!1164579))

(declare-fun m!1164671 () Bool)

(assert (=> b!1263866 m!1164671))

(assert (=> b!1263866 m!1164579))

(assert (=> b!1263866 m!1164601))

(assert (=> b!1263866 m!1164599))

(assert (=> b!1263866 m!1164605))

(declare-fun m!1164673 () Bool)

(assert (=> b!1263872 m!1164673))

(declare-fun m!1164675 () Bool)

(assert (=> bm!62165 m!1164675))

(declare-fun m!1164677 () Bool)

(assert (=> bm!62161 m!1164677))

(declare-fun m!1164679 () Bool)

(assert (=> b!1263868 m!1164679))

(assert (=> bm!62162 m!1164507))

(assert (=> b!1263873 m!1164579))

(assert (=> b!1263873 m!1164579))

(declare-fun m!1164681 () Bool)

(assert (=> b!1263873 m!1164681))

(assert (=> d!139001 m!1164515))

(declare-fun m!1164683 () Bool)

(assert (=> b!1263879 m!1164683))

(assert (=> b!1263886 m!1164579))

(assert (=> b!1263886 m!1164579))

(assert (=> b!1263886 m!1164587))

(assert (=> b!1263880 m!1164579))

(assert (=> b!1263880 m!1164579))

(assert (=> b!1263880 m!1164587))

(declare-fun m!1164685 () Bool)

(assert (=> bm!62160 m!1164685))

(assert (=> b!1263681 d!139001))

(declare-fun b!1263887 () Bool)

(declare-fun lt!572848 () ListLongMap!18927)

(declare-fun e!719576 () Bool)

(assert (=> b!1263887 (= e!719576 (= (apply!1007 lt!572848 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)) (get!20326 (select (arr!39754 _values!914) #b00000000000000000000000000000000) (dynLambda!3459 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40291 _values!914)))))

(assert (=> b!1263887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263888 () Bool)

(declare-fun e!719568 () ListLongMap!18927)

(declare-fun call!62173 () ListLongMap!18927)

(assert (=> b!1263888 (= e!719568 call!62173)))

(declare-fun d!139003 () Bool)

(declare-fun e!719578 () Bool)

(assert (=> d!139003 e!719578))

(declare-fun res!841648 () Bool)

(assert (=> d!139003 (=> (not res!841648) (not e!719578))))

(assert (=> d!139003 (= res!841648 (or (bvsge #b00000000000000000000000000000000 (size!40290 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))))

(declare-fun lt!572843 () ListLongMap!18927)

(assert (=> d!139003 (= lt!572848 lt!572843)))

(declare-fun lt!572830 () Unit!42055)

(declare-fun e!719567 () Unit!42055)

(assert (=> d!139003 (= lt!572830 e!719567)))

(declare-fun c!123251 () Bool)

(declare-fun e!719577 () Bool)

(assert (=> d!139003 (= c!123251 e!719577)))

(declare-fun res!841647 () Bool)

(assert (=> d!139003 (=> (not res!841647) (not e!719577))))

(assert (=> d!139003 (= res!841647 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun e!719569 () ListLongMap!18927)

(assert (=> d!139003 (= lt!572843 e!719569)))

(declare-fun c!123250 () Bool)

(assert (=> d!139003 (= c!123250 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139003 (validMask!0 mask!1466)))

(assert (=> d!139003 (= (getCurrentListMap!4632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572848)))

(declare-fun b!1263889 () Bool)

(declare-fun e!719571 () Bool)

(assert (=> b!1263889 (= e!719571 (= (apply!1007 lt!572848 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263890 () Bool)

(declare-fun res!841646 () Bool)

(assert (=> b!1263890 (=> (not res!841646) (not e!719578))))

(declare-fun e!719572 () Bool)

(assert (=> b!1263890 (= res!841646 e!719572)))

(declare-fun c!123249 () Bool)

(assert (=> b!1263890 (= c!123249 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263891 () Bool)

(assert (=> b!1263891 (= e!719569 e!719568)))

(declare-fun c!123254 () Bool)

(assert (=> b!1263891 (= c!123254 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263892 () Bool)

(declare-fun res!841650 () Bool)

(assert (=> b!1263892 (=> (not res!841650) (not e!719578))))

(declare-fun e!719573 () Bool)

(assert (=> b!1263892 (= res!841650 e!719573)))

(declare-fun res!841654 () Bool)

(assert (=> b!1263892 (=> res!841654 e!719573)))

(declare-fun e!719574 () Bool)

(assert (=> b!1263892 (= res!841654 (not e!719574))))

(declare-fun res!841652 () Bool)

(assert (=> b!1263892 (=> (not res!841652) (not e!719574))))

(assert (=> b!1263892 (= res!841652 (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun bm!62167 () Bool)

(declare-fun call!62174 () ListLongMap!18927)

(declare-fun call!62170 () ListLongMap!18927)

(declare-fun call!62176 () ListLongMap!18927)

(declare-fun call!62171 () ListLongMap!18927)

(assert (=> bm!62167 (= call!62174 (+!4291 (ite c!123250 call!62171 (ite c!123254 call!62170 call!62176)) (ite (or c!123250 c!123254) (tuple2!21047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62168 () Bool)

(declare-fun call!62175 () Bool)

(assert (=> bm!62168 (= call!62175 (contains!7618 lt!572848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263893 () Bool)

(declare-fun e!719579 () Bool)

(assert (=> b!1263893 (= e!719579 (= (apply!1007 lt!572848 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62169 () Bool)

(assert (=> bm!62169 (= call!62171 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263894 () Bool)

(assert (=> b!1263894 (= e!719573 e!719576)))

(declare-fun res!841649 () Bool)

(assert (=> b!1263894 (=> (not res!841649) (not e!719576))))

(assert (=> b!1263894 (= res!841649 (contains!7618 lt!572848 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263894 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40290 _keys!1118)))))

(declare-fun b!1263895 () Bool)

(declare-fun e!719570 () Bool)

(assert (=> b!1263895 (= e!719570 e!719571)))

(declare-fun res!841653 () Bool)

(declare-fun call!62172 () Bool)

(assert (=> b!1263895 (= res!841653 call!62172)))

(assert (=> b!1263895 (=> (not res!841653) (not e!719571))))

(declare-fun b!1263896 () Bool)

(assert (=> b!1263896 (= e!719578 e!719570)))

(declare-fun c!123253 () Bool)

(assert (=> b!1263896 (= c!123253 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62170 () Bool)

(assert (=> bm!62170 (= call!62170 call!62171)))

(declare-fun b!1263897 () Bool)

(assert (=> b!1263897 (= e!719572 (not call!62175))))

(declare-fun b!1263898 () Bool)

(assert (=> b!1263898 (= e!719572 e!719579)))

(declare-fun res!841651 () Bool)

(assert (=> b!1263898 (= res!841651 call!62175)))

(assert (=> b!1263898 (=> (not res!841651) (not e!719579))))

(declare-fun bm!62171 () Bool)

(assert (=> bm!62171 (= call!62176 call!62170)))

(declare-fun b!1263899 () Bool)

(declare-fun c!123252 () Bool)

(assert (=> b!1263899 (= c!123252 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719575 () ListLongMap!18927)

(assert (=> b!1263899 (= e!719568 e!719575)))

(declare-fun b!1263900 () Bool)

(assert (=> b!1263900 (= e!719569 (+!4291 call!62174 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263901 () Bool)

(assert (=> b!1263901 (= e!719577 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263902 () Bool)

(assert (=> b!1263902 (= e!719575 call!62176)))

(declare-fun b!1263903 () Bool)

(declare-fun lt!572837 () Unit!42055)

(assert (=> b!1263903 (= e!719567 lt!572837)))

(declare-fun lt!572833 () ListLongMap!18927)

(assert (=> b!1263903 (= lt!572833 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572850 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572842 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572842 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572829 () Unit!42055)

(assert (=> b!1263903 (= lt!572829 (addStillContains!1096 lt!572833 lt!572850 zeroValue!871 lt!572842))))

(assert (=> b!1263903 (contains!7618 (+!4291 lt!572833 (tuple2!21047 lt!572850 zeroValue!871)) lt!572842)))

(declare-fun lt!572841 () Unit!42055)

(assert (=> b!1263903 (= lt!572841 lt!572829)))

(declare-fun lt!572844 () ListLongMap!18927)

(assert (=> b!1263903 (= lt!572844 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572831 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572838 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572838 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572846 () Unit!42055)

(assert (=> b!1263903 (= lt!572846 (addApplyDifferent!538 lt!572844 lt!572831 minValueBefore!43 lt!572838))))

(assert (=> b!1263903 (= (apply!1007 (+!4291 lt!572844 (tuple2!21047 lt!572831 minValueBefore!43)) lt!572838) (apply!1007 lt!572844 lt!572838))))

(declare-fun lt!572840 () Unit!42055)

(assert (=> b!1263903 (= lt!572840 lt!572846)))

(declare-fun lt!572849 () ListLongMap!18927)

(assert (=> b!1263903 (= lt!572849 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572835 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572835 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572834 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572834 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572847 () Unit!42055)

(assert (=> b!1263903 (= lt!572847 (addApplyDifferent!538 lt!572849 lt!572835 zeroValue!871 lt!572834))))

(assert (=> b!1263903 (= (apply!1007 (+!4291 lt!572849 (tuple2!21047 lt!572835 zeroValue!871)) lt!572834) (apply!1007 lt!572849 lt!572834))))

(declare-fun lt!572832 () Unit!42055)

(assert (=> b!1263903 (= lt!572832 lt!572847)))

(declare-fun lt!572836 () ListLongMap!18927)

(assert (=> b!1263903 (= lt!572836 (getCurrentListMapNoExtraKeys!5883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572839 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572845 () (_ BitVec 64))

(assert (=> b!1263903 (= lt!572845 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263903 (= lt!572837 (addApplyDifferent!538 lt!572836 lt!572839 minValueBefore!43 lt!572845))))

(assert (=> b!1263903 (= (apply!1007 (+!4291 lt!572836 (tuple2!21047 lt!572839 minValueBefore!43)) lt!572845) (apply!1007 lt!572836 lt!572845))))

(declare-fun bm!62172 () Bool)

(assert (=> bm!62172 (= call!62172 (contains!7618 lt!572848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263904 () Bool)

(assert (=> b!1263904 (= e!719570 (not call!62172))))

(declare-fun b!1263905 () Bool)

(declare-fun Unit!42060 () Unit!42055)

(assert (=> b!1263905 (= e!719567 Unit!42060)))

(declare-fun b!1263906 () Bool)

(assert (=> b!1263906 (= e!719575 call!62173)))

(declare-fun bm!62173 () Bool)

(assert (=> bm!62173 (= call!62173 call!62174)))

(declare-fun b!1263907 () Bool)

(assert (=> b!1263907 (= e!719574 (validKeyInArray!0 (select (arr!39753 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!139003 c!123250) b!1263900))

(assert (= (and d!139003 (not c!123250)) b!1263891))

(assert (= (and b!1263891 c!123254) b!1263888))

(assert (= (and b!1263891 (not c!123254)) b!1263899))

(assert (= (and b!1263899 c!123252) b!1263906))

(assert (= (and b!1263899 (not c!123252)) b!1263902))

(assert (= (or b!1263906 b!1263902) bm!62171))

(assert (= (or b!1263888 bm!62171) bm!62170))

(assert (= (or b!1263888 b!1263906) bm!62173))

(assert (= (or b!1263900 bm!62170) bm!62169))

(assert (= (or b!1263900 bm!62173) bm!62167))

(assert (= (and d!139003 res!841647) b!1263901))

(assert (= (and d!139003 c!123251) b!1263903))

(assert (= (and d!139003 (not c!123251)) b!1263905))

(assert (= (and d!139003 res!841648) b!1263892))

(assert (= (and b!1263892 res!841652) b!1263907))

(assert (= (and b!1263892 (not res!841654)) b!1263894))

(assert (= (and b!1263894 res!841649) b!1263887))

(assert (= (and b!1263892 res!841650) b!1263890))

(assert (= (and b!1263890 c!123249) b!1263898))

(assert (= (and b!1263890 (not c!123249)) b!1263897))

(assert (= (and b!1263898 res!841651) b!1263893))

(assert (= (or b!1263898 b!1263897) bm!62168))

(assert (= (and b!1263890 res!841646) b!1263896))

(assert (= (and b!1263896 c!123253) b!1263895))

(assert (= (and b!1263896 (not c!123253)) b!1263904))

(assert (= (and b!1263895 res!841653) b!1263889))

(assert (= (or b!1263895 b!1263904) bm!62172))

(declare-fun b_lambda!22879 () Bool)

(assert (=> (not b_lambda!22879) (not b!1263887)))

(assert (=> b!1263887 t!41773))

(declare-fun b_and!45443 () Bool)

(assert (= b_and!45441 (and (=> t!41773 result!23369) b_and!45443)))

(declare-fun m!1164687 () Bool)

(assert (=> b!1263903 m!1164687))

(declare-fun m!1164689 () Bool)

(assert (=> b!1263903 m!1164689))

(declare-fun m!1164691 () Bool)

(assert (=> b!1263903 m!1164691))

(declare-fun m!1164693 () Bool)

(assert (=> b!1263903 m!1164693))

(declare-fun m!1164695 () Bool)

(assert (=> b!1263903 m!1164695))

(declare-fun m!1164697 () Bool)

(assert (=> b!1263903 m!1164697))

(declare-fun m!1164699 () Bool)

(assert (=> b!1263903 m!1164699))

(declare-fun m!1164701 () Bool)

(assert (=> b!1263903 m!1164701))

(declare-fun m!1164703 () Bool)

(assert (=> b!1263903 m!1164703))

(declare-fun m!1164705 () Bool)

(assert (=> b!1263903 m!1164705))

(declare-fun m!1164707 () Bool)

(assert (=> b!1263903 m!1164707))

(declare-fun m!1164709 () Bool)

(assert (=> b!1263903 m!1164709))

(assert (=> b!1263903 m!1164579))

(declare-fun m!1164711 () Bool)

(assert (=> b!1263903 m!1164711))

(assert (=> b!1263903 m!1164509))

(assert (=> b!1263903 m!1164699))

(assert (=> b!1263903 m!1164689))

(declare-fun m!1164713 () Bool)

(assert (=> b!1263903 m!1164713))

(assert (=> b!1263903 m!1164707))

(assert (=> b!1263903 m!1164693))

(declare-fun m!1164715 () Bool)

(assert (=> b!1263903 m!1164715))

(assert (=> b!1263887 m!1164599))

(assert (=> b!1263887 m!1164601))

(assert (=> b!1263887 m!1164579))

(declare-fun m!1164717 () Bool)

(assert (=> b!1263887 m!1164717))

(assert (=> b!1263887 m!1164579))

(assert (=> b!1263887 m!1164601))

(assert (=> b!1263887 m!1164599))

(assert (=> b!1263887 m!1164605))

(declare-fun m!1164719 () Bool)

(assert (=> b!1263893 m!1164719))

(declare-fun m!1164721 () Bool)

(assert (=> bm!62172 m!1164721))

(declare-fun m!1164723 () Bool)

(assert (=> bm!62168 m!1164723))

(declare-fun m!1164725 () Bool)

(assert (=> b!1263889 m!1164725))

(assert (=> bm!62169 m!1164509))

(assert (=> b!1263894 m!1164579))

(assert (=> b!1263894 m!1164579))

(declare-fun m!1164727 () Bool)

(assert (=> b!1263894 m!1164727))

(assert (=> d!139003 m!1164515))

(declare-fun m!1164729 () Bool)

(assert (=> b!1263900 m!1164729))

(assert (=> b!1263907 m!1164579))

(assert (=> b!1263907 m!1164579))

(assert (=> b!1263907 m!1164587))

(assert (=> b!1263901 m!1164579))

(assert (=> b!1263901 m!1164579))

(assert (=> b!1263901 m!1164587))

(declare-fun m!1164731 () Bool)

(assert (=> bm!62167 m!1164731))

(assert (=> b!1263677 d!139003))

(declare-fun d!139005 () Bool)

(declare-fun e!719582 () Bool)

(assert (=> d!139005 e!719582))

(declare-fun res!841660 () Bool)

(assert (=> d!139005 (=> (not res!841660) (not e!719582))))

(declare-fun lt!572861 () ListLongMap!18927)

(assert (=> d!139005 (= res!841660 (contains!7618 lt!572861 (_1!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572862 () List!28269)

(assert (=> d!139005 (= lt!572861 (ListLongMap!18928 lt!572862))))

(declare-fun lt!572859 () Unit!42055)

(declare-fun lt!572860 () Unit!42055)

(assert (=> d!139005 (= lt!572859 lt!572860)))

(declare-datatypes ((Option!710 0))(
  ( (Some!709 (v!18957 V!48535)) (None!708) )
))
(declare-fun getValueByKey!659 (List!28269 (_ BitVec 64)) Option!710)

(assert (=> d!139005 (= (getValueByKey!659 lt!572862 (_1!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!709 (_2!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!335 (List!28269 (_ BitVec 64) V!48535) Unit!42055)

(assert (=> d!139005 (= lt!572860 (lemmaContainsTupThenGetReturnValue!335 lt!572862 (_1!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!449 (List!28269 (_ BitVec 64) V!48535) List!28269)

(assert (=> d!139005 (= lt!572862 (insertStrictlySorted!449 (toList!9479 lt!572703) (_1!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!139005 (= (+!4291 lt!572703 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572861)))

(declare-fun b!1263912 () Bool)

(declare-fun res!841659 () Bool)

(assert (=> b!1263912 (=> (not res!841659) (not e!719582))))

(assert (=> b!1263912 (= res!841659 (= (getValueByKey!659 (toList!9479 lt!572861) (_1!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!709 (_2!10534 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1263913 () Bool)

(declare-fun contains!7620 (List!28269 tuple2!21046) Bool)

(assert (=> b!1263913 (= e!719582 (contains!7620 (toList!9479 lt!572861) (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!139005 res!841660) b!1263912))

(assert (= (and b!1263912 res!841659) b!1263913))

(declare-fun m!1164733 () Bool)

(assert (=> d!139005 m!1164733))

(declare-fun m!1164735 () Bool)

(assert (=> d!139005 m!1164735))

(declare-fun m!1164737 () Bool)

(assert (=> d!139005 m!1164737))

(declare-fun m!1164739 () Bool)

(assert (=> d!139005 m!1164739))

(declare-fun m!1164741 () Bool)

(assert (=> b!1263912 m!1164741))

(declare-fun m!1164743 () Bool)

(assert (=> b!1263913 m!1164743))

(assert (=> b!1263677 d!139005))

(declare-fun mapNonEmpty!50389 () Bool)

(declare-fun mapRes!50389 () Bool)

(declare-fun tp!95984 () Bool)

(declare-fun e!719587 () Bool)

(assert (=> mapNonEmpty!50389 (= mapRes!50389 (and tp!95984 e!719587))))

(declare-fun mapValue!50389 () ValueCell!15425)

(declare-fun mapKey!50389 () (_ BitVec 32))

(declare-fun mapRest!50389 () (Array (_ BitVec 32) ValueCell!15425))

(assert (=> mapNonEmpty!50389 (= mapRest!50380 (store mapRest!50389 mapKey!50389 mapValue!50389))))

(declare-fun b!1263920 () Bool)

(assert (=> b!1263920 (= e!719587 tp_is_empty!32377)))

(declare-fun b!1263921 () Bool)

(declare-fun e!719588 () Bool)

(assert (=> b!1263921 (= e!719588 tp_is_empty!32377)))

(declare-fun condMapEmpty!50389 () Bool)

(declare-fun mapDefault!50389 () ValueCell!15425)

(assert (=> mapNonEmpty!50380 (= condMapEmpty!50389 (= mapRest!50380 ((as const (Array (_ BitVec 32) ValueCell!15425)) mapDefault!50389)))))

(assert (=> mapNonEmpty!50380 (= tp!95968 (and e!719588 mapRes!50389))))

(declare-fun mapIsEmpty!50389 () Bool)

(assert (=> mapIsEmpty!50389 mapRes!50389))

(assert (= (and mapNonEmpty!50380 condMapEmpty!50389) mapIsEmpty!50389))

(assert (= (and mapNonEmpty!50380 (not condMapEmpty!50389)) mapNonEmpty!50389))

(assert (= (and mapNonEmpty!50389 ((_ is ValueCellFull!15425) mapValue!50389)) b!1263920))

(assert (= (and mapNonEmpty!50380 ((_ is ValueCellFull!15425) mapDefault!50389)) b!1263921))

(declare-fun m!1164745 () Bool)

(assert (=> mapNonEmpty!50389 m!1164745))

(declare-fun b_lambda!22881 () Bool)

(assert (= b_lambda!22871 (or (and start!106228 b_free!27475) b_lambda!22881)))

(declare-fun b_lambda!22883 () Bool)

(assert (= b_lambda!22869 (or (and start!106228 b_free!27475) b_lambda!22883)))

(declare-fun b_lambda!22885 () Bool)

(assert (= b_lambda!22877 (or (and start!106228 b_free!27475) b_lambda!22885)))

(declare-fun b_lambda!22887 () Bool)

(assert (= b_lambda!22875 (or (and start!106228 b_free!27475) b_lambda!22887)))

(declare-fun b_lambda!22889 () Bool)

(assert (= b_lambda!22879 (or (and start!106228 b_free!27475) b_lambda!22889)))

(declare-fun b_lambda!22891 () Bool)

(assert (= b_lambda!22873 (or (and start!106228 b_free!27475) b_lambda!22891)))

(check-sat (not bm!62168) (not b!1263903) (not bm!62162) (not b_lambda!22889) (not b!1263820) (not b!1263821) (not b_lambda!22887) (not b_next!27475) (not b!1263799) (not b!1263866) (not b_lambda!22881) (not b_lambda!22883) (not b!1263880) (not b!1263887) (not bm!62142) (not b!1263872) tp_is_empty!32377 (not mapNonEmpty!50389) (not b_lambda!22885) (not b!1263785) (not b!1263893) (not bm!62167) (not b!1263803) (not b!1263792) (not bm!62165) (not b!1263868) (not b!1263806) (not b!1263789) (not b!1263886) (not d!139005) (not b!1263879) (not bm!62160) (not b!1263913) (not b_lambda!22891) (not bm!62145) (not b!1263758) (not d!139001) (not bm!62169) (not b!1263907) (not b!1263804) (not b!1263805) (not b!1263894) (not bm!62172) (not b!1263901) (not b!1263800) (not b!1263786) (not b!1263822) (not d!138995) (not b!1263790) (not b!1263787) (not b!1263791) (not d!138997) (not bm!62138) (not b!1263801) (not d!138993) (not b!1263912) (not b!1263756) (not b!1263900) (not d!139003) (not bm!62141) (not bm!62161) (not b!1263788) (not b!1263873) b_and!45443 (not b!1263882) (not b!1263889) (not b!1263802))
(check-sat b_and!45443 (not b_next!27475))
