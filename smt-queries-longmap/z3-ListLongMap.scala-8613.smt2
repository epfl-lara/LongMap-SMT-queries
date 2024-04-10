; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104924 () Bool)

(assert start!104924)

(declare-fun b_free!26715 () Bool)

(declare-fun b_next!26715 () Bool)

(assert (=> start!104924 (= b_free!26715 (not b_next!26715))))

(declare-fun tp!93637 () Bool)

(declare-fun b_and!44491 () Bool)

(assert (=> start!104924 (= tp!93637 b_and!44491)))

(declare-fun b!1250645 () Bool)

(declare-fun res!834206 () Bool)

(declare-fun e!710042 () Bool)

(assert (=> b!1250645 (=> (not res!834206) (not e!710042))))

(declare-datatypes ((array!80900 0))(
  ( (array!80901 (arr!39016 (Array (_ BitVec 32) (_ BitVec 64))) (size!39552 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80900)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80900 (_ BitVec 32)) Bool)

(assert (=> b!1250645 (= res!834206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250646 () Bool)

(declare-fun e!710038 () Bool)

(declare-fun tp_is_empty!31617 () Bool)

(assert (=> b!1250646 (= e!710038 tp_is_empty!31617)))

(declare-fun b!1250647 () Bool)

(declare-fun e!710037 () Bool)

(declare-fun e!710040 () Bool)

(assert (=> b!1250647 (= e!710037 e!710040)))

(declare-fun res!834208 () Bool)

(assert (=> b!1250647 (=> res!834208 e!710040)))

(declare-datatypes ((V!47521 0))(
  ( (V!47522 (val!15871 Int)) )
))
(declare-datatypes ((tuple2!20452 0))(
  ( (tuple2!20453 (_1!10237 (_ BitVec 64)) (_2!10237 V!47521)) )
))
(declare-datatypes ((List!27691 0))(
  ( (Nil!27688) (Cons!27687 (h!28896 tuple2!20452) (t!41164 List!27691)) )
))
(declare-datatypes ((ListLongMap!18325 0))(
  ( (ListLongMap!18326 (toList!9178 List!27691)) )
))
(declare-fun lt!564346 () ListLongMap!18325)

(declare-fun contains!7491 (ListLongMap!18325 (_ BitVec 64)) Bool)

(assert (=> b!1250647 (= res!834208 (contains!7491 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47521)

(declare-fun minValueBefore!43 () V!47521)

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((ValueCell!15045 0))(
  ( (ValueCellFull!15045 (v!18567 V!47521)) (EmptyCell!15045) )
))
(declare-datatypes ((array!80902 0))(
  ( (array!80903 (arr!39017 (Array (_ BitVec 32) ValueCell!15045)) (size!39553 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80902)

(declare-fun getCurrentListMap!4452 (array!80900 array!80902 (_ BitVec 32) (_ BitVec 32) V!47521 V!47521 (_ BitVec 32) Int) ListLongMap!18325)

(assert (=> b!1250647 (= lt!564346 (getCurrentListMap!4452 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49189 () Bool)

(declare-fun mapRes!49189 () Bool)

(declare-fun tp!93638 () Bool)

(declare-fun e!710041 () Bool)

(assert (=> mapNonEmpty!49189 (= mapRes!49189 (and tp!93638 e!710041))))

(declare-fun mapKey!49189 () (_ BitVec 32))

(declare-fun mapValue!49189 () ValueCell!15045)

(declare-fun mapRest!49189 () (Array (_ BitVec 32) ValueCell!15045))

(assert (=> mapNonEmpty!49189 (= (arr!39017 _values!914) (store mapRest!49189 mapKey!49189 mapValue!49189))))

(declare-fun b!1250648 () Bool)

(declare-fun res!834211 () Bool)

(assert (=> b!1250648 (=> (not res!834211) (not e!710042))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250648 (= res!834211 (and (= (size!39553 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39552 _keys!1118) (size!39553 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49189 () Bool)

(assert (=> mapIsEmpty!49189 mapRes!49189))

(declare-fun b!1250649 () Bool)

(assert (=> b!1250649 (= e!710042 (not e!710037))))

(declare-fun res!834209 () Bool)

(assert (=> b!1250649 (=> res!834209 e!710037)))

(assert (=> b!1250649 (= res!834209 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564347 () ListLongMap!18325)

(declare-fun lt!564344 () ListLongMap!18325)

(assert (=> b!1250649 (= lt!564347 lt!564344)))

(declare-fun minValueAfter!43 () V!47521)

(declare-datatypes ((Unit!41545 0))(
  ( (Unit!41546) )
))
(declare-fun lt!564343 () Unit!41545)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!943 (array!80900 array!80902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47521 V!47521 V!47521 V!47521 (_ BitVec 32) Int) Unit!41545)

(assert (=> b!1250649 (= lt!564343 (lemmaNoChangeToArrayThenSameMapNoExtras!943 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5579 (array!80900 array!80902 (_ BitVec 32) (_ BitVec 32) V!47521 V!47521 (_ BitVec 32) Int) ListLongMap!18325)

(assert (=> b!1250649 (= lt!564344 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250649 (= lt!564347 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250650 () Bool)

(declare-fun e!710039 () Bool)

(assert (=> b!1250650 (= e!710039 (and e!710038 mapRes!49189))))

(declare-fun condMapEmpty!49189 () Bool)

(declare-fun mapDefault!49189 () ValueCell!15045)

(assert (=> b!1250650 (= condMapEmpty!49189 (= (arr!39017 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15045)) mapDefault!49189)))))

(declare-fun b!1250651 () Bool)

(assert (=> b!1250651 (= e!710041 tp_is_empty!31617)))

(declare-fun b!1250652 () Bool)

(declare-fun res!834207 () Bool)

(assert (=> b!1250652 (=> (not res!834207) (not e!710042))))

(declare-datatypes ((List!27692 0))(
  ( (Nil!27689) (Cons!27688 (h!28897 (_ BitVec 64)) (t!41165 List!27692)) )
))
(declare-fun arrayNoDuplicates!0 (array!80900 (_ BitVec 32) List!27692) Bool)

(assert (=> b!1250652 (= res!834207 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27689))))

(declare-fun res!834210 () Bool)

(assert (=> start!104924 (=> (not res!834210) (not e!710042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104924 (= res!834210 (validMask!0 mask!1466))))

(assert (=> start!104924 e!710042))

(assert (=> start!104924 true))

(assert (=> start!104924 tp!93637))

(assert (=> start!104924 tp_is_empty!31617))

(declare-fun array_inv!29763 (array!80900) Bool)

(assert (=> start!104924 (array_inv!29763 _keys!1118)))

(declare-fun array_inv!29764 (array!80902) Bool)

(assert (=> start!104924 (and (array_inv!29764 _values!914) e!710039)))

(declare-fun b!1250653 () Bool)

(assert (=> b!1250653 (= e!710040 (bvsle #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun -!2002 (ListLongMap!18325 (_ BitVec 64)) ListLongMap!18325)

(assert (=> b!1250653 (= (-!2002 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564346)))

(declare-fun lt!564345 () Unit!41545)

(declare-fun removeNotPresentStillSame!97 (ListLongMap!18325 (_ BitVec 64)) Unit!41545)

(assert (=> b!1250653 (= lt!564345 (removeNotPresentStillSame!97 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104924 res!834210) b!1250648))

(assert (= (and b!1250648 res!834211) b!1250645))

(assert (= (and b!1250645 res!834206) b!1250652))

(assert (= (and b!1250652 res!834207) b!1250649))

(assert (= (and b!1250649 (not res!834209)) b!1250647))

(assert (= (and b!1250647 (not res!834208)) b!1250653))

(assert (= (and b!1250650 condMapEmpty!49189) mapIsEmpty!49189))

(assert (= (and b!1250650 (not condMapEmpty!49189)) mapNonEmpty!49189))

(get-info :version)

(assert (= (and mapNonEmpty!49189 ((_ is ValueCellFull!15045) mapValue!49189)) b!1250651))

(assert (= (and b!1250650 ((_ is ValueCellFull!15045) mapDefault!49189)) b!1250646))

(assert (= start!104924 b!1250650))

(declare-fun m!1151467 () Bool)

(assert (=> mapNonEmpty!49189 m!1151467))

(declare-fun m!1151469 () Bool)

(assert (=> b!1250647 m!1151469))

(declare-fun m!1151471 () Bool)

(assert (=> b!1250647 m!1151471))

(declare-fun m!1151473 () Bool)

(assert (=> b!1250653 m!1151473))

(declare-fun m!1151475 () Bool)

(assert (=> b!1250653 m!1151475))

(declare-fun m!1151477 () Bool)

(assert (=> b!1250652 m!1151477))

(declare-fun m!1151479 () Bool)

(assert (=> b!1250645 m!1151479))

(declare-fun m!1151481 () Bool)

(assert (=> b!1250649 m!1151481))

(declare-fun m!1151483 () Bool)

(assert (=> b!1250649 m!1151483))

(declare-fun m!1151485 () Bool)

(assert (=> b!1250649 m!1151485))

(declare-fun m!1151487 () Bool)

(assert (=> start!104924 m!1151487))

(declare-fun m!1151489 () Bool)

(assert (=> start!104924 m!1151489))

(declare-fun m!1151491 () Bool)

(assert (=> start!104924 m!1151491))

(check-sat (not start!104924) (not b!1250652) b_and!44491 tp_is_empty!31617 (not b!1250653) (not b!1250647) (not b_next!26715) (not b!1250649) (not b!1250645) (not mapNonEmpty!49189))
(check-sat b_and!44491 (not b_next!26715))
(get-model)

(declare-fun d!137901 () Bool)

(declare-fun e!710068 () Bool)

(assert (=> d!137901 e!710068))

(declare-fun res!834232 () Bool)

(assert (=> d!137901 (=> res!834232 e!710068)))

(declare-fun lt!564373 () Bool)

(assert (=> d!137901 (= res!834232 (not lt!564373))))

(declare-fun lt!564371 () Bool)

(assert (=> d!137901 (= lt!564373 lt!564371)))

(declare-fun lt!564372 () Unit!41545)

(declare-fun e!710069 () Unit!41545)

(assert (=> d!137901 (= lt!564372 e!710069)))

(declare-fun c!122149 () Bool)

(assert (=> d!137901 (= c!122149 lt!564371)))

(declare-fun containsKey!618 (List!27691 (_ BitVec 64)) Bool)

(assert (=> d!137901 (= lt!564371 (containsKey!618 (toList!9178 lt!564346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137901 (= (contains!7491 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564373)))

(declare-fun b!1250687 () Bool)

(declare-fun lt!564374 () Unit!41545)

(assert (=> b!1250687 (= e!710069 lt!564374)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!427 (List!27691 (_ BitVec 64)) Unit!41545)

(assert (=> b!1250687 (= lt!564374 (lemmaContainsKeyImpliesGetValueByKeyDefined!427 (toList!9178 lt!564346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!703 0))(
  ( (Some!702 (v!18569 V!47521)) (None!701) )
))
(declare-fun isDefined!466 (Option!703) Bool)

(declare-fun getValueByKey!652 (List!27691 (_ BitVec 64)) Option!703)

(assert (=> b!1250687 (isDefined!466 (getValueByKey!652 (toList!9178 lt!564346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250688 () Bool)

(declare-fun Unit!41549 () Unit!41545)

(assert (=> b!1250688 (= e!710069 Unit!41549)))

(declare-fun b!1250689 () Bool)

(assert (=> b!1250689 (= e!710068 (isDefined!466 (getValueByKey!652 (toList!9178 lt!564346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!137901 c!122149) b!1250687))

(assert (= (and d!137901 (not c!122149)) b!1250688))

(assert (= (and d!137901 (not res!834232)) b!1250689))

(declare-fun m!1151519 () Bool)

(assert (=> d!137901 m!1151519))

(declare-fun m!1151521 () Bool)

(assert (=> b!1250687 m!1151521))

(declare-fun m!1151523 () Bool)

(assert (=> b!1250687 m!1151523))

(assert (=> b!1250687 m!1151523))

(declare-fun m!1151525 () Bool)

(assert (=> b!1250687 m!1151525))

(assert (=> b!1250689 m!1151523))

(assert (=> b!1250689 m!1151523))

(assert (=> b!1250689 m!1151525))

(assert (=> b!1250647 d!137901))

(declare-fun bm!61600 () Bool)

(declare-fun call!61604 () ListLongMap!18325)

(declare-fun call!61603 () ListLongMap!18325)

(assert (=> bm!61600 (= call!61604 call!61603)))

(declare-fun lt!564430 () ListLongMap!18325)

(declare-fun e!710098 () Bool)

(declare-fun b!1250733 () Bool)

(declare-fun apply!981 (ListLongMap!18325 (_ BitVec 64)) V!47521)

(declare-fun get!20004 (ValueCell!15045 V!47521) V!47521)

(declare-fun dynLambda!3379 (Int (_ BitVec 64)) V!47521)

(assert (=> b!1250733 (= e!710098 (= (apply!981 lt!564430 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)) (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1250733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39553 _values!914)))))

(assert (=> b!1250733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun bm!61601 () Bool)

(declare-fun call!61609 () Bool)

(assert (=> bm!61601 (= call!61609 (contains!7491 lt!564430 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250734 () Bool)

(declare-fun e!710103 () ListLongMap!18325)

(declare-fun e!710105 () ListLongMap!18325)

(assert (=> b!1250734 (= e!710103 e!710105)))

(declare-fun c!122162 () Bool)

(assert (=> b!1250734 (= c!122162 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250735 () Bool)

(declare-fun e!710107 () Bool)

(declare-fun call!61605 () Bool)

(assert (=> b!1250735 (= e!710107 (not call!61605))))

(declare-fun b!1250736 () Bool)

(declare-fun e!710101 () Unit!41545)

(declare-fun Unit!41550 () Unit!41545)

(assert (=> b!1250736 (= e!710101 Unit!41550)))

(declare-fun bm!61602 () Bool)

(assert (=> bm!61602 (= call!61605 (contains!7491 lt!564430 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250737 () Bool)

(declare-fun c!122166 () Bool)

(assert (=> b!1250737 (= c!122166 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!710097 () ListLongMap!18325)

(assert (=> b!1250737 (= e!710105 e!710097)))

(declare-fun b!1250738 () Bool)

(declare-fun e!710108 () Bool)

(assert (=> b!1250738 (= e!710107 e!710108)))

(declare-fun res!834254 () Bool)

(assert (=> b!1250738 (= res!834254 call!61605)))

(assert (=> b!1250738 (=> (not res!834254) (not e!710108))))

(declare-fun d!137903 () Bool)

(declare-fun e!710104 () Bool)

(assert (=> d!137903 e!710104))

(declare-fun res!834257 () Bool)

(assert (=> d!137903 (=> (not res!834257) (not e!710104))))

(assert (=> d!137903 (= res!834257 (or (bvsge #b00000000000000000000000000000000 (size!39552 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))))

(declare-fun lt!564431 () ListLongMap!18325)

(assert (=> d!137903 (= lt!564430 lt!564431)))

(declare-fun lt!564427 () Unit!41545)

(assert (=> d!137903 (= lt!564427 e!710101)))

(declare-fun c!122163 () Bool)

(declare-fun e!710102 () Bool)

(assert (=> d!137903 (= c!122163 e!710102)))

(declare-fun res!834252 () Bool)

(assert (=> d!137903 (=> (not res!834252) (not e!710102))))

(assert (=> d!137903 (= res!834252 (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> d!137903 (= lt!564431 e!710103)))

(declare-fun c!122167 () Bool)

(assert (=> d!137903 (= c!122167 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137903 (validMask!0 mask!1466)))

(assert (=> d!137903 (= (getCurrentListMap!4452 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564430)))

(declare-fun b!1250732 () Bool)

(declare-fun res!834256 () Bool)

(assert (=> b!1250732 (=> (not res!834256) (not e!710104))))

(assert (=> b!1250732 (= res!834256 e!710107)))

(declare-fun c!122164 () Bool)

(assert (=> b!1250732 (= c!122164 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1250739 () Bool)

(declare-fun e!710099 () Bool)

(assert (=> b!1250739 (= e!710099 (= (apply!981 lt!564430 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1250740 () Bool)

(declare-fun e!710100 () Bool)

(assert (=> b!1250740 (= e!710100 e!710099)))

(declare-fun res!834258 () Bool)

(assert (=> b!1250740 (= res!834258 call!61609)))

(assert (=> b!1250740 (=> (not res!834258) (not e!710099))))

(declare-fun bm!61603 () Bool)

(declare-fun call!61607 () ListLongMap!18325)

(assert (=> bm!61603 (= call!61607 call!61604)))

(declare-fun bm!61604 () Bool)

(assert (=> bm!61604 (= call!61603 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250741 () Bool)

(assert (=> b!1250741 (= e!710104 e!710100)))

(declare-fun c!122165 () Bool)

(assert (=> b!1250741 (= c!122165 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61605 () Bool)

(declare-fun call!61608 () ListLongMap!18325)

(declare-fun +!4137 (ListLongMap!18325 tuple2!20452) ListLongMap!18325)

(assert (=> bm!61605 (= call!61608 (+!4137 (ite c!122167 call!61603 (ite c!122162 call!61604 call!61607)) (ite (or c!122167 c!122162) (tuple2!20453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20453 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1250742 () Bool)

(assert (=> b!1250742 (= e!710100 (not call!61609))))

(declare-fun bm!61606 () Bool)

(declare-fun call!61606 () ListLongMap!18325)

(assert (=> bm!61606 (= call!61606 call!61608)))

(declare-fun b!1250743 () Bool)

(assert (=> b!1250743 (= e!710105 call!61606)))

(declare-fun b!1250744 () Bool)

(declare-fun res!834251 () Bool)

(assert (=> b!1250744 (=> (not res!834251) (not e!710104))))

(declare-fun e!710096 () Bool)

(assert (=> b!1250744 (= res!834251 e!710096)))

(declare-fun res!834255 () Bool)

(assert (=> b!1250744 (=> res!834255 e!710096)))

(declare-fun e!710106 () Bool)

(assert (=> b!1250744 (= res!834255 (not e!710106))))

(declare-fun res!834253 () Bool)

(assert (=> b!1250744 (=> (not res!834253) (not e!710106))))

(assert (=> b!1250744 (= res!834253 (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun b!1250745 () Bool)

(assert (=> b!1250745 (= e!710097 call!61607)))

(declare-fun b!1250746 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1250746 (= e!710102 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250747 () Bool)

(assert (=> b!1250747 (= e!710108 (= (apply!981 lt!564430 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1250748 () Bool)

(assert (=> b!1250748 (= e!710097 call!61606)))

(declare-fun b!1250749 () Bool)

(assert (=> b!1250749 (= e!710106 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250750 () Bool)

(declare-fun lt!564433 () Unit!41545)

(assert (=> b!1250750 (= e!710101 lt!564433)))

(declare-fun lt!564428 () ListLongMap!18325)

(assert (=> b!1250750 (= lt!564428 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564435 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564426 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564426 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564438 () Unit!41545)

(declare-fun addStillContains!1075 (ListLongMap!18325 (_ BitVec 64) V!47521 (_ BitVec 64)) Unit!41545)

(assert (=> b!1250750 (= lt!564438 (addStillContains!1075 lt!564428 lt!564435 zeroValue!871 lt!564426))))

(assert (=> b!1250750 (contains!7491 (+!4137 lt!564428 (tuple2!20453 lt!564435 zeroValue!871)) lt!564426)))

(declare-fun lt!564437 () Unit!41545)

(assert (=> b!1250750 (= lt!564437 lt!564438)))

(declare-fun lt!564436 () ListLongMap!18325)

(assert (=> b!1250750 (= lt!564436 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564440 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564440 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564421 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564421 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564434 () Unit!41545)

(declare-fun addApplyDifferent!529 (ListLongMap!18325 (_ BitVec 64) V!47521 (_ BitVec 64)) Unit!41545)

(assert (=> b!1250750 (= lt!564434 (addApplyDifferent!529 lt!564436 lt!564440 minValueBefore!43 lt!564421))))

(assert (=> b!1250750 (= (apply!981 (+!4137 lt!564436 (tuple2!20453 lt!564440 minValueBefore!43)) lt!564421) (apply!981 lt!564436 lt!564421))))

(declare-fun lt!564423 () Unit!41545)

(assert (=> b!1250750 (= lt!564423 lt!564434)))

(declare-fun lt!564429 () ListLongMap!18325)

(assert (=> b!1250750 (= lt!564429 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564422 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564432 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564432 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564419 () Unit!41545)

(assert (=> b!1250750 (= lt!564419 (addApplyDifferent!529 lt!564429 lt!564422 zeroValue!871 lt!564432))))

(assert (=> b!1250750 (= (apply!981 (+!4137 lt!564429 (tuple2!20453 lt!564422 zeroValue!871)) lt!564432) (apply!981 lt!564429 lt!564432))))

(declare-fun lt!564425 () Unit!41545)

(assert (=> b!1250750 (= lt!564425 lt!564419)))

(declare-fun lt!564424 () ListLongMap!18325)

(assert (=> b!1250750 (= lt!564424 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564420 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564420 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564439 () (_ BitVec 64))

(assert (=> b!1250750 (= lt!564439 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1250750 (= lt!564433 (addApplyDifferent!529 lt!564424 lt!564420 minValueBefore!43 lt!564439))))

(assert (=> b!1250750 (= (apply!981 (+!4137 lt!564424 (tuple2!20453 lt!564420 minValueBefore!43)) lt!564439) (apply!981 lt!564424 lt!564439))))

(declare-fun b!1250751 () Bool)

(assert (=> b!1250751 (= e!710096 e!710098)))

(declare-fun res!834259 () Bool)

(assert (=> b!1250751 (=> (not res!834259) (not e!710098))))

(assert (=> b!1250751 (= res!834259 (contains!7491 lt!564430 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun b!1250752 () Bool)

(assert (=> b!1250752 (= e!710103 (+!4137 call!61608 (tuple2!20453 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!137903 c!122167) b!1250752))

(assert (= (and d!137903 (not c!122167)) b!1250734))

(assert (= (and b!1250734 c!122162) b!1250743))

(assert (= (and b!1250734 (not c!122162)) b!1250737))

(assert (= (and b!1250737 c!122166) b!1250748))

(assert (= (and b!1250737 (not c!122166)) b!1250745))

(assert (= (or b!1250748 b!1250745) bm!61603))

(assert (= (or b!1250743 bm!61603) bm!61600))

(assert (= (or b!1250743 b!1250748) bm!61606))

(assert (= (or b!1250752 bm!61600) bm!61604))

(assert (= (or b!1250752 bm!61606) bm!61605))

(assert (= (and d!137903 res!834252) b!1250746))

(assert (= (and d!137903 c!122163) b!1250750))

(assert (= (and d!137903 (not c!122163)) b!1250736))

(assert (= (and d!137903 res!834257) b!1250744))

(assert (= (and b!1250744 res!834253) b!1250749))

(assert (= (and b!1250744 (not res!834255)) b!1250751))

(assert (= (and b!1250751 res!834259) b!1250733))

(assert (= (and b!1250744 res!834251) b!1250732))

(assert (= (and b!1250732 c!122164) b!1250738))

(assert (= (and b!1250732 (not c!122164)) b!1250735))

(assert (= (and b!1250738 res!834254) b!1250747))

(assert (= (or b!1250738 b!1250735) bm!61602))

(assert (= (and b!1250732 res!834256) b!1250741))

(assert (= (and b!1250741 c!122165) b!1250740))

(assert (= (and b!1250741 (not c!122165)) b!1250742))

(assert (= (and b!1250740 res!834258) b!1250739))

(assert (= (or b!1250740 b!1250742) bm!61601))

(declare-fun b_lambda!22527 () Bool)

(assert (=> (not b_lambda!22527) (not b!1250733)))

(declare-fun t!41169 () Bool)

(declare-fun tb!11289 () Bool)

(assert (=> (and start!104924 (= defaultEntry!922 defaultEntry!922) t!41169) tb!11289))

(declare-fun result!23275 () Bool)

(assert (=> tb!11289 (= result!23275 tp_is_empty!31617)))

(assert (=> b!1250733 t!41169))

(declare-fun b_and!44495 () Bool)

(assert (= b_and!44491 (and (=> t!41169 result!23275) b_and!44495)))

(declare-fun m!1151527 () Bool)

(assert (=> bm!61605 m!1151527))

(declare-fun m!1151529 () Bool)

(assert (=> b!1250747 m!1151529))

(assert (=> bm!61604 m!1151485))

(declare-fun m!1151531 () Bool)

(assert (=> bm!61602 m!1151531))

(declare-fun m!1151533 () Bool)

(assert (=> b!1250739 m!1151533))

(declare-fun m!1151535 () Bool)

(assert (=> b!1250750 m!1151535))

(declare-fun m!1151537 () Bool)

(assert (=> b!1250750 m!1151537))

(declare-fun m!1151539 () Bool)

(assert (=> b!1250750 m!1151539))

(declare-fun m!1151541 () Bool)

(assert (=> b!1250750 m!1151541))

(assert (=> b!1250750 m!1151535))

(declare-fun m!1151543 () Bool)

(assert (=> b!1250750 m!1151543))

(declare-fun m!1151545 () Bool)

(assert (=> b!1250750 m!1151545))

(declare-fun m!1151547 () Bool)

(assert (=> b!1250750 m!1151547))

(declare-fun m!1151549 () Bool)

(assert (=> b!1250750 m!1151549))

(declare-fun m!1151551 () Bool)

(assert (=> b!1250750 m!1151551))

(declare-fun m!1151553 () Bool)

(assert (=> b!1250750 m!1151553))

(declare-fun m!1151555 () Bool)

(assert (=> b!1250750 m!1151555))

(assert (=> b!1250750 m!1151549))

(declare-fun m!1151557 () Bool)

(assert (=> b!1250750 m!1151557))

(assert (=> b!1250750 m!1151485))

(declare-fun m!1151559 () Bool)

(assert (=> b!1250750 m!1151559))

(assert (=> b!1250750 m!1151555))

(declare-fun m!1151561 () Bool)

(assert (=> b!1250750 m!1151561))

(declare-fun m!1151563 () Bool)

(assert (=> b!1250750 m!1151563))

(assert (=> b!1250750 m!1151547))

(declare-fun m!1151565 () Bool)

(assert (=> b!1250750 m!1151565))

(declare-fun m!1151567 () Bool)

(assert (=> b!1250752 m!1151567))

(assert (=> b!1250749 m!1151541))

(assert (=> b!1250749 m!1151541))

(declare-fun m!1151569 () Bool)

(assert (=> b!1250749 m!1151569))

(assert (=> d!137903 m!1151487))

(declare-fun m!1151571 () Bool)

(assert (=> bm!61601 m!1151571))

(declare-fun m!1151573 () Bool)

(assert (=> b!1250733 m!1151573))

(declare-fun m!1151575 () Bool)

(assert (=> b!1250733 m!1151575))

(declare-fun m!1151577 () Bool)

(assert (=> b!1250733 m!1151577))

(assert (=> b!1250733 m!1151575))

(assert (=> b!1250733 m!1151541))

(assert (=> b!1250733 m!1151573))

(assert (=> b!1250733 m!1151541))

(declare-fun m!1151579 () Bool)

(assert (=> b!1250733 m!1151579))

(assert (=> b!1250751 m!1151541))

(assert (=> b!1250751 m!1151541))

(declare-fun m!1151581 () Bool)

(assert (=> b!1250751 m!1151581))

(assert (=> b!1250746 m!1151541))

(assert (=> b!1250746 m!1151541))

(assert (=> b!1250746 m!1151569))

(assert (=> b!1250647 d!137903))

(declare-fun d!137905 () Bool)

(assert (=> d!137905 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104924 d!137905))

(declare-fun d!137907 () Bool)

(assert (=> d!137907 (= (array_inv!29763 _keys!1118) (bvsge (size!39552 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104924 d!137907))

(declare-fun d!137909 () Bool)

(assert (=> d!137909 (= (array_inv!29764 _values!914) (bvsge (size!39553 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104924 d!137909))

(declare-fun d!137911 () Bool)

(declare-fun res!834267 () Bool)

(declare-fun e!710119 () Bool)

(assert (=> d!137911 (=> res!834267 e!710119)))

(assert (=> d!137911 (= res!834267 (bvsge #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> d!137911 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27689) e!710119)))

(declare-fun b!1250765 () Bool)

(declare-fun e!710117 () Bool)

(declare-fun call!61612 () Bool)

(assert (=> b!1250765 (= e!710117 call!61612)))

(declare-fun bm!61609 () Bool)

(declare-fun c!122170 () Bool)

(assert (=> bm!61609 (= call!61612 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122170 (Cons!27688 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000) Nil!27689) Nil!27689)))))

(declare-fun b!1250766 () Bool)

(declare-fun e!710120 () Bool)

(assert (=> b!1250766 (= e!710120 e!710117)))

(assert (=> b!1250766 (= c!122170 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250767 () Bool)

(declare-fun e!710118 () Bool)

(declare-fun contains!7493 (List!27692 (_ BitVec 64)) Bool)

(assert (=> b!1250767 (= e!710118 (contains!7493 Nil!27689 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250768 () Bool)

(assert (=> b!1250768 (= e!710119 e!710120)))

(declare-fun res!834266 () Bool)

(assert (=> b!1250768 (=> (not res!834266) (not e!710120))))

(assert (=> b!1250768 (= res!834266 (not e!710118))))

(declare-fun res!834268 () Bool)

(assert (=> b!1250768 (=> (not res!834268) (not e!710118))))

(assert (=> b!1250768 (= res!834268 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250769 () Bool)

(assert (=> b!1250769 (= e!710117 call!61612)))

(assert (= (and d!137911 (not res!834267)) b!1250768))

(assert (= (and b!1250768 res!834268) b!1250767))

(assert (= (and b!1250768 res!834266) b!1250766))

(assert (= (and b!1250766 c!122170) b!1250765))

(assert (= (and b!1250766 (not c!122170)) b!1250769))

(assert (= (or b!1250765 b!1250769) bm!61609))

(assert (=> bm!61609 m!1151541))

(declare-fun m!1151583 () Bool)

(assert (=> bm!61609 m!1151583))

(assert (=> b!1250766 m!1151541))

(assert (=> b!1250766 m!1151541))

(assert (=> b!1250766 m!1151569))

(assert (=> b!1250767 m!1151541))

(assert (=> b!1250767 m!1151541))

(declare-fun m!1151585 () Bool)

(assert (=> b!1250767 m!1151585))

(assert (=> b!1250768 m!1151541))

(assert (=> b!1250768 m!1151541))

(assert (=> b!1250768 m!1151569))

(assert (=> b!1250652 d!137911))

(declare-fun d!137913 () Bool)

(declare-fun lt!564443 () ListLongMap!18325)

(assert (=> d!137913 (not (contains!7491 lt!564443 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!136 (List!27691 (_ BitVec 64)) List!27691)

(assert (=> d!137913 (= lt!564443 (ListLongMap!18326 (removeStrictlySorted!136 (toList!9178 lt!564346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137913 (= (-!2002 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564443)))

(declare-fun bs!35307 () Bool)

(assert (= bs!35307 d!137913))

(declare-fun m!1151587 () Bool)

(assert (=> bs!35307 m!1151587))

(declare-fun m!1151589 () Bool)

(assert (=> bs!35307 m!1151589))

(assert (=> b!1250653 d!137913))

(declare-fun d!137915 () Bool)

(assert (=> d!137915 (= (-!2002 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564346)))

(declare-fun lt!564446 () Unit!41545)

(declare-fun choose!1847 (ListLongMap!18325 (_ BitVec 64)) Unit!41545)

(assert (=> d!137915 (= lt!564446 (choose!1847 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137915 (not (contains!7491 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137915 (= (removeNotPresentStillSame!97 lt!564346 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564446)))

(declare-fun bs!35308 () Bool)

(assert (= bs!35308 d!137915))

(assert (=> bs!35308 m!1151473))

(declare-fun m!1151591 () Bool)

(assert (=> bs!35308 m!1151591))

(assert (=> bs!35308 m!1151469))

(assert (=> b!1250653 d!137915))

(declare-fun bm!61612 () Bool)

(declare-fun call!61615 () Bool)

(assert (=> bm!61612 (= call!61615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1250778 () Bool)

(declare-fun e!710128 () Bool)

(assert (=> b!1250778 (= e!710128 call!61615)))

(declare-fun d!137917 () Bool)

(declare-fun res!834273 () Bool)

(declare-fun e!710127 () Bool)

(assert (=> d!137917 (=> res!834273 e!710127)))

(assert (=> d!137917 (= res!834273 (bvsge #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> d!137917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!710127)))

(declare-fun b!1250779 () Bool)

(assert (=> b!1250779 (= e!710127 e!710128)))

(declare-fun c!122173 () Bool)

(assert (=> b!1250779 (= c!122173 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250780 () Bool)

(declare-fun e!710129 () Bool)

(assert (=> b!1250780 (= e!710129 call!61615)))

(declare-fun b!1250781 () Bool)

(assert (=> b!1250781 (= e!710128 e!710129)))

(declare-fun lt!564453 () (_ BitVec 64))

(assert (=> b!1250781 (= lt!564453 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564454 () Unit!41545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80900 (_ BitVec 64) (_ BitVec 32)) Unit!41545)

(assert (=> b!1250781 (= lt!564454 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!564453 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1250781 (arrayContainsKey!0 _keys!1118 lt!564453 #b00000000000000000000000000000000)))

(declare-fun lt!564455 () Unit!41545)

(assert (=> b!1250781 (= lt!564455 lt!564454)))

(declare-fun res!834274 () Bool)

(declare-datatypes ((SeekEntryResult!9959 0))(
  ( (MissingZero!9959 (index!42207 (_ BitVec 32))) (Found!9959 (index!42208 (_ BitVec 32))) (Intermediate!9959 (undefined!10771 Bool) (index!42209 (_ BitVec 32)) (x!110029 (_ BitVec 32))) (Undefined!9959) (MissingVacant!9959 (index!42210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80900 (_ BitVec 32)) SeekEntryResult!9959)

(assert (=> b!1250781 (= res!834274 (= (seekEntryOrOpen!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9959 #b00000000000000000000000000000000)))))

(assert (=> b!1250781 (=> (not res!834274) (not e!710129))))

(assert (= (and d!137917 (not res!834273)) b!1250779))

(assert (= (and b!1250779 c!122173) b!1250781))

(assert (= (and b!1250779 (not c!122173)) b!1250778))

(assert (= (and b!1250781 res!834274) b!1250780))

(assert (= (or b!1250780 b!1250778) bm!61612))

(declare-fun m!1151593 () Bool)

(assert (=> bm!61612 m!1151593))

(assert (=> b!1250779 m!1151541))

(assert (=> b!1250779 m!1151541))

(assert (=> b!1250779 m!1151569))

(assert (=> b!1250781 m!1151541))

(declare-fun m!1151595 () Bool)

(assert (=> b!1250781 m!1151595))

(declare-fun m!1151597 () Bool)

(assert (=> b!1250781 m!1151597))

(assert (=> b!1250781 m!1151541))

(declare-fun m!1151599 () Bool)

(assert (=> b!1250781 m!1151599))

(assert (=> b!1250645 d!137917))

(declare-fun d!137919 () Bool)

(assert (=> d!137919 (= (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564458 () Unit!41545)

(declare-fun choose!1848 (array!80900 array!80902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47521 V!47521 V!47521 V!47521 (_ BitVec 32) Int) Unit!41545)

(assert (=> d!137919 (= lt!564458 (choose!1848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137919 (validMask!0 mask!1466)))

(assert (=> d!137919 (= (lemmaNoChangeToArrayThenSameMapNoExtras!943 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564458)))

(declare-fun bs!35309 () Bool)

(assert (= bs!35309 d!137919))

(assert (=> bs!35309 m!1151485))

(assert (=> bs!35309 m!1151483))

(declare-fun m!1151601 () Bool)

(assert (=> bs!35309 m!1151601))

(assert (=> bs!35309 m!1151487))

(assert (=> b!1250649 d!137919))

(declare-fun call!61618 () ListLongMap!18325)

(declare-fun bm!61615 () Bool)

(assert (=> bm!61615 (= call!61618 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1250806 () Bool)

(declare-fun e!710150 () Bool)

(assert (=> b!1250806 (= e!710150 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250806 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1250807 () Bool)

(declare-fun e!710147 () Bool)

(declare-fun e!710144 () Bool)

(assert (=> b!1250807 (= e!710147 e!710144)))

(assert (=> b!1250807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun res!834283 () Bool)

(declare-fun lt!564473 () ListLongMap!18325)

(assert (=> b!1250807 (= res!834283 (contains!7491 lt!564473 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250807 (=> (not res!834283) (not e!710144))))

(declare-fun b!1250809 () Bool)

(declare-fun e!710145 () Bool)

(assert (=> b!1250809 (= e!710147 e!710145)))

(declare-fun c!122185 () Bool)

(assert (=> b!1250809 (= c!122185 (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun b!1250810 () Bool)

(declare-fun e!710149 () ListLongMap!18325)

(assert (=> b!1250810 (= e!710149 (ListLongMap!18326 Nil!27688))))

(declare-fun b!1250811 () Bool)

(declare-fun e!710146 () ListLongMap!18325)

(assert (=> b!1250811 (= e!710146 call!61618)))

(declare-fun b!1250812 () Bool)

(assert (=> b!1250812 (= e!710149 e!710146)))

(declare-fun c!122184 () Bool)

(assert (=> b!1250812 (= c!122184 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250813 () Bool)

(declare-fun e!710148 () Bool)

(assert (=> b!1250813 (= e!710148 e!710147)))

(declare-fun c!122183 () Bool)

(assert (=> b!1250813 (= c!122183 e!710150)))

(declare-fun res!834284 () Bool)

(assert (=> b!1250813 (=> (not res!834284) (not e!710150))))

(assert (=> b!1250813 (= res!834284 (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun b!1250814 () Bool)

(declare-fun lt!564476 () Unit!41545)

(declare-fun lt!564478 () Unit!41545)

(assert (=> b!1250814 (= lt!564476 lt!564478)))

(declare-fun lt!564477 () (_ BitVec 64))

(declare-fun lt!564475 () ListLongMap!18325)

(declare-fun lt!564479 () V!47521)

(declare-fun lt!564474 () (_ BitVec 64))

(assert (=> b!1250814 (not (contains!7491 (+!4137 lt!564475 (tuple2!20453 lt!564474 lt!564479)) lt!564477))))

(declare-fun addStillNotContains!309 (ListLongMap!18325 (_ BitVec 64) V!47521 (_ BitVec 64)) Unit!41545)

(assert (=> b!1250814 (= lt!564478 (addStillNotContains!309 lt!564475 lt!564474 lt!564479 lt!564477))))

(assert (=> b!1250814 (= lt!564477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1250814 (= lt!564479 (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1250814 (= lt!564474 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1250814 (= lt!564475 call!61618)))

(assert (=> b!1250814 (= e!710146 (+!4137 call!61618 (tuple2!20453 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000) (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1250815 () Bool)

(declare-fun isEmpty!1023 (ListLongMap!18325) Bool)

(assert (=> b!1250815 (= e!710145 (isEmpty!1023 lt!564473))))

(declare-fun b!1250808 () Bool)

(assert (=> b!1250808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> b!1250808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39553 _values!914)))))

(assert (=> b!1250808 (= e!710144 (= (apply!981 lt!564473 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)) (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!137921 () Bool)

(assert (=> d!137921 e!710148))

(declare-fun res!834285 () Bool)

(assert (=> d!137921 (=> (not res!834285) (not e!710148))))

(assert (=> d!137921 (= res!834285 (not (contains!7491 lt!564473 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137921 (= lt!564473 e!710149)))

(declare-fun c!122182 () Bool)

(assert (=> d!137921 (= c!122182 (bvsge #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> d!137921 (validMask!0 mask!1466)))

(assert (=> d!137921 (= (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564473)))

(declare-fun b!1250816 () Bool)

(assert (=> b!1250816 (= e!710145 (= lt!564473 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1250817 () Bool)

(declare-fun res!834286 () Bool)

(assert (=> b!1250817 (=> (not res!834286) (not e!710148))))

(assert (=> b!1250817 (= res!834286 (not (contains!7491 lt!564473 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!137921 c!122182) b!1250810))

(assert (= (and d!137921 (not c!122182)) b!1250812))

(assert (= (and b!1250812 c!122184) b!1250814))

(assert (= (and b!1250812 (not c!122184)) b!1250811))

(assert (= (or b!1250814 b!1250811) bm!61615))

(assert (= (and d!137921 res!834285) b!1250817))

(assert (= (and b!1250817 res!834286) b!1250813))

(assert (= (and b!1250813 res!834284) b!1250806))

(assert (= (and b!1250813 c!122183) b!1250807))

(assert (= (and b!1250813 (not c!122183)) b!1250809))

(assert (= (and b!1250807 res!834283) b!1250808))

(assert (= (and b!1250809 c!122185) b!1250816))

(assert (= (and b!1250809 (not c!122185)) b!1250815))

(declare-fun b_lambda!22529 () Bool)

(assert (=> (not b_lambda!22529) (not b!1250814)))

(assert (=> b!1250814 t!41169))

(declare-fun b_and!44497 () Bool)

(assert (= b_and!44495 (and (=> t!41169 result!23275) b_and!44497)))

(declare-fun b_lambda!22531 () Bool)

(assert (=> (not b_lambda!22531) (not b!1250808)))

(assert (=> b!1250808 t!41169))

(declare-fun b_and!44499 () Bool)

(assert (= b_and!44497 (and (=> t!41169 result!23275) b_and!44499)))

(declare-fun m!1151603 () Bool)

(assert (=> b!1250816 m!1151603))

(assert (=> b!1250808 m!1151573))

(assert (=> b!1250808 m!1151541))

(declare-fun m!1151605 () Bool)

(assert (=> b!1250808 m!1151605))

(assert (=> b!1250808 m!1151573))

(assert (=> b!1250808 m!1151575))

(assert (=> b!1250808 m!1151577))

(assert (=> b!1250808 m!1151575))

(assert (=> b!1250808 m!1151541))

(declare-fun m!1151607 () Bool)

(assert (=> d!137921 m!1151607))

(assert (=> d!137921 m!1151487))

(assert (=> b!1250812 m!1151541))

(assert (=> b!1250812 m!1151541))

(assert (=> b!1250812 m!1151569))

(assert (=> bm!61615 m!1151603))

(declare-fun m!1151609 () Bool)

(assert (=> b!1250817 m!1151609))

(assert (=> b!1250807 m!1151541))

(assert (=> b!1250807 m!1151541))

(declare-fun m!1151611 () Bool)

(assert (=> b!1250807 m!1151611))

(declare-fun m!1151613 () Bool)

(assert (=> b!1250815 m!1151613))

(declare-fun m!1151615 () Bool)

(assert (=> b!1250814 m!1151615))

(assert (=> b!1250814 m!1151573))

(declare-fun m!1151617 () Bool)

(assert (=> b!1250814 m!1151617))

(assert (=> b!1250814 m!1151573))

(assert (=> b!1250814 m!1151575))

(assert (=> b!1250814 m!1151577))

(assert (=> b!1250814 m!1151575))

(declare-fun m!1151619 () Bool)

(assert (=> b!1250814 m!1151619))

(declare-fun m!1151621 () Bool)

(assert (=> b!1250814 m!1151621))

(assert (=> b!1250814 m!1151541))

(assert (=> b!1250814 m!1151619))

(assert (=> b!1250806 m!1151541))

(assert (=> b!1250806 m!1151541))

(assert (=> b!1250806 m!1151569))

(assert (=> b!1250649 d!137921))

(declare-fun bm!61616 () Bool)

(declare-fun call!61619 () ListLongMap!18325)

(assert (=> bm!61616 (= call!61619 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1250818 () Bool)

(declare-fun e!710157 () Bool)

(assert (=> b!1250818 (= e!710157 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250818 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1250819 () Bool)

(declare-fun e!710154 () Bool)

(declare-fun e!710151 () Bool)

(assert (=> b!1250819 (= e!710154 e!710151)))

(assert (=> b!1250819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun res!834287 () Bool)

(declare-fun lt!564480 () ListLongMap!18325)

(assert (=> b!1250819 (= res!834287 (contains!7491 lt!564480 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250819 (=> (not res!834287) (not e!710151))))

(declare-fun b!1250821 () Bool)

(declare-fun e!710152 () Bool)

(assert (=> b!1250821 (= e!710154 e!710152)))

(declare-fun c!122189 () Bool)

(assert (=> b!1250821 (= c!122189 (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun b!1250822 () Bool)

(declare-fun e!710156 () ListLongMap!18325)

(assert (=> b!1250822 (= e!710156 (ListLongMap!18326 Nil!27688))))

(declare-fun b!1250823 () Bool)

(declare-fun e!710153 () ListLongMap!18325)

(assert (=> b!1250823 (= e!710153 call!61619)))

(declare-fun b!1250824 () Bool)

(assert (=> b!1250824 (= e!710156 e!710153)))

(declare-fun c!122188 () Bool)

(assert (=> b!1250824 (= c!122188 (validKeyInArray!0 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250825 () Bool)

(declare-fun e!710155 () Bool)

(assert (=> b!1250825 (= e!710155 e!710154)))

(declare-fun c!122187 () Bool)

(assert (=> b!1250825 (= c!122187 e!710157)))

(declare-fun res!834288 () Bool)

(assert (=> b!1250825 (=> (not res!834288) (not e!710157))))

(assert (=> b!1250825 (= res!834288 (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(declare-fun b!1250826 () Bool)

(declare-fun lt!564483 () Unit!41545)

(declare-fun lt!564485 () Unit!41545)

(assert (=> b!1250826 (= lt!564483 lt!564485)))

(declare-fun lt!564484 () (_ BitVec 64))

(declare-fun lt!564486 () V!47521)

(declare-fun lt!564482 () ListLongMap!18325)

(declare-fun lt!564481 () (_ BitVec 64))

(assert (=> b!1250826 (not (contains!7491 (+!4137 lt!564482 (tuple2!20453 lt!564481 lt!564486)) lt!564484))))

(assert (=> b!1250826 (= lt!564485 (addStillNotContains!309 lt!564482 lt!564481 lt!564486 lt!564484))))

(assert (=> b!1250826 (= lt!564484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1250826 (= lt!564486 (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1250826 (= lt!564481 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1250826 (= lt!564482 call!61619)))

(assert (=> b!1250826 (= e!710153 (+!4137 call!61619 (tuple2!20453 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000) (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1250827 () Bool)

(assert (=> b!1250827 (= e!710152 (isEmpty!1023 lt!564480))))

(declare-fun b!1250820 () Bool)

(assert (=> b!1250820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> b!1250820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39553 _values!914)))))

(assert (=> b!1250820 (= e!710151 (= (apply!981 lt!564480 (select (arr!39016 _keys!1118) #b00000000000000000000000000000000)) (get!20004 (select (arr!39017 _values!914) #b00000000000000000000000000000000) (dynLambda!3379 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!137923 () Bool)

(assert (=> d!137923 e!710155))

(declare-fun res!834289 () Bool)

(assert (=> d!137923 (=> (not res!834289) (not e!710155))))

(assert (=> d!137923 (= res!834289 (not (contains!7491 lt!564480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137923 (= lt!564480 e!710156)))

(declare-fun c!122186 () Bool)

(assert (=> d!137923 (= c!122186 (bvsge #b00000000000000000000000000000000 (size!39552 _keys!1118)))))

(assert (=> d!137923 (validMask!0 mask!1466)))

(assert (=> d!137923 (= (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564480)))

(declare-fun b!1250828 () Bool)

(assert (=> b!1250828 (= e!710152 (= lt!564480 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1250829 () Bool)

(declare-fun res!834290 () Bool)

(assert (=> b!1250829 (=> (not res!834290) (not e!710155))))

(assert (=> b!1250829 (= res!834290 (not (contains!7491 lt!564480 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!137923 c!122186) b!1250822))

(assert (= (and d!137923 (not c!122186)) b!1250824))

(assert (= (and b!1250824 c!122188) b!1250826))

(assert (= (and b!1250824 (not c!122188)) b!1250823))

(assert (= (or b!1250826 b!1250823) bm!61616))

(assert (= (and d!137923 res!834289) b!1250829))

(assert (= (and b!1250829 res!834290) b!1250825))

(assert (= (and b!1250825 res!834288) b!1250818))

(assert (= (and b!1250825 c!122187) b!1250819))

(assert (= (and b!1250825 (not c!122187)) b!1250821))

(assert (= (and b!1250819 res!834287) b!1250820))

(assert (= (and b!1250821 c!122189) b!1250828))

(assert (= (and b!1250821 (not c!122189)) b!1250827))

(declare-fun b_lambda!22533 () Bool)

(assert (=> (not b_lambda!22533) (not b!1250826)))

(assert (=> b!1250826 t!41169))

(declare-fun b_and!44501 () Bool)

(assert (= b_and!44499 (and (=> t!41169 result!23275) b_and!44501)))

(declare-fun b_lambda!22535 () Bool)

(assert (=> (not b_lambda!22535) (not b!1250820)))

(assert (=> b!1250820 t!41169))

(declare-fun b_and!44503 () Bool)

(assert (= b_and!44501 (and (=> t!41169 result!23275) b_and!44503)))

(declare-fun m!1151623 () Bool)

(assert (=> b!1250828 m!1151623))

(assert (=> b!1250820 m!1151573))

(assert (=> b!1250820 m!1151541))

(declare-fun m!1151625 () Bool)

(assert (=> b!1250820 m!1151625))

(assert (=> b!1250820 m!1151573))

(assert (=> b!1250820 m!1151575))

(assert (=> b!1250820 m!1151577))

(assert (=> b!1250820 m!1151575))

(assert (=> b!1250820 m!1151541))

(declare-fun m!1151627 () Bool)

(assert (=> d!137923 m!1151627))

(assert (=> d!137923 m!1151487))

(assert (=> b!1250824 m!1151541))

(assert (=> b!1250824 m!1151541))

(assert (=> b!1250824 m!1151569))

(assert (=> bm!61616 m!1151623))

(declare-fun m!1151629 () Bool)

(assert (=> b!1250829 m!1151629))

(assert (=> b!1250819 m!1151541))

(assert (=> b!1250819 m!1151541))

(declare-fun m!1151631 () Bool)

(assert (=> b!1250819 m!1151631))

(declare-fun m!1151633 () Bool)

(assert (=> b!1250827 m!1151633))

(declare-fun m!1151635 () Bool)

(assert (=> b!1250826 m!1151635))

(assert (=> b!1250826 m!1151573))

(declare-fun m!1151637 () Bool)

(assert (=> b!1250826 m!1151637))

(assert (=> b!1250826 m!1151573))

(assert (=> b!1250826 m!1151575))

(assert (=> b!1250826 m!1151577))

(assert (=> b!1250826 m!1151575))

(declare-fun m!1151639 () Bool)

(assert (=> b!1250826 m!1151639))

(declare-fun m!1151641 () Bool)

(assert (=> b!1250826 m!1151641))

(assert (=> b!1250826 m!1151541))

(assert (=> b!1250826 m!1151639))

(assert (=> b!1250818 m!1151541))

(assert (=> b!1250818 m!1151541))

(assert (=> b!1250818 m!1151569))

(assert (=> b!1250649 d!137923))

(declare-fun b!1250837 () Bool)

(declare-fun e!710163 () Bool)

(assert (=> b!1250837 (= e!710163 tp_is_empty!31617)))

(declare-fun b!1250836 () Bool)

(declare-fun e!710162 () Bool)

(assert (=> b!1250836 (= e!710162 tp_is_empty!31617)))

(declare-fun mapNonEmpty!49195 () Bool)

(declare-fun mapRes!49195 () Bool)

(declare-fun tp!93647 () Bool)

(assert (=> mapNonEmpty!49195 (= mapRes!49195 (and tp!93647 e!710162))))

(declare-fun mapValue!49195 () ValueCell!15045)

(declare-fun mapRest!49195 () (Array (_ BitVec 32) ValueCell!15045))

(declare-fun mapKey!49195 () (_ BitVec 32))

(assert (=> mapNonEmpty!49195 (= mapRest!49189 (store mapRest!49195 mapKey!49195 mapValue!49195))))

(declare-fun condMapEmpty!49195 () Bool)

(declare-fun mapDefault!49195 () ValueCell!15045)

(assert (=> mapNonEmpty!49189 (= condMapEmpty!49195 (= mapRest!49189 ((as const (Array (_ BitVec 32) ValueCell!15045)) mapDefault!49195)))))

(assert (=> mapNonEmpty!49189 (= tp!93638 (and e!710163 mapRes!49195))))

(declare-fun mapIsEmpty!49195 () Bool)

(assert (=> mapIsEmpty!49195 mapRes!49195))

(assert (= (and mapNonEmpty!49189 condMapEmpty!49195) mapIsEmpty!49195))

(assert (= (and mapNonEmpty!49189 (not condMapEmpty!49195)) mapNonEmpty!49195))

(assert (= (and mapNonEmpty!49195 ((_ is ValueCellFull!15045) mapValue!49195)) b!1250836))

(assert (= (and mapNonEmpty!49189 ((_ is ValueCellFull!15045) mapDefault!49195)) b!1250837))

(declare-fun m!1151643 () Bool)

(assert (=> mapNonEmpty!49195 m!1151643))

(declare-fun b_lambda!22537 () Bool)

(assert (= b_lambda!22527 (or (and start!104924 b_free!26715) b_lambda!22537)))

(declare-fun b_lambda!22539 () Bool)

(assert (= b_lambda!22533 (or (and start!104924 b_free!26715) b_lambda!22539)))

(declare-fun b_lambda!22541 () Bool)

(assert (= b_lambda!22529 (or (and start!104924 b_free!26715) b_lambda!22541)))

(declare-fun b_lambda!22543 () Bool)

(assert (= b_lambda!22531 (or (and start!104924 b_free!26715) b_lambda!22543)))

(declare-fun b_lambda!22545 () Bool)

(assert (= b_lambda!22535 (or (and start!104924 b_free!26715) b_lambda!22545)))

(check-sat (not b!1250812) (not b!1250739) (not d!137919) (not b!1250828) (not bm!61609) (not b!1250815) (not b!1250808) (not bm!61616) (not b!1250766) (not bm!61605) (not d!137921) (not b!1250751) (not b_next!26715) (not d!137903) (not b!1250768) (not b!1250826) (not b!1250807) (not b_lambda!22539) (not b!1250829) (not bm!61604) (not b!1250806) (not b!1250689) (not b_lambda!22545) (not b!1250749) (not b!1250820) (not b!1250747) (not b!1250824) (not b!1250818) (not b_lambda!22537) (not b!1250687) (not d!137915) (not b!1250752) (not d!137923) b_and!44503 (not mapNonEmpty!49195) (not b!1250819) (not b!1250750) (not bm!61615) (not b!1250746) (not b!1250779) (not d!137913) (not b_lambda!22543) (not bm!61601) (not b!1250827) tp_is_empty!31617 (not bm!61612) (not b!1250816) (not b!1250814) (not b!1250817) (not b!1250767) (not b_lambda!22541) (not d!137901) (not b!1250781) (not bm!61602) (not b!1250733))
(check-sat b_and!44503 (not b_next!26715))
